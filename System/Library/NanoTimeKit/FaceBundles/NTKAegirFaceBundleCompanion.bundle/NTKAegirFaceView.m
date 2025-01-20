@interface NTKAegirFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_canEnterInteractiveMode;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_shouldHandleHardwareEvents;
- (BOOL)_shouldHideStatusBarForViewMode:(int64_t)a3;
- (BOOL)_styleOptionIsRandom;
- (BOOL)_vistaOptionIsRandom;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (CGRect)_topComplicationFrame;
- (NTKAegirFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)_verticalPaddingForStatusBar;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (double)topComplicationFontSize;
- (double)topComplicationFontWeight;
- (id)_centerTimeLabelStyleForViewMode:(int64_t)a3;
- (id)_cornerTimeLabelStyleForViewMode:(int64_t)a3;
- (id)_createDigitalTimeLabel;
- (id)_createVistaView;
- (id)_date;
- (id)_detachedComplicationDisplays;
- (id)_homeScreenDateLabelFont;
- (id)_homeScreenTimeViewConfiguration;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_numeralSwatchForNumeralOption:(id)a3 typefaceOption:(id)a4 vistaOption:(id)a5 styleOption:(id)a6;
- (id)_randomVistaImage;
- (id)_renderNumeralSwatchForNumeralOption:(id)a3 typefaceOption:(id)a4 vistaOption:(id)a5 styleOption:(id)a6;
- (id)_renderTypefaceSwatchForTypefaceOption:(id)a3 vistaOption:(id)a4 styleOption:(id)a5;
- (id)_renderVistaSwatchForVistaOption:(id)a3 styleOption:(id)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_typefaceSwatchForTypefaceOption:(id)a3 vistaOption:(id)a4 styleOption:(id)a5;
- (id)_vistaSwatchForVistaOption:(id)a3 styleOption:(id)a4;
- (id)topComplicationFont;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)shuffledStyleForStyle:(unint64_t)a3 shuffle:(BOOL)a4;
- (unint64_t)shuffledVistaForVista:(unint64_t)currentShuffledVista shuffle:(BOOL)a4;
- (void)_animateTransitionToViewMode:(int64_t)a3;
- (void)_animateTransitionToViewMode:(int64_t)a3 completion:(id)a4;
- (void)_applyDataMode;
- (void)_applyDataModeAnimated:(BOOL)a3;
- (void)_applyFromElementOrder:(unint64_t)a3 toElementOrder:(unint64_t)a4 fraction:(double)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyViewMode:(int64_t)a3;
- (void)_applyVista:(unint64_t)a3;
- (void)_asyncUpdateLocale;
- (void)_asyncUpdateTime;
- (void)_becameActiveFace;
- (void)_becameInactiveFace;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_cleanupAfterZoom;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_disableCrown;
- (void)_enableCrownForAegirVista:(unint64_t)a3;
- (void)_interpolateFromPose:(const NTKAegirFaceViewAnimationPose *)a3 toPose:(const NTKAegirFaceViewAnimationPose *)a4 progress:(float)a5;
- (void)_invalidateTimeLabelStyles;
- (void)_layoutPhaseLabel;
- (void)_layoutSpheroidLabel:(int)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_physicalButtonDelayedBlockFired;
- (void)_prepareForEditing;
- (void)_prepareToZoom;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setComplicationsInteractionEnabled:(BOOL)a3;
- (void)_setElementOrder:(unint64_t)a3;
- (void)_setFaceViewModeActive;
- (void)_setFaceViewModeDeactive;
- (void)_setFaceViewModeInteractive;
- (void)_setFaceViewModeSupplemental;
- (void)_setIsAnimatingViewMode:(BOOL)a3;
- (void)_setNumerals:(unint64_t)a3;
- (void)_setTypeface:(unint64_t)a3;
- (void)_setUpViews;
- (void)_setViewMode:(int64_t)a3;
- (void)_shuffleStyleIfNecessary;
- (void)_shuffleVistaIfNecessary;
- (void)_unloadSnapshotContentViews;
- (void)_updateLocaleAnimated:(BOOL)a3;
- (void)_wheelDelayedBlockFired;
- (void)astronomyVistaControllerWillEnterInteractiveMode:(id)a3;
- (void)astronomyVistaControllerWillEnterSupplementalMode:(id)a3;
- (void)astronomyVistaControllerWillLeaveInteractiveMode:(id)a3;
- (void)astronomyVistaControllerWillLeaveSupplementalMode:(id)a3;
- (void)dealloc;
- (void)exitInteractiveMode;
- (void)exitInteractiveModeAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)shuffleRandomVista;
@end

@implementation NTKAegirFaceView

- (NTKAegirFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKAegirFaceView;
  v9 = [(NTKAegirFaceView *)&v18 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = [(NTKDigitialUtilitarianFaceViewComplicationFactory *)[NTKAegirFaceViewComplicationFactory alloc] initForDevice:v8];
    uint64_t v11 = *MEMORY[0x1E4F79F68];
    v19[0] = *MEMORY[0x1E4F79F60];
    v19[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v10 setSupportedComplicationSlots:v12];

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v10 setUsesLegibility:1 faceView:v9];
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v10 setForegroundColor:v13 faceView:v9];

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v10 setAlpha:v9 faceView:1.0];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v10;
    v15 = v10;

    v9->_currentShuffledStyle = 3;
    v9->_homeScreenAlphaOverride = 1.0;
    v16 = [MEMORY[0x1E4F19A98] sharedMonitor];

    [v16 addSensitiveUIObserver:v9];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v4 dealloc];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v3 screenDidTurnOffAnimated:a3];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v5 screenWillTurnOnAnimated:a3];
  if ([(NTKAegirFaceView *)self _styleOptionIsRandom])
  {
    objc_super v4 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
    [v4 setFrameInterval:0];
  }
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKAegirFaceView *)self _setUpViews];
}

