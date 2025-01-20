@interface WDCategorySampleDurationListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDCategorySampleDurationListDataProvider

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)titleForSection:(unint64_t)a3
{
  if ([(WDSampleListDataProvider *)self numberOfObjectsForSection:a3])
  {
    v4 = [(WDSampleListDataProvider *)self displayType];
    v5 = [v4 localization];
    v6 = [v5 displayName];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)textForObject:(id)a3
{
  return (id)[a3 displayString];
}

@end