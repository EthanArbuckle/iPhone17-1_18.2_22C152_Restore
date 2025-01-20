@interface CDPDKeychainSync
+ (id)_defaultUserVisibleViewSet;
+ (id)keyChainSync;
+ (id)keyChainSyncWithProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5;
- (BOOL)_isThisDeviceInCircle;
- (BOOL)_keychainSyncAvailableViaOctacon;
- (BOOL)_keychainSyncAvailableViaSOS;
- (BOOL)_setKeychainSyncState:(BOOL)a3 error:(id *)a4;
- (BOOL)isUserVisibleKeychainSyncAvailable;
- (BOOL)isUserVisibleKeychainSyncEnabled;
- (CDPDCircleProxy)circleProxy;
- (CDPDCircleProxy)sosCircleProxy;
- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5;
- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 policyProvider:(id)a5;
- (CDPDKeychainSync)initWithContext:(id)a3;
- (CDPDKeychainSyncPolicyProvider)syncPolicy;
- (void)_preflightCircleStatusWithCompletion:(id)a3;
- (void)_processAuthFailure:(id)a3 completion:(id)a4;
- (void)_setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)buddyFinished;
- (void)isUserVisibleKeychainSyncAvailable;
- (void)isUserVisibleKeychainSyncEnabled;
- (void)removeNonViewAwarePeersFromCircleWithCompletion:(id)a3;
- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)updateKeychainSyncStateIfNeededWithCompletion:(id)a3;
@end

@implementation CDPDKeychainSync

+ (id)keyChainSync
{
  v2 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  v3 = [[CDPDKeychainSync alloc] initWithContext:v2];

  return v3;
}

+ (id)keyChainSyncWithProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CDPDKeychainSync alloc] initWithCircleProxy:v9 sosCircleProxy:v8 context:v7];

  return v10;
}

- (CDPDKeychainSync)initWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F34340];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContext:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:v5];
  id v8 = [[CDPDDefaultKeychainSyncPolicyProvider alloc] initWithContext:v5];

  id v9 = [(CDPDKeychainSync *)self initWithCircleProxy:v6 sosCircleProxy:v7 policyProvider:v8];
  return v9;
}

- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CDPDDefaultKeychainSyncPolicyProvider alloc] initWithContext:v8];

  v12 = [(CDPDKeychainSync *)self initWithCircleProxy:v10 sosCircleProxy:v9 policyProvider:v11];
  return v12;
}

- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 policyProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CDPDKeychainSync;
  v12 = [(CDPDKeychainSync *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_circleProxy, a3);
    objc_storeStrong((id *)&v13->_sosCircleProxy, a4);
    objc_storeStrong((id *)&v13->_syncPolicy, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)_keychainSyncAvailableViaSOS
{
  return [(CDPDCircleProxy *)self->_sosCircleProxy hasNonViewAwarePeers];
}

- (BOOL)_keychainSyncAvailableViaOctacon
{
  return [(CDPDCircleProxy *)self->_circleProxy fetchUserControllableViewsSyncingEnabled:0];
}

- (void)buddyFinished
{
}

- (BOOL)isUserVisibleKeychainSyncAvailable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(CDPDKeychainSync *)self syncPolicy];
  int v4 = [v3 keychainSyncAllowedByMDM];

  if ((v4 & 1) == 0)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CDPDKeychainSync isUserVisibleKeychainSyncAvailable]();
    }
  }
  v6 = [(CDPDKeychainSync *)self syncPolicy];
  char v7 = [v6 keychainSyncAllowedByServer];

  if ((v7 & 1) == 0)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDKeychainSync isUserVisibleKeychainSyncAvailable]();
    }

    int v4 = 0;
  }
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"DISALLOWED";
    if (v4) {
      id v10 = @"ALLOWED";
    }
    int v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "isUserVisibleKeychainSyncAllowed: sync is currently %{public}@", (uint8_t *)&v12, 0xCu);
  }

  return v4;
}

- (BOOL)isUserVisibleKeychainSyncEnabled
{
  if ([(CDPDKeychainSync *)self _isThisDeviceInCircle])
  {
    if ([(CDPDKeychainSync *)self _keychainSyncAvailableViaSOS])
    {
      v3 = _CDPLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[CDPDKeychainSync isUserVisibleKeychainSyncEnabled]();
      }

      return 1;
    }
    else
    {
      circleProxy = self->_circleProxy;
      return [(CDPDCircleProxy *)circleProxy fetchUserControllableViewsSyncingEnabled:0];
    }
  }
  else
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPDKeychainSync isUserVisibleKeychainSyncEnabled]();
    }

    return 0;
  }
}

- (BOOL)_isThisDeviceInCircle
{
  return [(CDPDCircleProxy *)self->_circleProxy combinedCachedCircleStatus:0] == 1;
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.5();
  }

  v6 = [(CDPDKeychainSync *)self syncPolicy];
  int v7 = [v6 userHasExplicitlyDisabledSync];

  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = 0;
      id v9 = "updateKeychainSyncStateIfNeeded: User has previously explicitly disabled keychain sync. Ensuring that preference is honored.";
      id v10 = (uint8_t *)&v29;
