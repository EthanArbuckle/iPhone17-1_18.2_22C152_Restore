@interface _HKCategorySampleComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKCategorySampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  [a1 operatorType];
  uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
  v3 = [a1 value];
  v4 = HDCategorySampleEntityPredicateForValue(v2);

  return v4;
}

@end