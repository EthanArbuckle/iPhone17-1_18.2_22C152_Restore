@interface HKElectrocardiogramAxisOptions
- (BOOL)scaleMetricsAutomatically;
- (HKElectrocardiogramAxisOptions)initWithAxisLabelFont:(id)a3 axisLabelTextColor:(id)a4 scaleMetricsAutomatically:(BOOL)a5 lineColor:(id)a6 lineWidth:(double)a7 axisLineToLabelSpacing:(double)a8 topBaselineMargin:(double)a9 bottomBaselineMargin:(double)a10;
- (UIColor)axisLabelTextColor;
- (UIColor)lineColor;
- (UIFont)axisLabelFont;
- (double)axisLineToLabelSpacing;
- (double)bottomBaselineMargin;
- (double)lineWidth;
- (double)topBaselineMargin;
@end

@implementation HKElectrocardiogramAxisOptions

- (HKElectrocardiogramAxisOptions)initWithAxisLabelFont:(id)a3 axisLabelTextColor:(id)a4 scaleMetricsAutomatically:(BOOL)a5 lineColor:(id)a6 lineWidth:(double)a7 axisLineToLabelSpacing:(double)a8 topBaselineMargin:(double)a9 bottomBaselineMargin:(double)a10
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HKElectrocardiogramAxisOptions;
  v22 = [(HKElectrocardiogramAxisOptions *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_axisLabelFont, a3);
    objc_storeStrong((id *)&v23->_axisLabelTextColor, a4);
    v23->_scaleMetricsAutomatically = a5;
    objc_storeStrong((id *)&v23->_lineColor, a6);
    v23->_lineWidth = a7;
    v23->_axisLineToLabelSpacing = a8;
    v23->_topBaselineMargin = a9;
    v23->_bottomBaselineMargin = a10;
  }

  return v23;
}

- (UIFont)axisLabelFont
{
  return self->_axisLabelFont;
}

- (BOOL)scaleMetricsAutomatically
{
  return self->_scaleMetricsAutomatically;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (UIColor)axisLabelTextColor
{
  return self->_axisLabelTextColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)axisLineToLabelSpacing
{
  return self->_axisLineToLabelSpacing;
}

- (double)topBaselineMargin
{
  return self->_topBaselineMargin;
}

- (double)bottomBaselineMargin
{
  return self->_bottomBaselineMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelTextColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_axisLabelFont, 0);
}

@end