@interface _HKWorkoutComparisonFilter
- (id)_predicateForAverageQuantity;
- (id)_predicateForGoal;
- (id)_predicateForGoalType;
- (id)_predicateForMaximumQuantity;
- (id)_predicateForMinimumQuantity;
- (id)_predicateForSumQuantity;
- (id)_predicateForWorkoutActivityType;
- (id)_predicateForWorkoutActivityWithProfile:(id)a1;
@end

@implementation _HKWorkoutComparisonFilter

- (id)_predicateForWorkoutActivityType
{
  if (a1)
  {
    v1 = [a1 value];
    v2 = HDWorkoutEntityPredicateForWorkoutActivityType([v1 integerValue]);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_predicateForGoal
{
  if (a1)
  {
    [a1 operatorType];
    uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
    v3 = [a1 value];
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = qword_1BD326AA8[v4];
      if (_HKWorkoutGoalTypeAcceptsQuantity()) {
        break;
      }
      if (++v4 == 4)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"_HKWorkoutGoalType _HKGoalTypeForQuantity(HKQuantity * _Nullable __strong)"];
        [v6 handleFailureInFunction:v7 file:@"_HKWorkoutComparisonFilter+HealthDaemon.m" lineNumber:40 description:@"Unreachable code has been executed"];

        uint64_t v5 = 0;
        break;
      }
    }
    v8 = HDWorkoutEntityPredicateForWorkoutGoal(v2, v5, v3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_predicateForGoalType
{
  id v1 = a1;
  if (a1)
  {
    [a1 operatorType];
    uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
    v3 = [v1 value];
    HDWorkoutEntityPredicateForWorkoutGoalType(v2, [v3 integerValue]);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_predicateForSumQuantity
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 value];
    v3 = [v1 quantityType];
    +[HDWorkoutStatisticsPredicate predicateForSumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForSumQuantity:quantityType:operatorType:", v2, v3, [v1 operatorType]);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_predicateForMinimumQuantity
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 value];
    v3 = [v1 quantityType];
    +[HDWorkoutStatisticsPredicate predicateForMinimumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForMinimumQuantity:quantityType:operatorType:", v2, v3, [v1 operatorType]);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_predicateForMaximumQuantity
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 value];
    v3 = [v1 quantityType];
    +[HDWorkoutStatisticsPredicate predicateForMaximumQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForMaximumQuantity:quantityType:operatorType:", v2, v3, [v1 operatorType]);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_predicateForAverageQuantity
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 value];
    v3 = [v1 quantityType];
    +[HDWorkoutStatisticsPredicate predicateForAverageQuantity:quantityType:operatorType:](HDWorkoutStatisticsPredicate, "predicateForAverageQuantity:quantityType:operatorType:", v2, v3, [v1 operatorType]);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (id)_predicateForWorkoutActivityWithProfile:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [v2 subFilter];
    uint64_t v5 = [v4 predicateWithProfile:v3];

    id v2 = +[HDWorkoutActivityPredicate predicateForSubPredicate:v5];
  }

  return v2;
}

@end