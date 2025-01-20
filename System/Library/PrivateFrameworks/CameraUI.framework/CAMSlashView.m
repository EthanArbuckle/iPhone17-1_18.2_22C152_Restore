@interface CAMSlashView
+ (Class)layerClass;
- (BOOL)isVisible;
- (CAMSlashView)initWithFrame:(CGRect)a3;
- (void)_updateShapeLayerColor;
- (void)_updateShapeLayerLineWidth;
- (void)_updateShapeLayerPath;
- (void)_updateShapeLayerProgressAnimated:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CAMSlashView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMSlashView)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)CAMSlashView;
  v3 = -[CAMSlashView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMSlashView *)v3 setUserInteractionEnabled:0];
    [(CAMSlashView *)v4 _updateShapeLayerProgressAnimated:0];
    [(CAMSlashView *)v4 _updateShapeLayerLineWidth];
    [(CAMSlashView *)v4 _updateShapeLayerColor];
    v12[0] = objc_opt_class();
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v6 = (id)[(CAMSlashView *)v4 registerForTraitChanges:v5 withAction:sel__updateShapeLayerLineWidth];

    uint64_t v11 = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    id v8 = (id)[(CAMSlashView *)v4 registerForTraitChanges:v7 withAction:sel__updateShapeLayerColor];
  }
  return v4;
}

- (void)_updateShapeLayerColor
{
  id v5 = [(CAMSlashView *)self tintColor];
  uint64_t v3 = [v5 CGColor];
  v4 = [(CAMSlashView *)self _shapeLayer];
  [v4 setStrokeColor:v3];
}

- (void)_updateShapeLayerLineWidth
{
  uint64_t v3 = [(CAMSlashView *)self traitCollection];
  uint64_t v4 = [v3 legibilityWeight];

  if (v4 == 1) {
    double v5 = 1.75;
  }
  else {
    double v5 = 1.0;
  }
  id v6 = [(CAMSlashView *)self _shapeLayer];
  [v6 setLineWidth:v5];
}

- (void)_updateShapeLayerPath
{
  [(CAMSlashView *)self bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double MaxX = CGRectGetMaxX(v14);
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v15);
  v9 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v9, "moveToPoint:", x, y);
  objc_msgSend(v9, "addLineToPoint:", MaxX, MaxY);
  id v12 = v9;
  uint64_t v10 = [v12 CGPath];
  uint64_t v11 = [(CAMSlashView *)self _shapeLayer];
  [v11 setPath:v10];
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    [(CAMSlashView *)self _updateShapeLayerProgressAnimated:a4];
  }
}

- (void)_updateShapeLayerProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v18 = [(CAMSlashView *)self _shapeLayer];
  BOOL v5 = [(CAMSlashView *)self isVisible];
  double v8 = 1.0;
  if (v5) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  if (v3)
  {
    LODWORD(v6) = 1041865114;
    LODWORD(v7) = 1.0;
    LODWORD(v8) = 1045220557;
    uint64_t v10 = [MEMORY[0x263F15808] functionWithControlPoints:COERCE_DOUBLE(1045220557) :v8 :v6 :v7];
    uint64_t v11 = [v18 presentationLayer];
    if (v11) {
      id v12 = v11;
    }
    else {
      id v12 = v18;
    }
    id v13 = v12;

    CGRect v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
    CGRect v15 = NSNumber;
    [v13 strokeEnd];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    [v14 setFromValue:v16];

    v17 = [NSNumber numberWithDouble:v9];
    [v14 setToValue:v17];

    [v14 setTimingFunction:v10];
    [v14 setDuration:0.4];
    [v18 addAnimation:v14 forKey:@"slashProgress"];
  }
  [v18 setStrokeEnd:v9];
}

- (BOOL)isVisible
{
  return self->_visible;
}

@end