@interface NTKBigNumeralsDigitalTimeView
- (BOOL)isFrozen;
- (BOOL)showingStatus;
- (NTKBigNumeralsDigitalTimeView)initWithDevice:(id)a3;
- (NTKBigNumeralsDigitalTimeViewDelegate)delegate;
- (id)font;
- (unint64_t)style;
- (unint64_t)typeface;
- (void)_updateLabels;
- (void)applyColorPalette:(id)a3;
- (void)applyRainbowColorTransitionWithFraction:(double)a3 colorPalette:(id)a4;
- (void)applyStyle:(unint64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromTypeface:(unint64_t)a4 toTypeface:(unint64_t)a5;
- (void)applyTypeface:(unint64_t)a3;
- (void)cleanupTransition;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setShowingStatus:(BOOL)a3;
@end

@implementation NTKBigNumeralsDigitalTimeView

- (NTKBigNumeralsDigitalTimeView)initWithDevice:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NTKBigNumeralsDigitalTimeView;
  v6 = [(NTKBigNumeralsDigitalTimeView *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_statusBarTransitionFraction = 0.0;
    uint64_t v8 = objc_opt_new();
    timeLabelsContainerView = v7->_timeLabelsContainerView;
    v7->_timeLabelsContainerView = (UIView *)v8;

    [(NTKBigNumeralsDigitalTimeView *)v7 addSubview:v7->_timeLabelsContainerView];
    uint64_t v10 = +[NTKBigNumeralsDigitalColorPalette multicolorAxialGradientLayerForColor:3012 device:v5];
    gradientLayer = v7->_gradientLayer;
    v7->_gradientLayer = (CAGradientLayer *)v10;

    v12 = [(NTKBigNumeralsDigitalTimeView *)v7 layer];
    [v12 insertSublayer:v7->_gradientLayer atIndex:0];

    v13 = (CALayer *)objc_alloc_init((Class)CALayer);
    topLabelColorLayer = v7->_topLabelColorLayer;
    v7->_topLabelColorLayer = v13;

    v15 = [(NTKBigNumeralsDigitalTimeView *)v7 layer];
    [v15 insertSublayer:v7->_topLabelColorLayer above:v7->_gradientLayer];

    v16 = (CALayer *)objc_alloc_init((Class)CALayer);
    bottomLabelColorLayer = v7->_bottomLabelColorLayer;
    v7->_bottomLabelColorLayer = v16;

    v18 = [(NTKBigNumeralsDigitalTimeView *)v7 layer];
    [v18 insertSublayer:v7->_bottomLabelColorLayer above:v7->_gradientLayer];

    sub_5050(v5, (uint64_t)v36);
    double v19 = v37;
    if ([v5 deviceCategory] == (char *)&dword_0 + 3)
    {
      CFStringRef v20 = @"A";
    }
    else
    {
      if ([v5 deviceCategory] != &dword_4)
      {
        v22 = @"__TokyoFontDO";
        v21 = @"__TokyoFontD";
        goto LABEL_8;
      }
      CFStringRef v20 = @"G";
    }
    v21 = [@"__TokyoFontD" stringByAppendingString:v20];
    v22 = [@"__TokyoFontDO" stringByAppendingString:v20];
LABEL_8:
    LOBYTE(v31) = 0;
    v23 = (NTKBigNumeralsTimeComponentLabel *)[objc_alloc((Class)NTKBigNumeralsTimeComponentLabel) initWithDevice:v5 timeComponent:0 fontVariant:1 filledFontSectName:v21 outlineFontSectName:v22 dsoHandle:&dword_0 fontSize:v19 useLigatures:v31];
    topLabel = v7->_topLabel;
    v7->_topLabel = v23;

    [(NTKBigNumeralsTimeComponentLabel *)v7->_topLabel setTextAlignment:2];
    [(UIView *)v7->_timeLabelsContainerView addSubview:v7->_topLabel];
    LOBYTE(v32) = 0;
    v25 = (NTKBigNumeralsTimeComponentLabel *)[objc_alloc((Class)NTKBigNumeralsTimeComponentLabel) initWithDevice:v5 timeComponent:1 fontVariant:1 filledFontSectName:v21 outlineFontSectName:v22 dsoHandle:&dword_0 fontSize:v19 useLigatures:v32];
    bottomLabel = v7->_bottomLabel;
    v7->_bottomLabel = v25;

    [(NTKBigNumeralsTimeComponentLabel *)v7->_bottomLabel setTextAlignment:2];
    [(UIView *)v7->_timeLabelsContainerView addSubview:v7->_bottomLabel];
    [(NTKBigNumeralsDigitalTimeView *)v7 setMaskView:v7->_timeLabelsContainerView];
    objc_initWeak(&location, v7);
    v27 = +[CLKClockTimer sharedInstance];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_5170;
    v33[3] = &unk_C3D8;
    objc_copyWeak(&v34, &location);
    uint64_t v28 = [v27 startUpdatesWithUpdateFrequency:0 withHandler:v33 identificationLog:&stru_C418];
    timerToken = v7->_timerToken;
    v7->_timerToken = (CLKClockTimerToken *)v28;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[CLKClockTimer sharedInstance];
  [v3 stopUpdatesForToken:self->_timerToken];

  v4.receiver = self;
  v4.super_class = (Class)NTKBigNumeralsDigitalTimeView;
  [(NTKBigNumeralsDigitalTimeView *)&v4 dealloc];
}

- (void)setShowingStatus:(BOOL)a3
{
  if (self->_showingStatus != a3)
  {
    BOOL v3 = a3;
    self->_showingStatus = a3;
    uint64_t v10 = 0;
    long long v8 = 0u;
    memset(v9, 0, sizeof(v9));
    sub_5050(self->_device, (uint64_t)&v8);
    id v5 = (double *)&v9[1] + 1;
    if (!v3) {
      id v5 = (double *)v9;
    }
    double v6 = *v5;
    double v7 = 0.0;
    if (v3) {
      double v7 = 1.0;
    }
    self->_statusBarTransitionFraction = v7;
    [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel setFontSize:v6];
    [(NTKBigNumeralsTimeComponentLabel *)self->_bottomLabel setFontSize:v6];
    [(NTKBigNumeralsDigitalTimeView *)self setNeedsLayout];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_storeStrong((id *)&self->_overrideDate, a3);

  [(NTKBigNumeralsDigitalTimeView *)self _updateLabels];
}

- (void)_updateLabels
{
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    objc_super v4 = overrideDate;
  }
  else
  {
    objc_super v4 = +[NTKDate faceDate];
  }
  double v6 = v4;
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel setDate:v4];
  [(NTKBigNumeralsTimeComponentLabel *)self->_bottomLabel setDate:v6];
  [(NTKBigNumeralsDigitalTimeView *)self setNeedsLayout];
  id v5 = [(NTKBigNumeralsDigitalTimeView *)self delegate];
  [v5 bigNumeralsDigitalTimeViewDidChangeTime];
}

- (id)font
{
  return [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel font];
}

- (void)layoutSubviews
{
  double v45 = 0.0;
  memset(v44, 0, sizeof(v44));
  sub_5050(self->_device, (uint64_t)v44);
  [(NTKBigNumeralsDigitalTimeView *)self bounds];
  double v4 = v3;
  double v40 = v5;
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  CLKInterpolateBetweenFloatsClipped();
  double v37 = v8;
  double v38 = *((double *)v44 + 1);
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel sizeToFit];
  [(NTKBigNumeralsTimeComponentLabel *)self->_bottomLabel sizeToFit];
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel bounds];
  double v10 = v9;
  CGFloat v42 = v11;
  [(NTKBigNumeralsTimeComponentLabel *)self->_bottomLabel bounds];
  double v13 = v12;
  double v15 = v14;
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel _lastLineBaseline];
  double rect = v10;
  double v16 = v4 - v10 - v7;
  double v17 = v40 * 0.5;
  double v41 = v40 * 0.5 + v37 - v18;
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel setFrame:v16];
  [(NTKBigNumeralsTimeComponentLabel *)self->_bottomLabel _lastLineBaseline];
  double v19 = v13;
  double v39 = v13;
  double v20 = v4 - v13 - v7;
  double v22 = v17 + v38 - v21;
  -[NTKBigNumeralsTimeComponentLabel setFrame:](self->_bottomLabel, "setFrame:", v20, v22, v19, v15);
  +[CATransaction setDisableActions:1];
  double v23 = v45;
  double v24 = v41 - v45;
  double v25 = v16 - v45;
  v26 = [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel font];
  [v26 ascender];
  double v28 = v27 + v23 * 2.0;

  -[CALayer setFrame:](self->_topLabelColorLayer, "setFrame:", v25, v24, rect + v23 * 2.0, v28);
  double v29 = v22 - v23;
  v30 = [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel font];
  [v30 ascender];
  double v32 = v31 + v23 * 2.0;

  -[CALayer setFrame:](self->_bottomLabelColorLayer, "setFrame:", v20 - v23, v29, v39 + v23 * 2.0, v32);
  if (v16 >= v20) {
    double v33 = v20;
  }
  else {
    double v33 = v16;
  }
  v47.origin.x = v16;
  v47.size.height = v42;
  v47.origin.y = v41;
  v47.size.width = rect;
  CGFloat v34 = CGRectGetMaxX(v47) - v33;
  [(CALayer *)self->_bottomLabelColorLayer frame];
  double MaxY = CGRectGetMaxY(v48);
  [(CALayer *)self->_topLabelColorLayer frame];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v33, v41, v34, MaxY - v36);

  +[CATransaction setDisableActions:0];
}

