@interface WeatherXPCAppRemovalService
- (id)appContainerPath;
- (id)deleteAllFilesInDirectory:(id)a3;
- (id)deleteAllFilesInDirectory:(id)a3 except:(id)a4;
- (id)deleteAllUserDefaults;
- (id)deleteNanoUserDefaults;
- (id)removeUserDefaults:(id)a3 container:(id)a4 doNanoSync:(BOOL)a5;
- (void)removeAppWithReply:(id)a3;
@end

@implementation WeatherXPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v4 = (void (**)(id, WeatherDaemonDecommissioner *))a3;
  v5 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting AppRemoval.", buf, 2u);
  }

  v6 = [(WeatherXPCAppRemovalService *)self deleteAllUserDefaults];
  if (v6
    || ([(WeatherXPCAppRemovalService *)self deleteNanoUserDefaults],
        (v6 = (WeatherDaemonDecommissioner *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000067D8();
    }

    v4[2](v4, v6);
  }
  else
  {
    v8 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Now decommissioning the weather daemon.", buf, 2u);
    }

    v6 = objc_alloc_init(WeatherDaemonDecommissioner);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000052B8;
    v9[3] = &unk_1000082A8;
    v9[4] = self;
    v10 = v4;
    [(WeatherDaemonDecommissioner *)v6 decomissionDaemonWithCompletion:v9];
  }
}

- (id)removeUserDefaults:(id)a3 container:(id)a4 doNanoSync:(BOOL)a5
{
  BOOL v5 = a5;
  applicationID = (__CFString *)a3;
  id v7 = a4;
  v8 = os_log_xpcAppRemoval();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  v33 = v7;
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Container is %@.", buf, 0xCu);
    }

    v10 = (void *)_CFPreferencesCopyKeyListWithContainer();
    if (v10)
    {
      BOOL v32 = v5;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      CFArrayRef v11 = v10;
      id v12 = [(__CFArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v36;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v17 = os_log_xpcAppRemoval();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing Default key: %@", buf, 0xCu);
            }

            _CFPreferencesSetValueWithContainer();
          }
          id v13 = [(__CFArray *)v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v13);
      }

      if (!_CFPreferencesSynchronizeWithContainer())
      {
        v43[0] = NSLocalizedDescriptionKey;
        v43[1] = @"BundleId";
        v44[0] = @"Unable to synchronize User Defaults for AppRemoval.";
        v44[1] = @"com.apple.weather";
        v18 = v44;
        v19 = v43;
LABEL_32:
        v28 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:2];
        v27 = +[NSError errorWithDomain:@"com.apple.weather.appremoval.errorDomain" code:-1 userInfo:v28];

        goto LABEL_33;
      }
      goto LABEL_29;
    }
LABEL_30:
    v27 = 0;
    CFArrayRef v11 = 0;
    goto LABEL_36;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Container is nil.", buf, 2u);
  }

  CFArrayRef v20 = CFPreferencesCopyKeyList(applicationID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (!v20) {
    goto LABEL_30;
  }
  BOOL v32 = v5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  CFArrayRef v11 = v20;
  id v21 = [(__CFArray *)v11 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v11);
        }
        v25 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        v26 = os_log_xpcAppRemoval();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removing Default key: %@", buf, 0xCu);
        }
      }
      id v22 = [(__CFArray *)v11 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v22);
  }

  CFPreferencesSetMultiple(0, v11, applicationID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (!CFPreferencesSynchronize(applicationID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v46[0] = NSLocalizedDescriptionKey;
    v46[1] = @"BundleId";
    v47[0] = @"Unable to synchronize User Defaults for AppRemoval.";
    v47[1] = @"com.apple.weather";
    v18 = v47;
    v19 = v46;
    goto LABEL_32;
  }
LABEL_29:
  v27 = 0;
LABEL_33:
  if (!v27 && v32)
  {
    v29 = objc_opt_new();
    v30 = +[NSSet setWithArray:v11];
    [v29 synchronizeUserDefaultsDomain:applicationID keys:v30];

    v27 = 0;
  }
LABEL_36:

  return v27;
}

- (id)deleteAllUserDefaults
{
  v3 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v16 = @"group.com.apple.weather";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing User Defaults for %@", buf, 0xCu);
  }

  v4 = [(WeatherXPCAppRemovalService *)self appContainerPath];
  BOOL v5 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GroupContainer URL: %@", buf, 0xCu);
  }

  if (!v4)
  {
    CFArrayRef v11 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000068FC(v11);
    }

    v13[0] = @"BundleId";
    v13[1] = @"PrefsGroupId";
    v14[0] = @"com.apple.weather";
    v14[1] = @"group.com.apple.weather";
    v13[2] = NSLocalizedFailureReasonErrorKey;
    v14[2] = @"Group container URL was nil.";
    v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    BOOL v9 = +[NSError errorWithDomain:@"com.apple.weather.appremoval.errorDomain" code:4 userInfo:v10];
    goto LABEL_16;
  }
  +[NSUserActivity deleteAllSavedUserActivitiesWithCompletionHandler:&stru_1000082C8];
  v6 = [(__CFString *)v4 path];
  id v7 = [(WeatherXPCAppRemovalService *)self removeUserDefaults:@"group.com.apple.weather" container:v6 doNanoSync:0];

  if (v7)
  {
    v8 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000069A8();
    }
  }
  BOOL v9 = [(WeatherXPCAppRemovalService *)self removeUserDefaults:@"com.apple.weather.sensitive" container:0 doNanoSync:0];

  if (v9)
  {
    v10 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100006940();
    }
