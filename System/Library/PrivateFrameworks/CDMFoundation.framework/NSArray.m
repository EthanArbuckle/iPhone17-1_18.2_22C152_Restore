@interface NSArray
@end

@implementation NSArray

void __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2;
  aBlock[3] = &unk_2647A51C0;
  id v6 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = a3;
  id v7 = v5;
  v8 = _Block_copy(aBlock);
  v9 = *(void **)(a1 + 32);
  v10 = _Block_copy(v8);
  [v9 addObject:v10];
}

uint64_t __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = _Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  [v2 addObject:v3];

  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (v4 == result)
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  return result;
}

uint64_t __66__NSArray_TaskLoop__enumerateTaskParallelly_blockCompleteAllTask___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[5] + 16))(a1[5], a1[4], a1[6], a3);
}

void __53__NSArray_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v6, "_cdm_hasKey:withValue:", a1[4], a1[5]);
  }
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

@end