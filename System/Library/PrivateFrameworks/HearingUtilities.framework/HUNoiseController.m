@interface HUNoiseController
+ (BOOL)deviceSupportsEnvironmentalDosimetry;
+ (id)sharedController;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_fetchDeviceState;
- (ADAMAudioDataReceiver)edDataReceiver;
- (AXDispatchTimer)adamSuspendedTimer;
- (AXDispatchTimer)edDummyDataTimer;
- (BOOL)isMeasurementEnabled;
- (BOOL)isMuted;
- (BOOL)isNotified;
- (BOOL)isNotified80;
- (BOOL)isNotified85;
- (BOOL)isNotified90;
- (BOOL)isWearingAirpods;
- (BOOL)shouldShowHearingProtectionSuggestionForAlertType:(unint64_t)a3;
- (HKCategorySample)notificationSample;
- (HKDataCollector)attenuationDataCollector;
- (HKHealthStore)healthStore;
- (HUNoiseController)init;
- (NSDate)timeNotified;
- (NSDate)timeNotified80;
- (NSDate)timeNotified85;
- (NSDate)timeNotified90;
- (NSMutableArray)attenuationBuffer;
- (NSMutableArray)leqBuffer;
- (NSMutableArray)leqBuffer80Threshold;
- (NSMutableArray)leqBuffer85Threshold;
- (NSMutableArray)leqBuffer90Threshold;
- (OS_dispatch_queue)dataQueue;
- (UNUserNotificationCenter)userNotificationCenter;
- (float)calculateLeqForBuffer:(id)a3;
- (float)fastLeq;
- (float)sampleDuration;
- (float)slowLeq;
- (id)measurementConfigurationWithDuration:(unsigned int)a3 period:(unsigned int)a4 config:(unint64_t)a5;
- (id)registerForEnvironmentalDosimetryUpdates:(id)a3;
- (unint64_t)alertTypeFromLevel:(float)a3;
- (unint64_t)thresholdLevel;
- (void)_clearCachedValues;
- (void)_logNoiseEnabledStateToPowerlog:(BOOL)a3;
- (void)_sendUpdateMessageForCurrentValues;
- (void)applyAnalyticsNotificationLogicForSPL:(float)a3 withDuration:(float)a4;
- (void)applyNotificationLogicForSPL:(float)a3 withDuration:(float)a4;
- (void)checkToResetAnalyticsNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7;
- (void)checkToResetNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6;
- (void)checkToSurfaceAnalyticsNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7;
- (void)checkToSurfaceNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6;
- (void)dealloc;
- (void)logNoiseBuffer:(id)a3 calculatedLeq:(float)a4;
- (void)logThresholdTransitionForSample:(id)a3;
- (void)lowPowerModeChanged:(id)a3;
- (void)maintainCircularBuffer:(id)a3 forTime:(float)a4;
- (void)processMeasurement:(id)a3 withMetadata:(id)a4;
- (void)readEnvironmentalDosimetryLevels;
- (void)restartADAMTimer;
- (void)setAdamSuspendedTimer:(id)a3;
- (void)setAttenuationBuffer:(id)a3;
- (void)setAttenuationDataCollector:(id)a3;
- (void)setDataQueue:(id)a3;
- (void)setEdDataReceiver:(id)a3;
- (void)setEdDummyDataTimer:(id)a3;
- (void)setFastLeq:(float)a3;
- (void)setHealthStore:(id)a3;
- (void)setLeqBuffer80Threshold:(id)a3;
- (void)setLeqBuffer85Threshold:(id)a3;
- (void)setLeqBuffer90Threshold:(id)a3;
- (void)setLeqBuffer:(id)a3;
- (void)setMeasurementEnabled:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNotificationSample:(id)a3;
- (void)setNotified80:(BOOL)a3;
- (void)setNotified85:(BOOL)a3;
- (void)setNotified90:(BOOL)a3;
- (void)setNotified:(BOOL)a3;
- (void)setSampleDuration:(float)a3;
- (void)setSlowLeq:(float)a3;
- (void)setThresholdLevel:(unint64_t)a3;
- (void)setTimeNotified80:(id)a3;
- (void)setTimeNotified85:(id)a3;
- (void)setTimeNotified90:(id)a3;
- (void)setTimeNotified:(id)a3;
- (void)showNotificationForAlertType:(unint64_t)a3;
- (void)stopReceivingAudioDosageSamples;
- (void)subscribeToSharedNotifications;
- (void)writeAttentuationSampleToHealth;
- (void)writeNotificationSampleToHKWithSPL:(float)a3 startDate:(id)a4 endDate:(id)a5;
@end

@implementation HUNoiseController

+ (id)sharedController
{
  if (sharedController_onceToken_3 != -1) {
    dispatch_once(&sharedController_onceToken_3, &__block_literal_global_21);
  }
  v2 = (void *)sharedController_Controller_2;

  return v2;
}

uint64_t __37__HUNoiseController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(HUNoiseController);
  uint64_t v1 = sharedController_Controller_2;
  sharedController_Controller_2 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (BOOL)deviceSupportsEnvironmentalDosimetry
{
  if (deviceSupportsEnvironmentalDosimetry_onceToken != -1) {
    dispatch_once(&deviceSupportsEnvironmentalDosimetry_onceToken, &__block_literal_global_282);
  }
  return deviceSupportsEnvironmentalDosimetry_SupportsEnvironmentalDosimetry;
}

uint64_t __57__HUNoiseController_deviceSupportsEnvironmentalDosimetry__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceSupportsEnvironmentalDosimetry_SupportsEnvironmentalDosimetry = result;
  return result;
}

- (HUNoiseController)init
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)HUNoiseController;
  v2 = [(HUNoiseController *)&v73 init];
  if (v2)
  {
    HCHPInitializeLogging();
    v3 = [NSString stringWithFormat:@"Initializing HUNoiseController"];
    v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController init]", 244, v3];
    v5 = (id *)MEMORY[0x263F47298];
    v6 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v4;
      v8 = v6;
      uint64_t v9 = [v7 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    v10 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
    adamSuspendedTimer = v2->_adamSuspendedTimer;
    v2->_adamSuspendedTimer = v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.HearingUtilities.HUNoiseController.DataQueue", v12);
    [(HUNoiseController *)v2 setDataQueue:v13];

    [(HUNoiseController *)v2 _clearCachedValues];
    v14 = [MEMORY[0x263EFF980] array];
    [(HUNoiseController *)v2 setAttenuationBuffer:v14];

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2050000000;
    v15 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v77 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getHKHealthStoreClass_block_invoke;
      v80 = &unk_2640FC9B0;
      v81 = &v74;
      __getHKHealthStoreClass_block_invoke((uint64_t)&buf);
      v15 = (void *)v75[3];
    }
    v16 = v15;
    _Block_object_dispose(&v74, 8);
    v17 = (HKHealthStore *)objc_alloc_init(v16);
    healthStore = v2->_healthStore;
    v2->_healthStore = v17;

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2050000000;
    v19 = (void *)getHKQuantityTypeClass_softClass;
    uint64_t v77 = getHKQuantityTypeClass_softClass;
    if (!getHKQuantityTypeClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getHKQuantityTypeClass_block_invoke;
      v80 = &unk_2640FC9B0;
      v81 = &v74;
      __getHKQuantityTypeClass_block_invoke((uint64_t)&buf);
      v19 = (void *)v75[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v74, 8);
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    v21 = (void *)getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr;
    uint64_t v77 = getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr;
    if (!getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_block_invoke;
      v80 = &unk_2640FC9B0;
      v81 = &v74;
      v22 = (void *)HealthKitLibrary();
      v23 = dlsym(v22, "HKQuantityTypeIdentifierEnvironmentalSoundReduction");
      *(void *)(v81[1] + 24) = v23;
      getHKQuantityTypeIdentifierEnvironmentalSoundReductionSymbolLoc_ptr = *(void *)(v81[1] + 24);
      v21 = (void *)v75[3];
    }
    _Block_object_dispose(&v74, 8);
    if (!v21)
    {
      getADAFMetadataKeyHAEDataForGauge_cold_1();
      __break(1u);
    }
    v24 = [v20 quantityTypeForIdentifier:*v21];
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2050000000;
    v25 = (void *)getHKDataCollectorClass_softClass;
    uint64_t v77 = getHKDataCollectorClass_softClass;
    if (!getHKDataCollectorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getHKDataCollectorClass_block_invoke;
      v80 = &unk_2640FC9B0;
      v81 = &v74;
      __getHKDataCollectorClass_block_invoke((uint64_t)&buf);
      v25 = (void *)v75[3];
    }
    v26 = v25;
    _Block_object_dispose(&v74, 8);
    id v27 = [v26 alloc];
    v28 = [(HUNoiseController *)v2 healthStore];
    uint64_t v29 = [v27 initWithHealthStore:v28 bundleIdentifier:@"com.apple.Noise" quantityType:v24];
    attenuationDataCollector = v2->_attenuationDataCollector;
    v2->_attenuationDataCollector = (HKDataCollector *)v29;

    v31 = +[HUNoiseSettings sharedInstance];
    LODWORD(v27) = [v31 thresholdVersion] == 0;

    if (v27)
    {
      v32 = +[HUNoiseSettings sharedInstance];
      [v32 setThresholdVersion:1];

      v33 = +[HUNoiseSettings sharedInstance];
      [v33 setNotificationThreshold:90];
    }
    uint64_t v34 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.Noise"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v34;

    objc_initWeak(&location, v2);
    v36 = +[HUNoiseSettings sharedInstance];
    v37 = [v36 notificationMuteDate];
    [v37 timeIntervalSinceNow];
    [(HUNoiseController *)v2 setMuted:v38 > 0.0];

    v39 = +[HUNoiseSettings sharedInstance];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __25__HUNoiseController_init__block_invoke;
    v70[3] = &unk_2640FC910;
    objc_copyWeak(&v71, &location);
    [v39 registerUpdateBlock:v70 forRetrieveSelector:sel_notificationMuteDate withListener:v2];

    v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    leqBuffer = v2->_leqBuffer;
    v2->_leqBuffer = v40;

    v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    leqBuffer80Threshold = v2->_leqBuffer80Threshold;
    v2->_leqBuffer80Threshold = v42;

    v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    leqBuffer85Threshold = v2->_leqBuffer85Threshold;
    v2->_leqBuffer85Threshold = v44;

    v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    leqBuffer90Threshold = v2->_leqBuffer90Threshold;
    v2->_leqBuffer90Threshold = v46;

    HCHPInitializeLogging();
    v48 = [NSString stringWithFormat:@"Initializing ADAM data receiver"];
    v49 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController init]", 284, v48];
    v50 = *v5;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = [v49 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_20CC86000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2050000000;
    v52 = (void *)getADAMAudioDataReceiverClass_softClass_0;
    uint64_t v77 = getADAMAudioDataReceiverClass_softClass_0;
    if (!getADAMAudioDataReceiverClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v79 = __getADAMAudioDataReceiverClass_block_invoke_0;
      v80 = &unk_2640FC9B0;
      v81 = &v74;
      __getADAMAudioDataReceiverClass_block_invoke_0((uint64_t)&buf);
      v52 = (void *)v75[3];
    }
    v53 = v52;
    _Block_object_dispose(&v74, 8);
    id v54 = [v53 alloc];
    v55 = [MEMORY[0x263F086E0] mainBundle];
    v56 = [v55 bundleIdentifier];
    uint64_t v57 = [v54 initWithIdentifier:v56];
    edDataReceiver = v2->_edDataReceiver;
    v2->_edDataReceiver = (ADAMAudioDataReceiver *)v57;

    [(ADAMAudioDataReceiver *)v2->_edDataReceiver stopMeasuringAudioSampleType:1702260324];
    v59 = +[HUNoiseSettings sharedInstance];
    uint64_t v60 = [v59 noiseEnabled];

    [(HUNoiseController *)v2 _logNoiseEnabledStateToPowerlog:v60];
    if (v60)
    {
      dispatch_time_t v61 = dispatch_time(0, 100000000);
      v62 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __25__HUNoiseController_init__block_invoke_310;
      block[3] = &unk_2640FC910;
      objc_copyWeak(&v69, &location);
      dispatch_after(v61, v62, block);

      objc_destroyWeak(&v69);
    }
    else
    {
      HCHPInitializeLogging();
      v63 = [NSString stringWithFormat:@"Noise not enabled"];
      v64 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController init]", 307, v63];
      v65 = *v5;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v66 = [v64 UTF8String];
        LODWORD(buf) = 136446210;
        *(void *)((char *)&buf + 4) = v66;
        _os_log_impl(&dword_20CC86000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
      }
    }
    [(HUNoiseController *)v2 subscribeToSharedNotifications];
    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __25__HUNoiseController_init__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  v2 = NSString;
  v3 = +[HUNoiseSettings sharedInstance];
  v4 = [v3 notificationMuteDate];
  v5 = [v2 stringWithFormat:@"Notification mute date changed: %@", v4];

  v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController init]_block_invoke", 272, v5];
  id v7 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v15 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = +[HUNoiseSettings sharedInstance];
  v12 = [v11 notificationMuteDate];
  [v12 timeIntervalSinceNow];
  [WeakRetained setMuted:v13 > 0.0];
}