- (void)_setUpViews
{
  objc_super v3 = [(NTKAegirFaceView *)self contentView];
  [(NTKAegirFaceView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NTKAegirFaceView *)self device];
  self->_viewMode = 1;
  *((unsigned char *)self + 1176) &= ~1u;
  *((unsigned char *)self + 1176) &= ~2u;
  v13 = (NSDateFormatter *)objc_opt_new();
  v14 = self->_scrubDateFormatter[0];
  self->_scrubDateFormatter[0] = v13;

  v15 = (NSDateFormatter *)objc_opt_new();
  v16 = self->_scrubDateFormatter[1];
  self->_scrubDateFormatter[1] = v15;

  v17 = (NSDateFormatter *)objc_opt_new();
  objc_super v18 = self->_scrubDateFormatter[2];
  self->_scrubDateFormatter[2] = v17;

  objc_storeStrong((id *)&self->_scrubDateFormatter[4], self->_scrubDateFormatter[2]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[5], self->_scrubDateFormatter[2]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[6], self->_scrubDateFormatter[0]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[7], self->_scrubDateFormatter[0]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[3], self->_scrubDateFormatter[0]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[8], self->_scrubDateFormatter[0]);
  objc_storeStrong((id *)&self->_scrubDateFormatter[9], self->_scrubDateFormatter[0]);
  _NTKAegirLayoutForDevice(v12);
  v19 = [(NTKAegirFaceView *)self _createVistaView];
  [v3 addSubview:v19];
  [v19 setObserver:self];
  v20 = [MEMORY[0x1E4F7A008] sharedLocationManager];
  v21 = [v20 currentLocation];

  if (v21) {
    [v20 currentLocation];
  }
  else {
  v22 = [v20 anyLocation];
  }
  [v22 coordinate];

  astronomyController = self->_astronomyController;
  v24 = [v20 currentLocation];
  v91 = v20;
  v25 = [v20 anyLocation];
  [(NUNIAstronomyVistaController *)astronomyController updateLocation:v24 fallbackLocation:v25];

  v26 = [(NTKAegirFaceView *)self _createDigitalTimeLabel];
  centerTimeLabelFront = self->_centerTimeLabelFront;
  self->_centerTimeLabelFront = v26;

  v28 = [(NTKAegirFaceView *)self _createDigitalTimeLabel];
  centerTimeLabelBack = self->_centerTimeLabelBack;
  self->_centerTimeLabelBack = v28;

  v30 = [(NTKAegirFaceView *)self _createDigitalTimeLabel];
  cornerTimeLabel = self->_cornerTimeLabel;
  self->_cornerTimeLabel = v30;

  v32 = [v19 quadViews];
  uint64_t v33 = [v32 firstObject];

  [v19 insertSubview:self->_centerTimeLabelFront aboveSubview:v33];
  v94 = v19;
  v90 = (void *)v33;
  [v19 insertSubview:self->_centerTimeLabelBack belowSubview:v33];
  double v34 = *MEMORY[0x1E4F43930];
  v92 = v12;
  v35 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v12, v5, v7, v9, v11, *MEMORY[0x1E4F43930]), "designatorFont");
  [v35 pointSize];
  double v37 = v36;

  v38 = [MEMORY[0x1E4F19A50] systemFontOfSize:v37 weight:v34];
  v39 = [v38 CLKFontWithMonospacedNumbers];
  v40 = [v39 CLKFontWithAlternativePunctuation];

  v41 = [v40 CLKFontWithMonospacedNumbers];
  uint64_t v42 = [v41 CLKFontWithAlternativePunctuation];

  id v43 = objc_alloc(MEMORY[0x1E4F79F98]);
  double v44 = *MEMORY[0x1E4F1DB28];
  double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v48 = (CLKUIColoringLabel *)objc_msgSend(v43, "initWithFrame:options:", 0, *MEMORY[0x1E4F1DB28], v45, v46, v47);
  scrubLabel = self->_scrubLabel;
  self->_scrubLabel = v48;

  [(CLKUIColoringLabel *)self->_scrubLabel setFont:v42];
  [(CLKUIColoringLabel *)self->_scrubLabel setUsesLegibility:1];
  v50 = self->_scrubLabel;
  v51 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CLKUIColoringLabel *)v50 setTextColor:v51];

  v52 = self->_scrubLabel;
  v53 = [MEMORY[0x1E4F428B8] blackColor];
  [(CLKUIColoringLabel *)v52 setShadowColor:v53];

  [v3 addSubview:self->_scrubLabel];
  v54 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F79F98]), "initWithFrame:options:", 0, v44, v45, v46, v47);
  phaseLabel = self->_phaseLabel;
  self->_phaseLabel = v54;

  [(CLKUIColoringLabel *)self->_phaseLabel setNumberOfLines:0];
  [(CLKUIColoringLabel *)self->_phaseLabel setUsesLegibility:1];
  [(CLKUIColoringLabel *)self->_phaseLabel setFont:v42];
  v56 = self->_phaseLabel;
  v57 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CLKUIColoringLabel *)v56 setTextColor:v57];

  v58 = self->_phaseLabel;
  v59 = [MEMORY[0x1E4F428B8] blackColor];
  [(CLKUIColoringLabel *)v58 setShadowColor:v59];

  [v3 addSubview:self->_phaseLabel];
  v60 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F79F98]), "initWithFrame:options:", 0, v44, v45, v46, v47);
  travelTimeLabel = self->_travelTimeLabel;
  self->_travelTimeLabel = v60;

  [(CLKUIColoringLabel *)self->_travelTimeLabel setTextAlignment:0];
  [(CLKUIColoringLabel *)self->_travelTimeLabel setFont:v42];
  [(CLKUIColoringLabel *)self->_travelTimeLabel setUsesLegibility:1];
  v62 = self->_travelTimeLabel;
  v63 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CLKUIColoringLabel *)v62 setTextColor:v63];

  v64 = self->_travelTimeLabel;
  v65 = [MEMORY[0x1E4F428B8] blackColor];
  [(CLKUIColoringLabel *)v64 setShadowColor:v65];

  [v3 addSubview:self->_travelTimeLabel];
  v89 = (void *)v42;
  [(NTKDigitalTimeLabel *)self->_cornerTimeLabel setFont:v42];
  [v3 addSubview:self->_cornerTimeLabel];
  v66 = self;
  v67 = v3;
  v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v44, v45, v46, v47);
  v69 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(float *)&dword_1EA8FC818];
  [v68 setFont:v69];

  v70 = [MEMORY[0x1E4F428B8] whiteColor];
  [v68 setTextColor:v70];

  v93 = v66;
  objc_initWeak(location, v66);
  int v71 = 0;
  uint64_t v72 = MEMORY[0x1E4F143A8];
  v73 = MEMORY[0x1E4F14428];
  do
  {
    block[0] = v72;
    block[1] = 3221225472;
    block[2] = sub_1DAFD186C;
    block[3] = &unk_1E6BE3AB8;
    objc_copyWeak(&v98, location);
    int v99 = v71;
    id v74 = v68;
    id v96 = v74;
    id v75 = v67;
    id v97 = v75;
    dispatch_async(v73, block);

    objc_destroyWeak(&v98);
    ++v71;
  }
  while (v71 != 8);
  [(NTKAegirFaceView *)v93 _invalidateTimeLabelStyles];
  [(NTKAegirFaceView *)v93 _applyVista:[(NUNIAstronomyVistaController *)v93->_astronomyController vista]];
  [(NTKAegirFaceView *)v93 _applyViewMode:1];
  [(NTKAegirFaceView *)v93 _applyDataModeAnimated:0];
  [(NTKAegirFaceView *)v93 _updateLocaleAnimated:0];
  [v94 updateSunLocationAnimated:0];
  [(NTKAegirFaceView *)v93 setNeedsLayout];
  v76 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v76 addObserver:v93 selector:sel__asyncUpdateTime name:*MEMORY[0x1E4F436B0] object:0];
  [v76 addObserver:v93 selector:sel__asyncUpdateTime name:*MEMORY[0x1E4F1C2E0] object:0];
  [v76 addObserver:v93 selector:sel__asyncUpdateLocale name:*MEMORY[0x1E4F1C370] object:0];
  id v77 = objc_alloc(MEMORY[0x1E4F7A020]);
  [(NTKAegirFaceView *)v93 bounds];
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  v86 = [(NTKAegirFaceView *)v93 device];
  uint64_t v87 = objc_msgSend(v77, "initWithFrame:forDeviceCornerRadius:", v86, v79, v81, v83, v85);
  cornerOverlayView = v93->_cornerOverlayView;
  v93->_cornerOverlayView = (UIView *)v87;

  [(NTKAegirFaceView *)v93 addSubview:v93->_cornerOverlayView];
  objc_destroyWeak(location);
}

- (void)_unloadSnapshotContentViews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v24 _unloadSnapshotContentViews];
  [(NUNIAstronomyVistaController *)self->_astronomyController stopClockUpdates];
  [(UIImageView *)self->_randomVistaSnapshot removeFromSuperview];
  randomVistaSnapshot = self->_randomVistaSnapshot;
  self->_randomVistaSnapshot = 0;

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F436B0] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  [(NTKDelayedBlock *)self->_wheelDelayedBlock cancel];
  wheelDelayedBlock = self->_wheelDelayedBlock;
  self->_wheelDelayedBlock = 0;

  [(NTKDelayedBlock *)self->_physicalButtonDelayedBlock cancel];
  physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
  self->_physicalButtonDelayedBlock = 0;

  uint64_t v7 = 0;
  *((unsigned char *)self + 1176) &= ~2u;
  scrubDateFormatter = self->_scrubDateFormatter;
  do
  {
    double v9 = scrubDateFormatter[v7];
    scrubDateFormatter[v7] = 0;

    ++v7;
  }
  while (v7 != 10);
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront removeFromSuperview];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack removeFromSuperview];
  double v10 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v10 removeFromSuperview];

  [(CLKUIColoringLabel *)self->_scrubLabel removeFromSuperview];
  [(CLKUIColoringLabel *)self->_phaseLabel removeFromSuperview];
  [(CLKUIColoringLabel *)self->_travelTimeLabel removeFromSuperview];
  [(NTKDigitalTimeLabel *)self->_cornerTimeLabel removeFromSuperview];
  [(UIView *)self->_cornerOverlayView removeFromSuperview];
  cornerOverlayView = self->_cornerOverlayView;
  self->_cornerOverlayView = 0;

  centerTimeLabelFront = self->_centerTimeLabelFront;
  self->_centerTimeLabelFront = 0;

  centerTimeLabelBack = self->_centerTimeLabelBack;
  self->_centerTimeLabelBack = 0;

  astronomyController = self->_astronomyController;
  self->_astronomyController = 0;

  scrubLabel = self->_scrubLabel;
  self->_scrubLabel = 0;

  phaseLabel = self->_phaseLabel;
  self->_phaseLabel = 0;

  travelTimeLabel = self->_travelTimeLabel;
  self->_travelTimeLabel = 0;

  cornerTimeLabel = self->_cornerTimeLabel;
  self->_cornerTimeLabel = 0;

  crownDate = self->_crownDate;
  self->_crownDate = 0;

  uint64_t v20 = 0;
  spheroidLabels = self->_spheroidLabels;
  do
  {
    v22 = spheroidLabels[v20];
    [(UIImageView *)v22 removeFromSuperview];
    v23 = spheroidLabels[v20];
    spheroidLabels[v20] = 0;

    ++v20;
  }
  while (v20 != 8);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7 = a3;
  id v6 = [(NUNIAstronomyVistaController *)self->_astronomyController overrideDate];

  if (v6 != v7)
  {
    [(NUNIAstronomyVistaController *)self->_astronomyController setOverrideDate:v7 animated:a4 > 0.0];
    [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setOverrideDate:v7 duration:0.0];
    [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setOverrideDate:v7 duration:0.0];
    [(NTKDigitalTimeLabel *)self->_cornerTimeLabel setOverrideDate:v7 duration:0.0];
  }
}

- (void)setTimeOffset:(double)a3
{
  -[NTKDigitalTimeLabel setTimeOffset:](self->_centerTimeLabelFront, "setTimeOffset:");
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setTimeOffset:a3];
  cornerTimeLabel = self->_cornerTimeLabel;

  [(NTKDigitalTimeLabel *)cornerTimeLabel setTimeOffset:a3];
}

