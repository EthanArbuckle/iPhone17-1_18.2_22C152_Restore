@interface MRBaseComponentHandler
+ (id)getHwRevision;
+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9;
- (BOOL)clearStateFile:(BOOL *)a3;
- (BOOL)disableUIForComponent;
- (BOOL)displayFollowup;
- (BOOL)displayModalPopup;
- (BOOL)displayNotification;
- (BOOL)isSUCaseForComponent;
- (BOOL)legacyPopup;
- (BOOL)notifyServer;
- (BOOL)supportsRepair;
- (BOOL)unlockCheckActivityRequired;
- (MRBaseComponentHandler)init;
- (NSString)componentDataCollectionPresentedKey;
- (NSString)componentEnableNonAuthUIKey;
- (NSString)componentFirstUIDisplayedTimeKey;
- (NSString)componentFollowupClientID;
- (NSString)componentForceKey;
- (NSString)componentHasDisplayedFollowUpKey;
- (NSString)componentHasNotifiedServerKey;
- (NSString)componentLastCheckTimeKey;
- (NSString)componentName;
- (NSString)componentNtwkActivityName;
- (NSString)componentRetriggerCountKey;
- (NSString)componentSUCaseKey;
- (NSString)componentStatusKey;
- (NSString)componentUnLockCheckCountKey;
- (NSString)componentUnlockCheckerActivityName;
- (NSString)finishRepairKey;
- (NSString)finishRepairMessage;
- (NSString)finishRepairTitle;
- (NSString)followUpInfoMessage;
- (NSString)lastKnownComponentIdentifierKey;
- (NSString)lastKnownComponentIdentifierValue;
- (NSString)popUpNotificationMessage;
- (NSString)popUpNotificationTitle;
- (NSString)stateFilePath;
- (NSURL)linkedSensitiveURL;
- (double)timeIntervalOverride;
- (id)componentAuthHandler;
- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3;
- (int)componentFollowupRetriggerdays;
- (int)componentfollowUpDisplaydays;
- (int)deviceClass;
- (int64_t)componentId;
- (void)checkInAndHandleAuthStatus;
- (void)clearNSUserDefaults;
- (void)clearRepairFollowUp;
- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3;
- (void)createRepairFollowUp;
- (void)mainNonAuthRepairFlow;
- (void)popUpNotificationNowWithMessage;
- (void)scheduleNetworkActivity;
- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4;
- (void)sendAnalyticsForCount:(int64_t)a3;
- (void)setComponentAuthHandler:(id)a3;
- (void)setComponentDataCollectionPresentedKey:(id)a3;
- (void)setComponentEnableNonAuthUIKey:(id)a3;
- (void)setComponentFirstUIDisplayedTimeKey:(id)a3;
- (void)setComponentFollowupClientID:(id)a3;
- (void)setComponentFollowupRetriggerdays:(int)a3;
- (void)setComponentForceKey:(id)a3;
- (void)setComponentHasDisplayedFollowUpKey:(id)a3;
- (void)setComponentHasNotifiedServerKey:(id)a3;
- (void)setComponentId:(int64_t)a3;
- (void)setComponentLastCheckTimeKey:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentNtwkActivityName:(id)a3;
- (void)setComponentRetriggerCountKey:(id)a3;
- (void)setComponentSUCaseKey:(id)a3;
- (void)setComponentStatusKey:(id)a3;
- (void)setComponentUnLockCheckCountKey:(id)a3;
- (void)setComponentUnlockCheckerActivityName:(id)a3;
- (void)setComponentfollowUpDisplaydays:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDisableUIForComponent:(BOOL)a3;
- (void)setDisplayFollowup:(BOOL)a3;
- (void)setDisplayModalPopup:(BOOL)a3;
- (void)setDisplayNotification:(BOOL)a3;
- (void)setFinishRepairKey:(id)a3;
- (void)setFinishRepairMessage:(id)a3;
- (void)setFinishRepairTitle:(id)a3;
- (void)setFollowUpInfoMessage:(id)a3;
- (void)setIsSUCaseForComponent:(BOOL)a3;
- (void)setLastKnownComponentIdentifierKey:(id)a3;
- (void)setLastKnownComponentIdentifierValue:(id)a3;
- (void)setLegacyPopup:(BOOL)a3;
- (void)setLinkedSensitiveURL:(id)a3;
- (void)setNotifyServer:(BOOL)a3;
- (void)setPopUpNotificationMessage:(id)a3;
- (void)setPopUpNotificationTitle:(id)a3;
- (void)setStateFilePath:(id)a3;
- (void)setSupportsRepair:(BOOL)a3;
- (void)setTimeIntervalOverride:(double)a3;
- (void)setUnlockCheckActivityRequired:(BOOL)a3;
- (void)unlockCheckerActivityBody;
- (void)unlockCheckerActivityBodyForFinishRepair;
@end

@implementation MRBaseComponentHandler

- (MRBaseComponentHandler)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)MRBaseComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2[21] = 0;
    *(_DWORD *)(v2 + 17) = 0;
    v4 = (void *)*((void *)v2 + 24);
    *((void *)v2 + 24) = 0;

    *(void *)(v3 + 28) = 0xF00000005;
    *((_WORD *)v3 + 11) = 1;
    v3[16] = 1;
    v5 = (void *)*((void *)v3 + 27);
    *((void *)v3 + 27) = 0;

    v3[24] = 0;
    v6 = (void *)*((void *)v3 + 20);
    *((void *)v3 + 20) = 0;

    v7 = (void *)*((void *)v3 + 29);
    *((void *)v3 + 29) = 0;

    v8 = (void *)*((void *)v3 + 31);
    *((void *)v3 + 31) = 0;

    v9 = (void *)*((void *)v3 + 30);
    *((void *)v3 + 30) = 0;

    v10 = (void *)MGCopyAnswer();
    *((_DWORD *)v3 + 9) = [v10 intValue];

    v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v11 doubleForKey:@"timeIntervalOverride"];
    double v13 = v12;

    unsigned __int8 has_internal_content = os_variant_has_internal_content();
    double v15 = (double)(uint64_t)*MEMORY[0x263EF81E8];
    if ((has_internal_content & (v13 != 0.0)) != 0) {
      double v15 = v13;
    }
    *((double *)v3 + 22) = v15;
    v16 = sub_239773918(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *((void *)v3 + 22);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v17;
      _os_log_impl(&dword_239757000, v16, OS_LOG_TYPE_DEFAULT, "the XPC time internal will be %f", buf, 0xCu);
    }

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mobilerepaird.asyncqueue", MEMORY[0x263EF83A8]);
    v19 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v18;
  }
  return (MRBaseComponentHandler *)v3;
}

