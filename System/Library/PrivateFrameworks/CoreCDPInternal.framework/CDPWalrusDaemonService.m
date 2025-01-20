@interface CDPWalrusDaemonService
- (BOOL)_allowWalrusAccess;
- (BOOL)_allowWalrusPCSKeysAccess;
- (CDPInternalWalrusStateController)walrusStateController;
- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3;
- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3 walrusController:(id)a4;
- (id)defaultWalrusStateController;
- (void)_checkWalrusBeforeFetchingPCSKeysForServices:(id)a3 pcsController:(id)a4 completion:(id)a5;
- (void)_pcsKeysForServices:(id)a3 pcsController:(id)a4 completion:(id)a5;
- (void)broadcastWalrusStateChange;
- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4;
- (void)pcsKeysForServices:(id)a3 completion:(id)a4;
- (void)repairWalrusWithCompletion:(id)a3;
- (void)setWalrusStateController:(id)a3;
- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5;
- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4;
- (void)walrusStatusWithContext:(id)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation CDPWalrusDaemonService

- (void).cxx_destruct
{
}

- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3 walrusController:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPWalrusDaemonService;
  v7 = [(CDPWalrusDaemonService *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_entitlements = a3;
    if (v6)
    {
      v9 = (CDPInternalWalrusStateController *)v6;
    }
    else
    {
      v9 = [(CDPWalrusDaemonService *)v7 defaultWalrusStateController];
    }
    walrusStateController = v8->_walrusStateController;
    v8->_walrusStateController = v9;
  }
  return v8;
}

- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3
{
  return [(CDPWalrusDaemonService *)self initWithEntitlements:a3 walrusController:0];
}

- (id)defaultWalrusStateController
{
  walrusStateController = self->_walrusStateController;
  if (!walrusStateController)
  {
    v4 = [CDPInternalWalrusStateController alloc];
    v5 = [MEMORY[0x263F34328] sharedInstance];
    id v6 = objc_alloc_init(CDPDAccount);
    v7 = objc_alloc_init(CDPWalrusSecurityProxyImpl);
    id v8 = objc_alloc_init(MEMORY[0x263F343D0]);
    v9 = [(CDPInternalWalrusStateController *)v4 initWithAccount:v5 cdpdAccount:v6 securityProxy:v7 pcsProxy:v8];
    v10 = self->_walrusStateController;
    self->_walrusStateController = v9;

    walrusStateController = self->_walrusStateController;
  }
  return walrusStateController;
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    id v8 = [(CDPWalrusDaemonService *)self walrusStateController];
    [v8 walrusStatusWithContext:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:]();
  }

  if (v7)
  {
    id v8 = _CDPStateError();
    v7[2](v7, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

- (CDPInternalWalrusStateController)walrusStateController
{
  return self->_walrusStateController;
}

- (BOOL)_allowWalrusAccess
{
  return (LOBYTE(self->_entitlements) >> 6) & 1;
}

- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    id v8 = [(CDPWalrusDaemonService *)self walrusStateController];
    id v14 = 0;
    v9 = [v8 combinedWalrusStatusWithContext:v6 error:&v14];
    id v10 = v14;

    v11 = _CDPLogSystem();
    objc_super v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CDPWalrusDaemonService combinedWalrusStatusWithContext:completion:](v10, v12);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Walrus combined status %@ status fetched successfully.", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7, v9, v10);
    }

    goto LABEL_14;
  }
  v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:]();
  }

  if (v7)
  {
    _CDPStateError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
LABEL_14:
  }
}

- (void)repairWalrusWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    v5 = [(CDPWalrusDaemonService *)self walrusStateController];
    [v5 repairWalrusStatusWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:]();
  }

  if (v4)
  {
    v5 = _CDPStateError();
    v4[2](v4, v5);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)broadcastWalrusStateChange
{
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    +[CDPBroadcaster broadcastWalrusStateChangeNotification];
  }
  else
  {
    v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService walrusStatusWithContext:completion:]();
    }
  }
}

- (void)updateWalrusStatus:(unint64_t)a3 authenticatedContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    if (a3)
    {
      id v10 = [(CDPWalrusDaemonService *)self walrusStateController];
      v11 = [v8 password];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__CDPWalrusDaemonService_updateWalrusStatus_authenticatedContext_completion___block_invoke;
      v16[3] = &unk_26432FA18;
      id v17 = v8;
      unint64_t v19 = a3;
      id v18 = v9;
      [v10 setWalrusStatusEnabled:a3 == 1 password:v11 completion:v16];

      objc_super v12 = v17;
LABEL_13:

      goto LABEL_14;
    }
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService updateWalrusStatus:authenticatedContext:completion:]();
    }

    if (v9)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7002);
      goto LABEL_12;
    }
  }
  else
  {
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService updateWalrusStatus:authenticatedContext:completion:]();
    }

    if (v9)
    {
      uint64_t v14 = _CDPStateError();
LABEL_12:
      objc_super v12 = (void *)v14;
      (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v14);
      goto LABEL_13;
    }
  }
