@interface NTKGalleonFaceView
+ (Class)_timeViewClass;
+ (id)_galleonSimpleComplicationFontDescriptor;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (id)galleonFontDescriptor;
+ (id)imageViewWithSymbolName:(id)a3 font:(id)a4;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_loadCompassModeFromCustomData;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_nightModeActive;
- (BOOL)_nightModeActiveFor:(unint64_t)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (CGAffineTransform)_transformForBreathingFraction:(SEL)a3;
- (CGAffineTransform)_transformForRubberBandingFraction:(SEL)a3;
- (NTKGalleonFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKRoundedCornerOverlayView)cornerView;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_horizontalPaddingForStatusBar;
- (double)_verticalPaddingForStatusBar;
- (id)_complicationContainerViewForSlot:(id)a3;
- (id)_createLowPowerTemplate;
- (id)_filterProviderForSlot:(id)a3;
- (id)_lowPowerTemplate;
- (id)_multiPalette;
- (id)_nightModeInterpolator;
- (id)_nightModeTemplate;
- (id)_statusBarColorForNightModeFraction:(double)a3;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (id)idealizedLocation;
- (id)overrideColorForStatusBar;
- (int64_t)_swatchImageContentMode;
- (unint64_t)_compassRingModeForTimeMode:(unint64_t)a3;
- (unint64_t)_effectiveBezelStyleForCompassMode:(unint64_t)a3 bezelStyle:(unint64_t)a4;
- (unint64_t)_effectiveBezelStyleForCompassMode:(unint64_t)a3 bezelStyle:(unint64_t)a4 editMode:(int64_t)a5;
- (unint64_t)_effectiveBezelStyleForEditMode:(int64_t)a3;
- (unint64_t)_effectiveCompassRingModeForEditMode:(int64_t)a3;
- (unint64_t)_effectiveCompassRingModeForTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5;
- (unint64_t)_effectiveCompassRingModeForTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5 editMode:(int64_t)a6;
- (unint64_t)_effectiveNightModeForEditMode:(int64_t)a3;
- (unint64_t)bezelStyle;
- (unint64_t)compassMode;
- (unint64_t)nightMode;
- (unint64_t)timeMode;
- (void)_alignCenterSignalStrengthView;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyCompassRingMode:(unint64_t)a3 bezelStyle:(unint64_t)a4;
- (void)_applyComplicationColor:(id)a3 slot:(id)a4;
- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5;
- (void)_applyComplicationFont:(id)a3;
- (void)_applyConfiguration;
- (void)_applyDefaultViewOrdering;
- (void)_applyFullSignalStrengthForSnapshot;
- (void)_applyHeadingLabelCompassFraction:(double)a3;
- (void)_applyHeadingLabelConfiguration;
- (void)_applyHeadingLabelVisible:(BOOL)a3;
- (void)_applyLowPowerModeFraction:(double)a3;
- (void)_applyMultiPaletteFractions;
- (void)_applyNightModeFraction:(double)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPaletteToComplications:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowsCanonicalContent;
- (void)_applyTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromBezelStyle:(unint64_t)a4 toBezelStyle:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromNightMode:(unint64_t)a4 toNightMode:(unint64_t)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionFraction:(double)a3 fromTimeMode:(unint64_t)a4 toTimeMode:(unint64_t)a5;
- (void)_applyTransitionFromCompassRingMode:(unint64_t)a3 fromBezelStyle:(unint64_t)a4 fromNightMode:(unint64_t)a5 toCompassRingMode:(unint64_t)a6 toBezelStyle:(unint64_t)a7 toNightMode:(unint64_t)a8 animationStyle:(unint64_t)a9 fraction:(double)a10;
- (void)_applyTransitionFromTimeMode:(unint64_t)a3 fromCompassMode:(unint64_t)a4 fromBezelStyle:(unint64_t)a5 fromNightMode:(unint64_t)a6 toTimeMode:(unint64_t)a7 toCompassMode:(unint64_t)a8 toBezelStyle:(unint64_t)a9 toNightMode:(unint64_t)a10 animationStyle:(unint64_t)a11 fraction:(double)a12;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForSnapshotting;
- (void)_removeViews;
- (void)_reorderSwitcherSnapshotView;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateStatusBar;
- (void)_updateViewColorsWithMultiPalette;
- (void)_updateViewColorsWithPalette:(id)a3;
- (void)applyColorOnAnalogHands;
- (void)configureComplicationViewDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBezelStyle:(unint64_t)a3;
- (void)setCompassMode:(unint64_t)a3;
- (void)setCornerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNightMode:(unint64_t)a3;
- (void)setTimeMode:(unint64_t)a3;
@end

@implementation NTKGalleonFaceView

- (NTKGalleonFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v86[7] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v85.receiver = self;
  v85.super_class = (Class)NTKGalleonFaceView;
  id v12 = [(NTKAnalogFaceView *)&v85 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v12)
  {
    v13 = (void *)MEMORY[0x263EFD198];
    v14 = objc_msgSend_galleonFontDescriptor(NTKGalleonFaceView, v9, v10, v11);
    uint64_t v17 = objc_msgSend_fontWithDescriptor_size_(v13, v15, (uint64_t)v14, v16, 5.0);
    v18 = (void *)*((void *)v12 + 111);
    *((void *)v12 + 111) = v17;

    id v19 = objc_alloc(MEMORY[0x263F57A20]);
    uint64_t v22 = objc_msgSend_initWithDevice_(v19, v20, (uint64_t)v8, v21);
    v23 = (void *)*((void *)v12 + 133);
    *((void *)v12 + 133) = v22;

    id v24 = objc_alloc(MEMORY[0x263F57A20]);
    uint64_t v27 = objc_msgSend_initWithDevice_(v24, v25, (uint64_t)v8, v26);
    v28 = (void *)*((void *)v12 + 134);
    *((void *)v12 + 134) = v27;

    id v29 = objc_alloc_init(MEMORY[0x263F579A0]);
    id v30 = objc_alloc(MEMORY[0x263F57AC8]);
    v34 = objc_msgSend_device(v12, v31, v32, v33);
    sub_246B3B7BC(v34, v84);
    uint64_t v36 = objc_msgSend_initWithFaceView_dialDiameter_device_(v30, v35, (uint64_t)v12, (uint64_t)v8, v84[0]);
    v37 = (void *)*((void *)v12 + 128);
    *((void *)v12 + 128) = v36;

    uint64_t v38 = *((void *)v12 + 128);
    uint64_t v39 = *MEMORY[0x263F57860];
    v86[0] = *MEMORY[0x263F57858];
    v86[1] = v39;
    uint64_t v40 = *MEMORY[0x263F57838];
    v86[2] = *MEMORY[0x263F57830];
    v86[3] = v40;
    uint64_t v41 = *MEMORY[0x263F57810];
    v86[4] = *MEMORY[0x263F57808];
    v86[5] = v41;
    v86[6] = *MEMORY[0x263F57818];
    v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v42, (uint64_t)v86, 7);
    objc_msgSend_registerFactory_forSlots_(v29, v44, v38, (uint64_t)v43);

    id v45 = objc_alloc_init(MEMORY[0x263F57A90]);
    objc_msgSend_setFaceView_(v45, v46, (uint64_t)v12, v47);
    v51 = objc_msgSend_device(v12, v48, v49, v50);
    sub_246B3B7BC(v51, v82);
    objc_msgSend_setVerticalCenterOffset_(v45, v52, v53, v54, v83);

    objc_msgSend_registerFactory_forSlot_(v29, v55, (uint64_t)v45, *MEMORY[0x263F57848]);
    objc_msgSend_setComplicationFactory_(v12, v56, (uint64_t)v29, v57);
    id v58 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v12, v59, v60, v61);
    uint64_t v65 = objc_msgSend_initWithFrame_(v58, v62, v63, v64);
    v66 = (void *)*((void *)v12 + 130);
    *((void *)v12 + 130) = v65;

    id v67 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v12, v68, v69, v70);
    uint64_t v74 = objc_msgSend_initWithFrame_(v67, v71, v72, v73);
    v75 = (void *)*((void *)v12 + 131);
    *((void *)v12 + 131) = v74;

    *((void *)v12 + 138) = 0;
    *((void *)v12 + 116) = 0;
    *((void *)v12 + 136) = 0;
    uint64_t v79 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x263F1C550], v76, v77, v78, 0.188235294, 0.0470588235, 0.0352941176, 1.0);
    v80 = (void *)*((void *)v12 + 132);
    *((void *)v12 + 132) = v79;
  }
  return (NTKGalleonFaceView *)v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKGalleonFaceView;
  [(NTKAnalogFaceView *)&v2 dealloc];
}

+ (Class)_timeViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_complicationContainerViewForSlot:(id)a3
{
  int isCornerComplicationForSlot = objc_msgSend_isCornerComplicationForSlot_(self->_whistlerComplicationFactory, a2, (uint64_t)a3, v3);
  v6 = &OBJC_IVAR___NTKGalleonFaceView__subdialComplicationContainerView;
  if (isCornerComplicationForSlot) {
    v6 = &OBJC_IVAR___NTKGalleonFaceView__cornerComplicationContainerView;
  }
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v6);

  return v7;
}

- (id)_filterProviderForSlot:(id)a3
{
  int isCornerComplicationForSlot = objc_msgSend_isCornerComplicationForSlot_(self->_whistlerComplicationFactory, a2, (uint64_t)a3, v3);
  v6 = &OBJC_IVAR___NTKGalleonFaceView__centerFilterProvider;
  if (isCornerComplicationForSlot) {
    v6 = &OBJC_IVAR___NTKGalleonFaceView__cornerFilterProvider;
  }
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v6);

  return v7;
}

