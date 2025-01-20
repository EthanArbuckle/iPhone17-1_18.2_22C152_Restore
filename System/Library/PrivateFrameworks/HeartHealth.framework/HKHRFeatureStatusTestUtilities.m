@interface HKHRFeatureStatusTestUtilities
+ (id)evaluationWithRequirementIdentifiers:(id)a3 unsatisfiedRequirementIdentifiers:(id)a4;
@end

@implementation HKHRFeatureStatusTestUtilities

+ (id)evaluationWithRequirementIdentifiers:(id)a3 unsatisfiedRequirementIdentifiers:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 setObject:v12 forKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  if ([v6 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v21 = objc_msgSend(v7, "objectForKeyedSubscript:", v20, (void)v27);

          if (v21) {
            [v7 setObject:v18 forKeyedSubscript:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }
  }
  v22 = (void *)MEMORY[0x1E4F1CAA0];
  v23 = objc_msgSend(v7, "allKeys", (void)v27);
  v24 = [v22 orderedSetWithArray:v23];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F2B038]) initWithRequirementIdentifiersOrderedByPriority:v24 satisfactionByRequirementIdentifier:v7];

  return v25;
}

@end