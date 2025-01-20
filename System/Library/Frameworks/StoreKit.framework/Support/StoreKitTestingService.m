@interface StoreKitTestingService
+ (id)defaultService;
- (BOOL)_validateMethodCall:(void *)a3 context:(id)a4 error:(id *)a5;
- (BOOL)isAppStoreSignedAppWithBundleID:(id)a3;
- (BOOL)validateMethodCall:(id)a3 context:(id)a4 error:(id *)a5;
- (StoreKitTestingService)init;
- (id)_adNetworkServiceWithErrorHandler:(id)a3;
- (id)_getSKAdNetworkSignatureParametersFromImpression:(id)a3 source:(int64_t)a4;
- (id)_testingAppsDataWithError:(id *)a3;
- (id)validateOctaneContextFor:(id)a3 with:(id)a4 completion:(id)a5;
- (void)_adNetworkServiceInvalidated;
- (void)_logExitForMethod:(void *)a3 context:(id)a4;
- (void)addPostbacksFromDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)buyProductWithConfiguration:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)buyProductWithID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)clearOverridesForBundleID:(id)a3 completion:(id)a4;
- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)configurationDataForBundleID:(id)a3 completion:(id)a4;
- (void)configureSourceForTestPostbackDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)deleteAllTransactionsForBundleID:(id)a3 completion:(id)a4;
- (void)developerPostbackURLForBundleID:(id)a3 completion:(id)a4;
- (void)expireSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)forceRenewalOfSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)getActivePortWithCompletion:(id)a3;
- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)getStorefrontForBundleID:(id)a3 completion:(id)a4;
- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)getTransactionDataForBundleID:(id)a3 completion:(id)a4;
- (void)invalidateBag;
- (void)logExitForMethod:(id)a3 context:(id)a4;
- (void)performAction:(int64_t)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6;
- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5;
- (void)refreshQueueForBundleId:(id)a3 completion:(id)a4;
- (void)registerForEventOfType:(int64_t)a3 forBundleID:(id)a4 withFilterData:(id)a5 completion:(id)a6;
- (void)removeConfigurationForBundleID:(id)a3 completion:(id)a4;
- (void)removeTransactionIdentifiersFromCache:(id)a3 forBundleIdentifier:(id)a4;
- (void)retrieveTestPostbacksForBundleID:(id)a3 completion:(id)a4;
- (void)revokeEntitlementsForProductIdentifiers:(id)a3 forBundleId:(id)a4 completion:(id)a5;
- (void)saveConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)saveConfigurationData:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)saveSigningData:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)sendPurchaseIntentForProductIdentifier:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)sendTestPingbackForBundleID:(id)a3 completion:(id)a4;
- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6;
- (void)setStorefront:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6;
- (void)showMessage:(id)a3 forBundleID:(id)a4;
- (void)simulateStoreKitPushWithAction:(id)a3 forBundleIdentifiers:(id)a4;
- (void)startObservingTransactionsForBundleID:(id)a3 completion:(id)a4;
- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5;
- (void)testingAppsWithCompletion:(id)a3;
- (void)transactionDeleted:(unint64_t)a3 productID:(id)a4 forBundleID:(id)a5;
- (void)transactionUpdated:(id)a3 forBundleID:(id)a4;
- (void)unregisterForEventWithIdentifier:(id)a3 forBundleID:(id)a4;
- (void)updatePort:(int64_t)a3;
- (void)validateSKAdNetworkImpression:(id)a3 withPublicKey:(id)a4 forBundleID:(id)a5 source:(int64_t)a6 completion:(id)a7;
@end

@implementation StoreKitTestingService

+ (id)defaultService
{
  if (qword_10039FA50 != -1) {
    dispatch_once(&qword_10039FA50, &stru_100358768);
  }
  v2 = (void *)qword_10039FA48;

  return v2;
}

- (StoreKitTestingService)init
{
  v6.receiver = self;
  v6.super_class = (Class)StoreKitTestingService;
  v2 = [(StoreKitTestingService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = (NSLock *)v3;
  }
  return v2;
}

- (void)buyProductWithID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService buyProductWithID:bundleID:completion:]", v10, &v13);
  id v11 = v13;
  if (!v11)
  {
    v12 = +[OctaneManager sharedInstance];
    id v11 = [v12 buyProductWithID:v8 withContext:v10];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService buyProductWithID:bundleID:completion:]", v10);
}

- (void)changeAutoRenewStatus:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  v10 = (void (**)(id, id))a6;
  id v11 = +[OctaneActionContext contextWithBundleID:a5 transactionID:a4];
  id v14 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService changeAutoRenewStatus:transactionID:bundleID:completion:]", v11, &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = +[OctaneManager sharedInstance];
    id v12 = [v13 changeAutoRenewStatus:v8 withContext:v11];
  }
  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService changeAutoRenewStatus:transactionID:bundleID:completion:]", v11);
}

