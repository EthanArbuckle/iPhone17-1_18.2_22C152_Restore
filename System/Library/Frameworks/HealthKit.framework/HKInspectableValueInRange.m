@interface HKInspectableValueInRange
+ (BOOL)supportsSecureCoding;
+ (id)valueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6;
- (BOOL)hasRenderableContent;
- (HKInspectableValue)highValue;
- (HKInspectableValue)lowValue;
- (HKInspectableValueCollection)currentValue;
- (HKInspectableValueInRange)initWithCoder:(id)a3;
- (NSNumber)highValueNumberRepresentation;
- (NSNumber)lowValueNumberRepresentation;
- (NSString)unitString;
- (id)_currentValueDoubleRepresentation;
- (id)_initValueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6;
- (id)_numberForValue:(id)a3;
- (id)_numberForValueCollection:(id)a3;
- (id)description;
- (int64_t)currentValueRelation;
- (void)_assertValidRange;
- (void)_setUnitString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKInspectableValueInRange

- (id)_initValueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKInspectableValueInRange;
  v15 = [(HKInspectableValueInRange *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lowValue, a3);
    objc_storeStrong((id *)&v16->_highValue, a4);
    objc_storeStrong((id *)&v16->_currentValue, a5);
    uint64_t v17 = [v14 copy];
    unitString = v16->_unitString;
    v16->_unitString = (NSString *)v17;

    [(HKInspectableValueInRange *)v16 _assertValidRange];
  }

  return v16;
}

+ (id)valueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HKInspectableValueInRange.m", 42, @"Invalid parameter not satisfying: %@", @"currentValue != nil" object file lineNumber description];
  }
  id v15 = [[HKInspectableValueInRange alloc] _initValueInRangeWithLow:v11 high:v12 currentValue:v13 unit:v14];

  return v15;
}

- (void)_assertValidRange
{
  v3 = [(HKInspectableValueInRange *)self lowValue];
  if (v3)
  {
  }
  else
  {
    v4 = [(HKInspectableValueInRange *)self highValue];

    if (!v4) {
      return;
    }
  }
  v5 = [(HKInspectableValueInRange *)self lowValue];
  if (v5)
  {
    v6 = [(HKInspectableValueInRange *)self lowValue];
    BOOL v7 = [v6 valueType] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  v8 = [(HKInspectableValueInRange *)self highValue];
  if (!v8)
  {

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
  v9 = [(HKInspectableValueInRange *)self highValue];
  uint64_t v10 = [v9 valueType];

  if (v10) {
    char v11 = v7;
  }
  else {
    char v11 = 1;
  }

  if (v11)
  {
LABEL_12:
    lowValue = self->_lowValue;
    self->_lowValue = 0;

    highValue = self->_highValue;
    self->_highValue = 0;
  }
}

- (NSNumber)lowValueNumberRepresentation
{
  return (NSNumber *)[(HKInspectableValueInRange *)self _numberForValue:self->_lowValue];
}

- (NSNumber)highValueNumberRepresentation
{
  return (NSNumber *)[(HKInspectableValueInRange *)self _numberForValue:self->_highValue];
}

- (id)_currentValueDoubleRepresentation
{
  v3 = [(HKInspectableValueInRange *)self currentValue];
  v4 = [(HKInspectableValueInRange *)self _numberForValueCollection:v3];

  return v4;
}

- (int64_t)currentValueRelation
{
  v3 = [(HKInspectableValueInRange *)self lowValue];
  if (v3)
  {
  }
  else
  {
    v4 = [(HKInspectableValueInRange *)self highValue];

    if (!v4) {
      return 3;
    }
  }
  v5 = [(HKInspectableValueInRange *)self _currentValueDoubleRepresentation];
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_9;
  }
  [v5 doubleValue];
  double v8 = v7;
  v9 = [(HKInspectableValueInRange *)self lowValue];
  double v10 = 0.0;
  if (!v9) {
    goto LABEL_13;
  }
  char v11 = [(HKInspectableValueInRange *)self lowValue];
  id v12 = +[HKInspectableValue inspectableValueWithNull];
  char v13 = [v11 isEqual:v12];

  if (v13)
  {
    v9 = 0;
    goto LABEL_13;
  }
  v16 = [(HKInspectableValueInRange *)self lowValueNumberRepresentation];
  v9 = v16;
  if (!v16)
  {
LABEL_9:
    id v14 = 0;
    goto LABEL_10;
  }
  [v16 doubleValue];
  double v10 = v17;
LABEL_13:
  uint64_t v18 = [(HKInspectableValueInRange *)self highValue];
  if (!v18) {
    goto LABEL_15;
  }
  v19 = (void *)v18;
  objc_super v20 = [(HKInspectableValueInRange *)self highValue];
  v21 = +[HKInspectableValue inspectableValueWithNull];
  char v22 = [v20 isEqual:v21];

  if (v22)
  {
LABEL_15:
    char v23 = 0;
    id v14 = 0;
    BOOL v24 = v9 != 0;
    double v25 = 0.0;
    goto LABEL_16;
  }
  v27 = [(HKInspectableValueInRange *)self highValueNumberRepresentation];
  id v14 = v27;
  if (v27)
  {
    [v27 doubleValue];
    BOOL v24 = v9 != 0;
    char v23 = 1;
    if (!v9 || v25 - v10 > 2.22044605e-16)
    {
LABEL_16:
      if (v24 && v8 < v10)
      {
        int64_t v15 = 1;
      }
      else if ((v23 & (v8 > v25)) != 0)
      {
        int64_t v15 = 2;
      }
      else
      {
        int64_t v15 = 0;
      }
      goto LABEL_22;
    }
  }
LABEL_10:
  int64_t v15 = 4;
LABEL_22:

  return v15;
}

- (BOOL)hasRenderableContent
{
  v3 = [(HKInspectableValueInRange *)self currentValue];
  if ([v3 collectionType])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(HKInspectableValueInRange *)self currentValue];
    v6 = [v5 inspectableValue];
    uint64_t v7 = [v6 valueType];

    if (!v7) {
      return 0;
    }
    lowValue = self->_lowValue;
    BOOL v9 = !lowValue || [(HKInspectableValue *)lowValue valueType] == 5;
    highValue = self->_highValue;
    BOOL v11 = !highValue || [(HKInspectableValue *)highValue valueType] == 5;
    if (v9 && v11) {
      return 0;
    }
    if (v9 || v11) {
      return 1;
    }
    id v12 = [(HKInspectableValueInRange *)self _numberForValue:self->_highValue];
    [v12 doubleValue];
    double v14 = v13;

    int64_t v15 = [(HKInspectableValueInRange *)self _numberForValue:self->_lowValue];
    [v15 doubleValue];
    double v17 = v16;

    if (v14 - v17 > 2.22044605e-16) {
      return 1;
    }
    v3 = [(HKInspectableValueInRange *)self highValue];
    BOOL v4 = v3 == 0;
  }

  return v4;
}

