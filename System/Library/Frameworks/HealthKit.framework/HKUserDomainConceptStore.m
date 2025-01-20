@interface HKUserDomainConceptStore
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)_synchronouslyObserveUserDomainConceptChanges:(id *)a3;
- (HKUserDomainConceptStore)init;
- (HKUserDomainConceptStore)initWithHealthStore:(id)a3;
- (HKUserDomainConceptStoreDelegate)delegate;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_clientQueue_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4;
- (void)_createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier:(id)a3 supplementaryProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6;
- (void)_handleAutomaticProxyReconnection;
- (void)_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4;
- (void)_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5;
- (void)client_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4;
- (void)deleteUserDomainConcept:(id)a3 completion:(id)a4;
- (void)deleteUserDomainConcepts:(id)a3 completion:(id)a4;
- (void)saveOrUpdateUserDomainConcept:(id)a3 completion:(id)a4;
- (void)saveOrUpdateUserDomainConcepts:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 completion:(id)a4;
@end

@implementation HKUserDomainConceptStore

- (HKUserDomainConceptStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKUserDomainConceptStore;
  v5 = [(HKUserDomainConceptStore *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v4 taskIdentifier:@"HKUserDomainConceptStoreServerIdentifier" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = v8;

    objc_initWeak(&location, v5);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __48__HKUserDomainConceptStore_initWithHealthStore___block_invoke;
    v14 = &unk_1E58BE428;
    objc_copyWeak(&v15, &location);
    [(HKProxyProvider *)v5->_proxyProvider setAutomaticProxyReconnectionHandler:&v11];
    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v11, v12, v13, v14);
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __48__HKUserDomainConceptStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)saveOrUpdateUserDomainConcepts:(id)a3 completion:(id)a4
{
}

- (void)saveOrUpdateUserDomainConcept:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v10 count:1];

  -[HKUserDomainConceptStore saveOrUpdateUserDomainConcepts:completion:](self, "saveOrUpdateUserDomainConcepts:completion:", v9, v7, v10, v11);
}

- (void)deleteUserDomainConcept:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v10 count:1];

  -[HKUserDomainConceptStore _storeUserDomainConcepts:method:completion:](self, "_storeUserDomainConcepts:method:completion:", v9, 3, v7, v10, v11);
}

- (void)deleteUserDomainConcepts:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = HKLogHealthOntology();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcepts: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(HKUserDomainConceptStore *)self _storeUserDomainConcepts:v6 method:3 completion:v7];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__HKUserDomainConceptStore_setDelegate___block_invoke;
  v6[3] = &unk_1E58BBE28;
  id v7 = v4;
  id v5 = v4;
  [(HKUserDomainConceptStore *)self setDelegate:v5 completion:v6];
}

void __40__HKUserDomainConceptStore_setDelegate___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = HKStringFromBool(*(void *)(a1 + 32) != 0);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Error changing shouldObserve to '%@': %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (HKUserDomainConceptStoreDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HKUserDomainConceptStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3 completion:(id)a4
{
  p_lock = &self->_lock;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id obj = a3;
  os_unfair_lock_lock(p_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = (obj != 0) ^ (WeakRetained == 0);

  id v10 = objc_storeWeak((id *)&self->_delegate, obj);
  id v11 = v10;
  os_unfair_lock_unlock(p_lock);
  if (v9) {
    v7[2](v7, 1, 0);
  }
  else {
    [(HKUserDomainConceptStore *)self _observeUserDomainConceptChanges:obj != 0 completion:v7];
  }
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void)client_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HKUserDomainConceptStore_client_notifyForChangesToUserDomainConcepts_changeType___block_invoke;
  block[3] = &unk_1E58BBBF8;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

uint64_t __83__HKUserDomainConceptStore_client_notifyForChangesToUserDomainConcepts_changeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyForChangesToUserDomainConcepts:changeType:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52430];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_storeUserDomainConcepts_method_completion_, 0, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_createAndStoreUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_completion_, 1, 0);

  return v2;
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECFC7F8];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_notifyForChangesToUserDomainConcepts_changeType_, 0, 0);

  return v2;
}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  char v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke;
  v15[3] = &unk_1E58C0030;
  v15[4] = self;
  id v16 = v8;
  int64_t v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke_78;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

void __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogHealthOntology();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    uint64_t v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) count];
      char v9 = HKStringFromUserDomainConceptStoreMethod(*(void *)(a1 + 56));
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: Store %ld concepts with method '%@'", (uint8_t *)&v10, 0x20u);
    }
  }
  objc_msgSend(v3, "remote_storeUserDomainConcepts:method:completion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t __71__HKUserDomainConceptStore__storeUserDomainConcepts_method_completion___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke;
  v11[3] = &unk_1E58C0058;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeUserDomainConceptChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__HKUserDomainConceptStore__observeUserDomainConceptChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyObserveUserDomainConceptChanges:(id *)a3
{
  uint64_t v17 = 0;
  int64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__11;
  uint64_t v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke;
  v10[3] = &unk_1E58C0080;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  uint64_t v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_2;
  v3[3] = &unk_1E58BE050;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeUserDomainConceptChanges:completion:", 1, v3);
}

void __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __74__HKUserDomainConceptStore__synchronouslyObserveUserDomainConceptChanges___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)_clientQueue_notifyForChangesToUserDomainConcepts:(id)a3 changeType:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HKUserDomainConceptStore *)self delegate];
  _HKInitializeLogging();
  char v9 = HKLogHealthOntology();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    uint64_t v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v6 count];
      uint64_t v13 = HKStringFromUserDomainConceptStoreChangeType(a4);
      int v14 = 138543874;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_INFO, "%{public}@: Received %ld changes of type %@", (uint8_t *)&v14, 0x20u);
    }
  }
  switch(a4)
  {
    case 3:
      [v8 userDomainConceptStore:self didDeleteUserDomainConcepts:v6];
      break;
    case 2:
      [v8 userDomainConceptStore:self didUpdateUserDomainConcepts:v6];
      break;
    case 1:
      [v8 userDomainConceptStore:self didAddUserDomainConcepts:v6];
      break;
  }
}

- (void)_createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier:(id)a3 supplementaryProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v13];
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke;
  v23[3] = &unk_1E58C00A8;
  v23[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke_80;
  v21[3] = &unk_1E58BBD88;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v23 errorHandler:v21];
}

void __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogHealthOntology();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = HKLogHealthOntology();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) rawIdentifier];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: creating and storing user domain concept with identifier %lld", (uint8_t *)&v9, 0x16u);
    }
  }
  objc_msgSend(v3, "remote_createAndStoreUserDomainConceptWithConceptIdentifier:additionalProperties:userDomainConceptTypeIdentifier:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t __165__HKUserDomainConceptStore__createAndStoreUserDomainConceptBackedByOntologyConceptWithIdentifier_supplementaryProperties_userDomainConceptTypeIdentifier_completion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end