@interface HPSiriController
+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen;
+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen;
+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen;
+ (BOOL)isAnnounceEnabledForHeadphones;
+ (BOOL)isAnnounceMessagesEnabled;
+ (BOOL)isAnnounceMessagesSupported;
+ (BOOL)isAnnounceSupported;
+ (BOOL)isCurrentLocaleSupported;
+ (BOOL)isHeySiriEnabled;
+ (BOOL)isSiriAllowedWhileLocked;
+ (BOOL)isSiriEnabled;
+ (BOOL)productHasW1Chip:(unsigned int)a3;
+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5;
+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4;
+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4;
+ (int64_t)announceCallsState;
+ (void)setAnnounceCallsState:(int64_t)a3;
+ (void)setAnnounceMessagesEnabled:(BOOL)a3;
+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3;
+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3;
+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3;
@end

@implementation HPSiriController

+ (BOOL)isSiriEnabled
{
  v2 = [(objc_class *)off_1000D4190() sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

+ (BOOL)isHeySiriEnabled
{
  CFStringGetTypeID();

  v2 = [(objc_class *)off_1000D4198() sharedPreferences];
  unsigned __int8 v3 = [(objc_class *)off_1000D4190() sharedPreferences];
  unsigned __int8 v4 = 0;
  if ([v3 assistantIsEnabled]) {
    unsigned __int8 v4 = [v2 voiceTriggerEnabled];
  }

  return v4;
}

+ (BOOL)isSiriAllowedWhileLocked
{
  v2 = [(objc_class *)off_1000D4190() sharedPreferences];
  char v3 = [v2 disableAssistantWhilePasscodeLocked] ^ 1;

  return v3;
}

+ (BOOL)isCurrentLocaleSupported
{
  v2 = [(objc_class *)off_1000D4190() sharedPreferences];
  unsigned __int8 v3 = [v2 isCurrentLocaleNativelySupported];

  return v3;
}

+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted] == (id)3;
}

+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3
{
  if (a3) {
    +[SFDefaults setSiriNotificationsPrompted:3];
  }
}

+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted] == (id)4;
}

+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3
{
  if (a3) {
    +[SFDefaults setSiriNotificationsPrompted:4];
  }
}

+ (BOOL)isAnnounceMessagesEnabled
{
  v2 = [(objc_class *)off_1000D41A0() currentNotificationSettingsCenter];
  unsigned __int8 v3 = [v2 notificationSystemSettings];
  BOOL v4 = [v3 announcementSetting] == (id)2;

  return v4;
}

+ (void)setAnnounceMessagesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(objc_class *)off_1000D41A0() currentNotificationSettingsCenter];
  BOOL v4 = [v8 notificationSystemSettings];
  v5 = v4;
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if ([v4 announcementSetting] != (id)v6)
  {
    id v7 = objc_alloc_init(off_1000D41A8());
    [v7 setAnnouncementSetting:v6];
    [v7 setShowPreviewsSetting:[v5 showPreviewsSetting]];
    [v8 setNotificationSystemSettings:v7];
  }
}

+ (BOOL)isAnnounceMessagesSupported
{
  v2 = [(objc_class *)off_1000D41A0() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = [v3 announcementSetting] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isAnnounceEnabledForHeadphones
{
  v2 = [(objc_class *)off_1000D41A0() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  id v4 = [v3 announcementHeadphonesSetting];

  return v4 == (id)2;
}

+ (BOOL)isAnnounceSupported
{
  v2 = [(objc_class *)off_1000D41A0() currentNotificationSettingsCenter];
  BOOL v3 = [v2 notificationSystemSettings];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 announcementSetting] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen
{
  return +[SFDefaults hasSeenAnnounceNotifications];
}

+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3
{
}

+ (int64_t)announceCallsState
{
  id v2 = objc_alloc_init(off_1000D41B0());
  id v3 = [v2 announceCalls];
  if ((unint64_t)v3 >= 4)
  {
    id v4 = sub_1000055C8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10009E3B0((int)v3, v4);
    }

    id v3 = 0;
  }

  return (int64_t)v3;
}

+ (void)setAnnounceCallsState:(int64_t)a3
{
  id v4 = objc_alloc_init(off_1000D41B0());
  int64_t v5 = a3;
  if ((unint64_t)a3 >= 4)
  {
    uint64_t v6 = sub_1000055C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009E428(a3, v6);
    }

    int64_t v5 = 0;
  }
  [v4 setAnnounceCalls:v5];
  id v7 = sub_1000055C8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      CFStringRef v8 = @"?";
    }
    else {
      CFStringRef v8 = *(&off_1000C1EF0 + a3);
    }
    int v9 = 138412290;
    CFStringRef v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set Announce Calls state to %@\n", (uint8_t *)&v9, 0xCu);
  }
}

