@interface HDHealthAppDaemonExtension
- (HDDaemon)daemon;
- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3;
- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3 queue:(id)a4;
- (HDHealthAppRestorableAlarmManager)restorableAlarmManager;
- (HDHealthAppSharingReminderRestorableAlarm)sharableReminderAlarm;
- (NSSet)observedProfileIdentifiers;
- (OS_dispatch_queue)queue;
- (_HKDelayedOperation)delayedOperation;
- (id)unitTest_profileReadyObserverDidFinish;
- (os_unfair_lock_s)observerLock;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)profileListDidChange;
- (void)resetProfileObservers;
- (void)setDaemon:(id)a3;
- (void)setDelayedOperation:(id)a3;
- (void)setObservedProfileIdentifiers:(id)a3;
- (void)setObserverLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setRestorableAlarmManager:(id)a3;
- (void)setSharableReminderAlarm:(id)a3;
- (void)setUnitTest_profileReadyObserverDidFinish:(id)a3;
- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3;
- (void)sharingEntriesDidUpdate:(id)a3;
- (void)updateSharingReminderScheduledAlarm;
@end

@implementation HDHealthAppDaemonExtension

- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3
{
  id v4 = a3;
  v5 = HKCreateSerialDispatchQueue();
  v6 = [(HDHealthAppDaemonExtension *)self initWithDaemon:v4 queue:v5];

  return v6;
}

- (HDHealthAppDaemonExtension)initWithDaemon:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppDaemonExtension;
  v8 = [(HDHealthAppDaemonExtension *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v8->_observerLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_daemon, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_daemon);
    [WeakRetained registerDaemonReadyObserver:v9 queue:v9->_queue];

    id v11 = objc_loadWeakRetained((id *)&v9->_daemon);
    v12 = [v11 primaryProfile];
    [v12 registerProfileReadyObserver:v9 queue:v9->_queue];

    v13 = [HDHealthAppRestorableAlarmManager alloc];
    id v14 = objc_loadWeakRetained((id *)&v9->_daemon);
    uint64_t v15 = [(HDHealthAppRestorableAlarmManager *)v13 initWithDaemon:v14];
    restorableAlarmManager = v9->_restorableAlarmManager;
    v9->_restorableAlarmManager = (HDHealthAppRestorableAlarmManager *)v15;

    v17 = [HDHealthAppSharingReminderRestorableAlarm alloc];
    id v18 = objc_loadWeakRetained((id *)&v9->_daemon);
    uint64_t v19 = [(HDHealthAppSharingReminderRestorableAlarm *)v17 initWithDaemon:v18];
    sharableReminderAlarm = v9->_sharableReminderAlarm;
    v9->_sharableReminderAlarm = (HDHealthAppSharingReminderRestorableAlarm *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F0A9B0]) initWithMode:1 queue:v9->_queue delay:&__block_literal_global_1 block:0.5];
    delayedOperation = v9->_delayedOperation;
    v9->_delayedOperation = (_HKDelayedOperation *)v21;
  }
  return v9;
}

void __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_250D3F000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because of profile list change", buf, 2u);
  }
  v1 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke_290;
  v3[3] = &unk_265358968;
  id v4 = v1;
  v2 = v1;
  [(HealthAppHealthDaemonOrchestrationClient *)v2 requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:v3];
}

void __51__HDHealthAppDaemonExtension_initWithDaemon_queue___block_invoke_290()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_250D3F000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation operation return", v1, 2u);
  }
}

- (void)dealloc
{
  [(_HKDelayedOperation *)self->_delayedOperation invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v4 = [WeakRetained profileManager];
  [v4 removeProfileManagerObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_daemon);
  id v6 = [v5 primaryProfile];
  id v7 = [v6 sharingEntryManager];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)HDHealthAppDaemonExtension;
  [(HDHealthAppDaemonExtension *)&v8 dealloc];
}

- (void)resetProfileObservers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  v3 = (void *)MEMORY[0x263EFFA08];
  location = (id *)&self->_daemon;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v5 = [WeakRetained profileManager];
  id v6 = [v5 allProfileIdentifiers];
  id v7 = [v3 setWithArray:v6];

  v25 = self;
  objc_super v8 = self->_observedProfileIdentifiers;
  v9 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ([(NSSet *)v8 containsObject:v15])
        {
          [(NSSet *)v9 addObject:v15];
        }
        else
        {
          id v16 = objc_loadWeakRetained(location);
          v17 = [v16 profileManager];
          id v18 = [v17 profileForIdentifier:v15];

          if (v18 && [v18 profileType] == 2)
          {
            _HKInitializeLogging();
            uint64_t v19 = (void *)*MEMORY[0x263F09968];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              uint64_t v21 = [v18 profileIdentifier];
              *(_DWORD *)buf = 138412290;
              v32 = v21;
              _os_log_impl(&dword_250D3F000, v20, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension observing changes for: %@", buf, 0xCu);
            }
            v22 = [v18 sharedSummaryManager];
            [v22 registerObserver:v25];

            [(NSSet *)v9 addObject:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v12);
  }

  observedProfileIdentifiers = v25->_observedProfileIdentifiers;
  v25->_observedProfileIdentifiers = v9;

  os_unfair_lock_unlock(lock);
}

