@interface CDPProtectedCloudStorageProxyImpl
- (BOOL)_performPCSBlock:(id)a3 error:(id *)a4;
- (BOOL)isWalrusEnabledWithOptions:(id)a3 error:(id *)a4;
- (BOOL)pcsIdentityMigrateToiCDPWithInfo:(id)a3 error:(id *)a4;
- (BOOL)pcsIdentitySetCompanionInCircle:(_PCSIdentitySetData *)a3 error:(id *)a4;
- (BOOL)pcsIdentitySetIsInICDPLocal:(_PCSIdentitySetData *)a3 error:(id *)a4;
- (BOOL)pcsIdentitySetIsInICDPNetwork:(_PCSIdentitySetData *)a3 options:(id)a4 error:(id *)a5;
- (BOOL)pcsRestoreLocalBackup:(id)a3 error:(id *)a4;
- (BOOL)pcsSynchronizeKeysWithInfo:(id)a3 error:(id *)a4;
- (BOOL)repairWalrusWithAccountIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)setWalrusEnabled:(BOOL)a3 accountIdentifier:(id)a4 options:(id)a5 error:(id *)a6;
- (_PCSIdentitySetData)pcsIdentityCreateWithInfo:(id)a3 error:(id *)a4;
- (_PCSIdentitySetData)pcsIdentitySetupWithInfo:(id)a3 error:(id *)a4;
- (void)edpPCSGuitarfishChangePassword:(id)a3 completion:(id)a4;
- (void)edpPCSGuitarfishGetRecoveryTokenInfo:(id)a3 completion:(id)a4;
- (void)edpPCSGuitarfishRepairIdentities:(id)a3 completion:(id)a4;
- (void)edpPCSGuitarfishSetupIdentities:(id)a3 completion:(id)a4;
- (void)edpPCSGuitarfishValidateIdentities:(id)a3 completion:(id)a4;
- (void)edpPCSResetProtectedData:(id)a3 completion:(id)a4;
@end

@implementation CDPProtectedCloudStorageProxyImpl

- (BOOL)pcsIdentitySetCompanionInCircle:(_PCSIdentitySetData *)a3 error:(id *)a4
{
  if (+[CDPUtilities hasFullCDPSupport]) {
    return 0;
  }
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "setting companion in circle", buf, 2u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetCompanionInCircle_error___block_invoke;
  v9[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
  v9[4] = a3;
  return [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v9 error:a4];
}

uint64_t __75__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetCompanionInCircle_error___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F584A0](*(void *)(a1 + 32));
}

- (_PCSIdentitySetData)pcsIdentityCreateWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CDPProtectedCloudStorageProxyImpl_pcsIdentityCreateWithInfo_error___block_invoke;
  v10[3] = &unk_264316B40;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v10 error:a4];
  v8 = (_PCSIdentitySetData *)v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __69__CDPProtectedCloudStorageProxyImpl_pcsIdentityCreateWithInfo_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = PCSIdentitySetCreate();
  return 1;
}

- (BOOL)pcsIdentitySetIsInICDPNetwork:(_PCSIdentitySetData *)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPNetwork_options_error___block_invoke;
  v11[3] = &unk_264316B68;
  id v12 = v8;
  uint64_t v13 = a3;
  id v9 = v8;
  LOBYTE(a5) = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v11 error:a5];

  return (char)a5;
}

uint64_t __81__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPNetwork_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F584D0](*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (BOOL)pcsIdentitySetIsInICDPLocal:(_PCSIdentitySetData *)a3 error:(id *)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPLocal_error___block_invoke;
  v5[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
  v5[4] = a3;
  return [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v5 error:a4];
}

uint64_t __71__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetIsInICDPLocal_error___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F584C0](*(void *)(a1 + 32));
}

- (_PCSIdentitySetData)pcsIdentitySetupWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport])
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "pcsIdentitySetupWithInfo:", buf, 2u);
    }

    *(void *)buf = 0;
    v14 = buf;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetupWithInfo_error___block_invoke;
    v10[3] = &unk_264316B40;
    id v12 = buf;
    id v11 = v6;
    [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v10 error:a4];
    id v8 = (_PCSIdentitySetData *)*((void *)v14 + 3);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __68__CDPProtectedCloudStorageProxyImpl_pcsIdentitySetupWithInfo_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = PCSIdentitySetup();
  return 1;
}

