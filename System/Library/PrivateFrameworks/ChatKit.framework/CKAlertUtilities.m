@interface CKAlertUtilities
+ (BOOL)_isNumberEditable;
+ (id)_getCTPhoneNumber;
+ (id)_grabCTSIMStatus;
+ (id)_phoneNumberInfo;
+ (id)coreTelephonyClient;
+ (id)selectedSubscriptionContext;
+ (int64_t)missingAlertTypeToNotify;
- (CKAlertUtilitiesProtocol)delegate;
- (void)_didFinishCheckingMissingCarrierSetting;
- (void)_displayFirstTimeRCSAlert;
- (void)_displayMissingInformationAlert:(int64_t)a3;
- (void)_displayNonPrimarySIMRCSActivationAlertForCarrierName:(id)a3;
- (void)_showNetworkPrefs:(int64_t)a3;
- (void)checkFirstTimeRCS;
- (void)checkMissingCarrierSetting;
- (void)setDelegate:(id)a3;
@end

@implementation CKAlertUtilities

- (void).cxx_destruct
{
}

- (void)_didFinishCheckingMissingCarrierSetting
{
  v3 = [(CKAlertUtilities *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKAlertUtilities *)self delegate];
    [v5 didFinishCheckingMissingCarrierSetting];
  }
}

- (CKAlertUtilitiesProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAlertUtilitiesProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)checkMissingCarrierSetting
{
  uint64_t v3 = [(id)objc_opt_class() missingAlertTypeToNotify];
  if (v3)
  {
    [(CKAlertUtilities *)self _displayMissingInformationAlert:v3];
  }
  else
  {
    [(CKAlertUtilities *)self _didFinishCheckingMissingCarrierSetting];
  }
}

- (void)checkFirstTimeRCS
{
  uint64_t v3 = [MEMORY[0x1E4F6E658] sharedManager];
  int v4 = [v3 carrierRequiresFirstTimeOnAlert];

  if (v4)
  {
    [(CKAlertUtilities *)self _displayFirstTimeRCSAlert];
  }
}

+ (int64_t)missingAlertTypeToNotify
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _getCTPhoneNumber];
  int64_t v3 = 0;
  if ([MEMORY[0x1E4F6E660] IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v2 simID:0])
  {
    int v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 showMMSSetup];

    if (!v5)
    {
LABEL_7:
      int64_t v3 = 0;
      goto LABEL_27;
    }
    if ([MEMORY[0x1E4F6E660] IMShouldShowMMSEmailAddress:v2 simID:0])
    {
      v6 = [MEMORY[0x1E4F6E660] IMMMSEmailAddressToMatchForPhoneNumber:v2 simID:0];
      if (![v6 length])
      {
        if (IMOSLoggingEnabled())
        {
          v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v15 = 138412290;
            v16 = v2;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Missing email for phoneNumber: %@", (uint8_t *)&v15, 0xCu);
          }
        }
        int64_t v3 = 2;
        goto LABEL_26;
      }
    }
    if (MEMORY[0x192FBA6E0](v2)) {
      goto LABEL_7;
    }
    int v7 = [(id)objc_opt_class() _isNumberEditable];
    v8 = [(id)objc_opt_class() _grabCTSIMStatus];
    v6 = v8;
    if (v7 && [v8 isEqualToString:*MEMORY[0x1E4F24210]])
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          v16 = v2;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Missing phone for phoneNumber: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v11 = [v10 BOOLForKey:@"SkipMissingPhoneNumberAlert"];

      if (!v11)
      {
        int64_t v3 = 1;
        goto LABEL_26;
      }
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Bypassing missing phone alert, running in automation", (uint8_t *)&v15, 2u);
        }
      }
    }
    int64_t v3 = 0;
LABEL_26:
  }
LABEL_27:

  return v3;
}

+ (id)_getCTPhoneNumber
{
  int64_t v3 = [a1 _phoneNumberInfo];
  if (v3)
  {
    int v4 = [a1 _phoneNumberInfo];
    int v5 = [v4 displayPhoneNumber];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (id)_phoneNumberInfo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (_phoneNumberInfo)
  {
    int64_t v3 = [(id)_phoneNumberInfo number];
    uint64_t v4 = [v3 length];

    if (v4) {
      goto LABEL_9;
    }
  }
  int v5 = [a1 coreTelephonyClient];
  v6 = [a1 selectedSubscriptionContext];
  id v13 = 0;
  uint64_t v7 = [v5 getPhoneNumber:v6 error:&v13];
  id v8 = v13;
  v9 = (void *)_phoneNumberInfo;
  _phoneNumberInfo = v7;

  if (!v8)
  {
LABEL_9:
    id v11 = (id)_phoneNumberInfo;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Error occurred while trying to get CTPhoneNumberInfo - %@", buf, 0xCu);
      }
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)coreTelephonyClient
{
  v2 = (void *)_coreTelephonyClient;
  if (!_coreTelephonyClient)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)_coreTelephonyClient;
    _coreTelephonyClient = v3;

    v2 = (void *)_coreTelephonyClient;
  }

  return v2;
}