- (void)_reorderSwitcherSnapshotView
{
  v5 = objc_msgSend_switcherSnapshotView(self, a2, v2, v3);

  if (v5)
  {
    objc_msgSend_superview(self->_cornerComplicationContainerView, v6, v7, v8);
    v9 = (NTKGalleonFaceView *)objc_claimAutoreleasedReturnValue();

    if (v9 == self) {
      objc_msgSend_bringSubviewToFront_(self, v10, (uint64_t)self->_cornerComplicationContainerView, v12);
    }
    objc_msgSend_superview(self->_subdialComplicationContainerView, v10, v11, v12);
    v13 = (NTKGalleonFaceView *)objc_claimAutoreleasedReturnValue();

    if (v13 == self) {
      objc_msgSend_bringSubviewToFront_(self, v14, (uint64_t)self->_subdialComplicationContainerView, v16);
    }
    objc_msgSend_timeViewContainer(self, v14, v15, v16);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_timeViewContainer(self, v17, v18, v19);
    objc_msgSend_bringSubviewToFront_(self, v21, (uint64_t)v20, v22);
  }
}

- (void)_prepareForSnapshotting
{
  v14.receiver = self;
  v14.super_class = (Class)NTKGalleonFaceView;
  [(NTKGalleonFaceView *)&v14 _prepareForSnapshotting];
  v6 = objc_msgSend_device(self, v3, v4, v5);
  int isExplorer = objc_msgSend_isExplorer(v6, v7, v8, v9);

  if (isExplorer) {
    objc_msgSend__applyFullSignalStrengthForSnapshot(self, v11, v12, v13);
  }
  objc_msgSend__applyHeadingLabelConfiguration(self, v11, v12, v13);
}

- (void)_loadSnapshotContentViews
{
  v18.receiver = self;
  v18.super_class = (Class)NTKGalleonFaceView;
  [(NTKAnalogFaceView *)&v18 _loadSnapshotContentViews];
  objc_msgSend__setupViews(self, v3, v4, v5);
  uint64_t v9 = objc_msgSend_contentView(self, v6, v7, v8);
  objc_msgSend_setHidden_(v9, v10, 0, v11);

  unsigned int CompassModeFromCustomData = objc_msgSend__loadCompassModeFromCustomData(self, v12, v13, v14);
  objc_msgSend_setCompassMode_(self, v16, CompassModeFromCustomData, v17);
}

- (void)_unloadSnapshotContentViews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKGalleonFaceView;
  [(NTKAnalogFaceView *)&v12 _unloadSnapshotContentViews];
  objc_msgSend__removeViews(self, v3, v4, v5);
  uint64_t v9 = objc_msgSend_contentView(self, v6, v7, v8);
  objc_msgSend_setHidden_(v9, v10, 1, v11);
}

- (void)_setupViews
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend_bounds(self, v4, v5, v6);
  uint64_t v10 = (UIView *)objc_msgSend_initWithFrame_(v3, v7, v8, v9);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v10;

  uint64_t v15 = objc_msgSend_contentView(self, v12, v13, v14);
  objc_msgSend_addSubview_(v15, v16, (uint64_t)self->_backgroundView, v17);

  long long v211 = 0u;
  long long v212 = 0u;
  long long v210 = 0u;
  memset(v209, 0, sizeof(v209));
  uint64_t v21 = objc_msgSend_device(self, v18, v19, v20);
  sub_246B3B7BC(v21, v209);

  v25 = objc_msgSend__multiPalette(self, v22, v23, v24);
  double v26 = *(double *)v209;
  uint64_t v30 = objc_msgSend_bounds(self, v27, v28, v29);
  double v31 = MEMORY[0x24C542570](v30);
  CGFloat v33 = v32 - v26 * 0.5;
  self->_outerTapRadius = v31 - (v31 - v26 * 0.5);
  v34 = (NTKGalleonCompassLayeredRingView *)objc_opt_new();
  compassRingView = self->_compassRingView;
  self->_compassRingView = v34;

  objc_msgSend_setPalette_(self->_compassRingView, v36, (uint64_t)v25, v37);
  uint64_t v41 = objc_msgSend_contentView(self, v38, v39, v40);
  objc_msgSend_addSubview_(v41, v42, (uint64_t)self->_compassRingView, v43);

  objc_msgSend_ringThickness(self->_compassRingView, v44, v45, v46);
  CGFloat v48 = v47;
  v213.origin.double x = v31 - v26 * 0.5;
  v213.origin.double y = v33;
  v213.size.double width = v26;
  v213.size.double height = v26;
  CGRect v214 = CGRectInset(v213, v48, v48);
  double x = v214.origin.x;
  double y = v214.origin.y;
  double width = v214.size.width;
  double height = v214.size.height;
  uint64_t v53 = [NTKGalleonGPSRingView alloc];
  uint64_t v57 = objc_msgSend_device(self, v54, v55, v56);
  uint64_t v60 = (NTKGalleonGPSRingView *)objc_msgSend_initWithFrame_device_(v53, v58, (uint64_t)v57, v59, x, y, width, height);
  gpsRingView = self->_gpsRingView;
  self->_gpsRingView = v60;

  objc_msgSend_setPalette_(self->_gpsRingView, v62, (uint64_t)v25, v63);
  id v67 = objc_msgSend_contentView(self, v64, v65, v66);
  objc_msgSend_addSubview_(v67, v68, (uint64_t)self->_gpsRingView, v69);

  objc_msgSend_ringThickness(self->_gpsRingView, v70, v71, v72);
  CGFloat v74 = v73;
  v215.origin.double x = x;
  v215.origin.double y = y;
  v215.size.double width = width;
  v215.size.double height = height;
  CGRect v216 = CGRectInset(v215, v74, v74);
  CGFloat v75 = v216.origin.x;
  double v76 = v216.origin.y;
  CGFloat v77 = v216.size.width;
  CGFloat v78 = v216.size.height;
  self->_innerTapRadius = v31 - v216.origin.x;
  uint64_t v79 = [NTKGalleonTimeRingView alloc];
  v217.origin.double x = v75;
  v217.origin.double y = v76;
  v217.size.double width = v77;
  v217.size.double height = v78;
  CGFloat v80 = CGRectGetWidth(v217);
  v84 = (NTKGalleonTimeRingView *)objc_msgSend_initWithDiameter_(v79, v81, v82, v83, v80);
  timeRingView = self->_timeRingView;
  self->_timeRingView = v84;

  objc_msgSend_setPalette_(self->_timeRingView, v86, (uint64_t)v25, v87);
  v91 = objc_msgSend_contentView(self, v88, v89, v90);
  objc_msgSend_addSubview_(v91, v92, (uint64_t)self->_timeRingView, v93);

  v218.origin.double x = v75;
  v218.origin.double y = v76;
  v218.size.double width = v77;
  v218.size.double height = v78;
  CGFloat MidX = CGRectGetMidX(v218);
  double v95 = *((double *)&v210 + 1);
  double v96 = *(double *)&v211;
  CGFloat v97 = MidX - *((double *)&v210 + 1) * 0.5;
  double v98 = v76 + *((double *)&v211 + 1);
  v99 = [NTKGalleonPrerenderedHeadingView alloc];
  v103 = (NTKGalleonPrerenderedHeadingView *)objc_msgSend_initWithFrame_(v99, v100, v101, v102, v97, v98, v95, v96);
  headingView = self->_headingView;
  self->_headingView = v103;

  v107 = objc_msgSend_normalComplicationDisplayWrapperForSlot_(self, v105, *MEMORY[0x263F57848], v106);
  objc_msgSend_setHidden_(v107, v108, 1, v109);
  v113 = objc_msgSend_headingLabelColor(v25, v110, v111, v112);
  objc_msgSend_setTextColor_(self->_headingView, v114, (uint64_t)v113, v115);
  v119 = objc_msgSend_contentView(self, v116, v117, v118);
  objc_msgSend_addSubview_(v119, v120, (uint64_t)self->_headingView, v121);

  v219.origin.double x = v75;
  v219.origin.double y = v76;
  v219.size.double width = v77;
  v219.size.double height = v78;
  CGFloat v122 = CGRectGetMidX(v219);
  long long v123 = v212;
  CGFloat v124 = v122 - *(double *)&v212 * 0.5;
  v125 = [NTKGalleonSignalStrengthView alloc];
  v129 = (NTKGalleonSignalStrengthView *)objc_msgSend_initWithFrame_(v125, v126, v127, v128, v124, v76 + 31.0, v123);
  signalStrengthView = self->_signalStrengthView;
  self->_signalStrengthView = v129;

  objc_msgSend_setPalette_(self->_signalStrengthView, v131, (uint64_t)v25, v132);
  v136 = objc_msgSend_contentView(self, v133, v134, v135);
  objc_msgSend_addSubview_(v136, v137, (uint64_t)self->_signalStrengthView, v138);

  objc_msgSend_imageViewWithSymbolName_font_(NTKGalleonFaceView, v139, @"triangle.fill", (uint64_t)self->_symbolFont);
  v140 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  triangleView = self->_triangleView;
  self->_triangleView = v140;

  long long v142 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v207.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v207.c = v142;
  *(_OWORD *)&v207.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformRotate(&v208, &v207, 3.14159265);
  v143 = self->_triangleView;
  CGAffineTransform v206 = v208;
  objc_msgSend_setTransform_(v143, v144, (uint64_t)&v206, v145);
  v146 = self->_triangleView;
  v150 = objc_msgSend_compassMarkerColor(v25, v147, v148, v149);
  objc_msgSend_setTintColor_(v146, v151, (uint64_t)v150, v152);

  v156 = objc_msgSend_contentView(self, v153, v154, v155);
  objc_msgSend_addSubview_(v156, v157, (uint64_t)self->_triangleView, v158);

  id v159 = objc_alloc(MEMORY[0x263F57A78]);
  objc_msgSend_bounds(self, v160, v161, v162);
  double v164 = v163;
  double v166 = v165;
  double v168 = v167;
  double v170 = v169;
  v174 = objc_msgSend_device(self, v171, v172, v173);
  v177 = (NTKRoundedCornerOverlayView *)objc_msgSend_initWithFrame_forDeviceCornerRadius_(v159, v175, (uint64_t)v174, v176, v164, v166, v168, v170);
  cornerView = self->_cornerView;
  self->_cornerView = v177;

  v182 = objc_msgSend_contentView(self, v179, v180, v181);
  objc_msgSend_addSubview_(v182, v183, (uint64_t)self->_cornerView, v184);

  objc_msgSend__applyDefaultViewOrdering(self, v185, v186, v187);
  objc_msgSend_applyColorOnAnalogHands(self, v188, v189, v190);
  objc_msgSend__applyConfiguration(self, v191, v192, v193);
  objc_msgSend_setIncline_(self->_gpsRingView, v194, v195, v196, 45.0);
  objc_msgSend_setAltitude_(self->_gpsRingView, v197, v198, v199, 4420.0);
  objc_msgSend_setLatency_(self->_gpsRingView, v200, v201, v202, 0.0);
  objc_msgSend__alignCenterSignalStrengthView(self, v203, v204, v205);
}

