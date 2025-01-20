@interface GEOMobileAssetResourceUpdater
+ (id)sharedUpdater;
+ (void)run;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (id)initInternal;
- (void)_fetchAssets;
- (void)_processResources:(id)a3 group:(id)a4;
- (void)_pruneOldResourcesIn:(id)a3;
- (void)_update:(id)a3;
- (void)_updateComplete;
- (void)_updateOnQueue;
@end

@implementation GEOMobileAssetResourceUpdater

+ (id)sharedUpdater
{
  if (qword_1000847D0 != -1) {
    dispatch_once(&qword_1000847D0, &stru_100071B78);
  }
  v2 = (void *)qword_1000847C8;

  return v2;
}

- (id)initInternal
{
  v11.receiver = self;
  v11.super_class = (Class)GEOMobileAssetResourceUpdater;
  v2 = [(GEOMobileAssetResourceUpdater *)&v11 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos();
    updateWorkQueue = v2->_updateWorkQueue;
    v2->_updateWorkQueue = (OS_dispatch_queue *)v3;

    GEOConfigGetDouble();
    if (v5 > 0.0)
    {
      double v6 = v5;
      GEOGetMonotonicTime();
      if (v6 < v7)
      {
        v8 = sub_10000966C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Was updating when geod quit, re-starting update", v10, 2u);
        }

        [(GEOMobileAssetResourceUpdater *)v2 _update:0];
      }
    }
  }
  return v2;
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  if (sub_100022B80())
  {
    v2 = [sub_100022D94() sharedScheduler];
    CFStringRef v3 = (const __CFString *)GEOMobileAssetResourceUpdaterTaskIdentifier;
    v4 = [v2 taskRequestForIdentifier:GEOMobileAssetResourceUpdaterTaskIdentifier];
    if (v4)
    {
      double v5 = sub_10000966C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MobileAsset background task is already scheduled (%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      double v5 = [objc_alloc((Class)sub_10002300C()) initWithIdentifier:v3];
      GEOConfigGetDouble();
      unint64_t v7 = (unint64_t)v6;
      if ((unint64_t)v6 <= 0x3840) {
        unint64_t v7 = 14400;
      }
      if (v7 >= 0x278D00) {
        unint64_t v7 = 2592000;
      }
      [v5 setInterval:(double)v7];
      [v5 setPriority:1];
      [v5 setRequiresExternalPower:1];
      [v5 setRequiresNetworkConnectivity:1];
      [v5 setRequiresInexpensiveNetworkConnectivity:1];
      [v5 setNetworkDownloadSize:10485760];
      id v12 = 0;
      unsigned __int8 v8 = [v2 submitTaskRequest:v5 error:&v12];
      v9 = (__CFString *)v12;
      if ((v8 & 1) == 0)
      {
        v10 = sub_10000966C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = @"Unknown";
          if (v9) {
            CFStringRef v11 = v9;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v14 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to submit repeating task with error: %@", buf, 0xCu);
        }
      }
    }
  }
}

+ (void)run
{
  id v2 = [a1 sharedUpdater];
  [v2 _update:0];
}

- (void)_update:(id)a3
{
  id v4 = a3;
  updateWorkQueue = self->_updateWorkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D8F0;
  v7[3] = &unk_100071888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(updateWorkQueue, v7);
}

- (void)_updateOnQueue
{
  if (self->_running)
  {
    id v2 = sub_10000966C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Already running, will not start again", buf, 2u);
    }
  }
  else
  {
    self->_running = 1;
    GEOGetMonotonicTime();
    GEOConfigSetDouble();
    id v4 = sub_10000966C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fetching MA catalog", buf, 2u);
    }

    id v2 = objc_alloc_init((Class)sub_100025ECC());
    [v2 setAllowsCellularAccess:0];
    [v2 setAllowsExpensiveAccess:0];
    [v2 setDiscretionary:1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001DAA0;
    v5[3] = &unk_100071BC8;
    v5[4] = self;
    [sub_100025C54() startCatalogDownload:@"com.apple.MobileAsset.GeoPolygonDataAssets" options:v2 then:v5];
  }
}

- (void)_updateComplete
{
  CFStringRef v3 = sub_10000966C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Update complete", v4, 2u);
  }

  self->_running = 0;
  _GEOConfigRemoveValue();
}

- (void)_fetchAssets
{
  CFStringRef v3 = dispatch_group_create();
  sub_100035A2C();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      unint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v7);
        dispatch_group_enter(v3);
        updateWorkQueue = self->_updateWorkQueue;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10001DE1C;
        v13[3] = &unk_100071BF0;
        v13[4] = v8;
        CFStringRef v14 = v3;
        v15 = self;
        [v8 listResources:1 queue:updateWorkQueue results:v13];

        unint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  v10 = self->_updateWorkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DF38;
  block[3] = &unk_100071490;
  block[4] = self;
  dispatch_group_notify(v3, v10, block);
}

- (void)_processResources:(id)a3 group:(id)a4
{
  id v6 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001E118;
  v19[3] = &unk_100071348;
  id v7 = [a3 mutableCopy];
  id v20 = v7;
  v21 = self;
  id v8 = v6;
  id v22 = v8;
  v9 = objc_retainBlock(v19);
  v10 = [v7 lastObject];
  if (((unint64_t)[v10 state] | 4) == 4) {
    goto LABEL_2;
  }
  CFStringRef v11 = [v10 resourceInfo];
  unint64_t v12 = (unint64_t)[v11 policy];

  if ((v12 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_5;
  }
  v13 = [v10 resourceInfo];
  unsigned int v14 = [v13 isExpired];

  if (v14)
  {
LABEL_2:
    ((void (*)(void *))v9[2])(v9);
  }
  else
  {
LABEL_5:
    updateWorkQueue = self->_updateWorkQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001E160;
    v16[3] = &unk_100071C18;
    id v17 = v10;
    long long v18 = v9;
    [v17 downloadWithOptions:0 queue:updateWorkQueue completion:v16];
  }
}

- (void)_pruneOldResourcesIn:(id)a3
{
  id v3 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (((unint64_t)[v9 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          if (!v6)
          {
            id v6 = +[NSMutableArray array];
          }
          [v6 addObject:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  v10 = [v6 lastObject];
  CFStringRef v11 = [v10 resourceInfo];
  unint64_t v12 = (char *)[v11 policy];

  v27 = v10;
  v28 = v3;
  if ((unint64_t)(v12 - 2) >= 2)
  {
    if (v12 != (char *)1) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v13 = objc_msgSend(v10, "resourceInfo", v10, v3);
  unsigned __int8 v14 = [v13 isExpired];

  if ((v14 & 1) == 0) {
LABEL_18:
  }
    objc_msgSend(v6, "removeLastObject", v27);
LABEL_19:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        v21 = sub_10000966C();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Will delete old resource %@", buf, 0xCu);
        }

        id v29 = 0;
        unsigned int v22 = [v20 remove:&v29];
        id v23 = v29;
        v24 = v23;
        if (v22) {
          BOOL v25 = v23 == 0;
        }
        else {
          BOOL v25 = 0;
        }
        if (!v25)
        {
          v26 = sub_10000966C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v20;
            __int16 v40 = 2112;
            v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to delete old resource %@: %@", buf, 0x16u);
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
}

@end