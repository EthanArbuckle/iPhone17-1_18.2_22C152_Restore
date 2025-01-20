uint64_t DHCPv6PDServiceGetTypeID()
{
  pthread_once(&stru_269C3F330, (void (*)(void))sub_2529ABA64);
  return qword_269C3F3A0;
}

uint64_t DHCPv6PDServiceCreate(const __CFString *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CFNumberRef v23 = 0;
  uint64_t v24 = 0;
  keys = 0;
  v30 = 0;
  uint64_t v31 = 0;
  CFStringRef v22 = 0;
  values = 0;
  CFStringRef v26 = 0;
  uint64_t v27 = 0;
  IPConfigurationServiceGetTypeID();
  v28[0] = 0;
  if (a2) {
    inet_ntop(30, a2, v28, 0x2Eu);
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315906;
    *(void *)(v8 + 4) = "DHCPv6PDServiceCreate";
    *(_WORD *)(v8 + 12) = 2112;
    *(void *)(v8 + 14) = a1;
    *(_WORD *)(v8 + 22) = 2080;
    *(void *)(v8 + 24) = v28;
    *(_WORD *)(v8 + 32) = 1024;
    *(_DWORD *)(v8 + 34) = a3;
    __SC_log_send();
  }
  uint64_t Instance = 0;
  if (a3 > 0x80 || !a1 || a4) {
    return Instance;
  }
  keys = (void *)*MEMORY[0x263F1BD70];
  values = @"DHCPv6PD";
  if (!a2)
  {
    CFIndex v10 = 1;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFStringRef v22 = sub_2529B26A0(a2);
  v30 = @"RequestedPrefix";
  CFStringRef v26 = v22;
  CFIndex v10 = 2;
  if (a3)
  {
LABEL_10:
    unsigned int valuePtr = a3;
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    CFNumberRef v23 = v11;
    *(&keys + v10) = @"RequestedPrefixLength";
    *(&values + v10++) = v11;
  }
LABEL_11:
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v10, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  sub_2529B23C4((const void **)&v22);
  sub_2529B23C4((const void **)&v23);
  keys = @"IPv6Entity";
  values = v14;
  CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, v12, v13);
  CFRelease(v14);
  uint64_t v16 = sub_2529AC7AC(a1, v15);
  CFRelease(v15);
  if (!v16) {
    goto LABEL_19;
  }
  pthread_once(&stru_269C3F330, (void (*)(void))sub_2529ABA64);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  uint64_t v24 = Instance;
  *(void *)(Instance + 16) = v16;
  dispatch_queue_t v17 = dispatch_queue_create("DHCPv6PDService", 0);
  *(void *)(Instance + 40) = v17;
  if (!v17)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315138;
      *(void *)(v19 + 4) = "DHCPv6PDServiceCreate";
      __SC_log_send();
    }
    goto LABEL_19;
  }
  SCDynamicStoreRef v18 = sub_2529AC500(Instance, @"DHCPv6PDService", 0, (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))sub_2529AB2BC, 0, (void *)(Instance + 32));
  *(void *)(Instance + 24) = v18;
  if (!v18)
  {
LABEL_19:
    sub_2529B23C4((const void **)&v24);
    return v24;
  }
  return Instance;
}

void sub_2529AB2BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_2529AC290(a3);
  if (v3)
  {
    v4 = (uint64_t *)v3;
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5)
    {
      CFPropertyListRef v6 = IPConfigurationServiceCopyInformation(v5);
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = sub_2529ADBA0(v4[2]);
      }
      global_queue = v4[7];
      if (!global_queue) {
        global_queue = dispatch_get_global_queue(0, 0);
      }
      uint64_t v9 = v4[6];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = sub_2529ABC0C;
      block[3] = &unk_2653853A0;
      block[4] = v9;
      block[5] = v6;
      BOOL v11 = v7;
      dispatch_async(global_queue, block);
    }
  }
}

void DHCPv6PDServiceSetQueueAndHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[7] = *MEMORY[0x263EF8340];
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_2529AB500;
    block[3] = &unk_265385338;
    block[5] = a1;
    void block[6] = a2;
    block[4] = a3;
    dispatch_sync(v4, block);
  }
  else
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 136315138;
      *(void *)(v5 + 4) = "DHCPv6PDServiceSetQueueAndHandler";
      __SC_log_send();
    }
  }
}

void sub_2529AB500(void *a1)
{
  uint64_t v2 = a1[5];
  v1 = a1[6];
  uint64_t v3 = (const void *)a1[4];
  v4 = *(const void **)(v2 + 48);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(v2 + 48) = 0;
  }
  if (v3) {
    *(void *)(v2 + 48) = _Block_copy(v3);
  }
  uint64_t v5 = *(NSObject **)(v2 + 56);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(v2 + 56) = 0;
  }
  if (v1)
  {
    dispatch_retain(v1);
    *(void *)(v2 + 56) = v1;
  }
}

void DHCPv6PDServiceResume(uint64_t a1)
{
  block[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2 && *(void *)(a1 + 16))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_2529AB6E8;
    block[3] = &unk_265385358;
    block[4] = a1;
    dispatch_async(v2, block);
  }
  else
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v3 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v3 = 136315138;
      *(void *)(v3 + 4) = "DHCPv6PDServiceResume";
      __SC_log_send();
    }
  }
}

void sub_2529AB6E8(uint64_t a1)
{
}

void sub_2529AB6F0(uint64_t a1)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 16;
  values[0] = (void *)IPConfigurationServiceGetNotificationKey(*(void *)(a1 + 16));
  CFArrayRef v3 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v2 + 8), v3, 0);
  CFRelease(v3);
  if (SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(v2 + 8), *(dispatch_queue_t *)(v2 + 24)))
  {
    if (sub_2529AD6CC(*(void *)v2)) {
      return;
    }
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_6:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v4 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v4 = 136315138;
      *(void *)(v4 + 4) = "DHCPv6PDServiceResumeSync";
      __SC_log_send();
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  global_queue = *(NSObject **)(a1 + 56);
  sub_2529B23C4((const void **)v2);
  BOOL v7 = *(const __SCDynamicStore **)(a1 + 24);
  if (v7)
  {
    SCDynamicStoreSetDispatchQueue(v7, 0);
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 24), 0, 0);
  }
  if (!global_queue) {
    global_queue = dispatch_get_global_queue(0, 0);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_2529ABD78;
  block[3] = &unk_2653853C8;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

__n128 DHCPv6PDServiceInfoGetPrefix(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t DHCPv6PDServiceInfoGetPrefixLength(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t DHCPv6PDServiceInfoGetPrefixValidLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t DHCPv6PDServiceInfoGetPrefixPreferredLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

const void *DHCPv6PDServiceInfoGetOptionData(uint64_t a1, unsigned int a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"DHCPv6");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFArrayGetTypeID();
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"Option_%d", a2);
  uint64_t v6 = CFDictionaryGetValue((CFDictionaryRef)Value, v5);
  CFRelease(v5);
  CFTypeID v7 = CFArrayGetTypeID();
  if (!v6) {
    return 0;
  }
  if (CFGetTypeID(v6) == v7) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t sub_2529ABA64()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_269C3F3A0 = result;
  return result;
}

void sub_2529ABA8C(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 32);
  if (v2)
  {
    CFArrayRef v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = sub_2529ABC00;
      block[3] = &unk_265385378;
      block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = *(atomic_uint **)(a1 + 32);
    }
    sub_2529AC2E4(v2);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v4 = *(const __SCDynamicStore **)(a1 + 24);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0);
    sub_2529B23C4((const void **)(a1 + 24));
  }
  sub_2529B23C4((const void **)(a1 + 16));
  CFStringRef v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    _Block_release(v5);
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v6 = *(NSObject **)(a1 + 56);
  if (v6)
  {
    dispatch_release(v6);
    *(void *)(a1 + 56) = 0;
  }
  CFTypeID v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    dispatch_release(v7);
    *(void *)(a1 + 40) = 0;
  }
}

__CFString *sub_2529ABB78(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<DHCPv6PDService %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"service = %@", a1[2]);
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

void *sub_2529ABC00(uint64_t a1)
{
  return sub_2529AC298(*(void **)(*(void *)(a1 + 32) + 32));
}

