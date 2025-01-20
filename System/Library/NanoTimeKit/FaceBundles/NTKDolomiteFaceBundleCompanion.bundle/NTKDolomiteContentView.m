@interface NTKDolomiteContentView
- (BOOL)isAnimating;
- (BOOL)isEditing;
- (NTKDolomiteContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 numeral:(unint64_t)a5 style:(unint64_t)a6 palette:(id)a7 backgroundStyle:(unint64_t)a8 digitStyle:(unint64_t)a9 dateProvider:(id)a10 is24HourMode:(BOOL)a11 forceDynamicIndexZero:(BOOL)a12 contentOption:(unint64_t)a13 device:(id)a14;
- (double)digitFadeFraction;
- (id)_createFillShapeLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createLayerOfSize:(CGSize)a3 parent:(id)a4;
- (id)_createTritiumStrip:(int)a3 size:(CGSize)a4 parentLayer:(id)a5;
- (id)_createViewOfSize:(CGSize)a3 parent:(id)a4;
- (id)backgroundColor;
- (id)foregroundColor;
- (id)lightForegroundColor;
- (unint64_t)style;
- (void)_hideTritiumStrips;
- (void)_setupSceneWithSize:(CGSize)a3;
- (void)_showTritiumStrips:(int)a3;
- (void)_updateDigitsAnimated:(BOOL)a3 hour:(int)a4 minute:(int)a5 partialSeconds:(double)a6;
- (void)_updateHorizontalLineAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5;
- (void)_updateOpticalAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5;
- (void)_updateSwipeAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5;
- (void)_updateTritiumOpticalAnimationsForSeconds:(int)a3;
- (void)addForegroundView:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)forceColorRefresh:(BOOL)a3;
- (void)set24HourMode:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setDigitFadeFraction:(double)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setNumeral:(unint64_t)a3;
- (void)setPalette:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)updateDate;
- (void)waitForAnimationsWithCompletion:(id)a3;
@end

@implementation NTKDolomiteContentView

- (NTKDolomiteContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 numeral:(unint64_t)a5 style:(unint64_t)a6 palette:(id)a7 backgroundStyle:(unint64_t)a8 digitStyle:(unint64_t)a9 dateProvider:(id)a10 is24HourMode:(BOOL)a11 forceDynamicIndexZero:(BOOL)a12 contentOption:(unint64_t)a13 device:(id)a14
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v25 = a7;
  id v26 = a10;
  id v57 = a14;
  v58.receiver = self;
  v58.super_class = (Class)NTKDolomiteContentView;
  v27 = -[NTKDolomiteContentView initWithFrame:](&v58, "initWithFrame:", x, y, width, height);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_device, a14);
    v28->_role = a4;
    v28->_numeral = a5;
    v28->_style = a6;
    objc_storeStrong((id *)&v28->_palette, a7);
    v28->_backgroundStyle = a8;
    v28->_digitStyle = a9;
    id v29 = v26;
    id v30 = objc_retainBlock(v26);
    id dateProvider = v28->_dateProvider;
    v28->_id dateProvider = v30;

    v28->_currentDadouble y = -1;
    v28->_currentHour = -1;
    v28->_currentMinute = -1;
    v28->_currentDigitSet = 609;
    v28->_is24HourMode = a11;
    v28->_forceDynamicIndexZero = a12;
    v28->_contentOption = a13;
    LODWORD(v32) = 1057803469;
    LODWORD(v33) = 1055286886;
    LODWORD(v34) = 1.0;
    uint64_t v35 = +[CAMediaTimingFunction functionWithControlPoints:v32 :0.0 :v33 :v34];
    timingFunction = v28->_timingFunction;
    v28->_timingFunction = (CAMediaTimingFunction *)v35;

    uint64_t v37 = 0;
    v28->_stripLayersHidden = 1;
    v28->_forceDynamicIndexZero = 1;
    v38 = (double *)&unk_D55660;
    v39 = &qword_D55518;
    do
    {
      double v40 = *((double *)v39 - 2);
      double v41 = *((double *)v39 - 1);
      double v42 = *(double *)v39;
      v39 += 3;
      uint64_t v43 = +[UIColor colorWithRed:v40 green:v41 blue:v42 alpha:1.0];
      v44 = v28->_backgroundDynamicColors[v37];
      v28->_backgroundDynamicColors[v37] = (UIColor *)v43;

      uint64_t v45 = +[UIColor colorWithRed:*(v38 - 1) green:*v38 blue:v38[1] alpha:1.0];
      v46 = v28->_foregroundDynamicColors[v37];
      v28->_foregroundDynamicColors[v37] = (UIColor *)v45;

      ++v37;
      v38 += 3;
    }
    while (v37 != 14);
    v47 = [v25 isHardwareColor];
    [v47 floatValue];
    float v49 = v48;

    uint64_t v50 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v51 = v28->_foregroundColors[0];
    v28->_foregroundColors[0] = (UIColor *)v50;

    if (v49 >= 0.5) {
      double v52 = 0.760784314;
    }
    else {
      double v52 = 0.847058824;
    }
    uint64_t v53 = +[UIColor colorWithRed:v52 green:v52 blue:v52 alpha:1.0];
    v54 = v28->_foregroundColors[1];
    v28->_foregroundColors[1] = (UIColor *)v53;

    [0 setMasksToBounds:1];
    v55 = sub_3DA0();
    [0 setActions:v55];

    -[NTKDolomiteContentView _setupSceneWithSize:](v28, "_setupSceneWithSize:", width, height);
    id v26 = v29;
  }

  return v28;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKDolomiteContentView;
  [(NTKDolomiteContentView *)&v2 dealloc];
}

- (id)foregroundColor
{
  return self->_foregroundColor;
}

- (id)lightForegroundColor
{
  return self->_foregroundColors[0];
}

- (id)backgroundColor
{
  id v2 = objc_msgSend(objc_alloc((Class)UIColor), "initWithCGColor:", -[CALayer backgroundColor](self->_backgroundLayer, "backgroundColor"));

  return v2;
}

