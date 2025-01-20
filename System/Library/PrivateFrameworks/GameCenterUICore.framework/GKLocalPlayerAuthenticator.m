@interface GKLocalPlayerAuthenticator
+ (BOOL)shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:(id)a3;
+ (id)authenticatorForExistingPlayer:(id)a3;
+ (id)authenticatorForExistingPlayer:(id)a3 withPresentingViewController:(id)a4;
+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4;
+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4 withPresentingViewController:(id)a5;
+ (void)postURL:(id)a3 postBody:(id)a4 completion:(id)a5;
- (BOOL)_shouldDisableWithGlobalDisabled:(BOOL)a3 appLevelDisabled:(BOOL)a4 processLevelDisabled:(BOOL)a5;
- (BOOL)forceAuthentication;
- (BOOL)isAuthenticated;
- (BOOL)isAuthenticating;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldAuthenticateForGameCenter;
- (BOOL)userShouldSkipCreateAppleID;
- (GKDispatchGroup)u13Group;
- (GKLocalPlayer)inputLocalPlayer;
- (GKLocalPlayer)resultantLocalPlayer;
- (GKLocalPlayerAuthenticator)init;
- (NSDate)lastAuthDate;
- (NSMutableArray)u13ObjectModels;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)description;
- (NSString)lastAuthPlayerID;
- (NSString)password;
- (NSString)username;
- (RemoteUIController)remoteU13Controller;
- (UINavigationController)u13NavigationController;
- (UIViewController)presentingViewController;
- (void)_authenticateUsingAuthUI:(BOOL)a3 authenticationResults:(id)a4 usernameEditable:(BOOL)a5 authUIDismissHandler:(id)a6 completionHandler:(id)a7;
- (void)_handleAuthResponse:(id)a3 error:(id)a4 handler:(id)a5;
- (void)_handleEditedAuthResponse:(id)a3 error:(id)a4 handler:(id)a5;
- (void)applicationDidEnterBackground:(id)a3;
- (void)authenticateExistingUserAuthUIWithCompletionHandler:(id)a3;
- (void)authenticateFromExternalServiceWithAuthenticationResults:(id)a3 withHandler:(id)a4;
- (void)authenticateUsingAuthUIAllowingAppleIDCreation:(BOOL)a3 usernameEditable:(BOOL)a4 dismissHandler:(id)a5 completionHandler:(id)a6;
- (void)authenticateUsingAuthUIWithAuthUIDismissHandler:(id)a3 completionHandler:(id)a4;
- (void)authenticateUsingAuthUIWithCompletionHandler:(id)a3;
- (void)authenticateWithAuthKitResults:(id)a3 completionHandler:(id)a4;
- (void)authenticateWithCompletionHandler:(id)a3;
- (void)authenticationDidComplete;
- (void)cancelAuthDueToAuthKitErrorWithHandler:(id)a3;
- (void)dealloc;
- (void)handleAuthKitResultsForUnder13WithContinuationData:(id)a3 altDSID:(id)a4 password:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)reset;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticating:(BOOL)a3;
- (void)setForceAuthentication:(BOOL)a3;
- (void)setInputLocalPlayer:(id)a3;
- (void)setLastAuthDate:(id)a3;
- (void)setLastAuthPlayerID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRemoteU13Controller:(id)a3;
- (void)setResultantLocalPlayer:(id)a3;
- (void)setU13Group:(id)a3;
- (void)setU13NavigationController:(id)a3;
- (void)setU13ObjectModels:(id)a3;
- (void)setUserShouldSkipCreateAppleID:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation GKLocalPlayerAuthenticator

+ (id)authenticatorForExistingPlayer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setInputLocalPlayer:v4];

  return v5;
}

+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setUsername:v7];

  [v8 setPassword:v6];
  return v8;
}

+ (id)authenticatorForExistingPlayer:(id)a3 withPresentingViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() authenticatorForExistingPlayer:v6];

  [v7 setPresentingViewController:v5];
  return v7;
}

+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4 withPresentingViewController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() authenticatorForPlayerWithUsername:v9 password:v8];

  [v10 setPresentingViewController:v7];
  return v10;
}