- (id)_numberForValueCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 collectionType];
  if ((unint64_t)(v5 - 2) < 2)
  {
    uint64_t v7 = [v4 inspectableValues];
    double v8 = [v7 firstObject];
    BOOL v9 = [(HKInspectableValueInRange *)self _numberForValue:v8];

LABEL_8:
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [v4 min];
    goto LABEL_7;
  }
  if (!v5)
  {
    uint64_t v6 = [v4 inspectableValue];
LABEL_7:
    uint64_t v7 = (void *)v6;
    BOOL v9 = [(HKInspectableValueInRange *)self _numberForValue:v6];
    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (id)_numberForValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueType];
  if ((unint64_t)(v4 - 5) < 2)
  {
    uint64_t v5 = [v3 codedQuantityValue];
    uint64_t v7 = [v5 numberValue];
    goto LABEL_6;
  }
  if (v4 == 10)
  {
    uint64_t v7 = [v3 inspectableIntegerValue];
  }
  else
  {
    if (v4 == 1)
    {
      uint64_t v5 = [v3 ratioValue];
      uint64_t v6 = [v5 numerator];
      uint64_t v7 = [v6 numberValue];

LABEL_6:
      goto LABEL_9;
    }
    uint64_t v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)_setUnitString:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> %@, unit: %@, low: %@, high: %@", v5, self, self->_currentValue, self->_unitString, self->_lowValue, self->_highValue];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValueInRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKInspectableValueInRange;
  uint64_t v5 = [(HKInspectableValueInRange *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LowValueKey"];
    lowValue = v5->_lowValue;
    v5->_lowValue = (HKInspectableValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HighValueKey"];
    highValue = v5->_highValue;
    v5->_highValue = (HKInspectableValue *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentValueKey"];
    currentValue = v5->_currentValue;
    v5->_currentValue = (HKInspectableValueCollection *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnitStringKey"];
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v12;

    if (!v5->_currentValue)
    {
      double v14 = 0;
      goto LABEL_6;
    }
    [(HKInspectableValueInRange *)v5 _assertValidRange];
  }
  double v14 = v5;
LABEL_6:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  lowValue = self->_lowValue;
  id v5 = a3;
  [v5 encodeObject:lowValue forKey:@"LowValueKey"];
  [v5 encodeObject:self->_highValue forKey:@"HighValueKey"];
  [v5 encodeObject:self->_currentValue forKey:@"CurrentValueKey"];
  [v5 encodeObject:self->_unitString forKey:@"UnitStringKey"];
}

- (HKInspectableValue)lowValue
{
  return self->_lowValue;
}

- (HKInspectableValue)highValue
{
  return self->_highValue;
}

- (HKInspectableValueCollection)currentValue
{
  return self->_currentValue;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_highValue, 0);

  objc_storeStrong((id *)&self->_lowValue, 0);
}

@end