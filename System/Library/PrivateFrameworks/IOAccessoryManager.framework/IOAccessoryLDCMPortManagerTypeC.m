@interface IOAccessoryLDCMPortManagerTypeC
- ($01BB1521EC52D44A8E7628F5261DCEC8)wetMeasurementInfo;
- (BOOL)_checkIsReceptacleEmpty;
- (BOOL)_holdPowerAssertionTypeC:(BOOL)a3;
- (BOOL)_recordLDCMError:(int)a3;
- (BOOL)_setInitialUserNotificationTimestamp;
- (BOOL)_setMitigations:(BOOL)a3;
- (BOOL)_throttleUserNotification;
- (BOOL)didReportDisabledAnalytic;
- (BOOL)enableMitigationsBootArgSet;
- (BOOL)fakeWetMeasurements;
- (BOOL)followupAlertShown;
- (BOOL)initialAlertShown;
- (BOOL)isInternalBuild;
- (BOOL)isMeasurementActive;
- (BOOL)isPowerAssertionHeld;
- (BOOL)isReceptacleEmpty;
- (BOOL)isWet;
- (BOOL)measureSBU;
- (BOOL)measurementsEnabled;
- (BOOL)mitigationsEnabled;
- (BOOL)mitigationsOverrideEnabled;
- (BOOL)newAccArrived;
- (BOOL)refMeasurementFailed;
- (BOOL)sbuBootArgSet;
- (BOOL)selfTestFailed;
- (BOOL)skipTTRBootArgSet;
- (BOOL)userNotified;
- (BOOL)wetTooLongRecorded;
- (HalogenTypeC)typeC;
- (IOAccessoryLDCMPortManagerTypeC)initWithParams:(unint64_t)a3 dryPollingIntervalNs:(unint64_t)a4;
- (NSCondition)condition;
- (NSLock)defaultsRWLock;
- (NSMutableDictionary)ldcmErrorCountDict;
- (OS_dispatch_queue)halogenTypeCDispatchQueue;
- (OS_dispatch_queue)halogenTypeCUserPromptDispatchQueue;
- (OS_dispatch_source)timer;
- (OS_dispatch_source)timerPortStateCheck;
- (OS_dispatch_source)timerReferenceMeasurement;
- (OS_dispatch_source)timerSelfTest;
- (__CFUserNotification)notification;
- (id)_fetchFilesToUpload:(id)a3;
- (int)_halogenErrorToAnalyticError:(unsigned __int8)a3;
- (int)_measurementErrorToAnalyticError:(unsigned __int8)a3;
- (int)analyticsDebugEvent;
- (int)lastMeasurementResult;
- (int)lastMeasurementStatus;
- (mach_timebase_info)timeBase;
- (unint64_t)dryPollingIntervalNs;
- (unint64_t)lastUserNotificationTimeNS;
- (unint64_t)wetPollingIntervalNs;
- (unsigned)drySinceWetCount;
- (unsigned)referenceMeasurementFailureCount;
- (unsigned)referenceMeasurementPassCount;
- (unsigned)selfTestFailureCount;
- (unsigned)selfTestPassCount;
- (unsigned)sleepAssertionID;
- (void)FBSOpenApplicationOptionKeyPromptUnlockDevice;
- (void)_checkPortState;
- (void)_controlLDCMMeasurements;
- (void)_dismissWetPrompt;
- (void)_fileRadarHalogenTypeC:(id)a3 TTRCategory:(int)a4;
- (void)_generateAlternateMeasurementAnalytics:(BOOL)a3 measurementInfo:(id *)a4 intervalSinceLastPass:(double)a5;
- (void)_generateAnalytics:(BOOL)a3 dryToWetTransition:(BOOL)a4 measurementInfo:(id *)a5;
- (void)_generateFailureAnalytics:(int)a3 recordLDCMDisabled:(BOOL)a4 analyticsError:(int)a5;
- (void)_generateLDCMCSVData;
- (void)_loadFrontBoard;
- (void)_manageLDCMSettings;
- (void)_processLDCMAnalyticsDefauts;
- (void)_processLDCMDefauts:(BOOL)a3;
- (void)_processMitigationsOverride;
- (void)_readLDCMBootArgs;
- (void)_registerForLDCMNotifications;
- (void)_resetLDCMErrorDict;
- (void)_showMitigationAlert;
- (void)_showWetPrompt;
- (void)_writeAndNotifyDefaults:(id)a3 value:(id)a4 domain:(id)a5 notify:(BOOL)a6 notification:(id)a7;
- (void)dealloc;
- (void)handleAttachEvent;
- (void)handleDetachEvent;
- (void)performTypeCMeasurement;
- (void)performTypeCReferenceMeasurement;
- (void)performTypeCSelfTest;
- (void)setAnalyticsDebugEvent:(int)a3;
- (void)setCondition:(id)a3;
- (void)setDefaultsRWLock:(id)a3;
- (void)setDidReportDisabledAnalytic:(BOOL)a3;
- (void)setDryPollingIntervalNs:(unint64_t)a3;
- (void)setDrySinceWetCount:(unsigned int)a3;
- (void)setEnableMitigationsBootArgSet:(BOOL)a3;
- (void)setFBSOpenApplicationOptionKeyPromptUnlockDevice:(void *)a3;
- (void)setFakeWetMeasurements:(BOOL)a3;
- (void)setFollowupAlertShown:(BOOL)a3;
- (void)setHalogenTypeCDispatchQueue:(id)a3;
- (void)setHalogenTypeCUserPromptDispatchQueue:(id)a3;
- (void)setInitialAlertShown:(BOOL)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setIsMeasurementActive:(BOOL)a3;
- (void)setIsPowerAssertionHeld:(BOOL)a3;
- (void)setIsReceptacleEmpty:(BOOL)a3;
- (void)setIsWet:(BOOL)a3;
- (void)setLastMeasurementResult:(int)a3;
- (void)setLastMeasurementStatus:(int)a3;
- (void)setLastUserNotificationTimeNS:(unint64_t)a3;
- (void)setLdcmErrorCountDict:(id)a3;
- (void)setMeasureSBU:(BOOL)a3;
- (void)setMeasurementsEnabled:(BOOL)a3;
- (void)setMitigationsEnabled:(BOOL)a3;
- (void)setMitigationsOverrideEnabled:(BOOL)a3;
- (void)setNewAccArrived:(BOOL)a3;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setRefMeasurementFailed:(BOOL)a3;
- (void)setReferenceMeasurementFailureCount:(unsigned int)a3;
- (void)setReferenceMeasurementPassCount:(unsigned int)a3;
- (void)setSbuBootArgSet:(BOOL)a3;
- (void)setSelfTestFailed:(BOOL)a3;
- (void)setSelfTestFailureCount:(unsigned int)a3;
- (void)setSelfTestPassCount:(unsigned int)a3;
- (void)setSkipTTRBootArgSet:(BOOL)a3;
- (void)setSleepAssertionID:(unsigned int)a3;
- (void)setTimeBase:(mach_timebase_info)a3;
- (void)setTimer:(id)a3;
- (void)setTimerPortStateCheck:(id)a3;
- (void)setTimerReferenceMeasurement:(id)a3;
- (void)setTimerSelfTest:(id)a3;
- (void)setTypeC:(id)a3;
- (void)setUserNotified:(BOOL)a3;
- (void)setWetMeasurementInfo:(id)a3;
- (void)setWetPollingIntervalNs:(unint64_t)a3;
- (void)setWetTooLongRecorded:(BOOL)a3;
@end

@implementation IOAccessoryLDCMPortManagerTypeC

