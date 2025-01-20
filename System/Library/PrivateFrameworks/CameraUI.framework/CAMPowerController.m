@interface CAMPowerController
- (CAMPowerController)init;
- (NSMutableDictionary)_assertionsByIdentifier;
- (OS_dispatch_queue)_powerControllerQueue;
- (id)description;
- (int)_powerPressureNotificationToken;
- (unint64_t)_backgroundTaskIdentifier;
- (unsigned)_powerControllerQueue_powerPressureLevel;
- (unsigned)generateAssertionIdentifier;
- (unsigned)powerPressureLevel;
- (void)_endBackgroundTaskIfNeeded;
- (void)_powerControllerQueue_setPowerPressureLevel:(unsigned int)a3;
- (void)_startBackgroundTaskIfNeeded;
- (void)addAssertionForIndentifier:(unsigned int)a3 withReason:(unsigned int)a4;
- (void)dealloc;
- (void)init;
- (void)removeAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4;
@end

@implementation CAMPowerController

- (CAMPowerController)init
{
  v18.receiver = self;
  v18.super_class = (Class)CAMPowerController;
  id v2 = [(CAMPowerController *)&v18 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    *((void *)v2 + 5) = *MEMORY[0x263F833E0];
    *((_DWORD *)v2 + 3) = -1;
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.camera.power-controller.assertions", v5);
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __26__CAMPowerController_init__block_invoke;
    aBlock[3] = &unk_263FA0BE0;
    objc_copyWeak(&v16, &location);
    v8 = _Block_copy(aBlock);
    uint32_t v9 = notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v2 + 3, *((dispatch_queue_t *)v2 + 4), v8);
    if (v9)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(CAMPowerController *)v9 init];
      }
    }
    else
    {
      v14 = v8;
      id v13 = v2;
      pl_dispatch_async();

      v10 = v14;
    }

    id v11 = v2;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (CAMPowerController *)v2;
}

void __26__CAMPowerController_init__block_invoke(uint64_t a1, int a2)
{
  v4 = (void *)MEMORY[0x21050BCA0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a2, &state64);
  if (state)
  {
    int v7 = state;
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __26__CAMPowerController_init__block_invoke_cold_1(v7, v8);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_powerControllerQueue_setPowerPressureLevel:", state64);
  }
}

- (void)_powerControllerQueue_setPowerPressureLevel:(unsigned int)a3
{
  self->__powerControllerQueue_powerPressureLevel = a3;
}

- (unsigned)generateAssertionIdentifier
{
  return atomic_fetch_add(&self->_assertionIdentifierGenerator, 1u);
}

- (void)addAssertionForIndentifier:(unsigned int)a3 withReason:(unsigned int)a4
{
  v4 = [(CAMPowerController *)self _powerControllerQueue];
  pl_dispatch_async();
}

- (OS_dispatch_queue)_powerControllerQueue
{
  return self->__powerControllerQueue;
}

void __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke(uint64_t a1)
{
  id v2 = (int *)(a1 + 40);
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  v4 = [*(id *)(a1 + 32) _assertionsByIdentifier];
  v5 = [v4 objectForKeyedSubscript:v3];
  unsigned int v6 = [v5 intValue];

  v8 = (int *)(a1 + 44);
  int v7 = *(_DWORD *)(a1 + 44);
  if ((v7 & v6) != 0)
  {
    uint32_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke_cold_1(v2, v8, v9);
    }
  }
  else
  {
    v10 = [NSNumber numberWithUnsignedInt:v7 | v6];
    [v4 setObject:v10 forKeyedSubscript:v3];

    [*(id *)(a1 + 32) _startBackgroundTaskIfNeeded];
  }
}

- (NSMutableDictionary)_assertionsByIdentifier
{
  return self->__assertionsByIdentifier;
}

- (void)_startBackgroundTaskIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(CAMPowerController *)self _assertionsByIdentifier];
  if ([v3 count] && self->__backgroundTaskIdentifier == *MEMORY[0x263F833E0])
  {
    v4 = [(id)objc_opt_class() description];
    v5 = [MEMORY[0x263F82438] sharedApplication];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke;
    v8[3] = &unk_263FA0208;
    id v9 = v3;
    self->__unint64_t backgroundTaskIdentifier = [v5 beginBackgroundTaskWithName:v4 expirationHandler:v8];

    unsigned int v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t backgroundTaskIdentifier = self->__backgroundTaskIdentifier;
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = backgroundTaskIdentifier;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "PowerController: Started background task: %ld", buf, 0xCu);
    }
  }
}

- (void)removeAssertionForIdentifier:(unsigned int)a3 withReason:(unsigned int)a4
{
  v4 = [(CAMPowerController *)self _powerControllerQueue];
  pl_dispatch_async();
}

