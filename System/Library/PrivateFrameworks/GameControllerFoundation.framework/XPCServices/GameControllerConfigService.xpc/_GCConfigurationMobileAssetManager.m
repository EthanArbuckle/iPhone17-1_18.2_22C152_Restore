@interface _GCConfigurationMobileAssetManager
- (_GCConfigurationMobileAssetManager)init;
- (_GCConfigurationMobileAssetManager)initWithProvider:(id)a3;
- (id)assets;
- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5;
- (id)configurationBundleURLsForType:(id)a3;
- (id)currentAsset:(BOOL)a3;
- (id)lastUpdateDate;
@end

@implementation _GCConfigurationMobileAssetManager

- (_GCConfigurationMobileAssetManager)initWithProvider:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_GCConfigurationMobileAssetManager;
  id v3 = [(_GCConfigurationMobileAssetManager *)&v12 init];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = sub_100003CDC();
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.mobileasset.GameController.DB", v4, v5);
  v7 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v6;

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.mobileasset.GameController.DB [Locator]", v8, *((dispatch_queue_t *)v3 + 1));
  v10 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v9;

  return (_GCConfigurationMobileAssetManager *)v3;
}

- (_GCConfigurationMobileAssetManager)init
{
  return [(_GCConfigurationMobileAssetManager *)self initWithProvider:0];
}

- (id)configurationBundleURLsForType:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  currentDBAsset = v5->_currentDBAsset;
  if (currentDBAsset)
  {
    v7 = [(MAAsset *)currentDBAsset configurationBundleURLsForType:v4];
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    locatorQueue = v5->_locatorQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003FB4;
    v12[3] = &unk_100010340;
    v12[4] = v5;
    v5 = +[GCFuture futureOnQueue:locatorQueue withBlock:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000045F0;
    v10[3] = &unk_100010368;
    id v11 = v4;
    v7 = [(_GCConfigurationMobileAssetManager *)v5 thenWithResult:v10];
  }

  return v7;
}

- (id)assets
{
  v2 = sub_100004860(self);
  id v3 = [v2 thenSynchronouslyWithResult:&stru_1000103E8];

  return v3;
}

- (id)currentAsset:(BOOL)a3
{
  if (a3)
  {
    locatorQueue = self->_locatorQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004A64;
    v8[3] = &unk_100010340;
    v8[4] = self;
    uint64_t v4 = +[GCFuture futureOnQueue:locatorQueue withBlock:v8];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  if (self->_currentDBAsset)
  {
    uint64_t v4 = +[GCFuture futureWithResult:](GCFuture, "futureWithResult:");
    goto LABEL_5;
  }
  dispatch_queue_t v6 = +[NSNull null];
  v5 = +[GCFuture futureWithResult:v6];

LABEL_7:

  return v5;
}

- (id)lastUpdateDate
{
  v2 = sub_100004860(self);
  id v3 = [v2 thenSynchronouslyWithResult:&stru_100010428];

  return v3;
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_updateProgress || !a3)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    objc_sync_exit(v10);

    v25 = 0;
  }
  else
  {
    if (v10->_updateCallbacks)
    {
      v27 = +[NSAssertionHandler currentHandler];
      [v27 handleFailureInMethod:a2 object:v10 file:@"_GCConfigurationMobileAssetManager.m" lineNumber:217 description:@"Assertion failed: _updateProgress == ((void *)0) && _updateCallbacks == ((void *)0)"];
    }
    uint64_t v11 = objc_opt_new();
    updateCallbacks = v10->_updateCallbacks;
    v10->_updateCallbacks = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    updateProgress = v10->_updateProgress;
    v10->_updateProgress = (NSProgress *)v13;

    v15 = v10->_updateCallbacks;
    id v16 = objc_retainBlock(v9);
    [(NSMutableArray *)v15 addObject:v16];

    v17 = v10->_updateProgress;
    objc_sync_exit(v10);

    v18 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Check For Updates", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v18, &state);
    v19 = v10->_privateQueue;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_1000050A4;
    v37[4] = sub_1000050B4;
    id v38 = 0;
    [(NSProgress *)v17 setPausable:0];
    [(NSProgress *)v17 setCancellable:1];
    [(NSProgress *)v17 setLocalizedDescription:@"Checking for updates"];
    if (v5) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 4;
    }
    [(NSProgress *)v17 setTotalUnitCount:v20];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000050BC;
    v34[3] = &unk_100010478;
    v21 = v19;
    v35 = v21;
    v36 = v37;
    [(NSProgress *)v17 setCancellationHandler:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100005184;
    v33[3] = &unk_1000104C8;
    v33[4] = v10;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000055DC;
    v28[3] = &unk_1000106C8;
    v30 = objc_retainBlock(v33);
    v31 = v37;
    v28[4] = v10;
    BOOL v32 = v5;
    v22 = v17;
    v29 = v22;
    v23 = v30;
    dispatch_async(v21, v28);
    v24 = v29;
    v25 = v22;

    _Block_object_dispose(v37, 8);
    os_activity_scope_leave(&state);
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCallbacks, 0);
  objc_storeStrong((id *)&self->_updateProgress, 0);
  objc_storeStrong((id *)&self->_catalogDownloadOperation, 0);
  objc_storeStrong((id *)&self->_currentDBAsset, 0);
  objc_storeStrong((id *)&self->_locatorQueue, 0);

  objc_storeStrong((id *)&self->_privateQueue, 0);
}

@end