void __25__HUNoiseController_init__block_invoke_310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained readEnvironmentalDosimetryLevels];
}

- (void)dealloc
{
  notify_cancel(self->_measurementSuspensionNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)HUNoiseController;
  [(HUNoiseController *)&v3 dealloc];
}

- (void)showNotificationForAlertType:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = hearingLocString(@"NoiseAlertTitle");
  v6 = hearingLocString(@"NoiseAlertLevelContent80");
  id v7 = NSString;
  id v8 = hearingLocString(@"NoiseAlertLevelDetailedContent80");
  uint64_t v9 = &stru_26C1D5720;
  v10 = objc_msgSend(v7, "stringWithFormat:", v8, v6, &stru_26C1D5720);

  if ([(HUNoiseController *)self isWearingAirpods])
  {
    v11 = accessibilityHearingAidSupportBundle();
    uint64_t v9 = [v11 localizedStringForKey:@"NoiseAlertAirPodsDetail" value:@"NoiseAlertAirPodsDetail" table:@"HearingAidSupport-B698"];
  }
  double v38 = v9;
  switch(a3)
  {
    case 1uLL:
      uint64_t v12 = hearingLocString(@"NoiseAlertLevelContent80");

      double v13 = NSString;
      v14 = @"NoiseAlertLevelDetailedContent80";
      goto LABEL_9;
    case 2uLL:
      uint64_t v12 = hearingLocString(@"NoiseAlertLevelContent85");

      double v13 = NSString;
      v14 = @"NoiseAlertLevelDetailedContent85";
      goto LABEL_9;
    case 3uLL:
      uint64_t v12 = hearingLocString(@"NoiseAlertLevelContent90");

      double v13 = NSString;
      v14 = @"NoiseAlertLevelDetailedContent90";
      goto LABEL_9;
    case 4uLL:
      uint64_t v12 = hearingLocString(@"NoiseAlertLevelContent95");

      double v13 = NSString;
      v14 = @"NoiseAlertLevelDetailedContent95";
      goto LABEL_9;
    case 5uLL:
    case 6uLL:
      uint64_t v12 = hearingLocString(@"NoiseAlertLevelContent100");

      double v13 = NSString;
      v14 = @"NoiseAlertLevelDetailedContent100";
LABEL_9:
      uint64_t v15 = hearingLocString(v14);
      uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12, v9);
      v6 = (void *)v12;

      v10 = (void *)v16;
      break;
    default:
      break;
  }
  BOOL v17 = [(HUNoiseController *)self shouldShowHearingProtectionSuggestionForAlertType:a3];
  v18 = hearingLocString(@"NoiseAlertDamageWarning");
  v19 = [v10 stringByAppendingFormat:@"\n\n%@", v18];

  if (v17)
  {
    if (!_os_feature_enabled_impl()) {
      goto LABEL_15;
    }
    id v20 = accessibilityHearingAidSupportBundle();
    v21 = [v20 localizedStringForKey:@"NoiseEverwhereProtectionSuggestion" value:@"NoiseEverwhereProtectionSuggestion" table:@"HearingProtection-Yodel"];

    [v19 stringByAppendingFormat:@"\n\n%@", v21];
  }
  else
  {
    v21 = hearingLocString(@"NoiseAlertDamageWarningConsiderSuggestion");
    [v19 stringByAppendingFormat:@" %@", v21];
  uint64_t v22 = };

  v19 = (void *)v22;
LABEL_15:
  v23 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"com.apple.noise.threshold" actions:MEMORY[0x263EFFA68] intentIdentifiers:MEMORY[0x263EFFA68] options:0];
  userNotificationCenter = self->_userNotificationCenter;
  v25 = [MEMORY[0x263EFFA08] setWithObject:v23];
  [(UNUserNotificationCenter *)userNotificationCenter setNotificationCategories:v25];

  v26 = objc_opt_new();
  [v26 setCategoryIdentifier:@"com.apple.noise.threshold"];
  [v26 setThreadIdentifier:@"com.apple.noise.threshold"];
  [v26 setExpirationDate:0];
  id v27 = (void *)v5;
  [v26 setTitle:v5];
  [v26 setBody:v19];
  v28 = [MEMORY[0x263F1DF68] defaultSound];
  [v26 setSound:v28];

  [v26 setInterruptionLevel:2];
  uint64_t v29 = (void *)MEMORY[0x263F1DF48];
  v30 = [MEMORY[0x263F08C38] UUID];
  v31 = [v30 UUIDString];
  v32 = [v29 requestWithIdentifier:v31 content:v26 trigger:0 destinations:15];

  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v32 withCompletionHandler:&__block_literal_global_386];
  HCHPInitializeLogging();
  v33 = [NSString stringWithFormat:@"Notification request added to notification center: %@", v19];
  uint64_t v34 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController showNotificationForAlertType:]", 429, v33];
  v35 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v36 = v34;
    v37 = v35;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v40 = [v36 UTF8String];
    _os_log_impl(&dword_20CC86000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void __50__HUNoiseController_showNotificationForAlertType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v2 = a2;
    HCHPInitializeLogging();
    objc_super v3 = [NSString stringWithFormat:@"Notification request failed to add to notification center with error: %@", v2];

    v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController showNotificationForAlertType:]_block_invoke", 426, v3];
    uint64_t v5 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      id v7 = v5;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v9 = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (unint64_t)alertTypeFromLevel:(float)a3
{
  if (a3 >= 80.0 && a3 < 85.0) {
    return 1;
  }
  if (a3 >= 85.0 && a3 < 90.0) {
    return 2;
  }
  if (a3 >= 90.0 && a3 < 95.0) {
    return 3;
  }
  if (a3 >= 95.0 && a3 < 100.0) {
    return 4;
  }
  if (a3 >= 100.0 && a3 <= 110.0) {
    return 5;
  }
  if (a3 > 110.0) {
    return 6;
  }
  return 0;
}

- (void)restartADAMTimer
{
  if (!_AXSVoiceOverTouchEnabled())
  {
    [(AXDispatchTimer *)self->_adamSuspendedTimer cancel];
    objc_initWeak(&location, self);
    adamSuspendedTimer = self->_adamSuspendedTimer;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __37__HUNoiseController_restartADAMTimer__block_invoke;
    v4[3] = &unk_2640FC910;
    objc_copyWeak(&v5, &location);
    [(AXDispatchTimer *)adamSuspendedTimer afterDelay:v4 processBlock:1.0];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __37__HUNoiseController_restartADAMTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  id v2 = [NSString stringWithFormat:@"Didn't receive measurements from ADAM."];
  objc_super v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController restartADAMTimer]_block_invoke", 468, v2];
  v4 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v14 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setMeasurementEnabled:0];

  id v9 = objc_loadWeakRetained(v7);
  uint64_t v10 = [v9 dataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HUNoiseController_restartADAMTimer__block_invoke_396;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v12, v7);
  dispatch_async(v10, block);

  objc_destroyWeak(&v12);
}

void __37__HUNoiseController_restartADAMTimer__block_invoke_396(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendUpdateMessageForCurrentValues];
}

