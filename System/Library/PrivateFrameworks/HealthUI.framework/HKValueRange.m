@interface HKValueRange
+ (HKValueRange)valueRangeWithMinValue:(id)a3 maxValue:(id)a4;
- (BOOL)containsValue:(id)a3 exclusiveStart:(BOOL)a4 exclusiveEnd:(BOOL)a5;
- (BOOL)hk_animatable;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hk_midPointToValue:(id)a3 percentage:(double)a4;
- (id)maxValue;
- (id)minValue;
- (unint64_t)hash;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)unionMaxValueWithRange:(id)a3;
- (void)unionMinValueWithRange:(id)a3;
- (void)unionRange:(id)a3;
@end

@implementation HKValueRange

+ (HKValueRange)valueRangeWithMinValue:(id)a3 maxValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return (HKValueRange *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maxValue, 0);
  objc_storeStrong(&self->_minValue, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKValueRange *)a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4 == self)
    {
      char v6 = 1;
    }
    else
    {
      v7 = [(HKValueRange *)self minValue];
      v8 = [(HKValueRange *)v4 minValue];
      id v9 = [(HKValueRange *)self maxValue];
      v10 = [(HKValueRange *)v4 maxValue];
      if (v7 == v8 || [v7 isEqual:v8])
      {
        if (v9 == v10) {
          char v6 = 1;
        }
        else {
          char v6 = [v9 isEqual:v10];
        }
      }
      else
      {
        char v6 = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_minValue hash];
  return [self->_maxValue hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_minValue);
  objc_storeStrong(v4 + 2, self->_maxValue);
  return v4;
}

- (void)unionRange:(id)a3
{
  id v4 = a3;
  [(HKValueRange *)self unionMinValueWithRange:v4];
  [(HKValueRange *)self unionMaxValueWithRange:v4];
}

- (void)unionMinValueWithRange:(id)a3
{
  id v9 = a3;
  id v4 = [(HKValueRange *)self minValue];
  if (!v4
    || ([v9 minValue],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        BOOL IsSmaller = HKUIObjectIsSmaller(v5, (uint64_t)v4),
        v5,
        IsSmaller))
  {
    v7 = [v9 minValue];
    id minValue = self->_minValue;
    self->_id minValue = v7;
  }
}

- (void)unionMaxValueWithRange:(id)a3
{
  id v9 = a3;
  id v4 = [(HKValueRange *)self maxValue];
  if (!v4
    || ([v9 maxValue],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        BOOL IsLarger = HKUIObjectIsLarger(v5, (uint64_t)v4),
        v5,
        IsLarger))
  {
    v7 = [v9 maxValue];
    id maxValue = self->_maxValue;
    self->_id maxValue = v7;
  }
}

- (BOOL)containsValue:(id)a3 exclusiveStart:(BOOL)a4 exclusiveEnd:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  id minValue = self->_minValue;
  if (minValue) {
    BOOL v11 = !v6;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    BOOL IsLargerOrEqual = HKUIObjectIsLargerOrEqual(v8, (uint64_t)minValue);
  }
  else {
    BOOL IsLargerOrEqual = HKUIObjectIsLarger(v8, (uint64_t)minValue);
  }
  BOOL v13 = IsLargerOrEqual;
  id maxValue = self->_maxValue;
  if (maxValue) {
    BOOL v15 = !v5;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    BOOL IsSmallerOrEqual = HKUIObjectIsSmallerOrEqual(v9, (uint64_t)maxValue);
  }
  else {
    BOOL IsSmallerOrEqual = HKUIObjectIsSmaller(v9, (uint64_t)maxValue);
  }
  BOOL v17 = v13 && IsSmallerOrEqual;

  return v17;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKValueRange;
  id v4 = [(HKValueRange *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@ min=%@ max=%@", v4, self->_minValue, self->_maxValue];

  return v5;
}

- (NSDate)startDate
{
  uint64_t v3 = [(HKValueRange *)self minValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(HKValueRange *)self minValue];
  }
  else
  {
    BOOL v5 = 0;
  }
  return (NSDate *)v5;
}

- (NSDate)endDate
{
  uint64_t v3 = [(HKValueRange *)self maxValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(HKValueRange *)self maxValue];
  }
  else
  {
    BOOL v5 = 0;
  }
  return (NSDate *)v5;
}

- (id)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
}

- (id)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
}

- (BOOL)hk_animatable
{
  return 1;
}

- (id)hk_midPointToValue:(id)a3 percentage:(double)a4
{
  id v6 = a3;
  objc_super v7 = [(HKValueRange *)self minValue];
  id v8 = [v6 minValue];
  id v9 = [(HKValueRange *)self maxValue];
  v10 = [v6 maxValue];

  BOOL v11 = objc_msgSend(v7, "hk_midPointToValue:percentage:", v8, a4);
  v12 = objc_msgSend(v9, "hk_midPointToValue:percentage:", v10, a4);
  BOOL v13 = +[HKValueRange valueRangeWithMinValue:v11 maxValue:v12];

  return v13;
}

@end