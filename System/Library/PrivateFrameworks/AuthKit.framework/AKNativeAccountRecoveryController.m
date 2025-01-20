@interface AKNativeAccountRecoveryController
+ (BOOL)shouldSendServerResponseForRecoveredInfo:(id)a3 withRecoveryError:(id)a4;
+ (id)postBodyForiCSCServerUIResponseWithContext:(id)a3 recoveryError:(id)a4;
+ (id)requestForRecoveryCompletionWithContext:(id)a3 recoveredInfo:(id)a4 recoveryError:(id)a5;
- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4;
- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4 flowID:(id)a5;
- (id)_mapICSCRecoveryResultsToAuthKit:(id)a3;
- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4;
- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5;
- (void)dismissNativeRecoveryUIWithCompletion:(id)a3;
- (void)presentNativeRecoveryUIWithCompletion:(id)a3;
@end

@implementation AKNativeAccountRecoveryController

- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4 flowID:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AKNativeAccountRecoveryController;
  v12 = [(AKNativeAccountRecoveryController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recoveryContext, a3);
    if (v11)
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v17 = [(AKAccountRecoveryContext *)v13->_recoveryContext authContext];
        v18 = [v17 telemetryFlowID];
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        __int16 v22 = 2112;
        v23 = v18;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_debug_impl(&dword_193494000, v14, OS_LOG_TYPE_DEBUG, "%@: Overriding the telemetryFlowID: from recoveryContext.authContext.telemetryFlowID=%@ to flowID=%@", buf, 0x20u);
      }
      v15 = [(AKAccountRecoveryContext *)v13->_recoveryContext authContext];
      [v15 setTelemetryFlowID:v11];
    }
    objc_storeStrong((id *)&v13->_cdpUiProvider, a4);
  }

  return v13;
}

- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4
{
  return [(AKNativeAccountRecoveryController *)self initWithContext:a3 uiProvider:a4 flowID:0];
}

- (void)presentNativeRecoveryUIWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKNativeAccountRecoveryController presentNativeRecoveryUIWithCompletion:]((uint64_t)self, v5);
  }

  v6 = +[AKCDPFactory recoveryControllerWithContext:self->_recoveryContext];
  recoveryController = self->_recoveryController;
  self->_recoveryController = v6;

  [(CDPRecoveryController *)self->_recoveryController setAuthProvider:self];
  [(CDPRecoveryController *)self->_recoveryController setUiProvider:self->_cdpUiProvider];
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKNativeAccountRecoveryController presentNativeRecoveryUIWithCompletion:]((uint64_t *)&self->_recoveryController, v8);
  }

  id v9 = self->_recoveryController;
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke;
    v11[3] = &unk_1E575F898;
    v11[4] = self;
    id v12 = v4;
    [(CDPRecoveryController *)v9 performRecovery:v11];
  }
  else if (v4)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7001);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    v8 = [*(id *)(*(void *)(a1 + 32) + 8) context];
    if ([v8 mandatesRecoveryKey])
    {
    }
    else
    {
      int v10 = objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5215);

      if (v10)
      {
        id v11 = +[AKNativeAccountRecoveryController postBodyForiCSCServerUIResponseWithContext:*(void *)(*(void *)(a1 + 32) + 16) recoveryError:v6];
        goto LABEL_12;
      }
    }
    id v11 = 0;
LABEL_12:
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_16:
      v13();
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) supportsMasterKeyRecovery])
  {
    id v11 = [*(id *)(a1 + 32) _mapICSCRecoveryResultsToAuthKit:v5];
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v5, 0);
  }
LABEL_18:
}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  id v7 = a3;
  recoveryContext = self->_recoveryContext;
  self->_recoveryContext = 0;

  [(CDPRecoveryController *)self->_recoveryController invalidate];
  recoveryController = self->_recoveryController;
  self->_recoveryController = 0;

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    id v6 = v7;
  }
}

- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(AKAppleIDAuthenticationController);
  recoveryContext = self->_recoveryContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke;
  v12[3] = &unk_1E575F898;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(AKAppleIDAuthenticationController *)v8 renewRecoveryTokenWithContext:recoveryContext completion:v12];
}

