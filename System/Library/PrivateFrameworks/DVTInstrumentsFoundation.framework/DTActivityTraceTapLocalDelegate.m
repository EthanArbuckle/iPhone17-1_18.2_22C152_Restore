@interface DTActivityTraceTapLocalDelegate
- (BOOL)canFetchWhileArchiving;
- (DTActivityTraceTapLocalDelegate)initWithConfig:(id)a3;
- (id)noticeForRecordingMode:(unint64_t)a3 isAllProcesses:(BOOL)a4 lossCount:(unint64_t)a5;
- (id)validateConfig;
- (void)_handleHARExternalNotificationChange;
- (void)_handleStopOfHARRecordingCausedByUser;
- (void)_setupHARDisabledByExternalClientNotifications;
- (void)_tearDownHARDisabledNotifications;
- (void)dealloc;
- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4;
- (void)initializeHARTimer;
- (void)logLoaderNeedsFetchNow:(id)a3;
- (void)setTap:(id)a3;
- (void)start;
- (void)stop;
- (void)tearDownHARTimer;
- (void)updateHARLogPrefsWithIsEnabled:(BOOL)a3;
@end

@implementation DTActivityTraceTapLocalDelegate

- (DTActivityTraceTapLocalDelegate)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTActivityTraceTapLocalDelegate;
  v6 = [(DTActivityTraceTapLocalDelegate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (!v5) {
      sub_23093DAE0();
    }
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_harLoggingNotificationToken = -1;
  }

  return v7;
}

- (void)dealloc
{
  [(XRMobileAgentDock *)self->_dock abandon];
  v3.receiver = self;
  v3.super_class = (Class)DTActivityTraceTapLocalDelegate;
  [(DTActivityTraceTapLocalDelegate *)&v3 dealloc];
}

- (id)validateConfig
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = [(DTActivityTraceTapConfig *)self->_config predicateString];
  v4 = v3;
  if (v3 && ([v3 isEqualToString:&stru_26E517620] & 1) == 0)
  {
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:v4];

    if (v16)
    {
      id v5 = 0;
      v6 = 0;
      goto LABEL_5;
    }
    v21 = [DTTapStatusMemo alloc];
    id v5 = @"Internal error contains no diagnostics";
    v4 = [NSString stringWithFormat:@"Predicate supplied to logging system appears invalid. %@.", @"Internal error contains no diagnostics"];
    v6 = [(DTTapStatusMemo *)v21 initWithStatus:2147484148 notice:v4];
  }
  else
  {
    id v5 = 0;
    v6 = 0;
  }

LABEL_5:
  if (![(DTActivityTraceTapConfig *)self->_config mode])
  {
    v7 = SecTaskCreateFromSelf(0);
    if (v7)
    {
      v22 = v5;
      cf = v7;
      CFErrorRef error = 0;
      CFDictionaryRef v8 = SecTaskCopyValuesForEntitlements(v7, (CFArrayRef)&unk_26E533E60, &error);
      if (v8)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = [&unk_26E533E78 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v25;
          uint64_t v11 = MEMORY[0x263EFFA88];
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(&unk_26E533E78);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              v14 = [(__CFDictionary *)v8 objectForKeyedSubscript:v13];
              char v15 = [v14 isEqual:v11];

              if ((v15 & 1) == 0)
              {
                v17 = [DTTapStatusMemo alloc];
                v18 = [NSString stringWithFormat:@"Recording service missing '%@' entitlement.", v13];
                uint64_t v19 = [(DTTapStatusMemo *)v17 initWithStatus:2147484148 notice:v18];

                v6 = (DTTapStatusMemo *)v19;
                goto LABEL_20;
              }
            }
            uint64_t v9 = [&unk_26E533E78 countByEnumeratingWithState:&v24 objects:v29 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_20:
      }
      CFRelease(cf);
      id v5 = v22;
    }
  }

  return v6;
}

- (void)setTap:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_23093DB0C();
  }
  id v5 = v4;
  objc_storeWeak((id *)&self->_tap, v4);
}

