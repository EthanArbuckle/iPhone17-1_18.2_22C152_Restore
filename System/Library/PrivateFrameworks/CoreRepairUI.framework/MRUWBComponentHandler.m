@interface MRUWBComponentHandler
+ (id)sharedSingleton;
+ (void)handleSUCase;
- (MRUWBComponentHandler)init;
- (id)_init;
@end

@implementation MRUWBComponentHandler

- (MRUWBComponentHandler)init
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
  v8.receiver = self;
  v8.super_class = (Class)MRUWBComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v8 initWithComponentName:@"UWB"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"UWB"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:7];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"UWB_FOLLOWUP_TITLE"];
    if ([(MRBaseComponentHandler *)v3 deviceClass] == 3)
    {
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"UWB_FOLLOWUP_INFO_IPAD"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"UWB_POPUP_INFO_IPAD"];
      uint64_t v5 = objc_opt_new();
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
      [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:@"UWB_FOLLOWUP_INFO"];
      [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:@"UWB_POPUP_INFO"];
    }
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23975A1F4;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00E78 != -1) {
    dispatch_once(&qword_268A00E78, block);
  }
  v2 = (void *)qword_268A00E70;

  return v2;
}

+ (void)handleSUCase
{
  id v3 = (id)objc_opt_new();
  [a1 handleComponentSUCase:@"hasDisplayedFollowupForSHCUWB" lastAUthCheckBuildVersion:@"LastUWBAuthCompleteBuildVersion" followUpItemID:@"com.apple.mobilerepair.UWBRepair" queryString:@"UWB" suCasekey:@"SUcaseForUWB" startBuildVersion:@"19F1" componentAuth:v3];
}

@end