- (void)processMeasurement:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUNoiseController *)self setMeasurementEnabled:1];
  [(HUNoiseController *)self restartADAMTimer];
  id v8 = [(HUNoiseController *)self dataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HUNoiseController_processMeasurement_withMetadata___block_invoke;
  block[3] = &unk_2640FE058;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__HUNoiseController_processMeasurement_withMetadata___block_invoke(id *a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  [a1[4] floatValue];
  float v3 = v2;
  uint64_t v4 = [a1[5] _fetchDeviceState];
  uint64_t v6 = v5;
  double v7 = v3;
  +[HUNoiseUtilities attenuationForExposure:v4 deviceType:v5 andListeningState:v3];
  double v9 = v8;
  id v10 = [HUNoiseSample alloc];
  v11 = [MEMORY[0x263EFF910] date];
  [a1[5] sampleDuration];
  LODWORD(v14) = v13;
  float v12 = v9;
  *(float *)&double v15 = v12;
  uint64_t v16 = [(HUNoiseSample *)v10 initWithSampleDate:v11 splValue:v15 andDuration:v14];

  BOOL v17 = [a1[5] attenuationBuffer];
  [v17 addObject:v16];

  v18 = [a1[6] objectForKey:@"FastData"];
  int v19 = [v18 BOOLValue];

  id v20 = a1[5];
  *(float *)&double v21 = v3;
  if (v19)
  {
    [v20 setFastLeq:v21];
  }
  else
  {
    [v20 setSlowLeq:v21];
    uint64_t v22 = +[HUNoiseSettings sharedInstance];
    int v23 = [v22 notificationsEnabled];

    if (v23)
    {
      id v24 = a1[5];
      [v24 sampleDuration];
      LODWORD(v26) = v25;
      *(float *)&double v27 = v7 - v9;
      [v24 applyNotificationLogicForSPL:v27 withDuration:v26];
      id v28 = a1[5];
      [v28 sampleDuration];
      LODWORD(v30) = v29;
      *(float *)&double v31 = v7 - v9;
      [v28 applyAnalyticsNotificationLogicForSPL:v31 withDuration:v30];
    }
  }
  v32 = [MEMORY[0x263EFF910] date];
  v33 = [a1[5] attenuationBuffer];
  uint64_t v34 = [v33 firstObject];
  v35 = [v34 sampleDate];
  [v32 timeIntervalSinceDate:v35];
  double v37 = v36;

  if (v37 > 5.0) {
    [a1[5] writeAttentuationSampleToHealth];
  }
  double v38 = +[HUNoiseSettings sharedInstance];
  int v39 = [v38 internalLoggingEnabled];

  if (v39)
  {
    HCHPInitializeLogging();
    uint64_t v40 = NSString;
    uint64_t v41 = [NSNumber numberWithInteger:v6];
    v42 = [NSNumber numberWithInteger:v4];
    v43 = [v40 stringWithFormat:@"Measured %lf with attenuation %lf for listening mode %@ and device type %@", *(void *)&v7, *(void *)&v9, v41, v42];

    v44 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController processMeasurement:withMetadata:]_block_invoke", 520, v43];
    v45 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v46 = v44;
      v47 = v45;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v49 = [v46 UTF8String];
      _os_log_impl(&dword_20CC86000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  [a1[5] _sendUpdateMessageForCurrentValues];
}

- (void)readEnvironmentalDosimetryLevels
{
  objc_initWeak(&location, self);
  float v3 = [(HUNoiseController *)self dataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke;
  block[3] = &unk_2640FD1D0;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  float v2 = [MEMORY[0x263F08AB0] processInfo];
  unsigned int v3 = [v2 isLowPowerModeEnabled];

  uint64_t v4 = +[AXHeardController sharedServer];
  uint64_t v5 = [v4 countOfClientsListeningForIdentifier:0x40000];

  if (v5)
  {
    HCHPInitializeLogging();
    uint64_t v6 = [NSString stringWithFormat:@"Configuring for foreground measurements."];
    double v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 537, v6];
    double v8 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      id v10 = v8;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v45 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    LODWORD(v11) = 1148846080;
    [*(id *)(a1 + 32) setSampleDuration:v11];
    uint64_t v12 = [*(id *)(a1 + 32) measurementConfigurationWithDuration:100 period:100 config:1];
LABEL_5:
    int v13 = (void *)v12;
    [*(id *)(a1 + 32) stopReceivingAudioDosageSamples];
    double v14 = [*(id *)(a1 + 32) edDataReceiver];
    [v14 configureAudioSampleType:1702260324 configuration:v13];

    double v15 = [*(id *)(a1 + 32) edDataReceiver];
    char v16 = [v15 isMeasurementOnForAudioSampleType:1702260324];

    if ((v16 & 1) == 0)
    {
      BOOL v17 = [*(id *)(a1 + 32) edDataReceiver];
      [v17 startMeasuringAudioSampleType:1702260324 withConfiguration:v13];
    }
    [*(id *)(a1 + 32) restartADAMTimer];
    v18 = [*(id *)(a1 + 32) edDataReceiver];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke_422;
    v42[3] = &unk_2640FEF88;
    objc_copyWeak(&v43, (id *)(a1 + 40));
    [v18 startReceivingAudioSampleType:1702260324 withCallback:v42];

    objc_destroyWeak(&v43);
    goto LABEL_17;
  }
  if ((v3 & 1) == 0)
  {
    int v19 = +[HUNoiseSettings sharedInstance];
    char v20 = [v19 noiseEnabled];

    if (v20)
    {
      int v21 = [MEMORY[0x263F472B0] supportsAlwaysListening];
      HCHPInitializeLogging();
      if (v21)
      {
        uint64_t v22 = [NSString stringWithFormat:@"Configuring for background measurements with AOM."];
        int v23 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 563, v22];
        id v24 = (void *)*MEMORY[0x263F47298];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v23;
          double v26 = v24;
          *(_DWORD *)long long buf = 136446210;
          uint64_t v45 = [v25 UTF8String];
          _os_log_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        LODWORD(v27) = 1148846080;
        [*(id *)(a1 + 32) setSampleDuration:v27];
        uint64_t v12 = [*(id *)(a1 + 32) measurementConfigurationWithDuration:1000 period:1000 config:0];
      }
      else
      {
        double v36 = [NSString stringWithFormat:@"Configuring for background measurements."];
        double v37 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 569, v36];
        double v38 = (void *)*MEMORY[0x263F47298];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
        {
          id v39 = v37;
          uint64_t v40 = v38;
          *(_DWORD *)long long buf = 136446210;
          uint64_t v45 = [v39 UTF8String];
          _os_log_impl(&dword_20CC86000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        LODWORD(v41) = 1167867904;
        [*(id *)(a1 + 32) setSampleDuration:v41];
        uint64_t v12 = [*(id *)(a1 + 32) measurementConfigurationWithDuration:1000 period:5000 config:0];
      }
      goto LABEL_5;
    }
  }
  HCHPInitializeLogging();
  id v28 = objc_msgSend(NSString, "stringWithFormat:", @"Skipping background measurements. Low power enabled %d", v3);
  int v29 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController readEnvironmentalDosimetryLevels]_block_invoke", 544, v28];
  double v30 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v29;
    v32 = v30;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v45 = [v31 UTF8String];
    _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v34 = *(void **)(a1 + 32);
  v33 = (id *)(a1 + 32);
  [v34 setMeasurementEnabled:0];
  v35 = [*v33 edDataReceiver];
  [v35 stopReceivingAudioSampleType:1702260324];

  int v13 = [*v33 edDataReceiver];
  [v13 stopMeasuringAudioSampleType:1702260324];
LABEL_17:
}

void __53__HUNoiseController_readEnvironmentalDosimetryLevels__block_invoke_422(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained processMeasurement:v6 withMetadata:v5];
}

- (void)_sendUpdateMessageForCurrentValues
{
  unsigned int v3 = [(HUNoiseController *)self dataQueue];
  dispatch_assert_queue_V2(v3);

  [(HUNoiseController *)self slowLeq];
  if (v4 != 1.1755e-38 && ([(HUNoiseController *)self fastLeq], v5 != 1.1755e-38)
    || ![(HUNoiseController *)self isMeasurementEnabled])
  {
    uint64_t v6 = [(HUNoiseController *)self _fetchDeviceState];
    uint64_t v8 = v7;
    [(HUNoiseController *)self slowLeq];
    float v10 = v9;
    [(HUNoiseController *)self fastLeq];
    float v12 = v11;
    +[HUNoiseUtilities attenuationForExposure:v6 deviceType:v8 andListeningState:v10];
    float v14 = v13;
    +[HUNoiseUtilities attenuationForExposure:v6 deviceType:v8 andListeningState:v12];
    float v16 = v15;
    if ((float)(v10 - v14) >= 80.0) {
      uint64_t v17 = 80;
    }
    else {
      uint64_t v17 = 0;
    }
    *(float *)&double v15 = v10 - v14;
    -[HUNoiseController setThresholdLevel:](self, "setThresholdLevel:", v17, v15);
    v33 = NSDictionary;
    *(float *)&double v18 = v10;
    v32 = [NSNumber numberWithFloat:v18];
    int v19 = NSNumber;
    [(HUNoiseController *)self fastLeq];
    id v31 = objc_msgSend(v19, "numberWithFloat:");
    double v30 = objc_msgSend(NSNumber, "numberWithBool:", -[HUNoiseController isMeasurementEnabled](self, "isMeasurementEnabled"));
    char v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUNoiseController thresholdLevel](self, "thresholdLevel"));
    *(float *)&double v21 = v14;
    uint64_t v22 = [NSNumber numberWithFloat:v21];
    *(float *)&double v23 = v16;
    id v24 = [NSNumber numberWithFloat:v23];
    id v25 = objc_msgSend(NSNumber, "numberWithBool:", -[HUNoiseController isWearingAirpods](self, "isWearingAirpods"));
    double v26 = [NSNumber numberWithInteger:v6];
    double v27 = objc_msgSend(v33, "dictionaryWithObjectsAndKeys:", v32, @"HUEDSlowLeqIdentifier", v31, @"HUEDFastLeqIdentifier", v30, @"HUEDEnabledIdentifier", v20, @"HUEDThresholdCrossedIdentifier", v22, @"HUEDSlowAttenuationLevelIdentifier", v24, @"HUEDFastAttenuationLevelIdentifier", v25, @"HUEDWearingAirPodsIdentifier", v26, @"HUEDDeviceTypeIdentifier", 0);

    uint64_t v34 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v27 andIdentifier:0x40000];

    id v28 = +[AXHeardController sharedServer];
    int v29 = [MEMORY[0x263F472C0] messageWithPayload:v34];
    [v28 sendUpdateMessage:v29 forIdentifier:0x40000];
  }
}

- (void)_clearCachedValues
{
  unsigned int v3 = [(HUNoiseController *)self dataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HUNoiseController__clearCachedValues__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__HUNoiseController__clearCachedValues__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0x800000;
  [*(id *)(a1 + 32) setSlowLeq:a2];
  LODWORD(v3) = 0x800000;
  [*(id *)(a1 + 32) setFastLeq:v3];
  float v4 = *(void **)(a1 + 32);

  return [v4 setMeasurementEnabled:0];
}

- (void)stopReceivingAudioDosageSamples
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  double v3 = [NSString stringWithFormat:@"stop receiving audio dosage samples. clearing cached values"];
  float v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController stopReceivingAudioDosageSamples]", 647, v3];
  float v5 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    uint64_t v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUNoiseController *)self _clearCachedValues];
  [(AXDispatchTimer *)self->_adamSuspendedTimer cancel];
  [(ADAMAudioDataReceiver *)self->_edDataReceiver stopReceivingAudioSampleType:1702260324];
}

