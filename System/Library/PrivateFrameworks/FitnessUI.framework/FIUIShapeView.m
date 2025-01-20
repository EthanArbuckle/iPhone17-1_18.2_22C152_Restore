@interface FIUIShapeView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (FIUIShapeView)initWithFrame:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setPath:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeEnd:(double)a3;
@end

@implementation FIUIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (FIUIShapeView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FIUIShapeView;
  return -[FIUIShapeView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(FIUIShapeView *)self shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(FIUIShapeView *)self shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (void)setStrokeColor:(id)a3
{
  id v4 = a3;
  id v7 = [(FIUIShapeView *)self shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setStrokeColor:v6];
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(FIUIShapeView *)self shapeLayer];
  [v4 setLineWidth:a3];
}

- (void)setStrokeEnd:(double)a3
{
  id v4 = [(FIUIShapeView *)self shapeLayer];
  [v4 setStrokeEnd:a3];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"strokeEnd"] & 1) != 0
    || ([v4 isEqualToString:@"path"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)FIUIShapeView;
    BOOL v5 = [(FIUIShapeView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end