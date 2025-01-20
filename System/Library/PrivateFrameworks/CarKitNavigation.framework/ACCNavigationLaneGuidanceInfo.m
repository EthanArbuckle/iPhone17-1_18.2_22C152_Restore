@interface ACCNavigationLaneGuidanceInfo
@end

@implementation ACCNavigationLaneGuidanceInfo

void __68__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_setInfo_data___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_setInfo_data___block_invoke_2;
  v6[3] = &unk_265274840;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  [*(id *)(a1 + 32) addObject:v5];
}

void __68__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_setInfo_data___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setInfo:data:", objc_msgSend(a2, "unsignedShortValue"), v5);
}

void __65__ACCNavigationLaneGuidanceInfo_ACCNavigationInfo__cr_dictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cr_dictionary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

@end