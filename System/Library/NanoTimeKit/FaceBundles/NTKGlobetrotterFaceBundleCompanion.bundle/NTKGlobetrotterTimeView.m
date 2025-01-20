@interface NTKGlobetrotterTimeView
- (BOOL)shouldUseCustomDialBackground;
- (CGSize)_hourTickSize;
- (CGSize)_secondTickSize;
- (CLLocationCoordinate2D)_northPoleCoordinate;
- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
- (NTKGlobetrotterTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 numberSystem:(unint64_t)a5 andDevice:(id)a6 timeZoneHourOffset:(int64_t)a7;
- (double)_minuteTickInset;
- (double)_secondTickInset;
- (id)_customDialBackgroundView;
- (id)_digitalLabelFont;
- (id)_digitalTimeLabelColorForColorPalette:(id)a3;
- (id)_hourMinuteHandFillColorForColorPalette:(id)a3;
- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3;
- (id)_hourTickColorForColorPalette:(id)a3;
- (id)_secondHandColorForColorPalette:(id)a3;
- (id)_secondTickActiveColorForColorPalette:(id)a3;
- (id)_secondTickInactiveColorForColorPalette:(id)a3;
- (id)globeSnapshotImage;
- (unint64_t)_minuteTickCount;
- (void)_applyColorToAnalogHands;
- (void)_applyColorToDigitalLabelAndTicks;
- (void)_setCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4;
- (void)_setupAnalogHandsView;
- (void)applyDataMode:(int64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromNumeralOption:(id)a4 toNumeralOption:(id)a5;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)astronomyVistaViewWillDisplay:(id)a3 forTime:(double)a4;
- (void)cleanupAfterEditing;
- (void)prepareForEditing;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3;
- (void)setNumberSystem:(unint64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setTimeZoneHourOffset:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation NTKGlobetrotterTimeView

- (NTKGlobetrotterTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 numberSystem:(unint64_t)a5 andDevice:(id)a6 timeZoneHourOffset:(int64_t)a7
{
  v15.receiver = self;
  v15.super_class = (Class)NTKGlobetrotterTimeView;
  v9 = -[NTKGlobetrotterTimeView initWithFrame:style:andDevice:](&v15, "initWithFrame:style:andDevice:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    [(NTKGlobetrotterTimeView *)v9 setTimeZoneHourOffset:a7 animated:0];
    v11 = +[UIColor blackColor];
    v12 = [(NTKGlobetrotterTimeView *)v10 analogHandsView];
    v13 = [v12 secondHandView];
    [v13 setHandDotColor:v11];

    v10->_numberSystem = a5;
  }
  return v10;
}

- (NSArray)digitalTimeLabelFontScaleFactorForNumberSystemOverrides
{
  digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  if (!digitalTimeLabelFontScaleFactorForNumberSystemOverrides)
  {
    self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides = (NSArray *)&off_11108;

    digitalTimeLabelFontScaleFactorForNumberSystemOverrides = self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
  }

  return digitalTimeLabelFontScaleFactorForNumberSystemOverrides;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [(NTKGlobetrotterTimeView *)self _applyColorToAnalogHands];
  [(NTKGlobetrotterTimeView *)self _applyColorToDigitalLabelAndTicks];
  v6 = [v5 globe];
  v7 = [v5 globeBlend];
  float64_t v16 = 0.0;
  double v17 = 0.0;
  double v14 = 0.0;
  float64_t v15 = 0.0;
  double v13 = 0.0;
  [v6 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
  [v7 getRed:&v17 green:0 blue:0 alpha:0];
  v8 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];

  v9 = [v8 spheroidOfType:3];

  v10.f64[0] = v16;
  v10.f64[1] = v15;
  v11.f64[0] = v13 * v14;
  v11.f64[1] = v13;
  objc_msgSend(v9, "setColorize:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(v10, v13)), v11).i64);
  *(float *)&unsigned int v12 = v17;
  [v9 setAnimatedFloat:11 forKey:COERCE_DOUBLE((unint64_t)v12)];
}

- (void)setTimeZoneHourOffset:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_cityCoordinate = &self->_cityCoordinate;
  +[NTKGlobetrotterCityManager idealizedCityCoordinate];
  p_cityCoordinate->latitude = v8;
  p_cityCoordinate->longitude = v9;
  [(NTKGlobetrotterTimeView *)self _northPoleCoordinate];
  -[NTKGlobetrotterTimeView _setCoordinate:animated:](self, "_setCoordinate:animated:", v4);
  self->_centeredOnCity = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_22B0;
  v11[3] = &unk_10418;
  v11[4] = a3;
  float64x2_t v10 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
  [v10 setCurrentDateBlock:v11];

  [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:v4 adjustEarthRotation:0];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKGlobetrotterTimeView;
  [(NTKGlobetrotterTimeView *)&v8 setOverrideDate:v7 duration:a4];
  if (self->_overrideDate != v7 && !-[NSDate isEqualToDate:](v7, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:a4 > 0.0 adjustEarthRotation:0];
  }
}

- (void)applyDataMode:(int64_t)a3
{
  v3 = self;
  switch(a3)
  {
    case 1:
      [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];
      self = v3;
      uint64_t v5 = 1;
      goto LABEL_7;
    case 2:
    case 4:
      astronomyVistaView = self->_astronomyVistaView;
      [(NUNIAstronomyVistaView *)astronomyVistaView stopAnimation];
      break;
    case 3:
      uint64_t v5 = 0;
LABEL_7:
      [(NTKGlobetrotterTimeView *)self setUserInteractionEnabled:v5];
      break;
    default:
      return;
  }
}

- (void)prepareForEditing
{
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:0];
  astronomyVistaView = self->_astronomyVistaView;

  [(NUNIAstronomyVistaView *)astronomyVistaView startAnimation];
}

- (void)cleanupAfterEditing
{
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:3];
  astronomyVistaView = self->_astronomyVistaView;

  [(NUNIAstronomyVistaView *)astronomyVistaView stopAnimation];
}

- (void)_applyColorToAnalogHands
{
  v4.receiver = self;
  v4.super_class = (Class)NTKGlobetrotterTimeView;
  [(NTKGlobetrotterTimeView *)&v4 _applyColorToAnalogHands];
  v3 = [(NTKGlobetrotterColorPalette *)self->_palette hourMinuteHandInlay];
  [(NTKGlobetrotterColorPalette *)self->_palette hourMinuteHandStroke];
}

- (void)_applyColorToDigitalLabelAndTicks
{
  v2.receiver = self;
  v2.super_class = (Class)NTKGlobetrotterTimeView;
  [(NTKGlobetrotterTimeView *)&v2 _applyColorToDigitalLabelAndTicks];
}

- (BOOL)shouldUseCustomDialBackground
{
  return 1;
}

- (id)_customDialBackgroundView
{
  v3 = [(NTKGlobetrotterTimeView *)self device];
  objc_super v4 = +[NUNIAstronomyVistaConfiguration defaultConfigurationWithDevice:v3];

  [v4 setTextureSuffix:@"globe"];
  [v4 setRendererStyle:1];
  id v5 = objc_alloc((Class)NUNIAstronomyVistaView);
  [(NTKGlobetrotterTimeView *)self bounds];
  v6 = (NUNIAstronomyVistaView *)objc_msgSend(v5, "initWithFrame:configuration:", v4);
  astronomyVistaView = self->_astronomyVistaView;
  self->_astronomyVistaView = v6;

  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setOpaque:0];
  objc_initWeak(&location, self);
  double v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  float64_t v15 = sub_27BC;
  float64_t v16 = &unk_10440;
  objc_copyWeak(&v17, &location);
  objc_super v8 = objc_retainBlock(&v13);
  id v9 = objc_alloc((Class)NUNIScene);
  id v10 = objc_msgSend(v9, "initWithSphereoids:projectionType:currentDateBlock:", 8, 1, v8, v13, v14, v15, v16);
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setScene:v10];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView applyVista:0 transitionStyle:0];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setObserver:self];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:3];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];
  float64x2_t v11 = self->_astronomyVistaView;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)_setCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  self->_centerCoordinate = a3;
  id v7 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
  objc_msgSend(v7, "setHomeCoordinate:", latitude, longitude);
  objc_msgSend(v7, "setCenterCoordinate:animated:", v4, latitude, longitude);
}

