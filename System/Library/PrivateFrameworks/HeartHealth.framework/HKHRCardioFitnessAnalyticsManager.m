@interface HKHRCardioFitnessAnalyticsManager
- (HKHRCardioFitnessAnalyticsManager)initWithSignalSource:(id)a3;
- (id)submitClassificationChartOverlaySelectedEventCurrentOverlay:(id)a3 previousOverlay:(id)a4;
- (id)submitDailyEventWithSource:(id)a3 deviceContextsDict:(id)a4;
- (id)submitOnboardingEventForStep:(id)a3 acceptDefaults:(BOOL)a4 countryCode:(id)a5;
- (void)_setKey:(id)a3 value:(id)a4 onPayloadIfPresent:(id)a5;
@end

@implementation HKHRCardioFitnessAnalyticsManager

- (HKHRCardioFitnessAnalyticsManager)initWithSignalSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRCardioFitnessAnalyticsManager;
  v6 = [(HKHRCardioFitnessAnalyticsManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signalSource, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (id)submitOnboardingEventForStep:(id)a3 acceptDefaults:(BOOL)a4 countryCode:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke;
  v19 = &unk_1E6D49898;
  BOOL v23 = a4;
  v20 = self;
  id v21 = v9;
  id v22 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, &v16);
  v13 = [HKHRCardioFitnessAnalyticsResult alloc];
  v14 = -[HKHRCardioFitnessAnalyticsResult initWithStatus:error:](v13, "initWithStatus:error:", 0, 0, v16, v17, v18, v19, v20);

  return v14;
}

void __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();
}

id __93__HKHRCardioFitnessAnalyticsManager_submitOnboardingEventForStep_acceptDefaults_countryCode___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) isImproveHealthAndActivityAllowed];
  if (v3)
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 8) biologicalSexStringWithError:0];
    [v2 setObject:v4 forKeyedSubscript:@"biologicalSex"];

    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bucketedAgeWithError:", 0));
    [v2 setObject:v5 forKeyedSubscript:@"age"];

    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v2 setObject:v6 forKeyedSubscript:@"acceptDefaults"];
  }
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) activeWatchProductType];
  [v2 setObject:v7 forKeyedSubscript:@"activeWatchProductType"];

  id v8 = [NSNumber numberWithBool:v3];
  [v2 setObject:v8 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    [v2 setObject:v9 forKeyedSubscript:@"countryCode"];
  }
  v10 = [*(id *)(*(void *)(a1 + 32) + 8) featureVersion];
  [v2 setObject:v10 forKeyedSubscript:@"featureVersion"];

  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"step"];

  return v2;
}

- (id)submitClassificationChartOverlaySelectedEventCurrentOverlay:(id)a3 previousOverlay:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(HKHRCardioFitnessAnalyticsSignalSource *)self->_signalSource isImproveHealthAndActivityAllowed])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke;
    block[3] = &unk_1E6D496C8;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(queue, block);
    uint64_t v9 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:0 error:0];
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl(&dword_1E0A83000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: IH&A not allowed, will not submit overlay analytics.", buf, 0xCu);
    }
    uint64_t v9 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:2 error:0];
  }

  return v9;
}

void __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();
}

id __113__HKHRCardioFitnessAnalyticsManager_submitClassificationChartOverlaySelectedEventCurrentOverlay_previousOverlay___block_invoke_2(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1[4] + 8), "bucketedAgeWithError:", 0));
  [v2 setObject:v3 forKeyedSubscript:@"age"];

  v4 = [*(id *)(a1[4] + 8) biologicalSexStringWithError:0];
  [v2 setObject:v4 forKeyedSubscript:@"biologicalSex"];

  id v5 = [*(id *)(a1[4] + 8) featureVersion];
  [v2 setObject:v5 forKeyedSubscript:@"featureVersion"];

  if (a1[5]) {
    id v6 = (__CFString *)a1[5];
  }
  else {
    id v6 = &stru_1F3B84F70;
  }
  [v2 setObject:v6 forKeyedSubscript:@"currentClassificationOverlay"];
  if (a1[6]) {
    id v7 = (__CFString *)a1[6];
  }
  else {
    id v7 = &stru_1F3B84F70;
  }
  [v2 setObject:v7 forKeyedSubscript:@"previousClassificationOverlay"];

  return v2;
}

