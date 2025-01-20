@interface CCUIConnectivityCellularDataViewController
+ (BOOL)isSupported;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCellularDataButtonDemoMode;
- (BOOL)_isCellularDataRestricted;
- (BOOL)_multipleSubscriptionsAvailable;
- (BOOL)_toggleState;
- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3;
- (CCUIConnectivityCellularDataViewController)init;
- (id)_debugDescriptionForState:(BOOL)a3;
- (id)displayName;
- (id)identifier;
- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3;
- (id)subtitleText;
- (void)_updateState;
- (void)buttonTapped:(id)a3;
- (void)containerWillTransitionToExpandedContentMode:(BOOL)a3;
- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4;
- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)presentMenuModule;
- (void)startObservingStateChanges;
- (void)stopObservingStateChanges;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUIConnectivityCellularDataViewController

- (void)_updateState
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = (const void *)_CTServerConnectionCreateWithIdentifier();
  if (v5)
  {
    _CTServerConnectionGetCellularDataSettings();
    CFRelease(v5);
    v5 = 0;
  }
  if ((objc_msgSend__isCellularDataButtonDemoMode(self, v3, v4) & 1) == 0) {
    objc_msgSend_setEnabled_(self, v6, (uint64_t)v5);
  }
  v8 = objc_msgSend_subtitleText(self, v6, v7);
  objc_msgSend_setInoperative_(self, v9, 1);
  objc_msgSend_setSubtitle_(self, v10, (uint64_t)v8);
  v11 = (void *)*MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v14 = objc_msgSend__debugDescriptionForState_(self, v13, (uint64_t)v5);
    *(_DWORD *)buf = 138544387;
    v16 = v14;
    __int16 v17 = 1024;
    int v18 = 0;
    __int16 v19 = 1024;
    int v20 = 0;
    __int16 v21 = 1024;
    int v22 = 0;
    __int16 v23 = 2113;
    v24 = v8;
    _os_log_impl(&dword_24062E000, v12, OS_LOG_TYPE_DEFAULT, "Cellular Data state updated to %{public}@ [ capable: %d enabled: %d airplaneMode: %d subtitle: %{private}@ ]", buf, 0x28u);
  }
}

- (CCUIConnectivityCellularDataViewController)init
{
  v3 = objc_msgSend_glyphImageWithName_pointSize_(CCUIConnectivityButtonViewController, a2, @"cellularbars", 18.0);
  v6 = objc_msgSend_systemGreenColor(MEMORY[0x263F1C550], v4, v5);
  v13.receiver = self;
  v13.super_class = (Class)CCUIConnectivityCellularDataViewController;
  uint64_t v7 = [(CCUIConnectivityButtonViewController *)&v13 initWithGlyphImage:v3 highlightColor:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v10 = objc_msgSend_initWithQueue_(v8, v9, MEMORY[0x263EF83A0]);
    coreTelephonyClient = v7->_coreTelephonyClient;
    v7->_coreTelephonyClient = (CoreTelephonyClient *)v10;
  }
  return v7;
}

- (id)displayName
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_bundleForClass_(v2, v4, v3);
  uint64_t v7 = objc_msgSend_localizedStringForKey_value_table_(v5, v6, @"CONTROL_CENTER_STATUS_CELLULAR_DATA_NAME", &stru_26F4C07A8, 0);

  return v7;
}

- (id)identifier
{
  return @"com.apple.ControlCenter.CellularData";
}

