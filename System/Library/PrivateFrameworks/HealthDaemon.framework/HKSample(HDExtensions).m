@interface HKSample(HDExtensions)
+ (id)hd_sampleTypesForObjects:()HDExtensions;
- (id)hd_associatedSampleTypes;
@end

@implementation HKSample(HDExtensions)

+ (id)hd_sampleTypesForObjects:()HDExtensions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C187C0E0](v6);
        v12 = objc_msgSend(v10, "hd_associatedSampleTypes", (void)v16);
        [v4 unionSet:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  if ([v4 count]) {
    v13 = v4;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)hd_associatedSampleTypes
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v2 = objc_msgSend(a1, "hd_sampleType");
  id v3 = [v1 setWithObject:v2];

  return v3;
}

@end