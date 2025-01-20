@interface AXCCShortcutModuleViewController
- (AXCCShortcutModuleViewControllerDelegate)shortcutDelegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasScreenSwitch;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)switchControlRendersDeviceUnusable;
- (CCUIToggleModule)module;
- (id)_menuItemForOption:(id)a3;
- (id)_menuItemOpenAccessibilityShortcutSettings;
- (id)_titlesForVisibleShortcuts;
- (id)contentModuleContext;
- (id)visibleShortcuts;
- (void)_toggleOption:(int64_t)a3;
- (void)_updateShortcutActions;
- (void)_updateShortcutActions:(BOOL)a3;
- (void)_updateShortcutActionsIfVisible;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dealloc;
- (void)setContentModuleContext:(id)a3;
- (void)setModule:(id)a3;
- (void)setShortcutDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation AXCCShortcutModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v56.receiver = self;
  v56.super_class = (Class)AXCCShortcutModuleViewController;
  [(CCUIMenuModuleViewController *)&v56 viewDidLoad];
  self->_suppressGuidedAccess = 1;
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = objc_msgSend_imageNamed_inBundle_(MEMORY[0x263F1C6B0], v7, @"AccessibilityIcon", v6);
  objc_msgSend_setGlyphImage_(self, v9, (uint64_t)v8);
  if (AXIsInternalInstall() && (AXCurrentRootLooksLikeBNI() & 1) == 0)
  {
    v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = AXCurrentRootDescription();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_2405F8000, v12, OS_LOG_TYPE_DEFAULT, "This device is running with an Accessibility root: %@", (uint8_t *)&buf, 0xCu);
    }
    v14 = NSString;
    v10 = sub_2405F9B4C(@"ask.sheet.title");
    v15 = AXCurrentRootDescription();
    v17 = objc_msgSend_stringWithFormat_(v14, v16, @"%@\nInternal Only:\n %@", v10, v15);
    objc_msgSend_setTitle_(self, v18, (uint64_t)v17);
  }
  else
  {
    v10 = sub_2405F9B4C(@"ask.sheet.title");
    objc_msgSend_setTitle_(self, v11, (uint64_t)v10);
  }

  objc_msgSend__updateShortcutActions(self, v19, v20);
  uint64_t v21 = *MEMORY[0x263F8B138];
  v62[0] = *MEMORY[0x263F8B130];
  v62[1] = v21;
  uint64_t v22 = *MEMORY[0x263F8B3F0];
  v62[2] = *MEMORY[0x263F8B2C8];
  v62[3] = v22;
  uint64_t v23 = *MEMORY[0x263F8B358];
  v62[4] = *MEMORY[0x263F8B458];
  v62[5] = v23;
  uint64_t v24 = *MEMORY[0x263F8B3B8];
  v62[6] = *MEMORY[0x263F8B1A8];
  v62[7] = v24;
  uint64_t v25 = *MEMORY[0x263F8B1B8];
  v62[8] = *MEMORY[0x263F8B178];
  v62[9] = v25;
  uint64_t v26 = *MEMORY[0x263F8B188];
  v62[10] = *MEMORY[0x263F8B350];
  v62[11] = v26;
  uint64_t v27 = *MEMORY[0x263F8B2F0];
  v62[12] = *MEMORY[0x263F8B318];
  v62[13] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v28, (uint64_t)v62, 14);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v52, v61, 16);
  if (v31)
  {
    uint64_t v32 = *(void *)v53;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(v29);
        }
        CFStringRef v34 = *(const __CFString **)(*((void *)&v52 + 1) + 8 * v33);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_2405F9BE0, v34, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v52, v61, 16);
    }
    while (v31);
  }

  objc_initWeak(&location, self);
  v39 = objc_msgSend_sharedInstance(MEMORY[0x263F22938], v37, v38);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_2405F9BE8;
  v49[3] = &unk_2650C6AA0;
  objc_copyWeak(&v50, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v39, v40, (uint64_t)v49, sel_touchAccommodationsEnabled, self);

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2050000000;
  v41 = (void *)qword_268C8AF38;
  uint64_t v60 = qword_268C8AF38;
  if (!qword_268C8AF38)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v64 = sub_2405FAA20;
    v65 = &unk_2650C6B90;
    v66 = &v57;
    sub_2405FAA20((uint64_t)&buf);
    v41 = (void *)v58[3];
  }
  id v42 = v41;
  _Block_object_dispose(&v57, 8);
  v45 = objc_msgSend_sharedInstance(v42, v43, v44);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_2405F9C28;
  v47[3] = &unk_2650C6AA0;
  objc_copyWeak(&v48, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v45, v46, (uint64_t)v47, sel_comfortSoundsEnabled, self);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXCCShortcutModuleViewController;
  [(AXCCShortcutModuleViewController *)&v4 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2405F9D78;
  v10[3] = &unk_2650C6AC8;
  v10[4] = self;
  id v7 = a4;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v10, 0);
  v9.receiver = self;
  v9.super_class = (Class)AXCCShortcutModuleViewController;
  -[CCUIMenuModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)_updateShortcutActions
{
}

- (void)_updateShortcutActionsIfVisible
{
}

