void sub_24050EC10(uint64_t a1)
{
  const void *v2;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_24050F340(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 3)
  {
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_240510DA0(a1, v7);
    }

    v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  if (a2 != 1)
  {
    v8 = (id *)(a1 + 32);
    char v9 = [*(id *)(a1 + 32) isAuthenticated];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_24050F64C;
    v22[3] = &unk_2650BD5D0;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v23 = v10;
    uint64_t v24 = v11;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 56);
    char v28 = v9;
    id v27 = *(id *)(a1 + 64);
    v12 = (void (**)(void))MEMORY[0x2455E9BC0](v22);
    if (a2 == 2)
    {
      v13 = _ACDLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_240510D24((uint64_t *)(a1 + 32), v13);
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
          _os_log_impl(&dword_24050D000, v14, OS_LOG_TYPE_DEFAULT, "\"Google plugin marking account %@ as un-authenticated\"", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setAuthenticated:0];
        v16 = *(void **)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 32);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = sub_24050F6F8;
        v18[3] = &unk_2650BD5F8;
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

void sub_24050F64C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263EFB378]];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = [*(id *)(a1 + 56) client];
  id v5 = [v4 localizedAppName];
  [v2 _displayBadCredentialsAlertForAccount:v3 clientName:v5 reason:v6 accountStore:*(void *)(a1 + 56) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 72) handler:*(void *)(a1 + 64)];
}

uint64_t sub_24050F6F8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_24050F9F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F17850];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = [v11 error];
  if (v12 || [v11 statusCode] != 200)
  {

    goto LABEL_8;
  }
  v13 = [v11 token];

  if (!v13)
  {
LABEL_8:
    if ([v11 statusCode] >= 400 && objc_msgSend(v11, "statusCode") <= 499)
    {
      v22 = _ACDLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_240510E1C(v11);
      }
LABEL_29:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_30;
    }
    id v23 = [v11 error];
    if (!v23 && [v11 statusCode] != 200) {
      goto LABEL_19;
    }
    uint64_t v24 = [v11 error];
    if (v24)
    {
      id v25 = (void *)v24;
      id v26 = [v11 error];
      if ([v26 code] == -1005)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v27 = [v11 error];
      if ([v27 code] == -1001)
      {

        goto LABEL_18;
      }
      char v28 = [v11 error];
      v29 = [v28 domain];
      if ([v29 isEqualToString:*MEMORY[0x263F08570]])
      {
        id v30 = [v11 error];
        uint64_t v31 = [v30 code];

        if (v31 != -1009)
        {
LABEL_27:
          v22 = _ACDLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_240510E98(v11);
          }
          goto LABEL_29;
        }
LABEL_19:
        v22 = _ACDLogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_240510F14(v11);
        }
        goto LABEL_29;
      }
    }
    goto LABEL_27;
  }
  v14 = _ACDLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v33 = [v11 statusCode];
    __int16 v34 = 2114;
    id v35 = v7;
    _os_log_impl(&dword_24050D000, v14, OS_LOG_TYPE_DEFAULT, "\"Google token refresh did succeed; status %ld error %{public}@\"",
      buf,
      0x16u);
  }

  id v15 = objc_alloc(MEMORY[0x263EFB200]);
  v16 = [v11 token];
  uint64_t v17 = [*(id *)(a1 + 32) oauthRefreshToken];
  v18 = [v11 expiryDate];
  v19 = (void *)[v15 initWithOAuth2Token:v16 refreshToken:v17 expiryDate:v18];

  id v20 = *(void **)(a1 + 40);
  char v21 = [v11 grantedDataclasses];
  [v20 setAccountProperty:v21 forKey:*MEMORY[0x263EFAD88]];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_30:
}

void sub_24050FF54(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F17840];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v31 = [v11 statusCode];
    __int16 v32 = 2114;
    id v33 = v7;
    _os_log_impl(&dword_24050D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google legacy token exchange got status %ld error %{public}@\"", buf, 0x16u);
  }

  v13 = [v11 error];
  if (v13)
  {
  }
  else if ([v11 statusCode] != 200)
  {
    v18 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  v14 = [v11 error];
  if (v14 || [v11 statusCode] != 200)
  {

    goto LABEL_12;
  }
  id v15 = [v11 token];

  if (!v15)
  {
LABEL_12:
    v18 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_14:
    v18();
    goto LABEL_15;
  }
  id v16 = objc_alloc_init(MEMORY[0x263F17860]);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v16 defaultScope];
  }
  else
  {
    uint64_t v17 = 0;
  }
  v19 = (void *)MEMORY[0x263F17838];
  id v20 = [v11 token];
  char v21 = [v16 clientID];
  v22 = [v19 urlRequestForAuthCodeFromAuthToken:v20 clientID:v21 scope:v17];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_240510240;
  v26[3] = &unk_2650BD698;
  id v23 = *(void **)(a1 + 32);
  id v29 = *(id *)(a1 + 40);
  id v27 = v16;
  id v28 = *(id *)(a1 + 32);
  id v24 = v16;
  id v25 = [v23 dataTaskWithRequest:v22 completionHandler:v26];
  [v25 resume];

