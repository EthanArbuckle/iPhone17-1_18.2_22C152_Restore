uint64_t sub_3034()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_14D58;
  v5 = qword_14D58;
  if (!qword_14D58)
  {
    v6 = *(_OWORD *)off_10538;
    v7 = *(_OWORD *)&off_10548;
    v3[3] = _sl_dlopen();
    qword_14D58 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_3144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_315C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_14D58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_31EC()
{
  uint64_t v0 = sub_3034();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_3248()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_14D60;
  uint64_t v6 = qword_14D60;
  if (!qword_14D60)
  {
    v1 = (void *)sub_31EC();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    qword_14D60 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_3320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_3338(uint64_t a1)
{
  v2 = (void *)sub_31EC();
  uint64_t result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_14D60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_3388()
{
  uint64_t v0 = (uint64_t (*)(void))sub_3248();
  if (v0)
  {
    return v0();
  }
  else
  {
    sub_9DA4();
    return sub_33B8();
  }
}

uint64_t sub_33B8()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_14D68;
  uint64_t v6 = qword_14D68;
  if (!qword_14D68)
  {
    v1 = (void *)sub_31EC();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    qword_14D68 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_3490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_34A8(uint64_t a1)
{
  v2 = (void *)sub_31EC();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_14D68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_34F8()
{
  uint64_t v0 = (uint64_t (*)(void))sub_33B8();
  if (v0)
  {
    return v0();
  }
  else
  {
    uint64_t v2 = sub_9DA4();
    return sub_3528(v2);
  }
}

id sub_3528()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_14D70;
  uint64_t v7 = qword_14D70;
  if (!qword_14D70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_360C;
    v3[3] = &unk_10588;
    v3[4] = &v4;
    sub_360C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_35F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_360C(uint64_t a1)
{
  sub_31EC();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_14D70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_9DC8();
    return (Class)sub_3664(v3);
  }
  return result;
}

uint64_t sub_3664()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_14D78;
  uint64_t v6 = qword_14D78;
  if (!qword_14D78)
  {
    id v1 = (void *)sub_31EC();
    v4[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierAppleID");
    qword_14D78 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_373C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_3754(uint64_t a1)
{
  uint64_t v2 = (void *)sub_31EC();
  Class result = dlsym(v2, "BYFlowSkipIdentifierAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_14D78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

AAIDSAuthenticationPlugin *sub_37A4()
{
  uint64_t v0 = (void **)sub_3664();
  if (v0)
  {
    id v1 = *v0;
    return (AAIDSAuthenticationPlugin *)v1;
  }
  else
  {
    uint64_t v3 = (AAIDSAuthenticationPlugin *)sub_9DA4();
    return [(AAIDSAuthenticationPlugin *)v3 init];
  }
}

void sub_3BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_3BC4()
{
  if (qword_14D98 != -1) {
    dispatch_once(&qword_14D98, &stru_10A98);
  }
  uint64_t v0 = (void *)qword_14D90;
  return v0;
}

void sub_3C18(uint64_t a1)
{
  uint64_t v2 = sub_3BC4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v3, 2u);
  }

  [*(id *)(a1 + 32) cancelAllOperations];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_3C94(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = [v3 error];
  if (!v3)
  {
    uint64_t v6 = sub_3BC4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_9E58();
    }
    goto LABEL_7;
  }
  uint64_t v5 = sub_3BC4();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_9EC0();
    }
LABEL_7:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Server auth was successful, not in Gray Mode anymore", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "aa_updateWithProvisioningResponse:", v3);
  objc_msgSend(*(id *)(a1 + 32), "aa_setNeedsToVerifyTerms:", 0);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3E40;
  v11[3] = &unk_105D8;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 saveVerifiedAccount:v8 withCompletionHandler:v11];

LABEL_11:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_3E40(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = sub_3BC4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_9F28();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3F30(id a1)
{
  qword_14D80 = (uint64_t)[objc_alloc((Class)NSSet) initWithArray:&off_10E90];
  _objc_release_x1();
}

uint64_t sub_42C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_47A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_47C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_47D4(uint64_t a1, int a2)
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

uint64_t sub_47F8(uint64_t a1, int a2)
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

void sub_49C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_3BC4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A1F0();
    }

    [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    if (v8)
    {
      id v9 = sub_3BC4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 40) username];
        int v18 = 138412290;
        v19 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Password-less auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v18, 0xCu);
      }
      [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:v8 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    }
    else
    {
      v11 = [v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey];
      id v12 = [v11 allKeys];

      if ([*(id *)(a1 + 56) count]
        && [v12 count]
        && (+[NSSet setWithArray:*(void *)(a1 + 56)],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            +[NSSet setWithArray:v12],
            v14 = objc_claimAutoreleasedReturnValue(),
            unsigned int v15 = [v13 isSubsetOfSet:v14],
            v14,
            v13,
            v15))
      {
        v16 = sub_3BC4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Password-less auth returned all the requested tokens!", (uint8_t *)&v18, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        v17 = sub_3BC4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_A1BC();
        }

        [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void sub_4EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:a2 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = sub_3BC4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A35C();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_5204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_3BC4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_A3C4();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = [a2 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    uint64_t v8 = sub_3BC4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Password-based auth succeeded! Time for login with Apple ID %@...", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_560C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2) {
    return [*(id *)(a1 + 32) _handleRenewFailure:a3 forAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_592C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_59D0;
  v6[3] = &unk_10758;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _beginPETBasedLoginWithAccount:v4 PET:a2 store:v5 completion:v6];
}

uint64_t sub_59D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_59F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_3BC4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_A4FC();
    }

    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsServicesKey];
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) username];
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 48), "aa_altDSID");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_5B54;
    v9[3] = &unk_107A8;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    [v6 _convertPasswordToPETForAppleID:v7 altDSID:v8 password:v3 services:v5 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_5B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_3BC4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_60A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_60BC(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 56))
  {
    uint64_t v9 = sub_3BC4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_A6E4();
    }

    CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  id v11 = *(void **)(*(void *)(a1 + 32) + 8);
  id v12 = [*(id *)(a1 + 40) identifier];
  [v11 removeObject:v12];

  if ((a2 & 1) == 0)
  {
    unsigned int v15 = sub_3BC4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_A668((void *)(a1 + 40), (uint64_t)v8, v15);
    }
    goto LABEL_17;
  }
  if (!v7)
  {
    unsigned int v15 = sub_3BC4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_A5CC();
    }
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14 = sub_3BC4();
  unsigned int v15 = v14;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_A600();
    }
