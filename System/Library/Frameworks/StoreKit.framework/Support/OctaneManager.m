@interface OctaneManager
+ (NSNumber)testAccountID;
+ (id)sharedInstance;
+ (id)simulatedStoreKitErrorFor:(int64_t)a3 client:(id)a4;
- (BOOL)_deleteConfigurationFileWithContext:(id)a3;
- (BOOL)dialogsDisabledForBundleID:(id)a3;
- (BOOL)getBoolValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (BOOL)octaneEnabledForApplicationWithBundleID:(id)a3;
- (BOOL)saveConfigurationAssetData:(id)a3 name:(id)a4 withContext:(id)a5 error:(id *)a6;
- (BOOL)saveConfigurationData:(id)a3 withContext:(id)a4 error:(id *)a5;
- (OctaneManager)init;
- (id)_appNameForContext:(id)a3;
- (id)_configurationDirectoryPathForBundleID:(id)a3 percentEncoded:(BOOL)a4;
- (id)buyProductWithID:(id)a3 withContext:(id)a4;
- (id)changeAutoRenewStatus:(BOOL)a3 withContext:(id)a4;
- (id)clearOverridesWithContext:(id)a3;
- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 withContext:(id)a4;
- (id)configurationDataForBundleID:(id)a3 error:(id *)a4;
- (id)configurationDirectoryForBundleID:(id)a3 mustExist:(BOOL)a4;
- (id)deleteAllTransactionsWithContext:(id)a3;
- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 withContext:(id)a5;
- (id)generateSKANPostbackSignature:(id)a3 withContext:(id)a4;
- (id)getStorefrontWithContext:(id)a3;
- (id)getStringValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (id)getTransactionDataWithContext:(id)a3;
- (id)messageForBundleID:(id)a3;
- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4;
- (id)performAction:(int64_t)a3 withContext:(id)a4;
- (id)registerForEventOfType:(int64_t)a3 filterData:(id)a4;
- (id)saveSigningData:(id)a3 withContext:(id)a4;
- (id)setBoolValue:(BOOL)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (id)setStorefront:(id)a3 withContext:(id)a4;
- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5;
- (id)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 withContext:(id)a7;
- (int64_t)activePort;
- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 withContext:(id)a4;
- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4;
- (void)_deleteDataWithContext:(id)a3;
- (void)_refreshReceiptForBundleID:(id)a3 logKey:(id)a4;
- (void)buyProductWithConfiguration:(id)a3 withContext:(id)a4 withReply:(id)a5;
- (void)deleteDataWithContext:(id)a3;
- (void)dialogsDisabledForBundleID:(id)a3 completion:(id)a4;
- (void)handleAppsInstalledWithBundleIDs:(id)a3;
- (void)handleAppsUninstalledWithBundleIDs:(id)a3;
- (void)portUpdated:(int64_t)a3;
- (void)restartServerIfNecessary;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5;
- (void)startServerIfNecessaryFor:(id)a3;
- (void)unregisterForEventWithIdentifier:(id)a3;
- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4;
@end

@implementation OctaneManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E3E8;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_10039F888 != -1) {
    dispatch_once(&qword_10039F888, block);
  }
  v2 = (void *)qword_10039F880;

  return v2;
}

- (OctaneManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)OctaneManager;
  v2 = [(OctaneManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedPort = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.xcodetest.dispatch", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

+ (NSNumber)testAccountID
{
  return (NSNumber *)&off_100373A88;
}

- (int64_t)activePort
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E564;
  v5[3] = &unk_100358058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)buyProductWithConfiguration:(id)a3 withContext:(id)a4 withReply:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = +[ASOctaneServer shared];
  [v8 buyProductWithConfiguration:v7 withReply:v6];
}

