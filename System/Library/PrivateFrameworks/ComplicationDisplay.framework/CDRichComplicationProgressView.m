@interface CDRichComplicationProgressView
- (BOOL)enabled;
- (BOOL)showAlternateIndicatorColor;
- (BOOL)showHolePunch;
- (BOOL)showIndicatorView;
- (CAShapeLayer)ringLayer;
- (CDRichComplicationShapeView)backgroundView;
- (CDRichComplicationShapeView)foregroundView;
- (CLKGaugeProvider)gaugeProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)gradientColors;
- (UIView)indicatorView;
- (UIView)ringView;
- (double)progress;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)initForFamily:(int64_t)a3 device:(id)a4 backgroundShapeView:(id)a5 foregroundShapeView:(id)a6;
- (id)interpolatedColorForView:(id)a3;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4;
- (int64_t)style;
- (void)_adjustBackgroundViewAlphaWithPercentage:(float)a3;
- (void)_applyStyle;
- (void)_updateRingShape;
- (void)_updateUIFromGaugeProvider;
- (void)animateToProgress:(float)a3 duration:(double)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setFilterProvider:(id)a3;
- (void)setGaugeProvider:(id)a3;
- (void)setGradientColors:(id)a3;
- (void)setGradientColors:(id)a3 locations:(id)a4;
- (void)setIndicatorView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShowAlternateIndicatorColor:(BOOL)a3;
- (void)setShowHolePunch:(BOOL)a3;
- (void)setShowIndicatorView:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationProgressView

- (id)initForFamily:(int64_t)a3 device:(id)a4 backgroundShapeView:(id)a5 foregroundShapeView:(id)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CDRichComplicationProgressView;
  v14 = -[CDRichComplicationProgressView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v15 = v14;
  if (v14)
  {
    v14->_family = a3;
    objc_storeStrong((id *)&v14->_device, a4);
    v15->_showAlternateIndicatorColor = CDShowGossamerUI(v15->_device);
    objc_storeStrong((id *)&v15->_backgroundView, a5);
    [(CDRichComplicationShapeView *)v15->_backgroundView setFilterProvider:v15];
    [(CDRichComplicationProgressView *)v15 addSubview:v15->_backgroundView];
    uint64_t v16 = [MEMORY[0x263F15880] layer];
    ringLayer = v15->_ringLayer;
    v15->_ringLayer = (CAShapeLayer *)v16;

    -[CAShapeLayer setAnchorPoint:](v15->_ringLayer, "setAnchorPoint:", 0.5, 0.5);
    [(CAShapeLayer *)v15->_ringLayer setFillRule:*MEMORY[0x263F15AC0]];
    v18 = v15->_ringLayer;
    id v19 = [MEMORY[0x263F825C8] whiteColor];
    -[CAShapeLayer setFillColor:](v18, "setFillColor:", [v19 CGColor]);

    v20 = v15->_ringLayer;
    v27 = @"position";
    v21 = [MEMORY[0x263EFF9D0] null];
    v28[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [(CAShapeLayer *)v20 setActions:v22];

    objc_storeStrong((id *)&v15->_foregroundView, a6);
    [(CDRichComplicationShapeView *)v15->_foregroundView setFilterProvider:v15];
    [(CDRichComplicationProgressView *)v15 addSubview:v15->_foregroundView];
    uint64_t v23 = objc_opt_new();
    indicatorView = v15->_indicatorView;
    v15->_indicatorView = (UIView *)v23;

    [(CDRichComplicationProgressView *)v15 addSubview:v15->_indicatorView];
    [(CDRichComplicationProgressView *)v15 setShowHolePunch:1];
    [(CDRichComplicationProgressView *)v15 setShowIndicatorView:1];
    [(CDRichComplicationProgressView *)v15 _applyStyle];
  }

  return v15;
}

- (void)dealloc
{
  if (self->_updateToken)
  {
    -[CLKGaugeProvider stopUpdatesForToken:](self->_gaugeProvider, "stopUpdatesForToken:");
    updateToken = self->_updateToken;
    self->_updateToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationProgressView;
  [(CDRichComplicationProgressView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CDRichComplicationProgressView;
  [(CDRichComplicationProgressView *)&v13 layoutSubviews];
  [(CDRichComplicationProgressView *)self bounds];
  -[CDRichComplicationShapeView setFrame:](self->_backgroundView, "setFrame:");
  [(CDRichComplicationProgressView *)self bounds];
  -[CDRichComplicationShapeView setFrame:](self->_foregroundView, "setFrame:");
  [(CDRichComplicationProgressView *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(CDRichComplicationProgressView *)self bounds];
  CGFloat Height = CGRectGetHeight(v15);
  -[CAShapeLayer setBounds:](self->_ringLayer, "setBounds:", 0.0, 0.0, Width + Width, Height + Height);
  [(CDRichComplicationProgressView *)self _updateRingShape];
  double progress = self->_progress;
  *(float *)&double progress = progress;
  [(CDRichComplicationShapeView *)self->_backgroundView pointAtProgress:progress];
  double v7 = v6;
  double v9 = v8;
  -[CAShapeLayer setPosition:](self->_ringLayer, "setPosition:", v8, v6, *MEMORY[0x263F00148]);
  [(CDRichComplicationShapeView *)self->_foregroundView _shapeLineWidth];
  double v11 = v10 * 0.5;
  -[UIView setBounds:](self->_indicatorView, "setBounds:", 0.0, 0.0, v11 + v11, v11 + v11);
  id v12 = [(UIView *)self->_indicatorView layer];
  [v12 setCornerRadius:v11];

  -[UIView setCenter:](self->_indicatorView, "setCenter:", v9, v7);
}

- (void)setGradientColors:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColors, a3);
  id v7 = a3;
  backgroundView = self->_backgroundView;
  double v6 = [(CDRichComplicationProgressView *)self overrideBackgroundGradientColorsForGradientColors:v7];
  [(CDRichComplicationShapeView *)backgroundView setGradientColors:v6];

  [(CDRichComplicationShapeView *)self->_foregroundView setGradientColors:v7];
}

- (void)setGradientColors:(id)a3 locations:(id)a4
{
  backgroundView = self->_backgroundView;
  id v7 = a4;
  id v9 = a3;
  double v8 = [(CDRichComplicationProgressView *)self overrideBackgroundGradientColorsForGradientColors:v9 locations:v7];
  [(CDRichComplicationShapeView *)backgroundView setGradientColors:v8 locations:v7];

  [(CDRichComplicationShapeView *)self->_foregroundView setGradientColors:v9 locations:v7];
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  id v4 = a3;
  return v4;
}

- (void)setProgress:(double)a3
{
  double v4 = fmin(a3, 1.0);
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  self->_double progress = v4;
  -[CDRichComplicationShapeView setProgress:](self->_foregroundView, "setProgress:");
  [(CDRichComplicationProgressView *)self setNeedsLayout];
}

- (void)animateToProgress:(float)a3 duration:(double)a4
{
  objc_initWeak(&location, self);
  double progress = self->_progress;
  float v7 = progress;
  float v8 = a3 - progress;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDRichComplicationProgressView_animateToProgress_duration___block_invoke;
  aBlock[3] = &unk_2644A5230;
  objc_copyWeak(&v11, &location);
  float v12 = v7;
  float v13 = v8;
  id v9 = (void (**)(double))_Block_copy(aBlock);
  v9[2](1.0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __61__CDRichComplicationProgressView_animateToProgress_duration___block_invoke(uint64_t a1, double a2)
{
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[57] = *(float *)(a1 + 40) + *(float *)(a1 + 44) * a2;
    float v12 = WeakRetained;
    uint64_t v5 = [WeakRetained style];
    if ((unint64_t)(v5 - 1) >= 2)
    {
      if (!v5)
      {
        double v6 = v12[57];
        *(float *)&double v6 = v6;
        [*((id *)v12 + 61) pointAtProgress:v6];
        double v8 = v7;
        double v10 = v9;
        objc_msgSend(*((id *)v12 + 64), "setPosition:");
        objc_msgSend(*((id *)v12 + 60), "setCenter:", v8, v10);
      }
    }
    else
    {
      [*((id *)v12 + 62) setProgress:v12[57]];
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(CDRichComplicationProgressView *)self _applyStyle];
}

- (void)setGaugeProvider:(id)a3
{
  uint64_t v5 = (CLKGaugeProvider *)a3;
  if (v5)
  {
    p_gaugeProvider = (id *)&self->_gaugeProvider;
    gaugeProvider = self->_gaugeProvider;
    if (gaugeProvider != v5)
    {
      if (self->_updateToken)
      {
        -[CLKGaugeProvider stopUpdatesForToken:](gaugeProvider, "stopUpdatesForToken:");
        updateToken = self->_updateToken;
        self->_updateToken = 0;
      }
      objc_storeStrong((id *)&self->_gaugeProvider, a3);
      [(CDRichComplicationProgressView *)self _updateUIFromGaugeProvider];
      if ([*p_gaugeProvider needsTimerUpdates])
      {
        objc_initWeak(&location, self);
        id v9 = *p_gaugeProvider;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __51__CDRichComplicationProgressView_setGaugeProvider___block_invoke;
        v12[3] = &unk_2644A5258;
        objc_copyWeak(&v13, &location);
        double v10 = [v9 startUpdatesWithHandler:v12];
        id v11 = self->_updateToken;
        self->_updateToken = v10;

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __51__CDRichComplicationProgressView_setGaugeProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  uint64_t v5 = [v3 date];
  [v4 progressFractionForNow:v5];
  double v7 = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v7 = v7;
  LODWORD(v8) = LODWORD(v7);
  [WeakRetained animateToProgress:v8 duration:0.300000012];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  [(CDRichComplicationProgressView *)self _applyStyle];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CDRichComplicationShapeView transitionToMonochromeWithFraction:](self->_foregroundView, "transitionToMonochromeWithFraction:");
  [(CDRichComplicationShapeView *)self->_backgroundView transitionToMonochromeWithFraction:a3];
  *(float *)&double v5 = a3;
  [(CDRichComplicationProgressView *)self _adjustBackgroundViewAlphaWithPercentage:v5];
  BOOL v6 = [(UIView *)self->_indicatorView isHidden];
  uint64_t v7 = a3 < 1.0 || v6;
  [(CDRichComplicationProgressView *)self setShowHolePunch:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  id v9 = [WeakRetained colorForView:self accented:0];

  [(UIView *)self->_indicatorView setBackgroundColor:v9];
  [(UIView *)self->_indicatorView setAlpha:a3];
}

- (void)updateMonochromeColor
{
  [(CDRichComplicationShapeView *)self->_foregroundView updateMonochromeColor];
  [(CDRichComplicationShapeView *)self->_backgroundView updateMonochromeColor];
  LODWORD(v3) = 1.0;
  [(CDRichComplicationProgressView *)self _adjustBackgroundViewAlphaWithPercentage:v3];
  [(CDRichComplicationProgressView *)self setShowHolePunch:[(UIView *)self->_indicatorView isHidden]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  id v5 = [WeakRetained colorForView:self accented:0];

  [(UIView *)self->_indicatorView setBackgroundColor:v5];
  [(UIView *)self->_indicatorView setAlpha:1.0];
}

- (void)_updateUIFromGaugeProvider
{
  gaugeProvider = self->_gaugeProvider;
  id v4 = [MEMORY[0x263EFF910] date];
  [(CLKGaugeProvider *)gaugeProvider progressFractionForNow:v4];
  float v6 = v5;

  [(CDRichComplicationProgressView *)self setProgress:v6];
  LODWORD(v7) = *MEMORY[0x263EFCF60];
  -[CDRichComplicationProgressView setEnabled:](self, "setEnabled:", *MEMORY[0x263EFCF60] != v6, v7);
  double v8 = [(CLKGaugeProvider *)self->_gaugeProvider gaugeColorLocations];
  uint64_t v9 = [v8 count];

  double v10 = [(CLKGaugeProvider *)self->_gaugeProvider gaugeColors];
  if (v9)
  {
    id v11 = [(CLKGaugeProvider *)self->_gaugeProvider gaugeColorLocations];
    [(CDRichComplicationProgressView *)self setGradientColors:v10 locations:v11];
  }
  else
  {
    [(CDRichComplicationProgressView *)self setGradientColors:v10];
  }

  CLKGaugeProviderStyle v12 = [(CLKGaugeProvider *)self->_gaugeProvider style];
  if (v12 == *MEMORY[0x263EFCF40]) {
    [(CDRichComplicationProgressView *)self setStyle:2];
  }
  CLKGaugeProviderStyle v13 = [(CLKGaugeProvider *)self->_gaugeProvider style];
  if ((unint64_t)v13 <= CLKGaugeProviderStyleFill)
  {
    [(CDRichComplicationProgressView *)self setStyle:v13];
  }
}

- (void)_adjustBackgroundViewAlphaWithPercentage:(float)a3
{
  int64_t style = self->_style;
  if (style != 1 && (style || self->_enabled))
  {
    backgroundView = self->_backgroundView;
    [(CDRichComplicationShapeView *)backgroundView setAlpha:1.0];
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    *(float *)&double v7 = v7;
    [(CDRichComplicationShapeView *)self->_backgroundView setAlpha:*(float *)&v7];
    self->_currentBackgroundViewAlphaPercentage = a3;
  }
}

- (void)_applyStyle
{
  int64_t style = self->_style;
  switch(style)
  {
    case 2:
      [(CDRichComplicationShapeView *)self->_backgroundView setHidden:1];
      goto LABEL_6;
    case 1:
LABEL_6:
      [(CDRichComplicationProgressView *)self setShowIndicatorView:0];
      BOOL v5 = !self->_enabled;
      goto LABEL_7;
    case 0:
      [(CDRichComplicationProgressView *)self setShowIndicatorView:self->_enabled];
      BOOL v5 = 1;
LABEL_7:
      [(CDRichComplicationShapeView *)self->_foregroundView setHidden:v5];
      break;
  }
  *(float *)&double v2 = self->_currentBackgroundViewAlphaPercentage;
  [(CDRichComplicationProgressView *)self _adjustBackgroundViewAlphaWithPercentage:v2];
  BOOL v6 = !self->_showAlternateIndicatorColor || self->_style || !self->_enabled;
  indicatorView = self->_indicatorView;
  [(UIView *)indicatorView setHidden:v6];
}

- (void)_updateRingShape
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  double v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21E3E1000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

- (void)setShowHolePunch:(BOOL)a3
{
  if (self->_showHolePunch != a3)
  {
    self->_showHolePunch = a3;
    [(CDRichComplicationProgressView *)self _updateRingShape];
  }
}

- (void)setShowIndicatorView:(BOOL)a3
{
  if (self->_showIndicatorView != a3)
  {
    BOOL v3 = a3;
    self->_showIndicatorView = a3;
    uint64_t v5 = [(CDRichComplicationShapeView *)self->_foregroundView layer];
    uint64_t v6 = v5;
    if (v3) {
      ringLayer = self->_ringLayer;
    }
    else {
      ringLayer = 0;
    }
    [v5 setMask:ringLayer];

    double v8 = [(CDRichComplicationShapeView *)self->_backgroundView layer];
    if (v3) {
      uint64_t v9 = self->_ringLayer;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v8;
    [v8 setMask:v9];
  }
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  uint64_t v6 = [(CDRichComplicationProgressView *)self filterProvider];
  double v7 = [v6 filtersForView:self style:a4];

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(CDRichComplicationProgressView *)self filterProvider];
  uint64_t v9 = [v8 filtersForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(CDRichComplicationProgressView *)self filterProvider];
  uint64_t v9 = [v8 filterForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  uint64_t v6 = [(CDRichComplicationProgressView *)self filterProvider];
  double v7 = [v6 filterForView:self style:a4];

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(CDRichComplicationProgressView *)self filterProvider];
  double v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDRichComplicationProgressView *)self filterProvider];
  id v6 = [v5 interpolatedColorForView:v4];

  return v6;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDRichComplicationProgressView *)self filterProvider];
  id v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)style
{
  return self->_style;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (BOOL)showHolePunch
{
  return self->_showHolePunch;
}

- (BOOL)showIndicatorView
{
  return self->_showIndicatorView;
}

- (BOOL)showAlternateIndicatorColor
{
  return self->_showAlternateIndicatorColor;
}

- (void)setShowAlternateIndicatorColor:(BOOL)a3
{
  self->_showAlternateIndicatorColor = a3;
}

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
}

- (CDRichComplicationShapeView)backgroundView
{
  return self->_backgroundView;
}

- (CDRichComplicationShapeView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)ringView
{
  return self->_ringView;
}

- (CAShapeLayer)ringLayer
{
  return self->_ringLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end