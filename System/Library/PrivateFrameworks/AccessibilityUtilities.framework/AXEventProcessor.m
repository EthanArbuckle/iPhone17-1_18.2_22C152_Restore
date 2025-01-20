@interface AXEventProcessor
- (AXEventProcessor)init;
- (AXEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (BOOL)ignoreAllSystemEvents;
- (BOOL)ignoreEventsForContinuitySession;
- (BOOL)isHandlingHIDEvents;
- (BOOL)isHandlingSystemEvents;
- (BOOL)shouldNotifyUserEventOccurred;
- (NSMutableArray)hidActualEventTapEnabledReasons;
- (NSMutableArray)systemActualEventTapEnabledReasons;
- (NSString)HIDEventTapIdentifier;
- (NSString)systemEventTapIdentifier;
- (NSThread)HIDEventReceiveThread;
- (id)HIDEventHandler;
- (id)failedToHandleEventInTime;
- (id)systemEventHandler;
- (int)HIDEventTapPriority;
- (int)systemEventTapPriority;
- (unint64_t)HIDEventFilterMask;
- (void)_installHIDEventFilter;
- (void)_installSystemEventFilter;
- (void)_runHIDEventReceiveThread;
- (void)_uninstallHIDEventFilter;
- (void)_uninstallSystemEventFilter;
- (void)beginHandlingHIDEventsForReason:(id)a3;
- (void)beginHandlingSystemEventsForReason:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)endHandlingHIDEventsForReason:(id)a3;
- (void)endHandlingSystemEventsForReason:(id)a3;
- (void)raiseHIDEventTapPriorityToMaximum;
- (void)raiseSystemEventTapPriorityToMaximum;
- (void)restoreHIDEventTapPriorityToDefault;
- (void)restoreSystemEventTapPriorityToDefault;
- (void)setFailedToHandleEventInTime:(id)a3;
- (void)setHIDEventFilterMask:(unint64_t)a3;
- (void)setHIDEventHandler:(id)a3;
- (void)setHIDEventReceiveThread:(id)a3;
- (void)setHIDEventTapIdentifier:(id)a3;
- (void)setHIDEventTapPriority:(int)a3;
- (void)setHandlingHIDEvents:(BOOL)a3;
- (void)setHandlingSystemEvents:(BOOL)a3;
- (void)setHidActualEventTapEnabledReasons:(id)a3;
- (void)setIgnoreAllSystemEvents:(BOOL)a3;
- (void)setIgnoreEventsForContinuitySession:(BOOL)a3;
- (void)setShouldNotifyUserEventOccurred:(BOOL)a3;
- (void)setSystemActualEventTapEnabledReasons:(id)a3;
- (void)setSystemEventHandler:(id)a3;
- (void)setSystemEventTapIdentifier:(id)a3;
- (void)setSystemEventTapPriority:(int)a3;
@end

@implementation AXEventProcessor

- (AXEventProcessor)init
{
  [MEMORY[0x1E4F1CA00] raise:@"NotSupported" format:@"Use initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:"];

  return [(AXEventProcessor *)self initWithHIDTapIdentifier:0 HIDEventTapPriority:0 systemEventTapIdentifier:0 systemEventTapPriority:0];
}

- (AXEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)AXEventProcessor;
  v12 = [(AXEventProcessor *)&v29 init];
  v13 = v12;
  if (v12)
  {
    [(AXEventProcessor *)v12 setHIDEventTapIdentifier:v10];
    [(AXEventProcessor *)v13 setHIDEventTapPriority:v8];
    [(AXEventProcessor *)v13 setHIDEventFilterMask:1];
    [(AXEventProcessor *)v13 setSystemEventTapIdentifier:v11];
    [(AXEventProcessor *)v13 setSystemEventTapPriority:v6];
    v14 = [MEMORY[0x1E4F1CA48] array];
    [(AXEventProcessor *)v13 setHidActualEventTapEnabledReasons:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    [(AXEventProcessor *)v13 setSystemActualEventTapEnabledReasons:v15];

    char IsBackboard = AXProcessIsBackboard();
    if (v11 && (IsBackboard & 1) == 0) {
      _AXAssert();
    }
    if (v10)
    {
      v13->_shouldRunHIDReceiveThreadRunloop = 1;
      objc_initWeak(&location, v13);
      id v17 = objc_alloc(MEMORY[0x1E4F29060]);
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __113__AXEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
      v26 = &unk_1E5586A10;
      objc_copyWeak(&v27, &location);
      uint64_t v18 = [v17 initWithBlock:&v23];
      HIDEventReceiveThread = v13->_HIDEventReceiveThread;
      v13->_HIDEventReceiveThread = (NSThread *)v18;

      v20 = v13->_HIDEventReceiveThread;
      v21 = [NSString stringWithFormat:@"%@-HIDEventReceive-%p", v10, v13, v23, v24, v25, v26];
      [(NSThread *)v20 setName:v21];

      [(NSThread *)v13->_HIDEventReceiveThread start];
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }

  return v13;
}

void __113__AXEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _runHIDEventReceiveThread];
}

