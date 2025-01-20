@interface AMSUniversalLinks
+ (id)_connection;
+ (id)_privateQueue;
+ (void)update;
- (AMSUniversalLinks)init;
- (AMSUniversalLinksConnection)connection;
- (id)updateUniversalLinks;
- (void)setConnection:(id)a3;
@end

@implementation AMSUniversalLinks

+ (void)update
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Universal Links rules", buf, 0x16u);
  }
  v7 = objc_alloc_init(AMSUniversalLinks);
  v8 = [(AMSUniversalLinks *)v7 updateUniversalLinks];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__AMSUniversalLinks_update__block_invoke;
  v9[3] = &__block_descriptor_40_e51_v24__0__AMSUniversalLinksUpdateResult_8__NSError_16l;
  v9[4] = a1;
  [v8 addFinishBlock:v9];
}

void __27__AMSUniversalLinks_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a2 success] & 1) == 0)
  {
    uint64_t v5 = +[AMSLogConfig sharedDataMigrationConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      __int16 v12 = v8;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Universal Links rules update failed: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (AMSUniversalLinks)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUniversalLinks;
  v2 = [(AMSUniversalLinks *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AMSUniversalLinks _connection];
    connection = v2->_connection;
    v2->_connection = (AMSUniversalLinksConnection *)v3;
  }
  return v2;
}

- (id)updateUniversalLinks
{
  uint64_t v3 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
  id v4 = [(id)objc_opt_class() _privateQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__AMSUniversalLinks_updateUniversalLinks__block_invoke;
  v12[3] = &unk_1E559F1E0;
  v12[4] = self;
  uint64_t v5 = v3;
  __int16 v13 = v5;
  objc_super v6 = v12;
  uint64_t v7 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_9;
  block[3] = &unk_1E559EAE0;
  id v15 = v7;
  id v16 = v6;
  id v8 = v7;
  dispatch_async(v4, block);

  int v9 = v13;
  uint64_t v10 = v5;

  return v10;
}

void __41__AMSUniversalLinks_updateUniversalLinks__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__70;
  uint64_t v10 = __Block_byref_object_dispose__70;
  id v11 = [*(id *)(a1 + 32) connection];
  v2 = [(id)v7[5] proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__AMSUniversalLinks_updateUniversalLinks__block_invoke_3;
  v3[3] = &unk_1E55A7410;
  uint64_t v5 = &v6;
  id v4 = *(id *)(a1 + 40);
  [v2 updateWithCompletion:v3];

  _Block_object_dispose(&v6, 8);
}

void __41__AMSUniversalLinks_updateUniversalLinks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void **)(a1 + 32);
  if (v5) {
    [v8 finishWithError:v5];
  }
  else {
    [v8 finishWithResult:v9];
  }
}

+ (id)_privateQueue
{
  if (_MergedGlobals_150 != -1) {
    dispatch_once(&_MergedGlobals_150, &__block_literal_global_132);
  }
  v2 = (void *)qword_1EB38E018;
  return v2;
}

void __34__AMSUniversalLinks__privateQueue__block_invoke()
{
  v2 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.AMSUniversalLinks.queue", 0, v2);
  v1 = (void *)qword_1EB38E018;
  qword_1EB38E018 = (uint64_t)v0;
}

+ (id)_connection
{
  v2 = [a1 _privateQueue];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__70;
  id v14 = __Block_byref_object_dispose__70;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__AMSUniversalLinks__connection__block_invoke;
  v9[3] = &unk_1E559EC70;
  v9[4] = &v10;
  uint64_t v3 = v9;
  id v4 = v2;
  id v5 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchSync_block_invoke_2;
  block[3] = &unk_1E559EAE0;
  id v17 = v5;
  id v18 = v3;
  id v6 = v5;
  dispatch_sync(v4, block);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __32__AMSUniversalLinks__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&_connection_connection_0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v5 = objc_alloc_init(AMSUniversalLinksConnection);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_storeWeak(&_connection_connection_0, v8);
  }
}

- (AMSUniversalLinksConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end