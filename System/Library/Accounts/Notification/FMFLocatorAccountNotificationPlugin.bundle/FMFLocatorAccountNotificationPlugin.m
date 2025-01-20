uint64_t useFMFForFences()
{
  return _os_feature_enabled_impl() ^ 1;
}

void sub_24059E410(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];

  if (!v2)
  {
    v3 = LogCategory_Unspecified();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24059D000, v3, OS_LOG_TYPE_INFO, "Creating XPC Connection...", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    v5 = (void *)[v4 initWithMachServiceName:NSXPC_SERVICE_NAME options:4096];
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F4AEC28];
    [v5 setRemoteObjectInterface:v6];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_24059E5AC;
    v8[3] = &unk_2650C3178;
    v8[4] = *(void *)(a1 + 32);
    [v5 setInterruptionHandler:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_24059E620;
    v7[3] = &unk_2650C3178;
    v7[4] = *(void *)(a1 + 32);
    [v5 setInvalidationHandler:v7];
    [v5 resume];
    [*(id *)(a1 + 32) setXpcConnection:v5];
  }
}

uint64_t sub_24059E5AC(uint64_t a1)
{
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_24059D000, v2, OS_LOG_TYPE_INFO, "XPC Connection interrupted. Setting the xpcConnection to nil, so that it can be recreated the next time its needed.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _destroyXPCConnection];
}

uint64_t sub_24059E620(uint64_t a1)
{
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_24059D000, v2, OS_LOG_TYPE_INFO, "XPC Connection invalidated. Setting the xpcConnection to nil, so that it can be recreated the next time its needed.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _destroyXPCConnection];
}

void sub_24059E9D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_24059F73C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t sub_24059EA24(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_signal);
}

void sub_24059EC08(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if ((v1 - 1) <= 2)
  {
    if (v1 == 3)
    {
      v19 = [*(id *)(a1 + 32) accountType];
      v3 = [v19 identifier];
      if ([v3 isEqual:*MEMORY[0x263EFAE58]])
      {
        int v4 = objc_msgSend(*(id *)(a1 + 32), "aa_isPrimaryAccount");

        if (!v4) {
          return;
        }
        v19 = LogCategory_Unspecified();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          sub_24059F7A8();
          v13 = v19;
          uint64_t v5 = @"iCloud-delete";
          goto LABEL_28;
        }
        uint64_t v5 = @"iCloud-delete";
LABEL_27:
        v13 = v19;
LABEL_28:

        v14 = [*(id *)(a1 + 48) _currentXPCConnection];
        v15 = [v14 remoteObjectProxyWithErrorHandler:&unk_26F4ABF50];

        [v15 didChangeFMFAccountInfo:v5 usingCallback:&unk_26F4ABF70];
        return;
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 40) accountType];
      uint64_t v7 = [v6 identifier];
      int v8 = [v7 isEqual:*MEMORY[0x263EFAED0]];

      uint64_t v9 = *(void **)(a1 + 40);
      if (v8)
      {
        if (![v9 isPropertyDirty:@"credential"]) {
          return;
        }
        v19 = LogCategory_Unspecified();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          sub_24059F7DC();
          v13 = v19;
          uint64_t v5 = @"FMF-auth-token";
          goto LABEL_28;
        }
        uint64_t v5 = @"FMF-auth-token";
        goto LABEL_27;
      }
      v19 = [v9 accountType];
      v3 = [v19 identifier];
      if ([v3 isEqual:*MEMORY[0x263EFAE58]])
      {
        int v10 = objc_msgSend(*(id *)(a1 + 40), "aa_isPrimaryAccount");

        if (!v10) {
          return;
        }
        if (*(_DWORD *)(a1 + 56) == 1)
        {
          v19 = LogCategory_Unspecified();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_24059F810();
            v13 = v19;
            uint64_t v5 = @"iCloud-add";
            goto LABEL_28;
          }
          uint64_t v5 = @"iCloud-add";
          goto LABEL_27;
        }
        int v11 = [*(id *)(a1 + 32) isProvisionedForDataclass:@"com.apple.Dataclass.ShareLocation"];
        int v12 = [*(id *)(a1 + 40) isProvisionedForDataclass:@"com.apple.Dataclass.ShareLocation"];
        if ((v12 & 1) == 0 && v11)
        {
          v19 = LogCategory_Unspecified();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_24059F8E0();
            v13 = v19;
            uint64_t v5 = @"FMF-deprovisioned";
            goto LABEL_28;
          }
          uint64_t v5 = @"FMF-deprovisioned";
          goto LABEL_27;
        }
        if (((v12 ^ 1 | v11) & 1) == 0)
        {
          v19 = LogCategory_Unspecified();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_24059F8AC();
            v13 = v19;
            uint64_t v5 = @"FMF-provisioned";
            goto LABEL_28;
          }
          uint64_t v5 = @"FMF-provisioned";
          goto LABEL_27;
        }
        if (!v12) {
          return;
        }
        if ([*(id *)(a1 + 40) isPropertyDirty:@"credential"])
        {
          v19 = LogCategory_Unspecified();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            sub_24059F844();
            v13 = v19;
            uint64_t v5 = @"iCloud-auth-token";
            goto LABEL_28;
          }
          uint64_t v5 = @"iCloud-auth-token";
          goto LABEL_27;
        }
        v16 = *(void **)(a1 + 32);
        if (v16) {
          [v16 fmfAccountInfoForProactiveChanges];
        }
        else {
        v19 = [NSDictionary dictionary];
        }
        v17 = *(void **)(a1 + 40);
        if (v17) {
          [v17 fmfAccountInfoForProactiveChanges];
        }
        else {
        v3 = [NSDictionary dictionary];
        }
        if (([v19 isEqual:v3] & 1) == 0)
        {
          v18 = LogCategory_Unspecified();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_24059F878();
          }

          uint64_t v5 = @"FMF-info";
          goto LABEL_27;
        }
      }
    }
  }
}

