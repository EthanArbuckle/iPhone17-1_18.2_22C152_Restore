@interface EDFetchController
+ (OS_os_log)log;
- (EDAccountsProvider)accountsProvider;
- (EDFetchController)initWithAccountsProvider:(id)a3;
- (void)setAccountsProvider:(id)a3;
@end

@implementation EDFetchController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EDFetchController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1) {
    dispatch_once(&log_onceToken_33, block);
  }
  v2 = (void *)log_log_33;

  return (OS_os_log *)v2;
}

void __24__EDFetchController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;
}

- (EDFetchController)initWithAccountsProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDFetchController;
  v6 = [(EDFetchController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountsProvider, a3);
  }

  return v7;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end