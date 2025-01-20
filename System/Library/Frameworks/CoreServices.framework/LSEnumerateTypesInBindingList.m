@interface LSEnumerateTypesInBindingList
@end

@implementation LSEnumerateTypesInBindingList

void ___LSEnumerateTypesInBindingList_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v2 = (id)_CSStringCopyCFString();
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end