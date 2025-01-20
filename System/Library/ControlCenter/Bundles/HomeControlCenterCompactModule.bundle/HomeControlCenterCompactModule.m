void sub_2406539C4()
{
  void *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_alloc_init(MEMORY[0x263F49B80]);
  v0 = [MEMORY[0x263F49AF8] sharedInstance];
  [v0 setStatusBarVisibilityHandler:v1];
}

void sub_2406544C0(uint64_t a1, int a2)
{
  v4 = [*(id *)(a1 + 32) expandedView];
  v5 = v4;
  if (a2)
  {
    [v4 setAlpha:1.0];

    id v7 = [*(id *)(a1 + 32) delegate];
    v6 = [v7 contentModuleContext];
    [v6 requestExpandModule];
  }
  else
  {
    [v4 setAlpha:0.0];

    id v7 = [*(id *)(a1 + 32) buttonView];
    [v7 setAlpha:1.0];
  }
}

uint64_t sub_240654884(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240654950;
  v3[3] = &unk_2650CB3C8;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_240654C7C;
  v2[3] = &unk_2650CB3A0;
  v2[4] = v4;
  return [MEMORY[0x263F1CB60] animateKeyframesWithDuration:0 delay:v3 options:v2 animations:0.0 completion:0.0];
}

uint64_t sub_240654950(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240654A9C;
  v5[3] = &unk_2650CB3C8;
  v5[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v5 relativeDuration:0.0 animations:0.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_240654B5C;
  v4[3] = &unk_2650CB3C8;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.05 animations:0.95];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240654BE4;
  v3[3] = &unk_2650CB3C8;
  void v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.65 animations:0.35];
}

void sub_240654A9C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonView];
  [v2 setAlpha:0.0];

  [*(id *)(a1 + 32) _iconViewInHomeGridCellFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) transitionIconView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [*(id *)(a1 + 32) transitionIconView];
  [v12 setHidden:0];
}

void sub_240654B5C(uint64_t a1)
{
  [*(id *)(a1 + 32) _iconViewInNavigationHeaderViewFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) transitionIconView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

void sub_240654BE4(uint64_t a1)
{
  double v2 = 1.0;
  if (([*(id *)(a1 + 32) accessAllowedForCurrentLockState] & 1) == 0)
  {
    double v3 = [*(id *)(a1 + 32) delegate];
    if ([v3 isDeviceUnlockedForModuleContentViewController:*(void *)(a1 + 32)]) {
      double v2 = 1.0;
    }
    else {
      double v2 = 0.0;
    }
  }
  id v4 = [*(id *)(a1 + 32) expandedView];
  [v4 setAlpha:v2];
}

void sub_240654C7C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) dashboardContainerViewController];
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  id v3 = [*(id *)(a1 + 32) transitionIconView];
  [v3 setHidden:1];
}

uint64_t sub_240654CFC(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_240654E1C;
  v6[3] = &unk_2650CB3C8;
  uint64_t v7 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240654EE8;
  v5[3] = &unk_2650CB3A0;
  v5[4] = v7;
  [MEMORY[0x263F1CB60] animateKeyframesWithDuration:0 delay:v6 options:v5 animations:0.0 completion:0.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_240654F68;
  v4[3] = &unk_2650CB3C8;
  double v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  return [v2 addAnimations:v4];
}

uint64_t sub_240654E1C(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_240654EA0;
  v2[3] = &unk_2650CB3C8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] addKeyframeWithRelativeStartTime:v2 relativeDuration:0.0 animations:0.5];
}

void sub_240654EA0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) expandedView];
  [v1 setAlpha:0.0];
}

void sub_240654EE8(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) dashboardContainerViewController];
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  id v3 = [*(id *)(a1 + 32) buttonView];
  [v3 setAlpha:1.0];
}

void sub_240654F68(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) buttonView];
  [v1 setAlpha:1.0];
}

uint64_t sub_240654FB0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) dashboardContainerViewController];
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  uint64_t v3 = *(void *)(a1 + 40);

  return MEMORY[0x270F9A6D0](v3, sel_startAnimation);
}

void sub_24065552C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  [v1 launchHomeAppForModuleContentViewController:WeakRetained];
}

