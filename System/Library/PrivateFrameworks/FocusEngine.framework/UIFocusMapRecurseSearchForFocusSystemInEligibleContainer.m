@interface UIFocusMapRecurseSearchForFocusSystemInEligibleContainer
@end

@implementation UIFocusMapRecurseSearchForFocusSystemInEligibleContainer

uint64_t ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  id v7 = v9;
  if (*(id *)(a1 + 32) != v9)
  {
    if (*(id *)(a1 + 40) == v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_14;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      uint64_t v6 = [*(id *)(a1 + 48) containsObject:v9];
      id v7 = v9;
      if (v6)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        goto LABEL_14;
      }
    }
    uint64_t v6 = [*(id *)(a1 + 56) containsObject:v7];
    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v9, 0);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        uint64_t v6 = [*(id *)(a1 + 48) addObject:v9];
LABEL_13:
        id v7 = v9;
        goto LABEL_14;
      }
      uint64_t v6 = [*(id *)(a1 + 56) addObject:v9];
    }
    *a3 = 1;
    goto LABEL_13;
  }
LABEL_14:
  return MEMORY[0x270F9A758](v6, v7);
}

@end