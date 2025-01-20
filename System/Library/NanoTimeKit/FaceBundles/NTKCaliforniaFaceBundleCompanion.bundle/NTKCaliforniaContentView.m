@interface NTKCaliforniaContentView
+ (id)_disabledLayerActions;
- (BOOL)bezelComplicationEnabled;
- (BOOL)circularPillMarkersCenterPointsCalculated;
- (BOOL)showingStatusIcon;
- (CALayer)hourTicks;
- (CALayer)minuteTicks;
- (CGPoint)circularPillMarkersCenterPoints;
- (CGPoint)hourMarkersCenterPointConstantsForStyle:(unint64_t)a3 dial:(unint64_t)a4;
- (CLKDevice)device;
- (NSArray)hourMarkers;
- (NSArray)temporaryHourMarkers;
- (NSArray)tickCircularOpacities;
- (NSArray)tickLayers;
- (NTKCaliforniaColorPalette)colorPalette;
- (NTKCaliforniaContentView)initWithFrame:(CGRect)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 device:(id)a7;
- (NTKCaliforniaStyleTransitionHandler)styleTransitionHandler;
- (UIImage)circularCalifornia12;
- (UIImage)fullscreenCalifornia12;
- (double)circularBezelTickAlpha;
- (id)_createChineseLabelAtIndex:(int)a3 dial:(unint64_t)a4 forStyle:(unint64_t)a5;
- (id)_createLayer;
- (id)_createLayersWithCount:(unint64_t)a3;
- (id)_digitLayersForStyle:(unint64_t)a3 dial:(unint64_t)a4;
- (id)attributedStringForDigit:(unint64_t)a3 style:(unint64_t)a4 font:(id)a5;
- (id)createCaliforniaGraphicAtIndex:(unint64_t)a3 dial:(unint64_t)a4;
- (id)createLabelAtIndex:(int)a3 forStyle:(unint64_t)a4 dial:(unint64_t)a5;
- (id)createPillAtIndex:(unint64_t)a3 dial:(unint64_t)a4;
- (id)createPillViewWithAngle:(double)a3 size:(const CGSize *)a4;
- (id)hourTickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5;
- (id)languageRenderingHintForCaliforniaStyle:(unint64_t)a3;
- (id)minuteTickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5;
- (id)pillLayerFromHourMarkerView:(id)a3;
- (id)textForDigit:(unint64_t)a3 style:(unint64_t)a4;
- (id)tickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5;
- (unint64_t)dial;
- (unint64_t)hourMarkersDial;
- (unint64_t)hourMarkersStyle;
- (unint64_t)style;
- (unint64_t)temporaryHourMarkersDial;
- (unint64_t)temporaryHourMarkersStyle;
- (void)_applyStyle:(unint64_t)a3;
- (void)_createDigitsIfNeededWithStyle:(unint64_t)a3 dial:(unint64_t)a4;
- (void)_createTemporaryDigitsIfNeededWithStyle:(unint64_t)a3 dial:(unint64_t)a4;
- (void)_layoutHourMarkersLayers:(id)a3 style:(unint64_t)a4 dialShape:(unint64_t)a5;
- (void)addTicksIfNeeded;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)applyTransitionFractionToTicksFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5;
- (void)configureTicksForStatus:(BOOL)a3;
- (void)layoutSubviews;
- (void)layoutTicks;
- (void)removeHourMarkers;
- (void)removeTemporaryHourMarkers;
- (void)setBezelComplicationEnabled:(BOOL)a3;
- (void)setCircularBezelTickAlpha:(double)a3;
- (void)setCircularCalifornia12:(id)a3;
- (void)setCircularPillMarkersCenterPointsCalculated:(BOOL)a3;
- (void)setColorInHourMarkerView:(id)a3 color:(id)a4;
- (void)setColorPalette:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDial:(unint64_t)a3;
- (void)setFullscreenCalifornia12:(id)a3;
- (void)setHourMarkers:(id)a3;
- (void)setHourMarkersDial:(unint64_t)a3;
- (void)setHourMarkersStyle:(unint64_t)a3;
- (void)setHourTicks:(id)a3;
- (void)setHourTicksColor:(id)a3;
- (void)setMinuteTicks:(id)a3;
- (void)setMinuteTicksColor:(id)a3;
- (void)setShowingStatusIcon:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyleTransitionHandler:(id)a3;
- (void)setTemporaryHourMarkers:(id)a3;
- (void)setTemporaryHourMarkersDial:(unint64_t)a3;
- (void)setTemporaryHourMarkersStyle:(unint64_t)a3;
- (void)setTickCircularOpacities:(id)a3;
- (void)setTickLayers:(id)a3;
- (void)setTicksHiddenRange:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKCaliforniaContentView

- (NTKCaliforniaContentView)initWithFrame:(CGRect)a3 dial:(unint64_t)a4 style:(unint64_t)a5 colorPalette:(id)a6 device:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NTKCaliforniaContentView;
  v17 = -[NTKCaliforniaContentView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_device, a7);
    v18->_circularBezelTickAlpha = 1.0;
    [(NTKCaliforniaContentView *)v18 setDial:a4];
    [(NTKCaliforniaContentView *)v18 setColorPalette:v15];
    [(NTKCaliforniaContentView *)v18 _applyStyle:a5];
    v19 = +[UIColor clearColor];
    [(NTKCaliforniaContentView *)v18 setBackgroundColor:v19];
  }
  return v18;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCaliforniaContentView;
  [(NTKCaliforniaContentView *)&v3 layoutSubviews];
  [(NTKCaliforniaContentView *)self bounds];
  -[CALayer setFrame:](self->_hourTicks, "setFrame:");
  [(NTKCaliforniaContentView *)self bounds];
  -[CALayer setFrame:](self->_minuteTicks, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCaliforniaContentView;
  id v4 = a3;
  [(NTKCaliforniaContentView *)&v8 traitCollectionDidChange:v4];
  v5 = [(NTKCaliforniaContentView *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7) {
    [(NTKCaliforniaContentView *)self _applyStyle:self->_style];
  }
}

- (void)_layoutHourMarkersLayers:(id)a3 style:(unint64_t)a4 dialShape:(unint64_t)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_43E0;
  v5[3] = &unk_18678;
  v5[4] = self;
  v5[5] = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5, a4, a5);
}

