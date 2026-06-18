up:
	@uv lock --upgrade

deps:
	@uv sync --all-extras --group linting

format: deps
	@uv run ruff check --fix .

lint: deps
	@uv run ruff check .
	@uv run ty check

test: deps
	@uv run pytest

test-parallel: deps
	@uv run --python 3.10 pytest
	@uv run --python 3.11 pytest
	@uv run --python 3.12 pytest
	@uv run --python 3.13 pytest
	@uv run --python 3.14 pytest

build: clean deps
	@uv build

clean:
	@rm -rf ./dist

# aliases
check: lint
style: format
