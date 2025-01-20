@interface MRBluetoothComponentHandler
+ (id)sharedSingleton;
- (MRBluetoothComponentHandler)init;
- (id)_init;
@end

@implementation MRBluetoothComponentHandler

- (MRBluetoothComponentHandler)init
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
  v9.receiver = self;
  v9.super_class = (Class)MRBluetoothComponentHandler;
  v2 = [(MRSystemHealthComponentHandler *)&v9 initWithComponentName:@"Bluetooth"];
  v3 = v2;
  if (v2)
  {
    [(MRBaseComponentHandler *)v2 setComponentName:@"Bluetooth"];
    v4 = objc_opt_new();
    [(MRBaseComponentHandler *)v3 setComponentAuthHandler:v4];

    [(MRBaseComponentHandler *)v3 setComponentId:3];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationTitle:@"BLUETOOTH_FOLLOWUP_TITLE"];
    int v5 = [(MRBaseComponentHandler *)v3 deviceClass];
    if (v5 == 3) {
      v6 = @"BLUETOOTH_FOLLOWUP_INFO_IPAD";
    }
    else {
      v6 = @"BLUETOOTH_FOLLOWUP_INFO";
    }
    if (v5 == 3) {
      v7 = @"BLUETOOTH_POPUP_INFO_IPAD";
    }
    else {
      v7 = @"BLUETOOTH_POPUP_INFO";
    }
    [(MRBaseComponentHandler *)v3 setFollowUpInfoMessage:v6];
    [(MRBaseComponentHandler *)v3 setPopUpNotificationMessage:v7];
    [(MRBaseComponentHandler *)v3 setUnlockCheckActivityRequired:0];
    [(MRBaseComponentHandler *)v3 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v3 setDisplayModalPopup:0];
    [(MRBaseComponentHandler *)v3 setDisplayFollowup:0];
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2397691A0;
  block[3] = &unk_264DA01F8;
  block[4] = a1;
  if (qword_268A00EE8 != -1) {
    dispatch_once(&qword_268A00EE8, block);
  }
  v2 = (void *)qword_268A00EE0;

  return v2;
}

@end