- (CGPoint)hourMarkersCenterPointConstantsForStyle:(unint64_t)a3 dial:(unint64_t)a4
{
  id v7 = [(NTKCaliforniaContentView *)self device];
  sub_45C8(v7, __src);
  memcpy(&unk_1F0D8, __src, 0x18C8uLL);

  if (a4 == 1)
  {
    if (a3 >= 0x13) {
      return 0;
    }
    else {
      return (CGPoint *)*(&off_188A0 + a3);
    }
  }
  else
  {
    result = (CGPoint *)&unk_1F318;
    switch(a3)
    {
      case 0uLL:
        result = [(NTKCaliforniaContentView *)self circularPillMarkersCenterPoints];
        break;
      case 1uLL:
        return result;
      case 2uLL:
        result = (CGPoint *)&unk_1F498;
        break;
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
        result = (CGPoint *)&unk_1F0D8;
        break;
      case 6uLL:
        result = (CGPoint *)&unk_1F700;
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (CGPoint)circularPillMarkersCenterPoints
{
  v2 = (unsigned char *)__chkstk_darwin(self, a2);
  objc_super v3 = [v2 device];
  sub_45C8(v3, v24);
  double v21 = v25;

  [v2 bounds];
  CLKRectGetCenter();
  if (!v2[9])
  {
    uint64_t v6 = 0;
    float64x2_t v19 = (float64x2_t)vdupq_lane_s64(v5, 0);
    float64x2_t v20 = (float64x2_t)vdupq_lane_s64(v4, 0);
    int64x2_t v7 = (int64x2_t)xmmword_17850;
    float64x2_t v17 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
    float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x3FE0C152382D7365uLL);
    int64x2_t v16 = vdupq_n_s64(2uLL);
    do
    {
      int64x2_t v23 = v7;
      int32x2_t v8 = vadd_s32(vmovn_s64(v7), (int32x2_t)0x100000001);
      v9.i64[0] = v8.u32[0];
      v9.i64[1] = v8.u32[1];
      float64x2_t v22 = vmlaq_f64(v17, v18, vcvtq_f64_u64(v9));
      __double2 v10 = __sincos_stret(v22.f64[1]);
      __double2 v13 = __sincos_stret(v22.f64[0]);
      v12.f64[0] = v13.__cosval;
      v11.f64[0] = v13.__sinval;
      v11.f64[1] = v10.__sinval;
      v12.f64[1] = v10.__cosval;
      v26.val[0] = vsubq_f64(v20, vmulq_n_f64(v11, v21));
      v26.val[1] = vaddq_f64(v19, vmulq_n_f64(v12, v21));
      v14 = (double *)((char *)&unk_209A0 + v6);
      vst2q_f64(v14, v26);
      int64x2_t v7 = vaddq_s64(v23, v16);
      v6 += 32;
    }
    while (v6 != 192);
    v2[9] = 1;
  }
  return (CGPoint *)&unk_209A0;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
  id v5 = a3;
  [(NTKCaliforniaContentView *)self addTicksIfNeeded];
  tickLayers = self->_tickLayers;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4974;
  v9[3] = &unk_186A0;
  v9[4] = self;
  [(NSArray *)tickLayers enumerateObjectsUsingBlock:v9];
  hourMarkers = self->_hourMarkers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4A18;
  v8[3] = &unk_186C8;
  v8[4] = self;
  [(NSArray *)hourMarkers enumerateObjectsUsingBlock:v8];
}

- (void)setBezelComplicationEnabled:(BOOL)a3
{
  if (self->_bezelComplicationEnabled != a3)
  {
    self->_bezelComplicationEnabled = a3;
    [(NTKCaliforniaContentView *)self layoutTicks];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_hourMarkersStyle != a3
    || ([(NTKCaliforniaContentView *)self styleTransitionHandler],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 fraction],
        double v7 = v6,
        v5,
        v7 != 0.0))
  {
    [(NTKCaliforniaContentView *)self _applyStyle:a3];
    id v8 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v8 setFraction:0.0];
  }
}

- (void)_applyStyle:(unint64_t)a3
{
  [(NTKCaliforniaContentView *)self removeHourMarkers];
  [(NTKCaliforniaContentView *)self _createDigitsIfNeededWithStyle:a3 dial:self->_dial];
  [(NTKCaliforniaContentView *)self removeTemporaryHourMarkers];
  self->_style = a3;
  styleTransitionHandler = self->_styleTransitionHandler;
  self->_styleTransitionHandler = 0;
}

- (void)setDial:(unint64_t)a3
{
  [(NTKCaliforniaContentView *)self _createDigitsIfNeededWithStyle:self->_style dial:a3];
  self->_unint64_t dial = a3;
  [(NTKCaliforniaContentView *)self addTicksIfNeeded];
  if (self->_dial)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v5 = 1;
    uint64_t v6 = 0;
  }
  [(NTKCaliforniaContentView *)self applyTransitionFractionToTicksFraction:v5 fromDial:v6 toDial:1.0];
  [(NTKCaliforniaContentView *)self removeTemporaryHourMarkers];
  hourMarkers = self->_hourMarkers;
  unint64_t style = self->_style;
  unint64_t dial = self->_dial;

  [(NTKCaliforniaContentView *)self _layoutHourMarkersLayers:hourMarkers style:style dialShape:dial];
}