- (void)_prepareForEditing
{
  v9.receiver = self;
  v9.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v9 _prepareForEditing];
  [(NTKAegirFaceView *)self _applyDataModeAnimated:0];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_complicationFactory prepareForEditingForFaceView:self];
  [(NUNIAstronomyVistaController *)self->_astronomyController prepareForTransitions];
  [(NUNIAstronomyVistaController *)self->_astronomyController setVistaTransitionStyle:1];
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v4 bounds];
  double v5 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
  randomVistaSnapshot = self->_randomVistaSnapshot;
  self->_randomVistaSnapshot = v5;

  id v7 = [(NTKAegirFaceView *)self _randomVistaImage];
  [(UIImageView *)self->_randomVistaSnapshot setImage:v7];
  [(UIImageView *)self->_randomVistaSnapshot setUserInteractionEnabled:0];
  [(UIImageView *)self->_randomVistaSnapshot setAlpha:0.0];
  double v8 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v8 addSubview:self->_randomVistaSnapshot];
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v4 _cleanupAfterEditing];
  [(NUNIAstronomyVistaController *)self->_astronomyController cleanUpAfterTransitions];
  [(NTKAegirFaceView *)self _applyVista:[(NUNIAstronomyVistaController *)self->_astronomyController vista]];
  [(NTKAegirFaceView *)self _applyDataModeAnimated:0];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_complicationFactory cleanupAfterEditingForFaceView:self];
  [(UIImageView *)self->_randomVistaSnapshot removeFromSuperview];
  randomVistaSnapshot = self->_randomVistaSnapshot;
  self->_randomVistaSnapshot = 0;
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  [(NUNIAstronomyVistaController *)self->_astronomyController cleanUpAfterTransitions];
  astronomyController = self->_astronomyController;

  [(NUNIAstronomyVistaController *)astronomyController prepareForTransitions];
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  CLKInterpolateBetweenFloatsClipped();
  double v7 = fmin(v6, self->_homeScreenAlphaOverride);
  double v8 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v8 setAlpha:v7];

  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setAlpha:v7];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setAlpha:v7];
  [(NTKAegirFaceView *)self _vistaOptionIsRandom];
  CLKInterpolateBetweenFloatsClipped();
  randomVistaSnapshot = self->_randomVistaSnapshot;

  -[UIImageView setAlpha:](randomVistaSnapshot, "setAlpha:");
}

- (void)_configureForEditMode:(int64_t)a3
{
  double v5 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F79F70];
  if (a3 != 1) {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  double v8 = 0.0;
  double v9 = 0.0;
  if (!self->_elementOrder)
  {
    BOOL v10 = a3 == 13 || a3 == 0;
    BOOL v11 = v10 || a3 == 19;
    double v9 = *MEMORY[0x1E4F79F78];
    if (v11) {
      double v9 = 1.0;
    }
  }
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setAlpha:fmin(v9, self->_homeScreenAlphaOverride)];
  centerTimeLabelBack = self->_centerTimeLabelBack;
  if (self->_elementOrder == 1)
  {
    if (a3 == 13 || a3 == 0 || a3 == 19) {
      double v8 = 1.0;
    }
    else {
      double v8 = *MEMORY[0x1E4F79F78];
    }
  }
  double v15 = fmin(v8, self->_homeScreenAlphaOverride);

  [(NTKDigitalTimeLabel *)centerTimeLabelBack setAlpha:v15];
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  switch(a6)
  {
    case 12:
      uint64_t v15 = [v12 vista];
      uint64_t v16 = [v13 vista];
      unint64_t v17 = [(NTKAegirFaceView *)self shuffledVistaForVista:v15 shuffle:0];
      unint64_t v18 = [(NTKAegirFaceView *)self shuffledVistaForVista:v16 shuffle:0];
      [(NUNIAstronomyVistaController *)self->_astronomyController applyTransitionFraction:v17 fromVista:v18 toVista:a3];
      [(NTKAegirFaceView *)self _applyFromVista:v17 toVista:v18 fraction:a3];
      if (v16 == 10 && v15 == 10)
      {
        [(NTKAegirFaceView *)self _applyOption:v12 forCustomEditMode:12 slot:0];
        randomVistaSnapshot = self->_randomVistaSnapshot;
        double v20 = 1.0;
      }
      else if (v16 == 10)
      {
        [(NTKAegirFaceView *)self _applyOption:v12 forCustomEditMode:12 slot:0];
        randomVistaSnapshot = self->_randomVistaSnapshot;
        double v20 = a3;
      }
      else if (v15 == 10)
      {
        [(NTKAegirFaceView *)self _applyOption:v13 forCustomEditMode:12 slot:0];
        double v20 = 1.0 - a3;
        randomVistaSnapshot = self->_randomVistaSnapshot;
      }
      else
      {
        randomVistaSnapshot = self->_randomVistaSnapshot;
        double v20 = 0.0;
      }
      [(UIImageView *)randomVistaSnapshot setAlpha:v20];
      break;
    case 13:
      uint64_t v23 = [v12 typeface];
      uint64_t v24 = [v13 typeface];
      if (v23 != v24)
      {
        if (a3 >= 0.5)
        {
          uint64_t v30 = v24;
          CLKMapFractionIntoRange();
          double v28 = v31;
          uint64_t v23 = v30;
        }
        else
        {
          CLKMapFractionIntoRange();
          double v28 = v27;
        }
        CLKMapFractionIntoRange();
        memset(&v40, 0, sizeof(v40));
        CGAffineTransformMakeScale(&v40, v32, v32);
        [(NTKAegirFaceView *)self _setTypeface:v23];
        goto LABEL_24;
      }
      [(NTKAegirFaceView *)self _setTypeface:v23];
      break;
    case 15:
      unint64_t v21 = -[NTKAegirFaceView shuffledStyleForStyle:shuffle:](self, "shuffledStyleForStyle:shuffle:", [v12 style], 0);
      unint64_t v22 = -[NTKAegirFaceView shuffledStyleForStyle:shuffle:](self, "shuffledStyleForStyle:shuffle:", [v13 style], 0);
      [(NUNIAstronomyVistaController *)self->_astronomyController applyTransitionFraction:v21 fromStyle:v22 toStyle:a3];
      if (((v21 & 0xFFFFFFFFFFFFFFFELL) == 2) != ((v22 & 0xFFFFFFFFFFFFFFFELL) == 2)) {
        -[NTKAegirFaceView _applyFromElementOrder:toElementOrder:fraction:](self, "_applyFromElementOrder:toElementOrder:fraction:", a3);
      }
      else {
        -[NTKAegirFaceView _setElementOrder:](self, "_setElementOrder:");
      }
      break;
    case 19:
      uint64_t v25 = [v12 numeralOption];
      uint64_t v26 = [v13 numeralOption];
      if (v25 == v26)
      {
        [(NTKAegirFaceView *)self _setNumerals:v25];
      }
      else
      {
        if (a3 >= 0.5)
        {
          uint64_t v33 = v26;
          CLKMapFractionIntoRange();
          double v28 = v34;
          uint64_t v25 = v33;
        }
        else
        {
          CLKMapFractionIntoRange();
          double v28 = v29;
        }
        CLKMapFractionIntoRange();
        memset(&v40, 0, sizeof(v40));
        CGAffineTransformMakeScale(&v40, v35, v35);
        [(NTKAegirFaceView *)self _setNumerals:v25];
LABEL_24:
        double v36 = fmin(v28, self->_homeScreenAlphaOverride);
        if (self->_elementOrder) {
          uint64_t v37 = 880;
        }
        else {
          uint64_t v37 = 872;
        }
        [*(id *)((char *)&self->super.super.super.super.isa + v37) setAlpha:v36];
        v38 = *(Class *)((char *)&self->super.super.super.super.isa + v37);
        CGAffineTransform v39 = v40;
        [v38 setTransform:&v39];
      }
      break;
    default:
      break;
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 12:
      uint64_t v9 = [v14 vista];
      unint64_t v10 = [(NTKAegirFaceView *)self shuffledVistaForVista:v9 shuffle:0];
      if ([(NUNIAstronomyVistaController *)self->_astronomyController vista] != v10)
      {
        if ([(NTKAegirFaceView *)self editing]) {
          [(NUNIAstronomyVistaController *)self->_astronomyController setVista:v10];
        }
        else {
          [(NTKAegirFaceView *)self _applyVista:v10];
        }
      }
      double v13 = 0.0;
      if (v9 == 10) {
        double v13 = 1.0;
      }
      [(UIImageView *)self->_randomVistaSnapshot setAlpha:v13];
      break;
    case 13:
      -[NTKAegirFaceView _setTypeface:](self, "_setTypeface:", [v14 typeface]);
      break;
    case 15:
      uint64_t v11 = [v14 style];
      unint64_t v12 = [(NTKAegirFaceView *)self shuffledStyleForStyle:v11 shuffle:0];
      [(NUNIAstronomyVistaController *)self->_astronomyController applyStyle:v12];
      if (v11 != 7) {
        [(NTKAegirFaceView *)self shuffleRandomStyle];
      }
      [(NTKAegirFaceView *)self _setElementOrder:(v12 & 0xFFFFFFFFFFFFFFFELL) == 2];
      break;
    case 19:
      -[NTKAegirFaceView _setNumerals:](self, "_setNumerals:", [v14 numeralOption]);
      break;
    default:
      break;
  }
}

- (unint64_t)shuffledVistaForVista:(unint64_t)currentShuffledVista shuffle:(BOOL)a4
{
  switch(currentShuffledVista)
  {
    case 1uLL:
    case 2uLL:
    case 8uLL:
    case 9uLL:
      return currentShuffledVista;
    case 3uLL:
      currentShuffledVista = 4;
      break;
    case 4uLL:
      currentShuffledVista = 5;
      break;
    case 5uLL:
      currentShuffledVista = 6;
      break;
    case 6uLL:
      currentShuffledVista = 7;
      break;
    case 7uLL:
      currentShuffledVista = 3;
      break;
    case 0xAuLL:
      if (a4) {
        [(NTKAegirFaceView *)self shuffleRandomVista];
      }
      currentShuffledVista = self->_currentShuffledVista;
      break;
    default:
      currentShuffledVista = 0;
      break;
  }
  return currentShuffledVista;
}