LABEL_14:
}

void __77__CDPWalrusDaemonService_updateWalrusStatus_authenticatedContext_completion___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__CDPWalrusDaemonService_updateWalrusStatus_authenticatedContext_completion___block_invoke_cold_1();
    }

    id v9 = _CDPStateErrorWithUnderlying();
    goto LABEL_5;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Walrus status updated successfully.", v16, 2u);
  }

  if ([MEMORY[0x263F34400] isGuitarfishEnabled]
    && [(id)a1[4] edpState] == 2
    && a1[6] == 2)
  {
    id v10 = [CDPDPCSController alloc];
    uint64_t v11 = a1[4];
    id v12 = objc_alloc_init(MEMORY[0x263F343D0]);
    id v6 = [(CDPDPCSController *)v10 initWithContext:v11 pcsProxy:v12];

    v13 = objc_alloc_init(CDPDAuthProxyImpl);
    uint64_t v14 = [[CDPDEDPRecoveryController alloc] initWithContext:a1[4] uiProvider:0 authProvider:v13 pcsController:v6];
    [(CDPDEDPRecoveryController *)v14 processADPDisablement];

    id v9 = 0;
LABEL_5:

    goto LABEL_13;
  }
  id v9 = 0;
LABEL_13:
  uint64_t v15 = a1[5];
  if (v15) {
    (*(void (**)(uint64_t, id, void *))(v15 + 16))(v15, v5, v9);
  }
}

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    id v5 = [(CDPWalrusDaemonService *)self walrusStateController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke;
    v8[3] = &unk_26432FA40;
    id v9 = v4;
    [v5 webAccessStatusWithCompletion:v8];

    id v6 = v9;
LABEL_7:

    goto LABEL_8;
  }
  v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CDPWalrusDaemonService webAccessStatusWithCompletion:]();
  }

  if (v4)
  {
    id v6 = _CDPStateError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:
}

void __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a2;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Web access status (%lu) fetched successfully.", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(CDPWalrusDaemonService *)self _allowWalrusAccess])
  {
    if (a3)
    {
      v7 = [(CDPWalrusDaemonService *)self walrusStateController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke;
      v12[3] = &unk_26432F318;
      id v13 = v6;
      [v7 setWebAccessStatusEnabled:a3 == 1 completion:v12];

      uint64_t v8 = v13;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService updateWebAccessStatus:completion:]();
    }

    if (v6)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7002);
      goto LABEL_12;
    }
  }
  else
  {
    int v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService updateWebAccessStatus:completion:]();
    }

    if (v6)
    {
      uint64_t v10 = _CDPStateError();
LABEL_12:
      uint64_t v8 = (void *)v10;
      (*((void (**)(id, uint64_t))v6 + 2))(v6, v10);
      goto LABEL_13;
    }
  }
LABEL_14:
}

void __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke_cold_1(v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Web access status updated successfully.", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  if ([(CDPWalrusDaemonService *)self _allowWalrusPCSKeysAccess])
  {
    uint64_t v8 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    id v9 = objc_alloc_init(MEMORY[0x263F343D0]);
    uint64_t v10 = [[CDPDPCSController alloc] initWithContext:v8 pcsProxy:v9];
    if ([MEMORY[0x263F34400] isGuitarfishEnabled]
      && [v8 edpState] == 2
      && ![v8 edpHealth])
    {
      [(CDPWalrusDaemonService *)self _pcsKeysForServices:v6 pcsController:v10 completion:v7];
    }
    else
    {
      [(CDPWalrusDaemonService *)self _checkWalrusBeforeFetchingPCSKeysForServices:v6 pcsController:v10 completion:v7];
    }
  }
  else
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService updateWalrusStatus:authenticatedContext:completion:]();
    }

    if (v7)
    {
      id v12 = objc_alloc_init(NSDictionary);
      id v13 = _CDPStateError();
      v7[2](v7, v12, v13);
    }
  }
}

