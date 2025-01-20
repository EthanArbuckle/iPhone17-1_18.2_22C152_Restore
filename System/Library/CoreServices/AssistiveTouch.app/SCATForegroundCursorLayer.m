@interface SCATForegroundCursorLayer
- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7;
@end

@implementation SCATForegroundCursorLayer

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  if (v15)
  {
    id v16 = v15;
    double v17 = -2.0;
    if ([(SCATCursorLayer *)self usesHighVisibility])
    {
      v18 = [(SCATCursorLayer *)self styleProvider];
      [v18 cursorHighVisibilityMultiplier];
      double v17 = v19 * -2.0;
    }
    if (v9)
    {
      double v20 = v17 + 1.0;
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.double width = width;
      v26.size.double height = height;
      CGRect v27 = CGRectInset(v26, v20, v20);
      double width = v27.size.width;
      double height = v27.size.height;
      double y = v20 * 0.5;
      if ([(SCATCursorLayer *)self usesHighVisibility]) {
        double v21 = 24.0;
      }
      else {
        double v21 = 10.0;
      }
      v22 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v20 * 0.5, v20 * 0.5, width, height, v21);

      double x = v20 * 0.5;
    }
    else
    {
      id v23 = v16;
      [v23 CGPath];
      v24 = (const void *)AX_CGCreatePathPathWithUniformInset();
      v22 = +[UIBezierPath bezierPathWithCGPath:v24];

      if (v24) {
        CFRelease(v24);
      }
    }
  }
  else
  {
    v22 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)SCATForegroundCursorLayer;
  -[SCATCursorLayer updatePath:frame:isSimpleRect:animated:options:](&v25, "updatePath:frame:isSimpleRect:animated:options:", v22, v9, v8, v7, x, y, width, height);
}

- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  double result = 0.0;
  if (a5) {
    return 14.0;
  }
  return result;
}

- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  BOOL v6 = a5;
  BOOL v8 = [(SCATCursorLayer *)self styleProvider];
  [v8 cursorForegroundBorderWidth];
  double v10 = v9;

  if (v6)
  {
    v11 = [(SCATCursorLayer *)self styleProvider];
    [v11 cursorHighVisibilityMultiplier];
    double v10 = v10 * v12;
  }
  return v10;
}

- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return &off_1001BB958;
  }
  else {
    return 0;
  }
}

@end