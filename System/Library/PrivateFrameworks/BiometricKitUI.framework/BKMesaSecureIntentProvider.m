@interface BKMesaSecureIntentProvider
- (BKMesaSecureIntentProvider)initWithAlertWindow:(id)a3 inBuddy:(BOOL)a4;
- (BKSecureIntentDisplayHost)displayHost;
- (BKUIAlertView)alertView;
- (BKUIAlertView)wrongButtonAlertView;
- (BOOL)_isMonitoringPowerButton;
- (BOOL)hasFingergprintsEnrolled;
- (BOOL)inDemo;
- (BOOL)needsToDisplayUI;
- (LAContext)context;
- (NSString)credential;
- (SecureIntentClientView)presentingView;
- (UIWindow)alertWindow;
- (void)_getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 showErrorToRetry:(BOOL)a5 withCompletionHandler:(id)a6;
- (void)_handleTouchIDEventWithParameters:(id)a3;
- (void)_startMonitoringPowerButton;
- (void)_stopMonitoringPowerButton;
- (void)configureIntentView;
- (void)dismissSecureIntentViewForUserInteraction;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 withCompletionHandler:(id)a5;
- (void)invalidateAuthContext;
- (void)reset;
- (void)setAlertView:(id)a3;
- (void)setAlertWindow:(id)a3;
- (void)setContext:(id)a3;
- (void)setCredential:(id)a3;
- (void)setDisplayHost:(id)a3;
- (void)setInDemo:(BOOL)a3;
- (void)setPresentingView:(id)a3;
- (void)setWrongButtonAlertView:(id)a3;
- (void)showAlert:(id)a3 detailedText:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation BKMesaSecureIntentProvider

- (BKMesaSecureIntentProvider)initWithAlertWindow:(id)a3 inBuddy:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKMesaSecureIntentProvider;
  v7 = [(BKMesaSecureIntentProvider *)&v13 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    context = v7->_context;
    v7->_context = (LAContext *)v8;

    [(LAContext *)v7->_context setUiDelegate:v7];
    v7->_inBuddy = a4;
    objc_storeWeak((id *)&v7->_alertWindow, v6);
    os_log_t v10 = os_log_create("com.apple.biometrickitui", "BKMesaSecureIntentProvider");
    authManagerLogs = v7->authManagerLogs;
    v7->authManagerLogs = (OS_os_log *)v10;
  }
  return v7;
}

- (void)getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(BKMesaSecureIntentProvider *)self _isMonitoringPowerButton];
  authManagerLogs = self->authManagerLogs;
  BOOL v13 = os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1E4B6C000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "Refused to start getSecureIntentForAccessory as we are already monitoring the Power Button for Secure Intent", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    if (v13)
    {
      v14 = authManagerLogs;
      v15 = [v8 description];
      v16 = [v9 description];
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1E4B6C000, v14, OS_LOG_TYPE_DEFAULT, "Start getSecureIntentForAccessory with accessory:%@, operation:%@", (uint8_t *)&v17, 0x16u);
    }
    [(BKMesaSecureIntentProvider *)self _startMonitoringPowerButton];
    [(BKMesaSecureIntentProvider *)self _getSecureIntentForAccessory:v8 enrollmentOperation:v9 showErrorToRetry:0 withCompletionHandler:v10];
  }
}