- (void)addForegroundView:(id)a3
{
  textGroupView = self->_textGroupView;
  id v5 = a3;
  [(UIView *)textGroupView addSubview:v5];
  [(UIView *)self->_textGroupView sendSubviewToBack:v5];
}

- (BOOL)isAnimating
{
  return 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v6 = (void (**)(void))objc_retainBlock(self->_animationCompletion);
  if (v6)
  {
    id animationCompletion = self->_animationCompletion;
    self->_id animationCompletion = 0;

    v6[2]();
  }
}

- (void)setPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void)set24HourMode:(BOOL)a3
{
  if (self->_is24HourMode != a3)
  {
    self->_is24HourMode = a3;
    self->_currentDadouble y = -1;
    self->_currentHour = -1;
    self->_currentMinute = -1;
  }
}

- (void)setNumeral:(unint64_t)a3
{
  if (self->_numeral != a3)
  {
    self->_numeral = a3;
    self->_currentDadouble y = -1;
    self->_currentHour = -1;
    self->_currentMinute = -1;
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    self->_currentDadouble y = -1;
    self->_currentHour = -1;
    self->_currentMinute = -1;
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(CAShapeLayer *)self->_horizontalLineLayer setHidden:a3 != 2];
  }
}

- (void)setPalette:(id)a3
{
  id v53 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  currentDadouble y = self->_currentDay;
  int currentHour = self->_currentHour;
  int v7 = self->_currentMinute & ~(self->_currentMinute >> 31);
  v8 = [v53 dynamicPercent];
  [v8 floatValue];
  float v10 = v9;

  if (v10 < 0.5)
  {
    if (v7)
    {
      id v24 = [v53 southColor];
      v13 = (CGColor *)[v24 CGColor];

      id v25 = [v53 northColor];
      v14 = (CGColor *)[v25 CGColor];

      id v26 = [v53 digitSouthColor];
      v15 = (CGColor *)[v26 CGColor];

      id v27 = [v53 digitNorthColor];
      v16 = (CGColor *)[v27 CGColor];

      [v53 digitSouthColor];
    }
    else
    {
      id v19 = [v53 northColor];
      v13 = (CGColor *)[v19 CGColor];

      id v20 = [v53 southColor];
      v14 = (CGColor *)[v20 CGColor];

      id v21 = [v53 digitNorthColor];
      v15 = (CGColor *)[v21 CGColor];

      id v22 = [v53 digitSouthColor];
      v16 = (CGColor *)[v22 CGColor];

      [v53 digitNorthColor];
    }
    v23 = (UIColor *)objc_claimAutoreleasedReturnValue();
    foregroundColor = self->_foregroundColor;
    self->_foregroundColor = v23;
  }
  else
  {
    unsigned int v11 = (11 * (currentDay & ~(currentDay >> 31)) + 60 * (currentHour & ~(currentHour >> 31)) + v7) % 0xE;
    if ((self->_forceDynamicIndexZero || self->_isEditing) && !self->_ignoreForceDynamicIndexZero) {
      unsigned int v11 = 0;
    }
    if (v11 == 13) {
      unsigned int v12 = 0;
    }
    else {
      unsigned int v12 = v11 + 1;
    }
    v13 = [(UIColor *)self->_backgroundDynamicColors[v11] CGColor];
    v14 = [(UIColor *)self->_backgroundDynamicColors[v12] CGColor];
    v15 = [(UIColor *)self->_foregroundDynamicColors[v11] CGColor];
    v16 = [(UIColor *)self->_foregroundDynamicColors[v12] CGColor];
    v17 = self->_foregroundDynamicColors[v11];
    foregroundColor = self->_foregroundColor;
    self->_foregroundColor = v17;
  }

  unint64_t backgroundStyle = self->_backgroundStyle;
  id v29 = v13;
  id v30 = v14;
  if (backgroundStyle)
  {
    if (backgroundStyle == 3)
    {
      if (self->_digitStyle) {
        v16 = v13;
      }
      else {
        v16 = v14;
      }
      id v31 = +[UIColor blackColor];
      id v29 = (CGColor *)[v31 CGColor];

      id v32 = +[UIColor blackColor];
      id v30 = (CGColor *)[v32 CGColor];
    }
    else
    {
      if (self->_digitStyle) {
        v16 = v13;
      }
      else {
        v16 = v14;
      }
      id v33 = +[UIColor blackColor];
      id v29 = (CGColor *)[v33 CGColor];

      id v34 = +[UIColor blackColor];
      id v30 = (CGColor *)[v34 CGColor];

      if (self->_backgroundStyle == 2) {
        CGColorGetComponents(v16);
      }
    }
    v15 = v13;
  }
  if (self->_backgroundStyle - 1 <= 2)
  {
    CGColorGetComponents(v13);
    CLKUIConvertRGBtoLAB();
    float32x4_t v51 = v35;
    CGColorGetComponents(v14);
    CLKUIConvertRGBtoLAB();
    unint64_t v38 = self->_backgroundStyle;
    if (v38 == 3) {
      float v39 = 60.0;
    }
    else {
      float v39 = 75.0;
    }
    if (v38 == 3) {
      *(float *)&uint64_t v37 = 80.0;
    }
    else {
      *(float *)&uint64_t v37 = 85.0;
    }
    if (vmovn_s32(vcgtq_f32(v36, v51)).u8[0])
    {
      if (v51.f32[0] >= v39 || (uint64_t v50 = v37, v52 = v36.f32[0], v15 = (CGColor *)sub_46DC(), v52 >= *(float *)&v50))
      {
        double v41 = v16;
        goto LABEL_43;
      }
      double v40 = (CGColor *)sub_46DC();
      v16 = v40;
    }
    else
    {
      if (v36.f32[0] >= v39 || (uint64_t v50 = v37, v16 = (CGColor *)sub_46DC(), v51.f32[0] >= *(float *)&v50))
      {
        double v41 = v15;
        goto LABEL_43;
      }
      double v40 = (CGColor *)sub_46DC();
      v15 = v40;
    }
    double v41 = v40;
LABEL_43:
    if (v38 == 3 && self->_digitStyle == 1)
    {
      v15 = v41;
      v16 = v41;
    }
  }
  if (v10 < 0.5)
  {
    double v42 = v16;
    uint64_t v43 = v30;
  }
  else
  {
    double v42 = v15;
    v15 = v16;
    uint64_t v43 = v29;
    id v29 = v30;
  }
  uint64_t v44 = 0;
  unint64_t style = self->_style;
  if (style) {
    v46 = 0;
  }
  else {
    v46 = v42;
  }
  if (style) {
    v47 = v42;
  }
  else {
    v47 = 0;
  }
  digitLayers = self->_digitLayers;
  do
  {
    -[CAShapeLayer setFillColor:](digitLayers[v44], "setFillColor:", v46, v50);
    [(CAShapeLayer *)digitLayers[v44] setStrokeColor:v47];
    [(CAShapeLayer *)self->_opticalDigitLayers[v44] setFillColor:v46];
    [(CAShapeLayer *)self->_opticalDigitLayers[v44++] setStrokeColor:v47];
  }
  while (v44 != 4);
  [(CALayer *)self->_backgroundLayer setBackgroundColor:v43];
  [(CAShapeLayer *)self->_backgroundSwipeLayer setFillColor:v29];
  [(CAShapeLayer *)self->_foregroundSwipeLayer setFillColor:v15];
  [(CAShapeLayer *)self->_opticalSwipeLayer setFillColor:v15];
  if ((self->_contentOption & 4) != 0)
  {
    for (uint64_t i = 0; i != 60; ++i)
      [(CAShapeLayer *)self->_stripLayers[i] setFillColor:v15];
  }
  [(CAShapeLayer *)self->_horizontalLineLayer setFillColor:v15];
}

