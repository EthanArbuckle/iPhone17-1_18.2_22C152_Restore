@interface HDAudioAnalyticsManager
- (BOOL)_dayComponents:(id)a3 lessThan:(id)a4;
- (BOOL)_recordedDataForToday;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (BOOL)unitTesting;
- (BOOL)unitTesting_recordedDataForToday;
- (HDAudioAnalyticsManager)initWithProfile:(id)a3;
- (HDPeriodicActivity)periodicActivity;
- (HDProfile)profile;
- (OS_dispatch_queue)queue;
- (double)calculationPeriod;
- (double)retryPeriod;
- (id)_dayForDate:(id)a3;
- (id)capturePhoneAnalytics;
- (id)lastSuccessfulCalculation;
- (void)_unitTesting_setRecordedDataForToday:(BOOL)a3;
- (void)daemonReady:(id)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)setPeriodicActivity:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
- (void)setUnitTesting_recordedDataForToday:(BOOL)a3;
@end

@implementation HDAudioAnalyticsManager

- (HDAudioAnalyticsManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDAudioAnalyticsManager;
  v5 = [(HDAudioAnalyticsManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    double v7 = (double)(uint64_t)*MEMORY[0x263EF81F0];
    v6->_calculationPeriod = (double)(uint64_t)*MEMORY[0x263EF81E8];
    v6->_retryPeriod = v7;
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    *(_WORD *)&v6->_unitTesting = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = [WeakRetained daemon];
    [v11 registerDaemonReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F432C8]);
  id v7 = [(HDAudioAnalyticsManager *)self profile];
  [(HDAudioAnalyticsManager *)self calculationPeriod];
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, @"com.apple.healthd.hearing.HDAudioAnalyticsCalculator", self, *MEMORY[0x263F09910]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  v10 = (void (**)(double))a4;
  v5 = [(HDAudioAnalyticsManager *)self capturePhoneAnalytics];
  uint64_t v6 = [v5 status];
  if (v6 == 2 || v6 == 1)
  {
    [(HDAudioAnalyticsManager *)self retryPeriod];
    double v8 = v7;
    v9 = [v5 error];
    v10[2](v8);
  }
  else if (!v6)
  {
    [(HDAudioAnalyticsManager *)self retryPeriod];
    ((void (*)(void (**)(double), void, void))v10[2])(v10, 0, 0);
  }
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (id)lastSuccessfulCalculation
{
  v2 = [(HDAudioAnalyticsManager *)self periodicActivity];
  v3 = [v2 lastSuccessfulRunDate];

  return v3;
}

- (id)capturePhoneAnalytics
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained profileType];

  if (v5 == 1 && ![(HDAudioAnalyticsManager *)self _recordedDataForToday])
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    double v8 = [HDAudioAnalyticsExposureCalculator alloc];
    v9 = [(HDAudioAnalyticsManager *)self profile];
    v10 = [(HDAudioAnalyticsExposureCalculator *)v8 initWithTargetDate:v7 exposureType:0 profile:v9];

    v110[0] = 0;
    v77 = [(HDAudioAnalyticsExposureCalculator *)v10 audioExposureResultWithError:v110];
    id v11 = v110[0];
    id v109 = v11;
    v76 = [(HDAudioAnalyticsExposureCalculator *)v10 notificationCountForRollingDays:1 error:&v109];
    id v12 = v109;

    id v108 = v12;
    objc_super v13 = [(HDAudioAnalyticsExposureCalculator *)v10 notificationCountForRollingDays:30 error:&v108];
    id v14 = v108;

    id v107 = v14;
    v71 = v10;
    uint64_t v15 = [(HDAudioAnalyticsExposureCalculator *)v10 sevenDayDoseForMostRecentNotificationWithError:&v107];
    id v16 = v107;

    v17 = [HDAudioAnalyticsExposureCalculator alloc];
    v18 = [(HDAudioAnalyticsManager *)self profile];
    v19 = [(HDAudioAnalyticsExposureCalculator *)v17 initWithTargetDate:v7 exposureType:1 profile:v18];

    id v106 = v16;
    v83 = [(HDAudioAnalyticsExposureCalculator *)v19 audioExposureResultWithError:&v106];
    id v20 = v106;

    id v105 = v20;
    v82 = [(HDAudioAnalyticsExposureCalculator *)v19 notificationCountForRollingDays:1 error:&v105];
    id v21 = v105;

    id v104 = v21;
    v74 = v19;
    v81 = [(HDAudioAnalyticsExposureCalculator *)v19 notificationCountForRollingDays:30 error:&v104];
    id v22 = v104;

    v23 = [HDAudioAnalyticsExposureCalculator alloc];
    v24 = [(HDAudioAnalyticsManager *)self profile];
    v25 = [(HDAudioAnalyticsExposureCalculator *)v23 initWithTargetDate:v7 exposureType:2 profile:v24];

    id v103 = v22;
    v80 = [(HDAudioAnalyticsExposureCalculator *)v25 audioExposureResultWithError:&v103];
    id v26 = v103;

    id v102 = v26;
    v79 = [(HDAudioAnalyticsExposureCalculator *)v25 notificationCountForRollingDays:1 error:&v102];
    id v27 = v102;

    id v101 = v27;
    v78 = [(HDAudioAnalyticsExposureCalculator *)v25 notificationCountForRollingDays:30 error:&v101];
    id v28 = v101;

    v29 = v77;
    v30 = [HDAudioAnalyticsExposureCalculator alloc];
    v31 = [(HDAudioAnalyticsManager *)self profile];
    v72 = (void *)v7;
    v32 = [(HDAudioAnalyticsExposureCalculator *)v30 initWithTargetDate:v7 exposureType:3 profile:v31];

    v33 = (void *)v15;
    v34 = v76;
    id v100 = v28;
    v75 = [(HDAudioAnalyticsExposureCalculator *)v32 audioExposureResultWithError:&v100];
    id v35 = v100;

    v73 = v32;
    if (v77 && v83 && v76 && v13 && v33 && v82 && v81 && v80 && v79 && v78 && v32)
    {
      v69 = v25;
      v66 = v13;
      v67 = v33;
      id v36 = objc_loadWeakRetained((id *)p_profile);
      v37 = [v36 deviceContextManager];
      id v99 = v35;
      v38 = [v37 numberOfDeviceContextsPerDeviceType:&v99];
      id v39 = v99;

      v68 = v38;
      if (v38)
      {
        id v65 = v39;
        v40 = [v38 objectForKeyedSubscript:&unk_26D9E9B68];
        if (v40)
        {
          v62 = [v38 objectForKeyedSubscript:&unk_26D9E9B68];
        }
        else
        {
          v62 = &unk_26D9E9B80;
        }

        v43 = [v38 objectForKeyedSubscript:&unk_26D9E9B98];
        if (v43)
        {
          v44 = [v38 objectForKeyedSubscript:&unk_26D9E9B98];
        }
        else
        {
          v44 = &unk_26D9E9B80;
        }

        v45 = [v38 objectForKeyedSubscript:&unk_26D9E9BB0];
        if (v45)
        {
          v46 = [v38 objectForKeyedSubscript:&unk_26D9E9BB0];
        }
        else
        {
          v46 = &unk_26D9E9B80;
        }

        v47 = [v38 objectForKeyedSubscript:&unk_26D9E9BC8];
        if (v47)
        {
          v48 = [v38 objectForKeyedSubscript:&unk_26D9E9BC8];
        }
        else
        {
          v48 = &unk_26D9E9B80;
        }

        v64 = objc_alloc_init(HDAudioAnalyticsSettingsPreferences);
        uint64_t v49 = [(HDAudioAnalyticsSettingsPreferences *)v64 noisePreferences];
        v63 = [(HDAudioAnalyticsSettingsPreferences *)v64 headphonePreferences];
        id v50 = objc_loadWeakRetained((id *)p_profile);
        v51 = [v50 daemon];
        v52 = [v51 behavior];
        [v52 isiPad];

        v84 = (void *)v49;
        v53 = (void *)v49;
        v85 = v46;
        v54 = v44;
        v86 = v44;
        v87 = v48;
        v55 = v48;
        v33 = v67;
        id v88 = v67;
        v34 = v76;
        id v89 = v76;
        objc_super v13 = v66;
        id v90 = v66;
        id v91 = v82;
        id v92 = v81;
        id v93 = v83;
        v29 = v77;
        id v94 = v77;
        id v95 = v75;
        id v96 = v80;
        id v97 = v79;
        id v98 = v78;
        id v56 = v55;
        id v57 = v54;
        id v70 = v46;
        id v58 = v62;
        id v59 = v53;
        id v60 = v63;
        AnalyticsSendEventLazy();
        uint64_t v6 = [[HDAudioAnalyticsResult alloc] initWithStatus:0 error:0];

        v42 = v71;
        v41 = v72;
        id v35 = v65;
      }
      else
      {
        uint64_t v6 = [[HDAudioAnalyticsResult alloc] initWithStatus:1 error:v39];
        v34 = v76;
        v29 = v77;
        v42 = v71;
        v41 = v72;
        v33 = v67;
        id v35 = v39;
      }

      v25 = v69;
    }
    else
    {
      uint64_t v6 = [[HDAudioAnalyticsResult alloc] initWithStatus:1 error:v35];
      v42 = v71;
      v41 = v72;
    }
  }
  else
  {
    uint64_t v6 = [[HDAudioAnalyticsResult alloc] initWithStatus:2 error:0];
  }
  return v6;
}

