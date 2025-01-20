@interface ACDAuthenticationDialogManager
- (ACDAuthenticationDialogManager)init;
- (BOOL)_confirmUserWantsToOpenAuthenticationURLForAccount:(id)a3;
- (void)_launchDialogContainerAppForAccount:(id)a3 shouldConfirm:(BOOL)a4 completion:(id)a5;
- (void)authenticationDialogCrashed;
- (void)authenticationDialogDidFinishWithSuccess:(BOOL)a3 response:(id)a4;
- (void)contextForAuthenticationDialog:(id)a3;
- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6;
- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7;
@end

@implementation ACDAuthenticationDialogManager

- (ACDAuthenticationDialogManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACDAuthenticationDialogManager;
  v2 = [(ACDAuthenticationDialogManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ACDQueueDictionary);
    dialogRequestQueues = v2->_dialogRequestQueues;
    v2->_dialogRequestQueues = v3;
  }
  return v2;
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  v14 = [v11 identifier];

  if (v14)
  {
    v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:]((uint64_t)v13, v15, v16);
    }

    BOOL v17 = [(ACDQueueDictionary *)v13->_dialogRequestQueues isEmpty];
    v18 = objc_alloc_init(ACDAuthenticationDialogRequest);
    [(ACDAuthenticationDialogRequest *)v18 setUrl:v10];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke;
    v25[3] = &unk_264321C10;
    id v26 = v12;
    [(ACDAuthenticationDialogRequest *)v18 setCompletion:v25];
    [(ACDAuthenticationDialogRequest *)v18 setConfirmationRequired:v7];
    [(ACDAuthenticationDialogRequest *)v18 setAccount:v11];
    dialogRequestQueues = v13->_dialogRequestQueues;
    v20 = [v11 identifier];
    [(ACDQueueDictionary *)dialogRequestQueues addObject:v18 toQueueForKey:v20];

    v21 = _ACDLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v11 identifier];
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:](v22, (uint64_t)v27, v21);
    }

    if (v17)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_47;
      v24[3] = &unk_264321C38;
      v24[4] = v13;
      [(ACDAuthenticationDialogManager *)v13 _launchDialogContainerAppForAccount:v11 shouldConfirm:v7 completion:v24];
    }
  }
  else
  {
    v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:2 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v23);
  }
  objc_sync_exit(v13);
}

uint64_t __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_47(uint64_t a1, char a2)
{
  if (a2)
  {
    v2 = _ACDLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_47_cold_1();
    }
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    [v3 authenticationDialogDidFinishWithSuccess:0 response:0];
  }
}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = self;
  objc_sync_enter(v16);
  BOOL v17 = [v12 identifier];

  if (v17)
  {
    v18 = _ACDLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:]((uint64_t)v16, v18, v19);
    }

    BOOL v20 = [(ACDQueueDictionary *)v16->_dialogRequestQueues isEmpty];
    v21 = objc_alloc_init(ACDAuthenticationDialogRequest);
    [(ACDAuthenticationDialogRequest *)v21 setUrl:0];
    [(ACDAuthenticationDialogRequest *)v21 setCompletion:v15];
    [(ACDAuthenticationDialogRequest *)v21 setConfirmationRequired:v8];
    [(ACDAuthenticationDialogRequest *)v21 setAccount:v12];
    [(ACDAuthenticationDialogRequest *)v21 setAuthDelegateClassName:v13];
    [(ACDAuthenticationDialogRequest *)v21 setAuthDelegateClassBundlePath:v14];
    dialogRequestQueues = v16->_dialogRequestQueues;
    v23 = [v12 identifier];
    [(ACDQueueDictionary *)dialogRequestQueues addObject:v21 toQueueForKey:v23];

    v24 = _ACDLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v12 identifier];
      -[ACDAuthenticationDialogManager openAuthenticationURL:forAccount:shouldConfirm:completion:](v25, (uint64_t)v28, v24);
    }

    if (v20)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __130__ACDAuthenticationDialogManager_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke;
      v27[3] = &unk_264321C38;
      v27[4] = v16;
      [(ACDAuthenticationDialogManager *)v16 _launchDialogContainerAppForAccount:v12 shouldConfirm:v8 completion:v27];
    }
  }
  else
  {
    id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:2 userInfo:0];
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v26);
  }
  objc_sync_exit(v16);
}