LABEL_17:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_18;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    int v18 = 138412290;
    uint64_t v19 = v16;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "ACRemoteDeviceProxy successfully provided us with a password for %@", (uint8_t *)&v18, 0xCu);
  }

  id v17 = v7;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_18:
  objc_sync_exit(v10);
}

void sub_62F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6630(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 && !a2) {
    goto LABEL_19;
  }
  if (!a2) {
    goto LABEL_17;
  }
  if ([v5 code] != (char *)&stru_158.reloff + 1)
  {
    if ([v6 code] == (char *)&stru_158.flags + 1
      || [v6 code] == (char *)&stru_158.reloff + 3)
    {
      id v8 = sub_3BC4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Got a 409/403, the account really is in Gray Mode", v13, 2u);
      }

      uint64_t v9 = [*(id *)(a1 + 32) _frontmostApplicationId];
      unsigned int v10 = [v9 isEqualToString:@"com.apple.Preferences"];

      if (v10)
      {
        id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_18:
        v11();
        goto LABEL_19;
      }
      id v12 = sub_3BC4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_A718();
      }
    }
LABEL_17:
    id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_18;
  }
  id v7 = sub_3BC4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  [*(id *)(a1 + 32) _authenticateAccount:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_19:
}

void sub_6B9C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v3 = [*(id *)(a1 + 32) username];
  [v2 setUsername:v3];

  [v2 setIsUsernameEditable:0];
  [v2 setReason:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "aa_personID");
  [v2 setDSID:v4];

  id v5 = objc_msgSend(*(id *)(a1 + 32), "aa_altDSID");
  [v2 setAltDSID:v5];

  [v2 setAnticipateEscrowAttempt:1];
  [v2 setAuthenticationType:0];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");

  if (v6)
  {
    id v7 = sub_3BC4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AppleIDAuthenticationPlugin: will try auth with cached password first...", buf, 2u);
    }

    id v8 = objc_msgSend(*(id *)(a1 + 32), "_aa_rawPassword");
    [v2 _setPassword:v8];

    [v2 setAuthenticationType:1];
  }
  [v2 _setProxyingForApp:1];
  uint64_t v9 = [*(id *)(a1 + 48) client];
  unsigned int v10 = [v9 name];
  [v2 _setProxiedAppName:v10];

  if (*(void *)(a1 + 56))
  {
    objc_msgSend(v2, "_setProxiedAppBundleID:");
  }
  else
  {
    id v11 = [*(id *)(a1 + 48) client];
    id v12 = [v11 bundleID];
    [v2 _setProxiedAppBundleID:v12];
  }
  if (*(void *)(a1 + 64))
  {
    objc_msgSend(v2, "setProxiedDevice:");
  }
  else if (*(unsigned char *)(a1 + 120))
  {
    [v2 setAuthenticationType:1];
  }
  uint64_t v13 = *(void *)(a1 + 32);
  v42[0] = @"account";
  v42[1] = @"accountStore";
  uint64_t v14 = *(void *)(a1 + 48);
  v43[0] = v13;
  v43[1] = v14;
  unsigned int v15 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v2 setClientInfo:v15];

  if (*(void *)(a1 + 112)) {
    objc_msgSend(v2, "setServiceType:");
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v16 = sub_3BC4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_A7E8(a1 + 72, v16, v17, v18, v19, v20, v21, v22);
    }

    [v2 setServiceIdentifiers:*(void *)(a1 + 72)];
    [v2 setShouldUpdatePersistentServiceTokens:1];
  }
  v23 = sub_3BC4();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_A7B4();
  }
  BOOL v24 = v6 != 0;

  v25 = [*(id *)(a1 + 80) _authController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_6FBC;
  v29[3] = &unk_10898;
  BOOL v38 = v24;
  id v26 = *(id *)(a1 + 32);
  uint64_t v27 = *(void *)(a1 + 80);
  id v30 = v26;
  uint64_t v31 = v27;
  id v32 = *(id *)(a1 + 48);
  id v33 = *(id *)(a1 + 88);
  id v34 = *(id *)(a1 + 96);
  id v37 = *(id *)(a1 + 104);
  char v39 = *(unsigned char *)(a1 + 120);
  id v35 = *(id *)(a1 + 64);
  id v36 = v2;
  char v40 = *(unsigned char *)(a1 + 121);
  id v28 = v2;
  [v25 authenticateWithContext:v28 completion:v29];
}

