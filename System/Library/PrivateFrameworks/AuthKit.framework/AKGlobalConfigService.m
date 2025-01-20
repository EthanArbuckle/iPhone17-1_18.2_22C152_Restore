@interface AKGlobalConfigService
+ (id)sharedInstance;
- (AKGlobalConfigService)init;
- (id)_configURLRequestWithContext:(id)a3;
- (id)_unsafe_updateCacheWithData:(id)a3;
- (void)_getConfigsFromCache:(BOOL)a3 context:(id)a4 completion:(id)a5;
- (void)checkForLocaleChange;
- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 context:(id)a4 completion:(id)a5;
@end

@implementation AKGlobalConfigService

+ (id)sharedInstance
{
  if (qword_100272658 != -1) {
    dispatch_once(&qword_100272658, &stru_10022B308);
  }
  v2 = (void *)qword_100272660;

  return v2;
}

- (AKGlobalConfigService)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKGlobalConfigService;
  v2 = [(AKGlobalConfigService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AKGlobalConfigServiceQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    cachedConfig = v2->_cachedConfig;
    v2->_cachedConfig = v6;
  }
  return v2;
}

- (void)checkForLocaleChange
{
  v3 = +[AKDevice currentDevice];
  dispatch_queue_t v4 = [v3 locale];
  v5 = [v4 localeIdentifier];

  v6 = +[AKConfiguration sharedConfiguration];
  v7 = [v6 lastKnownLocale];

  if (([v5 isEqualToString:v7] & 1) == 0)
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Locale change notification. Fetching global configs.", buf, 2u);
    }

    uint64_t v9 = AKRequestContextLocaleChange;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C41DC;
    v10[3] = &unk_1002299D8;
    id v11 = v5;
    [(AKGlobalConfigService *)self fetchGlobalConfigUsingCachePolicy:1 context:v9 completion:v10];
  }
}

- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching global config with cache policy %lu", (uint8_t *)&v12, 0xCu);
  }

  if (!a3)
  {
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v11 = 0;
LABEL_7:
    [(AKGlobalConfigService *)self _getConfigsFromCache:v11 context:v8 completion:v9];
  }
}

- (void)_getConfigsFromCache:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = _AKSignpostLogSystem();
  os_signpost_id_t v11 = _AKSignpostCreate();
  uint64_t v13 = v12;

  v14 = _AKSignpostLogSystem();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchGlobalConfig", " enableTelemetry=YES ", buf, 2u);
  }

  v16 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v44 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchGlobalConfig  enableTelemetry=YES ", buf, 0xCu);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000C473C;
  v39[3] = &unk_100229220;
  os_signpost_id_t v41 = v11;
  uint64_t v42 = v13;
  id v17 = v8;
  id v40 = v17;
  v18 = objc_retainBlock(v39);
  v19 = [(AKGlobalConfigService *)self _configURLRequestWithContext:v9];

  v20 = _AKLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching global config from cache...", buf, 2u);
    }

    uint64_t v22 = +[AKURLSession sharedCacheReliantAnisetteFreeSession];
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching global config from source...", buf, 2u);
    }

    uint64_t v22 = +[AKURLSession sharedCacheEnabledAnisetteFreeSession];
  }
  v23 = (void *)v22;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C48B8;
  v34[3] = &unk_10022B330;
  dispatch_source_t v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v24 = v23;
  v37 = self;
  id v38 = v18;
  id v36 = v24;
  v25 = v18;
  v26 = v35;
  v27 = [v24 beginDataTaskWithRequest:v19 completionHandler:v34];
  dispatch_time_t v28 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v26, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C4A80;
  handler[3] = &unk_100226C00;
  id v32 = v27;
  id v33 = v24;
  id v29 = v24;
  id v30 = v27;
  dispatch_source_set_event_handler(v26, handler);
  dispatch_resume(v26);
}

- (id)_configURLRequestWithContext:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[AKURLBag sharedBag];
  v5 = [v4 fetchGlobalConfigURL];

  if (!v5)
  {
    v5 = +[NSURL URLWithString:@"https://gsas.apple.com/grandslam/GsService2/fetchGlobalConfigs"];
  }
  BOOL v6 = +[AKDevice currentDevice];
  v7 = [v6 locale];
  id v8 = [v7 localeIdentifier];

  id v9 = +[NSURLComponents componentsWithURL:v5 resolvingAgainstBaseURL:0];
  id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"locale" value:v8];
  id v16 = v10;
  os_signpost_id_t v11 = +[NSArray arrayWithObjects:&v16 count:1];
  [v9 setQueryItems:v11];

  uint64_t v12 = [v9 URL];

  id v13 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v12];
  objc_msgSend(v13, "ak_addClientInfoHeader");
  objc_msgSend(v13, "ak_addCountryHeader");
  objc_msgSend(v13, "ak_addDeviceUDIDHeader");
  objc_msgSend(v13, "ak_addInternalBuildHeader");
  objc_msgSend(v13, "ak_addSeedBuildHeader");
  objc_msgSend(v13, "ak_addFeatureMaskHeader");
  objc_msgSend(v13, "ak_addLocaleHeader");
  objc_msgSend(v13, "ak_addTimeZoneHeaders");
  objc_msgSend(v13, "ak_addSKUCountryHeader");
  objc_msgSend(v13, "ak_addRequestContextHeader:", v3);

  objc_msgSend(v13, "ak_addExperimentModeHeader");
  id v14 = [v13 copy];

  return v14;
}

- (id)_unsafe_updateCacheWithData:(id)a3
{
  id v10 = 0;
  id v3 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001936EC((uint64_t)v4, v5);
    }
LABEL_10:

    id v8 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = _AKLogSystem();
  v5 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001936A8(v5);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Config fetched! %@", buf, 0xCu);
  }

  id v8 = v3;
LABEL_11:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfig, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end