void __62__CAMPowerController_removeAssertionForIdentifier_withReason___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _assertionsByIdentifier];
  v4 = [v3 objectForKeyedSubscript:v2];
  v5 = v4;
  if (!v4)
  {
    os_log_t v11 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    int v12 = *(_DWORD *)(a1 + 40);
    id v13 = NSStringFromCAMPowerAssertionReason(*(_DWORD *)(a1 + 44));
    int v16 = 67109634;
    int v17 = v12;
    __int16 v18 = 2114;
    v19 = v13;
    __int16 v20 = 2114;
    v21 = v3;
    _os_log_error_impl(&dword_2099F8000, v11, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion not found, cannot remove reason %{public}@; existing assertions: %{public}@",
      (uint8_t *)&v16,
      0x1Cu);
LABEL_11:

    goto LABEL_8;
  }
  unsigned int v6 = [v4 intValue];
  unsigned int v7 = v6;
  int v8 = *(_DWORD *)(a1 + 44);
  if ((v8 & v6) == 0)
  {
    os_log_t v11 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v14 = *(_DWORD *)(a1 + 40);
    id v13 = NSStringFromCAMPowerAssertionReason(*(_DWORD *)(a1 + 44));
    v15 = NSStringFromCAMPowerAssertionReasonBitfield(v7);
    int v16 = 67109634;
    int v17 = v14;
    __int16 v18 = 2114;
    v19 = v13;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_error_impl(&dword_2099F8000, v11, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion was not asserted with reason %{public}@; existing reasons: %{public}@",
      (uint8_t *)&v16,
      0x1Cu);

    goto LABEL_11;
  }
  unsigned int v9 = v6 & ~v8;
  v10 = [NSNumber numberWithUnsignedInt:v9];
  [v3 setObject:v10 forKeyedSubscript:v2];

  if (!v9)
  {
    [v3 removeObjectForKey:v2];
    [*(id *)(a1 + 32) _endBackgroundTaskIfNeeded];
  }
LABEL_9:
}

- (void)_endBackgroundTaskIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(CAMPowerController *)self _assertionsByIdentifier];
  if (![v3 count])
  {
    unint64_t v4 = *MEMORY[0x263F833E0];
    if (self->__backgroundTaskIdentifier != *MEMORY[0x263F833E0])
    {
      v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t backgroundTaskIdentifier = self->__backgroundTaskIdentifier;
        int v8 = 134217984;
        unint64_t v9 = backgroundTaskIdentifier;
        _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "PowerController: Ending background task: %ld", (uint8_t *)&v8, 0xCu);
      }

      unsigned int v7 = [MEMORY[0x263F82438] sharedApplication];
      [v7 endBackgroundTask:self->__backgroundTaskIdentifier];

      self->__unint64_t backgroundTaskIdentifier = v4;
    }
  }
}

uint64_t __26__CAMPowerController_init__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 12));
}

- (void)dealloc
{
  int v3 = [(CAMPowerController *)self _powerPressureNotificationToken];
  if ((v3 & 0x80000000) == 0) {
    notify_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMPowerController;
  [(CAMPowerController *)&v4 dealloc];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v3 = [(CAMPowerController *)self _assertionsByIdentifier];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        os_log_t v11 = [v5 objectForKeyedSubscript:v10];
        unsigned int v12 = [v11 intValue];

        id v13 = NSStringFromCAMPowerAssertionReasonBitfield(v12);
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  int v14 = [NSString stringWithFormat:@"<%@ backgroundTaskIdentifier:%ld assertions:%@>", objc_opt_class(), -[CAMPowerController _backgroundTaskIdentifier](self, "_backgroundTaskIdentifier"), v4];

  return v14;
}

void __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke_cold_1(a1, v2);
  }
}

- (unsigned)powerPressureLevel
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  objc_initWeak(&location, self);
  int v3 = [(CAMPowerController *)self _powerControllerQueue];
  objc_copyWeak(&v5, &location);
  pl_dispatch_sync();

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __40__CAMPowerController_powerPressureLevel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "_powerControllerQueue_powerPressureLevel");
}

- (unint64_t)_backgroundTaskIdentifier
{
  return self->__backgroundTaskIdentifier;
}

- (int)_powerPressureNotificationToken
{
  return self->__powerPressureNotificationToken;
}

- (unsigned)_powerControllerQueue_powerPressureLevel
{
  return self->__powerControllerQueue_powerPressureLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__powerControllerQueue, 0);
  objc_storeStrong((id *)&self->__assertionsByIdentifier, 0);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "PowerController: Unable to register for power pressure notification: %d", (uint8_t *)v2, 8u);
}

void __26__CAMPowerController_init__block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "PowerController: Unable to get power pressure notification state: %d", (uint8_t *)v2, 8u);
}

void __50__CAMPowerController__startBackgroundTaskIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "PowerController: A power assertion expired without finishing! Assertions active: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __60__CAMPowerController_addAssertionForIndentifier_withReason___block_invoke_cold_1(int *a1, int *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *a1;
  uint64_t v5 = NSStringFromCAMPowerAssertionReason(*a2);
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2114;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "PowerController %d: Power assertion %{public}@ already exists", (uint8_t *)v6, 0x12u);
}

@end