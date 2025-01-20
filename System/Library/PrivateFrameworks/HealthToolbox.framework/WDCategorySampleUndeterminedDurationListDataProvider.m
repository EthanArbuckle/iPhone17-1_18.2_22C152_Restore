@interface WDCategorySampleUndeterminedDurationListDataProvider
- (id)secondaryTextForObject:(id)a3;
@end

@implementation WDCategorySampleUndeterminedDurationListDataProvider

- (id)secondaryTextForObject:(id)a3
{
  id v4 = a3;
  if ([v4 hasUndeterminedDuration])
  {
    v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v5 localizedStringForKey:@"ONGOING_DATE" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WDCategorySampleUndeterminedDurationListDataProvider;
    v6 = [(WDSampleListDataProvider *)&v8 secondaryTextForObject:v4];
  }

  return v6;
}

@end