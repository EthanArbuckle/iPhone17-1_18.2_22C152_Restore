@interface ReceiptManager
+ (id)managerForClient:(id)a3;
+ (void)handleAppUninstallForBundleIDs:(id)a3;
- (BOOL)_clearCachedLegacyTransactionsWithLogKey:(id)a3;
- (BOOL)_includeFinishedConsumables;
- (BOOL)_needsSubscriptionStatusSyncForStatusDictionary:(id)a3 logKey:(id)a4;
- (BOOL)_resetLastUpdatedForLegacyTransactionsWithLogKey:(id)a3;
- (BOOL)_setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 includesFinishedConsumables:(BOOL)a5 forRevision:(id)a6 logKey:(id)a7 containsSubscriptions:(BOOL *)a8;
- (BOOL)invalidateLegacyTransactionCache;
- (BOOL)isTransactionFinishedForID:(id)a3;
- (NSDate)lastUpdated;
- (NSLock)syncLock;
- (NSOperationQueue)readQueue;
- (NSOperationQueue)syncQueue;
- (ReceiptManager)initWithClient:(id)a3;
- (_TtC9storekitd6Client)client;
- (id)_configureMetricsEventWithBeforeTransactionCount:(unint64_t)a3 beforeTransactions:(id)a4 beforeStatuses:(id)a5;
- (id)databaseStore;
- (void)_appTransactionSyncWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_authenticateWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_checkTransactionAgeAndSyncWithLogKey:(id)a3 completionHandler:(id)a4;
- (void)_checkTransactionAgeOnReadQueueForStatusWithGroupID:(id)a3 completionHandler:(id)a4;
- (void)_manualSyncWithLogKey:(id)a3 completionHandler:(id)a4;
- (void)_setUnfinishedForTransactionIDs:(id)a3 logKey:(id)a4;
- (void)_syncSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_syncTransactionsAndSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_syncTransactionsWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)appTransactionWithDialogContext:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5;
- (void)authenticateAndSyncWithDialogContext:(id)a3 completionHandler:(id)a4;
- (void)clearTransactions;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)enumerateSubscriptionStatusUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)enumerateUnfinishedTransactionsUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)isEligibleForIntroductoryOfferForSubscriptionGroupID:(id)a3 storefrontID:(id)a4 completionHandler:(id)a5;
- (void)requestUnifiedAppReceiptWithDialogContext:(id)a3 logKey:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)setFinishedForTransactionID:(id)a3;
- (void)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forRevision:(id)a5;
- (void)subscriptionStatusForSubscriptionGroupID:(id)a3 completionHandler:(id)a4;
- (void)syncReceiptsWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)syncSubscriptionStatusWithReason:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation ReceiptManager

