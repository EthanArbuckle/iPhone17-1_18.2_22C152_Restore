@interface HDHRNotificationAnalytics
- (HDHRNotificationAnalytics)initWithEventSample:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4;
- (id)_createMetricFromEventSample:(id)a3;
- (void)_setDoNotDisturbOn:(BOOL)a3;
- (void)_submitMetric;
- (void)submit;
@end

@implementation HDHRNotificationAnalytics

- (HDHRNotificationAnalytics)initWithEventSample:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4
{
  id v6 = a3;
  if (!HKImproveHealthAndActivityAnalyticsAllowed()) {
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)HDHRNotificationAnalytics;
  v7 = [(HDHRNotificationAnalytics *)&v12 init];
  self = v7;
  if (!v7
    || (v7->_areHealthNotificationsAuthorized = a4,
        [(HDHRNotificationAnalytics *)v7 _createMetricFromEventSample:v6],
        v8 = (HDHRNotificationMetric *)objc_claimAutoreleasedReturnValue(),
        metric = self->_metric,
        self->_metric = v8,
        metric,
        self->_metric))
  {
    self = self;
    v10 = self;
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)_createMetricFromEventSample:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  id v6 = objc_msgSend(v5, "hk_safeValueIfExistsForKeyPath:class:error:", *MEMORY[0x1E4F2BB40], objc_opt_class(), 0);

  if (v6)
  {
    v7 = NSNumber;
    [v6 _beatsPerMinute];
    v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }
  v9 = [v4 categoryType];
  uint64_t v10 = [v9 code];

  if (v10 > 155)
  {
    if (v10 == 236)
    {
      v14 = [[HDHRNotificationMetric alloc] initWithNotificationType:@"Cardio Fitness" areHealthNotificationsAuthorized:self->_areHealthNotificationsAuthorized];
      v18 = [v4 metadata];
      v16 = objc_msgSend(v18, "hk_safeNumberIfExistsForKeyPath:error:", *MEMORY[0x1E4F2BBB8], 0);

      if (v16)
      {
        if ([v16 BOOLValue]) {
          v19 = @"Repeat";
        }
        else {
          v19 = @"Initial";
        }
        [(HDHRNotificationMetric *)v14 setCardioFitnessNotificationType:v19];
      }
    }
    else
    {
      if (v10 != 156) {
        goto LABEL_21;
      }
      v14 = [[HDHRNotificationMetric alloc] initWithNotificationType:@"IRN" areHealthNotificationsAuthorized:self->_areHealthNotificationsAuthorized];
      v15 = [v4 metadata];
      v16 = objc_msgSend(v15, "hk_safeStringIfExistsForKeyPath:error:", *MEMORY[0x1E4F2BAC8], 0);

      if (v16) {
        [(HDHRNotificationMetric *)v14 setIrregularRhythmNotificationsAlgorithmVersion:HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString()];
      }
    }

    goto LABEL_24;
  }
  if (v10 == 140)
  {
    v11 = [HDHRNotificationMetric alloc];
    BOOL areHealthNotificationsAuthorized = self->_areHealthNotificationsAuthorized;
    v13 = @"HHR";
LABEL_13:
    v17 = [(HDHRNotificationMetric *)v11 initWithNotificationType:v13 areHealthNotificationsAuthorized:areHealthNotificationsAuthorized];
    v14 = v17;
    if (v8) {
      [(HDHRNotificationMetric *)v17 setNotificationThreshold:v8];
    }
    goto LABEL_24;
  }
  if (v10 == 147)
  {
    v11 = [HDHRNotificationMetric alloc];
    BOOL areHealthNotificationsAuthorized = self->_areHealthNotificationsAuthorized;
    v13 = @"LHR";
    goto LABEL_13;
  }
LABEL_21:
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    [(HDHRNotificationAnalytics *)v20 _createMetricFromEventSample:v4];
  }
  v14 = 0;
LABEL_24:

  return v14;
}

- (void)_setDoNotDisturbOn:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HDHRNotificationMetric *)self->_metric setDoNotDisturbOn:v4];
}

- (void)_submitMetric
{
}

- (void)submit
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x1E4F504C8] userFocusComputedMode];
  id v4 = [v3 publisherFromStartTime:0.0];
  v5 = [v4 last];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__HDHRNotificationAnalytics_submit__block_invoke;
  v9[3] = &unk_1E69B44C8;
  v9[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__HDHRNotificationAnalytics_submit__block_invoke_299;
  v7[3] = &unk_1E69B44F0;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  id v6 = (id)[v5 sinkWithCompletion:v9 receiveInput:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__HDHRNotificationAnalytics_submit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v3 error];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _submitMetric];
}

void __35__HDHRNotificationAnalytics_submit__block_invoke_299(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];

  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F48];
  id v6 = *MEMORY[0x1E4F29F48];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __35__HDHRNotificationAnalytics_submit__block_invoke_299_cold_2(a1, v5, v3);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [v3 eventBody];
    objc_msgSend(WeakRetained, "_setDoNotDisturbOn:", objc_msgSend(v8, "isStarting"));
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __35__HDHRNotificationAnalytics_submit__block_invoke_299_cold_1(a1, v5, v3);
  }
}

- (void).cxx_destruct
{
}

- (void)_createMetricFromEventSample:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  v5 = objc_opt_class();
  id v6 = v5;
  id v7 = [a3 categoryType];
  int v8 = 138543618;
  int v9 = v5;
  __int16 v10 = 2112;
  __int16 v11 = v7;
  _os_log_error_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Analytics not compatible with sample type: %@", (uint8_t *)&v8, 0x16u);
}

void __35__HDHRNotificationAnalytics_submit__block_invoke_299_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = objc_opt_class();
  id v6 = NSNumber;
  id v7 = v5;
  int v8 = objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(a3, "error"));
  int v9 = 138543618;
  __int16 v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v9, 0x16u);
}

void __35__HDHRNotificationAnalytics_submit__block_invoke_299_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = objc_opt_class();
  id v6 = v5;
  id v7 = [a3 eventBody];
  int v8 = 138543618;
  int v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  _os_log_debug_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Received event: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end