- (void)dealloc
{
  if (self->_shouldRunHIDReceiveThreadRunloop) {
    _AXAssert();
  }
  v3.receiver = self;
  v3.super_class = (Class)AXEventProcessor;
  [(AXEventProcessor *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->_HIDEventReceiveThread && self->_shouldRunHIDReceiveThreadRunloop)
  {
    -[AXEventProcessor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__uninstallHIDEventFilter);
    self->_shouldRunHIDReceiveThreadRunloop = 0;
    [(NSThread *)self->_HIDEventReceiveThread cancel];
    HIDEventReceiveThread = self->_HIDEventReceiveThread;
    self->_HIDEventReceiveThread = 0;
  }
}

- (void)beginHandlingHIDEventsForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AXEventProcessor *)self HIDEventTapIdentifier];

  if (v5)
  {
    uint64_t v6 = [(AXEventProcessor *)self hidActualEventTapEnabledReasons];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      uint64_t v8 = AXLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "EventProcessor: This reason already exists among reasons for tapping HID events. Unbalanced. %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = [(AXEventProcessor *)self hidActualEventTapEnabledReasons];
      [v8 addObject:v4];
    }

    if (![(AXEventProcessor *)self isHandlingHIDEvents])
    {
      [(AXEventProcessor *)self setHandlingHIDEvents:1];
      [(AXEventProcessor *)self performSelector:sel__installHIDEventFilter onThread:self->_HIDEventReceiveThread withObject:0 waitUntilDone:0];
    }
  }
  else
  {
    _AXAssert();
  }
}

- (void)endHandlingHIDEventsForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AXEventProcessor *)self hidActualEventTapEnabledReasons];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    int v7 = [(AXEventProcessor *)self hidActualEventTapEnabledReasons];
    [v7 removeObject:v4];
  }
  else
  {
    int v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "EventProcessor: This reason does not exist among reasons for tapping HID events. Unbalanced. %@", (uint8_t *)&v10, 0xCu);
    }
  }

  uint64_t v8 = [(AXEventProcessor *)self hidActualEventTapEnabledReasons];
  if ([v8 count])
  {
  }
  else
  {
    BOOL v9 = [(AXEventProcessor *)self isHandlingHIDEvents];

    if (v9)
    {
      [(AXEventProcessor *)self setHandlingHIDEvents:0];
      [(AXEventProcessor *)self performSelector:sel__uninstallHIDEventFilter onThread:self->_HIDEventReceiveThread withObject:0 waitUntilDone:0];
    }
  }
}

- (void)raiseHIDEventTapPriorityToMaximum
{
  objc_super v3 = [(AXEventProcessor *)self HIDEventTapIdentifier];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AXEventProcessor_raiseHIDEventTapPriorityToMaximum__block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __53__AXEventProcessor_raiseHIDEventTapPriorityToMaximum__block_invoke(uint64_t a1)
{
  id v3 = +[AXEventTapManager sharedManager];
  v2 = [*(id *)(a1 + 32) HIDEventTapIdentifier];
  [v3 setEventTapPriority:v2 priority:90];
}

- (void)restoreHIDEventTapPriorityToDefault
{
  id v3 = [(AXEventProcessor *)self HIDEventTapIdentifier];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AXEventProcessor_restoreHIDEventTapPriorityToDefault__block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__AXEventProcessor_restoreHIDEventTapPriorityToDefault__block_invoke(uint64_t a1)
{
  id v3 = +[AXEventTapManager sharedManager];
  v2 = [*(id *)(a1 + 32) HIDEventTapIdentifier];
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, objc_msgSend(*(id *)(a1 + 32), "HIDEventTapPriority"));
}

- (void)beginHandlingSystemEventsForReason:(id)a3
{
  id v4 = a3;
  v5 = [(AXEventProcessor *)self systemEventTapIdentifier];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__AXEventProcessor_beginHandlingSystemEventsForReason___block_invoke;
    v6[3] = &unk_1E5586470;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
  else
  {
    _AXAssert();
  }
}

uint64_t __55__AXEventProcessor_beginHandlingSystemEventsForReason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemActualEventTapEnabledReasons];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v8 = @"This reason already exists among reasons for tapping system events. Unbalanced. Could be trouble, but might be ok. %@";
    uint64_t v9 = *(void *)(a1 + 40);
    LOBYTE(v7) = 1;
    _AXLogWithFacility();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) systemActualEventTapEnabledReasons];
    [v4 addObject:*(void *)(a1 + 40)];
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isHandlingSystemEvents", v7, v8, v9);
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHandlingSystemEvents:1];
    int v6 = *(void **)(a1 + 32);
    return [v6 _installSystemEventFilter];
  }
  return result;
}

