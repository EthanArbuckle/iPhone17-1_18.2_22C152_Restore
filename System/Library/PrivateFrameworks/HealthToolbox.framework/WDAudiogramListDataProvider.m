@interface WDAudiogramListDataProvider
- (NSArray)audiogramSamples;
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDAudiogramListDataProvider

- (NSArray)audiogramSamples
{
  v2 = [(WDSampleListDataProvider *)self samples];
  v3 = [v2 allSamples];

  return (NSArray *)v3;
}

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] audiogramSampleType];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)textForObject:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F0A980], "sharedBehavior", a3);
  v4 = [v3 features];
  int v5 = [v4 yodel];

  v6 = HKHealthKitFrameworkBundle();
  v7 = v6;
  if (v5) {
    v8 = @"Localizable-Yodel";
  }
  else {
    v8 = (__CFString *)*MEMORY[0x263F09880];
  }
  v9 = [v6 localizedStringForKey:@"AUDIOGRAM" value:&stru_26D2EA890 table:v8];

  return v9;
}

- (id)titleForSection:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDAudiogramListDataProvider;
  v3 = [(WDSampleListDataProvider *)&v5 titleForSection:a3];

  return v3;
}

@end