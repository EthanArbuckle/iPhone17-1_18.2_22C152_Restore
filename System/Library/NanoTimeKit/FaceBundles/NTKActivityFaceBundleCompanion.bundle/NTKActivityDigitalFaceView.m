@interface NTKActivityDigitalFaceView
+ (id)_newRingsQuad;
+ (void)_prewarmForDevice:(id)a3;
- ($070E75FE9C89E6C9B32F698ACB560C0E)_layoutConstants;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)showSeconds;
- (CGPoint)_ringCenterForLayout:(RingLayout *)a3;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (CGRect)_timeViewBackgroundRect;
- (NTKActivityDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_blinkerAndSecondsWidth;
- (double)_rightTimeViewInsetForEditMode:(int64_t)a3;
- (double)_ringAlphaForEditMode:(int64_t)a3;
- (double)_timeAlphaForEditMode:(int64_t)a3;
- (double)rightTimeViewInset;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_labelFontMonospaced:(BOOL)a3;
- (id)_newActivityLabelSubview;
- (id)_newFaceViewFactoryForDevice:(id)a3;
- (id)_swatchColorForColorOption:(id)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_polygonIndexForAccuracy:(unint64_t)a3;
- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_timeLabelOptions;
- (unint64_t)textLayoutStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyCurrentDataModelByFraction:(double)a3 updateLabels:(BOOL)a4 animated:(BOOL)a5;
- (void)_applyCurrentRingLayout;
- (void)_applyDataMode;
- (void)_applyDataModel:(id)a3 byFraction:(double)a4 updateLabels:(BOOL)a5 animated:(BOOL)a6;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowsCanonicalContent;
- (void)_applyShowsLockedUI;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanUpAfterDetailEditing;
- (void)_cleanupAfterEditing;
- (void)_configureForDetailEditing;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_createActivityRelatedUIs;
- (void)_createTimeViewIfNecessary;
- (void)_enumerateActivityLabels:(id)a3;
- (void)_launchButtonPressed:(id)a3;
- (void)_layoutForegroundContainerView;
- (void)_loadSnapshotContentViews;
- (void)_performWristRaiseAnimation;
- (void)_prepareForEditing;
- (void)_prepareWristRaiseAnimation;
- (void)_removeActivityRelatedUIs;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setActivityViewsAlpha:(double)a3 animated:(BOOL)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateActivityLabelColors:(BOOL)a3;
- (void)_updateCurrentRingLayoutIfNecessary;
- (void)_updatePausedState;
- (void)_updateTimeViewSecondsDisplayState;
- (void)applyDataModel:(id)a3 animated:(BOOL)a4;
- (void)applyDataModelWithUnfilledRings:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setRightTimeViewInset:(double)a3;
- (void)setShowSeconds:(BOOL)a3;
- (void)timeTravelDateEnteredOrExitedTimelineBounds:(BOOL)a3;
@end

@implementation NTKActivityDigitalFaceView

- (id)_newFaceViewFactoryForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKActivityFaceViewFactory alloc] initForAnalog:0 richComplications:0 forDevice:v3];

  return v4;
}

- (NTKActivityDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKActivityDigitalFaceView;
  v9 = [(NTKActivityDigitalFaceView *)&v15 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(NTKActivityDigitalFaceView *)v9 _newFaceViewFactoryForDevice:v8];
    faceViewFactory = v10->_faceViewFactory;
    v10->_faceViewFactory = v11;

    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setFaceView:v10];
    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setDelegate:v10];
    [(NTKActivityFaceViewFactory *)v10->_faceViewFactory setDataMode:[(NTKActivityDigitalFaceView *)v10 dataMode]];
    [(NTKActivityDigitalFaceView *)v10 setComplicationFactory:v10->_faceViewFactory];
    v13 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Digital Face Initialized: %@", buf, 0xCu);
    }
  }
  return v10;
}

- (void)dealloc
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Digital Face Destroyed: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v4 dealloc];
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKActivityDigitalFaceView *)self _createActivityRelatedUIs];
  [(NTKActivityDigitalFaceView *)self _updateTimeViewSecondsDisplayState];
  [(NTKActivityDigitalFaceView *)self _applyCurrentRingLayout];
  [(NTKActivityDigitalFaceView *)self _applyCurrentDataModelByFraction:1 updateLabels:0 animated:1.0];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKActivityDigitalFaceView *)self _removeActivityRelatedUIs];
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _applyFrozen];
  if (([(NTKActivityDigitalFaceView *)self isFrozen] & 1) == 0) {
    [(NTKActivityDigitalFaceView *)self _updateTimeViewSecondsDisplayState];
  }
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

+ (void)_prewarmForDevice:(id)a3
{
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v4 screenWillTurnOnAnimated:a3];
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKActivityDigitalFaceView;
  id v6 = a4;
  [(NTKActivityDigitalFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[NTKRingsMetalQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_ringsView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _applyDataMode];
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)_applySlow
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _applySlow];
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)_updatePausedState
{
  objc_super v3 = (char *)[(NTKActivityDigitalFaceView *)self dataMode];
  unsigned int v4 = [(NTKActivityDigitalFaceView *)self isFrozen];
  int v5 = NTKIsScreenOn();
  unsigned int v6 = [(NTKRingsQuad *)self->_ringsQuad animating];
  if ([(NTKActivityDigitalFaceView *)self editing])
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

- (unint64_t)_timeLabelOptions
{
  return !self->_showSeconds;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  int v9 = [(NTKActivityDigitalFaceView *)self _labelFontMonospaced:0];
  [(NTKActivityDigitalFaceView *)self _layoutConstants];
  v10 = [(NTKActivityDigitalFaceView *)self device];
  v11 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v9, v10, x, y, width, height, 0.0, v13);

  return v11;
}

- (void)_createTimeViewIfNecessary
{
  v5.receiver = self;
  v5.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v5 _createTimeViewIfNecessary];
  BOOL showSeconds = self->_showSeconds;
  unsigned int v4 = [(NTKActivityDigitalFaceView *)self timeView];
  [v4 setShowSeconds:showSeconds];
}

