@interface HKQuantitySample(WDCorrelationListDataProvider)
- (id)quantitySampleForType:()WDCorrelationListDataProvider;
@end

@implementation HKQuantitySample(WDCorrelationListDataProvider)

- (id)quantitySampleForType:()WDCorrelationListDataProvider
{
  id v4 = a3;
  v5 = [a1 quantityType];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    id v7 = a1;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

@end