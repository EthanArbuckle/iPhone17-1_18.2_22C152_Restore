@interface SVSCurrentLocationIndicator
- (void)drawRect:(CGRect)a3;
@end

@implementation SVSCurrentLocationIndicator

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetAlpha(CurrentContext, 0.2);
  id v8 = +[UIColor systemBlueColor];
  Components = CGColorGetComponents((CGColorRef)[v8 CGColor]);
  CGContextSetFillColor(CurrentContext, Components);

  CGContextBeginPath(CurrentContext);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGContextAddEllipseInRect(CurrentContext, v14);
  CGContextDrawPath(CurrentContext, kCGPathFill);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v10 = CGRectGetMidX(v15) + -4.0;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v11 = CGRectGetMidY(v16) + -4.0;
  CGContextSetAlpha(CurrentContext, 1.0);
  CGContextSetLineWidth(CurrentContext, 1.0);
  id v12 = +[UIColor whiteColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

  CGContextBeginPath(CurrentContext);
  v17.size.CGFloat width = 8.0;
  v17.size.CGFloat height = 8.0;
  v17.origin.CGFloat x = v10;
  v17.origin.CGFloat y = v11;
  CGContextAddEllipseInRect(CurrentContext, v17);

  CGContextDrawPath(CurrentContext, kCGPathFillStroke);
}

@end