- (void)daemonReady:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_250D3F000, v5, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension reported daemon ready, starting observing for profile list changes", v10, 2u);
  }
  id v6 = [v4 profileManager];
  [v6 addProfileManagerObserver:self];

  [(HDHealthAppDaemonExtension *)self resetProfileObservers];
  id v7 = [v4 primaryProfile];
  objc_super v8 = [v7 sharingEntryManager];
  [v8 addObserver:self];

  v9 = [v4 postInstallUpdateManager];

  [v9 registerUpdateTaskHandler:self queue:0];
}

- (void)profileDidBecomeReady:(id)a3
{
  [(HDHealthAppDaemonExtension *)self updateSharingReminderScheduledAlarm];
  id unitTest_profileReadyObserverDidFinish = self->_unitTest_profileReadyObserverDidFinish;
  if (unitTest_profileReadyObserverDidFinish)
  {
    id v5 = (void (*)(void))*((void *)unitTest_profileReadyObserverDidFinish + 2);
    v5();
  }
}

- (void)profileListDidChange
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension profile list changed", buf, 2u);
  }
  [(HDHealthAppDaemonExtension *)self resetProfileObservers];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HDHealthAppDaemonExtension_profileListDidChange__block_invoke;
  block[3] = &unk_2653588F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__HDHealthAppDaemonExtension_profileListDidChange__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delayedOperation];
  [v1 execute];
}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  id v4 = a4;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_250D3F000, v5, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because of install/update", buf, 2u);
  }
  id v6 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__HDHealthAppDaemonExtension_performPostInstallUpdateTaskForManager_completion___block_invoke;
  v9[3] = &unk_265358D90;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [(HealthAppHealthDaemonOrchestrationClient *)v7 requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:v9];
}

uint64_t __80__HDHealthAppDaemonExtension_performPostInstallUpdateTaskForManager_completion___block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_250D3F000, v2, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation for all request returning", v4, 2u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension requesting background generation because transactions changed", buf, 2u);
  }
  id v4 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__HDHealthAppDaemonExtension_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke;
  v6[3] = &unk_265358968;
  id v7 = v4;
  id v5 = v4;
  [(HealthAppHealthDaemonOrchestrationClient *)v5 requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:v6];
}

void __81__HDHealthAppDaemonExtension_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_250D3F000, v0, OS_LOG_TYPE_DEFAULT, "HDHealthAppDaemonExtension background generation for feed triggered by transactions request returning", v1, 2u);
  }
}

- (void)sharingEntriesDidUpdate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDHealthAppDaemonExtension *)self updateSharingReminderScheduledAlarm];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *)v4;
  uint64_t v6 = [(HealthAppHealthDaemonOrchestrationClient *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  id v7 = v5;
  if (!v6)
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v8 = v6;
  char v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v5);
      }
      id v12 = *(id *)(*((void *)&v20 + 1) + 8 * i);
      if ([v12 direction] == 1 && !objc_msgSend(v12, "status")
        || ![v12 direction] && objc_msgSend(v12, "status") == 1)
      {
        char v9 = 1;
      }
    }
    uint64_t v8 = [(HealthAppHealthDaemonOrchestrationClient *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v8);

  if (v9)
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      id v16 = v15;
      _os_log_impl(&dword_250D3F000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running background generation because sharing entries changed", buf, 0xCu);
    }
    v17 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__HDHealthAppDaemonExtension_sharingEntriesDidUpdate___block_invoke;
    v18[3] = &unk_265358DB8;
    v18[4] = self;
    uint64_t v19 = v17;
    id v7 = v17;
    [(HealthAppHealthDaemonOrchestrationClient *)v7 runOrRequestBackgroundGenerationWithCompletion:v18];

    goto LABEL_17;
  }
LABEL_18:
}

void __54__HDHealthAppDaemonExtension_sharingEntriesDidUpdate___block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v0 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    id v1 = v0;
    int v3 = 138543362;
    id v4 = (id)objc_opt_class();
    id v2 = v4;
    _os_log_impl(&dword_250D3F000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@] background generation for feed triggered by sharing entries request returning", (uint8_t *)&v3, 0xCu);
  }
}

- (void)updateSharingReminderScheduledAlarm
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1(&dword_250D3F000, v3, v4, "[%{public}@] Could not fetch sharing entries: %{public}@", v5, v6, v7, v8, 2u);
}

- (HDHealthAppRestorableAlarmManager)restorableAlarmManager
{
  return self->_restorableAlarmManager;
}

- (void)setRestorableAlarmManager:(id)a3
{
}

- (HDHealthAppSharingReminderRestorableAlarm)sharableReminderAlarm
{
  return self->_sharableReminderAlarm;
}

- (void)setSharableReminderAlarm:(id)a3
{
}

- (id)unitTest_profileReadyObserverDidFinish
{
  return self->_unitTest_profileReadyObserverDidFinish;
}

- (void)setUnitTest_profileReadyObserverDidFinish:(id)a3
{
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (void)setDaemon:(id)a3
{
}

- (NSSet)observedProfileIdentifiers
{
  return self->_observedProfileIdentifiers;
}

- (void)setObservedProfileIdentifiers:(id)a3
{
}

- (os_unfair_lock_s)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(os_unfair_lock_s)a3
{
  self->_observerLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observedProfileIdentifiers, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_sharableReminderAlarm, 0);
  objc_storeStrong((id *)&self->_restorableAlarmManager, 0);
  objc_storeStrong(&self->_unitTest_profileReadyObserverDidFinish, 0);
}

@end