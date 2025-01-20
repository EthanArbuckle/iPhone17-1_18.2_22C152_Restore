@interface NTKEsterbrookFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_applyRoundedCornerOverlay;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKEsterbrookFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKEsterbrookSceneCoordinator)sceneCoordinator;
- (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView)handsView;
- (double)breathingFraction;
- (double)rubberbandingFraction;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (id)esterbrookPalette;
- (void)_applyBreathingAndRubberbanding;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPalette:(id)a3;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_loadSnapshotContentViews;
- (void)_setupSceneCoordinator;
- (void)_setupTimeView;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_teardownSceneCoordinator;
- (void)_teardownTimeView;
- (void)_unloadSnapshotContentViews;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setBreathingFraction:(double)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHandsView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setRubberbandingFraction:(double)a3;
- (void)setSceneCoordinator:(id)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKEsterbrookFaceView

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView screenWillTurnOnAnimated:](&v11, sel_screenWillTurnOnAnimated_);
  v8 = objc_msgSend_sceneCoordinator(self, v5, v6, v7);
  objc_msgSend_screenWillTurnOnAnimated_(v8, v9, v3, v10);
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView screenDidTurnOffAnimated:](&v11, sel_screenDidTurnOffAnimated_);
  v8 = objc_msgSend_sceneCoordinator(self, v5, v6, v7);
  objc_msgSend_screenDidTurnOffWithAnimated_(v8, v9, v3, v10);
}

- (NTKEsterbrookFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKEsterbrookFaceView;
  return [(NTKEsterbrookFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
}

- (void)_loadSnapshotContentViews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v15 _loadSnapshotContentViews];
  objc_super v6 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v3, v4, v5);
  objc_msgSend_setBackgroundColor_(self, v7, (uint64_t)v6, v8);

  objc_msgSend__setupTimeView(self, v9, v10, v11);
  objc_msgSend__setupSceneCoordinator(self, v12, v13, v14);
}

- (void)_unloadSnapshotContentViews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v12 _unloadSnapshotContentViews];
  objc_msgSend__stopClockUpdates(self, v3, v4, v5);
  objc_msgSend__teardownTimeView(self, v6, v7, v8);
  objc_msgSend__teardownSceneCoordinator(self, v9, v10, v11);
}

- (void)_setupTimeView
{
  handsView = self->_handsView;
  if (!handsView)
  {
    uint64_t v5 = [_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView alloc];
    v9 = objc_msgSend_device(self, v6, v7, v8);
    objc_super v12 = (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView *)objc_msgSend_initForDevice_(v5, v10, (uint64_t)v9, v11);
    uint64_t v13 = self->_handsView;
    self->_handsView = v12;

    uint64_t v14 = self->_handsView;
    v18 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v15, v16, v17);
    v22 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v19, v20, v21);
    objc_msgSend_applyHourMinuteHandsStrokeColor_fillColor_(v14, v23, (uint64_t)v18, (uint64_t)v22);

    v27 = objc_msgSend_hourHandView(self->_handsView, v24, v25, v26);
    v31 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v28, v29, v30);
    objc_msgSend_setHandDotColor_(v27, v32, (uint64_t)v31, v33);

    v37 = objc_msgSend_minuteHandView(self->_handsView, v34, v35, v36);
    v41 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v38, v39, v40);
    objc_msgSend_setHandDotColor_(v37, v42, (uint64_t)v41, v43);

    v47 = objc_msgSend_secondHandView(self->_handsView, v44, v45, v46);
    v51 = objc_msgSend_blackColor(MEMORY[0x263F825C8], v48, v49, v50);
    objc_msgSend_setHandDotColor_(v47, v52, (uint64_t)v51, v53);

    v57 = objc_msgSend_hourHandView(self->_handsView, v54, v55, v56);
    objc_msgSend_setShadowsHidden_(v57, v58, 1, v59);

    v63 = objc_msgSend_minuteHandView(self->_handsView, v60, v61, v62);
    objc_msgSend_setShadowsHidden_(v63, v64, 1, v65);

    v69 = objc_msgSend_secondHandView(self->_handsView, v66, v67, v68);
    objc_msgSend_setShadowsHidden_(v69, v70, 1, v71);

    handsView = self->_handsView;
  }

  MEMORY[0x270F9A6D0](self, sel_setTimeView_, handsView, v2);
}

