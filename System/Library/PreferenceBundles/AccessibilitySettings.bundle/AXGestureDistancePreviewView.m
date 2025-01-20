@interface AXGestureDistancePreviewView
- (AXGestureDistancePreviewView)initWithSpecifier:(id)a3;
- (SEL)settingsGetter;
- (double)circleRadius;
- (double)maximumCircleRadius;
- (double)preferredHeightForWidth:(double)a3;
- (void)drawCircleWithRadius:(double)a3;
- (void)layoutSubviews;
- (void)setupPreview;
@end

@implementation AXGestureDistancePreviewView

- (AXGestureDistancePreviewView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXGestureDistancePreviewView;
  v5 = -[AXGestureDistancePreviewView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    [(AXGestureDistancePreviewView *)v5 setupPreview];
    objc_initWeak(&location, v6);
    v7 = +[AXSettings sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __50__AXGestureDistancePreviewView_initWithSpecifier___block_invoke;
    v9[3] = &unk_208BB8;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", v9, -[AXGestureDistancePreviewView settingsGetter](v10, "settingsGetter"), v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __50__AXGestureDistancePreviewView_initWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) circleRadius];
  objc_msgSend(WeakRetained, "drawCircleWithRadius:");
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AXGestureDistancePreviewView;
  [(AXGestureDistancePreviewView *)&v11 layoutSubviews];
  [(AXGestureDistancePreviewView *)self bounds];
  v12.origin.x = v3;
  v12.origin.y = v4;
  v12.size.width = v5;
  v12.size.height = v6;
  if (!CGRectEqualToRect(self->_lastSeenBounds, v12))
  {
    [(AXGestureDistancePreviewView *)self bounds];
    self->_lastSeenBounds.origin.x = v7;
    self->_lastSeenBounds.origin.y = v8;
    self->_lastSeenBounds.size.width = v9;
    self->_lastSeenBounds.size.height = v10;
    [(AXGestureDistancePreviewView *)self circleRadius];
    -[AXGestureDistancePreviewView drawCircleWithRadius:](self, "drawCircleWithRadius:");
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  [(AXGestureDistancePreviewView *)self maximumCircleRadius];
  return v3 + v3;
}

- (void)setupPreview
{
  double v3 = +[CAShapeLayer layer];
  circleLayer = self->_circleLayer;
  self->_circleLayer = v3;

  CGFloat v5 = self->_circleLayer;
  id v6 = +[UIColor darkGrayColor];
  -[CAShapeLayer setStrokeColor:](v5, "setStrokeColor:", [v6 CGColor]);

  CGFloat v7 = self->_circleLayer;
  id v8 = +[UIColor colorWithWhite:0.75 alpha:0.75];
  -[CAShapeLayer setFillColor:](v7, "setFillColor:", [v8 CGColor]);

  id v9 = [(AXGestureDistancePreviewView *)self layer];
  [v9 addSublayer:self->_circleLayer];
}

- (void)drawCircleWithRadius:(double)a3
{
  [(AXGestureDistancePreviewView *)self bounds];
  AX_CGRectGetCenter();
  double v6 = v5 - a3;
  double v8 = v7 - a3;
  double v9 = a3 + a3;
  id v13 = +[CABasicAnimation animationWithKeyPath:@"path"];
  objc_msgSend(v13, "setFromValue:", -[CAShapeLayer path](self->_circleLayer, "path"));
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v6, v8, v9, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", objc_msgSend(v10, "CGPath"));

  objc_super v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v13 setTimingFunction:v11];

  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v6, v8, v9, v9);
  id v12 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", [v12 CGPath]);

  [(CAShapeLayer *)self->_circleLayer addAnimation:v13 forKey:@"changePathAnimation"];
}

- (void).cxx_destruct
{
}

- (double)circleRadius
{
  return 0.0;
}

- (double)maximumCircleRadius
{
  return 0.0;
}

- (SEL)settingsGetter
{
  return 0;
}

@end