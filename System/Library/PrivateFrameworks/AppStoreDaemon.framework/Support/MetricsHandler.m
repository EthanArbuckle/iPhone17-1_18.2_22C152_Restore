@interface MetricsHandler
- (BOOL)includeClipDetails;
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (BOOL)shouldEnableSystemAppsForAppUsageType:(int64_t)a3;
- (Class)appEventEntityClass;
- (NSString)deviceID;
- (NSString)topic;
- (_TtC9appstored6LogKey)logKey;
- (id)createAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5 connection:(id)a6;
- (id)createAppEventsWithLaunchEvents:(id)a3;
- (id)getAppEventsWithError:(id *)a3;
- (id)getAppUsageSessionForBundleID:(id)a3;
- (id)getCrashEventsSinceDate:(id)a3;
- (int64_t)appUsageType;
- (void)recordAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5;
- (void)recordLaunches:(id)a3;
@end

@implementation MetricsHandler

- (Class)appEventEntityClass
{
  if ((char *)[(MetricsHandler *)self appUsageType] - 1 > (char *)4) {
    v2 = 0;
  }
  else {
    v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (id)createAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5 connection:(id)a6
{
  unsigned int v61 = a5;
  uint64_t v7 = a4;
  id v9 = a3;
  id v56 = a6;
  v63 = +[NSMutableArray array];
  v55 = +[LSDatabaseContext sharedDatabaseContext];
  unsigned int v54 = [v55 startAccessingReturningError:0];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v66 = *(void *)v70;
    *(void *)&long long v11 = 138412546;
    long long v53 = v11;
    v62 = self;
    unsigned int v60 = v7;
    do
    {
      v13 = 0;
      id v64 = v12;
      do
      {
        if (*(void *)v70 != v66) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v13);
        if (v7 == 3)
        {
          if (self) {
            currentApps = self->_currentApps;
          }
          else {
            currentApps = 0;
          }
          v16 = currentApps;
          v17 = [(NSDictionary *)v16 objectForKeyedSubscript:v14];
          goto LABEL_19;
        }
        v16 = +[ApplicationProxy proxyForBundleID:v14];
        if (!v16)
        {
          v17 = 0;
          goto LABEL_19;
        }
        if ([(MetricsHandler *)self isCandidateAppProxy:v16 isMetadataLookup:0])
        {
          v17 = sub_1003A3448([AppMetadata alloc], v16);
          if ([(MetricsHandler *)self shouldEnableSystemAppsForAppUsageType:[(MetricsHandler *)self appUsageType]])
          {
            if ([(NSDictionary *)v16 applicationType] == (id)1)
            {
              v18 = sub_1003A3970(v17);

              if (!v18)
              {
                uint64_t v19 = sub_10031CA20();
                v83 = v14;
                v20 = +[NSArray arrayWithObjects:&v83 count:1];
                id v68 = 0;
                v21 = (void *)v19;
                v22 = sub_10031D428(v19, v20, &v68);
                id v23 = v68;

                id v58 = v23;
                v59 = v22;
                if (v23)
                {
                  v24 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    v47 = [(MetricsHandler *)self logKey];
                    *(_DWORD *)buf = v53;
                    v74 = v47;
                    __int16 v75 = 2114;
                    v25 = v58;
                    v76 = v58;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%@] Error looking up system apps. Error: %{public}@", buf, 0x16u);

                    id v12 = v64;
                  }
                  else
                  {
                    id v12 = v64;
                    v25 = v58;
                  }
                  goto LABEL_45;
                }
                uint64_t v46 = [v22 objectForKeyedSubscript:v14];
                id v12 = v64;
                v25 = 0;
                if (v46)
                {
                  v24 = v46;
                  [v17 setValue:v46 forProperty:@"item_id"];
                  log = ASDLogHandleForCategory();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                  {
                    v48 = sub_10022DD24((uint64_t)AppEvent, v7);
                    v49 = [(MetricsHandler *)self logKey];
                    *(_DWORD *)buf = 138413058;
                    v74 = v48;
                    __int16 v75 = 2114;
                    v76 = v14;
                    __int16 v77 = 2114;
                    v78 = v49;
                    __int16 v79 = 2114;
                    v80 = v24;
                    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] [%{public}@] Mapped itemID: %{public}@ to system app", buf, 0x2Au);

                    id v12 = v64;
                  }

LABEL_45:
                }
              }
            }
          }
LABEL_19:

          if (v17 && [(MetricsHandler *)self isCandidateAppMetadata:v17])
          {
            v26 = sub_10022D3F8([AppEvent alloc], v17);
            if (v26)
            {
              v27 = +[NSNumber numberWithUnsignedChar:v7];
              [v26 setValue:v27 forProperty:@"event_type"];

              if (v7 == 1)
              {
                v28 = +[NSNumber numberWithUnsignedChar:v61];
                [v26 setValue:v28 forProperty:@"event_subtype"];
              }
              id v12 = v64;
              if (sub_10022E9C4(v26) && (id)[(MetricsHandler *)self appUsageType] == (id)1)
              {
                v29 = [(MetricsHandler *)self getAppUsageSessionForBundleID:v14];
                v30 = sub_10025AE54(v29);

                if (v30)
                {
                  v31 = sub_10025AE54(v29);
                  [v26 setValue:v31 forProperty:@"device_vendor_id"];

                  v32 = ASDLogHandleForCategory();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    v33 = [(MetricsHandler *)self logKey];
                    v34 = sub_10022DD24((uint64_t)AppEvent, v7);
                    v35 = sub_10025AE54(v29);
                    *(_DWORD *)buf = 138413058;
                    v74 = v33;
                    __int16 v75 = 2114;
                    v76 = v34;
                    __int16 v77 = 2114;
                    v78 = v14;
                    __int16 v79 = 2114;
                    v80 = v35;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%@] [%{public}@] [%{public}@] Using generated deviceVendorID: %{public}@", buf, 0x2Au);

                    self = v62;
                  }
                }
                id v12 = v64;
              }
              objc_msgSend(v63, "addObject:", v26, v53);
              v36 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = [(MetricsHandler *)self logKey];
                v38 = sub_10022DD24((uint64_t)AppEvent, v7);
                v39 = sub_1003A3938(v17);
                v40 = [v17 valueForProperty:@"short_version"];
                v41 = sub_1003A3F54(v17);
                *(_DWORD *)buf = 138413314;
                v74 = v37;
                __int16 v75 = 2114;
                v76 = v38;
                __int16 v77 = 2114;
                v78 = v39;
                __int16 v79 = 2114;
                v80 = v40;
                __int16 v81 = 2114;
                v82 = v41;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@ bundleVersion: %{public}@", buf, 0x34u);

                uint64_t v7 = v60;
                self = v62;

                id v12 = v64;
              }
            }
          }
          else
          {
            v26 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v42 = [(MetricsHandler *)self logKey];
              v43 = sub_10022DD24((uint64_t)AppEvent, v7);
              *(_DWORD *)buf = 138413058;
              v74 = v42;
              __int16 v75 = 2114;
              v76 = v43;
              __int16 v77 = 2114;
              v78 = v14;
              __int16 v79 = 1024;
              LODWORD(v80) = v17 == 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] [%{public}@] Not creating event for non-candidate app hasMetadata: %{BOOL}d", buf, 0x26u);

              id v12 = v64;
            }
          }
          goto LABEL_39;
        }
        v26 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [(MetricsHandler *)self logKey];
          v45 = sub_10022DD24((uint64_t)AppEvent, v7);
          *(_DWORD *)buf = 138412802;
          v74 = v44;
          __int16 v75 = 2114;
          v76 = v45;
          __int16 v77 = 2114;
          v78 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] [%{public}@] Not creating app event for non-candidate", buf, 0x20u);

          id v12 = v64;
        }
        v17 = v16;