- (void)_applyDefaultViewOrdering
{
  objc_msgSend_removeFromSuperview(self->_cornerComplicationContainerView, a2, v2, v3);
  uint64_t v8 = objc_msgSend_superview(self->_backgroundView, v5, v6, v7);
  objc_super v12 = objc_msgSend_contentView(self, v9, v10, v11);

  if (v8 == v12)
  {
    uint64_t v19 = objc_msgSend_contentView(self, v13, v14, v15);
    objc_msgSend_insertSubview_belowSubview_(v19, v20, (uint64_t)self->_cornerComplicationContainerView, (uint64_t)self->_signalStrengthView);
  }
  else
  {
    objc_msgSend_addSubview_(self, v13, (uint64_t)self->_cornerComplicationContainerView, v15);
  }
  objc_msgSend_removeFromSuperview(self->_subdialComplicationContainerView, v16, v17, v18);
  uint64_t v24 = objc_msgSend_superview(self->_signalStrengthView, v21, v22, v23);
  uint64_t v28 = objc_msgSend_contentView(self, v25, v26, v27);

  if (v24 == v28)
  {
    objc_msgSend_contentView(self, v29, v30, v31);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertSubview_belowSubview_(v34, v33, (uint64_t)self->_subdialComplicationContainerView, (uint64_t)self->_signalStrengthView);
  }
  else
  {
    subdialComplicationContainerView = self->_subdialComplicationContainerView;
    objc_msgSend_addSubview_(self, v29, (uint64_t)subdialComplicationContainerView, v31);
  }
}

- (void)_applyShowsCanonicalContent
{
  v17.receiver = self;
  v17.super_class = (Class)NTKGalleonFaceView;
  [(NTKGalleonFaceView *)&v17 _applyShowsCanonicalContent];
  if (objc_msgSend_showsCanonicalContent(self, v3, v4, v5))
  {
    uint64_t v9 = objc_msgSend_device(self, v6, v7, v8);
    int isExplorer = objc_msgSend_isExplorer(v9, v10, v11, v12);

    if (isExplorer) {
      objc_msgSend__applyFullSignalStrengthForSnapshot(self, v14, v15, v16);
    }
  }
}

- (void)_applyFullSignalStrengthForSnapshot
{
  objc_msgSend_setHidden_(self->_signalStrengthView, a2, 0, v2);
  objc_msgSend_setState_(self->_signalStrengthView, v4, 1, v5);
  objc_msgSend_setShowsFullSignalStrength_(self->_signalStrengthView, v6, 1, v7);

  objc_msgSend__alignCenterSignalStrengthView(self, v8, v9, v10);
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)NTKGalleonFaceView;
  [(NTKAnalogFaceView *)&v40 layoutSubviews];
  memset(v39, 0, sizeof(v39));
  uint64_t v6 = objc_msgSend_device(self, v3, v4, v5);
  sub_246B3B7BC(v6, v39);

  uint64_t v10 = objc_msgSend_bounds(self, v7, v8, v9);
  double v11 = MEMORY[0x24C542570](v10);
  double v13 = v12;
  objc_msgSend_setCenter_(self->_timeRingView, v14, v15, v16);
  objc_msgSend_setCenter_(self->_compassRingView, v17, v18, v19, v11, v13);
  objc_msgSend_setCenter_(self->_gpsRingView, v20, v21, v22, v11, v13);
  double v23 = v13 - *(double *)&v39[0].receiver * 0.5;
  objc_msgSend_frame(self->_triangleView, v24, v25, v26);
  objc_msgSend_setFrame_(self->_triangleView, v29, v30, v31, v11 - v27 * 0.5, v23 - *(double *)&v39[0].super_class - v28);
  cornerView = self->_cornerView;
  objc_msgSend_bounds(self, v33, v34, v35);
  objc_msgSend_ntk_setBoundsAndPositionFromFrame_(cornerView, v36, v37, v38);
}

- (void)_removeViews
{
  objc_msgSend_removeFromSuperview(self->_triangleView, a2, v2, v3);
  triangleView = self->_triangleView;
  self->_triangleView = 0;

  objc_msgSend_removeFromSuperview(self->_timeRingView, v6, v7, v8);
  timeRingView = self->_timeRingView;
  self->_timeRingView = 0;

  objc_msgSend_removeFromSuperview(self->_compassRingView, v10, v11, v12);
  compassRingView = self->_compassRingView;
  self->_compassRingView = 0;

  objc_msgSend_removeFromSuperview(self->_gpsRingView, v14, v15, v16);
  gpsRingView = self->_gpsRingView;
  self->_gpsRingView = 0;

  objc_msgSend_removeFromSuperview(self->_headingView, v18, v19, v20);
  headingView = self->_headingView;
  self->_headingView = 0;

  objc_msgSend_removeFromSuperview(self->_signalStrengthView, v22, v23, v24);
  signalStrengthView = self->_signalStrengthView;
  self->_signalStrengthView = 0;

  objc_msgSend_removeFromSuperview(self->_cornerView, v26, v27, v28);
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_loadLayoutRules
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGalleonFaceView;
  [(NTKGalleonFaceView *)&v8 _loadLayoutRules];
  memset(v7, 0, sizeof(v7));
  uint64_t v6 = objc_msgSend_device(self, v3, v4, v5);
  sub_246B3B7BC(v6, v7);

  NTKEnumerateComplicationStates();
}

- (void)applyColorOnAnalogHands
{
  objc_msgSend_timeView(self, a2, v2, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = objc_msgSend__multiPalette(self, v5, v6, v7);
  objc_msgSend_setPalette_(v11, v9, (uint64_t)v8, v10);
}

- (void)setDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGalleonFaceView;
  [(NTKGalleonFaceView *)&v7 setDelegate:a3];
  self->_compassMode = objc_msgSend__loadCompassModeFromCustomData(self, v4, v5, v6);
}

