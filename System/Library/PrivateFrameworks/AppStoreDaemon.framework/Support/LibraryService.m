@interface LibraryService
- (LibraryService)init;
- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)cancelApp:(id)a3 withReplyHandler:(id)a4;
- (void)catalogRefreshedBundleIDs:(id)a3;
- (void)catalogRegisteredApps:(id)a3;
- (void)catalogUnregisteredBundleIDs:(id)a3;
- (void)deviceUnpairedWithPairingID:(id)a3;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 withReplyHandler:(id)a4;
- (void)executeQueryWithPredicate:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)executeQueryWithPredicate:(id)a3 withReplyHandler:(id)a4;
- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withReplyHandler:(id)a5;
- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5;
- (void)launchApp:(id)a3 withReplyHandler:(id)a4;
- (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withReplyHandler:(id)a4;
- (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withReplyHandler:(id)a4;
- (void)openableStatusForExecutableAtPath:(id)a3 withReplyHandler:(id)a4;
- (void)pauseApp:(id)a3 withReplyHandler:(id)a4;
- (void)resumeApp:(id)a3 withReplyHandler:(id)a4;
- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withReplyHandler:(id)a5;
- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5;
- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4;
@end

@implementation LibraryService

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  v7 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E0E4;
  v11[3] = &unk_10052A320;
  BOOL v15 = a3;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_100010948(dispatchQueue, v11);
}

- (void)executeQueryWithPredicate:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001462C;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  sub_100010948(dispatchQueue, v13);
}

- (LibraryService)init
{
  v22.receiver = self;
  v22.super_class = (Class)LibraryService;
  v2 = [(LibraryService *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreFoundation.LibraryService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = sub_100388088();
    v23[0] = v6;
    id v7 = sub_10031CA20();
    v23[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v23 count:2];
    libraryCatalogs = v2->_libraryCatalogs;
    v2->_libraryCatalogs = (NSArray *)v8;

    uint64_t v10 = sub_10031CA20();
    libraryOpen = v2->_libraryOpen;
    v2->_libraryOpen = (LibraryOpen *)v10;

    uint64_t v12 = sub_100216A48();
    libraryProgress = v2->_libraryProgress;
    v2->_libraryProgress = (LibraryProgress *)v12;

    uint64_t v14 = objc_opt_new();
    libraryUninstall = v2->_libraryUninstall;
    v2->_libraryUninstall = (LibraryUninstall *)v14;

    id v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    remoteCatalogs = v2->_remoteCatalogs;
    v2->_remoteCatalogs = v16;

    v18 = sub_1003B3A54();
    sub_1003B409C((uint64_t)v18, v2);

    [(NSArray *)v2->_libraryCatalogs makeObjectsPerformSelector:"setObserver:" withObject:v2];
    if (XPCNotificationSource)
    {
      v19 = sub_1002F2980((uint64_t)XPCNotificationSource, ASDAppLibraryServiceNotificationName, @"Library", 0, &stru_10052BAA0);
    }
    else
    {
      v19 = 0;
    }
    v20 = sub_10001A0C8();
    sub_1003D68A8((uint64_t)v20, v19);
  }
  return v2;
}

- (void)executeQueryWithPredicate:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003AE858;
  v17[3] = &unk_100522A68;
  v17[4] = self;
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  id v16 = v8;
  sub_100010948(dispatchQueue, v17);
}

- (void)cancelApp:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
}

- (void)cancelApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)pauseApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)resumeApp:(id)a3 withReplyHandler:(id)a4
{
}

- (void)openableStatusForExecutableAtPath:(id)a3 withReplyHandler:(id)a4
{
  id v7 = a4;
  uint64_t v6 = sub_10036E10C((uint64_t)FairPlay, a3);
  (*((void (**)(id, void, uint64_t))a4 + 2))(v7, 0, v6);
}

- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100016788();
  id v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 processInfo];
    id v13 = [v12 bundleIdentifier];
    int v14 = 138543874;
    id v15 = v10;
    __int16 v16 = 2114;
    v17 = v13;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Launching messages extension for %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  [(LibraryOpen *)self->_libraryOpen launchApp:v8 extensionType:a4 withResultHandler:v9];
}

- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100016788();
  uint64_t v12 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 processInfo];
    int v14 = [v13 bundleIdentifier];
    int v15 = 138544130;
    __int16 v16 = v11;
    __int16 v17 = 2114;
    __int16 v18 = v14;
    __int16 v19 = 2114;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Launching app for %{public}@ on %{public}@: %{public}@", (uint8_t *)&v15, 0x2Au);
  }
  [(LibraryOpen *)self->_libraryOpen launchApp:v8 onPairedDevice:v9 withResultHandler:v10];
}

- (void)launchApp:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  id v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 processInfo];
    id v11 = [v10 bundleIdentifier];
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2114;
    int v15 = v11;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Launching app for %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(LibraryOpen *)self->_libraryOpen launchApp:v6 withResultHandler:v7];
}

- (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 count];
    id v10 = [v7 processInfo];
    id v11 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up %lu system app bundleIDs(s) for %{public}@: %{public}@", buf, 0x2Au);
  }
  int v12 = sub_10031CA20();
  id v16 = 0;
  id v13 = sub_10031D088((uint64_t)v12, v5, &v16);
  id v14 = v16;

  if (!v13)
  {
    int v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v7;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Lookup failed with error: %{public}@", buf, 0x16u);
    }
  }
  v6[2](v6, v13, v14);
}

