@interface IDSCopyIDForEmailAddressSymbolLoc
@end

@implementation IDSCopyIDForEmailAddressSymbolLoc

void *__get_IDSCopyIDForEmailAddressSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)IDSLibrary();
  result = dlsym(v2, "_IDSCopyIDForEmailAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_IDSCopyIDForEmailAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end