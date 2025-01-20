@interface NSArray(INCacheSupport)
- (id)_intents_cacheableObjects;
- (void)_intents_updateContainerWithCache:()INCacheSupport;
@end

@implementation NSArray(INCacheSupport)

- (void)_intents_updateContainerWithCache:()INCacheSupport
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDBB1EE8, (void)v16))
        {
          objc_msgSend(v10, "_intents_updateContainerWithCache:", v4);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            v12 = [v11 _identifier];
            v13 = [v4 cacheableObjectForIdentifier:v12];

            if (v13)
            {
              v14 = [v11 _identifier];
              v15 = [v4 cacheableObjectForIdentifier:v14];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v15 _imageSize];
                objc_msgSend(v11, "_setImageSize:");
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EDBB1EE8, (void)v13))
        {
          v9 = objc_msgSend(v8, "_intents_cacheableObjects");
          if ([v9 count]) {
            [v2 unionSet:v9];
          }
        }
        else if ([v8 conformsToProtocol:&unk_1EDBCF518])
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    v10 = v2;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end