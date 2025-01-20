@interface CDPCustodianRecoveryKeyController
- (BOOL)_isInSOSCircleWithContext:(id)a3;
- (BOOL)_isSOSTrustAndSyncingEnabled;
- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 error:(id *)a4;
- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4;
- (void)checkCustodianRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)createRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5;
- (void)deleteRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5;
- (void)recoverOctagonUsingCustodianInfo:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)validateRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation CDPCustodianRecoveryKeyController

- (void)createRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 dsid];
  if (v10)
  {

LABEL_4:
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v29 = (os_signpost_id_t)v8;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Asking security to create custodian recovery key for %@", buf, 0xCu);
    }

    v13 = _CDPSignpostLogSystem();
    os_signpost_id_t v14 = _CDPSignpostCreate(v13);
    uint64_t v16 = v15;

    v17 = _CDPSignpostLogSystem();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CustodianCreateRecoveryKey", " enableTelemetry=YES ", buf, 2u);
    }

    v19 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v29 = v14;
      _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianCreateRecoveryKey  enableTelemetry=YES ", buf, 0xCu);
    }

    v20 = [v7 cliqueConfiguration];
    v21 = (void *)MEMORY[0x263F16D30];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke;
    v23[3] = &unk_264317158;
    os_signpost_id_t v26 = v14;
    uint64_t v27 = v16;
    id v25 = v9;
    id v24 = v8;
    [v21 createCustodianRecoveryKey:v20 uuid:v24 reply:v23];

    goto LABEL_12;
  }
  v11 = [v7 altDSID];

  if (v11) {
    goto LABEL_4;
  }
  v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController createRecoveryKeyWithContext:forUUID:completion:]();
  }

  v20 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v20);
LABEL_12:
}

void __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  id v8 = _CDPSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v31 = 67240192;
    LODWORD(v32) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianCreateRecoveryKey", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v31, 8u);
  }

  v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    v13 = (void *)a1[6];
    int v14 = [v6 code];
    int v31 = 134218496;
    v32 = v13;
    __int16 v33 = 2048;
    double v34 = v12;
    __int16 v35 = 1026;
    LODWORD(v36) = v14;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CustodianCreateRecoveryKey  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v31, 0x1Cu);
  }

  if (v6)
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v16 = [v5 wrappedKey];
    if (v16
      && (v17 = (void *)v16,
          [v5 wrappingKey],
          v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          v18))
    {
      v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v5 uuid];
        v21 = [v5 uuid];
        v22 = (void *)a1[4];
        v23 = @"not equal ❌";
        int v31 = 138412802;
        v32 = v20;
        if (v21 == v22) {
          v23 = @"equal ✅";
        }
        __int16 v33 = 2112;
        double v34 = *(double *)&v23;
        __int16 v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "OT CRK uuid %@ is %@ to AA custodianID %@", (uint8_t *)&v31, 0x20u);
      }
      id v24 = [CDPCustodianRecoveryInfo alloc];
      id v25 = [v5 wrappedKey];
      os_signpost_id_t v26 = [v5 wrappingKey];
      uint64_t v27 = [v5 uuid];
      v28 = [(CDPCustodianRecoveryInfo *)v24 initWithWrappedRKC:v25 wrappingKey:v26 custodianUUID:v27];

      os_signpost_id_t v29 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      uint64_t v30 = a1[5];
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
      v28 = (CDPCustodianRecoveryInfo *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v29 = *(void (**)(void))(v30 + 16);
    }
    v29();
  }
}

