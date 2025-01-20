@interface CKMMSMultipleCTSubscriptionsController
- (id)isEnabledForSubscription:(id)a3;
- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4;
@end

@implementation CKMMSMultipleCTSubscriptionsController

- (id)isEnabledForSubscription:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 identifier];
  v5 = [v3 properties];
  v6 = [v5 objectForKey:@"phoneNumber"];
  v7 = [v3 properties];
  v8 = [v7 objectForKey:@"simID"];
  +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:v6 simID:v8];

  v9 = [NSNumber numberWithBool:IMGetDomainBoolForKeyWithDefaultValue()];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_INFO, "Getting value %@ for key %@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v9;
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 identifier];
  CFPreferencesSetAppValue(v8, v6, @"com.apple.MobileSMS");
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [NSNumber numberWithBool:IMGetDomainBoolForKeyWithDefaultValue()];
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_INFO, "Setting value %@ for key %@, now is %@", (uint8_t *)&v14, 0x20u);
    }
  }
  v11 = [(CKMultipleCTSubscriptionsController *)self defaultsKey];
  int v12 = [v11 isEqualToString:@"MMSEnabled-"];

  if (v12)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSEnabled.changed", 0, 0, 1u);
  }
}

@end