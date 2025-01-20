@interface AAAcceptedTermsController
- (BOOL)_shouldRecordTermsForBuddyWithTermsInfo:(id)a3;
- (void)_recordTermsForBuddyWithTermsInfo:(id)a3;
- (void)_repairTermsBackup:(id)a3 forAccount:(id)a4;
- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4;
- (void)saveTermsAcceptance:(id)a3 forAccount:(id)a4;
@end

@implementation AAAcceptedTermsController

- (void)saveTermsAcceptance:(id)a3 forAccount:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _AASignpostLogSystem();
  os_signpost_id_t v9 = _AASignpostCreate(v8);
  uint64_t v11 = v10;

  v12 = _AASignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecordTerms", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v24 = v9;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecordTerms  enableTelemetry=YES ", buf, 0xCu);
  }

  if ([(AAAcceptedTermsController *)self _shouldRecordTermsForBuddyWithTermsInfo:v6])
  {
    [(AAAcceptedTermsController *)self _recordTermsForBuddyWithTermsInfo:v6];
  }
  objc_msgSend(v7, "_aa_setLastAgreedTermsInfo:", v6);
  objc_msgSend(v7, "aa_setNeedsToVerifyTerms:", 0);
  int v15 = objc_msgSend(v7, "aa_isAccountClass:", @"primary");

  if (v15)
  {
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v24 = (os_signpost_id_t)v6;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Saving terms acceptance: %@", buf, 0xCu);
    }

    v17 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__AAAcceptedTermsController_saveTermsAcceptance_forAccount___block_invoke;
    v22[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
    v22[4] = v9;
    v22[5] = v11;
    [v17 saveTermsAcceptance:v6 completion:v22];
  }
  else
  {
    unint64_t Nanoseconds = _AASignpostGetNanoseconds(v9, v11);
    v19 = _AASignpostLogSystem();
    v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v20, OS_SIGNPOST_INTERVAL_END, v9, "RecordTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
    }

    v21 = _AASignpostLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      os_signpost_id_t v24 = v9;
      __int16 v25 = 2048;
      double v26 = (double)Nanoseconds / 1000000000.0;
      __int16 v27 = 1026;
      int v28 = 0;
      _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecordTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
    }

    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Account is not primary, skip terms save.", buf, 2u);
    }
  }
}

void __60__AAAcceptedTermsController_saveTermsAcceptance_forAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 32), *(void *)(a1 + 40));
  v5 = _AASignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 32);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v12 = 67240192;
    LODWORD(v13) = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecordTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v12, 8u);
  }

  v8 = _AASignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v9 = *(void **)(a1 + 32);
    int v10 = [v3 code];
    int v12 = 134218496;
    id v13 = v9;
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 1026;
    int v17 = v10;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecordTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v12, 0x1Cu);
  }

  uint64_t v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Save terms acceptance completed with error: %@", (uint8_t *)&v12, 0xCu);
  }
}

- (BOOL)_shouldRecordTermsForBuddyWithTermsInfo:(id)a3
{
  id v3 = [a3 objectForKey:@"proxiedcontext"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "aa_isAccountClass:", @"primary"))
  {
    v8 = _AASignpostLogSystem();
    os_signpost_id_t v9 = _AASignpostCreate(v8);
    uint64_t v11 = v10;

    int v12 = _AASignpostLogSystem();
    id v13 = v12;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchTerms", " enableTelemetry=YES ", buf, 2u);
    }

    __int16 v14 = _AASignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v31 = v9;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchTerms  enableTelemetry=YES ", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke;
    v24[3] = &unk_1E5A49BA8;
    id v15 = v6;
    id v25 = v15;
    double v26 = self;
    os_signpost_id_t v28 = v9;
    uint64_t v29 = v11;
    id v27 = v7;
    __int16 v16 = (void *)MEMORY[0x1A622F430](v24);
    id v17 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke_46;
    v22[3] = &unk_1E5A49BD0;
    id v23 = v16;
    id v18 = v16;
    [v17 fetchTermsAcceptanceForAccount:v15 completion:v22];

    v19 = v25;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Terms acceptance not available for non-primary AppleAccount";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v21 = objc_msgSend(v20, "aa_errorWithCode:userInfo:", -15, v19);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v21);
  }
}