- (void)createRepairFollowUp
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    __int16 v10 = 2080;
    v11 = "-[MRBaseComponentHandler createRepairFollowUp]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (self->displayFollowup)
  {
    v5 = +[MRUINotificationHelper sharedSingleton];
    [v5 createRepairFollowUpWithNotification:self->displayNotification actionURL:self->linkedSensitiveURL repairTitle:self->popUpNotificationTitle infoText:self->followUpInfoMessage itemID:self->componentFollowupClientID timeInterval:self->componentName componentName:self->timeIntervalOverride];
  }
  else
  {
    v5 = sub_239773918(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MRBaseComponentHandler *)self componentName];
      objc_msgSend(NSString, "stringWithFormat:", @"[%s] followup skipped", "-[MRBaseComponentHandler createRepairFollowUp]");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
}

- (void)createFinishRepairFollowUpWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    __int16 v17 = 2080;
    dispatch_queue_t v18 = "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]";
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (self->displayFollowup)
  {
    v7 = +[MRUINotificationHelper sharedSingleton];
    v8 = NSURL;
    v9 = [NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE"];
    __int16 v10 = [v8 URLWithString:v9];
    v11 = [(MRBaseComponentHandler *)self finishRepairTitle];
    uint64_t v12 = [(MRBaseComponentHandler *)self finishRepairMessage];
    [v7 createRepairFollowUpWithNotification:v3 actionURL:v10 repairTitle:v11 infoText:v12 itemID:self->finishRepairKey timeInterval:self->componentName componentName:0.0];
  }
  else
  {
    v7 = sub_239773918(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = [(MRBaseComponentHandler *)self componentName];
      objc_msgSend(NSString, "stringWithFormat:", @"[%s] followup skipped", "-[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:]");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      __int16 v17 = 2112;
      dispatch_queue_t v18 = v14;
      _os_log_impl(&dword_239757000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
}

- (void)clearRepairFollowUp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    __int16 v12 = 2080;
    double v13 = "-[MRBaseComponentHandler clearRepairFollowUp]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v5 = +[MRUINotificationHelper sharedSingleton];
  [v5 clearRepairFollowUpForClientID:self->componentFollowupClientID];

  if (self->finishRepairKey)
  {
    v6 = +[MRUINotificationHelper sharedSingleton];
    [v6 clearRepairFollowUpForClientID:self->finishRepairKey];

    v7 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.Preferences"];
    finishRepairKey = self->finishRepairKey;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&finishRepairKey count:1];
    [v7 removeDeliveredNotificationsWithIdentifiers:v8];
  }
}

- (BOOL)clearStateFile:(BOOL *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v6;
    __int16 v24 = 2080;
    v25 = "-[MRBaseComponentHandler clearStateFile:]";
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:self->stateFilePath];

  if (!v8)
  {
    id v12 = 0;
LABEL_10:
    BOOL v14 = 1;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v8;
    goto LABEL_12;
  }
  v9 = [MEMORY[0x263F08850] defaultManager];
  stateFilePath = self->stateFilePath;
  id v21 = 0;
  char v11 = [v9 removeItemAtPath:stateFilePath error:&v21];
  id v12 = v21;

  if (v11) {
    goto LABEL_10;
  }
  double v13 = sub_239773918(1uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v16 = [(MRBaseComponentHandler *)self componentName];
    __int16 v17 = NSString;
    dispatch_queue_t v18 = self->stateFilePath;
    uint64_t v19 = [v12 localizedDescription];
    v20 = [v17 stringWithFormat:@"remove item at path %@ failed: %@", v18, v19];
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_error_impl(&dword_239757000, v13, OS_LOG_TYPE_ERROR, "[%@][%@]", buf, 0x16u);
  }
  BOOL v14 = 0;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (void)clearNSUserDefaults
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    int v7 = 138412546;
    int v8 = v4;
    __int16 v9 = 2080;
    __int16 v10 = "-[MRBaseComponentHandler clearNSUserDefaults]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", (uint8_t *)&v7, 0x16u);
  }
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 removeObjectForKey:self->componentUnLockCheckCountKey];
  [v5 removeObjectForKey:self->componentLastCheckTimeKey];
  [v5 removeObjectForKey:self->componentHasDisplayedFollowUpKey];
  [v5 removeObjectForKey:self->componentFirstUIDisplayedTimeKey];
  [v5 removeObjectForKey:self->componentSUCaseKey];
  [v5 removeObjectForKey:self->componentRetriggerCountKey];
  if (self->componentHasNotifiedServerKey) {
    objc_msgSend(v5, "removeObjectForKey:");
  }
  [v5 removeObjectForKey:self->finishRepairKey];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForBluetooth"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForWifi"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForBaseband"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForNFC"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForUWB"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForAudio"];
  [v5 removeObjectForKey:@"hasDisplayedFollowupForTrueDepthIR"];
  [v5 synchronize];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v6 removeObjectForKey:self->componentFollowupClientID];

  [(MRBaseComponentHandler *)self clearStateFile:0];
}

