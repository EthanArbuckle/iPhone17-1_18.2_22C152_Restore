void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_0_3(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t AWDDEDExtensionScheduledReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 != 2)
      {
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_47;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
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
        uint64_t v32 = 16;
        goto LABEL_46;
      }
      uint64_t v29 = PBReaderReadString();
      v30 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v29;

LABEL_47:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 32) |= 1u;
    while (1)
    {
      uint64_t v26 = *v3;
      unint64_t v27 = *(void *)(a2 + v26);
      if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
      *(void *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_43;
      }
      v24 += 7;
      BOOL v14 = v25++ >= 9;
      if (v14)
      {
        uint64_t v20 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_45:
    uint64_t v32 = 8;
LABEL_46:
    *(void *)(a1 + v32) = v20;
    goto LABEL_47;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21FE0A620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21FE0ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AWDDEDDeferredCheckInReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__timestamp;
            goto LABEL_38;
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
            uint64_t v19 = 0;
            char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__timestamp;
            goto LABEL_41;
          }
        }
        char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__timestamp;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(void *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
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
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__numtasks;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__numtasks;
        goto LABEL_41;
      }
    }
    char v24 = &OBJC_IVAR___AWDDEDDeferredCheckIn__numtasks;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id formatter()
{
  if (formatter_onceToken != -1) {
    dispatch_once(&formatter_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)formatter_f;
  return v0;
}

uint64_t __formatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)formatter_f;
  formatter_f = (uint64_t)v0;

  v2 = (void *)formatter_f;
  return [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
}

void sub_21FE103B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE115D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FE12A44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE136CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE13E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE15BD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE16038(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE167CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE168B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE1698C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE16B04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE17158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE17258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE17C04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE183DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE18564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE18690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE18704(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE18938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id DEDSessionStateLog()
{
  if (DEDSessionStateLog_onceToken != -1) {
    dispatch_once(&DEDSessionStateLog_onceToken, &__block_literal_global_5);
  }
  id v0 = (void *)DEDSessionStateLog_log;
  return v0;
}

void __DEDSessionStateLog_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "s-state");
  uint64_t v1 = (void *)DEDSessionStateLog_log;
  DEDSessionStateLog_log = (uint64_t)v0;
}

BOOL DEDCurrentDeviceIsHomePod()
{
  return MGGetSInt32Answer() == 7;
}

double DEDTimeElapsed(double a1, double a2)
{
  BOOL v4 = a2 != -1.0 && a1 != -1.0 && a2 > 0.0 && a2 > a1;
  double result = a2 - a1;
  if (!v4) {
    return -1.0;
  }
  return result;
}

id Log()
{
  if (Log_onceToken != -1) {
    dispatch_once(&Log_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)Log_log;
  return v0;
}

void __Log_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-cfu-notifier");
  uint64_t v1 = (void *)Log_log;
  Log_log = (uint64_t)v0;
}

id DEDSessionCleanupLog()
{
  if (DEDSessionCleanupLog_onceToken != -1) {
    dispatch_once(&DEDSessionCleanupLog_onceToken, &__block_literal_global_8);
  }
  os_log_t v0 = (void *)DEDSessionCleanupLog_log;
  return v0;
}

void __DEDSessionCleanupLog_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "cleanup");
  uint64_t v1 = (void *)DEDSessionCleanupLog_log;
  DEDSessionCleanupLog_log = (uint64_t)v0;
}

void sub_21FE20A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21FE20BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21FE20D6C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_21FE20EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE21168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21FE21404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FE217E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE21B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE21C64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE21D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE21FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21FE2255C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21FE22890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FE22C94(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE22DD0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_21FE22FC0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE23678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_destroyWeak(v10);
  _Unwind_Resume(a1);
}