- (unint64_t)shuffledStyleForStyle:(unint64_t)a3 shuffle:(BOOL)a4
{
  if (a3 - 1 > 6) {
    return sub_1DAFD2964((uint64_t)self, (uint64_t)a2, 0);
  }
  else {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&loc_1DAFD2958 + (int)funcs_1DAFD2960[a3 - 1]))((uint64_t)self, (uint64_t)a2, a3);
  }
}

- (void)shuffleRandomVista
{
  self->_currentShuffledVista = (self->_currentShuffledVista + 1) % 3;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NTKAegirFaceView;
  id v6 = a4;
  [(NTKAegirFaceView *)&v10 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  double v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NTKAegirFaceView *)self dataMode];
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1DAFCE000, v7, OS_LOG_TYPE_DEFAULT, "_renderSynchronouslyWithImageQueueDiscard: dataMode=%ld", buf, 0xCu);
  }

  uint64_t v9 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v9 renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
}

- (void)_applyShowContentForUnadornedSnapshot
{
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setHidden:[(NTKAegirFaceView *)self showContentForUnadornedSnapshot]];
  centerTimeLabelBack = self->_centerTimeLabelBack;
  uint64_t v4 = [(NTKAegirFaceView *)self showContentForUnadornedSnapshot];

  [(NTKDigitalTimeLabel *)centerTimeLabelBack setHidden:v4];
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v34 layoutSubviews];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setFrameUsingCurrentStyle];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setFrameUsingCurrentStyle];
  [(NTKDigitalTimeLabel *)self->_cornerTimeLabel setFrameUsingCurrentStyle];
  [(NTKAegirFaceView *)self _topComplicationFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NTKAegirFaceViewComplicationFactory *)self->_complicationFactory topComplicationFrame];
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  if (!CGRectEqualToRect(v35, v36))
  {
    -[NTKAegirFaceViewComplicationFactory setTopComplicationFrame:](self->_complicationFactory, "setTopComplicationFrame:", v4, v6, v8, v10);
    [(NTKAegirFaceView *)self invalidateComplicationLayout];
  }
  uint64_t v11 = [(NTKAegirFaceView *)self device];
  [(NTKAegirFaceView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  unint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v11, v13, v15, v17, v19, *MEMORY[0x1E4F43930]), "layoutRule");
  [v21 referenceFrame];
  double v23 = v22;

  uint64_t v24 = [(CLKUIColoringLabel *)self->_travelTimeLabel text];
  travelTimeLabel = self->_travelTimeLabel;
  uint64_t v26 = sub_1DAFD2E34();
  [(CLKUIColoringLabel *)travelTimeLabel setText:v26];

  [(CLKUIColoringLabel *)self->_travelTimeLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_travelTimeLabel frame];
  double v28 = v27;
  [(CLKUIColoringLabel *)self->_travelTimeLabel setText:v24];
  double v29 = [(NTKAegirFaceView *)self device];
  _NTKAegirLayoutForDevice(v29);
  double v30 = *(double *)&qword_1EA8FC830;

  -[CLKUIColoringLabel setFrame:](self->_travelTimeLabel, "setFrame:", v30, v23, v30 * -2.0 + v17 * 0.75, v28);
  CGFloat v31 = v17 + v30 * -2.0;
  -[CLKUIColoringLabel setFrame:](self->_scrubLabel, "setFrame:", v30, v19 - v28 - v23, v31, v28);
  [(CLKUIColoringLabel *)self->_scrubLabel frame];
  self->_phaseLabelDefaultFrame.origin.x = v30;
  self->_phaseLabelDefaultFrame.origin.y = v32 - v28;
  self->_phaseLabelDefaultFrame.size.width = v31;
  self->_phaseLabelDefaultFrame.size.height = v28;
  [(NTKAegirFaceView *)self _layoutPhaseLabel];
  uint64_t v33 = 0;
  do
  {
    [(NTKAegirFaceView *)self _layoutSpheroidLabel:v33];
    uint64_t v33 = (v33 + 1);
  }
  while (v33 != 8);
}

- (void)_becameActiveFace
{
  double v3 = [MEMORY[0x1E4F7A008] sharedLocationManager];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DAFD2F88;
  v6[3] = &unk_1E6BE3AE0;
  objc_copyWeak(&v7, &location);
  double v4 = [v3 startLocationUpdatesWithIdentifier:@"ntk.aegir.face" handler:v6];
  locationManagerToken = self->_locationManagerToken;
  self->_locationManagerToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_becameInactiveFace
{
  if (self->_locationManagerToken)
  {
    double v3 = [MEMORY[0x1E4F7A008] sharedLocationManager];
    [v3 stopLocationUpdatesForToken:self->_locationManagerToken];

    locationManagerToken = self->_locationManagerToken;
    self->_locationManagerToken = 0;
  }
}

- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 2;
}

- (double)_verticalPaddingForStatusBar
{
  return 1.0;
}

- (void)_asyncUpdateLocale
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1DAFD313C;
  v2[3] = &unk_1E6BE3B08;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_asyncUpdateTime
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1DAFD3224;
  v2[3] = &unk_1E6BE3B08;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateLocaleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (CLKLocaleIs24HourMode()) {
    double v5 = @"H:mm";
  }
  else {
    double v5 = @"h:mm a";
  }
  [(NSDateFormatter *)self->_scrubDateFormatter[0] setLocalizedDateFormatFromTemplate:v5];
  [(NSDateFormatter *)self->_scrubDateFormatter[1] setLocalizedDateFormatFromTemplate:@"MMM d"];
  [(NSDateFormatter *)self->_scrubDateFormatter[2] setLocalizedDateFormatFromTemplate:@"MM/dd/y"];
  [(NUNIAstronomyVistaController *)self->_astronomyController updateTimeAnimated:v3];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return (id)MEMORY[0x1F4181798](self->_complicationFactory, sel_newLegacyViewForComplication_family_slot_faceView_);
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return MEMORY[0x1F4181798](self->_complicationFactory, sel_legacyLayoutOverrideforComplicationType_slot_faceView_);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return (id)MEMORY[0x1F4181798](self->_complicationFactory, sel_detachedComplicationDisplaysForFaceView_);
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  MEMORY[0x1F4181798](self->_complicationFactory, sel_keylineCornerRadiusForComplicationSlot_faceView_);
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)[(NTKFaceViewComplicationFactory *)self->_complicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return MEMORY[0x1F4181798](self->_complicationFactory, sel_fadesComplicationSlot_inEditMode_faceView_);
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  MEMORY[0x1F4181798](self->_complicationFactory, sel_minimumBreathingScaleForComplicationSlot_faceView_);
  return result;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)topComplicationFont
{
  [(NTKAegirFaceView *)self topComplicationFontSize];
  double v4 = v3;
  double v5 = (void *)MEMORY[0x1E4F19A50];
  [(NTKAegirFaceView *)self topComplicationFontWeight];

  return (id)[v5 systemFontOfSize:v4 weight:v6];
}

- (double)topComplicationFontSize
{
  v2 = [(NTKAegirFaceView *)self device];
  _NTKAegirLayoutForDevice(v2);

  return *(double *)&qword_1EA8FC840;
}

- (double)topComplicationFontWeight
{
  return *MEMORY[0x1E4F43920];
}

- (CGRect)_topComplicationFrame
{
  [(NTKAegirFaceView *)self bounds];
  double v3 = [(NTKAegirFaceView *)self device];
  _NTKAegirLayoutForDevice(v3);
  double v4 = [(NTKAegirFaceView *)self topComplicationFont];
  [v4 ascender];
  [v4 descender];
  CLKRoundForDevice();
  double v6 = v5;
  CLKRoundForDevice();
  double v8 = v7;
  CLKRoundForDevice();
  double v10 = v9;
  CLKRoundForDevice();
  double v12 = v11;

  double v13 = v12;
  double v14 = v10;
  double v15 = v8;
  double v16 = v6;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setTypeface:(unint64_t)a3
{
  if (self->_typeface != a3)
  {
    self->_typeface = a3;
    [(NTKAegirFaceView *)self _invalidateTimeLabelStyles];
  }
}

- (void)_setNumerals:(unint64_t)a3
{
  if (self->_numeralOption != a3)
  {
    self->_numeralOption = a3;
    double v4 = [(NTKAegirFaceView *)self device];
    int v5 = NTKShowIndicScriptNumerals();

    if (v5)
    {
      [(NTKAegirFaceView *)self _invalidateTimeLabelStyles];
    }
  }
}

- (void)_setElementOrder:(unint64_t)a3
{
  if (self->_elementOrder != a3)
  {
    self->_elementOrder = a3;
    uint64_t v5 = [(NTKAegirFaceView *)self fromEditMode];
    double v6 = 0.0;
    double v7 = 0.0;
    if (!a3)
    {
      BOOL v8 = v5 == 13 || v5 == 0;
      BOOL v9 = v8 || v5 == 19;
      double v7 = *MEMORY[0x1E4F79F78];
      if (v9) {
        double v7 = 1.0;
      }
    }
    [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setAlpha:fmin(v7, self->_homeScreenAlphaOverride)];
    centerTimeLabelBack = self->_centerTimeLabelBack;
    if (a3 == 1)
    {
      if (v5 == 13 || v5 == 0 || v5 == 19) {
        double v6 = 1.0;
      }
      else {
        double v6 = *MEMORY[0x1E4F79F78];
      }
    }
    double v13 = fmin(v6, self->_homeScreenAlphaOverride);
    [(NTKDigitalTimeLabel *)centerTimeLabelBack setAlpha:v13];
  }
}

- (void)_applyFromElementOrder:(unint64_t)a3 toElementOrder:(unint64_t)a4 fraction:(double)a5
{
  [(NTKAegirFaceView *)self fromEditMode];
  CLKInterpolateBetweenFloatsClipped();
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setAlpha:fmin(v6, self->_homeScreenAlphaOverride)];
  CLKInterpolateBetweenFloatsClipped();
  double v8 = fmin(v7, self->_homeScreenAlphaOverride);
  centerTimeLabelBack = self->_centerTimeLabelBack;

  [(NTKDigitalTimeLabel *)centerTimeLabelBack setAlpha:v8];
}