LABEL_12:
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (![(CDPDKeychainSync *)self isUserVisibleKeychainSyncAvailable])
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "updateKeychainSyncStateIfNeeded: Keychain sync is not available due to IAM/MDM policy. Ensuring it is disabled";
      id v10 = buf;
      goto LABEL_12;
    }
LABEL_13:

    objc_super v16 = self;
    uint64_t v17 = 0;
LABEL_14:
    -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:](v16, "_setUserVisibleKeychainSyncEnabled:withCompletion:", v17, v4, v26);
    goto LABEL_15;
  }
  BOOL v11 = [(CDPDKeychainSync *)self _keychainSyncAvailableViaSOS];
  int v12 = _CDPLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (!v13) {
      goto LABEL_19;
    }
    __int16 v27 = 0;
    uint64_t v14 = "updateKeychainSyncStateIfNeeded: Keychain sync currently implicitly ON via SOS. Enabling OT views as well.";
    v15 = (uint8_t *)&v27;
  }
  else
  {
    if (!v13) {
      goto LABEL_19;
    }
    LOWORD(v26) = 0;
    uint64_t v14 = "updateKeychainSyncStateIfNeeded: Ensuring keychain sync is enabled for user.";
    v15 = (uint8_t *)&v26;
  }
  _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
LABEL_19:

  v18 = [(CDPDKeychainSync *)self syncPolicy];
  int v19 = [v18 isBuddyFinished];

  v20 = _CDPLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:]();
    }

    v22 = [(CDPDKeychainSync *)self syncPolicy];
    int v23 = [v22 userHasExplicitlyDisabledSync];

    id v8 = _CDPLogSystem();
    BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (!v23)
    {
      if (v24) {
        -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:]();
      }

      objc_super v16 = self;
      uint64_t v17 = 1;
      goto LABEL_14;
    }
    if (v24) {
      -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:]();
    }
    goto LABEL_13;
  }
  if (v21) {
    -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.4();
  }

  if (v4)
  {
    v25 = _CDPStateError();
    v4[2](v4, 0, v25);
  }
LABEL_15:
}

- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_26432F6A8;
  BOOL v11 = v4;
  aBlock[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  [(CDPDKeychainSync *)self _setUserVisibleKeychainSyncEnabled:v4 withCompletion:v8];
}

uint64_t __69__CDPDKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    BOOL v6 = *(unsigned char *)(a1 + 48) == 0;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "syncPolicy", v5);
    [v7 setUserHasExplicitlyDisabledSync:v6];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
  }
  return MEMORY[0x270F9A790]();
}

- (void)_setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = @"disable";
  if (v4) {
    id v7 = @"enable";
  }
  uint64_t v8 = v7;
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v8;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "_setUserVisibleKeychainSyncEnabled: Attempting to %{public}@ user-visible keychain sync.", buf, 0xCu);
  }

  id v10 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_26432FF58;
  BOOL v11 = v8;
  v22 = v11;
  id v12 = v10;
  id v23 = v12;
  id v13 = v6;
  id v24 = v13;
  uint64_t v14 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v4 && ![(CDPDKeychainSync *)self isUserVisibleKeychainSyncAvailable])
  {
    objc_super v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:]();
    }

    [(CDPDKeychainSync *)self _setUserVisibleKeychainSyncEnabled:0 withCompletion:0];
    if (v14)
    {
      uint64_t v17 = _CDPStateError();
      v14[2](v14, 0, v17);
    }
  }
  else if ([(CDPDKeychainSync *)self isUserVisibleKeychainSyncEnabled] == v4)
  {
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v11;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "_setUserVisibleKeychainSyncEnabled: No need to %{public}@ user-visible keychain because we are alraedy in that state.", buf, 0xCu);
    }

    if (v14) {
      v14[2](v14, 1, 0);
    }
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_110;
    v18[3] = &unk_264330C58;
    v18[4] = self;
    int v19 = v14;
    BOOL v20 = v4;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:v18];
  }
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "_setUserVisibleKeychainSyncEnabled: Sucessfully managed to %{public}@ user-visible keychain", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_processAuthFailure:completion:");
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2;
    v5[3] = &unk_26432F6A8;
    char v7 = *(unsigned char *)(a1 + 48);
    v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    [v3 _preflightCircleStatusWithCompletion:v5];
  }
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      BOOL v6 = 1;
LABEL_10:
      int v10 = *(void **)(a1 + 32);
      id v23 = 0;
      uint64_t v11 = [v10 _setKeychainSyncState:v6 error:&v23];
      id v9 = v23;
      v22[1] = 0;
      if (![MEMORY[0x263F34400] deferSOSFromSignIn]
        || !SOSCCFetchCompatibilityMode())
      {
LABEL_19:
        uint64_t v21 = *(void *)(a1 + 40);
        if (v21) {
          (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, v11, v9);
        }
        goto LABEL_21;
      }
      uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v13 = *(unsigned __int8 *)(a1 + 48);
      v22[0] = 0;
      int v14 = [v12 setUserControllableViewsSyncStatus:v13 error:v22];
      id v15 = v22[0];
      objc_super v16 = _CDPLogSystem();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          v18 = "Successfully enabled SOS views";
          int v19 = v16;
          uint32_t v20 = 2;