void sub_6FBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(unsigned char *)(a1 + 96))
  {
    id v7 = sub_3BC4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_A858();
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    [*(id *)(a1 + 40) _authenticateAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_7268;
    v23[3] = &unk_10848;
    objc_copyWeak(&v31, &location);
    id v24 = *(id *)(a1 + 56);
    char v32 = *(unsigned char *)(a1 + 97);
    id v8 = v6;
    id v25 = v8;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v26 = v9;
    uint64_t v27 = v10;
    id v28 = v11;
    id v29 = *(id *)(a1 + 72);
    id v30 = *(id *)(a1 + 88);
    id v12 = objc_retainBlock(v23);
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 80);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_73D8;
    v16[3] = &unk_10870;
    v16[4] = v13;
    id v17 = v5;
    id v18 = v8;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    char v22 = *(unsigned char *)(a1 + 98);
    unsigned int v15 = v12;
    id v21 = v15;
    [v13 _validateAuthenticationResults:v17 error:v18 forContext:v14 completion:v16];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void sub_724C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_7268(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsShouldForceKey];
  if (([v7 BOOLValue] & 1) != 0 || *(unsigned char *)(a1 + 96))
  {
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"AARenewShouldPostFollowUp"];
    unsigned int v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned int v9 = 1;
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "ak_isUnableToPromptError") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "ak_isUserCancelError") & 1) != 0)
  {
    unsigned int v10 = 1;
    if (!a2) {
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v10 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7014);
    if (!a2) {
      goto LABEL_15;
    }
  }
  if ((v10 & v9) != 0)
  {
    id v11 = sub_3BC4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_A8C0(a1, v11, v12, v13, v14, v15, v16, v17);
    }

    id v18 = [*(id *)(a1 + 56) _userInfoForRenewCredentialsFollowUpWithAccountStore:*(void *)(a1 + 64) proxiedDevice:*(void *)(a1 + 72)];
    if (WeakRetained) {
      [WeakRetained[3] postFollowUpWithIdentifier:AAFollowUpIdentifierRenewCredentials forAccount:*(void *)(a1 + 48) userInfo:v18 completion:0];
    }
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

