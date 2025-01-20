@interface AMSSubscriptionBag
+ (AMSSubscriptionBag)sharedInstance;
- (AMSFairPlayContext)fairPlayContext;
- (AMSSubscriptionBag)init;
- (BOOL)_generateSubscriptionBagRequestWithAccountIdentifier:(id)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7;
- (id)subscriptionBagSyncDataForAccount:(id)a3;
@end

@implementation AMSSubscriptionBag

- (AMSSubscriptionBag)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSSubscriptionBag;
  v2 = [(AMSSubscriptionBag *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSFairPlayContext);
    fairPlayContext = v2->_fairPlayContext;
    v2->_fairPlayContext = v3;
  }
  return v2;
}

+ (AMSSubscriptionBag)sharedInstance
{
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_123);
  }
  v2 = (void *)qword_1EB38DF88;
  return (AMSSubscriptionBag *)v2;
}

uint64_t __36__AMSSubscriptionBag_sharedInstance__block_invoke()
{
  qword_1EB38DF88 = objc_alloc_init(AMSSubscriptionBag);
  return MEMORY[0x1F41817F8]();
}

- (id)subscriptionBagSyncDataForAccount:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0;
  qi864985u0(-1, (uint64_t)&v21, (uint64_t)&v19 + 4, (uint64_t)&v20, (uint64_t)&v19);
  id v5 = 0;
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v8 = (void *)[v7 initWithBytesNoCopy:v21 length:HIDWORD(v19) freeWhenDone:0];
    v9 = objc_msgSend(v4, "ams_DSID");
    id v17 = 0;
    id v18 = 0;
    [(AMSSubscriptionBag *)self _generateSubscriptionBagRequestWithAccountIdentifier:v9 transactionType:303 machineIDData:v8 returningSubscriptionBagData:&v18 error:&v17];
    id v5 = v18;
    id v10 = v17;

    if (v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        v14 = AMSLogKey();
        v15 = AMSLogableError(v10);
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        v25 = v14;
        __int16 v26 = 2114;
        v27 = v15;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating subscription bag request. error = %{public}@", buf, 0x20u);
      }
    }
  }
  if (v21) {
    jk24uiwqrg(v21);
  }
  if (v20) {
    jk24uiwqrg(v20);
  }

  return v5;
}

- (BOOL)_generateSubscriptionBagRequestWithAccountIdentifier:(id)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  v14 = [(AMSSubscriptionBag *)self fairPlayContext];
  id v27 = 0;
  uint64_t v15 = [v14 fairplayContextIDWithError:&v27];
  id v16 = v27;

  if (v16)
  {
    if (a7)
    {
      id v16 = v16;
      BOOL v17 = 0;
      *a7 = v16;
    }
    else
    {
      BOOL v17 = 0;
    }
    goto LABEL_13;
  }
  uint64_t v26 = 0;
  unsigned int v25 = 0;
  uint64_t v18 = [v12 unsignedLongLongValue];
  id v19 = v13;
  V3lNO(v15, v18, v10, [v19 bytes], objc_msgSend(v19, "length"), (uint64_t)&v26, (uint64_t)&v25);
  if (v20)
  {
    AMSError(505, @"Fairplay Error", 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v21 = (void *)[v22 initWithBytesNoCopy:v26 length:v25 deallocator:&__block_literal_global_6_0];
      id v16 = 0;
      goto LABEL_10;
    }
    id v16 = 0;
  }
  uint64_t v21 = 0;
LABEL_10:
  id v23 = v21;
  *a6 = v23;
  if (a7) {
    *a7 = v16;
  }
  BOOL v17 = v16 == 0;

LABEL_13:
  return v17;
}

void __140__AMSSubscriptionBag__generateSubscriptionBagRequestWithAccountIdentifier_transactionType_machineIDData_returningSubscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (AMSFairPlayContext)fairPlayContext
{
  return self->_fairPlayContext;
}

- (void).cxx_destruct
{
}

@end