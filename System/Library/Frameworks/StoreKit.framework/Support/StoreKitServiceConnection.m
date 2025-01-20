@interface StoreKitServiceConnection
+ (id)allConnections;
+ (id)connectionForClient:(id)a3;
+ (id)octaneConnectionForBundleID:(id)a3;
+ (int64_t)_apiVersionForClientDict:(id)a3;
+ (void)initialize;
- (BOOL)_isClientValidForReview:(id)a3;
- (BOOL)_isSKANVersionFourOrHigher:(id)a3;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (RemoteAlertWrapper)remoteAlertWrapper;
- (SKClientProtocol)remoteObject;
- (StoreKitServiceConnection)initWithConnection:(id)a3 remoteObject:(id)a4 pid:(int)a5;
- (_TtC9storekitd6Client)client;
- (id)_bundleURLForConnection:(id)a3;
- (id)_offerCodeRedemptionURLForClient:(id)a3;
- (id)_processDownloadsForTransactions:(id)a3;
- (id)_silentAuthWithClientInfo:(id)a3 account:(id)a4 logKey:(id)a5;
- (void)_handleTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5;
- (void)_processPayment:(id)a3 excludeReceipt:(BOOL)a4 privacyAcknowledgementRequired:(BOOL)a5 forClient:(id)a6 apiVersion:(int64_t)a7 paymentDelegate:(id)a8 isProcessingInterruptedBuy:(BOOL)a9 reply:(id)a10;
- (void)acknowledgeMessage:(id)a3 reply:(id)a4;
- (void)addDownloadWithID:(id)a3;
- (void)addPurchaseIntentWithRequest:(id)a3 reply:(id)a4;
- (void)appTransactionForClient:(id)a3 ignoreCache:(BOOL)a4 reply:(id)a5;
- (void)arcadeSubscriptionStatusWithNonce:(unint64_t)a3 resultHandler:(id)a4;
- (void)authenticateAndSyncTransactionsAndStatusWithReply:(id)a3;
- (void)bindPaymentAccountWithRequest:(id)a3 reply:(id)a4;
- (void)canMakePaymentsWithReply:(id)a3;
- (void)cancelDownloadWithID:(id)a3;
- (void)checkForMessages;
- (void)checkPaymentAccountBindingEligibilityWithRequest:(id)a3 reply:(id)a4;
- (void)checkServerQueueForClientIfNecessary:(id)a3 forceCheck:(BOOL)a4 reply:(id)a5;
- (void)checkServerQueueForQueue:(id)a3 withClient:(id)a4;
- (void)clearPurchaseIntentsWithRequest:(id)a3 reply:(id)a4;
- (void)clientOverridesWithReply:(id)a3;
- (void)dealloc;
- (void)deleteContentForProductID:(id)a3;
- (void)displayMessageWithType:(id)a3;
- (void)downloadManager:(id)a3 updatedStatus:(id)a4;
- (void)endAdImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)engagementRequestForOfferCodeRedemptionSheetWithReply:(id)a3;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5;
- (void)enumerateSubscriptionStatusesWithReceiver:(id)a3 reply:(id)a4;
- (void)enumerateUnfinishedTransactionsWithReceiver:(id)a3 reply:(id)a4;
- (void)externalGatewaySheetWithRequest:(id)a3 reply:(id)a4;
- (void)externalPurchaseLinkURLsForBundleID:(id)a3 reply:(id)a4;
- (void)finishPaymentWithIdentifier:(id)a3 reply:(id)a4;
- (void)handleInvalidReceipt:(id)a3;
- (void)insertMessageForBundleID:(id)a3 status:(int64_t)a4 type:(int64_t)a5 allowDeveloperControl:(BOOL)a6 environment:(int64_t)a7 reply:(id)a8;
- (void)invalidateTransactionsAndStatusCacheWithReply:(id)a3;
- (void)isEligibleForIntroductoryOfferForGroupID:(id)a3 reply:(id)a4;
- (void)isXcodeTestAppWithReply:(id)a3;
- (void)loadUnfinishedTransactionsWithLogKey:(id)a3 completion:(id)a4;
- (void)lookUpItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 reply:(id)a4;
- (void)lookupProductWithParametersProductRequest:(id)a3 reply:(id)a4;
- (void)lookupProductWithURLProductRequest:(id)a3 reply:(id)a4;
- (void)manageSubscriptionsEngagementRequestWithRequest:(id)a3 reply:(id)a4;
- (void)notifyOfRevokedProductIdentifiers:(id)a3 reply:(id)a4;
- (void)pauseDownloadWithID:(id)a3;
- (void)policyWithRequest:(id)a3 reply:(id)a4;
- (void)presentCodeRedemptionSheet;
- (void)presentCodeRedemptionSheetWithSceneID:(id)a3 reply:(id)a4;
- (void)presentManageSubscriptionsWithRequest:(id)a3 reply:(id)a4;
- (void)presentRefundRequestSheetForTransactionID:(id)a3 sceneID:(id)a4 reply:(id)a5;
- (void)processPayment:(id)a3 forClient:(id)a4 paymentDelegate:(id)a5 reply:(id)a6;
- (void)processPaymentWithBuyParamsString:(id)a3 reply:(id)a4;
- (void)productsWithRequest:(id)a3 responseReceiver:(id)a4 reply:(id)a5;
- (void)promotionInfoForProductIdentifiers:(id)a3 client:(id)a4 reply:(id)a5;
- (void)purchaseIntentsWithRequest:(id)a3 reply:(id)a4;
- (void)receivedTransactions:(id)a3;
- (void)refundRequestForTransactionId:(id)a3 replyBlock:(id)a4;
- (void)registerArcadeAppWithRandomFromLib:(id)a3 randomFromLibLength:(unsigned int)a4 resultHandler:(id)a5;
- (void)registerForInstallAttribution;
- (void)renewReceiptWithOptions:(id)a3 client:(id)a4 replyBlock:(id)a5;
- (void)repairArcadeApp;
- (void)requestProductReviewWithInterfaceOrientation:(unint64_t)a3 bundleIdentifier:(id)a4 sceneID:(id)a5 replyBlock:(id)a6;
- (void)restoreCompletedTransactionsForUsername:(id)a3 client:(id)a4 reply:(id)a5;
- (void)resumeDownloadWithID:(id)a3;
- (void)saveNewTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5;
- (void)setAppInstallSheetBundleID:(id)a3 reply:(id)a4;
- (void)setClientOverrideWithRequest:(id)a3 reply:(id)a4;
- (void)setPromotionInfo:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)setRemoteAlertWrapper:(id)a3;
- (void)startAdImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)statusForSubscriptionGroupID:(id)a3 reply:(id)a4;
- (void)storefront:(id)a3 reply:(id)a4;
- (void)updateConversionValue:(id)a3;
- (void)updateConversionValue:(id)a3 coarseValue:(id)a4 completionHandler:(id)a5;
- (void)updateConversionValue:(id)a3 coarseValue:(id)a4 lockWindow:(BOOL)a5 completionHandler:(id)a6;
- (void)updateConversionValue:(id)a3 completionHandler:(id)a4;
- (void)updateTransactions:(id)a3 forClient:(id)a4;
- (void)xcodeTestCertificatesShouldSimulateRevocationWithReply:(id)a3;
- (void)xcodeTestCertificatesWithReply:(id)a3;
- (void)xcodeTestServerPortWithReplyBlock:(id)a3;
@end

@implementation StoreKitServiceConnection

- (NSString)description
{
  return +[NSString stringWithFormat:@"%@(%ld)", objc_opt_class(), self->_pid];
}

- (id)_processDownloadsForTransactions:(id)a3
{
  id v17 = a3;
  v4 = +[InAppDownloadManager manager];
  v5 = [v4 processDownloadsForTransactions:v17];

  obj = self->_downloadIDs;
  objc_sync_enter(obj);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
        v11 = objc_msgSend(v10, "tcr_numberForKey:", off_100399388[0], obj);
        v12 = objc_msgSend(v10, "tcr_arrayForKey:", @"assets");
        if ([v12 count]) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          v14 = off_100399660;
          if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v23 = self;
            __int16 v24 = 2114;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Processed download with ID: %{public}@", buf, 0x16u);
          }
          [(NSMutableSet *)self->_downloadIDs addObject:v11];
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);

  return v6;
}

- (void)checkForMessages
{
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  v3 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    BOOL v13 = self;
    __int16 v14 = 2082;
    v15 = "-[StoreKitServiceConnection checkForMessages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  v4 = +[NSXPCConnection currentConnection];
  v5 = [[_TtC9storekitd6Client alloc] initWithConnection:v4 overridesDictionary:0];
  id v6 = v5;
  if (v5)
  {
    if ([(Client *)v5 isClip])
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399670, OS_LOG_TYPE_ERROR)) {
        sub_1002C5940();
      }
    }
    else
    {
      id v7 = +[StoreKitMessagesManager sharedManager];
      [v7 checkForMessagesForClient:v6 remoteObjectProxy:self->_remoteObject xpcConnection:v4];

      uint64_t v8 = +[StoreKitMessagesManager sharedManager];
      v9 = [v8 revocationsForClient:v6];

      if (v9)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100060DE8;
        v10[3] = &unk_100359290;
        v10[4] = self;
        id v11 = v9;
        [(StoreKitServiceConnection *)self renewReceiptWithOptions:0 client:0 replyBlock:v10];
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399670, OS_LOG_TYPE_ERROR)) {
      sub_1002C58D8();
    }
  }
}

- (void)checkServerQueueForClientIfNecessary:(id)a3 forceCheck:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void, LoadUnfinishedInAppTransactionsTask *))a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  v10 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    __int16 v30 = 2082;
    v31 = "-[StoreKitServiceConnection checkServerQueueForClientIfNecessary:forceCheck:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v11 = +[NSXPCConnection currentConnection];
  v12 = [(StoreKitServiceConnection *)self client];
  if (objc_msgSend(v12, "objc_clientType") == 3)
  {
    unsigned __int8 v13 = objc_msgSend(v11, "sk_connectionIsOctaneService");

    if (v13)
    {
LABEL_18:
      v16 = [(StoreKitServiceConnection *)self client];
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (objc_msgSend(v11, "sk_allowClientOverride")) {
    __int16 v14 = v8;
  }
  else {
    __int16 v14 = 0;
  }
  id v15 = v14;
  v16 = [[_TtC9storekitd6Client alloc] initWithConnection:v11 overridesDictionary:v15];

  if (!v16)
  {
    id v17 = [(StoreKitServiceConnection *)self client];
    BOOL v18 = objc_msgSend(v17, "objc_clientType") == 3;

    if (!v18)
    {
      v16 = 0;
      goto LABEL_28;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C463C((uint64_t)self);
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v16)
  {
    if ([(Client *)v16 isClip])
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
        sub_1002C45D4();
      }
      ASDErrorWithDescription();
      long long v19 = (LoadUnfinishedInAppTransactionsTask *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v19);
    }
    else
    {
      long long v19 = [[LoadUnfinishedInAppTransactionsTask alloc] initWithClient:v16];
      [(LoadUnfinishedInAppTransactionsTask *)v19 setForceServerCheck:v6];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v19);
      long long v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100009A90;
      v23 = &unk_100359010;
      objc_copyWeak(&v25, &location);
      objc_copyWeak(&v26, (id *)buf);
      __int16 v24 = v9;
      [(LoadUnfinishedInAppTransactionsTask *)v19 setCompletionBlock:&v20];
      -[NSOperationQueue addOperation:](self->_paymentQueue, "addOperation:", v19, v20, v21, v22, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_33;
  }
LABEL_28:
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
    sub_1002C456C();
  }
  ASDErrorWithTitleAndMessage();
  long long v19 = (LoadUnfinishedInAppTransactionsTask *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v19);
LABEL_33:
}