- (void)popUpNotificationNowWithMessage
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v4;
    __int16 v12 = 2080;
    double v13 = "-[MRBaseComponentHandler popUpNotificationNowWithMessage]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if (![(MRBaseComponentHandler *)self displayModalPopup])
  {
    int v7 = sub_239773918(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(MRBaseComponentHandler *)self componentName];
      objc_msgSend(NSString, "stringWithFormat:", @"[%s] SU case skipped popup", "-[MRBaseComponentHandler popUpNotificationNowWithMessage]");
      __int16 v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      double v13 = v9;
      _os_log_impl(&dword_239757000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"settingsView"];

  if (!v6 || self->legacyPopup)
  {
    int v7 = +[MRUINotificationHelper sharedSingleton];
    [v7 popUpNotificationNowWithMessage:self->popUpNotificationMessage title:self->popUpNotificationTitle openSensitiveURL:self->linkedSensitiveURL componentName:self->componentName legacyPopup:self->legacyPopup];
LABEL_9:
  }
}

- (void)scheduleNetworkActivity
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    __int16 v9 = v4;
    __int16 v10 = 2080;
    uint64_t v11 = "-[MRBaseComponentHandler scheduleNetworkActivity]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  v5 = [(NSString *)self->componentNtwkActivityName UTF8String];
  int v6 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_239764248;
  handler[3] = &unk_264DA04B0;
  handler[4] = self;
  xpc_activity_register(v5, v6, handler);
}

- (void)unlockCheckerActivityBody
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
  uint64_t v5 = [v3 integerForKey:v4];

  int v6 = [(MRBaseComponentHandler *)self componentHasNotifiedServerKey];
  int v7 = [v3 BOOLForKey:v6];

  if ([v3 BOOLForKey:self->componentDataCollectionPresentedKey]) {
    int v8 = 1;
  }
  else {
    int v8 = ![(MRBaseComponentHandler *)self notifyServer];
  }
  char v41 = 0;
  __int16 v9 = [MEMORY[0x263EFF910] date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  [v3 doubleForKey:self->componentLastCheckTimeKey];
  double v13 = (double)(uint64_t)(v11 - v12);
  if (self->timeIntervalOverride <= v13) {
    double timeIntervalOverride = v13;
  }
  else {
    double timeIntervalOverride = self->timeIntervalOverride;
  }
  double v15 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
  uint64_t v16 = [v3 integerForKey:v15];

  __int16 v17 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  uint64_t v18 = [v17 integerForKey:self->componentFollowupClientID];

  if (v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    ++v5;
    uint64_t v19 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
    [v3 setInteger:v5 forKey:v19];

    v20 = [(MRBaseComponentHandler *)self componentLastCheckTimeKey];
    [v3 setDouble:v20 forKey:v11];

    [v3 synchronize];
  }
  id v21 = sub_239773918(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(MRBaseComponentHandler *)self componentName];
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Set count main body:%ld", v5);
    *(_DWORD *)buf = 138412546;
    v43 = v22;
    __int16 v44 = 2112;
    v45 = v23;
    _os_log_impl(&dword_239757000, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  BOOL v24 = [(MRBaseComponentHandler *)self isSUCaseForComponent];
  int v25 = [(MRBaseComponentHandler *)self componentfollowUpDisplaydays];
  if (!v24)
  {
    if (v5 != v25) {
      goto LABEL_25;
    }
    v31 = sub_239773918(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(MRBaseComponentHandler *)self componentName];
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v32;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_239757000, v31, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self clearStateFile:0];
    uint64_t v30 = v5;
    goto LABEL_24;
  }
  if (v5 >= v25) {
    int v26 = v8;
  }
  else {
    int v26 = 0;
  }
  if (v26 == 1)
  {
    v27 = sub_239773918(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(MRBaseComponentHandler *)self componentName];
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] SU handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v28;
      __int16 v44 = 2112;
      v45 = v29;
      _os_log_impl(&dword_239757000, v27, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self clearStateFile:&v41];
    if (v41)
    {
      uint64_t v30 = [(MRBaseComponentHandler *)self componentfollowUpDisplaydays];
LABEL_24:
      [(MRBaseComponentHandler *)self sendAnalyticsForCount:v30];
    }
  }
LABEL_25:
  if (v18)
  {
    if (v16 <= [(MRBaseComponentHandler *)self componentFollowupRetriggerdays])
    {
      ++v16;
      v34 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
      [v3 setInteger:v16 forKey:v34];
    }
    if (v16 == [(MRBaseComponentHandler *)self componentFollowupRetriggerdays]
      && v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
    {
      v35 = sub_239773918(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(MRBaseComponentHandler *)self componentName];
        v37 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] handling followup retrigger", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
        *(_DWORD *)buf = 138412546;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        _os_log_impl(&dword_239757000, v35, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)self clearRepairFollowUp];
      [(MRBaseComponentHandler *)self setDisplayNotification:0];
      [(MRBaseComponentHandler *)self createRepairFollowUp];
    }
  }
  if ((([(MRBaseComponentHandler *)self notifyServer] & v8 ^ 1 | v7) & 1) == 0)
  {
    v38 = sub_239773918(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [(MRBaseComponentHandler *)self componentName];
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] Scheduling network activity", "-[MRBaseComponentHandler unlockCheckerActivityBody]");
      *(_DWORD *)buf = 138412546;
      v43 = v39;
      __int16 v44 = 2112;
      v45 = v40;
      _os_log_impl(&dword_239757000, v38, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self scheduleNetworkActivity];
  }
  if (v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays]
    || (![(MRBaseComponentHandler *)self notifyServer] | v7) != 1
    || ((![(MRBaseComponentHandler *)self isSUCaseForComponent] | v8) & 1) == 0)
  {
    [(MRBaseComponentHandler *)self scheduleUnlockCheckerActivity:0 forFinishRepair:self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride)];
  }
}

