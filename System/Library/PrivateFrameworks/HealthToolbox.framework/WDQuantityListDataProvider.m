@interface WDQuantityListDataProvider
- (WDQuantityListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
@end

@implementation WDQuantityListDataProvider

- (WDQuantityListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDQuantityListDataProvider;
  v7 = [(WDSampleListDataProvider *)&v10 initWithDisplayType:v6 profile:a4];
  if (v7)
  {
    v8 = [v6 sampleType];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Attempt to create a quantity list provider with a non-quantity data group"];
    }
  }
  return v7;
}

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
  id v4 = a3;
  v5 = [(WDSampleListDataProvider *)self displayType];
  id v6 = [(WDSampleListDataProvider *)self unitController];
  v7 = [v6 unitForDisplayType:v5];

  v8 = [v4 quantity];

  [v8 doubleValueForUnit:v7];
  double v10 = v9;

  v11 = [v5 presentation];
  v12 = [NSNumber numberWithDouble:v10];
  v13 = [v11 adjustedValueForDaemonValue:v12];

  v14 = [(WDSampleListDataProvider *)self unitController];
  v15 = HKFormattedStringFromValueForContext();

  return v15;
}

- (id)titleForSection:(unint64_t)a3
{
  v5 = [(WDSampleListDataProvider *)self displayType];
  id v6 = [(WDSampleListDataProvider *)self unitController];
  char v7 = HKFormatterIncludesUnitForDisplayTypeInContext();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WDQuantityListDataProvider;
    v8 = [(WDSampleListDataProvider *)&v10 titleForSection:a3];
  }

  return v8;
}

@end