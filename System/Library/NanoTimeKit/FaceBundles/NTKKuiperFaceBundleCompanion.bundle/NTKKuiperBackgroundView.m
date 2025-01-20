@interface NTKKuiperBackgroundView
- (CGRect)dialFrame;
- (NTKKuiperBackgroundView)initWithDevice:(id)a3 dialRadius:(double)a4;
- (NTKKuiperColorPalette)colorPalette;
- (NTKKuiperFontRotationAnimation)digitRotationAnimation;
- (UIColor)overrideBackgroundColor;
- (double)digitRotationFraction;
- (id)_backgroundDigitColorForRotationFraction:(double)a3;
- (id)_foregroundDigitColorForRotationFraction:(double)a3;
- (void)_addMulticolorCircularGradientLayer;
- (void)_addMulticolorFullscreenGradientLayer;
- (void)_applyColorPalette;
- (void)_applyDialLayout;
- (void)_applyFontForDigitIndex:(unint64_t)a3;
- (void)_applyFullscreenGradientLayerEnabled:(BOOL)a3 circularGradientLayerEnabled:(BOOL)a4;
- (void)_applyTransformToLabelsWithRubberbanding:(double)a3;
- (void)_removeMulticolorCircularGradientLayer;
- (void)_removeMulticolorFullscreenGradientLayer;
- (void)_setTypographicSize:(CGSize)a3 rubberbanding:(double)a4;
- (void)applyFont;
- (void)setColorPalette:(id)a3;
- (void)setDigitRotationAnimation:(id)a3;
- (void)setDigitRotationFraction:(double)a3;
- (void)setOverrideBackgroundColor:(id)a3;
- (void)typographicSizeProviderUpdateNumeralSizes:(id)a3;
@end

@implementation NTKKuiperBackgroundView

- (NTKKuiperBackgroundView)initWithDevice:(id)a3 dialRadius:(double)a4
{
  id v7 = a3;
  [v7 screenBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v47.receiver = self;
  v47.super_class = (Class)NTKKuiperBackgroundView;
  v16 = -[NTKKuiperBackgroundView initWithFrame:](&v47, "initWithFrame:");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_device, a3);
    uint64_t v18 = objc_opt_new();
    backgroundColorLayer = v17->_backgroundColorLayer;
    v17->_backgroundColorLayer = (CALayer *)v18;

    v20 = [(NTKKuiperBackgroundView *)v17 layer];
    [v20 addSublayer:v17->_backgroundColorLayer];

    v21 = (NTKRoundedCornerOverlayView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v7, v9, v11, v13, v15);
    cornerView = v17->_cornerView;
    v17->_cornerView = v21;

    [(NTKKuiperBackgroundView *)v17 addSubview:v17->_cornerView];
    v17->_dialRadius = a4;
    uint64_t v23 = +[CAShapeLayer layer];
    dialLayer = v17->_dialLayer;
    v17->_dialLayer = (CAShapeLayer *)v23;

    v25 = [(NTKKuiperBackgroundView *)v17 layer];
    [v25 addSublayer:v17->_dialLayer];

    uint64_t v27 = sub_6CD0(v26, 0x3CuLL);
    minuteTickReplicatorLayer = v17->_minuteTickReplicatorLayer;
    v17->_minuteTickReplicatorLayer = (CAReplicatorLayer *)v27;

    uint64_t v29 = sub_6BF4();
    minuteTickLayer = v17->_minuteTickLayer;
    v17->_minuteTickLayer = (CALayer *)v29;

    [(CAReplicatorLayer *)v17->_minuteTickReplicatorLayer addSublayer:v17->_minuteTickLayer];
    v31 = [(NTKKuiperBackgroundView *)v17 layer];
    [v31 addSublayer:v17->_minuteTickReplicatorLayer];

    uint64_t v32 = 12;
    uint64_t v34 = sub_6CD0(v33, 0xCuLL);
    hourTickReplicatorLayer = v17->_hourTickReplicatorLayer;
    v17->_hourTickReplicatorLayer = (CAReplicatorLayer *)v34;

    uint64_t v36 = sub_6BF4();
    hourTickLayer = v17->_hourTickLayer;
    v17->_hourTickLayer = (CALayer *)v36;

    [(CAReplicatorLayer *)v17->_hourTickReplicatorLayer addSublayer:v17->_hourTickLayer];
    v38 = [(NTKKuiperBackgroundView *)v17 layer];
    [v38 addSublayer:v17->_hourTickReplicatorLayer];

    v39 = [NTKKuiperFontLoader alloc];
    sub_6D9C(v7, &v46);
    v40 = [(NTKKuiperFontLoader *)v39 initWithFontSize:*((double *)&v46 + 1)];
    fontLoader = v17->_fontLoader;
    v17->_fontLoader = v40;

    v42 = (NSArray *)objc_opt_new();
    do
    {
      v43 = [[NTKKuiperNumeralLabel alloc] initWithDevice:v7];
      [(NSArray *)v42 addObject:v43];
      [(NTKKuiperBackgroundView *)v17 addSubview:v43];

      --v32;
    }
    while (v32);
    digitLabels = v17->_digitLabels;
    v17->_digitLabels = v42;

    v17->_typographicSize = CGSizeZero;
    [(NTKKuiperBackgroundView *)v17 _applyDialLayout];
  }

  return v17;
}