- (void)logLoaderNeedsFetchNow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
  id v3 = (id)[WeakRetained fetchDataNow];
}

- (void)_setupHARDisabledByExternalClientNotifications
{
  p_harLoggingNotificationToken = &self->_harLoggingNotificationToken;
  if (self->_harLoggingNotificationToken == -1)
  {
    objc_initWeak(&location, self);
    id v3 = dispatch_get_global_queue(25, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2308CECD0;
    v5[3] = &unk_264B8F420;
    objc_copyWeak(&v6, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.CFNetwork.har-capture-update", p_harLoggingNotificationToken, v3, v5);

    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        sub_23093DB38();
      }
    }
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_tearDownHARDisabledNotifications
{
  int harLoggingNotificationToken = self->_harLoggingNotificationToken;
  if (harLoggingNotificationToken != -1)
  {
    notify_cancel(harLoggingNotificationToken);
    self->_int harLoggingNotificationToken = -1;
  }
}

- (void)_handleStopOfHARRecordingCausedByUser
{
  uint32_t v4 = [[DTTapStatusMemo alloc] initWithStatus:2147484148 notice:@"HTTP Recording stopped by the target device"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
  [WeakRetained _handleStatusMemo:v4];

  [(DTActivityTraceTapLocalDelegate *)self _tearDownHARDisabledNotifications];
  [(DVTDeviceGlobalStatusIndicator *)self->_recordingStatusIndicator deactivate];
  [(DTActivityTraceTapLocalDelegate *)self tearDownHARTimer];
  [(DTActivityTraceTapLocalDelegate *)self updateHARLogPrefsWithIsEnabled:0];
}

- (void)_handleHARExternalNotificationChange
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE50];
  unint64_t v4 = (unint64_t)CFPreferencesCopyValue(@"har-capture-global", @"com.apple.CFNetwork", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  unint64_t v5 = (unint64_t)CFPreferencesCopyValue(@"har-capture-pid-specific", @"com.apple.CFNetwork", @"mobile", v3);
  if (v4 | v5)
  {
    if (v5) {
      CFRelease((CFTypeRef)v5);
    }
    if (v4)
    {
      CFRelease((CFTypeRef)v4);
    }
  }
  else
  {
    [(DTActivityTraceTapLocalDelegate *)self _handleStopOfHARRecordingCausedByUser];
  }
}

- (void)initializeHARTimer
{
  CFStringRef v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  harLoggingTimer = self->_harLoggingTimer;
  self->_harLoggingTimer = v3;

  unint64_t v5 = self->_harLoggingTimer;
  dispatch_time_t v6 = dispatch_walltime(0, 55000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_harLoggingTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_2308CEFA4;
  handler[3] = &unk_264B8D590;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_harLoggingTimer);
}

- (void)tearDownHARTimer
{
}

- (void)updateHARLogPrefsWithIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F52768]) initWithName:@"com.apple.CFNetwork"];
  dispatch_time_t v6 = (void *)[objc_alloc(MEMORY[0x263F52760]) initWithName:@"HAR" subsystem:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x263F52768]) initWithName:@"com.apple.CFNetwork.Instruments"];
  CFDictionaryRef v8 = (void *)[objc_alloc(MEMORY[0x263F52760]) initWithName:@"HTTP Transactions" subsystem:v7];
  if (v3)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
    uint64_t v10 = (const void *)[NSNumber numberWithInt:0x100000];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(@"har-body-size-limit", v10, @"com.apple.CFNetwork", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    if ([(DTActivityTraceTapConfig *)self->_config targetPID] == -3)
    {
      CFPreferencesSetValue(@"har-capture-global", v9, @"com.apple.CFNetwork", @"mobile", v11);
      v12 = 0;
      CFStringRef v13 = @"har-capture-pid-specific";
    }
    else
    {
      CFPreferencesSetValue(@"har-capture-pid-specific", (CFPropertyListRef)[NSNumber numberWithInt:-[DTActivityTraceTapConfig targetPID](self->_config, "targetPID")], @"com.apple.CFNetwork", @"mobile", v11);
      CFStringRef v13 = @"har-capture-global";
      v12 = v9;
    }
    CFPreferencesSetValue(@"har-capture-pid-date", v12, @"com.apple.CFNetwork", @"mobile", v11);
    CFPreferencesSetValue(v13, 0, @"com.apple.CFNetwork", @"mobile", v11);
    if (notify_post("com.apple.CFNetwork.har-capture-update")
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to post notification to start HAR logging", buf, 2u);
    }
    [v6 setPersistedLevel:0];
    [v6 setEnabledLevel:2];
    [v8 setSignpostEnabled:1];
  }
  else
  {
    CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(@"har-body-size-limit", 0, @"com.apple.CFNetwork", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    CFPreferencesSetValue(@"har-capture-global", 0, @"com.apple.CFNetwork", @"mobile", v14);
    CFPreferencesSetValue(@"har-capture-pid-specific", 0, @"com.apple.CFNetwork", @"mobile", v14);
    CFPreferencesSetValue(@"har-capture-pid-date", 0, @"com.apple.CFNetwork", @"mobile", v14);
    if (notify_post("com.apple.CFNetwork.har-capture-update")
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to post notification to stop HAR logging", v15, 2u);
    }
    [v6 reset];
    [v8 reset];
  }
}

