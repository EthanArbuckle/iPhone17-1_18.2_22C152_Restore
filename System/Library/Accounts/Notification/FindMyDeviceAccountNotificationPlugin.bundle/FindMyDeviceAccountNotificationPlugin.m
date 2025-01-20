void sub_2405A2C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2405A2CA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = sub_2405A3274();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2405A4258((uint64_t)v5, v6);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 != 0;
  [*(id *)(a1 + 32) signal];
}

void sub_2405A2EFC(uint64_t a1)
{
  v2 = [MEMORY[0x263F3CC60] sharedInstance];
  char v3 = [v2 _quickFetchFMIPEnabledstate];

  if (*(_DWORD *)(a1 + 48) == 2)
  {
    if (v3)
    {
      v4 = [*(id *)(a1 + 32) accountType];
      id v5 = [v4 identifier];
      int v6 = [v5 isEqual:*MEMORY[0x263EFAEA8]];

      v7 = *(void **)(a1 + 32);
      if (v6)
      {
        if ([v7 isPropertyDirty:@"credential"])
        {
          log = sub_2405A3274();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2405A1000, log, OS_LOG_TYPE_DEFAULT, "FMIP token has changed", buf, 2u);
          }
          v8 = @"FMIP-auth-token";
LABEL_8:

          v9 = [MEMORY[0x263F3CC60] sharedInstance];
          [v9 didChangeFMIPAccountInfo:v8];
        }
      }
      else
      {
        log = [v7 accountType];
        v11 = [log identifier];
        if ([v11 isEqual:*MEMORY[0x263EFAE58]])
        {
          int v12 = objc_msgSend(*(id *)(a1 + 32), "aa_isAccountClass:", *MEMORY[0x263F25618]);

          if (!v12) {
            return;
          }
          int v13 = objc_msgSend(*(id *)(a1 + 40), "aa_isSuspended");
          if (v13 != objc_msgSend(*(id *)(a1 + 32), "aa_isSuspended"))
          {
            log = sub_2405A3274();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v21 = 0;
              _os_log_impl(&dword_2405A1000, log, OS_LOG_TYPE_DEFAULT, "iCloud account needs to verify terms changed", v21, 2u);
            }
            v8 = @"iCloud-terms-changed";
            goto LABEL_8;
          }
          if ([*(id *)(a1 + 32) isPropertyDirty:@"credential"])
          {
            log = sub_2405A3274();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_2405A1000, log, OS_LOG_TYPE_DEFAULT, "iCloud token has changed", v20, 2u);
            }
            v8 = @"iCloud-auth-token";
            goto LABEL_8;
          }
          v14 = *(void **)(a1 + 40);
          if (v14) {
            [v14 fmipAccountInfoForProactiveChanges];
          }
          else {
          log = [NSDictionary dictionary];
          }
          v15 = *(void **)(a1 + 32);
          if (v15) {
            [v15 fmipAccountInfoForProactiveChanges];
          }
          else {
          v16 = [NSDictionary dictionary];
          }
          if (([log isEqual:v16] & 1) == 0)
          {
            v17 = sub_2405A3274();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v19 = 0;
              _os_log_impl(&dword_2405A1000, v17, OS_LOG_TYPE_DEFAULT, "FMIP info changed", v19, 2u);
            }

            v8 = @"FMIP-info";
            goto LABEL_8;
          }
        }
        else
        {
        }
      }
    }
    else
    {
      v10 = sub_2405A3274();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2405A1000, v10, OS_LOG_TYPE_DEFAULT, "iCloud account info did change but FMIP is not enabled", v23, 2u);
      }
    }
  }
}

id sub_2405A3274()
{
  if (qword_26AFC6DA8 != -1) {
    dispatch_once(&qword_26AFC6DA8, &unk_26F4AC9D0);
  }
  v0 = (void *)qword_26AFC6DA0;
  return v0;
}

uint64_t sub_2405A32C8()
{
  qword_26AFC6DA0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");
  return MEMORY[0x270F9A758]();
}

id sub_2405A330C()
{
  if (qword_268C89300 != -1) {
    dispatch_once(&qword_268C89300, &unk_26F4AC9F0);
  }
  v0 = (void *)qword_268C89308;
  return v0;
}

uint64_t sub_2405A3360()
{
  qword_268C89308 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");
  return MEMORY[0x270F9A758]();
}

id sub_2405A33A4()
{
  if (qword_268C89310 != -1) {
    dispatch_once(&qword_268C89310, &unk_26F4ACA10);
  }
  v0 = (void *)qword_268C89318;
  return v0;
}

