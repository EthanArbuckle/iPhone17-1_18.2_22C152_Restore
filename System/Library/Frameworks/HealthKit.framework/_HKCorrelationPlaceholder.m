@interface _HKCorrelationPlaceholder
+ (BOOL)_allowEmptyCorrelations;
@end

@implementation _HKCorrelationPlaceholder

+ (BOOL)_allowEmptyCorrelations
{
  return 1;
}

@end