- (void)forceColorRefresh:(BOOL)a3
{
  self->_ignoreForceDynamicIndexZero = a3;
  [(NTKDolomiteContentView *)self setPalette:self->_palette];
  self->_ignoreForceDynamicIndexZero = 0;
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  v4 = [(NSCalendar *)self->_calendar timeZone];
  unsigned __int8 v5 = [v4 isEqualToTimeZone:v6];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v6];
    self->_currentDadouble y = -1;
    self->_int currentHour = -1;
    self->_currentMinute = -1;
  }
}

- (void)_updateTritiumOpticalAnimationsForSeconds:(int)a3
{
  [(NTKDolomiteContentView *)self bounds];
  float64_t v6 = v5;
  float64_t v8 = v7;
  float v9 = sub_494C(self->_currentDigitSet, self->_is24HourMode, self->_numeral);
  float v10 = +[CLKDevice currentDevice];
  [v10 screenScale];
  double v12 = v11;

  uint64_t v13 = 0;
  int v14 = 60 - a3;
  do
  {
    unsigned int v15 = *((_DWORD *)v9 + v13);
    if (v15)
    {
      v16 = sub_4A20(v15, v14, v6, v8, v12);
      v17 = self->_opticalDigitLayers[v13];
      if (v16)
      {
        [(CAShapeLayer *)v17 setPath:v16];
        CGPathRelease(v16);
      }
      else
      {
        [(CAShapeLayer *)v17 setPath:self->_digitDefaultPathRefs[v13]];
      }
    }
    ++v13;
  }
  while (v13 != 4);
}

- (void)_updateOpticalAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5
{
  [(NTKDolomiteContentView *)self bounds];
  float64_t v10 = v9;
  float64_t v12 = v11;
  uint64_t v13 = sub_494C(self->_currentDigitSet, self->_is24HourMode, self->_numeral);
  int v14 = +[CLKDevice currentDevice];
  [v14 screenScale];
  double v16 = v15;

  if (a5 < 0.833 && a3)
  {
    uint64_t v17 = 0;
    int v18 = 59 - a4;
    while (1)
    {
      unsigned int v19 = *((_DWORD *)v13 + v17);
      if (v19) {
        break;
      }
      [(CAShapeLayer *)self->_digitLayers[v17] removeAnimationForKey:@"optical"];
LABEL_15:
      if (++v17 == 4) {
        return;
      }
    }
    id v20 = self->_digitDefaultPathRefs[v17];
    digitSnappedPathRefs = self->_digitSnappedPathRefs;
    if (self->_digitSnappedPathRefs[v17]) {
      id v22 = self->_digitSnappedPathRefs[v17];
    }
    else {
      id v22 = self->_digitDefaultPathRefs[v17];
    }
    v23 = sub_4A20(v19, v18, v10, v12, v16);
    if (v23)
    {
      id v24 = v23;
      id v25 = objc_opt_new();
      [v25 setKeyPath:@"path"];
      [v25 setFromValue:v22];
      [v25 setToValue:v24];
    }
    else
    {
      if (v22 == v20)
      {
        id v25 = 0;
        goto LABEL_14;
      }
      id v25 = objc_opt_new();
      [v25 setKeyPath:@"path"];
      [v25 setFromValue:v22];
      [v25 setToValue:v20];
      id v24 = 0;
    }
    [v25 setTimingFunction:self->_timingFunction];
    [v25 setBeginTime:CACurrentMediaTime() + 0.833 - a5];
    [v25 setDuration:0.167];
    [v25 setFillMode:kCAFillModeBoth];
    [v25 setRemovedOnCompletion:0];
    CGPathRelease(digitSnappedPathRefs[v17]);
    digitSnappedPathRefs[v17] = v24;
LABEL_14:
    [(CAShapeLayer *)self->_digitLayers[v17] addAnimation:v25 forKey:@"optical"];

    goto LABEL_15;
  }
  uint64_t v26 = 0;
  digitLayers = self->_digitLayers;
  int v28 = 60 - a4;
  do
  {
    [(CAShapeLayer *)digitLayers[v26] removeAnimationForKey:@"optical"];
    unsigned int v29 = *((_DWORD *)v13 + v26);
    if (!v29) {
      goto LABEL_28;
    }
    id v30 = self->_digitDefaultPathRefs[v26];
    id v31 = self->_digitSnappedPathRefs;
    id v32 = self->_digitSnappedPathRefs[v26];
    id v33 = sub_4A20(v29, v28, v10, v12, v16);
    if (v33)
    {
      id v34 = v33;
      [(CAShapeLayer *)digitLayers[v26] setPath:v33];
LABEL_27:
      CGPathRelease(v31[v26]);
      v31[v26] = v34;
      goto LABEL_28;
    }
    if (v32) {
      BOOL v35 = v32 == v30;
    }
    else {
      BOOL v35 = 1;
    }
    if (!v35)
    {
      [(CAShapeLayer *)digitLayers[v26] setPath:v30];
      id v34 = 0;
      goto LABEL_27;
    }
LABEL_28:
    ++v26;
  }
  while (v26 != 4);
}