- (GKLocalPlayerAuthenticator)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKLocalPlayerAuthenticator;
  v2 = [(GKLocalPlayerAuthenticator *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = [MEMORY[0x263F40198] didEnterBackground];
    [v3 addObserver:v2 selector:sel_applicationDidEnterBackground_ name:v4 object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKLocalPlayerAuthenticator;
  [(GKLocalPlayerAuthenticator *)&v4 dealloc];
}

- (void)authenticateUsingAuthUIWithAuthUIDismissHandler:(id)a3 completionHandler:(id)a4
{
}

- (void)authenticateUsingAuthUIWithCompletionHandler:(id)a3
{
}

- (BOOL)shouldAuthenticateForGameCenter
{
  v2 = [MEMORY[0x263F40298] shared];
  if ([v2 isGameCenterDisabled])
  {
    char v3 = 0;
  }
  else
  {
    objc_super v4 = [MEMORY[0x263F401B8] currentDevice];
    char v3 = [v4 isGameKitAvailable];
  }
  return v3;
}

- (void)authenticateWithAuthKitResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__GKLocalPlayerAuthenticator_authenticateWithAuthKitResults_completionHandler___block_invoke;
  v8[3] = &unk_264789C80;
  id v9 = v6;
  id v7 = v6;
  [(GKLocalPlayerAuthenticator *)self _authenticateUsingAuthUI:0 authenticationResults:a3 usernameEditable:1 authUIDismissHandler:0 completionHandler:v8];
}

void __79__GKLocalPlayerAuthenticator_authenticateWithAuthKitResults_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (NSObject **)MEMORY[0x263F40328];
  v13 = *MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328])
  {
    id v14 = (id)GKOSLoggers();
    v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __79__GKLocalPlayerAuthenticator_authenticateWithAuthKitResults_completionHandler___block_invoke_cold_1(v13, a2, (uint64_t)v10);
  }
  switch(a2)
  {
    case 0:
      v16 = v9;
      id v17 = 0;
      goto LABEL_9;
    case 1:
      v16 = v9;
      id v17 = v10;
LABEL_9:
      [v16 authenticationDidCompleteWithError:v17];
      break;
    case 2:

      v15 = [MEMORY[0x263F40270] authenticationPersonality];
      [v15 authenticationShowGreenBuddyUIForLocalPlayer:v9 withCompletionHandler:0];
      goto LABEL_11;
    case 3:

      [v9 authenticationDidCompleteWithError:0];
      goto LABEL_13;
    case 4:
    case 5:
    case 6:

      v15 = [MEMORY[0x263F40270] authenticationPersonality];
      [v15 authenticationShowSignInUIForLocalPlayer:v9 origin:4 dismiss:0];
LABEL_11:

LABEL_13:
      id v10 = 0;
      break;
    default:
      break;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateExistingUserAuthUIWithCompletionHandler:(id)a3
{
}

- (void)authenticateWithCompletionHandler:(id)a3
{
}

- (void)cancelAuthDueToAuthKitErrorWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F087E8] userErrorForCode:2 underlyingError:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__GKLocalPlayerAuthenticator_cancelAuthDueToAuthKitErrorWithHandler___block_invoke;
  block[3] = &unk_264789CA8;
  block[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__GKLocalPlayerAuthenticator_cancelAuthDueToAuthKitErrorWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthResponse:0 error:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)authenticateUsingAuthUIAllowingAppleIDCreation:(BOOL)a3 usernameEditable:(BOOL)a4 dismissHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328]) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = (os_log_t *)MEMORY[0x263F40340];
  v15 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v15, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: using auth UI", buf, 2u);
  }
  CFAbsoluteTimeGetCurrent();
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v16 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  uint64_t v37 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v32 = &unk_264789EF8;
    v33 = &v34;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)buf);
    v16 = (void *)v35[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v34, 8);
  id v18 = objc_alloc_init(v17);
  if (!self->_username)
  {
    v19 = GKGameCenterUIFrameworkBundle();
    v20 = GKGetLocalizedStringFromTableInBundle();
    [v18 setReason:v20];

    v12 = (void *)MEMORY[0x263F40328];
  }
  [v18 setServiceType:6];
  [v18 setUsername:self->_username];
  [v18 setShouldAllowAppleIDCreation:v8];
  [v18 setIsUsernameEditable:v7];
  [v18 setPresentingViewController:self->_presentingViewController];
  id v21 = objc_alloc_init(MEMORY[0x263F29118]);
  if (!*v12) {
    id v22 = (id)GKOSLoggers();
  }
  v23 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v23, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: presenting auth UI with AKAppleIDAuthenticationController", buf, 2u);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke;
  v26[3] = &unk_264789CD0;
  v26[4] = self;
  id v27 = v10;
  id v28 = v11;
  id v24 = v11;
  id v25 = v10;
  [v21 authenticateWithContext:v18 completion:v26];
}

void __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  BOOL v8 = (void *)MEMORY[0x263F40328];
  uint64_t v9 = *MEMORY[0x263F40328];
  id v10 = (os_log_t *)MEMORY[0x263F40340];
  if (v6)
  {
    if (!v9) {
      id v11 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_ERROR)) {
      __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    if (!v9) {
      id v12 = (id)GKOSLoggers();
    }
    id v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22600C000, v13, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: appleIDController returned successfully", buf, 2u);
    }
  }
  id v14 = [v5 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  [*(id *)(a1 + 32) setUsername:v14];

  v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  [*(id *)(a1 + 32) setPassword:v15];

  v16 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  id v17 = [v5 objectForKey:*MEMORY[0x263F28FE8]];
  if (v17) {
    [*(id *)(a1 + 32) handleAuthKitResultsForUnder13WithContinuationData:v17 altDSID:v16 password:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  if (!*v8) {
    id v18 = (id)GKOSLoggers();
  }
  v19 = *v10;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_22600C000, v19, OS_LOG_TYPE_INFO, "GKLocalPlayerAuthenticator: Finished under 13 account processing, calling handler.", v23, 2u);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = [*(id *)(a1 + 32) username];
  id v22 = [*(id *)(a1 + 32) password];
  (*(void (**)(uint64_t, void *, void *, void *, void, void, id))(v20 + 16))(v20, v21, v22, v16, *(void *)(*(void *)(a1 + 32) + 64), *(void *)(*(void *)(a1 + 32) + 72), v6);
}

- (void)_authenticateUsingAuthUI:(BOOL)a3 authenticationResults:(id)a4 usernameEditable:(BOOL)a5 authUIDismissHandler:(id)a6 completionHandler:(id)a7
{
  LODWORD(v9) = a5;
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (!v14)
  {
    v15 = NSString;
    v16 = [NSString stringWithFormat:@"Assertion failed"];
    id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m"];
    id v18 = [v17 lastPathComponent];
    v19 = [v15 stringWithFormat:@"%@ (handler != ((void *)0))\n[%s (%s:%d)]", v16, "-[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:]", objc_msgSend(v18, "UTF8String"), 318];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v19 format];
  }
  if ([(GKLocalPlayerAuthenticator *)self forceAuthentication])
  {
    [(GKLocalPlayerAuthenticator *)self setForceAuthentication:0];
    [(GKLocalPlayerAuthenticator *)self setAuthenticating:0];
  }
  else
  {
    if ([(GKLocalPlayerAuthenticator *)self isAuthenticated])
    {
      [(GKLocalPlayerAuthenticator *)self setAuthenticating:0];
      if (!*MEMORY[0x263F40328]) {
        id v20 = (id)GKOSLoggers();
      }
      id v21 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v21, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Player is already authenticated. GKLocalPlayerAuthResultSuccess", buf, 2u);
      }
      id v22 = [(GKLocalPlayerAuthenticator *)self resultantLocalPlayer];
      (*((void (**)(id, void, void *, void, void))v14 + 2))(v14, 0, v22, 0, 0);
      goto LABEL_42;
    }
    if ([(GKLocalPlayerAuthenticator *)self isAuthenticating])
    {
      if (!*MEMORY[0x263F40328]) {
        id v23 = (id)GKOSLoggers();
      }
      id v24 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v24, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Player is already authenticating. GKErrorAuthenticationInProgress", buf, 2u);
      }
      id v22 = [(GKLocalPlayerAuthenticator *)self resultantLocalPlayer];
      id v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = 7;
      goto LABEL_41;
    }
  }
  id v27 = [MEMORY[0x263F40298] shared];
  int v28 = [v27 isGameCenterRestricted];

  if (v28)
  {
    [(GKLocalPlayerAuthenticator *)self setAuthenticating:0];
    if (!*MEMORY[0x263F40328]) {
      id v29 = (id)GKOSLoggers();
    }
    uint64_t v30 = *MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22600C000, v30, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is Restricted. GKErrorParentalControlsBlocked", buf, 2u);
    }
    id v22 = [(GKLocalPlayerAuthenticator *)self resultantLocalPlayer];
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = 10;
LABEL_41:
    v42 = [v25 userErrorForCode:v26 underlyingError:0];
    (*((void (**)(id, uint64_t, void *, void *, void))v14 + 2))(v14, 1, v22, v42, 0);

