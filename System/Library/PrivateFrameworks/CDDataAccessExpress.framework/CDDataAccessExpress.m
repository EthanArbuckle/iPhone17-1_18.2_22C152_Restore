id DALoggingwithCategory(unint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (a1 >= 0xC) {
    DALoggingwithCategory_cold_1();
  }
  if (DALoggingwithCategory_onceToken != -1) {
    dispatch_once(&DALoggingwithCategory_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)DALoggingwithCategory_log[a1];

  return v2;
}

void sub_1C88571BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
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

void sub_1C8857D34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C8858A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t buf, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8858F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8859578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8859824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8859A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8859FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885B018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885BF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885D0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885D484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885E3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885EAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885EE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C885F994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1C885FDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C88600C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C88602B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8860878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8860D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C88610A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1C8861368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8861734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1C8861CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8861EA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8861F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8862544(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C88625E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DACPLoggingAppendDataToLogFile(int a1, const void *a2, CFDataRef theData, void *a4)
{
  if (_init_once == -1)
  {
    if (!theData)
    {
LABEL_17:
      if (!a4) {
        return;
      }
      if (_callbackQueue_onceToken != -1) {
        dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_79);
      }
      v9 = _callbackQueue_queue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __DACPLoggingAppendDataToLogFile_block_invoke;
      v17[3] = &unk_1E6574360;
      v17[4] = a4;
      v10 = v17;
      goto LABEL_21;
    }
  }
  else
  {
    dispatch_once(&_init_once, &__block_literal_global_68);
    if (!theData) {
      goto LABEL_17;
    }
  }
  if (!CFDataGetLength(theData)) {
    goto LABEL_17;
  }
  unint64_t v8 = _settingsForFacility(a2);
  if ((int)_maxLogFileLevel(v8) < a1)
  {
    if (!a4) {
      return;
    }
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_79);
    }
    v9 = _callbackQueue_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __DACPLoggingAppendDataToLogFile_block_invoke_2;
    v16[3] = &unk_1E6574360;
    v16[4] = a4;
    v10 = v16;
LABEL_21:
    dispatch_async(v9, v10);
    return;
  }
  CFDataRef Copy = CFDataCreateCopy(0, theData);
  if (a4) {
    a4 = _Block_copy(a4);
  }
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v8);
  atomic_store(0, (unsigned __int8 *)(v8 + 156));
  if (_workGroup_once != -1) {
    dispatch_once(&_workGroup_once, &__block_literal_global_83);
  }
  v13 = _workGroup_group;
  if (_workQueue_once != -1)
  {
    uint64_t v14 = _workGroup_group;
    dispatch_once(&_workQueue_once, &__block_literal_global_85);
    v13 = v14;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __DACPLoggingAppendDataToLogFile_block_invoke_3;
  block[3] = &unk_1E6574388;
  block[5] = WorkSettingsFromSettings;
  block[6] = Copy;
  block[4] = a4;
  dispatch_group_async(v13, (dispatch_queue_t)_workQueue_queue, block);
}

uint64_t __DACPLoggingAppendDataToLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t _settingsForFacility(const void *a1)
{
  unint64_t explicit = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  if (a1)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)explicit, memory_order_acquire);
    if (explicit)
    {
      while (1)
      {
        CFArrayRef v3 = *(const __CFArray **)(explicit + 8);
        if (v3)
        {
          v5.length = CFArrayGetCount(*(CFArrayRef *)(explicit + 8));
          v5.location = 0;
          if (CFArrayContainsValue(v3, v5, a1)) {
            break;
          }
        }
        unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)explicit, memory_order_acquire);
        if (!explicit) {
          return atomic_load_explicit(&_logFileSettings, memory_order_acquire);
        }
      }
    }
    else
    {
      return atomic_load_explicit(&_logFileSettings, memory_order_acquire);
    }
  }
  return explicit;
}

uint64_t _maxLogFileLevel(unint64_t a1)
{
  while (1)
  {
    uint64_t explicit = atomic_load_explicit((atomic_uint *volatile)(a1 + 56), memory_order_acquire);
    if (explicit != -3) {
      break;
    }
    uint64_t explicit = atomic_load_explicit((atomic_uint *volatile)(a1 + 48), memory_order_acquire);
    if (explicit != -2) {
      break;
    }
    unint64_t v2 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
    BOOL v3 = a1 == v2;
    a1 = v2;
    if (v3) {
      _maxLogFileLevel_cold_1();
    }
  }
  return explicit;
}

uint64_t __DACPLoggingAppendDataToLogFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *_createWorkSettingsFromSettings(unint64_t a1)
{
  unint64_t v2 = malloc_type_calloc(0x50uLL, 1uLL, 0x36DEFBAuLL);
  BOOL v3 = v2;
  if (v2)
  {
    *unint64_t v2 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 8), memory_order_acquire);
    v2[1] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
    v2[2] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 24), memory_order_acquire);
    unint64_t v4 = a1;
    while (1)
    {
      unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(v4 + 32), memory_order_acquire);
      if (explicit != -2) {
        break;
      }
      unint64_t v6 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      BOOL v7 = v4 == v6;
      unint64_t v4 = v6;
      if (v7) {
        _createWorkSettingsFromSettings_cold_1();
      }
    }
    v2[3] = explicit;
    unint64_t v8 = a1;
    while (1)
    {
      unsigned int v9 = atomic_load_explicit((atomic_uint *volatile)(v8 + 40), memory_order_acquire);
      if (v9 != -2) {
        break;
      }
      unint64_t v10 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      BOOL v7 = v8 == v10;
      unint64_t v8 = v10;
      if (v7) {
        _createWorkSettingsFromSettings_cold_2();
      }
    }
    *((_DWORD *)v2 + _Block_object_dispose(&STACK[0x3F0], 8) = v9;
    v2[5] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 64), memory_order_acquire);
    v2[6] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 80), memory_order_acquire);
    unint64_t v11 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 96), memory_order_acquire);
    uint64_t v12 = *(void *)(a1 + 136);
    v2[7] = v11;
    v2[8] = v12;
    unint64_t v13 = a1;
    while (1)
    {
      unsigned int v14 = atomic_load_explicit((atomic_uint *volatile)(v13 + 144), memory_order_acquire);
      if (v14) {
        break;
      }
      unint64_t v15 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      BOOL v7 = v13 == v15;
      unint64_t v13 = v15;
      if (v7) {
        _createWorkSettingsFromSettings_cold_3();
      }
    }
    *((unsigned char *)v2 + 72) = v14 == 2;
    unint64_t v16 = a1;
    while (1)
    {
      int v17 = *(_DWORD *)(v16 + 152);
      if (v17) {
        break;
      }
      unint64_t v18 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      BOOL v7 = v16 == v18;
      unint64_t v16 = v18;
      if (v7) {
        _createWorkSettingsFromSettings_cold_4();
      }
    }
    *((unsigned char *)v2 + 73) = v17 == 2;
    *((unsigned char *)v2 + 74) = atomic_load_explicit((atomic_uchar *volatile)(a1 + 156), memory_order_acquire);
  }
  else
  {
    v19 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 0;
      _os_log_impl(&dword_1C8854000, v19, OS_LOG_TYPE_ERROR, "Could not create a copy of the log file settings.", (uint8_t *)v21, 2u);
    }
  }
  return v3;
}

