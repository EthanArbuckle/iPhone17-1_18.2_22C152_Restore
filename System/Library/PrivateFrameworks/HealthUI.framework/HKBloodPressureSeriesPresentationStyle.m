@interface HKBloodPressureSeriesPresentationStyle
- (UIColor)diastolicFillColor;
- (UIColor)diastolicSymbolColor;
- (UIColor)systolicFillColor;
- (UIColor)systolicSymbolColor;
- (double)width;
- (void)setDiastolicFillColor:(id)a3;
- (void)setDiastolicSymbolColor:(id)a3;
- (void)setSystolicFillColor:(id)a3;
- (void)setSystolicSymbolColor:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation HKBloodPressureSeriesPresentationStyle

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (UIColor)systolicSymbolColor
{
  return self->_systolicSymbolColor;
}

- (void)setSystolicSymbolColor:(id)a3
{
}

- (UIColor)systolicFillColor
{
  return self->_systolicFillColor;
}

- (void)setSystolicFillColor:(id)a3
{
}

- (UIColor)diastolicSymbolColor
{
  return self->_diastolicSymbolColor;
}

- (void)setDiastolicSymbolColor:(id)a3
{
}

- (UIColor)diastolicFillColor
{
  return self->_diastolicFillColor;
}

- (void)setDiastolicFillColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicFillColor, 0);
  objc_storeStrong((id *)&self->_diastolicSymbolColor, 0);
  objc_storeStrong((id *)&self->_systolicFillColor, 0);
  objc_storeStrong((id *)&self->_systolicSymbolColor, 0);
}

@end