- (void)clearOverridesForBundleID:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, id))a4;
  v7 = +[OctaneActionContext contextWithBundleID:a3];
  id v10 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService clearOverridesForBundleID:completion:]", v7, &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = +[OctaneManager sharedInstance];
    id v8 = [v9 clearOverridesWithContext:v7];
  }
  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService clearOverridesForBundleID:completion:]", v7);
}

- (void)completeAskToBuyRequestWithResponse:(BOOL)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = (void (**)(id, id))a6;
  id v11 = +[OctaneActionContext contextWithBundleID:a5 transactionID:a4];
  id v14 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService completeAskToBuyRequestWithResponse:transactionID:bundleID:completion:]", v11, &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = +[OctaneManager sharedInstance];
    id v12 = [v13 completeAskToBuyRequestWithResponse:v8 withContext:v11];
  }
  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService completeAskToBuyRequestWithResponse:transactionID:bundleID:completion:]", v11);
}

- (void)deleteAllTransactionsForBundleID:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, id))a4;
  v7 = +[OctaneActionContext contextWithBundleID:a3];
  id v10 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService deleteAllTransactionsForBundleID:completion:]", v7, &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = +[OctaneManager sharedInstance];
    id v8 = [v9 deleteAllTransactionsWithContext:v7];
  }
  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService deleteAllTransactionsForBundleID:completion:]", v7);
}

- (void)expireSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService expireSubscriptionWithProductID:bundleID:completion:]", v10, &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = +[OctaneManager sharedInstance];
    id v11 = [v12 expireOrRenewSubscriptionWithIdentifier:v8 expire:1 withContext:v10];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService expireSubscriptionWithProductID:bundleID:completion:]", v10);
}

- (void)forceRenewalOfSubscriptionWithProductID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService forceRenewalOfSubscriptionWithProductID:bundleID:completion:]", v10, &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = +[OctaneManager sharedInstance];
    id v11 = [v12 expireOrRenewSubscriptionWithIdentifier:v8 expire:0 withContext:v10];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService forceRenewalOfSubscriptionWithProductID:bundleID:completion:]", v10);
}

- (void)getStorefrontForBundleID:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, id, void *))a4;
  v7 = +[OctaneActionContext contextWithBundleID:a3];
  id v12 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService getStorefrontForBundleID:completion:]", v7, &v12);
  id v8 = v12;
  v9 = 0;
  if (!v8)
  {
    id v10 = +[OctaneManager sharedInstance];
    id v11 = [v10 getStorefrontWithContext:v7];
    v9 = [v11 objectForKeyedSubscript:off_100398F58[0]];
  }
  v6[2](v6, v8, v9);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService getStorefrontForBundleID:completion:]", v7);
}

- (void)getActivePortWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  v4 = +[NSUUID lib_shortLogKey];
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  v5 = (void *)qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    v7 = +[NSXPCConnection currentConnection];
    id v8 = objc_msgSend(v7, "sk_clientID");
    int v11 = 138543874;
    id v12 = v4;
    __int16 v13 = 2082;
    id v14 = "-[StoreKitTestingService getActivePortWithCompletion:]";
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering %{public}s called by %{public}@", (uint8_t *)&v11, 0x20u);
  }
  v9 = +[OctaneManager sharedInstance];
  v3[2](v3, [v9 activePort]);

  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  id v10 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 2082;
    id v14 = "-[StoreKitTestingService getActivePortWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Exiting  %{public}s", (uint8_t *)&v11, 0x16u);
  }
}

- (void)getTransactionDataForBundleID:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, id, void *))a4;
  v7 = +[OctaneActionContext contextWithBundleID:a3];
  id v11 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService getTransactionDataForBundleID:completion:]", v7, &v11);
  id v8 = v11;
  v9 = 0;
  if (!v8)
  {
    id v10 = +[OctaneManager sharedInstance];
    v9 = [v10 getTransactionDataWithContext:v7];
  }
  v6[2](v6, v8, v9);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService getTransactionDataForBundleID:completion:]", v7);
}

- (void)invalidateBag
{
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  v2 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
    sub_1002C34E8(v2);
  }
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  uint64_t v3 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending storefront changed notification for Xcode test", v4, 2u);
  }
  notify_post((const char *)[(__CFString *)off_1003995E8[0] UTF8String]);
}

- (void)performAction:(int64_t)a3 transactionID:(unint64_t)a4 bundleID:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, id))a6;
  id v11 = +[OctaneActionContext contextWithBundleID:a5 transactionID:a4];
  id v17 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService performAction:transactionID:bundleID:completion:]", v11, &v17);
  id v12 = v17;
  if (!v12)
  {
    __int16 v13 = +[OctaneManager sharedInstance];
    id v12 = [v13 performAction:a3 withContext:v11];

    if (v12)
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      id v14 = (void *)qword_10039FA90;
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = v14;
        v16 = [v11 logKey];
        *(_DWORD *)buf = 138544130;
        v19 = v16;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        __int16 v22 = 2114;
        v23 = v11;
        __int16 v24 = 2114;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to perform action %ld with context %{public}@: %{public}@", buf, 0x2Au);
      }
    }
  }
  v10[2](v10, v12);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService performAction:transactionID:bundleID:completion:]", v11);
}

