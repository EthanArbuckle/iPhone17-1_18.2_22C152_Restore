@interface AKAppleIDPasskeyAuthenticationController
- (AKAppleIDPasskeyAuthenticationController)init;
- (id)_authorizationControllerForAccount:(id)a3;
- (id)_popPasskeyRequestStateForController:(id)a3;
- (void)_onqueue_authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5;
- (void)_onqueue_createPasskeyWithContext:(id)a3 completion:(id)a4;
- (void)_pushPasskeyRequestState:(id)a3 forController:(id)a4;
- (void)appleIDPasskeyStatusForAccount:(id)a3 withCompletion:(id)a4;
- (void)appleIDPasskeysForAccount:(id)a3 withCompletion:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)canCreateiCloudKeychainPasskeyForAccount:(id)a3 withCompletion:(id)a4;
- (void)createPasskeyWithContext:(id)a3 completion:(id)a4;
- (void)deleteAllPasskeysForAccount:(id)a3 withCompletion:(id)a4;
@end

@implementation AKAppleIDPasskeyAuthenticationController

- (AKAppleIDPasskeyAuthenticationController)init
{
  v15.receiver = self;
  v15.super_class = (Class)AKAppleIDPasskeyAuthenticationController;
  v2 = [(AKAppleIDPasskeyAuthenticationController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_stateByControllerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    stateByController = v3->_stateByController;
    v3->_stateByController = (NSMapTable *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    serializationGroup = v3->_serializationGroup;
    v3->_serializationGroup = (OS_dispatch_group *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passkey-serialization-queue", v8);
    serializationQueue = v3->_serializationQueue;
    v3->_serializationQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.authkit.passkey.request.queue", v11);
    passkeyRequestQueue = v3->_passkeyRequestQueue;
    v3->_passkeyRequestQueue = (OS_dispatch_queue *)v12;
  }
  return v3;
}

- (void)createPasskeyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke;
  block[3] = &unk_1E5760B00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serializationQueue, block);
}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  uint64_t v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_2;
  block[3] = &unk_1E5760B00;
  block[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v3, v4, block);
}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_3;
  v4[3] = &unk_1E5761F30;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_onqueue_createPasskeyWithContext:completion:", v3, v4);
}

void __80__AKAppleIDPasskeyAuthenticationController_createPasskeyWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)appleIDPasskeyStatusForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__AKAppleIDPasskeyAuthenticationController_appleIDPasskeyStatusForAccount_withCompletion___block_invoke;
  v8[3] = &unk_1E5761F58;
  id v9 = v6;
  id v7 = v6;
  [(AKAppleIDPasskeyAuthenticationController *)self appleIDPasskeysForAccount:a3 withCompletion:v8];
}

void __90__AKAppleIDPasskeyAuthenticationController_appleIDPasskeyStatusForAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, [a2 count] != 0, v5);
  }
}

- (void)canCreateiCloudKeychainPasskeyForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E5761F80;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    uint64_t v4 = _AKLogPasskey();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    }
    goto LABEL_17;
  }
  uint64_t v3 = [a1[4] username];

  if (v3)
  {
    uint64_t v4 = [a1[5] _authorizationControllerForAccount:a1[4]];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50;
      v10[3] = &unk_1E575F350;
      v11 = v4;
      id v12 = a1[6];
      [v11 preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:v10];

      id v5 = v11;
    }
    else
    {
      id v6 = _AKLogPasskey();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_3();
      }

      id v7 = (void (**)(id, void, id))a1[6];
      if (!v7) {
        goto LABEL_17;
      }
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-120020 userInfo:0];
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  v8 = _AKLogPasskey();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_2();
  }

  id v9 = (void (**)(id, void, NSObject *))a1[6];
  if (v9)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-12002 userInfo:0];
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogPasskey();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50_cold_1(a2, v7, v10);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }
}

