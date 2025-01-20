@interface LoadCoreMaterialRecipeNames
@end

@implementation LoadCoreMaterialRecipeNames

void ___LoadCoreMaterialRecipeNames_block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] coreMaterialRecipeBundle];
  v1 = [v0 URLsForMaterialRecipes];
  v14 = [v0 URLsForMaterialRecipeDescendants];
  v15 = v1;
  v2 = objc_msgSend(v1, "arrayByAddingObjectsFromArray:");
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 lastPathComponent];
        v11 = [v10 stringByDeletingPathExtension];

        v12 = MTLogConfiguration;
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v11;
          __int16 v22 = 2114;
          v23 = v9;
          _os_log_debug_impl(&dword_1AE9D6000, v12, OS_LOG_TYPE_DEBUG, "Found recipe '%{public}@' at URL: %{public}@", buf, 0x16u);
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  v13 = (void *)__coreMaterialRecipeNames;
  __coreMaterialRecipeNames = (uint64_t)v3;
}

@end