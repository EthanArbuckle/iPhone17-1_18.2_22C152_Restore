@interface ACCNavigationLaneGuidanceInfo
@end

@implementation ACCNavigationLaneGuidanceInfo

id __78__ACCNavigationLaneGuidanceInfo_CPAccNavInfo__initWithLaneGuidance_component___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = [a2 key];
  if (v3 == 3)
  {
    v11 = *(void **)(a1 + 40);
    v12 = [*(id *)(a1 + 32) instructionVariants];
    v4 = objc_msgSend(v11, "CP_variantFittingLaneGuidanceDescription:", v12);
  }
  else if (v3 == 2)
  {
    v4 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = objc_msgSend(*(id *)(a1 + 32), "lanes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)[objc_alloc(MEMORY[0x263F22E90]) initWithLane:*(void *)(*((void *)&v14 + 1) + 8 * i) component:*(void *)(a1 + 40)];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end