- (void)_updateHorizontalLineAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5
{
  BOOL v7 = a3;
  [(NTKDolomiteContentView *)self bounds];
  double v10 = v9;
  double v11 = +[CLKDevice currentDevice];
  [v11 screenScale];
  double v13 = v12;

  if (self->_contentOption)
  {
    double v18 = v10 * 0.833333333 / -60.0;
    double v15 = v18 * (double)a4 + v10 * 0.916666667;
    double v17 = v18 * (double)(a4 + 1) + v10 * 0.916666667;
    goto LABEL_8;
  }
  if (!a4)
  {
    double v15 = v10 + 2.0;
    double v14 = v10 * v13;
    int v16 = 1;
    goto LABEL_7;
  }
  double v14 = v10 * v13;
  double v15 = round(v10 * v13 * (double)(60 - a4) / 60.0) / v13;
  int v16 = a4 + 1;
  double v17 = -2.0;
  if (a4 != 59) {
LABEL_7:
  }
    double v17 = round(v14 * (double)(60 - v16) / 60.0) / v13;
LABEL_8:
  if (a5 >= 0.833)
  {
    double v22 = (a5 + -0.833) / 0.167;
    *(float *)&double v22 = v22;
    [(CAMediaTimingFunction *)self->_timingFunction _solveForInput:v22];
    CLKInterpolateBetweenFloatsUnclipped();
    double v15 = v23;
    if (v7) {
      goto LABEL_10;
    }
LABEL_13:
    [(CAShapeLayer *)self->_horizontalLineLayer removeAnimationForKey:@"second"];
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v27, 0.0, v15);
    horizontalLineLayer = self->_horizontalLineLayer;
    CGAffineTransform v26 = v27;
    [(CAShapeLayer *)horizontalLineLayer setAffineTransform:&v26];
    return;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_10:
  id v25 = (id)objc_opt_new();
  [v25 setKeyPath:@"transform.translation.y"];
  unsigned int v19 = +[NSNumber numberWithDouble:v17];
  [v25 setToValue:v19];

  id v20 = +[NSNumber numberWithDouble:v15];
  [v25 setFromValue:v20];

  if (a5 >= 0.833)
  {
    double v21 = 0.167 - a5;
  }
  else
  {
    [v25 setBeginTime:CACurrentMediaTime() + 0.833 - a5];
    double v21 = 0.167;
  }
  [v25 setDuration:v21];
  [v25 setDelegate:self];
  [v25 setTimingFunction:self->_timingFunction];
  [v25 setFillMode:kCAFillModeBoth];
  [v25 setRemovedOnCompletion:0];
  [(CAShapeLayer *)self->_horizontalLineLayer addAnimation:v25 forKey:@"second"];
}

