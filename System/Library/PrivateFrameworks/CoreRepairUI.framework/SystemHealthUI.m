@interface SystemHealthUI
+ (id)sharedInstance;
- (BOOL)hasUnsealedComponents;
- (BOOL)isPreFlightDone;
- (BOOL)isVaildCAA:(id)a3;
- (SystemHealthUI)init;
- (id)findSpecifierToInsertAfter:(id)a3;
- (id)getCurrentDetailsWithPrivacySpecifier:(BOOL)a3;
- (id)getCurrentSystemHealthInfoSpecifiers;
- (id)reloadCurrentSystemHealthInfoSpecifiers;
- (id)setupGroupSpecifer;
- (id)valueForSpecifierFinishRepair;
- (id)valueForSpecifierIssue;
- (id)valueForSpecifierPartData:(id)a3;
- (id)valueForSpecifierPartDate:(id)a3;
- (id)valueForSpecifierPartProperty:(id)a3;
- (id)valueForSpecifierPartRC:(id)a3;
- (id)valueForSpecifierPartService:(id)a3;
- (id)valueForSpecifierRepaired;
- (id)valueForSpecifierService;
- (id)valueForSpecifierUnknown;
- (id)valueForSpecifierUsed;
- (int)getBatteryHealthServiceState;
- (int64_t)getCpuUptimeInSec;
- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5;
- (void)clearCAARequestHistory;
- (void)configureSpin:(BOOL)a3 ofCellForSpecifier:(id)a4 setEnabled:(BOOL)a5;
- (void)extractAudioSpecifiers;
- (void)extractBackGlassSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6;
- (void)extractBasebandSpecifiers:(id)a3;
- (void)extractBatterySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7;
- (void)extractBluetoohSpecifiers;
- (void)extractCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 srvp:(id)a7 rchlHistory:(id)a8 claimCount:(id)a9;
- (void)extractDisplaySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 srvp:(id)a6 rchlHistory:(id)a7 claimCount:(id)a8;
- (void)extractEnclosureSpecifiers:(id)a3 caaRepairHistory:(id)a4 rchlHistory:(id)a5;
- (void)extractFaceIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7;
- (void)extractMtubSpecifiers:(id)a3 caaRepairHistory:(id)a4 srvp:(id)a5 rchlHistory:(id)a6;
- (void)extractNFCSpecifiers:(id)a3;
- (void)extractRCameraHWFailureSpecifiers;
- (void)extractTouchIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6;
- (void)extractUWBSpecifiers:(id)a3;
- (void)extractWifiSpecifiers;
- (void)extractiPadBatterySpecifiers:(id)a3;
- (void)extractiPadCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 rchlHistory:(id)a7;
- (void)getCAAForRepairHistory;
- (void)performBackGroundMiniPreflight;
- (void)performInteractiveMiniPreflight;
- (void)requestCAA;
- (void)retryCAA;
- (void)scheduleNetworkActivityWith:(int64_t)a3;
- (void)setupCAARetry:(id *)a3;
- (void)setupPrivacyFooterFor:(id)a3 withPrivacySpecifier:(BOOL)a4;
- (void)showActionSheets:(id)a3;
- (void)updateSpecifiersWithCompletionHandler:(id)a3;
@end

@implementation SystemHealthUI

+ (id)sharedInstance
{
  if (qword_268A00E88 != -1) {
    dispatch_once(&qword_268A00E88, &unk_26ECC9398);
  }
  v2 = (void *)qword_268A00E80;

  return v2;
}

- (SystemHealthUI)init
{
  v18.receiver = self;
  v18.super_class = (Class)SystemHealthUI;
  v2 = [(SystemHealthUI *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->failedComponentsCount = 0;
    dispatch_queue_t v4 = dispatch_queue_create("async", MEMORY[0x263EF83A8]);
    asyncQueue = v3->asyncQueue;
    v3->asyncQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    analytics = v3->analytics;
    v3->analytics = (CRUIAnalytics *)v6;

    v3->deviceFDRVersion1 = 0;
    v3->isRepaired = 0;
    uint64_t v8 = objc_opt_new();
    localRepairHistory = v3->localRepairHistory;
    v3->localRepairHistory = (CRRepairHistory *)v8;

    v3->isRCHLDevice = [(CRRepairHistory *)v3->localRepairHistory isRCHLRepairHistoryDevice];
    if (AMFDRSealingMapGetFDRDataVersionForDevice() == 1) {
      v3->deviceFDRVersion1 = 1;
    }
    v3->isRepaired = [MEMORY[0x263F37EB8] hasHadAuthorizedRepair];
    uint64_t v10 = objc_opt_new();
    locale = v3->locale;
    v3->locale = (MRLocalization *)v10;

    v12 = (void *)MGCopyAnswer();
    v3->deviceClass = [v12 intValue];

    uint64_t v13 = [MEMORY[0x263EFF8C0] array];
    cachedSpecifiers = v3->cachedSpecifiers;
    v3->cachedSpecifiers = (NSArray *)v13;

    uint64_t v15 = MGCopyAnswer();
    batteryLevel = v3->_batteryLevel;
    v3->_batteryLevel = (NSNumber *)v15;
  }
  return v3;
}

- (void)configureSpin:(BOOL)a3 ofCellForSpecifier:(id)a4 setEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  v7 = [a4 propertyForKey:*MEMORY[0x263F602B0]];
  if (v7)
  {
    id v9 = v7;
    if (v6)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v8 startAnimating];
      [v9 setAccessoryView:v8];
    }
    else
    {
      [v7 setAccessoryView:0];
    }
    [v9 setCellEnabled:v5];
    v7 = v9;
  }
}

- (void)showActionSheets:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  [(SystemHealthUI *)v5 configureSpin:1 ofCellForSpecifier:v4 setEnabled:0];
  BOOL v6 = objc_opt_new();
  v7 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  uint64_t v8 = (void *)MEMORY[0x263F82400];
  id v9 = [v6 localizedStringWithKey:@"RESTART_AND_FINISH_REPAIR" defaultString:@"RESTART_AND_FINISH_REPAIR"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_23975AAE0;
  v22[3] = &unk_264DA02D0;
  id v10 = v6;
  id v23 = v10;
  v24 = v5;
  id v11 = v4;
  id v25 = v11;
  v12 = [v8 actionWithTitle:v9 style:2 handler:v22];
  [v7 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  v14 = [(MRLocalization *)v5->locale localizedStringWithKey:@"NOT_NOW" defaultString:@"NOT_NOW"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_23975B7DC;
  v20[3] = &unk_264DA02F8;
  v20[4] = v5;
  id v15 = v11;
  id v21 = v15;
  v16 = [v13 actionWithTitle:v14 style:1 handler:v20];
  [v7 addAction:v16];

  [(SystemHealthUI *)v5 presentViewController:v7 animated:1 completion:0];
  v17 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  uint64_t v18 = [v17 integerForKey:@"clearFinishRepairFollowup"];

  if (v18 <= 1)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
    [v19 setInteger:v18 + 1 forKey:@"clearFinishRepairFollowup"];

    notify_post("com.apple.mobilerepair.refreshui");
  }

  objc_sync_exit(v5);
}

- (int)getBatteryHealthServiceState
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v2 = IOPSGetBatteryHealthState();
  v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_23977641C(v2, v3);
  }

  return -1;
}

- (id)valueForSpecifierUnknown
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"UNKNOWN" defaultString:@"UNKNOWN"];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v2];
  id v4 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
  uint64_t v5 = [MEMORY[0x263F825C8] systemGrayColor];
  BOOL v6 = [v4 imageWithTintColor:v5];

  v7 = [v6 imageWithRenderingMode:1];

  uint64_t v8 = [MEMORY[0x263F81678] textAttachmentWithImage:v7];
  id v9 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:@" "];
  [v3 appendAttributedString:v10];

  [v3 appendAttributedString:v9];

  return v3;
}

- (id)valueForSpecifierFinishRepair
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"FINISH_REPAIR" defaultString:@"FINISH_REPAIR"];
  v3 = [v2 stringByAppendingString:@" "];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];

  return v4;
}

- (id)valueForSpecifierUsed
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"USED" defaultString:@"USED"];
  v3 = [v2 stringByAppendingString:@" "];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];

  return v4;
}

- (id)valueForSpecifierService
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"Service" defaultString:@"Service"];
  v3 = [v2 stringByAppendingString:@" "];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];

  return v4;
}

- (id)valueForSpecifierRepaired
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"GENUINE_APPLE_PART" defaultString:@"GENUINE_APPLE_PART"];
  v3 = [v2 stringByAppendingString:@" "];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];

  return v4;
}

- (id)valueForSpecifierIssue
{
  int v2 = [(MRLocalization *)self->locale localizedStringWithKey:@"PART_ISSUE" defaultString:@"PART_ISSUE"];
  v3 = [v2 stringByAppendingString:@" "];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];

  return v4;
}

- (id)valueForSpecifierPartProperty:(id)a3
{
  return @"Property";
}

