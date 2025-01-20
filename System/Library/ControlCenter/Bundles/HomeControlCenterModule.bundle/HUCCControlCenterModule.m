@interface HUCCControlCenterModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3;
- (BOOL)isDeviceUnlockedForSmartGridContentViewController:(id)a3;
- (CCUIContentModuleContentViewController)viewController;
- (CCUIContentModuleContext)contentModuleContext;
- (HUCCControlCenterModule)init;
- (HUCCLockStateHandler)lockStateHandler;
- (NACancelable)characteristicRegistrationScheduledCancelation;
- (NSString)moduleDescription;
- (id)characteristicRegistrationObject;
- (id)characteristicsToEnableNotificationsForItems:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (id)homeKitActiveAssertion;
- (id)homeKitActiveAssertionReason;
- (unint64_t)supportedGridSizeClasses;
- (void)cancelRegistration:(id)a3;
- (void)cancelScheduledCharacteristicDeregistration;
- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4;
- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4;
- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4;
- (void)dealloc;
- (void)endHomeKitActiveAssertion;
- (void)launchHomeAppForControlCenterModuleViewController:(id)a3;
- (void)launchHomeAppForSmartGridContentViewController:(id)a3;
- (void)lockStateWasUpdated:(BOOL)a3;
- (void)registerForAnalytics;
- (void)registerForCharacteristics:(NSSet *)a3 items:(NSSet *)a4 inHome:(HMHome *)a5 currentRegistration:(id)a6 completionBlock:(id)a7;
- (void)scheduleCharacteristicDeregistration;
- (void)setCharacteristicRegistrationObject:(id)a3;
- (void)setCharacteristicRegistrationScheduledCancelation:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setHomeKitActiveAssertion:(id)a3;
- (void)setLockStateHandler:(id)a3;
- (void)setViewController:(id)a3;
- (void)setupHomeKitActiveAssertionIfNeeded;
- (void)smartGridContentViewController:(id)a3 viewDidDisappear:(BOOL)a4;
- (void)smartGridContentViewController:(id)a3 viewWillAppear:(BOOL)a4;
@end

@implementation HUCCControlCenterModule

- (void)smartGridContentViewController:(id)a3 viewWillAppear:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = objc_msgSend_smartGridViewController(a3, a2, (uint64_t)a3, a4, 0);
  v7 = objc_msgSend_itemManager(v4, v5, v6);
  v10 = objc_msgSend_allDisplayedItems(v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v35, 16);
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        v18 = &unk_26F507260;
        if (objc_msgSend_conformsToProtocol_(v17, v19, (uint64_t)v18)) {
          v20 = v17;
        }
        else {
          v20 = 0;
        }
        id v21 = v20;

        v24 = objc_msgSend_accessories(v21, v22, v23);

        v26 = objc_msgSend_na_filter_(v24, v25, (uint64_t)&unk_26F4C8000);

        v14 += objc_msgSend_count(v26, v27, v28);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v29, (uint64_t)&v31, v35, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  HUCCUpdateRunningStateWithAppleMediaAccessories(1, v14, v30);
}

- (void)smartGridContentViewController:(id)a3 viewDidDisappear:(BOOL)a4
{
}