- (BOOL)_loadCompassModeFromCustomData
{
  objc_super v8 = objc_msgSend_delegate(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_delegate(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_faceViewDidRequestCustomDataForKey_(v9, v10, @"compassMode", v11);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);
    }
    else {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)_applyConfiguration
{
}

- (void)_applyTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5
{
  uint64_t v8 = objc_msgSend__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_(self, a2, a3, a4);
  uint64_t v10 = objc_msgSend__effectiveBezelStyleForCompassMode_bezelStyle_(self, v9, a4, a5);

  MEMORY[0x270F9A6D0](self, sel__applyCompassRingMode_bezelStyle_, v8, v10);
}

- (void)_applyTransitionFromTimeMode:(unint64_t)a3 fromCompassMode:(unint64_t)a4 fromBezelStyle:(unint64_t)a5 fromNightMode:(unint64_t)a6 toTimeMode:(unint64_t)a7 toCompassMode:(unint64_t)a8 toBezelStyle:(unint64_t)a9 toNightMode:(unint64_t)a10 animationStyle:(unint64_t)a11 fraction:(double)a12
{
  uint64_t v17 = objc_msgSend__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_(self, a2, a3, a4);
  uint64_t v19 = objc_msgSend__effectiveBezelStyleForCompassMode_bezelStyle_(self, v18, a4, a5);
  objc_msgSend__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_(self, v20, a7, a8, a9);
  objc_msgSend__effectiveBezelStyleForCompassMode_bezelStyle_(self, v21, a8, a9);

  MEMORY[0x270F9A6D0](self, sel__applyTransitionFromCompassRingMode_fromBezelStyle_fromNightMode_toCompassRingMode_toBezelStyle_toNightMode_animationStyle_fraction_, v17, v19);
}

- (void)_applyCompassRingMode:(unint64_t)a3 bezelStyle:(unint64_t)a4
{
  objc_msgSend_setRingMode_(self->_compassRingView, a2, a3, a4);
  compassRingView = self->_compassRingView;
  double v11 = 1.0;
  if (a4 == 2) {
    objc_msgSend_applyGPSRingEnableFraction_(compassRingView, v7, v8, v9, 0.0);
  }
  else {
    objc_msgSend_applyGPSRingEnableFraction_(compassRingView, v7, v8, v9, 1.0);
  }
  uint64_t v15 = self->_compassRingView;
  objc_msgSend_getRingDiameter(self->_gpsRingView, v12, v13, v14);
  objc_msgSend_setGPSRingDiameter_(v15, v16, v17, v18);
  gpsRingView = self->_gpsRingView;
  uint64_t v23 = objc_msgSend_idealizedLocation(self, v20, v21, v22);
  objc_msgSend_locationUpdated_(gpsRingView, v24, (uint64_t)v23, v25);

  objc_msgSend_setBezelStyle_(self->_gpsRingView, v26, a4, v27);
  if (a3 != 2) {
    double v11 = 0.0;
  }
  objc_msgSend__applyHeadingLabelVisible_(self, v28, a3 == 2, v29);
  objc_msgSend_timeView(self, v30, v31, v32);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCompassMode_(v38, v33, a3 == 2, v34);
  self->_compassFraction = v11;
  objc_msgSend__applyMultiPaletteFractions(self, v35, v36, v37);
}

- (void)_applyTransitionFromCompassRingMode:(unint64_t)a3 fromBezelStyle:(unint64_t)a4 fromNightMode:(unint64_t)a5 toCompassRingMode:(unint64_t)a6 toBezelStyle:(unint64_t)a7 toNightMode:(unint64_t)a8 animationStyle:(unint64_t)a9 fraction:(double)a10
{
  if (a9 >= 3)
  {
    double v19 = a10;
    if (a9 == 3)
    {
      double v20 = fmax((a10 + -0.05) / 0.85, 0.0);
      double v21 = (v20 + -0.33) / 0.34;
      BOOL v22 = v20 < 1.0;
      double v23 = 1.97058824;
      if (v22) {
        double v23 = v21;
      }
      double v24 = fmin(fmax(v23, 0.0), 1.0);
      if (a3 == 2) {
        double v19 = 1.0 - v24;
      }
      else {
        double v19 = v24;
      }
    }
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    double v19 = v18;
  }
  if (a3 != a6) {
    objc_msgSend_applyRingModeTransitionFraction_fromMode_toMode_withAnimationStyle_(self->_compassRingView, a2, a3, a6, a9, a10);
  }
  if (a4 != a7)
  {
    CLKInterpolateBetweenFloatsClipped();
    if (a9 != 1) {
      objc_msgSend_applyGPSRingEnableFraction_(self->_compassRingView, v25, v26, v27);
    }
    compassRingView = self->_compassRingView;
    objc_msgSend_getRingDiameter(self->_gpsRingView, v25, v26, v27);
    objc_msgSend_setGPSRingDiameter_(compassRingView, v29, v30, v31);
    objc_msgSend_applyTransitionFraction_fromBezelStyle_toBezelStyle_(self->_gpsRingView, v32, a4, a7, a10);
  }
  if (a3 == a6)
  {
    if (a5 == a8) {
      return;
    }
  }
  else
  {
    objc_msgSend__applyHeadingLabelCompassFraction_(self, a2, a3, a4, v19);
    uint64_t v36 = objc_msgSend_timeView(self, v33, v34, v35);
    uint64_t v39 = v36;
    if (a3 == 2 && a6 != 2 || a3 != 2 && a6 == 2) {
      objc_msgSend_applyTransitionFractionToCompassMode_fraction_(v36, v37, a6 == 2, v38, a10);
    }
  }
  if (a5 != a8)
  {
    double v40 = 1.0 - a10;
    if (a8 == 1) {
      double v40 = a10;
    }
    self->_nightModeFraction = v40;
  }
  if (a3 != a6)
  {
    double v41 = 1.0 - a10;
    if (a3 == 1) {
      double v41 = a10;
    }
    self->_compassFraction = v41;
  }

  objc_msgSend__applyMultiPaletteFractions(self, a2, a3, a4);
}

- (unint64_t)_effectiveCompassRingModeForEditMode:(int64_t)a3
{
  return MEMORY[0x270F9A6D0](self, sel__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_editMode_, self->_timeMode, self->_compassMode);
}

- (unint64_t)_effectiveCompassRingModeForTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5
{
  objc_msgSend_toEditMode(self, a2, a3, a4);

  return MEMORY[0x270F9A6D0](self, sel__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_editMode_, a3, a4);
}

- (unint64_t)_effectiveCompassRingModeForTimeMode:(unint64_t)a3 compassMode:(unint64_t)a4 bezelStyle:(unint64_t)a5 editMode:(int64_t)a6
{
  if ((unint64_t)(a6 - 10) < 2) {
    return a3 != 0;
  }
  if (a6 == 12) {
    return 2;
  }
  if (a6 == 1) {
    return a3 != 0;
  }
  if (a4 == 1) {
    return 2;
  }
  else {
    return a3 != 0;
  }
}

- (unint64_t)_effectiveBezelStyleForEditMode:(int64_t)a3
{
  return MEMORY[0x270F9A6D0](self, sel__effectiveBezelStyleForCompassMode_bezelStyle_editMode_, self->_compassMode, self->_bezelStyle);
}

- (unint64_t)_effectiveBezelStyleForCompassMode:(unint64_t)a3 bezelStyle:(unint64_t)a4
{
  objc_msgSend_toEditMode(self, a2, a3, a4);

  return MEMORY[0x270F9A6D0](self, sel__effectiveBezelStyleForCompassMode_bezelStyle_editMode_, a3, a4);
}

- (unint64_t)_effectiveBezelStyleForCompassMode:(unint64_t)a3 bezelStyle:(unint64_t)a4 editMode:(int64_t)a5
{
  unint64_t v5 = 2;
  if (a3 == 1) {
    unint64_t v5 = a4;
  }
  if (a5 == 12) {
    unint64_t v5 = a4;
  }
  if ((unint64_t)(a5 - 10) < 2 || a5 == 1) {
    return 2;
  }
  else {
    return v5;
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

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v34 = a3;
  id v11 = a5;
  switch(a4)
  {
    case 10:
      lowPowerTemplate = self->_lowPowerTemplate;
      self->_lowPowerTemplate = 0;

      nightModeTemplate = self->_nightModeTemplate;
      self->_nightModeTemplate = 0;

      multiPalette = self->_multiPalette;
      self->_multiPalette = 0;

      objc_msgSend__updateViewColorsWithMultiPalette(self, v15, v16, v17);
      double v21 = objc_msgSend_delegate(self, v18, v19, v20);
      objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(v21, v22, v23, v24);

      break;
    case 11:
      uint64_t v25 = objc_msgSend_timeMode(v34, v8, v9, v10);
      objc_msgSend_setTimeMode_(self, v26, v25, v27);
      break;
    case 12:
      uint64_t v28 = objc_msgSend_bezelStyle(v34, v8, v9, v10);
      objc_msgSend_setBezelStyle_(self, v29, v28, v30);
      break;
    case 18:
      uint64_t v31 = objc_msgSend_nightMode(v34, v8, v9, v10);
      objc_msgSend_setNightMode_(self, v32, v31, v33);
      break;
    default:
      break;
  }
}

+ (id)imageViewWithSymbolName:(id)a3 font:(id)a4
{
  unint64_t v5 = (void *)MEMORY[0x263F1C6C8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_configurationWithFont_(v5, v7, (uint64_t)a4, v8);
  id v11 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v10, (uint64_t)v6, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_imageWithRenderingMode_(v11, v12, 2, v13);

  id v15 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v18 = objc_msgSend_initWithImage_(v15, v16, (uint64_t)v14, v17);

  return v18;
}

- (unint64_t)timeMode
{
  return self->_timeMode;
}

- (void)setTimeMode:(unint64_t)a3
{
  self->_timeMode = a3;
  objc_msgSend__applyConfiguration(self, a2, a3, v3);
}

- (unint64_t)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(unint64_t)a3
{
  self->_nightMode = a3;
  double v5 = 0.0;
  if (a3 == 1) {
    double v5 = 1.0;
  }
  self->_nightModeFraction = v5;
  objc_msgSend__applyMultiPaletteFractions(self, a2, a3, v3);
  objc_msgSend_delegate(self, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(v12, v9, v10, v11);
}

- (BOOL)_nightModeActiveFor:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)_nightModeActive
{
  return objc_msgSend__nightModeActiveFor_(self, a2, self->_nightMode, v2);
}

- (double)_horizontalPaddingForStatusBar
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v4 = objc_msgSend_device(self, a2, v2, v3, 0, 0, 0, 0, 0);
  sub_246B3B7BC(v4, &v6);

  return *((double *)&v7 + 1);
}

- (double)_verticalPaddingForStatusBar
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = objc_msgSend_device(self, a2, v2, v3, 0, 0, 0, 0, 0, 0);
  sub_246B3B7BC(v4, &v6);

  return *(double *)&v7;
}

- (id)overrideColorForStatusBar
{
  return self->_statusBarOverrideColor;
}

- (BOOL)_wantsStatusBarIconShadow
{
  uint64_t v4 = objc_msgSend__multiPalette(self, a2, v2, v3);
  long long v8 = objc_msgSend_isFullScreen(v4, v5, v6, v7);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  BOOL v13 = v12 > 0.0;

  return v13;
}

- (void)_alignCenterSignalStrengthView
{
  double v5 = objc_msgSend_complicationFactory(self, a2, v2, v3);
  long long v8 = objc_msgSend_factoryAtSlot_(v5, v6, *MEMORY[0x263F57848], v7);
  int isHidden = objc_msgSend_isHidden(self->_signalStrengthView, v9, v10, v11);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  memset(v39, 0, sizeof(v39));
  uint64_t v16 = objc_msgSend_device(self, v13, v14, v15);
  sub_246B3B7BC(v16, v39);

  double v20 = *(double *)&v42 * 0.5;
  double v21 = 0.0;
  if (!isHidden) {
    double v21 = *(double *)&v42 * 0.5;
  }
  double v22 = *((double *)&v40 + 1) - v21;
  objc_msgSend_verticalCenterOffset(v8, v17, v18, v19);
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    objc_msgSend_setVerticalCenterOffset_(v8, v23, v24, v25, v22);
    objc_msgSend__loadLayoutRules(self, v26, v27, v28);
    objc_msgSend_layoutComplicationViews(self, v29, v30, v31);
  }
  if (isHidden)
  {
    CGAffineTransformMakeTranslation(&v37, 0.0, v20);
    objc_msgSend_setTransform_(self->_headingView, v32, (uint64_t)v36, v33, *(void *)&v37.a, *(void *)&v37.b, *(void *)&v37.c, *(void *)&v37.d, *(void *)&v37.tx, *(void *)&v37.ty);
  }
  else
  {
    headingView = self->_headingView;
    long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v38[0] = *MEMORY[0x263F000D0];
    v38[1] = v35;
    v38[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    objc_msgSend_setTransform_(headingView, v23, (uint64_t)v38, v25, v36[0], v36[1], v36[2]);
  }
}

- (void)_applyHeadingLabelConfiguration
{
  BOOL v4 = objc_msgSend__effectiveCompassRingModeForTimeMode_compassMode_bezelStyle_(self, a2, self->_timeMode, self->_compassMode, self->_bezelStyle) == 2;

  objc_msgSend__applyHeadingLabelVisible_(self, v3, v4, v5);
}

- (void)_applyHeadingLabelVisible:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_setHidden_(self->_headingView, a2, !a3, v3);
  if (v4) {
    objc_msgSend_setAlpha_(self->_headingView, v6, v7, v8, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_headingView, v6, v7, v8, 0.0);
  }
  objc_msgSend_normalComplicationDisplayWrapperForSlot_(self, v9, *MEMORY[0x263F57848], v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v13, v11, v4, v12);
}

