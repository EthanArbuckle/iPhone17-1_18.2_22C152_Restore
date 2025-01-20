uint64_t sub_23975A1F4(uint64_t a1)
{
  uint64_t vars8;

  [*(id *)(a1 + 32) handleSUCase];
  qword_268A00E70 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23975A58C()
{
  qword_268A00E80 = objc_alloc_init(SystemHealthUI);

  return MEMORY[0x270F9A758]();
}

void sub_23975AAC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23975AAE0(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = sub_23975B46C;
  v71 = sub_23975B47C;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_23975B46C;
  v65 = sub_23975B47C;
  id v66 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  v4 = (const char *)[@"apple.com" UTF8String];
  v5 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x263EFFB08], v4);
  v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(v5, &flags))
  {
    SCNetworkReachabilityFlags v7 = flags;
    v8 = sub_239773918(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v74 = (v7 & 2) >> 1;
      _os_log_impl(&dword_239757000, v8, OS_LOG_TYPE_DEFAULT, "Network reachability: %d", buf, 8u);
    }

    int v9 = (v7 >> 1) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  CFRelease(v6);
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.corerepair.intentControl" options:0];
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26ECEC7D0];
    [v10 setRemoteObjectInterface:v11];

    [v10 resume];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_23975B484;
    v55[3] = &unk_264DA0240;
    v55[4] = &v61;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v55];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = sub_23975B4F8;
    v54[3] = &unk_264DA0268;
    v54[4] = &v67;
    v54[5] = &v61;
    v54[6] = &v57;
    [v12 getRepairTicket:v54];

    if (*((unsigned char *)v58 + 24) && (v13 = (void *)v68[5]) != 0 && [v13 length] && !v62[5])
    {
      [*(id *)(a1 + 40) performInteractiveMiniPreflight];
      v39 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
      v53 = [v39 objectForKey:@"tempPreflightResults"];

      v40 = [MEMORY[0x263F37E40] spcResults:v53];
      v41 = [v40 objectForKeyedSubscript:@"sealed"];
      v52 = [v40 objectForKeyedSubscript:@"pass"];
      v32 = (void *)[v52 mutableCopy];
      if (v41 && [v41 count]) {
        [v32 addObject:@"RECOVER"];
      }
      if (v32 && [v32 count])
      {
        v42 = sub_239773918(0);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_239757000, v42, OS_LOG_TYPE_DEFAULT, "Proceeding with bootIntent reboot", buf, 2u);
        }

        v43 = [v10 remoteObjectProxy];
        v44 = [MEMORY[0x263EFF960] currentLocale];
        v45 = [v44 localeIdentifier];
        [v43 setBootIntentAndRebootToCheckerboardWithLocale:v45 reply:&unk_26ECC93D8];
      }
      else
      {
        v46 = (void *)MEMORY[0x263F82418];
        v47 = [*(id *)(a1 + 32) localizedStringWithKey:@"NOT_AVAILABLE" defaultString:@"NOT_AVAILABLE"];
        v48 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"TRY_AGAIN_LATER_DESC" defaultString:@"TRY_AGAIN_LATER_DESC"];
        v43 = [v46 alertControllerWithTitle:v47 message:v48 preferredStyle:1];

        v49 = (void *)MEMORY[0x263F82400];
        v50 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"OK" defaultString:@"OK"];
        v51 = [v49 actionWithTitle:v50 style:1 handler:0];
        [v43 addAction:v51];

        [*(id *)(a1 + 40) presentViewController:v43 animated:1 completion:0];
        [*(id *)(a1 + 40) configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 48) setEnabled:0];
      }
    }
    else
    {
      v14 = sub_239773918(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_239757000, v14, OS_LOG_TYPE_DEFAULT, "OS Update required to proceed", buf, 2u);
      }

      v15 = (void *)MEMORY[0x263F82418];
      v16 = [*(id *)(a1 + 32) localizedStringWithKey:@"SOFTWARE_UPDATE_REQUIRED" defaultString:@"SOFTWARE_UPDATE_REQUIRED"];
      uint64_t v17 = *(void *)(a1 + 40);
      v18 = *(void **)(v17 + 1424);
      if (*(_DWORD *)(v17 + 1432) == 3) {
        [v18 localizedStringWithKey:@"SOFTWARE_UPDATE_DESC_IPAD" defaultString:@"SOFTWARE_UPDATE_DESC_IPAD"];
      }
      else {
      v31 = [v18 localizedStringWithKey:@"SOFTWARE_UPDATE_DESC" defaultString:@"SOFTWARE_UPDATE_DESC"];
      }
      v32 = [v15 alertControllerWithTitle:v16 message:v31 preferredStyle:1];

      v33 = (void *)MEMORY[0x263F82400];
      v34 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"SOFTWARE_UPDATE" defaultString:@"SOFTWARE_UPDATE"];
      v35 = [v33 actionWithTitle:v34 style:0 handler:&unk_26ECC93B8];
      [v32 addAction:v35];

      v36 = (void *)MEMORY[0x263F82400];
      v37 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"CANCEL" defaultString:@"CANCEL"];
      v38 = [v36 actionWithTitle:v37 style:1 handler:0];
      [v32 addAction:v38];

      [*(id *)(a1 + 40) presentViewController:v32 animated:1 completion:0];
      [*(id *)(a1 + 40) configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 48) setEnabled:0];
    }
  }
  else
  {
LABEL_16:
    v19 = sub_239773918(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239757000, v19, OS_LOG_TYPE_DEFAULT, "Network is not reachable", buf, 2u);
    }

    v20 = (void *)MEMORY[0x263F82418];
    v21 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"NETWORK_CONNECTION_REQUIRED" defaultString:@"NETWORK_CONNECTION_REQUIRED"];
    uint64_t v22 = *(void *)(a1 + 40);
    v23 = *(void **)(v22 + 1424);
    if (*(_DWORD *)(v22 + 1432) == 3) {
      [v23 localizedStringWithKey:@"NETWORK_CONNECTION_DESC_IPAD" defaultString:@"NETWORK_CONNECTION_DESC_IPAD"];
    }
    else {
    v24 = [v23 localizedStringWithKey:@"NETWORK_CONNECTION_DESC" defaultString:@"NETWORK_CONNECTION_DESC"];
    }
    v10 = [v20 alertControllerWithTitle:v21 message:v24 preferredStyle:1];

    v25 = (void *)MEMORY[0x263F82400];
    v26 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"INTERNET_CONNECTION" defaultString:@"INTERNET_CONNECTION"];
    v27 = [v25 actionWithTitle:v26 style:0 handler:&unk_26ECC93F8];
    [v10 addAction:v27];

    v28 = (void *)MEMORY[0x263F82400];
    v29 = [*(id *)(*(void *)(a1 + 40) + 1424) localizedStringWithKey:@"CANCEL" defaultString:@"CANCEL"];
    v30 = [v28 actionWithTitle:v29 style:1 handler:0];
    [v10 addAction:v30];

    [*(id *)(a1 + 40) presentViewController:v10 animated:1 completion:0];
    [*(id *)(a1 + 40) configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 48) setEnabled:0];
  }

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
}

void sub_23975B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23975B46C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23975B47C(uint64_t a1)
{
}

