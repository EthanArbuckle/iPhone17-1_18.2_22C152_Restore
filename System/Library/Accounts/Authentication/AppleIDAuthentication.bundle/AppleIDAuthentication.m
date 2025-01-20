uint64_t sub_2404E0900(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = [a2 objectForKey:@"date-last-modified"];
  v6 = [v4 objectForKey:@"date-last-modified"];

  v7 = [v5 compare:v6];
  return v7;
}

void sub_2404E10C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404E10E4(uint64_t a1)
{
  v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2404DE000, v2, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v3, 2u);
  }

  [*(id *)(a1 + 32) cancelAllOperations];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_2404E1160(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 error];
  if (!v3)
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      v7 = "Something went wrong and we couldn't contact the server. %@";
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  v5 = _AALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      v7 = "Got an error, may still be in Grey Mode. %@";
LABEL_7:
      _os_log_impl(&dword_2404DE000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v5, OS_LOG_TYPE_DEFAULT, "Server auth was successful, not in Grey Mode anymore", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v3);
  objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 0);
  uint64_t v9 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2404E1368;
  v12[3] = &unk_2650BB2D8;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v13 = v10;
  uint64_t v14 = v11;
  [v8 saveVerifiedAccount:v9 withCompletionHandler:v12];

LABEL_12:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_2404E1368(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "Failed to save account after marking it as not in grey mode anymore. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E1CDC(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2404DE000, v5, OS_LOG_TYPE_DEFAULT, "Account save failed: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t sub_2404E1E38()
{
  qword_26AFC5F10 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26F499EF8];
  return MEMORY[0x270F9A758]();
}

void sub_2404E238C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  uint64_t v8 = _AASignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v11 = _AAErrorUnderlyingError();
    int v17 = 67240192;
    LODWORD(v18) = [v11 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "DiscoverProperties", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = _AAErrorUnderlyingError();
    int v16 = [v15 code];
    int v17 = 134218496;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 1026;
    int v22 = v16;
    _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DiscoverProperties  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E2560(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AALogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_2404EA5F4();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_2404EA628();
  }

  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB340]];
  char v9 = [v8 BOOLValue];

  if (v9)
  {
    os_signpost_id_t v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_2404EA5C0();
    }

    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2404E26E8;
    v13[3] = &unk_2650BB390;
    id v16 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    id v15 = v5;
    [v11 saveVerifiedAccount:v12 withCompletionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2404E26E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AALogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_2404EA690();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_2404EA6C4();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_2404E2EAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2404E2EC8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  uint64_t v8 = _AASignpostLogSystem();
  char v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v11 = _AAErrorUnderlyingError();
    int v17 = 67240192;
    LODWORD(v18) = [v11 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VerifyCredentials", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = _AAErrorUnderlyingError();
    int v16 = [v15 code];
    int v17 = 134218496;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = v13;
    __int16 v21 = 1026;
    int v22 = v16;
    _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: VerifyCredentials  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2404E309C(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t sub_2404E30C0(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void sub_2404E32D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_2404DE000, v7, OS_LOG_TYPE_DEFAULT, "Oops, something went wrong with password-less auth! %@", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
    if (v8)
    {
      char v9 = _AALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v10 = [*(id *)(a1 + 40) username];
        int v15 = 138412290;
        id v16 = v10;
        _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, "Password-less auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:v8 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FB0]];
      uint64_t v12 = [v11 allKeys];

      if ([*(id *)(a1 + 56) count]
        && [v12 count]
        && objc_msgSend(*(id *)(a1 + 56), "aaf_isSubsetOfArray:", v12))
      {
        double v13 = _AALogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "Password-less auth returned all the requested tokens!", (uint8_t *)&v15, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        uint64_t v14 = _AALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2404DE000, v14, OS_LOG_TYPE_DEFAULT, "Password-less auth appeared to succeed, but auth results do not have a value for AKAuthenticationPasswordKey or AKAuthenticationIDMSTokenKey!", (uint8_t *)&v15, 2u);
        }

        [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void sub_2404E3854(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:a2 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "Both password-less and password auth have failed. Login has officially failed. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2404E3BE8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "Oops, something went wrong with password-based auth! %@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v7 = [a2 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_2404DE000, v8, OS_LOG_TYPE_DEFAULT, "Password-based auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_2404E42A4(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  int v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v18 = 67240448;
    *(_DWORD *)__int16 v19 = a2;
    *(_WORD *)&v19[4] = 1026;
    *(_DWORD *)&v19[6] = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LoginAndUpdateAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0xEu);
  }

  double v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v15 = *(void *)(a1 + 64);
    int v16 = [v7 code];
    int v18 = 134218752;
    *(void *)__int16 v19 = v15;
    *(_WORD *)&v19[8] = 2048;
    double v20 = v14;
    __int16 v21 = 1026;
    int v22 = a2;
    __int16 v23 = 1026;
    int v24 = v16;
    _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginAndUpdateAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x22u);
  }

  uint64_t v17 = [v8 convertToLoginDelegatesResponse];

  [*(id *)(a1 + 32) _handleDelegatesResponseForAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) response:v17 error:v7 handler:*(void *)(a1 + 56)];
}

void sub_2404E4480(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  id v8 = _AASignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v16 = 67240448;
    *(_DWORD *)uint64_t v17 = a2;
    *(_WORD *)&v17[4] = 1026;
    *(_DWORD *)&v17[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0xEu);
  }

  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v13 = *(void *)(a1 + 64);
    int v14 = [v6 code];
    int v16 = 134218752;
    *(void *)uint64_t v17 = v13;
    *(_WORD *)&v17[8] = 2048;
    double v18 = v12;
    __int16 v19 = 1026;
    int v20 = a2;
    __int16 v21 = 1026;
    int v22 = v14;
    _os_log_impl(&dword_2404DE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x22u);
  }

  uint64_t v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2404DE000, v15, OS_LOG_TYPE_DEFAULT, "Login succeeded! Fetching tokens...", (uint8_t *)&v16, 2u);
  }

  [*(id *)(a1 + 32) _fetchTokenForAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56)];
}

