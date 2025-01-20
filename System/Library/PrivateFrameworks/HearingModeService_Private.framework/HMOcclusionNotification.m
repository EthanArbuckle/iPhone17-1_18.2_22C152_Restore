@interface HMOcclusionNotification
+ (HMOcclusionNotification)sharedInstance;
- (BOOL)_hasOcclusionNotificationsThresholdMet;
- (HMOcclusionNotification)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getStringPreferencesForKey:(id)a3;
- (id)_getSystemIconName:(unsigned int)a3;
- (void)_setPreferencesForKey:(id)a3 withStringValue:(id)a4;
- (void)_showHearingProtectionOcclusionNotification:(unsigned int)a3;
- (void)invalidateHearingProtectionOcclusionNotification;
- (void)presentCleaningInfoArticle;
- (void)setDispatchQueue:(id)a3;
- (void)showHearingProtectionOcclusionNotification:(unsigned int)a3 forAddress:(id)a4;
@end

@implementation HMOcclusionNotification

+ (HMOcclusionNotification)sharedInstance
{
  if (sharedInstance_sOnce_1 != -1) {
    dispatch_once(&sharedInstance_sOnce_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sSelf_1;
  return (HMOcclusionNotification *)v2;
}

uint64_t __41__HMOcclusionNotification_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMOcclusionNotification);
  uint64_t v1 = sharedInstance_sSelf_1;
  sharedInstance_sSelf_1 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HMOcclusionNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMOcclusionNotification;
  v2 = [(HMOcclusionNotification *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)invalidateHearingProtectionOcclusionNotification
{
  uiNotificationSessionHearingProtection = self->_uiNotificationSessionHearingProtection;
  if (uiNotificationSessionHearingProtection)
  {
    [(CUUserNotificationSession *)uiNotificationSessionHearingProtection invalidate];
    v4 = self->_uiNotificationSessionHearingProtection;
    self->_uiNotificationSessionHearingProtection = 0;
  }
}

- (void)presentCleaningInfoArticle
{
  uint64_t v2 = [objc_alloc(NSURL) initWithString:@"https://support.apple.com/120409?cid=mc-ols-airpods-article_120409-settings_ui-08232024"];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v6 = v2;
    if (gLogCategory_HMOcclusionNotification <= 30
      && (gLogCategory_HMOcclusionNotification != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    v5 = [NSURL URLWithString:@"https://support.apple.com/120409?cid=mc-ols-airpods-article_120409-settings_ui-08232024"];
    [v4 openSensitiveURL:v5 withOptions:0];

    goto LABEL_10;
  }
  if (gLogCategory_HMOcclusionNotification <= 30)
  {
    uint64_t v6 = 0;
    if (gLogCategory_HMOcclusionNotification != -1 || (uint64_t v2 = _LogCategory_Initialize(), v3 = 0, v2))
    {
      uint64_t v2 = LogPrintF();
LABEL_10:
      uint64_t v3 = v6;
    }
  }
  MEMORY[0x270F9A758](v2, v3);
}

- (void)showHearingProtectionOcclusionNotification:(unsigned int)a3 forAddress:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_storeStrong((id *)&self->_btAddress, a4);
  [(HMOcclusionNotification *)self _showHearingProtectionOcclusionNotification:v4];
}

- (void)_showHearingProtectionOcclusionNotification:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_uiNotificationSessionHearingProtection = &self->_uiNotificationSessionHearingProtection;
  if (self->_uiNotificationSessionHearingProtection) {
    [(HMOcclusionNotification *)self invalidateHearingProtectionOcclusionNotification];
  }
  uint64_t v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.HearingModeUserNotifications.bundle"];
  id v7 = objc_alloc_init(MEMORY[0x263F385F0]);
  objc_storeStrong((id *)p_uiNotificationSessionHearingProtection, v7);
  [v7 setBundleID:@"com.apple.HearingModeUserNotifications"];
  [v7 setCategoryID:@"HearingModeUserNotifications"];
  [v7 setDispatchQueue:self->_dispatchQueue];
  [v7 setFlags:17];
  [v7 setLabel:@"HearingMode"];
  v8 = CULocalizedStringEx();
  [v7 setBodyKey:v8];

  v9 = CULocalizedStringEx();
  [v7 setTitleKey:v9];

  v10 = [(HMOcclusionNotification *)self _getSystemIconName:v3];
  [v7 setIconName:v10];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 pathForResource:@"NotificationAudioTone" ofType:@"wav"];

  v13 = [NSURL fileURLWithPath:v12];
  if (v13)
  {
    v14 = [MEMORY[0x263F1DF00] soundWithAlertType:16];
    [v14 setToneFileURL:v13];
    [v7 setSound:v14];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__HMOcclusionNotification__showHearingProtectionOcclusionNotification___block_invoke;
  v21[3] = &unk_265362DD8;
  v21[4] = v7;
  v21[5] = self;
  [v7 setActionHandler:v21];
  [v7 activate];
  id v15 = objc_alloc_init(MEMORY[0x263F08790]);
  [v15 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  if (gLogCategory_HMOcclusionNotification <= 30
    && (gLogCategory_HMOcclusionNotification != -1 || _LogCategory_Initialize()))
  {
    v16 = [MEMORY[0x263EFF910] date];
    v20 = [v15 stringFromDate:v16];
    LogPrintF();
  }
  v17 = objc_msgSend(MEMORY[0x263EFF910], "date", v20);
  v18 = [v15 stringFromDate:v17];
  [(HMOcclusionNotification *)self _setPreferencesForKey:@"OcclusionNotificationShownDate" withStringValue:v18];

  v19 = +[HMDeviceManager sharedInstance];
  [v19 occlusionIndicationShownForDeviceAddress:self->_btAddress featureID:2 type:1 action:0];
}

void __71__HMOcclusionNotification__showHearingProtectionOcclusionNotification___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 8))
  {
    id v11 = v5;
    if (gLogCategory_HMOcclusionNotification <= 30
      && (gLogCategory_HMOcclusionNotification != -1 || _LogCategory_Initialize()))
    {
      if (a2 > 5) {
        uint64_t v6 = "?";
      }
      else {
        uint64_t v6 = off_265362DF8[a2];
      }
      v9 = v6;
      id v10 = v11;
      LogPrintF();
    }
    if (a2 == 1)
    {
      v8 = +[HMDeviceManager sharedInstance];
      [v8 occlusionIndicationShownForDeviceAddress:*(void *)(*(void *)(a1 + 40) + 16) featureID:2 type:1 action:3];

      [*(id *)(a1 + 40) presentCleaningInfoArticle];
    }
    else if (a2 != 5)
    {
      id v5 = v11;
      if (a2 != 2) {
        goto LABEL_16;
      }
      id v7 = +[HMDeviceManager sharedInstance];
      [v7 occlusionIndicationShownForDeviceAddress:*(void *)(*(void *)(a1 + 40) + 16) featureID:2 type:1 action:1];
    }
    objc_msgSend(*(id *)(a1 + 40), "invalidateHearingProtectionOcclusionNotification", v9, v10);
    id v5 = v11;
  }
