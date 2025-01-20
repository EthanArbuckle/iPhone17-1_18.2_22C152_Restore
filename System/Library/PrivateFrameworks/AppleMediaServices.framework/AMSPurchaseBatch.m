@interface AMSPurchaseBatch
- (AMSMutableLazyPromise)promise;
- (AMSPurchaseBatch)initWithPurchases:(id)a3 weakPromise:(id)a4;
- (BOOL)finishPurchase:(id)a3 withError:(id)a4;
- (BOOL)finishPurchase:(id)a3 withResult:(id)a4;
- (BOOL)isComplete;
- (NSLock)lock;
- (NSMutableArray)purchases;
- (NSMutableArray)results;
- (NSMutableArray)returnedPurchaseIDs;
- (NSMutableDictionary)purchaseMap;
- (id)nextPurchase;
- (id)purchaseForPurchaseId:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setLock:(id)a3;
@end

@implementation AMSPurchaseBatch

- (AMSPurchaseBatch)initWithPurchases:(id)a3 weakPromise:(id)a4
{
  NSMutableArray *returnedPurchaseIDs;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  objc_super v32;
  unsigned char v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AMSPurchaseBatch;
  v8 = [(AMSPurchaseBatch *)&v32 init];
  if (v8)
  {
    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v8->_lock;
    v8->_lock = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v8->_results;
    v8->_results = v11;

    objc_storeStrong((id *)&v8->_promise, a4);
    uint64_t v13 = [v6 mutableCopy];
    purchases = v8->_purchases;
    v8->_purchases = (NSMutableArray *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    purchaseMap = v8->_purchaseMap;
    v8->_purchaseMap = v15;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v8->_purchases;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v23 = v8->_purchaseMap;
          v24 = objc_msgSend(v22, "uniqueIdentifier", (void)v28);
          [(NSMutableDictionary *)v23 setObject:v22 forKey:v24];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v19);
    }

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    returnedPurchaseIDs = v8->_returnedPurchaseIDs;
    v8->_returnedPurchaseIDs = v25;
  }
  return v8;
}

- (id)purchaseForPurchaseId:(id)a3
{
  id v4 = a3;
  v5 = [(AMSPurchaseBatch *)self lock];
  [v5 lock];

  id v6 = [(NSMutableDictionary *)self->_purchaseMap objectForKey:v4];

  id v7 = [(AMSPurchaseBatch *)self lock];
  [v7 unlock];

  return v6;
}

- (BOOL)finishPurchase:(id)a3 withError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v6 logUUID];
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished purchase with error: %{public}@", buf, 0x16u);
    }
    v11 = [(AMSPurchaseBatch *)self lock];
    [v11 lock];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_purchases;
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = objc_alloc_init(AMSPurchaseResult);
          [(AMSPurchaseResult *)v17 setError:v7];
          [(NSMutableArray *)self->_results addObject:v17];
          uint64_t v18 = +[AMSLogConfig sharedConfig];
          if (!v18)
          {
            uint64_t v18 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v19 = [v18 OSLogObject];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [v16 logUUID];
            *(_DWORD *)buf = 138543618;
            v30 = v20;
            __int16 v31 = 2114;
            id v32 = v7;
            _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished batch item purchase with error: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    [(NSMutableArray *)self->_purchases removeAllObjects];
    [(NSMutableDictionary *)self->_purchaseMap removeAllObjects];
    [(AMSMutableLazyPromise *)self->_promise finishWithError:v7];
    self->_isComplete = 1;
    v21 = [(AMSPurchaseBatch *)self lock];
    [v21 unlock];
  }
  return v6 != 0;
}

- (BOOL)finishPurchase:(id)a3 withResult:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSMutableArray *)a4;
  if (v6)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v6 logUUID];
      int v20 = 138543618;
      v21 = v10;
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished purchase with result: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    v11 = [(AMSPurchaseBatch *)self lock];
    [v11 lock];

    [(NSMutableArray *)self->_results addObject:v7];
    [(NSMutableArray *)self->_purchases removeObject:v6];
    purchaseMap = self->_purchaseMap;
    uint64_t v13 = [v6 uniqueIdentifier];
    [(NSMutableDictionary *)purchaseMap removeObjectForKey:v13];

    if (![(NSMutableArray *)self->_purchases count])
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        uint64_t v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v6 logUUID];
        results = self->_results;
        int v20 = 138543618;
        v21 = v16;
        __int16 v22 = 2114;
        v23 = results;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished promise with results: %{public}@", (uint8_t *)&v20, 0x16u);
      }
      [(AMSMutableLazyPromise *)self->_promise finishWithResult:self->_results];
      self->_isComplete = 1;
    }
    uint64_t v18 = [(AMSPurchaseBatch *)self lock];
    [v18 unlock];
  }
  return v6 != 0;
}

- (id)nextPurchase
{
  v3 = [(AMSPurchaseBatch *)self lock];
  [v3 lock];

  id v4 = [(AMSPurchaseBatch *)self purchases];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__AMSPurchaseBatch_nextPurchase__block_invoke;
  v10[3] = &unk_1E55A5990;
  v10[4] = self;
  v5 = objc_msgSend(v4, "ams_firstObjectPassingTest:", v10);

  if (v5)
  {
    id v6 = [(AMSPurchaseBatch *)self returnedPurchaseIDs];
    id v7 = [v5 uniqueIdentifier];
    [v6 addObject:v7];
  }
  v8 = [(AMSPurchaseBatch *)self lock];
  [v8 unlock];

  return v5;
}

uint64_t __32__AMSPurchaseBatch_nextPurchase__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 returnedPurchaseIDs];
  v5 = [v3 uniqueIdentifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (AMSMutableLazyPromise)promise
{
  return self->_promise;
}

- (NSMutableArray)purchases
{
  return self->_purchases;
}

- (NSMutableDictionary)purchaseMap
{
  return self->_purchaseMap;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableArray)returnedPurchaseIDs
{
  return self->_returnedPurchaseIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedPurchaseIDs, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_purchaseMap, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end