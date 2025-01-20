@interface NTKSiderealTimeView
- (BOOL)shouldUseCustomDialBackground;
- (CGSize)_hourTickSize;
- (CGSize)_minuteTickSize;
- (CGSize)_secondTickSize;
- (double)_digitalTimeLabelFontSize;
- (double)_minuteTickInset;
- (id)_customDialBackgroundView;
- (id)_digitalTimeLabelColorForColorPalette:(id)a3;
- (id)_hourMinuteHandFillColorForColorPalette:(id)a3;
- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3;
- (id)_hourTickColorForColorPalette:(id)a3;
- (id)_minuteTickColorForColorPalette:(id)a3;
- (id)_secondTickActiveColorForColorPalette:(id)a3;
- (id)_secondTickInactiveColorForColorPalette:(id)a3;
- (unint64_t)_hourTickCount;
- (unint64_t)_minuteTickCount;
- (void)_didFinishTimeViewSetup;
- (void)_setupAnalogHandsView;
- (void)_setupDigitalTimeViews;
- (void)setBrightnessFilterInputAmount:(double)a3;
- (void)setSaturationFilterInputAmount:(double)a3;
- (void)updateFilters;
@end

@implementation NTKSiderealTimeView

- (void)_setupAnalogHandsView
{
  v3 = [NTKSiderealHandsView alloc];
  v4 = [(NTKSiderealTimeView *)self device];
  id v5 = [(NTKSiderealHandsView *)v3 initForDevice:v4];
  [(NTKSiderealTimeView *)self setAnalogHandsView:v5];

  id v6 = [(NTKSiderealTimeView *)self analogHandsView];
  [(NTKSiderealTimeView *)self addSubview:v6];
}

- (void)_setupDigitalTimeViews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSiderealTimeView;
  [(NTKSiderealTimeView *)&v2 _setupDigitalTimeViews];
}

- (void)_didFinishTimeViewSetup
{
  v3 = [(NTKSiderealTimeView *)self analogTickContainerView];
  v4 = [v3 layer];
  [v4 setCompositingFilter:kCAFilterPlusL];

  id v5 = [(NTKSiderealTimeView *)self analogTickContainerView];
  id v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:1];

  v7 = [(NTKSiderealTimeView *)self analogTickContainerView];
  v8 = [v7 layer];
  [v8 setAllowsGroupBlending:1];

  id v11 = [(NTKSiderealTimeView *)self analogTickContainerView];
  v9 = [v11 layer];
  LODWORD(v10) = 1058642330;
  [v9 setOpacity:v10];
}

- (BOOL)shouldUseCustomDialBackground
{
  return 1;
}

- (id)_customDialBackgroundView
{
  id v3 = objc_alloc((Class)UIView);
  [(NTKSiderealTimeView *)self bounds];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  [v4 setOpaque:0];
  [v4 setBackgroundColor:0];

  return v4;
}

- (void)setBrightnessFilterInputAmount:(double)a3
{
  id v5 = +[CAFilter filterWithType:kCAFilterColorBrightness];
  brightnessFilter = self->_brightnessFilter;
  self->_brightnessFilter = v5;

  v7 = self->_brightnessFilter;
  id v8 = +[NSNumber numberWithDouble:a3];
  [(CAFilter *)v7 setValue:v8 forKey:@"inputAmount"];
}

- (void)setSaturationFilterInputAmount:(double)a3
{
  id v5 = +[CAFilter filterWithType:kCAFilterColorSaturate];
  saturationFilter = self->_saturationFilter;
  self->_saturationFilter = v5;

  v7 = self->_saturationFilter;
  id v8 = +[NSNumber numberWithDouble:a3];
  [(CAFilter *)v7 setValue:v8 forKey:@"inputAmount"];
}

- (void)updateFilters
{
  blurBackdrop = self->_blurBackdrop;
  brightnessFilter = self->_brightnessFilter;
  v5[0] = self->_gaussianFilter;
  v5[1] = brightnessFilter;
  v5[2] = self->_saturationFilter;
  id v4 = +[NSArray arrayWithObjects:v5 count:3];
  [(CABackdropLayer *)blurBackdrop setFilters:v4];
}

- (double)_minuteTickInset
{
  objc_super v2 = [(NTKSiderealTimeView *)self device];
  sub_42B4(v2, v5);
  double v3 = v5[0];

  return v3;
}

- (CGSize)_hourTickSize
{
  objc_super v2 = [(NTKSiderealTimeView *)self device];
  sub_42B4(v2, &v7);
  double v3 = *((double *)&v7 + 1);
  double v4 = v8;

  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)_minuteTickSize
{
  objc_super v2 = [(NTKSiderealTimeView *)self device];
  sub_42B4(v2, &v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (unint64_t)_hourTickCount
{
  return 12;
}

- (unint64_t)_minuteTickCount
{
  return 24;
}

- (id)_hourTickColorForColorPalette:(id)a3
{
  return +[UIColor whiteColor];
}

- (id)_minuteTickColorForColorPalette:(id)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 1.0, 0.26);
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 1.0, 0.0);
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  return +[UIColor whiteColor];
}

- (CGSize)_secondTickSize
{
  objc_super v2 = [(NTKSiderealTimeView *)self device];
  sub_42B4(v2, &v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)_digitalTimeLabelFontSize
{
  objc_super v2 = [(NTKSiderealTimeView *)self device];
  sub_42B4(v2, v5);
  double v3 = v6;

  return v3;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  return [(NTKSiderealTimeView *)self _secondTickActiveColorForColorPalette:a3];
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  return +[UIColor whiteColor];
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, 0.0, 0.11372549, 0.345098039, 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saturationFilter, 0);
  objc_storeStrong((id *)&self->_brightnessFilter, 0);
  objc_storeStrong((id *)&self->_gaussianFilter, 0);

  objc_storeStrong((id *)&self->_blurBackdrop, 0);
}

@end