- (void)_invalidateTimeLabelStyles
{
  id v8 = [(NTKAegirFaceView *)self _centerTimeLabelStyleForViewMode:self->_viewMode];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setStyle:v8];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setStyle:v8];
  cornerTimeLabel = self->_cornerTimeLabel;
  double v4 = [(NTKAegirFaceView *)self _cornerTimeLabelStyleForViewMode:self->_viewMode];
  [(NTKDigitalTimeLabel *)cornerTimeLabel setStyle:v4];

  uint64_t v5 = CLKLocaleNumberSystemFromNumeralOption();
  double v6 = [(NTKAegirFaceView *)self device];
  int v7 = NTKShowIndicScriptNumerals();

  if (!v7) {
    uint64_t v5 = -1;
  }
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setForcedNumberSystem:v5];
  [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setForcedNumberSystem:v5];
  [(NTKDigitalTimeLabel *)self->_cornerTimeLabel setForcedNumberSystem:v5];
  [(NTKAegirFaceView *)self setNeedsLayout];
}

- (id)_centerTimeLabelStyleForViewMode:(int64_t)a3
{
  [(NTKAegirFaceView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(NTKAegirFaceView *)self device];
  double v14 = v13;
  if (a3 == 2)
  {
    double v15 = sub_1DAFD3D74(v13, v6, v8, v10, v12);
    [v15 pointSize];
    double v17 = sub_1DAFD3B48(v16, (uint64_t)v14, self->_typeface, self->_numeralOption);
    double v18 = objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:withFont:forDevice:", v17, v14, v6, v8, v10, v12);
  }
  else
  {
    double v15 = sub_1DAFD3B48(round(v12 * 0.198660714), (uint64_t)v13, self->_typeface, self->_numeralOption);
    double v18 = sub_1DAFD3C9C((uint64_t)v14, (uint64_t)v15, v6, v8, v10, v12);
  }

  return v18;
}

- (id)_cornerTimeLabelStyleForViewMode:(int64_t)a3
{
  [(NTKAegirFaceView *)self bounds];
  double x = v5;
  double y = v7;
  double width = v9;
  double height = v11;
  double v13 = [(NTKAegirFaceView *)self device];
  double v14 = v13;
  if (a3 == 2)
  {
    double v15 = sub_1DAFD3D74(v13, x, y, width, height);
    double v16 = [(NTKAegirFaceView *)self device];
    _NTKAegirLayoutForDevice(v16);

    if (*(double *)&qword_1EA8FC830 > 0.0)
    {
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      CGRect v23 = CGRectInset(v22, *(double *)&qword_1EA8FC830 * 0.5 - *(double *)&qword_1EA8FC838, 0.0);
      double x = v23.origin.x;
      double y = v23.origin.y;
      double width = v23.size.width;
      double height = v23.size.height;
    }
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:withFont:forDevice:", v15, v14, x, y, width, height);
  }
  else
  {
    double v18 = [(NTKAegirFaceView *)self device];
    double v15 = sub_1DAFD3FCC(round(height * 0.198660714));

    uint64_t v17 = sub_1DAFD3C9C((uint64_t)v14, (uint64_t)v15, x, y, width, height);
  }
  double v19 = (void *)v17;

  return v19;
}

- (void)_prepareToZoom
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v5 _prepareToZoom];
  double v3 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  double v4 = [v3 scene];

  [v4 setUpdatable:0];
}

- (void)_cleanupAfterZoom
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v5 _cleanupAfterZoom];
  double v3 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  double v4 = [v3 scene];

  [v4 setUpdatable:1];
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([(NTKAegirFaceView *)self _shouldHandleHardwareEvents]
    && !self->_physicalButtonDelayedBlock)
  {
    if (![(NTKAegirFaceView *)self _canEnterInteractiveMode])
    {
      BOOL v5 = 1;
      goto LABEL_4;
    }
    if (!self->_wheelDelayedBlock)
    {
      objc_initWeak(&location, self);
      id v7 = objc_alloc(MEMORY[0x1E4F79FD0]);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1DAFD42F8;
      v10[3] = &unk_1E6BE3B30;
      objc_copyWeak(&v11, &location);
      double v8 = (NTKDelayedBlock *)[v7 initWithDelay:v10 action:0.2];
      wheelDelayedBlock = self->_wheelDelayedBlock;
      self->_wheelDelayedBlock = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  BOOL v5 = 0;
LABEL_4:

  return v5;
}

- (void)exitInteractiveMode
{
}

- (void)exitInteractiveModeAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(NTKAegirFaceView *)self _styleOptionIsRandom]) {
    [(NUNIAstronomyVistaController *)self->_astronomyController setStyle:self->_currentShuffledStyle];
  }
  if (v4)
  {
    [(NTKAegirFaceView *)self _animateTransitionToViewMode:0 completion:v7];
LABEL_9:
    double v6 = v7;
    goto LABEL_10;
  }
  [(NTKAegirFaceView *)self _setViewMode:0];
  if ([(NTKAegirFaceView *)self _styleOptionIsRandom]) {
    [(NUNIAstronomyVistaController *)self->_astronomyController applyStyle:self->_currentShuffledStyle];
  }
  double v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_wheelDelayedBlockFired
{
  wheelDelayedBlock = self->_wheelDelayedBlock;
  self->_wheelDelayedBlock = 0;

  if (!self->_physicalButtonDelayedBlock
    && [(NTKAegirFaceView *)self _canEnterInteractiveMode])
  {
    MEMORY[0x1F4181798](self, sel__animateTransitionToViewMode_);
  }
}

- (void)_physicalButtonDelayedBlockFired
{
  self->_physicalButtonDelayedBlock = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_enableCrownForAegirVista:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v5 _enableCrown];
  if ([(NTKAegirFaceView *)self editing]) {
    char v4 = 0;
  }
  else {
    char v4 = 2;
  }
  *((unsigned char *)self + 1176) = *((unsigned char *)self + 1176) & 0xFD | v4;
}

- (void)_disableCrown
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAegirFaceView;
  [(NTKAegirFaceView *)&v4 _disableCrown];
  crownDate = self->_crownDate;
  self->_crownDate = 0;

  *((unsigned char *)self + 1176) &= ~2u;
  [(NUNIAstronomyVistaController *)self->_astronomyController updateTimeAnimated:1];
}

- (BOOL)_canEnterInteractiveMode
{
  return (*((unsigned char *)self + 1176) & 1) == 0 && self->_viewMode != 2;
}

- (BOOL)_shouldHandleHardwareEvents
{
  return (*((unsigned __int8 *)self + 1176) >> 1) & 1;
}

- (void)astronomyVistaControllerWillEnterInteractiveMode:(id)a3
{
  if ([(NTKAegirFaceView *)self _canEnterInteractiveMode])
  {
    MEMORY[0x1F4181798](self, sel__animateTransitionToViewMode_);
  }
}

- (void)astronomyVistaControllerWillLeaveInteractiveMode:(id)a3
{
}

- (void)astronomyVistaControllerWillEnterSupplementalMode:(id)a3
{
}

- (void)astronomyVistaControllerWillLeaveSupplementalMode:(id)a3
{
}