id sub_73D8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: Continue authenticating...", v10, 2u);
    }

    return [*(id *)(a1 + 32) _handleAuthenticationResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48) forAccount:*(void *)(a1 + 56) inStore:*(void *)(a1 + 64) resetAuthenticatedOnAlertFailure:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    return +[AAAuthenticationErrorHandler handleAuthenticationError:v6 resetAuthenticatedOnAlertFailure:v5 forAccount:v7 inStore:v8 completion:v9];
  }
}

uint64_t sub_7490(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_7990(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: loginDelegates succeeded!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: loginDelegates failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_7C44(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:AKAuthenticationPasswordKey];
  uint64_t v2 = [*(id *)(a1 + 40) credential];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) credential];
    [v3 setPassword:v4];
  }
  else
  {
    id v3 = +[ACAccountCredential credentialWithPassword:v4];
    [*(id *)(a1 + 40) setCredential:v3];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_7FA4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_3BC4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v14[0]) = a2;
    WORD2(v14[0]) = 2112;
    *(void *)((char *)v14 + 6) = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: saving raw password result was %d. Error: %@", buf, 0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    BOOL v7 = sub_3BC4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14[0] = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin setting raw password for iCloud account %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(void *)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8150;
    v11[3] = &unk_10758;
    unsigned int v10 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v10 saveVerifiedAccount:v9 withCompletionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_8150(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_3BC4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAIDSAuthenticationPlugin: saving raw password result was %d. Error: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_844C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 status];
  id v10 = [v9 integerValue];

  if (v7 || v10)
  {
    uint64_t v17 = [v8 statusMessage];
    id v18 = (void *)v17;
    if (v17)
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      uint64_t v30 = v17;
      id v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      uint64_t v20 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:v10 userInfo:v19];

      id v7 = (id)v20;
    }
    id v21 = [*(id *)(a1 + 32) credential];
    [v21 setPassword:0];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = [v8 responseParameters];
    uint64_t v13 = *(void *)(a1 + 48);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_8680;
    v22[3] = &unk_10988;
    id v23 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    id v24 = v14;
    uint64_t v25 = v15;
    id v26 = v8;
    id v16 = *(id *)(a1 + 64);
    id v27 = 0;
    id v28 = v16;
    [v11 _processAuthenticationResponseParameters:v12 accountStore:v13 completion:v22];

    id v7 = v23;
  }
}

void sub_8680(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectID];

  if (v3)
  {
    id v4 = [*v2 dirtyProperties];
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = sub_3BC4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_A930(v2, v6);
      }
    }
    [*(id *)(a1 + 32) refresh];
    id v7 = +[ACDKeychainManager credentialForAccount:*(void *)(a1 + 32) clientID:0];
    [v7 setPassword:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCredential:v7];
  }
  if (+[AAIDSAuthenticationPlugin _doesRelyOnCompanionAccounts](AAIDSAuthenticationPlugin, "_doesRelyOnCompanionAccounts")&& ([*(id *)(a1 + 48) _parametersForIDSAlertFromLoginResponse:*(void *)(a1 + 56)], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:-6 userInfo:v8];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v11 = sub_3BC4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v12, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_8D90(uint64_t a1)
{
}

id sub_8D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKey:@"uri"];
  id v5 = [v4 _stripFZIDPrefix];

  id v6 = [v3 objectForKey:@"status"];
  unsigned int v7 = [v6 intValue];

  uint64_t v8 = [v3 objectForKey:@"is-user-visible"];

  if (v8 && ([v8 BOOLValue] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  if (v7 == 5051) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

uint64_t sub_8E88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9850(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = sub_3BC4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412802;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "Setting account property (%@) for key (%@) on account with identifier (%@).", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 32) setAccountProperty:v6 forKey:v5];
}

void sub_995C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  if (v5 && a2 && a3)
  {
    id v6 = a2;
    unsigned int v7 = IDSAccountKeyForServerKey();
    uint64_t v8 = [v6 objectForKey:v7];

    if (v8)
    {
      int v9 = sub_3BC4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v5 identifier];
        int v11 = 138412802;
        id v12 = v8;
        __int16 v13 = 2112;
        id v14 = v7;
        __int16 v15 = 2112;
        id v16 = v10;
        _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "Setting %@ for key %@ on account with identifier: %@", (uint8_t *)&v11, 0x20u);
      }
      [v5 setAccountProperty:v8 forKey:v7];
    }
  }
}