LABEL_42:
    goto LABEL_43;
  }
  v31 = [MEMORY[0x263F40298] shared];
  int v32 = [v31 lockedDown];

  if (v32)
  {
    [(GKLocalPlayerAuthenticator *)self setAuthenticating:0];
    if (!*MEMORY[0x263F40328]) {
      id v33 = (id)GKOSLoggers();
    }
    uint64_t v34 = *MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22600C000, v34, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is disabled in Lockdown Mode. GKErrorLockdownMode", buf, 2u);
    }
    id v22 = [(GKLocalPlayerAuthenticator *)self resultantLocalPlayer];
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = 36;
    goto LABEL_41;
  }
  v35 = [MEMORY[0x263F401B8] currentDevice];
  int v36 = [v35 isGameKitAvailable];

  if ((v36 & 1) == 0)
  {
    [(GKLocalPlayerAuthenticator *)self setAuthenticating:0];
    if (!*MEMORY[0x263F40328]) {
      id v40 = (id)GKOSLoggers();
    }
    v41 = *MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22600C000, v41, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is not supported on this device. GKErrorNotSupported", buf, 2u);
    }
    id v22 = [(GKLocalPlayerAuthenticator *)self resultantLocalPlayer];
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = 16;
    goto LABEL_41;
  }
  [(GKLocalPlayerAuthenticator *)self setAuthenticating:1];
  if (v10)
  {
    uint64_t v37 = [(GKLocalPlayerAuthenticator *)self username];
    v38 = [(GKLocalPlayerAuthenticator *)self username];
    if (v38) {
      uint64_t v9 = v9;
    }
    else {
      uint64_t v9 = 1;
    }
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke;
    v68[3] = &unk_264789D20;
    v68[4] = self;
    id v69 = v14;
    [(GKLocalPlayerAuthenticator *)self authenticateUsingAuthUIAllowingAppleIDCreation:v37 == 0 usernameEditable:v9 dismissHandler:v13 completionHandler:v68];

    v39 = v69;
  }
  else
  {
    if (v12)
    {
      [(GKLocalPlayerAuthenticator *)self authenticateFromExternalServiceWithAuthenticationResults:v12 withHandler:v14];
      goto LABEL_43;
    }
    uint64_t v43 = [(GKLocalPlayerAuthenticator *)self username];
    if (v43
      && (v44 = (void *)v43,
          [(GKLocalPlayerAuthenticator *)self password],
          v45 = objc_claimAutoreleasedReturnValue(),
          v45,
          v44,
          v45))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (!*MEMORY[0x263F40328]) {
        id v47 = (id)GKOSLoggers();
      }
      v48 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v48, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Username and password passed in.GKDaemonProxy to authenticate player", buf, 2u);
      }
      v49 = (void *)MEMORY[0x263F401B0];
      v50 = [(GKLocalPlayerAuthenticator *)self inputLocalPlayer];
      v51 = [v49 proxyForPlayer:v50];
      v52 = [v51 accountServicePrivate];
      v53 = [(GKLocalPlayerAuthenticator *)self username];
      v54 = [(GKLocalPlayerAuthenticator *)self password];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_132;
      v62[3] = &unk_264789D48;
      CFAbsoluteTime v64 = Current;
      v62[4] = self;
      id v63 = v14;
      [v52 authenticatePlayerWithUsername:v53 password:v54 handler:v62];

      v39 = v63;
    }
    else
    {
      if (!*MEMORY[0x263F40328]) {
        id v55 = (id)GKOSLoggers();
      }
      v56 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v56, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Username and/or Password missing. GKDaemonProxy to authenticate player", buf, 2u);
      }
      CFAbsoluteTime v57 = CFAbsoluteTimeGetCurrent();
      v58 = (void *)MEMORY[0x263F401B0];
      v59 = [(GKLocalPlayerAuthenticator *)self inputLocalPlayer];
      v60 = [v58 proxyForPlayer:v59];
      v61 = [v60 accountService];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129;
      v65[3] = &unk_264789D48;
      CFAbsoluteTime v67 = v57;
      v65[4] = self;
      id v66 = v14;
      [v61 authenticatePlayerWithExistingCredentialsWithHandler:v65];

      v39 = v66;
    }
  }

