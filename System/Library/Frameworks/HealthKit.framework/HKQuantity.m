@interface HKQuantity
+ (BOOL)supportsSecureCoding;
+ (HKQuantity)quantityWithUnit:(HKUnit *)unit doubleValue:(double)value;
+ (id)_quantityWithBeatsPerMinute:(double)a3;
+ (id)hk_quantityWithMinutes:(id)a3;
+ (id)hk_quantityWithSeconds:(id)a3;
- (BOOL)_isZero;
- (BOOL)hk_isGreaterThanQuantity:(id)a3;
- (BOOL)hk_isLessThanQuantity:(id)a3;
- (BOOL)isCompatibleWithUnit:(HKUnit *)unit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuantity:(id)a3 withAccuracy:(id)a4;
- (HKQuantity)init;
- (HKQuantity)initWithCoder:(id)a3;
- (HKUnit)_unit;
- (NSComparisonResult)compare:(HKQuantity *)quantity;
- (double)_baselineRelativeDoubleValueForUnit:(id)a3;
- (double)_beatsPerMinute;
- (double)_value;
- (double)_valueScaledForDisplay;
- (double)doubleValueForUnit:(HKUnit *)unit;
- (id)_foundationMeasurement;
- (id)_initWithUnit:(id)a3 doubleValue:(double)a4;
- (id)_quantityByAddingQuantity:(id)a3;
- (id)asJSONObject;
- (id)asJSONObjectForUnit:(id)a3;
- (id)description;
- (id)hk_minutesNumber;
- (id)hk_secondsNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQuantity

- (double)doubleValueForUnit:(HKUnit *)unit
{
  v4 = unit;
  if (!v4)
  {
    v4 = +[HKUnit _nullUnit];
  }
  [(HKUnit *)self->_unit _valueByConvertingValue:v4 toUnit:self->_value];
  double v6 = v5;

  return v6;
}

+ (HKQuantity)quantityWithUnit:(HKUnit *)unit doubleValue:(double)value
{
  double v6 = unit;
  v7 = (void *)[objc_alloc((Class)a1) _initWithUnit:v6 doubleValue:value];

  return (HKQuantity *)v7;
}

- (id)_initWithUnit:(id)a3 doubleValue:(double)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v6 = +[HKUnit _nullUnit];
  }
  v10.receiver = self;
  v10.super_class = (Class)HKQuantity;
  v7 = [(HKQuantity *)&v10 init];
  v8 = (double *)v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_unit, v6);
    v8[2] = a4;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double value = self->_value;
  id v5 = a3;
  [v5 encodeDouble:@"ValueKey" forKey:value];
  [v5 encodeObject:self->_unit forKey:@"UnitKey"];
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isZero
{
  return fabs(self->_value) < 2.22044605e-16;
}

- (BOOL)isCompatibleWithUnit:(HKUnit *)unit
{
  return [(HKUnit *)self->_unit _isCompatibleWithUnit:unit];
}

- (HKUnit)_unit
{
  return self->_unit;
}

- (NSComparisonResult)compare:(HKQuantity *)quantity
{
  v4 = quantity;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = (void *)MEMORY[0x1E4F1C3C8];
  if ((isKindOfClass & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Quantity %@ is of incorrect class", v4 format];
  }
  v7 = [(HKQuantity *)v4 _unit];
  v8 = [(HKQuantity *)self _unit];
  char v9 = [v7 _isCompatibleWithUnit:v8];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*v6, @"Quantity %@ has incompatible unit", v4 format];
  }
  objc_super v10 = [(HKQuantity *)self _unit];
  [(HKQuantity *)self doubleValueForUnit:v10];
  double v12 = v11;

  v13 = [(HKQuantity *)self _unit];
  [(HKQuantity *)v4 doubleValueForUnit:v13];
  double v15 = v14;

  uint64_t v16 = HKCompareDoubles(v12, v15);
  if (v16)
  {
    v17 = [(HKQuantity *)v4 _unit];
    [(HKQuantity *)self doubleValueForUnit:v17];
    double v19 = v18;
    [(HKQuantity *)v4 doubleValueForUnit:v17];
    uint64_t v21 = HKCompareDoubles(v19, v20);
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (v21 == v16) {
    NSComparisonResult v22 = v16;
  }
  else {
    NSComparisonResult v22 = NSOrderedSame;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKQuantity *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && ([(HKQuantity *)v4 _unit],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [(HKQuantity *)self _unit],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 _isCompatibleWithUnit:v6],
          v6,
          v5,
          v7)
      && [(HKQuantity *)self compare:v4] == NSOrderedSame;
  }

  return v8;
}

- (id)description
{
  [(HKQuantity *)self _valueScaledForDisplay];
  return (id)[NSString stringWithFormat:@"%g %@", v3, self->_unit];
}

- (HKQuantity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnitKey"];
  [v4 decodeDoubleForKey:@"ValueKey"];
  double v7 = v6;

  BOOL v8 = [(HKQuantity *)self _initWithUnit:v5 doubleValue:v7];
  return v8;
}

- (HKQuantity)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (unint64_t)hash
{
  return 0;
}