- (void)_logNoiseEnabledStateToPowerlog:(BOOL)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  float v11 = @"noiseEnabled";
  double v3 = [NSNumber numberWithBool:a3];
  v12[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  float v5 = (void (*)(uint64_t, __CFString *, uint64_t, void))getPLLogRegisteredEventSymbolLoc_ptr;
  uint64_t v10 = getPLLogRegisteredEventSymbolLoc_ptr;
  if (!getPLLogRegisteredEventSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getPLLogRegisteredEventSymbolLoc_block_invoke;
    v6[3] = &unk_2640FC9B0;
    v6[4] = &v7;
    __getPLLogRegisteredEventSymbolLoc_block_invoke((uint64_t)v6);
    float v5 = (void (*)(uint64_t, __CFString *, uint64_t, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v5)
  {
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    __break(1u);
  }
  v5(92, @"NoiseEnabledStateChanged", v4, MEMORY[0x263EFFA68]);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_fetchDeviceState
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  float v12 = &unk_20CD21552;
  float v2 = +[HUAccessoryManager sharedInstance];
  double v3 = [v2 sharedQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HUNoiseController__fetchDeviceState__block_invoke;
  block[3] = &unk_2640FC9B0;
  void block[4] = &v9;
  dispatch_sync(v3, block);

  int64_t v4 = v10[4];
  int64_t v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  int64_t v6 = v4;
  int64_t v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

void __38__HUNoiseController__fetchDeviceState__block_invoke(uint64_t a1)
{
  id v5 = +[HUAccessoryHearingSyncManager sharedInstance];
  uint64_t v2 = [v5 deviceState];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v4;
}

- (void)applyNotificationLogicForSPL:(float)a3 withDuration:(float)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t v7 = +[HUNoiseSettings sharedInstance];
  int v8 = [v7 notificationsEnabled];

  if (v8)
  {
    if ([(HUNoiseController *)self isNotified])
    {
      if ([(HUNoiseController *)self isMuted])
      {
        double v15 = [MEMORY[0x263EFF910] date];
        float v16 = +[HUNoiseSettings sharedInstance];
        uint64_t v17 = [v16 notificationMuteDate];
        [v15 timeIntervalSinceDate:v17];
        double v19 = v18;

        if (v19 > 0.0)
        {
          HCHPInitializeLogging();
          char v20 = NSString;
          double v21 = +[HUNoiseSettings sharedInstance];
          uint64_t v22 = [v21 notificationMuteDate];
          double v23 = [v20 stringWithFormat:@"Resetting notifications since it has past the notification mute date of %@", v22];

          id v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController applyNotificationLogicForSPL:withDuration:]", 693, v23];
          id v25 = (void *)*MEMORY[0x263F47298];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
          {
            id v26 = v24;
            double v27 = v25;
            *(_DWORD *)long long buf = 136446210;
            uint64_t v31 = [v26 UTF8String];
            _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
          [(HUNoiseController *)self setNotified:0];
          [(HUNoiseController *)self setMuted:0];
        }
      }
      else
      {
        leqBuffer = self->_leqBuffer;
        LODWORD(v14) = 1230748160;
        *(float *)&double v12 = a3;
        *(float *)&double v13 = a4;
        [(HUNoiseController *)self checkToResetNotificationsForSPL:leqBuffer withDuration:v12 andBuffer:v13 forTime:v14];
      }
    }
    else
    {
      id v28 = self->_leqBuffer;
      LODWORD(v11) = 1211090944;
      *(float *)&double v9 = a3;
      *(float *)&double v10 = a4;
      [(HUNoiseController *)self checkToSurfaceNotificationForSPL:v28 withDuration:v9 andBuffer:v10 forTime:v11];
    }
  }
}

- (void)checkToResetNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a5;
  double v11 = [HUNoiseSample alloc];
  double v12 = [MEMORY[0x263EFF910] date];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  double v15 = [(HUNoiseSample *)v11 initWithSampleDate:v12 splValue:v13 andDuration:v14];

  [v10 addObject:v15];
  *(float *)&double v16 = a6;
  [(HUNoiseController *)self maintainCircularBuffer:v10 forTime:v16];
  if ([v10 count])
  {
    uint64_t v17 = [v10 firstObject];
    double v18 = [v17 sampleDate];

    double v19 = [v10 lastObject];
    id v20 = [v19 sampleDate];

    double v21 = [v10 lastObject];
    [v21 sampleDuration];
    float v23 = v22;

    [v20 timeIntervalSinceDate:v18];
    double v25 = v24;
    id v26 = [MEMORY[0x263EFF910] date];
    [v26 timeIntervalSinceDate:self->_timeNotified];
    unsigned int v28 = (v27 * 1000.0);

    if ((float)v28 >= a6)
    {
      float v29 = v23 + v25 * 1000.0;
      if ((float)(a6 * 90.0) / 100.0 <= v29)
      {
        [(HUNoiseController *)self calculateLeqForBuffer:v10];
        float v31 = v30;
        uint64_t v32 = +[HUNoiseSettings sharedInstance];
        float v33 = (float)(unint64_t)[v32 notificationThreshold];

        if (v31 < v33)
        {
          HCHPInitializeLogging();
          id v39 = NSString;
          uint64_t v40 = +[HUNoiseSettings sharedInstance];
          uint64_t v34 = objc_msgSend(v39, "stringWithFormat:", @"Resetting notifications for Leq %0.1f dB being under %i dB threshold for minimum reset time", v31, objc_msgSend(v40, "notificationThreshold"));

          id v35 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 735, v34];
          double v36 = (void *)*MEMORY[0x263F47298];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
          {
LABEL_11:
            id v35 = v35;
            double v41 = v36;
            *(_DWORD *)long long buf = 136446210;
            uint64_t v43 = [v35 UTF8String];
            _os_log_impl(&dword_20CC86000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
LABEL_12:

          [(HUNoiseController *)self setNotified:0];
          goto LABEL_13;
        }
      }
    }
    if (v28 >= 0x1B7740)
    {
      HCHPInitializeLogging();
      uint64_t v34 = [NSString stringWithFormat:@"Resetting notifications since it has been more than general reset time"];
      id v35 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 743, v34];
      double v36 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
  }
  else
  {
    HCHPInitializeLogging();
    double v18 = [NSString stringWithFormat:@"Failed while checking to reset notifications because buffer is empty."];
    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetNotificationsForSPL:withDuration:andBuffer:forTime:]", 718, v18];
    double v37 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v20;
      double v38 = v37;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v43 = [v20 UTF8String];
      _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
LABEL_13:
}

- (void)checkToSurfaceNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v10 = a5;
  double v11 = [HUNoiseSample alloc];
  double v12 = [MEMORY[0x263EFF910] date];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  double v15 = [(HUNoiseSample *)v11 initWithSampleDate:v12 splValue:v13 andDuration:v14];

  [(HUNoiseController *)self logThresholdTransitionForSample:v15];
  [v10 addObject:v15];
  *(float *)&double v16 = a6;
  [(HUNoiseController *)self maintainCircularBuffer:v10 forTime:v16];
  if ([v10 count])
  {
    uint64_t v17 = [v10 firstObject];
    double v18 = [v17 sampleDate];

    double v19 = [v10 lastObject];
    id v20 = [v19 sampleDate];

    double v21 = [v10 lastObject];
    [v21 sampleDuration];
    float v23 = v22;

    [v20 timeIntervalSinceDate:v18];
    double v25 = v24;
    id v26 = +[HUNoiseSettings sharedInstance];
    if ((float)(unint64_t)[v26 notificationThreshold] > a3
      || (float v27 = v23 + v25 * 1000.0, (float)(a6 * 90.0) / 100.0 > v27))
    {

      goto LABEL_25;
    }

    if (v27 <= 15000.0) {
      goto LABEL_25;
    }
    HCHPInitializeLogging();
    float v30 = NSString;
    float v31 = +[HUNoiseSettings sharedInstance];
    uint64_t v32 = objc_msgSend(v30, "stringWithFormat:", @"Sample is above threshold of %i dB and buffered more than %i ms", objc_msgSend(v31, "notificationThreshold"), (int)a6);

    float v33 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 773, v32];
    uint64_t v34 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v33;
      double v36 = v34;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v35 UTF8String];
      _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    double v37 = [v20 dateByAddingTimeInterval:-15.0];
    HCHPInitializeLogging();
    double v38 = [NSString stringWithFormat:@"Leq buffer gating date: %@", v37];
    id v39 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 776, v38];
    uint64_t v40 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v41 = v39;
      v42 = v40;
      uint64_t v43 = [v41 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_20CC86000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    v90[0] = MEMORY[0x263EF8330];
    v90[1] = 3221225472;
    v90[2] = __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke;
    v90[3] = &unk_2640FEFB0;
    id v88 = v37;
    id v91 = v88;
    id v45 = v44;
    id v92 = v45;
    [v10 enumerateObjectsUsingBlock:v90];
    if (![v45 count])
    {
LABEL_24:

      goto LABEL_25;
    }
    HCHPInitializeLogging();
    uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"Total count of samples beyond gate date: %i", objc_msgSend(v45, "count"));
    v47 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 791, v46];
    v48 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v49 = v47;
      uint64_t v50 = v48;
      uint64_t v51 = [v49 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_20CC86000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v96 = 0x2020000000;
    int v97 = 0;
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_462;
    v89[3] = &unk_2640FEFD8;
    v89[4] = &buf;
    [v45 enumerateObjectsUsingBlock:v89];
    HCHPInitializeLogging();
    v52 = objc_msgSend(NSString, "stringWithFormat:", @"Count of samples beyond gate date and above threshold: %i", *(unsigned int *)(*((void *)&buf + 1) + 24));
    v53 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 802, v52];
    id v54 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = [v53 UTF8String];
      *(_DWORD *)v93 = 136446210;
      uint64_t v94 = v55;
      _os_log_impl(&dword_20CC86000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    unsigned int v56 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    float v57 = (float)((float)v56 / (float)(unint64_t)[v45 count]) * 100.0;
    if (v57 < 50.0) {
      goto LABEL_23;
    }
    HCHPInitializeLogging();
    v58 = NSString;
    v59 = +[HUNoiseSettings sharedInstance];
    uint64_t v60 = objc_msgSend(v58, "stringWithFormat:", @"Checking to surface notification: %i percent of last %i seconds of samples are above %i dB set threshold - calculating leq", (int)v57, 15, objc_msgSend(v59, "notificationThreshold"));

    dispatch_time_t v61 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 807, v60];
    v62 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = [v61 UTF8String];
      *(_DWORD *)v93 = 136446210;
      uint64_t v94 = v63;
      _os_log_impl(&dword_20CC86000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    [(HUNoiseController *)self calculateLeqForBuffer:v10];
    float v65 = v64;
    HCHPInitializeLogging();
    uint64_t v66 = objc_msgSend(NSString, "stringWithFormat:", @"Calculated Leq: %0.1f dB", v65);
    v67 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 810, v66];
    v68 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = [v67 UTF8String];
      *(_DWORD *)v93 = 136446210;
      uint64_t v94 = v69;
      _os_log_impl(&dword_20CC86000, v68, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    v70 = +[HUNoiseSettings sharedInstance];
    BOOL v71 = v65 < (float)(unint64_t)[v70 notificationThreshold];

    if (v71)
    {
LABEL_23:
      _Block_object_dispose(&buf, 8);
      goto LABEL_24;
    }
    HCHPInitializeLogging();
    v72 = NSString;
    objc_super v73 = +[HUNoiseSettings sharedInstance];
    uint64_t v74 = [v72 stringWithFormat:@"Leq over last 3 minutes is %0.0f dB, which is over set threshold of %i dB.", v65, objc_msgSend(v73, "notificationThreshold")];

    v75 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 814, v74];
    uint64_t v76 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v77 = [v75 UTF8String];
      *(_DWORD *)v93 = 136446210;
      uint64_t v94 = v77;
      _os_log_impl(&dword_20CC86000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    *(float *)&double v78 = v65;
    [(HUNoiseController *)self logNoiseBuffer:v10 calculatedLeq:v78];
    *(float *)&double v79 = v65;
    [(HUNoiseController *)self showNotificationForAlertType:[(HUNoiseController *)self alertTypeFromLevel:v79]];
    [(HUNoiseController *)self setNotified:1];
    v80 = [MEMORY[0x263EFF910] date];
    [(HUNoiseController *)self setTimeNotified:v80];

    *(float *)&double v81 = v65;
    [(HUNoiseController *)self writeNotificationSampleToHKWithSPL:v18 startDate:v20 endDate:v81];
    HCHPInitializeLogging();
    uint64_t v82 = [NSString stringWithFormat:@"Completed surfacing notification at %@ for Leq %0.1f dB and writing sample to HK", self->_timeNotified, v65];
    v83 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 856, v82];
    v84 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v85 = [v83 UTF8String];
      *(_DWORD *)v93 = 136446210;
      uint64_t v94 = v85;
      _os_log_impl(&dword_20CC86000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s", v93, 0xCu);
    }

    v86 = [MEMORY[0x263F53C50] sharedConnection];
    int v87 = [v86 isHealthDataSubmissionAllowed];

    if (v87) {
      AnalyticsSendEventLazy();
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    HCHPInitializeLogging();
    double v18 = [NSString stringWithFormat:@"Failed while checking to surface notification because buffer is empty."];
    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]", 760, v18];
    unsigned int v28 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v20;
      float v29 = v28;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v20 UTF8String];
      _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_25:
}

