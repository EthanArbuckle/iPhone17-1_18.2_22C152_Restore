@interface CKBSSettingsAppController
- (BOOL)_supportModernTextInput;
- (BOOL)suppressSendToNotificationCenterOption;
- (CKBSSettingsAppController)initWithNibName:(id)a3 bundle:(id)a4;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (NSArray)alertSpecifiers;
- (NSArray)mirroredSpecifiers;
- (NSArray)nanoSpecifiers;
- (id)_alertStringFromAlertCount:(int64_t)a3;
- (id)_mirroredAlertStringFromAlertCount:(int64_t)a3;
- (id)_mirroringReadReceiptsString;
- (id)_mirroringRepeatAlertsString;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)dictationMode;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)mirroredApplicationGroupSpecifiers;
- (id)notificationApplicationSpecifiers;
- (int64_t)_validateMirroredAlertCount:(int64_t)a3;
- (int64_t)alertType;
- (void)dealloc;
- (void)mirrorSettingsChanged:(BOOL)a3;
- (void)setAlertSpecifiers:(id)a3;
- (void)setDictationMode:(id)a3 specifier:(id)a4;
- (void)setDomainAccessor:(id)a3;
- (void)setMirroredSpecifiers:(id)a3;
- (void)setNanoSpecifiers:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation CKBSSettingsAppController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)CKBSSettingsAppController;
  [(CKBSSettingsAppController *)&v4 dealloc];
}

- (CKBSSettingsAppController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKBSSettingsAppController;
  objc_super v4 = [(CKBSSettingsAppController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"reloadSpecifiers" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v4;
}

- (id)localizedPaneTitle
{
  v2 = CKBSFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"NANO_APP_TITLE" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.MobileSMS";
}

- (id)applicationGroupSpecifiers
{
  if ([(CKBSSettingsAppController *)self settingsMode] == (char *)&dword_0 + 1)
  {
    v3 = 0;
  }
  else
  {
    objc_super v4 = [(CKBSSettingsAppController *)self nanoSpecifiers];

    if (!v4)
    {
      unsigned int v5 = [(CKBSSettingsAppController *)self _supportModernTextInput];
      v6 = @"MessagesNanoLegacySpecifiers";
      if (v5) {
        v6 = @"MessagesNanoSpecifiers";
      }
      objc_super v7 = v6;
      v8 = CKBSFrameworkBundle();
      v9 = [(CKBSSettingsAppController *)self loadSpecifiersFromPlistName:v7 target:self bundle:v8];

      [(CKBSSettingsAppController *)self setNanoSpecifiers:v9];
    }
    v3 = [(CKBSSettingsAppController *)self nanoSpecifiers];
  }

  return v3;
}

- (id)notificationApplicationSpecifiers
{
  v3 = [(CKBSSettingsAppController *)self alertSpecifiers];
  if (v3)
  {
  }
  else if (([(CKBSSettingsAppController *)self mirrorSettings] & 1) == 0)
  {
    objc_super v4 = CKBSFrameworkBundle();
    unsigned int v5 = [(CKBSSettingsAppController *)self loadSpecifiersFromPlistName:@"MessagesNotificationsSpecifiers" target:self bundle:v4];

    id v6 = [v5 indexOfObjectPassingTest:&stru_41F0];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v7 = [v5 objectAtIndexedSubscript:v6];
      v8 = +[NSMutableArray array];
      v9 = [v7 values];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = -[CKBSSettingsAppController _alertStringFromAlertCount:](self, "_alertStringFromAlertCount:", [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue]);
            [v8 addObject:v14];
          }
          id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }
      [v7 setValues:v9 titles:v8];
    }
    [(CKBSSettingsAppController *)self setAlertSpecifiers:v5];
  }
  v15 = [(CKBSSettingsAppController *)self alertSpecifiers];

  return v15;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)mirroredApplicationGroupSpecifiers
{
  if ([(CKBSSettingsAppController *)self settingsMode] == (char *)&dword_0 + 1)
  {
    v3 = 0;
  }
  else
  {
    objc_super v4 = [(CKBSSettingsAppController *)self mirroredSpecifiers];

    if (!v4)
    {
      unsigned int v5 = CKBSFrameworkBundle();
      id v6 = [(CKBSSettingsAppController *)self loadSpecifiersFromPlistName:@"MessagesMirroredSpecifiers" target:self bundle:v5];
      [(CKBSSettingsAppController *)self setMirroredSpecifiers:v6];
    }
    v3 = [(CKBSSettingsAppController *)self mirroredSpecifiers];
  }

  return v3;
}

