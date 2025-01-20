@interface AXAssetsDaemon
+ (id)sharedInstance;
- (AXAssetsActivityTransactionManager)activityTransactionManager;
- (AXAssetsXPCServer)xpcServer;
- (NSMutableArray)managedAssets;
- (OS_dispatch_queue)notificationQueue;
- (id)_init;
- (id)_managedAssetForAssetType:(id)a3;
- (void)_refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5;
- (void)_updateAssetForAssetType:(id)a3;
- (void)registerManagedAsset:(id)a3;
- (void)registerManagedAssets:(id)a3;
- (void)run;
- (void)setActivityTransactionManager:(id)a3;
- (void)setManagedAssets:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setXpcServer:(id)a3;
- (void)willBecomeIdle:(id)a3 completion:(id)a4;
@end

@implementation AXAssetsDaemon

+ (id)sharedInstance
{
  if (qword_100027A80 != -1) {
    dispatch_once(&qword_100027A80, &stru_100020BC0);
  }
  v2 = (void *)qword_100027A78;
  return v2;
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)AXAssetsDaemon;
  v2 = [(AXAssetsDaemon *)&v15 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXAssetsActivityTransactionManager);
    [(AXAssetsDaemon *)v2 setActivityTransactionManager:v3];

    v4 = [(AXAssetsDaemon *)v2 activityTransactionManager];
    [v4 setDelegate:v2];

    id v5 = objc_alloc_init((Class)NSMutableArray);
    [(AXAssetsDaemon *)v2 setManagedAssets:v5];

    v6 = objc_alloc_init(AXAssetsXPCServer);
    [(AXAssetsDaemon *)v2 setXpcServer:v6];

    objc_initWeak(&location, v2);
    xpcServer = v2->_xpcServer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D5AC;
    v12[3] = &unk_100020BE8;
    objc_copyWeak(&v13, &location);
    [(AXAssetsXPCServer *)xpcServer setRefreshAssetCatalogForAssetTypeHandler:v12];
    v8 = v2->_xpcServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000D62C;
    v10[3] = &unk_100020C10;
    objc_copyWeak(&v11, &location);
    [(AXAssetsXPCServer *)v8 setUpdateAssetForAssetTypeHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)registerManagedAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(AXAssetsDaemon *)self managedAssets];
  [v5 addObject:v4];
}

- (void)registerManagedAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(AXAssetsDaemon *)self managedAssets];
  [v5 addObjectsFromArray:v4];
}

- (void)run
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(AXAssetsDaemon *)self managedAssets];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) checkInAssetUpdateXPCActivity];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }

  v8 = [(AXAssetsDaemon *)self xpcServer];
  [v8 startServer];

  v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Bootstrap complete. Will enter event loop.", v10, 2u);
  }

  dispatch_main();
}

- (id)_managedAssetForAssetType:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AXAssetsDaemon *)self managedAssets];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 policy];
        id v11 = [v10 assetType];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v10 = [(AXAssetsDaemon *)self _managedAssetForAssetType:a3];
  v9 = +[AXManagedAssetTaskContext contextWithXPCClient];
  [v10 enqueueCatalogRefreshTaskWithOverrideTimeout:v8 forceCatalogRefresh:v5 context:v9];
}

- (void)_updateAssetForAssetType:(id)a3
{
  id v4 = [(AXAssetsDaemon *)self _managedAssetForAssetType:a3];
  v3 = +[AXManagedAssetTaskContext contextWithXPCClient];
  [v4 enqueueAssetUpdateTaskWithContext:v3];
}

- (void)willBecomeIdle:(id)a3 completion:(id)a4
{
  id v4 = a4;
  BOOL v5 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DB60;
  block[3] = &unk_100020C38;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (AXAssetsActivityTransactionManager)activityTransactionManager
{
  return self->_activityTransactionManager;
}

- (void)setActivityTransactionManager:(id)a3
{
}

- (AXAssetsXPCServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (NSMutableArray)managedAssets
{
  return self->_managedAssets;
}

- (void)setManagedAssets:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_managedAssets, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_activityTransactionManager, 0);
}

@end