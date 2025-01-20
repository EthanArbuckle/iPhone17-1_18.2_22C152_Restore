@interface CKFocusStatusAuthorizationManager
+ (CKFocusStatusAuthorizationManager)sharedInstance;
- (BOOL)deviceSupportsFocusStatusAuthorizationPrompt;
- (BOOL)isPresentingFocusStatusAuthorizationPrompt;
- (BOOL)isPresentingInconsistentFocusStatusAuthorizationPrompt;
- (id)focusStatusPreferencesURL;
- (id)newDNDGlobalConfigurationService;
- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:(id)a3;
- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:(id)a3;
- (void)newDNDGlobalConfigurationService;
- (void)notifyDNDFocusStatusAuthorizationChanged;
- (void)presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:(id)a3;
- (void)promptForFocusStatusAuthorizationFromViewController:(id)a3;
- (void)setPresentingFocusStatusAuthorizationPrompt:(BOOL)a3;
- (void)setPresentingInconsistentFocusStatusAuthorizationPrompt:(BOOL)a3;
- (void)verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:(id)a3;
@end

@implementation CKFocusStatusAuthorizationManager

+ (CKFocusStatusAuthorizationManager)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_146);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return (CKFocusStatusAuthorizationManager *)v2;
}

void __51__CKFocusStatusAuthorizationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKFocusStatusAuthorizationManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;
}

- (void)presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMessages())
  {
    if ([MEMORY[0x1E4F6E5D0] isInAppleStoreDemoMode])
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Not checking Focus Status Authorization. Device is in Apple Store Demo Mode.";
LABEL_32:
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v15, 2u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if ([(CKFocusStatusAuthorizationManager *)self isPresentingFocusStatusAuthorizationPrompt])
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Focus Status Authorization prompt is already presented, not re-presenting.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if ([(CKFocusStatusAuthorizationManager *)self isPresentingInconsistentFocusStatusAuthorizationPrompt])
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Inconsistent Focus Status Authorization prompt is already presented, not re-presenting.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (![(CKFocusStatusAuthorizationManager *)self deviceSupportsFocusStatusAuthorizationPrompt])
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          v6 = "Not checking Focus Status Authorization. Device does not support prompting for Focus Status TCC.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (CKIsRunningInMacCatalyst())
    {
      v7 = [v4 view];
      v8 = [v7 window];

      if (!v8
        || !+[CKApplicationState isWindowForegroundActive:v8])
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_53:

          goto LABEL_34;
        }
        v12 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
LABEL_52:

          goto LABEL_53;
        }
        *(_WORD *)v15 = 0;
        v13 = "Not checking Focus Status Authorization. Messages window is not foreground active.";
LABEL_38:
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, v13, v15, 2u);
        goto LABEL_52;
      }
    }
    v9 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    v10 = [v9 activeIMessageAccount];

    if (!v10)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_34;
      }
      v5 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_WORD *)v15 = 0;
      v6 = "Not checking Focus Status Authorization. There is no active iMessage account.";
      goto LABEL_32;
    }
    v8 = [MEMORY[0x1E4F30440] defaultCenter];
    switch([v8 authorizationStatus])
    {
      case 0:
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Focus Status authorization status is not determined. Prompting for authorization.", v15, 2u);
          }
        }
        [(CKFocusStatusAuthorizationManager *)self promptForFocusStatusAuthorizationFromViewController:v4];
        goto LABEL_53;
      case 1:
        v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CKFocusStatusAuthorizationManager presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:]();
        }
        goto LABEL_52;
      case 2:
        if (IMOSLoggingEnabled())
        {
          v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Focus Status authorization status is denied, checking for inconsistent cross-device state.", v15, 2u);
          }
        }
        [(CKFocusStatusAuthorizationManager *)self verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:v4];
        goto LABEL_53;
      case 3:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_53;
        }
        v12 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
          goto LABEL_52;
        }
        *(_WORD *)v15 = 0;
        v13 = "Focus Status authorization status is authorized.";
        break;
      default:
        goto LABEL_53;
    }
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      v6 = "Not checking Focus Status Authorization. Not running in Messages.";
      goto LABEL_32;
    }
