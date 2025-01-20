void sub_24051EDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24051EFE8(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_24051F4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!a2 || a3) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
}

void sub_24051F4E4(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263EFB070];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"The account could not be verified because it does not have the necessary credentials.";
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v6 = [v3 errorWithDomain:v4 code:3 userInfo:v5];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

void sub_24051F9D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 3)
  {
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_24052172C(a1, v7);
    }

    v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  if (a2 != 1)
  {
    uint64_t v8 = (id *)(a1 + 32);
    char v9 = [*(id *)(a1 + 32) isAuthenticated];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_24051FCE4;
    v22[3] = &unk_2650BE278;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v23 = v10;
    uint64_t v24 = v11;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 56);
    char v28 = v9;
    id v27 = *(id *)(a1 + 64);
    v12 = (void (**)(void))MEMORY[0x2455EA470](v22);
    if (a2 == 2)
    {
      v13 = _ACDLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_2405216B0((uint64_t *)(a1 + 32), v13);
      }
    }
    else
    {
      if ([*v8 isAuthenticated])
      {
        v14 = _ACDLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *v8;
          *(_DWORD *)buf = 138412290;
          id v30 = v15;
          _os_log_impl(&dword_24051D000, v14, OS_LOG_TYPE_DEFAULT, "\"Yahoo! plugin marking account %@ as un-authenticated\"", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setAuthenticated:0];
        v16 = *(void **)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 32);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = sub_24051FD90;
        v18[3] = &unk_2650BE2A0;
        char v21 = *(unsigned char *)(a1 + 72);
        v19 = v12;
        id v20 = *(id *)(a1 + 64);
        [v16 saveAccount:v17 withHandler:v18];

        goto LABEL_18;
      }
      if (!*(unsigned char *)(a1 + 72))
      {
        v12[2](v12);
        goto LABEL_18;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_18:

    goto LABEL_19;
  }
  [*(id *)(a1 + 32) setCredential:v5];
  v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_7:
  v6();
LABEL_19:
}

void sub_24051FCE4(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB378]];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 56) client];
  id v5 = [v4 localizedAppName];
  [v2 _displayBadCredentialsAlertForAccount:v3 clientName:v5 reason:v6 accountStore:*(void *)(a1 + 56) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 72) handler:*(void *)(a1 + 64)];
}

uint64_t sub_24051FD90(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_24051FFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_240520004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_240520014(uint64_t a1)
{
}

void sub_24052001C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x263F17880];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218242;
    uint64_t v18 = [v11 statusCode];
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_24051D000, v12, OS_LOG_TYPE_DEFAULT, "\"Yahoo! legacy token exchange got status %ld error %{public}@\"", (uint8_t *)&v17, 0x16u);
  }

  v13 = [v11 error];
  if (v13 || [v11 statusCode] != 200) {
    goto LABEL_7;
  }
  v14 = [v11 loginToken];

  if (v14)
  {
    uint64_t v15 = [v11 loginToken];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
LABEL_7:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2405204D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x263F178A8];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = [v11 error];
  if (v12 || [v11 statusCode] != 200)
  {
  }
  else
  {
    v13 = [v11 token];

    if (v13)
    {
      v14 = _ACDLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v11 statusCode];
        uint64_t v16 = [v11 errorMessage];
        int v17 = [v11 data];
        *(_DWORD *)buf = 134218754;
        uint64_t v40 = v15;
        __int16 v41 = 2114;
        id v42 = v7;
        __int16 v43 = 2114;
        v44 = v16;
        __int16 v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_24051D000, v14, OS_LOG_TYPE_DEFAULT, "\"Yahoo! token refresh did succeed with status %ld error %{public}@ errorMessage %{public}@ response data %@\"", buf, 0x2Au);
      }
      id v18 = objc_alloc(MEMORY[0x263EFB200]);
      __int16 v19 = [v11 token];
      id v20 = [*(id *)(a1 + 32) oauthRefreshToken];
      uint64_t v21 = [v11 expiryDate];
      v22 = (void *)[v18 initWithOAuth2Token:v19 refreshToken:v20 expiryDate:v21];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_33;
    }
  }
  if ([v11 statusCode] < 400 || objc_msgSend(v11, "statusCode") > 499)
  {
    id v27 = [v11 error];
    if (!v27 && [v11 statusCode] != 200) {
      goto LABEL_22;
    }
    uint64_t v28 = [v11 error];
    if (v28)
    {
      v29 = (void *)v28;
      id v30 = [v11 error];
      if ([v30 code] == -1005)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v31 = [v11 error];
      if ([v31 code] == -1001)
      {

        goto LABEL_21;
      }
      v33 = [v11 error];
      v34 = [v33 domain];
      if ([v34 isEqualToString:*MEMORY[0x263F08570]])
      {
        v35 = [v11 error];
        uint64_t v36 = [v35 code];

        if (v36 != -1009)
        {
LABEL_30:
          v32 = _ACDLogSystem();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_24052185C();
          }
          goto LABEL_32;
        }
LABEL_22:
        v32 = _ACDLogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_240521910();
        }
LABEL_32:

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_33;
      }
    }
    goto LABEL_30;
  }
  id v23 = _ACDLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_2405217A8();
  }

  [*(id *)(a1 + 32) setOauthRefreshToken:0];
  [*(id *)(a1 + 40) setCredential:*(void *)(a1 + 32)];
  uint64_t v24 = _ACDLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24051D000, v24, OS_LOG_TYPE_DEFAULT, "\"will clear Yahoo! credential.oauthRefreshToken\"", buf, 2u);
  }

  uint64_t v26 = *(void *)(a1 + 40);
  id v25 = *(void **)(a1 + 48);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_2405209B8;
  v37[3] = &unk_2650BE318;
  id v38 = *(id *)(a1 + 56);
  [v25 saveAccount:v26 withHandler:v37];