- (StoreKitServiceConnection)initWithConnection:(id)a3 remoteObject:(id)a4 pid:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v53.receiver = self;
  v53.super_class = (Class)StoreKitServiceConnection;
  id v11 = [(StoreKitServiceConnection *)&v53 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    downloadIDs = v11->_downloadIDs;
    v11->_downloadIDs = (NSMutableSet *)v12;

    v11->_pid = a5;
    objc_storeStrong((id *)&v11->_remoteObject, a4);
    objc_storeStrong((id *)&v11->_xpcConnection, a3);
    objc_msgSend(v9, "sk_processName");
    __int16 v14 = (StoreKitServiceConnection *)objc_claimAutoreleasedReturnValue();
    id v15 = [[_TtC9storekitd6Client alloc] initWithConnection:v9 overridesDictionary:0];
    client = v11->_client;
    v11->_client = v15;

    p_prots = &OBJC_PROTOCOL___NSURLSessionDelegate.prots;
    if (v11->_client)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      BOOL v18 = (void *)qword_100399668;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_INFO))
      {
        long long v19 = v18;
        long long v20 = (StoreKitServiceConnection *)objc_opt_class();
        uint64_t v21 = v11->_client;
        v22 = v20;
        v23 = [(Client *)v21 callerBundleID];
        signed int v24 = [(Client *)v11->_client objc_clientType];
        *(_DWORD *)buf = 138543874;
        v55 = v20;
        __int16 v56 = 2114;
        CFStringRef v57 = v23;
        __int16 v58 = 2048;
        uint64_t v59 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ client type: %ld", buf, 0x20u);
      }
      if ([(Client *)v11->_client isBeta])
      {
        id v25 = [(Client *)v11->_client account];

        if (!v25)
        {
          id v26 = AMSAccountMediaTypeProduction;
          v27 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v26];
          v28 = objc_msgSend(v27, "ams_activeiTunesAccount");

          if (v28)
          {
            v29 = +[NSUUID lib_shortLogKey];
            if (qword_10039FC68 != -1) {
              dispatch_once(&qword_10039FC68, &stru_100359368);
            }
            __int16 v30 = qword_100399668;
            if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v29;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] No TestFlight account in beta account store. Attempting silent auth with prod account.", buf, 0xCu);
            }
            v31 = [(Client *)v11->_client processInfo];
            v32 = [(StoreKitServiceConnection *)v11 _silentAuthWithClientInfo:v31 account:v28 logKey:v29];
            [v32 resultWithTimeout:0 error:2.0];

            p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 16);
          }
        }
      }
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      v33 = qword_100399668;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v55 = v14;
        __int16 v56 = 2048;
        CFStringRef v57 = (const __CFString *)a5;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No StoreKitClient available for %{public}@[%ld]", buf, 0x16u);
      }
    }
    v34 = +[InAppDownloadManager manager];
    id v35 = [v34 addDownloadObserver:v11];

    v36 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    finishPaymentQueue = v11->_finishPaymentQueue;
    v11->_finishPaymentQueue = v36;

    [(NSOperationQueue *)v11->_finishPaymentQueue setMaxConcurrentOperationCount:5];
    v38 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    paymentQueue = v11->_paymentQueue;
    v11->_paymentQueue = v38;

    [(NSOperationQueue *)v11->_paymentQueue setMaxConcurrentOperationCount:1];
    v40 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    appTerminationQueue = v11->_appTerminationQueue;
    v11->_appTerminationQueue = v40;

    [(NSOperationQueue *)v11->_appTerminationQueue setMaxConcurrentOperationCount:1];
    v42 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    productLookupQueue = v11->_productLookupQueue;
    v11->_productLookupQueue = v42;

    [(NSOperationQueue *)v11->_productLookupQueue setMaxConcurrentOperationCount:1];
    dispatch_queue_t v44 = dispatch_queue_create("com.apple.appstored.StoreKit.MessageQueue", 0);
    messageQueue = v11->_messageQueue;
    v11->_messageQueue = (OS_dispatch_queue *)v44;

    dispatch_queue_t v46 = dispatch_queue_create("com.apple.storekitd.ProductPromotions", 0);
    productPromotionsQueue = v11->_productPromotionsQueue;
    v11->_productPromotionsQueue = (OS_dispatch_queue *)v46;

    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    v48 = p_prots[205];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = v48;
      unsigned int v50 = objc_msgSend(v9, "sk_allowClientOverride");
      CFStringRef v51 = @"NO";
      if (v50) {
        CFStringRef v51 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      v55 = v11;
      __int16 v56 = 2114;
      CFStringRef v57 = v51;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%{public}@: Allows client override: %{public}@", buf, 0x16u);
    }
  }
  [(id)qword_10039FC58 lock];
  [(id)qword_10039FC60 addObject:v11];
  [(id)qword_10039FC58 unlock];

  return v11;
}

- (void)storefront:(id)a3 reply:(id)a4
{
}

- (void)purchaseIntentsWithRequest:(id)a3 reply:(id)a4
{
}

- (_TtC9storekitd6Client)client
{
  return self->_client;
}

+ (void)initialize
{
  id v2 = objc_alloc_init((Class)NSLock);
  v3 = (void *)qword_10039FC58;
  qword_10039FC58 = (uint64_t)v2;

  qword_10039FC60 = +[NSHashTable weakObjectsHashTable];

  _objc_release_x1();
}

+ (id)allConnections
{
  [(id)qword_10039FC58 lock];
  id v2 = [(id)qword_10039FC60 allObjects];
  [(id)qword_10039FC58 unlock];

  return v2;
}

+ (id)connectionForClient:(id)a3
{
  id v3 = a3;
  if ([v3 storeItemID] && objc_msgSend(v3, "storeExternalVersionID"))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v4 = +[StoreKitServiceConnection allConnections];
    id v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v31;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v10 = [v9 client];
          id v11 = [v10 storeItemID];
          if (v11 == [v3 storeItemID])
          {
            uint64_t v12 = [v9 client];
            id v13 = [v12 storeExternalVersionID];
            id v14 = [v3 storeExternalVersionID];

            if (v13 == v14) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v15 = [v3 callerBundleID];
    id v16 = [v15 length];

    if (!v16) {
      goto LABEL_27;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v4 = +[StoreKitServiceConnection allConnections];
    id v17 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          uint64_t v21 = [v9 client];
          v22 = [v21 callerBundleID];
          v23 = [v3 callerBundleID];
          unsigned __int8 v24 = [v22 isEqualToString:v23];

          if (v24)
          {
LABEL_25:
            id v16 = v9;
            goto LABEL_26;
          }
        }
        id v18 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
  id v16 = 0;
LABEL_26:

LABEL_27:

  return v16;
}

+ (id)octaneConnectionForBundleID:(id)a3
{
  id v3 = a3;
  [(id)qword_10039FC58 lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)qword_10039FC60;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "client", (void)v14);
        id v10 = [v9 requestBundleID];
        if ([v10 isEqualToString:v3])
        {
          id v11 = [v8 client];
          unsigned int v12 = objc_msgSend(v11, "objc_clientType");

          if (v12 == 3)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
LABEL_12:

  [(id)qword_10039FC58 unlock];

  return v5;
}

- (void)dealloc
{
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEBUG)) {
    sub_1002C4438();
  }
  [(id)qword_10039FC58 lock];
  [(id)qword_10039FC60 removeObject:self];
  [(id)qword_10039FC58 unlock];
  v3.receiver = self;
  v3.super_class = (Class)StoreKitServiceConnection;
  [(StoreKitServiceConnection *)&v3 dealloc];
}

- (void)loadUnfinishedTransactionsWithLogKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [LoadUnfinishedInAppTransactionsTask alloc];
  id v9 = [(StoreKitServiceConnection *)self client];
  id v10 = [(LoadUnfinishedInAppTransactionsTask *)v8 initWithClient:v9];

  [(LoadUnfinishedInAppTransactionsTask *)v10 setLogKey:v6];
  [(LoadUnfinishedInAppTransactionsTask *)v10 setForceServerCheck:1];
  objc_initWeak(&location, v10);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  long long v15 = sub_100057C28;
  long long v16 = &unk_100358FC0;
  objc_copyWeak(&v19, &location);
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  [(LoadUnfinishedInAppTransactionsTask *)v10 setCompletionBlock:&v13];
  -[NSOperationQueue addOperation:](self->_paymentQueue, "addOperation:", v10, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)checkServerQueueForQueue:(id)a3 withClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100057DB4;
  v7[3] = &unk_100358FE8;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [(StoreKitServiceConnection *)self checkServerQueueForClientIfNecessary:a4 forceCheck:1 reply:v7];
}

- (void)receivedTransactions:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    id v10 = "-[StoreKitServiceConnection receivedTransactions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v7, 0x16u);
  }
  if ([v4 count])
  {
    id v6 = [(StoreKitServiceConnection *)self _processDownloadsForTransactions:v4];
    [(SKClientProtocol *)self->_remoteObject updatedTransactions:v6];
  }
}

- (void)updateTransactions:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    long long v15 = self;
    __int16 v16 = 2082;
    id v17 = "-[StoreKitServiceConnection updateTransactions:forClient:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v14, 0x16u);
  }
  __int16 v9 = +[NSXPCConnection currentConnection];
  unsigned __int8 v10 = objc_msgSend(v9, "sk_allowClientOverride");

  if (v10)
  {
    id v11 = [v7 objectForKey:off_100399270[0]];
    if (v11)
    {
      id v12 = [[_TtC9storekitd6Client alloc] initWithAuditTokenData:v11];
      id v13 = +[StoreKitServiceConnection connectionForClient:v12];
      if (v13 && [v6 count]) {
        [v13 receivedTransactions:v6];
      }
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C46AC();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C4714();
    }
  }
}

- (void)insertMessageForBundleID:(id)a3 status:(int64_t)a4 type:(int64_t)a5 allowDeveloperControl:(BOOL)a6 environment:(int64_t)a7 reply:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  long long v15 = (void (**)(id, void *))a8;
  id v28 = v14;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v16 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v32 = self;
    __int16 v33 = 2082;
    v34 = "-[StoreKitServiceConnection insertMessageForBundleID:status:type:allowDeveloperControl:environment:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v17 = +[NSXPCConnection currentConnection];
  unsigned __int8 v18 = objc_msgSend(v17, "sk_allowClientOverride");

  if ((v18 & 1) == 0)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C47E4();
    }
    goto LABEL_21;
  }
  switch(a7)
  {
    case 1:
      id v19 = &AMSAccountMediaTypeProduction;
LABEL_16:
      long long v20 = +[ACAccountStore ams_sharedAccountStoreForMediaType:*v19];
      uint64_t v21 = objc_msgSend(v20, "ams_activeiTunesAccount");

      objc_msgSend(v21, "ams_DSID");
      v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

      if (!v22) {
        break;
      }
LABEL_23:
      unsigned __int8 v24 = +[StoreKitMessagesManager sharedManager];
      id v25 = +[NSNumber numberWithInteger:a4];
      id v30 = 0;
      v23 = v29;
      [v24 addMessageStatus:v25 forBundleID:v29 accountID:v22 allowDeveloperControl:v10 messageType:a5 error:&v30];
      id v26 = v30;

      long long v27 = [v26 toASDErrorWithMetadata:0];

      v15[2](v15, v27);
      goto LABEL_24;
    case 3:
      v22 = &off_100373B60;
      goto LABEL_23;
    case 2:
      id v19 = &AMSAccountMediaTypeAppStoreSandbox;
      goto LABEL_16;
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
    sub_1002C477C();
  }
LABEL_21:
  ASDErrorWithTitleAndMessage();
  v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v22);
  v23 = v29;
LABEL_24:
}

- (void)processPaymentWithBuyParamsString:(id)a3 reply:(id)a4
{
  id v6 = (StoreKitServiceConnection *)a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = +[NSUUID lib_shortLogKey];
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v9 = qword_100399680;
  if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v59 = self;
    __int16 v60 = 2114;
    v61 = v8;
    __int16 v62 = 2082;
    v63 = "-[StoreKitServiceConnection processPaymentWithBuyParamsString:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] %{public}s", buf, 0x20u);
  }
  if ([(StoreKitServiceConnection *)v6 length])
  {
    BOOL v10 = +[NSXPCConnection currentConnection];
    unsigned __int8 v11 = objc_msgSend(v10, "sk_allowClientOverride");

    if (v11)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      v43 = self;
      id v12 = qword_100399680;
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v8;
        __int16 v60 = 2114;
        v61 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing buyParams %{public}@", buf, 0x16u);
      }
      id v13 = +[AMSBuyParams buyParamsWithString:v6];
      id v14 = [v13 dictionary];
      long long v15 = objc_msgSend(v14, "tcr_numberForKey:", @"appAdamId");

      __int16 v16 = [v13 dictionary];
      v45 = objc_msgSend(v16, "tcr_numberForKey:", AMSBuyParamPropertyAppExtVrsId);

      id v17 = [v13 parameterForKey:@"bid"];
      dispatch_queue_t v46 = [v13 parameterForKey:AMSBuyParamPropertyBundleVersion];
      unsigned __int8 v18 = [v13 parameterForKey:@"vendorName"];
      v49 = [v18 stringByRemovingPercentEncoding];

      [v13 setObject:0 forKeyedSubscript:@"vendorName"];
      CFStringRef v56 = @"buyParams";
      CFStringRef v57 = v13;
      v47 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      if ([(StoreKitServiceConnection *)v17 length])
      {
        id v19 = (_TtC9storekitd6Client *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
        if (v19) {
          goto LABEL_27;
        }
      }
      else
      {
        id v19 = 0;
      }
      if (v15) {
        id v19 = (_TtC9storekitd6Client *)objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v15, "longLongValue"), 0);
      }
