@interface VSPrivacyInfoCenter
+ (id)sharedPrivacyInfoCenter;
- (VSPrivacyInfoCenter)init;
- (id)updateAccountAccessStatusWithError:(id)a3;
- (int)registrationToken;
- (int64_t)accountAccessStatus;
- (void)_invalidateAccountAccessStatus;
- (void)dealloc;
- (void)init;
- (void)setAccountAccessStatus:(int64_t)a3;
- (void)setRegistrationToken:(int)a3;
- (void)updateAccountAccessStatusWithResponse:(id)a3;
@end

@implementation VSPrivacyInfoCenter

+ (id)sharedPrivacyInfoCenter
{
  if (sharedPrivacyInfoCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedPrivacyInfoCenter___vs_lazy_init_predicate, &__block_literal_global_52);
  }
  v2 = (void *)sharedPrivacyInfoCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __46__VSPrivacyInfoCenter_sharedPrivacyInfoCenter__block_invoke()
{
  sharedPrivacyInfoCenter___vs_lazy_init_variable = objc_alloc_init(VSPrivacyInfoCenter);

  return MEMORY[0x1F41817F8]();
}

- (VSPrivacyInfoCenter)init
{
  v17.receiver = self;
  v17.super_class = (Class)VSPrivacyInfoCenter;
  v2 = [(VSPrivacyInfoCenter *)&v17 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__VSPrivacyInfoCenter_init__block_invoke;
    handler[3] = &unk_1E6BD4678;
    objc_copyWeak(&v15, &location);
    uint32_t v5 = notify_register_dispatch("com.apple.tcc.access.changed", &v2->_registrationToken, v3, handler);

    if (v5)
    {
      v6 = VSErrorLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[VSPrivacyInfoCenter init](v6);
      }
    }
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__VSPrivacyInfoCenter_init__block_invoke_6;
    v12[3] = &unk_1E6BD29D0;
    objc_copyWeak(&v13, &location);
    id v9 = (id)[v7 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:v8 usingBlock:v12];

    v10 = +[VSManagedProfileConnection sharedConnection];
    [v10 registerObserver:v2];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__VSPrivacyInfoCenter_init__block_invoke(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "TCC access changed notification received.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateAccountAccessStatus];
}

void __27__VSPrivacyInfoCenter_init__block_invoke_6(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Application did enter background, invalidating access status cache.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateAccountAccessStatus];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_registrationToken)) {
    notify_cancel(self->_registrationToken);
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[VSManagedProfileConnection sharedConnection];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VSPrivacyInfoCenter;
  [(VSPrivacyInfoCenter *)&v5 dealloc];
}

- (void)_invalidateAccountAccessStatus
{
}

- (void)updateAccountAccessStatusWithResponse:(id)a3
{
  [(VSPrivacyInfoCenter *)self willChangeValueForKey:@"accountAccessStatus"];
  [(VSPrivacyInfoCenter *)self setAccountAccessStatus:3];

  [(VSPrivacyInfoCenter *)self didChangeValueForKey:@"accountAccessStatus"];
}

- (id)updateAccountAccessStatusWithError:(id)a3
{
  id v4 = a3;
  if (VSErrorIsPrivateError(v4, -13)) {
    -[VSPrivacyInfoCenter updateAccountAccessStatusWithError:](v4);
  }
  if (VSErrorIsPrivateError(v4, -11))
  {
    uint64_t v5 = 2;
LABEL_8:
    v6 = VSPublicError(0, 0, v4);

LABEL_9:
    [(VSPrivacyInfoCenter *)self setAccountAccessStatus:v5];
    goto LABEL_10;
  }
  if (VSErrorIsPrivateError(v4, -12))
  {
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  if (VSErrorIsPrivateError(v4, -23))
  {
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  v6 = v4;
  if (VSErrorIsPublicError(v4, 7))
  {
    uint64_t v5 = 0;
    v6 = v4;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (int64_t)accountAccessStatus
{
  return self->_accountAccessStatus;
}

- (void)setAccountAccessStatus:(int64_t)a3
{
  self->_accountAccessStatus = a3;
}

- (int)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(int)a3
{
  self->_registrationToken = a3;
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Error registering for TCC notification.", v1, 2u);
}

- (void)updateAccountAccessStatusWithError:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  NSLog((NSString *)@"%@", v1);

  abort();
}

@end