@interface HKReferenceRangeViewData
+ (id)_codedQuantityForValue:(id)a3;
+ (id)_codedQuantityForValueCollection:(id)a3;
+ (id)referenceRangeViewDataFromInspectableValueInRange:(id)a3;
- (BOOL)useOutOfRangeValueColor;
- (NSNumber)rangeHigh;
- (NSNumber)rangeLow;
- (NSNumber)value;
- (NSString)rangeHighString;
- (NSString)rangeLowString;
- (NSString)unitString;
- (NSString)valueString;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRangeHigh:(id)a3;
- (void)setRangeHighString:(id)a3;
- (void)setRangeLow:(id)a3;
- (void)setRangeLowString:(id)a3;
- (void)setUnitString:(id)a3;
- (void)setUseOutOfRangeValueColor:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueString:(id)a3;
@end

@implementation HKReferenceRangeViewData

+ (id)referenceRangeViewDataFromInspectableValueInRange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentValue];

  if (v5)
  {
    id v5 = objc_alloc_init((Class)objc_opt_class());
    v6 = [v4 currentValue];
    v7 = [a1 _codedQuantityForValueCollection:v6];
    v8 = [v7 numberValue];
    [v5 setValue:v8];

    v9 = [v4 currentValue];
    v10 = [v9 displayString];
    [v5 setValueString:v10];

    v11 = [v4 lowValue];
    if (v11)
    {
    }
    else
    {
      v12 = [v4 highValue];

      if (!v12) {
        goto LABEL_18;
      }
    }
    v13 = [v4 highValue];
    v14 = [a1 _codedQuantityForValue:v13];

    v15 = [v4 lowValue];
    v16 = [a1 _codedQuantityForValue:v15];

    double v17 = 0.0;
    double v18 = 0.0;
    if (v14)
    {
      [v14 doubleValue];
      double v18 = v19;
    }
    if (v16)
    {
      [v16 doubleValue];
      double v17 = v20;
    }
    if (vabdd_f64(v18, v17) > 2.22044605e-16)
    {
      v21 = [v4 unitString];
      [v5 setUnitString:v21];

      if (v16)
      {
        v22 = [NSNumber numberWithDouble:v17];
        [v5 setRangeLow:v22];
      }
      else
      {
        [v5 setRangeLow:0];
      }
      v23 = [v4 lowValue];
      v24 = [v23 displayString];
      [v5 setRangeLowString:v24];

      if (v14)
      {
        v25 = [NSNumber numberWithDouble:v18];
        [v5 setRangeHigh:v25];
      }
      else
      {
        [v5 setRangeHigh:0];
      }
      v26 = [v4 highValue];
      v27 = [v26 displayString];
      [v5 setRangeHighString:v27];
    }
  }
LABEL_18:

  return v5;
}

+ (id)_codedQuantityForValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 valueType];
  if ((unint64_t)(v4 - 5) >= 2)
  {
    if (v4 == 1)
    {
      v6 = [v3 ratioValue];
      id v5 = [v6 numerator];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = [v3 codedQuantityValue];
  }

  return v5;
}

+ (id)_codedQuantityForValueCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 collectionType];
  if ((unint64_t)(v5 - 2) < 2)
  {
    v7 = [v4 inspectableValues];
    v8 = [v7 firstObject];
    v9 = [a1 _codedQuantityForValue:v8];

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
    v7 = (void *)v6;
    v9 = [a1 _codedQuantityForValue:v6];
    goto LABEL_8;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_valueString copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_unitString copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_rangeLowString copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_rangeHighString copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_value copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_rangeLow copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_rangeHigh copy];
  double v18 = (void *)v4[8];
  v4[8] = v17;

  *((unsigned char *)v4 + 8) = self->_useOutOfRangeValueColor;
  return v4;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
}

- (NSString)rangeLowString
{
  return self->_rangeLowString;
}

- (void)setRangeLowString:(id)a3
{
}

- (NSString)rangeHighString
{
  return self->_rangeHighString;
}

- (void)setRangeHighString:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)rangeLow
{
  return self->_rangeLow;
}

- (void)setRangeLow:(id)a3
{
}

- (NSNumber)rangeHigh
{
  return self->_rangeHigh;
}

- (void)setRangeHigh:(id)a3
{
}

- (BOOL)useOutOfRangeValueColor
{
  return self->_useOutOfRangeValueColor;
}

- (void)setUseOutOfRangeValueColor:(BOOL)a3
{
  self->_useOutOfRangeValueColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeHigh, 0);
  objc_storeStrong((id *)&self->_rangeLow, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_rangeHighString, 0);
  objc_storeStrong((id *)&self->_rangeLowString, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

@end