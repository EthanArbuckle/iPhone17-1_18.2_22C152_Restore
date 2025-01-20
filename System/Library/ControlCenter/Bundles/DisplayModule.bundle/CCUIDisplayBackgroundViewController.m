@interface CCUIDisplayBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_toggleNightShift;
- (BOOL)_uses24HourTime;
- (CCUILabeledRoundButtonViewController)nightShiftButton;
- (CCUILabeledRoundButtonViewController)styleModeButton;
- (CCUILabeledRoundButtonViewController)trueToneButton;
- (id)_alertControllerForDisablingAccessibilityScreenFilter:(id)a3 cancelBlock:(id)a4;
- (id)_subtitleForBlueLightStatus:(id *)a3;
- (id)_subtitleForTrueToneEnabled:(BOOL)a3;
- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4;
- (id)_subtitleFormatStringForBlueLightEnabled:(BOOL)a3 transitionTime:(id)a4;
- (id)_timeFormatter;
- (id)_timeStringForBlueLightTransitionTime:(id)a3;
- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4;
- (unint64_t)_formattedHourForHour:(unint64_t)a3;
- (unint64_t)_formattedHourForTransitionTime:(id)a3;
- (void)_getBlueLightStatus:(id)a3;
- (void)_nightShiftButtonPressed:(id)a3;
- (void)_setNightShiftEnabled:(BOOL)a3;
- (void)_setupNightShift;
- (void)_setupStyleMode;
- (void)_setupTrueTone;
- (void)_styleModeButtonPressed:(id)a3;
- (void)_toggleStyleMode;
- (void)_toggleTrueTone;
- (void)_trueToneButtonPressed:(id)a3;
- (void)_updateState;
- (void)dealloc;
- (void)setNightShiftButton:(id)a3;
- (void)setStyleModeButton:(id)a3;
- (void)setTrueToneButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUIDisplayBackgroundViewController

- (void)viewDidLoad
{
  v126.receiver = self;
  v126.super_class = (Class)CCUIDisplayBackgroundViewController;
  [(CCUICustomContentModuleBackgroundViewController *)&v126 viewDidLoad];
  brightnessClient = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v3, v4);
  if (objc_opt_respondsToSelector())
  {
    v8 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v6, v7);
    int isFrontBoard = objc_msgSend_isFrontBoard(v8, v9, v10);

    if (!isFrontBoard) {
      goto LABEL_5;
    }
    v12 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = self->_brightnessClient;
    self->_brightnessClient = v12;
  }