- (void)_applyDialLayout
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  sub_6D9C(self->_device, &v21);
  [(CLKDevice *)self->_device screenBounds];
  -[CALayer setFrame:](self->_backgroundColorLayer, "setFrame:");
  CLKSizeCenteredInRectForDevice();
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  self->_dialFrame = v26;
  id v7 = CGPathCreateWithEllipseInRect(v26, 0);
  [(CAShapeLayer *)self->_dialLayer setPath:v7];
  CGPathRelease(v7);
  double v8 = *(double *)&v21;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  CGFloat v9 = CGRectGetWidth(v27) * 0.5;
  -[CAReplicatorLayer setFrame:](self->_hourTickReplicatorLayer, "setFrame:", x, y, width, height);
  -[CAReplicatorLayer setFrame:](self->_minuteTickReplicatorLayer, "setFrame:", x, y, width, height);
  long long v10 = v22;
  -[CALayer setBounds:](self->_hourTickLayer, "setBounds:", 0.0, 0.0, v22);
  -[CALayer setPosition:](self->_hourTickLayer, "setPosition:", v9, v8 + *((double *)&v10 + 1) * 0.5);
  long long v11 = v23;
  -[CALayer setBounds:](self->_minuteTickLayer, "setBounds:", 0.0, 0.0, v23);
  -[CALayer setPosition:](self->_minuteTickLayer, "setPosition:", v9, v8 + *((double *)&v11 + 1) * 0.5);
  double v12 = [(NTKKuiperFontLoader *)self->_fontLoader fontForMaximumOverscrollTypographicSize];
  if (qword_17258 != -1) {
    dispatch_once(&qword_17258, &stru_106F8);
  }
  NSAttributedStringKey v24 = NSFontAttributeName;
  v25 = v12;
  id v13 = (id)qword_17250;
  double v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v13 sizeWithAttributes:v14];

  [(NTKKuiperBackgroundView *)self bounds];
  CLKSizeCenteredInRectForDevice();
  digitLabels = self->_digitLabels;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7208;
  v20[3] = &unk_10698;
  v20[4] = v16;
  v20[5] = v17;
  v20[6] = v18;
  v20[7] = v19;
  [(NSArray *)digitLabels enumerateObjectsUsingBlock:v20];

  [(NTKKuiperBackgroundView *)self _applyTransformToLabelsWithRubberbanding:0.0];
  [(NTKKuiperBackgroundView *)self applyFont];
}

- (void)_applyTransformToLabelsWithRubberbanding:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  sub_6D9C(self->_device, &v8);
  double dialRadius = self->_dialRadius;
  digitLabels = self->_digitLabels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_72E4;
  v7[3] = &unk_106B8;
  *(double *)&v7[4] = dialRadius - (*(double *)&v8 + *((double *)&v9 + 1));
  *(double *)&v7[5] = a3;
  [(NSArray *)digitLabels enumerateObjectsUsingBlock:v7];
}

- (void)setOverrideBackgroundColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_overrideBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideBackgroundColor, a3);
    [(NTKKuiperBackgroundView *)self _applyColorPalette];
  }
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);

  [(NTKKuiperBackgroundView *)self _applyColorPalette];
}

