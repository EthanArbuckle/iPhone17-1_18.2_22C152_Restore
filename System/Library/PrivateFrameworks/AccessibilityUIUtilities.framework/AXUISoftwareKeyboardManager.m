@interface AXUISoftwareKeyboardManager
+ (id)sharedInstance;
- (AXUISoftwareKeyboardManager)init;
- (AXUISoftwareKeyboardManagerDelegate)delegate;
- (BOOL)isHardwareKeyboardAttached;
- (void)_overrideSetHardwareKeyboardAttached:(BOOL)a3;
- (void)_setIsHardwareKeyboardAttached:(BOOL)a3;
- (void)_updateHardwareKeyboardState;
- (void)_wst_setIsHardwareKeyboardAttached:(id)a3;
- (void)addReasonToDisableSoftwareKeyboard:(id)a3;
- (void)addReasonToEnableSoftwareKeyboard:(id)a3;
- (void)dealloc;
- (void)removeReasonToDisableSoftwareKeyboard:(id)a3;
- (void)removeReasonToEnableSoftwareKeyboard:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateKeyboardHardwareState;
@end

@implementation AXUISoftwareKeyboardManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_SoftwareKeyboardManager;
  return v2;
}

uint64_t __45__AXUISoftwareKeyboardManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_SoftwareKeyboardManager;
  sharedInstance_SoftwareKeyboardManager = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (AXUISoftwareKeyboardManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUISoftwareKeyboardManager;
  v2 = [(AXUISoftwareKeyboardManager *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F64CE0]];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v4, 0, (CFNotificationSuspensionBehavior)0);

    [(AXUISoftwareKeyboardManager *)v2 updateKeyboardHardwareState];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXUISoftwareKeyboardManager;
  [(AXUISoftwareKeyboardManager *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(AXUISoftwareKeyboardManager *)self updateKeyboardHardwareState];
}

- (void)updateKeyboardHardwareState
{
  id v3 = [(AXUISoftwareKeyboardManager *)self delegate];
  [v3 softwareKeyboardManagerWillUpdateKeyboardState:self];
}

- (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

- (void)_overrideSetHardwareKeyboardAttached:(BOOL)a3
{
}

- (void)_wst_setIsHardwareKeyboardAttached:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = VOTLogKeyboard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 67109376;
    int v11 = [v4 BOOLValue];
    __int16 v12 = 1024;
    int IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
    _os_log_impl(&dword_1C39D1000, v5, OS_LOG_TYPE_INFO, "setting hardware keyboard attached state: %d [existing %d]", (uint8_t *)&v10, 0xEu);
  }

  uint64_t v6 = [v4 BOOLValue];
  v7 = [(AXUISoftwareKeyboardManager *)self delegate];
  [v7 softwareKeyboardManager:self didSetHardwareKeyboardAttached:v6];

  if (GSEventIsHardwareKeyboardAttached() != v6)
  {
    v8 = [(AXUISoftwareKeyboardManager *)self delegate];
    [v8 softwareKeyboardManagerDidChangeHardwareKeyboardAttached:self];

    GSEventSetHardwareKeyboardAttached();
    v9 = VOTLogKeyboard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      int v11 = v6;
      _os_log_impl(&dword_1C39D1000, v9, OS_LOG_TYPE_DEFAULT, "Set hardware keyboard attached state: %d", (uint8_t *)&v10, 8u);
    }
  }
}

- (void)_setIsHardwareKeyboardAttached:(BOOL)a3
{
}

void __62__AXUISoftwareKeyboardManager__setIsHardwareKeyboardAttached___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  objc_msgSend(v1, "_wst_setIsHardwareKeyboardAttached:", v2);
}

