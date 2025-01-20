@interface NTKFoghornFaceView
+ (BOOL)_isMiddleComplicationSlot:(id)a3;
+ (BOOL)_isSixpackComplicationSlot:(id)a3;
+ (id)_sixpackComplicationNames;
+ (id)_snapshotImageForLayoutStyle:(id)a3 bezelStyle:(id)a4 colorPalette:(id)a5 withSelectedOptions:(id)a6 forDevice:(id)a7;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (void)_applyComplicationsLayoutForDevice:(id)a3 size:(CGSize)a4 circularScale:(double)a5 circularShift:(double)a6 fromTopBottomMargin:(double)a7 fromInterSixpackSpacing:(double)a8 block:(id)a9;
+ (void)_applyComplicationsLayoutForDevice:(id)a3 size:(CGSize)a4 fromBezelStyle:(int64_t)a5 toBezelStyle:(int64_t)a6 progress:(double)a7 block:(id)a8;
+ (void)_drawComplicationsSnapshotInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 layoutStyle:(unint64_t)a5 forDevice:(id)a6;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_nightModeActive;
- (BOOL)_nightModeActiveFor:(unint64_t)a3;
- (BOOL)_statusIndicatorNeedsOffsetForBezel;
- (CGAffineTransform)_transformForBreathingFraction:(SEL)a3;
- (CGAffineTransform)_transformForRubberBandingFraction:(SEL)a3;
- (NTKFoghornFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_alphaForComplicationSlot:(id)a3 inEditOption:(id)a4 ofEditMode:(int64_t)a5;
- (double)_horizontalPaddingForStatusBar;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_complicationSlotsHiddenByCurrentConfiguration;
- (id)_filterProviderForSlot:(id)a3;
- (id)_multiPalette;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_nightModeInterpolator;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)overrideColorForStatusBar;
- (int64_t)_currentBezelStyle;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)_currentLayoutStyle;
- (unint64_t)_currentNightModePolicy;
- (unint64_t)_effectiveNightModeForEditMode:(int64_t)a3;
- (unint64_t)nightMode;
- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5;
- (void)_applyComplicationFont:(id)a3;
- (void)_applyComplicationLayoutRuleForDevice:(id)a3 frame:(CGRect)a4 transform:(CGAffineTransform *)a5 slot:(id)a6 states:(id)a7;
- (void)_applyComplicationsAlphaForLayoutStyle:(unint64_t)a3 editMode:(int64_t)a4;
- (void)_applyComplicationsAlphaForTransitionFraction:(double)a3 fromLayoutStyle:(unint64_t)a4 toLayoutStyle:(unint64_t)a5 editMode:(int64_t)a6;
- (void)_applyComplicationsLayoutCircularScale:(double)a3 circularShift:(double)a4 fromTopBottomMargin:(double)a5 fromInterSixpackSpacing:(double)a6 states:(id)a7;
- (void)_applyComplicationsLayoutForComplicationsEditing;
- (void)_applyComplicationsLayoutFromBezelStyle:(int64_t)a3 toBezelStyle:(int64_t)a4 progress:(double)a5;
- (void)_applyDataMode;
- (void)_applyMultiPaletteFractions;
- (void)_applyNightModeFraction:(double)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPaletteBezelStyle:(int64_t)a3 updateColorsIfNeeded:(BOOL)a4;
- (void)_applyPaletteFromBezelStyle:(int64_t)a3 toBezelStyle:(int64_t)a4 progress:(double)a5 updateColorsIfNeeded:(BOOL)a6;
- (void)_applyPaletteToComplications:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromNightMode:(unint64_t)a4 toNightMode:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_checkTransforms;
- (void)_checkTransformsForView:(id)a3;
- (void)_cleanupAfterEditing;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureShowingStatusIndicator;
- (void)_fixLayoutStyle;
- (void)_fixTransforms;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareComplicationsForSnapshotting;
- (void)_prepareForEditing;
- (void)_prepareForSnapshotting;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_reorderSwitcherSnapshotView;
- (void)_setLive:(int64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateFromPreferences;
- (void)_updateStatusBarColorForNightModeFraction:(double)a3;
- (void)_updateViewColorsWithMultiPalette;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)dealloc;
- (void)setDataMode:(int64_t)a3;
- (void)setNightMode:(unint64_t)a3;
@end

@implementation NTKFoghornFaceView

- (NTKFoghornFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKFoghornFaceView;
  v9 = [(NTKFoghornFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v12 = v9;
  if (v9)
  {
    objc_msgSend_setComplicationFactory_(v9, v10, 0, v11);
    id v13 = objc_alloc(MEMORY[0x263F57A20]);
    uint64_t v16 = objc_msgSend_initWithDevice_(v13, v14, (uint64_t)v8, v15);
    complicationsFilterProvider = v12->_complicationsFilterProvider;
    v12->_complicationsFilterProvider = (NTKMonochromeModel *)v16;

    v12->_statusIndicatorPolicy = objc_msgSend_statusIndicatorMove(NTKFoghornPreferences, v18, v19, v20) ^ 1;
  }

  return v12;
}

- (void)dealloc
{
  objc_msgSend__setLive_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v4 dealloc];
}

- (void)setDataMode:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKFoghornFaceView;
  id v5 = [(NTKFoghornFaceView *)&v14 dataMode];
  id v9 = v5;
  if (a3 == 1 && v5 == (id)3) {
    objc_msgSend__updateAveragePixelLuminance(self, v6, v7, v8);
  }
  v13.receiver = self;
  v13.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v13 setDataMode:a3];
  if (a3 == 1 && v9 != (id)1) {
    objc_msgSend__refreshBezelFromDataSource(self, v10, v11, v12);
  }
}

- (void)_applyDataMode
{
  v9.receiver = self;
  v9.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v9 _applyDataMode];
  uint64_t v6 = objc_msgSend_dataMode(self, v3, v4, v5);
  objc_msgSend__setLive_(self, v7, v6, v8);
}

- (void)_loadSnapshotContentViews
{
  v72.receiver = self;
  v72.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v72 _loadSnapshotContentViews];
  v3 = [NTKFoghornFaceBezelView alloc];
  objc_msgSend_bounds(self, v4, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v18 = objc_msgSend_device(self, v15, v16, v17);
  v21 = (NTKFoghornFaceBezelView *)objc_msgSend_initWithFrame_forDevice_(v3, v19, (uint64_t)v18, v20, v8, v10, v12, v14);
  bezelView = self->_bezelView;
  self->_bezelView = v21;

  v26 = objc_msgSend_contentView(self, v23, v24, v25);
  objc_msgSend_addSubview_(v26, v27, (uint64_t)self->_bezelView, v28);

  v29 = [NTKFoghornTimeView alloc];
  objc_msgSend_bounds(self, v30, v31, v32);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v44 = objc_msgSend_device(self, v41, v42, v43);
  v47 = objc_msgSend_initWithFrame_forDevice_(v29, v45, (uint64_t)v44, v46, v34, v36, v38, v40);
  objc_msgSend_setTimeView_(self, v48, (uint64_t)v47, v49);

  v53 = objc_msgSend_timeView(self, v50, v51, v52);
  objc_msgSend_addSubview_(self, v54, (uint64_t)v53, v55);

  v59 = objc_msgSend_rootContainerView(self, v56, v57, v58);
  objc_msgSend_bringSubviewToFront_(self, v60, (uint64_t)v59, v61);

  v65 = objc_msgSend_rootContainerView(self, v62, v63, v64);
  v69 = objc_msgSend_complicationContainerView(self, v66, v67, v68);
  objc_msgSend_bringSubviewToFront_(v65, v70, (uint64_t)v69, v71);
}