void sub_2529ABC0C(uint64_t a1)
{
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 40);
  if (v2)
  {
    uint64_t v13 = 0;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263F1BC58]);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefix");
        CFTypeID v6 = CFStringGetTypeID();
        if (v5)
        {
          if (CFGetTypeID(v5) == v6)
          {
            if (sub_2529B2484(v5, &v11))
            {
              int v14 = 0;
              CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixLength");
              if (sub_2529B25DC(v7, &v14))
              {
                LOBYTE(v12) = v14;
                CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixValidLifetime");
                if (sub_2529B25DC(v8, &v14))
                {
                  DWORD1(v12) = v14;
                  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixPreferredLifetime");
                  if (sub_2529B25DC(v9, &v14))
                  {
                    DWORD2(v12) = v14;
                    uint64_t v13 = *(void *)(a1 + 40);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  CFIndex v10 = *(const void **)(a1 + 40);
  if (v10) {
    CFRelease(v10);
  }
}

uint64_t sub_2529ABD78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t IPConfigurationForgetNetwork(const __CFString *a1, void *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  CFDictionaryRef v10;
  CFDataRef Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v14;
  uint64_t v15;
  char *v16;
  mach_port_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  mach_port_t sp[2];
  void *values;
  void *keys;
  long long v24;
  uint64_t v25;

  v25 = *MEMORY[0x263EF8340];
  *(void *)sp = 0;
  sub_2529AC444((uint64_t)"Library");
  if (!a1 || !a2)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    CFStringRef v9 = _os_log_pack_fill();
    *(_DWORD *)CFStringRef v9 = 136315138;
    *(void *)(v9 + 4) = "IPConfigurationForgetNetwork";
    goto LABEL_11;
  }
  uint64_t v4 = bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.network.IPConfiguration", &sp[1]);
  if (v4)
  {
    CFStringRef v5 = v4;
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    CFStringRef v7 = _os_log_pack_fill();
    CFStringRef v8 = mach_error_string(v5);
    *(_DWORD *)CFStringRef v7 = 136315138;
    *(void *)(v7 + 4) = v8;
    goto LABEL_11;
  }
  uint64_t v24 = 0uLL;
  sub_2529B23FC(a1, (UInt8 *)&v24, 16, 0);
  values = a2;
  keys = @"SSID";
  CFIndex v10 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  Data = CFPropertyListCreateData(0, v10, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFRelease(v10);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  int v14 = sub_2529B2044(sp[1], &v24, (uint64_t)BytePtr, Length, (int *)sp);
  CFRelease(Data);
  if (v14)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    CFDictionaryRef v15 = _os_log_pack_fill();
    uint64_t v16 = mach_error_string(v14);
    *(_DWORD *)CFDictionaryRef v15 = 136315394;
    *(void *)(v15 + 4) = &v24;
    *(_WORD *)(v15 + 12) = 2080;
    *(void *)(v15 + 14) = v16;
    goto LABEL_11;
  }
  dispatch_queue_t v17 = sp[0];
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (v17)
  {
    if (result)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      SCDynamicStoreRef v18 = _os_log_pack_fill();
      if (sp[0] <= 0x15) {
        uint64_t v19 = off_2653853E8[sp[0]];
      }
      else {
        uint64_t v19 = "<unknown>";
      }
      *(_DWORD *)SCDynamicStoreRef v18 = 136315394;
      *(void *)(v18 + 4) = &v24;
      *(_WORD *)(v18 + 12) = 2080;
      *(void *)(v18 + 14) = v19;
LABEL_11:
      __SC_log_send();
      return 0;
    }
  }
  else
  {
    if (result)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315138;
      *(void *)(v20 + 4) = &v24;
      __SC_log_send();
    }
    return 1;
  }
  return result;
}

uint64_t sub_2529AC280(uint64_t result)
{
  return result;
}

uint64_t sub_2529AC290(uint64_t a1)
{
  return *(void *)a1;
}

void *sub_2529AC298(void *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_2529AC2A0(uint64_t a1)
{
  uint64_t result = malloc_type_malloc(0x10uLL, 0x10C0040AE459949uLL);
  *(void *)uint64_t result = a1;
  result[2] = 1;
  return result;
}

void sub_2529AC2E4(atomic_uint *a1)
{
  int add_explicit = atomic_fetch_add_explicit(a1 + 2, 0xFFFFFFFF, memory_order_relaxed);
  if (add_explicit == 1)
  {
    free(a1);
  }
  else if (add_explicit <= 0)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }
    abort();
  }
}

void sub_2529AC444(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_2529AC4CC;
  block[3] = &unk_265385498;
  block[4] = a1;
  if (qword_26B22F520 != -1) {
    dispatch_once(&qword_26B22F520, block);
  }
}

uint64_t sub_2529AC4CC(uint64_t a1)
{
  os_log_t v1 = os_log_create("com.apple.IPConfiguration", *(const char **)(a1 + 32));

  return sub_2529B2750((uint64_t)v1);
}

SCDynamicStoreRef sub_2529AC500(uint64_t a1, const __CFString *a2, NSObject *a3, void (__cdecl *a4)(SCDynamicStoreRef, CFArrayRef, void *), uint64_t a5, void *a6)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  context.version = xmmword_2702DC238;
  *(_OWORD *)&context.retain = *(_OWORD *)off_2702DC248;
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))qword_2702DC258;
  long long v11 = sub_2529AC2A0(a1);
  context.info = v11;
  SCDynamicStoreRef v12 = SCDynamicStoreCreate(0, a2, a4, &context);
  SCDynamicStoreRef v16 = v12;
  if (!v12)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  if (a5 && !SCDynamicStoreSetDisconnectCallBack())
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!a3 || SCDynamicStoreSetDispatchQueue(v13, a3)) {
    goto LABEL_14;
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
LABEL_11:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)(v14 + 4) = a2;
    __SC_log_send();
  }
LABEL_12:
  sub_2529B23C4((const void **)&v16);
  if (v11)
  {
    sub_2529AC2E4(v11);
    long long v11 = 0;
  }
LABEL_14:
  *a6 = v11;
  return v16;
}

uint64_t sub_2529AC7AC(const __CFString *a1, const __CFDictionary *a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v52 = 0;
  pthread_once(&stru_26B22F510, (void (*)(void))sub_2529AF098);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  CFDictionaryRef v58 = 0;
  if (!a2)
  {
    int v7 = 1;
    goto LABEL_6;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(a2, @"NoPublish");
  *(void *)&long long v53 = Value;
  if (Value)
  {
    CFStringRef v5 = Value;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (CFGetTypeID(v5) != TypeID)
    {
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_52;
      }
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v25 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v25 = 138412290;
      *(void *)(v25 + 4) = @"NoPublish";
LABEL_51:
      __SC_log_send();
      goto LABEL_52;
    }
    int v7 = CFBooleanGetValue((CFBooleanRef)v5);
  }
  else
  {
    int v7 = 1;
  }
  CFDictionaryRef v15 = @"MTU";
  SCDynamicStoreRef v16 = CFDictionaryGetValue(a2, @"MTU");
  *((void *)&v53 + 1) = v16;
  if (v16)
  {
    dispatch_queue_t v17 = v16;
    CFTypeID v18 = CFNumberGetTypeID();
    if (CFGetTypeID(v17) != v18)
    {
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_52;
      }
      goto LABEL_50;
    }
  }
  CFDictionaryRef v15 = @"APNName";
  uint64_t v19 = CFDictionaryGetValue(a2, @"APNName");
  *(void *)&long long v54 = v19;
  if (v19)
  {
    v20 = v19;
    CFTypeID v21 = CFStringGetTypeID();
    if (CFGetTypeID(v20) != v21)
    {
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_52;
      }
      goto LABEL_50;
    }
  }
  CFDictionaryRef v15 = @"ClearState";
  CFStringRef v22 = CFDictionaryGetValue(a2, @"ClearState");
  *((void *)&v54 + 1) = v22;
  if (v22)
  {
    CFNumberRef v23 = v22;
    CFTypeID v24 = CFBooleanGetTypeID();
    if (CFGetTypeID(v23) != v24)
    {
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_52;
      }
LABEL_50:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v41 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v41 = 138412290;
      *(void *)(v41 + 4) = v15;
      goto LABEL_51;
    }
  }
  if (CFDictionaryContainsKey(a2, @"IPv4Entity"))
  {
    if (!sub_2529AD15C(a2, (const __CFDictionary **)&v55 + 1)) {
      goto LABEL_52;
    }
  }
  else
  {
    LOBYTE(v55) = 1;
    if (!sub_2529AD29C(a2, (const __CFDictionary **)&v55 + 1)) {
      goto LABEL_52;
    }
  }
