@interface GCConfigurationAssetManagementServiceXPCProxy
- (GCConfigurationAssetManagementServiceXPCProxy)init;
- (GCConfigurationAssetManagementServiceXPCProxy)initWithService:(id)a3;
- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 reply:(id)a5;
- (void)assetsWithReply:(id)a3;
- (void)currentAsset:(BOOL)a3 withReply:(id)a4;
- (void)lastUpdateDateWithReply:(id)a3;
@end

@implementation GCConfigurationAssetManagementServiceXPCProxy

- (GCConfigurationAssetManagementServiceXPCProxy)initWithService:(id)a3
{
  v5 = (GCConfigurationAssetManagementService *)a3;
  if (!v5)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCConfigurationAssetManagementServiceXPCProxy.m", 78, @"Invalid parameter not satisfying: %s", "service != nil");
  }
  v10.receiver = self;
  v10.super_class = (Class)GCConfigurationAssetManagementServiceXPCProxy;
  v6 = [(GCConfigurationAssetManagementServiceXPCProxy *)&v10 init];
  service = v6->_service;
  v6->_service = v5;

  return v6;
}

- (GCConfigurationAssetManagementServiceXPCProxy)init
{
  return 0;
}

- (void)assetsWithReply:(id)a3
{
  service = self->_service;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(GCConfigurationAssetManagementService *)service assets];
  id v10 = 0;
  v11 = 0;
  [v5 waitForResult:&v11 error:&v10];
  v6 = v11;
  id v7 = v10;
  id v8 = v6;

  v9 = objc_msgSend(v8, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_6);

  v4[2](v4, v9, v7);
}

GCConfigurationAssetXPCProxy *__65__GCConfigurationAssetManagementServiceXPCProxy_assetsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GCConfigurationAssetXPCProxy alloc] initWithAsset:v2];

  return v3;
}

- (void)currentAsset:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, GCConfigurationAssetXPCProxy *, id))a4;
  id v7 = _os_activity_create(&dword_20AD04000, "[Config Service/XPC/AssetManagementService] Current Asset", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = [(GCConfigurationAssetManagementService *)self->_service currentAsset:v4];
  id v13 = 0;
  id v14 = 0;
  [v8 waitForResult:&v14 error:&v13];
  id v9 = v14;
  id v10 = v13;

  if ([v9 conformsToProtocol:&unk_26BEE7910])
  {
    v11 = [[GCConfigurationAssetXPCProxy alloc] initWithAsset:v9];
  }
  else
  {
    v11 = +[NSNull null];
  }
  v12 = v11;
  v6[2](v6, v11, v10);

  os_activity_scope_leave(&state);
}

- (void)lastUpdateDateWithReply:(id)a3
{
  service = self->_service;
  BOOL v4 = (void (**)(id, id, id))a3;
  v5 = [(GCConfigurationAssetManagementService *)service lastUpdateDate];
  id v9 = 0;
  id v10 = 0;
  [v5 waitForResult:&v10 error:&v9];
  v6 = v10;
  id v7 = v9;
  id v8 = v6;

  v4[2](v4, v8, v7);
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = _os_activity_create(&dword_20AD04000, "[Config Service/XPC/AssetManagementService] Check For New Assets", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v9, &v12);
  id v10 = [(GCConfigurationAssetManagementService *)self->_service checkForNewAssets:v6 forceCatalogRefresh:v5 completion:v8];
  os_activity_scope_leave(&v12);

  return v10;
}

- (void).cxx_destruct
{
}

@end