void __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 sampleDate];
  uint64_t v5 = [v4 compare:*(void *)(a1 + 32)];

  if (v5 != -1)
  {
    [*(id *)(a1 + 40) addObject:v3];
    HCHPInitializeLogging();
    int64_t v6 = NSString;
    [v3 splValue];
    double v8 = v7;
    double v9 = [v3 sampleDate];
    id v10 = [v6 stringWithFormat:@"Sample is beyond gate date: %0.1f, %@", *(void *)&v8, v9];

    double v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceNotificationForSPL:withDuration:andBuffer:forTime:]_block_invoke", 785, v10];
    double v12 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      double v14 = v12;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v16 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_462(uint64_t a1, void *a2)
{
  [a2 splValue];
  float v4 = v3;
  uint64_t v5 = +[HUNoiseSettings sharedInstance];
  float v6 = (float)(unint64_t)[v5 notificationThreshold];

  if (v4 >= v6) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

id __85__HUNoiseController_checkToSurfaceNotificationForSPL_withDuration_andBuffer_forTime___block_invoke_482(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"timeNotified";
  uint64_t v2 = [MEMORY[0x263F08790] localizedStringFromDate:*(void *)(*(void *)(a1 + 32) + 72) dateStyle:3 timeStyle:3];
  v11[0] = v2;
  v10[1] = @"leq";
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  float v4 = [NSNumber numberWithFloat:v3];
  v11[1] = v4;
  v10[2] = @"notificationThreshold";
  uint64_t v5 = NSNumber;
  float v6 = +[HUNoiseSettings sharedInstance];
  float v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "notificationThreshold"));
  v11[2] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (void)applyAnalyticsNotificationLogicForSPL:(float)a3 withDuration:(float)a4
{
  float v7 = +[HUNoiseSettings sharedInstance];
  int v8 = [v7 notificationsEnabled];

  if (v8)
  {
    BOOL v9 = [(HUNoiseController *)self isNotified80];
    leqBuffer80Threshold = self->_leqBuffer80Threshold;
    if (v9)
    {
      LODWORD(v12) = 1230748160;
      *(float *)&double v10 = a3;
      *(float *)&double v11 = a4;
      [(HUNoiseController *)self checkToResetAnalyticsNotificationsForSPL:leqBuffer80Threshold withDuration:0 andBuffer:v10 forTime:v11 andThreshold:v12];
    }
    else
    {
      LODWORD(v12) = 1211090944;
      *(float *)&double v10 = a3;
      *(float *)&double v11 = a4;
      [(HUNoiseController *)self checkToSurfaceAnalyticsNotificationForSPL:leqBuffer80Threshold withDuration:0 andBuffer:v10 forTime:v11 andThreshold:v12];
    }
    BOOL v14 = [(HUNoiseController *)self isNotified85];
    leqBuffer85Threshold = self->_leqBuffer85Threshold;
    if (v14)
    {
      LODWORD(v17) = 1230748160;
      *(float *)&double v15 = a3;
      *(float *)&double v16 = a4;
      [(HUNoiseController *)self checkToResetAnalyticsNotificationsForSPL:leqBuffer85Threshold withDuration:1 andBuffer:v15 forTime:v16 andThreshold:v17];
    }
    else
    {
      LODWORD(v17) = 1211090944;
      *(float *)&double v15 = a3;
      *(float *)&double v16 = a4;
      [(HUNoiseController *)self checkToSurfaceAnalyticsNotificationForSPL:leqBuffer85Threshold withDuration:1 andBuffer:v15 forTime:v16 andThreshold:v17];
    }
    BOOL v19 = [(HUNoiseController *)self isNotified90];
    leqBuffer90Threshold = self->_leqBuffer90Threshold;
    if (v19)
    {
      LODWORD(v22) = 1230748160;
      *(float *)&double v20 = a3;
      *(float *)&double v21 = a4;
      [(HUNoiseController *)self checkToResetAnalyticsNotificationsForSPL:leqBuffer90Threshold withDuration:2 andBuffer:v20 forTime:v21 andThreshold:v22];
    }
    else
    {
      LODWORD(v22) = 1211090944;
      *(float *)&double v20 = a3;
      *(float *)&double v21 = a4;
      [(HUNoiseController *)self checkToSurfaceAnalyticsNotificationForSPL:leqBuffer90Threshold withDuration:2 andBuffer:v20 forTime:v21 andThreshold:v22];
    }
  }
}

- (void)checkToResetAnalyticsNotificationsForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = [HUNoiseSample alloc];
  BOOL v14 = [MEMORY[0x263EFF910] date];
  *(float *)&double v15 = a3;
  *(float *)&double v16 = a4;
  double v17 = [(HUNoiseSample *)v13 initWithSampleDate:v14 splValue:v15 andDuration:v16];

  [v12 addObject:v17];
  *(float *)&double v18 = a6;
  [(HUNoiseController *)self maintainCircularBuffer:v12 forTime:v18];
  if ([v12 count])
  {
    BOOL v19 = [v12 firstObject];
    double v20 = [v19 sampleDate];

    double v21 = [v12 lastObject];
    id v22 = [v21 sampleDate];

    float v23 = [v12 lastObject];
    [v23 sampleDuration];
    float v25 = v24;

    [v22 timeIntervalSinceDate:v20];
    double v27 = v26;
    if ((unint64_t)a7 > 2)
    {
      unsigned int v31 = 0;
      float v28 = 0.0;
    }
    else
    {
      float v28 = flt_20CD0F710[a7];
      float v29 = [MEMORY[0x263EFF910] date];
      [v29 timeIntervalSinceDate:(&self->_timeNotified80)[a7]];
      unsigned int v31 = (v30 * 1000.0);
    }
    *(float *)&double v26 = (float)v31;
    if ((float)v31 >= a6)
    {
      float v34 = v25 + v27 * 1000.0;
      double v26 = v34;
      if ((float)(a6 * 90.0) / 100.0 <= v26)
      {
        [(HUNoiseController *)self calculateLeqForBuffer:v12];
        if (*(float *)&v26 < v28)
        {
          float v35 = *(float *)&v26;
          switch(a7)
          {
            case 2:
              [(HUNoiseController *)self setNotified90:0];
              break;
            case 1:
              [(HUNoiseController *)self setNotified85:0];
              break;
            case 0:
              [(HUNoiseController *)self setNotified80:0];
              break;
          }
          HCHPInitializeLogging();
          float v33 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics]: Resetting notifications for Leq %0.1f dB being under %i dB threshold for minimum reset time", v35, (int)v28);
          id v36 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 986, v33];
          double v37 = (void *)*MEMORY[0x263F47298];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
LABEL_26:
          id v36 = v36;
          double v38 = v37;
          *(_DWORD *)long long buf = 136446210;
          uint64_t v40 = [v36 UTF8String];
          _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

LABEL_27:
          goto LABEL_28;
        }
      }
    }
    if (v31 >= 0x1B7740)
    {
      switch(a7)
      {
        case 2:
          -[HUNoiseController setNotified90:](self, "setNotified90:", 0, v26);
          break;
        case 1:
          -[HUNoiseController setNotified85:](self, "setNotified85:", 0, v26);
          break;
        case 0:
          -[HUNoiseController setNotified80:](self, "setNotified80:", 0, v26);
          break;
      }
      HCHPInitializeLogging();
      float v33 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Resetting notifications since it has been more than general reset time for %i dB threshold", (int)v28);
      id v36 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1011, v33];
      double v37 = (void *)*MEMORY[0x263F47298];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else
  {
    HCHPInitializeLogging();
    double v20 = [NSString stringWithFormat:@"[Analytics]: Failed while checking to reset notifications because buffer is empty."];
    id v22 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToResetAnalyticsNotificationsForSPL:withDuration:andBuffer:forTime:andThreshold:]", 931, v20];
    uint64_t v32 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v22;
      float v33 = v32;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v40 = [v22 UTF8String];
      _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_28:
    }
  }
}

