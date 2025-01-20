@interface UpdatesManager_ObjC
+ (id)sharedManager;
- (NSArray)headboardProvisionedApps;
- (UpdatesManager_ObjC)init;
- (void)_handleAccountChangedNotification;
- (void)autoUpdateEnabled:(id)a3;
- (void)confirmAgentRequestedUpdateAll:(id)a3;
- (void)dropAllUpdatesIncludingVPP:(BOOL)a3;
- (void)getManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)getUpdateMetadataForBundleID:(id)a3 replyHandler:(id)a4;
- (void)getUpdatesWithContext:(id)a3;
- (void)getUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)hidePendingUpdatesBadge;
- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4;
- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4;
- (void)noteUpdatesStateChangedWithReason:(id)a3 logKey:(id)a4 completionBlock:(id)a5;
- (void)performBackgroundSoftwareUpdateCheck;
- (void)performPostRestoreUpdatesCheck;
- (void)postProcessBackgroundUpdateMetrics;
- (void)refreshUpdateCountWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)refreshUpdateForApp:(int64_t)a3 token:(id)a4 replyHandler:(id)a5;
- (void)reloadApplicationBadgeWithReason:(id)a3;
- (void)reloadFromServerInBackgroundWithToken:(id)a3 completionBlock:(id)a4;
- (void)reloadFromServerWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)reloadManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)reloadUpdatesWithContext:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)setHeadboardProvisionedApps:(id)a3;
- (void)setupFollowingMigration;
- (void)showPendingUpdatesBadge;
- (void)updateAllWithOrder:(id)a3 requestToken:(id)a4 replyHandler:(id)a5;
- (void)verifyAllPendingUpdates;
- (void)verifyPendingUpdates:(id)a3;
- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3;
- (void)verifyUpdatesForRemovedBundleIDs:(id)a3;
@end

@implementation UpdatesManager_ObjC

+ (id)sharedManager
{
  if (qword_1005B0FF0 != -1) {
    dispatch_once(&qword_1005B0FF0, &stru_100528FA8);
  }
  v2 = (void *)qword_1005B0FF8;
  return v2;
}

- (UpdatesManager_ObjC)init
{
  v27.receiver = self;
  v27.super_class = (Class)UpdatesManager_ObjC;
  v2 = [(UpdatesManager_ObjC *)&v27 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.callout", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.dispatch", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.appstored.badge", v9);
    badgeQueue = v2->_badgeQueue;
    v2->_badgeQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    tvProviderApps = v2->_tvProviderApps;
    v2->_tvProviderApps = (NSSet *)v12;

    uint64_t v14 = objc_opt_new();
    DSIDLessAppsLock = v2->_DSIDLessAppsLock;
    v2->_DSIDLessAppsLock = (NSRecursiveLock *)v14;

    v16 = objc_alloc_init(TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v16;

    v18 = v2->_taskQueue;
    if (v18) {
      [(NSOperationQueue *)v18->_operationQueue setName:@"com.apple.appstored.UpdatesManager.taskQueue"];
    }
    v19 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10034B36C;
    block[3] = &unk_100521388;
    v20 = v2;
    v26 = v20;
    dispatch_async(v19, block);
    v21 = v2->_dispatchQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10034BA0C;
    v23[3] = &unk_100521388;
    v24 = v20;
    dispatch_async(v21, v23);
  }
  return v2;
}

- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = 0;
  id v9 = v6;
  if (self && a3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    DSIDLessAppsLock = self->_DSIDLessAppsLock;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10035117C;
    v10[3] = &unk_100529208;
    v10[5] = &v11;
    v10[6] = a3;
    v10[4] = self;
    sub_100010468(DSIDLessAppsLock, v10);
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
    id v6 = v9;
  }
  (*((void (**)(id, BOOL))v6 + 2))(v6, v7);
}