- (void)_unloadSnapshotContentViews
{
  v18.receiver = self;
  v18.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v18 _unloadSnapshotContentViews];
  bezelView = self->_bezelView;
  if (bezelView)
  {
    objc_msgSend_removeFromSuperview(bezelView, v3, v4, v5);
    double v7 = self->_bezelView;
    self->_bezelView = 0;
  }
  double v8 = objc_msgSend_timeView(self, v3, v4, v5);

  if (v8)
  {
    double v12 = objc_msgSend_timeView(self, v9, v10, v11);
    objc_msgSend_removeFromSuperview(v12, v13, v14, v15);

    objc_msgSend_setTimeView_(self, v16, 0, v17);
  }
}

- (void)_prepareForEditing
{
  v6.receiver = self;
  v6.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v6 _prepareForEditing];
  objc_msgSend__updateFromPreferences(self, v3, v4, v5);
}

- (void)_checkTransformsForView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v7 = v3;
  CGSize v8 = (CGSize)0;
  memset(&v16[1], 0, sizeof(CGAffineTransformComponents));
  if (v3)
  {
    objc_msgSend_transform(v3, v4, v5, v6);
    CGSize v8 = (CGSize)0;
  }
  *(CGSize *)&v16[0].horizontalShear = v8;
  v16[0].translation = (CGVector)v8;
  v16[0].scale = v8;
  CGAffineTransform transform = (CGAffineTransform)v16[1];
  CGAffineTransformDecompose(v16, &transform);
  if (v16[0].scale.width != 1.0 || v16[0].scale.height != 1.0)
  {
    double v13 = objc_msgSend_logObject(NTKFoghornFaceBundle, v9, v10, v11, *(_OWORD *)&v16[0].scale);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      LODWORD(transform.a) = 138412802;
      *(void *)((char *)&transform.a + 4) = v14;
      WORD2(transform.b) = 2048;
      *(CGFloat *)((char *)&transform.b + 6) = v16[0].scale.width;
      HIWORD(transform.c) = 2048;
      transform.d = v16[0].scale.height;
      id v15 = v14;
      _os_log_error_impl(&dword_246AFF000, v13, OS_LOG_TYPE_ERROR, "%@.transform bad scale = %f, %f", (uint8_t *)&transform, 0x20u);
    }
  }
}

- (void)_checkTransforms
{
  objc_msgSend__checkTransformsForView_(self, a2, (uint64_t)self, v2);
  objc_msgSend__checkTransformsForView_(self, v4, (uint64_t)self->_bezelView, v5);
  objc_msgSend_timeView(self, v6, v7, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__checkTransformsForView_(self, v9, (uint64_t)v11, v10);
}

- (void)_fixTransforms
{
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v16 = *MEMORY[0x263F000D0];
  long long v14 = v16;
  long long v17 = v15;
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v13 = v18;
  objc_msgSend_setTransform_(self, a2, (uint64_t)&v16, v2);
  bezelView = self->_bezelView;
  long long v16 = v14;
  long long v17 = v15;
  long long v18 = v13;
  objc_msgSend_setTransform_(bezelView, v5, (uint64_t)&v16, v6);
  uint64_t v10 = objc_msgSend_timeView(self, v7, v8, v9);
  long long v16 = v14;
  long long v17 = v15;
  long long v18 = v13;
  objc_msgSend_setTransform_(v10, v11, (uint64_t)&v16, v12);
}

- (void)_fixLayoutStyle
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__currentLayoutStyle(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_timeView(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_layoutStyle(v9, v10, v11, v12);
  if (v13 != v5)
  {
    uint64_t v17 = v13;
    long long v18 = objc_msgSend_logObject(NTKFoghornFaceBundle, v14, v15, v16);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = NTKFoghornFaceLayoutStyleString(v17);
      uint64_t v20 = NTKFoghornFaceLayoutStyleString(v5);
      int v22 = 136315650;
      v23 = "-[NTKFoghornFaceView _fixLayoutStyle]";
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_246AFF000, v18, OS_LOG_TYPE_DEFAULT, "%s: force resetting STYLE from %@ to %@", (uint8_t *)&v22, 0x20u);
    }
  }
  objc_msgSend_setLayoutStyle_(v9, v14, v5, v16);
  objc_msgSend__applyComplicationsAlphaForLayoutStyle_editMode_(self, v21, v5, 0);
}

- (void)_cleanupAfterEditing
{
  v12.receiver = self;
  v12.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v12 _cleanupAfterEditing];
  objc_msgSend__checkTransforms(self, v3, v4, v5);
  objc_msgSend__fixTransforms(self, v6, v7, v8);
  objc_msgSend__fixLayoutStyle(self, v9, v10, v11);
}

- (unint64_t)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(unint64_t)a3
{
  self->_nightMode = a3;
  double v3 = 0.0;
  if (a3 == 1) {
    double v3 = 1.0;
  }
  self->_nightModeFraction = v3;
  ((void (*)(NTKFoghornFaceView *, char *, unint64_t))MEMORY[0x270F9A6D0])(self, sel__applyMultiPaletteFractions, a3);
}

- (BOOL)_nightModeActiveFor:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)_nightModeActive
{
  return objc_msgSend__nightModeActiveFor_(self, a2, self->_nightMode, v2);
}

- (id)_nightModeInterpolator
{
  return &unk_26FB0CB08;
}

- (void)_applyNightModeFraction:(double)a3
{
  if (self->_nightModeFraction != a3)
  {
    self->_nightModeFraction = a3;
    if (a3 == 0.0 || a3 == 1.0) {
      objc_msgSend__updateAveragePixelLuminance(self, a2, v3, v4);
    }
    MEMORY[0x270F9A6D0](self, sel__applyMultiPaletteFractions, v3, v4);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromNightMode:(unint64_t)a4 toNightMode:(unint64_t)a5
{
  if (a4 != 2 && a5 != 2)
  {
    objc_msgSend__nightModeActiveFor_(self, a2, a4, a5);
    objc_msgSend__nightModeActiveFor_(self, v7, a5, v8);
    MEMORY[0x270F9A6D0](self, sel__applyNightModeFraction_, v9, v10);
  }
}

- (void)_updateStatusBarColorForNightModeFraction:(double)a3
{
  if (a3 <= 0.5)
  {
    double v21 = fabs(a3);
    if (v21 >= 0.00000011920929)
    {
      v23 = objc_msgSend_blackColor(MEMORY[0x263F825C8], a2, v3, v4);
      objc_msgSend_colorWithAlphaComponent_(v23, v24, v25, v26, a3 + a3);
      v27 = (UIColor *)objc_claimAutoreleasedReturnValue();
      statusBarOverrideColor = self->_statusBarOverrideColor;
      self->_statusBarOverrideColor = v27;
    }
    else
    {
      int v22 = self->_statusBarOverrideColor;
      self->_statusBarOverrideColor = 0;
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend_foghornFaceColorPalette(self, a2, v3, v4);
    uint64_t v11 = objc_msgSend_nightModeStatusBarColor(v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v12, v13, v14);
    MEMORY[0x24C541D90](v15, v11, a3 + -0.5 + a3 + -0.5);
    uint64_t v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self->_statusBarOverrideColor;
    self->_statusBarOverrideColor = v16;

    double v21 = fabs(a3);
  }
  v29 = objc_msgSend_delegate(self, v18, v19, v20);
  id v32 = v29;
  if (fabs(a3 + -1.0) < 0.00000011920929) {
    objc_msgSend_faceViewDidChangeStatusBarOverrideColor_(v29, v30, 1, v31);
  }
  else {
    objc_msgSend_faceViewDidChangeStatusBarOverrideColor_(v29, v30, v21 < 0.00000011920929, v31);
  }
}

- (id)overrideColorForStatusBar
{
  return self->_statusBarOverrideColor;
}

- (BOOL)_statusIndicatorNeedsOffsetForBezel
{
  uint64_t v5 = objc_msgSend_bezelStyle(self->_bezelView, a2, v2, v3);
  if (v5 == 1) {
    return self->_statusIndicatorPolicy == 0;
  }
  if (v5) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_timeView(self, v6, v7, v8);
  BOOL v13 = (unint64_t)objc_msgSend_layoutStyle(v9, v10, v11, v12) < 4;

  return v13;
}

- (double)_verticalPaddingForStatusBar
{
  if (objc_msgSend_bezelStyle(self->_bezelView, a2, v2, v3)
    && objc_msgSend__statusIndicatorNeedsOffsetForBezel(self, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_device(self, v8, v9, v10);
    long long v17 = 0u;
    long long v18 = 0u;
    memset(v16, 0, sizeof(v16));
    sub_246B17D6C(v11, v16);
    double v12 = *(double *)&v17 + *(double *)&v17 + *((double *)&v17 + 1);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFoghornFaceView;
    [(NTKFoghornFaceView *)&v15 _verticalPaddingForStatusBar];
    return v13;
  }
  return v12;
}

- (double)_horizontalPaddingForStatusBar
{
  if (objc_msgSend__statusIndicatorNeedsOffsetForBezel(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_device(self, v5, v6, v7);
    long long v21 = 0u;
    memset(v22, 0, sizeof(v22));
    memset(v20, 0, sizeof(v20));
    sub_246B17D6C(v8, v20);
    double v9 = MEMORY[0x24C541DD0](v8);
    uint64_t v13 = objc_msgSend_bezelStyle(self->_bezelView, v10, v11, v12);
    uint64_t v14 = (double *)&v21 + 1;
    objc_super v15 = (double *)v20 + 1;
    if (v13) {
      objc_super v15 = (double *)v20;
    }
    else {
      uint64_t v14 = (double *)v22;
    }
    double v16 = (v9 * *v15 + *v14) * 0.5;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NTKFoghornFaceView;
    [(NTKFoghornFaceView *)&v19 _horizontalPaddingForStatusBar];
    return v17;
  }
  return v16;
}

- (void)_configureShowingStatusIndicator
{
  if (self->_showingStatus) {
    uint64_t v5 = objc_msgSend__statusIndicatorNeedsOffsetForBezel(self, a2, v2, v3) ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  bezelView = self->_bezelView;

  objc_msgSend_setShowingStatusIndicator_(bezelView, a2, v5, v3);
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  if (self->_showingStatus != a3)
  {
    self->_showingStatus = a3;
    objc_msgSend__configureShowingStatusIndicator(self, a2, a3, v3);
  }
}

+ (id)_sixpackComplicationNames
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F57850];
  v7[0] = *MEMORY[0x263F57858];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x263F57830];
  v7[2] = *MEMORY[0x263F57860];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x263F57838];
  v7[4] = *MEMORY[0x263F57828];
  v7[5] = v4;
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 6);

  return v5;
}

+ (BOOL)_isSixpackComplicationSlot:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend__sixpackComplicationNames(a1, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

+ (BOOL)_isMiddleComplicationSlot:(id)a3
{
  return objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x263F57840], v3);
}

