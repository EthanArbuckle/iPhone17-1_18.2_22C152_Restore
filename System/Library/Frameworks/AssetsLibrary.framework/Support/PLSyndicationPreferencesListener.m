@interface PLSyndicationPreferencesListener
- (PLSyndicationPreferencesListener)init;
- (void)_handleSettingChange;
- (void)_triggerGuestAssetSyncUpdate;
- (void)start;
@end

@implementation PLSyndicationPreferencesListener

- (void).cxx_destruct
{
  objc_storeStrong(&self->_listenerBlock, 0);

  objc_storeStrong((id *)&self->_listenerQueue, 0);
}

- (void)_triggerGuestAssetSyncUpdate
{
  v2 = PLSyndicationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%{public}@ Triggering guest asset sync update", buf, 0xCu);
  }

  v3 = +[PLPhotoLibraryBundleController sharedBundleController];
  v4 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:1];
  v5 = [v3 openBundleAtLibraryURL:v4];

  v6 = [v5 libraryServicesManager];
  if ((PLSyndicationPreferencesEnabled() & 1) == 0)
  {
    v7 = [v6 databaseContext];
    id v8 = [v7 newShortLivedLibraryWithName:"-[PLSyndicationPreferencesListener _triggerGuestAssetSyncUpdate]"];

    v9 = [v8 managedObjectContext];
    v10 = v9;
    if (v9)
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_10001A344;
      v16 = &unk_10002D4B0;
      v17 = v9;
      id v18 = v8;
      [v18 performBlockAndWait:&v13];

      v11 = v17;
    }
    else
    {
      v11 = PLSyndicationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Syndication for Photos was turned OFF, but we have no managed object context for the SPL. Probably shutting down. Assume we'll take care of this on next open.", buf, 2u);
      }
    }
  }
  v12 = objc_msgSend(v6, "backgroundJobService", v13, v14, v15, v16);
  [v12 signalBackgroundProcessingNeededOnBundle:v5];
}

- (void)_handleSettingChange
{
}

- (void)start
{
  if (self->_listenerQueue)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLSyndicationPreferencesListener.m", 46, @"Invalid parameter not satisfying: %@", @"_listenerQueue == nil" object file lineNumber description];
  }
  id v3 = [(id)objc_opt_class() description];
  v4 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);
  listenerQueue = self->_listenerQueue;
  self->_listenerQueue = v4;

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001A514;
  v10[3] = &unk_10002D488;
  objc_copyWeak(&v11, &location);
  v6 = objc_retainBlock(v10);
  id listenerBlock = self->_listenerBlock;
  self->_id listenerBlock = v6;

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_listenerQueue, self->_listenerBlock);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (PLSyndicationPreferencesListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLSyndicationPreferencesListener;
  return [(PLSyndicationPreferencesListener *)&v3 init];
}

@end