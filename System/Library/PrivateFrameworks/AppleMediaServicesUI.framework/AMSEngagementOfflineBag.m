@interface AMSEngagementOfflineBag
- (AMSBagProtocol)underlyingBag;
- (AMSEngagementOfflineBag)initWithUnderlyingBag:(id)a3;
- (AMSPromise)snapshotPromise;
- (AMSSnapshotBag)underlyingOfflineBag;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)_attemptBagLoad;
- (id)_getOfflineBagData;
- (id)_getSnapshotResult;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)setSnapshotPromise:(id)a3;
- (void)setUnderlyingBag:(id)a3;
- (void)setUnderlyingOfflineBag:(id)a3;
@end

@implementation AMSEngagementOfflineBag

- (AMSEngagementOfflineBag)initWithUnderlyingBag:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSEngagementOfflineBag;
  v6 = [(AMSEngagementOfflineBag *)&v11 init];
  v7 = v6;
  if (v6)
  {
    snapshotPromise = v6->_snapshotPromise;
    v6->_snapshotPromise = 0;

    underlyingOfflineBag = v7->_underlyingOfflineBag;
    v7->_underlyingOfflineBag = 0;

    objc_storeStrong((id *)&v7->_underlyingBag, a3);
  }

  return v7;
}

- (id)_attemptBagLoad
{
  v3 = [(AMSEngagementOfflineBag *)self snapshotPromise];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
    [(AMSEngagementOfflineBag *)self setSnapshotPromise:v4];

    id v5 = [(AMSEngagementOfflineBag *)self underlyingBag];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__AMSEngagementOfflineBag__attemptBagLoad__block_invoke;
    v8[3] = &unk_2643E30A8;
    v8[4] = self;
    [v5 createSnapshotWithCompletion:v8];
  }
  v6 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  return v6;
}

void __42__AMSEngagementOfflineBag__attemptBagLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) underlyingOfflineBag];

    uint64_t v8 = [MEMORY[0x263F27CB8] sharedBagConfig];
    v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v11 = objc_opt_class();
        id v12 = v11;
        v13 = AMSLogKey();
        int v26 = 138543618;
        v27 = v11;
        __int16 v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to load the underlying bag. Falling back to offline bag..", (uint8_t *)&v26, 0x16u);
      }
      v14 = [*(id *)(a1 + 32) snapshotPromise];
      v15 = [*(id *)(a1 + 32) underlyingOfflineBag];
      [v14 finishWithResult:v15 error:0];
    }
    else
    {
      if (!v8)
      {
        v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v22 = [v9 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        id v24 = v23;
        v25 = AMSLogKey();
        int v26 = 138543618;
        v27 = v23;
        __int16 v28 = 2114;
        v29 = v25;
        _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to generate offline bag.", (uint8_t *)&v26, 0x16u);
      }
      v14 = [*(id *)(a1 + 32) snapshotPromise];
      [v14 finishWithError:v6];
    }

    [*(id *)(a1 + 32) setSnapshotPromise:0];
  }
  else
  {
    v16 = [MEMORY[0x263F27CB8] sharedBagConfig];
    if (!v16)
    {
      v16 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      id v19 = v18;
      v20 = AMSLogKey();
      int v26 = 138543618;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully snapshotted the bag. Using underlying bag..", (uint8_t *)&v26, 0x16u);
    }
    v21 = [*(id *)(a1 + 32) snapshotPromise];
    [v21 finishWithResult:v5 error:0];
  }
}

- (id)_getOfflineBagData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(NSURL, "ams_dynamicUIDirectory");
  v3 = [v2 URLByAppendingPathComponent:@"offline-bag" isDirectory:0];

  id v19 = 0;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:0 error:&v19];
  id v5 = v19;
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedBagConfig];
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      objc_super v11 = AMSLogKey();
      id v12 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      __int16 v22 = 2114;
      v23 = v11;
      __int16 v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to read offline bag data. error = %{public}@", buf, 0x20u);
    }
    id v13 = 0;
  }
  else
  {
    if (!v6)
    {
      v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v14 = [v7 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      id v16 = v15;
      v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Successfully read offline bag data.", buf, 0x16u);
    }
    id v13 = v4;
  }

  return v13;
}