LABEL_43:
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v13 && v14 && !a7)
  {
    id v18 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
    v19 = [v18 accountServicePrivate];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_264789CF8;
    id v24 = v16;
    id v20 = v17;
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(a1 + 40);
    id v25 = v20;
    uint64_t v26 = v21;
    id v27 = v22;
    [v19 authenticatePlayerWithUsername:v13 password:v14 altDSID:v15 usingFastPath:1 handler:v23];
  }
  else
  {
    [*(id *)(a1 + 32) cancelAuthDueToAuthKitErrorWithHandler:*(void *)(a1 + 40)];
  }
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 setAlertTitle:v5];
  [v7 setAlertMessage:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _handleAuthResponse:v7 error:v6 handler:*(void *)(a1 + 56)];
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F40328];
  if (v6)
  {
    if (!*MEMORY[0x263F40328]) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_4();
    }
    uint64_t v9 = [v6 userInfo];
    BOOL v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F40160]];
    uint64_t v11 = [v10 integerValue];

    if (v11 == 5019)
    {
      if (!*v7) {
        id v12 = (id)GKOSLoggers();
      }
      id v13 = *MEMORY[0x263F40318];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40318], OS_LOG_TYPE_ERROR)) {
        __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_3(v13);
      }
    }
  }
  if (!*v7) {
    id v14 = (id)GKOSLoggers();
  }
  id v15 = (os_log_t *)MEMORY[0x263F40338];
  id v16 = (void *)*MEMORY[0x263F40338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40338], OS_LOG_TYPE_DEBUG)) {
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_2(v16);
  }
  CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) _handleAuthResponse:v5 error:v6 handler:*(void *)(a1 + 40)];
  if (!*v7) {
    id v17 = (id)GKOSLoggers();
  }
  os_log_t v18 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG)) {
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_1(v18);
  }
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F40328];
  if (v6)
  {
    if (!*MEMORY[0x263F40328]) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_ERROR)) {
      __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_132_cold_3();
    }
  }
  if (!*v7) {
    id v9 = (id)GKOSLoggers();
  }
  BOOL v10 = (os_log_t *)MEMORY[0x263F40338];
  uint64_t v11 = (void *)*MEMORY[0x263F40338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40338], OS_LOG_TYPE_DEBUG)) {
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_2(v11);
  }
  CFAbsoluteTimeGetCurrent();
  [*(id *)(a1 + 32) _handleAuthResponse:v5 error:v6 handler:*(void *)(a1 + 40)];
  if (!*v7) {
    id v12 = (id)GKOSLoggers();
  }
  os_log_t v13 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG)) {
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_1(v13);
  }
}

- (void)reset
{
}

- (void)authenticationDidComplete
{
}

- (void)applicationDidEnterBackground:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(GKLocalPlayerAuthenticator *)self setLastAuthDate:v4];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)GKLocalPlayerAuthenticator;
  char v3 = [(GKLocalPlayerAuthenticator *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" username:%@ player:%@", self->_username, self->_resultantLocalPlayer];

  return (NSString *)v4;
}

- (BOOL)_shouldDisableWithGlobalDisabled:(BOOL)a3 appLevelDisabled:(BOOL)a4 processLevelDisabled:(BOOL)a5
{
  return a3 && a4 || a5;
}