LABEL_27:
      v48 = v19;
      if (v19)
      {
        long long v20 = [_TtC9storekitd6Client alloc];
        uint64_t v21 = [(Client *)v19 URL];
        id v19 = [(Client *)v20 initWithURL:v21 overridesDictionary:0];
      }
      if (v19) {
        BOOL v22 = 1;
      }
      else {
        BOOL v22 = v15 == 0;
      }
      int v23 = !v22;
      if (v22)
      {
        BOOL v44 = 0;
        if (!v19) {
          goto LABEL_60;
        }
      }
      else
      {
        if (![(StoreKitServiceConnection *)v17 length])
        {
          BOOL v44 = 0;
          goto LABEL_60;
        }
        unsigned __int8 v24 = v48;
        if (![v49 length])
        {
          BOOL v44 = 0;
          goto LABEL_62;
        }
        int v41 = v23;
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        id v25 = qword_100399680;
        if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v59 = v8;
          __int16 v60 = 2114;
          v61 = v17;
          __int16 v62 = 2114;
          v63 = (const char *)v15;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] App is not installed for %{public}@(%{public}@). Creating client with overrides.", buf, 0x20u);
        }
        v39 = +[NSXPCConnection currentConnection];
        id v26 = objc_opt_new();
        [v26 setObject:v17 forKeyedSubscript:off_100399278[0]];
        if ([(__CFString *)v46 length]) {
          CFStringRef v27 = v46;
        }
        else {
          CFStringRef v27 = @"1.0";
        }
        [v26 setObject:v27 forKeyedSubscript:off_100399280[0]];
        v40 = v15;
        [v26 setObject:v15 forKeyedSubscript:off_1003992A8[0]];
        [v26 setObject:v45 forKeyedSubscript:off_1003992A0[0]];
        [v26 setObject:&off_100373B78 forKeyedSubscript:off_100399290[0]];
        v38 = +[LSApplicationWorkspace defaultWorkspace];
        id v28 = [v38 createDeviceIdentifierWithVendorName:v49 bundleIdentifier:v17];
        BOOL v44 = v28 != 0;
        if (v28)
        {
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          long long v29 = (void *)qword_100399680;
          if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = v29;
            long long v31 = [v28 UUIDString];
            *(_DWORD *)buf = 138543619;
            uint64_t v59 = v8;
            __int16 v60 = 2113;
            v61 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generated VID for purchase %{private}@", buf, 0x16u);
          }
          [v26 setObject:v28 forKeyedSubscript:off_1003992B0[0]];
        }
        id v19 = [[_TtC9storekitd6Client alloc] initWithConnection:v39 overridesDictionary:v26];

        long long v15 = v40;
        int v23 = v41;
        if (!v19)
        {
LABEL_60:
          unsigned __int8 v24 = v48;
LABEL_62:
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
            sub_1002C48B4((uint64_t)v8);
          }
          id v35 = ASDErrorWithTitleAndMessage();
          v7[2](v7, 0, v35);

          if (!v44) {
            goto LABEL_73;
          }
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          v36 = qword_100399680;
          if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v59 = v8;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Releasing VID for failed purchase", buf, 0xCu);
          }
          id v19 = +[LSApplicationWorkspace defaultWorkspace];
          [(Client *)v19 removeDeviceIdentifierForVendorName:v49 bundleIdentifier:v17];
LABEL_72:

          unsigned __int8 v24 = v48;
LABEL_73:

          goto LABEL_74;
        }
      }
      unsigned int v42 = v23;
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      long long v32 = (void *)qword_100399680;
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = v32;
        v34 = [v13 stringValue];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v8;
        __int16 v60 = 2114;
        v61 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing payment with buyParams %{public}@", buf, 0x16u);
      }
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100058F90;
      v50[3] = &unk_100359038;
      CFStringRef v51 = v8;
      v52 = v17;
      BOOL v55 = v44;
      id v53 = v49;
      v54 = v7;
      LOBYTE(v37) = 1;
      [(StoreKitServiceConnection *)v43 _processPayment:v47 excludeReceipt:v42 privacyAcknowledgementRequired:0 forClient:v19 apiVersion:1 paymentDelegate:0 isProcessingInterruptedBuy:v37 reply:v50];

      goto LABEL_72;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
      sub_1002C4924();
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
      sub_1002C484C();
    }
  }
  id v13 = ASDErrorWithDescription();
  v7[2](v7, 0, v13);
LABEL_74:
}

- (void)processPayment:(id)a3 forClient:(id)a4 paymentDelegate:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v14 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v51 = self;
    __int16 v52 = 2082;
    id v53 = "-[StoreKitServiceConnection processPayment:forClient:paymentDelegate:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  long long v15 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v15, "sk_allowClientOverride")) {
    __int16 v16 = v11;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;
  unsigned __int8 v18 = [v17 objectForKey:off_100399270[0]];
  id v19 = [_TtC9storekitd6Client alloc];
  if (v18)
  {
    long long v20 = [(Client *)v19 initWithAuditTokenData:v18];
    BOOL v21 = 0;
    if (v20) {
      goto LABEL_10;
    }
  }
  else
  {
    long long v20 = [(Client *)v19 initWithConnection:v15 overridesDictionary:v17];
    BOOL v21 = v17 != 0;
    if (v20)
    {
LABEL_10:
      v43 = self;
      v45 = (void (**)(void, void, void))v13;
      BOOL v40 = v21;
      if (objc_msgSend(v15, "sk_allowClientOverride"))
      {
        id v22 = [v10 objectForKeyedSubscript:off_1003995A8[0]];
        if ([v22 length])
        {
          id v22 = v22;
          [v22 UTF8String];
          uint64_t v42 = sandbox_extension_consume();
          if ((v42 & 0x8000000000000000) == 0) {
            goto LABEL_16;
          }
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          int v23 = (void *)qword_100399680;
          if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR))
          {
            id v24 = v12;
            sub_1002C4B58((uint64_t)v43, v23);
          }
          else
          {
LABEL_16:
            id v24 = v12;
          }
        }
        else
        {
          id v24 = v12;
          uint64_t v42 = -1;
        }
      }
      else
      {
        id v24 = v12;
        id v26 = [v10 mutableCopy];
        [v26 setObject:0 forKeyedSubscript:off_100399518[0]];
        [v26 setObject:0 forKeyedSubscript:off_1003995B0[0]];
        [v26 setObject:0 forKeyedSubscript:off_1003995A0[0]];
        [v26 setObject:0 forKeyedSubscript:off_1003994F0[0]];
        [v26 setObject:0 forKeyedSubscript:@"buyParams"];
        [v26 setObject:0 forKeyedSubscript:off_1003995B8[0]];
        [v26 setObject:0 forKeyedSubscript:off_1003995C8[0]];
        [v26 setObject:0 forKeyedSubscript:off_1003995C0[0]];
        uint64_t v42 = -1;
        id v22 = v10;
        id v10 = v26;
      }

      id v25 = objc_msgSend(v10, "tcr_dataForKey:", off_100399570[0]);
      BOOL v44 = v18;
      if ([v25 length] && (objc_msgSend(v15, "sk_allowPaymentRequestData") & 1) == 0)
      {
        if ((objc_msgSend(v10, "tcr_BOOLForKey:", off_100399510[0]) & 1) == 0)
        {
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          id v12 = v24;
          id v13 = v45;
          if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
            sub_1002C4AF0();
          }
          long long v29 = ASDErrorWithDescription();
          ((void (**)(void, void, void *))v45)[2](v45, 0, v29);
          goto LABEL_43;
        }
        id v27 = [v10 mutableCopy];
        [v27 setObject:0 forKeyedSubscript:off_100399570[0]];

        id v10 = v27;
      }
      id v12 = v24;
      if ([(Client *)v20 canMakePayments])
      {
        int64_t v28 = +[StoreKitServiceConnection _apiVersionForClientDict:v11];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100059A2C;
        v47[3] = &unk_100359060;
        uint64_t v49 = v42;
        id v13 = v45;
        v48 = v45;
        LOBYTE(v38) = 0;
        [(StoreKitServiceConnection *)v43 _processPayment:v10 excludeReceipt:v40 privacyAcknowledgementRequired:1 forClient:v20 apiVersion:v28 paymentDelegate:v12 isProcessingInterruptedBuy:v38 reply:v47];
        long long v29 = v48;
      }
      else
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        v39 = v24;
        id v41 = v11;
        if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
          sub_1002C4A88();
        }
        id v30 = ASDLocalizedString();
        long long v31 = ASDLocalizedString();
        long long v29 = +[AMSDialogRequest requestWithTitle:v30 message:v31];

        long long v32 = [_TtC9storekitd13DialogContext alloc];
        __int16 v33 = [(Client *)v20 callerBundleID];
        v34 = [(Client *)v20 callerBundleURL];
        id v35 = [(Client *)v20 processInfo];
        v36 = [(DialogContext *)v32 initWithBundleID:v33 bundleURL:v34 processInfo:v35 dialogObserver:0];

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100059AC4;
        v46[3] = &unk_100359088;
        v46[4] = v43;
        [(DialogContext *)v36 handleDialogRequest:v29 completionHandler:v46];
        if (v42 >= 1) {
          sandbox_extension_release();
        }
        uint64_t v37 = ASDErrorWithTitleAndMessage();
        ((void (**)(void, void, void *))v45)[2](v45, 0, v37);

        id v13 = v45;
        id v12 = v39;
        id v11 = v41;
      }
LABEL_43:

      unsigned __int8 v18 = v44;
      goto LABEL_44;
    }
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
    sub_1002C4A20();
  }
  id v25 = ASDErrorWithTitleAndMessage();
  (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v25);
LABEL_44:
}

