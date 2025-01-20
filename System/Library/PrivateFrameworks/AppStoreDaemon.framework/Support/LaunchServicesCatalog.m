@interface LaunchServicesCatalog
- (LibraryCatalogObserver)observer;
- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4;
- (id)resultsWithItemIDs:(id)a3 error:(id *)a4;
- (void)_handleAppRegisteredNotification:(id)a3;
- (void)_handleAppUnregisteredNotification:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)_handleBagInvalidatedNotification:(id)a3;
- (void)_handleLaunchAppMessage:(id)a3 fromDevice:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5;
- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withResultHandler:(id)a5;
- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5;
- (void)launchApp:(id)a3 withResultHandler:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation LaunchServicesCatalog

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [_TtC9appstored14UpdatesContext alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007734;
  v16[3] = &unk_1005280B0;
  id v11 = v8;
  v16[4] = self;
  id v17 = v11;
  LOBYTE(v15) = 0;
  v12 = [(UpdatesContext *)v10 initWithReason:0 requestToken:0 logKey:v9 callbackHandler:v16 includeMetrics:0 isVPPLookup:0 userInitiated:v15 targetedItemID:0];

  v13 = +[UpdatesManager sharedManager];
  v14 = v13;
  if (v6) {
    [v13 reloadUpdatesWithContext:v12];
  }
  else {
    [v13 getUpdatesWithContext:v12];
  }
}

- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000181E8;
  v27 = sub_100017CB0;
  id v28 = &__NSArray0__struct;
  dispatchQueue = self->_dispatchQueue;
  block = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10000FACC;
  v19 = &unk_100521288;
  v22 = &v23;
  v20 = self;
  id v12 = v8;
  id v21 = v12;
  dispatch_sync(dispatchQueue, &block);
  if ([v9 count])
  {
    v13 = (void *)v24[5];
    id v14 = +[NSPredicate predicateWithFormat:@"NOT bundleID IN %@", v9, block, v17, v18, v19, v20];
    uint64_t v15 = [v13 filteredArrayUsingPredicate:v14];
    v10[2](v10, v15, 0);
  }
  else
  {
    id v14 = [(id)v24[5] copy];
    v10[2](v10, v14, 0);
  }

  _Block_object_dispose(&v23, 8);
}

- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [LibraryLazyResultsEnumerator alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000175C8;
  v10[3] = &unk_1005262B8;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  id v8 = sub_10001584C(v6, 1, v10);

  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  [v3 removeObserver:self name:AMSBagChangedNotification object:0];
  [v3 removeObserver:self name:AMSBagInvalidatedNotification object:0];
  v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)LaunchServicesCatalog;
  [(LaunchServicesCatalog *)&v5 dealloc];
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031E0A0;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031E2A8;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10031E534;
  v13[3] = &unk_1005280D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_1002DC980();
  sub_1002DD110(v11, v10);
  id v12 = (unsigned char *)objc_claimAutoreleasedReturnValue();

  if (v12 && (v12[18] & 1) != 0)
  {
    v13 = objc_alloc_init(XDCLaunchAppRequest);
    id v14 = [v8 bundleID];
    sub_100295D74((uint64_t)v13, v14);

    id v15 = sub_1003690D8([XDCMessage alloc], v13, 3);
    int64_t v16 = sub_1003177EC();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10031E9CC;
    v17[3] = &unk_100528100;
    id v18 = v8;
    id v19 = v9;
    if (v16) {
      sub_100317CB4((uint64_t)v16, v15, v12, 1, v17);
    }
  }
  else
  {
    [(LaunchServicesCatalog *)self launchApp:v8 withResultHandler:v9];
  }
}

- (void)launchApp:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031EC20;
  block[3] = &unk_1005221F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [LibraryLazyResultsEnumerator alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10031F1A0;
  v10[3] = &unk_1005262B8;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = sub_10001584C(v6, 0, v10);

  return v8;
}

- (id)resultsWithItemIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sub_10031CF88((uint64_t)self, @"item identifier lookup");
  id v6 = [LibraryLazyResultsEnumerator alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10031F404;
  v10[3] = &unk_1005262B8;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = sub_10001584C(v6, 0, v10);

  return v8;
}

- (void)_handleAppRegisteredNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"isPlaceholder"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    dispatchQueue = self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10032055C;
    v9[3] = &unk_1005218C0;
    id v10 = v4;
    id v11 = self;
    dispatch_async(dispatchQueue, v9);
  }
}

- (void)_handleAppUnregisteredNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  id v6 = [v5 copy];

  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100320848;
  v9[3] = &unk_1005218C0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320AFC;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleBagInvalidatedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320BDC;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleLaunchAppMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100416894((uint64_t)XPCRequestToken, 0);
  id v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@]  Handling launch app message", buf, 0xCu);
  }

  id v11 = [XDCLaunchAppRequest alloc];
  if (v6) {
    id Property = objc_getProperty(v6, v10, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v13 = Property;
  id v14 = [(XDCLaunchAppRequest *)v11 initWithData:v13];

  id v15 = objc_alloc((Class)ASDApp);
  if (v14) {
    bundleID = v14->_bundleID;
  }
  else {
    bundleID = 0;
  }
  uint64_t v17 = bundleID;
  id v18 = [v15 initWithBundleID:v17];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100320E4C;
  v21[3] = &unk_1005282C0;
  id v22 = v6;
  id v23 = v7;
  id v19 = v7;
  id v20 = v6;
  [(LaunchServicesCatalog *)self launchApp:v18 withResultHandler:v21];
}

- (LibraryCatalogObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (LibraryCatalogObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppMappingForWatchByItemID, 0);
  objc_storeStrong((id *)&self->_systemAppMappingForWatchByBundleID, 0);
  objc_storeStrong((id *)&self->_systemAppMappingByItemID, 0);
  objc_storeStrong((id *)&self->_systemAppMappingByBundleID, 0);
  objc_storeStrong((id *)&self->_progressCache, 0);
  objc_storeStrong((id *)&self->_planner, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end