+ (id)managerForClient:(id)a3
{
  id v3 = a3;
  if (qword_10039F788 != -1) {
    dispatch_once(&qword_10039F788, &stru_1003576F0);
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10002DFD4;
  v15 = sub_10002DFE4;
  id v16 = 0;
  v4 = qword_10039F780;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002DFEC;
  v8[3] = &unk_1003571D0;
  id v9 = v3;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (void)handleAppUninstallForBundleIDs:(id)a3
{
  id v4 = a3;
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v5 = qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = a1;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling app uninstall for %{public}@", buf, 0x16u);
  }
  v14 = +[Environment sharedInstance];
  id v6 = [v14 userDatabase];
  v7 = [(SQLiteDatabaseStore *)[InAppReceiptDatabaseStore alloc] initWithDatabase:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10002E368;
        v15[3] = &unk_100357718;
        v15[4] = v13;
        v15[5] = a1;
        [(SQLiteDatabaseStore *)v7 modifyUsingTransaction:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (ReceiptManager)initWithClient:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ReceiptManager;
  id v6 = [(ReceiptManager *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_opt_new();
    readQueue = v7->_readQueue;
    v7->_readQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v7->_readQueue setMaxConcurrentOperationCount:4];
    uint64_t v10 = objc_opt_new();
    syncLock = v7->_syncLock;
    v7->_syncLock = (NSLock *)v10;

    uint64_t v12 = objc_opt_new();
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (NSOperationQueue *)v12;

    [(NSOperationQueue *)v7->_syncQueue setMaxConcurrentOperationCount:1];
    v14 = [v5 requestBundleID];
    v15 = +[InAppReceiptDatabaseShared databasePathsForBundleID:v14 error:0];

    if (v15)
    {
      v31 = v7;
      v32 = +[NSUUID lib_shortLogKey];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v30 = v15;
      id v16 = v15;
      id v17 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v20);
            id v22 = +[NSFileManager defaultManager];
            unsigned int v23 = [v22 fileExistsAtPath:v21];

            if (v23)
            {
              if (qword_10039F7D8 != -1) {
                dispatch_once(&qword_10039F7D8, &stru_100357DA0);
              }
              id v24 = qword_10039F7B8;
              if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v40 = v32;
                __int16 v41 = 2114;
                uint64_t v42 = v21;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Removing app receipts db at %{public}@", buf, 0x16u);
              }
              v25 = +[NSFileManager defaultManager];
              id v33 = 0;
              unsigned __int8 v26 = [v25 removeItemAtPath:v21 error:&v33];
              id v27 = v33;

              if ((v26 & 1) == 0)
              {
                if (qword_10039F7D8 != -1) {
                  dispatch_once(&qword_10039F7D8, &stru_100357DA0);
                }
                v28 = qword_10039F7B8;
                if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v40 = v32;
                  __int16 v41 = 2114;
                  uint64_t v42 = v21;
                  __int16 v43 = 2114;
                  id v44 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Error removing receipts at %{public}@ - %{public}@", buf, 0x20u);
                }
              }
            }
            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
        }
        while (v18);
      }

      v7 = v31;
      v15 = v30;
    }
  }
  return v7;
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (InAppReceiptDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    id v4 = +[Environment sharedInstance];
    id v5 = [v4 userDatabase];
    WeakRetained = [(SQLiteDatabaseStore *)[InAppReceiptDatabaseStore alloc] initWithDatabase:v5];
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)appTransactionWithDialogContext:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[NSUUID lib_shortLogKey];
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  uint64_t v11 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(ReceiptManager *)self client];
    v14 = [v13 requestBundleID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting app transaction for %{public}@", buf, 0x16u);
  }
  v15 = [(ReceiptManager *)self syncLock];
  [v15 lock];

  if (a4)
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v16 = (void *)qword_10039F7B8;
    if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = [(ReceiptManager *)self client];
      uint64_t v19 = [v18 requestBundleID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring cache and requesting app transaction for %{public}@", buf, 0x16u);
    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10002EFD4;
    v34[3] = &unk_100357790;
    v34[4] = self;
    id v37 = v9;
    id v35 = v8;
    id v36 = v10;
    [(ReceiptManager *)self _authenticateWithDialogContext:v35 logKey:v36 completionHandler:v34];
  }
  else
  {
    v20 = [(ReceiptManager *)self client];
    uint64_t v21 = [v20 currentAccountToken];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v46 = sub_10002DFD4;
    v47 = sub_10002DFE4;
    id v48 = 0;
    id v22 = [(ReceiptManager *)self databaseStore];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10002EF04;
    v38[3] = &unk_100357740;
    v40 = buf;
    v38[4] = self;
    id v23 = v21;
    id v39 = v23;
    [v22 readUsingSession:v38];

    if ([*(id *)(*(void *)&buf[8] + 40) length])
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      id v24 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [(ReceiptManager *)self client];
        unsigned __int8 v26 = [v25 requestBundleID];
        *(_DWORD *)__int16 v41 = 138543618;
        uint64_t v42 = v10;
        __int16 v43 = 2114;
        id v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Found cached app transaction for %{public}@", v41, 0x16u);
      }
      id v27 = [(ReceiptManager *)self syncLock];
      [v27 unlock];

      (*((void (**)(id, void, void))v9 + 2))(v9, *(void *)(*(void *)&buf[8] + 40), 0);
      _Block_object_dispose(buf, 8);
    }
    else
    {

      _Block_object_dispose(buf, 8);
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      v28 = (void *)qword_10039F7B8;
      if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = [(ReceiptManager *)self client];
        v31 = [v30 requestBundleID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting app transaction for %{public}@", buf, 0x16u);
      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002F158;
      v32[3] = &unk_100357768;
      v32[4] = self;
      id v33 = v9;
      [(ReceiptManager *)self _appTransactionSyncWithDialogContext:v8 logKey:v10 completionHandler:v32];
    }
  }
}

- (void)authenticateAndSyncWithDialogContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSUUID lib_shortLogKey];
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v9 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(ReceiptManager *)self client];
    uint64_t v12 = [v11 requestBundleID];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting authenticate and sync for %{public}@", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002F3BC;
  v15[3] = &unk_1003577B8;
  id v16 = v8;
  id v17 = v6;
  v15[4] = self;
  id v13 = v8;
  id v14 = v6;
  [(ReceiptManager *)self _authenticateWithDialogContext:v7 logKey:v13 completionHandler:v15];
}

- (void)clearTransactions
{
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v3 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(ReceiptManager *)self client];
    id v8 = [v7 requestBundleID];
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing transactions for %{public}@", buf, 0x16u);
  }
  id v9 = [(ReceiptManager *)self databaseStore];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F570;
  v10[3] = &unk_1003577E0;
  v10[4] = self;
  [v9 modifyUsingTransaction:v10];
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ReceiptManager *)self readQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002F720;
  v15[3] = &unk_100357880;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 addOperationWithBlock:v15];
}

- (void)enumerateReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ReceiptManager *)self readQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002FD8C;
  v15[3] = &unk_100357880;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 addOperationWithBlock:v15];
}

- (void)enumerateUnfinishedTransactionsUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ReceiptManager *)self readQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000303D0;
  v11[3] = &unk_1003578F8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (BOOL)invalidateLegacyTransactionCache
{
  id v3 = +[NSUUID lib_shortLogKey];
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v4 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(ReceiptManager *)self client];
    id v7 = [v6 requestBundleID];
    int v10 = 138543874;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v3;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Invalidating legacy cache for %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([(ReceiptManager *)self _clearCachedLegacyTransactionsWithLogKey:v3])
  {
    BOOL v8 = [(ReceiptManager *)self _resetLastUpdatedForLegacyTransactionsWithLogKey:v3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)isEligibleForIntroductoryOfferForSubscriptionGroupID:(id)a3 storefrontID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[NSUUID lib_shortLogKey];
  __int16 v12 = [(ReceiptManager *)self readQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100030B34;
  v17[3] = &unk_100357948;
  v17[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  [v12 addOperationWithBlock:v17];
}

- (BOOL)isTransactionFinishedForID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(ReceiptManager *)self databaseStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003144C;
  v8[3] = &unk_100357740;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  [v5 readUsingSession:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

- (NSDate)lastUpdated
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10002DFD4;
  uint64_t v11 = sub_10002DFE4;
  id v12 = 0;
  id v3 = [(ReceiptManager *)self databaseStore];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000315FC;
  v6[3] = &unk_100357970;
  v6[4] = self;
  v6[5] = &v7;
  [v3 readUsingSession:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)requestUnifiedAppReceiptWithDialogContext:(id)a3 logKey:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  uint64_t v14 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = v14;
    id v16 = [(ReceiptManager *)self client];
    id v17 = [v16 requestBundleID];
    *(_DWORD *)buf = 138543874;
    id v38 = v11;
    __int16 v39 = 2114;
    v40 = v17;
    __int16 v41 = 2114;
    id v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting unified receipt for %{public}@ with options: %{public}@", buf, 0x20u);
  }
  id v18 = [FetchReceiptTask alloc];
  id v19 = [(ReceiptManager *)self client];
  id v20 = [(FetchReceiptTask *)v18 initWithClient:v19];

  [(FetchReceiptTask *)v20 setLogKey:v11];
  [(FetchReceiptTask *)v20 setDialogContext:v10];
  id v21 = [v12 objectForKeyedSubscript:@"expired"];
  unsigned int v22 = [v21 BOOLValue];

  if (v22) {
    [(FetchReceiptTask *)v20 setReceiptFlags:[(FetchReceiptTask *)v20 receiptFlags] | 1];
  }
  id v23 = [v12 objectForKeyedSubscript:@"revoked"];
  unsigned int v24 = [v23 BOOLValue];

  if (v24) {
    [(FetchReceiptTask *)v20 setReceiptFlags:[(FetchReceiptTask *)v20 receiptFlags] | 2];
  }
  v25 = [v12 objectForKeyedSubscript:@"vpp"];
  unsigned int v26 = [v25 BOOLValue];

  if (v26) {
    [(FetchReceiptTask *)v20 setReceiptFlags:[(FetchReceiptTask *)v20 receiptFlags] | 8];
  }
  objc_initWeak((id *)buf, v20);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000319F8;
  v31[3] = &unk_100357998;
  objc_copyWeak(&v36, (id *)buf);
  id v27 = v12;
  id v32 = v27;
  id v28 = v11;
  id v33 = v28;
  long long v34 = self;
  id v29 = v13;
  id v35 = v29;
  [(FetchReceiptTask *)v20 setCompletionBlock:v31];
  v30 = [(ReceiptManager *)self syncQueue];
  [v30 addOperation:v20];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

- (void)setFinishedForTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID lib_shortLogKey];
  id v6 = [(ReceiptManager *)self databaseStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031C38;
  v9[3] = &unk_1003579C0;
  id v10 = v4;
  id v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 modifyUsingTransaction:v9];
}

- (void)subscriptionStatusForSubscriptionGroupID:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031DC0;
  v7[3] = &unk_100357A10;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ReceiptManager *)v8 _checkTransactionAgeOnReadQueueForStatusWithGroupID:v6 completionHandler:v7];
}

- (void)enumerateSubscriptionStatusUsingBlock:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032358;
  v7[3] = &unk_100357B00;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ReceiptManager *)v8 _checkTransactionAgeOnReadQueueForStatusWithGroupID:0 completionHandler:v7];
}

- (void)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forRevision:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSUUID lib_shortLogKey];
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v12 = [(ReceiptManager *)self databaseStore];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032A94;
  v13[3] = &unk_100357970;
  v13[4] = self;
  v13[5] = &v14;
  [v12 readUsingSession:v13];

  [(ReceiptManager *)self _setTransactionInfo:v8 unfinishedIDs:v9 includesFinishedConsumables:*((unsigned __int8 *)v15 + 24) forRevision:v10 logKey:v11 containsSubscriptions:0];
  _Block_object_dispose(&v14, 8);
}

- (void)syncReceiptsWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSUUID lib_shortLogKey];
  id v8 = [(ReceiptManager *)self syncLock];
  [v8 lock];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032C08;
  v10[3] = &unk_100357B28;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(ReceiptManager *)self _syncTransactionsAndSubscriptionStatusWithReason:a3 logKey:v7 completionHandler:v10];
}

- (void)syncSubscriptionStatusWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSUUID lib_shortLogKey];
  id v8 = [(ReceiptManager *)self syncLock];
  [v8 lock];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032D60;
  v10[3] = &unk_100357B28;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(ReceiptManager *)self _syncSubscriptionStatusWithReason:a3 logKey:v7 completionHandler:v10];
}

