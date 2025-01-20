@interface _HKWorkoutComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)_quantityTypeFromKeyPath:(id)a3 prefix:(id)a4;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsWorkoutWithActivities:(id)a3;
- (BOOL)_acceptsWorkoutWithActivityType:(unint64_t)a3;
- (BOOL)_acceptsWorkoutWithDuration:(double)a3;
- (BOOL)_acceptsWorkoutWithGoalType:(unint64_t)a3;
- (BOOL)_acceptsWorkoutWithQuantity:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
- (HKQuantityType)quantityType;
- (_HKFilter)subFilter;
- (void)configureInMemoryFilter;
@end

@implementation _HKWorkoutComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"duration"] & 1) != 0
    || ([v4 isEqualToString:@"totalDistance"] & 1) != 0
    || ([v4 isEqualToString:@"totalEnergyBurned"] & 1) != 0
    || ([v4 isEqualToString:@"totalFlightsClimbed"] & 1) != 0
    || ([v4 isEqualToString:@"totalSwimmingStrokeCount"] & 1) != 0
    || ([v4 isEqualToString:@"workoutType"] & 1) != 0
    || ([v4 isEqualToString:@"goal"] & 1) != 0
    || ([v4 isEqualToString:@"goalType"] & 1) != 0
    || ([v4 isEqualToString:@"workoutActivity"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v19[0] = @"sumQuantity.";
    v19[1] = @"minimumQuantity.";
    v19[2] = @"maximumQuantity.";
    v19[3] = @"averageQuantity.";
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

            goto LABEL_22;
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
LABEL_22:
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
  if (([v3 isEqualToString:@"duration"] & 1) != 0
    || ([v3 isEqualToString:@"workoutType"] & 1) != 0
    || [v3 isEqualToString:@"goalType"])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_5:
    uint64_t v5 = [v4 setWithObject:objc_opt_class()];
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"goal"])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v5 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  }
  else
  {
    int v10 = [v3 isEqualToString:@"workoutActivity"];
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    if (!v10) {
      goto LABEL_5;
    }
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v5 = objc_msgSend(v4, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
  }
LABEL_6:
  v6 = (void *)v5;

  return v6;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"workoutType"])
  {
    BOOL v6 = a3 == 4;
  }
  else if ([v5 isEqualToString:@"goalType"])
  {
    BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    if (![v5 isEqualToString:@"workoutActivity"])
    {
      BOOL v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:v5];
      goto LABEL_10;
    }
    BOOL v6 = a3 == 99;
  }
  BOOL v7 = v6;
LABEL_10:

  return v7;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    char v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_135);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
  if (!objc_msgSendSuper2(&v21, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))goto LABEL_14; {
  id v14 = v12;
  }
  id v15 = v13;
  if ([v15 isEqualToString:@"totalDistance"])
  {
    long long v16 = (uint64_t *)&HKQuantityTypeIdentifierDistanceWalkingRunning;
LABEL_10:
    char IsValidQuantityForTypeWithIdentifier = _IsValidQuantityForTypeWithIdentifier(*v16, v14);
    goto LABEL_11;
  }
  if ([v15 isEqualToString:@"totalEnergyBurned"])
  {
    long long v16 = (uint64_t *)&HKQuantityTypeIdentifierActiveEnergyBurned;
    goto LABEL_10;
  }
  if ([v15 isEqualToString:@"totalFlightsClimbed"])
  {
    long long v16 = (uint64_t *)&HKQuantityTypeIdentifierFlightsClimbed;
    goto LABEL_10;
  }
  if ([v15 isEqualToString:@"totalSwimmingStrokeCount"])
  {
    long long v16 = (uint64_t *)&HKQuantityTypeIdentifierSwimmingStrokeCount;
    goto LABEL_10;
  }
  if ([v15 isEqualToString:@"workoutType"])
  {
    char IsValidQuantityForTypeWithIdentifier = _HKWorkoutActivityTypeIsValid([v14 integerValue]);
  }
  else if ([v15 isEqualToString:@"goal"])
  {
    char IsValidQuantityForTypeWithIdentifier = _HKWorkoutValidGoalQuantity(v14);
  }
  else
  {
    if (([v15 isEqualToString:@"goalType"] & 1) == 0)
    {

      goto LABEL_12;
    }
    char IsValidQuantityForTypeWithIdentifier = _HKWorkoutGoalTypeIsValid([v14 integerValue]);
  }