LABEL_5:
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  buttons = self->_buttons;
  self->_buttons = v13;

  if (_UIUpdatedVisualStyleEnabled())
  {
    v17 = (void *)MEMORY[0x263F33C68];
    v18 = (void *)MEMORY[0x263F086E0];
    uint64_t v19 = objc_opt_class();
    v21 = objc_msgSend_bundleForClass_(v18, v20, v19);
    v125 = objc_msgSend_descriptionForPackageNamed_inBundle_(v17, v22, @"StyleMode", v21);

    id v23 = objc_alloc(MEMORY[0x263F33CB8]);
    v26 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v24, v25);
    v28 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphPackageDescription_highlightColor_(v23, v27, (uint64_t)v125, v26);
    styleModeButton = self->_styleModeButton;
    self->_styleModeButton = v28;

    v30 = self->_styleModeButton;
    v31 = (void *)MEMORY[0x263F086E0];
    uint64_t v32 = objc_opt_class();
    v34 = objc_msgSend_bundleForClass_(v31, v33, v32);
    v36 = objc_msgSend_localizedStringForKey_value_table_(v34, v35, @"CONTROL_CENTER_STYLE_MODE_SETTING_NAME", &stru_26F4C34A8, 0);
    objc_msgSend_setTitle_(v30, v37, (uint64_t)v36);

    objc_msgSend_setLabelsVisible_(self->_styleModeButton, v38, 1);
    v41 = objc_msgSend_button(self->_styleModeButton, v39, v40);
    objc_msgSend_addTarget_action_forControlEvents_(v41, v42, (uint64_t)self, sel__styleModeButtonPressed_, 64);

    objc_msgSend_addObject_(self->_buttons, v43, (uint64_t)self->_styleModeButton);
    objc_msgSend__setupStyleMode(self, v44, v45);
  }
  unint64_t v46 = 0x263F1C000;
  if (self->_brightnessClient)
  {
    if (!objc_msgSend_supportsBlueLightReduction(MEMORY[0x263F34248], v15, v16)) {
      goto LABEL_12;
    }
    objc_msgSend_blueLightClient(self->_brightnessClient, v47, v48);
  }
  else
  {
    objc_msgSend_blueLightClient(0, v15, v16);
  }
  v49 = (CBBlueLightClient *)objc_claimAutoreleasedReturnValue();
  nightShiftClient = self->_nightShiftClient;
  self->_nightShiftClient = v49;

  v51 = (void *)MEMORY[0x263F1C6B0];
  v52 = (void *)MEMORY[0x263F086E0];
  uint64_t v53 = objc_opt_class();
  v55 = objc_msgSend_bundleForClass_(v52, v54, v53);
  v57 = objc_msgSend_imageNamed_inBundle_(v51, v56, @"NightShift", v55);

  v60 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v58, v59);
  v62 = objc_msgSend__flatImageWithColor_(v57, v61, (uint64_t)v60);

  id v63 = objc_alloc(MEMORY[0x263F33CB8]);
  v66 = objc_msgSend_systemOrangeColor(MEMORY[0x263F1C550], v64, v65);
  v68 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphImage_highlightColor_(v63, v67, (uint64_t)v62, v66);
  nightShiftButton = self->_nightShiftButton;
  self->_nightShiftButton = v68;

  v70 = self->_nightShiftButton;
  v71 = (void *)MEMORY[0x263F086E0];
  uint64_t v72 = objc_opt_class();
  v74 = objc_msgSend_bundleForClass_(v71, v73, v72);
  v76 = objc_msgSend_localizedStringForKey_value_table_(v74, v75, @"CONTROL_CENTER_NIGHT_SHIFT_SETTING_NAME", &stru_26F4C34A8, 0);
  objc_msgSend_setTitle_(v70, v77, (uint64_t)v76);

  objc_msgSend_setLabelsVisible_(self->_nightShiftButton, v78, 1);
  v81 = objc_msgSend_button(self->_nightShiftButton, v79, v80);
  objc_msgSend_addTarget_action_forControlEvents_(v81, v82, (uint64_t)self, sel__nightShiftButtonPressed_, 64);

  objc_msgSend_addObject_(self->_buttons, v83, (uint64_t)self->_nightShiftButton);
  objc_msgSend__setupNightShift(self, v84, v85);

  unint64_t v46 = 0x263F1C000uLL;