- (void)addTicksIfNeeded
{
  sub_45C8(self->_device, v18);
  hourTicks = self->_hourTicks;
  BOOL v4 = hourTicks == 0;
  if (!hourTicks)
  {
    uint64_t v5 = [(NTKCaliforniaContentView *)self _createLayer];
    uint64_t v6 = self->_hourTicks;
    self->_hourTicks = v5;

    double v7 = [(NTKCaliforniaContentView *)self layer];
    [v7 addSublayer:self->_hourTicks];
  }
  if (!self->_minuteTicks)
  {
    id v8 = [(NTKCaliforniaContentView *)self _createLayer];
    minuteTicks = self->_minuteTicks;
    self->_minuteTicks = v8;

    HIDWORD(v10) = HIDWORD(v19);
    *(float *)&double v10 = v19;
    [(CALayer *)self->_minuteTicks setOpacity:v10];
    [(NTKCaliforniaContentView *)self bounds];
    -[CALayer setFrame:](self->_minuteTicks, "setFrame:");
    float64x2_t v11 = [(NTKCaliforniaContentView *)self layer];
    [v11 addSublayer:self->_minuteTicks];

    BOOL v4 = 1;
  }
  if (self->_tickLayers)
  {
    p_tickCircularOpacities = &self->_tickCircularOpacities;
    if (self->_tickCircularOpacities)
    {
      if (!v4) {
        return;
      }
      goto LABEL_13;
    }
  }
  else
  {
    __double2 v13 = [(NTKCaliforniaContentView *)self _createLayersWithCount:60];
    tickLayers = self->_tickLayers;
    self->_tickLayers = v13;

    p_tickCircularOpacities = &self->_tickCircularOpacities;
    if (self->_tickCircularOpacities) {
      goto LABEL_13;
    }
  }
  id v15 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:60];
  for (uint64_t i = 0; i != 60; ++i)
    [(NSArray *)v15 setObject:&off_1AD80 atIndexedSubscript:i];
  float64x2_t v17 = *p_tickCircularOpacities;
  *p_tickCircularOpacities = v15;

LABEL_13:

  [(NTKCaliforniaContentView *)self layoutTicks];
}

- (void)layoutTicks
{
}

- (void)applyTransitionFractionToTicksFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  uint64_t v5 = __chkstk_darwin(self, a2);
  CLKCompressFraction();
  uint64_t v7 = v6;
  CLKCompressFraction();
  uint64_t v9 = v8;
  memset(v24, 0, 512);
  sub_45C8(*(void **)(v5 + 48), v24);
  [(id)v5 bounds];
  double v11 = v10 * 0.5;
  [(id)v5 bounds];
  double v13 = v12 * 0.5;
  if (*(unsigned char *)(v5 + 10)) {
    v14 = &v24[4800];
  }
  else {
    v14 = &v24[4792];
  }
  uint64_t v15 = *(void *)v14;
  int64x2_t v16 = *(void **)(v5 + 88);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5074;
  v17[3] = &unk_186F0;
  memcpy(v18, v24, sizeof(v18));
  uint64_t v19 = v15;
  uint64_t v20 = v7;
  double v21 = v11;
  double v22 = v13;
  v17[4] = v5;
  uint64_t v23 = v9;
  [v16 enumerateObjectsUsingBlock:v17];
}

- (void)removeTemporaryHourMarkers
{
  [(NSArray *)self->_temporaryHourMarkers enumerateObjectsUsingBlock:&stru_18730];
  temporaryHourMarkers = self->_temporaryHourMarkers;
  self->_temporaryHourMarkers = 0;
}

- (void)removeHourMarkers
{
  [(NSArray *)self->_hourMarkers enumerateObjectsUsingBlock:&stru_18750];
  hourMarkers = self->_hourMarkers;
  self->_hourMarkers = 0;
}

- (void)_createDigitsIfNeededWithStyle:(unint64_t)a3 dial:(unint64_t)a4
{
  if (!self->_hourMarkers || self->_hourMarkersStyle != a3 || self->_hourMarkersDial != a4)
  {
    self->_hourMarkersStyle = a3;
    self->_hourMarkersDial = a4;
    [(NTKCaliforniaContentView *)self removeHourMarkers];
    uint64_t v7 = [(NTKCaliforniaContentView *)self _digitLayersForStyle:a3 dial:a4];
    hourMarkers = self->_hourMarkers;
    self->_hourMarkers = v7;

    uint64_t v9 = self->_hourMarkers;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5528;
    v10[3] = &unk_186C8;
    v10[4] = self;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v10];
    [(NTKCaliforniaContentView *)self _layoutHourMarkersLayers:self->_hourMarkers style:a3 dialShape:a4];
  }
}

- (void)_createTemporaryDigitsIfNeededWithStyle:(unint64_t)a3 dial:(unint64_t)a4
{
  if (!self->_temporaryHourMarkers || self->_temporaryHourMarkersStyle != a3 || self->_temporaryHourMarkersDial != a4)
  {
    self->_temporaryHourMarkersStyle = a3;
    self->_temporaryHourMarkersDial = a4;
    [(NSArray *)self->_temporaryHourMarkers enumerateObjectsUsingBlock:&stru_18770];
    uint64_t v7 = [(NTKCaliforniaContentView *)self _digitLayersForStyle:a3 dial:a4];
    temporaryHourMarkers = self->_temporaryHourMarkers;
    self->_temporaryHourMarkers = v7;

    uint64_t v9 = self->_temporaryHourMarkers;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_56E8;
    v10[3] = &unk_186C8;
    v10[4] = self;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v10];
    [(NTKCaliforniaContentView *)self _layoutHourMarkersLayers:self->_temporaryHourMarkers style:a3 dialShape:a4];
  }
}