- (id)valueForSpecifierPartRC:(id)a3
{
  return @"RC";
}

- (id)valueForSpecifierPartDate:(id)a3
{
  return @"Date";
}

- (id)valueForSpecifierPartData:(id)a3
{
  return @"Classes";
}

- (id)valueForSpecifierPartService:(id)a3
{
  return (id)[(MRLocalization *)self->locale localizedStringWithKey:@"Service" defaultString:@"Service"];
}

- (int64_t)getCpuUptimeInSec
{
  v6.tv_sec = 0;
  v6.tv_nsec = 0;
  int v2 = clock_gettime(_CLOCK_UPTIME_RAW, &v6);
  if (!v2) {
    return v6.tv_sec;
  }
  int v3 = v2;
  id v4 = sub_239773918(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_239776494(v3, v4);
  }

  return -1;
}

- (void)scheduleNetworkActivityWith:(int64_t)a3
{
  if (a3) {
    uint64_t v5 = @"com.apple.corerepair.preflight";
  }
  else {
    uint64_t v5 = @"com.apple.corerepair.CAA";
  }
  timespec v6 = (const char *)[(__CFString *)v5 UTF8String];
  v7 = (void *)*MEMORY[0x263EF8188];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23975BEA0;
  v8[3] = &unk_264DA0320;
  v8[4] = self;
  v8[5] = a3;
  xpc_activity_register(v6, v7, v8);
}

- (BOOL)isVaildCAA:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v17 = 0;
    uint64_t v5 = [MEMORY[0x263F37EB8] isServicePartWithError:&v17];
    id v6 = v17;
    if (v5)
    {
      v7 = sub_239773918(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239757000, v7, OS_LOG_TYPE_DEFAULT, "SrvP exists, always trust CAA", buf, 2u);
      }
      goto LABEL_18;
    }
    if ([MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:0])
    {
      id v9 = [v4 objectForKeyedSubscript:@"vcrt"];
      if (v9)
      {
      }
      else
      {
        id v10 = [v4 objectForKeyedSubscript:@"bcrt"];

        if (!v10)
        {
          v7 = sub_239773918(0);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_23977650C();
          }
          goto LABEL_27;
        }
      }
      [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"RepairUsingCAA" moduleName:@"Battery"];
    }
    if ([MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:1])
    {
      id v11 = [v4 objectForKeyedSubscript:@"drp#"];

      if (!v11)
      {
        v7 = sub_239773918(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_239776540();
        }
        goto LABEL_27;
      }
      [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"RepairUsingCAA" moduleName:@"Display"];
    }
    if (![MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:2])
    {
LABEL_17:
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
      uint64_t v14 = [v13 integerForKey:@"retryCount"];

      v7 = objc_msgSend(NSString, "stringWithFormat:", @"retryPassedCount:%ld", v14);
      [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:v7 moduleName:@"PassedRetryCount"];
LABEL_18:
      BOOL v8 = 1;
LABEL_19:

      goto LABEL_20;
    }
    v12 = [v4 objectForKeyedSubscript:@"CmCl"];

    if (v12)
    {
      [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"RepairUsingCAA" moduleName:@"Camera"];
      goto LABEL_17;
    }
    v7 = sub_239773918(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_239776574();
    }
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_19;
  }
  BOOL v8 = 0;
LABEL_20:

  return v8;
}

- (void)requestCAA
{
  int v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "Requesting CAA ...", buf, 2u);
  }

  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23975C434;
  block[3] = &unk_264DA0348;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)clearCAARequestHistory
{
  int v2 = sub_239773918(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_239757000, v2, OS_LOG_TYPE_DEFAULT, "Clearing CAA request history ...", v4, 2u);
  }

  int v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
  [v3 setInteger:0 forKey:@"backOffCount"];
  [v3 setInteger:0 forKey:@"retryCount"];
  [v3 setInteger:0 forKey:@"lastUptime"];
  [v3 setDouble:@"lastTime" forKey:0.0];
}