- (void)_applyHeadingLabelCompassFraction:(double)a3
{
  double v4 = a3 + -0.5 + a3 + -0.5;
  CLKInterpolateBetweenFloatsClipped();
  double v6 = v5;
  objc_msgSend_setHidden_(self->_headingView, v7, v4 == 0.0, v8);
  objc_msgSend_setAlpha_(self->_headingView, v9, v10, v11, v4);
  uint64_t v14 = objc_msgSend_normalComplicationDisplayWrapperForSlot_(self, v12, *MEMORY[0x263F57848], v13);
  if (v14)
  {
    id v24 = v14;
    objc_msgSend_setHidden_(v14, v15, fabs(v6) < 0.00000011920929, v16);
    double v20 = objc_msgSend_display(v24, v17, v18, v19);
    objc_msgSend_setAlpha_(v20, v21, v22, v23, v6);

    uint64_t v14 = v24;
  }
}

- (void)configureComplicationViewDisplayWrapper:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NTKGalleonFaceView;
  id v7 = a4;
  [(NTKGalleonFaceView *)&v18 configureComplicationViewDisplayWrapper:v6 forSlot:v7];
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, *MEMORY[0x263F57848], v9, v18.receiver, v18.super_class);

  if (isEqualToString)
  {
    headingView = self->_headingView;
    if (headingView)
    {
      uint64_t v15 = objc_msgSend_isHidden(headingView, v11, v12, v13) ^ 1;
      objc_msgSend_setHidden_(v6, v16, v15, v17);
    }
    else
    {
      objc_msgSend_setHidden_(v6, v11, 1, v13);
    }
  }
}

- (id)idealizedLocation
{
  uint64_t v2 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_GPS_RING_LAT_DEFAULT", @"default latitude");
  objc_msgSend_doubleValue(v2, v3, v4, v5);
  double v7 = v6;
  uint64_t v9 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v8, @"GALLEON_GPS_RING_LONG_DEFAULT", @"default longitude");
  objc_msgSend_doubleValue(v9, v10, v11, v12);
  double v14 = v13;
  id v15 = objc_alloc(MEMORY[0x263F00A50]);
  uint64_t v19 = objc_msgSend_initWithLatitude_longitude_(v15, v16, v17, v18, v7, v14);

  return v19;
}

