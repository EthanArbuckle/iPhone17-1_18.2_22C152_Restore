@interface IOKit
@end

@implementation IOKit

void ____wait_for_IOKit_to_quiesce_block_invoke()
{
  values[1] = *(void **)MEMORY[0x1E4F143B8];
  qword_1E91CA1E0 = (uint64_t)"Waiting for IOKit to quiesce (or timeout)";
  SCDynamicStoreRef v0 = SCDynamicStoreCreate(0, @"SCNetworkInterfaceCopyAll", 0, 0);
  if (!v0)
  {
    qword_1E91CA1E0 = 0;
    return;
  }
  v1 = v0;
  values[0] = (void *)SCDynamicStoreKeyCreate(0, @"%@InterfaceNamer", @"Plugin:");
  CFArrayRef v2 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x1E4F1D510]);
  int v3 = SCDynamicStoreSetNotificationKeys(v1, v2, 0);
  CFRelease(v2);
  if (v3)
  {
    while (1)
    {
      CFPropertyListRef v4 = SCDynamicStoreCopyValue(v1, (CFStringRef)values[0]);
      if (v4)
      {
        v5 = v4;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v5) == TypeID
          && (CFDictionaryContainsKey((CFDictionaryRef)v5, @"*QUIET*")
           || CFDictionaryContainsKey((CFDictionaryRef)v5, @"*COMPLETE*")
           || CFDictionaryContainsKey((CFDictionaryRef)v5, @"*TIMEOUT*")))
        {
          CFRelease(v5);
          goto LABEL_18;
        }
        CFRelease(v5);
      }
      if (!SCDynamicStoreNotifyWait((mach_port_context_t)v1)) {
        break;
      }
      CFArrayRef v7 = SCDynamicStoreCopyNotifiedKeys(v1);
      if (v7) {
        CFRelease(v7);
      }
    }
    v8 = __log_SCNetworkConfiguration();
    uint64_t v9 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v8, (os_log_type_t)v9)) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v8 = __log_SCNetworkConfiguration();
  uint64_t v9 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v8, (os_log_type_t)v9))
  {
LABEL_16:
    uint64_t v10 = _os_log_pack_size();
    v18 = (char *)values - ((MEMORY[0x1F4188790](v10, v11, v12, v13, v14, v15, v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v19 = _os_log_pack_fill();
    int v20 = SCError();
    v21 = SCErrorString(v20);
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = v21;
    __SC_log_send(5, (uint64_t)v8, v9, v18);
  }
LABEL_18:
  qword_1E91CA1E0 = 0;
  if (values[0]) {
    CFRelease(values[0]);
  }
  CFRelease(v1);
}

@end