- (CLLocationCoordinate2D)_northPoleCoordinate
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(89.9, self->_cityCoordinate.longitude);
  double longitude = v4.longitude;
  double latitude = v4.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)globeSnapshotImage
{
  return [(NUNIAstronomyVistaView *)self->_astronomyVistaView snapshotImage];
}

- (void)_setupAnalogHandsView
{
  v3 = [NTKGlobetrotterAnalogHandsView alloc];
  CLLocationCoordinate2D v4 = [(NTKGlobetrotterTimeView *)self device];
  id v5 = [(NTKGlobetrotterAnalogHandsView *)v3 initForDevice:v4];
  [(NTKGlobetrotterTimeView *)self setAnalogHandsView:v5];

  id v6 = [(NTKGlobetrotterTimeView *)self analogHandsView];
  [(NTKGlobetrotterTimeView *)self addSubview:v6];
}

- (double)_minuteTickInset
{
  objc_super v2 = [(NTKGlobetrotterTimeView *)self device];
  sub_29F0(v2, v5);
  double v3 = v5[0];

  return v3;
}

- (unint64_t)_minuteTickCount
{
  return 0;
}

- (CGSize)_hourTickSize
{
  objc_super v2 = [(NTKGlobetrotterTimeView *)self device];
  sub_29F0(v2, &v7);
  double v3 = *((double *)&v7 + 1);
  double v4 = v8;

  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)_hourTickColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette hourTick];
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette hourMinuteHandInlay];
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette hourMinuteHandStroke];
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette secondHand];
}

- (double)_secondTickInset
{
  [(NTKGlobetrotterTimeView *)self _minuteTickInset];
  return result;
}