- (void)setBezelStyle:(unint64_t)a3
{
  self->_bezelStyle = a3;
  objc_msgSend__applyConfiguration(self, a2, a3, v3);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v35 = a4;
  id v12 = a5;
  id v16 = a7;
  switch(a6)
  {
    case 10:
      objc_msgSend__applyTransitionFraction_fromColor_toColor_(self, v13, (uint64_t)v35, (uint64_t)v12, a3);
      break;
    case 11:
      uint64_t v17 = objc_msgSend_timeMode(v35, v13, v14, v15);
      uint64_t v21 = objc_msgSend_timeMode(v12, v18, v19, v20);
      objc_msgSend__applyTransitionFraction_fromTimeMode_toTimeMode_(self, v22, v17, v21, a3);
      break;
    case 12:
      uint64_t v23 = objc_msgSend_bezelStyle(v35, v13, v14, v15);
      uint64_t v27 = objc_msgSend_bezelStyle(v12, v24, v25, v26);
      objc_msgSend__applyTransitionFraction_fromBezelStyle_toBezelStyle_(self, v28, v23, v27, a3);
      break;
    case 18:
      uint64_t v29 = objc_msgSend_nightMode(v35, v13, v14, v15);
      uint64_t v33 = objc_msgSend_nightMode(v12, v30, v31, v32);
      objc_msgSend__applyTransitionFraction_fromNightMode_toNightMode_(self, v34, v29, v33, a3);
      break;
    default:
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromBezelStyle:(unint64_t)a4 toBezelStyle:(unint64_t)a5
{
  if (a3 != 0.0 || a4 != a5) {
    objc_msgSend__applyTransitionFromTimeMode_fromCompassMode_fromBezelStyle_fromNightMode_toTimeMode_toCompassMode_toBezelStyle_toNightMode_animationStyle_fraction_(self, a2, self->_timeMode, self->_compassMode, a4, a5, self->_nightMode, 0);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromTimeMode:(unint64_t)a4 toTimeMode:(unint64_t)a5
{
  if (a3 != 0.0 || a4 != a5)
  {
    unint64_t compassMode = self->_compassMode;
    unint64_t bezelStyle = self->_bezelStyle;
    if (self->_timeMode == a5) {
      objc_msgSend__applyTransitionFromTimeMode_fromCompassMode_fromBezelStyle_fromNightMode_toTimeMode_toCompassMode_toBezelStyle_toNightMode_animationStyle_fraction_(self, a2, a5, compassMode, 1.0 - a3, bezelStyle, self->_nightMode, 2);
    }
    else {
      objc_msgSend__applyTransitionFromTimeMode_fromCompassMode_fromBezelStyle_fromNightMode_toTimeMode_toCompassMode_toBezelStyle_toNightMode_animationStyle_fraction_(self, a2, a4, compassMode, a3, bezelStyle, self->_nightMode, 2);
    }
  }
}

- (unint64_t)_compassRingModeForTimeMode:(unint64_t)a3
{
  return a3 != 0;
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

- (id)_lowPowerTemplate
{
  lowPowerTemplate = self->_lowPowerTemplate;
  if (!lowPowerTemplate)
  {
    objc_msgSend__createLowPowerTemplate(self, a2, v2, v3);
    double v6 = (NTKGalleonFaceColorPalette *)objc_claimAutoreleasedReturnValue();
    double v7 = self->_lowPowerTemplate;
    self->_lowPowerTemplate = v6;

    lowPowerTemplate = self->_lowPowerTemplate;
  }

  return lowPowerTemplate;
}

- (void)_applyLowPowerModeFraction:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a3;
    _os_log_impl(&dword_246B32000, v5, OS_LOG_TYPE_DEFAULT, "LowPowerMonitor updating multi-palette with low power fraction %f", (uint8_t *)&v9, 0xCu);
  }

  self->_lowPowerFraction = a3;
  if (a3 == 0.0 || a3 == 1.0) {
    objc_msgSend__updateAveragePixelLuminance(self, v6, v7, v8);
  }
  objc_msgSend__applyMultiPaletteFractions(self, v6, v7, v8);
}

- (void)_applyMultiPaletteFractions
{
  v33[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_numberWithDouble_(NSNumber, a2, v2, v3, self->_tritiumFraction);
  int v9 = objc_msgSend_numberWithDouble_(NSNumber, v6, v7, v8, self->_compassFraction, v5);
  v33[1] = v9;
  double v13 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, self->_nightModeFraction);
  v33[2] = v13;
  uint64_t v17 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, self->_lowPowerFraction);
  v33[3] = v17;
  uint64_t v21 = objc_msgSend_numberWithDouble_(NSNumber, v18, v19, v20, self->_editingComplicationsFraction);
  v33[4] = v21;
  uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v33, 5);

  uint64_t v27 = objc_msgSend__multiPalette(self, v24, v25, v26);
  objc_msgSend_setTransitionFractions_(v27, v28, (uint64_t)v23, v29);

  objc_msgSend__updateViewColorsWithMultiPalette(self, v30, v31, v32);
}

- (void)_updateStatusBar
{
  if (fabs(self->_nightModeFraction) >= 0.00000011920929)
  {
    objc_msgSend__statusBarColorForNightModeFraction_(self, a2, v2, v3);
    double v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    statusBarOverrideColor = self->_statusBarOverrideColor;
    self->_statusBarOverrideColor = v6;
  }
  else
  {
    statusBarOverrideColor = self->_statusBarOverrideColor;
    self->_statusBarOverrideColor = 0;
  }

  double v10 = objc_msgSend_delegate(self, v7, v8, v9);
  id v15 = v10;
  double nightModeFraction = self->_nightModeFraction;
  BOOL v14 = fabs(nightModeFraction) < 0.00000011920929;
  if (fabs(nightModeFraction + -1.0) < 0.00000011920929) {
    objc_msgSend_faceViewDidChangeStatusBarOverrideColor_(v10, v11, 1, v12);
  }
  else {
    objc_msgSend_faceViewDidChangeStatusBarOverrideColor_(v10, v11, v14, v12);
  }
}

- (id)_nightModeTemplate
{
  nightModeTemplate = self->_nightModeTemplate;
  if (!nightModeTemplate)
  {
    double v6 = objc_msgSend_colorPalette(self, a2, v2, v3);
    double v10 = (NTKGalleonFaceColorPalette *)objc_msgSend_copy(v6, v7, v8, v9);
    uint64_t v11 = self->_nightModeTemplate;
    self->_nightModeTemplate = v10;

    objc_msgSend_setNightMode_(self->_nightModeTemplate, v12, 1, v13);
    nightModeTemplate = self->_nightModeTemplate;
  }

  return nightModeTemplate;
}

- (id)_nightModeInterpolator
{
  return &unk_26FB126B0;
}

- (void)_applyNightModeFraction:(double)a3
{
  self->_double nightModeFraction = a3;
  if (a3 == 0.0 || a3 == 1.0) {
    objc_msgSend__updateAveragePixelLuminance(self, a2, v3, v4);
  }

  objc_msgSend__applyMultiPaletteFractions(self, a2, v3, v4);
}

- (id)_statusBarColorForNightModeFraction:(double)a3
{
  uint64_t v7 = objc_msgSend_blackColor(MEMORY[0x263F1C550], a2, v3, v4);
  uint64_t v11 = v7;
  if (a3 >= 0.5)
  {
    uint64_t v13 = objc_msgSend_colorPalette(self, v8, v9, v10);
    uint64_t v17 = objc_msgSend_statusBar_night(v13, v14, v15, v16);
    uint64_t v12 = MEMORY[0x24C542630](v11, v17, a3 + -0.5 + a3 + -0.5);
  }
  else
  {
    uint64_t v12 = objc_msgSend_colorWithAlphaComponent_(v7, v8, v9, v10, a3 + a3);
  }

  return v12;
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  objc_msgSend_interpolatedColorPalette(self, a2, (uint64_t)a4, (uint64_t)a5, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateViewColorsWithPalette_(self, v6, (uint64_t)v8, v7);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKGalleonFaceView;
  id v6 = a4;
  id v7 = a3;
  [(NTKGalleonFaceView *)&v11 _configureComplicationView:v7 forSlot:v6];
  objc_msgSend__applyComplicationFont_(self, v8, (uint64_t)v7, v9, v11.receiver, v11.super_class);
  objc_msgSend__applyComplicationColor_slot_(self, v10, (uint64_t)v7, (uint64_t)v6);
}

- (void)_updateViewColorsWithMultiPalette
{
  objc_msgSend__multiPalette(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateViewColorsWithPalette_(self, v5, (uint64_t)v7, v6);
}

- (void)_updateViewColorsWithPalette:(id)a3
{
  id v69 = a3;
  objc_msgSend_begin(MEMORY[0x263F158F8], v4, v5, v6);
  objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v7, 1, v8);
  objc_msgSend__applyPaletteToComplications_(self, v9, (uint64_t)v69, v10);
  BOOL v14 = objc_msgSend_layer(self->_backgroundView, v11, v12, v13);
  objc_msgSend_backgroundColor(v69, v15, v16, v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_CGColor(v18, v19, v20, v21);
  objc_msgSend_setBackgroundColor_(v14, v23, v22, v24);

  if (!self->_simplifiedTransitions)
  {
    uint64_t v28 = objc_msgSend_layer(self->_compassRingView, v25, v26, v27);
    objc_msgSend_outerShadow(v69, v29, v30, v31);
    id v32 = objc_claimAutoreleasedReturnValue();
    uint64_t v36 = objc_msgSend_CGColor(v32, v33, v34, v35);
    objc_msgSend_setShadowColor_(v28, v37, v36, v38);
  }
  uint64_t v39 = objc_msgSend_timeView(self, v25, v26, v27);
  objc_msgSend_setPalette_(v39, v40, (uint64_t)v69, v41);
  objc_msgSend_setPalette_(self->_timeRingView, v42, (uint64_t)v69, v43);
  objc_msgSend_setPalette_(self->_gpsRingView, v44, (uint64_t)v69, v45);
  objc_msgSend_setPalette_(self->_compassRingView, v46, (uint64_t)v69, v47);
  v51 = objc_msgSend_headingLabelColor(v69, v48, v49, v50);
  objc_msgSend_setTextColor_(self->_headingView, v52, (uint64_t)v51, v53);
  objc_msgSend_setPalette_(self->_signalStrengthView, v54, (uint64_t)v69, v55);
  triangleView = self->_triangleView;
  uint64_t v60 = objc_msgSend_compassMarkerColor(v69, v57, v58, v59);
  objc_msgSend_setTintColor_(triangleView, v61, (uint64_t)v60, v62);

  objc_msgSend__updateStatusBar(self, v63, v64, v65);
  objc_msgSend_commit(MEMORY[0x263F158F8], v66, v67, v68);
}

- (void)_applyPaletteToComplications:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246B3E7D8;
  v8[3] = &unk_2651F8E88;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_enumerateComplicationDisplayWrappersWithBlock_(self, v6, (uint64_t)v8, v7);
}

- (void)_applyComplicationColor:(id)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend__multiPalette(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__applyComplicationColor_withPalette_slot_(self, v11, (uint64_t)v7, (uint64_t)v12, v6);
}

- (void)_applyComplicationColor:(id)a3 withPalette:(id)a4 slot:(id)a5
{
  id v104 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_display(v104, v10, v11, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__applyComplicationColor_withPalette_slot_(self, v14, (uint64_t)v13, (uint64_t)v8, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      cornerFilterProvider = self->_cornerFilterProvider;
      uint64_t v19 = objc_msgSend_secondaryCornerComplicationColor(v8, v15, v16, v17);
      objc_msgSend_setAccentColor_(cornerFilterProvider, v20, (uint64_t)v19, v21);

      uint64_t v22 = self->_cornerFilterProvider;
      uint64_t v26 = objc_msgSend_primaryCornerComplicationColor(v8, v23, v24, v25);
      objc_msgSend_setNonAccentColor_(v22, v27, (uint64_t)v26, v28);

      uint64_t v29 = self->_cornerFilterProvider;
      uint64_t v33 = objc_msgSend_backgroundColor(v8, v30, v31, v32);
      objc_msgSend_setBackgroundColor_(v29, v34, (uint64_t)v33, v35);

      centerFilterProvider = self->_centerFilterProvider;
      long long v40 = objc_msgSend_secondaryComplicationColor(v8, v37, v38, v39);
      objc_msgSend_setAccentColor_(centerFilterProvider, v41, (uint64_t)v40, v42);

      uint64_t v43 = self->_centerFilterProvider;
      uint64_t v47 = objc_msgSend_primaryComplicationColor(v8, v44, v45, v46);
      objc_msgSend_setNonAccentColor_(v43, v48, (uint64_t)v47, v49);

      id v13 = v104;
      if (objc_msgSend_conformsToProtocol_(v13, v50, (uint64_t)&unk_26FB3B018, v51))
      {
        double nightModeFraction = self->_nightModeFraction;
        double v56 = fmin(nightModeFraction / 0.4, 1.0);
        double v57 = fmax(nightModeFraction + -0.4, 0.0) / 0.6;
        nightModeWorldClockDaytimePlatterColor = self->_nightModeWorldClockDaytimePlatterColor;
        uint64_t v59 = (void *)MEMORY[0x263F1C550];
        uint64_t v60 = nightModeWorldClockDaytimePlatterColor;
        id v61 = v13;
        uint64_t v65 = objc_msgSend_clearColor(v59, v62, v63, v64);
        uint64_t v66 = MEMORY[0x24C542630](v65, v60, v57);

        objc_msgSend_setTintedFraction_(v61, v67, v68, v69, v56);
        objc_msgSend_setTintedPlatterColor_(v61, v70, (uint64_t)v66, v71);
      }
      uint64_t v72 = objc_msgSend_isFullColor(v8, v52, v53, v54);
      objc_msgSend_floatValue(v72, v73, v74, v75);
      uint64_t v79 = objc_msgSend_isNightMode(v8, v76, v77, v78);
      objc_msgSend_floatValue(v79, v80, v81, v82);
      CLKInterpolateBetweenFloatsClipped();
      double v84 = 1.0 - v83;

      if (v84 == 1.0) {
        objc_msgSend_updateMonochromeColor(v13, v85, v86, v87);
      }
      else {
        objc_msgSend_transitionToMonochromeWithFraction_(v13, v85, v86, v87, v84);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v88 = v104;
        objc_msgSend_simpleTextComplicationColor(v8, v89, v90, v91);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        double v95 = objc_msgSend_label(v88, v92, v93, v94);

        objc_msgSend_setTextColor_(v95, v96, (uint64_t)v13, v97);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        id v98 = v104;
        objc_msgSend_simpleTextComplicationColor(v8, v99, v100, v101);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTextColor_(v98, v102, (uint64_t)v13, v103);
      }
    }
  }

LABEL_14:
}

- (void)_applyComplicationFont:(id)a3
{
  id v32 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_msgSend_display(v32, v4, v5, v6);
    objc_msgSend__applyComplicationFont_(self, v8, (uint64_t)v7, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_setFontStyle_(v32, v10, 2, v11);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v32;
        uint64_t v16 = objc_msgSend_device(self, v13, v14, v15);
        sub_246B3B7BC(v16, v33);
        double v17 = v34;

        id v18 = (void *)MEMORY[0x263EFD198];
        uint64_t v22 = objc_msgSend__galleonSimpleComplicationFontDescriptor(NTKGalleonFaceView, v19, v20, v21);
        uint64_t v25 = objc_msgSend_fontWithDescriptor_size_(v18, v23, (uint64_t)v22, v24, v17);
        uint64_t v29 = objc_msgSend_CLKFontWithAlternativePunctuation(v25, v26, v27, v28);
        objc_msgSend_setFont_(v12, v30, (uint64_t)v29, v31);
      }
    }
  }
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v73.receiver = self;
  v73.super_class = (Class)NTKGalleonFaceView;
  -[NTKGalleonFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v73, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  objc_msgSend__transformForBreathingFraction_(self, v8, v9, v10, a3);
  if ((unint64_t)(a4 - 11) > 1)
  {
    CGAffineTransform v37 = objc_msgSend_contentView(self, v11, v12, v13);
    long long v67 = v70;
    long long v68 = v71;
    long long v69 = v72;
    objc_msgSend_setTransform_(v37, v38, (uint64_t)&v67, v39);

    uint64_t v43 = objc_msgSend_complicationContainerView(self, v40, v41, v42);
    long long v67 = v70;
    long long v68 = v71;
    long long v69 = v72;
    objc_msgSend_setTransform_(v43, v44, (uint64_t)&v67, v45);

    compassRingView = self->_compassRingView;
    long long v66 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v67 = *MEMORY[0x263F000D0];
    long long v64 = v67;
    long long v68 = v66;
    long long v69 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v62 = v69;
    objc_msgSend_setTransform_(compassRingView, v47, (uint64_t)&v67, v48);
    gpsRingView = self->_gpsRingView;
    long long v67 = v64;
    long long v68 = v66;
    long long v69 = v62;
    objc_msgSend_setTransform_(gpsRingView, v50, (uint64_t)&v67, v51);
    timeRingView = self->_timeRingView;
    long long v67 = v64;
    long long v68 = v66;
    long long v69 = v62;
    objc_msgSend_setTransform_(timeRingView, v53, (uint64_t)&v67, v54);
    headingView = self->_headingView;
    long long v67 = v64;
    long long v68 = v66;
    long long v69 = v62;
    objc_msgSend_setTransform_(headingView, v56, (uint64_t)&v67, v57);
  }
  else
  {
    uint64_t v14 = self->_compassRingView;
    long long v67 = v70;
    long long v68 = v71;
    long long v69 = v72;
    objc_msgSend_setTransform_(v14, v11, (uint64_t)&v67, v13);
    uint64_t v15 = self->_gpsRingView;
    long long v67 = v70;
    long long v68 = v71;
    long long v69 = v72;
    objc_msgSend_setTransform_(v15, v16, (uint64_t)&v67, v17);
    id v18 = self->_timeRingView;
    long long v67 = v70;
    long long v68 = v71;
    long long v69 = v72;
    objc_msgSend_setTransform_(v18, v19, (uint64_t)&v67, v20);
    if (a4 == 12)
    {
      uint64_t v24 = self->_headingView;
      long long v67 = v70;
      long long v68 = v71;
      long long v69 = v72;
      objc_msgSend_setTransform_(v24, v21, (uint64_t)&v67, v23);
    }
    uint64_t v25 = objc_msgSend_contentView(self, v21, v22, v23);
    long long v65 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v67 = *MEMORY[0x263F000D0];
    long long v63 = v67;
    long long v68 = v65;
    long long v69 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v61 = v69;
    objc_msgSend_setTransform_(v25, v26, (uint64_t)&v67, v27);

    uint64_t v31 = objc_msgSend_complicationContainerView(self, v28, v29, v30);
    long long v67 = v63;
    long long v68 = v65;
    long long v69 = v61;
    objc_msgSend_setTransform_(v31, v32, (uint64_t)&v67, v33);
  }
  uint64_t v58 = objc_msgSend_timeView(self, v34, v35, v36);
  long long v67 = v70;
  long long v68 = v71;
  long long v69 = v72;
  objc_msgSend_setTransform_(v58, v59, (uint64_t)&v67, v60);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)NTKGalleonFaceView;
  -[NTKGalleonFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v17, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
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

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  return 1.0;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return 0;
}

- (int64_t)_swatchImageContentMode
{
  return 2;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &unk_26FB198F0;
  CGFloat v5 = &unk_26FB198C0;
  if (a3 != 12) {
    CGFloat v5 = 0;
  }
  if (a3 != 18) {
    id v4 = v5;
  }
  if (a3 == 11) {
    return &unk_26FB198D8;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)&unk_26FB194D0, v11);
  objc_super v17 = objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)&unk_26FB194B8, v14);
  if (a4 != 18)
  {
    if (a4 == 12)
    {
      v107 = NSString;
      v108 = v12;
      id v109 = v8;
      uint64_t v23 = objc_msgSend_stringWithFormat_(v107, v110, @"Bezel-%@-%@-%@", v111, v109, v17, v108);
      uint64_t v30 = objc_msgSend_bezelStyle(v109, v112, v113, v114);

      uint64_t v12 = v108;
      uint64_t v27 = 0;
      if (v23) {
        goto LABEL_7;
      }
    }
    else if (a4 == 11)
    {
      id v18 = NSString;
      uint64_t v19 = v12;
      id v20 = v8;
      uint64_t v23 = objc_msgSend_stringWithFormat_(v18, v21, @"Density-%@-%@-%@", v22, v20, v17, v19);
      uint64_t v27 = objc_msgSend_timeMode(v20, v24, v25, v26);

      uint64_t v12 = v19;
      goto LABEL_6;
    }
LABEL_15:
    v117.receiver = self;
    v117.super_class = (Class)NTKGalleonFaceView;
    double v34 = [(NTKGalleonFaceView *)&v117 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
    goto LABEL_16;
  }
  uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v15, @"Night-%@", v16, v8);
  uint64_t v27 = 0;
