@interface _HKQuantityDistributionData(HKCodingSupport)
+ (id)quantityDistributionDataWithCodableQuantityDistributionData:()HKCodingSupport sourceTimeZone:preferredUnit:;
- (HKCodableQuantityDistributionData)codableQuantityDistributionData;
@end

@implementation _HKQuantityDistributionData(HKCodingSupport)

+ (id)quantityDistributionDataWithCodableQuantityDistributionData:()HKCodingSupport sourceTimeZone:preferredUnit:
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F2B370] quantityWithUnit:a5 doubleValue:0.0];
  v10 = (void *)MEMORY[0x1E4F2B370];
  v11 = [MEMORY[0x1E4F2B618] secondUnit];
  v12 = [v10 quantityWithUnit:v11 doubleValue:0.0];

  if ([v7 hasStartDate])
  {
    [v7 startDate];
    v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v39 = objc_msgSend(v13, "hk_dateFromSourceTimeZone:", v8);
  }
  else
  {
    v39 = [MEMORY[0x1E4F1C9C8] now];
  }
  if ([v7 hasEndDate])
  {
    [v7 endDate];
    v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v38 = objc_msgSend(v14, "hk_dateFromSourceTimeZone:", v8);
  }
  else
  {
    v38 = [MEMORY[0x1E4F1C9C8] now];
  }
  if ([v7 hasMinimumBucketValue])
  {
    v15 = (void *)MEMORY[0x1E4F2B370];
    v16 = [v7 minimumBucketValue];
    id v37 = [v15 createWithCodableQuantity:v16];
  }
  else
  {
    id v37 = v9;
  }
  if ([v7 hasMinimumValue])
  {
    v17 = (void *)MEMORY[0x1E4F2B370];
    v18 = [v7 minimumValue];
    id v36 = [v17 createWithCodableQuantity:v18];
  }
  else
  {
    id v36 = v9;
  }
  if ([v7 hasMaximumValue])
  {
    v19 = (void *)MEMORY[0x1E4F2B370];
    v20 = [v7 maximumValue];
    id v35 = [v19 createWithCodableQuantity:v20];
  }
  else
  {
    id v35 = v9;
  }
  if ([v7 hasAverageValue])
  {
    v21 = (void *)MEMORY[0x1E4F2B370];
    v22 = [v7 averageValue];
    id v34 = [v21 createWithCodableQuantity:v22];
  }
  else
  {
    id v34 = v9;
  }
  v41 = v8;
  v40 = v9;
  if ([v7 hasDuration])
  {
    v23 = (void *)MEMORY[0x1E4F2B370];
    v24 = [v7 duration];
    id v25 = [v23 createWithCodableQuantity:v24];
  }
  else
  {
    id v25 = v12;
  }
  v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "histogramCountsCount"));
  v27 = [v7 contextIdentifiers];
  v28 = objc_msgSend(v27, "hk_map:", &__block_literal_global_343_0);

  if ([v7 histogramCountsCount])
  {
    unint64_t v29 = 0;
    do
    {
      v30 = NSNumber;
      [v7 histogramCountsAtIndex:v29];
      v31 = objc_msgSend(v30, "numberWithDouble:");
      [v26 addObject:v31];

      ++v29;
    }
    while (v29 < [v7 histogramCountsCount]);
  }
  id v33 = (id)[objc_alloc(MEMORY[0x1E4F2B948]) initWithStartDate:v39 endDate:v38 minimumBucketValue:v37 minimumValue:v36 maximumValue:v35 averageValue:v34 duration:v25 histogramCounts:v26 contextIdentifiers:v28];

  return v33;
}

- (HKCodableQuantityDistributionData)codableQuantityDistributionData
{
  v2 = objc_alloc_init(HKCodableQuantityDistributionData);
  v3 = [a1 startDate];
  [v3 timeIntervalSinceReferenceDate];
  -[HKCodableQuantityDistributionData setStartDate:](v2, "setStartDate:");

  v4 = [a1 endDate];
  [v4 timeIntervalSinceReferenceDate];
  -[HKCodableQuantityDistributionData setEndDate:](v2, "setEndDate:");

  v5 = [a1 minimumBucketValue];
  v6 = [v5 codableRepresentation];
  [(HKCodableQuantityDistributionData *)v2 setMinimumBucketValue:v6];

  id v7 = [a1 minimumValue];
  id v8 = [v7 codableRepresentation];
  [(HKCodableQuantityDistributionData *)v2 setMinimumValue:v8];

  v9 = [a1 maximumValue];
  v10 = [v9 codableRepresentation];
  [(HKCodableQuantityDistributionData *)v2 setMaximumValue:v10];

  v11 = [a1 averageValue];
  if (v11)
  {
    v12 = [a1 averageValue];
    v13 = [v12 codableRepresentation];
    [(HKCodableQuantityDistributionData *)v2 setAverageValue:v13];
  }
  else
  {
    [(HKCodableQuantityDistributionData *)v2 setAverageValue:0];
  }

  v14 = [a1 duration];
  if (v14)
  {
    v15 = [a1 duration];
    v16 = [v15 codableRepresentation];
    [(HKCodableQuantityDistributionData *)v2 setDuration:v16];
  }
  else
  {
    [(HKCodableQuantityDistributionData *)v2 setDuration:0];
  }

  v17 = [a1 histogramCounts];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke;
  v26[3] = &unk_1E6D511B8;
  v18 = v2;
  v27 = v18;
  [v17 enumerateObjectsUsingBlock:v26];

  v19 = [a1 contextIdentifiers];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke_2;
  v24[3] = &unk_1E6D57C08;
  v20 = v18;
  id v25 = v20;
  [v19 enumerateObjectsUsingBlock:v24];

  v21 = v25;
  v22 = v20;

  return v22;
}

@end