void __DACPLoggingAppendDataToLogFile_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(uint64_t **)(a1 + 40);
  if (!v2)
  {
    unsigned int v9 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    unint64_t v10 = "Cannot append data to log file because workSettings is NULL.";
    unint64_t v11 = v9;
    uint32_t v12 = 2;
LABEL_13:
    _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_37;
  }
  BOOL v3 = (void *)v2[8];
  if (!v3)
  {
    unint64_t v13 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    uint64_t v14 = *v2;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v14;
    unint64_t v10 = "Cannot append data to log file because shared work settings is NULL. Facilities: %@";
    unint64_t v11 = v13;
    uint32_t v12 = 12;
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v2[3] >= 1)
  {
    if (!*v3)
    {
LABEL_8:
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(void *)v2[8] = CFDateCreate(0, Current + 13.0);
      uint64_t v8 = v2[3];
      goto LABEL_15;
    }
    double v5 = MEMORY[0x1CB7700B0]();
    if (v5 < CFAbsoluteTimeGetCurrent())
    {
      unint64_t v6 = *(const void **)v2[8];
      if (v6) {
        CFRelease(v6);
      }
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_15:
  unint64_t v15 = 0;
  unsigned int v16 = 0;
  char v30 = 0;
  do
  {
    if (v15) {
      CFRelease(v15);
    }
    unint64_t v15 = *(const void **)(v2[8] + 8);
    if (v15 || (_workQueueRefreshUUIDForWorkSettings(v2), (unint64_t v15 = *(const void **)(v2[8] + 8)) != 0))
    {
      int v17 = *((unsigned __int8 *)v2 + 74);
      int v18 = *((unsigned __int8 *)v2 + 72);
      uint64_t v19 = *((int *)v2 + 8);
      v20 = +[DACPLogShared shared];
      *(void *)buf = 0;
      BOOL v21 = [(DACPLogShared *)v20 _logData:v4 UUID:v15 startNewFile:v17 != 0 sizeCheck:v8 wantsCompressed:v18 != 0 maxFileCount:v19 outDidCreateNewFile:&v30 outNewFilePath:buf];
      if (*(void *)buf)
      {
        CFRetain(*(CFTypeRef *)buf);
        unint64_t v15 = *(const void **)buf;
      }
      else
      {
        unint64_t v15 = 0;
      }
      uint64_t v22 = v2[8];
      v23 = *(const void **)(v22 + 8);
      if (!v21)
      {
        if (v23)
        {
          CFRelease(v23);
          uint64_t v22 = v2[8];
        }
        v23 = 0;
        *(void *)(v22 + _Block_object_dispose(&STACK[0x3F0], 8) = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    if (v23) {
      break;
    }
    ++v16;
  }
  while (v16 < 3);
  if (v16 >= 3)
  {
    v24 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *v2;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v25;
      _os_log_impl(&dword_1C8854000, v24, OS_LOG_TYPE_ERROR, "Can't append data to log file, even after retrying. Giving up. Facilities: %@", buf, 0xCu);
    }
  }
  uint64_t v26 = v2[6];
  if (v26 && v30) {
    (*(void (**)(uint64_t, const void *))(v26 + 16))(v26, v15);
  }
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v1 = a1;
LABEL_37:
  free(*(void **)(v1 + 40));
  v27 = *(const void **)(v1 + 48);
  if (v27) {
    CFRelease(v27);
  }
  if (*(void *)(v1 + 32))
  {
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_79);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __DACPLoggingAppendDataToLogFile_block_invoke_4;
    block[3] = &unk_1E6574360;
    block[4] = *(void *)(v1 + 32);
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void __DACPLoggingAppendDataToLogFile_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

void DACPLoggingSlurpFileIntoLogFile(int a1, const void *a2, const __CFString *a3, const __CFString *Copy, const __CFString *a5, void *a6)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  unint64_t v12 = _settingsForFacility(a2);
  if ((int)_maxLogFileLevel(v12) >= a1)
  {
    if (Copy) {
      CFDataRef Copy = CFStringCreateCopy(0, Copy);
    }
    if (a3) {
      a3 = CFStringCreateCopy(0, a3);
    }
    if (a5) {
      a5 = CFStringCreateCopy(0, a5);
    }
    if (a6) {
      a6 = _Block_copy(a6);
    }
    WorkSettingsFromSettings = _createWorkSettingsFromSettings(v12);
    atomic_store(0, (unsigned __int8 *)(v12 + 156));
    if (_workGroup_once != -1) {
      dispatch_once(&_workGroup_once, &__block_literal_global_83);
    }
    uint64_t v14 = _workGroup_group;
    if (_workQueue_once != -1) {
      dispatch_once(&_workQueue_once, &__block_literal_global_85);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __DACPLoggingSlurpFileIntoLogFile_block_invoke_2;
    v15[3] = &unk_1E65743B0;
    v15[6] = Copy;
    v15[7] = a3;
    v15[8] = a5;
    v15[4] = a6;
    v15[5] = WorkSettingsFromSettings;
    dispatch_group_async(v14, (dispatch_queue_t)_workQueue_queue, v15);
  }
  else if (a6)
  {
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_79);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __DACPLoggingSlurpFileIntoLogFile_block_invoke;
    block[3] = &unk_1E6574360;
    block[4] = a6;
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

uint64_t __DACPLoggingSlurpFileIntoLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  CFStringRef v2 = *(const __CFString **)(a1 + 48);
  uint64_t v29 = *(void *)(a1 + 64);
  uint64_t v30 = *(void *)(a1 + 56);
  if (v1[3] < 1) {
    goto LABEL_7;
  }
  if (*(void *)v1[8])
  {
    double v3 = MEMORY[0x1CB7700B0]();
    if (v3 < CFAbsoluteTimeGetCurrent())
    {
      uint64_t v4 = *(const void **)v1[8];
      if (v4) {
        CFRelease(v4);
      }
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v28 = 0;
    goto LABEL_8;
  }
LABEL_6:
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(void *)v1[8] = CFDateCreate(0, Current + 13.0);
  uint64_t v28 = v1[3];
LABEL_8:
  unint64_t v6 = 0;
  unsigned int v7 = 0;
  char v31 = 0;
  uint64_t v8 = *(void *)(v1[8] + 8);
  do
  {
    if (v8 || (_workQueueRefreshUUIDForWorkSettings(v1), (uint64_t v8 = *(void *)(v1[8] + 8)) != 0))
    {
      if (v6)
      {
        CFRelease(v6);
        uint64_t v8 = *(void *)(v1[8] + 8);
      }
      int v9 = *((unsigned __int8 *)v1 + 74);
      int v10 = *((unsigned __int8 *)v1 + 72);
      int v11 = *((_DWORD *)v1 + 8);
      unint64_t v12 = malloc_type_malloc(0xC8uLL, 0xD1C8F99DuLL);
      if (!v12)
      {
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_2();
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3();
      }
      unint64_t v13 = v12;
      uint64_t v14 = 200;
      while (!CFStringGetCString(v2, (char *)v13, v14, 0x8000100u))
      {
        free(v13);
        if (v14 < 0x100000)
        {
          v14 *= 2;
          unint64_t v13 = malloc_type_malloc(v14, 0xB08B271BuLL);
          if (v13) {
            continue;
          }
        }
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_1(v2);
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3();
      }
      uint64_t v15 = open((const char *)v13, 0);
      *(void *)cf = 0;
      HIDWORD(v26) = v11;
      LOBYTE(v26) = v10 != 0;
      BOOL v16 = -[DACPLogShared _slurpToFileUUID:slurpeeFileDescriptor:prefix:suffix:startNewFile:sizeCheck:wantsCompressed:maxLogFileCount:outDidCreateNewFile:outNewFilePath:](+[DACPLogShared shared](DACPLogShared, "shared"), "_slurpToFileUUID:slurpeeFileDescriptor:prefix:suffix:startNewFile:sizeCheck:wantsCompressed:maxLogFileCount:outDidCreateNewFile:outNewFilePath:", v8, v15, v30, v29, v9 != 0, v28, v26, &v31, cf);
      if (*(void *)cf)
      {
        CFRetain(*(CFTypeRef *)cf);
        unint64_t v6 = *(const void **)cf;
      }
      else
      {
        unint64_t v6 = 0;
      }
      if (v15 != -1) {
        close(v15);
      }
      free(v13);
      uint64_t v17 = v1[8];
      int v18 = *(const void **)(v17 + 8);
      if (!v16)
      {
        if (v18)
        {
          CFRelease(v18);
          uint64_t v17 = v1[8];
        }
        int v18 = 0;
        *(void *)(v17 + _Block_object_dispose(&STACK[0x3F0], 8) = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    if (v18) {
      break;
    }
    ++v7;
    uint64_t v8 = 0;
  }
  while (v7 < 3);
  if (v7 >= 3)
  {
    uint64_t v19 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *v1;
      *(_DWORD *)cf = 138412290;
      *(void *)&cf[4] = v20;
      _os_log_impl(&dword_1C8854000, v19, OS_LOG_TYPE_ERROR, "Can't slurp lookaside file into log file, even after retrying. Giving up. Facilities: %@", cf, 0xCu);
    }
  }
  uint64_t v21 = v1[6];
  if (v21 && v31) {
    (*(void (**)(uint64_t, const void *))(v21 + 16))(v21, v6);
  }
  if (v6) {
    CFRelease(v6);
  }
  free(*(void **)(a1 + 40));
  uint64_t v22 = *(const void **)(a1 + 48);
  if (v22) {
    CFRelease(v22);
  }
  v23 = *(const void **)(a1 + 56);
  if (v23) {
    CFRelease(v23);
  }
  v24 = *(const void **)(a1 + 64);
  if (v24) {
    CFRelease(v24);
  }
  uint64_t v25 = *(void *)(a1 + 32);
  if (v25)
  {
    (*(void (**)(void))(v25 + 16))();
    _Block_release(*(const void **)(a1 + 32));
  }
}

void DACPLoggingAddCustomLogConfiguration(const __CFArray *a1, const __CFDictionary *a2)
{
  if (!a1) {
    DACPLoggingAddCustomLogConfiguration_cold_1();
  }
  if (!CFArrayGetCount(a1)) {
    DACPLoggingAddCustomLogConfiguration_cold_2();
  }
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  if (CFDictionaryContainsKey(a2, @"logName")) {
    CFTypeRef cf = CFDictionaryGetValue(a2, @"logName");
  }
  else {
    CFTypeRef cf = 0;
  }
  if (CFDictionaryContainsKey(a2, @"logDirectory")) {
    Value = (__CFString *)CFDictionaryGetValue(a2, @"logDirectory");
  }
  else {
    Value = 0;
  }
  if (CFDictionaryContainsKey(a2, @"maxLogFileSize")) {
    CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a2, @"maxLogFileSize");
  }
  else {
    CFNumberRef v4 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"maxLogFileCount")) {
    CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a2, @"maxLogFileCount");
  }
  else {
    CFNumberRef v5 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"wantsCompressedFiles")) {
    CFBooleanRef BOOLean = (const __CFBoolean *)CFDictionaryGetValue(a2, @"wantsCompressedFiles");
  }
  else {
    CFBooleanRef BOOLean = 0;
  }
  if (CFDictionaryContainsKey(a2, @"consoleUsesRealLevels")) {
    CFBooleanRef v42 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"consoleUsesRealLevels");
  }
  else {
    CFBooleanRef v42 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"maxConsoleLevel")) {
    CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a2, @"maxConsoleLevel");
  }
  else {
    CFNumberRef v6 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"maxLogFileLevel")) {
    CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a2, @"maxLogFileLevel");
  }
  else {
    CFNumberRef v7 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"consoleLevelDefaultsDomain")) {
    CFTypeRef v36 = CFDictionaryGetValue(a2, @"consoleLevelDefaultsDomain");
  }
  else {
    CFTypeRef v36 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"consoleLevelDefaultsKey")) {
    unint64_t v41 = (unint64_t)CFDictionaryGetValue(a2, @"consoleLevelDefaultsKey");
  }
  else {
    unint64_t v41 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"logFileLevelDefaultsDomain")) {
    CFTypeRef v35 = CFDictionaryGetValue(a2, @"logFileLevelDefaultsDomain");
  }
  else {
    CFTypeRef v35 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"logFileLevelDefaultsKey")) {
    unint64_t v39 = (unint64_t)CFDictionaryGetValue(a2, @"logFileLevelDefaultsKey");
  }
  else {
    unint64_t v39 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"enableNewlines")) {
    CFBooleanRef v37 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"enableNewlines");
  }
  else {
    CFBooleanRef v37 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"createFileLogFormatBlock")) {
    uint64_t v8 = CFDictionaryGetValue(a2, @"createFileLogFormatBlock");
  }
  else {
    uint64_t v8 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"createConsoleLogFormatBlock")) {
    int v9 = CFDictionaryGetValue(a2, @"createConsoleLogFormatBlock");
  }
  else {
    int v9 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"didCreateNewFileBlock")) {
    aBlock = (void *)CFDictionaryGetValue(a2, @"didCreateNewFileBlock");
  }
  else {
    aBlock = 0;
  }
  if (CFDictionaryContainsKey(a2, @"willLogToConsoleBlock")) {
    int v10 = CFDictionaryGetValue(a2, @"willLogToConsoleBlock");
  }
  else {
    int v10 = 0;
  }
  if (CFDictionaryContainsKey(a2, @"willLogToFileBlock"))
  {
    int v11 = CFDictionaryGetValue(a2, @"willLogToFileBlock");
    if (v8) {
      goto LABEL_62;
    }
  }
  else
  {
    int v11 = 0;
    if (v8) {
      goto LABEL_62;
    }
  }
  if (CFDictionaryContainsKey(a2, @"createLogFormatBlock"))
  {
    uint64_t v8 = CFDictionaryGetValue(a2, @"createLogFormatBlock");
LABEL_62:
    if (v9) {
      goto LABEL_68;
    }
    goto LABEL_63;
  }
  uint64_t v8 = 0;
  if (v9) {
    goto LABEL_68;
  }
