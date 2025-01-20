uint64_t sub_1EF4()
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
  v0 = qword_190C0;
  v5 = qword_190C0;
  if (!qword_190C0)
  {
    v6 = *(_OWORD *)off_144F8;
    v7 = *(_OWORD *)&off_14508;
    v3[3] = _sl_dlopen();
    qword_190C0 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_201C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_190C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_20AC()
{
  uint64_t v0 = sub_1EF4();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_2108()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_190C8;
  uint64_t v6 = qword_190C8;
  if (!qword_190C8)
  {
    v1 = (void *)sub_20AC();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    qword_190C8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21F8(uint64_t a1)
{
  v2 = (void *)sub_20AC();
  uint64_t result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_190C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2248()
{
  uint64_t v0 = (uint64_t (*)(void))sub_2108();
  if (v0)
  {
    return v0();
  }
  else
  {
    sub_BFDC();
    return sub_2278();
  }
}

uint64_t sub_2278()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_190D0;
  uint64_t v6 = qword_190D0;
  if (!qword_190D0)
  {
    v1 = (void *)sub_20AC();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    qword_190D0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_2368(uint64_t a1)
{
  v2 = (void *)sub_20AC();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_190D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23B8()
{
  uint64_t v0 = (uint64_t (*)(void))sub_2278();
  if (v0)
  {
    return v0();
  }
  else
  {
    uint64_t v2 = sub_BFDC();
    return sub_23E8(v2);
  }
}

id sub_23E8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_190D8;
  uint64_t v7 = qword_190D8;
  if (!qword_190D8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_24CC;
    v3[3] = &unk_14548;
    v3[4] = &v4;
    sub_24CC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_24CC(uint64_t a1)
{
  sub_20AC();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_190D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_C000();
    return (Class)sub_2524(v3);
  }
  return result;
}

uint64_t sub_2524()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_190E0;
  uint64_t v6 = qword_190E0;
  if (!qword_190E0)
  {
    id v1 = (void *)sub_20AC();
    v4[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierAppleID");
    qword_190E0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_25FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_2614(uint64_t a1)
{
  uint64_t v2 = (void *)sub_20AC();
  Class result = dlsym(v2, "BYFlowSkipIdentifierAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_190E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2664()
{
  uint64_t v0 = (void **)sub_2524();
  if (v0)
  {
    id v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = (void *)sub_BFDC();
    return +[AASetupAssistantService urlConfiguration];
  }
}

void sub_27E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_27FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_280C(uint64_t a1)
{
}

void sub_2814(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2B78(uint64_t a1)
{
  id v2 = +[AASetupAssistantService urlConfiguration];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2C94(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  id v3 = objc_alloc((Class)AASetupAssistantAuthenticateRequest);
  SEL v4 = *(void **)(a1 + 32);
  if (v2)
  {
    id v5 = [v3 initWithAccount:v4[5]];
    id v6 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [v6 addProvisioningInfoToAARequest:v5];
  }
  else
  {
    id v6 = [v4 appleID];
    uint64_t v7 = [*(id *)(a1 + 32) password];
    id v5 = [v3 initWithUsername:v6 password:v7];
  }
  [v5 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2DCC;
  v8[3] = &unk_14650;
  id v9 = *(id *)(a1 + 40);
  [v5 performRequestWithHandler:v8];
}

void sub_2DCC(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2E7C;
  v5[3] = &unk_14628;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_2E7C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 error];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_2F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  }
  return result;
}

void sub_30D4(id *a1)
{
  id v2 = [a1[4] mutableCopy];
  uint64_t v3 = [a1[5] appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [a1[5] password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = objc_alloc((Class)AASetupAssistantCreateRequest);
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = [v7 _signingSession];
  id v10 = [v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  v11 = (void *)*((void *)a1[5] + 5);
  if (v11)
  {
    v12 = objc_msgSend(v11, "aa_personID");

    if (v12)
    {
      id v13 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*((void *)a1[5] + 5)];
      [v13 addProvisioningInfoToAARequest:v10];
    }
  }
  [v10 setCookieStorage:*((void *)a1[5] + 6)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3298;
  v14[3] = &unk_14650;
  id v15 = a1[6];
  [v10 performRequestWithHandler:v14];
}

void sub_3298(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 statusCode] != (char *)&stru_158.reloff + 1)
  {
    if (!v6)
    {
      id v9 = 0;
      id v10 = 0;
      int v11 = 0;
      uint64_t v8 = v7;
      goto LABEL_13;
    }
    id v12 = v6;
    uint64_t v13 = [v12 status];
    if (v13
      && (v14 = (void *)v13,
          [v12 status],
          id v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 intValue],
          v15,
          v14,
          !v16))
    {
      id v10 = [v12 personID];
      id v9 = [v12 appleID];
      int v11 = 1;
    }
    else
    {
      id v10 = [v12 statusMessage];

      if (v10)
      {
        v17 = +[NSMutableDictionary dictionary];
        v18 = [v12 statusMessage];
        [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

        v19 = [v12 status];
        uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)[v19 intValue], v17);

        id v9 = 0;
        id v10 = 0;
        int v11 = 0;
        goto LABEL_12;
      }
      id v9 = 0;
      int v11 = 0;
    }
    uint64_t v8 = v7;
    goto LABEL_12;
  }
  uint64_t v8 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:401 userInfo:0];
  id v9 = 0;
  id v10 = 0;
  int v11 = 0;
  id v12 = v7;
LABEL_12:

LABEL_13:
  v20 = _AALogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109378;
    v21[1] = v11;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v21, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3654(id *a1)
{
  id v2 = [a1[4] mutableCopy];
  uint64_t v3 = [a1[5] appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [a1[5] password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v5 forKey:@"client-id"];

  id v6 = objc_alloc((Class)AASetupAssistantUpdateRequest);
  id v7 = a1[5];
  uint64_t v8 = v7[5];
  id v9 = [v7 _signingSession];
  id v10 = [v6 initWithAccount:v8 withAppleIDParameters:v2 signingSession:v9];

  int v11 = a1[5];
  if (v11[5])
  {
    id v12 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*((void *)a1[5] + 5)];
    [v12 addProvisioningInfoToAARequest:v10];

    int v11 = a1[5];
  }
  [v10 setCookieStorage:v11[6]];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_3804;
  v13[3] = &unk_14650;
  id v14 = a1[6];
  [v10 performRequestWithHandler:v13];
}

void sub_3804(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v21 = 0;
    unsigned int v16 = 0;
    int v22 = 0;
    v20 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v12 = [v11 status];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = [v11 status];
    unsigned int v15 = [v14 intValue];

    if (!v15)
    {
      unsigned int v16 = [v11 personID];
      v21 = [v11 appleID];
      int v22 = 1;
      goto LABEL_9;
    }
  }
  unsigned int v16 = [v11 statusMessage];

  if (!v16)
  {
    v21 = 0;
    int v22 = 0;
LABEL_9:
    v20 = v10;
    goto LABEL_10;
  }
  v17 = +[NSMutableDictionary dictionary];
  v18 = [v11 statusMessage];
  [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

  v19 = [v11 status];
  v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)[v19 intValue], v17);

  v21 = 0;
  unsigned int v16 = 0;
  int v22 = 0;
LABEL_10:

LABEL_11:
  v23 = _AALogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109378;
    v24[1] = v22;
    __int16 v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v24, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3B8C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setValue:*(void *)(a1 + 32) forKey:@"delegates"];
  uint64_t v3 = [*(id *)(a1 + 40) appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [*(id *)(a1 + 40) password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = [*(id *)(a1 + 40) emailChoice];
  [v2 setValue:v5 forKey:@"email-choice"];

  id v6 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v6 forKey:@"client-id"];

  id v7 = objc_alloc((Class)AASetupAssistantSetupDelegatesRequest);
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = [v8 _signingSession];
  id v11 = [v7 initWithAccount:v9 withSetupParameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }
  [v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3D78;
  v14[3] = &unk_14650;
  id v15 = *(id *)(a1 + 48);
  [v11 performRequestWithHandler:v14];
}

void sub_3D78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    v21 = 0;
    v20 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v12 = [v11 status];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [v11 status];
    unsigned int v15 = [v14 intValue];

    if (!v15)
    {
      v21 = [v11 responseParameters];
      goto LABEL_9;
    }
  }
  unsigned int v16 = [v11 statusMessage];

  if (!v16)
  {
    v21 = 0;
LABEL_9:
    v20 = v10;
    goto LABEL_10;
  }
  v17 = +[NSMutableDictionary dictionary];
  v18 = [v11 statusMessage];
  [v17 setObject:v18 forKey:NSLocalizedDescriptionKey];

  v19 = [v11 status];
  v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)[v19 intValue], v17);

  v21 = 0;
LABEL_10:

LABEL_11:
  int v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = v20;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters calling handler with error %@", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_40B8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setValue:*(void *)(a1 + 32) forKey:@"delegates"];
  uint64_t v3 = [*(id *)(a1 + 40) appleID];
  [v2 setValue:v3 forKey:@"apple-id"];

  id v4 = [*(id *)(a1 + 40) password];
  [v2 setValue:v4 forKey:@"password"];

  id v5 = [*(id *)(a1 + 40) emailChoice];
  [v2 setValue:v5 forKey:@"email-choice"];

  id v6 = +[AADeviceInfo appleIDClientIdentifier];
  [v2 setValue:v6 forKey:@"client-id"];

  id v7 = objc_alloc((Class)AALoginOrCreateDelegatesRequest);
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[5];
  id v10 = [v8 _signingSession];
  id v11 = [v7 initWithAccount:v9 parameters:v2 signingSession:v10];

  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(v12 + 40))
  {
    id v13 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*(void *)(*(void *)(a1 + 40) + 40)];
    [v13 addProvisioningInfoToAARequest:v11];

    uint64_t v12 = *(void *)(a1 + 40);
  }
  [v11 setCookieStorage:*(void *)(v12 + 48)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_42A4;
  v14[3] = &unk_14650;
  id v15 = *(id *)(a1 + 48);
  [v11 performRequestWithHandler:v14];
}

void sub_42A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v10 status];
    if (!v13
      || (id v14 = (void *)v13,
          [v10 status],
          id v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 intValue],
          v15,
          v14,
          uint64_t v12 = v11,
          v16))
    {
      v17 = [v10 statusMessage];

      uint64_t v12 = v11;
      if (v17)
      {
        NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
        v18 = [v10 statusMessage];
        __int16 v25 = v18;
        v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

        v20 = [v10 status];
        uint64_t v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", (int)[v20 intValue], v19);
      }
    }
  }
  v21 = _AALogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    int v23 = v12;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters calling completion handler with error %@", (uint8_t *)&v22, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_4544(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_46C4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)AASetupAssistantTermsFetchRequest) initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v3 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:*(void *)(*(void *)(a1 + 32) + 40)];
    [v3 addProvisioningInfoToAARequest:v2];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "setCustomHeaders:");
  }
  [v2 setCookieStorage:*(void *)(*(void *)(a1 + 32) + 48)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_47CC;
  v4[3] = &unk_14650;
  id v5 = *(id *)(a1 + 48);
  [v2 performRequestWithHandler:v4];
}

