@interface AXAssetsXPCServer
- (AXAssetsXPCServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)refreshAssetCatalogForAssetTypeHandler;
- (id)updateAssetForAssetTypeHandler;
- (void)_xpcQueue_acceptNewConnection:(id)a3;
- (void)invokeSimpleTaskById:(id)a3 arguments:(id)a4;
- (void)refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5;
- (void)runFirstBootTasks:(BOOL)a3;
- (void)runFirstUnlockTasks;
- (void)setRefreshAssetCatalogForAssetTypeHandler:(id)a3;
- (void)setUpdateAssetForAssetTypeHandler:(id)a3;
- (void)startServer;
- (void)updateAssetForAssetType:(id)a3;
@end

@implementation AXAssetsXPCServer

- (AXAssetsXPCServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXAssetsXPCServer;
  v2 = [(AXAssetsXPCServer *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.axassetsd.xpc", v4);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accessibility.axassetsd.service"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v7;

    [(NSXPCListener *)v2->_xpcListener _setQueue:v2->_xpcQueue];
    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
  }
  return v2;
}

- (void)startServer
{
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will begin listening for client connections", v4, 2u);
  }

  [(NSXPCListener *)self->_xpcListener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.accessibility.axassets"];
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7) {
    goto LABEL_2;
  }
  v9 = +[NSSet setWithArray:&off_100021AB0];
  objc_super v10 = [v5 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v10 lowercaseString];
    unsigned __int8 v12 = [v9 containsObject:v11];

    if (v12)
    {

LABEL_2:
      [(AXAssetsXPCServer *)self _xpcQueue_acceptNewConnection:v5];
      [v5 resume];
      BOOL v8 = 1;
      goto LABEL_9;
    }
  }
  v13 = AXLogAssetDaemon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100014DC4(v5, (uint64_t)v10, v13);
  }

  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)_xpcQueue_acceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accepting new system connection from PID %d", (uint8_t *)&buf, 8u);
  }

  [v4 _setQueue:self->_xpcQueue];
  v6 = _AXCreateAXAssetsServiceInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:self];
  [v4 setRemoteObjectInterface:0];
  objc_initWeak(&buf, v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000CE80;
  v9[3] = &unk_1000207E8;
  objc_copyWeak(&v10, &buf);
  [v4 setInterruptionHandler:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CF40;
  v7[3] = &unk_1000207E8;
  objc_copyWeak(&v8, &buf);
  [v4 setInvalidationHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);
}

- (void)refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  v9 = [(AXAssetsXPCServer *)self refreshAssetCatalogForAssetTypeHandler];

  if (v9)
  {
    id v10 = [(AXAssetsXPCServer *)self refreshAssetCatalogForAssetTypeHandler];
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (void)updateAssetForAssetType:(id)a3
{
  id v6 = a3;
  id v4 = [(AXAssetsXPCServer *)self updateAssetForAssetTypeHandler];

  if (v4)
  {
    BOOL v5 = [(AXAssetsXPCServer *)self updateAssetForAssetTypeHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)invokeSimpleTaskById:(id)a3 arguments:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AXSimpleAssetTaskManager sharedInstance];
  [v7 invokeTaskById:v6 arguments:v5];
}

- (void)runFirstBootTasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recieved xpc force run first boot actions message", v6, 2u);
  }

  id v5 = +[AXSimpleAssetTaskManager sharedInstance];
  [v5 handleFirstBoot:v3];
}

- (void)runFirstUnlockTasks
{
  v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Recieved xpc to run first unlock actions message", v4, 2u);
  }

  BOOL v3 = +[AXSimpleAssetTaskManager sharedInstance];
  [v3 handleFirstUnlock];
}

- (id)refreshAssetCatalogForAssetTypeHandler
{
  return self->_refreshAssetCatalogForAssetTypeHandler;
}

- (void)setRefreshAssetCatalogForAssetTypeHandler:(id)a3
{
}

- (id)updateAssetForAssetTypeHandler
{
  return self->_updateAssetForAssetTypeHandler;
}

- (void)setUpdateAssetForAssetTypeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateAssetForAssetTypeHandler, 0);
  objc_storeStrong(&self->_refreshAssetCatalogForAssetTypeHandler, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end