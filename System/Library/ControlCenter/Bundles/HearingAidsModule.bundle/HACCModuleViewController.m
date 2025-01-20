@interface HACCModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canDismissPresentedContent;
- (BOOL)isLiveListenEnabled;
- (BOOL)providesOwnPlatter;
- (HACCModuleViewController)init;
- (NSString)assetState;
- (double)preferredExpandedContentHeight;
- (float)exposure;
- (id)_symbolForState:(id)a3 withExposure:(float)a4;
- (id)shortcutViewController;
- (void)_updateSelectedStatus;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)haccIconButtonTapped;
- (void)pauseSoundRecognitionIfNecessary;
- (void)restartSoundRecognitionIfNecessary;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setExposure:(float)a3;
- (void)setIsLiveListenEnabled:(BOOL)a3;
- (void)shortcutDidChangeSize:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)updateViewWithAudioSample:(id)a3;
- (void)updateViewWithExposure:(float)a3;
- (void)updateViewWithState:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation HACCModuleViewController

- (HACCModuleViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)HACCModuleViewController;
  id v2 = [(HACCModuleViewController *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F474D8]);
    uint64_t v6 = objc_msgSend_initWithDelegate_(v3, v4, (uint64_t)v2, v5);
    v7 = (void *)*((void *)v2 + 128);
    *((void *)v2 + 128) = v6;

    objc_msgSend_addChildViewController_(v2, v8, *((void *)v2 + 128), v9);
    *((unsigned char *)v2 + 1041) = 0;
    *((_DWORD *)v2 + 261) = 0;
    objc_msgSend_updateViewWithState_(v2, v10, HACCIconAssetStateOff, v11);
    v15 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v12, v13, v14);
    objc_msgSend_setSelectedGlyphColor_(v2, v16, (uint64_t)v15, v17);
  }
  return (HACCModuleViewController *)v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v87.receiver = self;
  v87.super_class = (Class)HACCModuleViewController;
  [(CCUIButtonModuleViewController *)&v87 viewDidLoad];
  objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x263F33CA0], v3, v4, v5);
  uint64_t v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  collapsedBackgroundView = self->_collapsedBackgroundView;
  self->_collapsedBackgroundView = v6;

  v8 = self->_collapsedBackgroundView;
  v12 = objc_msgSend_view(self, v9, v10, v11);
  objc_msgSend_bounds(v12, v13, v14, v15);
  objc_msgSend_setFrame_(v8, v16, v17, v18);

  objc_msgSend_setAutoresizingMask_(self->_collapsedBackgroundView, v19, 18, v20);
  v21 = self->_collapsedBackgroundView;
  objc_msgSend_compactContinuousCornerRadius(self, v22, v23, v24);
  objc_msgSend__setContinuousCornerRadius_(v21, v25, v26, v27);
  v31 = objc_msgSend_view(self, v28, v29, v30);
  objc_msgSend_insertSubview_atIndex_(v31, v32, (uint64_t)self->_collapsedBackgroundView, 0);

  v36 = objc_msgSend_view(self, v33, v34, v35);
  v40 = objc_msgSend_view(self->_shortcutController, v37, v38, v39);
  objc_msgSend_addSubview_(v36, v41, (uint64_t)v40, v42);

  objc_initWeak(&location, self);
  v46 = objc_msgSend_view(self, v43, v44, v45);
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = sub_24064EC38;
  v84[3] = &unk_2650CAE40;
  objc_copyWeak(&v85, &location);
  objc_msgSend__setAccessibilityTraitsBlock_(v46, v47, (uint64_t)v84, v48);

  v52 = objc_msgSend_view(self, v49, v50, v51);
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = sub_24064ECBC;
  v82[3] = &unk_2650CAE68;
  objc_copyWeak(&v83, &location);
  objc_msgSend__setAccessibilityValueBlock_(v52, v53, (uint64_t)v82, v54);

  v58 = objc_msgSend_buttonView(self, v55, v56, v57);
  v59 = hearingLocString();
  objc_msgSend_setAccessibilityLabel_(v58, v60, (uint64_t)v59, v61);

  v65 = objc_msgSend_buttonView(self, v62, v63, v64);
  objc_msgSend_setAccessibilityIdentifier_(v65, v66, @"AX_HEARING_DEVICES", v67);

  v71 = objc_msgSend_buttonView(self, v68, v69, v70);
  v72 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  objc_msgSend_setAccessibilityHint_(v71, v73, (uint64_t)v72, v74);

  v75 = hearingLocString();
  objc_msgSend_setTitle_(self, v76, (uint64_t)v75, v77);

  objc_msgSend_setValueText_(self, v78, 0, v79);
  objc_msgSend_setSelectedValueText_(self, v80, 0, v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)HACCModuleViewController;
  [(HACCModuleViewController *)&v25 viewWillAppear:a3];
  objc_msgSend_startListening(self, v4, v5, v6);
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x263F47548], v7, v8, v9);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_24064EF2C;
  v22[3] = &unk_2650CAE90;
  objc_copyWeak(&v23, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v10, v11, (uint64_t)v22, (uint64_t)sel_comfortSoundsEnabled, self);

  uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x263F47528], v12, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_24064EF6C;
  v20[3] = &unk_2650CAEE0;
  objc_copyWeak(&v21, &location);
  objc_msgSend_registerListener_forLiveListenLevelsHandler_(v15, v16, (uint64_t)self, (uint64_t)v20);

  objc_msgSend__updateSelectedStatus(self, v17, v18, v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HACCModuleViewController;
  [(HACCModuleViewController *)&v7 viewDidDisappear:a3];
  objc_msgSend_stopListening(self, v4, v5, v6);
}

