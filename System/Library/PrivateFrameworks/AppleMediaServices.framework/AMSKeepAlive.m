@interface AMSKeepAlive
+ (BOOL)_isRBSAssertionsEnabled;
+ (id)keepAliveWithFormat:(id)a3;
+ (id)keepAliveWithName:(id)a3;
+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4;
+ (id)rbs_keepAliveWithName:(id)a3;
+ (id)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4;
+ (void)_accessAssertionCache:(id)a3;
+ (void)_handleAssertionExpiration;
+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5;
+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5;
+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7;
- (AMSKeepAlive)initWithName:(id)a3;
- (AMSKeepAlive)initWithName:(id)a3 style:(int64_t)a4;
- (NSString)name;
- (id)_assertionName;
- (id)_cacheKey;
- (id)initRBSWithName:(id)a3;
- (id)initRBSWithName:(id)a3 style:(int64_t)a4;
- (int64_t)style;
- (void)_removeOSTransaction;
- (void)_removeProcessAssertion;
- (void)_startLogTimer;
- (void)_takeOSTransaction;
- (void)_takeProcessAssertion;
- (void)dealloc;
- (void)invalidate;
- (void)rbs_invalidate;
@end

@implementation AMSKeepAlive

+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7
{
}

+ (id)keepAliveWithName:(id)a3
{
  id v3 = a3;
  v4 = [[AMSKeepAlive alloc] initWithName:v3];

  return v4;
}

- (AMSKeepAlive)initWithName:(id)a3
{
  return [(AMSKeepAlive *)self initWithName:a3 style:0];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!+[AMSKeepAlive _isRBSAssertionsEnabled])
  {
    id v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = objc_opt_class();
      v6 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Releasing", buf, 0x16u);
    }
    [(AMSKeepAlive *)self invalidate];
  }
  v7.receiver = self;
  v7.super_class = (Class)AMSKeepAlive;
  [(AMSKeepAlive *)&v7 dealloc];
}

- (void)invalidate
{
  if (+[AMSKeepAlive _isRBSAssertionsEnabled])
  {
    rbsKeepAlive = self->_rbsKeepAlive;
    [(AMSRBSKeepAlive *)rbsKeepAlive invalidate];
  }
  else
  {
    [(AMSKeepAlive *)self _removeProcessAssertion];
    [(AMSKeepAlive *)self _removeOSTransaction];
  }
}

- (AMSKeepAlive)initWithName:(id)a3 style:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSKeepAlive;
  v8 = [(AMSKeepAlive *)&v19 init];
  if (v8)
  {
    if (+[AMSKeepAlive _isRBSAssertionsEnabled])
    {
      uint64_t v9 = +[AMSRBSKeepAlive keepAliveWithName:v7 style:a4];
      rbsKeepAlive = v8->_rbsKeepAlive;
      v8->_rbsKeepAlive = (AMSRBSKeepAlive *)v9;
    }
    else
    {
      if (a4) {
        int64_t v11 = a4;
      }
      else {
        int64_t v11 = 2;
      }
      uint64_t v12 = +[AMSLogConfig sharedConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_opt_class();
        v15 = AMSLogKey();
        *(_DWORD *)buf = 138544130;
        uint64_t v21 = v14;
        __int16 v22 = 2114;
        v23 = v15;
        __int16 v24 = 2114;
        id v25 = v7;
        __int16 v26 = 2048;
        int64_t v27 = v11;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting keep alive with assertion: %{public}@-%ld", buf, 0x2Au);
      }
      uint64_t v16 = AMSLogKey();
      logKey = v8->_logKey;
      v8->_logKey = (NSString *)v16;

      objc_storeStrong((id *)&v8->_name, a3);
      v8->_style = v11;
      [(AMSKeepAlive *)v8 _takeOSTransaction];
      [(AMSKeepAlive *)v8 _takeProcessAssertion];
      [(AMSKeepAlive *)v8 _startLogTimer];
    }
  }

  return v8;
}

+ (BOOL)_isRBSAssertionsEnabled
{
  return _os_feature_enabled_impl();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rbsKeepAlive, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  v6 = [[AMSKeepAlive alloc] initWithName:v5 style:a4];

  return v6;
}

+ (id)keepAliveWithFormat:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithFormat:v4 locale:0 arguments:&v9];

  v6 = [[AMSKeepAlive alloc] initWithName:v5];
  return v6;
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
  id v7 = (void (**)(void))a5;
  id v8 = +[AMSKeepAlive keepAliveWithName:a3 style:a4];
  v7[2](v7);

  [v8 invalidate];
}

