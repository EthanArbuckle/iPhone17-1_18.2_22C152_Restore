uint64_t sub_2427A6B08()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;
  uint64_t v8;

  v8 = *MEMORY[0x263EF8340];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_268D574A8;
  v5 = qword_268D574A8;
  if (!qword_268D574A8)
  {
    v6 = xmmword_26516DB48;
    v7 = *(_OWORD *)&off_26516DB58;
    v3[3] = _sl_dlopen();
    qword_268D574A8 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2427A6C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2427A6C30(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268D574A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2427A6CC0()
{
  v1 = 0;
  uint64_t result = sub_2427A6B08();
  if (!result) {
    sub_2427AA044(&v1);
  }
  return result;
}

uint64_t sub_2427A6D14()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_268D574B0;
  uint64_t v6 = qword_268D574B0;
  if (!qword_268D574B0)
  {
    v1 = (void *)sub_2427A6CC0();
    v4[3] = (uint64_t)dlsym(v1, "DSSourceNamePassKeys");
    qword_268D574B0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2427A6DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_2427A6E04(uint64_t a1)
{
  v2 = (void *)sub_2427A6CC0();
  uint64_t result = dlsym(v2, "DSSourceNamePassKeys");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268D574B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2427A701C()
{
  if (qword_268D574C0 != -1) {
    dispatch_once(&qword_268D574C0, &unk_26F850088);
  }
  return qword_268D574B8;
}

uint64_t sub_2427A7060()
{
  qword_268D574B8 = (uint64_t)os_log_create("com.apple.SafariShared.PasswordsDigitalSeparation", "PasswordsSeparation");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2427A756C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__passwordsParticipantWithParticipant_);
}

void sub_2427A7A68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2427A7B2C;
  block[3] = &unk_26516DC10;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t sub_2427A7B2C(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = sub_2427A701C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2427AA1A8(a1, v3, v2);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_2427A7CDC(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2427A7DB4;
  v6[3] = &unk_26516DC60;
  id v7 = v4;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t sub_2427A7DB4(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = sub_2427A701C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2427AA264(a1, v3, v2);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_2427A7FE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_2427A7FF8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2427A80C4;
  v7[3] = &unk_26516DCB0;
  uint64_t v6 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  [v6 _stopSharingWithGroup:v4 completionHandler:v7];
}

void sub_2427A80C4(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 32) addObject:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  id v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void sub_2427A8140(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F083F0];
    id v5 = (void *)[*(id *)(a1 + 32) copy];
    v11[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v7 = [v4 errorWithDomain:@"com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain" code:2 userInfo:v6];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v7);
  }
  else
  {
    id v8 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v9 = *(void *)(a1 + 40);
    v8(v9, 0);
  }
}

void sub_2427A8338(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    dispatch_group_t v7 = dispatch_group_create();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2810000000;
    v22[3] = &unk_2427AB743;
    int v23 = 0;
    id v8 = [MEMORY[0x263EFF980] array];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2427A8530;
    v17[3] = &unk_26516DD28;
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    v18 = v9;
    uint64_t v19 = v10;
    v21 = v22;
    id v11 = v8;
    id v20 = v11;
    [v5 enumerateObjectsUsingBlock:v17];
    v12 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2427A86AC;
    block[3] = &unk_26516DD00;
    id v15 = v11;
    id v16 = *(id *)(a1 + 40);
    id v13 = v11;
    dispatch_group_notify(v9, v12, block);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_2427A8518(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_2427A8530(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  id v5 = *(void **)(a1 + 40);
  id v6 = [v4 second];
  dispatch_group_t v7 = [v4 first];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2427A8630;
  v9[3] = &unk_26516DCB0;
  id v8 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v10 = v8;
  id v11 = *(id *)(a1 + 32);
  [v5 _stopSharingWithParticipant:v6 inGroup:v7 completionHandler:v9];
}

void sub_2427A8630(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [*(id *)(a1 + 32) addObject:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  id v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void sub_2427A86AC(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F083F0];
    id v5 = (void *)[*(id *)(a1 + 32) copy];
    v11[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    dispatch_group_t v7 = [v4 errorWithDomain:@"com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain" code:2 userInfo:v6];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v7);
  }
  else
  {
    id v8 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v9 = *(void *)(a1 + 40);
    v8(v9, 0);
  }
}

void sub_2427A88C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    dispatch_group_t v7 = [MEMORY[0x263EFF980] array];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = sub_2427A8A1C;
    id v15 = &unk_26516DDA0;
    id v16 = *(id *)(a1 + 32);
    id v17 = v7;
    id v8 = v7;
    [v5 enumerateObjectsUsingBlock:&v12];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    if (v6)
    {
      id v11 = sub_2427A701C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_2427AA358(v11);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_2427A8A1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 participants];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2427A8B08;
  v7[3] = &unk_26516DD78;
  id v8 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v7);

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F662E0]) initWithFirst:v3 second:v5];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t sub_2427A8B08(uint64_t a1, void *a2)
{
  id v3 = [a2 handle];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_2427A8E28(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2427A8F00;
  v5[3] = &unk_26516DDC8;
  id v6 = v3;
  id v7 = a1[4];
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void sub_2427A8F00(void *a1)
{
  uint64_t v2 = (id *)(a1 + 4);
  if (a1[4])
  {
    id v3 = sub_2427A701C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2427AA454((uint64_t)a1, v3, v2);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v4 = [MEMORY[0x263F663B0] sharedStore];
    [v4 _recordGroupIdentifierForExitCleanup:a1[6] completionHandler:a1[7]];
  }
}

void sub_2427A910C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2427A9224;
    v9[3] = &unk_26516DE18;
    void v9[4] = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v6)
    {
      id v8 = sub_2427A701C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_2427AA358(v8);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2427A9224(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__passwordsGroupWithGroup_);
}

void sub_2427A9508(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2427A95F8;
  block[3] = &unk_26516DE68;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_2427A95F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 56);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2427A96EC;
    v5[3] = &unk_26516DE40;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 64);
    [v3 _stopSharingWithGroup:v2 completionHandler:v5];
  }
  else
  {
    id v4 = sub_2427A701C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2427AA57C(a1, v4);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_2427A96EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_2427A701C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2427AA61C(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2427A9A20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_2427A701C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2427AA72C(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2427A9BD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2427A9CD8;
    v9[3] = &unk_26516DEB8;
    id v7 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v7 _stopSharingWithGroups:v5 completionHandler:v9];
  }
  else
  {
    if (v6)
    {
      id v8 = sub_2427A701C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_2427AA358(v8);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_2427A9CD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_2427A701C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2427AA7D0(v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2427A9E18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2427A9EF0;
  block[3] = &unk_26516DF00;
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_2427A9EF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_filterObjectsUsingBlock:", &unk_26F8500A8);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL sub_2427A9F58(uint64_t a1, void *a2)
{
  id v2 = [a2 currentUserParticipant];
  BOOL v3 = [v2 inviteStatus] == 2;

  return v3;
}

void sub_2427A9FA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2427A9FD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2427A9FF8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_2427AA018()
{
  return v0;
}

void sub_2427AA024(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2427AA044(void *a1)
{
  id v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *DigitalSeparationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DigitalSeparationSoftLink.m", 5, @"%s", *a1);

  __break(1u);
}

void sub_2427AA0C4()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"typeof (((typeof (DSSourceNamePassKeys) (*)(void))0)()) getDSSourceNamePassKeys(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DigitalSeparationSoftLink.m", 6, @"%s", dlerror());

  __break(1u);
}

void sub_2427AA13C()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_2427A9FEC();
  sub_2427A9FD4(&dword_2427A5000, v0, v1, "Falling back to email address for unknown participant handle: %@", v2);
}

void sub_2427AA1A8(uint64_t a1, void *a2, id *a3)
{
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 groupID];
  id v7 = objc_msgSend(*a3, "safari_privacyPreservingDescription");
  sub_2427A9FC4();
  sub_2427AA024(&dword_2427A5000, v8, v9, "Failed to remove participants from group (%@): %@", v10, v11, v12, v13, 2u);
}

void sub_2427AA264(uint64_t a1, void *a2, id *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 handle];
  uint64_t v8 = [*(id *)(a1 + 48) groupID];
  uint64_t v9 = objc_msgSend(*a3, "safari_privacyPreservingDescription");
  int v10 = 138412802;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_error_impl(&dword_2427A5000, v6, OS_LOG_TYPE_ERROR, "Failed to remove participant (%@) from group (%@): %@", (uint8_t *)&v10, 0x20u);
}