- ($070E75FE9C89E6C9B32F698ACB560C0E)_layoutConstants
{
  id v5 = [(NTKActivityDigitalFaceView *)self device];
  sub_DFB4(v5, retstr);

  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v2 layoutSubviews];
}

- (void)_layoutForegroundContainerView
{
  v49.receiver = self;
  v49.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v49 _layoutForegroundContainerView];
  objc_super v3 = [(NTKActivityDigitalFaceView *)self device];
  [(NTKActivityDigitalFaceView *)self bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *((void *)&xmmword_29648 + 1);
  double v13 = [(NTKActivityDigitalFaceView *)self _labelFontMonospaced:1];
  [v13 ascender];
  double v15 = v14;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  [(NTKActivityDigitalFaceView *)self _layoutConstants];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = v29;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_E2D4;
  v17[3] = &unk_20C10;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;
  v17[4] = self;
  v19 = v28;
  uint64_t v24 = xmmword_29648;
  double v25 = *((double *)&v29 + 1) - v15;
  id v16 = v3;
  id v18 = v16;
  uint64_t v26 = v12;
  double v27 = v15;
  +[UIView performWithoutAnimation:v17];
  [(NTKActivityDigitalFaceView *)self _updateCurrentRingLayoutIfNecessary];

  _Block_object_dispose(v28, 8);
}

- (void)_updateCurrentRingLayoutIfNecessary
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  [(NTKActivityDigitalFaceView *)self _layoutConstants];
  unsigned int v3 = [(NTKActivityDigitalFaceView *)self timeScrubbing];
  unsigned int v4 = +[NTKActivityFaceViewFactory userActiveEnergyIsCalories];
  if ((!v3 || v4) && (int64_t moveStringMetricWidth = self->_moveStringMetricWidth, moveStringMetricWidth < 5))
  {
    if (moveStringMetricWidth == 4) {
      char v8 = 1;
    }
    else {
      char v8 = v3;
    }
    if ((v8 & 1) != 0 || self->_exerciseStringMetricWidth >= 3)
    {
      long long v10 = *(_OWORD *)((char *)&v11[1] + 8);
      double v6 = *((double *)&v11[2] + 1);
      uint64_t v7 = &v12;
    }
    else
    {
      long long v10 = 0u;
      double v6 = *(double *)v11;
      uint64_t v7 = (_OWORD *)((char *)v11 + 8);
    }
  }
  else
  {
    long long v10 = v13;
    double v6 = *(double *)&v14;
    uint64_t v7 = (long long *)((char *)&v14 + 8);
  }
  long long v9 = *v7;
  if (v6 != self->_currentRingLayout.diameter)
  {
    *(_OWORD *)&self->_currentRingLayout.bottomEdgeInset = v10;
    self->_currentRingLayout.diameter = v6;
    *(_OWORD *)&self->_currentRingLayout.thickness = v9;
    [(NTKActivityDigitalFaceView *)self _applyCurrentRingLayout];
  }
}

- (void)_applyCurrentRingLayout
{
  p_currentRingLayout = &self->_currentRingLayout;
  double diameter = self->_currentRingLayout.diameter;
  if (diameter != 0.0)
  {
    -[NTKRingsMetalQuadView setBounds:](self->_ringsView, "setBounds:", 0.0, 0.0, diameter + 1.0, diameter + 1.0);
    ringsView = self->_ringsView;
    long long v6 = *(_OWORD *)&p_currentRingLayout->diameter;
    long long v24 = *(_OWORD *)&p_currentRingLayout->bottomEdgeInset;
    long long v25 = v6;
    double interspacing = p_currentRingLayout->interspacing;
    [(NTKActivityDigitalFaceView *)self _ringCenterForLayout:&v24];
    -[NTKRingsMetalQuadView setCenter:](ringsView, "setCenter:");
    double v7 = p_currentRingLayout->diameter;
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    -[NTKFaceViewTapControl setBounds:](self->_tapToLaunchButton, "setBounds:", 0.0, 0.0, v7 + v23 * 2.0, v7 + v23 * 2.0);
    tapToLaunchButton = self->_tapToLaunchButton;
    [(NTKRingsMetalQuadView *)self->_ringsView center];
    -[NTKFaceViewTapControl setCenter:](tapToLaunchButton, "setCenter:");
    long long v9 = [(NTKFaceViewTapControl *)self->_tapToLaunchButton highlightImageView];
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    long long v10 = [(NTKActivityDigitalFaceView *)self device];
    long long v11 = *(_OWORD *)&p_currentRingLayout->diameter;
    long long v24 = *(_OWORD *)&p_currentRingLayout->bottomEdgeInset;
    long long v25 = v11;
    double interspacing = p_currentRingLayout->interspacing;
    long long v12 = sub_E79C((uint64_t)&v24, v10, v22);
    [v9 setImage:v12];

    *(float *)&double v7 = p_currentRingLayout->diameter;
    long long v13 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    long long v14 = [v13 objectAtIndexedSubscript:0];
    LODWORD(v15) = LODWORD(v7);
    [v14 setGroupDiameter:v15];

    *(float *)&double v7 = p_currentRingLayout->thickness;
    id v16 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    v17 = [v16 objectAtIndexedSubscript:0];
    LODWORD(v18) = LODWORD(v7);
    [v17 setThickness:v18];

    *(float *)&double v7 = p_currentRingLayout->interspacing;
    v19 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    uint64_t v20 = [v19 objectAtIndexedSubscript:0];
    LODWORD(v21) = LODWORD(v7);
    [v20 setInterspacing:v21];
  }
}

