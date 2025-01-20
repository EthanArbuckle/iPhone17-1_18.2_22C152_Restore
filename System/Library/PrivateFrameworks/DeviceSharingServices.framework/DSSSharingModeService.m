@interface DSSSharingModeService
+ (id)sharedInstance;
- (DSSSharingModeService)init;
- (void)dealloc;
- (void)emitAXOpened;
- (void)emitAXOpened:(BOOL)a3;
- (void)emitGuestBeganInitialEnrollment:(BOOL)a3;
- (void)emitGuestReEnrolled:(unint64_t)a3;
- (void)emitOpenedApps:(id)a3;
- (void)emitScreenMirroring;
- (void)emitScreenMirroring:(BOOL)a3;
- (void)emitSessionEnded:(id)a3;
- (void)emitSessionStarted:(unint64_t)a3 withOpenedApps:(id)a4;
- (void)emitTCCShown:(id)a3;
- (void)playEndSound;
- (void)playStartSound;
- (void)resetCAMetrics;
- (void)sharingModeDidEnd:(id)a3;
- (void)sharingModeDidStart:(unint64_t)a3 withOpenedApps:(id)a4;
@end

@implementation DSSSharingModeService

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __39__DSSSharingModeService_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(DSSSharingModeService);
  return MEMORY[0x270F9A758]();
}

- (DSSSharingModeService)init
{
  v8.receiver = self;
  v8.super_class = (Class)DSSSharingModeService;
  v2 = [(DSSSharingModeService *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    CFURLRef v4 = [v3 URLForResource:@"SharingMode_Initialized" withExtension:@"wav"];

    AudioServicesCreateSystemSoundID(v4, &v2->_soundIDStarted);
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    CFURLRef v6 = [v5 URLForResource:@"SharingMode_Ended" withExtension:@"wav"];

    AudioServicesCreateSystemSoundID(v6, &v2->_soundIDEnded);
    [(DSSSharingModeService *)v2 resetCAMetrics];
  }
  return v2;
}

- (void)sharingModeDidStart:(unint64_t)a3 withOpenedApps:(id)a4
{
  [(DSSSharingModeService *)self emitSessionStarted:a3 withOpenedApps:a4];
  [(DSSSharingModeService *)self playStartSound];
}

- (void)sharingModeDidEnd:(id)a3
{
  [(DSSSharingModeService *)self emitSessionEnded:a3];
  [(DSSSharingModeService *)self playEndSound];
}

- (void)resetCAMetrics
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08C38] UUID];
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v3;

  v5 = (NSDate *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:0.0];
  sharingModeStartTime = self->_sharingModeStartTime;
  self->_sharingModeStartTime = v5;

  openedApps = self->_openedApps;
  self->_openedApps = 0;

  self->_unint64_t mode = 0;
  self->_unint64_t assetEnrolled = 0;
  *(void *)&self->_int numAppsOpened = 0;
  objc_super v8 = DSSTelemetryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(NSUUID *)self->_sessionIdentifier UUIDString];
    v10 = self->_sharingModeStartTime;
    unint64_t mode = self->_mode;
    BOOL smEnabled = self->_smEnabled;
    BOOL clipOnsPresent = self->_clipOnsPresent;
    BOOL tccShown = self->_tccShown;
    BOOL axOpened = self->_axOpened;
    int numAppsOpened = self->_numAppsOpened;
    unint64_t assetEnrolled = self->_assetEnrolled;
    v17 = self->_openedApps;
    int v19 = 138414594;
    v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2048;
    unint64_t v26 = mode;
    __int16 v27 = 1024;
    BOOL v28 = smEnabled;
    __int16 v29 = 1024;
    BOOL v30 = clipOnsPresent;
    __int16 v31 = 1024;
    BOOL v32 = tccShown;
    __int16 v33 = 1024;
    BOOL v34 = axOpened;
    __int16 v35 = 1024;
    int v36 = numAppsOpened;
    __int16 v37 = 2048;
    unint64_t v38 = assetEnrolled;
    _os_log_debug_impl(&dword_24CCCB000, v8, OS_LOG_TYPE_DEBUG, "Reset the metrics to: %@ %@ %@ %lu %d, %d, %d, %d, %d, %lu", (uint8_t *)&v19, 0x52u);
  }
}