- (void)retryCAA
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
  uint64_t v4 = [v3 integerForKey:@"backOffCount"];
  uint64_t v5 = [v3 integerForKey:@"retryCount"];
  uint64_t v6 = [v3 integerForKey:@"lastUptime"];
  [v3 doubleForKey:@"lastTime"];
  double v8 = v7;
  int64_t v9 = [(SystemHealthUI *)self getCpuUptimeInSec];
  id v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  [v3 doubleForKey:@"timeIntervalOverride"];
  double v14 = v13;
  if ((os_variant_has_internal_content() & (v13 != 0.0)) != 0) {
    uint64_t v15 = (uint64_t)v14;
  }
  else {
    uint64_t v15 = v4;
  }
  v16 = sub_239773918(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134219264;
    uint64_t v23 = v15;
    __int16 v24 = 2048;
    uint64_t v25 = v5;
    __int16 v26 = 2048;
    uint64_t v27 = v6;
    __int16 v28 = 2048;
    int64_t v29 = v9;
    __int16 v30 = 2048;
    double v31 = v8;
    __int16 v32 = 2048;
    double v33 = v12;
    _os_log_impl(&dword_239757000, v16, OS_LOG_TYPE_DEFAULT, "Retry CAA request (BackOff: %ld RetryCount: %ld LastUptime: %ld CurrentUptime: %ld LastTime: %lf CurrentTime: %lf) ...", (uint8_t *)&v22, 0x3Eu);
  }

  if (v5 > 7)
  {
    [(CRUIAnalytics *)self->analytics sendAnalyticsForRepairHistoryMismatch];
    [(SystemHealthUI *)self clearCAARequestHistory];
    v19 = [MEMORY[0x263F37EB8] getLocalSealingManifest];
    [v3 setObject:v19 forKey:@"cachedSealingManifest"];
    [v3 synchronize];
  }
  else
  {
    if ((unint64_t)(v6 + 1) <= 1)
    {
      id v17 = sub_239773918(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v18 = "First request or uptime error, requesting CAA.";
LABEL_22:
        _os_log_impl(&dword_239757000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    uint64_t v20 = v9 - v6;
    if (v9 < v6)
    {
      id v17 = sub_239773918(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v18 = "System must have rebooted (currentUptime < lastUptime), requesting CAA.";
        goto LABEL_22;
      }
LABEL_23:

      [(SystemHealthUI *)self requestCAA];
      [v3 setInteger:v5 + 1 forKey:@"retryCount"];
      [v3 setInteger:6 * v15 + 4 forKey:@"backOffCount"];
      [v3 synchronize];
      [v3 setInteger:v9 forKey:@"lastUptime"];
      [v3 setDouble:@"lastTime" forKey:v12];
      [v3 synchronize];
      goto LABEL_24;
    }
    if (v20 >= v15)
    {
      id v17 = sub_239773918(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v18 = "Backoff time has elapsed, requesting CAA.";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    id v21 = sub_239773918(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218240;
      uint64_t v23 = (uint64_t)(v12 - v8);
      __int16 v24 = 2048;
      uint64_t v25 = v20;
      _os_log_impl(&dword_239757000, v21, OS_LOG_TYPE_DEFAULT, "intervalTime: %lld intervalUptime: %lld", (uint8_t *)&v22, 0x16u);
    }

    if (v20 + 5 < (uint64_t)(v12 - v8))
    {
      id v17 = sub_239773918(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v18 = "System must have rebooted (Uptime rolls), requesting CAA.";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
LABEL_24:
}

- (void)performBackGroundMiniPreflight
{
  if ([(SystemHealthUI *)self isPreFlightDone])
  {
    int v2 = sub_239773918(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v2, OS_LOG_TYPE_DEFAULT, "performBackGroundMiniPreflight skipped", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0;
    id v10 = buf;
    uint64_t v11 = 0x3032000000;
    double v12 = sub_23975B46C;
    double v13 = sub_23975B47C;
    id v14 = 0;
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"miniPreflight"];
    uint64_t v4 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_23975CAA8;
    v6[3] = &unk_264DA0398;
    id v7 = v3;
    double v8 = buf;
    id v5 = v3;
    dispatch_async(v4, v6);

    _Block_object_dispose(buf, 8);
  }
}

- (void)performInteractiveMiniPreflight
{
  if ([(SystemHealthUI *)self isPreFlightDone])
  {
    int v2 = sub_239773918(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v2, OS_LOG_TYPE_DEFAULT, "performInteractiveMiniPreflight skipped", buf, 2u);
    }
  }
  else
  {
    xpc_activity_unregister((const char *)[@"com.apple.corerepair.preflight" UTF8String]);
    *(void *)buf = 0;
    id v10 = buf;
    uint64_t v11 = 0x3032000000;
    double v12 = sub_23975B46C;
    double v13 = sub_23975B47C;
    id v14 = 0;
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"miniPreflight"];
    uint64_t v4 = dispatch_get_global_queue(33, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_23975CED0;
    v6[3] = &unk_264DA0398;
    id v7 = v3;
    double v8 = buf;
    id v5 = v3;
    dispatch_sync(v4, v6);

    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)isPreFlightDone
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  id v3 = [v2 objectForKey:@"tempPreflightResults"];

  return v3 != 0;
}

- (void)getCAAForRepairHistory
{
  v21[3] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26ECCFEE8 forKeyedSubscript:*MEMORY[0x263F399D0]];
  uint64_t v4 = *MEMORY[0x263F39970];
  v21[0] = *MEMORY[0x263F39968];
  v21[1] = v4;
  v21[2] = *MEMORY[0x263F399B8];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F399B0]];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_23975B46C;
  v18[4] = sub_23975B47C;
  id v19 = 0;
  uint64_t v6 = objc_opt_new();
  id v7 = dispatch_queue_create("async", MEMORY[0x263EF83A8]);
  double v8 = sub_239773918(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239757000, v8, OS_LOG_TYPE_DEFAULT, "Getting CAA for Repair History", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23975D45C;
  block[3] = &unk_264DA03E8;
  id v12 = v6;
  id v13 = v3;
  uint64_t v15 = v20;
  v16 = v18;
  id v14 = self;
  id v9 = v3;
  id v10 = v6;
  dispatch_async(v7, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (void)extractMtubSpecifiers:(id)a3 caaRepairHistory:(id)a4 srvp:(id)a5 rchlHistory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->isRCHLDevice)
  {
    BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
    if (v11 && !self->deviceFDRVersion1)
    {
      int v22 = [v11 objectForKeyedSubscript:@"SrvP"];

      if (v22)
      {
        uint64_t v23 = sub_239773918(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = 0;
          __int16 v24 = "CAA has MTUB repair history.";
          uint64_t v25 = (uint8_t *)&v31;
LABEL_16:
          _os_log_impl(&dword_239757000, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
    }
    if ((deviceFDRVersion1 || ([v12 isEqualToString:@"0"] & 1) == 0)
      && !_os_feature_enabled_impl())
    {
      goto LABEL_19;
    }
    uint64_t v23 = sub_239773918(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v24 = "Local data shows repaired history for MTUB. CAA is unavailable for now.";
      uint64_t v25 = buf;
      goto LABEL_16;
    }
LABEL_17:

    __int16 v26 = (void *)MEMORY[0x263F5FC40];
    uint64_t v27 = [(MRLocalization *)self->locale localizedStringWithKey:@"REAR_SYSTEM" defaultString:@"REAR_SYSTEM"];
    v16 = [v26 preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    __int16 v28 = [@"MTUB" stringByAppendingString:@"Repair"];
    [v16 setProperty:v28 forKey:*MEMORY[0x263F60138]];

    int64_t v29 = [(SystemHealthUI *)self valueForSpecifierRepaired];
    [v16 setProperty:v29 forKey:@"CRImageAlertKey"];

    [v16 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v10 addObject:v16];
    goto LABEL_18;
  }
  if (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"MTUB" withHistory:v13] & 1) != 0|| _os_feature_enabled_impl())
  {
    id v14 = (void *)MEMORY[0x263F5FC40];
    uint64_t v15 = [(MRLocalization *)self->locale localizedStringWithKey:@"REAR_SYSTEM" defaultString:@"REAR_SYSTEM"];
    v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    id v17 = [@"MTUB" stringByAppendingString:@"Repair"];
    [v16 setProperty:v17 forKey:*MEMORY[0x263F60138]];

    uint64_t v18 = [(SystemHealthUI *)self valueForSpecifierRepaired];
    [v16 setProperty:v18 forKey:@"CRImageAlertKey"];

    [v16 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v10 addObject:v16];
    analytics = self->analytics;
    uint64_t v20 = [@"MTUB" stringByAppendingString:@"Repair"];
    [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:@"RepairUsingRCHL" moduleName:v20];

LABEL_18:
  }
LABEL_19:
}

- (void)extractCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 srvp:(id)a7 rchlHistory:(id)a8 claimCount:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v51 = a6;
  id v50 = a7;
  id v18 = a8;
  id v19 = a9;
  int v20 = _os_feature_enabled_impl();
  id v21 = objc_opt_new();
  uint64_t v22 = [v21 copyComponentStatus];

  int v23 = [(CRRepairHistory *)self->localRepairHistory checkUsedStatusFor:@"Camera" withHistory:v18 withClaimCount:v19];
  int v24 = _os_feature_enabled_impl();
  if (v22 == -3)
  {
    uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    __int16 v26 = [@"Camera" stringByAppendingString:@"FinishRepair"];
    [v25 setProperty:v26 forKey:*MEMORY[0x263F60138]];

    uint64_t v27 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v25 setProperty:v27 forKey:@"CRImageAlertKey"];

    [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v17 addObject:v25];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"Camera"];
LABEL_7:

    goto LABEL_8;
  }
  int v28 = v24;
  if ([MEMORY[0x263F37E28] isFDRDataClassSupported:@"CmCl"])
  {
    if (v22 == -1 || (_os_feature_enabled_impl() & v20) == 1)
    {
      uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      [v25 setIdentifier:@"warningId"];
      int64_t v29 = [(SystemHealthUI *)self valueForSpecifierUnknown];
      [v25 setProperty:v29 forKey:@"CRImageAlertKey"];

      [v25 setProperty:@"Camera" forKey:*MEMORY[0x263F60138]];
      [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v16 addObject:v25];
      ++self->failedComponentsCount;
      goto LABEL_7;
    }
    int v30 = v28 & v20 | v23;
    if (self->isRCHLDevice || v22 != 1)
    {
      if (self->isRCHLDevice
        && v22 == 1
        && (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"Camera" withHistory:v18] & 1) != 0|| (_os_feature_enabled_impl() & v20) == 1))
      {
        uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        v38 = [@"Camera" stringByAppendingString:@"Repair"];
        [v25 setProperty:v38 forKey:*MEMORY[0x263F60138]];

        if (v30)
        {
          v39 = [(SystemHealthUI *)self valueForSpecifierUsed];
          [v25 setProperty:v39 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v40 = @"Used";
        }
        else
        {
          v45 = [(SystemHealthUI *)self valueForSpecifierRepaired];
          [v25 setProperty:v45 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v40 = @"Repair";
        }
        v46 = [@"Camera" stringByAppendingString:v40];
        v47 = @"RepairUsingRCHL";
LABEL_41:
        [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:v47 moduleName:v46];

        [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
        [v16 addObject:v25];
        goto LABEL_7;
      }
    }
    else
    {
      BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
      if (v51 && !self->deviceFDRVersion1)
      {
        __int16 v32 = [v51 objectForKeyedSubscript:@"CmCl"];

        if (v32)
        {
          double v33 = sub_239773918(0);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_239757000, v33, OS_LOG_TYPE_DEFAULT, "CAA has Camera repair history.", buf, 2u);
          }

          uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
          uint64_t v34 = [@"Camera" stringByAppendingString:@"Repair"];
          [v25 setProperty:v34 forKey:*MEMORY[0x263F60138]];

          if (v30)
          {
            v35 = [(SystemHealthUI *)self valueForSpecifierUsed];
            [v25 setProperty:v35 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v37 = @"Used";
          }
          else
          {
            v49 = [(SystemHealthUI *)self valueForSpecifierRepaired];
            [v25 setProperty:v49 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v37 = @"Repair";
          }
          v46 = [@"Camera" stringByAppendingString:v37];
          v47 = @"RepairUsingCAA";
          goto LABEL_41;
        }
        BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
      }
      if (!deviceFDRVersion1
        && self->isRepaired
        && [MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:2]
        && ![v50 isEqualToString:@"0"]
        || (_os_feature_enabled_impl() & v20) == 1)
      {
        v41 = sub_239773918(0);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_239757000, v41, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Camera. CAA is unavailable for now.", v52, 2u);
        }

        uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        v42 = [@"Camera" stringByAppendingString:@"Repair"];
        [v25 setProperty:v42 forKey:*MEMORY[0x263F60138]];

        if (v30)
        {
          v43 = [(SystemHealthUI *)self valueForSpecifierUsed];
          [v25 setProperty:v43 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v44 = @"Used";
        }
        else
        {
          v48 = [(SystemHealthUI *)self valueForSpecifierRepaired];
          [v25 setProperty:v48 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v44 = @"Repair";
        }
        v46 = [@"Camera" stringByAppendingString:v44];
        v47 = @"RepairUsingFDR";
        goto LABEL_41;
      }
    }
  }
LABEL_8:
}

- (void)extractiPadCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 rchlHistory:(id)a7
{
  id v15 = a3;
  id v9 = a5;
  id v10 = objc_opt_new();
  uint64_t v11 = [v10 copyComponentStatus];

  if (v11 == -3)
  {
    id v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v12 setIdentifier:@"finishRepairId"];
    id v13 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v12 setProperty:v13 forKey:@"CRImageAlertKey"];

    id v14 = [@"Camera" stringByAppendingString:@"FinishRepair"];
    [v12 setProperty:v14 forKey:*MEMORY[0x263F60138]];

    [v12 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v9 addObject:v12];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"Camera"];
  }
}

- (void)extractFaceIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7
{
  id v12 = a3;
  id v51 = a4;
  id v13 = a5;
  id v14 = a6;
  locale = self->locale;
  id v16 = a7;
  id v17 = [(MRLocalization *)locale localizedStringWithKey:@"FACEID_COMPONENT" defaultString:@"FACEID_COMPONENT"];
  v52 = [(MRLocalization *)self->locale localizedStringWithKey:@"TRUEDEPTH_COMPONENT" defaultString:@"TRUEDEPTH_COMPONENT"];
  id v18 = objc_opt_new();
  uint64_t v19 = [v18 copyComponentStatus];

  int v20 = [(CRRepairHistory *)self->localRepairHistory checkUsedStatusFor:@"FaceID" withHistory:v14 withClaimCount:v16];
  int v21 = _os_feature_enabled_impl();
  int v22 = _os_feature_enabled_impl();
  if (v19 == -1) {
    goto LABEL_5;
  }
  if (v19 == -3)
  {
    int v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    int v24 = [@"FaceID" stringByAppendingString:@"FinishRepair"];
    [v23 setProperty:v24 forKey:*MEMORY[0x263F60138]];

    [v23 setIdentifier:@"finishRepairId"];
    uint64_t v25 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v23 setProperty:v25 forKey:@"CRImageAlertKey"];

    [v23 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    __int16 v26 = v51;
    [v51 addObject:v23];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"FaceID"];

    uint64_t v27 = v12;
    goto LABEL_36;
  }
  int v28 = v22;
  if ((_os_feature_enabled_impl() & v21) == 1)
  {
LABEL_5:
    int64_t v29 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v29 setProperty:@"FaceID" forKey:*MEMORY[0x263F60138]];
    int v30 = [(SystemHealthUI *)self valueForSpecifierIssue];
    [v29 setProperty:v30 forKey:@"CRImageAlertKey"];

    [v29 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    uint64_t v27 = v12;
    [v12 addObject:v29];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"SGAViewSeen" moduleName:@"FaceID"];
    ++self->failedComponentsCount;

    __int16 v26 = v51;
    goto LABEL_36;
  }
  int v31 = v28 & v21 | v20;
  if (self->isRCHLDevice)
  {
    __int16 v26 = v51;
    uint64_t v27 = v12;
    if (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"FaceID" withHistory:v14] & 1) != 0|| (_os_feature_enabled_impl() & v21) == 1)
    {
      __int16 v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      double v33 = [@"FaceID" stringByAppendingString:@"Repair"];
      [v32 setProperty:v33 forKey:*MEMORY[0x263F60138]];

      if (v31)
      {
        uint64_t v34 = [(SystemHealthUI *)self valueForSpecifierUsed];
        [v32 setProperty:v34 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v36 = @"Used";
      }
      else
      {
        v39 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        [v32 setProperty:v39 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v36 = @"Repair";
      }
      v40 = [@"FaceID" stringByAppendingString:v36];
      v41 = @"RepairUsingRCHL";
LABEL_34:
      [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:v41 moduleName:v40];

LABEL_35:
      [v32 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v27 addObject:v32];

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
  uint64_t v27 = v12;
  if (v13 && !self->deviceFDRVersion1)
  {
    v38 = [v13 objectForKeyedSubscript:@"psd2"];
    if (v38)
    {

LABEL_18:
      v43 = sub_239773918(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239757000, v43, OS_LOG_TYPE_DEFAULT, "CAA has FaceID repair history.", buf, 2u);
      }

      __int16 v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      v44 = [@"FaceID" stringByAppendingString:@"Repair"];
      [v32 setProperty:v44 forKey:*MEMORY[0x263F60138]];

      __int16 v26 = v51;
      if (v31) {
        [(SystemHealthUI *)self valueForSpecifierUsed];
      }
      else {
      v45 = [(SystemHealthUI *)self valueForSpecifierRepaired];
      }
      [v32 setProperty:v45 forKey:@"CRImageAlertKey"];

      goto LABEL_35;
    }
    v42 = [v13 objectForKeyedSubscript:@"prpc"];

    if (v42) {
      goto LABEL_18;
    }
    BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
  }
  __int16 v26 = v51;
  if (!deviceFDRVersion1 && ([MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:5] & 1) != 0
    || (_os_feature_enabled_impl() & v21) == 1)
  {
    v46 = sub_239773918(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_239757000, v46, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Pearl. CAA is unavailable for now.", v53, 2u);
    }

    __int16 v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    v47 = [@"FaceID" stringByAppendingString:@"Repair"];
    [v32 setProperty:v47 forKey:*MEMORY[0x263F60138]];

    if (v31)
    {
      v48 = [(SystemHealthUI *)self valueForSpecifierUsed];
      [v32 setProperty:v48 forKey:@"CRImageAlertKey"];

      analytics = self->analytics;
      v49 = @"Used";
    }
    else
    {
      id v50 = [(SystemHealthUI *)self valueForSpecifierRepaired];
      [v32 setProperty:v50 forKey:@"CRImageAlertKey"];

      analytics = self->analytics;
      v49 = @"Repair";
    }
    v40 = [@"FaceID" stringByAppendingString:v49];
    v41 = @"RepairUsingFDR";
    goto LABEL_34;
  }
LABEL_36:
}

- (void)extractTouchIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MRLocalization *)self->locale localizedStringWithKey:@"TOUCH_ID_COMPONENT" defaultString:@"TOUCH_ID_COMPONENT"];
  int v15 = _os_feature_enabled_impl();
  id v16 = objc_opt_new();
  uint64_t v17 = [v16 copyComponentStatus];

  int v18 = _os_feature_enabled_impl();
  if (v17 == -1) {
    goto LABEL_5;
  }
  if (v17 == -3)
  {
    uint64_t v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    int v20 = [@"TouchID" stringByAppendingString:@"FinishRepair"];
    [v19 setProperty:v20 forKey:*MEMORY[0x263F60138]];

    [v19 setIdentifier:@"finishRepairId"];
    int v21 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v19 setProperty:v21 forKey:@"CRImageAlertKey"];

    [v19 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v11 addObject:v19];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"TouchID"];