- (void)_handleAuthResponse:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263F401C0];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayerAuthenticator.m", 504, "-[GKLocalPlayerAuthenticator _handleAuthResponse:error:handler:]");
  os_log_t v13 = [v11 dispatchGroupWithName:v12];

  if ([v9 gkRequiresCredentialRenewal])
  {
    if (!*MEMORY[0x263F40328]) {
      id v14 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      -[GKLocalPlayerAuthenticator _handleAuthResponse:error:handler:]();
    }
    [v13 perform:&__block_literal_global];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_146;
  v18[3] = &unk_264789E08;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v13 notifyOnMainQueueWithBlock:v18];
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [MEMORY[0x263F40270] local];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2;
  v5[3] = &unk_264789D90;
  id v6 = v2;
  id v4 = v2;
  [v3 signOutWithCompletionHandler:v5];
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x263F40328]) {
      id v4 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_146(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_148;
  v5[3] = &unk_264789DE0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 56);
  +[GKAppLevelSignInVisibility fetchAppLevelVisibilityConstraintsWithHandler:v5];
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_148(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
  id v5 = [v4 utilityServicePrivate];
  v17[0] = *MEMORY[0x263F40168];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_3;
  v11[3] = &unk_264789DB8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v3;
  id v15 = v9;
  id v16 = *(id *)(a1 + 56);
  id v10 = v3;
  [v5 getStoreBagValuesForKeys:v6 handler:v11];
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v7;
  if (!v7) {
    id v6 = objc_alloc_init(NSDictionary);
  }
  id v8 = v6;
  if ([v6 integerValueFromKey:*MEMORY[0x263F40168] defaultValue:0])
  {
    objc_msgSend(*(id *)(a1 + 32), "setLoginDisabled:", objc_msgSend(*(id *)(a1 + 40), "_shouldDisableWithGlobalDisabled:appLevelDisabled:processLevelDisabled:", objc_msgSend(*(id *)(a1 + 32), "loginDisabled"), objc_msgSend(*(id *)(a1 + 48), "appLevelFullscreenDisabled"), objc_msgSend(*(id *)(a1 + 48), "processLevelPromptDisabled")));
    objc_msgSend(*(id *)(a1 + 32), "setLoginBannerDisabled:", objc_msgSend(*(id *)(a1 + 40), "_shouldDisableWithGlobalDisabled:appLevelDisabled:processLevelDisabled:", objc_msgSend(*(id *)(a1 + 32), "loginBannerDisabled"), objc_msgSend(*(id *)(a1 + 48), "appLevelBannerDisabled"), objc_msgSend(*(id *)(a1 + 48), "processLevelPromptDisabled")));
  }
  [*(id *)(a1 + 40) _handleEditedAuthResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_handleEditedAuthResponse:(id)a3 error:(id)a4 handler:(id)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v9 = (__CFString *)a3;
  id v10 = a4;
  v76 = (void (**)(id, uint64_t, id, id, id))a5;
  if (!v76)
  {
    uint64_t v11 = NSString;
    id v12 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = [v11 stringWithFormat:@"%@ (handler != ((void *)0))\n[%s (%s:%d)]", v12, "-[GKLocalPlayerAuthenticator _handleEditedAuthResponse:error:handler:]", objc_msgSend(v14, "UTF8String"), 543];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v15 format];
  }
  id v16 = (NSObject **)MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328]) {
    id v17 = (id)GKOSLoggers();
  }
  os_log_t v18 = (NSObject **)MEMORY[0x263F40340];
  id v19 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v19, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Response and error ready for handling", buf, 2u);
  }
  id v20 = *v16;
  if (!*v16)
  {
    id v21 = (id)GKOSLoggers();
    id v20 = *v16;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v22 = v20;
    NSStringFromSelector(a2);
    id v23 = (GKLocalPlayerAuthenticator *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v83 = v23;
    __int16 v84 = 2112;
    v85 = v9;
    __int16 v86 = 2112;
    id v87 = v10;
    _os_log_impl(&dword_22600C000, v22, OS_LOG_TYPE_INFO, "%@ auth response:%@ error:%@", buf, 0x20u);
  }
  id v24 = [(__CFString *)v9 playerID];
  id v25 = [MEMORY[0x263F40270] authenticatedLocalPlayersWithStatus:1];
  if (!*v16) {
    id v26 = (id)GKOSLoggers();
  }
  id v27 = *v18;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v27, OS_LOG_TYPE_INFO, "_handleAuthResponse:Authenticated Local Player with Status", buf, 2u);
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v28 = v25;
  id v29 = (id)[v28 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v29)
  {
    id v74 = v10;
    v75 = v9;
    uint64_t v30 = self;
    uint64_t v31 = *(void *)v78;
    while (2)
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v78 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v34 = [v33 internal];
        v35 = [v34 playerID];
        int v36 = [v35 isEqualToString:v24];

        if (v36)
        {
          self = v30;
          [(GKLocalPlayerAuthenticator *)v30 setAuthenticated:1];
          id v29 = v33;
          id v9 = v75;
          goto LABEL_25;
        }
      }
      id v29 = (id)[v28 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (v29) {
        continue;
      }
      break;
    }
    id v9 = v75;
    self = v30;
LABEL_25:
    id v10 = v74;
    id v16 = (NSObject **)MEMORY[0x263F40328];
  }

  [(GKLocalPlayerAuthenticator *)self setResultantLocalPlayer:v29];
  if (!v10 && ![(__CFString *)v9 loginDisabled])
  {
    uint64_t v40 = 0;
    id v10 = 0;
    goto LABEL_61;
  }
  if (+[GKLocalPlayerAuthenticator shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:v9])
  {
    if (!*v16) {
      id v37 = (id)GKOSLoggers();
    }
    v38 = *MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22600C000, v38, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login has been disabled", buf, 2u);
    }
    if (([v29 isAuthenticated] & 1) == 0)
    {
      uint64_t v39 = [MEMORY[0x263F087E8] userErrorForCode:2 underlyingError:0];

      if ([(__CFString *)v9 loginBannerDisabled]) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = 5;
      }
LABEL_57:
      id v10 = (id)v39;
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  v41 = [v10 domain];
  int v42 = [v41 isEqualToString:*MEMORY[0x263F400F8]];

  if (!v42)
  {
LABEL_60:
    uint64_t v40 = 1;
    goto LABEL_61;
  }
  uint64_t v43 = [v10 code];
  if ((unint64_t)(v43 - 5) >= 2)
  {
    if (v43 == 15)
    {
      if (!*v16) {
        id v53 = (id)GKOSLoggers();
      }
      v54 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v54, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKErrorGameUnrecognized", buf, 2u);
      }
      uint64_t v39 = [MEMORY[0x263F087E8] userErrorForCode:15 underlyingError:0];

      uint64_t v40 = 1;
      goto LABEL_57;
    }
    if (!v29)
    {
      id v29 = [MEMORY[0x263F40270] localPlayer];
    }
    goto LABEL_60;
  }
  if (!*v16) {
    id v44 = (id)GKOSLoggers();
  }
  v45 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v45, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Error: GKErrorNotAuthenticated, GKErrorInvalidCredentials", buf, 2u);
  }
  v46 = [v10 userInfo];
  id v47 = [v46 objectForKey:*MEMORY[0x263F08608]];

  uint64_t v48 = [v47 code];
  switch(v48)
  {
    case 5170:
      if (!*v16) {
        id v59 = (id)GKOSLoggers();
      }
      v60 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v60, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerNeedsType15Repair", buf, 2u);
      }
      uint64_t v40 = 6;
      goto LABEL_92;
    case 5047:
      if (!*v16) {
        id v61 = (id)GKOSLoggers();
      }
      v62 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v62, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerForcePasswordChangeError", buf, 2u);
      }
      uint64_t v40 = 3;
      goto LABEL_92;
    case 5029:
      v49 = self;
      v50 = v9;
      if (!*MEMORY[0x263F40328]) {
        id v51 = (id)GKOSLoggers();
      }
      v52 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v40 = 2;
        _os_log_impl(&dword_22600C000, v52, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerNotAuthorizedError", buf, 2u);
      }
      else
      {
        uint64_t v40 = 2;
      }
