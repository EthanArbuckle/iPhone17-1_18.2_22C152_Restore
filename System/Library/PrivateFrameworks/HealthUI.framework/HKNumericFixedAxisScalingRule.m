@interface HKNumericFixedAxisScalingRule
+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4;
+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 noDataAxisBounds:(id)a5;
- (HKValueRange)noDataAxisBounds;
- (id)description;
- (id)noDataStartingRange;
- (void)setNoDataAxisBounds:(id)a3;
@end

@implementation HKNumericFixedAxisScalingRule

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() ruleWithDefaultAxisBounds:v6 axisBoundsOverrides:v5 noDataAxisBounds:0];

  return v7;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 noDataAxisBounds:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;

  [v10 setNoDataAxisBounds:v9];
  return v10;
}

- (void)setNoDataAxisBounds:(id)a3
{
}

- (void).cxx_destruct
{
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
  id v6 = [v3 stringWithFormat:@"<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>", v5, self->super._defaultAxisBounds, self->super._minimumValue, self->super._maximumValue, self->super._axisBoundsOverrides, self->_noDataAxisBounds];

  return v6;
}

- (HKValueRange)noDataAxisBounds
{
  return self->_noDataAxisBounds;
}

@end