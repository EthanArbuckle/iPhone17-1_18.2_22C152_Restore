@interface HKSample(HKHRTestingSupport)
+ (id)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport timeZone:;
+ (uint64_t)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport;
@end

@implementation HKSample(HKHRTestingSupport)

+ (uint64_t)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport
{
  return objc_msgSend(a1, "hkhr_bloodPressureSampleForDate:timeZone:", a3, 0);
}

+ (id)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport timeZone:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || ![(__CFString *)v6 length])
  {

    v7 = @"America/Los_Angeles";
  }
  v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v7];
  uint64_t v25 = *MEMORY[0x1E4F2A200];
  v9 = [v8 name];
  v26[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  v11 = (void *)MEMORY[0x1E4F2B370];
  v12 = [MEMORY[0x1E4F2B618] unitFromString:@"mmHg"];
  v13 = [v11 quantityWithUnit:v12 doubleValue:100.0];

  v14 = (void *)MEMORY[0x1E4F2B388];
  v15 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  v16 = [v14 quantitySampleWithType:v15 quantity:v13 startDate:v5 endDate:v5 metadata:v10];

  v17 = (void *)MEMORY[0x1E4F2B388];
  v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  v19 = [v17 quantitySampleWithType:v18 quantity:v13 startDate:v5 endDate:v5 metadata:v10];

  v20 = (void *)MEMORY[0x1E4F2AE50];
  v21 = [MEMORY[0x1E4F2B2C0] correlationTypeForIdentifier:*MEMORY[0x1E4F29938]];
  v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v16, v19, 0);
  v23 = [v20 correlationWithType:v21 startDate:v5 endDate:v5 objects:v22 metadata:v10];

  return v23;
}

@end