- (BOOL)pcsIdentityMigrateToiCDPWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport])
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "pcsIdentityMigrateToiCDPWithInfo:", buf, 2u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__CDPProtectedCloudStorageProxyImpl_pcsIdentityMigrateToiCDPWithInfo_error___block_invoke;
    v10[3] = &unk_264316B90;
    id v11 = v6;
    BOOL v8 = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v10 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __76__CDPProtectedCloudStorageProxyImpl_pcsIdentityMigrateToiCDPWithInfo_error___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F58498](*(void *)(a1 + 32));
}

- (BOOL)pcsSynchronizeKeysWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport])
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "pcsSynchronizeKeysWithInfo:", buf, 2u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__CDPProtectedCloudStorageProxyImpl_pcsSynchronizeKeysWithInfo_error___block_invoke;
    v10[3] = &unk_264316B90;
    id v11 = v6;
    BOOL v8 = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v10 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __70__CDPProtectedCloudStorageProxyImpl_pcsSynchronizeKeysWithInfo_error___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F584E0](*(void *)(a1 + 32));
}

- (BOOL)pcsRestoreLocalBackup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[CDPUtilities hasFullCDPSupport])
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "pcsRestoreLocalBackup:", buf, 2u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__CDPProtectedCloudStorageProxyImpl_pcsRestoreLocalBackup_error___block_invoke;
    v10[3] = &unk_264316B90;
    id v11 = v6;
    BOOL v8 = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v10 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __65__CDPProtectedCloudStorageProxyImpl_pcsRestoreLocalBackup_error___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F58490](*(void *)(a1 + 32));
}

- (BOOL)isWalrusEnabledWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CDPProtectedCloudStorageProxyImpl *)self pcsIdentityCreateWithInfo:v6 error:a4];
  if (*a4)
  {
    BOOL v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPProtectedCloudStorageProxyImpl isWalrusEnabledWithOptions:error:](a4);
    }
    BOOL v9 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__CDPProtectedCloudStorageProxyImpl_isWalrusEnabledWithOptions_error___block_invoke;
    v11[3] = &unk_264316B68;
    uint64_t v13 = v7;
    id v12 = v6;
    BOOL v9 = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v11 error:a4];
    BOOL v8 = v12;
  }

  return v9;
}

uint64_t __70__CDPProtectedCloudStorageProxyImpl_isWalrusEnabledWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = PCSIdentityiCDPWalrus();
  v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  return v2;
}

- (BOOL)repairWalrusWithAccountIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(CDPProtectedCloudStorageProxyImpl *)self pcsIdentityCreateWithInfo:v9 error:a5];
  if (!*a5)
  {
    uint64_t v13 = v10;
    if (![(CDPProtectedCloudStorageProxyImpl *)self isWalrusEnabledWithOptions:v9 error:a5])goto LABEL_14; {
    v25[0] = MEMORY[0x263EF8330];
    }
    v25[1] = 3221225472;
    v25[2] = __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke;
    v25[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    v25[4] = v13;
    BOOL v14 = [(CDPProtectedCloudStorageProxyImpl *)self _performPCSBlock:v25 error:a5];
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CDPProtectedCloudStorageProxyImpl repairWalrusWithAccountIdentifier:options:error:](v14, v15);
    }

    if (!v14)
    {
LABEL_14:
      BOOL v12 = 1;
      if (!v13) {
        goto LABEL_16;
      }
LABEL_15:
      CFRelease(v13);
      goto LABEL_16;
    }
    uint64_t v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CDPProtectedCloudStorageProxyImpl repairWalrusWithAccountIdentifier:options:error:](v16);
    }

    [(CDPProtectedCloudStorageProxyImpl *)self setWalrusEnabled:1 accountIdentifier:v8 options:v9 error:a5];
    id v17 = *a5;
    BOOL v12 = *a5 == 0;
    v18 = _CDPLogSystem();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (!v19) {
        goto LABEL_20;
      }
      id v20 = *a5;
      *(_DWORD *)buf = 138412290;
      id v27 = v20;
      v21 = "Walrus repair failed: %@";
      v22 = v18;
      uint32_t v23 = 12;
    }
    else
    {
      if (!v19) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v21 = "Walrus repair succeeded";
      v22 = v18;
      uint32_t v23 = 2;
    }
    _os_log_impl(&dword_2182AE000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_20:

    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CDPProtectedCloudStorageProxyImpl isWalrusEnabledWithOptions:error:](a5);
  }

  BOOL v12 = 0;
LABEL_16:

  return v12;
}

uint64_t __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr;
  id v11 = getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr;
  if (!getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_block_invoke;
    v7[3] = &unk_264316C58;
    v7[4] = &v8;
    __getPCSIdentitySetIsWalrusWithForceFetchSymbolLoc_block_invoke((uint64_t)v7);
    v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    id v6 = (_Unwind_Exception *)__85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  return v4(v3, 1, a2);
}