void __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  v8 = (void *)[v6 copy];
  if (!v7)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"AKPassword"];
    [v8 setPasswordEquivToken:v9];
  }
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1((uint64_t)v8, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = objc_alloc_init(AKAppleIDAuthenticationController);
  [(AKAppleIDAuthenticationController *)v9 verifyMasterKey:v8 context:self->_recoveryContext completion:v7];
}

- (id)_mapICSCRecoveryResultsToAuthKit:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = +[AKCDPFactory cdpIDMSRecordPRKKey];
  id v7 = [v4 objectForKeyedSubscript:v6];

  id v8 = +[AKCDPFactory cdpIDMSRecordMIDKey];
  uint64_t v9 = [v4 objectForKeyedSubscript:v8];

  if (v7)
  {
    [v5 setObject:v7 forKeyedSubscript:@"X-Apple-I-iCSC-PRK"];
    if (v9)
    {
LABEL_3:
      [v5 setObject:v9 forKeyedSubscript:@"X-Apple-I-iCSC-MD-M"];
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AKNativeAccountRecoveryController _mapICSCRecoveryResultsToAuthKit:](v10);
    }

    if (v9) {
      goto LABEL_3;
    }
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKNativeAccountRecoveryController _mapICSCRecoveryResultsToAuthKit:](v11);
  }

LABEL_10:
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

+ (id)requestForRecoveryCompletionWithContext:(id)a3 recoveredInfo:(id)a4 recoveryError:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Building recovery response request", buf, 2u);
  }

  uint64_t v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v9;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Recovered info %@", buf, 0xCu);
  }

  id v13 = [v8 recoveryContinuationURL];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F18D50] requestWithURL:v13];
    [v14 setHTTPMethod:@"POST"];
    v15 = [v8 decodedRecoveryIdentityTokenString];
    if (v15)
    {
      v16 = [v8 authContext];
      v17 = [v16 altDSID];
      objc_msgSend(v14, "ak_addICSCRecoveryHeaderWithIdentityToken:forAltDSID:", v15, v17);

      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke;
      v30 = &unk_1E575F8C0;
      v18 = v14;
      v31 = v18;
      id v19 = v8;
      id v32 = v19;
      [v9 enumerateKeysAndObjectsUsingBlock:&v27];
      v20 = objc_msgSend(a1, "postBodyForiCSCServerUIResponseWithContext:recoveryError:", v19, v10, v27, v28, v29, v30);
      [v18 ak_setBodyWithParameters:v20];
      v21 = _AKLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [v18 allHTTPHeaderFields];
        *(_DWORD *)buf = 138412290;
        id v34 = v22;
        _os_log_impl(&dword_193494000, v21, OS_LOG_TYPE_DEFAULT, "Recovery response: %@", buf, 0xCu);
      }
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v20;
        _os_log_impl(&dword_193494000, v23, OS_LOG_TYPE_DEFAULT, "Recovery response body: %@", buf, 0xCu);
      }

      __int16 v24 = v18;
      id v25 = v31;
    }
    else
    {
      id v25 = _AKLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[AKNativeAccountRecoveryController requestForRecoveryCompletionWithContext:recoveredInfo:recoveryError:](v25);
      }
      __int16 v24 = 0;
    }
  }
  else
  {
    __int16 v24 = 0;
  }

  return v24;
}

void __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 isEqualToString:@"X-Apple-Recovery-Identity-Token"])
  {
    if ([v5 isEqualToString:@"X-Apple-I-iCSC-PRK"])
    {
      id v10 = [v6 dataUsingEncoding:4];
      id v11 = [v10 base64EncodedStringWithOptions:0];

      id v12 = 0;
    }
    else
    {
      objc_opt_class();
      id v14 = v6;
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }

      if (v15)
      {
        id v13 = v15;
        id v12 = 0;
        id v11 = v13;
        goto LABEL_12;
      }
      objc_opt_class();
      id v16 = v14;
      if (objc_opt_isKindOfClass()) {
        id v12 = v16;
      }
      else {
        id v12 = 0;
      }

      if (!v12)
      {
        id v8 = _AKLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke_cold_1((uint64_t)v16, v8);
        }
        goto LABEL_3;
      }
      id v11 = [v12 stringValue];
    }
    id v13 = 0;