void sub_23975B484(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_239773918(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2397763A4((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_23975B4F8(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  v10 = sub_239773918(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "repairTicket status:%d:error:%@:ticket:%@", (uint8_t *)v11, 0x1Cu);
  }
}

void sub_23975B61C()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void sub_23975B698(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "setBootIntentAndRebootToCheckerboardWithLocale:Reply: error:%@:status:%d", (uint8_t *)&v6, 0x12u);
  }
}

void sub_23975B760()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

uint64_t sub_23975B7DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureSpin:0 ofCellForSpecifier:*(void *)(a1 + 40) setEnabled:1];
}

void sub_23975BEA0(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!xpc_activity_get_state(v3))
  {
    uint64_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82A0], 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x263EF82D0], 1);
    xpc_activity_set_criteria(v3, v5);
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1)
  {
    [*(id *)(a1 + 32) performBackGroundMiniPreflight];
  }
  else if (!v4)
  {
    [*(id *)(a1 + 32) getCAAForRepairHistory];
  }
  if (xpc_activity_should_defer(v3))
  {
    BOOL v6 = xpc_activity_set_state(v3, 3);
    uint64_t v5 = sub_239773918(0);
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        int v9 = 138412546;
        uint64_t v10 = v3;
        __int16 v11 = 2048;
        xpc_activity_state_t state = xpc_activity_get_state(v3);
        __int16 v8 = "Successfully deferred activity %@ to state: %lu";
LABEL_14:
        _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
      }
    }
    else if (v7)
    {
      int v9 = 138412546;
      uint64_t v10 = v3;
      __int16 v11 = 2048;
      xpc_activity_state_t state = xpc_activity_get_state(v3);
      __int16 v8 = "Failed to set state to DEFER for activity %@ current state: %lu";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  xpc_activity_set_state(v3, 5);
LABEL_16:
}

uint64_t sub_23975C434(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNetworkActivityWith:0];
}

void sub_23975CA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23975CAA8(uint64_t a1)
{
  v2 = objc_opt_new();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_23975CB38;
  v4[3] = &unk_264DA0370;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 preflight:v3 withReply:v4];
}

void sub_23975CB38(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_239773918(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18) = a2;
    _os_log_impl(&dword_239757000, v9, OS_LOG_TYPE_DEFAULT, "Preflight success: %d", (uint8_t *)&v17, 8u);
  }

  uint64_t v10 = sub_239773918(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "Preflight results: %@", (uint8_t *)&v17, 0xCu);
  }

  __int16 v11 = sub_239773918(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, "Preflight error: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  id v15 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v15 setObject:v14 forKey:@"tempPreflightResults"];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v16 setObject:v14 forKey:@"cachedPreFlightResults"];

  notify_post("com.apple.mobilerepair.refreshui");
}

void sub_23975CEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23975CED0(uint64_t a1)
{
  v2 = objc_opt_new();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_23975CF60;
  v4[3] = &unk_264DA0370;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 preflight:v3 withReply:v4];
}

void sub_23975CF60(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_239773918(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18) = a2;
    _os_log_impl(&dword_239757000, v9, OS_LOG_TYPE_DEFAULT, "Preflight success: %d", (uint8_t *)&v17, 8u);
  }

  uint64_t v10 = sub_239773918(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "Preflight results: %@", (uint8_t *)&v17, 0xCu);
  }

  __int16 v11 = sub_239773918(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_239757000, v11, OS_LOG_TYPE_DEFAULT, "Preflight error: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  id v15 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v15 setObject:v14 forKey:@"tempPreflightResults"];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  [v16 setObject:v14 forKey:@"cachedPreFlightResults"];

  notify_post("com.apple.mobilerepair.refreshui");
}

void sub_23975D42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23975D45C(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_23975D4E0;
  v4[3] = &unk_264DA03C0;
  uint64_t v6 = *(void *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  return [v2 issueClientCertificateWithCompletionOnQueue:0 withOptions:v1 completion:v4];
}

void sub_23975D4E0(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_239773918(0);
  uint64_t v10 = v9;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2397765DC((uint64_t)v8, v10);
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 referenceKey];
    uint64_t v12 = [v7 certificates];
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    _os_log_impl(&dword_239757000, v10, OS_LOG_TYPE_DEFAULT, "BIK:%@ Certs:%@", buf, 0x16u);
  }
  uint64_t v13 = [v7 certificates];
  if (!v13) {
    goto LABEL_19;
  }
  id v14 = (void *)v13;
  id v15 = [v7 certificates];
  if ([v15 count] != 2)
  {

LABEL_19:
    uint64_t v10 = sub_239773918(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2397765A8();
    }
    goto LABEL_21;
  }
  uint64_t v16 = [v7 referenceKey];

  if (!v16) {
    goto LABEL_19;
  }
  int v17 = sub_239773918(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_239757000, v17, OS_LOG_TYPE_DEFAULT, "BIK and BAA issues success", buf, 2u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 certifcateType];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 1)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v18 + 40);
    uint64_t v10 = [v7 extractRepairHistoryWithError:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);
    uint64_t v19 = sub_239773918(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = (uint64_t)v10;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      _os_log_impl(&dword_239757000, v19, OS_LOG_TYPE_DEFAULT, "repairHistory: %@ error: %@", buf, 0x16u);
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if ([*(id *)(a1 + 32) isVaildCAA:v10])
      {
        v21 = [MEMORY[0x263F37EB8] getLocalSealingManifest];
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
        [v22 setObject:v21 forKey:@"cachedSealingManifest"];

        [*(id *)(a1 + 32) clearCAARequestHistory];
      }
      v23 = [MEMORY[0x263F08AC0] dataWithPropertyList:v10 format:100 options:0 error:0];
      v24 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
      [v24 setObject:v23 forKey:@"cachedCAACert"];
    }
LABEL_21:
  }
}

void sub_2397624D0(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v7 = *(void **)(*(void *)(a1 + 40) + 1400);
        id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        int v9 = [v8 stringValue];
        uint64_t v10 = [@"exceptionCount:" stringByAppendingString:v9];
        [v7 sendAsyncAnalyticsForEventIfNeeded:v10 moduleName:v6];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v3);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        int v17 = *(void **)(*(void *)(a1 + 40) + 1400);
        uint64_t v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v16];
        uint64_t v19 = [v18 stringValue];
        [v17 sendAsyncAnalyticsForEventIfNeeded:v19 moduleName:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }
}

void sub_23976282C(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained reloadCurrentSystemHealthInfoSpecifiers];
  long long v5 = sub_239773918(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v4;
    _os_log_impl(&dword_239757000, v5, OS_LOG_TYPE_DEFAULT, "Got new specifiers: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23976299C;
  block[3] = &unk_264DA0460;
  objc_copyWeak(&v10, v2);
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v10);
}

void sub_23976299C(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [a1[4] count];
  uint64_t v4 = [WeakRetained[180] count];
  long long v5 = [WeakRetained parentViewController];
  id v6 = [v5 specifierDataSource];

  id v7 = [WeakRetained findSpecifierToInsertAfter:v6];
  if (v7)
  {
    if (v6)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_239762BD4;
      v17[3] = &unk_264DA0438;
      v17[4] = WeakRetained;
      id v18 = a1[4];
      id v19 = v7;
      id v20 = a1[5];
      [v6 performUpdatesAnimated:v3 != v4 usingBlock:v17];
    }
    else
    {
      id v9 = (void *)MEMORY[0x263F5FC50];
      id v10 = [WeakRetained parentViewController];
      id v11 = [v10 specifiers];
      uint64_t v12 = [v9 updatesWithSpecifiers:v11];

      [WeakRetained _updateSpecifiers:a1[4] specifierToInsertAfter:v7 withUpdates:v12];
      uint64_t v13 = [WeakRetained parentViewController];
      [v13 performSpecifierUpdates:v12];

      uint64_t v14 = sub_239773918(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 0;
        _os_log_impl(&dword_239757000, v14, OS_LOG_TYPE_DEFAULT, "DONE updateSpecifiersWithCompletionHandler", (uint8_t *)v16, 2u);
      }

      id v15 = (void (**)(void))a1[5];
      if (v15) {
        v15[2]();
      }
    }
  }
  else
  {
    id v8 = (void (**)(void))a1[5];
    if (v8) {
      v8[2]();
    }
  }
}