LABEL_16:
  }
  return v9;
}

- (id)appContainerPath
{
  if (qword_10000C9C0 != -1) {
    dispatch_once(&qword_10000C9C0, &stru_1000082E8);
  }
  v2 = (void *)qword_10000C9B8;
  return v2;
}

- (id)deleteNanoUserDefaults
{
  v3 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v48 = @"com.apple.nanoweatherprefs";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing Nano Defaults for: %@", buf, 0xCu);
  }

  v4 = [(WeatherXPCAppRemovalService *)self removeUserDefaults:@"com.apple.nanoweatherprefs" container:0 doNanoSync:1];
  if (!v4)
  {
    BOOL v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = [v5 getPairedDevices];

    id v27 = objc_alloc_init((Class)NPSManager);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v6;
    id v31 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    v4 = 0;
    if (v31)
    {
      uint64_t v29 = NRDevicePropertyPairingID;
      uint64_t v30 = *(void *)v40;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v7);
          id v9 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanoweatherprefs" pairedDevice:v8];
          if (v9)
          {
            v33 = v7;
            v34 = v4;
            v10 = [v8 valueForProperty:v29];
            CFArrayRef v11 = os_log_xpcAppRemoval();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              id v12 = [v10 UUIDString];
              *(_DWORD *)buf = 138412290;
              CFStringRef v48 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing Nano Defaults for device: %@", buf, 0xCu);
            }
            BOOL v32 = v10;

            id v13 = [v9 dictionaryRepresentation];
            uint64_t v14 = [v13 allKeys];

            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v15 = v14;
            id v16 = [v15 countByEnumeratingWithState:&v35 objects:v45 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v36;
              do
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v36 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  CFStringRef v20 = *(const __CFString **)(*((void *)&v35 + 1) + 8 * i);
                  id v21 = os_log_xpcAppRemoval();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v48 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing device specific Nano Default key: %@", buf, 0xCu);
                  }

                  [v9 removeObjectForKey:v20];
                }
                id v17 = [v15 countByEnumeratingWithState:&v35 objects:v45 count:16];
              }
              while (v17);
            }

            id v22 = [v9 synchronize];

            if (v22)
            {
              uint64_t v23 = os_log_xpcAppRemoval();
              v24 = v32;
              id v7 = v33;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v48 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error synchronizing NanoDomain. error=%@", buf, 0xCu);
              }

              v43[0] = NSLocalizedDescriptionKey;
              v43[1] = @"BundleId";
              v44[0] = @"Unable to synchronize device specific Nano defaults for AppRemoval.";
              v44[1] = @"com.apple.weather";
              v25 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
              v4 = +[NSError errorWithDomain:@"com.apple.weather.appremoval.errorDomain" code:-1 userInfo:v25];
            }
            else
            {
              v25 = +[NSSet setWithArray:v15];
              [v27 synchronizeNanoDomain:@"com.apple.nanoweatherprefs" keys:v25];
              v4 = 0;
              v24 = v32;
              id v7 = v33;
            }
          }
          id v7 = (char *)v7 + 1;
        }
        while (v7 != v31);
        id v31 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v31);
    }
  }
  return v4;
}

- (id)deleteAllFilesInDirectory:(id)a3
{
  return [(WeatherXPCAppRemovalService *)self deleteAllFilesInDirectory:a3 except:0];
}

- (id)deleteAllFilesInDirectory:(id)a3 except:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 path];
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing files in directory: %@", buf, 0xCu);
  }
  id v9 = +[NSFileManager defaultManager];
  v10 = [v5 path];
  CFArrayRef v11 = [v9 enumeratorAtPath:v10];
  uint64_t v12 = [v11 nextObject];
  if (v12)
  {
    uint64_t v14 = v12;
    v25 = 0;
    *(void *)&long long v13 = 138412546;
    long long v23 = v13;
    do
    {
      id v15 = (void *)v14;
      while (objc_msgSend(v6, "containsObject:", v15, v23))
      {
        id v16 = os_log_xpcAppRemoval();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping exception %@.", buf, 0xCu);
        }

        [v11 skipDescendants];
        uint64_t v17 = [v11 nextObject];

        id v15 = (void *)v17;
        if (!v17) {
          goto LABEL_20;
        }
      }
      id v24 = v5;
      uint64_t v18 = [v10 stringByAppendingPathComponent:v15];
      id v26 = 0;
      [v9 removeItemAtPath:v18 error:&v26];
      id v19 = v26;
      CFStringRef v20 = os_log_xpcAppRemoval();
      id v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v28 = v18;
          __int16 v29 = 2112;
          uint64_t v30 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error encountered removing item: %@. Error: %@", buf, 0x16u);
        }

        id v21 = v25;
        v25 = v19;
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removed item: %@", buf, 0xCu);
      }

      uint64_t v14 = [v11 nextObject];

      id v5 = v24;
    }
    while (v14);
  }
  else
  {
    v25 = 0;
  }
LABEL_20:

  return v25;
}

@end