- (id)_getSnapshotResult
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  id v12 = 0;
  v3 = [v2 resultWithError:&v12];
  id v4 = v12;

  if (v4)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedBagConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      v9 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get snapshot result for key. error = %{public}@", buf, 0x20u);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (AMSSnapshotBag)underlyingOfflineBag
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  underlyingOfflineBag = self->_underlyingOfflineBag;
  if (underlyingOfflineBag) {
    goto LABEL_2;
  }
  id v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  id v10 = [(AMSEngagementOfflineBag *)self _getOfflineBagData];
  id v33 = 0;
  objc_super v11 = [v5 unarchivedObjectOfClasses:v9 fromData:v10 error:&v33];
  id v12 = v33;

  if (v12)
  {
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263F27E90]);
    [v13 setData:v11];
    uint64_t v14 = [(AMSEngagementOfflineBag *)self expirationDate];
    [v13 setExpirationDate:v14];

    __int16 v15 = [(AMSEngagementOfflineBag *)self profile];
    [v13 setProfile:v15];

    id v16 = [(AMSEngagementOfflineBag *)self profileVersion];
    [v13 setProfileVersion:v16];

    id v32 = 0;
    __int16 v17 = [v13 buildWithError:&v32];
    id v18 = v32;
    uint64_t v19 = [MEMORY[0x263F27CB8] sharedBagConfig];
    v20 = (void *)v19;
    if (v18)
    {
      if (!v19)
      {
        v20 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = objc_opt_class();
        id v31 = v22;
        v23 = AMSLogKey();
        __int16 v24 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        __int16 v36 = 2114;
        v37 = v23;
        __int16 v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the offline snapshot. error = %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (!v19)
      {
        v20 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v25 = [v20 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        id v27 = v26;
        __int16 v28 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        __int16 v36 = 2114;
        v37 = v28;
        _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully created the offline snapshot.", buf, 0x16u);
      }
      v29 = v17;
      v20 = self->_underlyingOfflineBag;
      self->_underlyingOfflineBag = v29;
    }

    if (!v18)
    {
      underlyingOfflineBag = self->_underlyingOfflineBag;
LABEL_2:
      v3 = underlyingOfflineBag;
      goto LABEL_18;
    }
  }
  v3 = 0;
LABEL_18:
  return v3;
}

- (NSDate)expirationDate
{
  return (NSDate *)[MEMORY[0x263EFF910] distantFuture];
}

- (BOOL)isExpired
{
  v2 = [(AMSEngagementOfflineBag *)self expirationDate];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF910] date];
    BOOL v4 = [v3 compare:v2] == 1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (NSString)profile
{
  v2 = [(AMSEngagementOfflineBag *)self underlyingBag];
  v3 = [v2 profile];

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  v2 = [(AMSEngagementOfflineBag *)self underlyingBag];
  v3 = [v2 profileVersion];

  return (NSString *)v3;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 arrayForKey:v4];

  return v9;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 BOOLForKey:v4];

  return v9;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 doubleForKey:v4];

  return v9;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 integerForKey:v4];

  return v9;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 stringForKey:v4];

  return v9;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  v9 = [v8 URLForKey:v4];

  return v9;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v9 = [v8 isFinished];

  if (v9)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v10 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  objc_super v11 = };
  id v12 = [v11 URLForKey:v7 account:v6];

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self snapshotPromise];
  int v6 = [v5 isFinished];

  if (v6)
  {
    [(AMSEngagementOfflineBag *)self _getSnapshotResult];
  }
  else
  {
    id v7 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
    [(AMSEngagementOfflineBag *)self underlyingOfflineBag];
  uint64_t v8 = };
  int v9 = [v8 dictionaryForKey:v4];

  return v9;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementOfflineBag *)self _attemptBagLoad];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__AMSEngagementOfflineBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_2643E30D0;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

uint64_t __56__AMSEngagementOfflineBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AMSPromise)snapshotPromise
{
  return self->_snapshotPromise;
}

- (void)setSnapshotPromise:(id)a3
{
}

- (AMSBagProtocol)underlyingBag
{
  return self->_underlyingBag;
}

- (void)setUnderlyingBag:(id)a3
{
}

- (void)setUnderlyingOfflineBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingOfflineBag, 0);
  objc_storeStrong((id *)&self->_underlyingBag, 0);
  objc_storeStrong((id *)&self->_snapshotPromise, 0);
}

@end