LABEL_12:
  if (!self->_brightnessClient)
  {
    objc_msgSend_adaptationClient(0, v47, v48);
    goto LABEL_16;
  }
  if (objc_msgSend_supportsAdaptation(MEMORY[0x263F34248], v47, v48))
  {
    objc_msgSend_adaptationClient(self->_brightnessClient, v86, v87);
LABEL_16:
    v88 = (CBAdaptationClient *)objc_claimAutoreleasedReturnValue();
    trueToneClient = self->_trueToneClient;
    self->_trueToneClient = v88;

    v90 = *(void **)(v46 + 1712);
    v91 = (void *)MEMORY[0x263F086E0];
    uint64_t v92 = objc_opt_class();
    v94 = objc_msgSend_bundleForClass_(v91, v93, v92);
    v96 = objc_msgSend_imageNamed_inBundle_(v90, v95, @"TrueTone", v94);

    v99 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v97, v98);
    v101 = objc_msgSend__flatImageWithColor_(v96, v100, (uint64_t)v99);

    id v102 = objc_alloc(MEMORY[0x263F33CB8]);
    v105 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v103, v104);
    v107 = (CCUILabeledRoundButtonViewController *)objc_msgSend_initWithGlyphImage_highlightColor_(v102, v106, (uint64_t)v101, v105);
    trueToneButton = self->_trueToneButton;
    self->_trueToneButton = v107;

    v109 = self->_trueToneButton;
    v110 = (void *)MEMORY[0x263F086E0];
    uint64_t v111 = objc_opt_class();
    v113 = objc_msgSend_bundleForClass_(v110, v112, v111);
    v115 = objc_msgSend_localizedStringForKey_value_table_(v113, v114, @"CONTROL_CENTER_TRUE_TONE_SETTING_NAME", &stru_26F4C34A8, 0);
    objc_msgSend_setTitle_(v109, v116, (uint64_t)v115);

    objc_msgSend_setLabelsVisible_(self->_trueToneButton, v117, 1);
    v120 = objc_msgSend_button(self->_trueToneButton, v118, v119);
    objc_msgSend_addTarget_action_forControlEvents_(v120, v121, (uint64_t)self, sel__trueToneButtonPressed_, 64);

    objc_msgSend_addObject_(self->_buttons, v122, (uint64_t)self->_trueToneButton);
    objc_msgSend__setupTrueTone(self, v123, v124);
  }
  objc_msgSend_setFooterButtons_(self, v86, (uint64_t)self->_buttons);
}

- (void)dealloc
{
  objc_msgSend_setStatusNotificationBlock_(self->_nightShiftClient, a2, 0);
  objc_msgSend_unregisterNotificationCallbackBlock(self->_trueToneClient, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)CCUIDisplayBackgroundViewController;
  [(CCUIDisplayBackgroundViewController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayBackgroundViewController;
  [(CCUIDisplayBackgroundViewController *)&v6 viewWillAppear:a3];
  objc_msgSend__updateState(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_styleModeButtonPressed:(id)a3
{
}

- (void)_nightShiftButtonPressed:(id)a3
{
}

- (void)_trueToneButtonPressed:(id)a3
{
}

- (void)_setupStyleMode
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__styleModeDidChange, *MEMORY[0x263F1D7C0], 0);
}

- (void)_setupNightShift
{
  objc_initWeak(&location, self);
  nightShiftClient = self->_nightShiftClient;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240641DBC;
  v5[3] = &unk_2650CA348;
  objc_copyWeak(&v6, &location);
  objc_msgSend_setStatusNotificationBlock_(nightShiftClient, v4, (uint64_t)v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupTrueTone
{
  objc_initWeak(&location, self);
  trueToneClient = self->_trueToneClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2406421C4;
  v7[3] = &unk_2650CA398;
  objc_copyWeak(&v8, &location);
  uint64_t v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  objc_msgSend_registerNotificationCallbackBlock_withQueue_(trueToneClient, v6, (uint64_t)v7, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateState
{
  uint64_t Enabled = objc_msgSend_getEnabled(self->_trueToneClient, a2, v2);
  objc_msgSend_setEnabled_(self->_trueToneButton, v5, Enabled);
  trueToneButton = self->_trueToneButton;
  id v8 = objc_msgSend__subtitleForTrueToneEnabled_(self, v7, Enabled);
  objc_msgSend_setSubtitle_(trueToneButton, v9, (uint64_t)v8);

  uint64_t v10 = self->_trueToneButton;
  int v13 = objc_msgSend_available(self->_trueToneClient, v11, v12);
  objc_msgSend_setInoperative_(v10, v14, v13 ^ 1u);
  v17 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], v15, v16);
  uint64_t v20 = objc_msgSend_currentStyle(v17, v18, v19);

  id v23 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], v21, v22);
  v26 = objc_msgSend_nextTransition(v23, v24, v25);

  v29 = objc_msgSend_styleModeButton(self, v27, v28);
  objc_msgSend_setEnabled_(v29, v30, 0);

  v33 = objc_msgSend_styleModeButton(self, v31, v32);
  v35 = v33;
  if (v20 == 2) {
    v36 = @"light";
  }
  else {
    v36 = @"dark";
  }
  objc_msgSend_setUseAlternateBackground_(v33, v34, v20 == 2);

  v39 = objc_msgSend_styleModeButton(self, v37, v38);
  objc_msgSend_setGlyphState_(v39, v40, (uint64_t)v36);

  v43 = objc_msgSend_styleModeButton(self, v41, v42);
  uint64_t v45 = objc_msgSend__subtitleForUserInterfaceStyle_nextTransition_(self, v44, v20, v26);
  objc_msgSend_setSubtitle_(v43, v46, (uint64_t)v45);

  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_2406425A8;
  v48[3] = &unk_2650CA3C0;
  v48[4] = self;
  objc_msgSend__getBlueLightStatus_(self, v47, (uint64_t)v48);
}

- (void)_toggleStyleMode
{
  uint64_t v4 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], a2, v2);
  objc_msgSend_toggleCurrentStyle(v4, v5, v6);

  objc_msgSend__updateState(self, v7, v8);
}