uint64_t sub_24065575C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240655E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240655E34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_240652000, v2, OS_LOG_TYPE_DEFAULT, "Lock state has changed, checking access.", v3, 2u);
  }

  [WeakRetained _updateAccessAllowedForLockState];
}

void sub_240656508(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_240656524(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = HFLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_2406574B0(v2);
    }
  }
  return 0;
}

void sub_240656578(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [WeakRetained _configureAndAddRemoteViewController:v3 forHome:*(void *)(a1 + 32)];
  }
  else
  {
    double v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2406574F4(v5);
    }
  }
}

void sub_2406567A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2406567CC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setTransitionSubviewFrames:v3];
}

void sub_240656C04(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) serviceViewControllerProxy];
  [v3 lockAuthenticationCompleted:a2];
}

void HUCCPerformCommonInitialization()
{
  if (qword_268C8C868 != -1) {
    dispatch_once(&qword_268C8C868, &unk_26F4C6308);
  }
}

void sub_240656E04()
{
  v0 = [MEMORY[0x263F47B60] configuration];
  id v3 = (id)[v0 mutableCopy];

  [v3 setAdaptive:1];
  [MEMORY[0x263F47B60] setConfiguration:v3];
  id v1 = [MEMORY[0x263F47B60] sharedDispatcher];
  [v1 warmup];

  uint64_t v2 = [MEMORY[0x263F47B48] sharedInstance];
  [v2 setRunningState:1];
}

void HUCCUpdateRunningState(int a1)
{
}

void HUCCUpdateRunningStateWithAppleMediaAccessories(int a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F47B48] sharedInstance];
  uint64_t v5 = [v4 runningState];

  if (v5 != (a1 ^ 1))
  {
    if (a1)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        double v6 = [MEMORY[0x263F47B10] sharedManager];
        [v6 enableNotificationsForSelectedHomeWithReason:*MEMORY[0x263F47A98] numberOfAppleMediaAccessories:a2];
      }
      id v8 = [MEMORY[0x263F47B48] sharedInstance];
      [v8 executionEnvironmentWillEnterForeground];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F47B48] sharedInstance];
      [v7 executionEnvironmentDidEnterBackground];

      if (_os_feature_enabled_impl()) {
        return;
      }
      id v8 = [MEMORY[0x263F47B10] sharedManager];
      [v8 disableNotificationsForSelectedHomeWithReason:*MEMORY[0x263F47A90]];
    }
  }
}

void launchHomeAppForModuleViewController(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (a2)
  {
    id v4 = a2;
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_240652000, v5, OS_LOG_TYPE_DEFAULT, "Launching Home app for moduleViewController %@", (uint8_t *)&v7, 0xCu);
    }

    double v6 = [NSURL URLWithString:@"com.apple.home://"];
    [v4 openURL:v6 completionHandler:0];
  }
}

__CFString *HUCCStringForOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_2650CB520[a1 - 1];
  }
}

void sub_2406573FC(uint64_t a1, SEL aSelector, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(aSelector);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_240652000, a3, OS_LOG_TYPE_ERROR, "%@ Asked for %@ before transition subview frames were set!", (uint8_t *)&v6, 0x16u);
}

void sub_2406574B0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_240652000, log, OS_LOG_TYPE_ERROR, "Timeout trying to load Remote Dashboard View Controller", v1, 2u);
}

void sub_2406574F4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_240652000, log, OS_LOG_TYPE_ERROR, "Unable to load Remote Dashboard View Controller", v1, 2u);
}

void sub_240657538(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_240652000, a2, OS_LOG_TYPE_ERROR, "Remote Dashboard View Controller View Service terminated  (error: %@)", (uint8_t *)&v2, 0xCu);
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x270F18840]();
}

uint64_t CCUIExpandedModuleEdgeInsets()
{
  return MEMORY[0x270F18858]();
}

uint64_t CCUIMaximumExpandedContentModuleHeight()
{
  return MEMORY[0x270F18880]();
}

uint64_t CCUIScreenBounds()
{
  return MEMORY[0x270F188A0]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x270F3A108]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x270F95FD0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}