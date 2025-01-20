@interface HDHRAFibBurdenRescindedNotificationManager
- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3;
- (BOOL)_isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:(id)a3;
- (BOOL)_unitTesting_postNotificationRequestIfNecessary:(id)a3;
- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4;
- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 keyValueDomain:(id)a5 protectedDataOperation:(id)a6;
- (id)_rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:(id)a3;
- (id)_rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:(id)a3;
- (id)_rescindedRequirementIdentifiers;
- (id)unitTesting_postNotificationHandler;
- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:(id)a3;
- (void)_operation_pullFeatureStatusAndPresentAlertIfNeeded;
- (void)_sendNotificationRequest:(id)a3;
- (void)_showRescindedNotificationWithTitleKey:(id)a3 bodyKey:(id)a4;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6;
- (void)profileDidBecomeReady:(id)a3;
- (void)setUnitTesting_postNotificationHandler:(id)a3;
@end

@implementation HDHRAFibBurdenRescindedNotificationManager

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F65B28];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "hdhr_aFibBurdenProtectedLocalDomainForProfile:", v8);
  id v10 = objc_alloc(MEMORY[0x1E4F65BC0]);
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = (void *)[v10 initWithProfile:v8 debugIdentifier:v12 delegate:0];

  v14 = [(HDHRAFibBurdenRescindedNotificationManager *)self initWithProfile:v8 featureStatusProvider:v7 keyValueDomain:v9 protectedDataOperation:v13];
  return v14;
}

- (HDHRAFibBurdenRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 keyValueDomain:(id)a5 protectedDataOperation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenRescindedNotificationManager;
  v14 = [(HDHRAFibBurdenRescindedNotificationManager *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_featureStatusProvider, a4);
    objc_storeStrong((id *)&v15->_localKeyValueDomain, a5);
    objc_storeStrong((id *)&v15->_protectedDataOperation, a6);
    [(HDProtectedDataOperation *)v15->_protectedDataOperation setDelegate:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    [WeakRetained registerProfileReadyObserver:v15 queue:0];
  }
  return v15;
}

- (void)dealloc
{
  [(HKFeatureStatusProviding *)self->_featureStatusProvider unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDHRAFibBurdenRescindedNotificationManager;
  [(HDHRAFibBurdenRescindedNotificationManager *)&v3 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  [(HKFeatureStatusProviding *)self->_featureStatusProvider registerObserver:self queue:0];
  protectedDataOperation = self->_protectedDataOperation;
  id v8 = 0;
  char v5 = [(HDProtectedDataOperation *)protectedDataOperation requestWorkWithPriority:2 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenRescindedNotificationManager profileDidBecomeReady:]();
    }
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Feature status did change to: %@", buf, 0x16u);
  }

  protectedDataOperation = self->_protectedDataOperation;
  id v11 = 0;
  char v8 = [(HDProtectedDataOperation *)protectedDataOperation requestWorkWithPriority:2 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    id v10 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDHRAFibBurdenRescindedNotificationManager featureStatusProviding:didUpdateFeatureStatus:]();
    }
  }
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  id v7 = (void (**)(void))a6;
  [(HDHRAFibBurdenRescindedNotificationManager *)self _operation_pullFeatureStatusAndPresentAlertIfNeeded];
  v7[2]();
}

- (void)_operation_pullFeatureStatusAndPresentAlertIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Failed to load feature status with error: %@");
}

- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = [a3 requirementsEvaluationByContext];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];

  if (![(HDHRAFibBurdenRescindedNotificationManager *)self _isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:v5])
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    id v28 = 0;
    char v8 = [(HDKeyValueDomain *)localKeyValueDomain dateForKey:@"HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey" error:&v28];
    id v9 = v28;
    if (v9)
    {
      _HKInitializeLogging();
      id v10 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HDHRAFibBurdenRescindedNotificationManager _operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:].cold.4();
      }

      goto LABEL_9;
    }
    if ([(HDHRAFibBurdenRescindedNotificationManager *)self _isFeatureRescindedWithRequirementsEvaluation:v5])
    {
      _HKInitializeLogging();
      id v11 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = self;
        __int16 v31 = 2112;
        v32 = v8;
        _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is rescinded (last shown date: %@)", buf, 0x16u);
      }

      if (v8) {
        goto LABEL_9;
      }
      id v12 = [v5 unsatisfiedRequirementIdentifiers];
      id v13 = [(HDHRAFibBurdenRescindedNotificationManager *)self _rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:v12];
      uint64_t v14 = [(HDHRAFibBurdenRescindedNotificationManager *)self _rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:v12];
      id v15 = (__CFString *)v14;
      if (!v13 || !v14)
      {
        uint64_t v16 = [v5 unsatisfiedRequirementIdentifiers];
        v17 = [v16 componentsJoinedByString:@", "];

        _HKInitializeLogging();
        objc_super v18 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[HDHRAFibBurdenRescindedNotificationManager _operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:]();
        }

        id v15 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_BODY";
        id v13 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_TITLE";
      }
      [(HDHRAFibBurdenRescindedNotificationManager *)self _showRescindedNotificationWithTitleKey:v13 bodyKey:v15];
      v19 = self->_localKeyValueDomain;
      v20 = [MEMORY[0x1E4F1C9C8] date];
      id v27 = 0;
      [(HDKeyValueDomain *)v19 setDate:v20 forKey:@"HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey" error:&v27];
      id v21 = v27;

      if (v21)
      {
        _HKInitializeLogging();
        v22 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[HDHRAFibBurdenRescindedNotificationManager _operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:]();
        }
      }
    }
    else
    {
      if (!v8)
      {
LABEL_9:
        [(HDHRAFibBurdenRescindedNotificationManager *)self _unitTesting_postNotificationRequestIfNecessary:0];
LABEL_10:

        goto LABEL_11;
      }
      _HKInitializeLogging();
      v23 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = self;
        __int16 v31 = 2112;
        v32 = v8;
        _os_log_impl(&dword_1D3AC6000, v23, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is not rescinded (last shown date: %@)", buf, 0x16u);
      }

      [(HDHRAFibBurdenRescindedNotificationManager *)self _showRescindedNotificationWithTitleKey:@"AFIB_BURDEN_REENABLED_NOTIFICATION_TITLE" bodyKey:@"AFIB_BURDEN_REENABLED_NOTIFICATION_BODY"];
      v24 = self->_localKeyValueDomain;
      v25 = [MEMORY[0x1E4F1CAD0] setWithObject:@"HDHRAFibBurdenNotificationsDisabledNotificationShownDateKey"];
      id v26 = 0;
      [(HDKeyValueDomain *)v24 removeValuesForKeys:v25 error:&v26];
      id v12 = v26;

      if (!v12)
      {
LABEL_33:

        goto LABEL_10;
      }
      _HKInitializeLogging();
      id v13 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[HDHRAFibBurdenRescindedNotificationManager _operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:]();
      }
    }

    goto LABEL_33;
  }
  _HKInitializeLogging();
  id v6 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%@] AFib Burden is unavailable for non-rescinding reasons", buf, 0xCu);
  }

  [(HDHRAFibBurdenRescindedNotificationManager *)self _unitTesting_postNotificationRequestIfNecessary:0];
LABEL_11:
}

- (void)_showRescindedNotificationWithTitleKey:(id)a3 bodyKey:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  id v20 = [v6 localizedUserNotificationStringForKey:a3 arguments:MEMORY[0x1E4F1CBF0]];
  id v9 = [NSString localizedUserNotificationStringForKey:v7 arguments:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v10 setTitle:v20];
  [v10 setBody:v9];
  [v10 setCategoryIdentifier:@"HeartAppPlugin.AFibBurden.Rescinded"];
  [v10 setThreadIdentifier:@"HeartAppPlugin.AFibBurden.Rescinded"];
  id v11 = [MEMORY[0x1E4F445C0] soundWithAlertType:25];
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v10 setSound:v11];
  [v10 setDate:v12];
  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v14 = objc_msgSend(v13, "hk_dateByAddingDays:toDate:", 1, v12);
  [v10 setExpirationDate:v14];

  id v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:MEMORY[0x1E4F1CC08]];
  uint64_t v16 = [MEMORY[0x1E4F2ACB8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v17 = _HKCreateURLForSampleType();
  objc_super v18 = [v17 absoluteString];
  [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F2BF00]];

  [v15 setObject:&unk_1F2B42160 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  [v10 setUserInfo:v15];
  v19 = [MEMORY[0x1E4F44628] requestWithIdentifier:@"HeartAppPlugin.AFibBurden.Rescinded" content:v10 trigger:0];
  [(HDHRAFibBurdenRescindedNotificationManager *)self _sendNotificationRequest:v19];
}

- (void)_sendNotificationRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke;
  v6[3] = &unk_1E69B4578;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = (id)objc_opt_class();
    id v3 = v9;
    _os_log_impl(&dword_1D3AC6000, v2, OS_LOG_TYPE_DEFAULT, "[%@] About to show AFib Burden rescind notification", buf, 0xCu);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_unitTesting_postNotificationRequestIfNecessary:", *(void *)(a1 + 40)) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v5 = [WeakRetained notificationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_314;
    v7[3] = &unk_1E69B45A8;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    [v5 postNotificationWithRequest:v6 completion:v7];
  }
}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_314(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    id v4 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_314_cold_1();
    }
  }
}

