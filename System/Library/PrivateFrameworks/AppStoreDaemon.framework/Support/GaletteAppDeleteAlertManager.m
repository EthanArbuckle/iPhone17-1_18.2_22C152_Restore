@interface GaletteAppDeleteAlertManager
+ (id)_galetteAppForBundleID:(id)a3;
+ (void)_appDeleteAlertIsEnabledWithReply:(id)a3;
+ (void)_cleanupAfterUninstallingBundleID:(id)a3;
+ (void)_showUninstallAlertForApp:(id)a3 bundleID:(id)a4;
+ (void)handleInstalledAppsWithBundleIDs:(id)a3;
+ (void)handleUninstalledAppsWithBundleIDs:(id)a3;
@end

@implementation GaletteAppDeleteAlertManager

+ (void)handleInstalledAppsWithBundleIDs:(id)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138543618;
    long long v17 = v6;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = objc_msgSend(a1, "_galetteAppForBundleID:", v10, v17);
        v12 = v11;
        if (!v11 || ![v11 mode])
        {

          goto LABEL_14;
        }
        v13 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = sub_100286AF0((unint64_t)[v12 mode]);
          *(_DWORD *)buf = v17;
          v26 = v14;
          __int16 v27 = 2114;
          uint64_t v28 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Detected %{public}@ for %{public}@", buf, 0x16u);
        }
        v15 = +[GaletteStore shared];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100425A24;
        v18[3] = &unk_10052D9D0;
        id v19 = v12;
        uint64_t v20 = v10;
        id v16 = v12;
        [v15 modifyUsingTransaction:v18];
      }
      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

+ (void)handleUninstalledAppsWithBundleIDs:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x3032000000;
        id v16 = sub_1000184C8;
        long long v17 = sub_100017E20;
        id v18 = 0;
        uint64_t v8 = +[GaletteStore shared];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100425D98;
        v12[3] = &unk_10052A258;
        v12[4] = v7;
        v12[5] = &v13;
        [v8 readUsingSession:v12];

        v9 = (void *)v14[5];
        if (!v9 || ![v9 mode])
        {
          _Block_object_dispose(&v13, 8);

          goto LABEL_12;
        }
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100425DE8;
        v11[3] = &unk_10052D9F8;
        v11[5] = &v13;
        v11[6] = a1;
        v11[4] = v7;
        [a1 _appDeleteAlertIsEnabledWithReply:v11];
        _Block_object_dispose(&v13, 8);
      }
      id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

+ (void)_showUninstallAlertForApp:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = sub_100286AF0((unint64_t)[v6 mode]);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v9;
    __int16 v29 = 2114;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will show uninstall alert for %{public}@ for %{public}@", buf, 0x16u);
  }
  uint64_t v10 = ASDLocalizedString();
  v11 = [v6 name];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

  uint64_t v13 = ASDLocalizedString();
  v14 = ASDLocalizedString();
  uint64_t v15 = +[AMSDialogRequest requestWithTitle:v12 message:v13];
  id v16 = +[AMSDialogAction actionWithTitle:v14];
  v26 = v16;
  long long v17 = +[NSArray arrayWithObjects:&v26 count:1];
  [v15 setButtonActions:v17];

  id v18 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v15];
  long long v19 = [v18 present];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1004261BC;
  v22[3] = &unk_10052C9F8;
  id v23 = v6;
  id v24 = v7;
  id v25 = a1;
  id v20 = v7;
  id v21 = v6;
  [v19 addFinishBlock:v22];
}

+ (void)_cleanupAfterUninstallingBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _galetteAppForBundleID:v4];
  id v6 = v5;
  if (v5 && [v5 mode])
  {
    id v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = sub_100286AF0((unint64_t)[v6 mode]);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Detected another app with %{public}@, will not remove persisted record for %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9 = +[GaletteStore shared];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004264AC;
    v10[3] = &unk_10052A230;
    v11 = v4;
    [v9 modifyUsingTransaction:v10];

    id v7 = v11;
  }
}

+ (id)_galetteAppForBundleID:(id)a3
{
  id v3 = a3;
  id v16 = 0;
  id v4 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v3 allowPlaceholder:1 error:&v16];
  id v5 = v16;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v3;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to lookup bundle record for %{public}@, will assume no entitlements: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = [v4 entitlements];
    uint64_t v8 = [v7 objectForKey:@"com.apple.developer.storekit.external-purchase-link" ofClass:objc_opt_class()];
    unsigned __int8 v9 = [v8 BOOLValue];

    if (v9)
    {
      uint64_t v10 = 1;
LABEL_12:
      uint64_t v13 = [v4 localizedName];
      __int16 v14 = +[GaletteAppMemoryEntity appWithBundleID:v3 mode:v10 name:v13];

      goto LABEL_14;
    }
    v11 = [v7 objectForKey:@"com.apple.developer.storekit.external-purchase" ofClass:objc_opt_class()];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      uint64_t v10 = 2;
      goto LABEL_12;
    }
  }
  __int16 v14 = 0;
LABEL_14:

  return v14;
}

+ (void)_appDeleteAlertIsEnabledWithReply:(id)a3
{
  id v3 = a3;
  id v4 = sub_10030B11C();
  id v5 = [v4 BOOLForKey:@"storekit-external-purchases-app-delete-alert"];

  BOOL v6 = [v5 valuePromise];
  id v7 = [v6 promiseWithTimeout:0.5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100426868;
  v9[3] = &unk_1005216C0;
  id v10 = v3;
  id v8 = v3;
  [v7 addFinishBlock:v9];
}

@end