- (void)_appTransactionSyncWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [FetchReceiptTask alloc];
  id v12 = [(ReceiptManager *)self client];
  id v13 = [(FetchReceiptTask *)v11 initWithClient:v12];

  [(FetchReceiptTask *)v13 setDialogContext:v8];
  [(FetchReceiptTask *)v13 setApiVersion:2];
  objc_initWeak(&location, v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100032F68;
  v17[3] = &unk_100357B50;
  objc_copyWeak(&v21, &location);
  id v14 = v9;
  id v18 = v14;
  id v19 = self;
  id v15 = v10;
  id v20 = v15;
  [(FetchReceiptTask *)v13 setCompletionBlock:v17];
  uint64_t v16 = [(ReceiptManager *)self syncQueue];
  [v16 addOperation:v13];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_authenticateWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(ReceiptManager *)self client];
  unsigned int v12 = objc_msgSend(v11, "objc_clientType");

  if (v12 == 3)
  {
    id v13 = [(ReceiptManager *)self client];
    id v14 = [v13 requestBundleID];
    id v15 = +[OctaneActionContext contextWithBundleID:v14];

    if (v15)
    {
      uint64_t v16 = +[OctaneManager sharedInstance];
      unsigned __int8 v17 = [v16 getBoolValueForIdentifier:2 withContext:v15];

      if (v17)
      {
        if (qword_10039F7D8 != -1) {
          dispatch_once(&qword_10039F7D8, &stru_100357DA0);
        }
        id v18 = qword_10039F7B8;
        if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v40 = v9;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping authenticate for Xcode environment", buf, 0xCu);
        }
        v10[2](v10, 0);
        goto LABEL_28;
      }
      unsigned int v26 = +[AMSDialogAction actionWithTitle:@"Cancel" identifier:@"Cancel"];
      [v26 setStyle:2];
      id v29 = +[AMSDialogAction actionWithTitle:@"OK" identifier:@"OK"];
      v30 = +[AMSDialogRequest requestWithTitle:@"Sign in with Apple Account" message:@"Press \"OK\" to simulate authenticating with an Apple Account.\n\n[Environment: Xcode]"];
      [v30 setDefaultAction:v29];
      v41[0] = v26;
      v41[1] = v29;
      v31 = +[NSArray arrayWithObjects:v41 count:2];
      [v30 setButtonActions:v31];

      [v30 setLogKey:v9];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100033798;
      v36[3] = &unk_100357B78;
      id v37 = v9;
      id v38 = v10;
      [v8 handleDialogRequest:v30 completionHandler:v36];
    }
    else
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      v25 = (void *)qword_10039F7B8;
      if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_ERROR)) {
        sub_1002C1300((uint64_t)v9, v25, self);
      }
      unsigned int v26 = ASDErrorWithDescription();
      ((void (**)(id, void *))v10)[2](v10, v26);
    }

    goto LABEL_28;
  }
  id v15 = objc_opt_new();
  id v19 = [(ReceiptManager *)self client];
  id v20 = [v19 processInfo];
  [v15 setClientInfo:v20];

  [v15 setAuthenticationType:2];
  [v15 setDebugReason:@"StoreKit client initiated for syncing transactions"];
  [v15 setLogKey:v9];
  id v21 = [(ReceiptManager *)self client];
  unsigned int v22 = [v21 account];

  if (v22)
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v23 = qword_10039F7B8;
    if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEBUG)) {
      sub_1002C1448((uint64_t)v9, v23);
    }
    id v24 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:v22 options:v15];
  }
  else
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v27 = qword_10039F7B8;
    if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEBUG)) {
      sub_1002C13D0((uint64_t)v9, v27);
    }
    id v24 = [objc_alloc((Class)AMSAuthenticateRequest) initWithDSID:0 altDSID:0 username:0 options:v15];
  }
  id v28 = v24;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100033A2C;
  v32[3] = &unk_100357BA0;
  id v33 = v9;
  long long v34 = self;
  id v35 = v10;
  [v8 handleAuthenticateRequest:v28 completionHandler:v32];

LABEL_28:
}

- (void)_checkTransactionAgeAndSyncWithLogKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ReceiptManager *)self syncLock];
  [v8 lock];

  id v9 = [(ReceiptManager *)self client];
  unsigned __int8 v10 = [v9 hasEverHadIAPs];

  if (v10)
  {
    int v11 = 0;
  }
  else
  {
    unsigned int v12 = [(ReceiptManager *)self client];
    id v13 = [v12 bag];
    id v14 = +[BagKey ignoreIAPQueueCheckSuppression];
    id v15 = [v13 BOOLForKey:v14];
    uint64_t v16 = [v15 valueWithError:0];
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      id v18 = (void *)qword_10039F7B8;
      if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        id v20 = [(ReceiptManager *)self client];
        id v21 = [v20 requestBundleID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Allowing queue check for client with no history of IAPs.", buf, 0x16u);
      }
    }
    else
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      unsigned int v22 = (void *)qword_10039F7B8;
      if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        id v24 = [(ReceiptManager *)self client];
        v25 = [v24 requestBundleID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Supressing queue check for client with no history of IAPs.", buf, 0x16u);
      }
    }
    int v11 = v17 ^ 1;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v100 = sub_10002DFD4;
  v101 = sub_10002DFE4;
  id v102 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = sub_10002DFD4;
  v91 = sub_10002DFE4;
  id v92 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  unsigned int v26 = [(ReceiptManager *)self databaseStore];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100034A34;
  v82[3] = &unk_100357BC8;
  v82[4] = self;
  v82[5] = buf;
  v82[6] = &v87;
  v82[7] = &v83;
  [v26 readUsingSession:v82];

  unsigned int v27 = [(ReceiptManager *)self _includeFinishedConsumables];
  if (*((unsigned __int8 *)v84 + 24) != v27)
  {
    [(ReceiptManager *)self clearTransactions];
    if (v11)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      id v29 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = [(ReceiptManager *)self client];
        uint64_t v42 = [v41 requestBundleID];
        __int16 v43 = (void *)v42;
        CFStringRef v44 = @"NO";
        *(_DWORD *)v93 = 138543874;
        id v94 = v6;
        __int16 v95 = 2114;
        if (v27) {
          CFStringRef v44 = @"YES";
        }
        uint64_t v96 = v42;
        __int16 v97 = 2114;
        v98 = (void *)v44;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for %{public}@ where includeFinishedConsumables (%{public}@) doesn't match cache", v93, 0x20u);
      }
      goto LABEL_68;
    }
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v29 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [(ReceiptManager *)self client];
      uint64_t v46 = [v45 requestBundleID];
      v47 = (void *)v46;
      CFStringRef v48 = @"NO";
      *(_DWORD *)v93 = 138543874;
      id v94 = v6;
      __int16 v95 = 2114;
      if (v27) {
        CFStringRef v48 = @"YES";
      }
      uint64_t v96 = v46;
      __int16 v97 = 2114;
      v98 = (void *)v48;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing transaction sync for %{public}@ because includeFinishedConsumables (%{public}@) doesn't match cache", v93, 0x20u);
    }