LABEL_63:
  if (CFDictionaryContainsKey(a2, @"createLogFormatBlock")) {
    int v9 = CFDictionaryGetValue(a2, @"createLogFormatBlock");
  }
  else {
    int v9 = 0;
  }
LABEL_68:
  uint64_t valuePtr = 10485760;
  if (v4 && !CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr)) {
    DACPLoggingAddCustomLogConfiguration_cold_10();
  }
  int v48 = -1;
  if (v5 && !CFNumberGetValue(v5, kCFNumberSInt32Type, &v48)) {
    DACPLoggingAddCustomLogConfiguration_cold_9();
  }
  int v47 = 5;
  if (v6 && !CFNumberGetValue(v6, kCFNumberSInt32Type, &v47)) {
    DACPLoggingAddCustomLogConfiguration_cold_8();
  }
  int v46 = -1;
  if (v7 && !CFNumberGetValue(v7, kCFNumberSInt32Type, &v46)) {
    DACPLoggingAddCustomLogConfiguration_cold_7();
  }
  if (valuePtr <= -3) {
    DACPLoggingAddCustomLogConfiguration_cold_3();
  }
  if (v48 <= -3) {
    DACPLoggingAddCustomLogConfiguration_cold_4();
  }
  if (v47 <= -3) {
    DACPLoggingAddCustomLogConfiguration_cold_5();
  }
  if (v46 <= -3) {
    DACPLoggingAddCustomLogConfiguration_cold_6();
  }
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    unint64_t v13 = (unint64_t)DefaultSettings;
    *((void *)DefaultSettings + 1_Block_object_dispose(&STACK[0x3F0], 8) = 0;
    *((void *)DefaultSettings + 1) = CFArrayCreateCopy(0, a1);
    if (cf) {
      DefaultLogFileName = (void *)CFRetain(cf);
    }
    else {
      DefaultLogFileName = (void *)_createDefaultLogFileName();
    }
    *(void *)(v13 + 16) = DefaultLogFileName;
    if (Value) {
      BOOL v16 = Value;
    }
    else {
      BOOL v16 = @"/var/mobile/Library/Logs/CrashReporter/Reminders";
    }
    CFTypeRef v17 = CFRetain(v16);
    uint64_t v18 = valuePtr;
    *(void *)(v13 + 24) = v17;
    *(void *)(v13 + 32) = v18;
    int v19 = v47;
    *(_DWORD *)(v13 + 40) = v48;
    *(_DWORD *)(v13 + 44) = v19;
    *(_DWORD *)(v13 + 4_Block_object_dispose(&STACK[0x3F0], 8) = v46;
    CFTypeRef v20 = v36;
    if (v36) {
      CFTypeRef v20 = CFRetain(v36);
    }
    *(void *)(v13 + 104) = v20;
    if (v41) {
      CFTypeRef v21 = CFRetain((CFTypeRef)v41);
    }
    else {
      CFTypeRef v21 = 0;
    }
    *(void *)(v13 + 112) = v21;
    CFTypeRef v22 = v35;
    if (v35) {
      CFTypeRef v22 = CFRetain(v35);
    }
    *(void *)(v13 + 120) = v22;
    if (v39) {
      CFTypeRef v23 = CFRetain((CFTypeRef)v39);
    }
    else {
      CFTypeRef v23 = 0;
    }
    *(void *)(v13 + 12_Block_object_dispose(&STACK[0x3F0], 8) = v23;
    if (v8) {
      v24 = _Block_copy(v8);
    }
    else {
      v24 = 0;
    }
    *(void *)(v13 + 64) = v24;
    if (v9) {
      uint64_t v25 = _Block_copy(v9);
    }
    else {
      uint64_t v25 = 0;
    }
    *(void *)(v13 + 72) = v25;
    uint64_t v26 = aBlock;
    if (aBlock) {
      uint64_t v26 = _Block_copy(aBlock);
    }
    *(void *)(v13 + 80) = v26;
    if (v10) {
      v27 = _Block_copy(v10);
    }
    else {
      v27 = 0;
    }
    *(void *)(v13 + 8_Block_object_dispose(&STACK[0x3F0], 8) = v27;
    if (v11) {
      uint64_t v28 = _Block_copy(v11);
    }
    else {
      uint64_t v28 = 0;
    }
    *(void *)(v13 + 96) = v28;
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean)) {
        int v29 = 2;
      }
      else {
        int v29 = 1;
      }
    }
    else
    {
      int v29 = 0;
    }
    *(_DWORD *)(v13 + 144) = v29;
    if (v42)
    {
      if (CFBooleanGetValue(v42)) {
        int v30 = 2;
      }
      else {
        int v30 = 1;
      }
    }
    else
    {
      int v30 = 0;
    }
    *(_DWORD *)(v13 + 14_Block_object_dispose(&STACK[0x3F0], 8) = v30;
    if (v37)
    {
      if (CFBooleanGetValue(v37)) {
        int v31 = 2;
      }
      else {
        int v31 = 1;
      }
    }
    else
    {
      int v31 = 0;
    }
    *(_DWORD *)(v13 + 152) = v31;
    uint64_t v32 = (unint64_t *)&_logFileSettings;
    for (i = (atomic_ullong *)atomic_load_explicit(&_logFileSettings, memory_order_acquire);
          i;
          i = (atomic_ullong *)atomic_load_explicit(i, memory_order_acquire))
    {
      uint64_t v32 = (unint64_t *)i;
    }
    atomic_store(v13, v32);
    if (v41 | v39 && _startObservingDefaultChanges_once != -1) {
      dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_101);
    }
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_112);
    }
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_0);
    if (_configurationQueue_once != -1) {
      dispatch_once(&_configurationQueue_once, &__block_literal_global_115);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __DACPLoggingAddCustomLogConfiguration_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v13;
    dispatch_sync((dispatch_queue_t)_configurationQueue_queue, block);
  }
  else
  {
    uint64_t v15 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8854000, v15, OS_LOG_TYPE_ERROR, "Could not create a new log file setting.", buf, 2u);
    }
  }
}

