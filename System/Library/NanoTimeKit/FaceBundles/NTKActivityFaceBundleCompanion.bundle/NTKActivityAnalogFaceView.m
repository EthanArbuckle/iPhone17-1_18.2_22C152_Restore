@interface NTKActivityAnalogFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
+ (void)_prewarmForDevice:(id)a3;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (CGPoint)_contentCenterOffset;
- (NTKActivityAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKActivityFaceViewFactory)faceViewFactory;
- (double)_dialAlphaForEditMode:(int64_t)a3;
- (double)_dialScaleForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_ringAlphaForEditMode:(int64_t)a3;
- (double)_verticalPaddingForStatusBar;
- (id)_accentColorForFaceColor:(id)a3;
- (id)_activityLabelFontForDigits:(int64_t)a3;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_cachedSchemeForFaceColorPalette:(id)a3;
- (id)_dateLabelFont;
- (id)_highlightImage;
- (id)_newActivityLabelSubview;
- (id)_newFaceViewFactoryForDevice:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)textLayoutStyleForSlot:(id)a3;
- (void)_addOrRemoveChronoViewsIfNecessary;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyCurrentDataModelAnimated:(BOOL)a3;
- (void)_applyCurrentDataModelByFraction:(double)a3 updateLabels:(BOOL)a4 animated:(BOOL)a5;
- (void)_applyDataMode;
- (void)_applyDataModel:(id)a3 byFraction:(double)a4 updateLabels:(BOOL)a5 ignoreScreenBlanked:(BOOL)a6 animated:(BOOL)a7;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowsCanonicalContent;
- (void)_applyShowsLockedUI;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_configureAppropriateChronoDetail;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_dateComplicationPressed:(id)a3;
- (void)_enumerateActivityLabels:(id)a3;
- (void)_enumerateChronoViews:(id)a3;
- (void)_enumerateRingGroups:(id)a3;
- (void)_launchButtonPressed:(id)a3;
- (void)_loadChronoViewsIfNecessary;
- (void)_loadDialIfNecessary;
- (void)_loadRingsViewIfNecessary;
- (void)_loadSnapshotContentViews;
- (void)_performWristRaiseAnimation;
- (void)_prepareForEditing;
- (void)_prepareWristRaiseAnimation;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setActivityViewsAlpha:(double)a3 includeDateComplication:(BOOL)a4 animated:(BOOL)a5;
- (void)_showChronoDetailByFraction:(double)a3 fillRings:(BOOL)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateActivityLabelColors:(BOOL)a3;
- (void)_updatePausedState;
- (void)applyDataModel:(id)a3 animated:(BOOL)a4;
- (void)applyDataModelWithUnfilledRings:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setDataMode:(int64_t)a3;
@end

@implementation NTKActivityAnalogFaceView

- (id)_newFaceViewFactoryForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKActivityFaceViewFactory alloc] initForAnalog:1 richComplications:0 forDevice:v3];

  return v4;
}

- (NTKActivityAnalogFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKActivityAnalogFaceView;
  v9 = [(NTKActivityAnalogFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(NTKActivityAnalogFaceView *)v9 _newFaceViewFactoryForDevice:v8];
    faceViewFactory = v10->_faceViewFactory;
    v10->_faceViewFactory = v11;

    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setFaceView:v10];
    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setDelegate:v10];
    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setDataMode:[(NTKActivityAnalogFaceView *)v10 dataMode]];
    uint64_t v13 = +[NSMutableDictionary dictionary];
    faceColorsToSchemes = v10->_faceColorsToSchemes;
    v10->_faceColorsToSchemes = (NSMutableDictionary *)v13;

    id v15 = objc_alloc((Class)UIView);
    v16 = [(NTKActivityAnalogFaceView *)v10 contentView];
    [v16 bounds];
    v17 = (UIView *)objc_msgSend(v15, "initWithFrame:");
    activityContainerView = v10->_activityContainerView;
    v10->_activityContainerView = v17;

    v19 = [(NTKActivityAnalogFaceView *)v10 contentView];
    [v19 addSubview:v10->_activityContainerView];

    v10->_innerDialViewScale = 1.0;
    [(NTKActivityAnalogFaceView *)v10 setComplicationFactory:v10->_faceViewFactory];
    v20 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Analog Face Initialized: %@", buf, 0xCu);
    }
  }
  return v10;
}

- (void)dealloc
{
  [(NTKDateComplicationController *)self->_dateComplicationController _deactivate];
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Analog Face Destroyed: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v4 dealloc];
}

- (void)setDataMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKActivityAnalogFaceView;
  -[NTKActivityAnalogFaceView setDataMode:](&v5, "setDataMode:");
  [(NTKFaceViewTapControl *)self->_tapToLaunchButton setHighlighted:0];
  [(NTKFaceViewTapControl *)self->_tapToLaunchButton setUserInteractionEnabled:a3 == 1];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setDataMode:a3];
}

- (void)_applyShowsCanonicalContent
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _applyShowsCanonicalContent];
  [(NTKActivityAnalogFaceView *)self _loadChronoViewsIfNecessary];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setShowsCanonicalContent:[(NTKActivityAnalogFaceView *)self showsCanonicalContent]];
}

- (void)_launchButtonPressed:(id)a3
{
  objc_super v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v16 = 138412546;
    v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = [(NTKActivityAnalogFaceView *)self dataMode];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ launchButtonPressed action with data mode:%u", (uint8_t *)&v16, 0x12u);
  }
  if ([(NTKActivityAnalogFaceView *)self dataMode] == (char *)&dword_0 + 1)
  {
    [(NTKActivityFaceViewFactory *)self->_faceViewFactory launchActivityApp];
    [(NTKRingsMetalQuadView *)self->_ringsView frame];
    -[NTKActivityAnalogFaceView convertRect:toView:](self, "convertRect:toView:", self);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [(NTKActivityAnalogFaceView *)self delegate];
    objc_msgSend(v15, "faceViewRequestedLaunchFromRect:", v8, v10, v12, v14);
  }
}

- (void)applyDataModel:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(NTKActivityAnalogFaceView *)self editing] & 1) == 0) {
    [(NTKActivityAnalogFaceView *)self _applyDataModel:v6 byFraction:1 updateLabels:0 ignoreScreenBlanked:v4 animated:1.0];
  }
}

