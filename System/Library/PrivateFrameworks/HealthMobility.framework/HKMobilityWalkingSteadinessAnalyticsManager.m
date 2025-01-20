@interface HKMobilityWalkingSteadinessAnalyticsManager
- (BOOL)_collectDiagnosticFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_collectDiagnosticFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_collectDiagnosticFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_collectSensitiveFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_collectSensitiveFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_collectSensitiveFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (BOOL)_isImproveHealthAndActivityAllowed;
- (HKMobilityWalkingSteadinessAnalyticsManager)init;
- (id)_queue_submitNotificationEventWithDataSource:(id)a3;
- (id)_queue_submitNotificationInteractionEventWithDataSource:(id)a3;
- (id)_queue_submitOnboardingEventWithDataSource:(id)a3;
- (void)submitNotificationEventWithDataSource:(id)a3 resultHandler:(id)a4;
- (void)submitNotificationInteractionEventWithDataSource:(id)a3 resultHandler:(id)a4;
- (void)submitOnboardingEventWithDataSource:(id)a3 resultHandler:(id)a4;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsManager

- (HKMobilityWalkingSteadinessAnalyticsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsManager;
  v2 = [(HKMobilityWalkingSteadinessAnalyticsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)submitNotificationEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E6D4D348;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __99__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_submitNotificationEventWithDataSource:", *(void *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)submitNotificationInteractionEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationInteractionEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E6D4D348;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __110__HKMobilityWalkingSteadinessAnalyticsManager_submitNotificationInteractionEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_submitNotificationInteractionEventWithDataSource:", *(void *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)submitOnboardingEventWithDataSource:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HKMobilityWalkingSteadinessAnalyticsManager_submitOnboardingEventWithDataSource_resultHandler___block_invoke;
  block[3] = &unk_1E6D4D348;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __97__HKMobilityWalkingSteadinessAnalyticsManager_submitOnboardingEventWithDataSource_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_submitOnboardingEventWithDataSource:", *(void *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isImproveHealthAndActivityAllowed
{
  return MEMORY[0x1F40E7D50](self, a2);
}

- (id)_queue_submitNotificationEventWithDataSource:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _isImproveHealthAndActivityAllowed];
  BOOL v6 = +[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric requiresImproveHealthAndActivityAllowed];
  if (v5 || !v6)
  {
    v8 = [[HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric alloc] initWithImproveHealthAndActivityAllowed:v5];
    id v18 = 0;
    BOOL v9 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectDiagnosticFieldsForNotificationMetric:v8 dataSource:v4 error:&v18];
    id v10 = v18;
    v11 = v10;
    if (v9)
    {
      id v17 = v10;
      BOOL v12 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectSensitiveFieldsForNotificationMetric:v8 dataSource:v4 error:&v17];
      id v13 = v17;

      if (v12)
      {
        v14 = [(HKMobilityWalkingSteadinessAnalyticsNotificationEventMetric *)v8 eventName];
        v16 = v8;
        AnalyticsSendEventLazy();

        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:0 error:0];
      }
      else
      {
        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v13];
      }
      v11 = v13;
    }
    else
    {
      id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v10];
    }
  }
  else
  {
    id v7 = +[HKMobilityAnalyticsResult resultWithStatus:2 error:0];
  }

  return v7;
}

uint64_t __92__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitNotificationEventWithDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPayload];
}

- (id)_queue_submitNotificationInteractionEventWithDataSource:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _isImproveHealthAndActivityAllowed];
  BOOL v6 = +[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric requiresImproveHealthAndActivityAllowed];
  if (v5 || !v6)
  {
    v8 = [[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric alloc] initWithImproveHealthAndActivityAllowed:v5];
    id v18 = 0;
    BOOL v9 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectDiagnosticFieldsForNotificationInteractionMetric:v8 dataSource:v4 error:&v18];
    id v10 = v18;
    v11 = v10;
    if (v9)
    {
      id v17 = v10;
      BOOL v12 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectSensitiveFieldsForNotificationInteractionMetric:v8 dataSource:v4 error:&v17];
      id v13 = v17;

      if (v12)
      {
        v14 = [(HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventMetric *)v8 eventName];
        v16 = v8;
        AnalyticsSendEventLazy();

        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:0 error:0];
      }
      else
      {
        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v13];
      }
      v11 = v13;
    }
    else
    {
      id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v10];
    }
  }
  else
  {
    id v7 = +[HKMobilityAnalyticsResult resultWithStatus:2 error:0];
  }

  return v7;
}

uint64_t __103__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitNotificationInteractionEventWithDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPayload];
}

