@interface IDSCopyIDForPhoneNumberWithOptionsSymbolLoc
@end

@implementation IDSCopyIDForPhoneNumberWithOptionsSymbolLoc

void *__get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)IDSLibrary();
  result = dlsym(v2, "_IDSCopyIDForPhoneNumberWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_IDSCopyIDForPhoneNumberWithOptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end