uint64_t BLTPBSetNotificationsSoundRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222F4FFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_222F50864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223CAC810](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

const char *BLTIDSConnectionStatusString(unint64_t a1)
{
  if (a1 > 3) {
    return "unknown";
  }
  else {
    return off_264683DD8[a1];
  }
}

void sub_222F52054(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void _BLTLogIDSSendFail(int a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = blt_ids_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412802;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = a1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_error_impl(&dword_222F4C000, v7, OS_LOG_TYPE_ERROR, "IDS error sending request with identifier %@ (paired device ready: %{BOOL}u): %@", (uint8_t *)&v8, 0x1Cu);
  }
}

void sub_222F53900(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__263(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__264(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_222F54ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222F55FD0(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    v3 = blt_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BLTObjectStore objectForKey:]();
    }

    objc_end_catch();
    JUMPOUT(0x222F55F74);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id blt_bug_reporter_log()
{
  if (blt_bug_reporter_log_onceToken != -1) {
    dispatch_once(&blt_bug_reporter_log_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)blt_bug_reporter_log___logger;
  return v0;
}

uint64_t __blt_bug_reporter_log_block_invoke()
{
  blt_bug_reporter_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "bug_reporter");
  return MEMORY[0x270F9A758]();
}

id blt_dnd_log()
{
  if (blt_dnd_log_onceToken != -1) {
    dispatch_once(&blt_dnd_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)blt_dnd_log___logger;
  return v0;
}

uint64_t __blt_dnd_log_block_invoke()
{
  blt_dnd_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "dnd");
  return MEMORY[0x270F9A758]();
}

id blt_general_log()
{
  if (blt_general_log_onceToken != -1) {
    dispatch_once(&blt_general_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)blt_general_log___logger;
  return v0;
}

uint64_t __blt_general_log_block_invoke()
{
  blt_general_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "general");
  return MEMORY[0x270F9A758]();
}

id blt_lights_and_sirens_log()
{
  if (blt_lights_and_sirens_log_onceToken != -1) {
    dispatch_once(&blt_lights_and_sirens_log_onceToken, &__block_literal_global_10_0);
  }
  v0 = (void *)blt_lights_and_sirens_log___logger;
  return v0;
}

uint64_t __blt_lights_and_sirens_log_block_invoke()
{
  blt_lights_and_sirens_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "lights_and_sirens");
  return MEMORY[0x270F9A758]();
}

id blt_send_queue_log()
{
  if (blt_send_queue_log_onceToken != -1) {
    dispatch_once(&blt_send_queue_log_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)blt_send_queue_log___logger;
  return v0;
}

uint64_t __blt_send_queue_log_block_invoke()
{
  blt_send_queue_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "send_queue");
  return MEMORY[0x270F9A758]();
}

id blt_standalone_log()
{
  if (blt_standalone_log_onceToken != -1) {
    dispatch_once(&blt_standalone_log_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)blt_standalone_log___logger;
  return v0;
}

uint64_t __blt_standalone_log_block_invoke()
{
  blt_standalone_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "standalone");
  return MEMORY[0x270F9A758]();
}

id blt_ids_log()
{
  if (blt_ids_log_onceToken != -1) {
    dispatch_once(&blt_ids_log_onceToken, &__block_literal_global_19_0);
  }
  v0 = (void *)blt_ids_log___logger;
  return v0;
}

uint64_t __blt_ids_log_block_invoke()
{
  blt_ids_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "ids");
  return MEMORY[0x270F9A758]();
}

id blt_perf_log()
{
  if (blt_perf_log_onceToken != -1) {
    dispatch_once(&blt_perf_log_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)blt_perf_log___logger;
  return v0;
}

uint64_t __blt_perf_log_block_invoke()
{
  blt_perf_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "perf");
  return MEMORY[0x270F9A758]();
}

id blt_settings_log()
{
  if (blt_settings_log_onceToken != -1) {
    dispatch_once(&blt_settings_log_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)blt_settings_log___logger;
  return v0;
}

uint64_t __blt_settings_log_block_invoke()
{
  blt_settings_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "settings");
  return MEMORY[0x270F9A758]();
}

id blt_notification_size_log()
{
  if (blt_notification_size_log_onceToken != -1) {
    dispatch_once(&blt_notification_size_log_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)blt_notification_size_log___logger;
  return v0;
}

uint64_t __blt_notification_size_log_block_invoke()
{
  blt_notification_size_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "notification_size");
  return MEMORY[0x270F9A758]();
}

id blt_cleanup_log()
{
  if (blt_cleanup_log_onceToken != -1) {
    dispatch_once(&blt_cleanup_log_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)blt_cleanup_log___logger;
  return v0;
}

uint64_t __blt_cleanup_log_block_invoke()
{
  blt_cleanup_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "cleanup");
  return MEMORY[0x270F9A758]();
}

id blt_xpc_activity_log()
{
  if (blt_xpc_activity_log_onceToken != -1) {
    dispatch_once(&blt_xpc_activity_log_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)blt_xpc_activity_log___logger;
  return v0;
}

uint64_t __blt_xpc_activity_log_block_invoke()
{
  blt_xpc_activity_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "xpc_activity");
  return MEMORY[0x270F9A758]();
}

id blt_global_settings_sync_log()
{
  if (blt_global_settings_sync_log_onceToken != -1) {
    dispatch_once(&blt_global_settings_sync_log_onceToken, &__block_literal_global_37);
  }
  v0 = (void *)blt_global_settings_sync_log___logger;
  return v0;
}

uint64_t __blt_global_settings_sync_log_block_invoke()
{
  blt_global_settings_sync_log___logger = (uint64_t)os_log_create("com.apple.BulletinDistributor", "global_settings_sync");
  return MEMORY[0x270F9A758]();
}

void _BLTPerfLogCurrentThreadPriority(uint64_t a1)
{
  kern_return_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  integer_t thread_info_out[4];
  long long v16;
  uint64_t v17;
  mach_msg_type_number_t thread_info_outCnt;
  unsigned char v19[22];
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x263EF8340];
  id v2 = blt_perf_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (!v3) {
    return;
  }
  label = dispatch_queue_get_label(0);
  id v5 = pthread_self();
  thread_inspect_t v6 = pthread_mach_thread_np(v5);
  v17 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v16 = 0u;
  thread_info_outCnt = 10;
  if (!thread_info(v6, 3u, thread_info_out, &thread_info_outCnt))
  {
    if ((DWORD1(v16) - 1) > 1)
    {
      v7 = @"Unknown thread policy";
      goto LABEL_18;
    }
    if (DWORD1(v16) == 1)
    {
      memset(v19, 0, 20);
      thread_info_outCnt = 5;
      int v8 = thread_info(v6, 0xAu, (thread_info_t)v19, &thread_info_outCnt);
      uint64_t v9 = *(unsigned int *)&v19[4];
      __int16 v10 = *(unsigned int *)&v19[8];
    }
    else
    {
      if (DWORD1(v16) != 2)
      {
        __int16 v10 = 0;
        uint64_t v9 = 0;
        int v11 = "timeshare";
        goto LABEL_16;
      }
      memset(v19, 0, 20);
      thread_info_outCnt = 5;
      int v8 = thread_info(v6, 0xBu, (thread_info_t)v19, &thread_info_outCnt);
      uint64_t v9 = *(unsigned int *)&v19[4];
      __int16 v10 = *(unsigned int *)&v19[4];
    }
    if (DWORD1(v16) == 2) {
      int v11 = "fixed";
    }
    else {
      int v11 = "timeshare";
    }
    if (v8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to get thread priority %s info", v11, v13, v14);
LABEL_17:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    objc_msgSend(NSString, "stringWithFormat:", @"thread priority %s base: %d current: %d", v11, v9, v10);
    goto LABEL_17;
  }
  v7 = @"Unable to get thread info";
LABEL_18:
  __int16 v12 = blt_perf_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 136315650;
    *(void *)&v19[4] = a1;
    *(_WORD *)&v19[12] = 2080;
    *(void *)&v19[14] = label;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_222F4C000, v12, OS_LOG_TYPE_DEBUG, "Function: %s Queue: %s %@", v19, 0x20u);
  }
}