- (void)_applyVista:(unint64_t)a3
{
  [(NUNIAstronomyVistaController *)self->_astronomyController setVista:a3];
  astronomyController = self->_astronomyController;

  [(NUNIAstronomyVistaController *)astronomyController updateTimeAnimated:0];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  int64_t v7 = a3 - 12;
  if (unint64_t)(a3 - 12) < 8 && ((0x8Bu >> v7))
  {
    double v8 = (void *)qword_1E6BE3BE8[v7];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___NTKAegirFaceView;
    double v8 = objc_msgSendSuper2(&v10, sel__swatchForEditModeDependsOnOptions_forDevice_, a3, v6);
  }

  return v8;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = v9;
  switch(a4)
  {
    case 12:
      id v11 = [v9 objectForKeyedSubscript:&unk_1F35276C0];
      if ([v8 vista] == 10)
      {
        uint64_t v12 = [(NTKAegirFaceView *)self _randomVistaImage];
        goto LABEL_10;
      }
      double v13 = self;
      id v14 = v8;
      id v15 = v11;
      goto LABEL_9;
    case 13:
      id v11 = [v9 objectForKeyedSubscript:&unk_1F35276A8];
      double v16 = [v10 objectForKeyedSubscript:&unk_1F35276C0];
      uint64_t v17 = [(NTKAegirFaceView *)self _typefaceSwatchForTypefaceOption:v8 vistaOption:v11 styleOption:v16];

      goto LABEL_11;
    case 15:
      id v11 = [v9 objectForKeyedSubscript:&unk_1F35276A8];
      double v13 = self;
      id v14 = v11;
      id v15 = v8;
LABEL_9:
      uint64_t v12 = [(NTKAegirFaceView *)v13 _vistaSwatchForVistaOption:v14 styleOption:v15];
LABEL_10:
      uint64_t v17 = (void *)v12;
LABEL_11:

      break;
    case 19:
      objc_msgSend(MEMORY[0x1E4F79FE8], "sizeForSwatchStyle:", objc_msgSend(v8, "swatchStyle"));
      double v19 = v18;
      double v21 = v20;
      CGRect v22 = [(NTKAegirFaceView *)self device];
      CGRect v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v22, 0.0, 0.0, v19, v21, *MEMORY[0x1E4F43930]), "designatorFont");
      [v23 pointSize];
      double v25 = v24;

      uint64_t v26 = [(NTKAegirFaceView *)self device];
      double v27 = sub_1DAFD3B48(v25, (uint64_t)v26, self->_typeface, [v8 numeralOption]);

      double v28 = [(NTKAegirFaceView *)self device];
      uint64_t v17 = [v8 swatchImageWithFont:v27 device:v28 baseline:0.3125];

      break;
    default:
      v30.receiver = self;
      v30.super_class = (Class)NTKAegirFaceView;
      uint64_t v17 = [(NTKAegirFaceView *)&v30 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      break;
  }

  return v17;
}

- (id)_numeralSwatchForNumeralOption:(id)a3 typefaceOption:(id)a4 vistaOption:(id)a5 styleOption:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_1EA8FC870 != -1) {
    dispatch_once(&qword_1EA8FC870, &unk_1F3524E58);
  }
  id v14 = NSString;
  id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "numeralOption"));
  double v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "vista"));
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "style"));
  double v18 = [v14 stringWithFormat:@"%@-%@-%@", v15, v16, v17];

  double v19 = [(id)qword_1EA8FC868 objectForKey:v18];
  if (!v19)
  {
    double v19 = [(NTKAegirFaceView *)self _renderNumeralSwatchForNumeralOption:v10 typefaceOption:v11 vistaOption:v12 styleOption:v13];
    [(id)qword_1EA8FC868 setObject:v19 forKey:v18];
  }

  return v19;
}

- (id)_renderNumeralSwatchForNumeralOption:(id)a3 typefaceOption:(id)a4 vistaOption:(id)a5 styleOption:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(NTKAegirFaceView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGRect v22 = [NTKAegirFaceView alloc];
  CGRect v23 = [(NTKAegirFaceView *)self device];
  double v24 = [(NTKAegirFaceView *)v22 initWithFaceStyle:44 forDevice:v23 clientIdentifier:0];

  objc_msgSend(v24, "setFrame:", v15, v17, v19, v21);
  [v24 _loadSnapshotContentViews];
  uint64_t v25 = [v13 numeralOption];

  [v24 _setNumerals:v25];
  [v24 setOption:v12 forCustomEditMode:13 slot:0];

  [v24 setOption:v11 forCustomEditMode:12 slot:0];
  [v24 setOption:v10 forCustomEditMode:15 slot:0];
  uint64_t v26 = NTKIdealizedDate();
  [v24 setOverrideDate:v26 duration:0.0];

  double v27 = [(NTKAegirFaceView *)self _vistaSwatchForVistaOption:v11 styleOption:v10];

  double v28 = [v24[112] vistaView];
  double v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithBounds:", v15, v17, v19, v21);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1DAFD4E34;
  v34[3] = &unk_1E6BE3B78;
  double v37 = v15;
  double v38 = v17;
  double v39 = v19;
  double v40 = v21;
  id v35 = v27;
  id v36 = v28;
  id v30 = v28;
  id v31 = v27;
  double v32 = [v29 imageWithActions:v34];

  return v32;
}

- (id)_typefaceSwatchForTypefaceOption:(id)a3 vistaOption:(id)a4 styleOption:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA8FC880 != -1) {
    dispatch_once(&qword_1EA8FC880, &unk_1F3524E78);
  }
  id v11 = NSString;
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "typeface"));
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "vista"));
  double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "style"));
  double v15 = [v11 stringWithFormat:@"%@-%@-%@", v12, v13, v14];

  double v16 = [(id)qword_1EA8FC878 objectForKey:v15];
  if (!v16)
  {
    double v16 = [(NTKAegirFaceView *)self _renderTypefaceSwatchForTypefaceOption:v8 vistaOption:v9 styleOption:v10];
    [(id)qword_1EA8FC878 setObject:v16 forKey:v15];
  }

  return v16;
}

- (id)_renderTypefaceSwatchForTypefaceOption:(id)a3 vistaOption:(id)a4 styleOption:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F79FE8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend(v8, "sizeForSwatchStyle:", objc_msgSend(v11, "swatchStyle"));
  double v13 = v12;
  double v15 = v14;
  double v16 = [NTKAegirFaceView alloc];
  double v17 = [(NTKAegirFaceView *)self device];
  double v18 = [(NTKAegirFaceView *)v16 initWithFaceStyle:44 forDevice:v17 clientIdentifier:0];

  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v13, v15);
  [v18 _loadSnapshotContentViews];
  [v18 setOption:v11 forCustomEditMode:13 slot:0];

  double v19 = NTKIdealizedDate();
  [v18 setOverrideDate:v19 duration:0.0];

  double v20 = [(NTKAegirFaceView *)self _vistaSwatchForVistaOption:v10 styleOption:v9];

  double v21 = [v18[112] vistaView];
  CGRect v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithBounds:", 0.0, 0.0, v13, v15);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1DAFD52C0;
  v27[3] = &unk_1E6BE3B78;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  double v32 = v13;
  double v33 = v15;
  id v28 = v20;
  id v29 = v21;
  id v23 = v21;
  id v24 = v20;
  uint64_t v25 = [v22 imageWithActions:v27];

  return v25;
}

- (id)_vistaSwatchForVistaOption:(id)a3 styleOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EA8FC890 != -1) {
    dispatch_once(&qword_1EA8FC890, &unk_1F3524E98);
  }
  id v8 = NSString;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "vista"));
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "style"));
  id v11 = [v8 stringWithFormat:@"%@-%@", v9, v10];

  double v12 = [(id)qword_1EA8FC888 objectForKey:v11];
  if (!v12)
  {
    double v12 = [(NTKAegirFaceView *)self _renderVistaSwatchForVistaOption:v6 styleOption:v7];
    [(id)qword_1EA8FC888 setObject:v12 forKey:v11];
  }

  return v12;
}