- (void)emitSessionStarted:(unint64_t)a3 withOpenedApps:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  CFURLRef v6 = [a4 componentsJoinedByString:@", "];
  v7 = DSSTelemetryLog();
  if (os_signpost_enabled(v7))
  {
    int v23 = 134349314;
    unint64_t v24 = a3;
    __int16 v25 = 2114;
    unint64_t v26 = v6;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SharingModeSession", " enableTelemetry=YES mode=%{public,signpost.telemetry:number1}lu, openedAppsList=%{public,signpost.telemetry:string1}@", (uint8_t *)&v23, 0x16u);
  }

  objc_super v8 = [MEMORY[0x263EFF910] now];
  sharingModeStartTime = self->_sharingModeStartTime;
  self->_sharingModeStartTime = v8;

  self->_unint64_t mode = a3;
  v10 = [MEMORY[0x263F08C38] UUID];
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v10;

  v12 = DSSTelemetryLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = [(NSUUID *)self->_sessionIdentifier UUIDString];
    v14 = self->_sharingModeStartTime;
    unint64_t mode = self->_mode;
    BOOL smEnabled = self->_smEnabled;
    BOOL clipOnsPresent = self->_clipOnsPresent;
    BOOL tccShown = self->_tccShown;
    BOOL axOpened = self->_axOpened;
    int numAppsOpened = self->_numAppsOpened;
    unint64_t assetEnrolled = self->_assetEnrolled;
    openedApps = self->_openedApps;
    int v23 = 138414594;
    unint64_t v24 = (unint64_t)v13;
    __int16 v25 = 2112;
    unint64_t v26 = v14;
    __int16 v27 = 2112;
    BOOL v28 = openedApps;
    __int16 v29 = 2048;
    unint64_t v30 = mode;
    __int16 v31 = 1024;
    BOOL v32 = smEnabled;
    __int16 v33 = 1024;
    BOOL v34 = clipOnsPresent;
    __int16 v35 = 1024;
    BOOL v36 = tccShown;
    __int16 v37 = 1024;
    BOOL v38 = axOpened;
    __int16 v39 = 1024;
    int v40 = numAppsOpened;
    __int16 v41 = 2048;
    unint64_t v42 = assetEnrolled;
    _os_log_debug_impl(&dword_24CCCB000, v12, OS_LOG_TYPE_DEBUG, "Metrics at start of the session: %@ %@ %@ %lu %d, %d, %d, %d, %d, %lu", (uint8_t *)&v23, 0x52u);
  }
}

- (void)emitSessionEnded:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DSSTelemetryLog();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v4;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SharingModeSession", " enableTelemetry=YES sourceString=%{public,signpost.telemetry:string2}@", buf, 0xCu);
  }

  CFURLRef v6 = [MEMORY[0x263EFF910] now];
  [v6 timeIntervalSinceDate:self->_sharingModeStartTime];
  double v8 = v7 / 60.0;
  v9 = DSSTelemetryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v22 = [(NSUUID *)self->_sessionIdentifier UUIDString];
    sharingModeStartTime = self->_sharingModeStartTime;
    unint64_t mode = self->_mode;
    BOOL smEnabled = self->_smEnabled;
    BOOL clipOnsPresent = self->_clipOnsPresent;
    BOOL tccShown = self->_tccShown;
    BOOL axOpened = self->_axOpened;
    int numAppsOpened = self->_numAppsOpened;
    unint64_t assetEnrolled = self->_assetEnrolled;
    openedApps = self->_openedApps;
    *(_DWORD *)buf = 138415362;
    id v38 = v22;
    __int16 v39 = 2112;
    int v40 = sharingModeStartTime;
    __int16 v41 = 2112;
    unint64_t v42 = v6;
    __int16 v43 = 2048;
    double v44 = v8;
    __int16 v45 = 2112;
    id v46 = v4;
    __int16 v47 = 2112;
    v48 = openedApps;
    __int16 v49 = 2048;
    unint64_t v50 = mode;
    __int16 v51 = 1024;
    BOOL v52 = smEnabled;
    __int16 v53 = 1024;
    BOOL v54 = clipOnsPresent;
    __int16 v55 = 1024;
    BOOL v56 = tccShown;
    __int16 v57 = 1024;
    BOOL v58 = axOpened;
    __int16 v59 = 1024;
    int v60 = numAppsOpened;
    __int16 v61 = 2048;
    unint64_t v62 = assetEnrolled;
    _os_log_debug_impl(&dword_24CCCB000, v9, OS_LOG_TYPE_DEBUG, "Metrics at end of the session: %@ %@ %@ %f %@ %@ %lu %d %d %d %d %d %lu", buf, 0x70u);
  }
  BOOL v32 = v6;

  v35[0] = @"duration";
  v10 = [NSNumber numberWithDouble:v8];
  v36[0] = v10;
  v35[1] = @"mode";
  v11 = [NSNumber numberWithUnsignedInteger:self->_mode];
  v36[1] = v11;
  v36[2] = v4;
  v35[2] = @"endSource";
  v35[3] = @"numOfAppsOpened";
  v12 = [NSNumber numberWithInt:self->_numAppsOpened];
  v36[3] = v12;
  v35[4] = @"clipOnsPresent";
  v13 = [NSNumber numberWithBool:self->_clipOnsPresent];
  v36[4] = v13;
  v35[5] = @"axOpened";
  v14 = [NSNumber numberWithBool:self->_axOpened];
  v36[5] = v14;
  v35[6] = @"tccShown";
  v15 = [NSNumber numberWithBool:self->_tccShown];
  v36[6] = v15;
  v35[7] = @"assetReenrolled";
  v16 = [NSNumber numberWithUnsignedInteger:self->_assetEnrolled];
  v36[7] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:8];

  v33[5] = MEMORY[0x263EF8330];
  v33[6] = 3221225472;
  v33[7] = __42__DSSSharingModeService_emitSessionEnded___block_invoke;
  v33[8] = &unk_2652F5AF0;
  id v18 = v17;
  id v34 = v18;
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    int v19 = DSSTelemetryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[DSSSharingModeService emitSessionEnded:](v19);
    }
  }
  v20 = self->_openedApps;
  if (v20 && self->_mode == 1)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __42__DSSSharingModeService_emitSessionEnded___block_invoke_44;
    v33[3] = &unk_2652F5B18;
    v33[4] = self;
    [(NSArray *)v20 enumerateObjectsUsingBlock:v33];
  }
  __int16 v21 = DSSTelemetryLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[DSSSharingModeService emitSessionEnded:](v21);
  }

  [(DSSSharingModeService *)self resetCAMetrics];
}