- (void)_updateHardwareKeyboardState
{
  if ([(NSMutableSet *)self->_reasonsToDisableSoftwareKeyboard count])
  {
    id v3 = self;
    uint64_t v4 = 1;
LABEL_5:
    [(AXUISoftwareKeyboardManager *)v3 _setIsHardwareKeyboardAttached:v4];
    return;
  }
  if ([(NSMutableSet *)self->_reasonsToEnableSoftwareKeyboard count])
  {
    id v3 = self;
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v7 = 0;
  v5 = [(AXUISoftwareKeyboardManager *)self delegate];
  int v6 = [v5 softwareKeyboardManagerShouldSetHardwareKeyboardAttached:self hardwareKeyboardIsCurrentlyAttached:GSEventIsHardwareKeyboardAttached() != 0 newHardwareKeyboardAttachedValue:&v7];

  if (v6) {
    [(AXUISoftwareKeyboardManager *)self _setIsHardwareKeyboardAttached:v7];
  }
}

- (void)addReasonToEnableSoftwareKeyboard:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  reasonsToEnableSoftwareKeyboard = self->_reasonsToEnableSoftwareKeyboard;
  if (!reasonsToEnableSoftwareKeyboard)
  {
    int v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unsigned __int8 v7 = self->_reasonsToEnableSoftwareKeyboard;
    self->_reasonsToEnableSoftwareKeyboard = v6;

    reasonsToEnableSoftwareKeyboard = self->_reasonsToEnableSoftwareKeyboard;
  }
  [(NSMutableSet *)reasonsToEnableSoftwareKeyboard addObject:v4];
  v8 = [MEMORY[0x1E4F48350] sharedInstance];
  char v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    int v10 = [MEMORY[0x1E4F48350] identifier];
    int v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      id v15 = v4;
      uint64_t v16 = [(NSMutableSet *)self->_reasonsToEnableSoftwareKeyboard count];
      uint64_t v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1C39D1000, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  [(AXUISoftwareKeyboardManager *)self _updateHardwareKeyboardState];
}

- (void)removeReasonToEnableSoftwareKeyboard:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_reasonsToEnableSoftwareKeyboard removeObject:v4];
  v5 = [MEMORY[0x1E4F48350] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = [MEMORY[0x1E4F48350] identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = AXColorizeFormatLog();
      id v12 = v4;
      uint64_t v13 = [(NSMutableSet *)self->_reasonsToEnableSoftwareKeyboard count];
      int v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl(&dword_1C39D1000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  [(AXUISoftwareKeyboardManager *)self _updateHardwareKeyboardState];
}

- (void)addReasonToDisableSoftwareKeyboard:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  reasonsToDisableSoftwareKeyboard = self->_reasonsToDisableSoftwareKeyboard;
  if (!reasonsToDisableSoftwareKeyboard)
  {
    char v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unsigned __int8 v7 = self->_reasonsToDisableSoftwareKeyboard;
    self->_reasonsToDisableSoftwareKeyboard = v6;

    reasonsToDisableSoftwareKeyboard = self->_reasonsToDisableSoftwareKeyboard;
  }
  [(NSMutableSet *)reasonsToDisableSoftwareKeyboard addObject:v4];
  v8 = [MEMORY[0x1E4F48350] sharedInstance];
  char v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    int v10 = [MEMORY[0x1E4F48350] identifier];
    int v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = AXColorizeFormatLog();
      id v15 = v4;
      uint64_t v16 = [(NSMutableSet *)self->_reasonsToDisableSoftwareKeyboard count];
      uint64_t v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1C39D1000, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  [(AXUISoftwareKeyboardManager *)self _updateHardwareKeyboardState];
}

- (void)removeReasonToDisableSoftwareKeyboard:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_reasonsToDisableSoftwareKeyboard removeObject:v4];
  v5 = [MEMORY[0x1E4F48350] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = [MEMORY[0x1E4F48350] identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = AXColorizeFormatLog();
      id v12 = v4;
      uint64_t v13 = [(NSMutableSet *)self->_reasonsToDisableSoftwareKeyboard count];
      int v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl(&dword_1C39D1000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  [(AXUISoftwareKeyboardManager *)self _updateHardwareKeyboardState];
}

- (AXUISoftwareKeyboardManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXUISoftwareKeyboardManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reasonsToEnableSoftwareKeyboard, 0);
  objc_storeStrong((id *)&self->_reasonsToDisableSoftwareKeyboard, 0);
}

@end