- (BOOL)_toggleNightShift
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240642758;
  v3[3] = &unk_2650CA3C0;
  v3[4] = self;
  objc_msgSend__getBlueLightStatus_(self, a2, (uint64_t)v3);
  return 1;
}

- (void)_toggleTrueTone
{
  int Enabled = objc_msgSend_getEnabled(self->_trueToneClient, a2, v2);
  objc_msgSend_setEnabled_(self->_trueToneClient, v5, Enabled ^ 1u);

  objc_msgSend__updateState(self, v6, v7);
}

- (void)_getBlueLightStatus:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  if (objc_msgSend_getBlueLightStatus_(self->_nightShiftClient, v5, (uint64_t)&v9))
  {
    uint64_t v6 = (void (*)(void *, _OWORD *))v4[2];
    v7[0] = v9;
    v7[1] = v10;
    uint64_t v8 = v11;
    v6(v4, v7);
  }
}

- (void)_setNightShiftEnabled:(BOOL)a3
{
}

- (id)_alertControllerForDisablingAccessibilityScreenFilter:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  id v44 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  long long v10 = objc_msgSend_bundleForClass_(v7, v9, v8);
  uint64_t v12 = objc_msgSend_localizedStringForKey_value_table_(v10, v11, @"CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_TITLE", &stru_26F4C34A8, 0);
  int v13 = (void *)MEMORY[0x263F086E0];
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
  v18 = objc_msgSend_localizedStringForKey_value_table_(v16, v17, @"CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_MESSAGE", &stru_26F4C34A8, 0);
  uint64_t v20 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(v6, v19, (uint64_t)v12, v18, 1);

  v21 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v22 = (void *)MEMORY[0x263F086E0];
  uint64_t v23 = objc_opt_class();
  uint64_t v25 = objc_msgSend_bundleForClass_(v22, v24, v23);
  v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, @"CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_ENABLE", &stru_26F4C34A8, 0);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_240642D60;
  v47[3] = &unk_2650CA410;
  id v48 = v5;
  id v28 = v5;
  v30 = objc_msgSend_actionWithTitle_style_handler_(v21, v29, (uint64_t)v27, 0, v47);
  objc_msgSend_addAction_(v20, v31, (uint64_t)v30);

  uint64_t v32 = (void *)MEMORY[0x263F1C3F0];
  v33 = (void *)MEMORY[0x263F086E0];
  uint64_t v34 = objc_opt_class();
  v36 = objc_msgSend_bundleForClass_(v33, v35, v34);
  uint64_t v38 = objc_msgSend_localizedStringForKey_value_table_(v36, v37, @"CONTROL_CENTER_NIGHT_SHIFT_DISABLE_ACCESSIBILITY_SCREEN_FILTERS_CANCEL", &stru_26F4C34A8, 0);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_240642DB0;
  v45[3] = &unk_2650CA410;
  id v46 = v44;
  id v39 = v44;
  v41 = objc_msgSend_actionWithTitle_style_handler_(v32, v40, (uint64_t)v38, 1, v45);
  objc_msgSend_addAction_(v20, v42, (uint64_t)v41);

  return v20;
}