_DWORD *BLTStateDataWithTitleAndDescription(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v9 = 0;
  uint64_t v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a2 format:200 options:0 error:&v9];
  id v5 = v4;
  if (v4)
  {
    size_t v6 = [v4 length];
    v7 = malloc_type_calloc(1uLL, v6 + 200, 0x992B924AuLL);
    _DWORD *v7 = 1;
    v7[1] = v6;
    [v3 UTF8String];
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)[v5 bytes], v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t BLTPBRemoveSectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBRemoveBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBBulletinReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_209;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 296;
        goto LABEL_209;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 288;
        goto LABEL_209;
      case 4u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 408;
        goto LABEL_209;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 360;
        goto LABEL_209;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 248;
        goto LABEL_209;
      case 7u:
        *(_DWORD *)(a1 + 440) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 8;
        goto LABEL_306;
      case 8u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 80;
        goto LABEL_209;
      case 9u:
        v23 = objc_alloc_init(BLTPBAction);
        [(id)a1 addSupplementaryActions:v23];
        goto LABEL_194;
      case 0xAu:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v15 = v25++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_223;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_223:
        uint64_t v159 = 200;
        goto LABEL_284;
      case 0xBu:
        v23 = objc_alloc_init(BLTPBAction);
        uint64_t v31 = 312;
        goto LABEL_193;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 272;
        goto LABEL_209;
      case 0xDu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 264;
        goto LABEL_209;
      case 0xEu:
        v23 = objc_alloc_init(BLTPBAction);
        uint64_t v31 = 176;
        goto LABEL_193;
      case 0xFu:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v26 = 0;
        *(_DWORD *)(a1 + 440) |= 0x100u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v26 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_227;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_227:
        uint64_t v159 = 304;
        goto LABEL_284;
      case 0x10u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 320;
        goto LABEL_209;
      case 0x11u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_209;
      case 0x12u:
        *(_DWORD *)(a1 + 440) |= 4u;
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v39);
          *(void *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 24;
        goto LABEL_306;
      case 0x13u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v42 = 0;
        while (2)
        {
          uint64_t v43 = *v3;
          uint64_t v44 = *(void *)(a2 + v43);
          unint64_t v45 = v44 + 1;
          if (v44 == -1 || v45 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
            *(void *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              BOOL v15 = v41++ >= 9;
              if (v15)
              {
                uint64_t v42 = 0;
                goto LABEL_231;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v42 = 0;
        }
LABEL_231:
        BOOL v160 = v42 != 0;
        uint64_t v161 = 429;
        goto LABEL_293;
      case 0x14u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 384;
        goto LABEL_209;
      case 0x15u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 160;
        goto LABEL_209;
      case 0x16u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 416;
        goto LABEL_209;
      case 0x17u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 64;
        goto LABEL_209;
      case 0x18u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v26 = 0;
        *(_DWORD *)(a1 + 440) |= 0x200u;
        while (2)
        {
          uint64_t v49 = *v3;
          uint64_t v50 = *(void *)(a2 + v49);
          unint64_t v51 = v50 + 1;
          if (v50 == -1 || v51 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v51;
            v26 |= (unint64_t)(v52 & 0x7F) << v47;
            if (v52 < 0)
            {
              v47 += 7;
              BOOL v15 = v48++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_235;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_235:
        uint64_t v159 = 336;
        goto LABEL_284;
      case 0x19u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 328;
        goto LABEL_209;
      case 0x1Au:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 344;
        goto LABEL_209;
      case 0x1Bu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v26 = 0;
        *(_DWORD *)(a1 + 440) |= 0x40u;
        while (2)
        {
          uint64_t v55 = *v3;
          uint64_t v56 = *(void *)(a2 + v55);
          unint64_t v57 = v56 + 1;
          if (v56 == -1 || v57 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
            *(void *)(a2 + v55) = v57;
            v26 |= (unint64_t)(v58 & 0x7F) << v53;
            if (v58 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_239;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_239:
        uint64_t v159 = 96;
        goto LABEL_284;
      case 0x1Cu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v61 = 0;
        *(_DWORD *)(a1 + 440) |= 0x800u;
        while (2)
        {
          uint64_t v62 = *v3;
          uint64_t v63 = *(void *)(a2 + v62);
          unint64_t v64 = v63 + 1;
          if (v63 == -1 || v64 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
            *(void *)(a2 + v62) = v64;
            v61 |= (unint64_t)(v65 & 0x7F) << v59;
            if (v65 < 0)
            {
              v59 += 7;
              BOOL v15 = v60++ >= 9;
              if (v15)
              {
                uint64_t v61 = 0;
                goto LABEL_243;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v61 = 0;
        }
LABEL_243:
        BOOL v160 = v61 != 0;
        uint64_t v161 = 425;
        goto LABEL_293;
      case 0x1Du:
        char v66 = 0;
        unsigned int v67 = 0;
        uint64_t v68 = 0;
        *(_DWORD *)(a1 + 440) |= 0x10000u;
        while (2)
        {
          uint64_t v69 = *v3;
          uint64_t v70 = *(void *)(a2 + v69);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
            *(void *)(a2 + v69) = v71;
            v68 |= (unint64_t)(v72 & 0x7F) << v66;
            if (v72 < 0)
            {
              v66 += 7;
              BOOL v15 = v67++ >= 9;
              if (v15)
              {
                uint64_t v68 = 0;
                goto LABEL_247;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v68 = 0;
        }
LABEL_247:
        BOOL v160 = v68 != 0;
        uint64_t v161 = 431;
        goto LABEL_293;
      case 0x1Eu:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v75 = 0;
        *(_DWORD *)(a1 + 440) |= 0x200000u;
        while (2)
        {
          uint64_t v76 = *v3;
          uint64_t v77 = *(void *)(a2 + v76);
          unint64_t v78 = v77 + 1;
          if (v77 == -1 || v78 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v77);
            *(void *)(a2 + v76) = v78;
            v75 |= (unint64_t)(v79 & 0x7F) << v73;
            if (v79 < 0)
            {
              v73 += 7;
              BOOL v15 = v74++ >= 9;
              if (v15)
              {
                uint64_t v75 = 0;
                goto LABEL_251;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v75 = 0;
        }
LABEL_251:
        BOOL v160 = v75 != 0;
        uint64_t v161 = 436;
        goto LABEL_293;
      case 0x1Fu:
        PBReaderReadString();
        v23 = (BLTPBAction *)objc_claimAutoreleasedReturnValue();
        if (v23) {
          [(id)a1 addSubsectionIDs:v23];
        }
        goto LABEL_197;
      case 0x20u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 184;
        goto LABEL_209;
      case 0x21u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 104;
        goto LABEL_209;
      case 0x22u:
        PBReaderReadString();
        v23 = (BLTPBAction *)objc_claimAutoreleasedReturnValue();
        if (v23) {
          [(id)a1 addPeopleIDs:v23];
        }
        goto LABEL_197;
      case 0x23u:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        *(_DWORD *)(a1 + 440) |= 0x4000u;
        while (2)
        {
          uint64_t v83 = *v3;
          uint64_t v84 = *(void *)(a2 + v83);
          unint64_t v85 = v84 + 1;
          if (v84 == -1 || v85 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
            *(void *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              BOOL v15 = v81++ >= 9;
              if (v15)
              {
                uint64_t v82 = 0;
                goto LABEL_255;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v82 = 0;
        }
LABEL_255:
        BOOL v160 = v82 != 0;
        uint64_t v161 = 428;
        goto LABEL_293;
      case 0x24u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_209;
      case 0x25u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 168;
        goto LABEL_209;
      case 0x26u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 72;
        goto LABEL_209;
      case 0x27u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 392;
        goto LABEL_209;
      case 0x28u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_209;
      case 0x29u:
        v23 = objc_alloc_init(BLTPBBulletinAttachment);
        [(id)a1 addAdditionalAttachments:v23];
        if (!PBReaderPlaceMark() || (BLTPBBulletinAttachmentReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_309;
        }
        goto LABEL_196;
      case 0x2Au:
        *(_DWORD *)(a1 + 440) |= 8u;
        uint64_t v87 = *v3;
        unint64_t v88 = *(void *)(a2 + v87);
        if (v88 <= 0xFFFFFFFFFFFFFFF7 && v88 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v88);
          *(void *)(a2 + v87) = v88 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 32;
        goto LABEL_306;
      case 0x2Bu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 280;
        goto LABEL_209;
      case 0x2Cu:
        *(_DWORD *)(a1 + 440) |= 0x20u;
        uint64_t v89 = *v3;
        unint64_t v90 = *(void *)(a2 + v89);
        if (v90 <= 0xFFFFFFFFFFFFFFF7 && v90 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v90);
          *(void *)(a2 + v89) = v90 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 48;
        goto LABEL_306;
      case 0x2Du:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v93 = 0;
        *(_DWORD *)(a1 + 440) |= 0x80000u;
        while (2)
        {
          uint64_t v94 = *v3;
          uint64_t v95 = *(void *)(a2 + v94);
          unint64_t v96 = v95 + 1;
          if (v95 == -1 || v96 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v95);
            *(void *)(a2 + v94) = v96;
            v93 |= (unint64_t)(v97 & 0x7F) << v91;
            if (v97 < 0)
            {
              v91 += 7;
              BOOL v15 = v92++ >= 9;
              if (v15)
              {
                uint64_t v93 = 0;
                goto LABEL_259;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v93 = 0;
        }
LABEL_259:
        BOOL v160 = v93 != 0;
        uint64_t v161 = 434;
        goto LABEL_293;
      case 0x2Eu:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v100 = 0;
        *(_DWORD *)(a1 + 440) |= 0x40000u;
        while (2)
        {
          uint64_t v101 = *v3;
          uint64_t v102 = *(void *)(a2 + v101);
          unint64_t v103 = v102 + 1;
          if (v102 == -1 || v103 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
            *(void *)(a2 + v101) = v103;
            v100 |= (unint64_t)(v104 & 0x7F) << v98;
            if (v104 < 0)
            {
              v98 += 7;
              BOOL v15 = v99++ >= 9;
              if (v15)
              {
                uint64_t v100 = 0;
                goto LABEL_263;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v100 = 0;
        }
LABEL_263:
        BOOL v160 = v100 != 0;
        uint64_t v161 = 433;
        goto LABEL_293;
      case 0x2Fu:
        char v105 = 0;
        unsigned int v106 = 0;
        uint64_t v107 = 0;
        *(_DWORD *)(a1 + 440) |= 0x1000u;
        while (2)
        {
          uint64_t v108 = *v3;
          uint64_t v109 = *(void *)(a2 + v108);
          unint64_t v110 = v109 + 1;
          if (v109 == -1 || v110 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
            *(void *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              BOOL v15 = v106++ >= 9;
              if (v15)
              {
                uint64_t v107 = 0;
                goto LABEL_267;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v107 = 0;
        }
LABEL_267:
        BOOL v160 = v107 != 0;
        uint64_t v161 = 426;
        goto LABEL_293;
      case 0x30u:
        *(_DWORD *)(a1 + 440) |= 0x10u;
        uint64_t v112 = *v3;
        unint64_t v113 = *(void *)(a2 + v112);
        if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v113);
          *(void *)(a2 + v112) = v113 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 40;
        goto LABEL_306;
      case 0x31u:
        char v114 = 0;
        unsigned int v115 = 0;
        uint64_t v116 = 0;
        *(_DWORD *)(a1 + 440) |= 0x20000u;
        while (2)
        {
          uint64_t v117 = *v3;
          uint64_t v118 = *(void *)(a2 + v117);
          unint64_t v119 = v118 + 1;
          if (v118 == -1 || v119 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v118);
            *(void *)(a2 + v117) = v119;
            v116 |= (unint64_t)(v120 & 0x7F) << v114;
            if (v120 < 0)
            {
              v114 += 7;
              BOOL v15 = v115++ >= 9;
              if (v15)
              {
                uint64_t v116 = 0;
                goto LABEL_271;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v116 = 0;
        }
LABEL_271:
        BOOL v160 = v116 != 0;
        uint64_t v161 = 432;
        goto LABEL_293;
      case 0x32u:
        char v121 = 0;
        unsigned int v122 = 0;
        uint64_t v123 = 0;
        *(_DWORD *)(a1 + 440) |= 0x100000u;
        while (2)
        {
          uint64_t v124 = *v3;
          uint64_t v125 = *(void *)(a2 + v124);
          unint64_t v126 = v125 + 1;
          if (v125 == -1 || v126 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v125);
            *(void *)(a2 + v124) = v126;
            v123 |= (unint64_t)(v127 & 0x7F) << v121;
            if (v127 < 0)
            {
              v121 += 7;
              BOOL v15 = v122++ >= 9;
              if (v15)
              {
                uint64_t v123 = 0;
                goto LABEL_275;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v123 = 0;
        }
LABEL_275:
        BOOL v160 = v123 != 0;
        uint64_t v161 = 435;
        goto LABEL_293;
      case 0x33u:
        v23 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 232), v23);
        if (!PBReaderPlaceMark() || (BLTPBSectionIconReadFrom(v23, a2) & 1) == 0) {
          goto LABEL_309;
        }
        goto LABEL_196;
      case 0x34u:
        char v128 = 0;
        unsigned int v129 = 0;
        uint64_t v130 = 0;
        *(_DWORD *)(a1 + 440) |= 0x400u;
        while (2)
        {
          uint64_t v131 = *v3;
          uint64_t v132 = *(void *)(a2 + v131);
          unint64_t v133 = v132 + 1;
          if (v132 == -1 || v133 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v134 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
            *(void *)(a2 + v131) = v133;
            v130 |= (unint64_t)(v134 & 0x7F) << v128;
            if (v134 < 0)
            {
              v128 += 7;
              BOOL v15 = v129++ >= 9;
              if (v15)
              {
                uint64_t v130 = 0;
                goto LABEL_279;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v130 = 0;
        }
LABEL_279:
        BOOL v160 = v130 != 0;
        uint64_t v161 = 424;
        goto LABEL_293;
      case 0x35u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 224;
        goto LABEL_209;
      case 0x38u:
        char v136 = 0;
        unsigned int v137 = 0;
        uint64_t v26 = 0;
        *(_DWORD *)(a1 + 440) |= 0x80u;
        while (2)
        {
          uint64_t v138 = *v3;
          uint64_t v139 = *(void *)(a2 + v138);
          unint64_t v140 = v139 + 1;
          if (v139 == -1 || v140 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v141 = *(unsigned char *)(*(void *)(a2 + *v7) + v139);
            *(void *)(a2 + v138) = v140;
            v26 |= (unint64_t)(v141 & 0x7F) << v136;
            if (v141 < 0)
            {
              v136 += 7;
              BOOL v15 = v137++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_283;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_283:
        uint64_t v159 = 240;
LABEL_284:
        *(_DWORD *)(a1 + v159) = v26;
        goto LABEL_307;
      case 0x3Au:
        v23 = objc_alloc_init(BLTPBCommunicationContext);
        objc_storeStrong((id *)(a1 + 144), v23);
        if (!PBReaderPlaceMark() || (BLTPBCommunicationContextReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_309;
        }
        goto LABEL_196;
      case 0x3Bu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 152;
        goto LABEL_209;
      case 0x3Cu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 208;
        goto LABEL_209;
      case 0x3Du:
        v23 = objc_alloc_init(BLTPBAction);
        uint64_t v31 = 216;
LABEL_193:
        objc_storeStrong((id *)(a1 + v31), v23);
LABEL_194:
        if PBReaderPlaceMark() && (BLTPBActionReadFrom((uint64_t)v23, a2))
        {
LABEL_196:
          PBReaderRecallMark();
LABEL_197:

LABEL_307:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_309:

        return 0;
      case 0x3Eu:
        char v142 = 0;
        unsigned int v143 = 0;
        uint64_t v144 = 0;
        *(_DWORD *)(a1 + 440) |= 0x2000u;
        while (2)
        {
          uint64_t v145 = *v3;
          uint64_t v146 = *(void *)(a2 + v145);
          unint64_t v147 = v146 + 1;
          if (v146 == -1 || v147 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v148 = *(unsigned char *)(*(void *)(a2 + *v7) + v146);
            *(void *)(a2 + v145) = v147;
            v144 |= (unint64_t)(v148 & 0x7F) << v142;
            if (v148 < 0)
            {
              v142 += 7;
              BOOL v15 = v143++ >= 9;
              if (v15)
              {
                uint64_t v144 = 0;
                goto LABEL_288;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v144 = 0;
        }
LABEL_288:
        BOOL v160 = v144 != 0;
        uint64_t v161 = 427;
        goto LABEL_293;
      case 0x3Fu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 368;
        goto LABEL_209;
      case 0x40u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 400;
        goto LABEL_209;
      case 0x41u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 112;
        goto LABEL_209;
      case 0x42u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 192;
LABEL_209:
        v149 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_307;
      case 0x43u:
        *(_DWORD *)(a1 + 440) |= 2u;
        uint64_t v150 = *v3;
        unint64_t v151 = *(void *)(a2 + v150);
        if (v151 <= 0xFFFFFFFFFFFFFFF7 && v151 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v151);
          *(void *)(a2 + v150) = v151 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v162 = 16;
LABEL_306:
        *(void *)(a1 + v162) = v22;
        goto LABEL_307;
      case 0x44u:
        char v152 = 0;
        unsigned int v153 = 0;
        uint64_t v154 = 0;
        *(_DWORD *)(a1 + 440) |= 0x8000u;
        while (2)
        {
          uint64_t v155 = *v3;
          uint64_t v156 = *(void *)(a2 + v155);
          unint64_t v157 = v156 + 1;
          if (v156 == -1 || v157 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v158 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
            *(void *)(a2 + v155) = v157;
            v154 |= (unint64_t)(v158 & 0x7F) << v152;
            if (v158 < 0)
            {
              v152 += 7;
              BOOL v15 = v153++ >= 9;
              if (v15)
              {
                uint64_t v154 = 0;
                goto LABEL_292;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v154 = 0;
        }
LABEL_292:
        BOOL v160 = v154 != 0;
        uint64_t v161 = 430;
LABEL_293:
        *(unsigned char *)(a1 + v161) = v160;
        goto LABEL_307;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_307;
    }
  }
}

uint64_t BLTPBSetSectionSubtypeParametersIconRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v17;

        goto LABEL_47;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_42:
        *(void *)(a1 + 8) = v22;
        goto LABEL_47;
      case 3u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_46:
        *(unsigned char *)(a1 + 32) = v28 != 0;
        goto LABEL_47;
      case 4u:
        char v32 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 16), v32);
        if PBReaderPlaceMark() && (BLTPBSectionIconReadFrom(v32, a2))
        {
          PBReaderRecallMark();

LABEL_47:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_47;
    }
  }
}

uint64_t BLTPBSetNotificationsCriticalAlertRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        unint64_t v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBAckInitialSequenceNumberRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 16) = v26;
      }
      else if (v17 == 2)
      {
        uint64_t v30 = PBReaderReadData();
        char v31 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v30;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + 20) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v10) = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
            {
              char v24 = &OBJC_IVAR___BLTPBDateComponents__second;
              goto LABEL_53;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              break;
            }
            v17 += 7;
            BOOL v23 = v18++ > 8;
            if (v23)
            {
              LODWORD(v19) = 0;
              char v24 = &OBJC_IVAR___BLTPBDateComponents__second;
              goto LABEL_56;
            }
          }
          char v24 = &OBJC_IVAR___BLTPBDateComponents__second;
          goto LABEL_54;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              char v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
              goto LABEL_53;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v23 = v26++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                char v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
                goto LABEL_56;
              }
              continue;
            }
            break;
          }
          char v24 = &OBJC_IVAR___BLTPBDateComponents__hour;
          goto LABEL_54;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (2)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
            {
              char v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
              goto LABEL_53;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v23 = v31++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                char v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
                goto LABEL_56;
              }
              continue;
            }
            break;
          }
          char v24 = &OBJC_IVAR___BLTPBDateComponents__minute;
          goto LABEL_54;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 8u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
        *(void *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
        {
          char v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
          goto LABEL_54;
        }
        v35 += 7;
        BOOL v23 = v36++ > 8;
        if (v23)
        {
          LODWORD(v19) = 0;
          char v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
          goto LABEL_56;
        }
      }
      char v24 = &OBJC_IVAR___BLTPBDateComponents__weekday;
LABEL_53:
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_56:
      *(_DWORD *)(a1 + *v24) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void ApplicationsChanged(uint64_t a1, uint64_t a2)
{
  id v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __ApplicationsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v3, block);
}

uint64_t __ApplicationsChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchWatchKitInfo];
}

uint64_t BLTBBSectionInfoEnabled(void *a1)
{
  id v1 = a1;
  if ([v1 alertType]) {
    LOBYTE(v2) = 1;
  }
  else {
    unint64_t v2 = ((unint64_t)[v1 suppressedSettings] >> 5) & 1;
  }
  if ([v1 lockScreenSetting] == 2) {
    LODWORD(v3) = 1;
  }
  else {
    unint64_t v3 = ((unint64_t)[v1 suppressedSettings] >> 1) & 1;
  }
  uint64_t v4 = [v1 spokenNotificationSetting];
  unsigned int v5 = [v1 allowsNotifications];
  if (v4 == 2) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = v3;
  }
  if ((v5 ^ 1 | v2)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }

  return v7;
}

uint64_t BLTIsAggdLogEnabled()
{
  if (BLTIsAggdLogEnabled_onceToken != -1) {
    dispatch_once(&BLTIsAggdLogEnabled_onceToken, &__block_literal_global_1);
  }
  return BLTIsAggdLogEnabled___BLTAggdLogEnabled;
}

uint64_t __BLTIsAggdLogEnabled_block_invoke()
{
  if (BLTIsDebugBuild()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = BLTDeviceOSIsInternalInstall();
  }
  BLTIsAggdLogEnabled___BLTAggdLogEnabled = result;
  return result;
}

void BLTAnalyticsLogBulletinSize(void *a1, uint64_t a2, void *a3)
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"sectionID";
  v10[1] = @"publisherMatchID";
  v11[0] = a1;
  v11[1] = a3;
  v10[2] = @"bulletinSize";
  unsigned int v5 = NSNumber;
  id v6 = a3;
  id v7 = a1;
  char v8 = [v5 numberWithUnsignedLong:a2];
  v11[2] = v8;
  unsigned int v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  AnalyticsSendEvent();
}

void BLTAnalyticsLogCompanionToGizmoDelay(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = @"sectionID";
  v20[1] = @"publisherMatchID";
  v21[0] = a1;
  v21[1] = a2;
  v20[2] = @"delay";
  unsigned int v9 = NSNumber;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  [a4 timeIntervalSince1970];
  double v14 = v13;
  [v10 timeIntervalSince1970];
  double v16 = v15;

  char v17 = [v9 numberWithDouble:v14 - v16];
  v21[2] = v17;
  v20[3] = @"connectionStatus";
  unsigned int v18 = [NSNumber numberWithUnsignedInteger:a5];
  v21[3] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  AnalyticsSendEvent();
}

void BLTAnalyticsLogOutOfOrderMessage()
{
  if (BLTIsAggdLogEnabled_onceToken != -1) {
    dispatch_once(&BLTIsAggdLogEnabled_onceToken, &__block_literal_global_1);
  }
  if (BLTIsAggdLogEnabled___BLTAggdLogEnabled)
  {
    AnalyticsSendEvent();
  }
}

void BLTAnalyticsLogMirroredNotificationsOverrides(void *a1, void *a2)
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F2BB50];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v4 objectForKeyedSubscript:v3];
  uint64_t v7 = [v6 BOOLValue];

  char v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB48]];

  uint64_t v9 = [v8 BOOLValue];
  v14[0] = v5;
  v13[0] = @"sectionID";
  v13[1] = @"showAlerts";
  id v10 = [NSNumber numberWithBool:v7];
  v14[1] = v10;
  v13[2] = @"sendToNotificationCenter";
  id v11 = [NSNumber numberWithBool:v9];
  v14[2] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  AnalyticsSendEvent();
}

BOOL BLTPBHandleAcknowledgeActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_24:
        uint64_t v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        uint64_t v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

void WristDetectSettingChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __WristDetectSettingChanged_block_invoke;
  block[3] = &unk_264683BD8;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __WristDetectSettingChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWristDetectSetting];
}

uint64_t BLTPBIntelligentSummaryBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          uint64_t v24 = *(void *)(a2 + v23);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0) {
            goto LABEL_37;
          }
          v20 += 7;
          BOOL v15 = v21++ >= 9;
          if (v15)
          {
            LODWORD(v22) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else if (v18 == 2)
      {
        *(unsigned char *)(a1 + 28) |= 1u;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v29 = 0;
        }
        *(void *)(a1 + 8) = v29;
      }
      else if (v18 == 1)
      {
        uint64_t v19 = objc_alloc_init(BLTPBBulletin);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (BLTPBBulletinReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBBulletinSummaryKeyReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
LABEL_24:
        char v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBUpdateBulletinListRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(BLTPBFullBulletinList);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (BLTPBFullBulletinListReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBBulletinSummaryReadFrom(_DWORD *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 6;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 10;
LABEL_24:
        char v20 = *(void **)&a1[v18];
        *(void *)&a1[v18] = v17;

        goto LABEL_39;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        a1[2] = v23;
        goto LABEL_39;
      case 5u:
        uint64_t v27 = objc_alloc_init(BLTPBBulletinSummaryKey);
        [a1 addKey:v27];
        if (PBReaderPlaceMark() && BLTPBBulletinSummaryKeyReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t BLTPBBulletinAttachmentReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_30;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_41:
          *(_DWORD *)(a1 + 16) = v22;
          continue;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_30:
          char v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v29 = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_45:
      *(unsigned char *)(a1 + 32) = v29 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222F6BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222F6CD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _dictionaryFromPBData(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v9 = 0;
    id v5 = +[BLTObjectSerializer unserializeObject:v3 nulls:v4 error:&v9];
    id v6 = v9;
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = v6;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

uint64_t BLTPBSetRemoteGlobalSettingsRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (1)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v30;
          v21 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0) {
            goto LABEL_45;
          }
          v26 += 7;
          BOOL v15 = v27++ >= 9;
          if (v15)
          {
            uint64_t v21 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_47:
        uint64_t v36 = 16;
      }
      else
      {
        if (v18 == 2)
        {
          *(unsigned char *)(a1 + 32) |= 4u;
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v34 = *(void *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v34 = 0;
          }
          *(void *)(a1 + 24) = v34;
          continue;
        }
        if (v18 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_41;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            uint64_t v21 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_43:
        uint64_t v36 = 8;
      }
      *(void *)(a1 + v36) = v21;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBSectionInfoSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_53;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_55:
        uint64_t v41 = 8;
        goto LABEL_68;
      case 2u:
        unint64_t v24 = objc_alloc_init(BLTPBMuteAssertion);
        objc_storeStrong((id *)(a1 + 16), v24);
        if PBReaderPlaceMark() && (BLTPBMuteAssertionReadFrom((uint64_t)v24, a2))
        {
          PBReaderRecallMark();

LABEL_69:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_59:
        uint64_t v41 = 28;
        goto LABEL_68;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        *(unsigned char *)(a1 + 36) |= 8u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                uint64_t v32 = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v32 = 0;
        }
LABEL_63:
        *(unsigned char *)(a1 + 32) = v32 != 0;
        goto LABEL_69;
      case 5u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v19 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v14 = v37++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_67:
        uint64_t v41 = 24;
LABEL_68:
        *(_DWORD *)(a1 + v41) = v19;
        goto LABEL_69;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_69;
    }
  }
}

void sub_222F706AC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_222F71094(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t BLTPBAddBulletinSummaryRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(BLTPBBulletinSummary);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (BLTPBBulletinSummaryReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void _writeDataToFile(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  int v6 = [v4 length];
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v6 length:4];
  [v3 writeData:v5];
  [v3 writeData:v4];
}

id _readDataFromFile(void *a1)
{
  id v1 = a1;
  id v11 = 0;
  id v2 = [v1 readDataUpToLength:4 error:&v11];
  id v3 = v11;
  if (v3)
  {
    id v4 = v3;
    id v5 = blt_send_queue_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      _readDataFromFile_cold_1();
    }
LABEL_4:

LABEL_5:
    id v4 = 0;
    goto LABEL_6;
  }
  if (!v2 || ![v2 length]) {
    goto LABEL_5;
  }
  uint64_t v7 = *(unsigned int *)[v2 bytes];
  id v10 = 0;
  id v4 = [v1 readDataUpToLength:v7 error:&v10];
  char v8 = v10;
  if (v8)
  {
    id v5 = v8;
    unsigned int v9 = blt_send_queue_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      _readDataFromFile_cold_1();
    }

    goto LABEL_4;
  }
LABEL_6:

  return v4;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

BOOL BLTPBSetSectionInfoResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  int v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

id BLTFileURLInAttachmentsPath(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v3 URL];
  int v6 = [v5 pathExtension];

  int v7 = objc_msgSend(v4, "blt_uniqueKey");

  char v8 = [v7 keyString];
  unsigned int v9 = [v3 UUID];

  uint64_t v10 = [v9 UUIDString];
  uint64_t v11 = [v8 stringByAppendingPathComponent:v10];
  unint64_t v12 = [@"attachments" stringByAppendingPathComponent:v11];
  char v13 = [v12 stringByAppendingPathExtension:v6];
  BOOL v14 = BLTFileURLInPairingPath(v13);

  return v14;
}

id BLTBulletinAttachmentsURL(void *a1)
{
  id v1 = objc_msgSend(a1, "blt_uniqueKey");
  id v2 = [v1 keyString];
  id v3 = [@"attachments" stringByAppendingPathComponent:v2];
  id v4 = BLTFileURLInPairingPath(v3);

  return v4;
}

void BLTCleanAttachmentsPath()
{
  v0 = BLTFileURLInPairingPath(@"attachments");
  if (v0)
  {
    id v1 = [MEMORY[0x263F08850] defaultManager];
    id v5 = 0;
    char v2 = [v1 removeItemAtURL:v0 error:&v5];
    id v3 = v5;

    if ((v2 & 1) == 0)
    {
      id v4 = blt_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        BLTCleanAttachmentsPath_cold_1((uint64_t)v0, v4);
      }
    }
  }
}

id BLTTranscodedFileURLForBulletin(void *a1, void *a2)
{
  char v2 = BLTFileURLInAttachmentsPath(a1, a2);
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v2 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5) {
    id v6 = v2;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void sub_222F7647C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void BBSectionsChanged(uint64_t a1, uint64_t a2)
{
  id v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BBSectionsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  dispatch_async(v3, block);
}

uint64_t __BBSectionsChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUpdatedOverrides];
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id BLTSyncSupportedBundleIDsFromProxies(void *a1, id *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v26 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        char v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        unsigned int v9 = [MEMORY[0x263F0F998] appInfoWithAppProxy:v8];
        uint64_t v10 = [v9 supportedActions];
        if ([v10 count]
          || ([v8 plugInKitPlugins],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              INSupportedIntentsByExtensions(),
              unint64_t v12 = objc_claimAutoreleasedReturnValue(),
              uint64_t v13 = [v12 count],
              v12,
              v11,
              v13))
        {
          BOOL v14 = [v8 localizedName];
          BOOL v15 = v14;
          if (!v14)
          {
            uint64_t v2 = [MEMORY[0x263EFF9D0] null];
            BOOL v15 = (void *)v2;
          }
          int v16 = [v8 bundleIdentifier];
          [v26 setObject:v15 forKeyedSubscript:v16];

          char v17 = (void *)v2;
          if (!v14) {
            goto LABEL_11;
          }
        }
        else
        {
          BOOL v14 = [v8 correspondingApplicationRecord];
          if ([v14 supportsLiveActivities])
          {
            char v17 = [v8 localizedName];
            uint64_t v18 = (uint64_t)v17;
            if (!v17)
            {
              uint64_t v18 = [MEMORY[0x263EFF9D0] null];
              uint64_t v23 = (void *)v18;
            }
            uint64_t v19 = objc_msgSend(v8, "bundleIdentifier", v23);
            [v26 setObject:v18 forKeyedSubscript:v19];

            if (!v17) {
LABEL_11:
            }

            goto LABEL_12;
          }
          if (a2)
          {
            id v20 = *a2;
            if (!*a2)
            {
              id v20 = [MEMORY[0x263EFF980] array];
              *a2 = v20;
            }
            char v17 = [v8 bundleIdentifier];
            [v20 addObject:v17];
            goto LABEL_11;
          }
        }
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v5 = v21;
    }
    while (v21);
  }

  return v26;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t BLTPBSectionIconVariantReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_39;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_41:
          *(_DWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 16;
          goto LABEL_37;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
LABEL_37:
          uint64_t v32 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          uint64_t v28 = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v28 = 0;
      }
LABEL_45:
      *(unsigned char *)(a1 + 32) = v28 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBAppearanceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            uint64_t v22 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 24) = v22 != 0;
      }
      else if (v17 == 2)
      {
        char v26 = objc_alloc_init(BLTPBImage);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (BLTPBImageReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBCommunicationContextReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_60;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_60;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_60;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_60;
      case 5u:
        char v20 = objc_alloc_init(BLTPBContact);
        objc_storeStrong((id *)(a1 + 80), v20);
        goto LABEL_27;
      case 6u:
        char v20 = objc_alloc_init(BLTPBContact);
        [(id)a1 addRecipients:v20];
LABEL_27:
        if PBReaderPlaceMark() && (BLTPBContactReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_112:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 7u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 32;
        goto LABEL_60;
      case 8u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 92) |= 8u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_85:
        BOOL v62 = v23 != 0;
        uint64_t v63 = 88;
        goto LABEL_102;
      case 9u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 92) |= 0x10u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_89:
        BOOL v62 = v29 != 0;
        uint64_t v63 = 89;
        goto LABEL_102;
      case 0xAu:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        *(unsigned char *)(a1 + 92) |= 0x20u;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                uint64_t v35 = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v35 = 0;
        }
LABEL_93:
        BOOL v62 = v35 != 0;
        uint64_t v63 = 90;
        goto LABEL_102;
      case 0xBu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 92) |= 4u;
        while (2)
        {
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v14 = v40++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v41) = 0;
        }
LABEL_97:
        uint64_t v64 = 64;
        goto LABEL_111;
      case 0xCu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 56;
LABEL_60:
        unint64_t v45 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_112;
      case 0xDu:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v48 = 0;
        *(unsigned char *)(a1 + 92) |= 0x40u;
        while (2)
        {
          uint64_t v49 = *v3;
          unint64_t v50 = *(void *)(a2 + v49);
          if (v50 == -1 || v50 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v50 + 1;
            v48 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v46 += 7;
              BOOL v14 = v47++ >= 9;
              if (v14)
              {
                uint64_t v48 = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v48 = 0;
        }
LABEL_101:
        BOOL v62 = v48 != 0;
        uint64_t v63 = 91;
LABEL_102:
        *(unsigned char *)(a1 + v63) = v62;
        goto LABEL_112;
      case 0xEu:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 92) |= 2u;
        while (2)
        {
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 == -1 || v55 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
            *(void *)(a2 + v54) = v55 + 1;
            v41 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              BOOL v14 = v53++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v41) = 0;
        }
LABEL_106:
        uint64_t v64 = 28;
        goto LABEL_111;
      case 0xFu:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 92) |= 1u;
        while (2)
        {
          uint64_t v59 = *v3;
          unint64_t v60 = *(void *)(a2 + v59);
          if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
            *(void *)(a2 + v59) = v60 + 1;
            v41 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              BOOL v14 = v58++ >= 9;
              if (v14)
              {
                LODWORD(v41) = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v41) = 0;
        }
LABEL_110:
        uint64_t v64 = 24;
LABEL_111:
        *(_DWORD *)(a1 + v64) = v41;
        goto LABEL_112;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_112;
    }
  }
}

uint64_t BLTPBSetNotificationsGroupingRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTGetTrafficRestrictedBufferTime()
{
  if (BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken != -1) {
    dispatch_once(&BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken, &__block_literal_global_6);
  }
  return __BLTPlayLightsAndSirensTrafficRestrictedTimeout - 5;
}

uint64_t BLTGetPlayLightsAndSirensTrafficRestrictedTimeout()
{
  if (BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken != -1) {
    dispatch_once(&BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_onceToken, &__block_literal_global_6);
  }
  return __BLTPlayLightsAndSirensTrafficRestrictedTimeout;
}

uint64_t __BLTGetPlayLightsAndSirensTrafficRestrictedTimeout_block_invoke()
{
  uint64_t result = BBGetObserverGatewayTimeout();
  double v1 = (double)result + -2.0;
  if (v1 < 2.0) {
    double v1 = 2.0;
  }
  __BLTPlayLightsAndSirensTrafficRestrictedTimeout = (uint64_t)v1;
  return result;
}

double BLTGetSettingSyncForNotificationTimeout()
{
  if (BLTGetSettingSyncForNotificationTimeout_onceToken != -1) {
    dispatch_once(&BLTGetSettingSyncForNotificationTimeout_onceToken, &__block_literal_global_78);
  }
  return *(double *)&BLTGetSettingSyncForNotificationTimeout___BLTGetSettingSyncForNotificationTimeout;
}

double __BLTGetSettingSyncForNotificationTimeout_block_invoke()
{
  if (BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken != -1) {
    dispatch_once(&BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken, &__block_literal_global_104);
  }
  double result = (double)__BLTPlayLightsAndSirensSendConnectedTimeout * 0.5;
  *(double *)&BLTGetSettingSyncForNotificationTimeout___BLTGetSettingSyncForNotificationTimeout = result;
  return result;
}

uint64_t BLTGetPlayLightsAndSirensTimeout(int a1)
{
  if (a1)
  {
    if (BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken != -1) {
      dispatch_once(&BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken, &__block_literal_global_104);
    }
    double v1 = (double)__BLTPlayLightsAndSirensSendConnectedTimeout;
  }
  else
  {
    double v1 = 14400.0;
  }
  uint64_t v2 = +[BLTBulletinDistributor sharedDistributor];
  uint64_t v3 = [v2 summarizationSetting];

  uint64_t v4 = 7;
  if (v3 != 2) {
    uint64_t v4 = 0;
  }
  return (uint64_t)(v1 + (double)v4);
}

id BLTFileURLInHomePath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSHomeDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"/Library"];

  uint64_t v4 = _BLTFileURLWithPath(v3, v1);

  return v4;
}

id _BLTFileURLWithPath(void *a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = [v3 stringByAppendingPathComponent:@"BulletinDistributor"];
    uint64_t v6 = [v5 stringByAppendingPathComponent:v4];

    uint64_t v7 = [v6 stringByDeletingLastPathComponent];
    char v8 = [MEMORY[0x263F08850] defaultManager];
    char v9 = [v8 fileExistsAtPath:v7];

    if (v9)
    {
      id v10 = 0;
LABEL_7:
      BOOL v14 = [NSURL fileURLWithPath:v6];

      goto LABEL_12;
    }
    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v18 = *MEMORY[0x263F080A8];
    v19[0] = *MEMORY[0x263F080B0];
    unint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v17 = 0;
    char v13 = [v11 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v12 error:&v17];
    id v10 = v17;

    if (v13) {
      goto LABEL_7;
    }
    int v15 = blt_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _BLTFileURLWithPath_cold_2((uint64_t)v7, (uint64_t)v10, v15);
    }
  }
  else
  {
    uint64_t v6 = blt_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      _BLTFileURLWithPath_cold_1(v6);
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

id BLTPairingPath()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  id v1 = [v0 pairingStorePath];

  return v1;
}

id BLTFileURLInPairingPath(void *a1)
{
  id v1 = a1;
  uint64_t v2 = BLTPairingPath();
  id v3 = _BLTFileURLWithPath(v2, v1);

  return v3;
}

id BLTFileURLInPairingPathWait(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __BLTFileURLInPairingPathWait_block_invoke;
  v5[3] = &unk_264684720;
  v5[4] = &v6;
  [v2 waitForPairingStorePathPairingID:v5];

  id v3 = _BLTFileURLWithPath((void *)v7[5], v1);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_222F81E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __BLTFileURLInPairingPathWait_block_invoke(uint64_t a1, void *a2)
{
}

uint64_t BLTIsDebugBuild()
{
  return 0;
}

uint64_t BLTDeviceOSIsInternalInstall()
{
  return MGGetBoolAnswer();
}

uint64_t BLTIsDebugOrInternalBuild()
{
  if (BLTIsDebugOrInternalBuild_onceToken != -1) {
    dispatch_once(&BLTIsDebugOrInternalBuild_onceToken, &__block_literal_global_87);
  }
  return BLTIsDebugOrInternalBuild___isDebugOrInternal;
}

uint64_t __BLTIsDebugOrInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  BLTIsDebugOrInternalBuild___isDebugOrInternal = result;
  return result;
}

uint64_t BLTIsWalkaboutEnabled()
{
  if (BLTIsWalkaboutEnabled_onceToken != -1) {
    dispatch_once(&BLTIsWalkaboutEnabled_onceToken, &__block_literal_global_89);
  }
  return BLTIsWalkaboutEnabled___BLTWalkaboutEnabled;
}

uint64_t __BLTIsWalkaboutEnabled_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (v0)
  {
    uint64_t v2 = (void *)v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"walkabout"]) {
        BLTIsWalkaboutEnabled___BLTWalkaboutEnabled = MGGetBoolAnswer();
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

id BLTWorkQueue()
{
  if (BLTWorkQueue_onceToken != -1) {
    dispatch_once(&BLTWorkQueue_onceToken, &__block_literal_global_101);
  }
  CFPropertyListRef v0 = (void *)BLTWorkQueue___workQueue;
  return v0;
}

void __BLTWorkQueue_block_invoke()
{
  CFPropertyListRef v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  attr = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

  dispatch_queue_t v1 = dispatch_queue_create("bulletindistributord.workq", attr);
  uint64_t v2 = (void *)BLTWorkQueue___workQueue;
  BLTWorkQueue___workQueue = (uint64_t)v1;

  dispatch_queue_set_specific((dispatch_queue_t)BLTWorkQueue___workQueue, (const void *)BLTWorkQueueKey, (void *)BLTWorkQueueIdentifier, 0);
}

void BLTDispatchWorkQueue(void *a1)
{
  if (dispatch_get_specific((const void *)BLTWorkQueueKey) == (void *)BLTWorkQueueIdentifier)
  {
    id v3 = (void (*)(void))a1[2];
    id v4 = a1;
    v3();
  }
  else
  {
    uint64_t v2 = a1;
    id v4 = BLTWorkQueue();
    dispatch_async(v4, v2);
  }
}

BOOL BLTIsOnWorkQueue()
{
  return dispatch_get_specific((const void *)BLTWorkQueueKey) == (void *)BLTWorkQueueIdentifier;
}

uint64_t __BLTGetPlayLightsAndSirensSendConnectedTimeout_block_invoke()
{
  uint64_t result = BBGetObserverGatewayTimeout();
  double v1 = (double)result + -2.0 + -5.0;
  if (v1 < 2.0) {
    double v1 = 2.0;
  }
  __BLTPlayLightsAndSirensSendConnectedTimeout = (uint64_t)v1;
  return result;
}

uint64_t BLTPBSetNotificationsAlertLevelRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_45:
        *(unsigned char *)(a1 + 24) = v26 != 0;
      }
      else if (v17 == 2)
      {
        uint64_t v30 = PBReaderReadString();
        unint64_t v31 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v30;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBHandleSnoozeActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_24:
        unsigned int v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        unsigned int v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

void sub_222F84CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

__CFString *BLTNameForActionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 5) {
    return @"unknown";
  }
  else {
    return off_2646847D8[a1 - 3];
  }
}

unint64_t -[BLTAlertStateTester _blockingReasonForSectionInfo:isCritical:](BLTAlertStateTester *self, SEL a2, id a3, BOOL a4)
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    unint64_t v7 = 32 * ([v5 criticalAlertSetting] != 2);
  }
  else
  {
    if ([v5 alertType])
    {
      unint64_t v7 = 0;
    }
    else if ([v6 lockScreenSetting] == 2)
    {
      unint64_t v7 = 0;
    }
    else
    {
      unint64_t v7 = 3;
    }
    if (![v6 showsOnExternalDevices]) {
      v7 |= 0x10uLL;
    }
    if (![v6 allowsNotifications]) {
      v7 |= 0x20uLL;
    }
  }

  return v7;
}

