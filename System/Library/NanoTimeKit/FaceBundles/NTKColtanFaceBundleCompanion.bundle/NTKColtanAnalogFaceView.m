@interface NTKColtanAnalogFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_shouldApplyBreathingForEditMode:(int64_t)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKColtanAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_circularMaskDiameterForShape:(unint64_t)a3 withBounds:(CGRect)a4;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_tickOpacityForDensity:(unint64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_keylineViewForComplicationSlot:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_snapshotWithPigment:(id)a3 density:(unint64_t)a4 analogDialShape:(unint64_t)a5 size:(CGSize)a6 scale:(double)a7;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)palette;
- (int64_t)_editMode;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyComplicationAlphaTransitionFraction:(double)a3 fromAlpha:(double)a4 toAlpha:(double)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowsCanonicalContent;
- (void)_applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromShape:(unint64_t)a4 toShape:(unint64_t)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_loadActiveViews;
- (void)_loadCommonViews;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setDensity:(unint64_t)a3;
- (void)_setMasking:(BOOL)a3;
- (void)_setShape:(unint64_t)a3;
- (void)_setTickOpacity:(double)a3;
- (void)_setupCircularMaskForShapeTransitionWithFraction:(double)a3;
- (void)_unloadActiveViews;
- (void)_unloadCommonViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateFramerate;
- (void)_updateMasking;
- (void)_updateShape;
- (void)setDataMode:(int64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)updateColorsWithPalette:(id)a3;
@end

@implementation NTKColtanAnalogFaceView

- (NTKColtanAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKColtanAnalogFaceView;
  v9 = [(NTKColtanAnalogFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = (NTKWhistlerAnalogFaceViewComplicationFactory *)[objc_alloc((Class)NTKWhistlerAnalogFaceViewComplicationFactory) initForDevice:v8];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;

    [(NTKWhistlerAnalogFaceViewComplicationFactory *)v9->_faceViewComplicationFactory setUsesNarrowTopSlots:1];
  }

  return v9;
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKColtanAnalogFaceView *)self _loadCommonViews];
  [(NTKColtanAnalogFaceView *)self _loadActiveViews];
  [(NTKColtanAnalogFaceView *)self _updateShape];
  [(NTKColtanAnalogFaceView *)self _updateMasking];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKColtanAnalogFaceView *)self _unloadActiveViews];
  [(NTKColtanAnalogFaceView *)self _unloadCommonViews];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKColtanAnalogFaceView;
  id v6 = a4;
  [(NTKColtanAnalogFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_displayQuadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v3 _applyFrozen];
  [(NTKColtanAnalogFaceView *)self _updateFramerate];
}

- (void)setDataMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v4 setDataMode:a3];
  [(NTKColtanAnalogFaceView *)self _updateFramerate];
}

- (void)_applyShowsCanonicalContent
{
  v15.receiver = self;
  v15.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v15 _applyShowsCanonicalContent];
  if ([(NTKColtanAnalogFaceView *)self showsCanonicalContent])
  {
    objc_super v3 = [(NTKColtanDisplayQuad *)self->_displayActiveQuad quadView];
    [(NTKColtanAnalogFaceView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(NTKColtanAnalogFaceView *)self device];
    [v12 screenScale];
    id v14 = objc_msgSend(v3, "snapshotInRect:scale:time:", v5, v7, v9, v11, v13, 0.0);
  }
}

