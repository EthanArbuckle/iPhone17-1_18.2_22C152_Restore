@interface HKChartableCodedQuantity
+ (id)_valueFromCodedQuantity:(id)a3 inUnit:(id)a4 error:(id *)a5;
+ (id)chartableCodedQuantityWithCodings:(id)a3 originalCodedQuantity:(id)a4 originalRangeLowCodedQuantity:(id)a5 originalRangeHighCodedQuantity:(id)a6 error:(id *)a7;
+ (id)converter;
- (BOOL)hasRange;
- (BOOL)isCompatibleWithUnit:(id)a3;
- (BOOL)isInRange;
- (HKChartableCodedQuantity)init;
- (HKChartableCodedQuantity)initWithCodings:(id)a3 quantity:(id)a4 rangeLow:(id)a5 rangeHigh:(id)a6;
- (HKCodedQuantity)originalCodedQuantity;
- (HKCodedQuantity)originalRangeHighCodedQuantity;
- (HKCodedQuantity)originalRangeLowCodedQuantity;
- (HKQuantity)quantity;
- (NSArray)codings;
- (NSNumber)rangeHigh;
- (NSNumber)rangeLow;
- (double)doubleValue;
- (double)doubleValueForUnit:(id)a3;
- (id)chartableCodedQuantityInUnit:(id)a3 adoptUnitIfNullUnit:(BOOL)a4 error:(id *)a5;
- (id)chartableCodedQuantityInUnit:(id)a3 error:(id *)a4;
- (id)description;
- (void)setOriginalCodedQuantity:(id)a3;
- (void)setOriginalRangeHighCodedQuantity:(id)a3;
- (void)setOriginalRangeLowCodedQuantity:(id)a3;
@end

@implementation HKChartableCodedQuantity

- (HKChartableCodedQuantity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKChartableCodedQuantity)initWithCodings:(id)a3 quantity:(id)a4 rangeLow:(id)a5 rangeHigh:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKChartableCodedQuantity;
  v14 = [(HKChartableCodedQuantity *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    codings = v14->_codings;
    v14->_codings = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v17;

    uint64_t v19 = [v12 copy];
    rangeLow = v14->_rangeLow;
    v14->_rangeLow = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    rangeHigh = v14->_rangeHigh;
    v14->_rangeHigh = (NSNumber *)v21;
  }
  return v14;
}

+ (id)chartableCodedQuantityWithCodings:(id)a3 originalCodedQuantity:(id)a4 originalRangeLowCodedQuantity:(id)a5 originalRangeHighCodedQuantity:(id)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [a1 converter];
  uint64_t v17 = [v13 quantityRepresentationWithUCUMConverter:v16 error:a7];

  if (v17)
  {
    id v36 = v12;
    if (v14)
    {
      v18 = [v17 _unit];
      id v38 = 0;
      uint64_t v19 = [a1 _valueFromCodedQuantity:v14 inUnit:v18 error:&v38];
      id v20 = v38;

      if (v19)
      {
        int v21 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v23 = HKLogHealthRecords;
        int v21 = 1;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v40 = v20;
          _os_log_impl(&dword_19C023000, v23, OS_LOG_TYPE_INFO, "Unable to get reference range low as quantity, ignoring: %{public}@", buf, 0xCu);
        }
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 0;
      id v20 = 0;
      int v21 = 1;
    }

    if (v15)
    {
      objc_super v24 = [v17 _unit];
      id v37 = 0;
      v25 = [a1 _valueFromCodedQuantity:v15 inUnit:v24 error:&v37];
      id v26 = v37;

      if (v25)
      {
        int v27 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v28 = HKLogHealthRecords;
        int v27 = 1;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v40 = v26;
          _os_log_impl(&dword_19C023000, v28, OS_LOG_TYPE_INFO, "Unable to get reference range high as quantity: %{public}@", buf, 0xCu);
        }
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
      id v26 = 0;
      int v27 = 1;
    }
    v22 = (void *)[objc_alloc((Class)a1) initWithCodings:v36 quantity:v17 rangeLow:v19 rangeHigh:v25];
    uint64_t v29 = [v13 copy];
    v30 = (void *)v22[5];
    v22[5] = v29;

    if (v21)
    {
      v31 = (void *)v22[6];
      v22[6] = 0;
    }
    else
    {
      uint64_t v32 = [v14 copy];
      v31 = (void *)v22[6];
      v22[6] = v32;
    }

    id v12 = v36;
    if (v27)
    {
      v33 = (void *)v22[7];
      v22[7] = 0;
    }
    else
    {
      uint64_t v34 = [v15 copy];
      v33 = (void *)v22[7];
      v22[7] = v34;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)_valueFromCodedQuantity:(id)a3 inUnit:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 converter];
  id v11 = [v9 quantityRepresentationWithUCUMConverter:v10 error:a5];

  if (v11)
  {
    if ([v11 isCompatibleWithUnit:v8])
    {
      id v12 = NSNumber;
      [v11 doubleValueForUnit:v8];
      id v13 = objc_msgSend(v12, "numberWithDouble:");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"value %@ is not compatible with unit %@", v11, v8);
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)chartableCodedQuantityInUnit:(id)a3 error:(id *)a4
{
  return [(HKChartableCodedQuantity *)self chartableCodedQuantityInUnit:a3 adoptUnitIfNullUnit:0 error:a4];
}

