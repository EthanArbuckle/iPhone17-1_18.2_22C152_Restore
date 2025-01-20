@interface LSBundleRecord
@end

@implementation LSBundleRecord

uint64_t __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 iconDictionary];
  if (![v3 count])
  {

    goto LABEL_5;
  }
  char v4 = [v2 isWildcard];

  if (v4)
  {
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 1;
LABEL_6:

  return v5;
}

id __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = CFSetGetValue(*(CFSetRef *)(a1 + 32), v3);
  if (!v4)
  {
    char v4 = CFSetGetValue(*(CFSetRef *)(a1 + 40), v3);
  }

  return v4;
}

uint64_t __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (*(void (**)(void))(a1[6] + 16))();
  if (v6)
  {
    uint64_t v10 = v6;
    int v7 = (*(uint64_t (**)(void))(a1[7] + 16))();
    v8 = (void *)a1[4];
    if (v7)
    {
      [v8 addObject:v10];
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
      *a4 = 1;
    }
    else
    {
      [v8 addObject:a1[5]];
    }
  }
  else
  {
    *a4 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

@end