- (CGPoint)_ringCenterForLayout:(RingLayout *)a3
{
  double v4 = a3->leftEdgeInset + a3->diameter * 0.5;
  [(NTKActivityDigitalFaceView *)self bounds];
  double v6 = v5 - (a3->diameter * 0.5 + a3->bottomEdgeInset);
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)_launchButtonPressed:(id)a3
{
  double v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int v16 = 138412546;
    v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = [(NTKActivityDigitalFaceView *)self dataMode];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@ launchButtonPressed action with data mode:%u", (uint8_t *)&v16, 0x12u);
  }
  if ([(NTKActivityDigitalFaceView *)self dataMode] == (char *)&dword_0 + 1)
  {
    [(NTKActivityFaceViewFactory *)self->_faceViewFactory launchActivityApp];
    [(NTKRingsMetalQuadView *)self->_ringsView frame];
    -[NTKActivityDigitalFaceView convertRect:toView:](self, "convertRect:toView:", self);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(NTKActivityDigitalFaceView *)self delegate];
    objc_msgSend(v15, "faceViewRequestedLaunchFromRect:", v8, v10, v12, v14);
  }
}

- (void)setDataMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKActivityDigitalFaceView;
  -[NTKActivityDigitalFaceView setDataMode:](&v5, "setDataMode:");
  [(NTKFaceViewTapControl *)self->_tapToLaunchButton setHighlighted:0];
  [(NTKFaceViewTapControl *)self->_tapToLaunchButton setUserInteractionEnabled:a3 == 1];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setDataMode:a3];
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11)
  {
    NTKKeylineCornerRadiusLarge();
    double v4 = NTKKeylineViewWithContinuousCurveCornerRadius();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKActivityDigitalFaceView;
    double v4 = [(NTKActivityDigitalFaceView *)&v6 _keylineViewForCustomEditMode:a3 slot:a4];
  }

  return v4;
}