void sub_2404E4ACC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  id v7 = _AASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = _AAErrorUnderlyingError();
    int v16 = 67240192;
    LODWORD(v17) = [v10 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RenewCredentials", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }
  id v11 = _AASignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v13 = *(void *)(a1 + 72);
    int v14 = _AAErrorUnderlyingError();
    int v15 = [v14 code];
    int v16 = 134218496;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    double v19 = v12;
    __int16 v20 = 1026;
    int v21 = v15;
    _os_log_impl(&dword_2404DE000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RenewCredentials  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }
  if (a2 == 2) {
    [*(id *)(a1 + 32) _handleRenewFailure:v5 forAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_2404E4FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2404E5044;
  v6[3] = &unk_2650BB4F8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _beginPETBasedLoginWithAccount:v4 PET:a2 store:v5 completion:v6];
}

uint64_t sub_2404E5044(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E5068(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Exchanging raw password from companion for PET...", buf, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB380]];
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) username];
    id v8 = objc_msgSend(*(id *)(a1 + 48), "aa_altDSID");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2404E51E4;
    v9[3] = &unk_2650BB548;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    [v6 _convertPasswordToPETForAppleID:v7 altDSID:v8 password:v3 services:v5 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2404E51E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2404DE000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_2404E577C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2404E5798(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 56))
  {
    os_signpost_id_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, "Dismissing renew-credentials prompt.", (uint8_t *)&v21, 2u);
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  id v11 = *(void **)(*(void *)(a1 + 32) + 8);
  double v12 = [*(id *)(a1 + 40) identifier];
  [v11 removeObject:v12];

  if ((a2 & 1) == 0)
  {
    int v16 = _AALogSystem();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    uint64_t v17 = *(void **)(a1 + 40);
    int v21 = 138412546;
    id v22 = v17;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v18 = "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@";
    double v19 = v16;
    uint32_t v20 = 22;
LABEL_17:
    _os_log_impl(&dword_2404DE000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, v20);
    goto LABEL_18;
  }
  if (!v7)
  {
    int v16 = _AALogSystem();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v21) = 0;
    __int16 v18 = "ACRemoteDeviceProxy reports that renewCredentials succeeded, but no password is in the response!";
    double v19 = v16;
    uint32_t v20 = 2;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v7;
      __int16 v18 = "ACRemoteDeviceProxy reports that renewCredentials succeeded, but response is not a string! %@";
      double v19 = v16;
      uint32_t v20 = 12;
      goto LABEL_17;
    }
