@interface ACAccountStore
@end

@implementation ACAccountStore

void __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "aaf_firstObjectPassingTest:", &__block_literal_global_28_0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__ACAccountStore_AppleAccount__aa_primaryAppleAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", @"primary");
}

uint64_t __56__ACAccountStore_AppleAccount__aa_dataSeparatedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDataSeparatedAccount];
}

uint64_t __59__ACAccountStore_AppleAccount__aa_accountsForAccountClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *(void *)(a1 + 32));
}

uint64_t __78__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithPreloadedDataclasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", @"primary");
}

uint64_t __69__ACAccountStore_AppleAccount__aa_primaryAppleAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", @"primary");
}

uint64_t __60__ACAccountStore_AppleAccount__aa_appleAccountWithUsername___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 username];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = objc_msgSend(v3, "aa_appleIDAliases");
    uint64_t v5 = [v6 containsObject:*(void *)(a1 + 32)];
  }
  return v5;
}

BOOL __60__ACAccountStore_AppleAccount__aa_appleAccountWithPersonID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "aa_personID");
  BOOL v4 = 1;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [v3 longLongValue] < 1
      || (uint64_t v5 = [v3 longLongValue], v5 != objc_msgSend(*(id *)(a1 + 32), "longLongValue")))
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

uint64_t __59__ACAccountStore_AppleAccount__aa_appleAccountWithAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "aa_altDSID");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __97__ACAccountStore_AppleAccount__aa_updatePropertiesForAppleAccount_options_serverInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2 == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.appleaccount" code:-1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _performUpdateRequestWithAccount:*(void *)(a1 + 40) serverInfo:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

void __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  v9 = _AASignpostLogSystem();
  v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = _AAErrorUnderlyingError(v7);
    *(_DWORD *)buf = 67240192;
    LODWORD(v25) = [v12 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GetAccountSettings", " error=%{public,signpost.telemetry:number2,name=error}d ", buf, 8u);
  }
  v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)Nanoseconds / 1000000000.0;
    uint64_t v15 = *(void *)(a1 + 48);
    v16 = _AAErrorUnderlyingError(v7);
    int v17 = [v16 code];
    *(_DWORD *)buf = 134218496;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    double v27 = v14;
    __int16 v28 = 1026;
    int v29 = v17;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GetAccountSettings  error=%{public,signpost.telemetry:number2,name=error}d ", buf, 0x1Cu);
  }
  v18 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_37;
  block[3] = &unk_1E5A484C0;
  id v21 = v6;
  id v22 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  id v19 = v6;
  dispatch_async(v18, block);
}

void __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_37(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = [v3 error];
    uint64_t v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"localizedError"];
    int v7 = [v6 isEqualToString:@"MOBILEME_TERMS_OF_SERVICE_UPDATE"];

    if (v7)
    {
      v8 = _AALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v9;
        _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Looks like we need to verify terms for account: %@", buf, 0xCu);
      }

      if (!objc_msgSend(*(id *)(a1 + 40), "aa_needsToVerifyTerms"))
      {
        objc_msgSend(*(id *)(a1 + 40), "aa_setNeedsToVerifyTerms:", 1);
        goto LABEL_21;
      }
      v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Checking if we need to repost the CFU", buf, 2u);
      }

      os_signpost_id_t v11 = objc_opt_new();
      v12 = AAFollowUpIdentifierVerifyTerms[0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_39;
      v22[3] = &unk_1E5A4A148;
      id v23 = v11;
      id v24 = *(id *)(a1 + 40);
      id v13 = v11;
      [v13 pendingFollowUpWithIdentifier:v12 completion:v22];
    }
    else
    {
      uint64_t v15 = [v4 userInfo];
      v16 = [v15 objectForKeyedSubscript:@"localizedError"];
      int v17 = [v16 isEqualToString:@"ACCOUNT_IN_SUSPENDED_MODE"];

      if (!v17)
      {
        if (!v4) {
          objc_msgSend(*(id *)(a1 + 40), "aa_updateWithProvisioningResponse:", v3);
        }
        goto LABEL_21;
      }
      id v19 = _AALogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v20;
        _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Looks like account: %@ is suspended.", buf, 0xCu);
      }

      id v21 = [*(id *)(a1 + 32) responseDictionary];
      id v13 = [v21 objectForKeyedSubscript:@"userInfo"];

      if (v13) {
        [*(id *)(a1 + 40) setAccountProperty:v13 forKey:@"suspendedInfo"];
      }
    }

LABEL_21:
    (*(void (**)(void, BOOL, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4 == 0, v4, v18);

    return;
  }
  double v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v14();
}

void __87__ACAccountStore_AppleAccount___performUpdateRequestWithAccount_serverInfo_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _AALogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "CFU already posted", v6, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Reposting the CFU", buf, 2u);
    }

    [*(id *)(a1 + 32) postFollowUpWithIdentifier:AAFollowUpIdentifierVerifyTerms[0] forAccount:*(void *)(a1 + 40) userInfo:0 completion:0];
  }
}

void __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [v8 error];
  }
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  int v11 = !v10;
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = @"YES";
    if (v11) {
      id v13 = @"NO";
    }
    int v19 = 138412290;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "AppleAccount Authenticated: %@", (uint8_t *)&v19, 0xCu);
  }

  if (v11)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v14 = [v8 convertToProvisioningResponse];
    uint64_t v15 = [v14 responseDictionary];

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v14);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v16 = _AALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke_cold_1(v8, v16);
      }

      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -3);
      (*(void (**)(uint64_t, void, id, void *))(v17 + 16))(v17, 0, v8, v18);
    }
  }
}

uint64_t __71__ACAccountStore_AppleAccount__aa_registerAppleAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__ACAccountStore_AppleAccount__aa_authKitAccountForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "aa_altDSID");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __93__ACAccountStore_AppleAccount__aa_loginAndUpdateiCloudAccount_delegateParams_withCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 responseDictionary];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_fault_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_FAULT, "Cannot convert AALoginAccountResponse to AAProvisioningResponse: %@", (uint8_t *)&v4, 0xCu);
}

@end