- (void)_processPayment:(id)a3 excludeReceipt:(BOOL)a4 privacyAcknowledgementRequired:(BOOL)a5 forClient:(id)a6 apiVersion:(int64_t)a7 paymentDelegate:(id)a8 isProcessingInterruptedBuy:(BOOL)a9 reply:(id)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a6;
  id v58 = a8;
  id v17 = a10;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  unsigned __int8 v18 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v69 = self;
    __int16 v70 = 2082;
    v71 = "-[StoreKitServiceConnection _processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion"
          ":paymentDelegate:isProcessingInterruptedBuy:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  if ([v16 isClip])
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
      sub_1002C4C48();
    }
    __int16 v60 = ASDErrorWithDescription();
    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v60);
  }
  else
  {
    __int16 v60 = [v15 objectForKeyedSubscript:@"buyParams"];
    objc_msgSend(v15, "tcr_stringForKey:", off_100399560[0]);
    CFStringRef v57 = (char *)objc_claimAutoreleasedReturnValue();
    id v19 = objc_msgSend(v15, "tcr_unsignedLongLongForKey:", off_100399568[0]);
    if (v19) {
      BOOL v20 = v57 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20 || v60)
    {
      int v23 = [InAppTransactionTask alloc];
      if (v60)
      {
        id v22 = [(InAppTransactionTask *)v23 initWithBuyParams:v60 client:v16 apiVersion:a7];
      }
      else
      {
        id v22 = [(InAppTransactionTask *)v23 initWithProductIdentifier:v57 quantity:v19 client:v16 apiVersion:a7];
        id v24 = objc_msgSend(v15, "tcr_dictionaryForKey:", off_1003994F0[0]);
        [(InAppTransactionTask *)v22 setAdditionalBuyParams:v24];
      }
      id v25 = objc_msgSend(v15, "tcr_stringForKey:", off_100399500[0]);
      [(InAppTransactionTask *)v22 setApplicationUsername:v25];

      id v26 = objc_msgSend(v15, "tcr_stringForKey:", off_100399530[0]);
      [(InAppTransactionTask *)v22 setDiscountIdentifier:v26];

      id v27 = objc_msgSend(v15, "tcr_stringForKey:", off_100399538[0]);
      [(InAppTransactionTask *)v22 setDiscountKeyIdentifier:v27];

      int64_t v28 = objc_msgSend(v15, "tcr_stringForKey:", off_100399540[0]);
      [(InAppTransactionTask *)v22 setDiscountNonceString:v28];

      long long v29 = objc_msgSend(v15, "tcr_stringForKey:", off_100399548[0]);
      [(InAppTransactionTask *)v22 setDiscountSignature:v29];

      id v30 = objc_msgSend(v15, "tcr_numberForKey:", off_100399550[0]);
      [(InAppTransactionTask *)v22 setDiscountTimestamp:v30];

      long long v31 = objc_msgSend(v15, "tcr_stringForKey:", off_100399580[0]);
      [(InAppTransactionTask *)v22 setPartnerIdentifier:v31];

      long long v32 = objc_msgSend(v15, "tcr_stringForKey:", off_100399588[0]);
      [(InAppTransactionTask *)v22 setPartnerTransactionIdentifier:v32];

      __int16 v33 = objc_msgSend(v15, "tcr_stringForKey:", off_100399598[0]);
      [(InAppTransactionTask *)v22 setProductKind:v33];

      [(InAppTransactionTask *)v22 setPrivacyAcknowledgementRequired:v13];
      v34 = objc_msgSend(v15, "tcr_dataForKey:", off_100399570[0]);
      [(InAppTransactionTask *)v22 setRequestData:v34];

      -[InAppTransactionTask setSimulateAskToBuy:](v22, "setSimulateAskToBuy:", objc_msgSend(v15, "tcr_BOOLForKey:", off_100399578[0]));
      -[InAppTransactionTask setStorekitViewInitiated:](v22, "setStorekitViewInitiated:", objc_msgSend(v15, "tcr_BOOLForKey:", off_1003995D8[0]));
      -[InAppTransactionTask setStoreOriginated:](v22, "setStoreOriginated:", objc_msgSend(v15, "tcr_BOOLForKey:", off_100399558[0]));
      id v35 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995D0[0]);
      [(InAppTransactionTask *)v22 setSubscriptionPeriod:v35];

      v36 = objc_msgSend(v15, "tcr_stringForKey:", off_100399590[0]);
      [(InAppTransactionTask *)v22 setPresentingSceneID:v36];

      uint64_t v37 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995E0[0]);
      [(InAppTransactionTask *)v22 setWinbackOfferIdentifier:v37];

      [(InAppTransactionTask *)v22 setExcludeReceiptFromRequest:v14];
      -[InAppTransactionTask setForceAuthentication:](v22, "setForceAuthentication:", objc_msgSend(v15, "tcr_BOOLForKey:", off_1003995B0[0]));
      -[InAppTransactionTask setHideConfirmation:](v22, "setHideConfirmation:", objc_msgSend(v15, "tcr_BOOLForKey:", off_100399518[0]));
      uint64_t v38 = objc_msgSend(v15, "tcr_stringForKey:", off_1003994F8[0]);
      [(InAppTransactionTask *)v22 setAppAccountToken:v38];

      [(InAppTransactionTask *)v22 setIsProcessingInterruptedBuy:a9];
      v39 = [_TtC9storekitd13DialogContext alloc];
      BOOL v40 = [v16 callerBundleID];
      id v41 = [v16 callerBundleURL];
      uint64_t v42 = [v16 processInfo];
      v54 = [(DialogContext *)v39 initWithBundleID:v40 bundleURL:v41 processInfo:v42 dialogObserver:0];

      [(InAppTransactionTask *)v22 setDialogContext:v54];
      [(InAppTransactionTask *)v22 setPaymentDelegate:v58];
      CFStringRef v56 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995A0[0]);
      if (v56)
      {
        v43 = +[NSURL fileURLWithPath:v56 isDirectory:1];
        BOOL v44 = [v43 URLByAppendingPathComponent:@"StoreKit"];
        v45 = [v44 URLByAppendingPathComponent:@"receipt"];
        [(InAppTransactionTask *)v22 setReceiptInstallURL:v45];
      }
      if (a7 != 1)
      {
        dispatch_queue_t v46 = objc_msgSend(v15, "tcr_dictionaryForKey:", off_100399508[0]);
        [(InAppTransactionTask *)v22 setCustomBuyParams:v46];
      }
      v47 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995B8[0]);
      BOOL v55 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995C8[0]);
      if (v47 && v55)
      {
        v48 = objc_msgSend(v15, "tcr_stringForKey:", off_1003995C0[0]);
        uint64_t v49 = [[AppleIDAuthorizationRequestInfo alloc] initWithClientID:v47 teamID:v55 serviceID:v48];
        [(InAppTransactionTask *)v22 setSiwaAuthorizationInfo:v49];
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v22);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10005A59C;
      v61[3] = &unk_1003590D8;
      objc_copyWeak(&v64, &from);
      objc_copyWeak(&v65, &location);
      id v62 = v16;
      id v63 = v17;
      [(InAppTransactionTask *)v22 setCompletionBlock:v61];
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      unsigned int v50 = (id)qword_100399680;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v51 = [(InAppTransactionTask *)v22 logKey];
        __int16 v52 = [(InAppTransactionTask *)v22 productIdentifier];
        id v53 = [(InAppTransactionTask *)v22 quantity];
        *(_DWORD *)buf = 138544130;
        v69 = self;
        __int16 v70 = 2114;
        v71 = v51;
        __int16 v72 = 2114;
        id v73 = v52;
        __int16 v74 = 2048;
        id v75 = v53;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding payment for %{public}@ and quantity %lu", buf, 0x2Au);
      }
      [(NSOperationQueue *)self->_paymentQueue addOperation:v22];

      objc_destroyWeak(&v65);
      objc_destroyWeak(&v64);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      BOOL v21 = qword_100399680;
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v69 = self;
        __int16 v70 = 2114;
        v71 = v57;
        __int16 v72 = 2048;
        id v73 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@: Could not process payment for product %{public}@ and quantity %lu", buf, 0x20u);
      }
      ASDErrorWithDescription();
      id v22 = (InAppTransactionTask *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, InAppTransactionTask *))v17 + 2))(v17, 0, 0, v22);
    }
  }
}

- (void)finishPaymentWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = self;
    __int16 v23 = 2082;
    id v24 = "-[StoreKitServiceConnection finishPaymentWithIdentifier:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  __int16 v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  id v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    if ([(Client *)v11 isClip])
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
        sub_1002C4C48();
      }
      id v12 = ASDErrorWithDescription();
      v7[2](v7, v12);
    }
    else if ([v6 length])
    {
      BOOL v14 = +[InAppDownloadManager manager];
      [v14 removeDownloadsForTransactionID:v6];

      id v15 = [[FinishInAppTransactionTask alloc] initWithTransactionID:v6 client:v11];
      objc_initWeak((id *)buf, v15);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10005AC64;
      v17[3] = &unk_100358FC0;
      objc_copyWeak(&v20, (id *)buf);
      unsigned __int8 v18 = v11;
      id v19 = v7;
      [(FinishInAppTransactionTask *)v15 setCompletionBlock:v17];
      [(NSOperationQueue *)self->_finishPaymentQueue addOperation:v15];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      id v16 = qword_100399680;
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: No transaction identifier to finish payment", buf, 0xCu);
      }
      v7[2](v7, 0);
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
      sub_1002C4CB0();
    }
    BOOL v13 = ASDErrorWithTitleAndMessage();
    v7[2](v7, v13);
  }
}

- (void)notifyOfRevokedProductIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2082;
    unsigned __int8 v18 = "-[StoreKitServiceConnection notifyOfRevokedProductIdentifiers:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005B040;
  v11[3] = &unk_100359100;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(StoreKitServiceConnection *)self renewReceiptWithOptions:0 client:0 replyBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)restoreCompletedTransactionsForUsername:(id)a3 client:(id)a4 reply:(id)a5
{
  id v25 = a3;
  id v27 = a4;
  id v8 = (void (**)(id, void, id))a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v9 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    __int16 v37 = 2082;
    uint64_t v38 = "-[StoreKitServiceConnection restoreCompletedTransactionsForUsername:client:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = objc_msgSend(v10, "sk_allowClientOverride");
  id v12 = v27;
  if (!v11) {
    id v12 = 0;
  }
  id v13 = v12;
  id v14 = [[_TtC9storekitd6Client alloc] initWithConnection:v10 overridesDictionary:v13];
  id v15 = v14;
  if (v14)
  {
    if ([(Client *)v14 isClip])
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
        sub_1002C4DE8();
      }
      ASDErrorWithDescription();
      id v16 = (_TtC9storekitd13DialogContext *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v16);
    }
    else
    {
      __int16 v17 = [_TtC9storekitd13DialogContext alloc];
      unsigned __int8 v18 = [(Client *)v15 callerBundleID];
      id v19 = [(Client *)v15 callerBundleURL];
      id v20 = [(Client *)v15 processInfo];
      id v16 = [(DialogContext *)v17 initWithBundleID:v18 bundleURL:v19 processInfo:v20 dialogObserver:0];

      if ([(Client *)v15 canMakePayments])
      {
        BOOL v21 = [[RestoreInAppTransactionsTask alloc] initWithClient:v15];
        [(RestoreInAppTransactionsTask *)v21 setApplicationUsername:v26];
        [(RestoreInAppTransactionsTask *)v21 setDialogContext:v16];
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v21);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10005B7A0;
        v28[3] = &unk_1003590D8;
        objc_copyWeak(&v31, &location);
        objc_copyWeak(&v32, (id *)buf);
        long long v29 = v15;
        id v30 = v8;
        [(RestoreInAppTransactionsTask *)v21 setCompletionBlock:v28];
        [(NSOperationQueue *)self->_paymentQueue addOperation:v21];

        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
          sub_1002C4E50();
        }
        id v22 = ASDLocalizedString();
        __int16 v23 = ASDLocalizedString();
        BOOL v21 = +[AMSDialogRequest requestWithTitle:v22 message:v23];

        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10005B704;
        v34[3] = &unk_100359088;
        v34[4] = self;
        [(DialogContext *)v16 handleDialogRequest:v21 completionHandler:v34];
        id v24 = ASDErrorWithDescription();
        v8[2](v8, 0, v24);
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399680, OS_LOG_TYPE_ERROR)) {
      sub_1002C4D80();
    }
    ASDErrorWithTitleAndMessage();
    id v16 = (_TtC9storekitd13DialogContext *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v16);
  }
}

- (void)statusForSubscriptionGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v18 = self;
    __int16 v19 = 2082;
    id v20 = "-[StoreKitServiceConnection statusForSubscriptionGroupID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    id v12 = +[OctaneManager simulatedStoreKitErrorFor:4 client:v11];
    if (!v12)
    {
      id v14 = +[ReceiptManager managerForClient:v11];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10005BCE8;
      v15[3] = &unk_100359128;
      id v16 = v7;
      [v14 subscriptionStatusForSubscriptionGroupID:v6 completionHandler:v15];

      goto LABEL_18;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    id v13 = qword_100399668;
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v18 = self;
      __int16 v19 = 2114;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Found simulated failure: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C4EB8();
    }
    ASDErrorWithTitleAndMessage();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, void, char *))v7 + 2))(v7, 0, v12);
LABEL_18:
}

- (void)enumerateSubscriptionStatusesWithReceiver:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v19 = self;
    __int16 v20 = 2082;
    BOOL v21 = "-[StoreKitServiceConnection enumerateSubscriptionStatusesWithReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    id v12 = +[ReceiptManager managerForClient:v11];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005BFB4;
    v16[3] = &unk_100359150;
    id v17 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005C050;
    v13[3] = &unk_100357B28;
    id v14 = v17;
    id v15 = v7;
    [v12 enumerateSubscriptionStatusUsingBlock:v16 completionHandler:v13];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C4EB8();
    }
    id v12 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)addDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "-[StoreKitServiceConnection addDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = [[_TtC9storekitd6Client alloc] initWithConnection:v6 overridesDictionary:0];
  if (v7)
  {
    if (v4)
    {
      memset(buf, 0, 32);
      if (v6) {
        [v6 auditToken];
      }
      id v8 = +[InAppDownloadManager manager];
      v12[0] = *(_OWORD *)buf;
      v12[1] = *(_OWORD *)&buf[16];
      unsigned int v9 = [v8 startDownloadWithID:v4 client:v7 auditToken:v12];

      if (v9)
      {
        remoteObject = self->_remoteObject;
        CFStringRef v13 = @"download";
        id v14 = v4;
        unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        [(SKClientProtocol *)remoteObject downloadAdded:v11];
      }
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
        sub_1002C4F88();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
      sub_1002C4F20();
    }
  }
}

- (void)cancelDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    id v10 = "-[StoreKitServiceConnection cancelDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v7, 0x16u);
  }
  if (v4)
  {
    id v6 = +[InAppDownloadManager manager];
    [v6 cancelDownloadWithID:v4];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
      sub_1002C4FBC();
    }
  }
}