- (IOAccessoryLDCMPortManagerTypeC)initWithParams:(unint64_t)a3 dryPollingIntervalNs:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)IOAccessoryLDCMPortManagerTypeC;
  v6 = [(IOAccessoryLDCMPortManagerTypeC *)&v35 init];
  v7 = v6;
  if (!v6) {
    return (IOAccessoryLDCMPortManagerTypeC *)v7;
  }
  *((void *)v6 + 12) = 1000000000 * a3;
  *((void *)v6 + 13) = 1000000000 * a4;
  *((_WORD *)v6 + 5) = 0;
  *((_WORD *)v6 + 7) = 0;
  v6[16] = 0;
  *((_DWORD *)v6 + 8) = 4;
  *(_WORD *)(v6 + 21) = 0;
  *((_DWORD *)v6 + 15) = 0;
  *((_DWORD *)v6 + 16) = 0;
  *(void *)(v6 + 44) = 0;
  *(void *)(v6 + 36) = 0;
  [v6 _controlLDCMMeasurements];
  *(_WORD *)(v7 + 17) = 0;
  *(_WORD *)(v7 + 23) = 0;
  v7[25] = 0;
  v8 = (const void *)MGCopyAnswer();
  if (v8)
  {
    v9 = v8;
    v7[11] = CFEqual(v8, @"Internal") != 0;
    CFRelease(v9);
  }
  else
  {
    v7[11] = 0;
  }
  *((void *)v7 + 9) = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  *((void *)v7 + 20) = v10;
  if (!v10) {
    return 0;
  }
  [v7 _registerForLDCMNotifications];
  dispatch_queue_t v11 = dispatch_queue_create("HalogenTypeCDispatchQueue", 0);
  *((void *)v7 + 10) = v11;
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v29 = MEMORY[0x1E4F14500];
    v30 = "%s Failed to create HalogenTypeCDispatchQueue\n";
LABEL_38:
    _os_log_impl(&dword_1D9622000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_39;
  }
  dispatch_queue_t v12 = dispatch_queue_create("HalogenTypeCUserPromptDispatchQueue", 0);
  *((void *)v7 + 24) = v12;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v29 = MEMORY[0x1E4F14500];
    v30 = "%s Failed to create HalogenTypeCUserPromptDispatchQueue\n";
    goto LABEL_38;
  }
  v13 = [[HalogenTypeC alloc] initWithParams:2182 onPort:1];
  *((void *)v7 + 9) = v13;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return (IOAccessoryLDCMPortManagerTypeC *)v7;
    }
    *(_WORD *)buf = 0;
    v25 = MEMORY[0x1E4F14500];
    v26 = "Failed to instantiate HalogenTypeC. Exiting... \n";
    uint32_t v27 = 2;
    goto LABEL_20;
  }
  v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((void *)v7 + 11) = v14;
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v29 = MEMORY[0x1E4F14500];
    v30 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke;
  handler[3] = &unk_1E6B6D5A0;
  handler[4] = v7;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_source_set_timer(*((dispatch_source_t *)v7 + 11), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 11));
  v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((void *)v7 + 17) = v15;
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v29 = MEMORY[0x1E4F14500];
    v30 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_8;
  v33[3] = &unk_1E6B6D5A0;
  v33[4] = v7;
  dispatch_source_set_event_handler(v15, v33);
  v16 = *((void *)v7 + 17);
  uint32_t v17 = arc4random_uniform(0xFu);
  dispatch_time_t v18 = dispatch_walltime(0, 1000000000 * (v17 + 1));
  dispatch_source_set_timer(v16, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 17));
  v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((void *)v7 + 18) = v19;
  if (!v19)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v29 = MEMORY[0x1E4F14500];
    v30 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_9;
  v32[3] = &unk_1E6B6D5A0;
  v32[4] = v7;
  dispatch_source_set_event_handler(v19, v32);
  dispatch_source_set_timer(*((dispatch_source_t *)v7 + 18), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 18));
  if ([*((id *)v7 + 9) isHWSelfTestCapable])
  {
    v20 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v7 + 10));
    *((void *)v7 + 16) = v20;
    if (!v20)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
        v29 = MEMORY[0x1E4F14500];
        v30 = "%s Failed to create HalogenTypeC Timer\n";
        goto LABEL_38;
      }
      goto LABEL_39;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_10;
    v31[3] = &unk_1E6B6D5A0;
    v31[4] = v7;
    dispatch_source_set_event_handler(v20, v31);
    v21 = *((void *)v7 + 16);
    uint32_t v22 = arc4random_uniform(0xFu);
    dispatch_time_t v23 = dispatch_walltime(0, 1000000000 * (v22 + 1));
    dispatch_source_set_timer(v21, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v7 + 16));
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
  *((void *)v7 + 21) = v24;
  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
      v29 = MEMORY[0x1E4F14500];
      v30 = "%s Failed to create HalogenTypeC NSCondition\n";
      goto LABEL_38;
    }
LABEL_39:

    return 0;
  }
  [v7 _readLDCMBootArgs];
  v7[12] = [v7 _checkIsReceptacleEmpty];
  [v7 _processLDCMDefauts:1];
  [v7 _manageLDCMSettings];
  *((_DWORD *)v7 + 14) = 10;
  [v7 _processLDCMAnalyticsDefauts];
  if (v7[11]) {
    [v7 _writeAndNotifyDefaults:@"MitigationsEnabled" value:@"No" domain:@"com.apple.CoreAccessories.LDCMPreferences" notify:1 notification:@"com.apple.CoreAccessories.MitigationsDidChange"];
  }
  *((void *)v7 + 19) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 _resetLDCMErrorDict];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v25 = MEMORY[0x1E4F14500];
    v26 = "%s IOAccessoryLDCMPortManagerTypeC initialized.\n";
    uint32_t v27 = 12;
LABEL_20:
    _os_log_impl(&dword_1D9622000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
  }
  return (IOAccessoryLDCMPortManagerTypeC *)v7;
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTypeCMeasurement];
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTypeCReferenceMeasurement];
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkPortState];
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTypeCSelfTest];
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_release(timer);
  }
  timerSelfTest = self->_timerSelfTest;
  if (timerSelfTest) {
    dispatch_release(timerSelfTest);
  }
  timerReferenceMeasurement = self->_timerReferenceMeasurement;
  if (timerReferenceMeasurement) {
    dispatch_release(timerReferenceMeasurement);
  }
  timerPortStateCheck = self->_timerPortStateCheck;
  if (timerPortStateCheck) {
    dispatch_release(timerPortStateCheck);
  }
  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  if (halogenTypeCDispatchQueue) {
    dispatch_release(halogenTypeCDispatchQueue);
  }
  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  if (halogenTypeCUserPromptDispatchQueue) {
    dispatch_release(halogenTypeCUserPromptDispatchQueue);
  }
  typeC = self->_typeC;
  if (typeC) {

  }
  ldcmErrorCountDict = self->_ldcmErrorCountDict;
  if (ldcmErrorCountDict) {

  }
  v11.receiver = self;
  v11.super_class = (Class)IOAccessoryLDCMPortManagerTypeC;
  [(IOAccessoryLDCMPortManagerTypeC *)&v11 dealloc];
}

- (void)_loadFrontBoard
{
  if (!self->_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v3) {
      self->_FBSOpenApplicationOptionKeyPromptUnlockDevice = dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    }
  }
}

- (void)_checkPortState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v5 = 136315138;
    v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
    v3 = MEMORY[0x1E4F14500];
    v4 = "%s Receptacle empty, skip checking port state";
    goto LABEL_12;
  }
  if (!self->_isWet)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v5 = 136315138;
    v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
    v3 = MEMORY[0x1E4F14500];
    v4 = "%s Port not wet, skipping alert";
LABEL_12:
    _os_log_impl(&dword_1D9622000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    return;
  }
  if (![(IOAccessoryLDCMPortManagerTypeC *)self _throttleUserNotification])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Port has been wet for a while, reminding user", (uint8_t *)&v5, 0xCu);
    }
    [(IOAccessoryLDCMPortManagerTypeC *)self _showWetPrompt];
    self->_followupAlertShown = 1;
  }
}