- (void)_applyComplicationsLayoutForComplicationsEditing
{
  objc_msgSend_device(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  memset(v8, 0, sizeof(v8));
  sub_246B17D6C(v7, v8);
  objc_msgSend__applyComplicationsLayoutCircularScale_circularShift_fromTopBottomMargin_fromInterSixpackSpacing_states_(self, v5, (uint64_t)&unk_26FB12078, v6, v12, *(double *)&v9, *(double *)&v10);
}

- (void)_applyComplicationLayoutRuleForDevice:(id)a3 frame:(CGRect)a4 transform:(CGAffineTransform *)a5 slot:(id)a6 states:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a6;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = a7;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v51, (uint64_t)v55, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v52;
    double v24 = *MEMORY[0x263F834E8];
    double v25 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v26 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v27 = *(double *)(MEMORY[0x263F834E8] + 24);
    uint64_t v46 = *MEMORY[0x263F57840];
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = objc_msgSend_integerValue(*(void **)(*((void *)&v51 + 1) + 8 * v28), v19, v20, v21, v46);
        v30 = objc_opt_class();
        if (objc_msgSend__isSixpackComplicationSlot_(v30, v31, (uint64_t)v16, v32))
        {
          long long v34 = *(_OWORD *)&a5->c;
          long long v48 = *(_OWORD *)&a5->a;
          long long v49 = v34;
          long long v50 = *(_OWORD *)&a5->tx;
          double v35 = objc_msgSend_layoutRuleForDevice_withReferenceFrame_horizontalLayout_verticalLayout_keylinePadding_clip_contentTransform_(MEMORY[0x263F57998], v33, (uint64_t)v15, 3, 3, 0, &v48, x, y, width, height, v24, v25, v26, v27);
          objc_msgSend_complicationLayoutforSlot_(self, v36, (uint64_t)v16, v37);
        }
        else
        {
          double v38 = objc_opt_class();
          if (!objc_msgSend__isMiddleComplicationSlot_(v38, v39, (uint64_t)v16, v40)) {
            goto LABEL_11;
          }
          long long v41 = *(_OWORD *)&a5->c;
          long long v48 = *(_OWORD *)&a5->a;
          long long v49 = v41;
          long long v50 = *(_OWORD *)&a5->tx;
          double v35 = objc_msgSend_layoutRuleForDevice_withReferenceFrame_horizontalLayout_verticalLayout_keylinePadding_clip_contentTransform_(MEMORY[0x263F57998], v19, (uint64_t)v15, 3, 3, 0, &v48, x, y, width, height, v24, v25, v26, v27);
          objc_msgSend_complicationLayoutforSlot_(self, v42, v46, v43);
        v44 = };
        objc_msgSend_setDefaultLayoutRule_forState_(v44, v45, (uint64_t)v35, v29);

LABEL_11:
        ++v28;
      }
      while (v22 != v28);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v51, (uint64_t)v55, 16);
    }
    while (v22);
  }
}

- (void)_applyComplicationsLayoutFromBezelStyle:(int64_t)a3 toBezelStyle:(int64_t)a4 progress:(double)a5
{
  long long v9 = objc_msgSend_device(self, a2, a3, a4);
  objc_msgSend_bounds(self, v10, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v17 = objc_opt_class();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_246B18540;
  _OWORD v20[3] = &unk_2651F6CF0;
  v20[4] = self;
  id v21 = v9;
  id v22 = &unk_26FB12090;
  id v18 = v9;
  objc_msgSend__applyComplicationsLayoutForDevice_size_fromBezelStyle_toBezelStyle_progress_block_(v17, v19, (uint64_t)v18, a3, a4, v20, v14, v16, a5);
}

+ (void)_applyComplicationsLayoutForDevice:(id)a3 size:(CGSize)a4 fromBezelStyle:(int64_t)a5 toBezelStyle:(int64_t)a6 progress:(double)a7 block:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v26 = a3;
  id v15 = a8;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  sub_246B17D6C(v26, v27);
  if (a5) {
    double v17 = *(double *)v27;
  }
  else {
    double v17 = *((double *)v27 + 1);
  }
  if (a5) {
    double v18 = *((double *)&v28 + 1);
  }
  else {
    double v18 = *(double *)&v29;
  }
  if (a5) {
    double v19 = *((double *)&v29 + 1);
  }
  else {
    double v19 = *(double *)&v30;
  }
  if (a6) {
    double v20 = *(double *)v27;
  }
  else {
    double v20 = *((double *)v27 + 1);
  }
  if (a6) {
    double v21 = *((double *)&v28 + 1);
  }
  else {
    double v21 = *(double *)&v29;
  }
  if (a6) {
    double v22 = *((double *)&v29 + 1);
  }
  else {
    double v22 = *(double *)&v30;
  }
  if (a5 != a6 && fabs(a7 + -1.0) >= 0.00000011920929)
  {
    if (fabs(a7) < 0.00000011920929)
    {
      objc_msgSend__applyComplicationsLayoutForDevice_size_circularScale_circularShift_fromTopBottomMargin_fromInterSixpackSpacing_block_(a1, v16, (uint64_t)v26, (uint64_t)v15, width, height, v17, 0.0, v18, v19);
      goto LABEL_25;
    }
    CLKInterpolateBetweenFloatsClipped();
    double v20 = v23;
    CLKInterpolateBetweenFloatsClipped();
    double v21 = v24;
    CLKInterpolateBetweenFloatsClipped();
    double v22 = v25;
  }
  objc_msgSend__applyComplicationsLayoutForDevice_size_circularScale_circularShift_fromTopBottomMargin_fromInterSixpackSpacing_block_(a1, v16, (uint64_t)v26, (uint64_t)v15, width, height, v20, 0.0, v21, v22);
LABEL_25:
}

