@interface CHPairedSyncCoordinator
- (BOOL)isSessionActive;
- (CHPairedSyncCoordinator)initWithDelegate:(id)a3;
- (CHPairedSyncProtocol)delegate;
- (PSYSyncCoordinator)coordinator;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncComplete;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncFailedWithError:(id)a3;
@end

@implementation CHPairedSyncCoordinator

- (CHPairedSyncCoordinator)initWithDelegate:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHPairedSyncCoordinator;
  v6 = [(CHPairedSyncCoordinator *)&v15 initWithDomain:"CHPairedSyncCoordinator"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    if (objc_opt_class())
    {
      uint64_t v8 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.callhistory"];
      coordinator = v7->_coordinator;
      v7->_coordinator = (PSYSyncCoordinator *)v8;

      [(PSYSyncCoordinator *)v7->_coordinator setDelegate:v7];
      v10 = [(CHPairedSyncCoordinator *)v7 logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v17 = @"com.apple.pairedsync.callhistory";
        v11 = "Registered for Paired Sync Coordinator with service name: %{public}@";
        v12 = v10;
        uint32_t v13 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else
    {
      v10 = [(CHPairedSyncCoordinator *)v7 logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "Skipping Paired Sync Coordinator registration";
        v12 = v10;
        uint32_t v13 = 2;
        goto LABEL_7;
      }
    }
  }
  return v7;
}

- (BOOL)isSessionActive
{
  v2 = [(CHPairedSyncCoordinator *)self coordinator];
  v3 = [v2 activeSyncSession];

  return v3 != 0;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  v6 = [(CHPairedSyncCoordinator *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 sessionIdentifier];
    uint64_t v8 = [v7 UUIDString];
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received Sync Coordinator start session (%{public}@) command", (uint8_t *)&v10, 0xCu);
  }
  if (![v5 syncSessionType])
  {
    v9 = [(CHPairedSyncCoordinator *)self delegate];
    [v9 startInitialSync];
    goto LABEL_7;
  }
  if ([v5 syncSessionType] == (id)1)
  {
    v9 = [(CHPairedSyncCoordinator *)self delegate];
    [v9 startReunionSync];
LABEL_7:
  }
}

- (void)syncComplete
{
  v2 = [(CHPairedSyncCoordinator *)self coordinator];
  id v3 = [v2 activeSyncSession];

  [v3 syncDidComplete];
}

- (void)syncFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(CHPairedSyncCoordinator *)self coordinator];
  id v6 = [v5 activeSyncSession];

  [v6 syncDidFailWithError:v4];
}

- (CHPairedSyncProtocol)delegate
{
  return (CHPairedSyncProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
}

- (PSYSyncCoordinator)coordinator
{
  return (PSYSyncCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end