- (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 count];
    id v10 = [v7 processInfo];
    id v11 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up %lu system app itemIDs(s) for %{public}@: %{public}@", buf, 0x2Au);
  }
  int v12 = sub_10031CA20();
  id v16 = 0;
  id v13 = sub_10031D428((uint64_t)v12, v5, &v16);
  id v14 = v16;

  if (!v13)
  {
    int v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v7;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Lookup failed with error: %{public}@", buf, 0x16u);
    }
  }
  v6[2](v6, v13, v14);
}

- (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 count];
    id v10 = [v7 processInfo];
    id v11 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up %lu system app for watch bundleIDs(s) for %{public}@: %{public}@", buf, 0x2Au);
  }
  int v12 = sub_10031CA20();
  id v16 = 0;
  id v13 = sub_10031D7C8((uint64_t)v12, v5, &v16);
  id v14 = v16;

  if (!v13)
  {
    int v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v7;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Lookup for watch failed with error: %{public}@", buf, 0x16u);
    }
  }
  v6[2](v6, v13, v14);
}

- (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 count];
    id v10 = [v7 processInfo];
    id v11 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking up %lu system app for watch itemIDs(s) for %{public}@: %{public}@", buf, 0x2Au);
  }
  int v12 = sub_10031CA20();
  id v16 = 0;
  id v13 = sub_10031DC68((uint64_t)v12, v5, &v16);
  id v14 = v16;

  if (!v13)
  {
    int v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v7;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Lookup for watch failed with error: %{public}@", buf, 0x16u);
    }
  }
  v6[2](v6, v13, v14);
}

- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withReplyHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100016788();
  id v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v10 processInfo];
    id v13 = [v12 bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v10;
    __int16 v22 = 2114;
    __int16 v23 = v13;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Uninstalling app for %{public}@: %{public}@", buf, 0x20u);
  }
  libraryUninstall = self->_libraryUninstall;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003AFCFC;
  v17[3] = &unk_100521C18;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [(LibraryUninstall *)libraryUninstall uninstallApp:v16 requestUserConfirmation:v6 withResultHandler:v17];
}

- (void)catalogRegisteredApps:(id)a3
{
  sub_1002CF63C((uint64_t)ASDNotification, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = sub_10001A0C8();
  sub_1003D64D4((uint64_t)v3, v4);
}

- (void)catalogRefreshedBundleIDs:(id)a3
{
  sub_1002CF238((uint64_t)ASDNotification, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = sub_10001A0C8();
  sub_1003D64D4((uint64_t)v3, v4);
}

- (void)catalogUnregisteredBundleIDs:(id)a3
{
  sub_1002CF850((uint64_t)ASDNotification, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = sub_10001A0C8();
  sub_1003D64D4((uint64_t)v3, v4);
}

- (void)deviceUnpairedWithPairingID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B0170;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5
{
  id v7 = a3;
  id v8 = sub_1002DC980();
  sub_1002DCAAC((uint64_t)v8);
  id v9 = (unsigned char *)objc_claimAutoreleasedReturnValue();

  if (v9 && a5 != -1 && v7 && (v9[18] & 1) == 0)
  {
    id v10 = sub_100388088();
    id v11 = sub_1003893D8(v10, v7);

    if (v11)
    {
      double v12 = 0.67;
      if (a5 != 2) {
        double v12 = 0.0;
      }
      if (a5 == 1) {
        double v12 = 0.33;
      }
      double v13 = v12 + a4 * 0.33;
      id v14 = sub_100388088();
      sub_100389CD8((uint64_t)v14, v7, v13);

      id v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 138543362;
        id v17 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[ACX] Updated install progress: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4
{
  id v5 = a3;
  id v6 = sub_1002DC980();
  uint64_t v7 = sub_1002DCAAC((uint64_t)v6);

  if (v5 && v7 && (*(unsigned char *)(v7 + 18) & 1) == 0)
  {
    if (a4 == 5)
    {
      id v18 = sub_1003B3A54();
      id v22 = v5;
      id v19 = +[NSArray arrayWithObjects:&v22 count:1];
      id v20 = [*(id *)(v7 + 8) pairingID];
      sub_1003B4150((uint64_t)v18, v19, v20);

      __int16 v21 = sub_100388088();
      sub_1003886AC((uint64_t)v21, v5);

      id v9 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "App uninstalled %{public}@", buf, 0xCu);
      }
      goto LABEL_13;
    }
    if (a4 == 2)
    {
      id v8 = sub_100388088();
      id v9 = sub_1003891F0(v8, v5);

      if (v9)
      {
        id v10 = sub_100388088();
        sub_1003895DC((uint64_t)v10, v5, @"Companion app installed");

        id v25 = v9;
        id v11 = +[NSArray arrayWithObjects:&v25 count:1];
        double v12 = [*(id *)(v7 + 8) pairingID];
        double v13 = sub_1002CF520((uint64_t)ASDNotification, v11, v12);

        id v14 = sub_10001A0C8();
        sub_1003D64D4((uint64_t)v14, v13);

        id v15 = sub_100388088();
        int v16 = [v9 bundleID];
        sub_100389C18((uint64_t)v15, v16);
      }
      id v17 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "App installed %{public}@", buf, 0xCu);
      }

LABEL_13:
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCatalogs, 0);
  objc_storeStrong((id *)&self->_libraryUninstall, 0);
  objc_storeStrong((id *)&self->_libraryProgress, 0);
  objc_storeStrong((id *)&self->_libraryOpen, 0);
  objc_storeStrong((id *)&self->_libraryCatalogs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end