void __130__ACDAuthenticationDialogManager_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v2 = _ACDLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_47_cold_1();
    }
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    [v3 authenticationDialogDidFinishWithSuccess:0 response:0];
  }
}

- (void)_launchDialogContainerAppForAccount:(id)a3 shouldConfirm:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 identifier];
  activeAccountID = self->_activeAccountID;
  self->_activeAccountID = v10;

  id v12 = dispatch_get_global_queue(2, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke;
  v15[3] = &unk_264321C88;
  BOOL v18 = a4;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)
    && ![*(id *)(a1 + 32) _confirmUserWantsToOpenAuthenticationURLForAccount:*(void *)(a1 + 40)])
  {
    objc_super v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
  else
  {
    v2 = _ACDLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_cold_1(v2, v3, v4);
    }

    v5 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_50;
    v7[3] = &unk_264321C60;
    id v8 = *(id *)(a1 + 48);
    [v5 openApplication:@"com.apple.AccountAuthenticationDialog" withOptions:0 completion:v7];
  }
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = _ACDLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_50_cold_1((uint64_t)v4, v5);
    }

    objc_super v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    objc_super v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (BOOL)_confirmUserWantsToOpenAuthenticationURLForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v4 = [v3 accountType];
  uint64_t v5 = [v4 accountTypeDescription];

  if (v5) {
    objc_super v6 = (__CFString *)v5;
  }
  else {
    objc_super v6 = &stru_26C990120;
  }
  BOOL v7 = NSString;
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"VERIFICATION_REQUIRED_MESSAGE_FORMAT" value:&stru_26C990120 table:@"Localizable"];
  id v10 = [v3 username];
  id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v6, v10);

  id v12 = _ACDLogSystem();
  v22 = v6;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: asking user to confirm showing auth dialog.\"", buf, 2u);
  }

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"VERIFICATION_REQUIRED_TITLE" value:&stru_26C990120 table:@"Localizable"];
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26C990120 table:@"Localizable"];
  BOOL v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"CONTINUE" value:&stru_26C990120 table:@"Localizable"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __85__ACDAuthenticationDialogManager__confirmUserWantsToOpenAuthenticationURLForAccount___block_invoke;
  v23[3] = &unk_264321CB0;
  v25 = &v27;
  BOOL v20 = v13;
  v24 = v20;
  +[ACDUserNotification showUserNotificationWithTitle:v15 message:v11 cancelButtonTitle:v17 otherButtonTitle:v19 withCompletionBlock:v23];

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v14) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)v14;
}

intptr_t __85__ACDAuthenticationDialogManager__confirmUserWantsToOpenAuthenticationURLForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _ACDLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: user declined.\"", v8, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"ACDAuthenticationDialogRequest: user asked to continue.\"", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)contextForAuthenticationDialog:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *, void *, void *, void *))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(ACDQueueDictionary *)v5->_dialogRequestQueues firstObjectInQueueForKey:v5->_activeAccountID];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 url];
    id v9 = [v7 account];
    id v10 = [v9 accountDescription];

    id v11 = [v7 account];
    id v12 = [v11 username];

    dispatch_semaphore_t v13 = [v7 authDelegateClassName];
    id v14 = [v7 authDelegateClassBundlePath];
    id v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138413314;
      BOOL v18 = v8;
      __int16 v19 = 2112;
      BOOL v20 = v10;
      __int16 v21 = 2112;
      v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_debug_impl(&dword_2183AD000, v15, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationDialogManager: providing active dialog with URL: %@ title: %@ username: %@ authDelegateClassName %@ authDelegateClassBundlePath %@\"", (uint8_t *)&v17, 0x34u);
    }

    v4[2](v4, v8, v10, v12, v13, v14);
  }
  else
  {
    id v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAuthenticationDialogManager contextForAuthenticationDialog:]();
    }

    v4[2](v4, 0, 0, 0, 0, 0);
  }

  objc_sync_exit(v5);
}