- (void)removeConfigurationForBundleID:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(id, id))a4;
  v7 = +[OctaneActionContext contextWithBundleID:a3];
  id v10 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService removeConfigurationForBundleID:completion:]", v7, &v10);
  id v8 = v10;
  if (!v8)
  {
    v9 = +[OctaneManager sharedInstance];
    [v9 deleteDataWithContext:v7];
  }
  v6[2](v6, v8);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService removeConfigurationForBundleID:completion:]", v7);
}

- (void)saveSigningData:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v14 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService saveSigningData:forBundleID:completion:]", v10, &v14);
  id v11 = v14;
  if (!v11)
  {
    id v12 = +[OctaneManager sharedInstance];
    id v13 = [v12 saveSigningData:v8 withContext:v10];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService saveSigningData:forBundleID:completion:]", v10);
}

- (void)startObservingTransactionsForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v16 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService startObservingTransactionsForBundleID:completion:]", v8, &v16);
  id v9 = v16;
  id v10 = 0;
  if (!v9)
  {
    id v11 = +[OctaneManager sharedInstance];
    id v10 = [v11 getTransactionDataWithContext:v8];
  }
  id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDOctaneClientProtocol];
  id v13 = [v8 connection];
  [v13 setRemoteObjectInterface:v12];

  id v14 = [v8 connection];
  id v15 = +[OctaneClientConnection addConnectionWithBundleID:v6 connection:v14 type:0];

  v7[2](v7, v9, v10);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService startObservingTransactionsForBundleID:completion:]", v8);
}

- (void)getIntegerValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id, uint64_t))a5;
  id v9 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService getIntegerValueForIdentifier:forBundleID:completion:]", v9, &v13);
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v12 = +[OctaneManager sharedInstance];
    uint64_t v11 = (uint64_t)[v12 getIntegerValueForIdentifier:a3 withContext:v9];
  }
  v8[2](v8, v10, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService getIntegerValueForIdentifier:forBundleID:completion:]", v9);
}

- (void)setIntegerValue:(int64_t)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, id, BOOL))a6;
  uint64_t v11 = +[OctaneActionContext contextWithBundleID:a5];
  id v14 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService setIntegerValue:forIdentifier:forBundleID:completion:]", v11, &v14);
  id v12 = v14;
  if (!v12)
  {
    id v13 = +[OctaneManager sharedInstance];
    id v12 = [v13 setIntegerValue:a3 forIdentifier:a4 withContext:v11];
  }
  v10[2](v10, v12, v12 == 0);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService setIntegerValue:forIdentifier:forBundleID:completion:]", v11);
}

- (void)getStringValueForIdentifier:(unint64_t)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id, void *))a5;
  id v9 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService getStringValueForIdentifier:forBundleID:completion:]", v9, &v13);
  id v10 = v13;
  uint64_t v11 = 0;
  if (!v10)
  {
    id v12 = +[OctaneManager sharedInstance];
    uint64_t v11 = [v12 getStringValueForIdentifier:a3 withContext:v9];
  }
  v8[2](v8, v10, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService getStringValueForIdentifier:forBundleID:completion:]", v9);
}

- (void)setStringValue:(id)a3 forIdentifier:(unint64_t)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id))a6;
  id v12 = +[OctaneActionContext contextWithBundleID:a5];
  id v15 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService setStringValue:forIdentifier:forBundleID:completion:]", v12, &v15);
  id v13 = v15;
  if (!v13)
  {
    id v14 = +[OctaneManager sharedInstance];
    id v13 = [v14 setStringValue:v10 forIdentifier:a4 withContext:v12];
  }
  v11[2](v11, v13);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService setStringValue:forIdentifier:forBundleID:completion:]", v12);
}

- (void)setStorefront:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService setStorefront:forBundleID:completion:]", v10, &v13);
  id v11 = v13;
  if (!v11)
  {
    id v12 = +[OctaneManager sharedInstance];
    id v11 = [v12 setStorefront:v8 withContext:v10];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService setStorefront:forBundleID:completion:]", v10);
}

- (void)testingAppsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = +[NSUUID lib_shortLogKey];
  id v6 = +[NSXPCConnection currentConnection];
  v7 = objc_msgSend(v6, "sk_clientID");
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  id v8 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = v5;
    __int16 v16 = 2082;
    id v17 = "-[StoreKitTestingService testingAppsWithCompletion:]";
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering %{public}s for by %{public}@", buf, 0x20u);
  }
  if (objc_msgSend(v6, "sk_isOctanePrivileged"))
  {
    id v13 = 0;
    id v9 = [(StoreKitTestingService *)self _testingAppsDataWithError:&v13];
    id v10 = (char *)v13;
    if (v10)
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      id v11 = qword_10039FA90;
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v5;
        __int16 v16 = 2114;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to get testing apps data: %{public}@ ", buf, 0x16u);
      }
    }
    else if (![v9 length])
    {

      id v9 = 0;
    }
    v4[2](v4, v9, v10);
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    id v12 = qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v5;
      __int16 v16 = 2082;
      id v17 = "-[StoreKitTestingService testingAppsWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Exiting  %{public}s ", buf, 0x16u);
    }
  }
  else
  {
    ASDErrorWithDescription();
    id v10 = (char *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);
  }
}