LABEL_91:
      id v9 = v50;
      self = v49;
      id v16 = (NSObject **)MEMORY[0x263F40328];
      goto LABEL_92;
  }
  id v63 = [MEMORY[0x263F402A8] _gkReachabilityForInternetConnection];
  int v64 = [v63 _gkCurrentReachabilityStatus];

  if (v64)
  {
    v49 = self;
    if (!*MEMORY[0x263F40328]) {
      id v65 = (id)GKOSLoggers();
    }
    v50 = v9;
    id v66 = (void *)*MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v67 = NSNumber;
      v68 = v66;
      objc_msgSend(v67, "numberWithInteger:", objc_msgSend(v47, "code"));
      id v69 = (GKLocalPlayerAuthenticator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v83 = v69;
      _os_log_impl(&dword_22600C000, v68, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: %@", buf, 0xCu);
    }
    uint64_t v70 = [MEMORY[0x263F087E8] userErrorForCode:3 underlyingError:0];

    if ([(__CFString *)v50 suppressLoginSheet])
    {
      if (!*MEMORY[0x263F40328]) {
        id v71 = (id)GKOSLoggers();
      }
      v72 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22600C000, v72, OS_LOG_TYPE_INFO, "_handleAuthResponse: Suppress login sheet", buf, 2u);
      }
      uint64_t v40 = 5;
    }
    else
    {
      uint64_t v40 = 4;
    }
    id v10 = (id)v70;
    goto LABEL_91;
  }
  uint64_t v73 = [MEMORY[0x263F087E8] gkNotConnectedToInternetError];

  uint64_t v40 = 1;
  id v10 = (id)v73;
LABEL_92:

LABEL_61:
  id v55 = *v16;
  if (!*v16)
  {
    id v56 = (id)GKOSLoggers();
    id v55 = *v16;
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v57 = off_264789F50[v40];
    *(_DWORD *)buf = 138412546;
    v83 = self;
    __int16 v84 = 2112;
    v85 = v57;
    v58 = v55;
    _os_log_impl(&dword_22600C000, v58, OS_LOG_TYPE_INFO, "%@ result:%@", buf, 0x16u);
  }
  v76[2](v76, v40, v29, v10, v9);
}

+ (BOOL)shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!*MEMORY[0x263F40328]) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = (void *)*MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    id v6 = (void *)MEMORY[0x263F40280];
    id v7 = v5;
    id v8 = [v6 sharedMatchmaker];
    int v13 = 136315650;
    id v14 = "+[GKLocalPlayerAuthenticator shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:]";
    __int16 v15 = 1024;
    int v16 = [v8 isEligibleForGroupSession];
    __int16 v17 = 1024;
    int v18 = [v3 loginDisabled];
    _os_log_impl(&dword_22600C000, v7, OS_LOG_TYPE_INFO, "%s isEligibleForGroupSession=%d loginDisabled=%d", (uint8_t *)&v13, 0x18u);
  }
  id v9 = [MEMORY[0x263F40280] sharedMatchmaker];
  char v10 = [v9 isEligibleForGroupSession];

  if (v10) {
    char v11 = 0;
  }
  else {
    char v11 = [v3 loginDisabled];
  }

  return v11;
}

+ (void)postURL:(id)a3 postBody:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    a4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a4 format:100 options:0 error:0];
  }
  id v9 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
  char v10 = [v9 utilityServicePrivate];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__GKLocalPlayerAuthenticator_postURL_postBody_completion___block_invoke;
  v12[3] = &unk_264789E30;
  id v13 = v8;
  id v11 = v8;
  [v10 loadDataForURL:v7 postBody:a4 completionHandler:v12];
}

uint64_t __58__GKLocalPlayerAuthenticator_postURL_postBody_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)authenticateFromExternalServiceWithAuthenticationResults:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F29010];
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:v7];
  [(GKLocalPlayerAuthenticator *)self setUsername:v9];

  char v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  [(GKLocalPlayerAuthenticator *)self setPassword:v10];

  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  id v12 = [v8 objectForKey:*MEMORY[0x263F28FE8]];

  if (v12) {
    [(GKLocalPlayerAuthenticator *)self handleAuthKitResultsForUnder13WithContinuationData:v12 altDSID:v11 password:self->_password];
  }
  if (self->_username && self->_password)
  {
    id v13 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
    id v14 = [v13 accountServicePrivate];
    username = self->_username;
    password = self->_password;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __99__GKLocalPlayerAuthenticator_authenticateFromExternalServiceWithAuthenticationResults_withHandler___block_invoke;
    v17[3] = &unk_264789E58;
    v17[4] = self;
    id v18 = v6;
    [v14 authenticatePlayerWithUsername:username password:password altDSID:v11 isGame:0 usingFastPath:1 handler:v17];
  }
  else
  {
    [(GKLocalPlayerAuthenticator *)self cancelAuthDueToAuthKitErrorWithHandler:v6];
  }
}