- (void)autoUpdateEnabled:(id)a3
{
  id v5 = a3;
  BOOL v4 = sub_100005CF8();
  (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
}

- (void)confirmAgentRequestedUpdateAll:(id)a3
{
  BOOL agentRequestedUpdateAll = self->_agentRequestedUpdateAll;
  self->_BOOL agentRequestedUpdateAll = 0;
  (*((void (**)(id, BOOL))a3 + 2))(a3, agentRequestedUpdateAll);
}

- (void)dropAllUpdatesIncludingVPP:(BOOL)a3
{
  BOOL v4 = +[NSMutableArray array];
  id v5 = sub_10001A308();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10034BD34;
  v11[3] = &unk_100528FD0;
  BOOL v13 = a3;
  id v6 = v4;
  id v12 = v6;
  [v5 readUsingSession:v11];

  BOOL v7 = sub_10001A308();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10034BF38;
  v9[3] = &unk_100528FF8;
  id v10 = v6;
  id v8 = v6;
  [v7 modifyUsingTransaction:v9];
}

- (void)getManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034C00C;
  block[3] = &unk_100521DE0;
  BOOL v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)getUpdatesWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034C4EC;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)getUpdateMetadataForBundleID:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034C5BC;
  block[3] = &unk_1005221F0;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)getUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034C878;
  block[3] = &unk_100521DE0;
  BOOL v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)hidePendingUpdatesBadge
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034C9E4;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4
{
}

- (void)noteUpdatesStateChangedWithReason:(id)a3 logKey:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  LOBYTE(v16) = 0;
  uint64_t v11 = [[_TtC9appstored14UpdatesContext alloc] initWithReason:0 requestToken:0 logKey:v10 callbackHandler:0 includeMetrics:0 isVPPLookup:0 userInitiated:v16 targetedItemID:0];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034CB78;
  block[3] = &unk_100522420;
  void block[4] = self;
  id v18 = v8;
  v19 = v11;
  id v20 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(dispatchQueue, block);
}

- (void)postProcessBackgroundUpdateMetrics
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034CD40;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)performBackgroundSoftwareUpdateCheck
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034CF18;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)performPostRestoreUpdatesCheck
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034D084;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadApplicationBadgeWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034D1C4;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)refreshUpdateCountWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034D2E4;
  block[3] = &unk_1005221F0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)refreshUpdateForApp:(int64_t)a3 token:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10034D55C;
  v13[3] = &unk_1005280D8;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)reloadFromServerInBackgroundWithToken:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034D740;
  block[3] = &unk_100521DE0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadFromServerWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034D880;
  block[3] = &unk_100521DE0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034D9C4;
  block[3] = &unk_100521DE0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadUpdatesWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034E130;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"disabled";
    if (v4) {
      CFStringRef v7 = @"enabled";
    }
    int v8 = 138543362;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting auto updates to %{public}@", (uint8_t *)&v8, 0xCu);
  }

  sub_1003F42B0((uint64_t)AppDefaultsManager, v4);
  v5[2](v5);
}

- (void)setupFollowingMigration
{
  v3 = +[KeepAlive keepAliveWithName:@"com.apple.UpdateManager.setupFollowingMigration"];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10034E2DC;
  v6[3] = &unk_1005218C0;
  id v7 = v3;
  int v8 = self;
  id v5 = v3;
  dispatch_async(dispatchQueue, v6);
}

- (void)showPendingUpdatesBadge
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034E5A8;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updateAllWithOrder:(id)a3 requestToken:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10034E778;
  v15[3] = &unk_100522448;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)verifyAllPendingUpdates
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034ED50;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)verifyPendingUpdates:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034F104;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034F4CC;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)verifyUpdatesForRemovedBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034F784;
  block[3] = &unk_100521388;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAccountChangedNotification
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100350E80;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSArray)headboardProvisionedApps
{
  return self->_headboardProvisionedApps;
}

- (void)setHeadboardProvisionedApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headboardProvisionedApps, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_DSIDLessAppsLock, 0);
  objc_storeStrong((id *)&self->_tvProviderApps, 0);
  objc_storeStrong((id *)&self->_badgeQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
}

@end