- (id)localizedMirroringDetailFooter
{
  v3 = CKBSFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"REPEAT_ALERT_SUMMARY_BULLET" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];

  id v5 = [(CKBSSettingsAppController *)self settingsMode];
  uint64_t v6 = [(CKBSSettingsAppController *)self _mirroringRepeatAlertsString];
  objc_super v7 = (void *)v6;
  if (v5)
  {
    v8 = +[NSString stringWithFormat:@"%@%@", v4, v6];
  }
  else
  {
    v9 = [(CKBSSettingsAppController *)self _mirroringReadReceiptsString];
    v8 = +[NSString stringWithFormat:@"%@%@\n%@%@", v4, v7, v4, v9];
  }

  return v8;
}

- (int64_t)alertType
{
  return 2;
}

- (id)_mirroringReadReceiptsString
{
  CFPreferencesSynchronize(@"com.apple.madrid", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ReadReceiptsEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
  int v3 = keyExistsAndHasValidFormat;
  objc_super v4 = CKBSFrameworkBundle();
  id v5 = v4;
  if (AppBooleanValue) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    CFStringRef v7 = @"DONT_SEND_READ_RECEIPTS";
  }
  else {
    CFStringRef v7 = @"SEND_READ_RECEIPTS";
  }
  v8 = [v4 localizedStringForKey:v7 value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];

  return v8;
}

- (id)_mirroringRepeatAlertsString
{
  CFStringRef v3 = [(CKBSSettingsAppController *)self applicationBundleIdentifier];
  CFPreferencesAppSynchronize(v3);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"IncomingMessageAlertCount", v3, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    uint64_t v5 = AppIntegerValue;
  }
  else {
    uint64_t v5 = 2;
  }
  BOOL v6 = [(CKBSSettingsAppController *)self _mirroredAlertStringFromAlertCount:v5];

  return v6;
}

- (id)_alertStringFromAlertCount:(int64_t)a3
{
  switch([(CKBSSettingsAppController *)self _validateMirroredAlertCount:a3])
  {
    case 1:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_0_TIMES" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, 0);
      goto LABEL_10;
    case 2:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_1_TIME" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      uint64_t v6 = 1;
      goto LABEL_9;
    case 3:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_2_TIMES" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      uint64_t v6 = 2;
      goto LABEL_9;
    case 4:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_3_TIMES" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      uint64_t v6 = 3;
      goto LABEL_9;
    case 6:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_5_TIMES" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      uint64_t v6 = 5;
      goto LABEL_9;
    case 0xBLL:
      objc_super v4 = CKBSFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ALERT_10_TIMES" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
      uint64_t v6 = 10;
LABEL_9:
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);
      CFStringRef v7 = LABEL_10:;

      break;
    default:
      CFStringRef v7 = [(CKBSSettingsAppController *)self _mirroredAlertStringFromAlertCount:2];
      break;
  }

  return v7;
}

- (id)_mirroredAlertStringFromAlertCount:(int64_t)a3
{
  CFStringRef v3 = [(CKBSSettingsAppController *)self _alertStringFromAlertCount:a3];
  objc_super v4 = CKBSFrameworkBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"REPEAT_ALERT" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
  uint64_t v6 = CKBSFrameworkBundle();
  CFStringRef v7 = [v6 localizedStringForKey:@"REPEAT_ALERT_SUMMARY_COLON" value:&stru_42B0 table:@"MessagesNotificationsSpecifiers"];
  v8 = +[NSString stringWithFormat:@"%@%@%@", v5, v7, v3];

  return v8;
}