- (id)_subtitleForBlueLightStatus:(id *)a3
{
  int var3 = a3->var3;
  if (var3 == 1)
  {
    BOOL var1 = a3->var1;
    uint64_t v22 = (void *)MEMORY[0x263F086E0];
    uint64_t v23 = objc_opt_class();
    uint64_t v7 = objc_msgSend_bundleForClass_(v22, v24, v23);
    if (var1) {
      objc_msgSend_localizedStringForKey_value_table_(v7, v25, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_ON_UNTIL_SUNRISE", &stru_26F4C34A8, 0);
    }
    else {
      objc_msgSend_localizedStringForKey_value_table_(v7, v25, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_OFF_UNTIL_SUNSET", &stru_26F4C34A8, 0);
    }
    goto LABEL_12;
  }
  if (var3 != 2)
  {
    BOOL v26 = a3->var1;
    v27 = (void *)MEMORY[0x263F086E0];
    uint64_t v28 = objc_opt_class();
    uint64_t v7 = objc_msgSend_bundleForClass_(v27, v29, v28);
    if (v26) {
      objc_msgSend_localizedStringForKey_value_table_(v7, v30, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_ON_MANUAL", &stru_26F4C34A8, 0);
    }
    else {
      objc_msgSend_localizedStringForKey_value_table_(v7, v30, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_OFF_MANUAL", &stru_26F4C34A8, 0);
    }
    uint64_t v20 = LABEL_12:;
    goto LABEL_13;
  }
  uint64_t v5 = 16;
  if (!a3->var1) {
    uint64_t v5 = 8;
  }
  uint64_t v6 = *(void *)(&a3->var0 + v5);
  uint64_t v7 = objc_msgSend__subtitleFormatStringForBlueLightEnabled_transitionTime_(self, a2, a3->var1, v6);
  uint64_t v8 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_bundleForClass_(v8, v10, v9);
  int v13 = objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)v7, &stru_26F4C34A8, 0);

  uint64_t v14 = NSString;
  uint64_t v16 = objc_msgSend__formattedHourForTransitionTime_(self, v15, v6);
  v18 = objc_msgSend__timeStringForBlueLightTransitionTime_(self, v17, v6);
  uint64_t v20 = objc_msgSend_stringWithFormat_(v14, v19, (uint64_t)v13, v16, v18);

LABEL_13:

  return v20;
}

- (id)_timeStringForBlueLightTransitionTime:(id)a3
{
  return (id)objc_msgSend__timeStringForHour_minute_(self, a2, a3.var0, a3.var1);
}

- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
  objc_msgSend_setHour_(v7, v8, a3);
  objc_msgSend_setMinute_(v7, v9, a4);
  uint64_t v12 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v10, v11);
  objc_msgSend_setCalendar_(v7, v13, (uint64_t)v12);

  v15 = objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x263EFFA18], v14, 0);
  objc_msgSend_setTimeZone_(v7, v16, (uint64_t)v15);

  uint64_t v19 = objc_msgSend__timeFormatter(self, v17, v18);
  uint64_t v22 = objc_msgSend_date(v7, v20, v21);
  v24 = objc_msgSend_stringFromDate_(v19, v23, (uint64_t)v22);

  return v24;
}

- (id)_subtitleFormatStringForBlueLightEnabled:(BOOL)a3 transitionTime:(id)a4
{
  if (a3) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_%@_UNTIL_FORMAT", a4, @"ON");
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"CONTROL_CENTER_STATUS_NIGHT_SHIFT_%@_UNTIL_FORMAT", a4, @"OFF");
  }
}

- (unint64_t)_formattedHourForTransitionTime:(id)a3
{
  return objc_msgSend__formattedHourForHour_(self, a2, a3.var0);
}