- (BOOL)_checkIsReceptacleEmpty
{
  kern_return_t MatchingServices;
  io_object_t v5;
  BOOL v6;
  BOOL v7;
  io_object_t v8;
  io_registry_entry_t v9;
  CFAllocatorRef v10;
  CFNumberRef CFProperty;
  CFNumberRef v12;
  CFBooleanRef v13;
  CFBooleanRef v14;
  int valuePtr;
  io_iterator_t existing;

  existing = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPort");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  int v5 = existing;
  if (MatchingServices) {
    v6 = 1;
  }
  else {
    v6 = existing == 0;
  }
  if (v6)
  {
    uint64_t v7 = 1;
    if (!existing) {
      return !v7;
    }
    goto LABEL_22;
  }
  v8 = IOIteratorNext(existing);
  if (v8)
  {
    v9 = v8;
    id v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      valuePtr = 0;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v9, @"PortType", v10, 0);
      dispatch_queue_t v12 = CFProperty;
      if (CFProperty)
      {
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        if (valuePtr == 2)
        {
          v13 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v9, @"ConnectionActive", v10, 0);
          if (v13)
          {
            v14 = v13;
            uint64_t v7 = CFBooleanGetValue(v13) != 0;
            CFRelease(v14);
          }
          else
          {
            uint64_t v7 = 1;
          }
          IOObjectRelease(v9);
          goto LABEL_20;
        }
      }
      v9 = IOIteratorNext(existing);
    }
    while (v9);
    uint64_t v7 = 1;
    if (!v12) {
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v12);
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_21:
  int v5 = existing;
  if (existing) {
LABEL_22:
  }
    IOObjectRelease(v5);
  return !v7;
}

- (void)_registerForLDCMNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__IOAccessoryLDCMPortManagerTypeC__registerForLDCMNotifications__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  if (_registerForLDCMNotifications_onceToken != -1) {
    dispatch_once(&_registerForLDCMNotifications_onceToken, block);
  }
}

void __64__IOAccessoryLDCMPortManagerTypeC__registerForLDCMNotifications__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, @"com.apple.CoreAccessories.LDCMPreferencesNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFDictionaryRef v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)handleUserRequestedRadarNotification, @"com.apple.CoreAccessories.LDCMFileRadarNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, @"com.apple.CoreAccessories.TestLDCMAnalyticsNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, @"com.apple.CoreAccessories.LDCMMitigationsOverrideNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, @"com.apple.CoreAccessories.LDCMSettingsDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  v8 = *(const void **)(a1 + 32);
  CFNotificationCenterAddObserver(v7, v8, (CFNotificationCallback)handleLDCMNotification, @"com.apple.CoreAccessories.LDCMActiveMeasurementsDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_manageLDCMSettings
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"FakeWetMeasurements", @"com.apple.CoreAccessories.LDCMPreferences", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v3) {
    self->_fakeWetMeasurements = CFBooleanGetValue(v3) != 0;
  }
}

- (void)_processMitigationsOverride
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to override mitigations.", v0, 2u);
}

- (void)_processLDCMDefauts:(BOOL)a3
{
  CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(@"DisablePeriodicMeasurements", @"com.apple.CoreAccessories.LDCMPreferences", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFBooleanRef v6 = v5;
  if (v5 && CFBooleanGetValue(v5))
  {
    dispatch_suspend((dispatch_object_t)[(IOAccessoryLDCMPortManagerTypeC *)self halogenTypeCDispatchQueue]);
LABEL_7:
    CFRelease(v6);
    return;
  }
  if (!a3) {
    dispatch_resume((dispatch_object_t)[(IOAccessoryLDCMPortManagerTypeC *)self halogenTypeCDispatchQueue]);
  }
  if (v6) {
    goto LABEL_7;
  }
}

- (void)_processLDCMAnalyticsDefauts
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableAnalyticsTest", @"com.apple.CoreAccessories.TestLDCMAnalytics", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v4)
  {
    CFBooleanRef v5 = v4;
    if (CFBooleanGetValue(v4)) {
      BOOL isInternalBuild = self->_isInternalBuild;
    }
    else {
      BOOL isInternalBuild = 0;
    }
    DEBUG_ANALYTICS = isInternalBuild;
    CFRelease(v5);
  }
  if (DEBUG_ANALYTICS)
  {
    WET_TOO_LONG_THRESHOLD = 1;
    uint64_t v7 = (void *)CFPreferencesCopyValue(@"AnalyticsTestEvent", @"com.apple.CoreAccessories.TestLDCMAnalytics", @"mobile", v3);
    if (v7)
    {
      v8 = v7;
      self->_analyticsDebugEvent = [v7 intValue];
      CFRelease(v8);
    }
  }
  CFBooleanRef v9 = (const __CFBoolean *)CFPreferencesCopyValue(@"MeasureSBU", @"com.apple.CoreAccessories.TestLDCMAnalytics", @"mobile", v3);
  if (v9)
  {
    CFBooleanRef v10 = v9;
    self->_measureSBU = CFBooleanGetValue(v9) != 0;
    CFRelease(v10);
  }
}

- (void)_writeAndNotifyDefaults:(id)a3 value:(id)a4 domain:(id)a5 notify:(BOOL)a6 notification:(id)a7
{
  BOOL v8 = a6;
  CFPreferencesSetValue((CFStringRef)a3, a4, (CFStringRef)a5, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)a7, self, 0, 1u);
  }
}

- (void)handleAttachEvent
{
  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC_handleAttachEvent__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  dispatch_async(halogenTypeCDispatchQueue, block);
}

uint64_t __52__IOAccessoryLDCMPortManagerTypeC_handleAttachEvent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsReceptacleEmpty:0];
  [*(id *)(a1 + 32) setNewAccArrived:1];
  [*(id *)(a1 + 32) performTypeCMeasurement];
  mach_port_t v2 = *(void **)(a1 + 32);
  return [v2 setNewAccArrived:0];
}

- (void)handleDetachEvent
{
  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC_handleDetachEvent__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  dispatch_async(halogenTypeCDispatchQueue, block);
}

uint64_t __52__IOAccessoryLDCMPortManagerTypeC_handleDetachEvent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialAlertShown:0];
  [*(id *)(a1 + 32) setFollowupAlertShown:0];
  [*(id *)(a1 + 32) setIsReceptacleEmpty:1];
  mach_port_t v2 = *(void **)(a1 + 32);
  return [v2 _dismissWetPrompt];
}

- (void)_showMitigationAlert
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  CFDictionaryRef v4 = (const __CFDictionary *)[v3 initWithObjectsAndKeys:@"Liquid Detected. Turning off Type-C Port. The port will be re-enabled automatically once dry.", *MEMORY[0x1E4F1D990], @"At your own risk, you may override this now or later from Settings > Accessories > Re-Enable Port.", *MEMORY[0x1E4F1D9A8], @"Override", *MEMORY[0x1E4F1D9D0], @"OK", *MEMORY[0x1E4F1D9E0], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F1D9B8], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4FA7328], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4FA7340], 0];
  SInt32 error = 0;
  CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
  CFBooleanRef v5 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v4);
  SInt32 error = CFUserNotificationReceiveResponse(v5, 0.0, &responseFlags);
  if (!error && responseFlags == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CoreAccessories.LDCMMitigationsOverrideNotification", self, 0, 1u);
  }
}

- (BOOL)_holdPowerAssertionTypeC:(BOOL)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  BOOL isPowerAssertionHeld = self->_isPowerAssertionHeld;
  if (isPowerAssertionHeld == a3) {
    return 1;
  }
  BOOL v5 = a3;
  if (self->_isPowerAssertionHeld || !a3)
  {
    if (!self->_isPowerAssertionHeld || a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:](isPowerAssertionHeld);
      }
    }
    else if (IOPMAssertionRelease(self->_sleepAssertionID))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:]();
      }
    }
    else
    {
      self->_BOOL isPowerAssertionHeld = 0;
    }
  }
  else
  {
    v11[0] = @"AssertType";
    v11[1] = @"AssertLevel";
    v12[0] = @"NoIdleSleepAssertion";
    v12[1] = &unk_1F338AD68;
    v11[2] = @"AssertName";
    v11[3] = @"AllowsDeviceRestart";
    uint64_t v8 = *MEMORY[0x1E4F1CFD0];
    v12[2] = @"com.apple.ioaccessorymanager.halogenTypeC";
    v12[3] = v8;
    CFDictionaryRef v9 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
    IOPMAssertionID AssertionID = self->_sleepAssertionID;
    if (IOPMAssertionCreateWithProperties(v9, &AssertionID))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:]();
      }
    }
    else
    {
      self->_sleepIOPMAssertionID AssertionID = AssertionID;
      self->_BOOL isPowerAssertionHeld = 1;
    }
  }
  return self->_isPowerAssertionHeld == v5;
}