- (id)_queue_submitOnboardingEventWithDataSource:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _isImproveHealthAndActivityAllowed];
  BOOL v6 = +[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric requiresImproveHealthAndActivityAllowed];
  if (v5 || !v6)
  {
    v8 = [[HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric alloc] initWithImproveHealthAndActivityAllowed:v5];
    id v18 = 0;
    BOOL v9 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectDiagnosticFieldsForOnboardingMetric:v8 dataSource:v4 error:&v18];
    id v10 = v18;
    v11 = v10;
    if (v9)
    {
      id v17 = v10;
      BOOL v12 = [(HKMobilityWalkingSteadinessAnalyticsManager *)self _collectSensitiveFieldsForOnboardingMetric:v8 dataSource:v4 error:&v17];
      id v13 = v17;

      if (v12)
      {
        v14 = [(HKMobilityWalkingSteadinessAnalyticsOnboardingEventMetric *)v8 eventName];
        v16 = v8;
        AnalyticsSendEventLazy();

        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:0 error:0];
      }
      else
      {
        id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v13];
      }
      v11 = v13;
    }
    else
    {
      id v7 = +[HKMobilityAnalyticsResult resultWithStatus:1 error:v10];
    }
  }
  else
  {
    id v7 = +[HKMobilityAnalyticsResult resultWithStatus:2 error:0];
  }

  return v7;
}

uint64_t __90__HKMobilityWalkingSteadinessAnalyticsManager__queue_submitOnboardingEventWithDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPayload];
}

- (BOOL)_collectDiagnosticFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_collectSensitiveFieldsForNotificationMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isImproveHealthAndActivityAllowed])
  {
    id v34 = 0;
    BOOL v9 = [v8 notificationClassificationWithError:&v34];
    id v10 = v34;
    [v7 setNotificationClassification:v9];

    id v11 = v10;
    if (v11) {
      goto LABEL_7;
    }
    id v33 = 0;
    BOOL v12 = [v8 notificationTypeWithError:&v33];
    id v13 = v33;
    [v7 setNotificationType:v12];

    id v11 = v13;
    if (v11) {
      goto LABEL_7;
    }
    id v32 = 0;
    v14 = [v8 ageWithError:&v32];
    id v15 = v32;
    [v7 setAge:v14];

    id v11 = v15;
    if (v11) {
      goto LABEL_7;
    }
    id v31 = 0;
    v16 = [v8 biologicalSexWithError:&v31];
    id v17 = v31;
    [v7 setBiologicalSex:v16];

    id v11 = v17;
    if (v11
      || (id v30 = 0,
          [v8 daysSinceLastNotificationWithError:&v30],
          id v18 = objc_claimAutoreleasedReturnValue(),
          id v19 = v30,
          [v7 setDaysSinceLastNotification:v18],
          v18,
          (id v11 = v19) != 0))
    {
LABEL_7:
      id v20 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        BOOL v22 = 0;
        goto LABEL_14;
      }
      id v21 = v11;
      BOOL v22 = 0;
    }
    else
    {
      id v29 = 0;
      v27 = [v8 areHealthNotificationsAuthorizedWithError:&v29];
      id v28 = v29;
      [v7 setAreHealthNotificationsAuthorized:v27];

      id v20 = v28;
      BOOL v22 = v20 == 0;
      if (!v20) {
        goto LABEL_14;
      }
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_14;
      }
      id v21 = v20;
    }
    *a5 = v21;
LABEL_14:

    goto LABEL_15;
  }
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x1E4F29F78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    *(_DWORD *)buf = 138543362;
    id v36 = (id)objc_opt_class();
    id v25 = v36;
    _os_log_impl(&dword_1E0B16000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);
  }
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)_collectDiagnosticFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_collectSensitiveFieldsForNotificationInteractionMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isImproveHealthAndActivityAllowed])
  {
    id v31 = 0;
    BOOL v9 = [v8 notificationClassificationWithError:&v31];
    id v10 = v31;
    [v7 setNotificationClassification:v9];

    id v11 = v10;
    if (v11) {
      goto LABEL_6;
    }
    id v30 = 0;
    BOOL v12 = [v8 notificationTypeWithError:&v30];
    id v13 = v30;
    [v7 setNotificationType:v12];

    id v11 = v13;
    if (v11) {
      goto LABEL_6;
    }
    id v29 = 0;
    v14 = [v8 ageWithError:&v29];
    id v15 = v29;
    [v7 setAge:v14];

    id v11 = v15;
    if (v11
      || (id v28 = 0,
          [v8 biologicalSexWithError:&v28],
          v16 = objc_claimAutoreleasedReturnValue(),
          id v17 = v28,
          [v7 setBiologicalSex:v16],
          v16,
          (id v11 = v17) != 0))
    {
LABEL_6:
      id v18 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        BOOL v20 = 0;
        goto LABEL_13;
      }
      id v19 = v11;
      BOOL v20 = 0;
    }
    else
    {
      id v27 = 0;
      id v25 = [v8 notificationInteractionTypeWithError:&v27];
      id v26 = v27;
      [v7 setNotificationInteractionType:v25];

      id v18 = v26;
      BOOL v20 = v18 == 0;
      if (!v18) {
        goto LABEL_13;
      }
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_13;
      }
      id v19 = v18;
    }
    *a5 = v19;