LABEL_17:
          _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v15;
        v18 = "Failed to enable SOS views: %@";
        int v19 = v16;
        uint32_t v20 = 12;
        goto LABEL_17;
      }

      goto LABEL_19;
    }
    if (([*(id *)(a1 + 32) _keychainSyncAvailableViaSOS] & 1) == 0)
    {
      BOOL v6 = *(unsigned char *)(a1 + 48) != 0;
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      _CDPStateError();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
LABEL_21:
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
  }
}

- (void)_processAuthFailure:(id)a3 completion:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [v5 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F28F30]])
  {
    uint64_t v8 = [v5 code];

    if (v8 == -7013)
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CDPDKeychainSync _processAuthFailure:completion:]((uint64_t)v5, v9);
      }

      if (v6)
      {
        int v10 = _CDPStateError();
        v6[2](v6, 0, v10);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v6) {
    v6[2](v6, 0, v5);
  }
LABEL_10:
}

- (void)_preflightCircleStatusWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  if ([(CDPDKeychainSync *)self _isThisDeviceInCircle])
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CDPDKeychainSync _preflightCircleStatusWithCompletion:]();
    }

    if (v4)
    {
      BOOL v6 = _CDPStateError();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v6);
    }
  }
}

- (BOOL)_setKeychainSyncState:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  circleProxy = self->_circleProxy;
  id v13 = 0;
  uint64_t v7 = [(CDPDCircleProxy *)circleProxy setUserControllableViewsSyncStatus:a3 error:&v13];
  id v8 = v13;
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [NSNumber numberWithBool:v5];
    uint64_t v12 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    BOOL v17 = v12;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl(&dword_218640000, v9, OS_LOG_TYPE_DEBUG, "Calling setUserControllableViewsSyncStatus with enable=%@ returned success=%@ error: %@", buf, 0x20u);
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (void)removeNonViewAwarePeersFromCircleWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, id))a3;
  circleProxy = self->_circleProxy;
  id v8 = 0;
  uint64_t v6 = [(CDPDCircleProxy *)circleProxy removeNonViewAwarePeers:&v8];
  id v7 = v8;
  if (v4) {
    v4[2](v4, v6, v7);
  }
}

+ (id)_defaultUserVisibleViewSet
{
  if (_defaultUserVisibleViewSet_onceToken != -1) {
    dispatch_once(&_defaultUserVisibleViewSet_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_defaultUserVisibleViewSet_defaultViewSet;
  return v2;
}

uint64_t __46__CDPDKeychainSync__defaultUserVisibleViewSet__block_invoke()
{
  _defaultUserVisibleViewSet_defaultViewSet = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F16E48], *MEMORY[0x263F16E28], *MEMORY[0x263F16E40], *MEMORY[0x263F16E30], 0);
  return MEMORY[0x270F9A758]();
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (CDPDCircleProxy)sosCircleProxy
{
  return self->_sosCircleProxy;
}

- (CDPDKeychainSyncPolicyProvider)syncPolicy
{
  return self->_syncPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncPolicy, 0);
  objc_storeStrong((id *)&self->_sosCircleProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
}

- (void)isUserVisibleKeychainSyncAvailable
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "isUserVisibleKeychainSyncAllowed: sync is currently disallowed by MDM policy", v2, v3, v4, v5, v6);
}

- (void)isUserVisibleKeychainSyncEnabled
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "The device is NOT in circle and so isUserVisibleKeychainSyncEnabled will return NO", v1, 2u);
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User has explicitly disabled the keychain...Respect it.", v2, v3, v4, v5, v6);
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "User did not explicitly disabled keychain sync. Turning Keychain ON.", v2, v3, v4, v5, v6);
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Buddy flow is finished...Let us set correct keychain state", v2, v3, v4, v5, v6);
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Can't enable keychain until buddy setup is finished", v2, v3, v4, v5, v6);
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Trying to update KeyChainSync State", v2, v3, v4, v5, v6);
}

- (void)_setUserVisibleKeychainSyncEnabled:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "_setUserVisibleKeychainSyncEnabled: Sync is not allowed but we are attempting to enable it. Ensuring keychain sync is off, per policy.", v1, 2u);
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "_setUserVisibleKeychainSyncEnabled: Failed to %{public}@ user-visible keychain with error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_processAuthFailure:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "CDP State repair is needed because the account is iCDP enabled but HSA2 silent auth failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)_preflightCircleStatusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "CDP State repair is needed because the account is iCDP enabled but not in circle", v2, v3, v4, v5, v6);
}

@end