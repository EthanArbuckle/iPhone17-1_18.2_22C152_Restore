@interface VSIdentityProviderAvailabilityInfoCenter
+ (BOOL)automaticallyNotifiesObserversOfStatus;
+ (id)defaultCenter;
- (BOOL)hasDeterminedInitialStatus;
- (NSOperationQueue)privateQueue;
- (VSAMSBagLoadOperation)mockAMSBagLoadOperation;
- (VSDeveloperServiceConnection)developerServiceConnection;
- (VSIdentityProviderAvailabilityInfoCenter)init;
- (VSPreferences)preferences;
- (VSRemoteNotifier)remoteNotifier;
- (int64_t)status;
- (void)_accountStoreChanged:(id)a3;
- (void)_beginStatusUpdateAttemptWithCompletionHandler:(id)a3;
- (void)_sendStatusChangeNotification;
- (void)determineIdentityProviderAvailabilityWithCompletionHandler:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setDeveloperServiceConnection:(id)a3;
- (void)setHasDeterminedInitialStatus:(BOOL)a3;
- (void)setMockAMSBagLoadOperation:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation VSIdentityProviderAvailabilityInfoCenter

- (VSIdentityProviderAvailabilityInfoCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderAvailabilityInfoCenter;
  v2 = [(VSIdentityProviderAvailabilityInfoCenter *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSIdentityProviderAvailabilityInfoCenter"];
    v5 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v5;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
  }
  return v2;
}

- (VSPreferences)preferences
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_preferences;
  if (!v3)
  {
    v3 = objc_alloc_init(VSPreferences);
    objc_storeStrong((id *)&v2->_preferences, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

+ (id)defaultCenter
{
  if (defaultCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&defaultCenter___vs_lazy_init_predicate, &__block_literal_global_43);
  }
  v2 = (void *)defaultCenter___vs_lazy_init_variable;

  return v2;
}

uint64_t __57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke()
{
  defaultCenter___vs_lazy_init_variable = __57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

VSIdentityProviderAvailabilityInfoCenter *__57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke_2()
{
  v0 = objc_alloc_init(VSIdentityProviderAvailabilityInfoCenter);
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v2 = +[VSAccountMonitor sharedInstance];
  [v1 addObserver:v0 selector:sel__accountStoreChanged_ name:@"VSAccountMonitorAccountDidChange" object:v2];

  [(VSIdentityProviderAvailabilityInfoCenter *)v0 _beginStatusUpdateAttemptWithCompletionHandler:0];

  return v0;
}

- (void)_accountStoreChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Account store changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VSIdentityProviderAvailabilityInfoCenter *)self _beginStatusUpdateAttemptWithCompletionHandler:0];
}

- (void)_sendStatusChangeNotification
{
  VSRequireMainThread();
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will send identity provider availability status change notification.", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VSIdentityProviderAvailabilityDidChangeNotification" object:self];
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Did send identity provider availability status change notification.", v6, 2u);
  }
}

- (void)_beginStatusUpdateAttemptWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(VSIdentityProviderAvailabilityInfoCenter *)self privateQueue];
  int v6 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  id v7 = [(VSIdentityProviderAvailabilityInfoCenter *)self developerServiceConnection];
  [(VSDeveloperIdentityProviderFetchAllOperation *)v6 setConnection:v7];

  [v5 addOperation:v6];
  uint64_t v8 = @"MultipleSystemOperators";
  v9 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v9 setBagKey:v8];
  v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Will load value for bag key %@", buf, 0xCu);
  }

  [v5 addOperation:v9];
  v11 = (void *)MEMORY[0x1E4F28B48];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E6BD42F0;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v6;
  id v20 = v4;
  id v12 = v4;
  v13 = v6;
  v14 = v9;
  v15 = [v11 blockOperationWithBlock:v16];
  [v15 addDependency:v13];
  [v15 addDependency:v14];
  [v5 addOperation:v15];
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) preferences];
  uint64_t v3 = [v2 cachedStoreProviderStatus];
  id v4 = [*(id *)(a1 + 40) value];
  if (v4)
  {
    v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@", buf, 0x16u);
    }
    id v7 = 0;
    uint64_t v3 = 1;
  }
  else
  {
    v5 = [*(id *)(a1 + 40) error];
    uint64_t v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Did NOT load value for bag key %@: %@", buf, 0x16u);
    }

    if (v5)
    {
      id v7 = VSPublicError(0, 3, v5);
      v10 = VSErrorLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v10);
      }
    }
    else
    {
      id v7 = 0;
      uint64_t v3 = 2;
    }
  }

  [v2 setCachedStoreProviderStatus:v3];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v31 = [v2 cachedDeveloperProviderStatus];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__13;
  v36 = __Block_byref_object_dispose__13;
  id v37 = 0;
  v11 = [*(id *)(a1 + 56) result];
  id v12 = [v11 forceUnwrapObject];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_22;
  v27[3] = &unk_1E6BD29F8;
  v27[4] = &v28;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2;
  v26[3] = &unk_1E6BD2A20;
  v26[4] = buf;
  [v12 unwrapObject:v27 error:v26];

  [v2 setCachedDeveloperProviderStatus:v29[3]];
  if (v3 == 1 || (uint64_t v13 = v29[3], v13 == 1))
  {
    v14 = 0;
    uint64_t v15 = 1;
  }
  else if (v3 == 2 || v13 == 2)
  {
    v14 = VSPublicError(0, 1, 0);
    uint64_t v15 = 2;
  }
  else
  {
    v19 = v7;
    if (v7 || (v19 = *(void **)(*(void *)&buf[8] + 40)) != 0)
    {
      id v20 = v19;
    }
    else
    {
      VSPublicError(0, 3, 0);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v20;
    uint64_t v15 = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_25;
  v25[3] = &unk_1E6BD42C8;
  v25[4] = *(void *)(a1 + 32);
  v25[5] = v15;
  VSPerformBlockOnMainThread(v25);
  if (*(void *)(a1 + 64))
  {
    v16 = VSDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 136315138;
      v33 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", v32, 0xCu);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_26;
    v21[3] = &unk_1E6BD3720;
    uint64_t v23 = *(id *)(a1 + 64);
    uint64_t v24 = v15;
    id v22 = v14;
    __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_26((uint64_t)v21);
    v17 = VSDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 136315138;
      v33 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1DA674000, v17, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", v32, 0xCu);
    }

    v18 = v23;
  }
  else
  {
    v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 136315138;
      v33 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1DA674000, v18, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", v32, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);
}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  uint64_t v4 = 1;
  if (!result) {
    uint64_t v4 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = VSPublicError(0, 3, v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 40)];
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_26(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_27;
  v4[3] = &unk_1E6BD3720;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v5 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v4);
}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_27(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (int64_t)status
{
  uint64_t v3 = [(VSIdentityProviderAvailabilityInfoCenter *)self preferences];
  int64_t v4 = [v3 forcedAvailabilityStatus];

  if (!v4)
  {
    if (![(VSIdentityProviderAvailabilityInfoCenter *)self hasDeterminedInitialStatus])
    {
      [(VSIdentityProviderAvailabilityInfoCenter *)self setHasDeterminedInitialStatus:1];
      id v5 = [(VSIdentityProviderAvailabilityInfoCenter *)self preferences];
      self->_status = [v5 cachedAvailabilityStatus];
    }
    return self->_status;
  }
  return v4;
}

+ (BOOL)automaticallyNotifiesObserversOfStatus
{
  return 0;
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    [(VSIdentityProviderAvailabilityInfoCenter *)self willChangeValueForKey:@"status"];
    self->_status = a3;
    id v5 = [(VSIdentityProviderAvailabilityInfoCenter *)self preferences];
    [v5 setCachedAvailabilityStatus:a3];

    [(VSIdentityProviderAvailabilityInfoCenter *)self _sendStatusChangeNotification];
    [(VSIdentityProviderAvailabilityInfoCenter *)self didChangeValueForKey:@"status"];
  }
}

- (void)determineIdentityProviderAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VSIdentityProviderAvailabilityInfoCenter determineIdentityProviderAvailabilityWithCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__VSIdentityProviderAvailabilityInfoCenter_determineIdentityProviderAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BD4318;
  id v8 = v4;
  id v6 = v4;
  [(VSIdentityProviderAvailabilityInfoCenter *)self _beginStatusUpdateAttemptWithCompletionHandler:v7];
}

uint64_t __103__VSIdentityProviderAvailabilityInfoCenter_determineIdentityProviderAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Info center received remote notification.", v6, 2u);
  }

  [(VSIdentityProviderAvailabilityInfoCenter *)self _beginStatusUpdateAttemptWithCompletionHandler:0];
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (BOOL)hasDeterminedInitialStatus
{
  return self->_hasDeterminedInitialStatus;
}

- (void)setHasDeterminedInitialStatus:(BOOL)a3
{
  self->_hasDeterminedInitialStatus = a3;
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (void)setPreferences:(id)a3
{
}

- (VSDeveloperServiceConnection)developerServiceConnection
{
  return self->_developerServiceConnection;
}

- (void)setDeveloperServiceConnection:(id)a3
{
}

- (VSAMSBagLoadOperation)mockAMSBagLoadOperation
{
  return self->_mockAMSBagLoadOperation;
}

- (void)setMockAMSBagLoadOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockAMSBagLoadOperation, 0);
  objc_storeStrong((id *)&self->_developerServiceConnection, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);

  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error determining identity provider availability: %@", (uint8_t *)&v2, 0xCu);
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error fetching developer providers: %@", (uint8_t *)&v2, 0xCu);
}

@end