- (void)appleIDPasskeysForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E5761F80;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    uint64_t v4 = _AKLogPasskey();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    }
    goto LABEL_17;
  }
  uint64_t v3 = [a1[4] username];

  if (v3)
  {
    uint64_t v4 = [a1[5] _authorizationControllerForAccount:a1[4]];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61;
      v10[3] = &unk_1E5761FA8;
      uint64_t v11 = v4;
      id v12 = a1[4];
      id v13 = a1[6];
      [v11 getPasskeysDataForRelyingParty:@"apple.com" withCompletionHandler:v10];

      id v5 = v11;
    }
    else
    {
      id v6 = _AKLogPasskey();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_3();
      }

      id v7 = (void (**)(id, void, id))a1[6];
      if (!v7) {
        goto LABEL_17;
      }
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-120019 userInfo:0];
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v8 = _AKLogPasskey();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_2();
  }

  id v9 = (void (**)(id, void, NSObject *))a1[6];
  if (v9)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-12002 userInfo:0];
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[AKAccountManager sharedInstance];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    [v4 setPasskeysInKeychainCount:v5 forAccount:*(void *)(a1 + 40)];

    id v6 = +[AKAccountManager sharedInstance];
    uint64_t v7 = *(void *)(a1 + 40);
    id v12 = 0;
    [v6 saveAccount:v7 error:&v12];
    id v8 = v12;

    if (v8)
    {
      id v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61_cold_2();
      }
    }
    else
    {
      id v9 = _AKLogPasskey();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61_cold_1(v3, v9);
      }
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v3, 0);
    }
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-120019 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v8);
LABEL_11:
  }
}

- (void)deleteAllPasskeysForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  passkeyRequestQueue = self->_passkeyRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E5761F80;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(passkeyRequestQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    uint64_t v4 = _AKLogPasskey();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1();
    }
    goto LABEL_17;
  }
  id v3 = [a1[4] username];

  if (v3)
  {
    uint64_t v4 = [a1[5] _authorizationControllerForAccount:a1[4]];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67;
      v10[3] = &unk_1E575F350;
      uint64_t v11 = v4;
      id v12 = a1[6];
      [v11 deleteAllPasskeysForRelyingParty:@"apple.com" completionHandler:v10];

      id v5 = v11;
    }
    else
    {
      id v6 = _AKLogPasskey();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_3();
      }

      id v7 = (void (**)(id, void, id))a1[6];
      if (!v7) {
        goto LABEL_17;
      }
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-120019 userInfo:0];
      v7[2](v7, 0, v5);
    }

LABEL_17:
    goto LABEL_18;
  }
  id v8 = _AKLogPasskey();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_2();
  }

  id v9 = (void (**)(id, void, NSObject *))a1[6];
  if (v9)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAppleIDPasskeyError" code:-12002 userInfo:0];
    v9[2](v9, 0, v4);
    goto LABEL_17;
  }
