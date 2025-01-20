@interface MRWifiComponentHandler
+ (id)sharedSingleton;
- (MRWifiComponentHandler)init;
- (id)_init;
@end

@implementation MRWifiComponentHandler

- (MRWifiComponentHandler)init
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
  if (MGGetBoolAnswer())
  {
    v17.receiver = self;
    v17.super_class = (Class)MRWifiComponentHandler;
    v3 = [(MRSystemHealthComponentHandler *)&v17 initWithComponentName:@"WLAN"];
    v4 = v3;
    if (!v3) {
      return v4;
    }
    [(MRBaseComponentHandler *)v3 setComponentName:@"WLAN"];
    uint64_t v5 = objc_opt_new();
    [(MRBaseComponentHandler *)v4 setComponentAuthHandler:v5];

    [(MRBaseComponentHandler *)v4 setComponentId:4];
    [(MRBaseComponentHandler *)v4 setPopUpNotificationTitle:@"WLAN_FOLLOWUP_TITLE"];
    int v6 = [(MRBaseComponentHandler *)v4 deviceClass];
    BOOL v7 = v6 == 3;
    if (v6 == 3) {
      v8 = @"WLAN_FOLLOWUP_INFO_IPAD";
    }
    else {
      v8 = @"WLAN_FOLLOWUP_INFO";
    }
    v9 = @"WLAN_POPUP_INFO";
    v10 = @"WLAN_POPUP_INFO_IPAD";
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MRWifiComponentHandler;
    v11 = [(MRSystemHealthComponentHandler *)&v16 initWithComponentName:@"Wifi"];
    v4 = v11;
    if (!v11) {
      return v4;
    }
    [(MRBaseComponentHandler *)v11 setComponentName:@"Wifi"];
    v12 = objc_opt_new();
    [(MRBaseComponentHandler *)v4 setComponentAuthHandler:v12];

    [(MRBaseComponentHandler *)v4 setComponentId:4];
    [(MRBaseComponentHandler *)v4 setPopUpNotificationTitle:@"WIFI_FOLLOWUP_TITLE"];
    int v13 = [(MRBaseComponentHandler *)v4 deviceClass];
    BOOL v7 = v13 == 3;
    if (v13 == 3) {
      v8 = @"WIFI_FOLLOWUP_INFO_IPAD";
    }
    else {
      v8 = @"WIFI_FOLLOWUP_INFO";
    }
    v9 = @"WIFI_POPUP_INFO";
    v10 = @"WIFI_POPUP_INFO_IPAD";
  }
  if (v7) {
    v14 = v10;
  }
  else {
    v14 = v9;
  }
  [(MRBaseComponentHandler *)v4 setFollowUpInfoMessage:v8];
  [(MRBaseComponentHandler *)v4 setPopUpNotificationMessage:v14];
  [(MRBaseComponentHandler *)v4 setUnlockCheckActivityRequired:0];
  [(MRBaseComponentHandler *)v4 setDisplayNotification:0];
  [(MRBaseComponentHandler *)v4 setDisplayModalPopup:0];
  [(MRBaseComponentHandler *)v4 setDisplayFollowup:0];
  return v4;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239768430;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00EC8 != -1) {
    dispatch_once(&qword_268A00EC8, block);
  }
  v2 = (void *)qword_268A00EC0;

  return v2;
}

@end