- (void)_readLDCMBootArgs
{
}

- (BOOL)_setMitigations:(BOOL)a3
{
  if (!self->_enableMitigationsBootArgSet)
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7) {
      -[IOAccessoryLDCMPortManagerTypeC _setMitigations:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0;
  }
  BOOL v3 = a3;
  if (!a3 && !self->_isWet) {
    [(HalogenTypeC *)self->_typeC setLiquidDetected:0];
  }
  if (![(HalogenTypeC *)self->_typeC setMitigations:v3]) {
    return 0;
  }
  self->_mitigationsEnabled = v3;
  if (v3) {
    BOOL v5 = @"Yes";
  }
  else {
    BOOL v5 = @"No";
  }
  BOOL v6 = 1;
  [(IOAccessoryLDCMPortManagerTypeC *)self _writeAndNotifyDefaults:@"MitigationsEnabled" value:v5 domain:@"com.apple.CoreAccessories.LDCMPreferences" notify:1 notification:@"com.apple.CoreAccessories.MitigationsDidChange"];
  return v6;
}

- (void)_controlLDCMMeasurements
{
}

- (int)_halogenErrorToAnalyticError:(unsigned __int8)a3
{
  if ((a3 - 1) >= 0xA) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int)_measurementErrorToAnalyticError:(unsigned __int8)a3
{
  if (((a3 - 3) & 0xF8) != 0) {
    return 0;
  }
  else {
    return (a3 - 3) + 11;
  }
}

- (void)_resetLDCMErrorDict
{
  self->_didReportDisabledAnalytic = 0;
  uint64_t v3 = 1;
  do
  {
    ldcmErrorCountDict = self->_ldcmErrorCountDict;
    uint64_t v5 = [NSNumber numberWithInt:0];
    -[NSMutableDictionary setObject:forKey:](ldcmErrorCountDict, "setObject:forKey:", v5, [NSNumber numberWithInt:v3]);
    uint64_t v3 = (v3 + 1);
  }
  while (v3 != 19);
}

- (BOOL)_recordLDCMError:(int)a3
{
  if (self->_didReportDisabledAnalytic) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_ldcmErrorCountDict, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:"));
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  -[NSMutableDictionary setObject:forKey:](self->_ldcmErrorCountDict, "setObject:forKey:", v6, [NSNumber numberWithInt:v3]);
  if ([v6 intValue] != 50) {
    return 0;
  }
  ldcmErrorCountDict = self->_ldcmErrorCountDict;
  uint64_t v8 = [NSNumber numberWithInt:0];
  -[NSMutableDictionary setObject:forKey:](ldcmErrorCountDict, "setObject:forKey:", v8, [NSNumber numberWithInt:v3]);
  return 1;
}

- (void)performTypeCSelfTest
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IOAccessoryLDCMPortManagerTypeC *)self typeC];
  [(NSCondition *)self->_condition lock];
  [(IOAccessoryLDCMPortManagerTypeC *)self setIsMeasurementActive:1];
  [(NSCondition *)self->_condition unlock];
  if (!self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    buf[0] = 136315138;
    *(void *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "%s Receptacle not empty, will try again in 10 minutes.\n";
    goto LABEL_13;
  }
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    buf[0] = 136315138;
    *(void *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "%s No valid instance of HalogenTypeC\n";
LABEL_13:
    uint32_t v10 = 12;
    goto LABEL_16;
  }
  if ([(IOAccessoryLDCMPortManagerTypeC *)self _holdPowerAssertionTypeC:1])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Performing SelfTest.\n", (uint8_t *)buf, 0xCu);
    }
    int v4 = [(HalogenTypeC *)v3 doLDCMMeasurement:3 isCalibrationNeeded:0 isReceptacleEmpty:self->_isReceptacleEmpty isReceptacleWet:self->_isWet withWetTransitionThreshold:3.5 withDryTransitionThreshold:1.0];
    if (!v4)
    {
      halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__IOAccessoryLDCMPortManagerTypeC_performTypeCSelfTest__block_invoke;
      block[3] = &unk_1E6B6D5A0;
      block[4] = self;
      dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
      long long v20 = xmmword_1D964D108;
      long long v21 = unk_1D964D118;
      long long v22 = xmmword_1D964D128;
      uint64_t v23 = -1;
      long long v16 = xmmword_1D964D0C8;
      long long v17 = unk_1D964D0D8;
      long long v18 = xmmword_1D964D0E8;
      long long v19 = unk_1D964D0F8;
      long long v12 = xmmword_1D964D088;
      long long v13 = unk_1D964D098;
      long long v14 = xmmword_1D964D0A8;
      long long v15 = unk_1D964D0B8;
      [(HalogenTypeC *)v3 getMeasurementInfo];
      goto LABEL_8;
    }
    int v11 = v4;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    buf[0] = 136315394;
    *(void *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    __int16 v26 = 1024;
    int v27 = v11;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "%s SelfTest failed. halogenStatus: %d\n";
    uint32_t v10 = 18;
LABEL_16:
    _os_log_impl(&dword_1D9622000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)buf, v10);
  }
LABEL_8:
  [(IOAccessoryLDCMPortManagerTypeC *)self _holdPowerAssertionTypeC:0];
  timerSelfTest = self->_timerSelfTest;
  dispatch_time_t v7 = dispatch_walltime(0, 600000000000);
  dispatch_source_set_timer(timerSelfTest, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  [(NSCondition *)self->_condition lock];
  [(IOAccessoryLDCMPortManagerTypeC *)self setIsMeasurementActive:0];
  [(NSCondition *)self->_condition unlock];
}

unsigned char *__55__IOAccessoryLDCMPortManagerTypeC_performTypeCSelfTest__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[11]) {
    return (unsigned char *)[result _generateLDCMCSVData];
  }
  return result;
}

- (void)performTypeCReferenceMeasurement
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(NSCondition *)self->_condition lock];
  [(IOAccessoryLDCMPortManagerTypeC *)self setIsMeasurementActive:1];
  [(NSCondition *)self->_condition unlock];
  if (!self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int buf = 136315138;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    uint64_t v9 = MEMORY[0x1E4F14500];
    uint32_t v10 = "%s Receptacle not empty, will try again in 10 minutes.\n";
    goto LABEL_13;
  }
  uint64_t v3 = [(IOAccessoryLDCMPortManagerTypeC *)self typeC];
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int buf = 136315138;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    uint64_t v9 = MEMORY[0x1E4F14500];
    uint32_t v10 = "%s No valid instance of HalogenTypeC\n";
LABEL_13:
    uint32_t v11 = 12;
    goto LABEL_16;
  }
  int v4 = v3;
  if ([(IOAccessoryLDCMPortManagerTypeC *)self _holdPowerAssertionTypeC:1])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int buf = 136315138;
      buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Performing Reference Measurement.\n", (uint8_t *)&buf, 0xCu);
    }
    int v5 = [(HalogenTypeC *)v4 doLDCMMeasurement:1 isCalibrationNeeded:0 isReceptacleEmpty:self->_isReceptacleEmpty isReceptacleWet:self->_isWet withWetTransitionThreshold:3.5 withDryTransitionThreshold:1.0];
    if (!v5)
    {
      halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__IOAccessoryLDCMPortManagerTypeC_performTypeCReferenceMeasurement__block_invoke;
      block[3] = &unk_1E6B6D5A0;
      block[4] = self;
      dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
      long long v21 = xmmword_1D964D108;
      long long v22 = unk_1D964D118;
      long long v23 = xmmword_1D964D128;
      uint64_t v24 = -1;
      long long v17 = xmmword_1D964D0C8;
      long long v18 = unk_1D964D0D8;
      long long v19 = xmmword_1D964D0E8;
      long long v20 = unk_1D964D0F8;
      long long v13 = xmmword_1D964D088;
      long long v14 = unk_1D964D098;
      long long v15 = xmmword_1D964D0A8;
      long long v16 = unk_1D964D0B8;
      [(HalogenTypeC *)v4 getMeasurementInfo];
      goto LABEL_8;
    }
    int v12 = v5;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int buf = 136315394;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    __int16 v28 = 1024;
    int v29 = v12;
    uint64_t v9 = MEMORY[0x1E4F14500];
    uint32_t v10 = "%s Reference measurement failed. halogenStatus: %d\n";
    uint32_t v11 = 18;