- (void)endHandlingSystemEventsForReason:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AXEventProcessor_endHandlingSystemEventsForReason___block_invoke;
  v6[3] = &unk_1E5586470;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__AXEventProcessor_endHandlingSystemEventsForReason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) systemActualEventTapEnabledReasons];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) systemActualEventTapEnabledReasons];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = @"This reason does not exist among reasons for tapping system events. Unbalanced. %@";
    uint64_t v9 = *(void *)(a1 + 40);
    LOBYTE(v7) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(*(id *)(a1 + 32), "systemActualEventTapEnabledReasons", v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 count])
  {
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) isHandlingSystemEvents];

    if (v5)
    {
      [*(id *)(a1 + 32) setHandlingSystemEvents:0];
      int v6 = *(void **)(a1 + 32);
      [v6 _uninstallSystemEventFilter];
    }
  }
}

- (void)raiseSystemEventTapPriorityToMaximum
{
  int v3 = [(AXEventProcessor *)self systemEventTapIdentifier];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AXEventProcessor_raiseSystemEventTapPriorityToMaximum__block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__AXEventProcessor_raiseSystemEventTapPriorityToMaximum__block_invoke(uint64_t a1)
{
  id v3 = +[AXEventTapManager sharedManager];
  v2 = [*(id *)(a1 + 32) systemEventTapIdentifier];
  [v3 setEventTapPriority:v2 priority:90];
}

- (void)restoreSystemEventTapPriorityToDefault
{
  id v3 = [(AXEventProcessor *)self systemEventTapIdentifier];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AXEventProcessor_restoreSystemEventTapPriorityToDefault__block_invoke;
    block[3] = &unk_1E5585F48;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__AXEventProcessor_restoreSystemEventTapPriorityToDefault__block_invoke(uint64_t a1)
{
  id v3 = +[AXEventTapManager sharedManager];
  v2 = [*(id *)(a1 + 32) systemEventTapIdentifier];
  objc_msgSend(v3, "setEventTapPriority:priority:", v2, objc_msgSend(*(id *)(a1 + 32), "systemEventTapPriority"));
}

- (void)setIgnoreEventsForContinuitySession:(BOOL)a3
{
  self->_ignoreEventsForContinuitySession = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AXEventProcessor_setIgnoreEventsForContinuitySession___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__AXEventProcessor_setIgnoreEventsForContinuitySession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 32);
  id v2 = +[AXEventTapManager sharedManager];
  [v2 setIgnoreEventsForContinuitySession:v1];
}

- (void)_runHIDEventReceiveThread
{
  uint64_t v3 = AXSetThreadPriority();
  BOOL v4 = (void *)MEMORY[0x192F9F1F0](v3);
  int v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  int v6 = [MEMORY[0x1E4F1CA30] port];
  uint64_t v7 = *MEMORY[0x1E4F1C3A0];
  [v5 addPort:v6 forMode:*MEMORY[0x1E4F1C3A0]];

  do
  {
    uint64_t v8 = (void *)MEMORY[0x192F9F1F0]();
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v5 runMode:v7 beforeDate:v9];
  }
  while (self->_shouldRunHIDReceiveThreadRunloop
       && ![(NSThread *)self->_HIDEventReceiveThread isCancelled]);
}