- (id)_quantityByAddingQuantity:(id)a3
{
  [a3 doubleValueForUnit:self->_unit];
  double v5 = v4 + self->_value;
  unit = self->_unit;

  return +[HKQuantity quantityWithUnit:unit doubleValue:v5];
}

- (id)_foundationMeasurement
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKUnit *)self->_unit _foundationUnit];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E28]) initWithDoubleValue:v3 unit:self->_value];
  }
  else
  {
    +[HKUnit _foundationBaseUnits];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v13;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v6);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (-[HKQuantity isCompatibleWithUnit:](self, "isCompatibleWithUnit:", v9, (void)v12)) {
          break;
        }
        if (v4 == (void *)++v8)
        {
          double v4 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v4) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
      double v4 = [v9 _foundationUnit];
      if (!v4) {
        goto LABEL_14;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28E28]);
      [(HKQuantity *)self doubleValueForUnit:v9];
      double v5 = objc_msgSend(v10, "initWithDoubleValue:unit:", v4);
    }
    else
    {
LABEL_14:
      double v5 = 0;
    }
  }

  return v5;
}

- (BOOL)hk_isLessThanQuantity:(id)a3
{
  return [(HKQuantity *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)hk_isGreaterThanQuantity:(id)a3
{
  return [(HKQuantity *)self compare:a3] == NSOrderedDescending;
}

- (BOOL)isEqualToQuantity:(id)a3 withAccuracy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 _unit];
  char v9 = [(HKQuantity *)self _unit];
  char v10 = [v8 _isCompatibleWithUnit:v9];

  if ((v10 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Quantity %@ has incompatible unit", v6 format];
  }
  double v11 = [(HKQuantity *)self _unit];
  [(HKQuantity *)self doubleValueForUnit:v11];
  double v13 = v12;

  long long v14 = [(HKQuantity *)self _unit];
  [v6 doubleValueForUnit:v14];
  double v16 = v15;

  uint64_t v17 = [(HKQuantity *)self _unit];
  [v7 doubleValueForUnit:v17];
  double v19 = v18;

  BOOL v20 = HKCompareDoublesWithAccuracy(v13, v16, v19) == 0;
  return v20;
}

- (double)_valueScaledForDisplay
{
  unit = self->_unit;
  double v4 = +[HKUnit percentUnit];
  if ([(HKUnit *)unit isEqual:v4]) {
    double v5 = 100.0;
  }
  else {
    double v5 = 1.0;
  }

  return v5 * self->_value;
}

- (double)_baselineRelativeDoubleValueForUnit:(id)a3
{
  id v4 = a3;
  double value = self->_value;
  double v6 = 1.79769313e308;
  if (value != 1.79769313e308)
  {
    double v6 = -1.79769313e308;
    if (value != -1.79769313e308)
    {
      [(HKQuantity *)self doubleValueForUnit:v4];
      double v6 = v7;
    }
  }

  return v6;
}

- (double)_value
{
  return self->_value;
}

+ (id)_quantityWithBeatsPerMinute:(double)a3
{
  id v4 = +[HKUnit _countPerMinuteUnit];
  double v5 = +[HKQuantity quantityWithUnit:v4 doubleValue:a3];

  return v5;
}

- (double)_beatsPerMinute
{
  uint64_t v3 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)self doubleValueForUnit:v3];
  double v5 = v4;

  return v5;
}

- (id)asJSONObjectForUnit:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [v5 description];
  [v6 setObject:v7 forKeyedSubscript:@"unit"];

  uint64_t v8 = NSNumber;
  [(HKQuantity *)self doubleValueForUnit:v5];
  double v10 = v9;

  double v11 = [v8 numberWithDouble:v10];
  [v6 setObject:v11 forKeyedSubscript:@"quantity"];

  return v6;
}

- (id)asJSONObject
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [(HKQuantity *)self _unit];
  id v5 = [v4 description];
  [v3 setObject:v5 forKeyedSubscript:@"unit"];

  id v6 = NSNumber;
  double v7 = [(HKQuantity *)self _unit];
  [(HKQuantity *)self doubleValueForUnit:v7];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"quantity"];

  return v3;
}

+ (id)hk_quantityWithSeconds:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v4 = +[HKUnit secondUnit];
    [v3 doubleValue];
    double v6 = v5;

    double v7 = +[HKQuantity quantityWithUnit:v4 doubleValue:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)hk_quantityWithMinutes:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v4 = +[HKUnit minuteUnit];
    [v3 doubleValue];
    double v6 = v5;

    double v7 = +[HKQuantity quantityWithUnit:v4 doubleValue:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)hk_secondsNumber
{
  id v3 = NSNumber;
  double v4 = +[HKUnit secondUnit];
  [(HKQuantity *)self doubleValueForUnit:v4];
  double v5 = objc_msgSend(v3, "numberWithDouble:");

  return v5;
}

- (id)hk_minutesNumber
{
  id v3 = NSNumber;
  double v4 = +[HKUnit minuteUnit];
  [(HKQuantity *)self doubleValueForUnit:v4];
  double v5 = objc_msgSend(v3, "numberWithDouble:");

  return v5;
}

@end