LABEL_6:
  pthread_once(&stru_26B22F510, (void (*)(void))sub_2529AF098);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  CFStringRef v9 = (UInt8 *)(Instance + 16);
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 192) = 0u;
  *(_OWORD *)(Instance + 208) = 0u;
  uint64_t v52 = Instance;
  if (!Instance) {
    goto LABEL_52;
  }
  uint64_t v10 = Instance;
  *(void *)CFStringRef v9 = 0;
  *(void *)(Instance + 24) = 0;
  sub_2529B23FC(a1, v9, 16, 0);
  CFStringRef v11 = sub_2529B270C(0);
  *(void *)(v10 + 184) = v11;
  SCDynamicStoreRef v12 = (__CFDictionary *)*MEMORY[0x263EFFB40];
  v65 = @"MonitorPID";
  v66 = @"NoPublish";
  uint64_t v13 = (__CFDictionary *)v53;
  if (!(void)v53) {
    uint64_t v13 = v12;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  CFDictionaryRef v59 = v12;
  v60 = v13;
  if (*((void *)&v53 + 1))
  {
    *(void *)&long long v67 = @"MTU";
    *(void *)&long long v61 = *((void *)&v53 + 1);
    unsigned int v14 = 3;
  }
  else
  {
    unsigned int v14 = 2;
  }
  *(&v65 + v14) = @"ServiceID";
  *(&v59 + v14) = (CFDictionaryRef)v11;
  unsigned int v26 = v14 + 1;
  CFDictionaryRef v27 = (const __CFDictionary *)v54;
  if (*((void *)&v54 + 1)) {
    SCDynamicStoreRef v12 = (__CFDictionary *)*((void *)&v54 + 1);
  }
  *(&v65 + v26) = @"ClearState";
  *(&v59 + v26) = v12;
  unsigned int v28 = v14 + 2;
  if (v27)
  {
    *(&v65 + v28) = @"APNName";
    *(&v59 + v28) = v27;
    unsigned int v28 = v14 + 3;
  }
  int v29 = v55;
  if ((_BYTE)v55)
  {
    CFDictionaryRef v30 = (const __CFDictionary *)v56;
    if ((void)v56)
    {
      *(&v65 + v28) = @"PerformNUD";
      *(&v59 + v28++) = v30;
    }
    CFDictionaryRef v31 = (const __CFDictionary *)v57;
    if ((void)v57)
    {
      *(&v65 + v28) = @"EnableDAD";
      *(&v59 + v28++) = v31;
    }
    CFDictionaryRef v32 = (const __CFDictionary *)*((void *)&v57 + 1);
    if (*((void *)&v57 + 1))
    {
      *(&v65 + v28) = @"EnableCLAT46";
      *(&v59 + v28++) = v32;
    }
    CFDictionaryRef v33 = v58;
    if (v58)
    {
      *(&v65 + v28) = @"EnableDHCPv6";
      *(&v59 + v28++) = v33;
    }
    CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, v28, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryRef v35 = (const __CFDictionary *)*((void *)&v55 + 1);
    if (*((void *)&v55 + 1))
    {
      v36 = (const void *)*((void *)&v56 + 1);
      if (*((void *)&v56 + 1))
      {
        v37 = (const void *)*MEMORY[0x263F1BD80];
        if (!CFDictionaryContainsKey(*((CFDictionaryRef *)&v55 + 1), (const void *)*MEMORY[0x263F1BD80]))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v35);
          CFDictionarySetValue(MutableCopy, v37, v36);
LABEL_62:
          v44 = (__CFString **)MEMORY[0x263F1BC58];
          goto LABEL_63;
        }
      }
      v38 = (__CFDictionary *)CFRetain(v35);
    }
    else
    {
      keys = (void *)*MEMORY[0x263F1BD70];
      uint64_t v74 = 0;
      values = (void *)*MEMORY[0x263F1BE78];
      uint64_t v72 = 0;
      if (*((void *)&v56 + 1))
      {
        uint64_t v74 = *MEMORY[0x263F1BD80];
        uint64_t v72 = *((void *)&v56 + 1);
        CFIndex v40 = 2;
      }
      else
      {
        CFIndex v40 = 1;
      }
      v38 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v40, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    MutableCopy = v38;
    goto LABEL_62;
  }
  CFDictionaryRef v34 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, v28, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (*((void *)&v55 + 1)) {
    v39 = (__CFDictionary *)CFRetain(*((CFTypeRef *)&v55 + 1));
  }
  else {
    v39 = CFDictionaryCreate(0, MEMORY[0x263F1BD40], MEMORY[0x263F1BE48], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  MutableCopy = v39;
  v44 = (__CFString **)MEMORY[0x263F1BC50];
LABEL_63:
  v45 = *v44;
  v65 = @"__IPConfigurationServiceOptions";
  v66 = v45;
  CFDictionaryRef v59 = v34;
  v60 = MutableCopy;
  CFDictionaryRef v46 = CFDictionaryCreate(0, (const void **)&v65, (const void **)&v59, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(v34);
  CFRelease(MutableCopy);
  *(void *)(v10 + 208) = v46;
  *(unsigned char *)(v10 + 216) = v29;
  if (v7)
  {
    CFStringRef NetworkServiceEntity = CFStringCreateWithFormat(0, 0, @"Plugin:IPConfigurationService:%@", *(void *)(v10 + 184));
  }
  else
  {
    v48 = (CFStringRef *)MEMORY[0x263F1BC58];
    if (!v29) {
      v48 = (CFStringRef *)MEMORY[0x263F1BC50];
    }
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x263F1BC10], *(CFStringRef *)(v10 + 184), *v48);
  }
  *(_OWORD *)(v10 + 56) = 0u;
  *(void *)(v10 + 192) = NetworkServiceEntity;
  CFStringRef v49 = *(const __CFString **)(v10 + 184);
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  sub_2529B23FC(v49, (UInt8 *)(v10 + 56), 128, 0);
  v50 = dispatch_queue_create("IPConfigurationService", 0);
  *(void *)(v10 + 48) = v50;
  if (v50)
  {
    SCDynamicStoreRef v51 = sub_2529AC500(v10, @"IPConfigurationService", v50, (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))nullsub_1, (uint64_t)sub_2529AD50C, (void *)(v10 + 200));
    *(void *)(v10 + 40) = v51;
    if (v51) {
      return v10;
    }
    goto LABEL_52;
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    goto LABEL_51;
  }
LABEL_52:
  sub_2529B23C4((const void **)&v52);
  return v52;
}

uint64_t IPConfigurationServiceGetTypeID()
{
  return qword_26B22F528;
}

uint64_t sub_2529AD15C(const __CFDictionary *a1, const __CFDictionary **a2)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"IPv4Entity");
  if (!Value) {
    return 1;
  }
  CFDictionaryRef v4 = Value;
  if (sub_2529AE1E0(Value))
  {
    *a2 = v4;
    return 1;
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (result)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v6 + 4) = @"IPv4Entity";
    __SC_log_send();
    return 0;
  }
  return result;
}