uint64_t sub_239762BD4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateSpecifiers:*(void *)(a1 + 40) specifierToInsertAfter:*(void *)(a1 + 48) withUpdates:a2];
  uint64_t v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "DONE updateSpecifiersWithCompletionHandler", v5, 2u);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_239763128(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_239763398(uint64_t a1)
{
  qword_268A00E90 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

void sub_239764248(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v5 = [MEMORY[0x263F53618] sharedDataAccessor];
    id v23 = 0;
    id v6 = (void *)[v5 copyPathForPersistentData:100 error:&v23];
    id v7 = v23;

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      [v4 setObject:v6 forKey:@"datapath"];
      uint64_t v10 = [objc_alloc(MEMORY[0x263F37E30]) initForRegisterChangeWithParameters:v4];
      if (!v10)
      {
        id v7 = sub_239773918(1uLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_23977674C(a1);
        }
        goto LABEL_24;
      }
      id v7 = v10;
      if (xpc_activity_should_defer(v3))
      {
        BOOL v11 = xpc_activity_set_state(v3, 3);
        uint64_t v12 = sub_239773918(0);
        uint64_t v9 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [*(id *)(a1 + 32) componentName];
            uint64_t v14 = [NSString stringWithFormat:@"Successfully deferred activity %@ to state: %lu", v3, xpc_activity_get_state(v3)];
            *(_DWORD *)buf = 138412546;
            long long v25 = v13;
            __int16 v26 = 2112;
            long long v27 = v14;
            _os_log_impl(&dword_239757000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          sub_239776810(a1, v3);
        }
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) componentName];
        id v22 = 0;
        uint64_t v16 = [v7 registerChangeForComponent:v15 fdrError:&v22];
        uint64_t v9 = v22;

        if (!v16)
        {
          int v17 = sub_239773918(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [*(id *)(a1 + 32) componentName];
            id v19 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] register change was successful", "-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke");
            *(_DWORD *)buf = 138412546;
            long long v25 = v18;
            __int16 v26 = 2112;
            long long v27 = v19;
            _os_log_impl(&dword_239757000, v17, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
          }
          id v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
          long long v21 = [*(id *)(a1 + 32) componentHasNotifiedServerKey];
          [v20 setBool:1 forKey:v21];

          [v20 synchronize];
        }
        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      uint64_t v9 = sub_239773918(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_239776688(a1);
      }
    }

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A0], 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8248], 1);
  xpc_activity_set_criteria(v3, v4);
LABEL_25:
}

void sub_239765464(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  uint64_t v4 = *(void **)(a1 + 32);
  if (state)
  {
    [v4 unlockCheckerActivityBodyForFinishRepair];
  }
  else
  {
    long long v5 = [v4 createCriteriaForUnlockCheckerWithInterval:*(double *)(a1 + 40)];
    xpc_activity_set_criteria(activity, v5);
  }
}

void sub_2397654E0(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  uint64_t v4 = *(void **)(a1 + 32);
  if (state)
  {
    [v4 unlockCheckerActivityBody];
  }
  else
  {
    long long v5 = [v4 createCriteriaForUnlockCheckerWithInterval:*(double *)(a1 + 40)];
    xpc_activity_set_criteria(activity, v5);
  }
}

void sub_239765C88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_239766320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_239766370(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v2) = -1;
  do
  {
    uint64_t v2 = (v2 + 1);
    uint64_t v3 = sub_239773918(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) componentName];
      long long v5 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] Retry Count:%d", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke", v2);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v4;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    sleep(0xAu);
    id v6 = [*(id *)(a1 + 32) componentAuthHandler];
    uint64_t v7 = [v6 copyComponentStatus];
  }
  while (!v7 && v2 < 9);
  if (v2 <= 8 && v7 == 1)
  {
    BOOL v8 = sub_239773918(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) componentName];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"[%s] cleaning up corefollowup finally", "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke");
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_239757000, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    }
    [WeakRetained clearRepairFollowUp];
    [WeakRetained sendAnalyticsForCount:0x7FFFFFFFFFFFFFFFLL];
    [WeakRetained clearNSUserDefaults];
  }
}