- (void)viewWillLayoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)HACCModuleViewController;
  [(CCUIButtonModuleViewController *)&v32 viewWillLayoutSubviews];
  int isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  uint64_t v14 = v10;
  if (isExpanded)
  {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 1.0);

    uint64_t v18 = objc_msgSend_buttonView(self, v15, v16, v17);
    double v19 = 0.0;
    objc_msgSend_setAlpha_(v18, v20, v21, v22, 0.0);
  }
  else
  {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 0.0);

    uint64_t v18 = objc_msgSend_buttonView(self, v23, v24, v25);
    double v19 = 1.0;
    objc_msgSend_setAlpha_(v18, v26, v27, v28, 1.0);
  }

  objc_msgSend_setAlpha_(self->_collapsedBackgroundView, v29, v30, v31, v19);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v8, sel_willTransitionToExpandedContentMode_);
  if (v3) {
    objc_msgSend_pauseSoundRecognitionIfNecessary(self, v5, v6, v7);
  }
  else {
    objc_msgSend_restartSoundRecognitionIfNecessary(self, v5, v6, v7);
  }
}

- (BOOL)canDismissPresentedContent
{
  uint64_t v4 = objc_msgSend_expandedController(self->_shortcutController, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)shortcutDidChangeSize:(id)a3
{
  BOOL v5 = objc_msgSend_view(self, a2, (uint64_t)a3, v3);
  objc_msgSend_bounds(v5, v6, v7, v8);
  objc_msgSend_preferredExpandedContentHeight(self, v9, v10, v11);

  if (objc_msgSend_isExpanded(self, v12, v13, v14))
  {
    MEMORY[0x270F9A6D0](self, sel_setPreferredContentSize_, v15, v16);
  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  HAInitializeLogging();
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"Dismissing Control Center", v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s:%d %@", v11, "-[HACCModuleViewController dismissPresentedContentAnimated:completion:]", 211, v9);
  uint64_t v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    uint64_t v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = objc_msgSend_UTF8String(v14, v16, v17, v18);
    _os_log_impl(&dword_24064D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v22 = objc_msgSend_presentedViewController(self, v19, v20, v21);
  objc_msgSend_dismissViewControllerAnimated_completion_(v22, v23, v4, (uint64_t)v6);
}

- (double)preferredExpandedContentHeight
{
  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)haccIconButtonTapped
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  objc_msgSend_requestExpandModule((void *)v5, v6, v7, v8);

  uint64_t v12 = objc_msgSend_assetState(self, v9, v10, v11);
  LOBYTE(v5) = objc_msgSend_isEqualToString_(v12, v13, HACCIconAssetStateOff, v14);

  if ((v5 & 1) == 0)
  {
    uint64_t v15 = AXLogAggregate();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = &unk_26F4C60D0;
      _os_log_impl(&dword_24064D000, v15, OS_LOG_TYPE_INFO, "Live headphone level opened: %@", buf, 0xCu);
    }

    AnalyticsSendEventLazy();
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
}

- (void)pauseSoundRecognitionIfNecessary
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F21DA0], a2, v2, v3);
  uint64_t v9 = objc_msgSend_soundDetectionState(v5, v6, v7, v8);

  if (v9 == 2)
  {
    uint64_t v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24064D000, v10, OS_LOG_TYPE_DEFAULT, "Pausing Sound Recognition for Live Listen UI", v17, 2u);
    }

    uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x263F21DA0], v11, v12, v13);
    objc_msgSend_setSoundDetectionState_(v14, v15, 1, v16);

    self->_pausedSoundRecognition = 1;
  }
}