void __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "aa_lastAgreedTermsInfo");
  v8 = (void *)v7;
  if (v5 || !v7)
  {
    unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
    __int16 v16 = _AASignpostLogSystem();
    id v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 56);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v22 = 67240192;
      LODWORD(v23) = [v6 code];
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v17, OS_SIGNPOST_INTERVAL_END, v18, "FetchTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 8u);
    }

    __int16 v14 = _AASignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = (double)Nanoseconds / 1000000000.0;
      v20 = *(void **)(a1 + 56);
      int v21 = [v6 code];
      int v22 = 134218496;
      id v23 = v20;
      __int16 v24 = 2048;
      double v25 = v19;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    os_signpost_id_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Terms info is missing in SecureBackup. Providing ACAccount result: %@", (uint8_t *)&v22, 0xCu);
    }

    [*(id *)(a1 + 40) _repairTermsBackup:v8 forAccount:*(void *)(a1 + 32)];
    unint64_t v10 = _AASignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
    uint64_t v11 = _AASignpostLogSystem();
    int v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v22 = 67240192;
      LODWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchTerms", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 8u);
    }

    __int16 v14 = _AASignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      id v23 = *(void **)(a1 + 56);
      __int16 v24 = 2048;
      double v25 = (double)v10 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTerms  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__AAAcceptedTermsController_fetchTermsAcceptanceForAccount_completion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Fetched terms from SecureBackup with error %@ and result: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_recordTermsForBuddyWithTermsInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 objectForKeyedSubscript:@"SLAVersion"];
  id v5 = [v3 objectForKeyedSubscript:@"ioswarrantyVersion"];
  if (v4)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v4 unsignedIntValue];
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Found device terms version %u in termsInfo. Updating local license agreement status.", buf, 8u);
    }

    uint64_t v12 = 0;
    os_signpost_id_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    uint64_t v7 = (void *)getBYLicenseAgreementClass_softClass;
    uint64_t v15 = getBYLicenseAgreementClass_softClass;
    if (!getBYLicenseAgreementClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      os_signpost_id_t v18 = __getBYLicenseAgreementClass_block_invoke;
      double v19 = &unk_1E5A48F98;
      v20 = &v12;
      __getBYLicenseAgreementClass_block_invoke((uint64_t)buf);
      uint64_t v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v8, "recordUserAcceptedAgreementVersion:", objc_msgSend(v4, "unsignedIntValue", v12));
  }
  if (v5)
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Found device warranty agreement in termsInfo. Updating local warranty agreement status.", buf, 2u);
    }

    uint64_t v12 = 0;
    os_signpost_id_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    __int16 v10 = (void *)getBYWarrantyClass_softClass;
    uint64_t v15 = getBYWarrantyClass_softClass;
    if (!getBYWarrantyClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      os_signpost_id_t v18 = __getBYWarrantyClass_block_invoke;
      double v19 = &unk_1E5A48F98;
      v20 = &v12;
      __getBYWarrantyClass_block_invoke((uint64_t)buf);
      __int16 v10 = (void *)v13[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v11, "acknowledge", v12);
  }
}

- (void)_repairTermsBackup:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F179C8];
  id v7 = a4;
  id v8 = [v6 defaultStore];
  id v9 = objc_msgSend(v7, "aa_altDSID");

  __int16 v10 = objc_msgSend(v8, "aa_appleAccountWithAltDSID:", v9);

  id v11 = _AALogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Account exists on disk. Proceeding with repair.", buf, 2u);
    }

    id v11 = objc_alloc_init((Class)getCDPTermsInfoBackupControllerClass());
    [v11 saveTermsAcceptance:v5 completion:&__block_literal_global_16];
  }
  else if (v12)
  {
    *(_WORD *)os_signpost_id_t v13 = 0;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Account does not exist on disk yet. Skipping repair.", v13, 2u);
  }
}

void __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AALogSystem();
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Successfully fixed terms info in secure backup.", v5, 2u);
  }
}

void __59__AAAcceptedTermsController__repairTermsBackup_forAccount___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Fixing terms info failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end