@interface _HKActivityStatisticsQuantityInfo(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableActivityStatisticsQuantityInfo)codableRepresentationForSync;
@end

@implementation _HKActivityStatisticsQuantityInfo(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 startDate];
    v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    [v4 endDate];
    v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F2B838]) initWithStartDate:v5 endDate:v6];
    v8 = (void *)MEMORY[0x1E4F2B618];
    v9 = [v4 unit];
    v10 = [v8 unitFromString:v9];

    v11 = (void *)MEMORY[0x1E4F2B370];
    [v4 value];
    double v13 = v12;

    v14 = [v11 quantityWithUnit:v10 doubleValue:v13];
    [v7 setQuantityValue:v14];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HDCodableActivityStatisticsQuantityInfo)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableActivityStatisticsQuantityInfo);
  id v3 = [a1 startDate];
  [v3 timeIntervalSinceReferenceDate];
  -[HDCodableActivityStatisticsQuantityInfo setStartDate:](v2, "setStartDate:");

  id v4 = [a1 endDate];
  [v4 timeIntervalSinceReferenceDate];
  -[HDCodableActivityStatisticsQuantityInfo setEndDate:](v2, "setEndDate:");

  v5 = [a1 quantityValue];
  v6 = [v5 _unit];
  v7 = [v6 unitString];
  [(HDCodableActivityStatisticsQuantityInfo *)v2 setUnit:v7];

  v8 = [a1 quantityValue];
  v9 = [a1 quantityValue];
  v10 = [v9 _unit];
  [v8 doubleValueForUnit:v10];
  -[HDCodableActivityStatisticsQuantityInfo setValue:](v2, "setValue:");

  return v2;
}

@end