- (void)deleteRecoveryKeyWithContext:(id)a3 forUUID:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  os_signpost_id_t v10 = [v7 dsid];
  if (v10)
  {

LABEL_4:
    double v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v29 = (os_signpost_id_t)v8;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Asking security to delete custodian recovery key for %@", buf, 0xCu);
    }

    v13 = _CDPSignpostLogSystem();
    os_signpost_id_t v14 = _CDPSignpostCreate(v13);
    uint64_t v16 = v15;

    v17 = _CDPSignpostLogSystem();
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2182AE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CustodianDeleteRecoveryKey", " enableTelemetry=YES ", buf, 2u);
    }

    v19 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v29 = v14;
      _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianDeleteRecoveryKey  enableTelemetry=YES ", buf, 0xCu);
    }

    v20 = [v7 cliqueConfiguration];
    v21 = (void *)MEMORY[0x263F16D30];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke;
    v23[3] = &unk_264317180;
    os_signpost_id_t v26 = v14;
    uint64_t v27 = v16;
    id v25 = v9;
    id v24 = v8;
    [v21 removeCustodianRecoveryKey:v20 custodianRecoveryKeyUUID:v24 reply:v23];

    goto LABEL_12;
  }
  v11 = [v7 altDSID];

  if (v11) {
    goto LABEL_4;
  }
  v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController createRecoveryKeyWithContext:forUUID:completion:]();
  }

  v20 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void *))v9 + 2))(v9, v20);
LABEL_12:
}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  id v5 = _CDPSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v20 = 67240192;
    LODWORD(v21) = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CustodianDeleteRecoveryKey", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  id v8 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (double)Nanoseconds / 1000000000.0;
    uint64_t v10 = a1[6];
    int v11 = [v3 code];
    int v20 = 134218496;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    double v23 = v9;
    __int16 v24 = 1026;
    int v25 = v11;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CustodianDeleteRecoveryKey  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  double v12 = _CDPLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v13) {
      __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_2();
    }
  }
  else if (v13)
  {
    __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1((uint64_t)a1, v12, v14, v15, v16, v17, v18, v19);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)validateRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 dsid];
  if (v10)
  {

LABEL_4:
    double v12 = [v8 cliqueConfiguration];
    id v13 = objc_alloc(MEMORY[0x263F5B728]);
    uint64_t v14 = [v7 wrappedRKC];
    uint64_t v15 = [v7 wrappingKey];
    uint64_t v16 = [v7 custodianUUID];
    uint64_t v17 = (void *)[v13 initWithWrappedKey:v14 wrappingKey:v15 uuid:v16 error:0];

    uint64_t v18 = (void *)MEMORY[0x263F16D30];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke;
    v20[3] = &unk_2643171A8;
    id v22 = v9;
    id v21 = v7;
    [v18 preflightRecoverOctagonUsingCustodianRecoveryKey:v12 custodianRecoveryKey:v17 reply:v20];

    goto LABEL_5;
  }
  int v11 = [v8 altDSID];

  if (v11) {
    goto LABEL_4;
  }
  uint64_t v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:]();
  }

  double v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_5:
}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)recoverOctagonUsingCustodianInfo:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 dsid];
  if (v11)
  {

LABEL_4:
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __93__CDPCustodianRecoveryKeyController_recoverOctagonUsingCustodianInfo_withContext_completion___block_invoke;
    v24[3] = &unk_264317090;
    id v25 = v10;
    id v13 = (void (**)(void, void))MEMORY[0x21D4671C0](v24);
    id v23 = 0;
    uint64_t v14 = [(CDPCustodianRecoveryKeyController *)self _initializeRecoveryKeyWithInfo:v8 error:&v23];
    id v15 = v23;
    uint64_t v16 = _CDPLogSystem();
    uint64_t v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CDPCircleProxyImpl recoverOctagonUsingCustodianInfo:completion:]();
      }

      ((void (**)(void, id))v13)[2](v13, v15);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to recover octagon usign custodian recovery key", v22, 2u);
      }

      uint64_t v18 = (void *)MEMORY[0x263F16D30];
      uint64_t v19 = [v9 cliqueConfiguration];
      [v18 recoverOctagonUsingCustodianRecoveryKey:v19 custodianRecoveryKey:v14 reply:v13];
    }
    int v20 = v25;
    goto LABEL_12;
  }
  double v12 = [v9 altDSID];

  if (v12) {
    goto LABEL_4;
  }
  id v21 = _CDPLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController recoverOctagonUsingCustodianInfo:withContext:completion:]();
  }

  int v20 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void *))v10 + 2))(v10, v20);