- (void)pauseDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    id v10 = "-[StoreKitServiceConnection pauseDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v7, 0x16u);
  }
  if (v4)
  {
    id v6 = +[InAppDownloadManager manager];
    [v6 pauseDownloadWithID:v4];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
      sub_1002C5024();
    }
  }
}

- (void)resumeDownloadWithID:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "-[StoreKitServiceConnection resumeDownloadWithID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v6 = +[NSXPCConnection currentConnection];
  int v7 = [[_TtC9storekitd6Client alloc] initWithConnection:v6 overridesDictionary:0];
  if (v7)
  {
    if (v4)
    {
      memset(buf, 0, 32);
      if (v6) {
        [v6 auditToken];
      }
      id v8 = +[InAppDownloadManager manager];
      v9[0] = *(_OWORD *)buf;
      v9[1] = *(_OWORD *)&buf[16];
      [v8 startDownloadWithID:v4 client:v7 auditToken:v9];
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
        sub_1002C50F4();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)off_100399660, OS_LOG_TYPE_ERROR)) {
      sub_1002C508C();
    }
  }
}

- (void)deleteContentForProductID:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2082;
    __int16 v9 = "-[StoreKitServiceConnection deleteContentForProductID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v6, 0x16u);
  }
}

- (void)renewReceiptWithOptions:(id)a3 client:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v45 = a4;
  id v44 = a5;
  __int16 v9 = +[NSUUID lib_shortLogKeyWithAPIVersion:1];
  id v10 = &off_10039F000;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  unsigned int v11 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v50 = v9;
    __int16 v51 = 2082;
    __int16 v52 = "-[StoreKitServiceConnection renewReceiptWithOptions:client:replyBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v12 = +[NSXPCConnection currentConnection];
  CFStringRef v13 = [(StoreKitServiceConnection *)self client];
  if (objc_msgSend(v13, "objc_clientType") == 3)
  {
    unsigned int v14 = objc_msgSend(v12, "sk_connectionIsOctaneService");

    if (v14)
    {
      id v15 = [(StoreKitServiceConnection *)self client];
      goto LABEL_12;
    }
  }
  else
  {
  }
  unsigned int v16 = objc_msgSend(v12, "sk_allowClientOverride");
  id v17 = v45;
  if (!v16) {
    id v17 = 0;
  }
  id v18 = v17;
  id v15 = [[_TtC9storekitd6Client alloc] initWithConnection:v12 overridesDictionary:v18];

LABEL_12:
  if (objc_msgSend(v12, "sk_allowClientOverride"))
  {
    __int16 v19 = [v45 objectForKeyedSubscript:@"tok"];
    __int16 v20 = [v45 objectForKeyedSubscript:@"recp"];
    if (v20 && [v19 length])
    {
      uint64_t v43 = (uint64_t)v9;
      BOOL v21 = v8;
      id v22 = +[NSURL fileURLWithPath:v20 isDirectory:1];
      __int16 v23 = [v22 URLByAppendingPathComponent:@"StoreKit"];
      uint64_t v42 = [v23 URLByAppendingPathComponent:@"receipt"];

      [v19 UTF8String];
      uint64_t v24 = sandbox_extension_consume();
      if (v24 < 0)
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        id v25 = (void *)qword_100399690;
        if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
          sub_1002C4B58(v43, v25);
        }
      }
      id v26 = objc_opt_new();
      id v27 = v26;
      if (v21) {
        [v26 addEntriesFromDictionary:v21];
      }
      int64_t v28 = (void *)v42;
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, @"customURL", v42);
      id v29 = [v27 copy];

      id v8 = v29;
      __int16 v9 = (void *)v43;
      id v10 = &off_10039F000;
    }
    else
    {
      uint64_t v24 = -1;
    }

    if (!v15) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v24 = -1;
    if (!v15)
    {
LABEL_33:
      if (v10[397] != (ValueWitnessTable *)-1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
        sub_1002C515C();
      }
      uint64_t v30 = ASDErrorWithTitleAndMessage();
      goto LABEL_38;
    }
  }
  if (![(Client *)v15 isClip])
  {
    id v31 = [_TtC9storekitd13DialogContext alloc];
    id v32 = [(Client *)v15 callerBundleID];
    [(Client *)v15 callerBundleURL];
    v34 = id v33 = v8;
    [(Client *)v15 processInfo];
    id v35 = v15;
    v36 = v12;
    v38 = __int16 v37 = v9;
    v39 = [(DialogContext *)v31 initWithBundleID:v32 bundleURL:v34 processInfo:v38 dialogObserver:0];

    __int16 v9 = v37;
    id v12 = v36;
    id v15 = v35;

    id v8 = v33;
    BOOL v40 = +[ReceiptManager managerForClient:v35];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10005CE90;
    v46[3] = &unk_100359178;
    id v47 = v44;
    uint64_t v48 = v24;
    [v40 requestUnifiedAppReceiptWithDialogContext:v39 logKey:v9 options:v33 completionHandler:v46];

    goto LABEL_40;
  }
  if (v10[397] != (ValueWitnessTable *)-1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
    sub_1002C51C4();
  }
  uint64_t v30 = ASDErrorWithDescription();
LABEL_38:
  id v41 = (void *)v30;
  (*((void (**)(id, void, uint64_t))v44 + 2))(v44, 0, v30);

  if (v24 >= 1) {
    sandbox_extension_release();
  }
LABEL_40:
}

- (void)handleInvalidReceipt:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2082;
    id v17 = "-[StoreKitServiceConnection handleInvalidReceipt:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v6 = +[NSXPCConnection currentConnection];
  int v7 = [[_TtC9storekitd6Client alloc] initWithConnection:v6 overridesDictionary:0];
  if (v7)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    id v8 = (void *)qword_100399690;
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = v8;
      id v10 = [(Client *)v7 callerBundleID];
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: handleInvalidReceipt for %{public}@", buf, 0x16u);
    }
    unsigned int v11 = -[HandleInvalidReceiptTask initWithClient:pid:]([HandleInvalidReceiptTask alloc], "initWithClient:pid:", v7, [v6 processIdentifier]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _OWORD v12[2] = sub_10005D1E0;
    v12[3] = &unk_100357220;
    CFStringRef v13 = v4;
    [(HandleInvalidReceiptTask *)v11 setCompletionBlock:v12];
    [(NSOperationQueue *)self->_appTerminationQueue addOperation:v11];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399678, OS_LOG_TYPE_ERROR)) {
      sub_1002C522C();
    }
    v4[2](v4);
  }
}

- (void)xcodeTestServerPortWithReplyBlock:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2082;
    id v10 = "-[StoreKitServiceConnection xcodeTestServerPortWithReplyBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v7, 0x16u);
  }
  int v6 = +[OctaneManager sharedInstance];
  v4[2](v4, [v6 activePort]);
}

- (void)refundRequestForTransactionId:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = self;
    __int16 v44 = 2082;
    id v45 = "-[StoreKitServiceConnection refundRequestForTransactionId:replyBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  __int16 v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (!v11)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5294();
    }
    ASDErrorWithTitleAndMessage();
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v12 = +[OctaneManager simulatedStoreKitErrorFor:7 client:v11];
  if (!v12)
  {
    unsigned int v14 = [(Client *)v11 bag];
    id v15 = +[BagKey refundRequestURL];
    __int16 v16 = [v14 URLForKey:v15];
    id v40 = 0;
    id v17 = [v16 valueWithError:&v40];
    id v18 = v40;

    if (!v17)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C52FC();
      }
      __int16 v19 = [v18 toASDErrorWithMetadata:0];
      v7[2](v7, v19, 0);
      goto LABEL_47;
    }
    __int16 v19 = [(Client *)v11 account];
    __int16 v20 = objc_msgSend(v19, "ams_DSID");
    if (v20)
    {
    }
    else if ([(Client *)v11 objc_clientType] != 3)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C53CC();
      }
      BOOL v21 = ASDErrorWithTitleAndMessage();
      v7[2](v7, v21, 0);
      goto LABEL_46;
    }
    id v35 = v18;
    v36 = v17;
    BOOL v21 = +[NSURLComponents componentsWithURL:v17 resolvingAgainstBaseURL:1];
    id v38 = v6;
    id v22 = +[NSString stringWithFormat:@"%@", v6];
    __int16 v23 = +[NSURLQueryItem queryItemWithName:@"transactionId" value:v22];
    id v41 = v23;
    uint64_t v24 = +[NSArray arrayWithObjects:&v41 count:1];
    id v25 = +[NSMutableArray arrayWithArray:v24];

    if ([(Client *)v11 objc_clientType] == 2)
    {
      if ([(Client *)v11 isBeta]) {
        CFStringRef v26 = @"testflight";
      }
      else {
        CFStringRef v26 = @"sandbox";
      }
      id v27 = +[NSURLQueryItem queryItemWithName:@"env" value:v26];
      [v25 addObject:v27];
    }
    int64_t v28 = +[NSArray arrayWithArray:v25];
    [v21 setQueryItems:v28];

    id v29 = [v21 URL];

    __int16 v37 = v25;
    if (v29)
    {
      id v30 = objc_alloc_init((Class)AMSEngagementRequest);
      id v31 = [v21 URL];
      [v30 setURL:v31];

      [v30 setAccount:v19];
      id v39 = 0;
      id v32 = +[NSKeyedArchiver archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&v39];
      id v33 = v39;
      if (v32)
      {
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v32);
      }
      else
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
          sub_1002C5364();
        }
        v34 = [v33 toASDErrorWithMetadata:0];
        v7[2](v7, v34, 0);
      }
      id v17 = v36;

      id v18 = v35;
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      id v18 = v35;
      id v17 = v36;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C52FC();
      }
      id v30 = [v35 toASDErrorWithMetadata:0];
      v7[2](v7, v30, 0);
    }

    id v6 = v38;
LABEL_46:

LABEL_47:
    goto LABEL_48;
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  CFStringRef v13 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = self;
    __int16 v44 = 2114;
    id v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Found simulated failure: %{public}@", buf, 0x16u);
  }
LABEL_16:
  v7[2](v7, v12, 0);
LABEL_48:
}

- (void)displayMessageWithType:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2082;
    id v12 = "-[StoreKitServiceConnection displayMessageWithType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v9, 0x16u);
  }
  id v6 = +[NSXPCConnection currentConnection];
  int v7 = [[_TtC9storekitd6Client alloc] initWithConnection:v6 overridesDictionary:0];
  id v8 = +[StoreKitMessagesManager sharedManager];
  [v8 displayMessageWithType:v4 forClient:v7 connection:v6];
  objc_msgSend(v8, "recordMessageDisplayEventWithType:messageType:client:", 2, objc_msgSend(v4, "integerValue"), v7);
}

- (void)xcodeTestCertificatesWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v19 = self;
    __int16 v20 = 2082;
    BOOL v21 = "-[StoreKitServiceConnection xcodeTestCertificatesWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  int v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  if ([(Client *)v8 objc_clientType] == 3)
  {
    int v9 = +[OctaneManager sharedInstance];
    id v10 = [(Client *)v8 requestBundleID];
    __int16 v11 = +[OctaneActionContext contextWithBundleID:v10];

    id v12 = [v9 getStringValueForIdentifier:8 withContext:v11];
    CFStringRef v13 = v12;
    if (v12 && [v12 length])
    {
      id v14 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
      id v15 = v14;
      if (v14)
      {
        id v17 = v14;
        __int16 v16 = +[NSArray arrayWithObjects:&v17 count:1];
      }
      else
      {
        __int16 v16 = &__NSArray0__struct;
      }
    }
    else
    {
      __int16 v16 = &__NSArray0__struct;
    }
    v4[2](v4, v16, 0);
  }
  else
  {
    int v9 = ASDErrorWithDescription();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
  }
}

- (void)xcodeTestCertificatesShouldSimulateRevocationWithReply:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    CFStringRef v13 = self;
    __int16 v14 = 2082;
    id v15 = "-[StoreKitServiceConnection xcodeTestCertificatesShouldSimulateRevocationWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  int v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  if ([(Client *)v8 objc_clientType] != 3) {
    v4[2](v4, 0);
  }
  int v9 = +[OctaneManager sharedInstance];
  id v10 = [(Client *)v8 requestBundleID];
  id v11 = [v9 storeKitErrorForCategory:2 bundleID:v10];

  ((void (**)(id, BOOL))v4)[2](v4, v11 == (id)17);
}