- (void)checkToSurfaceAnalyticsNotificationForSPL:(float)a3 withDuration:(float)a4 andBuffer:(id)a5 forTime:(float)a6 andThreshold:(int64_t)a7
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = [MEMORY[0x263F53C50] sharedConnection];
  int v14 = [v13 isHealthDataSubmissionAllowed];

  if (v14)
  {
    double v15 = [HUNoiseSample alloc];
    double v16 = [MEMORY[0x263EFF910] date];
    *(float *)&double v17 = a3;
    *(float *)&double v18 = a4;
    uint64_t v19 = [(HUNoiseSample *)v15 initWithSampleDate:v16 splValue:v17 andDuration:v18];

    v80 = (void *)v19;
    [v12 addObject:v19];
    *(float *)&double v20 = a6;
    [(HUNoiseController *)self maintainCircularBuffer:v12 forTime:v20];
    if (![v12 count])
    {
      HCHPInitializeLogging();
      id v22 = [NSString stringWithFormat:@"[Analytics] Failed while checking to surface notification because buffer is empty."];
      id v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1029, v22];
      v72 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v24;
        objc_super v73 = v72;
        LODWORD(buf) = 136446210;
        *(void *)((char *)&buf + 4) = [v24 UTF8String];
        _os_log_impl(&dword_20CC86000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_40;
    }
    double v21 = [v12 firstObject];
    id v22 = [v21 sampleDate];

    float v23 = [v12 lastObject];
    id v24 = [v23 sampleDate];

    float v25 = [v12 lastObject];
    [v25 sampleDuration];
    float v27 = v26;

    [v24 timeIntervalSinceDate:v22];
    float v29 = 0.0;
    if ((unint64_t)a7 <= 2) {
      float v29 = flt_20CD0F710[a7];
    }
    if (v29 > a3
      || ((float v30 = v27 + v28 * 1000.0, v30 > 15000.0) ? (v31 = (float)(a6 * 90.0) / 100.0 > v30) : (v31 = 1), v31))
    {
LABEL_40:

      goto LABEL_41;
    }
    HCHPInitializeLogging();
    uint64_t v79 = (int)v29;
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Sample is above threshold of %i dB and buffered more than %i ms", v79, (int)a6);
    float v33 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1062, v32];
    float v34 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v33;
      id v36 = v34;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v35 UTF8String];
      _os_log_impl(&dword_20CC86000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    double v37 = [v24 dateByAddingTimeInterval:-15.0];
    HCHPInitializeLogging();
    double v38 = [NSString stringWithFormat:@"[Analytics] Leq buffer gating date for %i dB threshold: %@", v79, v37];
    id v39 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1065, v38];
    uint64_t v40 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v41 = v39;
      v42 = v40;
      uint64_t v43 = [v41 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_20CC86000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke;
    v83[3] = &unk_2640FF028;
    id v78 = v37;
    id v84 = v78;
    id v45 = v44;
    id v85 = v45;
    float v86 = v29;
    [v12 enumerateObjectsUsingBlock:v83];
    if (![v45 count])
    {
LABEL_39:

      goto LABEL_40;
    }
    HCHPInitializeLogging();
    uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Total count of samples beyond gate date for %i dB threshold: %i", v79, objc_msgSend(v45, "count"));
    v47 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1080, v46];
    v48 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v49 = v47;
      uint64_t v50 = v48;
      uint64_t v51 = [v49 UTF8String];
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_20CC86000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v90 = 0x2020000000;
    int v91 = 0;
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_518;
    v81[3] = &unk_2640FF050;
    float v82 = v29;
    v81[4] = &buf;
    [v45 enumerateObjectsUsingBlock:v81];
    HCHPInitializeLogging();
    v52 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Count of samples beyond gate date and above %i dB threshold: %i", v79, *(unsigned int *)(*((void *)&buf + 1) + 24));
    v53 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1091, v52];
    id v54 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = [v53 UTF8String];
      *(_DWORD *)int v87 = 136446210;
      uint64_t v88 = v55;
      _os_log_impl(&dword_20CC86000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    unsigned int v56 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    float v57 = (float)((float)v56 / (float)(unint64_t)[v45 count]) * 100.0;
    if (v57 < 50.0) {
      goto LABEL_38;
    }
    HCHPInitializeLogging();
    v58 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Checking to surface notification: %i percent of last %i seconds of samples are above %i dB set threshold - calculating leq", (int)v57, 15, v79);
    v59 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1096, v58];
    uint64_t v60 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v61 = [v59 UTF8String];
      *(_DWORD *)int v87 = 136446210;
      uint64_t v88 = v61;
      _os_log_impl(&dword_20CC86000, v60, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    [(HUNoiseController *)self calculateLeqForBuffer:v12];
    float v63 = v62;
    if (v62 < v29)
    {
LABEL_38:
      _Block_object_dispose(&buf, 8);
      goto LABEL_39;
    }
    HCHPInitializeLogging();
    double v64 = v63;
    float v65 = [NSString stringWithFormat:@"[Analytics] Leq over last 3 minutes is %0.0f dB, which is over set threshold of %i dB.", *(void *)&v64, v79];
    uint64_t v66 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1102, v65];
    v67 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v68 = [v66 UTF8String];
      *(_DWORD *)int v87 = 136446210;
      uint64_t v88 = v68;
      _os_log_impl(&dword_20CC86000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    uint64_t v69 = [MEMORY[0x263F53C50] sharedConnection];
    int v70 = [v69 isHealthDataSubmissionAllowed];

    if (v70)
    {
      switch(a7)
      {
        case 2:
          [(HUNoiseController *)self setNotified90:1];
          BOOL v71 = [MEMORY[0x263EFF910] date];
          [(HUNoiseController *)self setTimeNotified90:v71];
          goto LABEL_34;
        case 1:
          [(HUNoiseController *)self setNotified85:1];
          BOOL v71 = [MEMORY[0x263EFF910] date];
          [(HUNoiseController *)self setTimeNotified85:v71];
          goto LABEL_34;
        case 0:
          [(HUNoiseController *)self setNotified80:1];
          BOOL v71 = [MEMORY[0x263EFF910] date];
          [(HUNoiseController *)self setTimeNotified80:v71];
LABEL_34:

          AnalyticsSendEventLazy();
          break;
      }
    }
    HCHPInitializeLogging();
    uint64_t v74 = objc_msgSend(NSString, "stringWithFormat:", @"[Analytics] Analytics notification surfaced for Leq %0.1f dB and analytics threshold %i dB", *(void *)&v64, v79);
    v75 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]", 1141, v74];
    uint64_t v76 = (id)*MEMORY[0x263F47298];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v77 = [v75 UTF8String];
      *(_DWORD *)int v87 = 136446210;
      uint64_t v88 = v77;
      _os_log_impl(&dword_20CC86000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", v87, 0xCu);
    }

    goto LABEL_38;
  }
LABEL_41:
}

void __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  float v4 = [v3 sampleDate];
  uint64_t v5 = [v4 compare:*(void *)(a1 + 32)];

  if (v5 != -1)
  {
    [*(id *)(a1 + 40) addObject:v3];
    HCHPInitializeLogging();
    float v6 = NSString;
    uint64_t v7 = (int)*(float *)(a1 + 48);
    [v3 splValue];
    double v9 = v8;
    double v10 = [v3 sampleDate];
    double v11 = [v6 stringWithFormat:@"[Analytics] Sample is beyond gate date for %i dB threshold: %0.1f, %@", v7, *(void *)&v9, v10];

    id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController checkToSurfaceAnalyticsNotificationForSPL:withDuration:andBuffer:forTime:andThreshold:]_block_invoke", 1074, v11];
    id v13 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      double v15 = v13;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v14 UTF8String];
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_518(uint64_t a1, void *a2)
{
  uint64_t result = [a2 splValue];
  if (v4 >= *(float *)(a1 + 40)) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_531()
{
  return &unk_26C1E5CD0;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_539()
{
  return &unk_26C1E5CF8;
}

void *__107__HUNoiseController_checkToSurfaceAnalyticsNotificationForSPL_withDuration_andBuffer_forTime_andThreshold___block_invoke_548()
{
  return &unk_26C1E5D20;
}

- (void)maintainCircularBuffer:(id)a3 forTime:(float)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count])
  {
    float v6 = [v5 lastObject];
    [v6 sampleDuration];
    float v8 = v7;

    double v9 = [v5 lastObject];
    double v10 = [v9 sampleDate];

    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      double v16 = v8;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = [v18 sampleDate];
          [v10 timeIntervalSinceDate:v19];
          *(float *)&double v20 = v16 + v20 * 1000.0;
          if (*(float *)&v20 >= a4) {
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      [v12 removeObjectsInArray:v11];
    }
  }
  else
  {
    HCHPInitializeLogging();
    double v10 = [NSString stringWithFormat:@"Failed to maintain circular buffer because buffer is empty."];
    id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController maintainCircularBuffer:forTime:]", 1154, v10];
    double v21 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v11;
      id v22 = v21;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = [v11 UTF8String];
      _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (float)calculateLeqForBuffer:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      float v8 = 0.0;
      float v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v11 splValue];
          float v13 = v12;
          [v11 sampleDuration];
          float v8 = v8 + v14;
          float v9 = v9 + v14 * __exp10((float)(v13 / 10.0));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }
    else
    {
      float v8 = 0.0;
      float v9 = 0.0;
    }

    float v20 = log10((float)((float)(1.0 / v8) * v9)) * 10.0;
  }
  else
  {
    HCHPInitializeLogging();
    uint64_t v15 = [NSString stringWithFormat:@"Failed to calculate Leq for buffer because buffer is empty."];
    double v16 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController calculateLeqForBuffer:]", 1183, v15];
    uint64_t v17 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v16;
      uint64_t v19 = v17;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v28 = [v18 UTF8String];
      _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    float v20 = 0.0;
  }

  return v20;
}

- (BOOL)isWearingAirpods
{
  [(HUNoiseController *)self _fetchDeviceState];
  return (v2 < 6) & (0x36u >> v2);
}

- (BOOL)shouldShowHearingProtectionSuggestionForAlertType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 == 6)
  {
    HCHPInitializeLogging();
    id v3 = [NSString stringWithFormat:@"Not showing hearing protection suggestion for > 110dB"];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController shouldShowHearingProtectionSuggestionForAlertType:]", 1235, v3];
    uint64_t v5 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      uint64_t v7 = v5;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  float v8 = +[HUAccessoryManager sharedInstance];
  float v9 = [v8 sharedQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HUNoiseController_shouldShowHearingProtectionSuggestionForAlertType___block_invoke;
  block[3] = &unk_2640FC9B0;
  void block[4] = &buf;
  dispatch_sync(v9, block);

  HCHPInitializeLogging();
  double v10 = objc_msgSend(NSString, "stringWithFormat:", @"Is showing hearing protection suggestion %d", *(unsigned __int8 *)(*((void *)&buf + 1) + 24));
  id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController shouldShowHearingProtectionSuggestionForAlertType:]", 1249, v10];
  float v12 = (id)*MEMORY[0x263F47298];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 UTF8String];
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v18 = v13;
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", v17, 0xCu);
  }

  BOOL v14 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  return v14;
}

void __71__HUNoiseController_shouldShowHearingProtectionSuggestionForAlertType___block_invoke(uint64_t a1)
{
  id v2 = +[HUAccessoryHearingSyncManager sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 hasPairedDeviceWithHearingProtectionEnabled];
}

