@interface AMSTelephonyDataCache
+ (id)sharedCache;
- (AMSTelephonyDataCache)initWithClientClass:(Class)a3;
- (AMSTelephonyDataCache)initWithTelephonyClient:(id)a3 queue:(id)a4;
- (CTXPCContexts)activeContexts;
- (CoreTelephonyClient)client;
- (NSArray)carrierNames;
- (OS_dispatch_queue)queue;
- (id)carrierNamesPromise;
- (id)carrierNamesWithError:(id *)a3;
- (void)_clearCaches:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)phoneNumberChanged:(id)a3;
- (void)setClient:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AMSTelephonyDataCache

+ (id)sharedCache
{
  if (_MergedGlobals_147 != -1) {
    dispatch_once(&_MergedGlobals_147, &__block_literal_global_128);
  }
  v2 = (void *)qword_1EB38DFD8;
  return v2;
}

uint64_t __36__AMSTelephonyDataCache_sharedCache__block_invoke()
{
  qword_1EB38DFD8 = [[AMSTelephonyDataCache alloc] initWithClientClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

- (AMSTelephonyDataCache)initWithClientClass:(Class)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.AppleMediaServices.CoreTelephonyDataCache", v5);

  v7 = (void *)[[a3 alloc] initWithQueue:v6];
  v8 = [(AMSTelephonyDataCache *)self initWithTelephonyClient:v7 queue:v6];

  return v8;
}

- (AMSTelephonyDataCache)initWithTelephonyClient:(id)a3 queue:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v21 = v9;
    v12 = AMSLogKey();
    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v12)
    {
      uint64_t v4 = AMSLogKey();
      [v13 stringWithFormat:@"%@: [%@] ", v15, v4];
    }
    else
    {
      [v13 stringWithFormat:@"%@: ", v14];
    v16 = };
    *(_DWORD *)buf = 138543362;
    v24 = v16;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating a new telephony data cache.", buf, 0xCu);
    if (v12)
    {

      v16 = (void *)v4;
    }

    id v9 = v21;
  }

  v22.receiver = self;
  v22.super_class = (Class)AMSTelephonyDataCache;
  v17 = [(AMSTelephonyDataCache *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_client, a3);
    [v8 setDelegate:v18];
    objc_storeStrong((id *)&v18->_queue, a4);
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v18 selector:sel__clearCaches_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  }
  return v18;
}

- (CTXPCContexts)activeContexts
{
  v3 = [(AMSTelephonyDataCache *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__66;
  v12 = __Block_byref_object_dispose__66;
  id v13 = 0;
  uint64_t v4 = [(AMSTelephonyDataCache *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AMSTelephonyDataCache_activeContexts__block_invoke;
  v7[3] = &unk_1E55A30A0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CTXPCContexts *)v5;
}

void __39__AMSTelephonyDataCache_activeContexts__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    dispatch_queue_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = AMSLogKey();
      uint64_t v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        uint64_t v1 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v10, v1];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      v2 = };
      *(_DWORD *)buf = 138543362;
      v36 = v2;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching active contexts.", buf, 0xCu);
      if (v7)
      {

        v2 = (void *)v1;
      }
    }
    v11 = [*(id *)(a1 + 32) client];
    id v34 = 0;
    uint64_t v12 = [v11 getActiveContexts:&v34];
    id v13 = v34;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 8);
    *(void *)(v14 + 8) = v12;

    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v17 = +[AMSLogConfig sharedConfig];
    v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = AMSLogKey();
        id v21 = NSString;
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = v22;
        if (v20)
        {
          v2 = AMSLogKey();
          [v21 stringWithFormat:@"%@: [%@] ", v23, v2];
        }
        else
        {
          [v21 stringWithFormat:@"%@: ", v22];
        v24 = };
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched active contexts.", buf, 0xCu);
        if (v20)
        {

          v24 = v2;
        }
      }
    }
    else
    {
      if (!v17)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = AMSLogKey();
        v26 = NSString;
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = v27;
        if (v25)
        {
          v2 = AMSLogKey();
          [v26 stringWithFormat:@"%@: [%@] ", v28, v2];
        }
        else
        {
          [v26 stringWithFormat:@"%@: ", v27];
        v29 = };
        v30 = AMSLogableError(v13);
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        __int16 v37 = 2114;
        v38 = v30;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@An error occurred fetching active contexts. error = %{public}@", buf, 0x16u);
        if (v25)
        {

          v29 = v2;
        }
      }
    }

    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  uint64_t v31 = [v4 copy];
  uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
  v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v31;
}

- (NSArray)carrierNames
{
  return (NSArray *)[(AMSTelephonyDataCache *)self carrierNamesWithError:0];
}