- (void)setColorInHourMarkerView:(id)a3 color:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 setTextColor:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 setTintColor:v6];
    }
    else
    {
      id v7 = [v6 CGColor];
      uint64_t v8 = [(NTKCaliforniaContentView *)self pillLayerFromHourMarkerView:v9];
      [v8 setBackgroundColor:v7];
    }
  }
}

- (id)pillLayerFromHourMarkerView:(id)a3
{
  objc_super v3 = [a3 layer];
  BOOL v4 = [v3 sublayers];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)createLabelAtIndex:(int)a3 forStyle:(unint64_t)a4 dial:(unint64_t)a5
{
  id v9 = objc_alloc_init((Class)UILabel);
  sub_45C8(self->_device, v18);
  double v10 = (double *)&v20;
  if (a5) {
    double v10 = (double *)&v19;
  }
  double v11 = *v10;
  double v12 = [(NTKCaliforniaContentView *)self device];
  int v13 = NTKShowIndicScriptNumerals();

  if (!v13
    || (+[NTKSFCompactFont numericSoftFontOfSize:v11 weight:UIFontWeightSemibold], (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = +[CLKFont compactSoftFontOfSize:v11 weight:UIFontWeightSemibold];
  }
  [v9 setFont:v14];
  uint64_t v15 = +[UIColor blackColor];
  [v9 setTextColor:v15];

  int64x2_t v16 = [(NTKCaliforniaContentView *)self attributedStringForDigit:a3 style:a4 font:v14];
  [v9 setAttributedText:v16];

  return v9;
}

- (id)_createChineseLabelAtIndex:(int)a3 dial:(unint64_t)a4 forStyle:(unint64_t)a5
{
  sub_45C8(self->_device, v17);
  id v9 = (double *)&v19;
  double v10 = (double *)&v18;
  if (a3 > 10)
  {
    id v9 = (double *)&v21;
    double v10 = (double *)&v20;
  }
  if (a4) {
    id v9 = v10;
  }
  double v11 = *v9;
  double v12 = +[NTKCaliforniaFontLoader sfNumeralsBoldFontDescriptor];
  int v13 = +[CLKFont fontWithDescriptor:v12 size:v11];

  id v14 = objc_alloc_init((Class)UILabel);
  [v14 setFont:v13];
  uint64_t v15 = [(NTKCaliforniaContentView *)self attributedStringForDigit:a3 style:a5 font:v13];
  [v14 setAttributedText:v15];

  return v14;
}

- (id)textForDigit:(unint64_t)a3 style:(unint64_t)a4
{
  if (!qword_20A60)
  {
    qword_20A60 = (uint64_t)&off_1B5D0;
  }
  if (!qword_20A68)
  {
    qword_20A68 = (uint64_t)&off_1B5E8;
  }
  if (!qword_20A70)
  {
    qword_20A70 = (uint64_t)&off_1B600;
  }
  if (!qword_20A78)
  {
    qword_20A78 = (uint64_t)&off_1B618;
  }
  if (!qword_20A80)
  {
    qword_20A80 = (uint64_t)&off_1B630;
  }
  if (!qword_20A88)
  {
    qword_20A88 = (uint64_t)&off_1B648;
  }
  if (!qword_20A90)
  {
    qword_20A90 = (uint64_t)&off_1B660;
  }
  if (!qword_20A98)
  {
    qword_20A98 = (uint64_t)&off_1B678;
  }
  if (!qword_20AA0)
  {
    qword_20AA0 = (uint64_t)&off_1B690;
  }
  if (!qword_20AA8)
  {
    qword_20AA8 = (uint64_t)&off_1B6A8;
  }
  if (!qword_20AB0)
  {
    qword_20AB0 = (uint64_t)&off_1B6C0;
  }
  if (!qword_20AB8)
  {
    qword_20AB8 = (uint64_t)&off_1B6D8;
  }
  if (!qword_20AC0)
  {
    qword_20AC0 = (uint64_t)&off_1B6F0;
  }
  if (!qword_20AC8)
  {
    qword_20AC8 = (uint64_t)&off_1B708;
  }
  if (!qword_20AD0)
  {
    qword_20AD0 = (uint64_t)&off_1B720;
  }
  if (!qword_20AD8)
  {
    qword_20AD8 = (uint64_t)&off_1B738;
  }
  switch(a4)
  {
    case 1uLL:
      goto LABEL_37;
    case 2uLL:
      id v6 = 0;
      if (a3 > 0xB) {
        goto LABEL_55;
      }
      if (((1 << a3) & 0x1B0) != 0)
      {
LABEL_38:
        uint64_t v8 = +[NSNumber numberWithUnsignedInteger:a3];
        id v6 = [v8 stringValue];
      }
      else if (((1 << a3) & 0xC06) != 0)
      {
LABEL_37:
        id v7 = (void *)qword_20A70;
LABEL_54:
        id v6 = [v7 objectAtIndexedSubscript:a3 - 1];
      }
LABEL_55:
      return v6;
    case 4uLL:
      id v7 = (void *)qword_20A68;
      goto LABEL_54;
    case 5uLL:
      id v7 = (void *)qword_20A60;
      goto LABEL_54;
    case 6uLL:
      id v7 = (void *)qword_20A78;
      goto LABEL_54;
    case 7uLL:
      id v7 = (void *)qword_20A80;
      goto LABEL_54;
    case 8uLL:
      id v7 = (void *)qword_20A88;
      goto LABEL_54;
    case 9uLL:
      id v7 = (void *)qword_20A90;
      goto LABEL_54;
    case 0xAuLL:
      id v7 = (void *)qword_20A98;
      goto LABEL_54;
    case 0xBuLL:
      id v7 = (void *)qword_20AA0;
      goto LABEL_54;
    case 0xCuLL:
      id v7 = (void *)qword_20AA8;
      goto LABEL_54;
    case 0xDuLL:
      id v7 = (void *)qword_20AB0;
      goto LABEL_54;
    case 0xEuLL:
      id v7 = (void *)qword_20AB8;
      goto LABEL_54;
    case 0xFuLL:
      id v7 = (void *)qword_20AC0;
      goto LABEL_54;
    case 0x10uLL:
      id v7 = (void *)qword_20AC8;
      goto LABEL_54;
    case 0x11uLL:
      id v7 = (void *)qword_20AD0;
      goto LABEL_54;
    case 0x12uLL:
      id v7 = (void *)qword_20AD8;
      goto LABEL_54;
    default:
      goto LABEL_38;
  }
}

- (id)attributedStringForDigit:(unint64_t)a3 style:(unint64_t)a4 font:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKCaliforniaContentView *)self textForDigit:a3 style:a4];
  double v10 = [(NTKCaliforniaContentView *)self languageRenderingHintForCaliforniaStyle:a4];
  id v11 = objc_alloc((Class)NSAttributedString);
  v15[0] = NSLanguageIdentifierAttributeName;
  v15[1] = NSFontAttributeName;
  v16[0] = v10;
  v16[1] = v8;
  double v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v13 = [v11 initWithString:v9 attributes:v12];

  return v13;
}

