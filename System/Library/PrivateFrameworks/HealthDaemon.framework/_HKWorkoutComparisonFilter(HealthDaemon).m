@interface _HKWorkoutComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKWorkoutComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5 = a3;
  v6 = [a1 keyPath];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A4D0]];

  if (v7)
  {
    if (!a1) {
      goto LABEL_17;
    }
    [a1 operatorType];
    uint64_t v8 = HDSQLiteComparisonTypeForPredicateOperator();
    v9 = [a1 value];
    [v9 doubleValue];
    uint64_t v10 = HDWorkoutEntityPredicateForDuration(v8);
LABEL_16:
    a1 = (void *)v10;

    goto LABEL_17;
  }
  v11 = [a1 keyPath];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A4F8]];

  if (v12)
  {
    if (!a1) {
      goto LABEL_17;
    }
    [a1 operatorType];
    uint64_t v13 = HDSQLiteComparisonTypeForPredicateOperator();
    v9 = [a1 value];
    uint64_t v10 = HDWorkoutEntityPredicateForTotalDistance(v13, v9);
    goto LABEL_16;
  }
  v14 = [a1 keyPath];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F2A500]];

  if (v15)
  {
    if (!a1) {
      goto LABEL_17;
    }
    [a1 operatorType];
    uint64_t v16 = HDSQLiteComparisonTypeForPredicateOperator();
    v9 = [a1 value];
    uint64_t v10 = HDWorkoutEntityPredicateForTotalEnergyBurned(v16, v9);
    goto LABEL_16;
  }
  v17 = [a1 keyPath];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2A508]];

  if (v18)
  {
    if (!a1) {
      goto LABEL_17;
    }
    [a1 operatorType];
    uint64_t v19 = HDSQLiteComparisonTypeForPredicateOperator();
    v9 = [a1 value];
    uint64_t v10 = HDWorkoutEntityPredicateForTotalFlightsClimbed(v19, v9);
    goto LABEL_16;
  }
  v20 = [a1 keyPath];
  int v21 = [v20 isEqualToString:*MEMORY[0x1E4F2A510]];

  if (v21)
  {
    if (!a1) {
      goto LABEL_17;
    }
    [a1 operatorType];
    uint64_t v22 = HDSQLiteComparisonTypeForPredicateOperator();
    v9 = [a1 value];
    uint64_t v10 = HDWorkoutEntityPredicateForTotalSwimmingStrokeCount(v22, v9);
    goto LABEL_16;
  }
  v24 = [a1 keyPath];
  int v25 = [v24 isEqualToString:*MEMORY[0x1E4F2A518]];

  if (v25)
  {
    uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForWorkoutActivityType](a1);
  }
  else
  {
    v27 = [a1 keyPath];
    int v28 = [v27 isEqualToString:*MEMORY[0x1E4F2BA90]];

    if (v28)
    {
      uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForGoal](a1);
    }
    else
    {
      v29 = [a1 keyPath];
      int v30 = [v29 isEqualToString:*MEMORY[0x1E4F2BA98]];

      if (v30)
      {
        uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForGoalType](a1);
      }
      else
      {
        v31 = [a1 keyPath];
        int v32 = [v31 hasPrefix:*MEMORY[0x1E4F2A4F0]];

        if (v32)
        {
          uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForSumQuantity](a1);
        }
        else
        {
          v33 = [a1 keyPath];
          int v34 = [v33 hasPrefix:*MEMORY[0x1E4F2A4E8]];

          if (v34)
          {
            uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForMinimumQuantity](a1);
          }
          else
          {
            v35 = [a1 keyPath];
            int v36 = [v35 hasPrefix:*MEMORY[0x1E4F2A4E0]];

            if (v36)
            {
              uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForMaximumQuantity](a1);
            }
            else
            {
              v37 = [a1 keyPath];
              int v38 = [v37 hasPrefix:*MEMORY[0x1E4F2A4C8]];

              if (v38)
              {
                uint64_t v26 = -[_HKWorkoutComparisonFilter _predicateForAverageQuantity](a1);
              }
              else
              {
                v39 = [a1 keyPath];
                int v40 = [v39 isEqualToString:*MEMORY[0x1E4F2A480]];

                if (v40)
                {
                  -[_HKWorkoutComparisonFilter _predicateForWorkoutActivityWithProfile:](a1, v5);
                }
                else
                {
                  v41 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v41 handleFailureInMethod:a2 object:a1 file:@"_HKWorkoutComparisonFilter+HealthDaemon.m" lineNumber:78 description:@"Unreachable code has been executed"];

                  [MEMORY[0x1E4F65D58] falsePredicate];
                uint64_t v26 = };
              }
            }
          }
        }
      }
    }
  }
  a1 = (void *)v26;
LABEL_17:

  return a1;
}

@end