- (void)unlockCheckerActivityBodyForFinishRepair
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
  uint64_t v5 = [v3 integerForKey:v4];

  int v6 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
  uint64_t v7 = [v3 integerForKey:v6];

  int v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  uint64_t v9 = [v8 integerForKey:@"clearFinishRepairFollowup"];

  double v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSince1970];
  double v12 = v11;

  [v3 doubleForKey:self->componentLastCheckTimeKey];
  double v14 = (double)(uint64_t)(v12 - v13);
  if (self->timeIntervalOverride <= v14) {
    double timeIntervalOverride = v14;
  }
  else {
    double timeIntervalOverride = self->timeIntervalOverride;
  }
  if (v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    ++v5;
    uint64_t v16 = [(MRBaseComponentHandler *)self componentUnLockCheckCountKey];
    [v3 setInteger:v5 forKey:v16];

    __int16 v17 = [(MRBaseComponentHandler *)self componentLastCheckTimeKey];
    [v3 setDouble:v17 forKey:v12];
  }
  uint64_t v18 = sub_239773918(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(MRBaseComponentHandler *)self componentName];
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"Set count FinishRepair:%ld", v5);
    *(_DWORD *)buf = 138412546;
    v32 = v19;
    __int16 v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_239757000, v18, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  id v21 = sub_239773918(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(MRBaseComponentHandler *)self componentName];
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Retigger count:%ld", v7);
    *(_DWORD *)buf = 138412546;
    v32 = v22;
    __int16 v33 = 2112;
    v34 = v23;
    _os_log_impl(&dword_239757000, v21, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  if (v5 >= [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
  {
    BOOL v24 = sub_239773918(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [(MRBaseComponentHandler *)self componentName];
      int v26 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] handling clear all followup", "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      __int16 v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_239757000, v24, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [(MRBaseComponentHandler *)self clearRepairFollowUp];
    [(MRBaseComponentHandler *)self sendAnalyticsForCount:v5];
  }
  if (v9)
  {
    if (v7 <= [(MRBaseComponentHandler *)self componentFollowupRetriggerdays])
    {
      ++v7;
      v27 = [(MRBaseComponentHandler *)self componentRetriggerCountKey];
      [v3 setInteger:v7 forKey:v27];
    }
    if (v7 == [(MRBaseComponentHandler *)self componentFollowupRetriggerdays]
      && v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays])
    {
      v28 = sub_239773918(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(MRBaseComponentHandler *)self componentName];
        uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] handling followup retrigger", "-[MRBaseComponentHandler unlockCheckerActivityBodyForFinishRepair]");
        *(_DWORD *)buf = 138412546;
        v32 = v29;
        __int16 v33 = 2112;
        v34 = v30;
        _os_log_impl(&dword_239757000, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)self clearRepairFollowUp];
      [(MRBaseComponentHandler *)self createFinishRepairFollowUpWithNotification:0];
    }
  }
  if (v5 < [(MRBaseComponentHandler *)self componentfollowUpDisplaydays]) {
    [(MRBaseComponentHandler *)self scheduleUnlockCheckerActivity:1 forFinishRepair:self->timeIntervalOverride - (double)((uint64_t)timeIntervalOverride % (uint64_t)self->timeIntervalOverride)];
  }
}

- (id)createCriteriaForUnlockCheckerWithInterval:(double)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A0], 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81C0], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81A0], (uint64_t)a3);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A8], 1);

  return v4;
}

- (void)scheduleUnlockCheckerActivity:(double)a3 forFinishRepair:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_239773918(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(MRBaseComponentHandler *)self componentName];
    *(_DWORD *)buf = 138412546;
    __int16 v17 = v8;
    __int16 v18 = 2080;
    uint64_t v19 = "-[MRBaseComponentHandler scheduleUnlockCheckerActivity:forFinishRepair:]";
    _os_log_impl(&dword_239757000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  if ([(MRBaseComponentHandler *)self unlockCheckActivityRequired])
  {
    id v9 = [(MRBaseComponentHandler *)self componentUnlockCheckerActivityName];
    double v10 = (const char *)[v9 UTF8String];
    double v11 = (void *)*MEMORY[0x263EF8188];
    if (v4)
    {
      double v12 = (double *)v15;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      double v13 = sub_239765464;
    }
    else
    {
      double v12 = (double *)v14;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      double v13 = sub_2397654E0;
    }
    *((void *)v12 + 2) = v13;
    *((void *)v12 + 3) = &unk_264DA0320;
    *((void *)v12 + 4) = self;
    v12[5] = a3;
    xpc_activity_register(v10, v11, v12);
  }
}

