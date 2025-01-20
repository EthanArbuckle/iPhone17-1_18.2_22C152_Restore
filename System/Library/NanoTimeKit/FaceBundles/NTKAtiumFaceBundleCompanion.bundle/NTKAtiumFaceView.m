@interface NTKAtiumFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3;
- (BOOL)_applyRoundedCornerOverlay;
- (CLKUIQuadView)quadView;
- (NTKAtiumFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKAtiumQuad)quad;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (id)_snapshotWithPigment:(id)a3 analogDialShape:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromShape:(unint64_t)a4 toShape:(unint64_t)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_reorderSwitcherSnapshotView;
- (void)_setShape:(unint64_t)a3;
- (void)_setUpMetalView;
- (void)_tearDownMetalView;
- (void)_unloadSnapshotContentViews;
- (void)_updateColors;
- (void)_updateColorsWithInterpolatedPalette:(id)a3;
- (void)_updateComplicationColorsWithPalette:(id)a3;
- (void)_updateComplicationsWithComplicationColor;
- (void)_updateContentTransform;
- (void)_updateFaceColorsWithPalette:(id)a3;
- (void)_updateQuadColorsWithPalette:(id)a3 forQuad:(id)a4;
- (void)_updateShape;
- (void)atiumQuadDidUpdateAnimatingOverrideDate:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKAtiumFaceView

- (NTKAtiumFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKAtiumFaceView;
  v10 = [(NTKAtiumFaceView *)&v15 initWithFaceStyle:a3 forDevice:v9 clientIdentifier:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a4);
    +[NTKAnalogUtilities dialDiameterForDevice:v9];
    *(float *)&double v12 = v12;
    v11->_dialDiameter = *(float *)&v12;
    v11->_dialDiameterScale = 1.0;
    id v13 = [objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initWithFaceView:v11 dialDiameter:v9 device:v11->_dialDiameter];
    [(NTKAtiumFaceView *)v11 setComplicationFactory:v13];
    v11->_breathScaleModifier = 1.0;
    v11->_rubberBandScaleModifier = 1.0;
  }
  return v11;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAtiumFaceView;
  [(NTKAtiumFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKAtiumFaceView *)self _setUpMetalView];
  [(NTKAtiumFaceView *)self _updateShape];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAtiumFaceView;
  [(NTKAtiumFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKAtiumFaceView *)self _tearDownMetalView];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAtiumFaceView;
  [(NTKAtiumFaceView *)&v3 _applyFrozen];
  [(NTKAtiumFaceView *)self isFrozen];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAtiumFaceView;
  id v6 = a3;
  [(NTKAtiumFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKAtiumQuad setOverrideDate:duration:](self->_compositeQuad, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_reorderSwitcherSnapshotView
{
  objc_super v3 = [(NTKAtiumFaceView *)self switcherSnapshotView];

  if (v3)
  {
    id v4 = [(NTKAtiumFaceView *)self switcherSnapshotView];
    [(NTKAtiumFaceView *)self bringSubviewToFront:v4];
  }
}

- (void)_setUpMetalView
{
  [(CLKDevice *)self->_device screenBounds];
  +[CLKUIMetalQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIMetalQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"ATM", 0, 0);
  objc_super v3 = (CLKUIMetalQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v3;

  [(CLKUIMetalQuadView *)self->_quadView setDelegate:self];
  [(CLKUIMetalQuadView *)self->_quadView setUserInteractionEnabled:0];
  [(CLKUIMetalQuadView *)self->_quadView setOpaque:1];
  v5 = [[NTKAtiumQuad alloc] initWithDevice:self->_device];
  compositeQuad = self->_compositeQuad;
  self->_compositeQuad = v5;

  [(NTKAtiumQuad *)self->_compositeQuad setDelegate:self];
  [(CLKUIMetalQuadView *)self->_quadView addQuad:self->_compositeQuad];
  objc_super v7 = [(NTKAtiumFaceView *)self contentView];
  [v7 addSubview:self->_quadView];

  [(NTKAtiumFaceView *)self bounds];
  -[CLKUIMetalQuadView setFrame:](self->_quadView, "setFrame:");
  [(CLKUIMetalQuadView *)self->_quadView setPreferredFramesPerSecond:30];
  v8 = self->_quadView;

  [(CLKUIMetalQuadView *)v8 setPaused:1];
}

- (void)_tearDownMetalView
{
  [(CLKUIMetalQuadView *)self->_quadView removeQuad:self->_compositeQuad];
  compositeQuad = self->_compositeQuad;
  self->_compositeQuad = 0;

  [(CLKUIMetalQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKAtiumFaceView;
  id v6 = a4;
  [(NTKAtiumFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (id)createFaceColorPalette
{
  v2 = [[NTKAtiumColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (BOOL)_allowsEditingSliderEditableColorsForSlot:(id)a3
{
  return 0;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    [(NTKAtiumFaceView *)self _updateColors];
  }
  else if (a4 == 15)
  {
    -[NTKAtiumFaceView _setShape:](self, "_setShape:", [v9 dialShape]);
  }
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA || ((1 << a3) & 0x403) == 0) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 0.0;
  if (!self->_shape) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKAtiumFaceView;
  -[NTKAtiumFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v15, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKAtiumFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKAtiumFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  v10 = [(NTKAtiumFaceView *)self complicationContainerView];
  [v10 setAlpha:v9];

  [(NTKAtiumFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKAtiumFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  id v13 = [(NTKAtiumFaceView *)self timeView];
  [v13 setAlpha:v12];

  v14 = [(NTKAtiumFaceView *)self contentView];
  [v14 setAlpha:v12];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    v14 = [(NTKAtiumFaceView *)self interpolatedColorPalette];
    [(NTKAtiumFaceView *)self _updateColorsWithInterpolatedPalette:v14];
  }
  else if (a6 == 15)
  {
    -[NTKAtiumFaceView _applyTransitionFraction:fromShape:toShape:](self, "_applyTransitionFraction:fromShape:toShape:", [v15 dialShape], objc_msgSend(v12, "dialShape"), a3);
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAtiumFaceView;
  -[NTKAtiumFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v7, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  NTKLargeElementScaleForBreathingFraction();
  self->_breathScaleModifier = v6;
  [(NTKAtiumFaceView *)self _updateContentTransform];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAtiumFaceView;
  -[NTKAtiumFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v7, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  NTKScaleForRubberBandingFraction();
  self->_rubberBandScaleModifier = v6;
  [(NTKAtiumFaceView *)self _updateContentTransform];
  NTKAlphaForRubberBandingFraction();
  -[NTKAtiumFaceView setAlpha:](self, "setAlpha:");
}

- (void)_updateContentTransform
{
  CGFloat v3 = self->_breathScaleModifier * self->_rubberBandScaleModifier;
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, v3, v3);
  CGAffineTransform v4 = v5;
  [(NTKAtiumFaceView *)self setTransform:&v4];
}

- (void)_updateColors
{
  id v3 = [(NTKAtiumFaceView *)self colorPalette];
  [(NTKAtiumFaceView *)self _updateQuadColorsWithPalette:v3 forQuad:self->_compositeQuad];
  [(NTKAtiumFaceView *)self _updateFaceColorsWithPalette:v3];
}

- (void)_updateQuadColorsWithPalette:(id)a3 forQuad:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v13 = [v6 lightColor1];
  objc_super v7 = [v6 lightColor2];
  double v8 = [v6 lightColor3];
  id v9 = [v6 isThreeColor];
  [v5 setFirstLightColor:v13];
  [v5 setSecondLightColor:v7];
  [v5 setBackgroundLightColor:v8];
  id v10 = [v6 isRainbow];
  [v5 setRecolorLightingTextureEnabled:(v10 | v9) ^ 1];
  [v5 setUseRainbowTexture:v10];
  [v5 setUseThreeColorTexture:v9];
  [v6 tritiumMaskMultiplier];
  float v12 = v11;

  [v5 setTritiumMaskMultiplier:v12];
}

- (void)_updateFaceColorsWithPalette:(id)a3
{
  id v12 = a3;
  CGAffineTransform v4 = [(NTKAtiumFaceView *)self timeView];
  id v5 = [v12 handsColor];
  id v6 = [v12 handsColor];
  [v4 applyHourMinuteHandsStrokeColor:v5 fillColor:v6];

  objc_super v7 = [(NTKAtiumFaceView *)self timeView];
  double v8 = +[UIColor whiteColor];
  [v7 applySecondHandColor:v8];

  id v9 = [(NTKAtiumFaceView *)self timeView];
  id v10 = [v9 minuteHandView];
  float v11 = +[UIColor blackColor];
  [v10 setHandDotColor:v11];

  [(NTKAtiumFaceView *)self _updateComplicationColorsWithPalette:v12];
}

- (void)_updateComplicationColorsWithPalette:(id)a3
{
  id v4 = [a3 cornerComplicationColor];
  [(NTKAtiumFaceView *)self setAlternateComplicationColor:v4];
  [(NTKAtiumFaceView *)self setComplicationColor:v4];
  [(NTKAtiumFaceView *)self setInterpolatedComplicationColor:v4];
  [(NTKAtiumFaceView *)self _updateComplicationsWithComplicationColor];
}

- (void)_updateComplicationsWithComplicationColor
{
}

- (void)_updateColorsWithInterpolatedPalette:(id)a3
{
  id v4 = a3;
  id v13 = [v4 fromPalette];
  id v5 = [v4 toPalette];
  [v4 transitionFraction];
  double v7 = v6;
  [(NTKAtiumFaceView *)self _updateQuadColorsWithPalette:v13 forQuad:self->_compositeQuad];
  [(NTKAtiumFaceView *)self _updateFaceColorsWithPalette:v4];

  double v8 = [v5 lightColor1];
  id v9 = [v5 lightColor2];
  id v10 = [v5 lightColor3];
  id v11 = [v5 isThreeColor];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendFirstLightColor:v8];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendSecondLightColor:v9];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendBackgroundLightColor:v10];
  id v12 = [v5 isRainbow];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendRecolorLightingTextureEnabled:(v12 | v11) ^ 1];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendUseRainbowTexture:v12];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendUseThreeColorTexture:v11];
  [(NTKAtiumQuad *)self->_compositeQuad setBlendTransitionFraction:v7];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKAtiumFaceView;
  [(NTKAtiumFaceView *)&v7 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
}

- (void)_loadLayoutRules
{
  v17.receiver = self;
  v17.super_class = (Class)NTKAtiumFaceView;
  [(NTKAtiumFaceView *)&v17 _loadLayoutRules];
  [(CLKDevice *)self->_device sizeClass];
  if (CLKDeviceCategoryForSizeClass() != 5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3FBC;
    v16[3] = &unk_C538;
    v16[4] = self;
    id v3 = objc_retainBlock(v16);
    id v4 = [(NTKAtiumFaceView *)self device];
    NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice();
    CGFloat v6 = v5;

    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v6, v6);
    objc_super v7 = (void (*)(void *, CGAffineTransform *, void))v3[2];
    CGAffineTransform v14 = v15;
    v7(v3, &v14, 0);
    double v8 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
    CGAffineTransform v14 = v15;
    v8(v3, &v14, 1);
    id v9 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v14.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v12 = *(_OWORD *)&v14.a;
    *(_OWORD *)&v14.c = v13;
    *(_OWORD *)&v14.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v11 = *(_OWORD *)&v14.tx;
    v9(v3, &v14, 3);
    id v10 = (void (*)(void *, CGAffineTransform *, uint64_t))v3[2];
    *(_OWORD *)&v14.a = v12;
    *(_OWORD *)&v14.c = v13;
    *(_OWORD *)&v14.tx = v11;
    v10(v3, &v14, 2);
  }
}

- (void)_setShape:(unint64_t)a3
{
  if (self->_shape != a3)
  {
    self->_shape = a3;
    [(NTKAtiumFaceView *)self _updateShape];
  }
}

- (void)_updateShape
{
  if (![(NTKAtiumFaceView *)self editing])
  {
    id v3 = [(NTKAtiumFaceView *)self complicationContainerView];
    id v4 = v3;
    double v5 = 0.0;
    if (!self->_shape) {
      double v5 = 1.0;
    }
    [v3 setAlpha:v5];
  }
  unint64_t shape = self->_shape;
  if (shape == 1)
  {
    float dialDiameter = self->_dialDiameter + self->_dialDiameter;
  }
  else
  {
    if (shape) {
      return;
    }
    float dialDiameter = self->_dialDiameter;
  }
  double v8 = (float)(dialDiameter * self->_dialDiameterScale);
  compositeQuad = self->_compositeQuad;

  [(NTKAtiumQuad *)compositeQuad setDialSize:v8];
}

- (void)_applyTransitionFraction:(double)a3 fromShape:(unint64_t)a4 toShape:(unint64_t)a5
{
  double v6 = 0.0;
  if (!a4)
  {
    double v6 = 1.0;
    a3 = 1.0 - a3;
  }
  if (a4 == a5) {
    double v7 = v6;
  }
  else {
    double v7 = a3;
  }
  [(NTKAtiumQuad *)self->_compositeQuad setDialSize:self->_dialDiameter * 2.0 - v7 * self->_dialDiameter];
  id v8 = [(NTKAtiumFaceView *)self complicationContainerView];
  [v8 setAlpha:v7 * NTKEditModeDimmedAlpha];
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (void)atiumQuadDidUpdateAnimatingOverrideDate:(id)a3
{
  if ([a3 isAnimatingOverrideDate]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 30;
  }
  quadView = self->_quadView;

  [(CLKUIMetalQuadView *)quadView setPreferredFramesPerSecond:v4];
}

- (id)_snapshotWithPigment:(id)a3 analogDialShape:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  double y = CGPointZero.y;
  id v12 = a3;
  long long v13 = +[CLKUIQuadView quadViewWithFrame:@"Atm", CGPointZero.x, y, width, height identifier];
  CGAffineTransform v14 = [[NTKAtiumQuad alloc] initWithDevice:self->_device];
  [(NTKAtiumQuad *)v14 setOpaque:1];
  CGAffineTransform v15 = [(NTKAtiumFaceView *)self faceColorPalette];
  [v15 setPigmentEditOption:v12];

  [(NTKAtiumFaceView *)self _updateQuadColorsWithPalette:v15 forQuad:v14];
  [(NTKAtiumQuad *)v14 setShadowStrength:0.0];
  if (a4 == 1)
  {
    float dialDiameter = self->_dialDiameter + self->_dialDiameter;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    float dialDiameter = self->_dialDiameter;
  }
  [(NTKAtiumQuad *)v14 setDialSize:dialDiameter];
LABEL_6:
  [v13 addQuad:v14];
  objc_super v17 = objc_msgSend(v13, "snapshotInRect:scale:time:", CGPointZero.x, y, width, height, a6, 0.0);
  id v18 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGPointZero.x, y, width, height);
  [v18 setImage:v17];
  id v19 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  v20 = [(NTKAtiumFaceView *)self device];
  id v21 = objc_msgSend(v19, "initWithFrame:forDeviceCornerRadius:", v20, CGPointZero.x, y, width, height);

  [v18 addSubview:v21];
  v26.double width = width;
  v26.double height = height;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  v22 = [v18 layer];
  [v22 renderInContext:UIGraphicsGetCurrentContext()];

  v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v23;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_CAD8;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 15)
  {
    if (!qword_12210)
    {
      uint64_t v10 = objc_opt_new();
      long long v11 = (void *)qword_12210;
      qword_12210 = v10;
    }
    id v12 = [v9 objectForKeyedSubscript:&off_CB68];
    long long v13 = [v9 objectForKeyedSubscript:&off_CB50];
    id v14 = v8;

    CGAffineTransform v15 = +[NSString stringWithFormat:@"%@-%@", v14, v13];
    v16 = [(id)qword_12210 objectForKey:v15];
    if (!v16)
    {
      objc_super v17 = [(id)objc_opt_class() pigmentFromOption:v13];
      id v18 = [v14 dialShape];
      [(NTKAtiumFaceView *)self frame];
      double v20 = v19;
      double v22 = v21;
      [(CLKDevice *)self->_device screenScale];
      v16 = -[NTKAtiumFaceView _snapshotWithPigment:analogDialShape:size:scale:](self, "_snapshotWithPigment:analogDialShape:size:scale:", v17, v18, v20, v22, v23);

      [(id)qword_12210 setObject:v16 forKey:v15];
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)NTKAtiumFaceView;
    v16 = [(NTKAtiumFaceView *)&v25 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
  }

  return v16;
}

- (CLKUIQuadView)quadView
{
  return self->_quadView;
}

- (NTKAtiumQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_compositeQuad, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

@end