- (unint64_t)_keylineLabelAlignmentForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11) {
    return 161;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)NTKActivityDigitalFaceView;
  return [(NTKActivityDigitalFaceView *)&v7 _keylineLabelAlignmentForCustomEditMode:a3 slot:a4];
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return [(NTKActivityFaceViewFactory *)self->_faceViewFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 11)
  {
    uint64_t v5 = [(NTKActivityDigitalFaceView *)self timeView];
    [v5 frame];
    double v7 = v6;
    [(NTKActivityDigitalFaceView *)self bounds];
    double v9 = v8;
    double v10 = [(NTKActivityDigitalFaceView *)self timeView];
    [v10 frame];
    double v12 = v11;

    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    double v13 = v19 + 0.0;
    double v14 = v7 + v18;
    double v15 = v9 - (v19 + v21);
    double v16 = v12 - (v18 + v20);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKActivityDigitalFaceView;
    [(NTKActivityDigitalFaceView *)&v17 _relativeKeylineFrameForCustomEditMode:a3 slot:a4];
  }
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_timeViewBackgroundRect
{
  unsigned int v3 = [(NTKActivityDigitalFaceView *)self timeView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (self->_showSeconds)
  {
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    double v12 = *(double *)&v27[32];
    double v13 = *(double *)&v27[33];
    double v14 = (double *)&v28;
    double v15 = *(double *)&v27[34];
  }
  else
  {
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    double v12 = v24;
    double v13 = v25;
    double v14 = (double *)v27;
    double v15 = v26;
  }
  double v16 = v5 + v13;
  double v17 = v7 + v12;
  double v18 = v9 - (*v14 + v13);
  double v19 = v11 - (v15 + v12);

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (a4 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  -[NTKActivityDigitalFaceView _ringAlphaForEditMode:](self, "_ringAlphaForEditMode:");
  [(NTKActivityDigitalFaceView *)self _ringAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKActivityDigitalFaceView _setActivityViewsAlpha:animated:](self, "_setActivityViewsAlpha:animated:", 0);
  double v8 = [(NTKActivityDigitalFaceView *)self timeView];
  [(NTKActivityDigitalFaceView *)self _timeAlphaForEditMode:a4];
  [(NTKActivityDigitalFaceView *)self _timeAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  [(NTKActivityDigitalFaceView *)self _rightTimeViewInsetForEditMode:a4];
  [(NTKActivityDigitalFaceView *)self _rightTimeViewInsetForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();

  -[NTKActivityDigitalFaceView setRightTimeViewInset:](self, "setRightTimeViewInset:");
}

- (void)setRightTimeViewInset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeTranslation(&v8, -a3, 0.0);
    CGAffineTransform v7 = v8;
    double v5 = [(NTKActivityDigitalFaceView *)self timeView];
    CGAffineTransform v6 = v7;
    [v5 setTransform:&v6];

    self->_rightTimeViewInset = a3;
  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKActivityDigitalFaceView;
  -[NTKActivityDigitalFaceView _configureForEditMode:](&v5, "_configureForEditMode:");
  if (a3 == 11) {
    [(NTKActivityDigitalFaceView *)self _configureForDetailEditing];
  }
  else {
    [(NTKActivityDigitalFaceView *)self _cleanUpAfterDetailEditing];
  }
}

- (void)_configureForDetailEditing
{
  if (!self->_densityEditingPolygonView)
  {
    unsigned int v3 = (NTKPolygonCylinderView *)objc_alloc_init((Class)NTKPolygonCylinderView);
    densityEditingPolygonView = self->_densityEditingPolygonView;
    self->_densityEditingPolygonView = v3;

    [(NTKPolygonCylinderView *)self->_densityEditingPolygonView setNumberOfSides:5];
    objc_super v5 = self->_densityEditingPolygonView;
    CGAffineTransform v6 = +[UIColor blackColor];
    [(NTKPolygonCylinderView *)v5 setBackgroundColor:v6];

    [(NTKPolygonCylinderView *)self->_densityEditingPolygonView setClipsToBounds:1];
    CGAffineTransform v7 = [(NTKActivityDigitalFaceView *)self timeView];
    [v7 frame];
    double v9 = v8;
    [(NTKActivityDigitalFaceView *)self bounds];
    double v11 = v10;
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    double v12 = v11 - v29;
    double v13 = [(NTKActivityDigitalFaceView *)self timeView];
    [v13 frame];
    double v15 = v14;

    double v16 = self->_densityEditingPolygonView;
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    -[NTKPolygonCylinderView setFrame:](v16, "setFrame:", v26 + 0.0, v9 + v25, v12 - (v26 + v28), v15 - (v25 + v27));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_F280;
    v24[3] = &unk_20C38;
    v24[4] = self;
    double v17 = objc_retainBlock(v24);
    double v18 = self->_densityEditingPolygonView;
    double v19 = ((void (*)(void *, uint64_t))v17[2])(v17, 1);
    [(NTKPolygonCylinderView *)v18 setView:v19 forSideAtIndex:0];

    double v20 = self->_densityEditingPolygonView;
    double v21 = ((void (*)(void *, void))v17[2])(v17, 0);
    [(NTKPolygonCylinderView *)v20 setView:v21 forSideAtIndex:1];

    [(NTKPolygonCylinderView *)self->_densityEditingPolygonView transitionToSideAtIndex:[(NTKActivityDigitalFaceView *)self showSeconds] ^ 1];
    double v22 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
    [v22 addSubview:self->_densityEditingPolygonView];

    double v23 = [(NTKActivityDigitalFaceView *)self timeView];
    [v23 setHidden:1];
  }
}

- (void)_cleanUpAfterDetailEditing
{
  unsigned int v3 = [(NTKActivityDigitalFaceView *)self timeView];
  [v3 setHidden:0];

  [(NTKPolygonCylinderView *)self->_densityEditingPolygonView removeFromSuperview];
  densityEditingPolygonView = self->_densityEditingPolygonView;
  self->_densityEditingPolygonView = 0;
}

- (double)_ringAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_timeAlphaForEditMode:(int64_t)a3
{
  double result = NTKEditModeDimmedAlpha;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_rightTimeViewInsetForEditMode:(int64_t)a3
{
  double result = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    return v4;
  }
  return result;
}

- (void)_setActivityViewsAlpha:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_F64C;
  v14[3] = &unk_20818;
  v14[4] = self;
  *(double *)&v14[5] = a3;
  CGAffineTransform v7 = objc_retainBlock(v14);
  double v8 = v7;
  if (v4)
  {
    +[UIView animateWithDuration:v7 animations:0.2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_F6D0;
    v13[3] = &unk_20818;
    v13[4] = self;
    *(double *)&v13[5] = a3;
    +[ARUIRingGroup animateWithDuration:v13 animations:0.2];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
    double v10 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    double v11 = [v10 objectAtIndexedSubscript:0];
    float v9 = a3;
    *(float *)&double v12 = v9;
    [v11 setOpacity:v12];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (a4 == 11)
  {
    -[NTKActivityDigitalFaceView setShowSeconds:](self, "setShowSeconds:", [v14 accuracy] == 0);
    [(NTKActivityDigitalFaceView *)self _relativeKeylineFrameForCustomEditMode:10 slot:0];
    -[UIView setFrame:](self->_timeLabelBackgroundView, "setFrame:");
    double v11 = [(NTKActivityDigitalFaceView *)self delegate];
    [v11 faceViewWantsCustomKeylineFramesReloadedForEditMode:10];
  }
  else
  {
    if (a4 != 10) {
      goto LABEL_6;
    }
    float v9 = [(NTKActivityDigitalFaceView *)self device];
    double v10 = [(NTKActivityDigitalFaceView *)self faceColorPalette];
    double v11 = +[NTKFaceColorScheme colorSchemeForDevice:v9 withFaceColorPalette:v10 units:16];

    double v12 = [(NTKActivityDigitalFaceView *)self timeView];
    double v13 = [v11 shiftedForegroundColor];
    [v12 setColor:v13];
  }
LABEL_6:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 11)
  {
    -[NTKPolygonCylinderView transitionToFraction:fromSideAtIndex:toSideAtIndex:](self->_densityEditingPolygonView, "transitionToFraction:fromSideAtIndex:toSideAtIndex:", -[NTKActivityDigitalFaceView _polygonIndexForAccuracy:](self, "_polygonIndexForAccuracy:", [v12 accuracy]), -[NTKActivityDigitalFaceView _polygonIndexForAccuracy:](self, "_polygonIndexForAccuracy:", objc_msgSend(v13, "accuracy")), a3);
  }
  else if (a6 == 10)
  {
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    CLKInterpolateBetweenFloatsClipped();
    double v16 = v15;
    double v17 = [(NTKActivityDigitalFaceView *)self device];
    double v18 = [(NTKActivityDigitalFaceView *)self interpolatedColorPalette];
    double v19 = [v18 fromPalette];
    double v20 = [(NTKActivityDigitalFaceView *)self interpolatedColorPalette];
    double v21 = [v20 toPalette];
    LOBYTE(v28) = 0;
    double v22 = +[NTKFaceColorScheme interpolationForDevice:v17 fromFaceColorPalette:v19 toFaceColorPalette:v21 fraction:16 units:16 brightenUnits:0 overrideColor:a3 alternateHighlight:v28];

    double v23 = [(NTKActivityDigitalFaceView *)self timeView];
    double v24 = [v22 shiftedForegroundColor];
    [v23 setColor:v24];

    timeLabelBackgroundView = self->_timeLabelBackgroundView;
    double v26 = [v22 shiftedForegroundColor];
    double v27 = [v26 colorWithAlphaComponent:v16];
    [(UIView *)timeLabelBackgroundView setBackgroundColor:v27];
  }
}

- (int64_t)_polygonIndexForAccuracy:(unint64_t)a3
{
  BOOL v4 = [(NTKActivityDigitalFaceView *)self device];
  id v5 = +[NTKDigitalTimeAccuracyOption indexForAccuracy:a3 forDevice:v4];

  return (int64_t)v5;
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v29.receiver = self;
  v29.super_class = (Class)NTKActivityDigitalFaceView;
  -[NTKActivityDigitalFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v29, "_applyRubberBandingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 11)
  {
    NTKScaleForRubberBandingFraction();
    CGFloat v14 = v13;
    NTKAlphaForRubberBandingFraction();
    double v16 = v15;
    densityEditingPolygonView = self->_densityEditingPolygonView;
    CGAffineTransformMakeScale(&v24, v14, v14);
    [(NTKPolygonCylinderView *)densityEditingPolygonView setTransform:&v24];
    [(NTKPolygonCylinderView *)self->_densityEditingPolygonView setAlpha:v16];
  }
  else
  {
    if (a4 == 10)
    {
      NTKScaleForRubberBandingFraction();
      CGFloat v19 = v18;
      NTKAlphaForRubberBandingFraction();
      double v10 = v20;
      memset(&v27, 0, sizeof(v27));
      CGAffineTransformMakeScale(&v27, v19, v19);
      [(NTKActivityDigitalFaceView *)self rightTimeViewInset];
      CGAffineTransform v25 = v27;
      CGAffineTransformTranslate(&v26, &v25, -v21, 0.0);
      CGAffineTransform v27 = v26;
      double v22 = [(NTKActivityDigitalFaceView *)self timeView];
      CGAffineTransform v26 = v27;
      [v22 setTransform:&v26];

      id v12 = [(NTKActivityDigitalFaceView *)self timeView];
    }
    else
    {
      if (a4) {
        return;
      }
      NTKScaleForRubberBandingFraction();
      CGFloat v8 = v7;
      NTKAlphaForRubberBandingFraction();
      double v10 = v9;
      double v11 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
      CGAffineTransformMakeScale(&v28, v8, v8);
      [v11 setTransform:&v28];

      id v12 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
    }
    double v23 = v12;
    [v12 setAlpha:v10];
  }
}

- (id)_swatchColorForColorOption:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NTKFaceColorPalette) initWithFaceClass:objc_opt_class()];
  id v5 = [v3 pigmentEditOption];

  [v4 setPigmentEditOption:v5];
  CGAffineTransform v6 = [v4 primaryShiftedColor];

  return v6;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKActivityDigitalFaceView;
  -[NTKActivityDigitalFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v16, "_applyBreathingFraction:forCustomEditMode:slot:", a4, a5);
  if (a4 == 11)
  {
    NTKLargeElementScaleForBreathingFraction();
    densityEditingPolygonView = self->_densityEditingPolygonView;
    CGAffineTransformMakeScale(&v12, v11, v11);
    [(NTKPolygonCylinderView *)densityEditingPolygonView setTransform:&v12];
  }
  else if (a4 == 10)
  {
    NTKLargeElementScaleForBreathingFraction();
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformMakeScale(&v15, v7, v7);
    [(NTKActivityDigitalFaceView *)self rightTimeViewInset];
    CGAffineTransform v13 = v15;
    CGAffineTransformTranslate(&v14, &v13, -v8, 0.0);
    CGAffineTransform v15 = v14;
    double v9 = [(NTKActivityDigitalFaceView *)self timeView];
    CGAffineTransform v14 = v15;
    [v9 setTransform:&v14];
  }
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return [(NTKActivityFaceViewFactory *)self->_faceViewFactory complicationPickerStyleForSlot:a3];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v4 _cleanupAfterEditing];
  [(UIView *)self->_timeLabelBackgroundView removeFromSuperview];
  timeLabelBackgroundView = self->_timeLabelBackgroundView;
  self->_timeLabelBackgroundView = 0;

  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)_prepareForEditing
{
  v14.receiver = self;
  v14.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v14 _prepareForEditing];
  if (!self->_timeLabelBackgroundView)
  {
    id v3 = objc_alloc((Class)UIView);
    objc_super v4 = [(NTKActivityDigitalFaceView *)self timeView];
    [v4 frame];
    id v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    timeLabelBackgroundView = self->_timeLabelBackgroundView;
    self->_timeLabelBackgroundView = v5;

    CGFloat v7 = self->_timeLabelBackgroundView;
    double v8 = +[UIColor clearColor];
    [(UIView *)v7 setBackgroundColor:v8];

    double v9 = [(UIView *)self->_timeLabelBackgroundView layer];
    NTKKeylineCornerRadiusLarge();
    objc_msgSend(v9, "setCornerRadius:");

    double v10 = [(NTKActivityDigitalFaceView *)self timeView];
    CGFloat v11 = [v10 superview];
    CGAffineTransform v12 = self->_timeLabelBackgroundView;
    CGAffineTransform v13 = [(NTKActivityDigitalFaceView *)self timeView];
    [v11 insertSubview:v12 below:v13];
  }
  [(NTKActivityDigitalFaceView *)self _updatePausedState];
}