- (void)_updateFramerate
{
  if ([(NTKColtanAnalogFaceView *)self editing])
  {
    uint64_t v3 = (int *)[(NTKColtanAnalogFaceView *)self _editMode] == &dword_C;
  }
  else
  {
    unint64_t v4 = (unint64_t)[(NTKColtanAnalogFaceView *)self dataMode];
    unsigned __int8 v5 = [(NTKColtanAnalogFaceView *)self isFrozen];
    BOOL v7 = v4 != 3 && (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    uint64_t v3 = (v5 & 1) != 0 || v7;
  }
  displayQuadView = self->_displayQuadView;

  [(CLKUIQuadView *)displayQuadView setPaused:v3];
}

- (int64_t)_editMode
{
  [(NTKColtanAnalogFaceView *)self editModeTransitionFraction];
  if (v3 <= 0.5)
  {
    return (int64_t)[(NTKColtanAnalogFaceView *)self fromEditMode];
  }
  else
  {
    return (int64_t)[(NTKColtanAnalogFaceView *)self toEditMode];
  }
}

- (BOOL)_wantsStatusBarIconShadow
{
  return self->_shape == 1;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKColtanAnalogFaceView;
  id v6 = a3;
  [(NTKColtanAnalogFaceView *)&v7 setOverrideDate:v6 duration:a4];
  -[NTKColtanDisplayQuad setOverrideDate:duration:](self->_displayActiveQuad, "setOverrideDate:duration:", v6, a4, v7.receiver, v7.super_class);
}

- (void)_loadLayoutRules
{
  double v3 = [(NTKColtanAnalogFaceView *)self device];
  sub_82CC(v3);
  double v5 = v4;

  faceViewComplicationFactory = self->_faceViewComplicationFactory;

  [(NTKWhistlerAnalogFaceViewComplicationFactory *)faceViewComplicationFactory loadLayoutRulesForFaceView:self dialDiameter:v5];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory configureComplicationView:v6 forSlot:a4 faceView:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 updateMonochromeColor];
  }
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKColtanAnalogFaceView *)self device];
  double v3 = sub_82CC(v2);

  return v3;
}