LABEL_6:

    goto LABEL_7;
  }
  int v22 = v18;
  if ((_os_feature_enabled_impl() & v15) == 1)
  {
LABEL_5:
    uint64_t v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v19 setProperty:@"TouchID" forKey:*MEMORY[0x263F60138]];
    int v23 = [(SystemHealthUI *)self valueForSpecifierIssue];
    [v19 setProperty:v23 forKey:@"CRImageAlertKey"];

    [v19 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v10 addObject:v19];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"SGAViewSeen" moduleName:@"TouchID"];
    ++self->failedComponentsCount;
    goto LABEL_6;
  }
  int v24 = v22 & v15;
  if (self->isRCHLDevice)
  {
    if (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"TouchID" withHistory:v13] & 1) != 0|| (_os_feature_enabled_impl() & v15) == 1)
    {
      uint64_t v25 = (void *)MEMORY[0x263F5FC40];
      __int16 v26 = [(MRLocalization *)self->locale localizedStringWithKey:@"TOUCHID_REPAIR" defaultString:@"TOUCHID_REPAIR"];
      uint64_t v19 = [v25 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      uint64_t v27 = [@"TouchID" stringByAppendingString:@"Repair"];
      [v19 setProperty:v27 forKey:*MEMORY[0x263F60138]];

      if (v24)
      {
        int v28 = [(SystemHealthUI *)self valueForSpecifierUsed];
        [v19 setProperty:v28 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        int v30 = @"Used";
      }
      else
      {
        v37 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        [v19 setProperty:v37 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        int v30 = @"Repair";
      }
      v38 = [@"TouchID" stringByAppendingString:v30];
      v39 = @"RepairUsingRCHL";
LABEL_32:
      [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:v39 moduleName:v38];
LABEL_33:

      [v19 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v10 addObject:v19];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
    if (v12 && !self->deviceFDRVersion1)
    {
      __int16 v32 = [v12 objectForKeyedSubscript:@"FSCl"];

      if (v32)
      {
        double v33 = sub_239773918(0);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_239757000, v33, OS_LOG_TYPE_DEFAULT, "CAA has Pearl repair history.", buf, 2u);
        }

        uint64_t v34 = (void *)MEMORY[0x263F5FC40];
        v35 = [(MRLocalization *)self->locale localizedStringWithKey:@"TOUCHID_REPAIR" defaultString:@"TOUCHID_REPAIR"];
        uint64_t v19 = [v34 preferenceSpecifierNamed:v35 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

        v36 = [@"TouchID" stringByAppendingString:@"Repair"];
        [v19 setProperty:v36 forKey:*MEMORY[0x263F60138]];

        if (v24) {
          [(SystemHealthUI *)self valueForSpecifierUsed];
        }
        else {
        v38 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        }
        [v19 setProperty:v38 forKey:@"CRImageAlertKey"];
        goto LABEL_33;
      }
      BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
    }
    if (!deviceFDRVersion1 && ([MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:6] & 1) != 0
      || (_os_feature_enabled_impl() & v15) == 1)
    {
      v40 = sub_239773918(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_239757000, v40, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Touch ID. CAA is unavailable for now.", v47, 2u);
      }

      v41 = (void *)MEMORY[0x263F5FC40];
      v42 = [(MRLocalization *)self->locale localizedStringWithKey:@"TOUCHID_REPAIR" defaultString:@"TOUCHID_REPAIR"];
      uint64_t v19 = [v41 preferenceSpecifierNamed:v42 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      v43 = [@"TouchID" stringByAppendingString:@"Repair"];
      [v19 setProperty:v43 forKey:*MEMORY[0x263F60138]];

      if (v24)
      {
        v44 = [(SystemHealthUI *)self valueForSpecifierUsed];
        [v19 setProperty:v44 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v45 = @"Used";
      }
      else
      {
        v46 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        [v19 setProperty:v46 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v45 = @"Repair";
      }
      v38 = [@"TouchID" stringByAppendingString:v45];
      v39 = @"RepairUsingFDR";
      goto LABEL_32;
    }
  }
LABEL_7:
}

- (void)extractWifiSpecifiers
{
  id v3 = objc_opt_new();
  uint64_t v4 = [v3 copyComponentStatus];

  if (v4 == -1)
  {
    MGGetBoolAnswer();
    ++self->failedComponentsCount;
  }
}

- (void)extractDisplaySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 srvp:(id)a6 rchlHistory:(id)a7 claimCount:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v50 = a5;
  id v49 = a6;
  id v16 = a7;
  locale = self->locale;
  id v18 = a8;
  uint64_t v19 = [(MRLocalization *)locale localizedStringWithKey:@"Display" defaultString:@"Display"];
  int v20 = objc_opt_new();
  uint64_t v21 = [v20 copyComponentStatus];

  int v22 = [(CRRepairHistory *)self->localRepairHistory checkUsedStatusFor:@"Display" withHistory:v16 withClaimCount:v18];
  int v23 = _os_feature_enabled_impl();
  int v24 = _os_feature_enabled_impl();
  if (v21 == -3)
  {
    uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    __int16 v26 = [@"Display" stringByAppendingString:@"FinishRepair"];
    [v25 setProperty:v26 forKey:*MEMORY[0x263F60138]];

    [v25 setIdentifier:@"finishRepairId"];
    uint64_t v27 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v25 setProperty:v27 forKey:@"CRImageAlertKey"];

    [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v15 addObject:v25];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"Display"];
LABEL_7:

    goto LABEL_8;
  }
  int v28 = v24;
  if ([MEMORY[0x263F37E28] isFDRDataClassSupported:@"tcrt"])
  {
    if (v21 == -1 || (_os_feature_enabled_impl() & v23) == 1)
    {
      uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      [v25 setIdentifier:@"warningId"];
      int64_t v29 = [(SystemHealthUI *)self valueForSpecifierUnknown];
      [v25 setProperty:v29 forKey:@"CRImageAlertKey"];

      [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v25 setProperty:@"TouchController" forKey:*MEMORY[0x263F60138]];
      [v14 addObject:v25];
      ++self->failedComponentsCount;
      goto LABEL_7;
    }
    int v30 = v28 & v23 | v22;
    if (self->isRCHLDevice || v21 != 1)
    {
      if (self->isRCHLDevice
        && v21 == 1
        && (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"Display" withHistory:v16] & 1) != 0|| (_os_feature_enabled_impl() & v23) == 1))
      {
        uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        __int16 v32 = [@"Display" stringByAppendingString:@"Repair"];
        [v25 setProperty:v32 forKey:*MEMORY[0x263F60138]];

        if (v30)
        {
          double v33 = [(SystemHealthUI *)self valueForSpecifierUsed];
          [v25 setProperty:v33 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v35 = @"Used";
        }
        else
        {
          v47 = [(SystemHealthUI *)self valueForSpecifierRepaired];
          [v25 setProperty:v47 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v35 = @"Repair";
        }
        v41 = [@"Display" stringByAppendingString:v35];
        v42 = @"RepairUsingRCHL";
LABEL_39:
        [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:v42 moduleName:v41];

        [v25 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
        [v14 addObject:v25];
        goto LABEL_7;
      }
    }
    else
    {
      if (!v50 || self->deviceFDRVersion1)
      {
        if ((_os_feature_enabled_impl() & v23) == 1) {
          goto LABEL_22;
        }
      }
      else
      {
        int v31 = [v50 objectForKeyedSubscript:@"drp#"];
        if (v31)
        {

LABEL_22:
          v36 = sub_239773918(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_239757000, v36, OS_LOG_TYPE_DEFAULT, "CAA has Display repair history.", buf, 2u);
          }

          uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
          v37 = [@"Display" stringByAppendingString:@"Repair"];
          [v25 setProperty:v37 forKey:*MEMORY[0x263F60138]];

          if (v30)
          {
            v38 = [(SystemHealthUI *)self valueForSpecifierUsed];
            [v25 setProperty:v38 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v39 = @"Used";
          }
          else
          {
            v40 = [(SystemHealthUI *)self valueForSpecifierRepaired];
            [v25 setProperty:v40 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v39 = @"Repair";
          }
          v41 = [@"Display" stringByAppendingString:v39];
          v42 = @"RepairUsingCAA";
          goto LABEL_39;
        }
        if (_os_feature_enabled_impl() & v23) {
          goto LABEL_22;
        }
      }
      if (!self->deviceFDRVersion1
        && self->isRepaired
        && [MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:1]
        && ([v49 isEqualToString:@"0"] & 1) == 0)
      {
        v43 = sub_239773918(0);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v51 = 0;
          _os_log_impl(&dword_239757000, v43, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Display. CAA is unavailable for now.", v51, 2u);
        }

        uint64_t v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        v44 = [@"Display" stringByAppendingString:@"Repair"];
        [v25 setProperty:v44 forKey:*MEMORY[0x263F60138]];

        if (v30)
        {
          v45 = [(SystemHealthUI *)self valueForSpecifierUsed];
          [v25 setProperty:v45 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v46 = @"Used";
        }
        else
        {
          v48 = [(SystemHealthUI *)self valueForSpecifierRepaired];
          [v25 setProperty:v48 forKey:@"CRImageAlertKey"];

          analytics = self->analytics;
          v46 = @"Repair";
        }
        v41 = [@"Display" stringByAppendingString:v46];
        v42 = @"RepairUsingFDR";
        goto LABEL_39;
      }
    }
  }
LABEL_8:
}

- (void)extractiPadBatterySpecifiers:(id)a3
{
  id v8 = a3;
  int v4 = [(SystemHealthUI *)self getBatteryHealthServiceState];
  id v5 = [(MRLocalization *)self->locale localizedStringWithKey:@"Battery" defaultString:@"Battery"];
  if (v4 == 3)
  {
    uint64_t v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [v6 setIdentifier:@"NeedsService"];
    id v7 = [(SystemHealthUI *)self valueForSpecifierService];
    [v6 setProperty:v7 forKey:@"CRImageAlertKey"];

    [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v6 setProperty:@"NeedsService" forKey:*MEMORY[0x263F60138]];
    [v8 addObject:v6];
  }
}

- (void)extractBatterySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7
{
  id v59 = a3;
  id v57 = a4;
  id v58 = a5;
  id v12 = a6;
  id v13 = a7;
  int v14 = [(SystemHealthUI *)self getBatteryHealthServiceState];
  uint64_t v15 = [(MRLocalization *)self->locale localizedStringWithKey:@"Battery" defaultString:@"Battery"];
  id v16 = objc_opt_new();
  uint64_t v17 = [v16 copyComponentStatus];

  id v18 = v12;
  int v19 = [(CRRepairHistory *)self->localRepairHistory checkUsedStatusFor:@"Battery" withHistory:v12 withClaimCount:v13];

  int v20 = _os_feature_enabled_impl();
  int v21 = _os_feature_enabled_impl();
  if (v17 == -1) {
    goto LABEL_5;
  }
  if (v17 == -3)
  {
    int v22 = (void *)v15;
    int v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    int v24 = [@"Battery" stringByAppendingString:@"FinishRepair"];
    [v23 setProperty:v24 forKey:*MEMORY[0x263F60138]];

    [v23 setIdentifier:@"finishRepairId"];
    uint64_t v25 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v23 setProperty:v25 forKey:@"CRImageAlertKey"];

    [v23 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    __int16 v26 = v57;
    [v57 addObject:v23];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"Battery"];

    int v28 = v58;
    uint64_t v27 = v59;
    goto LABEL_7;
  }
  int v29 = v21;
  if ((_os_feature_enabled_impl() & v21) == 1)
  {
LABEL_5:
    int v22 = (void *)v15;
    int v30 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v30 setIdentifier:@"warningId"];
    int v31 = [(SystemHealthUI *)self valueForSpecifierUnknown];
    [v30 setProperty:v31 forKey:@"CRImageAlertKey"];

    [v30 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v30 setProperty:@"Battery" forKey:*MEMORY[0x263F60138]];
    uint64_t v27 = v59;
    [v59 addObject:v30];
    ++self->failedComponentsCount;
LABEL_6:

    __int16 v26 = v57;
    int v28 = v58;
    goto LABEL_7;
  }
  if (v14 == 3)
  {
    int v22 = (void *)v15;
    int v30 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [v30 setIdentifier:@"NeedsService"];
    __int16 v32 = [(SystemHealthUI *)self valueForSpecifierService];
    [v30 setProperty:v32 forKey:@"CRImageAlertKey"];

    [v30 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v30 setProperty:@"NeedsService" forKey:*MEMORY[0x263F60138]];
    uint64_t v27 = v59;
    [v59 addObject:v30];
    goto LABEL_6;
  }
  int v33 = v20 | v19;
  if (self->isRCHLDevice || v17 != 1)
  {
    int v56 = v20 | v19;
    __int16 v26 = v57;
    int v28 = v58;
    uint64_t v27 = v59;
    int v22 = (void *)v15;
    if (self->isRCHLDevice
      && v17 == 1
      && (([(CRRepairHistory *)self->localRepairHistory hasHadRCHLBasedRepairForComponent:@"Battery" withHistory:v18] & 1) != 0|| (_os_feature_enabled_impl() & v29) == 1))
    {
      v38 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      v43 = [@"Battery" stringByAppendingString:@"Repair"];
      [v38 setProperty:v43 forKey:*MEMORY[0x263F60138]];

      if (v56)
      {
        v44 = [(SystemHealthUI *)self valueForSpecifierUsed];
        [v38 setProperty:v44 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v45 = @"Used";
      }
      else
      {
        v53 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        [v38 setProperty:v53 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v45 = @"Repair";
      }
      v47 = [@"Battery" stringByAppendingString:v45];
      v48 = @"RepairUsingRCHL";
LABEL_43:
      [(CRUIAnalytics *)analytics sendAsyncAnalyticsForEventIfNeeded:v48 moduleName:v47];

      [v38 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      uint64_t v27 = v59;
      [v59 addObject:v38];
    }
  }
  else
  {
    BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
    __int16 v26 = v57;
    int v28 = v58;
    uint64_t v27 = v59;
    if (v58)
    {
      int v35 = v33;
      if (!self->deviceFDRVersion1)
      {
        v36 = [v58 objectForKeyedSubscript:@"vcrt"];
        if (v36
          || ([v58 objectForKeyedSubscript:@"bcrt"],
              (v36 = objc_claimAutoreleasedReturnValue()) != 0))
        {

          int v22 = (void *)v15;
LABEL_17:
          v37 = sub_239773918(0);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_239757000, v37, OS_LOG_TYPE_DEFAULT, "CAA has Battery repair history.", buf, 2u);
          }

          v38 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
          v39 = [@"Battery" stringByAppendingString:@"Repair"];
          [v38 setProperty:v39 forKey:*MEMORY[0x263F60138]];

          if (v35)
          {
            v40 = [(SystemHealthUI *)self valueForSpecifierUsed];
            [v38 setProperty:v40 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v42 = @"Used";
          }
          else
          {
            v46 = [(SystemHealthUI *)self valueForSpecifierRepaired];
            [v38 setProperty:v46 forKey:@"CRImageAlertKey"];

            analytics = self->analytics;
            v42 = @"Repair";
          }
          v47 = [@"Battery" stringByAppendingString:v42];
          v48 = @"RepairUsingCAA";
          goto LABEL_43;
        }
        v55 = [v58 objectForKeyedSubscript:@"SrvP"];

        int v22 = (void *)v15;
        if (v55) {
          goto LABEL_17;
        }
        BOOL deviceFDRVersion1 = self->deviceFDRVersion1;
        uint64_t v27 = v59;
      }
    }
    else
    {
      int v35 = v33;
    }
    int v22 = (void *)v15;
    if (!deviceFDRVersion1
      && self->isRepaired
      && ([MEMORY[0x263F37EB8] hasHadAuthorizedRepairForComponent:0] & 1) != 0
      || (_os_feature_enabled_impl() & v29) == 1)
    {
      id v49 = sub_239773918(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_239757000, v49, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Battery. CAA is unavailable for now.", v60, 2u);
      }

      v38 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      id v50 = [@"Battery" stringByAppendingString:@"Repair"];
      [v38 setProperty:v50 forKey:*MEMORY[0x263F60138]];

      if (v35)
      {
        id v51 = [(SystemHealthUI *)self valueForSpecifierUsed];
        [v38 setProperty:v51 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v52 = @"Used";
      }
      else
      {
        v54 = [(SystemHealthUI *)self valueForSpecifierRepaired];
        [v38 setProperty:v54 forKey:@"CRImageAlertKey"];

        analytics = self->analytics;
        v52 = @"Repair";
      }
      v47 = [@"Battery" stringByAppendingString:v52];
      v48 = @"RepairUsingFDR";
      goto LABEL_43;
    }
  }
LABEL_7:
}

- (void)extractAudioSpecifiers
{
  id v3 = objc_opt_new();
  uint64_t v4 = [v3 copyComponentStatus];

  if (v4 == -1) {
    ++self->failedComponentsCount;
  }
  id v5 = objc_opt_new();
  uint64_t v6 = [v5 copyComponentStatus];

  if (v6 == -1) {
    ++self->failedComponentsCount;
  }
}

- (void)extractRCameraHWFailureSpecifiers
{
  id v3 = objc_opt_new();
  uint64_t v4 = [v3 copyComponentStatus];

  if (v4 == -1) {
    ++self->failedComponentsCount;
  }
}

- (void)setupCAARetry:(id *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
  uint64_t v6 = [v5 objectForKey:@"cachedSealingManifest"];

  id v7 = [MEMORY[0x263F37EB8] getLocalSealingManifest];
  if (!self->deviceFDRVersion1 && self->isRepaired)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
    id v8 = [v9 objectForKey:@"cachedCAACert"];

    if (v8 && [v8 length])
    {
      *a3 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:0];
    }
    if ([v7 isEqualToData:v6])
    {
      id v10 = sub_239773918(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "Local sealing data matches cached one. CAA has been requested before. Skipping ...", buf, 2u);
      }

      goto LABEL_19;
    }
    id v11 = sub_239773918(0);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v12)
      {
        __int16 v16 = 0;
        id v13 = "Requesting CAA due to local and cached sealing data mismatch ...";
        int v14 = (uint8_t *)&v16;
LABEL_17:
        _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      }
    }
    else if (v12)
    {
      *(_WORD *)uint64_t v17 = 0;
      id v13 = "Requesting CAA due to no cached sealing data ...";
      int v14 = v17;
      goto LABEL_17;
    }

    [(SystemHealthUI *)self retryCAA];
    goto LABEL_19;
  }
  id v8 = sub_239773918(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_239757000, v8, OS_LOG_TYPE_DEFAULT, "FDR data indicates no repair happened on this device.", v15, 2u);
  }