- (void)_applyShowsLockedUI
{
  v4.receiver = self;
  v4.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v4 _applyShowsLockedUI];
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CGAffineTransform v6 = "-[NTKActivityDigitalFaceView _applyShowsLockedUI]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setShowsLockedContent:[(NTKActivityDigitalFaceView *)self showsLockedUI]];
}

- (void)_applyShowsCanonicalContent
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _applyShowsCanonicalContent];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory setShowsCanonicalContent:[(NTKActivityDigitalFaceView *)self showsCanonicalContent]];
}

- (void)_prepareWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _prepareWristRaiseAnimation];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory prepareWristRaiseAnimation];
}

- (void)_performWristRaiseAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v3 _performWristRaiseAnimation];
  [(NTKActivityFaceViewFactory *)self->_faceViewFactory performWristRaiseAnimation];
}

- (void)applyDataModel:(id)a3 animated:(BOOL)a4
{
}

- (void)applyDataModelWithUnfilledRings:(id)a3
{
}

- (void)_applyCurrentDataModelByFraction:(double)a3 updateLabels:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(NTKActivityFaceViewFactory *)self->_faceViewFactory currentDataModel];
  [(NTKActivityDigitalFaceView *)self _applyDataModel:v9 byFraction:v6 updateLabels:v5 animated:a3];
}

