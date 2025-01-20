@interface DPCDaemonClient
- (DPCDaemonClient)initWithDelegate:(id)a3;
- (DPCWatchPresenceDelegate)delegate;
- (float)currentProbablity;
- (unint64_t)currentWatchPresenceStatus;
- (void)informDelegateWithError:(unint64_t)a3;
- (void)informDelegateWithLatestEvent;
- (void)informDelegateWithWatchStatusEvent:(unint64_t)a3;
- (void)newErrorDetected:(unint64_t)a3;
- (void)newWatchPresenceEvent:(unint64_t)a3 probability:(float)a4;
- (void)setCurrentProbablity:(float)a3;
- (void)setCurrentWatchPresenceStatus:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DPCDaemonClient

- (DPCDaemonClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCDaemonClient;
  v5 = [(DPCDaemonClient *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(DPCDaemonClient *)v6 setCurrentWatchPresenceStatus:1];
  }

  return v6;
}

- (void)informDelegateWithLatestEvent
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = [(DPCDaemonClient *)self currentWatchPresenceStatus];
    v5 = "Presence";
    if (v4 == 2) {
      v5 = "Absence";
    }
    int v8 = 136315138;
    v9 = v5;
    _os_log_impl(&dword_229386000, v3, OS_LOG_TYPE_INFO, "Notifying delegate with watch is %s", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "managerDidDetectEvent:", -[DPCDaemonClient currentWatchPresenceStatus](self, "currentWatchPresenceStatus"));
  }
}

- (void)informDelegateWithError:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (a3 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Undefined error (%ld)", a3);
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_264864388[a3];
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_229386000, v6, OS_LOG_TYPE_INFO, "Notifying delegate with the error is %@", buf, 0xCu);
    }
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 managerDidFindError:a3];
  }
}

- (void)informDelegateWithWatchStatusEvent:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (a3 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Undefined event (%ld)", a3);
          uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v10 = off_2648643B8[a3];
        }
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl(&dword_229386000, v9, OS_LOG_TYPE_INFO, "Notifying delegate with the watch status event: %@", buf, 0xCu);
      }
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 managerDidDetectWatchStatusEvent:a3];
    }
  }
}

- (void)newWatchPresenceEvent:(unint64_t)a3 probability:(float)a4
{
  [(DPCDaemonClient *)self setCurrentWatchPresenceStatus:a3];
  *(float *)&double v6 = a4;
  [(DPCDaemonClient *)self setCurrentProbablity:v6];
  [(DPCDaemonClient *)self informDelegateWithLatestEvent];
}

- (void)newErrorDetected:(unint64_t)a3
{
  self->_currentError = a3;
  -[DPCDaemonClient informDelegateWithError:](self, "informDelegateWithError:");
}

- (DPCWatchPresenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DPCWatchPresenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)currentWatchPresenceStatus
{
  return self->_currentWatchPresenceStatus;
}

- (void)setCurrentWatchPresenceStatus:(unint64_t)a3
{
  self->_currentWatchPresenceStatus = a3;
}

- (float)currentProbablity
{
  return self->_currentProbablity;
}

- (void)setCurrentProbablity:(float)a3
{
  self->_currentProbablity = a3;
}

- (void).cxx_destruct
{
}

@end