- (void)applyDataModelWithUnfilledRings:(id)a3
{
}

- (void)_applyCurrentDataModelAnimated:(BOOL)a3
{
}

- (void)_applyCurrentDataModelByFraction:(double)a3 updateLabels:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(NTKActivityFaceViewFactory *)self->_faceViewFactory currentDataModel];
  [(NTKActivityAnalogFaceView *)self _applyDataModel:v9 byFraction:v6 updateLabels:0 ignoreScreenBlanked:v5 animated:a3];
}

- (void)_applyDataModel:(id)a3 byFraction:(double)a4 updateLabels:(BOOL)a5 ignoreScreenBlanked:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v50 = a7;
  id v10 = a3;
  if ([v10 activityMoveMode] == (char *)&dword_0 + 2) {
    [v10 appleMoveTimeCompletionPercentage];
  }
  else {
    [v10 activeEnergyCompletionPercentage];
  }
  double v12 = v11;
  double v13 = ARUIRingPercentageValueNoRing;
  [v10 appleExerciseTimeCompletionPercentage];
  double v15 = v14;
  double v16 = ARUIRingPercentageValueNoRing;
  BOOL v17 = v14 == ARUIRingPercentageValueNoRing;
  [v10 appleStandHourCompletionPercentage];
  double v19 = v18;
  double v20 = ARUIRingPercentageValueNoRing;
  BOOL v21 = v18 == ARUIRingPercentageValueNoRing;
  unsigned int v48 = [v10 paused];
  BOOL v49 = v12 == v13;
  if (v12 == v13) {
    double v22 = ARUIRingPercentageValueNoRing;
  }
  else {
    double v22 = v12 * a4;
  }
  if (self->_ringsView && vabdd_f64(self->_lastMovePercentage, v22) > 2.22044605e-16)
  {
    v23 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    [v23 objectAtIndexedSubscript:0];
    v25 = BOOL v24 = a5;
    *(float *)&double v26 = v22;
    [v25 setActiveEnergyPercentage:v50 animated:v26];

    a5 = v24;
    self->_lastMovePercentage = v22;
    char v27 = 1;
  }
  else
  {
    char v27 = 0;
  }
  if (v15 == v16)
  {
    double v28 = ARUIRingPercentageValueNoRing;
  }
  else
  {
    [v10 appleExerciseTimeCompletionPercentage];
    double v28 = v29 * a4;
  }
  if (self->_ringsView && vabdd_f64(self->_lastExercisePercentage, v28) > 2.22044605e-16)
  {
    v30 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    char v27 = 1;
    [v30 objectAtIndexedSubscript:1];
    BOOL v31 = v17;
    v33 = BOOL v32 = a5;
    *(float *)&double v34 = v28;
    [v33 setExerciseMinutesPercentage:v50 animated:v34];

    a5 = v32;
    BOOL v17 = v31;
    BOOL v21 = v19 == v20;

    self->_lastExercisePercentage = v28;
  }
  if (v19 == v20)
  {
    double v35 = ARUIRingPercentageValueNoRing;
  }
  else
  {
    [v10 appleStandHourCompletionPercentage];
    double v35 = v36 * a4;
  }
  if (self->_ringsView)
  {
    if (vabdd_f64(self->_lastStandPercentage, v35) <= 2.22044605e-16) {
      goto LABEL_23;
    }
    v37 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    [v37 objectAtIndexedSubscript:2];
    BOOL v38 = v17;
    v40 = BOOL v39 = a5;
    *(float *)&double v41 = v35;
    [v40 setStandHoursPercentage:v50 animated:v41];

    a5 = v39;
    BOOL v17 = v38;

    self->_lastStandPercentage = v35;
    char v27 = 1;
    if (self->_ringsView)
    {
LABEL_23:
      if (self->_lastPausedState != v48)
      {
        self->_lastPausedState = v48;
        v42 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
        sub_3F9C(v42, v48);

        [(NTKActivityAnalogFaceView *)self _updateActivityLabelColors:v48];
        [(NTKFaceViewTapControl *)self->_tapToLaunchButton highlightImageView];
        v44 = BOOL v43 = v21;
        v45 = [(NTKActivityAnalogFaceView *)self _highlightImage];
        [v44 setImage:v45];

        BOOL v21 = v43;
      }
    }
  }
  objc_initWeak(location, self);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_41E8;
  v51[3] = &unk_20758;
  objc_copyWeak(v53, location);
  id v46 = v10;
  id v52 = v46;
  BOOL v54 = a5;
  v53[1] = *(id *)&v22;
  v53[2] = *(id *)&v28;
  v53[3] = *(id *)&v35;
  v53[4] = *(id *)&a4;
  BOOL v55 = v49;
  BOOL v56 = v17;
  BOOL v57 = v21;
  BOOL v58 = v50;
  char v59 = v27;
  v47 = objc_retainBlock(v51);
  ((void (*)(void))v47[2])();

  objc_destroyWeak(v53);
  objc_destroyWeak(location);
}