- (void)start
{
  v66[5] = *MEMORY[0x263EF8340];
  BOOL v3 = (XRMobileAgentDock *)objc_opt_new();
  dock = self->_dock;
  self->_dock = v3;

  unint64_t v5 = (DTOSLogLoader *)objc_opt_new();
  loaderStop = self->_loaderStop;
  self->_loaderStop = v5;

  [(DTOSLogLoader *)self->_loaderStop setDelegate:self];
  v7 = (DTActivityTraceTapLocalShuttle *)objc_opt_new();
  shuttle = self->_shuttle;
  self->_shuttle = v7;

  [(DTActivityTraceTapLocalShuttle *)self->_shuttle setLoaderStop:self->_loaderStop];
  [(DTActivityTraceTapLocalShuttle *)self->_shuttle setOwnersDock:self->_dock];
  uint64_t v9 = [(DTActivityTraceTapConfig *)self->_config predicateString];
  if (v9
    && ([(DTActivityTraceTapConfig *)self->_config predicateString],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 length],
        v10,
        v9,
        v11))
  {
    v12 = (void *)MEMORY[0x263F08A98];
    CFStringRef v13 = [(DTActivityTraceTapConfig *)self->_config predicateString];
    v57 = [v12 predicateWithFormat:v13];
  }
  else
  {
    v57 = 0;
  }
  if ([(DTActivityTraceTapConfig *)self->_config onlySignposts])
  {
    uint64_t v14 = 1;
  }
  else if ([(DTActivityTraceTapConfig *)self->_config signpostsAndLogs])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 2;
  }
  uint64_t v15 = [(DTActivityTraceTapConfig *)self->_config excludeInfo];
  if ([(DTActivityTraceTapConfig *)self->_config excludeDebug]) {
    uint64_t v16 = v15 | 2;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = [(DTActivityTraceTapConfig *)self->_config includeSenderInfo];
  if ([(DTActivityTraceTapConfig *)self->_config includeWallTime]) {
    v17 |= 2uLL;
  }
  unint64_t v18 = [(DTActivityTraceTapConfig *)self->_config mode];
  config = self->_config;
  uint64_t v55 = v16;
  uint64_t v56 = v14;
  if (v18)
  {
    uint64_t v20 = [(DTActivityTraceTapConfig *)config mode];
    uint64_t v21 = 2 * (v20 == 1);
    if (v20 == 2) {
      uint64_t v21 = 3;
    }
    uint64_t v54 = v21;
    v22 = [(DTActivityTraceTapConfig *)self->_config processDetectionCallback];
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setProcessDetectionCallback:v22];
  }
  else
  {
    unint64_t v23 = [(DTTapConfig *)config bufferMode];
    if (v23 == 2)
    {
      [(DTActivityTraceTapLocalShuttle *)self->_shuttle setFetchWindow:(double)(2 * [(DTTapConfig *)self->_config windowSize]) / 1000000000.0];
    }
    else if (v23 <= 1)
    {
      uint64_t v54 = 1;
      goto LABEL_24;
    }
    uint64_t v54 = 0;
  }
