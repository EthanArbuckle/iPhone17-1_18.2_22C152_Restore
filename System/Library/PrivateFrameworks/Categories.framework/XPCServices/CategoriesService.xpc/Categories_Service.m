@interface Categories_Service
+ (id)_AppStoreIDToDHIDCategoriesMap;
+ (id)_macAppStoreIDToDHIDCategoriesMap;
+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 clientApplication:(id)a5 withCompletionHandler:(id)a6;
+ (void)_lookupGenreIDAndCounterpartIdentifiersInPlist:(id)a3 withCompletionHandler:(id)a4;
- (Categories_Service)init;
- (void)dealloc;
- (void)genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:(id)a3 replyHandler:(id)a4;
- (void)lookupAppStoreForBundleIDs:(id)a3 platform:(id)a4 replyHandler:(id)a5;
@end

@implementation Categories_Service

+ (void)_lookupGenreIDAndCounterpartIdentifiersInPlist:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004B60;
  v9[3] = &unk_10000C4C0;
  v11 = v13;
  id v12 = a1;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v9];
  v7[2](v7, 0, v8);

  _Block_object_dispose(v13, 8);
}

- (void)genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  v9 = [v8 valueForEntitlement:@"application-identifier"];

  id v10 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v20 = v9;
    __int16 v21 = 2080;
    v22 = "-[Categories_Service genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:replyHandler:]";
    __int16 v23 = 2113;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<%@>::%s = %{private}@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004748;
  block[3] = &unk_10000C410;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v6;
  dispatch_async(queue, block);
}

+ (id)_AppStoreIDToDHIDCategoriesMap
{
  if (qword_100010F80 != -1) {
    dispatch_once(&qword_100010F80, &stru_10000C478);
  }
  v2 = (void *)qword_100010F78;
  return v2;
}

- (Categories_Service)init
{
  v10.receiver = self;
  v10.super_class = (Class)Categories_Service;
  v2 = [(Categories_Service *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.ctcategories.service", "service");
    v4 = (void *)qword_100010F70;
    qword_100010F70 = (uint64_t)v3;

    v5 = qword_100010F70;
    if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[Categories_Service init]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ctcategories.service", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    +[NSXPCListener enableTransactions];
  }
  return v2;
}

- (void)dealloc
{
  os_log_t v3 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[Categories_Service dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)Categories_Service;
  [(Categories_Service *)&v4 dealloc];
}

- (void)lookupAppStoreForBundleIDs:(id)a3 platform:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSXPCConnection currentConnection];
  id v12 = [v11 valueForEntitlement:@"application-identifier"];

  id v13 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v25 = v12;
    __int16 v26 = 2080;
    v27 = "-[Categories_Service lookupAppStoreForBundleIDs:platform:replyHandler:]";
    __int16 v28 = 2113;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "<%@>::%s = %{private}@", buf, 0x20u);
  }
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000057FC;
  v19[3] = &unk_10000C438;
  id v20 = v8;
  id v21 = v9;
  id v22 = v12;
  id v23 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(queue, v19);
}

+ (id)_macAppStoreIDToDHIDCategoriesMap
{
  if (qword_100010F90 != -1) {
    dispatch_once(&qword_100010F90, &stru_10000C498);
  }
  v2 = (void *)qword_100010F88;
  return v2;
}

+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 clientApplication:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100006354;
  v40 = sub_100006364;
  id v41 = 0;
  if (+[CTNetworkReachability networkReachable])
  {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000636C;
    v31[3] = &unk_10000C4E8;
    id v14 = v9;
    id v32 = v14;
    id v15 = v13;
    id v33 = v15;
    v35 = &v36;
    id v34 = v12;
    id v16 = objc_retainBlock(v31);
    id v17 = [[CTAppStoreSearch alloc] initWithCallingProcess:v11];
    if ([v10 isEqualToString:CTOSPlatformmacOS])
    {
      uint64_t v18 = 1;
    }
    else if (([v10 isEqualToString:CTOSPlatformiOS] & 1) != 0 {
           || ([v10 isEqualToString:CTOSPlatformwatchOS] & 1) != 0)
    }
    {
      uint64_t v18 = 6;
    }
    else if ([v10 isEqualToString:CTOSPlatformtvOS])
    {
      uint64_t v18 = 8;
    }
    else
    {
      uint64_t v18 = 15;
    }
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100006354;
    v29[4] = sub_100006364;
    id v30 = +[NSMutableSet setWithArray:v14];
    id v22 = [v14 componentsJoinedByString:@","];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000067AC;
    v25[3] = &unk_10000C560;
    __int16 v28 = v29;
    id v23 = v16;
    id v27 = v23;
    id v24 = v17;
    __int16 v26 = v24;
    [(CTAppStoreSearch *)v24 lookupAppWithBundleIDs:v22 deviceFamily:v18 completionHandler:v25];

    _Block_object_dispose(v29, 8);
  }
  else
  {
    v19 = qword_100010F70;
    if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_ERROR)) {
      sub_100009098((uint64_t)v9, v19);
    }
    CFStringRef v42 = @"FailedLookupBundleIDs";
    id v43 = v9;
    id v15 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v20 = +[NSError errorWithDomain:CTErrorDomain code:-3001 userInfo:v15];
    id v21 = (void *)v37[5];
    v37[5] = v20;

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, v37[5], 0);
  }

  _Block_object_dispose(&v36, 8);
}

- (void).cxx_destruct
{
}

@end