- (id)buyProductWithID:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10003E89C;
  v25 = sub_10003E8AC;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E8B4;
  block[3] = &unk_100358080;
  v20 = &v21;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync(dispatchQueue, block);
  v11 = (void *)v22[5];
  if (v11)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    v12 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = [v10 logKey];
      uint64_t v16 = v22[5];
      *(_DWORD *)buf = 138543874;
      v28 = v15;
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to buy the product with ID %{public}@: %{public}@", buf, 0x20u);
    }
    v11 = (void *)v22[5];
  }
  id v13 = v11;

  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)changeAutoRenewStatus:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10003E89C;
  v24 = sub_10003E8AC;
  id v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EB88;
  block[3] = &unk_1003580A8;
  id v18 = &v20;
  BOOL v19 = v4;
  id v8 = v6;
  id v17 = v8;
  dispatch_sync(dispatchQueue, block);
  id v9 = (void *)v21[5];
  if (v9)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v10 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v8 logKey];
      id v14 = [v8 transactionID];
      uint64_t v15 = v21[5];
      *(_DWORD *)buf = 138544130;
      v27 = v13;
      __int16 v28 = 2048;
      id v29 = v14;
      __int16 v30 = 1024;
      BOOL v31 = v4;
      __int16 v32 = 2114;
      uint64_t v33 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to change the auto-renew status of %lu to %d: %{public}@", buf, 0x26u);
    }
    id v9 = (void *)v21[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v20, 8);

  return v11;
}

- (id)clearOverridesWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10003E89C;
  v24 = sub_10003E8AC;
  id v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10003EE64;
  id v17 = &unk_1003571D0;
  BOOL v19 = &v20;
  id v6 = v4;
  id v18 = v6;
  dispatch_sync(dispatchQueue, &v14);
  id v7 = (void *)v21[5];
  if (v7)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v8 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(v6, "logKey", v14, v15, v16, v17);
      v12 = [v6 bundleID];
      uint64_t v13 = v21[5];
      *(_DWORD *)buf = 138543874;
      v27 = v11;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to clear overrides for %{public}@: %{public}@", buf, 0x20u);
    }
    id v7 = (void *)v21[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v20, 8);

  return v9;
}

- (id)completeAskToBuyRequestWithResponse:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10003E89C;
  uint64_t v21 = sub_10003E8AC;
  id v22 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F114;
  block[3] = &unk_1003580A8;
  uint64_t v15 = &v17;
  BOOL v16 = v4;
  id v8 = v6;
  id v14 = v8;
  dispatch_sync(dispatchQueue, block);
  if (v18[5])
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v9 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v8 logKey];
      objc_claimAutoreleasedReturnValue();
      sub_1002C2068();
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_9;
    }
    id v9 = [v8 bundleID];
    id v10 = +[StoreKitServiceConnection octaneConnectionForBundleID:v9];
    [v10 checkServerQueueForQueue:@"DefaultQueue" withClient:0];
  }
LABEL_9:
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)deleteAllTransactionsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10003E89C;
  uint64_t v21 = sub_10003E8AC;
  id v22 = 0;
  dispatchQueue = self->_dispatchQueue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10003F390;
  id v14 = &unk_1003571D0;
  BOOL v16 = &v17;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(dispatchQueue, &v11);
  id v7 = (void *)v18[5];
  if (v7)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v8 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "logKey", v11, v12, v13, v14);
      objc_claimAutoreleasedReturnValue();
      sub_1002C20B0();
    }

    id v7 = (void *)v18[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (void)deleteDataWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F4B0;
  v7[3] = &unk_1003580D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (BOOL)dialogsDisabledForBundleID:(id)a3
{
  id v4 = +[OctaneActionContext contextWithBundleID:a3];
  LOBYTE(self) = [(OctaneManager *)self getBoolValueForIdentifier:2 withContext:v4];

  return (char)self;
}

- (void)dialogsDisabledForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ASOctaneServer shared];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F5DC;
  v9[3] = &unk_1003580F8;
  id v10 = v5;
  id v8 = v5;
  [v7 getIntegerValueForIdentifier:2 forBundleID:v6 completion:v9];
}

- (id)expireOrRenewSubscriptionWithIdentifier:(id)a3 expire:(BOOL)a4 withContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_10003E89C;
  uint64_t v33 = sub_10003E8AC;
  id v34 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_10003F8AC;
  v24 = &unk_100358120;
  v27 = &v29;
  id v11 = v8;
  id v25 = v11;
  BOOL v28 = v6;
  id v12 = v9;
  id v26 = v12;
  dispatch_sync(dispatchQueue, &v21);
  if (v30[5])
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    uint64_t v13 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(v12, "logKey", v21, v22, v23, v24, v25);
      id v15 = (void *)v14;
      CFStringRef v16 = @"force renew";
      uint64_t v17 = v30[5];
      if (v6) {
        CFStringRef v16 = @"expire";
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v14;
      __int16 v37 = 2114;
      CFStringRef v38 = v16;
      __int16 v39 = 2114;
      id v40 = v11;
      __int16 v41 = 2114;
      uint64_t v42 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to %{public}@ subscription with identifier %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(v12, "bundleID", v21, v22, v23, v24, v25);
    id v18 = [v12 logKey];
    [(OctaneManager *)self _refreshReceiptForBundleID:v13 logKey:v18];
  }
  id v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);

  return v19;
}