- (void)_applyComplicationsLayoutCircularScale:(double)a3 circularShift:(double)a4 fromTopBottomMargin:(double)a5 fromInterSixpackSpacing:(double)a6 states:(id)a7
{
  id v12 = a7;
  double v16 = objc_msgSend_device(self, v13, v14, v15);
  objc_msgSend_bounds(self, v17, v18, v19);
  double v21 = v20;
  double v23 = v22;
  double v24 = objc_opt_class();
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_246B18830;
  v28[3] = &unk_2651F6CF0;
  v28[4] = self;
  id v29 = v16;
  id v30 = v12;
  id v25 = v12;
  id v26 = v16;
  objc_msgSend__applyComplicationsLayoutForDevice_size_circularScale_circularShift_fromTopBottomMargin_fromInterSixpackSpacing_block_(v24, v27, (uint64_t)v26, (uint64_t)v28, v21, v23, a3, a4, a5, a6);
}

+ (void)_applyComplicationsLayoutForDevice:(id)a3 size:(CGSize)a4 circularScale:(double)a5 circularShift:(double)a6 fromTopBottomMargin:(double)a7 fromInterSixpackSpacing:(double)a8 block:(id)a9
{
  double width = a4.width;
  id v13 = a3;
  uint64_t v14 = a9;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  sub_246B17D6C(v13, &v63);
  double v15 = *(double *)&v64;
  memset(&v62, 0, sizeof(v62));
  if (a5 == 1.0)
  {
    long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v62.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v62.c = v16;
    *(_OWORD *)&v62.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v62, a5, a5);
  }
  memset(&v61, 0, sizeof(v61));
  double v59 = v15;
  if (v15 == a5) {
    CGAffineTransform v61 = v62;
  }
  else {
    CGAffineTransformMakeScale(&v61, v15, v15);
  }
  double v17 = MEMORY[0x24C541DD0](v13);
  double v18 = MEMORY[0x24C541DC0](v13);
  double v57 = v19;
  double v58 = v18;
  double v20 = v17 * a5;
  double v56 = width * 0.5;
  CLKFloorForDevice();
  double v22 = v21;
  CLKCeilForDevice();
  double v24 = v23;
  CLKCeilForDevice();
  double v26 = v25;
  CLKRoundForDevice();
  double v28 = v27;
  CLKFloorForDevice();
  double v30 = v29;
  double v55 = *((double *)&v64 + 1);
  long long v31 = objc_opt_class();
  double v35 = objc_msgSend__sixpackComplicationNames(v31, v32, v33, v34);
  unint64_t v39 = objc_msgSend_count(v35, v36, v37, v38);

  if (v39)
  {
    unint64_t v40 = 0;
    unint64_t v41 = v39 >> 1;
    do
    {
      uint64_t v42 = objc_opt_class();
      uint64_t v46 = objc_msgSend__sixpackComplicationNames(v42, v43, v44, v45);
      long long v49 = objc_msgSend_objectAtIndexedSubscript_(v46, v47, v40, v48);

      if (v40 % v41 == (v39 >> 1) - 1) {
        double v50 = v24;
      }
      else {
        double v50 = v28;
      }
      if (!(v40 % v41)) {
        double v50 = v22;
      }
      if (v40 / v41 == 1) {
        double v51 = v26;
      }
      else {
        double v51 = v30;
      }
      long long v52 = (void (*)(void *, void *, CGAffineTransform *, double, double, double, double))v14[2];
      CGAffineTransform v60 = v62;
      v52(v14, v49, &v60, v50 + a6, v51 + a6, v20 + a6 * -2.0, v20 + a6 * -2.0);

      ++v40;
    }
    while (v40 != v39);
  }
  uint64_t v53 = *MEMORY[0x263F57840];
  long long v54 = (void (*)(void *, uint64_t, CGAffineTransform *, double, double, double, double))v14[2];
  CGAffineTransform v60 = v61;
  v54(v14, v53, &v60, v56 + v58 * -0.5, v55, v58, v59 * v57);
}

- (void)_loadLayoutRules
{
  uint64_t v5 = objc_msgSend_bezelStyle(self->_bezelView, a2, v2, v3);
  objc_msgSend__applyComplicationsLayoutFromBezelStyle_toBezelStyle_progress_(self, v6, v5, v5, 1.0);

  MEMORY[0x270F9A6D0](self, sel__applyComplicationsLayoutForComplicationsEditing, v7, v8);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  int isSixpackComplicationSlot = objc_msgSend__isSixpackComplicationSlot_(v8, v9, (uint64_t)v6, v10);

  double v15 = (void **)0x263F57A68;
  if (!isSixpackComplicationSlot) {
    double v15 = (void **)0x263F57A70;
  }
  long long v16 = *v15;
  uint64_t v17 = objc_msgSend_complicationType(v7, v12, v13, v14);

  objc_msgSend_viewWithLegacyComplicationType_(v16, v18, v17, v19);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)NTKFoghornFaceView;
  id v6 = a4;
  id v7 = a3;
  [(NTKFoghornFaceView *)&v15 _configureComplicationView:v7 forSlot:v6];
  objc_msgSend__applyComplicationFont_(self, v8, (uint64_t)v7, v9, v15.receiver, v15.super_class);
  uint64_t v13 = objc_msgSend__multiPalette(self, v10, v11, v12);
  objc_msgSend__applyComplicationColor_withPalette_slot_(self, v14, (uint64_t)v7, (uint64_t)v13, v6);
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend__isSixpackComplicationSlot_(v5, v6, (uint64_t)v4, v7))
  {
    int64_t v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKFoghornFaceView;
    int64_t v8 = [(NTKFoghornFaceView *)&v10 _keylineStyleForComplicationSlot:v4];
  }

  return v8;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x263F57840], v6))
  {
    objc_super v10 = (void *)MEMORY[0x263F57A18];
    uint64_t v11 = objc_msgSend_device(self, v7, v8, v9);
    objc_msgSend_cornerRadiusForComplicationFamily_forDevice_(v10, v12, 1, (uint64_t)v11);
    double v14 = v13;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKFoghornFaceView;
    [(NTKFoghornFaceView *)&v17 _keylineCornerRadiusForComplicationSlot:v4];
    double v14 = v15;
  }

  return v14;
}

- (id)_filterProviderForSlot:(id)a3
{
  return self->_complicationsFilterProvider;
}

- (void)_applyComplicationFont:(id)a3
{
  id v31 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_display(v31, v4, v5, v6);
    objc_msgSend__applyComplicationFont_(self, v8, (uint64_t)v7, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_setFontStyle_(v31, v10, 3, v11);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = (void *)MEMORY[0x263EFD198];
        id v13 = v31;
        objc_super v17 = objc_msgSend_font(v13, v14, v15, v16);
        objc_msgSend_pointSize(v17, v18, v19, v20);
        double v24 = objc_msgSend_foghornSimpleComplicationFontOfSize_(v12, v21, v22, v23);
        double v28 = objc_msgSend_CLKFontWithAlternativePunctuation(v24, v25, v26, v27);
        objc_msgSend_setFont_(v13, v29, (uint64_t)v28, v30);
      }
    }
  }
}

- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5
{
  id v86 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_display(v86, v10, v11, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__applyComplicationColor_withPalette_slot_(self, v14, (uint64_t)v13, (uint64_t)v8, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v18 = objc_msgSend_complicationAccentColor(v8, v15, v16, v17);
      objc_msgSend_setAccentColor_(self->_complicationsFilterProvider, v19, (uint64_t)v18, v20);

      double v24 = objc_msgSend_complicationNonAccentColor(v8, v21, v22, v23);
      objc_msgSend_setNonAccentColor_(self->_complicationsFilterProvider, v25, (uint64_t)v24, v26);

      id v13 = v86;
      if (objc_msgSend_conformsToProtocol_(v13, v27, (uint64_t)&unk_2732609F0, v28))
      {
        double nightModeFraction = self->_nightModeFraction;
        double v33 = fmin(nightModeFraction / 0.4, 1.0);
        double v34 = fmax(nightModeFraction + -0.4, 0.0) / 0.6;
        double v35 = (void *)MEMORY[0x263F825C8];
        id v36 = v13;
        unint64_t v40 = objc_msgSend_colorWithRed_green_blue_alpha_(v35, v37, v38, v39, 0.188235294, 0.0470588235, 0.0352941176, 1.0);
        uint64_t v44 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v41, v42, v43);
        uint64_t v45 = MEMORY[0x24C541D90](v44, v40, v34);

        objc_msgSend_setTintedFraction_(v36, v46, v47, v48, v33);
        objc_msgSend_setTintedPlatterColor_(v36, v49, (uint64_t)v45, v50);
      }
      double v51 = objc_msgSend_isNightModeF(v8, v29, v30, v31);
      objc_msgSend_floatValue(v51, v52, v53, v54);
      float v56 = v55;

      CGAffineTransform v60 = objc_msgSend_isMulticolorF(v8, v57, v58, v59);
      objc_msgSend_floatValue(v60, v61, v62, v63);
      double v65 = 1.0 - v64;

      double v69 = v56;
      if (v65 > v56) {
        double v69 = v65;
      }
      if (v69 == 1.0) {
        objc_msgSend_updateMonochromeColor(v13, v66, v67, v68);
      }
      else {
        objc_msgSend_transitionToMonochromeWithFraction_(v13, v66, v67, v68);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v70 = v86;
        objc_msgSend_simpleTextComplicationColor(v8, v71, v72, v73);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_label(v70, v74, v75, v76);

        objc_msgSend_setTextColor_(v77, v78, (uint64_t)v13, v79);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_16;
        }
        id v80 = v86;
        objc_msgSend_simpleTextComplicationColor(v8, v81, v82, v83);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTextColor_(v80, v84, (uint64_t)v13, v85);
      }
    }
  }

LABEL_16:
}

- (void)_applyPaletteToComplications:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B19320;
  _OWORD v8[3] = &unk_2651F6D18;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_enumerateComplicationDisplayWrappersWithBlock_(self, v6, (uint64_t)v8, v7);
}

- (void)_updateViewColorsWithMultiPalette
{
  objc_msgSend__multiPalette(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateViewColorsWithPalette_(self, v5, (uint64_t)v7, v6);
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  id v4 = a3;
  objc_msgSend__applyPaletteToComplications_(self, v5, (uint64_t)v4, v6);
  objc_msgSend_begin(MEMORY[0x263F158F8], v7, v8, v9);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v10, 1, v11);
  objc_msgSend_timeView(self, v12, v13, v14);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  double v18 = objc_msgSend_timeMinutesColor(v4, v15, v16, v17);
  objc_msgSend_setMinutesColor_(v38, v19, (uint64_t)v18, v20);

  double v24 = objc_msgSend_timeSecondsColor(v4, v21, v22, v23);
  objc_msgSend_setSecondsColor_(v38, v25, (uint64_t)v24, v26);

  objc_msgSend_setNeedsDisplay(v38, v27, v28, v29);
  objc_msgSend_setColorPalette_(self->_bezelView, v30, (uint64_t)v4, v31);

  objc_msgSend__updateStatusBarColorForNightModeFraction_(self, v32, v33, v34, self->_nightModeFraction);
  objc_msgSend_commit(MEMORY[0x263F158F8], v35, v36, v37);
}

- (void)_applyPaletteFromBezelStyle:(int64_t)a3 toBezelStyle:(int64_t)a4 progress:(double)a5 updateColorsIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  objc_msgSend_interpolatedColorPalette(self, a2, a3, a4);
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_fromPalette(v46, v11, v12, v13);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v14;
    if (objc_msgSend_isMulticolor(v18, v19, v20, v21)) {
      int v25 = objc_msgSend_bezelStyle(v18, v22, v23, v24) != a3 && v6;
    }
    else {
      int v25 = 0;
    }
    objc_msgSend_setBezelStyle_(v18, v22, a3, v24);
  }
  else
  {
    int v25 = 0;
  }
  uint64_t v26 = objc_msgSend_toPalette(v46, v15, v16, v17);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v26;
    if (objc_msgSend_isMulticolor(v30, v31, v32, v33)
      && objc_msgSend_bezelStyle(v30, v34, v35, v36) != a4)
    {
      int v25 = v6;
    }
    objc_msgSend_setBezelStyle_(v30, v34, a4, v36);
  }
  objc_msgSend_transitionFraction(v46, v27, v28, v29);
  if (v40 == a5)
  {
    if (!v25) {
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend_setTransitionFraction_(v46, v37, v38, v39, a5);
    if (!v6) {
      goto LABEL_20;
    }
  }
  if ((objc_msgSend__nightModeActive(self, v37, v38, v39) & 1) == 0)
  {
    objc_msgSend_setTransitionFraction_(v46, v41, v42, v43, a5);
    objc_msgSend__updateViewColorsWithPalette_(self, v44, (uint64_t)v46, v45);
  }
LABEL_20:
}

- (void)_applyPaletteBezelStyle:(int64_t)a3 updateColorsIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend_faceColorPalette(self, a2, a3, a4);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isMulticolor(v24, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_bezelStyle(v24, v10, v11, v12);
    objc_msgSend_setBezelStyle_(v24, v14, a3, v15);
    objc_msgSend__applyPaletteFromBezelStyle_toBezelStyle_progress_updateColorsIfNeeded_(self, v16, a3, a3, 0, 1.0);
    if (v13 != a3 && v4 && (objc_msgSend__nightModeActive(self, v17, v18, v19) & 1) == 0) {
      objc_msgSend__updateViewColorsWithMultiPalette(self, v20, v21, v22);
    }
  }
  else
  {
    objc_msgSend_setBezelStyle_(v24, v10, a3, v12);
    objc_msgSend__applyPaletteFromBezelStyle_toBezelStyle_progress_updateColorsIfNeeded_(self, v23, a3, a3, 0, 1.0);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  objc_msgSend_interpolatedColorPalette(self, a2, (uint64_t)a4, (uint64_t)a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionFraction_(v12, v7, v8, v9, a3);
  objc_msgSend__updateViewColorsWithPalette_(self, v10, (uint64_t)v12, v11);
}

- (void)_applyMultiPaletteFractions
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_numberWithDouble_(NSNumber, a2, v2, v3, self->_tritiumFraction);
  v21[0] = v5;
  uint64_t v9 = objc_msgSend_numberWithDouble_(NSNumber, v6, v7, v8, self->_nightModeFraction);
  v21[1] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v21, 2);

  uint64_t v15 = objc_msgSend__multiPalette(self, v12, v13, v14);
  objc_msgSend_setTransitionFractions_(v15, v16, (uint64_t)v11, v17);

  objc_msgSend__updateViewColorsWithMultiPalette(self, v18, v19, v20);
}

- (void)_applyComplicationsAlphaForTransitionFraction:(double)a3 fromLayoutStyle:(unint64_t)a4 toLayoutStyle:(unint64_t)a5 editMode:(int64_t)a6
{
  CLKInterpolateBetweenFloatsClipped();
  uint64_t v8 = v7;
  CLKInterpolateBetweenFloatsClipped();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_246B19998;
  v12[3] = &unk_2651F6D40;
  v12[4] = self;
  v12[5] = v9;
  v12[6] = v8;
  objc_msgSend_enumerateComplicationDisplayWrappersWithBlock_(self, v10, (uint64_t)v12, v11);
}