- (id)languageRenderingHintForCaliforniaStyle:(unint64_t)a3
{
  if (a3 + 1 > 0x13) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_17880[a3 + 1];
  }
  return (id)_CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem(v3, a2);
}

- (id)_digitLayersForStyle:(unint64_t)a3 dial:(unint64_t)a4
{
  id v7 = +[NSMutableArray array];
  if (a3 == 6) {
    uint64_t v8 = 15;
  }
  else {
    uint64_t v8 = 13;
  }
  for (uint64_t i = 1; i != v8; ++i)
  {
    if (!a3)
    {
      uint64_t v10 = [(NTKCaliforniaContentView *)self createPillAtIndex:i dial:a4];
      goto LABEL_11;
    }
    if (a3 == 2)
    {
      if (i <= 0xC && ((1 << i) & 0x1248) != 0)
      {
        uint64_t v10 = [(NTKCaliforniaContentView *)self createCaliforniaGraphicAtIndex:i dial:a4];
LABEL_11:
        id v11 = (void *)v10;
        goto LABEL_16;
      }
LABEL_14:
      double v12 = [(NTKCaliforniaContentView *)self createLabelAtIndex:i forStyle:a3 dial:a4];
      goto LABEL_15;
    }
    if (a3 != 6) {
      goto LABEL_14;
    }
    double v12 = [(NTKCaliforniaContentView *)self _createChineseLabelAtIndex:i dial:a4 forStyle:6];
LABEL_15:
    id v11 = v12;
    [v12 sizeToFit];
LABEL_16:
    [v7 addObject:v11];
  }

  return v7;
}