- (void)_getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 showErrorToRetry:(BOOL)a5 withCompletionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  authManagerLogs = self->authManagerLogs;
  if (os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v37 = v7;
    _os_log_impl(&dword_1E4B6C000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "_getSecureIntentForAccessory ... showRetry:%i", buf, 8u);
  }
  v14 = [(BKMesaSecureIntentProvider *)self context];

  if (v14)
  {
    v15 = [(BKMesaSecureIntentProvider *)self context];
    [v15 setUiDelegate:0];

    [(BKMesaSecureIntentProvider *)self setContext:0];
  }
  v16 = [(BKMesaSecureIntentProvider *)self context];

  if (!v16)
  {
    int v17 = objc_opt_new();
    [(BKMesaSecureIntentProvider *)self setContext:v17];

    v18 = [(BKMesaSecureIntentProvider *)self context];
    [v18 setUiDelegate:self];
  }
  if (![(BKMesaSecureIntentProvider *)self hasFingergprintsEnrolled]
    || v11
    || self->_hasAttemptedCrossMatch)
  {
    v34 = &unk_1F4094950;
    uint64_t v35 = MEMORY[0x1E4F1CC28];
    __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_27;
    aBlock[3] = &unk_1E6EA2858;
    BOOL v29 = v7;
    aBlock[4] = self;
    uint64_t v21 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v21[2](v21);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2_29;
      block[3] = &unk_1E6EA2568;
      uint64_t v21 = v21;
      id v27 = v21;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    __int16 v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v20 = self->authManagerLogs;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v20, OS_LOG_TYPE_DEFAULT, "SI has finger print enrolled ... trying crossmatch", buf, 2u);
    }
    if (self->_inBuddy)
    {

      __int16 v19 = 0;
      self->_touchIDMatch = 0;
      self->_touchIDMatchAttemptCount = 0;
    }
    else
    {
      v22 = [(BKMesaSecureIntentProvider *)self context];
      [v22 setUiDelegate:0];

      [v19 setObject:MEMORY[0x1E4F1CC28] forKey:&unk_1F4094920];
      v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"SI_SETTINGS_CROSS_MATCH_REQUEST_PROMPT" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];

      [v19 setObject:v24 forKey:&unk_1F4094938];
    }
    v25 = [(BKMesaSecureIntentProvider *)self context];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke;
    v30[3] = &unk_1E6EA3120;
    v30[4] = self;
    v33 = (void (**)(void))v12;
    id v31 = v10;
    id v32 = 0;
    [v25 evaluatePolicy:1 options:v19 reply:v30];

    uint64_t v21 = v33;
  }
}

void __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (v5)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "SI local auth succeeded, keyboard SI aquired.", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_15;
    block[3] = &unk_1E6EA30D0;
    void block[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 56);
    id v25 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v9 = v26;
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v6)
  {
    *(unsigned char *)(v10 + 18) = 0;
    v14 = *(void **)(a1 + 32);
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"SI_CROSS_MATCH_WRONG_SENSOR_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];
    int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"SI_CROSS_MATCH_WRONG_SENSOR_BODY" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E6EA30F8;
    __int16 v19 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v19;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    [v14 showAlert:v16 detailedText:v18 withCompletionHandler:v20];

    id v9 = v21;
LABEL_5:

    goto LABEL_10;
  }
  id v11 = *(NSObject **)(v10 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    BOOL v13 = [v7 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_1E4B6C000, v12, OS_LOG_TYPE_DEFAULT, "SI local auth failed ... trying power button press SI. %@", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = 1;
  [*(id *)(a1 + 32) _getSecureIntentForAccessory:*(void *)(a1 + 40) enrollmentOperation:*(void *)(a1 + 48) showErrorToRetry:0 withCompletionHandler:*(void *)(a1 + 56)];
LABEL_10:
}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_15(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = 1;
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) context];
    v4 = [v3 externalizedContext];
    (*(void (**)(uint64_t, void *, uint64_t, void))(v2 + 16))(v2, v4, 1, *(void *)(a1 + 40));
  }
  id v5 = [*(id *)(a1 + 32) displayHost];
  [v5 removeSecureIntentView:0 didSucceed:1 wasCancelled:0];

  id v6 = *(void **)(a1 + 32);

  return [v6 _stopMonitoringPowerButton];
}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSecureIntentForAccessory:*(void *)(a1 + 40) enrollmentOperation:*(void *)(a1 + 48) showErrorToRetry:0 withCompletionHandler:*(void *)(a1 + 56)];
}