- (BOOL)_unitTesting_postNotificationRequestIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDHRAFibBurdenRescindedNotificationManager *)self unitTesting_postNotificationHandler];
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }

  return v6 != 0;
}

- (id)_rescindedRequirementIdentifiers
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F29CF8];
  v8[0] = *MEMORY[0x1E4F29C88];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F29C68];
  v8[2] = *MEMORY[0x1E4F29C70];
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v2 setWithArray:v5];

  return v6;
}

- (id)_rescindedAlertTitleKeyForUnsatisfiedRequirementIdentifiers:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:*MEMORY[0x1E4F29C68]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_WATCH_UNSUPPORTED_REGION_ALERT_TITLE";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29C70]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_UNSUPPORTED_REGION_ALERT_TITLE";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29C88]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_REMOTELY_DISABLED_ALERT_TITLE";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29CF8]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_SEED_EXPIRED_ALERT_TITLE";
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_rescindedAlertBodyKeyForUnsatisfiedRequirementIdentifiers:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:*MEMORY[0x1E4F29C68]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_WATCH_UNSUPPORTED_REGION_ALERT_BODY";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29C70]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_UNSUPPORTED_REGION_ALERT_BODY";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29C88]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_REMOTELY_DISABLED_ALERT_BODY";
  }
  else if ([v3 containsObject:*MEMORY[0x1E4F29CF8]])
  {
    uint64_t v4 = @"AFIB_BURDEN_RESCINDED_NOTIFICATION_SEED_EXPIRED_ALERT_BODY";
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HDHRAFibBurdenRescindedNotificationManager *)self _rescindedRequirementIdentifiers];
  uint64_t v6 = [v4 unsatisfiedRequirementIdentifiers];
  id v7 = [v6 componentsJoinedByString:@", "];

  _HKInitializeLogging();
  uint64_t v8 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for rescinding reasons: %{public}@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if ([v5 containsObject:*(void *)(*((void *)&v14 + 1) + 8 * i)])
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)_isFeatureUnavailableForNonRescindedReasonsWithRequirementsEvaluation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HDHRAFibBurdenRescindedNotificationManager *)self _rescindedRequirementIdentifiers];
  uint64_t v6 = [v4 unsatisfiedRequirementIdentifiers];
  id v7 = [v6 componentsJoinedByString:@", "];

  _HKInitializeLogging();
  uint64_t v8 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for non-rescinding reasons: %{public}@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (![v5 containsObject:*(void *)(*((void *)&v14 + 1) + 8 * i)])
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

- (id)unitTesting_postNotificationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setUnitTesting_postNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_storeStrong((id *)&self->_protectedDataOperation, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)profileDidBecomeReady:.cold.1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_3_0(&dword_1D3AC6000, v2, v3, "[%@] Error requesting maintenance work for healthd start: %@", v4, v5, v6, v7, v8);
}

- (void)featureStatusProviding:didUpdateFeatureStatus:.cold.1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_3_0(&dword_1D3AC6000, v2, v3, "[%@] Error requesting maintenance work for feature status change: %@", v4, v5, v6, v7, v8);
}

- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Failed to save last shown date with error: %@");
}

- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_FAULT, "[%@] Computing notification for unsupported reasons: %@", v1, 0x16u);
}

- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Failed to reset last shown date with error: %@");
}

- (void)_operation_presentRescindedOrReEnabledAlertIfNeededWithFeatureStatus:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Could not load alert's last shown date with error: %@");
}

void __71__HDHRAFibBurdenRescindedNotificationManager__sendNotificationRequest___block_invoke_314_cold_1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_3_0(&dword_1D3AC6000, v2, v3, "[%@] error requesting notification: %@)", v4, v5, v6, v7, v8);
}

@end