@interface IMiCloudSettingsPlugin
+ (id)dataclasses;
- (BOOL)checkEligibilityWithError:(id *)a3;
- (BOOL)eligibleToToggleMiCSwitch;
- (BOOL)hasSetupListener;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7;
- (BOOL)purchasedMaxQuotaTier;
- (BOOL)setCloudEnable:(BOOL)a3;
- (id)_deviceNameString;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5;
- (int64_t)_disablementOptionForUserNotificationResponse:(id)a3;
- (int64_t)_promptUserIfTheyWantToDisableOrCancel;
- (void)_setupIMListener;
- (void)didPerformAdditionalStorageRequiredCheck:(id)a3;
- (void)didPerformEligibilityCheck:(id)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)setEnabledDidReturned:(id)a3;
- (void)setHasSetupListener:(BOOL)a3;
@end

@implementation IMiCloudSettingsPlugin

+ (id)dataclasses
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "dataclasses request: kAccountDataclassMessages", v5, 2u);
    }
  }
  uint64_t v6 = kAccountDataclassMessages;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  return v3;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return 0;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v22 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "actionsForDisablingDataclassOnAccount for dataclass: %@", buf, 0xCu);
    }
  }
  if (![(__CFString *)v9 isEqualToString:kAccountDataclassMessages]) {
    goto LABEL_22;
  }
  int64_t v11 = [(IMiCloudSettingsPlugin *)self _promptUserIfTheyWantToDisableOrCancel];
  if (v11 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "User indicated that they want to disable MiC on all devices via alert.", buf, 2u);
      }
    }
    [(IMiCloudSettingsPlugin *)self _setupIMListener];
    v13 = +[IMCloudKitHooks sharedInstance];
    [v13 tryToDisableAllDevices];
  }
  unint64_t v14 = v11 - 1;
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      if (v14 < 2) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v22 = v16;
      __int16 v23 = 2048;
      int64_t v24 = v11;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "User has chosen to disable Messages in iCloud: %@ disablement option: {%ld}", buf, 0x16u);
    }
  }
  if (v14 <= 1)
  {
    v17 = +[ACDataclassAction actionWithType:2];
    v20 = v17;
    v18 = +[NSArray arrayWithObjects:&v20 count:1];

    goto LABEL_23;
  }
  if (a5)
  {
    +[NSError errorWithDomain:@"com.apple.messages" code:0 userInfo:0];
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v18 = 0;
  }
LABEL_23:

  return v18;
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "actionsForEnablingDataclassOnAccount: %@", buf, 0xCu);
    }
  }
  if (![v9 isEqualToString:kAccountDataclassMessages]) {
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    int64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "actionsForEnablingDataclassOnAccount", buf, 2u);
    }
  }
  if ([(IMiCloudSettingsPlugin *)self checkEligibilityWithError:a5])
  {
    v12 = +[ACDataclassAction actionWithType:5];
    v15 = v12;
    v13 = +[NSArray arrayWithObjects:&v15 count:1];
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "perform action: %@ for dataclass: %@", (uint8_t *)&v23, 0x16u);
    }
  }
  byte_C868 = 0;
  qword_C870 = 0;
  uint64_t v17 = kAccountDataclassMessages;
  if (![v15 isEqualToString:kAccountDataclassMessages]
    || [v12 type] != (char *)&dword_4 + 1)
  {
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "ACDataclassActionMergeLocalDataIntoSyncData action was called, requesting to enable Message in iCloud", (uint8_t *)&v23, 2u);
    }
  }
  if ([(IMiCloudSettingsPlugin *)self checkEligibilityWithError:a7])
  {
    uint64_t v19 = 1;
  }
  else
  {
LABEL_14:
    if (![v15 isEqualToString:v17] || objc_msgSend(v12, "type") != (char *)&dword_0 + 2)
    {
      BOOL v21 = 0;
      goto LABEL_22;
    }
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "ACDataclassActionMergeSyncDataIntoLocalData action was called requesting to disable Message in iCloud", (uint8_t *)&v23, 2u);
      }
    }
    uint64_t v19 = 0;
  }
  BOOL v21 = [(IMiCloudSettingsPlugin *)self setCloudEnable:v19];
LABEL_22:

  return v21;
}

- (id)_deviceNameString
{
  v2 = (void *)MGCopyAnswer();
  v3 = +[IMDeviceSupport marketingNameForModel:v2];

  return v3;
}

