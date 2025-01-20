@interface GCConfigXPCService
- (GCConfigXPCService)init;
- (id)serviceFor:(id)a3 client:(id)a4;
- (void)connectToAssetManagementServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToGenericDeviceDBServiceWithClient:(id)a3 reply:(id)a4;
@end

@implementation GCConfigXPCService

- (GCConfigXPCService)init
{
  v12.receiver = self;
  v12.super_class = (Class)GCConfigXPCService;
  v2 = [(GCConfigXPCService *)&v12 init];
  uint64_t v3 = GCLookupDispatchWorkloop(v2, 0);
  workloop = v2->_workloop;
  v2->_workloop = (OS_dispatch_workloop *)v3;

  if (!v2->_workloop)
  {
    dispatch_workloop_t v5 = dispatch_workloop_create("GameController Root Workloop");
    v6 = v2->_workloop;
    v2->_workloop = (OS_dispatch_workloop *)v5;
  }
  v7 = [[_GCConfigurationDataManager alloc] initWithProvider:v2];
  configurationManager = v2->_configurationManager;
  v2->_configurationManager = v7;

  v9 = [[_GCGenericDeviceDB alloc] initWithProvider:v2];
  genericDeviceDB = v2->_genericDeviceDB;
  v2->_genericDeviceDB = v9;

  return v2;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  id v5 = a3;
  if (&unk_26BEED6B8 != v5 || (workloop = self->_workloop) == 0)
  {
    if ((id)objc_opt_class() == v5)
    {
      uint64_t v8 = 16;
    }
    else
    {
      if (&unk_26BEE8588 != v5)
      {
        v6 = 0;
        goto LABEL_11;
      }
      uint64_t v8 = 24;
    }
    workloop = *(Class *)((char *)&self->super.isa + v8);
  }
  v6 = workloop;
LABEL_11:

  return v6;
}

- (void)connectToAssetManagementServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, GCConfigurationAssetManagementServiceXPCProxy *, void))a4;
  uint64_t v8 = _os_activity_create(&dword_20AD04000, "[Config Service/XPC] Connect to AssetManagementService", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = GCLookupService(self, (objc_class *)&unk_26BEE7B48, 0, 0);
  if (v9)
  {
    v10 = [[GCConfigurationAssetManagementServiceXPCProxy alloc] initWithService:v9];
    v7[2](v7, v10, 0);
  }
  else
  {
    v13[0] = NSLocalizedDescriptionKey;
    v13[1] = NSLocalizedFailureReasonErrorKey;
    v14[0] = @"Connect to AssetManagementService failed";
    v14[1] = @"Service not found";
    v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    v11 = +[NSError errorWithDomain:@"GCServiceError" code:1 userInfo:v10];
    ((void (**)(id, GCConfigurationAssetManagementServiceXPCProxy *, void *))v7)[2](v7, 0, v11);
  }
  os_activity_scope_leave(&state);
}

- (void)connectToGenericDeviceDBServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, _GCGenericDeviceDB *, void))a4;
  uint64_t v8 = _os_activity_create(&dword_20AD04000, "[Config Service/XPC] Connect to GenericDeviceDBService", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  v7[2](v7, self->_genericDeviceDB, 0);
  os_activity_scope_leave(&v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericDeviceDB, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_workloop, 0);
}

@end