- (void)_checkWalrusBeforeFetchingPCSKeysForServices:(id)a3 pcsController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, void *))a5;
  uint64_t v11 = [(CDPWalrusDaemonService *)self walrusStateController];
  id v20 = 0;
  uint64_t v12 = [v11 walrusStatusWithContext:0 error:&v20];
  id v13 = v20;

  if (v13)
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService _checkWalrusBeforeFetchingPCSKeysForServices:pcsController:completion:](v13);
    }

    if (v10)
    {
      id v15 = objc_alloc_init(NSDictionary);
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = -7002;
LABEL_12:
      unint64_t v19 = objc_msgSend(v16, "cdp_errorWithCode:", v17);
      v10[2](v10, v15, v19);
    }
  }
  else if (v12 == 1)
  {
    [(CDPWalrusDaemonService *)self _pcsKeysForServices:v8 pcsController:v9 completion:v10];
  }
  else
  {
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CDPWalrusDaemonService _checkWalrusBeforeFetchingPCSKeysForServices:pcsController:completion:]();
    }

    if (v10)
    {
      id v15 = objc_alloc_init(NSDictionary);
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = -7003;
      goto LABEL_12;
    }
  }
}

- (void)_pcsKeysForServices:(id)a3 pcsController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CDPWalrusDaemonService *)self walrusStateController];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke;
  v15[3] = &unk_26432FA68;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [v11 webAccessStatusWithCompletion:v15];
}

void __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke_cold_2(v5);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = objc_alloc_init(NSDictionary);
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = -7102;
LABEL_26:
      v23 = objc_msgSend(v9, "cdp_errorWithCode:", v10);
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v23);
      goto LABEL_27;
    }
  }
  else
  {
    if (a2 == 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        id v25 = v8;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v17 = *(void **)(a1 + 40);
            id v26 = 0;
            id v18 = [v17 pcsKeysForService:v16 error:&v26];
            id v19 = v26;
            if (v19)
            {
              id v20 = _CDPLogSystem();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = [v19 description];
                *(_DWORD *)buf = 138412546;
                uint64_t v32 = v16;
                __int16 v33 = 2112;
                v34 = v21;
                _os_log_error_impl(&dword_218640000, v20, OS_LOG_TYPE_ERROR, "Error fetching key for service %@: %@", buf, 0x16u);

                id v8 = v25;
              }
            }
            else if (v18)
            {
              [v8 setObject:v18 forKeyedSubscript:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v13);
      }

      uint64_t v22 = *(void *)(a1 + 48);
      if (!v22)
      {
        id v5 = 0;
        goto LABEL_28;
      }
      v23 = (void *)[v8 copy];
      (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
      id v5 = 0;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = objc_alloc_init(NSDictionary);
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = -7103;
      goto LABEL_26;
    }
  }
LABEL_29:
}

- (BOOL)_allowWalrusPCSKeysAccess
{
  return [(CDPWalrusDaemonService *)self _allowWalrusAccess] && (self->_entitlements & 0x80) != 0;
}

- (void)setWalrusStateController:(id)a3
{
}

- (void)walrusStatusWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying walrus access. Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)combinedWalrusStatusWithContext:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 code];
  uint64_t v5 = [a1 description];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch walrus combined status with error code: %zd, error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)updateWalrusStatus:authenticatedContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Unknown walrus status. Can't update.", v2, v3, v4, v5, v6);
}

- (void)updateWalrusStatus:authenticatedContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying walrus operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

void __77__CDPWalrusDaemonService_updateWalrusStatus_authenticatedContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to update walrus status with error: %@", v2, v3, v4, v5, v6);
}

- (void)webAccessStatusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying web access. Missing entitlement.", v2, v3, v4, v5, v6);
}

void __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3(&dword_218640000, v2, v3, "Failed to fetch web access status with error: %@", v4, v5, v6, v7, v8);
}

- (void)updateWebAccessStatus:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Unknown web access status. Can't update.", v2, v3, v4, v5, v6);
}

- (void)updateWebAccessStatus:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Denying web access operation. Missing entitlement.", v2, v3, v4, v5, v6);
}

void __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3(&dword_218640000, v2, v3, "Failed to update web access status with error: %@", v4, v5, v6, v7, v8);
}

- (void)_checkWalrusBeforeFetchingPCSKeysForServices:pcsController:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Walrus status (%lu) is not enabled, abandoning pcs key fetch.", v2, v3, v4, v5, v6);
}

- (void)_checkWalrusBeforeFetchingPCSKeysForServices:(void *)a1 pcsController:completion:.cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3(&dword_218640000, v2, v3, "Unable to determine walrus status, abandoning pcs key fetch. error: %@", v4, v5, v6, v7, v8);
}

void __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Web access status (%lu) is not enabled, abandoning pcs key fetch.", v2, v3, v4, v5, v6);
}

void __71__CDPWalrusDaemonService__pcsKeysForServices_pcsController_completion___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_3(&dword_218640000, v2, v3, "Unable to determine web access status, abandoning pcs key fetch. error: %@", v4, v5, v6, v7, v8);
}

@end