- (void)requestProductReviewWithInterfaceOrientation:(unint64_t)a3 bundleIdentifier:(id)a4 sceneID:(id)a5 replyBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  int v12 = (void (**)(id, void))a6;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  CFStringRef v13 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int64_t v28 = self;
    __int16 v29 = 2082;
    id v30 = "-[StoreKitServiceConnection requestProductReviewWithInterfaceOrientation:bundleIdentifier:sceneID:replyBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  __int16 v14 = +[NSXPCConnection currentConnection];
  id v15 = [[_TtC9storekitd6Client alloc] initWithConnection:v14 overridesDictionary:0];
  int v16 = _os_feature_enabled_impl();
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v17 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_INFO))
  {
    id v18 = "old direct-injection";
    if (v16) {
      id v18 = "new SpringBoard";
    }
    *(_DWORD *)buf = 136446210;
    int64_t v28 = (StoreKitServiceConnection *)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Using %{public}s request-review flow", buf, 0xCu);
  }
  if (v16)
  {
    __int16 v19 = [[RemoteAlertWrapper alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServiceReviewRemoteAlertViewController"];
    [(StoreKitServiceConnection *)self setRemoteAlertWrapper:v19];

    BOOL v20 = [(Client *)v15 objc_clientType] != 1;
    BOOL v21 = [(StoreKitServiceConnection *)self remoteAlertWrapper];
    id v22 = +[NSNumber numberWithUnsignedInteger:a3, @"orientation"];
    v26[0] = v22;
    v26[1] = v10;
    v25[1] = @"bundleIdentifier";
    v25[2] = @"sandboxed";
    __int16 v23 = +[NSNumber numberWithBool:v20];
    v26[2] = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    [v21 activateForTargetXPCConnection:v14 sceneID:v11 shouldDismissOnUILock:1 userInfo:v24];
  }
  v12[2](v12, v16 ^ 1u);
}

- (void)lookUpItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *, void *))a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v51 = self;
    __int16 v52 = 2082;
    id v53 = "-[StoreKitServiceConnection lookUpItemIDsForDeletableSystemAppsWithBundleIDs:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v9 = +[Bag defaultBag];
  id v10 = +[BagKey hideableSystemApps];
  id v11 = [v9 arrayForKey:v10];
  id v47 = 0;
  int v12 = [v11 valueWithError:&v47];
  id v13 = v47;

  if (v12)
  {
    id v35 = v13;
    __int16 v37 = v7;
    id v38 = v6;
    __int16 v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v36 = v12;
    id v15 = objc_msgSend(v12, "tcr_dictionaryEnumerator");
    id v16 = [v15 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          BOOL v21 = objc_msgSend(v20, "tcr_stringForKey:", @"bundle-id");
          id v22 = objc_msgSend(v20, "tcr_stringForKey:", @"id");
          __int16 v23 = v22;
          if (v21) {
            BOOL v24 = v22 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (!v24)
          {
            id v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "tcr_unsignedLongLong"));
            [v14 setObject:v25 forKeyedSubscript:v21];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v17);
    }

    id v6 = v38;
    CFStringRef v26 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v38 count]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v27 = v38;
    id v28 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
    id v13 = v35;
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
          id v33 = [v14 objectForKeyedSubscript:v32];
          [v26 setObject:v33 forKeyedSubscript:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v29);
    }

    int v7 = v37;
    v37[2](v37, v26, 0);

    int v12 = v36;
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    v34 = (void *)qword_100399668;
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5400(v34, (uint64_t)self, (uint64_t)v13);
    }
    __int16 v14 = [v13 toASDErrorWithMetadata:0];
    v7[2](v7, &__NSDictionary0__struct, v14);
  }
}

- (void)canMakePaymentsWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2082;
    int v12 = "-[StoreKitServiceConnection canMakePaymentsWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  int v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  v4[2](v4, (id)[(Client *)v8 canMakePayments], 0);
}

- (void)promotionInfoForProductIdentifiers:(id)a3 client:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v11 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2082;
    id v25 = "-[StoreKitServiceConnection promotionInfoForProductIdentifiers:client:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v12 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v12, "sk_allowClientOverride")) {
    id v13 = v9;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [[_TtC9storekitd6Client alloc] initWithConnection:v12 overridesDictionary:v14];

  if (v15)
  {
    productPromotionsQueue = self->_productPromotionsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005EB1C;
    block[3] = &unk_100357CB8;
    id v19 = v8;
    BOOL v20 = v15;
    id v21 = v10;
    dispatch_async(productPromotionsQueue, block);

    id v17 = v19;
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C54C0();
    }
    id v17 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

- (void)setPromotionInfo:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v11 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2082;
    id v25 = "-[StoreKitServiceConnection setPromotionInfo:forClient:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v12 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v12, "sk_allowClientOverride")) {
    id v13 = v9;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = [[_TtC9storekitd6Client alloc] initWithConnection:v12 overridesDictionary:v14];

  if (v15)
  {
    productPromotionsQueue = self->_productPromotionsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005EE70;
    block[3] = &unk_100357CB8;
    id v19 = v8;
    BOOL v20 = v15;
    id v21 = v10;
    dispatch_async(productPromotionsQueue, block);

    id v17 = v19;
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5528();
    }
    id v17 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

- (void)appTransactionForClient:(id)a3 ignoreCache:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v10 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2082;
    id v29 = "-[StoreKitServiceConnection appTransactionForClient:ignoreCache:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  __int16 v11 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v11, "sk_allowClientOverride")) {
    int v12 = v8;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;
  id v14 = [[_TtC9storekitd6Client alloc] initWithConnection:v11 overridesDictionary:v13];

  if (!v14)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5590();
    }
    uint64_t v15 = ASDErrorWithTitleAndMessage();
    goto LABEL_20;
  }
  if ([(Client *)v14 isClip])
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C55F8();
    }
    uint64_t v15 = ASDErrorWithDescription();
LABEL_20:
    id v16 = (char *)v15;
    goto LABEL_21;
  }
  id v16 = +[OctaneManager simulatedStoreKitErrorFor:5 client:v14];
  if (!v16)
  {
    uint64_t v18 = [_TtC9storekitd13DialogContext alloc];
    id v19 = [(Client *)v14 callerBundleID];
    BOOL v20 = [(Client *)v14 callerBundleURL];
    id v21 = [(Client *)v14 processInfo];
    id v22 = [(DialogContext *)v18 initWithBundleID:v19 bundleURL:v20 processInfo:v21 dialogObserver:0];

    __int16 v23 = +[ReceiptManager managerForClient:v14];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10005F330;
    v24[3] = &unk_1003591A0;
    id v25 = v9;
    [v23 appTransactionWithDialogContext:v22 ignoreCache:v6 completionHandler:v24];

    goto LABEL_22;
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v17 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Found simulated failure: %{public}@", buf, 0x16u);
  }
LABEL_21:
  (*((void (**)(id, void, char *))v9 + 2))(v9, 0, v16);
LABEL_22:
}

- (void)authenticateAndSyncTransactionsAndStatusWithReply:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2082;
    __int16 v23 = "-[StoreKitServiceConnection authenticateAndSyncTransactionsAndStatusWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  BOOL v6 = [_TtC9storekitd6Client alloc];
  int v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  if (v8)
  {
    id v9 = +[OctaneManager simulatedStoreKitErrorFor:3 client:v8];
    if (!v9)
    {
      __int16 v11 = [_TtC9storekitd13DialogContext alloc];
      int v12 = [(Client *)v8 callerBundleID];
      id v13 = [(Client *)v8 callerBundleURL];
      id v14 = [(Client *)v8 processInfo];
      uint64_t v15 = [(DialogContext *)v11 initWithBundleID:v12 bundleURL:v13 processInfo:v14 dialogObserver:0];

      id v16 = +[ReceiptManager managerForClient:v8];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10005F718;
      v17[3] = &unk_100357B28;
      uint64_t v18 = v8;
      id v19 = v4;
      [v16 authenticateAndSyncWithDialogContext:v15 completionHandler:v17];

      goto LABEL_18;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    id v10 = qword_100399668;
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Found simulated failure: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5660();
    }
    ASDErrorWithTitleAndMessage();
    id v9 = (char *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, char *))v4 + 2))(v4, v9);
LABEL_18:
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v11 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2082;
    id v25 = "-[StoreKitServiceConnection enumerateCurrentReceiptsForProductID:withReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v12 = [_TtC9storekitd6Client alloc];
  id v13 = +[NSXPCConnection currentConnection];
  id v14 = [(Client *)v12 initWithConnection:v13 overridesDictionary:0];

  if (v14)
  {
    uint64_t v15 = +[ReceiptManager managerForClient:v14];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005FB3C;
    v20[3] = &unk_1003591F0;
    id v21 = v9;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005FBD8;
    v16[3] = &unk_100359240;
    id v17 = v21;
    uint64_t v18 = v14;
    id v19 = v10;
    [v15 enumerateCurrentReceiptsForProductID:v8 usingBlock:v20 completionHandler:v16];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C56C8();
    }
    uint64_t v15 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)enumerateReceiptsForProductID:(id)a3 withReceiver:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v11 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2082;
    id v25 = "-[StoreKitServiceConnection enumerateReceiptsForProductID:withReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  int v12 = [_TtC9storekitd6Client alloc];
  id v13 = +[NSXPCConnection currentConnection];
  id v14 = [(Client *)v12 initWithConnection:v13 overridesDictionary:0];

  if (v14)
  {
    uint64_t v15 = +[ReceiptManager managerForClient:v14];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100060058;
    v20[3] = &unk_1003591F0;
    id v21 = v9;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000600F4;
    v16[3] = &unk_100359240;
    id v17 = v21;
    uint64_t v18 = v14;
    id v19 = v10;
    [v15 enumerateReceiptsForProductID:v8 usingBlock:v20 completionHandler:v16];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5730();
    }
    uint64_t v15 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)enumerateUnfinishedTransactionsWithReceiver:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    BOOL v20 = self;
    __int16 v21 = 2082;
    __int16 v22 = "-[StoreKitServiceConnection enumerateUnfinishedTransactionsWithReceiver:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  __int16 v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    int v12 = +[ReceiptManager managerForClient:v11];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100060558;
    v17[3] = &unk_1003591F0;
    id v18 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000605F4;
    v13[3] = &unk_100359240;
    id v14 = v18;
    uint64_t v15 = v11;
    id v16 = v7;
    [v12 enumerateUnfinishedTransactionsUsingBlock:v17 completionHandler:v13];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5798();
    }
    int v12 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)isEligibleForIntroductoryOfferForGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2082;
    BOOL v20 = "-[StoreKitServiceConnection isEligibleForIntroductoryOfferForGroupID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [_TtC9storekitd6Client alloc];
  id v10 = +[NSXPCConnection currentConnection];
  __int16 v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000609FC;
    v13[3] = &unk_100357A10;
    id v14 = v11;
    id v15 = v6;
    id v16 = v7;
    +[objc_StoreFrontManager storefrontIdentifierForClient:v14 completionHandler:v13];

    int v12 = v14;
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5800((uint64_t)self);
    }
    int v12 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)invalidateTransactionsAndStatusCacheWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    __int16 v11 = self;
    __int16 v12 = 2082;
    id v13 = "-[StoreKitServiceConnection invalidateTransactionsAndStatusCacheWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v10, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  if (v8)
  {
    id v9 = +[ReceiptManager managerForClient:v8];
    [v9 clearTransactions];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399690, OS_LOG_TYPE_ERROR)) {
      sub_1002C5870();
    }
  }
  v4[2](v4);
}

- (void)isXcodeTestAppWithReply:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    int v10 = self;
    __int16 v11 = 2082;
    __int16 v12 = "-[StoreKitServiceConnection isXcodeTestAppWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  v4[2](v4, [(Client *)v8 objc_clientType] == 3);
}

