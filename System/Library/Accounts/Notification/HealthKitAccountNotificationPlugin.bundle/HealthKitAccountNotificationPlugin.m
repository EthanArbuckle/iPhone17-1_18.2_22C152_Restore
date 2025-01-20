void sub_2405AAFC0(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x263EF8340];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x263F09960];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09960], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void *)(a1 + 32);
    v8 = @"Did not";
    v9 = 138543874;
    if (a2) {
      v8 = @"Did";
    }
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_2405A9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ notify about account change %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_2405AB0B0(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    _HKInitializeLogging();
    v7 = (os_log_t *)MEMORY[0x263F09960];
    v8 = *MEMORY[0x263F09960];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09960], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = @"Did";
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_2405A9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ send new device added notification message successfully. Error: %{public}@", buf, 0x20u);
    }
    v10 = *(void **)(a1 + 40);
    v11 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = *MEMORY[0x263F0AD38];
    id v16 = v6;
    char v13 = [v10 setDate:v11 forKey:v12 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      v15 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        sub_2405AB2A8(a1, (uint64_t)v14, v15);
      }
    }
  }
  else
  {
    id v14 = v5;
  }
}

void sub_2405AB220(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2405A9000, log, OS_LOG_TYPE_ERROR, "%{public}@: Getting last notified of account change failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_2405AB2A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_2405A9000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}