uint64_t sub_2529AD29C(const __CFDictionary *a1, const __CFDictionary **a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t result = sub_2529AE8F0(a1, @"PerformNUD", a2 + 1);
  if (result)
  {
    uint64_t result = sub_2529AE8F0(a1, @"EnableDAD", a2 + 3);
    if (result)
    {
      uint64_t result = sub_2529AE8F0(a1, @"EnableCLAT46", a2 + 4);
      if (result)
      {
        uint64_t result = sub_2529AE8F0(a1, @"EnableDHCPv6", a2 + 5);
        if (result)
        {
          v11[0] = 0;
          v11[1] = 0;
          CFStringRef v5 = @"IPv6Entity";
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"IPv6Entity");
          if (Value)
          {
            CFDictionaryRef v7 = Value;
            if (!sub_2529AEA3C(Value))
            {
              sub_2529B275C();
              _SC_syslog_os_log_mapping();
              uint64_t result = __SC_log_enabled();
              if (!result) {
                return result;
              }
              _os_log_pack_size();
              MEMORY[0x270FA5388]();
              __error();
              goto LABEL_18;
            }
            *a2 = v7;
          }
          CFStringRef v5 = @"IPv6LinkLocalAddress";
          CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a1, @"IPv6LinkLocalAddress");
          if (!v8) {
            return 1;
          }
          CFStringRef v9 = v8;
          if (sub_2529B2484(v8, v11) && LOBYTE(v11[0]) == 254 && (BYTE1(v11[0]) & 0xC0) == 0x80)
          {
            a2[2] = (const __CFDictionary *)v9;
            return 1;
          }
          sub_2529B275C();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if (result)
          {
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
LABEL_18:
            uint64_t v10 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v10 = 138412290;
            *(void *)(v10 + 4) = v5;
            __SC_log_send();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2529AD50C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2529AC290(a2);
  if (result)
  {
    uint64_t v3 = result;
    if (*(_DWORD *)(result + 32))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(result + 208), @"__IPConfigurationServiceOptions");
      if (Value)
      {
        CFDictionaryRef v5 = Value;
        if (CFDictionaryContainsKey(Value, @"ClearState"))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
          CFDictionaryRemoveValue(MutableCopy, @"ClearState");
          CFDictionaryRef v7 = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(v3 + 208));
          CFDictionarySetValue(v7, @"__IPConfigurationServiceOptions", MutableCopy);
          CFRelease(MutableCopy);
          CFRelease(*(CFTypeRef *)(v3 + 208));
          *(void *)(v3 + 208) = v7;
        }
      }
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v8 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v8 = 136315138;
        *(void *)(v8 + 4) = v3 + 16;
        __SC_log_send();
      }
      return sub_2529AD8A4(v3, *(_DWORD *)(v3 + 32));
    }
    else
    {
      *(unsigned char *)(result + 217) = 1;
    }
  }
  return result;
}

uint64_t sub_2529AD6CC(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v7;
  void block[5];
  mach_port_t v9;
  mach_port_t sp;
  uint64_t v11;

  CFStringRef v11 = *MEMORY[0x263EF8340];
  sp = 0;
  CFDictionaryRef v2 = bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.network.IPConfiguration", &sp);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      CFDictionaryRef v4 = _os_log_pack_fill();
      CFDictionaryRef v5 = mach_error_string(v3);
      *(_DWORD *)CFDictionaryRef v4 = 136315138;
      *(void *)(v4 + 4) = v5;
      __SC_log_send();
    }
  }
  else if (!sub_2529AD8A4(a1, sp))
  {
    CFDictionaryRef v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_2529ADB7C;
    block[3] = &unk_265385508;
    block[4] = a1;
    CFStringRef v9 = sp;
    dispatch_sync(v7, block);
    return 1;
  }
  if (sp) {
    mach_port_deallocate(*MEMORY[0x263EF8960], sp);
  }
  return 0;
}

uint64_t sub_2529AD8A4(uint64_t a1, mach_port_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int v17 = 0;
  CFDataRef Data = CFPropertyListCreateData(0, *(CFPropertyListRef *)(a1 + 208), kCFPropertyListBinaryFormat_v1_0, 0, 0);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(Data);
  CFDictionaryRef v7 = (long long *)(a1 + 16);
  uint64_t v8 = (_OWORD *)(a1 + 56);
  mach_error_t v9 = sub_2529B18E4(a2, (long long *)(a1 + 16), (uint64_t)BytePtr, Length, (_OWORD *)(a1 + 56), &v17);
  if (v9)
  {
LABEL_2:
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v10 = _os_log_pack_fill();
      CFStringRef v11 = mach_error_string(v9);
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = v7;
      *(_WORD *)(v10 + 12) = 2080;
      *(void *)(v10 + 14) = v11;
LABEL_4:
      __SC_log_send();
    }
  }
  else
  {
    int v13 = 0;
    while (v17)
    {
      if (((v17 == 15) & ~v13) == 0)
      {
        sub_2529B275C();
        _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          break;
        }
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        if (v17 <= 0x15) {
          SCDynamicStoreRef v16 = off_265385570[v17];
        }
        else {
          SCDynamicStoreRef v16 = "<unknown>";
        }
        *(_DWORD *)uint64_t v15 = 136315394;
        *(void *)(v15 + 4) = v7;
        *(_WORD *)(v15 + 12) = 2080;
        *(void *)(v15 + 14) = v16;
        goto LABEL_4;
      }
      sub_2529B1AF8(a2, v7, (uint64_t)BytePtr, Length, (int *)&v17);
      mach_error_t v14 = sub_2529B18E4(a2, v7, (uint64_t)BytePtr, Length, v8, &v17);
      int v13 = 1;
      if (v14)
      {
        mach_error_t v9 = v14;
        goto LABEL_2;
      }
    }
  }
  CFRelease(Data);
  return v17;
}

uint64_t sub_2529ADB7C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(result + 40);
  if (*(unsigned char *)(v1 + 217)) {
    return sub_2529AD8A4(v1, *(_DWORD *)(result + 40));
  }
  return result;
}

BOOL sub_2529ADBA0(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 17;
  uint64_t v1 = *(NSObject **)(a1 + 48);
  if (v1 && *(_DWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = sub_2529ADC70;
    v4[3] = &unk_265385530;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync(v1, v4);
    BOOL v2 = *((_DWORD *)v6 + 6) == 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_2529ADC70(uint64_t a1)
{
  uint64_t result = sub_2529B21F8(*(_DWORD *)(*(void *)(a1 + 40) + 32), (long long *)(*(void *)(a1 + 40) + 16), (long long *)(*(void *)(a1 + 40) + 56), (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  if (result)
  {
    mach_error_t v3 = result;
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (result)
    {
      _os_log_pack_size();
      __error();
      uint64_t v4 = _os_log_pack_fill();
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = v5 + 16;
      uint64_t v7 = v5 + 56;
      int v8 = mach_error_string(v3);
      *(_DWORD *)uint64_t v4 = 136315650;
      *(void *)(v4 + 4) = v6;
      *(_WORD *)(v4 + 12) = 2080;
      *(void *)(v4 + 14) = v7;
      *(_WORD *)(v4 + 22) = 2080;
      *(void *)(v4 + 24) = v8;
      return __SC_log_send();
    }
  }
  return result;
}

const void *IPConfigurationServiceCreate(const __CFString *a1, const __CFDictionary *a2)
{
  v8[1] = *(const void **)MEMORY[0x263EF8340];
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v4 + 4) = "IPConfigurationServiceCreate";
    *(_WORD *)(v4 + 12) = 2112;
    *(void *)(v4 + 14) = a1;
    __SC_log_send();
  }
  uint64_t v5 = (const void *)sub_2529AC7AC(a1, a2);
  uint64_t v6 = v5;
  v8[0] = v5;
  if (v5 && !sub_2529AD6CC((uint64_t)v5))
  {
    sub_2529B23C4(v8);
    return v8[0];
  }
  return v6;
}

uint64_t IPConfigurationServiceGetNotificationKey(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

CFPropertyListRef IPConfigurationServiceCopyInformation(uint64_t a1)
{
  CFPropertyListRef v1 = SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(a1 + 40), *(CFStringRef *)(a1 + 192));
  uint64_t v4 = v1;
  if (v1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v1) != TypeID)
    {
      sub_2529B23C4(&v4);
      return v4;
    }
  }
  return v1;
}

uint64_t IPConfigurationServiceRefreshConfiguration(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int v9 = 0;
  uint64_t v1 = a1 + 16;
  uint64_t v2 = a1 + 56;
  uint64_t result = sub_2529B1E78(*(_DWORD *)(a1 + 32), (long long *)(a1 + 16), (long long *)(a1 + 56), &v9);
  if (result)
  {
    mach_error_t v4 = result;
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v5 = _os_log_pack_fill();
    uint64_t v6 = mach_error_string(v4);
    *(_DWORD *)uint64_t v5 = 136315650;
    *(void *)(v5 + 4) = v1;
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v5 + 14) = v2;
    *(_WORD *)(v5 + 22) = 2080;
    *(void *)(v5 + 24) = v6;
    return __SC_log_send();
  }
  if (v9)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (result)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v7 = _os_log_pack_fill();
      if (v9 <= 0x15) {
        int v8 = off_265385570[v9];
      }
      else {
        int v8 = "<unknown>";
      }
      *(_DWORD *)uint64_t v7 = 136315650;
      *(void *)(v7 + 4) = v1;
      *(_WORD *)(v7 + 12) = 2080;
      *(void *)(v7 + 14) = v2;
      *(_WORD *)(v7 + 22) = 2080;
      *(void *)(v7 + 24) = v8;
      return __SC_log_send();
    }
  }
  return result;
}