LABEL_39:

        v13 = (char *)v13 + 1;
      }
      while (v12 != v13);
      id v50 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
      id v12 = v50;
    }
    while (v50);
  }

  if (v54) {
    [v55 stopAccessing];
  }
  id v51 = objc_msgSend(v63, "copy", v53);

  return v51;
}

- (id)createAppEventsWithLaunchEvents:(id)a3
{
  id v4 = a3;
  uint64_t v66 = +[NSMutableArray array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v69;
    id v63 = v5;
    uint64_t v65 = *(void *)v69;
    do
    {
      id v9 = 0;
      id v67 = v7;
      do
      {
        if (*(void *)v69 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v9);
        if (self) {
          currentApps = self->_currentApps;
        }
        else {
          currentApps = 0;
        }
        id v12 = currentApps;
        if (v10) {
          v13 = *(void **)(v10 + 40);
        }
        else {
          v13 = 0;
        }
        id v14 = v13;
        v15 = [(NSDictionary *)v12 objectForKeyedSubscript:v14];

        if (!v15)
        {
          v17 = ASDLogHandleForCategory();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_57;
          }
          v32 = [(MetricsHandler *)self logKey];
          if (v10) {
            v33 = *(void **)(v10 + 40);
          }
          else {
            v33 = 0;
          }
          id v34 = v33;
          *(_DWORD *)buf = 138412546;
          v73 = v32;
          __int16 v74 = 2114;
          id v75 = v34;
          v35 = v17;
          v36 = "[%@] [%{public}@] Could not find app metadata";
LABEL_40:
          _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0x16u);

          goto LABEL_57;
        }
        if (![(MetricsHandler *)self isCandidateAppMetadata:v15])
        {
          v17 = ASDLogHandleForCategory();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_57;
          }
          v32 = [(MetricsHandler *)self logKey];
          if (v10) {
            v37 = *(void **)(v10 + 40);
          }
          else {
            v37 = 0;
          }
          id v34 = v37;
          *(_DWORD *)buf = 138412546;
          v73 = v32;
          __int16 v74 = 2114;
          id v75 = v34;
          v35 = v17;
          v36 = "[%@] [%{public}@] Skipping non candidate app";
          goto LABEL_40;
        }
        v16 = sub_10022D3F8([AppEvent alloc], v15);
        v17 = v16;
        if (!v16) {
          goto LABEL_57;
        }
        [v16 setValue:&off_10054C918 forProperty:@"event_type"];
        if (v10)
        {
          v18 = +[NSNumber numberWithLongLong:*(void *)(v10 + 144)];
          [v17 setValue:v18 forProperty:@"usage_time"];

          uint64_t v19 = *(void **)(v10 + 24);
        }
        else
        {
          v59 = +[NSNumber numberWithLongLong:0];
          [v17 setValue:v59 forProperty:@"usage_time"];

          uint64_t v19 = 0;
        }
        id v20 = v19;

        if (v20)
        {
          if (v10) {
            v21 = *(void **)(v10 + 24);
          }
          else {
            v21 = 0;
          }
          id v22 = v21;
          [v17 setValue:v22 forProperty:@"launch_time"];
        }
        if (v10) {
          id v23 = *(void **)(v10 + 16);
        }
        else {
          id v23 = 0;
        }
        id v24 = v23;

        if (v24)
        {
          if (v10) {
            v25 = *(void **)(v10 + 16);
          }
          else {
            v25 = 0;
          }
          id v26 = v25;
          [v17 setValue:v26 forProperty:@"launch_end_time"];
        }
        unsigned int v27 = [(MetricsHandler *)self includeClipDetails];
        if (v10 && v27 && *(unsigned char *)(v10 + 10))
        {
          [v17 setValue:&off_10054C930 forProperty:@"is_clip"];
          id v28 = *(id *)(v10 + 96);
          if (v28)
          {
            id v29 = v28;
            id v30 = *(id *)(v10 + 96);
            if ([v30 isEqualToString:@"App Referral"])
            {
              id v31 = *(id *)(v10 + 112);

              if (v31)
              {
                id v29 = *(id *)(v10 + 112);
                [v17 setValue:v29 forProperty:@"clip_ref_source"];
                goto LABEL_42;
              }
            }
            else
            {

LABEL_42:
            }
          }
          id v38 = *(id *)(v10 + 96);

          if (v38)
          {
            id v39 = *(id *)(v10 + 96);
            [v17 setValue:v39 forProperty:@"clip_ref_type"];
          }
          id v40 = *(id *)(v10 + 88);

          if (v40)
          {
            v41 = [CampaignTokens alloc];
            id v42 = *(id *)(v10 + 88);
            v43 = sub_1003A3128(v41, v42);

            sub_10022EBC0(v17, v43);
          }
          [v17 setValue:@"clip" forProperty:@"clip_app_type"];
          v44 = [v17 valueForProperty:@"bundle_id"];
          v45 = [(MetricsHandler *)self getAppUsageSessionForBundleID:v44];

          uint64_t v46 = sub_10025AE54(v45);

          id v7 = v67;
          if (v46)
          {
            v47 = sub_10025AE54(v45);
            [v17 setValue:v47 forProperty:@"device_vendor_id"];

            v48 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = [(MetricsHandler *)self logKey];
              id v50 = [v17 valueForProperty:@"bundle_id"];
              id v51 = sub_10025AE54(v45);
              *(_DWORD *)buf = 138412802;
              v73 = v49;
              __int16 v74 = 2114;
              id v75 = v50;
              __int16 v76 = 2114;
              __int16 v77 = v51;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Using deviceVendorID: %{public}@", buf, 0x20u);

              id v5 = v63;
              id v7 = v67;
            }
          }
        }
        [v66 addObject:v17];
        v52 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          id v64 = [(MetricsHandler *)self logKey];
          long long v53 = sub_10022DD24((uint64_t)AppEvent, 2u);
          unsigned int v54 = sub_1003A3938(v15);
          v55 = [v15 valueForProperty:@"short_version"];
          uint64_t v56 = sub_1003A3F54(v15);
          v57 = (void *)v56;
          if (v10) {
            uint64_t v58 = *(void *)(v10 + 144);
          }
          else {
            uint64_t v58 = 0;
          }
          *(_DWORD *)buf = 138413570;
          v73 = v64;
          __int16 v74 = 2114;
          id v75 = v53;
          __int16 v76 = 2114;
          __int16 v77 = v54;
          __int16 v78 = 2114;
          __int16 v79 = v55;
          __int16 v80 = 2114;
          uint64_t v81 = v56;
          __int16 v82 = 2048;
          uint64_t v83 = v58;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] [%{public}@] Created app event with version: %{public}@ bundleVersion: %{public}@ duration: %lld", buf, 0x3Eu);

          id v5 = v63;
          id v7 = v67;
        }

        uint64_t v8 = v65;