LABEL_12:
}

void __93__CDPCustodianRecoveryKeyController_recoverOctagonUsingCustodianInfo_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      __int16 v9 = 0;
      id v7 = "Recover octagon usign custodian recovery key failed.";
      id v8 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    id v7 = "Recover octagon usign custodian recovery key succeed.";
    id v8 = buf;
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (id)_initializeRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPCustodianRecoveryKeyController _initializeRecoveryKeyWithInfo:error:](v5);
  }

  id v7 = objc_alloc(MEMORY[0x263F5B728]);
  id v8 = [v5 wrappedRKC];
  __int16 v9 = [v5 wrappingKey];
  id v10 = [v5 custodianUUID];
  int v11 = (void *)[v7 initWithWrappedKey:v8 wrappingKey:v9 uuid:v10 error:a4];

  return v11;
}

- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [[CDPRecoveryKeyStatusProvider alloc] initWithContext:v6];
  if ([(CDPRecoveryKeyStatusProvider *)v7 idmsHasRK])
  {
    id v8 = [v6 cliqueConfiguration];
    if (v8)
    {
      id v26 = 0;
      int v9 = [(CDPRecoveryKeyStatusProvider *)v7 isRecoveryKeySetInOctagonWithError:&v26];
      id v10 = v26;
      if (v10)
      {
        int v11 = _CDPLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.4();
        }

        if (a4)
        {
          id v12 = v10;
LABEL_35:
          LOBYTE(v9) = 0;
          *a4 = v12;
LABEL_41:

          goto LABEL_42;
        }
LABEL_40:
        LOBYTE(v9) = 0;
        goto LABEL_41;
      }
      if ([(CDPCustodianRecoveryKeyController *)self _isSOSTrustAndSyncingEnabled])
      {
        if ([v6 isSOSCompatibilityOptInNeeded])
        {
          if ([(CDPCustodianRecoveryKeyController *)self _isInSOSCircleWithContext:v6])
          {
            id v25 = 0;
            char v14 = [(CDPRecoveryKeyStatusProvider *)v7 isRecoveryKeySetInSOSWithError:&v25];
            id v15 = v25;
            uint64_t v16 = _CDPLogSystem();
            uint64_t v17 = v16;
            if (v15)
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:]();
              }

              if (!a4)
              {
                LOBYTE(v9) = 0;
                goto LABEL_50;
              }
              id v18 = v15;
            }
            else
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
                -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:](v9, v14, v17);
              }

              LOBYTE(v9) = v9 & v14;
              if (!a4 || (v9 & 1) != 0) {
                goto LABEL_50;
              }
              _CDPStateError(-5317, 0);
              id v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            LOBYTE(v9) = 0;
            *a4 = v18;
LABEL_50:

            goto LABEL_41;
          }
          id v23 = _CDPLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2182AE000, v23, OS_LOG_TYPE_DEFAULT, "SOS Opt In is needed. First Resolve SOS Compat CFU", buf, 2u);
          }

          if (!a4) {
            goto LABEL_40;
          }
          uint64_t v22 = -5318;
LABEL_34:
          _CDPStateError(v22, 0);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        uint64_t v19 = _CDPLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v28 = 1;
          __int16 v29 = 1024;
          int v30 = v9;
          int v20 = "SOS Opt In is not needed, SOS RK status does not matter. idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d";
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v19 = _CDPLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v28 = 1;
          __int16 v29 = 1024;
          int v30 = v9;
          int v20 = "SOS trust and syncing is not enabled. idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d";
LABEL_28:
          _os_log_impl(&dword_2182AE000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xEu);
        }
      }

      if (a4) {
        char v21 = v9;
      }
      else {
        char v21 = 1;
      }
      if (v21) {
        goto LABEL_41;
      }
      uint64_t v22 = -5317;
      goto LABEL_34;
    }
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:]();
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5217, *a4);
      LOBYTE(v9) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPCustodianRecoveryKeyController verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:].cold.5();
    }
    LOBYTE(v9) = 1;
  }