uint64_t BLTPBWillSendLightsAndSirensResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_39:
        *(unsigned char *)(a1 + 12) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBHandlePairedDeviceReadyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  uint64_t v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t BLTPBSetRemoteGlobalSpokenSettingEnabledRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 1u;
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v26 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v27 = 0;
        }
        *(void *)(a1 + 8) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL stateIsSyncRestricted(unint64_t a1)
{
  return a1 < 2;
}

BOOL stateIsTrafficRestricted(uint64_t a1)
{
  return a1 == 0;
}

uint64_t stateDidChange(void *a1, uint64_t (*a2)(uint64_t))
{
  id v3 = a1;
  BOOL v4 = [v3 object];
  id v5 = [v3 userInfo];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"info"];

  if (a2([v4 state]) & 1) != 0 || (a2(objc_msgSend(v6, "newState"))) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = a2([v6 oldState]);
  }

  return v7;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t BLTPBAddBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = objc_alloc_init(BLTPBBulletin);
          objc_storeStrong((id *)(a1 + 16), v18);
          if PBReaderPlaceMark() && (BLTPBBulletinReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (1)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_49;
            }
            v20 += 7;
            BOOL v15 = v21++ >= 9;
            if (v15)
            {
              uint64_t v22 = 0;
              goto LABEL_51;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_51:
          BOOL v44 = v22 != 0;
          uint64_t v45 = 28;
          goto LABEL_60;
        case 3u:
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v29 = 0;
          }
          *(void *)(a1 + 8) = v29;
          continue;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (2)
          {
            uint64_t v33 = *v3;
            uint64_t v34 = *(void *)(a2 + v33);
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v32) = 0;
          }
