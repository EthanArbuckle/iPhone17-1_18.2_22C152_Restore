@interface UIView
- (UIColor)borderColor;
- (UIColor)shadowUIColor;
- (double)borderWidth;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setShadowUIColor:(id)a3;
@end

@implementation UIView

- (void)setShadowUIColor:(id)a3
{
  id v4 = [a3 CGColor];
  id v5 = [(UIView *)self layer];
  [v5 setShadowColor:v4];
}

- (UIColor)shadowUIColor
{
  v2 = [(UIView *)self layer];
  id v3 = [v2 shadowColor];

  return +[UIColor colorWithCGColor:v3];
}

- (void)setBorderWidth:(double)a3
{
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_setAssociatedObject(self, "borderWidth", v5, (void *)1);

  id v9 = +[UIScreen mainScreen];
  [v9 scale];
  double v7 = a3 / v6;
  v8 = [(UIView *)self layer];
  [v8 setBorderWidth:v7];
}

- (double)borderWidth
{
  v2 = objc_getAssociatedObject(self, "borderWidth");
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  id v4 = [a3 CGColor];
  id v5 = [(UIView *)self layer];
  [v5 setBorderColor:v4];
}

- (UIColor)borderColor
{
  v2 = [(UIView *)self layer];
  id v3 = [v2 borderColor];

  return +[UIColor colorWithCGColor:v3];
}

@end