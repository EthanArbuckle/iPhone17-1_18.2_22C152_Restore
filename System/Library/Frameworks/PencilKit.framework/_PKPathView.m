@interface _PKPathView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (void)setFillColor:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation _PKPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(_PKPathView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (UIBezierPath)path
{
  v2 = (void *)MEMORY[0x1E4FB14C0];
  v3 = [(_PKPathView *)self _shapeLayer];
  id v4 = objc_msgSend(v2, "bezierPathWithCGPath:", objc_msgSend(v3, "path"));

  return (UIBezierPath *)v4;
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(_PKPathView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (UIColor)fillColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  v3 = [(_PKPathView *)self _shapeLayer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));

  return (UIColor *)v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PKPathView;
  if ([(_PKPathView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"path"];
  }

  return v5;
}

@end