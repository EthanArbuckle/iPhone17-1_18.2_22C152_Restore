@interface MRDisplayComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRDisplayComponentHandler)init;
- (id)_init;
@end

@implementation MRDisplayComponentHandler

- (MRDisplayComponentHandler)init
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
  v21.receiver = self;
  v21.super_class = (Class)MRDisplayComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", [v3 BOOLForKey:@"SUcaseForDisplay"]);

    [(MRBaseComponentHandler *)v2 setComponentName:@"TouchController"];
    [(MRBaseComponentHandler *)v2 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationTitle:@"IMPORTANT_DISPLAY_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_DISPLAY_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setComponentSUCaseKey:@"SUcaseForDisplay"];
    [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v2 setDisplayModalPopup:[(MRBaseComponentHandler *)v2 isSUCaseForComponent] ^ 1];
    v4 = NSURL;
    uint64_t v5 = [NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/TouchController"];
    v6 = [v4 URLWithString:v5];
    [(MRBaseComponentHandler *)v2 setLinkedSensitiveURL:v6];

    [(MRBaseComponentHandler *)v2 setComponentFollowupClientID:@"com.apple.mobilerepair.DisplayRepair"];
    [(MRBaseComponentHandler *)v2 setFinishRepairTitle:@"FINISH_DISPLAY_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_DISPLAY_REPAIR_DESC"];
    v7 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v8 = [v7 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v2 setFinishRepairKey:v8];

    [(MRBaseComponentHandler *)v2 setComponentUnLockCheckCountKey:@"unlockCheckCountForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentRetriggerCountKey:@"retriggerCheckCountForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentLastCheckTimeKey:@"lastCheckTimeForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentHasDisplayedFollowUpKey:@"hasDisplayedFollowupForDisplay"];
    [(MRBaseComponentHandler *)v2 setComponentUnlockCheckerActivityName:@"com.apple.mobilerepair.displayunlockchecker"];
    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.displaynotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentId:1];
    [(MRBaseComponentHandler *)v2 setComponentHasNotifiedServerKey:@"hasNotifiedServerForDisplay"];
    v9 = objc_opt_new();
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", [v9 deviceSupportsRepairBootIntent] ^ 1);

    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.displaynotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentDataCollectionPresentedKey:@"dataCollectionNoticePresentedForPartsAndService"];
    [(MRBaseComponentHandler *)v2 setComponentFirstUIDisplayedTimeKey:@"firstUIDisplayedTimeForDisplay"];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierKey:@"lastKnownIDForDisplay"];
    v10 = (void *)MEMORY[0x263F37E28];
    v11 = [(MRBaseComponentHandler *)v2 componentName];
    v12 = (void *)[v10 copySealingManifestDataInstanceForComponent:v11];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierValue:v12];

    v13 = objc_opt_new();
    [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v13];

    v14 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v15 = [@"/var/mobile/Library/Preferences/" stringByAppendingString:v14];
    v16 = [v15 stringByAppendingString:@".plist"];
    [(MRBaseComponentHandler *)v2 setStateFilePath:v16];

    [(MRBaseComponentHandler *)v2 setComponentForceKey:@"ForceDisplayStatus"];
    v20.receiver = v2;
    v20.super_class = (Class)MRDisplayComponentHandler;
    if ([(MRBaseComponentHandler *)&v20 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_DISPLAY_REPAIR_DESC_IPAD"];
      [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_DISPLAY_MESSAGE_IPAD"];
      [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"];
      v17 = objc_opt_new();
      char v18 = [v17 isSupportedIPad];

      if ((v18 & 1) == 0)
      {
        [(MRBaseComponentHandler *)v2 setUnlockCheckActivityRequired:0];
        [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
        [(MRBaseComponentHandler *)v2 setDisplayModalPopup:0];
        [(MRBaseComponentHandler *)v2 setDisplayFollowup:0];
      }
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  if ([MEMORY[0x263F37E28] isFDRDataClassSupported:@"tcrt"])
  {
    id v3 = (id)objc_opt_new();
    [a1 handleComponentSUCase:@"hasDisplayedFollowupForDisplay" lastAUthCheckBuildVersion:@"LastDisplayAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.DisplayRepair" queryString:@"TouchController" suCasekey:@"SUcaseForDisplay" startBuildVersion:@"17A800" componentAuth:v3];
  }
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23977234C;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00F20 != -1) {
    dispatch_once(&qword_268A00F20, block);
  }
  v2 = (void *)qword_268A00F18;

  return v2;
}

@end