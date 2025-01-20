@interface CNUIUserActionItemComparator
+ (BOOL)isUserActionForDefaultApps:(id)a3;
+ (id)comparatorWithActionItemGrouping;
+ (id)comparatorWithAlphabeticalOrderByLabel;
+ (id)comparatorWithAlphabeticalOrderByTargetHandle;
+ (id)comparatorWithDefaultAppsScorer:(id)a3;
+ (id)comparatorWithPreferredLabelsFirst;
+ (id)defaultAppScoreForUserAction:(id)a3 scorer:(id)a4;
+ (id)preferredLabelScoreForUserAction:(id)a3;
@end

@implementation CNUIUserActionItemComparator

+ (id)comparatorWithActionItemGrouping
{
  v2 = (void *)[&__block_literal_global_122_0 copy];
  return v2;
}

uint64_t __64__CNUIUserActionItemComparator_comparatorWithActionItemGrouping__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "group"));
  v7 = NSNumber;
  uint64_t v8 = [v5 group];

  v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

+ (id)comparatorWithPreferredLabelsFirst
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__CNUIUserActionItemComparator_comparatorWithPreferredLabelsFirst__block_invoke;
  v4[3] = &__block_descriptor_40_e51_q24__0__CNUIUserActionItem_8__CNUIUserActionItem_16l;
  v4[4] = a1;
  v2 = (void *)[v4 copy];
  return v2;
}

uint64_t __66__CNUIUserActionItemComparator_comparatorWithPreferredLabelsFirst__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 preferredLabelScoreForUserAction:a2];
  uint64_t v8 = [*(id *)(a1 + 32) preferredLabelScoreForUserAction:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

+ (id)comparatorWithAlphabeticalOrderByLabel
{
  v2 = (void *)[&__block_literal_global_126 copy];
  return v2;
}

uint64_t __70__CNUIUserActionItemComparator_comparatorWithAlphabeticalOrderByLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 label];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_26BFC7668;
  }
  uint64_t v8 = v7;

  uint64_t v9 = [v4 label];

  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_26BFC7668;
  }
  v11 = v10;

  uint64_t v12 = [(__CFString *)v8 compare:v11];
  return v12;
}

+ (id)comparatorWithAlphabeticalOrderByTargetHandle
{
  v2 = (void *)[&__block_literal_global_131 copy];
  return v2;
}

uint64_t __77__CNUIUserActionItemComparator_comparatorWithAlphabeticalOrderByTargetHandle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 targetHandle];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_26BFC7668;
  }
  uint64_t v8 = v7;

  uint64_t v9 = [v4 targetHandle];

  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_26BFC7668;
  }
  v11 = v10;

  uint64_t v12 = [(__CFString *)v8 compare:v11];
  return v12;
}

+ (id)preferredLabelScoreForUserAction:(id)a3
{
  uint64_t v3 = preferredLabelScoreForUserAction__cn_once_token_1;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&preferredLabelScoreForUserAction__cn_once_token_1, &__block_literal_global_134);
  }
  id v5 = (id)preferredLabelScoreForUserAction__cn_once_object_1;
  id v6 = [v4 label];

  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &unk_26BFD9DD0;
  }
  id v9 = v8;

  return v9;
}

void __65__CNUIUserActionItemComparator_preferredLabelScoreForUserAction___block_invoke()
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFE8B0];
  v5[0] = *MEMORY[0x263EFE8F8];
  v5[1] = v0;
  v6[0] = &unk_26BFD9D18;
  v6[1] = &unk_26BFD9D90;
  uint64_t v1 = *MEMORY[0x263EFE910];
  v5[2] = *MEMORY[0x263EFE8D8];
  v5[3] = v1;
  v6[2] = &unk_26BFD9DA0;
  v6[3] = &unk_26BFD9DB0;
  v5[4] = *MEMORY[0x263EFE8B8];
  v6[4] = &unk_26BFD9DC0;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)preferredLabelScoreForUserAction__cn_once_object_1;
  preferredLabelScoreForUserAction__cn_once_object_1 = v3;
}

+ (id)comparatorWithDefaultAppsScorer:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CNUIUserActionItemComparator_comparatorWithDefaultAppsScorer___block_invoke;
  v8[3] = &unk_264019748;
  id v9 = v4;
  id v10 = a1;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

uint64_t __64__CNUIUserActionItemComparator_comparatorWithDefaultAppsScorer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32)
    && [*(id *)(a1 + 40) isUserActionForDefaultApps:v5]
    && [*(id *)(a1 + 40) isUserActionForDefaultApps:v6])
  {
    v7 = [*(id *)(a1 + 40) defaultAppScoreForUserAction:v5 scorer:*(void *)(a1 + 32)];
    uint64_t v8 = [*(id *)(a1 + 40) defaultAppScoreForUserAction:v6 scorer:*(void *)(a1 + 32)];
    uint64_t v9 = [v7 compare:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)isUserActionForDefaultApps:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 group] == 2 || objc_msgSend(v3, "group") == 3;

  return v4;
}

+ (id)defaultAppScoreForUserAction:(id)a3 scorer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [v6 bundleIdentifier];

  uint64_t v9 = [v5 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [NSNumber numberWithInteger:v7 + 10];
  }
  v11 = v10;

  return v11;
}

@end