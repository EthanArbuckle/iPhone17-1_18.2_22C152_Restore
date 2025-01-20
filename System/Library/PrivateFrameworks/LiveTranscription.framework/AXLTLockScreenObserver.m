@interface AXLTLockScreenObserver
- (AXLTLockScreenObserver)init;
- (AXLTLockScreenObserverDelegate)delegate;
- (void)_registerScreenNotification;
- (void)_updateScreenLock:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXLTLockScreenObserver

- (AXLTLockScreenObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXLTLockScreenObserver;
  v2 = [(AXLTLockScreenObserver *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXLTLockScreenObserver *)v2 _registerScreenNotification];
  }
  return v3;
}

- (void)_registerScreenNotification
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AXLTLockScreenObserver__registerScreenNotification__block_invoke;
  v7[3] = &unk_264E39C28;
  objc_copyWeak(&v8, &location);
  v3 = (void (**)(void, void))MEMORY[0x23ECDEA10](v7);
  p_notifyLockStateToken = &self->_notifyLockStateToken;
  objc_super v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  LODWORD(v5) = notify_register_dispatch("com.apple.springboard.lockstate", p_notifyLockStateToken, v5, v3);

  if (v5) {
    int *p_notifyLockStateToken = -1;
  }
  else {
    v3[2](v3, *p_notifyLockStateToken);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__AXLTLockScreenObserver__registerScreenNotification__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    [WeakRetained _updateScreenLock:state64];
  }
}

- (void)_updateScreenLock:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = AXLogLiveTranscription();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithInt:v3];
    int v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_23C242000, v5, OS_LOG_TYPE_INFO, "Updating system lock status: %@", (uint8_t *)&v14, 0xCu);
  }
  if (self->_isScreenLocked != v3)
  {
    self->_BOOL isScreenLocked = v3 != 0;
    v7 = [(AXLTLockScreenObserver *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(AXLTLockScreenObserver *)self delegate];
      [v9 screenLockStateChanged:self->_isScreenLocked];
    }
    BOOL isScreenLocked = self->_isScreenLocked;
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    v12 = v11;
    if (isScreenLocked) {
      v13 = @"AXLTScreenLockedNotification";
    }
    else {
      v13 = @"AXLTScreenUnlockedNotification";
    }
    [v11 postNotificationName:v13 object:0];
  }
}

- (AXLTLockScreenObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXLTLockScreenObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end