void sub_9AA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = sub_3BC4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Saved account (%@) with object ID (%@) and error (%@).", (uint8_t *)&v9, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_9B8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9C80(id a1)
{
  qword_14D90 = (uint64_t)os_log_create("com.apple.appleaccount", "ids");
  _objc_release_x1();
}

void sub_9CC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9CE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_9D14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_9D30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_9D64(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_9D84(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_9DA4()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_9DC8(v0);
}

uint64_t sub_9DC8()
{
  uint64_t v0 = abort_report_np();
  return sub_9DF0(v0);
}

void sub_9DF0()
{
  sub_9CFC();
  sub_9D30(&dword_0, v0, v1, "\"Checking if client (%@) is entitled.\"", v2, v3, v4, v5, v6);
}

void sub_9E58()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Something went wrong and we couldn't contact the server. %@", v2, v3, v4, v5, v6);
}

void sub_9EC0()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Got an error, may still be in Gray Mode. %@", v2, v3, v4, v5, v6);
}

void sub_9F28()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Failed to save account after marking it as not in gray mode anymore. %@", v2, v3, v4, v5, v6);
}

void sub_9F90(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 accountType];
  uint8_t v6 = [v5 accountTypeDescription];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Unable to get credential for %@ account! Error = %@", (uint8_t *)&v7, 0x16u);
}

void sub_A050()
{
  sub_9CFC();
  sub_9D30(&dword_0, v0, v1, "Logging in with account %@....", v2, v3, v4, v5, v6);
}

void sub_A0B8()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "AAIDSAuthenticationPlugin will use provided options for login.", v2, v3, v4, v5, v6);
}

void sub_A0EC()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Device relies on companion auth, proceeding...", v2, v3, v4, v5, v6);
}

void sub_A120()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Device suppoprts standalone auth, proceeding...", v2, v3, v4, v5, v6);
}

void sub_A154()
{
  sub_9CFC();
  sub_9D30(&dword_0, v0, v1, "Trying password-less login with account %@ with the help of Companion's Anisette data.", v2, v3, v4, v5, v6);
}

void sub_A1BC()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "Password-less auth appeared to succeed, but auth results do not have a value for AKAuthenticationPasswordKey or AKAuthenticationIDMSTokenKey!", v2, v3, v4, v5, v6);
}

void sub_A1F0()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Oops, something went wrong with password-less auth! %@", v2, v3, v4, v5, v6);
}

void sub_A258()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "_tryPasswordLoginWithAccount: we do not have a password for %@. Login has officially failed.", v2, v3, v4, v5, v6);
}

void sub_A2C0()
{
  sub_9CFC();
  sub_9D30(&dword_0, v0, v1, "Trying password-based login for account %@...", v2, v3, v4, v5, v6);
}

void sub_A328()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Missing rp for account, checking in pk...", v2, v3, v4, v5, v6);
}

void sub_A35C()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Both password-less and password auth have failed. Login has officially failed. Error: %@", v2, v3, v4, v5, v6);
}

void sub_A3C4()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Oops, something went wrong with password-based auth! %@", v2, v3, v4, v5, v6);
}

void sub_A42C()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "Failed to encode AKDevice! Proxied auth is doomed.", v2, v3, v4, v5, v6);
}

void sub_A460()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "Auth is not permitted at this time. Not calling companion for password.", v2, v3, v4, v5, v6);
}

void sub_A494()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Auth is not continuable at this time, not calling companion for password. Error: %@", v2, v3, v4, v5, v6);
}

void sub_A4FC()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "AAIDSAuthenticationPlugin: Exchanging raw password from companion for PET...", v2, v3, v4, v5, v6);
}

void sub_A530()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "Can't get password from companion, told to avoid UI", v2, v3, v4, v5, v6);
}

void sub_A564()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "CFUserNotificationCreate in renewCredentials!", v2, v3, v4, v5, v6);
}

void sub_A598()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Showing renew-credentials prompt...", v2, v3, v4, v5, v6);
}

void sub_A5CC()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "ACRemoteDeviceProxy reports that renewCredentials succeeded, but no password is in the response!", v2, v3, v4, v5, v6);
}

void sub_A600()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "ACRemoteDeviceProxy reports that renewCredentials succeeded, but response is not a string! %@", v2, v3, v4, v5, v6);
}

void sub_A668(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_9D64(&dword_0, a2, a3, "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_A6E4()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Dismissing renew-credentials prompt.", v2, v3, v4, v5, v6);
}

