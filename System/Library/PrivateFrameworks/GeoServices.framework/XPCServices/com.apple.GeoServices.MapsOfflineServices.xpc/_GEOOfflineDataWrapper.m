@interface _GEOOfflineDataWrapper
- (BOOL)hasDataForKey:(id)a3;
- (id)getDataFileURLSync:(id)a3 sandboxExtensionOwner:(id *)a4;
- (id)getDataSync:(id)a3;
- (void)getAvailableKeysForLayer:(unsigned int)a3 callback:(id)a4;
- (void)getAvailableRegionsWithCallback:(id)a3;
- (void)getDataAsync:(id)a3 callback:(id)a4;
- (void)getDataFileURLAsync:(id)a3 callback:(id)a4;
- (void)hasDataForKey:(id)a3 callback:(id)a4;
@end

@implementation _GEOOfflineDataWrapper

- (void)getDataAsync:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)GEOOfflineDataKey);
  id v8 = [v5 layer];
  v9 = [v5 serviceKey];
  id v10 = [v7 initWithLayer:v8 serviceKey:v9];

  v11 = +[GEOOfflineDataAccess sharedInstance];
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000050A0;
  v15[3] = &unk_100008210;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  [v11 getDataForKey:v10 callbackQueue:global_queue callback:v15];
}

- (id)getDataSync:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)GEOOfflineDataKey);
  id v5 = [v3 layer];
  id v6 = [v3 serviceKey];

  id v7 = [v4 initWithLayer:v5 serviceKey:v6];
  id v8 = +[GEOOfflineDataAccess sharedInstance];
  id v15 = 0;
  v9 = [v8 dataForKey:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    id v14 = v10;
    v11 = [v9 readDataWithOptions:1 error:&v14];
    id v12 = v14;

    id v10 = v12;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)getDataFileURLAsync:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 layer] == 12)
  {
    id v7 = objc_alloc((Class)GEOOfflineDataKey);
    id v8 = [v5 layer];
    v9 = [v5 serviceKey];
    id v10 = [v7 initWithLayer:v8 serviceKey:v9];

    v11 = +[GEOOfflineDataAccess sharedInstance];
    qos_class_self();
    global_queue = (void *)geo_get_global_queue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000055F0;
    v15[3] = &unk_100008210;
    id v16 = v5;
    id v17 = v6;
    id v13 = v6;
    [v11 getDataForKey:v10 callbackQueue:global_queue callback:v15];
  }
  else
  {
    qos_class_self();
    id v14 = geo_get_global_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000055D8;
    block[3] = &unk_100008238;
    id v19 = v6;
    id v10 = v6;
    dispatch_async(v14, block);

    id v13 = v19;
  }
}

- (id)getDataFileURLSync:(id)a3 sandboxExtensionOwner:(id *)a4
{
  id v5 = a3;
  if ([v5 layer] == 12)
  {
    if (a4)
    {
      id v6 = objc_alloc((Class)GEOOfflineDataKey);
      id v7 = [v5 layer];
      id v8 = [v5 serviceKey];
      id v9 = [v6 initWithLayer:v7 serviceKey:v8];

      id v10 = +[GEOOfflineDataAccess sharedInstance];
      id v22 = 0;
      v11 = [v10 dataForKey:v9 error:&v22];
      id v12 = v22;

      if (v11)
      {
        uint64_t v13 = [v11 fileURL];
        if (v13)
        {
          id v14 = (void *)v13;
          *a4 = v11;
          id v15 = v14;
          id v16 = v15;
LABEL_16:

          goto LABEL_17;
        }
        v20 = sub_1000052A8();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          id v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Expected filesystem-backed data for key %{private}@", buf, 0xCu);
        }

        id v15 = 0;
      }
      else
      {
        id v17 = [v12 domain];
        v18 = GEOErrorDomain();
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        if ([v17 isEqual:v18])
        {
          if ([v12 code] == (id)-8) {
            os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
          }
          else {
            os_log_type_t v19 = OS_LOG_TYPE_ERROR;
          }
        }

        id v15 = sub_1000052A8();
        if (os_log_type_enabled(v15, v19))
        {
          *(_DWORD *)buf = 138478083;
          id v24 = v5;
          __int16 v25 = 2114;
          id v26 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, v19, "Failed to fetch key %{private}@: %{public}@", buf, 0x16u);
        }
      }
      id v16 = 0;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: outSandboxExtensionOwner != ((void *)0)", buf, 2u);
    }
  }
  id v16 = 0;
LABEL_17:

  return v16;
}

- (void)hasDataForKey:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)GEOOfflineDataKey);
  id v8 = [v6 layer];
  id v9 = [v6 serviceKey];

  id v10 = [v7 initWithLayer:v8 serviceKey:v9];
  v11 = +[GEOOfflineDataAccess sharedInstance];
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005BB8;
  v14[3] = &unk_100008260;
  id v15 = v5;
  id v13 = v5;
  [v11 hasDataForKey:v10 callbackQueue:global_queue callback:v14];
}

- (BOOL)hasDataForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)GEOOfflineDataKey);
  id v5 = [v3 layer];
  id v6 = [v3 serviceKey];

  id v7 = [v4 initWithLayer:v5 serviceKey:v6];
  id v8 = +[GEOOfflineDataAccess sharedInstance];
  LOBYTE(v5) = [v8 hasDataForKey:v7 error:0];

  return (char)v5;
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callback:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[GEOOfflineDataAccess sharedInstance];
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005D44;
  v9[3] = &unk_100008288;
  int v11 = v4;
  id v10 = v5;
  id v8 = v5;
  [v6 getAvailableKeysForLayer:v4 callbackQueue:global_queue callback:v9];
}

- (void)getAvailableRegionsWithCallback:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[GEOOfflineDataAccess sharedInstance];
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005F00;
  v7[3] = &unk_1000082F0;
  id v8 = v3;
  id v6 = v3;
  [v4 getFullyDownloadedRegionsWithCallbackQueue:global_queue callback:v7];
}

@end