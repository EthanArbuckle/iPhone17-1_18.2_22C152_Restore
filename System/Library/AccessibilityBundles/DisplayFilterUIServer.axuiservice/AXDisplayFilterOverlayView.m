@interface AXDisplayFilterOverlayView
- (AXDisplayFilterOverlayView)initWithFrame:(CGRect)a3;
- (CABackdropLayer)effectBackdropLayer;
- (CAReplicatorLayer)effectReplicatorLayer;
- (NSArray)filters;
- (UIView)effectView;
- (void)_setupLayers;
- (void)_updateLensEffect;
- (void)layoutSubviews;
- (void)setEffectBackdropLayer:(id)a3;
- (void)setEffectReplicatorLayer:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFilters:(id)a3;
@end

@implementation AXDisplayFilterOverlayView

- (AXDisplayFilterOverlayView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AXDisplayFilterOverlayView;
  v3 = -[AXDisplayFilterOverlayView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AXDisplayFilterOverlayView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = +[UIColor clearColor];
    [(AXDisplayFilterOverlayView *)v4 setBackgroundColor:v5];

    [(AXDisplayFilterOverlayView *)v4 setClipsToBounds:1];
    id v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(AXDisplayFilterOverlayView *)v4 setEffectView:v6];
    [(AXDisplayFilterOverlayView *)v4 addSubview:v6];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = objc_msgSend(v6, "ax_pinConstraintsInAllDimensionsToView:", v4);
    id v8 = objc_alloc_init((Class)CAReplicatorLayer);
    [v8 setAllowsHitTesting:0];
    [v8 setInstanceCount:2];
    [(AXDisplayFilterOverlayView *)v4 setEffectReplicatorLayer:v8];
    v9 = [v6 layer];
    [v9 addSublayer:v8];

    v10 = [v6 layer];
    [v10 setAllowsHitTesting:0];

    id v11 = objc_alloc_init((Class)CABackdropLayer);
    [v11 setEnabled:1];
    [v11 setAllowsHitTesting:0];
    [(AXDisplayFilterOverlayView *)v4 setEffectBackdropLayer:v11];
    [v8 addSublayer:v11];
    v12 = [(AXDisplayFilterOverlayView *)v4 effectView];
    [(AXDisplayFilterOverlayView *)v4 sendSubviewToBack:v12];

    [(AXDisplayFilterOverlayView *)v4 layoutSubviews];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AXDisplayFilterOverlayView;
  [(AXDisplayFilterOverlayView *)&v3 layoutSubviews];
  [(AXDisplayFilterOverlayView *)self _setupLayers];
}

- (void)_setupLayers
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(AXDisplayFilterOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v12 = [(AXDisplayFilterOverlayView *)self effectReplicatorLayer];
  id v11 = [(AXDisplayFilterOverlayView *)self effectBackdropLayer];
  objc_msgSend(v12, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v12, "setPosition:", v8, v10);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setPosition:", CGPointZero.x, CGPointZero.y);
  +[CATransaction commit];
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);

  [(AXDisplayFilterOverlayView *)self _updateLensEffect];
}

- (void)_updateLensEffect
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v12 = [(AXDisplayFilterOverlayView *)self filters];
  double v3 = [(AXDisplayFilterOverlayView *)self effectBackdropLayer];
  id v4 = [v12 count];
  BOOL v5 = v4 == 0;
  double v6 = [(AXDisplayFilterOverlayView *)self effectReplicatorLayer];
  double v7 = v6;
  if (v4)
  {
    double v8 = [v6 superlayer];

    if (v8)
    {
      BOOL v5 = 0;
      BOOL v9 = 1;
      goto LABEL_7;
    }
    double v7 = [(AXDisplayFilterOverlayView *)self effectView];
    double v10 = [v7 layer];
    id v11 = [(AXDisplayFilterOverlayView *)self effectReplicatorLayer];
    [v10 addSublayer:v11];
  }
  else
  {
    [v6 removeFromSuperlayer];
  }
  BOOL v9 = v4 != 0;

LABEL_7:
  [v3 setHidden:v5];
  [v3 setEnabled:v9];
  [v3 setFilters:v12];
  +[CATransaction commit];
}

- (NSArray)filters
{
  return self->_filters;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (CAReplicatorLayer)effectReplicatorLayer
{
  return self->_effectReplicatorLayer;
}

- (void)setEffectReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)effectBackdropLayer
{
  return self->_effectBackdropLayer;
}

- (void)setEffectBackdropLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectBackdropLayer, 0);
  objc_storeStrong((id *)&self->_effectReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_filters, 0);
}

@end