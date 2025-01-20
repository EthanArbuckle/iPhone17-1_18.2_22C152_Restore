@interface HUCCLockStateHandler
- (BOOL)_isAccessAllowedForCurrentLockState;
- (BOOL)isDeviceUnlocked;
- (HUCCLockStateHandler)initWithDelegate:(id)a3;
- (HUCCLockStateHandlerDelegate)delegate;
- (int)keybagLockStatusNotifyToken;
- (void)_registerKeybagLockStatusNotifications;
- (void)_unregisterKeybagLockStatusNotifications;
- (void)_updateAccessAllowedForLockState;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setKeybagLockStatusNotifyToken:(int)a3;
@end

@implementation HUCCLockStateHandler

- (HUCCLockStateHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCCLockStateHandler;
  v5 = [(HUCCLockStateHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_keybagLockStatusNotifyToken = -1;
    objc_msgSend__registerKeybagLockStatusNotifications(v6, v7, v8);
  }

  return v6;
}

- (void)dealloc
{
  objc_msgSend__unregisterKeybagLockStatusNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)HUCCLockStateHandler;
  [(HUCCLockStateHandler *)&v4 dealloc];
}

- (BOOL)isDeviceUnlocked
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_24065C000, v2, OS_LOG_TYPE_DEFAULT, "Checking if device is unlocked", (uint8_t *)v7, 2u);
  }

  int v3 = MKBGetDeviceLockState();
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_24065C000, v4, OS_LOG_TYPE_DEFAULT, "Lock state is %d", (uint8_t *)v7, 8u);
  }

  return !v3 || v3 == 3;
}

- (BOOL)_isAccessAllowedForCurrentLockState
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "Checking if access is allowed for current lock state", buf, 2u);
  }

  v6 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v4, v5);
  v9 = objc_msgSend_homeManager(v6, v7, v8);
  int isAccessAllowedWhenLocked = objc_msgSend_isAccessAllowedWhenLocked(v9, v10, v11);

  v13 = HFLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (isAccessAllowedWhenLocked)
  {
    if (v14)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_24065C000, v13, OS_LOG_TYPE_DEFAULT, "Home manager doesn't care about lock state, returning YES", v19, 2u);
    }

    return 1;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_24065C000, v13, OS_LOG_TYPE_DEFAULT, "Home manager does care, checking lock state", v18, 2u);
    }

    return objc_msgSend_isDeviceUnlocked(self, v16, v17);
  }
}

- (void)_registerKeybagLockStatusNotifications
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "Registering for lock state notifications", (uint8_t *)buf, 2u);
  }

  if (objc_msgSend_keybagLockStatusNotifyToken(self, v4, v5) == -1)
  {
    objc_initWeak(buf, self);
    v6 = (const char *)*MEMORY[0x263F55A78];
    v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_24066620C;
    handler[3] = &unk_2650CC240;
    objc_copyWeak(&v10, buf);
    notify_register_dispatch(v6, &self->_keybagLockStatusNotifyToken, v7, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)_unregisterKeybagLockStatusNotifications
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering lock state notifications", v10, 2u);
  }

  if (objc_msgSend_keybagLockStatusNotifyToken(self, v4, v5) != -1)
  {
    int v8 = objc_msgSend_keybagLockStatusNotifyToken(self, v6, v7);
    notify_cancel(v8);
    objc_msgSend_setKeybagLockStatusNotifyToken_(self, v9, 0xFFFFFFFFLL);
  }
}

- (void)_updateAccessAllowedForLockState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t isAccessAllowedForCurrentLockState = objc_msgSend__isAccessAllowedForCurrentLockState(self, a2, v2);
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = isAccessAllowedForCurrentLockState;
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "Access allowed for current lock state is %d, updating delegate", (uint8_t *)v10, 8u);
  }

  int v8 = objc_msgSend_delegate(self, v6, v7);
  objc_msgSend_lockStateWasUpdated_(v8, v9, isAccessAllowedForCurrentLockState);
}

- (int)keybagLockStatusNotifyToken
{
  return self->_keybagLockStatusNotifyToken;
}

- (void)setKeybagLockStatusNotifyToken:(int)a3
{
  self->_keybagLockStatusNotifyToken = a3;
}

- (HUCCLockStateHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCLockStateHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end