- (void)_installHIDEventFilter
{
  unint64_t v3 = [(AXEventProcessor *)self HIDEventFilterMask] & 1;
  unint64_t v4 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 1) & 1;
  unint64_t v5 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 2) & 1;
  unint64_t v6 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 3) & 1;
  unint64_t v20 = [(AXEventProcessor *)self HIDEventFilterMask];
  unint64_t v7 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 4) & 1;
  unint64_t v8 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 5) & 1;
  unint64_t v9 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 6) & 1;
  unint64_t v10 = ([(AXEventProcessor *)self HIDEventFilterMask] >> 7) & 1;
  id v11 = objc_opt_new();
  [v11 setWantsDigitizerEvents:v3];
  [v11 setWantsKeyboardEvents:v4];
  [v11 setWantsATVRemoteEvents:v5];
  [v11 setWantsLisaEvents:v6];
  [v11 setWantsMouseEvents:v7];
  [v11 setWantsAccessibilityEvents:v8];
  [v11 setWantsStylusEvents:v9];
  [v11 setWantsVolumeButtonEvents:v10];
  objc_initWeak(&location, self);
  uint64_t v12 = +[AXEventTapManager sharedManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__AXEventProcessor__installHIDEventFilter__block_invoke;
  v21[3] = &unk_1E5588878;
  objc_copyWeak(&v22, &location);
  v13 = [(AXEventProcessor *)self HIDEventTapIdentifier];
  id v14 = (id)[v12 installEventTap:v21 identifier:v13 type:1 skipDeviceMatching:(v20 >> 8) & 1 filterEvents:v11 matchingServiceHandler:0];

  v15 = +[AXEventTapManager sharedManager];
  v16 = [(AXEventProcessor *)self HIDEventTapIdentifier];
  objc_msgSend(v15, "setEventTapPriority:priority:", v16, -[AXEventProcessor HIDEventTapPriority](self, "HIDEventTapPriority"));

  id v17 = +[AXEventTapManager sharedManager];
  uint64_t v18 = [(AXEventProcessor *)self HIDEventTapIdentifier];
  v19 = [(AXEventProcessor *)self failedToHandleEventInTime];
  [v17 setFailedToProcessInTimeCallback:v18 callback:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void *__42__AXEventProcessor__installHIDEventFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (AXEventTypeIsTouch([v3 type])
    && ([v3 handInfo],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 paths],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_41],
        v6,
        v5,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = 0;
  }
  else
  {
    if ([WeakRetained shouldNotifyUserEventOccurred]
      && [v3 type] == 3001
      && CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_LastEvent > 3.0)
    {
      unint64_t v8 = [MEMORY[0x1E4F482E0] backgroundAccessQueue];
      [v8 performAsynchronousReadingBlock:&__block_literal_global_44];

      _block_invoke_LastEvent = CFAbsoluteTimeGetCurrent();
    }
    unint64_t v9 = [WeakRetained HIDEventHandler];

    if (v9)
    {
      unint64_t v10 = [WeakRetained HIDEventHandler];
      unint64_t v9 = (void *)((uint64_t (**)(void, id))v10)[2](v10, v3);
    }
  }

  return v9;
}

BOOL __42__AXEventProcessor__installHIDEventFilter__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 pathIndex] > 0x12;
}

void __42__AXEventProcessor__installHIDEventFilter__block_invoke_3()
{
  id v0 = +[AXUserEventTimer sharedInstance];
  [v0 userEventOccurred];
}

- (void)_uninstallHIDEventFilter
{
  id v4 = +[AXEventTapManager sharedManager];
  id v3 = [(AXEventProcessor *)self HIDEventTapIdentifier];
  [v4 removeEventTap:v3];
}

- (void)_installSystemEventFilter
{
  objc_initWeak(&location, self);
  id v3 = +[AXEventTapManager sharedManager];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v9, &location);
  id v4 = [(AXEventProcessor *)self systemEventTapIdentifier];
  id v5 = (id)[v3 installEventTap:&v8 identifier:v4 type:0];

  unint64_t v6 = +[AXEventTapManager sharedManager];
  uint64_t v7 = [(AXEventProcessor *)self systemEventTapIdentifier];
  objc_msgSend(v6, "setEventTapPriority:priority:", v7, -[AXEventProcessor systemEventTapPriority](self, "systemEventTapPriority"));

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void *__45__AXEventProcessor__installSystemEventFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained shouldNotifyUserEventOccurred]
    && [v3 type] == 3001
    && ([v3 isCancel] & 1) == 0
    && CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_2_LastEvent > 3.0)
  {
    id v5 = [MEMORY[0x1E4F482E0] backgroundAccessQueue];
    [v5 performAsynchronousReadingBlock:&__block_literal_global_48];

    _block_invoke_2_LastEvent = CFAbsoluteTimeGetCurrent();
  }
  unint64_t v6 = [WeakRetained systemEventHandler];

  if (v6)
  {
    uint64_t v7 = [WeakRetained systemEventHandler];
    unint64_t v6 = (void *)((uint64_t (**)(void, id))v7)[2](v7, v3);
  }
  return v6;
}