+ (id)rbs_keepAliveWithName:(id)a3
{
  id v3 = a3;
  id v4 = [[AMSKeepAlive alloc] initRBSWithName:v3];

  return v4;
}

+ (id)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  id v6 = [[AMSKeepAlive alloc] initRBSWithName:v5 style:a4];

  return v6;
}

+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
}

- (id)initRBSWithName:(id)a3
{
  return [(AMSKeepAlive *)self initRBSWithName:a3 style:0];
}

- (id)initRBSWithName:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSKeepAlive;
  id v7 = [(AMSKeepAlive *)&v11 init];
  if (v7)
  {
    uint64_t v8 = +[AMSRBSKeepAlive keepAliveWithName:v6 style:a4];
    rbsKeepAlive = v7->_rbsKeepAlive;
    v7->_rbsKeepAlive = (AMSRBSKeepAlive *)v8;
  }
  return v7;
}

- (void)rbs_invalidate
{
}

+ (void)_accessAssertionCache:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  if (qword_1EB38D998 != -1) {
    dispatch_once(&qword_1EB38D998, &__block_literal_global_67);
  }
  if (qword_1EB38D9A0 != -1) {
    dispatch_once(&qword_1EB38D9A0, &__block_literal_global_17_1);
  }
  id v4 = (id)qword_1EB38D9A8;
  if (dispatch_get_specific((const void *)_accessAssertionCache__queueMarker))
  {
    v3[2](v3, v4);
  }
  else
  {
    id v5 = (void *)_MergedGlobals_115;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__AMSKeepAlive__accessAssertionCache___block_invoke_3;
    v10[3] = &unk_1E559F868;
    uint64_t v12 = v3;
    id v11 = v4;
    id v6 = v10;
    id v7 = v5;
    uint64_t v8 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchSync_block_invoke_0;
    block[3] = &unk_1E559EAE0;
    id v14 = v8;
    id v15 = v6;
    id v9 = v8;
    dispatch_sync(v7, block);
  }
}

void __38__AMSKeepAlive__accessAssertionCache___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AMSKeepAlive.assertions", 0);
  v1 = (void *)_MergedGlobals_115;
  _MergedGlobals_115 = (uint64_t)v0;

  v2 = _MergedGlobals_115;
  id v3 = (const void *)_accessAssertionCache__queueMarker;
  id v4 = (void *)_MergedGlobals_115;
  dispatch_queue_set_specific(v2, v3, v4, 0);
}