- (id)createCaliforniaGraphicAtIndex:(unint64_t)a3 dial:(unint64_t)a4
{
  if (a3 == 12)
  {
    id v6 = [(NTKCaliforniaContentView *)self device];
    sub_45C8(v6, v18);

    if (a4 == 1)
    {
      p_fullscreenCalifornia12 = &self->_fullscreenCalifornia12;
      if (!self->_fullscreenCalifornia12)
      {
        double v8 = *(double *)&v20[221];
        double v9 = *(double *)&v20[217];
        double v10 = *(double *)&v20[218];
        goto LABEL_11;
      }
LABEL_12:
      id v12 = [objc_alloc((Class)UIImageView) initWithImage:*p_fullscreenCalifornia12];
      goto LABEL_14;
    }
    if (!a4)
    {
      p_fullscreenCalifornia12 = &self->_circularCalifornia12;
      if (!self->_circularCalifornia12)
      {
        double v8 = *(double *)&v20[222];
        double v9 = *(double *)&v20[219];
        double v10 = *(double *)&v20[220];
LABEL_11:
        id v13 = +[NTKCaliforniaTriangleFactory triangleWithSize:radius:](NTKCaliforniaTriangleFactory, "triangleWithSize:radius:", v9, v10, v8);
        uint64_t v14 = [v13 imageWithRenderingMode:2];
        uint64_t v15 = *p_fullscreenCalifornia12;
        *p_fullscreenCalifornia12 = (UIImage *)v14;

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    id v12 = 0;
  }
  else
  {
    sub_45C8(self->_device, v18);
    id v11 = v20;
    if (a4 == 1) {
      id v11 = &v19;
    }
    long long v17 = *(_OWORD *)v11;
    id v12 = [(NTKCaliforniaContentView *)self createPillViewWithAngle:&v17 size:1.57079633];
  }
LABEL_14:

  return v12;
}

- (id)createPillAtIndex:(unint64_t)a3 dial:(unint64_t)a4
{
  memset(v10, 0, 512);
  sub_45C8(self->_device, v10);
  if (a4 == 1)
  {
    long long v9 = v10[a3 + 285];
    if (a3 == 12 && self->_showingStatusIcon) {
      *((void *)&v9 + 1) = v11;
    }
  }
  else
  {
    long long v9 = v10[298];
  }
  id v7 = [(NTKCaliforniaContentView *)self createPillViewWithAngle:&v9 size:(double)a3 * 0.523598776];

  return v7;
}

- (id)createPillViewWithAngle:(double)a3 size:(const CGSize *)a4
{
  id v6 = +[CALayer layer];
  id v7 = [(id)objc_opt_class() _disabledLayerActions];
  [v6 setActions:v7];

  objc_msgSend(v6, "setBounds:", 0.0, 0.0, a4->width, a4->height);
  [v6 setCornerRadius:a4->width * 0.5];
  CGAffineTransformMakeRotation(&v13, a3);
  CGAffineTransform v12 = v13;
  [v6 setAffineTransform:&v12];
  id v8 = objc_alloc_init((Class)UIView);
  long long v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:v9];

  [v6 frame];
  objc_msgSend(v8, "setFrame:");
  double v10 = [v8 layer];
  [v10 addSublayer:v6];

  [v8 bounds];
  CLKRectGetCenter();
  objc_msgSend(v6, "setPosition:");

  return v8;
}

- (id)_createLayer
{
  v2 = +[CALayer layer];
  uint64_t v3 = [(id)objc_opt_class() _disabledLayerActions];
  [v2 setActions:v3];
  objc_msgSend(v2, "setBounds:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v2;
}

- (id)_createLayersWithCount:(unint64_t)a3
{
  BOOL v4 = +[NSMutableArray array];
  uint64_t v5 = [(id)objc_opt_class() _disabledLayerActions];
  if (a3)
  {
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    do
    {
      long long v9 = +[CALayer layer];
      [v9 setActions:v5];
      objc_msgSend(v9, "setBounds:", CGRectZero.origin.x, y, width, height);
      [v4 addObject:v9];

      --a3;
    }
    while (a3);
  }

  return v4;
}

+ (id)_disabledLayerActions
{
  +[NSNull null];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_67A4;
  block[3] = &unk_18798;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = qword_20AE0;
  id v3 = v7;
  if (v2 != -1) {
    dispatch_once(&qword_20AE0, block);
  }
  id v4 = (id)qword_20AE8;

  return v4;
}

- (void)configureTicksForStatus:(BOOL)a3
{
  uint64_t v3 = __chkstk_darwin(self, a2);
  int v5 = v4;
  uint64_t v6 = v3;
  *(unsigned char *)(v3 + 8) = v4;
  uint64_t v7 = *(void *)(v3 + 24);
  id v8 = [*(id *)(v3 + 88) firstObject];
  long long v9 = v8;
  BOOL v10 = v7 == 1 && *(unsigned char *)(v6 + 8) != 0;
  [v8 setHidden:v10];

  if (!*(void *)(v6 + 16) && *(void *)(v6 + 24) == 1)
  {
    sub_45C8(*(void **)(v6 + 48), v20);
    uint64_t v11 = [*(id *)(v6 + 104) objectAtIndexedSubscript:11];
    double v12 = v21;
    if (v5) {
      double v13 = v23;
    }
    else {
      double v13 = v22;
    }
    uint64_t v14 = [(id)v6 pillLayerFromHourMarkerView:v11];
    objc_msgSend(v14, "setBounds:", 0.0, 0.0, v12, v13);

    uint64_t v15 = (double *)[(id)v6 hourMarkersCenterPointConstantsForStyle:*(void *)(v6 + 16) dial:*(void *)(v6 + 24)];
    double v16 = v15[22];
    double v17 = v15[23];
    if (v5)
    {
      uint64_t v18 = [(id)v6 device];
      CLKRoundForDevice();
      double v17 = v17 + v19;
    }
    objc_msgSend(v11, "setCenter:", v16, v17);
  }
}

- (void)setMinuteTicksColor:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CALayer *)self->_minuteTicks sublayers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setHourTicksColor:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CALayer *)self->_hourTicks sublayers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setCircularBezelTickAlpha:(double)a3
{
  if (self->_circularBezelTickAlpha != a3)
  {
    self->_circularBezelTickAlpha = a3;
    [(NTKCaliforniaContentView *)self applyTransitionFractionToTicksFraction:self->_dial fromDial:self->_dial toDial:0.0];
  }
}

- (id)minuteTickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5
{
  id v8 = a4;
  if ([v8 isRainbowColor])
  {
    unint64_t v9 = [v8 colorForCircularTicksForMinute:a3];
  }
  else if (a5 == 1)
  {
    unint64_t v9 = [v8 smallTick];
  }
  else
  {
    if (a5) {
      goto LABEL_11;
    }
    if (self->_bezelComplicationEnabled) {
      [v8 circularDialSubtickColor];
    }
    else {
    unint64_t v9 = [v8 smallTickCircular];
    }
  }
  a3 = v9;
LABEL_11:

  return (id)a3;
}

- (id)hourTickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5
{
  id v8 = a4;
  if ([v8 isRainbowColor])
  {
    unint64_t v9 = [v8 colorForCircularTicksForHour:a3 / 5];
  }
  else
  {
    if (a5 == 1) {
      goto LABEL_7;
    }
    if (a5) {
      goto LABEL_9;
    }
    if (!self->_bezelComplicationEnabled)
    {
LABEL_7:
      unint64_t v9 = [v8 largeTick];
    }
    else
    {
      unint64_t v9 = [v8 circularDialTickColor];
    }
  }
  a3 = v9;
LABEL_9:

  return (id)a3;
}

- (id)tickColorForIndex:(unint64_t)a3 palette:(id)a4 dial:(unint64_t)a5
{
  if (0xCCCCCCCCCCCCCCCDLL * a3 <= 0x3333333333333333) {
    -[NTKCaliforniaContentView hourTickColorForIndex:palette:dial:](self, "hourTickColorForIndex:palette:dial:");
  }
  else {
  int v5 = -[NTKCaliforniaContentView minuteTickColorForIndex:palette:dial:](self, "minuteTickColorForIndex:palette:dial:");
  }

  return v5;
}

