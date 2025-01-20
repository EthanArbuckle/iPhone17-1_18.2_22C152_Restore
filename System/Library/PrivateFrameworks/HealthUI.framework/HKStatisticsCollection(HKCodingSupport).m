@interface HKStatisticsCollection(HKCodingSupport)
+ (id)statisticsCollectionWithCodableCollection:()HKCodingSupport;
- (HKCodableStatisticsCollection)codableCollection;
@end

@implementation HKStatisticsCollection(HKCodingSupport)

+ (id)statisticsCollectionWithCodableCollection:()HKCodingSupport
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)MEMORY[0x1E4F1C9D8];
    v5 = [v3 statisticsInterval];
    v6 = objc_msgSend(v4, "hkui_dateComponentsWithCodableDateComponents:", v5);

    v7 = [v3 statistics];
    v8 = objc_msgSend(v7, "hk_map:", &__block_literal_global_91);

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F2B5B8]);
      v10 = [v8 firstObject];
      v11 = [v10 startDate];
      v12 = (void *)[v9 initWithAnchorDate:v11 statisticsInterval:v6];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(v12, "_insertStatistics:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v15);
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HKCodableStatisticsCollection)codableCollection
{
  v2 = objc_alloc_init(HKCodableStatisticsCollection);
  id v3 = [a1 statisticsInterval];
  v4 = objc_msgSend(v3, "hkui_codableDateComponents");
  [(HKCodableStatisticsCollection *)v2 setStatisticsInterval:v4];

  v5 = [a1 statistics];
  v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_336);
  v7 = (void *)[v6 mutableCopy];
  [(HKCodableStatisticsCollection *)v2 setStatistics:v7];

  return v2;
}

@end