- (void)presentCodeRedemptionSheet
{
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  objc_super v3 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2082;
    id v27 = "-[StoreKitServiceConnection presentCodeRedemptionSheet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v4 = [_TtC9storekitd6Client alloc];
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(Client *)v4 initWithConnection:v5 overridesDictionary:0];

  if (v6)
  {
    if ([(Client *)v6 isClip])
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C5AAC();
      }
    }
    else
    {
      id v7 = [(Client *)v6 account];
      if (v7 || [(Client *)v6 objc_clientType] == 3)
      {
        id v8 = [(StoreKitServiceConnection *)self _offerCodeRedemptionURLForClient:v6];
        int v9 = +[ReceiptManager managerForClient:v6];
        if (v8)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StoreKit: Opening redemption URL: %@", buf, 0xCu);
          }
          int v10 = [(StoreKitServiceConnection *)v8 scheme];
          unsigned int v11 = [v10 isEqualToString:@"itms-ui"];

          if (v11)
          {
            __int16 v12 = +[LSApplicationWorkspace defaultWorkspace];
            [v12 openSensitiveURL:v8 withOptions:&__NSDictionary0__struct];
          }
          else
          {
            id v13 = objc_alloc_init((Class)AMSEngagementRequest);
            [v13 setURL:v8];
            [v13 setAccount:v7];
            id v14 = [objc_alloc((Class)AMSSystemEngagementTask) initWithRequest:v13];
            id v15 = [(Client *)v6 bag];
            [v14 setBag:v15];

            id v16 = [(Client *)v6 processInfo];
            [v14 setClientInfo:v16];

            id v17 = [v14 present];
            id v18 = _NSConcreteStackBlock;
            uint64_t v19 = 3221225472;
            BOOL v20 = sub_100061330;
            __int16 v21 = &unk_1003592B8;
            __int16 v22 = self;
            id v23 = v9;
            [v17 addFinishBlock:&v18];
          }
        }
        else
        {
          if (qword_10039FC68 != -1) {
            dispatch_once(&qword_10039FC68, &stru_100359368);
          }
          if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
            sub_1002C5B14();
          }
        }
        objc_msgSend(v9, "invalidateLegacyTransactionCache", v18, v19, v20, v21, v22);
      }
      else
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
          sub_1002C5B7C();
        }
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5A44();
    }
  }
}

- (void)registerArcadeAppWithRandomFromLib:(id)a3 randomFromLibLength:(unsigned int)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  int v10 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2082;
    id v27 = "-[StoreKitServiceConnection registerArcadeAppWithRandomFromLib:randomFromLibLength:resultHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  unsigned int v11 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v11, "sk_allowArcade"))
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    __int16 v12 = qword_100399668;
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = @"c4052938-7e9a-4cbd-a934-3b2c4b8a0937";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    id v13 = [[_TtC9storekitd6Client alloc] initWithConnection:v11 overridesDictionary:0];
    unsigned int v14 = [v11 processIdentifier];
    id v15 = objc_opt_new();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006187C;
    v17[3] = &unk_1003592E0;
    void v17[4] = self;
    id v18 = v13;
    id v21 = v9;
    unsigned int v22 = a4;
    unsigned int v23 = v14;
    id v19 = v8;
    BOOL v20 = @"c4052938-7e9a-4cbd-a934-3b2c4b8a0937";
    id v16 = v13;
    [v15 subscriptionStateWithCompletionBlock:v17];
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5BE4();
    }
    id v15 = ASDErrorWithDescription();
    (*((void (**)(id, void, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, 0, v15);
  }
}

- (void)arcadeSubscriptionStatusWithNonce:(unint64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v7 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2082;
    id v27 = "-[StoreKitServiceConnection arcadeSubscriptionStatusWithNonce:resultHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  if ((objc_msgSend(v8, "sk_allowArcade") & 1) == 0)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5BE4();
    }
    ASDErrorWithDescription();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v9 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = @"34708d07-5a16-4532-9c48-5dbb144b8f28";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
  }
  int v10 = +[AMSKeybag sharedInstance];
  id v23 = 0;
  id v11 = [v10 fairplayContextWithError:&v23];
  id v12 = v23;

  if (v12)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5D98((uint64_t)self);
    }
LABEL_20:
    (*((void (**)(id, void, void, void, void, id))v6 + 2))(v6, 0, 0, 0, 0, v12);
    goto LABEL_21;
  }
  uint64_t v22 = 0;
  unsigned int v21 = 0;
  uint64_t v20 = 0;
  unsigned int v19 = 0;
  sub_1001F9F54((uint64_t)v11, a3, (uint64_t)[v8 processIdentifier], (uint64_t)&v22, (uint64_t)&v21, (uint64_t)&v20, (uint64_t)&v19);
  int v14 = v13;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v15 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = @"34708d07-5a16-4532-9c48-5dbb144b8f28";
    __int16 v28 = 2048;
    uint64_t v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Status %ld", buf, 0x20u);
  }
  id v16 = 0;
  if (v22 && v21)
  {
    id v16 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
  }
  id v17 = 0;
  uint64_t v18 = v19;
  if (v20 && v19)
  {
    id v17 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
    uint64_t v18 = v19;
  }
  (*((void (**)(id, void *, void, void *, uint64_t, void))v6 + 2))(v6, v16, v21, v17, v18, 0);

LABEL_21:
}

- (void)repairArcadeApp
{
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  objc_super v3 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2082;
    int v14 = "-[StoreKitServiceConnection repairArcadeApp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v11, 0x16u);
  }
  id v4 = +[NSXPCConnection currentConnection];
  if (objc_msgSend(v4, "sk_allowArcade"))
  {
    id v5 = [[_TtC9storekitd6Client alloc] initWithConnection:v4 overridesDictionary:0];
    if (v5)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      id v6 = qword_100399668;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: dc0d07d6-d699-41a8-aa7a-6784f6c89969", (uint8_t *)&v11, 0xCu);
      }
      id v7 = objc_alloc((Class)ASDRepairOptions);
      id v8 = [(Client *)v5 callerBundleID];
      id v9 = [v7 initWithBundleID:v8];

      [v9 setExitReason:16];
      int v10 = +[ASDRepairService defaultService];
      [v10 repairAppWithOptions:v9 replyHandler:&stru_100359320];
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C5E08();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5BE4();
    }
  }
}

- (void)registerForInstallAttribution
{
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  objc_super v3 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v11 = self;
    __int16 v12 = 2082;
    __int16 v13 = "-[StoreKitServiceConnection registerForInstallAttribution]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v4 = [_TtC9storekitd6Client alloc];
  id v5 = +[NSXPCConnection currentConnection];
  id v6 = [(Client *)v4 initWithConnection:v5 overridesDictionary:0];

  if (v6)
  {
    if ([(Client *)v6 storeItemID])
    {
      if ([(Client *)v6 isClip])
      {
        if (qword_10039FC68 != -1) {
          dispatch_once(&qword_10039FC68, &stru_100359368);
        }
        if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
          sub_1002C5F40();
        }
      }
      else
      {
        id v7 = +[ASDInstallAttribution sharedInstance];
        id v8 = +[NSNumber numberWithUnsignedLongLong:[(Client *)v6 storeItemID]];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        _OWORD v9[2] = sub_10006254C;
        v9[3] = &unk_100358660;
        v9[4] = self;
        [v7 registerInstallAttributionPingbackForApp:v8 completionHandler:v9];
      }
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C5ED8();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C5E70();
    }
  }
}

- (void)updateConversionValue:(id)a3
{
  id v4 = a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2082;
    id v9 = "-[StoreKitServiceConnection updateConversionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v6, 0x16u);
  }
  [(StoreKitServiceConnection *)self updateConversionValue:v4 completionHandler:0];
}

- (void)updateConversionValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2082;
    unsigned int v19 = "-[StoreKitServiceConnection updateConversionValue:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [_TtC9storekitd6Client alloc];
  int v10 = +[NSXPCConnection currentConnection];
  int v11 = [(Client *)v9 initWithConnection:v10 overridesDictionary:0];

  if (v11)
  {
    if (![(Client *)v11 isClip])
    {
      __int16 v12 = +[ASDInstallAttribution sharedInstance];
      __int16 v13 = +[NSNumber numberWithUnsignedLongLong:[(Client *)v11 storeItemID]];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100062998;
      v14[3] = &unk_100357B28;
      v14[4] = self;
      id v15 = v7;
      [v12 updateConversionValueForInstallAttributionPingbackForApp:v13 conversionValue:v6 completionHandler:v14];

      goto LABEL_18;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR))
    {
      sub_1002C6078();
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR))
    {
      sub_1002C6010();
      if (!v7) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  if (v7) {
LABEL_16:
  }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_18:
}

- (void)updateConversionValue:(id)a3 coarseValue:(id)a4 completionHandler:(id)a5
{
}

- (void)updateConversionValue:(id)a3 coarseValue:(id)a4 lockWindow:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = [_TtC9storekitd6Client alloc];
  int v14 = +[NSXPCConnection currentConnection];
  id v15 = [(Client *)v13 initWithConnection:v14 overridesDictionary:0];

  if (v15)
  {
    if (![(Client *)v15 isClip])
    {
      id v16 = +[ASDInstallAttribution sharedInstance];
      id v17 = +[NSNumber numberWithUnsignedLongLong:[(Client *)v15 storeItemID]];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100062C9C;
      v18[3] = &unk_100357B28;
      v18[4] = self;
      id v19 = v12;
      [v16 updatePostbackConversionValuesForApp:v17 fineConversionValue:v10 coarseConversionValue:v11 lockWindow:v7 completionHandler:v18];

      goto LABEL_14;
    }
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR))
    {
      sub_1002C61B0();
      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR))
    {
      sub_1002C6148();
      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  if (v12) {
LABEL_12:
  }
    (*((void (**)(id, void))v12 + 2))(v12, 0);
LABEL_14:
}

- (void)startAdImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = self;
    __int16 v34 = 2082;
    id v35 = "-[StoreKitServiceConnection startAdImpressionWithConfig:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [v6 objectForKeyedSubscript:@"version"];
  unsigned int v10 = [(StoreKitServiceConnection *)self _isSKANVersionFourOrHigher:v9];
  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"source-identifier"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    __int16 v13 = [v6 objectForKeyedSubscript:@"campaign-id"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
LABEL_11:
      id v15 = ASDErrorWithDescription();
      v7[2](v7, v15);
      goto LABEL_14;
    }
  }
  id v15 = +[NSXPCConnection currentConnection];
  id v16 = [[_TtC9storekitd6Client alloc] initWithConnection:v15 overridesDictionary:0];
  id v17 = objc_opt_new();
  __int16 v18 = [v6 objectForKeyedSubscript:@"app-adam-id"];
  [v17 setAppAdamId:v18];

  id v19 = [v6 objectForKeyedSubscript:@"ad-network-id"];
  [v17 setAdNetworkId:v19];

  if (v10)
  {
    uint64_t v20 = [v6 objectForKeyedSubscript:@"source-identifier"];
    [v17 setSourceIdentifier:v20];
  }
  else
  {
    uint64_t v20 = [v6 objectForKeyedSubscript:@"campaign-id"];
    [v17 setCampaignId:v20];
  }

  unsigned int v21 = [v6 objectForKeyedSubscript:@"impression-id"];
  [v17 setImpressionId:v21];

  uint64_t v22 = [v6 objectForKeyedSubscript:@"source-app-adamid"];
  [v17 setSourceAppAdamId:v22];

  id v23 = [(Client *)v16 requestBundleID];
  [v17 setSourceAppBundleId:v23];

  __int16 v24 = [v6 objectForKeyedSubscript:@"attr-signature"];
  [v17 setAttributionSignature:v24];

  id v25 = [v6 objectForKeyedSubscript:@"version"];
  [v17 setVersion:v25];

  __int16 v26 = [v6 objectForKeyedSubscript:@"fidelity-type"];
  [v17 setFidelityType:v26];

  id v27 = objc_msgSend(v15, "sk_processName");
  [v17 setProcessName:v27];

  __int16 v28 = [v6 objectForKeyedSubscript:@"impression-timestamp"];
  [v17 setTimestamp:v28];

  uint64_t v29 = +[ASDInstallAttribution sharedInstance];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006320C;
  v30[3] = &unk_100357D08;
  id v31 = v7;
  [v29 startImpressionWithConfig:v17 completionHandler:v30];

LABEL_14:
}

- (void)endAdImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  __int16 v8 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v33 = self;
    __int16 v34 = 2082;
    id v35 = "-[StoreKitServiceConnection endAdImpressionWithConfig:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v9 = [v6 objectForKeyedSubscript:@"version"];
  unsigned int v10 = [(StoreKitServiceConnection *)self _isSKANVersionFourOrHigher:v9];
  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"source-identifier"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    __int16 v13 = [v6 objectForKeyedSubscript:@"campaign-id"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
LABEL_11:
      id v15 = ASDErrorWithDescription();
      v7[2](v7, v15);
      goto LABEL_14;
    }
  }
  id v15 = +[NSXPCConnection currentConnection];
  id v16 = [[_TtC9storekitd6Client alloc] initWithConnection:v15 overridesDictionary:0];
  id v17 = objc_opt_new();
  __int16 v18 = [v6 objectForKeyedSubscript:@"app-adam-id"];
  [v17 setAppAdamId:v18];

  id v19 = [v6 objectForKeyedSubscript:@"ad-network-id"];
  [v17 setAdNetworkId:v19];

  if (v10)
  {
    uint64_t v20 = [v6 objectForKeyedSubscript:@"source-identifier"];
    [v17 setSourceIdentifier:v20];
  }
  else
  {
    uint64_t v20 = [v6 objectForKeyedSubscript:@"campaign-id"];
    [v17 setCampaignId:v20];
  }

  unsigned int v21 = [v6 objectForKeyedSubscript:@"impression-id"];
  [v17 setImpressionId:v21];

  uint64_t v22 = [v6 objectForKeyedSubscript:@"source-app-adamid"];
  [v17 setSourceAppAdamId:v22];

  id v23 = [(Client *)v16 requestBundleID];
  [v17 setSourceAppBundleId:v23];

  __int16 v24 = [v6 objectForKeyedSubscript:@"attr-signature"];
  [v17 setAttributionSignature:v24];

  id v25 = [v6 objectForKeyedSubscript:@"version"];
  [v17 setVersion:v25];

  __int16 v26 = [v6 objectForKeyedSubscript:@"fidelity-type"];
  [v17 setFidelityType:v26];

  id v27 = objc_msgSend(v15, "sk_processName");
  [v17 setProcessName:v27];

  __int16 v28 = [v6 objectForKeyedSubscript:@"impression-timestamp"];
  [v17 setTimestamp:v28];

  uint64_t v29 = +[ASDInstallAttribution sharedInstance];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100063774;
  v30[3] = &unk_100357D08;
  id v31 = v7;
  [v29 endImpressionWithConfig:v17 completionHandler:v30];

