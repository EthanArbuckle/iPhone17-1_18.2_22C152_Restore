@interface WDAppleSleepingBreathingDisturbancesListDataProvider
- (id)secondaryTextForObject:(id)a3;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDAppleSleepingBreathingDisturbancesListDataProvider

- (id)textForObject:(id)a3
{
  v3 = (void *)MEMORY[0x263F469A0];
  v4 = [a3 quantity];
  v5 = [v3 localizedTitleForBreathingDisturbances:v4];

  return v5;
}

- (id)secondaryTextForObject:(id)a3
{
  id v3 = a3;
  v4 = HKDateFormatterFromTemplate();
  v5 = [v3 endDate];

  v6 = [v4 stringFromDate:v5];

  return v6;
}

- (id)titleForSection:(unint64_t)a3
{
  return 0;
}

@end