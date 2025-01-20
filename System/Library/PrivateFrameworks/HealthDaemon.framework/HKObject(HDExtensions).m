@interface HKObject(HDExtensions)
+ (id)hd_allObjectsToInsertWithObjects:()HDExtensions;
+ (uint64_t)hd_dataEntityClass;
- (uint64_t)hd_associatedObjects;
- (uint64_t)hd_associatedSampleTypes;
- (uint64_t)hd_dataEntityClass;
- (uint64_t)hd_sampleType;
@end

@implementation HKObject(HDExtensions)

- (uint64_t)hd_dataEntityClass
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "hd_dataEntityClass");
}

+ (id)hd_allObjectsToInsertWithObjects:()HDExtensions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1C187C0E0]();
  v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  v6 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "hd_associatedObjects", (void)v21);
        v14 = (void *)[v13 mutableCopy];

        uint64_t v15 = [v14 count];
        v16 = v5;
        if (v15)
        {
          [v5 addObjectsFromArray:v14];
          v16 = v6;
        }
        [v16 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  v17 = [v5 array];
  v18 = [v6 array];
  v19 = [v17 arrayByAddingObjectsFromArray:v18];

  return v19;
}

- (uint64_t)hd_associatedObjects
{
  return 0;
}

- (uint64_t)hd_sampleType
{
  return 0;
}

+ (uint64_t)hd_dataEntityClass
{
  return 0;
}

- (uint64_t)hd_associatedSampleTypes
{
  return [MEMORY[0x1E4F1CAD0] set];
}

@end