void sub_47CC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 xmlUIData];
    id v9 = _AALogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "We got the new iCloud Terms from the server", (uint8_t *)&v12, 2u);
      }
    }
    else if (v10)
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_4B5C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    id v9 = [v8 upgradeStatus];
    BOOL v10 = _AALogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "We got the upgrade status from the server", (uint8_t *)&v14, 2u);
      }

      (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v9 BOOLValue], v7);
    }
    else
    {
      if (v11)
      {
        id v13 = [v8 responseDictionary];
        int v14 = 138412546;
        id v15 = v7;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status failed with error: %@ response: %@", (uint8_t *)&v14, 0x16u);
      }
      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, v7);
    }
  }
  else
  {
    int v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status got no response and error: %@", (uint8_t *)&v14, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_533C()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_190F0;
  uint64_t v5 = qword_190F0;
  if (!qword_190F0)
  {
    long long v6 = *(_OWORD *)off_146E8;
    long long v7 = *(_OWORD *)&off_146F8;
    v3[3] = _sl_dlopen();
    qword_190F0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5464(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_190F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_54F4()
{
  uint64_t v0 = sub_533C();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_5550()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_190F8;
  uint64_t v7 = qword_190F8;
  if (!qword_190F8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_5634;
    v3[3] = &unk_14548;
    v3[4] = &v4;
    sub_5634((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_5634(uint64_t a1)
{
  sub_54F4();
  Class result = objc_getClass("GKPlayerInternal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_190F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_C028();
    return (Class)sub_568C();
  }
  return result;
}

id sub_568C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_19100;
  uint64_t v7 = qword_19100;
  if (!qword_19100)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_5770;
    v3[3] = &unk_14548;
    v3[4] = &v4;
    sub_5770((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_5758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AAGKAuthenticationPlugin *sub_5770(uint64_t a1)
{
  sub_54F4();
  Class result = (AAGKAuthenticationPlugin *)objc_getClass("GKPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_19100 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_C050();
    return [(AAGKAuthenticationPlugin *)v3 init];
  }
  return result;
}

void sub_5B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_5BB4()
{
  if (qword_19120 != -1) {
    dispatch_once(&qword_19120, &stru_14B80);
  }
  uint64_t v0 = (void *)qword_19118;
  return v0;
}

void sub_5C08(uint64_t a1)
{
  uint64_t v2 = sub_5BB4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "We timed out waiting on the server", v3, 2u);
  }

  [*(id *)(a1 + 32) cancelAllOperations];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_5C84(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = [v3 error];
  if (!v3)
  {
    uint64_t v6 = sub_5BB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_C0E0();
    }
    goto LABEL_7;
  }
  uint64_t v5 = sub_5BB4();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_C148();
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
  v11[2] = sub_5E30;
  v11[3] = &unk_14738;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v9;
  uint64_t v13 = v10;
  [v7 saveVerifiedAccount:v8 withCompletionHandler:v11];

LABEL_11:
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_5E30(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = sub_5BB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_C1B0();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5F20(id a1)
{
  qword_19108 = (uint64_t)[objc_alloc((Class)NSSet) initWithArray:&off_15398];
  _objc_release_x1();
}

uint64_t sub_62B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_679C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_67AC(uint64_t a1, int a2)
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

uint64_t sub_67D0(uint64_t a1, int a2)
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

void sub_6998(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_5BB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_C454();
    }

    [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    if (v8)
    {
      id v9 = sub_5BB4();
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
      BOOL v11 = [v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey];
      id v12 = [v11 allKeys];

      if ([*(id *)(a1 + 56) count]
        && [v12 count]
        && (+[NSSet setWithArray:*(void *)(a1 + 56)],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            +[NSSet setWithArray:v12],
            int v14 = objc_claimAutoreleasedReturnValue(),
            unsigned int v15 = [v13 isSubsetOfSet:v14],
            v14,
            v13,
            v15))
      {
        __int16 v16 = sub_5BB4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Password-less auth returned all the requested tokens!", (uint8_t *)&v18, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        v17 = sub_5BB4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_C420();
        }

        [*(id *)(a1 + 32) _tryPasswordLoginWithAccount:*(void *)(a1 + 40) store:*(void *)(a1 + 48) services:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
      }
    }
  }
}

void sub_6EA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _beginPETBasedLoginWithAccount:*(void *)(a1 + 40) PET:a2 store:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = sub_5BB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_C5C0();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_71DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_5BB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_C628();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = [a2 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    uint64_t v8 = sub_5BB4();
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

id sub_75E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2) {
    return [*(id *)(a1 + 32) _handleRenewFailure:a3 forAccount:*(void *)(a1 + 40) accountStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_7904(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_79A8;
  v6[3] = &unk_148B8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _beginPETBasedLoginWithAccount:v4 PET:a2 store:v5 completion:v6];
}

uint64_t sub_79A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_79CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_5BB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_C760();
    }

    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:kACRenewCredentialsServicesKey];
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) username];
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 48), "aa_altDSID");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7B2C;
    v9[3] = &unk_14908;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    [v6 _convertPasswordToPETForAppleID:v7 altDSID:v8 password:v3 services:v5 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_7B2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_5BB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: Password from companion was successfully exchanged for PET. Logging in...", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_8078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8094(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 56))
  {
    uint64_t v9 = sub_5BB4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_C93C();
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
    unsigned int v15 = sub_5BB4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_C8CC();
    }
    goto LABEL_17;
  }
  if (!v7)
  {
    unsigned int v15 = sub_5BB4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_C830();
    }
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v14 = sub_5BB4();
  unsigned int v15 = v14;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_C864();
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

void sub_82D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8608(uint64_t a1, int a2, void *a3)
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
      id v8 = sub_5BB4();
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
      id v12 = sub_5BB4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_C970();
      }
    }
LABEL_17:
    id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_18;
  }
  id v7 = sub_5BB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Auth was bad, re-authenticate...", buf, 2u);
  }

  [*(id *)(a1 + 32) _authenticateAccount:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
LABEL_19:
}

