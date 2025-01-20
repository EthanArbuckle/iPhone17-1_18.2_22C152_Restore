@interface HKCodableQuantitySeriesDatum(HDQuantitySampleEntity)
+ (id)datumWithTimestamp:()HDQuantitySampleEntity value:duration:;
+ (id)datumWithValue:()HDQuantitySampleEntity timeInterval:;
+ (uint64_t)datumWithStartTime:()HDQuantitySampleEntity value:endTime:;
@end

@implementation HKCodableQuantitySeriesDatum(HDQuantitySampleEntity)

+ (id)datumWithValue:()HDQuantitySampleEntity timeInterval:
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F2ADB0]);
  [v4 setValue:a1];
  [v4 setTimeInterval:a2];

  return v4;
}

+ (id)datumWithTimestamp:()HDQuantitySampleEntity value:duration:
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F2ADB0]);
  [v6 setTimeInterval:a1];
  [v6 setValue:a2];
  if (a3 != -1.0)
  {
    *(float *)&double v7 = a3;
    [v6 setDuration:v7];
  }

  return v6;
}

+ (uint64_t)datumWithStartTime:()HDQuantitySampleEntity value:endTime:
{
  double v5 = a5;
  if (a5 < a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDQuantitySampleSeriesEntity.mm", 2027, @"Invalid parameter not satisfying: %@", @"endTime >= startTime" object file lineNumber description];
  }

  *(float *)&a5 = v5 - a3;
  return [a1 datumWithTimestamp:a3 value:a4 duration:a5];
}

@end