void sub_24059F004(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_24059F73C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_24059F058(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = LogCategory_Unspecified();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_24059F914((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_24059F11C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_24059F144(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id LogCategory_Unspecified()
{
  if (qword_26AFC6D48 != -1) {
    dispatch_once(&qword_26AFC6D48, &unk_26F4ABF90);
  }
  v0 = (void *)qword_26AFC6D40;
  return v0;
}

uint64_t sub_24059F1B4()
{
  qword_26AFC6D40 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "_");
  return MEMORY[0x270F9A758]();
}

id LogCategory_Locations()
{
  if (qword_268C890D8 != -1) {
    dispatch_once(&qword_268C890D8, &unk_26F4ABFB0);
  }
  v0 = (void *)qword_268C890E0;
  return v0;
}

uint64_t sub_24059F24C()
{
  qword_268C890E0 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Locations");
  return MEMORY[0x270F9A758]();
}

id LogCategory_Traffic()
{
  if (qword_268C890E8 != -1) {
    dispatch_once(&qword_268C890E8, &unk_26F4ABFD0);
  }
  v0 = (void *)qword_268C890F0;
  return v0;
}

uint64_t sub_24059F2E4()
{
  qword_268C890F0 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Traffic");
  return MEMORY[0x270F9A758]();
}

id LogCategory_SecureLocations()
{
  if (qword_268C890F8 != -1) {
    dispatch_once(&qword_268C890F8, &unk_26F4ABFF0);
  }
  v0 = (void *)qword_268C89100;
  return v0;
}

uint64_t sub_24059F37C()
{
  qword_268C89100 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "secureLocations");
  return MEMORY[0x270F9A758]();
}

id LogCategory_Fences()
{
  if (qword_268C89108 != -1) {
    dispatch_once(&qword_268C89108, &unk_26F4AC010);
  }
  v0 = (void *)qword_268C89110;
  return v0;
}

uint64_t sub_24059F414()
{
  qword_268C89110 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Fences");
  return MEMORY[0x270F9A758]();
}

id sub_24059F458(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [a1 username];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"username", v6);

  uint64_t v7 = objc_msgSend(a1, "aa_personID");
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"dsid", v7);

  if (a3)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFB210]);
    uint64_t v9 = objc_msgSend(a1, "aa_fmfAccount");
    id v21 = 0;
    int v10 = [v8 credentialForAccount:v9 error:&v21];
    id v11 = v21;

    if (!v10)
    {
      int v12 = LogCategory_Unspecified();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_24059F980((uint64_t)v11, v12);
      }
    }
    v13 = [v10 credentialItemForKey:*MEMORY[0x263EFB098]];
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"appToken", v13);

    v14 = [v10 credentialItemForKey:*MEMORY[0x263EFB0A0]];
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"internalToken", v14);
  }
  v15 = [a1 propertiesForDataclass:@"com.apple.Dataclass.ShareLocation"];
  v16 = [v15 objectForKeyedSubscript:@"appHostname"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"appHostname", v16);

  v17 = [v15 objectForKeyedSubscript:@"hostname"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"hostname", v17);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"scheme", @"https");
  v18 = [v15 objectForKeyedSubscript:@"apsEnv"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", @"apsEnv", v18);

  v19 = (void *)[v5 copy];
  return v19;
}

id sub_24059F6E0(void *a1)
{
  int v1 = [a1 fmfAccountInfoWithTokens:0];
  id v2 = (void *)[v1 mutableCopy];

  v3 = (void *)[v2 copy];
  return v3;
}

void sub_24059F73C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24059F7A8()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "iCloud account deleted", v2, v3, v4, v5, v6);
}

void sub_24059F7DC()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "FMF token has changed", v2, v3, v4, v5, v6);
}

void sub_24059F810()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "iCloud account added", v2, v3, v4, v5, v6);
}

void sub_24059F844()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "iCloud token has changed", v2, v3, v4, v5, v6);
}

void sub_24059F878()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "FMF info changed", v2, v3, v4, v5, v6);
}

void sub_24059F8AC()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "FMF was provisioned", v2, v3, v4, v5, v6);
}

void sub_24059F8E0()
{
  sub_24059F138();
  sub_24059F11C(&dword_24059D000, v0, v1, "FMF was deprovisioned", v2, v3, v4, v5, v6);
}

void sub_24059F914(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24059F980(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24059D000, a2, OS_LOG_TYPE_ERROR, "No credential found for aa_fmfAccount : %@", (uint8_t *)&v2, 0xCu);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
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