- (id)submitDailyEventWithSource:(id)a3 deviceContextsDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HKHRCardioFitnessAnalyticsSignalSource *)self->_signalSource isImproveHealthAndActivityAllowed];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  v61[0] = 0;
  uint64_t v10 = [v6 determineWeeksSinceOnboardingWithCurrentDate:v9 error:v61];
  id v11 = v61[0];
  if (v11
    || (id v12 = self->_signalSource,
        id v60 = 0,
        [(HKHRCardioFitnessAnalyticsSignalSource *)v12 bucketedAgeWithError:&v60],
        (id v11 = v60) != 0))
  {
    id v13 = v11;
    id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v11];
  }
  else
  {
    signalSource = self->_signalSource;
    id v59 = 0;
    uint64_t v17 = [(HKHRCardioFitnessAnalyticsSignalSource *)signalSource biologicalSexStringWithError:&v59];
    id v18 = v59;
    if (v18)
    {
      id v13 = v18;
      id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v18];
    }
    else
    {
      id v58 = 0;
      v19 = [v6 determineDaysSinceLastLowNotificationWithCurrentDate:v9 isImproveHealthAndActivityAllowed:v8 error:&v58];
      id v20 = v58;
      if (v20)
      {
        id v13 = v20;
        id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v20];
      }
      else
      {
        id v57 = 0;
        v44 = [v6 determineDaysSinceLastVO2MaxSampleWithCurrentDate:v9 isImproveHealthAndActivityAllowed:v8 error:&v57];
        id v21 = v57;
        if (v21)
        {
          id v13 = v21;
          id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v21];
        }
        else
        {
          id v56 = 0;
          v43 = [v6 determineNumberOfLowNotificationsInPastYearWithCurrentDate:v9 isImproveHealthAndActivityAllowed:v8 error:&v56];
          id v22 = v56;
          if (v22)
          {
            id v13 = v22;
            id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v22];
          }
          else
          {
            id v55 = 0;
            v42 = [v6 determineIsBlockersEnabledWithIsImproveHealthAndActivityAllowed:v8 error:&v55];
            id v23 = v55;
            if (v23)
            {
              id v13 = v23;
              id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v23];
            }
            else
            {
              id v54 = 0;
              v41 = [v6 latestClassificationWithIsOnboarded:v10 >= 0 isImproveHealthAndActivityAllowed:v8 error:&v54];
              id v13 = v54;
              if (v13)
              {
                id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:1 error:v13];
                v24 = v41;
              }
              else
              {
                v25 = [v7 objectForKeyedSubscript:&unk_1F3B8B678];
                if (v25)
                {
                  v37 = v25;
                  v40 = [v7 objectForKeyedSubscript:&unk_1F3B8B678];
                  v25 = v37;
                }
                else
                {
                  v40 = &unk_1F3B8B690;
                }

                v26 = [v7 objectForKeyedSubscript:&unk_1F3B8B6A8];
                if (v26)
                {
                  v38 = v26;
                  v35 = [v7 objectForKeyedSubscript:&unk_1F3B8B6A8];
                  v26 = v38;
                }
                else
                {
                  v35 = &unk_1F3B8B690;
                }

                v27 = [v7 objectForKeyedSubscript:&unk_1F3B8B6C0];
                if (v27)
                {
                  v32 = v27;
                  v39 = [v7 objectForKeyedSubscript:&unk_1F3B8B6C0];
                  v27 = v32;
                }
                else
                {
                  v39 = &unk_1F3B8B690;
                }

                v28 = [v7 objectForKeyedSubscript:&unk_1F3B8B6D8];
                if (v28)
                {
                  v31 = v28;
                  v33 = [v7 objectForKeyedSubscript:&unk_1F3B8B6D8];
                  v28 = v31;
                }
                else
                {
                  v33 = &unk_1F3B8B690;
                }

                id v45 = v6;
                v46 = v35;
                v47 = v33;
                id v48 = v17;
                id v49 = v19;
                id v50 = v44;
                id v51 = v43;
                v24 = v41;
                id v52 = v41;
                id v53 = v42;
                id v34 = v33;
                id v36 = v35;
                id v29 = v39;
                id v30 = v40;
                AnalyticsSendEventLazy();
                id v14 = [[HKHRCardioFitnessAnalyticsResult alloc] initWithStatus:0 error:0];
              }
            }
          }
        }
      }
    }
  }

  return v14;
}

id __83__HKHRCardioFitnessAnalyticsManager_submitDailyEventWithSource_deviceContextsDict___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) activeWatchProductType];
  [v2 setObject:v3 forKeyedSubscript:@"activeWatchProductType"];

  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
  [v2 setObject:v4 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "determineIsNotificationsEnabled"));
  [v2 setObject:v5 forKeyedSubscript:@"notificationsEnabled"];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) featureVersion];
  [v2 setObject:v6 forKeyedSubscript:@"onboardedVersion"];

  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 128)];
  [v2 setObject:v7 forKeyedSubscript:@"weeksSinceOnboarding"];

  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"countPairediPhone"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"countPairedWatch"];
  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"countPairediPad"];
  [v2 setObject:*(void *)(a1 + 72) forKeyedSubscript:@"countPairedVisionPro"];
  if (*(unsigned char *)(a1 + 144))
  {
    BOOL v8 = [NSNumber numberWithInteger:*(void *)(a1 + 136)];
    [v2 setObject:v8 forKeyedSubscript:@"age"];

    [v2 setObject:*(void *)(a1 + 80) forKeyedSubscript:@"biologicalSex"];
    [v2 setObject:*(void *)(a1 + 88) forKeyedSubscript:@"daysSinceLastLowNotification"];
    [v2 setObject:*(void *)(a1 + 96) forKeyedSubscript:@"daysSinceLastVO2MaxSample"];
    [v2 setObject:*(void *)(a1 + 104) forKeyedSubscript:@"numberOfLowNotificationsInPastYear"];
    [v2 setObject:*(void *)(a1 + 112) forKeyedSubscript:@"assignedClassification"];
    [*(id *)(a1 + 32) _setKey:@"isBlockersEnabled" value:*(void *)(a1 + 120) onPayloadIfPresent:v2];
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) determineIsHeartRateEnabledWithIsImproveHealthAndActivityAllowed:*(unsigned __int8 *)(a1 + 144)];
    [v9 _setKey:@"isHeartRateEnabled" value:v10 onPayloadIfPresent:v2];

    id v11 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) determineIsWristDetectionEnabledWithIsImproveHealthAndActivityAllowed:*(unsigned __int8 *)(a1 + 144)];
    [v11 _setKey:@"isWristDetectionEnabled" value:v12 onPayloadIfPresent:v2];
  }

  return v2;
}

- (void)_setKey:(id)a3 value:(id)a4 onPayloadIfPresent:(id)a5
{
  if (a4) {
    [a5 setObject:a4 forKeyedSubscript:a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_signalSource, 0);
}

@end