LABEL_18:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_19;
  }
  uint64_t v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = *(void **)(a1 + 40);
    int v21 = 138412290;
    id v22 = v14;
    _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "ACRemoteDeviceProxy successfully provided us with a password for %@", (uint8_t *)&v21, 0xCu);
  }

  id v15 = v7;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_19:
  objc_sync_exit(v10);
}

void sub_2404E5A68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2404E5F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404E5F2C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 && (a2 & 1) == 0)
  {
LABEL_3:
    id v7 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_18:
    v7();
    goto LABEL_19;
  }
  if (!a2)
  {
LABEL_17:
    id v7 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_18;
  }
  if ([v5 code] != 401)
  {
    if ([v6 code] == 409 || objc_msgSend(v6, "code") == 403)
    {
      os_signpost_id_t v9 = _AALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, "Got a 409/403, the account really is in Grey Mode", v14, 2u);
      }

      id v10 = [*(id *)(a1 + 32) _frontmostApplicationId];
      int v11 = [v10 isEqualToString:@"com.apple.Preferences"];

      if (v11) {
        goto LABEL_3;
      }
      double v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "Failing due to out of date terms...", v13, 2u);
      }
    }
    goto LABEL_17;
  }
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v8, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  [*(id *)(a1 + 32) _authenticateAccount:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_19:
}

void sub_2404E6640(uint64_t a1)
{
  v46[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F29110]);
  id v3 = [*(id *)(a1 + 32) username];
  [v2 setUsername:v3];

  [v2 setIsUsernameEditable:0];
  [v2 setReason:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "aa_personID");
  [v2 setDSID:v4];

  id v5 = objc_msgSend(*(id *)(a1 + 32), "aa_altDSID");
  [v2 setAltDSID:v5];

  [v2 setAnticipateEscrowAttempt:1];
  char v6 = 0;
  if (!*(unsigned char *)(a1 + 120))
  {
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");

    if (v7)
    {
      id v8 = _AALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v8, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will try auth with cached password first...", buf, 2u);
      }

      os_signpost_id_t v9 = objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
      [v2 _setPassword:v9];

      char v6 = 1;
      [v2 setAuthenticationType:1];
    }
    else
    {
      char v6 = 0;
    }
  }
  [v2 _setProxyingForApp:1];
  id v10 = [*(id *)(a1 + 48) client];
  int v11 = [v10 name];
  [v2 _setProxiedAppName:v11];

  if (*(void *)(a1 + 56))
  {
    objc_msgSend(v2, "_setProxiedAppBundleID:");
  }
  else
  {
    double v12 = [*(id *)(a1 + 48) client];
    uint64_t v13 = [v12 bundleID];
    [v2 _setProxiedAppBundleID:v13];
  }
  if (*(void *)(a1 + 64))
  {
    objc_msgSend(v2, "setProxiedDevice:");
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 120))
  {
    int v14 = v2;
    uint64_t v15 = 2;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 121)) {
      goto LABEL_17;
    }
    int v14 = v2;
    uint64_t v15 = 1;
  }
  [v14 setAuthenticationType:v15];
