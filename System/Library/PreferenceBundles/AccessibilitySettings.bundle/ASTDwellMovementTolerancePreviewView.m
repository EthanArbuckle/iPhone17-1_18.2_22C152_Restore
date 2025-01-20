@interface ASTDwellMovementTolerancePreviewView
- (ASTDwellMovementTolerancePreviewView)initWithSpecifier:(id)a3;
- (double)_movementToleranceRadius;
- (double)preferredHeightForWidth:(double)a3;
- (unint64_t)clientType;
- (void)_updateCurrentAppearanceIfNeeded;
- (void)didMoveToSuperview;
- (void)drawCircleWithRadius:(double)a3;
- (void)layoutSubviews;
- (void)setClientType:(unint64_t)a3;
- (void)setupPreview;
@end

@implementation ASTDwellMovementTolerancePreviewView

- (ASTDwellMovementTolerancePreviewView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASTDwellMovementTolerancePreviewView;
  v5 = -[ASTDwellMovementTolerancePreviewView initWithFrame:](&v17, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    [(ASTDwellMovementTolerancePreviewView *)v5 setupPreview];
    v7 = [v4 propertyForKey:@"DwellMovementToleranceClientType"];

    if (v7)
    {
      objc_initWeak(&location, v6);
      v8 = [v4 propertyForKey:@"DwellMovementToleranceClientType"];
      v6->_clientType = (unint64_t)[v8 unsignedIntegerValue];

      if (v6->_clientType == 1)
      {
        v9 = +[AXSettings sharedInstance];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = __58__ASTDwellMovementTolerancePreviewView_initWithSpecifier___block_invoke;
        v14[3] = &unk_208798;
        v10 = &v15;
        objc_copyWeak(&v15, &location);
        [v9 registerUpdateBlock:v14 forRetrieveSelector:"switchControlCameraPointPickerDwellMovementToleranceRadius" withListener:v6];
      }
      else
      {
        v9 = +[AXSettings sharedInstance];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = __58__ASTDwellMovementTolerancePreviewView_initWithSpecifier___block_invoke_2;
        v12[3] = &unk_208798;
        v10 = &v13;
        objc_copyWeak(&v13, &location);
        [v9 registerUpdateBlock:v12 forRetrieveSelector:"assistiveTouchMouseDwellControlMovementToleranceRadius" withListener:v6];
      }

      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

void __58__ASTDwellMovementTolerancePreviewView_initWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  [v1 switchControlCameraPointPickerDwellMovementToleranceRadius];
  objc_msgSend(WeakRetained, "drawCircleWithRadius:");
}

void __58__ASTDwellMovementTolerancePreviewView_initWithSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSettings sharedInstance];
  [v1 assistiveTouchMouseDwellControlMovementToleranceRadius];
  objc_msgSend(WeakRetained, "drawCircleWithRadius:");
}

- (double)preferredHeightForWidth:(double)a3
{
  double v4 = kAXSAssistiveTouchMouseDwellControlMovementToleranceMax;
  [(ASTDwellMovementTolerancePreviewView *)self layoutMargins];
  double v6 = v5 + v4 * 2.0;
  [(ASTDwellMovementTolerancePreviewView *)self layoutMargins];
  return v6 + v7;
}

- (double)_movementToleranceRadius
{
  unint64_t v3 = [(ASTDwellMovementTolerancePreviewView *)self clientType];
  if (!v3)
  {
    double v4 = +[AXSettings sharedInstance];
    [v4 assistiveTouchMouseDwellControlMovementToleranceRadius];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    double v4 = +[AXSettings sharedInstance];
    [v4 switchControlCameraPointPickerDwellMovementToleranceRadius];
LABEL_5:
    double v2 = v5;
  }
  return v2;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)ASTDwellMovementTolerancePreviewView;
  [(ASTDwellMovementTolerancePreviewView *)&v4 didMoveToSuperview];
  unint64_t v3 = [(ASTDwellMovementTolerancePreviewView *)self superview];

  if (v3)
  {
    [(ASTDwellMovementTolerancePreviewView *)self _movementToleranceRadius];
    -[ASTDwellMovementTolerancePreviewView drawCircleWithRadius:](self, "drawCircleWithRadius:");
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ASTDwellMovementTolerancePreviewView;
  [(ASTDwellMovementTolerancePreviewView *)&v3 layoutSubviews];
  [(ASTDwellMovementTolerancePreviewView *)self _updateCurrentAppearanceIfNeeded];
}

- (void)_updateCurrentAppearanceIfNeeded
{
  objc_super v3 = [(ASTDwellMovementTolerancePreviewView *)self traitCollection];
  objc_super v4 = (char *)[v3 userInterfaceStyle];

  int64_t v5 = 1;
  if (v4 == (unsigned char *)&dword_0 + 2) {
    int64_t v5 = 2;
  }
  if (self->_currentAppearance != v5)
  {
    self->_currentAppearance = v5;
    [(CAShapeLayer *)self->_circleLayer removeFromSuperlayer];
    [(ASTDwellMovementTolerancePreviewView *)self setupPreview];
    [(ASTDwellMovementTolerancePreviewView *)self _movementToleranceRadius];
    -[ASTDwellMovementTolerancePreviewView drawCircleWithRadius:](self, "drawCircleWithRadius:");
  }
}

- (void)setupPreview
{
  objc_super v3 = +[CAShapeLayer layer];
  circleLayer = self->_circleLayer;
  self->_circleLayer = v3;

  int64_t v5 = self->_circleLayer;
  id v6 = +[UIColor labelColor];
  -[CAShapeLayer setStrokeColor:](v5, "setStrokeColor:", [v6 CGColor]);

  double v7 = self->_circleLayer;
  id v8 = +[UIColor tertiaryLabelColor];
  -[CAShapeLayer setFillColor:](v7, "setFillColor:", [v8 CGColor]);

  id v9 = [(ASTDwellMovementTolerancePreviewView *)self layer];
  [v9 addSublayer:self->_circleLayer];
}

- (void)drawCircleWithRadius:(double)a3
{
  [(ASTDwellMovementTolerancePreviewView *)self bounds];
  AX_CGRectGetCenter();
  double v6 = v5 - a3;
  double v8 = v7 - a3;
  double v9 = a3 + a3;
  id v13 = +[CABasicAnimation animationWithKeyPath:@"path"];
  objc_msgSend(v13, "setFromValue:", -[CAShapeLayer path](self->_circleLayer, "path"));
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v6, v8, v9, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", objc_msgSend(v10, "CGPath"));

  v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v13 setTimingFunction:v11];

  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v6, v8, v9, v9);
  id v12 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", [v12 CGPath]);

  [(CAShapeLayer *)self->_circleLayer addAnimation:v13 forKey:@"changePathAnimation"];
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
}

@end