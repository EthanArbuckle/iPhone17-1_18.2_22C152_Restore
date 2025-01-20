@interface CAMZoomDialDotsView
+ (Class)layerClass;
- (CALayer)_dotLayer;
- (CAMZoomDialDotsView)initWithDotImage:(id)a3;
- (CGPoint)dotCenter;
- (double)dotSpacingAngle;
- (int64_t)dotCount;
- (void)setDotCenter:(CGPoint)a3;
- (void)setDotCount:(int64_t)a3;
- (void)setDotSpacingAngle:(double)a3;
@end

@implementation CAMZoomDialDotsView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMZoomDialDotsView)initWithDotImage:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CAMZoomDialDotsView;
  v5 = -[CAMZoomDialDotsView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    v7 = [(CAMZoomDialDotsView *)v5 _replicatorLayer];
    id v8 = v4;
    uint64_t v9 = [v8 CGImage];
    [v8 size];
    double v11 = v10;
    double v13 = v12;
    double v14 = *MEMORY[0x263F00148];
    double v15 = *(double *)(MEMORY[0x263F00148] + 8);
    v16 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    dotLayer = v6->__dotLayer;
    v6->__dotLayer = v16;

    -[CALayer setBounds:](v6->__dotLayer, "setBounds:", v14, v15, v11, v13);
    [(CALayer *)v6->__dotLayer setContents:v9];
    [v7 addSublayer:v6->__dotLayer];
    v18 = v6;
  }
  return v6;
}

- (int64_t)dotCount
{
  v2 = [(CAMZoomDialDotsView *)self _replicatorLayer];
  int64_t v3 = [v2 instanceCount];

  return v3;
}

- (void)setDotCount:(int64_t)a3
{
  id v4 = [(CAMZoomDialDotsView *)self _replicatorLayer];
  [v4 setInstanceCount:a3];
}

- (CGPoint)dotCenter
{
  v2 = [(CAMZoomDialDotsView *)self _dotLayer];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setDotCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CAMZoomDialDotsView *)self _dotLayer];
  objc_msgSend(v5, "setPosition:", x, y);
}

- (void)setDotSpacingAngle:(double)a3
{
  if (self->_dotSpacingAngle != a3)
  {
    self->_dotSpacingAngle = a3;
    CATransform3DMakeRotation(&v6, a3, 0.0, 0.0, 1.0);
    double v4 = [(CAMZoomDialDotsView *)self _replicatorLayer];
    CATransform3D v5 = v6;
    [v4 setInstanceTransform:&v5];
  }
}

- (double)dotSpacingAngle
{
  return self->_dotSpacingAngle;
}

- (CALayer)_dotLayer
{
  return self->__dotLayer;
}

- (void).cxx_destruct
{
}

@end