LABEL_17:
  uint64_t v16 = *(void *)(a1 + 32);
  v45[0] = @"account";
  v45[1] = @"accountStore";
  uint64_t v17 = *(void *)(a1 + 48);
  v46[0] = v16;
  v46[1] = v17;
  __int16 v18 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v2 setClientInfo:v18];

  uint64_t v19 = *(void *)(a1 + 112);
  if (!v19)
  {
    if (!*(unsigned char *)(a1 + 122)) {
      goto LABEL_21;
    }
    uint64_t v19 = 1;
  }
  [v2 setServiceType:v19];
LABEL_21:
  if (*(void *)(a1 + 72))
  {
    uint32_t v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v21;
      _os_log_impl(&dword_2404DE000, v20, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will request GS service tokens for %@.", buf, 0xCu);
    }

    [v2 setServiceIdentifiers:*(void *)(a1 + 72)];
    if (*(void *)(a1 + 72)) {
      goto LABEL_26;
    }
  }
  id v22 = [*(id *)(a1 + 32) accountType];
  __int16 v23 = [v22 identifier];
  int v24 = [v23 isEqual:*MEMORY[0x263EFAE58]];

  if (v24)
  {
LABEL_26:
    uint64_t v25 = _AALogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v25, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will persist GS service tokens resulting from auth.", buf, 2u);
    }

    [v2 setShouldUpdatePersistentServiceTokens:1];
  }
  v26 = _AALogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v26, OS_LOG_TYPE_DEFAULT, "Calling out to AKAppleIDAuthenticationController...", buf, 2u);
  }

  v27 = [*(id *)(a1 + 80) _authController];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_2404E6B4C;
  v31[3] = &unk_2650BB688;
  char v40 = v6;
  id v28 = *(id *)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 80);
  id v32 = v28;
  uint64_t v33 = v29;
  id v34 = *(id *)(a1 + 48);
  id v35 = *(id *)(a1 + 88);
  id v36 = *(id *)(a1 + 96);
  id v39 = *(id *)(a1 + 104);
  __int16 v41 = *(_WORD *)(a1 + 120);
  id v37 = *(id *)(a1 + 64);
  id v38 = v2;
  char v42 = *(unsigned char *)(a1 + 123);
  id v30 = v2;
  [v27 authenticateWithContext:v30 completion:v31];
}

void sub_2404E6B4C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(unsigned char *)(a1 + 96))
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v6;
      _os_log_impl(&dword_2404DE000, v7, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: auth with cached password failed %@. Clearing and retrying...", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    [*(id *)(a1 + 40) _authenticateAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }
  else
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_2404E6EC4;
    v26[3] = &unk_2650BB5E8;
    char v34 = *(unsigned char *)(a1 + 97);
    id v27 = *(id *)(a1 + 56);
    char v35 = *(unsigned char *)(a1 + 98);
    id v8 = v6;
    id v28 = v8;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(void **)(a1 + 48);
    id v29 = v9;
    uint64_t v30 = v10;
    id v31 = v11;
    id v32 = *(id *)(a1 + 72);
    id v33 = *(id *)(a1 + 88);
    double v12 = (void *)MEMORY[0x2455E8E80](v26);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_2404E7088;
    v20[3] = &unk_2650BB638;
    v20[4] = *(void *)(a1 + 40);
    id v21 = *(id *)(a1 + 80);
    id v22 = *(id *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    char v25 = *(unsigned char *)(a1 + 99);
    id v13 = v12;
    id v24 = v13;
    int v14 = (void (**)(void, void, void))MEMORY[0x2455E8E80](v20);
    if (v6 && objc_msgSend(v8, "aa_isXPCError"))
    {
      uint64_t v15 = _AALogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v15, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: auth failure with connection error, retrying  ", buf, 2u);
      }

      uint64_t v16 = [*(id *)(a1 + 40) _authController];
      uint64_t v17 = *(void *)(a1 + 80);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = sub_2404E7260;
      v18[3] = &unk_2650BB660;
      uint64_t v19 = v14;
      [v16 authenticateWithContext:v17 completion:v18];
    }
    else
    {
      ((void (**)(void, id, id))v14)[2](v14, v5, v8);
    }
  }
}

