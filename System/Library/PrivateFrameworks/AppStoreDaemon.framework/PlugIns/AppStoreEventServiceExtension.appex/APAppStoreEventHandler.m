@interface APAppStoreEventHandler
- (int64_t)didReceiveInstallationEvent:(id)a3;
@end

@implementation APAppStoreEventHandler

- (int64_t)didReceiveInstallationEvent:(id)a3
{
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=================================", (uint8_t *)&v25, 2u);
  }

  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v25 = 138412290;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Received didReceiveInstallationEvent from appstoredaemon.", (uint8_t *)&v25, 0xCu);
  }
  v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v3 phase];
    int v25 = 134217984;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App Installation Phase - %ld", (uint8_t *)&v25, 0xCu);
  }

  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 terminalPhase];
    int v25 = 134217984;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App Installation Terminal Phase - %ld", (uint8_t *)&v25, 0xCu);
  }

  v12 = APLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v3 bundleID];
    int v25 = 138412290;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Bundle ID - %@", (uint8_t *)&v25, 0xCu);
  }
  v14 = APLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v3 itemID];
    id v16 = [v15 integerValue];
    int v25 = 134217984;
    id v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adam ID - %ld", (uint8_t *)&v25, 0xCu);
  }
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v3 appType];
    int v25 = 134217984;
    id v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "App Type - %ld", (uint8_t *)&v25, 0xCu);
  }

  v19 = APLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v3 source];
    int v25 = 134217984;
    id v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Source - %ld", (uint8_t *)&v25, 0xCu);
  }

  v21 = APLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v3 installType];
    int v25 = 134217984;
    id v26 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Install Type - %ld", (uint8_t *)&v25, 0xCu);
  }

  v23 = APLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=================================", (uint8_t *)&v25, 2u);
  }

  return 1;
}

@end