- (void)applyTypeface:(unint64_t)a3
{
  self->_typeface = a3;
  -[NTKBigNumeralsTimeComponentLabel setTypeface:](self->_topLabel, "setTypeface:");
  bottomLabel = self->_bottomLabel;

  [(NTKBigNumeralsTimeComponentLabel *)bottomLabel setTypeface:a3];
}

- (void)applyTransitionFraction:(double)a3 fromTypeface:(unint64_t)a4 toTypeface:(unint64_t)a5
{
  if (a3 <= 0.5) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = a5;
  }
  self->_typeface = v9;
  -[NTKBigNumeralsTimeComponentLabel applyTransitionFraction:fromTypeface:toTypeface:](self->_topLabel, "applyTransitionFraction:fromTypeface:toTypeface:", a3);
  bottomLabel = self->_bottomLabel;

  [(NTKBigNumeralsTimeComponentLabel *)bottomLabel applyTransitionFraction:a4 fromTypeface:a5 toTypeface:a3];
}

- (void)applyStyle:(unint64_t)a3
{
  self->_style = a3;
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel setStyle:a3 == 2];
  bottomLabel = self->_bottomLabel;

  [(NTKBigNumeralsTimeComponentLabel *)bottomLabel setStyle:a3 - 1 < 2];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a3 <= 0.5) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = a5;
  }
  self->_style = v9;
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel applyTransitionFraction:a4 == 2 fromStyle:a5 == 2 toStyle:a3];
  bottomLabel = self->_bottomLabel;

  [(NTKBigNumeralsTimeComponentLabel *)bottomLabel applyTransitionFraction:a4 - 1 < 2 fromStyle:a5 - 1 < 2 toStyle:a3];
}