void __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_27(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && ([*(id *)(a1 + 32) presentingView],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 superview],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    id v7 = [*(id *)(a1 + 32) presentingView];
    [v7 showRetryOnErrorUI];
  }
  else
  {
    [*(id *)(a1 + 32) configureIntentView];
    v4 = [*(id *)(a1 + 32) presentingView];
    [v4 setNeedsDisplay];

    id v5 = [*(id *)(a1 + 32) presentingView];
    [v5 showInitialUI];

    id v7 = [*(id *)(a1 + 32) displayHost];
    id v6 = [*(id *)(a1 + 32) presentingView];
    [v7 displaySecureIntentView:v6];
  }
}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  authManagerLogs = self->authManagerLogs;
  if (os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v24 = a3;
    _os_log_impl(&dword_1E4B6C000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory local auth event %ld", buf, 0xCu);
  }
  if (a3 == 1)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__BKMesaSecureIntentProvider_event_params_reply___block_invoke;
    v21[3] = &unk_1E6EA2180;
    v21[4] = self;
    id v22 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v21);
  }
  else if (a3 == 9)
  {
    id v11 = [v8 objectForKeyedSubscript:&unk_1F4094968];

    if (v11)
    {
      id v12 = [v8 objectForKeyedSubscript:&unk_1F4094968];
      self->_BOOL authParamActive = [v12 BOOLValue];
    }
    BOOL authParamActive = self->_authParamActive;
    v14 = self->authManagerLogs;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (authParamActive)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, v14, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Power Button LAEventParamActive: YES", buf, 2u);
      }
      v16 = [v8 objectForKeyedSubscript:&unk_1F4094980];

      if (v16)
      {
        int v17 = [v8 objectForKeyedSubscript:&unk_1F4094980];
        self->_pushCredentialPresent = [v17 BOOLValue];
      }
      if (self->_pushCredentialPresent)
      {
        v18 = self->authManagerLogs;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          __int16 v19 = "TrustedAccessory Power Button LAEventParamPushButtonCredentialPresent: YES";
          v20 = v18;
LABEL_18:
          _os_log_impl(&dword_1E4B6C000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
        }
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      __int16 v19 = "TrustedAccessory Power Button LAEventParamActive: NO";
      v20 = v14;
      goto LABEL_18;
    }
  }
}

uint64_t __49__BKMesaSecureIntentProvider_event_params_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTouchIDEventWithParameters:*(void *)(a1 + 40)];
}

- (void)_handleTouchIDEventWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_touchIDMatch)
  {
    id v6 = [v4 objectForKeyedSubscript:&unk_1F4094968];

    if (v6)
    {
      id v7 = [v5 objectForKeyedSubscript:&unk_1F4094968];
      self->_BOOL authParamActive = [v7 BOOLValue];
    }
    BOOL authParamActive = self->_authParamActive;
    authManagerLogs = self->authManagerLogs;
    BOOL v10 = os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT);
    if (authParamActive)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID LAEventParamActive: YES", buf, 2u);
      }
      id v11 = [v5 objectForKeyedSubscript:&unk_1F4094998];
      id v12 = v11;
      if (v11)
      {
        switch([v11 integerValue])
        {
          case 0:
            BOOL v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v26 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusFingerOn";
              BOOL v15 = (uint8_t *)&v26;
              goto LABEL_19;
            }
            break;
          case 1:
            BOOL v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v25 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusFingerOff";
              BOOL v15 = v25;
              goto LABEL_19;
            }
            break;
          case 2:
            self->_touchIDMatch = 1;
            BOOL v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v24 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusMatch";
              BOOL v15 = (uint8_t *)&v24;
LABEL_19:
              _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
            }
            break;
          case 3:
            unint64_t v16 = self->_touchIDMatchAttemptCount + 1;
            self->_touchIDMatchAttemptCount = v16;
            if (v16 > 2)
            {
              id v21 = self->authManagerLogs;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v23 = 0;
                _os_log_impl(&dword_1E4B6C000, v21, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID Max match exceeded triggering auth fail.", v23, 2u);
              }
              id v22 = [(BKMesaSecureIntentProvider *)self context];
              [v22 invalidate];
            }
            else
            {
              int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v18 = [v17 localizedStringForKey:@"SI_CROSS_MATCH_AUTH_FAIL_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];
              __int16 v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v20 = [v19 localizedStringForKey:@"SI_CROSS_MATCH_AUTH_FAIL_BODY" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];
              [(BKMesaSecureIntentProvider *)self showAlert:v18 detailedText:v20 withCompletionHandler:0];
            }
            break;
          default:
            break;
        }
      }
    }
    else if (v10)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1E4B6C000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID LAEventParamActive: NO", v28, 2u);
    }
  }
}