- (void)_applyComplicationsAlphaForLayoutStyle:(unint64_t)a3 editMode:(int64_t)a4
{
}

- (unint64_t)_currentLayoutStyle
{
  uint64_t v2 = objc_msgSend_optionForCustomEditMode_slot_(self, a2, 15, 0);
  objc_opt_class();
  unint64_t v6 = 0;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = objc_msgSend_layoutStyle(v2, v3, v4, v5);
  }

  return v6;
}

- (int64_t)_currentBezelStyle
{
  uint64_t v2 = objc_msgSend_optionForCustomEditMode_slot_(self, a2, 12, 0);
  objc_opt_class();
  int64_t v6 = 0;
  if (objc_opt_isKindOfClass()) {
    int64_t v6 = objc_msgSend_bezelStyle(v2, v3, v4, v5);
  }

  return v6;
}

- (unint64_t)_currentNightModePolicy
{
  uint64_t v2 = objc_msgSend_optionForCustomEditMode_slot_(self, a2, 18, 0);
  objc_opt_class();
  unint64_t v6 = 0;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = objc_msgSend_nightMode(v2, v3, v4, v5);
  }

  return v6;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_logObject(NTKFoghornFaceBundle, v13, v14, v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v77 = objc_msgSend_localizedName(v11, v17, v18, v19);
    v81 = objc_msgSend_localizedName(v12, v78, v79, v80);
    int v82 = 136315906;
    uint64_t v83 = "-[NTKFoghornFaceView _applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:]";
    __int16 v84 = 2048;
    double v85 = a3;
    __int16 v86 = 2112;
    v87 = v77;
    __int16 v88 = 2112;
    v89 = v81;
    _os_log_debug_impl(&dword_246AFF000, v16, OS_LOG_TYPE_DEBUG, "%s: fraction = %f fromOption = %@ toOption = %@", (uint8_t *)&v82, 0x2Au);
  }
  switch(a6)
  {
    case 10:
      id v23 = v12;
      id v24 = v11;
      uint64_t v28 = objc_msgSend__currentBezelStyle(self, v25, v26, v27);
      objc_msgSend__applyPaletteBezelStyle_updateColorsIfNeeded_(self, v29, v28, 0);
      objc_msgSend__applyTransitionFraction_fromColor_toColor_(self, v30, (uint64_t)v24, (uint64_t)v23, a3);

      break;
    case 12:
      id v31 = v12;
      uint64_t v35 = objc_msgSend_bezelStyle(v11, v32, v33, v34);
      uint64_t v42 = objc_msgSend_bezelStyle(v31, v36, v37, v38);
      if ((v35 != 0) != (v42 != 0))
      {
        uint64_t v43 = objc_msgSend_timeView(self, v39, v40, v41);
        objc_msgSend_setFromInset_toInset_progress_(v43, v44, v35 != 0, v42 != 0, a3);
      }
      objc_msgSend__applyPaletteFromBezelStyle_toBezelStyle_progress_updateColorsIfNeeded_(self, v39, v35, v42, 1, a3);
      objc_msgSend_setBezelFromStyle_toStyle_progress_(self->_bezelView, v45, v35, v42, a3);
      objc_msgSend__applyComplicationsLayoutFromBezelStyle_toBezelStyle_progress_(self, v46, v35, v42, a3);

      break;
    case 15:
      id v47 = v12;
      id v48 = v11;
      long long v52 = objc_msgSend_timeView(self, v49, v50, v51);
      uint64_t v56 = objc_msgSend_layoutStyle(v48, v53, v54, v55);
      uint64_t v60 = objc_msgSend_layoutStyle(v47, v57, v58, v59);
      objc_msgSend_setLayoutFromStyle_toStyle_progress_(v52, v61, v56, v60, a3);

      uint64_t v65 = objc_msgSend_layoutStyle(v48, v62, v63, v64);
      uint64_t v69 = objc_msgSend_layoutStyle(v47, v66, v67, v68);

      objc_msgSend__applyComplicationsAlphaForTransitionFraction_fromLayoutStyle_toLayoutStyle_editMode_(self, v70, v65, v69, 15, a3);
      break;
    case 18:
      uint64_t v71 = objc_msgSend_nightMode(v11, v20, v21, v22);
      uint64_t v75 = objc_msgSend_nightMode(v12, v72, v73, v74);
      objc_msgSend__applyTransitionFraction_fromNightMode_toNightMode_(self, v76, v71, v75, a3);
      break;
    default:
      break;
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v11 = objc_msgSend_logObject(NTKFoghornFaceBundle, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v77 = objc_msgSend_dataMode(self, v12, v13, v14);
    v81 = objc_msgSend_localizedName(v7, v78, v79, v80);
    int v82 = 136316162;
    uint64_t v83 = "-[NTKFoghornFaceView _applyOption:forCustomEditMode:slot:]";
    __int16 v84 = 2048;
    double v85 = self;
    __int16 v86 = 2048;
    uint64_t v87 = v77;
    __int16 v88 = 2112;
    v89 = v81;
    __int16 v90 = 1024;
    int v91 = a4;
    _os_log_debug_impl(&dword_246AFF000, v11, OS_LOG_TYPE_DEBUG, "%s(%p): dataMode = %ld option = %@ mode = %u", (uint8_t *)&v82, 0x30u);
  }
  switch(a4)
  {
    case 10:
      uint64_t v18 = objc_msgSend__currentBezelStyle(self, v15, v16, v17);
      objc_msgSend__applyPaletteBezelStyle_updateColorsIfNeeded_(self, v19, v18, 0);
      id v23 = objc_msgSend_interpolatedColorPalette(self, v20, v21, v22);
      objc_msgSend_setTransitionFraction_(v23, v24, v25, v26, 1.0);

      multiPalette = self->_multiPalette;
      self->_multiPalette = 0;

      objc_msgSend__updateViewColorsWithMultiPalette(self, v28, v29, v30);
      break;
    case 12:
      uint64_t v31 = objc_msgSend_bezelStyle(v7, v15, v16, v17);
      uint64_t v35 = objc_msgSend_timeView(self, v32, v33, v34);
      objc_msgSend_setInset_(v35, v36, v31 != 0, v37);

      objc_msgSend__applyPaletteBezelStyle_updateColorsIfNeeded_(self, v38, v31, 0);
      objc_msgSend_setBezelStyle_(self->_bezelView, v39, v31, v40);
      uint64_t v44 = objc_msgSend_interpolatedColorPalette(self, v41, v42, v43);
      objc_msgSend_setTransitionFraction_(v44, v45, v46, v47, 1.0);

      id v48 = self->_multiPalette;
      self->_multiPalette = 0;

      objc_msgSend__updateViewColorsWithMultiPalette(self, v49, v50, v51);
      objc_msgSend__applyComplicationsLayoutFromBezelStyle_toBezelStyle_progress_(self, v52, v31, v31, 1.0);
      break;
    case 15:
      id v53 = v7;
      double v57 = objc_msgSend_timeView(self, v54, v55, v56);
      uint64_t v61 = objc_msgSend_layoutStyle(v53, v58, v59, v60);
      objc_msgSend_setLayoutStyle_(v57, v62, v61, v63);

      uint64_t v67 = objc_msgSend_layoutStyle(v53, v64, v65, v66);
      objc_msgSend__applyComplicationsAlphaForLayoutStyle_editMode_(self, v68, v67, 15);
      break;
    case 18:
      uint64_t v69 = objc_msgSend_nightMode(v7, v15, v16, v17);
      objc_msgSend_setNightMode_(self, v70, v69, v71);
      uint64_t v75 = objc_msgSend__currentLayoutStyle(self, v72, v73, v74);
      objc_msgSend__applyComplicationsAlphaForLayoutStyle_editMode_(self, v76, v75, 18);
      break;
    default:
      break;
  }
}