char *_createDefaultSettings()
{
  v0 = (char *)malloc_type_calloc(0xA0uLL, 1uLL, 0x7F442D01uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    *((void *)v0 + 4) = 10485760;
    *(_OWORD *)(v0 + 40) = xmmword_1C8876B30;
    *((_DWORD *)v0 + 14) = -3;
    *((void *)v0 + 1_Block_object_dispose(&STACK[0x3F0], 8) = 0x100000002;
    *((_DWORD *)v0 + 3_Block_object_dispose(&STACK[0x3F0], 8) = 2;
    *((void *)v0 + 17) = malloc_type_calloc(0x10uLL, 1uLL, 0x91B4318FuLL);
  }
  return v1;
}

CFStringRef _createDefaultLogFileName()
{
  v0 = getprogname();
  if (v0)
  {
    uint64_t v1 = (const UInt8 *)v0;
    size_t v2 = strlen(v0);
    return CFStringCreateWithBytes(0, v1, v2, 0x8000100u, 0);
  }
  else
  {
    uint64_t v4 = getpid();
    return CFStringCreateWithFormat(0, 0, @"pid_%d", v4);
  }
}

void _recomputeQueueRecomputeMaxAcceptedLevel()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t explicit = (atomic_ullong *)atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  if (explicit)
  {
    signed int v1 = -1;
    do
    {
      signed int v2 = _maxLogFileLevel((unint64_t)explicit);
      if (v2 <= v1) {
        signed int v3 = v1;
      }
      else {
        signed int v3 = v2;
      }
      signed int v4 = _maxConsoleLevel((unint64_t)explicit);
      if (v4 <= v3) {
        signed int v1 = v3;
      }
      else {
        signed int v1 = v4;
      }
      unint64_t explicit = (atomic_ullong *)atomic_load_explicit(explicit, memory_order_acquire);
    }
    while (explicit);
  }
  else
  {
    signed int v1 = -1;
  }
  atomic_store(v1, &_DACPLoggingMaxAcceptedLevel);
  CFNumberRef v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v1;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_INFO, "Recomputed max accepted logging level. New max: %d", (uint8_t *)v6, 8u);
  }
}

