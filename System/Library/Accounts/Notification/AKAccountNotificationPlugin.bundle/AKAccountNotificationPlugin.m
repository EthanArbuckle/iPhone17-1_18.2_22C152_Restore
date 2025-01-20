void sub_240546FF8(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = _AKLogSystem();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_240545000, v6, OS_LOG_TYPE_DEFAULT, "Successfully cleaned Hide My Email database", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_240549140();
  }
}

void sub_240547A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240547AB4(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_240549324();
    }
  }
}

uint64_t sub_240547B10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_240547B20(uint64_t a1)
{
}

void sub_240547B28(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_24054833C(uint64_t a1, int a2)
{
  id v4 = _ACDLogSystem();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_240545000, v5, OS_LOG_TYPE_DEFAULT, "\"Successfully updated remote IdMS account...\"", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_240549508(v5);
  }

  v6 = [*(id *)(a1 + 32) _saveOptionsForCompanionDeviceAuth];
  v7 = [*(id *)(a1 + 40) remoteDeviceProxy];
  [v7 sendCommand:*MEMORY[0x263EFB1B0] withAccount:*(void *)(a1 + 48) options:v6 completion:&unk_26F4A2348];
}

void sub_24054841C(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = _ACDLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_240545000, v7, OS_LOG_TYPE_DEFAULT, "\"Successfully verified credentials on the remote iCloud account!\"", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_24054954C();
  }
}

void sub_2405485E0(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 description];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_240545000, v3, OS_LOG_TYPE_DEFAULT, "Remove PCS auth credentials completed with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_2405486A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_240548D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240548D30(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v6 = [v11 actions];
  if ([v6 count])
  {
    uint64_t v7 = [v11 informativeText];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = v7 == 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
  }

  if (*(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24)) {
    *a4 = 1;
  }
}

void sub_240548EC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    int v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_240549718((uint64_t)v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_240549070()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Reporting invalid save of account: %@", v2, v3, v4, v5, v6);
}

void sub_2405490D8()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Reporting invalid change of account: %@", v2, v3, v4, v5, v6);
}

void sub_240549140()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Failed to wipe Hide My Email database with error:%@", v2, v3, v4, v5, v6);
}

void sub_2405491A8()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Failed to wipe database with error: %@", v2, v3, v4, v5, v6);
}

void sub_240549210()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Failed to clean up follow ups... please file a radar: %@", v2, v3, v4, v5, v6);
}

void sub_240549278(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_240545000, log, OS_LOG_TYPE_DEBUG, "Ignoring idMS account change, as we already had a token", v1, 2u);
}

void sub_2405492BC()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Failed to fetch fresh account for %@, not synchronizing followups!", v2, v3, v4, v5, v6);
}

void sub_240549324()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Failed to mark followup sync timestamp, oh well... %@", v2, v3, v4, v5, v6);
}

void sub_24054938C()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Account %@ is not valid, missing username!", v2, v3, v4, v5, v6);
}

void sub_2405493F4()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Account %@ is not valid, missing DSID!", v2, v3, v4, v5, v6);
}

void sub_24054945C()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "Account %@ is not valid, missing altDSID!", v2, v3, v4, v5, v6);
}

void sub_2405494C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_240545000, log, OS_LOG_TYPE_DEBUG, "Sending updated CK+PRK to peer device...", v1, 2u);
}

void sub_240549508(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240545000, log, OS_LOG_TYPE_ERROR, "\"Failed to update the remote IdMS account, bailing!\"", v1, 2u);
}

void sub_24054954C()
{
  sub_2405486C4();
  sub_2405486A8(&dword_240545000, v0, v1, "\"Failed to verify credentials on the remote iCloud account, error: %@\"", v2, v3, v4, v5, v6);
}

void sub_2405495B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240545000, log, OS_LOG_TYPE_ERROR, "AKFollowUpSynchronizer: Client provided nil account, defaulting to the primary iCloud account", v1, 2u);
}

void sub_2405495F8(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 username];
  uint64_t v5 = [MEMORY[0x263F290F0] sharedInstance];
  uint8_t v6 = [v5 altDSIDForAccount:a1];
  int v7 = 138478083;
  uint64_t v8 = v4;
  __int16 v9 = 2113;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_240545000, a2, OS_LOG_TYPE_ERROR, "Sync for account: %{private}@ - %{private}@", (uint8_t *)&v7, 0x16u);
}

void sub_2405496D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240545000, log, OS_LOG_TYPE_ERROR, "Failed to fetch items, falling back to sync", v1, 2u);
}

void sub_240549718(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_240545000, a2, OS_LOG_TYPE_ERROR, "Failed to update follow up synchronization date: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x270F0A578]();
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x270F0FFD8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}