@interface DiscoveredMaterialRecipeURLs
@end

@implementation DiscoveredMaterialRecipeURLs

void ___DiscoveredMaterialRecipeURLs_block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = [MEMORY[0x1E4F28B50] coreMaterialRecipeBundle];
  v2 = [v1 URLsForMaterialRecipes];
  v3 = [v1 URLsForMaterialRecipeDescendants];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v0, "containsObject:", v10, (void)v12) & 1) == 0) {
          [v0 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v11 = (void *)_DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs;
  _DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs = (uint64_t)v0;
}

@end