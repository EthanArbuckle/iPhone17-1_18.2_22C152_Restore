@interface _SSSShadowViewInnerViewWithShadow
- (UIBezierPath)shadowPath;
- (_SSSShadowViewInnerViewWithShadow)initWithFrame:(CGRect)a3;
- (void)setShadowPath:(id)a3;
@end

@implementation _SSSShadowViewInnerViewWithShadow

- (_SSSShadowViewInnerViewWithShadow)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_SSSShadowViewInnerViewWithShadow;
  v3 = -[_SSSShadowViewInnerViewWithShadow initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(_SSSShadowViewInnerViewWithShadow *)v3 layer];
  id v5 = +[SSSShadowView shadowColor];
  [v4 setShadowColor:[v5 CGColor]];

  v6 = [(_SSSShadowViewInnerViewWithShadow *)v3 layer];
  +[SSSShadowView shadowRadius];
  [v6 setShadowRadius:];

  v7 = [(_SSSShadowViewInnerViewWithShadow *)v3 layer];
  +[SSSShadowView shadowOffset];
  [v7 setShadowOffset:];

  v8 = [(_SSSShadowViewInnerViewWithShadow *)v3 layer];
  +[SSSShadowView shadowOpacity];
  *(float *)&double v9 = v9;
  [v8 setShadowOpacity:v9];

  return v3;
}

- (void)setShadowPath:(id)a3
{
  id v4 = a3;
  id v7 = [(_SSSShadowViewInnerViewWithShadow *)self layer];
  id v5 = v4;
  id v6 = [v5 CGPath];

  [v7 setShadowPath:v6];
}

- (UIBezierPath)shadowPath
{
  v2 = [(_SSSShadowViewInnerViewWithShadow *)self layer];
  v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v2 shadowPath]);

  return (UIBezierPath *)v3;
}

@end