- (void)mainNonAuthRepairFlow
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(MRBaseComponentHandler *)v2 componentName];
    *(_DWORD *)buf = 138412546;
    id v41 = v4;
    __int16 v42 = 2080;
    v43 = "-[MRBaseComponentHandler mainNonAuthRepairFlow]";
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%s]", buf, 0x16u);
  }
  uint64_t v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MRBaseComponentHandler *)v2 componentName];
    objc_msgSend(NSString, "stringWithFormat:", @"[%s] component non authentic", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
    uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v41 = v6;
    __int16 v42 = 2112;
    v43 = v7;
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  int v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v9 = [(MRBaseComponentHandler *)v2 componentUnLockCheckCountKey];
  uint64_t v10 = [v8 integerForKey:v9];

  double v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v12 = [v11 stringForKey:v2->lastKnownComponentIdentifierKey];

  double v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LODWORD(v11) = [v13 BOOLForKey:@"ForceDisableUIFlowForInternalBuild"];

  if ((os_variant_has_internal_content() & v11 & 1) != 0 || v2->disableUIForComponent)
  {
    [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
    [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
  }
  else
  {
    if (v10 >= [(MRBaseComponentHandler *)v2 componentfollowUpDisplaydays]
      && v12
      && v2->lastKnownComponentIdentifierValue
      && (objc_msgSend(v12, "isEqualToString:") & 1) == 0)
    {
      v2->displayNotification = 1;
      *(_WORD *)&v2->displayModalPopup = 1;
      [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
    }
    double v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v15 = [v14 BOOLForKey:v2->componentHasDisplayedFollowUpKey];
    int v16 = [v14 BOOLForKey:v2->componentHasNotifiedServerKey];
    int v17 = [v14 BOOLForKey:v2->componentDataCollectionPresentedKey];
    __int16 v18 = [MEMORY[0x263EFF910] date];
    [v18 timeIntervalSince1970];
    double v20 = v19;

    id v21 = [(MRBaseComponentHandler *)v2 componentRetriggerCountKey];
    uint64_t v22 = [v14 integerForKey:v21];

    if (v15)
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      uint64_t v24 = [v23 integerForKey:v2->componentFollowupClientID];

      if (v24
        && (!v22
         || v22 >= [(MRBaseComponentHandler *)v2 componentFollowupRetriggerdays]
         && v24 == 2))
      {
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
      }
      int v25 = sub_239773918(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [(MRBaseComponentHandler *)v2 componentName];
        objc_msgSend(NSString, "stringWithFormat:", @"[%s] handling xpc/reboot case", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v26;
        __int16 v42 = 2112;
        v43 = v27;
        _os_log_impl(&dword_239757000, v25, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [v14 doubleForKey:v2->componentLastCheckTimeKey];
      double v29 = (double)(uint64_t)(v20 - v28);
      if (v2->timeIntervalOverride <= v29)
      {
        [(MRBaseComponentHandler *)v2 unlockCheckerActivityBody];
      }
      else
      {
        uint64_t v30 = sub_239773918(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [(MRBaseComponentHandler *)v2 componentName];
          objc_msgSend(NSString, "stringWithFormat:", @"[%s] scheduling unlock checker activity Interval:%f ", "-[MRBaseComponentHandler mainNonAuthRepairFlow]", v2->timeIntervalOverride - v29);
          v32 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v41 = v31;
          __int16 v42 = 2112;
          v43 = v32;
          _os_log_impl(&dword_239757000, v30, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:0 forFinishRepair:v2->timeIntervalOverride - v29];
      }
      if ((([(MRBaseComponentHandler *)v2 notifyServer] & v17 ^ 1 | v16) & 1) == 0) {
        [(MRBaseComponentHandler *)v2 scheduleNetworkActivity];
      }
    }
    else
    {
      __int16 v33 = sub_239773918(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [(MRBaseComponentHandler *)v2 componentName];
        objc_msgSend(NSString, "stringWithFormat:", @"[%s] starting Followup and notification", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
        uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v34;
        __int16 v42 = 2112;
        v43 = v35;
        _os_log_impl(&dword_239757000, v33, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
      }
      [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
      [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
      [(MRBaseComponentHandler *)v2 createRepairFollowUp];
      [(MRBaseComponentHandler *)v2 popUpNotificationNowWithMessage];
      [v14 setBool:1 forKey:v2->componentHasDisplayedFollowUpKey];
      [v14 setInteger:(uint64_t)v20 forKey:v2->componentFirstUIDisplayedTimeKey];
      lastKnownComponentIdentifierValue = v2->lastKnownComponentIdentifierValue;
      if (lastKnownComponentIdentifierValue) {
        [v14 setObject:lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
      }
      [v14 synchronize];
      [(MRBaseComponentHandler *)v2 sendAnalyticsForCount:0];
      if ((([(MRBaseComponentHandler *)v2 notifyServer] & v17 ^ 1 | v16) & 1) == 0)
      {
        v37 = sub_239773918(0);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = [(MRBaseComponentHandler *)v2 componentName];
          objc_msgSend(NSString, "stringWithFormat:", @"[%s] Scheduling network activity", "-[MRBaseComponentHandler mainNonAuthRepairFlow]");
          v39 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v41 = v38;
          __int16 v42 = 2112;
          v43 = v39;
          _os_log_impl(&dword_239757000, v37, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleNetworkActivity];
      }
      [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:0 forFinishRepair:v2->timeIntervalOverride];
    }
  }
  objc_sync_exit(v2);
}

- (void)checkInAndHandleAuthStatus
{
  v45[1] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [v2->componentAuthHandler copyComponentStatus];
  BOOL v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v5 = [v4 BOOLForKey:v2->finishRepairKey];

  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v10 = [(MRBaseComponentHandler *)v2 componentRetriggerCountKey];
  uint64_t v11 = [v9 integerForKey:v10];

  double v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v13 = [v12 BOOLForKey:v2->componentHasDisplayedFollowUpKey];

  double v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v15 = [v14 stringForKey:v2->lastKnownComponentIdentifierKey];

  if (v3 == 1)
  {
    [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
    [(MRBaseComponentHandler *)v2 sendAnalyticsForCount:0x7FFFFFFFFFFFFFFFLL];
    [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
  }
  else if (v3)
  {
    if (v3 == -3)
    {
      if (v2->lastKnownComponentIdentifierValue)
      {
        int v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v16 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
      }
      if (v13)
      {
        [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
        -[MRBaseComponentHandler createFinishRepairFollowUpWithNotification:](v2, "createFinishRepairFollowUpWithNotification:", [v15 isEqualToString:v2->lastKnownComponentIdentifierValue] ^ 1);
        if (v2->lastKnownComponentIdentifierValue)
        {
          int v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
          [v17 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
        }
LABEL_31:
        v36 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v36 setBool:1 forKey:v2->finishRepairKey];

        v37 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
        [v37 removeObjectForKey:@"clearFinishRepairFollowup"];

        goto LABEL_32;
      }
      if (!v5 || ([v15 isEqualToString:v2->lastKnownComponentIdentifierValue] & 1) == 0)
      {
        [(MRBaseComponentHandler *)v2 clearRepairFollowUp];
        [(MRBaseComponentHandler *)v2 clearNSUserDefaults];
        [(MRBaseComponentHandler *)v2 createFinishRepairFollowUpWithNotification:1];
        if (v2->lastKnownComponentIdentifierValue)
        {
          uint64_t v35 = [MEMORY[0x263EFFA40] standardUserDefaults];
          [v35 setObject:v2->lastKnownComponentIdentifierValue forKey:v2->lastKnownComponentIdentifierKey];
        }
        goto LABEL_31;
      }
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      uint64_t v24 = [v23 integerForKey:@"clearFinishRepairFollowup"];

      if (v24
        && (!v11
         || v11 >= [(MRBaseComponentHandler *)v2 componentFollowupRetriggerdays]
         && v24 == 2))
      {
        int v25 = +[MRUINotificationHelper sharedSingleton];
        [v25 clearRepairFollowUpForClientID:v2->finishRepairKey];

        id v26 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.Preferences"];
        v45[0] = v2->finishRepairKey;
        v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
        [v26 removeDeliveredNotificationsWithIdentifiers:v27];
      }
      double v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v28 doubleForKey:v2->componentLastCheckTimeKey];
      double v30 = v29;

      double v31 = (double)(uint64_t)(v8 - v30);
      if (v2->timeIntervalOverride <= v31)
      {
        [(MRBaseComponentHandler *)v2 unlockCheckerActivityBodyForFinishRepair];
      }
      else
      {
        v32 = sub_239773918(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [(MRBaseComponentHandler *)v2 componentName];
          id v34 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] scheduling finish repair unlock checker activity Interval:%f ", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]", v2->timeIntervalOverride - v31);
          *(_DWORD *)buf = 138412546;
          id v42 = v33;
          __int16 v43 = 2112;
          uint64_t v44 = v34;
          _os_log_impl(&dword_239757000, v32, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
        }
        [(MRBaseComponentHandler *)v2 scheduleUnlockCheckerActivity:1 forFinishRepair:v2->timeIntervalOverride - v31];
      }
    }
    else if (v3 < 0)
    {
      id v21 = sub_239773918(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [(MRBaseComponentHandler *)v2 componentName];
        objc_msgSend(NSString, "stringWithFormat:", @"[%s] IOREG Component Non authentic", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
        objc_claimAutoreleasedReturnValue();
        sub_2397768DC();
      }

      [(MRBaseComponentHandler *)v2 mainNonAuthRepairFlow];
    }
  }
  else
  {
    __int16 v18 = sub_239773918(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(MRBaseComponentHandler *)v2 componentName];
      objc_msgSend(NSString, "stringWithFormat:", @"[%s] IOREG Auth Component Not Populated", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]");
      objc_claimAutoreleasedReturnValue();
      sub_2397768DC();
    }

    objc_initWeak(&location, v2);
    asyncQueue = v2->asyncQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_239766370;
    block[3] = &unk_264DA04D8;
    objc_copyWeak(&v39, &location);
    block[4] = v2;
    dispatch_async(asyncQueue, block);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
LABEL_32:

  objc_sync_exit(v2);
}

- (void)sendAnalyticsForCount:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];

  uint64_t v7 = [v5 integerForKey:self->componentFirstUIDisplayedTimeKey];
  if (!a3)
  {
    id v9 = @"FirstUIDisplayed";
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if ([(MRBaseComponentHandler *)self componentFollowupRetriggerdays] == a3)
  {
    id v9 = @"lockscreenCleared";
LABEL_10:
    int v13 = v9;
    AnalyticsSendEventLazy();
    uint64_t v10 = v13;
    goto LABEL_11;
  }
  if ([(MRBaseComponentHandler *)self componentfollowUpDisplaydays] == a3)
  {
    id v9 = @"coreFollowUpCleared";
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8)
    {
      id v9 = @"repairEvent";
      goto LABEL_10;
    }
    uint64_t v10 = sub_239773918(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(MRBaseComponentHandler *)self componentName];
      double v12 = [NSString stringWithFormat:@"[%s] auth never fail before, bogus repair event", "-[MRBaseComponentHandler sendAnalyticsForCount:]"];
      *(_DWORD *)buf = 138412546;
      char v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = sub_239773918(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_239776934(self, a3);
    }
  }
LABEL_11:
}

+ (void)handleComponentSUCase:(id)a3 lastAUthCheckBuildVersion:(id)a4 followUpItemID:(id)a5 queryString:(id)a6 suCasekey:(id)a7 startBuildVersion:(id)a8 componentAuth:(id)a9
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  char v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  int v19 = DMGetUserDataDisposition();
  double v20 = sub_239773918(0);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v19 & 2) != 0)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v20, OS_LOG_TYPE_DEFAULT, "Update install case", buf, 2u);
    }

    double v20 = DMGetPreviousBuildVersion();
    id v39 = (void *)DMCopyCurrentBuildVersion();
    id v22 = sub_239773918(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v20;
      __int16 v42 = 2112;
      __int16 v43 = v39;
      _os_log_impl(&dword_239757000, v22, OS_LOG_TYPE_DEFAULT, "Old version is %@:%@", buf, 0x16u);
    }

    uint64_t v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v24 = [v23 BOOLForKey:v13];
    int v25 = [v23 stringForKey:v14];
    id v26 = v25;
    if (v24)
    {
      v27 = sub_239773918(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v15;
        _os_log_impl(&dword_239757000, v27, OS_LOG_TYPE_DEFAULT, "[%@] User already seeing UI", buf, 0xCu);
      }
    }
    else if (!v25 || ([v25 isEqualToString:v39] & 1) == 0)
    {
      double v28 = sub_239773918(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v15;
        _os_log_impl(&dword_239757000, v28, OS_LOG_TYPE_DEFAULT, "[%@] first auth case", buf, 0xCu);
      }

      uint64_t v29 = [v18 synchronouslycopyAuthStatus];
      if (v29 == 1)
      {
        double v30 = sub_239773918(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v15;
          _os_log_impl(&dword_239757000, v30, OS_LOG_TYPE_DEFAULT, "[%@] is Trusted", buf, 0xCu);
        }

        [v23 setObject:v39 forKey:v14];
        [v23 synchronize];
      }
      else
      {
        uint64_t v31 = v29;
        id v38 = v16;
        v32 = sub_239773918(0);
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v31 < 0)
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v15;
            _os_log_impl(&dword_239757000, v32, OS_LOG_TYPE_DEFAULT, "[%@] is not Trusted", buf, 0xCu);
          }

          id v34 = (void *)[objc_alloc(MEMORY[0x263F79190]) initWithString:v17];
          id v16 = v38;
          v37 = v34;
          if (v20 && [v34 compareBuildVersionString:v20 withPrecision:2] == 1)
          {
            uint64_t v35 = sub_239773918(0);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v15;
              _os_log_impl(&dword_239757000, v35, OS_LOG_TYPE_DEFAULT, "SU case for %@", buf, 0xCu);
            }

            [v23 setBool:1 forKey:v38];
          }
          else
          {
            v36 = sub_239773918(0);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v20;
              _os_log_impl(&dword_239757000, v36, OS_LOG_TYPE_DEFAULT, "ignoring setting the SU case: previousBuild:%@", buf, 0xCu);
            }
          }
          [v23 setObject:v39 forKey:v14];
          [v23 synchronize];
        }
        else
        {
          if (v33)
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v15;
            _os_log_impl(&dword_239757000, v32, OS_LOG_TYPE_DEFAULT, "[%@] Auth timeout", buf, 0xCu);
          }

          id v16 = v38;
        }
      }
    }
  }
  else if (v21)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v19;
    _os_log_impl(&dword_239757000, v20, OS_LOG_TYPE_DEFAULT, "Skipping SU update check:%d", buf, 8u);
  }
}