- (id)chartableCodedQuantityInUnit:(id)a3 adoptUnitIfNullUnit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(HKQuantity *)self->_quantity _unit];
  int v10 = [v9 isEqual:v8];

  if (v10)
  {
    id v11 = (void *)[(HKChartableCodedQuantity *)self copy];
    goto LABEL_27;
  }
  id v12 = self->_quantity;
  id v13 = v12;
  if (v6)
  {
    id v14 = [(HKQuantity *)v12 _unit];
    int v15 = [v14 isNull];

    if (v15)
    {
      [v13 _value];
      uint64_t v16 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);

      id v13 = (void *)v16;
      goto LABEL_7;
    }
  }
  if ([v13 isCompatibleWithUnit:v8])
  {
LABEL_7:
    [v13 doubleValueForUnit:v8];
    uint64_t v17 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    if (self->_rangeLow)
    {
      v18 = [v13 _unit];
      [(NSNumber *)self->_rangeLow doubleValue];
      uint64_t v19 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v18);
    }
    else
    {
      uint64_t v19 = 0;
    }
    if (self->_rangeHigh)
    {
      id v20 = [v13 _unit];
      [(NSNumber *)self->_rangeHigh doubleValue];
      int v21 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20);
    }
    else
    {
      int v21 = 0;
    }
    if (v19)
    {
      v22 = NSNumber;
      [v19 doubleValueForUnit:v8];
      v23 = objc_msgSend(v22, "numberWithDouble:");
      if (v21)
      {
LABEL_16:
        objc_super v24 = NSNumber;
        [v21 doubleValueForUnit:v8];
        v25 = objc_msgSend(v24, "numberWithDouble:");
LABEL_19:
        id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCodings:self->_codings quantity:v17 rangeLow:v23 rangeHigh:v25];
        uint64_t v26 = [(HKCodedQuantity *)self->_originalCodedQuantity copy];
        int v27 = (void *)v11[5];
        v11[5] = v26;

        if (v23)
        {
          uint64_t v28 = [(HKCodedQuantity *)self->_originalRangeLowCodedQuantity copy];
          uint64_t v29 = (void *)v11[6];
          v11[6] = v28;
        }
        else
        {
          uint64_t v29 = (void *)v11[6];
          v11[6] = 0;
        }

        if (v25)
        {
          uint64_t v30 = [(HKCodedQuantity *)self->_originalRangeHighCodedQuantity copy];
          v31 = (void *)v11[7];
          v11[7] = v30;
        }
        else
        {
          v31 = (void *)v11[7];
          v11[7] = 0;
        }

        goto LABEL_26;
      }
    }
    else
    {
      v23 = 0;
      if (v21) {
        goto LABEL_16;
      }
    }
    v25 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Cannot convert %@ to unit %@", self, v8);
  id v11 = 0;
LABEL_26:

LABEL_27:

  return v11;
}

- (BOOL)isCompatibleWithUnit:(id)a3
{
  return [(HKQuantity *)self->_quantity isCompatibleWithUnit:a3];
}

- (BOOL)hasRange
{
  return self->_rangeLow || self->_rangeHigh != 0;
}

- (BOOL)isInRange
{
  [(HKChartableCodedQuantity *)self doubleValue];
  double v4 = v3;
  rangeLow = self->_rangeLow;
  BOOL result = 0;
  if (!rangeLow || ([(NSNumber *)rangeLow doubleValue], v6 <= v4))
  {
    rangeHigh = self->_rangeHigh;
    if (!rangeHigh) {
      return 1;
    }
    [(NSNumber *)rangeHigh doubleValue];
    if (v8 >= v4) {
      return 1;
    }
  }
  return result;
}

- (double)doubleValue
{
  quantity = self->_quantity;
  double v3 = [(HKQuantity *)quantity _unit];
  [(HKQuantity *)quantity doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (double)doubleValueForUnit:(id)a3
{
  [(HKQuantity *)self->_quantity doubleValueForUnit:a3];
  return result;
}

+ (id)converter
{
  if (converter_onceToken_0 != -1) {
    dispatch_once(&converter_onceToken_0, &__block_literal_global_61);
  }
  v2 = (void *)converter_converter_0;

  return v2;
}

uint64_t __37__HKChartableCodedQuantity_converter__block_invoke()
{
  converter_converter_0 = objc_alloc_init(HKUCUMUnitDisplayConverter);

  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v9 = *(_OWORD *)&self->_quantity;
  rangeHigh = self->_rangeHigh;
  double v6 = [(NSArray *)self->_codings componentsJoinedByString:@"; "];
  v7 = [v3 stringWithFormat:@"<%@ %p> quantity: %@, low: %@, high: %@, codings: %@", v4, self, v9, rangeHigh, v6];

  return v7;
}

- (NSArray)codings
{
  return self->_codings;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSNumber)rangeLow
{
  return self->_rangeLow;
}

- (NSNumber)rangeHigh
{
  return self->_rangeHigh;
}

- (HKCodedQuantity)originalCodedQuantity
{
  return self->_originalCodedQuantity;
}

- (void)setOriginalCodedQuantity:(id)a3
{
}

- (HKCodedQuantity)originalRangeLowCodedQuantity
{
  return self->_originalRangeLowCodedQuantity;
}

- (void)setOriginalRangeLowCodedQuantity:(id)a3
{
}

- (HKCodedQuantity)originalRangeHighCodedQuantity
{
  return self->_originalRangeHighCodedQuantity;
}

- (void)setOriginalRangeHighCodedQuantity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRangeHighCodedQuantity, 0);
  objc_storeStrong((id *)&self->_originalRangeLowCodedQuantity, 0);
  objc_storeStrong((id *)&self->_originalCodedQuantity, 0);
  objc_storeStrong((id *)&self->_rangeHigh, 0);
  objc_storeStrong((id *)&self->_rangeLow, 0);
  objc_storeStrong((id *)&self->_quantity, 0);

  objc_storeStrong((id *)&self->_codings, 0);
}

@end