- (void)writeNotificationSampleToHKWithSPL:(float)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id HKQuantityClass = getHKQuantityClass();
  id v11 = [getHKUnitClass() decibelAWeightedSoundPressureLevelUnit];
  double v12 = a3;
  v47 = [HKQuantityClass quantityWithUnit:v11 doubleValue:v12];

  id v13 = getHKQuantityClass();
  BOOL v14 = [getHKUnitClass() decibelAWeightedSoundPressureLevelUnit];
  uint64_t v15 = +[HUNoiseSettings sharedInstance];
  double v16 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14, (double)(unint64_t)objc_msgSend(v15, "notificationThreshold"));

  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v17 = (id *)getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr;
  uint64_t v51 = getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr;
  if (!getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    unsigned int v56 = __getHKMetadataKeyAudioExposureLevelSymbolLoc_block_invoke;
    float v57 = &unk_2640FC9B0;
    v58 = &v48;
    uint64_t v18 = (void *)HealthKitLibrary();
    uint64_t v19 = dlsym(v18, "HKMetadataKeyAudioExposureLevel");
    *(void *)(v58[1] + 24) = v19;
    getHKMetadataKeyAudioExposureLevelSymbolLoc_ptr = *(void *)(v58[1] + 24);
    uint64_t v17 = (id *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v17) {
    goto LABEL_17;
  }
  id v20 = *v17;
  id v52 = v20;
  v54[0] = v47;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v21 = (id *)get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr;
  uint64_t v51 = get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr;
  if (!get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    unsigned int v56 = __get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_block_invoke;
    float v57 = &unk_2640FC9B0;
    v58 = &v48;
    uint64_t v22 = (void *)HealthKitLibrary();
    long long v23 = dlsym(v22, "_HKPrivateMetadataKeyAudioExposureLimit");
    *(void *)(v58[1] + 24) = v23;
    get_HKPrivateMetadataKeyAudioExposureLimitSymbolLoc_ptr = *(void *)(v58[1] + 24);
    char v21 = (id *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v21) {
    goto LABEL_17;
  }
  id v53 = *v21;
  v54[1] = v16;
  long long v24 = NSDictionary;
  id v25 = v53;
  long long v26 = [v24 dictionaryWithObjects:v54 forKeys:&v52 count:2];

  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2050000000;
  float v27 = (void *)getHKCategorySampleClass_softClass;
  uint64_t v51 = getHKCategorySampleClass_softClass;
  if (!getHKCategorySampleClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    unsigned int v56 = __getHKCategorySampleClass_block_invoke;
    float v57 = &unk_2640FC9B0;
    v58 = &v48;
    __getHKCategorySampleClass_block_invoke((uint64_t)&buf);
    float v27 = (void *)v49[3];
  }
  id v28 = v27;
  _Block_object_dispose(&v48, 8);
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2050000000;
  uint64_t v29 = (void *)getHKObjectTypeClass_softClass;
  uint64_t v51 = getHKObjectTypeClass_softClass;
  if (!getHKObjectTypeClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    unsigned int v56 = __getHKObjectTypeClass_block_invoke;
    float v57 = &unk_2640FC9B0;
    v58 = &v48;
    __getHKObjectTypeClass_block_invoke((uint64_t)&buf);
    uint64_t v29 = (void *)v49[3];
  }
  id v30 = v29;
  _Block_object_dispose(&v48, 8);
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  BOOL v31 = (id *)getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr;
  uint64_t v51 = getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr;
  if (!getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    unsigned int v56 = __getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_block_invoke;
    float v57 = &unk_2640FC9B0;
    v58 = &v48;
    uint64_t v32 = (void *)HealthKitLibrary();
    float v33 = dlsym(v32, "HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent");
    *(void *)(v58[1] + 24) = v33;
    getHKCategoryTypeIdentifierEnvironmentalAudioExposureEventSymbolLoc_ptr = *(void *)(v58[1] + 24);
    BOOL v31 = (id *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v31)
  {
LABEL_17:
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    __break(1u);
  }
  id v34 = *v31;
  id v35 = [v30 categoryTypeForIdentifier:v34];
  id v36 = [getHKDeviceClass() localDevice];
  double v37 = [v28 categorySampleWithType:v35 value:1 startDate:v8 endDate:v9 device:v36 metadata:v26];
  p_notificationSample = &self->_notificationSample;
  notificationSample = self->_notificationSample;
  self->_notificationSample = v37;

  uint64_t v40 = [(HUNoiseController *)self healthStore];
  [v40 saveObject:*p_notificationSample withCompletion:&__block_literal_global_574];

  HCHPInitializeLogging();
  id v41 = [NSString stringWithFormat:@"Wrote sample to HK for Leq: %0.1f dB, StartDate: %@, EndDate: %@", *(void *)&v12, v8, v9];
  v42 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController writeNotificationSampleToHKWithSPL:startDate:endDate:]", 1277, v41];
  uint64_t v43 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v44 = v42;
    id v45 = v43;
    uint64_t v46 = [v44 UTF8String];
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v46;
    _os_log_impl(&dword_20CC86000, v45, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
}

void __74__HUNoiseController_writeNotificationSampleToHKWithSPL_startDate_endDate___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    id v3 = a3;
    HCHPInitializeLogging();
    id v4 = [NSString stringWithFormat:@"Failed to write sample to HK with error: %@", v3];

    uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController writeNotificationSampleToHKWithSPL:startDate:endDate:]_block_invoke", 1274, v4];
    id v6 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      id v8 = v6;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)writeAttentuationSampleToHealth
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(HUNoiseController *)self attenuationBuffer];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [(HUNoiseController *)self attenuationBuffer];
  [v5 removeAllObjects];

  [(HUNoiseController *)self calculateLeqForBuffer:v4];
  float v7 = v6;
  id v8 = [v4 firstObject];
  id v9 = [v8 sampleDate];

  uint64_t v10 = [v4 lastObject];
  uint64_t v11 = [v10 sampleDate];

  if (v7 < 1.0 || ([v11 timeIntervalSinceDate:v9], v12 <= 0.0))
  {
    HCHPInitializeLogging();
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Skipping HK write %lf", v7);
    id v16 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController writeAttentuationSampleToHealth]", 1304, v15];
    id v25 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v16;
      long long v26 = v25;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v16 UTF8String];
      _os_log_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    id HKQuantityClass = getHKQuantityClass();
    BOOL v14 = [getHKUnitClass() decibelAWeightedSoundPressureLevelUnit];
    uint64_t v15 = [HKQuantityClass quantityWithUnit:v14 doubleValue:v7];

    id v16 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v11];
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2050000000;
    uint64_t v17 = (void *)getHKQuantityDatumClass_softClass;
    uint64_t v30 = getHKQuantityDatumClass_softClass;
    if (!getHKQuantityDatumClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      float v33 = __getHKQuantityDatumClass_block_invoke;
      id v34 = &unk_2640FC9B0;
      id v35 = &v27;
      __getHKQuantityDatumClass_block_invoke((uint64_t)&buf);
      uint64_t v17 = (void *)v28[3];
    }
    uint64_t v18 = v17;
    _Block_object_dispose(&v27, 8);
    id v19 = [v18 alloc];
    id v20 = [MEMORY[0x263F08C38] UUID];
    char v21 = (void *)[v19 initWithIdentifier:v20 dateInterval:v16 quantity:v15 resumeContext:0];

    attenuationDataCollector = self->_attenuationDataCollector;
    BOOL v31 = v21;
    long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    long long v24 = [getHKDeviceClass() localDevice];
    [(HKDataCollector *)attenuationDataCollector insertDatums:v23 device:v24 metadata:0 completion:&__block_literal_global_584];
  }
}

void __52__HUNoiseController_writeAttentuationSampleToHealth__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    id v3 = a3;
    HCHPInitializeLogging();
    id v4 = [NSString stringWithFormat:@"Failed to write sample to HK with error: %@", v3];

    uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController writeAttentuationSampleToHealth]_block_invoke", 1298, v4];
    float v6 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      id v8 = v6;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (id)measurementConfigurationWithDuration:(unsigned int)a3 period:(unsigned int)a4 config:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  v15[5] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFF9A0];
  v14[0] = &unk_26C1E58E8;
  v14[1] = &unk_26C1E5900;
  v15[0] = MEMORY[0x263EFFA80];
  v15[1] = &unk_26C1E6D70;
  v15[2] = &unk_26C1E5930;
  v14[2] = &unk_26C1E5918;
  v14[3] = &unk_26C1E5948;
  id v8 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  v15[3] = v8;
  v14[4] = &unk_26C1E5960;
  id v9 = [NSNumber numberWithUnsignedInt:v6];
  v15[4] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
  uint64_t v11 = [v7 dictionaryWithDictionary:v10];

  if (a5)
  {
    double v12 = [NSNumber numberWithUnsignedLongLong:a5];
    [v11 setObject:v12 forKey:&unk_26C1E5978];
  }

  return v11;
}

- (void)subscribeToSharedNotifications
{
  objc_initWeak(&location, self);
  id v3 = +[HUNoiseSettings sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke;
  v11[3] = &unk_2640FDBA0;
  objc_copyWeak(&v12, &location);
  void v11[4] = self;
  [v3 registerUpdateBlock:v11 forRetrieveSelector:sel_noiseEnabled withListener:self];

  id v4 = [(HUNoiseController *)self dataQueue];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_614;
  id v9 = &unk_2640FDC78;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch("com.apple.coreaudio.envsenseagent", &self->_measurementSuspensionNotifyToken, v4, &v6);

  uint64_t v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6, v7, v8, v9);
  [v5 addObserver:self selector:sel_lowPowerModeChanged_ name:*MEMORY[0x263F08450] object:0];

  [(HUNoiseController *)self lowPowerModeChanged:0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke(uint64_t a1)
{
  id v2 = +[HUNoiseSettings sharedInstance];
  uint64_t v3 = [v2 noiseEnabled];

  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _logNoiseEnabledStateToPowerlog:v3];

  uint64_t v6 = [*(id *)(a1 + 32) dataQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_2;
  v7[3] = &unk_2640FF098;
  char v9 = v3;
  objc_copyWeak(&v8, v4);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  HCHPInitializeLogging();
  if (v2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"Noise measurements enabled."];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController subscribeToSharedNotifications]_block_invoke_2", 1339, v3];
    uint64_t v5 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      uint64_t v7 = v5;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained readEnvironmentalDosimetryLevels];
  }
  else
  {
    char v9 = [NSString stringWithFormat:@"Noise measurements disabled."];
    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1344, v9];
    uint64_t v11 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    BOOL v14 = (id *)(a1 + 32);
    id v15 = objc_loadWeakRetained(v14);
    [v15 writeAttentuationSampleToHealth];

    id v16 = objc_loadWeakRetained(v14);
    uint64_t v17 = [v16 edDataReceiver];
    [v17 stopReceivingAudioSampleType:1702260324];

    id WeakRetained = objc_loadWeakRetained(v14);
    uint64_t v18 = [WeakRetained edDataReceiver];
    [v18 stopMeasuringAudioSampleType:1702260324];
  }
}