+ (id)selectedSubscriptionContext
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)_selectedSubscriptionContext;
  if (_selectedSubscriptionContext) {
    goto LABEL_2;
  }
  uint64_t v4 = [a1 coreTelephonyClient];
  id v13 = 0;
  int v5 = [v4 getActiveContexts:&v13];
  id v6 = v13;

  if (!v6)
  {
    v9 = [v5 voicePreferred];
    v10 = [v5 findForUuid:v9];
    uint64_t v11 = [v10 context];
    v12 = (void *)_selectedSubscriptionContext;
    _selectedSubscriptionContext = v11;

    v2 = (void *)_selectedSubscriptionContext;
LABEL_2:
    id v3 = v2;
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Error occurred while trying to get active contexts - %@", buf, 0xCu);
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

+ (BOOL)_isNumberEditable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _phoneNumberInfo];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 isEditable];
  }
  else {
    int v4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [v3 isEditable];
      uint64_t v7 = @"NO";
      if (v6) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412546;
      v10 = v3;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Phone number: %@ - is editable: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4 != 0;
}

+ (id)_grabCTSIMStatus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 coreTelephonyClient];
  int v4 = [a1 selectedSubscriptionContext];
  id v13 = 0;
  int v5 = [v3 getSIMStatus:v4 error:&v13];
  id v6 = v13;

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Error occurred while trying to get SIM Status - %@", buf, 0xCu);
      }
    }
    id v9 = 0;
  }
  else
  {
    if (v7)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = [a1 selectedSubscriptionContext];
        *(_DWORD *)buf = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Sim status returned: %@ for selected subscription: %@", buf, 0x16u);
      }
    }
    id v9 = v5;
  }

  return v9;
}

- (void)_displayMissingInformationAlert:(int64_t)a3
{
  if (IMGetCachedDomainBoolForKey()) {
    return;
  }
  int v5 = (void *)MEMORY[0x1E4F42720];
  id v6 = CKFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"MMS_INFORMATION_MISSING_CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke;
  v25[3] = &unk_1E5621178;
  v25[4] = self;
  id v8 = [v5 actionWithTitle:v7 style:1 handler:v25];

  id v9 = (void *)MEMORY[0x1E4F42720];
  v10 = CKFrameworkBundle();
  __int16 v11 = [v10 localizedStringForKey:@"MMS_INFORMATION_MISSING_SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke_2;
  v24[3] = &unk_1E5628428;
  v24[4] = self;
  v24[5] = a3;
  v12 = [v9 actionWithTitle:v11 style:0 handler:v24];

  if (a3 == 1)
  {
    v19 = CKFrameworkBundle();
    id v13 = [v19 localizedStringForKey:@"MMS_PHONE_NUMBER_MISSING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    __int16 v16 = CKFrameworkBundle();
    uint64_t v17 = v16;
    uint64_t v18 = @"MMS_PHONE_NUMBER_MISSING_BODY";
    goto LABEL_6;
  }
  id v13 = 0;
  v14 = 0;
  if (a3 == 2)
  {
    id v15 = CKFrameworkBundle();
    id v13 = [v15 localizedStringForKey:@"MMS_EMAIL_MISSING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    __int16 v16 = CKFrameworkBundle();
    uint64_t v17 = v16;
    uint64_t v18 = @"MMS_EMAIL_MISSING_BODY";
LABEL_6:
    v14 = [v16 localizedStringForKey:v18 value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  v20 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v13 message:v14 preferredStyle:1];
  [v20 addAction:v8];
  [v20 addAction:v12];
  v21 = [(CKAlertUtilities *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(CKAlertUtilities *)self delegate];
    [v23 presentCKAlertController:v20];
  }
}

uint64_t __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishCheckingMissingCarrierSetting];
}

uint64_t __52__CKAlertUtilities__displayMissingInformationAlert___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showNetworkPrefs:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _didFinishCheckingMissingCarrierSetting];
}

- (void)_showNetworkPrefs:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = @"prefs:root=MESSAGES&path=MMS_EMAIL";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v3 = @"prefs:root=Phone&path=MY_NUMBER";
LABEL_5:
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  int v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openSensitiveURL:v5 withOptions:0];
}

