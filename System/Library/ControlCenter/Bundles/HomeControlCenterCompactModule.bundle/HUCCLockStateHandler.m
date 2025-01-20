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
  v8.receiver = self;
  v8.super_class = (Class)HUCCLockStateHandler;
  v5 = [(HUCCLockStateHandler *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_keybagLockStatusNotifyToken = -1;
    [(HUCCLockStateHandler *)v6 _registerKeybagLockStatusNotifications];
  }

  return v6;
}

- (void)dealloc
{
  [(HUCCLockStateHandler *)self _unregisterKeybagLockStatusNotifications];
  v3.receiver = self;
  v3.super_class = (Class)HUCCLockStateHandler;
  [(HUCCLockStateHandler *)&v3 dealloc];
}

- (BOOL)isDeviceUnlocked
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_240652000, v2, OS_LOG_TYPE_DEFAULT, "Checking if device is unlocked", (uint8_t *)v7, 2u);
  }

  int v3 = MKBGetDeviceLockState();
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_240652000, v4, OS_LOG_TYPE_DEFAULT, "Lock state is %d", (uint8_t *)v7, 8u);
  }

  return !v3 || v3 == 3;
}

- (BOOL)_isAccessAllowedForCurrentLockState
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_240652000, v3, OS_LOG_TYPE_DEFAULT, "Checking if access is allowed for current lock state", buf, 2u);
  }

  id v4 = [MEMORY[0x263F47B60] sharedDispatcher];
  v5 = [v4 homeManager];
  int v6 = [v5 isAccessAllowedWhenLocked];

  v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_240652000, v7, OS_LOG_TYPE_DEFAULT, "Home manager doesn't care about lock state, returning YES", v11, 2u);
    }

    return 1;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_240652000, v7, OS_LOG_TYPE_DEFAULT, "Home manager does care, checking lock state", v10, 2u);
    }

    return [(HUCCLockStateHandler *)self isDeviceUnlocked];
  }
}

- (void)_registerKeybagLockStatusNotifications
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_240652000, v3, OS_LOG_TYPE_DEFAULT, "Registering for lock state notifications", (uint8_t *)buf, 2u);
  }

  if ([(HUCCLockStateHandler *)self keybagLockStatusNotifyToken] == -1)
  {
    objc_initWeak(buf, self);
    id v4 = (const char *)*MEMORY[0x263F55A78];
    v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_240655E34;
    handler[3] = &unk_2650CB490;
    objc_copyWeak(&v8, buf);
    notify_register_dispatch(v4, &self->_keybagLockStatusNotifyToken, v5, handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_unregisterKeybagLockStatusNotifications
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_240652000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering lock state notifications", v4, 2u);
  }

  if ([(HUCCLockStateHandler *)self keybagLockStatusNotifyToken] != -1)
  {
    notify_cancel([(HUCCLockStateHandler *)self keybagLockStatusNotifyToken]);
    [(HUCCLockStateHandler *)self setKeybagLockStatusNotifyToken:0xFFFFFFFFLL];
  }
}

- (void)_updateAccessAllowedForLockState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HUCCLockStateHandler *)self _isAccessAllowedForCurrentLockState];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_240652000, v4, OS_LOG_TYPE_DEFAULT, "Access allowed for current lock state is %d, updating delegate", (uint8_t *)v6, 8u);
  }

  v5 = [(HUCCLockStateHandler *)self delegate];
  [v5 lockStateWasUpdated:v3];
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