- (id)_renderVistaSwatchForVistaOption:(id)a3 styleOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKAegirFaceView *)self device];
  id v9 = [[NTKAegirFaceView alloc] initWithFaceStyle:44 forDevice:v8 clientIdentifier:0];
  [(NTKAegirFaceView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  -[NTKAegirFaceView setFrame:](v9, "setFrame:");
  [(NTKAegirFaceView *)v9 _loadSnapshotContentViews];
  [(NTKAegirFaceView *)v9 setOption:v6 forCustomEditMode:12 slot:0];
  [(NTKAegirFaceView *)v9 setOption:v7 forCustomEditMode:15 slot:0];

  double v18 = NTKIdealizedDate();
  [(NTKAegirFaceView *)v9 setOverrideDate:v18 duration:0.0];

  double v19 = [(NUNIAstronomyVistaController *)v9->_astronomyController vistaView];
  double v20 = [v19 quadViews];
  double v21 = [v20 lastObject];

  objc_opt_class();
  CGRect v22 = 0;
  if (objc_opt_isKindOfClass())
  {
    [v8 screenScale];
    id v24 = objc_msgSend(v21, "snapshotInRect:scale:time:", v11, v13, v15, v17, v23, 0.0);
    objc_msgSend(MEMORY[0x1E4F79FE8], "sizeForSwatchStyle:", objc_msgSend(v6, "swatchStyle"));
    double v26 = v25;
    double v28 = v27;
    id v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithBounds:", 0.0, 0.0, v25, v27);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1DAFD5768;
    v32[3] = &unk_1E6BE3BA0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    id v33 = v24;
    double v36 = v26;
    double v37 = v28;
    id v30 = v24;
    CGRect v22 = [v29 imageWithActions:v32];
  }

  return v22;
}

- (id)_createDigitalTimeLabel
{
  double v3 = (void *)MEMORY[0x1E4F79FD8];
  objc_super v4 = [(NTKAegirFaceView *)self device];
  objc_super v5 = [v3 labelWithOptions:1 forDevice:v4];

  [v5 setUsesLegibility:1];
  id v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [v5 setTextColor:v6];

  id v7 = [MEMORY[0x1E4F7A030] sharedManager];
  [v7 timeOffset];
  objc_msgSend(v5, "setTimeOffset:");

  id v8 = [(NUNIAstronomyVistaController *)self->_astronomyController overrideDate];
  [v5 setOverrideDate:v8 duration:0.0];

  return v5;
}

- (id)_createVistaView
{
  double v3 = [(NTKAegirFaceView *)self device];
  _NTKAegirLayoutForDevice(v3);
  int v4 = dword_1EA8FC81C;
  int v6 = dword_1EA8FC824;
  int v5 = dword_1EA8FC828;
  int v7 = dword_1EA8FC82C;
  [(NTKAegirFaceView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [MEMORY[0x1E4F7A048] defaultConfigurationWithDevice:v3];
  [v16 setRendererStyle:3];
  [v16 setTextureSuffix:@"calliope"];
  [v16 setColorSpace:2];
  objc_msgSend(v16, "setQuadViewOptions:", objc_msgSend(v16, "quadViewOptions") | 0x140);
  double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A058]), "initWithFrame:configuration:", v16, v9, v11, v13, v15);
  double v18 = (NUNIAstronomyVistaController *)[objc_alloc(MEMORY[0x1E4F7A050]) initWithVistaView:v17];
  astronomyController = self->_astronomyController;
  self->_astronomyController = v18;

  [(NUNIAstronomyVistaController *)self->_astronomyController setDelegate:self];
  [(NUNIAstronomyVistaController *)self->_astronomyController setIsBacklightTransitionEnabled:0];
  LODWORD(v20) = v6;
  [v17 setSupplementalTopInset:v20];
  LODWORD(v21) = v5;
  [v17 setSupplementalBottomInset:v21];
  LODWORD(v22) = v4;
  [v17 setSupplementalHorizontalInset:v22];
  LODWORD(v23) = v7;
  [v17 setSupplementalSpheroidSize:v23];
  objc_initWeak(&location, self);
  id v24 = objc_alloc(MEMORY[0x1E4F7A068]);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = sub_1DAFD5AE4;
  id v30 = &unk_1E6BE3BC8;
  objc_copyWeak(&v31, &location);
  double v25 = (void *)[v24 initWithSphereoids:16515070 currentDateBlock:&v27];
  objc_msgSend(v25, "setSnap:", 3, v27, v28, v29, v30);
  [v17 setScene:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_interpolateFromPose:(const NTKAegirFaceViewAnimationPose *)a3 toPose:(const NTKAegirFaceViewAnimationPose *)a4 progress:(float)a5
{
  int v6 = [(NTKAegirFaceView *)self device];
  _NTKAegirLayoutForDevice(v6);

  int IsRTL = CLKLayoutIsRTL();
  if (IsRTL)
  {
    double v8 = [(NTKAegirFaceView *)self device];
    [v8 screenBounds];
    float v10 = v9 - *(float *)&dword_1EA8FC820;
  }
  else
  {
    float v10 = *(float *)&dword_1EA8FC820;
  }
  double v11 = v10;
  uint64_t v12 = 928;
  uint64_t v13 = 8;
  do
  {
    double v14 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
    if (v14)
    {
      id v15 = v14;
      CLKInterpolateBetweenFloatsClipped();
      objc_msgSend(v15, "setAlpha:");
      [v15 frame];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      CLKInterpolateBetweenFloatsClipped();
      if (IsRTL) {
        double v22 = -v22 - v19;
      }
      objc_msgSend(v15, "setFrame:", v22 + v11, v17, v19, v21);
    }
    v12 += 8;
    --v13;
  }
  while (v13);
  if (([(NTKAegirFaceView *)self editing] & 1) == 0)
  {
    CLKInterpolateBetweenFloatsClipped();
    double v24 = v23;
    -[CLKUIColoringLabel setAlpha:](self->_travelTimeLabel, "setAlpha:");
    [(CLKUIColoringLabel *)self->_scrubLabel setAlpha:v24];
    CLKInterpolateBetweenFloatsClipped();
    BOOL v26 = v24 > 0.0;
    if (v25 > 0.0) {
      BOOL v26 = 1;
    }
    if (v24 <= v25) {
      double v27 = v25;
    }
    else {
      double v27 = 0.0;
    }
    if (v26 && v24 > v25) {
      double v28 = v24;
    }
    else {
      double v28 = 0.0;
    }
    if (v26) {
      double v29 = v27;
    }
    else {
      double v29 = 0.0;
    }
    [(NTKDigitalTimeLabel *)self->_cornerTimeLabel setAlpha:v28];
    double v30 = fmin(v29, self->_homeScreenAlphaOverride);
    if (self->_elementOrder) {
      double v31 = 0.0;
    }
    else {
      double v31 = 1.0;
    }
    [(NTKDigitalTimeLabel *)self->_centerTimeLabelFront setAlpha:v30 * v31];
    if (self->_elementOrder == 1) {
      double v32 = 1.0;
    }
    else {
      double v32 = 0.0;
    }
    [(NTKDigitalTimeLabel *)self->_centerTimeLabelBack setAlpha:v30 * v32];
    phaseLabel = self->_phaseLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](phaseLabel, "setAlpha:");
    complicationFactordouble y = self->_complicationFactory;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setAlpha:faceView:](complicationFactory, "setAlpha:faceView:", self);
  }
}

- (id)_date
{
  double v3 = [(NUNIAstronomyVistaController *)self->_astronomyController overrideDate];
  if (v3)
  {
    int v4 = [(NUNIAstronomyVistaController *)self->_astronomyController overrideDate];
  }
  else
  {
    crownDate = self->_crownDate;
    if (crownDate)
    {
      int v4 = crownDate;
    }
    else
    {
      int v4 = [MEMORY[0x1E4F79FC0] faceDate];
    }
  }
  int v6 = v4;

  return v6;
}

- (void)_setComplicationsInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NTKAegirFaceView *)self _complicationContainerViewForSlot:0];
  [v4 setUserInteractionEnabled:v3];
}

- (void)_animateTransitionToViewMode:(int64_t)a3
{
}

- (void)_animateTransitionToViewMode:(int64_t)a3 completion:(id)a4
{
  int v6 = (void (**)(void))a4;
  float v10 = v6;
  if (*((unsigned char *)self + 1176))
  {
    if (self->_animatingToViewMode == a3) {
      goto LABEL_6;
    }
  }
  else if (self->_viewMode == a3)
  {
    goto LABEL_6;
  }
  self->_animatingToViewMode = a3;
  [(NUNIAstronomyVistaController *)self->_astronomyController animateTransitionToMode:a3];
  [(NTKDelayedBlock *)self->_wheelDelayedBlock cancel];
  wheelDelayedBlock = self->_wheelDelayedBlock;
  self->_wheelDelayedBlock = 0;

  [(NTKDelayedBlock *)self->_physicalButtonDelayedBlock cancel];
  physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
  self->_physicalButtonDelayedBlock = 0;

  *((unsigned char *)self + 1176) |= 1u;
  [(NUNIAstronomyVistaController *)self->_astronomyController setVista:[(NUNIAstronomyVistaController *)self->_astronomyController vista]];
  double v9 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
  [v9 showSupplemental:a3 == 3 animated:0];

  [(NTKAegirFaceView *)self _setIsAnimatingViewMode:0];
  [(NTKAegirFaceView *)self _setViewMode:a3];
  int v6 = v10;
LABEL_6:
  if (v6)
  {
    v6[2](v10);
    int v6 = v10;
  }
}

- (void)_setIsAnimatingViewMode:(BOOL)a3
{
  *((unsigned char *)self + 1176) = *((unsigned char *)self + 1176) & 0xFE | a3;
}

- (void)_setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3 || (*((unsigned char *)self + 1176) & 1) != 0) {
    -[NTKAegirFaceView _applyViewMode:](self, "_applyViewMode:");
  }
}

- (void)_applyViewMode:(int64_t)a3
{
  self->_viewMode = a3;
  [(NTKAegirFaceView *)self _invalidateTimeLabelStyles];
  *((unsigned char *)self + 1176) &= ~1u;
  int v5 = [(NTKAegirFaceView *)self delegate];
  objc_msgSend(v5, "faceViewWantsStatusBarHidden:animated:", -[NTKAegirFaceView _shouldHideStatusBarForViewMode:](self, "_shouldHideStatusBarForViewMode:", a3), 0);

  switch(a3)
  {
    case 0:
      [(NTKAegirFaceView *)self _setFaceViewModeActive];
      goto LABEL_4;
    case 1:
      [(NTKAegirFaceView *)self _setFaceViewModeDeactive];
      goto LABEL_4;
    case 2:
      [(NTKAegirFaceView *)self _setFaceViewModeInteractive];
      p_astronomyController = &self->_astronomyController;
      uint64_t v9 = [(NUNIAstronomyVistaController *)self->_astronomyController vista];
      uint64_t v10 = 28;
      if (v9 == 1) {
        uint64_t v10 = 56;
      }
      double v8 = (char *)&unk_1DAFD9270 + v10;
      goto LABEL_9;
    case 3:
      [(NTKAegirFaceView *)self _setFaceViewModeSupplemental];
      p_astronomyController = &self->_astronomyController;
      [(NUNIAstronomyVistaController *)self->_astronomyController vista];
      double v8 = (char *)&unk_1DAFD9270;
      goto LABEL_9;
    default:
LABEL_4:
      p_astronomyController = &self->_astronomyController;
      [(NUNIAstronomyVistaController *)self->_astronomyController vista];
      double v8 = (char *)&unk_1DAFD92C4;
LABEL_9:
      LODWORD(v7) = 1.0;
      [(NTKAegirFaceView *)self _interpolateFromPose:v8 toPose:v8 progress:v7];
      double v11 = *p_astronomyController;
      MEMORY[0x1F4181798](v11, sel_applyMode_);
      return;
  }
}

