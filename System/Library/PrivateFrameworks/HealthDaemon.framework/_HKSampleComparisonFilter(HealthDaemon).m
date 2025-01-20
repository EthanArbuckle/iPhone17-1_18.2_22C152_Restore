@interface _HKSampleComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKSampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  [a1 operatorType];
  uint64_t v4 = HDSQLiteComparisonTypeForPredicateOperator();
  v5 = [a1 value];
  v6 = [a1 keyPath];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A420]];

  if (v7)
  {
    uint64_t v8 = HDSampleEntityPredicateForStartDate(v4);
  }
  else
  {
    v10 = [a1 keyPath];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F2A3F8]];

    if (v11)
    {
      v12 = [a1 dataTypes];
      v13 = [v12 anyObject];
      v14 = [v13 _earliestAllowedStartDateForSampleOverlappingDate:v5];

      if (v14) {
        HDSampleEntityPredicateForStartDate(v4);
      }
      else {
      v9 = [MEMORY[0x1E4F65D58] truePredicate];
      }

      goto LABEL_13;
    }
    v15 = [a1 keyPath];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2A390]];

    if (v16)
    {
      HDSampleEntityPredicateForEndDate(v4);
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:a1 file:@"_HKSampleComparisonFilter+HealthDaemon.m" lineNumber:40 description:@"Unreachable code has been executed"];

      [MEMORY[0x1E4F65D58] falsePredicate];
    uint64_t v8 = };
  }
  v9 = (void *)v8;
LABEL_13:

  return v9;
}

@end