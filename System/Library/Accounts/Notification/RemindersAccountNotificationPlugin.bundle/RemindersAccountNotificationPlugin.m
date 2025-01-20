void sub_2405DF0A4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F62ED8] accountPlugin];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 accountType];
    v5 = [v4 identifier];
    v6 = *(_DWORD *)(a1 + 72);
    v30 = 138412802;
    v31 = v3;
    v32 = 2112;
    v33 = v5;
    v34 = 1024;
    v35 = v6;
    _os_log_impl(&dword_2405DE000, v2, OS_LOG_TYPE_DEFAULT, "RemindersANP: Account changed %@ %@, type: %d", (uint8_t *)&v30, 0x1Cu);
  }
  v7 = (id *)(a1 + 32);
  v8 = [*(id *)(a1 + 32) dirtyProperties];
  v9 = [v8 count];

  if (v9)
  {
    v10 = [MEMORY[0x263F62ED8] accountPlugin];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_2405DFC6C();
    }

    v11 = [*v7 dirtyProperties];
    v12 = [v11 containsObject:*MEMORY[0x263EFB148]];

    if (v12)
    {
      v13 = [MEMORY[0x263F62ED8] accountPlugin];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_2405DFBAC(a1 + 32, v13);
      }
    }
  }
  v14 = [*v7 dirtyAccountProperties];
  v15 = [v14 count];

  if (v15)
  {
    v16 = [MEMORY[0x263F62ED8] accountPlugin];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_2405DFB0C();
    }
  }
  v17 = [*v7 dirtyDataclassProperties];
  v18 = [v17 count];

  if (v18)
  {
    v19 = [MEMORY[0x263F62ED8] accountPlugin];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_2405DFA6C();
    }
  }
  v20 = *MEMORY[0x263EFB478];
  v21 = [*(id *)(a1 + 40) isEnabledForDataclass:*MEMORY[0x263EFB478]];
  v22 = *(_DWORD *)(a1 + 72);
  switch(v22)
  {
    case 3:
      if (v21) {
        [*(id *)(a1 + 48) deleteAccountForACAccount:*(void *)(a1 + 40)];
      }
      break;
    case 2:
      v23 = [*v7 dirtyProperties];
      v24 = [v23 containsObject:*MEMORY[0x263EFB148]];

      if (v24)
      {
        v25 = [*(id *)(a1 + 32) enabledDataclasses];
        v26 = *(void **)(a1 + 56);
        if (!v26) {
          v26 = *(void **)(a1 + 64);
        }
        v27 = [v26 enabledDataclasses];
        v28 = (void *)[v25 mutableCopy];
        [v28 minusSet:v27];
        if ([v28 containsObject:v20])
        {
          [*(id *)(a1 + 48) updateAccountForACAccount:*(void *)(a1 + 40)];
        }
        else
        {
          v29 = (void *)[v27 mutableCopy];
          [v29 minusSet:v25];
          if ([v29 containsObject:v20]) {
            [*(id *)(a1 + 48) deleteAccountForACAccount:*(void *)(a1 + 40)];
          }
        }
      }
      break;
    case 1:
      if (v21) {
        [*(id *)(a1 + 48) updateAccountForACAccount:*(void *)(a1 + 40)];
      }
      break;
  }
}

uint64_t sub_2405DF45C()
{
  qword_26AFC7388 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAE58], *MEMORY[0x263EFAE80], *MEMORY[0x263EFAFE0], *MEMORY[0x263EFAEB0], *MEMORY[0x263EFAEF8], 0);
  return MEMORY[0x270F9A758]();
}

void sub_2405DF724(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x263F62ED8] accountPlugin];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109634;
      int v10 = a2;
      __int16 v11 = 1024;
      int v12 = a3;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_2405DE000, v7, OS_LOG_TYPE_ERROR, "Failed to update account: didAddAccount: %d, didChangeAccount: %d, error: %@", (uint8_t *)&v9, 0x18u);
    }
  }
  else
  {
    v8 = [MEMORY[0x263F62ED8] accountPlugin];
    v7 = v8;
    if ((a2 & 1) != 0 || a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 67109376;
        int v10 = a2;
        __int16 v11 = 1024;
        int v12 = a3;
        _os_log_impl(&dword_2405DE000, v7, OS_LOG_TYPE_INFO, "Successfully updated account: didAddAccount: %d, didChangeAccount: %d", (uint8_t *)&v9, 0xEu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_2405DFE34(v7);
    }
  }
}

void sub_2405DF960(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = [MEMORY[0x263F62ED8] accountPlugin];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2405DFE78((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2405DE000, v5, OS_LOG_TYPE_INFO, "Successfully deleted account", v6, 2u);
  }
}

void sub_2405DFA34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_2405DFA54(uint64_t a1)
{
  return *(void *)a1;
}

void sub_2405DFA6C()
{
  sub_2405DFA60();
  v2 = [(id)sub_2405DFA54(v1) identifier];
  id v3 = [*v0 dirtyDataclassProperties];
  sub_2405DFA1C();
  sub_2405DFA34(&dword_2405DE000, v4, v5, "Dirty dataclass properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405DFB0C()
{
  sub_2405DFA60();
  v2 = [(id)sub_2405DFA54(v1) identifier];
  id v3 = [*v0 dirtyAccountProperties];
  sub_2405DFA1C();
  sub_2405DFA34(&dword_2405DE000, v4, v5, "Dirty account properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405DFBAC(uint64_t a1, NSObject *a2)
{
  id v3 = [(id)sub_2405DFA54(a1) enabledDataclasses];
  int v4 = [v3 containsObject:*MEMORY[0x263EFB478]];
  uint64_t v5 = @"is not";
  if (v4) {
    uint64_t v5 = @"is";
  }
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_2405DE000, a2, OS_LOG_TYPE_DEBUG, "Reminders dataclass %@ enabled", (uint8_t *)&v6, 0xCu);
}

void sub_2405DFC6C()
{
  sub_2405DFA60();
  v2 = [(id)sub_2405DFA54(v1) identifier];
  id v3 = [*v0 dirtyProperties];
  sub_2405DFA1C();
  sub_2405DFA34(&dword_2405DE000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405DFD0C()
{
  sub_2405DFA60();
  v2 = [v1 displayAccount];
  id v3 = [v0 displayAccount];
  uint64_t v4 = [v3 accountProperties];
  sub_2405DFA1C();
  sub_2405DFA34(&dword_2405DE000, v5, v6, "Received notification about the primary iCloud account (%@), but it has no dataclass properties yet. Here are the account properties: %@", v7, v8, v9, v10, v11);
}

void sub_2405DFDBC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2405DE000, a2, OS_LOG_TYPE_DEBUG, "Not processing account with account type identifier %@", (uint8_t *)&v2, 0xCu);
}

void sub_2405DFE34(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_2405DE000, log, OS_LOG_TYPE_DEBUG, "Didn't add or change account", v1, 2u);
}

void sub_2405DFE78(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2405DE000, a2, OS_LOG_TYPE_ERROR, "Failed to delete account: error: %@", (uint8_t *)&v2, 0xCu);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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