- (void)_applyColorPalette
{
  v3 = self->_colorPalette;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v4 = self->_overrideBackgroundColor;
  id v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = [(NTKKuiperColorPalette *)v3 background];
  }
  id v7 = v6;
  [(CALayer *)self->_backgroundColorLayer setBackgroundColor:[(UIColor *)v7 CGColor]];
  id v8 = [(NTKKuiperColorPalette *)v3 dialBackground];
  -[CAShapeLayer setFillColor:](self->_dialLayer, "setFillColor:", [v8 CGColor]);
  id v9 = [(NTKKuiperColorPalette *)v3 hourTick];
  -[CALayer setBackgroundColor:](self->_hourTickLayer, "setBackgroundColor:", [v9 CGColor]);
  id v10 = [(NTKKuiperColorPalette *)v3 minuteTick];
  -[CALayer setBackgroundColor:](self->_minuteTickLayer, "setBackgroundColor:", [v10 CGColor]);
  +[CATransaction commit];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v10;
    id v36 = v9;
    id v37 = v8;
    long long v11 = v3;
    double v12 = [(NTKKuiperColorPalette *)v11 fromPalette];
    id v13 = [(NTKKuiperColorPalette *)v11 toPalette];
    double v14 = [v12 pigmentEditOption];
    unsigned int v15 = [v14 isRainbowColor];

    uint64_t v16 = [v13 pigmentEditOption];
    unsigned int v17 = [v16 isRainbowColor];

    if ((v17 & 1) != 0 || v15)
    {
      id v25 = v12;
      uint64_t v34 = v5;
      if ([v25 isRainbowColor])
      {
        if ((unint64_t)[v25 dial] > 1) {
          unsigned int v26 = 1;
        }
        else {
          unsigned int v26 = [v25 isTritium];
        }
      }
      else
      {
        unsigned int v26 = 0;
      }

      id v30 = v13;
      uint64_t v33 = v7;
      if ([v30 isRainbowColor])
      {
        if ((unint64_t)[v30 dial] > 1) {
          unsigned int v31 = 1;
        }
        else {
          unsigned int v31 = [v30 isTritium];
        }
      }
      else
      {
        unsigned int v31 = 0;
      }

      [(NTKKuiperBackgroundView *)self _applyFullscreenGradientLayerEnabled:v17 & (v31 ^ 1) | v15 & (v26 ^ 1) circularGradientLayerEnabled:v31 | v26];
      id v7 = v33;
      id v5 = v34;
    }
    else
    {
      [(NTKKuiperBackgroundView *)self _applyFullscreenGradientLayerEnabled:0 circularGradientLayerEnabled:0];
    }

    id v9 = v36;
    id v8 = v37;
    id v10 = v35;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = v7;
      uint64_t v19 = v3;
      v20 = [(NTKKuiperColorPalette *)v19 pigmentEditOption];
      unsigned int v21 = [v20 isRainbowColor];

      if (v21)
      {
        long long v22 = v5;
        long long v23 = v19;
        if ([(NTKKuiperColorPalette *)v23 isRainbowColor])
        {
          if ((unint64_t)[(NTKKuiperColorPalette *)v23 dial] > 1) {
            id v24 = &dword_0 + 1;
          }
          else {
            id v24 = [(NTKKuiperColorPalette *)v23 isTritium];
          }
        }
        else
        {
          id v24 = 0;
        }

        id v5 = v22;
        if (v22)
        {
          double v38 = 0.0;
          uint64_t v39 = 0;
          [(UIColor *)v22 getWhite:&v39 alpha:&v38];
          BOOL v32 = v38 < 1.0;
        }
        else
        {
          BOOL v32 = 1;
        }
        uint64_t v28 = v32 & ~v24;
        CGRect v27 = self;
        id v29 = v24;
      }
      else
      {
        CGRect v27 = self;
        uint64_t v28 = 0;
        id v29 = 0;
      }
      [(NTKKuiperBackgroundView *)v27 _applyFullscreenGradientLayerEnabled:v28 circularGradientLayerEnabled:v29];

      id v7 = v18;
    }
  }
}

- (void)_applyFullscreenGradientLayerEnabled:(BOOL)a3 circularGradientLayerEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    [(NTKKuiperBackgroundView *)self _addMulticolorFullscreenGradientLayer];
  }
  else {
    [(NTKKuiperBackgroundView *)self _removeMulticolorFullscreenGradientLayer];
  }
  if (v4) {
    [(NTKKuiperBackgroundView *)self _addMulticolorCircularGradientLayer];
  }
  else {
    [(NTKKuiperBackgroundView *)self _removeMulticolorCircularGradientLayer];
  }
  multicolorFullscreenGradientLayer = self->_multicolorFullscreenGradientLayer;
  if (multicolorFullscreenGradientLayer) {
    [(CALayer *)multicolorFullscreenGradientLayer setHidden:!v5];
  }
  multicolorCircularGradientLayer = self->_multicolorCircularGradientLayer;
  if (multicolorCircularGradientLayer)
  {
    [(CALayer *)multicolorCircularGradientLayer setHidden:!v4];
  }
}

