@interface _HKVerifiableClinicalRecordComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKVerifiableClinicalRecordComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  [a1 operatorType];
  uint64_t v4 = HDSQLiteComparisonTypeForPredicateOperator();
  v5 = [a1 keyPath];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2AAD8]];

  if (v6)
  {
    v7 = [a1 value];
    v8 = (void *)MEMORY[0x1E4F65D00];
    v9 = _HDSQLiteValueForDate();
    v10 = [v8 predicateWithProperty:@"relevant_date" value:v9 comparisonType:v4];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"_HKVerifiableClinicalRecordComparisonFilter+HealthDaemon.m" lineNumber:43 description:@"Unreachable code has been executed"];

    v10 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return v10;
}

@end