id __42__DSSSharingModeService_emitSessionEnded___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __42__DSSSharingModeService_emitSessionEnded___block_invoke_44(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
  v7[0] = @"sessionID";
  v7[1] = @"bundleID";
  v8[0] = v4;
  v8[1] = v3;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    CFURLRef v6 = DSSTelemetryLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__DSSSharingModeService_emitSessionEnded___block_invoke_44_cold_1(v6);
    }
  }
}

id __42__DSSSharingModeService_emitSessionEnded___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitOpenedApps:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_openedApps, a3);
    self->_int numAppsOpened = [(NSArray *)self->_openedApps count];
    id v5 = v6;
  }
}

- (void)emitScreenMirroring
{
  id v3 = DSSTelemetryLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeScreenMirroring", " enableTelemetry=YES Screen Mirroring", v4, 2u);
  }

  self->_BOOL smEnabled = 1;
}

- (void)emitScreenMirroring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = DSSTelemetryLog();
  if (os_signpost_enabled(v4))
  {
    v5[0] = 67240192;
    v5[1] = v3;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeScreenMirroring", " enableTelemetry=YES screenMirroringt=%{public,signpost.telemetry:number1}d", (uint8_t *)v5, 8u);
  }
}

- (void)emitGuestBeganInitialEnrollment:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v5 = DSSTelemetryLog();
  if (os_signpost_enabled(v5))
  {
    v6[0] = 67240192;
    v6[1] = v3;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeGuestBeganInitialEnrollment", " enableTelemetry=YES clipOnsPresent=%{public,signpost.telemetry:number1}d", (uint8_t *)v6, 8u);
  }

  self->_BOOL clipOnsPresent = v3;
}

- (void)emitGuestReEnrolled:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = DSSTelemetryLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 134349056;
    unint64_t v7 = a3;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeGuestReEnrolled", " enableTelemetry=YES asset=%{public,signpost.telemetry:number1}lu", (uint8_t *)&v6, 0xCu);
  }

  self->_unint64_t assetEnrolled = a3;
}

- (void)emitTCCShown:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DSSTelemetryLog();
  if (os_signpost_enabled(v5))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeTCCShown", " enableTelemetry=YES bundleID=%{public,signpost.telemetry:string1}@", (uint8_t *)&v6, 0xCu);
  }

  self->_BOOL tccShown = 1;
}

- (void)emitAXOpened
{
  BOOL v3 = DSSTelemetryLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeAXOpened", " enableTelemetry=YES AX Modified", v4, 2u);
  }

  self->_BOOL axOpened = 1;
}

- (void)emitAXOpened:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = DSSTelemetryLog();
  if (os_signpost_enabled(v4))
  {
    v5[0] = 67240192;
    v5[1] = v3;
    _os_signpost_emit_with_name_impl(&dword_24CCCB000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SharingModeAXOpened", " enableTelemetry=YES modified=%{public,signpost.telemetry:number1}d", (uint8_t *)v5, 8u);
  }
}

- (void)playStartSound
{
}

- (void)playEndSound
{
}

- (void)dealloc
{
  AudioServicesDisposeSystemSoundID(self->_soundIDStarted);
  AudioServicesDisposeSystemSoundID(self->_soundIDEnded);
  v3.receiver = self;
  v3.super_class = (Class)DSSSharingModeService;
  [(DSSSharingModeService *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_openedApps, 0);
  objc_storeStrong((id *)&self->_sharingModeStartTime, 0);
}

- (void)emitSessionEnded:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24CCCB000, log, OS_LOG_TYPE_DEBUG, "Calling reset from end", v1, 2u);
}

- (void)emitSessionEnded:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24CCCB000, log, OS_LOG_TYPE_ERROR, "Reporting to CA failed for Guest User Mode Session", v1, 2u);
}

void __42__DSSSharingModeService_emitSessionEnded___block_invoke_44_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24CCCB000, log, OS_LOG_TYPE_ERROR, "Reporting to CA failed for Guest User Mode Shared Apps", v1, 2u);
}

@end