- (void)configurationDataForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v17 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService configurationDataForBundleID:completion:]", v8, &v17);
  id v9 = v17;
  if (v9)
  {
    id v10 = v9;
    v7[2](v7, 0, v9);
  }
  else
  {
    id v11 = +[OctaneManager sharedInstance];
    id v16 = 0;
    id v12 = [v11 configurationDataForBundleID:v6 error:&v16];
    id v10 = v16;

    if (v10)
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      id v13 = (void *)qword_10039FA90;
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        id v15 = [v8 logKey];
        *(_DWORD *)buf = 138543874;
        v19 = v15;
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2114;
        id v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to get configuration data for %{public}@: %{public}@ ", buf, 0x20u);
      }
    }
    ((void (**)(id, void *, id))v7)[2](v7, v12, v10);
    -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService configurationDataForBundleID:completion:]", v8);
  }
}

- (void)refreshQueueForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v12 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService refreshQueueForBundleId:completion:]", v8, &v12);
  id v9 = v12;
  if (!v9)
  {
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
      sub_1002C3594();
    }
    id v10 = [v8 bundleID];
    id v11 = +[StoreKitServiceConnection octaneConnectionForBundleID:v10];

    if (v11)
    {
      [v11 checkServerQueueForQueue:@"DefaultQueue" withClient:0];
    }
    else
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_ERROR)) {
        sub_1002C352C();
      }
    }
  }
  v7[2](v7, v9);
}

- (void)revokeEntitlementsForProductIdentifiers:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[OctaneActionContext contextWithBundleID:v9];
  id v19 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService revokeEntitlementsForProductIdentifiers:forBundleId:completion:]", v11, &v19);
  id v12 = v19;
  if (!v12)
  {
    uint64_t v13 = +[StoreKitServiceConnection octaneConnectionForBundleID:v9];
    if (v13)
    {
      id v14 = (void *)v13;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004CDE0;
      v17[3] = &unk_100357D08;
      id v18 = v10;
      [v14 notifyOfRevokedProductIdentifiers:v8 reply:v17];

      goto LABEL_5;
    }
    id v15 = +[StoreKitMessagesManager sharedManager];
    id v16 = +[OctaneManager testAccountID];
    [v15 revokeProductIdentifiers:v8 forBundleID:v9 accountID:v16];
  }
  (*((void (**)(id, id))v10 + 2))(v10, v12);
LABEL_5:
}

- (void)transactionDeleted:(unint64_t)a3 productID:(id)a4 forBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  id v9 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v21 = a3;
    __int16 v22 = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Notified of deleted transaction (%lu - %{public}@) for %{public}@", buf, 0x20u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = +[OctaneClientConnection connectionsForBundleID:](OctaneClientConnection, "connectionsForBundleID:", v8, 0);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) transactionDeleted:a3 forBundleID:v8];
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
    sub_1002C35FC();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = +[OctaneClientConnection connectionsForBundleID:](OctaneClientConnection, "connectionsForBundleID:", v6, 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) transactionUpdated:v5 forBundleID:v6];
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)updatePort:(int64_t)a3
{
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
    sub_1002C3664();
  }
  v4 = +[OctaneManager sharedInstance];
  [v4 portUpdated:a3];
}

- (void)removeTransactionIdentifiersFromCache:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v7];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService removeTransactionIdentifiersFromCache:forBundleIdentifier:]", v8, &v13);
  id v9 = v13;
  if (!v9)
  {
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    uint64_t v10 = (void *)qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
      sub_1002C3734(v10, v6, (uint64_t)v7);
    }
    id v11 = [[_TtC9storekitd6Client alloc] initWithBundleIdentifier:v7];
    if (v11)
    {
      long long v12 = +[ReceiptManager managerForClient:v11];
      [v12 clearTransactions];
    }
    else
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_ERROR)) {
        sub_1002C36CC();
      }
    }
  }
}

- (void)simulateStoreKitPushWithAction:(id)a3 forBundleIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 unsignedIntegerValue];
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEBUG)) {
    sub_1002C3844();
  }
  long long v18 = v5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v26;
  id v19 = v23;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = -[Client initWithBundleIdentifier:]([_TtC9storekitd6Client alloc], "initWithBundleIdentifier:", *(void *)(*((void *)&v25 + 1) + 8 * i), v18, v19);
      if (!v13)
      {
        if (qword_10039FAA0 != -1) {
          dispatch_once(&qword_10039FAA0, &stru_1003587D8);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_ERROR)) {
          sub_1002C37DC();
        }
        goto LABEL_23;
      }
      long long v14 = v13;
      long long v15 = +[ReceiptManager managerForClient:v13];
      long long v16 = v15;
      if (v7 == (id)37)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = nullsub_5;
        v20[3] = &unk_100358660;
        id v21 = v15;
        [v21 syncSubscriptionStatusWithReason:2 completionHandler:v20];
        long long v17 = &v21;
      }
      else
      {
        if (v7 != (id)36) {
          goto LABEL_16;
        }
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v23[0] = nullsub_4;
        v23[1] = &unk_100358660;
        id v24 = v15;
        [v24 syncReceiptsWithReason:2 completionHandler:v22];
        long long v17 = &v24;
      }