- (void)_applyDataModel:(id)a3 byFraction:(double)a4 updateLabels:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if ([v10 activityMoveMode] == (char *)&dword_0 + 2) {
    [v10 appleMoveTimeCompletionPercentage];
  }
  else {
    [v10 activeEnergyCompletionPercentage];
  }
  double v12 = v11;
  double v13 = ARUIRingPercentageValueNoRing;
  BOOL v63 = v11 == ARUIRingPercentageValueNoRing;
  [v10 appleExerciseTimeCompletionPercentage];
  double v15 = v14;
  double v16 = ARUIRingPercentageValueNoRing;
  BOOL v62 = v14 == ARUIRingPercentageValueNoRing;
  [v10 appleStandHourCompletionPercentage];
  double v18 = v17;
  double v19 = ARUIRingPercentageValueNoRing;
  BOOL v61 = v17 == ARUIRingPercentageValueNoRing;
  id v20 = [v10 paused];
  double v21 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    double v23 = (NTKActivityDigitalFaceView *)objc_claimAutoreleasedReturnValue();
    CGAffineTransform v24 = [(NTKActivityFaceViewFactory *)self->_faceViewFactory debugStringForDataModel:v10];
    *(_DWORD *)buf = 138413314;
    v71 = v23;
    __int16 v72 = 2112;
    double v73 = *(double *)&v10;
    __int16 v74 = 2112;
    v75 = v24;
    __int16 v76 = 2048;
    double v77 = a4;
    __int16 v78 = 1024;
    BOOL v79 = v7;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%@ rings updated with data model %@ of kind %@ fraction: %f update labels: %i", buf, 0x30u);
  }
  if (v12 == v13) {
    double v25 = ARUIRingPercentageValueNoRing;
  }
  else {
    double v25 = v12 * a4;
  }
  if (self->_ringsView && vabdd_f64(self->_lastMovePercentage, v25) > 2.22044605e-16)
  {
    CGAffineTransform v26 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    CGAffineTransform v27 = [v26 objectAtIndexedSubscript:0];
    *(float *)&double v28 = v25;
    [v27 setActiveEnergyPercentage:v6 animated:v28];

    self->_lastMovePercentage = v25;
    objc_super v29 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v71 = self;
      __int16 v72 = 2048;
      double v73 = v25;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Digital Face %@ rings move percentage changed to: %1.3f", buf, 0x16u);
    }
  }
  if (v15 == v16)
  {
    double v30 = ARUIRingPercentageValueNoRing;
  }
  else
  {
    [v10 appleExerciseTimeCompletionPercentage];
    double v30 = v31 * a4;
  }
  if (self->_ringsView && vabdd_f64(self->_lastExercisePercentage, v30) > 2.22044605e-16)
  {
    long long v32 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    long long v33 = [v32 objectAtIndexedSubscript:0];
    *(float *)&double v34 = v30;
    [v33 setExerciseMinutesPercentage:v6 animated:v34];

    self->_lastExercisePercentage = v30;
    long long v35 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      long long v37 = (NTKActivityDigitalFaceView *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = v37;
      __int16 v72 = 2048;
      double v73 = v30;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "%@ rings exercise percentage changed to: %1.3f", buf, 0x16u);
    }
  }
  if (v18 == v19)
  {
    double v38 = ARUIRingPercentageValueNoRing;
  }
  else
  {
    [v10 appleStandHourCompletionPercentage];
    double v38 = v39 * a4;
  }
  if (self->_ringsView)
  {
    if (vabdd_f64(self->_lastStandPercentage, v38) <= 2.22044605e-16) {
      goto LABEL_30;
    }
    long long v40 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
    long long v41 = [v40 objectAtIndexedSubscript:0];
    *(float *)&double v42 = v38;
    [v41 setStandHoursPercentage:v6 animated:v42];

    self->_lastStandPercentage = v38;
    long long v43 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      long long v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      long long v45 = (NTKActivityDigitalFaceView *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = v45;
      __int16 v72 = 2048;
      double v73 = v38;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%@ rings stand percentage changed to: %1.3f", buf, 0x16u);
    }
    if (self->_ringsView)
    {
LABEL_30:
      if (self->_lastPausedState != v20)
      {
        self->_lastPausedState = (char)v20;
        long long v46 = [(NTKRingsQuad *)self->_ringsQuad ringGroups];
        long long v47 = [v46 objectAtIndexedSubscript:0];
        uint64_t v48 = [v47 rings];
        sub_10ABC(v48, (int)v20);

        [(NTKActivityDigitalFaceView *)self _updateActivityLabelColors:v20];
        objc_super v49 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (NTKActivityDigitalFaceView *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v71 = v51;
          __int16 v72 = 1024;
          LODWORD(v73) = v20;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "%@ rings paused state changed to: %u", buf, 0x12u);
        }
      }
    }
  }
  if (v7)
  {
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10D08;
    v64[3] = &unk_20730;
    v64[4] = self;
    double v66 = a4;
    id v65 = v10;
    BOOL v67 = v63;
    BOOL v68 = v62;
    BOOL v69 = v61;
    v52 = objc_retainBlock(v64);
    v53 = v52;
    if (v6)
    {
      v54 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
      +[UIView transitionWithView:v54 duration:5242880 options:v53 animations:0 completion:0.2];
    }
    else
    {
      ((void (*)(void *))v52[2])(v52);
    }
    v55 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v57 = (NTKActivityDigitalFaceView *)objc_claimAutoreleasedReturnValue();
      v58 = [(UILabel *)self->_moveLabel text];
      v59 = [(UILabel *)self->_exerciseLabel text];
      double v60 = [(UILabel *)self->_standLabel text];
      *(_DWORD *)buf = 138413058;
      v71 = v57;
      __int16 v72 = 2112;
      double v73 = *(double *)&v58;
      __int16 v74 = 2112;
      v75 = v59;
      __int16 v76 = 2112;
      double v77 = v60;
      _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "%@ rings labels updated with new move %@, exercise %@, stand %@", buf, 0x2Au);
    }
  }
}

