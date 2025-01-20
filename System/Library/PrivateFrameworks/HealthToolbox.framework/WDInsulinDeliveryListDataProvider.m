@interface WDInsulinDeliveryListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDInsulinDeliveryListDataProvider

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)textForObject:(id)a3
{
  v23[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WDSampleListDataProvider *)self displayType];
  v6 = [(WDSampleListDataProvider *)self unitController];
  v22 = (void *)v5;
  v7 = [v6 unitForDisplayType:v5];
  v8 = NSNumber;
  v9 = [v4 quantity];
  [v9 doubleValueForUnit:v7];
  v10 = objc_msgSend(v8, "numberWithDouble:");

  v11 = HKFormattedStringFromValue();
  v12 = [v6 localizedDisplayNameForUnit:v7 value:v10];
  v13 = [v4 metadata];

  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F09AA8]];
  uint64_t v15 = [v14 integerValue];

  v16 = objc_msgSend(NSString, "stringWithFormat:", @"INSULIN_DELIVERY_REASON_%zd", v15);
  v23[0] = v11;
  v23[1] = @" ";
  v23[2] = v12;
  v23[3] = @" ";
  v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v18 = [v17 localizedStringForKey:v16 value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  v23[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  v20 = HKUIJoinStringsForLocale();

  return v20;
}

- (id)titleForSection:(unint64_t)a3
{
  if ([(WDSampleListDataProvider *)self numberOfObjectsForSection:a3])
  {
    id v4 = [(WDSampleListDataProvider *)self displayType];
    uint64_t v5 = [v4 localization];
    v6 = [v5 displayName];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end