LABEL_24:
  v53 = [DTOSLogLoaderConfiguration alloc];
  BOOL v52 = [(DTActivityTraceTapConfig *)self->_config enableBacktraceReplacement];
  mach_timebase_info v51 = [(DTActivityTraceTapConfig *)self->_config machTimebase];
  unint64_t v50 = [(DTActivityTraceTapConfig *)self->_config machContinuousStart];
  long long v24 = [(DTActivityTraceTapConfig *)self->_config importedFileURL];
  long long v25 = [(DTActivityTraceTapConfig *)self->_config importForcedStartDate];
  long long v26 = [(DTActivityTraceTapConfig *)self->_config importForcedEndDate];
  long long v27 = [(DTActivityTraceTapConfig *)self->_config processDetectionCallback];
  v28 = [(DTActivityTraceTapConfig *)self->_config dynamicTracingEnabledSubsystems];
  v29 = [(DTActivityTraceTapConfig *)self->_config loggingSubsystemCategoryPairsToEnable];
  uint64_t v30 = [(DTActivityTraceTapConfig *)self->_config signpostSubsystemCategoryPairsToEnable];
  LOBYTE(v49) = v27 != 0;
  uint64_t v31 = [(DTOSLogLoaderConfiguration *)v53 initWithFilterPredicate:v57 signpostConfig:v56 loaderExclusions:v55 columnInclusions:v17 mode:v54 enableBacktraceReplacement:v52 machTimebase:v51 machContinuousStart:v50 importedFileURL:v24 importForcedStartDate:v25 importForcedEndDate:v26 trackPidToExecNameMapping:v49 dynamicTracingEnabledSubsystems:v28 logSubsystemCategoryPairsToEnable:v29 signpostSubsystemCategoryPairsToEnable:v30];

  v32 = (void *)v31;
  [(DTActivityTraceTapLocalShuttle *)self->_shuttle setConfiguration:v31];
  if ([(DTActivityTraceTapConfig *)self->_config enableHTTPArchiveLogging])
  {
    objc_initWeak(&location, self);
    v33 = [[DVTDeviceGlobalStatusIndicatorConfiguration alloc] initWithTitle:@"HTTP Traffic is being recorded" informationText:@"Recordings of HTTP traffic can contain sensitive information. If you did not ask to record HTTP traffic, tap Stop Recording."];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_2308CFAEC;
    v63[3] = &unk_264B8D760;
    objc_copyWeak(&v64, &location);
    v34 = +[DVTDeviceGlobalStatusIndicatorFactory deviceStatusIndicatorWithConfiguration:v33 stoppedByUserBlock:v63];
    recordingStatusIndicator = self->_recordingStatusIndicator;
    self->_recordingStatusIndicator = v34;

    [(DVTDeviceGlobalStatusIndicator *)self->_recordingStatusIndicator activateWithCompletionBlock:0];
    [(DTActivityTraceTapLocalDelegate *)self initializeHARTimer];
    [(DTActivityTraceTapLocalDelegate *)self updateHARLogPrefsWithIsEnabled:1];
    [(DTActivityTraceTapLocalDelegate *)self _setupHARDisabledByExternalClientNotifications];
    objc_destroyWeak(&v64);

    objc_destroyWeak(&location);
  }
  v36 = [DTTapStatusMemo alloc];
  v37 = [(DTTapStatusMemo *)v36 initWithStatus:(unsigned __int16)DTActivityTraceTapDeviceTimeInfoMemoStatusCode | 0x90000000 notice:@"Time Mapping"];
  uint64_t v61 = 0;
  mach_timebase_info info = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  id location = 0;
  int times = mach_get_times();
  if (!(times | mach_timebase_info(&info)))
  {
    v65[0] = DTActivityTraceTapDeviceTimeIntervalSince1970Key;
    v39 = [NSNumber numberWithDouble:(double)v59 / 1000000000.0 + (double)(uint64_t)location];
    v66[0] = v39;
    v65[1] = DTActivityTraceTapDeviceMachContinuousTimeKey;
    v40 = [NSNumber numberWithUnsignedLongLong:v60];
    v66[1] = v40;
    v65[2] = DTActivityTraceTapDeviceMachAbsoluteTimeKey;
    v41 = [NSNumber numberWithUnsignedLongLong:v61];
    v66[2] = v41;
    v65[3] = DTActivityTraceTapDeviceMachTimebaseNumeratorKey;
    v42 = [NSNumber numberWithUnsignedInt:info.numer];
    v66[3] = v42;
    v65[4] = DTActivityTraceTapDeviceMachTimebaseDenominatorKey;
    v43 = [NSNumber numberWithUnsignedInt:info.denom];
    v66[4] = v43;
    v44 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:5];
    [(DTTapStatusMemo *)v37 setInfo:v44];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
    [WeakRetained _handleStatusMemo:v37];
  }
  [(XRMobileAgent *)self->_shuttle activateWithFinalDestination:self->_dock ticket:0];
  if ([(XRMobileAgentDock *)self->_dock waitForAgentToDock])
  {
    v46 = [(XRMobileAgentDock *)self->_dock dockedAgent];
    if (v46 != self->_shuttle) {
      sub_23093DBC8();
    }

    if (![(DTActivityTraceTapLocalShuttle *)self->_shuttle didPrepare])
    {
      v47 = [[DTTapStatusMemo alloc] initWithStatus:2147484563 notice:@"Failed to prepare the logging system for recording."];
      id v48 = objc_loadWeakRetained((id *)&self->_tap);
      [v48 _handleStatusMemo:v47];
      goto LABEL_34;
    }
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setShouldStart:1];
    [(XRMobileAgentDock *)self->_dock releaseDockedAgent];
    [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
    if (![(DTActivityTraceTapLocalShuttle *)self->_shuttle didStart])
    {
      v47 = [[DTTapStatusMemo alloc] initWithStatus:2147484558 notice:@"Failed to start recording logging system data."];
      id v48 = objc_loadWeakRetained((id *)&self->_tap);
      [v48 _handleStatusMemo:v47];
LABEL_34:
    }
  }
}