- (unint64_t)textLayoutStyleForSlot:(id)a3
{
  return (unint64_t)[(NTKActivityAnalogFaceView *)self layoutStyleForSlot:a3];
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v58 layoutSubviews];
  double v57 = 0.0;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  objc_super v3 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v3, (uint64_t)&v43);

  [(NTKActivityAnalogFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  ringsView = self->_ringsView;
  double y = CGPointZero.y;
  id v10 = [(NTKActivityAnalogFaceView *)self device];
  +[NTKAnalogUtilities sceneSizeForDevice:v10];
  -[NTKRingsMetalQuadView setBounds:](ringsView, "setBounds:", CGPointZero.x, y, v11, v12);

  double v13 = v5 * 0.5;
  double v14 = v7 * 0.5;
  -[NTKRingsMetalQuadView setCenter:](self->_ringsView, "setCenter:", v13, v7 * 0.5);
  [(NTKActivityAnalogFaceView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v59);
  [(NTKActivityAnalogFaceView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v60);
  tapToLaunchButton = self->_tapToLaunchButton;
  [(UIView *)self->_activityContainerView bounds];
  double v19 = v18 * 0.5;
  [(UIView *)self->_activityContainerView bounds];
  -[NTKFaceViewTapControl setCenter:](tapToLaunchButton, "setCenter:", v19, v20 * 0.5);
  [(NTKFaceViewTapControl *)self->_tapToLaunchButton sizeToFit];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  *(CGFloat *)&v27[5] = MidX;
  *(CGFloat *)&v27[6] = MidY;
  long long v41 = v56;
  long long v39 = v54;
  long long v40 = v55;
  long long v35 = v50;
  long long v36 = v51;
  long long v37 = v52;
  long long v38 = v53;
  long long v31 = v46;
  long long v32 = v47;
  v27[2] = sub_4DD4;
  v27[3] = &unk_20780;
  v27[4] = self;
  double v42 = v57;
  long long v33 = v48;
  long long v34 = v49;
  long long v28 = v43;
  long long v29 = v44;
  long long v30 = v45;
  [(NTKActivityAnalogFaceView *)self _enumerateActivityLabels:v27];
  double v21 = v13 + v57;
  -[NTKActivityDateComplicationLabel sizeThatFits:](self->_dateComplicationLabel, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v22 = [(NTKActivityAnalogFaceView *)self _dateLabelFont];
  [v22 lineHeight];

  dateComplicationLabel = self->_dateComplicationLabel;
  BOOL v24 = [(NTKActivityAnalogFaceView *)self device];
  CLKPixelAlignRectForDevice();
  -[NTKActivityDateComplicationLabel setBounds:](dateComplicationLabel, "setBounds:");

  -[NTKActivityDateComplicationLabel setCenter:](self->_dateComplicationLabel, "setCenter:", v21, v14);
  activityContainerView = self->_activityContainerView;
  double v26 = [(NTKActivityAnalogFaceView *)self contentView];
  [v26 bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](activityContainerView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_loadSnapshotContentViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v7 _loadSnapshotContentViews];
  [(NTKActivityAnalogFaceView *)self _loadRingsViewIfNecessary];
  [(NTKActivityAnalogFaceView *)self _loadDialIfNecessary];
  if (!self->_tapToLaunchButton)
  {
    objc_super v3 = (NTKFaceViewTapControl *)objc_opt_new();
    tapToLaunchButton = self->_tapToLaunchButton;
    self->_tapToLaunchButton = v3;

    [(NTKFaceViewTapControl *)self->_tapToLaunchButton addTarget:self action:"_launchButtonPressed:" forControlEvents:64];
    double v5 = [(NTKFaceViewTapControl *)self->_tapToLaunchButton highlightImageView];
    double v6 = [(NTKActivityAnalogFaceView *)self _highlightImage];
    [v5 setImage:v6];

    [(UIView *)self->_activityContainerView addSubview:self->_tapToLaunchButton];
  }
  if (self->_isDetailedDensity
    || [(NTKActivityAnalogFaceView *)self showsCanonicalContent])
  {
    [(NTKActivityAnalogFaceView *)self _loadChronoViewsIfNecessary];
  }
  [(NTKActivityAnalogFaceView *)self _applyCurrentDataModelAnimated:0];
  self->_snapshotContentViewsLoaded = 1;
}

- (void)_loadDialIfNecessary
{
  objc_super v3 = [(NTKActivityAnalogFaceView *)self device];
  [v3 screenBounds];
  double v5 = v4;

  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  double v6 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v6, (uint64_t)v15);

  if (!self->_dialView)
  {
    [(NTKActivityAnalogFaceView *)self bounds];
    double v7 = *((double *)&v16 + 1);
    double v9 = v8 + *((double *)&v16 + 1) * -2.0;
    id v10 = [NTKActivityDialView alloc];
    double v11 = [(NTKActivityAnalogFaceView *)self device];
    double v12 = -[NTKActivityDialView initWithFrame:forDevice:](v10, "initWithFrame:forDevice:", v11, v7, v5 * 0.5 - v9 * 0.5, v9, v9);
    dialView = self->_dialView;
    self->_dialView = v12;

    [(NTKActivityDialView *)self->_dialView setUserInteractionEnabled:0];
    id v14 = [(NTKActivityAnalogFaceView *)self contentView];
    [v14 addSubview:self->_dialView];
  }
}

- (void)_loadRingsViewIfNecessary
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v3 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v3, (uint64_t)&v20);

  if (!self->_ringsView)
  {
    id v19 = objc_alloc_init((Class)NSMutableArray);
    int v4 = 0;
    double v5 = *((double *)&v21 + 1);
    double v6 = *(double *)&v22 + *((double *)&v22 + 1);
    float v7 = *(double *)&v22;
    do
    {
      id v8 = [objc_alloc((Class)ARUIRingGroup) initWithNumberOfRings:1];
      [v8 setTranslation:0.0];
      double v9 = v5 - (double)v4 * v6;
      *(float *)&double v9 = v9;
      [v8 setGroupDiameter:v9];
      *(float *)&double v10 = v7;
      [v8 setThickness:v10];
      [v19 addObject:v8];

      v4 += 2;
    }
    while (v4 != 6);
    double v11 = +[NTKActivityFaceViewFactory sharedRingsViewRenderer];
    double v12 = [NTKRingsMetalQuadView alloc];
    [(NTKActivityAnalogFaceView *)self bounds];
    double v13 = -[NTKRingsMetalQuadView initWithFrame:identifier:options:colorSpace:](v12, "initWithFrame:identifier:options:colorSpace:", @"ActA", 16, 1);
    ringsView = self->_ringsView;
    self->_ringsView = v13;

    double v15 = [[NTKRingsQuad alloc] initWithRingGroups:v19 renderer:v11];
    ringsQuad = self->_ringsQuad;
    self->_ringsQuad = v15;

    [(NTKRingsQuad *)self->_ringsQuad setDelegate:self];
    long long v17 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    sub_3F9C(v17, 0);

    [(NTKRingsMetalQuadView *)self->_ringsView addQuad:self->_ringsQuad];
    long long v18 = self->_ringsView;
    [(UIView *)self->_activityContainerView bounds];
    -[NTKRingsMetalQuadView setFrame:](v18, "setFrame:");
    [(UIView *)self->_activityContainerView addSubview:self->_ringsView];
    self->_lastMovePercentage = 0.0;
    self->_lastExercisePercentage = 0.0;
    self->_lastStandPercentage = 0.0;
  }
}

- (void)_loadChronoViewsIfNecessary
{
  if (!self->_dateComplicationLabel)
  {
    objc_super v3 = [NTKActivityDateComplicationLabel alloc];
    int v4 = [(NTKActivityAnalogFaceView *)self device];
    double v5 = [(NTKActivityDateComplicationLabel *)v3 initWithSizeStyle:1 accentType:0 forDevice:v4];
    dateComplicationLabel = self->_dateComplicationLabel;
    self->_dateComplicationLabel = v5;

    float v7 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
    id v8 = [v7 primaryColor];

    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel setAccentColor:v8];
    double v9 = self->_dateComplicationLabel;
    double v10 = [(NTKActivityAnalogFaceView *)self _dateLabelFont];
    [(NTKActivityDateComplicationLabel *)v9 setFont:v10];

    double v11 = +[NTKDateComplication complicationWithDateStyle:8];
    double v12 = self->_dateComplicationLabel;
    double v13 = [(NTKActivityAnalogFaceView *)self device];
    id v14 = +[NTKComplicationController DEPRECATEDControllerForComplication:v11 withLegacyDisplay:v12 forDevice:v13];
    dateComplicationController = self->_dateComplicationController;
    self->_dateComplicationController = v14;

    [(NTKDateComplicationController *)self->_dateComplicationController _activate];
    LOBYTE(v16) = self->_isDetailedDensity;
    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel setAlpha:(double)v16];
    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel addTarget:self action:"_dateComplicationPressed:" forControlEvents:64];
  }
  if (!self->_moveLabel)
  {
    long long v17 = [(NTKActivityAnalogFaceView *)self _newActivityLabelSubview];
    moveLabel = self->_moveLabel;
    self->_moveLabel = v17;
  }
  if (!self->_exerciseLabel)
  {
    id v19 = [(NTKActivityAnalogFaceView *)self _newActivityLabelSubview];
    exerciseLabel = self->_exerciseLabel;
    self->_exerciseLabel = v19;
  }
  if (!self->_standLabel)
  {
    long long v21 = [(NTKActivityAnalogFaceView *)self _newActivityLabelSubview];
    standLabel = self->_standLabel;
    self->_standLabel = v21;
  }
  self->_activityViewsAlpha = 1.0;
  [(NTKActivityAnalogFaceView *)self _addOrRemoveChronoViewsIfNecessary];
  BOOL lastPausedState = self->_lastPausedState;

  [(NTKActivityAnalogFaceView *)self _updateActivityLabelColors:lastPausedState];
}