LABEL_16:
    }
    id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_23:
}

- (void)registerForEventOfType:(int64_t)a3 forBundleID:(id)a4 withFilterData:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  long long v12 = (void (**)(id, void))a6;
  id v13 = +[OctaneActionContext contextWithBundleID:v10];
  id v49 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService registerForEventOfType:forBundleID:withFilterData:completion:]", v13, &v49);
  id v14 = v49;
  if (v14)
  {
    v12[2](v12, 0);
  }
  else
  {
    long long v15 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:0];
    v43 = self;
    id v44 = v11;
    if (v15)
    {
      long long v16 = v15;
      long long v17 = [v15 objectForKeyedSubscript:@"bundleID"];

      if (!v17)
      {
        CFStringRef v56 = @"bundleID";
        id v57 = v10;
        long long v18 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        uint64_t v19 = objc_msgSend(v16, "ams_dictionaryByAddingEntriesFromDictionary:", v18);

        long long v16 = (void *)v19;
      }
    }
    else
    {
      CFStringRef v58 = @"bundleID";
      id v59 = v10;
      long long v16 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    }
    __int16 v20 = [v13 bundleID];
    id v21 = +[OctaneClientConnection connectionsForBundleID:v20];

    if (![v21 count])
    {
      __int16 v22 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDOctaneClientProtocol];
      id v23 = [v13 connection];
      [v23 setRemoteObjectInterface:v22];

      id v24 = [v13 connection];
      long long v25 = +[OctaneClientConnection addConnectionWithBundleID:v10 connection:v24 type:1];
      v55 = v25;
      uint64_t v26 = +[NSArray arrayWithObjects:&v55 count:1];
      long long v27 = v21;
      id v21 = (void *)v26;
    }
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    long long v28 = v21;
    v29 = qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      int64_t v52 = a3;
      __int16 v53 = 2114;
      id v54 = v16;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Registering for event type %{public}ld with filter %{public}@", buf, 0x16u);
    }
    v30 = +[OctaneManager sharedInstance];
    v31 = +[NSJSONSerialization dataWithJSONObject:v16 options:0 error:0];
    v32 = [v30 registerForEventOfType:a3 filterData:v31];

    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    v33 = v28;
    v34 = (void *)qword_10039FA90;
    id v14 = v42;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      id v36 = [v33 count];
      *(_DWORD *)buf = 138543618;
      int64_t v52 = (int64_t)v32;
      __int16 v53 = 2050;
      id v54 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Registering observation id %{public}@ to %{public}ld client(s)", buf, 0x16u);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v37 = v33;
    id v38 = [v37 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v46;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) registerObservationID:v32];
        }
        id v39 = [v37 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v39);
    }

    -[StoreKitTestingService _logExitForMethod:context:](v43, "_logExitForMethod:context:", "-[StoreKitTestingService registerForEventOfType:forBundleID:withFilterData:completion:]", v13);
    ((void (**)(id, void *))v12)[2](v12, v32);

    id v11 = v44;
  }
}

- (void)unregisterForEventWithIdentifier:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = +[OctaneActionContext contextWithBundleID:a4];
  id v26 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService unregisterForEventWithIdentifier:forBundleID:]", v7, &v26);
  id v8 = v26;
  if (!v8)
  {
    id v9 = [v7 bundleID];
    id v10 = +[OctaneClientConnection connectionsForBundleID:v9];

    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    id v11 = (void *)qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v11;
      id v13 = [v10 count];
      id v14 = [v7 bundleID];
      *(_DWORD *)buf = 138543874;
      id v29 = v6;
      __int16 v30 = 2050;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unregistering observation id %{public}@ with %{public}ld clients for %{public}@", buf, 0x20u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "unregisterObservationID:", v6, (void)v22);
        }
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v17);
    }

    if (!+[OctaneClientConnection observerCountForEventIdentifier:v6])
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      __int16 v20 = qword_10039FA90;
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unregistering observation id %{public}@ with XPC service", buf, 0xCu);
      }
      id v21 = +[OctaneManager sharedInstance];
      [v21 unregisterForEventWithIdentifier:v6];
    }
    -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService unregisterForEventWithIdentifier:forBundleID:]", v7, (void)v22);
  }
}

- (void)storeKitErrorForCategory:(int64_t)a3 bundleID:(id)a4 withReply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:v8];
  uint64_t v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService storeKitErrorForCategory:bundleID:withReply:]", v10, &v13);
  id v11 = 0;
  if (!v13)
  {
    long long v12 = +[OctaneManager sharedInstance];
    id v11 = [v12 storeKitErrorForCategory:a3 bundleID:v8];
  }
  v9[2](v9, v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService storeKitErrorForCategory:bundleID:withReply:]", v10);
}