LABEL_55:
    uint64_t v40 = 0;
LABEL_80:

LABEL_81:
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100034B54;
    v79[3] = &unk_100357B28;
    v79[4] = self;
    id v80 = v7;
    [(ReceiptManager *)self _syncTransactionsAndSubscriptionStatusWithReason:v40 logKey:v6 completionHandler:v79];

    goto LABEL_82;
  }
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    if (v11)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      id v29 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v49 = [(ReceiptManager *)self client];
        v50 = [v49 requestBundleID];
        *(_DWORD *)v93 = 138543618;
        id v94 = v6;
        __int16 v95 = 2114;
        uint64_t v96 = (uint64_t)v50;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for %{public}@ with no history.", v93, 0x16u);
      }
      goto LABEL_68;
    }
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v29 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v53 = [(ReceiptManager *)self client];
      v54 = [v53 requestBundleID];
      *(_DWORD *)v93 = 138543618;
      id v94 = v6;
      __int16 v95 = 2114;
      uint64_t v96 = (uint64_t)v54;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing transaction sync for %{public}@ because there is no history", v93, 0x16u);
    }
    goto LABEL_55;
  }
  if (!v88[5])
  {
    [(ReceiptManager *)self clearTransactions];
    if (v11)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      id v29 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v51 = [(ReceiptManager *)self client];
        v52 = [v51 requestBundleID];
        *(_DWORD *)v93 = 138543618;
        id v94 = v6;
        __int16 v95 = 2114;
        uint64_t v96 = (uint64_t)v52;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for %{public}@ where the cached history has no token.", v93, 0x16u);
      }
      goto LABEL_68;
    }
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v29 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v62 = [(ReceiptManager *)self client];
      v63 = [v62 requestBundleID];
      *(_DWORD *)v93 = 138543618;
      id v94 = v6;
      __int16 v95 = 2114;
      uint64_t v96 = (uint64_t)v63;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing transaction sync for %{public}@ because the cached history has no token", v93, 0x16u);
    }
LABEL_79:
    uint64_t v40 = 5;
    goto LABEL_80;
  }
  id v28 = [(ReceiptManager *)self client];
  id v29 = [v28 currentAccountToken];

  uint64_t v30 = v88[5];
  if (!v29)
  {
    if (v30)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      v55 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = [(ReceiptManager *)self client];
        v57 = [v56 requestBundleID];
        *(_DWORD *)v93 = 138543618;
        id v94 = v6;
        __int16 v95 = 2114;
        uint64_t v96 = (uint64_t)v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all transactions %{public}@ because there is no account", v93, 0x16u);
      }
      [(ReceiptManager *)self clearTransactions];
    }
    goto LABEL_68;
  }
  if (([v29 isEqualToString:v30] & 1) == 0)
  {
    [(ReceiptManager *)self clearTransactions];
    if (v11)
    {
      if (qword_10039F7D8 != -1) {
        dispatch_once(&qword_10039F7D8, &stru_100357DA0);
      }
      v58 = (id)qword_10039F7B8;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = [(ReceiptManager *)self client];
        v60 = [v59 requestBundleID];
        *(_DWORD *)v93 = 138543618;
        id v94 = v6;
        __int16 v95 = 2114;
        uint64_t v96 = (uint64_t)v60;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for %{public}@ where the tokens don't match", v93, 0x16u);
      }
LABEL_68:

      goto LABEL_69;
    }
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    v64 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = [(ReceiptManager *)self client];
      v66 = [v65 requestBundleID];
      *(_DWORD *)v93 = 138543618;
      id v94 = v6;
      __int16 v95 = 2114;
      uint64_t v96 = (uint64_t)v66;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing transaction sync for %{public}@ because the tokens don't match", v93, 0x16u);
    }
    goto LABEL_79;
  }
  v31 = [(ReceiptManager *)self client];
  id v32 = [v31 bag];

  id v33 = +[BagKey transactionReceiptsMaxAge];
  long long v34 = [v32 integerForKey:v33];

  id v81 = 0;
  id v35 = [v34 valueWithError:&v81];
  id v36 = v81;
  v78 = v35;
  if (v36)
  {
    id v37 = v36;
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v38 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v74 = [(ReceiptManager *)self client];
      uint64_t v75 = [v74 requestBundleID];
      *(_DWORD *)v93 = 138543874;
      id v94 = v6;
      __int16 v95 = 2114;
      uint64_t v96 = v75;
      __int16 v97 = 2114;
      v98 = v37;
      v76 = (void *)v75;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting max age for %{public}@ transaction history: %{public}@", v93, 0x20u);
    }