- (id)subtitleText
{
  int isEnabled = objc_msgSend_isEnabled(self, a2, v2);
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  v9 = v7;
  if (isEnabled) {
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_CELLULAR_DATA_ON", &stru_26F4C07A8, 0);
  }
  else {
  uint64_t v10 = objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_CELLULAR_DATA_OFF", &stru_26F4C07A8, 0);
  }

  return v10;
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  objc_msgSend__toggleState(self, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  [(CCUIConnectivityButtonViewController *)&v7 buttonTapped:v4];
}

+ (BOOL)isSupported
{
  return MEMORY[0x270F95FB8](@"cellular-data", a2);
}

- (void)containerWillTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCUIConnectivityCellularDataViewController;
  -[CCUIConnectivityButtonViewController containerWillTransitionToExpandedContentMode:](&v15, sel_containerWillTransitionToExpandedContentMode_);
  if (v3)
  {
    id v6 = objc_alloc(MEMORY[0x263F33C80]);
    id v8 = (CCUIContentModuleDetailClickPresentationInteractionManager *)objc_msgSend_initWithPresentingViewController_delegate_(v6, v7, (uint64_t)self, self);
    clickPresentationInteractionManager = self->_clickPresentationInteractionManager;
    self->_clickPresentationInteractionManager = v8;

    uint64_t v10 = self->_clickPresentationInteractionManager;
    objc_super v13 = objc_msgSend_templateView(self, v11, v12);
    objc_msgSend_setViewForInteraction_(v10, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setViewForInteraction_(self->_clickPresentationInteractionManager, v5, 0);
    objc_super v13 = self->_clickPresentationInteractionManager;
    self->_clickPresentationInteractionManager = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityCellularDataViewController;
  [(CCUIConnectivityCellularDataViewController *)&v8 viewWillAppear:a3];
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityCellularDataViewController;
  [(CCUIConnectivityCellularDataViewController *)&v6 viewWillDisappear:a3];
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_toggleState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_msgSend__isCellularDataButtonDemoMode(self, a2, v2))
  {
    int isEnabled = objc_msgSend_isEnabled(self, v4, v5);
    objc_msgSend_setEnabled_(self, v7, isEnabled ^ 1u);
  }
  else
  {
    _CTServerConnectionCreateWithIdentifier();
    _CTServerConnectionGetCellularDataIsEnabled();
    uint64_t v10 = (void *)*MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v13 = objc_msgSend__debugDescriptionForState_(self, v12, 0);
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_24062E000, v11, OS_LOG_TYPE_DEFAULT, "Toggle Cellular Data state from %{public}@", buf, 0xCu);
    }
    _CTServerConnectionSetCellularDataIsEnabled();
  }
  objc_msgSend__updateState(self, v8, v9);
  return 1;
}

- (BOOL)_isCellularDataRestricted
{
  BOOL v3 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], a2, v2);
  BOOL v5 = objc_msgSend_effectiveBoolValueForSetting_(v3, v4, *MEMORY[0x263F53748]) == 2;

  return v5;
}

- (BOOL)_isCellularDataButtonDemoMode
{
  int v2 = CCSIsInternalInstall();
  if (v2)
  {
    BOOL v5 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v3, v4);
    char v7 = objc_msgSend_BOOLForKey_(v5, v6, @"ControlCenterCellularDataButtonDemoMode");

    LOBYTE(v2) = v7;
  }
  return v2;
}

- (BOOL)_multipleSubscriptionsAvailable
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v25 = 0;
  uint64_t v4 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, a2, (uint64_t)&v25);
  id v7 = v25;
  if (v7)
  {
    objc_super v8 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_ERROR)) {
      sub_240636E10((uint64_t)v7, v8);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = objc_msgSend_subscriptionsInUse(v4, v5, v6, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, v26, 16);
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v9);
        }
        v14 += objc_msgSend_isSimHidden(*(void **)(*((void *)&v21 + 1) + 8 * i), v11, v12) ^ 1;
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v21, v26, 16);
    }
    while (v13);
    uint64_t v13 = v14 > 1;
  }

  char isEnabled = objc_msgSend_isEnabled(self, v17, v18);
  return isEnabled & v13;
}

- (void)startObservingStateChanges
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  [(CCUIConnectivityButtonViewController *)&v7 startObservingStateChanges];
  BOOL v5 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v3, v4);
  objc_msgSend_registerObserver_(v5, v6, (uint64_t)self);
}

- (void)stopObservingStateChanges
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityCellularDataViewController;
  [(CCUIConnectivityButtonViewController *)&v7 stopObservingStateChanges];
  BOOL v5 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v3, v4);
  objc_msgSend_unregisterObserver_(v5, v6, (uint64_t)self);
}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3) {
    return @"on";
  }
  else {
    return @"off";
  }
}

- (id)presentedViewControllerForContentModuleDetailClickPresentationInteractionController:(id)a3
{
  if (objc_msgSend__multipleSubscriptionsAvailable(self, a2, (uint64_t)a3))
  {
    uint64_t v4 = objc_alloc_init(CCUIConnectivityCellularModuleViewController);
    objc_super v7 = objc_msgSend_contentModuleContext(self, v5, v6);
    objc_msgSend_setContentModuleContext_(v4, v8, (uint64_t)v7);

    v11 = objc_msgSend_displayName(self, v9, v10);
    objc_msgSend_setTitle_(v4, v12, (uint64_t)v11);

    objc_msgSend_setModalPresentationStyle_(v4, v13, 4);
    self->_presentingMenuViewController = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = objc_msgSend_contentModuleContext(self, v5, v6);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2406342C0;
    v10[3] = &unk_2650C9420;
    id v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);
  }
}

- (void)contentModuleDetailClickPresentationInteractionControllerInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  self->_presentingMenuViewController = 0;
}

- (void)presentMenuModule
{
  objc_msgSend_presentViewController(self->_clickPresentationInteractionManager, a2, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);

  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end