- (void)_displayFirstTimeRCSAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  int v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"FIRST_TIME_RCS_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = CKFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"FIRST_TIME_RCS_ALERT_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4F42720];
  v10 = CKFrameworkBundle();
  __int16 v11 = [v10 localizedStringForKey:@"FIRST_TIME_RCS_ALERT_OKAY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__CKAlertUtilities__displayFirstTimeRCSAlert__block_invoke;
  v19[3] = &unk_1E5621178;
  v19[4] = self;
  v12 = [v9 actionWithTitle:v11 style:0 handler:v19];

  [v8 addAction:v12];
  [v8 setPreferredAction:v12];
  id v13 = (void *)MEMORY[0x1E4F42720];
  v14 = CKFrameworkBundle();
  id v15 = [v14 localizedStringForKey:@"FIRST_TIME_RCS_ALERT_CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  __int16 v16 = [v13 actionWithTitle:v15 style:1 handler:0];

  [v8 addAction:v16];
  uint64_t v17 = [(CKAlertUtilities *)self delegate];
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v18 = [(CKAlertUtilities *)self delegate];
    [v18 presentCKAlertController:v8];
  }
}

void __45__CKAlertUtilities__displayFirstTimeRCSAlert__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v3 = [MEMORY[0x1E4F6E668] sharedInstance];
  int v4 = [v3 ctSubscriptionInfo];
  id v5 = objc_msgSend(v4, "__im_preferredDataSubscriptionContext");
  id v6 = [v5 uuid];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v7 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v8 = [v7 ctSubscriptionInfo];
  objc_msgSend(v8, "__im_subscriptionsWithRCSSupport");
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = [(id)objc_opt_class() coreTelephonyClient];
        id v24 = 0;
        [v13 enableLazuli:v12 withError:&v24];
        id v14 = v24;

        if (v14 && IMOSLoggingEnabled())
        {
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v14;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Error occurred while trying to enable Lazuli: %@", buf, 0xCu);
          }
        }
        __int16 v16 = [v12 uuid];
        BOOL v17 = [v16 compare:v6] == 0;

        if (!v17)
        {
          uint64_t v18 = [MEMORY[0x1E4F6E668] sharedInstance];
          v19 = (void *)[v18 copyIsoCountryCodeForSubscriptionContext:v12];

          if ([v19 isEqualToString:@"cn"])
          {
            v20 = *(void **)(a1 + 32);
            v21 = [v12 label];
            [v20 _displayNonPrimarySIMRCSActivationAlertForCarrierName:v21];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v9);
  }
}

- (void)_displayNonPrimarySIMRCSActivationAlertForCarrierName:(id)a3
{
  id v34 = a3;
  uint64_t v32 = (void *)MEMORY[0x1E4F42728];
  id v3 = NSString;
  int v4 = CKFrameworkBundle();
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:", @"RCS_INACTIVE_SIM_ACTIVATION_ERROR_TITLE");
  id v6 = objc_msgSend(v3, "stringWithFormat:", v5, v34);

  int v7 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v8 = [v7 userInterfaceLayoutDirection];

  if (v8 == 1) {
    uint64_t v9 = @"\u200F";
  }
  else {
    uint64_t v9 = @"\u200E";
  }
  uint64_t v10 = [(__CFString *)v9 stringByAppendingString:v6];

  __int16 v11 = NSString;
  v12 = CKFrameworkBundle();
  id v13 = [v12 localizedStringForKey:@"RCS_INACTIVE_SIM_ACTIVATION_ERROR_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v14 = CKFrameworkBundle();
  id v15 = [v14 localizedStringForKey:@"RCS_INACTIVE_SIM_ACTIVATION_ERROR_CELLULAR_DATA_SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  __int16 v16 = objc_msgSend(v11, "stringWithFormat:", v13, v34, v15);

  BOOL v17 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v18 = [v17 userInterfaceLayoutDirection];

  if (v18 == 1) {
    v19 = @"\u200F";
  }
  else {
    v19 = @"\u200E";
  }
  v20 = [(__CFString *)v19 stringByAppendingString:v16];

  v21 = [v32 alertControllerWithTitle:v10 message:v20 preferredStyle:1];

  id v22 = (void *)MEMORY[0x1E4F42720];
  v23 = CKFrameworkBundle();
  id v24 = [v23 localizedStringForKey:@"RCS_INACTIVE_SIM_ACTIVATION_ERROR_CELLULAR_DATA_SETTINGS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  long long v25 = [v22 actionWithTitle:v24 style:0 handler:&__block_literal_global_122];

  [v21 addAction:v25];
  [v21 setPreferredAction:v25];
  long long v26 = (void *)MEMORY[0x1E4F42720];
  long long v27 = CKFrameworkBundle();
  uint64_t v28 = [v27 localizedStringForKey:@"RCS_INACTIVE_SIM_ACTIVATION_ERROR_NOT_NOW" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v29 = [v26 actionWithTitle:v28 style:1 handler:0];

  [v21 addAction:v29];
  id v30 = [(CKAlertUtilities *)self delegate];
  LOBYTE(v28) = objc_opt_respondsToSelector();

  if (v28)
  {
    v31 = [(CKAlertUtilities *)self delegate];
    [v31 presentCKAlertController:v21];
  }
}

void __74__CKAlertUtilities__displayNonPrimarySIMRCSActivationAlertForCarrierName___block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.Cellular"];
  [v1 openSensitiveURL:v0 withOptions:0 error:0];
}

@end