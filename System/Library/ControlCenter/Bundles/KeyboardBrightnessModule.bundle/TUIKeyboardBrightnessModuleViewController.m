@interface TUIKeyboardBrightnessModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isHardwareKeyboardAvailable;
- (TUIKeyboardBrightnessModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)createSliderView;
- (id)sliderView;
- (void)dealloc;
- (void)sliderEditingDidEnd:(id)a3;
- (void)sliderValueDidChange:(id)a3;
- (void)suspendIdleDimming:(BOOL)a3;
- (void)updateControls;
- (void)updateControlsForValue:(float)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TUIKeyboardBrightnessModuleViewController

- (TUIKeyboardBrightnessModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  v4 = [(CCUIButtonModuleViewController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend_stringWithUTF8String_(NSString, v6, *MEMORY[0x263F41D48], v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_2406872B4, v9, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend_stringWithUTF8String_(NSString, v4, *MEMORY[0x263F41D48], v5, v6);
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v7, 0);

  objc_msgSend_suspendIdleDimming_(self, v8, 0, v9, v10);
  objc_msgSend_unregisterKeyboardNotificationBlock(self->_keyboardBrightnessClient, v11, v12, v13, v14);
  v15.receiver = self;
  v15.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  [(TUIKeyboardBrightnessModuleViewController *)&v15 dealloc];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v28 viewDidLoad];
  objc_msgSend_setSelected_(self, v3, 1, v4, v5);
  uint64_t v10 = objc_msgSend_sliderView(self, v6, v7, v8, v9);
  objc_msgSend_addTarget_action_forControlEvents_(v10, v11, (uint64_t)self, (uint64_t)sel_sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(v10, v12, (uint64_t)self, (uint64_t)sel_sliderEditingDidEnd_, 0x40000);
  uint64_t v13 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x263F34258]);
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  self->_keyboardBrightnessClient = v13;

  objc_initWeak(&location, self);
  objc_super v15 = self->_keyboardBrightnessClient;
  uint64_t v16 = *MEMORY[0x263F34260];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = sub_2406874D4;
  v25 = &unk_2650CDA90;
  objc_copyWeak(&v26, &location);
  objc_msgSend_registerNotificationForKeys_keyboardID_block_(v15, v17, (uint64_t)&unk_26F4CC870, v16, (uint64_t)&v22);
  objc_msgSend_updateControls(self, v18, v19, v20, v21, v22, v23, v24, v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  [(TUIKeyboardBrightnessModuleViewController *)&v7 viewWillAppear:a3];
  objc_msgSend_suspendIdleDimming_(self, v4, 1, v5, v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  [(TUIKeyboardBrightnessModuleViewController *)&v7 viewDidDisappear:a3];
  objc_msgSend_suspendIdleDimming_(self, v4, 0, v5, v6);
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v7 viewWillLayoutSubviews];
  objc_msgSend_updateControls(self, v3, v4, v5, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sliderView
{
  v4.receiver = self;
  v4.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  v2 = [(CCUISliderButtonModuleViewController *)&v4 sliderView];

  return v2;
}

- (id)createSliderView
{
  id v3 = objc_alloc(MEMORY[0x263F33C90]);
  uint64_t v8 = objc_msgSend_view(self, v4, v5, v6, v7);
  objc_msgSend_bounds(v8, v9, v10, v11, v12);
  v17 = objc_msgSend_initWithFrame_(v3, v13, v14, v15, v16);

  return v17;
}

- (void)suspendIdleDimming:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    keyboardBrightnessClient = self->_keyboardBrightnessClient;
    uint64_t v7 = *MEMORY[0x263F34260];
    MEMORY[0x270F9A6D0](keyboardBrightnessClient, sel_suspendIdleDimming_forKeyboard_, v3, v7, v5);
  }
}

- (void)sliderValueDidChange:(id)a3
{
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  objc_msgSend_value(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v6 = *MEMORY[0x263F34260];

  MEMORY[0x270F9A6D0](keyboardBrightnessClient, sel_setBrightness_fadeSpeed_commit_forKeyboard_, 0, 0, v6);
}

- (void)sliderEditingDidEnd:(id)a3
{
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  objc_msgSend_value(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v6 = *MEMORY[0x263F34260];

  MEMORY[0x270F9A6D0](keyboardBrightnessClient, sel_setBrightness_fadeSpeed_commit_forKeyboard_, 0, 1, v6);
}

- (void)updateControls
{
  objc_msgSend_brightnessForKeyboard_(self->_keyboardBrightnessClient, a2, *MEMORY[0x263F34260], v2, v3);

  objc_msgSend_updateControlsForValue_animated_(self, v5, 0, v6, v7);
}

- (void)updateControlsForValue:(float)a3 animated:(BOOL)a4
{
  BOOL v6 = a4;
  uint64_t isHardwareKeyboardAvailable = objc_msgSend_isHardwareKeyboardAvailable(self, a2, a4, v4, v5);
  uint64_t v14 = objc_msgSend_buttonView(self, v10, v11, v12, v13);
  objc_msgSend_setEnabled_(v14, v15, isHardwareKeyboardAvailable, v16, v17);

  if (isHardwareKeyboardAvailable)
  {
    objc_msgSend_sliderView(self, v18, v19, v20, v21);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t isBacklightSaturatedOnKeyboard = objc_msgSend_isBacklightSaturatedOnKeyboard_(self->_keyboardBrightnessClient, v22, *MEMORY[0x263F34260], v23, v24);
    objc_msgSend_setInoperative_(v46, v26, isBacklightSaturatedOnKeyboard, v27, v28);
    *(float *)&double v29 = a3;
    objc_msgSend_setValue_animated_(v46, v30, v6, v31, v32, v29);
    objc_msgSend_setSelected_(self, v33, a3 > 0.0, v34, v35);
  }
  else
  {
    objc_msgSend_setSelected_(self, v18, 0, v20, v21);
    if (!objc_msgSend_isExpanded(self, v36, v37, v38, v39)) {
      return;
    }
    objc_msgSend_presentingViewController(self, v40, v41, v42, v43);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dismissViewControllerAnimated_completion_(v46, v44, 1, 0, v45);
  }
}

- (BOOL)isHardwareKeyboardAvailable
{
  uint64_t v5 = objc_msgSend_copyKeyboardBacklightIDs(self->_keyboardBrightnessClient, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_count(v5, v6, v7, v8, v9);

  return v10 >= 1 && GSEventIsHardwareKeyboardAttached() != 0;
}

- (void).cxx_destruct
{
}

@end