id __48__HDAudioAnalyticsManager_capturePhoneAnalytics__block_invoke(uint64_t a1)
{
  v123[2] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:35];
  v3 = [*(id *)(a1 + 32) localDevice];
  id v4 = [v3 haeRetention];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) localDevice];
    uint64_t v6 = [v5 hasHAENRequired];
    char v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      id v104 = [MEMORY[0x263F08690] currentHandler];
      [v104 handleFailureInMethod:*(void *)(a1 + 176), *(void *)(a1 + 40), @"HDAudioAnalyticsManager.m", 167, @"Invalid parameter not satisfying: %@", @"headphonePreferences.localDevice.hasHAENRequired.BOOLValue" object file lineNumber description];
    }
    double v8 = @"dataRetentionHAENiPad";
    if (!*(unsigned char *)(a1 + 184)) {
      double v8 = @"dataRetentionHAENPhone";
    }
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    id v11 = [v9 localDevice];
    id v12 = [v11 haeRetention];
    [v2 setObject:v12 forKeyedSubscript:v10];
  }
  objc_super v13 = [*(id *)(a1 + 32) activePairedWatch];
  id v14 = [v13 haeRetention];

  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 32) activePairedWatch];
    id v16 = [v15 hasHAENRequired];
    char v17 = [v16 BOOLValue];

    if ((v17 & 1) == 0)
    {
      id v105 = [MEMORY[0x263F08690] currentHandler];
      [v105 handleFailureInMethod:*(void *)(a1 + 176), *(void *)(a1 + 40), @"HDAudioAnalyticsManager.m", 175, @"Invalid parameter not satisfying: %@", @"headphonePreferences.activePairedWatch.hasHAENRequired.BOOLValue" object file lineNumber description];
    }
    v18 = [*(id *)(a1 + 32) activePairedWatch];
    v19 = [v18 haeRetention];
    [v2 setObject:v19 forKeyedSubscript:@"dataRetentionHAENWatch"];
  }
  v122[0] = @"hasEligibleWatchPaired";
  id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasWatchPairedWithNoiseApp"));
  v122[1] = @"hasEnvironmentalNoiseEnabled";
  v123[0] = v20;
  id v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasNoiseEnabled"));
  v123[1] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
  [v2 addEntriesFromDictionary:v22];

  v23 = [*(id *)(a1 + 32) localDevice];
  v24 = [v23 hasHAENEnabled];

  if (v24)
  {
    v25 = @"hasHAENEnablediPad";
    if (!*(unsigned char *)(a1 + 184)) {
      v25 = @"hasHAENEnabledPhone";
    }
    id v26 = *(void **)(a1 + 32);
    id v27 = v25;
    id v28 = [v26 localDevice];
    v29 = [v28 hasHAENEnabled];
    [v2 setObject:v29 forKeyedSubscript:v27];
  }
  v30 = [*(id *)(a1 + 32) activePairedWatch];
  v31 = [v30 hasHAENEnabled];

  if (v31)
  {
    v32 = [*(id *)(a1 + 32) activePairedWatch];
    v33 = [v32 hasHAENEnabled];
    [v2 setObject:v33 forKeyedSubscript:@"hasHAENEnabledWatch"];
  }
  v34 = [*(id *)(a1 + 32) localDevice];
  id v35 = [v34 hasMeasureLevelsEnabled];

  if (v35)
  {
    id v36 = @"hasHeadphoneAudioExposureEnablediPad";
    if (!*(unsigned char *)(a1 + 184)) {
      id v36 = @"hasHeadphoneAudioExposureEnabledPhone";
    }
    v37 = *(void **)(a1 + 32);
    v38 = v36;
    id v39 = [v37 localDevice];
    v40 = [v39 hasMeasureLevelsEnabled];
    [v2 setObject:v40 forKeyedSubscript:v38];
  }
  v41 = [*(id *)(a1 + 32) activePairedWatch];
  v42 = [v41 hasMeasureLevelsEnabled];

  if (v42)
  {
    v43 = [*(id *)(a1 + 32) activePairedWatch];
    v44 = [v43 hasMeasureLevelsEnabled];
    [v2 setObject:v44 forKeyedSubscript:@"hasHeadphoneAudioExposureEnabledWatch"];
  }
  v45 = [*(id *)(a1 + 32) localDevice];
  v46 = [v45 hasIncludeOtherHeadphonesEnabled];

  if (v46)
  {
    v47 = @"hasHeadphoneAudioExposureOtherEnablediPad";
    if (!*(unsigned char *)(a1 + 184)) {
      v47 = @"hasHeadphoneAudioExposureOtherEnabledPhone";
    }
    v48 = *(void **)(a1 + 32);
    uint64_t v49 = v47;
    id v50 = [v48 localDevice];
    v51 = [v50 hasIncludeOtherHeadphonesEnabled];
    [v2 setObject:v51 forKeyedSubscript:v49];
  }
  v52 = [*(id *)(a1 + 32) activePairedWatch];
  v53 = [v52 hasIncludeOtherHeadphonesEnabled];

  if (v53)
  {
    v54 = [*(id *)(a1 + 32) activePairedWatch];
    v55 = [v54 hasIncludeOtherHeadphonesEnabled];
    [v2 setObject:v55 forKeyedSubscript:@"hasHeadphoneAudioExposureOtherEnabledWatch"];
  }
  id v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasNoiseNotificationsEnabled"));
  [v2 setObject:v56 forKeyedSubscript:@"hasNoiseNotificationsEnabled"];

  id v57 = @"isHAENRequirediPad";
  if (!*(unsigned char *)(a1 + 184)) {
    id v57 = @"isHAENRequiredPhone";
  }
  id v58 = *(void **)(a1 + 32);
  id v59 = v57;
  id v60 = [v58 localDevice];
  v61 = [v60 hasHAENRequired];
  [v2 setObject:v61 forKeyedSubscript:v59];

  v62 = [*(id *)(a1 + 32) activePairedWatch];

  if (v62)
  {
    v63 = [*(id *)(a1 + 32) activePairedWatch];
    v64 = [v63 hasHAENRequired];
    [v2 setObject:v64 forKeyedSubscript:@"isHAENRequiredWatch"];
  }
  uint64_t v65 = *(void *)(a1 + 56);
  v118[0] = @"countPairediPhone";
  v118[1] = @"countPairedWatch";
  long long v120 = *(_OWORD *)(a1 + 64);
  v118[2] = @"countPairediPad";
  v118[3] = @"countPairedVisionPro";
  uint64_t v66 = *(void *)(a1 + 80);
  uint64_t v119 = v65;
  uint64_t v121 = v66;
  v67 = [NSDictionary dictionaryWithObjects:&v119 forKeys:v118 count:4];
  [v2 addEntriesFromDictionary:v67];

  uint64_t v68 = HKImproveHealthAndActivityAnalyticsAllowed();
  v69 = [NSNumber numberWithBool:v68];
  [v2 setObject:v69 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  if (v68)
  {
    v108[0] = @"actualDosePercentAtNotification";
    v108[1] = @"countHAENotificationsLast24Hours";
    uint64_t v70 = *(void *)(a1 + 96);
    v109[0] = *(void *)(a1 + 88);
    v109[1] = v70;
    long long v110 = *(_OWORD *)(a1 + 104);
    v108[2] = @"countHAENotificationsLast30Days";
    v108[3] = @"countEAENotificationsLast24Hours";
    v71 = *(void **)(a1 + 128);
    uint64_t v111 = *(void *)(a1 + 120);
    v108[4] = @"countEAENotificationsLast30Days";
    v108[5] = @"EAE7DayDosePercentage";
    v72 = [v71 audioExposureDose];
    v112 = v72;
    v108[6] = @"EAE7DayDuration";
    v73 = [*(id *)(a1 + 128) audioExposureDuration];
    v113 = v73;
    v108[7] = @"EAE7DayLEQ";
    v74 = [*(id *)(a1 + 128) audioExposureLEQ];
    v114 = v74;
    v108[8] = @"hAE7DayDosePercentage";
    v75 = [*(id *)(a1 + 136) audioExposureDose];
    v115 = v75;
    v108[9] = @"hAE7DayDuration";
    v76 = [*(id *)(a1 + 136) audioExposureDuration];
    v116 = v76;
    v108[10] = @"hAE7DayLEQ";
    v77 = [*(id *)(a1 + 136) audioExposureLEQ];
    v117 = v77;
    v78 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:11];
    [v2 addEntriesFromDictionary:v78];

    v79 = [*(id *)(a1 + 144) audioExposureDuration];
    [v79 doubleValue];
    BOOL v81 = v80 > 0.0;

    v82 = [NSNumber numberWithBool:v81];
    [v2 setObject:v82 forKeyedSubscript:@"hasEnvironmentalSoundReductionDataPast7Days"];

    v83 = [MEMORY[0x263F47538] sharedInstance];
    v84 = [v83 activeHearingProtectionAvailable];

    v85 = [MEMORY[0x263F47538] sharedInstance];
    v86 = [v85 activeHearingProtectionEnabled];

    if (v84)
    {
      v87 = [v84 allValues];
      uint64_t v88 = [v87 containsObject:MEMORY[0x263EFFA88]];

      id v89 = [NSNumber numberWithBool:v88];
      [v2 setObject:v89 forKeyedSubscript:@"hasEnvironmentalSoundReductionAvailable"];

      if (v88)
      {
        if (v86)
        {
          id v90 = [v86 allValues];
          uint64_t v91 = [v90 containsObject:MEMORY[0x263EFFA88]];

          id v92 = [NSNumber numberWithBool:v91];
          [v2 setObject:v92 forKeyedSubscript:@"hasEnvironmentalSoundReductionEnabled"];
        }
      }
    }
    v106[0] = @"EAE7DayDoseWithEnvironmentalSoundReduction";
    id v93 = [*(id *)(a1 + 152) audioExposureDose];
    v107[0] = v93;
    v106[1] = @"EAE7DayDurationWithEnvironmentalSoundReduction";
    id v94 = [*(id *)(a1 + 152) audioExposureDuration];
    v107[1] = v94;
    v106[2] = @"EAE7DayLEQWithEnvironmentalSoundReduction";
    id v95 = [*(id *)(a1 + 152) audioExposureLEQ];
    v107[2] = v95;
    v106[3] = @"soundReduction7DayDuration";
    id v96 = [*(id *)(a1 + 144) audioExposureDuration];
    v107[3] = v96;
    v106[4] = @"soundReduction7DayLEQ";
    id v97 = [*(id *)(a1 + 144) audioExposureLEQ];
    uint64_t v98 = *(void *)(a1 + 160);
    uint64_t v99 = *(void *)(a1 + 168);
    v107[4] = v97;
    v107[5] = v98;
    v106[5] = @"countEAENotificationsWithSoundReductionLast24Hours";
    v106[6] = @"countEAENotificationsWithSoundReductionLast30Days";
    v107[6] = v99;
    v106[7] = @"noiseThresholdSetting";
    id v100 = [*(id *)(a1 + 48) noiseThreshold];
    v107[7] = v100;
    id v101 = [NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:8];
    [v2 addEntriesFromDictionary:v101];

    id v102 = (void *)[v2 copy];
  }
  else
  {
    id v102 = (void *)[v2 copy];
  }

  return v102;
}