void sub_2427AA358(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)sub_2427AA018(), "safari_privacyPreservingDescription");
  sub_2427A9FEC();
  sub_2427A9FA4(&dword_2427A5000, v4, v5, "Failed to fetch groups: %@", v6, v7, v8, v9, v10);
}

void sub_2427AA3E8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_2427A9FEC();
  sub_2427A9FD4(&dword_2427A5000, v0, v1, "Failed to copy contributed items back to My Passwords from group: %@", v2);
}

void sub_2427AA454(uint64_t a1, void *a2, id *a3)
{
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 groupID];
  uint64_t v7 = objc_msgSend(*a3, "safari_privacyPreservingDescription");
  sub_2427A9FC4();
  sub_2427AA024(&dword_2427A5000, v8, v9, "Failed to leave group (%@): %@", v10, v11, v12, v13, 2u);
}

void sub_2427AA510()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_2427A9FEC();
  sub_2427A9FD4(&dword_2427A5000, v0, v1, "Invalid resource: %@", v2);
}

void sub_2427AA57C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)sub_2427AA018(), "safari_privacyPreservingDescription");
  sub_2427A9FC4();
  sub_2427A9FF8(&dword_2427A5000, v5, v6, "Failed to fetch group (%@): %@", v7, v8, v9, v10, 2u);
}

void sub_2427AA61C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)sub_2427AA018(), "safari_privacyPreservingDescription");
  sub_2427A9FC4();
  sub_2427A9FF8(&dword_2427A5000, v5, v6, "Failed to stop sharing with group (%@): %@", v7, v8, v9, v10, 2u);
}

void sub_2427AA6C0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_2427A9FEC();
  sub_2427A9FD4(&dword_2427A5000, v0, v1, "Invalid participant: %@", v2);
}

void sub_2427AA72C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)sub_2427AA018(), "safari_privacyPreservingDescription");
  sub_2427A9FC4();
  sub_2427A9FF8(&dword_2427A5000, v5, v6, "Failed to stop sharing with participant (%@): %@", v7, v8, v9, v10, 2u);
}

void sub_2427AA7D0(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)sub_2427AA018(), "safari_privacyPreservingDescription");
  sub_2427A9FEC();
  sub_2427A9FA4(&dword_2427A5000, v4, v5, "Failed to stop all sharing: %@", v6, v7, v8, v9, v10);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}