- (void)configureIntentView
{
  v3 = [(BKMesaSecureIntentProvider *)self presentingView];

  if (!v3)
  {
    id v4 = [(BKMesaSecureIntentProvider *)self displayHost];
    int v5 = [v4 inBuddy];

    if (v5)
    {
      id v8 = +[BuddySecureIntentClientView instance];
      [(BKMesaSecureIntentProvider *)self setPresentingView:v8];
    }
    else
    {
      if ([(BKMesaSecureIntentProvider *)self inDemo] && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v6 = +[BKUISettingsSecureIntentClientView instanceForDemo:1];
      }
      else
      {
        uint64_t v6 = +[BKUISettingsSecureIntentClientView instance];
      }
      id v7 = (void *)v6;
      [(BKMesaSecureIntentProvider *)self setPresentingView:v6];

      id v8 = [(BKMesaSecureIntentProvider *)self presentingView];
      [v8 setSecureIntentProvider:self];
    }
  }
}

- (void)dismissSecureIntentViewForUserInteraction
{
  [(BKMesaSecureIntentProvider *)self invalidateAuthContext];
  id v4 = [(BKMesaSecureIntentProvider *)self displayHost];
  v3 = [(BKMesaSecureIntentProvider *)self presentingView];
  [v4 removeSecureIntentView:v3 didSucceed:0 wasCancelled:0];
}

- (void)invalidateAuthContext
{
  v3 = [(BKMesaSecureIntentProvider *)self context];
  [v3 invalidate];

  [(BKMesaSecureIntentProvider *)self setContext:0];
}

- (void)reset
{
  self->_hasAttemptedCrossMatch = 0;
  [(BKMesaSecureIntentProvider *)self dismissSecureIntentViewForUserInteraction];
}

- (void)_startMonitoringPowerButton
{
}

- (BOOL)_isMonitoringPowerButton
{
  return self->_hidClient != 0;
}

- (void)_stopMonitoringPowerButton
{
}

- (BOOL)hasFingergprintsEnrolled
{
  uint64_t v2 = [(BKMesaSecureIntentProvider *)self displayHost];
  BOOL v3 = [v2 _bkIdentityCount] != 0;

  return v3;
}

- (void)showAlert:(id)a3 detailedText:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E6EA30F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) displayHost];
  BOOL v3 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 40) message:*(void *)(a1 + 48) preferredStyle:1];
  id v4 = (void *)MEMORY[0x1E4F42720];
  int v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI-A222"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6EA3148;
  id v9 = *(id *)(a1 + 56);
  id v7 = [v4 actionWithTitle:v6 style:2 handler:v8];
  [v3 addAction:v7];

  [v2 presentViewController:v3 animated:1 completion:0];
}

uint64_t __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)needsToDisplayUI
{
  BOOL v3 = [(BKMesaSecureIntentProvider *)self presentingView];
  id v4 = [v3 superview];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else if ([(BKMesaSecureIntentProvider *)self hasFingergprintsEnrolled])
  {
    BOOL v5 = !self->_hasAttemptedCrossMatch;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (SecureIntentClientView)presentingView
{
  return self->_presentingView;
}

- (void)setPresentingView:(id)a3
{
}

- (UIWindow)alertWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setAlertWindow:(id)a3
{
}

- (BOOL)inDemo
{
  return self->_inDemo;
}

- (void)setInDemo:(BOOL)a3
{
  self->_inDemo = a3;
}

- (BKSecureIntentDisplayHost)displayHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayHost);

  return (BKSecureIntentDisplayHost *)WeakRetained;
}

- (void)setDisplayHost:(id)a3
{
}

- (NSString)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BKUIAlertView)alertView
{
  return (BKUIAlertView *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlertView:(id)a3
{
}

- (BKUIAlertView)wrongButtonAlertView
{
  return (BKUIAlertView *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWrongButtonAlertView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrongButtonAlertView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_destroyWeak((id *)&self->_displayHost);
  objc_destroyWeak((id *)&self->_alertWindow);
  objc_storeStrong((id *)&self->_presentingView, 0);

  objc_storeStrong((id *)&self->authManagerLogs, 0);
}

@end