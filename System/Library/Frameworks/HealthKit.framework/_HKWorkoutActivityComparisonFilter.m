@interface _HKWorkoutActivityComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (BOOL)requiresSubpredicate;
+ (id)_quantityTypeFromKeyPath:(id)a3 prefix:(id)a4;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsActivityWithActivityType:(unint64_t)a3;
- (BOOL)_acceptsActivityWithDate:(id)a3;
- (BOOL)_acceptsActivityWithDuration:(double)a3;
- (BOOL)_acceptsActivityWithQuantity:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (BOOL)acceptsWorkoutActivity:(id)a3;
- (HKQuantityType)quantityType;
- (void)configureInMemoryFilter;
@end

@implementation _HKWorkoutActivityComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"activityDuration"] & 1) != 0
    || ([v4 isEqualToString:@"activityType"] & 1) != 0
    || ([v4 isEqualToString:@"activityStartDate"] & 1) != 0
    || ([v4 isEqualToString:@"activityEndDate"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v19[0] = @"activitySumQuantity.";
    v19[1] = @"activityMinimumQuantity.";
    v19[2] = @"activityMaximumQuantity.";
    v19[3] = @"activityAverageQuantity.";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v4, "hasPrefix:", v12, (void)v14))
          {
            v13 = [a1 _quantityTypeFromKeyPath:v4 prefix:v12];
            BOOL v5 = v13 != 0;

            goto LABEL_17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_17:
  }
  return v5;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"activityDuration"] & 1) == 0
    && ([v3 isEqualToString:@"activityType"] & 1) == 0
    && ([v3 isEqualToString:@"activityStartDate"] & 1) == 0)
  {
    [v3 isEqualToString:@"activityEndDate"];
  }
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];

  return v4;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v6 = a4;
  if ([v6 isEqualToString:@"activityType"])
  {
    unsigned __int8 v7 = a3 == 4;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_isAllowedPredicateOperatorType_forKeyPath_, a3, v6);
  }

  return v7;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_94);
}