uint64_t sub_2529AE1E0(const __CFDictionary *a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  CFDictionaryRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD40]);
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE60]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE48]))
    {
      uint64_t v4 = *MEMORY[0x263F1BD48];
      SCDynamicStoreRef v16 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD48]);
      if (v16)
      {
        unsigned int v17 = v16;
        CFTypeID v18 = CFStringGetTypeID();
        if (CFGetTypeID(v17) == v18)
        {
          uint64_t v10 = 2;
          goto LABEL_29;
        }
        sub_2529B275C();
        _SC_syslog_os_log_mapping();
        uint64_t result = __SC_log_enabled();
        if (!result) {
          return result;
        }
LABEL_18:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t result = CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE58]);
      if (!result) {
        return result;
      }
    }
    uint64_t v10 = 1;
    goto LABEL_29;
  }
  uint64_t v20 = 0;
  v21[0] = 0;
  uint64_t v4 = *MEMORY[0x263F1BD38];
  uint64_t v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD38]);
  CFTypeID v6 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v6)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      return 0;
    }
    goto LABEL_18;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      return 0;
    }
    goto LABEL_18;
  }
  uint64_t v8 = Count;
  if (!sub_2529AE6C0(a1, (const void *)*MEMORY[0x263F1BD60], Count, &v20)
    || !sub_2529AE6C0(a1, (const void *)*MEMORY[0x263F1BD50], v8, v21))
  {
    return 0;
  }
  uint64_t v9 = 2;
  if (v20) {
    uint64_t v9 = 3;
  }
  if (v21[0]) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v4 = *MEMORY[0x263F1BD58];
  CFStringRef v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD58]);
  if (v11)
  {
    SCDynamicStoreRef v12 = v11;
    CFTypeID v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      ++v10;
      goto LABEL_29;
    }
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      return 0;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
LABEL_19:
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)(v14 + 4) = v4;
LABEL_20:
    __SC_log_send();
    return 0;
  }
LABEL_29:
  if (v10 == CFDictionaryGetCount(a1)) {
    return 1;
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (result)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 138412290;
    *(void *)(v19 + 4) = a1;
    goto LABEL_20;
  }
  return result;
}

uint64_t sub_2529AE6C0(const __CFDictionary *a1, const void *a2, uint64_t a3, void *a4)
{
  *a4 = 0;
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    goto LABEL_4;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != TypeID)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 138412290;
    *(void *)(v11 + 4) = a2;
    __SC_log_send();
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  if (Count == a3)
  {
LABEL_4:
    *a4 = Value;
    return 1;
  }
  CFIndex v12 = Count;
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (result)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 138412802;
    *(void *)(v13 + 4) = a2;
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v12;
    *(_WORD *)(v13 + 22) = 2048;
    *(void *)(v13 + 24) = a3;
    __SC_log_send();
    return 0;
  }
  return result;
}

uint64_t sub_2529AE8F0(const __CFDictionary *a1, const void *a2, void *a3)
{
  *a3 = 0;
  CFDictionaryRef Value = CFDictionaryGetValue(a1, a2);
  if (Value && (CFTypeID TypeID = CFBooleanGetTypeID(), CFGetTypeID(Value) != TypeID))
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (result)
    {
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 138412290;
      *(void *)(v8 + 4) = a2;
      __SC_log_send();
      return 0;
    }
  }
  else
  {
    *a3 = Value;
    return 1;
  }
  return result;
}

uint64_t sub_2529AEA3C(const __CFDictionary *a1)
{
  CFDictionaryRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD70]);
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE88]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE78]) || CFEqual(Value, (CFTypeRef)*MEMORY[0x263F1BE80]))
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t result = CFEqual(Value, @"DHCPv6PD");
      if (!result) {
        return result;
      }
      uint64_t v4 = @"RequestedPrefix";
      CFTypeID v18 = CFDictionaryGetValue(a1, @"RequestedPrefix");
      if (v18)
      {
        uint64_t v19 = v18;
        CFTypeID v20 = CFStringGetTypeID();
        if (CFGetTypeID(v19) != v20)
        {
          sub_2529B275C();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if (!result) {
            return result;
          }
          goto LABEL_40;
        }
        uint64_t v14 = 2;
      }
      else
      {
        uint64_t v14 = 1;
      }
      uint64_t v4 = @"RequestedPrefixLength";
      CFTypeID v21 = CFDictionaryGetValue(a1, @"RequestedPrefixLength");
      if (v21)
      {
        CFStringRef v22 = v21;
        CFTypeID v23 = CFNumberGetTypeID();
        if (CFGetTypeID(v22) != v23)
        {
          sub_2529B275C();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if (!result) {
            return result;
          }
          goto LABEL_40;
        }
        ++v14;
      }
    }
    goto LABEL_18;
  }
  uint64_t v4 = (__CFString *)*MEMORY[0x263F1BD68];
  uint64_t v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD68]);
  uint64_t v6 = *MEMORY[0x263F1BD88];
  uint64_t v7 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD88]);
  CFTypeID v8 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v8 || (CFTypeID v9 = CFArrayGetTypeID(), !v7) || CFGetTypeID(v7) != v9)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
LABEL_14:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 138412546;
    *(void *)(v16 + 4) = v4;
    *(_WORD *)(v16 + 12) = 2112;
    *(void *)(v16 + 14) = v6;
LABEL_41:
    __SC_log_send();
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    goto LABEL_40;
  }
  if (Count != CFArrayGetCount((CFArrayRef)v7))
  {
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
    goto LABEL_14;
  }
  uint64_t v4 = (__CFString *)*MEMORY[0x263F1BD90];
  uint64_t v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F1BD90]);
  if (v11)
  {
    CFIndex v12 = v11;
    CFTypeID v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      uint64_t v14 = 4;
      goto LABEL_18;
    }
    sub_2529B275C();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!result) {
      return result;
    }
LABEL_40:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 138412290;
    *(void *)(v24 + 4) = v4;
    goto LABEL_41;
  }
  uint64_t v14 = 3;
LABEL_18:
  if (CFDictionaryGetCount(a1) == v14) {
    return 1;
  }
  sub_2529B275C();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (result)
  {
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 138412290;
    *(void *)(v17 + 4) = a1;
    goto LABEL_41;
  }
  return result;
}

uint64_t sub_2529AF098()
{
  sub_2529AC444((uint64_t)"Library");
  uint64_t result = _CFRuntimeRegisterClass();
  qword_26B22F528 = result;
  return result;
}

void sub_2529AF0CC(uint64_t a1)
{
  void block[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(atomic_uint **)(a1 + 200);
  if (v2)
  {
    mach_error_t v3 = *(NSObject **)(a1 + 48);
    if (v3)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = sub_2529AF478;
      block[3] = &unk_265385550;
      block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = *(atomic_uint **)(a1 + 200);
    }
    sub_2529AC2E4(v2);
    *(void *)(a1 + 200) = 0;
  }
  uint64_t v4 = *(const __SCDynamicStore **)(a1 + 40);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0);
    sub_2529B23C4((const void **)(a1 + 40));
  }
  uint64_t v5 = *(NSObject **)(a1 + 48);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(a1 + 48) = 0;
  }
  mach_port_t v6 = *(_DWORD *)(a1 + 32);
  if (v6)
  {
    unsigned int v15 = 0;
    uint64_t v7 = a1 + 16;
    uint64_t v8 = a1 + 56;
    mach_error_t v9 = sub_2529B1CAC(v6, (long long *)(a1 + 16), (long long *)(a1 + 56), &v15);
    if (v9)
    {
      mach_error_t v10 = v9;
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
      {
LABEL_20:
        mach_port_deallocate(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 32));
        *(_DWORD *)(a1 + 32) = 0;
        goto LABEL_21;
      }
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v11 = _os_log_pack_fill();
      CFIndex v12 = mach_error_string(v10);
      *(_DWORD *)uint64_t v11 = 136315650;
      *(void *)(v11 + 4) = v7;
      *(_WORD *)(v11 + 12) = 2080;
      *(void *)(v11 + 14) = v8;
      *(_WORD *)(v11 + 22) = 2080;
      *(void *)(v11 + 24) = v12;
    }
    else
    {
      if (!v15) {
        goto LABEL_20;
      }
      sub_2529B275C();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled()) {
        goto LABEL_20;
      }
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v13 = _os_log_pack_fill();
      if (v15 <= 0x15) {
        uint64_t v14 = off_265385570[v15];
      }
      else {
        uint64_t v14 = "<unknown>";
      }
      *(_DWORD *)uint64_t v13 = 136315650;
      *(void *)(v13 + 4) = v7;
      *(_WORD *)(v13 + 12) = 2080;
      *(void *)(v13 + 14) = v8;
      *(_WORD *)(v13 + 22) = 2080;
      *(void *)(v13 + 24) = v14;
    }
    __SC_log_send();
    goto LABEL_20;
  }