void sub_A718()
{
  sub_9D08();
  sub_9D14(&dword_0, v0, v1, "Failing due to out of date terms...", v2, v3, v4, v5, v6);
}

void sub_A74C()
{
  sub_9D4C();
  sub_9D64(&dword_0, v0, v1, "Error! Invalid value type for key %@ in renewCredentials options: %@.");
}

void sub_A7B4()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Calling out to AKAppleIDAuthenticationController...", v2, v3, v4, v5, v6);
}

void sub_A7E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A858()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "AppleIDAuthenticationPlugin: auth with cached password failed %@. Clearing and retrying...", v2, v3, v4, v5, v6);
}

void sub_A8C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A930(id *a1, NSObject *a2)
{
  id v3 = *a1;
  uint64_t v4 = [*a1 dirtyProperties];
  int v5 = 138412546;
  id v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "AAIDSAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@", (uint8_t *)&v5, 0x16u);
}

void sub_A9E4()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "Missing necessary setup parameters for service type %@", v2, v3, v4, v5, v6);
}

void sub_AA4C()
{
  sub_9CFC();
  sub_9D30(&dword_0, v0, v1, "AAIDSAuthenticationPlugin received response parameters (%@).", v2, v3, v4, v5, v6);
}

void sub_AAB4()
{
  sub_9D08();
  sub_9CE0(&dword_0, v0, v1, "Nothing to update, moving along.", v2, v3, v4, v5, v6);
}

void sub_AAE8()
{
  sub_9CFC();
  sub_9CC4(&dword_0, v0, v1, "No account type associated with serviceType (%@).", v2, v3, v4, v5, v6);
}

void sub_AB50()
{
  sub_9D4C();
  sub_9D84(&dword_0, v0, v1, "AAIDSAuthenticationPlugin: Found matching accounts for Apple ID (%@): %@.");
}

void sub_ABB8()
{
  sub_9D4C();
  sub_9D84(&dword_0, v0, v1, "AAIDSAuthenticationPlugin: Update accounts with type (%@) and parameters (%@).");
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

uint64_t IDSAccountKeyForServerKey()
{
  return _IDSAccountKeyForServerKey();
}

uint64_t IDSAccountPropertiesFromAuthenticationDictionary()
{
  return _IDSAccountPropertiesFromAuthenticationDictionary();
}

uint64_t IDSAuthenticationDelegatePrintLoginDelegatesBag()
{
  return _IDSAuthenticationDelegatePrintLoginDelegatesBag();
}

uint64_t IDSParseAuthDictionaryForServiceData()
{
  return _IDSParseAuthDictionaryForServiceData();
}

uint64_t IDSiCloudUpdate()
{
  return _IDSiCloudUpdate();
}

uint64_t IMSingleObjectArray()
{
  return _IMSingleObjectArray();
}

uint64_t SBSCopyFrontmostApplicationDisplayIdentifier()
{
  return _SBSCopyFrontmostApplicationDisplayIdentifier();
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

uint64_t _ACDLogSystem()
{
  return __ACDLogSystem();
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
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__authController(void *a1, const char *a2, ...)
{
  return [a1 _authController];
}

id objc_msgSend__doesRelyOnCompanionAccounts(void *a1, const char *a2, ...)
{
  return [a1 _doesRelyOnCompanionAccounts];
}

id objc_msgSend__frontmostApplicationId(void *a1, const char *a2, ...)
{
  return [a1 _frontmostApplicationId];
}

id objc_msgSend__parametersForProxiedAuthentication(void *a1, const char *a2, ...)
{
  return [a1 _parametersForProxiedAuthentication];
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return [a1 _stripFZIDPrefix];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 accountTypeDescription];
}

id objc_msgSend_adamOrDisplayID(void *a1, const char *a2, ...)
{
  return [a1 adamOrDisplayID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return [a1 clientInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dirtyProperties(void *a1, const char *a2, ...)
{
  return [a1 dirtyProperties];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_proxiedDevice(void *a1, const char *a2, ...)
{
  return [a1 proxiedDevice];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_remoteDeviceProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceProxy];
}

id objc_msgSend_responseParameters(void *a1, const char *a2, ...)
{
  return [a1 responseParameters];
}

id objc_msgSend_serializedData(void *a1, const char *a2, ...)
{
  return [a1 serializedData];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusMessage(void *a1, const char *a2, ...)
{
  return [a1 statusMessage];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}