+ (id)getHwRevision
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"config-number", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithData:CFProperty encoding:4];
      uint64_t v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/-"];
      id v9 = [v7 componentsSeparatedByCharactersInSet:v8];

      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v10 = NSString;
        uint64_t v11 = [v9 objectAtIndexedSubscript:1];
        double v12 = [v10 stringWithFormat:@"%@", v11];

LABEL_12:
        IOObjectRelease(v5);
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = sub_239773918(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_239776A3C(v14);
      }

      uint64_t v7 = 0;
      id v9 = 0;
    }
    double v12 = 0;
    goto LABEL_12;
  }
  id v13 = sub_239773918(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_2397769F8(v13);
  }

  CFProperty = 0;
  double v12 = 0;
  id v9 = 0;
  uint64_t v7 = 0;
LABEL_13:

  return v12;
}

- (NSString)popUpNotificationMessage
{
  return self->popUpNotificationMessage;
}

- (void)setPopUpNotificationMessage:(id)a3
{
}

- (NSString)popUpNotificationTitle
{
  return self->popUpNotificationTitle;
}

- (void)setPopUpNotificationTitle:(id)a3
{
}

- (NSString)followUpInfoMessage
{
  return self->followUpInfoMessage;
}

- (void)setFollowUpInfoMessage:(id)a3
{
}

