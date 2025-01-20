@interface MTCCTimerModule
+ (id)firstThatMatches:(id)a3 fromTimers:(id)a4;
- (BOOL)addButtonTapped;
- (BOOL)canOverrideCurrent;
- (MTCCTimer)currentTimer;
- (MTCCTimerBackgroundViewController)timerBackgroundViewController;
- (MTCCTimerModule)init;
- (MTCCTimerViewController)timerViewController;
- (MTTimerManager)timerManager;
- (double)defaultDuration;
- (id)launchURLForTouchType:(int64_t)a3;
- (id)processChangesForNewState:(id)a3;
- (void)reloadTimerState;
- (void)reloadTimerStateAndUpdateDuration;
- (void)reloadTimerStateUpdateDuration:(BOOL)a3;
- (void)setAddButtonTapped:(BOOL)a3;
- (void)setCanOverrideCurrent:(BOOL)a3;
- (void)setCurrentTimer:(id)a3;
- (void)setDefaultDuration:(double)a3;
- (void)setTimerBackgroundViewController:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTimerViewController:(id)a3;
- (void)timerBackgroundViewController:(id)a3 timerDidChange:(id)a4;
- (void)timerBackgroundViewControllerAddButtonTapped:(id)a3 withEvent:(id)a4;
- (void)timerDidChange:(id)a3;
- (void)timerViewController:(id)a3 didExpand:(BOOL)a4;
- (void)timerViewController:(id)a3 timerDidChange:(id)a4;
- (void)timerViewControllerButtonTapped:(id)a3 withEvent:(id)a4;
@end

@implementation MTCCTimerModule

- (void)reloadTimerState
{
}

- (void)reloadTimerStateAndUpdateDuration
{
}

- (MTCCTimerModule)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)MTCCTimerModule;
  v2 = [(CCUIAppLauncherModule *)&v23 init];
  if (v2)
  {
    v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v2;
      _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized", buf, 0xCu);
    }

    v4 = objc_alloc_init(MTCCTimerViewController);
    timerViewController = v2->_timerViewController;
    v2->_timerViewController = v4;

    objc_msgSend_setDelegate_(v2->_timerViewController, v6, (uint64_t)v2);
    v7 = objc_alloc_init(MTCCTimerBackgroundViewController);
    timerBackgroundViewController = v2->_timerBackgroundViewController;
    v2->_timerBackgroundViewController = v7;

    objc_msgSend_setDelegate_(v2->_timerBackgroundViewController, v9, (uint64_t)v2);
    uint64_t v10 = objc_opt_new();
    timerManager = v2->_timerManager;
    v2->_timerManager = (MTTimerManager *)v10;

    v14 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v12, v13);
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v2, sel_reloadTimerState, *MEMORY[0x263F55D20], 0);

    v18 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v16, v17);
    objc_msgSend_addObserver_selector_name_object_(v18, v19, (uint64_t)v2, sel_reloadTimerStateAndUpdateDuration, *MEMORY[0x263F55D08], 0);

    objc_msgSend_reloadTimerState(v2, v20, v21);
  }
  return v2;
}

- (void)reloadTimerStateUpdateDuration:(BOOL)a3
{
  v5 = objc_msgSend_timers(self->_timerManager, a2, a3);
  v8 = objc_msgSend_mtMainThreadScheduler(MEMORY[0x263F581B8], v6, v7);
  uint64_t v10 = objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2406B41D4;
  v13[3] = &unk_2650CFB58;
  v13[4] = self;
  BOOL v14 = a3;
  id v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);
}

- (id)launchURLForTouchType:(int64_t)a3
{
  if (self->_addButtonTapped)
  {
    v3 = objc_msgSend_URLWithString_(NSURL, a2, @"clock-timer:add");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTCCTimerModule;
    v3 = [(CCUIAppLauncherModule *)&v5 launchURLForTouchType:a3];
  }

  return v3;
}

- (void)timerDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_2406B2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer did change notification received", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend_reloadTimerState(self, v5, v6);
}

- (void)timerViewController:(id)a3 timerDidChange:(id)a4
{
  objc_super v5 = objc_msgSend_processChangesForNewState_(self, a2, (uint64_t)a4);
  v8 = objc_msgSend_mtMainThreadScheduler(MEMORY[0x263F581B8], v6, v7);
  uint64_t v10 = objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2406B459C;
  v13[3] = &unk_2650CFB80;
  v13[4] = self;
  id v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);
}

