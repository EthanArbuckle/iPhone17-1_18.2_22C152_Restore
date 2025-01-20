@interface NTKRenegadeBackgroundView
- (BOOL)isAnimating;
- (BOOL)topQuiltPieceOverlapsBottom;
- (CGPath)bottomQuiltPathRef;
- (CGPath)topQuiltPathRef;
- (NTKRenegadeBackgroundConfiguration)configuration;
- (NTKRenegadeBackgroundView)initWithDevice:(id)a3;
- (UIColor)bottomQuiltColor;
- (UIColor)topQuiltColor;
- (void)setBottomQuiltColor:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setTopQuiltColor:(id)a3;
- (void)setTopQuiltPieceOverlapsBottom:(BOOL)a3;
@end

@implementation NTKRenegadeBackgroundView

- (NTKRenegadeBackgroundView)initWithDevice:(id)a3
{
  id v5 = a3;
  [v5 screenBounds];
  v15.receiver = self;
  v15.super_class = (Class)NTKRenegadeBackgroundView;
  v6 = -[NTKRenegadeBackgroundView initWithFrame:](&v15, "initWithFrame:");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[CAShapeLayer layer];
    topQuiltPieceLayer = v7->_topQuiltPieceLayer;
    v7->_topQuiltPieceLayer = (CAShapeLayer *)v8;

    v10 = [(NTKRenegadeBackgroundView *)v7 layer];
    [v10 addSublayer:v7->_topQuiltPieceLayer];

    uint64_t v11 = +[CAShapeLayer layer];
    bottomQuiltPieceLayer = v7->_bottomQuiltPieceLayer;
    v7->_bottomQuiltPieceLayer = (CAShapeLayer *)v11;

    v13 = [(NTKRenegadeBackgroundView *)v7 layer];
    [v13 addSublayer:v7->_bottomQuiltPieceLayer];
  }
  return v7;
}

- (void)setTopQuiltColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_topQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_topQuiltColor, a3);
    [(CAShapeLayer *)self->_topQuiltPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (void)setBottomQuiltColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_bottomQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_bottomQuiltColor, a3);
    [(CAShapeLayer *)self->_bottomQuiltPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (CGPath)topQuiltPathRef
{
  v2 = [(CAShapeLayer *)self->_topQuiltPieceLayer presentationLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (CGPath)bottomQuiltPathRef
{
  v2 = [(CAShapeLayer *)self->_bottomQuiltPieceLayer presentationLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (BOOL)topQuiltPieceOverlapsBottom
{
  v3 = [(NTKRenegadeBackgroundView *)self layer];
  v4 = [v3 sublayers];

  if ([v4 containsObject:self->_topQuiltPieceLayer]) {
    unint64_t v5 = (unint64_t)[v4 indexOfObject:self->_topQuiltPieceLayer];
  }
  else {
    unint64_t v5 = -1;
  }
  if ([v4 containsObject:self->_bottomQuiltPieceLayer]) {
    unint64_t v6 = (unint64_t)[v4 indexOfObject:self->_bottomQuiltPieceLayer];
  }
  else {
    unint64_t v6 = -1;
  }
  BOOL v7 = v5 > v6;

  return v7;
}

- (void)setTopQuiltPieceOverlapsBottom:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NTKRenegadeBackgroundView *)self layer];
  id v8 = v5;
  unint64_t v6 = &OBJC_IVAR___NTKRenegadeBackgroundView__bottomQuiltPieceLayer;
  if (v3) {
    BOOL v7 = &OBJC_IVAR___NTKRenegadeBackgroundView__topQuiltPieceLayer;
  }
  else {
    BOOL v7 = &OBJC_IVAR___NTKRenegadeBackgroundView__bottomQuiltPieceLayer;
  }
  if (!v3) {
    unint64_t v6 = &OBJC_IVAR___NTKRenegadeBackgroundView__topQuiltPieceLayer;
  }
  [v5 insertSublayer:*(Class *)((char *)&self->super.super.super.isa + *v7) above:*(Class *)((char *)&self->super.super.super.isa + *v6)];
}

- (void)setConfiguration:(id)a3
{
  BOOL v7 = (NTKRenegadeBackgroundConfiguration *)a3;
  if (self->_configuration != v7)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    id v5 = [(NTKRenegadeBackgroundConfiguration *)v7 topQuiltPath];
    -[CAShapeLayer setPath:](self->_topQuiltPieceLayer, "setPath:", [v5 CGPath]);

    id v6 = [(NTKRenegadeBackgroundConfiguration *)v7 bottomQuiltPath];
    -[CAShapeLayer setPath:](self->_bottomQuiltPieceLayer, "setPath:", [v6 CGPath]);
  }
}

- (UIColor)topQuiltColor
{
  return self->_topQuiltColor;
}

- (UIColor)bottomQuiltColor
{
  return self->_bottomQuiltColor;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (NTKRenegadeBackgroundConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bottomQuiltColor, 0);
  objc_storeStrong((id *)&self->_topQuiltColor, 0);
  objc_storeStrong((id *)&self->_bottomQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_topQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_animationCompletionTimer, 0);
  objc_storeStrong(&self->_animationCompletion, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end