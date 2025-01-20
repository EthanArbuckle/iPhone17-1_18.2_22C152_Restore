@interface GCDaemon
+ (id)createRootWorkloop;
- (GCDaemon)init;
- (id)serviceFor:(id)a3 client:(id)a4;
@end

@implementation GCDaemon

- (GCDaemon)init
{
  v11.receiver = self;
  v11.super_class = (Class)GCDaemon;
  v2 = [(GCDaemon *)&v11 init];
  uint64_t v3 = [(id)objc_opt_class() createRootWorkloop];
  workloop = v2->_workloop;
  v2->_workloop = (OS_dispatch_workloop *)v3;

  uint64_t v5 = objc_opt_new();
  configServiceConnection = v2->_configServiceConnection;
  v2->_configServiceConnection = (GCConfigXPCServiceConnection *)v5;

  [(GCConfigXPCServiceConnection *)v2->_configServiceConnection setClient:v2];
  [(GCIPCRemoteConnection *)v2->_configServiceConnection resume];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __16__GCDaemon_init__block_invoke;
  handler[3] = &unk_26BEC3AB0;
  v7 = v2;
  v10 = v7;
  xpc_activity_register("com.apple.GameController.mobileasset.DB.update", XPC_ACTIVITY_CHECK_IN, handler);

  return v7;
}

void __16__GCDaemon_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) && xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    v4 = _os_activity_create(&dword_20AD04000, "[DB Mobile Asset Manager] Update DB Asset", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    uint64_t v5 = +[GCConfigXPCServiceServiceConnection connection:*(void *)(*(void *)(a1 + 32) + 16) withClient:0];
    v6 = [v5 result];

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __16__GCDaemon_init__block_invoke_2;
    v9[3] = &unk_26BEC3A88;
    id v7 = v3;
    id v10 = v7;
    objc_super v11 = &v12;
    id v8 = [v6 checkForNewAssets:1 forceCatalogRefresh:0 completion:v9];
    v13[3] = xpc_activity_add_eligibility_changed_handler();
    xpc_activity_set_state((xpc_activity_t)v7, 4);

    _Block_object_dispose(&v12, 8);
    os_activity_scope_leave(&state);
  }
}

void __16__GCDaemon_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  xpc_activity_set_completion_status();
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    xpc_activity_remove_eligibility_changed_handler();
  }
}

uint64_t __16__GCDaemon_init__block_invoke_3(uint64_t a1, xpc_activity_t activity)
{
  uint64_t result = xpc_activity_should_defer(activity);
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 cancel];
  }
  return result;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (&unk_26BEED6B8 == v6)
  {
    id v8 = self->_workloop;
  }
  else
  {
    if (&unk_26BEE7B48 == v6)
    {
      v9 = self;
      objc_sync_enter(v9);
      configAssetManagementServiceConnection = v9->_configAssetManagementServiceConnection;
      if (!configAssetManagementServiceConnection)
      {
        objc_super v11 = +[GCConfigXPCServiceServiceConnection connection:v9->_configServiceConnection withClient:v7];
        uint64_t v12 = [v11 result];
        v13 = v9->_configAssetManagementServiceConnection;
        v9->_configAssetManagementServiceConnection = (GCConfigurationAssetManagementServiceConnection *)v12;

        configAssetManagementServiceConnection = v9->_configAssetManagementServiceConnection;
      }
    }
    else
    {
      if (&unk_26BEE8588 != v6)
      {
        id v8 = 0;
        goto LABEL_13;
      }
      v9 = self;
      objc_sync_enter(v9);
      configGenericDeviceDBServiceConnection = v9->_configGenericDeviceDBServiceConnection;
      if (!configGenericDeviceDBServiceConnection
        || [(GCConfigXPCServiceServiceConnection *)configGenericDeviceDBServiceConnection isInvalid])
      {
        uint64_t v15 = +[GCConfigXPCServiceServiceConnection connection:v9->_configServiceConnection withClient:v7];
        uint64_t v16 = [v15 result];
        v17 = v9->_configGenericDeviceDBServiceConnection;
        v9->_configGenericDeviceDBServiceConnection = (_GCGenericDeviceDBServiceConnection *)v16;
      }
      configAssetManagementServiceConnection = v9->_configGenericDeviceDBServiceConnection;
    }
    id v8 = configAssetManagementServiceConnection;
    objc_sync_exit(v9);
  }
LABEL_13:

  return v8;
}

+ (id)createRootWorkloop
{
  dispatch_workloop_t v2 = dispatch_workloop_create("GameController Root Workloop");

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configGenericDeviceDBServiceConnection, 0);
  objc_storeStrong((id *)&self->_configAssetManagementServiceConnection, 0);
  objc_storeStrong((id *)&self->_configServiceConnection, 0);

  objc_storeStrong((id *)&self->_workloop, 0);
}

@end