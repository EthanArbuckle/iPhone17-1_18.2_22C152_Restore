@interface AKDeviceListController
+ (id)sharedController;
- (AKAccountManager)accountManager;
- (AKDeviceListController)initWithAccountManager:(id)a3;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (void)_clearDeviceListForAltDSID:(id)a3;
- (void)_handleCurrentDeviceTrustStatusChangedWithPayload:(id)a3;
- (void)_refreshDeviceListForAltDSID:(id)a3;
- (void)_sendTrustedDeviceListChangeNotification;
- (void)processPushMessage:(id)a3;
- (void)setAccountManager:(id)a3;
@end

@implementation AKDeviceListController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075090;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272468 != -1) {
    dispatch_once(&qword_100272468, block);
  }
  v2 = (void *)qword_100272460;

  return v2;
}

- (AKDeviceListController)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKDeviceListController;
  v6 = [(AKDeviceListController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] != (id)1200) {
    goto LABEL_21;
  }
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling push with command AKPushMessageCommandNotifyTrustedDeviceListChanged...", buf, 2u);
  }

  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"tddelta"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  v8 = [v7 objectForKeyedSubscript:@"items"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_super v9 = [v8 firstObject];
  id v10 = [v9 mutableCopy];
  +[NSMutableArray array];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100075534;
  v40[3] = &unk_100229768;
  id v41 = v9;
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v42;
  [v8 enumerateObjectsUsingBlock:v40];
  [v10 setObject:v11 forKeyedSubscript:@"mids"];
  id v12 = [v10 copy];

  if (!v12)
  {
LABEL_11:
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10018829C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    id v12 = 0;
    v21 = 0;
    goto LABEL_14;
  }
  v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1001882D4(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v21 = +[NSMutableDictionary dictionaryWithDictionary:v12];
  v22 = [v4 altDSID];
  [v21 setObject:v22 forKeyedSubscript:AKAltDSID];
LABEL_14:

  id v30 = [objc_alloc((Class)AKDeviceListDeltaMessagePayload) initWithResponseBody:v21];
  v31 = [v30 serialNumber];
  v32 = +[AKDevice currentDevice];
  v33 = [v32 serialNumber];
  unsigned int v34 = [v31 isEqualToString:v33];

  if (v34) {
    [(AKDeviceListController *)self _handleCurrentDeviceTrustStatusChangedWithPayload:v30];
  }
  [(AKDeviceListController *)self _sendTrustedDeviceListChangeNotification];
  v35 = +[AKFeatureManager sharedManager];
  unsigned int v36 = [v35 isDeviceListCacheEnableDryMode];

  if (v36 && (!v34 || [v30 operation] != (id)2))
  {
    v37 = dispatch_get_global_queue(9, 0);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000755F8;
    v38[3] = &unk_100226C00;
    v38[4] = self;
    id v39 = v4;
    dispatch_async(v37, v38);
  }
LABEL_21:
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  return [a3 command] == (id)1200;
}

- (void)_handleCurrentDeviceTrustStatusChangedWithPayload:(id)a3
{
  id v4 = a3;
  accountManager = self->_accountManager;
  v6 = [v4 altDSID];
  v7 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v6 error:0];

  id v8 = [v4 operation];
  if (v8 == (id)1)
  {
    [(AKAccountManager *)self->_accountManager clearDeviceRemovalReasonFromAccount:v7];
  }
  else if (v8 == (id)2)
  {
    id v9 = [v4 removalReason];
    if (v9 == (id)-1) {
      id v10 = 0;
    }
    else {
      id v10 = v9;
    }
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      __int16 v26 = 2048;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Attempting to remove continuation token for account (%@) because (%ld)", buf, 0x20u);
    }

    [(AKAccountManager *)self->_accountManager setDeviceRemovalReason:v10 onAccount:v7];
    id v12 = self->_accountManager;
    v13 = +[NSError ak_errorWithCode:-7090];
    [(AKAccountManager *)v12 removeContinuationTokenForAccount:v7 telemetryFlowID:0 error:v13];

    uint64_t v14 = +[AKFeatureManager sharedManager];
    LODWORD(v13) = [v14 isDeviceListCacheEnableDryMode];

    if (v13)
    {
      uint64_t v15 = dispatch_get_global_queue(9, 0);
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_1000758A4;
      uint64_t v19 = &unk_100226C00;
      uint64_t v20 = self;
      id v21 = v4;
      dispatch_async(v15, &v16);
    }
  }
  -[AKAccountManager saveAccount:error:](self->_accountManager, "saveAccount:error:", v7, 0, v16, v17, v18, v19, v20);
}

- (void)_sendTrustedDeviceListChangeNotification
{
  v2 = _AKLogSystem();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  uint64_t v4 = AKDeviceListChangedNotification;
  if (v3)
  {
    int v6 = 138412290;
    uint64_t v7 = AKDeviceListChangedNotification;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting %@ notification.", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 postNotificationName:v4 object:0 userInfo:0 deliverImmediately:1];
}

- (void)_refreshDeviceListForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = [AKDeviceListRequester alloc];
  int v6 = +[AKDeviceListStoreManager sharedManager];
  uint64_t v7 = objc_opt_new();
  id v9 = [(AKDeviceListRequester *)v5 initWithStoreManager:v6 cdpFactory:v7 accountManager:self->_accountManager client:0];

  id v8 = objc_alloc_init((Class)AKDeviceListRequestContext);
  [v8 setAltDSID:v4];

  [v8 setForceFetch:1];
  [v8 setIncludeUntrustedDevices:1];
  [(AKDeviceListRequester *)v9 fetchDeviceListWithContext:v8 completionHandler:&stru_100229788];
}

- (void)_clearDeviceListForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = [AKDeviceListRequester alloc];
  int v6 = +[AKDeviceListStoreManager sharedManager];
  uint64_t v7 = objc_opt_new();
  id v8 = [(AKDeviceListRequester *)v5 initWithStoreManager:v6 cdpFactory:v7 accountManager:self->_accountManager client:0];

  id v9 = objc_alloc_init((Class)AKDeviceListRequestContext);
  [v9 setAltDSID:v4];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100075C64;
  v11[3] = &unk_100228018;
  id v12 = v9;
  id v10 = v9;
  [(AKDeviceListRequester *)v8 clearDeviceListCacheWithContext:v10 completionHandler:v11];
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end