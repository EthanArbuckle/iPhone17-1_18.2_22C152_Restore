@interface HKChartableCodedQuantitySet
+ (id)setWithChartableQuantity:(id)a3 date:(id)a4;
+ (id)setWithMedicalCodings:(id)a3 quantities:(id)a4 date:(id)a5 error:(id *)a6;
- (BOOL)isCompatibleWithUnit:(id)a3;
- (HKChartableCodedQuantitySet)init;
- (HKUnit)compatibleUnit;
- (NSArray)codings;
- (NSArray)quantities;
- (NSDate)date;
- (double)maxValueForUnit:(id)a3;
- (double)maxValueIncludingReferenceRangeForUnit:(id)a3;
- (double)minValueForUnit:(id)a3;
- (double)minValueIncludingReferenceRangeForUnit:(id)a3;
- (id)_initWithMedicalCodings:(id)a3 date:(id)a4 quantities:(id)a5;
- (id)chartableCodedQuantitySetByChangingDate:(id)a3;
- (id)chartableCodedQuantitySetConvertedToUnit:(id)a3 error:(id *)a4;
- (id)description;
- (void)addChartableCodedQuantities:(id)a3;
@end

@implementation HKChartableCodedQuantitySet

- (HKChartableCodedQuantitySet)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithMedicalCodings:(id)a3 date:(id)a4 quantities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKChartableCodedQuantitySet;
  v11 = [(HKChartableCodedQuantitySet *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    codings = v11->_codings;
    v11->_codings = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    quantities = v11->_quantities;
    v11->_quantities = (NSArray *)v16;
  }
  return v11;
}

+ (id)setWithMedicalCodings:(id)a3 quantities:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count])
  {
    v13 = [v11 firstObject];
    uint64_t v14 = [v13 quantity];
    v15 = [v14 _unit];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__HKChartableCodedQuantitySet_setWithMedicalCodings_quantities_date_error___block_invoke;
    v20[3] = &unk_1E58C5820;
    id v16 = v15;
    id v21 = v16;
    v17 = objc_msgSend(v11, "hk_filter:", v20);
    if ([v17 count])
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"Some quantities are incompatible with unit %@: %@", v16, v17);
      v18 = 0;
    }
    else
    {
      v18 = (void *)[objc_alloc((Class)a1) _initWithMedicalCodings:v10 date:v12 quantities:v11];
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __75__HKChartableCodedQuantitySet_setWithMedicalCodings_quantities_date_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCompatibleWithUnit:*(void *)(a1 + 32)] ^ 1;
}

+ (id)setWithChartableQuantity:(id)a3 date:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HKChartableCodedQuantitySet.m", 52, @"Invalid parameter not satisfying: %@", @"quantity" object file lineNumber description];
  }
  id v9 = objc_alloc((Class)a1);
  id v10 = [v7 codings];
  v15[0] = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v12 = (void *)[v9 _initWithMedicalCodings:v10 date:v8 quantities:v11];

  return v12;
}

- (id)chartableCodedQuantitySetByChangingDate:(id)a3
{
  id v4 = a3;
  id v5 = [[HKChartableCodedQuantitySet alloc] _initWithMedicalCodings:self->_codings date:v4 quantities:self->_quantities];

  return v5;
}

- (void)addChartableCodedQuantities:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20 = self;
  id v5 = [(HKChartableCodedQuantitySet *)self compatibleUnit];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        id v21 = 0;
        v13 = [v12 chartableCodedQuantityInUnit:v5 error:&v21];
        id v14 = v21;
        if (v13)
        {
          [v6 addObject:v13];
        }
        else
        {
          _HKInitializeLogging();
          v15 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            id v16 = v15;
            v17 = HKSensitiveLogItem(v12);
            *(_DWORD *)buf = 138543618;
            v27 = v17;
            __int16 v28 = 2114;
            id v29 = v14;
            _os_log_error_impl(&dword_19C023000, v16, OS_LOG_TYPE_ERROR, "Unable to add chartable coded quantity %{public}@ to set: %{public}@", buf, 0x16u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v18 = [(NSArray *)v20->_quantities arrayByAddingObjectsFromArray:v6];
  quantities = v20->_quantities;
  v20->_quantities = (NSArray *)v18;
}

- (id)chartableCodedQuantitySetConvertedToUnit:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_quantities, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_quantities;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "chartableCodedQuantityInUnit:error:", v6, a4, (void)v17);
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        id v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v15 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithMedicalCodings:self->_codings date:self->_date quantities:v7];
LABEL_11:

  return v15;
}

- (HKUnit)compatibleUnit
{
  v2 = [(NSArray *)self->_quantities firstObject];
  v3 = [v2 quantity];
  id v4 = [v3 _unit];

  return (HKUnit *)v4;
}

- (BOOL)isCompatibleWithUnit:(id)a3
{
  quantities = self->_quantities;
  id v4 = a3;
  id v5 = [(NSArray *)quantities firstObject];
  id v6 = [v5 quantity];
  char v7 = [v6 isCompatibleWithUnit:v4];

  return v7;
}

- (double)minValueForUnit:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_quantities;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        if (v7 >= v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)maxValueForUnit:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_quantities;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        if (v7 < v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = -1.79769313e308;
  }

  return v7;
}

- (double)minValueIncludingReferenceRangeForUnit:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_quantities;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "rangeLow", (void)v17);
        [v9 doubleValue];
        double v12 = v11;
        if (v10)
        {
          long long v13 = [v9 rangeLow];
          [v13 doubleValue];
          double v15 = v14;

          if (v12 >= v15) {
            double v12 = v15;
          }
        }

        if (v7 >= v12) {
          double v7 = v12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)maxValueIncludingReferenceRangeForUnit:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_quantities;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "rangeHigh", (void)v17);
        [v9 doubleValue];
        double v12 = v11;
        if (v10)
        {
          long long v13 = [v9 rangeHigh];
          [v13 doubleValue];
          double v15 = v14;

          if (v12 < v15) {
            double v12 = v15;
          }
        }

        if (v7 < v12) {
          double v7 = v12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = -1.79769313e308;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSArray *)self->_codings componentsJoinedByString:@"; "];
  date = self->_date;
  NSUInteger v8 = [(NSArray *)self->_quantities count];
  double v9 = [(HKChartableCodedQuantitySet *)self compatibleUnit];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p> codings: %@, date: %@, %lu quantities in unit %@", v5, self, v6, date, v8, v9];

  return v10;
}

- (NSArray)codings
{
  return self->_codings;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)quantities
{
  return self->_quantities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantities, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_codings, 0);
}

@end