LABEL_11:
  char v18 = IsValidQuantityForTypeWithIdentifier;

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Invalid value '%@' for %@", v14, v15);
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
LABEL_12:
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"duration"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"totalDistance"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"totalEnergyBurned"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"totalFlightsClimbed"])
  {
    int64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"totalSwimmingStrokeCount"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"workoutType"])
  {
    int64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"goal"])
  {
    int64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"goalType"])
  {
    int64_t v6 = 7;
  }
  else if ([v5 hasPrefix:@"sumQuantity."])
  {
    int64_t v6 = 8;
  }
  else if ([v5 hasPrefix:@"minimumQuantity."])
  {
    int64_t v6 = 9;
  }
  else if ([v5 hasPrefix:@"maximumQuantity."])
  {
    int64_t v6 = 10;
  }
  else if ([v5 hasPrefix:@"averageQuantity."])
  {
    int64_t v6 = 11;
  }
  else if ([v5 isEqualToString:@"workoutActivity"])
  {
    int64_t v6 = 12;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKWorkoutComparisonFilter.m" lineNumber:233 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKWorkoutComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (void)configureInMemoryFilter
{
  v20.receiver = self;
  v20.super_class = (Class)_HKWorkoutComparisonFilter;
  [(_HKComparisonFilter *)&v20 configureInMemoryFilter];
  id v3 = [(_HKComparisonFilter *)self keyPath];
  int v4 = [v3 hasPrefix:@"sumQuantity."];

  if (v4)
  {
    id v5 = objc_opt_class();
    int64_t v6 = [(_HKComparisonFilter *)self keyPath];
    BOOL v7 = @"sumQuantity.";
LABEL_9:
    id v14 = [v5 _quantityTypeFromKeyPath:v6 prefix:v7];
    id v15 = (objc_class *)[v14 copy];
    uint64_t v16 = 64;
LABEL_10:
    long long v17 = *(Class *)((char *)&self->super.super.super.isa + v16);
    *(Class *)((char *)&self->super.super.super.isa + v16) = v15;

    return;
  }
  id v8 = [(_HKComparisonFilter *)self keyPath];
  int v9 = [v8 hasPrefix:@"minimumQuantity."];

  if (v9)
  {
    id v5 = objc_opt_class();
    int64_t v6 = [(_HKComparisonFilter *)self keyPath];
    BOOL v7 = @"minimumQuantity.";
    goto LABEL_9;
  }
  int v10 = [(_HKComparisonFilter *)self keyPath];
  int v11 = [v10 hasPrefix:@"maximumQuantity."];

  if (v11)
  {
    id v5 = objc_opt_class();
    int64_t v6 = [(_HKComparisonFilter *)self keyPath];
    BOOL v7 = @"maximumQuantity.";
    goto LABEL_9;
  }
  id v12 = [(_HKComparisonFilter *)self keyPath];
  int v13 = [v12 hasPrefix:@"averageQuantity."];

  if (v13)
  {
    id v5 = objc_opt_class();
    int64_t v6 = [(_HKComparisonFilter *)self keyPath];
    BOOL v7 = @"averageQuantity.";
    goto LABEL_9;
  }
  char v18 = [(_HKComparisonFilter *)self keyPath];
  int v19 = [v18 isEqualToString:@"workoutActivity"];

  if (v19)
  {
    int64_t v6 = [(_HKComparisonFilter *)self value];
    id v14 = [(_HKComparisonFilter *)self dataTypes];
    objc_msgSend(v6, "hk_filterRepresentationForDataTypes:isSubpredicate:", v14, 1);
    id v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 72;
    goto LABEL_10;
  }
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    switch([(_HKComparisonFilter *)self keyPathIntegerValue])
    {
      case 0:
        [v6 duration];
        BOOL v7 = [(_HKWorkoutComparisonFilter *)self _acceptsWorkoutWithDuration:"_acceptsWorkoutWithDuration:"];
        goto LABEL_15;
      case 1:
        uint64_t v10 = [v6 totalDistance];
        goto LABEL_12;
      case 2:
        uint64_t v10 = [v6 totalEnergyBurned];
        goto LABEL_12;
      case 3:
        uint64_t v10 = [v6 totalFlightsClimbed];
        goto LABEL_12;
      case 4:
        uint64_t v10 = [v6 totalSwimmingStrokeCount];
        goto LABEL_12;
      case 5:
        BOOL v7 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithActivityType:](self, "_acceptsWorkoutWithActivityType:", [v6 workoutActivityType]);
        goto LABEL_15;
      case 6:
        uint64_t v10 = [v6 _goal];
LABEL_12:
        int v11 = (void *)v10;
        BOOL v12 = [(_HKWorkoutComparisonFilter *)self _acceptsWorkoutWithQuantity:v10];
        goto LABEL_13;
      case 7:
        BOOL v7 = -[_HKWorkoutComparisonFilter _acceptsWorkoutWithGoalType:](self, "_acceptsWorkoutWithGoalType:", [v6 _goalType]);
LABEL_15:
        BOOL v8 = v7;
        break;
      case 8:
        int v11 = [v6 statisticsForType:self->_quantityType];
        uint64_t v13 = [v11 sumQuantity];
        goto LABEL_20;
      case 9:
        int v11 = [v6 statisticsForType:self->_quantityType];
        uint64_t v13 = [v11 minimumQuantity];
        goto LABEL_20;
      case 10:
        int v11 = [v6 statisticsForType:self->_quantityType];
        uint64_t v13 = [v11 maximumQuantity];
        goto LABEL_20;
      case 11:
        int v11 = [v6 statisticsForType:self->_quantityType];
        uint64_t v13 = [v11 averageQuantity];
LABEL_20:
        id v14 = (void *)v13;
        BOOL v8 = [(_HKWorkoutComparisonFilter *)self _acceptsWorkoutWithQuantity:v13];

        goto LABEL_21;
      case 12:
        int v11 = [v6 _subActivities];
        BOOL v12 = [(_HKWorkoutComparisonFilter *)self _acceptsWorkoutWithActivities:v11];
LABEL_13:
        BOOL v8 = v12;
LABEL_21:

        break;
      default:
        int v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"_HKWorkoutComparisonFilter.m" lineNumber:301 description:@"Unreachable code has been executed"];

        BOOL v8 = 0;
        break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsWorkoutWithDuration:(double)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  [v5 doubleValue];
  unint64_t v7 = HKCompareDoubles(a3, v6);

  uint64_t v8 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v7, v8);
}

- (BOOL)_acceptsWorkoutWithActivityType:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsWorkoutWithGoalType:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsWorkoutWithQuantity:(id)a3
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

- (BOOL)_acceptsWorkoutWithActivities:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[_HKFilter acceptsWorkoutActivity:](self->_subFilter, "acceptsWorkoutActivity:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (id)_quantityTypeFromKeyPath:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:v6])
  {
    uint64_t v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
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

- (_HKFilter)subFilter
{
  return self->_subFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFilter, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end