@interface ACXPairedSyncAppInstaller
- (ACXCompanionSyncConnection)connection;
- (ACXPairedSyncAppInstaller)initWithSyncSession:(id)a3 forConnection:(id)a4 delegate:(id)a5;
- (ACXPairedSyncAppInstallerDelegate)delegate;
- (BOOL)gizmoSupportsRemoteAppList;
- (BOOL)waitingForInstallList;
- (NSMutableSet)appsPendingInstallOnGizmo;
- (OS_dispatch_queue)queue;
- (PSYServiceSyncSession)syncSession;
- (int)gizmoAppsChangedNotificationToken;
- (void)_onQueue_applicationsChanged;
- (void)_onQueue_checkIfPendingInstallAppsAreInstalledInRemoteAppList:(id)a3;
- (void)_onQueue_completeSyncIfDone;
- (void)_registerForAppsChangedNotification;
- (void)_unregisterForAppsChangedNotification;
- (void)applicationsAdded:(id)a3;
- (void)applicationsRemoved:(id)a3;
- (void)applicationsUpdated:(id)a3;
- (void)dealloc;
- (void)reportAppInstallFailureForBundleID:(id)a3;
- (void)resyncCompleted;
- (void)setAppsPendingInstallOnGizmo:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGizmoAppsChangedNotificationToken:(int)a3;
- (void)setSyncSession:(id)a3;
- (void)setWaitingForInstallList:(BOOL)a3;
- (void)start;
@end

@implementation ACXPairedSyncAppInstaller

- (ACXPairedSyncAppInstaller)initWithSyncSession:(id)a3 forConnection:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACXPairedSyncAppInstaller;
  v12 = [(ACXPairedSyncAppInstaller *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_syncSession, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    v14 = [v10 device];
    v13->_gizmoSupportsRemoteAppList = [v14 supportsRemoteAppList];

    v13->_gizmoAppsChangedNotificationToken = -1;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.appconduit.ACXPairedSyncAppInstaller", v15);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v13->_waitingForInstallList = 1;
  }

  return v13;
}

- (void)dealloc
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  [(ACXPairedSyncAppInstaller *)self _unregisterForAppsChangedNotification];
  v3.receiver = self;
  v3.super_class = (Class)ACXPairedSyncAppInstaller;
  [(ACXPairedSyncAppInstaller *)&v3 dealloc];
}

- (void)start
{
  if ([(ACXPairedSyncAppInstaller *)self gizmoSupportsRemoteAppList])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    objc_super v3 = [(ACXPairedSyncAppInstaller *)self connection];
    v4 = [v3 availableSystemAppList];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A2F0;
    v10[3] = &unk_10008D3B8;
    v10[4] = self;
    [v4 waitForInstallableSystemAppBundleIDs:v10];
  }
  else
  {
    [(ACXPairedSyncAppInstaller *)self _registerForAppsChangedNotification];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    v5 = +[ACXAvailableApplicationManager sharedApplicationManager];
    v6 = [v5 bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix];

    v7 = [(ACXPairedSyncAppInstaller *)self connection];
    v8 = [v6 allObjects];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001A4F0;
    v9[3] = &unk_10008D3E0;
    v9[4] = self;
    [v7 installSystemApplicationsWithBundleIDs:v8 withCompletion:v9];
  }
}

- (void)reportAppInstallFailureForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(ACXPairedSyncAppInstaller *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A78C;
  v7[3] = &unk_10008CC28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (void)_onQueue_checkIfPendingInstallAppsAreInstalledInRemoteAppList:(id)a3
{
  id v4 = a3;
  v5 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v20 = self;
  v7 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        unsigned int v13 = [v4 applicationIsInstalledWithBundleID:v12 error:&v21];
        id v14 = v21;
        v15 = v14;
        if (v13)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v19 = v12;
            MOLogWrite();
          }
          objc_msgSend(v6, "addObject:", v12, v19);
        }
        else if (v14)
        {
          dispatch_queue_t v16 = [v14 domain];
          if (([v16 isEqualToString:@"ACXErrorDomain"] & 1) == 0)
          {

LABEL_18:
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
              MOLogWrite();
            }

            goto LABEL_22;
          }
          id v17 = [v15 code];

          if (v17 != (id)19) {
            goto LABEL_18;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  v18 = [(ACXPairedSyncAppInstaller *)v20 appsPendingInstallOnGizmo];
  [v18 minusSet:v6];

  [(ACXPairedSyncAppInstaller *)v20 _onQueue_completeSyncIfDone];
}

