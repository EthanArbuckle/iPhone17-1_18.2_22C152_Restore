@interface SCDynamicStoreCreateInternal
@end

@implementation SCDynamicStoreCreateInternal

void ____SCDynamicStoreCreateInternal_block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CFSetAddValue((CFMutableSetRef)_sc_store_sessions, *(const void **)(a1 + 40));
  CFIndex Count = CFSetGetCount((CFSetRef)_sc_store_sessions);
  if (Count > _sc_store_max && _sc_store_max >= 1)
  {
    CFIndex v4 = Count;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFSetApplyFunction((CFSetRef)_sc_store_sessions, (CFSetApplierFunction)addSessionReference, Mutable);
    v6 = __log_SCDynamicStore_log;
    if (!__log_SCDynamicStore_log)
    {
      v6 = os_log_create("com.apple.SystemConfiguration", "SCDynamicStore");
      __log_SCDynamicStore_log = (uint64_t)v6;
    }
    uint64_t v7 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v6, (os_log_type_t)v7))
    {
      _os_log_pack_size();
      v8 = (char *)v13 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      uint64_t v9 = _os_log_pack_fill();
      v10 = "now ";
      uint64_t v11 = _sc_store_max;
      if (v4 == 50) {
        v10 = "";
      }
      *(_DWORD *)uint64_t v9 = 136315394;
      *(void *)(v9 + 4) = v10;
      *(_WORD *)(v9 + 12) = 2048;
      *(void *)(v9 + 14) = v11;
      __SC_log_send(3, (uint64_t)v6, v7, v8);
    }
    CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)logSessionReference, 0);
    CFRelease(Mutable);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    if (_sc_store_max >= 5000) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 2 * _sc_store_max;
    }
    _sc_store_max = v12;
  }
}

@end