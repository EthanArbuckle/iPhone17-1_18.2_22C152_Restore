@interface FIUIChartColor
- (FIUIChartColor)initWithThreshold:(double)a3 color:(id)a4;
- (FIUIChartColor)initWithThreshold:(double)a3 startColor:(id)a4 endColor:(id)a5;
- (double)threshold;
- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)setThreshold:(double)a3;
@end

@implementation FIUIChartColor

- (FIUIChartColor)initWithThreshold:(double)a3 startColor:(id)a4 endColor:(id)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FIUIChartColor;
  v10 = [(FIUIChartColor *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_threshold = a3;
    v15[0] = [v8 CGColor];
    v15[1] = [v9 CGColor];
    CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v11->_gradient = CGGradientCreateWithColors(0, v12, 0);
  }
  return v11;
}

- (FIUIChartColor)initWithThreshold:(double)a3 color:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FIUIChartColor;
  v7 = [(FIUIChartColor *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    v7->_threshold = a3;
    v7->_color = (CGColor *)[v6 CGColor];
  }

  return v8;
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSaveGState(a4);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGContextClipToRect(a4, v16);
  if (self->_gradient)
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGFloat MidX = CGRectGetMidX(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGFloat v12 = CGRectGetMidX(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    v15.CGFloat y = CGRectGetMaxY(v20);
    v14.CGFloat x = MidX;
    v14.CGFloat y = MinY;
    v15.CGFloat x = v12;
    CGContextDrawLinearGradient(a4, self->_gradient, v14, v15, 0);
  }
  else
  {
    CGContextSetFillColorWithColor(a4, self->_color);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGContextFillRect(a4, v21);
  }
  CGContextRestoreGState(a4);
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

@end