- (void)_unitTesting_setRecordedDataForToday:(BOOL)a3
{
  self->_unitTesting = 1;
  self->_unitTesting_recordedDataForToday = a3;
}

- (BOOL)_recordedDataForToday
{
  if (self->_unitTesting)
  {
    LOBYTE(v3) = self->_unitTesting_recordedDataForToday;
  }
  else
  {
    id v4 = [(HDAudioAnalyticsManager *)self lastSuccessfulCalculation];
    if (v4)
    {
      uint64_t v5 = [(HDAudioAnalyticsManager *)self _dayForDate:v4];
      uint64_t v6 = [MEMORY[0x263EFF910] date];
      char v7 = [(HDAudioAnalyticsManager *)self _dayForDate:v6];

      BOOL v3 = ![(HDAudioAnalyticsManager *)self _dayComponents:v5 lessThan:v7];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)_dayForDate:(id)a3
{
  id v3 = a3;
  id v4 = +[HDAudioAnalyticsUtilities localGregorianCalendar];
  uint64_t v5 = [v4 components:30 fromDate:v3];

  return v5;
}

- (BOOL)_dayComponents:(id)a3 lessThan:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 era];
  if (v7 >= [v6 era]
    && (uint64_t v8 = [v5 year], v8 >= objc_msgSend(v6, "year"))
    && (uint64_t v9 = [v5 month], v9 >= objc_msgSend(v6, "month")))
  {
    uint64_t v12 = [v5 day];
    BOOL v10 = v12 < [v6 day];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (BOOL)unitTesting_recordedDataForToday
{
  return self->_unitTesting_recordedDataForToday;
}

- (void)setUnitTesting_recordedDataForToday:(BOOL)a3
{
  self->_unitTesting_recordedDataForToday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end