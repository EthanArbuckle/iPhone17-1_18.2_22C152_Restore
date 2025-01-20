@interface SCPreferencesUpdateLockedState
@end

@implementation SCPreferencesUpdateLockedState

void ____SCPreferencesUpdateLockedState_block_invoke_41(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    CFStringRef v2 = CFCopyDescription(*(CFTypeRef *)(a1 + 32));
    CFDictionarySetValue((CFMutableDictionaryRef)__SCPreferencesUpdateLockedState_lockedState, *(const void **)(a1 + 32), v2);
    CFRelease(v2);
  }
  else
  {
    v3 = (__CFDictionary *)__SCPreferencesUpdateLockedState_lockedState;
    v4 = *(const void **)(a1 + 32);
    CFDictionaryRemoveValue(v3, v4);
  }
}

_DWORD *____SCPreferencesUpdateLockedState_block_invoke_2()
{
  v32[1] = *(CFDataRef *)MEMORY[0x1E4F143B8];
  v32[0] = 0;
  if (!CFDictionaryGetCount((CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState)) {
    return 0;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFDictionaryApplyFunction((CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState, (CFDictionaryApplierFunction)appendLockedPreferences, Mutable);
  BOOL v1 = _SCSerialize(Mutable, v32, 0, 0);
  CFRelease(Mutable);
  int64_t v2 = 0;
  size_t v3 = 200;
  if (v1 && v32[0])
  {
    CFIndex Length = CFDataGetLength(v32[0]);
    size_t v3 = Length + 200;
    if ((unint64_t)(Length + 200) > 0x8000)
    {
      v5 = __log_SCPreferences_log;
      if (!__log_SCPreferences_log)
      {
        v5 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
        __log_SCPreferences_log = (uint64_t)v5;
      }
      uint64_t v6 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v5, (os_log_type_t)v6))
      {
        uint64_t v7 = _os_log_pack_size();
        v15 = (char *)v32 - ((MEMORY[0x1F4188790](v7, v8, v9, v10, v11, v12, v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
        __error();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 134218240;
        *(void *)(v16 + 4) = v3;
        *(_WORD *)(v16 + 12) = 2048;
        *(void *)(v16 + 14) = 0x8000;
        __SC_log_send(3, (uint64_t)v5, v6, v15);
      }
      goto LABEL_18;
    }
    int64_t v2 = Length;
  }
  v18 = malloc_type_calloc(1uLL, v3, 0x9468350CuLL);
  if (v18)
  {
    v17 = v18;
    _DWORD *v18 = 1;
    v18[1] = v2;
    __strlcpy_chk();
    if (v2 >= 1)
    {
      BytePtr = CFDataGetBytePtr(v32[0]);
      memcpy(v17 + 50, BytePtr, v2);
    }
    goto LABEL_19;
  }
  v20 = __log_SCPreferences_log;
  if (!__log_SCPreferences_log)
  {
    v20 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
    __log_SCPreferences_log = (uint64_t)v20;
  }
  uint64_t v21 = _SC_syslog_os_log_mapping(3);
  if (__SC_log_enabled(3, v20, (os_log_type_t)v21))
  {
    uint64_t v22 = _os_log_pack_size();
    v30 = (char *)v32 - ((MEMORY[0x1F4188790](v22, v23, v24, v25, v26, v27, v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    __SC_log_send(3, (uint64_t)v20, v21, v30);
  }
LABEL_18:
  v17 = 0;
LABEL_19:
  if (v32[0]) {
    CFRelease(v32[0]);
  }
  return v17;
}

uint64_t ____SCPreferencesUpdateLockedState_block_invoke()
{
  __SCPreferencesUpdateLockedState_lockedQueue = (uint64_t)dispatch_queue_create("SCPreferences locked state queue", 0);
  __SCPreferencesUpdateLockedState_lockedState = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  return os_state_add_handler();
}

@end