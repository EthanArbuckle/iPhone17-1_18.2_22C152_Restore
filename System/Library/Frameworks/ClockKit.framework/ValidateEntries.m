@interface ValidateEntries
@end

@implementation ValidateEntries

void ___ValidateEntries_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = ___ValidateEntries_block_invoke_2;
  v14 = &unk_26440EF90;
  id v7 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  uint64_t v17 = v8;
  uint64_t v18 = a4;
  v10 = (void (**)(void))MEMORY[0x21D4AACC0](&v11);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v11, v12, v13, v14)) {
    v10[2](v10);
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t ___ValidateEntries_block_invoke_2(uint64_t a1)
{
  uint64_t result = _ValidateEntry(*(void **)(a1 + 32), *(void *)(a1 + 48));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    **(unsigned char **)(a1 + 56) = 1;
  }
  return result;
}

@end