- (void)_updateSwipeAnimated:(BOOL)a3 seconds:(int)a4 partialSeconds:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  [(NTKDolomiteContentView *)self bounds];
  if ((self->_contentOption & 4) != 0)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if (v7)
    {
      [(NTKDolomiteContentView *)self _hideTritiumStrips];
    }
    else
    {
      if ((self->_contentOption & 8) == 0) {
        [(NTKDolomiteContentView *)self _updateTritiumOpticalAnimationsForSeconds:v6];
      }
      if (self->_backgroundStyle == 2) {
        [(NTKDolomiteContentView *)self _updateHorizontalLineAnimated:0 seconds:v6 partialSeconds:a5];
      }
      [(NTKDolomiteContentView *)self _showTritiumStrips:v6];
    }
    +[CATransaction commit];
  }
  else
  {
    double v10 = v9;
    double v11 = +[CLKDevice currentDevice];
    [v11 screenScale];
    double v13 = v12;

    if (self->_contentOption)
    {
      double v17 = v10 * 0.833333333 / -60.0;
      double v15 = v17 * (double)(int)v6 + v10 * 0.916666667;
      double v16 = v17 * (double)((int)v6 + 1) + v10 * 0.916666667;
    }
    else
    {
      double v14 = 0.0;
      if (self->_backgroundStyle == 2) {
        double v14 = -1.0;
      }
      double v15 = round(v10 * v13 * (double)(60 - (int)v6) / 60.0) / v13;
      double v16 = round(v10 * v13 * (double)(59 - (int)v6) / 60.0) / v13 + v14;
    }
    if (a5 >= 0.833)
    {
      double v18 = (a5 + -0.833) / 0.167;
      *(float *)&double v18 = v18;
      [(CAMediaTimingFunction *)self->_timingFunction _solveForInput:v18];
      CLKInterpolateBetweenFloatsUnclipped();
      double v15 = v19;
    }
    if (v7)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      id v25 = (id)objc_opt_new();
      [v25 setKeyPath:@"transform.translation.y"];
      id v20 = +[NSNumber numberWithDouble:v15];
      [v25 setFromValue:v20];

      double v21 = +[NSNumber numberWithDouble:v16];
      [v25 setToValue:v21];

      if (a5 >= 0.833)
      {
        double v22 = 0.167 - a5;
      }
      else
      {
        [v25 setBeginTime:CACurrentMediaTime() + 0.833 - a5];
        double v22 = 0.167;
      }
      [v25 setDuration:v22];
      [v25 setDelegate:self];
      [v25 setTimingFunction:self->_timingFunction];
      [v25 setFillMode:kCAFillModeBoth];
      [v25 setRemovedOnCompletion:0];
      [(CAShapeLayer *)self->_foregroundSwipeLayer addAnimation:v25 forKey:@"second"];
      [(CAShapeLayer *)self->_backgroundSwipeLayer addAnimation:v25 forKey:@"second"];
      if ((self->_contentOption & 8) == 0) {
        [(NTKDolomiteContentView *)self _updateOpticalAnimated:1 seconds:v6 partialSeconds:a5];
      }
      if (self->_backgroundStyle == 2) {
        [(NTKDolomiteContentView *)self _updateHorizontalLineAnimated:1 seconds:v6 partialSeconds:a5];
      }
      +[CATransaction commit];
    }
    else
    {
      [(CAShapeLayer *)self->_foregroundSwipeLayer removeAnimationForKey:@"second"];
      [(CAShapeLayer *)self->_backgroundSwipeLayer removeAnimationForKey:@"second"];
      memset(&v27, 0, sizeof(v27));
      CGAffineTransformMakeTranslation(&v27, 0.0, v15);
      foregroundSwipeLayer = self->_foregroundSwipeLayer;
      CGAffineTransform v26 = v27;
      [(CAShapeLayer *)foregroundSwipeLayer setAffineTransform:&v26];
      backgroundSwipeLayer = self->_backgroundSwipeLayer;
      CGAffineTransform v26 = v27;
      [(CAShapeLayer *)backgroundSwipeLayer setAffineTransform:&v26];
      if ((self->_contentOption & 8) == 0) {
        [(NTKDolomiteContentView *)self _updateOpticalAnimated:0 seconds:v6 partialSeconds:a5];
      }
      if (self->_backgroundStyle == 2) {
        [(NTKDolomiteContentView *)self _updateHorizontalLineAnimated:0 seconds:v6 partialSeconds:a5];
      }
    }
  }
}

- (void)updateDate
{
  uint64_t v3 = (*((void (**)(void))self->_dateProvider + 2))();
  BOOL is24HourMode = self->_is24HourMode;
  id v12 = (id)v3;
  double v5 = -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 65760);
  int v6 = [v5 dayOfYear];
  uint64_t v7 = (uint64_t)[v5 hour];
  id v8 = [v5 minute];
  id v9 = [v5 second];
  if (!is24HourMode)
  {
    if ((int)v7 % 12) {
      uint64_t v7 = ((int)v7 % 12);
    }
    else {
      uint64_t v7 = 12;
    }
  }

  if ((self->_contentOption & 2) != 0)
  {
    id v9 = 0;
    double v11 = 0.0;
  }
  else
  {
    [v12 timeIntervalSince1970];
    double v11 = v10 - floor(v10);
  }
  if (self->_currentHour == v7 && self->_currentMinute == v8)
  {
    self->_currentDadouble y = v6;
    if (!v9) {
      [(NTKDolomiteContentView *)self setPalette:self->_palette];
    }
  }
  else
  {
    self->_int currentHour = v7;
    self->_currentMinute = (int)v8;
    self->_currentDadouble y = v6;
    [(NTKDolomiteContentView *)self setPalette:self->_palette];
    double v11 = 0.0;
    [(NTKDolomiteContentView *)self _updateDigitsAnimated:0 hour:v7 minute:v8 partialSeconds:0.0];
  }
  [(NTKDolomiteContentView *)self _updateSwipeAnimated:0 seconds:v9 partialSeconds:v11];
}

- (void)waitForAnimationsWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    id v8 = v4;
    double v5 = [(CAShapeLayer *)self->_digitLayers[0] animationForKey:@"second"];

    if (v5)
    {
      int v6 = objc_retainBlock(v8);
      id animationCompletion = self->_animationCompletion;
      self->_id animationCompletion = v6;
    }
    else
    {
      v8[2]();
    }
    v4 = v8;
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[UIColor blackColor];
  }
  int v6 = v5;
  uint64_t v7 = [(NTKDolomiteContentView *)self layer];
  id v8 = v6;
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
}

