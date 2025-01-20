@interface LoadUnfinishedInAppTransactionsTask
+ (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3 bundleID:(id)a4 logKey:(id)a5;
+ (BOOL)invalidateCacheForBundleID:(id)a3 withLogKey:(id)a4;
+ (id)_newDataStore;
- (BOOL)_cacheLegacyTransactions:(id)a3 inDataStore:(id)a4;
- (BOOL)_ignoreHasEverHadIAPsWithBag:(id)a3;
- (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3;
- (BOOL)_shouldCheckServerQueueWithDataStore:(id)a3 bag:(id)a4;
- (BOOL)forceServerCheck;
- (LoadUnfinishedInAppTransactionsTask)initWithClient:(id)a3;
- (NSArray)transactions;
- (NSString)logKey;
- (NSURL)receiptInstallURL;
- (_TtC9storekitd6Client)client;
- (id)_cachedLegacyTransactionsFromDataStore:(id)a3 error:(id *)a4;
- (id)_checkServerQueueAndCacheTransactionsWithDataStore:(id)a3 bag:(id)a4 error:(id *)a5;
- (id)_pendingTransactionsResponseWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6;
- (id)_transactionsFromQueueCheckWithBag:(id)a3 error:(id *)a4;
- (int64_t)_pendingTransactionsCountWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6;
- (void)_fromDataStore:(id)a3 getCachedAccountToken:(id *)a4 lastUpdated:(id *)a5;
- (void)main;
- (void)setForceServerCheck:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setReceiptInstallURL:(id)a3;
@end

@implementation LoadUnfinishedInAppTransactionsTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_receiptInstallURL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);

  objc_storeStrong((id *)(&self->_forceServerCheck + 2), 0);
}

+ (id)_newDataStore
{
  v2 = [InAppReceiptDatabaseStore alloc];
  v3 = +[Environment sharedInstance];
  v4 = [v3 userDatabase];
  v5 = [(SQLiteDatabaseStore *)v2 initWithDatabase:v4];

  return v5;
}

- (LoadUnfinishedInAppTransactionsTask)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LoadUnfinishedInAppTransactionsTask;
  v6 = [(Task *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 50), a3);
    uint64_t v8 = +[NSUUID lib_shortLogKey];
    v9 = *(void **)(v7 + 58);
    *(void *)(v7 + 58) = v8;

    v7[42] = 0;
  }

  return (LoadUnfinishedInAppTransactionsTask *)v7;
}

- (void)main
{
  id v3 = +[LoadUnfinishedInAppTransactionsTask _newDataStore];
  v4 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  id v5 = [v4 bag];

  v6 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  v7 = [v6 currentAccountToken];
  if (v7)
  {
  }
  else
  {
    uint64_t v8 = [(LoadUnfinishedInAppTransactionsTask *)self client];
    unsigned int v9 = objc_msgSend(v8, "objc_clientType");

    if (v9 != 3)
    {
      if (qword_10039FF88 != -1) {
        dispatch_once(&qword_10039FF88, &stru_100359820);
      }
      v24 = (void *)qword_10039FF68;
      if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Ignoring pending transaction queue check because there is no account", buf, 0x16u);
      }
      v27 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
      *(NSURL **)((char *)&self->_receiptInstallURL + 2) = (NSURL *)&__NSArray0__struct;

      goto LABEL_38;
    }
  }
  if ([(LoadUnfinishedInAppTransactionsTask *)self _shouldCheckServerQueueWithDataStore:v3 bag:v5])
  {
    id v36 = 0;
    v10 = [(LoadUnfinishedInAppTransactionsTask *)self _checkServerQueueAndCacheTransactionsWithDataStore:v3 bag:v5 error:&v36];
    id v11 = v36;
    v12 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
    *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v10;

    if (v11)
    {
      id v35 = 0;
      [(LoadUnfinishedInAppTransactionsTask *)self _fromDataStore:v3 getCachedAccountToken:&v35 lastUpdated:0];
      id v13 = v35;
      if (v13
        && ([(LoadUnfinishedInAppTransactionsTask *)self client],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v14 currentAccountToken],
            v15 = objc_claimAutoreleasedReturnValue(),
            unsigned int v16 = [v13 isEqualToString:v15],
            v15,
            v14,
            v16))
      {
        if (qword_10039FF88 != -1) {
          dispatch_once(&qword_10039FF88, &stru_100359820);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
          sub_1002C71C0();
        }
        id v34 = v11;
        v17 = [(LoadUnfinishedInAppTransactionsTask *)self _cachedLegacyTransactionsFromDataStore:v3 error:&v34];
        id v18 = v34;

        v19 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
        *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v17;

        id v11 = v18;
      }
      else
      {
        if (qword_10039FF88 != -1) {
          dispatch_once(&qword_10039FF88, &stru_100359820);
        }
        if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
          sub_1002C7128();
        }
      }
      goto LABEL_28;
    }
