@interface HUSessionManager
- (BOOL)isMacSleep;
- (HUSessionManager)init;
- (HUSessionManagerDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)userLoggedOut:(id)a3;
@end

@implementation HUSessionManager

- (HUSessionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUSessionManager;
  v2 = [(HUSessionManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HUSessionManager *)v2 registerForSessionNotifications];
  }
  return v3;
}

- (void)dealloc
{
  [(HUSessionManager *)self unregisterForSessionNotifications];
  v3.receiver = self;
  v3.super_class = (Class)HUSessionManager;
  [(HUSessionManager *)&v3 dealloc];
}

- (void)userLoggedOut:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_20CC86000, v5, OS_LOG_TYPE_DEFAULT, "System status has changed userLoggedOut: %@", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(HUSessionManager *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(HUSessionManager *)self delegate];
    [v9 handleSessionMessage:3 completion:0];
  }
}

- (HUSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isMacSleep
{
  return self->_isMacSleep;
}

- (void).cxx_destruct
{
}

@end