- (id)getStorefrontWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10003E89C;
  CFStringRef v16 = sub_10003E8AC;
  id v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003FA54;
  v9[3] = &unk_1003571D0;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)getTransactionDataWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10003E89C;
  CFStringRef v16 = sub_10003E8AC;
  id v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003FBE8;
  v9[3] = &unk_1003571D0;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)handleAppsInstalledWithBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FD08;
  v7[3] = &unk_1003580D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)handleAppsUninstalledWithBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000400C0;
  v7[3] = &unk_1003580D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (id)messageForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[ASOctaneServer shared];
  id v5 = [v4 messageForBundleID:v3];

  return v5;
}

- (id)messageOfTypeForBundleID:(id)a3 messageReason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ASOctaneServer shared];
  id v8 = [v7 messageOfTypeForBundleID:v6 messageReason:v5];

  return v8;
}

- (id)performAction:(int64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10003E89C;
  id v25 = sub_10003E8AC;
  id v26 = 0;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  id v7 = (id)qword_10039F8C8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 logKey];
    id v9 = [v6 transactionID];
    *(_DWORD *)buf = 138543874;
    BOOL v28 = v8;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    __int16 v31 = 2050;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Asked to perform action %ld on %{public}ld", buf, 0x20u);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004061C;
  block[3] = &unk_100358148;
  id v19 = &v21;
  int64_t v20 = a3;
  id v11 = v6;
  id v18 = v11;
  dispatch_sync(dispatchQueue, block);
  uint64_t v12 = (void *)v22[5];
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 && !v12)
  {
    uint64_t v13 = [v11 bundleID];
    uint64_t v14 = [v11 logKey];
    [(OctaneManager *)self _refreshReceiptForBundleID:v13 logKey:v14];

    uint64_t v12 = (void *)v22[5];
  }
  id v15 = v12;

  _Block_object_dispose(&v21, 8);

  return v15;
}

- (void)portUpdated:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040B14;
  v4[3] = &unk_1003571F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)restartServerIfNecessary
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = +[StoreKitServiceConnection allConnections];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) client];
        id v10 = [v9 requestBundleID];

        id v11 = [(OctaneManager *)self _configurationDirectoryPathForBundleID:v10 percentEncoded:0];
        uint64_t v12 = +[NSFileManager defaultManager];
        unsigned int v13 = [v12 fileExistsAtPath:v11];

        if (v13)
        {
          uint64_t v14 = +[ASOctaneServer shared];
          [v14 useConfigurationDirectory:v11 forBundleID:v10];

          char v6 = 1;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);

    if (v6)
    {
      if (qword_10039F8D8 != -1) {
        dispatch_once(&qword_10039F8D8, &stru_100358258);
      }
      id v15 = qword_10039F8C8;
      if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEBUG)) {
        sub_1002C2218(v15);
      }
      return;
    }
  }
  else
  {
  }
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  CFStringRef v16 = qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEBUG)) {
    sub_1002C21D4(v16);
  }
}

- (id)saveSigningData:(id)a3 withContext:(id)a4
{
  return 0;
}

- (id)setStorefront:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10003E89C;
  id v25 = sub_10003E8AC;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040FAC;
  block[3] = &unk_100358080;
  long long v20 = &v21;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync(dispatchQueue, block);
  id v11 = (void *)v22[5];
  if (v11)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    uint64_t v12 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v10 logKey];
      uint64_t v16 = v22[5];
      *(_DWORD *)buf = 138543874;
      BOOL v28 = v15;
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to set storefront to %{public}@: %{public}@", buf, 0x20u);
    }
    id v11 = (void *)v22[5];
  }
  id v13 = v11;

  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)registerForEventOfType:(int64_t)a3 filterData:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10003E89C;
  id v19 = sub_10003E8AC;
  id v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041154;
  block[3] = &unk_100358148;
  id v13 = &v15;
  int64_t v14 = a3;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(dispatchQueue, block);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)unregisterForEventWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041260;
  block[3] = &unk_100358170;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)useConfigurationDirectory:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041378;
  v11[3] = &unk_1003580D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dispatchQueue, v11);
}