- (void)_teardownTimeView
{
  objc_msgSend_removeFromSuperview(self->_handsView, a2, v2, v3);

  MEMORY[0x270F9A6D0](self, sel_setTimeView_, 0, v5);
}

- (void)_setupSceneCoordinator
{
  uint64_t v3 = [NTKEsterbrookSceneCoordinator alloc];
  objc_msgSend_bounds(self, v4, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v18 = objc_msgSend_device(self, v15, v16, v17);
  handsView = self->_handsView;
  v23 = objc_msgSend_esterbrookPalette(self, v20, v21, v22);
  v27 = objc_msgSend_currentFaceState(self, v24, v25, v26);
  uint64_t v29 = (NTKEsterbrookSceneCoordinator *)objc_msgSend_initWithFrame_device_handsView_colorPalette_faceState_(v3, v28, (uint64_t)v18, (uint64_t)handsView, v23, v27, v8, v10, v12, v14);
  sceneCoordinator = self->_sceneCoordinator;
  self->_sceneCoordinator = v29;

  objc_msgSend_contentView(self, v31, v32, v33);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_sceneView(self->_sceneCoordinator, v34, v35, v36);
  objc_msgSend_addSubview_(v40, v38, (uint64_t)v37, v39);
}

- (void)_teardownSceneCoordinator
{
  uint64_t v5 = objc_msgSend_sceneView(self->_sceneCoordinator, a2, v2, v3);
  objc_msgSend_removeFromSuperview(v5, v6, v7, v8);

  sceneCoordinator = self->_sceneCoordinator;
  self->_sceneCoordinator = 0;
}

- (void)_startClockUpdates
{
  if (!self->_secondTimerToken)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263EFCF88], v3, v4, v5);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_246A840E8;
    v10[3] = &unk_2651F4CC0;
    objc_copyWeak(&v11, &location);
    objc_msgSend_startUpdatesWithUpdateFrequency_withHandler_identificationLog_(v6, v7, 1, (uint64_t)v10, &unk_26FB01838);
    uint64_t v8 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    secondTimerToken = self->_secondTimerToken;
    self->_secondTimerToken = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_stopClockUpdates
{
  if (self->_secondTimerToken)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263EFCF88], a2, v2, v3);
    objc_msgSend_stopUpdatesForToken_(v5, v6, (uint64_t)self->_secondTimerToken, v7);

    secondTimerToken = self->_secondTimerToken;
    self->_secondTimerToken = 0;
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKEsterbrookFaceView;
  id v6 = a3;
  [(NTKEsterbrookFaceView *)&v11 setOverrideDate:v6 duration:a4];
  objc_msgSend_setOverrideDate_duration_(self->_handsView, v7, (uint64_t)v6, v8, a4, v11.receiver, v11.super_class);
  objc_msgSend_setOverrideDate_duration_(self->_sceneCoordinator, v9, (uint64_t)v6, v10, a4);
}

- (void)setTimeOffset:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView setTimeOffset:](&v11, sel_setTimeOffset_);
  objc_msgSend_setTimeOffset_(self->_handsView, v5, v6, v7, a3);
  objc_msgSend_setTimeOffset_(self->_sceneCoordinator, v8, v9, v10, a3);
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView setFrozen:](&v9, sel_setFrozen_);
  objc_msgSend_setFrozen_(self->_handsView, v5, v3, v6);
  objc_msgSend_setFrozen_(self->_sceneCoordinator, v7, v3, v8);
}

- (BOOL)_applyRoundedCornerOverlay
{
  return 1;
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v2 layoutSubviews];
}

- (void)setDataMode:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v11 setDataMode:a3];
  handsView = self->_handsView;
  uint64_t v8 = objc_msgSend_dataMode(self, v5, v6, v7);
  objc_msgSend_setDataMode_(handsView, v9, v8, v10);
}

