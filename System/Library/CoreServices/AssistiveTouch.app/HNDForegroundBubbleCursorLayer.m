@interface HNDForegroundBubbleCursorLayer
- (double)_borderWidthForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (double)_boundsInsetForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_borderPatternForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_strokeColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation HNDForegroundBubbleCursorLayer

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  if (v13)
  {
    v14 = v13;
    [(HNDBubbleCursorLayer *)self valueForPointerSizeMultipler:4.0 withBaseValue:-2.0];
    if (v7)
    {
      CGFloat v16 = v15 + 1.0;
      v20.origin.double x = x;
      v20.origin.double y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      CGRect v21 = CGRectInset(v20, v16, v16);
      double width = v21.size.width;
      double height = v21.size.height;
      double y = v16 * 0.5;
      v17 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v16 * 0.5, v16 * 0.5, v21.size.width, v21.size.height, sub_10004119C() * 14.0 + 10.0);
      double x = v16 * 0.5;
    }
    else
    {
      [v14 CGPath];
      v18 = (const void *)AX_CGCreatePathPathWithUniformInset();
      v17 = +[UIBezierPath bezierPathWithCGPath:v18];
      if (v18) {
        CFRelease(v18);
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)HNDForegroundBubbleCursorLayer;
  -[HNDBubbleCursorLayer updatePath:frame:isSimpleRect:animated:](&v19, "updatePath:frame:isSimpleRect:animated:", v17, v7, v6, x, y, width, height);
}

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
    v5 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 0.6, 0, 0);
  }

  return v5;
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

- (id)_borderPatternForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0;
}

@end