- (id)generateSKANPostbackSignature:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10003E89C;
  id v25 = sub_10003E8AC;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_1000415B4;
  id v18 = &unk_1003571D0;
  id v20 = &v21;
  id v9 = v6;
  id v19 = v9;
  dispatch_sync(dispatchQueue, &v15);
  id v10 = (void *)v22[5];
  if (!v10)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v11 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(v7, "logKey", v15, v16, v17, v18);
      sub_1002C225C(v12, buf, v11);
    }

    id v10 = (void *)v22[5];
  }
  id v13 = v10;

  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)validateSKAdNetworkSignature:(id)a3 withPublicKey:(id)a4 source:(int64_t)a5 andParameters:(id)a6 withContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  CFStringRef v38 = sub_10003E89C;
  __int16 v39 = sub_10003E8AC;
  id v40 = 0;
  dispatchQueue = self->_dispatchQueue;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_100041888;
  BOOL v28 = &unk_100358198;
  uint64_t v33 = &v35;
  id v17 = v12;
  id v29 = v17;
  id v18 = v13;
  id v30 = v18;
  int64_t v34 = a5;
  id v19 = v14;
  id v31 = v19;
  id v20 = v15;
  id v32 = v20;
  dispatch_sync(dispatchQueue, &v25);
  uint64_t v21 = (void *)v36[5];
  if (v21)
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    uint64_t v22 = (id)qword_10039F8C8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "logKey", v25, v26, v27, v28, v29, v30, v31);
      objc_claimAutoreleasedReturnValue();
      sub_1002C22B4();
    }

    uint64_t v21 = (void *)v36[5];
  }
  id v23 = v21;

  _Block_object_dispose(&v35, 8);

  return v23;
}

- (int64_t)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041A08;
  block[3] = &unk_100358148;
  id v13 = &v15;
  int64_t v14 = a3;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(dispatchQueue, block);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5
{
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041B1C;
  block[3] = &unk_1003581C0;
  int64_t v13 = a3;
  int64_t v14 = a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(dispatchQueue, block);
}

- (BOOL)getBoolValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  int64_t v4 = [(OctaneManager *)self getIntegerValueForIdentifier:a3 withContext:a4];
  if (v4) {
    BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (id)setBoolValue:(BOOL)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  return [(OctaneManager *)self setIntegerValue:a3 forIdentifier:a4 withContext:a5];
}

- (int64_t)getIntegerValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  id v7 = (void *)qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int64_t v9 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested value for identifier %ld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041D5C;
  block[3] = &unk_100358148;
  uint64_t v16 = buf;
  unint64_t v17 = a3;
  id v15 = v6;
  id v11 = v6;
  dispatch_sync(dispatchQueue, block);
  int64_t v12 = *(void *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a5;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  int64_t v9 = (void *)qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = [v8 logKey];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested to set value %ld for identifier %ld", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v22 = (unint64_t)sub_10003E89C;
  id v23 = sub_10003E8AC;
  id v24 = 0;
  dispatchQueue = self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100041FE8;
  v16[3] = &unk_1003581E8;
  int64_t v19 = a3;
  unint64_t v20 = a4;
  id v17 = v8;
  uint64_t v18 = buf;
  id v13 = v8;
  dispatch_sync(dispatchQueue, v16);
  id v14 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)getStringValueForIdentifier:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  id v7 = (void *)qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int64_t v9 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested value for identifier %ld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int64_t v19 = sub_10003E89C;
  unint64_t v20 = sub_10003E8AC;
  id v21 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042378;
  block[3] = &unk_100358148;
  uint64_t v16 = buf;
  unint64_t v17 = a3;
  id v15 = v6;
  id v11 = v6;
  dispatch_sync(dispatchQueue, block);
  id v12 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (id)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  id v10 = (void *)qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v9 logKey];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested to set value %ld for identifier %ld", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v24 = (unint64_t)sub_10003E89C;
  id v25 = sub_10003E8AC;
  id v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004262C;
  v18[3] = &unk_100358210;
  id v21 = buf;
  unint64_t v22 = a4;
  id v19 = v8;
  id v20 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync(dispatchQueue, v18);
  id v16 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v16;
}

- (id)_appNameForContext:(id)a3
{
  id v3 = [a3 bundleID];
  int64_t v4 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:0];

  BOOL v5 = [v4 localizedName];

  return v5;
}