LABEL_18:
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AKLogPasskey();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67_cold_2();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)_onqueue_createPasskeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [v6 relyingPartyIdentifier];
  id v9 = [v6 credentialName];
  id v10 = [v6 challenge];
  uint64_t v11 = [v6 userID];
  id v12 = (void *)v11;
  if (v8 && v9 && v10 && v11)
  {
    ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
    if (ASAuthorizationPlatformPublicKeyCredentialProviderClass) {
      ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationPlatformPublicKeyCredentialProviderClass();
    }
    id v14 = (void *)[[ASAuthorizationPlatformPublicKeyCredentialProviderClass alloc] initWithRelyingPartyIdentifier:v8];
    uint64_t v15 = [v14 createCredentialRegistrationRequestWithChallenge:v10 name:v9 userID:v12];
    v16 = (void *)v15;
    if (!v15)
    {
      v24 = _AKLogPasskey();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v37 = self;
        __int16 v38 = 2112;
        id v39 = v6;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_error_impl(&dword_193494000, v24, OS_LOG_TYPE_ERROR, "%@: Failed to create passkey request with context (%@) using provider (%@)", buf, 0x20u);
      }

      v25 = _AKLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:]();
      }

      if (v7)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_passkeyErrorWithCode:", -12001);
        v7[2](v7, 0);
      }
      goto LABEL_38;
    }
    uint64_t v35 = v15;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
    v31 = v16;
    if (ASAuthorizationControllerClass) {
      ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
    }
    v18 = (void *)[[ASAuthorizationControllerClass alloc] initWithAuthorizationRequests:v32];
    v19 = v18;
    if (v18)
    {
      [v18 setDelegate:self];
      v34 = v8;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      [v19 setProxiedAssociatedDomains:v20];

      if (objc_opt_respondsToSelector())
      {
        v21 = _AKLogPasskey();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.4();
        }

        v22 = +[_AKAppleIDPasskeyRequestState stateWithContext:v6 completion:v7];
        [(AKAppleIDPasskeyAuthenticationController *)self _pushPasskeyRequestState:v22 forController:v19];
        [v19 performSilentRequests];
        goto LABEL_36;
      }
      v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:].cold.5();
      }

      if (!v7) {
        goto LABEL_37;
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = -12002;
    }
    else
    {
      v26 = _AKLogPasskey();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v37 = self;
        __int16 v38 = 2112;
        id v39 = v31;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_error_impl(&dword_193494000, v26, OS_LOG_TYPE_ERROR, "%@: Failed to create authorization controller with request (%@) for context (%@)", buf, 0x20u);
      }

      v27 = _AKLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:]();
      }

      if (!v7) {
        goto LABEL_37;
      }
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = -12001;
    }
    v22 = objc_msgSend(v28, "ak_passkeyErrorWithCode:", v29, v31);
    ((void (*)(void (**)(id, void), void, void *))v7[2])(v7, 0, v22);
LABEL_36:

LABEL_37:
    v16 = v31;

LABEL_38:
    goto LABEL_39;
  }
  v23 = _AKLogPasskey();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDPasskeyAuthenticationController _onqueue_createPasskeyWithContext:completion:]();
  }

  if (v7)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_passkeyErrorWithCode:", -120012);
    ((void (*)(void (**)(id, void), void, void *))v7[2])(v7, 0, v14);
LABEL_39:
  }
}

- (void)_pushPasskeyRequestState:(id)a3 forController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_stateByControllerLock);
    [(NSMapTable *)self->_stateByController setObject:v6 forKey:v7];
    os_unfair_lock_unlock(&self->_stateByControllerLock);
  }
  else
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDPasskeyAuthenticationController _pushPasskeyRequestState:forController:]();
    }
  }
}

- (id)_popPasskeyRequestStateForController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_stateByControllerLock);
    id v5 = [(NSMapTable *)self->_stateByController objectForKey:v4];
    [(NSMapTable *)self->_stateByController setObject:0 forKey:v4];
    os_unfair_lock_unlock(&self->_stateByControllerLock);
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDPasskeyAuthenticationController _pushPasskeyRequestState:forController:]();
    }

    id v5 = 0;
  }

  return v5;
}

