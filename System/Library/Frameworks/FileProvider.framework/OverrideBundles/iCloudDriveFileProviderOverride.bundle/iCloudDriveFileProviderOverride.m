uint64_t sub_243361230(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x263EFF710]] ^ 1;
}

uint64_t sub_243361430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_243361448(uint64_t a1, uint64_t a2, uint64_t a3)
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

void sub_24336151C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = [*(id *)(a1 + 32) bookmarkPrefix];
    id v12 = [v10 stringByAppendingString:v7];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v12, v9);
  }
}

uint64_t sub_243361718(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_243361728(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_24335F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] [%@] not our domain%@", (uint8_t *)&v3, 0x16u);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}