LABEL_13:

    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v21 = (void *)*MEMORY[0x1E4F29F78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = v21;
    *(_DWORD *)buf = 138543362;
    id v33 = (id)objc_opt_class();
    id v23 = v33;
    _os_log_impl(&dword_1E0B16000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_collectDiagnosticFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v40 = 0;
  BOOL v9 = [v8 stepWithError:&v40];
  id v10 = v40;
  [v7 setStep:v9];

  id v11 = v10;
  if (v11) {
    goto LABEL_9;
  }
  id v39 = 0;
  BOOL v12 = [v8 featureVersionWithError:&v39];
  id v13 = v39;
  [v7 setFeatureVersion:v12];

  id v11 = v13;
  if (v11) {
    goto LABEL_9;
  }
  id v38 = 0;
  v14 = [v8 provenanceWithError:&v38];
  id v15 = v38;
  [v7 setProvenance:v14];

  id v11 = v15;
  if (v11) {
    goto LABEL_9;
  }
  id v37 = 0;
  v16 = [v8 activeWatchProductTypeWithError:&v37];
  id v17 = v37;
  [v7 setActiveWatchProductType:v16];

  id v11 = v17;
  if (v11) {
    goto LABEL_9;
  }
  id v36 = 0;
  id v18 = [v8 hasDefaultHeightWithError:&v36];
  id v19 = v36;
  [v7 setHasDefaultHeight:v18];

  id v11 = v19;
  if (v11) {
    goto LABEL_9;
  }
  id v35 = 0;
  BOOL v20 = [v8 hasDefaultWeightWithError:&v35];
  id v21 = v35;
  [v7 setHasDefaultWeight:v20];

  id v11 = v21;
  if (v11) {
    goto LABEL_9;
  }
  id v34 = 0;
  BOOL v22 = [v8 acceptDefaultHeightWithError:&v34];
  id v23 = v34;
  [v7 setAcceptDefaultHeight:v22];

  id v11 = v23;
  if (v11
    || (id v33 = 0,
        [v8 acceptDefaultWeightWithError:&v33],
        v24 = objc_claimAutoreleasedReturnValue(),
        id v25 = v33,
        [v7 setAcceptDefaultWeight:v24],
        v24,
        (id v11 = v25) != 0))
  {
LABEL_9:
    id v26 = v11;
    if (!a5)
    {
      _HKLogDroppedError();
      BOOL v28 = 0;
      goto LABEL_13;
    }
    id v27 = v11;
    BOOL v28 = 0;
  }
  else
  {
    id v32 = 0;
    id v30 = [v8 acceptDefaultNotificationsWithError:&v32];
    id v31 = v32;
    [v7 setAcceptDefaultNotifications:v30];

    id v26 = v31;
    BOOL v28 = v26 == 0;
    if (!v26) {
      goto LABEL_13;
    }
    if (!a5)
    {
      _HKLogDroppedError();
      goto LABEL_13;
    }
    id v27 = v26;
  }
  *a5 = v27;
LABEL_13:

  return v28;
}

- (BOOL)_collectSensitiveFieldsForOnboardingMetric:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isImproveHealthAndActivityAllowed])
  {
    id v22 = 0;
    BOOL v9 = [v8 ageWithError:&v22];
    id v10 = v22;
    [v7 setAge:v9];

    id v11 = v10;
    if (v11)
    {
      id v12 = v11;
      if (!a5)
      {
        _HKLogDroppedError();
        BOOL v14 = 0;
        goto LABEL_14;
      }
      id v13 = v11;
      BOOL v14 = 0;
    }
    else
    {
      id v21 = 0;
      id v18 = [v8 biologicalSexWithError:&v21];
      id v19 = v21;
      [v7 setBiologicalSex:v18];

      id v12 = v19;
      BOOL v14 = v12 == 0;
      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }
      if (!a5)
      {
        _HKLogDroppedError();
        goto LABEL_14;
      }
      id v13 = v12;
    }
    *a5 = v13;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v15 = (void *)*MEMORY[0x1E4F29F78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v17 = v24;
    _os_log_impl(&dword_1E0B16000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
}

@end