LABEL_57:

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v60 = [v5 countByEnumeratingWithState:&v68 objects:v84 count:16];
      id v7 = v60;
    }
    while (v60);
  }

  id v61 = [v66 copy];
  return v61;
}

- (NSString)deviceID
{
  return 0;
}

- (id)getAppEventsWithError:(id *)a3
{
  return 0;
}

- (id)getAppUsageSessionForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  unsigned int v27 = sub_100018228;
  id v28 = sub_100017CD0;
  id v29 = 0;
  id v5 = sub_10038F000();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100335094;
  v21[3] = &unk_100522858;
  id v6 = v4;
  id v22 = v6;
  id v23 = &v24;
  [v5 readUsingSession:v21];

  id v7 = v25[5];
  if (!v7 || sub_10025AF0C(v7))
  {
    uint64_t v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(MetricsHandler *)self logKey];
      int v10 = sub_10025AF0C(v25[5]);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 1024;
      int v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Creating fresh app usage session entity. Was expired: %d", buf, 0x1Cu);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v31) = 0;
    long long v11 = sub_10025AC8C([AppUsageSession alloc], v6);
    id v12 = sub_10038F000();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003351E8;
    v16[3] = &unk_100528850;
    id v20 = buf;
    id v13 = v11;
    id v17 = v13;
    v18 = self;
    id v19 = v6;
    [v12 modifyUsingTransaction:v16];

    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      objc_storeStrong(v25 + 5, v11);
    }

    _Block_object_dispose(buf, 8);
  }
  id v14 = v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)getCrashEventsSinceDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100018228;
    id v22 = sub_100017CD0;
    id v23 = (id)objc_opt_new();
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = +[CrashCoordinator shared];
    id v7 = [(MetricsHandler *)self logKey];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003355DC;
    v15[3] = &unk_100527DC0;
    v15[4] = self;
    id v17 = &v18;
    uint64_t v8 = v5;
    v16 = v8;
    [v6 getBiomeCrashesWithLogKey:v7 startDate:v4 completionHandler:v15];

    dispatch_time_t v9 = dispatch_time(0, 90000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      int v10 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v25 = v13;
        id v14 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Timed out waiting to sync crashes", buf, 0xCu);
      }
    }
    id v11 = [(id)v19[5] copy];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (BOOL)includeClipDetails
{
  return 0;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  return 0;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  return 0;
}

