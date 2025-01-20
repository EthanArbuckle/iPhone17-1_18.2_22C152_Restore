@interface HDExampleFeatureProfileExtension
- (HDExampleFeatureProfileExtension)initWithProfile:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
@end

@implementation HDExampleFeatureProfileExtension

- (HDExampleFeatureProfileExtension)initWithProfile:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F29D38];
  id v5 = a3;
  v6 = HKLogInfrastructure();
  id v7 = v5;
  id v8 = v4;
  id v9 = v6;
  if (self)
  {
    v32.receiver = self;
    v32.super_class = (Class)HDExampleFeatureProfileExtension;
    v10 = [(HDExampleFeatureProfileExtension *)&v32 init];
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_featureIdentifier, v4);
      objc_storeWeak((id *)&self->_profile, v7);
      v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v12 = [v11 isAppleInternalInstall];

      if (v12)
      {
        v13 = [HDOTAFeatureDisableAndExpiryProvider alloc];
        v14 = [v7 daemon];
        v15 = [(HDOTAFeatureDisableAndExpiryProvider *)v13 initWithDaemon:v14 featureIdentifier:v8];

        v16 = [HDLocalCountrySetAvailabilityProvider alloc];
        v17 = [MEMORY[0x1E4F2AE70] emptyCountrySet];
        v18 = [v7 daemon];
        v19 = [(HDLocalCountrySetAvailabilityProvider *)v16 initWithFeatureIdentifier:v8 defaultCountrySet:v17 healthDaemon:v18];

        id v20 = objc_alloc(MEMORY[0x1E4F2B028]);
        uint64_t v34 = *MEMORY[0x1E4F29C20];
        v21 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v8];
        v33 = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        v35[0] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
        v24 = (void *)[v20 initWithRequirementsByContext:v23];

        v25 = [[HDFeatureAvailabilityManager alloc] initWithProfile:v7 featureIdentifier:v8 availabilityRequirements:v24 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v19 disableAndExpiryProvider:v15 loggingCategory:v9];
        featureAvailabilityManager = self->_featureAvailabilityManager;
        self->_featureAvailabilityManager = v25;

        HKCreateSerialDispatchQueue();
        v27 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
        queue = self->_queue;
        self->_queue = v27;

        v29 = [[HDNotificationSyncClient alloc] initWithProfile:v7 clientIdentifier:v8 queue:self->_queue];
        notificationSyncClient = self->_notificationSyncClient;
        self->_notificationSyncClient = v29;

        [(HDNotificationSyncClient *)self->_notificationSyncClient setDelegate:self];
      }
    }
  }

  return self;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  if ([a3 isEqualToString:self->_featureIdentifier]) {
    v4 = self->_featureAvailabilityManager;
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x1E4F29F80];
  id v8 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    v10 = objc_opt_class();
    id v11 = v10;
    int v12 = NSStringFromHKNotificationInstructionAction();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    __int16 v54 = 2112;
    id v55 = v12;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v14 = [WeakRetained notificationManager];

  if (a4 == 1)
  {
    id v47 = 0;
    id v15 = [v6 pendingNotificationDismissInstructionsWithError:&v47];
    id v16 = v47;
    if (v15)
    {
      v26 = [v15 categoryIdentifiers];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        v28 = [v14 userNotificationCenter];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_295;
        v42[3] = &unk_1E62FE900;
        id v43 = v14;
        id v44 = v6;
        id v45 = v15;
        v46 = self;
        id v15 = v15;
        [v28 getDeliveredNotificationsWithCompletionHandler:v42];

        goto LABEL_20;
      }
      _HKInitializeLogging();
      os_log_t v39 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      v36 = v39;
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v53 = v40;
      id v38 = v40;
LABEL_19:
      _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] No valid instructions found", buf, 0xCu);

      goto LABEL_20;
    }
    _HKInitializeLogging();
    os_log_t v34 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v30 = v34;
      v41 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v53 = v41;
      __int16 v54 = 2114;
      id v55 = v16;
      id v32 = v41;
      v33 = "[%{public}@] Error retrieving dismiss instructions: %{public}@";
      goto LABEL_23;
    }
LABEL_14:
    id v15 = 0;
    goto LABEL_20;
  }
  if (a4 == 3)
  {
    id v51 = 0;
    id v15 = [v6 pendingNotificationSendInstructionsWithError:&v51];
    id v16 = v51;
    if (v15)
    {
      v17 = [v15 categoryIdentifiers];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F445B0]);
        [v19 setTitle:@"Example Feature [Internal Only]"];
        id v20 = [v15 categoryIdentifiers];
        v21 = [v20 allObjects];
        v22 = [v21 componentsJoinedByString:@"\n"];
        [v19 setBody:v22];

        v23 = [MEMORY[0x1E4F29128] UUID];
        v24 = [v23 UUIDString];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke;
        v48[3] = &unk_1E62F2EF8;
        v48[4] = self;
        id v49 = v6;
        id v50 = v15;
        id v25 = v15;
        [v14 postNotificationWithIdentifier:v24 content:v19 trigger:0 completion:v48];

        id v15 = v19;
LABEL_20:

        goto LABEL_21;
      }
      _HKInitializeLogging();
      os_log_t v35 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      v36 = v35;
      v37 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      id v38 = v37;
      goto LABEL_19;
    }
    _HKInitializeLogging();
    os_log_t v29 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      v31 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v53 = v31;
      __int16 v54 = 2114;
      id v55 = v16;
      id v32 = v31;
      v33 = "[%{public}@] Error retrieving send instructions: %{public}@";
LABEL_23:
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_21:
}

void __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4F29F80];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v7 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v13 = v7;
      *(_DWORD *)buf = 138543618;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v5;
      id v14 = v21;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post notifications %{public}@", buf, 0x16u);
    }
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v19 = 0;
  char v10 = [v8 markPendingNotificationInstructionsAsProcessed:v9 error:&v19];
  id v11 = v19;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      id v15 = v12;
      id v16 = objc_opt_class();
      v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v21 = v16;
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v11;
      id v18 = v16;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to process pending notifications: %{public}@ %{public}@", buf, 0x20u);
    }
  }
}

void __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_295(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a2, "hk_map:", &__block_literal_global_85);
  v4 = [*(id *)(a1 + 32) userNotificationCenter];
  [v4 removeDeliveredNotificationsWithIdentifiers:v3];

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v14 = 0;
  char v7 = [v5 markPendingNotificationInstructionsAsProcessed:v6 error:&v14];
  id v8 = v14;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = (void *)*MEMORY[0x1E4F29F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
    {
      char v10 = v9;
      id v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v8;
      id v13 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to process pending notifications: %{public}@ %{public}@", buf, 0x20u);
    }
  }
}

id __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 request];
  v3 = [v2 identifier];

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end