- (void)restartSoundRecognitionIfNecessary
{
  if (self->_pausedSoundRecognition)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F21DA0], a2, v2, v3);
    uint64_t v9 = objc_msgSend_soundDetectionState(v5, v6, v7, v8);

    if (v9 == 1)
    {
      uint64_t v10 = AXLogUltron();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_24064D000, v10, OS_LOG_TYPE_DEFAULT, "Resuming Sound Recognition for Live Listen UI", v17, 2u);
      }

      uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x263F21DA0], v11, v12, v13);
      objc_msgSend_setSoundDetectionState_(v14, v15, 2, v16);

      self->_pausedSoundRecognition = 0;
    }
  }
}

- (void)startListening
{
  objc_initWeak(&location, self);
  id v6 = objc_msgSend_sharedInstance(MEMORY[0x263F47528], v3, v4, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_24064F850;
  v8[3] = &unk_2650CAF58;
  objc_copyWeak(&v9, &location);
  objc_msgSend_registerListener_forLiveHeadphoneLevelHandler_(v6, v7, (uint64_t)self, (uint64_t)v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopListening
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F47528], a2, v2, v3);
  objc_msgSend_unregisterLiveHeadphoneLevelHandler_(v5, v6, (uint64_t)self, v7);

  uint64_t v10 = HACCIconAssetStateOff;

  objc_msgSend_updateViewWithState_(self, v8, v10, v9);
}

- (void)updateViewWithAudioSample:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F47500];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, v4, v7);
  objc_msgSend_floatValue(v8, v9, v10, v11);

  uint64_t v14 = objc_msgSend_objectForKey_(v5, v12, *MEMORY[0x263F47510], v13);
  uint64_t v18 = objc_msgSend_unsignedIntegerValue(v14, v15, v16, v17);

  uint64_t v21 = objc_msgSend_objectForKey_(v5, v19, *MEMORY[0x263F474F8], v20);

  LODWORD(v5) = objc_msgSend_BOOLValue(v21, v22, v23, v24);
  if (v5)
  {
    if (v18)
    {
      if (v18 != 100 && v18 != 80)
      {
LABEL_11:
        MEMORY[0x270F9A6D0](self, sel_updateViewWithExposure_, v26, v27);
        return;
      }
      uint64_t v28 = &HACCIconAssetStateWarning;
    }
    else
    {
      uint64_t v28 = &HACCIconAssetStateSafe;
    }
    objc_msgSend_updateViewWithState_(self, v25, (uint64_t)*v28, v27);
    goto LABEL_11;
  }
  uint64_t v29 = HACCIconAssetStateOff;

  objc_msgSend_updateViewWithState_(self, v25, v29, v27);
}

- (void)updateViewWithState:(id)a3
{
  id v25 = a3;
  uint64_t v8 = objc_msgSend_assetState(self, v5, v6, v7);
  if (!v8
    || (uint64_t v12 = (void *)v8,
        objc_msgSend_assetState(self, v9, v10, v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v25, v15),
        v13,
        v12,
        (isEqualToString & 1) == 0))
  {
    objc_storeStrong((id *)&self->_assetState, a3);
    objc_msgSend_exposure(self, v17, v18, v19);
    uint64_t v22 = objc_msgSend__symbolForState_withExposure_(self, v20, (uint64_t)v25, v21);
    objc_msgSend_setGlyphImage_(self, v23, (uint64_t)v22, v24);
  }
}