- (int64_t)_promptUserIfTheyWantToDisableOrCancel
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Prompting user to ensure they really want to disable", buf, 2u);
    }
  }
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DISABLE_MIC_MESSAGE_FORMAT" value:&stru_8260 table:@"IMiCloudSettingsPlugin"];
  uint64_t v6 = [(IMiCloudSettingsPlugin *)self _deviceNameString];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  id v8 = +[NSString stringGUID];
  id v9 = sub_3BEC(@"DISABLE_MIC_TITLE");
  v10 = sub_3BEC(@"DISABLE_MIC_CONFIRM");
  int64_t v11 = sub_3BEC(@"DISABLE_MIC_CANCEL");
  id v12 = +[IMUserNotification userNotificationWithIdentifier:v8 title:v9 message:v7 defaultButton:v10 alternateButton:v11 otherButton:0];

  *(void *)buf = 0;
  v28 = buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int64_t v13 = -1;
  uint64_t v26 = -1;
  if (v12)
  {
    id v14 = +[IMUserNotificationCenter sharedInstance];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_4938;
    v22[3] = &unk_8218;
    v22[4] = self;
    v22[5] = &v23;
    v22[6] = buf;
    [v14 addUserNotification:v12 listener:0 completionHandler:v22];

    id v15 = +[NSRunLoop currentRunLoop];
    if (IMOSLoggingEnabled())
    {
      CFStringRef v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v21 = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Spinning runloop until user makes a selection", v21, 2u);
      }
    }
    uint64_t v17 = IMRemoteObjectsRunLoopMode;
    do
    {
      v18 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
      [v15 runMode:v17 beforeDate:v18];
    }
    while (!v28[24]);
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v21 = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Finished Blocking, user has interacted with alert.", v21, 2u);
      }
    }
    int64_t v13 = v24[3];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (BOOL)checkEligibilityWithError:(id *)a3
{
  if ([(IMiCloudSettingsPlugin *)self eligibleToToggleMiCSwitch]
    && (+[IMCloudKitHooks sharedInstance],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 mocAccountsMatch],
        v5,
        (v6 & 1) != 0))
  {
    [(IMiCloudSettingsPlugin *)self performAdditionalStorageRequiredCheck];
    if (!qword_C870) {
      return 1;
    }
    unsigned int v7 = [(IMiCloudSettingsPlugin *)self purchasedMaxQuotaTier];
    int v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v23 = qword_C870;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "User has already purchased max quota tier, additional storage required: %llu", buf, 0xCu);
        }
      }
      uint64_t v20 = AADataclassActionUserInfoLibrarySize;
      v10 = +[NSNumber numberWithUnsignedLongLong:qword_C870];
      BOOL v21 = v10;
      int64_t v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

      if (a3)
      {
        *a3 = +[NSError errorWithDomain:AADataclassActionErrorDomain code:2 userInfo:v11];
      }
    }
    else
    {
      if (v8)
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v23 = qword_C870;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Additional storage required: %llu", buf, 0xCu);
        }
      }
      CFStringRef v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", qword_C870, AADataclassActionUserInfoLibrarySize);
      uint64_t v19 = v16;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

      if (a3)
      {
        *a3 = +[NSError errorWithDomain:AADataclassActionErrorDomain code:0 userInfo:v17];
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Not eligible as account does not support DeviceToDeviceEncryption, or iCloud & iMsg accounts do not match up", buf, 2u);
      }
    }
    if (a3)
    {
      id v13 = +[NSError errorWithDomain:AADataclassActionErrorDomain code:1 userInfo:0];
      BOOL result = 0;
      *a3 = v13;
      return result;
    }
  }
  return 0;
}

- (void)_setupIMListener
{
  if (![(IMiCloudSettingsPlugin *)self hasSetupListener])
  {
    v3 = +[IMCloudKitHooks sharedInstance];
    [v3 setupIMCloudKitHooks];

    [(IMiCloudSettingsPlugin *)self setHasSetupListener:1];
  }
}

- (BOOL)setCloudEnable:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMiCloudSettingsPlugin *)self _setupIMListener];
  v5 = +[IMCloudKitHooks sharedInstance];
  unsigned int v6 = [v5 isEnabled];

  if (v6 != v3)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    int v8 = (void *)qword_C878;
    qword_C878 = (uint64_t)v7;

    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"setEnabledDidReturned:" name:IMCloudKitHooksSetEnabledReturned object:0];

    int64_t v11 = +[IMCloudKitHooks sharedInstance];
    [v11 setEnabled:v3];

    intptr_t v12 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_C878, v9);
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v17 = 67109120;
          int v18 = byte_C868;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Timeout enable_semaphore, didSucceed: %d", (uint8_t *)&v17, 8u);
        }
LABEL_15:
      }
    }
    else if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 67109120;
        int v18 = byte_C868;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Signal enable_semaphore, didSucceed: %d", (uint8_t *)&v17, 8u);
      }
      goto LABEL_15;
    }
    return byte_C868 != 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "setCloudEnable: Did nothing as it was already enabled/disabled", (uint8_t *)&v17, 2u);
    }
  }
  return 1;
}