LABEL_34:
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    v28 = (void *)qword_10039FF68;
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
      id v31 = [*(id *)((char *)&self->_receiptInstallURL + 2) count];
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v30;
      __int16 v41 = 2048;
      id v42 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Finished loading %lu pending transactions", buf, 0x20u);
    }
LABEL_38:
    [(AsyncTask *)self completeWithSuccess];
    goto LABEL_39;
  }
  id v33 = 0;
  v20 = [(LoadUnfinishedInAppTransactionsTask *)self _cachedLegacyTransactionsFromDataStore:v3 error:&v33];
  id v21 = v33;
  v22 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
  *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v20;

  if (!v21) {
    goto LABEL_34;
  }
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
    sub_1002C7258();
  }
  id v32 = v21;
  v23 = [(LoadUnfinishedInAppTransactionsTask *)self _checkServerQueueAndCacheTransactionsWithDataStore:v3 bag:v5 error:&v32];
  id v11 = v32;

  id v13 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
  *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v23;
LABEL_28:

  if (!v11) {
    goto LABEL_34;
  }
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
    sub_1002C7090();
  }
  [(AsyncTask *)self completeWithError:v11];

LABEL_39:
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)(&self->_forceServerCheck + 2);
}

- (NSArray)transactions
{
  return *(NSArray **)((char *)&self->_receiptInstallURL + 2);
}

- (void)setForceServerCheck:(BOOL)a3
{
  *(&self->super._finished + 1) = a3;
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_client + 2);
}

+ (BOOL)invalidateCacheForBundleID:(id)a3 withLogKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _newDataStore];
  LOBYTE(a1) = [a1 _invalidateLegacyTransactionCacheInDataStore:v8 bundleID:v7 logKey:v6];

  return (char)a1;
}

- (BOOL)_shouldCheckServerQueueWithDataStore:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  unsigned int v9 = objc_msgSend(v8, "objc_clientType");

  if (v9 == 3)
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    v10 = (void *)qword_10039FF68;
    if (!os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v11 = v10;
    v12 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    id v42 = self;
    __int16 v43 = 2114;
    v44 = v12;
    id v13 = "[%{public}@][%{public}@]: Checking pending transaction queue for Xcode test environment";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

LABEL_12:
    BOOL v15 = 1;
    goto LABEL_42;
  }
  if ([(LoadUnfinishedInAppTransactionsTask *)self forceServerCheck])
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    v14 = (void *)qword_10039FF68;
    if (!os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v11 = v14;
    v12 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    id v42 = self;
    __int16 v43 = 2114;
    v44 = v12;
    id v13 = "[%{public}@][%{public}@]: Forcing pending transaction queue check";
    goto LABEL_11;
  }
  unsigned int v16 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  if ([v16 hasEverHadIAPs])
  {
  }
  else
  {
    unsigned __int8 v17 = [(LoadUnfinishedInAppTransactionsTask *)self _ignoreHasEverHadIAPsWithBag:v7];

    if ((v17 & 1) == 0)
    {
      BOOL v15 = 0;
      goto LABEL_42;
    }
  }
  id v39 = 0;
  id v40 = 0;
  [(LoadUnfinishedInAppTransactionsTask *)self _fromDataStore:v6 getCachedAccountToken:&v40 lastUpdated:&v39];
  id v18 = v40;
  id v19 = v39;
  if (v18
    && ([(LoadUnfinishedInAppTransactionsTask *)self client],
        v20 = objc_claimAutoreleasedReturnValue(),
        [v20 currentAccountToken],
        id v21 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v22 = [v21 isEqualToString:v18],
        v21,
        v20,
        (v22 & 1) != 0))
  {
    v23 = +[BagKey transactionReceiptsMaxAge];
    v24 = [v7 integerForKey:v23];

    id v38 = 0;
    v25 = [v24 valueWithError:&v38];
    id v26 = v38;
    if (v26)
    {
      if (qword_10039FF88 != -1) {
        dispatch_once(&qword_10039FF88, &stru_100359820);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
        sub_1002C72F0();
      }
      BOOL v15 = 0;
    }
    else
    {
      v30 = v19;
      if (!v19)
      {
        v30 = +[NSDate distantPast];
      }
      objc_msgSend(v25, "doubleValue", v25);
      id v31 = objc_msgSend(v30, "dateByAddingTimeInterval:");
      if (!v19) {

      }
      id v32 = +[NSDate now];
      id v33 = [v32 compare:v31];

      if (v33 == (id)1)
      {
        id v34 = sub_10006D2F4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
          *(_DWORD *)buf = 138543618;
          id v42 = self;
          __int16 v43 = 2114;
          v44 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Checking pending transaction queue because lastUpdated is older than maxAge", buf, 0x16u);
        }
        BOOL v15 = 1;
      }
      else
      {

        BOOL v15 = 0;
      }
      v25 = v37;
    }
  }
  else
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    v27 = (void *)qword_10039FF68;
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      id v42 = self;
      __int16 v43 = 2114;
      v44 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Checking pending transaction queue because the tokens don't match", buf, 0x16u);
    }
    BOOL v15 = 1;
  }

