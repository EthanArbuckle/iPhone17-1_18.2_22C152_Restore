@interface HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager
- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager)initWithProfile:(id)a3 delegate:(id)a4;
- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManagerDelegate)delegate;
- (NSString)description;
- (id)_queue_fetchFirstOnboardingCompletion;
- (void)_enqueueMigration;
- (void)_queue_fetchFirstOnboardingCompletion;
- (void)_queue_migrateNotificationOnboardingCompletionToOnboardingAcknowledgement;
- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:(id)a3;
- (void)_queue_reconcileFeatures;
- (void)_startObservation;
- (void)daemonReady:(id)a3;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager

- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager;
  v8 = [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    [WeakRetained registerProfileReadyObserver:v9 queue:0];
  }
  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@>", objc_opt_class()];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [a3 daemon];
  [v4 registerDaemonReadyObserver:self queue:0];
}

- (void)daemonReady:(id)a3
{
  [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)self _enqueueMigration];
  [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)self _startObservation];
}

- (void)_startObservation
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained featureSettingsManager];
  [v5 registerObserver:self featureIdentifier:*MEMORY[0x263F09810] queue:self->_queue];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  id v6 = [v7 onboardingCompletionManager];
  [v6 registerObserver:self featureIdentifier:*MEMORY[0x263F09818] queue:self->_queue];
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_221A40000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature settings changed for classifications, triggering migration", (uint8_t *)&v6, 0xCu);
  }
  [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)self _enqueueMigration];
}

- (void)onboardingCompletionManager:(id)a3 didUpdateOnboardingCompletionsForFeatureIdentifier:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09940];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_221A40000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion changed for notifications, triggering migration", (uint8_t *)&v6, 0xCu);
  }
  [(HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager *)self _enqueueMigration];
}

- (void)_enqueueMigration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke;
  v6[3] = &unk_2645D7B40;
  v6[4] = self;
  [v4 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v6];
}

void __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained daemon];
  id v4 = [v3 maintenanceWorkCoordinator];
  v5 = (void *)MEMORY[0x263F43248];
  int v6 = [*(id *)(a1 + 32) description];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 16);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke_2;
  v10[3] = &unk_2645D7B40;
  v10[4] = v7;
  v9 = [v5 maintenanceOperationWithName:v6 queue:v8 synchronousBlock:v10];
  [v4 enqueueMaintenanceOperation:v9];
}

uint64_t __89__HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager__enqueueMigration__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileFeatures");
}

- (void)_queue_reconcileFeatures
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error while retrieving onboarding completions, stopping onboarding acknowledgement migration: %{public}@");
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = objc_alloc(MEMORY[0x263F0A5B0]);
  uint64_t v7 = *MEMORY[0x263F09818];
  uint64_t v8 = [v5 completionDate];
  uint64_t v9 = [v5 countryCode];

  uint64_t v10 = (void *)[v6 initWithFeatureIdentifier:v7 version:1 completionDate:v8 countryCode:v9 countryCodeProvenance:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = [WeakRetained onboardingCompletionManager];
  id v16 = 0;
  LOBYTE(v9) = [v12 insertOnboardingCompletion:v10 error:&v16];
  id v13 = v16;

  _HKInitializeLogging();
  objc_super v14 = *MEMORY[0x263F09940];
  v15 = *MEMORY[0x263F09940];
  if (v9)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:]((uint64_t)self, v14);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:]();
  }
}

- (void)_queue_migrateNotificationOnboardingCompletionToOnboardingAcknowledgement
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error while setting onboarding acknowledged setting: %{public}@");
}

- (id)_queue_fetchFirstOnboardingCompletion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained onboardingCompletionManager];
  uint64_t v4 = *MEMORY[0x263F09810];
  id v9 = 0;
  id v5 = [v3 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v4 error:&v9];
  id v6 = v9;

  if (v5)
  {
    uint64_t v7 = [v5 firstObject];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      -[HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManager _queue_fetchFirstOnboardingCompletion]();
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HDMobilityWalkingSteadinessOnboardingAcknowledgementMigrationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221A40000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Notification onboarding completion saved to reflect onboarding acknowledgement in classifications feature setting", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_migrateOnboardingAcknowledgementToNotificationOnboardingCompletionWithClassificationCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error while setting onboarding completion for notifications: %{public}@");
}

- (void)_queue_fetchFirstOnboardingCompletion
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_221A40000, v0, v1, "[%{public}@] Error while retrieving onboarding completions for classifications, stopping onboarding acknowledgement migration: %{public}@");
}

@end