LABEL_16:
    _os_log_impl(&dword_1D9622000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, v11);
  }
LABEL_8:
  [(IOAccessoryLDCMPortManagerTypeC *)self _holdPowerAssertionTypeC:0];
  timerReferenceMeasurement = self->_timerReferenceMeasurement;
  dispatch_time_t v8 = dispatch_walltime(0, 600000000000);
  dispatch_source_set_timer(timerReferenceMeasurement, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  [(NSCondition *)self->_condition lock];
  [(IOAccessoryLDCMPortManagerTypeC *)self setIsMeasurementActive:0];
  [(NSCondition *)self->_condition unlock];
}

unsigned char *__67__IOAccessoryLDCMPortManagerTypeC_performTypeCReferenceMeasurement__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[11]) {
    return (unsigned char *)[result _generateLDCMCSVData];
  }
  return result;
}

- (void)performTypeCMeasurement
{
}

unsigned char *__58__IOAccessoryLDCMPortManagerTypeC_performTypeCMeasurement__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[11]) {
    return (unsigned char *)[result _generateLDCMCSVData];
  }
  return result;
}

uint64_t __58__IOAccessoryLDCMPortManagerTypeC_performTypeCMeasurement__block_invoke_157(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showMitigationAlert];
}

- (void)_generateLDCMCSVData
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [(HalogenTypeC *)self->_typeC getMeasurementOutputString];
  if (!v2 || (uint64_t v3 = v2, ![v2 length]))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)int buf = 0;
    long long v17 = MEMORY[0x1E4F14500];
    long long v18 = "Nothing to write to csv file.\n";
    uint32_t v19 = 2;
    goto LABEL_16;
  }
  uint64_t v22 = 0;
  char v21 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", @"/var/logs/ldcm/", &v21) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", @"/var/logs/ldcm/", 1, 0, &v22);
    uint64_t v4 = v22;
    if (v22)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)int buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IOAccessoryLDCMPortManagerTypeC _generateLDCMCSVData]";
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      long long v17 = MEMORY[0x1E4F14500];
      long long v18 = "%s Error in creating directory. %@\n";
      uint32_t v19 = 22;
LABEL_16:
      _os_log_impl(&dword_1D9622000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
      return;
    }
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@%@.csv", @"/var/logs/ldcm/", @"internalMeasurementData", v5];
  dispatch_time_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", @"/var/logs/ldcm/", 0);
  dispatch_time_t v8 = objc_msgSend(v7, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self BEGINSWITH[cd] 'internalMeasurementData'"));
  if ([v8 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__IOAccessoryLDCMPortManagerTypeC__generateLDCMCSVData__block_invoke;
    v20[3] = &unk_1E6B6D860;
    v20[4] = @"/var/logs/ldcm/";
    uint64_t v9 = (void *)[v8 sortedArrayUsingComparator:v20];
    uint32_t v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint32_t v11 = (void *)[v10 attributesOfItemAtPath:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", @"/var/logs/ldcm/", objc_msgSend(v9, "lastObject")), 0 error];
    int v12 = (void *)[v11 valueForKey:*MEMORY[0x1E4F28390]];
    long long v13 = (void *)[NSNumber numberWithUnsignedLongLong:10485760];
    unint64_t v14 = [v12 unsignedLongLongValue];
    if (v14 <= [v13 unsignedLongLongValue])
    {
      uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@", @"/var/logs/ldcm/", objc_msgSend(v9, "lastObject")];
    }
    else if ((unint64_t)[v8 count] >= 0xA)
    {
      *(void *)int buf = 0;
      uint64_t v15 = [NSString stringWithFormat:@"%@%@", @"/var/logs/ldcm/", objc_msgSend(v9, "firstObject")];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v15, buf);
    }
  }
  long long v16 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v6];
  if (!v16)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
    long long v16 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v6];
  }
  [v16 seekToEndOfFile];
  objc_msgSend(v16, "writeData:error:", objc_msgSend(v3, "dataUsingEncoding:", 4), &v22);
  [v16 closeFile];
}

uint64_t __55__IOAccessoryLDCMPortManagerTypeC__generateLDCMCSVData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v13 = 0;
  id v14 = 0;
  uint64_t v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  dispatch_time_t v7 = (void *)[v6 attributesOfItemAtPath:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", *(void *)(a1 + 32), a2), &v14 error];
  if (v14)
  {
    NSLog(&cfstr_ErrorFetchingF_1.isa, [v14 localizedDescription], a2);
  }
  uint64_t v8 = *MEMORY[0x1E4F282C0];
  uint64_t v9 = (void *)[v7 objectForKey:*MEMORY[0x1E4F282C0]];
  uint32_t v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint32_t v11 = (void *)[v10 attributesOfItemAtPath:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", *(void *)(a1 + 32), a3), &v13 error];
  if (v13)
  {
    NSLog(&cfstr_ErrorFetchingF_2.isa, [v13 localizedDescription], a3);
  }
  return objc_msgSend(v9, "compare:", objc_msgSend(v11, "objectForKey:", v8));
}

- (id)_fetchFilesToUpload:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  uint64_t v5 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self BEGINSWITH[cd] 'internalMeasurementData'"));
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v5];
  if ([v6 count])
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      [v6 replaceObjectAtIndex:v7, objc_msgSend(NSString, "stringWithFormat:", @"%@%@", a3, objc_msgSend(v6, "objectAtIndex:", v7)) withObject];
      uint64_t v7 = v8;
    }
    while ([v6 count] > (unint64_t)v8++);
  }
  return v6;
}

- (void)_fileRadarHalogenTypeC:(id)a3 TTRCategory:(int)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v8 = "Unkown measurement state\n\n";
  if (a4 == 1) {
    unsigned int v8 = "MANUAL RADAR REQUESTED\n\n";
  }
  if (a4) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = "LIQUID DETECTION REPORT (detected via HalogenTypeC)\n\n";
  }
  uint32_t v10 = (void *)[MEMORY[0x1E4F28E78] stringWithUTF8String:v9];
  [v10 appendString:@"Has your iPad or charging cable been near liquid in the past 5 hours? \n\n"];
  [v10 appendString:@"If yes:\n\n"];
  [v10 appendString:@"- Cable or iPad?\n\n"];
  [v10 appendString:@"- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"];
  [v10 appendString:@"- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"];
  [v10 appendString:@"- If the exposure was limited to a certain part of the device, where was it?\n\n"];
  [v10 appendString:@"- How long was the exposure?\n\n"];
  [v10 appendString:@"- Time since exposure\n"];
  [v10 appendString:@"\n\nIf no:\n\n"];
  [v10 appendString:@"Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"];
  [v10 appendString:a3];
  uint32_t v11 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"];
  id v12 = [(IOAccessoryLDCMPortManagerTypeC *)self _fetchFilesToUpload:@"/var/logs/ldcm/"];
  if ([v12 count]) {
    [v11 appendFormat:@"Attachments=%@", objc_msgSend(v12, "componentsJoinedByString:", @","];
  }

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", @"/var/logs/ldcm/halogenTypeC_ttr_temp.wav"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtPath:toPath:error:", @"/var/logs/ldcm/halogenTypeC_ttr_temp.wav", @"/var/logs/ldcm/halogenTypeC_ttr.wav", 0);
    [v11 appendFormat:@",%@", @"/var/logs/ldcm/halogenTypeC_ttr.wav"];
  }
  [v11 appendString:@"&"];
  [v11 appendFormat:@"Description=%@", v10];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLQueryAllowedCharacterSet")));
  [(IOAccessoryLDCMPortManagerTypeC *)self _loadFrontBoard];
  if (self->_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    uint64_t v14 = [[NSString alloc] initWithBytes:self->_FBSOpenApplicationOptionKeyPromptUnlockDevice length:8 encoding:1];
    if (v14)
    {
      id v16 = (id)v14;
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), v14);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "openSensitiveURL:withOptions:", v13, v7);
    }
  }
  else
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F223E0] defaultWorkspace];
    [v15 openURL:v13 configuration:0 completionHandler:&__block_literal_global_1];
  }
}