- (void)setStoreKitError:(int64_t)a3 forCategory:(int64_t)a4 bundleID:(id)a5 withReply:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  long long v12 = +[OctaneActionContext contextWithBundleID:v10];
  uint64_t v14 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService setStoreKitError:forCategory:bundleID:withReply:]", v12, &v14);
  if (!v14)
  {
    uint64_t v13 = +[OctaneManager sharedInstance];
    [v13 setStoreKitError:a3 forCategory:a4 bundleID:v10];
  }
  v11[2](v11);
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService setStoreKitError:forCategory:bundleID:withReply:]", v12);
}

- (void)buyProductWithConfiguration:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, void))a5;
  id v10 = +[OctaneActionContext contextWithBundleID:a4];
  id v13 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService buyProductWithConfiguration:bundleID:completion:]", v10, &v13);
  id v11 = v13;
  if (v11)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    long long v12 = +[OctaneManager sharedInstance];
    [v12 buyProductWithConfiguration:v8 withContext:v10 withReply:v9];
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService buyProductWithConfiguration:bundleID:completion:]", v10);
}

- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (qword_10039FAA0 != -1) {
    dispatch_once(&qword_10039FAA0, &stru_1003587D8);
  }
  id v9 = qword_10039FA90;
  if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_INFO))
  {
    int v13 = 134349314;
    int64_t v14 = a3;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received event from XPC service %{public}ld for observer %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v10 = +[NSXPCConnection currentConnection];
  unsigned __int8 v11 = objc_msgSend(v10, "sk_isOctanePrivileged");

  if (v11)
  {
    +[OctaneClientConnection receiveEventOfType:a3 withData:v7 onAllObserversWithID:v8];
  }
  else
  {
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    long long v12 = qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_ERROR)) {
      sub_1002C38C0(v12);
    }
  }
}

- (void)showMessage:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v7];
  id v22 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService showMessage:forBundleID:]", v8, &v22);
  id v9 = v22;
  if (!v9)
  {
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    id v10 = qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received request to show message for %{public}@", buf, 0xCu);
    }
    unsigned __int8 v11 = +[StoreKitServiceConnection octaneConnectionForBundleID:v7];
    long long v12 = [v11 xpcConnection];

    if (v12)
    {
      int v13 = [v6 objectForKeyedSubscript:@"url"];
      int64_t v14 = [v6 objectForKeyedSubscript:@"messageReason"];
      id v21 = [v6 objectForKeyedSubscript:@"shouldAllowDeveloperControl"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (qword_10039FAA0 != -1) {
          dispatch_once(&qword_10039FAA0, &stru_1003587D8);
        }
        __int16 v15 = qword_10039FA90;
        if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v24 = v13;
          __int16 v25 = 2112;
          id v26 = v7;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "will ask to show message at %@ for %@", buf, 0x16u);
        }
        id v16 = -[StoreKitMessageInfo initWithUserID:bundleID:status:allowDeveloperControl:messageType:]([StoreKitMessageInfo alloc], "initWithUserID:bundleID:status:allowDeveloperControl:messageType:", &off_100373AD0, v7, &off_100373AE8, [v21 BOOLValue], objc_msgSend(v14, "integerValue"));
        id v17 = +[StoreKitMessagesManager sharedManager];
        [v17 addMessage:v16 error:0];
        [v11 client];
        v18 = __int16 v20 = v14;
        uint64_t v19 = [v11 xpcConnection];
        [v17 askToShowMessageForClient:v18 message:v16 pendingURL:v13 connection:v19];

        int64_t v14 = v20;
      }
      else
      {
        if (qword_10039FAA0 != -1) {
          dispatch_once(&qword_10039FAA0, &stru_1003587D8);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_ERROR)) {
          sub_1002C396C();
        }
      }
    }
    else
    {
      int v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1002C3904();
      }
    }
  }
}

- (id)_adNetworkServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_connectionLock lock];
  connection = self->_connection;
  if (!connection)
  {
    if (qword_10039FAA0 != -1) {
      dispatch_once(&qword_10039FAA0, &stru_1003587D8);
    }
    id v6 = qword_10039FA90;
    if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connecting to ad network service", (uint8_t *)buf, 2u);
    }
    id v7 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.storekitservice" options:0];
    id v8 = self->_connection;
    self->_connection = v7;

    id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASDOctaneAdNetworkProtocol];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    int64_t v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    [v9 setClasses:v14 forSelector:"sendTestPingbackForBundleID:completion:" argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v9];
    objc_initWeak(buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004E96C;
    v19[3] = &unk_100358790;
    objc_copyWeak(&v20, buf);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004EA10;
    v17[3] = &unk_100358790;
    objc_copyWeak(&v18, buf);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v17];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);

    connection = self->_connection;
  }
  __int16 v15 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  [(NSLock *)self->_connectionLock unlock];

  return v15;
}

