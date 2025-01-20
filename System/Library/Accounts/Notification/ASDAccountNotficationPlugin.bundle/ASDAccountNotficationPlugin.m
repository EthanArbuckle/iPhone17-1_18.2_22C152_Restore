uint64_t sub_24056C658(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  self;
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = v5;
  }
  v7 = v6;
  if (objc_msgSend(v7, "ams_isiTunesAccount"))
  {
    v8 = objc_msgSend(v7, "ams_DSID");
    if (v8 && (objc_msgSend(v7, "ams_isLocalAccount") & 1) == 0) {
      v9 = objc_msgSend(v7, "ams_isSandboxAccount") ^ 1;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_24056C70C(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = ASDLogHandleForCategory();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2112;
      id v12 = v5;
      id v8 = v10;
      _os_log_error_impl(&dword_24056B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] sbsync finished with error: %{pubic}@", (uint8_t *)&v9, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 1024;
    LODWORD(v12) = a2;
    id v8 = v10;
    _os_log_impl(&dword_24056B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: sbsync finished with result: %d", (uint8_t *)&v9, 0x12u);
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t ASDLogHandleForCategory()
{
  return MEMORY[0x270F0CCC8]();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}