- (void)_setupSceneWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = +[NSCalendar autoupdatingCurrentCalendar];
  calendar = self->_calendar;
  self->_calendar = v6;

  id v8 = self->_calendar;
  id v9 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)v8 setTimeZone:v9];

  -[NTKDolomiteContentView _createViewOfSize:parent:](self, "_createViewOfSize:parent:", self, width, height);
  double v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v10;

  id v12 = [(UIView *)self->_backgroundView layer];
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = v12;

  [(CALayer *)self->_backgroundLayer setBackgroundColor:[(UIColor *)self->_backgroundDynamicColors[0] CGColor]];
  -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_backgroundLayer, width, height);
  double v14 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  backgroundSwipeLayer = self->_backgroundSwipeLayer;
  self->_backgroundSwipeLayer = v14;

  -[NTKDolomiteContentView _createViewOfSize:parent:](self, "_createViewOfSize:parent:", self, width, height);
  double v16 = (UIView *)objc_claimAutoreleasedReturnValue();
  textGroupView = self->_textGroupView;
  self->_textGroupView = v16;

  double v18 = [(UIView *)self->_textGroupView layer];
  textGroupLayer = self->_textGroupLayer;
  self->_textGroupLayer = v18;

  -[NTKDolomiteContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", self->_textGroupLayer, width, height);
  id v20 = (CALayer *)objc_claimAutoreleasedReturnValue();
  digitGroupLayer = self->_digitGroupLayer;
  self->_digitGroupLayer = v20;

  -[NTKDolomiteContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", self->_textGroupLayer, width, height);
  double v22 = (CALayer *)objc_claimAutoreleasedReturnValue();
  opticalGroupLayer = self->_opticalGroupLayer;
  self->_opticalGroupLayer = v22;

  -[NTKDolomiteContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", self->_opticalGroupLayer, width, height);
  id v24 = (CALayer *)objc_claimAutoreleasedReturnValue();
  opticalBackgroundLayer = self->_opticalBackgroundLayer;
  self->_opticalBackgroundLayer = v24;

  CGAffineTransform v26 = self->_opticalBackgroundLayer;
  id v27 = +[UIColor blackColor];
  -[CALayer setBackgroundColor:](v26, "setBackgroundColor:", [v27 CGColor]);

  -[NTKDolomiteContentView _createLayerOfSize:parent:](self, "_createLayerOfSize:parent:", self->_opticalGroupLayer, width, height);
  int v28 = (CALayer *)objc_claimAutoreleasedReturnValue();
  opticalDigitGroupLayer = self->_opticalDigitGroupLayer;
  self->_opticalDigitGroupLayer = v28;

  double v30 = ceil(height / 60.0);
  -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", 0, width, v30 * 4.0);
  id v31 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  opticalMaskLayer = self->_opticalMaskLayer;
  self->_opticalMaskLayer = v31;

  id v33 = self->_opticalMaskLayer;
  id v34 = +[UIColor whiteColor];
  -[CAShapeLayer setFillColor:](v33, "setFillColor:", [v34 CGColor]);

  v67.origin.double y = v30 * -2.0;
  v67.origin.double x = 0.0;
  v67.size.double width = width;
  v67.size.double height = v30 * 4.0;
  BOOL v35 = CGPathCreateWithRect(v67, 0);
  [(CAShapeLayer *)self->_opticalMaskLayer setPath:v35];
  CGPathRelease(v35);
  [(CALayer *)self->_opticalGroupLayer setHidden:1];
  [(CALayer *)self->_opticalGroupLayer setMask:self->_opticalMaskLayer];
  sub_609C(self->_currentDigitSet, 0, self->_is24HourMode, self->_numeral, width, height);
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  foregroundColors = self->_foregroundColors;
  objc_storeStrong((id *)&self->_foregroundColor, self->_foregroundColors[0]);
  unint64_t style = self->_style;
  uint64_t v37 = [(UIColor *)self->_foregroundColor CGColor];
  uint64_t v38 = 0;
  BOOL v39 = style == 0;
  if (style) {
    double v40 = v37;
  }
  else {
    double v40 = 0;
  }
  if (v39) {
    double v41 = v37;
  }
  else {
    double v41 = 0;
  }
  do
  {
    -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_digitGroupLayer, width, height, foregroundColors);
    double v42 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = self->_digitLayers[v38];
    self->_digitLayers[v38] = v42;

    [(CAShapeLayer *)self->_digitLayers[v38] setFillColor:v41];
    [(CAShapeLayer *)self->_digitLayers[v38] setStrokeColor:v40];
    uint64_t v44 = self->_digitLayers[v38];
    uint64_t v45 = [v65 objectAtIndexedSubscript:v38];
    [(CAShapeLayer *)v44 setPath:v45];

    self->_digitDefaultPathRefs[v38] = [v65 objectAtIndexedSubscript:v38];
    -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_opticalDigitGroupLayer, width, height);
    v46 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v47 = self->_opticalDigitLayers[v38];
    self->_opticalDigitLayers[v38] = v46;

    [(CAShapeLayer *)self->_opticalDigitLayers[v38] setFillColor:v41];
    [(CAShapeLayer *)self->_opticalDigitLayers[v38] setStrokeColor:v40];
    float v48 = self->_opticalDigitLayers[v38];
    float v49 = [v65 objectAtIndexedSubscript:v38];
    [(CAShapeLayer *)v48 setPath:v49];

    ++v38;
  }
  while (v38 != 4);
  -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_digitGroupLayer, width, height);
  uint64_t v50 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  foregroundSwipeLayer = self->_foregroundSwipeLayer;
  self->_foregroundSwipeLayer = v50;

  -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_opticalDigitGroupLayer, width, height);
  float v52 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  opticalSwipeLayer = self->_opticalSwipeLayer;
  self->_opticalSwipeLayer = v52;

  v54 = +[CAFilter filterWithType:kCAFilterSourceAtop];
  [(CAShapeLayer *)self->_foregroundSwipeLayer setCompositingFilter:v54];
  [(CAShapeLayer *)self->_backgroundSwipeLayer setCompositingFilter:v54];
  [(CAShapeLayer *)self->_opticalSwipeLayer setCompositingFilter:v54];
  [(CAShapeLayer *)self->_backgroundSwipeLayer setFillColor:[(UIColor *)self->_backgroundDynamicColors[1] CGColor]];
  v55 = [(UIColor *)foregroundColors[1] CGColor];
  [(CAShapeLayer *)self->_foregroundSwipeLayer setFillColor:v55];
  [(CAShapeLayer *)self->_opticalSwipeLayer setFillColor:v55];
  v68.origin.double x = 0.0;
  v68.origin.double y = 0.0;
  v68.size.double width = width;
  v68.size.double height = height;
  v56 = CGPathCreateWithRect(v68, 0);
  [(CAShapeLayer *)self->_foregroundSwipeLayer setPath:v56];
  [(CAShapeLayer *)self->_opticalSwipeLayer setPath:v56];
  [(CAShapeLayer *)self->_backgroundSwipeLayer setPath:v56];
  CGPathRelease(v56);
  if ((self->_contentOption & 4) != 0)
  {
    id v57 = [(UIColor *)foregroundColors[1] CGColor];
    for (uint64_t i = 0; i != 60; ++i)
    {
      -[NTKDolomiteContentView _createTritiumStrip:size:parentLayer:](self, "_createTritiumStrip:size:parentLayer:", i, self->_digitGroupLayer, width, height);
      v59 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
      v60 = self->_stripLayers[i];
      self->_stripLayers[i] = v59;

      [(CAShapeLayer *)self->_stripLayers[i] setHidden:1];
      [(CAShapeLayer *)self->_stripLayers[i] setCompositingFilter:v54];
      [(CAShapeLayer *)self->_stripLayers[i] setFillColor:v57];
    }
  }
  -[NTKDolomiteContentView _createFillShapeLayerOfSize:parent:](self, "_createFillShapeLayerOfSize:parent:", self->_textGroupLayer, width, 2.0);
  v61 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  horizontalLineLayer = self->_horizontalLineLayer;
  self->_horizontalLineLayer = v61;

  [(CAShapeLayer *)self->_horizontalLineLayer setFillColor:[(UIColor *)foregroundColors[1] CGColor]];
  v69.origin.double x = 0.0;
  v69.origin.double y = -1.0;
  v69.size.double height = 2.0;
  v69.size.double width = width;
  v63 = CGPathCreateWithRect(v69, 0);
  [(CAShapeLayer *)self->_horizontalLineLayer setPath:v63];
  CGPathRelease(v63);
  [(CAShapeLayer *)self->_horizontalLineLayer setHidden:self->_backgroundStyle != 2];
  [(NTKDolomiteContentView *)self updateDate];
}