void __70__IOAccessoryLDCMPortManagerTypeC__fileRadarHalogenTypeC_TTRCategory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[IOAccessoryLDCMPortManagerTypeC _fileRadarHalogenTypeC:TTRCategory:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = a3;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Error while filing radar. %@\n", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)_setInitialUserNotificationTimestamp
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  unint64_t v4 = v3 - 5000000000;
  if (v3 < 0x12A05F200) {
    unint64_t v4 = 0;
  }
  self->_lastUserNotificationTimeNS = v4;
  return 1;
}

- (BOOL)_throttleUserNotification
{
  if (self->_lastUserNotificationTimeNS)
  {
    BOOL result = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - self->_lastUserNotificationTimeNS < 0x12A05F200;
    if (self->_initialAlertShown && self->_followupAlertShown)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v4 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Too many alerts shown, skipping", v4, 2u);
      }
      return 1;
    }
  }
  else
  {
    [(IOAccessoryLDCMPortManagerTypeC *)self _setInitialUserNotificationTimestamp];
    return 0;
  }
  return result;
}

- (void)_showWetPrompt
{
  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__IOAccessoryLDCMPortManagerTypeC__showWetPrompt__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
}

void __49__IOAccessoryLDCMPortManagerTypeC__showWetPrompt__block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (gWetNotificationContext) {
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Showing wet prompt", buf, 2u);
  }
  __int16 v28 = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v2)
  {
    __uint64_t v3 = v2;
    uint64_t v4 = MEMORY[0x1E4F1CC28];
    [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"legacy"];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"typeC"];
    [v3 setObject:v4 forKeyedSubscript:@"chargerConnected"];
    [v3 setObject:v4 forKeyedSubscript:@"reinsertion"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C80]);
    if (v5)
    {
      __int16 v6 = v5;
      [v5 setUserInfo:v3];
      v33[0] = v6;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1), 1, &v28);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 setObject:@"com.apple.IOAccessoryManagerFramework.WetNotification" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
        [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FA7350]];
        uint64_t v10 = MEMORY[0x1E4F1CC38];
        [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
        [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4FA7328]];
        [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
        uint32_t v11 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.IOAccessoryManagerFramework"];
        id v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 pathForResource:@"PlugIns/WetNotification.appex/Assets.car" ofType:&stru_1F3381008];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 136315394;
            uint64_t v30 = "-[IOAccessoryLDCMPortManagerTypeC _showWetPrompt]_block_invoke";
            __int16 v31 = 2112;
            uint64_t v32 = v13;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
          }
          [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FA7390]];
          [v9 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7388]];
          [v9 setObject:@"YES" forKeyedSubscript:*MEMORY[0x1E4FA7380]];
          [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FA7368]];
          [v9 setObject:@"lockScreenLiquidDetection" forKeyedSubscript:*MEMORY[0x1E4FA7360]];
          uint64_t v14 = [v12 resourceURL];
          [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];
          uint64_t v15 = @"WETMSG_DIALOG_HEADER_LOCKSCREEN";
          id v16 = @"WETMSG_DIALOG_BODY_LOCKSCREEN_TYPEC_PASSIVE";
          long long v17 = @"WETMSG_BUTTON_DISMISS";
        }
        else
        {
          uint64_t v15 = @"LIQUID DETECTED";
          id v16 = @"Liquid has been detected in the USB-C connector. Disconnect to allow the connector to dry.";
          long long v17 = @"Dismiss";
        }
        [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FA73A8]];
        [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FA73B8]];
        [v9 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
        uint64_t v18 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v18 + 11) && !*(unsigned char *)(v18 + 25))
        {
          if (v12) {
            uint32_t v19 = @"WETMSG_BUTTON_RADAR";
          }
          else {
            uint32_t v19 = @"Radar";
          }
          [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
        }
        CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        char v21 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, (CFDictionaryRef)v9);
        if (!v21) {
          goto LABEL_22;
        }
        CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v20, v21, (CFUserNotificationCallBack)handleWetPromptResponse, 0);
        if (!RunLoopSource) {
          goto LABEL_22;
        }
        long long v23 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v23, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        uint64_t v25 = *(void *)(a1 + 32);
        gWetNotificationContext = (uint64_t)v21;
        qword_1EA8C4C30 = (uint64_t)v23;
        qword_1EA8C4C38 = v25;
      }
      char v21 = 0;
LABEL_22:

      if (v9) {
      if (v21)
      }
        CFRelease(v21);
      goto LABEL_26;
    }
  }
LABEL_26:
  uint64_t v26 = v28;
  if (v28)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_msgSend((id)objc_msgSend(v26, "localizedDescription"), "UTF8String");
      *(_DWORD *)int buf = 136315394;
      uint64_t v30 = "-[IOAccessoryLDCMPortManagerTypeC _showWetPrompt]_block_invoke";
      __int16 v31 = 2080;
      uint64_t v32 = v27;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
      uint64_t v26 = v28;
    }
  }
}

- (void)_dismissWetPrompt
{
  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC__dismissWetPrompt__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
}

void __52__IOAccessoryLDCMPortManagerTypeC__dismissWetPrompt__block_invoke()
{
  if (gWetNotificationContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Dismissing wet prompt", v0, 2u);
    }
    clearNotificationContext();
  }
}

- (void)_generateAlternateMeasurementAnalytics:(BOOL)a3 measurementInfo:(id *)a4 intervalSinceLastPass:(double)a5
{
  BOOL v7 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isInternalBuild)
  {
    id v8 = (void *)MGGetStringAnswer();
    if (([v8 hasPrefix:@"iPad13,8"] & 1) != 0
      || ([v8 hasPrefix:@"iPad13,9"] & 1) != 0
      || ([v8 hasPrefix:@"iPad13,10"] & 1) != 0
      || ([v8 hasPrefix:@"iPad13,11"] & 1) != 0)
    {
      return;
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = 136315138;
    *(void *)long long v23 = "-[IOAccessoryLDCMPortManagerTypeC _generateAlternateMeasurementAnalytics:measurementInfo:intervalSinceLastPass:]";
    uint32_t v19 = MEMORY[0x1E4F14500];
    CFAllocatorRef v20 = "%s Failed to initialize analytcs event string.\n";
    uint32_t v21 = 12;
LABEL_21:
    _os_log_impl(&dword_1D9622000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, v21);
    return;
  }
  uint64_t v10 = v9;
  [v9 setString:&stru_1F3381008];
  int var0 = a4->var0;
  if (a4->var0 == 2)
  {
    id v12 = @"com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailure";
    uint64_t v13 = @"com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurement";
    uint64_t v14 = @"com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailToPassDuration";
    goto LABEL_11;
  }
  if (var0 != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = 136315394;
    *(void *)long long v23 = "-[IOAccessoryLDCMPortManagerTypeC _generateAlternateMeasurementAnalytics:measurementInfo:intervalSinceLastPass:]";
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)&v23[10] = var0;
    uint32_t v19 = MEMORY[0x1E4F14500];
    CFAllocatorRef v20 = "%s Measurement type is neither SelfTest or Reference. Type:%d\n";
    uint32_t v21 = 18;
    goto LABEL_21;
  }
  id v12 = @"com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailure";
  uint64_t v13 = @"com.apple.ioaccessorymanager.ldcm.usbc.selfTest";
  uint64_t v14 = @"com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailToPassDuration";
