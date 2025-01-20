@interface HDUserDomainConceptStoreTaskServer
+ (id)taskIdentifier;
- (HDUserDomainConceptStoreTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_storeUserDomainConcepts:(uint64_t)a3 method:(uint64_t)a4 error:;
- (void)_notifyClientForChangesOfType:(void *)a3 userDomainConcepts:;
- (void)dealloc;
- (void)remote_createAndStoreUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6;
- (void)remote_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4;
- (void)remote_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDUserDomainConceptStoreTaskServer

- (HDUserDomainConceptStoreTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDUserDomainConceptStoreTaskServer;
  v11 = [(HDStandardTaskServer *)&v16 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = [v10 profile];
    uint64_t v13 = [v12 userDomainConceptManager];
    userDomainConceptManager = v11->_userDomainConceptManager;
    v11->_userDomainConceptManager = (HDUserDomainConceptManager *)v13;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_shouldObserveChanges = 0;
  }

  return v11;
}

- (void)dealloc
{
  [(HDUserDomainConceptManager *)self->_userDomainConceptManager removeUserDomainConceptObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDUserDomainConceptStoreTaskServer;
  [(HDUserDomainConceptStoreTaskServer *)&v3 dealloc];
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2AA98];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B688] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B688] serverInterface];
}

- (void)remote_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5
{
  id v11 = 0;
  v8 = (void (**)(id, uint64_t, id))a5;
  uint64_t v9 = -[HDUserDomainConceptStoreTaskServer _storeUserDomainConcepts:method:error:]((uint64_t)self, a3, a4, (uint64_t)&v11);
  id v10 = v11;
  v8[2](v8, v9, v10);
}

- (uint64_t)_storeUserDomainConcepts:(uint64_t)a3 method:(uint64_t)a4 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v8 = HKLogHealthOntology();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      id v10 = HKLogHealthOntology();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v7 count];
        v12 = HKStringFromUserDomainConceptStoreMethod();
        int v15 = 138543874;
        uint64_t v16 = a1;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Store %ld concepts with method '%@'", (uint8_t *)&v15, 0x20u);
      }
    }
    uint64_t v13 = [*(id *)(a1 + 40) modifyUserDomainConcepts:v7 method:a3 error:a4];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)remote_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  p_lock = &self->_lock;
  v8 = (void (**)(id, uint64_t, void))a4;
  os_unfair_lock_lock(p_lock);
  self->_shouldObserveChanges = v4;
  userDomainConceptManager = self->_userDomainConceptManager;
  if (v4) {
    [(HDUserDomainConceptManager *)userDomainConceptManager addUserDomainConceptObserver:self queue:0];
  }
  else {
    [(HDUserDomainConceptManager *)userDomainConceptManager removeUserDomainConceptObserver:self];
  }
  os_unfair_lock_unlock(p_lock);
  v8[2](v8, 1, 0);
}

- (void)remote_createAndStoreUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = (void (**)(id, void, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(HDStandardTaskServer *)self profile];
  id v22 = 0;
  int v15 = +[HDUserDomainConceptEntity createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:v13 additionalProperties:v12 userDomainConceptTypeIdentifier:v11 profile:v14 error:&v22];

  id v16 = v22;
  if (v15)
  {
    v23[0] = v15;
    __int16 v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v21 = v16;
    int v18 = -[HDUserDomainConceptStoreTaskServer _storeUserDomainConcepts:method:error:]((uint64_t)self, v17, 1, (uint64_t)&v21);
    id v19 = v21;

    if (v18) {
      v20 = v15;
    }
    else {
      v20 = 0;
    }
    ((void (**)(id, void *, id))v10)[2](v10, v20, v19);
    id v16 = v19;
  }
  else
  {
    v10[2](v10, 0, v16);
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (void)_notifyClientForChangesOfType:(void *)a3 userDomainConcepts:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if (*(unsigned char *)(a1 + 52))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __87__HDUserDomainConceptStoreTaskServer__notifyClientForChangesOfType_userDomainConcepts___block_invoke;
      v13[3] = &unk_1E62FD230;
      v13[4] = a1;
      id v6 = v5;
      id v14 = v6;
      uint64_t v15 = a2;
      id v7 = [(id)a1 remoteObjectProxyWithErrorHandler:v13];
      _HKInitializeLogging();
      v8 = HKLogHealthOntology();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

      if (v9)
      {
        id v10 = HKLogHealthOntology();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [v6 count];
          id v12 = HKStringFromUserDomainConceptStoreChangeType();
          *(_DWORD *)buf = 138543874;
          uint64_t v17 = a1;
          __int16 v18 = 2048;
          uint64_t v19 = v11;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for %ld changes of type '%@'", buf, 0x20u);
        }
      }
      objc_msgSend(v7, "client_notifyForChangesToUserDomainConcepts:changeType:", v6, a2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
}

void __87__HDUserDomainConceptStoreTaskServer__notifyClientForChangesOfType_userDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  BOOL v4 = HKLogHealthOntology();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) count];
    id v7 = HKStringFromUserDomainConceptStoreChangeType();
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for %ld changes of type '%@': %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void).cxx_destruct
{
}

@end