id sub_239766820(uint64_t a1)
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = @"EventType";
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  v29[0] = v3;
  v28[1] = @"isSUCase";
  int v4 = [*(id *)(a1 + 40) isSUCaseForComponent];
  uint64_t v5 = MEMORY[0x263EFFA80];
  if (v4) {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  v29[1] = v5;
  v28[2] = @"ModuleType";
  id v6 = [*(id *)(a1 + 40) componentName];
  v29[2] = v6;
  v28[3] = @"AuthStatus";
  uint64_t v7 = NSNumber;
  BOOL v8 = [*(id *)(a1 + 40) componentAuthHandler];
  uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "copyComponentStatus"));
  v29[3] = v9;
  v28[4] = @"UICoreFollowUpShownDuration";
  uint64_t v10 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v29[4] = v10;
  v28[5] = @"UILockscreenNotification";
  BOOL v11 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v29[5] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  if (!v2) {
  uint64_t v13 = sub_239773918(0);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = [*(id *)(a1 + 40) componentName];
    id v15 = [NSString stringWithFormat:@"[%s] send event: %@", "-[MRBaseComponentHandler sendAnalyticsForCount:]_block_invoke", v12];
    *(_DWORD *)buf = 138412546;
    long long v25 = v14;
    __int16 v26 = 2112;
    long long v27 = v15;
    _os_log_impl(&dword_239757000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
  }
  uint64_t v16 = sub_239773918(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [*(id *)(a1 + 40) componentName];
    id v18 = NSString;
    id v19 = [*(id *)(a1 + 40) componentName];
    id v20 = *(void **)(a1 + 32);
    long long v21 = v20;
    if (!v20)
    {
      long long v21 = [MEMORY[0x263EFF9D0] null];
    }
    id v22 = [v18 stringWithFormat:@"CoreAnalyticsEvent: ModuleType(%@), EventType(%@)", v19, v21];
    *(_DWORD *)buf = 138412546;
    long long v25 = v17;
    __int16 v26 = 2112;
    long long v27 = v22;
    _os_log_impl(&dword_239757000, v16, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    if (!v20) {
  }
    }

  return v12;
}

void sub_23976768C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t sub_2397676BC(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t sub_239767D08(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"bcrt"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRDataClassSupported:@"vcrt"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00EA0 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t sub_239768030(uint64_t a1)
{
  [*(id *)(a1 + 32) handleSUCase];
  qword_268A00EB0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_239768430(uint64_t a1)
{
  qword_268A00EC0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_239768E60(uint64_t a1)
{
  [*(id *)(a1 + 32) handleSUCase];
  qword_268A00ED0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_2397691A0(uint64_t a1)
{
  qword_268A00EE0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

void sub_23976F7B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_23976F9B0(uint64_t a1)
{
  qword_268A00EF8 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

void sub_23976FB30(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.mobilerepair"];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = objc_opt_new();
  int v4 = (void *)MEMORY[0x263F35378];
  uint64_t v5 = [v3 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
  id v6 = [v4 actionWithLabel:v5 url:*(void *)(a1 + 32)];

  [v2 addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263F35390]);
  BOOL v8 = v7;
  if (*(unsigned char *)(a1 + 80))
  {
    [v7 setFrequency:0.0];
    uint64_t v9 = [v3 localizedStringWithKey:*(void *)(a1 + 40) defaultString:*(void *)(a1 + 40)];
    [v8 setTitle:v9];

    uint64_t v10 = [v3 localizedStringWithKey:*(void *)(a1 + 48) defaultString:*(void *)(a1 + 48)];
    [v8 setInformativeText:v10];

    BOOL v11 = [v3 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
    [v8 setUnlockActionLabel:v11];

    [v8 setFirstNotificationDelay:0.0];
    [v8 setActivateAction:v6];
    [v8 setClearAction:0];
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    v33[0] = *MEMORY[0x263F35320];
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    __int16 v14 = [v12 setWithArray:v13];
    [v8 setOptions:v14];
  }
  id v15 = objc_alloc_init(MEMORY[0x263F35388]);
  [v15 setUniqueIdentifier:*(void *)(a1 + 56)];
  [v15 setGroupIdentifier:*MEMORY[0x263F352C8]];
  uint64_t v16 = NSString;
  int v17 = [v3 localizedStringWithKey:*(void *)(a1 + 40) defaultString:*(void *)(a1 + 40)];
  id v18 = [v3 localizedStringWithKey:*(void *)(a1 + 64) defaultString:*(void *)(a1 + 64)];
  id v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);
  [v15 setTitle:v19];

  id v20 = NSString;
  long long v21 = [v3 localizedStringWithKey:*(void *)(a1 + 48) defaultString:*(void *)(a1 + 48)];
  id v22 = [v3 localizedStringWithKey:*(void *)(a1 + 64) defaultString:*(void *)(a1 + 64)];
  id v23 = objc_msgSend(v20, "stringWithFormat:", v21, v22);
  [v15 setInformativeText:v23];

  [v15 setDisplayStyle:2];
  [v15 setActions:v2];
  if (*(unsigned char *)(a1 + 80)) {
    long long v24 = v8;
  }
  else {
    long long v24 = 0;
  }
  [v15 setNotification:v24];
  [v15 setTargetBundleIdentifier:*MEMORY[0x263F35290]];
  notify_post("com.apple.mobilerepairui.reload");
  long long v25 = sub_239773918(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v15;
    _os_log_impl(&dword_239757000, v25, OS_LOG_TYPE_DEFAULT, "Posting item: %@", buf, 0xCu);
  }

  id v30 = 0;
  char v26 = [v29 postFollowUpItem:v15 error:&v30];
  id v27 = v30;
  if ((v26 & 1) == 0)
  {
    uint64_t v28 = sub_239773918(1uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_239776B4C(v27);
    }
  }
  [*(id *)(*(void *)(a1 + 72) + 16) setObject:v15 forKeyedSubscript:*(void *)(a1 + 56)];
}

void sub_239770244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_239770270(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"settingsView"];

  int v4 = sub_239773918(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v51) = v3;
    _os_log_impl(&dword_239757000, v4, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (v3 && !*(unsigned char *)(a1 + 64))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    CFOptionFlags responseFlags = 0;
    SInt32 error = 0;
    uint64_t v5 = objc_opt_new();
    uint64_t v46 = a1;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = a1 + 40;
    int v8 = *(unsigned __int8 *)(v6 + 24);
    v43 = NSDictionary;
    uint64_t v44 = [v5 localizedStringWithKey:v7 defaultString:v7];
    uint64_t v42 = *MEMORY[0x263EFFFC8];
    uint64_t v9 = NSString;
    uint64_t v10 = [v5 localizedStringWithKey:*(void *)(v6 + 8) defaultString:*(void *)(v6 + 8)];
    BOOL v11 = [v9 stringWithFormat:@"\n%@\n", v10];
    uint64_t v41 = *MEMORY[0x263EFFFD8];
    v45 = v5;
    if (v8)
    {
      uint64_t v12 = [v5 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
      uint64_t v13 = *MEMORY[0x263F00000];
      __int16 v14 = [NSNumber numberWithBool:0];
      uint64_t v15 = *MEMORY[0x263F79610];
      uint64_t v16 = [NSNumber numberWithBool:1];
      uint64_t v17 = *MEMORY[0x263F79628];
      id v18 = [NSNumber numberWithBool:1];
      uint64_t v37 = v15;
      id v19 = (void *)v44;
      objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, v42, v11, v41, v12, v13, v14, v37, v16, v17, v18, *MEMORY[0x263F795E8], &unk_26ECCFF00, *MEMORY[0x263F79688], 0);
      CFDictionaryRef v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = [v5 localizedStringWithKey:@"OK" defaultString:@"OK"];
      uint64_t v40 = *MEMORY[0x263F00000];
      __int16 v14 = [v5 localizedStringWithKey:@"SETTINGS" defaultString:@"SETTINGS"];
      uint64_t v39 = *MEMORY[0x263EFFFE8];
      uint64_t v16 = [NSNumber numberWithBool:0];
      uint64_t v21 = *MEMORY[0x263F79610];
      id v18 = [NSNumber numberWithBool:1];
      uint64_t v22 = *MEMORY[0x263F79628];
      id v23 = [NSNumber numberWithBool:1];
      uint64_t v38 = v21;
      id v19 = (void *)v44;
      uint64_t v24 = objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, v42, v11, v41, v12, v40, v14, v39, v16, v38, v18, v22, v23, *MEMORY[0x263F795E8], &unk_26ECCFF00, *MEMORY[0x263F79688], 0);

      CFDictionaryRef v20 = (const __CFDictionary *)v24;
    }

    long long v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, &error, v20);
    if (v25)
    {
      char v26 = v25;
      CFUserNotificationReceiveResponse(v25, 0.0, &responseFlags);
      uint64_t v27 = v46;
      if (responseFlags == 1)
      {
        CFDictionaryRef v28 = v20;
        uint64_t v29 = sub_239773918(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)v6;
          *(_DWORD *)buf = 138412290;
          uint64_t v51 = v30;
          _os_log_impl(&dword_239757000, v29, OS_LOG_TYPE_DEFAULT, "%@ User pressed button", buf, 0xCu);
        }

        uint64_t v31 = [MEMORY[0x263F01880] defaultWorkspace];
        uint64_t v32 = *(void *)(v46 + 56);
        id v47 = 0;
        char v33 = [v31 openSensitiveURL:v32 withOptions:0 error:&v47];
        id v34 = v47;

        CFDictionaryRef v20 = v28;
        if ((v33 & 1) == 0)
        {
          v35 = sub_239773918(1uLL);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_239776C64((uint64_t *)(v46 + 56), v34, v35);
          }
        }
      }
      CFRelease(v26);
    }
    else
    {
      v36 = sub_239773918(1uLL);
      uint64_t v27 = v46;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_239776BD4((uint64_t *)v6, &error, v36);
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v27 + 32));
  }
}

void sub_23977091C()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.mobilerepair"];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2397709BC;
  v2[3] = &unk_264DA0578;
  id v3 = v0;
  id v1 = v0;
  [v1 pendingFollowUpItemsWithCompletion:v2];
}

void sub_2397709BC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v78 = a3;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0x263F35000uLL;
    uint64_t v77 = *(void *)v82;
    uint64_t v76 = *MEMORY[0x263F352C8];
    uint64_t v67 = *MEMORY[0x263F35290];
    do
    {
      uint64_t v8 = 0;
      uint64_t v68 = v6;
      do
      {
        if (*(void *)v82 != v77) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v81 + 1) + 8 * v8);
        id v10 = objc_alloc_init(*(Class *)(v7 + 904));
        BOOL v11 = [v9 uniqueIdentifier];
        [v10 setUniqueIdentifier:v11];

        [v10 setGroupIdentifier:v76];
        uint64_t v12 = [v9 uniqueIdentifier];
        char v13 = [@"com.apple.mobilerepair.DisplayRepair" isEqualToString:v12];

        __int16 v14 = off_264D9FF00;
        if (v13) {
          goto LABEL_18;
        }
        uint64_t v15 = [v9 uniqueIdentifier];
        char v16 = [@"com.apple.mobilerepair.BatteryRepair" isEqualToString:v15];

        __int16 v14 = off_264D9FEE8;
        if (v16) {
          goto LABEL_18;
        }
        uint64_t v17 = [v9 uniqueIdentifier];
        char v18 = [@"com.apple.mobilerepair.CameraRepair" isEqualToString:v17];

        __int16 v14 = off_264D9FEF8;
        if (v18) {
          goto LABEL_18;
        }
        id v19 = [v9 uniqueIdentifier];
        char v20 = [@"com.apple.mobilerepair.BluetoothRepair" isEqualToString:v19];

        __int16 v14 = off_264D9FEF0;
        if (v20) {
          goto LABEL_18;
        }
        uint64_t v21 = [v9 uniqueIdentifier];
        char v22 = [@"com.apple.mobilerepair.WifiRepair" isEqualToString:v21];

        __int16 v14 = &off_264D9FF30;
        if (v22) {
          goto LABEL_18;
        }
        id v23 = [v9 uniqueIdentifier];
        char v24 = [@"com.apple.mobilerepair.BasebandRepair" isEqualToString:v23];

        __int16 v14 = off_264D9FEE0;
        if (v24) {
          goto LABEL_18;
        }
        long long v25 = [v9 uniqueIdentifier];
        char v26 = [@"com.apple.mobilerepair.BasebandRepair" isEqualToString:v25];

        if (v26) {
          goto LABEL_18;
        }
        uint64_t v27 = [v9 uniqueIdentifier];
        char v28 = [@"com.apple.mobilerepair.NFCRepair" isEqualToString:v27];

        __int16 v14 = off_264D9FF18;
        if (v28) {
          goto LABEL_18;
        }
        uint64_t v29 = [v9 uniqueIdentifier];
        char v30 = [@"com.apple.mobilerepair.UWBRepair" isEqualToString:v29];

        __int16 v14 = off_264D9FF28;
        if (v30) {
          goto LABEL_18;
        }
        uint64_t v31 = [v9 uniqueIdentifier];
        char v32 = [@"com.apple.mobilerepair.AudioRepair" isEqualToString:v31];

        __int16 v14 = off_264D9FED8;
        if (v32) {
          goto LABEL_18;
        }
        char v33 = [v9 uniqueIdentifier];
        char v34 = [@"com.apple.mobilerepair.FaceIDRepair" isEqualToString:v33];

        __int16 v14 = &off_264D9FF08;
        if ((v34 & 1) != 0
          || ([v9 uniqueIdentifier],
              v35 = objc_claimAutoreleasedReturnValue(),
              int v36 = [@"com.apple.mobilerepair.TouchIDRepair" isEqualToString:v35],
              v35,
              __int16 v14 = off_264D9FF20,
              v36))
        {
LABEL_18:
          uint64_t v37 = [(__objc2_class *)*v14 sharedSingleton];
          uint64_t v38 = [v37 popUpNotificationTitle];

          uint64_t v39 = [(__objc2_class *)*v14 sharedSingleton];
          uint64_t v40 = [v39 followUpInfoMessage];
        }
        else
        {
          uint64_t v40 = 0;
          uint64_t v38 = 0;
        }
        uint64_t v41 = sub_239773918(0);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v88 = v38;
          _os_log_impl(&dword_239757000, v41, OS_LOG_TYPE_DEFAULT, "Title key :%@", buf, 0xCu);
        }

        uint64_t v42 = sub_239773918(0);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v88 = v40;
          _os_log_impl(&dword_239757000, v42, OS_LOG_TYPE_DEFAULT, "infotext key:%@", buf, 0xCu);
        }

        if (v38 && v40)
        {
          uint64_t v74 = v8;
          v43 = v9;
          v71 = v9;
          id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
          v45 = objc_opt_new();
          uint64_t v46 = (void *)MEMORY[0x263F35378];
          id v47 = [v45 localizedStringWithKey:@"LEARN_MORE" defaultString:@"LEARN_MORE"];
          v48 = [v43 actions];
          v49 = [v48 firstObject];
          v50 = [v49 url];
          uint64_t v51 = [v46 actionWithLabel:v47 url:v50];

          id v72 = (void *)v51;
          [v44 addObject:v51];
          uint64_t v52 = [v45 localizedStringWithKey:v38 defaultString:v38];
          [v10 setTitle:v52];

          v73 = v45;
          v53 = [v45 localizedStringWithKey:v40 defaultString:v40];
          [v10 setInformativeText:v53];

          [v10 setDisplayStyle:2];
          id v75 = v44;
          [v10 setActions:v44];
          [v10 setTargetBundleIdentifier:v67];
          v54 = *(void **)(a1 + 32);
          v55 = (void *)MEMORY[0x263EFF8C0];
          v56 = [v71 uniqueIdentifier];
          uint64_t v57 = objc_msgSend(v55, "arrayWithObjects:", v56, 0);
          id v80 = v78;
          LOBYTE(v54) = [v54 clearPendingFollowUpItemsWithUniqueIdentifiers:v57 error:&v80];
          id v58 = v80;

          if (v54)
          {
            uint64_t v59 = sub_239773918(0);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_239757000, v59, OS_LOG_TYPE_DEFAULT, "Successfully deleted the followup", buf, 2u);
            }

            char v60 = sub_239773918(0);
            uint64_t v8 = v74;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v88 = v10;
              _os_log_impl(&dword_239757000, v60, OS_LOG_TYPE_DEFAULT, "Re Posting item: %@", buf, 0xCu);
            }

            uint64_t v61 = *(void **)(a1 + 32);
            id v79 = v58;
            char v62 = [v61 postFollowUpItem:v10 error:&v79];
            id v78 = v79;

            uint64_t v63 = v73;
            if (v62)
            {
              uint64_t v6 = v68;
              unint64_t v7 = 0x263F35000;
              v64 = v75;
LABEL_39:

              goto LABEL_40;
            }
            v65 = sub_239773918(1uLL);
            uint64_t v6 = v68;
            unint64_t v7 = 0x263F35000;
            id v58 = v78;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_239776DA0((uint64_t)v85, (uint64_t)v78);
            }
            v64 = v75;
          }
          else
          {
            v65 = sub_239773918(1uLL);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_239776DFC((uint64_t)v86, (uint64_t)v58);
            }
            uint64_t v6 = v68;
            unint64_t v7 = 0x263F35000;
            v64 = v75;
            uint64_t v63 = v45;
            uint64_t v8 = v74;
          }

          id v78 = v58;
          goto LABEL_39;
        }
