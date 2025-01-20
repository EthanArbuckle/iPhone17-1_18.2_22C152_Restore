@interface AppManager
- (AppLinkResolving)appLinkResolver;
- (AppManager)init;
- (AppManager)initWithAppLinkResolver:(id)a3 appInstaller:(id)a4;
- (BOOL)stopStallingCurrentInstallation;
- (CPSAppInstalling)appInstaller;
- (id)_appForBundleID:(id)a3 createIfNeeded:(BOOL)a4;
- (void)_installAppWithBundleID:(id)a3 applicationIconFileURL:(id)a4 completionHandler:(id)a5;
- (void)downloadAppWithBundleID:(id)a3 completionHandler:(id)a4;
- (void)installAppWithBundleID:(id)a3 session:(id)a4 completionHandler:(id)a5;
@end

@implementation AppManager

- (AppManager)init
{
  return 0;
}

- (AppManager)initWithAppLinkResolver:(id)a3 appInstaller:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AppManager;
  v9 = [(AppManager *)&v18 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ClipServices.clipserviced.app-manager", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_appInstaller, a4);
    objc_storeStrong((id *)&v9->_appLinkResolver, a3);
    uint64_t v12 = +[NSMutableSet set];
    apps = v9->_apps;
    v9->_apps = (NSMutableSet *)v12;

    uint64_t v14 = +[NSMapTable mapTableWithStrongToWeakObjects];
    appsByBundleID = v9->_appsByBundleID;
    v9->_appsByBundleID = (NSMapTable *)v14;

    v16 = v9;
  }

  return v9;
}

- (void)downloadAppWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003EB0;
  v11[3] = &unk_100014600;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)stopStallingCurrentInstallation
{
  return [(CPSAppInstalling *)self->_appInstaller stopStallingCurrentInstallation];
}

- (void)installAppWithBundleID:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 applicationIconFileURL];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000043AC;
  v12[3] = &unk_100014628;
  id v13 = v8;
  id v11 = v8;
  [(AppManager *)self _installAppWithBundleID:v9 applicationIconFileURL:v10 completionHandler:v12];
}

- (void)_installAppWithBundleID:(id)a3 applicationIconFileURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000044E0;
  block[3] = &unk_1000146A0;
  objc_copyWeak(&v19, &location);
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)_appForBundleID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMapTable *)self->_appsByBundleID objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = [[App alloc] initWithBundleID:v6];
    id v9 = [(AppLinkResolving *)self->_appLinkResolver ipaLinkForClipBundleIdentifier:v6];
    id v10 = +[NSURL URLWithString:v9];
    [(App *)v7 setIpaLink:v10];

    [(NSMapTable *)self->_appsByBundleID setObject:v7 forKey:v6];
    [(NSMutableSet *)self->_apps addObject:v7];
  }

  return v7;
}

- (AppLinkResolving)appLinkResolver
{
  return self->_appLinkResolver;
}

- (CPSAppInstalling)appInstaller
{
  return self->_appInstaller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstaller, 0);
  objc_storeStrong((id *)&self->_appLinkResolver, 0);
  objc_storeStrong((id *)&self->_appsByBundleID, 0);
  objc_storeStrong((id *)&self->_apps, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end