- (BOOL)setWalrusEnabled:(BOOL)a3 accountIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = _CDPSignpostLogSystem();
  os_signpost_id_t v12 = _CDPSignpostCreate(v11);
  uint64_t v14 = v13;

  uint64_t v15 = _CDPSignpostLogSystem();
  uint64_t v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UpdateAccountCleanupStatus", " enableTelemetry=YES ", buf, 2u);
  }

  id v17 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v34 = v12;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateAccountCleanupStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  if (v8)
  {
    uint64_t v32 = 0;
    v18 = (id *)&v32;
    char v19 = PCSAccountEnableWalrus();
  }
  else
  {
    uint64_t v31 = 0;
    v18 = (id *)&v31;
    char v19 = PCSAccountDisableWalrus();
  }
  BOOL v20 = v19;
  id v21 = *v18;
  v22 = v21;
  if (a6) {
    *a6 = v21;
  }
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v12, v14);
  v24 = _CDPSignpostLogSystem();
  v25 = v24;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    int v26 = [v22 code];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v34 = v8;
    *(_WORD *)&v34[4] = 1026;
    *(_DWORD *)&v34[6] = v26;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v25, OS_SIGNPOST_INTERVAL_END, v12, "UpdateAccountCleanupStatus", " isEnabled=%{public,signpost.telemetry:number1,name=isEnabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  id v27 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = [v22 code];
    *(_DWORD *)buf = 134218752;
    *(void *)v34 = v12;
    *(_WORD *)&v34[8] = 2048;
    double v35 = (double)Nanoseconds / 1000000000.0;
    __int16 v36 = 1026;
    BOOL v37 = v8;
    __int16 v38 = 1026;
    int v39 = v28;
    _os_log_impl(&dword_2182AE000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateAccountCleanupStatus  isEnabled=%{public,signpost.telemetry:number1,name=isEnabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if (!v20)
  {
    v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CDPProtectedCloudStorageProxyImpl setWalrusEnabled:accountIdentifier:options:error:]((uint64_t)v22, v29);
    }
  }
  return v20;
}

- (void)edpPCSGuitarfishSetupIdentities:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishSetup", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishSetup  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v13 = v5;
  id v12 = v5;
  PCSGuitarfishSetupIdentities();
}

void __80__CDPProtectedCloudStorageProxyImpl_edpPCSGuitarfishSetupIdentities_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  id v11 = _CDPSignpostLogSystem();
  id v12 = v11;
  os_signpost_id_t v13 = a1[5];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v19 = 67240192;
    LODWORD(v20) = [v9 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v12, OS_SIGNPOST_INTERVAL_END, v13, "GuitarfishSetup", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  uint64_t v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[5];
    int v17 = [v9 code];
    int v19 = 134218496;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    double v22 = v15;
    __int16 v23 = 1026;
    int v24 = v17;
    _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishSetup  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  uint64_t v18 = a1[4];
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v18 + 16))(v18, a2, v8, v9);
  }
}

- (void)edpPCSGuitarfishValidateIdentities:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishValidate", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishValidate  enableTelemetry=YES ", buf, 0xCu);
  }

  os_signpost_id_t v13 = v5;
  id v12 = v5;
  PCSGuitarfishValidateIdentities();
}

void __83__CDPProtectedCloudStorageProxyImpl_edpPCSGuitarfishValidateIdentities_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  id v12 = _CDPSignpostLogSystem();
  os_signpost_id_t v13 = v12;
  os_signpost_id_t v14 = a1[5];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v20 = 67240192;
    LODWORD(v21) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_END, v14, "GuitarfishValidate", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  os_signpost_id_t v15 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = (double)Nanoseconds / 1000000000.0;
    uint64_t v17 = a1[5];
    int v18 = [v10 code];
    int v20 = 134218496;
    uint64_t v21 = v17;
    __int16 v22 = 2048;
    double v23 = v16;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishValidate  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  uint64_t v19 = a1[4];
  if (v19) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v19 + 16))(v19, a2, a3, v9, v10);
  }
}

- (void)edpPCSGuitarfishRepairIdentities:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishRepair", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishRepair  enableTelemetry=YES ", buf, 0xCu);
  }

  os_signpost_id_t v13 = v5;
  id v12 = v5;
  PCSGuitarfishRepairIdentities();
}

void __81__CDPProtectedCloudStorageProxyImpl_edpPCSGuitarfishRepairIdentities_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "cdp_indicatesEDPRecoveryTokenIsNeeded");
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GuitarfishRepair", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  id v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    uint64_t v14 = a1[5];
    int v15 = [v6 code];
    int v17 = 134218496;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishRepair  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v7, v6);
  }
}

