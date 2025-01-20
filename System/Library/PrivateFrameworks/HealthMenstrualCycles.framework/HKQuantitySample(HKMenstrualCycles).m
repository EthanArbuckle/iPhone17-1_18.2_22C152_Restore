@interface HKQuantitySample(HKMenstrualCycles)
+ (id)hkmc_quantitySampleWithBasalBodyTemperature:()HKMenstrualCycles date:;
+ (id)hkmc_quantitySampleWithWristTemperature:()HKMenstrualCycles startDate:endDate:;
@end

@implementation HKQuantitySample(HKMenstrualCycles)

+ (id)hkmc_quantitySampleWithBasalBodyTemperature:()HKMenstrualCycles date:
{
  v6 = (void *)MEMORY[0x263F0A648];
  v7 = (void *)MEMORY[0x263F0A658];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 _quantityTypeWithCode:90];
  v11 = objc_msgSend(a1, "hkmc_defaultMetadata");
  v12 = [v6 quantitySampleWithType:v10 quantity:v9 startDate:v8 endDate:v8 metadata:v11];

  return v12;
}

+ (id)hkmc_quantitySampleWithWristTemperature:()HKMenstrualCycles startDate:endDate:
{
  v7 = (void *)MEMORY[0x263F0A648];
  id v8 = (void *)MEMORY[0x263F0A658];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 _quantityTypeWithCode:256];
  v13 = [v7 quantitySampleWithType:v12 quantity:v11 startDate:v10 endDate:v9 metadata:0];

  return v13;
}

@end