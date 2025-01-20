@interface LDCMMobileAssetDistributor
- (void)receiveBehaviorDictionary:(id)a3;
@end

@implementation LDCMMobileAssetDistributor

- (void)receiveBehaviorDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"LDCMBehaviorV4"];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 objectForKeyedSubscript:@"LDCMBehaviorV4"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v19 = v4;
        v9 = [v4 objectForKeyedSubscript:@"LDCMBehaviorV4"];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = (id)ldcmManagerStore;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              v16 = [(id)ldcmManagerStore objectForKeyedSubscript:v15];
              objc_opt_class();
              char v17 = objc_opt_isKindOfClass();

              if (v17)
              {
                v18 = [(id)ldcmManagerStore objectForKeyedSubscript:v15];
                [v18 processBehaviorDictionary:v9];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v12);
        }

        v4 = v19;
      }
    }
  }
}

@end