uint64_t __99__GKLocalPlayerAuthenticator_authenticateFromExternalServiceWithAuthenticationResults_withHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleAuthResponse:a2 error:a3 handler:*(void *)(a1 + 40)];
}

- (void)handleAuthKitResultsForUnder13WithContinuationData:(id)a3 altDSID:(id)a4 password:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263F401C0];
  char v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayerAuthenticator.m", 702, "-[GKLocalPlayerAuthenticator handleAuthKitResultsForUnder13WithContinuationData:altDSID:password:]");
  id v11 = [v9 dispatchGroupWithName:v10];
  [(GKLocalPlayerAuthenticator *)self setU13Group:v11];

  u13Group = self->_u13Group;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke;
  v15[3] = &unk_264789EA8;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [(GKDispatchGroup *)u13Group perform:v15];
  [(GKDispatchGroup *)self->_u13Group enter];
  [(GKDispatchGroup *)self->_u13Group wait];
}

void __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  id v4 = objc_alloc_init(MEMORY[0x263F25820]);
  id v5 = NSURL;
  id v6 = [MEMORY[0x263F259C0] urlConfiguration];
  id v7 = [v6 repairCloudAccountUIURL];
  uint64_t v8 = [v5 URLWithString:v7];

  id v33 = (void *)v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v8 cachePolicy:1 timeoutInterval:30.0];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  [v9 setValue:*(void *)(a1 + 40) forHTTPHeaderField:@"X-Apple-AK-Continuation-Data"];
  uint64_t v34 = v4;
  char v10 = [v4 clientInfoHeader];
  [v9 setValue:v10 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v11 = NSString;
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = [*(id *)(a1 + 32) password];
  id v14 = [v11 stringWithFormat:@"%@:%@", v12, v13];

  __int16 v15 = [v14 dataUsingEncoding:4];
  id v16 = [v15 base64EncodedStringWithOptions:0];

  id v17 = [NSString stringWithFormat:@"Basic %@", v16];
  [v9 addValue:v17 forHTTPHeaderField:@"Authorization"];
  id v18 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"com.apple.GameCenter.u13"];
  uint64_t v19 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  objc_msgSend(v19, "set_appleIDContext:", v18);
  id v20 = objc_alloc_init(MEMORY[0x263F637E8]);
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 96);
  *(void *)(v21 + 96) = v20;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 96) setSessionConfiguration:v19];
  id v23 = objc_alloc_init(MEMORY[0x263F1C7F8]);
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 104);
  *(void *)(v24 + 104) = v23;

  id v26 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  if (v27 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 104) setModalPresentationStyle:16];
    id v28 = [*(id *)(*(void *)(a1 + 32) + 104) view];
    id v29 = [v28 layer];
    [v29 setMasksToBounds:1];
  }
  uint64_t v30 = [*(id *)(a1 + 32) presentingViewController];
  [v30 presentViewController:*(void *)(*(void *)(a1 + 32) + 104) animated:1 completion:0];

  [*(id *)(*(void *)(a1 + 32) + 96) setNavigationController:*(void *)(*(void *)(a1 + 32) + 104)];
  uint64_t v31 = *(void **)(*(void *)(a1 + 32) + 96);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke_2;
  v35[3] = &unk_264789E80;
  id v36 = v3;
  id v32 = v3;
  [v31 loadRequest:v9 completion:v35];
}

uint64_t __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x263F25820];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [v7 clientInfoHeader];
  [v6 setValue:v8 forHTTPHeaderField:@"X-MMe-Client-Info"];

  id v9 = [MEMORY[0x263EFF960] currentLocale];
  char v10 = [v9 objectForKey:*MEMORY[0x263EFF4D0]];
  id v11 = [v10 uppercaseString];
  [v6 setValue:v11 forHTTPHeaderField:@"X-MMe-Country"];

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5 = objc_msgSend(a4, "URL", a3);
  id v6 = [v5 absoluteString];
  int v7 = [v6 containsString:@"skipCreateAppleID"];

  if (v7) {
    self->_userShouldSkipCreateAppleID = 1;
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (a5
    && *a5 == 2
    && ([v9 defaultPages],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        !v12))
  {
    id v18 = (NSObject **)MEMORY[0x263F40328];
    uint64_t v19 = *MEMORY[0x263F40328];
    if (!*MEMORY[0x263F40328])
    {
      id v20 = (id)GKOSLoggers();
      uint64_t v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_22600C000, v19, OS_LOG_TYPE_INFO, "Warning: AppleIDController received an object model with actionSignal=Push but no pages.", v21, 2u);
    }
  }
  else
  {
    u13ObjectModels = self->_u13ObjectModels;
    if (!u13ObjectModels)
    {
      id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      __int16 v15 = self->_u13ObjectModels;
      self->_u13ObjectModels = v14;

      u13ObjectModels = self->_u13ObjectModels;
    }
    [(NSMutableArray *)u13ObjectModels addObject:v10];
    id v16 = [v10 clientInfo];
    id v17 = [v16 objectForKeyedSubscript:@"continue"];

    if (v17 && ([v17 BOOLValue] & 1) == 0) {
      self->_userShouldSkipCreateAppleID = 1;
    }
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(GKLocalPlayerAuthenticator *)self u13NavigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  if (self->_userShouldSkipCreateAppleID)
  {
    [(GKDispatchGroup *)self->_u13Group leave];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v7 = self->_u13ObjectModels;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) populatePostbackDictionary:v6];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
    id v13 = [v12 objectForKey:*MEMORY[0x263EFF4D0]];

    if (![v13 length]) {
      -[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:]();
    }
    id v14 = [MEMORY[0x263F086E0] _gkPreferredSystemLanguage];
    if (![v14 length]) {
      -[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:]();
    }
    if ([v14 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v15 = NSString;
      id v16 = [v13 lowercaseString];
      uint64_t v17 = [v15 stringWithFormat:@"%@-%@", v14, v16];

      id v14 = (void *)v17;
    }
    id v18 = [MEMORY[0x263EFFA18] systemTimeZone];
    uint64_t v19 = [v18 name];

    if ([v19 length]) {
      [v6 setObject:v19 forKey:*MEMORY[0x263F25708]];
    }
    [v6 setObject:v14 forKey:*MEMORY[0x263F25700]];
    id v20 = [v13 uppercaseString];
    [v6 setObject:v20 forKey:*MEMORY[0x263F256F8]];

    id v21 = objc_alloc(MEMORY[0x263F25960]);
    id v22 = [(GKLocalPlayerAuthenticator *)self username];
    id v23 = [(GKLocalPlayerAuthenticator *)self password];
    uint64_t v24 = (void *)[v21 initWithAppleID:v22 password:v23];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__GKLocalPlayerAuthenticator_remoteUIControllerDidDismiss___block_invoke;
    v25[3] = &unk_264789ED0;
    v25[4] = self;
    [v24 createAppleIDWithParameters:v6 handlerWithResponse:v25];
  }
}