- (void)_updateDigitsAnimated:(BOOL)a3 hour:(int)a4 minute:(int)a5 partialSeconds:(double)a6
{
  [(NTKDolomiteContentView *)self bounds];
  float64_t v12 = v11;
  float64_t v14 = v13;
  int v15 = a5 + 60 * a4;
  sub_609C(v15, 0, self->_is24HourMode, self->_numeral, v11, v13);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    double v16 = sub_609C(self->_currentDigitSet, 0, self->_is24HourMode, self->_numeral, v12, v14);
    double v17 = sub_609C(self->_currentDigitSet, 1, self->_is24HourMode, self->_numeral, v12, v14);
    int v39 = a5 + 60 * a4;
    double v18 = sub_609C(v15, 2, self->_is24HourMode, self->_numeral, v12, v14);
    double v40 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    double v41 = v17;
    double v19 = v18;
    uint64_t v20 = 0;
    if (a6 >= 0.875)
    {
      double v30 = 0.25 - a6;
      do
      {
        id v31 = [v16 objectAtIndexedSubscript:v20];
        id v32 = [v17 objectAtIndexedSubscript:v20];
        id v33 = [v18 objectAtIndexedSubscript:v20];
        id v34 = [v42 objectAtIndexedSubscript:v20];
        BOOL v35 = sub_669C((uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, v40, 0.0, v30);
        [(CAShapeLayer *)self->_digitLayers[v20] addAnimation:v35 forKey:@"digit"];

        double v17 = v41;
        double v18 = v19;

        ++v20;
      }
      while (v20 != 4);
    }
    else
    {
      double v21 = 0.875 - a6;
      do
      {
        double v22 = [v16 objectAtIndexedSubscript:v20];
        double v23 = [v17 objectAtIndexedSubscript:v20];
        id v24 = [v18 objectAtIndexedSubscript:v20];
        id v25 = [v42 objectAtIndexedSubscript:v20];
        CGAffineTransform v26 = sub_669C((uint64_t)v22, (uint64_t)v23, (uint64_t)v24, (uint64_t)v25, v40, v21, 0.25);
        [(CAShapeLayer *)self->_digitLayers[v20] addAnimation:v26 forKey:@"digit"];

        double v18 = v19;
        double v17 = v41;

        ++v20;
      }
      while (v20 != 4);
    }
    uint64_t v38 = v16;
    for (uint64_t i = 0; i != 4; ++i)
    {
      objc_msgSend(v42, "objectAtIndexedSubscript:", i, v38);
      uint64_t v37 = (CGPath *)objc_claimAutoreleasedReturnValue();
      [(CAShapeLayer *)self->_opticalDigitLayers[i] removeAnimationForKey:@"digit"];
      [(CAShapeLayer *)self->_opticalDigitLayers[i] setPath:v37];
      CGPathRelease(self->_digitDefaultPathRefs[i]);
      self->_digitDefaultPathRefs[i] = v37;
      CGPathRelease(self->_digitSnappedPathRefs[i]);
      self->_digitSnappedPathRefs[i] = 0;
    }
    +[CATransaction commit];

    int v15 = v39;
    unsigned int v29 = v42;
  }
  else
  {
    for (uint64_t j = 0; j != 4; ++j)
    {
      int v28 = [v42 objectAtIndexedSubscript:j];
      [(CAShapeLayer *)self->_digitLayers[j] removeAnimationForKey:@"digit"];
      [(CAShapeLayer *)self->_digitLayers[j] setPath:v28];
      [(CAShapeLayer *)self->_opticalDigitLayers[j] removeAnimationForKey:@"digit"];
      [(CAShapeLayer *)self->_opticalDigitLayers[j] setPath:v28];
      CGPathRelease(self->_digitDefaultPathRefs[j]);
      self->_digitDefaultPathRefs[j] = v28;
      CGPathRelease(self->_digitSnappedPathRefs[j]);
      unsigned int v29 = v42;
      self->_digitSnappedPathRefs[j] = 0;
    }
  }
  self->_currentDigitSet = v15;
}

- (void)_hideTritiumStrips
{
  if (!self->_stripLayersHidden)
  {
    [(CAShapeLayer *)self->_backgroundSwipeLayer setHidden:0];
    [(CAShapeLayer *)self->_foregroundSwipeLayer setHidden:0];
    [(CAShapeLayer *)self->_horizontalLineLayer setHidden:1];
    [(CALayer *)self->_opticalGroupLayer setHidden:1];
    for (int i = self->_stripSeconds; (i & 0x80000000) == 0; int i = self->_stripSeconds)
    {
      self->_stripSeconds = i - 1;
      [(CAShapeLayer *)self->_stripLayers[i] setHidden:1];
    }
    self->_stripSeconds = 0;
    self->_stripLayersHidden = 1;
  }
}