LABEL_11:
  if (a5 > 0.0) {
    uint64_t v13 = v14;
  }
  if (v7) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v12;
  }
  [v10 setString:v15];
  if ([v10 length])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a5 <= 0.0)
    {
      objc_msgSend(v16, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a4->var14), @"resistance");
      uint64_t v17 = [NSNumber numberWithDouble:a4->var15];
      uint64_t v18 = @"capacitance";
    }
    else
    {
      uint64_t v17 = [NSNumber numberWithDouble:floor(a5 / 60.0)];
      uint64_t v18 = @"duration";
    }
    [v16 setObject:v17 forKey:v18];
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 67109634;
      *(_DWORD *)long long v23 = 2095;
      *(_WORD *)&v23[4] = 2112;
      *(void *)&v23[6] = v10;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%d Analytics event for %@:%@\n", (uint8_t *)&v22, 0x1Cu);
    }
  }
}

- (void)_generateFailureAnalytics:(int)a3 recordLDCMDisabled:(BOOL)a4 analyticsError:(int)a5
{
  BOOL v6 = a4;
  if (a3 == 1 || a3 == 10 || a3 == 3) {
    AnalyticsSendEvent();
  }
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", a5), @"disable_reason");
    AnalyticsSendEvent();

    self->_didReportDisabledAnalytic = 1;
  }
}

- (void)_generateAnalytics:(BOOL)a3 dryToWetTransition:(BOOL)a4 measurementInfo:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && ![(IOAccessoryLDCMPortManagerTypeC *)self _throttleUserNotification])
  {
    [(IOAccessoryLDCMPortManagerTypeC *)self _showWetPrompt];
    self->_initialAlertShown = 1;
    AnalyticsSendEvent();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  switch(a5->var2)
  {
    case 0:
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [v9 setString:@"NONE"];
      unsigned int drySinceWetCount = self->_drySinceWetCount;
      if (drySinceWetCount == 3)
      {
        [(IOAccessoryLDCMPortManagerTypeC *)self _dismissWetPrompt];
        ++self->_drySinceWetCount;
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_wetMeasurementInfo.intialImpedance), @"initialImpedance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_wetMeasurementInfo.intialResistance), @"initialResistance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_wetMeasurementInfo.intialCapacitance), @"initialCapacitance");
        uint32_t v11 = NSNumber;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v11, "numberWithDouble:", v12 - self->_wetMeasurementInfo.initialWetWallTime), @"wetDuration");
        BOOL isReceptacleEmpty = self->_isReceptacleEmpty;
        uint64_t v14 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransition";
        uint64_t v15 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransitionPortNotEmpty";
      }
      else
      {
        if (drySinceWetCount < 4) {
          goto LABEL_37;
        }
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var14), @"resistance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var22), @"impedance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var15), @"capacitance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var23), @"impedancePhase");
        BOOL isReceptacleEmpty = self->_isReceptacleEmpty;
        uint64_t v14 = @"com.apple.ioaccessorymanager.ldcm.usbc.dryMeasurement";
        uint64_t v15 = @"com.apple.ioaccessorymanager.ldcm.usbc.dryMeasurementPortNotEmpty";
      }
      if (isReceptacleEmpty) {
        uint32_t v19 = v14;
      }
      else {
        uint32_t v19 = v15;
      }
      [v9 setString:v19];
LABEL_37:
      AnalyticsSendEvent();

LABEL_30:
      return;
    case 1:
      goto LABEL_30;
    case 2:
      if (v6)
      {
        *(_OWORD *)&self->_wetMeasurementInfo.intialResistance = *(_OWORD *)&a5->var14;
        self->_wetMeasurementInfo.intialImpedance = a5->var22;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
        self->_wetMeasurementInfo.initialWetWallTime = v16;
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var14), @"resistance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var22), @"impedance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var15), @"capacitance");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var23), @"impedancePhase");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var16), @"measurementVoltageSNR");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5->var17), @"measurementCurrentSNR");
        goto LABEL_29;
      }
      if (!self->_wetTooLongRecorded)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
        double v21 = v20 - self->_wetMeasurementInfo.initialWetWallTime;
        double v22 = 28800.0;
        if (WET_TOO_LONG_THRESHOLD) {
          double v22 = 120.0;
        }
        if (v21 > v22)
        {
          [(IOAccessoryLDCMPortManagerTypeC *)self setWetTooLongRecorded:1];
          [(HalogenTypeC *)self->_typeC setWetTooLong:1];
          goto LABEL_29;
        }
      }
      goto LABEL_30;
    case 6:
      if (a5->var7 < 24.0) {
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"badCalCurrentSNR");
      }
      if (a5->var6 >= 24.0) {
        goto LABEL_29;
      }
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v18 = @"badCalVoltageSNR";
      goto LABEL_28;
    case 7:
      if (a5->var9 < 0.07) {
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"badCalCurrentAmp");
      }
      if (a5->var8 >= 0.07) {
        goto LABEL_29;
      }
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v18 = @"badCalVoltageAmp";
      goto LABEL_28;
    case 8:
      if (a5->var17 < 24.0) {
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"badMeasurementCurrentSNR");
      }
      if (a5->var16 >= 24.0) {
        goto LABEL_29;
      }
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v18 = @"badMeasurementVoltageSNR";
      goto LABEL_28;
    case 9:
      if (a5->var19 < 0.14) {
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"badMeasurementCurrentAmp");
      }
      if (a5->var18 >= 0.14) {
        goto LABEL_29;
      }
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v18 = @"badMeasurementVoltageAmp";
LABEL_28:
      [v8 setObject:v17 forKey:v18];
LABEL_29:
      AnalyticsSendEvent();
      goto LABEL_30;
    case 0xA:
      uint64_t v17 = [NSNumber numberWithDouble:a5->var15];
      uint64_t v18 = @"badMeasurementNegativeCap";
      goto LABEL_28;
    default:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 67109120;
        v23[1] = 2307;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%d No analytics event generated.\n", (uint8_t *)v23, 8u);
      }
      goto LABEL_30;
  }
}

- (HalogenTypeC)typeC
{
  return self->_typeC;
}

- (void)setTypeC:(id)a3
{
  self->_typeC = (HalogenTypeC *)a3;
}

- (OS_dispatch_queue)halogenTypeCDispatchQueue
{
  return self->_halogenTypeCDispatchQueue;
}

