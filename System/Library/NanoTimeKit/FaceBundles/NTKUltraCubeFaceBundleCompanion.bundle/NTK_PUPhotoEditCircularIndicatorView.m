@interface NTK_PUPhotoEditCircularIndicatorView
- (CAShapeLayer)backgroundLayer;
- (CAShapeLayer)progressLayer;
- (NTK_PUPhotoEditCircularIndicatorView)initWithFrame:(CGRect)a3;
- (UIColor)ringColor;
- (double)currentValue;
- (double)maxValue;
- (double)minValue;
- (double)thickness;
- (void)_layoutSubLayers;
- (void)_setupLayers;
- (void)_updateProgressLayer;
- (void)layoutSubviews;
- (void)resetToDefaults;
- (void)setBackgroundLayer:(id)a3;
- (void)setCurrentValue:(double)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setProgressLayer:(id)a3;
- (void)setRingColor:(id)a3;
- (void)setThickness:(double)a3;
@end

@implementation NTK_PUPhotoEditCircularIndicatorView

- (NTK_PUPhotoEditCircularIndicatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTK_PUPhotoEditCircularIndicatorView;
  v3 = -[NTK_PUPhotoEditCircularIndicatorView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTK_PUPhotoEditCircularIndicatorView *)v3 _setupLayers];
    v5 = +[PUPhotoEditProtoSettings sharedInstance];
    [v5 strokeWidth];
    -[NTK_PUPhotoEditCircularIndicatorView setThickness:](v4, "setThickness:");

    v4->_minValue = -1.0;
    v4->_maxValue = 1.0;
    v4->_currentValue = 0.0;
    id v6 = +[UIColor colorWithWhite:0.8 alpha:0.3];
    -[CAShapeLayer setStrokeColor:](v4->_backgroundLayer, "setStrokeColor:", [v6 CGColor]);

    id v7 = +[UIColor colorWithWhite:0.8 alpha:1.0];
    -[CAShapeLayer setStrokeColor:](v4->_progressLayer, "setStrokeColor:", [v7 CGColor]);
  }
  return v4;
}

- (void)_setupLayers
{
  v3 = +[CAShapeLayer layer];
  [(NTK_PUPhotoEditCircularIndicatorView *)self setBackgroundLayer:v3];

  v4 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v4 setFillColor:0];

  v5 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v5 setStrokeEnd:1.0];

  id v6 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v6 setLineWidth:2.5];

  id v7 = [(NTK_PUPhotoEditCircularIndicatorView *)self layer];
  v8 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v7 addSublayer:v8];

  objc_super v9 = +[CAShapeLayer layer];
  [(NTK_PUPhotoEditCircularIndicatorView *)self setProgressLayer:v9];

  v10 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v10 setFillColor:0];

  v11 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v11 setLineWidth:2.0];

  v12 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v12 setLineCap:kCALineCapRound];

  v13 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v13 setStrokeEnd:0.0];

  id v15 = [(NTK_PUPhotoEditCircularIndicatorView *)self layer];
  v14 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v15 addSublayer:v14];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTK_PUPhotoEditCircularIndicatorView;
  [(NTK_PUPhotoEditCircularIndicatorView *)&v3 layoutSubviews];
  [(NTK_PUPhotoEditCircularIndicatorView *)self _layoutSubLayers];
}

- (void)_layoutSubLayers
{
  [(NTK_PUPhotoEditCircularIndicatorView *)self bounds];
  double v4 = v3 + -2.5;
  [(NTK_PUPhotoEditCircularIndicatorView *)self bounds];
  double v6 = v5 + -2.5;
  +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", 0.0, 0.0, v4, v5 + -2.5, v4 * 0.5);
  id v7 = objc_claimAutoreleasedReturnValue();
  id v8 = [v7 CGPath];

  objc_super v9 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v4, v6);

  v10 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v10 setPath:v8];

  [(NTK_PUPhotoEditCircularIndicatorView *)self bounds];
  PXRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  id v15 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  objc_msgSend(v15, "setPosition:", v12, v14);

  v16 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v4, v6);

  v17 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v17 setPath:v8];

  id v23 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v23 position];
  double v19 = v18;
  double v21 = v20;
  v22 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  objc_msgSend(v22, "setPosition:", v19, v21);
}

- (void)setThickness:(double)a3
{
  if (self->_thickness != a3)
  {
    double v5 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
    [v5 setLineWidth:a3];

    double v6 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
    [v6 setLineWidth:a3 + -0.5];

    [(NTK_PUPhotoEditCircularIndicatorView *)self setNeedsLayout];
  }
}

- (void)setRingColor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 colorWithAlphaComponent:0.3];
  id v6 = [v5 CGColor];
  id v7 = [(NTK_PUPhotoEditCircularIndicatorView *)self backgroundLayer];
  [v7 setStrokeColor:v6];

  id v8 = v4;
  id v9 = [v8 CGColor];

  id v10 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v10 setStrokeColor:v9];
}

- (UIColor)ringColor
{
  v2 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  double v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 strokeColor]);

  return (UIColor *)v3;
}

- (void)_updateProgressLayer
{
  BOOL v3 = +[CATransaction disableActions];
  +[CATransaction setDisableActions:1];
  [(NTK_PUPhotoEditCircularIndicatorView *)self currentValue];
  if (v4 == 0.0)
  {
    id v5 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
    [v5 setStrokeEnd:0.0];

    id v6 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
    id v7 = v6;
    double v8 = 0.0;
LABEL_5:
    [v6 setStrokeStart:v8];
    goto LABEL_9;
  }
  [(NTK_PUPhotoEditCircularIndicatorView *)self currentValue];
  double v10 = v9;
  double v11 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  double v12 = v11;
  if (v10 < 0.0)
  {
    [v11 setStrokeEnd:1.0];

    [(NTK_PUPhotoEditCircularIndicatorView *)self currentValue];
    double v14 = v13 + 1.0;
    id v6 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
    id v7 = v6;
    double v8 = v14;
    goto LABEL_5;
  }
  [v11 setStrokeStart:0.0];

  [(NTK_PUPhotoEditCircularIndicatorView *)self currentValue];
  double v16 = v15;
  v17 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v17 setStrokeEnd:v16];

  id v7 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v7 strokeEnd];
  double v18 = &kCALineCapButt;
  if (v19 != 1.0) {
    double v18 = &kCALineCapRound;
  }
  CAShapeLayerLineCap v20 = *v18;
  double v21 = [(NTK_PUPhotoEditCircularIndicatorView *)self progressLayer];
  [v21 setLineCap:v20];

LABEL_9:

  +[CATransaction setDisableActions:v3];
}

- (void)setCurrentValue:(double)a3
{
  [(NTK_PUPhotoEditCircularIndicatorView *)self minValue];
  [(NTK_PUPhotoEditCircularIndicatorView *)self maxValue];
  PXClamp();
  if (self->_currentValue != a3)
  {
    self->_currentValue = a3;
    [(NTK_PUPhotoEditCircularIndicatorView *)self _updateProgressLayer];
  }
}

- (void)resetToDefaults
{
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_currentValue = 0.0;
  [(NTK_PUPhotoEditCircularIndicatorView *)self _updateProgressLayer];
}

- (double)thickness
{
  return self->_thickness;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);

  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end