- (CGSize)_secondTickSize
{
  objc_super v2 = [(NTKGlobetrotterTimeView *)self device];
  sub_29F0(v2, &v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette digitalLabel];
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette secondTickActive];
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  return [(NTKGlobetrotterColorPalette *)self->_palette secondTickInactive];
}

- (id)_digitalLabelFont
{
  double v3 = [(NTKGlobetrotterTimeView *)self device];
  sub_29F0(v3, &v16);
  double v4 = v17;

  double v5 = [(NTKGlobetrotterTimeView *)self device];
  int v6 = NTKShowIndicScriptNumerals();

  if (v6)
  {
    if (self->_numberSystem != -1)
    {
      long long v7 = [(NTKGlobetrotterTimeView *)self digitalTimeLabelFontScaleFactorForNumberSystemOverrides];
      double v8 = [v7 objectAtIndexedSubscript:self->_numberSystem];
      [v8 doubleValue];

      double v9 = [(NTKGlobetrotterTimeView *)self device];
      CLKRoundForDevice();
      double v4 = v10;
    }
    float64x2_t v11 = +[NTKSFCompactFont numericSoftFontOfSize:v4 weight:UIFontWeightMedium];
  }
  else
  {
    unsigned int v12 = [(NTKGlobetrotterTimeView *)self device];
    sub_29F0(v12, &v14);
    float64x2_t v11 = +[CLKFont compactSoftFontOfSize:v15 weight:UIFontWeightMedium];
  }

  return v11;
}

- (void)setNumberSystem:(unint64_t)a3
{
  self->_numberSystem = a3;
  double v5 = [(NTKGlobetrotterTimeView *)self digitalTimeLabel];
  [v5 setForcedNumberSystem:a3];

  [(NTKGlobetrotterTimeView *)self _refreshDigitalTimeLabel];
  id v6 = [(NTKGlobetrotterTimeView *)self digitalTimeLabel];
  [v6 setNeedsLayout];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 != a5)
  {
    uint64_t v28 = v10;
    uint64_t v29 = v9;
    uint64_t v30 = v8;
    uint64_t v31 = v7;
    uint64_t v32 = v5;
    uint64_t v33 = v6;
    unsigned int v12 = [(NTKGlobetrotterTimeView *)self analogContainerView];
    double v13 = [(NTKGlobetrotterTimeView *)self analogHandsView];
    long long v14 = [(NTKGlobetrotterTimeView *)self digitalContainerView];
    CLKCompressFraction();
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v16 = v15;
    CLKInterpolateBetweenFloatsClipped();
    double v18 = v17;
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeScale(&v27, v16, v16);
    CGAffineTransform v26 = v27;
    [v12 setTransform:&v26];
    [v12 setAlpha:v18];
    CGAffineTransform v25 = v27;
    [v13 setTransform:&v25];
    [v13 setAlpha:v18];
    CLKCompressFraction();
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v20 = v19;
    CLKInterpolateBetweenFloatsClipped();
    double v22 = v21;
    CGAffineTransformMakeScale(&v24, v20, v20);
    CGAffineTransform v27 = v24;
    CGAffineTransform v23 = v24;
    [v14 setTransform:&v23];
    [v14 setAlpha:v22];
  }
}

- (void)applyTransitionFraction:(double)a3 fromNumeralOption:(id)a4 toNumeralOption:(id)a5
{
  id v8 = a5;
  [a4 numeralOption];
  uint64_t v9 = CLKLocaleNumberSystemFromNumeralOption();
  [v8 numeralOption];

  uint64_t v10 = CLKLocaleNumberSystemFromNumeralOption();
  if (v9 == v10)
  {
    [(NTKGlobetrotterTimeView *)self setNumberSystem:v9];
  }
  else
  {
    if (a3 >= 0.5)
    {
      uint64_t v13 = v10;
      CLKMapFractionIntoRange();
      double v12 = v14;
      uint64_t v9 = v13;
    }
    else
    {
      CLKMapFractionIntoRange();
      double v12 = v11;
    }
    CLKMapFractionIntoRange();
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, v15, v15);
    [(NTKGlobetrotterTimeView *)self setNumberSystem:v9];
    CGFloat v16 = [(NTKGlobetrotterTimeView *)self digitalTimeLabel];
    [v16 setAlpha:v12];

    CGAffineTransform v19 = v20;
    double v17 = [(NTKGlobetrotterTimeView *)self digitalTimeLabel];
    CGAffineTransform v18 = v19;
    [v17 setTransform:&v18];
  }
}

- (void)astronomyVistaViewWillDisplay:(id)a3 forTime:(double)a4
{
  id v8 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
  uint64_t v5 = [v8 spheroidOfType:3];
  unsigned int v6 = [v8 isAnimating:v8 forKeys:346];
  if (v6 | [v8 isAnimating:v5 forKeys:1024]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 3;
  }
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:v7];
}

- (void)setDigitalTimeLabelFontScaleFactorForNumberSystemOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalTimeLabelFontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_astronomyVistaView, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end