LABEL_33:
}

void sub_2405209B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_24051D000, v5, OS_LOG_TYPE_DEFAULT, "\"did clear Yahoo! credential.oauthRefreshToken with error %{public}@\"", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240520C2C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (objc_class *)MEMORY[0x263F17890];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218242;
    uint64_t v25 = [v11 statusCode];
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_24051D000, v12, OS_LOG_TYPE_DEFAULT, "\"Yahoo! legacy token exchange got status %ld error %{public}@\"", (uint8_t *)&v24, 0x16u);
  }

  v13 = [v11 error];
  if (v13)
  {
  }
  else if ([v11 statusCode] != 200)
  {
    id v23 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  v14 = [v11 error];
  if (v14 || [v11 statusCode] != 200)
  {

LABEL_12:
    id v23 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_13:
    v23();
    goto LABEL_14;
  }
  uint64_t v15 = [v11 accessToken];
  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v16 = (void *)v15;
  int v17 = [v11 refreshToken];

  if (!v17) {
    goto LABEL_12;
  }
  id v18 = objc_alloc(MEMORY[0x263EFB200]);
  __int16 v19 = [v11 accessToken];
  id v20 = [v11 refreshToken];
  uint64_t v21 = [v11 expiryDate];
  v22 = (void *)[v18 initWithOAuth2Token:v19 refreshToken:v20 expiryDate:v21];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_14:
}

void sub_24052116C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 3)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 32) setAuthenticated:1];
      uint64_t v6 = *(void *)(a1 + 32);
      id v5 = *(void **)(a1 + 40);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = sub_24052136C;
      v13[3] = &unk_2650BE390;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = 2;
      [v5 saveAccount:v6 withHandler:v13];

      return;
    }
  }
  else
  {
    if (a3)
    {
      id v7 = _ACDLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24051D000, v7, OS_LOG_TYPE_DEFAULT, "\"User requested transfer to settings from Yahoo! authentication alert\"", buf, 2u);
      }

      uint64_t v8 = NSURL;
      id v9 = NSString;
      id v10 = [*(id *)(a1 + 32) identifier];
      uint64_t v11 = [v9 stringWithFormat:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&%@=%@", v10, @"slYahooAction", @"showAuthSheet"];
      id v4 = [v8 URLWithString:v11];

      v12 = [MEMORY[0x263F01880] defaultWorkspace];
      [v12 openSensitiveURL:v4 withOptions:0];
    }
    else
    {
      id v4 = _ACDLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24051D000, v4, OS_LOG_TYPE_DEFAULT, "\"User cancelled out of Yahoo! authentication alert\"", buf, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_24052136C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

Class sub_240521380(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C87AB8)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_2405214AC;
    v3[4] = &unk_2650BE418;
    v3[5] = v3;
    long long v4 = xmmword_2650BE400;
    uint64_t v5 = 0;
    qword_268C87AB8 = _sl_dlopen();
  }
  if (!qword_268C87AB8) {
    sub_2405219C4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("MFAccountLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_240521A44();
  }
  qword_268C87AB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2405214AC()
{
  uint64_t result = _sl_dlopen();
  qword_268C87AB8 = result;
  return result;
}

void sub_24052154C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_24052157C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24051D000, a2, OS_LOG_TYPE_DEBUG, "\"%@ is entitled for all-account access. Returning Yahoo! credentials.\"", (uint8_t *)&v2, 0xCu);
}

void sub_2405215F4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24051D000, a2, OS_LOG_TYPE_DEBUG, "\"%@ is a non-entitled client. No Yahoo! credential for you.\"", (uint8_t *)&v2, 0xCu);
}

void sub_24052166C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24051D000, log, OS_LOG_TYPE_DEBUG, "\"Yahoo! plugin can't renew Yahoo japan credentials.\"", v1, 2u);
}

void sub_2405216B0(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24051D000, a2, OS_LOG_TYPE_ERROR, "\"Yahoo plugin: Unable to renew %@ because of a network issue.\"", (uint8_t *)&v3, 0xCu);
}

void sub_24052172C(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24051D000, a2, OS_LOG_TYPE_ERROR, "\"Yahoo plugin: Unable to renew %@ because the keychain was locked.\"", (uint8_t *)&v3, 0xCu);
}

void sub_2405217A8()
{
  sub_24052156C();
  [v1 statusCode];
  uint64_t v2 = [v0 errorMessage];
  int v3 = [v0 data];
  sub_240521520();
  sub_24052154C(&dword_24051D000, v4, v5, "\"Yahoo! token refresh did fail with auth problem; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_24052185C()
{
  sub_24052156C();
  [v1 statusCode];
  uint64_t v2 = [v0 errorMessage];
  int v3 = [v0 data];
  sub_240521520();
  sub_24052154C(&dword_24051D000, v4, v5, "\"Yahoo! token refresh did fail with unknown issue; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_240521910()
{
  sub_24052156C();
  [v1 statusCode];
  uint64_t v2 = [v0 errorMessage];
  int v3 = [v0 data];
  sub_240521520();
  sub_24052154C(&dword_24051D000, v4, v5, "\"Yahoo! token refresh did fail with network issue; status %ld error %{public}@ errorMessage %{public}@ response data %@\"",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_2405219C4(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *MessageLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SLYahooAuthenticationPlugin.m", 52, @"%s", *a1);

  __break(1u);
}

void sub_240521A44()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getMFAccountLoaderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SLYahooAuthenticationPlugin.m", 53, @"Unable to find class %s", "MFAccountLoader");

  __break(1u);
  CFRelease(v2);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x270F0A578]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x270EE0670]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}