- (unint64_t)_effectiveNightModeForEditMode:(int64_t)a3
{
  unint64_t result = 0;
  if (a3 != 1 && a3 != 10) {
    return objc_msgSend__nightModeActive(self, a2, a3, v3);
  }
  return result;
}

- (double)_alphaForComplicationSlot:(id)a3 inEditOption:(id)a4 ofEditMode:(int64_t)a5
{
  id v8 = a3;
  id v12 = a4;
  if (a5 == 15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v13 = objc_msgSend_layoutStyle(v12, v9, v10, v11);
  }
  else {
    uint64_t v13 = objc_msgSend__currentLayoutStyle(self, v9, v10, v11);
  }
  unint64_t v14 = v13;
  uint64_t v15 = objc_opt_class();
  if (objc_msgSend__isSixpackComplicationSlot_(v15, v16, (uint64_t)v8, v17))
  {
    double v18 = 0.0;
    if (v14 > 3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = objc_opt_class();
    double v18 = 1.0;
    if (!objc_msgSend__isMiddleComplicationSlot_(v19, v20, (uint64_t)v8, v21)) {
      goto LABEL_13;
    }
    double v18 = 0.0;
    if (v14 > 1) {
      goto LABEL_13;
    }
  }
  if (a5 == 15 || (double v18 = 1.0, a5 == 12)) {
    double v18 = *MEMORY[0x263F57868];
  }
LABEL_13:

  return v18;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 15 || a4 == 12;
}

- (id)_complicationSlotsHiddenByCurrentConfiguration
{
  unint64_t v5 = objc_msgSend__currentLayoutStyle(self, a2, v2, v3);
  if (v5 > 3)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_msgSend_delegate(self, v6, v7, v8);
    unint64_t v14 = objc_msgSend_faceViewComplicationSlots(v10, v11, v12, v13);
    uint64_t v17 = objc_msgSend_setWithArray_(v9, v15, (uint64_t)v14, v16);
  }
  else
  {
    if (v5 > 1) {
      objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v6, *MEMORY[0x263F57840], v8);
    }
    else {
    uint64_t v17 = objc_msgSend_set(MEMORY[0x263EFFA08], v6, v7, v8);
    }
  }

  return v17;
}

- (void)_prepareComplicationsForSnapshotting
{
  unint64_t v5 = objc_msgSend__currentLayoutStyle(self, a2, v2, v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B1A44C;
  _OWORD v8[3] = &unk_2651F6D68;
  v8[4] = self;
  BOOL v9 = v5 < 4;
  BOOL v10 = v5 < 2;
  objc_msgSend_enumerateComplicationDisplayWrappersWithBlock_(self, v6, (uint64_t)v8, v7);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKFoghornFaceView;
  -[NTKFoghornFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v17, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4)
  {
    objc_msgSend__transformForRubberBandingFraction_(self, v8, v9, v10, a3);
    objc_msgSend_setTransform_(self, v11, (uint64_t)&v16, v12);
    NTKAlphaForRubberBandingFraction();
    objc_msgSend_setAlpha_(self, v13, v14, v15);
  }
}

- (CGAffineTransform)_transformForBreathingFraction:(SEL)a3
{
  NTKLargeElementScaleForBreathingFraction();

  return CGAffineTransformMakeScale(retstr, v5, v5);
}

- (CGAffineTransform)_transformForRubberBandingFraction:(SEL)a3
{
  NTKScaleForRubberBandingFraction();

  return CGAffineTransformMakeScale(retstr, v5, v5);
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if ((unint64_t)(a3 - 10) > 8) {
    return 0;
  }
  else {
    return (id)qword_2651F6DD8[a3 - 10];
  }
}

+ (void)_drawComplicationsSnapshotInContext:(CGContext *)a3 bezelStyle:(int64_t)a4 layoutStyle:(unint64_t)a5 forDevice:(id)a6
{
  id v10 = a6;
  if (a5 <= 3)
  {
    BOOL v11 = a5 < 2;
    CGContextSaveGState(a3);
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F825C8], v12, v13, v14, 0.9, 0.05);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (CGColor *)objc_msgSend_CGColor(v15, v16, v17, v18);
    CGContextSetFillColorWithColor(a3, v19);

    objc_msgSend_screenBounds(v10, v20, v21, v22);
    double v24 = v23;
    double v26 = v25;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_246B1A75C;
    v28[3] = &unk_2651F6D90;
    char v32 = 1;
    id v30 = a1;
    uint64_t v31 = a3;
    BOOL v33 = v11;
    id v29 = v10;
    objc_msgSend__applyComplicationsLayoutForDevice_size_fromBezelStyle_toBezelStyle_progress_block_(a1, v27, (uint64_t)v29, a4, a4, v28, v24, v26, 1.0);
    CGContextRestoreGState(a3);
  }
}

+ (id)_snapshotImageForLayoutStyle:(id)a3 bezelStyle:(id)a4 colorPalette:(id)a5 withSelectedOptions:(id)a6 forDevice:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v18 = objc_msgSend_mainScreen(MEMORY[0x263F82B60], v15, v16, v17);
  objc_msgSend_scale(v18, v19, v20, v21);
  double v23 = v22;

  objc_msgSend_screenBounds(v14, v24, v25, v26);
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = objc_opt_new();
  objc_msgSend_setScale_(v31, v32, v33, v34, v23);
  id v35 = objc_alloc(MEMORY[0x263F827A0]);
  uint64_t v38 = objc_msgSend_initWithSize_format_(v35, v36, (uint64_t)v31, v37, v28, v30);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_246B1AA44;
  v47[3] = &unk_2651F6DB8;
  double v52 = v28;
  double v53 = v30;
  id v54 = a1;
  id v48 = v12;
  id v49 = v11;
  id v50 = v14;
  id v51 = v13;
  id v39 = v13;
  id v40 = v14;
  id v41 = v11;
  id v42 = v12;
  uint64_t v45 = objc_msgSend_imageWithActions_(v38, v43, (uint64_t)v47, v44);

  return v45;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v11 = a5;
  id v12 = 0;
  id v13 = v8;
  id v14 = 0;
  id v15 = 0;
  switch(a4)
  {
    case 10:
      id v13 = 0;
      id v12 = 0;
      id v14 = v8;
      goto LABEL_6;
    case 11:
    case 13:
    case 14:
    case 16:
    case 17:
      break;
    case 12:
      goto LABEL_6;
    case 15:
      id v16 = v8;
      id v12 = 0;
      id v15 = 0;
      id v14 = 0;
      if (!v16) {
        break;
      }
      goto LABEL_15;
    case 18:
      id v13 = 0;
      id v14 = 0;
      id v12 = v8;
LABEL_6:
      id v15 = v12;
      id v17 = v8;
      id v12 = v13;
      break;
    default:
      id v15 = 0;
      id v14 = 0;
      break;
  }
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v11, v9, (uint64_t)&unk_26FB11E98, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v18;
  }
  else {
    id v16 = 0;
  }

  if (v12)
  {
    if (v15) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_15:
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v11, v9, (uint64_t)&unk_26FB11E50, v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v20;
    }
    else {
      id v12 = 0;
    }

    if (v15)
    {
LABEL_12:
      if (v14) {
        goto LABEL_13;
      }
LABEL_23:
      double v22 = objc_msgSend_objectForKeyedSubscript_(v11, v9, (uint64_t)&unk_26FB11E68, v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v22;
      }
      else {
        id v14 = 0;
      }

      if (!v16) {
        goto LABEL_33;
      }
      goto LABEL_27;
    }
  }
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v11, v9, (uint64_t)&unk_26FB11E80, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v21;
  }
  else {
    id v15 = 0;
  }

  if (!v14) {
    goto LABEL_23;
  }