void __45__AXEventProcessor__installSystemEventFilter__block_invoke_2()
{
  id v0 = +[AXUserEventTimer sharedInstance];
  [v0 userEventOccurred];
}

- (void)_uninstallSystemEventFilter
{
  id v4 = +[AXEventTapManager sharedManager];
  id v3 = [(AXEventProcessor *)self systemEventTapIdentifier];
  [v4 removeEventTap:v3];
}

- (BOOL)shouldNotifyUserEventOccurred
{
  return self->_shouldNotifyUserEventOccurred;
}

- (void)setShouldNotifyUserEventOccurred:(BOOL)a3
{
  self->_shouldNotifyUserEventOccurred = a3;
}

- (NSString)HIDEventTapIdentifier
{
  return self->_HIDEventTapIdentifier;
}

- (void)setHIDEventTapIdentifier:(id)a3
{
}

- (int)HIDEventTapPriority
{
  return self->_HIDEventTapPriority;
}

- (void)setHIDEventTapPriority:(int)a3
{
  self->_HIDEventTapPriority = a3;
}

- (NSThread)HIDEventReceiveThread
{
  return self->_HIDEventReceiveThread;
}

- (void)setHIDEventReceiveThread:(id)a3
{
}

- (BOOL)isHandlingHIDEvents
{
  return self->_handlingHIDEvents;
}

- (void)setHandlingHIDEvents:(BOOL)a3
{
  self->_handlingHIDEvents = a3;
}

- (id)HIDEventHandler
{
  return self->_HIDEventHandler;
}

- (void)setHIDEventHandler:(id)a3
{
}

- (unint64_t)HIDEventFilterMask
{
  return self->_HIDEventFilterMask;
}

- (void)setHIDEventFilterMask:(unint64_t)a3
{
  self->_HIDEventFilterMask = a3;
}

- (id)failedToHandleEventInTime
{
  return self->_failedToHandleEventInTime;
}

- (void)setFailedToHandleEventInTime:(id)a3
{
}

- (NSString)systemEventTapIdentifier
{
  return self->_systemEventTapIdentifier;
}

- (void)setSystemEventTapIdentifier:(id)a3
{
}

- (int)systemEventTapPriority
{
  return self->_systemEventTapPriority;
}

- (void)setSystemEventTapPriority:(int)a3
{
  self->_systemEventTapPriority = a3;
}

- (id)systemEventHandler
{
  return self->_systemEventHandler;
}

- (void)setSystemEventHandler:(id)a3
{
}

- (BOOL)ignoreAllSystemEvents
{
  return self->_ignoreAllSystemEvents;
}

- (void)setIgnoreAllSystemEvents:(BOOL)a3
{
  self->_ignoreAllSystemEvents = a3;
}

- (BOOL)ignoreEventsForContinuitySession
{
  return self->_ignoreEventsForContinuitySession;
}

- (NSMutableArray)hidActualEventTapEnabledReasons
{
  return self->_hidActualEventTapEnabledReasons;
}

- (void)setHidActualEventTapEnabledReasons:(id)a3
{
}

- (BOOL)isHandlingSystemEvents
{
  return self->_handlingSystemEvents;
}

- (void)setHandlingSystemEvents:(BOOL)a3
{
  self->_handlingSystemEvents = a3;
}

- (NSMutableArray)systemActualEventTapEnabledReasons
{
  return self->_systemActualEventTapEnabledReasons;
}

- (void)setSystemActualEventTapEnabledReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemActualEventTapEnabledReasons, 0);
  objc_storeStrong((id *)&self->_hidActualEventTapEnabledReasons, 0);
  objc_storeStrong(&self->_systemEventHandler, 0);
  objc_storeStrong((id *)&self->_systemEventTapIdentifier, 0);
  objc_storeStrong(&self->_failedToHandleEventInTime, 0);
  objc_storeStrong(&self->_HIDEventHandler, 0);
  objc_storeStrong((id *)&self->_HIDEventReceiveThread, 0);

  objc_storeStrong((id *)&self->_HIDEventTapIdentifier, 0);
}

@end