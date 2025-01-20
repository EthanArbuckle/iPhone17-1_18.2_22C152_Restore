@interface MRFaceIDComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (id)_init;
@end

@implementation MRFaceIDComponentHandler

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)MRFaceIDComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v8 initWithComponentName:@"FaceID"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"FaceID"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:10];
    [(MRBaseComponentHandler *)v3 setSupportsRepair:1];
    [(MRBaseComponentHandler *)v3 setFinishRepairTitle:@"FINISH_FACEID_REPAIR_TITLE"];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"FACEID_FOLLOWUP_TITLE"];
    [(MRBaseComponentHandler *)v3 setUnlockCheckActivityRequired:1];
    if ([(MRBaseComponentHandler *)v3 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v3 setFinishRepairMessage:@"FINISH_FACEID_REPAIR_DESC_IPAD"];
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"FACEID_FOLLOWUP_INFO_IPAD"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"FACEID_POPUP_INFO_IPAD"];
      v5 = objc_opt_new();
      char v6 = [v5 isSupportedIPad];

      if ((v6 & 1) == 0)
      {
        [(MRBaseComponentHandler *)v3 setUnlockCheckActivityRequired:0];
        [(MRBaseComponentHandler *)v3 setDisplayNotification:0];
        [(MRBaseComponentHandler *)v3 setDisplayModalPopup:0];
        [(MRBaseComponentHandler *)v3 setDisplayFollowup:0];
      }
    }
    else
    {
      [(MRBaseComponentHandler *)v3 setFinishRepairMessage:@"FINISH_FACEID_REPAIR_DESC"];
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"FACEID_FOLLOWUP_INFO"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"FACEID_POPUP_INFO"];
    }
    [(MRBaseComponentHandler *)v3 setComponentForceKey:@"ForceFaceIDStatus"];
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239772B04;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00F50 != -1) {
    dispatch_once(&qword_268A00F50, block);
  }
  v2 = (void *)qword_268A00F48;

  return v2;
}

+ (void)handleSUCase
{
  id v3 = (id)objc_opt_new();
  [a1 handleComponentSUCase:@"hasDisplayedFollowupForSHCFaceID" lastAUthCheckBuildVersion:@"LastFaceIDAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.FaceIDRepair" queryString:@"FaceID" suCasekey:@"SUcaseForFaceID" startBuildVersion:@"19F1" componentAuth:v3];
}

@end