void sub_8B74(uint64_t a1)
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
    id v7 = sub_5BB4();
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
    uint64_t v16 = sub_5BB4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_CA40(a1 + 72, v16, v17, v18, v19, v20, v21, v22);
    }

    [v2 setServiceIdentifiers:*(void *)(a1 + 72)];
    [v2 setShouldUpdatePersistentServiceTokens:1];
  }
  int v23 = sub_5BB4();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_CA0C();
  }
  BOOL v24 = v6 != 0;

  __int16 v25 = [*(id *)(a1 + 80) _authController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_8F94;
  v29[3] = &unk_149F8;
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

void sub_8F94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && *(unsigned char *)(a1 + 96))
  {
    id v7 = sub_5BB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_CAB0();
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    [*(id *)(a1 + 40) _authenticateAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 48) options:*(void *)(a1 + 56) errorMessage:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_9240;
    v23[3] = &unk_149A8;
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
    v16[2] = sub_93B0;
    v16[3] = &unk_149D0;
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

void sub_9224(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_9240(uint64_t a1, uint64_t a2, void *a3)
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
    id v11 = sub_5BB4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_CB18(a1, v11, v12, v13, v14, v15, v16, v17);
    }

    id v18 = [*(id *)(a1 + 56) _userInfoForRenewCredentialsFollowUpWithAccountStore:*(void *)(a1 + 64) proxiedDevice:*(void *)(a1 + 72)];
    if (WeakRetained) {
      [WeakRetained[3] postFollowUpWithIdentifier:AAFollowUpIdentifierRenewCredentials forAccount:*(void *)(a1 + 48) userInfo:v18 completion:0];
    }
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

id sub_93B0(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_5BB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: Continue authenticating...", v10, 2u);
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

uint64_t sub_9468(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9968(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_5BB4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: loginDelegates succeeded!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: loginDelegates failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_9C1C(uint64_t a1)
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

void sub_9F7C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_5BB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v14[0]) = a2;
    WORD2(v14[0]) = 2112;
    *(void *)((char *)v14 + 6) = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: saving raw password result was %d. Error: %@", buf, 0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    BOOL v7 = sub_5BB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14[0] = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin setting raw password for iCloud account %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_aa_setRawPassword:", *(void *)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_A128;
    v11[3] = &unk_148B8;
    unsigned int v10 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v10 saveVerifiedAccount:v9 withCompletionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_A128(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_5BB4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAGKAuthenticationPlugin: saving raw password result was %d. Error: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A428(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [v7 status];
  id v9 = [v8 integerValue];

  if (v6 || v9)
  {
    uint64_t v15 = [v7 statusMessage];

    if (v15)
    {
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      id v25 = v15;
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v17 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:v9 userInfo:v16];

      id v6 = (id)v17;
    }
    id v18 = [*(id *)(a1 + 32) credential];
    [v18 setPassword:0];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    unsigned int v10 = *(void **)(a1 + 40);
    id v11 = [v7 responseParameters];

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_A640;
    v19[3] = &unk_14AC0;
    id v20 = v13;
    id v21 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v22 = 0;
    id v23 = v14;
    [v10 _processAuthenticationResponseParameters:v11 accountStore:v12 account:v20 completion:v19];

    id v6 = v20;
  }
}

uint64_t sub_A640(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) objectID];

  if (v3)
  {
    id v4 = [*v2 dirtyProperties];
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = sub_5BB4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_CB88(v2);
      }
    }
    [*(id *)(a1 + 32) refresh];
    id v7 = +[ACDKeychainManager credentialForAccount:*(void *)(a1 + 32) clientID:0];
    [v7 setPassword:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCredential:v7];
  }
  __int16 v8 = sub_5BB4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Completed storing tokens", v10, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_B794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose((const void *)(v67 - 176), 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B7FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B80C(uint64_t a1)
{
}

