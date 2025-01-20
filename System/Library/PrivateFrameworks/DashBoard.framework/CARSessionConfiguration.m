@interface CARSessionConfiguration
@end

@implementation CARSessionConfiguration

uint64_t __68__CARSessionConfiguration_DBAdditions__db_displayInfoForScreenInfo___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 streams];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CARSessionConfiguration_DBAdditions__db_displayInfoForScreenInfo___block_invoke_2;
  v6[3] = &unk_2649B4070;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __68__CARSessionConfiguration_DBAdditions__db_displayInfoForScreenInfo___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

@end