@interface HKCorrelation(WDCorrelationListDataProvider)
- (id)quantitySampleForType:()WDCorrelationListDataProvider;
@end

@implementation HKCorrelation(WDCorrelationListDataProvider)

- (id)quantitySampleForType:()WDCorrelationListDataProvider
{
  v1 = objc_msgSend(a1, "objectsForType:");
  v2 = [v1 anyObject];

  return v2;
}

@end