+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(id)objc_opt_class() productHasW1Chip:*(void *)&a3])
  {
    uint64_t v6 = sub_1000055C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v7 = "Announce Messages not needed because it's a W1 product\n";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v4
    && (([a1 hasUserSeenAnnounceMessagesOptOutScreen] & 1) != 0
     || [a1 hasUserSeenAnnounceCallsOptOutScreen]))
  {
    uint64_t v6 = sub_1000055C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v7 = "Already prompted device for announce messages";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }
  unsigned int v10 = [a1 isSiriAllowedWhileLocked];
  if ([a1 isAnnounceMessagesSupported]) {
    unsigned int v11 = [a1 isAnnounceMessagesEnabled] ^ 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v4) {
    int v8 = v10 & v11;
  }
  else {
    int v8 = v11;
  }
  uint64_t v6 = sub_1000055C8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    int v13 = 138413058;
    if (v8) {
      CFStringRef v12 = @"YES";
    }
    CFStringRef v14 = v12;
    __int16 v15 = 1024;
    unsigned int v16 = v10;
    __int16 v17 = 1024;
    unsigned int v18 = v11;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Needs announce messages? %@ (isSiriAllowedWhileLocked=%d announceSettingDisabled=%d isUpsellFlow=%d)", (uint8_t *)&v13, 0x1Eu);
  }
LABEL_11:

  return v8;
}

+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(id)objc_opt_class() productHasW1Chip:*(void *)&a3])
  {
    int v8 = sub_1000055C8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      int v9 = "Announce Calls not needed because it's a W1 product\n";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!a4)
  {
    int v8 = sub_1000055C8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      int v9 = "Announce Calls not needed because devices does not support IED\n";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v5 && [a1 hasUserSeenAnnounceCallsOptOutScreen])
  {
    int v8 = sub_1000055C8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      int v9 = "Already prompted device for announce calls";
      goto LABEL_11;
    }
LABEL_12:
    LOBYTE(v10) = 0;
    goto LABEL_13;
  }
  unsigned int v12 = [a1 isSiriAllowedWhileLocked];
  id v13 = [a1 announceCallsState];
  if (v13) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = v12;
  }
  if (v5) {
    BOOL v10 = v14;
  }
  else {
    BOOL v10 = v13 == 0;
  }
  int v8 = sub_1000055C8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"NO";
    if (v10) {
      CFStringRef v15 = @"YES";
    }
    if ((unint64_t)v13 > 3) {
      CFStringRef v16 = @"?";
    }
    else {
      CFStringRef v16 = *(&off_1000C1EF0 + (void)v13);
    }
    int v17 = 138412802;
    CFStringRef v18 = v15;
    __int16 v19 = 1024;
    unsigned int v20 = v12;
    __int16 v21 = 2112;
    CFStringRef v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Needs announce calls? %@ (isSiriAllowedWhileLocked=%d announceCallState=%@)", (uint8_t *)&v17, 0x1Cu);
  }
LABEL_13:

  return v10;
}

+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(id)objc_opt_class() productHasW1Chip:*(void *)&a3])
  {
    uint64_t v6 = sub_1000055C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v7 = "Announce Notifications not needed because it's a W1 product\n";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v4 && [a1 hasUserSeenAnnounceNotificationsOptOutScreen])
  {
    uint64_t v6 = sub_1000055C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v7 = "Already prompted device for Announce Notifications";
      goto LABEL_8;
    }
LABEL_9:
    LOBYTE(v8) = 0;
    goto LABEL_20;
  }
  unsigned int v9 = [a1 isSiriAllowedWhileLocked];
  if ([a1 isAnnounceSupported]) {
    unsigned int v10 = [a1 isAnnounceEnabledForHeadphones] ^ 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v4) {
    BOOL v8 = v9;
  }
  else {
    BOOL v8 = v10;
  }
  uint64_t v6 = sub_1000055C8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    int v13 = 138413058;
    if (v8) {
      CFStringRef v11 = @"YES";
    }
    CFStringRef v14 = v11;
    __int16 v15 = 1024;
    unsigned int v16 = v9;
    __int16 v17 = 1024;
    unsigned int v18 = v10;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Needs Announce Notifications? %@ (isSiriAllowedWhileLocked=%d announceSettingDisabled=%d isUpsellFlow=%d)", (uint8_t *)&v13, 0x1Eu);
  }
LABEL_20:

  return v8;
}

+ (BOOL)productHasW1Chip:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:*(void *)&a3];
  unsigned __int8 v4 = [v3 hasW1Chip];

  return v4;
}

@end