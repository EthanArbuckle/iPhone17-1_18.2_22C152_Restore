id CloudServicesLog()
{
  return (id)qword_268C8A680;
}

void CloudServicesInitializeLogging(id obj)
{
}

uint64_t sub_2405E7450()
{
  if (qword_26AFC7438 != -1) {
    dispatch_once(&qword_26AFC7438, &unk_26F4B78D0);
  }
  if (!byte_26AFC7430) {
    return 0;
  }
  v0 = [(id)qword_26AFC7440 currentUser];
  uint64_t v1 = [v0 isLoginUser] ^ 1;

  return v1;
}

uint64_t sub_2405E74CC(void *a1)
{
  id v1 = a1;
  v2 = [v1 accountType];
  v3 = [v2 identifier];
  if ([v3 compare:*MEMORY[0x263EFAE58] options:4]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(v1, "aa_isManagedAppleID");
  }

  return v4;
}

void sub_2405E754C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_2405E7D94();
  }
}

void sub_2405E7A08(uint64_t a1, void *a2, void *a3)
{
  v18[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2405E7E40();
    }
  }
  else
  {
    v6 = [a2 objectForKeyedSubscript:*MEMORY[0x263F28F78]];
    v7 = [v6 objectForKeyedSubscript:@"com.apple.idms.config.KCKey"];
    if (v7)
    {
      v8 = [objc_alloc(MEMORY[0x263F32998]) initWithUserActivityLabel:@"EMCS credential change"];
      uint64_t v9 = *MEMORY[0x263F32A20];
      v17[0] = *MEMORY[0x263F329F0];
      v17[1] = v9;
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v18[0] = MEMORY[0x263EFFA88];
      v18[1] = v10;
      uint64_t v12 = *MEMORY[0x263F32A10];
      v17[2] = *MEMORY[0x263F32A18];
      v17[3] = v12;
      v18[2] = v11;
      v18[3] = v7;
      v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2405E7C20;
      v14[3] = &unk_2650C6228;
      id v15 = *(id *)(a1 + 48);
      id v16 = *(id *)(a1 + 56);
      [v8 enableWithInfo:v13 completionBlock:v14];
    }
    else
    {
      v8 = CloudServicesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_2405E7DFC(v8);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_2405E7C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2405E7D94();
  }

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_aa_clearRawPassword");
    id v5 = [*(id *)(a1 + 32) credential];
    [v5 setCredentialItem:0 forKey:@"old-password"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_2405E7CB8()
{
  uint64_t v0 = [MEMORY[0x263F841B0] sharedManager];
  id v1 = (void *)qword_26AFC7440;
  qword_26AFC7440 = v0;

  uint64_t result = [(id)qword_26AFC7440 isMultiUser];
  byte_26AFC7430 = result;
  return result;
}

void sub_2405E7D04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2405E7D2C()
{
  sub_2405E7D20();
  sub_2405E7D04(&dword_2405E6000, v0, v1, "SecureBackup backup returned %@", v2, v3, v4, v5, v6);
}

void sub_2405E7D94()
{
  sub_2405E7D20();
  sub_2405E7D04(&dword_2405E6000, v0, v1, "error from SecureBackup enableWithInfo: %@", v2, v3, v4, v5, v6);
}

void sub_2405E7DFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2405E6000, log, OS_LOG_TYPE_ERROR, "no EMCS IdMS dict", v1, 2u);
}

void sub_2405E7E40()
{
  sub_2405E7D20();
  sub_2405E7D04(&dword_2405E6000, v0, v1, "error from authenticateWithContext: %@", v2, v3, v4, v5, v6);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}