void __DACPLoggingAddCustomLogConfiguration_block_invoke_2(uint64_t a1)
{
}

void _configurationQueueRereadDefaultsForSetting(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  signed int v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 8);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_INFO, "Rereading configuration for %@", (uint8_t *)&v11, 0xCu);
  }
  CFStringRef explicit = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 104), memory_order_acquire);
  CFStringRef v5 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 112), memory_order_acquire);
  CFStringRef v6 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 120), memory_order_acquire);
  CFStringRef v7 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 128), memory_order_acquire);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_10;
    }
    unsigned int DefaultsValue = _configurationQueueReadDefaultsValue(v6, v7);
    goto LABEL_8;
  }
  unsigned int v8 = _configurationQueueReadDefaultsValue(explicit, v5);
  unsigned int v9 = v8;
  if (v7)
  {
    unsigned int DefaultsValue = _configurationQueueReadDefaultsValue(v6, v7);
    atomic_store(v9, (unsigned int *)(a1 + 52));
LABEL_8:
    atomic_store(DefaultsValue, (unsigned int *)(a1 + 56));
    goto LABEL_10;
  }
  atomic_store(v8, (unsigned int *)(a1 + 52));
LABEL_10:
  if (_recomputeQueue_onceToken != -1) {
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_112);
  }
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_118);
}

BOOL DACPLoggingFlush(dispatch_time_t timeout)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  if (_workGroup_once != -1) {
    dispatch_once(&_workGroup_once, &__block_literal_global_83);
  }
  return dispatch_group_wait((dispatch_group_t)_workGroup_group, timeout) == 0;
}

void DACPLoggingSetCustomMaxConsoleLevel(const void *a1, unsigned int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  if (atomic_exchange_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 44), a2, memory_order_release) != a2)
  {
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_112);
    }
    signed int v4 = _recomputeQueue_queue;
    dispatch_sync(v4, &__block_literal_global_120);
  }
}

uint64_t DACPLoggingCustomMaxConsoleLevel(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  unint64_t v2 = _settingsForFacility(a1);

  return _maxConsoleLevel(v2);
}

uint64_t _maxConsoleLevel(unint64_t a1)
{
  while (1)
  {
    uint64_t explicit = atomic_load_explicit((atomic_uint *volatile)(a1 + 52), memory_order_acquire);
    if (atomic_load_explicit((atomic_uint *volatile)(a1 + 52), memory_order_acquire) != -3) {
      break;
    }
    uint64_t explicit = atomic_load_explicit((atomic_uint *volatile)(a1 + 44), memory_order_acquire);
    if (explicit != -2) {
      break;
    }
    unint64_t v2 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
    BOOL v3 = a1 == v2;
    a1 = v2;
    if (v3) {
      _maxConsoleLevel_cold_1();
    }
  }
  return explicit;
}

void DACPLoggingSetCustomMaxLogFileLevel(const void *a1, unsigned int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  if (atomic_exchange_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 48), a2, memory_order_release) != a2)
  {
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_112);
    }
    signed int v4 = _recomputeQueue_queue;
    dispatch_sync(v4, &__block_literal_global_122);
  }
}

uint64_t DACPLoggingCustomMaxLogFileLevel(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  unint64_t v2 = _settingsForFacility(a1);

  return _maxLogFileLevel(v2);
}

void DACPLoggingSetCustomCreateFileLogFormatBlock(const void *a1, const void *a2)
{
}

void _setCustomCreateLogFormatBlock(const void *a1, const void *a2, int a3, int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_68);
  }
  unint64_t v8 = _settingsForFacility(a1);
  if (a3)
  {
    unsigned int v9 = a2 ? _Block_copy(a2) : 0;
    int v10 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v8 + 64), (unint64_t)v9, memory_order_release);
    int v11 = v8 + 157;
    LOBYTE(v11) = atomic_load_explicit((atomic_uchar *volatile)(v8 + 157), memory_order_acquire);
    if (v10)
    {
      if (!v11)
      {
        CFRelease(v10);
        if (!a4) {
          return;
        }
        goto LABEL_12;
      }
      uint64_t v12 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(v8 + 8), memory_order_acquire);
        int v19 = 138412290;
        unint64_t v20 = explicit;
        _os_log_impl(&dword_1C8854000, v12, OS_LOG_TYPE_DEFAULT, "Leaking old createFileLogFormatBlock because it was set after logging has begun for facliities %@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  if (!a4) {
    return;
  }
LABEL_12:
  if (a2) {
    uint64_t v14 = _Block_copy(a2);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v8 + 72), (unint64_t)v14, memory_order_release);
  int v16 = v8 + 157;
  LOBYTE(v16) = atomic_load_explicit((atomic_uchar *volatile)(v8 + 157), memory_order_acquire);
  if (v15)
  {
    if (v16)
    {
      CFTypeRef v17 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v18 = atomic_load_explicit((atomic_ullong *volatile)(v8 + 8), memory_order_acquire);
        int v19 = 138412290;
        unint64_t v20 = v18;
        _os_log_impl(&dword_1C8854000, v17, OS_LOG_TYPE_DEFAULT, "Leaking old createConoleLogFormatBlock because it was set after logging has begun for facliities %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      CFRelease(v15);
    }
  }
}

void DACPLoggingSetCustomCreateConsoleLogFormatBlock(const void *a1, const void *a2)
{
}

uint64_t ___init_block_invoke()
{
  _processName = (uint64_t)_createDefaultLogFileName();
  getpid();
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    unint64_t v1 = (unint64_t)DefaultSettings;
    *((void *)DefaultSettings + 2) = CFRetain((CFTypeRef)_processName);
    *(void *)(v1 + 24) = CFRetain(@"/var/mobile/Library/Logs/CrashReporter/Reminders");
    atomic_store(v1, (unint64_t *)&_logFileSettings);
  }
  else
  {
    unint64_t v2 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)signed int v4 = 0;
      _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_ERROR, "Cannot allocate global log settings.", v4, 2u);
    }
  }
  atexit((void (*)(void))_flushAtExit);
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_115);
  }
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_71);
  return _rereadObfuscationPreferences();
}

BOOL _flushAtExit()
{
  dispatch_time_t v0 = dispatch_time(0, 5000000000);

  return DACPLoggingFlush(v0);
}

void ___init_block_invoke_69()
{
}

uint64_t _rereadObfuscationPreferences()
{
  CFPreferencesAppSynchronize(@".GlobalPreferences");
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"DACPLoggingUnobfuscate", @".GlobalPreferences", &keyExistsAndHasValidFormat);
  return CPIsInternalDevice();
}

dispatch_queue_t ___callbackQueue_block_invoke()
{
  dispatch_time_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.DACPLogging.callbackQueue", v0);
  _callbackQueue_queue = (uint64_t)result;
  return result;
}

dispatch_group_t ___workGroup_block_invoke()
{
  dispatch_group_t result = dispatch_group_create();
  _workGroup_group = (uint64_t)result;
  return result;
}

void ___workQueue_block_invoke()
{
  dispatch_time_t v0 = dispatch_queue_create("com.apple.DACPLogging.workQueue", 0);
  _workQueue_queue = (uint64_t)v0;
  global_queue = dispatch_get_global_queue(-2, 0);

  dispatch_set_target_queue(v0, global_queue);
}

