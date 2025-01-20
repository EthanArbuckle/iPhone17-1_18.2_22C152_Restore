@interface HNDBackgroundBubbleCursorLayer
- (double)_borderWidthForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (double)_boundsInsetForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_fillColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_strokeColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
@end

@implementation HNDBackgroundBubbleCursorLayer

- (id)_strokeColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  if (_AXSPointerStrokeColor()
    && _AXSPointerStrokeColor() != 1
    && (_AXSPointerStrokeColor(), _AXSPointerStrokeColorValues()))
  {
    v5 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
  else
  {
    v5 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 0.6, 0, 0);
  }

  return v5;
}

- (id)_fillColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0;
}

- (double)_boundsInsetForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return sub_10004119C() * 14.0 + 0.0;
}

- (double)_borderWidthForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  -[HNDBubbleCursorLayer valueForPointerSizeMultipler:withBaseValue:](self, "valueForPointerSizeMultipler:withBaseValue:", *(void *)&a3, *(void *)&a4, 4.0, 2.0);
  return result;
}

@end