LABEL_21:
  sub_2529B23C4((const void **)(a1 + 208));
  sub_2529B23C4((const void **)(a1 + 192));
  sub_2529B23C4((const void **)(a1 + 184));
}

__CFString *sub_2529AF3EC(char *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<IPConfigurationService %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"ifname = %s, serviceID = %s", a1 + 16, a1 + 56);
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

void *sub_2529AF478(uint64_t a1)
{
  return sub_2529AC298(*(void **)(*(void *)(a1 + 32) + 200));
}

uint64_t PvDInfoRequestCreate(const void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (qword_269C3F3B0 != -1) {
    dispatch_once(&qword_269C3F3B0, &unk_2702DC218);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(void *)(Instance + 112) = 0;
  uint64_t v20 = Instance;
  if (Instance
    && (v9 = Instance, mach_error_t v10 = sub_2529AC2A0(Instance), (*(void *)(v9 + 16) = v10) != 0)
    && (dispatch_queue_t v11 = dispatch_queue_create("PvDInfoRequestQueue", 0),
        CFIndex v12 = *(void **)(v9 + 24),
        *(void *)(v9 + 24) = v11,
        v12,
        *(void *)(v9 + 24)))
  {
    *(unsigned char *)(v9 + 40) = 0;
    uint64_t v13 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = 0;

    uint64_t v14 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = 0;

    unsigned int v15 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0;

    *(_DWORD *)(v9 + 104) = 0;
    *(void *)(v9 + 112) = 0;
    CFRetain(a1);
    if (a2) {
      CFRetain(a2);
    }
    *(void *)(v9 + 72) = a1;
    *(void *)(v9 + 80) = a2;
    *(void *)(v9 + 88) = a3;
    *(void *)(v9 + 96) = a4;
  }
  else
  {
    uint64_t v16 = sub_2529B275C();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v21, 0, sizeof(v21));
      os_log_type_enabled(v16, v17);
      CFTypeID v18 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != v21) {
        free(v18);
      }
    }

    sub_2529B23C4((const void **)&v20);
    return v20;
  }
  return v9;
}

void PvDInfoRequestSetCompletionHandler(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2529AF798;
  block[3] = &unk_265385628;
  id v12 = v5;
  uint64_t v13 = a1;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, block);
}

void sub_2529AF798(uint64_t a1)
{
  sub_2529AF89C(*(void *)(a1 + 48));
  CFAllocatorRef v2 = *(NSObject **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 16);
  id v4 = *(id *)(a1 + 40);
  id v5 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, v2);
  if (v5)
  {
    sub_2529AC280(v3);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2529B0BE0;
    v9[3] = &unk_2653856D8;
    uint64_t v11 = v3;
    id v10 = v4;
    id v6 = _Block_copy(v9);
    dispatch_source_set_event_handler(v5, v6);
    dispatch_activate(v5);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v5;
}

BOOL sub_2529AF89C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    uint64_t v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    sub_2529AC2E4(*(atomic_uint **)(a1 + 16));
  }
  return v1 != 0;
}

void PvDInfoRequestCancel(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2529AFB04;
    block[3] = &unk_265385648;
    void block[4] = a1;
    dispatch_sync(v2, block);
    uint64_t v3 = *(void *)(a1 + 16);
    sub_2529AC280(v3);
    id v4 = *(NSObject **)(a1 + 24);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_2529AFB0C;
    v8[3] = &unk_265385648;
    v8[4] = v3;
    dispatch_async(v4, v8);
  }
  else
  {
    id v5 = sub_2529B275C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v12, 0, sizeof(v12));
      os_log_type_enabled(v5, v6);
      int v10 = 136315138;
      uint64_t v11 = "PvDInfoRequestCancel";
      uint64_t v7 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v7 != v12) {
        free(v7);
      }
    }
  }
}

BOOL sub_2529AFB04(uint64_t a1)
{
  return sub_2529AF89C(*(void *)(a1 + 32));
}

void sub_2529AFB0C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_2529AC290(*(void *)(a1 + 32));
  sub_2529AC2E4(*(atomic_uint **)(a1 + 32));
  if (v2)
  {
    sub_2529AFC8C(v2);
    sub_2529AFCE4(v2);
    *(_DWORD *)(v2 + 104) = 0;
  }
  else
  {
    uint64_t v3 = sub_2529B275C();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v6, 0, sizeof(v6));
      os_log_type_enabled(v3, v4);
      id v5 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v5 != v6) {
        free(v5);
      }
    }
  }
}

void sub_2529AFC8C(uint64_t a1)
{
  sub_2529B0B88(a1);
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    [v2 cancelRequest];
    uint64_t v3 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;
  }
  os_log_type_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    [v4 invalidate];
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
  *(unsigned char *)(a1 + 40) = 0;
}

double sub_2529AFCE4(uint64_t a1)
{
  sub_2529B23C4((const void **)(a1 + 72));
  sub_2529B23C4((const void **)(a1 + 80));
  sub_2529B23C4((const void **)(a1 + 112));
  double result = 0.0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  return result;
}

void PvDInfoRequestResume(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 16);
    sub_2529AC280(v2);
    uint64_t v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2529AFEFC;
    block[3] = &unk_265385668;
    void block[4] = a1;
    void block[5] = v2;
    dispatch_async(v3, block);
  }
  else
  {
    os_log_type_t v4 = sub_2529B275C();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v10, 0, sizeof(v10));
      os_log_type_enabled(v4, v5);
      int v8 = 136315138;
      id v9 = "PvDInfoRequestResume";
      os_log_type_t v6 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v6 != v10) {
        free(v6);
      }
    }
  }
}

void sub_2529AFEFC(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = sub_2529AC290(v2);
  if (!v3)
  {
    uint64_t v7 = sub_2529B275C();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long aBlock = 0u;
      long long v37 = 0u;
      os_log_type_enabled(v7, v8);
      id v9 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v9 != &aBlock) {
        free(v9);
      }
    }

    int v10 = 0;
    goto LABEL_29;
  }
  uint64_t v4 = v3;
  if (*(unsigned char *)(v3 + 40))
  {
    os_log_type_t v5 = sub_2529B275C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
  if (*(_DWORD *)(v3 + 104))
  {
    os_log_type_t v5 = sub_2529B275C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_11:
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long aBlock = 0u;
      long long v37 = 0u;
      os_log_type_enabled(v5, v6);
      uint64_t v25 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v25 != &aBlock) {
        free(v25);
      }
    }