uint64_t __59__GKLocalPlayerAuthenticator_remoteUIControllerDidDismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  int v7 = [v6 responseDictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"title"];
  [*(id *)(a1 + 32) setAlertTitle:v8];

  uint64_t v9 = [v6 responseDictionary];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"status-message"];
  [*(id *)(a1 + 32) setAlertMessage:v10];

  id v11 = *(void **)(*(void *)(a1 + 32) + 120);
  return [v11 leave];
}

- (GKLocalPlayer)resultantLocalPlayer
{
  return (GKLocalPlayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResultantLocalPlayer:(id)a3
{
}

- (GKLocalPlayer)inputLocalPlayer
{
  return (GKLocalPlayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputLocalPlayer:(id)a3
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(id)a3
{
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (BOOL)forceAuthentication
{
  return self->_forceAuthentication;
}

- (void)setForceAuthentication:(BOOL)a3
{
  self->_forceAuthentication = a3;
}

- (NSDate)lastAuthDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastAuthDate:(id)a3
{
}

- (NSString)lastAuthPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastAuthPlayerID:(id)a3
{
}

- (NSString)alertTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertMessage
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAlertMessage:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (RemoteUIController)remoteU13Controller
{
  return self->_remoteU13Controller;
}

- (void)setRemoteU13Controller:(id)a3
{
}

- (UINavigationController)u13NavigationController
{
  return self->_u13NavigationController;
}

- (void)setU13NavigationController:(id)a3
{
}

- (NSMutableArray)u13ObjectModels
{
  return self->_u13ObjectModels;
}

- (void)setU13ObjectModels:(id)a3
{
}

- (GKDispatchGroup)u13Group
{
  return self->_u13Group;
}

- (void)setU13Group:(id)a3
{
}

- (BOOL)userShouldSkipCreateAppleID
{
  return self->_userShouldSkipCreateAppleID;
}

- (void)setUserShouldSkipCreateAppleID:(BOOL)a3
{
  self->_userShouldSkipCreateAppleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u13Group, 0);
  objc_storeStrong((id *)&self->_u13ObjectModels, 0);
  objc_storeStrong((id *)&self->_u13NavigationController, 0);
  objc_storeStrong((id *)&self->_remoteU13Controller, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_lastAuthPlayerID, 0);
  objc_storeStrong((id *)&self->_lastAuthDate, 0);
  objc_storeStrong((id *)&self->_inputLocalPlayer, 0);
  objc_storeStrong((id *)&self->_resultantLocalPlayer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

void __79__GKLocalPlayerAuthenticator_authenticateWithAuthKitResults_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = NSNumber;
  id v6 = a1;
  int v7 = [v5 numberWithInteger:a2];
  OUTLINED_FUNCTION_2();
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  OUTLINED_FUNCTION_3(&dword_22600C000, v6, v8, "GameCenter sign in completed with result %@, error: %@", v9);
}

void __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "authenticateWithCompletionHandler: appleIDController returned error: %@", v2, v3, v4, v5, v6);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22600C000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_2(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22600C000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22600C000, log, OS_LOG_TYPE_ERROR, "Game Center has not been enabled for this app. Please make sure to enable Game Center on App Store Connect and to include the Game Center entitlement in the entitlements plist. For more information visit https://developer.apple.com/help/app-store-connect/configure-game-center/enable-an-app-version-for-game-center", v1, 2u);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_129_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "_authenticateUsingAlert:Failed to authenticate player with existing credentials.Error: %@", v2, v3, v4, v5, v6);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_132_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "_authenticateUsingAlert:Failed to authenticate player with username/password.Error: %@", v2, v3, v4, v5, v6);
}

- (void)_handleAuthResponse:error:handler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "Signing out local player due to error: %@", v2, v3, v4, v5, v6);
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "Failed to sign out due to error: %@", v2, v3, v4, v5, v6);
}

- (void)remoteUIControllerDidDismiss:.cold.1()
{
}

- (void)remoteUIControllerDidDismiss:.cold.2()
{
}

@end