void sub_2404E6EC4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = *(unsigned __int8 *)(a1 + 88);
  if (!*(unsigned char *)(a1 + 88))
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB390]];
    if (([v3 BOOLValue] & 1) == 0 && !*(unsigned char *)(a1 + 89))
    {
      int v9 = 1;
      goto LABEL_5;
    }
  }
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AARenewShouldPostFollowUp"];
  int v9 = [v8 BOOLValue];

  if (!v7) {
LABEL_5:
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "ak_isUnableToPromptError") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "ak_isUserCancelError") & 1) != 0)
  {
    int v10 = 1;
    if (!a2) {
      goto LABEL_15;
    }
  }
  else
  {
    int v10 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7014);
    if (!a2) {
      goto LABEL_15;
    }
  }
  if ((v10 & v9) != 0)
  {
    int v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_2404DE000, v11, OS_LOG_TYPE_DEFAULT, "Failed to renew credentials, posting renew follow up for account: %@", (uint8_t *)&v14, 0xCu);
    }

    id v13 = [*(id *)(a1 + 56) _userInfoForRenewCredentialsFollowUpWithAccountStore:*(void *)(a1 + 64) proxiedDevice:*(void *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 56) + 24) postFollowUpWithIdentifier:*MEMORY[0x263F25690] forAccount:*(void *)(a1 + 48) userInfo:v13 completion:0];
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void sub_2404E7088(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2404E71A8;
  v11[3] = &unk_2650BB610;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  char v17 = *(unsigned char *)(a1 + 72);
  id v16 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  [v7 _validateAuthenticationResults:v10 error:v9 forContext:v8 completion:v11];
}

uint64_t sub_2404E71A8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_2404DE000, v3, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: Continue authenticating...", v11, 2u);
    }

    return [*(id *)(a1 + 32) _handleAuthenticationResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forAccount:*(void *)(a1 + 56) inStore:*(void *)(a1 + 64) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 72)];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F25790];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    return [v5 handleAuthenticationError:v7 resetAuthenticatedOnAlertFailure:v6 forAccount:v8 inStore:v9 completion:v10];
  }
}

uint64_t sub_2404E7260(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2404E7270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E7770(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: loginDelegates succeeded!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: loginDelegates failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2404E7A90(id *a1)
{
  id v2 = [a1[4] objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  id v3 = [a1[5] credential];

  if (v3)
  {
    uint64_t v4 = [a1[5] credential];
    [v4 setPassword:v2];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFB200] credentialWithPassword:v2];
    [a1[5] setCredential:v4];
  }

  id v5 = [a1[5] accountType];
  uint64_t v6 = [v5 identifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x263EFAE58]];

  if (v7)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_2404E7CBC;
    v16[3] = &unk_2650BB728;
    id v17 = a1[5];
    id v18 = a1[6];
    id v19 = a1[7];
    int v8 = (void *)MEMORY[0x2455E8E80](v16);
    id v10 = a1[5];
    id v9 = a1[6];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2404E7F44;
    v12[3] = &unk_2650BB778;
    id v13 = v9;
    id v14 = a1[5];
    id v15 = v8;
    id v11 = v8;
    objc_msgSend(v13, "aa_loginAndUpdateiCloudAccount:withCompletion:", v10, v12);
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

void sub_2404E7CBC(uint64_t a1, int a2, void *a3)
{
  id v5 = [a3 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F25B18]];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F25B38]];

  if (v7)
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v8, OS_LOG_TYPE_DEFAULT, "Looks like we need to verify terms", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 1);
    goto LABEL_6;
  }
  if (a2)
  {
LABEL_6:
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2404E7E40;
    v12[3] = &unk_2650BB4F8;
    id v13 = *(id *)(a1 + 48);
    [v9 saveVerifiedAccount:v10 withCompletionHandler:v12];

    return;
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v11();
}