void _workQueueRefreshUUIDForWorkSettings(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [+[DACPLogShared shared] _getUUIDForFolder:a1[2] baseName:a1[1]];
  BOOL v3 = DALoggingwithCategory(0);
  signed int v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)uint64_t v12 = 138412290;
    *(void *)&v12[4] = v2;
    CFStringRef v5 = "Got UUID: %@";
    CFStringRef v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_INFO;
    uint32_t v8 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)uint64_t v12 = 0;
    CFStringRef v5 = "Could not get file UUID.";
    CFStringRef v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
    uint32_t v8 = 2;
  }
  _os_log_impl(&dword_1C8854000, v6, v7, v5, v12, v8);
LABEL_7:
  uint64_t v9 = objc_msgSend(v2, "copy", *(_OWORD *)v12);
  uint64_t v10 = a1[8];
  int v11 = *(const void **)(v10 + 8);
  if (v11)
  {
    CFRelease(v11);
    uint64_t v10 = a1[8];
  }
  *(void *)(v10 + _Block_object_dispose(&STACK[0x3F0], 8) = v9;
}

uint64_t ___startObservingDefaultChanges_block_invoke()
{
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_115);
  }
  notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_105);
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_115);
  }
  dispatch_time_t v0 = _configurationQueue_queue;

  return notify_register_dispatch("com.apple.AppSupport.loggingDefaultsChanged", (int *)&_startObservingDefaultChanges_token, v0, &__block_literal_global_108);
}

uint64_t _configurationQueueRereadAllDefaults()
{
  dispatch_time_t v0 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1C8854000, v0, OS_LOG_TYPE_INFO, "Re-reading all defaults values.", v3, 2u);
  }
  for (i = (atomic_ullong *)atomic_load_explicit(&_logFileSettings, memory_order_acquire);
        i;
        i = (atomic_ullong *)atomic_load_explicit(i, memory_order_acquire))
  {
    _configurationQueueRereadDefaultsForSetting((uint64_t)i);
  }
  if (_recomputeQueue_onceToken != -1) {
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_112);
  }
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_110);
  return _rereadObfuscationPreferences();
}

dispatch_queue_t ___recomputeQueue_block_invoke()
{
  dispatch_time_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.DACPLogging.recomputeQueue", v0);
  _recomputeQueue_queue = (uint64_t)result;
  return result;
}

dispatch_queue_t ___configurationQueue_block_invoke()
{
  dispatch_time_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.DACPLogging.configurationQueue", v0);
  _configurationQueue_queue = (uint64_t)result;
  return result;
}

uint64_t _configurationQueueReadDefaultsValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 4294967293;
  int valuePtr = -3;
  if (a1) {
    CFStringRef v5 = a1;
  }
  else {
    CFStringRef v5 = @".GlobalPreferences";
  }
  CFPreferencesAppSynchronize(v5);
  CFNumberRef v6 = (const __CFNumber *)CFPreferencesCopyAppValue(a2, v5);
  if (!v6) {
    return v4;
  }
  CFNumberRef v7 = v6;
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 == CFNumberGetTypeID())
  {
    if (!CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
    {
      uint64_t v9 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        *(_DWORD *)buf = 138412546;
        CFStringRef v17 = a1;
        __int16 v18 = 2112;
        CFStringRef v19 = a2;
        uint64_t v10 = "Defaults domain %@ and key %@ cannot be converted into an integer.";
LABEL_15:
        _os_log_impl(&dword_1C8854000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
      }
    }
  }
  else
  {
    CFTypeID v11 = CFGetTypeID(v7);
    if (v11 != CFStringGetTypeID())
    {
      uint64_t v9 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v17 = a1;
      __int16 v18 = 2112;
      CFStringRef v19 = a2;
      uint64_t v10 = "Defaults domain %@ and key %@ is not a number.";
      goto LABEL_15;
    }
    SInt32 IntValue = CFStringGetIntValue((CFStringRef)v7);
    if ((IntValue - 0x7FFFFFFF) <= 1)
    {
      uint64_t v9 = DALoggingwithCategory(0);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      goto LABEL_8;
    }
    int valuePtr = IntValue;
  }
LABEL_17:
  CFRelease(v7);
  uint64_t v4 = valuePtr;
  if (valuePtr <= -4)
  {
    uint64_t v13 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v17 = a1;
      __int16 v18 = 2112;
      CFStringRef v19 = a2;
      __int16 v20 = 1024;
      int v21 = valuePtr;
      _os_log_impl(&dword_1C8854000, v13, OS_LOG_TYPE_ERROR, "Rejecting domain %@ key %@ value of %d.", buf, 0x1Cu);
    }
    return 4294967293;
  }
  return v4;
}

void sub_1C88659F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C8865AA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t DACustomLogDirectory()
{
  if (DACustomLogDirectory_onceToken != -1) {
    dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
  }
  return DACustomLogDirectory_retval;
}

CFTypeRef __DACustomLogDirectory_block_invoke()
{
  CFTypeRef result = CFRetain(@"/var/mobile/Library/Logs/CrashReporter/Reminders");
  DACustomLogDirectory_retval = (uint64_t)result;
  return result;
}