LABEL_24:

    int v10 = 0;
    goto LABEL_25;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.IPConfiguration.IPConfigurationHelper"];
  if (!v11)
  {
    os_log_type_t v5 = sub_2529B275C();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
  int v10 = (void *)v11;
  id v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702DD138];
  [v10 setRemoteObjectInterface:v12];

  uint64_t v13 = [v10 remoteObjectProxyWithErrorHandler:&unk_2702DC0D8];
  if (v13)
  {
    uint64_t v14 = v13;
    objc_storeStrong((id *)(v4 + 48), v10);
    objc_storeStrong((id *)(v4 + 56), v14);
    unsigned int v15 = sub_2529B275C();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long aBlock = 0u;
      long long v37 = 0u;
      os_log_type_enabled(v15, v16);
      os_log_type_t v17 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v17 != &aBlock) {
        free(v17);
      }
    }

    [*(id *)(v4 + 48) activate];
    *(unsigned char *)(v4 + 40) = 1;
    uint64_t v18 = sub_2529AC290(v2);
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v18 + 24));
      if (v20)
      {
        uint64_t v21 = v19[2];
        sub_2529AC280(v21);
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 3221225472;
        *(void *)&long long v37 = sub_2529B0DA4;
        *((void *)&v37 + 1) = &unk_265385648;
        *(void *)&long long v38 = v21;
        uint64_t v22 = _Block_copy(&aBlock);
        dispatch_source_set_event_handler(v20, v22);
        dispatch_time_t v23 = dispatch_time(0, 1000000 * v19[12]);
        dispatch_source_set_timer(v20, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_activate(v20);
      }
      else
      {
        uint64_t v22 = sub_2529B275C();
        os_log_type_t v34 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long aBlock = 0u;
          long long v37 = 0u;
          os_log_type_enabled(v22, v34);
          CFDictionaryRef v35 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v35 != &aBlock) {
            free(v35);
          }
        }
      }

      uint64_t v24 = v19[8];
      v19[8] = v20;
    }
    else
    {
      uint64_t v24 = sub_2529B275C();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long aBlock = 0u;
        long long v37 = 0u;
        os_log_type_enabled(v24, v32);
        CFDictionaryRef v33 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v33 != &aBlock) {
          free(v33);
        }
      }
    }

    goto LABEL_33;
  }
LABEL_25:
  if (*(void *)(v4 + 72))
  {
    uint64_t v14 = sub_2529B275C();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long aBlock = 0u;
      long long v37 = 0u;
      os_log_type_enabled(v14, v26);
      CFStringRef v27 = *(const __CFString **)(v4 + 72);
      uint64_t v14 = v14;
      CFStringGetCStringPtr(v27, 0x8000100u);
      unsigned int v28 = (long long *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v28 != &aBlock)
      {
        int v29 = v28;
LABEL_32:
        free(v29);
        goto LABEL_33;
      }
    }
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v14 = sub_2529B275C();
  os_log_type_t v30 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long aBlock = 0u;
    long long v37 = 0u;
    os_log_type_enabled(v14, v30);
    CFDictionaryRef v31 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v31 != &aBlock)
    {
      int v29 = v31;
      goto LABEL_32;
    }
  }
LABEL_33:

  sub_2529AC2E4(*(atomic_uint **)(a1 + 40));
}

uint64_t PvDInfoRequestGetCompletionStatus(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t PvDInfoRequestCopyAdditionalInformation(uint64_t a1)
{
  uint64_t v5 = 0;
  os_log_type_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2529B0A30;
  v4[3] = &unk_265385690;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFDictionaryRef sub_2529B0A30(uint64_t a1)
{
  CFDictionaryRef result = CFDictionaryCreateCopy(0, *(CFDictionaryRef *)(*(void *)(a1 + 40) + 112));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_2529B0A6C()
{
  sub_2529AC444((uint64_t)"Library");
  uint64_t result = _CFRuntimeRegisterClass();
  qword_269C3F3A8 = result;
  return result;
}

void sub_2529B0AA0(void *a1)
{
  sub_2529AF89C((uint64_t)a1);
  sub_2529B0B88((uint64_t)a1);
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    uint64_t v3 = a1[3];
    if (v3)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2529B0BD4;
      block[3] = &unk_265385648;
      void block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = (atomic_uint *)a1[2];
    }
    sub_2529AC2E4(v2);
    a1[2] = 0;
  }
  uint64_t v4 = (void *)a1[7];
  if (v4)
  {
    [v4 cancelRequest];
    uint64_t v5 = (void *)a1[7];
    a1[7] = 0;
  }
  os_log_type_t v6 = (void *)a1[6];
  if (v6)
  {
    [v6 invalidate];
    uint64_t v7 = (void *)a1[6];
    a1[6] = 0;
  }
  sub_2529AFCE4((uint64_t)a1);
  uint64_t v8 = (void *)a1[3];
  a1[3] = 0;
}

BOOL sub_2529B0B88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
    uint64_t v3 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    sub_2529AC2E4(*(atomic_uint **)(a1 + 16));
  }
  return v1 != 0;
}

void *sub_2529B0BD4(uint64_t a1)
{
  return sub_2529AC298(*(void **)(*(void *)(a1 + 32) + 16));
}

uint64_t sub_2529B0BE0(uint64_t a1)
{
  uint64_t result = sub_2529AC290(*(void *)(a1 + 40));
  if (result)
  {
    uint64_t result = sub_2529AF89C(result);
    if (result)
    {
      uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
      return v3();
    }
  }
  return result;
}

void sub_2529B0C3C(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = sub_2529B275C();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v6, 0, sizeof(v6));
    os_log_type_enabled(v3, v4);
    uint64_t v5 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v5 != v6) {
      free(v5);
    }
  }
}

void sub_2529B0DA4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_2529AC290(*(void *)(a1 + 32));
  if (v1)
  {
    uint64_t v2 = v1;
    if (sub_2529B0B88(v1))
    {
      id v3 = *(id *)(v2 + 72);
      id v4 = *(id *)(v2 + 80);
      uint64_t v5 = [NSString stringWithCString:*(void *)(v2 + 88) encoding:4];
      if (v5)
      {
        uint64_t v6 = *(void *)(v2 + 16);
        sub_2529AC280(v6);
        uint64_t v7 = *(void **)(v2 + 56);
        *(void *)&long long v14 = MEMORY[0x263EF8330];
        *((void *)&v14 + 1) = 3221225472;
        *(void *)&long long v15 = sub_2529B1108;
        *((void *)&v15 + 1) = &unk_265385718;
        *(void *)&long long v16 = v6;
        [v7 fetchPvDAdditionalInformationWithPvDID:v3 prefixesArray:v4 bindToInterface:v5 andCompletionHandler:&v14];
        *(_DWORD *)(v2 + 104) = 1;
      }
      else
      {
        uint64_t v8 = sub_2529B275C();
        os_log_type_t v9 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          os_log_type_enabled(v8, v9);
          int v10 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v10 != &v14) {
            free(v10);
          }
        }

        if (*(_DWORD *)(v2 + 104) != 1)
        {
          uint64_t v11 = sub_2529B275C();
          os_log_type_t v12 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            long long v14 = 0u;
            long long v15 = 0u;
            os_log_type_enabled(v11, v12);
            uint64_t v13 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v13 != &v14) {
              free(v13);
            }
          }

          sub_2529AFC8C(v2);
          sub_2529AFCE4(v2);
          *(_DWORD *)(v2 + 104) = 0;
        }
      }
    }
  }
}

void sub_2529B1108(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (const void *)sub_2529AC290(*(void *)(a1 + 32));
  long long v17 = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    CFRetain(v4);
    uint64_t v6 = [v3 valueForKey:@"valid_fetch"];
    uint64_t v7 = [v3 valueForKey:@"additional_information"];
    uint64_t v8 = v7;
    if (v6 == *MEMORY[0x263EFFB40] && v7 != 0) {
      v5[14] = v7;
    }
    if (v5[3])
    {
      uint64_t v10 = v5[2];
      sub_2529AC280(v10);
      uint64_t v11 = v5[3];
      *(void *)&long long block = MEMORY[0x263EF8330];
      *((void *)&block + 1) = 3221225472;
      *(void *)&long long v21 = sub_2529B1478;
      *((void *)&v21 + 1) = &unk_265385668;
      *(void *)&long long v22 = v10;
      *((void *)&v22 + 1) = v6;
      dispatch_async(v11, &block);
    }
    else
    {
      long long v14 = sub_2529B275C();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v27 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long block = 0u;
        os_log_type_enabled(v14, v15);
        int v18 = 136315138;
        long long v19 = "PvDInfoRequestCompletedCallback";
        long long v16 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v16 != &block) {
          free(v16);
        }
      }
    }
  }
  else
  {
    uint64_t v8 = sub_2529B275C();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long block = 0u;
      os_log_type_enabled(v8, v12);
      int v18 = 136315138;
      long long v19 = "PvDInfoRequestXPCCompletionHandler";
      uint64_t v13 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v13 != &block) {
        free(v13);
      }
    }
  }

  sub_2529B23C4(&v17);
  sub_2529AC2E4(*(atomic_uint **)(a1 + 32));
}