- (void)applyColorPalette:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  double v5 = [v9 hourDigits];
  double v6 = [v9 minuteDigits];
  +[CATransaction setDisableActions:1];
  [(CALayer *)self->_topLabelColorLayer opacity];
  if (v7 == 1.0) {
    -[CALayer setBackgroundColor:](self->_topLabelColorLayer, "setBackgroundColor:", [v5 CGColor]);
  }
  else {
    [(CAGradientLayer *)self->_gradientLayer setHidden:0];
  }
  [(CALayer *)self->_bottomLabelColorLayer opacity];
  if (v8 == 1.0)
  {
    -[CALayer setBackgroundColor:](self->_bottomLabelColorLayer, "setBackgroundColor:", [v6 CGColor]);
    [(CAGradientLayer *)self->_gradientLayer setHidden:1];
  }
  +[CATransaction setDisableActions:0];
}

- (void)applyRainbowColorTransitionWithFraction:(double)a3 colorPalette:(id)a4
{
  id v10 = a4;
  +[CATransaction setDisableActions:1];
  [(CAGradientLayer *)self->_gradientLayer setHidden:fabs(a3) < 0.00000011920929];
  double v6 = 1.0 - a3;
  *(float *)&a3 = 1.0 - a3;
  LODWORD(v6) = LODWORD(a3);
  [(CALayer *)self->_topLabelColorLayer setOpacity:v6];
  LODWORD(v7) = LODWORD(a3);
  [(CALayer *)self->_bottomLabelColorLayer setOpacity:v7];
  if (([(CAGradientLayer *)self->_gradientLayer isHidden] & 1) == 0)
  {
    id v8 = [v10 hourDigits];
    -[CALayer setBackgroundColor:](self->_topLabelColorLayer, "setBackgroundColor:", [v8 CGColor]);

    id v9 = [v10 minuteDigits];
    -[CALayer setBackgroundColor:](self->_bottomLabelColorLayer, "setBackgroundColor:", [v9 CGColor]);
  }
  +[CATransaction setDisableActions:0];
}

- (void)cleanupTransition
{
  [(NTKBigNumeralsTimeComponentLabel *)self->_topLabel cleanupTransition];
  bottomLabel = self->_bottomLabel;

  [(NTKBigNumeralsTimeComponentLabel *)bottomLabel cleanupTransition];
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)showingStatus
{
  return self->_showingStatus;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (NTKBigNumeralsDigitalTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKBigNumeralsDigitalTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_timeLabelsContainerView, 0);
  objc_storeStrong((id *)&self->_bottomLabelColorLayer, 0);
  objc_storeStrong((id *)&self->_topLabelColorLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end