- (void)setTicksHiddenRange:(double)a3
{
  [(NTKCaliforniaContentView *)self addTicksIfNeeded];
  memset(&v17[30], 0, 32);
  -[NTKCaliforniaContentView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  int v5 = 0);
  sub_45C8(v5, v17);

  id v6 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:60];
  if ([(NSArray *)self->_tickLayers count])
  {
    unint64_t v7 = 0;
    double v8 = a3 * 0.5;
    do
    {
      double v9 = *((double *)&v17[300] + v7 + 1) + 1.57079633;
      if (v9 > 3.14159265) {
        double v9 = 6.28318531 - v9;
      }
      if (v9 >= v8) {
        long long v10 = &off_1AD80;
      }
      else {
        long long v10 = &off_1AD98;
      }
      [(NSArray *)v6 setObject:v10 atIndexedSubscript:v7];
      if (!self->_dial)
      {
        long long v11 = [(NSArray *)v6 objectAtIndexedSubscript:v7];
        [v11 doubleValue];
        float v13 = v12;
        uint64_t v14 = [(NSArray *)self->_tickLayers objectAtIndexedSubscript:v7];
        *(float *)&double v15 = v13;
        [v14 setOpacity:v15];
      }
      ++v7;
    }
    while (v7 < [(NSArray *)self->_tickLayers count]);
  }
  tickCircularOpacities = self->_tickCircularOpacities;
  self->_tickCircularOpacities = v6;
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEqual:v9])
  {
    [(NTKCaliforniaContentView *)self setColorPalette:v9];
  }
  else
  {
    tickLayers = self->_tickLayers;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_71C4;
    v19[3] = &unk_187C0;
    v19[4] = self;
    id v11 = v8;
    id v20 = v11;
    id v12 = v9;
    id v21 = v12;
    double v22 = a3;
    [(NSArray *)tickLayers enumerateObjectsUsingBlock:v19];
    hourMarkers = self->_hourMarkers;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_72A4;
    v14[3] = &unk_187E8;
    id v15 = v11;
    double v18 = a3;
    id v16 = v12;
    double v17 = self;
    [(NSArray *)hourMarkers enumerateObjectsUsingBlock:v14];
  }
}

- (void)applyTransitionFraction:(double)a3 fromDial:(unint64_t)a4 toDial:(unint64_t)a5
{
  unint64_t v5 = a4;
  if (a4 == a5)
  {
    [(NTKCaliforniaContentView *)self setDial:a3];
  }
  else
  {
    [(NTKCaliforniaContentView *)self addTicksIfNeeded];
    CLKCompressFraction();
    [(NTKCaliforniaContentView *)self applyTransitionFractionToTicksFraction:v5 fromDial:a5 toDial:a3];
    if (self->_dial != a5) {
      unint64_t v5 = a5;
    }
    [(NTKCaliforniaContentView *)self _createTemporaryDigitsIfNeededWithStyle:self->_style dial:v5];
    CLKCompressFraction();
    double v10 = v9;
    p_hourMarkers = &self->_hourMarkers;
    if ([(NSArray *)self->_hourMarkers count])
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      double v14 = fmin(v10 + v10, 1.0);
      double v15 = fmin(1.0 - v10 + 1.0 - v10, 1.0);
      do
      {
        if (v5 == 1)
        {
          id v16 = [(NSArray *)self->_temporaryHourMarkers objectAtIndex:v13];
          p_temporaryHourMarkers = &self->_hourMarkers;
        }
        else
        {
          id v16 = [(NSArray *)*p_hourMarkers objectAtIndex:v13];
          p_temporaryHourMarkers = &self->_temporaryHourMarkers;
        }
        double v18 = [(NSArray *)*p_temporaryHourMarkers objectAtIndex:v13];
        [v18 setAlpha:v14];
        [v16 setAlpha:v15];
        [(NTKCaliforniaContentView *)self hourMarkersCenterPointConstantsForStyle:self->_style dial:0];
        [(NTKCaliforniaContentView *)self hourMarkersCenterPointConstantsForStyle:self->_style dial:1];
        CLKInterpolateBetweenFloatsClipped();
        double v20 = v19;
        CLKInterpolateBetweenFloatsClipped();
        double v22 = v21;
        objc_msgSend(v18, "setCenter:", v20, v21);
        objc_msgSend(v16, "setCenter:", v20, v22);
        [v18 bounds];
        [v16 bounds];
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v28, v23, v23);
        CGAffineTransform v27 = v28;
        [v16 setTransform:&v27];
        [v16 bounds];
        [v18 bounds];
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v26, v24, v24);
        CGAffineTransform v25 = v26;
        [v18 setTransform:&v25];

        ++v13;
        v12 += 16;
      }
      while (v13 < [(NSArray *)*p_hourMarkers count]);
    }
  }
}