void sub_2404E7E40(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      int v8 = "Account save success";
      id v9 = v6;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 138412290;
    id v12 = v5;
    int v8 = "Account was unable to save with error: %@";
    id v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
}

void sub_2404E7F44(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7 && ((objc_msgSend(v7, "aa_isAARecoverableError") & 1) != 0 || objc_msgSend(v8, "aa_isXPCError")))
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2404DE000, v9, OS_LOG_TYPE_DEFAULT, "iCloud login in failed with a recoverable error, retrying once...", buf, 2u);
    }

    uint32_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2404E8084;
    v12[3] = &unk_2650BB750;
    id v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "aa_loginAndUpdateiCloudAccount:withCompletion:", v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_2404E8084(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2404E8098(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E8390(uint64_t a1, int a2, void *a3)
{
  *(void *)&v14[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14[0] = a2;
    LOWORD(v14[1]) = 2112;
    *(void *)((char *)&v14[1] + 2) = v5;
    _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: saving raw password result was %d. Error: %@", buf, 0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)id v14 = v8;
      _os_log_impl(&dword_2404DE000, v7, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin setting raw password for iCloud account %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(void *)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_2404E853C;
    v11[3] = &unk_2650BB4F8;
    uint32_t v10 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v10 saveVerifiedAccount:v9 withCompletionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2404E853C(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: saving raw password result was %d. Error: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2404E8DB0()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v0 = _AALogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2404DE000, v0, OS_LOG_TYPE_DEFAULT, "building singleton array of auth delegate plugin principal classes", buf, 2u);
  }

  v1 = [MEMORY[0x263F230F8] pluginBundlesAtSubpath:@"/Authentication/AppleIDAuthenticationDelegates/"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v13;
    *(void *)&long long v3 = 138412290;
    long long v11 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "principalClass", v11);
        if (v8)
        {
          if (qword_26AFC5EF8) {
            [(id)qword_26AFC5EF8 arrayByAddingObject:v8];
          }
          else {
          uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v8];
          }
          uint64_t v10 = qword_26AFC5EF8;
          qword_26AFC5EF8 = v9;
        }
        else
        {
          uint64_t v10 = _AALogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v11;
            id v17 = v7;
            _os_log_fault_impl(&dword_2404DE000, v10, OS_LOG_TYPE_FAULT, "Failed to load principal class for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v4);
  }
}

void sub_2404E8FA0(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v3 = v18;
    _os_log_impl(&dword_2404DE000, v2, OS_LOG_TYPE_DEFAULT, "finished with delegate %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  uint64_t v5 = _AASignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"status"];
    int v9 = [v8 intValue];
    int v17 = 67240192;
    LODWORD(v18) = v9;
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v6, OS_SIGNPOST_INTERVAL_END, v7, "InvokeDelegateWithAuthResponse", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v17, 8u);
  }
  uint64_t v10 = _AASignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = *(void **)(a1 + 64);
    long long v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"status"];
    int v13 = [v12 intValue];
    int v17 = 134218496;
    id v18 = v11;
    __int16 v19 = 2048;
    double v20 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v21 = 1026;
    int v22 = v13;
    _os_log_impl(&dword_2404DE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: InvokeDelegateWithAuthResponse  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v17, 0x1Cu);
  }
  id v14 = *(id *)(a1 + 48);
  objc_sync_enter(v14);
  [*(id *)(a1 + 48) removeObject:objc_opt_class()];
  uint64_t v15 = [*(id *)(a1 + 48) count];
  objc_sync_exit(v14);

  if (!v15)
  {
    id v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2404DE000, v16, OS_LOG_TYPE_DEFAULT, "_invokeDelegatesWithAuthenticationResponse completing – last delegate finished", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_2404E9238(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2404E9454(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 httpResponse];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [v5 data];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      long long v11 = [v5 mediaType];

      if (v11)
      {
        long long v12 = _AALogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v5;
          _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "Fetched cached response (%@) and attempting to use for delegates", buf, 0xCu);
        }

        id v13 = objc_alloc(MEMORY[0x263F258B8]);
        id v14 = [v5 httpResponse];
        uint64_t v15 = [v5 data];
        id v16 = [v5 mediaType];
        int v17 = (void *)[v13 initWithHTTPResponse:v14 data:v15 mediaType:v16];

        __int16 v19 = *(void **)(a1 + 32);
        id v18 = *(void **)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = sub_2404E96D4;
        v24[3] = &unk_2650BB840;
        id v25 = v18;
        id v29 = *(id *)(a1 + 56);
        id v21 = v6;
        uint64_t v22 = *(void *)(a1 + 32);
        id v26 = v21;
        uint64_t v27 = v22;
        id v28 = *(id *)(a1 + 48);
        [v19 _handleDelegatesResponseForAccount:v25 store:v20 response:v17 error:0 handler:v24];

        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  uint64_t v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_2404EA880();
  }

  [*(id *)(a1 + 32) _performLoginDelegatesRequestForAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
LABEL_11:
}

void sub_2404E96D4(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AALogSystem();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_2404DE000, v7, OS_LOG_TYPE_DEFAULT, "Successfully used cached login response for account (%@) to authenticate", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2404EA8E8(a1, (uint64_t)v5, v7);
    }

    [*(id *)(a1 + 48) _fetchTokenForAccount:*(void *)(a1 + 32) accountStore:*(void *)(a1 + 56) forceFetch:1 withHandler:*(void *)(a1 + 64)];
  }
}