void sub_B814(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  __int16 v8 = [v7 username];
  unsigned int v9 = [v8 isEqualToString:a1[4]];

  if (v9)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    unsigned int v10 = sub_5BB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_D160(v7, v10);
    }

    *a4 = 1;
  }
  if (a1[5])
  {
    id v11 = [v7 accountPropertyForKey:@"altDSID"];
    unsigned int v12 = [v11 isEqualToString:a1[5]];

    if (v12)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
      uint64_t v13 = sub_5BB4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_D0D0();
      }

      *a4 = 1;
    }
  }
  if (a1[6])
  {
    id v14 = [v7 accountPropertyForKey:@"dsid"];
    unsigned int v15 = [v14 isEqualToString:a1[6]];

    if (v15)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
      uint64_t v16 = sub_5BB4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_D040();
      }

      *a4 = 1;
    }
  }
}

void sub_B9F0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 credential];
  id v5 = [v4 token];

  if (v5)
  {
    if (([v5 isEqualToString:@"<gone>"] & 1) == 0)
    {
      id v6 = +[NSNumber numberWithInteger:a1[6]];
      id v7 = +[NSString stringWithFormat:@"GKCredentialScope-%@", v6];
      __int16 v8 = [v3 accountPropertyForKey:v7];
      unsigned __int8 v9 = [v8 unsignedIntegerValue];

      if ((v9 & 4) != 0)
      {
        unsigned int v10 = sub_5BB4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_D1EC(v3, v10);
        }

        *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
      }
    }
  }
}