- (void)_showTritiumStrips:(int)a3
{
  if (self->_stripLayersHidden)
  {
    [(CAShapeLayer *)self->_backgroundSwipeLayer setHidden:1];
    [(CAShapeLayer *)self->_foregroundSwipeLayer setHidden:1];
    [(CAShapeLayer *)self->_horizontalLineLayer setHidden:0];
    [(CALayer *)self->_opticalGroupLayer setHidden:0];
    self->_stripLayersHidden = 0;
  }
  for (int i = self->_stripSeconds; i > a3; int i = self->_stripSeconds)
  {
    self->_stripSeconds = i - 1;
    [(CAShapeLayer *)self->_stripLayers[i] setHidden:1];
  }
  for (; i <= a3; int i = self->_stripSeconds)
  {
    self->_stripSeconds = i + 1;
    [(CAShapeLayer *)self->_stripLayers[i] setHidden:0];
  }
  [(CAShapeLayer *)self->_stripLayers[a3] frame];
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, 0.0, v6);
  opticalMaskLayer = self->_opticalMaskLayer;
  CGAffineTransform v9 = v10;
  [(CAShapeLayer *)opticalMaskLayer setAffineTransform:&v9];
  opticalSwipeLayer = self->_opticalSwipeLayer;
  CGAffineTransform v9 = v10;
  [(CAShapeLayer *)opticalSwipeLayer setAffineTransform:&v9];
  self->_stripSeconds = a3;
}

- (id)_createTritiumStrip:(int)a3 size:(CGSize)a4 parentLayer:(id)a5
{
  double width = a4.width;
  id v8 = a5;
  [(NTKDolomiteContentView *)self bounds];
  double v10 = v9;
  if (self->_contentOption)
  {
    double v16 = v9 * 0.833333333 / -60.0;
    double v14 = v16 * (double)a3 + v9 * 0.916666667;
    double v15 = v16 * (double)(a3 + 1) + v9 * 0.916666667;
  }
  else
  {
    float64_t v11 = +[CLKDevice currentDevice];
    [v11 screenScale];
    double v13 = v12;

    double v14 = round(v10 * v13 * (double)(60 - a3) / 60.0) / v13 + -1.0;
    double v15 = round(v10 * v13 * (double)(59 - a3) / 60.0) / v13;
  }
  CGFloat v17 = v14 - v15 + 2.0;
  double v18 = objc_opt_new();
  objc_msgSend(v18, "setFrame:", 0.0, v14, width, v17);
  double v19 = sub_3DA0();
  [v18 setActions:v19];

  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = width;
  v23.size.double height = v17;
  uint64_t v20 = CGPathCreateWithRect(v23, 0);
  [v18 setPath:v20];
  CGPathRelease(v20);
  [v8 addSublayer:v18];

  return v18;
}

- (id)_createFillShapeLayerOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  objc_msgSend(v7, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height);
  [v7 setLineCap:kCALineCapRound];
  [v7 setLineWidth:2.0];
  id v8 = sub_3DA0();
  [v7 setActions:v8];

  [v6 addSublayer:v7];

  return v7;
}

- (id)_createLayerOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = +[CALayer layer];
  objc_msgSend(v7, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height);
  id v8 = sub_3DA0();
  [v7 setActions:v8];

  [v6 addSublayer:v7];

  return v7;
}

- (id)_createViewOfSize:(CGSize)a3 parent:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, width, height);
  id v8 = [v7 layer];
  objc_msgSend(v8, "setPosition:", width * 0.5, height * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, width, height);
  double v9 = sub_3DA0();
  [v8 setActions:v9];

  [v6 addSubview:v7];

  return v7;
}

- (void)setDigitFadeFraction:(double)a3
{
  if (self->_digitFadeFraction != a3)
  {
    self->_digitFadeFraction = a3;
    CLKMapFractionIntoRange();
    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeScale(&v8, v5, v5);
    textGroupView = self->_textGroupView;
    CGAffineTransform v7 = v8;
    [(UIView *)textGroupView setTransform:&v7];
    [(UIView *)self->_textGroupView setAlpha:a3];
  }
}

- (double)digitFadeFraction
{
  return self->_digitFadeFraction;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_textGroupView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_horizontalLineLayer, 0);
  for (uint64_t i = 59; i != -1; --i)
    objc_storeStrong((id *)&self->_stripLayers[i], 0);
  for (uint64_t j = 3; j != -1; --j)
    objc_storeStrong((id *)&self->_opticalDigitLayers[j], 0);
  objc_storeStrong((id *)&self->_opticalSwipeLayer, 0);
  objc_storeStrong((id *)&self->_opticalDigitGroupLayer, 0);
  objc_storeStrong((id *)&self->_opticalBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_opticalMaskLayer, 0);
  objc_storeStrong((id *)&self->_opticalGroupLayer, 0);
  for (uint64_t k = 3; k != -1; --k)
    objc_storeStrong((id *)&self->_digitLayers[k], 0);
  objc_storeStrong((id *)&self->_digitGroupLayer, 0);
  objc_storeStrong((id *)&self->_textGroupLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_backgroundSwipeLayer, 0);
  objc_storeStrong((id *)&self->_foregroundSwipeLayer, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  for (uint64_t m = 1; m != -1; --m)
    objc_storeStrong((id *)&self->_foregroundColors[m], 0);
  for (uint64_t n = 13; n != -1; --n)
    objc_storeStrong((id *)&self->_foregroundDynamicColors[n], 0);
  for (iuint64_t i = 13; ii != -1; --ii)
    objc_storeStrong((id *)&self->_backgroundDynamicColors[ii], 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong(&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end