- (void)_applyDataMode
{
  v21.receiver = self;
  v21.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v21 _applyDataMode];
  int64_t previousDataMode = self->_previousDataMode;
  if (previousDataMode != objc_msgSend_dataMode(self, v4, v5, v6))
  {
    sceneCoordinator = self->_sceneCoordinator;
    objc_super v11 = objc_msgSend_currentFaceState(self, v7, v8, v9);
    objc_msgSend_applyFaceState_(sceneCoordinator, v12, (uint64_t)v11, v13);

    uint64_t v17 = objc_msgSend_dataMode(self, v14, v15, v16);
    if ((unint64_t)(v17 - 2) >= 4 && v17)
    {
      if (v17 == 1) {
        objc_msgSend__startClockUpdates(self, v18, v19, v20);
      }
    }
    else
    {
      objc_msgSend__stopClockUpdates(self, v18, v19, v20);
    }
    self->_int64_t previousDataMode = objc_msgSend_dataMode(self, v18, v19, v20);
  }
}

- (void)_applyShowContentForUnadornedSnapshot
{
  v13.receiver = self;
  v13.super_class = (Class)NTKEsterbrookFaceView;
  [(NTKEsterbrookFaceView *)&v13 _applyShowContentForUnadornedSnapshot];
  uint64_t v6 = objc_msgSend_timeView(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_showContentForUnadornedSnapshot(self, v7, v8, v9);
  objc_msgSend_setHidden_(v6, v11, v10, v12);
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  uint64_t v4 = &unk_26FB08F40;
  if (a3 != 10) {
    uint64_t v4 = 0;
  }
  if (a3 == 11) {
    return &unk_26FB08F28;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 11)
  {
    id v9 = a5;
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)&unk_26FB08EF8, v11);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)&unk_26FB08EE0, v14);

    id v16 = v8;
    if (!qword_2691C1F50)
    {
      uint64_t v20 = objc_opt_new();
      objc_super v21 = (void *)qword_2691C1F50;
      qword_2691C1F50 = v20;
    }
    uint64_t v22 = NSString;
    v23 = objc_msgSend_identifier(v15, v17, v18, v19);
    uint64_t v26 = objc_msgSend_stringWithFormat_(v22, v24, @"%@-%@", v25, v16, v23);

    uint64_t v29 = objc_msgSend_objectForKey_((void *)qword_2691C1F50, v27, (uint64_t)v26, v28);
    if (!v29)
    {
      uint64_t v30 = [NTKEsterbrookFaceView alloc];
      v34 = objc_msgSend_device(self, v31, v32, v33);
      uint64_t v36 = objc_msgSend_initWithFaceStyle_forDevice_clientIdentifier_(v30, v35, 44, (uint64_t)v34, 0);

      objc_msgSend_frame(self, v37, v38, v39);
      objc_msgSend_setFrame_(v36, v40, v41, v42);
      objc_msgSend__loadSnapshotContentViews(v36, v43, v44, v45);
      objc_msgSend_setOption_forCustomEditMode_slot_(v36, v46, (uint64_t)v16, 11, 0);
      objc_msgSend_setOption_forCustomEditMode_slot_(v36, v47, (uint64_t)v15, 10, 0);
      v48 = NTKIdealizedDate();
      objc_msgSend_setOverrideDate_duration_(v36, v49, (uint64_t)v48, v50, 0.0);

      uint64_t v54 = objc_msgSend_dataMode(self, v51, v52, v53);
      objc_msgSend_setDataMode_(v36, v55, v54, v56);
      objc_msgSend_frame(self, v57, v58, v59);
      objc_msgSend_setFrame_(v36, v60, v61, v62);
      objc_msgSend_bounds(v36, v63, v64, v65);
      v79.width = v66;
      v79.height = v67;
      UIGraphicsBeginImageContextWithOptions(v79, 0, 0.0);
      uint64_t v71 = objc_msgSend_layer(v36, v68, v69, v70);
      CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
      objc_msgSend_renderInContext_(v71, v73, (uint64_t)CurrentContext, v74);

      uint64_t v29 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      objc_msgSend_setObject_forKey_((void *)qword_2691C1F50, v75, (uint64_t)v29, (uint64_t)v26);
    }
  }
  else
  {
    v77.receiver = self;
    v77.super_class = (Class)NTKEsterbrookFaceView;
    id v16 = a5;
    uint64_t v29 = [(NTKEsterbrookFaceView *)&v77 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v16];
  }

  return v29;
}