- (int64_t)_validateMirroredAlertCount:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB) {
    return 2;
  }
  else {
    return qword_3EC0[a3];
  }
}

- (void)mirrorSettingsChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKBSSettingsAppController *)self applicationBundleIdentifier];
  CFStringRef v35 = @"IncomingMessageAlertCount";
  v36[0] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v35 count:1];
  v36[1] = @"com.apple.madrid";
  v37[0] = v6;
  v37[1] = &off_4638;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  v8 = [(CKBSSettingsAppController *)self syncManager];
  if (v3)
  {
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v15 = [v9 objectForKeyedSubscript:v14];
          v16 = +[NSSet setWithArray:v15];
          [v8 synchronizeUserDefaultsDomain:v14 keys:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    id v17 = v7;
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
          v23 = objc_msgSend(v17, "objectForKeyedSubscript:", v22, (void)v25);
          v24 = +[NSSet setWithArray:v23];
          [v8 synchronizeNanoDomain:v22 keys:v24];
        }
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }
  }
}

- (id)dictationMode
{
  v2 = [(CKBSSettingsAppController *)self domainAccessor];
  BOOL v3 = [v2 objectForKey:@"CKNanoDictationMode"];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = CKFrameworkBundle();
    CFStringRef v7 = [v6 localizedStringForKey:@"DEFAULT_DICTATION_MODE" value:&stru_42B0 table:@"ChatKit"];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 integerValue]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setDictationMode:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(CKBSSettingsAppController *)self domainAccessor];
  [v6 setObject:v5 forKey:@"CKNanoDictationMode"];

  CFStringRef v7 = [(CKBSSettingsAppController *)self domainAccessor];
  id v8 = [v7 synchronize];

  id v9 = [(CKBSSettingsAppController *)self syncManager];
  id v10 = [(CKBSSettingsAppController *)self applicationBundleIdentifier];
  id v11 = +[NSSet setWithObject:@"CKNanoDictationMode"];
  [v9 synchronizeNanoDomain:v10 keys:v11];

  [(CKBSSettingsAppController *)self reloadSpecifiers];
}

- (BOOL)_supportModernTextInput
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getActivePairedDevice];

  if (v3)
  {
    objc_super v4 = [v3 valueForProperty:NRDevicePropertySystemVersion];
    id v5 = [v4 componentsSeparatedByString:@"."];
    if ([v5 count])
    {
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      id v7 = [v6 integerValue];

      BOOL v8 = (uint64_t)v7 > 7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = objc_alloc((Class)NPSDomainAccessor);
    id v5 = [(CKBSSettingsAppController *)self applicationBundleIdentifier];
    uint64_t v6 = (NPSDomainAccessor *)[v4 initWithDomain:v5];
    id v7 = self->_domainAccessor;
    self->_domainAccessor = v6;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (NPSManager)syncManager
{
  syncManager = self->_syncManager;
  if (!syncManager)
  {
    id v4 = (NPSManager *)objc_alloc_init((Class)NPSManager);
    id v5 = self->_syncManager;
    self->_syncManager = v4;

    syncManager = self->_syncManager;
  }

  return syncManager;
}

- (NSArray)nanoSpecifiers
{
  return self->_nanoSpecifiers;
}

- (void)setNanoSpecifiers:(id)a3
{
}

- (NSArray)alertSpecifiers
{
  return self->_alertSpecifiers;
}

- (void)setAlertSpecifiers:(id)a3
{
}

- (NSArray)mirroredSpecifiers
{
  return self->_mirroredSpecifiers;
}

- (void)setMirroredSpecifiers:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_mirroredSpecifiers, 0);
  objc_storeStrong((id *)&self->_alertSpecifiers, 0);

  objc_storeStrong((id *)&self->_nanoSpecifiers, 0);
}

@end