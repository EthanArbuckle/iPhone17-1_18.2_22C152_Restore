@interface HDHealthAppLabConceptObserver
- (HDHAHealthPluginHostFeedGenerator)feedGenerator;
- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3;
- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3 debounceTime:(double)a4;
- (HDProfile)profile;
- (HDUserDomainConceptManager)userDomainConceptManager;
- (OS_dispatch_queue)debounceQueue;
- (_HKDelayedOperation)delayedOperation;
- (void)dealloc;
- (void)debounceRunBackgroundGenerationForNewUserDomainConcepts;
- (void)runBackgroundGenerationForNewUserDomainConcepts;
- (void)setDebounceQueue:(id)a3;
- (void)setDelayedOperation:(id)a3;
- (void)setFeedGenerator:(id)a3;
- (void)setProfile:(id)a3;
- (void)setUserDomainConceptManager:(id)a3;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didJournalUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDHealthAppLabConceptObserver

- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3
{
  return [(HDHealthAppLabConceptObserver *)self initWithProfile:a3 debounceTime:5.0];
}

- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3 debounceTime:(double)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppLabConceptObserver;
  v7 = [(HDHealthAppLabConceptObserver *)&v24 init];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_profile, v6);
    uint64_t v10 = [v6 userDomainConceptManager];
    userDomainConceptManager = v8->_userDomainConceptManager;
    v8->_userDomainConceptManager = (HDUserDomainConceptManager *)v10;

    [(HDUserDomainConceptManager *)v8->_userDomainConceptManager addUserDomainConceptObserver:v8 queue:0];
    v12 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
    feedGenerator = v8->_feedGenerator;
    v8->_feedGenerator = v12;

    uint64_t v14 = HKCreateSerialDispatchQueue();
    debounceQueue = v8->_debounceQueue;
    v8->_debounceQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    id v16 = objc_alloc(MEMORY[0x263F0A9B0]);
    v17 = [(HDHealthAppLabConceptObserver *)v8 debounceQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __62__HDHealthAppLabConceptObserver_initWithProfile_debounceTime___block_invoke;
    v21[3] = &unk_2653588D0;
    objc_copyWeak(&v22, &location);
    uint64_t v18 = [v16 initWithMode:1 queue:v17 delay:v21 block:a4];
    delayedOperation = v8->_delayedOperation;
    v8->_delayedOperation = (_HKDelayedOperation *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __62__HDHealthAppLabConceptObserver_initWithProfile_debounceTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runBackgroundGenerationForNewUserDomainConcepts];
}

- (void)dealloc
{
  [(HDUserDomainConceptManager *)self->_userDomainConceptManager removeUserDomainConceptObserver:self];
  [(_HKDelayedOperation *)self->_delayedOperation invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHealthAppLabConceptObserver;
  [(HDHealthAppLabConceptObserver *)&v3 dealloc];
}

- (void)runBackgroundGenerationForNewUserDomainConcepts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v4 = [WeakRetained profileType];
  BOOL v5 = v4 == 1;
  BOOL v6 = v4 != 1;

  feedGenerator = self->_feedGenerator;
  [(HDHAHealthPluginHostFeedGenerator *)feedGenerator runBackgroundGenerationForPluginIdentifiers:&unk_2701E2430 commitUrgentTransaction:v5 feedItemsOnly:v6];
}

- (void)debounceRunBackgroundGenerationForNewUserDomainConcepts
{
  objc_super v3 = [(HDHealthAppLabConceptObserver *)self debounceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__HDHealthAppLabConceptObserver_debounceRunBackgroundGenerationForNewUserDomainConcepts__block_invoke;
  block[3] = &unk_2653588F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __88__HDHealthAppLabConceptObserver_debounceRunBackgroundGenerationForNewUserDomainConcepts__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayedOperation];
  [v1 execute];
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);
  }
  [(HDHealthAppLabConceptObserver *)self debounceRunBackgroundGenerationForNewUserDomainConcepts];
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);
  }
  [(HDHealthAppLabConceptObserver *)self debounceRunBackgroundGenerationForNewUserDomainConcepts];
}

- (void)userDomainConceptManager:(id)a3 didJournalUserDomainConcepts:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);
  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);
  }
  [(HDHealthAppLabConceptObserver *)self debounceRunBackgroundGenerationForNewUserDomainConcepts];
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  return self->_userDomainConceptManager;
}

- (void)setUserDomainConceptManager:(id)a3
{
}

- (OS_dispatch_queue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
}

- (HDHAHealthPluginHostFeedGenerator)feedGenerator
{
  return self->_feedGenerator;
}

- (void)setFeedGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGenerator, 0);
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_userDomainConceptManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end