void sub_2404E9B70(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _AASignpostGetNanoseconds();
  int v9 = _AASignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    long long v12 = _AAErrorUnderlyingError();
    int v18 = 67240192;
    LODWORD(v19) = [v12 code];
    _os_signpost_emit_with_name_impl(&dword_2404DE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "LoginDelegates", " error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v18, 8u);
  }
  id v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v15 = *(void *)(a1 + 64);
    id v16 = _AAErrorUnderlyingError();
    int v17 = [v16 code];
    int v18 = 134218496;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    double v21 = v14;
    __int16 v22 = 1026;
    int v23 = v17;
    _os_log_impl(&dword_2404DE000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LoginDelegates  error=%{public,signpost.telemetry:number2,name=error}d ", (uint8_t *)&v18, 0x1Cu);
  }
  [*(id *)(a1 + 32) _handleDelegatesResponseForAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) response:v7 error:v6 handler:*(void *)(a1 + 56)];
}

void sub_2404E9FA8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectID];

  if (v3)
  {
    uint64_t v4 = [*v2 dirtyProperties];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = _AALogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_2404EA974(v2, v6);
      }
    }
    [*(id *)(a1 + 32) refresh];
    id v7 = [MEMORY[0x263F230F0] credentialForAccount:*(void *)(a1 + 32) clientID:0];
    [v7 setPassword:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCredential:v7];
  }
  if (+[AppleIDAuthenticationUtil doesRelyOnCompanionAccounts](AppleIDAuthenticationUtil, "doesRelyOnCompanionAccounts")&& ([*(id *)(a1 + 48) _parametersForIDSAlertFromLoginResponse:*(void *)(a1 + 56)], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v9 = (void *)v8;
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.appleaccount" code:-6 userInfo:v8];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    os_signpost_id_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_2404DE000, v11, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v12, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void *sub_2404EA360(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AFC5EF0)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = sub_2404EA488;
    v4[4] = &unk_2650BB918;
    v4[5] = v4;
    long long v5 = xmmword_2650BB900;
    uint64_t v6 = 0;
    qword_26AFC5EF0 = _sl_dlopen();
  }
  uint64_t v2 = (void *)qword_26AFC5EF0;
  if (!qword_26AFC5EF0) {
    sub_2404EAA28(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_26AFC5F08 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2404EA488()
{
  uint64_t result = _sl_dlopen();
  qword_26AFC5EF0 = result;
  return result;
}

void sub_2404EA4FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2404EA518(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2404EA54C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2404EA534();
  _os_log_debug_impl(&dword_2404DE000, v0, OS_LOG_TYPE_DEBUG, "\"Checking if client (%@) is entitled.\"", v1, 0xCu);
}

void sub_2404EA5C0()
{
  sub_2404EA540();
  sub_2404EA518(&dword_2404DE000, v0, v1, "Client requested account save, saving...", v2, v3, v4, v5, v6);
}

void sub_2404EA5F4()
{
  sub_2404EA540();
  sub_2404EA518(&dword_2404DE000, v0, v1, "Successfully updated properties for account!", v2, v3, v4, v5, v6);
}

void sub_2404EA628()
{
  sub_2404EA534();
  sub_2404EA4FC(&dword_2404DE000, v0, v1, "Failed to update properties for account, error: %@", v2, v3, v4, v5, v6);
}

void sub_2404EA690()
{
  sub_2404EA540();
  sub_2404EA518(&dword_2404DE000, v0, v1, "Successfully saved updated account, we're done here.", v2, v3, v4, v5, v6);
}

void sub_2404EA6C4()
{
  sub_2404EA534();
  sub_2404EA4FC(&dword_2404DE000, v0, v1, "Failed to save updated account, error: %@", v2, v3, v4, v5, v6);
}

void sub_2404EA72C()
{
  sub_2404EA540();
  sub_2404EA518(&dword_2404DE000, v0, v1, "Missing rp for account, checking in pk...", v2, v3, v4, v5, v6);
}

void sub_2404EA760()
{
  sub_2404EA540();
  _os_log_error_impl(&dword_2404DE000, v0, OS_LOG_TYPE_ERROR, "Auth is not permitted at this time. Not calling companion for password.", v1, 2u);
}

void sub_2404EA7A0()
{
  sub_2404EA534();
  sub_2404EA4FC(&dword_2404DE000, v0, v1, "Auth is not continuable at this time, not calling companion for password. Error: %@", v2, v3, v4, v5, v6);
}

void sub_2404EA808()
{
  os_log_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL soft_BYSetupAssistantIsRunningSilentTokenUpgrade(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AppleIDAuthenticationPlugin.m", 70, @"%s", dlerror());

  __break(1u);
}

void sub_2404EA880()
{
  sub_2404EA534();
  sub_2404EA4FC(&dword_2404DE000, v0, v1, "Failed to get cached login response with error: %@", v2, v3, v4, v5, v6);
}

void sub_2404EA8E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2404DE000, log, OS_LOG_TYPE_ERROR, "Failed to use cached login response for account (%@) with error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_2404EA974(id *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = *a1;
  int v4 = [*a1 dirtyProperties];
  int v5 = 138412546;
  id v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_2404DE000, a2, OS_LOG_TYPE_DEBUG, "AppleIDAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@", (uint8_t *)&v5, 0x16u);
}

void sub_2404EAA28(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AppleIDAuthenticationPlugin.m", 69, @"%s", *a1);

  __break(1u);
  CFDictionaryAddValue(v4, v5, v6);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x270F25408]();
}

uint64_t SBSCopyFrontmostApplicationDisplayIdentifier()
{
  return MEMORY[0x270F77140]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

uint64_t _AAErrorUnderlyingError()
{
  return MEMORY[0x270F0CE20]();
}

uint64_t _AALogSystem()
{
  return MEMORY[0x270F0CE28]();
}

uint64_t _AASignpostCreate()
{
  return MEMORY[0x270F0CE30]();
}

uint64_t _AASignpostGetNanoseconds()
{
  return MEMORY[0x270F0CE38]();
}

uint64_t _AASignpostLogSystem()
{
  return MEMORY[0x270F0CE40]();
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x270F0A578]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}