- (void)timeTravelDateEnteredOrExitedTimelineBounds:(BOOL)a3
{
  double v3 = NTKEditModeDimmedAlpha;
  if (a3) {
    double v3 = 1.0;
  }
  [(NTKActivityDigitalFaceView *)self _setActivityViewsAlpha:1 animated:v3];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  BOOL v6 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKActivityDigitalFaceView;
  [(NTKActivityDigitalFaceView *)&v8 setOverrideDate:v6 duration:a4];
  timeDensityEditingOverrideDate = self->_timeDensityEditingOverrideDate;
  self->_timeDensityEditingOverrideDate = v6;
}

- (unint64_t)textLayoutStyleForSlot:(id)a3
{
  return (unint64_t)[(NTKActivityDigitalFaceView *)self layoutStyleForSlot:a3];
}

- (void)setShowSeconds:(BOOL)a3
{
  self->_BOOL showSeconds = a3;
  [(NTKActivityDigitalFaceView *)self _updateTimeViewSecondsDisplayState];
}

- (void)_updateTimeViewSecondsDisplayState
{
  id v8 = [(NTKActivityDigitalFaceView *)self timeView];
  if (self->_showSeconds != [v8 showSeconds])
  {
    [v8 removeFromSuperview];
    double v3 = [(NTKActivityDigitalFaceView *)self timeView];
    objc_super v4 = [v3 color];

    [(NTKActivityDigitalFaceView *)self setTimeView:0];
    [(NTKActivityDigitalFaceView *)self _createTimeViewIfNecessary];
    id v5 = [v8 isHidden];
    BOOL v6 = [(NTKActivityDigitalFaceView *)self timeView];
    [v6 setHidden:v5];

    BOOL v7 = [(NTKActivityDigitalFaceView *)self timeView];
    [v7 setColor:v4];

    [(NTKActivityDigitalFaceView *)self layoutIfNeeded];
  }
}

- (void)_enumerateActivityLabels:(id)a3
{
  objc_super v4 = (void (**)(id, UILabel *, uint64_t))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_exerciseLabel, 1);
  (*v4)(v6, self->_standLabel, 2);
}

- (id)_newActivityLabelSubview
{
  id v3 = objc_alloc_init((Class)UILabel);
  objc_super v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(NTKActivityDigitalFaceView *)self _labelFontMonospaced:0];
  [v3 setFont:v5];

  [v3 setTextAlignment:2];
  id v6 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
  [v6 addSubview:v3];

  [v3 setNumberOfLines:1];
  return v3;
}

- (void)_createActivityRelatedUIs
{
  if (!self->_ringsView)
  {
    id v3 = [NTKRingsMetalQuadView alloc];
    [(NTKActivityDigitalFaceView *)self bounds];
    objc_super v4 = -[NTKRingsMetalQuadView initWithFrame:identifier:options:colorSpace:](v3, "initWithFrame:identifier:options:colorSpace:", @"ActD", 16, 1);
    ringsView = self->_ringsView;
    self->_ringsView = v4;

    id v6 = (NTKRingsQuad *)[(id)objc_opt_class() _newRingsQuad];
    ringsQuad = self->_ringsQuad;
    self->_ringsQuad = v6;

    [(NTKRingsQuad *)self->_ringsQuad setDelegate:self];
    [(NTKRingsMetalQuadView *)self->_ringsView setPaused:0];
    [(NTKRingsMetalQuadView *)self->_ringsView setPreferredFramesPerSecond:60];
    [(NTKRingsMetalQuadView *)self->_ringsView addQuad:self->_ringsQuad];
    id v8 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
    [v8 addSubview:self->_ringsView];

    [(NTKRingsMetalQuadView *)self->_ringsView setUserInteractionEnabled:0];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_29658);
  id WeakRetained = objc_loadWeakRetained(&qword_29660);
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v11 = [(NTKActivityDigitalFaceView *)self device];
    id v12 = objc_loadWeakRetained(&qword_29660);
    if (v11 == v12)
    {
      double v13 = [(NTKActivityDigitalFaceView *)self device];
      id v14 = [v13 version];
      uint64_t v15 = qword_29668;

      if (v14 == (id)v15) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  double v16 = [(NTKActivityDigitalFaceView *)self device];
  objc_storeWeak(&qword_29660, v16);

  id v17 = objc_loadWeakRetained(&qword_29660);
  qword_29668 = (uint64_t)[v17 version];

  double v18 = [(NTKActivityDigitalFaceView *)self device];
  xmmword_29648 = (__int128)CGSizeZero;

LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_29658);
  if (CLKSizeIsEmpty())
  {
    double v19 = [(NTKActivityDigitalFaceView *)self _labelFontMonospaced:1];
    objc_msgSend(@"0", "_legacy_sizeWithFont:", v19);
    *(void *)&xmmword_29648 = v20;
    *((void *)&xmmword_29648 + 1) = v21;
  }
  if (!self->_moveLabel)
  {
    double v22 = [(NTKActivityDigitalFaceView *)self _newActivityLabelSubview];
    moveLabel = self->_moveLabel;
    self->_moveLabel = v22;
  }
  if (!self->_exerciseLabel)
  {
    CGAffineTransform v24 = [(NTKActivityDigitalFaceView *)self _newActivityLabelSubview];
    exerciseLabel = self->_exerciseLabel;
    self->_exerciseLabel = v24;
  }
  if (!self->_standLabel)
  {
    CGAffineTransform v26 = [(NTKActivityDigitalFaceView *)self _newActivityLabelSubview];
    standLabel = self->_standLabel;
    self->_standLabel = v26;
  }
  if (!self->_tapToLaunchButton)
  {
    double v28 = (NTKFaceViewTapControl *)objc_opt_new();
    tapToLaunchButton = self->_tapToLaunchButton;
    self->_tapToLaunchButton = v28;

    [(NTKFaceViewTapControl *)self->_tapToLaunchButton addTarget:self action:"_launchButtonPressed:" forControlEvents:64];
    double v30 = [(NTKFaceViewTapControl *)self->_tapToLaunchButton highlightImageView];
    [(NTKActivityDigitalFaceView *)self _layoutConstants];
    double v31 = v38;
    long long v32 = [(NTKActivityDigitalFaceView *)self device];
    long long v33 = *(_OWORD *)&self->_currentRingLayout.diameter;
    v36[0] = *(_OWORD *)&self->_currentRingLayout.bottomEdgeInset;
    v36[1] = v33;
    double interspacing = self->_currentRingLayout.interspacing;
    double v34 = sub_E79C((uint64_t)v36, v32, v31);
    [v30 setImage:v34];

    long long v35 = [(NTKActivityDigitalFaceView *)self foregroundContainerView];
    [v35 addSubview:self->_tapToLaunchButton];
  }
  [(NTKActivityDigitalFaceView *)self _updateActivityLabelColors:self->_lastPausedState];
}