LABEL_42:

  return v9;
}

- (BOOL)_isSOSTrustAndSyncingEnabled
{
  return MEMORY[0x270EFD430](self, a2);
}

- (BOOL)_isInSOSCircleWithContext:(id)a3
{
  id v3 = [a3 altDSID];
  BOOL v4 = +[CDPSOSCircleProxyImpl syncingStatusForAltDSID:v3] == 1;

  return v4;
}

- (void)checkCustodianRecoveryKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void, void *))a5;
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:]();
  }

  int v11 = [v8 dsid];
  if (v11)
  {
  }
  else
  {
    id v12 = [v8 altDSID];

    if (!v12)
    {
      uint64_t v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:]();
      }

      id v13 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
      v9[2](v9, 0, v13);
      goto LABEL_14;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v8 cliqueConfiguration];
    char v14 = (void *)MEMORY[0x263F16D30];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke;
    v17[3] = &unk_2643171D0;
    id v18 = v9;
    [v14 checkCustodianRecoveryKey:v13 custodianRecoveryKeyUUID:v7 reply:v17];

LABEL_14:
    goto LABEL_15;
  }
  id v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CDPCustodianRecoveryKeyController checkCustodianRecoveryKey:withContext:completion:]();
  }

  v9[2](v9, 0, 0);
LABEL_15:
}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_1(a2, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createRecoveryKeyWithContext:forUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_2182AE000, v0, v1, "CDPCustodianController init is missing required dsid. Unable to process request, problems lie ahead …", v2, v3, v4, v5, v6);
}

void __85__CDPCustodianRecoveryKeyController_createRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error creating custodian recovery key: %@", v2, v3, v4, v5, v6);
}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__CDPCustodianRecoveryKeyController_deleteRecoveryKeyWithContext_forUUID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error deleting custodian recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)validateRecoveryKey:withContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_2182AE000, v0, v1, "CDPCustodianController init is missing required dsid. Unable to process preflight request", v2, v3, v4, v5, v6);
}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) custodianUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Custodian recovery key is valid for: %@", v4, v5, v6, v7, v8);
}

void __80__CDPCustodianRecoveryKeyController_validateRecoveryKey_withContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error validating custodian recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)recoverOctagonUsingCustodianInfo:withContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_2182AE000, v0, v1, "CDPCustodianController init is missing required dsid. Unable to process recovery request", v2, v3, v4, v5, v6);
}

- (void)_initializeRecoveryKeyWithInfo:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v1 = [a1 custodianUUID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Obtaining recovery key from security for custodian recovery with UUID: %@", v4, v5, v6, v7, v8);
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "CDPContext cliqueConfiguration returned nil. Cannot check if RK state matches across systems.", v1, 2u);
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(os_log_t)log error:.cold.2(char a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109632;
  v3[1] = 1;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "idMSHasRK=%{BOOL}d, rkSetInOctagon=%{BOOL}d, rkSetInSOS=%{BOOL}d", (uint8_t *)v3, 0x14u);
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Received error while checking if RK is set in SOS: %{public}@", v2, v3, v4, v5, v6);
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Received error while checking if RK is set in Octagon: %{public}@", v2, v3, v4, v5, v6);
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Early exit, since idms does not have a verifier", v2, v3, v4, v5, v6);
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_2182AE000, v0, v1, "CDPCustodianController init is missing required dsid. Unable to process check Custodian Recovery Key", v2, v3, v4, v5, v6);
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "OTClique does not respond to selector checkCustodianRecoveryKey:custodianRecoveryKeyUUID:reply:", v2, v3, v4, v5, v6);
}

- (void)checkCustodianRecoveryKey:withContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Checking if CRK exists in Octagon...", v2, v3, v4, v5, v6);
}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Custodian recovery key exists: %{BOOL}d", (uint8_t *)v2, 8u);
}

void __86__CDPCustodianRecoveryKeyController_checkCustodianRecoveryKey_withContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error while checking if custodian recovery key is present: %{public}@", v2, v3, v4, v5, v6);
}

@end