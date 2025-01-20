@interface HKSample(WDCategorySampleDurationListDataProvider)
- (id)displayString;
@end

@implementation HKSample(WDCategorySampleDurationListDataProvider)

- (id)displayString
{
  id v2 = objc_alloc(MEMORY[0x263F08798]);
  v3 = [a1 startDate];
  v4 = [a1 endDate];
  v5 = (void *)[v2 initWithStartDate:v3 endDate:v4];

  [v5 duration];
  double v7 = v6;
  v8 = [MEMORY[0x263F46700] sharedInstance];
  v9 = [a1 sampleType];
  v10 = [v8 displayTypeForObjectType:v9];

  v11 = [v10 presentation];
  [v11 useSecondsWhenDisplayingDuration];

  v12 = objc_opt_new();
  v13 = [NSNumber numberWithDouble:v7];
  v14 = [v12 stringFromNumber:v13 displayType:0 unitController:0];

  return v14;
}

@end