LABEL_6:
  uint64_t v30 = 2;
  if (!v23) {
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v31 = (void *)qword_2691D5970;
  if (!qword_2691D5970)
  {
    uint64_t v32 = objc_opt_new();
    uint64_t v33 = (void *)qword_2691D5970;
    qword_2691D5970 = v32;

    uint64_t v31 = (void *)qword_2691D5970;
  }
  double v34 = objc_msgSend_objectForKey_(v31, v28, (uint64_t)v23, v29);
  if (!v34)
  {
    v116 = v12;
    uint64_t v35 = [NTKGalleonFaceView alloc];
    uint64_t v39 = objc_msgSend_device(self, v36, v37, v38);
    uint64_t v41 = objc_msgSend_initWithFaceStyle_forDevice_clientIdentifier_(v35, v40, 44, (uint64_t)v39, 0);

    objc_msgSend_frame(self, v42, v43, v44);
    objc_msgSend_setFrame_(v41, v45, v46, v47);
    objc_msgSend__loadSnapshotContentViews(v41, v48, v49, v50);
    objc_msgSend_setOption_forCustomEditMode_slot_(v41, v51, (uint64_t)v8, a4, 0);
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = sub_246B3F5D0;
    v118[3] = &unk_2651F8EB0;
    int64_t v120 = a4;
    v52 = v41;
    v119 = v52;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v53, (uint64_t)v118, v54);
    objc_msgSend__applyTimeMode_compassMode_bezelStyle_(v52, v55, v27, a4 == 12, v30);
    if (a4 == 12)
    {
      objc_msgSend_setHeading_(v52[123], v56, v57, v58, 330.0);
      objc_msgSend_galleon_setHeading_(v52[124], v59, v60, v61, 330.0);
      id v62 = v52[122];
      objc_msgSend_setIncline_(v62, v63, v64, v65, 45.0);
      objc_msgSend_setAltitude_(v62, v66, v67, v68, 4420.0);
      objc_msgSend_setLatency_(v62, v69, v70, v71, 0.0);
      uint64_t v75 = objc_msgSend_idealizedLocation(self, v72, v73, v74);
      objc_msgSend_locationUpdated_(v62, v76, (uint64_t)v75, v77);
    }
    uint64_t v78 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v56, v57, v58);
    objc_msgSend_setBackgroundColor_(v52[110], v79, (uint64_t)v78, v80);

    objc_msgSend_setHidden_(v52[125], v81, 1, v82);
    objc_msgSend_setShowsCanonicalContent_(v52, v83, 1, v84);
    objc_super v85 = NTKIdealizedDate();
    objc_msgSend_setOverrideDate_duration_(v52, v86, (uint64_t)v85, v87, 0.0);

    objc_msgSend_frame(self, v88, v89, v90);
    objc_msgSend_setFrame_(v52, v91, v92, v93);
    objc_msgSend_bounds(v52, v94, v95, v96);
    v122.double width = v97;
    v122.double height = v98;
    UIGraphicsBeginImageContextWithOptions(v122, 0, 0.0);
    uint64_t v102 = objc_msgSend_layer(v52, v99, v100, v101);
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend_renderInContext_(v102, v104, (uint64_t)CurrentContext, v105);

    double v34 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    objc_msgSend_setObject_forKey_((void *)qword_2691D5970, v106, (uint64_t)v34, (uint64_t)v23);

    uint64_t v12 = v116;
  }