- (void)_registerForAppsChangedNotification
{
  objc_super v3 = (const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String];
  id v4 = [(ACXPairedSyncAppInstaller *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001AB3C;
  handler[3] = &unk_10008D408;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_gizmoAppsChangedNotificationToken, v4, handler);
}

- (void)_unregisterForAppsChangedNotification
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  int gizmoAppsChangedNotificationToken = self->_gizmoAppsChangedNotificationToken;
  if (gizmoAppsChangedNotificationToken != -1)
  {
    notify_cancel(gizmoAppsChangedNotificationToken);
    self->_int gizmoAppsChangedNotificationToken = -1;
  }
  if ([(ACXPairedSyncAppInstaller *)self gizmoSupportsRemoteAppList])
  {
    id v6 = [(ACXPairedSyncAppInstaller *)self connection];
    id v4 = [v6 remoteAppList];
    v5 = [(ACXPairedSyncAppInstaller *)self queue];
    [v4 removeObserver:self queue:v5];
  }
}

- (void)_onQueue_completeSyncIfDone
{
  objc_super v3 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXPairedSyncAppInstaller *)self waitingForInstallList])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
    }
  }
  else
  {
    uint64_t v4 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
    if (v4
      && (v5 = (void *)v4,
          [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo],
          id v6 = objc_claimAutoreleasedReturnValue(),
          id v7 = [v6 count],
          v6,
          v5,
          v7))
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v10 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      id v8 = [(ACXPairedSyncAppInstaller *)self delegate];
      id v9 = [(ACXPairedSyncAppInstaller *)self syncSession];
      [v8 installCompleteForSyncSession:v9];

      [(ACXPairedSyncAppInstaller *)self _unregisterForAppsChangedNotification];
    }
  }
}

- (void)_onQueue_applicationsChanged
{
  objc_super v3 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = +[ACXGizmoStateManager sharedStateManager];
  v5 = [(ACXPairedSyncAppInstaller *)self connection];
  id v6 = [v5 device];
  id v7 = [v4 stateForDevice:v6];

  id v8 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v7 installStatusForApp:v14] == (id)2) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
  [v15 minusSet:v8];

  [(ACXPairedSyncAppInstaller *)self _onQueue_completeSyncIfDone];
}

- (void)applicationsAdded:(id)a3
{
  id v4 = a3;
  v5 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 bundleIdentifier];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v14 = v12;
          MOLogWrite();
        }
        if (objc_msgSend(v11, "isDeletable", v14) && objc_msgSend(v11, "isSystemApp"))
        {
          unsigned int v13 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
          [v13 removeObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(ACXPairedSyncAppInstaller *)self _onQueue_completeSyncIfDone];
}

- (void)applicationsRemoved:(id)a3
{
  id v4 = a3;
  v5 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          MOLogWrite();
        }
        uint64_t v12 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
        [v12 removeObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ACXPairedSyncAppInstaller *)self _onQueue_completeSyncIfDone];
}

- (void)applicationsUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 bundleIdentifier];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          long long v14 = v12;
          MOLogWrite();
        }
        if (objc_msgSend(v11, "isDeletable", v14) && objc_msgSend(v11, "isSystemApp"))
        {
          uint64_t v13 = [(ACXPairedSyncAppInstaller *)self appsPendingInstallOnGizmo];
          [v13 removeObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(ACXPairedSyncAppInstaller *)self _onQueue_completeSyncIfDone];
}

- (void)resyncCompleted
{
  objc_super v3 = [(ACXPairedSyncAppInstaller *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(ACXPairedSyncAppInstaller *)self connection];
  id v4 = [v5 remoteAppList];
  [(ACXPairedSyncAppInstaller *)self _onQueue_checkIfPendingInstallAppsAreInstalledInRemoteAppList:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PSYServiceSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (ACXCompanionSyncConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableSet)appsPendingInstallOnGizmo
{
  return self->_appsPendingInstallOnGizmo;
}

- (void)setAppsPendingInstallOnGizmo:(id)a3
{
}

- (ACXPairedSyncAppInstallerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXPairedSyncAppInstallerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)gizmoAppsChangedNotificationToken
{
  return self->_gizmoAppsChangedNotificationToken;
}

- (void)setGizmoAppsChangedNotificationToken:(int)a3
{
  self->_int gizmoAppsChangedNotificationToken = a3;
}

- (BOOL)gizmoSupportsRemoteAppList
{
  return self->_gizmoSupportsRemoteAppList;
}

- (BOOL)waitingForInstallList
{
  return self->_waitingForInstallList;
}

- (void)setWaitingForInstallList:(BOOL)a3
{
  self->_waitingForInstallList = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appsPendingInstallOnGizmo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end