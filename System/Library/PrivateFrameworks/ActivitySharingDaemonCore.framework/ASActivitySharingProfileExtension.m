@interface ASActivitySharingProfileExtension
+ (id)activitySharingManagerForProfile:(id)a3;
- (ASActivitySharingManager)activitySharingManager;
- (ASActivitySharingProfileExtension)initWithProfile:(id)a3;
- (ASDaemonWakeCoordinator)daemonWakeCoordinator;
- (ASDatabaseClient)databaseClient;
- (HDProfile)profile;
- (id)allFriends;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)setActivitySharingManager:(id)a3;
- (void)setDaemonWakeCoordinator:(id)a3;
- (void)setDatabaseClient:(id)a3;
@end

@implementation ASActivitySharingProfileExtension

- (ASActivitySharingProfileExtension)initWithProfile:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ASActivitySharingProfileExtension;
  v5 = [(ASActivitySharingProfileExtension *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    int v7 = ASActivitySharingDaemonEnabled();
    if (v7)
    {
      v8 = [ASDaemonWakeCoordinator alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
      uint64_t v10 = [(ASDaemonWakeCoordinator *)v8 initWithProfile:WeakRetained];
      daemonWakeCoordinator = v6->_daemonWakeCoordinator;
      v6->_daemonWakeCoordinator = (ASDaemonWakeCoordinator *)v10;
    }
    else
    {
      v12 = [ASDatabaseClient alloc];
      id v13 = objc_loadWeakRetained((id *)&v6->_profile);
      uint64_t v14 = [(ASDatabaseClient *)v12 initWithProfile:v13];
      databaseClient = v6->_databaseClient;
      v6->_databaseClient = (ASDatabaseClient *)v14;

      v16 = [ASActivitySharingManager alloc];
      v17 = v6->_databaseClient;
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
      daemonWakeCoordinator = [WeakRetained daemon];
      v18 = [daemonWakeCoordinator behavior];
      uint64_t v19 = -[ASActivitySharingManager initWithDatabaseClient:isWatch:](v16, "initWithDatabaseClient:isWatch:", v17, [v18 isAppleWatch]);
      activitySharingManager = v6->_activitySharingManager;
      v6->_activitySharingManager = (ASActivitySharingManager *)v19;
    }
    id v21 = objc_loadWeakRetained((id *)&v6->_profile);
    v22 = [v21 daemon];
    [v22 registerForDaemonReady:v6];

    ASLoggingInitialize();
    v23 = (void *)*MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v30 = v25;
      __int16 v31 = 1024;
      int v32 = v7;
      id v26 = v25;
      _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "[%@] Activity Sharing profile extension instantiated; daemon enabled %d",
        buf,
        0x12u);
    }
  }

  return v6;
}

+ (id)activitySharingManagerForProfile:(id)a3
{
  v3 = [a3 profileExtensionWithIdentifier:*MEMORY[0x263F23D70]];
  id v4 = [v3 activitySharingManager];

  return v4;
}

- (id)allFriends
{
  return [(ASActivitySharingManager *)self->_activitySharingManager allFriends];
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  [v4 addProtectedDataObserver:self];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(MEMORY[0x263F087C8], "defaultCenter", a3);
  uint64_t v6 = *MEMORY[0x263F23D78];
  uint64_t v9 = *MEMORY[0x263F23D80];
  int v7 = [NSNumber numberWithBool:v4];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 postNotificationName:v6 object:0 userInfo:v8];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (ASActivitySharingManager)activitySharingManager
{
  return self->_activitySharingManager;
}

- (void)setActivitySharingManager:(id)a3
{
}

- (ASDatabaseClient)databaseClient
{
  return self->_databaseClient;
}

- (void)setDatabaseClient:(id)a3
{
}

- (ASDaemonWakeCoordinator)daemonWakeCoordinator
{
  return self->_daemonWakeCoordinator;
}

- (void)setDaemonWakeCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonWakeCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseClient, 0);
  objc_storeStrong((id *)&self->_activitySharingManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end