LABEL_55:
          *(_DWORD *)(a1 + 24) = v32;
          continue;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          *(unsigned char *)(a1 + 32) |= 8u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v39 |= (unint64_t)(v43 & 0x7F) << v37;
        if ((v43 & 0x80) == 0) {
          goto LABEL_57;
        }
        v37 += 7;
        BOOL v15 = v38++ >= 9;
        if (v15)
        {
          uint64_t v39 = 0;
          goto LABEL_59;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v39 = 0;
      }
LABEL_59:
      BOOL v44 = v39 != 0;
      uint64_t v45 = 29;
LABEL_60:
      *(unsigned char *)(a1 + v45) = v44;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBSectionBulletinListReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = (BLTPBBulletinIdentifier *)a1[2];
        a1[2] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(BLTPBBulletinIdentifier);
    [a1 addBulletinIdentifier:v18];
    if (!PBReaderPlaceMark() || !BLTPBBulletinIdentifierReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBThreadMuteAssertionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v21 = 0;
        }
        *(void *)(a1 + 8) = v21;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_42;
      case 2u:
        unint64_t v20 = objc_alloc_init(BLTPBAppearance);
        objc_storeStrong((id *)(a1 + 16), v20);
        if PBReaderPlaceMark() && (BLTPBAppearanceReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_46:
        uint64_t v33 = 8;
        goto LABEL_51;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 56;
        goto LABEL_42;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 64) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_50:
        uint64_t v33 = 24;
