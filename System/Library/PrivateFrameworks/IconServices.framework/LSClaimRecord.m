@interface LSClaimRecord
@end

@implementation LSClaimRecord

uint64_t __64__LSClaimRecord_IconServicesAdditions___IS_iconProvideingRecord__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = [v5 identifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    v8 = [v5 iconDictionary];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v7 = 1;
      *a3 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

@end