- (void)_addMulticolorCircularGradientLayer
{
  if (!self->_multicolorCircularGradientLayer)
  {
    v3 = (CALayer *)objc_opt_new();
    multicolorCircularGradientLayer = self->_multicolorCircularGradientLayer;
    self->_multicolorCircularGradientLayer = v3;

    [(CLKDevice *)self->_device screenBounds];
    -[CALayer setFrame:](self->_multicolorCircularGradientLayer, "setFrame:");
    NTKKuiperRainbowGradientImage();
    id v9 = objc_claimAutoreleasedReturnValue();
    id v5 = [v9 CGImage];
    v6 = sub_6C7C();
    [(CALayer *)self->_multicolorCircularGradientLayer setActions:v6];

    [(CALayer *)self->_multicolorCircularGradientLayer setContents:v5];
    [(CALayer *)self->_multicolorCircularGradientLayer setContentsGravity:kCAGravityResizeAspectFill];
    id v7 = objc_opt_new();
    [(CAShapeLayer *)self->_dialLayer frame];
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setPath:", -[CAShapeLayer path](self->_dialLayer, "path"));
    [(CALayer *)self->_multicolorCircularGradientLayer setMask:v7];
    id v8 = [(NTKKuiperBackgroundView *)self layer];
    [v8 insertSublayer:self->_multicolorCircularGradientLayer below:self->_dialLayer];
  }
}

- (void)_addMulticolorFullscreenGradientLayer
{
  if (!self->_multicolorFullscreenGradientLayer)
  {
    v3 = (CALayer *)objc_opt_new();
    multicolorFullscreenGradientLayer = self->_multicolorFullscreenGradientLayer;
    self->_multicolorFullscreenGradientLayer = v3;

    [(CLKDevice *)self->_device screenBounds];
    -[CALayer setFrame:](self->_multicolorFullscreenGradientLayer, "setFrame:");
    NTKKuiperRainbowGradientImage();
    id v8 = objc_claimAutoreleasedReturnValue();
    id v5 = [v8 CGImage];
    v6 = sub_6C7C();
    [(CALayer *)self->_multicolorFullscreenGradientLayer setActions:v6];

    [(CALayer *)self->_multicolorFullscreenGradientLayer setContents:v5];
    [(CALayer *)self->_multicolorFullscreenGradientLayer setContentsGravity:kCAGravityResizeAspectFill];
    id v7 = [(NTKKuiperBackgroundView *)self layer];
    [v7 insertSublayer:self->_multicolorFullscreenGradientLayer below:self->_backgroundColorLayer];
  }
}

- (void)_removeMulticolorCircularGradientLayer
{
  multicolorCircularGradientLayer = self->_multicolorCircularGradientLayer;
  if (multicolorCircularGradientLayer)
  {
    [(CALayer *)multicolorCircularGradientLayer removeFromSuperlayer];
    BOOL v4 = self->_multicolorCircularGradientLayer;
    self->_multicolorCircularGradientLayer = 0;
  }
}

- (void)_removeMulticolorFullscreenGradientLayer
{
  multicolorFullscreenGradientLayer = self->_multicolorFullscreenGradientLayer;
  if (multicolorFullscreenGradientLayer)
  {
    [(CALayer *)multicolorFullscreenGradientLayer removeFromSuperlayer];
    BOOL v4 = self->_multicolorFullscreenGradientLayer;
    self->_multicolorFullscreenGradientLayer = 0;
  }
}

- (void)applyFont
{
  NSUInteger v3 = [(NSArray *)self->_digitLabels count];
  if (v3)
  {
    NSUInteger v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
      [(NTKKuiperBackgroundView *)self _applyFontForDigitIndex:i];
  }
}