- (HUCCControlCenterModule)init
{
  v15.receiver = self;
  v15.super_class = (Class)HUCCControlCenterModule;
  v2 = [(HUCCControlCenterModule *)&v15 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v5 = objc_msgSend_sharedManager(MEMORY[0x263F49B30], v3, v4);
      objc_msgSend_bootstrap(v5, v6, v7);

      objc_msgSend_registerForAnalytics(v2, v8, v9);
    }
    else
    {
      HUCCPerformCommonInitialization();
    }
    v10 = [HUCCLockStateHandler alloc];
    uint64_t v12 = objc_msgSend_initWithDelegate_(v10, v11, (uint64_t)v2);
    lockStateHandler = v2->_lockStateHandler;
    v2->_lockStateHandler = (HUCCLockStateHandler *)v12;

    if (qword_26AFC7DA8[0] != -1) {
      dispatch_once(qword_26AFC7DA8, &unk_26F4C7FE0);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend_endHomeKitActiveAssertion(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)HUCCControlCenterModule;
  [(HUCCControlCenterModule *)&v4 dealloc];
}

- (unint64_t)supportedGridSizeClasses
{
  return 2040;
}

- (NSString)moduleDescription
{
  return (NSString *)MEMORY[0x270F3C4D0](@"HUControlCenterConfigurationDescription", a2);
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  v29[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_viewController(self, v5, v6);

  if (!v7)
  {
    if (_os_feature_enabled_impl())
    {
      v10 = (void *)MEMORY[0x2455F3290]();
      v11 = sub_240660D18((uint64_t)self, @"Home 2x2", 2, 2);
      uint64_t v12 = sub_240660D18((uint64_t)self, @"Home 2x2", 2, 4);
      uint64_t v13 = sub_240660D18((uint64_t)self, @"Home Page Size", 2, 6);
      v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24065C000, v14, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule will initialize: HUControlCenterModuleViewController", v28, 2u);
      }

      id v15 = objc_alloc(MEMORY[0x263F49B28]);
      v29[0] = v11;
      v29[1] = v12;
      v29[2] = v13;
      id v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v29, 3);
      v19 = objc_msgSend_initWithDelegate_ofKind_withPreviews_(v15, v18, (uint64_t)self, 0, v17);
      objc_msgSend_setViewController_(self, v20, (uint64_t)v19);
    }
    else
    {
      id v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24065C000, v21, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule will initialize: HUCCSmartGridContentViewController", v28, 2u);
      }

      v22 = [HUCCSmartGridContentViewController alloc];
      v24 = objc_msgSend_initWithDelegate_(v22, v23, (uint64_t)self);
      objc_msgSend_setViewController_(self, v25, (uint64_t)v24);
    }
  }
  v26 = objc_msgSend_viewController(self, v8, v9);

  return v26;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  id v5 = a3;
  objc_opt_class();
  v8 = objc_msgSend_viewController(self, v6, v7);
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v14 = v9;

  v10 = [HUCCOpenURLHandler alloc];
  uint64_t v12 = objc_msgSend_initWithCCModuleContext_(v10, v11, (uint64_t)v5);

  objc_msgSend_setURLHandler_(v14, v13, (uint64_t)v12);
}

- (void)lockStateWasUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_viewController(self, v5, v6);
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  objc_msgSend_setAccessAllowedForCurrentLockState_(v9, v10, v3);
  objc_opt_class();
  uint64_t v13 = objc_msgSend_viewController(self, v11, v12);
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v16 = v14;

  objc_msgSend_setAccessAllowedForCurrentLockState_(v16, v15, v3);
}

- (void)launchHomeAppForSmartGridContentViewController:(id)a3
{
  id v4 = a3;
  objc_msgSend_contentModuleContext(self, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  launchHomeAppForModuleViewController(v4, v7);
}

- (BOOL)isDeviceUnlockedForSmartGridContentViewController:(id)a3
{
  BOOL v3 = objc_msgSend_lockStateHandler(self, a2, (uint64_t)a3);
  char isDeviceUnlocked = objc_msgSend_isDeviceUnlocked(v3, v4, v5);

  return isDeviceUnlocked;
}

- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v19 = 138412546;
    v20 = v8;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_24065C000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v12 = objc_msgSend_sharedManager(MEMORY[0x263F49B30], v10, v11);
  objc_msgSend_enterModuleViewWillAppear(v12, v13, v14);

  objc_msgSend_cancelScheduledCharacteristicDeregistration(self, v15, v16);
  objc_msgSend_setupHomeKitActiveAssertionIfNeeded(self, v17, v18);
}

- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v19 = 138412546;
    v20 = v8;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_24065C000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v12 = objc_msgSend_sharedManager(MEMORY[0x263F49B30], v10, v11);
  objc_msgSend_exitModuleViewDidDisappear(v12, v13, v14);

  objc_msgSend_scheduleCharacteristicDeregistration(self, v15, v16);
  objc_msgSend_resetFetchedMediaItems(self, v17, v18);
}

- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!objc_msgSend_allowsCharacteristicNotifications(v7, v9, v10)) {
    goto LABEL_4;
  }
  uint64_t v13 = objc_msgSend_itemManager(v7, v11, v12);
  uint64_t v16 = objc_msgSend_home(v13, v14, v15);
  int v19 = objc_msgSend_uuid(v16, v17, v18);

  if (v19)
  {
    __int16 v21 = objc_msgSend_characteristicsToEnableNotificationsForItems_(self, v20, (uint64_t)v8);
    objc_initWeak((id *)location, self);
    v24 = objc_msgSend_itemManager(v7, v22, v23);
    v27 = objc_msgSend_home(v24, v25, v26);
    uint64_t v30 = objc_msgSend_characteristicRegistrationObject(self, v28, v29);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_2406618F4;
    v41[3] = &unk_2650CC020;
    objc_copyWeak(&v42, (id *)location);
    objc_msgSend_registerForCharacteristics_items_inHome_currentRegistration_completionBlock_(self, v31, (uint64_t)v21, v8, v27, v30, v41);

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)location);
  }
  else
  {
LABEL_4:
    long long v32 = HFLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = (objc_class *)objc_opt_class();
      long long v34 = NSStringFromClass(v33);
      v35 = NSStringFromSelector(a2);
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v34;
      __int16 v44 = 2112;
      v45 = v35;
      _os_log_impl(&dword_24065C000, v32, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called while view controller had characteristic notifications disabled. Clearing registration", location, 0x16u);
    }
    v38 = objc_msgSend_characteristicRegistrationObject(self, v36, v37);
    objc_msgSend_cancelRegistration_(self, v39, (uint64_t)v38);

    objc_msgSend_setCharacteristicRegistrationObject_(self, v40, 0);
  }
}

- (void)cancelScheduledCharacteristicDeregistration
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_characteristicRegistrationScheduledCancelation(self, a2, v2);

  if (v4)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_24065C000, v7, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration canceling scheduled characteristic deregistration", (uint8_t *)&v12, 0xCu);
    }
  }
  id v8 = objc_msgSend_characteristicRegistrationScheduledCancelation(self, v5, v6);
  objc_msgSend_cancel(v8, v9, v10);

  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(self, v11, 0);
}

- (void)scheduleCharacteristicDeregistration
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_characteristicRegistrationScheduledCancelation(self, a2, v2);
  objc_msgSend_cancel(v4, v5, v6);

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = self;
    _os_log_impl(&dword_24065C000, v7, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration scheduling characteristic deregistration", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v10 = objc_msgSend_mainThreadScheduler(MEMORY[0x263F581B8], v8, v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_240661CA8;
  v14[3] = &unk_2650CC048;
  objc_copyWeak(&v15, (id *)buf);
  int v12 = objc_msgSend_afterDelay_performBlock_(v10, v11, (uint64_t)v14, 5.0);
  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(self, v13, (uint64_t)v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)launchHomeAppForControlCenterModuleViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    int v13 = 138412546;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_24065C000, v6, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v13, 0x16u);
  }
  int v12 = objc_msgSend_contentModuleContext(self, v10, v11);
  launchHomeAppForModuleViewController(v5, v12);
}

- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v16 = 138412546;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    int v19 = v8;
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@-%@ delegate called", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v11 = objc_msgSend_lockStateHandler(self, v9, v10);
  char isDeviceUnlocked = objc_msgSend_isDeviceUnlocked(v11, v12, v13);

  return isDeviceUnlocked;
}

