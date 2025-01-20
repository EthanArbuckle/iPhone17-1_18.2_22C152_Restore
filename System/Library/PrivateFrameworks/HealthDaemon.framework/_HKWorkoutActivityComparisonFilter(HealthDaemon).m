@interface _HKWorkoutActivityComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKWorkoutActivityComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v3 = a1;
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A490]];

  if (v5)
  {
    if (!v3) {
      goto LABEL_9;
    }
    [v3 operatorType];
    uint64_t v6 = HDSQLiteComparisonTypeForPredicateOperator();
    v7 = [v3 value];
    [v7 doubleValue];
    uint64_t v8 = HDWorkoutActivityEntityPredicateForDuration(v6);
    goto LABEL_4;
  }
  v9 = [v3 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A4C0]];

  if (v10)
  {
    if (v3)
    {
      v11 = [v3 value];
      v3 = HDWorkoutActivityEntityPredicateForActivityType([v11 integerValue]);
    }
    goto LABEL_9;
  }
  v13 = [v3 keyPath];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F2A4B0]];

  if (v14)
  {
    if (!v3) {
      goto LABEL_9;
    }
    [v3 operatorType];
    uint64_t v15 = HDSQLiteComparisonTypeForPredicateOperator();
    v7 = [v3 value];
    uint64_t v8 = HDWorkoutActivityEntityPredicateForStartDate(v15);
    goto LABEL_4;
  }
  v16 = [v3 keyPath];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F2A498]];

  if (v17)
  {
    if (!v3) {
      goto LABEL_9;
    }
    [v3 operatorType];
    uint64_t v18 = HDSQLiteComparisonTypeForPredicateOperator();
    v7 = [v3 value];
    uint64_t v8 = HDWorkoutActivityEntityPredicateForEndDate(v18);
LABEL_4:
    v3 = (void *)v8;
LABEL_5:

    goto LABEL_9;
  }
  v19 = [v3 keyPath];
  int v20 = [v19 hasPrefix:*MEMORY[0x1E4F2A4B8]];

  if (v20)
  {
    if (v3)
    {
      v7 = [v3 value];
      v21 = [v3 quantityType];
      v3 = +[HDWorkoutStatisticsPredicate predicateForSumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForSumQuantity:quantityType:operatorType:", v7, v21, [v3 operatorType]);

      goto LABEL_5;
    }
  }
  else
  {
    v22 = [v3 keyPath];
    int v23 = [v22 hasPrefix:*MEMORY[0x1E4F2A4A8]];

    if (v23)
    {
      uint64_t v24 = -[_HKWorkoutComparisonFilter _predicateForMinimumQuantity](v3);
    }
    else
    {
      v25 = [v3 keyPath];
      int v26 = [v25 hasPrefix:*MEMORY[0x1E4F2A4A0]];

      if (v26)
      {
        uint64_t v24 = -[_HKWorkoutComparisonFilter _predicateForMaximumQuantity](v3);
      }
      else
      {
        v27 = [v3 keyPath];
        int v28 = [v27 hasPrefix:*MEMORY[0x1E4F2A488]];

        if (v28)
        {
          -[_HKWorkoutComparisonFilter _predicateForAverageQuantity](v3);
        }
        else
        {
          v29 = [MEMORY[0x1E4F28B00] currentHandler];
          [v29 handleFailureInMethod:a2 object:v3 file:@"_HKWorkoutActivityComparisonFilter+HealthDaemon.m" lineNumber:43 description:@"Unreachable code has been executed"];

          [MEMORY[0x1E4F65D58] falsePredicate];
        uint64_t v24 = };
      }
    }
    v3 = (void *)v24;
  }
LABEL_9:

  return v3;
}

@end