LABEL_19:
}

- (void)extractBluetoohSpecifiers
{
  id v3 = objc_opt_new();
  uint64_t v4 = [v3 copyComponentStatus];

  if (v4 == -1) {
    ++self->failedComponentsCount;
  }
}

- (void)extractBasebandSpecifiers:(id)a3
{
  id v10 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 copyComponentStatus];

  if (v5 == -1)
  {
    uint64_t v6 = (void *)MEMORY[0x263F5FC40];
    id v7 = [(MRLocalization *)self->locale localizedStringWithKey:@"Baseband" defaultString:@"Baseband"];
    id v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v8 setProperty:@"Baseband" forKey:*MEMORY[0x263F60138]];
    id v9 = [(SystemHealthUI *)self valueForSpecifierIssue];
    [v8 setProperty:v9 forKey:@"CRImageAlertKey"];

    [v8 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v10 addObject:v8];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"SGAViewSeen" moduleName:@"Baseband"];
    ++self->failedComponentsCount;
  }
}

- (void)extractBackGlassSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6
{
  id v13 = a4;
  id v7 = [(MRLocalization *)self->locale localizedStringWithKey:@"BACK_GLASS" defaultString:@"BACK_GLASS"];
  id v8 = objc_opt_new();
  uint64_t v9 = [v8 copyComponentStatus];

  if (v9 == -3)
  {
    id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    id v11 = [@"BackGlass" stringByAppendingString:@"FinishRepair"];
    [v10 setProperty:v11 forKey:*MEMORY[0x263F60138]];

    [v10 setIdentifier:@"finishRepairId"];
    BOOL v12 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v10 setProperty:v12 forKey:@"CRImageAlertKey"];

    [v10 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v13 addObject:v10];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"BackGlass"];
  }
}