- (BOOL)unlockCheckActivityRequired
{
  return self->unlockCheckActivityRequired;
}

- (void)setUnlockCheckActivityRequired:(BOOL)a3
{
  self->unlockCheckActivityRequired = a3;
}

- (NSURL)linkedSensitiveURL
{
  return self->linkedSensitiveURL;
}

- (void)setLinkedSensitiveURL:(id)a3
{
}

- (NSString)componentFollowupClientID
{
  return self->componentFollowupClientID;
}

- (void)setComponentFollowupClientID:(id)a3
{
}

- (NSString)componentUnLockCheckCountKey
{
  return self->componentUnLockCheckCountKey;
}

- (void)setComponentUnLockCheckCountKey:(id)a3
{
}

- (NSString)componentSUCaseKey
{
  return self->componentSUCaseKey;
}

- (void)setComponentSUCaseKey:(id)a3
{
}

- (BOOL)displayNotification
{
  return self->displayNotification;
}

- (void)setDisplayNotification:(BOOL)a3
{
  self->displayNotification = a3;
}

- (BOOL)notifyServer
{
  return self->notifyServer;
}

- (void)setNotifyServer:(BOOL)a3
{
  self->notifyServer = a3;
}

- (BOOL)displayModalPopup
{
  return self->displayModalPopup;
}

- (void)setDisplayModalPopup:(BOOL)a3
{
  self->displayModalPopup = a3;
}

- (BOOL)isSUCaseForComponent
{
  return self->isSUCaseForComponent;
}

- (void)setIsSUCaseForComponent:(BOOL)a3
{
  self->isSUCaseForComponent = a3;
}

- (BOOL)disableUIForComponent
{
  return self->disableUIForComponent;
}

- (void)setDisableUIForComponent:(BOOL)a3
{
  self->disableUIForComponent = a3;
}

- (NSString)componentLastCheckTimeKey
{
  return self->componentLastCheckTimeKey;
}

- (void)setComponentLastCheckTimeKey:(id)a3
{
}

- (NSString)componentHasNotifiedServerKey
{
  return self->componentHasNotifiedServerKey;
}