- (unint64_t)_formattedHourForHour:(unint64_t)a3
{
  int v4 = objc_msgSend__uses24HourTime(self, a2, a3);
  if (a3 < 0xD) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  if (v5) {
    return a3;
  }
  else {
    return a3 - 12;
  }
}

- (BOOL)_uses24HourTime
{
  v3 = objc_msgSend__timeFormatter(self, a2, v2);
  uint64_t v6 = objc_msgSend_dateFormat(v3, v4, v5);

  BOOL v9 = objc_msgSend_rangeOfString_(v6, v7, @"H") != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend_rangeOfString_(v6, v8, @"k") != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)_timeFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDateStyle_(v2, v3, 0);
  objc_msgSend_setTimeStyle_(v2, v4, 1);
  id v7 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v5, v6);
  objc_msgSend_setLocale_(v2, v8, (uint64_t)v7);

  long long v10 = objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x263EFFA18], v9, 0);
  objc_msgSend_setTimeZone_(v2, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v12, v13);
  objc_msgSend_setCalendar_(v2, v15, (uint64_t)v14);

  return v2;
}

- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4
{
  id v6 = a4;
  BOOL v9 = v6;
  if (v6 && (unint64_t v10 = objc_msgSend_type(v6, v7, v8), v10 <= 2)) {
    uint64_t v11 = off_2650CA430[v10];
  }
  else {
    uint64_t v11 = @"_MANUAL";
  }
  if (a3 == 2) {
    objc_msgSend_stringByAppendingString_(@"CONTROL_CENTER_STATUS_STYLE_MODE", v7, @"_DARK");
  }
  else {
  uint64_t v12 = objc_msgSend_stringByAppendingString_(@"CONTROL_CENTER_STATUS_STYLE_MODE", v7, @"_LIGHT");
  }
  uint64_t v14 = objc_msgSend_stringByAppendingString_(v12, v13, (uint64_t)v11);

  v15 = (void *)MEMORY[0x263F086E0];
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = objc_msgSend_bundleForClass_(v15, v17, v16);
  uint64_t v20 = objc_msgSend_localizedStringForKey_value_table_(v18, v19, (uint64_t)v14, &stru_26F4C34A8, 0);

  if (objc_msgSend_type(v9, v21, v22))
  {
    id v25 = v20;
  }
  else
  {
    BOOL v26 = NSString;
    uint64_t v27 = objc_msgSend_hour(v9, v23, v24);
    uint64_t v29 = objc_msgSend__formattedHourForHour_(self, v28, v27);
    uint64_t v32 = objc_msgSend_hour(v9, v30, v31);
    uint64_t v35 = objc_msgSend_minute(v9, v33, v34);
    v37 = objc_msgSend__timeStringForHour_minute_(self, v36, v32, v35);
    objc_msgSend_stringWithFormat_(v26, v38, (uint64_t)v20, v29, v37);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_subtitleForTrueToneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  BOOL v9 = v7;
  if (v3) {
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_TRUE_TONE_ON", &stru_26F4C34A8, 0);
  }
  else {
  unint64_t v10 = objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_TRUE_TONE_OFF", &stru_26F4C34A8, 0);
  }

  return v10;
}

- (CCUILabeledRoundButtonViewController)styleModeButton
{
  return self->_styleModeButton;
}

- (void)setStyleModeButton:(id)a3
{
}

- (CCUILabeledRoundButtonViewController)nightShiftButton
{
  return self->_nightShiftButton;
}

- (void)setNightShiftButton:(id)a3
{
}

- (CCUILabeledRoundButtonViewController)trueToneButton
{
  return self->_trueToneButton;
}

- (void)setTrueToneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueToneButton, 0);
  objc_storeStrong((id *)&self->_nightShiftButton, 0);
  objc_storeStrong((id *)&self->_styleModeButton, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_presentedAlertController, 0);
  objc_storeStrong((id *)&self->_nightShiftClient, 0);
  objc_storeStrong((id *)&self->_trueToneClient, 0);

  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end