- (void)stop
{
  BOOL v3 = [(XRMobileAgentDock *)self->_dock dockedAgent];

  if (!v3) {
    [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
  }
  unint64_t v4 = [(XRMobileAgentDock *)self->_dock dockedAgent];

  if (v4)
  {
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setShouldStop:1];
    [(XRMobileAgentDock *)self->_dock releaseDockedAgent];
  }
  [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
  unint64_t v5 = [(XRMobileAgentDock *)self->_dock dockedAgent];

  if (v5)
  {
    if (![(DTActivityTraceTapLocalShuttle *)self->_shuttle didStop])
    {
      dispatch_time_t v6 = [[DTTapStatusMemo alloc] initWithStatus:2281702326 notice:@"Failed to stop the logging system recording."];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v6];
    }
    [(XRMobileAgentDock *)self->_dock releaseDockedAgent];
    [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
  }
  else
  {
    CFDictionaryRef v8 = [[DTTapStatusMemo alloc] initWithStatus:2281702346 notice:@"Internal agent failure."];
    id v9 = objc_loadWeakRetained((id *)&self->_tap);
    [v9 _handleStatusMemo:v8];
  }
  if ([(DTActivityTraceTapConfig *)self->_config enableHTTPArchiveLogging])
  {
    [(DTActivityTraceTapLocalDelegate *)self _tearDownHARDisabledNotifications];
    [(DVTDeviceGlobalStatusIndicator *)self->_recordingStatusIndicator deactivate];
    [(DTActivityTraceTapLocalDelegate *)self tearDownHARTimer];
    [(DTActivityTraceTapLocalDelegate *)self updateHARLogPrefsWithIsEnabled:0];
  }
}

- (BOOL)canFetchWhileArchiving
{
  return 0;
}

- (void)fetchDataForReason:(unint64_t)a3 block:(id)a4
{
  v42 = (void (**)(id, void *, uint64_t))a4;
  if (a3 == 2)
  {
    if (![(DTTapConfig *)self->_config discardHeartbeatsWhenPossible]) {
      +[DTOSLogLoader heartbeat];
    }
    int v9 = 1;
  }
  else
  {
    if (!a3)
    {
      dispatch_time_t v6 = [DTActivityTraceTapMemo alloc];
      v7 = objc_opt_new();
      CFDictionaryRef v8 = [(DTActivityTraceTapMemo *)v6 initWithData:v7];

      [(DTTapDataMemo *)v8 setFinalMemo:1];
      v42[2](v42, v8, 1);
      goto LABEL_46;
    }
    int v9 = 0;
  }
  uint64_t v10 = [(XRMobileAgentDock *)self->_dock dockedAgent];

  if (!v10) {
    [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
  }
  uint64_t v11 = [(XRMobileAgentDock *)self->_dock dockedAgent];

  if (!v11) {
    goto LABEL_47;
  }
  unint64_t v40 = a3;
  uint64_t v12 = 0;
  CFDictionaryRef v8 = 0;
  char v41 = 0;
  do
  {
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setShouldFetch:1];
    [(XRMobileAgentDock *)self->_dock releaseDockedAgent];
    [(XRMobileAgentDock *)self->_dock waitForAgentToDock];
    CFStringRef v13 = [(DTActivityTraceTapLocalShuttle *)self->_shuttle failureReason];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 localizedFailureReason];

      if (v15) {
        [v14 localizedFailureReason];
      }
      else {
      uint64_t v16 = [v14 localizedDescription];
      }
      uint64_t v17 = [DTTapStatusMemo alloc];
      unint64_t v18 = [NSString stringWithFormat:@"Fatal logging system error: %@", v16];
      uint64_t v19 = [(DTTapStatusMemo *)v17 initWithStatus:2147484548 notice:v18];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_tap);
      [WeakRetained _handleStatusMemo:v19];
    }
    v12 += [(DTActivityTraceTapLocalShuttle *)self->_shuttle lostEventsSinceLastVisit];
    uint64_t v21 = [(DTActivityTraceTapLocalShuttle *)self->_shuttle nextOutputBytes];
    v22 = v21;
    if (v9)
    {

      if (!v22) {
        goto LABEL_27;
      }
      unint64_t v23 = [(DTActivityTraceTapLocalShuttle *)self->_shuttle nextOutputBytes];
      long long v24 = v23;
      if (v8) {
        [(DTActivityTraceTapMemo *)v8 appendData:v23];
      }
      else {
        CFDictionaryRef v8 = (DTActivityTraceTapMemo *)[(DTTapStatusMemo *)v23 mutableCopy];
      }
      goto LABEL_26;
    }
    uint64_t v25 = [v21 length];

    if (v25)
    {
      long long v26 = [DTActivityTraceTapMemo alloc];
      long long v27 = [(DTActivityTraceTapLocalShuttle *)self->_shuttle nextOutputBytes];
      v28 = [(DTActivityTraceTapMemo *)v26 initWithData:v27];

      [(DTTapDataMemo *)v28 setFinalMemo:[(DTActivityTraceTapLocalShuttle *)self->_shuttle isFetchComplete]];
      [(DTActivityTraceTapMemo *)v28 setLastMachContinuousTimeSeen:[(DTActivityTraceTapLocalShuttle *)self->_shuttle lastMachContinuousTime]];
      v42[2](v42, v28, [(DTTapDataMemo *)v28 finalMemo]);

      char v41 = 1;
    }
    if (v12)
    {
      v29 = [DTTapStatusMemo alloc];
      uint64_t v30 = [(DTActivityTraceTapLocalDelegate *)self noticeForRecordingMode:[(DTTapConfig *)self->_config bufferMode] isAllProcesses:[(DTActivityTraceTapConfig *)self->_config isTargetAllProcesses] lossCount:v12];
      long long v24 = [(DTTapStatusMemo *)v29 initWithStatus:2281701476 notice:v30];

      id v31 = objc_loadWeakRetained((id *)&self->_tap);
      [v31 _handleStatusMemo:v24];

      uint64_t v12 = 0;
LABEL_26:
    }
