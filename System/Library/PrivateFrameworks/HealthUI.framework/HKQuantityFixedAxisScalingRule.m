@interface HKQuantityFixedAxisScalingRule
+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4;
+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6;
+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6 noDataAxisBounds:(id)a7;
+ (id)ruleWithDefaultAxisBounds:(id)a3 noDataAxisBounds:(id)a4;
- (BOOL)isCompatibleWithQuantityType:(id)a3;
- (HKUnit)unit;
- (HKValueRange)noDataAxisBounds;
- (id)_numberRangeFromQuantityRangeForUnit:(id)a3 quantityRange:(id)a4;
- (id)description;
- (id)noDataStartingRange;
- (void)_convertQuantityRanges;
- (void)setNoDataAxisBounds:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation HKQuantityFixedAxisScalingRule

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6 noDataAxisBounds:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_alloc_init((Class)objc_opt_class());
  v17 = (void *)v16[6];
  v16[6] = v11;
  id v18 = v11;

  v19 = (void *)v16[7];
  v16[7] = v12;
  id v20 = v12;

  v21 = (void *)v16[8];
  v16[8] = v13;
  id v22 = v13;

  v23 = (void *)v16[9];
  v16[9] = v14;

  [v16 setNoDataAxisBounds:v15];
  return v16;
}

- (void)setNoDataAxisBounds:(id)a3
{
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() ruleWithDefaultAxisBounds:v6 axisBoundsOverrides:v5 minimumValue:0 maximumValue:0 noDataAxisBounds:0];

  return v7;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() ruleWithDefaultAxisBounds:v12 axisBoundsOverrides:v11 minimumValue:v10 maximumValue:v9 noDataAxisBounds:0];

  return v13;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 noDataAxisBounds:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[6];
  v7[6] = v5;

  [v7 setNoDataAxisBounds:v6];
  return v7;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
  [(HKQuantityFixedAxisScalingRule *)self _convertQuantityRanges];
}

- (BOOL)isCompatibleWithQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [(HKValueRange *)self->_defaultQuantityBounds minValue];
  id v6 = [v5 _unit];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(HKValueRange *)self->_defaultQuantityBounds maxValue];
    id v8 = [v9 _unit];
  }
  if ([v4 isCompatibleWithUnit:v8])
  {
    char v10 = 1;
  }
  else
  {
    id v11 = [v4 _unitForChangeInCanonicalUnit];
    char v10 = [v11 _isCompatibleWithUnit:v8];
  }
  return v10;
}

- (void)_convertQuantityRanges
{
  v3 = [(HKQuantityFixedAxisScalingRule *)self _numberRangeFromQuantityRangeForUnit:self->_unit quantityRange:self->_defaultQuantityBounds];
  defaultAxisBounds = self->super._defaultAxisBounds;
  self->super._defaultAxisBounds = v3;

  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
  {
    id v6 = NSNumber;
    [(HKQuantity *)minimumQuantity doubleValueForUnit:self->_unit];
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    minimumValue = self->super._minimumValue;
    self->super._minimumValue = v7;
  }
  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
  {
    char v10 = NSNumber;
    [(HKQuantity *)maximumQuantity doubleValueForUnit:self->_unit];
    objc_msgSend(v10, "numberWithDouble:");
    id v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    maximumValue = self->super._maximumValue;
    self->super._maximumValue = v11;
  }
  if (self->_quantityBoundsOverrides)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    quantityBoundsOverrides = self->_quantityBoundsOverrides;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__HKQuantityFixedAxisScalingRule__convertQuantityRanges__block_invoke;
    v19[3] = &unk_1E6D55EB8;
    v19[4] = self;
    id v15 = (NSDictionary *)v13;
    id v20 = v15;
    [(NSDictionary *)quantityBoundsOverrides enumerateKeysAndObjectsUsingBlock:v19];
    axisBoundsOverrides = self->super._axisBoundsOverrides;
    self->super._axisBoundsOverrides = v15;
    v17 = v15;
  }
  else
  {
    id v18 = self->super._axisBoundsOverrides;
    self->super._axisBoundsOverrides = 0;
  }
}

void __56__HKQuantityFixedAxisScalingRule__convertQuantityRanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[11];
  id v7 = a2;
  id v8 = [v5 _numberRangeFromQuantityRangeForUnit:v6 quantityRange:a3];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
}

- (id)_numberRangeFromQuantityRangeForUnit:(id)a3 quantityRange:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = [v5 minValue];
    id v8 = [v5 maxValue];

    id v9 = NSNumber;
    [v7 doubleValueForUnit:v6];
    char v10 = objc_msgSend(v9, "numberWithDouble:");
    id v11 = NSNumber;
    [v8 doubleValueForUnit:v6];
    double v13 = v12;

    id v14 = [v11 numberWithDouble:v13];
    id v15 = +[HKValueRange valueRangeWithMinValue:v10 maxValue:v14];
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (id)noDataStartingRange
{
  noDataAxisBounds = self->_noDataAxisBounds;
  if (noDataAxisBounds)
  {
    id v4 = NSNumber;
    id v5 = [(HKValueRange *)noDataAxisBounds minValue];
    [v5 doubleValueForUnit:self->_unit];
    id v6 = objc_msgSend(v4, "numberWithDouble:");

    id v7 = NSNumber;
    id v8 = [(HKValueRange *)self->_noDataAxisBounds maxValue];
    [v8 doubleValueForUnit:self->_unit];
    id v9 = objc_msgSend(v7, "numberWithDouble:");

    char v10 = +[HKValueRange valueRangeWithMinValue:v6 maxValue:v9];
  }
  else
  {
    char v10 = 0;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>", v5, self->_defaultQuantityBounds, self->_minimumQuantity, self->_maximumQuantity, self->_quantityBoundsOverrides, self->_noDataAxisBounds];

  return v6;
}

- (HKValueRange)noDataAxisBounds
{
  return self->_noDataAxisBounds;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_noDataAxisBounds, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_quantityBoundsOverrides, 0);
  objc_storeStrong((id *)&self->_defaultQuantityBounds, 0);
}

@end