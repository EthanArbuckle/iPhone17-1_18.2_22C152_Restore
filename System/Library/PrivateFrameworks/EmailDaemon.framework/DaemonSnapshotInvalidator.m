@interface DaemonSnapshotInvalidator
+ (OS_os_log)log;
- (BOOL)isEnabled;
- (DaemonSnapshotInvalidationHandler)invalidationHandler;
- (DaemonSnapshotInvalidator)initWithApplicationBundleIdentifier:(id)a3 hookRegistry:(id)a4 remoteClientsProvider:(id)a5 focusController:(id)a6;
- (DaemonSnapshotInvalidator)initWithApplicationBundleIdentifier:(id)a3 hookRegistry:(id)a4 remoteClientsProvider:(id)a5 focusController:(id)a6 invalidationHandler:(id)a7;
- (EDServerRemoteClientsProvider)remoteClientsProvider;
- (NSString)applicationBundleID;
- (void)accountsChanged:(id)a3;
- (void)accountsRemoved:(id)a3;
- (void)currentFocusChanged:(id)a3;
- (void)deleteSnapshotsForBundleIdentifier:(id)a3;
- (void)setApplicationBundleID:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteClientsProvider:(id)a3;
@end

@implementation DaemonSnapshotInvalidator

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001403C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B780 != -1) {
    dispatch_once(&qword_10016B780, block);
  }
  v2 = (void *)qword_10016B778;

  return (OS_os_log *)v2;
}

- (DaemonSnapshotInvalidator)initWithApplicationBundleIdentifier:(id)a3 hookRegistry:(id)a4 remoteClientsProvider:(id)a5 focusController:(id)a6
{
  return [(DaemonSnapshotInvalidator *)self initWithApplicationBundleIdentifier:a3 hookRegistry:a4 remoteClientsProvider:a5 focusController:a6 invalidationHandler:self];
}

- (DaemonSnapshotInvalidator)initWithApplicationBundleIdentifier:(id)a3 hookRegistry:(id)a4 remoteClientsProvider:(id)a5 focusController:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)DaemonSnapshotInvalidator;
  v17 = [(DaemonSnapshotInvalidator *)&v22 init];
  if (v17)
  {
    v18 = (NSString *)[v12 copy];
    applicationBundleID = v17->_applicationBundleID;
    v17->_applicationBundleID = v18;

    objc_storeStrong((id *)&v17->_remoteClientsProvider, a5);
    [v13 registerAccountChangeHookResponder:v17];
    objc_storeWeak((id *)&v17->_invalidationHandler, v16);
    id v20 = [v15 addObserver:v17 currentFocus:0];
    [(DaemonSnapshotInvalidator *)v17 setEnabled:1];
  }

  return v17;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    v5 = +[DaemonSnapshotInvalidator log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(DaemonSnapshotInvalidator *)self applicationBundleID];
      v7 = (void *)v6;
      CFStringRef v8 = @"Disabled";
      if (v3) {
        CFStringRef v8 = @"Enabled";
      }
      int v9 = 138543618;
      CFStringRef v10 = v8;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ monitoring for snapshot invalidation events for bundleID %{public}@", (uint8_t *)&v9, 0x16u);
    }
    self->_enabled = v3;
  }
}

- (void)deleteSnapshotsForBundleIdentifier:(id)a3
{
  v4 = [(DaemonSnapshotInvalidator *)self remoteClientsProvider];
  v5 = [v4 remoteClients];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014594;
  v19[3] = &unk_10013A360;
  v19[4] = self;
  uint64_t v6 = objc_msgSend(v5, "ef_filter:", v19);

  v7 = +[DaemonSnapshotInvalidator log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    int v9 = [(DaemonSnapshotInvalidator *)self applicationBundleID];
    *(_DWORD *)buf = 134218242;
    id v22 = v8;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resume remote clients (%lu) with bundleID: %{public}@", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "clientResumer", (void)v15);
        [v14 resumeForUpdates];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)accountsRemoved:(id)a3
{
  if ([(DaemonSnapshotInvalidator *)self isEnabled])
  {
    id v5 = [(DaemonSnapshotInvalidator *)self invalidationHandler];
    v4 = [(DaemonSnapshotInvalidator *)self applicationBundleID];
    [v5 deleteSnapshotsForBundleIdentifier:v4];
  }
}

- (void)accountsChanged:(id)a3
{
  if ([(DaemonSnapshotInvalidator *)self isEnabled])
  {
    id v5 = [(DaemonSnapshotInvalidator *)self invalidationHandler];
    v4 = [(DaemonSnapshotInvalidator *)self applicationBundleID];
    [v5 deleteSnapshotsForBundleIdentifier:v4];
  }
}

- (void)currentFocusChanged:(id)a3
{
  if ([(DaemonSnapshotInvalidator *)self isEnabled])
  {
    id v5 = [(DaemonSnapshotInvalidator *)self invalidationHandler];
    v4 = [(DaemonSnapshotInvalidator *)self applicationBundleID];
    [v5 deleteSnapshotsForBundleIdentifier:v4];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)setApplicationBundleID:(id)a3
{
}

- (DaemonSnapshotInvalidationHandler)invalidationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationHandler);

  return (DaemonSnapshotInvalidationHandler *)WeakRetained;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (EDServerRemoteClientsProvider)remoteClientsProvider
{
  return self->_remoteClientsProvider;
}

- (void)setRemoteClientsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClientsProvider, 0);
  objc_destroyWeak((id *)&self->_invalidationHandler);

  objc_storeStrong((id *)&self->_applicationBundleID, 0);
}

@end