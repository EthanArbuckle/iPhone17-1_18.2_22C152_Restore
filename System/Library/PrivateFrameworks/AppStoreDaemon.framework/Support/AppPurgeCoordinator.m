@interface AppPurgeCoordinator
- (AppPurgeCoordinator)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
- (void)cacheInvalidated;
@end

@implementation AppPurgeCoordinator

- (AppPurgeCoordinator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppPurgeCoordinator;
  v2 = [(AppPurgeCoordinator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AppPurgeCoordinator *)v2 cacheInvalidated];
  }
  return v3;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(_TtC9appstored6LogKey);
  sub_10021C6B0((uint64_t)self, v11);
  v12 = sub_10021F988((char *)self, v10, (char *)1, v9, v8);
  v13 = sub_10021F988((char *)self, v10, (char *)2, v9, v8);
  v14 = sub_10021F988((char *)self, v10, (char *)3, v9, v8);
  v15 = sub_10021F988((char *)self, v10, (char *)4, v9, v8);

  v22[0] = &off_10054B838;
  v16 = +[NSNumber numberWithLongLong:v12];
  v23[0] = v16;
  v22[1] = &off_10054B850;
  v17 = +[NSNumber numberWithLongLong:v13];
  v23[1] = v17;
  v22[2] = &off_10054B868;
  v18 = +[NSNumber numberWithLongLong:v14];
  v23[2] = v18;
  v22[3] = &off_10054B880;
  v19 = +[NSNumber numberWithLongLong:v15];
  v23[3] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  return v20;
}

- (void)cacheInvalidated
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v85 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@] cacheInvalidated ", buf, 0xCu);
  }

  objc_super v5 = self;
  objc_sync_enter(v5);
  v58 = v3;
  v64 = v5;
  if (v5)
  {
    v59 = +[NSMutableArray array];
    sub_10035E1E4();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [obj countByEnumeratingWithState:&v67 objects:buf count:16];
    if (!v6) {
      goto LABEL_41;
    }
    id v62 = *(id *)v68;
    *(void *)&long long v7 = 138412802;
    long long v57 = v7;
    while (1)
    {
      id v65 = v6;
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(id *)v68 != v62) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if (sub_10021C4D0((uint64_t)v64, v9))
        {
          v11 = [v9 VPNPlugins];
          BOOL v12 = [v11 count] == 0;

          if (!v12)
          {
            v13 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = [v9 bundleIdentifier];
              *(_DWORD *)v71 = 138412546;
              v72 = v58;
              __int16 v73 = 2114;
              v74 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Added deny listed app with VPN plugin", v71, 0x16u);
            }
            goto LABEL_13;
          }
          v16 = [v9 driverExtensionPaths];
          BOOL v17 = [v16 count] == 0;

          if (v17)
          {
            v15 = [v9 entitlements];
            long long v82 = 0u;
            long long v83 = 0u;
            memset(v81, 0, sizeof(v81));
            id v19 = [&off_10054DD28 countByEnumeratingWithState:v81 objects:&v77 count:16];
            if (v19)
            {
              uint64_t v20 = **(void **)&v81[16];
              while (2)
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (**(void **)&v81[16] != v20) {
                    objc_enumerationMutation(&off_10054DD28);
                  }
                  uint64_t v22 = *(void *)(*(void *)&v81[8] + 8 * (void)j);
                  v23 = objc_msgSend(v9, "bundleIdentifier", v57);
                  BOOL v24 = [v23 length] == 0;

                  if (!v24)
                  {
                    v25 = [v15 objectForKey:v22 ofClass:objc_opt_class()];
                    v26 = v25;
                    if (v25 && [v25 BOOLValue])
                    {
                      v29 = [v9 bundleIdentifier];
                      [(NSArray *)v59 addObject:v29];

                      v28 = ASDLogHandleForCategory();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                      {
                        v30 = [v9 bundleIdentifier];
                        *(_DWORD *)v71 = v57;
                        v72 = v58;
                        __int16 v73 = 2114;
                        v74 = v30;
                        __int16 v75 = 2114;
                        uint64_t v76 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Added to deny listed because of entitlement: %{public}@", v71, 0x20u);
                      }
                      goto LABEL_37;
                    }
                    v27 = [v15 objectForKey:v22 ofClass:objc_opt_class()];
                    v28 = v27;
                    if (v27 && [v27 count])
                    {
                      v31 = [v9 bundleIdentifier];
                      [(NSArray *)v59 addObject:v31];

                      v32 = ASDLogHandleForCategory();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                      {
                        v33 = [v9 bundleIdentifier];
                        *(_DWORD *)v71 = v57;
                        v72 = v58;
                        __int16 v73 = 2114;
                        v74 = v33;
                        __int16 v75 = 2114;
                        uint64_t v76 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Added to deny listed because of entitlement: %{public}@", v71, 0x20u);
                      }
LABEL_37:

                      goto LABEL_38;
                    }
                  }
                }
                id v19 = [&off_10054DD28 countByEnumeratingWithState:v81 objects:&v77 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            v13 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v18 = [v9 bundleIdentifier];
              *(_DWORD *)v71 = 138412546;
              v72 = v58;
              __int16 v73 = 2114;
              v74 = v18;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Added deny listed app with DriverKit extension", v71, 0x16u);
            }
LABEL_13:

            v15 = [v9 bundleIdentifier];
            [(NSArray *)v59 addObject:v15];
          }
LABEL_38:
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v67 objects:buf count:16];
      if (!v6)
      {
LABEL_41:

        goto LABEL_42;
      }
    }
  }
  v59 = 0;
