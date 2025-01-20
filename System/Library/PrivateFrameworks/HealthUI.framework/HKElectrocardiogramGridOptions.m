@interface HKElectrocardiogramGridOptions
- (CGAffineTransform)scale;
- (HKElectrocardiogramGridOptions)initWithUnitMultiple:(int64_t)a3 axis:(unint64_t)a4 lineColor:(id)a5 lineWidth:(double)a6;
- (UIColor)lineColor;
- (double)lineWidth;
- (unint64_t)axis;
- (unint64_t)unitMultiple;
- (void)setAxis:(unint64_t)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setUnitMultiple:(unint64_t)a3;
@end

@implementation HKElectrocardiogramGridOptions

- (HKElectrocardiogramGridOptions)initWithUnitMultiple:(int64_t)a3 axis:(unint64_t)a4 lineColor:(id)a5 lineWidth:(double)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramGridOptions;
  v12 = [(HKElectrocardiogramGridOptions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_unitMultiple = a3;
    v12->_axis = a4;
    objc_storeStrong((id *)&v12->_lineColor, a5);
    v13->_lineWidth = a6;
  }

  return v13;
}

- (CGAffineTransform)scale
{
  double v5 = (double)[(HKElectrocardiogramGridOptions *)self unitMultiple];
  double v6 = (double)[(HKElectrocardiogramGridOptions *)self unitMultiple];
  return CGAffineTransformMakeScale(retstr, v5, v6);
}

- (unint64_t)unitMultiple
{
  return self->_unitMultiple;
}

- (void)setUnitMultiple:(unint64_t)a3
{
  self->_unitMultiple = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
}

@end