- (void)_applyFontForDigitIndex:(unint64_t)a3
{
  digitRotationAnimation = self->_digitRotationAnimation;
  if (digitRotationAnimation)
  {
    [(NTKKuiperFontRotationAnimation *)digitRotationAnimation rotationForDigitIndex:a3 fraction:self->_digitRotationFraction];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  NSUInteger v8 = [(NSArray *)self->_digitLabels count];
  if (a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8;
  }
  id v19 = [(NSArray *)self->_digitLabels objectAtIndex:(unint64_t)(double)(v9 - 1)];
  double width = self->_typographicSize.width;
  double height = self->_typographicSize.height;
  unint64_t v12 = a3 - 9;
  id v13 = -[NTKKuiperFontLoader foregroundFontWithTypographicSize:tickRotation:flipped:](self->_fontLoader, "foregroundFontWithTypographicSize:tickRotation:flipped:", a3 - 9 < 0xFFFFFFFFFFFFFFFBLL, width, height, v7);
  [v19 setForegroundFont:v13];
  if (v7 >= 1.0)
  {
    if (qword_17268 != -1) {
      dispatch_once(&qword_17268, &stru_10718);
    }
    id v14 = (id)qword_17260;
  }
  else
  {
    id v14 = +[NSString stringWithFormat:@"%lu", v9];
  }
  unsigned int v15 = v14;
  [v19 setText:v14];
  if (v7 <= 0.0)
  {
    uint64_t v18 = [(NTKKuiperColorPalette *)self->_colorPalette digit];
    uint64_t v16 = 0;
    unsigned int v17 = 0;
  }
  else
  {
    uint64_t v16 = -[NTKKuiperFontLoader backgroundFontWithTypographicSize:tickRotation:flipped:](self->_fontLoader, "backgroundFontWithTypographicSize:tickRotation:flipped:", v12 < 0xFFFFFFFFFFFFFFFBLL, width, height, v7);
    unsigned int v17 = [(NTKKuiperBackgroundView *)self _backgroundDigitColorForRotationFraction:v7];
    uint64_t v18 = [(NTKKuiperBackgroundView *)self _foregroundDigitColorForRotationFraction:v7];
  }
  [v19 setBackgroundFont:v16];
  [v19 setBackgroundTextColor:v17];
  [v19 setForegroundTextColor:v18];
  [v19 setNeedsDisplay];
}

- (id)_backgroundDigitColorForRotationFraction:(double)a3
{
  return [(NTKKuiperBackgroundView *)self _foregroundDigitColorForRotationFraction:1.0 - a3];
}

- (id)_foregroundDigitColorForRotationFraction:(double)a3
{
  NSUInteger v4 = [(NTKKuiperColorPalette *)self->_colorPalette digit];
  id v5 = [(NTKKuiperColorPalette *)self->_colorPalette dialBackground];
  double v6 = NTKInterpolateBetweenColors();

  return v6;
}

- (void)typographicSizeProviderUpdateNumeralSizes:(id)a3
{
  id v4 = a3;
  [v4 typographicSize];
  double v6 = v5;
  double v8 = v7;
  [v4 rubberbanding];
  double v10 = v9;

  -[NTKKuiperBackgroundView _setTypographicSize:rubberbanding:](self, "_setTypographicSize:rubberbanding:", v6, v8, v10);
}

- (void)_setTypographicSize:(CGSize)a3 rubberbanding:(double)a4
{
  if (self->_typographicSize.width != a3.width || self->_typographicSize.height != a3.height)
  {
    self->_typographicSize = a3;
    [(NTKKuiperBackgroundView *)self applyFont];
  }

  [(NTKKuiperBackgroundView *)self _applyTransformToLabelsWithRubberbanding:a4];
}

- (UIColor)overrideBackgroundColor
{
  return self->_overrideBackgroundColor;
}

- (NTKKuiperFontRotationAnimation)digitRotationAnimation
{
  return self->_digitRotationAnimation;
}

- (void)setDigitRotationAnimation:(id)a3
{
}

- (double)digitRotationFraction
{
  return self->_digitRotationFraction;
}

- (void)setDigitRotationFraction:(double)a3
{
  self->_digitRotationFraction = a3;
}

- (NTKKuiperColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (CGRect)dialFrame
{
  double x = self->_dialFrame.origin.x;
  double y = self->_dialFrame.origin.y;
  double width = self->_dialFrame.size.width;
  double height = self->_dialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_digitRotationAnimation, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
  objc_storeStrong((id *)&self->_multicolorFullscreenGradientLayer, 0);
  objc_storeStrong((id *)&self->_multicolorCircularGradientLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_hourTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickLayer, 0);
  objc_storeStrong((id *)&self->_hourTickLayer, 0);
  objc_storeStrong((id *)&self->_digitLabels, 0);
  objc_storeStrong((id *)&self->_dialLayer, 0);
  objc_storeStrong((id *)&self->_backgroundColorLayer, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_fontLoader, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end