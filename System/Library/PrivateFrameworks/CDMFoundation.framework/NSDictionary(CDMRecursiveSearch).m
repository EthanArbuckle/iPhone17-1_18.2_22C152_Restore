@interface NSDictionary(CDMRecursiveSearch)
- (BOOL)_cdm_hasKey:()CDMRecursiveSearch withValue:;
@end

@implementation NSDictionary(CDMRecursiveSearch)

- (BOOL)_cdm_hasKey:()CDMRecursiveSearch withValue:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 objectForKey:v6];
  char v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__NSDictionary_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke;
    v12[3] = &unk_2647A58A0;
    v15 = &v16;
    id v13 = v6;
    id v14 = v7;
    [a1 enumerateKeysAndObjectsUsingBlock:v12];
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

@end