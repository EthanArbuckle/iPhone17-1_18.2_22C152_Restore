@interface CNUIUserActionCurator
@end

@implementation CNUIUserActionCurator

uint64_t __59___CNUIUserActionCurator_curateUserAction_withKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v7 = [v6 label];
  if (!v7)
  {
    v2 = [*(id *)(a1 + 32) label];
    if (!v2)
    {
      int v8 = 0;
LABEL_7:
      v10 = [v6 value];
      uint64_t v9 = [v10 isEqual:*(void *)(a1 + 40) ignoreURLs:1];

      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  v3 = [v6 label];
  v4 = [*(id *)(a1 + 32) label];
  if ([v3 isEqual:v4])
  {
    int v8 = 1;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_8:

LABEL_9:
  if (!v7) {

  }
  return v9;
}

@end