LABEL_33:
  }
LABEL_34:
}

- (BOOL)isPresentingInconsistentFocusStatusAuthorizationPrompt
{
  return self->_presentingInconsistentFocusStatusAuthorizationPrompt;
}

- (BOOL)isPresentingFocusStatusAuthorizationPrompt
{
  return self->_presentingFocusStatusAuthorizationPrompt;
}

- (BOOL)deviceSupportsFocusStatusAuthorizationPrompt
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "This device is capable of prompting for TCC", v4, 2u);
    }
  }
  return 1;
}

- (void)promptForFocusStatusAuthorizationFromViewController:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F30440] defaultCenter];
  [(CKFocusStatusAuthorizationManager *)self setPresentingFocusStatusAuthorizationPrompt:1];
  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke;
  v7[3] = &unk_1E5628E30;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 requestAuthorizationWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPresentingFocusStatusAuthorizationPrompt:0];
  [WeakRetained notifyDNDFocusStatusAuthorizationChanged];
  switch(a2)
  {
    case 0:
      v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_1();
      }
      goto LABEL_14;
    case 1:
      v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_2();
      }
      goto LABEL_14;
    case 2:
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Focus Status authorization was denied, after prompting for authorization. Checking for inconsistent cross-device state.", buf, 2u);
        }
      }
      [WeakRetained verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:*(void *)(a1 + 32)];
      goto LABEL_15;
    case 3:
      if (!IMOSLoggingEnabled()) {
        goto LABEL_15;
      }
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Focus Status authorization status was authorized when prompting for authorization.", v7, 2u);
      }
LABEL_14:

LABEL_15:
      return;
    default:
      goto LABEL_15;
  }
}

- (void)notifyDNDFocusStatusAuthorizationChanged
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Notifying DND that focus status authorization has changed.", v5, 2u);
    }
  }
  id v4 = [(CKFocusStatusAuthorizationManager *)self newDNDGlobalConfigurationService];
  [v4 didChangeFocusStatusSharingSettingForApplicationIdentifier:@"com.apple.MobileSMS"];
}

- (id)newDNDGlobalConfigurationService
{
  v2 = (void *)MEMORY[0x192FBA860](@"DNDGlobalConfigurationService", @"DoNotDisturb");
  if (v2)
  {
    v3 = [v2 serviceForClientIdentifier:@"com.apple.messages"];
    id v4 = v3;
    if (v3)
    {
      id v4 = v3;
      v5 = v4;
    }
    else
    {
      id v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService]();
      }

      v5 = 0;
    }
  }
  else
  {
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CKFocusStatusAuthorizationManager newDNDGlobalConfigurationService]();
    }
    v5 = 0;
  }

  return v5;
}

- (void)verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CKFocusStatusAuthorizationManager *)self newDNDGlobalConfigurationService];
  if ([v5 isCloudSyncActive])
  {
    id v6 = [MEMORY[0x1E4F6BCE0] sharedInstance];
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Fetching personal availability to verify published status is consistent with denied focus status authorization.", buf, 2u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke;
    v8[3] = &unk_1E5628E30;
    objc_copyWeak(&v10, (id *)buf);
    id v9 = v4;
    [v6 fetchPersonalAvailabilityWithCompletion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
LABEL_10:

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Not verifying published status, share across devices is disabled for this device", buf, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 == 2)
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_2();
    }

    [WeakRetained displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:*(void *)(a1 + 32)];
  }
  else
  {
    if (a2 == 1)
    {
      id v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_1();
      }
      goto LABEL_9;
    }
    if (!a2 && IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Personal availability is unknown. That is consistent with denied focus status authorization.", v7, 2u);
      }