- (void)_updateShortcutActions:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_moduleNeedsLiveUpdates || a3)
  {
    v5 = objc_msgSend_visibleShortcuts(self, a2, a3);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (objc_msgSend_count(v5, v7, v8))
    {
      objc_msgSend_setIndentation_(self, v9, 2);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v5;
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v32, 16);
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v10);
            }
            v17 = objc_msgSend__menuItemForOption_(self, v13, *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
            objc_msgSend_addObject_(v6, v18, (uint64_t)v17);
          }
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v32, 16);
        }
        while (v14);
      }
    }
    else
    {
      objc_msgSend_setIndentation_(self, v9, 0);
      objc_msgSend__menuItemOpenAccessibilityShortcutSettings(self, v19, v20);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v6, v21, (uint64_t)v10);
    }

    objc_msgSend_setMenuItems_(self, v22, (uint64_t)v6);
    uint64_t v25 = objc_msgSend_shortcutDelegate(self, v23, v24);
    objc_msgSend_optionToggled(v25, v26, v27);
  }
}

- (id)_menuItemOpenAccessibilityShortcutSettings
{
  objc_initWeak(&location, self);
  v2 = sub_2405F9B4C(@"open.settings.accessibility.shortcuts");
  id v3 = objc_alloc(MEMORY[0x263F33CC0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2405FA064;
  v7[3] = &unk_2650C6AF0;
  objc_copyWeak(&v8, &location);
  v5 = objc_msgSend_initWithTitle_identifier_handler_(v3, v4, (uint64_t)v2, v2, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

- (id)_menuItemForOption:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F229B8];
  uint64_t v8 = objc_msgSend_intValue(v4, v6, v7);
  id v10 = objc_msgSend_titleForTripleClickOption_(v5, v9, v8);
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x263F33CC0]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2405FA21C;
  v23[3] = &unk_2650C6B18;
  objc_copyWeak(&v25, &location);
  id v12 = v4;
  id v24 = v12;
  uint64_t v14 = objc_msgSend_initWithTitle_identifier_handler_(v11, v13, (uint64_t)v10, v10, v23);
  uint64_t v15 = (void *)MEMORY[0x263F229B8];
  uint64_t v18 = objc_msgSend_intValue(v12, v16, v17);
  uint64_t v20 = objc_msgSend_valueForTripleClickOption_(v15, v19, v18);
  objc_msgSend_setSelected_(v14, v21, v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v14;
}

- (id)visibleShortcuts
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F229B8], sel_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess_, !self->_suppressGuidedAccess);
}

- (id)_titlesForVisibleShortcuts
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  uint64_t v7 = objc_msgSend_visibleShortcuts(self, v5, v6);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, v25, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = (void *)MEMORY[0x263F229B8];
        uint64_t v16 = objc_msgSend_intValue(*(void **)(*((void *)&v21 + 1) + 8 * i), v10, v11);
        uint64_t v18 = objc_msgSend_titleForTripleClickOption_(v15, v17, v16);
        objc_msgSend_addObject_(v4, v19, (uint64_t)v18);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, v25, 16);
    }
    while (v12);
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXCCShortcutModuleViewController;
  [(CCUIMenuModuleViewController *)&v6 viewWillAppear:a3];
  self->_moduleNeedsLiveUpdates = 1;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2405FA560;
  block[3] = &unk_2650C6B40;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXCCShortcutModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidDisappear:a3];
  self->_moduleNeedsLiveUpdates = 0;
}

- (void)_toggleOption:(int64_t)a3
{
  objc_msgSend_toggleTripleClickOption_(MEMORY[0x263F229B8], a2, a3);
  objc_msgSend_shortcutDelegate(self, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optionToggled(v8, v6, v7);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXCCShortcutModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v12, sel_willTransitionToExpandedContentMode_);
  if (v3)
  {
    objc_msgSend_setSelected_(self, v5, 0);
  }
  else
  {
    uint64_t v7 = objc_msgSend_module(self, v5, v6);
    uint64_t isSelected = objc_msgSend_isSelected(v7, v8, v9);
    objc_msgSend_setSelected_(self, v11, isSelected);
  }
}

- (BOOL)switchControlRendersDeviceUnusable
{
  return 0;
}

- (BOOL)_hasScreenSwitch
{
  BOOL v3 = objc_msgSend_sharedInstance(MEMORY[0x263F22938], a2, v2);
  uint64_t v6 = objc_msgSend_assistiveTouchSwitches(v3, v4, v5);
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2405FA840;
  v10[3] = &unk_2650C6B68;
  v10[4] = &v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)v10);
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 1;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  objc_msgSend_shortcutDelegate(self, a2, (uint64_t)a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandModule(v6, v4, v5);
}

- (id)contentModuleContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);

  return WeakRetained;
}

- (void)setContentModuleContext:(id)a3
{
}

- (CCUIToggleModule)module
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);

  return (CCUIToggleModule *)WeakRetained;
}

- (void)setModule:(id)a3
{
}

- (AXCCShortcutModuleViewControllerDelegate)shortcutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcutDelegate);

  return (AXCCShortcutModuleViewControllerDelegate *)WeakRetained;
}

- (void)setShortcutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortcutDelegate);
  objc_destroyWeak((id *)&self->_module);

  objc_destroyWeak((id *)&self->_contentModuleContext);
}

@end