- (id)_newActivityLabelSubview
{
  objc_super v3 = +[NTKActivityAnalogFaceBundle localizedStringForKey:@"ACTIVITY_INVALID_DATA" comment:@"---"];
  int v4 = objc_opt_new();
  double v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  double v6 = -[NTKActivityAnalogFaceView _activityLabelFontForDigits:](self, "_activityLabelFontForDigits:", [v3 length]);
  [v4 setFont:v6];

  [v4 setTextAlignment:1];
  [v4 setText:v3];
  LOBYTE(v7) = self->_isDetailedDensity;
  [v4 setAlpha:(double)v7];

  return v4;
}

- (void)_dateComplicationPressed:(id)a3
{
  if ([(NTKDateComplicationController *)self->_dateComplicationController hasTapAction])
  {
    [(NTKDateComplicationController *)self->_dateComplicationController performTapActionForDisplayWrapper:0];
    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel frame];
    -[NTKActivityAnalogFaceView convertRect:toView:](self, "convertRect:toView:", self);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(NTKActivityAnalogFaceView *)self delegate];
    objc_msgSend(v12, "faceViewRequestedLaunchFromRect:", v5, v7, v9, v11);
  }
}

- (void)_addOrRemoveChronoViewsIfNecessary
{
  if (self->_isDetailedDensity || ([(NTKActivityAnalogFaceView *)self editing] & 1) != 0) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [(NTKActivityAnalogFaceView *)self showsCanonicalContent];
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_59E4;
  v4[3] = &unk_207A8;
  unsigned __int8 v5 = v3;
  v4[4] = self;
  [(NTKActivityAnalogFaceView *)self _enumerateChronoViews:v4];
}

- (void)_updateActivityLabelColors:(BOOL)a3
{
  if (a3)
  {
    NTKPausedNonGradientTextColor();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = NTKPausedNonGradientTextColor();
    NTKPausedNonGradientTextColor();
  }
  else
  {
    NTKMoveNonGradientTextColor();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = NTKExerciseNonGradientTextColor();
    NTKStandNonGradientTextColor();
  unsigned __int8 v5 = };
  [(UILabel *)self->_moveLabel setTextColor:v6];
  [(UILabel *)self->_exerciseLabel setTextColor:v4];
  [(UILabel *)self->_standLabel setTextColor:v5];
}

