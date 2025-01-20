@interface ServerController
+ (id)sharedController;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (ServerController)init;
- (void)setListener:(id)a3;
- (void)start;
@end

@implementation ServerController

+ (id)sharedController
{
  if (qword_10001A2C8 != -1) {
    dispatch_once(&qword_10001A2C8, &stru_100014488);
  }
  v2 = (void *)qword_10001A2C0;

  return v2;
}

- (ServerController)init
{
  v23.receiver = self;
  v23.super_class = (Class)ServerController;
  v2 = [(ServerController *)&v23 init];
  if (v2)
  {
    +[MaintenanceActivity checkInActivities];
    id v3 = +[CPSClipCleanupManager sharedManager];
    v4 = objc_alloc_init(AppLinkResolver);
    appLinkResolver = v2->_appLinkResolver;
    v2->_appLinkResolver = v4;

    v6 = (CPSAppInfoFetching *)objc_alloc_init((Class)CPSAppInfoFetcher);
    appInfoFetcher = v2->_appInfoFetcher;
    v2->_appInfoFetcher = v6;

    v8 = (CPSAppInstaller *)[objc_alloc((Class)CPSAppInstaller) initWithAppInfoFetcher:v2->_appInfoFetcher];
    appInstaller = v2->_appInstaller;
    v2->_appInstaller = v8;

    v10 = [[ClipMetadataManager alloc] initWithAppInfoFetcher:v2->_appInfoFetcher];
    clipMetadataManager = v2->_clipMetadataManager;
    v2->_clipMetadataManager = v10;

    if (+[CPSClipURL usesDemoMetadata])
    {
      v12 = [[AppManager alloc] initWithAppLinkResolver:v2->_appLinkResolver appInstaller:v2->_appInstaller];
      appManager = v2->_appManager;
      v2->_appManager = v12;

      v14 = v2->_appManager;
      v15 = +[CPSSessionManager sharedManager];
      [v15 setLegacyInstaller:v14];

      v16 = sub_1000051D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ServerController: Use legacy app download flow.", v22, 2u);
      }
    }
    id v17 = objc_alloc((Class)NSXPCListener);
    v18 = (NSXPCListener *)[v17 initWithMachServiceName:CPSDaemonMachServiceName];
    listener = v2->_listener;
    v2->_listener = v18;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v20 = v2;
  }

  return v2;
}

- (void)start
{
  id v3 = sub_1000051D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "clipserviced started", v4, 2u);
  }
  [(NSXPCListener *)self->_listener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = +[CPSClipURL isSupported];
  if (v6)
  {
    v7 = [[RemoteClient alloc] initWithConnection:v5 appManager:self->_appManager clipMetadataManager:self->_clipMetadataManager];
    v8 = sub_1000051D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218242;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Created RemoteClient %p for new connection request %@", (uint8_t *)&v11, 0x16u);
    }
    [v5 resume];
  }
  else
  {
    v9 = sub_1000051D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000C610(v9, v5);
    }
  }

  return v6;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clipMetadataManager, 0);
  objc_storeStrong((id *)&self->_appLinkResolver, 0);
  objc_storeStrong((id *)&self->_appInstaller, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);

  objc_storeStrong((id *)&self->_appManager, 0);
}

@end