- (NTKEsterbrookSceneCoordinator)sceneCoordinator
{
  return self->_sceneCoordinator;
}

- (void)setSceneCoordinator:(id)a3
{
}

- (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView)handsView
{
  return self->_handsView;
}

- (void)setHandsView:(id)a3
{
}

- (double)breathingFraction
{
  return self->_breathingFraction;
}

- (void)setBreathingFraction:(double)a3
{
  self->_breathingFraction = a3;
}

- (double)rubberbandingFraction
{
  return self->_rubberbandingFraction;
}

- (void)setRubberbandingFraction:(double)a3
{
  self->_rubberbandingFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handsView, 0);
  objc_storeStrong((id *)&self->_sceneCoordinator, 0);

  objc_storeStrong((id *)&self->_secondTimerToken, 0);
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v29 = a3;
  id v11 = a5;
  if (a4 == 10)
  {
    id v16 = objc_msgSend_esterbrookPalette(self, v8, v9, v10);
    objc_msgSend__applyPalette_(self, v27, (uint64_t)v16, v28);
  }
  else
  {
    if (a4 != 11) {
      goto LABEL_6;
    }
    uint64_t v12 = objc_msgSend_density(v29, v8, v9, v10);
    id v16 = objc_msgSend_sceneCoordinator(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_sceneView(v16, v17, v18, v19);
    v24 = objc_msgSend_dialView(v20, v21, v22, v23);
    objc_msgSend_setDensity_(v24, v25, v12, v26);
  }
LABEL_6:
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v37 = a4;
  id v12 = a5;
  id v16 = a7;
  if (a6 == 10)
  {
    uint64_t v25 = objc_msgSend_interpolatedColorPalette(self, v13, v14, v15);
    objc_msgSend__applyPalette_(self, v35, (uint64_t)v25, v36);
  }
  else
  {
    if (a6 != 11) {
      goto LABEL_6;
    }
    uint64_t v17 = objc_msgSend_density(v37, v13, v14, v15);
    uint64_t v21 = objc_msgSend_density(v12, v18, v19, v20);
    uint64_t v25 = objc_msgSend_sceneCoordinator(self, v22, v23, v24);
    id v29 = objc_msgSend_sceneView(v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_dialView(v29, v30, v31, v32);
    objc_msgSend_applyDensityTransitionWithFraction_from_to_(v33, v34, v17, v21, a3);
  }
LABEL_6:
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  objc_msgSend_setBreathingFraction_(self, v7, v8, v9, a3);
  objc_msgSend__applyBreathingAndRubberbanding(self, v10, v11, v12);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NTKEsterbrookFaceView;
  -[NTKEsterbrookFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v16, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  NTKAlphaForRubberBandingFraction();
  objc_msgSend_setAlpha_(self, v7, v8, v9);
  objc_msgSend_setRubberbandingFraction_(self, v10, v11, v12, a3);
  objc_msgSend__applyBreathingAndRubberbanding(self, v13, v14, v15);
}

- (void)_applyBreathingAndRubberbanding
{
  objc_msgSend_breathingFraction(self, a2, v2, v3);
  NTKLargeElementScaleForBreathingFraction();
  double v6 = v5;
  objc_msgSend_rubberbandingFraction(self, v7, v8, v9);
  NTKScaleForRubberBandingFraction();
  CGAffineTransformMakeScale(&v14, v6 * v10, v6 * v10);
  CGAffineTransform v13 = v14;
  objc_msgSend_setTransform_(self, v11, (uint64_t)&v13, v12);
}

- (id)createFaceColorPalette
{
  uint64_t v2 = objc_alloc_init(NTKEsterbrookColorPalette);

  return v2;
}

- (void)_applyPalette:(id)a3
{
  id v4 = a3;
  objc_msgSend_sceneCoordinator(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColorPalette_(v10, v8, (uint64_t)v4, v9);
}

- (id)esterbrookPalette
{
  return (id)((uint64_t (*)(NTKEsterbrookFaceView *, char *))MEMORY[0x270F9A6D0])(self, sel_faceColorPalette);
}

@end