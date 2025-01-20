@interface _HKDiscreteQuantitySampleComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKDiscreteQuantitySampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  [a1 operatorType];
  uint64_t v4 = HDSQLiteComparisonTypeForPredicateOperator();
  v5 = [a1 keyPath];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2A3D0]];

  if (v6)
  {
    v7 = -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMinValue(v4, v7);
LABEL_13:
    v19 = (void *)v8;

    goto LABEL_14;
  }
  v9 = [a1 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A3B8]];

  if (v10)
  {
    v7 = -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMaxValue(v4, v7);
    goto LABEL_13;
  }
  v11 = [a1 keyPath];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A3D8]];

  if (v12)
  {
    v7 = -[_HKDiscreteQuantitySampleComparisonFilter _comparisonQuantityAsNumber](a1);
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMostRecentValue(v4, v7);
    goto LABEL_13;
  }
  v13 = [a1 keyPath];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F2A3F0]];

  if (v14)
  {
    v7 = [a1 value];
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMostRecentStartDate(v4, v7);
    goto LABEL_13;
  }
  v15 = [a1 keyPath];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2A3E8]];

  if (v16)
  {
    v7 = [a1 value];
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMostRecentEndDate(v4, v7);
    goto LABEL_13;
  }
  v17 = [a1 keyPath];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2A3E0]];

  if (v18)
  {
    v7 = [a1 value];
    uint64_t v8 = HDQuantitySampleStatisticsEntityPredicateForMostRecentDuration(v4, v7);
    goto LABEL_13;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:a1 file:@"_HKDiscreteQuantitySampleComparisonFilter+HealthDaemon.m" lineNumber:38 description:@"Unreachable code has been executed"];

  v19 = [MEMORY[0x1E4F65D58] falsePredicate];
LABEL_14:

  return v19;
}

@end