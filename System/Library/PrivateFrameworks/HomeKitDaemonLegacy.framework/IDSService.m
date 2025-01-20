@interface IDSService
@end

@implementation IDSService

BOOL __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 isEqual:*(void *)(a1 + 32)] && !objc_msgSend(v3, "isLocal");

  return v4;
}

uint64_t __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isLocal];
  if (v6 == [v5 isLocal])
  {
    uint64_t v8 = [v4 type];
    if (v8 != [v5 type])
    {
      if ([v4 type] == 1)
      {
        uint64_t v7 = 1;
        goto LABEL_11;
      }
      if ([v5 type] == 1)
      {
        uint64_t v7 = -1;
        goto LABEL_11;
      }
    }
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  if ([v4 isLocal]) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_11:

  return v7;
}

@end