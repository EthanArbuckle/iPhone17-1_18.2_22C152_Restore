@interface HMAccessory(HMUAdditions)
+ (id)hmu_accessoriesFromAccessories:()HMUAdditions excludingStereoCompanionForAccessory:;
+ (uint64_t)hmu_accessoriesExcludingCurrentAccessoryFromAccessories:()HMUAdditions;
+ (uint64_t)hmu_announceAccessoriesFromAccessories:()HMUAdditions;
- (BOOL)hmu_isEndpoint;
- (uint64_t)hmu_isAppleTV;
- (uint64_t)hmu_isHomePod;
- (uint64_t)hmu_isPartOfHome:()HMUAdditions;
@end

@implementation HMAccessory(HMUAdditions)

- (BOOL)hmu_isEndpoint
{
  v1 = [a1 siriEndpointProfile];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)hmu_isHomePod
{
  v1 = [a1 category];
  BOOL v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B0A0]];
  return v3;
}

- (uint64_t)hmu_isAppleTV
{
  v1 = [a1 category];
  BOOL v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B030]];
  return v3;
}

- (uint64_t)hmu_isPartOfHome:()HMUAdditions
{
  id v4 = a3;
  v5 = [a1 home];
  v6 = [v5 uniqueIdentifier];
  v7 = [v4 uniqueIdentifier];

  uint64_t v8 = [v6 isEqual:v7];
  return v8;
}

+ (uint64_t)hmu_accessoriesExcludingCurrentAccessoryFromAccessories:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_2);
}

+ (id)hmu_accessoriesFromAccessories:()HMUAdditions excludingStereoCompanionForAccessory:
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v41 = a4;
  v6 = [v41 home];
  v7 = v6;
  if (v6)
  {
    v36 = v6;
    v37 = v5;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = [v6 mediaSystems];
    uint64_t v40 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v10 = objc_opt_new();
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v11 = [v9 components];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v47 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                v17 = [v16 role];
                if ([v17 type] == 1)
                {
                }
                else
                {
                  v18 = [v16 role];
                  uint64_t v19 = [v18 type];

                  if (v19 != 2) {
                    goto LABEL_19;
                  }
                }
                v20 = [v16 mediaProfile];
                v21 = [v20 accessory];

                if (v21)
                {
                  v22 = [v21 uniqueIdentifier];
                  [v10 addObject:v22];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v13);
          }
LABEL_19:

          v23 = [v41 uniqueIdentifier];
          int v24 = [v10 containsObject:v23];

          if (v24)
          {
            v26 = [v41 uniqueIdentifier];
            [v10 removeObject:v26];

            id v25 = (id)objc_opt_new();
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v27 = v37;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v54 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v43;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v43 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v32 = *(void **)(*((void *)&v42 + 1) + 8 * k);
                  v33 = [v32 uniqueIdentifier];
                  char v34 = [v10 containsObject:v33];

                  if ((v34 & 1) == 0) {
                    [v25 addObject:v32];
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v54 count:16];
              }
              while (v29);
            }

            id v5 = v37;
            goto LABEL_33;
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    id v5 = v37;
    id v25 = v37;
LABEL_33:
    v7 = v36;
  }
  else
  {
    id v25 = v5;
  }

  return v25;
}

+ (uint64_t)hmu_announceAccessoriesFromAccessories:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_2);
}

@end