void sub_21FE2391C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FE23C90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FE23FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21FE24294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21FE24578(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21FE2479C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_21FE24960(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE24AE4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE24DB8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE25034(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE25204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21FE253F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21FE25A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FE26BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v11 - 176), 8);
  objc_destroyWeak((id *)(v11 - 248));
  _Unwind_Resume(a1);
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

void sub_21FE27D18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21FE2811C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FE29AFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE29DDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE2AE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id Log_0()
{
  if (Log_onceToken_0 != -1) {
    dispatch_once(&Log_onceToken_0, &__block_literal_global_323);
  }
  os_log_t v0 = (void *)Log_log_0;
  return v0;
}

void sub_21FE2B530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2BBC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21FE2C3E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
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

void sub_21FE2CA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2CF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2D670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2E344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2E928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE2EF00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21FE2F3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Log_block_invoke_0()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-daemon");
  uint64_t v1 = (void *)Log_log_0;
  Log_log_0 = (uint64_t)v0;
}

uint64_t DEDDeviceHashingKey(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%i-%@", a2, a1];
}

void sub_21FE33804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_21FE33BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FE343EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Log_block_invoke_1()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "de-collector");
  uint64_t v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;
}

void sub_21FE34A60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE34B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE34C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE34DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE34E54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE35044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_21FE351EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE35FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t AWDDEDExtensionStartedReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
        char v24 = *(void **)(a1 + 16);
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
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
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

void sub_21FE37748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE37808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE379B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE37B3C(_Unwind_Exception *exception_object)
{
}

void sub_21FE37C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDDEDDaemonStartedReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  BOOL v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
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
        *(void *)(a1 + 8) = v19;
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

void sub_21FE3A2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE3A434(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21FE3B780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id Log_1()
{
  if (Log_onceToken_1 != -1) {
    dispatch_once(&Log_onceToken_1, &__block_literal_global_16);
  }
  os_log_t v0 = (void *)Log_log_1;
  return v0;
}

void __Log_block_invoke_2()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "dedfbk");
  uint64_t v1 = (void *)Log_log_1;
  Log_log_1 = (uint64_t)v0;
}

id DEDAddressForIDSDevice()
{
  os_log_t v0 = (void *)IDSCopyIDForDevice();
  uint64_t v1 = objc_msgSend(v0, "rangeOfString:options:range:", @"self-", 2, 0, 6);
  if (v2)
  {
    uint64_t v3 = objc_msgSend(v0, "stringByReplacingCharactersInRange:withString:", v1, v2, &stru_26D197018);

    os_log_t v0 = (void *)v3;
  }
  return v0;
}

BOOL DEDIDSCommandShouldUseFireAndForget(int a1)
{
  return a1 == 17;
}

id DEDIDSConnectionLog()
{
  if (DEDIDSConnectionLog_onceToken1 != -1) {
    dispatch_once(&DEDIDSConnectionLog_onceToken1, &__block_literal_global_18);
  }
  os_log_t v0 = (void *)DEDIDSConnectionLog_handle;
  return v0;
}

void __DEDIDSConnectionLog_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ids-connection");
  uint64_t v1 = (void *)DEDIDSConnectionLog_handle;
  DEDIDSConnectionLog_handle = (uint64_t)v0;
}

const char *DEDIDSCommandString(unsigned int a1)
{
  if (a1 > 0x20) {
    return "UNKNOWN";
  }
  else {
    return off_26453B3F0[a1];
  }
}

uint64_t isKnownDevice(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4
    && ([v3 deviceForFromID:v4], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = Log_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      isKnownDevice_cold_1();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

id Log_2()
{
  if (Log_onceToken_2 != -1) {
    dispatch_once(&Log_onceToken_2, &__block_literal_global_281);
  }
  os_log_t v0 = (void *)Log_log_2;
  return v0;
}

id IDSDelLog()
{
  if (IDSDelLog_onceToken != -1) {
    dispatch_once(&IDSDelLog_onceToken, &__block_literal_global_285);
  }
  os_log_t v0 = (void *)IDSDelLog_log;
  return v0;
}

void __Log_block_invoke_3()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ids-inbound");
  uint64_t v1 = (void *)Log_log_2;
  Log_log_2 = (uint64_t)v0;
}

void __IDSDelLog_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ids-delegate");
  uint64_t v1 = (void *)IDSDelLog_log;
  IDSDelLog_log = (uint64_t)v0;
}

uint64_t AWDDEDBugSessionCreatedReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
        char v24 = *(void **)(a1 + 16);
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
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
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

id Log_3()
{
  if (Log_onceToken_3 != -1) {
    dispatch_once(&Log_onceToken_3, &__block_literal_global_154);
  }
  os_log_t v0 = (void *)Log_log_3;
  return v0;
}

void __Log_block_invoke_4()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "debug-request");
  uint64_t v1 = (void *)Log_log_3;
  Log_log_3 = (uint64_t)v0;
}

void sub_21FE4D9EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id Log_4()
{
  if (Log_onceToken_4 != -1) {
    dispatch_once(&Log_onceToken_4, &__block_literal_global_72_0);
  }
  os_log_t v0 = (void *)Log_log_4;
  return v0;
}

void __Log_block_invoke_5()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "state");
  uint64_t v1 = (void *)Log_log_4;
  Log_log_4 = (uint64_t)v0;
}

void sub_21FE4E3DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDDEDBugSessionEndedReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
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
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
        *(void *)(a1 + 8) = v19;
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

id Log_5()
{
  if (Log_onceToken1 != -1) {
    dispatch_once(&Log_onceToken1, &__block_literal_global_259);
  }
  os_log_t v0 = (void *)Log_handle_0;
  return v0;
}

void sub_21FE5071C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_21FE514F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 128));
  _Unwind_Resume(a1);
}

void sub_21FE51EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE522F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FE53244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_21FE537C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21FE53D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)(v16 - 192));
  objc_destroyWeak((id *)(v16 - 184));
  _Block_object_dispose((const void *)(v16 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21FE54378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21FE54790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Log_block_invoke_6()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "sharing-connection");
  uint64_t v1 = (void *)Log_handle_0;
  Log_handle_0 = (uint64_t)v0;
}

id DEDHealthWrapDERDataFromString(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x263EFF8F8];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithBase64EncodedString:v2 options:0];

  return v3;
}

SecCertificateRef DEDHealthWrapCertificateFromString(void *a1)
{
  DEDHealthWrapDERDataFromString(a1);
  CFDataRef v1 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  SecCertificateRef v2 = SecCertificateCreateWithData(0, v1);

  return v2;
}

id Log_6()
{
  if (Log_onceToken_5 != -1) {
    dispatch_once(&Log_onceToken_5, &__block_literal_global_28);
  }
  os_log_t v0 = (void *)Log_log_5;
  return v0;
}

void __Log_block_invoke_7()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-usernotfier");
  CFDataRef v1 = (void *)Log_log_5;
  Log_log_5 = (uint64_t)v0;
}

void sub_21FE55A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE5A75C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

__CFString *stringIfNil(__CFString *a1)
{
  if (!a1) {
    a1 = &stru_26D197018;
  }
  return a1;
}

id argumentsList()
{
  os_log_t v0 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v1 = [v0 arguments];

  if ([v1 count] == 1)
  {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v2 = objc_msgSend(v1, "subarrayWithRange:", 1, objc_msgSend(v1, "count") - 1);
  }

  return v2;
}

id DEDSessionStartLog()
{
  if (DEDSessionStartLog_onceToken != -1) {
    dispatch_once(&DEDSessionStartLog_onceToken, &__block_literal_global_33);
  }
  os_log_t v0 = (void *)DEDSessionStartLog_log;
  return v0;
}

void __DEDSessionStartLog_block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "session-start");
  uint64_t v1 = (void *)DEDSessionStartLog_log;
  DEDSessionStartLog_log = (uint64_t)v0;
}

uint64_t AWDDEDExtensionCompletedReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 8u;
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
              goto LABEL_58;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_60;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_60:
          uint64_t v47 = 32;
          goto LABEL_77;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v24;

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_64:
          uint64_t v47 = 24;
          goto LABEL_77;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 2u;
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
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_68:
          uint64_t v47 = 16;
          goto LABEL_77;
        case 5u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 56) |= 0x10u;
          while (2)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v38) = 0;
          }
