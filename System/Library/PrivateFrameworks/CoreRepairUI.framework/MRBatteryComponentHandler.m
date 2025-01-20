@interface MRBatteryComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRBatteryComponentHandler)init;
- (id)_init;
@end

@implementation MRBatteryComponentHandler

- (MRBatteryComponentHandler)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedSingleton);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  v25.receiver = self;
  v25.super_class = (Class)MRBatteryComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v25 init];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"Battery"];
    [(MRBaseComponentHandler *)v3 setComponentFollowupClientID:@"com.apple.mobilerepair.BatteryRepair"];
    v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v3, "setIsSUCaseForComponent:", [v4 BOOLForKey:@"SUcaseForBattery"]);

    [(MRBaseComponentHandler *)v3 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_BATTERY_NOTIF_TEXT"];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"IMPORTANT_BATTERY_MESSAGE"];
    [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_BATTERY_MESSAGE"];
    [(MRBaseComponentHandler *)v3 setComponentSUCaseKey:@"SUcaseForBattery"];
    uint64_t v5 = objc_opt_new();
    -[MRBaseComponentHandler setNotifyServer:](v3, "setNotifyServer:", [v5 deviceSupportsRepairBootIntent] ^ 1);

    [(MRBaseComponentHandler *)v3 setFinishRepairTitle:@"FINISH_BATTERY_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v3 setFinishRepairMessage:@"FINISH_BATTERY_REPAIR_DESC"];
    v6 = [(MRBaseComponentHandler *)v3 componentFollowupClientID];
    v7 = [v6 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v3 setFinishRepairKey:v7];

    [(MRBaseComponentHandler *)v3 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v3 setDisplayModalPopup:[(MRBaseComponentHandler *)v3 isSUCaseForComponent] ^ 1];
    v8 = NSURL;
    v9 = [NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Battery"];
    v10 = [v8 URLWithString:v9];
    [(MRBaseComponentHandler *)v3 setLinkedSensitiveURL:v10];

    [(MRBaseComponentHandler *)v3 setComponentUnLockCheckCountKey:@"unlockCheckCountForBattery"];
    [(MRBaseComponentHandler *)v3 setComponentRetriggerCountKey:@"retriggerCheckCountForBattery"];
    [(MRBaseComponentHandler *)v3 setComponentLastCheckTimeKey:@"lastCheckTimeForBattery"];
    [(MRBaseComponentHandler *)v3 setComponentHasDisplayedFollowUpKey:@"hasDisplayedFollowupForBattery"];
    [(MRBaseComponentHandler *)v3 setComponentHasNotifiedServerKey:@"hasNotifiedServerForBattery"];
    [(MRBaseComponentHandler *)v3 setComponentUnlockCheckerActivityName:@"com.apple.mobilerepair.batteryunlockchecker"];
    [(MRBaseComponentHandler *)v3 setComponentNtwkActivityName:@"com.apple.mobilerepair.batterynotifyserver"];
    [(MRBaseComponentHandler *)v3 setComponentId:0];
    [(MRBaseComponentHandler *)v3 setComponentDataCollectionPresentedKey:@"dataCollectionNoticePresentedForPartsAndService"];
    [(MRBaseComponentHandler *)v3 setComponentFirstUIDisplayedTimeKey:@"firstUIDisplayedTimeForBattery"];
    [(MRBaseComponentHandler *)v3 setLastKnownComponentIdentifierKey:@"lastKnownIDForBattery"];
    v11 = (void *)MEMORY[0x263F37E28];
    v12 = [(MRBaseComponentHandler *)v3 componentName];
    v13 = (void *)[v11 copySealingManifestDataInstanceForComponent:v12];
    [(MRBaseComponentHandler *)v3 setLastKnownComponentIdentifierValue:v13];

    v14 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v14];

    v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v16 = [v15 BOOLForKey:@"overrideDisableUIForBattery"];

    v17 = [(MRBaseComponentHandler *)v3 componentFollowupClientID];
    v18 = [@"/var/mobile/Library/Preferences/" stringByAppendingString:v17];
    v19 = [v18 stringByAppendingString:@".plist"];
    [(MRBaseComponentHandler *)v3 setStateFilePath:v19];

    [(MRBaseComponentHandler *)v3 setComponentForceKey:@"ForceBatteryStatus"];
    if (MGGetProductType() == 2159747553)
    {
      v20 = +[MRBaseComponentHandler getHwRevision];
      int v21 = [v20 containsString:@"EVT"];

      if (((v21 ^ 1 | v16) & 1) == 0)
      {
        v22 = sub_239773918(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_239757000, v22, OS_LOG_TYPE_DEFAULT, "Disabling UI for D79 EVT", v24, 2u);
        }

        [(MRBaseComponentHandler *)v3 setDisableUIForComponent:1];
      }
    }
  }
  return v3;
}

+ (void)handleSUCase
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"bcrt"] & 1) != 0
    || [MEMORY[0x263F37E28] isFDRDataClassSupported:@"vcrt"])
  {
    id v3 = (id)objc_opt_new();
    [a1 handleComponentSUCase:@"hasDisplayedFollowupForBattery" lastAUthCheckBuildVersion:@"LastBatteryAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.BatteryRepair" queryString:@"Battery" suCasekey:@"SUcaseForBattery" startBuildVersion:@"17A800" componentAuth:v3];
  }
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239767D08;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00EA8 != -1) {
    dispatch_once(&qword_268A00EA8, block);
  }
  v2 = (void *)qword_268A00EA0;

  return v2;
}

@end