- (CGPoint)_contentCenterOffset
{
  unsigned __int8 v3 = [(NTKActivityAnalogFaceView *)self delegate];
  unsigned __int8 v4 = [v3 faceViewComplicationIsEmptyForSlot:NTKComplicationSlotBottomCenter];

  unsigned __int8 v5 = [(NTKActivityAnalogFaceView *)self device];
  id v6 = v5;
  if (v4)
  {
    sub_4C8C(v5, (uint64_t)v14);
    double v7 = v15;
    double v8 = (double *)&v16;
  }
  else
  {
    sub_4C8C(v5, (uint64_t)v12);
    double v7 = *(double *)&v12[19];
    double v8 = (double *)&v13;
  }
  double v9 = *v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.x = v10;
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  v2 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKActivityAnalogFaceView;
  id v6 = a4;
  [(NTKActivityAnalogFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[NTKRingsMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_ringsView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _applyFrozen];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_applySlow
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _applySlow];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_updatePausedState
{
  objc_super v3 = (char *)[(NTKActivityAnalogFaceView *)self dataMode];
  unsigned int v4 = [(NTKActivityAnalogFaceView *)self isFrozen];
  int v5 = NTKIsScreenOn();
  unsigned int v6 = [(NTKRingsQuad *)self->_ringsQuad animating];
  if ([(NTKActivityAnalogFaceView *)self editing])
  {
    ringsView = self->_ringsView;
    uint64_t v8 = v6 ^ 1;
  }
  else
  {
    ringsView = self->_ringsView;
    if (v3 == (unsigned char *)&dword_0 + 1) {
      int v9 = v4;
    }
    else {
      int v9 = 1;
    }
    uint64_t v8 = v9 | v5 & v6 ^ 1;
  }

  [(NTKRingsMetalQuadView *)ringsView setPaused:v8];
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _applyDataMode];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_unloadSnapshotContentViews
{
  [(NTKActivityDialView *)self->_dialView removeFromSuperview];
  dialView = self->_dialView;
  self->_dialView = 0;

  [(NTKRingsMetalQuadView *)self->_ringsView removeFromSuperview];
  ringsView = self->_ringsView;
  self->_ringsView = 0;

  [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel removeFromSuperview];
  dateComplicationLabel = self->_dateComplicationLabel;
  self->_dateComplicationLabel = 0;

  [(UILabel *)self->_moveLabel removeFromSuperview];
  moveLabel = self->_moveLabel;
  self->_moveLabel = 0;

  [(UILabel *)self->_exerciseLabel removeFromSuperview];
  exerciseLabel = self->_exerciseLabel;
  self->_exerciseLabel = 0;

  [(UILabel *)self->_standLabel removeFromSuperview];
  standLabel = self->_standLabel;
  self->_standLabel = 0;

  [(NTKFaceViewTapControl *)self->_tapToLaunchButton removeFromSuperview];
  tapToLaunchButton = self->_tapToLaunchButton;
  self->_tapToLaunchButton = 0;

  self->_snapshotContentViewsLoaded = 0;
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 isEqual:NTKComplicationSlotDate])
  {
    double v10 = [(NTKActivityFaceViewFactory *)self->_faceViewFactory complicationFactory];
    id v11 = [v10 newViewForComplication:v8 family:a4 forSlot:12];

    [(NTKActivityAnalogFaceView *)self _configureComplicationView:v11 forSlot:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKActivityAnalogFaceView;
    id v11 = [(NTKActivityAnalogFaceView *)&v13 _newLegacyViewForComplication:v8 family:a4 slot:v9];
  }

  return v11;
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  int v5 = [(NTKActivityAnalogFaceView *)self device];
  if ([v5 deviceCategory] == (char *)&dword_0 + 1)
  {

LABEL_5:
    unint64_t v7 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v6 = [v4 isEqualToString:NTKComplicationSlotBottomCenter];

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v7 = 1;
LABEL_6:

  return v7;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v14 = a8;
  if ((char *)[(NTKActivityAnalogFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == (char *)&dword_0 + 1) {
    [(NTKActivityFaceViewFactory *)self->_faceViewFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14];
  }
}

- (void)_applyShowsLockedUI
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v4 _applyShowsLockedUI];
  objc_super v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v6 = "-[NTKActivityAnalogFaceView _applyShowsLockedUI]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setShowsLockedContent:[(NTKActivityAnalogFaceView *)self showsLockedUI]];
}

- (void)_prepareWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _prepareWristRaiseAnimation];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory prepareWristRaiseAnimation];
}

- (void)_performWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _performWristRaiseAnimation];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory performWristRaiseAnimation];
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v4 _prepareForEditing];
  [(NTKActivityAnalogFaceView *)self _loadChronoViewsIfNecessary];
  objc_super v3 = +[FIUIActivityDataModel idealizedModel];
  [(NTKActivityAnalogFaceView *)self _applyDataModel:v3 byFraction:1 updateLabels:0 ignoreScreenBlanked:0 animated:1.0];

  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityAnalogFaceView;
  [(NTKActivityAnalogFaceView *)&v3 _cleanupAfterEditing];
  [(NTKActivityAnalogFaceView *)self _addOrRemoveChronoViewsIfNecessary];
  [(NTKActivityAnalogFaceView *)self _applyCurrentDataModelAnimated:0];
  [(NTKActivityAnalogFaceView *)self _updatePausedState];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    id v11 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
    id v12 = [(NTKActivityAnalogFaceView *)self _cachedSchemeForFaceColorPalette:v11];

    [(NTKActivityDialView *)self->_dialView setColorScheme:v12];
    objc_super v13 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
    id v14 = [(NTKActivityAnalogFaceView *)self _accentColorForFaceColor:v13];

    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel setAccentColor:v14];
    double v15 = [(NTKActivityAnalogFaceView *)self timeView];
    [v15 applySecondHandColor:v14];
  }
  else if (a4 == 11)
  {
    self->_isDetailedDensitdouble y = [v16 density] == (char *)&dword_0 + 3;
    id v9 = [(NTKFaceViewTapControl *)self->_tapToLaunchButton highlightImageView];
    double v10 = [(NTKActivityAnalogFaceView *)self _highlightImage];
    [v9 setImage:v10];

    if (self->_snapshotContentViewsLoaded) {
      [(NTKActivityAnalogFaceView *)self _loadChronoViewsIfNecessary];
    }
    [(NTKActivityAnalogFaceView *)self _configureAppropriateChronoDetail];
  }
}

- (void)_configureAppropriateChronoDetail
{
  double v2 = 1.0;
  if (!self->_isDetailedDensity) {
    double v2 = 0.0;
  }
  [(NTKActivityAnalogFaceView *)self _showChronoDetailByFraction:0 fillRings:v2];
}

