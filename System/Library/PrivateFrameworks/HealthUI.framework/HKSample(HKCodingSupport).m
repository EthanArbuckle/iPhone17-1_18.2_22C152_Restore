@interface HKSample(HKCodingSupport)
+ (id)createWithCodableChartData:()HKCodingSupport;
+ (id)createWithCodableNotificationSample:()HKCodingSupport;
- (HKCodableSampleChartData)codableSampleChartData;
@end

@implementation HKSample(HKCodingSupport)

+ (id)createWithCodableChartData:()HKCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F2B448], "dataTypeWithCode:", objc_msgSend(v3, "dataType"));
  [v3 startDate];
  v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  [v3 endDate];
  v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  v8 = [v3 metadataDictionary];
  v9 = [v7 dictionaryWithCodableMetadata:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)MEMORY[0x1E4F2ACB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__HKSample_HKCodingSupport__createWithCodableChartData___block_invoke;
    v18[3] = &unk_1E6D57B30;
    id v19 = v3;
    v11 = (void *)[v10 _newSampleFromDatesWithType:v4 startDate:v5 endDate:v6 device:0 metadata:v9 config:v18];
  }
  else if ([v4 code] == 79 || objc_msgSend(v4, "code") == 79)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F2B718], "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", objc_msgSend(v3, "int64Value"), v5, v6, 0, 0, 0, 1.0, 0, 0, 0, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)MEMORY[0x1E4F2B370];
      v14 = [v3 quantity];
      v15 = [v13 createWithCodableQuantity:v14];

      v11 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v4 quantity:v15 startDate:v5 endDate:v6 device:0 metadata:v9];
    }
    else
    {
      if ([v4 code] == 287)
      {
        v16 = (void *)MEMORY[0x1E4F2B078];
        v17 = &unk_1F3C1FFC0;
      }
      else
      {
        if ([v4 code] != 288)
        {
          v11 = 0;
          goto LABEL_8;
        }
        v16 = (void *)MEMORY[0x1E4F2B310];
        v17 = &unk_1F3C1FFD8;
      }
      v11 = [v16 assessmentWithDate:v5 answers:v17 metadata:v9];
      objc_msgSend(v11, "_setRisk:", objc_msgSend(v3, "int64Value"));
    }
  }
LABEL_8:

LABEL_9:
  return v11;
}

+ (id)createWithCodableNotificationSample:()HKCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_msgSend(MEMORY[0x1E4F2ACB8], "dataTypeWithCode:", objc_msgSend(v3, "dataType"));
    v5 = (void *)MEMORY[0x1E4F2ACB0];
    uint64_t v6 = [v3 categoryValue];
    [v3 startDate];
    v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    [v3 endDate];
    v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v9 = [v5 categorySampleWithType:v4 value:v6 startDate:v7 endDate:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HKCodableSampleChartData)codableSampleChartData
{
  v2 = objc_alloc_init(HKCodableSampleChartData);
  id v3 = [a1 sampleType];
  -[HKCodableSampleChartData setDataType:](v2, "setDataType:", [v3 code]);

  v4 = [a1 startDate];
  [v4 timeIntervalSinceReferenceDate];
  -[HKCodableSampleChartData setStartDate:](v2, "setStartDate:");

  v5 = [a1 endDate];
  [v5 timeIntervalSinceReferenceDate];
  -[HKCodableSampleChartData setEndDate:](v2, "setEndDate:");

  -[HKCodableSampleChartData setInt64Value:](v2, "setInt64Value:", objc_msgSend(a1, "hk_integerValue"));
  uint64_t v6 = [a1 metadata];
  v7 = [v6 codableMetadata];
  [(HKCodableSampleChartData *)v2 setMetadataDictionary:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [a1 quantity];
    v9 = [v8 codableRepresentation];
    [(HKCodableSampleChartData *)v2 setQuantity:v9];
  }
  return v2;
}

@end