- (void)performAdditionalStorageRequiredCheck
{
  [(IMiCloudSettingsPlugin *)self _setupIMListener];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "performAdditionalStorageRequiredCheck", (uint8_t *)&v11, 2u);
    }
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = (void *)qword_C880;
  qword_C880 = (uint64_t)v4;

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  dispatch_semaphore_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"didPerformAdditionalStorageRequiredCheck:" name:IMCloudKitHooksAdditionalStorageCheckReturned object:0];

  int v8 = +[IMCloudKitHooks sharedInstance];
  [v8 performAdditionalStorageRequiredCheck];

  LODWORD(v8) = dispatch_semaphore_wait((dispatch_semaphore_t)qword_C880, v6) == 0;
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (!v9) {
      return;
    }
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = qword_C870;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Signal has_storage_semaphore, additionalStorageRequired: %llu", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (!v9) {
      return;
    }
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = qword_C870;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Timeout storage_semaphore, additionalStorageRequired: %llu", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)eligibleToToggleMiCSwitch
{
  byte_C888 = IMCloudKitIsEligibleToToggleMiCSwitch();
  if ((byte_C888 & 1) == 0)
  {
    [(IMiCloudSettingsPlugin *)self _setupIMListener];
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    dispatch_semaphore_t v4 = (void *)qword_C890;
    qword_C890 = (uint64_t)v3;

    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Since we are not eligible, fetching security level to check we are up to date", (uint8_t *)&v13, 2u);
      }
    }
    dispatch_semaphore_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"didPerformEligibilityCheck:" name:IMCloudKitHooksValuesChanged object:0];

    int v8 = +[IMCloudKitHooks sharedInstance];
    [v8 fetchAccountStatusAndUpdateMiCSwitchEligibility];

    if (dispatch_semaphore_wait((dispatch_semaphore_t)qword_C890, v5))
    {
      byte_C888 = IMCloudKitIsEligibleToToggleMiCSwitch();
      if (IMOSLoggingEnabled())
      {
        int v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          if (byte_C888) {
            CFStringRef v10 = @"YES";
          }
          else {
            CFStringRef v10 = @"NO";
          }
          int v13 = 138412290;
          CFStringRef v14 = v10;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Timeout eligible_semaphore, isEligible: %@", (uint8_t *)&v13, 0xCu);
        }
LABEL_20:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (byte_C888) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        int v13 = 138412290;
        CFStringRef v14 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Signal eligible_semaphore, isEligible: %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_20;
    }
  }
  return byte_C888;
}

- (void)didPerformEligibilityCheck:(id)a3
{
  id v4 = a3;
  byte_C888 = IMCloudKitIsEligibleToToggleMiCSwitch();
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (byte_C888) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Updated eligibility to %@", (uint8_t *)&v8, 0xCu);
    }
  }
  dispatch_semaphore_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C890);
}

- (void)didPerformAdditionalStorageRequiredCheck:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [v4 userInfo];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      CFStringRef v10 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "didPerformAdditionalStorageRequiredCheck with userInfo: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_t v7 = [v5 objectForKeyedSubscript:IMCloudKitHooksResultAdditionalStorageRequiredUserInfoKey];
  qword_C870 = (uint64_t)[v7 longLongValue];

  int v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C880);
}

- (void)setEnabledDidReturned:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [v4 userInfo];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      CFStringRef v10 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "setEnabledDidReturned with result: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_t v7 = [v5 objectForKeyedSubscript:IMCloudKitHooksResultSuccessUserInfoKey];
  byte_C868 = [v7 BOOLValue];

  int v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C878);
}

- (BOOL)purchasedMaxQuotaTier
{
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  id v4 = +[ACAccountStore defaultStore];
  dispatch_time_t v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  id v6 = [objc_alloc((Class)AAQuotaInfoRequest) initDetailedRequestWithAccount:v5];
  if (IMOSLoggingEnabled())
  {
    dispatch_semaphore_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "requestQuota %@", buf, 0xCu);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5C5C;
  v14[3] = &unk_8240;
  CFStringRef v16 = &v17;
  int v8 = v2;
  id v15 = v8;
  [v6 performRequestWithHandler:v14];
  if (dispatch_semaphore_wait(v8, v3))
  {
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = *((unsigned __int8 *)v18 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Timeout has_max_tier_semaphore, hasMaxTier: %d", buf, 8u);
      }
LABEL_13:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = *((unsigned __int8 *)v18 + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Signal has_max_tier_semaphore, hasMaxTier: %d", buf, 8u);
    }
    goto LABEL_13;
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (int64_t)_disablementOptionForUserNotificationResponse:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 response];
  if (v3 > 3) {
    return -1;
  }
  else {
    return qword_6848[v3];
  }
}

- (BOOL)hasSetupListener
{
  return self->_hasSetupListener;
}

- (void)setHasSetupListener:(BOOL)a3
{
  self->_hasSetupListener = a3;
}

@end