- (NTKCaliforniaStyleTransitionHandler)styleTransitionHandler
{
  styleTransitionHandler = self->_styleTransitionHandler;
  if (!styleTransitionHandler)
  {
    id v4 = [NTKCaliforniaStyleTransitionHandler alloc];
    unint64_t v5 = [(NTKCaliforniaContentView *)self device];
    id v6 = [(NTKCaliforniaStyleTransitionHandler *)v4 initWithDevice:v5];
    unint64_t v7 = self->_styleTransitionHandler;
    self->_styleTransitionHandler = v6;

    [(NTKCaliforniaContentView *)self bounds];
    double v9 = v8 * 0.5;
    [(NTKCaliforniaContentView *)self bounds];
    -[NTKCaliforniaStyleTransitionHandler setCenterPoint:](self->_styleTransitionHandler, "setCenterPoint:", v9, v10 * 0.5);
    styleTransitionHandler = self->_styleTransitionHandler;
  }

  return styleTransitionHandler;
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKCaliforniaContentView *)self setStyle:a3];
  }
  else
  {
    [(NTKCaliforniaContentView *)self _createDigitsIfNeededWithStyle:a4 dial:self->_dial];
    [(NTKCaliforniaContentView *)self _createTemporaryDigitsIfNeededWithStyle:a5 dial:self->_dial];
    unint64_t dial = self->_dial;
    double v10 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v10 setDial:dial];

    id v11 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v11 setFraction:a3];

    uint64_t v12 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v12 setHourMarkersCount:12];

    unint64_t v13 = [(NTKCaliforniaContentView *)self hourMarkersCenterPointConstantsForStyle:a4 dial:self->_dial];
    double v14 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v14 setFadeOutHourMarkersCenterPoints:v13];

    double v15 = [(NTKCaliforniaContentView *)self hourMarkersCenterPointConstantsForStyle:a5 dial:self->_dial];
    id v16 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
    [v16 setFadeInHourMarkersCenterPoints:v15];

    for (unint64_t i = 0; i != 14; ++i)
    {
      if ([(NSArray *)self->_hourMarkers count] > i)
      {
        double v18 = [(NSArray *)self->_hourMarkers objectAtIndexedSubscript:i];
        double v19 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        [v19 opacityForMarkerAtIndex:i markerType:0];
        objc_msgSend(v18, "setAlpha:");

        double v20 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        [v20 positionForMarkerAtIndex:i markerType:0];
        objc_msgSend(v18, "setCenter:");

        double v21 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        double v22 = v21;
        if (v21)
        {
          [v21 transformForMarkerAtIndex:i markerType:0];
        }
        else
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v33 = 0u;
        }
        v32[0] = v33;
        v32[1] = v34;
        v32[2] = v35;
        [v18 setTransform:v32];
      }
      if ([(NSArray *)self->_temporaryHourMarkers count] > i)
      {
        CGFloat v23 = [(NSArray *)self->_temporaryHourMarkers objectAtIndexedSubscript:i];
        CGFloat v24 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        [v24 opacityForMarkerAtIndex:i markerType:1];
        objc_msgSend(v23, "setAlpha:");

        CGAffineTransform v25 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        [v25 positionForMarkerAtIndex:i markerType:1];
        objc_msgSend(v23, "setCenter:");

        CGAffineTransform v26 = [(NTKCaliforniaContentView *)self styleTransitionHandler];
        CGAffineTransform v27 = v26;
        if (v26)
        {
          [v26 transformForMarkerAtIndex:i markerType:1];
        }
        else
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v29 = 0u;
        }
        v28[0] = v29;
        v28[1] = v30;
        v28[2] = v31;
        [v23 setTransform:v28];
      }
    }
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (NTKCaliforniaColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (double)circularBezelTickAlpha
{
  return self->_circularBezelTickAlpha;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (CALayer)hourTicks
{
  return self->_hourTicks;
}

- (void)setHourTicks:(id)a3
{
}

- (CALayer)minuteTicks
{
  return self->_minuteTicks;
}

- (void)setMinuteTicks:(id)a3
{
}

- (UIImage)circularCalifornia12
{
  return self->_circularCalifornia12;
}

- (void)setCircularCalifornia12:(id)a3
{
}

- (UIImage)fullscreenCalifornia12
{
  return self->_fullscreenCalifornia12;
}

- (void)setFullscreenCalifornia12:(id)a3
{
}

- (NSArray)tickLayers
{
  return self->_tickLayers;
}

- (void)setTickLayers:(id)a3
{
}

- (NSArray)tickCircularOpacities
{
  return self->_tickCircularOpacities;
}

- (void)setTickCircularOpacities:(id)a3
{
}

- (NSArray)hourMarkers
{
  return self->_hourMarkers;
}

- (void)setHourMarkers:(id)a3
{
}

- (unint64_t)hourMarkersStyle
{
  return self->_hourMarkersStyle;
}

- (void)setHourMarkersStyle:(unint64_t)a3
{
  self->_hourMarkersStyle = a3;
}

- (unint64_t)hourMarkersDial
{
  return self->_hourMarkersDial;
}

- (void)setHourMarkersDial:(unint64_t)a3
{
  self->_hourMarkersDial = a3;
}

- (NSArray)temporaryHourMarkers
{
  return self->_temporaryHourMarkers;
}

- (void)setTemporaryHourMarkers:(id)a3
{
}

- (unint64_t)temporaryHourMarkersStyle
{
  return self->_temporaryHourMarkersStyle;
}

- (void)setTemporaryHourMarkersStyle:(unint64_t)a3
{
  self->_temporaryHourMarkersStyle = a3;
}

- (unint64_t)temporaryHourMarkersDial
{
  return self->_temporaryHourMarkersDial;
}

- (void)setTemporaryHourMarkersDial:(unint64_t)a3
{
  self->_temporaryHourMarkersDial = a3;
}

- (void)setStyleTransitionHandler:(id)a3
{
}

- (BOOL)showingStatusIcon
{
  return self->_showingStatusIcon;
}

- (void)setShowingStatusIcon:(BOOL)a3
{
  self->_showingStatusIcon = a3;
}

- (BOOL)circularPillMarkersCenterPointsCalculated
{
  return self->_circularPillMarkersCenterPointsCalculated;
}

- (void)setCircularPillMarkersCenterPointsCalculated:(BOOL)a3
{
  self->_circularPillMarkersCenterPointsCalculated = a3;
}

- (BOOL)bezelComplicationEnabled
{
  return self->_bezelComplicationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleTransitionHandler, 0);
  objc_storeStrong((id *)&self->_temporaryHourMarkers, 0);
  objc_storeStrong((id *)&self->_hourMarkers, 0);
  objc_storeStrong((id *)&self->_tickCircularOpacities, 0);
  objc_storeStrong((id *)&self->_tickLayers, 0);
  objc_storeStrong((id *)&self->_fullscreenCalifornia12, 0);
  objc_storeStrong((id *)&self->_circularCalifornia12, 0);
  objc_storeStrong((id *)&self->_minuteTicks, 0);
  objc_storeStrong((id *)&self->_hourTicks, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_colorPalette, 0);
}

@end