LABEL_51:
        *(_DWORD *)(a1 + v33) = v23;
        goto LABEL_52;
      case 6u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 32;
        goto LABEL_42;
      case 7u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 40;
LABEL_42:
        uint64_t v32 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_52;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_52;
    }
  }
}

uint64_t BLTPBWillSendLightsAndSirensRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_24:
          unint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_35;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_35:
      *(unsigned char *)(a1 + 32) = v23 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBSetSectionSubtypeParametersIconResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  uint64_t v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_222F92354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 224), 8);
  _Block_object_dispose((const void *)(v61 - 192), 8);
  _Block_object_dispose((const void *)(v61 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_222F92B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void BLTDaemonRestarted(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BLTDaemonRestarted_block_invoke;
  block[3] = &unk_264683BD8;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __BLTDaemonRestarted_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connect];
}

void sub_222F93A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __BLTGizmoLegacyMapSectionInfoKeySet_block_invoke()
{
  BLTGizmoLegacyMapSectionInfoKeySet___BLTGizmoLegacyMapSectionInfoKeySet = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"sectionID", @"parentSectionID", 0);
  return MEMORY[0x270F9A758]();
}

void sub_222F94104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

uint64_t BLTPBShouldSuppressLightsAndSirensNowResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBFullBulletinListReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(BLTPBSectionBulletinList);
        [a1 addSectionBulletinList:v17];
        if (!PBReaderPlaceMark() || !BLTPBSectionBulletinListReadFrom(v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBCancelBulletinRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 32;
          goto LABEL_23;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
LABEL_23:
          unint64_t v21 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        case 4u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          *(void *)(a1 + 8) = v31;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v3;
        uint64_t v26 = *(void *)(a2 + v25);
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_35;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_37;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_37:
      *(_DWORD *)(a1 + 16) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222F993AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BLTPBHandleDidPlayLightsAndSirensReplyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(unsigned char *)(a1 + 44) |= 2u;
              break;
            case 2u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 24;
              goto LABEL_34;
            case 3u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 16;
              goto LABEL_34;
            case 4u:
              *(unsigned char *)(a1 + 44) |= 1u;
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
                *(void *)(a2 + v28) = v29 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v30 = 0;
              }
              *(void *)(a1 + 8) = v30;
              goto LABEL_41;
            case 5u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 32;
LABEL_34:
              uint64_t v31 = *(void **)(a1 + v27);
              *(void *)(a1 + v27) = v26;

              goto LABEL_41;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_41:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_36;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_38;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_38:
          *(unsigned char *)(a1 + 40) = v20 != 0;
          goto LABEL_41;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBImageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBMuteAssertionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 3)
      {
        uint64_t v21 = objc_alloc_init(BLTPBThreadMuteAssertion);
        [(id)a1 addSectionBulletinList:v21];
        if (!PBReaderPlaceMark() || (BLTPBThreadMuteAssertionReadFrom((uint64_t)v21, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222F9B9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BLTCaptureBug(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (BLTIsDebugOrInternalBuild())
  {
    if (_BLTCaptureBug_onceToken != -1) {
      dispatch_once(&_BLTCaptureBug_onceToken, &__block_literal_global_12);
    }
    if (_BLTCaptureBug__diagnosticReporter)
    {
      id v2 = [(id)_BLTCaptureBug__diagnosticReporter signatureWithDomain:@"BulletinDistributor" type:@"Functional" subType:v1 detectedProcess:@"bulletindistributord" triggerThresholdValues:0];
      char v3 = [(id)_BLTCaptureBug__diagnosticReporter snapshotWithSignature:v2 duration:0 event:0 payload:&__block_literal_global_10_1 reply:0.0];
      id v4 = blt_general_log();
      id v5 = v4;
      if (v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 138412290;
          id v7 = v1;
          _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Diagnostic Reporter sent snapshot for bug %@", (uint8_t *)&v6, 0xCu);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        _BLTCaptureBug_cold_1((uint64_t)v1, v5);
      }
    }
  }
}

void sub_222F9CC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_222F9E3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __BLTGizmoLegacyMapKeySet_block_invoke()
{
  BLTGizmoLegacyMapKeySet___BLTGizmoLegacyMapKeySet = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"publisherBulletinID", @"categoryID", @"sectionInfo", @"sectionSubtype", 0);
  return MEMORY[0x270F9A758]();
}

BOOL BLTPBShouldSuppressLightsAndSirensNowRequestReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  int v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t BLTPBSectionInfoReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_208;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 112;
        goto LABEL_208;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x800u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_221:
        uint64_t v190 = 104;
        goto LABEL_319;
      case 4u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x400u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_225:
        uint64_t v190 = 84;
        goto LABEL_319;
      case 5u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_DWORD *)(a1 + 180) |= 0x4000000u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                uint64_t v36 = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v36 = 0;
        }
LABEL_229:
        BOOL v191 = v36 != 0;
        uint64_t v192 = 178;
        goto LABEL_298;
      case 6u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0;
        *(_DWORD *)(a1 + 180) |= 0x800000u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if (v47 < 0)
            {
              v41 += 7;
              BOOL v15 = v42++ >= 9;
              if (v15)
              {
                uint64_t v43 = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v43 = 0;
        }
LABEL_233:
        BOOL v191 = v43 != 0;
        uint64_t v192 = 175;
        goto LABEL_298;
      case 7u:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v50 = 0;
        *(_DWORD *)(a1 + 180) |= 0x400000u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v50 |= (unint64_t)(v54 & 0x7F) << v48;
            if (v54 < 0)
            {
              v48 += 7;
              BOOL v15 = v49++ >= 9;
              if (v15)
              {
                uint64_t v50 = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v50 = 0;
        }
LABEL_237:
        BOOL v191 = v50 != 0;
        uint64_t v192 = 174;
        goto LABEL_298;
      case 8u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v57 = 0;
        *(_DWORD *)(a1 + 180) |= 0x2000000u;
        while (2)
        {
          uint64_t v58 = *v3;
          uint64_t v59 = *(void *)(a2 + v58);
          unint64_t v60 = v59 + 1;
          if (v59 == -1 || v60 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v58) = v60;
            v57 |= (unint64_t)(v61 & 0x7F) << v55;
            if (v61 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                uint64_t v57 = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v57 = 0;
        }
LABEL_241:
        BOOL v191 = v57 != 0;
        uint64_t v192 = 177;
        goto LABEL_298;
      case 9u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x40u;
        while (2)
        {
          uint64_t v64 = *v3;
          uint64_t v65 = *(void *)(a2 + v64);
          unint64_t v66 = v65 + 1;
          if (v65 == -1 || v66 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
            *(void *)(a2 + v64) = v66;
            v23 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              BOOL v15 = v63++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_245:
        uint64_t v190 = 68;
        goto LABEL_319;
      case 0xAu:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x200u;
        while (2)
        {
          uint64_t v70 = *v3;
          uint64_t v71 = *(void *)(a2 + v70);
          unint64_t v72 = v71 + 1;
          if (v71 == -1 || v72 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v71);
            *(void *)(a2 + v70) = v72;
            v23 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              BOOL v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_249:
        uint64_t v190 = 80;
        goto LABEL_319;
      case 0xBu:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 4u;
        while (2)
        {
          uint64_t v76 = *v3;
          uint64_t v77 = *(void *)(a2 + v76);
          unint64_t v78 = v77 + 1;
          if (v77 == -1 || v78 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v77);
            *(void *)(a2 + v76) = v78;
            v23 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              BOOL v15 = v75++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_253:
        uint64_t v190 = 24;
        goto LABEL_319;
      case 0xCu:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        *(_DWORD *)(a1 + 180) |= 0x1000000u;
        while (2)
        {
          uint64_t v83 = *v3;
          uint64_t v84 = *(void *)(a2 + v83);
          unint64_t v85 = v84 + 1;
          if (v84 == -1 || v85 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
            *(void *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              BOOL v15 = v81++ >= 9;
              if (v15)
              {
                uint64_t v82 = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v82 = 0;
        }
LABEL_257:
        BOOL v191 = v82 != 0;
        uint64_t v192 = 176;
        goto LABEL_298;
      case 0xDu:
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v89 = 0;
        *(_DWORD *)(a1 + 180) |= 0x10000u;
        while (2)
        {
          uint64_t v90 = *v3;
          uint64_t v91 = *(void *)(a2 + v90);
          unint64_t v92 = v91 + 1;
          if (v91 == -1 || v92 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v93 = *(unsigned char *)(*(void *)(a2 + *v7) + v91);
            *(void *)(a2 + v90) = v92;
            v89 |= (unint64_t)(v93 & 0x7F) << v87;
            if (v93 < 0)
            {
              v87 += 7;
              BOOL v15 = v88++ >= 9;
              if (v15)
              {
                uint64_t v89 = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v89 = 0;
        }
LABEL_261:
        BOOL v191 = v89 != 0;
        uint64_t v192 = 168;
        goto LABEL_298;
      case 0xEu:
        char v94 = 0;
        unsigned int v95 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x4000u;
        while (2)
        {
          uint64_t v96 = *v3;
          uint64_t v97 = *(void *)(a2 + v96);
          unint64_t v98 = v97 + 1;
          if (v97 == -1 || v98 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v99 = *(unsigned char *)(*(void *)(a2 + *v7) + v97);
            *(void *)(a2 + v96) = v98;
            v23 |= (unint64_t)(v99 & 0x7F) << v94;
            if (v99 < 0)
            {
              v94 += 7;
              BOOL v15 = v95++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_265:
        uint64_t v190 = 136;
        goto LABEL_319;
      case 0xFu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
        goto LABEL_208;
      case 0x10u:
        char v100 = 0;
        unsigned int v101 = 0;
        uint64_t v102 = 0;
        *(_DWORD *)(a1 + 180) |= 0x40000u;
        while (2)
        {
          uint64_t v103 = *v3;
          uint64_t v104 = *(void *)(a2 + v103);
          unint64_t v105 = v104 + 1;
          if (v104 == -1 || v105 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v106 = *(unsigned char *)(*(void *)(a2 + *v7) + v104);
            *(void *)(a2 + v103) = v105;
            v102 |= (unint64_t)(v106 & 0x7F) << v100;
            if (v106 < 0)
            {
              v100 += 7;
              BOOL v15 = v101++ >= 9;
              if (v15)
              {
                uint64_t v102 = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v102 = 0;
        }
LABEL_269:
        BOOL v191 = v102 != 0;
        uint64_t v192 = 170;
        goto LABEL_298;
      case 0x11u:
        uint64_t v107 = objc_alloc_init(BLTPBSectionInfo);
        [(id)a1 addSubsections:v107];
        if (!PBReaderPlaceMark() || (BLTPBSectionInfoReadFrom(v107, a2) & 1) == 0) {
          goto LABEL_328;
        }
        goto LABEL_217;
      case 0x12u:
        char v108 = 0;
        unsigned int v109 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x2000u;
        while (2)
        {
          uint64_t v110 = *v3;
          uint64_t v111 = *(void *)(a2 + v110);
          unint64_t v112 = v111 + 1;
          if (v111 == -1 || v112 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v113 = *(unsigned char *)(*(void *)(a2 + *v7) + v111);
            *(void *)(a2 + v110) = v112;
            v23 |= (unint64_t)(v113 & 0x7F) << v108;
            if (v113 < 0)
            {
              v108 += 7;
              BOOL v15 = v109++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_273:
        uint64_t v190 = 120;
        goto LABEL_319;
      case 0x13u:
        char v114 = 0;
        unsigned int v115 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x8000u;
        while (2)
        {
          uint64_t v116 = *v3;
          uint64_t v117 = *(void *)(a2 + v116);
          unint64_t v118 = v117 + 1;
          if (v117 == -1 || v118 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v119 = *(unsigned char *)(*(void *)(a2 + *v7) + v117);
            *(void *)(a2 + v116) = v118;
            v23 |= (unint64_t)(v119 & 0x7F) << v114;
            if (v119 < 0)
            {
              v114 += 7;
              BOOL v15 = v115++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_277;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_277:
        uint64_t v190 = 152;
        goto LABEL_319;
      case 0x14u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_208;
      case 0x15u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_208;
      case 0x16u:
        uint64_t v107 = objc_alloc_init(BLTPBSectionIcon);
        objc_storeStrong((id *)(a1 + 56), v107);
        if (!PBReaderPlaceMark() || (BLTPBSectionIconReadFrom(v107, a2) & 1) == 0) {
          goto LABEL_328;
        }
        goto LABEL_217;
      case 0x17u:
        char v120 = 0;
        unsigned int v121 = 0;
        uint64_t v122 = 0;
        *(_DWORD *)(a1 + 180) |= 0x100000u;
        while (2)
        {
          uint64_t v123 = *v3;
          uint64_t v124 = *(void *)(a2 + v123);
          unint64_t v125 = v124 + 1;
          if (v124 == -1 || v125 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v126 = *(unsigned char *)(*(void *)(a2 + *v7) + v124);
            *(void *)(a2 + v123) = v125;
            v122 |= (unint64_t)(v126 & 0x7F) << v120;
            if (v126 < 0)
            {
              v120 += 7;
              BOOL v15 = v121++ >= 9;
              if (v15)
              {
                uint64_t v122 = 0;
                goto LABEL_281;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v122 = 0;
        }
LABEL_281:
        BOOL v191 = v122 != 0;
        uint64_t v192 = 172;
        goto LABEL_298;
      case 0x18u:
        char v127 = 0;
        unsigned int v128 = 0;
        uint64_t v129 = 0;
        *(_DWORD *)(a1 + 180) |= 0x200000u;
        while (2)
        {
          uint64_t v130 = *v3;
          uint64_t v131 = *(void *)(a2 + v130);
          unint64_t v132 = v131 + 1;
          if (v131 == -1 || v132 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v131);
            *(void *)(a2 + v130) = v132;
            v129 |= (unint64_t)(v133 & 0x7F) << v127;
            if (v133 < 0)
            {
              v127 += 7;
              BOOL v15 = v128++ >= 9;
              if (v15)
              {
                uint64_t v129 = 0;
                goto LABEL_285;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v129 = 0;
        }
LABEL_285:
        BOOL v191 = v129 != 0;
        uint64_t v192 = 173;
        goto LABEL_298;
      case 0x19u:
        char v134 = 0;
        unsigned int v135 = 0;
        uint64_t v136 = 0;
        *(_DWORD *)(a1 + 180) |= 0x20000u;
        while (2)
        {
          uint64_t v137 = *v3;
          uint64_t v138 = *(void *)(a2 + v137);
          unint64_t v139 = v138 + 1;
          if (v138 == -1 || v139 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v140 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
            *(void *)(a2 + v137) = v139;
            v136 |= (unint64_t)(v140 & 0x7F) << v134;
            if (v140 < 0)
            {
              v134 += 7;
              BOOL v15 = v135++ >= 9;
              if (v15)
              {
                uint64_t v136 = 0;
                goto LABEL_289;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v136 = 0;
        }
LABEL_289:
        BOOL v191 = v136 != 0;
        uint64_t v192 = 169;
        goto LABEL_298;
      case 0x1Au:
        char v141 = 0;
        unsigned int v142 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x10u;
        while (2)
        {
          uint64_t v143 = *v3;
          uint64_t v144 = *(void *)(a2 + v143);
          unint64_t v145 = v144 + 1;
          if (v144 == -1 || v145 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v146 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
            *(void *)(a2 + v143) = v145;
            v23 |= (unint64_t)(v146 & 0x7F) << v141;
            if (v146 < 0)
            {
              v141 += 7;
              BOOL v15 = v142++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_293;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_293:
        uint64_t v190 = 48;
        goto LABEL_319;
      case 0x1Bu:
        char v147 = 0;
        unsigned int v148 = 0;
        uint64_t v149 = 0;
        *(_DWORD *)(a1 + 180) |= 0x80000u;
        while (2)
        {
          uint64_t v150 = *v3;
          uint64_t v151 = *(void *)(a2 + v150);
          unint64_t v152 = v151 + 1;
          if (v151 == -1 || v152 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v153 = *(unsigned char *)(*(void *)(a2 + *v7) + v151);
            *(void *)(a2 + v150) = v152;
            v149 |= (unint64_t)(v153 & 0x7F) << v147;
            if (v153 < 0)
            {
              v147 += 7;
              BOOL v15 = v148++ >= 9;
              if (v15)
              {
                uint64_t v149 = 0;
                goto LABEL_297;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v149 = 0;
        }
LABEL_297:
        BOOL v191 = v149 != 0;
        uint64_t v192 = 171;
LABEL_298:
        *(unsigned char *)(a1 + v192) = v191;
        goto LABEL_320;
      case 0x1Cu:
        char v154 = 0;
        unsigned int v155 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 8u;
        while (2)
        {
          uint64_t v156 = *v3;
          uint64_t v157 = *(void *)(a2 + v156);
          unint64_t v158 = v157 + 1;
          if (v157 == -1 || v158 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v159 = *(unsigned char *)(*(void *)(a2 + *v7) + v157);
            *(void *)(a2 + v156) = v158;
            v23 |= (unint64_t)(v159 & 0x7F) << v154;
            if (v159 < 0)
            {
              v154 += 7;
              BOOL v15 = v155++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_302;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_302:
        uint64_t v190 = 28;
        goto LABEL_319;
      case 0x1Du:
        char v160 = 0;
        unsigned int v161 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x100u;
        while (2)
        {
          uint64_t v162 = *v3;
          uint64_t v163 = *(void *)(a2 + v162);
          unint64_t v164 = v163 + 1;
          if (v163 == -1 || v164 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v165 = *(unsigned char *)(*(void *)(a2 + *v7) + v163);
            *(void *)(a2 + v162) = v164;
            v23 |= (unint64_t)(v165 & 0x7F) << v160;
            if (v165 < 0)
            {
              v160 += 7;
              BOOL v15 = v161++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_306;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_306:
        uint64_t v190 = 76;
        goto LABEL_319;
      case 0x1Eu:
        char v166 = 0;
        unsigned int v167 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x20u;
        while (2)
        {
          uint64_t v168 = *v3;
          uint64_t v169 = *(void *)(a2 + v168);
          unint64_t v170 = v169 + 1;
          if (v169 == -1 || v170 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v171 = *(unsigned char *)(*(void *)(a2 + *v7) + v169);
            *(void *)(a2 + v168) = v170;
            v23 |= (unint64_t)(v171 & 0x7F) << v166;
            if (v171 < 0)
            {
              v166 += 7;
              BOOL v15 = v167++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_310;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_310:
        uint64_t v190 = 64;
        goto LABEL_319;
      case 0x1Fu:
        char v172 = 0;
        unsigned int v173 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x80u;
        while (2)
        {
          uint64_t v174 = *v3;
          uint64_t v175 = *(void *)(a2 + v174);
          unint64_t v176 = v175 + 1;
          if (v175 == -1 || v176 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v177 = *(unsigned char *)(*(void *)(a2 + *v7) + v175);
            *(void *)(a2 + v174) = v176;
            v23 |= (unint64_t)(v177 & 0x7F) << v172;
            if (v177 < 0)
            {
              v172 += 7;
              BOOL v15 = v173++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_314;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_314:
        uint64_t v190 = 72;
        goto LABEL_319;
      case 0x20u:
        char v178 = 0;
        unsigned int v179 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 180) |= 0x1000u;
        while (2)
        {
          uint64_t v180 = *v3;
          uint64_t v181 = *(void *)(a2 + v180);
          unint64_t v182 = v181 + 1;
          if (v181 == -1 || v182 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v183 = *(unsigned char *)(*(void *)(a2 + *v7) + v181);
            *(void *)(a2 + v180) = v182;
            v23 |= (unint64_t)(v183 & 0x7F) << v178;
            if (v183 < 0)
            {
              v178 += 7;
              BOOL v15 = v179++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_318;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_318:
        uint64_t v190 = 108;
LABEL_319:
        *(_DWORD *)(a1 + v190) = v23;
        goto LABEL_320;
      case 0x21u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 160;
LABEL_208:
        v184 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_320;
      case 0x22u:
        *(_DWORD *)(a1 + 180) |= 1u;
        uint64_t v185 = *v3;
        unint64_t v186 = *(void *)(a2 + v185);
        if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v187 = *(void *)(*(void *)(a2 + *v7) + v186);
          *(void *)(a2 + v185) = v186 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v187 = 0;
        }
        uint64_t v193 = 8;
        goto LABEL_326;
      case 0x23u:
        *(_DWORD *)(a1 + 180) |= 2u;
        uint64_t v188 = *v3;
        unint64_t v189 = *(void *)(a2 + v188);
        if (v189 <= 0xFFFFFFFFFFFFFFF7 && v189 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v187 = *(void *)(*(void *)(a2 + *v7) + v189);
          *(void *)(a2 + v188) = v189 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v187 = 0;
        }
        uint64_t v193 = 16;
LABEL_326:
        *(void *)(a1 + v193) = v187;
        goto LABEL_320;
      case 0x24u:
        uint64_t v107 = objc_alloc_init(BLTPBSectionInfoSettings);
        objc_storeStrong((id *)(a1 + 96), v107);
        if PBReaderPlaceMark() && (BLTPBSectionInfoSettingsReadFrom((uint64_t)v107, a2))
        {
LABEL_217:
          PBReaderRecallMark();

LABEL_320:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_328:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_320;
    }
  }
}

uint64_t BLTPBContactReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_48;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_52:
          *(_DWORD *)(a1 + 48) = v22;
          continue;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_48;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_48;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_48;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_48;
        case 7u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_56:
          BOOL v39 = v28 != 0;
          uint64_t v40 = 64;
          goto LABEL_61;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
          break;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_48:
          uint64_t v38 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_58;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          uint64_t v34 = 0;
          goto LABEL_60;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v34 = 0;
      }
LABEL_60:
      BOOL v39 = v34 != 0;
      uint64_t v40 = 65;
LABEL_61:
      *(unsigned char *)(a1 + v40) = v39;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222FA956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_222FAAAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222FAB8EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

__CFString *_stringForSettingsWillPresentBlockedBy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 10; ++i)
    {
      uint64_t v4 = _stringForSettingsWillPresentBlockedBy_flags[i];
      if ((v4 & a1) != 0)
      {
        if (v4 > 31)
        {
          if (v4 == 512) {
            int v6 = @"BLTSettingsWillPresentBlockedByScreenTime";
          }
          else {
            int v6 = 0;
          }
          if (v4 == 256) {
            int v6 = @"BLTSettingsWillPresentBlockedByForwardOnly";
          }
          if (v4 == 128) {
            int v6 = @"BLTSettingsWillPresentBlockedByDisableWristDetection";
          }
          if (v4 == 64) {
            int v7 = @"BLTSettingsWillPresentBlockedByOptOutOfCoordinationDenyListed";
          }
          else {
            int v7 = 0;
          }
          if (v4 == 32) {
            int v7 = @"BLTSettingsWillPresentBlockedByNotAllowsNotifications";
          }
          if (v4 <= 127) {
            id v5 = v7;
          }
          else {
            id v5 = v6;
          }
        }
        else
        {
          id v5 = 0;
          switch(v4)
          {
            case 1:
              id v5 = @"BLTSettingsWillPresentBlockedByAlertType";
              break;
            case 2:
              id v5 = @"BLTSettingsWillPresentBlockedByNotShowsInLockscreen";
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              break;
            case 4:
              id v5 = @"BLTSettingsWillPresentBlockedByFirstPartyCoordinationDenyListed";
              break;
            case 8:
              id v5 = @"BLTSettingsWillPresentBlockedByDisconnection";
              break;
            default:
              if (v4 == 16) {
                id v5 = @"BLTSettingsWillPresentBlockedByNotShowsOnExternalDevices";
              }
              else {
                id v5 = 0;
              }
              break;
          }
        }
        [v2 addObject:v5];
      }
    }
    if ([v2 count])
    {
      char v8 = [v2 componentsJoinedByString:@"|"];
    }
    else
    {
      char v8 = @"0";
    }
  }
  else
  {
    char v8 = @"BLTSettingsWillPresentBlockedByNone";
  }
  return v8;
}

void sub_222FAD928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_222FAE210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

BOOL BLTPBActionInformationReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 5) {
        break;
      }
      if ((v10 >> 3) == 4)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_222FB28F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void sub_222FB2CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222FB3D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222FB4070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_222FB5824(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_222FB6FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL BLTPBHandleSupplementaryActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_25;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_25;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_25;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
LABEL_25:
        uint64_t v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_26;
      case 5u:
        uint64_t v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_26:

LABEL_27:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_27;
    }
  }
}

id nilForNSNull(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF9D0];
  id v2 = a1;
  id v3 = [v1 null];
  if (v3 == v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v2;
  }
  id v5 = v4;

  return v5;
}

BOOL BLTPBHandleDismissActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_24:
        uint64_t v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        uint64_t v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

void BLTSignificantTimeChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BLTSignificantTimeChanged_block_invoke;
  block[3] = &unk_264683BD8;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __BLTSignificantTimeChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanMuteIdentifiers];
}

void BLTMuteForTodaySectionIdentifiersChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __BLTMuteForTodaySectionIdentifiersChanged_block_invoke;
  block[3] = &unk_264683BD8;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __BLTMuteForTodaySectionIdentifiersChanged_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadMutedSectionIdentifiers];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateObservers];
}

id _BLTToday()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF910]);
  id v1 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v2 = [v1 components:28 fromDate:v0];

  return v2;
}

void sub_222FBD2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_222FBDC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222FBDE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BBSectionInfoFromBLTPBSectionInfo(void *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F2BCA8]);
    id v3 = [v1 sectionID];
    [v2 setSectionID:v3];

    id v4 = [v1 subsectionID];
    [v2 setSubsectionID:v4];

    objc_msgSend(v2, "setSectionType:", (int)objc_msgSend(v1, "sectionType"));
    objc_msgSend(v2, "setSuppressFromSettings:", objc_msgSend(v1, "suppressFromSettings"));
    objc_msgSend(v2, "setShowsOnExternalDevices:", objc_msgSend(v1, "showsOnExternalDevices"));
    objc_msgSend(v2, "setNotificationCenterLimit:", objc_msgSend(v1, "notificationCenterLimit"));
    objc_msgSend(v2, "setPushSettings:", objc_msgSend(v1, "pushSettings"));
    objc_msgSend(v2, "setAlertType:", objc_msgSend(v1, "alertType"));
    objc_msgSend(v2, "setShowsMessagePreview:", objc_msgSend(v1, "showsMessagePreview"));
    if ([v1 hasAuthorizationStatus])
    {
      objc_msgSend(v2, "setAuthorizationStatus:", (int)objc_msgSend(v1, "authorizationStatus"));
    }
    else if ([v1 hasAllowsNotifications])
    {
      objc_msgSend(v2, "setAllowsNotifications:", objc_msgSend(v1, "allowsNotifications"));
    }
    if ([v1 hasLockScreenSetting])
    {
      int v5 = [v1 lockScreenSetting];
      if (v5 == 2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = v5 == 1;
      }
      [v2 setLockScreenSetting:v6];
    }
    else if ([v1 hasShowsInLockScreen])
    {
      objc_msgSend(v2, "setShowsInLockScreen:", objc_msgSend(v1, "showsInLockScreen"));
    }
    if ([v1 hasNotificationCenterSetting])
    {
      int v7 = [v1 notificationCenterSetting];
      if (v7 == 2) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = v7 == 1;
      }
      [v2 setNotificationCenterSetting:v8];
    }
    else if ([v1 hasShowsInNotificationCenter])
    {
      objc_msgSend(v2, "setShowsInNotificationCenter:", objc_msgSend(v1, "showsInNotificationCenter"));
    }
    if ([v1 hasSpokenNotificationSetting])
    {
      int v9 = [v1 spokenNotificationSetting];
      if (v9 == 2) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v9 == 1;
      }
      [v2 setSpokenNotificationSetting:v10];
    }
    objc_msgSend(v2, "setSuppressedSettings:", objc_msgSend(v1, "suppressedSettings"));
    uint64_t v11 = [v1 displayName];
    [v2 setDisplayName:v11];

    if ([v1 hasCriticalAlertSetting])
    {
      if ([v1 criticalAlertSetting]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      [v2 setCriticalAlertSetting:v12];
    }
    if ([v1 hasGroupingSetting])
    {
      unsigned int v13 = [v1 groupingSetting];
      if (v13 <= 2) {
        [v2 setBulletinGroupingSetting:v13];
      }
    }
    BOOL v14 = [v1 subsections];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      int v16 = (void *)MEMORY[0x263EFF980];
      uint64_t v17 = [v1 subsections];
      uint64_t v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v19 = objc_msgSend(v1, "subsections", 0);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            unint64_t v24 = BBSectionInfoFromBLTPBSectionInfo(*(void *)(*((void *)&v36 + 1) + 8 * i));
            [v18 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v21);
      }

      char v25 = (void *)[v18 copy];
      [v2 setSubsections:v25];
    }
    objc_msgSend(v2, "setSubsectionPriority:", (int)objc_msgSend(v1, "subsectionPriority"));
    objc_msgSend(v2, "setVersion:", objc_msgSend(v1, "version"));
    char v26 = [v1 factorySectionID];
    [v2 setFactorySectionID:v26];

    unsigned int v27 = [v1 icon];
    uint64_t v28 = BBSectionIconFromBLTPBSectionIcon(v27);
    [v2 setIcon:v28];

    if ([MEMORY[0x263F57700] activePairedDeviceSupportsAuthorizationExpirationDate])
    {
      if ([v1 hasAuthorizationExpirationDate])
      {
        uint64_t v29 = (void *)MEMORY[0x263EFF910];
        [v1 authorizationExpirationDate];
        unint64_t v30 = objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
        [v2 setAuthorizationExpirationDate:v30];
      }
      if ([v1 hasLastUserGrantedAuthorizationDate])
      {
        char v31 = (void *)MEMORY[0x263EFF910];
        [v1 lastUserGrantedAuthorizationDate];
        uint64_t v32 = objc_msgSend(v31, "dateWithTimeIntervalSince1970:");
        [v2 setLastUserGrantedAuthorizationDate:v32];
      }
    }
    if ([v1 hasSectionInfoSettings])
    {
      unsigned int v33 = [v2 sectionInfoSettings];
      uint64_t v34 = [v1 sectionInfoSettings];
      [v33 applySectionInfoSettingsFromProtobuf:v34];
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id BBSectionIconFromBLTPBSectionIcon(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 variants];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F2BC98]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = objc_msgSend(v1, "variants", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [MEMORY[0x263F2BCA0] sectionIconVariantFromProtobuf:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          if (v10) {
            [v4 addVariant:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

BLTPBSectionInfo *BLTPBSectionInfoFromBBSectionInfoForDeviceSize(void *a1, uint64_t a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (v3)
  {
    id v4 = objc_alloc_init(BLTPBSectionInfo);
    int v5 = [v3 sectionID];
    [(BLTPBSectionInfo *)v4 setSectionID:v5];

    uint64_t v6 = [v3 subsectionID];
    [(BLTPBSectionInfo *)v4 setSubsectionID:v6];

    -[BLTPBSectionInfo setSectionType:](v4, "setSectionType:", [v3 sectionType]);
    -[BLTPBSectionInfo setSuppressFromSettings:](v4, "setSuppressFromSettings:", [v3 suppressFromSettings]);
    -[BLTPBSectionInfo setShowsOnExternalDevices:](v4, "setShowsOnExternalDevices:", [v3 showsOnExternalDevices]);
    -[BLTPBSectionInfo setNotificationCenterLimit:](v4, "setNotificationCenterLimit:", [v3 notificationCenterLimit]);
    -[BLTPBSectionInfo setPushSettings:](v4, "setPushSettings:", [v3 pushSettings]);
    -[BLTPBSectionInfo setAlertType:](v4, "setAlertType:", [v3 alertType]);
    -[BLTPBSectionInfo setShowsMessagePreview:](v4, "setShowsMessagePreview:", [v3 showsMessagePreview]);
    -[BLTPBSectionInfo setShowsInNotificationCenter:](v4, "setShowsInNotificationCenter:", [v3 showsInNotificationCenter]);
    -[BLTPBSectionInfo setShowsInLockScreen:](v4, "setShowsInLockScreen:", [v3 showsInLockScreen]);
    -[BLTPBSectionInfo setAllowsNotifications:](v4, "setAllowsNotifications:", [v3 allowsNotifications]);
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings])
    {
      if (([MEMORY[0x263F57700] activePairedDeviceSupportsAuthorizationExpirationDate] & 1) != 0
        || [v3 authorizationStatus] != 4)
      {
        uint64_t v9 = [v3 authorizationStatus];
      }
      else
      {
        uint64_t v7 = [v3 sectionInfoSettings];
        int v8 = [v7 isAuthorizedTemporarily];

        if (v8) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 0;
        }
      }
      [(BLTPBSectionInfo *)v4 setAuthorizationStatus:v9];
      uint64_t v10 = [v3 lockScreenSetting];
      if (v10 == 2) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = v10 == 1;
      }
      [(BLTPBSectionInfo *)v4 setLockScreenSetting:v11];
      uint64_t v12 = [v3 notificationCenterSetting];
      if (v12 == 2) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = v12 == 1;
      }
      [(BLTPBSectionInfo *)v4 setNotificationCenterSetting:v13];
    }
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsSpokenNotificationSettings])
    {
      uint64_t v14 = [v3 spokenNotificationSetting];
      if (v14 == 2) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = v14 == 1;
      }
      [(BLTPBSectionInfo *)v4 setSpokenNotificationSetting:v15];
    }
    -[BLTPBSectionInfo setSuppressedSettings:](v4, "setSuppressedSettings:", [v3 suppressedSettings]);
    int v16 = [v3 displayName];
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    if (v17 == v16) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v16;
    }
    id v19 = v18;

    [(BLTPBSectionInfo *)v4 setDisplayName:v19];
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsCriticalAndGroupingSettings])
    {
      uint64_t v20 = [v3 criticalAlertSetting];
      if (v20) {
        [(BLTPBSectionInfo *)v4 setCriticalAlertSetting:v20 == 2];
      }
      unint64_t v21 = [v3 bulletinGroupingSetting];
      if (v21 <= 2) {
        [(BLTPBSectionInfo *)v4 setGroupingSetting:v21];
      }
    }
    uint64_t v22 = [v3 subsections];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      unint64_t v24 = (void *)MEMORY[0x263EFF980];
      char v25 = [v3 subsections];
      char v26 = objc_msgSend(v24, "arrayWithCapacity:", objc_msgSend(v25, "count"));

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      unsigned int v27 = objc_msgSend(v3, "subsections", 0);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v49 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = BLTPBSectionInfoFromBBSectionInfoForDeviceSize(*(void *)(*((void *)&v48 + 1) + 8 * i), a2);
            [v26 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v29);
      }

      [(BLTPBSectionInfo *)v4 setSubsections:v26];
    }
    -[BLTPBSectionInfo setSubsectionPriority:](v4, "setSubsectionPriority:", [v3 subsectionPriority]);
    -[BLTPBSectionInfo setVersion:](v4, "setVersion:", [v3 version]);
    unsigned int v33 = [v3 factorySectionID];
    [(BLTPBSectionInfo *)v4 setFactorySectionID:v33];

    uint64_t v34 = [v3 parentSection];

    if (!v34)
    {
      uint64_t v35 = blt_ids_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        long long v36 = [v3 sectionID];
        *(_DWORD *)buf = 138412290;
        unint64_t v53 = v36;
        _os_log_impl(&dword_222F4C000, v35, OS_LOG_TYPE_INFO, "Fetching icons for BBSectionInfo to BLTPBSectionInfo conversion of %@", buf, 0xCu);
      }
      long long v37 = [v3 icon];
      long long v38 = [v3 sectionID];
      long long v39 = BLTPBSectionIconFromBBSectionIconForDeviceSize(v37, v38, a2);
      [(BLTPBSectionInfo *)v4 setIcon:v39];
    }
    uint64_t v40 = [v3 sectionInfoSettings];

    if (v40)
    {
      uint64_t v41 = [v3 sectionInfoSettings];
      unsigned int v42 = objc_msgSend(v41, "blt_protobuf");
      [(BLTPBSectionInfo *)v4 setSectionInfoSettings:v42];
    }
    if ([MEMORY[0x263F57700] activePairedDeviceSupportsAuthorizationExpirationDate])
    {
      uint64_t v43 = [v3 authorizationExpirationDate];

      if (v43)
      {
        uint64_t v44 = [v3 authorizationExpirationDate];
        [v44 timeIntervalSince1970];
        -[BLTPBSectionInfo setAuthorizationExpirationDate:](v4, "setAuthorizationExpirationDate:");
      }
      uint64_t v45 = [v3 lastUserGrantedAuthorizationDate];

      if (v45)
      {
        unint64_t v46 = [v3 lastUserGrantedAuthorizationDate];
        [v46 timeIntervalSince1970];
        -[BLTPBSectionInfo setLastUserGrantedAuthorizationDate:](v4, "setLastUserGrantedAuthorizationDate:");
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

BLTPBSectionIcon *BLTPBSectionIconFromBBSectionIconForDeviceSize(void *a1, void *a2, unsigned int a3)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 valueForProperty:*MEMORY[0x263F57638]];
    [v9 floatValue];
    double v11 = v10;
  }
  else
  {
    uint64_t v12 = blt_ids_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_7(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    double v11 = 2.0;
  }
  uint64_t v20 = [v5 variants];
  uint64_t v21 = [v20 count];

  if (!v21)
  {
    uint64_t v22 = 0;
LABEL_34:
    if (v6)
    {
      long long v51 = blt_ids_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_2();
      }

      unint64_t v72 = v8;
      id v73 = v5;
      switch(a3)
      {
        case 0u:
        case 1u:
        case 4u:
          *(void *)buf = 0x4058800000000000;
          uint64_t v52 = 13;
          double v53 = 27.5;
          uint64_t v54 = 9;
          uint64_t v55 = 0x4046000000000000;
          goto LABEL_40;
        case 3u:
          *(void *)buf = 0x405B000000000000;
          double v53 = 29.0;
          uint64_t v52 = 19;
          uint64_t v54 = 9;
          uint64_t v56 = 0x4049000000000000;
          uint64_t v57 = 16;
          break;
        case 5u:
        case 8u:
          *(void *)buf = 0x4058800000000000;
          double v53 = 29.0;
          uint64_t v52 = 19;
          uint64_t v54 = 9;
          uint64_t v55 = 0x4049000000000000;
LABEL_40:
          uint64_t v56 = v55;
          uint64_t v57 = 5;
          break;
        case 6u:
        case 9u:
          *(void *)buf = 0x405D400000000000;
          uint64_t v52 = 21;
          double v53 = 33.0;
          uint64_t v54 = 25;
          uint64_t v56 = 0x404A400000000000;
          uint64_t v57 = 23;
          break;
        case 7u:
          *(void *)buf = 0x4060200000000000;
          uint64_t v52 = 28;
          double v53 = 33.0;
          uint64_t v54 = 32;
          uint64_t v56 = 0x404A400000000000;
          uint64_t v57 = 30;
          break;
        default:
          *(void *)buf = 0x4055800000000000;
          double v53 = 24.0;
          uint64_t v52 = 11;
          uint64_t v54 = 7;
          uint64_t v56 = 0x4044000000000000;
          uint64_t v57 = 3;
          break;
      }
      *(void *)&buf[8] = v57;
      *(void *)&buf[16] = v56;
      uint64_t v87 = v54;
      double v88 = v53;
      uint64_t v89 = v52;
      uint64_t v22 = (BLTPBSectionIcon *)objc_opt_new();
      for (uint64_t i = 0; i != 48; i += 16)
      {
        uint64_t v59 = BLTPBGetPNGIconDataFromAppIcon(v6, *(double *)&buf[i], v11);
        if (v59)
        {
          unint64_t v60 = objc_opt_new();
          [v60 setFormat:*(unsigned int *)&buf[i + 8]];
          [v60 setPrecomposed:1];
          [v60 setImageData:v59];
          char v61 = blt_ids_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            uint64_t v62 = *(void *)&buf[i];
            unsigned int v63 = [v60 imageData];
            uint64_t v64 = [v63 length];
            *(_DWORD *)char v80 = 138412802;
            id v81 = v6;
            __int16 v82 = 2048;
            uint64_t v83 = v62;
            __int16 v84 = 2048;
            uint64_t v85 = v64;
            _os_log_error_impl(&dword_222F4C000, v61, OS_LOG_TYPE_ERROR, "Fetched icon for %@ of size %f with data size %lu", v80, 0x20u);
          }
          [(BLTPBSectionIcon *)v22 addVariant:v60];
        }
      }
      uint64_t v65 = [(BLTPBSectionIcon *)v22 variants];
      uint64_t v66 = [v65 count];

      if (v66)
      {
        int v8 = v72;
        id v5 = v73;
      }
      else
      {

        char v67 = blt_ids_log();
        int v8 = v72;
        id v5 = v73;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_1();
        }

        uint64_t v22 = 0;
      }
    }
    goto LABEL_56;
  }
  char v74 = v6;
  uint64_t v22 = objc_alloc_init(BLTPBSectionIcon);
  unsigned int v70 = a3;
  uint64_t v23 = BLTPBValidSectionIconVariantsForDeviceSize(a3);
  unint64_t v24 = blt_ids_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_6(v24, v25, v26, v27, v28, v29, v30, v31);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = [v5 variants];
  uint64_t v32 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v71 = v8;
    uint64_t v35 = *(void *)v77;
    *(void *)&long long v33 = 134218240;
    long long v69 = v33;
    while (2)
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v77 != v35) {
          objc_enumerationMutation(obj);
        }
        long long v37 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        long long v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "format", v69));
        char v39 = [v23 containsObject:v38];

        if (v39)
        {
          uint64_t v40 = [v37 applicationIdentifier];

          if (v40)
          {
            long long v49 = blt_ids_log();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_4(v37);
            }

            uint64_t v50 = [v37 applicationIdentifier];

            uint64_t v22 = 0;
            char v74 = (void *)v50;
            goto LABEL_32;
          }
          uint64_t v41 = [v37 systemImageName];

          if (v41)
          {
            unsigned int v42 = blt_ids_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_3((uint64_t)v90, (uint64_t)v37);
            }

            uint64_t v43 = [v37 systemImageName];
            +[BLTPBSectionIconVariant sectionIconVariantWithImageData:systemImageName:precomposed:format:](BLTPBSectionIconVariant, "sectionIconVariantWithImageData:systemImageName:precomposed:format:", 0, v43, 0, [v37 format]);
            uint64_t v44 = (BLTPBSectionIconVariant *)objc_claimAutoreleasedReturnValue();

            [(BLTPBSectionIcon *)v22 addVariant:v44];
          }
          else
          {
            uint64_t v44 = objc_alloc_init(BLTPBSectionIconVariant);
            -[BLTPBSectionIconVariant setFormat:](v44, "setFormat:", [v37 format]);
            uint64_t v45 = BLTPBDataForSectionIconVariant(v37, v11);
            [(BLTPBSectionIconVariant *)v44 setImageData:v45];
            -[BLTPBSectionIconVariant setPrecomposed:](v44, "setPrecomposed:", [v37 isPrecomposed]);
            [(BLTPBSectionIcon *)v22 addVariant:v44];
            unint64_t v46 = blt_ids_log();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              uint64_t v47 = [v37 format];
              uint64_t v48 = [v45 length];
              *(_DWORD *)buf = v69;
              *(void *)&uint8_t buf[4] = v47;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v48;
              _os_log_error_impl(&dword_222F4C000, v46, OS_LOG_TYPE_ERROR, "Icon variant: %ld fetched with size %lu", buf, 0x16u);
            }
          }
        }
        else
        {
          blt_ids_log();
          uint64_t v44 = (BLTPBSectionIconVariant *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v44->super.super, OS_LOG_TYPE_ERROR)) {
            BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_5((uint64_t)v91, (uint64_t)v37);
          }
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
      if (v34) {
        continue;
      }
      break;
    }
LABEL_32:
    int v8 = v71;
  }
  a3 = v70;

  id v6 = v74;
  if (!v22) {
    goto LABEL_34;
  }
LABEL_56:

  return v22;
}

id BLTPBSectionInfoFromBBSectionInfo(void *a1)
{
  id v1 = (void *)MEMORY[0x263F57730];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "blt_boundedWaitForActivePairedDevice");
  id v4 = [v3 valueForProperty:*MEMORY[0x263F57628]];
  uint64_t v5 = NRDeviceSizeForProductType();
  id v6 = BLTPBSectionInfoFromBBSectionInfoForDeviceSize(v2, v5);

  return v6;
}

id BLTPBDataForSectionIconVariant(void *a1, double a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x223CAC5D0]();
  uint64_t v5 = [v3 imageData];

  if (!v5)
  {
    uint64_t v15 = [v3 bundlePath];
    if (v15
      && (uint64_t v16 = (void *)v15,
          [v3 imageName],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          v17))
    {
      uint64_t v18 = (void *)MEMORY[0x263F086E0];
      uint64_t v19 = [v3 bundlePath];
      uint64_t v20 = [v18 bundleWithPath:v19];

      uint64_t v21 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v22 = [v3 imageName];
      uint64_t v23 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:a2];
      unint64_t v24 = [v21 imageNamed:v22 inBundle:v20 compatibleWithTraitCollection:v23];

      uint64_t v25 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v26 = *MEMORY[0x263F1D050];
      uint64_t v27 = [MEMORY[0x263F1C408] sharedApplication];
      [v25 postNotificationName:v26 object:v27];

      [MEMORY[0x263F1CBE0] _clearAllCachedImagesAndAssets];
      uint64_t v28 = blt_ids_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        BLTPBDataForSectionIconVariant_cold_2((uint64_t)v24, v3);
      }

      uint64_t v14 = UIImagePNGRepresentation(v24);
    }
    else
    {
      uint64_t v29 = [v3 imagePath];

      if (!v29)
      {
        uint64_t v14 = 0;
        goto LABEL_16;
      }
      uint64_t v30 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v31 = [v3 imagePath];
      uint64_t v20 = [v30 imageWithContentsOfFile:v31];

      uint64_t v32 = blt_ids_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        BLTPBDataForSectionIconVariant_cold_1((uint64_t)v20, v3);
      }

      uint64_t v14 = UIImagePNGRepresentation(v20);
    }

    goto LABEL_16;
  }
  id v6 = blt_ids_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    BLTPBDataForSectionIconVariant_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = [v3 imageData];
LABEL_16:

  return v14;
}

id BLTPBGetPNGIconDataFromAppIcon(void *a1, double a2, double a3)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = (void *)MEMORY[0x223CAC5D0]();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v5];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", a2, a2, a3);
  [v8 setShape:1];
  v30[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v7 prepareImagesForImageDescriptors:v9];

  uint64_t v10 = [v7 imageForDescriptor:v8];
  if (!v10)
  {
    uint64_t v11 = blt_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      BLTPBGetPNGIconDataFromAppIcon_cold_1();
    }
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  if ([v10 placeholder])
  {
    uint64_t v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      BLTPBGetPNGIconDataFromAppIcon_cold_4(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    uint64_t v20 = [v7 prepareImageForDescriptor:v8];

    uint64_t v11 = v20;
  }
  uint64_t v21 = [v11 CGImage];
  if (!v21)
  {
    uint64_t v26 = blt_general_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      BLTPBGetPNGIconDataFromAppIcon_cold_2();
    }

LABEL_14:
    unint64_t v24 = 0;
    int v25 = 1;
    goto LABEL_19;
  }
  uint64_t v22 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v21 scale:0 orientation:a3];
  uint64_t v23 = v22;
  if (v22)
  {
    unint64_t v24 = UIImagePNGRepresentation(v22);
    int v25 = 0;
  }
  else
  {
    uint64_t v27 = blt_general_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      BLTPBGetPNGIconDataFromAppIcon_cold_3();
    }

    unint64_t v24 = 0;
    int v25 = 1;
  }

LABEL_19:
  if (v25) {
    id v28 = 0;
  }
  else {
    id v28 = v24;
  }

  return v28;
}

id BLTPBSectionIconFromBBSectionIcon(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F57730];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_msgSend(v3, "blt_boundedWaitForActivePairedDevice");
  uint64_t v7 = [v6 valueForProperty:*MEMORY[0x263F57628]];
  unsigned int v8 = NRDeviceSizeForProductType();
  uint64_t v9 = BLTPBSectionIconFromBBSectionIconForDeviceSize(v5, v4, v8);

  return v9;
}

id BLTPBValidSectionIconVariantsForDeviceSize(unsigned int a1)
{
  if (a1 > 9) {
    id v1 = &unk_26D607CF0;
  }
  else {
    id v1 = (void *)qword_2646857D8[(__int16)a1];
  }
  id v2 = [MEMORY[0x263EFFA08] setWithArray:v1];
  return v2;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t BLTSettingSyncingNotificationsLevelToBLTPBSetNotificationsAlertLevel(uint64_t result)
{
  if ((unint64_t)(result - 1) < 3) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t BLTPBSetNotificationsAlertLevelToBLTSettingSyncingNotificationsLevel(int a1)
{
  uint64_t v1 = (a1 - 1);
  if (v1 < 3) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

void sub_222FC0598(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_222FC0BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 128));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_222FC3A20(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = blt_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(BLTPreviouslySentMessageStore *)(uint64_t)v3 initWithMessageStorePath:v4];
    }

    objc_end_catch();
    JUMPOUT(0x222FC399CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_222FC4314()
{
}

BOOL BLTPBBulletinIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t BLTPBTransportDataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_46;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_48:
          *(void *)(a1 + 8) = v19;
          continue;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_52:
          *(unsigned char *)(a1 + 36) = v26 != 0;
          continue;
        case 3u:
          uint64_t v30 = PBReaderReadData();
          uint64_t v31 = 24;
          goto LABEL_44;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        case 5u:
          uint64_t v30 = PBReaderReadData();
          uint64_t v31 = 16;
LABEL_44:
          long long v38 = *(void **)(a1 + v31);
          *(void *)(a1 + v31) = v30;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_54;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v34) = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v34) = 0;
      }
LABEL_56:
      *(_DWORD *)(a1 + 32) = v34;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBHandleLaunchSessionActionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_24:
        uint64_t v19 = *(BLTPBActionInformation **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      case 4u:
        uint64_t v19 = objc_alloc_init(BLTPBActionInformation);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (PBReaderPlaceMark() && BLTPBActionInformationReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

void sub_222FC6DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222FC6EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BLTPBSectionIconReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(BLTPBSectionIconVariant);
        [a1 addVariant:v17];
        if (!PBReaderPlaceMark() || (BLTPBSectionIconVariantReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL BLTPBSetSectionInfoRequestReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(BLTPBSectionInfo);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark() || (BLTPBSectionInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadString();
    uint64_t v17 = (BLTPBSectionInfo *)objc_claimAutoreleasedReturnValue();
    if (v17) {
      [a1 addKeypaths:v17];
    }
LABEL_25:

    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void _readDataFromFile_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_222F4C000, v0, v1, "-[NSData MD5:] call to readDataUpToLength: %@ failed with: %@");
}

void BLTCleanAttachmentsPath_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Unable to remove attachments dir %@", (uint8_t *)&v2, 0xCu);
}

void _BLTFileURLWithPath_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error - received nil path while trying to construct bulletin distributor file path!", v1, 2u);
}

void _BLTFileURLWithPath_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Could not create %@ error: %@", (uint8_t *)&v3, 0x16u);
}

void _BLTCaptureBug_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to send snapshot for bug %@", (uint8_t *)&v2, 0xCu);
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "No sectionInfo icon. app icon for %@ not found", v2, v3, v4, v5, v6);
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Fetching app icons for %@", v2, v3, v4, v5, v6);
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "systemImageName");
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_222F4C000, v5, v6, "Icon specified system image name: %@");
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_4(void *a1)
{
  uint64_t v1 = [a1 applicationIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "format");
  _DWORD *v3 = 134217984;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_222F4C000, v5, v6, "Skipping icon variant %ld as it is invalid for the current device");
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BLTPBSectionIconFromBBSectionIconForDeviceSize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BLTPBDataForSectionIconVariant_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 imagePath];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void BLTPBDataForSectionIconVariant_cold_2(uint64_t a1, void *a2)
{
  os_log_t v3 = [a2 bundlePath];
  unsigned int v9 = [a2 imageName];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

void BLTPBDataForSectionIconVariant_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BLTPBGetPNGIconDataFromAppIcon_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No isImage for: %@", v2, v3, v4, v5, v6);
}

void BLTPBGetPNGIconDataFromAppIcon_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No cgImage for: %@", v2, v3, v4, v5, v6);
}

void BLTPBGetPNGIconDataFromAppIcon_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "BLTPBGetPNGIconDataFromAppIcon: No UIImage for: %@", v2, v3, v4, v5, v6);
}

void BLTPBGetPNGIconDataFromAppIcon_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BBGetObserverGatewayTimeout()
{
  return MEMORY[0x270F128F0]();
}

uint64_t BBServerListeningForConnections()
{
  return MEMORY[0x270F12918]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t INSupportedIntentsByExtensions()
{
  return MEMORY[0x270EF52A0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t NRDeviceSizeForProductType()
{
  return MEMORY[0x270F4D898]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x270F4D8C0]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}