- (void)setComponentHasNotifiedServerKey:(id)a3
{
}

- (NSString)componentHasDisplayedFollowUpKey
{
  return self->componentHasDisplayedFollowUpKey;
}

- (void)setComponentHasDisplayedFollowUpKey:(id)a3
{
}

- (NSString)componentDataCollectionPresentedKey
{
  return self->componentDataCollectionPresentedKey;
}

- (void)setComponentDataCollectionPresentedKey:(id)a3
{
}

- (NSString)componentFirstUIDisplayedTimeKey
{
  return self->componentFirstUIDisplayedTimeKey;
}

- (void)setComponentFirstUIDisplayedTimeKey:(id)a3
{
}

- (NSString)lastKnownComponentIdentifierKey
{
  return self->lastKnownComponentIdentifierKey;
}

- (void)setLastKnownComponentIdentifierKey:(id)a3
{
}

- (NSString)lastKnownComponentIdentifierValue
{
  return self->lastKnownComponentIdentifierValue;
}

- (void)setLastKnownComponentIdentifierValue:(id)a3
{
}

- (NSString)componentUnlockCheckerActivityName
{
  return self->componentUnlockCheckerActivityName;
}

- (void)setComponentUnlockCheckerActivityName:(id)a3
{
}

- (int)componentFollowupRetriggerdays
{
  return self->componentFollowupRetriggerdays;
}

- (void)setComponentFollowupRetriggerdays:(int)a3
{
  self->componentFollowupRetriggerdays = a3;
}

- (int)componentfollowUpDisplaydays
{
  return self->componentfollowUpDisplaydays;
}

- (void)setComponentfollowUpDisplaydays:(int)a3
{
  self->componentfollowUpDisplaydays = a3;
}

- (NSString)componentForceKey
{
  return self->componentForceKey;
}

- (void)setComponentForceKey:(id)a3
{
}

- (NSString)componentEnableNonAuthUIKey
{
  return self->componentEnableNonAuthUIKey;
}

- (void)setComponentEnableNonAuthUIKey:(id)a3
{
}

- (double)timeIntervalOverride
{
  return self->timeIntervalOverride;
}

- (void)setTimeIntervalOverride:(double)a3
{
  self->double timeIntervalOverride = a3;
}

- (NSString)componentNtwkActivityName
{
  return self->componentNtwkActivityName;
}

- (void)setComponentNtwkActivityName:(id)a3
{
}

- (id)componentAuthHandler
{
  return self->componentAuthHandler;
}

- (void)setComponentAuthHandler:(id)a3
{
}

- (int64_t)componentId
{
  return self->componentId;
}

- (void)setComponentId:(int64_t)a3
{
  self->componentId = a3;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
}

- (BOOL)displayFollowup
{
  return self->displayFollowup;
}

- (void)setDisplayFollowup:(BOOL)a3
{
  self->displayFollowup = a3;
}

- (BOOL)legacyPopup
{
  return self->legacyPopup;
}

- (void)setLegacyPopup:(BOOL)a3
{
  self->legacyPopup = a3;
}

- (NSString)stateFilePath
{
  return self->stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->deviceClass = a3;
}

- (BOOL)supportsRepair
{
  return self->supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->supportsRepair = a3;
}

- (NSString)componentRetriggerCountKey
{
  return self->componentRetriggerCountKey;
}

- (void)setComponentRetriggerCountKey:(id)a3
{
}

- (NSString)finishRepairKey
{
  return self->finishRepairKey;
}

- (void)setFinishRepairKey:(id)a3
{
}

- (NSString)finishRepairMessage
{
  return self->finishRepairMessage;
}

- (void)setFinishRepairMessage:(id)a3
{
}

- (NSString)finishRepairTitle
{
  return self->finishRepairTitle;
}

- (void)setFinishRepairTitle:(id)a3
{
}

- (NSString)componentStatusKey
{
  return self->_componentStatusKey;
}

- (void)setComponentStatusKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStatusKey, 0);
  objc_storeStrong((id *)&self->finishRepairTitle, 0);
  objc_storeStrong((id *)&self->finishRepairMessage, 0);
  objc_storeStrong((id *)&self->finishRepairKey, 0);
  objc_storeStrong((id *)&self->componentRetriggerCountKey, 0);
  objc_storeStrong((id *)&self->stateFilePath, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong(&self->componentAuthHandler, 0);
  objc_storeStrong((id *)&self->componentNtwkActivityName, 0);
  objc_storeStrong((id *)&self->componentEnableNonAuthUIKey, 0);
  objc_storeStrong((id *)&self->componentForceKey, 0);
  objc_storeStrong((id *)&self->componentUnlockCheckerActivityName, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierValue, 0);
  objc_storeStrong((id *)&self->lastKnownComponentIdentifierKey, 0);
  objc_storeStrong((id *)&self->componentFirstUIDisplayedTimeKey, 0);
  objc_storeStrong((id *)&self->componentDataCollectionPresentedKey, 0);
  objc_storeStrong((id *)&self->componentHasDisplayedFollowUpKey, 0);
  objc_storeStrong((id *)&self->componentHasNotifiedServerKey, 0);
  objc_storeStrong((id *)&self->componentLastCheckTimeKey, 0);
  objc_storeStrong((id *)&self->componentSUCaseKey, 0);
  objc_storeStrong((id *)&self->componentUnLockCheckCountKey, 0);
  objc_storeStrong((id *)&self->componentFollowupClientID, 0);
  objc_storeStrong((id *)&self->linkedSensitiveURL, 0);
  objc_storeStrong((id *)&self->followUpInfoMessage, 0);
  objc_storeStrong((id *)&self->popUpNotificationTitle, 0);
  objc_storeStrong((id *)&self->popUpNotificationMessage, 0);

  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end