LABEL_24:
    LOBYTE(v39) = 0;
LABEL_25:
    uint64_t v40 = 0;
    goto LABEL_26;
  }
  if (v11)
  {
    id v37 = sub_10002E314();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [(ReceiptManager *)self client];
      v68 = [v67 requestBundleID];
      *(_DWORD *)v93 = 138543618;
      id v94 = v6;
      __int16 v95 = 2114;
      uint64_t v96 = (uint64_t)v68;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping transaction sync for %{public}@ lastUpdated check", v93, 0x16u);
    }
    goto LABEL_24;
  }
  v69 = *(void **)(*(void *)&buf[8] + 40);
  [v35 doubleValue];
  id v37 = objc_msgSend(v69, "dateByAddingTimeInterval:");
  v70 = +[NSDate now];
  BOOL v39 = [v70 compare:v37] == (id)1;

  if (!v39) {
    goto LABEL_25;
  }
  log = sub_10002E314();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v71 = [(ReceiptManager *)self client];
    uint64_t v72 = [v71 requestBundleID];
    *(_DWORD *)v93 = 138543618;
    id v94 = v6;
    __int16 v95 = 2114;
    uint64_t v96 = v72;
    v73 = (void *)v72;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing transaction sync for %{public}@ because lastUpdated is older than maxAge", v93, 0x16u);
  }
  uint64_t v40 = 3;
LABEL_26:

  if (v39) {
    goto LABEL_81;
  }
LABEL_69:
  v61 = [(ReceiptManager *)self syncLock];
  [v61 unlock];

  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_82:
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)_clearCachedLegacyTransactionsWithLogKey:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v5 = (id)qword_10039F7B8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ReceiptManager *)self client];
    id v7 = [v6 requestBundleID];
    *(_DWORD *)buf = 138543874;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Clearing cached legacy transactions for %{public}@", buf, 0x20u);
  }
  id v8 = [(ReceiptManager *)self databaseStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100034E84;
  v14[3] = &unk_100357BF0;
  v14[4] = self;
  v14[5] = &v15;
  [v8 modifyUsingTransaction:v14];

  if (*((unsigned char *)v16 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    unsigned __int8 v10 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = [(ReceiptManager *)self client];
      id v13 = [v12 requestBundleID];
      *(_DWORD *)buf = 138543874;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@] Failed to clear cached transactions for %{public}@", buf, 0x20u);
    }
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (BOOL)_includeFinishedConsumables
{
  if (sub_10001EFE8())
  {
    id v3 = (void *)CFPreferencesCopyAppValue(@"SKIncludeConsumableInAppPurchaseHistory", +[AppDefaultsManager kSKUserDefaultsIdentifier]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [(ReceiptManager *)self client];
      id v5 = [v4 callerBundleID];
      unsigned __int8 v6 = [v3 containsObject:v5];

      if (v6) {
        return 1;
      }
    }
    else
    {
    }
  }
  id v8 = [(ReceiptManager *)self client];
  BOOL v9 = [v8 callerBundleID];
  unsigned __int8 v10 = [(ReceiptManager *)self client];
  int v11 = [v10 requestBundleID];
  if ([v9 isEqualToString:v11])
  {

LABEL_9:
    uint64_t v15 = [(ReceiptManager *)self client];
    uint64_t v16 = [v15 callerBundleURL];
    uint64_t v17 = +[NSBundle bundleWithURL:v16];

    char v18 = [v17 infoDictionary];
    LOBYTE(v16) = objc_msgSend(v18, "tcr_BOOLForKey:", @"SKIncludeConsumableInAppPurchaseHistory");

    return (char)v16;
  }
  unsigned int v12 = [(ReceiptManager *)self client];
  id v13 = [v12 callerBundleID];
  unsigned __int8 v14 = [v13 hasSuffix:@".watchkitapp"];

  if (v14) {
    goto LABEL_9;
  }
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v19 = [(ReceiptManager *)self databaseStore];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000351A0;
  v21[3] = &unk_100357970;
  v21[4] = self;
  v21[5] = &v22;
  [v19 readUsingSession:v21];

  int v20 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v20 != 0;
}

- (void)_manualSyncWithLogKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10002DFD4;
  v19[4] = sub_10002DFE4;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_10002DFD4;
  void v17[4] = sub_10002DFE4;
  id v18 = 0;
  id v8 = [(ReceiptManager *)self databaseStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100035484;
  v16[3] = &unk_100357BC8;
  v16[4] = self;
  v16[5] = v19;
  v16[6] = v21;
  v16[7] = v17;
  [v8 readUsingSession:v16];

  [(ReceiptManager *)self clearTransactions];
  BOOL v9 = [(ReceiptManager *)self syncLock];
  [v9 lock];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035574;
  v11[3] = &unk_100357C40;
  v11[4] = self;
  id v13 = v21;
  unsigned __int8 v14 = v19;
  uint64_t v15 = v17;
  id v10 = v7;
  id v12 = v10;
  [(ReceiptManager *)self _syncTransactionsAndSubscriptionStatusWithReason:4 logKey:v6 completionHandler:v11];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
}

- (id)_configureMetricsEventWithBeforeTransactionCount:(unint64_t)a3 beforeTransactions:(id)a4 beforeStatuses:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10002DFD4;
  char v25 = sub_10002DFE4;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10002DFD4;
  id v19 = sub_10002DFE4;
  id v20 = 0;
  id v10 = [(ReceiptManager *)self databaseStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000358D8;
  v14[3] = &unk_100357BC8;
  v14[4] = self;
  v14[5] = &v21;
  void v14[6] = &v27;
  v14[7] = &v15;
  [v10 readUsingSession:v14];

  [(id)v22[5] minusSet:v8];
  [(id)v16[5] minusSet:v9];
  int v11 = objc_opt_new();
  [v11 setTransactionsCountDifference:v28[3] - a3];
  objc_msgSend(v11, "setModifiedOrAddedTransactionsCount:", objc_msgSend((id)v22[5], "count"));
  objc_msgSend(v11, "setModifiedOrAddedStatusesCount:", objc_msgSend((id)v16[5], "count"));
  id v12 = [(ReceiptManager *)self client];
  [v11 configureWithClient:v12];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v11;
}

- (BOOL)_resetLastUpdatedForLegacyTransactionsWithLogKey:(id)a3
{
  id v4 = a3;
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  id v5 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(ReceiptManager *)self client];
    id v8 = [v7 requestBundleID];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Invalidating pending transactions cache for %{public}@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 1;
  id v9 = [(ReceiptManager *)self databaseStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100035CA0;
  v15[3] = &unk_100357BF0;
  void v15[4] = self;
  void v15[5] = buf;
  [v9 modifyUsingTransaction:v15];

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    BOOL v10 = 1;
  }
  else
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    int v11 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(ReceiptManager *)self client];
      unsigned __int8 v14 = [v13 requestBundleID];
      *(_DWORD *)uint64_t v16 = 138543874;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@] Failed to invalidate cached transactions for %{public}@", v16, 0x20u);
    }
    BOOL v10 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }
  _Block_object_dispose(buf, 8);

  return v10;
}