- (void)edpPCSGuitarfishGetRecoveryTokenInfo:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishGetRecoveryTokenInfo", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishGetRecoveryTokenInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  double v13 = v5;
  id v12 = v5;
  PCSGuitarfishGetRecoveryTokenInfo();
}

void __85__CDPProtectedCloudStorageProxyImpl_edpPCSGuitarfishGetRecoveryTokenInfo_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v14 = _CDPSignpostLogSystem();
  os_signpost_id_t v15 = v14;
  os_signpost_id_t v16 = a1[5];
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v22 = 67240192;
    LODWORD(v23) = [v12 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v15, OS_SIGNPOST_INTERVAL_END, v16, "GuitarfishGetRecoveryTokenInfo", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 8u);
  }

  int v17 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = (double)Nanoseconds / 1000000000.0;
    uint64_t v19 = a1[5];
    int v20 = [v12 code];
    int v22 = 134218496;
    uint64_t v23 = v19;
    __int16 v24 = 2048;
    double v25 = v18;
    __int16 v26 = 1026;
    int v27 = v20;
    _os_log_impl(&dword_2182AE000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishGetRecoveryTokenInfo  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
  }

  uint64_t v21 = a1[4];
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, id, id, id))(v21 + 16))(v21, a2, v10, v11, v12);
  }
}

- (void)edpPCSGuitarfishChangePassword:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishChangePassword", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishChangePassword  enableTelemetry=YES ", buf, 0xCu);
  }

  double v13 = v5;
  id v12 = v5;
  PCSGuitarfishChangePassword();
}

void __79__CDPProtectedCloudStorageProxyImpl_edpPCSGuitarfishChangePassword_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v17 = 67240192;
    LODWORD(v18) = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GuitarfishChangePassword", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  id v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    uint64_t v14 = a1[5];
    int v15 = [v7 code];
    int v17 = 134218496;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishChangePassword  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v16 + 16))(v16, a2, a3, v7);
  }
}

- (void)edpPCSResetProtectedData:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate(v7);

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GuitarfishResetProtectedData", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v15 = v8;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GuitarfishResetProtectedData  enableTelemetry=YES ", buf, 0xCu);
  }

  double v13 = v5;
  id v12 = v5;
  PCSGuitarfishResetProtectedData();
}

void __73__CDPProtectedCloudStorageProxyImpl_edpPCSResetProtectedData_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  id v12 = _CDPSignpostLogSystem();
  double v13 = v12;
  os_signpost_id_t v14 = a1[5];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v20 = 67240192;
    LODWORD(v21) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v13, OS_SIGNPOST_INTERVAL_END, v14, "GuitarfishResetProtectedData", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  os_signpost_id_t v15 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = (double)Nanoseconds / 1000000000.0;
    uint64_t v17 = a1[5];
    int v18 = [v10 code];
    int v20 = 134218496;
    uint64_t v21 = v17;
    __int16 v22 = 2048;
    double v23 = v16;
    __int16 v24 = 1026;
    int v25 = v18;
    _os_log_impl(&dword_2182AE000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GuitarfishResetProtectedData  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  uint64_t v19 = a1[4];
  if (v19) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v19 + 16))(v19, a2, a3, v9, v10);
  }
}

- (BOOL)_performPCSBlock:(id)a3 error:(id *)a4
{
  id v7 = 0;
  char v5 = (*((uint64_t (**)(id, id *))a3 + 2))(a3, &v7);
  if (a4)
  {
    *a4 = v7;
  }
  else if (v7)
  {
    CFRelease(v7);
  }
  return v5;
}

- (void)isWalrusEnabledWithOptions:(id *)a1 error:.cold.1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_0(&dword_2182AE000, v2, v3, "Failed to create PCS identity with error: %@", v4, v5, v6, v7, 2u);
}

- (void)repairWalrusWithAccountIdentifier:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Trying repair", v1, 2u);
}

- (void)repairWalrusWithAccountIdentifier:(char)a1 options:(NSObject *)a2 error:.cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Walrus state after repair attempt - %i", (uint8_t *)v2, 8u);
}

uint64_t __85__CDPProtectedCloudStorageProxyImpl_repairWalrusWithAccountIdentifier_options_error___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[CDPProtectedCloudStorageProxyImpl setWalrusEnabled:accountIdentifier:options:error:](v0);
}

- (void)setWalrusEnabled:(uint64_t)a1 accountIdentifier:(NSObject *)a2 options:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Walrus update failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end