- (id)carrierNamesWithError:(id *)a3
{
  uint64_t v4 = (uint64_t)self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSTelephonyDataCache *)self client];
  id v26 = 0;
  dispatch_queue_t v6 = [v5 getSubscriptionInfoWithError:&v26];
  id v7 = v26;

  if (v6 || !v7)
  {
    if (v6)
    {
      uint64_t v15 = [v6 subscriptionsInUse];
      if ([v15 count])
      {
        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __47__AMSTelephonyDataCache_carrierNamesWithError___block_invoke;
        v24[3] = &unk_1E55A7048;
        v24[4] = v4;
        id v17 = v16;
        id v25 = v17;
        v18 = objc_msgSend(v15, "ams_mapWithTransformIgnoresNil:", v24);
        uint64_t v19 = [v17 count];
        if (v19 == [v15 count])
        {
          if (a3)
          {
            v20 = (void *)[v17 copy];
            AMSErrorWithMultipleUnderlyingErrors(15, @"Error fetching carrier names", 0, v20);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v21 = 0;
        }
        else
        {
          id v21 = v18;
        }
      }
      else
      {
        id v21 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v21 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = AMSLogKey();
      v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        uint64_t v4 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, v4];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      uint64_t v14 = };
      uint64_t v22 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v14;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching subscription info: %{public}@", buf, 0x16u);
      if (v10)
      {

        uint64_t v14 = (void *)v4;
      }
    }
    id v21 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v21;
}

id __47__AMSTelephonyDataCache_carrierNamesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  dispatch_queue_t v6 = [v4 client];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
  id v30 = 0;
  uint64_t v8 = (void *)[v6 copyCarrierBundleValue:v5 key:@"CarrierName" bundleType:v7 error:&v30];

  id v9 = v30;
  if (v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        uint64_t v2 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, v2];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      uint64_t v16 = };
      id v25 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      id v34 = v25;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error copying carrier name: %{public}@", buf, 0x16u);
      if (v12)
      {

        uint64_t v16 = (void *)v2;
      }
    }
    [*(id *)(v3 + 40) addObject:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v8;
      goto LABEL_25;
    }
    v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = AMSLogKey();
      id v21 = NSString;
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = v22;
      if (v20)
      {
        uint64_t v3 = AMSLogKey();
        [v21 stringWithFormat:@"%@: [%@] ", v23, v3];
      }
      else
      {
        [v21 stringWithFormat:@"%@: ", v22];
      v24 = };
      id v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      uint64_t v28 = AMSHashIfNeeded(v27);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v24;
      __int16 v33 = 2114;
      id v34 = v28;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error copying carrier name. Expected an NSString, got %{public}@", buf, 0x16u);

      if (v20)
      {

        v24 = (void *)v3;
      }
    }
  }
  id v17 = 0;
LABEL_25:

  return v17;
}

- (id)carrierNamesPromise
{
  uint64_t v3 = objc_alloc_init(AMSPromise);
  uint64_t v4 = [(AMSTelephonyDataCache *)self client];
  id v5 = [(AMSPromise *)v3 completionHandlerAdapter];
  [v4 getSubscriptionInfo:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke;
  v8[3] = &unk_1E55A70C0;
  v8[4] = self;
  dispatch_queue_t v6 = [(AMSPromise *)v3 thenWithBlock:v8];

  return v6;
}

id __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 subscriptionsInUse];
  uint64_t v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_2;
    v8[3] = &unk_1E55A7098;
    v8[4] = *(void *)(a1 + 32);
    id v5 = objc_msgSend(v3, "ams_mapWithTransform:", v8);
    dispatch_queue_t v6 = +[AMSPromise promiseWithSome:v5];
  }
  else
  {
    dispatch_queue_t v6 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

AMSMutablePromise *__44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) client];
  dispatch_queue_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_3;
  v9[3] = &unk_1E55A7070;
  id v7 = v4;
  uint64_t v10 = v7;
  [v5 copyCarrierBundleValue:v3 key:@"CarrierName" bundleType:v6 completion:v9];

  return v7;
}

void __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 finishWithResult:v7];
      goto LABEL_6;
    }
  }
  else
  {

    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v9 = AMSError(7, @"Carrier Name Not Found", @"Did not receive a carrier name.", v6);
  [v8 finishWithError:v9];

  id v7 = 0;
LABEL_6:
}

- (void)_clearCaches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v7)
    {
      uint64_t v3 = AMSLogKey();
      [v8 stringWithFormat:@"%@: [%@] ", v10, v3];
    }
    else
    {
      [v8 stringWithFormat:@"%@: ", v9];
    v11 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@Received UIApplicationDidEnterBackgroundNotification notification, clearing caches.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v3;
    }
  }
  uint64_t v12 = [(AMSTelephonyDataCache *)self queue];
  dispatch_assert_queue_not_V2(v12);

  uint64_t v13 = [(AMSTelephonyDataCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AMSTelephonyDataCache__clearCaches___block_invoke;
  block[3] = &unk_1E559EA90;
  block[4] = self;
  dispatch_async(v13, block);
}

void __38__AMSTelephonyDataCache__clearCaches___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)activeSubscriptionsDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSTelephonyDataCache *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = AMSLogKey();
    uint64_t v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      uint64_t v2 = AMSLogKey();
      [v9 stringWithFormat:@"%@: [%@] ", v11, v2];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    uint64_t v12 = };
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    if (v8)
    {

      uint64_t v12 = (void *)v2;
    }
  }
  activeContexts = self->_activeContexts;
  self->_activeContexts = 0;
}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = [(AMSTelephonyDataCache *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = AMSLogKey();
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = v11;
    if (v9)
    {
      uint64_t v3 = AMSLogKey();
      [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
    }
    else
    {
      [v10 stringWithFormat:@"%@: ", v11];
    uint64_t v13 = };
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v14;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    if (v9)
    {

      uint64_t v13 = (void *)v3;
    }
  }
  activeContexts = self->_activeContexts;
  self->_activeContexts = 0;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activeContexts, 0);
}

@end