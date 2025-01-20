@interface MRCameraComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRCameraComponentHandler)init;
- (id)_init;
@end

@implementation MRCameraComponentHandler

- (MRCameraComponentHandler)init
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
  v18.receiver = self;
  v18.super_class = (Class)MRCameraComponentHandler;
  v2 = [(MRBaseComponentHandler *)&v18 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", [v3 BOOLForKey:@"SUcaseForCamera"]);

    [(MRBaseComponentHandler *)v2 setComponentName:@"Camera"];
    [(MRBaseComponentHandler *)v2 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationMessage:@"UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT"];
    [(MRBaseComponentHandler *)v2 setPopUpNotificationTitle:@"IMPORTANT_CAMERA_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setFollowUpInfoMessage:@"UNABLE_TO_VERIFY_CAMERA_MESSAGE"];
    [(MRBaseComponentHandler *)v2 setComponentSUCaseKey:@"SUcaseForCamera"];
    [(MRBaseComponentHandler *)v2 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v2 setDisplayModalPopup:[(MRBaseComponentHandler *)v2 isSUCaseForComponent] ^ 1];
    v4 = NSURL;
    uint64_t v5 = [NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Camera"];
    v6 = [v4 URLWithString:v5];
    [(MRBaseComponentHandler *)v2 setLinkedSensitiveURL:v6];

    [(MRBaseComponentHandler *)v2 setComponentFollowupClientID:@"com.apple.mobilerepair.CameraRepair"];
    [(MRBaseComponentHandler *)v2 setFinishRepairTitle:@"FINISH_CAMERA_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_CAMERA_REPAIR_DESC"];
    v7 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v8 = [v7 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v2 setFinishRepairKey:v8];

    [(MRBaseComponentHandler *)v2 setComponentUnLockCheckCountKey:@"unlockCheckCountForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentRetriggerCountKey:@"retriggerCheckCountForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentLastCheckTimeKey:@"lastCheckTimeForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentHasDisplayedFollowUpKey:@"hasDisplayedFollowupForCamera"];
    [(MRBaseComponentHandler *)v2 setComponentUnlockCheckerActivityName:@"com.apple.mobilerepair.cameraunlockchecker"];
    [(MRBaseComponentHandler *)v2 setComponentId:2];
    [(MRBaseComponentHandler *)v2 setComponentNtwkActivityName:@"com.apple.mobilerepair.cameranotifyServer"];
    [(MRBaseComponentHandler *)v2 setComponentHasNotifiedServerKey:@"hasNotifiedServerForCamera"];
    [(MRBaseComponentHandler *)v2 setNotifyServer:0];
    [(MRBaseComponentHandler *)v2 setComponentDataCollectionPresentedKey:@"dataCollectionNoticePresentedForPartsAndService"];
    [(MRBaseComponentHandler *)v2 setComponentFirstUIDisplayedTimeKey:@"firstUIDisplayedTimeForCamera"];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierKey:@"lastKnownIDForCamera"];
    v9 = (void *)MEMORY[0x263F37E28];
    v10 = [(MRBaseComponentHandler *)v2 componentName];
    v11 = (void *)[v9 copySealingManifestDataInstanceForComponent:v10];
    [(MRBaseComponentHandler *)v2 setLastKnownComponentIdentifierValue:v11];

    v12 = objc_opt_new();
    [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v12];

    v13 = [(MRBaseComponentHandler *)v2 componentFollowupClientID];
    v14 = [@"/var/mobile/Library/Preferences/" stringByAppendingString:v13];
    v15 = [v14 stringByAppendingString:@".plist"];
    [(MRBaseComponentHandler *)v2 setStateFilePath:v15];

    [(MRBaseComponentHandler *)v2 setComponentForceKey:@"ForceCameraStatus"];
    if ([(MRBaseComponentHandler *)v2 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v2 setFinishRepairMessage:@"FINISH_CAMERA_REPAIR_DESC_IPAD"];
      v16 = objc_opt_new();
      [(MRBaseComponentHandler *)v2 setComponentAuthHandler:v16];
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  v3 = (void *)MGCopyAnswer();
  [v3 intValue];

  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"CmCl"] & 1) != 0
    || [MEMORY[0x263F37E28] isFDRPropertySupported:@"RCSn"])
  {
    id v4 = (id)objc_opt_new();
    [a1 handleComponentSUCase:@"hasDisplayedFollowupForCamera" lastAUthCheckBuildVersion:@"LastCameraAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.CameraRepair" queryString:@"Camera" suCasekey:@"SUcaseForCamera" startBuildVersion:@"18D1" componentAuth:v4];
  }
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239773890;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00F70 != -1) {
    dispatch_once(&qword_268A00F70, block);
  }
  v2 = (void *)qword_268A00F68;

  return v2;
}

@end