LABEL_16:
}

- (BOOL)_hasOcclusionNotificationsThresholdMet
{
  uint64_t v2 = [(HMOcclusionNotification *)self _getStringPreferencesForKey:@"OcclusionNotificationShownDate"];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
    uint64_t v6 = [v4 dateFromString:v2];

    id v7 = objc_alloc(MEMORY[0x263EFF8F0]);
    v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v9 = [v8 components:28 fromDate:v6 toDate:v3 options:0];
    if (gLogCategory_HMOcclusionNotification <= 30
      && (gLogCategory_HMOcclusionNotification != -1 || _LogCategory_Initialize()))
    {
      v20 = [v4 stringFromDate:v6];
      id v10 = [MEMORY[0x263EFF910] date];
      id v11 = [v4 stringFromDate:v10];
      uint64_t v12 = [v9 day];
      uint64_t v18 = [v9 month];
      uint64_t v19 = [v9 year];
      v16 = v11;
      uint64_t v17 = v12;
      id v15 = v20;
      LogPrintF();
    }
    BOOL v13 = objc_msgSend(v9, "year", v15, v16, v17, v18, v19) > 0
       || [v9 month] > 0
       || [v9 day] > 14;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)_getSystemIconName:(unsigned int)a3
{
  return @"airpodspro";
}

- (void)_setPreferencesForKey:(id)a3 withStringValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 UTF8String];
  [v5 length];

  CFPrefs_SetCString();
  CFPreferencesAppSynchronize(@"com.apple.HearingModeService");
}

- (id)_getStringPreferencesForKey:(id)a3
{
  v6[13] = *MEMORY[0x263EF8340];
  LODWORD(v6[0]) = 0;
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.HearingModeService");
  CFPrefs_GetCString();

  id v4 = objc_msgSend(NSString, "stringWithUTF8String:", (char *)v6 + 4, v6[0]);
  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_uiNotificationSessionHearingProtection, 0);
}

@end