- (BOOL)_deleteConfigurationFileWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 bundleID];
  id v6 = [(OctaneManager *)self _configurationDirectoryPathForBundleID:v5 percentEncoded:0];

  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = 0;
  if ([v7 fileExistsAtPath:v6])
  {
    id v13 = 0;
    unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v13];
    id v9 = v13;
    if (v8)
    {
      if (qword_10039F8D8 != -1) {
        dispatch_once(&qword_10039F8D8, &stru_100358258);
      }
      id v10 = (void *)qword_10039F8C8;
      if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEBUG)) {
        sub_1002C22FC(v10, v4);
      }
    }
    else
    {
      if (qword_10039F8D8 != -1) {
        dispatch_once(&qword_10039F8D8, &stru_100358258);
      }
      id v11 = (void *)qword_10039F8C8;
      if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_ERROR)) {
        sub_1002C23CC(v11, v4, (uint64_t)v9);
      }
    }
  }
  return v8;
}

- (void)_deleteDataWithContext:(id)a3
{
  id v6 = a3;
  if (-[OctaneManager _deleteConfigurationFileWithContext:](self, "_deleteConfigurationFileWithContext:"))
  {
    id v4 = +[ASOctaneServer shared];
    BOOL v5 = [v6 bundleID];
    [v4 appRemovedWithBundleID:v5];
  }
}

- (void)_refreshReceiptForBundleID:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10039F8D8 != -1) {
    dispatch_once(&qword_10039F8D8, &stru_100358258);
  }
  id v7 = qword_10039F8C8;
  if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Refreshing receipt for %{public}@", buf, 0x16u);
  }
  unsigned __int8 v8 = [[_TtC9storekitd6Client alloc] initWithBundleIdentifier:v5];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = +[ReceiptManager managerForClient:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100042CE4;
    v14[3] = &unk_100358238;
    id v15 = v6;
    id v11 = v9;
    id v16 = v11;
    [v10 requestUnifiedAppReceiptWithDialogContext:0 logKey:v15 options:0 completionHandler:v14];
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      if (qword_10039F8D8 != -1) {
        dispatch_once(&qword_10039F8D8, &stru_100358258);
      }
      if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_ERROR)) {
        sub_1002C2478();
      }
    }
  }
  else
  {
    if (qword_10039F8D8 != -1) {
      dispatch_once(&qword_10039F8D8, &stru_100358258);
    }
    id v13 = qword_10039F8C8;
    if (os_log_type_enabled((os_log_t)qword_10039F8C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No client to refresh receipt", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

- (id)configurationDirectoryForBundleID:(id)a3 mustExist:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v6 - 8);
  unsigned __int8 v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  dispatch_time_t v12 = self;
  sub_10011E894(v9, v11, v4, (uint64_t)v8);

  swift_bridgeObjectRelease();
  uint64_t v13 = type metadata accessor for URL();
  id v15 = 0;
  if (sub_10001E448((uint64_t)v8, 1, v13) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    id v15 = v16;
    (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v8, v13);
  }

  return v15;
}

- (BOOL)octaneEnabledForApplicationWithBundleID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v4 = self;
  char v5 = sub_10011F17C();

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (id)_configurationDirectoryPathForBundleID:(id)a3 percentEncoded:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_10011F358(v6, v8, a4);
  uint64_t v11 = v10;

  swift_bridgeObjectRelease();
  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (void)startServerIfNecessaryFor:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_10011F5A8(v4);
}

- (BOOL)saveConfigurationData:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  OctaneManager.saveConfigurationData(_:context:)(v10, v12, v8);
  sub_100012EB8(v10, v12);
  return 1;
}

- (BOOL)saveConfigurationAssetData:(id)a3 name:(id)a4 withContext:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  OctaneManager.saveConfigurationAssetData(_:fileName:context:)(v13, v15, v16, v18, v11);
  swift_bridgeObjectRelease();

  sub_100012EB8(v13, v15);
  return 1;
}

- (id)configurationDataForBundleID:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  id v8 = self;
  unint64_t v9 = OctaneManager.configurationData(for:)(v5, v7);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();

  v12.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100012EB8(v9, v11);

  return v12.super.isa;
}

+ (id)simulatedStoreKitErrorFor:(int64_t)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = sub_10011E73C(a3);

  return v6;
}

@end