void sub_BB24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_5BB4();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_D304();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_D278(a1, v6);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_BBB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_5BB4();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_D304();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) shortDebugName];
    int v8 = 138412290;
    unsigned __int8 v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Saving the game center account %@ succeeded.", (uint8_t *)&v8, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_BDFC(id a1)
{
  qword_19118 = (uint64_t)os_log_create("com.apple.appleaccount", "gamecenter");
  _objc_release_x1();
}

void sub_BE40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_BE5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_BE90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_BEAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_BEC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_BEF8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_BF18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_BF38(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

void sub_BF88(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_BFA8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_BFDC()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_C000(v0);
}

uint64_t sub_C000()
{
  uint64_t v0 = abort_report_np();
  return sub_C028(v0);
}

void sub_C028()
{
}

void sub_C050()
{
}

void sub_C078()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "\"Checking if client (%@) is entitled.\"", v2, v3, v4, v5, v6);
}

void sub_C0E0()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Something went wrong and we couldn't contact the server. %@", v2, v3, v4, v5, v6);
}

void sub_C148()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Got an error, may still be in Gray Mode. %@", v2, v3, v4, v5, v6);
}

void sub_C1B0()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Failed to save account after marking it as not in gray mode anymore. %@", v2, v3, v4, v5, v6);
}

