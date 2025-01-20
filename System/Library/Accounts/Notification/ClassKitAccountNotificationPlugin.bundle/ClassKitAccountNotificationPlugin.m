void sub_2405780E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2405781C4(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CLSInitLog();
  v2 = (void *)*MEMORY[0x263EFCEB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263EFCEB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    v4 = v2;
    if ((v3 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown changeType: %lu", v3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_2650C1F18[(int)v3 - 1];
    }
    v6 = [*(id *)(a1 + 32) username];
    v7 = [*(id *)(a1 + 40) username];
    *(_DWORD *)buf = 138544386;
    v18 = v5;
    __int16 v19 = 2160;
    uint64_t v20 = 1752392040;
    __int16 v21 = 2112;
    v22 = v6;
    __int16 v23 = 2160;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_240577000, v4, OS_LOG_TYPE_DEFAULT, "ClassKitAccountNotificationPlugin: Account changed: [type: %{public}@, newAccount.username.hash: %{mask.hash}@, oldAccount.username.hash: %{mask.hash}@]", buf, 0x34u);
  }
  CLSLogDebugCurrentPersona();
  int v8 = *(_DWORD *)(a1 + 56);
  if (v8 != 3)
  {
    if (v8 == 1)
    {
      v9 = *(void **)(a1 + 32);
      if (!v9) {
        return;
      }
      v10 = [v9 accountType];
      v11 = [v10 identifier];
      if (([v11 isEqualToString:*MEMORY[0x263EFAE58]] & 1) == 0)
      {

        goto LABEL_15;
      }
      v12 = objc_msgSend(*(id *)(a1 + 32), "aa_cloudKitAccount");

      if (!v12) {
        return;
      }
    }
LABEL_14:
    v10 = [*(id *)(a1 + 48) connection];
    [v10 accountChanged];
LABEL_15:

    return;
  }
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v14 = [v13 accountType];
    v15 = [v14 identifier];
    int v16 = [v15 isEqualToString:*MEMORY[0x263EFAE58]];

    if (v16) {
      goto LABEL_14;
    }
  }
}

uint64_t CLSInitLog()
{
  return MEMORY[0x270EE3118]();
}

uint64_t CLSLogDebugCurrentPersona()
{
  return MEMORY[0x270EE3120]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}