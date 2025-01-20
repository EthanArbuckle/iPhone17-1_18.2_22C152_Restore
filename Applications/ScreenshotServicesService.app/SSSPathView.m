@interface SSSPathView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (void)setFillColor:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation SSSPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(SSSPathView *)self _shapeLayer];
  id v5 = v4;
  id v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (UIBezierPath)path
{
  v2 = [(SSSPathView *)self _shapeLayer];
  v3 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v2 path]);

  return (UIBezierPath *)v3;
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(SSSPathView *)self _shapeLayer];
  id v5 = v4;
  id v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (UIColor)fillColor
{
  v2 = [(SSSPathView *)self _shapeLayer];
  v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 fillColor]);

  return (UIColor *)v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SSSPathView;
  if ([(SSSPathView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"path"];
  }

  return v5;
}

@end