LABEL_40:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v66 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      uint64_t v6 = v66;
    }
    while (v66);
  }
}

uint64_t sub_239771208(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_23977121C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_239771A90(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_checkInAndHandleAuthStatus);
}

uint64_t sub_239771D18(uint64_t a1)
{
  qword_268A00F08 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23977234C(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"tcrt"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRDataClassSupported:@"dCfg"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00F18 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t sub_23977257C(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"bCfg"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRDataClassSupported:@"LCfg"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00F28 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t sub_239772838(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"FSCl"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRDataClassSupported:@"MSRk"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00F38 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t sub_239772B04(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"psd2"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRDataClassSupported:@"prpc"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00F48 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

void *sub_239772C8C()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = sub_239773918(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    id v3 = "-[CRUIAnalytics sendAnalyticsForRepairHistoryMismatch]_block_invoke";
    __int16 v4 = 2112;
    uint64_t v5 = &unk_26ECCFF18;
    _os_log_impl(&dword_239757000, v0, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v2, 0x16u);
  }

  return &unk_26ECCFF18;
}

void sub_239772E34(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v2 appendString:*(void *)(a1 + 40)];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilerepaird"];
  if (([v3 BOOLForKey:v2] & 1) == 0)
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
    objc_msgSend(v3, "setBool:forKey:", 1, v2, v4, 3221225472, sub_239772F3C, &unk_264DA05C0);
    [v3 synchronize];
  }
}

id sub_239772F3C(uint64_t a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"EventType";
  v9[1] = @"ModuleType";
  uint64_t v1 = *(void *)(a1 + 40);
  v10[0] = *(void *)(a1 + 32);
  v10[1] = v1;
  int v2 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v3 = sub_239773918(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v2;
    _os_log_impl(&dword_239757000, v3, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

uint64_t sub_239773294(uint64_t a1)
{
  qword_268A00F58 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

uint64_t sub_239773890(uint64_t a1)
{
  if (([MEMORY[0x263F37E28] isFDRDataClassSupported:@"CmCl"] & 1) != 0
    || (uint64_t result = [MEMORY[0x263F37E28] isFDRPropertySupported:@"RCSn"], result))
  {
    [*(id *)(a1 + 32) handleSUCase];
    qword_268A00F68 = [objc_alloc(*(Class *)(a1 + 32)) _init];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

id sub_239773918(unint64_t a1)
{
  if (qword_268A00F88[0] != -1) {
    dispatch_once(qword_268A00F88, &unk_26ECC9478);
  }
  id v2 = (id)MEMORY[0x263EF8440];
  id v3 = MEMORY[0x263EF8440];
  if (a1 <= 1)
  {
    id v2 = (id)qword_268A00F78[a1];
  }

  return v2;
}

uint64_t sub_2397739A8()
{
  os_log_t v0 = os_log_create("com.apple.corerepair", "device");
  uint64_t v1 = (void *)qword_268A00F78[0];
  qword_268A00F78[0] = (uint64_t)v0;

  qword_268A00F80 = (uint64_t)os_log_create("com.apple.corerepair", "device-error");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_239773A18(void *a1, double a2)
{
  uint64_t v4 = sub_239776EC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  __int16 v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_239776EE8();
  uint64_t v43 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_239776F98();
  uint64_t v44 = sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v11 = objc_msgSend(a1, sel_specifier);
  if (v11)
  {
    uint64_t v12 = v11;
    if (objc_msgSend(v11, sel_target))
    {
      self;
      char v13 = (void *)swift_dynamicCastObjCClass();
      if (v13)
      {
        id v39 = v13;
        id v38 = objc_msgSend(v13, sel_navigationItem);
LABEL_12:
        uint64_t v40 = v8;
        uint64_t v41 = v5;
        uint64_t v42 = v4;
        sub_239776F88();
        sub_239776F78();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        char v16 = self;
        uint64_t v17 = (void *)sub_239776F18();
        id v18 = objc_msgSend(v16, sel_preferredFontForTextStyle_, v17);

        objc_msgSend(v15, sel_setFont_, v18);
        swift_release();
        swift_beginAccess();
        sub_2397759BC(&qword_268A00E18);
        uint64_t inited = swift_initStackObject();
        char v20 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_239778BE0;
        uint64_t v21 = *v20;
        *(void *)(inited + 32) = *v20;
        char v22 = self;
        swift_bridgeObjectRetain();
        id v23 = v21;
        id v24 = objc_msgSend(v22, sel_labelColor);
        id v25 = objc_msgSend(v24, sel_colorWithAlphaComponent_, a2);

        *(void *)(inited + 64) = sub_239776188(0, &qword_268A00E20);
        *(void *)(inited + 40) = v25;
        sub_2397740E8(inited);
        id v26 = objc_allocWithZone(MEMORY[0x263F086A0]);
        uint64_t v27 = (void *)sub_239776F18();
        swift_bridgeObjectRelease();
        type metadata accessor for Key();
        sub_239776358(&qword_268A00E28, (void (*)(uint64_t))type metadata accessor for Key);
        char v28 = (void *)sub_239776F08();
        swift_bridgeObjectRelease();
        id v29 = objc_msgSend(v26, sel_initWithString_attributes_, v27, v28);

        objc_msgSend(v15, sel_setAttributedText_, v29);
        sub_239776188(0, &qword_268A00DF8);
        char v30 = (void *)sub_239776FB8();
        uint64_t v31 = swift_allocObject();
        char v32 = v38;
        *(void *)(v31 + 16) = v38;
        *(void *)(v31 + 24) = v15;
        aBlock[4] = sub_239776078;
        aBlock[5] = v31;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_239774350;
        aBlock[3] = &unk_26ECC9560;
        char v33 = _Block_copy(aBlock);
        id v34 = v32;
        id v35 = v15;
        sub_239776ED8();
        uint64_t v45 = MEMORY[0x263F8EE78];
        sub_239776358(&qword_268A00E00, MEMORY[0x263F8F030]);
        sub_2397759BC(&qword_268A00E08);
        sub_239776144(&qword_268A00E10, &qword_268A00E08);
        uint64_t v36 = v42;
        sub_239776FD8();
        MEMORY[0x23ECA41D0](0, v10, v7, v33);
        _Block_release(v33);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v36);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v40);
        swift_release();
        return swift_release();
      }
      swift_unknownObjectRelease();
    }
    id v38 = 0;
    id v39 = 0;
    goto LABEL_12;
  }

  return swift_release();
}

unint64_t sub_2397740E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2397759BC(&qword_268A00E30);
  uint64_t v2 = sub_239776FE8();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23977621C(v6, (uint64_t)&v13, &qword_268A00E38);
    uint64_t v7 = v13;
    unint64_t result = sub_2397750EC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_239776028(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_239774218(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2397759BC(&qword_268A00DE8);
  uint64_t v2 = sub_239776FE8();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23977621C(v6, (uint64_t)&v15, &qword_268A00DF0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_239775180(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_239776028(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_239774350(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_239774394()
{
  uint64_t v0 = sub_239776E78();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  char v22 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2397759BC(&qword_268A00DE0);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v21 - v6;
  sub_239776F98();
  uint64_t v21 = sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = objc_msgSend(self, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F37ED8]), sel_init);
  if (!v9)
  {
LABEL_8:
    uint64_t v14 = (void *)sub_239776F18();
    uint64_t v15 = (void *)sub_239776F18();
    id v13 = objc_msgSend(v10, sel_localizedStringWithKey_defaultString_, v14, v15);

    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  BOOL v11 = (void *)sub_239776F18();
  uint64_t v12 = (void *)sub_239776F18();
  id v13 = objc_msgSend(v10, sel_localizedStringWithKey_defaultString_, v11, v12);

  if (!v13)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_9:
  sub_239776F48();

  sub_239776E68();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23977621C((uint64_t)v7, (uint64_t)v5, &qword_268A00DE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0) == 1)
  {
LABEL_14:
    sub_239775FC8((uint64_t)v7);
    swift_release();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v22, v5, v0);
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v16 = objc_msgSend(self, sel_defaultWorkspace);
  if (v16)
  {
    long long v17 = v16;
    id v18 = v22;
    id v19 = (void *)sub_239776E58();
    sub_239774218(MEMORY[0x263F8EE78]);
    char v20 = (void *)sub_239776F08();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_openSensitiveURL_withOptions_, v19, v20);
    swift_release();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v18, v0);
    goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
}

id sub_239774924(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    id v10 = (void *)sub_239776F18();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_239774C80()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_239774CB8(uint64_t a1, uint64_t a2)
{
  return sub_239774E24(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_239774CD0(uint64_t a1, id *a2)
{
  uint64_t result = sub_239776F28();
  *a2 = 0;
  return result;
}

uint64_t sub_239774D48(uint64_t a1, id *a2)
{
  char v3 = sub_239776F38();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_239774DC8@<X0>(uint64_t *a1@<X8>)
{
  sub_239776F48();
  uint64_t v2 = sub_239776F18();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_239774E0C(uint64_t a1, uint64_t a2)
{
  return sub_239774E24(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_239774E24(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_239776F48();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_239774E68()
{
  sub_239776F48();
  sub_239776F58();

  return swift_bridgeObjectRelease();
}

uint64_t sub_239774EBC()
{
  sub_239776F48();
  sub_239777018();
  sub_239776F58();
  uint64_t v0 = sub_239777028();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_239774F30()
{
  uint64_t v0 = sub_239776F48();
  uint64_t v2 = v1;
  if (v0 == sub_239776F48() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_239777008();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_239774FBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_239776F18();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_239775004@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_239776F48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_239775030(uint64_t a1)
{
  uint64_t v2 = sub_239776358(&qword_268A00E28, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v3 = sub_239776358((unint64_t *)&unk_268A00E60, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_2397750EC(uint64_t a1)
{
  sub_239776F48();
  sub_239777018();
  sub_239776F58();
  uint64_t v2 = sub_239777028();
  swift_bridgeObjectRelease();

  return sub_2397751F8(a1, v2);
}

unint64_t sub_239775180(uint64_t a1, uint64_t a2)
{
  sub_239777018();
  sub_239776F58();
  uint64_t v4 = sub_239777028();

  return sub_239775370(a1, a2, v4);
}

unint64_t sub_2397751F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_239776F48();
    uint64_t v8 = v7;
    if (v6 == sub_239776F48() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_239777008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_239776F48();
          uint64_t v15 = v14;
          if (v13 == sub_239776F48() && v15 == v16) {
            break;
          }
          char v18 = sub_239777008();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_239775370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_239777008() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_239777008() & 1) == 0);
    }
  }
  return v6;
}

void sub_239775454()
{
  uint64_t v1 = v0;
  v30[0] = sub_2397759BC(&qword_268A00DA0);
  uint64_t v31 = *(void *)(v30[0] - 8);
  MEMORY[0x270FA5388](v30[0]);
  uint64_t v3 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_239776F98();
  v30[1] = sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v0, sel_setSelectionStyle_, 0, v30[0]);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F37ED8]), sel_init);
  uint64_t v5 = (void *)sub_239776F18();
  unint64_t v6 = (void *)sub_239776F18();
  id v7 = objc_msgSend(v4, sel_localizedStringWithKey_defaultString_, v5, v6);

  if (!v7)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = sub_239776F48();
  uint64_t v11 = v10;

  *(void *)(v8 + 16) = v9;
  *(void *)(v8 + 24) = v11;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F37ED8]), sel_init);
  uint64_t v13 = (void *)sub_239776F18();
  BOOL v14 = (void *)sub_239776F18();
  id v15 = objc_msgSend(v12, sel_localizedStringWithKey_defaultString_, v13, v14);

  if (!v15)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  id v16 = objc_msgSend(self, sel_currentDevice);
  id v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F37ED8]), sel_init);
  if (v17)
  {
    id v19 = (void *)sub_239776F18();
    char v20 = (void *)sub_239776F18();
    id v21 = objc_msgSend(v18, sel_localizedStringWithKey_defaultString_, v19, v20);

    if (v21)
    {
LABEL_9:
      uint64_t v24 = sub_239776F48();
      uint64_t v26 = v25;

      v33[0] = v24;
      v33[1] = v26;
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v1;
      *(void *)(v27 + 24) = v8;
      uint64_t v28 = MEMORY[0x270FA5388](v27);
      v30[-6] = v8 + 16;
      v30[-5] = v33;
      v30[-4] = sub_239775A78;
      v30[-3] = v28;
      v30[-2] = v1;
      v1;
      swift_retain();
      sub_2397759BC(&qword_268A00DA8);
      sub_239776144(&qword_268A00DB0, &qword_268A00DA8);
      sub_239776EA8();
      sub_239776EB8();
      uint64_t v29 = v30[0];
      v32[3] = v30[0];
      v32[4] = sub_239776144(&qword_268A00DB8, &qword_268A00DA0);
      sub_239775C78(v32);
      sub_239776E98();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v3, v29);
      MEMORY[0x23ECA41B0](v32);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
  char v22 = (void *)sub_239776F18();
  id v23 = (void *)sub_239776F18();
  id v21 = objc_msgSend(v18, sel_localizedStringWithKey_defaultString_, v22, v23);

  if (v21) {
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
}

uint64_t type metadata accessor for PartsAndServicePlacardCell()
{
  return self;
}

uint64_t sub_2397759BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_239775A00()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239775A38()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239775A78(double a1)
{
  return sub_239773A18(*(void **)(v1 + 16), a1);
}

uint64_t sub_239775A80()
{
  uint64_t v1 = *(void **)(v0 + 48);
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  *(void *)(swift_allocObject() + 16) = v1;
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2397759BC(&qword_268A00DC0);
  sub_239776144(&qword_268A00DC8, &qword_268A00DC0);
  sub_239776EF8();
  return swift_release();
}

uint64_t sub_239775C30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_239775C78(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_239775CDC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_239775D18()
{
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B530]), sel_init);
  sub_2397759BC(&qword_268A00DD0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_239778BE0;
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 11);
  uint64_t v3 = sub_239776188(0, &qword_268A00DD8);
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 32) = v2;
  id v4 = (void *)sub_239776F68();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setSymbolColors_, v4);

  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_239778BE0;
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 7);
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 32) = v6;
  id v7 = (void *)sub_239776F68();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setEnclosureColors_, v7);

  id v8 = objc_allocWithZone(MEMORY[0x263F4B540]);
  id v9 = v0;
  uint64_t v10 = (void *)sub_239776F18();
  objc_msgSend(v8, sel_initWithSymbolName_configuration_, v10, v9);

  sub_239776E88();
  swift_release();

  return swift_release();
}

uint64_t sub_239775FC8(uint64_t a1)
{
  uint64_t v2 = sub_2397759BC(&qword_268A00DE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_239776028(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_239776038()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239776078()
{
  long long v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v2) {
    objc_msgSend(v2, sel_setTitleView_, v1);
  }

  return swift_release();
}

uint64_t sub_23977612C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23977613C()
{
  return swift_release();
}

uint64_t sub_239776144(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_239775C30(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_239776188(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for Key()
{
  if (!qword_268A00E40)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268A00E40);
    }
  }
}

uint64_t sub_23977621C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2397759BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_239776280()
{
  return sub_239776358(&qword_268A00E48, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_2397762C8()
{
  return sub_239776358(&qword_268A00E50, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_239776310()
{
  return sub_239776358(&qword_268A00E58, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_239776358(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2397763A4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_239757000, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_23977641C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_239757000, a2, OS_LOG_TYPE_ERROR, "Failed to get battery health state (%x)\n", (uint8_t *)v2, 8u);
}

void sub_239776494(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_239757000, a2, OS_LOG_TYPE_ERROR, "Error retrieving current CPU uptime: %d", (uint8_t *)v2, 8u);
}

void sub_23977650C()
{
  sub_239763144();
  sub_239763128(&dword_239757000, v0, v1, "CAA repair info mismatch with local Battery data", v2, v3, v4, v5, v6);
}

void sub_239776540()
{
  sub_239763144();
  sub_239763128(&dword_239757000, v0, v1, "CAA repair info mismatch with local Display data", v2, v3, v4, v5, v6);
}

void sub_239776574()
{
  sub_239763144();
  sub_239763128(&dword_239757000, v0, v1, "CAA repair info mismatch with local Camera data", v2, v3, v4, v5, v6);
}

void sub_2397765A8()
{
  sub_239763144();
  sub_239763128(&dword_239757000, v0, v1, "Invalid Certs or BIK", v2, v3, v4, v5, v6);
}

void sub_2397765DC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_239757000, a2, OS_LOG_TYPE_ERROR, "Error getting BAA certs:%@", (uint8_t *)&v2, 0xCu);
}

void sub_239776654()
{
  sub_239763144();
  sub_239763128(&dword_239757000, v0, v1, "Specifiers not found", v2, v3, v4, v5, v6);
}

void sub_239776688(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) componentName];
  uint64_t v2 = [NSString stringWithFormat:@"[%s]Unable to get FDR path"];
  sub_2397676AC();
  sub_23976768C(&dword_239757000, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);
}

void sub_23977674C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) componentName];
  uint64_t v2 = [NSString stringWithFormat:@"[%s] unable to create sealer"];
  sub_2397676AC();
  sub_23976768C(&dword_239757000, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);
}

void sub_239776810(uint64_t a1, _xpc_activity_s *a2)
{
  int v3 = [*(id *)(a1 + 32) componentName];
  int v4 = NSString;
  uint64_t v12 = (uint64_t)a2;
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  int v5 = [v4 stringWithFormat:@"Failed to set state to DEFER for activity %@ current state: %lu"];
  sub_2397676AC();
  sub_23976768C(&dword_239757000, v6, v7, "[%@][%@]", v8, v9, v10, v11, v12, state, 2u);
}

void sub_2397768DC()
{
  sub_2397676D4();
  sub_2397676BC(v2, v3, v4, 5.778e-34);
  _os_log_error_impl(&dword_239757000, v6, OS_LOG_TYPE_ERROR, "[%@][%@]", v5, 0x16u);
}

void sub_239776934(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 componentName];
  uint64_t v11 = a2;
  uint64_t v4 = [NSString stringWithFormat:@"[%s] ignoring rogue event with unlock countL: %ld"];
  sub_2397676AC();
  sub_23976768C(&dword_239757000, v5, v6, "[%@][%@]", v7, v8, v9, v10, (uint64_t)"-[MRBaseComponentHandler sendAnalyticsForCount:]", v11, 2u);
}

void sub_2397769F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_239757000, log, OS_LOG_TYPE_ERROR, "Cannot find matching service to IOPlatformExpertDevice", v1, 2u);
}

void sub_239776A3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_239757000, log, OS_LOG_TYPE_ERROR, "Cannot find property \"config-number\"", v1, 2u);
}