- (id)_keylineViewForComplicationSlot:(id)a3
{
  return [(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineViewForComplicationSlot:a3];
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return (int64_t)[(NTKWhistlerAnalogFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 12;
}

- (void)_configureForEditMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKColtanAnalogFaceView;
  [(NTKColtanAnalogFaceView *)&v4 _configureForEditMode:a3];
  [(NTKColtanAnalogFaceView *)self _updateFramerate];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKColtanAnalogFaceView;
  -[NTKColtanAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v12, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  [(NTKColtanAnalogFaceView *)self _complicationAlphaForEditMode:a4];
  double v10 = v9;
  [(NTKColtanAnalogFaceView *)self _complicationAlphaForEditMode:a5];
  [(NTKColtanAnalogFaceView *)self _applyComplicationAlphaTransitionFraction:a3 fromAlpha:v10 toAlpha:v11];
}

- (void)_applyComplicationAlphaTransitionFraction:(double)a3 fromAlpha:(double)a4 toAlpha:(double)a5
{
  id v5 = [(NTKColtanAnalogFaceView *)self complicationContainerView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v5, "setAlpha:");
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  if ((unint64_t)a3 > 1) {
    return NTKEditModeDimmedAlpha;
  }
  double result = 0.0;
  if (!self->_shape) {
    return 1.0;
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 10:
      double v9 = [(NTKColtanAnalogFaceView *)self palette];
      [(NTKColtanAnalogFaceView *)self updateColorsWithPalette:v9];

      break;
    case 11:
      -[NTKColtanAnalogFaceView _setDensity:](self, "_setDensity:", [v10 density]);
      break;
    case 12:
      -[NTKColtanAnalogFaceView _setShape:](self, "_setShape:", [v10 dialShape]);
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  id v13 = a7;
  switch(a6)
  {
    case 10:
      id v14 = [(NTKColtanAnalogFaceView *)self interpolatedColorPalette];
      [(NTKColtanAnalogFaceView *)self updateColorsWithPalette:v14];

      break;
    case 11:
      -[NTKColtanAnalogFaceView _applyTransitionFraction:fromDensity:toDensity:](self, "_applyTransitionFraction:fromDensity:toDensity:", [v15 density], objc_msgSend(v12, "density"), a3);
      break;
    case 12:
      -[NTKColtanAnalogFaceView _applyTransitionFraction:fromShape:toShape:](self, "_applyTransitionFraction:fromShape:toShape:", [v15 dialShape], objc_msgSend(v12, "dialShape"), a3);
      break;
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKColtanAnalogFaceView;
  -[NTKColtanAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if ([(NTKColtanAnalogFaceView *)self _shouldApplyBreathingForEditMode:a4])
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v7, v7);
    displayQuadView = self->_displayQuadView;
    CGAffineTransform v11 = v12;
    [(CLKUIQuadView *)displayQuadView setTransform:&v11];
    cornerView = self->_cornerView;
    CGAffineTransform v11 = v12;
    [(UIView *)cornerView setTransform:&v11];
    id v10 = [(NTKColtanAnalogFaceView *)self timeView];
    CGAffineTransform v11 = v12;
    [v10 setTransform:&v11];
  }
}

- (BOOL)_shouldApplyBreathingForEditMode:(int64_t)a3
{
  return (unint64_t)(a3 - 10) < 3;
}

- (void)_updateShape
{
  double v3 = [(NTKColtanAnalogFaceView *)self delegate];
  [v3 faceViewDidChangeWantsStatusBarIconShadow];

  unint64_t shape = self->_shape;
  if (([(NTKColtanAnalogFaceView *)self editing] & 1) == 0)
  {
    id v5 = [(NTKColtanAnalogFaceView *)self complicationContainerView];
    id v6 = v5;
    double v7 = 0.0;
    if (!shape) {
      double v7 = 1.0;
    }
    [v5 setAlpha:v7];
  }
  if (shape)
  {
    if (shape != 1) {
      return;
    }
    double v8 = 0.0;
  }
  else
  {
    double v8 = 1.0;
  }

  [(NTKColtanAnalogFaceView *)self _setupCircularMaskForShapeTransitionWithFraction:v8];
}

- (void)_setShape:(unint64_t)a3
{
  if (self->_shape != a3)
  {
    self->_unint64_t shape = a3;
    [(NTKColtanAnalogFaceView *)self _updateShape];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromShape:(unint64_t)a4 toShape:(unint64_t)a5
{
  if (a4) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  double v10 = 1.0 - a3;
  if (a4) {
    double v10 = a3;
  }
  if (a4 == a5) {
    double v10 = v9;
  }
  [(NTKColtanAnalogFaceView *)self _setupCircularMaskForShapeTransitionWithFraction:v10];
  if ([(NTKColtanAnalogFaceView *)self editing]) {
    uint64_t v11 = 12;
  }
  else {
    uint64_t v11 = 0;
  }
  [(NTKColtanAnalogFaceView *)self _complicationAlphaForEditMode:v11];
  if (a4 == 1) {
    double v13 = 0.0;
  }
  else {
    double v13 = v12;
  }
  if (a5 == 1) {
    double v14 = 0.0;
  }
  else {
    double v14 = v12;
  }

  [(NTKColtanAnalogFaceView *)self _applyComplicationAlphaTransitionFraction:a3 fromAlpha:v13 toAlpha:v14];
}

- (void)_updateMasking
{
  uint64_t v3 = *((unsigned char *)self + 56) & 1;
  BOOL v4 = (*((unsigned char *)self + 56) & 1) == 0;
  [(NTKColtanDisplayQuad *)self->_displayActiveQuad setMasking:v3];
  [(NTKColtanDisplayQuad *)self->_displayInactiveQuad setMasking:v3];
  displayQuadView = self->_displayQuadView;

  [(CLKUIQuadView *)displayQuadView setOpaque:v4];
}

- (void)_setMasking:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 56);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 56) = v3 & 0xFE | a3;
    [(NTKColtanAnalogFaceView *)self _updateMasking];
  }
}

- (double)_circularMaskDiameterForShape:(unint64_t)a3 withBounds:(CGRect)a4
{
  double width = a4.size.width;
  id v6 = [(NTKColtanAnalogFaceView *)self device];
  sub_82CC(v6);
  if (a3 == 1) {
    double v8 = v7 + v7;
  }
  else {
    double v8 = v7;
  }
  [v6 screenBounds];
  double v10 = v8 * (width / v9);

  return v10;
}

- (void)_setupCircularMaskForShapeTransitionWithFraction:(double)a3
{
  id v11 = [(NTKColtanAnalogFaceView *)self device];
  [v11 screenBounds];
  -[NTKColtanAnalogFaceView _circularMaskDiameterForShape:withBounds:](self, "_circularMaskDiameterForShape:withBounds:", 0);
  double v6 = v5;
  if (([(NTKColtanAnalogFaceView *)self editing] & 1) == 0)
  {
    if (a3 >= 1.0)
    {
      [v11 screenScale];
      double v8 = v6 * 0.5 * v7;
      float v9 = v8;
      *(float *)&double v8 = v9;
      [(NTKColtanDisplayQuad *)self->_displayActiveQuad setMaskRadius:v8];
      *(float *)&double v10 = v9;
      [(NTKColtanDisplayQuad *)self->_displayInactiveQuad setMaskRadius:v10];
    }
    [(NTKColtanAnalogFaceView *)self _setMasking:a3 >= 1.0];
  }
}

- (id)createFaceColorPalette
{
  v2 = [[NTKColtanColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)palette
{
  return [(NTKColtanAnalogFaceView *)self faceColorPalette];
}

- (void)updateColorsWithPalette:(id)a3
{
  id v4 = a3;
  double v5 = [v4 primaryComplicationColor];
  [(NTKColtanAnalogFaceView *)self setComplicationColor:v5];

  double v6 = [v4 primaryComplicationColor];
  [(NTKColtanAnalogFaceView *)self setAlternateComplicationColor:v6];

  double v7 = [v4 secondaryComplicationColor];
  [(NTKColtanAnalogFaceView *)self setInterpolatedComplicationColor:v7];

  [(NTKColtanDisplayQuad *)self->_displayActiveQuad setPalette:v4];
  [(NTKColtanDisplayQuad *)self->_displayInactiveQuad setPalette:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8E1C;
  v8[3] = &unk_10448;
  v8[4] = self;
  [(NTKColtanAnalogFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v8];
}

- (void)_setDensity:(unint64_t)a3
{
  [(NTKColtanAnalogFaceView *)self _tickOpacityForDensity:a3];

  -[NTKColtanAnalogFaceView _setTickOpacity:](self, "_setTickOpacity:");
}

- (void)_applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5
{
  [(NTKColtanAnalogFaceView *)self _tickOpacityForDensity:a4];
  [(NTKColtanAnalogFaceView *)self _tickOpacityForDensity:a5];
  CLKInterpolateBetweenFloatsClipped();

  -[NTKColtanAnalogFaceView _setTickOpacity:](self, "_setTickOpacity:");
}

- (double)_tickOpacityForDensity:(unint64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    return 1.0;
  }
  return result;
}

- (void)_setTickOpacity:(double)a3
{
  double v3 = a3;
  BOOL v5 = a3 > 0.0;
  [(NTKColtanDisplayQuad *)self->_displayActiveQuad setDensity:v5];
  [(NTKColtanDisplayQuad *)self->_displayInactiveQuad setDensity:v5];
  *(float *)&double v3 = v3;
  LODWORD(v6) = LODWORD(v3);
  [(NTKColtanDisplayQuad *)self->_displayActiveQuad setTickOpacity:v6];
  LODWORD(v7) = LODWORD(v3);
  [(NTKColtanDisplayQuad *)self->_displayInactiveQuad setTickOpacity:v7];
  id v19 = [(NTKColtanAnalogFaceView *)self device];
  displayQuadView = self->_displayQuadView;
  [v19 screenBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v19 screenScale];
  id v18 = -[CLKUIQuadView snapshotInRect:scale:time:](displayQuadView, "snapshotInRect:scale:time:", v10, v12, v14, v16, v17, 0.0);
}

- (id)_snapshotWithPigment:(id)a3 density:(unint64_t)a4 analogDialShape:(unint64_t)a5 size:(CGSize)a6 scale:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = CGPointZero.y;
  id v14 = a3;
  double v15 = +[CLKUIQuadView quadViewWithFrame:@"Colt", CGPointZero.x, y, width, height identifier];
  double v16 = [[NTKColtanDisplayQuad alloc] initWithRole:0 screenScale:a7];
  [(NTKColtanDisplayQuad *)v16 setOpaque:1];
  [(NTKColtanDisplayQuad *)v16 setDensity:a4];
  [(NTKColtanAnalogFaceView *)self _tickOpacityForDensity:a4];
  *(float *)&double v17 = v17;
  [(NTKColtanDisplayQuad *)v16 setTickOpacity:v17];
  id v18 = [(NTKColtanAnalogFaceView *)self createFaceColorPalette];
  [v18 setPigmentEditOption:v14];

  [(NTKColtanDisplayQuad *)v16 setPalette:v18];
  id v19 = NTKIdealizedDate();
  [(NTKColtanDisplayQuad *)v16 setOverrideDate:v19 duration:0.0];

  if (!a5)
  {
    -[NTKColtanAnalogFaceView _circularMaskDiameterForShape:withBounds:](self, "_circularMaskDiameterForShape:withBounds:", 0, CGPointZero.x, y, width, height);
    double v21 = v20 * 0.5 * a7;
    *(float *)&double v21 = v21;
    [(NTKColtanDisplayQuad *)v16 setMaskRadius:v21];
    [(NTKColtanDisplayQuad *)v16 setMasking:1];
  }
  [v15 addQuad:v16];
  v22 = objc_msgSend(v15, "snapshotInRect:scale:time:", CGPointZero.x, y, width, height, a7, 0.0);
  id v23 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGPointZero.x, y, width, height);
  [v23 setImage:v22];
  id v24 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  v25 = [(NTKColtanAnalogFaceView *)self device];
  id v26 = objc_msgSend(v24, "initWithFrame:forDeviceCornerRadius:", v25, CGPointZero.x, y, width, height);

  [v23 addSubview:v26];
  v31.double width = width;
  v31.double height = height;
  UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
  v27 = [v23 layer];
  [v27 renderInContext:UIGraphicsGetCurrentContext()];

  v28 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v28;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &off_10B68;
  if (a3 != 12) {
    id v4 = 0;
  }
  if (a3 == 11) {
    return &off_10B50;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)(a4 - 11) > 1)
  {
    v29.receiver = self;
    v29.super_class = (Class)NTKColtanAnalogFaceView;
    double v16 = [(NTKColtanAnalogFaceView *)&v29 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
    goto LABEL_13;
  }
  if (!qword_16E58)
  {
    uint64_t v10 = objc_opt_new();
    double v11 = (void *)qword_16E58;
    qword_16E58 = v10;
  }
  double v12 = [v9 objectForKeyedSubscript:&off_10A68];
  double v13 = [v9 objectForKeyedSubscript:&off_10A38];
  id v14 = [v9 objectForKeyedSubscript:&off_10A50];
  if (a4 == 11)
  {
    double v15 = v12;
    double v12 = v8;
    goto LABEL_9;
  }
  if (a4 == 12)
  {
    double v15 = v13;
    double v13 = v8;
LABEL_9:
    id v17 = v8;
  }
  id v18 = +[NSString stringWithFormat:@"%@-%@-%@", v12, v13, v14];
  double v16 = [(id)qword_16E58 objectForKey:v18];
  if (!v16)
  {
    v28 = [(id)objc_opt_class() pigmentFromOption:v14];
    id v19 = [v12 density];
    id v20 = [v13 dialShape];
    [(NTKColtanAnalogFaceView *)self frame];
    double v22 = v21;
    double v24 = v23;
    v25 = +[UIScreen mainScreen];
    [v25 nativeScale];
    double v16 = -[NTKColtanAnalogFaceView _snapshotWithPigment:density:analogDialShape:size:scale:](self, "_snapshotWithPigment:density:analogDialShape:size:scale:", v28, v19, v20, v22, v24, v26);

    [(id)qword_16E58 setObject:v16 forKey:v18];
  }

LABEL_13:

  return v16;
}

- (void)_loadCommonViews
{
  id v21 = [(NTKColtanAnalogFaceView *)self timeView];
  double v3 = [v21 secondHandView];
  [v3 setHidden:1];

  [v21 setHidden:1];
  [(NTKColtanAnalogFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  +[CLKUIQuadView quadViewWithFrame:identifier:](CLKUIQuadView, "quadViewWithFrame:identifier:", @"Colt");
  double v12 = (CLKUIQuadView *)objc_claimAutoreleasedReturnValue();
  displayQuadView = self->_displayQuadView;
  self->_displayQuadView = v12;

  id v14 = [(NTKColtanAnalogFaceView *)self contentView];
  id v15 = objc_alloc((Class)NTKRoundedCornerOverlayView);
  double v16 = [(NTKColtanAnalogFaceView *)self device];
  id v17 = (UIView *)objc_msgSend(v15, "initWithFrame:forDeviceCornerRadius:", v16, v5, v7, v9, v11);
  cornerView = self->_cornerView;
  self->_cornerView = v17;

  [v14 addSubview:self->_cornerView];
  [v14 addSubview:self->_displayQuadView];
  [v14 bringSubviewToFront:self->_displayQuadView];
  [v14 bringSubviewToFront:self->_cornerView];
  [v14 setUserInteractionEnabled:0];
  id v19 = [(NTKColtanAnalogFaceView *)self rootContainerView];
  [v19 bringSubviewToFront:v14];
  id v20 = [(NTKColtanAnalogFaceView *)self complicationContainerView];
  [v19 bringSubviewToFront:v20];
}

- (void)_unloadCommonViews
{
  [(CLKUIQuadView *)self->_displayQuadView removeFromSuperview];
  displayQuadView = self->_displayQuadView;
  self->_displayQuadView = 0;

  [(UIView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_loadActiveViews
{
  double v3 = [NTKColtanDisplayQuad alloc];
  double v4 = [(NTKColtanAnalogFaceView *)self device];
  [v4 screenScale];
  double v5 = -[NTKColtanDisplayQuad initWithRole:screenScale:](v3, "initWithRole:screenScale:", 0);
  displayActiveQuad = self->_displayActiveQuad;
  self->_displayActiveQuad = v5;

  [(NTKColtanDisplayQuad *)self->_displayActiveQuad setOpaque:0];
  [(CLKUIQuadView *)self->_displayQuadView addQuad:self->_displayActiveQuad];
  displayQuadView = self->_displayQuadView;

  [(CLKUIQuadView *)displayQuadView setDelegate:self];
}

- (void)_unloadActiveViews
{
  [(CLKUIQuadView *)self->_displayQuadView setDelegate:0];
  [(CLKUIQuadView *)self->_displayQuadView removeQuad:self->_displayActiveQuad];
  displayActiveQuad = self->_displayActiveQuad;
  self->_displayActiveQuad = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedColorPalette, 0);
  objc_storeStrong((id *)&self->_faceColorPalette, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_displayQuadView, 0);
  objc_storeStrong((id *)&self->_displayInactiveQuad, 0);
  objc_storeStrong((id *)&self->_displayActiveQuad, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end