- (BOOL)_setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 includesFinishedConsumables:(BOOL)a5 forRevision:(id)a6 logKey:(id)a7 containsSubscriptions:(BOOL *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  __int16 v18 = [(ReceiptManager *)self databaseStore];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100035EC4;
  v25[3] = &unk_100357C68;
  v31 = &v34;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  id v28 = self;
  id v21 = v17;
  id v29 = v21;
  id v32 = a8;
  id v22 = v16;
  id v30 = v22;
  BOOL v33 = a5;
  [v18 modifyUsingTransaction:v25];

  char v23 = *((unsigned char *)v35 + 24);
  _Block_object_dispose(&v34, 8);

  return v23;
}

- (void)_setUnfinishedForTransactionIDs:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ReceiptManager *)self databaseStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100036398;
  v11[3] = &unk_1003579C0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 modifyUsingTransaction:v11];
}

- (void)_checkTransactionAgeOnReadQueueForStatusWithGroupID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ReceiptManager *)self readQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000364F0;
  v11[3] = &unk_100357CB8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (BOOL)_needsSubscriptionStatusSyncForStatusDictionary:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"lastUpdated"];
  id v9 = [(ReceiptManager *)self client];
  id v10 = [v9 bag];

  int v11 = +[BagKey subscriptionStatusMaxAge];
  id v12 = [v10 integerForKey:v11];

  id v23 = 0;
  id v13 = [v12 valueWithError:&v23];
  id v14 = v23;
  if (v14)
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v15 = (void *)qword_10039F7B8;
    if (!os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v16 = v15;
    id v17 = [v6 objectForKeyedSubscript:@"subscriptionGroupIdentifier"];
    *(_DWORD *)buf = 138543874;
    id v25 = v7;
    __int16 v26 = 2114;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting max age for %{public}@ subscription status: %{public}@", buf, 0x20u);

LABEL_12:
LABEL_13:
    BOOL v21 = 0;
    goto LABEL_14;
  }
  [v13 doubleValue];
  id v16 = objc_msgSend(v8, "dateByAddingTimeInterval:");
  if ([v8 compare:v16] != (id)1) {
    goto LABEL_12;
  }
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  __int16 v18 = (void *)qword_10039F7B8;
  if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    id v20 = [v6 objectForKeyedSubscript:@"subscriptionGroupIdentifier"];
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2114;
    id v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcing subscription status sync for %{public}@ because lastUpdated is older than maxAge", buf, 0x16u);
  }
  BOOL v21 = 1;
LABEL_14:

  return v21;
}