- (id)_accentColorForFaceColor:(id)a3
{
  id v4 = a3;
  if ([v4 isWhiteColor])
  {
    int v5 = +[UIColor systemOrangeColor];
  }
  else
  {
    unsigned __int8 v6 = [(NTKActivityAnalogFaceView *)self _cachedSchemeForFaceColorPalette:v4];
    int v5 = [v6 foregroundColor];
  }

  return v5;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v26 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 10)
  {
    id v14 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
    id v15 = [v14 copy];

    id v16 = [v26 pigmentEditOption];
    [v15 setPigmentEditOption:v16];

    long long v17 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
    id v18 = [v17 copy];

    id v19 = [v12 pigmentEditOption];
    [v18 setPigmentEditOption:v19];

    long long v20 = [(NTKActivityAnalogFaceView *)self _cachedSchemeForFaceColorPalette:v15];
    long long v21 = [(NTKActivityAnalogFaceView *)self _cachedSchemeForFaceColorPalette:v18];
    [(NTKActivityDialView *)self->_dialView applyTransitionFromScheme:v20 toScheme:v21 fraction:a3];
    long long v22 = [(NTKActivityAnalogFaceView *)self _accentColorForFaceColor:v15];
    long long v23 = [(NTKActivityAnalogFaceView *)self _accentColorForFaceColor:v18];
    long long v24 = NTKInterpolateBetweenColors();

    long long v25 = [(NTKActivityAnalogFaceView *)self timeView];
    [v25 applySecondHandColor:v24];

    [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel setAccentColor:v24];
  }
  else if (a6 == 11)
  {
    [v26 density];
    [v12 density];
    CLKInterpolateBetweenFloatsClipped();
    -[NTKActivityAnalogFaceView _showChronoDetailByFraction:fillRings:](self, "_showChronoDetailByFraction:fillRings:", 1);
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKActivityAnalogFaceView;
  -[NTKActivityAnalogFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v16, "_configureForTransitionFraction:fromEditMode:toEditMode:");
  id v8 = [(NTKActivityAnalogFaceView *)self timeView];
  [(NTKActivityAnalogFaceView *)self _handAlphaForEditMode:a4];
  [(NTKActivityAnalogFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  dialView = self->_dialView;
  [(NTKActivityAnalogFaceView *)self _dialAlphaForEditMode:a4];
  [(NTKActivityAnalogFaceView *)self _dialAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKActivityDialView setAlpha:](dialView, "setAlpha:");
  [(NTKActivityAnalogFaceView *)self _dialScaleForEditMode:a4];
  [(NTKActivityAnalogFaceView *)self _dialScaleForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  activityContainerView = self->_activityContainerView;
  CGAffineTransformMakeScale(&v15, v10, v10);
  [(UIView *)activityContainerView setTransform:&v15];
  id v13 = self->_dialView;
  CGAffineTransformMakeScale(&v14, v11, v11);
  [(NTKActivityDialView *)v13 setTransform:&v14];
  self->_contentScale = v11;
  [(NTKActivityAnalogFaceView *)self _ringAlphaForEditMode:a4];
  [(NTKActivityAnalogFaceView *)self _ringAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKActivityAnalogFaceView _setActivityViewsAlpha:includeDateComplication:animated:](self, "_setActivityViewsAlpha:includeDateComplication:animated:", 1, 0);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)NTKActivityAnalogFaceView;
  -[NTKActivityAnalogFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v20, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  NTKScaleForRubberBandingFraction();
  double v8 = v7;
  NTKAlphaForRubberBandingFraction();
  double v10 = v9;
  if (a4 == 11)
  {
    CGFloat v14 = v8 * self->_contentScale;
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v14, v14);
    activityContainerView = self->_activityContainerView;
    CGAffineTransform v18 = v19;
    [(UIView *)activityContainerView setTransform:&v18];
LABEL_6:
    [(NTKActivityAnalogFaceView *)self _setActivityViewsAlpha:1 includeDateComplication:0 animated:v10];
    return;
  }
  if (a4 != 10)
  {
    if (a4) {
      return;
    }
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v8, v8);
    double v11 = [(NTKActivityAnalogFaceView *)self contentView];
    CGAffineTransform v18 = v19;
    [v11 setTransform:&v18];

    id v12 = [(NTKActivityAnalogFaceView *)self timeView];
    CGAffineTransform v18 = v19;
    [v12 setTransform:&v18];

    id v13 = [(NTKActivityAnalogFaceView *)self timeView];
    [v13 setAlpha:v10];

    goto LABEL_6;
  }
  CGFloat v16 = v8 * self->_contentScale;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v16, v16);
  dialView = self->_dialView;
  CGAffineTransform v18 = v19;
  [(NTKActivityDialView *)dialView setTransform:&v18];
  [(NTKActivityDialView *)self->_dialView setAlpha:v10];
}

- (void)_setActivityViewsAlpha:(double)a3 includeDateComplication:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  self->_activityViewsAlpha = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6E14;
  v17[3] = &unk_207F0;
  v17[4] = self;
  *(double *)&v17[5] = a3;
  BOOL v18 = a4;
  double v8 = objc_retainBlock(v17);
  double v9 = v8;
  if (v5)
  {
    +[UIView animateWithDuration:v8 animations:0.2];
    v15[1] = _NSConcreteStackBlock;
    v15[2] = 3221225472;
    v15[3] = sub_6ED0;
    v15[4] = &unk_20838;
    v15[5] = 0x3FC999999999999ALL;
    double v10 = (double *)&v16;
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
    double v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_6F94;
    CGFloat v14 = &unk_20858;
    double v10 = (double *)v15;
  }
  double *v10 = a3;
  -[NTKActivityAnalogFaceView _enumerateRingGroups:](self, "_enumerateRingGroups:", v11, v12, v13, v14);
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)NTKActivityAnalogFaceView;
  -[NTKActivityAnalogFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v19, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 10)
  {
    uint64_t v12 = [(NTKActivityAnalogFaceView *)self device];
    sub_4C8C(v12, (uint64_t)v16);
    double v13 = (a3 + -0.5 + a3 + -0.5) * v17 + 1.0;

    CGFloat v14 = v13 * self->_contentScale;
    dialView = self->_dialView;
    CGAffineTransformMakeScale(&v15, v14, v14);
    double v11 = &v15;
  }
  else
  {
    if (a4 != 11) {
      return;
    }
    NTKLargeElementScaleForBreathingFraction();
    CGFloat v9 = v8 * self->_contentScale;
    dialView = (NTKActivityDialView *)self->_activityContainerView;
    CGAffineTransformMakeScale(&v18, v9, v9);
    double v11 = &v18;
  }
  [(NTKActivityDialView *)dialView setTransform:v11];
}

