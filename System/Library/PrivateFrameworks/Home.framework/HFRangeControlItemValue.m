@interface HFRangeControlItemValue
+ (id)targetValueWithValue:(id)a3;
+ (id)thresholdValueWithMinimumValue:(id)a3 maximumValue:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HFNumberRange)numberRange;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)targetValue;
- (id)description;
- (unint64_t)hash;
- (unint64_t)mode;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setTargetValue:(id)a3;
@end

@implementation HFRangeControlItemValue

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t v6 = [(HFRangeControlItemValue *)self mode];
    if (v6 == [v5 mode])
    {
      if ([(HFRangeControlItemValue *)self mode] == 1 || ![(HFRangeControlItemValue *)self mode])
      {
        v8 = [(HFRangeControlItemValue *)self targetValue];
        v9 = [v5 targetValue];
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {
          char v7 = 1;
        }
        else if (v10)
        {
          char v7 = [v10 isEqual:v11];
        }
        else
        {
          char v7 = 0;
        }
      }
      else
      {
        char v7 = 1;
      }
      if ([(HFRangeControlItemValue *)self mode] == 2 || ![(HFRangeControlItemValue *)self mode])
      {
        v12 = [(HFRangeControlItemValue *)self minimumValue];
        v13 = [v5 minimumValue];
        id v14 = v12;
        id v15 = v13;
        if (v14 == v15)
        {
          char v16 = 1;
        }
        else if (v14)
        {
          char v16 = [v14 isEqual:v15];
        }
        else
        {
          char v16 = 0;
        }

        v17 = [(HFRangeControlItemValue *)self maximumValue];
        v18 = [v5 maximumValue];
        id v19 = v17;
        id v20 = v18;
        if (v19 == v20)
        {
          char v21 = 1;
        }
        else if (v19)
        {
          char v21 = [v19 isEqual:v20];
        }
        else
        {
          char v21 = 0;
        }

        v7 &= v21 & v16;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setTargetValue:(id)a3
{
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setMinimumValue:(id)a3
{
}

- (void)setMaximumValue:(id)a3
{
}

- (HFNumberRange)numberRange
{
  unint64_t v4 = [(HFRangeControlItemValue *)self mode];
  if (v4 >= 2)
  {
    if (v4 != 2) {
      goto LABEL_6;
    }
    id v5 = [(HFRangeControlItemValue *)self maximumValue];
    unint64_t v6 = [(HFRangeControlItemValue *)self minimumValue];
    v2 = +[HFNumberRange rangeWithMaxValue:v5 minValue:v6];
  }
  else
  {
    id v5 = [(HFRangeControlItemValue *)self targetValue];
    v2 = +[HFNumberRange valueWithValue:v5];
  }

LABEL_6:
  return (HFNumberRange *)v2;
}

- (NSNumber)targetValue
{
  targetValue = self->_targetValue;
  if (targetValue)
  {
    v3 = targetValue;
  }
  else
  {
    id v5 = NSNumber;
    unint64_t v6 = [(HFRangeControlItemValue *)self minimumValue];
    [v6 doubleValue];
    double v8 = v7;
    v9 = [(HFRangeControlItemValue *)self maximumValue];
    [v9 doubleValue];
    v3 = [v5 numberWithDouble:(v8 + v10) * 0.5];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

+ (id)thresholdValueWithMinimumValue:(id)a3 maximumValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setMode:2];
  [v7 setMinimumValue:v6];

  [v7 setMaximumValue:v5];
  return v7;
}

+ (id)targetValueWithValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setMode:1];
  [v4 setTargetValue:v3];

  return v4;
}

- (unint64_t)hash
{
  unint64_t v4 = [(HFRangeControlItemValue *)self mode];
  if (v4 < 2)
  {
    id v5 = [(HFRangeControlItemValue *)self targetValue];
    unint64_t v2 = [v5 hash];
LABEL_5:

    return v2;
  }
  if (v4 == 2)
  {
    id v5 = [(HFRangeControlItemValue *)self minimumValue];
    uint64_t v6 = [v5 hash];
    id v7 = [(HFRangeControlItemValue *)self maximumValue];
    unint64_t v2 = [v7 hash] ^ v6;

    goto LABEL_5;
  }
  return v2;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = [(HFRangeControlItemValue *)self targetValue];
  id v5 = [(HFRangeControlItemValue *)self minimumValue];
  uint64_t v6 = [(HFRangeControlItemValue *)self maximumValue];
  id v7 = [v3 stringWithFormat:@"%@, min %@ max %@", v4, v5, v6];

  return v7;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

@end