- (BOOL)_shouldHideStatusBarForViewMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_setFaceViewModeSupplemental
{
  [(NTKAegirFaceView *)self _setComplicationsInteractionEnabled:0];
  [(NTKAegirFaceView *)self _disableCrown];
  travelTimeLabel = self->_travelTimeLabel;
  id v4 = sub_1DAFD2E34();
  [(CLKUIColoringLabel *)travelTimeLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F35252B8];
  phaseLabel = self->_phaseLabel;

  [(CLKUIColoringLabel *)phaseLabel setText:&stru_1F35252B8];
}

- (void)_setFaceViewModeActive
{
  [(NTKAegirFaceView *)self _setComplicationsInteractionEnabled:1];
  if (NTKStarbearEnabled()) {
    [(NTKAegirFaceView *)self _disableCrown];
  }
  else {
    [(NTKAegirFaceView *)self _enableCrownForAegirVista:[(NUNIAstronomyVistaController *)self->_astronomyController vista]];
  }
  travelTimeLabel = self->_travelTimeLabel;
  id v4 = sub_1DAFD2E34();
  [(CLKUIColoringLabel *)travelTimeLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F35252B8];
  phaseLabel = self->_phaseLabel;

  [(CLKUIColoringLabel *)phaseLabel setText:&stru_1F35252B8];
}

- (void)_setFaceViewModeDeactive
{
  [(NTKAegirFaceView *)self _setComplicationsInteractionEnabled:0];
  [(NTKAegirFaceView *)self _disableCrown];
  travelTimeLabel = self->_travelTimeLabel;
  id v4 = sub_1DAFD2E34();
  [(CLKUIColoringLabel *)travelTimeLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F35252B8];
  phaseLabel = self->_phaseLabel;

  [(CLKUIColoringLabel *)phaseLabel setText:&stru_1F35252B8];
}

- (void)_setFaceViewModeInteractive
{
  [(NTKAegirFaceView *)self _setComplicationsInteractionEnabled:0];
  uint64_t v3 = [(NUNIAstronomyVistaController *)self->_astronomyController vista];

  [(NTKAegirFaceView *)self _enableCrownForAegirVista:v3];
}

- (void)_applyDataMode
{
  uint64_t v3 = [(NTKAegirFaceView *)self dataMode];
  if (v3 == 1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 != 2 && self->_previousDataMode == 1;
  }

  [(NTKAegirFaceView *)self _applyDataModeAnimated:v4];
}

- (void)_applyDataModeAnimated:(BOOL)a3
{
  if (([(NTKAegirFaceView *)self zooming] & 1) == 0)
  {
    int64_t viewMode = self->_viewMode;
    int64_t v6 = [(NTKAegirFaceView *)self dataMode];
    if (self->_previousDataMode != v6) {
      self->_previousDataMode = v6;
    }
    if (v6 == 1) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(NTKAegirFaceView *)self editing] ^ 1;
    }
    if (((*((unsigned char *)self + 1176) & 1) != 0 || v7 != viewMode)
      && ((*((unsigned char *)self + 1176) & 1) == 0 || v7 != self->_animatingToViewMode || !a3))
    {
      if (a3)
      {
        MEMORY[0x1F4181798](self, sel__animateTransitionToViewMode_);
      }
      else
      {
        double v8 = [(NUNIAstronomyVistaController *)self->_astronomyController vistaView];
        [v8 updateSunLocationAnimated:0];

        [(NTKAegirFaceView *)self _applyViewMode:v7];
      }
    }
  }
}

- (void)_layoutPhaseLabel
{
  p_phaseLabelDefaultFrame = &self->_phaseLabelDefaultFrame;
  double x = self->_phaseLabelDefaultFrame.origin.x;
  double y = self->_phaseLabelDefaultFrame.origin.y;
  double height = self->_phaseLabelDefaultFrame.size.height;
  -[CLKUIColoringLabel sizeThatFits:](self->_phaseLabel, "sizeThatFits:", self->_phaseLabelDefaultFrame.size.width, 0.0);
  double v8 = v7;
  phaseLabel = self->_phaseLabel;
  double v10 = y + height - v7;
  double width = p_phaseLabelDefaultFrame->size.width;

  -[CLKUIColoringLabel setFrame:](phaseLabel, "setFrame:", x, v10, width, v8);
}

- (void)_layoutSpheroidLabel:(int)a3
{
  int v5 = self->_spheroidLabels[a3];
  if (v5)
  {
    double v18 = v5;
    int64_t v6 = [(NTKAegirFaceView *)self device];
    _NTKAegirLayoutForDevice(v6);

    LODWORD(v6) = CLKLayoutIsRTL();
    double v7 = [(NTKAegirFaceView *)self device];
    [v7 screenBounds];
    double v9 = v8 - *(float *)&dword_1EA8FC824 - *(float *)&dword_1EA8FC828;

    double v10 = *(float *)&dword_1EA8FC824 + v9 / 7.0 * (double)a3;
    [(UIImageView *)v18 sizeToFit];
    [(UIImageView *)v18 frame];
    double v12 = v11;
    double v14 = v13;
    if (v6)
    {
      id v15 = [(NTKAegirFaceView *)self device];
      [v15 screenBounds];
      double v17 = v16 - *(float *)&dword_1EA8FC820 - v12;
    }
    else
    {
      double v17 = *(float *)&dword_1EA8FC820;
    }
    -[UIImageView setFrame:](v18, "setFrame:", v17, v10 + v14 * -0.5, v12, v14);
    int v5 = v18;
  }
}

- (id)_randomVistaImage
{
  return (id)MEMORY[0x1F4181798](NTKAegirFaceBundle, sel_imageWithName_);
}

- (BOOL)_vistaOptionIsRandom
{
  v2 = [(NTKAegirFaceView *)self optionForCustomEditMode:12 slot:0];
  BOOL v3 = [v2 vista] == 10;

  return v3;
}

- (BOOL)_styleOptionIsRandom
{
  v2 = [(NTKAegirFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 style] == 7;

  return v3;
}

- (void)_shuffleVistaIfNecessary
{
  if ([(NTKAegirFaceView *)self _vistaOptionIsRandom])
  {
    unint64_t v3 = [(NTKAegirFaceView *)self shuffledVistaForVista:10 shuffle:1];
    astronomyController = self->_astronomyController;
    [(NUNIAstronomyVistaController *)astronomyController setVista:v3];
  }
}

- (void)_shuffleStyleIfNecessary
{
  if ([(NTKAegirFaceView *)self _styleOptionIsRandom])
  {
    unint64_t v3 = [(NTKAegirFaceView *)self shuffledStyleForStyle:7 shuffle:1];
    astronomyController = self->_astronomyController;
    [(NUNIAstronomyVistaController *)astronomyController setStyle:v3];
  }
}

- (id)_homeScreenTimeViewConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F79FA8]);
  BOOL v4 = [(NTKAegirFaceView *)self device];
  [(NTKAegirFaceView *)self bounds];
  int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v4), "designatorFont");
  [v5 pointSize];
  double v7 = v6;

  double v8 = [(NTKAegirFaceView *)self device];
  LODWORD(v5) = NTKShowIndicScriptNumerals();

  if (v5)
  {
    double v9 = [(NTKAegirFaceView *)self optionForCustomEditMode:19 slot:0];
    [v9 numeralOption];

    double v10 = [NSNumber numberWithUnsignedInteger:CLKLocaleNumberSystemFromNumeralOption()];
    [v3 setForcedNumberSystem:v10];
  }
  double v11 = [(NTKAegirFaceView *)self device];
  double v12 = sub_1DAFD3B48(v7, (uint64_t)v11, 1, self->_numeralOption);
  [v3 setTimeLabelFont:v12];

  return v3;
}

- (id)_homeScreenDateLabelFont
{
  id v3 = [(NTKAegirFaceView *)self device];
  [(NTKAegirFaceView *)self bounds];
  BOOL v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79FE0], "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v3), "designatorFont");
  [v4 pointSize];
  double v6 = v5;

  double v7 = (void *)MEMORY[0x1E4F19A50];

  return (id)[v7 systemFontOfSize:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_randomVistaSnapshot, 0);
  objc_storeStrong((id *)&self->_physicalButtonDelayedBlock, 0);
  objc_storeStrong((id *)&self->_wheelDelayedBlock, 0);
  for (uint64_t i = 9; i != -1; --i)
    objc_storeStrong((id *)&self->_scrubDateFormatter[i], 0);
  objc_storeStrong((id *)&self->_crownDate, 0);
  for (uint64_t j = 7; j != -1; --j)
    objc_storeStrong((id *)&self->_spheroidLabels[j], 0);
  objc_storeStrong((id *)&self->_travelTimeLabel, 0);
  objc_storeStrong((id *)&self->_phaseLabel, 0);
  objc_storeStrong((id *)&self->_scrubLabel, 0);
  objc_storeStrong((id *)&self->_astronomyController, 0);
  objc_storeStrong((id *)&self->_cornerTimeLabel, 0);
  objc_storeStrong((id *)&self->_centerTimeLabelBack, 0);
  objc_storeStrong((id *)&self->_centerTimeLabelFront, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);

  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end