void sub_C218()
{
  sub_BF4C();
  uint64_t v1 = [v0 accountType];
  uint64_t v2 = [v1 accountTypeDescription];
  sub_BEE0();
  sub_BEF8(&dword_0, v3, v4, "Unable to get credential for %@ account! Error = %@", v5, v6, v7, v8, v9);
}

void sub_C2B4()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "Logging in with account %@....", v2, v3, v4, v5, v6);
}

void sub_C31C()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "AAGKAuthenticationPlugin will use provided options for login.", v2, v3, v4, v5, v6);
}

void sub_C350()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Device relies on companion auth, proceeding...", v2, v3, v4, v5, v6);
}

void sub_C384()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Device suppoprts standalone auth, proceeding...", v2, v3, v4, v5, v6);
}

void sub_C3B8()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "Trying password-less login with account %@ with the help of Companion's Anisette data.", v2, v3, v4, v5, v6);
}

void sub_C420()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Password-less auth appeared to succeed, but auth results do not have a value for AKAuthenticationPasswordKey or AKAuthenticationIDMSTokenKey!", v2, v3, v4, v5, v6);
}

void sub_C454()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Oops, something went wrong with password-less auth! %@", v2, v3, v4, v5, v6);
}

void sub_C4BC()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "_tryPasswordLoginWithAccount: we do not have a password for %@. Login has officially failed.", v2, v3, v4, v5, v6);
}