- (void)setupHomeKitActiveAssertionIfNeeded
{
  id v4 = objc_msgSend_homeKitActiveAssertion(self, a2, v2);

  if (!v4)
  {
    id v7 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v5, v6);
    objc_msgSend_homeManager(v7, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    int v12 = objc_msgSend_homeKitActiveAssertionReason(self, v10, v11);
    uint64_t v14 = objc_msgSend__beginActiveAssertionWithReason_(v16, v13, (uint64_t)v12);
    objc_msgSend_setHomeKitActiveAssertion_(self, v15, (uint64_t)v14);
  }
}

- (void)endHomeKitActiveAssertion
{
  id v4 = objc_msgSend_homeKitActiveAssertion(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v5, v6);
    uint64_t v10 = objc_msgSend_homeManager(v7, v8, v9);

    uint64_t v13 = objc_msgSend_homeKitActiveAssertion(self, v11, v12);
    objc_msgSend__endActiveAssertion_(v10, v14, (uint64_t)v13);
  }

  objc_msgSend_setHomeKitActiveAssertion_(self, v5, 0);
}

- (id)homeKitActiveAssertionReason
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v7 = objc_msgSend_stringWithFormat_(v3, v6, @"%@:%@", v5, self);

  return v7;
}

- (CCUIContentModuleContentViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (HUCCLockStateHandler)lockStateHandler
{
  return self->_lockStateHandler;
}

- (void)setLockStateHandler:(id)a3
{
}

- (id)characteristicRegistrationObject
{
  return self->_characteristicRegistrationObject;
}

- (void)setCharacteristicRegistrationObject:(id)a3
{
}

- (id)homeKitActiveAssertion
{
  return self->_homeKitActiveAssertion;
}

- (void)setHomeKitActiveAssertion:(id)a3
{
}

- (NACancelable)characteristicRegistrationScheduledCancelation
{
  return self->_characteristicRegistrationScheduledCancelation;
}

- (void)setCharacteristicRegistrationScheduledCancelation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicRegistrationScheduledCancelation, 0);
  objc_storeStrong(&self->_homeKitActiveAssertion, 0);
  objc_storeStrong(&self->_characteristicRegistrationObject, 0);
  objc_storeStrong((id *)&self->_lockStateHandler, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)registerForCharacteristics:(NSSet *)a3 items:(NSSet *)a4 inHome:(HMHome *)a5 currentRegistration:(id)a6 completionBlock:(id)a7
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v15 = _Block_copy(a7);
  id v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  uint64_t v17 = sub_240676568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  __int16 v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_268C8D610;
  v18[5] = v16;
  int v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_268C8D4E0;
  v19[5] = v18;
  uint64_t v20 = a3;
  __int16 v21 = a4;
  v22 = a5;
  swift_unknownObjectRetain();
  uint64_t v23 = self;
  sub_240674908((uint64_t)v14, (uint64_t)&unk_268C8D4E8, (uint64_t)v19);
  swift_release();
}

- (void)cancelRegistration:(id)a3
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2406763A8();
  swift_unknownObjectRetain_n();
  uint64_t v6 = self;
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_240676568();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v8;
    sub_240671584((uint64_t)v5, (uint64_t)&unk_268C8D5F8, (uint64_t)v10);
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
}

- (id)characteristicsToEnableNotificationsForItems:(id)a3
{
  sub_240675C44(0, &qword_268C8D5C0);
  sub_24067573C(&qword_268C8D5C8, &qword_268C8D5C0);
  uint64_t v4 = sub_240676588();
  sub_2406763F8();
  v8[3] = sub_24066F464(&qword_268C8D5D0);
  v8[4] = sub_240675780();
  v8[0] = v4;
  id v5 = self;
  swift_bridgeObjectRetain();
  sub_2406763B8();
  sub_240675AB8((uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_240675C44(0, &qword_268C8D5E0);
  sub_24067573C(&qword_268C8D5E8, &qword_268C8D5E0);
  uint64_t v6 = (void *)sub_240676578();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)registerForAnalytics
{
  uint64_t v2 = self;
  sub_24067353C();
}

@end