- (void)authenticationDialogDidFinishWithSuccess:(BOOL)a3 response:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = self;
  objc_sync_enter(v7);
  id v8 = [(ACDQueueDictionary *)v7->_dialogRequestQueues dequeueAllObjectsInQueueForKey:v7->_activeAccountID];
  if (![v8 count])
  {
    id v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACDAuthenticationDialogManager authenticationDialogDidFinishWithSuccess:response:]();
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) completion];
        id v15 = (void *)v14;
        if (v14) {
          (*(void (**)(uint64_t, BOOL, id, void))(v14 + 16))(v14, v4, v6, 0);
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  activeAccountID = v7->_activeAccountID;
  v7->_activeAccountID = 0;

  int v17 = [(ACDQueueDictionary *)v7->_dialogRequestQueues keyForRandomQueue];
  BOOL v18 = [(ACDQueueDictionary *)v7->_dialogRequestQueues firstObjectInQueueForKey:v17];
  if (v18)
  {
    dispatch_time_t v19 = dispatch_time(0, 1000000000);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke;
    v20[3] = &unk_264320D40;
    v20[4] = v7;
    id v21 = v18;
    dispatch_after(v19, MEMORY[0x263EF83A0], v20);
  }
  objc_sync_exit(v7);
}

void __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) account];
  uint64_t v4 = [*(id *)(a1 + 40) confirmationRequired];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke_2;
  v5[3] = &unk_264321C38;
  v5[4] = *(void *)(a1 + 32);
  [v2 _launchDialogContainerAppForAccount:v3 shouldConfirm:v4 completion:v5];
}

uint64_t __84__ACDAuthenticationDialogManager_authenticationDialogDidFinishWithSuccess_response___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) authenticationDialogDidFinishWithSuccess:0 response:0];
  }
  return result;
}

- (void)authenticationDialogCrashed
{
  if (self->_activeAccountID) {
    [(ACDAuthenticationDialogManager *)self authenticationDialogDidFinishWithSuccess:0 response:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccountID, 0);
  objc_storeStrong((id *)&self->_dialogRequestQueues, 0);

  objc_storeStrong((id *)&self->_authenticationDialogListener, 0);
}

- (void)openAuthenticationURL:(NSObject *)a3 forAccount:shouldConfirm:completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_2183AD000, a3, (uint64_t)a3, "\"ACDAuthenticationDialogRequest: added dialog request to queue under ID %@\"", (uint8_t *)a2);
}

- (void)openAuthenticationURL:(uint64_t)a3 forAccount:shouldConfirm:completion:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_2183AD000, a2, a3, "\"ACDAuthenticationDialogManager current queue: %@\"", (uint8_t *)&v4);
}

void __92__ACDAuthenticationDialogManager_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "\"ACDAuthenticationDialogRequest: OOPA dialog host launched!\"", v1, 2u);
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  int v4 = @"com.apple.AccountAuthenticationDialog";
  OUTLINED_FUNCTION_0_6(&dword_2183AD000, a1, a3, "\"Launching app with identifier %@\"", (uint8_t *)&v3);
}

void __95__ACDAuthenticationDialogManager__launchDialogContainerAppForAccount_shouldConfirm_completion___block_invoke_50_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  int v3 = @"com.apple.AccountAuthenticationDialog";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to lauch %@ app: %@\"", (uint8_t *)&v2, 0x16u);
}

- (void)contextForAuthenticationDialog:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"ACDAuthenticationDialogManager: an authentication dialog is trying to talk to me, but I have no record of launching it!\"", v1, 2u);
}

- (void)authenticationDialogDidFinishWithSuccess:response:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"ACDAuthenticationDialogManager: an authentication dialog reports being done, but I have no record of launching it!\"", v1, 2u);
}

@end