void sub_C524()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "Trying password-based login for account %@...", v2, v3, v4, v5, v6);
}

void sub_C58C()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Missing rp for account, checking in pk...", v2, v3, v4, v5, v6);
}

void sub_C5C0()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Both password-less and password auth have failed. Login has officially failed. Error: %@", v2, v3, v4, v5, v6);
}

void sub_C628()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Oops, something went wrong with password-based auth! %@", v2, v3, v4, v5, v6);
}

void sub_C690()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Failed to encode AKDevice! Proxied auth is doomed.", v2, v3, v4, v5, v6);
}

void sub_C6C4()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Auth is not permitted at this time. Not calling companion for password.", v2, v3, v4, v5, v6);
}

void sub_C6F8()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Auth is not continuable at this time, not calling companion for password. Error: %@", v2, v3, v4, v5, v6);
}

void sub_C760()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "AAGKAuthenticationPlugin: Exchanging raw password from companion for PET...", v2, v3, v4, v5, v6);
}

void sub_C794()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Can't get password from companion, told to avoid UI", v2, v3, v4, v5, v6);
}

void sub_C7C8()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "CFUserNotificationCreate in renewCredentials!", v2, v3, v4, v5, v6);
}

void sub_C7FC()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Showing renew-credentials prompt...", v2, v3, v4, v5, v6);
}

void sub_C830()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "ACRemoteDeviceProxy reports that renewCredentials succeeded, but no password is in the response!", v2, v3, v4, v5, v6);
}

void sub_C864()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "ACRemoteDeviceProxy reports that renewCredentials succeeded, but response is not a string! %@", v2, v3, v4, v5, v6);
}

void sub_C8CC()
{
  sub_BFC8();
  sub_BF88(&dword_0, v0, v1, "Failed to obtain a password from ACRemoteDeviceProxy for account %@! Error: %@");
}

void sub_C93C()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Dismissing renew-credentials prompt.", v2, v3, v4, v5, v6);
}

void sub_C970()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Failing due to out of date terms...", v2, v3, v4, v5, v6);
}

void sub_C9A4()
{
  sub_BF58();
  sub_BF88(&dword_0, v0, v1, "Error! Invalid value type for key %@ in renewCredentials options: %@.");
}

void sub_CA0C()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Calling out to AKAppleIDAuthenticationController...", v2, v3, v4, v5, v6);
}

void sub_CA40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CAB0()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "AppleIDAuthenticationPlugin: auth with cached password failed %@. Clearing and retrying...", v2, v3, v4, v5, v6);
}

void sub_CB18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CB88(id *a1)
{
  uint64_t v7 = [*a1 dirtyProperties];
  sub_BF18(&dword_0, v1, v2, "AAGKAuthenticationPlugin about to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties, which might spell t-r-o-u-b-l-e: %@ %@", v3, v4, v5, v6, 2u);
}

void sub_CC2C()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Not creating/modifying account if device/account is restricted", v2, v3, v4, v5, v6);
}

void sub_CC60()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "GKAuth:telling authkit account is in use using DSID:%@", v2, v3, v4, v5, v6);
}

void sub_CCC8()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "GKAuth:telling authkit account is in use using altDSID:%@", v2, v3, v4, v5, v6);
}

void sub_CD30(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_BEC8(&dword_0, a3, (uint64_t)a3, "All account properties: %@", (uint8_t *)a2);
}

void sub_CD80()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "Non production environment, set account property", v2, v3, v4, v5, v6);
}

void sub_CDB4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_BEC8(&dword_0, a3, (uint64_t)a3, "Updating token for account %@", (uint8_t *)a2);
}

void sub_CE04()
{
  sub_BE84();
  sub_BE5C(&dword_0, v0, v1, "No existing primary GC account found.", v2, v3, v4, v5, v6);
}

void sub_CE38()
{
  sub_BFC8();
  sub_BFA8(&dword_0, v0, v1, "Looked at the existing account. We want to create a new GC account (%@), and existingPrimaryAccount is %@");
}