- (void)recordAppEventsForBundleIDs:(id)a3 eventType:(unsigned __int8)a4 installType:(unsigned __int8)a5
{
  id v8 = a3;
  dispatch_time_t v9 = [(MetricsHandler *)self appEventEntityClass];
  if (v9)
  {
    int v10 = v9;
    id v11 = sub_10038F000();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100335D18;
    v12[3] = &unk_100528878;
    v12[4] = self;
    unsigned __int8 v15 = a4;
    unsigned __int8 v16 = a5;
    id v13 = v8;
    id v14 = v10;
    [v11 modifyUsingTransaction:v12];
  }
}

- (void)recordLaunches:(id)a3
{
  id v4 = [(MetricsHandler *)self createAppEventsWithLaunchEvents:a3];
  if ([v4 count])
  {
    dispatch_semaphore_t v5 = sub_10038F000();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100335F84;
    v6[3] = &unk_1005228E8;
    id v7 = v4;
    id v8 = self;
    [v5 modifyUsingTransaction:v6];
  }
}

- (BOOL)shouldCollectMetrics
{
  return 0;
}

- (BOOL)shouldEnableSystemAppsForAppUsageType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = sub_10030B11C();
    id v4 = v3;
    if (v3)
    {
      dispatch_semaphore_t v5 = @"crossfire-deletable-system-apps-enabled";
      uint64_t v6 = 0;
      goto LABEL_7;
    }
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_8;
  }
  if (a3 != 2) {
    return 0;
  }
  v3 = sub_10030B11C();
  id v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  dispatch_semaphore_t v5 = @"dnu-deletable-system-apps-enabled";
  uint64_t v6 = 1;
LABEL_7:
  unsigned __int8 v7 = sub_10030CE24(v3, v5, (void *)v6, 1);
LABEL_8:

  return v7;
}

- (NSString)topic
{
  return 0;
}

- (int64_t)appUsageType
{
  return self->_appUsageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentApps, 0);
  objc_storeStrong((id *)&self->_baseLogKey, 0);
  objc_storeStrong((id *)&self->_activeDSID, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_os, 0);
}

@end