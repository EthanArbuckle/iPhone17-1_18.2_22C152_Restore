@interface _HKShapeView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIBezierPath)path;
- (void)setPath:(id)a3;
@end

@implementation _HKShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(_HKShapeView *)self shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_HKShapeView;
    BOOL v5 = [(_HKShapeView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (UIBezierPath)path
{
  v3 = [(_HKShapeView *)self shapeLayer];
  uint64_t v4 = [v3 path];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x263F824C0];
    uint64_t v6 = [(_HKShapeView *)self shapeLayer];
    objc_super v7 = objc_msgSend(v5, "bezierPathWithCGPath:", objc_msgSend(v6, "path"));
  }
  else
  {
    objc_super v7 = 0;
  }

  return (UIBezierPath *)v7;
}

@end