- (void)updateViewWithExposure:(float)a3
{
  objc_msgSend_exposure(self, a2, v3, v4);
  if (v10 != a3)
  {
    self->_exposure = a3;
    objc_msgSend_assetState(self, v7, v8, v9);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&double v11 = a3;
    uint64_t v14 = objc_msgSend__symbolForState_withExposure_(self, v12, (uint64_t)v17, v13, v11);
    objc_msgSend_setGlyphImage_(self, v15, (uint64_t)v14, v16);
  }
}

- (id)_symbolForState:(id)a3 withExposure:(float)a4
{
  id v5 = a3;
  double v11 = objc_msgSend_configurationPreferringMulticolor(MEMORY[0x263F1C6C8], v6, v7, v8);
  if ((float)((float)(a4 + -20.0) / 90.0) >= 0.0) {
    float v12 = (float)(a4 + -20.0) / 90.0;
  }
  else {
    float v12 = 0.0;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, HACCIconAssetStateOff, v10))
  {
    uint64_t v15 = objc_msgSend_systemImageNamed_(MEMORY[0x263F1C6B0], v13, @"ear", v14);
    uint64_t v19 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v16, v17, v18);
    uint64_t v22 = objc_msgSend_imageWithTintColor_(v15, v20, (uint64_t)v19, v21);

LABEL_11:
    goto LABEL_12;
  }
  float v23 = fminf(v12, 1.0);
  if (objc_msgSend_isEqualToString_(v5, v13, (uint64_t)HACCIconAssetStateSafe, v14))
  {
    uint64_t v26 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v27 = (void *)MEMORY[0x263F086E0];
    uint64_t v28 = objc_opt_class();
    uint64_t v15 = objc_msgSend_bundleForClass_(v27, v29, v28, v30);
    objc_msgSend_imageNamed_inBundle_variableValue_withConfiguration_(v26, v31, @"ear.badge.checkmark.dots", (uint64_t)v15, v11, v23);
    uint64_t v22 = LABEL_10:;
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(v5, v24, (uint64_t)HACCIconAssetStateWarning, v25))
  {
    objc_super v32 = (void *)MEMORY[0x263F1C6B0];
    v33 = (void *)MEMORY[0x263F086E0];
    uint64_t v34 = objc_opt_class();
    uint64_t v15 = objc_msgSend_bundleForClass_(v33, v35, v34, v36);
    objc_msgSend_imageNamed_inBundle_variableValue_withConfiguration_(v32, v37, @"ear.trianglebadge.exclamationmark.dots", (uint64_t)v15, v11, v23);
    goto LABEL_10;
  }
  uint64_t v22 = 0;
LABEL_12:

  return v22;
}

- (void)_updateSelectedStatus
{
  objc_msgSend_sharedInstance(MEMORY[0x263F47548], a2, v2, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_comfortSoundsEnabled(v14, v5, v6, v7))
  {
    objc_msgSend_setSelected_(self, v8, 1, v10);
  }
  else
  {
    uint64_t isLiveListenEnabled = objc_msgSend_isLiveListenEnabled(self, v8, v9, v10);
    objc_msgSend_setSelected_(self, v12, isLiveListenEnabled, v13);
  }
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HACCModuleViewController;
  -[CCUIButtonModuleViewController setCompactContinuousCornerRadius:](&v8, sel_setCompactContinuousCornerRadius_);
  objc_msgSend__setContinuousCornerRadius_(self->_collapsedBackgroundView, v5, v6, v7, a3);
}

- (NSString)assetState
{
  return self->_assetState;
}

- (BOOL)isLiveListenEnabled
{
  return self->_isLiveListenEnabled;
}

- (void)setIsLiveListenEnabled:(BOOL)a3
{
  self->_uint64_t isLiveListenEnabled = a3;
}

- (float)exposure
{
  return self->_exposure;
}

- (void)setExposure:(float)a3
{
  self->_exposure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetState, 0);
  objc_storeStrong((id *)&self->_collapsedBackgroundView, 0);

  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end