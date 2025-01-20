@interface AMSSyncPasswordSettingsTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)serverValueForFreePasswordSetting:(unint64_t)a3;
+ (id)serverValueForPaidPasswordSetting:(unint64_t)a3;
+ (unint64_t)freePasswordSettingFromServerValue:(unint64_t)a3;
+ (unint64_t)paidPasswordSettingFromServerValue:(unint64_t)a3;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSSyncPasswordSettingsTask)initWithAccount:(id)a3 freeSetting:(unint64_t)a4 paidSetting:(unint64_t)a5 delegate:(id)a6 bag:(id)a7;
- (NSURLSessionDelegate)delegate;
- (id)performSync;
- (unint64_t)freeSetting;
- (unint64_t)paidSetting;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSSyncPasswordSettingsTask

- (AMSSyncPasswordSettingsTask)initWithAccount:(id)a3 freeSetting:(unint64_t)a4 paidSetting:(unint64_t)a5 delegate:(id)a6 bag:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AMSSyncPasswordSettingsTask;
  v16 = [(AMSTask *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    v17->_freeSetting = a4;
    v17->_paidSetting = a5;
    objc_storeStrong((id *)&v17->_bag, a7);
    objc_storeWeak((id *)&v17->_delegate, v14);
  }

  return v17;
}

- (id)performSync
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke;
  v5[3] = &unk_1E559EA38;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSSyncPasswordSettingsTask;
  v2 = [(AMSTask *)&v4 performTaskWithPromiseBlock:v5];
  return v2;
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedAccountsConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    v6 = [*(id *)(a1 + 32) account];
    v7 = AMSHashIfNeeded(v6);
    uint64_t v8 = [*(id *)(a1 + 32) freeSetting];
    uint64_t v9 = [*(id *)(a1 + 32) paidSetting];
    *(_DWORD *)buf = 138544386;
    uint64_t v30 = v4;
    __int16 v31 = 2114;
    v32 = v5;
    __int16 v33 = 2114;
    v34 = v7;
    __int16 v35 = 2048;
    uint64_t v36 = v8;
    __int16 v37 = 2048;
    uint64_t v38 = v9;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing password settings. account = %{public}@ | settings = Free: %lu, paid: %lu", buf, 0x34u);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27[0] = @"free";
  v11 = objc_msgSend((id)objc_opt_class(), "serverValueForFreePasswordSetting:", objc_msgSend(*(id *)(a1 + 32), "freeSetting"));
  v27[1] = @"paid";
  v28[0] = v11;
  v12 = objc_msgSend((id)objc_opt_class(), "serverValueForPaidPasswordSetting:", objc_msgSend(*(id *)(a1 + 32), "paidSetting"));
  v28[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v10 setObject:v13 forKeyedSubscript:@"settings"];

  id v14 = +[AMSDevice deviceGUID];
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v14, @"guid");

  id v15 = [*(id *)(a1 + 32) bag];
  v16 = [v15 URLForKey:@"update-password-settings"];

  v17 = [AMSURLRequestEncoder alloc];
  v18 = [*(id *)(a1 + 32) bag];
  objc_super v19 = [(AMSURLRequestEncoder *)v17 initWithBag:v18];

  v20 = [*(id *)(a1 + 32) account];
  [(AMSURLRequestEncoder *)v19 setAccount:v20];

  v21 = [*(id *)(a1 + 32) clientInfo];
  [(AMSURLRequestEncoder *)v19 setClientInfo:v21];

  [(AMSURLRequestEncoder *)v19 setRequestEncoding:3];
  v22 = AMSLogKey();
  [(AMSURLRequestEncoder *)v19 setLogUUID:v22];

  [(AMSURLRequestEncoder *)v19 setRequestEncoding:2];
  v23 = [(AMSURLRequestEncoder *)v19 requestWithMethod:4 bagURL:v16 parameters:v10];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_32;
  v26[3] = &unk_1E559E9C0;
  v26[4] = *(void *)(a1 + 32);
  v24 = [v23 thenWithBlock:v26];

  return v24;
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_32(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F18DD0];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 clientInfo];
  v7 = [*(id *)(a1 + 32) bag];
  uint64_t v8 = objc_msgSend(v3, "ams_configurationWithProcessInfo:bag:", v6, v7);

  uint64_t v9 = [[AMSURLSession alloc] initWithConfiguration:v8];
  id v10 = [*(id *)(a1 + 32) delegate];
  [(AMSURLSession *)v9 setDelegate:v10];

  v11 = [(AMSURLSession *)v9 dataTaskPromiseWithRequest:v5];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_2;
  v14[3] = &unk_1E559F348;
  v14[4] = *(void *)(a1 + 32);
  v12 = [v11 thenWithBlock:v14];

  return v12;
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) account];
  objc_msgSend(v2, "ams_setFreePasswordPromptSetting:", objc_msgSend(*(id *)(a1 + 32), "freeSetting"));

  v3 = [*(id *)(a1 + 32) account];
  objc_msgSend(v3, "ams_setPaidPasswordPromptSetting:", objc_msgSend(*(id *)(a1 + 32), "paidSetting"));

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v5 = [*(id *)(a1 + 32) account];
  id v6 = (id)objc_msgSend(v4, "ams_saveAccount:", v5);

  v7 = objc_alloc_init(AMSSyncPasswordSettingsResult);
  uint64_t v8 = +[AMSPromise promiseWithResult:v7];

  return v8;
}

+ (id)serverValueForFreePasswordSetting:(unint64_t)a3
{
  if (a3 > 3) {
    return &stru_1EDCA7308;
  }
  else {
    return off_1E55A6DF0[a3];
  }
}

+ (id)serverValueForPaidPasswordSetting:(unint64_t)a3
{
  if (a3 > 3) {
    return &stru_1EDCA7308;
  }
  else {
    return off_1E55A6E10[a3];
  }
}

+ (unint64_t)freePasswordSettingFromServerValue:(unint64_t)a3
{
  unint64_t v3 = 3;
  if ((a3 & 0xC) != 0xC) {
    unint64_t v3 = (a3 & 0xC) == 4;
  }
  if ((a3 & 0xC) == 8) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (unint64_t)paidPasswordSettingFromServerValue:(unint64_t)a3
{
  unint64_t v3 = (a3 & 3) == 1;
  if ((a3 & 3) == 3) {
    unint64_t v3 = 3;
  }
  if ((a3 & 3) == 2) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_17 != -1) {
    dispatch_once(&_MergedGlobals_1_17, &__block_literal_global_124);
  }
  v2 = (void *)qword_1EB38D218;
  return (NSString *)v2;
}

void __44__AMSSyncPasswordSettingsTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D218;
  qword_1EB38D218 = @"Accounts";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D220 != -1) {
    dispatch_once(&qword_1EB38D220, &__block_literal_global_51_0);
  }
  v2 = (void *)qword_1EB38D228;
  return (NSString *)v2;
}

void __51__AMSSyncPasswordSettingsTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D228;
  qword_1EB38D228 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  unint64_t v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSURLSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NSURLSessionDelegate *)WeakRetained;
}

- (unint64_t)freeSetting
{
  return self->_freeSetting;
}

- (unint64_t)paidSetting
{
  return self->_paidSetting;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end