- (void)_syncSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 != 2) {
    goto LABEL_5;
  }
  id v10 = [(ReceiptManager *)self client];
  unsigned int v11 = objc_msgSend(v10, "objc_clientType");

  if (v11 == 3) {
    goto LABEL_5;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int64_t v38 = (int64_t)sub_10002DFD4;
  BOOL v39 = sub_10002DFE4;
  id v40 = 0;
  id v12 = [(ReceiptManager *)self databaseStore];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100036E58;
  v32[3] = &unk_100357970;
  void v32[4] = self;
  void v32[5] = buf;
  [v12 readUsingSession:v32];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    _Block_object_dispose(buf, 8);

LABEL_5:
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v13 = (void *)qword_10039F7B8;
    if (os_log_type_enabled((os_log_t)qword_10039F7B8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      id v15 = [(ReceiptManager *)self client];
      id v16 = [v15 requestBundleID];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      int64_t v38 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting subscription status sync for %{public}@ reason %ld", buf, 0x20u);
    }
    id v17 = [LoadSubscriptionStatusTask alloc];
    __int16 v18 = [(ReceiptManager *)self client];
    id v19 = [(LoadSubscriptionStatusTask *)v17 initWithSubscriptionGroupID:0 reason:a3 client:v18];

    [(LoadSubscriptionStatusTask *)v19 setLogKey:v8];
    objc_initWeak((id *)buf, v19);
    uint64_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    __int16 v26 = sub_100036EF4;
    id v27 = &unk_100357B50;
    objc_copyWeak(&v31, (id *)buf);
    __int16 v28 = self;
    id v29 = v8;
    id v30 = v9;
    [(LoadSubscriptionStatusTask *)v19 setCompletionBlock:&v24];
    id v20 = [(ReceiptManager *)self syncQueue];
    [v20 addOperation:v19];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

    goto LABEL_10;
  }
  if (qword_10039F7D8 != -1) {
    dispatch_once(&qword_10039F7D8, &stru_100357DA0);
  }
  BOOL v21 = (id)qword_10039F7B8;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(ReceiptManager *)self client];
    id v23 = [v22 requestBundleID];
    *(_DWORD *)BOOL v33 = 138543618;
    id v34 = v8;
    __int16 v35 = 2114;
    uint64_t v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring subscription status sync from push notification for %{public}@ since the app has not queried status", v33, 0x16u);
  }
  (*((void (**)(id, void))v9 + 2))(v9, 0);
  _Block_object_dispose(buf, 8);

LABEL_10:
}

- (void)_syncTransactionsAndSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100037678;
  v10[3] = &unk_100357D30;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  int64_t v14 = a3;
  id v8 = v13;
  id v9 = v11;
  [(ReceiptManager *)self _syncTransactionsWithReason:a3 logKey:v9 completionHandler:v10];
}

- (void)_syncTransactionsWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v36 = 0;
  char v37 = &v36;
  uint64_t v38 = 0x3032000000;
  BOOL v39 = sub_10002DFD4;
  id v40 = sub_10002DFE4;
  id v41 = 0;
  id v10 = [(ReceiptManager *)self databaseStore];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100037D6C;
  v35[3] = &unk_100357970;
  v35[4] = self;
  v35[5] = &v36;
  [v10 readUsingSession:v35];

  if (a3 != 2
    || v37[5]
    || ([(ReceiptManager *)self client],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = objc_msgSend(v11, "objc_clientType") == 3,
        v11,
        v12))
  {
    BOOL v13 = [(ReceiptManager *)self _includeFinishedConsumables];
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    int64_t v14 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v37[5];
      id v16 = [(ReceiptManager *)self client];
      id v17 = [v16 requestBundleID];
      *(_DWORD *)buf = 138544130;
      id v43 = v8;
      __int16 v44 = 2048;
      int64_t v45 = a3;
      __int16 v46 = 2114;
      uint64_t v47 = v15;
      __int16 v48 = 2114;
      v49 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting receipt sync with reason %ld from revision %{public}@ for %{public}@", buf, 0x2Au);
    }
    __int16 v18 = [LoadInAppReceiptsTask alloc];
    uint64_t v19 = v37[5];
    id v20 = [(ReceiptManager *)self client];
    BOOL v21 = [(LoadInAppReceiptsTask *)v18 initWithLocalRevision:v19 reason:a3 includeFinishedConsumables:v13 client:v20];

    [(LoadInAppReceiptsTask *)v21 setLogKey:v8];
    objc_initWeak((id *)buf, v21);
    __int16 v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    __int16 v28 = sub_100037E08;
    id v29 = &unk_100357D80;
    objc_copyWeak(v33, (id *)buf);
    id v30 = self;
    BOOL v34 = v13;
    id v31 = v8;
    v33[1] = (id)a3;
    id v32 = v9;
    [(LoadInAppReceiptsTask *)v21 setCompletionBlock:&v26];
    id v22 = [(ReceiptManager *)self syncQueue];
    [v22 addOperation:v21];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_10039F7D8 != -1) {
      dispatch_once(&qword_10039F7D8, &stru_100357DA0);
    }
    id v23 = (id)qword_10039F7B8;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(ReceiptManager *)self client];
      uint64_t v25 = [v24 requestBundleID];
      *(_DWORD *)buf = 138543618;
      id v43 = v8;
      __int16 v44 = 2114;
      int64_t v45 = (int64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring transaction sync from push notification for %{public}@ since the app has not queried history", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
  _Block_object_dispose(&v36, 8);
}

- (_TtC9storekitd6Client)client
{
  return self->_client;
}

- (NSOperationQueue)readQueue
{
  return self->_readQueue;
}

- (NSLock)syncLock
{
  return self->_syncLock;
}

- (NSOperationQueue)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_syncLock, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_destroyWeak((id *)&self->_databaseStore);
}

@end