- (id)_cachedSchemeForFaceColorPalette:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 configuration];
  unsigned __int8 v6 = [v5 uniqueId];

  double v7 = [(NSMutableDictionary *)self->_faceColorsToSchemes objectForKeyedSubscript:v6];
  if (!v7)
  {
    double v8 = [(NTKActivityAnalogFaceView *)self device];
    CGFloat v9 = [(NTKActivityAnalogFaceView *)self device];
    sub_4C8C(v9, (uint64_t)v11);
    double v7 = +[NTKFaceColorScheme colorSchemeForDevice:v8 withFaceColorPalette:v4 units:v12];

    [(NSMutableDictionary *)self->_faceColorsToSchemes setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (a4 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  double result = 0.0;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_dialAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 10 || a3 == 0;
  double result = NTKEditModeDimmedAlpha;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_ringAlphaForEditMode:(int64_t)a3
{
  BOOL v3 = a3 == 11 || a3 == 0;
  double result = NTKEditModeDimmedAlpha;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)_dialScaleForEditMode:(int64_t)a3
{
  double result = 0.83;
  if (a3 != 10) {
    return 1.0;
  }
  return result;
}

- (void)_showChronoDetailByFraction:(double)a3 fillRings:(BOOL)a4
{
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v7 = a3 < 0.5;
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  long long v41 = 0uLL;
  long long v42 = 0uLL;
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  long long v37 = 0uLL;
  long long v38 = 0uLL;
  long long v35 = 0uLL;
  long long v36 = 0uLL;
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  double v8 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v8, (uint64_t)&v33);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  long long v29 = v46;
  long long v27 = v44;
  long long v28 = v45;
  long long v23 = v40;
  long long v24 = v41;
  long long v25 = v42;
  long long v26 = v43;
  long long v19 = v36;
  long long v20 = v37;
  long long v21 = v38;
  long long v22 = v39;
  long long v16 = v33;
  long long v17 = v34;
  v15[2] = sub_7460;
  v15[3] = &unk_20880;
  BOOL v31 = v7;
  *(double *)&void v15[6] = a3;
  uint64_t v30 = v47;
  long long v18 = v35;
  BOOL v32 = a4;
  v15[4] = self;
  v15[5] = 0x3FE0000000000000;
  [(NTKActivityAnalogFaceView *)self _enumerateRingGroups:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7680;
  v14[3] = &unk_208A8;
  *(double *)&v14[6] = a3;
  v14[4] = self;
  v14[5] = 0x3FE0000000000000;
  [(NTKActivityAnalogFaceView *)self _enumerateActivityLabels:v14];
  double v9 = 0.0;
  if (a3 >= 0.6875)
  {
    double v9 = 1.0;
    if (a3 <= 0.9375)
    {
      CLKCompressFraction();
      double v9 = v10;
    }
  }
  [(NTKActivityDateComplicationLabel *)self->_dateComplicationLabel setAlpha:v9 * self->_activityViewsAlpha];
  CLKInterpolateBetweenFloatsClipped();
  dateComplicationLabel = self->_dateComplicationLabel;
  CGAffineTransformMakeScale(&v13, v12, v12);
  [(NTKActivityDateComplicationLabel *)dateComplicationLabel setTransform:&v13];
}

+ (void)_prewarmForDevice:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NTKActivityAnalogFaceView;
  id v3 = a3;
  objc_msgSendSuper2(&v4, "_prewarmForDevice:", v3);
  +[NTKActivityFaceViewFactory prewarmForDevice:](NTKActivityFaceViewFactory, "prewarmForDevice:", v3, v4.receiver, v4.super_class);
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  double v2 = +[NTKActivityFaceViewFactory prelaunchApplicationIdentifiers];
  id v3 = +[NSOrderedSet orderedSetWithSet:v2];

  return v3;
}

- (void)_enumerateRingGroups:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_78B4;
  v7[3] = &unk_208D0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)_enumerateActivityLabels:(id)a3
{
  id v4 = (void (**)(id, UILabel *, uint64_t))((char *)a3 + 16);
  BOOL v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_exerciseLabel, 1);
  (*v4)(v6, self->_standLabel, 2);
}

- (void)_enumerateChronoViews:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7A18;
  v5[3] = &unk_208F8;
  id v6 = a3;
  id v4 = (void (**)(id, NTKActivityDateComplicationLabel *))v6;
  [(NTKActivityAnalogFaceView *)self _enumerateActivityLabels:v5];
  v4[2](v4, self->_dateComplicationLabel);
}

- (id)_highlightImage
{
  if (self->_isDetailedDensity)
  {
    BOOL lastPausedState = self->_lastPausedState;
    id v3 = [(NTKActivityAnalogFaceView *)self device];
    if (lastPausedState)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_29538);
      id WeakRetained = objc_loadWeakRetained(&qword_29540);
      if (WeakRetained)
      {
        BOOL v5 = WeakRetained;
        id v6 = objc_loadWeakRetained(&qword_29540);
        if (v6 == v3)
        {
          id v13 = [v3 version];
          uint64_t v14 = qword_29548;

          if (v13 == (id)v14)
          {
LABEL_14:
            os_unfair_lock_unlock((os_unfair_lock_t)&unk_29538);
            long long v17 = &qword_29528;
            goto LABEL_23;
          }
        }
        else
        {
        }
      }
      id v15 = objc_storeWeak(&qword_29540, v3);
      qword_29548 = (uint64_t)[v3 version];

      sub_9A80(v16, v3);
      goto LABEL_14;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_29560);
    id v10 = objc_loadWeakRetained(&qword_29568);
    if (v10)
    {
      double v11 = v10;
      id v12 = objc_loadWeakRetained(&qword_29568);
      if (v12 == v3)
      {
        id v22 = [v3 version];
        uint64_t v23 = qword_29570;

        if (v22 == (id)v23)
        {
LABEL_22:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_29560);
          long long v17 = &qword_29550;
          goto LABEL_23;
        }
      }
      else
      {
      }
    }
    id v24 = objc_storeWeak(&qword_29568, v3);
    qword_29570 = (uint64_t)[v3 version];

    sub_9C24(v25, v3);
    goto LABEL_22;
  }
  id v3 = [(NTKActivityAnalogFaceView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_29580);
  id v7 = objc_loadWeakRetained(&qword_29588);
  if (!v7) {
    goto LABEL_16;
  }
  id v8 = v7;
  id v9 = objc_loadWeakRetained(&qword_29588);
  if (v9 != v3)
  {

LABEL_16:
    id v20 = objc_storeWeak(&qword_29588, v3);
    qword_29590 = (uint64_t)[v3 version];

    sub_9DFC(v21, v3);
    goto LABEL_17;
  }
  id v18 = [v3 version];
  uint64_t v19 = qword_29590;

  if (v18 != (id)v19) {
    goto LABEL_16;
  }
LABEL_17:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_29580);
  if (qword_295A0 != -1) {
    dispatch_once(&qword_295A0, &stru_20A78);
  }
  long long v17 = &qword_29578;
