@interface HKCorrelation(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
- (id)hd_associatedObjects;
- (id)hd_associatedSampleTypes;
@end

@implementation HKCorrelation(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

- (id)hd_associatedObjects
{
  v1 = [a1 objects];
  v2 = [v1 allObjects];

  return v2;
}

- (id)hd_associatedSampleTypes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a1, "hd_associatedObjects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "hd_sampleType");

        if (v9)
        {
          v10 = objc_msgSend(v8, "hd_sampleType");
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v11 = [a1 sampleType];
  [v2 addObject:v11];

  v12 = [MEMORY[0x1E4F1CAD0] setWithSet:v2];

  return v12;
}

@end