- (void)_onqueue_authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serializationQueue);
  uint64_t v11 = [(AKAppleIDPasskeyAuthenticationController *)self _popPasskeyRequestStateForController:v8];
  if (v11)
  {
    if (AuthenticationServicesLibraryCore()) {
      getASAuthorizationPlatformPublicKeyCredentialRegistrationClass();
    }
    objc_opt_class();
    id v12 = [v9 credential];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      v37 = v10;
      id v38 = v9;
      id v39 = v8;
      v16 = _AKLogPasskey();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v13;
        _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Successfully obtained passkey credential: %@", buf, 0xCu);
      }

      __int16 v40 = [AKAppleIDPasskeyCredential alloc];
      uint64_t v42 = [v11 context];
      uint64_t v17 = [v42 relyingPartyIdentifier];
      v18 = [v13 rawAttestationObject];
      v19 = [v13 rawClientDataJSON];
      id v36 = v13;
      v20 = [v13 credentialID];
      id v41 = [v11 context];
      v21 = [v41 originalChallenge];
      v22 = [v11 context];
      v23 = [v22 userID];
      uint64_t v35 = v11;
      v24 = [v11 context];
      v25 = [v24 credentialName];
      v26 = (void *)v17;
      uint64_t v15 = [(AKAppleIDPasskeyCredential *)v40 initWithRelyingPartyIdentifier:v17 attestationData:v18 clientData:v19 credentialID:v20 originalChallenge:v21 userID:v23 credentialName:v25];

      v27 = _AKLogPasskey();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = v35;
        -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:].cold.4(v35, v27);
        id v9 = v38;
        uint64_t v8 = v39;
        id v13 = v36;
        id v10 = v37;
      }
      else
      {
        id v9 = v38;
        uint64_t v8 = v39;
        id v13 = v36;
        id v10 = v37;
        uint64_t v11 = v35;
      }
    }
    else
    {
      v27 = _AKLogPasskey();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v28) {
          -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:](v9, v27);
        }

        objc_msgSend(MEMORY[0x1E4F28C58], "ak_passkeyErrorWithCode:", -12009);
        uint64_t v15 = 0;
        id v10 = v27 = v10;
      }
      else
      {
        if (v28) {
          -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:]();
        }
        uint64_t v15 = 0;
      }
    }

    uint64_t v29 = _AKLogPasskey();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v32 = [v11 completion];
      id v33 = v13;
      v34 = (void *)MEMORY[0x1996FE880]();
      *(_DWORD *)buf = 138412802;
      id v44 = v34;
      __int16 v45 = 2112;
      v46 = v15;
      __int16 v47 = 2112;
      v48 = v10;
      _os_log_debug_impl(&dword_193494000, v29, OS_LOG_TYPE_DEBUG, "Calling completion block (%@) with passkey (%@) and error (%@)", buf, 0x20u);

      id v13 = v33;
    }

    v30 = [v11 completion];

    if (v30)
    {
      v31 = [v11 completion];
      ((void (**)(void, NSObject *, NSObject *))v31)[2](v31, v15, v10);
    }
  }
  else
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v44 = v9;
      __int16 v45 = 2112;
      v46 = v10;
      __int16 v47 = 2112;
      v48 = v8;
      _os_log_error_impl(&dword_193494000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve passkey authorization (%@) with error (%@) due to missing entry for controller (%@) in table", buf, 0x20u);
    }

    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDPasskeyAuthenticationController _onqueue_authorizationController:didCompleteWithAuthorization:error:]();
    }
  }
}

- (id)_authorizationControllerForAccount:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationPlatformPublicKeyCredentialProviderClass) {
    ASAuthorizationPlatformPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationPlatformPublicKeyCredentialProviderClass();
  }
  id v5 = (void *)[[ASAuthorizationPlatformPublicKeyCredentialProviderClass alloc] initWithRelyingPartyIdentifier:@"apple.com"];
  id v6 = objc_opt_new();
  id v7 = [v3 username];

  uint64_t v8 = objc_opt_new();
  id v9 = [v5 createCredentialRegistrationRequestWithChallenge:v6 name:v7 userID:v8];

  if (v9)
  {
    ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
    if (ASAuthorizationControllerClass) {
      ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
    }
    id v11 = [ASAuthorizationControllerClass alloc];
    v15[0] = v9;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v13 = (void *)[v11 initWithAuthorizationRequests:v12];
  }
  else
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[AKAppleIDPasskeyAuthenticationController _authorizationControllerForAccount:]((uint64_t)v5, v12);
    }
    id v13 = 0;
  }

  return v13;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithAuthorization___block_invoke;
  block[3] = &unk_1E5760710;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serializationQueue, block);
}

uint64_t __97__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithAuthorization___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_authorizationController:didCompleteWithAuthorization:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0);
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithError___block_invoke;
  block[3] = &unk_1E5760710;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serializationQueue, block);
}