LABEL_15:
}

void sub_240510240(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F17830];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = [v11 statusCode];
    __int16 v30 = 2114;
    id v31 = v7;
    _os_log_impl(&dword_24050D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google auth token exchange got status %ld error %{public}@\"", buf, 0x16u);
  }

  v13 = [v11 error];
  if (v13)
  {
  }
  else if ([v11 statusCode] != 200)
  {
    id v25 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  v14 = [v11 error];
  if (v14 || [v11 statusCode] != 200)
  {

    goto LABEL_11;
  }
  id v15 = [v11 code];

  if (!v15)
  {
LABEL_11:
    id v25 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_13:
    v25();
    goto LABEL_14;
  }
  id v16 = (void *)MEMORY[0x263F17848];
  uint64_t v17 = [*(id *)(a1 + 32) clientID];
  v18 = [*(id *)(a1 + 32) clientSecret];
  v19 = [*(id *)(a1 + 32) clientRedirect];
  id v20 = [v11 code];
  char v21 = [*(id *)(a1 + 32) tokenURL];
  v22 = [v16 urlRequestForClientID:v17 secret:v18 redirectURI:v19 authCode:v20 tokenURL:v21 codeVerifier:0];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_240510514;
  v26[3] = &unk_2650BD670;
  id v23 = *(void **)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  id v24 = [v23 dataTaskWithRequest:v22 completionHandler:v26];
  [v24 resume];

LABEL_14:
}

void sub_240510514(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F17850];
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)[[v8 alloc] initWithData:v10 urlResponse:v9 error:v7];

  v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134218242;
    uint64_t v23 = [v11 statusCode];
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl(&dword_24050D000, v12, OS_LOG_TYPE_DEFAULT, "\"Google auth code exchange got status %ld error %{public}@\"", (uint8_t *)&v22, 0x16u);
  }

  v13 = [v11 error];
  if (v13)
  {
  }
  else if ([v11 statusCode] != 200)
  {
    char v21 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  v14 = [v11 error];
  if (v14 || [v11 statusCode] != 200)
  {

    goto LABEL_11;
  }
  id v15 = [v11 token];

  if (!v15)
  {
LABEL_11:
    char v21 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_13:
    v21();
    goto LABEL_14;
  }
  id v16 = objc_alloc(MEMORY[0x263EFB200]);
  uint64_t v17 = [v11 token];
  v18 = [v11 refreshToken];
  v19 = [v11 expiryDate];
  id v20 = (void *)[v16 initWithOAuth2Token:v17 refreshToken:v18 expiryDate:v19];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_14:
}

void sub_240510AD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
      v13[2] = sub_240510CD8;
      v13[3] = &unk_2650BD6E8;
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
        _os_log_impl(&dword_24050D000, v7, OS_LOG_TYPE_DEFAULT, "\"User requested transfer to settings from Google authentication alert\"", buf, 2u);
      }

      v8 = NSURL;
      id v9 = NSString;
      id v10 = [*(id *)(a1 + 32) identifier];
      uint64_t v11 = [v9 stringWithFormat:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&%@=%@", v10, @"slGoogleAction", @"showAuthSheet"];
      v4 = [v8 URLWithString:v11];

      v12 = [MEMORY[0x263F01880] defaultWorkspace];
      [v12 openSensitiveURL:v4 withOptions:0];
    }
    else
    {
      v4 = _ACDLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24050D000, v4, OS_LOG_TYPE_DEFAULT, "\"User cancelled out of Google authentication alert\"", buf, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_240510CD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_240510D04(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_240510D24(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24050D000, a2, OS_LOG_TYPE_ERROR, "\"Google plugin: Unable to renew %@ because of an network issue.\"", (uint8_t *)&v3, 0xCu);
}

void sub_240510DA0(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24050D000, a2, OS_LOG_TYPE_ERROR, "\"Google plugin: Unable to renew %@ because the keychain was locked.\"", (uint8_t *)&v3, 0xCu);
}

void sub_240510E1C(void *a1)
{
  [a1 statusCode];
  sub_240510CEC();
  sub_240510D04(&dword_24050D000, v1, v2, "\"Google token refresh did fail with auth problem; status %ld error %{public}@\"",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_240510E98(void *a1)
{
  [a1 statusCode];
  sub_240510CEC();
  sub_240510D04(&dword_24050D000, v1, v2, "\"Google token refresh did fail with unknown issue; status %ld error %{public}@\"",
    v3,
    v4,
    v5,
    v6,
    v7);
}

void sub_240510F14(void *a1)
{
  [a1 statusCode];
  sub_240510CEC();
  sub_240510D04(&dword_24050D000, v1, v2, "\"Google token refresh did fail with network issue; status %ld error %{public}@\"",
    v3,
    v4,
    v5,
    v6,
    v7);
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}