LABEL_9:
    }
  }
}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:(id)a3
{
  id v4 = a3;
  if (IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKFocusStatusAuthorizationManager displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:]();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Have not previously shown repair focus status authorization inconsistency repair alert, displaying now", v7, 2u);
      }
    }
    [(CKFocusStatusAuthorizationManager *)self displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:v4];
  }
}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController:(id)a3
{
  id v20 = a3;
  [(CKFocusStatusAuthorizationManager *)self setPresentingInconsistentFocusStatusAuthorizationPrompt:1];
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  LODWORD(v4) = CKIsRunningInMacCatalyst();
  id v6 = CKFrameworkBundle();
  v7 = v6;
  if (v4) {
    id v8 = @"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_BODY_MAC";
  }
  else {
    id v8 = @"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_ALERT_BODY";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v10 = +[CKAlertController alertControllerWithTitle:v5 message:v9 preferredStyle:1];
  int v11 = CKIsRunningInMacCatalyst();
  v12 = CKFrameworkBundle();
  v13 = v12;
  if (v11) {
    v14 = @"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_SETTINGS_ACTION_TITLE_MAC";
  }
  else {
    v14 = @"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_SETTINGS_ACTION_TITLE";
  }
  v15 = [v12 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke;
  v23[3] = &unk_1E5621850;
  objc_copyWeak(&v24, &location);
  v16 = +[CKAlertAction actionWithTitle:v15 style:0 handler:v23];
  v17 = CKFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"INCONSISTENT_FOCUS_STATUS_AUTHORIZATION_CANCEL_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke_2;
  v21[3] = &unk_1E5621850;
  objc_copyWeak(&v22, &location);
  v19 = +[CKAlertAction actionWithTitle:v18 style:1 handler:v21];
  [v10 addAction:v16];
  [v10 addAction:v19];
  [v10 presentFromViewController:v20 animated:1 completion:0];
  IMSetDomainBoolForKey();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresentingInconsistentFocusStatusAuthorizationPrompt:0];
  v1 = [WeakRetained focusStatusPreferencesURL];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v1 withOptions:0];
}

void __111__CKFocusStatusAuthorizationManager_displayFocusStatusAuthorizationInconsistencyRepairAlertFromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresentingInconsistentFocusStatusAuthorizationPrompt:0];
}

- (id)focusStatusPreferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=FOCUS"];
}

- (void)setPresentingFocusStatusAuthorizationPrompt:(BOOL)a3
{
  self->_presentingFocusStatusAuthorizationPrompt = a3;
}

- (void)setPresentingInconsistentFocusStatusAuthorizationPrompt:(BOOL)a3
{
  self->_presentingInconsistentFocusStatusAuthorizationPrompt = a3;
}

- (void)presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Focus Status authorization status is restricted. Not recoverable. Taking no action.", v2, v3, v4, v5, v6);
}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Focus Status authorization status is not determined, after promting for authorization. Taking no action.", v2, v3, v4, v5, v6);
}

void __89__CKFocusStatusAuthorizationManager_promptForFocusStatusAuthorizationFromViewController___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Focus Status authorization status is restricted, after prompting for authorization. Taking no action.", v2, v3, v4, v5, v6);
}

- (void)newDNDGlobalConfigurationService
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to create DNDGlobalConfigurationService", v2, v3, v4, v5, v6);
}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Personal availability is available. Having a published status is potentially inconsistent with denied focus status authorization, but the available state is consistent with the default UI. Not displaying repair TCC alert.", v2, v3, v4, v5, v6);
}

void __123__CKFocusStatusAuthorizationManager_verifyPublishedStatusIsConsistentWithDeniedFocusStatusAuthorizationFromViewController___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Personal availability is unavailable. This is inconsistent with a denied focus status authorization. This user will incorrectly appear unavailable to any person messaged, and there is no way to recover from this state as another device is likely publishing the status.  Displaying repair TCC alert if necessary.", v2, v3, v4, v5, v6);
}

- (void)displayFocusStatusAuthorizationInconsistencyRepairAlertIfNotPreviouslyShownFromViewController:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Focus status authorization is inconsistent with published status, but user has already declined to fix this problem. We will not reprompt the user.", v2, v3, v4, v5, v6);
}

@end