LABEL_27:
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setNextOutputBytes:0];
    [(DTActivityTraceTapLocalShuttle *)self->_shuttle setLostEventsSinceLastVisit:0];
  }
  while (![(DTActivityTraceTapLocalShuttle *)self->_shuttle isFetchComplete]);
  [(DTActivityTraceTapLocalShuttle *)self->_shuttle setShouldFetch:0];
  if (v8) {
    int v32 = v9;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1 && [(DTActivityTraceTapMemo *)v8 length])
  {
    v33 = [[DTActivityTraceTapMemo alloc] initWithData:v8];
    char v41 = 1;
    [(DTTapDataMemo *)v33 setFinalMemo:1];
    [(DTActivityTraceTapMemo *)v33 setLastMachContinuousTimeSeen:[(DTActivityTraceTapLocalShuttle *)self->_shuttle lastMachContinuousTime]];
    v42[2](v42, v33, 1);
  }
  if (v12) {
    int v34 = v9;
  }
  else {
    int v34 = 0;
  }
  if (v34 == 1)
  {
    v35 = [DTTapStatusMemo alloc];
    v36 = [(DTActivityTraceTapLocalDelegate *)self noticeForRecordingMode:[(DTTapConfig *)self->_config bufferMode] isAllProcesses:[(DTActivityTraceTapConfig *)self->_config isTargetAllProcesses] lossCount:v12];
    v37 = [(DTTapStatusMemo *)v35 initWithStatus:2281701476 notice:v36];

    id v38 = objc_loadWeakRetained((id *)&self->_tap);
    [v38 _handleStatusMemo:v37];
  }
  if ((v41 & 1) == 0)
  {
    if (v40 == 2)
    {
      v39 = [[DTTapHeartbeatMemo alloc] initWithTimestamp:[(DTActivityTraceTapLocalShuttle *)self->_shuttle lastMachContinuousTime]];
    }
    else
    {
      if (v40 != 1) {
        goto LABEL_46;
      }
      v39 = [[DTActivityTraceTapMemo alloc] initWithData:v8];
      [(DTTapHeartbeatMemo *)v39 setFinalMemo:1];
    }
    v42[2](v42, v39, 1);
  }
LABEL_46:

LABEL_47:
}

- (id)noticeForRecordingMode:(unint64_t)a3 isAllProcesses:(BOOL)a4 lossCount:(unint64_t)a5
{
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      dispatch_time_t v6 = @"%llu log/signpost messages lost due to high rates in live mode recording. Try windowed recording mode.";
      goto LABEL_7;
    }
  }
  else if (a4)
  {
    dispatch_time_t v6 = @"%llu log/signpost messages lost due to high rates. Try target specific process.";
    goto LABEL_7;
  }
  dispatch_time_t v6 = @"%llu log/signpost messages lost due to high rates";
LABEL_7:
  v7 = [NSString stringWithFormat:v6, a5];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingStatusIndicator, 0);
  objc_storeStrong((id *)&self->_harLoggingTimer, 0);
  objc_storeStrong((id *)&self->_shuttle, 0);
  objc_storeStrong((id *)&self->_dock, 0);
  objc_storeStrong((id *)&self->_loaderStop, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_tap);
}

@end