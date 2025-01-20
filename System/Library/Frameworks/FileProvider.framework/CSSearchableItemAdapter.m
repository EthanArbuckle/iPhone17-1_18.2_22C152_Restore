@interface CSSearchableItemAdapter
@end

@implementation CSSearchableItemAdapter

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned __int8 v9 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v3 = (uint64_t (*)(id, unsigned __int8 *))getMDPropertyCopyUserTagNameSymbolLoc_ptr;
  v18 = getMDPropertyCopyUserTagNameSymbolLoc_ptr;
  if (!getMDPropertyCopyUserTagNameSymbolLoc_ptr)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __getMDPropertyCopyUserTagNameSymbolLoc_block_invoke;
    v13 = &unk_1E5AF1950;
    v14 = &v15;
    v4 = (void *)MetadataUtilitiesLibrary_0();
    v16[3] = (uint64_t)dlsym(v4, "MDPropertyCopyUserTagName");
    getMDPropertyCopyUserTagNameSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    v3 = (uint64_t (*)(id, unsigned __int8 *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v3) {
    __32___CSSearchableItemAdapter_tags__block_invoke_cold_1();
  }
  v5 = (void *)v3(v2, &v9);
  v6 = [FPTag alloc];
  v7 = [(FPTag *)v6 initWithLabel:v5 color:v9];

  return v7;
}

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [FPTag alloc];
  v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v8 = -[FPTag initWithLabel:color:](v6, "initWithLabel:color:", v5, [v7 intValue]);

  return v8;
}

FPTag *__32___CSSearchableItemAdapter_tags__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FPTag alloc] initWithLabel:v2 color:0];

  return v3;
}

void __32___CSSearchableItemAdapter_tags__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef _MDPropertyCopyUserTagName(CFStringRef, uint8_t *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 75, @"%s", dlerror());

  __break(1u);
}

@end