void setDALogLevel(unsigned int a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_initLogging_logPred != -1) {
    dispatch_once(&_initLogging_logPred, &__block_literal_global_33);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = _allDALogFacilities();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        DACPLoggingSetCustomMaxLogFileLevel(*(const void **)(*((void *)&v7 + 1) + 8 * i), a1);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id _allDALogFacilities()
{
  if (_allDALogFacilities_pred != -1) {
    dispatch_once(&_allDALogFacilities_pred, &__block_literal_global_108_0);
  }
  dispatch_time_t v0 = (void *)_allDALogFacilities__sAllDAFacilities;

  return v0;
}

void setDALogOutputLevel(unsigned int a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_initLogging_logPred != -1) {
    dispatch_once(&_initLogging_logPred, &__block_literal_global_33);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = _allDALogFacilities();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        DACPLoggingSetCustomMaxConsoleLevel(*(const void **)(*((void *)&v7 + 1) + 8 * i), a1);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t getDALogLevel()
{
  if (_initLogging_logPred != -1) {
    dispatch_once(&_initLogging_logPred, &__block_literal_global_33);
  }

  return DACPLoggingCustomMaxLogFileLevel(@"DA");
}

uint64_t getDAOutputLevel()
{
  if (_initLogging_logPred != -1) {
    dispatch_once(&_initLogging_logPred, &__block_literal_global_33);
  }

  return DACPLoggingCustomMaxConsoleLevel(@"DA");
}

BOOL shouldDALogAtLevel()
{
  return (int)getDALogLevel() > 5;
}

uint64_t DAShouldLogPassword()
{
  if ((DAShouldLogPassword__haveCheckedShouldLogPassword & 1) == 0)
  {
    DAShouldLogPassword__haveCheckedShouldLogPassword = 1;
    dispatch_time_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    DAShouldLogPassword__shouldLogPassword = [v0 BOOLForKey:@"DAShouldLogPassword"];
  }
  return DAShouldLogPassword__shouldLogPassword;
}

uint64_t __DALoggingwithCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.remindd.dataaccess", "DA");
  unint64_t v1 = (void *)DALoggingwithCategory_log[0];
  DALoggingwithCategory_log[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.remindd.dataaccess", "EAS");
  uint64_t v3 = (void *)qword_1EBC69248;
  qword_1EBC69248 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.remindd.dataaccess", "CalDAV");
  uint64_t v5 = (void *)qword_1EBC69250;
  qword_1EBC69250 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.remindd.dataaccess", "LDAP");
  long long v7 = (void *)qword_1EBC69258;
  qword_1EBC69258 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.remindd.dataaccess", "SubCal");
  long long v9 = (void *)qword_1EBC69260;
  qword_1EBC69260 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.remindd.dataaccess", "CardDAV");
  CFTypeID v11 = (void *)qword_1EBC69268;
  qword_1EBC69268 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.remindd.dataaccess", "IMAPNotes");
  uint64_t v13 = (void *)qword_1EBC69270;
  qword_1EBC69270 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.remindd.dataaccess", "CoreDAV");
  uint64_t v15 = (void *)qword_1EBC69278;
  qword_1EBC69278 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.remindd.dataaccess", "PC");
  CFStringRef v17 = (void *)qword_1EBC69280;
  qword_1EBC69280 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.remindd.dataaccess", "Accounts");
  CFStringRef v19 = (void *)qword_1EBC69288;
  qword_1EBC69288 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.remindd.dataaccess", "DAREM");
  int v21 = (void *)qword_1EBC69290;
  qword_1EBC69290 = (uint64_t)v20;

  qword_1EBC69298 = (uint64_t)os_log_create("com.apple.remindd.dataaccess", "General");

  return MEMORY[0x1F41817F8]();
}

uint64_t DAGreenTeaLogger()
{
  if (DAGreenTeaLogger_onceToken != -1) {
    dispatch_once(&DAGreenTeaLogger_onceToken, &__block_literal_global_26);
  }
  return DAGreenTeaLogger_greenTeaLogger;
}

uint64_t __DAGreenTeaLogger_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  DAGreenTeaLogger_greenTeaLogger = result;
  return result;
}

uint64_t DALogSimulateCrashReport(void *a1)
{
  id v5 = a1;
  if (!DALogSimulateCrashReport___CrashReportHandle)
  {
    unint64_t v1 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
    DALogSimulateCrashReport___CrashReportHandle = (uint64_t)v1;
    if (v1) {
      DALogSimulateCrashReport_DASimulateCrash = dlsym(v1, "SimulateCrash");
    }
  }
  os_log_t v2 = (void (*)(uint64_t, uint64_t, id))DALogSimulateCrashReport_DASimulateCrash;
  if (DALogSimulateCrashReport_DASimulateCrash)
  {
    uint64_t v3 = getpid();
    v2(v3, 464366555, v5);
  }

  return MEMORY[0x1F41817F8]();
}

void ___initLogging_block_invoke()
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  os_log_t v0 = _allDALogFacilities();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v32;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v32 != v3) {
          objc_enumerationMutation(v0);
        }
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * v4);
        if (([v5 isEqualToString:@"Accounts"] & 1) == 0)
        {
          CFBooleanRef v42 = v5;
          CFArrayRef v6 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
          v40[0] = @"logDirectory";
          if (DACustomLogDirectory_onceToken != -1) {
            dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
          }
          v41[0] = DACustomLogDirectory_retval;
          v41[1] = @"dataaccess";
          v40[1] = @"logName";
          v40[2] = @"consoleLevelDefaultsKey";
          v40[3] = @"logFileLevelDefaultsKey";
          v41[2] = @"DAOutputLevel";
          v41[3] = @"DALogLevel";
          DACPLoggingAddCustomLogConfiguration(v6, (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4]);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v0 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v2);
  }

  unint64_t v39 = @"Accounts";
  CFArrayRef v7 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v37[0] = @"logDirectory";
  if (DACustomLogDirectory_onceToken != -1) {
    dispatch_once(&DACustomLogDirectory_onceToken, &__block_literal_global_1);
  }
  v38[0] = DACustomLogDirectory_retval;
  v38[1] = @"DAAccountMigration";
  v37[1] = @"logName";
  v37[2] = @"consoleLevelDefaultsKey";
  v37[3] = @"logFileLevelDefaultsKey";
  v38[2] = @"DAOutputLevel";
  v38[3] = @"DALogLevel";
  DACPLoggingAddCustomLogConfiguration(v7, (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4]);
  os_log_t v8 = +[DABehaviorOptions DAManagedDefaultForKey:@"DALogLevel"];

  if (!v8 && +[DABehaviorOptions isAppleInternalInstall])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v9 = _allDALogFacilities();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          DACPLoggingSetCustomMaxLogFileLevel(*(const void **)(*((void *)&v27 + 1) + 8 * i), 7u);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v11);
    }
  }
  os_log_t v14 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v15 = [v14 processName];
  os_log_t v16 = (void *)_CPLog_to_os_log_type_block_invoke_sProcessName;
  _CPLog_to_os_log_type_block_invoke_sProcessName = v15;

  _CPLog_to_os_log_type_block_invoke_sPID = getpid();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  CFStringRef v17 = _allDALogFacilities();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(const void **)(*((void *)&v23 + 1) + 8 * j);
        DACPLoggingSetCustomCreateFileLogFormatBlock(v22, &__block_literal_global_55);
        DACPLoggingSetCustomCreateConsoleLogFormatBlock(v22, &__block_literal_global_91);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }
}

uint64_t ___initLogging_block_invoke_2(int a1, unsigned int a2, const __CFDate *a3, int a4, uint64_t a5, char *__s, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (__s)
  {
    os_log_t v16 = strrchr(__s, 47);
    if (v16) {
      CFStringRef v17 = v16 + 1;
    }
    else {
      CFStringRef v17 = 0;
    }
  }
  else
  {
    CFStringRef v17 = 0;
  }
  if (a2 > 7) {
    uint64_t v18 = @"Unknown";
  }
  else {
    uint64_t v18 = _CPLog_to_os_log_type_block_invoke_3_levelLabels[a2];
  }
  if (_logFormater_logPred != -1) {
    dispatch_once(&_logFormater_logPred, &__block_literal_global_99);
  }
  if (_logFormater___logFormatter)
  {
    uint64_t StringWithDate = (uint64_t)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDateFormatterRef)_logFormater___logFormatter, a3);
  }
  else
  {
    uint64_t StringWithDate = [(__CFDate *)a3 description];
  }
  uint64_t v20 = (const void *)StringWithDate;
  int explicit = atomic_load_explicit((atomic_uint *volatile)&_DACPLoggingMaxAcceptedLevel, memory_order_acquire);
  id v22 = [NSString alloc];
  if (explicit < 7)
  {
    uint64_t v24 = [v22 initWithFormat:@"%@|%@|%d|%p|%@|%@|%@", v20, _CPLog_to_os_log_type_block_invoke_sProcessName, _CPLog_to_os_log_type_block_invoke_sPID, a9, a5, v18, a10, v27, v28, v29];
  }
  else
  {
    if (v17) {
      long long v23 = v17;
    }
    else {
      long long v23 = __s;
    }
    uint64_t v24 = [v22 initWithFormat:@"%@|%@|%d|%p|%@|%@|%s|%s:%lu| %@", v20, _CPLog_to_os_log_type_block_invoke_sProcessName, _CPLog_to_os_log_type_block_invoke_sPID, a9, a5, v18, a7, v23, a8, a10];
  }
  uint64_t v25 = v24;
  if (v20) {
    CFRelease(v20);
  }

  return v25;
}