void sub_CED4()
{
  sub_BE78();
  sub_BEAC(&dword_0, v0, v1, "Looking for GC account with username: %@", v2, v3, v4, v5, v6);
}

void sub_CF3C()
{
  sub_BF58();
  sub_BFA8(&dword_0, v0, v1, "Processing account (%@) with parameters (%@).");
}

void sub_CFA4()
{
  sub_BE84();
  sub_BE90(&dword_0, v0, v1, "Not creating/modifying account if incoming account is not of type AppleAccount", v2, v3, v4, v5, v6);
}

void sub_CFD8()
{
  sub_BE78();
  sub_BE40(&dword_0, v0, v1, "Failed to process account parameters: %@", v2, v3, v4, v5, v6);
}

void sub_D040()
{
  sub_BF4C();
  uint64_t v1 = [v0 username];
  sub_BF70();
  sub_BF18(&dword_0, v2, v3, "Found a gamecenter ACAccount (%@) with same dsid than incoming account:%@", v4, v5, v6, v7, v8);
}

void sub_D0D0()
{
  sub_BF4C();
  uint64_t v1 = [v0 username];
  sub_BF70();
  sub_BF18(&dword_0, v2, v3, "Found a gamecenter ACAccount (%@) with same altDSID than incoming account:%@", v4, v5, v6, v7, v8);
}

void sub_D160(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 username];
  sub_BE78();
  sub_BEC8(&dword_0, a2, v4, "Will populate existing account '%@' with production token", v5);
}

void sub_D1EC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 username];
  sub_BE78();
  sub_BEC8(&dword_0, a2, v4, "Existing primary production account '%@'", v5);
}

void sub_D278(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_BF38(a1) shortDebugName];
  sub_BE78();
  sub_BEC8(&dword_0, a2, v4, "Saving the game center account %@ succeeded.", v5);
}

void sub_D304()
{
  sub_BF4C();
  uint64_t v1 = [(id)sub_BF38(v0) shortDebugName];
  sub_BEE0();
  sub_BEF8(&dword_0, v2, v3, "Saving the game center account %@ failed. Error: %@", v4, v5, v6, v7, v8);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

id objc_msgSend__gkPlayerInternal(void *a1, const char *a2, ...)
{
  return [a1 _gkPlayerInternal];
}

id objc_msgSend__parametersForProxiedAuthentication(void *a1, const char *a2, ...)
{
  return [a1 _parametersForProxiedAuthentication];
}

id objc_msgSend__signingSession(void *a1, const char *a2, ...)
{
  return [a1 _signingSession];
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

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_appleIDClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appleIDClientIdentifier];
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dirtyProperties(void *a1, const char *a2, ...)
{
  return [a1 dirtyProperties];
}

id objc_msgSend_emailChoice(void *a1, const char *a2, ...)
{
  return [a1 emailChoice];
}

id objc_msgSend_eraseProvisioning(void *a1, const char *a2, ...)
{
  return [a1 eraseProvisioning];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAccountModificationRestricted(void *a1, const char *a2, ...)
{
  return [a1 isAccountModificationRestricted];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isGameCenterRestricted(void *a1, const char *a2, ...)
{
  return [a1 isGameCenterRestricted];
}

id objc_msgSend_isProfileModificationRestricted(void *a1, const char *a2, ...)
{
  return [a1 isProfileModificationRestricted];
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

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_personID(void *a1, const char *a2, ...)
{
  return [a1 personID];
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

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return [a1 responseDictionary];
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

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_shortDebugName(void *a1, const char *a2, ...)
{
  return [a1 shortDebugName];
}

id objc_msgSend_signingSessionCertURL(void *a1, const char *a2, ...)
{
  return [a1 signingSessionCertURL];
}

id objc_msgSend_signingSessionURL(void *a1, const char *a2, ...)
{
  return [a1 signingSessionURL];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_statusMessage(void *a1, const char *a2, ...)
{
  return [a1 statusMessage];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_upgradeStatus(void *a1, const char *a2, ...)
{
  return [a1 upgradeStatus];
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return [a1 urlConfiguration];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_xmlUIData(void *a1, const char *a2, ...)
{
  return [a1 xmlUIData];
}