LABEL_42:

  cachedBundleIDDenyList = v64->_cachedBundleIDDenyList;
  v64->_cachedBundleIDDenyList = v59;

  v66 = v58;
  obja = (NSArray *)objc_opt_new();
  v35 = +[NRPairedDeviceRegistry sharedInstance];
  v36 = [v35 getPairedDevices];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v63 = v36;
  id v37 = [v63 countByEnumeratingWithState:&v77 objects:buf count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v78;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v78 != v38) {
          objc_enumerationMutation(v63);
        }
        v40 = *(void **)(*((void *)&v77 + 1) + 8 * (void)k);
        v41 = objc_opt_new();
        dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
        v43 = +[ACXDeviceConnection sharedDeviceConnection];
        *(void *)&long long v67 = _NSConcreteStackBlock;
        *((void *)&v67 + 1) = 3221225472;
        *(void *)&long long v68 = sub_1002225A0;
        *((void *)&v68 + 1) = &unk_100522798;
        *(void *)&long long v69 = v66;
        v44 = v42;
        *((void *)&v69 + 1) = v44;
        id v45 = v41;
        *(void *)&long long v70 = v45;
        [v43 enumerateInstalledApplicationsOnPairedDevice:v40 withBlock:&v67];

        dispatch_time_t v46 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(v44, v46))
        {
          v47 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = [v40 pairingID];
            *(_DWORD *)v81 = 138412546;
            *(void *)&v81[4] = v66;
            *(_WORD *)&v81[12] = 2114;
            *(void *)&v81[14] = v48;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "[%@] Timed out getting watch apps for %{public}@", v81, 0x16u);
          }
        }
        else
        {
          [(NSArray *)obja addObjectsFromArray:v45];
        }
      }
      id v37 = [v63 countByEnumeratingWithState:&v77 objects:buf count:16];
    }
    while (v37);
  }

  if ([(NSArray *)obja count])
  {
    v49 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [(NSArray *)obja componentsJoinedByString:@", "];
      *(_DWORD *)v81 = 138412546;
      *(void *)&v81[4] = v66;
      *(_WORD *)&v81[12] = 2114;
      *(void *)&v81[14] = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[%@] Active app bundles with watch apps are: [%{public}@]", v81, 0x16u);
    }
  }

  watchAppList = v64->_watchAppList;
  v64->_watchAppList = obja;

  v52 = +[MCProfileConnection sharedConnection];
  uint64_t v53 = [v52 managedAppBundleIDs];
  managedBundleIDs = v64->_managedBundleIDs;
  v64->_managedBundleIDs = (NSArray *)v53;

  if ([(NSArray *)v64->_managedBundleIDs count])
  {
    v55 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = [(NSArray *)v64->_managedBundleIDs componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      v85 = v66;
      __int16 v86 = 2114;
      v87 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%@] Device has the following managed apps: %{public}@", buf, 0x16u);
    }
  }
  objc_sync_exit(v64);
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  return (int64_t)[(AppPurgeCoordinator *)self purgeableForVolume:a3 urgency:a4 override:0 client:a5];
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  self;
  if (sub_1003F1E7C((uint64_t)AppDefaultsManager, @"OffloadUnusedApps", 0)
    && (sub_1003DA6D4(),
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isHRNMode],
        v13,
        (v14 & 1) == 0))
  {
    v16 = [[KeepAlive alloc] initWithName:@"com.apple.appstored.purge"];
    BOOL v17 = objc_alloc_init(_TtC9appstored6LogKey);
    id v18 = [v11 longLongValue];
    id v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v30 = v17;
      __int16 v31 = 2048;
      id v32 = v18;
      __int16 v33 = 2048;
      int64_t v34 = a4;
      __int16 v35 = 2114;
      id v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Offload started with desired purged: %{bytes}ld urgency: %ld for client: %{public}@", buf, 0x2Au);
    }

    id v20 = [objc_alloc((Class)ASDPurgeAppsRequestOptions) initWithVolume:v10 urgency:a4];
    [v20 setPerformAvailablityCheck:0];
    [v20 setApps:0];
    [v20 setDesiredPurgeAmount:v11];
    [v20 setOffloadOnly:1];
    v21 = sub_10021EF3C(self, v20, v17, v12);
    uint64_t v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v21 purgedApps];
      id v23 = [v28 count];
      BOOL v24 = v16;
      id v25 = [v11 longValue];
      id v26 = [v21 purgedSize];
      *(_DWORD *)buf = 138413314;
      v30 = v17;
      __int16 v31 = 2048;
      id v32 = v23;
      __int16 v33 = 2048;
      int64_t v34 = (int64_t)v25;
      v16 = v24;
      __int16 v35 = 2048;
      id v36 = v26;
      __int16 v37 = 2114;
      id v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Offload complete with offloaded apps: %ld desired purged: %{bytes}ld total purged: %{bytes}ld for client: %{public}@", buf, 0x34u);
    }
    id v15 = [v21 purgedSize];
  }
  else
  {
    id v15 = 0;
  }

  return (int64_t)v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAppList, 0);
  objc_storeStrong((id *)&self->_managedBundleIDs, 0);
  objc_storeStrong((id *)&self->_cachedBundleIDDenyList, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
}

@end