LABEL_12:
    [*(id *)(a1 + 32) setValue:v11 forHTTPHeaderField:v5];

    goto LABEL_13;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) authContext];
  id v9 = [v8 altDSID];
  objc_msgSend(v7, "ak_addRecoveryHeaderWithIdentityToken:forAltDSID:", v6, v9);

LABEL_3:
LABEL_13:
}

+ (id)postBodyForiCSCServerUIResponseWithContext:(id)a3 recoveryError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Building recovery response body", v21, 2u);
  }

  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [v6 authContext];

  id v10 = [v9 username];

  if (v10) {
    [v8 setObject:v10 forKeyedSubscript:@"appleid"];
  }
  if (!v5)
  {
    [v8 setObject:@"success" forKeyedSubscript:@"status"];
    goto LABEL_17;
  }
  [v8 setObject:@"failure" forKeyedSubscript:@"status"];
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
  [v8 setObject:v11 forKeyedSubscript:@"errorCode"];

  id v12 = [v5 domain];
  id v13 = +[AKCDPFactory cdpErrorDomain];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = [v5 code];
    switch(v15)
    {
      case -5215:
        id v16 = AKActionCancel;
        break;
      case -5207:
        id v16 = AKICSCResponseActionStartAccountRecovery;
        break;
      case -5200:
        id v16 = AKICSCResponseActionTryAgain;
        break;
      default:
        goto LABEL_15;
    }
    [v8 setObject:*v16 forKeyedSubscript:@"action"];
  }
LABEL_15:
  v17 = [v5 localizedFailureReason];

  if (v17)
  {
    v18 = [v5 localizedFailureReason];
    [v8 setObject:v18 forKeyedSubscript:@"errorMessage"];
  }
LABEL_17:
  id v19 = (void *)[v8 copy];

  return v19;
}

+ (BOOL)shouldSendServerResponseForRecoveredInfo:(id)a3 withRecoveryError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "shouldSendServerResponseForRecoveredInfo: Recovery error: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    id v6 = [v4 domain];
    id v7 = +[AKCDPFactory cdpErrorDomain];
    if ([v6 isEqualToString:v7]) {
      BOOL v8 = [v4 code] == -5200 || objc_msgSend(v4, "code") == -5207 || objc_msgSend(v4, "code") == -5215;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpUiProvider, 0);
  objc_storeStrong((id *)&self->_recoveryContext, 0);

  objc_storeStrong((id *)&self->_recoveryController, 0);
}

- (void)presentNativeRecoveryUIWithCompletion:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Starting recovery using %@...", (uint8_t *)&v3, 0xCu);
}

- (void)presentNativeRecoveryUIWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 16) authContext];
  uint64_t v5 = [v4 username];
  id v6 = [*(id *)(a1 + 16) authContext];
  id v7 = [v6 DSID];
  int v8 = 141558786;
  uint64_t v9 = 1752392040;
  __int16 v10 = 2112;
  id v11 = v5;
  __int16 v12 = 2160;
  uint64_t v13 = 1752392040;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Starting retrieval of recovery info for appleId <%{mask.hash}@ : %{mask.hash}@>", (uint8_t *)&v8, 0x2Au);
}

void __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve recovery info with error. %@", (uint8_t *)&v2, 0xCu);
}

void __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Recovered data for context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_mapICSCRecoveryResultsToAuthKit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Escrowed recovery info missing MID", v1, 2u);
}

- (void)_mapICSCRecoveryResultsToAuthKit:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Escrowed recovery info missing PRK", v1, 2u);
}

+ (void)requestForRecoveryCompletionWithContext:(os_log_t)log recoveredInfo:recoveryError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Failed to unwrap the icsc recovery identity token.", v1, 2u);
}

void __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_193494000, a2, OS_LOG_TYPE_FAULT, "Unexpected recoveredValue: %@", (uint8_t *)&v2, 0xCu);
}

@end