uint64_t ___initLogging_block_invoke_3(int a1, unsigned int a2, const __CFDate *a3, int a4, uint64_t a5, char *__s, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (__s)
  {
    os_log_t v16 = strrchr(__s, 47);
    if (v16) {
      CFStringRef v17 = v16 + 1;
    }
    else {
      CFStringRef v17 = 0;
    }
  }
  else
  {
    CFStringRef v17 = 0;
  }
  if (a2 > 7) {
    uint64_t v18 = @"Unknown";
  }
  else {
    uint64_t v18 = _CPLog_to_os_log_type_block_invoke_3_levelLabels[a2];
  }
  if (_logFormater_logPred != -1) {
    dispatch_once(&_logFormater_logPred, &__block_literal_global_99);
  }
  if (_logFormater___logFormatter)
  {
    uint64_t StringWithDate = (uint64_t)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDateFormatterRef)_logFormater___logFormatter, a3);
  }
  else
  {
    uint64_t StringWithDate = [(__CFDate *)a3 description];
  }
  uint64_t v20 = (const void *)StringWithDate;
  int explicit = atomic_load_explicit((atomic_uint *volatile)&_DACPLoggingMaxAcceptedLevel, memory_order_acquire);
  id v22 = [NSString alloc];
  if (explicit < 7)
  {
    uint64_t v24 = [v22 initWithFormat:@"%p|%@|%@|%@", a9, a5, v18, a10, v27, v28, v29];
  }
  else
  {
    if (v17) {
      long long v23 = v17;
    }
    else {
      long long v23 = __s;
    }
    uint64_t v24 = [v22 initWithFormat:@"%p|%@|%@|%s|%s:%lu| %@", a9, a5, v18, a7, v23, a8, a10];
  }
  uint64_t v25 = v24;
  if (v20) {
    CFRelease(v20);
  }

  return v25;
}

void ___logFormater_block_invoke()
{
  os_log_t v0 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFLocaleRef)[MEMORY[0x1E4F1CA20] currentLocale], kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  _logFormater___logFormatter = (uint64_t)v0;
  if (v0)
  {
    CFDateFormatterSetFormat(v0, @"yyyy-MM-dd HH:mm:ss.SSS");
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate.isa);
  }
}

uint64_t ___allDALogFacilities_block_invoke()
{
  _allDALogFacilities__sAllDAFacilities = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"EAS", @"CalDAV", @"LDAP", @"SubCal", @"DA", @"CardDAV", @"IMAP", @"CoreDAV", @"PC", @"EASPARSING", @"Accounts", @"DAREM", 0);

  return MEMORY[0x1F41817F8]();
}

id _fileOpsQueue()
{
  if (_fileOpsQueue_onceToken != -1) {
    dispatch_once(&_fileOpsQueue_onceToken, &__block_literal_global_143);
  }
  os_log_t v0 = (void *)_fileOpsQueue_queue;

  return v0;
}

void sub_1C88692A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

id _homeDirectoryPathComponentsForUID(uid_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getpwuid(a1);
  if (v2)
  {
    uint64_t v3 = realpath_DARWIN_EXTSN(v2->pw_dir, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [NSString stringWithUTF8String:v3];
      CFArrayRef v6 = [v5 pathComponents];

      free(v4);
      goto LABEL_8;
    }
  }
  else
  {
    CFArrayRef v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = a1;
      _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_ERROR, "Could not gather information for user %d. Not granting access to write logs.", (uint8_t *)v9, 8u);
    }
  }
  CFArrayRef v6 = 0;
LABEL_8:

  return v6;
}

void sub_1C8869C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C886A210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void ___fileOpsQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("fileOpsQueue", v2);
  uint64_t v1 = (void *)_fileOpsQueue_queue;
  _fileOpsQueue_queue = (uint64_t)v0;
}

uint64_t ___fileDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_fileDateFormatter_formatter;
  _fileDateFormatter_formatter = (uint64_t)v0;

  [(id)_fileDateFormatter_formatter setDateStyle:1];
  uint64_t v2 = (void *)_fileDateFormatter_formatter;

  return [v2 setDateFormat:@"yyyy_MM_dd_HH_mm_ssZZZ"];
}

uint64_t DAECalendarAvailabilityTypeAsString(unint64_t a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return *((void *)&off_1E6574638 + a1);
  }
}

void _maxLogFileLevel_cold_1()
{
  __assert_rtn("_maxLogFileLevel", "DACPLogging.m", 544, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_1()
{
  __assert_rtn("_maxLogFileSize", "DACPLogging.m", 400, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_2()
{
  __assert_rtn("_maxLogFileCount", "DACPLogging.m", 411, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_3()
{
  __assert_rtn("_wantsCompressedFiles", "DACPLogging.m", 460, "settings != globalSettings");
}

void _createWorkSettingsFromSettings_cold_4()
{
  __assert_rtn("_enableNewlines", "DACPLogging.m", 473, "settings != globalSettings");
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_1(const __CFString *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8854000, v2, OS_LOG_TYPE_ERROR, "Cannot encode string into UTF-8.", buf, 2u);
  }
  CFIndex Length = CFStringGetLength(a1);
  if (Length)
  {
    CFIndex v4 = Length;
    id v5 = (UniChar *)malloc_type_malloc(2 * Length, 0x937914B4uLL);
    if (v5)
    {
      CFArrayRef v6 = v5;
      v15.location = 0;
      v15.length = v4;
      CFStringGetCharacters(a1, v15, v5);
      Mutable = CFStringCreateMutable(0, 0);
      if (Mutable)
      {
        os_log_t v8 = Mutable;
        CFStringAppend(Mutable, @"UTF-16 Bytes: ");
        if (v4 >= 1)
        {
          long long v9 = v6;
          do
          {
            unsigned int v10 = *v9++;
            CFStringAppendFormat(v8, 0, @"%04x ", v10);
            --v4;
          }
          while (v4);
        }
        uint64_t v11 = DALoggingwithCategory(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v8;
          _os_log_impl(&dword_1C8854000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        CFRelease(v8);
      }
      free(v6);
    }
  }
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_2()
{
  id v0 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1C8854000, v0, OS_LOG_TYPE_ERROR, "Could not allocate buffer for logging.", v1, 2u);
  }
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_1()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_2()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_3()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1046, "maxLogFileSize >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_4()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1047, "maxLogFileCount >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_5()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1048, "maxConsoleLevel >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_6()
{
  __assert_rtn("DACPLoggingAddCustomLogConfiguration", "DACPLogging.m", 1049, "maxLogFileLevel >= -2");
}

void DACPLoggingAddCustomLogConfiguration_cold_7()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_8()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_9()
{
}

void DACPLoggingAddCustomLogConfiguration_cold_10()
{
}

void _maxConsoleLevel_cold_1()
{
  __assert_rtn("_maxConsoleLevel", "DACPLogging.m", 511, "settings != globalSettings");
}

void DALoggingwithCategory_cold_1()
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t CPFileCompressionZDeflate()
{
  return MEMORY[0x1F4109300]();
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x1F4109330]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return MEMORY[0x1F40D8FE8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1F40CC030](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CC830](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x1F40CD848]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1F40CD8D8]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}