void sub_239776A80(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_239757000, log, OS_LOG_TYPE_ERROR, "Invalid time parameters", v1, 2u);
}

void sub_239776AC4(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_23976F7B4(&dword_239757000, v2, v3, "failed to clear Followup error:%@", v4, v5, v6, v7, 2u);
}

void sub_239776B4C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_23976F7B4(&dword_239757000, v2, v3, "failed to post followup error:%@", v4, v5, v6, v7, 2u);
}

void sub_239776BD4(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_239757000, log, OS_LOG_TYPE_ERROR, "Unable to display %@ notification ERROR:%d", (uint8_t *)&v5, 0x12u);
}

void sub_239776C64(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_239757000, a3, OS_LOG_TYPE_ERROR, "failed to open sensitive url:%@ :: error:%@", (uint8_t *)&v6, 0x16u);
}

void sub_239776D18(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_23976F7B4(&dword_239757000, v2, v3, "failed to clear Followup notification:%@", v4, v5, v6, v7, 2u);
}

void sub_239776DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_239771208(a1, a2), "localizedDescription");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_23977121C(&dword_239757000, v5, v6, "failed to post followup error:%@");
}

void sub_239776DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_239771208(a1, a2), "description");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_23977121C(&dword_239757000, v5, v6, "failed to clear Followup error:%@");
}