- (void)extractEnclosureSpecifiers:(id)a3 caaRepairHistory:(id)a4 rchlHistory:(id)a5
{
  id v12 = a3;
  uint64_t v6 = [(MRLocalization *)self->locale localizedStringWithKey:@"ENCLOSURE" defaultString:@"ENCLOSURE"];
  id v7 = objc_opt_new();
  uint64_t v8 = [v7 copyComponentStatus];

  if (v8 == -3)
  {
    uint64_t v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    id v10 = [@"Enclosure" stringByAppendingString:@"FinishRepair"];
    [v9 setProperty:v10 forKey:*MEMORY[0x263F60138]];

    [v9 setIdentifier:@"finishRepairId"];
    id v11 = [(SystemHealthUI *)self valueForSpecifierFinishRepair];
    [v9 setProperty:v11 forKey:@"CRImageAlertKey"];

    [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v12 addObject:v9];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"FinishRepair" moduleName:@"Enclosure"];
  }
}

- (void)extractNFCSpecifiers:(id)a3
{
  id v9 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 copyComponentStatus];

  if (v5 == -1)
  {
    uint64_t v6 = [(MRLocalization *)self->locale localizedStringWithKey:@"NFC" defaultString:@"NFC"];
    id v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v7 setProperty:@"NFC" forKey:*MEMORY[0x263F60138]];
    uint64_t v8 = [(SystemHealthUI *)self valueForSpecifierIssue];
    [v7 setProperty:v8 forKey:@"CRImageAlertKey"];

    [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v9 addObject:v7];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"SGAViewSeen" moduleName:@"NFC"];
    ++self->failedComponentsCount;
  }
}