LABEL_72:
          *(_DWORD *)(a1 + 40) = v38;
          continue;
        case 6u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 56) |= 1u;
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
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 == -1 || v45 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
        *(void *)(a2 + v44) = v45 + 1;
        v19 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0) {
          goto LABEL_74;
        }
        v42 += 7;
        BOOL v14 = v43++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_76;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_76:
      uint64_t v47 = 8;
LABEL_77:
      *(void *)(a1 + v47) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDDEDFinisherEndedReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
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
              goto LABEL_57;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_59;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_59:
          uint64_t v45 = 24;
          goto LABEL_68;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_63:
          uint64_t v45 = 8;
          goto LABEL_68;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_67:
          uint64_t v45 = 16;
LABEL_68:
          *(void *)(a1 + v45) = v19;
          continue;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 40) |= 0x10u;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
              *(void *)(a2 + v37) = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v36) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v36) = 0;
          }
LABEL_72:
          uint64_t v46 = 36;
          goto LABEL_77;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
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
        uint64_t v42 = *v3;
        unint64_t v43 = *(void *)(a2 + v42);
        if (v43 == -1 || v43 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
        *(void *)(a2 + v42) = v43 + 1;
        v36 |= (unint64_t)(v44 & 0x7F) << v40;
        if ((v44 & 0x80) == 0) {
          goto LABEL_74;
        }
        v40 += 7;
        BOOL v14 = v41++ >= 9;
        if (v14)
        {
          LODWORD(v36) = 0;
          goto LABEL_76;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v36) = 0;
      }
LABEL_76:
      uint64_t v46 = 32;
LABEL_77:
      *(_DWORD *)(a1 + v46) = v36;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21FE5EC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE5F214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FE5FBDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE5FCFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE5FDA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FE60098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDDEDFinisherStartedReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
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
              goto LABEL_50;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_52:
          uint64_t v40 = 24;
          goto LABEL_61;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_56:
          uint64_t v40 = 16;
          goto LABEL_61;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_60:
          uint64_t v40 = 8;
LABEL_61:
          *(void *)(a1 + v40) = v19;
          continue;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
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
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
        *(void *)(a2 + v37) = v38 + 1;
        v36 |= (unint64_t)(v39 & 0x7F) << v34;
        if ((v39 & 0x80) == 0) {
          goto LABEL_63;
        }
        v34 += 7;
        BOOL v14 = v35++ >= 9;
        if (v14)
        {
          LODWORD(v36) = 0;
          goto LABEL_65;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v36) = 0;
      }
LABEL_65:
      *(_DWORD *)(a1 + 32) = v36;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21FE65884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FE6806C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    id v4 = [v2 log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DEDSeedingClient HTTPErrorWithResponse:withData:]();
    }

    objc_end_catch();
    JUMPOUT(0x21FE67F04);
  }
  _Unwind_Resume(exception_object);
}

void sub_21FE6A880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21FE6AF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void isKnownDevice_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Device from ID [%{public}@] is unknown, ignoring message", v2, v3, v4, v5, v6);
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x270F90C30](s);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x270F90C60](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x270F90C78](s);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x270F90D88](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x270F90E50](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x270F90EB0](path, *(void *)&open_flags, open_mode);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x270F90F80](dir, path, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAPathList AAPathListCreateWithPath(const char *dir, const char *path)
{
  return (AAPathList)MEMORY[0x270F90F88](dir, path);
}

void AAPathListDestroy(AAPathList path_list)
{
}

AEAContext AEAContextCreateWithProfile(AEAProfile profile)
{
  return (AEAContext)MEMORY[0x270F90FE0](*(void *)&profile);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x270F91030](context, *(void *)&field, *(void *)&representation, buf, buf_size);
}

int AEAContextSetFieldUInt(AEAContext context, AEAContextField field, uint64_t value)
{
  return MEMORY[0x270F91038](context, *(void *)&field, value);
}

AAByteStream AEAEncryptionOutputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x270F91058](encrypted_stream, context, flags, *(void *)&n_threads);
}

uint64_t AWDPostMetric()
{
  return MEMORY[0x270F858D0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t HKHealthWrapCertificateFromString()
{
  return MEMORY[0x270EF36F8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x270F3C9A8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x270EFDB40]();
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}