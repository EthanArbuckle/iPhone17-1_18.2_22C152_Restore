@interface HKNumericMinimumRangeAxisScalingRule
+ (id)ruleWithDefaultYAxisRange:(double)a3 axisRangeOverrides:(id)a4;
+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6;
+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7;
- (HKValueRange)noDataAxisBounds;
- (id)description;
- (id)noDataStartingRange;
- (void)setNoDataAxisBounds:(id)a3;
@end

@implementation HKNumericMinimumRangeAxisScalingRule

+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (double *)objc_alloc_init((Class)objc_opt_class());
  v15[1] = a3;
  v16 = (void *)*((void *)v15 + 2);
  *((void *)v15 + 2) = v13;
  id v17 = v13;

  v18 = (void *)*((void *)v15 + 5);
  *((void *)v15 + 5) = v11;
  id v19 = v11;

  v20 = (void *)*((void *)v15 + 6);
  *((void *)v15 + 6) = v12;
  id v21 = v12;

  [v15 setNoDataAxisBounds:v14];
  v22 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v21];

  [v15 setAxisBounds:v22];
  return v15;
}

- (void)setNoDataAxisBounds:(id)a3
{
}

+ (id)ruleWithDefaultYAxisRange:(double)a3 axisRangeOverrides:(id)a4
{
  id v5 = a4;
  v6 = [(id)objc_opt_class() ruleWithDefaultYAxisRange:0 minimumValue:0 maximumValue:v5 axisRangeOverrides:0 noDataAxisBounds:a3];

  return v6;
}

+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(id)objc_opt_class() ruleWithDefaultYAxisRange:v11 minimumValue:v10 maximumValue:v9 axisRangeOverrides:0 noDataAxisBounds:a3];

  return v12;
}

- (id)noDataStartingRange
{
  return self->_noDataAxisBounds;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %lf (%@ -> %@) Overrides: %@, No Data: %@>", v5, *(void *)&self->super._defaultYAxisRange, self->_minimumValue, self->_maximumValue, self->super._axisRangeOverrides, self->_noDataAxisBounds];

  return v6;
}

- (HKValueRange)noDataAxisBounds
{
  return self->_noDataAxisBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end