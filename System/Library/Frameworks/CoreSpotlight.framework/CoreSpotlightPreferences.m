@interface CoreSpotlightPreferences
- (BOOL)notifyStart;
- (NSString)state_key;
- (OS_dispatch_queue)notifyQueue;
- (const)notification_key;
- (id)notifyHandler;
- (id)notify_handler;
- (int)notifyToken;
- (void)dealloc;
- (void)handlePreferencesChanged;
- (void)notifyStart;
- (void)saveState:(id)a3;
- (void)setNotification_key:(const char *)a3;
- (void)setNotifyHandler:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setState_key:(id)a3;
@end

@implementation CoreSpotlightPreferences

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyStart
{
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken)
  {
    uint32_t v3 = 1000000;
  }
  else
  {
    v5 = [(CoreSpotlightPreferences *)self notifyQueue];
    if (v5
      && ([(CoreSpotlightPreferences *)self notifyHandler],
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      id location = 0;
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __39__CoreSpotlightPreferences_notifyStart__block_invoke;
      v12[3] = &unk_1E554CD40;
      objc_copyWeak(&v13, &location);
      v7 = _Block_copy(v12);
      id notify_handler = self->_notify_handler;
      self->_id notify_handler = v7;

      uint32_t v3 = notify_register_dispatch(self->_notification_key, p_notifyToken, v5, self->_notify_handler);
      if (v3)
      {
        v9 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[CoreSpotlightPreferences notifyStart]();
        }

        int *p_notifyToken = 0;
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      uint32_t v3 = notify_register_check(self->_notification_key, p_notifyToken);
      if (v3)
      {
        v10 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CoreSpotlightPreferences notifyStart]();
        }

        int *p_notifyToken = 0;
      }
    }
  }
  return v3 == 0;
}

void __39__CoreSpotlightPreferences_notifyStart__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlePreferencesChanged];
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CoreSpotlightPreferences;
  [(CoreSpotlightPreferences *)&v4 dealloc];
}

- (void)handlePreferencesChanged
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint32_t v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    state_key = self->_state_key;
    int v6 = 138412290;
    v7 = state_key;
    _os_log_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_INFO, "prefs changed for %@", (uint8_t *)&v6, 0xCu);
  }

  CFPreferencesSynchronize((CFStringRef)self->_state_key, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  notifyHandler = (void (**)(void))self->_notifyHandler;
  if (notifyHandler) {
    notifyHandler[2]();
  }
}

- (void)saveState:(id)a3
{
  CFPreferencesSetValue((CFStringRef)self->_state_key, a3, @"com.apple.corespotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  notification_key = self->_notification_key;

  notify_post(notification_key);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (id)notifyHandler
{
  return self->_notifyHandler;
}

- (void)setNotifyHandler:(id)a3
{
}

- (id)notify_handler
{
  return self->_notify_handler;
}

- (NSString)state_key
{
  return self->_state_key;
}

- (void)setState_key:(id)a3
{
}

- (const)notification_key
{
  return self->_notification_key;
}

- (void)setNotification_key:(const char *)a3
{
  self->_notification_key = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state_key, 0);
  objc_storeStrong(&self->_notify_handler, 0);
  objc_storeStrong(&self->_notifyHandler, 0);

  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

- (void)notifyStart
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_11(&dword_18D0E3000, v0, v1, "notify_register_dispatch for %s returned %u", v2, v3);
}

@end