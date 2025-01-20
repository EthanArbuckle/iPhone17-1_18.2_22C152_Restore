@interface HKQuantityMinimumRangeAxisScalingRule
+ (id)ruleWithDefaultYAxisRange:(id)a3 anchorValue:(id)a4;
+ (id)ruleWithDefaultYAxisRange:(id)a3 axisRangeOverrides:(id)a4;
+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6;
+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7;
- (BOOL)isCompatibleWithQuantityType:(id)a3;
- (HKUnit)unit;
- (HKValueRange)noDataAxisBounds;
- (id)description;
- (id)noDataStartingRange;
- (void)_convertQuantities;
- (void)setNoDataAxisBounds:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation HKQuantityMinimumRangeAxisScalingRule

+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7
{
  id v25 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v16 + 5, a3);
  objc_storeStrong(v16 + 9, a6);
  objc_storeStrong(v16 + 6, a4);
  objc_storeStrong(v16 + 7, a5);
  if (v12)
  {
    v17 = NSNumber;
    v18 = [v12 _unit];
    [v12 doubleValueForUnit:v18];
    v19 = objc_msgSend(v17, "numberWithDouble:");

    if (v13)
    {
LABEL_3:
      v20 = NSNumber;
      v21 = [v13 _unit];
      [v13 doubleValueForUnit:v21];
      v22 = objc_msgSend(v20, "numberWithDouble:");

      goto LABEL_6;
    }
  }
  else
  {
    v19 = 0;
    if (v13) {
      goto LABEL_3;
    }
  }
  v22 = 0;
LABEL_6:
  v23 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v22];
  [v16 setAxisBounds:v23];

  [v16 setNoDataAxisBounds:v15];
  return v16;
}

- (void)setNoDataAxisBounds:(id)a3
{
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 axisRangeOverrides:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() ruleWithDefaultYAxisRange:v6 minimumValue:0 maximumValue:0 axisRangeOverrides:v5 noDataAxisBounds:0];

  return v7;
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() ruleWithDefaultYAxisRange:v12 minimumValue:v11 maximumValue:v10 axisRangeOverrides:v9 noDataAxisBounds:0];

  return v13;
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 anchorValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[5];
  v7[5] = v5;
  id v9 = v5;

  id v10 = (void *)v7[8];
  v7[8] = v6;

  [v7 setAxisBounds:0];
  return v7;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
  [(HKQuantityMinimumRangeAxisScalingRule *)self _convertQuantities];
}

- (BOOL)isCompatibleWithQuantityType:(id)a3
{
  defaultYAxisRangeQuantity = self->_defaultYAxisRangeQuantity;
  id v4 = a3;
  id v5 = [(HKQuantity *)defaultYAxisRangeQuantity _unit];
  char v6 = [v4 isCompatibleWithUnit:v5];

  return v6;
}

- (void)_convertQuantities
{
  [(HKQuantity *)self->_defaultYAxisRangeQuantity doubleValueForUnit:self->_unit];
  double v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F2B370];
  char v6 = [(HKQuantity *)self->_defaultYAxisRangeQuantity _unit];
  v7 = [v5 quantityWithUnit:v6 doubleValue:0.0];
  [v7 doubleValueForUnit:self->_unit];
  double v9 = v8;

  self->super._defaultYAxisRange = v4 - v9;
  if (self->_axisRangeQuantityOverrides)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    axisRangeQuantityOverrides = self->_axisRangeQuantityOverrides;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __59__HKQuantityMinimumRangeAxisScalingRule__convertQuantities__block_invoke;
    v30 = &unk_1E6D55EE0;
    id v12 = (NSDictionary *)v10;
    v31 = v12;
    v32 = self;
    [(NSDictionary *)axisRangeQuantityOverrides enumerateKeysAndObjectsUsingBlock:&v27];
    axisRangeOverrides = self->super._axisRangeOverrides;
    self->super._axisRangeOverrides = v12;
    id v14 = v12;
  }
  else
  {
    id v15 = self->super._axisRangeOverrides;
    self->super._axisRangeOverrides = 0;
  }
  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
  {
    v17 = NSNumber;
    [(HKQuantity *)minimumQuantity doubleValueForUnit:self->_unit];
    v18 = objc_msgSend(v17, "numberWithDouble:");
  }
  else
  {
    v18 = 0;
  }
  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
  {
    v20 = NSNumber;
    [(HKQuantity *)maximumQuantity doubleValueForUnit:self->_unit];
    v21 = objc_msgSend(v20, "numberWithDouble:");
  }
  else
  {
    v21 = 0;
  }
  v22 = +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v18, v21, v27, v28, v29, v30);
  [(HKAbstractMinimumRangeScalingRule *)self setAxisBounds:v22];

  anchorQuantity = self->_anchorQuantity;
  if (anchorQuantity)
  {
    v24 = NSNumber;
    [(HKQuantity *)anchorQuantity doubleValueForUnit:self->_unit];
    objc_msgSend(v24, "numberWithDouble:");
    id v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    anchorValue = self->super._anchorValue;
    self->super._anchorValue = v25;
  }
}

void __59__HKQuantityMinimumRangeAxisScalingRule__convertQuantities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 88);
  id v7 = a2;
  [a3 doubleValueForUnit:v6];
  objc_msgSend(v5, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (id)noDataStartingRange
{
  noDataAxisBounds = self->_noDataAxisBounds;
  if (noDataAxisBounds)
  {
    double v4 = NSNumber;
    id v5 = [(HKValueRange *)noDataAxisBounds minValue];
    [v5 doubleValueForUnit:self->_unit];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");

    id v7 = NSNumber;
    id v8 = [(HKValueRange *)self->_noDataAxisBounds maxValue];
    [v8 doubleValueForUnit:self->_unit];
    double v9 = objc_msgSend(v7, "numberWithDouble:");

    id v10 = +[HKValueRange valueRangeWithMinValue:v6 maxValue:v9];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>", v5, self->_defaultYAxisRangeQuantity, self->_minimumQuantity, self->_maximumQuantity, self->_axisRangeQuantityOverrides, self->_noDataAxisBounds];

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
  objc_storeStrong((id *)&self->_axisRangeQuantityOverrides, 0);
  objc_storeStrong((id *)&self->_anchorQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_defaultYAxisRangeQuantity, 0);
}

@end