LABEL_16:

  return v34;
}

- (id)createFaceColorPalette
{
  uint64_t v3 = [NTKGalleonFaceColorPalette alloc];
  uint64_t v4 = objc_opt_class();
  id v7 = objc_msgSend_initWithFaceClass_(v3, v5, v4, v6);
  uint64_t v11 = objc_msgSend_compassMode(self, v8, v9, v10);
  objc_msgSend_setCompassMode_(v7, v12, v11, v13);

  return v7;
}

- (id)_createLowPowerTemplate
{
  uint64_t v4 = objc_msgSend_colorPalette(self, a2, v2, v3);
  objc_msgSend_setLowPowerMode_(v4, v5, 1, v6);
  uint64_t v10 = objc_msgSend_tritiumPalette(v4, v7, v8, v9);

  return v10;
}

- (id)colorPalette
{
  return (id)((uint64_t (*)(NTKGalleonFaceView *, char *))MEMORY[0x270F9A6D0])(self, sel_faceColorPalette);
}

- (id)_multiPalette
{
  v180[32] = *MEMORY[0x263EF8340];
  unint64_t v5 = 0x263EFF000;
  if (!self->_multiPalette)
  {
    uint64_t v6 = objc_msgSend_colorPalette(self, a2, v2, v3);
    uint64_t v9 = objc_msgSend_editingPaletteForEditMode_(v6, v7, 1, v8);

    uint64_t v13 = objc_msgSend_colorPalette(self, v10, v11, v12);
    objc_super v17 = objc_msgSend_copy(v13, v14, v15, v16);

    objc_msgSend_setCompassMode_(v17, v18, 1, v19);
    uint64_t v23 = objc_msgSend__nightModeTemplate(self, v20, v21, v22);
    uint64_t v27 = objc_msgSend_copy(v23, v24, v25, v26);

    objc_msgSend_setCompassMode_(v27, v28, 1, v29);
    uint64_t v33 = objc_msgSend__lowPowerTemplate(self, v30, v31, v32);
    uint64_t v37 = objc_msgSend_copy(v33, v34, v35, v36);

    objc_msgSend_setCompassMode_(v37, v38, 1, v39);
    id v164 = objc_alloc(MEMORY[0x263F57A28]);
    v178 = objc_msgSend_colorPalette(self, v40, v41, v42);
    v180[0] = v178;
    uint64_t v176 = objc_msgSend_colorPalette(self, v43, v44, v45);
    v175 = objc_msgSend_tritiumPalette(v176, v46, v47, v48);
    v180[1] = v175;
    v180[2] = v17;
    v177 = v17;
    v174 = objc_msgSend_tritiumPalette(v17, v49, v50, v51);
    v180[3] = v174;
    uint64_t v173 = objc_msgSend__nightModeTemplate(self, v52, v53, v54);
    v180[4] = v173;
    uint64_t v172 = objc_msgSend__nightModeTemplate(self, v55, v56, v57);
    double v170 = objc_msgSend_tritiumPalette(v172, v58, v59, v60);
    v180[5] = v170;
    v180[6] = v27;
    double v169 = objc_msgSend_tritiumPalette(v27, v61, v62, v63);
    v180[7] = v169;
    double v167 = objc_msgSend__lowPowerTemplate(self, v64, v65, v66);
    v180[8] = v167;
    double v166 = objc_msgSend__lowPowerTemplate(self, v67, v68, v69);
    double v165 = objc_msgSend_tritiumPalette(v166, v70, v71, v72);
    v180[9] = v165;
    v180[10] = v37;
    v171 = v37;
    double v163 = objc_msgSend_tritiumPalette(v37, v73, v74, v75);
    v180[11] = v163;
    uint64_t v162 = objc_msgSend__nightModeTemplate(self, v76, v77, v78);
    v180[12] = v162;
    uint64_t v161 = objc_msgSend__nightModeTemplate(self, v79, v80, v81);
    v160 = objc_msgSend_tritiumPalette(v161, v82, v83, v84);
    v180[13] = v160;
    v180[14] = v27;
    double v168 = v27;
    id v159 = objc_msgSend_tritiumPalette(v27, v85, v86, v87);
    v180[15] = v159;
    v180[16] = v9;
    uint64_t v158 = objc_msgSend_tritiumPalette(v9, v88, v89, v90);
    v180[17] = v158;
    v180[18] = v9;
    v157 = objc_msgSend_tritiumPalette(v9, v91, v92, v93);
    v180[19] = v157;
    v180[20] = v9;
    CGFloat v97 = objc_msgSend_tritiumPalette(v9, v94, v95, v96);
    v180[21] = v97;
    v180[22] = v9;
    uint64_t v101 = objc_msgSend_tritiumPalette(v9, v98, v99, v100);
    v180[23] = v101;
    v180[24] = v9;
    uint64_t v105 = objc_msgSend_tritiumPalette(v9, v102, v103, v104);
    v180[25] = v105;
    v180[26] = v9;
    id v109 = objc_msgSend_tritiumPalette(v9, v106, v107, v108);
    v180[27] = v109;
    v180[28] = v9;
    uint64_t v113 = objc_msgSend_tritiumPalette(v9, v110, v111, v112);
    v180[29] = v113;
    v180[30] = v9;
    objc_super v117 = objc_msgSend_tritiumPalette(v9, v114, v115, v116);
    v180[31] = v117;
    v119 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v118, (uint64_t)v180, 32);
    CGSize v122 = (NTKGalleonColorPalette *)objc_msgSend_initWithPalettes_(v164, v120, (uint64_t)v119, v121);
    multiPalette = self->_multiPalette;
    self->_multiPalette = v122;

    unint64_t v5 = 0x263EFF000uLL;
  }
  CGFloat v124 = objc_msgSend__nightModeInterpolator(self, a2, v2, v3);
  v125 = (void *)MEMORY[0x24C5428F0]();
  v129 = objc_msgSend_colorInterpolators(self->_multiPalette, v126, v127, v128);
  objc_msgSend_setObject_atIndexedSubscript_(v129, v130, (uint64_t)v125, 2);

  uint64_t v134 = objc_msgSend_numberWithDouble_(NSNumber, v131, v132, v133, self->_tritiumFraction);
  v179[0] = v134;
  uint64_t v138 = objc_msgSend_numberWithDouble_(NSNumber, v135, v136, v137, self->_compassFraction);
  v179[1] = v138;
  long long v142 = objc_msgSend_numberWithDouble_(NSNumber, v139, v140, v141, self->_nightModeFraction);
  v179[2] = v142;
  v146 = objc_msgSend_numberWithDouble_(NSNumber, v143, v144, v145, self->_lowPowerFraction);
  v179[3] = v146;
  v150 = objc_msgSend_numberWithDouble_(NSNumber, v147, v148, v149, self->_editingComplicationsFraction);
  v179[4] = v150;
  uint64_t v152 = objc_msgSend_arrayWithObjects_count_(*(void **)(v5 + 2240), v151, (uint64_t)v179, 5);

  objc_msgSend_setTransitionFractions_(self->_multiPalette, v153, (uint64_t)v152, v154);
  uint64_t v155 = self->_multiPalette;

  return v155;
}

+ (id)galleonFontDescriptor
{
  if (qword_2691D5980 != -1) {
    dispatch_once(&qword_2691D5980, &unk_26FB126D0);
  }
  uint64_t v2 = (void *)qword_2691D5978;

  return v2;
}

+ (id)_galleonSimpleComplicationFontDescriptor
{
  if (qword_2691D5990 != -1) {
    dispatch_once(&qword_2691D5990, &unk_26FB126F0);
  }
  uint64_t v2 = (void *)qword_2691D5988;

  return v2;
}

- (unint64_t)compassMode
{
  return self->_compassMode;
}

- (void)setCompassMode:(unint64_t)a3
{
  self->_unint64_t compassMode = a3;
}

- (unint64_t)bezelStyle
{
  return self->_bezelStyle;
}

- (NTKRoundedCornerOverlayView)cornerView
{
  return self->_cornerView;
}

- (void)setCornerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_centerFilterProvider, 0);
  objc_storeStrong((id *)&self->_cornerFilterProvider, 0);
  objc_storeStrong((id *)&self->_nightModeWorldClockDaytimePlatterColor, 0);
  objc_storeStrong((id *)&self->_subdialComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_cornerComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_statusBarOverrideColor, 0);
  objc_storeStrong((id *)&self->_whistlerComplicationFactory, 0);
  objc_storeStrong((id *)&self->_signalStrengthView, 0);
  objc_storeStrong((id *)&self->_headingView, 0);
  objc_storeStrong((id *)&self->_compassRingView, 0);
  objc_storeStrong((id *)&self->_gpsRingView, 0);
  objc_storeStrong((id *)&self->_timeRingView, 0);
  objc_storeStrong((id *)&self->_multiPalette, 0);
  objc_storeStrong((id *)&self->_lowPowerTemplate, 0);
  objc_storeStrong((id *)&self->_nightModeTemplate, 0);
  objc_storeStrong((id *)&self->_triangleView, 0);
  objc_storeStrong((id *)&self->_symbolFont, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end