- (void)timerViewControllerButtonTapped:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_2406B2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling start/stop button tapped", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v9 = objc_msgSend_allTouches(v5, v7, v8);

  id v12 = objc_msgSend_anyObject(v9, v10, v11);

  self->_addButtonTapped = 0;
  uint64_t v15 = objc_msgSend_type(v12, v13, v14);
  objc_msgSend_handleTapWithTouchType_(self, v16, v15);
}

- (void)timerViewController:(id)a3 didExpand:(BOOL)a4
{
  self->_canOverrideCurrent = !a4;
  objc_msgSend_reloadTimerState(self, a2, (uint64_t)a3);
}

- (void)timerBackgroundViewController:(id)a3 timerDidChange:(id)a4
{
  id v5 = objc_msgSend_processChangesForNewState_(self, a2, (uint64_t)a4);
  uint64_t v8 = objc_msgSend_mtMainThreadScheduler(MEMORY[0x263F581B8], v6, v7);
  uint64_t v10 = objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2406B47F0;
  v13[3] = &unk_2650CFB80;
  v13[4] = self;
  id v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);
}

- (void)timerBackgroundViewControllerAddButtonTapped:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_2406B2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling add button tapped", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v9 = objc_msgSend_allTouches(v5, v7, v8);

  id v12 = objc_msgSend_anyObject(v9, v10, v11);

  self->_addButtonTapped = 1;
  uint64_t v15 = objc_msgSend_type(v12, v13, v14);
  objc_msgSend_handleTapWithTouchType_(self, v16, v15);
}

- (double)defaultDuration
{
  CFNumberRef v2 = (const __CFNumber *)CFPreferencesCopyAppValue(@"MTCCTimerDefaultDuration", @"com.apple.mobiletimer");
  if (!v2) {
    return 900.0;
  }
  CFNumberRef v3 = v2;
  double valuePtr = 0.0;
  if (!CFNumberGetValue(v2, kCFNumberDoubleType, &valuePtr)) {
    double valuePtr = 900.0;
  }
  CFRelease(v3);
  return valuePtr;
}

- (void)setDefaultDuration:(double)a3
{
  double valuePtr = a3;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberDoubleType, &valuePtr);
  CFPreferencesSetAppValue(@"MTCCTimerDefaultDuration", v3, @"com.apple.mobiletimer");
  if (v3) {
    CFRelease(v3);
  }
}

+ (id)firstThatMatches:(id)a3 fromTimers:(id)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2406B4B20;
    v10[3] = &unk_2650CFBA8;
    id v11 = v5;
    uint64_t v8 = objc_msgSend_na_firstObjectPassingTest_(a4, v7, (uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)processChangesForNewState:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_latestDuration(self->_timerManager, v5, v6);
  uint64_t v10 = objc_msgSend_mainThreadScheduler(MEMORY[0x263F581B8], v8, v9);
  id v12 = objc_msgSend_reschedule_(v7, v11, (uint64_t)v10);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2406B4CB4;
  v17[3] = &unk_2650CFBF8;
  v17[4] = self;
  id v18 = v4;
  id v13 = v4;
  uint64_t v15 = objc_msgSend_flatMap_(v12, v14, (uint64_t)v17);

  return v15;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (MTCCTimerViewController)timerViewController
{
  return self->_timerViewController;
}

- (void)setTimerViewController:(id)a3
{
}

- (MTCCTimerBackgroundViewController)timerBackgroundViewController
{
  return self->_timerBackgroundViewController;
}

- (void)setTimerBackgroundViewController:(id)a3
{
}

- (MTCCTimer)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
}

- (BOOL)addButtonTapped
{
  return self->_addButtonTapped;
}

- (void)setAddButtonTapped:(BOOL)a3
{
  self->_addButtonTapped = a3;
}

- (BOOL)canOverrideCurrent
{
  return self->_canOverrideCurrent;
}

- (void)setCanOverrideCurrent:(BOOL)a3
{
  self->_canOverrideCurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_timerBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_timerViewController, 0);

  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end