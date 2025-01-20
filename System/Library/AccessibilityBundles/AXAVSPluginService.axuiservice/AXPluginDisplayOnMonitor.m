@interface AXPluginDisplayOnMonitor
- (AXPluginDisplayOnMonitor)init;
- (AXPluginDisplayOnMonitorDelegate)delegate;
- (BOOL)_queryIsDisplayOn;
- (BOOL)isDisplayOn;
- (int)notifyToken;
- (void)_registerForSpringboardNotifications;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_unregisterForSpringboardNotifications;
- (void)_updateDisplayOnState;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
@end

@implementation AXPluginDisplayOnMonitor

- (AXPluginDisplayOnMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXPluginDisplayOnMonitor;
  v2 = [(AXPluginDisplayOnMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXPluginDisplayOnMonitor *)v2 setNotifyToken:0xFFFFFFFFLL];
  }
  return v3;
}

- (void)dealloc
{
  [(AXPluginDisplayOnMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)AXPluginDisplayOnMonitor;
  [(AXPluginDisplayOnMonitor *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    [(AXPluginDisplayOnMonitor *)self _startMonitoring];
  }
  else
  {
    [(AXPluginDisplayOnMonitor *)self _stopMonitoring];
  }
}

- (void)_startMonitoring
{
  [(AXPluginDisplayOnMonitor *)self _registerForSpringboardNotifications];

  [(AXPluginDisplayOnMonitor *)self _updateDisplayOnState];
}

- (void)_stopMonitoring
{
}

- (void)setDisplayOn:(BOOL)a3
{
  if (self->_displayOn != a3)
  {
    self->_displayOn = a3;
    id v4 = [(AXPluginDisplayOnMonitor *)self delegate];
    objc_msgSend(v4, "displayOnMonitor:didReceiveDisplayOnStateChanged:", self, -[AXPluginDisplayOnMonitor isDisplayOn](self, "isDisplayOn"));
  }
}

- (void)_updateDisplayOnState
{
  BOOL v3 = [(AXPluginDisplayOnMonitor *)self _queryIsDisplayOn];

  [(AXPluginDisplayOnMonitor *)self setDisplayOn:v3];
}

- (BOOL)_queryIsDisplayOn
{
  uint64_t state64 = 0;
  uint64_t state = notify_get_state([(AXPluginDisplayOnMonitor *)self notifyToken], &state64);
  if (state) {
    goto LABEL_2;
  }
  if (!state64) {
    return 1;
  }
  if (state64 != 1)
  {
LABEL_2:
    BOOL v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21E0(state, &state64, v3);
    }

    return 1;
  }
  return 0;
}

- (void)_registerForSpringboardNotifications
{
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_15B4;
  v8[3] = &unk_41F0;
  objc_copyWeak(&v9, &location);
  BOOL v3 = objc_retainBlock(v8);
  int out_token = 0;
  id v4 = &_dispatch_main_q;
  uint32_t v5 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);

  [(AXPluginDisplayOnMonitor *)self setNotifyToken:out_token];
  if (v5)
  {
    v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_22B4(v6);
    }
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_unregisterForSpringboardNotifications
{
  if (notify_is_valid_token([(AXPluginDisplayOnMonitor *)self notifyToken])) {
    notify_cancel([(AXPluginDisplayOnMonitor *)self notifyToken]);
  }

  [(AXPluginDisplayOnMonitor *)self setNotifyToken:0xFFFFFFFFLL];
}

- (BOOL)isDisplayOn
{
  return self->_displayOn;
}

- (AXPluginDisplayOnMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXPluginDisplayOnMonitorDelegate *)WeakRetained;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
}

@end