LABEL_13:
  if (!v16)
  {
LABEL_33:
    v51.receiver = self;
    v51.super_class = (Class)NTKFoghornFaceView;
    id v49 = [(NTKFoghornFaceView *)&v51 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v11];
    goto LABEL_34;
  }
LABEL_27:
  if (!v12 || !v15 || !v14) {
    goto LABEL_33;
  }
  double v23 = objc_msgSend_foghornFaceColorPalette(self, v9, v19, v10);
  double v27 = objc_msgSend_copy(v23, v24, v25, v26);

  objc_msgSend_setPigmentEditOption_(v27, v28, (uint64_t)v14, v29);
  uint64_t v33 = objc_msgSend_bezelStyle(v12, v30, v31, v32);
  objc_msgSend_setBezelStyle_(v27, v34, v33, v35);
  if (objc_msgSend_nightMode(v15, v36, v37, v38) == 1)
  {
    uint64_t v42 = objc_msgSend_nightModeColorPalette(v27, v39, v40, v41);

    double v27 = (void *)v42;
  }
  uint64_t v43 = objc_opt_class();
  uint64_t v47 = objc_msgSend_device(self, v44, v45, v46);
  id v49 = objc_msgSend__snapshotImageForLayoutStyle_bezelStyle_colorPalette_withSelectedOptions_forDevice_(v43, v48, (uint64_t)v16, (uint64_t)v12, v27, v11, v47);

LABEL_34:

  return v49;
}

- (void)_prepareForSnapshotting
{
}

- (void)_reorderSwitcherSnapshotView
{
  v12.receiver = self;
  v12.super_class = (Class)NTKFoghornFaceView;
  [(NTKFoghornFaceView *)&v12 _reorderSwitcherSnapshotView];
  uint64_t v6 = objc_msgSend__currentLayoutStyle(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_toEditMode(self, v7, v8, v9);
  objc_msgSend__applyComplicationsAlphaForLayoutStyle_editMode_(self, v11, v6, v10);
}

- (void)_setLive:(int64_t)a3
{
  unint64_t v5 = a3 - 1;
  BOOL v6 = a3 != 1;
  objc_msgSend_timeView(self, a2, a3, v3);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrozen_(v30, v7, v6, v8);
  if (v5 > 1)
  {
    objc_msgSend__ensureDataSourceForDataType_(self, v9, 0, v11);
    objc_msgSend_setShowingStatusIndicator_(self->_bezelView, v25, 0, v26);
    objc_msgSend_setToSnapshotValues(self->_bezelView, v27, v28, v29);
  }
  else
  {
    uint64_t v12 = objc_msgSend_bezelStyle(self->_bezelView, v9, v10, v11);
    objc_msgSend__ensureDataSourceForDataType_(self, v13, v12, v14);
    uint64_t v18 = objc_msgSend_delegate(self, v15, v16, v17);
    objc_msgSend_faceViewDidChangePaddingForStatusBar(v18, v19, v20, v21);

    objc_msgSend__configureShowingStatusIndicator(self, v22, v23, v24);
  }
}

- (id)createFaceColorPalette
{
  uint64_t v2 = [NTKFoghornFaceColorPalette alloc];
  uint64_t v3 = objc_opt_class();
  BOOL v6 = objc_msgSend_initWithFaceClass_(v2, v4, v3, v5);

  return v6;
}

- (id)_multiPalette
{
  v55[4] = *MEMORY[0x263EF8340];
  if (!self->_multiPalette)
  {
    uint64_t v5 = objc_msgSend_foghornFaceColorPalette(self, a2, v2, v3);
    uint64_t v9 = objc_msgSend_nightModeColorPalette(v5, v6, v7, v8);

    id v10 = objc_alloc(MEMORY[0x263F57A28]);
    uint64_t v14 = objc_msgSend_foghornFaceColorPalette(self, v11, v12, v13);
    v55[0] = v14;
    uint64_t v18 = objc_msgSend_foghornFaceColorPalette(self, v15, v16, v17);
    double v22 = objc_msgSend_tritiumPalette(v18, v19, v20, v21);
    v55[1] = v22;
    v55[2] = v9;
    uint64_t v26 = objc_msgSend_tritiumPalette(v9, v23, v24, v25);
    v55[3] = v26;
    uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v27, (uint64_t)v55, 4);
    uint64_t v31 = (NTKFoghornFaceColorPalette *)objc_msgSend_initWithPalettes_(v10, v29, (uint64_t)v28, v30);
    multiPalette = self->_multiPalette;
    self->_multiPalette = v31;
  }
  uint64_t v33 = objc_msgSend__nightModeInterpolator(self, a2, v2, v3);
  uint64_t v34 = (void *)MEMORY[0x24C542160]();
  uint64_t v38 = objc_msgSend_colorInterpolators(self->_multiPalette, v35, v36, v37);
  objc_msgSend_setObject_atIndexedSubscript_(v38, v39, (uint64_t)v34, 1);

  uint64_t v43 = objc_msgSend_numberWithDouble_(NSNumber, v40, v41, v42, self->_tritiumFraction);
  v54[0] = v43;
  uint64_t v47 = objc_msgSend_numberWithDouble_(NSNumber, v44, v45, v46, self->_nightModeFraction);
  v54[1] = v47;
  id v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v48, (uint64_t)v54, 2);

  objc_msgSend_setTransitionFractions_(self->_multiPalette, v50, (uint64_t)v49, v51);
  double v52 = self->_multiPalette;

  return v52;
}

- (void)_updateFromPreferences
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_timeView(self, a2, v2, v3);
  unsigned int v8 = objc_msgSend_timeViewUseStretchAnimation(NTKFoghornPreferences, v5, v6, v7);
  if (objc_msgSend_animationStyle(v4, v9, v10, v11) != v8)
  {
    id v15 = objc_msgSend_logObject(NTKFoghornFaceBundle, v12, v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend_animationStyle(v4, v16, v17, v18);
      uint64_t v20 = NTKFoghornTimeViewAnimationStyleString(v19);
      uint64_t v21 = NTKFoghornTimeViewAnimationStyleString(v8);
      int v40 = 138412546;
      uint64_t v41 = v20;
      __int16 v42 = 2112;
      uint64_t v43 = v21;
      _os_log_impl(&dword_246AFF000, v15, OS_LOG_TYPE_DEFAULT, "updating timeView animationStyle from: %@ to: %@", (uint8_t *)&v40, 0x16u);
    }
    objc_msgSend_setAnimationStyle_(v4, v22, v8, v23);
  }
  uint64_t v24 = objc_msgSend_timeViewAnimationSnapStyle(NTKFoghornPreferences, v12, v13, v14);
  if (objc_msgSend_animationSnapStyle(v4, v25, v26, v27) != v24)
  {
    uint64_t v31 = objc_msgSend_logObject(NTKFoghornFaceBundle, v28, v29, v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v35 = objc_msgSend_animationSnapStyle(v4, v32, v33, v34);
      uint64_t v36 = NTKFoghornTimeViewAnimationSnapStyleString(v35);
      uint64_t v37 = NTKFoghornTimeViewAnimationSnapStyleString(v24);
      int v40 = 138412546;
      uint64_t v41 = v36;
      __int16 v42 = 2112;
      uint64_t v43 = v37;
      _os_log_impl(&dword_246AFF000, v31, OS_LOG_TYPE_DEFAULT, "updating timeView animationSnapStyle from: %@ to: %@", (uint8_t *)&v40, 0x16u);
    }
    objc_msgSend_setAnimationSnapStyle_(v4, v38, v24, v39);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationsFilterProvider, 0);
  objc_storeStrong((id *)&self->_subdialComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_cornerComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_whistlerComplicationFactory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_statusBarOverrideColor, 0);
  objc_storeStrong((id *)&self->_multiPalette, 0);

  objc_storeStrong((id *)&self->_bezelView, 0);
}

@end