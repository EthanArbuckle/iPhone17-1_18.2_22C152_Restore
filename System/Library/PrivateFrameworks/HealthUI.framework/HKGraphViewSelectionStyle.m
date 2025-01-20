@interface HKGraphViewSelectionStyle
- (HKStrokeStyle)selectedPointLineStrokeStyle;
- (HKStrokeStyle)touchPointLineStrokeStyle;
- (double)unselectedSeriesAlpha;
- (void)setSelectedPointLineStrokeStyle:(id)a3;
- (void)setTouchPointLineStrokeStyle:(id)a3;
- (void)setUnselectedSeriesAlpha:(double)a3;
@end

@implementation HKGraphViewSelectionStyle

- (double)unselectedSeriesAlpha
{
  return self->_unselectedSeriesAlpha;
}

- (void)setUnselectedSeriesAlpha:(double)a3
{
  self->_unselectedSeriesAlpha = a3;
}

- (HKStrokeStyle)selectedPointLineStrokeStyle
{
  return self->_selectedPointLineStrokeStyle;
}

- (void)setSelectedPointLineStrokeStyle:(id)a3
{
}

- (HKStrokeStyle)touchPointLineStrokeStyle
{
  return self->_touchPointLineStrokeStyle;
}

- (void)setTouchPointLineStrokeStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchPointLineStrokeStyle, 0);
  objc_storeStrong((id *)&self->_selectedPointLineStrokeStyle, 0);
}

@end