- (void)extractUWBSpecifiers:(id)a3
{
  id v9 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 copyComponentStatus];

  if (v5 == -1)
  {
    uint64_t v6 = [(MRLocalization *)self->locale localizedStringWithKey:@"UWB" defaultString:@"UWB"];
    id v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v7 setProperty:@"UWB" forKey:*MEMORY[0x263F60138]];
    uint64_t v8 = [(SystemHealthUI *)self valueForSpecifierIssue];
    [v7 setProperty:v8 forKey:@"CRImageAlertKey"];

    [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v9 addObject:v7];
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:@"SGAViewSeen" moduleName:@"UWB"];
    ++self->failedComponentsCount;
  }
}

- (id)setupGroupSpecifer
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [(MRLocalization *)self->locale localizedStringWithKey:@"SERVICE_HISTORY" defaultString:@"SERVICE_HISTORY"];
  uint64_t v5 = [v3 groupSpecifierWithName:v4];

  uint64_t v6 = [(MRLocalization *)self->locale localizedStringWithKey:@"PART_SERVICE_HISTORY_URL" defaultString:@"PART_SERVICE_HISTORY_URL"];
  if ([(CRRepairHistory *)self->localRepairHistory isSupportedIPad])
  {
    uint64_t v7 = [(MRLocalization *)self->locale localizedStringWithKey:@"PART_SERVICE_HISTORY_URL_IPAD" defaultString:@"PART_SERVICE_HISTORY_URL_IPAD"];

    uint64_t v6 = (void *)v7;
  }
  [v5 setProperty:@"COMPONENT_GROUP" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:v6 forKey:*MEMORY[0x263F600F0]];

  return v5;
}

- (BOOL)hasUnsealedComponents
{
  int v2 = objc_opt_new();
  if ([v2 copyComponentStatus] == -3)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    if ([v4 copyComponentStatus] == -3)
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v5 = objc_opt_new();
      if ([v5 copyComponentStatus] == -3)
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v6 = objc_opt_new();
        if ([v6 copyComponentStatus] == -3)
        {
          BOOL v3 = 1;
        }
        else
        {
          uint64_t v7 = objc_opt_new();
          if ([v7 copyComponentStatus] == -3)
          {
            BOOL v3 = 1;
          }
          else
          {
            uint64_t v8 = objc_opt_new();
            if ([v8 copyComponentStatus] == -3)
            {
              BOOL v3 = 1;
            }
            else
            {
              id v9 = objc_opt_new();
              BOOL v3 = [v9 copyComponentStatus] == -3;
            }
          }
        }
      }
    }
  }

  return v3;
}

- (id)getCurrentSystemHealthInfoSpecifiers
{
  return self->cachedSpecifiers;
}

- (id)reloadCurrentSystemHealthInfoSpecifiers
{
  if ([(CRRepairHistory *)self->localRepairHistory isSupportedIPad])
  {
    BOOL v3 = sub_239773918(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }
  }
  else if (self->deviceClass != 1)
  {
    id v11 = 0;
    goto LABEL_10;
  }
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(SystemHealthUI *)self getCurrentDetailsWithPrivacySpecifier:0];
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    uint64_t v7 = *MEMORY[0x263F60138];
    [v6 setObject:@"PARTS_AND_SERVICE_GROUP" forKeyedSubscript:*MEMORY[0x263F60138]];
    uint64_t v8 = (void *)MEMORY[0x263F5FC40];
    id v9 = [(MRLocalization *)self->locale localizedStringWithKey:@"PARTS_AND_SERVICE_HISTORY" defaultString:@"PARTS_AND_SERVICE_HISTORY"];
    id v10 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v10 setObject:@"MAIN_PARTS_AND_SERVICE" forKeyedSubscript:v7];
    [v4 addObject:v6];
    [v4 addObject:v10];
  }
  id v11 = v4;

LABEL_10:

  return v11;
}

- (void)setupPrivacyFooterFor:(id)a3 withPrivacySpecifier:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4
    && +[MRDataCollectionNotice shouldShowDataCollectionNoticeForComponent:10])
  {
    uint64_t v7 = [(MRLocalization *)self->locale localizedStringWithKey:@"INFORMATION_COLLECTION_TEXT" defaultString:@"INFORMATION_COLLECTION_TEXT"];
    uint64_t v8 = *MEMORY[0x263F600F8];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    if (self->deviceClass == 3)
    {
      id v9 = [(MRLocalization *)self->locale localizedStringWithKey:@"INFORMATION_COLLECTION_TEXT_IPAD" defaultString:@"INFORMATION_COLLECTION_TEXT_IPAD"];
      [v6 setProperty:v9 forKey:v8];
    }
    +[MRDataCollectionNotice didShowDataCollectionNoticeForComponent:10];
LABEL_10:
    [(SystemHealthUI *)self scheduleNetworkActivityWith:1];
    goto LABEL_11;
  }
  id v10 = sub_239773918(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "Do not need to show data collection specifier", v11, 2u);
  }

  if ([(SystemHealthUI *)self hasUnsealedComponents]
    && ![(SystemHealthUI *)self isPreFlightDone])
  {
    goto LABEL_10;
  }
LABEL_11:
}