- (void)_adNetworkServiceInvalidated
{
  [(NSLock *)self->_connectionLock lock];
  connection = self->_connection;
  self->_connection = 0;

  connectionLock = self->_connectionLock;

  [(NSLock *)connectionLock unlock];
}

- (void)addPostbacksFromDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v21 = a3;
  id v22 = a4;
  long long v23 = (void (**)(id, id))a5;
  id v26 = +[OctaneActionContext contextWithBundleID:v22];
  id v42 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService addPostbacksFromDictionaries:forBundleID:completion:]", v26, &v42);
  id v7 = v42;
  id v20 = v7;
  if (v7)
  {
    v23[2](v23, v7);
  }
  else
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10004EF00;
    v40[3] = &unk_100357D08;
    id v8 = v23;
    v41 = v8;
    uint64_t v19 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:v40];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = sub_10004EFF0;
    id v38 = sub_10004F000;
    id v39 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004F008;
    v31[3] = &unk_1003587B8;
    id v9 = v8;
    __int16 v32 = v9;
    v33 = &v34;
    [v19 configureSourceForTestPostbackDictionaries:v21 forBundleID:v22 completion:v31];
    if (v35[5])
    {
      uint64_t v10 = objc_opt_new();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id obj = (id)v35[5];
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v28;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(obj);
            }
            int64_t v14 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i)];
            __int16 v15 = +[NSUUID UUID];
            id v16 = [v15 UUIDString];
            [v14 setObject:v16 forKeyedSubscript:@"transactionId"];

            id v17 = +[OctaneManager sharedInstance];
            id v18 = [v17 generateSKANPostbackSignature:v14 withContext:v26];
            [v14 setObject:v18 forKeyedSubscript:@"signature"];

            [v10 addObject:v14];
          }
          id v11 = [obj countByEnumeratingWithState:&v27 objects:v43 count:16];
        }
        while (v11);
      }

      [v19 addPostbacksFromDictionaries:v10 forBundleID:v22 completion:v9];
    }

    _Block_object_dispose(&v34, 8);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService addPostbacksFromDictionaries:forBundleID:completion:]", v26);
}

- (void)developerPostbackURLForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v17 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService developerPostbackURLForBundleID:completion:]", v8, &v17);
  id v9 = v17;
  if (v9)
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int64_t v14 = sub_10004F1DC;
    __int16 v15 = &unk_100357D08;
    uint64_t v10 = v7;
    id v16 = v10;
    id v11 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:&v12];
    objc_msgSend(v11, "developerPostbackURLForBundleID:completion:", v6, v10, v12, v13, v14, v15);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService developerPostbackURLForBundleID:completion:]", v8);
}

- (void)retrieveTestPostbacksForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v17 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService retrieveTestPostbacksForBundleID:completion:]", v8, &v17);
  id v9 = v17;
  if (v9)
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int64_t v14 = sub_10004F420;
    __int16 v15 = &unk_100357D08;
    uint64_t v10 = v7;
    id v16 = v10;
    id v11 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:&v12];
    objc_msgSend(v11, "retrieveTestPostbacksForBundleID:completion:", v6, v10, v12, v13, v14, v15);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService retrieveTestPostbacksForBundleID:completion:]", v8);
}

- (void)sendTestPingbackForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[OctaneActionContext contextWithBundleID:v6];
  id v17 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService sendTestPingbackForBundleID:completion:]", v8, &v17);
  id v9 = v17;
  if (v9)
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int64_t v14 = sub_10004F664;
    __int16 v15 = &unk_100357D08;
    uint64_t v10 = v7;
    id v16 = v10;
    id v11 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:&v12];
    objc_msgSend(v11, "sendTestPingbackForBundleID:completion:", v6, v10, v12, v13, v14, v15);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService sendTestPingbackForBundleID:completion:]", v8);
}

- (void)validateSKAdNetworkImpression:(id)a3 withPublicKey:(id)a4 forBundleID:(id)a5 source:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(id, id))a7;
  id v16 = +[OctaneActionContext contextWithBundleID:v14];
  id v29 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService validateSKAdNetworkImpression:withPublicKey:forBundleID:source:completion:]", v16, &v29);
  id v17 = v29;
  id v18 = [(StoreKitTestingService *)self _getSKAdNetworkSignatureParametersFromImpression:v12 source:a6];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"adNetworkAttributionSignature"];
  if (v19)
  {
    if (v17
      || (+[OctaneManager sharedInstance],
          id v26 = v13,
          id v20 = objc_claimAutoreleasedReturnValue(),
          [v20 validateSKAdNetworkSignature:v19 withPublicKey:v26 source:a6 andParameters:v18 withContext:v16], v17 = (id)objc_claimAutoreleasedReturnValue(), v20, id v13 = v26, v17))
    {
      if (qword_10039FAA0 != -1) {
        dispatch_once(&qword_10039FAA0, &stru_1003587D8);
      }
      id v21 = qword_10039FA90;
      if (os_log_type_enabled((os_log_t)qword_10039FA90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v17;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SKAdNetwork signature validation failure %@", buf, 0xCu);
      }
      v15[2](v15, v17);
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10004FA40;
      v27[3] = &unk_100357D08;
      long long v23 = v15;
      long long v28 = v23;
      long long v24 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:v27];
      __int16 v25 = v23;
      id v13 = v26;
      [v24 validateSKAdNetworkImpression:v12 withPublicKey:v26 forBundleID:v14 source:a6 completion:v25];

      id v17 = 0;
    }
  }
  else
  {
    id v22 = ASDErrorWithDescription();
    v15[2](v15, v22);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService validateSKAdNetworkImpression:withPublicKey:forBundleID:source:completion:]", v16);
}

- (void)configureSourceForTestPostbackDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  id v11 = +[OctaneActionContext contextWithBundleID:v9];
  id v20 = 0;
  -[StoreKitTestingService _validateMethodCall:context:error:](self, "_validateMethodCall:context:error:", "-[StoreKitTestingService configureSourceForTestPostbackDictionaries:forBundleID:completion:]", v11, &v20);
  id v12 = v20;
  if (v12)
  {
    v10[2](v10, 0, v12);
  }
  else
  {
    __int16 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10004FC98;
    id v18 = &unk_100357D08;
    id v13 = v10;
    id v19 = v13;
    id v14 = [(StoreKitTestingService *)self _adNetworkServiceWithErrorHandler:&v15];
    objc_msgSend(v14, "configureSourceForTestPostbackDictionaries:forBundleID:completion:", v8, v9, v13, v15, v16, v17, v18);
  }
  -[StoreKitTestingService _logExitForMethod:context:](self, "_logExitForMethod:context:", "-[StoreKitTestingService configureSourceForTestPostbackDictionaries:forBundleID:completion:]", v11);
}

- (id)_getSKAdNetworkSignatureParametersFromImpression:(id)a3 source:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 4)
  {
    id v7 = (id)objc_opt_new();
    id v8 = [v6 objectForKeyedSubscript:@"source_domain"];
    [v7 setObject:v8 forKeyedSubscript:@"adNetworkSourceDomain"];

    id v9 = [v6 objectForKeyedSubscript:@"itunes_item_id"];
    [v7 setObject:v9 forKeyedSubscript:@"id"];

    uint64_t v10 = [v6 objectForKeyedSubscript:@"ad_network_id"];
    [v7 setObject:v10 forKeyedSubscript:@"adNetworkId"];

    id v11 = [v6 objectForKeyedSubscript:@"nonce"];
    [v7 setObject:v11 forKeyedSubscript:@"adNetworkNonce"];

    id v12 = [v6 objectForKeyedSubscript:@"version"];
    [v7 setObject:v12 forKeyedSubscript:@"adNetworkPayloadVersion"];

    id v13 = [v6 objectForKeyedSubscript:@"timestamp"];
    [v7 setObject:v13 forKeyedSubscript:@"adNetworkImpressionTimestamp"];

    id v14 = [v6 objectForKeyedSubscript:@"signature"];
    [v7 setObject:v14 forKeyedSubscript:@"adNetworkAttributionSignature"];

    __int16 v15 = [v6 objectForKeyedSubscript:@"source_identifier"];
    [v7 setObject:v15 forKeyedSubscript:@"sourceIdentifier"];

    uint64_t v16 = [v6 objectForKeyedSubscript:@"fidelity-type"];
    [v7 setObject:v16 forKeyedSubscript:@"fidelity-type"];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)isAppStoreSignedAppWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  LOBYTE(v4) = sub_1000AB2F8(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (BOOL)validateMethodCall:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = v8;
  id v10 = a4;
  id v11 = self;
  sub_1000AB438(v7, v9, v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)_validateMethodCall:(void *)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = self;
  sub_1000AC780((uint64_t)a3, (uint64_t)v7);

  return 1;
}

- (void)logExitForMethod:(id)a3 context:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  id v7 = self;
  sub_1000AC9A4();

  swift_bridgeObjectRelease();
}

- (void)_logExitForMethod:(void *)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = self;
  sub_1000ACCE4((uint64_t)a3, (uint64_t)v6);
}

- (id)validateOctaneContextFor:(id)a3 with:(id)a4 completion:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v6);
  id v13 = self;
  id v14 = sub_1000ACDDC(v7, v9, v10, v12, v13, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (void)saveConfigurationData:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  _Block_copy(v8);
  sub_1000AD030(v11, v13, v14, v16, v17, (void (**)(void, void *))v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  sub_100012EB8(v11, v13);
}

- (void)saveConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v23 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v22 = v21;

  _Block_copy(v10);
  sub_1000ADF3C(v14, v16, v17, v19, v20, v22, v23, (void (**)(void, void *))v10);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100012EB8(v14, v16);
}

- (id)_testingAppsDataWithError:(id *)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_1000AFCFC();
  unint64_t v6 = v5;

  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100012EB8(v4, v6);

  return v7.super.isa;
}

- (void)sendPurchaseIntentForProductIdentifier:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  unint64_t v6 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v6;
  NSData v7 = self;
  StoreKitTestingService.sendPurchaseIntent(for:bundleID:completion:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end