void sub_2529B1478(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_2529AC290(*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = v2;
    if (*(void *)(a1 + 40) == *MEMORY[0x263EFFB38])
    {
      uint64_t v5 = sub_2529B275C();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        os_log_type_enabled(v5, v13);
        long long v14 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v14 != &v17) {
          free(v14);
        }
      }
      int v8 = 3;
    }
    else
    {
      uint64_t v4 = *(void *)(v2 + 112);
      uint64_t v5 = sub_2529B275C();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      int v7 = __SC_log_enabled();
      if (v4)
      {
        int v8 = 2;
        if (v7)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          os_log_type_enabled(v5, v6);
          os_log_type_t v9 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v9 != &v17) {
            free(v9);
          }
          int v8 = 2;
        }
      }
      else
      {
        if (v7)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          os_log_type_enabled(v5, v6);
          os_log_type_t v15 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v15 != &v17) {
            free(v15);
          }
        }
        int v8 = 0;
      }
    }

    *(_DWORD *)(v3 + 104) = v8;
    sub_2529AFC8C(v3);
    long long v16 = *(NSObject **)(v3 + 32);
    if (v16) {
      dispatch_source_merge_data(v16, 1uLL);
    }
  }
  else
  {
    uint64_t v10 = sub_2529B275C();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      os_log_type_enabled(v10, v11);
      os_log_type_t v12 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v12 != &v17) {
        free(v12);
      }
    }
  }
  sub_2529AC2E4(*(atomic_uint **)(a1 + 32));
}

uint64_t sub_2529B18E4(mach_port_t a1, long long *a2, uint64_t a3, int a4, _OWORD *a5, _DWORD *a6)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  msg.msgh_id = 0;
  *((void *)&v21 + 1) = 0;
  long long v23 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  *(_OWORD *)&msg.msgh_size = 0u;
  int v19 = 1;
  uint64_t v20 = a3;
  LODWORD(v21) = 16777472;
  DWORD1(v21) = a4;
  *((void *)&v21 + 1) = *MEMORY[0x263EF80C8];
  long long v22 = *a2;
  LODWORD(v23) = a4;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4E2700000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3, 0x48u, 0xB0u, reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (v10)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v11;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v11 = 4294966988;
    }
    else if (msg.msgh_id == 20107)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 168)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v11 = HIDWORD(v20);
            if (!HIDWORD(v20))
            {
              long long v14 = v26;
              a5[4] = v25;
              a5[5] = v14;
              long long v15 = *(_OWORD *)v28;
              a5[6] = v27;
              a5[7] = v15;
              long long v16 = v22;
              *a5 = v21;
              a5[1] = v16;
              long long v17 = v24;
              a5[2] = v23;
              a5[3] = v17;
              *a6 = *(_DWORD *)&v28[16];
              return v11;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v12 = 1;
          }
          else {
            BOOL v12 = HIDWORD(v20) == 0;
          }
          if (v12) {
            uint64_t v11 = 4294966996;
          }
          else {
            uint64_t v11 = HIDWORD(v20);
          }
          goto LABEL_23;
        }
      }
      uint64_t v11 = 4294966996;
    }
    else
    {
      uint64_t v11 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v11;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v11;
}

uint64_t sub_2529B1AF8(mach_port_t a1, long long *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x263EF80C8];
  long long v18 = *a2;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  *(void *)&v12.msgh_voucher_port = 0x4E2A00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t reply_port = v12.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }
    if (v12.msgh_id == 71)
    {
      uint64_t v9 = 4294966988;
    }
    else if (v12.msgh_id == 20110)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }
      uint64_t v9 = 4294966996;
    }
    else
    {
      uint64_t v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v12);
    return v9;
  }
  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

uint64_t sub_2529B1CAC(mach_port_t a1, long long *a2, long long *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v6 = *a2;
  long long v7 = a3[4];
  long long v8 = a3[6];
  long long v9 = a3[7];
  long long v27 = a3[5];
  long long v28 = v8;
  long long v29 = v9;
  long long v10 = *a3;
  long long v11 = a3[1];
  long long v21 = v6;
  long long v22 = v10;
  long long v12 = a3[2];
  long long v13 = a3[3];
  long long v23 = v11;
  long long v24 = v12;
  uint64_t v20 = *MEMORY[0x263EF80C8];
  long long v26 = v7;
  long long v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x4E2D00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988;
    }
    else if (msg.msgh_id == 20113)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }
      uint64_t v16 = 4294966996;
    }
    else
    {
      uint64_t v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

uint64_t sub_2529B1E78(mach_port_t a1, long long *a2, long long *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v6 = *a2;
  long long v7 = a3[4];
  long long v8 = a3[6];
  long long v9 = a3[7];
  long long v27 = a3[5];
  long long v28 = v8;
  long long v29 = v9;
  long long v10 = *a3;
  long long v11 = a3[1];
  long long v21 = v6;
  long long v22 = v10;
  long long v12 = a3[2];
  long long v13 = a3[3];
  long long v23 = v11;
  long long v24 = v12;
  uint64_t v20 = *MEMORY[0x263EF80C8];
  long long v26 = v7;
  long long v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x4E2E00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988;
    }
    else if (msg.msgh_id == 20114)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }
      uint64_t v16 = 4294966996;
    }
    else
    {
      uint64_t v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

uint64_t sub_2529B2044(mach_port_t a1, long long *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x263EF80C8];
  long long v18 = *a2;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  *(void *)&v12.msgh_voucher_port = 0x4E2F00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t reply_port = v12.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }
    if (v12.msgh_id == 71)
    {
      uint64_t v9 = 4294966988;
    }
    else if (v12.msgh_id == 20115)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }
      uint64_t v9 = 4294966996;
    }
    else
    {
      uint64_t v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v12);
    return v9;
  }
  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

uint64_t sub_2529B21F8(mach_port_t a1, long long *a2, long long *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v6 = *a2;
  long long v7 = a3[4];
  long long v8 = a3[6];
  long long v9 = a3[7];
  long long v27 = a3[5];
  long long v28 = v8;
  long long v29 = v9;
  long long v10 = *a3;
  long long v11 = a3[1];
  long long v21 = v6;
  long long v22 = v10;
  long long v12 = a3[2];
  long long v13 = a3[3];
  long long v23 = v11;
  long long v24 = v12;
  uint64_t v20 = *MEMORY[0x263EF80C8];
  long long v26 = v7;
  long long v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x4E3500000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988;
    }
    else if (msg.msgh_id == 20121)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }
      uint64_t v16 = 4294966996;
    }
    else
    {
      uint64_t v16 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v16;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

void sub_2529B23C4(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_2529B23FC(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0;
  v11.length = CFStringGetLength(a1);
  v11.location = 0;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_2529B2484(const __CFString *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if (result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_2529B253C(const __CFString *a1, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sub_2529B23FC(a1, (UInt8 *)__str, 64, 0);
  unint64_t v3 = strtoul(__str, 0, 0);
  if (v3 == -1) {
    return 0;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

uint64_t sub_2529B25DC(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return (sub_2529B253C(a1, a2) & 1) != 0;
  }
  CFTypeID v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    CFTypeID v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!result) {
        return result;
      }
      return 1;
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

CFStringRef sub_2529B26A0(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = inet_ntop(30, a1, v3, 0x2Eu);
  return CFStringCreateWithCString(0, v1, 0x600u);
}

CFStringRef sub_2529B270C(const __CFAllocator *a1)
{
  CFUUIDRef v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

uint64_t sub_2529B2750(uint64_t result)
{
  qword_269C3F3B8 = result;
  return result;
}

uint64_t sub_2529B275C()
{
  return qword_269C3F3B8;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return MEMORY[0x270F05550]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x270F057D8]();
}

uint64_t __SC_log_enabled()
{
  return MEMORY[0x270F057E0]();
}

uint64_t __SC_log_send()
{
  return MEMORY[0x270F057E8]();
}

uint64_t __SC_log_send2()
{
  return MEMORY[0x270F057F0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x270ED80A0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x270ED80A8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void abort(void)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
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

void free(void *a1)
{
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}