- (id)getCurrentDetailsWithPrivacySpecifier:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v70 = *MEMORY[0x263EF8340];
  self->failedComponentsCount = 0;
  localRepairHistory = self->localRepairHistory;
  id v65 = 0;
  id v6 = [(CRRepairHistory *)localRepairHistory extractRCHLRepairHistoryAndClaimCount:&v65];
  id v7 = v65;
  uint64_t v8 = sub_239773918(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v67 = v7;
    _os_log_impl(&dword_239757000, v8, OS_LOG_TYPE_DEFAULT, "claimcount:%@", buf, 0xCu);
  }

  if ([(CRRepairHistory *)self->localRepairHistory isSupportedIPad])
  {
    id v9 = sub_239773918(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v9, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }
  }
  else if (self->deviceClass != 1)
  {
    uint64_t v27 = 0;
    int v28 = 0;
    id v10 = 0;
    id v43 = 0;
    goto LABEL_42;
  }
  id v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  v52 = objc_opt_new();
  v53 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
  id v12 = [(CRRepairHistory *)self->localRepairHistory getUseCountExceptionsWith:v7];
  id v13 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2397624D0;
  block[3] = &unk_264DA0410;
  id v51 = v12;
  id v62 = v51;
  v63 = self;
  id v14 = v7;
  id v64 = v14;
  dispatch_async(v13, block);

  id v60 = 0;
  id v58 = [MEMORY[0x263F37EB8] isServicePartWithError:&v60];
  id v15 = v60;
  __int16 v16 = sub_239773918(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v67 = v58;
    __int16 v68 = 2112;
    id v69 = v15;
    _os_log_impl(&dword_239757000, v16, OS_LOG_TYPE_DEFAULT, "SrvP: %@ error: %@", buf, 0x16u);
  }
  id v48 = v14;

  int v56 = [(MRLocalization *)self->locale localizedStringWithKey:@"Camera" defaultString:@"Camera"];
  id v54 = v7;
  id v50 = v15;
  BOOL v47 = v3;
  uint64_t v17 = (void *)v11;
  if (v3 && !self->isRCHLDevice)
  {
    id v18 = v6;
    id v59 = 0;
    [(SystemHealthUI *)self setupCAARetry:&v59];
    id v19 = v59;
  }
  else
  {
    id v18 = v6;
    id v19 = 0;
  }
  v55 = [(SystemHealthUI *)self setupGroupSpecifer];
  int v20 = (void *)MEMORY[0x263F5FC40];
  int v21 = [(MRLocalization *)self->locale localizedStringWithKey:@"CONFIGURATION_AVAILABLE" defaultString:@"CONFIGURATION_AVAILABLE"];
  int v22 = [v20 groupSpecifierWithName:v21];

  id v57 = v22;
  [v22 setIdentifier:@"CONFIGURATION_AVAILABLE"];
  int v23 = (void *)MEMORY[0x263F5FC40];
  int v24 = [(MRLocalization *)self->locale localizedStringWithKey:@"RESTART_FINISH_REPAIR" defaultString:@"RESTART_FINISH_REPAIR"];
  uint64_t v25 = +[SystemHealthUI sharedInstance];
  __int16 v26 = [v23 preferenceSpecifierNamed:v24 target:v25 set:0 get:0 detail:0 cell:13 edit:0];

  [v26 setIdentifier:@"PARTSBUTTON"];
  id v6 = v18;
  uint64_t v27 = v19;
  int v28 = v17;
  if (self->deviceClass == 1)
  {
    [(SystemHealthUI *)self extractBatterySpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18 claimCount:v48];
    [(SystemHealthUI *)self extractBackGlassSpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18];
    [(SystemHealthUI *)self extractEnclosureSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18];
    [(SystemHealthUI *)self extractMtubSpecifiers:v10 caaRepairHistory:v27 srvp:v58 rchlHistory:v18];
    [(SystemHealthUI *)self extractCameraSpecifiers:v56 componentsInfoSpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 srvp:v58 rchlHistory:v18 claimCount:v48];
  }
  [(SystemHealthUI *)self extractDisplaySpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 srvp:v58 rchlHistory:v18 claimCount:v48];
  [(SystemHealthUI *)self extractBluetoohSpecifiers];
  [(SystemHealthUI *)self extractWifiSpecifiers];
  [(SystemHealthUI *)self extractBasebandSpecifiers:v10];
  [(SystemHealthUI *)self extractNFCSpecifiers:v10];
  [(SystemHealthUI *)self extractUWBSpecifiers:v10];
  [(SystemHealthUI *)self extractAudioSpecifiers];
  if (MGGetBoolAnswer()) {
    [(SystemHealthUI *)self extractFaceIDSpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18 claimCount:v48];
  }
  [(SystemHealthUI *)self extractRCameraHWFailureSpecifiers];
  int v29 = v57;
  if (self->deviceClass == 3)
  {
    [(SystemHealthUI *)self extractiPadBatterySpecifiers:v10];
    [(SystemHealthUI *)self extractiPadCameraSpecifiers:v56 componentsInfoSpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18];
    if (MGGetBoolAnswer()) {
      [(SystemHealthUI *)self extractTouchIDSpecifiers:v10 configurationSpecifiers:v17 caaRepairHistory:v27 rchlHistory:v18];
    }
  }
  if ([v17 count] || objc_msgSend(v10, "count"))
  {
    if ([v17 count])
    {
      [v26 setButtonAction:sel_showActionSheets_];
      if ([(NSNumber *)self->_batteryLevel intValue] <= 19)
      {
        [v26 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
        int v30 = [(MRLocalization *)self->locale localizedStringWithKey:@"BATTERY_ERROR" defaultString:@"BATTERY_ERROR"];
        uint64_t v31 = *MEMORY[0x263F600F8];
        [v57 setProperty:v30 forKey:*MEMORY[0x263F600F8]];

        int v29 = v57;
        if (self->deviceClass == 3)
        {
          __int16 v32 = [(MRLocalization *)self->locale localizedStringWithKey:@"BATTERY_ERROR_IPAD" defaultString:@"BATTERY_ERROR_IPAD"];
          [v57 setProperty:v32 forKey:v31];

          int v29 = v57;
        }
      }
      [(SystemHealthUI *)self setupPrivacyFooterFor:v29 withPrivacySpecifier:v47];
      [v52 addObject:v29];
      if ([v28 count] == 1
        && ([v28 objectAtIndexedSubscript:0],
            int v33 = objc_claimAutoreleasedReturnValue(),
            uint64_t v34 = [v33 detailControllerClass],
            v33,
            v34))
      {
        id v49 = v26;
        int v35 = [v28 objectAtIndexedSubscript:0];
        [v35 detailControllerClass];
        v36 = objc_opt_new();

        v37 = [v36 componentName];
        [v36 setTitleText:v37];

        v38 = [(MRLocalization *)self->locale localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
        v39 = NSString;
        v40 = [v36 informativeText];
        v41 = [v39 stringWithFormat:@"%@ %@", v40, v38];
        [v36 setInformativeText:v41];

        [v36 setFooterText:0];
        v42 = [v36 specifiers];
        if (v42) {
          [v52 addObjectsFromArray:v42];
        }

        __int16 v26 = v49;
      }
      else
      {
        [v52 addObjectsFromArray:v28];
      }
      [v52 addObject:v26];
      int v29 = v57;
      if (![v10 count]) {
        goto LABEL_38;
      }
    }
    else
    {
      if (![v10 count])
      {
LABEL_38:
        v44 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
        [v44 setBool:1 forKey:@"settingsView"];

        goto LABEL_39;
      }
      [(SystemHealthUI *)self setupPrivacyFooterFor:v55 withPrivacySpecifier:v47];
    }
    [v52 addObject:v55];
    [v52 addObjectsFromArray:v10];
    goto LABEL_38;
  }
LABEL_39:
  if (self->failedComponentsCount)
  {
    v45 = objc_msgSend(NSString, "stringWithFormat:", @"FailedComponentsCount:%d", self->failedComponentsCount);
    [(CRUIAnalytics *)self->analytics sendAsyncAnalyticsForEventIfNeeded:v45 moduleName:@"FailedComponentsCount"];
  }
  id v43 = v52;

  id v7 = v54;
LABEL_42:

  return v43;
}

- (void)updateSpecifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "updateSpecifiersWithCompletionHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23976282C;
  v8[3] = &unk_264DA0488;
  objc_copyWeak(&v10, buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (id)findSpecifierToInsertAfter:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v12 = [(SystemHealthUI *)self parentViewController];
    id v6 = [v12 specifiers];

    if (v6) {
      goto LABEL_3;
    }
LABEL_11:
    id v13 = sub_239773918(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_239776654();
    }
    id v7 = 0;
    goto LABEL_23;
  }
  id v6 = [v4 specifiers];
  if (!v6) {
    goto LABEL_11;
  }
LABEL_3:
  if (![v6 count])
  {
LABEL_20:
    id v7 = 0;
    goto LABEL_21;
  }
  id v7 = 0;
  while (1)
  {
    uint64_t v8 = [v6 objectAtIndexedSubscript:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v9 = [v8 identifier];
    if ([v9 isEqualToString:@"INFORMATION_GROUP"]) {
      break;
    }
    id v10 = [v8 identifier];
    int v11 = [v10 isEqualToString:@"PARTS_AND_SERVICE_GROUP"];

    if (v11) {
      goto LABEL_15;
    }
LABEL_8:

    if ((unint64_t)++v7 >= [v6 count]) {
      goto LABEL_18;
    }
  }

LABEL_15:
  id v14 = sub_239773918(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    int v20 = v8;
    _os_log_impl(&dword_239757000, v14, OS_LOG_TYPE_DEFAULT, "Anchor specifier %@", (uint8_t *)&v19, 0xCu);
  }

  if (!v7) {
    goto LABEL_21;
  }
LABEL_18:
  id v15 = v7 - 1;
  __int16 v16 = [v6 objectAtIndexedSubscript:v15];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_20;
  }
  id v7 = [v6 objectAtIndexedSubscript:v15];
LABEL_21:
  id v13 = sub_239773918(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    int v20 = v7;
    _os_log_impl(&dword_239757000, v13, OS_LOG_TYPE_DEFAULT, "Insert after %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_23:

  return v7;
}

- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = sub_239773918(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    cachedSpecifiers = self->cachedSpecifiers;
    int v14 = 138412546;
    id v15 = cachedSpecifiers;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, "Updating specifiers: %@ -> %@", (uint8_t *)&v14, 0x16u);
  }

  [v9 removeSpecifierWithID:@"PARTS_AND_SERVICE_GROUP"];
  [v9 removeSpecifierWithID:@"MAIN_PARTS_AND_SERVICE"];
  [v9 insertContiguousSpecifiers:v8 afterSpecifier:v10];

  id v13 = v8;
  if (!v8)
  {
    id v13 = [MEMORY[0x263EFF8C0] array];
  }
  objc_storeStrong((id *)&self->cachedSpecifiers, v13);
  if (!v8) {
}
  }

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->cachedSpecifiers, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->localRepairHistory, 0);
  objc_storeStrong((id *)&self->analytics, 0);

  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end