+ (BOOL)requiresSubpredicate
{
  return 1;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
  if (objc_msgSendSuper2(&v16, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if ([v13 isEqualToString:@"activityType"]) {
      char IsValid = _HKWorkoutActivityTypeIsValid([v12 integerValue]);
    }
    else {
      char IsValid = 1;
    }
  }
  else
  {
    char IsValid = 0;
  }

  return IsValid;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"activityDuration"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"activityType"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"activityStartDate"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"activityEndDate"])
  {
    int64_t v6 = 3;
  }
  else if ([v5 hasPrefix:@"activitySumQuantity."])
  {
    int64_t v6 = 4;
  }
  else if ([v5 hasPrefix:@"activityMinimumQuantity."])
  {
    int64_t v6 = 5;
  }
  else if ([v5 hasPrefix:@"activityMaximumQuantity."])
  {
    int64_t v6 = 6;
  }
  else if ([v5 hasPrefix:@"activityAverageQuantity."])
  {
    int64_t v6 = 7;
  }
  else
  {
    unsigned __int8 v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKWorkoutActivityComparisonFilter.m" lineNumber:158 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutActivityComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (void)configureInMemoryFilter
{
  v17.receiver = self;
  v17.super_class = (Class)_HKWorkoutActivityComparisonFilter;
  [(_HKComparisonFilter *)&v17 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self keyPath];
  int v4 = [v3 hasPrefix:@"activitySumQuantity."];

  if (v4)
  {
    id v5 = objc_opt_class();
    int64_t v6 = [(_HKComparisonFilter *)self keyPath];
    unsigned __int8 v7 = @"activitySumQuantity.";
  }
  else
  {
    uint64_t v8 = [(_HKComparisonFilter *)self keyPath];
    int v9 = [v8 hasPrefix:@"activityMinimumQuantity."];

    if (v9)
    {
      id v5 = objc_opt_class();
      int64_t v6 = [(_HKComparisonFilter *)self keyPath];
      unsigned __int8 v7 = @"activityMinimumQuantity.";
    }
    else
    {
      uint64_t v10 = [(_HKComparisonFilter *)self keyPath];
      int v11 = [v10 hasPrefix:@"activityMaximumQuantity."];

      if (v11)
      {
        id v5 = objc_opt_class();
        int64_t v6 = [(_HKComparisonFilter *)self keyPath];
        unsigned __int8 v7 = @"activityMaximumQuantity.";
      }
      else
      {
        id v12 = [(_HKComparisonFilter *)self keyPath];
        int v13 = [v12 hasPrefix:@"activityAverageQuantity."];

        if (!v13) {
          return;
        }
        id v5 = objc_opt_class();
        int64_t v6 = [(_HKComparisonFilter *)self keyPath];
        unsigned __int8 v7 = @"activityAverageQuantity.";
      }
    }
  }
  long long v14 = [v5 _quantityTypeFromKeyPath:v6 prefix:v7];
  long long v15 = (HKQuantityType *)[v14 copy];
  quantityType = self->_quantityType;
  self->_quantityType = v15;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return 0;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  id v5 = a3;
  switch([(_HKComparisonFilter *)self keyPathIntegerValue])
  {
    case 0:
      [v5 duration];
      BOOL v6 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithDuration:](self, "_acceptsActivityWithDuration:");
      break;
    case 1:
      uint64_t v8 = [v5 workoutConfiguration];
      BOOL v9 = -[_HKWorkoutActivityComparisonFilter _acceptsActivityWithActivityType:](self, "_acceptsActivityWithActivityType:", [v8 activityType]);
      goto LABEL_8;
    case 2:
      uint64_t v10 = [v5 startDate];
      goto LABEL_7;
    case 3:
      uint64_t v10 = [v5 endDate];
LABEL_7:
      uint64_t v8 = (void *)v10;
      BOOL v9 = [(_HKWorkoutActivityComparisonFilter *)self _acceptsActivityWithDate:v10];
LABEL_8:
      BOOL v6 = v9;
      goto LABEL_14;
    case 4:
      uint64_t v8 = [v5 statisticsForType:self->_quantityType];
      uint64_t v11 = [v8 sumQuantity];
      goto LABEL_13;
    case 5:
      uint64_t v8 = [v5 statisticsForType:self->_quantityType];
      uint64_t v11 = [v8 minimumQuantity];
      goto LABEL_13;
    case 6:
      uint64_t v8 = [v5 statisticsForType:self->_quantityType];
      uint64_t v11 = [v8 maximumQuantity];
      goto LABEL_13;
    case 7:
      uint64_t v8 = [v5 statisticsForType:self->_quantityType];
      uint64_t v11 = [v8 averageQuantity];
LABEL_13:
      id v12 = (void *)v11;
      BOOL v6 = [(_HKWorkoutActivityComparisonFilter *)self _acceptsActivityWithQuantity:v11];

LABEL_14:
      break;
    default:
      unsigned __int8 v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"_HKWorkoutActivityComparisonFilter.m" lineNumber:210 description:@"Unreachable code has been executed"];

      BOOL v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)_acceptsActivityWithDuration:(double)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  [v5 doubleValue];
  unint64_t v7 = HKCompareDoubles(a3, v6);

  uint64_t v8 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v7, v8);
}

- (BOOL)_acceptsActivityWithActivityType:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsActivityWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = [v4 compare:v5];

  LOBYTE(self) = HKComparisonResultMatchesPredicateOperator(v6, [(_HKComparisonFilter *)self operatorType]);
  return (char)self;
}

- (BOOL)_acceptsActivityWithQuantity:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = [v5 _unit];
  int v7 = [v4 isCompatibleWithUnit:v6];

  if (v7) {
    BOOL v8 = HKComparisonResultMatchesPredicateOperator([v4 compare:v5], -[_HKComparisonFilter operatorType](self, "operatorType"));
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_quantityTypeFromKeyPath:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:v6])
  {
    int v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
    BOOL v8 = v7;
    if (v7)
    {
      BOOL v9 = +[HKQuantityType _quantityTypeWithCode:](HKQuantityType, "_quantityTypeWithCode:", [v7 integerValue]);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
}

@end