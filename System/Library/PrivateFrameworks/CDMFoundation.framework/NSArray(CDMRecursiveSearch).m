@interface NSArray(CDMRecursiveSearch)
- (uint64_t)_cdm_hasKey:()CDMRecursiveSearch withValue:;
@end

@implementation NSArray(CDMRecursiveSearch)

- (uint64_t)_cdm_hasKey:()CDMRecursiveSearch withValue:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__NSArray_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke;
  v12[3] = &unk_2647A5878;
  v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  uint64_t v10 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

@end