- (void)setHalogenTypeCDispatchQueue:(id)a3
{
  self->_halogenTypeCDispatchQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (unint64_t)wetPollingIntervalNs
{
  return self->_wetPollingIntervalNs;
}

- (void)setWetPollingIntervalNs:(unint64_t)a3
{
  self->_wetPollingIntervalNs = a3;
}

- (unint64_t)dryPollingIntervalNs
{
  return self->_dryPollingIntervalNs;
}

- (void)setDryPollingIntervalNs:(unint64_t)a3
{
  self->_dryPollingIntervalNs = a3;
}

- (BOOL)isPowerAssertionHeld
{
  return self->_isPowerAssertionHeld;
}

- (void)setIsPowerAssertionHeld:(BOOL)a3
{
  self->_BOOL isPowerAssertionHeld = a3;
}

- (BOOL)isMeasurementActive
{
  return self->_isMeasurementActive;
}

- (void)setIsMeasurementActive:(BOOL)a3
{
  self->_isMeasurementActive = a3;
}

- (BOOL)isWet
{
  return self->_isWet;
}

- (void)setIsWet:(BOOL)a3
{
  self->_isWet = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_BOOL isInternalBuild = a3;
}

- (BOOL)isReceptacleEmpty
{
  return self->_isReceptacleEmpty;
}

- (void)setIsReceptacleEmpty:(BOOL)a3
{
  self->_BOOL isReceptacleEmpty = a3;
}

- (BOOL)newAccArrived
{
  return self->_newAccArrived;
}

- (void)setNewAccArrived:(BOOL)a3
{
  self->_newAccArrived = a3;
}

- (BOOL)userNotified
{
  return self->_userNotified;
}

- (void)setUserNotified:(BOOL)a3
{
  self->_userNotified = a3;
}

- (BOOL)measureSBU
{
  return self->_measureSBU;
}

- (void)setMeasureSBU:(BOOL)a3
{
  self->_measureSBU = a3;
}

- (BOOL)wetTooLongRecorded
{
  return self->_wetTooLongRecorded;
}

- (void)setWetTooLongRecorded:(BOOL)a3
{
  self->_wetTooLongRecorded = a3;
}

- (BOOL)mitigationsEnabled
{
  return self->_mitigationsEnabled;
}

- (void)setMitigationsEnabled:(BOOL)a3
{
  self->_mitigationsEnabled = a3;
}

- (BOOL)mitigationsOverrideEnabled
{
  return self->_mitigationsOverrideEnabled;
}

- (void)setMitigationsOverrideEnabled:(BOOL)a3
{
  self->_mitigationsOverrideEnabled = a3;
}

- (BOOL)fakeWetMeasurements
{
  return self->_fakeWetMeasurements;
}

- (void)setFakeWetMeasurements:(BOOL)a3
{
  self->_fakeWetMeasurements = a3;
}

- (BOOL)measurementsEnabled
{
  return self->_measurementsEnabled;
}

- (void)setMeasurementsEnabled:(BOOL)a3
{
  self->_measurementsEnabled = a3;
}

- (BOOL)selfTestFailed
{
  return self->_selfTestFailed;
}

- (void)setSelfTestFailed:(BOOL)a3
{
  self->_selfTestFailed = a3;
}

- (BOOL)refMeasurementFailed
{
  return self->_refMeasurementFailed;
}

- (void)setRefMeasurementFailed:(BOOL)a3
{
  self->_refMeasurementFailed = a3;
}

- (BOOL)sbuBootArgSet
{
  return self->_sbuBootArgSet;
}

- (void)setSbuBootArgSet:(BOOL)a3
{
  self->_sbuBootArgSet = a3;
}

- (BOOL)enableMitigationsBootArgSet
{
  return self->_enableMitigationsBootArgSet;
}

- (void)setEnableMitigationsBootArgSet:(BOOL)a3
{
  self->_enableMitigationsBootArgSet = a3;
}

- (BOOL)skipTTRBootArgSet
{
  return self->_skipTTRBootArgSet;
}

- (void)setSkipTTRBootArgSet:(BOOL)a3
{
  self->_skipTTRBootArgSet = a3;
}

- (BOOL)didReportDisabledAnalytic
{
  return self->_didReportDisabledAnalytic;
}

- (void)setDidReportDisabledAnalytic:(BOOL)a3
{
  self->_didReportDisabledAnalytic = a3;
}

- (BOOL)initialAlertShown
{
  return self->_initialAlertShown;
}

- (void)setInitialAlertShown:(BOOL)a3
{
  self->_initialAlertShown = a3;
}

- (BOOL)followupAlertShown
{
  return self->_followupAlertShown;
}

- (void)setFollowupAlertShown:(BOOL)a3
{
  self->_followupAlertShown = a3;
}

- (unsigned)drySinceWetCount
{
  return self->_drySinceWetCount;
}

- (void)setDrySinceWetCount:(unsigned int)a3
{
  self->_unsigned int drySinceWetCount = a3;
}

- (unsigned)selfTestFailureCount
{
  return self->_selfTestFailureCount;
}

- (void)setSelfTestFailureCount:(unsigned int)a3
{
  self->_selfTestFailureCount = a3;
}

- (unsigned)selfTestPassCount
{
  return self->_selfTestPassCount;
}

- (void)setSelfTestPassCount:(unsigned int)a3
{
  self->_selfTestPassCount = a3;
}

- (unsigned)referenceMeasurementFailureCount
{
  return self->_referenceMeasurementFailureCount;
}

- (void)setReferenceMeasurementFailureCount:(unsigned int)a3
{
  self->_referenceMeasurementFailureCount = a3;
}

- (unsigned)referenceMeasurementPassCount
{
  return self->_referenceMeasurementPassCount;
}

- (void)setReferenceMeasurementPassCount:(unsigned int)a3
{
  self->_referenceMeasurementPassCount = a3;
}

- (unint64_t)lastUserNotificationTimeNS
{
  return self->_lastUserNotificationTimeNS;
}

- (void)setLastUserNotificationTimeNS:(unint64_t)a3
{
  self->_lastUserNotificationTimeNS = a3;
}

- (void)FBSOpenApplicationOptionKeyPromptUnlockDevice
{
  return self->_FBSOpenApplicationOptionKeyPromptUnlockDevice;
}

- (void)setFBSOpenApplicationOptionKeyPromptUnlockDevice:(void *)a3
{
  self->_FBSOpenApplicationOptionKeyPromptUnlockDevice = a3;
}

- (OS_dispatch_source)timerSelfTest
{
  return self->_timerSelfTest;
}

- (void)setTimerSelfTest:(id)a3
{
  self->_timerSelfTest = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)timerReferenceMeasurement
{
  return self->_timerReferenceMeasurement;
}

- (void)setTimerReferenceMeasurement:(id)a3
{
  self->_timerReferenceMeasurement = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)timerPortStateCheck
{
  return self->_timerPortStateCheck;
}

- (void)setTimerPortStateCheck:(id)a3
{
  self->_timerPortStateCheck = (OS_dispatch_source *)a3;
}

- (NSMutableDictionary)ldcmErrorCountDict
{
  return self->_ldcmErrorCountDict;
}

- (void)setLdcmErrorCountDict:(id)a3
{
  self->_ldcmErrorCountDict = (NSMutableDictionary *)a3;
}

- (NSLock)defaultsRWLock
{
  return self->_defaultsRWLock;
}

- (void)setDefaultsRWLock:(id)a3
{
  self->_defaultsRWLock = (NSLock *)a3;
}

- (unsigned)sleepAssertionID
{
  return self->_sleepAssertionID;
}

- (void)setSleepAssertionID:(unsigned int)a3
{
  self->_sleepIOPMAssertionID AssertionID = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  self->_condition = (NSCondition *)a3;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)wetMeasurementInfo
{
  double intialResistance = self->_wetMeasurementInfo.intialResistance;
  double intialCapacitance = self->_wetMeasurementInfo.intialCapacitance;
  double intialImpedance = self->_wetMeasurementInfo.intialImpedance;
  double initialWetWallTime = self->_wetMeasurementInfo.initialWetWallTime;
  result.var3 = initialWetWallTime;
  result.var2 = intialImpedance;
  result.var1 = intialCapacitance;
  result.int var0 = intialResistance;
  return result;
}

- (void)setWetMeasurementInfo:(id)a3
{
  self->_wetMeasurementInfo = ($D0D2D8461CFC6534DBDFCF9919D87D60)a3;
}

- (int)analyticsDebugEvent
{
  return self->_analyticsDebugEvent;
}

- (void)setAnalyticsDebugEvent:(int)a3
{
  self->_analyticsDebugEvent = a3;
}

- (mach_timebase_info)timeBase
{
  return self->_timeBase;
}

- (void)setTimeBase:(mach_timebase_info)a3
{
  self->_timeBase = a3;
}

- (OS_dispatch_queue)halogenTypeCUserPromptDispatchQueue
{
  return self->_halogenTypeCUserPromptDispatchQueue;
}

- (void)setHalogenTypeCUserPromptDispatchQueue:(id)a3
{
  self->_halogenTypeCUserPromptDispatchQueue = (OS_dispatch_queue *)a3;
}

- (int)lastMeasurementResult
{
  return self->_lastMeasurementResult;
}

- (void)setLastMeasurementResult:(int)a3
{
  self->_lastMeasurementResult = a3;
}

- (int)lastMeasurementStatus
{
  return self->_lastMeasurementStatus;
}

- (void)setLastMeasurementStatus:(int)a3
{
  self->_lastMeasurementStatus = a3;
}

- (void)_holdPowerAssertionTypeC:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s failed to acquire power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
}

- (void)_holdPowerAssertionTypeC:(unsigned __int8)a1 .cold.2(unsigned __int8 a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:]";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_debug_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s halogen power assertion already in the correct state: %d.\n", (uint8_t *)&v1, 0x12u);
}

- (void)_holdPowerAssertionTypeC:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s failed to release power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
}

- (void)_setMitigations:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end