uint64_t __38__AMSKeepAlive__accessAssertionCache___block_invoke_2()
{
  qword_1EB38D9A8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__AMSKeepAlive__accessAssertionCache___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_assertionName
{
  v2 = NSString;
  logKey = self->_logKey;
  id v4 = [(AMSKeepAlive *)self _cacheKey];
  id v5 = [v2 stringWithFormat:@"AMSKeepAlive[%@]:%@", logKey, v4];

  return v5;
}

- (id)_cacheKey
{
  id v3 = NSString;
  id v4 = [(AMSKeepAlive *)self name];
  id v5 = [v3 stringWithFormat:@"%@-%ld", v4, -[AMSKeepAlive style](self, "style")];

  return v5;
}

+ (void)_handleAssertionExpiration
{
}

void __42__AMSKeepAlive__handleAssertionExpiration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if ([v8 valid]) {
          [v8 invalidate];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [v2 removeAllObjects];
}

- (void)_removeOSTransaction
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__38;
  v11[4] = __Block_byref_object_dispose__38;
  long long v12 = self->_transaction;
  if (v12)
  {
    id v3 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__AMSKeepAlive__removeOSTransaction__block_invoke;
    v10[3] = &unk_1E559EC70;
    void v10[4] = v11;
    uint64_t v4 = v3;
    uint64_t v5 = v10;
    uint64_t v6 = AMSLogKey();
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_2;
    block[3] = &unk_1E559EAE0;
    id v14 = v6;
    id v15 = v5;
    id v8 = v6;
    dispatch_after(v7, v4, block);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

  _Block_object_dispose(v11, 8);
}

void __36__AMSKeepAlive__removeOSTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_removeProcessAssertion
{
  id v3 = self->_logKey;
  uint64_t v4 = [(AMSKeepAlive *)self _cacheKey];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AMSKeepAlive__removeProcessAssertion__block_invoke;
  v7[3] = &unk_1E55A2768;
  id v8 = v4;
  long long v9 = v3;
  uint64_t v5 = v3;
  id v6 = v4;
  +[AMSKeepAlive _accessAssertionCache:v7];
}

void __39__AMSKeepAlive__removeProcessAssertion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setAms_assertionCount:", objc_msgSend(v4, "ams_assertionCount") - 1);
    if (!objc_msgSend(v5, "ams_assertionCount"))
    {
      if ([v5 valid]) {
        [v5 invalidate];
      }
      [v3 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
      id v6 = +[AMSLogConfig sharedConfig];
      if (!v6)
      {
        id v6 = +[AMSLogConfig sharedConfig];
      }
      dispatch_time_t v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        uint64_t v13 = v9;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Assertion released", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_startLogTimer
{
  objc_initWeak(&location, self);
  id v2 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__AMSKeepAlive__startLogTimer__block_invoke;
  v8[3] = &unk_1E559F890;
  objc_copyWeak(&v9, &location);
  id v3 = v2;
  uint64_t v4 = v8;
  uint64_t v5 = AMSLogKey();
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v12 = v5;
  id v13 = v4;
  id v7 = v5;
  dispatch_after(v6, v3, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__AMSKeepAlive__startLogTimer__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __30__AMSKeepAlive__startLogTimer__block_invoke_2;
  v1[3] = &unk_1E55A3428;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[AMSKeepAlive _accessAssertionCache:v1];
  objc_destroyWeak(&v2);
}

void __30__AMSKeepAlive__startLogTimer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_time_t v6 = [WeakRetained _cacheKey];
    uint64_t v7 = [v3 objectForKeyedSubscript:v6];

    uint64_t v8 = v5[1];
    if (v7 | v8)
    {
      id v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      int v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = v5[2];
        int v13 = 138544130;
        uint64_t v14 = v11;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        __int16 v17 = 1024;
        BOOL v18 = v7 != 0;
        __int16 v19 = 1024;
        BOOL v20 = v8 != 0;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Still alive. (a: %d, t: %d)", (uint8_t *)&v13, 0x22u);
      }

      [v5 _startLogTimer];
    }
  }
}

- (void)_takeOSTransaction
{
  id v5 = [(AMSKeepAlive *)self _assertionName];
  [v5 UTF8String];
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;
}

- (void)_takeProcessAssertion
{
  if (+[AMSEphemeralDefaults processAssertionsEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37__AMSKeepAlive__takeProcessAssertion__block_invoke;
    v3[3] = &unk_1E55A3450;
    v3[4] = self;
    +[AMSKeepAlive _accessAssertionCache:v3];
  }
}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _cacheKey];
  id v5 = [*(id *)(a1 + 32) _assertionName];
  dispatch_time_t v6 = [v3 objectForKeyedSubscript:v4];
  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) style];
    if (v7 == 2)
    {
      uint64_t v8 = 7;
    }
    else
    {
      if (v7 != 1)
      {
        dispatch_time_t v6 = 0;
        goto LABEL_19;
      }
      uint64_t v8 = 3;
    }
    if (+[AMSProcessInfo BOOLForEntitlement:@"com.apple.multitasking.systemappassertions"])
    {
      uint64_t v9 = 10004;
    }
    else
    {
      uint64_t v9 = 4;
    }
    id v10 = *(id *)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v6 = [[AMSBKSProcessAssertion alloc] initWithPID:getpid() flags:v8 reason:v9 name:v5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2;
    v15[3] = &unk_1E559EA90;
    id v11 = v10;
    id v16 = v11;
    [(BKSAssertion *)v6 setInvalidationHandler:v15];
    if (kUnboundedAssertionEntitlement_block_invoke_onceToken != -1) {
      dispatch_once(&kUnboundedAssertionEntitlement_block_invoke_onceToken, &__block_literal_global_33);
    }
    if (![(BKSProcessAssertion *)v6 acquire])
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      int v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v14;
        __int16 v19 = 2114;
        id v20 = v11;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire assertion", buf, 0x16u);
      }
    }
    [v3 setObject:v6 forKeyedSubscript:v4];
  }
LABEL_19:
  [(AMSBKSProcessAssertion *)v6 setAms_assertionCount:[(AMSBKSProcessAssertion *)v6 ams_assertionCount] + 1];
}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Assertion invalidated", (uint8_t *)&v6, 0x16u);
  }
}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke_31()
{
  dispatch_get_global_queue(0, 0);
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  BKSProcessAssertionSetExpirationHandler();
}

uint64_t __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2_34()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v0 = +[AMSLogConfig sharedConfig];
  if (!v0)
  {
    id v0 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    uint64_t v4 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Assertion expiration notice received", (uint8_t *)&v3, 0xCu);
  }

  return +[AMSKeepAlive _handleAssertionExpiration];
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)style
{
  return self->_style;
}

@end