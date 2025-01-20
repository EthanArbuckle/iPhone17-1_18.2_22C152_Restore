void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x270ED9428](predicate, block);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}