uint64_t sub_239776E58()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_239776E68()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_239776E78()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_239776E88()
{
  return MEMORY[0x270F87510]();
}

uint64_t sub_239776E98()
{
  return MEMORY[0x270F01E10]();
}

uint64_t sub_239776EA8()
{
  return MEMORY[0x270F01E20]();
}

uint64_t sub_239776EB8()
{
  return MEMORY[0x270F02A88]();
}

uint64_t sub_239776EC8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_239776ED8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_239776EE8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_239776EF8()
{
  return MEMORY[0x270F5D0C8]();
}

uint64_t sub_239776F08()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_239776F18()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_239776F28()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_239776F38()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_239776F48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_239776F58()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_239776F68()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_239776F78()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_239776F88()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_239776F98()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_239776FA8()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_239776FB8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_239776FC8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_239776FD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_239776FE8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_239777008()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_239777018()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_239777028()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AMFDRSealingMapGetFDRDataVersionForDevice()
{
  return MEMORY[0x270F91FE8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x270F5D220]();
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

uint64_t DMCopyCurrentBuildVersion()
{
  return MEMORY[0x270F253F0]();
}

uint64_t DMGetPreviousBuildVersion()
{
  return MEMORY[0x270F253F8]();
}

uint64_t DMGetUserDataDisposition()
{
  return MEMORY[0x270F25400]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

uint64_t IOPSGetBatteryHealthState()
{
  return MEMORY[0x270EF4940]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05600](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
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

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}