void __51__HUNoiseController_subscribeToSharedNotifications__block_invoke_614(uint64_t a1, int token)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t state64 = -1;
  notify_get_state(token, &state64);
  if (state64 == 1835885673)
  {
    HCHPInitializeLogging();
    id v12 = [NSString stringWithFormat:@"Received measurement disabled by EDA."];
    id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1372, v12];
    BOOL v14 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      id v16 = v14;
      uint64_t v17 = [v15 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v25 = v17;
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = WeakRetained;
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if (state64 == 1835885934)
  {
    HCHPInitializeLogging();
    uint64_t v3 = [NSString stringWithFormat:@"Received measurement enabled by EDA."];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1367, v3];
    uint64_t v5 = (void *)*MEMORY[0x263F47298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      uint64_t v7 = v5;
      uint64_t v8 = [v6 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v25 = v8;
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = WeakRetained;
    uint64_t v11 = 1;
LABEL_9:
    [WeakRetained setMeasurementEnabled:v11];
    goto LABEL_13;
  }
  HCHPInitializeLogging();
  id v10 = [NSString stringWithFormat:@"Failed to receive measurement state from EDA."];
  uint64_t v18 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController subscribeToSharedNotifications]_block_invoke", 1377, v10];
  id v19 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v18;
    uint64_t v21 = v19;
    uint64_t v22 = [v20 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v25 = v22;
    _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
LABEL_13:
}

- (void)lowPowerModeChanged:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  HCHPInitializeLogging();
  id v4 = [NSString stringWithFormat:@"Low power changed"];
  uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController lowPowerModeChanged:]", 1391, v4];
  id v6 = (os_log_t *)MEMORY[0x263F47298];
  uint64_t v7 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v5;
    char v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v32 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v10 = [MEMORY[0x263F08AB0] processInfo];
  int v11 = [v10 isLowPowerModeEnabled];

  if (v11)
  {
    [(HUNoiseController *)self sampleDuration];
    if (v12 == 5000.0)
    {
      HCHPInitializeLogging();
      id v13 = [NSString stringWithFormat:@"Low power enabled. Stopping measurements."];
      BOOL v14 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController lowPowerModeChanged:]", 1396, v13];
      os_log_t v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v14;
        uint64_t v17 = v15;
        uint64_t v18 = [v16 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v32 = v18;
        _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(HUNoiseController *)self setMeasurementEnabled:0];
      id v19 = [(HUNoiseController *)self edDataReceiver];
      [v19 stopReceivingAudioSampleType:1702260324];

      id v20 = [(HUNoiseController *)self edDataReceiver];
      [v20 stopMeasuringAudioSampleType:1702260324];
    }
  }
  else
  {
    uint64_t v21 = +[HUNoiseSettings sharedInstance];
    int v22 = [v21 noiseEnabled];

    if (v22)
    {
      HCHPInitializeLogging();
      long long v23 = [NSString stringWithFormat:@"Low power disabled. Resuming measurements."];
      long long v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController lowPowerModeChanged:]", 1414, v23];
      os_log_t v25 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = v24;
        uint64_t v27 = v25;
        uint64_t v28 = [v26 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v32 = v28;
        _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(HUNoiseController *)self setMeasurementEnabled:1];
      [(HUNoiseController *)self readEnvironmentalDosimetryLevels];
    }
  }
  uint64_t v29 = [(HUNoiseController *)self dataQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HUNoiseController_lowPowerModeChanged___block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(v29, block);
}

uint64_t __41__HUNoiseController_lowPowerModeChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendUpdateMessageForCurrentValues];
}

- (id)registerForEnvironmentalDosimetryUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [v4 client];

  [v8 setWantsUpdates:v7 forIdentifier:0x40000];
  [(HUNoiseController *)self readEnvironmentalDosimetryLevels];
  return 0;
}

- (void)logThresholdTransitionForSample:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[HUNoiseSettings sharedInstance];
  unint64_t v6 = [v5 notificationThreshold];

  uint64_t v7 = [(HUNoiseController *)self leqBuffer];
  id v8 = [v7 lastObject];

  [v4 splValue];
  float v9 = (float)v6;
  if (v10 >= (float)v6)
  {
    if (!v8 || ([v8 splValue], v17 < v9))
    {
      HCHPInitializeLogging();
      uint64_t v18 = NSString;
      id v19 = [v4 detailedDescription];
      BOOL v14 = [v18 stringWithFormat:@"[Notifications] Sample rises above threshold: %@", v19];

      id v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController logThresholdTransitionForSample:]", 1718, v14];
      id v16 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        id v15 = v15;
        id v20 = v16;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v22 = [v15 UTF8String];
        _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
LABEL_9:
    }
  }
  else
  {
    [v8 splValue];
    if (v11 >= v9)
    {
      HCHPInitializeLogging();
      float v12 = NSString;
      id v13 = [v4 detailedDescription];
      BOOL v14 = [v12 stringWithFormat:@"[Notifications] Sample falls below threshold: %@", v13];

      id v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController logThresholdTransitionForSample:]", 1723, v14];
      id v16 = (void *)*MEMORY[0x263F47298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      goto LABEL_9;
    }
  }
}

- (void)logNoiseBuffer:(id)a3 calculatedLeq:(float)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = +[HUNoiseSettings sharedInstance];
  unint64_t v7 = [v6 notificationThreshold];

  HCHPInitializeLogging();
  id v8 = NSString;
  float v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  *(float *)&double v10 = a4;
  float v11 = [NSNumber numberWithFloat:v10];
  float v12 = [v8 stringWithFormat:@"[Notifications] Surfacing notification with buffer count: %@, calculated Leq: %@", v9, v11];

  id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController logNoiseBuffer:calculatedLeq:]", 1730, v12];
  BOOL v14 = (void *)*MEMORY[0x263F47298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    id v16 = v14;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v41 = [v15 UTF8String];
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    float v20 = (float)v7;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v22 splValue];
        float v24 = v23;
        HCHPInitializeLogging();
        os_log_t v25 = NSString;
        if (v24 < v20) {
          id v26 = @" ";
        }
        else {
          id v26 = @"+";
        }
        uint64_t v27 = [v22 detailedDescription];
        uint64_t v28 = [v25 stringWithFormat:@"[Notifications] %@ %@", v26, v27];

        uint64_t v29 = [NSString stringWithFormat:@"%s:%d %@", "-[HUNoiseController logNoiseBuffer:calculatedLeq:]", 1734, v28];
        uint64_t v30 = (void *)*MEMORY[0x263F47298];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47298], OS_LOG_TYPE_DEFAULT))
        {
          id v31 = v29;
          uint64_t v32 = v30;
          uint64_t v33 = [v31 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v41 = v33;
          _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }
}

- (AXDispatchTimer)edDummyDataTimer
{
  return self->_edDummyDataTimer;
}

- (void)setEdDummyDataTimer:(id)a3
{
}

- (AXDispatchTimer)adamSuspendedTimer
{
  return self->_adamSuspendedTimer;
}

- (void)setAdamSuspendedTimer:(id)a3
{
}

- (NSMutableArray)leqBuffer
{
  return self->_leqBuffer;
}

- (void)setLeqBuffer:(id)a3
{
}

- (NSMutableArray)attenuationBuffer
{
  return self->_attenuationBuffer;
}

- (void)setAttenuationBuffer:(id)a3
{
}

- (float)slowLeq
{
  return self->_slowLeq;
}

- (void)setSlowLeq:(float)a3
{
  self->_slowLeq = a3;
}

- (float)fastLeq
{
  return self->_fastLeq;
}

- (void)setFastLeq:(float)a3
{
  self->_fastLeq = a3;
}

- (BOOL)isMeasurementEnabled
{
  return self->_measurementEnabled;
}

- (void)setMeasurementEnabled:(BOOL)a3
{
  self->_measurementEnabled = a3;
}

- (unint64_t)thresholdLevel
{
  return self->_thresholdLevel;
}

- (void)setThresholdLevel:(unint64_t)a3
{
  self->_thresholdLevel = a3;
}

- (NSDate)timeNotified
{
  return self->_timeNotified;
}

- (void)setTimeNotified:(id)a3
{
}

- (float)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(float)a3
{
  self->_sampleDuration = a3;
}

- (BOOL)isNotified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (NSMutableArray)leqBuffer80Threshold
{
  return self->_leqBuffer80Threshold;
}

- (void)setLeqBuffer80Threshold:(id)a3
{
}

- (NSMutableArray)leqBuffer85Threshold
{
  return self->_leqBuffer85Threshold;
}

- (void)setLeqBuffer85Threshold:(id)a3
{
}

- (NSMutableArray)leqBuffer90Threshold
{
  return self->_leqBuffer90Threshold;
}

- (void)setLeqBuffer90Threshold:(id)a3
{
}

- (BOOL)isNotified80
{
  return self->_notified80;
}

- (void)setNotified80:(BOOL)a3
{
  self->_notified80 = a3;
}

- (BOOL)isNotified85
{
  return self->_notified85;
}

- (void)setNotified85:(BOOL)a3
{
  self->_notified85 = a3;
}

- (BOOL)isNotified90
{
  return self->_notified90;
}

- (void)setNotified90:(BOOL)a3
{
  self->_notified90 = a3;
}

- (NSDate)timeNotified80
{
  return self->_timeNotified80;
}

- (void)setTimeNotified80:(id)a3
{
}

- (NSDate)timeNotified85
{
  return self->_timeNotified85;
}

- (void)setTimeNotified85:(id)a3
{
}

- (NSDate)timeNotified90
{
  return self->_timeNotified90;
}

- (void)setTimeNotified90:(id)a3
{
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
}

- (ADAMAudioDataReceiver)edDataReceiver
{
  return self->_edDataReceiver;
}

- (void)setEdDataReceiver:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKCategorySample)notificationSample
{
  return self->_notificationSample;
}

- (void)setNotificationSample:(id)a3
{
}

- (HKDataCollector)attenuationDataCollector
{
  return self->_attenuationDataCollector;
}

- (void)setAttenuationDataCollector:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_attenuationDataCollector, 0);
  objc_storeStrong((id *)&self->_notificationSample, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_edDataReceiver, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_timeNotified90, 0);
  objc_storeStrong((id *)&self->_timeNotified85, 0);
  objc_storeStrong((id *)&self->_timeNotified80, 0);
  objc_storeStrong((id *)&self->_leqBuffer90Threshold, 0);
  objc_storeStrong((id *)&self->_leqBuffer85Threshold, 0);
  objc_storeStrong((id *)&self->_leqBuffer80Threshold, 0);
  objc_storeStrong((id *)&self->_timeNotified, 0);
  objc_storeStrong((id *)&self->_attenuationBuffer, 0);
  objc_storeStrong((id *)&self->_leqBuffer, 0);
  objc_storeStrong((id *)&self->_adamSuspendedTimer, 0);

  objc_storeStrong((id *)&self->_edDummyDataTimer, 0);
}

@end