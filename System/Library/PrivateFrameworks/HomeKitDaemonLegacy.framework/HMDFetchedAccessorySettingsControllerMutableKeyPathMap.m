@interface HMDFetchedAccessorySettingsControllerMutableKeyPathMap
- (id)availableKeyPaths;
- (id)objectForKeyedSubscript:(void *)a1;
@end

@implementation HMDFetchedAccessorySettingsControllerMutableKeyPathMap

- (void).cxx_destruct
{
}

- (id)availableKeyPaths
{
  if (a1)
  {
    v2 = objc_msgSend(objc_getProperty(a1, a2, 8, 1), "na_flatMap:", &__block_literal_global_172280);
    v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t __75__HMDFetchedAccessorySettingsControllerMutableKeyPathMap_availableKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 keyPaths];
}

- (id)objectForKeyedSubscript:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_getProperty(a1, v3, 8, 1);
    v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "keyPaths", (void)v13);
          char v11 = [v10 containsObject:v4];

          if (v11)
          {
            v6 = [v9 driver];
            goto LABEL_12;
          }
        }
        v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end