- (void)_removeActivityRelatedUIs
{
  [(NTKRingsMetalQuadView *)self->_ringsView removeFromSuperview];
  ringsView = self->_ringsView;
  self->_ringsView = 0;

  [(UILabel *)self->_moveLabel removeFromSuperview];
  moveLabel = self->_moveLabel;
  self->_moveLabel = 0;

  [(UILabel *)self->_exerciseLabel removeFromSuperview];
  exerciseLabel = self->_exerciseLabel;
  self->_exerciseLabel = 0;

  [(UILabel *)self->_standLabel removeFromSuperview];
  standLabel = self->_standLabel;
  self->_standLabel = 0;

  [(UIView *)self->_timeLabelBackgroundView removeFromSuperview];
  timeLabelBackgroundView = self->_timeLabelBackgroundView;
  self->_timeLabelBackgroundView = 0;

  [(NTKFaceViewTapControl *)self->_tapToLaunchButton removeFromSuperview];
  tapToLaunchButton = self->_tapToLaunchButton;
  self->_tapToLaunchButton = 0;
}

- (void)_updateActivityLabelColors:(BOOL)a3
{
  if (a3)
  {
    NTKPausedNonGradientTextColor();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v4 = NTKPausedNonGradientTextColor();
    NTKPausedNonGradientTextColor();
  }
  else
  {
    NTKMoveNonGradientTextColor();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v4 = NTKExerciseNonGradientTextColor();
    NTKStandNonGradientTextColor();
  id v5 = };
  [(UILabel *)self->_moveLabel setTextColor:v6];
  [(UILabel *)self->_exerciseLabel setTextColor:v4];
  [(UILabel *)self->_standLabel setTextColor:v5];
}

- (double)_blinkerAndSecondsWidth
{
  id v3 = [(NTKActivityDigitalFaceView *)self timeView];
  objc_super v4 = [v3 text];

  if (fabs(self->_blinkerAndSecondsWidth) < 0.00000011920929 && [v4 length])
  {
    id v5 = +[NSCharacterSet punctuationCharacterSet];
    id v6 = [v4 rangeOfCharacterFromSet:v5 options:4];

    BOOL v7 = objc_msgSend(v4, "substringWithRange:", v6, (unsigned char *)objc_msgSend(v4, "length") - v6);
    NSAttributedStringKey v13 = NSFontAttributeName;
    id v8 = [(NTKActivityDigitalFaceView *)self _labelFontMonospaced:1];
    id v14 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    [v7 sizeWithAttributes:v9];
    self->_double blinkerAndSecondsWidth = v10;
  }
  double blinkerAndSecondsWidth = self->_blinkerAndSecondsWidth;

  return blinkerAndSecondsWidth;
}

+ (id)_newRingsQuad
{
  id v2 = [objc_alloc((Class)ARUIRingGroup) initWithNumberOfRings:3];
  [v2 setTranslation:0.0];
  for (uint64_t i = 0; i != 3; ++i)
  {
    objc_super v4 = [v2 rings];
    id v5 = [v4 objectAtIndexedSubscript:i];
    [v5 setPercentage:0.0];
  }
  id v6 = [v2 rings];
  sub_10ABC(v6, 0);

  BOOL v7 = +[NTKActivityFaceViewFactory sharedRingsViewRenderer];
  id v8 = [NTKRingsQuad alloc];
  id v12 = v2;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  double v10 = [(NTKRingsQuad *)v8 initWithRingGroups:v9 renderer:v7];

  return v10;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  id v2 = +[NTKActivityFaceViewFactory prelaunchApplicationIdentifiers];
  id v3 = +[NSOrderedSet orderedSetWithSet:v2];

  return v3;
}

- (id)_labelFontMonospaced:(BOOL)a3
{
  [(NTKActivityDigitalFaceView *)self _layoutConstants];
  objc_super v4 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:v9 design:UIFontWeightMedium];
  id v5 = v4;
  if (a3)
  {
    id v6 = [v4 CLKFontWithMonospacedNumbers];
  }
  else
  {
    id v6 = v4;
  }
  BOOL v7 = v6;

  return v7;
}

- (double)rightTimeViewInset
{
  return self->_rightTimeViewInset;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeDensityEditingOverrideDate, 0);
  objc_storeStrong((id *)&self->_densityEditingPolygonView, 0);
  objc_storeStrong((id *)&self->_timeLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_tapToLaunchButton, 0);
  objc_storeStrong((id *)&self->_standLabel, 0);
  objc_storeStrong((id *)&self->_exerciseLabel, 0);
  objc_storeStrong((id *)&self->_moveLabel, 0);
  objc_storeStrong((id *)&self->_ringsQuad, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);

  objc_storeStrong((id *)&self->_faceViewFactory, 0);
}

@end