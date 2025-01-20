void sub_243355D00(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t vars8;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = [*(id *)(a1 + 32) bookmarkPrefix];
    v12 = [v10 stringByAppendingString:v7];
  }
  else
  {
    v12 = 0;
  }
  v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v12, v9);
  }
}

uint64_t sub_243355EFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2433560EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_243356104(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "br_fileProviderError");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5 == 0);
}

uint64_t sub_243356328(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_243356340(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "br_fileProviderError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F325C8]) initWithURL:*(void *)(a1 + 32) readingOptions:0];
    [v5 setWantsCurrentVersion:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2433564A4;
    v9[3] = &unk_26517E3E0;
    id v10 = *(id *)(a1 + 40);
    [v5 setFileProvidingCompletion:v9];
    id v6 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v6 addOperation:v5];
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

uint64_t sub_2433564A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

uint64_t sub_24335661C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24335662C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  id v6 = a3;
  v5(v4, a2);
  v6[2]();
}

uint64_t sub_243356830(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_243356848(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "br_fileProviderError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = [MEMORY[0x263F406B8] manager];
    uint64_t v10 = *(void *)(a1 + 32);
    id v30 = 0;
    v11 = [v9 permanentStorageForItemAtURL:v10 allocateIfNone:0 error:&v30];
    id v8 = v30;

    if (v11)
    {
      uint64_t v12 = *MEMORY[0x263F40698];
      id v29 = v8;
      v13 = [v11 additionWithName:v5 inNameSpace:v12 error:&v29];
      id v14 = v29;

      if (v13)
      {
        v15 = (void *)MEMORY[0x263F08860];
        uint64_t v16 = *(void *)(a1 + 32);
        v17 = [v13 persistentIdentifier];
        v18 = [v15 versionOfItemAtURL:v16 forPersistentIdentifier:v17];

        if (v18)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          v23 = brc_bread_crumbs();
          v24 = brc_default_log();
          if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
            sub_243356EE8((uint64_t)v23, v24);
          }

          v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v26 = *(void *)(a1 + 40);
          v27 = [*(id *)(a1 + 32) path];
          v28 = objc_msgSend(v25, "brc_errorItemNotFound:", v27);
          (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v28);
        }
      }
      else
      {
        v21 = brc_bread_crumbs();
        v22 = brc_default_log();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v32 = v5;
          __int16 v33 = 2112;
          id v34 = v14;
          __int16 v35 = 2112;
          v36 = v21;
          _os_log_error_impl(&dword_243354000, v22, (os_log_type_t)0x90u, "[ERROR] Couldn't find addition with name %@ - %@%@", buf, 0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

      id v8 = v14;
    }
    else
    {
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        sub_243356E70();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t sub_243356C28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_243356E0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_243356E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  if ((*(void *)(a1 + 40) & a2) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v6);
}

void sub_243356E70()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_243356E58();
  _os_log_error_impl(&dword_243354000, v0, (os_log_type_t)0x90u, "[ERROR] Couldn't get storage after received version - %@%@", v1, 0x16u);
}

void sub_243356EE8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243354000, a2, (os_log_type_t)0x90u, "[ERROR] Couldn't look up file version by persistent identifier%@", (uint8_t *)&v2, 0xCu);
}

void sub_243356F60()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_243356E58();
  _os_log_debug_impl(&dword_243354000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] [%@] not our domain%@", v1, 0x16u);
}

uint64_t BRSynchronousEvictItemAtURLWithOptions()
{
  return MEMORY[0x270F16BB0]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return MEMORY[0x270F16C40]();
}

uint64_t brc_default_log()
{
  return MEMORY[0x270F16C50]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}