uint64_t sub_2405A33F8()
{
  qword_268C89318 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");
  return MEMORY[0x270F9A758]();
}

id sub_2405A343C()
{
  if (qword_268C89320 != -1) {
    dispatch_once(&qword_268C89320, &unk_26F4ACA30);
  }
  v0 = (void *)qword_268C89328;
  return v0;
}

uint64_t sub_2405A3490()
{
  qword_268C89328 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");
  return MEMORY[0x270F9A758]();
}

id sub_2405A34D4()
{
  if (qword_268C89330 != -1) {
    dispatch_once(&qword_268C89330, &unk_26F4ACA50);
  }
  v0 = (void *)qword_268C89338;
  return v0;
}

uint64_t sub_2405A3528()
{
  qword_268C89338 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");
  return MEMORY[0x270F9A758]();
}

id sub_2405A356C()
{
  if (qword_268C89340 != -1) {
    dispatch_once(&qword_268C89340, &unk_26F4ACA70);
  }
  v0 = (void *)qword_268C89348;
  return v0;
}

uint64_t sub_2405A35C0()
{
  qword_268C89348 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3604()
{
  if (qword_268C89350 != -1) {
    dispatch_once(&qword_268C89350, &unk_26F4ACA90);
  }
  v0 = (void *)qword_268C89358;
  return v0;
}

uint64_t sub_2405A3658()
{
  qword_268C89358 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");
  return MEMORY[0x270F9A758]();
}

id sub_2405A369C()
{
  if (qword_268C89360 != -1) {
    dispatch_once(&qword_268C89360, &unk_26F4ACAB0);
  }
  v0 = (void *)qword_268C89368;
  return v0;
}

uint64_t sub_2405A36F0()
{
  qword_268C89368 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3734()
{
  if (qword_268C89370 != -1) {
    dispatch_once(&qword_268C89370, &unk_26F4ACAD0);
  }
  v0 = (void *)qword_268C89378;
  return v0;
}

uint64_t sub_2405A3788()
{
  qword_268C89378 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  return MEMORY[0x270F9A758]();
}

id sub_2405A37CC()
{
  if (qword_268C89380 != -1) {
    dispatch_once(&qword_268C89380, &unk_26F4ACAF0);
  }
  v0 = (void *)qword_268C89388;
  return v0;
}

uint64_t sub_2405A3820()
{
  qword_268C89388 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3864()
{
  if (qword_268C89390 != -1) {
    dispatch_once(&qword_268C89390, &unk_26F4ACB10);
  }
  v0 = (void *)qword_268C89398;
  return v0;
}

uint64_t sub_2405A38B8()
{
  qword_268C89398 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  return MEMORY[0x270F9A758]();
}

id sub_2405A38FC()
{
  if (qword_268C893A0 != -1) {
    dispatch_once(&qword_268C893A0, &unk_26F4ACB30);
  }
  v0 = (void *)qword_268C893A8;
  return v0;
}

uint64_t sub_2405A3950()
{
  qword_268C893A8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3994()
{
  if (qword_268C893B0 != -1) {
    dispatch_once(&qword_268C893B0, &unk_26F4ACB50);
  }
  v0 = (void *)qword_268C893B8;
  return v0;
}

uint64_t sub_2405A39E8()
{
  qword_268C893B8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3A2C()
{
  if (qword_268C893C0 != -1) {
    dispatch_once(&qword_268C893C0, &unk_26F4ACB70);
  }
  v0 = (void *)qword_268C893C8;
  return v0;
}

uint64_t sub_2405A3A80()
{
  qword_268C893C8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3AC4()
{
  if (qword_268C893D0 != -1) {
    dispatch_once(&qword_268C893D0, &unk_26F4ACB90);
  }
  v0 = (void *)qword_268C893D8;
  return v0;
}

uint64_t sub_2405A3B18()
{
  qword_268C893D8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  return MEMORY[0x270F9A758]();
}

id sub_2405A3B5C()
{
  if (qword_268C893E0 != -1) {
    dispatch_once(&qword_268C893E0, &unk_26F4ACBB0);
  }
  v0 = (void *)qword_268C893E8;
  return v0;
}

uint64_t sub_2405A3BB0()
{
  uint64_t result = [MEMORY[0x263F3BA10] BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"];
  if (result)
  {
    qword_268C893E8 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    return MEMORY[0x270F9A758]();
  }
  return result;
}

id sub_2405A3C1C(void *a1, uint64_t a2, int a3)
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = qword_268C892A8;
  v7 = [a1 username];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  uint64_t v8 = qword_268C892B0;
  v9 = objc_msgSend(a1, "aa_personID");
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  uint64_t v10 = qword_268C892B8;
  v11 = objc_msgSend(a1, "aa_altDSID");
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (a3)
  {
    uint64_t v12 = qword_268C892C0;
    int v13 = objc_msgSend(a1, "aa_fmipToken");
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);

    uint64_t v14 = qword_268C892C8;
    v15 = objc_msgSend(a1, "aa_authToken");
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v14, v15);
  }
  uint64_t v16 = qword_268C892D0;
  v17 = [a1 identifier];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  v18 = [a1 dataclassProperties];
  v19 = [v18 objectForKeyedSubscript:@"com.apple.Dataclass.DeviceLocator"];

  uint64_t v20 = qword_268C892D8;
  v21 = [v19 objectForKeyedSubscript:@"hostname"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v20, v21);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", qword_268C892E0, @"https");
  uint64_t v22 = qword_268C892E8;
  v23 = [v19 objectForKeyedSubscript:@"apsEnv"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v22, v23);

  v24 = (void *)MEMORY[0x263F3CC70];
  v25 = [MEMORY[0x263F3BA10] stringForKey:@"configURL" inDomain:*MEMORY[0x263F3CC70]];
  if (v25)
  {
    uint64_t v26 = qword_268C892F0;
    v27 = v5;
    v28 = v25;
LABEL_5:
    objc_msgSend(v27, "fm_safelyMapKey:toObject:", v26, v28);
    goto LABEL_8;
  }
  v29 = [v19 objectForKeyedSubscript:@"configURL"];

  uint64_t v30 = qword_268C892F0;
  if (!v29)
  {
    v28 = @"https://gateway.icloud.com/fmadminws/findkit";
    v27 = v5;
    uint64_t v26 = qword_268C892F0;
    goto LABEL_5;
  }
  v31 = [v19 objectForKeyedSubscript:@"configURL"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v30, v31);

LABEL_8:
  v32 = [MEMORY[0x263F3BA10] stringForKey:@"pairingURL" inDomain:*v24];
  if (v32)
  {
    uint64_t v33 = qword_268C892F8;
    v34 = v5;
    v35 = v32;
LABEL_10:
    objc_msgSend(v34, "fm_safelyMapKey:toObject:", v33, v35);
    goto LABEL_13;
  }
  v36 = [v19 objectForKeyedSubscript:@"pairingURL"];

  uint64_t v37 = qword_268C892F8;
  if (!v36)
  {
    v35 = @"https://gateway.icloud.com/fmadminws";
    v34 = v5;
    uint64_t v33 = qword_268C892F8;
    goto LABEL_10;
  }
  v38 = [v19 objectForKeyedSubscript:@"pairingURL"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v37, v38);

LABEL_13:
  v39 = (void *)[v5 copy];

  return v39;
}

id sub_2405A3FB8(void *a1)
{
  v1 = [a1 fmipAccountInfoWithTokens:0];
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObjectForKey:qword_268C892D0];
  char v3 = (void *)[v2 copy];

  return v3;
}

id sub_2405A4024(void *a1, uint64_t a2, int a3)
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = qword_268C892A8;
  v7 = [a1 username];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  uint64_t v8 = qword_268C892B0;
  v9 = objc_msgSend(a1, "aa_personID");
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  uint64_t v10 = qword_268C892B8;
  v11 = objc_msgSend(a1, "aa_altDSID");
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (a3)
  {
    uint64_t v12 = qword_268C892C0;
    int v13 = objc_msgSend(a1, "aa_fmipToken");
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);
  }
  uint64_t v14 = [a1 dataclassProperties];
  v15 = [v14 objectForKeyedSubscript:@"com.apple.Dataclass.DeviceLocator"];

  uint64_t v16 = qword_268C892D8;
  v17 = [v15 objectForKeyedSubscript:@"hostname"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", qword_268C892E0, @"https");
  uint64_t v18 = qword_268C892E8;
  v19 = [v15 objectForKeyedSubscript:@"apsEnv"];
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v18, v19);

  uint64_t v20 = (void *)[v5 copy];
  return v20;
}

id sub_2405A41FC(void *a1)
{
  v1 = [a1 fmipAccountInfoWithTokens:0];
  v2 = (void *)[v1 mutableCopy];

  char v3 = (void *)[v2 copy];
  return v3;
}

void sub_2405A4258(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2405A1000, a2, OS_LOG_TYPE_ERROR, "Error fetching the FMIP state to decide if iCloud account can be deleted : %@", (uint8_t *)&v2, 0xCu);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}