LABEL_14:
}

- (void)engagementRequestForOfferCodeRedemptionSheetWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  id v5 = qword_100399668;
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v26 = self;
    __int16 v27 = 2082;
    __int16 v28 = "-[StoreKitServiceConnection engagementRequestForOfferCodeRedemptionSheetWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
  }
  id v6 = [_TtC9storekitd6Client alloc];
  BOOL v7 = +[NSXPCConnection currentConnection];
  __int16 v8 = [(Client *)v6 initWithConnection:v7 overridesDictionary:0];

  if (!v8)
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C62E8();
    }
    goto LABEL_16;
  }
  if (![(Client *)v8 isClip])
  {
    id v9 = +[OctaneManager simulatedStoreKitErrorFor:8 client:v8];
    if (v9)
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      unsigned int v10 = qword_100399668;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v26 = self;
        __int16 v27 = 2114;
        __int16 v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Found simulated failure: %{public}@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    id v11 = [(Client *)v8 account];
    id v12 = [(StoreKitServiceConnection *)self _offerCodeRedemptionURLForClient:v8];
    __int16 v13 = v12;
    if (v12)
    {
      char v14 = [v12 scheme];
      unsigned int v15 = [v14 isEqualToString:@"itms-ui"];

      if (!v15)
      {
        id v22 = objc_alloc_init((Class)AMSEngagementRequest);
        [v22 setURL:v13];
        [v22 setAccount:v11];
        id v24 = 0;
        unsigned int v21 = +[NSKeyedArchiver archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v24];
        id v20 = v24;
        if (!v21)
        {
          id v23 = sub_100057998(1u);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1002C63B8();
          }
        }
        goto LABEL_37;
      }
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      id v16 = (void *)qword_100399668;
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        __int16 v18 = [(Client *)v8 callerBundleID];
        *(_DWORD *)buf = 138543618;
        __int16 v26 = self;
        __int16 v27 = 2114;
        __int16 v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Using code redeem legacy flow for %{public}@", buf, 0x16u);
      }
      id v19 = +[LSApplicationWorkspace defaultWorkspace];
      [v19 openSensitiveURL:v13 withOptions:&__NSDictionary0__struct];
    }
    ASDErrorWithDescription();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v21 = 0;
LABEL_37:
    v4[2](v4, v20, v21);

    goto LABEL_18;
  }
  if (qword_10039FC68 != -1) {
    dispatch_once(&qword_10039FC68, &stru_100359368);
  }
  if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
    sub_1002C6350();
  }
LABEL_16:
  ASDErrorWithDescription();
  id v9 = (char *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v4[2](v4, v9, 0);
LABEL_18:
}

- (void)saveNewTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5
{
}

- (void)downloadManager:(id)a3 updatedStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = self->_downloadIDs;
  objc_sync_enter(v8);
  downloadIDs = self->_downloadIDs;
  unsigned int v10 = [v7 downloadID];
  LODWORD(downloadIDs) = [(NSMutableSet *)downloadIDs containsObject:v10];

  objc_sync_exit(v8);
  if (downloadIDs)
  {
    id v11 = +[NSMutableDictionary dictionary];
    id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 state]);
    [v11 setObject:v12 forKeyedSubscript:@"state"];

    [v7 progress];
    __int16 v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v13 forKeyedSubscript:@"progress"];

    [v7 timeRemaining];
    char v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v14 forKeyedSubscript:@"time-remaining"];

    unsigned int v15 = [v7 error];
    id v16 = [v15 toASDErrorWithMetadata:0];
    [v11 setObject:v16 forKeyedSubscript:@"error"];

    id v17 = [v7 installPath];
    [v11 setObject:v17 forKeyedSubscript:@"download-install-path"];

    remoteObject = self->_remoteObject;
    v26[0] = @"download";
    id v19 = [v7 downloadID];
    v26[1] = @"download-status";
    v27[0] = v19;
    v27[1] = v11;
    id v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [(SKClientProtocol *)remoteObject downloadStatusChanged:v20];

    if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4)
    {
      unsigned int v21 = self->_remoteObject;
      CFStringRef v24 = @"download";
      id v22 = [v7 downloadID];
      id v25 = v22;
      id v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [(SKClientProtocol *)v21 downloadRemoved:v23];
    }
  }
}

- (id)_bundleURLForConnection:(id)a3
{
  if (proc_pidpath((int)[a3 processIdentifier], buffer, 0x1000u) < 1)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = +[NSString stringWithUTF8String:buffer];
    if (v3)
    {
      CFURLRef v4 = CFURLCreateWithFileSystemPath(0, v3, kCFURLPOSIXPathStyle, 0);
      if (v4)
      {
        CFURLRef v5 = v4;
        id v6 = (void *)_CFBundleCopyBundleURLForExecutableURL();
        CFRelease(v5);
        goto LABEL_7;
      }
    }
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_silentAuthWithClientInfo:(id)a3 account:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)AMSBinaryPromise);
  if (v7)
  {
    id v11 = objc_alloc_init((Class)AMSAuthenticateOptions);
    [v11 setClientInfo:v7];
    [v11 setDebugReason:@"SK Silent Auth"];
    [v11 setAuthenticationType:1];
    id v12 = objc_alloc((Class)AMSAuthenticateRequest);
    __int16 v13 = objc_msgSend(v8, "ams_DSID");
    char v14 = objc_msgSend(v8, "ams_altDSID");
    unsigned int v15 = [v8 username];
    id v16 = [v12 initWithDSID:v13 altDSID:v14 username:v15 options:v11];

    id v17 = [objc_alloc((Class)AMSAuthenticateTask) initWithRequest:v16];
    __int16 v18 = [v17 performAuthentication];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100064354;
    v23[3] = &unk_100359348;
    id v24 = v9;
    id v19 = v10;
    id v25 = v19;
    [v18 addFinishBlock:v23];
    id v20 = v25;
    id v21 = v19;
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C6420();
    }
    ASDErrorWithTitleAndMessage();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v10 finishWithError:v11];
  }

  return v10;
}

- (id)_offerCodeRedemptionURLForClient:(id)a3
{
  id v3 = a3;
  CFURLRef v4 = [v3 bag];
  CFURLRef v5 = +[BagKey redeemCodeURL];
  id v6 = [v4 URLForKey:v5];
  id v25 = 0;
  id v7 = [v6 valueWithError:&v25];
  id v8 = v25;

  if (v7)
  {
    id v9 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];
    if (objc_msgSend(v3, "objc_clientType") != 3)
    {
      id v10 = [v3 bag];
      id v11 = +[objc_URLParserHelper urlTypeFor:v7 bag:v10 error:0];

      if (!v11 || [v11 integerValue] == (id)1) {
        [v9 setScheme:@"itms-ui"];
      }
    }
    id v12 = [v9 queryItems];
    __int16 v13 = +[NSMutableArray arrayWithArray:v12];

    char v14 = [v3 requestBundleID];
    unsigned int v15 = +[NSURLQueryItem queryItemWithName:@"pbid" value:v14];

    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v3 storeItemID]);
    id v17 = +[NSURLQueryItem queryItemWithName:@"paid" value:v16];

    __int16 v18 = +[NSURLQueryItem queryItemWithName:@"ctx" value:@"offercodes"];
    v26[0] = v15;
    v26[1] = v17;
    void v26[2] = v18;
    id v19 = +[NSArray arrayWithObjects:v26 count:3];
    [v13 addObjectsFromArray:v19];

    id v20 = +[NSArray arrayWithArray:v13];
    [v9 setQueryItems:v20];

    id v21 = [v9 URL];
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      if (qword_10039FC68 != -1) {
        dispatch_once(&qword_10039FC68, &stru_100359368);
      }
      if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
        sub_1002C6558();
      }
    }
  }
  else
  {
    if (qword_10039FC68 != -1) {
      dispatch_once(&qword_10039FC68, &stru_100359368);
    }
    if (os_log_type_enabled((os_log_t)qword_100399668, OS_LOG_TYPE_ERROR)) {
      sub_1002C64F0();
    }
    id v22 = 0;
  }

  return v22;
}

+ (int64_t)_apiVersionForClientDict:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:off_100399260[0]];
  CFURLRef v4 = v3;
  if (v3 && ([v3 isEqualToNumber:&off_100373B90] & 1) != 0) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (BOOL)_isClientValidForReview:(id)a3
{
  return 0;
}

- (BOOL)_isSKANVersionFourOrHigher:(id)a3
{
  return [a3 compare:@"4.0" options:64] != (id)-1;
}

- (SKClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (RemoteAlertWrapper)remoteAlertWrapper
{
  return (RemoteAlertWrapper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRemoteAlertWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertWrapper, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_productPromotionsQueue, 0);
  objc_storeStrong((id *)&self->_productLookupQueue, 0);
  objc_storeStrong((id *)&self->_appTerminationQueue, 0);
  objc_storeStrong((id *)&self->_paymentQueue, 0);
  objc_storeStrong((id *)&self->_finishPaymentQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong((id *)&self->_downloadIDs, 0);
}

- (void)externalGatewaySheetWithRequest:(id)a3 reply:(id)a4
{
}

- (void)externalPurchaseLinkURLsForBundleID:(id)a3 reply:(id)a4
{
}

- (void)_handleTokenFamily:(id)a3 bundleID:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = v15;

  _Block_copy(v8);
  sub_100149D84(v11, v13, v14, v16, (uint64_t)v17, (void (**)(void, void))v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  sub_100012EB8(v11, v13);
}

- (void)checkPaymentAccountBindingEligibilityWithRequest:(id)a3 reply:(id)a4
{
}

- (void)bindPaymentAccountWithRequest:(id)a3 reply:(id)a4
{
}

- (void)manageSubscriptionsEngagementRequestWithRequest:(id)a3 reply:(id)a4
{
}

- (void)presentManageSubscriptionsWithRequest:(id)a3 reply:(id)a4
{
}

- (void)presentRefundRequestSheetForTransactionID:(id)a3 sceneID:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  unint64_t v12 = self;
  sub_10014F79C(v11, v9, (uint64_t)a4, (uint64_t)v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)presentCodeRedemptionSheetWithSceneID:(id)a3 reply:(id)a4
{
}

- (void)acknowledgeMessage:(id)a3 reply:(id)a4
{
}

- (void)clientOverridesWithReply:(id)a3
{
  CFURLRef v4 = _Block_copy(a3);
  _Block_copy(v4);
  int64_t v5 = self;
  sub_100153E48((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (void)setClientOverrideWithRequest:(id)a3 reply:(id)a4
{
}

- (void)policyWithRequest:(id)a3 reply:(id)a4
{
}

- (void)productsWithRequest:(id)a3 responseReceiver:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  swift_unknownObjectRetain();
  unint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100156F78(v10, v12, (uint64_t)a4, (uint64_t)v13, v8);
  _Block_release(v8);
  sub_100012EB8(v10, (unint64_t)v12);
  swift_unknownObjectRelease();
}

- (void)lookupProductWithParametersProductRequest:(id)a3 reply:(id)a4
{
}

- (void)lookupProductWithURLProductRequest:(id)a3 reply:(id)a4
{
}

- (void)addPurchaseIntentWithRequest:(id)a3 reply:(id)a4
{
}

- (void)clearPurchaseIntentsWithRequest:(id)a3 reply:(id)a4
{
}

- (void)setAppInstallSheetBundleID:(id)a3 reply:(id)a4
{
}

@end