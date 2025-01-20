@interface NTKBigNumeralsAnalogBackgroundView
- (BOOL)showingStatus;
- (NTKBigNumeralsAnalogBackgroundView)initWithDevice:(id)a3;
- (NTKBigNumeralsTimeComponentLabel)hourLabel;
- (void)_updateHourLabelText;
- (void)applyDataMode:(int64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromPigmentOption:(id)a4 toPigmentOption:(id)a5 palette:(id)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setShowingStatus:(BOOL)a3;
- (void)updateHourLabelColorForColorOption:(id)a3 palette:(id)a4;
@end

@implementation NTKBigNumeralsAnalogBackgroundView

- (NTKBigNumeralsAnalogBackgroundView)initWithDevice:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NTKBigNumeralsAnalogBackgroundView;
  v6 = [(NTKBigNumeralsAnalogBackgroundView *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[NTKBigNumeralsAnalogColorPalette multicolorAxialGradientLayerForColor:3000 device:v5];
    gradientLayer = v7->_gradientLayer;
    v7->_gradientLayer = (CAGradientLayer *)v8;

    uint64_t v10 = +[CALayer layer];
    labelColorLayer = v7->_labelColorLayer;
    v7->_labelColorLayer = (CALayer *)v10;

    v12 = [(NTKBigNumeralsAnalogBackgroundView *)v7 layer];
    [v12 insertSublayer:v7->_gradientLayer atIndex:0];

    v13 = [(NTKBigNumeralsAnalogBackgroundView *)v7 layer];
    [v13 insertSublayer:v7->_labelColorLayer above:v7->_gradientLayer];

    double v14 = sub_4F94(v5);
    if ([(CLKDevice *)v7->_device deviceCategory] == (char *)&dword_0 + 3)
    {
      CFStringRef v15 = @"A";
    }
    else
    {
      if ([v5 deviceCategory] != &dword_4)
      {
        v17 = @"__TokyoFontAO";
        v16 = @"__TokyoFontA";
        goto LABEL_8;
      }
      CFStringRef v15 = @"G";
    }
    v16 = [@"__TokyoFontA" stringByAppendingString:v15];
    v17 = [@"__TokyoFontAO" stringByAppendingString:v15];
LABEL_8:
    LOBYTE(v27) = 1;
    v18 = (NTKBigNumeralsTimeComponentLabel *)[objc_alloc((Class)NTKBigNumeralsTimeComponentLabel) initWithDevice:v5 timeComponent:0 fontVariant:0 filledFontSectName:v16 outlineFontSectName:v17 dsoHandle:&dword_0 fontSize:v14 useLigatures:v27];
    hourLabel = v7->_hourLabel;
    v7->_hourLabel = v18;

    [(NTKBigNumeralsTimeComponentLabel *)v7->_hourLabel setTextAlignment:1];
    uint64_t v20 = objc_opt_new();
    maskView = v7->_maskView;
    v7->_maskView = (UIView *)v20;

    [(UIView *)v7->_maskView addSubview:v7->_hourLabel];
    [(NTKBigNumeralsAnalogBackgroundView *)v7 setMaskView:v7->_maskView];
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v7 selector:"_updateHourLabelText" name:UIApplicationSignificantTimeChangeNotification object:0];

    objc_initWeak(&location, v7);
    v23 = +[CLKClockTimer sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_50A0;
    v28[3] = &unk_C340;
    objc_copyWeak(&v29, &location);
    uint64_t v24 = [v23 startUpdatesWithUpdateFrequency:0 withHandler:v28 identificationLog:&stru_C380];
    timerToken = v7->_timerToken;
    v7->_timerToken = (CLKClockTimerToken *)v24;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[CLKClockTimer sharedInstance];
  [v3 stopUpdatesForToken:self->_timerToken];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKBigNumeralsAnalogBackgroundView;
  [(NTKBigNumeralsAnalogBackgroundView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NTKBigNumeralsAnalogBackgroundView;
  [(NTKBigNumeralsAnalogBackgroundView *)&v20 layoutSubviews];
  [(NTKBigNumeralsTimeComponentLabel *)self->_hourLabel sizeToFit];
  [(NTKBigNumeralsAnalogBackgroundView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NTKBigNumeralsTimeComponentLabel *)self->_hourLabel frame];
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGRectGetHeight(v21);
  [(NTKBigNumeralsTimeComponentLabel *)self->_hourLabel _lastLineBaseline];
  CLKRectCenteredXInRectForDevice();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[NTKBigNumeralsTimeComponentLabel setFrame:](self->_hourLabel, "setFrame:");
  v17 = [(NTKBigNumeralsTimeComponentLabel *)self->_hourLabel font];
  [v17 ascender];
  double v19 = v18 + 2.0;

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v12, v14, v16, v19);
  -[CALayer setFrame:](self->_labelColorLayer, "setFrame:", v12, v14, v16, v19);
  +[CATransaction commit];
}

- (void)_updateHourLabelText
{
  hourLabel = self->_hourLabel;
  if (self->_overrideDate)
  {
    -[NTKBigNumeralsTimeComponentLabel setDate:](self->_hourLabel, "setDate:");
  }
  else
  {
    CGFloat v4 = +[NTKDate faceDate];
    [(NTKBigNumeralsTimeComponentLabel *)hourLabel setDate:v4];
  }

  [(NTKBigNumeralsAnalogBackgroundView *)self setNeedsLayout];
}

- (void)updateHourLabelColorForColorOption:(id)a3 palette:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  +[NTKBigNumeralsAnalogColorPalette timeColorOpacityForEditOption:v6];
  double v8 = v7;

  *(float *)&double v9 = v8;
  [(CALayer *)self->_labelColorLayer setOpacity:v9];
  [(CALayer *)self->_labelColorLayer opacity];
  gradientLayer = self->_gradientLayer;
  if (v11 == 1.0)
  {
    [(CAGradientLayer *)gradientLayer setHidden:1];
    id v12 = [v13 primaryColor];
    -[CALayer setBackgroundColor:](self->_labelColorLayer, "setBackgroundColor:", [v12 CGColor]);
  }
  else
  {
    [(CAGradientLayer *)gradientLayer setHidden:0];
  }
  +[CATransaction commit];
}

- (void)applyTransitionFraction:(double)a3 fromPigmentOption:(id)a4 toPigmentOption:(id)a5 palette:(id)a6
{
  id v10 = a6;
  +[NTKBigNumeralsAnalogColorPalette timeColorOpacityForFraction:a4 fromEditOption:a5 toEditOption:a3];
  double v12 = v11;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CAGradientLayer *)self->_gradientLayer setHidden:v12 == 1.0];
  id v13 = [v10 primaryColor];

  id v14 = v13;
  -[CALayer setBackgroundColor:](self->_labelColorLayer, "setBackgroundColor:", [v14 CGColor]);

  *(float *)&double v15 = v12;
  [(CALayer *)self->_labelColorLayer setOpacity:v15];

  +[CATransaction commit];
}

- (void)setShowingStatus:(BOOL)a3
{
  if (self->_showingStatus != a3)
  {
    BOOL v3 = a3;
    self->_showingStatus = a3;
    double v5 = sub_4F94(self->_device);
    if (v3) {
      double v5 = v6;
    }
    [(NTKBigNumeralsTimeComponentLabel *)self->_hourLabel setFontSize:v5];
    [(NTKBigNumeralsAnalogBackgroundView *)self setNeedsLayout];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_storeStrong((id *)&self->_overrideDate, a3);

  [(NTKBigNumeralsAnalogBackgroundView *)self _updateHourLabelText];
}

- (void)applyDataMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x32) != 0) {
    [(NTKBigNumeralsAnalogBackgroundView *)self _updateHourLabelText];
  }
}

- (NTKBigNumeralsTimeComponentLabel)hourLabel
{
  return self->_hourLabel;
}

- (BOOL)showingStatus
{
  return self->_showingStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_labelColorLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end