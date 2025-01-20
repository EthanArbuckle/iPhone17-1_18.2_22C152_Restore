@interface _HKDiscreteQuantitySampleComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKDiscreteQuantitySampleComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (_IsQuantityKeyPath(v3) & 1) != 0 || (_IsDateKeyPath(v3)) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"most_recent_duration"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if (_IsQuantityKeyPath(v5))
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_7:
    id v7 = [v6 setWithObject:objc_opt_class()];
    goto LABEL_8;
  }
  if (_IsDateKeyPath(v5))
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"most_recent_duration"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_7;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:a1 file:@"_HKDiscreteQuantitySampleComparisonFilter.m" lineNumber:158 description:@"Unreachable code has been executed"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
LABEL_8:
  v8 = v7;

  return v8;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
  if (objc_msgSendSuper2(&v14, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
  {
    if (_IsQuantityKeyPath(v9))
    {
      id v10 = v8;
      if ([v10 count] == 1)
      {
        v11 = [v10 anyObject];
        char HasValidAggregationStyle = _HasValidAggregationStyle(v11, (uint64_t)a5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"expected 1 sample type but got %ld %@", objc_msgSend(v10, "count"), v10);
        char HasValidAggregationStyle = 0;
      }
    }
    else
    {
      char HasValidAggregationStyle = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_26);
    }
  }
  else
  {
    char HasValidAggregationStyle = 0;
  }

  return HasValidAggregationStyle;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
  if (objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, v14, a7))
  {
    if (_IsQuantityKeyPath(v13))
    {
      v15 = [v14 anyObject];
      v16 = [v12 _unit];
      char v17 = [v15 isCompatibleWithUnit:v16];

      if ((v17 & 1) == 0) {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Invalid quantity %@ for data type %@", v12, v15);
      }
    }
    else
    {
      char v17 = 1;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"max"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"min"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"most_recent"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"most_recent_duration"])
  {
    int64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"most_recent_end_date"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"most_recent_start_date"])
  {
    int64_t v6 = 3;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKDiscreteQuantitySampleComparisonFilter.m" lineNumber:217 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKDiscreteQuantitySampleComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unint64_t v7 = [(_HKComparisonFilter *)self keyPathIntegerValue];
    unint64_t v8 = v7;
    if (v7 < 3)
    {
      v15 = [(_HKComparisonFilter *)self value];
      uint64_t v16 = [(_HKComparisonFilter *)self operatorType];
      id v11 = v15;
      id v17 = v6;
      v18 = [v17 quantityType];
      objc_super v19 = [v11 _unit];
      int v20 = [v18 isCompatibleWithUnit:v19];

      if (v20)
      {
        id v21 = v17;
        v22 = v21;
        if (v8)
        {
          if (v8 == 1) {
            [v21 minimumQuantity];
          }
          else {
          uint64_t v23 = [v21 mostRecentQuantity];
          }
        }
        else
        {
          uint64_t v23 = [v21 maximumQuantity];
        }
        v29 = (void *)v23;

        BOOL v14 = HKComparisonResultMatchesPredicateOperator([v29 compare:v11], v16);
      }
      else
      {
        BOOL v14 = 0;
      }

      goto LABEL_23;
    }
    if (v7 - 3 >= 2)
    {
      if (v7 != 5)
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"_HKDiscreteQuantitySampleComparisonFilter.m" lineNumber:248 description:@"Unreachable code has been executed"];
        BOOL v14 = 0;
        goto LABEL_23;
      }
      id v11 = [(_HKComparisonFilter *)self value];
      [v11 doubleValue];
      double v25 = v24;
      uint64_t v10 = [(_HKComparisonFilter *)self operatorType];
      v26 = [v6 mostRecentQuantityDateInterval];
      [v26 duration];
      unint64_t v28 = HKCompareDoubles(v27, v25);
    }
    else
    {
      objc_super v9 = [(_HKComparisonFilter *)self value];
      uint64_t v10 = [(_HKComparisonFilter *)self operatorType];
      id v11 = v9;
      id v12 = [v6 mostRecentQuantityDateInterval];
      id v13 = v12;
      if (v8 == 4) {
        [v12 endDate];
      }
      else {
      v26 = [v12 startDate];
      }

      unint64_t v28 = [v26 compare:v11];
    }

    BOOL v14 = HKComparisonResultMatchesPredicateOperator(v28, v10);
LABEL_23:

    goto LABEL_24;
  }
  BOOL v14 = 0;
LABEL_24:

  return v14;
}

@end