LABEL_23:
  id v26 = (id)*v17;

  return v26;
}

- (id)_activityLabelFontForDigits:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v3, (uint64_t)v9);
      id v4 = (double *)&v10;
      break;
    case 2:
      id v3 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v3, (uint64_t)v11);
      id v4 = (double *)&v12;
      break;
    case 3:
      id v3 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v3, (uint64_t)v13);
      id v4 = (double *)&v14;
      break;
    case 4:
      id v3 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v3, (uint64_t)v15);
      id v4 = (double *)&v16;
      break;
    default:
      id v3 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v3, (uint64_t)v7);
      id v4 = (double *)&v8;
      break;
  }
  BOOL v5 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*v4 design:UIFontWeightSemibold];

  return v5;
}

- (id)_dateLabelFont
{
  double v2 = [(NTKActivityAnalogFaceView *)self device];
  sub_4C8C(v2, (uint64_t)v5);
  id v3 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v5[0] design:UIFontWeightSemibold];

  return v3;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11) {
    return &off_21A58;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4 == 11)
  {
    id v10 = v8;
    double v11 = [a5 objectForKeyedSubscript:&off_21540];
    if (!qword_29420)
    {
      uint64_t v12 = objc_opt_new();
      id v13 = (void *)qword_29420;
      qword_29420 = v12;
    }
    uint64_t v14 = +[NSString stringWithFormat:@"%@-%@", v10, v11];
    id v15 = [(id)qword_29420 objectForKey:v14];
    if (!v15)
    {
      uint64_t v16 = [(NTKActivityAnalogFaceView *)self faceColorPalette];
      id v17 = [v16 copy];

      long long v51 = v11;
      id v18 = [v11 pigmentEditOption];
      [v17 setPigmentEditOption:v18];

      uint64_t v19 = [(NTKActivityAnalogFaceView *)self device];
      id v20 = [(NTKActivityAnalogFaceView *)self device];
      sub_4C8C(v20, (uint64_t)v62);
      uint64_t v21 = +[NTKFaceColorScheme colorSchemeForDevice:v19 withFaceColorPalette:v17 units:v63];

      id v22 = +[NTKActivityAnalogFaceBundle imageWithName:@"Swatch-Activity-Ring"];
      uint64_t v23 = [v21 shiftedBackgroundColor];
      id v24 = [v22 _flatImageWithColor:v23];

      uint64_t v25 = +[NTKActivityAnalogFaceBundle imageWithName:@"Swatch-Activity-Notches"];
      long long v54 = v21;
      id v26 = [v21 activityTickColor];
      long long v50 = [v25 _flatImageWithColor:v26];

      long long v27 = (char *)[v10 density];
      id v52 = v10;
      long long v53 = v17;
      if (v27 == (unsigned char *)&dword_0 + 3)
      {
        uint64_t v30 = CLKLocaleNumberSystemPrefix();
        if (CLKLocaleCurrentNumberSystem())
        {
          BOOL v31 = @"Swatch-Activity-Face2";
        }
        else
        {
          BOOL v32 = +[NSLocale currentLocale];
          long long v33 = [v32 objectForKey:NSLocaleLanguageCode];
          unsigned int v34 = [v33 isEqualToString:@"en"];

          CFStringRef v35 = @"Non";
          if (v34) {
            CFStringRef v35 = &stru_20E90;
          }
          BOOL v31 = [@"Swatch-Activity-Face2" stringByAppendingFormat:@"-%@En", v35];
        }
        long long v36 = [(__CFString *)v31 stringByAppendingFormat:@"-%@", v30];
        long long v28 = +[NTKActivityAnalogFaceBundle imageWithName:v36];

        long long v37 = +[NSString stringWithFormat:@"Swatch-Activity-Date-%@", v30];
        long long v29 = +[NTKActivityAnalogFaceBundle imageWithName:v37];

        id v17 = v53;
      }
      else if (v27 == (unsigned char *)&dword_0 + 1)
      {
        long long v28 = +[NTKActivityAnalogFaceBundle imageWithName:@"Swatch-Activity-Face1"];
        long long v29 = 0;
      }
      else
      {
        long long v29 = 0;
        long long v28 = 0;
      }
      if ([v17 isWhiteColor]) {
        +[UIColor systemOrangeColor];
      }
      else {
      long long v38 = [v54 foregroundColor];
      }
      if (v29)
      {
        long long v39 = [v29 _flatImageWithColor:v38];
      }
      else
      {
        long long v39 = 0;
      }
      long long v40 = NTKImageNamed();
      long long v41 = [v40 _flatImageWithColor:v38];

      id v42 = objc_alloc((Class)UIGraphicsImageRenderer);
      [v24 size];
      id v43 = objc_msgSend(v42, "initWithSize:");
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_86B8;
      v56[3] = &unk_20948;
      id v57 = v39;
      id v58 = v24;
      id v59 = v50;
      id v60 = v28;
      id v61 = v41;
      id v44 = v41;
      id v45 = v28;
      id v46 = v50;
      id v47 = v24;
      id v48 = v39;
      id v15 = [v43 imageWithActions:v56];
      [(id)qword_29420 setObject:v15 forKey:v14];

      double v11 = v51;
      id v10 = v52;
    }
  }
  else
  {
    v55.receiver = self;
    v55.super_class = (Class)NTKActivityAnalogFaceView;
    id v15 = [(NTKActivityAnalogFaceView *)&v55 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v15;
}

- (NTKActivityFaceViewFactory)faceViewFactory
{
  return self->_faceViewFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceViewFactory, 0);
  objc_storeStrong((id *)&self->_faceColorsToSchemes, 0);
  objc_storeStrong((id *)&self->_tapToLaunchButton, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_standLabel, 0);
  objc_storeStrong((id *)&self->_exerciseLabel, 0);
  objc_storeStrong((id *)&self->_moveLabel, 0);
  objc_storeStrong((id *)&self->_activityContainerView, 0);
  objc_storeStrong((id *)&self->_dateComplicationLabel, 0);
  objc_storeStrong((id *)&self->_dateComplicationController, 0);
  objc_storeStrong((id *)&self->_ringsQuad, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end