uint64_t __89__AKAppleIDPasskeyAuthenticationController_authorizationController_didCompleteWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_authorizationController:didCompleteWithAuthorization:error:", *(void *)(a1 + 40), 0, *(void *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyRequestQueue, 0);
  objc_storeStrong((id *)&self->_stateByController, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);

  objc_storeStrong((id *)&self->_serializationGroup, 0);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Missing AKAppleIDPasskeyAuthenticationController instance.", v2, v3, v4, v5, v6);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to fetch user visible keychain sync status. Missing username", v2, v3, v4, v5, v6);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "We don't have a way to know if passkey can be created in keychain. Failing gracefully.", v2, v3, v4, v5, v6);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50_cold_1(char a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"NO";
  if (a1) {
    uint64_t v3 = @"YES";
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_6_2(&dword_193494000, a2, a3, "preflightCanCreateICloudKeychainPasskey : %@", (uint8_t *)&v4);
}

void __100__AKAppleIDPasskeyAuthenticationController_canCreateiCloudKeychainPasskeyForAccount_withCompletion___block_invoke_50_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "preflightCanCreateICloudKeychainPasskey failed with error: %{private}@", v1, 0xCu);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "AppleID passkey keychain status failed. Missing username", v2, v3, v4, v5, v6);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "AppleID passkey keychain status failed.", v2, v3, v4, v5, v6);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_2(&dword_193494000, a2, v3, "Saved passkeyInKeychainCount (%lu) to account", v4);
}

void __85__AKAppleIDPasskeyAuthenticationController_appleIDPasskeysForAccount_withCompletion___block_invoke_61_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Failed to save setPasskeyInKeychainCount to account", v2, v3, v4, v5, v6);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to delete AppleID passkeys - Missing username", v2, v3, v4, v5, v6);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Failed to delete AppleID passkeys - Missing implementation", v2, v3, v4, v5, v6);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Successfully deleted all AppleID passkeys", v2, v3, v4, v5, v6);
}

void __87__AKAppleIDPasskeyAuthenticationController_deleteAllPasskeysForAccount_withCompletion___block_invoke_67_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Failed to delete AppleID passkeys with error:%{private}@", v1, 0xCu);
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "%@: Unable to create passkey with invalid context (%@) missing required parameters");
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Unexpectedly failed creating passkey registration request (nil return)", v2, v3, v4, v5, v6);
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Unexpectedly failed creating authorization controller (nil return)", v2, v3, v4, v5, v6);
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_2(&dword_193494000, v0, v1, "Creating credential with context: %@", v2);
}

- (void)_onqueue_createPasskeyWithContext:completion:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Authorization controller unexpectedly does not respond to selector: 'performSilentRequests'", v2, v3, v4, v5, v6);
}

- (void)_pushPasskeyRequestState:forController:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Unexpectedly passed nil authorization controller as key for passkey request state", v2, v3, v4, v5, v6);
}

- (void)_onqueue_authorizationController:didCompleteWithAuthorization:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_7(&dword_193494000, v0, v1, "Unexpected nil passkey request state found for authorization controller", v2, v3, v4, v5, v6);
}

- (void)_onqueue_authorizationController:didCompleteWithAuthorization:error:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Failed to create passkey using controller (%@) with error: %@");
}

- (void)_onqueue_authorizationController:(void *)a1 didCompleteWithAuthorization:(NSObject *)a2 error:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 credential];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Authorization (%@) is not of desired credential type: %@", (uint8_t *)&v5, 0x16u);
}

- (void)_onqueue_authorizationController:(void *)a1 didCompleteWithAuthorization:(NSObject *)a2 error:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_2(&dword_193494000, a2, v4, "AppleID passkey was created successfully with context: %@", v5);
}

- (void)_authorizationControllerForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[AKAppleIDPasskeyAuthenticationController _authorizationControllerForAccount:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_193494000, a2, OS_LOG_TYPE_FAULT, "%s: Skipping status check - registrationRequest is nil for passkeyProvider: %@", (uint8_t *)&v2, 0x16u);
}

@end