LABEL_42:
  return v15;
}

- (BOOL)_ignoreHasEverHadIAPsWithBag:(id)a3
{
  id v4 = a3;
  id v5 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  unsigned __int8 v6 = [v5 hasEverHadIAPs];

  if ((v6 & 1) == 0)
  {
    id v8 = +[BagKey ignoreIAPQueueCheckSuppression];
    unsigned int v9 = [v4 BOOLForKey:v8];

    id v18 = 0;
    v10 = [v9 valueWithError:&v18];
    id v11 = v18;
    unsigned int v7 = [v10 BOOLValue];

    if (v11)
    {
      if (qword_10039FF88 != -1) {
        dispatch_once(&qword_10039FF88, &stru_100359820);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
        sub_1002C7388();
      }
    }
    else
    {
      if (v7)
      {
        if (qword_10039FF88 != -1) {
          dispatch_once(&qword_10039FF88, &stru_100359820);
        }
        v12 = (void *)qword_10039FF68;
        if (!os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v13 = v12;
        v14 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        v20 = self;
        __int16 v21 = 2114;
        unsigned __int8 v22 = v14;
        BOOL v15 = "[%{public}@][%{public}@]: Allowing pending transaction queue check for client with no history of IAPs";
      }
      else
      {
        if (qword_10039FF88 != -1) {
          dispatch_once(&qword_10039FF88, &stru_100359820);
        }
        unsigned int v16 = (void *)qword_10039FF68;
        if (!os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v13 = v16;
        v14 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
        *(_DWORD *)buf = 138543618;
        v20 = self;
        __int16 v21 = 2114;
        unsigned __int8 v22 = v14;
        BOOL v15 = "[%{public}@][%{public}@]: Ignoring pending transaction queue check for client with no history of IAPs";
      }
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
    }
LABEL_18:

    goto LABEL_19;
  }
  LOBYTE(v7) = 0;
LABEL_19:

  return v7;
}

- (id)_checkServerQueueAndCacheTransactionsWithDataStore:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v18 = 0;
  id v8 = a3;
  unsigned int v9 = [(LoadUnfinishedInAppTransactionsTask *)self _transactionsFromQueueCheckWithBag:a4 error:&v18];
  id v10 = v18;
  id v11 = v10;
  if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
      sub_1002C7420();
    }
    [(LoadUnfinishedInAppTransactionsTask *)self _invalidateLegacyTransactionCacheInDataStore:v8];

    id v12 = 0;
  }
  else
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    id v13 = (void *)qword_10039FF68;
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      BOOL v15 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
      id v16 = [v9 count];
      *(_DWORD *)buf = 138543874;
      v20 = self;
      __int16 v21 = 2114;
      unsigned __int8 v22 = v15;
      __int16 v23 = 2048;
      id v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Found %lu pending transactions in the queue", buf, 0x20u);
    }
    [(LoadUnfinishedInAppTransactionsTask *)self _cacheLegacyTransactions:v9 inDataStore:v8];

    id v12 = v9;
  }

  return v12;
}

- (id)_transactionsFromQueueCheckWithBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  unsigned int v7 = (void *)qword_10039FF68;
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v9 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
    *(_DWORD *)buf = 138543362;
    v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting server purchase queue check", buf, 0xCu);
  }
  id v10 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  id v11 = [v10 urlRequestEncoder];

  id v12 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
  [v11 setLogUUID:v12];

  id v13 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  v14 = [(LoadUnfinishedInAppTransactionsTask *)self receiptInstallURL];
  [v13 queryWith:1 customReceiptURL:v14];
  BOOL v15 = v45 = self;
  id v16 = [v15 mutableCopy];

  unsigned __int8 v17 = self;
  id v47 = 0;
  int64_t v18 = [(LoadUnfinishedInAppTransactionsTask *)self _pendingTransactionsCountWithParameters:v16 requestEncoder:v11 bag:v6 error:&v47];
  id v19 = v47;
  if (v19)
  {
    id v20 = v19;
    if (a4)
    {
      id v20 = v19;
      id v21 = 0;
      *a4 = v20;
    }
    else
    {
      id v21 = 0;
    }
    goto LABEL_37;
  }
  v44 = +[NSMutableArray arrayWithCapacity:v18];
  if ((unint64_t)(v18 - 1) > 0x7FFFFFFFFFFFFFFDLL) {
    goto LABEL_29;
  }
  __int16 v43 = a4;
  unsigned __int8 v22 = +[NSMutableArray array];
  id v42 = v16;
  id v23 = [v16 mutableCopy];
  id v24 = 0;
  while (1)
  {
    if (![v22 count])
    {
      [v23 setObject:0 forKeyedSubscript:@"startId"];
      [v23 setObject:0 forKeyedSubscript:@"endId"];
      goto LABEL_14;
    }
    v25 = [v22 objectAtIndexedSubscript:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    [v23 addEntriesFromDictionary:v25];
    [v22 removeObjectAtIndex:0];

LABEL_14:
    id v46 = v24;
    id v26 = [(LoadUnfinishedInAppTransactionsTask *)v17 _pendingTransactionsResponseWithParameters:v23 requestEncoder:v11 bag:v6 error:&v46];
    id v20 = v46;

    if (v26)
    {
      v27 = v11;
      id v28 = v6;
      v29 = [(LoadUnfinishedInAppTransactionsTask *)v17 client];
      uint64_t v30 = [(LoadUnfinishedInAppTransactionsTask *)v17 receiptInstallURL];
      id v31 = v17;
      id v32 = (void *)v30;
      id v33 = [(LoadUnfinishedInAppTransactionsTask *)v31 logKey];
      id v34 = sub_100046630(v26, v29, v32, 1, v33, 0, 0);

      [v44 addObjectsFromArray:v34];
      id v35 = objc_msgSend(v26, "tcr_arrayForKey:", @"more");
      if ([v35 count]) {
        [v22 addObjectsFromArray:v35];
      }

      id v6 = v28;
      id v11 = v27;
      unsigned __int8 v17 = v45;
    }

    id v24 = v20;
    if (![v22 count]) {
      goto LABEL_26;
    }
  }
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
    sub_1002C74B8();
  }

  id v20 = v24;
LABEL_26:

  id v16 = v42;
  if (v20)
  {
    if (v43)
    {
      id v20 = v20;
      id v21 = 0;
      *__int16 v43 = v20;
    }
    else
    {
      id v21 = 0;
    }
    id v36 = v44;
    goto LABEL_36;
  }
LABEL_29:
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  id v36 = v44;
  v37 = (void *)qword_10039FF68;
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = v37;
    id v39 = [(LoadUnfinishedInAppTransactionsTask *)v17 logKey];
    id v40 = [v44 count];
    *(_DWORD *)buf = 138543618;
    v49 = v39;
    __int16 v50 = 2048;
    id v51 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %lu transactions in pending queue", buf, 0x16u);
  }
  id v21 = [v44 copy];
  id v20 = 0;
LABEL_36:

LABEL_37:

  return v21;
}

- (int64_t)_pendingTransactionsCountWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[BagKey pendingTransactionsCountURL];
  v14 = [v10 URLForKey:v13];

  BOOL v15 = [v11 requestWithMethod:4 bagURL:v14 parameters:v12];

  id v29 = 0;
  id v16 = [v15 resultWithError:&v29];
  id v17 = v29;
  if (v17)
  {
    int64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
      sub_1002C75E8();
    }
    int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v20 = [(LoadUnfinishedInAppTransactionsTask *)self client];
    id v21 = [v20 urlSession];

    unsigned __int8 v22 = [v21 dataTaskPromiseWithRequest:v16];
    id v28 = 0;
    id v23 = [v22 resultWithError:&v28];
    id v24 = v28;
    int64_t v18 = v24;
    if (v24)
    {
      if (a6) {
        *a6 = v24;
      }
      if (qword_10039FF88 != -1) {
        dispatch_once(&qword_10039FF88, &stru_100359820);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
        sub_1002C7550();
      }
      int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v25 = [v23 object];
      id v26 = [v25 objectForKeyedSubscript:@"download-queue-item-count"];
      int64_t v19 = (int64_t)[v26 integerValue];
    }
  }

  return v19;
}

- (id)_pendingTransactionsResponseWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[BagKey pendingTransactionsURL];
  v14 = [v10 URLForKey:v13];

  BOOL v15 = [v11 requestWithMethod:4 bagURL:v14 parameters:v12];

  id v27 = 0;
  id v16 = [v15 resultWithError:&v27];
  id v17 = v27;
  if (v17)
  {
    int64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
      sub_1002C7718();
    }
    int64_t v19 = 0;
  }
  else
  {
    id v20 = [(LoadUnfinishedInAppTransactionsTask *)self client];
    id v21 = [v20 urlSession];

    unsigned __int8 v22 = [v21 dataTaskPromiseWithRequest:v16];
    id v26 = 0;
    id v23 = [v22 resultWithError:&v26];
    id v24 = v26;
    int64_t v18 = v24;
    if (v24)
    {
      if (a6) {
        *a6 = v24;
      }
      if (qword_10039FF88 != -1) {
        dispatch_once(&qword_10039FF88, &stru_100359820);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR)) {
        sub_1002C7680();
      }
      int64_t v19 = 0;
    }
    else
    {
      int64_t v19 = [v23 object];
    }
  }

  return v19;
}

- (void)_fromDataStore:(id)a3 getCachedAccountToken:(id *)a4 lastUpdated:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int64_t v19 = sub_10006E8C8;
  id v20 = sub_10006E8D8;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10006E8C8;
  v14 = sub_10006E8D8;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006E8E0;
  v9[3] = &unk_1003597D8;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  [v8 readUsingSession:v9];
  if (a4) {
    *a4 = (id) v17[5];
  }
  if (a5) {
    *a5 = (id) v11[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

- (id)_cachedLegacyTransactionsFromDataStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  unsigned int v7 = (void *)qword_10039FF68;
  if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v9 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Checking pending transactions cache", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v29 = sub_10006E8C8;
  uint64_t v30 = sub_10006E8D8;
  id v31 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int64_t v19 = sub_10006E8C8;
  id v20 = sub_10006E8D8;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006ECE8;
  v15[3] = &unk_1003597D8;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = &v16;
  [v6 readUsingSession:v15];
  if (a4) {
    *a4 = (id) v17[5];
  }
  if (qword_10039FF88 != -1) {
    dispatch_once(&qword_10039FF88, &stru_100359820);
  }
  uint64_t v10 = (id)qword_10039FF68;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
    id v12 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)unsigned __int8 v22 = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2048;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Found %lu cached pending transactions", v22, 0x20u);
  }
  id v13 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);

  return v13;
}

- (BOOL)_cacheLegacyTransactions:(id)a3 inDataStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006EFF0;
  v15[3] = &unk_100359800;
  id v17 = &v18;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  [v7 modifyUsingTransaction:v15];
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    uint64_t v10 = (id)qword_10039FF68;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
      id v13 = [(LoadUnfinishedInAppTransactionsTask *)self client];
      v14 = [v13 requestBundleID];
      *(_DWORD *)buf = 138543874;
      id v23 = self;
      __int16 v24 = 2114;
      v25 = v12;
      __int16 v26 = 2114;
      id v27 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Failed to cache pending transactions for %{public}@", buf, 0x20u);
    }
    BOOL v9 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3
{
  id v4 = a3;
  id v5 = [(LoadUnfinishedInAppTransactionsTask *)self client];
  id v6 = [v5 requestBundleID];
  id v7 = [(LoadUnfinishedInAppTransactionsTask *)self logKey];
  BOOL v8 = +[LoadUnfinishedInAppTransactionsTask _invalidateLegacyTransactionCacheInDataStore:v4 bundleID:v6 logKey:v7];

  return v8;
}

+ (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3 bundleID:(id)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006F3F0;
  v15[3] = &unk_100357BF0;
  id v17 = &v18;
  id v11 = v9;
  id v16 = v11;
  [v8 modifyUsingTransaction:v15];
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v12 = 1;
  }
  else
  {
    if (qword_10039FF88 != -1) {
      dispatch_once(&qword_10039FF88, &stru_100359820);
    }
    id v13 = qword_10039FF68;
    if (os_log_type_enabled((os_log_t)qword_10039FF68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = a1;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Failed to mark pending transactions cache stale for %{public}@", buf, 0x20u);
    }
    BOOL v12 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)setLogKey:(id)a3
{
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)((char *)&self->_logKey + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (BOOL)forceServerCheck
{
  return *(&self->super._finished + 1);
}

@end