_DWORD *LinkAddresses_create()
{
  unsigned char *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  _DWORD *v12;
  FILE *v13;
  int *v14;
  char *v15;
  FILE *v16;
  int *v17;
  char *v18;
  size_t size;
  int v21[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  size = 0;
  *(_OWORD *)v21 = xmmword_210709D70;
  v22 = 3;
  if (sysctl(v21, 6u, 0, &size, 0, 0) < 0)
  {
    v13 = (FILE *)*MEMORY[0x263EF8348];
    v14 = __error();
    v15 = strerror(*v14);
    fprintf(v13, "sysctl() size failed: %s", v15);
    return 0;
  }
  else
  {
    v0 = malloc_type_malloc(size, 0x7FA67104uLL);
    if (sysctl(v21, 6u, v0, &size, 0, 0) < 0)
    {
      v16 = (FILE *)*MEMORY[0x263EF8348];
      v17 = __error();
      v18 = strerror(*v17);
      fprintf(v16, "sysctl() failed: %s", v18);
    }
    else
    {
      v1 = malloc_type_malloc(0x50uLL, 0x2004093837F09uLL);
      if (v1)
      {
        v2 = v1;
        if (size)
        {
          v3 = 0;
          v4 = 0;
          v5 = 0;
          v6 = 10;
          do
          {
            v7 = (unsigned __int16 *)&v0[v3];
            if (v0[v3 + 3] == 14)
            {
              if (v4 == v6)
              {
                v6 = 2 * v4;
                v8 = malloc_type_realloc(v2, 16 * v4, 0x2004093837F09uLL);
                if (!v8) {
                  goto LABEL_25;
                }
                v2 = v8;
              }
              v9 = malloc_type_malloc(*((unsigned __int8 *)v7 + 112), 0x3EEF76FEuLL);
              if (v9)
              {
                v10 = v9;
                memmove(v9, v7 + 56, *((unsigned __int8 *)v7 + 112));
                *((void *)v2 + v4++) = v10;
              }
            }
            v5 += *v7;
            v3 = v5;
          }
          while (size > v5);
          if (!v4) {
            goto LABEL_21;
          }
          if (v4 < v6) {
            v2 = reallocf(v2, 8 * v4);
          }
          if (!v2)
          {
LABEL_25:
            v12 = 0;
            goto LABEL_23;
          }
          v11 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
          v12 = v11;
          if (v11)
          {
            *(void *)v11 = v2;
            v11[2] = v4;
          }
          else
          {
            free(v2);
          }
          goto LABEL_23;
        }
LABEL_21:
        free(v2);
      }
    }
    v12 = 0;
    if (v0) {
LABEL_23:
    }
      free(v0);
  }
  return v12;
}

uint64_t LinkAddresses_lookup(uint64_t **a1, char *__s)
{
  int v4 = strlen(__s);
  uint64_t v5 = *((unsigned int *)a1 + 2);
  if ((int)v5 < 1) {
    return 0;
  }
  int v6 = v4;
  for (i = *a1; ; ++i)
  {
    uint64_t v8 = *i;
    int v9 = *(unsigned __int8 *)(*i + 5);
    if (!strncmp((const char *)(*i + 8), __s, *(unsigned __int8 *)(*i + 5)) && v6 == v9) {
      break;
    }
    if (!--v5) {
      return 0;
    }
  }
  return v8;
}

void my_CFRelease(const void **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

char *EAPOLClientAttach(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4, mach_port_t *a5)
{
  kern_return_t v23;
  mach_error_t v24;
  NSObject *v25;
  os_log_type_t v26;
  char *v27;
  mach_error_t v28;
  mach_error_t v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  mach_port_t v33;
  __CFRunLoop *Current;
  mach_port_t previous[2];
  long long v36;
  long long v37;
  uint64_t v38;
  unsigned int v39;
  UInt8 *bytes;
  uint8_t buf[4];
  char *v42;
  __int16 v43;
  char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x263EF8340];
  bytes = 0;
  v39 = 0;
  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  *(void *)previous = 0;
  *a5 = 0;
  *a4 = 0;
  if (a2)
  {
    mach_error_t v9 = bootstrap_look_up2();
    if (v9)
    {
      mach_error_t v10 = v9;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v12))
      {
        *(_DWORD *)buf = 136315138;
        v42 = mach_error_string(v10);
        _os_log_impl(&dword_2106D5000, LogHandle, v12, "eapolcontroller_server_port(): %s", buf, 0xCu);
      }
      mach_port_t v13 = 6;
      goto LABEL_7;
    }
    v14 = (char *)malloc_type_malloc(0x48uLL, 0x10A00406C56F2BBuLL);
    *(_OWORD *)v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((void *)v14 + 8) = 0;
    __strlcpy_chk();
    *((void *)&v36 + 1) = v14;
    *(_DWORD *)buf = 0;
    v15 = (ipc_space_t *)MEMORY[0x263EF8960];
    char v16 = 1;
    if (!mach_port_allocate(*MEMORY[0x263EF8960], 1u, (mach_port_name_t *)buf)
      && !mach_port_insert_right(*v15, *(mach_port_name_t *)buf, *(mach_port_t *)buf, 0x14u))
    {
      v21 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
      if (v21)
      {
        *(void *)v14 = v21;
        mach_port_t Port = CFMachPortGetPort(v21);
        v23 = mach_port_request_notification(*v15, Port, 70, 1u, Port, 0x15u, &previous[1]);
        if (!v23)
        {
          v28 = eapolcontroller_client_attach(0, (long long *)(v14 + 40), Port, (_DWORD *)v14 + 4, &bytes, &v39, previous);
          if (v28)
          {
            v29 = v28;
            BOOL v19 = v28 == 268435459;
            v30 = EAPLogGetLogHandle();
            v31 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v30, v31))
            {
              v32 = mach_error_string(v29);
              *(_DWORD *)buf = 136315394;
              v42 = v14 + 40;
              v43 = 2080;
              v44 = v32;
              _os_log_impl(&dword_2106D5000, v30, v31, "eapolcontroller_client_attach(%s): %s", buf, 0x16u);
            }
            v33 = 6;
          }
          else
          {
            if (!bytes
              || (*a4 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v39),
                  MEMORY[0x21666FE10](*v15, bytes, v39),
                  *a4))
            {
              if (!previous[0])
              {
                *((void *)v14 + 3) = a2;
                *((void *)v14 + 4) = a3;
                *((void *)v14 + 1) = CFMachPortCreateRunLoopSource(0, *(CFMachPortRef *)v14, 0);
                Current = CFRunLoopGetCurrent();
                CFRunLoopAddSource(Current, *((CFRunLoopSourceRef *)v14 + 1), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
                return v14;
              }
              BOOL v19 = 0;
              goto LABEL_17;
            }
            BOOL v19 = 0;
            v33 = 12;
          }
          previous[0] = v33;
LABEL_17:
          EAPOLClientInvalidate((uint64_t)v14, v19);
          my_CFRelease(a4);
          free(v14);
          mach_port_t v13 = previous[0];
          goto LABEL_18;
        }
        v24 = v23;
        v25 = EAPLogGetLogHandle();
        v26 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = mach_error_string(v24);
          *(_DWORD *)buf = 136315138;
          v42 = v27;
          _os_log_impl(&dword_2106D5000, v25, v26, "mach_port_request_notification(): %s", buf, 0xCu);
        }
LABEL_16:
        BOOL v19 = 1;
        goto LABEL_17;
      }
      char v16 = 0;
    }
    if (*(_DWORD *)buf)
    {
      mach_port_mod_refs(*v15, *(mach_port_name_t *)buf, 1u, -1);
      if ((v16 & 1) == 0) {
        mach_port_deallocate(*v15, *(mach_port_name_t *)buf);
      }
    }
    *(void *)v14 = 0;
    v17 = EAPLogGetLogHandle();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v17, v18, "_EAPOLClientCFMachPortCreate failed", buf, 2u);
    }
    previous[0] = *__error();
    goto LABEL_16;
  }
  mach_port_t v13 = 22;
LABEL_7:
  my_CFRelease(a4);
LABEL_18:
  v14 = 0;
  *a5 = v13;
  return v14;
}

uint64_t eapolcontroller_client_attach(int a1, long long *a2, int a3, _DWORD *a4, void *a5, _DWORD *a6, _DWORD *a7)
{
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_DWORD *)&rcv_name[20] = 1;
  *(_DWORD *)&rcv_name[24] = a3;
  int v20 = 1114112;
  uint64_t v21 = *MEMORY[0x263EF80C8];
  long long v12 = a2[1];
  long long v22 = *a2;
  long long v23 = v12;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v18 = -2147478253;
  *(void *)&rcv_name[12] = 0x55FC00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)&v18, 3, 0x50u, 0x50u, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v14)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 22112)
      {
        if (v18 < 0)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 2
            && *(_DWORD *)rcv_name == 72
            && !*(_DWORD *)&rcv_name[4]
            && HIWORD(v20) << 16 == 1114112
            && BYTE3(v22) == 1)
          {
            int v16 = DWORD1(v22);
            if (DWORD1(v22) == v23)
            {
              uint64_t v15 = 0;
              *a4 = *(_DWORD *)&rcv_name[24];
              *a5 = v21;
              *a6 = v16;
              *a7 = DWORD1(v23);
              return v15;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          uint64_t v15 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4]) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = *(unsigned int *)&rcv_name[28];
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v15;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v15;
}

CFDataRef my_CFPropertyListCreateWithBytePtrAndLength(UInt8 *bytes, int a2)
{
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, bytes, a2, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (result)
  {
    CFDataRef v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t EAPClientModuleAddBuiltinModule(uint64_t (*a1)(const char *))
{
  if ((EAPClientModuleInit_first & 1) == 0) {
    EAPClientModuleInit_first = 1;
  }
  uint64_t v2 = a1("eap_type");
  if (!v2) {
    return 5;
  }
  CFDataRef v3 = (uint64_t (*)(void))v2;
  uint64_t v4 = a1("eap_name");
  if (!v4) {
    return 5;
  }
  uint64_t v5 = (uint64_t (*)(void))v4;
  int v6 = v3();
  if ((v6 - 256) < 0xFFFFFF01) {
    return 1;
  }
  int v8 = v6;
  uint64_t v9 = v5();
  if (!v9) {
    return 5;
  }
  uint64_t v10 = v9;
  v11 = &S_head;
  while (1)
  {
    v11 = (_UNKNOWN **)*v11;
    if (!v11) {
      break;
    }
    if (*(_DWORD *)v11[3] == v8) {
      return 2;
    }
  }
  mach_port_t v13 = (char *)malloc_type_malloc(0x90uLL, 0x10D0040BC8CE643uLL);
  if (!v13) {
    return 3;
  }
  uint64_t v14 = v13;
  *(_OWORD *)(v13 + 4) = 0u;
  *((_OWORD *)v13 + 8) = 0u;
  *(_OWORD *)(v13 + 116) = 0u;
  *(_OWORD *)(v13 + 100) = 0u;
  *(_OWORD *)(v13 + 84) = 0u;
  *(_OWORD *)(v13 + 68) = 0u;
  *(_OWORD *)(v13 + 52) = 0u;
  *(_OWORD *)(v13 + 36) = 0u;
  *(_OWORD *)(v13 + 20) = 0u;
  *(_DWORD *)mach_port_t v13 = v8;
  *((void *)v13 + 1) = v10;
  *((void *)v13 + 2) = a1("introspect");
  v14[4] = a1("init");
  v14[3] = a1("version");
  v14[5] = a1("free");
  v14[6] = a1("process");
  v14[7] = a1("free_packet");
  v14[8] = a1("failure_string");
  v14[9] = a1("session_key");
  v14[10] = a1("server_key");
  v14[11] = a1("master_session_key_copy_bytes");
  v14[12] = a1("require_properties");
  v14[13] = a1("publish_properties");
  v14[14] = a1("packet_dump");
  v14[15] = a1("user_name");
  v14[16] = a1("copy_identity");
  v14[17] = a1("copy_packet_description");
  if (v14[4] && (uint64_t v15 = (unsigned int (*)(void))v14[3]) != 0 && v14[5] && v14[6] && v14[7])
  {
    if (v15() == 1)
    {
      uint64_t v7 = EAPClientModuleAdd((uint64_t)v14);
      if (!v7) {
        return v7;
      }
    }
    else
    {
      uint64_t v7 = 4;
    }
  }
  else
  {
    uint64_t v7 = 5;
  }
  free(v14);
  return v7;
}

uint64_t md5_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290AB8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t md5_type()
{
  return 4;
}

const char *md5_name()
{
  return "MD5";
}

uint64_t md5_version()
{
  return 1;
}

uint64_t leap_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C2908C8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t leap_type()
{
  return 17;
}

const char *leap_name()
{
  return "LEAP";
}

uint64_t leap_version()
{
  return 1;
}

uint64_t eaptls_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C2909B8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eaptls_type()
{
  return 13;
}

const char *eaptls_name()
{
  return EAPTypeStr(13);
}

uint64_t eaptls_version()
{
  return 1;
}

uint64_t eapttls_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290DB8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapttls_type()
{
  return 21;
}

const char *eapttls_name()
{
  return EAPTypeStr(21);
}

uint64_t eapttls_version()
{
  return 1;
}

uint64_t peap_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290C38;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t peap_type()
{
  return 25;
}

const char *peap_name()
{
  return EAPTypeStr(25);
}

uint64_t peap_version()
{
  return 1;
}

uint64_t eapfast_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290B48;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapfast_type()
{
  return 43;
}

const char *eapfast_name()
{
  return "EAP-FAST";
}

uint64_t eapfast_version()
{
  return 1;
}

uint64_t eapmschapv2_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C2907A8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapmschapv2_type()
{
  return 26;
}

const char *eapmschapv2_name()
{
  return "MSCHAPv2";
}

uint64_t eapmschapv2_version()
{
  return 1;
}

uint64_t eapgtc_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290D28;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapgtc_type()
{
  return 6;
}

const char *eapgtc_name()
{
  return "GTC";
}

uint64_t eapgtc_version()
{
  return 1;
}

uint64_t eapsim_introspect(char *__s1)
{
  uint64_t v2 = "version";
  CFDataRef v3 = &off_26C290EA8;
  while (strcmp(__s1, v2))
  {
    uint64_t v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapsim_type()
{
  return 18;
}

const char *eapsim_name()
{
  return "EAP-SIM";
}

uint64_t eapsim_version()
{
  return 1;
}

_UNKNOWN **EAPClientModuleLookup(int a1)
{
  CFDataRef result = &S_head;
  do
    CFDataRef result = (_UNKNOWN **)*result;
  while (result && *(_DWORD *)result[3] != a1);
  return result;
}

uint64_t EAPClientModulePluginUserName(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 120);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

uint64_t EAPSecIdentityHandleCreateSecIdentity(const __CFDictionary *a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  *a2 = 0;
  if (!a1)
  {
    SecCertificateRef v9 = 0;
    SecCertificateRef v57 = 0;
    *a2 = 0;
    goto LABEL_11;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(a1) == TypeID)
  {
    SecCertificateRef v57 = 0;
    *a2 = 0;
    Value = CFDictionaryGetValue(a1, @"IdentityHandleType");
    CFTypeID v6 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v6)
    {
      if (!CFEqual(Value, @"CertificateData")
        || (v7 = CFDictionaryGetValue(a1, @"IdentityHandleData"), CFTypeID v8 = CFDataGetTypeID(), !v7)
        || CFGetTypeID(v7) != v8
        || (SecCertificateRef v9 = SecCertificateCreateWithData(0, (CFDataRef)v7), (v57 = v9) == 0))
      {
        uint64_t v10 = 22;
LABEL_55:
        v48 = (const void **)&v57;
LABEL_56:
        my_CFRelease(v48);
        return v10;
      }
LABEL_11:
      CFArrayRef theArray = 0;
      uint64_t v10 = EAPSecIdentityListCreate(&theArray);
      if (!v10)
      {
        CFArrayRef v11 = theArray;
        CFIndex Count = CFArrayGetCount(theArray);
        if (!*a2)
        {
          CFIndex v13 = Count;
          if (Count >= 1)
          {
            SecCertificateRef certificateRef = 0;
            ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(v11, 0);
            uint64_t v15 = ValueAtIndex;
            if (v9)
            {
              uint64_t v10 = SecIdentityCopyCertificate(ValueAtIndex, &certificateRef);
              SecCertificateRef v16 = certificateRef;
              if (certificateRef)
              {
                CFIndex v17 = 1;
                while (1)
                {
                  if (CFEqual(v9, v16))
                  {
                    CFRetain(v15);
                    *a2 = v15;
                  }
                  CFRelease(certificateRef);
                  BOOL v18 = *a2 || v13 <= v17;
                  if (v18) {
                    break;
                  }
                  SecCertificateRef certificateRef = 0;
                  uint64_t v15 = (void *)CFArrayGetValueAtIndex(v11, v17);
                  uint64_t v10 = SecIdentityCopyCertificate((SecIdentityRef)v15, &certificateRef);
                  SecCertificateRef v16 = certificateRef;
                  ++v17;
                  if (!certificateRef) {
                    goto LABEL_24;
                  }
                }
              }
              else
              {
LABEL_24:
                LogHandle = EAPLogGetLogHandle();
                os_log_type_t v20 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(LogHandle, v20))
                {
                  uint64_t v21 = EAPSecurityErrorString(v10);
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = v21;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v10;
                  _os_log_impl(&dword_2106D5000, LogHandle, v20, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
                }
              }
            }
            else
            {
              CFRetain(ValueAtIndex);
              uint64_t v10 = 0;
              *a2 = v15;
            }
          }
        }
        CFRelease(v11);
      }
      goto LABEL_55;
    }
    CFTypeRef v58 = 0;
    *a2 = 0;
    CFDictionaryRef v27 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"TLSClientIdentityData");
    CFTypeID v28 = CFDataGetTypeID();
    if (v27 && CFGetTypeID(v27) == v28)
    {
      uint64_t v29 = *MEMORY[0x263F17530];
      *(void *)buf = *MEMORY[0x263F171B8];
      *(void *)&buf[8] = v29;
      *(void *)&buf[16] = *MEMORY[0x263F175B0];
      uint64_t v30 = *MEMORY[0x263EFFB40];
      SecCertificateRef certificateRef = (SecCertificateRef)*MEMORY[0x263F171D0];
      uint64_t v64 = v30;
      CFDictionaryRef v65 = v27;
      CFDictionaryRef v31 = CFDictionaryCreate(0, (const void **)buf, (const void **)&certificateRef, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionaryRef v59 = v31;
      if (!v31) {
        return 4294967188;
      }
      uint64_t v10 = SecItemCopyMatching(v31, &v58);
      if (v10)
      {
        v32 = EAPLogGetLogHandle();
        os_log_type_t v33 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v32, v33))
        {
LABEL_66:
          v48 = (const void **)&v59;
          goto LABEL_56;
        }
        v34 = EAPSecurityErrorString(v10);
        *(_DWORD *)CFDataRef result = 136315394;
        *(void *)&result[4] = v34;
        __int16 v61 = 1024;
        int v62 = v10;
        v35 = "SecItemCopyMatching failed, %s (%d)";
        v36 = v32;
        os_log_type_t v37 = v33;
        uint32_t v38 = 18;
      }
      else
      {
        if (isA_SecIdentity(v58))
        {
          *a2 = v58;
          goto LABEL_66;
        }
        v54 = EAPLogGetLogHandle();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55)) {
          goto LABEL_66;
        }
        *(_WORD *)CFDataRef result = 0;
        v35 = "Identity data with incorrect data type";
        v36 = v54;
        os_log_type_t v37 = v55;
        uint32_t v38 = 2;
      }
      _os_log_impl(&dword_2106D5000, v36, v37, v35, result, v38);
      goto LABEL_66;
    }
    v39 = EAPLogGetLogHandle();
    os_log_type_t v40 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v39, v40))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"TLSClientIdentityData";
      _os_log_impl(&dword_2106D5000, v39, v40, "invalid data found in %@ property.", buf, 0xCu);
    }
    return 4294967246;
  }
  else
  {
    CFTypeID v22 = CFDataGetTypeID();
    if (CFGetTypeID(a1) == v22)
    {
      *a2 = 0;
      if (CFDataGetLength(a1) == 64)
      {
        SecCertificateRef certificateRef = 0;
        if (!EAPSecIdentityListCreate(&certificateRef))
        {
          BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
          SecCertificateRef v42 = certificateRef;
          CFIndex v43 = CFArrayGetCount(certificateRef);
          if (*a2 || (CFIndex v44 = v43, v43 < 1))
          {
LABEL_51:
            CFRelease(v42);
            if (*a2) {
              return 0;
            }
          }
          else
          {
            uint64_t v45 = 1;
            while (1)
            {
              *(void *)CFDataRef result = 0;
              v46 = (__SecIdentity *)CFArrayGetValueAtIndex(v42, v45 - 1);
              OSStatus v47 = SecIdentityCopyCertificate(v46, (SecCertificateRef *)result);
              if (v47) {
                break;
              }
              if (IdentityHandleMatchesCertificate(BytePtr))
              {
                CFRetain(v46);
                *a2 = v46;
              }
              CFRelease(*(CFTypeRef *)result);
              if (!*a2)
              {
                BOOL v18 = v44 <= v45++;
                if (!v18) {
                  continue;
                }
              }
              goto LABEL_51;
            }
            int v50 = v47;
            v51 = EAPLogGetLogHandle();
            os_log_type_t v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              v53 = EAPSecurityErrorString(v50);
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v50;
              _os_log_impl(&dword_2106D5000, v51, v52, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
            }
            CFRelease(v42);
          }
        }
      }
      uint64_t v23 = *MEMORY[0x263F17530];
      *(void *)buf = *MEMORY[0x263F171B8];
      *(void *)&buf[8] = v23;
      uint64_t v24 = *MEMORY[0x263F17590];
      *(void *)&buf[16] = *MEMORY[0x263F175B0];
      uint64_t v68 = v24;
      *(void *)CFDataRef result = 0;
      uint64_t v25 = *MEMORY[0x263EFFB40];
      SecCertificateRef certificateRef = (SecCertificateRef)*MEMORY[0x263F171D0];
      uint64_t v64 = v25;
      CFDictionaryRef v65 = a1;
      uint64_t v66 = v25;
      *a2 = 0;
      CFDictionaryRef v26 = CFDictionaryCreate(0, (const void **)buf, (const void **)&certificateRef, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v10 = SecItemCopyMatching(v26, (CFTypeRef *)result);
      CFRelease(v26);
      if (!v10) {
        *a2 = *(void *)result;
      }
    }
    else
    {
      return 22;
    }
  }
  return v10;
}

const void *EAPSecCertificateCopyUserNameString(uint64_t a1)
{
  v1 = EAPSecCertificateCopyAttributesDictionary(a1);
  uint64_t v7 = v1;
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    uint64_t v3 = 0;
    while (1)
    {
      Value = CFDictionaryGetValue(v2, off_264133BE0[v3]);
      if (Value) {
        break;
      }
      if (++v3 == 3) {
        goto LABEL_5;
      }
    }
    uint64_t v5 = Value;
    CFRetain(Value);
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }
  my_CFRelease((const void **)&v7);
  return v5;
}

__CFDictionary *EAPSecCertificateCopyAttributesDictionary(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v3 = (uint64_t (*)(uint64_t))MEMORY[0x263F16DC0];
  uint64_t v4 = &qword_26C290888;
  do
  {
    uint64_t v5 = (const void *)*(v4 - 1);
    uint64_t v6 = v3(a1);
    if (v6)
    {
      CFArrayRef v7 = (const __CFArray *)v6;
      if (CFEqual(v5, @"CommonName")) {
        CFIndex v8 = CFArrayGetCount(v7) - 1;
      }
      else {
        CFIndex v8 = 0;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v7, v8);
      CFDictionarySetValue(Mutable, v5, ValueAtIndex);
      CFRelease(v7);
    }
    uint64_t v10 = (uint64_t (*)(uint64_t))*v4;
    v4 += 2;
    uint64_t v3 = v10;
  }
  while (v10);
  if (!CFDictionaryGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

UInt8 *my_CFStringToCString(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (a2 == -1)
  {
    char v7 = 0;
    uint64_t v8 = 0;
    do
    {
      char v9 = v7;
      v11.location = 0;
      v11.length = Length;
      CFDataRef result = S_copy_cstring(a1, v11, S_encodings[v8]);
      if (result) {
        break;
      }
      char v7 = 1;
      uint64_t v8 = 1;
    }
    while ((v9 & 1) == 0);
  }
  else
  {
    v5.location = 0;
    v5.length = Length;
    return S_copy_cstring(a1, v5, a2);
  }
  return result;
}

uint64_t EAPOLClientReportStatus(uint64_t a1, const void *a2)
{
  CFDataRef v14 = 0;
  unsigned int v13 = 0;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    unsigned int v11 = 22;
    goto LABEL_7;
  }
  CFDataRef Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFDataRef v14 = Data;
  if (!Data)
  {
    unsigned int v11 = 12;
    goto LABEL_7;
  }
  CFDataRef v6 = Data;
  mach_port_t v7 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(v6);
  mach_error_t v10 = eapolcontroller_client_report_status(v7, (uint64_t)BytePtr, Length, (int *)&v13);
  if (v10)
  {
    mach_error("eapolcontroller_client_report_status failed", v10);
    unsigned int v11 = 6;
LABEL_7:
    unsigned int v13 = v11;
  }
  my_CFRelease((const void **)&v14);
  return v13;
}

uint64_t eapolcontroller_client_report_status(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x263EF80C8];
  int v17 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(void *)&v11.msgh_voucher_port = 0x55FF00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (v11.msgh_id == 22115)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = HIDWORD(v13) == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = HIDWORD(v13);
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

void LinkAddresses_free(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if (*(int *)(v2 + 8) >= 1)
    {
      uint64_t v3 = 0;
      do
      {
        free(*(void **)(*(void *)v2 + 8 * v3));
        *(void *)(*(void *)v2 + 8 * v3++) = 0;
      }
      while (v3 < *(int *)(v2 + 8));
    }
    free(*(void **)v2);
    free((void *)v2);
  }
  *a1 = 0;
}

uint64_t EAPPacketValid(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    Mutable = CFStringCreateMutable(0, 0);
    uint64_t IsValid = EAPPacketIsValid(a1, a2, Mutable);
    if (Mutable)
    {
      SCPrint();
      CFRelease(Mutable);
    }
    return IsValid;
  }
  else
  {
    return EAPPacketIsValid(a1, a2, 0);
  }
}

char *EAPPacketCreate(char *a1, signed int a2, char a3, char a4, int a5, void *__src, int a7, signed int *a8)
{
  if (a5) {
    signed int v14 = a7 + 5;
  }
  else {
    signed int v14 = 4;
  }
  if (!a1 || (int v15 = a1, v14 > a2)) {
    int v15 = (char *)malloc_type_malloc(v14, 0x7BB74EAAuLL);
  }
  char *v15 = a3;
  v15[1] = a4;
  *((_WORD *)v15 + 1) = bswap32(v14) >> 16;
  if (a5)
  {
    v15[4] = a5;
    if (!__src) {
      goto LABEL_13;
    }
    uint64_t v16 = v15 + 5;
  }
  else
  {
    if (!__src) {
      goto LABEL_13;
    }
    uint64_t v16 = v15 + 4;
  }
  memcpy(v16, __src, a7);
LABEL_13:
  if (a8) {
    *a8 = v14;
  }
  return v15;
}

uint64_t EAPClientModulePluginInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 24) + 32);
  if (v4) {
    return v4(a2, a3, a4);
  }
  else {
    return 1;
  }
}

uint64_t eaptls_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  CFRange v5 = malloc_type_malloc(0x128uLL, 0x10E0040D8CCA30BuLL);
  *CFRange v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  v5[11] = 0u;
  v5[12] = 0u;
  v5[13] = 0u;
  v5[14] = 0u;
  v5[15] = 0u;
  v5[16] = 0u;
  v5[17] = 0u;
  *((void *)v5 + 36) = 0;
  v5[5] = 0u;
  *((unsigned char *)v5 + 108) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSCertificateIsRequired", 1);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  *((unsigned char *)v5 + 270) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSEnableSessionResumption", 1);
  memoryIOInit((void *)v5 + 10, (_OWORD *)((char *)v5 + 8), (_OWORD *)((char *)v5 + 40));
  *(void *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t EAPSecIdentityHandleCreateSecIdentityTrustChain(const __CFDictionary *a1, __CFArray **a2)
{
  CFRange v5 = 0;
  *a2 = 0;
  uint64_t TrustChain = EAPSecIdentityHandleCreateSecIdentity(a1, &v5);
  if (!TrustChain) {
    uint64_t TrustChain = EAPSecIdentityCreateTrustChain(v5, a2);
  }
  my_CFRelease((const void **)&v5);
  return TrustChain;
}

uint64_t EAPSecPolicyCopy(uint64_t *a1)
{
  uint64_t EAP = SecPolicyCreateEAP();
  *a1 = EAP;
  if (EAP) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, int a3)
{
  if (a1)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        a3 = CFBooleanGetValue(Value);
      }
    }
  }
  return a3 != 0;
}

double memoryIOInit(void *a1, _OWORD *a2, _OWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  double result = 0.0;
  *a2 = 0u;
  a2[1] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  a1[1] = a2;
  a1[2] = a3;
  return result;
}

double memoryIOClearBuffers(uint64_t a1)
{
  memoryBufferClear(*(void *)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 16);
  return memoryBufferClear(v2);
}

double memoryBufferClear(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)a1;
    if (v2) {
      free(v2);
    }
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

SSLContext *EAPTLSMemIOContextCreate(const __CFDictionary *a1, int a2, const void *a3, const char *a4, OSStatus *a5)
{
  if (!a1)
  {
    SSLProtocol v15 = kTLSProtocol12;
    SSLProtocol v13 = kTLSProtocol1;
    goto LABEL_25;
  }
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"TLSMinimumVersion");
  mach_msg_header_t v11 = CFDictionaryGetValue(a1, @"TLSMaximumVersion");
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFEqual(Value, @"1.0"))
  {
    if (CFEqual(Value, @"1.1"))
    {
      SSLProtocol v13 = kTLSProtocol11;
      goto LABEL_6;
    }
    if (CFEqual(Value, @"1.2"))
    {
      SSLProtocol v13 = kTLSProtocol12;
      goto LABEL_6;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v25))
    {
      *(_WORD *)CFTypeID v28 = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v25, "invalid minimum TLS version", v28, 2u);
    }
  }
  SSLProtocol v13 = kTLSProtocol1;
LABEL_6:
  CFTypeID v14 = CFStringGetTypeID();
  if (v11 && CFGetTypeID(v11) == v14)
  {
    if (CFEqual(v11, @"1.0"))
    {
      SSLProtocol v15 = kTLSProtocol1;
      goto LABEL_21;
    }
    if (CFEqual(v11, @"1.1"))
    {
      SSLProtocol v15 = kTLSProtocol11;
      goto LABEL_21;
    }
    if (!CFEqual(v11, @"1.2"))
    {
      uint64_t v16 = EAPLogGetLogHandle();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v16, v17, "invalid maximum TLS version", buf, 2u);
      }
    }
  }
  SSLProtocol v15 = kTLSProtocol12;
LABEL_21:
  if (v13 > v15)
  {
    uint64_t v18 = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)CFDictionaryRef v26 = 0;
      _os_log_impl(&dword_2106D5000, v18, v19, "minimum TLS version cannot be higher than maximum TLS version", v26, 2u);
    }
    SSLProtocol v13 = v15;
  }
LABEL_25:
  *a5 = 0;
  os_log_type_t v20 = SSLCreateContext(0, (SSLProtocolSide)(a2 ^ 1), kSSLStreamType);
  OSStatus v21 = SSLSetIOFuncs(v20, (SSLReadFunc)EAPSSLMemoryIORead, (SSLWriteFunc)EAPSSLMemoryIOWrite);
  if (v21
    || (OSStatus v21 = SSLSetProtocolVersionMin(v20, v13)) != 0
    || (OSStatus v21 = SSLSetProtocolVersionMax(v20, v15)) != 0
    || (OSStatus v21 = SSLSetConnection(v20, a3)) != 0
    || a4 && (v23 = strlen(a4), (OSStatus v21 = SSLSetPeerDomainName(v20, a4, v23 + 1)) != 0)
    || (SSLSetSessionOption(v20, kSSLSessionOptionSendOneByteRecord, 0), (a2 & 1) == 0)
    && (OSStatus v21 = SSLSetSessionOption(v20, kSSLSessionOptionBreakOnServerAuth, 1u)) != 0)
  {
    if (v20) {
      CFRelease(v20);
    }
    os_log_type_t v20 = 0;
    *a5 = v21;
  }
  else
  {
    SSLSetSessionCacheTimeout();
  }
  return v20;
}

uint64_t EAPClientModulePluginEAPName(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 24) + 8);
}

uint64_t EAPClientModulePluginProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  CFDataRef v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 24) + 48);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 2;
  }
}

uint64_t eaptls_process(uint64_t a1, unsigned __int8 *a2, void *a3, int *a4, _DWORD *a5)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(uint64_t **)a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v8 = *a2;
  if (v8 == 4)
  {
    int v21 = 2;
LABEL_28:
    *((_DWORD *)v7 + 26) = v21;
    goto LABEL_29;
  }
  if (v8 != 3)
  {
    if (v8 != 1) {
      goto LABEL_29;
    }
    int v12 = *(uint64_t **)a1;
    unsigned int Length = EAPPacketGetLength((uint64_t)a2);
    SSLSessionState state = kSSLIdle;
    if (Length <= 5)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v15))
      {
LABEL_9:
        os_log_type_t v20 = 0;
LABEL_22:
        *a3 = v20;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v98 = Length;
      *(_WORD *)&v98[4] = 2048;
      *(void *)&v98[6] = 6;
      uint64_t v16 = "eaptls_request: length %d < %ld";
      goto LABEL_7;
    }
    uint64_t v28 = EAPTLSSessionGetState(*v12, &state);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = EAPLogGetLogHandle();
      os_log_type_t v31 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = EAPSSLErrorString(v29);
        *(_DWORD *)buf = 136315394;
        *(void *)v98 = v32;
        *(_WORD *)&v98[8] = 2048;
        *(void *)&v98[10] = (int)v29;
        _os_log_impl(&dword_2106D5000, v30, v31, "EAPTLSSessionGetState failed, %s (%ld)", buf, 0x16u);
      }
      os_log_type_t v20 = 0;
      *((_DWORD *)v12 + 26) = 2;
      *((_DWORD *)v12 + 31) = v29;
      goto LABEL_22;
    }
    v36 = v12 + 5;
    os_log_type_t v37 = a2 + 6;
    unsigned int v38 = Length - 6;
    unsigned __int8 v39 = a2[5];
    if ((v39 & 0x20) != 0)
    {
      if (state != kSSLHandshake || !*v36 || *((_DWORD *)v12 + 19) != a2[1])
      {
        SSLSessionState state = kSSLIdle;
LABEL_47:
        v93 = v36;
        CFIndex v44 = *(uint64_t **)a1;
        EAPTLSSessionFreeContext(**(void **)a1);
        my_CFRelease((const void **)v44 + 34);
        memoryIOClearBuffers((uint64_t)(v44 + 10));
        if (*((unsigned char *)v44 + 108))
        {
          if (!v44[14])
          {
            uint64_t v64 = EAPTLSCopyIdentityTrustChain(*(void **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)v44 + 14);
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = EAPLogGetLogHandle();
              os_log_type_t v67 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v66, v67))
              {
                uint64_t v68 = EAPSSLErrorString(v65);
                *(_DWORD *)buf = 136315394;
                *(void *)v98 = v68;
                *(_WORD *)&v98[8] = 2048;
                *(void *)&v98[10] = (int)v65;
                _os_log_impl(&dword_2106D5000, v66, v67, "failed to find client cert/identity, %s (%ld)", buf, 0x16u);
              }
              goto LABEL_110;
            }
          }
        }
        int v96 = 0;
        uint64_t v45 = *(uint64_t **)a1;
        if (!*(unsigned char *)(*(void *)a1 + 108)) {
          goto LABEL_52;
        }
        OSStatus v47 = (const __CFArray **)(v45 + 14);
        CFArrayRef v46 = (const __CFArray *)v45[14];
        if (v46) {
          goto LABEL_131;
        }
        uint64_t v69 = EAPTLSCopyIdentityTrustChain(*(void **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)v45 + 14);
        int v96 = v69;
        if (v69)
        {
          uint64_t v70 = v69;
          v71 = EAPLogGetLogHandle();
          os_log_type_t v72 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v71, v72))
          {
            uint64_t v73 = EAPSSLErrorString(v70);
            *(_DWORD *)buf = 136315394;
            *(void *)v98 = v73;
            *(_WORD *)&v98[8] = 2048;
            *(void *)&v98[10] = (int)v70;
            _os_log_impl(&dword_2106D5000, v71, v72, "failed to find client cert/identity, %s (%ld)", buf, 0x16u);
          }
          goto LABEL_85;
        }
        if (!*((unsigned char *)v45 + 108))
        {
LABEL_52:
          Context = EAPTLSSessionCreateContext(*(const __CFDictionary **)(a1 + 80), 13, v45 + 10, (const __CFArray *)v45[14], (unsigned int *)&v96);
          uint64_t v49 = (uint64_t)Context;
          if (Context && !v96)
          {
            if (!*((unsigned char *)v45 + 270)
              || (int v50 = *(const void **)(a1 + 24)) == 0
              || (int v96 = EAPTLSSessionSetPeerID(Context, v50, *(unsigned int *)(a1 + 32))) == 0)
            {
              *uint64_t v45 = v49;
LABEL_86:
              *((_DWORD *)v44 + 26) = 0;
              *((_DWORD *)v44 + 31) = 0;
              *((_DWORD *)v44 + 32) = 0;
              *((_WORD *)v44 + 70) = 0;
              *((unsigned char *)v44 + 271) = 0;
              v44[9] = 0xFFFFFFFF00000000;
              *((unsigned char *)v44 + 280) = 0;
              uint64_t v74 = EAPTLSSessionHandshake(*v12);
              if (v74 == -9803)
              {
                LOBYTE(v55) = a2[1];
                int v57 = *((_DWORD *)v12 + 30);
                CFTypeRef v58 = v12 + 9;
                v36 = v93;
                goto LABEL_88;
              }
              uint64_t v75 = v74;
              v76 = EAPLogGetLogHandle();
              os_log_type_t v77 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v76, v77))
              {
                uint64_t v78 = EAPSSLErrorString(v75);
                *(_DWORD *)buf = 136315394;
                *(void *)v98 = v78;
                *(_WORD *)&v98[8] = 1024;
                *(_DWORD *)&v98[10] = v75;
                _os_log_impl(&dword_2106D5000, v76, v77, "EAPTLSSessionHandshake failed, %s (%d)", buf, 0x12u);
              }
              os_log_type_t v20 = 0;
              *((_DWORD *)v12 + 31) = v75;
LABEL_111:
              *((_DWORD *)v12 + 26) = 2;
              goto LABEL_22;
            }
            v51 = EAPLogGetLogHandle();
            os_log_type_t v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              uint64_t v53 = EAPSSLErrorString(v96);
              *(_DWORD *)buf = 136315394;
              *(void *)v98 = v53;
              *(_WORD *)&v98[8] = 2048;
              *(void *)&v98[10] = v96;
              _os_log_impl(&dword_2106D5000, v51, v52, "EAPTLSSessionSetPeerID failed, %s (%ld)", buf, 0x16u);
            }
            goto LABEL_76;
          }
          __int16 v61 = EAPLogGetLogHandle();
          os_log_type_t v62 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v61, v62))
          {
            uint64_t v63 = EAPSSLErrorString(v96);
            *(_DWORD *)buf = 136315394;
            *(void *)v98 = v63;
            *(_WORD *)&v98[8] = 2048;
            *(void *)&v98[10] = v96;
            _os_log_impl(&dword_2106D5000, v61, v62, "EAPTLSSessionCreateContext failed, %s (%ld)", buf, 0x16u);
          }
          if (v49) {
LABEL_76:
          }
            EAPTLSSessionFreeContext(v49);
LABEL_85:
          LODWORD(v65) = v96;
          if (!v96) {
            goto LABEL_86;
          }
LABEL_110:
          os_log_type_t v20 = 0;
          *((_DWORD *)v12 + 31) = v65;
          goto LABEL_111;
        }
        CFArrayRef v46 = *v47;
        if (*v47)
        {
LABEL_131:
          if (CFArrayGetCount(v46)) {
            goto LABEL_52;
          }
        }
        LODWORD(v65) = -50;
        goto LABEL_110;
      }
      char v40 = 0;
      v41 = "Start";
    }
    else if (Length == 6)
    {
      char v40 = 0;
      v41 = "Ack";
    }
    else
    {
      if ((a2[5] & 0x80) != 0)
      {
        if (Length <= 9)
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v15 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v15)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v98 = Length;
          *(_WORD *)&v98[4] = 2048;
          *(void *)&v98[6] = 10;
          uint64_t v16 = "packet too short %d < %ld";
LABEL_7:
          os_log_type_t v17 = LogHandle;
          os_log_type_t v18 = v15;
          uint32_t v19 = 18;
LABEL_8:
          _os_log_impl(&dword_2106D5000, v17, v18, v16, buf, v19);
          goto LABEL_9;
        }
        Messageunsigned int Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
        unsigned int v38 = MessageLength;
        if (MessageLength > 0x20000)
        {
          v80 = EAPLogGetLogHandle();
          os_log_type_t v81 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v80, v81))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v98 = v38;
            *(_WORD *)&v98[4] = 1024;
            *(_DWORD *)&v98[6] = 0x20000;
            _os_log_impl(&dword_2106D5000, v80, v81, "received message too large, %d > %d", buf, 0xEu);
          }
          os_log_type_t v20 = 0;
          goto LABEL_111;
        }
        os_log_type_t v37 = a2 + 10;
        unsigned int v54 = Length - 10;
        if (MessageLength)
        {
          v41 = "Start";
          char v40 = 1;
        }
        else
        {
          char v40 = 0;
          v41 = "Ack";
        }
        v36 = v12 + 5;
        goto LABEL_62;
      }
      v41 = "Start";
      char v40 = 1;
    }
    unsigned int v54 = v38;
LABEL_62:
    if ((state - 1) < 2)
    {
      if (*v36)
      {
        LODWORD(v55) = a2[1];
        if (*((_DWORD *)v12 + 19) == v55)
        {
LABEL_67:
          int v57 = *((_DWORD *)v12 + 30);
          CFTypeRef v58 = v12 + 9;
LABEL_88:
          os_log_type_t v20 = EAPTLSPacketCreate(2, 13, (char)v55, v57, v36, v58);
          goto LABEL_89;
        }
        unint64_t v56 = v12[7] + *((int *)v12 + 18);
        if (v56 < v12[6])
        {
          v12[7] = v56;
          goto LABEL_67;
        }
        v94 = v37;
        unsigned int v92 = v54;
        v91 = v41;
        memoryBufferClear((uint64_t)v36);
        v41 = v91;
        unsigned int v54 = v92;
        os_log_type_t v37 = v94;
        *((_DWORD *)v12 + 18) = 0;
      }
      if ((v40 & 1) == 0)
      {
        v82 = v41;
        v83 = EAPLogGetLogHandle();
        os_log_type_t v84 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v83, v84)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v98 = v82;
        uint64_t v16 = "unexpected %s frame";
        os_log_type_t v17 = v83;
        os_log_type_t v18 = v84;
        uint32_t v19 = 12;
        goto LABEL_8;
      }
      os_log_type_t v55 = (const char *)a2[1];
      if (*((_DWORD *)v12 + 19) == v55)
      {
        if ((a2[5] & 0x40) != 0) {
          goto LABEL_128;
        }
LABEL_117:
        os_log_type_t v20 = eaptls_handshake((uint64_t *)a1, v55, a4);
        goto LABEL_89;
      }
      if (!v12[1])
      {
        v85 = v37;
        size_t v86 = v38;
        unsigned int v87 = v54;
        memoryBufferAllocate((uint64_t)(v12 + 1), v86);
        unsigned int v54 = v87;
        os_log_type_t v37 = v85;
      }
      unsigned int v88 = v54;
      if (!memoryBufferAddData((uint64_t)(v12 + 1), v37, v54))
      {
        v89 = EAPLogGetLogHandle();
        os_log_type_t v90 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v89, v90)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v98 = v88;
        uint64_t v16 = "fragment too large %d";
        os_log_type_t v17 = v89;
        os_log_type_t v18 = v90;
        uint32_t v19 = 8;
        goto LABEL_8;
      }
      if (memoryBufferIsComplete((uint64_t)(v12 + 1)))
      {
        os_log_type_t v55 = (const char *)a2[1];
        goto LABEL_117;
      }
      if ((a2[5] & 0x40) != 0)
      {
        LOBYTE(v55) = a2[1];
LABEL_128:
        int v57 = 0;
        v36 = 0;
        CFTypeRef v58 = 0;
        goto LABEL_88;
      }
      CFDictionaryRef v59 = EAPLogGetLogHandle();
      os_log_type_t v60 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v59, v60)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      uint64_t v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_72:
      os_log_type_t v17 = v59;
      os_log_type_t v18 = v60;
      uint32_t v19 = 2;
      goto LABEL_8;
    }
    if (state)
    {
      os_log_type_t v20 = 0;
LABEL_89:
      *((_DWORD *)v12 + 19) = a2[1];
      goto LABEL_22;
    }
    if ((v39 & 0x20) == 0)
    {
      CFDictionaryRef v59 = EAPLogGetLogHandle();
      os_log_type_t v60 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v59, v60)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      uint64_t v16 = "ignoring non EAP-TLS start frame";
      goto LABEL_72;
    }
    goto LABEL_47;
  }
  if (*((unsigned char *)v7 + 141)) {
    goto LABEL_27;
  }
  *(_DWORD *)buf = 0;
  int v22 = EAPTLSSessionGetState(*v7, (SSLSessionState *)buf);
  int v23 = *(_DWORD *)buf;
  uint64_t v24 = EAPLogGetLogHandle();
  os_log_type_t v25 = _SC_syslog_os_log_mapping();
  BOOL v26 = os_log_type_enabled(v24, v25);
  if (!v22 && v23 == 2)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v24, v25, "TLS handshake is complete", buf, 2u);
    }
    eaptls_update_tls_session_data((void **)v7);
  }
  else if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v24, v25, "TLS handshake is not complete yet", buf, 2u);
  }
  if (*((unsigned char *)v7 + 141))
  {
LABEL_27:
    int v21 = 1;
    goto LABEL_28;
  }
  SecCertificateRef v42 = EAPLogGetLogHandle();
  os_log_type_t v43 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v42, v43))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v42, v43, "TLS handshake is not complete, discarding EAP-Success packet", buf, 2u);
  }
LABEL_29:
  if (*((_DWORD *)v7 + 26) == 2)
  {
    int v33 = *((_DWORD *)v7 + 31);
    if (v33)
    {
      *a5 = v33;
      int v34 = 1001;
    }
    else if (v7[34])
    {
      int v34 = 1;
    }
    else
    {
      int v34 = 17;
    }
    *a4 = v34;
  }
  return *((unsigned int *)v7 + 26);
}

uint64_t EAPSSLMemoryIOWrite(uint64_t a1, const void *a2, size_t *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    size_t v7 = *a3;
    if (*(void *)v5)
    {
      int v8 = (char *)malloc_type_realloc(*(void **)v5, *(void *)(v5 + 8) + v7, 0x821FDE15uLL);
      *(void *)uint64_t v5 = v8;
      memmove(&v8[*(void *)(v5 + 8)], a2, v7);
      *(void *)(v5 + 8) += v7;
      BOOL v9 = "additional ";
    }
    else
    {
      int v12 = malloc_type_malloc(v7, 0x89CFA66BuLL);
      *(void *)(v5 + 8) = v7;
      *(void *)(v5 + 16) = 0;
      *(void *)uint64_t v5 = v12;
      memmove(v12, a2, v7);
      BOOL v9 = (const char *)&unk_21070AD61;
    }
    if (*(unsigned char *)a1)
    {
      Mutable = CFStringCreateMutable(0, 0);
      print_data_cfstr(Mutable, (uint64_t)a2, v7);
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v15))
      {
        int v17 = 136315650;
        os_log_type_t v18 = v9;
        __int16 v19 = 1024;
        int v20 = v7;
        __int16 v21 = 2112;
        int v22 = Mutable;
        _os_log_impl(&dword_2106D5000, LogHandle, v15, "Wrote %s%d bytes:\n%@", (uint8_t *)&v17, 0x1Cu);
      }
      CFRelease(Mutable);
    }
  }
  else
  {
    if (*(unsigned char *)a1)
    {
      mach_error_t v10 = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_2106D5000, v10, v11, "Write not initialized", (uint8_t *)&v17, 2u);
      }
    }
    *a3 = 0;
  }
  return 0;
}

uint64_t EAPSSLMemoryIORead(uint64_t a1, void *__dst, size_t *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5)
  {
    uint64_t v7 = *(void *)(v5 + 8);
    uint64_t v6 = *(void *)(v5 + 16);
    if (*(void *)v5) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8 || v7 == v6)
    {
      *a3 = 0;
      if (*(unsigned char *)a1)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v11))
        {
          LOWORD(v23[0]) = 0;
          _os_log_impl(&dword_2106D5000, LogHandle, v11, "Read would block", (uint8_t *)v23, 2u);
        }
      }
      return 4294957493;
    }
    else
    {
      size_t v16 = v7 - v6;
      if (*a3 >= v16) {
        size_t v17 = v16;
      }
      else {
        size_t v17 = *a3;
      }
      memmove(__dst, (const void *)(*(void *)v5 + v6), v17);
      uint64_t v18 = *(void *)(v5 + 8);
      size_t v19 = *(void *)(v5 + 16) + v17;
      *(void *)(v5 + 16) = v19;
      if (v19 == v18)
      {
        free(*(void **)v5);
        *(_OWORD *)uint64_t v5 = 0u;
        *(_OWORD *)(v5 + 16) = 0u;
      }
      *a3 = v17;
      if (*(unsigned char *)a1)
      {
        Mutable = CFStringCreateMutable(0, 0);
        print_data_cfstr(Mutable, (uint64_t)__dst, v17);
        __int16 v21 = EAPLogGetLogHandle();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          v23[0] = 67109378;
          v23[1] = v17;
          __int16 v24 = 2112;
          os_log_type_t v25 = Mutable;
          _os_log_impl(&dword_2106D5000, v21, v22, "Read %d bytes:\n%@", (uint8_t *)v23, 0x12u);
        }
        CFRelease(Mutable);
      }
      return 0;
    }
  }
  else
  {
    if (*(unsigned char *)a1)
    {
      SSLProtocol v13 = EAPLogGetLogHandle();
      os_log_type_t v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(v23[0]) = 0;
        _os_log_impl(&dword_2106D5000, v13, v14, "Read not initialized", (uint8_t *)v23, 2u);
      }
    }
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

unsigned char *EAPTLSPacketCreate(char a1, char a2, char a3, int a4, void *a5, _DWORD *a6)
{
  return EAPTLSPacketCreate2(a1, a2, a3, a4, a5, a6, 1);
}

unsigned char *EAPTLSPacketCreate2(char a1, char a2, char a3, int a4, void *a5, _DWORD *a6, int a7)
{
  if (!a5 || !*a5)
  {
    int v16 = 0;
    int v19 = 0;
    size_t v14 = 0;
    int v13 = 6;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  unint64_t v12 = a5[1];
  unint64_t v11 = a5[2];
  int v13 = 6;
  size_t v14 = v12 - v11;
  if (v12 <= v11)
  {
    int v16 = 0;
    int v19 = 0;
    size_t v14 = 0;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  int v15 = a7 ^ 1;
  if (v11) {
    int v15 = 1;
  }
  int v16 = v15 ^ 1;
  if (v15) {
    int v13 = 6;
  }
  else {
    int v13 = 10;
  }
  if (v14 <= a4 - v13)
  {
    int v19 = 0;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v11) {
    int v17 = 1;
  }
  else {
    int v17 = a7;
  }
  if (v17)
  {
    int v18 = a4 - v13;
  }
  else
  {
    int v13 = 10;
    int v18 = a4 - 10;
  }
  size_t v14 = v18;
  v16 |= v17 ^ 1;
  int v19 = 1;
  if (a6) {
LABEL_21:
  }
    *a6 = v14;
LABEL_22:
  unsigned __int16 v20 = v13 + v14;
  __int16 v21 = malloc_type_malloc(v13 + (int)v14, 0x85ADD5D4uLL);
  os_log_type_t v22 = v21;
  if (v21)
  {
    unsigned char *v21 = a1;
    v21[1] = a3;
    EAPPacketSetLength((uint64_t)v21, v20);
    v22[4] = a2;
    v22[5] = 0;
    if (v14)
    {
      uint64_t v23 = v22 + 6;
      if (v19)
      {
        v22[5] = 64;
        char v24 = -64;
        if (!v16) {
          goto LABEL_29;
        }
      }
      else
      {
        char v24 = 0x80;
        if (!v16)
        {
LABEL_29:
          memmove(v23, (const void *)(*a5 + a5[2]), v14);
          return v22;
        }
      }
      v22[5] = v24;
      *(_DWORD *)(v22 + 6) = bswap32(*((_DWORD *)a5 + 2));
      uint64_t v23 = v22 + 10;
      goto LABEL_29;
    }
  }
  return v22;
}

uint64_t EAPClientModulePluginFreePacket(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(result + 24) + 56);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

void eaptls_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t EAPClientModulePluginPublishProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 104);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

__CFDictionary *eaptls_publish_props(uint64_t *a1)
{
  int v13 = 0;
  SSLCipherSuite v12 = 0;
  uint64_t v1 = *a1;
  CFArrayRef v2 = *(const __CFArray **)(*a1 + 272);
  if (v2)
  {
    CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
    int v13 = CFDataArray;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    uint64_t v5 = Mutable;
    if (CFDataArray)
    {
      CFDictionarySetValue(Mutable, @"TLSServerCertificateChain", CFDataArray);
      my_CFRelease((const void **)&v13);
    }
  }
  else
  {
    uint64_t v5 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  uint64_t v6 = (const void **)MEMORY[0x263EFFB40];
  if (!*(unsigned char *)(v1 + 280)) {
    uint64_t v6 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(v5, @"TLSSessionWasResumed", *v6);
  EAPTLSSessionGetNegotiatedCipher(*(SSLContext **)v1, &v12);
  if (v12)
  {
    int v11 = v12;
    CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, &v11);
    CFDictionarySetValue(v5, @"TLSNegotiatedCipher", v7);
    CFRelease(v7);
  }
  BOOL v8 = *(const void **)(v1 + 288);
  if (v8) {
    CFDictionarySetValue(v5, @"TLSNegotiatedProtocolVersion", v8);
  }
  if (*(_DWORD *)(v1 + 128) == 3 && !*(unsigned char *)(v1 + 140))
  {
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 136));
    CFDictionarySetValue(v5, @"TLSTrustClientStatus", v9);
    CFRelease(v9);
  }
  return v5;
}

uint64_t EAPClientModulePluginSessionKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 72);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 0;
  }
}

uint64_t eaptls_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 141)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 142;
}

uint64_t EAPClientModulePluginEAPType(uint64_t a1)
{
  return **(unsigned int **)(a1 + 24);
}

uint64_t EAPSSLCopyPeerCertificates(SSLContext *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  SecTrustRef trust = 0;
  *a2 = 0;
  uint64_t v2 = SSLCopyPeerTrust(a1, &trust);
  if (v2)
  {
    uint64_t v3 = v2;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "SSLCopyPeerTrust returned NULL";
      CFNumberRef v7 = LogHandle;
      os_log_type_t v8 = v5;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl(&dword_2106D5000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    uint64_t v3 = SecTrustCopyInputCertificates();
    if (v3)
    {
      mach_error_t v10 = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        SSLCipherSuite v12 = EAPSecurityErrorString(v3);
        *(_DWORD *)buf = 136315394;
        int v16 = v12;
        __int16 v17 = 1024;
        int v18 = v3;
        uint64_t v6 = "SecTrustCopyInputCertificates failed, %s (%d)";
        CFNumberRef v7 = v10;
        os_log_type_t v8 = v11;
        uint32_t v9 = 18;
        goto LABEL_7;
      }
    }
  }
  my_CFRelease((const void **)&trust);
  return v3;
}

unsigned char *eaptls_verify_server(uint64_t *a1, const char *a2, int a3, _DWORD *a4)
{
  char v6 = (char)a2;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = *a1;
  if (a3) {
    SecTrust = (__SecTrust *)EAPTLSSessionGetSecTrust(*(void *)v8, a2);
  }
  else {
    SecTrust = 0;
  }
  int v10 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v8 + 272), a3, SecTrust, (_DWORD *)(v8 + 132));
  *(_DWORD *)(v8 + 136) = v10;
  if (!v10) {
    goto LABEL_9;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v12 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v12))
  {
    int v15 = *(_DWORD *)(v8 + 132);
    int v14 = *(_DWORD *)(v8 + 136);
    v18[0] = 67109376;
    v18[1] = v14;
    __int16 v19 = 1024;
    int v20 = v15;
    _os_log_impl(&dword_2106D5000, LogHandle, v12, "server certificate not trusted status %d %d", (uint8_t *)v18, 0xEu);
  }
  int v16 = *(_DWORD *)(v8 + 136);
  if (v16 == 3)
  {
    uint64_t result = 0;
    *(_DWORD *)(v8 + 128) = 3;
    *a4 = 3;
  }
  else
  {
    if (!v16)
    {
LABEL_9:
      uint64_t result = 0;
      *(unsigned char *)(v8 + 140) = 1;
      return result;
    }
    *a4 = v16;
    *(_DWORD *)(v8 + 124) = *(_DWORD *)(v8 + 132);
    *(_DWORD *)(v8 + 104) = 2;
    EAPTLSSessionClose(*(void *)v8, v13);
    return EAPTLSPacketCreate(2, 13, v6, *(_DWORD *)(v8 + 120), (void *)(v8 + 40), (_DWORD *)(v8 + 72));
  }
  return result;
}

uint64_t EAPTLSVerifyServerCertificateChain(const __CFDictionary *a1, CFArrayRef theArray, int a3, __SecTrust *a4, _DWORD *a5)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  SecTrustRef v76 = 0;
  os_log_type_t v77 = 0;
  int v75 = 0;
  value = 0;
  CFDictionaryRef v82 = 0;
  CFMutableArrayRef v79 = 0;
  SecTrustRef trust = 0;
  SecPolicyRef v78 = 0;
  if (!theArray || !CFArrayGetCount(theArray))
  {
    LODWORD(EAP) = 0;
    uint64_t v18 = 8;
LABEL_36:
    my_CFRelease((const void **)&trust);
    int v34 = 0;
    int v35 = 0;
    goto LABEL_37;
  }
  CFArrayGetValueAtIndex(theArray, 0);
  CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(a1, @"TLSTrustedServerNames");
  if (v10 || (CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(a1, @"TLSTrustedServerCommonNames")) != 0)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    if (CFGetTypeID(v10) == TypeID)
    {
      CFIndex Count = CFArrayGetCount(v10);
      if (Count)
      {
        CFIndex v13 = Count;
        if (Count >= 1)
        {
          CFIndex v14 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v14);
            CFTypeID v16 = CFStringGetTypeID();
            if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v16) {
              break;
            }
            if (v13 == ++v14) {
              goto LABEL_23;
            }
          }
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v23))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v23, "TLSTrustedServerNames contains a non-string value", buf, 2u);
          }
          CFArrayRef v10 = 0;
        }
        goto LABEL_23;
      }
      __int16 v19 = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "TLSTrustedServerNames is empty";
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v19 = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "TLSTrustedServerNames is not an array";
LABEL_18:
        _os_log_impl(&dword_2106D5000, v19, v20, v21, buf, 2u);
      }
    }
    CFArrayRef v10 = 0;
  }
LABEL_23:
  CFDictionaryRef EAP = (const __CFDictionary *)SecPolicyCreateEAP();
  CFDictionaryRef v82 = EAP;
  if (!EAP) {
    goto LABEL_35;
  }
  if (a3 && a4)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF70]);
    CFMutableArrayRef v79 = Mutable;
    SecPolicyRef Revocation = SecPolicyCreateRevocation(0x18uLL);
    SecPolicyRef v78 = Revocation;
    if (!Revocation)
    {
      LODWORD(EAP) = 0;
      goto LABEL_35;
    }
    SecPolicyRef v26 = Revocation;
    CFArrayAppendValue(Mutable, EAP);
    CFArrayAppendValue(Mutable, v26);
    OSStatus v27 = SecTrustSetPolicies(a4, Mutable);
    if (v27)
    {
      LODWORD(EAP) = v27;
      uint64_t v28 = EAPLogGetLogHandle();
      os_log_type_t v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        os_log_type_t v84 = (void *)v30;
        __int16 v85 = 1024;
        LODWORD(v86) = EAP;
        os_log_type_t v31 = "SecTrustSetPolicies failed, %s (%d)";
LABEL_33:
        _os_log_impl(&dword_2106D5000, v28, v29, v31, buf, 0x12u);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    SecTrustRef trust = (SecTrustRef)CFRetain(a4);
    CFDictionaryRef v59 = EAPLogGetLogHandle();
    os_log_type_t v60 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v59, v60))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v59, v60, "TLS 1.3 SecTrust object is created sucessfully", buf, 2u);
    }
  }
  else
  {
    OSStatus v32 = SecTrustCreateWithCertificates(theArray, EAP, &trust);
    if (v32)
    {
      LODWORD(EAP) = v32;
      uint64_t v28 = EAPLogGetLogHandle();
      os_log_type_t v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        int v33 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        os_log_type_t v84 = (void *)v33;
        __int16 v85 = 1024;
        LODWORD(v86) = EAP;
        os_log_type_t v31 = "SecTrustCreateWithCertificates failed, %s (%d)";
        goto LABEL_33;
      }
LABEL_35:
      uint64_t v18 = 1001;
      goto LABEL_36;
    }
  }
  if (a1
    && (CFArrayRef v61 = (const __CFArray *)CFDictionaryGetValue(a1, @"TLSTrustedCertificates"), v62 = CFArrayGetTypeID(),
                                                                                            v61)
    && CFGetTypeID(v61) == v62)
  {
    CFMutableArrayRef SecCertificateArray = EAPCFDataArrayCreateSecCertificateArray(v61);
    value = SecCertificateArray;
    if (SecCertificateArray)
    {
      OSStatus v64 = SecTrustSetAnchorCertificates(trust, SecCertificateArray);
      if (v64)
      {
        LODWORD(EAP) = v64;
        uint64_t v28 = EAPLogGetLogHandle();
        os_log_type_t v29 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v28, v29)) {
          goto LABEL_35;
        }
        uint64_t v65 = EAPSecurityErrorString((int)EAP);
        *(_DWORD *)buf = 136315394;
        os_log_type_t v84 = (void *)v65;
        __int16 v85 = 1024;
        LODWORD(v86) = EAP;
        os_log_type_t v31 = " SecTrustSetAnchorCertificates failed, %s (%d)";
        goto LABEL_33;
      }
      int v35 = 1;
    }
    else
    {
      int v35 = 0;
    }
  }
  else
  {
    int v35 = 0;
    value = 0;
  }
  CFStringRef v66 = (const __CFString *)CFDictionaryGetValue(a1, @"TLSTrustExceptionsDomain");
  os_log_type_t v67 = CFDictionaryGetValue(a1, @"TLSTrustExceptionsID");
  CFTypeID v68 = CFStringGetTypeID();
  if (v66
    && CFGetTypeID(v66) == v68
    && (CFTypeID v69 = CFStringGetTypeID(), v67)
    && ((CFTypeID v70 = v69, v71 = CFGetTypeID(v67), !v10) ? (v72 = v71 == v70) : (v72 = 0),
        !v72 ? (char v73 = 1) : (char v73 = v35),
        (v73 & 1) == 0))
  {
    int v34 = 1;
    if (CFStringCompare(v66, @"WirelessSSID", 1uLL))
    {
      uint64_t v74 = 0;
    }
    else
    {
      uint64_t v74 = EAPSecCertificateCopySHA1DigestString();
      int v34 = EAPTLSSecTrustApplyExceptionsBinding(trust, v66, v67, v74);
    }
  }
  else
  {
    uint64_t v74 = 0;
    int v34 = 0;
  }
  uint64_t v18 = 0;
  LODWORD(EAP) = 0;
  if (v10) {
    int v35 = 1;
  }
  os_log_type_t v77 = v74;
LABEL_37:
  my_CFRelease((const void **)&v82);
  my_CFRelease((const void **)&v78);
  my_CFRelease((const void **)&v79);
  my_CFRelease((const void **)&value);
  v36 = trust;
  SecTrustRef v76 = trust;
  if (!trust) {
    goto LABEL_64;
  }
  os_log_type_t v37 = EAPLogGetLogHandle();
  os_log_type_t v38 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v37, v38))
  {
    unsigned __int8 v39 = "not applied";
    if (v34) {
      unsigned __int8 v39 = "applied";
    }
    *(_DWORD *)buf = 136315394;
    os_log_type_t v84 = (void *)v39;
    __int16 v85 = 2080;
    size_t v86 = "applied";
    _os_log_impl(&dword_2106D5000, v37, v38, "trust exception %s, trust settings %s", buf, 0x16u);
  }
  LODWORD(EAP) = EAPTLSSecTrustEvaluate(v36, (SecTrustResultType *)&v75);
  char v40 = EAPLogGetLogHandle();
  if (EAP)
  {
    os_log_type_t v41 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v40, v41))
    {
      SecCertificateRef v42 = EAPSecurityErrorString((int)EAP);
      *(_DWORD *)buf = 136315394;
      os_log_type_t v84 = (void *)v42;
      __int16 v85 = 1024;
      LODWORD(v86) = EAP;
      _os_log_impl(&dword_2106D5000, v40, v41, "SecTrustEvaluate failed, %s (%d)", buf, 0x12u);
    }
    goto LABEL_63;
  }
  int v43 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v40, (os_log_type_t)v43))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v75;
    _os_log_impl(&dword_2106D5000, v40, (os_log_type_t)v43, "trust evaluation result: %d", buf, 8u);
  }
  if (a3)
  {
    value = 0;
    CFDictionaryRef v44 = SecTrustCopyResult(v36);
    CFDictionaryRef v82 = v44;
    if (!v44) {
      goto LABEL_58;
    }
    CFDictionaryRef v45 = v44;
    CFArrayRef v46 = EAPLogGetLogHandle();
    os_log_type_t v47 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v46, v47))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v84 = v45;
      _os_log_impl(&dword_2106D5000, v46, v47, "trust result: %@", buf, 0xCu);
    }
    if (CFDictionaryGetValueIfPresent(v45, (const void *)*MEMORY[0x263F17550], (const void **)&value))
    {
      int v48 = CFBooleanGetValue((CFBooleanRef)value);
      my_CFRelease((const void **)&v82);
      if (v48) {
        goto LABEL_53;
      }
    }
    else
    {
LABEL_58:
      my_CFRelease((const void **)&v82);
    }
    uint64_t v49 = EAPLogGetLogHandle();
    os_log_type_t v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v49, v50, "revocation status check is incomplete", buf, 2u);
    }
    int v75 = 7;
    goto LABEL_62;
  }
LABEL_53:
  switch(v75)
  {
    case 5:
      if (!v35)
      {
LABEL_71:
        CFArrayRef v52 = (const __CFArray *)CFDictionaryGetValue(a1, @"TLSUserTrustProceedCertificateChain");
        if (v52)
        {
          CFMutableArrayRef v53 = EAPCFDataArrayCreateSecCertificateArray(v52);
          CFDictionaryRef v82 = v53;
          if (v53 && CFEqual(v53, theArray))
          {
            if (my_CFDictionaryGetBooleanValue(a1, @"TLSSaveTrustExceptions", 0))
            {
              unsigned int v54 = v77;
              if (v77)
              {
                CFStringRef v55 = (const __CFString *)CFDictionaryGetValue(a1, @"TLSTrustExceptionsDomain");
                unint64_t v56 = CFDictionaryGetValue(a1, @"TLSTrustExceptionsID");
                EAPTLSSecTrustSaveExceptionsBinding(v36, v55, v56, v54);
                int v57 = EAPLogGetLogHandle();
                os_log_type_t v58 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v57, v58))
                {
                  *(_DWORD *)buf = 138412546;
                  os_log_type_t v84 = (void *)v55;
                  __int16 v85 = 2112;
                  size_t v86 = (const char *)v56;
                  _os_log_impl(&dword_2106D5000, v57, v58, "saved trust exception for domain: %@, identifier: %@", buf, 0x16u);
                }
              }
            }
            goto LABEL_104;
          }
        }
        else
        {
          CFDictionaryRef v82 = 0;
        }
        if (!v34)
        {
          uint64_t v18 = 3;
          goto LABEL_106;
        }
LABEL_104:
        uint64_t v18 = 0;
LABEL_106:
        my_CFRelease((const void **)&v82);
LABEL_107:
        LODWORD(EAP) = 0;
        if (!a5) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      break;
    case 4:
      if (!v35) {
        goto LABEL_71;
      }
      goto LABEL_70;
    case 1:
      if (!(v35 | v34)) {
        goto LABEL_71;
      }
LABEL_70:
      uint64_t v18 = 0;
      goto LABEL_107;
  }
LABEL_62:
  LODWORD(EAP) = -9807;
LABEL_63:
  uint64_t v18 = 1001;
LABEL_64:
  if (a5) {
LABEL_65:
  }
    *a5 = EAP;
LABEL_66:
  my_CFRelease((const void **)&v76);
  my_CFRelease((const void **)&v77);
  return v18;
}

CFMutableArrayRef EAPCFDataArrayCreateSecCertificateArray(const __CFArray *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t Count = CFArrayGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v23 = Mutable;
  if (Count >= 1)
  {
    CFIndex v4 = 0;
    os_log_type_t v20 = (const void *)*MEMORY[0x263F171C0];
    uint64_t v21 = (const void *)*MEMORY[0x263F171B8];
    os_log_type_t v5 = (const void *)*MEMORY[0x263F17530];
    char v6 = (const void *)*MEMORY[0x263EFFB40];
    CFNumberRef v7 = (const void *)*MEMORY[0x263F175B0];
    while (1)
    {
      CFTypeRef v22 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      CFTypeID TypeID = CFDataGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID) {
        break;
      }
      CFArrayRef v10 = SecCertificateCreateWithData(0, (CFDataRef)ValueAtIndex);
      CFTypeRef v22 = v10;
      if (!v10)
      {
        CFTypeRef result = 0;
        CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFMutableDictionaryRef v25 = v11;
        CFDictionaryAddValue(v11, v21, v20);
        CFDictionaryAddValue(v11, v5, v6);
        CFDictionaryAddValue(v11, v7, ValueAtIndex);
        if (!v11) {
          break;
        }
        OSStatus v12 = SecItemCopyMatching(v11, &result);
        if (v12)
        {
          int v13 = v12;
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v15 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v15))
          {
            CFTypeID v16 = EAPSecurityErrorString(v13);
            *(_DWORD *)buf = 136315394;
            OSStatus v27 = v16;
            __int16 v28 = 1024;
            int v29 = v13;
            _os_log_impl(&dword_2106D5000, LogHandle, v15, "SecItemCopyMatching failed, %s (%d)", buf, 0x12u);
          }
        }
        else if (!isA_SecCertificate(result))
        {
          __int16 v17 = EAPLogGetLogHandle();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, v17, v18, "Certificate data with incorrect data type", buf, 2u);
          }
          my_CFRelease(&result);
        }
        my_CFRelease((const void **)&v25);
        CFArrayRef v10 = result;
        CFTypeRef v22 = result;
        if (!result) {
          break;
        }
      }
      CFArrayAppendValue(Mutable, v10);
      my_CFRelease(&v22);
      if (Count == ++v4) {
        return Mutable;
      }
    }
    my_CFRelease((const void **)&v23);
    return 0;
  }
  return Mutable;
}

uint64_t EAPTLSComputeKeyData()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = SSLInternalClientRandom();
  if (v0)
  {
    uint64_t v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = (uint64_t)EAPSecurityErrorString(v1);
      _os_log_impl(&dword_2106D5000, LogHandle, v3, "SSLInternalClientRandom failed, %s", buf, 0xCu);
    }
  }
  else
  {
    CFIndex v4 = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v5))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v8 = 96;
      __int16 v9 = 2048;
      uint64_t v10 = 64;
      _os_log_impl(&dword_2106D5000, v4, v5, "buffer overflow %ld >= %ld", buf, 0x16u);
    }
    return 4294957479;
  }
  return v1;
}

__CFArray *EAPSecCertificateArrayCreateCFDataArray(const __CFArray *a1)
{
  uint64_t Count = CFArrayGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFDataRef v9 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      char v6 = (__SecCertificate *)isA_SecCertificate(ValueAtIndex);
      if (v6)
      {
        CFDataRef v7 = SecCertificateCopyData(v6);
        CFDataRef v9 = v7;
        if (v7)
        {
          CFArrayAppendValue(Mutable, v7);
          my_CFRelease((const void **)&v9);
        }
      }
    }
  }
  return Mutable;
}

const void *isA_SecCertificate(const void *a1)
{
  CFTypeID TypeID = SecCertificateGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

uint64_t EAPOLClientForceRenew(uint64_t a1)
{
  unsigned int v3 = 0;
  mach_error_t v1 = eapolcontroller_client_force_renew(*(_DWORD *)(a1 + 16), &v3);
  if (!v1) {
    return v3;
  }
  mach_error("eapolcontroller_client_force_renew failed", v1);
  return 6;
}

uint64_t eapolcontroller_client_force_renew(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x560000000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 22116)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t EAPOLClientHandleMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a2 + 20) == 70)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAPOLController server died", v9, 2u);
    }
    EAPOLClientInvalidate(a4, 0);
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a4 + 24))(a4, v7, *(void *)(a4 + 32));
}

uint64_t EAPOLClientGetConfig(uint64_t a1, const void **a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  bytes = 0;
  *a2 = 0;
  mach_error_t v4 = eapolcontroller_client_getconfig(*(_DWORD *)(a1 + 16), &bytes, (_DWORD *)&v11 + 1, &v11);
  if (v4)
  {
    mach_error_t v5 = v4;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      uint64_t v8 = mach_error_string(v5);
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = a1 + 40;
      __int16 v15 = 2080;
      CFTypeID v16 = v8;
      _os_log_impl(&dword_2106D5000, LogHandle, v7, "eapolcontroller_client_getconfig(%s): %s", buf, 0x16u);
    }
    int v9 = 6;
    goto LABEL_5;
  }
  if (bytes)
  {
    *a2 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, SHIDWORD(v11));
    MEMORY[0x21666FE10](*MEMORY[0x263EF8960], bytes, HIDWORD(v11));
    if (!*a2)
    {
      int v9 = 12;
LABEL_5:
      LODWORD(v11) = v9;
      goto LABEL_9;
    }
  }
  if (!v11) {
    return 0;
  }
LABEL_9:
  my_CFRelease(a2);
  return v11;
}

uint64_t eapolcontroller_client_getconfig(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x55FE00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 22114)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t EAPClientModulePluginFree(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(result + 24) + 40);
  if (v2) {
    return v2(a2);
  }
  return result;
}

void eaptls_free(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    EAPTLSSessionFreeContext(*(void *)v1);
    *(void *)uint64_t v1 = 0;
    my_CFRelease((const void **)(v1 + 112));
    my_CFRelease((const void **)(v1 + 272));
    memoryIOClearBuffers(v1 + 80);
    free((void *)v1);
    *a1 = 0;
  }
}

_DWORD **EAPOLClientDetach(_DWORD **result)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v9 = 0;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (*result)
    {
      int v3 = v2[4];
      if (v3)
      {
        mach_error_t v4 = eapolcontroller_client_detach(v3, &v9);
        if (v4)
        {
          mach_error_t v5 = v4;
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v7))
          {
            uint64_t v8 = mach_error_string(v5);
            *(_DWORD *)buf = 136315394;
            int v11 = v2 + 10;
            __int16 v12 = 2080;
            int v13 = v8;
            _os_log_impl(&dword_2106D5000, LogHandle, v7, "eapolcontroller_client_detach(%s): %s", buf, 0x16u);
          }
          unsigned int v9 = 6;
        }
      }
      EAPOLClientInvalidate((uint64_t)v2, 0);
      free(v2);
      void *v1 = 0;
      return (_DWORD **)v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t eapolcontroller_client_detach(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x55FD00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 22113)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

void EAPOLClientInvalidate(uint64_t a1, int a2)
{
  int v3 = *(__CFMachPort **)a1;
  mach_error_t v4 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (v3)
  {
    mach_port_name_t Port = CFMachPortGetPort(v3);
    CFMachPortInvalidate(*(CFMachPortRef *)a1);
    mach_port_mod_refs(*v4, Port, 1u, -1);
    if (a2) {
      mach_port_deallocate(*v4, Port);
    }
    my_CFRelease((const void **)a1);
  }
  if (*(void *)(a1 + 8))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 8), (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    my_CFRelease((const void **)(a1 + 8));
  }
  mach_port_name_t v8 = *(_DWORD *)(a1 + 16);
  if (v8)
  {
    mach_port_deallocate(*v4, v8);
    *(_DWORD *)(a1 + 16) = 0;
  }
}

uint64_t EAPSecKeychainPasswordItemCopy(uint64_t a1, void *a2, void *a3)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  mach_error_t v4 = (void *)*MEMORY[0x263F17090];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v4;
  keys[2] = *(void **)MEMORY[0x263F17520];
  CFTypeRef v9 = 0;
  values[0] = *(void **)MEMORY[0x263F171C8];
  values[1] = a2;
  values[2] = *(void **)MEMORY[0x263EFFB40];
  CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v6 = SecItemCopyMatching(v5, &v9);
  CFRelease(v5);
  CFTypeRef v7 = v9;
  if (v6) {
    CFTypeRef v7 = 0;
  }
  *a3 = v7;
  return v6;
}

uint64_t eapfast_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  mach_error_t v4 = malloc_type_malloc(0x8308uLL, 0x10F0040B76A0E04uLL);
  bzero(v4, 0x8308uLL);
  *((unsigned char *)v4 + 116) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSCertificateIsRequired", 0);
  *((_DWORD *)v4 + 32) = *(_DWORD *)(a1 + 16);
  BooleanCFBooleanRef Value = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSEnableSessionResumption", 1);
  *((unsigned char *)v4 + 33416) = BooleanValue;
  if (!BooleanValue) {
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 24))
  {
    int v6 = 8;
    goto LABEL_6;
  }
  int v6 = *(_DWORD *)(a1 + 32) + 8;
  if (v6 < 0x11)
  {
LABEL_6:
    CFTypeRef v7 = v4 + 4179;
    goto LABEL_7;
  }
  CFTypeRef v7 = malloc_type_malloc(v6, 0x13D897A3uLL);
LABEL_7:
  v4[4178] = v7;
  *CFTypeRef v7 = 0x545341462D504145;
  mach_port_name_t v8 = *(const void **)(a1 + 24);
  if (v8) {
    memcpy((void *)(v4[4178] + 8), v8, *(unsigned int *)(a1 + 32));
  }
  *((_DWORD *)v4 + 8362) = v6;
LABEL_10:
  BOOL v9 = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"EAPFASTUsePAC", 0);
  *((unsigned char *)v4 + 33417) = v9;
  if (v9)
  {
    *((unsigned char *)v4 + 33418) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"EAPFASTProvisionPAC", 0);
    *((unsigned char *)v4 + 33419) = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"EAPFASTProvisionPACAnonymously", 0);
  }
  memoryIOInit(v4 + 11, v4 + 1, (_OWORD *)v4 + 3);
  *(void *)a1 = v4;
  *((_DWORD *)v4 + 28) = 0;
  *((_WORD *)v4 + 16638) = 0;
  *((unsigned char *)v4 + 33406) = 0;
  v4[4140] = 0;
  *((_DWORD *)v4 + 37) = 0;
  v4[10] = 0xFFFFFFFF00000000;
  *((_DWORD *)v4 + 10) = 0;
  *((unsigned char *)v4 + 132) = 0;
  *((unsigned char *)v4 + 33452) = 0;
  v4[17] = 0;
  *((unsigned char *)v4 + 144) = 0;
  *((_DWORD *)v4 + 8366) = 0;
  *((unsigned char *)v4 + 33468) = 0;
  return 0;
}

uint64_t eapfast_process(uint64_t a1, unsigned __int8 *a2, void *a3, int *a4, _DWORD *a5)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v8 = *a2;
  if (v8 != 4)
  {
    if (v8 != 3)
    {
      if (v8 != 1) {
        goto LABEL_151;
      }
      uint64_t v12 = *(void *)a1;
      unsigned int Length = EAPPacketGetLength((uint64_t)a2);
      SSLSessionState state = kSSLIdle;
      if (Length <= 5)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v15))
        {
LABEL_9:
          os_log_type_t v20 = 0;
LABEL_150:
          *a3 = v20;
          goto LABEL_151;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v121 = Length;
        *(_WORD *)&v121[4] = 2048;
        *(void *)&v121[6] = 6;
        uint64_t v16 = "length %d < %ld";
        goto LABEL_7;
      }
      if (*(void *)v12)
      {
        uint64_t v22 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
        if (v22)
        {
          uint64_t v23 = v22;
          char v24 = EAPLogGetLogHandle();
          os_log_type_t v25 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v24, v25))
          {
            uint64_t v26 = EAPSSLErrorString(v23);
            *(_DWORD *)buf = 136315394;
            *(void *)v121 = v26;
            *(_WORD *)&v121[8] = 2048;
            *(void *)&v121[10] = (int)v23;
            _os_log_impl(&dword_2106D5000, v24, v25, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
          }
          os_log_type_t v20 = 0;
          *(_DWORD *)(v12 + 112) = 2;
          *(_DWORD *)(v12 + 136) = v23;
          goto LABEL_150;
        }
      }
      uint64_t v114 = v12;
      OSStatus v27 = (void *)(v12 + 48);
      __int16 v28 = (unsigned __int16 *)(a2 + 6);
      unsigned int v29 = Length - 6;
      unsigned __int8 v30 = a2[5];
      if ((v30 & 0x20) != 0)
      {
        if (state != kSSLHandshake || !*v27 || *(_DWORD *)(v114 + 84) != a2[1])
        {
          SSLSessionState state = kSSLIdle;
          goto LABEL_28;
        }
        char v31 = 0;
        OSStatus v32 = "Start";
      }
      else if (Length == 6)
      {
        char v31 = 0;
        OSStatus v32 = "Ack";
      }
      else
      {
        if ((a2[5] & 0x80) != 0)
        {
          if (Length <= 9)
          {
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v15 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(LogHandle, v15)) {
              goto LABEL_9;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = Length;
            *(_WORD *)&v121[4] = 2048;
            *(void *)&v121[6] = 10;
            uint64_t v16 = "packet too short %d < %ld";
LABEL_7:
            uint64_t v17 = LogHandle;
            os_log_type_t v18 = v15;
            uint32_t v19 = 18;
LABEL_8:
            _os_log_impl(&dword_2106D5000, v17, v18, v16, buf, v19);
            goto LABEL_9;
          }
          v111 = v27;
          Messageunsigned int Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
          if (MessageLength > 0x20000)
          {
            unsigned int v72 = MessageLength;
            char v73 = EAPLogGetLogHandle();
            os_log_type_t v74 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v73, v74)) {
              goto LABEL_9;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = v72;
            *(_WORD *)&v121[4] = 1024;
            *(_DWORD *)&v121[6] = 0x20000;
            uint64_t v16 = "received message too large, %d > %d";
            uint64_t v17 = v73;
            os_log_type_t v18 = v74;
            uint32_t v19 = 14;
            goto LABEL_8;
          }
          __int16 v28 = (unsigned __int16 *)(a2 + 10);
          unsigned int v29 = Length - 10;
          if (MessageLength)
          {
            OSStatus v32 = "Start";
            char v31 = 1;
          }
          else
          {
            char v31 = 0;
            OSStatus v32 = "Ack";
          }
          OSStatus v27 = v111;
          goto LABEL_47;
        }
        OSStatus v32 = "Start";
        char v31 = 1;
      }
      Messageunsigned int Length = v29;
LABEL_47:
      if ((state - 1) < 2)
      {
        if (*v27)
        {
          int v48 = a2[1];
          uint64_t v44 = v114;
          uint64_t v49 = (_DWORD *)(v114 + 80);
          if (*(_DWORD *)(v114 + 84) == v48)
          {
LABEL_52:
            int v51 = *(_DWORD *)(v114 + 128);
LABEL_141:
            os_log_type_t v20 = EAPTLSPacketCreate(2, 43, v48, v51, v27, v49);
            goto LABEL_142;
          }
          unint64_t v50 = *(void *)(v114 + 64) + *(int *)(v114 + 80);
          if (v50 < *(void *)(v114 + 56))
          {
            *(void *)(v114 + 64) = v50;
            goto LABEL_52;
          }
          unsigned int v113 = MessageLength;
          int v75 = v32;
          memoryBufferClear((uint64_t)v27);
          OSStatus v32 = v75;
          Messageunsigned int Length = v113;
          *(_DWORD *)(v114 + 80) = 0;
        }
        uint64_t v44 = v114;
        if ((v31 & 1) == 0)
        {
          SecTrustRef v76 = v32;
          os_log_type_t v77 = EAPLogGetLogHandle();
          os_log_type_t v78 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v77, v78)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)v121 = v76;
          uint64_t v16 = "unexpected %s frame";
          uint64_t v17 = v77;
          os_log_type_t v18 = v78;
          uint32_t v19 = 12;
          goto LABEL_8;
        }
        int v48 = a2[1];
        if (*(_DWORD *)(v114 + 84) == v48)
        {
          if ((a2[5] & 0x40) != 0)
          {
LABEL_111:
            int v51 = 0;
            OSStatus v27 = 0;
            uint64_t v49 = 0;
            goto LABEL_141;
          }
        }
        else
        {
          if (!*(void *)(v114 + 8)) {
            memoryBufferAllocate(v114 + 8, MessageLength);
          }
          if (!memoryBufferAddData(v114 + 8, v28, v29))
          {
            CFMutableArrayRef v79 = EAPLogGetLogHandle();
            os_log_type_t v80 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v79, v80)) {
              goto LABEL_9;
            }
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v121 = v29;
            uint64_t v16 = "fragment too large %d";
            uint64_t v17 = v79;
            os_log_type_t v18 = v80;
            uint32_t v19 = 8;
            goto LABEL_8;
          }
          if ((memoryBufferIsComplete(v114 + 8) & 1) == 0)
          {
            if ((a2[5] & 0x40) == 0)
            {
              os_log_type_t v81 = EAPLogGetLogHandle();
              os_log_type_t v82 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v81, v82))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2106D5000, v81, v82, "expecting more data but more fragments bit is not set, ignoring", buf, 2u);
              }
            }
            LOBYTE(v48) = a2[1];
            goto LABEL_111;
          }
        }
        if (*(unsigned char *)(v114 + 144)) {
          os_log_type_t v20 = eapfast_tunnel((uint64_t *)a1, (uint64_t)a2);
        }
        else {
          os_log_type_t v20 = eapfast_handshake(a1, (uint64_t)a2, a4);
        }
        goto LABEL_142;
      }
      if (state)
      {
        os_log_type_t v20 = 0;
        uint64_t v44 = v114;
LABEL_142:
        *(_DWORD *)(v44 + 84) = a2[1];
        if (!*(unsigned char *)(v44 + 132))
        {
          *(unsigned char *)(v44 + 134) = a2[5] & 7;
          *(unsigned char *)(v44 + 133) = 1;
        }
        if (v20) {
          v20[5] = v20[5] & 0xF8 | *(unsigned char *)(v44 + 133) & 7;
        }
        goto LABEL_150;
      }
      if ((v30 & 0x20) == 0)
      {
        CFArrayRef v52 = EAPLogGetLogHandle();
        os_log_type_t v53 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v52, v53)) {
          goto LABEL_9;
        }
        *(_WORD *)buf = 0;
        uint64_t v16 = "ignoring non EAP-FAST start frame";
        uint64_t v17 = v52;
        os_log_type_t v18 = v53;
        uint32_t v19 = 2;
        goto LABEL_8;
      }
LABEL_28:
      uint64_t v33 = *(void *)a1;
      uint64_t v34 = *(void *)a1 + 33120;
      unsigned int v117 = 0;
      v110 = v27;
      if (v29 >= 5 && *v28 == 1024 && v28[1])
      {
        uint64_t v106 = v34;
        unint64_t v35 = v29 - 4;
        unsigned int v109 = __rev16(v28[1]);
        if (v35 >= v109)
        {
          v112 = v28 + 2;
        }
        else
        {
          v36 = EAPLogGetLogHandle();
          os_log_type_t v37 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v36, v37))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v121 = v109;
            *(_WORD *)&v121[4] = 2048;
            *(void *)&v121[6] = v35;
            _os_log_impl(&dword_2106D5000, v36, v37, "EAP-FAST: GetAuthorityID %d > %ld, ignoring", buf, 0x12u);
          }
          unsigned int v109 = 0;
          v112 = 0;
        }
        uint64_t v34 = v106;
      }
      else
      {
        unsigned int v109 = 0;
        v112 = 0;
      }
      *(_DWORD *)(v34 + 144) = 0;
      if (*(void *)v33)
      {
        CFRelease(*(CFTypeRef *)v33);
        *(void *)uint64_t v33 = 0;
      }
      my_CFRelease((const void **)(v33 + 33408));
      os_log_type_t v38 = (void *)(v34 + 336);
      my_CFRelease((const void **)(v34 + 336));
      memoryIOClearBuffers(v33 + 88);
      unsigned __int8 v39 = EAPTLSMemIOContextCreate(*(const __CFDictionary **)(a1 + 80), 0, (const void *)(v33 + 88), 0, (OSStatus *)&v117);
      if (!v39)
      {
        unsigned int v54 = EAPLogGetLogHandle();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        uint64_t v44 = v114;
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = EAPSSLErrorString(v117);
          *(_DWORD *)buf = 136315394;
          *(void *)v121 = v56;
          *(_WORD *)&v121[8] = 2048;
          *(void *)&v121[10] = (int)v117;
          _os_log_impl(&dword_2106D5000, v54, v55, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
        }
LABEL_137:
        if (v117)
        {
          os_log_type_t v20 = 0;
          *(_DWORD *)(v44 + 136) = v117;
        }
        else
        {
          uint64_t v95 = SSLHandshake(*(SSLContextRef *)v44);
          if (v95 == -9803)
          {
            LOBYTE(v48) = a2[1];
            int v51 = *(_DWORD *)(v44 + 128);
            uint64_t v49 = (_DWORD *)(v44 + 80);
            OSStatus v27 = v110;
            goto LABEL_141;
          }
          uint64_t v96 = v95;
          v97 = EAPLogGetLogHandle();
          os_log_type_t v98 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v97, v98))
          {
            uint64_t v99 = EAPSSLErrorString(v96);
            *(_DWORD *)buf = 136315394;
            *(void *)v121 = v99;
            *(_WORD *)&v121[8] = 1024;
            *(_DWORD *)&v121[10] = v96;
            _os_log_impl(&dword_2106D5000, v97, v98, "SSLHandshake failed, %s (%d)", buf, 0x12u);
          }
          os_log_type_t v20 = 0;
          *(_DWORD *)(v44 + 136) = v96;
        }
        *(_DWORD *)(v44 + 112) = 2;
        goto LABEL_150;
      }
      char v40 = v39;
      v108 = (void *)(v34 + 336);
      if (*(unsigned char *)(v33 + 116))
      {
        CFArrayRef v41 = *(const __CFArray **)(v33 + 120);
        if (!v41)
        {
          unsigned int v117 = EAPTLSCopyIdentityTrustChain(*(void **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)(v33 + 120));
          if (v117)
          {
            SecCertificateRef v42 = EAPLogGetLogHandle();
            os_log_type_t v43 = _SC_syslog_os_log_mapping();
            uint64_t v44 = v114;
            if (os_log_type_enabled(v42, v43))
            {
              uint64_t v68 = EAPSSLErrorString(v117);
              *(_DWORD *)buf = 136315394;
              *(void *)v121 = v68;
              *(_WORD *)&v121[8] = 2048;
              *(void *)&v121[10] = (int)v117;
              CFArrayRef v46 = "failed to find client cert/identity, %s (%ld)";
              goto LABEL_135;
            }
LABEL_136:
            CFRelease(v40);
            goto LABEL_137;
          }
          CFArrayRef v41 = *(const __CFArray **)(v33 + 120);
        }
        unsigned int v117 = SSLSetCertificate(v40, v41);
        os_log_type_t v38 = (void *)(v34 + 336);
        if (v117)
        {
          SecCertificateRef v42 = EAPLogGetLogHandle();
          os_log_type_t v43 = _SC_syslog_os_log_mapping();
          uint64_t v44 = v114;
          if (os_log_type_enabled(v42, v43))
          {
            uint64_t v45 = EAPSSLErrorString(v117);
            *(_DWORD *)buf = 136315394;
            *(void *)v121 = v45;
            *(_WORD *)&v121[8] = 2048;
            *(void *)&v121[10] = (int)v117;
            CFArrayRef v46 = "SSLSetCertificate failed, %s (%ld)";
LABEL_135:
            _os_log_impl(&dword_2106D5000, v42, v43, v46, buf, 0x16u);
            goto LABEL_136;
          }
          goto LABEL_136;
        }
      }
      if (!*(unsigned char *)(v34 + 297) || !v112)
      {
LABEL_128:
        if (*v38
          || !*(unsigned char *)(v34 + 296)
          || (v93 = *(const void **)(v34 + 304)) == 0
          || (unsigned int v117 = SSLSetPeerID(v40, v93, *(int *)(v34 + 328))) == 0)
        {
          *(void *)uint64_t v33 = v40;
          *(_DWORD *)(v33 + 112) = 0;
          *(_WORD *)(v34 + 156) = 0;
          *(unsigned char *)(v34 + 286) = 0;
          *(void *)uint64_t v34 = 0;
          *(_DWORD *)(v33 + 148) = 0;
          *(void *)(v33 + 80) = 0xFFFFFFFF00000000;
          *(_DWORD *)(v33 + 40) = 0;
          *(unsigned char *)(v33 + 132) = 0;
          *(unsigned char *)(v34 + 332) = 0;
          *(void *)(v33 + 136) = 0;
          *(unsigned char *)(v33 + 144) = 0;
          *(_DWORD *)(v33 + 33464) = 0;
          *(unsigned char *)(v33 + 33468) = 0;
          uint64_t v44 = v114;
          goto LABEL_137;
        }
        SecCertificateRef v42 = EAPLogGetLogHandle();
        os_log_type_t v43 = _SC_syslog_os_log_mapping();
        uint64_t v44 = v114;
        if (!os_log_type_enabled(v42, v43)) {
          goto LABEL_136;
        }
        uint64_t v94 = EAPSSLErrorString(v117);
        *(_DWORD *)buf = 136315394;
        *(void *)v121 = v94;
        *(_WORD *)&v121[8] = 2048;
        *(void *)&v121[10] = (int)v117;
        CFArrayRef v46 = "SSLSetPeerID failed, %s (%ld)";
        goto LABEL_135;
      }
      context = v40;
      uint64_t v107 = v34;
      int v57 = *(UInt8 **)(a1 + 40);
      int v58 = *(_DWORD *)(a1 + 48);
      CFPropertyListRef v59 = pac_list_copy();
      v118 = v59;
      if (!v59
        || (CFArrayRef v60 = (const __CFArray *)v59,
            int pac = pac_list_find_pac((const __CFArray *)v59, v112, v109, v57, v58),
            pac == -1))
      {
        my_CFRelease(&v118);
        uint64_t v34 = v107;
        goto LABEL_76;
      }
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v60, pac);
      *(void *)ciphers = 0;
      CFBooleanRef Value = CFDictionaryGetValue(ValueAtIndex, @"PACOpaque");
      CFTypeID TypeID = CFDataGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        uint64_t v65 = CFDictionaryGetValue(ValueAtIndex, @"PACKey");
        CFTypeID v66 = CFDataGetTypeID();
        if (v65 && CFGetTypeID(v65) == v66)
        {
          Copy = CFRetain(ValueAtIndex);
LABEL_119:
          uint64_t v34 = v107;
          goto LABEL_120;
        }
        v83 = (void *)CFDictionaryGetValue(ValueAtIndex, @"PACKeyKeychainItemID");
        CFTypeID v84 = CFStringGetTypeID();
        if (v83)
        {
          uint64_t v34 = v107;
          if (CFGetTypeID(v83) == v84)
          {
            uint64_t v85 = EAPSecKeychainPasswordItemCopy(0, v83, ciphers);
            if (!v85)
            {
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
              CFDictionarySetValue(MutableCopy, @"PACKey", *(const void **)ciphers);
              Copy = CFDictionaryCreateCopy(0, MutableCopy);
              CFRelease(MutableCopy);
LABEL_120:
              my_CFRelease((const void **)ciphers);
              my_CFRelease(&v118);
              v116 = Copy;
              if (Copy)
              {
                CFDataRef v90 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)Copy, @"PACOpaque");
                CFDataGetBytePtr(v90);
                CFDataGetLength(v90);
                unsigned int v117 = SSLInternalSetSessionTicket();
                if (v117)
                {
                  my_CFRelease(&v116);
                  SecCertificateRef v42 = EAPLogGetLogHandle();
                  os_log_type_t v43 = _SC_syslog_os_log_mapping();
                  uint64_t v44 = v114;
                  char v40 = context;
                  if (os_log_type_enabled(v42, v43))
                  {
                    uint64_t v91 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(void *)v121 = v91;
                    *(_WORD *)&v121[8] = 2048;
                    *(void *)&v121[10] = (int)v117;
                    CFArrayRef v46 = "SSLInternalSetSessionTicket failed, %s (%ld)";
                    goto LABEL_135;
                  }
                  goto LABEL_136;
                }
                unsigned int v117 = SSLInternalSetMasterSecretFunction();
                char v40 = context;
                if (v117)
                {
                  my_CFRelease(&v116);
                  SecCertificateRef v42 = EAPLogGetLogHandle();
                  os_log_type_t v43 = _SC_syslog_os_log_mapping();
                  uint64_t v44 = v114;
                  if (os_log_type_enabled(v42, v43))
                  {
                    uint64_t v92 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(void *)v121 = v92;
                    *(_WORD *)&v121[8] = 2048;
                    *(void *)&v121[10] = (int)v117;
                    CFArrayRef v46 = "SSLInternalSetMasterSecretFunction failed, %s (%ld)";
                    goto LABEL_135;
                  }
                  goto LABEL_136;
                }
                os_log_type_t v38 = v108;
                void *v108 = v116;
                goto LABEL_128;
              }
LABEL_76:
              char v40 = context;
              os_log_type_t v38 = v108;
              if (*(unsigned char *)(v34 + 299))
              {
                ciphers[0] = 52;
                unsigned int v117 = SSLSetEnabledCiphers(context, ciphers, 1uLL);
                if (v117)
                {
                  CFTypeID v69 = EAPLogGetLogHandle();
                  os_log_type_t v70 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v69, v70))
                  {
                    uint64_t v71 = EAPSSLErrorString(v117);
                    *(_DWORD *)buf = 136315394;
                    *(void *)v121 = v71;
                    *(_WORD *)&v121[8] = 2048;
                    *(void *)&v121[10] = (int)v117;
                    _os_log_impl(&dword_2106D5000, v69, v70, "SSLSetEnabledCiphers failed, %s (%ld)", buf, 0x16u);
                  }
                  uint64_t v44 = v114;
                  goto LABEL_136;
                }
              }
              goto LABEL_128;
            }
            uint64_t v86 = v85;
            uint64_t v87 = EAPLogGetLogHandle();
            os_log_type_t v88 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v87, v88))
            {
              uint64_t v89 = EAPSSLErrorString(v86);
              *(_DWORD *)buf = 136315394;
              *(void *)v121 = v89;
              *(_WORD *)&v121[8] = 1024;
              *(_DWORD *)&v121[10] = v86;
              _os_log_impl(&dword_2106D5000, v87, v88, "EAP-FAST: EAPSecKeychainPasswordItemCopy failed, %s (%d)\n", buf, 0x12u);
            }
          }
          Copy = 0;
          goto LABEL_120;
        }
      }
      Copy = 0;
      goto LABEL_119;
    }
    int v21 = *(_DWORD *)(v7 + 148);
    if (v21 != 1) {
      goto LABEL_151;
    }
LABEL_14:
    *(_DWORD *)(v7 + 112) = v21;
    goto LABEL_151;
  }
  if (*(_DWORD *)(v7 + 148) == 2 || !*(unsigned char *)(v7 + 33466))
  {
    int v21 = 2;
    goto LABEL_14;
  }
LABEL_151:
  if (*(_DWORD *)(v7 + 112) == 2)
  {
    int v100 = *(_DWORD *)(v7 + 136);
    if (v100)
    {
      *a5 = v100;
      int v101 = 1001;
    }
    else
    {
      int v101 = *(_DWORD *)(v7 + 140);
      if (v101) {
        BOOL v102 = v101 == 3;
      }
      else {
        BOOL v102 = 1;
      }
      if (v102) {
        int v101 = 1;
      }
    }
    *a4 = v101;
  }
  return *(unsigned int *)(v7 + 112);
}

CFPropertyListRef pac_list_copy()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue(@"PACList", @"com.apple.network.eapclient.eapfast", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  int v3 = v0;
  if (v0)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    if (CFGetTypeID(v0) != TypeID)
    {
      my_CFRelease(&v3);
      return v3;
    }
  }
  return v0;
}

uint64_t pac_list_find_pac(const __CFArray *a1, const void *a2, unsigned int a3, UInt8 *bytes, int a5)
{
  CFStringRef v23 = 0;
  if (bytes)
  {
    CFStringRef v7 = CFStringCreateWithBytes(0, bytes, a5, 0x8000100u, 1u);
    CFStringRef v23 = v7;
  }
  else
  {
    CFStringRef v7 = 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    size_t v11 = a3;
    uint64_t v12 = 0xFFFFFFFFLL;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"AuthorityID");
          CFTypeID v16 = CFDataGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v16 && CFDataGetLength(Value) == v11)
            {
              BytePtr = CFDataGetBytePtr(Value);
              if (!memcmp(a2, BytePtr, v11))
              {
                os_log_type_t v18 = CFDictionaryGetValue(ValueAtIndex, @"InitiatorID");
                if (v18)
                {
                  if (v7)
                  {
                    uint32_t v19 = v18;
                    CFTypeID v20 = CFStringGetTypeID();
                    if (CFGetTypeID(v19) == v20)
                    {
                      if (CFEqual(v7, v19))
                      {
LABEL_23:
                        uint64_t v12 = v10;
                        goto LABEL_22;
                      }
                    }
                  }
                }
                else
                {
                  if (!v7) {
                    goto LABEL_23;
                  }
                  uint64_t v12 = v10;
                }
              }
            }
          }
        }
      }
      if (v9 == ++v10) {
        goto LABEL_22;
      }
    }
  }
  uint64_t v12 = 0xFFFFFFFFLL;
LABEL_22:
  my_CFRelease((const void **)&v23);
  return v12;
}

void eapfast_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t eapfast_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 33277)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 33278;
}

void eapfast_compute_master_secret(uint64_t a1, uint64_t *a2, _DWORD *a3, uint64_t *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v5 = a2 + 4182;
  CFDictionaryRef v6 = (const __CFDictionary *)a2[4182];
  if (!v6)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v18)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    int v13 = "pac_dict is NULL";
LABEL_10:
    uint64_t v14 = LogHandle;
    os_log_type_t v15 = v18;
    uint32_t v16 = 2;
    goto LABEL_11;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v6, @"PACKey");
  if (!Value)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v18)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    int v13 = "pac_key is NULL";
    goto LABEL_10;
  }
  if ((unint64_t)*a4 > 0x2F)
  {
    CFDataRef v19 = Value;
    int v22 = 64;
    if (!ssl_get_server_client_random(*a2, (uint64_t)buf, &v22))
    {
      BytePtr = CFDataGetBytePtr(v19);
      int Length = CFDataGetLength(v19);
      T_PRF(BytePtr, Length, "PAC to master secret label hash", 0x1Fu, buf, v22, a3, 48);
      *a4 = 48;
      *((unsigned char *)v5 + 9) = 1;
      return;
    }
  }
  else
  {
    CFIndex v10 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = *a4;
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = v12;
      __int16 v25 = 1024;
      int v26 = 48;
      int v13 = "%lu < %d";
      uint64_t v14 = v10;
      os_log_type_t v15 = v11;
      uint32_t v16 = 18;
LABEL_11:
      _os_log_impl(&dword_2106D5000, v14, v15, v13, buf, v16);
    }
  }
LABEL_13:
  *a4 = 0;
}

uint64_t ssl_get_server_client_random(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v20 = *a3;
  uint64_t v4 = SSLInternalServerRandom();
  if (v4)
  {
    uint64_t v5 = v4;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = EAPSSLErrorString(v5);
      __int16 v24 = 1024;
      int v25 = v5;
      int v8 = "EAP-FAST: ssl_get_server_client_random: SSLInternalServerRandom failed, %s (%d)\n";
      CFIndex v9 = LogHandle;
      os_log_type_t v10 = v7;
      uint32_t v11 = 18;
LABEL_4:
      _os_log_impl(&dword_2106D5000, v9, v10, v8, buf, v11);
    }
  }
  else
  {
    int v12 = v20;
    unint64_t v13 = *a3;
    if (v20 + 32 <= v13)
    {
      int v21 = v13 - v20;
      uint64_t v5 = SSLInternalClientRandom();
      if (!v5)
      {
        *a3 = v21 + v12;
        return v5;
      }
      uint64_t v17 = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = EAPSSLErrorString(v5);
        int v8 = "EAP-FAST: ssl_get_server_client_random: SSLInternalClientRandom failed, %s\n";
        CFIndex v9 = v17;
        os_log_type_t v10 = v18;
        uint32_t v11 = 12;
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v14 = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        int v16 = *a3;
        *(_DWORD *)buf = 134218240;
        uint64_t v23 = v20 + 32;
        __int16 v24 = 1024;
        int v25 = v16;
        _os_log_impl(&dword_2106D5000, v14, v15, "EAP-FAST: ssl_get_server_client_random: SSLInternalServerRandom %ld > %d\n", buf, 0x12u);
      }
      return 4294957479;
    }
  }
  return v5;
}

void T_PRF(const void *a1, int a2, const void *a3, unsigned int a4, const void *a5, int a6, _DWORD *a7, int a8)
{
  LODWORD(i) = a8;
  *(void *)&v31[236] = *MEMORY[0x263EF8340];
  int v13 = a4 + a6 + 24;
  if (v13 < 0x101)
  {
    uint64_t v14 = v30;
    os_log_type_t v15 = v31;
  }
  else
  {
    uint64_t v14 = (char *)malloc_type_malloc(v13, 0x3F8CFDB0uLL);
    os_log_type_t v15 = v14 + 20;
  }
  __int16 v24 = v15;
  if (a5) {
    BOOL v16 = a6 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  unsigned int v18 = bswap32(i) >> 16;
  int v19 = 1;
  for (size_t i = i; ; i -= 20)
  {
    uint64_t v20 = v14;
    if (v19 != 1)
    {
      long long v21 = macOut;
      *((_DWORD *)v14 + 4) = v29;
      *(_OWORD *)uint64_t v14 = v21;
      uint64_t v20 = v24;
    }
    memcpy(v20, a3, a4);
    int v22 = &v20[a4];
    *int v22 = 0;
    uint64_t v23 = v22 + 1;
    if (v17)
    {
      memcpy(v23, a5, a6);
      v23 += a6;
    }
    *(_WORD *)uint64_t v23 = v18;
    _DWORD v23[2] = v19;
    CCHmac(0, a1, a2, v14, v23 - v14 + 3, &macOut);
    if (i < 0x15) {
      break;
    }
    *(_OWORD *)a7 = macOut;
    a7[4] = v29;
    a7 += 5;
    ++v19;
  }
  memcpy(a7, &macOut, i);
  if (v14 != v30) {
    free(v14);
  }
}

unsigned char *eapfast_verify_server(const __CFDictionary **a1, char a2, _DWORD *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = *a1;
  uint64_t v4 = (uint64_t)*a1 + 33268;
  if (!*((unsigned char *)*a1 + 33465))
  {
    if (!*((void *)*a1 + 4182))
    {
      if (*((unsigned char *)*a1 + 33419))
      {
        LOWORD(v15[0]) = 0;
        if (!SSLGetNegotiatedCipher(*(SSLContextRef *)v3, (SSLCipherSuite *)v15) && LOWORD(v15[0]) == 52)
        {
          CFTypeRef result = 0;
          *(unsigned char *)(v4 + 8) = 1;
          *(unsigned char *)(v4 + 199) = 1;
          return result;
        }
      }
    }
    int v9 = EAPTLSVerifyServerCertificateChain(a1[10], *(CFArrayRef *)(v4 + 140), 0, 0, (_DWORD *)v4);
    *(_DWORD *)(v4 + 4) = v9;
    if (v9)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v11))
      {
        int v13 = *(_DWORD *)v4;
        int v12 = *(_DWORD *)(v4 + 4);
        v15[0] = 67109376;
        v15[1] = v12;
        __int16 v16 = 1024;
        int v17 = v13;
        _os_log_impl(&dword_2106D5000, LogHandle, v11, "server certificate not trusted, status %d %d", (uint8_t *)v15, 0xEu);
      }
      int v14 = *(_DWORD *)(v4 + 4);
      if (v14 == 3)
      {
        CFTypeRef result = 0;
        *((_DWORD *)v3 + 35) = 3;
        *a3 = 3;
        return result;
      }
      if (v14)
      {
        *((_DWORD *)v3 + 35) = v14;
        *a3 = v14;
        *((_DWORD *)v3 + 34) = *(_DWORD *)v4;
        *((_DWORD *)v3 + 28) = 2;
        SSLClose(*(SSLContextRef *)v3);
        return EAPTLSPacketCreate(2, 43, a2, *((_DWORD *)v3 + 32), (void *)v3 + 6, (_DWORD *)v3 + 20);
      }
    }
  }
  CFTypeRef result = 0;
  *(unsigned char *)(v4 + 8) = 1;
  return result;
}

uint64_t eapfast_eap()
{
  CFPropertyListRef v0 = (uint64_t *)MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t)v0;
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v4 = *v0;
  uint64_t v5 = (unsigned int *)(*v0 + 33120);
  long long v89 = 0uLL;
  size_t processed = 0;
  *(void *)CFDataRef v90 = &v95;
  *(void *)&v90[2] = 0x4000;
  size_t v6 = *(void *)v5;
  if (!*(void *)v5)
  {
    uint64_t v29 = SSLRead(*(SSLContextRef *)v4, (void *)(v4 + 352), 0x8000uLL, (size_t *)v5);
    if (v29 == -9803) {
      return 1;
    }
    uint64_t v30 = v29;
    if (v29)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v43 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v43))
      {
        *(_DWORD *)uint64_t v91 = 136315394;
        uint64_t v92 = EAPSSLErrorString(v30);
        __int16 v93 = 1024;
        int v94 = v30;
        _os_log_impl(&dword_2106D5000, LogHandle, v43, "SSLRead failed, %s (%d)", v91, 0x12u);
      }
      BOOL v41 = 0;
      *(_DWORD *)(v4 + 112) = 2;
      *(_DWORD *)(v4 + 136) = v30;
      return v41;
    }
    if (*(void *)v5)
    {
      char v31 = (void *)(v4 + 33128);
      if (*(unsigned char *)(v3 + 8))
      {
        CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
        BOOL v33 = TLVListParse(v4 + 33128, (unsigned __int16 *)(v4 + 352), *v5, Mutable);
        if (Mutable)
        {
          uint64_t v34 = EAPLogGetLogHandle();
          os_log_type_t v35 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)uint64_t v91 = 138412290;
            uint64_t v92 = (uint64_t)Mutable;
            _os_log_impl(&dword_2106D5000, v34, v35, "-------- Receive TLVs: ----------\n%@", v91, 0xCu);
          }
          CFRelease(Mutable);
        }
        if (!v33) {
          goto LABEL_109;
        }
      }
      else if (!TLVListParse(v4 + 33128, (unsigned __int16 *)(v4 + 352), *(void *)v5, 0))
      {
        goto LABEL_109;
      }
      int v51 = (_WORD *)*((void *)v5 + 9);
      if (v51)
      {
        if (!*v31)
        {
          make_nak((uint64_t)v90, v51);
          goto LABEL_112;
        }
        goto LABEL_110;
      }
      if (!*((void *)v5 + 7))
      {
LABEL_65:
        if (!*v31)
        {
          BOOL v55 = 0;
          goto LABEL_81;
        }
        int v54 = *((unsigned __int16 *)v5 + 8);
        BOOL v55 = v54 == 1;
        if (v54 != 1)
        {
          *(_DWORD *)(v4 + 148) = 2;
          uint64_t v56 = *((void *)v5 + 4);
          int v57 = EAPLogGetLogHandle();
          os_log_type_t v58 = _SC_syslog_os_log_mapping();
          BOOL v59 = os_log_type_enabled(v57, v58);
          if (v56)
          {
            if (v59)
            {
              unsigned int v60 = v5[10];
              *(_DWORD *)uint64_t v91 = 67109120;
              LODWORD(v92) = v60;
              CFArrayRef v61 = "Result TLV Failure, Error %d";
              CFTypeID v62 = v57;
              os_log_type_t v63 = v58;
              uint32_t v64 = 8;
LABEL_79:
              _os_log_impl(&dword_2106D5000, v62, v63, v61, v91, v64);
            }
          }
          else if (v59)
          {
            *(_WORD *)uint64_t v91 = 0;
            CFArrayRef v61 = "Result TLV Failure";
            CFTypeID v62 = v57;
            os_log_type_t v63 = v58;
            uint32_t v64 = 2;
            goto LABEL_79;
          }
        }
        long long v89 = *(_OWORD *)v90;
        make_result((uint64_t)v90, *((unsigned __int16 *)v5 + 8));
LABEL_81:
        os_log_type_t v67 = (long long *)*((void *)v5 + 8);
        if (v67)
        {
          if (!process_crypto_binding(v4, v67, (uint64_t)v90))
          {
            os_log_type_t v70 = EAPLogGetLogHandle();
            os_log_type_t v71 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v70, v71))
            {
              *(_WORD *)uint64_t v91 = 0;
              _os_log_impl(&dword_2106D5000, v70, v71, "Crypto Binding TLV validation failed", v91, 2u);
            }
            *(_DWORD *)(v4 + 112) = 2;
            if (*v31) {
              *(_OWORD *)CFDataRef v90 = v89;
            }
            make_result((uint64_t)v90, 2u);
            unsigned int v72 = 2001;
            goto LABEL_111;
          }
          *((unsigned char *)v5 + 348) = 1;
        }
        if (*((void *)v5 + 10))
        {
          if (*((unsigned char *)v5 + 348)
            && *((unsigned char *)v5 + 297)
            && *((void *)v5 + 11)
            && *((void *)v5 + 12)
            && *((void *)v5 + 15)
            && save_pac((uint64_t *)v5 + 11))
          {
            make_pac_ack((uint64_t)v90, 1u);
            *((unsigned char *)v5 + 346) = 1;
            uint64_t v68 = EAPLogGetLogHandle();
            os_log_type_t v69 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v68, v69))
            {
              *(_WORD *)uint64_t v91 = 0;
              _os_log_impl(&dword_2106D5000, v68, v69, "EAP-FAST: PAC was provisioned", v91, 2u);
            }
          }
          else
          {
            make_pac_ack((uint64_t)v90, 2u);
          }
        }
        if (v55)
        {
          *(_DWORD *)(v4 + 148) = 1;
          eapfast_compute_session_key(v4);
          if (*((unsigned char *)v5 + 298))
          {
            if (!*((void *)v5 + 10) && !*((void *)v5 + 42) && !*((unsigned char *)v5 + 344))
            {
              *((unsigned char *)v5 + 344) = 1;
              make_pac_request((uint64_t)v90);
            }
          }
        }
        if (*v31) {
          goto LABEL_112;
        }
        goto LABEL_2;
      }
      uint64_t v52 = *(void *)(v4 + 152);
      if (!v52 || !EAPClientModulePluginEAPType(v52))
      {
        uint64_t v45 = EAPLogGetLogHandle();
        os_log_type_t v46 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v45, v46)) {
          goto LABEL_109;
        }
        *(_WORD *)uint64_t v91 = 0;
        os_log_type_t v47 = "Intermediate Result TLV supplied but no inner EAP method negotiated";
        goto LABEL_48;
      }
      unsigned int v53 = bswap32(*(unsigned __int16 *)(*((void *)v5 + 7) + 4)) >> 16;
      if (v53 == 2)
      {
        uint64_t v45 = EAPLogGetLogHandle();
        os_log_type_t v46 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v45, v46)) {
          goto LABEL_109;
        }
        *(_WORD *)uint64_t v91 = 0;
        os_log_type_t v47 = "Intermediate Result TLV Failure";
        goto LABEL_48;
      }
      if (v53 != 1)
      {
        uint64_t v65 = EAPLogGetLogHandle();
        os_log_type_t v66 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v65, v66)) {
          goto LABEL_109;
        }
        *(_DWORD *)uint64_t v91 = 67109120;
        LODWORD(v92) = v53;
        os_log_type_t v47 = "Intermediate Result TLV: unrecognized status = %d";
        int v48 = v65;
        os_log_type_t v49 = v66;
        uint32_t v50 = 8;
        goto LABEL_49;
      }
      if (*((void *)v5 + 8))
      {
        make_intermediate_result((uint64_t)v90);
        goto LABEL_65;
      }
      uint64_t v45 = EAPLogGetLogHandle();
      os_log_type_t v46 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)uint64_t v91 = 0;
        os_log_type_t v47 = "Crypto Binding TLV is missing";
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v45 = EAPLogGetLogHandle();
      os_log_type_t v46 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)uint64_t v91 = 0;
        os_log_type_t v47 = "zero-length TLV";
LABEL_48:
        int v48 = v45;
        os_log_type_t v49 = v46;
        uint32_t v50 = 2;
LABEL_49:
        _os_log_impl(&dword_2106D5000, v48, v49, v47, v91, v50);
      }
    }
LABEL_109:
    *(_DWORD *)(v4 + 112) = 2;
LABEL_110:
    make_result((uint64_t)v90, 2u);
    unsigned int v72 = 2002;
LABEL_111:
    make_error((uint64_t)v90, v72);
    goto LABEL_112;
  }
LABEL_2:
  os_log_type_t v7 = (unsigned __int8 *)*((void *)v5 + 6);
  if (v7)
  {
    char __n_7 = 0;
    unsigned int __n = 0;
    if (v6) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = *(unsigned char *)(v3 + 8) == 0;
    }
    if (!v8)
    {
      int v9 = CFStringCreateMutable(0, 0);
      uint64_t Length = EAPPacketGetLength((uint64_t)(v7 + 4));
      EAPPacketIsValid(v7 + 4, Length, v9);
      os_log_type_t v11 = EAPLogGetLogHandle();
      os_log_type_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_2106D5000, v11, v12, "EAP-FAST Receive EAP Payload:\n%@", buf, 0xCu);
      }
      CFRelease(v9);
    }
    int v13 = v7[4];
    if ((v13 - 2) < 3) {
      goto LABEL_11;
    }
    if (v13 != 1) {
      return 0;
    }
    int v36 = v7[8];
    if (v36 == 2)
    {
      char v37 = v7[5];
      os_log_type_t v38 = 0;
      int v40 = 2;
      int v39 = 0;
    }
    else
    {
      if (v36 != 1)
      {
        unsigned int __n = 2048;
LABEL_11:
        int v14 = eapfast_eap_process(v3, v7 + 4, (char *)v91, (signed int *)&__n, v2, &__n_7);
        goto LABEL_12;
      }
      char v37 = v7[5];
      os_log_type_t v38 = *(void **)(v3 + 40);
      int v39 = *(_DWORD *)(v3 + 48);
      int v40 = 1;
    }
    int v14 = EAPPacketCreate((char *)v91, 2048, 2, v37, v40, v38, v39, (signed int *)&__n);
LABEL_12:
    os_log_type_t v15 = (unsigned __int8 *)v14;
    if (v14)
    {
      if (*(unsigned char *)(v3 + 8))
      {
        __int16 v16 = CFStringCreateMutable(0, 0);
        uint64_t v17 = EAPPacketGetLength((uint64_t)v15);
        EAPPacketIsValid(v15, v17, v16);
        uint64_t v18 = EAPLogGetLogHandle();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl(&dword_2106D5000, v18, v19, "EAP-FAST Send EAP Payload:\n%@", buf, 0xCu);
        }
        CFRelease(v16);
      }
      size_t v20 = (int)__n;
      unsigned int v21 = __n + 4;
      int v22 = v90[2] - v90[3];
      if (v90[2] - v90[3] < (int)(__n + 4))
      {
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v22;
          _os_log_impl(&dword_2106D5000, v23, v24, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", buf, 0xEu);
        }
        int v25 = EAPLogGetLogHandle();
        os_log_type_t v26 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v25, v26))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v25, v26, "EAP-FAST: make_eap(): buffer too small", buf, 2u);
        }
        uint64_t v27 = EAPLogGetLogHandle();
        os_log_type_t v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v27, v28, "failed to insert EAP Payload TLV", buf, 2u);
        }
        *(_DWORD *)(v4 + 112) = 2;
        return 0;
      }
      uint64_t v44 = (_WORD *)(*(void *)v90 + v90[3]);
      v90[3] += v21;
      v44[1] = bswap32(__n) >> 16;
      *uint64_t v44 = 2432;
      memcpy(v44 + 2, v15, v20);
      if (v15 != v91)
      {
        if (__n_7) {
          EAPClientModulePluginFreePacket(*(void *)(v4 + 152), v4 + 160, (uint64_t)v15);
        }
        else {
          free(v15);
        }
      }
      goto LABEL_112;
    }
    return 0;
  }
LABEL_112:
  size_t v73 = v90[3];
  size_t processed = v90[3];
  if (!v90[3])
  {
    os_log_type_t v78 = EAPLogGetLogHandle();
    os_log_type_t v79 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v78, v79))
    {
      *(_WORD *)uint64_t v91 = 0;
      _os_log_impl(&dword_2106D5000, v78, v79, "nothing to send?", v91, 2u);
    }
    return 0;
  }
  *(void *)uint64_t v5 = 0;
  if (*(unsigned char *)(v3 + 8))
  {
    os_log_type_t v74 = CFStringCreateMutable(0, 0);
    *(void *)buf = v74;
    CFStringAppendFormat(v74, 0, @"======== Send TLVs: ========\n");
    int v75 = *(const void **)v90;
    TLVListParse(0, *(unsigned __int16 **)v90, v73, v74);
    SecTrustRef v76 = EAPLogGetLogHandle();
    os_log_type_t v77 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v76, v77))
    {
      *(_DWORD *)uint64_t v91 = 138412290;
      uint64_t v92 = (uint64_t)v74;
      _os_log_impl(&dword_2106D5000, v76, v77, "%@", v91, 0xCu);
    }
    my_CFRelease((const void **)buf);
  }
  else
  {
    int v75 = *(const void **)v90;
  }
  uint64_t v80 = SSLWrite(*(SSLContextRef *)v4, v75, v73, &processed);
  BOOL v41 = v80 == 0;
  if (v80)
  {
    uint64_t v81 = v80;
    os_log_type_t v82 = EAPLogGetLogHandle();
    os_log_type_t v83 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = EAPSSLErrorString(v81);
      *(_DWORD *)uint64_t v91 = 136315394;
      uint64_t v92 = v84;
      __int16 v93 = 1024;
      int v94 = v81;
      _os_log_impl(&dword_2106D5000, v82, v83, "SSLWrite failed, %s (%d)", v91, 0x12u);
    }
  }
  if (*(_DWORD *)(v4 + 112) == 2) {
    SSLClose(*(SSLContextRef *)v4);
  }
  return v41;
}

BOOL TLVListParse(uint64_t a1, unsigned __int16 *a2, uint64_t a3, CFMutableStringRef theString)
{
  uint64_t v5 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(void *)(a1 + 128) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  if (!a3) {
    return 1;
  }
  BOOL v8 = 0;
  uint64_t v34 = (void *)(a1 + 80);
  while (2)
  {
    if (v5 <= 3)
    {
      if (theString) {
        goto LABEL_63;
      }
      LogHandle = EAPLogGetLogHandle();
      uint64_t v19 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(LogHandle, (os_log_type_t)v19);
      if (!result) {
        return result;
      }
      goto LABEL_67;
    }
    uint64_t v9 = bswap32(a2[1]) >> 16;
    if (v9 + 4 > (unint64_t)(int)v5)
    {
      if (theString)
      {
LABEL_63:
        CFStringAppendFormat(theString, 0, @"EAP-FAST: TLV is too short (%d < %d)", v5, 4);
        return 0;
      }
      LogHandle = EAPLogGetLogHandle();
      uint64_t v19 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(LogHandle, (os_log_type_t)v19);
      if (!result) {
        return result;
      }
LABEL_67:
      *(_DWORD *)buf = 67109376;
      int v36 = v5;
      __int16 v37 = 1024;
      LODWORD(v38) = 4;
      size_t v20 = "EAP-FAST: TLV is too short (%d < %d)";
      unsigned int v21 = LogHandle;
      os_log_type_t v22 = v19;
LABEL_105:
      uint32_t v25 = 14;
LABEL_106:
      _os_log_impl(&dword_2106D5000, v21, v22, v20, buf, v25);
      return 0;
    }
    int v10 = (int)bswap32(*a2) >> 16;
    uint64_t v11 = v10 & 0x3FFF;
    if (theString)
    {
      os_log_type_t v12 = "Unknown";
      if ((v11 - 3) <= 0x11) {
        os_log_type_t v12 = off_264133DC8[v11 - 3];
      }
      int v13 = (const char *)&unk_21070AD61;
      if (v10 < 0) {
        int v13 = " [mandatory]";
      }
      CFStringAppendFormat(theString, 0, @"%s TLV (type=%d) Length=%d%s\n", v12, v10 & 0x3FFF, v9, v13);
      print_data_cfstr(theString, (uint64_t)(a2 + 2), v9);
    }
    switch(v10 & 0x3FFF)
    {
      case 3:
        if (v9 <= 1)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: Result TLV is too short (%d < %d)", v9, 2);
            return 0;
          }
          uint64_t v23 = EAPLogGetLogHandle();
          os_log_type_t v24 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v23, v24);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            int v36 = v9;
            __int16 v37 = 1024;
            LODWORD(v38) = 2;
            size_t v20 = "EAP-FAST: Result TLV is too short (%d < %d)";
            goto LABEL_104;
          }
          return result;
        }
        unsigned int v14 = bswap32(a2[2]);
        unsigned int v15 = HIWORD(v14);
        if (HIWORD(v14) == 2)
        {
          CFStringRef v16 = @"Failure\n";
          if (!theString) {
            goto LABEL_55;
          }
          goto LABEL_54;
        }
        if (v15 == 1)
        {
          CFStringRef v16 = @"Success\n";
          if (!theString)
          {
LABEL_55:
            if (!a1) {
              goto LABEL_58;
            }
            if (!*(void *)a1)
            {
              *(void *)a1 = a2;
              *(_WORD *)(a1 + 8) = v15;
              goto LABEL_58;
            }
            if (theString)
            {
              CFStringAppendFormat(theString, 0, @"EAP-FAST: multiple Result TLV's defined", v32, v33);
              return 0;
            }
            os_log_type_t v26 = EAPLogGetLogHandle();
            uint64_t v27 = _SC_syslog_os_log_mapping();
            BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
            if (result)
            {
              *(_WORD *)buf = 0;
              size_t v20 = "EAP-FAST: multiple Result TLV's defined";
              goto LABEL_123;
            }
            return result;
          }
LABEL_54:
          CFStringAppendFormat(theString, 0, v16);
          goto LABEL_55;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, @"EAP-FAST: Result TLV unrecognized status = %d", HIWORD(v14), v33);
          return 0;
        }
        uint64_t v30 = EAPLogGetLogHandle();
        uint64_t v31 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v30, (os_log_type_t)v31);
        if (result)
        {
          *(_DWORD *)buf = 67109120;
          int v36 = v15;
          size_t v20 = "EAP-FAST: Result TLV unrecognized status = %d";
          unsigned int v21 = v30;
          os_log_type_t v22 = v31;
          uint32_t v25 = 8;
          goto LABEL_106;
        }
        break;
      case 4:
        if (v9 > 5)
        {
          if (a1)
          {
            if (!*(void *)(a1 + 16)) {
              *(void *)(a1 + 16) = a2;
            }
          }
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, @"EAP-FAST: NAK TLV is too short (%d < %d)", v9, 6);
          return 0;
        }
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          int v36 = v9;
          __int16 v37 = 1024;
          LODWORD(v38) = 6;
          size_t v20 = "EAP-FAST: NAK TLV is too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 5:
        if (v9 > 3)
        {
          if (theString) {
            CFStringAppendFormat(theString, 0, @"ErrorCode = %d\n", bswap32(*((_DWORD *)a2 + 1)));
          }
          if (a1 && !*(void *)(a1 + 24))
          {
            *(void *)(a1 + 24) = a2;
            *(_DWORD *)(a1 + 32) = bswap32(*((_DWORD *)a2 + 1));
          }
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, @"EAP-FAST: Error TLV is too short (%d < %d)", v9, 4);
          return 0;
        }
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          int v36 = v9;
          __int16 v37 = 1024;
          LODWORD(v38) = 4;
          size_t v20 = "EAP-FAST: Error TLV is too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 7:
        if (v9 > 3) {
          goto LABEL_30;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, @"EAP-FAST: Vendor Specific TLV too short (%d < %d)", v9, 4);
          return 0;
        }
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v23, v24);
        if (result)
        {
          *(_DWORD *)buf = 67109376;
          int v36 = v9;
          __int16 v37 = 1024;
          LODWORD(v38) = 4;
          size_t v20 = "EAP-FAST: Vendor Specific TLV too short (%d < %d)";
          goto LABEL_104;
        }
        return result;
      case 9:
        if (!a1) {
          goto LABEL_37;
        }
        if (*(void *)(a1 + 40))
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: EAP Payload TLV appears multiple times", v32, v33);
            return 0;
          }
          os_log_type_t v26 = EAPLogGetLogHandle();
          uint64_t v27 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            size_t v20 = "EAP-FAST: EAP Payload TLV appears multiple times";
            goto LABEL_123;
          }
        }
        else
        {
          *(void *)(a1 + 40) = a2;
LABEL_37:
          if (EAPPacketIsValid((unsigned __int8 *)a2 + 4, v9, 0)) {
            goto LABEL_58;
          }
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: EAP Payload TLV invalid");
            EAPPacketIsValid((unsigned __int8 *)a2 + 4, v9, theString);
            return 0;
          }
          os_log_type_t v26 = EAPLogGetLogHandle();
          uint64_t v27 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            size_t v20 = "EAP-FAST: EAP Payload TLV invalid";
            goto LABEL_123;
          }
        }
        return result;
      case 0xA:
        if (v9 <= 1)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: Intermediate Result TLV too short (%d < %d)", v9, 2);
            return 0;
          }
          uint64_t v23 = EAPLogGetLogHandle();
          os_log_type_t v24 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v23, v24);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            int v36 = v9;
            __int16 v37 = 1024;
            LODWORD(v38) = 2;
            size_t v20 = "EAP-FAST: Intermediate Result TLV too short (%d < %d)";
LABEL_104:
            unsigned int v21 = v23;
            os_log_type_t v22 = v24;
            goto LABEL_105;
          }
        }
        else
        {
          if (!a1) {
            goto LABEL_58;
          }
          if (!*(void *)(a1 + 48))
          {
            *(void *)(a1 + 48) = a2;
            goto LABEL_58;
          }
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: multiple Intermediate Result TLV's", v32, v33);
            return 0;
          }
          os_log_type_t v26 = EAPLogGetLogHandle();
          uint64_t v27 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            size_t v20 = "EAP-FAST: multiple Intermediate Result TLV's";
            goto LABEL_123;
          }
        }
        return result;
      case 0xB:
        if (a1 && !*(void *)(a1 + 72)) {
          BOOL v8 = v34;
        }
        if (PACTLVAttributeListParse(v8, a2 + 2, v9, theString))
        {
          if (v8) {
            *(void *)(a1 + 72) = a2;
          }
          goto LABEL_58;
        }
        if (theString)
        {
          CFStringAppendFormat(theString, 0, @"EAP-FAST: PAC TLV parse failed", v32, v33);
          return 0;
        }
        os_log_type_t v26 = EAPLogGetLogHandle();
        uint64_t v27 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
        if (result)
        {
          *(_WORD *)buf = 0;
          size_t v20 = "EAP-FAST: PAC TLV parse failed";
          goto LABEL_123;
        }
        return result;
      case 0xC:
        if (v9 <= 0x37)
        {
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: Crypto Binding TLV too short (%d < %ld)", v9, 56);
            return 0;
          }
          os_log_type_t v28 = EAPLogGetLogHandle();
          os_log_type_t v29 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v28, v29);
          if (result)
          {
            *(_DWORD *)buf = 67109376;
            int v36 = v9;
            __int16 v37 = 2048;
            uint64_t v38 = 56;
            size_t v20 = "EAP-FAST: Crypto Binding TLV too short (%d < %ld)";
            unsigned int v21 = v28;
            os_log_type_t v22 = v29;
            uint32_t v25 = 18;
            goto LABEL_106;
          }
        }
        else
        {
          if (!a1) {
            goto LABEL_58;
          }
          if (!*(void *)(a1 + 56))
          {
            *(void *)(a1 + 56) = a2;
            goto LABEL_58;
          }
          if (theString)
          {
            CFStringAppendFormat(theString, 0, @"EAP-FAST: multiple Crypto Binding TLV's defined", v32, v33);
            return 0;
          }
          os_log_type_t v26 = EAPLogGetLogHandle();
          uint64_t v27 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v26, (os_log_type_t)v27);
          if (result)
          {
            *(_WORD *)buf = 0;
            size_t v20 = "EAP-FAST: multiple Crypto Binding TLV's defined";
LABEL_123:
            unsigned int v21 = v26;
            os_log_type_t v22 = v27;
            uint32_t v25 = 2;
            goto LABEL_106;
          }
        }
        return result;
      default:
LABEL_30:
        if (a1 && v10 < 0 && !*(void *)(a1 + 64)) {
          *(void *)(a1 + 64) = a2;
        }
LABEL_58:
        a2 = (unsigned __int16 *)((char *)a2 + v9 + 4);
        uint64_t v5 = (v5 - (v9 + 4));
        if (!v5) {
          return 1;
        }
        continue;
    }
    return result;
  }
}

uint64_t TLVListParse_0(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (!a3) {
    return 1;
  }
  int v6 = 0;
  int v7 = a3;
  while (1)
  {
    if (v7 <= 1)
    {
      snprintf((char *)(a1 + 96), 0xA0uLL, "Missing/truncated attribute at offset %d");
      goto LABEL_15;
    }
    uint64_t v8 = a2[1];
    uint64_t v9 = 4 * v8;
    if (4 * (int)v8 > v7) {
      break;
    }
    int v10 = TLVCheckValidity(a1, a2);
    if (v10)
    {
      if (v10 == 1) {
        goto LABEL_15;
      }
      if (((char)*a2 & 0x80000000) == 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "unrecognized attribute %d");
        goto LABEL_15;
      }
    }
    else
    {
      TLVListAddAttribute((_DWORD *)a1, (uint64_t)a2);
    }
    v6 += v9;
    a2 += v9;
    int v7 = a3 - v6;
    if (a3 == v6) {
      return 1;
    }
  }
  EAPSIMAKAAttributeTypeGetString(*a2);
  snprintf((char *)(a1 + 96), 0xA0uLL, "%s too large %d (> %d) at offset %d");
LABEL_15:
  os_log_type_t v12 = *(void **)a1;
  if (*(void *)a1) {
    BOOL v13 = v12 == (void *)(a1 + 8);
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    free(v12);
  }
  uint64_t result = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 88) = 0;
  return result;
}

char *eapfast_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, unsigned char *a6)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)a1;
  uint64_t v38 = 0;
  *a6 = 0;
  int v12 = *a2;
  if (v12 == 2)
  {
    int v22 = a2[4];
    uint64_t v23 = *(void *)(v11 + 152);
    if (v23) {
      LODWORD(v23) = EAPClientModulePluginEAPType(v23);
    }
    if (v23 != v22) {
      return (char *)v38;
    }
    goto LABEL_15;
  }
  if (v12 == 1)
  {
    int v13 = a2[4];
    if (!a2[4]) {
      return (char *)v38;
    }
    uint64_t v15 = *(void *)(v11 + 152);
    if (v15) {
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    }
    if (v15 != v13)
    {
      CFStringRef v16 = (int *)(v11 + 33264);
      int v17 = a2[4];
      if (*(unsigned char *)(v11 + 33467))
      {
        if (v17 != 26)
        {
          if (!*v16)
          {
            *CFStringRef v16 = 1;
            LOBYTE(v16) = 26;
LABEL_41:
            buf[0] = v16;
            return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
          }
LABEL_32:
          int v31 = 5;
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v29 = 0;
        while (inner_auth_types[v29] != v17)
        {
          if (++v29 == 4)
          {
            uint64_t v30 = *v16;
            if ((int)v30 > 3) {
              goto LABEL_32;
            }
            *CFStringRef v16 = v30 + 1;
            LODWORD(v16) = inner_auth_types[v30];
            goto LABEL_41;
          }
        }
      }
      eap_client_free((uint64_t *)a1);
      int v18 = a2[4];
      uint64_t v19 = *(void *)a1;
      *(_DWORD *)(v19 + 328) = 0;
      *(void *)(v19 + 336) = 0;
      if (*(void *)(v19 + 152))
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v21))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, LogHandle, v21, "already initialized", buf, 2u);
        }
        goto LABEL_15;
      }
      uint64_t v32 = EAPClientModuleLookup(v18);
      if (v32)
      {
        uint64_t v33 = (uint64_t)v32;
        my_CFRelease((const void **)(v19 + 312));
        my_CFRelease((const void **)(v19 + 320));
        *(_OWORD *)(v19 + 160) = 0u;
        *(void *)(v19 + 304) = 0;
        *(_OWORD *)(v19 + 272) = 0u;
        *(_OWORD *)(v19 + 288) = 0u;
        *(_OWORD *)(v19 + 240) = 0u;
        *(_OWORD *)(v19 + 256) = 0u;
        *(_OWORD *)(v19 + 208) = 0u;
        *(_OWORD *)(v19 + 224) = 0u;
        *(_OWORD *)(v19 + 176) = 0u;
        *(_OWORD *)(v19 + 192) = 0u;
        *(_DWORD *)(v19 + 176) = *(_DWORD *)(a1 + 16);
        *(void *)(v19 + 200) = *(void *)(a1 + 40);
        *(_DWORD *)(v19 + 208) = *(_DWORD *)(a1 + 48);
        *(void *)(v19 + 224) = *(void *)(a1 + 64);
        *(_DWORD *)(v19 + 232) = *(_DWORD *)(a1 + 72);
        eap_client_set_properties((CFDictionaryRef *)a1);
        *(void *)(v19 + 184) = *(void *)(a1 + 24);
        *(_DWORD *)(v19 + 192) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(v19 + 344) = EAPClientModulePluginInit(v33, v19 + 160, v19 + 312, v19 + 348);
        *(void *)(v19 + 336) = EAPClientModulePluginEAPName(v33);
        *(_DWORD *)(v19 + 328) = v18;
        if (!*(_DWORD *)(v19 + 344))
        {
          *(void *)(v19 + 152) = v33;
          goto LABEL_15;
        }
      }
      int v28 = *(_DWORD *)(v11 + 344);
      if (v28 == 3) {
        goto LABEL_24;
      }
      uint64_t v34 = EAPLogGetLogHandle();
      os_log_type_t v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        int v36 = a2[4];
        *(_DWORD *)buf = 67109120;
        int v40 = v36;
        _os_log_impl(&dword_2106D5000, v34, v35, "eap_client_init type %d failed", buf, 8u);
      }
      int v31 = *(_DWORD *)(v11 + 344);
LABEL_39:
      *a5 = v31;
      *(_DWORD *)(v11 + 112) = 2;
      return (char *)v38;
    }
  }
LABEL_15:
  if (*(void *)(v11 + 152))
  {
    my_CFRelease((const void **)(v11 + 312));
    my_CFRelease((const void **)(v11 + 320));
    uint64_t v24 = *(void *)a1;
    uint64_t v25 = *(void *)a1 + 160;
    *(void *)(v24 + 200) = *(void *)(a1 + 40);
    *(_DWORD *)(v24 + 208) = *(_DWORD *)(a1 + 48);
    *(void *)(v24 + 224) = *(void *)(a1 + 64);
    *(_DWORD *)(v24 + 232) = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(v24 + 180) = *(_DWORD *)(a1 + 20);
    eap_client_set_properties((CFDictionaryRef *)a1);
    int v26 = EAPClientModulePluginProcess(*(void *)(v24 + 152), v25, (uint64_t)a2, (uint64_t)&v38, v24 + 344, v24 + 348);
    uint64_t v27 = v38;
    if (v38)
    {
      *a6 = 1;
      *a4 = EAPPacketGetLength(v27);
    }
    *(void *)(v11 + 320) = EAPClientModulePluginPublishProperties(*(void *)(v11 + 152), v11 + 160);
    if (v26 == 2)
    {
      *(_DWORD *)(v11 + 148) = 2;
      int v28 = *(_DWORD *)(v11 + 344);
      goto LABEL_24;
    }
    if (v26 == 1)
    {
      *(_DWORD *)(v11 + 148) = 1;
      return (char *)v38;
    }
    if (!v26 && *(_DWORD *)(v11 + 344) == 3)
    {
      *(void *)(v11 + 312) = EAPClientModulePluginRequireProperties(*(void *)(v11 + 152), v11 + 160);
      int v28 = *(_DWORD *)(v11 + 344);
      *(_DWORD *)(v11 + 140) = v28;
LABEL_24:
      *a5 = v28;
    }
  }
  return (char *)v38;
}

void eap_client_free(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 152);
  if (v2)
  {
    EAPClientModulePluginFree(v2, v1 + 160);
    *(void *)(v1 + 152) = 0;
    my_CFRelease((const void **)(v1 + 240));
    *(void *)(v1 + 304) = 0;
    *(_OWORD *)(v1 + 272) = 0u;
    *(_OWORD *)(v1 + 288) = 0u;
    *(_OWORD *)(v1 + 240) = 0u;
    *(_OWORD *)(v1 + 256) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 224) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
  }
  my_CFRelease((const void **)(v1 + 312));
  my_CFRelease((const void **)(v1 + 320));
  *(_DWORD *)(v1 + 328) = 0;
  *(void *)(v1 + 336) = 0;
  *(void *)(v1 + 344) = 0;
}

void eap_client_free_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  if (v2)
  {
    EAPClientModulePluginFree(v2, a1 + 160);
    *(void *)(a1 + 152) = 0;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(void *)(a1 + 304) = 0;
  }
  my_CFRelease((const void **)(a1 + 312));
  my_CFRelease((const void **)(a1 + 320));
  *(_DWORD *)(a1 + 328) = 0;
  *(void *)(a1 + 336) = 0;
  *(void *)(a1 + 344) = 0;
}

void eap_client_free_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 296);
  if (v2)
  {
    EAPClientModulePluginFree(v2, a1 + 304);
    *(void *)(a1 + 296) = 0;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(void *)(a1 + 448) = 0;
  }
  my_CFRelease((const void **)(a1 + 456));
  my_CFRelease((const void **)(a1 + 464));
  *(_DWORD *)(a1 + 472) = 0;
  *(void *)(a1 + 480) = 0;
  *(void *)(a1 + 488) = 0;
}

void eap_client_set_properties(CFDictionaryRef *a1)
{
  CFDictionaryRef v2 = *a1;
  if (*((unsigned char *)*a1 + 33467))
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1[10]);
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
    CFDataRef v5 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v2 + 33509, 16, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    CFDictionarySetValue(MutableCopy, @"EAPMSCHAPv2ServerChallenge", v5);
    CFRelease(v5);
    CFDataRef v6 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v2 + 33525, 16, v4);
    CFDictionarySetValue(MutableCopy, @"EAPMSCHAPv2ClientChallenge", v6);
    CFRelease(v6);
    my_CFRelease((const void **)v2 + 30);
    *((void *)v2 + 30) = MutableCopy;
  }
  else
  {
    my_CFRelease((const void **)v2 + 30);
    *((void *)v2 + 30) = CFRetain(a1[10]);
  }
}

uint64_t eapgtc_init(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  return 0;
}

uint64_t eapgtc_process(uint64_t a1, const char *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v5 = *(unsigned __int8 *)a2;
  if (v5 == 4)
  {
    *a4 = 1;
    return 2;
  }
  else if (v5 == 3)
  {
    return 1;
  }
  else
  {
    uint64_t result = 0;
    if (v5 == 1)
    {
      if (*(void *)(a1 + 64))
      {
        int v10 = *(_DWORD *)(a1 + 72);
        int v11 = v10 + 5;
        if ((unint64_t)EAPPacketGetLength((uint64_t)a2) - 15 <= 0xFFFFFFFFFFFFFFF5
          && !strncmp(a2 + 5, "CHALLENGE=", 0xAuLL))
        {
          int v11 = v10 + *(_DWORD *)(a1 + 48) + 15;
          int v12 = 1;
        }
        else
        {
          int v12 = 0;
        }
        int v13 = malloc_type_malloc(v11, 0xB66F2FA2uLL);
        unsigned int v14 = v13;
        if (v13)
        {
          *int v13 = 2;
          v13[1] = a2[1];
          EAPPacketSetLength((uint64_t)v13, (unsigned __int16)v11);
          v14[4] = 6;
          uint64_t v15 = v14 + 5;
          if (v12)
          {
            v14[13] = 61;
            void *v15 = *(void *)"RESPONSE=";
            memcpy(v14 + 14, *(const void **)(a1 + 40), *(unsigned int *)(a1 + 48));
            int v16 = *(_DWORD *)(a1 + 48);
            v14[v16 + 14] = 0;
            uint64_t v15 = (void *)((char *)v15 + v16 + 10);
          }
          memcpy(v15, *(const void **)(a1 + 64), *(unsigned int *)(a1 + 72));
        }
        uint64_t result = 0;
        *a3 = v14;
      }
      else
      {
        uint64_t result = 0;
        *a4 = 3;
      }
    }
  }
  return result;
}

void eapgtc_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

void make_result(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 5)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      int v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 6;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    uint64_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2106D5000, v8, v9, "EAP-FAST: make_result(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    uint64_t v4 = *(void *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 6;
    *(_DWORD *)uint64_t v4 = 33555328;
    *(_WORD *)(v4 + 4) = __rev16(a2);
  }
}

void eapfast_free(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    eap_client_free(a1);
    if (*(void *)v2)
    {
      CFRelease(*(CFTypeRef *)v2);
      *(void *)uint64_t v2 = 0;
    }
    uint64_t v3 = *(void **)(v2 + 33424);
    if (v3) {
      BOOL v4 = v3 == (void *)(v2 + 33432);
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      free(v3);
    }
    my_CFRelease((const void **)(v2 + 120));
    my_CFRelease((const void **)(v2 + 33408));
    memoryIOClearBuffers(v2 + 88);
    my_CFRelease((const void **)(v2 + 33456));
    free((void *)v2);
  }
  *a1 = 0;
}

uint64_t peap_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v5 = (char *)malloc_type_malloc(0x608uLL, 0x10F0040A535B1BCuLL);
  bzero(v5, 0x608uLL);
  v5[108] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSCertificateIsRequired", 0);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  v5[1536] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSEnableSessionResumption", 1);
  memoryIOInit((void *)v5 + 10, v5 + 8, v5 + 40);
  *(void *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t peap_process(uint64_t a1, unsigned __int8 *a2, void *a3, int *a4, _DWORD *a5)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)a1;
  *a4 = 0;
  *a5 = 0;
  *(unsigned char *)(v7 + 128) = 0;
  *a3 = 0;
  int v8 = *a2;
  switch(v8)
  {
    case 4:
      int v21 = *(_DWORD *)(v7 + 144);
      if (v21 == 2) {
        goto LABEL_15;
      }
      if (*(_DWORD *)(v7 + 124) == 1 && *(unsigned char *)(v7 + 140))
      {
        int v21 = 2;
        goto LABEL_15;
      }
      break;
    case 3:
      int v21 = *(_DWORD *)(v7 + 144);
      if (v21 == 1)
      {
LABEL_15:
        *(_DWORD *)(v7 + 104) = v21;
        break;
      }
      *(_DWORD *)(v7 + 144) = 2;
      *(_DWORD *)(v7 + 104) = 2;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, LogHandle, v23, "Tearing down the EAP session as the server is either malicious or has a compliance issue", buf, 2u);
      }
      break;
    case 1:
      uint64_t v12 = *(void *)a1;
      unsigned int Length = EAPPacketGetLength((uint64_t)a2);
      SSLSessionState state = kSSLIdle;
      if (Length <= 5)
      {
        unsigned int v14 = EAPLogGetLogHandle();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v14, v15))
        {
LABEL_9:
          size_t v20 = 0;
LABEL_86:
          *a3 = v20;
          break;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v87 = Length;
        *(_WORD *)&v87[4] = 2048;
        *(void *)&v87[6] = 6;
        int v16 = "length %d < %ld";
        goto LABEL_7;
      }
      if (*(void *)v12)
      {
        uint64_t v24 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
        if (v24)
        {
          uint64_t v25 = v24;
          int v26 = EAPLogGetLogHandle();
          os_log_type_t v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = EAPSSLErrorString(v25);
            *(_DWORD *)buf = 136315394;
            *(void *)uint64_t v87 = v28;
            *(_WORD *)&v87[8] = 2048;
            *(void *)&v87[10] = (int)v25;
            _os_log_impl(&dword_2106D5000, v26, v27, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
          }
          size_t v20 = 0;
          *(_DWORD *)(v12 + 104) = 2;
          *(_DWORD *)(v12 + 132) = v25;
          goto LABEL_86;
        }
      }
      uint64_t v29 = (void *)(v12 + 40);
      uint64_t v30 = a2 + 6;
      unsigned int v31 = Length - 6;
      unsigned __int8 v32 = a2[5];
      if ((v32 & 0x20) != 0)
      {
        if (state != kSSLHandshake || !*v29 || *(_DWORD *)(v12 + 76) != a2[1])
        {
          SSLSessionState state = kSSLIdle;
          goto LABEL_31;
        }
        char v33 = 0;
        uint64_t v34 = "Start";
      }
      else if (Length == 6)
      {
        char v33 = 0;
        uint64_t v34 = "Ack";
      }
      else
      {
        if ((a2[5] & 0x80) != 0)
        {
          if (Length <= 9)
          {
            unsigned int v14 = EAPLogGetLogHandle();
            os_log_type_t v15 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v14, v15)) {
              goto LABEL_9;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v87 = Length;
            *(_WORD *)&v87[4] = 2048;
            *(void *)&v87[6] = 10;
            int v16 = "packet too short %d < %ld";
LABEL_7:
            int v17 = v14;
            os_log_type_t v18 = v15;
            uint32_t v19 = 18;
LABEL_8:
            _os_log_impl(&dword_2106D5000, v17, v18, v16, buf, v19);
            goto LABEL_9;
          }
          Messageunsigned int Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
          if (MessageLength <= 0x20000)
          {
            uint64_t v30 = a2 + 10;
            unsigned int v44 = Length - 10;
            uint64_t v29 = (void *)(v12 + 40);
            if (MessageLength)
            {
              uint64_t v34 = "Start";
              char v33 = 1;
              unsigned int v31 = MessageLength;
            }
            else
            {
              char v33 = 0;
              unsigned int v31 = 0;
              uint64_t v34 = "Ack";
            }
          }
          else
          {
            uint64_t v29 = (void *)(v12 + 40);
            if ((a2[5] & 0x40) != 0)
            {
              unsigned int v77 = MessageLength;
              os_log_type_t v78 = EAPLogGetLogHandle();
              os_log_type_t v79 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v78, v79)) {
                goto LABEL_9;
              }
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v87 = v77;
              *(_WORD *)&v87[4] = 1024;
              *(_DWORD *)&v87[6] = 0x20000;
              int v16 = "received message too large, %d > %d";
              int v17 = v78;
              os_log_type_t v18 = v79;
              uint32_t v19 = 14;
              goto LABEL_8;
            }
            char v33 = 1;
            *(unsigned char *)(v12 + 128) = 1;
            uint64_t v34 = "Start";
            unsigned int v44 = v31;
            uint64_t v30 = a2 + 6;
          }
          goto LABEL_45;
        }
        uint64_t v34 = "Start";
        char v33 = 1;
      }
      unsigned int v44 = v31;
LABEL_45:
      if ((state - 1) < 2)
      {
        if (*v29)
        {
          int v45 = a2[1];
          if (*(_DWORD *)(v12 + 76) == v45)
          {
LABEL_50:
            int v47 = *(_DWORD *)(v12 + 120);
            int v48 = (_DWORD *)(v12 + 72);
LABEL_77:
            size_t v20 = EAPTLSPacketCreate(2, 25, v45, v47, v29, v48);
            goto LABEL_78;
          }
          unint64_t v46 = *(void *)(v12 + 56) + *(int *)(v12 + 72);
          if (v46 < *(void *)(v12 + 48))
          {
            *(void *)(v12 + 56) = v46;
            goto LABEL_50;
          }
          uint64_t v80 = v34;
          uint64_t v81 = v30;
          unsigned int v83 = v44;
          memoryBufferClear((uint64_t)v29);
          uint64_t v34 = v80;
          uint64_t v30 = v81;
          unsigned int v44 = v83;
          *(_DWORD *)(v12 + 72) = 0;
        }
        if ((v33 & 1) == 0)
        {
          uint64_t v68 = v34;
          os_log_type_t v69 = EAPLogGetLogHandle();
          os_log_type_t v70 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v69, v70)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)uint64_t v87 = v68;
          int v16 = "unexpected %s frame";
          int v17 = v69;
          os_log_type_t v18 = v70;
          uint32_t v19 = 12;
          goto LABEL_8;
        }
        int v45 = a2[1];
        if (*(_DWORD *)(v12 + 76) == v45)
        {
          if ((a2[5] & 0x40) != 0)
          {
LABEL_104:
            int v47 = 0;
            uint64_t v29 = 0;
            int v48 = 0;
            goto LABEL_77;
          }
LABEL_111:
          if (*(unsigned char *)(v12 + 140)) {
            size_t v20 = peap_tunnel();
          }
          else {
            size_t v20 = peap_handshake((uint64_t *)a1, a2[1], a4);
          }
          goto LABEL_78;
        }
        if (!*(void *)(v12 + 8))
        {
          os_log_type_t v71 = v30;
          size_t v72 = v31;
          unsigned int v73 = v44;
          memoryBufferAllocate(v12 + 8, v72);
          unsigned int v44 = v73;
          uint64_t v30 = v71;
        }
        unsigned int v74 = v44;
        if (!memoryBufferAddData(v12 + 8, v30, v44))
        {
          int v75 = EAPLogGetLogHandle();
          os_log_type_t v76 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v75, v76)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v87 = v74;
          int v16 = "fragment too large %d";
          int v17 = v75;
          os_log_type_t v18 = v76;
          uint32_t v19 = 8;
          goto LABEL_8;
        }
        if (memoryBufferIsComplete(v12 + 8)) {
          goto LABEL_111;
        }
        if ((a2[5] & 0x40) != 0)
        {
          LOBYTE(v45) = a2[1];
          goto LABEL_104;
        }
        os_log_type_t v49 = EAPLogGetLogHandle();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v49, v50)) {
          goto LABEL_9;
        }
        *(_WORD *)buf = 0;
        int v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_55:
        int v17 = v49;
        os_log_type_t v18 = v50;
        uint32_t v19 = 2;
        goto LABEL_8;
      }
      if (state)
      {
        size_t v20 = 0;
LABEL_78:
        *(_DWORD *)(v12 + 76) = a2[1];
        int v58 = *(_DWORD *)(v12 + 124);
        if (v58 == -1)
        {
          int v58 = (a2[5] & 7) != 0;
          *(_DWORD *)(v12 + 124) = v58;
        }
        if (v20) {
          v20[5] = v20[5] & 0xF8 | v58 & 7;
        }
        goto LABEL_86;
      }
      if ((v32 & 0x20) == 0)
      {
        os_log_type_t v49 = EAPLogGetLogHandle();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v49, v50)) {
          goto LABEL_9;
        }
        *(_WORD *)buf = 0;
        int v16 = "ignoring non PEAP start frame";
        goto LABEL_55;
      }
LABEL_31:
      os_log_type_t v82 = v29;
      uint64_t v35 = *(void *)a1;
      unsigned int v85 = 0;
      int v36 = *(void **)(v35 + 352);
      if (v36 && v36 != (void *)(v35 + 360)) {
        free(v36);
      }
      *(void *)(v35 + 352) = 0;
      *(_DWORD *)(v35 + 1384) = 0;
      if (*(void *)v35)
      {
        CFRelease(*(CFTypeRef *)v35);
        *(void *)uint64_t v35 = 0;
      }
      my_CFRelease((const void **)(v35 + 1528));
      memoryIOClearBuffers(v35 + 80);
      __int16 v37 = EAPTLSMemIOContextCreate(*(const __CFDictionary **)(a1 + 80), 0, (const void *)(v35 + 80), 0, (OSStatus *)&v85);
      if (!v37)
      {
        unsigned int v53 = EAPLogGetLogHandle();
        os_log_type_t v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          uint64_t v55 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v87 = v55;
          *(_WORD *)&v87[8] = 2048;
          *(void *)&v87[10] = (int)v85;
          _os_log_impl(&dword_2106D5000, v53, v54, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
        }
LABEL_73:
        if (v85)
        {
          size_t v20 = 0;
          *(_DWORD *)(v12 + 132) = v85;
        }
        else
        {
          uint64_t v57 = SSLHandshake(*(SSLContextRef *)v12);
          if (v57 == -9803)
          {
            LOBYTE(v45) = a2[1];
            int v47 = *(_DWORD *)(v12 + 120);
            int v48 = (_DWORD *)(v12 + 72);
            uint64_t v29 = v82;
            goto LABEL_77;
          }
          uint64_t v59 = v57;
          unsigned int v60 = EAPLogGetLogHandle();
          os_log_type_t v61 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v60, v61))
          {
            uint64_t v62 = EAPSSLErrorString(v59);
            *(_DWORD *)buf = 136315394;
            *(void *)uint64_t v87 = v62;
            *(_WORD *)&v87[8] = 1024;
            *(_DWORD *)&v87[10] = v59;
            _os_log_impl(&dword_2106D5000, v60, v61, "SSLHandshake failed, %s (%d)", buf, 0x12u);
          }
          size_t v20 = 0;
          *(_DWORD *)(v12 + 132) = v59;
        }
        *(_DWORD *)(v12 + 104) = 2;
        goto LABEL_86;
      }
      uint64_t v38 = v37;
      if (*(unsigned char *)(v35 + 1536)
        && (uint64_t v39 = *(const void **)(a1 + 24)) != 0
        && (unsigned int v85 = SSLSetPeerID(v37, v39, *(unsigned int *)(a1 + 32))) != 0)
      {
        int v40 = EAPLogGetLogHandle();
        os_log_type_t v41 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v87 = v42;
          *(_WORD *)&v87[8] = 2048;
          *(void *)&v87[10] = (int)v85;
          os_log_type_t v43 = "SSLSetPeerID failed, %s (%ld)";
LABEL_71:
          _os_log_impl(&dword_2106D5000, v40, v41, v43, buf, 0x16u);
        }
      }
      else
      {
        if (!*(unsigned char *)(v35 + 108)) {
          goto LABEL_64;
        }
        CFArrayRef v51 = *(const __CFArray **)(v35 + 112);
        if (!v51)
        {
          unsigned int v85 = EAPTLSCopyIdentityTrustChain(*(void **)(a1 + 96), *(CFDictionaryRef *)(a1 + 80), (__CFArray **)(v35 + 112));
          if (v85)
          {
            int v40 = EAPLogGetLogHandle();
            os_log_type_t v41 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v40, v41))
            {
              uint64_t v56 = EAPSSLErrorString(v85);
              *(_DWORD *)buf = 136315394;
              *(void *)uint64_t v87 = v56;
              *(_WORD *)&v87[8] = 2048;
              *(void *)&v87[10] = (int)v85;
              os_log_type_t v43 = "failed to find client cert/identity, %s (%ld)";
              goto LABEL_71;
            }
            goto LABEL_72;
          }
          CFArrayRef v51 = *(const __CFArray **)(v35 + 112);
        }
        unsigned int v85 = SSLSetCertificate(v38, v51);
        if (!v85)
        {
LABEL_64:
          *(void *)uint64_t v35 = v38;
          *(_DWORD *)(v35 + 104) = 0;
          *(_WORD *)(v35 + 1396) = 0;
          *(unsigned char *)(v35 + 1526) = 0;
          *(_DWORD *)(v35 + 144) = 0;
          *(void *)(v35 + 72) = 0xFFFFFFFF00000000;
          *(void *)(v35 + 132) = 0;
          *(unsigned char *)(v35 + 140) = 0;
          *(_DWORD *)(v35 + 124) = -1;
          *(unsigned char *)(v35 + 128) = 0;
          *(unsigned char *)(v35 + 1537) = 0;
          goto LABEL_73;
        }
        int v40 = EAPLogGetLogHandle();
        os_log_type_t v41 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v52 = EAPSSLErrorString(v85);
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v87 = v52;
          *(_WORD *)&v87[8] = 2048;
          *(void *)&v87[10] = (int)v85;
          os_log_type_t v43 = "SSLSetCertificate failed, %s, (%ld)";
          goto LABEL_71;
        }
      }
LABEL_72:
      CFRelease(v38);
      goto LABEL_73;
    default:
      break;
  }
  if (*(_DWORD *)(v7 + 104) == 2)
  {
    int v63 = *(_DWORD *)(v7 + 132);
    if (v63)
    {
      *a5 = v63;
      int v64 = 1001;
    }
    else
    {
      int v64 = *(_DWORD *)(v7 + 136);
      if (v64) {
        BOOL v65 = v64 == 3;
      }
      else {
        BOOL v65 = 1;
      }
      if (v65) {
        int v64 = 1;
      }
    }
    *a4 = v64;
  }
  return *(unsigned int *)(v7 + 104);
}

void peap_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t peap_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if ((*(_DWORD *)(v2 + 328) != 6 || *(_DWORD *)(v2 + 124) || *(_DWORD *)(v2 + 104) != 1)
    && (!*(unsigned char *)(v2 + 1397) || *(_DWORD *)(v2 + 144) != 1))
  {
    return 0;
  }
  *a2 = 32;
  return v2 + 1398;
}

uint64_t EAPClientModulePluginCopyIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 128);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

unsigned char *peap_verify_server(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  int v6 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v5 + 1528), 0, 0, (_DWORD *)(v5 + 1388));
  *(_DWORD *)(v5 + 1392) = v6;
  if (!v6) {
    goto LABEL_6;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v8))
  {
    int v9 = *(_DWORD *)(v5 + 1392);
    int v10 = *(_DWORD *)(v5 + 1388);
    v13[0] = 67109376;
    v13[1] = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    _os_log_impl(&dword_2106D5000, LogHandle, v8, "server certificate not trusted status %d %d", (uint8_t *)v13, 0xEu);
  }
  int v11 = *(_DWORD *)(v5 + 1392);
  if (v11 == 3)
  {
    uint64_t result = 0;
    *(_DWORD *)(v5 + 136) = 3;
    *a3 = 3;
  }
  else
  {
    if (!v11)
    {
LABEL_6:
      uint64_t result = 0;
      *(unsigned char *)(v5 + 1396) = 1;
      return result;
    }
    *(_DWORD *)(v5 + 136) = v11;
    *a3 = v11;
    *(_DWORD *)(v5 + 132) = *(_DWORD *)(v5 + 1388);
    *(_DWORD *)(v5 + 104) = 2;
    SSLClose(*(SSLContextRef *)v5);
    return EAPTLSPacketCreate(2, 25, a2, *(_DWORD *)(v5 + 120), (void *)(v5 + 40), (_DWORD *)(v5 + 72));
  }
  return result;
}

char *peap_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, unsigned char *a6)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)a1;
  uint64_t v37 = 0;
  *a6 = 0;
  int v12 = *a2;
  if (v12 == 2)
  {
    int v21 = a2[4];
    uint64_t v22 = *(void *)(v11 + 152);
    if (v22) {
      LODWORD(v22) = EAPClientModulePluginEAPType(v22);
    }
    if (v22 != v21) {
      return 0;
    }
    goto LABEL_15;
  }
  if (v12 != 1) {
    goto LABEL_15;
  }
  int v13 = a2[4];
  if (a2[4])
  {
    uint64_t v15 = *(void *)(v11 + 152);
    if (v15) {
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    }
    if (v15 != v13)
    {
      unsigned int v16 = a2[4];
      if (v16 <= 0x1A && ((1 << v16) & 0x4000050) != 0)
      {
        eap_client_free_0(v11);
        int v17 = a2[4];
        uint64_t v18 = *(void *)a1;
        *(_DWORD *)(v18 + 328) = 0;
        *(void *)(v18 + 336) = 0;
        if (*(void *)(v18 + 152))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v20, "eap_client_init: already initialized\n", buf, 2u);
          }
          goto LABEL_15;
        }
        uint64_t v30 = EAPClientModuleLookup(v17);
        if (v30)
        {
          uint64_t v31 = (uint64_t)v30;
          my_CFRelease((const void **)(v18 + 312));
          my_CFRelease((const void **)(v18 + 320));
          *(_OWORD *)(v18 + 160) = 0u;
          *(void *)(v18 + 304) = 0;
          *(_OWORD *)(v18 + 272) = 0u;
          *(_OWORD *)(v18 + 288) = 0u;
          *(_OWORD *)(v18 + 240) = 0u;
          *(_OWORD *)(v18 + 256) = 0u;
          *(_OWORD *)(v18 + 208) = 0u;
          *(_OWORD *)(v18 + 224) = 0u;
          *(_OWORD *)(v18 + 176) = 0u;
          *(_OWORD *)(v18 + 192) = 0u;
          *(_DWORD *)(v18 + 176) = *(_DWORD *)(a1 + 16);
          *(void *)(v18 + 200) = *(void *)(a1 + 40);
          *(_DWORD *)(v18 + 208) = *(_DWORD *)(a1 + 48);
          *(void *)(v18 + 224) = *(void *)(a1 + 64);
          *(_DWORD *)(v18 + 232) = *(_DWORD *)(a1 + 72);
          *(void *)(v18 + 240) = *(void *)(a1 + 80);
          *(_DWORD *)(v18 + 344) = EAPClientModulePluginInit(v31, v18 + 160, v18 + 312, v18 + 348);
          *(void *)(v18 + 336) = EAPClientModulePluginEAPName(v31);
          *(_DWORD *)(v18 + 328) = v17;
          if (!*(_DWORD *)(v18 + 344))
          {
            *(void *)(v18 + 152) = v31;
            goto LABEL_15;
          }
        }
        if (*(_DWORD *)(v11 + 344) == 3)
        {
          *a5 = 3;
          save_last_packet(v11, a2);
          return 0;
        }
        uint64_t v34 = EAPLogGetLogHandle();
        os_log_type_t v35 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v34, v35))
        {
          int v36 = a2[4];
          *(_DWORD *)buf = 67109120;
          int v39 = v36;
          _os_log_impl(&dword_2106D5000, v34, v35, "eap_client_init type %d failed", buf, 8u);
        }
        uint64_t result = 0;
        int v33 = *(_DWORD *)(v11 + 344);
      }
      else
      {
        uint64_t v32 = *(int *)(v11 + 1384);
        if ((int)v32 <= 2)
        {
          *(_DWORD *)(v11 + 1384) = v32 + 1;
          buf[0] = inner_auth_types_0[v32];
          return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
        }
        uint64_t result = 0;
        int v33 = 5;
      }
      *a5 = v33;
      *(_DWORD *)(v11 + 104) = 2;
      return result;
    }
LABEL_15:
    if (*(void *)(v11 + 152))
    {
      my_CFRelease((const void **)(v11 + 312));
      my_CFRelease((const void **)(v11 + 320));
      uint64_t v23 = *(void *)a1;
      uint64_t v24 = *(void *)a1 + 160;
      *(void *)(v23 + 200) = *(void *)(a1 + 40);
      *(_DWORD *)(v23 + 208) = *(_DWORD *)(a1 + 48);
      *(void *)(v23 + 224) = *(void *)(a1 + 64);
      *(_DWORD *)(v23 + 232) = *(_DWORD *)(a1 + 72);
      *(_DWORD *)(v23 + 180) = *(_DWORD *)(a1 + 20);
      *(void *)(v23 + 240) = *(void *)(a1 + 80);
      int v25 = EAPClientModulePluginProcess(*(void *)(v23 + 152), v24, (uint64_t)a2, (uint64_t)&v37, v23 + 344, v23 + 348);
      uint64_t v26 = v37;
      if (v37)
      {
        *a6 = 1;
        *a4 = EAPPacketGetLength(v26);
      }
      if (v25 == 2)
      {
        *a5 = *(_DWORD *)(v11 + 344);
        int v28 = 2;
      }
      else
      {
        if (v25 != 1)
        {
          if (!v25 && *(_DWORD *)(v11 + 344) == 3)
          {
            *(void *)(v11 + 312) = EAPClientModulePluginRequireProperties(*(void *)(v11 + 152), v11 + 160);
            save_last_packet(v11, a2);
            int v27 = *(_DWORD *)(v11 + 344);
            *(_DWORD *)(v11 + 136) = v27;
            *a5 = v27;
          }
          goto LABEL_26;
        }
        int v28 = 1;
      }
      *(_DWORD *)(v11 + 144) = v28;
LABEL_26:
      *(void *)(v11 + 320) = EAPClientModulePluginPublishProperties(*(void *)(v11 + 152), v11 + 160);
      return (char *)v37;
    }
  }
  return 0;
}

void peap_free(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    eap_client_free_0(*a1);
    uint64_t v3 = *(void **)(v1 + 352);
    if (v3) {
      BOOL v4 = v3 == (void *)(v1 + 360);
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      free(v3);
    }
    *(void *)(v1 + 352) = 0;
    if (*(void *)v1)
    {
      CFRelease(*(CFTypeRef *)v1);
      *(void *)uint64_t v1 = 0;
    }
    my_CFRelease((const void **)(v1 + 112));
    my_CFRelease((const void **)(v1 + 1528));
    memoryIOClearBuffers(v1 + 80);
    free((void *)v1);
    *a1 = 0;
  }
}

uint64_t eapttls_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = (char *)malloc_type_malloc(0x638uLL, 0x10F00406210EC67uLL);
  bzero(v5, 0x638uLL);
  v5[108] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSCertificateIsRequired", 0);
  *((_DWORD *)v5 + 30) = *(_DWORD *)(a1 + 16);
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 80);
  if (v6
    && (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v6, @"TTLSInnerAuthentication"),
        CFTypeID TypeID = CFStringGetTypeID(),
        Value)
    && CFGetTypeID(Value) == TypeID
    && (int v9 = my_CFStringToCString(Value, 0x600u)) != 0)
  {
    int v10 = v9;
    uint64_t v11 = 0;
    while (strcmp((const char *)v10, auth_strings[v11]))
    {
      if (++v11 == 6)
      {
        free(v10);
        goto LABEL_9;
      }
    }
    free(v10);
    if (v11) {
      int v12 = v11;
    }
    else {
      int v12 = 5;
    }
  }
  else
  {
LABEL_9:
    int v12 = 5;
  }
  *((_DWORD *)v5 + 33) = v12;
  v5[288] = my_CFDictionaryGetBooleanValue(*(const __CFDictionary **)(a1 + 80), @"TLSEnableSessionResumption", 1);
  memoryIOInit((void *)v5 + 10, v5 + 8, v5 + 40);
  *(void *)a1 = v5;
  *a3 = 0;
  return 0;
}

uint64_t eapttls_process(uint64_t *a1, unsigned __int8 *a2, void *a3, int *a4, _DWORD *a5)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v8 = *a2;
  if (v8 == 4)
  {
    int v21 = 2;
LABEL_16:
    *(_DWORD *)(v7 + 104) = v21;
    goto LABEL_78;
  }
  if (v8 != 3)
  {
    if (v8 != 1) {
      goto LABEL_78;
    }
    uint64_t v12 = *a1;
    unsigned int Length = EAPPacketGetLength((uint64_t)a2);
    SSLSessionState state = kSSLIdle;
    if (Length <= 5)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v15))
      {
LABEL_9:
        os_log_type_t v20 = 0;
LABEL_77:
        *a3 = v20;
        goto LABEL_78;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)CFDataRef v90 = Length;
      *(_WORD *)&int v90[4] = 2048;
      *(void *)&v90[6] = 6;
      unsigned int v16 = "length %d < %ld";
      goto LABEL_7;
    }
    if (*(void *)v12)
    {
      uint64_t v22 = SSLGetSessionState(*(SSLContextRef *)v12, &state);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = EAPLogGetLogHandle();
        os_log_type_t v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = EAPSSLErrorString(v23);
          *(_DWORD *)buf = 136315394;
          *(void *)CFDataRef v90 = v26;
          *(_WORD *)&v90[8] = 2048;
          *(void *)&v90[10] = (int)v23;
          _os_log_impl(&dword_2106D5000, v24, v25, "SSLGetSessionState failed, %s (%ld)", buf, 0x16u);
        }
        os_log_type_t v20 = 0;
        *(_DWORD *)(v12 + 104) = 2;
        *(_DWORD *)(v12 + 124) = v23;
        goto LABEL_77;
      }
    }
    uint64_t v86 = v12;
    int v27 = (void *)(v12 + 40);
    int v28 = a2 + 6;
    unsigned int v29 = Length - 6;
    unsigned __int8 v30 = a2[5];
    if ((v30 & 0x20) != 0)
    {
      if (state != kSSLHandshake || !*v27 || *(_DWORD *)(v12 + 76) != a2[1])
      {
        SSLSessionState state = kSSLIdle;
        goto LABEL_30;
      }
      char v31 = 0;
      uint64_t v32 = "Start";
    }
    else if (Length == 6)
    {
      char v31 = 0;
      uint64_t v32 = "Ack";
    }
    else
    {
      if ((a2[5] & 0x80) != 0)
      {
        if (Length <= 9)
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v15 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v15)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)CFDataRef v90 = Length;
          *(_WORD *)&int v90[4] = 2048;
          *(void *)&v90[6] = 10;
          unsigned int v16 = "packet too short %d < %ld";
LABEL_7:
          int v17 = LogHandle;
          os_log_type_t v18 = v15;
          uint32_t v19 = 18;
LABEL_8:
          _os_log_impl(&dword_2106D5000, v17, v18, v16, buf, v19);
          goto LABEL_9;
        }
        os_log_type_t v66 = (void *)(v12 + 40);
        Messageunsigned int Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a2);
        unsigned int v29 = MessageLength;
        if (MessageLength > 0x20000)
        {
          uint64_t v68 = EAPLogGetLogHandle();
          os_log_type_t v69 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v68, v69))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)CFDataRef v90 = v29;
            *(_WORD *)&int v90[4] = 1024;
            *(_DWORD *)&v90[6] = 0x20000;
            _os_log_impl(&dword_2106D5000, v68, v69, "received message too large, %d > %d", buf, 0xEu);
          }
          os_log_type_t v20 = 0;
          uint64_t v56 = v86;
          goto LABEL_72;
        }
        int v28 = a2 + 10;
        unsigned int v42 = Length - 10;
        if (MessageLength)
        {
          uint64_t v32 = "Start";
          char v31 = 1;
        }
        else
        {
          char v31 = 0;
          uint64_t v32 = "Ack";
        }
        int v27 = v66;
        goto LABEL_41;
      }
      uint64_t v32 = "Start";
      char v31 = 1;
    }
    unsigned int v42 = v29;
LABEL_41:
    if ((state - 1) < 2)
    {
      if (*v27)
      {
        int v43 = a2[1];
        uint64_t v44 = v86;
        if (*(_DWORD *)(v86 + 76) == v43)
        {
LABEL_46:
          int v46 = *(_DWORD *)(v86 + 120);
          int v47 = (_DWORD *)(v86 + 72);
LABEL_75:
          os_log_type_t v20 = EAPTLSPacketCreate(2, 21, v43, v46, v27, v47);
          goto LABEL_76;
        }
        unint64_t v45 = *(void *)(v86 + 56) + *(int *)(v86 + 72);
        if (v45 < *(void *)(v86 + 48))
        {
          *(void *)(v86 + 56) = v45;
          goto LABEL_46;
        }
        unsigned int v85 = v28;
        os_log_type_t v70 = v32;
        unsigned int v84 = v42;
        memoryBufferClear((uint64_t)v27);
        unsigned int v42 = v84;
        uint64_t v32 = v70;
        int v28 = v85;
        *(_DWORD *)(v86 + 72) = 0;
      }
      if ((v31 & 1) == 0)
      {
        if (state != kSSLConnected
          || (uint64_t v72 = *a1, !*(unsigned char *)(*a1 + 289))
          || !*(unsigned char *)(v72 + 148)
          || *(unsigned char *)(v72 + 137))
        {
          unsigned int v73 = v32;
          unsigned int v74 = EAPLogGetLogHandle();
          os_log_type_t v75 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v74, v75)) {
            goto LABEL_9;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)CFDataRef v90 = v73;
          unsigned int v16 = "unexpected %s frame";
          int v17 = v74;
          os_log_type_t v18 = v75;
          uint32_t v19 = 12;
          goto LABEL_8;
        }
        os_log_type_t v82 = EAPLogGetLogHandle();
        os_log_type_t v83 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v82, v83))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v82, v83, "server forcing re-auth after resume", buf, 2u);
        }
        os_log_type_t v20 = eapttls_do_inner_auth(a1, a2[1]);
        goto LABEL_61;
      }
      int v71 = a2[1];
      if (*(_DWORD *)(v86 + 76) == v71)
      {
        if ((a2[5] & 0x40) != 0)
        {
          os_log_type_t v20 = EAPTLSPacketCreate(2, 21, v71, 0, 0, 0);
          goto LABEL_61;
        }
LABEL_110:
        uint64_t v44 = v86;
        if (*(unsigned char *)(v86 + 136)) {
          os_log_type_t v20 = eapttls_tunnel(a1, (uint64_t)a2, a4);
        }
        else {
          os_log_type_t v20 = eapttls_handshake(a1, a2[1], a4);
        }
        goto LABEL_76;
      }
      uint64_t v76 = v86 + 8;
      if (!*(void *)(v86 + 8))
      {
        unsigned int v77 = v28;
        unsigned int v78 = v42;
        memoryBufferAllocate(v86 + 8, v29);
        unsigned int v42 = v78;
        int v28 = v77;
      }
      unsigned int v79 = v42;
      if (!memoryBufferAddData(v76, v28, v42))
      {
        uint64_t v80 = EAPLogGetLogHandle();
        os_log_type_t v81 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v80, v81)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)CFDataRef v90 = v79;
        unsigned int v16 = "fragment too large %d";
        int v17 = v80;
        os_log_type_t v18 = v81;
        uint32_t v19 = 8;
        goto LABEL_8;
      }
      if (memoryBufferIsComplete(v76)) {
        goto LABEL_110;
      }
      uint64_t v44 = v86;
      if ((a2[5] & 0x40) != 0)
      {
        LOBYTE(v43) = a2[1];
        int v46 = 0;
        int v27 = 0;
        int v47 = 0;
        goto LABEL_75;
      }
      int v48 = EAPLogGetLogHandle();
      os_log_type_t v49 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v48, v49)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      unsigned int v16 = "expecting more data but more fragments bit is not set, ignoring";
LABEL_51:
      int v17 = v48;
      os_log_type_t v18 = v49;
      uint32_t v19 = 2;
      goto LABEL_8;
    }
    if (state)
    {
      os_log_type_t v20 = 0;
LABEL_61:
      uint64_t v44 = v86;
LABEL_76:
      *(_DWORD *)(v44 + 76) = a2[1];
      goto LABEL_77;
    }
    if ((v30 & 0x20) == 0)
    {
      int v48 = EAPLogGetLogHandle();
      os_log_type_t v49 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v48, v49)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      unsigned int v16 = "ignoring non TTLS start frame";
      goto LABEL_51;
    }
LABEL_30:
    int v33 = v27;
    uint64_t v34 = *a1;
    unsigned int v88 = 0;
    if (*(void *)v34)
    {
      CFRelease(*(CFTypeRef *)v34);
      *(void *)uint64_t v34 = 0;
    }
    my_CFRelease((const void **)(v34 + 280));
    memoryIOClearBuffers(v34 + 80);
    os_log_type_t v35 = EAPTLSMemIOContextCreate((const __CFDictionary *)a1[10], 0, (const void *)(v34 + 80), 0, (OSStatus *)&v88);
    if (!v35)
    {
      uint64_t v52 = EAPLogGetLogHandle();
      os_log_type_t v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(void *)CFDataRef v90 = v54;
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = (int)v88;
        _os_log_impl(&dword_2106D5000, v52, v53, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
      }
      goto LABEL_70;
    }
    int v36 = v35;
    if (*(unsigned char *)(v34 + 288)
      && (uint64_t v37 = (const void *)a1[3]) != 0
      && (unsigned int v88 = SSLSetPeerID(v35, v37, *((unsigned int *)a1 + 8))) != 0)
    {
      uint64_t v38 = EAPLogGetLogHandle();
      os_log_type_t v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(void *)CFDataRef v90 = v40;
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = (int)v88;
        os_log_type_t v41 = "SSLSetPeerID failed, %s (%ld)";
LABEL_68:
        _os_log_impl(&dword_2106D5000, v38, v39, v41, buf, 0x16u);
      }
    }
    else
    {
      if (!*(unsigned char *)(v34 + 108)) {
        goto LABEL_59;
      }
      CFArrayRef v50 = *(const __CFArray **)(v34 + 112);
      if (!v50)
      {
        unsigned int v88 = EAPTLSCopyIdentityTrustChain((void *)a1[12], (CFDictionaryRef)a1[10], (__CFArray **)(v34 + 112));
        if (v88)
        {
          uint64_t v38 = EAPLogGetLogHandle();
          os_log_type_t v39 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v55 = EAPSSLErrorString(v88);
            *(_DWORD *)buf = 136315394;
            *(void *)CFDataRef v90 = v55;
            *(_WORD *)&v90[8] = 2048;
            *(void *)&v90[10] = (int)v88;
            os_log_type_t v41 = "failed to find client cert/identity, %s (%ld)";
            goto LABEL_68;
          }
          goto LABEL_69;
        }
        CFArrayRef v50 = *(const __CFArray **)(v34 + 112);
      }
      unsigned int v88 = SSLSetCertificate(v36, v50);
      if (!v88)
      {
LABEL_59:
        *(void *)uint64_t v34 = v36;
        *(_DWORD *)(v34 + 104) = 0;
        *(_DWORD *)(v34 + 124) = 0;
        *(_DWORD *)(v34 + 128) = 0;
        *(_WORD *)(v34 + 136) = 0;
        *(_WORD *)(v34 + 148) = 0;
        *(_DWORD *)(v34 + 292) = 0;
        *(unsigned char *)(v34 + 278) = 0;
        *(void *)(v34 + 72) = 0xFFFFFFFF00000000;
        *(unsigned char *)(v34 + 289) = 0;
LABEL_70:
        if (!v88)
        {
          uint64_t v44 = v86;
          uint64_t v57 = SSLHandshake(*(SSLContextRef *)v86);
          if (v57 != -9803)
          {
            uint64_t v62 = v57;
            int v63 = EAPLogGetLogHandle();
            os_log_type_t v64 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v63, v64))
            {
              uint64_t v65 = EAPSSLErrorString(v62);
              *(_DWORD *)buf = 136315394;
              *(void *)CFDataRef v90 = v65;
              *(_WORD *)&v90[8] = 2048;
              *(void *)&v90[10] = (int)v62;
              _os_log_impl(&dword_2106D5000, v63, v64, "SSLHandshake failed, %s (%ld)", buf, 0x16u);
            }
            os_log_type_t v20 = 0;
            *(_DWORD *)(v86 + 124) = v62;
            *(_DWORD *)(v86 + 104) = 2;
            goto LABEL_77;
          }
          LOBYTE(v43) = a2[1];
          int v46 = *(_DWORD *)(v86 + 120);
          int v47 = (_DWORD *)(v86 + 72);
          int v27 = v33;
          goto LABEL_75;
        }
        os_log_type_t v20 = 0;
        uint64_t v56 = v86;
        *(_DWORD *)(v86 + 124) = v88;
LABEL_72:
        *(_DWORD *)(v56 + 104) = 2;
        goto LABEL_77;
      }
      uint64_t v38 = EAPLogGetLogHandle();
      os_log_type_t v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v51 = EAPSSLErrorString(v88);
        *(_DWORD *)buf = 136315394;
        *(void *)CFDataRef v90 = v51;
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = (int)v88;
        os_log_type_t v41 = "SSLSetCertificate failed, %s (%ld)";
        goto LABEL_68;
      }
    }
LABEL_69:
    CFRelease(v36);
    goto LABEL_70;
  }
  if (*(unsigned char *)(v7 + 136) && !*(unsigned char *)(v7 + 148)) {
    *a3 = eapttls_verify_server(a1, a2[1], a4);
  }
  if (*(unsigned char *)(v7 + 148))
  {
    int v21 = 1;
    goto LABEL_16;
  }
LABEL_78:
  if (*(_DWORD *)(v7 + 104) == 2)
  {
    int v58 = *(_DWORD *)(v7 + 124);
    if (v58)
    {
      *a5 = v58;
      int v59 = 1001;
    }
    else
    {
      int v59 = *(_DWORD *)(v7 + 128);
      if (v59) {
        BOOL v60 = v59 == 3;
      }
      else {
        BOOL v60 = 1;
      }
      if (v60) {
        int v59 = 1;
      }
    }
    *a4 = v59;
  }
  return *(unsigned int *)(v7 + 104);
}

void eapttls_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

__CFDictionary *eapttls_publish_props(uint64_t *a1)
{
  SSLCipherSuite cipherSuite = 0;
  uint64_t v1 = *a1;
  CFArrayRef v2 = *(const __CFArray **)(*a1 + 280);
  if (!v2) {
    return 0;
  }
  CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
  __int16 v14 = CFDataArray;
  if (!CFDataArray) {
    return 0;
  }
  BOOL v4 = CFDataArray;
  if (*(_DWORD *)(v1 + 132) == 5 && *(unsigned char *)(v1 + 136) && (CFDictionaryRef v5 = *(const __CFDictionary **)(v1 + 464)) != 0) {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  uint64_t v7 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"TLSServerCertificateChain", v4);
  int v8 = (const void **)MEMORY[0x263EFFB40];
  if (!*(unsigned char *)(v1 + 289)) {
    int v8 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(v7, @"TLSSessionWasResumed", *v8);
  my_CFRelease((const void **)&v14);
  SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
  if (cipherSuite)
  {
    LODWORD(valuePtr) = cipherSuite;
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v7, @"TLSNegotiatedCipher", v9);
    CFRelease(v9);
  }
  if (*(void *)(v1 + 296))
  {
    int v10 = *(const char **)(v1 + 480);
    int v15 = *(_DWORD *)(v1 + 472);
    if (v15)
    {
      if (v10)
      {
        valuePtr = CFStringCreateWithCString(0, v10, 0x600u);
        CFDictionarySetValue(v7, @"InnerEAPTypeName", valuePtr);
        my_CFRelease(&valuePtr);
      }
      valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v7, @"InnerEAPType", valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 128) == 3 && !*(unsigned char *)(v1 + 148))
  {
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 144));
    CFDictionarySetValue(v7, @"TLSTrustClientStatus", v11);
    CFRelease(v11);
  }
  return v7;
}

uint64_t eapttls_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 149)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 150;
}

unsigned char *eapttls_verify_server(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  int v6 = EAPTLSVerifyServerCertificateChain((const __CFDictionary *)a1[10], *(CFArrayRef *)(v5 + 280), 0, 0, (_DWORD *)(v5 + 140));
  *(_DWORD *)(v5 + 144) = v6;
  if (!v6) {
    goto LABEL_6;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v8))
  {
    int v10 = *(_DWORD *)(v5 + 140);
    int v9 = *(_DWORD *)(v5 + 144);
    v13[0] = 67109376;
    v13[1] = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    _os_log_impl(&dword_2106D5000, LogHandle, v8, "server certificate not trusted status %d %d", (uint8_t *)v13, 0xEu);
  }
  int v11 = *(_DWORD *)(v5 + 144);
  if (v11 == 3)
  {
    uint64_t result = 0;
    *(_DWORD *)(v5 + 128) = 3;
    *a3 = 3;
  }
  else
  {
    if (!v11)
    {
LABEL_6:
      uint64_t result = 0;
      *(unsigned char *)(v5 + 148) = 1;
      return result;
    }
    *(_DWORD *)(v5 + 128) = v11;
    *a3 = v11;
    *(_DWORD *)(v5 + 124) = *(_DWORD *)(v5 + 140);
    *(_DWORD *)(v5 + 104) = 2;
    SSLClose(*(SSLContextRef *)v5);
    return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v5 + 120), (void *)(v5 + 40), (_DWORD *)(v5 + 72));
  }
  return result;
}

unsigned char *eapttls_start_inner_auth(uint64_t *a1, char a2)
{
  if (*(unsigned char *)(*a1 + 289)) {
    return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(*a1 + 120), (void *)(*a1 + 40), (_DWORD *)(*a1 + 72));
  }
  else {
    return eapttls_do_inner_auth(a1, a2);
  }
}

unsigned char *eapttls_do_inner_auth(uint64_t *a1, char a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  *(unsigned char *)(v4 + 137) = 1;
  switch(*(_DWORD *)(v4 + 132))
  {
    case 1:
      *(void *)size_t processed = 0;
      int v5 = *((_DWORD *)a1 + 18) + 15;
      unint64_t v6 = (*((_DWORD *)a1 + 12) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v7 = malloc_type_malloc((int)((v5 & 0xFFFFFFF0) + v6 + 16), 0x4FEF4D95uLL);
      if (v7)
      {
        os_log_type_t v8 = v7;
        uint64_t v9 = (int)(v5 & 0xFFFFFFF0);
        *uint64_t v7 = 0x1000000;
        size_t v10 = *((unsigned int *)a1 + 12);
        v7[1] = bswap32((v10 + 8) & 0xFFFFFF);
        int v11 = v7 + 2;
        memmove(v7 + 2, (const void *)a1[5], v10);
        uint64_t v12 = *((unsigned int *)a1 + 12);
        if (v6 > v12) {
          bzero((char *)v11 + v12, (v6 - v12));
        }
        int v13 = (_DWORD *)((char *)v11 + v6);
        *int v13 = 0x2000000;
        v13[1] = bswap32(v5 & 0xFFFFF0 | 8);
        __int16 v14 = (char *)v11 + v6 + 8;
        memmove(v14, (const void *)a1[8], *((unsigned int *)a1 + 18));
        uint64_t v15 = *((unsigned int *)a1 + 18);
        if (v9 > v15) {
          bzero(&v14[v15], (v9 - v15));
        }
        uint64_t v16 = SSLWrite(*(SSLContextRef *)v4, v8, &v14[v9] - v8, (size_t *)processed);
        if (!v16) {
          goto LABEL_65;
        }
        uint64_t v17 = v16;
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v19)) {
          goto LABEL_65;
        }
        goto LABEL_63;
      }
      int v46 = EAPLogGetLogHandle();
      os_log_type_t v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        *(_WORD *)buf = 0;
        os_log_type_t v25 = "malloc failed";
        goto LABEL_74;
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (void *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 2:
      size_t v88 = 0;
      int v20 = *((_DWORD *)a1 + 12);
      uint64_t v21 = EAPTLSComputeKeyData();
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24)) {
          goto LABEL_12;
        }
      }
      else
      {
        unint64_t v48 = (v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        int v49 = v48 + 57;
        if ((int)v48 + 57 <= 0) {
          int v50 = -(-(v48 + 57) & 3);
        }
        else {
          int v50 = (v48 + 57) & 3;
        }
        int v51 = v48 - v50 + 61;
        uint64_t v52 = malloc_type_malloc(v51, 0xD9AFA31DuLL);
        if (v52)
        {
          os_log_type_t v8 = v52;
          *uint64_t v52 = 0x1000000;
          size_t v53 = *((unsigned int *)a1 + 12);
          v52[1] = bswap32((v53 + 8) & 0xFFFFFF);
          uint64_t v54 = v52 + 2;
          memmove(v52 + 2, (const void *)a1[5], v53);
          uint64_t v55 = *((unsigned int *)a1 + 12);
          if (v48 > v55) {
            bzero((char *)v54 + v55, (v48 - v55));
          }
          uint64_t v56 = (char *)v54 + v48;
          *(void *)uint64_t v56 = 0x180000003C000000;
          *(_OWORD *)(v56 + 8) = *(_OWORD *)processed;
          *((void *)v56 + 3) = 0x1900000003000000;
          v56[32] = processed[16];
          chap_md5(processed[16], (const void *)a1[8], *((_DWORD *)a1 + 18), processed, 0x10u, (unsigned __int8 *)v56 + 33);
          bzero(v56 + 49, v51 - v49);
          uint64_t v57 = SSLWrite(*(SSLContextRef *)v4, v8, &v56[v51 - v49 + 49] - v8, &v88);
          if (!v57) {
            goto LABEL_65;
          }
          uint64_t v17 = v57;
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v19 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(LogHandle, v19)) {
            goto LABEL_65;
          }
          goto LABEL_63;
        }
        int v46 = EAPLogGetLogHandle();
        os_log_type_t v47 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v46, v47))
        {
          *(_WORD *)buf = 0;
          os_log_type_t v25 = "malloc failed";
          goto LABEL_74;
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (void *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 3:
      size_t v85 = 0;
      int v26 = *((_DWORD *)a1 + 12);
      uint64_t v27 = EAPTLSComputeKeyData();
      if (v27)
      {
        uint64_t v22 = v27;
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
LABEL_12:
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = EAPSSLErrorString(v22);
          *(_WORD *)&buf[12] = 2048;
          *(void *)&unsigned char buf[14] = (int)v22;
          os_log_type_t v25 = "EAPTLSComputeKeyData failed, %s (%ld)";
          goto LABEL_19;
        }
      }
      else
      {
        unint64_t v58 = (v26 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        int v59 = v58 + 90;
        if ((int)v58 + 90 <= 0) {
          int v60 = -(-(v58 + 90) & 3);
        }
        else {
          int v60 = (v58 + 90) & 3;
        }
        int v61 = v58 - v60 + 94;
        uint64_t v62 = malloc_type_malloc(v61, 0xD5FA7FCBuLL);
        if (v62)
        {
          os_log_type_t v8 = v62;
          *uint64_t v62 = 0x1000000;
          size_t v63 = *((unsigned int *)a1 + 12);
          v62[1] = bswap32((v63 + 8) & 0xFFFFFF);
          os_log_type_t v64 = v62 + 2;
          memmove(v62 + 2, (const void *)a1[5], v63);
          uint64_t v65 = *((unsigned int *)a1 + 12);
          if (v58 > v65) {
            bzero((char *)v64 + v65, (v58 - v65));
          }
          os_log_type_t v66 = (char *)v64 + v58;
          *(void *)os_log_type_t v66 = 0x140000800B000000;
          *((_DWORD *)v66 + 2) = 922812416;
          *(void *)(v66 + 12) = v88;
          *(void *)(v66 + 20) = 0x3E00008001000000;
          *((_DWORD *)v66 + 7) = 922812416;
          v66[32] = v89;
          v66[33] = 1;
          *(void *)(v66 + 50) = 0;
          *(void *)(v66 + 42) = 0;
          *(void *)(v66 + 34) = 0;
          MSChap(&v88, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)buf);
          long long v67 = *(_OWORD *)buf;
          *(void *)(v66 + 74) = *(void *)&buf[16];
          *(_OWORD *)(v66 + 58) = v67;
          bzero(v66 + 82, v61 - v59);
          uint64_t v68 = SSLWrite(*(SSLContextRef *)v4, v8, &v66[v61 - v59 + 82] - v8, &v85);
          if (v68)
          {
            uint64_t v69 = v68;
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v19 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v19))
            {
              uint64_t v70 = EAPSSLErrorString(v69);
              *(_DWORD *)size_t processed = 136315394;
              *(void *)&processed[4] = v70;
              *(_WORD *)&processed[12] = 2048;
              *(void *)&processed[14] = (int)v69;
              int v71 = processed;
              goto LABEL_64;
            }
          }
          goto LABEL_65;
        }
        int v46 = EAPLogGetLogHandle();
        os_log_type_t v47 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v46, v47))
        {
          *(_WORD *)buf = 0;
          os_log_type_t v25 = "malloc failed";
          goto LABEL_74;
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (void *)(v4 + 40), (_DWORD *)(v4 + 72));
    case 5:
      *(void *)size_t processed = 0;
      int v34 = *((_DWORD *)a1 + 12);
      int v35 = v34 + 13;
      if (v34 + 13 <= 0) {
        int v36 = -(-(v34 + 13) & 3);
      }
      else {
        int v36 = (v34 + 13) & 3;
      }
      int v37 = v34 - v36 + 17;
      if (!v36) {
        int v37 = v35;
      }
      size_t v38 = v37;
      os_log_type_t v39 = (char *)malloc_type_malloc(v37, 0x3DDE01F1uLL);
      if (v39)
      {
        os_log_type_t v8 = v39;
        *(_DWORD *)os_log_type_t v39 = 1325400064;
        *((_DWORD *)v39 + 1) = bswap32(v35 & 0xFFFFFF);
        *((_WORD *)v39 + 4) = 2;
        uint64_t v40 = (unsigned __int8 *)(v39 + 8);
        EAPPacketSetLength((uint64_t)(v39 + 8), (unsigned __int16)(*((_WORD *)a1 + 24) + 5));
        v8[12] = 1;
        memmove(v8 + 13, (const void *)a1[5], *((unsigned int *)a1 + 12));
        if ((int)v38 > v35) {
          bzero(&v40[*((unsigned int *)a1 + 12) + 5], (int)v38 - v35);
        }
        if (*((unsigned char *)a1 + 8))
        {
          CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
          uint64_t Length = EAPPacketGetLength((uint64_t)v40);
          EAPPacketIsValid(v40, Length, Mutable);
          int v43 = EAPLogGetLogHandle();
          os_log_type_t v44 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v43, v44))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = Mutable;
            _os_log_impl(&dword_2106D5000, v43, v44, "TTLS Send EAP Payload:\n%@", buf, 0xCu);
          }
          CFRelease(Mutable);
        }
        uint64_t v45 = SSLWrite(*(SSLContextRef *)v4, v8, v38, (size_t *)processed);
        if (!v45) {
          goto LABEL_65;
        }
        uint64_t v17 = v45;
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v19)) {
          goto LABEL_65;
        }
        goto LABEL_63;
      }
      int v46 = EAPLogGetLogHandle();
      os_log_type_t v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        *(_WORD *)buf = 0;
        os_log_type_t v25 = "malloc failed";
        goto LABEL_74;
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (void *)(v4 + 40), (_DWORD *)(v4 + 72));
    default:
      *(void *)size_t processed = 0;
      int v28 = *((_DWORD *)a1 + 12);
      uint64_t v29 = EAPTLSComputeKeyData();
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v23 = EAPLogGetLogHandle();
        os_log_type_t v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = EAPSSLErrorString(v30);
          *(_WORD *)&buf[12] = 2048;
          *(void *)&unsigned char buf[14] = (int)v30;
          os_log_type_t v25 = "EAPTLSComputeKeyData failed, %s (%ld)";
LABEL_19:
          char v31 = v23;
          os_log_type_t v32 = v24;
          uint32_t v33 = 22;
LABEL_75:
          _os_log_impl(&dword_2106D5000, v31, v32, v25, buf, v33);
        }
      }
      else
      {
        unint64_t v72 = (v28 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        int v73 = v72 + 98;
        if ((int)v72 + 98 <= 0) {
          int v74 = -(-(v72 + 98) & 3);
        }
        else {
          int v74 = (v72 + 98) & 3;
        }
        int v75 = v72 - v74 + 102;
        uint64_t v76 = malloc_type_malloc(v75, 0x5B78A69CuLL);
        if (v76)
        {
          os_log_type_t v8 = v76;
          _DWORD *v76 = 0x1000000;
          size_t v77 = *((unsigned int *)a1 + 12);
          v76[1] = bswap32((v77 + 8) & 0xFFFFFF);
          unsigned int v78 = v76 + 2;
          memmove(v76 + 2, (const void *)a1[5], v77);
          uint64_t v79 = *((unsigned int *)a1 + 12);
          if (v72 > v79) {
            bzero((char *)v78 + v79, (v72 - v79));
          }
          uint64_t v80 = (char *)v78 + v72;
          *(void *)uint64_t v80 = 0x1C0000800B000000;
          *((_DWORD *)v80 + 2) = 922812416;
          *(_OWORD *)(v80 + 12) = *(_OWORD *)(v4 + 1572);
          *(void *)(v80 + 28) = 0x3E00008019000000;
          *((_DWORD *)v80 + 9) = 922812416;
          *((_WORD *)v80 + 20) = *(unsigned __int8 *)(v4 + 1588);
          MSChapFillWithRandom((_DWORD *)(v4 + 1532), 0x10u);
          *(_OWORD *)(v80 + 42) = *(_OWORD *)(v4 + 1532);
          *(void *)(v80 + 58) = 0;
          MSChap2((const void *)(v4 + 1572), (const void *)(v4 + 1532), (char *)a1[5], (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v4 + 1548);
          long long v81 = *(_OWORD *)(v4 + 1548);
          *(void *)(v80 + 82) = *(void *)(v4 + 1564);
          *(_OWORD *)(v80 + 66) = v81;
          bzero(v80 + 90, v75 - v73);
          uint64_t v82 = SSLWrite(*(SSLContextRef *)v4, v8, &v80[v75 - v73 + 90] - v8, (size_t *)processed);
          if (v82)
          {
            uint64_t v17 = v82;
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v19 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v19))
            {
LABEL_63:
              uint64_t v83 = EAPSSLErrorString(v17);
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = v83;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&unsigned char buf[14] = (int)v17;
              int v71 = buf;
LABEL_64:
              _os_log_impl(&dword_2106D5000, LogHandle, v19, "SSLWrite failed, %s (%ld)", v71, 0x16u);
            }
          }
LABEL_65:
          free(v8);
        }
        else
        {
          int v46 = EAPLogGetLogHandle();
          os_log_type_t v47 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v46, v47))
          {
            *(_WORD *)buf = 0;
            os_log_type_t v25 = "malloc failed";
LABEL_74:
            char v31 = v46;
            os_log_type_t v32 = v47;
            uint32_t v33 = 2;
            goto LABEL_75;
          }
        }
      }
      return EAPTLSPacketCreate(2, 21, a2, *(_DWORD *)(v4 + 120), (void *)(v4 + 40), (_DWORD *)(v4 + 72));
  }
}

_DWORD *MSChapFillWithRandom(_DWORD *result, unsigned int a2)
{
  if (a2 >= 4)
  {
    uint64_t v2 = result;
    unsigned int v3 = a2 >> 2;
    do
    {
      uint64_t result = (_DWORD *)arc4random();
      *v2++ = result;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t MSChap2(const void *a1, const void *a2, char *a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ChallengeHash(a2, a1, a3, &v13);
  CC_LONG v9 = password_to_unicode(a4, a5, data);
  CC_MD4(data, v9, (unsigned __int8 *)&md);
  return ChallengeResponse(&v13, &md, a6, v10, v11);
}

uint64_t ChallengeHash(const void *a1, const void *a2, char *__s, void *a4)
{
  int v5 = __s;
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(&v11, 0, sizeof(v11));
  os_log_type_t v8 = strrchr(__s, 92);
  if (v8) {
    int v5 = v8 + 1;
  }
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, a2, 0x10u);
  CC_LONG v9 = strlen(v5);
  CC_SHA1_Update(&v11, v5, v9);
  uint64_t result = CC_SHA1_Final(md, &v11);
  *a4 = *(void *)md;
  return result;
}

uint64_t ChallengeResponse(void *a1, long long *a2, uint64_t a3, double a4, uint8x8_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v14 = 0;
  int v13 = 0;
  long long v12 = *a2;
  DesEncrypt(a1, (uint64_t)&v12, (void *)a3, *(uint8x8_t *)&v12, a5);
  DesEncrypt(a1, (uint64_t)&v12 + 7, (void *)(a3 + 8), v7, v8);
  return DesEncrypt(a1, (unint64_t)&v12 | 0xE, (void *)(a3 + 16), v9, v10);
}

uint64_t DesEncrypt(void *dataIn, uint64_t a2, void *dataOut, uint8x8_t a4, uint8x8_t a5)
{
  uint64_t v5 = 0;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v6 = *(unsigned __int8 *)(a2 + 4);
  a4.i32[0] = *(_DWORD *)a2;
  int16x8_t v7 = (int16x8_t)vmovl_u8(a4);
  char key = v7.i8[0] & 0xFE;
  a5.i32[0] = *(_DWORD *)(a2 + 1);
  int v8 = *(unsigned __int8 *)(a2 + 5);
  char v14 = ((v8 | (v6 << 8)) >> 5) & 0xFE;
  *(int8x8_t *)v7.i8 = vand_s8((int8x8_t)vshl_u16((uint16x4_t)vorr_s8((int8x8_t)vshl_n_s16(*(int16x4_t *)v7.i8, 8uLL), (int8x8_t)*(_OWORD *)&vmovl_u8(a5)), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0xFE00FE00FE00FELL);
  unsigned __int32 v13 = vmovn_s16(v7).u32[0];
  int v9 = *(unsigned __int8 *)(a2 + 6);
  char v15 = ((v9 | (v8 << 8)) >> 6) & 0xFE;
  char v16 = 2 * v9;
  do
  {
    *(&key + v5) = odd_parity[*(&key + v5)];
    ++v5;
  }
  while (v5 != 8);
  size_t dataOutMoved = 0;
  uint64_t result = CCCrypt(0, 1u, 0, &key, 8uLL, 0, dataIn, 8uLL, dataOut, 8uLL, &dataOutMoved);
  if (result) {
    return fprintf((FILE *)*MEMORY[0x263EF8348], "DESEncrypt: CCCrypt failed with %d\n", result);
  }
  return result;
}

BOOL MSChap2AuthResponseValid(UInt8 *a1, unsigned int a2, const void *a3, const void *a4, const void *a5, char *a6, const void *a7)
{
  v23[1] = *MEMORY[0x263EF8340];
  CC_LONG v12 = password_to_unicode(a1, a2, data);
  memset(&c, 0, sizeof(c));
  CC_MD4(data, v12, md);
  CC_MD4(md, 0x10u, v21);
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, v21, 0x10u);
  CC_SHA1_Update(&c, a3, 0x18u);
  CC_SHA1_Update(&c, &magic1, 0x27u);
  CC_SHA1_Final(v22, &c);
  ChallengeHash(a4, a5, a6, v23);
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, v22, 0x14u);
  CC_SHA1_Update(&c, v23, 8u);
  CC_SHA1_Update(&c, &magic2, 0x29u);
  CC_SHA1_Final(v22, &c);
  uint64_t v13 = 0;
  *(_WORD *)long long md = 15699;
  char v14 = v20;
  do
  {
    snprintf(__str, 3uLL, "%02X", v22[v13]);
    *(_WORD *)(v14 - 1) = *(_WORD *)__str;
    ++v13;
    v14 += 2;
  }
  while (v13 != 20);
  return memcmp(md, a7, 0x2AuLL) == 0;
}

uint64_t EAPClientModulePluginServerKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 80);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 0;
  }
}

uint64_t eapttls_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 149)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 182;
}

void eapttls_free(uint64_t *a1)
{
  uint64_t v1 = (CFTypeRef *)*a1;
  if (*a1)
  {
    eap_client_free_1(*a1);
    if (*v1)
    {
      CFRelease(*v1);
      CFTypeRef *v1 = 0;
    }
    my_CFRelease(v1 + 14);
    my_CFRelease(v1 + 35);
    memoryIOClearBuffers((uint64_t)(v1 + 10));
    free(v1);
    *a1 = 0;
  }
}

const char *EAPSecurityErrorString(int a1)
{
  if (a1 <= -9842)
  {
    switch(a1)
    {
      case -25300:
        return "errSecItemNotFound";
      case -25299:
        return "errSecDuplicateItem";
      case -25291:
        return "errSecNotAvailable";
      default:
        return "<unknown>";
    }
  }
  else
  {
    switch(a1)
    {
      case -9841:
        return "errSSLServerAuthCompleted";
      case -9840:
        return "<unknown>";
      case -9839:
        return "errSSLPeerUserCancelled";
      case -9838:
        return "errSSLPeerInternalError";
      case -9837:
        return "errSSLPeerInsufficientSecurity";
      case -9836:
        return "errSSLPeerProtocolVersion";
      case -9835:
        return "errSSLPeerExportRestriction";
      case -9834:
        return "errSSLPeerDecryptError";
      case -9833:
        return "errSSLPeerDecodeError";
      case -9832:
        return "errSSLPeerAccessDenied";
      case -9831:
        return "errSSLPeerUnknownCA";
      case -9830:
        return "errSSLIllegalParam";
      case -9829:
        return "errSSLPeerCertUnknown";
      case -9828:
        return "errSSLPeerCertExpired";
      case -9827:
        return "errSSLPeerCertRevoked";
      case -9826:
        return "errSSLPeerUnsupportedCert";
      case -9825:
        return "errSSLPeerBadCert";
      case -9824:
        return "errSSLPeerHandshakeFail";
      case -9823:
        return "errSSLPeerDecompressFail";
      case -9822:
        return "errSSLPeerRecordOverflow";
      case -9821:
        return "errSSLPeerDecryptionFail";
      case -9820:
        return "errSSLPeerBadRecordMac";
      case -9819:
        return "errSSLPeerUnexpectedMsg";
      case -9818:
        return "errSSLBadCipherSuite";
      case -9817:
        return "errSSLBufferOverflow";
      case -9816:
        return "errSSLClosedNoNotify";
      case -9815:
        return "errSSLCertNotYetValid";
      case -9814:
        return "errSSLCertExpired";
      case -9813:
        return "errSSLNoRootCert";
      case -9812:
        return "errSSLUnknownRootCert";
      case -9811:
        return "errSSLModuleAttach";
      case -9810:
        return "errSSLInternal";
      case -9809:
        return "errSSLCrypto";
      case -9808:
        return "errSSLBadCert";
      case -9807:
        return "errSSLXCertChainInvalid";
      case -9806:
        return "errSSLClosedAbort";
      case -9805:
        return "errSSLClosedGraceful";
      case -9804:
        return "errSSLSessionNotFound";
      case -9803:
        return "errSSLWouldBlock";
      case -9802:
        return "errSSLFatalAlert";
      case -9801:
        return "errSSLNegotiation";
      case -9800:
        return "errSSLProtocol";
      default:
        if (a1 == -50)
        {
          uint64_t result = "errSecParam";
        }
        else
        {
          if (a1) {
            return "<unknown>";
          }
          uint64_t result = "noErr";
        }
        break;
    }
  }
  return result;
}

uint64_t eapmschapv2_init(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  uint64_t v4 = malloc_type_malloc(0x46CuLL, 0x1000040B413CCD7uLL);
  *(void *)a1 = v4;
  v4[104] = 0;
  *(void *)uint64_t v4 = 0;
  *((_WORD *)v4 + 4) = 0;
  *((_DWORD *)v4 + 3) = *(_DWORD *)(a1 + 20);
  return 0;
}

uint64_t eapmschapv2_process(int **a1, uint64_t a2, char **a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  int v6 = (unsigned int *)*a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  if (*(unsigned char *)a2 != 1) {
    goto LABEL_106;
  }
  unsigned int Length = EAPPacketGetLength(a2);
  unsigned int v11 = Length;
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v13))
    {
LABEL_100:
      int v46 = 0;
      goto LABEL_101;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v83 = v11;
    *(_WORD *)&v83[4] = 2048;
    *(void *)&v83[6] = 9;
    char v14 = "eapmschapv2_request: length %d < %ld";
    goto LABEL_5;
  }
  int v18 = *(unsigned __int8 *)(a2 + 5);
  if (v18 == 4)
  {
    int v79 = 0;
    int v80 = 0;
    os_log_type_t v19 = (char *)*a1;
    unsigned int v20 = **a1;
    BOOL v21 = v20 > 5;
    int v22 = (1 << v20) & 0x2A;
    if (v21 || v22 == 0) {
      goto LABEL_100;
    }
    int v81 = 0;
    size_t v24 = Length - 9;
    if (Length == 9)
    {
      os_log_type_t v25 = 0;
    }
    else
    {
      size_t v77 = v19;
      os_log_type_t v25 = malloc_type_malloc(Length - 8, 0x6CB5F6F3uLL);
      memcpy(v25, (const void *)(a2 + 9), v11 - 9);
      *((unsigned char *)v25 + v24) = 0;
      char v26 = mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "E=", &v81);
      if (mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "R=", &v80)) {
        char v27 = v26 | 2;
      }
      else {
        char v27 = v26;
      }
      if (mschap2_message_int32_attr((const char *)v25, (unsigned __int16)v24, "V=", &v79)) {
        char v28 = v27 | 8;
      }
      else {
        char v28 = v27;
      }
      uint64_t v29 = strnstr((const char *)v25, "C=", v24);
      BOOL v30 = (unsigned __int16)v24 <= 0x22u || v29 == 0;
      int v31 = !v30;
      if (!v30)
      {
        int v75 = v31;
        uint64_t v76 = v25;
        uint64_t v32 = 0;
        buf[2] = 0;
        uint32_t v33 = v29 + 3;
        do
        {
          *(_WORD *)buf = *(_WORD *)(v33 - 1);
          v77[v32++ + 56] = strtoul((const char *)buf, 0, 16);
          v33 += 2;
        }
        while (v32 != 16);
        os_log_type_t v25 = v76;
        int v31 = v75;
      }
      if (v31) {
        char v34 = v28 | 4;
      }
      else {
        char v34 = v28;
      }
      if (strnstr((const char *)v25, "M=", v24)) {
        char v35 = v34 | 0x10;
      }
      else {
        char v35 = v34;
      }
      if (v35)
      {
        int v51 = EAPLogGetLogHandle();
        os_log_type_t v52 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)uint64_t v83 = v81;
          *(_WORD *)&v83[4] = 1024;
          *(_DWORD *)&v83[6] = v80;
          *(_WORD *)&v83[10] = 1024;
          *(_DWORD *)&v83[12] = v79;
          _os_log_impl(&dword_2106D5000, v51, v52, "MSCHAPv2 Error = %d, Retry = %d, Version = %d", buf, 0x14u);
        }
        if ((v35 & 4) != 0)
        {
          if (v81 == 648)
          {
            os_log_type_t v19 = v77;
            if (v79 != 3 || !a1[8]) {
              goto LABEL_56;
            }
            if (*((_DWORD *)v77 + 3) != *((_DWORD *)a1 + 5))
            {
              CFDictionaryRef v57 = (const __CFDictionary *)a1[10];
              if (v57)
              {
                CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v57, @"NewPassword");
                if (Value)
                {
                  int v59 = my_CFStringToCString(Value, 0x8000100u);
                  if (v59)
                  {
                    char v60 = *(unsigned char *)(a2 + 1);
                    char v61 = *(unsigned char *)(a2 + 6) + 1;
                    uint64_t v62 = v59;
                    unsigned int v63 = strlen((const char *)v59);
                    os_log_type_t v64 = v25;
                    uint64_t v65 = (unsigned int *)*a1;
                    int v46 = EAPPacketCreate((char *)*a1 + 105, 1024, 2, v60, 26, 0, 586, 0);
                    MSChapFillWithRandom(v65 + 4, 0x10u);
                    MSChap2(v65 + 14, v65 + 4, (char *)a1[5], v62, v63, (uint64_t)(v65 + 8));
                    v46[5] = 7;
                    v46[6] = v61;
                    *(_WORD *)(v46 + 7) = 18946;
                    *(_OWORD *)(v46 + 541) = *((_OWORD *)v65 + 1);
                    *(void *)(v46 + 557) = 0;
                    long long v66 = *((_OWORD *)v65 + 2);
                    uint64_t v67 = *((void *)v65 + 6);
                    os_log_type_t v25 = v64;
                    *(void *)(v46 + 581) = v67;
                    *(_OWORD *)(v46 + 565) = v66;
                    NTPasswordBlockEncryptNewPasswordWithOldHash(v62, v63, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v46 + 9);
                    NTPasswordHashEncryptOldWithNew(v62, v63, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)(v46 + 525));
                    *(_WORD *)(v46 + 589) = 0;
                    free(v62);
                    *(_DWORD *)size_t v77 = 3;
                    goto LABEL_57;
                  }
                }
              }
            }
            int v46 = 0;
            v77[9] = 1;
          }
          else
          {
            os_log_type_t v19 = v77;
            if (!v80) {
              goto LABEL_56;
            }
            if (*((_DWORD *)v77 + 3) != *((_DWORD *)a1 + 5) && a1[8])
            {
              uint64_t v70 = EAPMSCHAPv2ResponsePacketCreate((uint64_t *)a1, *(unsigned char *)(a2 + 1), *(unsigned char *)(a2 + 6) + 1, 0);
              if (v70)
              {
                int v46 = v70;
                *(_DWORD *)size_t v77 = 1;
                goto LABEL_57;
              }
              goto LABEL_56;
            }
            int v46 = 0;
            v77[8] = 1;
          }
          *a4 = 3;
          goto LABEL_57;
        }
        size_t v53 = EAPLogGetLogHandle();
        os_log_type_t v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v53, v54, "MSCHAPv2 Failure Request does not contain challenge", buf, 2u);
        }
      }
      os_log_type_t v19 = v77;
    }
LABEL_56:
    *(void *)os_log_type_t v19 = 0x200000005;
    *a4 = 1;
    int v46 = EAPPacketCreate(v19 + 105, 1024, 2, *(unsigned char *)(a2 + 1), 26, 0, 4, 0);
    v46[5] = 4;
    v46[6] = *(unsigned char *)(a2 + 6);
    *(_WORD *)(v46 + 7) = 1024;
LABEL_57:
    if (!v25) {
      goto LABEL_101;
    }
    os_log_type_t v47 = (UInt8 *)v25;
LABEL_78:
    free(v47);
    goto LABEL_101;
  }
  if (v18 == 3)
  {
    if (Length <= 0x32)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13)) {
        goto LABEL_100;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v83 = v11;
      *(_WORD *)&v83[4] = 2048;
      *(void *)&v83[6] = 51;
      char v14 = "length %d < %ld";
LABEL_5:
      char v15 = LogHandle;
      os_log_type_t v16 = v13;
      uint32_t v17 = 18;
LABEL_6:
      _os_log_impl(&dword_2106D5000, v15, v16, v14, buf, v17);
      goto LABEL_100;
    }
    uint64_t v36 = (uint64_t)*a1;
    int v37 = **a1;
    if (v37 == 1 || v37 == 4)
    {
      os_log_type_t v39 = 0;
      uint64_t v40 = (UInt8 *)a1[8];
      unsigned int v41 = *((_DWORD *)a1 + 18);
    }
    else
    {
      if (v37 != 3) {
        goto LABEL_100;
      }
      CFStringRef v48 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1[10], @"NewPassword");
      if (!v48)
      {
        int v71 = EAPLogGetLogHandle();
        os_log_type_t v72 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v71, v72)) {
          goto LABEL_100;
        }
        *(_WORD *)buf = 0;
        char v14 = "NewPassword is missing";
        char v15 = v71;
        os_log_type_t v16 = v72;
        uint32_t v17 = 2;
        goto LABEL_6;
      }
      uint64_t v40 = my_CFStringToCString(v48, 0x8000100u);
      unsigned int v41 = strlen((const char *)v40);
      os_log_type_t v39 = v40;
    }
    if (MSChap2AuthResponseValid(v40, v41, (const void *)(v36 + 32), (const void *)(v36 + 16), (const void *)(v36 + 56), (char *)a1[5], (const void *)(a2 + 9)))
    {
      unsigned int v78 = v39;
      if (*(_DWORD *)v36 == 3)
      {
        int v49 = EAPLogGetLogHandle();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v49, v50, "eapmschapv2_success_request: change password succeeded", buf, 2u);
        }
      }
      MSChap2_MPPEGetMasterKey(v40, v41, (const void *)(v36 + 32), buf);
      MSChap2_MPPEGetAsymetricStartKey(buf, (void *)(v36 + 72), 16, 1, 1);
      MSChap2_MPPEGetAsymetricStartKey(buf, (void *)(v36 + 88), 16, 0, 1);
      *(unsigned char *)(v36 + 104) = 1;
      *(_DWORD *)uint64_t v36 = 4;
      int v46 = EAPPacketCreate((char *)(v36 + 105), 1024, 2, *(unsigned char *)(a2 + 1), 26, 0, 1, 0);
      v46[5] = 3;
      os_log_type_t v39 = v78;
    }
    else
    {
      uint64_t v55 = EAPLogGetLogHandle();
      os_log_type_t v56 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v55, v56))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v55, v56, "eapmschapv2_success_request: invalid server auth response", buf, 2u);
      }
      int v46 = 0;
      *(void *)uint64_t v36 = 0x200000005;
      *a4 = 1;
    }
    if (!v39) {
      goto LABEL_101;
    }
    os_log_type_t v47 = v39;
    goto LABEL_78;
  }
  if (v18 != 1) {
    goto LABEL_100;
  }
  if (Length <= 0x19)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v13)) {
      goto LABEL_100;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v83 = v11;
    *(_WORD *)&v83[4] = 2048;
    *(void *)&v83[6] = 26;
    char v14 = "eapmschapv2_challenge: length %d < %ld";
    goto LABEL_5;
  }
  uint64_t v42 = (uint64_t)*a1;
  *(unsigned char *)(v42 + 104) = 0;
  *(void *)uint64_t v42 = 0;
  *(_WORD *)(v42 + 8) = 0;
  if (a1[8])
  {
    CFDataRef v43 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1[10], @"EAPMSCHAPv2ServerChallenge");
    if (v43)
    {
      CFDataRef v44 = v43;
      if (CFDataGetLength(v43) != 16)
      {
        uint64_t v68 = EAPLogGetLogHandle();
        os_log_type_t v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v83 = CFDataGetLength(v44);
          *(_WORD *)&v83[8] = 2048;
          *(void *)&v83[10] = 16;
          _os_log_impl(&dword_2106D5000, v68, v69, "eapmschapv2_challenge: internal error %ld != %ld", buf, 0x16u);
        }
        int v46 = 0;
        *a4 = 8;
        *(_DWORD *)(v42 + 4) = 2;
        goto LABEL_101;
      }
      long long v45 = *(_OWORD *)CFDataGetBytePtr(v44);
    }
    else
    {
      long long v45 = *(_OWORD *)(a2 + 10);
    }
    *(_OWORD *)(v42 + 56) = v45;
    int v46 = EAPMSCHAPv2ResponsePacketCreate((uint64_t *)a1, *(unsigned char *)(a2 + 1), *(unsigned char *)(a2 + 6), a4);
    if (v46) {
      *(_DWORD *)uint64_t v42 = 1;
    }
  }
  else
  {
    int v46 = 0;
    *(unsigned char *)(v42 + 8) = 1;
    *a4 = 3;
  }
LABEL_101:
  *a3 = v46;
  if (*v6 == 4)
  {
    int v73 = 1;
    goto LABEL_105;
  }
  if (*v6 == 5)
  {
    int v73 = 2;
LABEL_105:
    v6[1] = v73;
  }
LABEL_106:
  v6[3] = *((_DWORD *)a1 + 5);
  return v6[1];
}

uint64_t eapmschapv2_publish_props()
{
  return 0;
}

void eapmschapv2_free_packet(uint64_t a1, void *a2)
{
  if ((void *)(*(void *)a1 + 105) != a2) {
    free(a2);
  }
}

double MSChap2_MPPEGetMasterKey(UInt8 *a1, unsigned int a2, const void *a3, _OWORD *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CC_LONG v6 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v6, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v9);
  memset(&md, 0, sizeof(md));
  memset(v10, 0, sizeof(v10));
  int v11 = 0;
  CC_SHA1_Init(&md);
  CC_SHA1_Update(&md, v9, 0x10u);
  CC_SHA1_Update(&md, a3, 0x18u);
  CC_SHA1_Update(&md, "This is the MPPE Master Key", 0x1Bu);
  CC_SHA1_Final(v10, &md);
  double result = *(double *)v10;
  *a4 = *(_OWORD *)v10;
  return result;
}

void *MSChap2_MPPEGetAsymetricStartKey(const void *a1, void *a2, int a3, int a4, int a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(&v11, 0, sizeof(v11));
  if (a4 != a5) {
    int v8 = &Magic2;
  }
  else {
    int v8 = &Magic3;
  }
  *(void *)CC_SHA1_CTX md = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, a1, 0x10u);
  CC_SHA1_Update(&v11, &SHSpad1, 0x28u);
  CC_SHA1_Update(&v11, v8, 0x54u);
  CC_SHA1_Update(&v11, &SHSpad2, 0x28u);
  CC_SHA1_Final(md, &v11);
  if (a3 >= 16) {
    int v9 = 16;
  }
  else {
    int v9 = a3;
  }
  return memcpy(a2, md, v9);
}

uint64_t eapmschapv2_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 104)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 72;
}

BOOL PACTLVAttributeListParse(void *a1, unsigned __int16 *a2, uint64_t a3, __CFString *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 1;
  }
  uint64_t v5 = a3;
  int v22 = a1 + 6;
  uint64_t v23 = a1 + 5;
  size_t v24 = a1 + 3;
  os_log_type_t v25 = a1 + 2;
  unsigned int v20 = a1 + 1;
  BOOL v21 = a1 + 4;
  while (1)
  {
    if (v5 <= 3)
    {
      if (a4) {
        goto LABEL_44;
      }
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(LogHandle, v19);
      if (!result) {
        return result;
      }
      goto LABEL_48;
    }
    unsigned int v8 = a2[1];
    uint64_t v9 = __rev16(v8);
    if (v9 + 4 > (unint64_t)(int)v5) {
      break;
    }
    int v10 = (int)bswap32(*a2) >> 16;
    uint64_t v11 = v10 & 0x3FFF;
    if (a4)
    {
      CC_LONG v12 = "Unknown";
      if ((v11 - 1) <= 9) {
        CC_LONG v12 = off_264133E58[v11 - 1];
      }
      BOOL v13 = v10 < 0;
      int v14 = (const char *)&unk_21070AD61;
      if (v13) {
        int v14 = " [mandatory]";
      }
      CFStringAppendFormat(a4, 0, @"%s PACTLV Attribute (type=%d) Length=%d%s\n", v12, v11, v9, v14);
      print_data_cfstr(a4, (uint64_t)(a2 + 2), v9);
    }
    switch((int)v11)
    {
      case 1:
        if (a1)
        {
          if (v8)
          {
            uint64_t v15 = a1;
            if (!*a1) {
              goto LABEL_38;
            }
          }
        }
        break;
      case 2:
        if (a1 && v8)
        {
          uint64_t v15 = v20;
          goto LABEL_37;
        }
        break;
      case 4:
        if (a1 && v8)
        {
          uint64_t v15 = v21;
          goto LABEL_37;
        }
        break;
      case 5:
        if (a1 && v8)
        {
          uint64_t v15 = v22;
          goto LABEL_37;
        }
        break;
      case 7:
        if (a1 && v8)
        {
          uint64_t v15 = v23;
          goto LABEL_37;
        }
        break;
      case 9:
        if (!a1 || !*v25)
        {
          char v16 = PACTLVAttributeListParse(a1, a2 + 2, v9, a4);
          if (a1)
          {
            if (v8)
            {
              uint64_t v15 = v25;
              if (v16) {
                goto LABEL_38;
              }
            }
          }
        }
        break;
      case 10:
        if (v9 < 2) {
          return 0;
        }
        if (a1)
        {
          uint64_t v15 = v24;
LABEL_37:
          if (!*v15) {
LABEL_38:
          }
            void *v15 = a2;
        }
        break;
      default:
        break;
    }
    a2 = (unsigned __int16 *)((char *)a2 + v9 + 4);
    uint64_t v5 = (v5 - (v9 + 4));
    if (!v5) {
      return 1;
    }
  }
  if (a4)
  {
LABEL_44:
    CFStringAppendFormat(a4, 0, @"EAP-FAST: TLV attribute is too short (%d < %d)", v5, 4);
    return 0;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v19 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(LogHandle, v19);
  if (!result) {
    return result;
  }
LABEL_48:
  *(_DWORD *)buf = 67109376;
  int v27 = v5;
  __int16 v28 = 1024;
  int v29 = 4;
  _os_log_impl(&dword_2106D5000, LogHandle, v19, "EAP-FAST: TLV attribute is too short (%d < %d)", buf, 0xEu);
  return 0;
}

BOOL save_pac(uint64_t *a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  size_t v38 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef v35 = Mutable;
  dict_add_tlv_as_data(Mutable, @"AuthorityID", a1[4], 0);
  uint64_t v3 = a1[5];
  if (v3) {
    dict_add_tlv_as_string(Mutable, @"AuthorityIDInfo", v3);
  }
  uint64_t v4 = a1[6];
  if (v4) {
    dict_add_tlv_as_string(Mutable, @"InitiatorID", v4);
  }
  dict_add_tlv_as_data(Mutable, @"PACOpaque", a1[1], 1);
  dict_add_tlv_as_data(Mutable, @"PACInfo", a1[2], 0);
  uint64_t v5 = a1[6];
  if (v5)
  {
    CC_LONG v6 = (UInt8 *)(v5 + 4);
    CFIndex v7 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
  }
  else
  {
    CFIndex v7 = 0;
    CC_LONG v6 = 0;
  }
  CFPropertyListRef v8 = pac_list_copy();
  uint64_t v36 = v8;
  if (!v8)
  {
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    CFPropertyListRef v37 = MutableCopy;
    goto LABEL_15;
  }
  CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)v8);
  CFPropertyListRef v37 = MutableCopy;
  int pac = pac_list_find_pac(MutableCopy, (const void *)(a1[4] + 4), bswap32(*(unsigned __int16 *)(a1[4] + 2)) >> 16, v6, v7);
  if (pac == -1)
  {
LABEL_15:
    int v11 = -1;
    goto LABEL_16;
  }
  int v11 = pac;
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, pac);
  BOOL v13 = (void *)CFDictionaryGetValue(ValueAtIndex, @"PACKeyKeychainItemID");
  size_t v38 = v13;
  if (v13)
  {
    int v14 = v13;
    CFDictionarySetValue(Mutable, @"PACKeyKeychainItemID", v13);
    CFDataRef v15 = CFDataCreate(0, (const UInt8 *)(*a1 + 4), bswap32(*(unsigned __int16 *)(*a1 + 2)) >> 16);
    CFDataRef v40 = v15;
    int v16 = EAPSecKeychainPasswordItemSet(0, v14, v15);
    if (v16 == -25300)
    {
      CFDataRef v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      CFDataRef v43 = 0;
      unsigned int v41 = 0;
      pac_keychain_init_items(v6, v7, (CFDataRef *)&v41, &v45, (CFDataRef *)&v44, (CFDataRef *)&v42);
      int v17 = EAPSecKeychainPasswordItemCreateWithAccess(0, v45, v14, v42, v44, v41, v15);
      if (v17)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v30))
        {
          int v31 = EAPSecurityErrorString(v17);
          *(_DWORD *)buf = 136315394;
          os_log_type_t v47 = v31;
          __int16 v48 = 1024;
          int v49 = v17;
          _os_log_impl(&dword_2106D5000, LogHandle, v30, "EAP-FAST: EAPSecKeychainPasswordItemCreateWithAccess failed,%s (%d)", buf, 0x12u);
        }
      }
      my_CFRelease(&v43);
      my_CFRelease((const void **)&v45);
      my_CFRelease(&v44);
      my_CFRelease(&v42);
      my_CFRelease(&v41);
    }
    else
    {
      int v17 = v16;
      if (!v16)
      {
        my_CFRelease((const void **)&v40);
        goto LABEL_21;
      }
      uint64_t v32 = EAPLogGetLogHandle();
      os_log_type_t v33 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 136315394;
        os_log_type_t v47 = EAPSecurityErrorString(v17);
        __int16 v48 = 1024;
        int v49 = v17;
        _os_log_impl(&dword_2106D5000, v32, v33, "EAP-FAST: EAPSecKeychainPasswordItemSet failed, %s (%d)", buf, 0x12u);
      }
    }
    my_CFRelease((const void **)&v40);
    if (!v17) {
      goto LABEL_21;
    }
LABEL_31:
    BOOL v28 = 0;
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v18 = *a1;
  os_log_type_t v19 = (const UInt8 *)(*a1 + 4);
  CFIndex v20 = bswap32(*(unsigned __int16 *)(v18 + 2)) >> 16;
  CFDataRef v44 = 0;
  uint64_t v45 = 0;
  uint64_t v42 = 0;
  CFDataRef v43 = 0;
  unsigned int v41 = 0;
  value = 0;
  pac_keychain_init_items(v6, v7, (CFDataRef *)&v41, &v45, (CFDataRef *)&v44, (CFDataRef *)&v42);
  CFDataRef v40 = CFDataCreate(0, v19, v20);
  int UniqueWithAccess = EAPSecKeychainPasswordItemCreateUniqueWithAccess(0, v45, v42, v44, v41, v40, (CFStringRef *)&value);
  if (UniqueWithAccess)
  {
    int v22 = UniqueWithAccess;
    uint64_t v23 = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = EAPSecurityErrorString(v22);
      *(_DWORD *)buf = 136315394;
      os_log_type_t v47 = v25;
      __int16 v48 = 1024;
      int v49 = v22;
      _os_log_impl(&dword_2106D5000, v23, v24, "EAP-FAST: EAPSecKeychainPasswordItemCreateUniqueWithAccess failed,%s (%d)", buf, 0x12u);
    }
  }
  my_CFRelease(&v43);
  my_CFRelease((const void **)&v45);
  my_CFRelease(&v44);
  my_CFRelease(&v42);
  my_CFRelease(&v41);
  my_CFRelease((const void **)&v40);
  size_t v38 = value;
  if (!value) {
    goto LABEL_31;
  }
  CFDictionarySetValue(Mutable, @"PACKeyKeychainItemID", value);
  my_CFRelease((const void **)&v38);
  if (v11 == -1)
  {
    CFArrayAppendValue(MutableCopy, Mutable);
    goto LABEL_23;
  }
LABEL_21:
  CFArraySetValueAtIndex(MutableCopy, v11, Mutable);
LABEL_23:
  CFStringRef v26 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v27 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"PACList", v37, @"com.apple.network.eapclient.eapfast", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  BOOL v28 = CFPreferencesSynchronize(@"com.apple.network.eapclient.eapfast", v26, v27) != 0;
LABEL_32:
  my_CFRelease((const void **)&v35);
  my_CFRelease(&v36);
  my_CFRelease(&v37);
  return v28;
}

void dict_add_tlv_as_data(__CFDictionary *a1, const void *a2, uint64_t a3, int a4)
{
  uint64_t v6 = 4;
  if (a4)
  {
    CFIndex v7 = (const UInt8 *)a3;
  }
  else
  {
    uint64_t v6 = 0;
    CFIndex v7 = (const UInt8 *)(a3 + 4);
  }
  CFDataRef v8 = CFDataCreate(0, v7, v6 + (bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16));
  CFDictionarySetValue(a1, a2, v8);
  my_CFRelease((const void **)&v8);
}

void dict_add_tlv_as_string(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)(a3 + 4), bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16, 0x8000100u, 1u);
  CFDictionarySetValue(a1, a2, v5);
  my_CFRelease((const void **)&v5);
}

uint64_t EAPSecKeychainPasswordItemSet(uint64_t a1, void *a2, void *a3)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  BOOL v13 = a3;
  uint64_t v4 = (void *)*MEMORY[0x263F17090];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v4;
  keys[2] = *(void **)MEMORY[0x263F17520];
  CFTypeRef result = 0;
  values[0] = *(void **)MEMORY[0x263F171C8];
  values[1] = a2;
  values[2] = *(void **)MEMORY[0x263EFFB40];
  CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if (!v6)
  {
    if (result && CFEqual(a3, result))
    {
      uint64_t v6 = 0;
    }
    else
    {
      CFIndex v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      CFDataRef v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      CFDictionaryRef v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionaryRef v10 = CFDictionaryCreate(0, MEMORY[0x263F175A8], (const void **)&v13, 1, v7, v8);
      uint64_t v6 = SecItemUpdate(v9, v10);
      CFRelease(v9);
      CFRelease(v10);
    }
  }
  my_CFRelease(&result);
  return v6;
}

CFDataRef pac_keychain_init_items(UInt8 *bytes, CFIndex length, CFDataRef *a3, void *a4, CFDataRef *a5, CFDataRef *a6)
{
  *a4 = 0;
  *a3 = CFDataCreate(0, bytes, length);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
  *a6 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"802.1X EAP-FAST", 15, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"PAC-Key", 7, v8);
  *a5 = result;
  return result;
}

uint64_t EAPSecKeychainPasswordItemCreateWithAccess(uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F17090], a3);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F16E90], (const void *)*MEMORY[0x263F16E98]);
  if (a4) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F17000], a4);
  }
  if (a5) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F16F20], a5);
  }
  if (a6) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F16ED8], a6);
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F175A8], a7);
  uint64_t v13 = SecItemAdd(Mutable, 0);
  CFRelease(Mutable);
  return v13;
}

void make_pac_ack(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      int v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 10;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    CFAllocatorRef v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2106D5000, v8, v9, "EAP-FAST: make_pac_ack(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    uint64_t v4 = *(void *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 10;
    *(void *)uint64_t v4 = 0x200080006000B00;
    *(_WORD *)(v4 + 8) = __rev16(a2);
  }
}

void eapmschapv2_free(void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    free(v2);
    *a1 = 0;
  }
}

CFStringRef EAPOLControlKeyCreate(char *cStr)
{
  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x600u);
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x263F1BC10], v3, (CFStringRef)*MEMORY[0x263F1BC40]);
  my_CFRelease((const void **)&v3);
  return NetworkInterfaceEntity;
}

CFMutableStringRef EAPOLControlKeyCopyInterface(const __CFString *a1)
{
  if (!CFStringHasSuffix(a1, (CFStringRef)*MEMORY[0x263F1BC40])) {
    return 0;
  }
  CFStringRef v2 = (const __CFString *)EAPOLControlKeyCopyInterface_prefix;
  if (!EAPOLControlKeyCopyInterface_prefix)
  {
    CFStringRef v2 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/", *MEMORY[0x263F1BC10], *MEMORY[0x263F1BC00], *MEMORY[0x263F1BBF8]);
    EAPOLControlKeyCopyInterface_prefix = (uint64_t)v2;
  }
  if (!CFStringHasPrefix(a1, v2)) {
    return 0;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
  if (MutableCopy)
  {
    v7.length = CFStringGetLength(v2);
    v7.CFIndex location = 0;
    CFStringDelete(MutableCopy, v7);
    CFIndex location = CFStringFind(MutableCopy, @"/", 0).location;
    if (location != -1)
    {
      CFIndex v5 = location;
      v8.length = CFStringGetLength(MutableCopy) - location;
      v8.CFIndex location = v5;
      CFStringDelete(MutableCopy, v8);
      return MutableCopy;
    }
    CFRelease(MutableCopy);
    return 0;
  }
  return MutableCopy;
}

uint64_t EAPOLControlCopyStateAndStatus(uint64_t a1, _DWORD *a2, const __CFData **a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(v12, 0, sizeof(v12));
  uint64_t v11 = 0;
  mach_error_t v10 = 0;
  bytes = 0;
  unsigned int v8 = 0;
  *a3 = 0;
  if (!get_server_port((uint64_t)&v11, &v10)) {
    goto LABEL_4;
  }
  __strlcpy_chk();
  mach_error_t v5 = eapolcontroller_copy_status(v11, v12, &bytes, &v8, a2, (_DWORD *)&v11 + 1);
  if (v5)
  {
    mach_error("eapolcontroller_copy_status failed", v5);
LABEL_4:
    int v6 = 6;
LABEL_5:
    HIDWORD(v11) = v6;
    return HIDWORD(v11);
  }
  if (bytes)
  {
    *a3 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v8);
    MEMORY[0x21666FE10](*MEMORY[0x263EF8960], bytes, v8);
    if (!*a3)
    {
      int v6 = 12;
      goto LABEL_5;
    }
  }
  return HIDWORD(v11);
}

BOOL get_server_port(uint64_t a1, mach_error_t *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  mach_error_t v3 = bootstrap_look_up2();
  *a2 = v3;
  if (!v3) {
    return 1;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(LogHandle, v5);
  if (result)
  {
    CFRange v7 = mach_error_string(*a2);
    int v8 = 136315138;
    os_log_type_t v9 = v7;
    _os_log_impl(&dword_2106D5000, LogHandle, v5, "eapolcontroller_server_port failed, %s", (uint8_t *)&v8, 0xCu);
    return 0;
  }
  return result;
}

uint64_t eapolcontroller_copy_status(int a1, _OWORD *a2, void *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  memset(&rcv_name[16], 0, 48);
  int v20 = 0;
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  long long v11 = a2[1];
  *(_OWORD *)&rcv_name[28] = *a2;
  *(_OWORD *)&rcv_name[44] = v11;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v18 = 5395;
  *(void *)&rcv_name[12] = 0x55F500000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)&v18, 3, 0x40u, 0x48u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v13)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 22105)
      {
        if (v18 < 0)
        {
          uint64_t v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 1
            && *(_DWORD *)rcv_name == 64
            && !*(_DWORD *)&rcv_name[4]
            && rcv_name[35] == 1)
          {
            int v15 = *(_DWORD *)&rcv_name[36];
            if (*(_DWORD *)&rcv_name[36] == *(_DWORD *)&rcv_name[48])
            {
              uint64_t v14 = 0;
              *a3 = *(void *)&rcv_name[24];
              *a4 = v15;
              int v16 = *(_DWORD *)&rcv_name[56];
              *a5 = *(_DWORD *)&rcv_name[52];
              *a6 = v16;
              return v14;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          uint64_t v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4]) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = *(unsigned int *)&rcv_name[28];
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v14;
}

uint64_t EAPOLClientItemIDGetTypeID()
{
  return __kEAPOLClientItemIDTypeID;
}

uint64_t EAPOLClientItemIDCreateWithProfileID(const void *a1)
{
  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 2;
    *(void *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithWLANSSID(const void *a1)
{
  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 1;
    *(void *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithWLANDomain(const void *a1)
{
  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 5;
    *(void *)(Instance + 24) = CFRetain(a1);
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateWithProfile(const void *a1)
{
  CFGetAllocator(a1);
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 3;
    CFRetain(a1);
    *(void *)(v3 + 24) = a1;
  }
  return v3;
}

uint64_t EAPOLClientItemIDCreateDefault()
{
  pthread_once(&__EAPOLClientItemIDRegisterClass_initialized, (void (*)(void))__EAPOLClientItemIDInitialize);
  uint64_t result = _CFRuntimeCreateInstance();
  if (result) {
    *(_DWORD *)(result + 16) = 4;
  }
  return result;
}

uint64_t EAPOLClientItemIDGetProfileID(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 3) {
    return EAPOLClientProfileGetID(*(void *)(a1 + 24));
  }
  if (v1 == 2) {
    return *(void *)(a1 + 24);
  }
  return 0;
}

uint64_t EAPOLClientItemIDGetWLANSSID(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 3) {
    return EAPOLClientProfileGetWLANSSIDAndSecurityType(*(void *)(a1 + 24), 0);
  }
  if (v1 == 1) {
    return *(void *)(a1 + 24);
  }
  return 0;
}

uint64_t EAPOLClientItemIDGetProfile(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 3) {
    return *(void *)(a1 + 24);
  }
  else {
    return 0;
  }
}

CFDictionaryRef EAPOLClientItemIDCopyDictionary(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  if (v2 == 3)
  {
    ID = (const void *)EAPOLClientProfileGetID(*(void *)(a1 + 24));
    if (ID) {
      goto LABEL_4;
    }
  }
  else
  {
    if (v2 != 2) {
      goto LABEL_7;
    }
    ID = *(const void **)(a1 + 24);
    if (ID)
    {
LABEL_4:
      uint64_t v4 = @"ProfileID";
LABEL_11:
      CFRange v7 = ID;
      keys = v4;
      return CFDictionaryCreate(0, (const void **)&keys, &v7, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
  }
  int v2 = *(_DWORD *)(a1 + 16);
LABEL_7:
  if (v2 == 3)
  {
    ID = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(*(void *)(a1 + 24), 0);
    if (ID) {
      goto LABEL_10;
    }
LABEL_13:
    int v2 = *(_DWORD *)(a1 + 16);
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    ID = *(const void **)(a1 + 24);
    if (ID)
    {
LABEL_10:
      uint64_t v4 = @"SSID";
      goto LABEL_11;
    }
    goto LABEL_13;
  }
LABEL_14:
  if (v2 == 4)
  {
    keys = @"Default";
    os_log_type_t v5 = (const void *)*MEMORY[0x263EFFB40];
  }
  else
  {
    if (v2 != 5) {
      return 0;
    }
    keys = @"Domain";
    os_log_type_t v5 = *(const void **)(a1 + 24);
  }
  CFRange v7 = v5;
  return CFDictionaryCreate(0, (const void **)&keys, &v7, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

uint64_t EAPOLClientItemIDCreateWithDictionary(uint64_t a1, const void *a2)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID) {
    return 0;
  }
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)a2, @"ProfileID");
  CFTypeID v6 = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == v6)
  {
    if (!a1 || (ProfileWithID = EAPOLClientConfigurationGetProfileWithID(a1, Value)) == 0)
    {
      return EAPOLClientItemIDCreateWithProfileID(Value);
    }
    goto LABEL_21;
  }
  os_log_type_t v9 = CFDictionaryGetValue((CFDictionaryRef)a2, @"SSID");
  CFTypeID v10 = CFDataGetTypeID();
  if (v9 && CFGetTypeID(v9) == v10)
  {
    if (!a1 || (ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANSSID(a1, v9)) == 0)
    {
      return EAPOLClientItemIDCreateWithWLANSSID(v9);
    }
LABEL_21:
    return EAPOLClientItemIDCreateWithProfile(ProfileWithID);
  }
  long long v11 = CFDictionaryGetValue((CFDictionaryRef)a2, @"Domain");
  CFTypeID v12 = CFStringGetTypeID();
  if (!v11 || CFGetTypeID(v11) != v12)
  {
    if (CFDictionaryGetValue((CFDictionaryRef)a2, @"Default"))
    {
      return EAPOLClientItemIDCreateDefault();
    }
    return 0;
  }
  if (a1)
  {
    ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANDomain(a1, v11);
    if (ProfileWithID) {
      goto LABEL_21;
    }
  }
  return EAPOLClientItemIDCreateWithWLANDomain(v11);
}

uint64_t EAPOLClientItemIDCopyIdentity(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  CFDictionaryRef v20 = 0;
  int v1 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 0);
  uint64_t v21 = v1;
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v3))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v1;
    _os_log_impl(&dword_2106D5000, LogHandle, v3, "looking for identity reference for [%@]", buf, 0xCu);
  }
  int v4 = EAPKeychainCopyIdentityReference(v1, (CFTypeRef *)&v20);
  if (v4)
  {
    int v5 = v4;
    CFTypeID v6 = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = EAPSecurityErrorString(v5);
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = (void *)v8;
      __int16 v24 = 1024;
      int v25 = v5;
      os_log_type_t v9 = "EAPKeychainCopyIdentityReference() failed %s (%d)";
LABEL_6:
      CFTypeID v10 = v6;
      os_log_type_t v11 = v7;
      uint32_t v12 = 18;
LABEL_7:
      _os_log_impl(&dword_2106D5000, v10, v11, v9, buf, v12);
    }
  }
  else
  {
    if (!v20)
    {
      int v17 = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v17, v18)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      os_log_type_t v9 = "EAPKeychainCopyIdentityReference() returned NULL";
      CFTypeID v10 = v17;
      os_log_type_t v11 = v18;
      uint32_t v12 = 2;
      goto LABEL_7;
    }
    int v14 = EAPSecIdentityHandleCreateSecIdentity(v20, &v19);
    if (v14)
    {
      int v15 = v14;
      CFTypeID v6 = EAPLogGetLogHandle();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v6, v7))
      {
        int v16 = EAPSecurityErrorString(v15);
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = (void *)v16;
        __int16 v24 = 1024;
        int v25 = v15;
        os_log_type_t v9 = "EAPSecIdentityHandleCreateSecIdentity() failed %s (%d)";
        goto LABEL_6;
      }
    }
  }
LABEL_8:
  my_CFRelease((const void **)&v21);
  my_CFRelease((const void **)&v20);
  return v19;
}

CFStringRef EAPOLClientItemIDCopyUniqueString(uint64_t a1, int a2)
{
  if (a2) {
    int v2 = "item";
  }
  else {
    int v2 = "identity";
  }
  switch(*(_DWORD *)(a1 + 16))
  {
    case 1:
      WLANSSIDAndSecurityType = *(const void **)(a1 + 24);
      goto LABEL_10;
    case 2:
      uint64_t v6 = *(void *)(a1 + 24);
      if (v6)
      {
        os_log_type_t v7 = "profileid";
        return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s.%@", "system", v2, v7, v6);
      }
      os_log_type_t v11 = "profileid";
      return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s", "system", v2, v11);
    case 3:
      WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(*(void *)(a1 + 24), 0);
      if (WLANSSIDAndSecurityType)
      {
LABEL_10:
        CFAllocatorRef WLANDomain = (const __CFAllocator *)my_CFStringCreateWithData(WLANSSIDAndSecurityType);
        if (WLANDomain)
        {
          CFAllocatorRef v9 = WLANDomain;
          CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s.%@", "system", v2, "wlan.ssid", WLANDomain);
          CFRelease(v9);
          return v10;
        }
        uint32_t v12 = "wlan.ssid";
        return CFStringCreateWithFormat(WLANDomain, 0, @"com.apple.network.eap.%s.%s.%s", "system", v2, v12);
      }
      CFAllocatorRef WLANDomain = (const __CFAllocator *)EAPOLClientProfileGetWLANDomain(*(void *)(a1 + 24));
      if (WLANDomain)
      {
        uint32_t v12 = "wlan.domain";
      }
      else
      {
        CFAllocatorRef WLANDomain = (const __CFAllocator *)EAPOLClientProfileGetID(*(void *)(a1 + 24));
        uint32_t v12 = "profileid";
        if (!WLANDomain) {
          return CFStringCreateWithFormat(WLANDomain, 0, @"com.apple.network.eap.%s.%s.%s", "system", v2, v12);
        }
      }
      return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s.%@", "system", v2, v12, WLANDomain);
    case 4:
      os_log_type_t v11 = "default";
      return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s", "system", v2, v11);
    case 5:
      uint64_t v6 = *(void *)(a1 + 24);
      if (v6)
      {
        os_log_type_t v7 = "wlan.domain";
        return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s.%@", "system", v2, v7, v6);
      }
      else
      {
        os_log_type_t v11 = "wlan.domain";
        return CFStringCreateWithFormat(0, 0, @"com.apple.network.eap.%s.%s.%s", "system", v2, v11);
      }
    default:
      return 0;
  }
}

BOOL EAPOLClientItemIDSetIdentity(uint64_t a1, uint64_t a2, __SecIdentity *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFDataRef v29 = 0;
  os_log_type_t v30 = 0;
  int v4 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 0);
  int v31 = v4;
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v6))
  {
    os_log_type_t v7 = "adding/updating";
    if (!a3) {
      os_log_type_t v7 = "deleting";
    }
    *(_DWORD *)buf = 136315394;
    os_log_type_t v33 = v7;
    __int16 v34 = 2112;
    CFMutableDictionaryRef v35 = v4;
    _os_log_impl(&dword_2106D5000, LogHandle, v6, "%s identity reference for key : [%@]", buf, 0x16u);
  }
  int v8 = EAPKeychainCopyIdentityReference(v4, (CFTypeRef *)&v29);
  if (!a3 && v8 == -25300) {
    goto LABEL_7;
  }
  if (!v29)
  {
    int v10 = 0;
    goto LABEL_14;
  }
  char v28 = 0;
  if (a3)
  {
    if (!EAPSecIdentityCompareIdentityHandle(a3, v29, &v28) && v28 == 1) {
      goto LABEL_7;
    }
    int v10 = 1;
LABEL_14:
    os_log_type_t v11 = EAPSecIdentityHandleCreate(a3);
    os_log_type_t v30 = v11;
    if (!v11)
    {
      int v25 = EAPLogGetLogHandle();
      os_log_type_t v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        *(_WORD *)buf = 0;
        int v17 = "EAPSecIdentityHandleCreate() returned NULL";
        os_log_type_t v18 = v25;
        os_log_type_t v19 = v26;
        uint32_t v20 = 2;
        goto LABEL_24;
      }
LABEL_25:
      BOOL v9 = 0;
      goto LABEL_26;
    }
    int v12 = EAPKeychainSetIdentityReference(v4, v11, v10);
    if (v12)
    {
      int v13 = v12;
      int v14 = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        int v16 = EAPSecurityErrorString(v13);
        *(_DWORD *)buf = 136315394;
        os_log_type_t v33 = v16;
        __int16 v34 = 1024;
        LODWORD(v35) = v13;
        int v17 = "failed to add/update identity reference in the Keychain, %s (%d)";
        os_log_type_t v18 = v14;
        os_log_type_t v19 = v15;
        uint32_t v20 = 18;
LABEL_24:
        _os_log_impl(&dword_2106D5000, v18, v19, v17, buf, v20);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
LABEL_7:
    BOOL v9 = 1;
    goto LABEL_26;
  }
  int v21 = EAPKeychainSetIdentityReference(v4, 0, 0);
  if (v21)
  {
    int v22 = EAPLogGetLogHandle();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      __int16 v24 = EAPSecurityErrorString(v21);
      *(_DWORD *)buf = 136315394;
      os_log_type_t v33 = v24;
      __int16 v34 = 1024;
      LODWORD(v35) = v21;
      _os_log_impl(&dword_2106D5000, v22, v23, "failed to delete identity reference, %s (%d)", buf, 0x12u);
    }
  }
  BOOL v9 = v21 == 0;
LABEL_26:
  my_CFRelease((const void **)&v29);
  my_CFRelease((const void **)&v30);
  my_CFRelease((const void **)&v31);
  return v9;
}

BOOL EAPOLClientItemIDCopyPasswordItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!(a3 | a4)) {
    return 0;
  }
  CFStringRef v7 = EAPOLClientItemIDCopyUniqueString(a1, 1);
  CFStringRef v16 = v7;
  if (v7)
  {
    int v8 = (__CFString *)v7;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v10))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v18 = (const char *)v8;
      _os_log_impl(&dword_2106D5000, LogHandle, v10, "searching username/password for [%@]", buf, 0xCu);
    }
    int v11 = EAPKeychainCopyPasswordItem(v8, (void *)a3, (void *)a4);
    if (v11)
    {
      int v12 = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        int v14 = EAPSecurityErrorString(v11);
        *(_DWORD *)buf = 136315394;
        os_log_type_t v18 = v14;
        __int16 v19 = 1024;
        int v20 = v11;
        _os_log_impl(&dword_2106D5000, v12, v13, "failed to copy username/password from the Keychain, %s (%d)", buf, 0x12u);
      }
    }
    BOOL v4 = v11 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  my_CFRelease((const void **)&v16);
  return v4;
}

uint64_t EAPOLClientItemIDRemovePasswordItem(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t)EAPOLClientItemIDCopyUniqueString(a1, 1);
  uint64_t v10 = v1;
  if (v1)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v1;
      _os_log_impl(&dword_2106D5000, LogHandle, v3, "removing username/password for [%@]", buf, 0xCu);
    }
    int v4 = EAPKeychainRemovePasswordItem((void *)v1);
    if (v4)
    {
      int v5 = v4;
      os_log_type_t v6 = EAPLogGetLogHandle();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v6, v7))
      {
        int v8 = EAPSecurityErrorString(v5);
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = (uint64_t)v8;
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_impl(&dword_2106D5000, v6, v7, "failed to remove username/password from the Keychain, %s (%d)", buf, 0x12u);
      }
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v1 = 1;
    }
  }
  my_CFRelease((const void **)&v10);
  return v1;
}

__CFString *EAPOLClientItemIDSetPasswordItem(uint64_t a1, uint64_t a2, const __CFData *a3, void *a4)
{
  int v4 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFDataRef v23 = 0;
  theCFDataRef Data = 0;
  if (a3 && a4)
  {
    int v4 = (__CFString *)EAPOLClientItemIDCopyUniqueString(a1, 1);
    int v25 = v4;
    if (!v4)
    {
LABEL_22:
      my_CFRelease((const void **)&theData);
      my_CFRelease((const void **)&v23);
      my_CFRelease(&v25);
      return v4;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v4;
      _os_log_impl(&dword_2106D5000, LogHandle, v8, "adding/updating username/password for [%@]", buf, 0xCu);
    }
    EAPKeychainCopyPasswordItem(v4, &theData, &v23);
    if (theData)
    {
      CFIndex Length = CFDataGetLength(theData);
      BOOL v13 = 1;
      if (Length == CFDataGetLength(a3))
      {
        BytePtr = CFDataGetBytePtr(theData);
        int v11 = CFDataGetBytePtr(a3);
        size_t v12 = CFDataGetLength(theData);
        if (!memcmp(BytePtr, v11, v12)) {
          BOOL v13 = 0;
        }
      }
      if (v23)
      {
        CFIndex v14 = CFDataGetLength(v23);
        if (v14 != CFDataGetLength((CFDataRef)a4)
          || (uint64_t v15 = CFDataGetBytePtr(v23),
              CFStringRef v16 = CFDataGetBytePtr(a3),
              size_t v17 = CFDataGetLength(theData),
              memcmp(v15, v16, v17)))
        {
          int v18 = 1;
LABEL_18:
          if (v13) {
            int v21 = 1;
          }
          else {
            int v21 = v18;
          }
          int v4 = (__CFString *)(EAPKeychainSetPasswordItem(v4, a3, a4, v21) == 0);
          goto LABEL_22;
        }
      }
      else
      {
        __int16 v19 = EAPLogGetLogHandle();
        os_log_type_t v20 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v27 = v4;
          _os_log_impl(&dword_2106D5000, v19, v20, "failed to find current password for [%@]", buf, 0xCu);
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    int v18 = 0;
    goto LABEL_18;
  }
  return v4;
}

uint64_t __EAPOLClientItemIDInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kEAPOLClientItemIDCFTypeID TypeID = result;
  return result;
}

void __EAPOLClientItemIDDeallocate(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 16);
  BOOL v2 = v1 > 5;
  int v3 = (1 << v1) & 0x2E;
  if (!v2 && v3 != 0) {
    CFRelease(*(CFTypeRef *)(a1 + 24));
  }
}

uint64_t __EAPOLClientItemIDEqual(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)) {
    return CFEqual(*(CFTypeRef *)(a1 + 24), *(CFTypeRef *)(a2 + 24));
  }
  else {
    return 0;
  }
}

CFHashCode __EAPOLClientItemIDHash(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 24));
}

__CFString *__EAPOLClientItemIDCopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<EAPOLClientItemID %p [%p]> {", a1, v2);
  switch(*(_DWORD *)(a1 + 16))
  {
    case 1:
      CFStringRef v4 = my_CFStringCreateWithData(*(const void **)(a1 + 24));
      CFStringAppendFormat(Mutable, 0, @"WLAN SSuint64_t ID = %@", v4);
      CFRelease(v4);
      break;
    case 2:
      CFStringAppendFormat(Mutable, 0, @"Profileuint64_t ID = %@", *(void *)(a1 + 24));
      break;
    case 3:
      uint64_t ID = EAPOLClientProfileGetID(*(void *)(a1 + 24));
      CFStringAppendFormat(Mutable, 0, @"Profile = %@", ID);
      break;
    case 4:
      CFStringAppend(Mutable, @"Default");
      break;
    case 5:
      CFStringAppendFormat(Mutable, 0, @"WLAN domain = %@", *(void *)(a1 + 24));
      break;
    default:
      break;
  }
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

CFIndex accept_types_valid(const __CFArray *a1)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    CFIndex result = CFArrayGetCount(a1);
    if (!result) {
      return result;
    }
    if ((int)result < 1) {
      return 1;
    }
    CFIndex v4 = 0;
    uint64_t v5 = result;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      CFTypeID v7 = CFNumberGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v7) {
        break;
      }
      if (v5 == ++v4) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t EAPOLClientProfileGetTypeID()
{
  return __kEAPOLClientProfileTypeID;
}

void *EAPOLClientProfileCreate(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  __EAPOLClientProfileAllocate();
  CFIndex v4 = v3;
  os_log_type_t v6 = v3;
  if (v3)
  {
    v3[3] = my_CFUUIDStringCreate(v2);
    if (!EAPOLClientConfigurationAddProfile((uint64_t)a1, v4))
    {
      my_CFRelease(&v6);
      return v6;
    }
  }
  return v4;
}

double __EAPOLClientProfileAllocate()
{
  pthread_once(&__EAPOLClientProfileRegisterClass_initialized, (void (*)(void))__EAPOLClientProfileInitialize);
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  double result = 0.0;
  Instance[1] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  return result;
}

uint64_t EAPOLClientProfileGetUserDefinedName(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void EAPOLClientProfileSetUserDefinedName(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFIndex v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 40) = cf;
}

uint64_t EAPOLClientProfileGetID(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t EAPOLClientProfileGetAuthenticationProperties(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void EAPOLClientProfileSetAuthenticationProperties(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFIndex v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 32) = cf;
}

uint64_t EAPOLClientProfileGetWLANSSIDAndSecurityType(uint64_t a1, void *a2)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    if (a2)
    {
      *a2 = *(void *)(a1 + 56);
      return *(void *)(a1 + 48);
    }
  }
  else
  {
    uint64_t result = 0;
    if (a2) {
      *a2 = 0;
    }
  }
  return result;
}

uint64_t EAPOLClientProfileSetWLANSSIDAndSecurityType(void *a1, void *cf, CFTypeRef a3)
{
  if (!cf)
  {
    if (!a3) {
      goto LABEL_7;
    }
    return 0;
  }
  uint64_t result = 0;
  if (!a3 || a1[8]) {
    return result;
  }
  uint64_t v7 = a1[2];
  if (v7)
  {
    ProfileWithWLANSSuint64_t ID = EAPOLClientConfigurationGetProfileWithWLANSSID(v7, cf);
    if (ProfileWithWLANSSID)
    {
      if (ProfileWithWLANSSID != a1) {
        return 0;
      }
    }
  }
LABEL_7:
  BOOL v9 = (void *)a1[6];
  if (v9)
  {
    uint64_t v10 = a1[2];
    if (v10) {
      EAPOLClientConfigurationSetProfileForSSID(v10, v9, 0);
    }
  }
  if (cf)
  {
    CFRetain(cf);
    uint64_t v11 = a1[2];
    if (v11) {
      EAPOLClientConfigurationSetProfileForSSID(v11, cf, (uint64_t)a1);
    }
  }
  if (a3) {
    CFRetain(a3);
  }
  size_t v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  BOOL v13 = (const void *)a1[7];
  if (v13) {
    CFRelease(v13);
  }
  a1[6] = cf;
  a1[7] = a3;
  return 1;
}

uint64_t EAPOLClientProfileGetWLANDomain(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t EAPOLClientProfileSetWLANDomain(void *a1, void *cf)
{
  if (cf)
  {
    if (a1[6]) {
      return 0;
    }
    uint64_t v5 = a1[2];
    if (v5)
    {
      ProfileWithCFAllocatorRef WLANDomain = EAPOLClientConfigurationGetProfileWithWLANDomain(v5, cf);
      if (ProfileWithWLANDomain)
      {
        if (ProfileWithWLANDomain != a1) {
          return 0;
        }
      }
    }
  }
  uint64_t v7 = (void *)a1[8];
  if (v7)
  {
    uint64_t v8 = a1[2];
    if (v8) {
      EAPOLClientConfigurationSetProfileForWLANDomain(v8, v7, 0);
    }
  }
  if (cf)
  {
    CFRetain(cf);
    uint64_t v9 = a1[2];
    if (v9) {
      EAPOLClientConfigurationSetProfileForWLANDomain(v9, cf, (uint64_t)a1);
    }
  }
  uint64_t v10 = (const void *)a1[8];
  if (v10) {
    CFRelease(v10);
  }
  a1[8] = cf;
  return 1;
}

BOOL EAPOLClientProfileSetInformation(uint64_t a1, const __CFString *a2, const void *a3)
{
  BOOL result = applicationID_is_valid(a2);
  if (result)
  {
    if (!a3)
    {
      uint64_t v9 = *(__CFDictionary **)(a1 + 72);
      if (v9) {
        CFDictionaryRemoveValue(v9, a2);
      }
      return 1;
    }
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a3) == TypeID)
    {
      CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a1 + 72);
      if (!Mutable)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        *(void *)(a1 + 72) = Mutable;
      }
      CFDictionarySetValue(Mutable, a2, a3);
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL applicationID_is_valid(const __CFString *a1)
{
  return CFStringGetLength(a1) >= 3 && CFStringFind(a1, @".", 0).location != -1;
}

const void *EAPOLClientProfileGetInformation(uint64_t a1, const __CFString *a2)
{
  if (!*(void *)(a1 + 72)) {
    return 0;
  }
  if (!applicationID_is_valid(a2)) {
    return 0;
  }
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value) {
    return 0;
  }
  if (CFGetTypeID(Value) == TypeID) {
    return Value;
  }
  return 0;
}

__CFDictionary *EAPOLClientProfileCreatePropertyList(uint64_t a1)
{
  value = 0;
  DictAndProfileuint64_t ID = EAPOLClientProfileCreateDictAndProfileID(a1, (CFTypeRef *)&value);
  CFAllocatorRef v2 = DictAndProfileID;
  if (DictAndProfileID) {
    CFDictionarySetValue(DictAndProfileID, @"ProfileID", value);
  }
  return v2;
}

__CFDictionary *EAPOLClientProfileCreateDictAndProfileID(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDictionaryRef Value = *(const __CFDictionary **)(a1 + 32);
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"AcceptEAPTypes");
  }
  if (accept_types_valid(Value))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (a2) {
      *a2 = CFRetain(*(CFTypeRef *)(a1 + 24));
    }
    CFDictionarySetValue(Mutable, @"AuthenticationProperties", *(const void **)(a1 + 32));
    os_log_type_t v6 = *(const void **)(a1 + 40);
    if (v6) {
      CFDictionarySetValue(Mutable, @"UserDefinedName", v6);
    }
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 72);
    if (v7 && CFDictionaryGetCount(v7)) {
      CFDictionarySetValue(Mutable, @"Information", *(const void **)(a1 + 72));
    }
    uint64_t v8 = *(void **)(a1 + 48);
    if (v8)
    {
      keys = @"SSID";
      size_t v17 = @"SecurityType";
      uint64_t v9 = *(void *)(a1 + 56);
      values = v8;
      uint64_t v15 = v9;
      CFIndex v10 = 2;
LABEL_16:
      CFDictionaryRef v12 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v10, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, @"WLAN", v12);
      CFRelease(v12);
      return Mutable;
    }
    uint64_t v11 = *(void **)(a1 + 64);
    if (v11)
    {
      keys = @"Domain";
      size_t v17 = 0;
      values = v11;
      uint64_t v15 = 0;
      CFIndex v10 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    SCLog();
    return 0;
  }
  return Mutable;
}

void *EAPOLClientProfileCreateWithPropertyList(const void *a1)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"ProfileID");
  CFTypeID v4 = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != v4) {
    return 0;
  }
  return EAPOLClientProfileCreateWithDictAndProfileID(a1, Value);
}

void *EAPOLClientProfileCreateWithDictAndProfileID(const void *a1, const void *a2)
{
  CFGetAllocator(a1);
  CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationProperties");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value) {
    goto LABEL_14;
  }
  if (CFGetTypeID(Value) != TypeID) {
    goto LABEL_14;
  }
  if (!CFDictionaryGetCount((CFDictionaryRef)Value)) {
    goto LABEL_14;
  }
  CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)Value, @"AcceptEAPTypes");
  if (!accept_types_valid(v6)) {
    goto LABEL_14;
  }
  CFDictionaryRef v7 = CFDictionaryGetValue((CFDictionaryRef)a1, @"WLAN");
  if (v7)
  {
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v7) != v8)
    {
LABEL_14:
      SCLog();
      return 0;
    }
    uint64_t v9 = (void *)CFDictionaryGetValue((CFDictionaryRef)v7, @"SSID");
    CFIndex v10 = (void *)CFDictionaryGetValue((CFDictionaryRef)v7, @"Domain");
    CFTypeID v11 = CFDataGetTypeID();
    if (v9 && CFGetTypeID(v9) == v11) {
      goto LABEL_12;
    }
    CFTypeID v12 = CFStringGetTypeID();
    if (!v10 || CFGetTypeID(v10) != v12) {
      goto LABEL_14;
    }
    if (v9)
    {
LABEL_12:
      CFDictionaryRef v7 = CFDictionaryGetValue((CFDictionaryRef)v7, @"SecurityType");
      CFTypeID v13 = CFStringGetTypeID();
      if (!v7 || CFGetTypeID(v7) != v13) {
        goto LABEL_14;
      }
    }
    else
    {
      CFDictionaryRef v7 = 0;
    }
  }
  else
  {
    CFIndex v10 = 0;
    uint64_t v9 = 0;
  }
  CFStringRef v16 = CFDictionaryGetValue((CFDictionaryRef)a1, @"UserDefinedName");
  if (v16)
  {
    CFTypeID v17 = CFStringGetTypeID();
    if (CFGetTypeID(v16) != v17) {
      goto LABEL_14;
    }
  }
  uint64_t v18 = CFDictionaryGetValue((CFDictionaryRef)a1, @"Information");
  if (v18)
  {
    CFTypeID v19 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v18) != v19) {
      goto LABEL_14;
    }
  }
  __EAPOLClientProfileAllocate();
  CFIndex v14 = v20;
  if (v20)
  {
    unsigned char v20[3] = CFRetain(a2);
    EAPOLClientProfileSetUserDefinedName((uint64_t)v14, v16);
    EAPOLClientProfileSetAuthenticationProperties((uint64_t)v14, Value);
    if (v9)
    {
      EAPOLClientProfileSetWLANSSIDAndSecurityType(v14, v9, v7);
    }
    else if (v10)
    {
      EAPOLClientProfileSetWLANDomain(v14, v10);
    }
    if (v18) {
      v14[9] = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v18);
    }
  }
  return v14;
}

uint64_t EAPOLClientProfileSetConfiguration(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t __EAPOLClientProfileInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kEAPOLClientProfileCFTypeID TypeID = result;
  return result;
}

void __EAPOLClientProfileDeallocate(const void **a1)
{
  my_CFRelease(a1 + 3);
  my_CFRelease(a1 + 4);
  my_CFRelease(a1 + 5);
  my_CFRelease(a1 + 6);
  my_CFRelease(a1 + 7);
  my_CFRelease(a1 + 9);
}

uint64_t __EAPOLClientProfileEqual(CFTypeRef *a1, CFTypeRef *a2)
{
  uint64_t result = CFEqual(a1[3], a2[3]);
  if (result)
  {
    uint64_t result = my_CFEqual(a1[4], a2[4]);
    if (result)
    {
      uint64_t result = my_CFEqual(a1[5], a2[5]);
      if (result)
      {
        uint64_t result = my_CFEqual(a1[6], a2[6]);
        if (result)
        {
          uint64_t result = my_CFEqual(a1[7], a2[7]);
          if (result) {
            return my_CFEqual(a1[9], a2[9]) != 0;
          }
        }
      }
    }
  }
  return result;
}

CFHashCode __EAPOLClientProfileHash(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 24));
}

__CFString *__EAPOLClientProfileCopyDebugDesc(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<EAPOLClientProfile %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0, @"Profileuint64_t ID = %@", a1[3]);
  if (a1[5]) {
    CFStringAppendFormat(Mutable, 0, @" Name = '%@'", a1[5]);
  }
  CFTypeID v4 = (const void *)a1[6];
  if (v4)
  {
    CFStringRef v5 = my_CFStringCreateWithData(v4);
    CFStringAppendFormat(Mutable, 0, @", WLAN SSID %@ [%@]", v5, a1[7]);
    CFRelease(v5);
  }
  if (a1[4]) {
    CFStringAppendFormat(Mutable, 0, @", auth_props = %@", a1[4]);
  }
  CFDictionaryRef v6 = (const __CFDictionary *)a1[9];
  if (v6 && CFDictionaryGetCount(v6)) {
    CFStringAppendFormat(Mutable, 0, @", info = %@", a1[9]);
  }
  CFStringAppendFormat(Mutable, 0, @"}");
  return Mutable;
}

uint64_t EAPOLClientConfigurationGetTypeID()
{
  return __kEAPOLClientConfigurationTypeID;
}

uint64_t EAPOLClientConfigurationCreate(const __CFAllocator *a1)
{
  return EAPOLClientConfigurationCreateInternal(a1, 0, 0);
}

uint64_t EAPOLClientConfigurationCreateInternal(const __CFAllocator *a1, const AuthorizationOpaqueRef *a2, int a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  pthread_once(&__EAPOLClientConfigurationRegisterClass_initialized, (void (*)(void))__EAPOLClientConfigurationInitialize);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(void *)(Instance + 96) = 0;
  uint64_t v36 = Instance;
  if (Instance)
  {
    if (a3 == 1) {
      SCPreferencesRef v7 = SCPreferencesCreateWithAuthorization(a1, @"EAPOLClientConfiguration", @"com.apple.network.eapolclient.configuration.plist", a2);
    }
    else {
      SCPreferencesRef v7 = SCPreferencesCreate(a1, @"EAPOLClientConfiguration", @"com.apple.network.eapolclient.configuration.plist");
    }
    *(void *)(Instance + 24) = v7;
    if (v7)
    {
      CFTypeID v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      uint64_t v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, v8, v9);
      CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(0, 0, v8, v9);
      CFDictionaryRef Value = (const __CFDictionary *)SCPreferencesGetValue(*(SCPreferencesRef *)(Instance + 24), @"Profiles");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID)
        {
          int Count = CFDictionaryGetCount(Value);
          int v16 = Count;
          if (Count)
          {
            CFMutableDictionaryRef theDict = v12;
            CFMutableDictionaryRef v35 = (const void **)malloc_type_malloc(16 * Count, 0x9BFCB1FEuLL);
            CFDictionaryGetKeysAndValues(Value, v35, &v35[v16]);
            if (v16 >= 1)
            {
              uint64_t v17 = v16;
              uint64_t v18 = v16;
              CFTypeID v19 = v35;
              do
              {
                os_log_type_t v20 = v19[v17];
                int v21 = *v19;
                CFTypeID v22 = CFDictionaryGetTypeID();
                if (v20 && CFGetTypeID(v20) == v22)
                {
                  CFDataRef v23 = EAPOLClientProfileCreateWithDictAndProfileID(v20, v21);
                  if (v23)
                  {
                    __int16 v24 = v23;
                    WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)v23, 0);
                    if (WLANSSIDAndSecurityType)
                    {
                      os_log_type_t v26 = WLANSSIDAndSecurityType;
                      if (CFDictionaryGetValue(v11, WLANSSIDAndSecurityType))
                      {
                        CFStringRef v33 = my_CFStringCreateWithData(v26);
                        SCLog();
                        CFRelease(v33);
LABEL_25:
                        CFRelease(v24);
                        goto LABEL_26;
                      }
                      uint64_t v28 = v11;
                      goto LABEL_23;
                    }
                    CFAllocatorRef WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain((uint64_t)v24);
                    if (WLANDomain)
                    {
                      os_log_type_t v26 = WLANDomain;
                      if (CFDictionaryGetValue(Mutable, WLANDomain))
                      {
                        SCLog();
                        goto LABEL_25;
                      }
                      uint64_t v28 = theDict;
LABEL_23:
                      CFDictionarySetValue(v28, v26, v21);
                    }
                    CFDictionarySetValue(Mutable, v21, v24);
                    EAPOLClientProfileSetConfiguration((uint64_t)v24, Instance);
                    goto LABEL_25;
                  }
                }
                else
                {
                  SCLog();
                }
LABEL_26:
                ++v19;
                --v18;
              }
              while (v18);
            }
            free(v35);
            CFMutableDictionaryRef v12 = theDict;
          }
        }
      }
      *(void *)(Instance + 48) = Mutable;
      *(void *)(Instance + 56) = v11;
      *(void *)(Instance + 64) = v12;
      *(void *)(Instance + 72) = copy_def_auth_props(*(const __SCPreferences **)(Instance + 24));
    }
    else
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v30))
      {
        int v31 = SCError();
        *(_DWORD *)buf = 136315138;
        size_t v38 = SCErrorString(v31);
        _os_log_impl(&dword_2106D5000, LogHandle, v30, "failed to create preferences %s", buf, 0xCu);
      }
      my_CFRelease((const void **)&v36);
      return 0;
    }
  }
  return Instance;
}

uint64_t EAPOLClientConfigurationCreateWithAuthorization(const __CFAllocator *a1, const AuthorizationOpaqueRef *a2)
{
  return EAPOLClientConfigurationCreateInternal(a1, a2, 1);
}

uint64_t EAPOLClientConfigurationSave(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 48));
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, Count, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)buf = Mutable;
  if (Count)
  {
    CFTypeID v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 48), 0, v4);
    if (Count >= 1)
    {
      uint64_t v5 = Count;
      CFDictionaryRef v6 = (uint64_t *)v4;
      while (1)
      {
        uint64_t v7 = *v6;
        char key = 0;
        DictAndProfileuint64_t ID = EAPOLClientProfileCreateDictAndProfileID(v7, (CFTypeRef *)&key);
        if (!DictAndProfileID) {
          break;
        }
        uint64_t v9 = DictAndProfileID;
        CFDictionarySetValue(Mutable, key, DictAndProfileID);
        CFRelease(v9);
        CFRelease(key);
        ++v6;
        if (!--v5) {
          goto LABEL_8;
        }
      }
      my_CFRelease((const void **)buf);
      CFDictionaryRef Mutable = *(__CFDictionary **)buf;
    }
LABEL_8:
    free(v4);
  }
  char key = Mutable;
  if (!Mutable)
  {
    LogHandle = EAPLogGetLogHandle();
    uint64_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, (os_log_type_t)v20))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "EAPOLClientConfigurationSave export_profiles() failed";
      int v21 = LogHandle;
      os_log_type_t v22 = v20;
      uint32_t v23 = 2;
LABEL_28:
      _os_log_impl(&dword_2106D5000, v21, v22, v18, buf, v23);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), @"Profiles");
  if (*(unsigned char *)(a1 + 80)) {
    goto LABEL_14;
  }
  if (my_CFEqual(Value, key) && !*(unsigned char *)(a1 + 96))
  {
    uint64_t v26 = 0;
    char v28 = 1;
    goto LABEL_36;
  }
  if (*(unsigned char *)(a1 + 80))
  {
LABEL_14:
    if (!SCPreferencesSetValue(*(SCPreferencesRef *)(a1 + 24), @"DefaultAuthenticationProperties", *(CFPropertyListRef *)(a1 + 72)))
    {
      CFIndex v14 = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_29;
      }
LABEL_26:
      int v24 = SCError();
      int v25 = SCErrorString(v24);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v25;
      uint64_t v18 = "EAPOLClientConfigurationSave SCPreferencesSetValue failed %s";
      goto LABEL_27;
    }
  }
  if (!SCPreferencesSetValue(*(SCPreferencesRef *)(a1 + 24), @"Profiles", key))
  {
    CFIndex v14 = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (*(unsigned char *)(a1 + 96) == 1)
  {
    CFDictionaryRef v11 = *(const void **)(a1 + 88);
    CFMutableDictionaryRef v12 = *(const __SCPreferences **)(a1 + 24);
    if (v11)
    {
      int v13 = SCPreferencesSetValue(v12, @"SystemModeEthernetProfileID", v11);
      my_CFRelease((const void **)(a1 + 88));
      if (!v13)
      {
        CFIndex v14 = EAPLogGetLogHandle();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
LABEL_20:
          int v16 = SCError();
          uint64_t v17 = SCErrorString(v16);
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v17;
          uint64_t v18 = "EAPOLClientConfigurationSave SCPreferencesRemoveValue failed %s";
LABEL_27:
          int v21 = v14;
          os_log_type_t v22 = v15;
          uint32_t v23 = 12;
          goto LABEL_28;
        }
LABEL_29:
        my_CFRelease((const void **)&key);
        return 0;
      }
    }
    else if (!SCPreferencesRemoveValue(v12, @"SystemModeEthernetProfileID"))
    {
      CFIndex v14 = EAPLogGetLogHandle();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_29;
      }
      goto LABEL_20;
    }
  }
  uint64_t v29 = SCPreferencesCommitChanges(*(SCPreferencesRef *)(a1 + 24));
  if (!v29)
  {
    os_log_type_t v30 = EAPLogGetLogHandle();
    os_log_type_t v31 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v30, v31))
    {
      int v32 = SCError();
      CFStringRef v33 = SCErrorString(v32);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl(&dword_2106D5000, v30, v31, "EAPOLClientConfigurationSave SCPreferencesCommitChanges failed %s", buf, 0xCu);
    }
    return 0;
  }
  uint64_t v26 = v29;
  *(unsigned char *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  SCPreferencesApplyChanges(*(SCPreferencesRef *)(a1 + 24));
  char v28 = 0;
LABEL_36:
  my_CFRelease((const void **)(a1 + 32));
  my_CFRelease((const void **)&key);
  if ((v28 & 1) == 0) {
    notify_post((const char *)kEAPOLClientConfigurationChangedNotifyKey);
  }
  return v26;
}

CFArrayRef EAPOLClientConfigurationCopyProfiles(CFDictionaryRef *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  int Count = CFDictionaryGetCount(a1[6]);
  if (!Count) {
    return 0;
  }
  CFIndex v4 = Count;
  uint64_t v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1[6], 0, v5);
  CFArrayRef v6 = CFArrayCreate(v2, v5, v4, MEMORY[0x263EFFF70]);
  free(v5);
  return v6;
}

const void *EAPOLClientConfigurationGetProfileWithID(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), a2);
}

const void *EAPOLClientConfigurationGetProfileWithWLANSSID(uint64_t a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
  if (result)
  {
    CFIndex v4 = result;
    CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 48);
    return CFDictionaryGetValue(v5, v4);
  }
  return result;
}

const void *EAPOLClientConfigurationGetProfileWithWLANDomain(uint64_t a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (result)
  {
    CFIndex v4 = result;
    CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 48);
    return CFDictionaryGetValue(v5, v4);
  }
  return result;
}

uint64_t EAPOLClientConfigurationRemoveProfile(uint64_t a1, const void *a2)
{
  uint64_t ID = (const void *)EAPOLClientProfileGetID((uint64_t)a2);
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), ID) != a2) {
    return 0;
  }
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)a2, 0);
  if (WLANSSIDAndSecurityType) {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 56), WLANSSIDAndSecurityType);
  }
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), ID);
  CFPropertyListRef Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), @"SystemModeEthernetProfileID");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 1;
  }
  int v9 = my_CFEqual(Value, ID);
  uint64_t result = 1;
  if (v9)
  {
    uint64_t v11 = *(void *)(a1 + 88);
    uint64_t v10 = a1 + 88;
    *(unsigned char *)(v10 + 8) = 1;
    if (v11)
    {
      my_CFRelease((const void **)v10);
      return 1;
    }
  }
  return result;
}

uint64_t EAPOLClientConfigurationAddProfile(uint64_t a1, void *a2)
{
  uint64_t ID = (const void *)EAPOLClientProfileGetID((uint64_t)a2);
  if (a2[2]) {
    return 0;
  }
  CFDictionaryRef v5 = ID;
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), ID)) {
    return 0;
  }
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType((uint64_t)a2, 0);
  if (!WLANSSIDAndSecurityType)
  {
    CFAllocatorRef WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain((uint64_t)a2);
    if (!WLANDomain)
    {
      int v9 = *(__CFDictionary **)(a1 + 48);
      uint64_t v11 = v5;
      CFMutableDictionaryRef v12 = a2;
      goto LABEL_12;
    }
    CFTypeID v8 = WLANDomain;
    if (!EAPOLClientConfigurationGetProfileWithWLANDomain(a1, WLANDomain))
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), v5, a2);
      int v9 = *(__CFDictionary **)(a1 + 64);
      goto LABEL_10;
    }
    return 0;
  }
  CFTypeID v8 = WLANSSIDAndSecurityType;
  if (EAPOLClientConfigurationGetProfileWithWLANSSID(a1, WLANSSIDAndSecurityType)) {
    return 0;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), v5, a2);
  int v9 = *(__CFDictionary **)(a1 + 56);
LABEL_10:
  uint64_t v11 = v8;
  CFMutableDictionaryRef v12 = v5;
LABEL_12:
  CFDictionarySetValue(v9, v11, v12);
  EAPOLClientProfileSetConfiguration((uint64_t)a2, a1);
  return 1;
}

CFArrayRef EAPOLClientConfigurationCopyMatchingProfiles(CFDictionaryRef *a1, uint64_t a2)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  uint64_t ID = (const void *)EAPOLClientProfileGetID(a2);
  values[0] = 0;
  values[1] = 0;
  CFPropertyListRef Value = (void *)CFDictionaryGetValue(a1[6], ID);
  CFArrayRef v6 = Value;
  if (Value)
  {
    values[0] = Value;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  WLANSSIDAndSecurityType = (const void *)EAPOLClientProfileGetWLANSSIDAndSecurityType(a2, 0);
  if (WLANSSIDAndSecurityType)
  {
    ProfileWithWLANSSuint64_t ID = (void *)EAPOLClientConfigurationGetProfileWithWLANSSID((uint64_t)a1, WLANSSIDAndSecurityType);
    if (!ProfileWithWLANSSID) {
      goto LABEL_11;
    }
  }
  else
  {
    CFAllocatorRef WLANDomain = (const void *)EAPOLClientProfileGetWLANDomain(a2);
    if (!WLANDomain) {
      goto LABEL_11;
    }
    ProfileWithWLANSSuint64_t ID = (void *)EAPOLClientConfigurationGetProfileWithWLANDomain((uint64_t)a1, WLANDomain);
    if (!ProfileWithWLANSSID) {
      goto LABEL_11;
    }
  }
  if (v6 != ProfileWithWLANSSID)
  {
    values[v7] = ProfileWithWLANSSID;
    CFIndex v11 = (v7 + 1);
LABEL_13:
    CFAllocatorRef v12 = CFGetAllocator(a1);
    return CFArrayCreate(v12, (const void **)values, v11, MEMORY[0x263EFFF70]);
  }
LABEL_11:
  if (v6)
  {
    CFIndex v11 = 1;
    goto LABEL_13;
  }
  return 0;
}

const void *EAPOLClientConfigurationGetSystemEthernetProfile(uint64_t a1)
{
  CFPropertyListRef Value = SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), @"SystemModeEthernetProfileID");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 48);
  return CFDictionaryGetValue(v4, Value);
}

uint64_t EAPOLClientConfigurationSetSystemEthernetProfile(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 88);
  CFDictionaryRef v4 = (const void **)(a1 + 88);
  if (v5) {
    my_CFRelease(v4);
  }
  *(unsigned char *)(a1 + 96) = 0;
  uint64_t Value = (uint64_t)SCPreferencesGetValue(*(SCPreferencesRef *)(a1 + 24), @"SystemModeEthernetProfileID");
  if (!a2)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (!Value) {
      return Value;
    }
    if (CFGetTypeID((CFTypeRef)Value) == TypeID)
    {
      uint64_t Value = 1;
      *(unsigned char *)(a1 + 96) = 1;
      return Value;
    }
    return 0;
  }
  uint64_t ID = EAPOLClientProfileGetID(a2);
  if (!ID) {
    return 0;
  }
  CFTypeID v8 = (const void *)ID;
  CFTypeID v9 = CFStringGetTypeID();
  if (Value)
  {
    if (CFGetTypeID((CFTypeRef)Value) == v9 && my_CFEqual((const void *)Value, v8)) {
      return 0;
    }
  }
  uint64_t Value = 1;
  *(unsigned char *)(a1 + 96) = 1;
  *(void *)(a1 + 88) = v8;
  CFRetain(v8);
  return Value;
}

uint64_t EAPOLClientConfigurationGetDefaultAuthenticationProperties(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

CFIndex EAPOLClientConfigurationSetDefaultAuthenticationProperties(uint64_t a1, const __CFDictionary *a2)
{
  my_CFRelease((const void **)(a1 + 72));
  if (a2)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"AcceptEAPTypes");
    CFIndex result = accept_types_valid(Value);
    if (!result) {
      return result;
    }
    CFArrayRef v6 = (void *)CFRetain(a2);
  }
  else
  {
    CFArrayRef v6 = copy_def_auth_props(*(const __SCPreferences **)(a1 + 24));
  }
  *(void *)(a1 + 72) = v6;
  CFIndex result = 1;
  *(unsigned char *)(a1 + 80) = 1;
  return result;
}

CFMutableDictionaryRef copy_def_auth_props(const __SCPreferences *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v9 = xmmword_210709BD0;
  CFDictionaryRef Value = (const __CFDictionary *)SCPreferencesGetValue(a1, @"DefaultAuthenticationProperties");
  if (Value)
  {
    CFMutableDictionaryRef v2 = Value;
    CFArrayRef v3 = (const __CFArray *)CFDictionaryGetValue(Value, @"AcceptEAPTypes");
    if (accept_types_valid(v3))
    {
      CFRetain(v2);
      return v2;
    }
    if (v3) {
      SCLog();
    }
  }
  CFDictionaryRef Mutable = CFArrayCreateMutable(0, 4, MEMORY[0x263EFFF70]);
  for (uint64_t i = 0; i != 16; i += 4)
  {
    CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, (char *)&v9 + i);
    CFArrayAppendValue(Mutable, v6);
    CFRelease(v6);
  }
  CFMutableDictionaryRef v2 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v2, @"AcceptEAPTypes", Mutable);
  int v7 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(v2, @"EAPFASTUsePAC", (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(v2, @"EAPFASTProvisionPAC", v7);
  CFRelease(Mutable);
  return v2;
}

void EAPOLClientConfigurationSetProfileForSSID(uint64_t a1, void *key, uint64_t a3)
{
  CFDictionaryRef v4 = *(__CFDictionary **)(a1 + 56);
  if (a3)
  {
    uint64_t ID = (const void *)EAPOLClientProfileGetID(a3);
    CFDictionarySetValue(v4, key, ID);
  }
  else
  {
    CFNumberRef v6 = *(__CFDictionary **)(a1 + 56);
    CFDictionaryRemoveValue(v6, key);
  }
}

void EAPOLClientConfigurationSetProfileForWLANDomain(uint64_t a1, void *key, uint64_t a3)
{
  CFDictionaryRef v4 = *(__CFDictionary **)(a1 + 64);
  if (a3)
  {
    uint64_t ID = (const void *)EAPOLClientProfileGetID(a3);
    CFDictionarySetValue(v4, key, ID);
  }
  else
  {
    CFNumberRef v6 = *(__CFDictionary **)(a1 + 64);
    CFDictionaryRemoveValue(v6, key);
  }
}

uint64_t __EAPOLClientConfigurationInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kEAPOLClientConfigurationCFTypeID TypeID = result;
  return result;
}

void __EAPOLClientConfigurationDeallocate(uint64_t a1)
{
  CFMutableDictionaryRef v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 16) = 0;
  }
  my_CFRelease((const void **)(a1 + 24));
  my_CFRelease((const void **)(a1 + 32));
  my_CFRelease((const void **)(a1 + 40));
  my_CFRelease((const void **)(a1 + 48));
  my_CFRelease((const void **)(a1 + 56));
  my_CFRelease((const void **)(a1 + 64));
  my_CFRelease((const void **)(a1 + 72));
}

__CFString *__EAPOLClientConfigurationCopyDebugDesc(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFDictionaryRef v4 = Mutable;
  if (a1[2]) {
    CFStringAppendFormat(Mutable, 0, @"<EAPOLClientConfiguration %p [%p] auth> {", a1, v2);
  }
  else {
    CFStringAppendFormat(Mutable, 0, @"<EAPOLClientConfiguration %p [%p]> {", a1, v2);
  }
  CFStringAppendFormat(v4, 0, @"profiles = %@", a1[6]);
  CFStringAppendFormat(v4, 0, @"ssids = %@", a1[7]);
  CFStringAppend(v4, @"}");
  return v4;
}

CCCryptorRef sim_simulator_gsm_milenage_algo(int8x16_t *a1, void *key, int8x16_t *a3, _DWORD *a4, int8x8_t *a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int8x16_t v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  int8x16_t v19 = veorq_s8(*a1, v20);
  v19.i8[15] ^= 1u;
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  v10.i32[1] = v20.i32[1];
  int8x16_t v11 = veorq_s8(v20, *a1);
  int8x16_t v20 = v11;
  v11.i32[0] = v11.i32[2];
  v10.i32[0] = v20.i32[3];
  int8x8_t v17 = (int8x8_t)vmovl_u8(v10).u64[0];
  uint16x8_t v18 = vmovl_u8(*(uint8x8_t *)v11.i8);
  int8x16_t v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  for (uint64_t i = 0; i != 16; ++i)
    *(unsigned char *)((unint64_t)&v19 | ((int)i + 12) & 0xFLL) = a1->i8[i] ^ v20.i8[i];
  v19.i8[15] ^= 2u;
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  int8x16_t v20 = veorq_s8(v20, *a1);
  int8x16_t v13 = v20;
  int8x16_t v19 = veorq_s8(*a3, *a1);
  sim_simulator_aes128_encrypt(key, &v19, &v20);
  for (uint64_t j = 0; j != 16; ++j)
    *(unsigned char *)((unint64_t)&v19 | ((int)j + 8) & 0xFLL) = a1->i8[j] ^ v20.i8[j];
  v19.i8[15] ^= 4u;
  CCCryptorRef result = sim_simulator_aes128_encrypt(key, &v19, &v20);
  int8x16_t v20 = veorq_s8(v20, *a1);
  *a5 = veor_s8(veor_s8(veor_s8((int8x8_t)v13.u64[1], *(int8x8_t *)v13.i8), *(int8x8_t *)v20.i8), (int8x8_t)v20.u64[1]);
  v16.i64[1] = v18.i64[1];
  *(int8x8_t *)v16.i8 = veor_s8(v17, *(int8x8_t *)v18.i8);
  *a4 = vmovn_s16(v16).u32[0];
  return result;
}

CCCryptorRef sim_simulator_aes128_encrypt(void *key, const void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  size_t v17 = 0;
  CCCryptorRef cryptorRef = 0;
  CCCryptorStatus v5 = CCCryptorCreate(0, 0, 2u, key, 0x10uLL, 0, &cryptorRef);
  if (v5)
  {
    CCCryptorStatus v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v8)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 67109120;
    CCCryptorStatus v20 = v6;
    long long v9 = "CCCryptoCreate failed with %d";
    uint8x8_t v10 = LogHandle;
    os_log_type_t v11 = v8;
  }
  else
  {
    CCCryptorStatus v12 = CCCryptorUpdate(cryptorRef, a2, 0x10uLL, a3, 0x10uLL, &v17);
    if (!v12) {
      goto LABEL_8;
    }
    CCCryptorStatus v13 = v12;
    CFIndex v14 = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 67109120;
    CCCryptorStatus v20 = v13;
    long long v9 = "CCCryptorUpdate failed with %d";
    uint8x8_t v10 = v14;
    os_log_type_t v11 = v15;
  }
  _os_log_impl(&dword_2106D5000, v10, v11, v9, buf, 8u);
LABEL_8:
  CCCryptorRef result = cryptorRef;
  if (cryptorRef) {
    return (CCCryptorRef)CCCryptorRelease(cryptorRef);
  }
  return result;
}

uint64_t EAPOLClientEstablishSession(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)special_port = 0;
  mach_error_t v2 = bootstrap_look_up2();
  if (v2)
  {
    mach_error_t v3 = v2;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(LogHandle, v5);
    if (!result) {
      return result;
    }
    LODWORD(v23[0]) = 136315138;
    *(void *)((char *)v23 + 4) = mach_error_string(v3);
    int v7 = "eapolcontroller_server_port(): %s";
    os_log_type_t v8 = (uint8_t *)v23;
    long long v9 = LogHandle;
    os_log_type_t v10 = v5;
    uint32_t v11 = 12;
    goto LABEL_7;
  }
  memset(v23, 0, sizeof(v23));
  __strlcpy_chk();
  uint64_t result = eapolcontroller_client_get_session(0, v23, special_port, &special_port[1]);
  if (result)
  {
    mach_error_t v12 = result;
    CCCryptorStatus v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(v13, v14);
    if (!result) {
      return result;
    }
    os_log_type_t v15 = mach_error_string(v12);
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = a1;
    __int16 v21 = 2080;
    os_log_type_t v22 = v15;
    int v7 = "eapolcontroller_client_get_session(%s): %s";
    os_log_type_t v8 = buf;
    long long v9 = v13;
    os_log_type_t v10 = v14;
    uint32_t v11 = 22;
    goto LABEL_7;
  }
  if (special_port[0] && special_port[1])
  {
    task_set_special_port(*MEMORY[0x263EF8960], 4, special_port[0]);
    if (audit_session_join(special_port[1])) {
      return 1;
    }
    int16x8_t v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(v16, v17);
    if (result)
    {
      *(_WORD *)buf = 0;
      int v7 = "audit_session_join returned AU_DEFAULTSID";
      os_log_type_t v8 = buf;
      long long v9 = v16;
      os_log_type_t v10 = v17;
      uint32_t v11 = 2;
LABEL_7:
      _os_log_impl(&dword_2106D5000, v9, v10, v7, v8, v11);
      return 0;
    }
  }
  return result;
}

uint64_t eapmschapv2_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 104)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 72;
}

uint64_t eapmschapv2_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if (!*(unsigned char *)(*a1 + 104)) {
    return 0;
  }
  *a2 = *(_OWORD *)(v3 + 88);
  a2[1] = *(_OWORD *)(v3 + 72);
  a2[2] = 0u;
  a2[3] = 0u;
  return 64;
}

__CFArray *eapmschapv2_require_props(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*(unsigned char *)(*a1 + 8) && !*(unsigned char *)(v1 + 9)) {
    return 0;
  }
  CFDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v3 = Mutable;
  if (*(unsigned char *)(v1 + 8)) {
    CFArrayAppendValue(Mutable, @"UserPassword");
  }
  if (*(unsigned char *)(v1 + 9)) {
    CFArrayAppendValue(v3, @"NewPassword");
  }
  return v3;
}

__CFString *eapmschapv2_copy_packet_description(unsigned __int8 *a1, char *a2)
{
  uint64_t Length = EAPPacketGetLength((uint64_t)a1);
  if (*a1 - 1 > 1)
  {
    CFDictionaryRef Mutable = 0;
LABEL_6:
    char v7 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = Length;
  CFDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  if (v5 <= 5)
  {
    CFStringAppendFormat(Mutable, 0, @"invalid packet: length %d < min length %ld\n", v5, 9);
    goto LABEL_6;
  }
  long long v9 = EAPCodeStr(*a1);
  unsigned int v10 = a1[5] - 1;
  if (v10 > 6) {
    uint32_t v11 = "<unknown>";
  }
  else {
    uint32_t v11 = off_264133BA8[(char)v10];
  }
  CFStringAppendFormat(Mutable, 0, @"EAP-MSCHAPv2 %s: Identifier %d Length %d OpCode %s ", v9, a1[1], v5, v11);
  switch(a1[5])
  {
    case 1u:
      if (v5 <= 0x19)
      {
        CFStringAppendFormat(Mutable, 0, @"Error: length %d < %d\n", v5, 26);
LABEL_50:
        char v7 = 0;
        goto LABEL_51;
      }
      CFStringAppendFormat(Mutable, 0, @"MS-CHAPv2-ID %d MS-Length %d Value-Size %d\n", a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16, a1[9]);
      if (a1[9] != 16) {
        CFStringAppendFormat(Mutable, 0, @"Error: Value-Size should be %d\n", 16);
      }
      if (v5 - 5 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
        CFStringAppendFormat(Mutable, 0, @"Error: MS-Length should be %d\n", v5 - 5, v19);
        goto LABEL_50;
      }
      CFStringAppendFormat(Mutable, 0, @"Challenge: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 10), 16);
      CFStringAppendFormat(Mutable, 0, @"\n");
      if (v5 != 26) {
        CFStringAppendFormat(Mutable, 0, @"Name: %.*s\n", (v5 - 26), a1 + 26);
      }
      char v7 = 1;
LABEL_51:
      if (*a1 != 2) {
        goto LABEL_7;
      }
      CFStringAppendFormat(Mutable, 0, @"EAP Response contains MSCHAPv2 Challenge (invalid)\n", v16, v19);
      goto LABEL_6;
    case 2u:
      if (v5 <= 0x3A)
      {
        CFStringAppendFormat(Mutable, 0, @"Error: length %d < %d\n", v5, 59);
LABEL_54:
        char v7 = 0;
        goto LABEL_55;
      }
      CFStringAppendFormat(Mutable, 0, @"MS-CHAPv2-ID %d MS-Length %d Value-Size %d\n", a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16, a1[9]);
      if (a1[9] != 49) {
        CFStringAppendFormat(Mutable, 0, @"Error: Value-Size should be %d\n", 49);
      }
      if (v5 - 5 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
        CFStringAppendFormat(Mutable, 0, @"Error: MS-Length should be %d\n", v5 - 5, v20);
        goto LABEL_54;
      }
      CFStringAppendFormat(Mutable, 0, @"Response:\n");
      CFStringAppendFormat(Mutable, 0, @"Peer Challenge: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 10), 16);
      CFStringAppendFormat(Mutable, 0, @"\nReserved:       ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 26), 8);
      CFStringAppendFormat(Mutable, 0, @"\nNT Response:    ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 34), 24);
      CFStringAppendFormat(Mutable, 0, @"\nFlags:          ");
      char v7 = 1;
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 58), 1);
      if (v5 != 59) {
        CFStringAppendFormat(Mutable, 0, @"\nName:           %.*s\n", (v5 - 59), a1 + 59);
      }
LABEL_55:
      if (*a1 == 1)
      {
        CFStringAppendFormat(Mutable, 0, @"EAP Request contains MSCHAPv2 Response (invalid)\n", v17, v20);
        goto LABEL_6;
      }
LABEL_7:
      *a2 = v7;
      return Mutable;
    case 3u:
      if (*a1 != 1) {
        goto LABEL_6;
      }
      if (v5 <= 0x32)
      {
        uint64_t v12 = 51;
        goto LABEL_26;
      }
      CFStringAppendFormat(Mutable, 0, @"MS-CHAPv2-ID %d MS-Length %d\n", a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      uint64_t v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16) {
        goto LABEL_48;
      }
      CFStringAppendFormat(Mutable, 0, @"Auth Response: %.*s\n", 42, a1 + 9);
      if ((v5 - 53) > 0xFFFFFFFD) {
        goto LABEL_47;
      }
      uint64_t v14 = (v5 - 52);
      os_log_type_t v15 = a1 + 52;
      goto LABEL_46;
    case 4u:
      if (*a1 != 1) {
        goto LABEL_6;
      }
      if (v5 <= 8)
      {
        uint64_t v12 = 9;
        goto LABEL_26;
      }
      CFStringAppendFormat(Mutable, 0, @"MS-CHAPv2-ID %d MS-Length %d\n", a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      uint64_t v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16) {
        goto LABEL_48;
      }
      uint64_t v14 = (v5 - 9);
      if (v5 != 9)
      {
        os_log_type_t v15 = a1 + 9;
LABEL_46:
        CFStringAppendFormat(Mutable, 0, @"Message:       %.*s\n", v14, v15);
      }
      goto LABEL_47;
    case 7u:
      if (v5 <= 0x24E)
      {
        uint64_t v12 = 591;
LABEL_26:
        CFStringAppendFormat(Mutable, 0, @"Error: length %d < %d\n", v5, v12);
        goto LABEL_6;
      }
      CFStringAppendFormat(Mutable, 0, @"MS-CHAPv2-ID %d MS-Length %d\n", a1[6], bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16);
      uint64_t v13 = v5 - 5;
      if (v13 != bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16)
      {
LABEL_48:
        CFStringAppendFormat(Mutable, 0, @"Error: MS-Length should be %d\n", v13, v21);
        goto LABEL_6;
      }
      CFStringAppendFormat(Mutable, 0, @"Encrypted Password:\n");
      print_data_cfstr(Mutable, (uint64_t)(a1 + 9), 516);
      CFStringAppendFormat(Mutable, 0, @"Encrypted Hash: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 525), 16);
      CFStringAppendFormat(Mutable, 0, @"\n");
      CFStringAppendFormat(Mutable, 0, @"Peer Challenge: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 541), 16);
      CFStringAppendFormat(Mutable, 0, @"\n");
      CFStringAppendFormat(Mutable, 0, @"Reserved: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 557), 8);
      CFStringAppendFormat(Mutable, 0, @"\n");
      CFStringAppendFormat(Mutable, 0, @"NT Response: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 565), 24);
      CFStringAppendFormat(Mutable, 0, @"\n");
      CFStringAppendFormat(Mutable, 0, @"NT Flags: ");
      print_bytes_cfstr(Mutable, (uint64_t)(a1 + 589), 2);
      CFStringAppendFormat(Mutable, 0, @"\n", v18, v21);
LABEL_47:
      char v7 = 1;
      goto LABEL_7;
    default:
      CFStringAppendFormat(Mutable, 0, @"Unknown code %d\n", a1[5]);
      if (v5 >= 7) {
        print_data_cfstr(Mutable, (uint64_t)(a1 + 6), v5 - 6);
      }
      goto LABEL_6;
  }
}

char *EAPMSCHAPv2ResponsePacketCreate(uint64_t *a1, char a2, char a3, _DWORD *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1[10], @"EAPMSCHAPv2ClientChallenge");
  uint64_t v9 = *a1;
  int v10 = *((_DWORD *)a1 + 12) + 54;
  uint32_t v11 = EAPPacketCreate((char *)(*a1 + 105), 1024, 2, a2, 26, 0, v10, 0);
  if (!Value)
  {
    MSChapFillWithRandom((_DWORD *)(v9 + 16), 0x10u);
    goto LABEL_5;
  }
  if (CFDataGetLength(Value) == 16)
  {
    *(_OWORD *)(v9 + 16) = *(_OWORD *)CFDataGetBytePtr(Value);
LABEL_5:
    MSChap2((const void *)(v9 + 56), (const void *)(v9 + 16), (char *)a1[5], (UInt8 *)a1[8], *((_DWORD *)a1 + 18), v9 + 32);
    v11[5] = 2;
    v11[6] = a3;
    *(_WORD *)(v11 + 7) = bswap32(v10) >> 16;
    v11[9] = 49;
    uint64_t v12 = v11 + 10;
    if (Value)
    {
      *uint64_t v12 = 0;
      *(void *)(v11 + 18) = 0;
    }
    else
    {
      *(_OWORD *)uint64_t v12 = *(_OWORD *)(v9 + 16);
    }
    *(void *)(v11 + 26) = 0;
    long long v15 = *(_OWORD *)(v9 + 32);
    *(void *)(v11 + 50) = *(void *)(v9 + 48);
    *(_OWORD *)(v11 + 34) = v15;
    v11[58] = 0;
    memcpy(v11 + 59, (const void *)a1[5], *((unsigned int *)a1 + 12));
    return v11;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v14 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v14))
  {
    int v17 = 134218240;
    CFIndex Length = CFDataGetLength(Value);
    __int16 v19 = 2048;
    uint64_t v20 = 16;
    _os_log_impl(&dword_2106D5000, LogHandle, v14, "EAPMSCHAPv2ResponsePacketCreate: internal error %ld != %ld", (uint8_t *)&v17, 0x16u);
  }
  if (a4) {
    *a4 = 8;
  }
  uint32_t v11 = 0;
  *(_DWORD *)(v9 + 4) = 2;
  return v11;
}

uint64_t mschap2_message_int32_attr(const char *a1, size_t __len, char *__little, _DWORD *a4)
{
  unsigned int v5 = __len;
  CCCryptorStatus v6 = strnstr(a1, __little, __len);
  BOOL v7 = v5 <= 2 || v6 == 0;
  uint64_t v8 = !v7;
  if (!v7) {
    *a4 = strtol(v6 + 2, 0, 10);
  }
  return v8;
}

uint64_t EAPSecIdentityListCreate(void *a1)
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F16E80];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v2;
  uint64_t v3 = (void *)*MEMORY[0x263F17530];
  keys[2] = *(void **)MEMORY[0x263F171B8];
  keys[3] = v3;
  keys[4] = *(void **)MEMORY[0x263F17400];
  CFTypeRef v7 = 0;
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = @"com.apple.identities";
  values[2] = *(void **)MEMORY[0x263F171D0];
  values[3] = values[0];
  values[4] = *(void **)MEMORY[0x263F17408];
  CFDictionaryRef v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v5 = SecItemCopyMatching(v4, &v7);
  CFRelease(v4);
  if (!v5) {
    *a1 = v7;
  }
  return v5;
}

uint64_t EAPSecIdentityCreateTrustChainWithPersistentCertificateRefs(const void *a1, CFArrayRef theArray, __CFArray **a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *a3 = 0;
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 4294967246;
  }
  uint64_t v7 = Count;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v29 = Mutable;
  if (Mutable)
  {
    uint64_t v9 = Mutable;
    CFArrayAppendValue(Mutable, a1);
    CFMutableDictionaryRef v10 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef v30 = v10;
    if (v10)
    {
      uint32_t v11 = v10;
      CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C0]);
      CFDictionaryAddValue(v11, (const void *)*MEMORY[0x263F17530], (const void *)*MEMORY[0x263EFFB40]);
      if (v7 < 1) {
        goto LABEL_20;
      }
      CFTypeRef result = 0;
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      CFTypeID TypeID = CFDataGetTypeID();
      if (ValueAtIndex)
      {
        CFTypeID v14 = TypeID;
        char v15 = 0;
        char key = (void *)*MEMORY[0x263F175B0];
        uint64_t v16 = 4294967246;
        CFIndex v17 = 1;
        while (CFGetTypeID(ValueAtIndex) == v14)
        {
          CFDictionarySetValue(v11, key, ValueAtIndex);
          uint64_t v18 = SecItemCopyMatching(v11, &result);
          if (v18)
          {
            uint64_t v16 = v18;
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v22 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v22))
            {
              uint32_t v23 = EAPSecurityErrorString(v16);
              *(_DWORD *)buf = 136315394;
              int v32 = v23;
              __int16 v33 = 1024;
              int v34 = v16;
              _os_log_impl(&dword_2106D5000, LogHandle, v22, "SecItemCopyMatching failed, %s (%d)", buf, 0x12u);
            }
            goto LABEL_23;
          }
          if (!isA_SecCertificate(result))
          {
            int v25 = EAPLogGetLogHandle();
            os_log_type_t v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v25, v26))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2106D5000, v25, v26, "Certificate data with incorrect data type", buf, 2u);
            }
            goto LABEL_20;
          }
          CFArrayAppendValue(v9, result);
          my_CFRelease(&result);
          if (v7 == v17) {
            goto LABEL_20;
          }
          CFTypeRef result = 0;
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v17);
          CFTypeID v14 = CFDataGetTypeID();
          uint64_t v16 = 0;
          ++v17;
          char v15 = 1;
          if (!ValueAtIndex) {
            break;
          }
        }
      }
      else
      {
        char v15 = 0;
        uint64_t v16 = 4294967246;
      }
      __int16 v19 = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v19, v20, "Persistent reference with incorrect data type.", buf, 2u);
      }
      if (v15)
      {
LABEL_20:
        uint64_t v16 = 0;
LABEL_24:
        *a3 = v9;
        my_CFRelease((const void **)&v30);
        return v16;
      }
    }
    else
    {
      uint64_t v16 = 4294967188;
    }
LABEL_23:
    my_CFRelease((const void **)&v29);
    uint64_t v9 = v29;
    goto LABEL_24;
  }
  return 4294967188;
}

uint64_t EAPSecIdentityCompareIdentityHandle(__SecIdentity *a1, const __CFData *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SecCertificateRef certificateRef = 0;
  uint64_t v6 = 4294967246;
  if (isA_SecIdentity(a1) && a2 && a3)
  {
    *a3 = 0;
    uint64_t v6 = SecIdentityCopyCertificate(a1, &certificateRef);
    if (v6)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v8))
      {
        uint64_t v9 = EAPSecurityErrorString(v6);
        *(_DWORD *)buf = 136315394;
        CFTypeID v14 = v9;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl(&dword_2106D5000, LogHandle, v8, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
      }
    }
    else
    {
      BytePtr = (UInt8 *)CFDataGetBytePtr(a2);
      if (IdentityHandleMatchesCertificate(BytePtr)) {
        *a3 = 1;
      }
    }
    my_CFRelease((const void **)&certificateRef);
  }
  return v6;
}

const void *isA_SecIdentity(const void *a1)
{
  CFTypeID TypeID = SecIdentityGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

BOOL IdentityHandleMatchesCertificate(void *a1)
{
  CFDataRef v2 = (const __CFData *)SecCertificateCopySHA256Digest();
  if (CFDataGetLength(v2) != 32) {
    IdentityHandleMatchesCertificate_cold_2();
  }
  BytePtr = CFDataGetBytePtr(v2);
  if (*(void *)BytePtr == *a1
    && *((void *)BytePtr + 1) == a1[1]
    && *((void *)BytePtr + 2) == a1[2]
    && *((void *)BytePtr + 3) == a1[3])
  {
    CFDataRef v8 = (const __CFData *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (CFDataGetLength(v8) != 32) {
      IdentityHandleMatchesCertificate_cold_1();
    }
    uint64_t v9 = CFDataGetBytePtr(v8);
    BOOL v7 = *(void *)v9 == a1[4]
      && *((void *)v9 + 1) == a1[5]
      && *((void *)v9 + 2) == a1[6]
      && *((void *)v9 + 3) == a1[7];
    CFRelease(v8);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v2);
  return v7;
}

uint64_t EAPSecIdentityCreateTrustChain(__SecIdentity *a1, __CFArray **a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  *a2 = 0;
  CFArrayRef v35 = 0;
  SecCertificateRef certificateRef = 0;
  SecTrustRef trust = 0;
  int v32 = 0;
  os_log_type_t v31 = 0;
  CFDictionaryRef EAP = (const void *)SecPolicyCreateEAP();
  int v34 = EAP;
  if (EAP)
  {
    uint64_t v5 = EAP;
    uint64_t v6 = SecIdentityCopyCertificate(a1, &certificateRef);
    if (v6)
    {
      uint64_t v7 = v6;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v9))
      {
        CFMutableDictionaryRef v10 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        size_t v38 = v10;
        __int16 v39 = 1024;
        int v40 = v7;
        uint32_t v11 = "SecIdentityCopyCertificate failed: %s (%d)";
LABEL_11:
        _os_log_impl(&dword_2106D5000, LogHandle, v9, v11, buf, 0x12u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    CFArrayRef v35 = CFArrayCreate(0, (const void **)&certificateRef, 1, MEMORY[0x263EFFF70]);
    my_CFRelease((const void **)&certificateRef);
    uint64_t v7 = SecTrustCreateWithCertificates(v35, v5, &trust);
    my_CFRelease((const void **)&v35);
    if (v7)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v9))
      {
        __int16 v15 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        size_t v38 = v15;
        __int16 v39 = 1024;
        int v40 = v7;
        uint32_t v11 = "SecTrustCreateWithCertificates failed: %s (%d)";
        goto LABEL_11;
      }
LABEL_12:
      CFMutableArrayRef Mutable = 0;
      goto LABEL_13;
    }
    uint64_t v7 = EAPTLSSecTrustEvaluate(trust, (SecTrustResultType *)&v32);
    if (v7)
    {
      os_log_type_t v22 = EAPLogGetLogHandle();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = EAPSecurityErrorString(v7);
        *(_DWORD *)buf = 136315394;
        size_t v38 = v24;
        __int16 v39 = 1024;
        int v40 = v7;
        _os_log_impl(&dword_2106D5000, v22, v23, "SecTrustEvaluate returned %s (%d)", buf, 0x12u);
      }
    }
    CertificateCFIndex Count = SecTrustGetCertificateCount(trust);
    if (CertificateCount)
    {
      uint64_t v26 = CertificateCount;
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x263EFFF70]);
      if (v26 >= 1)
      {
        for (CFIndex i = 0; i != v26; ++i)
        {
          SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, i);
          CFArrayAppendValue(Mutable, CertificateAtIndex);
        }
      }
      os_log_type_t v31 = Mutable;
    }
    else
    {
      uint64_t v29 = EAPLogGetLogHandle();
      os_log_type_t v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v29, v30, "SecTrustGetCertificateCount returned 0", buf, 2u);
      }
      CFMutableArrayRef Mutable = 0;
      uint64_t v7 = 4294967246;
    }
  }
  else
  {
    uint64_t v12 = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v12, v13, "SecPolicyCreateEAP failed", buf, 2u);
    }
    CFMutableArrayRef Mutable = 0;
    uint64_t v7 = 0;
  }
LABEL_13:
  my_CFRelease((const void **)&trust);
  my_CFRelease(&v34);
  if (v7)
  {
    int v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = EAPSecurityErrorString(v7);
      *(_DWORD *)buf = 136315394;
      size_t v38 = v18;
      __int16 v39 = 1024;
      int v40 = v7;
      _os_log_impl(&dword_2106D5000, v16, v17, "EAPSecIdentityCreateCertificateTrustChain failed: %s (%d)", buf, 0x12u);
    }
  }
  else
  {
    CFIndex Count = CFArrayGetCount(Mutable);
    CFMutableStringRef MutableCopy = CFArrayCreateMutableCopy(0, Count, Mutable);
    CFArraySetValueAtIndex(MutableCopy, 0, a1);
    *a2 = MutableCopy;
  }
  my_CFRelease((const void **)&v31);
  return v7;
}

__CFData *EAPSecIdentityHandleCreate(__SecIdentity *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SecCertificateRef certificateRef = 0;
  OSStatus v1 = SecIdentityCopyCertificate(a1, &certificateRef);
  if (v1)
  {
    int v2 = v1;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v4))
    {
      uint64_t v5 = EAPSecurityErrorString(v2);
      *(_DWORD *)buf = 136315394;
      CFTypeID v14 = v5;
      __int16 v15 = 1024;
      int v16 = v2;
      _os_log_impl(&dword_2106D5000, LogHandle, v4, "SecIdentityCopyCertificate failed, %s (%d)", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    CFDataRef v7 = (const __CFData *)SecCertificateCopySHA256Digest();
    if (CFDataGetLength(v7) != 32) {
      EAPSecIdentityHandleCreate_cold_2();
    }
    CFMutableStringRef MutableCopy = CFDataCreateMutableCopy(0, 64, v7);
    CFRelease(v7);
    CFDataRef v8 = (const __CFData *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (CFDataGetLength(v8) != 32) {
      EAPSecIdentityHandleCreate_cold_1();
    }
    BytePtr = CFDataGetBytePtr(v8);
    CFIndex Length = CFDataGetLength(v8);
    CFDataAppendBytes(MutableCopy, BytePtr, Length);
    CFRelease(v8);
    CFRelease(certificateRef);
  }
  return MutableCopy;
}

__CFString *EAPSecCertificateCopySHA1DigestString()
{
  CFDataRef SHA1Digest = (const __CFData *)SecCertificateGetSHA1Digest();
  CFIndex Length = CFDataGetLength(SHA1Digest);
  BytePtr = CFDataGetBytePtr(SHA1Digest);
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  if (Length >= 1)
  {
    do
    {
      unsigned int v4 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, @"%02x", v4);
      --Length;
    }
    while (Length);
  }
  return Mutable;
}

unsigned __int8 *NTSessionKey16(UInt8 *a1, unsigned int a2, uint64_t *a3, long long *a4, uint64_t *a5, unsigned __int8 *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CC_LONG v10 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v10, (unsigned __int8 *)&md);
  CC_MD4(&md, 0x10u, v16);
  uint64_t v17 = *a3;
  long long v18 = *a4;
  uint64_t v11 = *a5;
  uint64_t v19 = *((void *)a4 + 2);
  uint64_t v20 = v11;
  CC_MD4(data, v10, (unsigned __int8 *)&md);
  ChallengeResponse(a5, &md, (uint64_t)&v21, v12, v13);
  return CC_MD5(v16, 0x50u, a6);
}

CFStringRef password_to_unicode(UInt8 *bytes, unsigned int a2, UInt8 *a3)
{
  CFIndex usedBufLen = 0;
  if (a2 >= 0x100) {
    CFIndex v4 = 256;
  }
  else {
    CFIndex v4 = a2;
  }
  CFStringRef result = CFStringCreateWithBytes(0, bytes, v4, 0x8000100u, 0);
  if (result)
  {
    CFStringRef v6 = result;
    v8.length = CFStringGetLength(result);
    v8.CFIndex location = 0;
    CFStringGetBytes(v6, v8, 0x100u, 0, 0, a3, 512, &usedBufLen);
    CFRelease(v6);
    return (const __CFString *)usedBufLen;
  }
  return result;
}

uint64_t MSChap(void *a1, UInt8 *bytes, unsigned int a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CC_LONG v6 = password_to_unicode(bytes, a3, data);
  CC_MD4(data, v6, (unsigned __int8 *)&md);
  return ChallengeResponse(a1, &md, a4, v7, v8);
}

uint64_t MSChap_MPPE(void *a1, UInt8 *bytes, unsigned int a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CC_LONG v6 = password_to_unicode(bytes, a3, data);
  CC_MD4(data, v6, md);
  CC_MD4(md, 0x10u, (unsigned __int8 *)&v11);
  return ChallengeResponse(a1, &v11, a4, v7, v8);
}

uint64_t NTPasswordBlockEncryptNewPasswordWithOldHash(UInt8 *a1, unsigned int a2, UInt8 *a3, unsigned int a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int v8 = password_to_unicode(a1, a2, __src);
  CC_LONG v9 = password_to_unicode(a3, a4, data);
  CC_MD4(data, v9, md);
  uint64_t v10 = 0;
  memset(dataIn, 0, sizeof(dataIn));
  do
  {
    *(_DWORD *)&dataIn[v10] = arc4random();
    v10 += 4;
  }
  while (v10 != 516);
  memmove(&dataIn[512 - v8], __src, v8);
  unsigned int v17 = v8;
  size_t dataOutMoved = 0;
  uint64_t result = CCCrypt(0, 4u, 0, md, 0x10uLL, 0, dataIn, 0x204uLL, a5, 0x204uLL, &dataOutMoved);
  if (result) {
    return fprintf((FILE *)*MEMORY[0x263EF8348], "rc4_encrypt: CCCrypt failed with %d\n", result);
  }
  return result;
}

uint64_t NTPasswordHashEncryptOldWithNew(UInt8 *a1, unsigned int a2, UInt8 *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CC_LONG v8 = password_to_unicode(a1, a2, data);
  CC_MD4(data, v8, md);
  CC_LONG v9 = password_to_unicode(a3, a4, v17);
  CC_MD4(v17, v9, dataIn);
  DesEncrypt(dataIn, (uint64_t)md, (void *)a5, v10, v11);
  return DesEncrypt(&v16, (uint64_t)&v19, (void *)(a5 + 8), v12, v13);
}

void EAPOLSIMGenerationIncrement()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int valuePtr = 1;
  SCPreferencesRef v0 = SCPreferencesCreate(0, @"EAPOLSIMPrefsManage", @"com.apple.eapol.sim.generation.plist");
  SCPreferencesRef v8 = v0;
  if (v0)
  {
    OSStatus v1 = v0;
    CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(v0, @"SIMGenerationID");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        ++valuePtr;
      }
    }
    *(void *)buf = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    SCPreferencesSetValue(v1, @"SIMGenerationID", *(CFPropertyListRef *)buf);
    SCPreferencesCommitChanges(v1);
    my_CFRelease((const void **)buf);
    my_CFRelease((const void **)&v8);
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      int v6 = SCError();
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = SCErrorString(v6);
      _os_log_impl(&dword_2106D5000, LogHandle, v5, "SCPreferencesCreate failed, %s", buf, 0xCu);
    }
  }
}

uint64_t EAPOLSIMGenerationGet()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  SCPreferencesRef v0 = SCPreferencesCreate(0, @"EAPOLSIMPrefsManage", @"com.apple.eapol.sim.generation.plist");
  SCPreferencesRef v7 = v0;
  if (v0)
  {
    CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(v0, @"SIMGenerationID");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
      }
    }
    my_CFRelease((const void **)&v7);
    return valuePtr;
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    uint64_t result = os_log_type_enabled(LogHandle, v5);
    if (result)
    {
      int v6 = SCError();
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = SCErrorString(v6);
      _os_log_impl(&dword_2106D5000, LogHandle, v5, "SCPreferencesCreate failed, %s", buf, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t EAPSecKeychainPasswordItemRemove(uint64_t a1, void *a2)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  int v2 = (void *)*MEMORY[0x263F17090];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v2;
  values[0] = *(void **)MEMORY[0x263F171C8];
  values[1] = a2;
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v4 = SecItemDelete(v3);
  CFRelease(v3);
  if (v4)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      int v8 = 136315394;
      CC_LONG v9 = EAPSecurityErrorString(v4);
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "SecItemDelete failed: %s (%d)", (uint8_t *)&v8, 0x12u);
    }
  }
  return v4;
}

uint64_t EAPKeychainSetIdentityReference(void *a1, void *a2, int a3)
{
  keys[6] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967246;
  }
  if (a2)
  {
    os_log_type_t v5 = (void *)*MEMORY[0x263F16E80];
    keys[0] = *(void **)MEMORY[0x263F17590];
    keys[1] = v5;
    os_log_type_t v6 = (void *)*MEMORY[0x263F175A8];
    keys[2] = *(void **)MEMORY[0x263F16EE8];
    keys[3] = v6;
    SCPreferencesRef v7 = (void *)*MEMORY[0x263F171B8];
    keys[4] = *(void **)MEMORY[0x263F16E90];
    keys[5] = v7;
    values[0] = *(void **)MEMORY[0x263EFFB40];
    values[1] = @"com.apple.identities";
    values[2] = a1;
    values[3] = a2;
    int v8 = (void *)*MEMORY[0x263F171E0];
    values[4] = *(void **)MEMORY[0x263F16E98];
    values[5] = v8;
    CFDictionaryRef v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryRef v12 = v9;
    if (!a3 || (uint64_t v10 = EAPKeychainRemoveIdentityReference(a1), !v10)) {
      uint64_t v10 = SecItemAdd(v9, 0);
    }
    my_CFRelease((const void **)&v12);
    return v10;
  }
  return EAPKeychainRemoveIdentityReference(a1);
}

uint64_t EAPKeychainRemoveIdentityReference(void *a1)
{
  keys[4] = *(void **)MEMORY[0x263EF8340];
  OSStatus v1 = (void *)*MEMORY[0x263F16EE8];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v1;
  int v2 = (void *)*MEMORY[0x263F171B8];
  keys[2] = *(void **)MEMORY[0x263F16E80];
  keys[3] = v2;
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = a1;
  CFDictionaryRef v3 = (void *)*MEMORY[0x263F171E0];
  values[2] = @"com.apple.identities";
  values[3] = v3;
  CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v4 = SecItemDelete(v6);
  my_CFRelease((const void **)&v6);
  return v4;
}

uint64_t EAPKeychainCopyIdentityReference(void *a1, CFTypeRef *a2)
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967246;
  }
  *a2 = 0;
  CFDictionaryRef v3 = (void *)*MEMORY[0x263F16E80];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v3;
  uint64_t v4 = (void *)*MEMORY[0x263F17520];
  keys[2] = *(void **)MEMORY[0x263F16EE8];
  keys[3] = v4;
  keys[4] = *(void **)MEMORY[0x263F171B8];
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = @"com.apple.identities";
  values[2] = a1;
  values[3] = values[0];
  values[4] = *(void **)MEMORY[0x263F171E0];
  CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v5 = SecItemCopyMatching(v7, a2);
  my_CFRelease((const void **)&v7);
  return v5;
}

uint64_t EAPKeychainRemovePasswordItem(void *a1)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967246;
  }
  OSStatus v1 = (void *)*MEMORY[0x263F17090];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v1;
  keys[2] = *(void **)MEMORY[0x263F171B8];
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = a1;
  values[2] = *(void **)MEMORY[0x263F171C8];
  CFDictionaryRef v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v2 = SecItemDelete(v4);
  my_CFRelease((const void **)&v4);
  return v2;
}

uint64_t EAPKeychainSetPasswordItem(void *a1, void *a2, void *a3, int a4)
{
  keys[6] = *(void **)MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967246;
  }
  if (a4) {
    EAPKeychainRemovePasswordItem(a1);
  }
  CFDictionaryRef v7 = (void *)*MEMORY[0x263F16ED8];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v7;
  int v8 = (void *)*MEMORY[0x263F171B8];
  keys[2] = *(void **)MEMORY[0x263F17090];
  keys[3] = v8;
  CFDictionaryRef v9 = (void *)*MEMORY[0x263F16E90];
  keys[4] = *(void **)MEMORY[0x263F175A8];
  keys[5] = v9;
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = a2;
  uint64_t v10 = (void *)*MEMORY[0x263F171C8];
  values[2] = a1;
  values[3] = v10;
  int v11 = (void *)*MEMORY[0x263F16E98];
  values[4] = a3;
  values[5] = v11;
  CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v12 = SecItemAdd(v14, 0);
  my_CFRelease((const void **)&v14);
  return v12;
}

uint64_t EAPKeychainCopyPasswordItem(void *a1, void *a2, void *a3)
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  unsigned int v17 = 0;
  uint64_t v18 = 0;
  CFTypeRef result = 0;
  if (!a1)
  {
    CFTypeRef v13 = 0;
    CFTypeRef v9 = 0;
    uint64_t v8 = 4294967246;
    if (a2) {
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  uint64_t v5 = (void *)*MEMORY[0x263F171B8];
  keys[0] = *(void **)MEMORY[0x263F17590];
  keys[1] = v5;
  CFDictionaryRef v6 = (void *)*MEMORY[0x263F17520];
  keys[2] = *(void **)MEMORY[0x263F17090];
  keys[3] = v6;
  keys[4] = *(void **)MEMORY[0x263F17518];
  CFDictionaryRef v7 = (void *)*MEMORY[0x263F171C8];
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = v7;
  values[2] = a1;
  values[3] = values[0];
  values[4] = values[0];
  CFDictionaryRef v20 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v8 = SecItemCopyMatching(v20, &result);
  CFTypeRef v9 = result;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v9) {
    goto LABEL_13;
  }
  if (CFGetTypeID(v9) != TypeID)
  {
    CFTypeRef v13 = 0;
    CFTypeRef v9 = 0;
    goto LABEL_14;
  }
  int v11 = (const void *)*MEMORY[0x263F16ED8];
  if (CFDictionaryContainsKey((CFDictionaryRef)result, (const void *)*MEMORY[0x263F16ED8]))
  {
    CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)result, v11);
    CFTypeRef v9 = CFRetain(Value);
    uint64_t v18 = v9;
  }
  else
  {
    CFTypeRef v9 = 0;
  }
  CFDictionaryRef v14 = (const void *)*MEMORY[0x263F175A8];
  if (CFDictionaryContainsKey((CFDictionaryRef)result, (const void *)*MEMORY[0x263F175A8]))
  {
    __int16 v15 = CFDictionaryGetValue((CFDictionaryRef)result, v14);
    CFTypeRef v13 = CFRetain(v15);
    unsigned int v17 = v13;
  }
  else
  {
LABEL_13:
    CFTypeRef v13 = 0;
  }
LABEL_14:
  my_CFRelease(&result);
  my_CFRelease((const void **)&v20);
  if (a2)
  {
LABEL_15:
    *a2 = v9;
    if (a3) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
LABEL_7:
  my_CFRelease(&v18);
  if (a3)
  {
LABEL_16:
    *a3 = v13;
    return v8;
  }
LABEL_8:
  my_CFRelease(&v17);
  return v8;
}

uint64_t EAPSecKeychainPasswordItemCreateUniqueWithAccess(uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6, CFStringRef *a7)
{
  CFStringRef v12 = my_CFUUIDStringCreate(0);
  uint64_t v14 = EAPSecKeychainPasswordItemCreateWithAccess((uint64_t)v12, v13, v12, a3, a4, a5, a6);
  uint64_t v15 = v14;
  if (!a7 || v14)
  {
    if (a7) {
      *a7 = 0;
    }
    CFRelease(v12);
  }
  else
  {
    *a7 = v12;
  }
  return v15;
}

uint64_t EAPOLControlStart(uint64_t a1, const void *a2)
{
  kern_return_t v5;
  mach_error_t v6;
  NSObject *LogHandle;
  os_log_type_t v8;
  mach_port_name_t v9;
  mach_port_name_t v10;
  CFTypeID TypeID;
  CFDataRef Data;
  CFDataRef v13;
  int v14;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v17;
  mach_error_t v18;
  NSObject *v19;
  os_log_type_t v20;
  char *v21;
  int v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v26;
  os_log_type_t v27;
  mach_error_t v28;
  uint64_t v29;
  CFDataRef v30;
  uint8_t buf[4];
  char *v32;
  __int16 v33;
  mach_error_t v34;
  long long v35[2];
  uint64_t v36;

  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  os_log_type_t v30 = 0;
  memset(v35, 0, sizeof(v35));
  CFDictionaryRef v3 = (ipc_space_t *)MEMORY[0x263EF8960];
  CFDictionaryRef v4 = (int *)MEMORY[0x263EF87F0];
  uint64_t v5 = mach_port_mod_refs(*MEMORY[0x263EF8960], *MEMORY[0x263EF87F0], 0, 1);
  char v28 = v5;
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    uint64_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_DWORD *)buf = 136315394;
      int v32 = mach_error_string(v6);
      __int16 v33 = 1024;
      int v34 = v6;
      _os_log_impl(&dword_2106D5000, LogHandle, v8, "mach_port_mod_refs failed, %s (%d)", buf, 0x12u);
    }
    LODWORD(v29) = 6;
    goto LABEL_20;
  }
  CFTypeRef v9 = audit_session_self();
  if (v9)
  {
    uint64_t v10 = v9;
    if (get_server_port((uint64_t)&v29 + 4, &v28))
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (!a2 || CFGetTypeID(a2) != TypeID)
      {
        os_log_type_t v22 = 22;
        goto LABEL_18;
      }
      CFDataRef Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      os_log_type_t v30 = Data;
      if (!Data)
      {
        os_log_type_t v22 = 12;
        goto LABEL_18;
      }
      uint64_t v13 = Data;
      __strlcpy_chk();
      uint64_t v14 = HIDWORD(v29);
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      unsigned int v17 = eapolcontroller_start(v14, v35, (uint64_t)BytePtr, Length, *v4, v10, &v29);
      if (!v17)
      {
        if (v29)
        {
          uint64_t v26 = EAPLogGetLogHandle();
          CFStringRef v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v26, v27))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v32) = v29;
            _os_log_impl(&dword_2106D5000, v26, v27, "eapolcontroller_start: result is %d", buf, 8u);
          }
        }
        goto LABEL_19;
      }
      uint64_t v18 = v17;
      char v19 = EAPLogGetLogHandle();
      CFDictionaryRef v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = mach_error_string(v18);
        *(_DWORD *)buf = 136315394;
        int v32 = v21;
        __int16 v33 = 1024;
        int v34 = v18;
        _os_log_impl(&dword_2106D5000, v19, v20, "eapolcontroller_start failed, %s (%d)", buf, 0x12u);
      }
    }
    os_log_type_t v22 = 6;
LABEL_18:
    LODWORD(v29) = v22;
LABEL_19:
    mach_port_mod_refs(*v3, *v4, 0, -1);
    mach_port_deallocate(*v3, v10);
    goto LABEL_20;
  }
  LODWORD(v29) = 6;
  uint64_t v23 = EAPLogGetLogHandle();
  uint64_t v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v23, v24, "audit_session_self failed", buf, 2u);
  }
  mach_port_mod_refs(*v3, *v4, 0, -1);
LABEL_20:
  my_CFRelease((const void **)&v30);
  return v29;
}

uint64_t EAPOLControlStartWithClientItemID(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v25 = 0;
  uint64_t v26 = 0;
  values = 0;
  CFMutableDictionaryRef v24 = 0;
  CFMutableDictionaryRef v22 = 0;
  if (!a3) {
    goto LABEL_22;
  }
  uint64_t v5 = a3;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(v5) != TypeID) {
    return 22;
  }
  int Count = CFDictionaryGetCount((CFDictionaryRef)v5);
  int v8 = Count;
  if (!Count)
  {
LABEL_22:
    CFDictionaryRef v15 = EAPOLClientItemIDCopyDictionary(a2);
    if (v15) {
      goto LABEL_23;
    }
    return 22;
  }
  if (Count > 5) {
    return 22;
  }
  uint64_t v31 = 0;
  *(_OWORD *)keys = 0u;
  long long v30 = 0u;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v5, (const void **)keys, 0);
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (CFTypeRef *)keys;
    do
    {
      if (CFEqual(*v10, @"SaveCredentialsOnSuccessfulAuthentication"))
      {
        if (v8 == 1)
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v12 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v12))
          {
            CFTypeRef v13 = *v10;
            *(_DWORD *)buf = 138412290;
            CFTypeRef v28 = v13;
            _os_log_impl(&dword_2106D5000, LogHandle, v12, "Ignoring %@ since no credentials were specified", buf, 0xCu);
          }
          uint64_t v5 = 0;
        }
      }
      else if (!CFEqual(*v10, @"UserName") {
             && !CFEqual(*v10, @"UserPassword")
      }
             && !CFEqual(*v10, @"TLSIdentityHandle")
             && !CFEqual(*v10, @"DisableUserInteraction"))
      {
        return 22;
      }
      ++v10;
    }
    while (--v9);
  }
  CFDictionaryRef v14 = EAPOLClientItemIDCopyDictionary(a2);
  if (!v14) {
    return 22;
  }
  CFDictionaryRef v15 = v14;
  if (!v5)
  {
LABEL_23:
    int v25 = @"ClientItemID";
    values = v15;
    goto LABEL_24;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v5);
  CFMutableDictionaryRef v22 = MutableCopy;
  values = v15;
  int v25 = @"ClientItemID";
  if (MutableCopy)
  {
    CFMutableDictionaryRef v17 = MutableCopy;
    if (CFDictionaryGetCount(MutableCopy) >= 1)
    {
      uint64_t v26 = @"EAPClientConfiguration";
      CFMutableDictionaryRef v24 = v17;
      CFIndex v18 = 2;
      goto LABEL_25;
    }
  }
LABEL_24:
  CFIndex v18 = 1;
LABEL_25:
  CFDictionaryRef v19 = CFDictionaryCreate(0, (const void **)&v25, (const void **)&values, v18, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(v15);
  my_CFRelease((const void **)&v22);
  uint64_t v20 = EAPOLControlStart(a1, v19);
  if (v19) {
    CFRelease(v19);
  }
  return v20;
}

uint64_t EAPOLControlStop()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  uint64_t v3 = 0;
  mach_error_t v2 = 0;
  if (!get_server_port((uint64_t)&v3 + 4, &v2)) {
    return 6;
  }
  __strlcpy_chk();
  mach_error_t v0 = eapolcontroller_stop(HIDWORD(v3), v4, &v3);
  if (v0)
  {
    mach_error("eapolcontroller_start failed", v0);
    return 6;
  }
  return v3;
}

uint64_t EAPOLControlUpdate(uint64_t a1, const void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  CFDataRef v14 = 0;
  memset(v15, 0, sizeof(v15));
  mach_error_t v12 = 0;
  if (!get_server_port((uint64_t)&v13 + 4, &v12)) {
    goto LABEL_7;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    int v10 = 22;
    goto LABEL_9;
  }
  CFDataRef Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFDataRef v14 = Data;
  if (!Data)
  {
    int v10 = 12;
    goto LABEL_9;
  }
  CFDataRef v5 = Data;
  __strlcpy_chk();
  mach_port_t v6 = HIDWORD(v13);
  BytePtr = CFDataGetBytePtr(v5);
  int Length = CFDataGetLength(v5);
  mach_error_t v9 = eapolcontroller_update(v6, v15, (uint64_t)BytePtr, Length, (int *)&v13);
  if (v9)
  {
    mach_error("eapolcontroller_update failed", v9);
LABEL_7:
    int v10 = 6;
LABEL_9:
    LODWORD(v13) = v10;
  }
  my_CFRelease((const void **)&v14);
  return v13;
}

uint64_t EAPOLControlRetry()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  uint64_t v3 = 0;
  mach_error_t v2 = 0;
  if (!get_server_port((uint64_t)&v3, &v2)) {
    return 6;
  }
  __strlcpy_chk();
  mach_error_t v0 = eapolcontroller_retry(v3, v4, (_DWORD *)&v3 + 1);
  if (v0)
  {
    mach_error("eapolcontroller_retry failed", v0);
    return 6;
  }
  return HIDWORD(v3);
}

uint64_t EAPOLControlProvideUserInput(uint64_t a1, const UInt8 *BytePtr)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  CFDataRef v12 = 0;
  memset(v13, 0, sizeof(v13));
  mach_error_t v10 = 0;
  if (!get_server_port((uint64_t)&v11 + 4, &v10)) {
    goto LABEL_9;
  }
  if (BytePtr)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(BytePtr) != TypeID)
    {
      int v8 = 22;
      goto LABEL_12;
    }
    CFDataRef Data = CFPropertyListCreateData(0, BytePtr, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFDataRef v12 = Data;
    if (!Data)
    {
      int v8 = 12;
      goto LABEL_12;
    }
    CFDataRef v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    int Length = CFDataGetLength(v5);
  }
  else
  {
    int Length = 0;
  }
  __strlcpy_chk();
  mach_error_t v7 = eapolcontroller_provide_user_input(HIDWORD(v11), v13, (uint64_t)BytePtr, Length, (int *)&v11);
  if (v7)
  {
    mach_error("eapolcontroller_provide_user_input failed", v7);
LABEL_9:
    int v8 = 6;
LABEL_12:
    LODWORD(v11) = v8;
  }
  my_CFRelease((const void **)&v12);
  return v11;
}

uint64_t EAPOLControlSetLogLevel()
{
  return 22;
}

uint64_t EAPOLControlStartSystem(uint64_t a1, const UInt8 *BytePtr)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  CFDataRef v18 = 0;
  memset(v23, 0, sizeof(v23));
  mach_error_t v16 = 0;
  if (!get_server_port((uint64_t)&v17 + 4, &v16))
  {
LABEL_10:
    int v12 = 6;
LABEL_16:
    LODWORD(v17) = v12;
    goto LABEL_17;
  }
  if (BytePtr)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(BytePtr) != TypeID)
    {
      int v12 = 22;
      goto LABEL_16;
    }
    CFDataRef Data = CFPropertyListCreateData(0, BytePtr, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFDataRef v18 = Data;
    if (!Data)
    {
      int v12 = 12;
      goto LABEL_16;
    }
    CFDataRef v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    int Length = CFDataGetLength(v5);
  }
  else
  {
    int Length = 0;
  }
  __strlcpy_chk();
  mach_error_t started = eapolcontroller_start_system(HIDWORD(v17), v23, (uint64_t)BytePtr, Length, (int *)&v17);
  if (started)
  {
    mach_error_t v8 = started;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v10))
    {
      uint64_t v11 = mach_error_string(v8);
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = v11;
      __int16 v21 = 1024;
      mach_error_t v22 = v8;
      _os_log_impl(&dword_2106D5000, LogHandle, v10, "eapolcontroller_start_system failed, %s (%d)", buf, 0x12u);
    }
    goto LABEL_10;
  }
  if (v17)
  {
    uint64_t v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_2106D5000, v13, v14, "eapolcontroller_start_system: result is %d", buf, 8u);
    }
  }
LABEL_17:
  my_CFRelease((const void **)&v18);
  return v17;
}

uint64_t EAPOLControlStartSystemWithClientItemID(uint64_t a1, uint64_t a2)
{
  values = EAPOLClientItemIDCopyDictionary(a2);
  if (!values) {
    return 22;
  }
  mach_port_t v6 = @"ClientItemID";
  uint64_t v3 = (const UInt8 *)CFDictionaryCreate(0, (const void **)&v6, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(values);
  uint64_t started = EAPOLControlStartSystem(a1, v3);
  if (v3) {
    CFRelease(v3);
  }
  return started;
}

CFStringRef EAPOLControlAnyInterfaceKeyCreate()
{
  return SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x263F1BC10], (CFStringRef)*MEMORY[0x263F1BBF0], (CFStringRef)*MEMORY[0x263F1BC40]);
}

uint64_t chap_md5(char a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, unsigned __int8 *a6)
{
  char data = a1;
  memset(&v12, 0, sizeof(v12));
  CC_MD5_Init(&v12);
  CC_MD5_Update(&v12, &data, 1u);
  CC_MD5_Update(&v12, a2, a3);
  CC_MD5_Update(&v12, a4, a5);
  return CC_MD5_Final(a6, &v12);
}

void print_bytes_cfstr(CFMutableStringRef theString, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a3;
    do
    {
      if ((v5 & 7) != 0) {
        mach_error_t v7 = " ";
      }
      else {
        mach_error_t v7 = "  ";
      }
      if (!v5) {
        mach_error_t v7 = (const char *)&unk_21070AD61;
      }
      CFStringAppendFormat(theString, 0, @"%s%02x", v7, *(unsigned __int8 *)(a2 + v5++));
    }
    while (v6 != v5);
  }
}

void print_data_cfstr(CFMutableStringRef theString, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v8 = MEMORY[0x263EF8318];
    do
    {
      if (!v6) {
        CFStringAppendFormat(theString, 0, @"%04x ", v5);
      }
      int v9 = *(char *)(a2 + v5);
      if (v9 < 0) {
        int v10 = __maskrune(*(unsigned __int8 *)(a2 + v5), 0x40000uLL);
      }
      else {
        int v10 = *(_DWORD *)(v8 + 4 * *(unsigned __int8 *)(a2 + v5) + 60) & 0x40000;
      }
      unsigned __int8 v11 = *(unsigned char *)(a2 + v5);
      if (v10) {
        char v12 = v9;
      }
      else {
        char v12 = 46;
      }
      v15[v6] = v12;
      CFStringAppendFormat(theString, 0, @" %02x", v11);
      if (v6 == 7)
      {
        CFStringAppendFormat(theString, 0, @" ");
        int v6 = 8;
      }
      else if (v6 == 15)
      {
        char v16 = 0;
        CFStringAppendFormat(theString, 0, @"  %s\n", v15);
        int v6 = 0;
      }
      else
      {
        ++v6;
      }
      ++v5;
    }
    while (a3 != v5);
    if (v6)
    {
      if (v6 >= 8) {
        uint64_t v13 = (const char *)&unk_21070AD61;
      }
      else {
        uint64_t v13 = " ";
      }
      if (v6 <= 15)
      {
        uint64_t v14 = v6;
        do
        {
          CFStringAppendFormat(theString, 0, @"   ");
          v15[v14++] = 32;
        }
        while (v14 != 16);
      }
      char v16 = 0;
      CFStringAppendFormat(theString, 0, @"  %s%s\n", v13, v15);
    }
  }
}

uint64_t fprint_bytes(FILE *a1, uint64_t a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  mach_error_t v7 = Mutable;
  if (!a1) {
    a1 = (FILE *)*MEMORY[0x263EF8358];
  }
  print_bytes_cfstr(Mutable, a2, a3);
  SCPrint();
  CFRelease(v7);
  return fflush(a1);
}

uint64_t fprint_data(FILE *a1, uint64_t a2, int a3)
{
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  print_data_cfstr(Mutable, a2, a3);
  if (a1) {
    mach_error_t v7 = a1;
  }
  else {
    mach_error_t v7 = (FILE *)*MEMORY[0x263EF8358];
  }
  SCPrint();
  CFRelease(Mutable);
  return fflush(v7);
}

uint64_t print_bytes(uint64_t a1, int a2)
{
  return fprint_bytes(0, a1, a2);
}

uint64_t print_data(uint64_t a1, int a2)
{
  return fprint_data(0, a1, a2);
}

uint64_t sockaddr_dl_print(unsigned __int8 *a1)
{
  printf("link: len %d index %d family %d type 0x%x nlen %d alen %d slen %d addr ", *a1, *((unsigned __int16 *)a1 + 1), a1[1], a1[4], a1[5], a1[6], a1[7]);
  if (a1[6])
  {
    unint64_t v2 = 0;
    do
    {
      if (v2) {
        uint64_t v3 = ":";
      }
      else {
        uint64_t v3 = (const char *)&unk_21070AD61;
      }
      printf("%s%x", v3, a1[a1[5] + 8 + v2++]);
    }
    while (v2 < a1[6]);
  }
  return putchar(10);
}

uint64_t LinkAddresses_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t LinkAddresses_element(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 8) <= (signed int)a2) {
    return 0;
  }
  else {
    return *(void *)(*(void *)a1 + 8 * a2);
  }
}

uint64_t leap_init(void *a1, void *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  CFDictionaryRef v4 = malloc_type_malloc(0xA4uLL, 0x100004083268C5DuLL);
  if (!v4) {
    return 2;
  }
  uint64_t v5 = v4;
  uint64_t result = 0;
  v5[40] = 0;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *a1 = v5;
  return result;
}

void leap_free(void **a1)
{
  OSStatus v1 = *a1;
  if (v1) {
    free(v1);
  }
}

uint64_t leap_process(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  v26[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = (int *)*a1;
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v6 = (UInt8 *)a1[8];
  if (v6)
  {
    switch(*(unsigned char *)a2)
    {
      case 1:
        unsigned int Length = EAPPacketGetLength(a2);
        if (Length >= 8 && (Length & 0xFFF8) != 8 && *(unsigned char *)(a2 + 7) == 8)
        {
          *(void *)(v5 + 1) = *(void *)(a2 + 8);
          MSChap(v5 + 1, (UInt8 *)a1[8], *((_DWORD *)a1 + 18), (uint64_t)v26);
          unsigned __int8 v11 = LEAPPacketCreate(2, v26, 0x18u, *(unsigned char *)(a2 + 1), (const void *)a1[5], *((_DWORD *)a1 + 12));
          uint64_t result = 0;
          *a3 = v11;
          int v13 = 1;
          goto LABEL_24;
        }
        snprintf((char *)v5 + 36, 0x80uLL, "LEAPVerifyRequest: packet is too short %d");
        goto LABEL_29;
      case 2:
        if (*v5 != 2) {
          return 0;
        }
        unsigned int v14 = *((_DWORD *)a1 + 18);
        unsigned int v15 = EAPPacketGetLength(a2);
        if (v15 >= 8 && *(unsigned char *)(a2 + 7) == 24 && (unint64_t)((__int16)v15 - 8) > 0x17)
        {
          MSChap_MPPE(v5 + 3, v6, v14, (uint64_t)v26);
          uint64_t v16 = *(void *)(a2 + 8);
          uint64_t v17 = *(void *)(a2 + 16);
          uint64_t v18 = a2 + 8;
          if (v26[0] == v16 && v26[1] == v17 && v26[2] == *(void *)(v18 + 16))
          {
            NTSessionKey16(v6, v14, (uint64_t *)(v5 + 3), (long long *)v18, (uint64_t *)(v5 + 1), (unsigned __int8 *)v5 + 20);
            *uint64_t v5 = 3;
            return 1;
          }
          strcpy((char *)v5 + 36, "LEAPVerifyResponse: server failed mutual authentication");
        }
        else
        {
          snprintf((char *)v5 + 36, 0x80uLL, "LEAPVerifyResponse: packet is too short %d");
        }
LABEL_29:
        *uint64_t v5 = 4;
LABEL_30:
        uint64_t result = 2;
        break;
      case 3:
        int v21 = *v5;
        if (*v5 != 1) {
          return 0;
        }
        uint64_t v22 = 3;
        do
        {
          char v23 = v21;
          uint32_t v24 = arc4random();
          LOBYTE(v21) = 0;
          v5[v22++] = v24;
        }
        while ((v23 & 1) != 0);
        int v25 = LEAPPacketCreate(1, v5 + 3, 8u, *(unsigned char *)(a2 + 1), (const void *)a1[5], *((_DWORD *)a1 + 12));
        uint64_t result = 0;
        *a3 = v25;
        int v13 = 2;
LABEL_24:
        *uint64_t v5 = v13;
        return result;
      case 4:
        *a4 = 1;
        *uint64_t v5 = 4;
        strcpy((char *)v5 + 36, "server sent failure");
        goto LABEL_30;
      default:
        return 0;
    }
  }
  else
  {
    uint64_t result = 0;
    *a4 = 3;
  }
  return result;
}

void leap_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t leap_failure_string(void *a1)
{
  if (*(_DWORD *)*a1 == 4) {
    return *a1 + 36;
  }
  else {
    return 0;
  }
}

uint64_t leap_session_key(_DWORD **a1, int *a2)
{
  int v2 = 16 * (**a1 == 3);
  if (**a1 == 3) {
    uint64_t result = (uint64_t)(*a1 + 5);
  }
  else {
    uint64_t result = 0;
  }
  *a2 = v2;
  return result;
}

uint64_t leap_server_key(_DWORD **a1, int *a2)
{
  int v2 = 16 * (**a1 == 3);
  if (**a1 == 3) {
    uint64_t result = (uint64_t)(*a1 + 5);
  }
  else {
    uint64_t result = 0;
  }
  *a2 = v2;
  return result;
}

uint64_t leap_msk_copy_bytes(void *a1, uint64_t a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = (_DWORD *)*a1;
  if (*(_DWORD *)*a1 != 3) {
    return 0;
  }
  *(_OWORD *)a2 = *(_OWORD *)(v3 + 5);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 5);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return 64;
}

CFArrayRef leap_require_props(uint64_t a1)
{
  if (*(void *)(a1 + 64)) {
    return 0;
  }
  values = @"UserPassword";
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
}

unsigned char *LEAPPacketCreate(char a1, const void *a2, unsigned int a3, char a4, const void *a5, int a6)
{
  int v12 = a3 + a6 + 8;
  int v13 = malloc_type_malloc(v12, 0x86CE80CBuLL);
  unsigned int v14 = v13;
  if (v13)
  {
    *int v13 = a1;
    v13[1] = a4;
    EAPPacketSetLength((uint64_t)v13, (unsigned __int16)v12);
    *((_WORD *)v14 + 2) = 273;
    v14[6] = 0;
    v14[7] = a3;
    memmove(v14 + 8, a2, a3);
    memmove(&v14[a3 + 8], a5, a6);
  }
  return v14;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0;
  }
  if (a2) {
    return CFEqual(a1, a2);
  }
  return 0;
}

UInt8 *S_copy_cstring(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (maxBufLen < 1) {
    return 0;
  }
  mach_error_t v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x1D5920EEuLL);
  v10.CFIndex location = location;
  v10.CFIndex length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

CFPropertyListRef my_CFPropertyListCreateFromFile(const char *a1)
{
  memset(&v11, 0, sizeof(v11));
  if (stat(a1, &v11) < 0) {
    return 0;
  }
  off_t st_size = v11.st_size;
  if (!v11.st_size) {
    return 0;
  }
  uint64_t v3 = malloc_type_malloc(v11.st_size, 0xFBACAD14uLL);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  int v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }
  CFDataRef v7 = CFDataCreate(0, (const UInt8 *)v4, st_size);
  if (v7)
  {
    CFDataRef v8 = v7;
    CFPropertyListRef v9 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v8);
  }
  else
  {
    CFPropertyListRef v9 = 0;
  }
  free(v4);
  return v9;
}

uint64_t my_CFPropertyListWriteFile(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!propertyList) {
    return 0;
  }
  CFDataRef Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data) {
    return 0;
  }
  CFDataRef v4 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  size_t Length = CFDataGetLength(v4);
  snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
  int v7 = open((const char *)__str, 1537, 420);
  if (v7 < 0)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  else
  {
    int v8 = v7;
    if (write(v7, BytePtr, Length) == Length)
    {
      rename(__str, a2, v9);
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    close(v8);
  }
  CFRelease(v4);
  return v10;
}

CFStringRef my_CFUUIDStringCreate(const __CFAllocator *a1)
{
  CFUUIDRef v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

CFStringRef my_CFStringCreateWithData(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    CFStringRef result = CFStringCreateWithBytes(v2, BytePtr, Length, S_encodings[v3], 0);
    if (result) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
  return result;
}

CFStringRef my_CFStringCreateWithCString(char *cStr)
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    CFStringRef result = CFStringCreateWithCString(0, cStr, S_encodings[v2]);
    if (result) {
      break;
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  return result;
}

CFDataRef my_CFDataCreateWithString(CFStringRef theString)
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    CFDataRef result = CFStringCreateExternalRepresentation(0, theString, S_encodings[v2], 0);
    if (result) {
      break;
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  return result;
}

void my_FieldSetRetainedCFType(const void **a1, CFTypeRef cf)
{
  char v4 = *a1;
  if (cf) {
    CFRetain(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
  *a1 = cf;
}

CFDataRef my_CFPropertyListCopyAsXMLString(CFPropertyListRef propertyList)
{
  CFDataRef result = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (result)
  {
    CFDataRef v2 = result;
    BytePtr = CFDataGetBytePtr(result);
    CFIndex Length = CFDataGetLength(v2);
    CFStringRef v5 = CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 0);
    CFRelease(v2);
    return (const __CFData *)v5;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateVMData(CFPropertyListRef propertyList, _DWORD *a2)
{
  vm_address_t address = 0;
  *a2 = 0;
  CFDataRef result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    CFDataRef v4 = result;
    int Length = CFDataGetLength(result);
    if (!vm_allocate(*MEMORY[0x263EF8960], &address, Length, 1))
    {
      int v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

CFTypeRef my_CFStringCopyComponent(CFStringRef theString, CFStringRef separatorString, CFIndex a3)
{
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, separatorString);
  if (!ArrayBySeparatingStrings) {
    return 0;
  }
  CFArrayRef v5 = ArrayBySeparatingStrings;
  if (CFArrayGetCount(ArrayBySeparatingStrings) <= a3)
  {
    CFTypeRef v7 = 0;
  }
  else
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v5, a3);
    CFTypeRef v7 = CFRetain(ValueAtIndex);
  }
  CFRelease(v5);
  return v7;
}

void sub_2106ED198(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2106ED658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2106EDC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2106EE690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2106EECA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2106EEF0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2106EF284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

EAPBoringSSLSession *EAPBoringSSLSessionContextCreate(uint64_t a1, uint64_t a2)
{
  CFDataRef v4 = objc_alloc_init(EAPBoringSSLSession);
  LODWORD(a1) = [(EAPBoringSSLSession *)v4 setup:a1 clientContext:a2];
  CFArrayRef v5 = EAPLogGetLogHandle();
  if (a1)
  {
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v5, v6, "EAPBoringSSLSession instance created", buf, 2u);
    }

    CFTypeRef v7 = v4;
  }
  else
  {
    int v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, (os_log_type_t)v8))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2106D5000, v5, (os_log_type_t)v8, "failed to set up session", v10, 2u);
    }

    CFTypeRef v7 = 0;
  }

  return v7;
}

void *EAPBoringSSLSessionStop(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 stop];
  }
  return a1;
}

void EAPBoringSSLSessionContextFree(void *a1)
{
  if (a1)
  {
    [a1 stop];

    uint64_t v2 = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)CFDataRef v4 = 0;
      _os_log_impl(&dword_2106D5000, v2, v3, "EAPBoringSSLSession instance freed", v4, 2u);
    }
  }
}

void *EAPBoringSSLSessionStart(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 start];
  }
  return a1;
}

uint64_t EAPBoringSSLSessionGetCurrentState(void *a1, _DWORD *a2)
{
  if (!a1) {
    return 4294966387;
  }
  int v3 = [a1 state];
  uint64_t result = 0;
  *a2 = v3;
  return result;
}

__CFString *EAPBoringSSLSessionGetCurrentStateDescription(int a1)
{
  if ((a1 - 1) > 2) {
    return @"idle";
  }
  else {
    return (__CFString *)*((void *)&off_264133D90 + a1 - 1);
  }
}

void EAPBoringSSLUtilGetPreferredTLSVersions(const __CFDictionary *a1, __int16 *a2, __int16 *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    *a2 = 769;
    *a3 = 771;
    return;
  }
  CFNumberRef Value = (__CFString *)CFDictionaryGetValue(a1, @"TLSMinimumVersion");
  CFTypeRef v7 = (__CFString *)CFDictionaryGetValue(a1, @"TLSMaximumVersion");
  int v8 = EAPLogGetLogHandle();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = @"NONE";
    if (Value) {
      stat v11 = Value;
    }
    else {
      stat v11 = @"NONE";
    }
    if (v7) {
      uint64_t v10 = v7;
    }
    int v22 = 138412546;
    char v23 = v11;
    __int16 v24 = 2112;
    int v25 = v10;
    _os_log_impl(&dword_2106D5000, v8, v9, "configured minimum TLS version: [%@], maximum TLS version: [%@]", (uint8_t *)&v22, 0x16u);
  }

  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && !CFEqual(Value, @"1.0"))
  {
    if (CFEqual(Value, @"1.1"))
    {
      __int16 v13 = 770;
    }
    else if (CFEqual(Value, @"1.2"))
    {
      __int16 v13 = 771;
    }
    else
    {
      if (!CFEqual(Value, @"1.3"))
      {
        *a2 = 769;
        uint64_t v18 = EAPLogGetLogHandle();
        os_log_type_t v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_2106D5000, v18, v19, "invalid minimum TLS version", (uint8_t *)&v22, 2u);
        }

        goto LABEL_14;
      }
      __int16 v13 = 772;
    }
  }
  else
  {
    __int16 v13 = 769;
  }
  *a2 = v13;
LABEL_14:
  CFTypeID v14 = CFStringGetTypeID();
  if (!v7 || CFGetTypeID(v7) != v14) {
    goto LABEL_26;
  }
  if (CFEqual(v7, @"1.0"))
  {
    unsigned int v15 = 769;
    goto LABEL_27;
  }
  if (CFEqual(v7, @"1.1"))
  {
    unsigned int v15 = 770;
    goto LABEL_27;
  }
  if (CFEqual(v7, @"1.2"))
  {
LABEL_26:
    unsigned int v15 = 771;
    goto LABEL_27;
  }
  if (!CFEqual(v7, @"1.3"))
  {
    *a3 = 771;
    uint64_t v20 = EAPLogGetLogHandle();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2106D5000, v20, v21, "invalid maximum TLS version", (uint8_t *)&v22, 2u);
    }

    unsigned int v15 = (unsigned __int16)*a3;
    goto LABEL_28;
  }
  unsigned int v15 = 772;
LABEL_27:
  *a3 = v15;
LABEL_28:
  if ((unsigned __int16)*a2 > v15)
  {
    uint64_t v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2106D5000, v16, v17, "minimum TLS version cannot be higher than maximum TLS version", (uint8_t *)&v22, 2u);
    }

    *a2 = *a3;
  }
}

uint64_t EAPBoringSSLSessionHandshake(void *a1)
{
  if (a1) {
    return [a1 handshake];
  }
  else {
    return 4294967246;
  }
}

uint64_t EAPBoringSSLSessionCopyServerCertificates(void *a1, void *a2)
{
  if (!a1) {
    return 4294967246;
  }
  id v3 = a1;
  if (![v3 serverSecTrust])
  {
    os_log_type_t v6 = (void *)[v3 copyPeerCertificateChain];

    if ([v6 count])
    {
      uint64_t v5 = 0;
      *a2 = v6;
    }
    else
    {
      uint64_t v5 = 4294967246;
    }

    return v5;
  }
  [v3 serverSecTrust];

  return SecTrustCopyInputCertificates();
}

void *EAPBoringSSLSessionGetSecTrust(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 serverSecTrust];
  }
  return a1;
}

uint64_t EAPBoringSSLSessionComputeKeyData(void *a1, void *a2, int a3)
{
  uint64_t v3 = 4294967246;
  if (a1 && a2)
  {
    os_log_type_t v6 = [a1 getEAPKeyMaterial];
    CFTypeRef v7 = v6;
    if (v6)
    {
      if ([v6 length] < (unint64_t)a3)
      {
LABEL_11:

        return v3;
      }
      memmove(a2, (const void *)[v7 bytes], a3);
      int v8 = EAPLogGetLogHandle();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl(&dword_2106D5000, v8, v9, "key computation is successful", v12, 2u);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 4294899625;
      int v8 = EAPLogGetLogHandle();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v8, v10, "key computation failed", buf, 2u);
      }
    }

    goto LABEL_11;
  }
  return v3;
}

uint64_t EAPBoringSSLSessionGetNegotiatedTLSVersion(void *a1, _WORD *a2)
{
  uint64_t result = 4294967246;
  if (a1)
  {
    if (a2)
    {
      __int16 v5 = [a1 getNegotiatedTLSVersion];
      uint64_t result = 0;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t EAPBoringSSLSessionGetSessionResumed(void *a1, unsigned char *a2)
{
  uint64_t result = 4294967246;
  if (a1)
  {
    if (a2)
    {
      char v5 = [a1 getSessionResumed];
      uint64_t result = 0;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t EAPClientModuleDefaultType()
{
  return **((unsigned int **)S_head + 3);
}

uint64_t EAPClientModuleAdd(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x20uLL, 0xB0040D5CDFBD1uLL);
  if (!v2) {
    return 3;
  }
  uint64_t v3 = v2;
  uint64_t result = 0;
  v3[2] = 0;
  v3[3] = a1;
  char v5 = off_26AB1B6A8;
  *uint64_t v3 = 0;
  v3[1] = v5;
  *char v5 = v3;
  off_26AB1B6A8 = (_UNKNOWN **)v3;
  return result;
}

uint64_t EAPClientModulePluginIntrospect(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 16);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

uint64_t EAPClientModulePluginFailureString(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 64);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

uint64_t EAPClientModulePluginMasterSessionKeyCopyBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFDataRef v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 24) + 88);
  if (v4) {
    return v4(a2, a3, a4);
  }
  else {
    return 0;
  }
}

uint64_t EAPClientModulePluginRequireProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 96);
  if (v2) {
    return v2(a2);
  }
  else {
    return 0;
  }
}

uint64_t EAPClientModulePluginPacketDump(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(v3 + 112);
  unint64_t v5 = *(void *)(v3 + 136);
  if (!(v4 | v5)) {
    return 0;
  }
  uint64_t result = 1;
  if (a2 && a3)
  {
    if (v4)
    {
      return ((uint64_t (*)(uint64_t, uint64_t))v4)(a2, a3);
    }
    else
    {
      char v9 = 0;
      uint64_t v7 = ((uint64_t (*)(uint64_t, char *))v5)(a3, &v9);
      if (v7)
      {
        int v8 = (const void *)v7;
        SCPrint();
        CFRelease(v8);
      }
      return v9 != 0;
    }
  }
  return result;
}

uint64_t EAPClientModulePluginCopyPacketDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 136);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 0;
  }
}

BOOL EAPCodeValid(int a1)
{
  return (a1 - 1) < 4;
}

const char *EAPCodeStr(int a1)
{
  if ((a1 - 1) <= 3) {
    return EAPCodeStr_str[a1 - 1];
  }
  else {
    return "<unknown>";
  }
}

const char *EAPTypeStr(int a1)
{
  uint64_t result = "0 (invalid)";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "Identity";
      break;
    case 2:
      uint64_t result = "Notification";
      break;
    case 3:
      uint64_t result = "Nak";
      break;
    case 4:
      uint64_t result = "EAP-MD5";
      break;
    case 5:
      uint64_t result = "EAP-OTP";
      break;
    case 6:
      uint64_t result = "EAP-GTC";
      break;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
    case 20:
    case 22:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      goto LABEL_6;
    case 13:
      uint64_t result = "EAP-TLS";
      break;
    case 17:
      uint64_t result = "LEAP";
      break;
    case 18:
      uint64_t result = "EAP-SIM";
      break;
    case 19:
      uint64_t result = "SRPSHA1";
      break;
    case 21:
      uint64_t result = "EAP-TTLS";
      break;
    case 23:
      uint64_t result = "EAP-AKA";
      break;
    case 25:
      uint64_t result = "EAP-PEAP";
      break;
    case 26:
      uint64_t result = "EAP-MSCHAPv2";
      break;
    case 33:
      uint64_t result = "PEAP-Extensions";
      break;
    default:
      if (a1 == 43)
      {
        uint64_t result = "EAP-FAST";
      }
      else if (a1 == 50)
      {
        uint64_t result = "EAP-AKA'";
      }
      else
      {
LABEL_6:
        uint64_t result = "<unknown>";
      }
      break;
  }
  return result;
}

uint64_t EAPPacketIsValid(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  if (a2 <= 3)
  {
    if (theString) {
      CFStringAppendFormat(theString, 0, @"EAPPacket header truncated %d < %d\n", a2, 4);
    }
    return 0;
  }
  unsigned int v6 = bswap32(*((unsigned __int16 *)a1 + 1));
  uint64_t v7 = HIWORD(v6);
  if (v7 > a2)
  {
    if (theString)
    {
      EAPPacketHeaderAppendDescription(a1, HIWORD(v6), theString);
      CFStringAppendFormat(theString, 0, @"EAPPacket truncated %d < %d\n", a2, v7);
    }
    return 0;
  }
  if (*a1 - 1 > 1)
  {
    if (theString)
    {
      EAPPacketHeaderAppendDescription(a1, v7, theString);
      goto LABEL_15;
    }
    return 1;
  }
  if (v7 <= 4)
  {
    if (theString)
    {
      CFStringAppendFormat(theString, 0, @"%s length %d < %d\n", "EAPRequestResponsePacket", v7, 5);
      goto LABEL_21;
    }
    return 0;
  }
  int v10 = a1[4];
  if (v10 != 3)
  {
    if (!v10)
    {
      if (theString)
      {
        EAPPacketHeaderAppendDescription(a1, v7, theString);
        CFStringAppendFormat(theString, 0, @"%s type is 0\n", "EAPRequestResponsePacket");
LABEL_21:
        uint64_t v8 = 0;
        if (!theString) {
          return v8;
        }
        goto LABEL_22;
      }
      return 0;
    }
    if (theString)
    {
      uint64_t v18 = EAPClientModuleLookup(v10);
      if (v18
        && (v23 = 0, (uint64_t v19 = EAPClientModulePluginCopyPacketDescription((uint64_t)v18, (uint64_t)a1, (uint64_t)&v23)) != 0))
      {
        uint64_t v20 = (const void *)v19;
        CFStringAppendFormat(theString, 0, @"%@", v19);
        CFRelease(v20);
      }
      else
      {
        EAPPacketHeaderAppendDescription(a1, v7, theString);
        uint64_t v21 = a1[4];
        int v22 = EAPTypeStr(a1[4]);
        CFStringAppendFormat(theString, 0, @"%s (%d) Payload Length %d\n", v22, v21, (v7 - 5));
        print_data_cfstr(theString, (uint64_t)(a1 + 5), v7 - 5);
      }
      goto LABEL_15;
    }
    return 1;
  }
  if (!theString) {
    return 1;
  }
  EAPPacketHeaderAppendDescription(a1, v7, theString);
  uint64_t v12 = a1[4];
  __int16 v13 = EAPTypeStr(a1[4]);
  CFStringAppendFormat(theString, 0, @"%s (%d)\n", v13, v12);
  uint64_t v14 = (v7 - 5);
  CFStringAppendFormat(theString, 0, @"Desired authentication types: ");
  if (v7 != 5)
  {
    unsigned int v15 = a1 + 5;
    do
    {
      unsigned int v16 = *v15++;
      os_log_type_t v17 = EAPTypeStr(v16);
      CFStringAppendFormat(theString, 0, @"%s(%d) ", v17, v16);
      --v14;
    }
    while (v14);
  }
  CFStringAppendFormat(theString, 0, @"\n");
LABEL_15:
  uint64_t v8 = 1;
  if (!theString) {
    return v8;
  }
LABEL_22:
  if (v7 < a2)
  {
    uint64_t v11 = (a2 - v7);
    CFStringAppendFormat(theString, 0, @"EAP: %d bytes follow data:\n", v11);
    print_data_cfstr(theString, (uint64_t)&a1[v7 + 4], v11);
  }
  return v8;
}

uint64_t EAPPacketGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
}

void EAPPacketHeaderAppendDescription(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  uint64_t v3 = *a1;
  if ((v3 - 1) <= 3) {
    unint64_t v4 = EAPCodeStr_str[(v3 - 1)];
  }
  else {
    unint64_t v4 = "<unknown>";
  }
  CFStringAppendFormat(theString, 0, @"EAP %s (%d): Identifier %d Length %d\n", v4, v3, a1[1], a2);
}

uint64_t EAPPacketSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 2) = __rev16(a2);
  return result;
}

uint64_t eaptls_failure_string()
{
  return 0;
}

uint64_t eaptls_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 141)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 174;
}

uint64_t eaptls_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if (!*(unsigned char *)(*a1 + 141)) {
    return 0;
  }
  long long v4 = *(_OWORD *)(v3 + 142);
  long long v5 = *(_OWORD *)(v3 + 158);
  long long v6 = *(_OWORD *)(v3 + 190);
  a2[2] = *(_OWORD *)(v3 + 174);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFArrayRef eaptls_require_props(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)a1 + 128) != 3 || *(unsigned char *)(*(void *)a1 + 140)) {
    return 0;
  }
  values = @"TLSUserTrustProceedCertificateChain";
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
}

const void *eaptls_user_name_copy(const __CFDictionary *Value)
{
  SecIdentityRef identityRef = 0;
  SecCertificateRef certificateRef = 0;
  if (Value) {
    CFNumberRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"TLSIdentityHandle");
  }
  if (EAPSecIdentityHandleCreateSecIdentity(Value, &identityRef)
    || SecIdentityCopyCertificate(identityRef, &certificateRef))
  {
    OSStatus v1 = 0;
  }
  else
  {
    OSStatus v1 = EAPSecCertificateCopyUserNameString((uint64_t)certificateRef);
  }
  my_CFRelease((const void **)&certificateRef);
  my_CFRelease((const void **)&identityRef);
  return v1;
}

void **eaptls_update_tls_session_data(void **result)
{
  if (!*((unsigned char *)result + 141))
  {
    OSStatus v1 = result;
    BOOL v3 = 0;
    EAPTLSSessionGetSessionResumed((uint64_t)*result, &v3);
    *((unsigned char *)v1 + 280) = v3;
    *((unsigned char *)v1 + 141) = 0;
    if (!EAPTLSSessionComputeSessionKey((uint64_t)*v1, (uint64_t)"client EAP encryption", 21, (char *)v1 + 142, 128))*((unsigned char *)v1 + 141) = 1; {
    uint64_t result = (void **)EAPTLSSessionGetNegotiatedTLSProtocolVersion(*v1);
    }
    v1[36] = result;
    int v2 = *((unsigned __int8 *)v1 + 140);
    if (*((unsigned char *)v1 + 141))
    {
      if (*((unsigned char *)v1 + 140))
      {
LABEL_8:
        if (!v1[34]) {
          return EAPTLSSessionCopyPeerCertificates((void **)*v1, v1 + 34);
        }
        return result;
      }
      int v2 = *((unsigned __int8 *)v1 + 280);
      *((unsigned char *)v1 + 140) = v2;
      *((unsigned char *)v1 + 271) = v2;
    }
    if (!v2) {
      return result;
    }
    goto LABEL_8;
  }
  return result;
}

unsigned char *eaptls_handshake(uint64_t *a1, const char *a2, _DWORD *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  if (*(unsigned char *)(*a1 + 271) && !*(unsigned char *)(v6 + 140))
  {
    BOOL v12 = EAPTLSSessionIsRevocationStatusCheckRequired(*(void *)v6);
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v14))
    {
      unsigned int v15 = "is";
      if (!v12) {
        unsigned int v15 = "is not";
      }
      int v36 = 136315138;
      uint64_t v37 = (uint64_t)v15;
      _os_log_impl(&dword_2106D5000, LogHandle, v14, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v7 = eaptls_verify_server(a1, a2, v12, a3);
    if (!*(unsigned char *)(v6 + 140)) {
      return v7;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = EAPTLSSessionHandshake(*(void *)v6);
  if (v8 != -9841)
  {
LABEL_21:
    uint64_t v20 = v8;
    int v36 = 0;
    if (EAPTLSSessionGetState(*(void *)v6, (SSLSessionState *)&v36)) {
      BOOL v21 = 0;
    }
    else {
      BOOL v21 = v36 == 2;
    }
    if (v21) {
      eaptls_update_tls_session_data((void **)v6);
    }
    if (v20 == -9803)
    {
      if (!*(void *)(v6 + 40)) {
        return v7;
      }
    }
    else if (v20)
    {
      CFStringRef v27 = EAPLogGetLogHandle();
      os_log_type_t v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = EAPSSLErrorString(v20);
        int v36 = 136315394;
        uint64_t v37 = v29;
        __int16 v38 = 2048;
        uint64_t v39 = (int)v20;
        _os_log_impl(&dword_2106D5000, v27, v28, "SSLHandshake failed, %s (%ld)", (uint8_t *)&v36, 0x16u);
      }
      *(_DWORD *)(v6 + 124) = v20;
      my_CFRelease((const void **)(v6 + 272));
      EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (void *)(v6 + 272));
      *(_DWORD *)(v6 + 104) = 2;
      EAPTLSSessionClose(*(void *)v6, v30);
      if (!*(void *)(v6 + 40))
      {
        if (v20 != -9802) {
          return v7;
        }
        char v33 = (char)a2;
        int v31 = 0;
        int v34 = 0;
        uint64_t v32 = 0;
        return EAPTLSPacketCreate(2, 13, v33, v31, v34, v32);
      }
    }
    else if (!*(unsigned char *)(v6 + 140))
    {
      my_CFRelease((const void **)(v6 + 272));
      EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (void *)(v6 + 272));
      BOOL v22 = EAPTLSSessionIsRevocationStatusCheckRequired(*(void *)v6);
      char v23 = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        int v25 = "is";
        if (!v22) {
          int v25 = "is not";
        }
        int v36 = 136315138;
        uint64_t v37 = (uint64_t)v25;
        _os_log_impl(&dword_2106D5000, v23, v24, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
      }
      uint64_t v26 = eaptls_verify_server(a1, a2, v22, a3);
      if (!*(unsigned char *)(v6 + 140))
      {
        uint64_t v7 = v26;
        char v9 = EAPLogGetLogHandle();
        os_log_type_t v10 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v9, v10)) {
          return v7;
        }
        LOWORD(v36) = 0;
        uint64_t v11 = "trust_proceed is FALSE?";
        goto LABEL_8;
      }
    }
    int v31 = *(_DWORD *)(v6 + 120);
    uint64_t v32 = (_DWORD *)(v6 + 72);
    char v33 = (char)a2;
    int v34 = (void *)(v6 + 40);
    return EAPTLSPacketCreate(2, 13, v33, v31, v34, v32);
  }
  if (!*(unsigned char *)(v6 + 271))
  {
    *(unsigned char *)(v6 + 271) = 1;
    my_CFRelease((const void **)(v6 + 272));
    EAPTLSSessionCopyPeerCertificates(*(void ***)v6, (void *)(v6 + 272));
    BOOL v16 = EAPTLSSessionIsRevocationStatusCheckRequired(*(void *)v6);
    os_log_type_t v17 = EAPLogGetLogHandle();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = "is";
      if (!v16) {
        uint64_t v19 = "is not";
      }
      int v36 = 136315138;
      uint64_t v37 = (uint64_t)v19;
      _os_log_impl(&dword_2106D5000, v17, v18, "revocation status check %s required", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v7 = eaptls_verify_server(a1, a2, v16, a3);
    if (!*(unsigned char *)(v6 + 140)) {
      return v7;
    }
    uint64_t v8 = EAPTLSSessionHandshake(*(void *)v6);
    goto LABEL_21;
  }
  char v9 = EAPLogGetLogHandle();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    LOWORD(v36) = 0;
    uint64_t v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_2106D5000, v9, v10, v11, (uint8_t *)&v36, 2u);
  }
  return v7;
}

uint64_t md5_init(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 0;
  *a2 = 0;
  return 0;
}

uint64_t md5_process(uint64_t a1, unsigned __int8 *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *a4 = 0;
  *a5 = 0;
  *a3 = 0;
  int v5 = *a2;
  if (v5 == 4)
  {
    *a4 = 1;
    return 2;
  }
  if (v5 == 3) {
    return 1;
  }
  uint64_t result = 0;
  if (v5 == 1)
  {
    if (!*(void *)(a1 + 64))
    {
      uint64_t result = 0;
      *a4 = 3;
      return result;
    }
    unsigned int Length = EAPPacketGetLength((uint64_t)a2);
    unsigned int v11 = Length;
    if (Length > 5)
    {
      if ((unint64_t)a2[5] + 6 <= Length)
      {
        int v21 = *(_DWORD *)(a1 + 48) + 22;
        BOOL v22 = malloc_type_malloc(v21, 0x83AC3849uLL);
        uint64_t v20 = v22;
        if (v22)
        {
          *BOOL v22 = 2;
          v22[1] = a2[1];
          EAPPacketSetLength((uint64_t)v22, (unsigned __int16)v21);
          *((_WORD *)v20 + 2) = 4100;
          chap_md5(a2[1], *(const void **)(a1 + 64), *(_DWORD *)(a1 + 72), a2 + 6, a2[5], v20 + 6);
          memmove(v20 + 22, *(const void **)(a1 + 40), *(unsigned int *)(a1 + 48));
        }
        goto LABEL_16;
      }
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v18))
      {
        uint64_t v19 = a2[5] + 6;
        int v23 = 67109376;
        unsigned int v24 = v11;
        __int16 v25 = 2048;
        uint64_t v26 = v19;
        os_log_type_t v14 = "value too short (length %d < %ld)";
        unsigned int v15 = LogHandle;
        os_log_type_t v16 = v18;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v12 = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        int v23 = 67109376;
        unsigned int v24 = v11;
        __int16 v25 = 2048;
        uint64_t v26 = 6;
        os_log_type_t v14 = "header too short (length %d < %ld)";
        unsigned int v15 = v12;
        os_log_type_t v16 = v13;
LABEL_14:
        _os_log_impl(&dword_2106D5000, v15, v16, v14, (uint8_t *)&v23, 0x12u);
      }
    }
    uint64_t v20 = 0;
LABEL_16:
    uint64_t result = 0;
    *a3 = v20;
  }
  return result;
}

CFArrayRef md5_require_props(uint64_t a1)
{
  if (*(void *)(a1 + 64)) {
    return 0;
  }
  values = @"UserPassword";
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
}

void md5_free_packet(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t eapfast_failure_string()
{
  return 0;
}

uint64_t eapfast_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if (!*(unsigned char *)(v2 + 33277)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 33310;
}

uint64_t eapfast_msk_copy_bytes(uint64_t a1, _OWORD *a2, int a3)
{
  if (a3 < 64 || !*(unsigned char *)(*(void *)a1 + 33277)) {
    return 0;
  }
  long long v3 = *(_OWORD *)(*(void *)a1 + 33278);
  long long v4 = *(_OWORD *)(*(void *)a1 + 33294);
  long long v5 = *(_OWORD *)(*(void *)a1 + 33326);
  a2[2] = *(_OWORD *)(*(void *)a1 + 33310);
  a2[3] = v5;
  *a2 = v3;
  a2[1] = v4;
  return 64;
}

CFArrayRef eapfast_require_props(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*(_DWORD *)(*a1 + 140) != 3) {
    return 0;
  }
  if (!*(unsigned char *)(v1 + 33276))
  {
    values = @"TLSUserTrustProceedCertificateChain";
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  }
  if (!*(unsigned char *)(v1 + 144)) {
    return 0;
  }
  CFArrayRef result = *(CFArrayRef *)(v1 + 312);
  if (result)
  {
    return (CFArrayRef)CFRetain(result);
  }
  return result;
}

__CFDictionary *eapfast_publish_props_copy(uint64_t *a1)
{
  SSLCipherSuite cipherSuite = 0;
  uint64_t v1 = *a1;
  uint64_t v2 = (unsigned char *)(*a1 + 33276);
  CFArrayRef v3 = *(const __CFArray **)(*a1 + 33408);
  if (v3)
  {
    CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v3);
    if (!CFDataArray) {
      return 0;
    }
  }
  else
  {
    CFDataArray = 0;
  }
  if (*(unsigned char *)(v1 + 144) && (CFDictionaryRef v6 = *(const __CFDictionary **)(v1 + 320)) != 0) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  long long v5 = MutableCopy;
  if (CFDataArray)
  {
    CFDictionarySetValue(MutableCopy, @"TLSServerCertificateChain", CFDataArray);
    CFRelease(CFDataArray);
  }
  if (*(void *)v1)
  {
    SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
    if (cipherSuite)
    {
      LODWORD(valuePtr) = cipherSuite;
      CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v5, @"TLSNegotiatedCipher", v8);
      CFRelease(v8);
    }
  }
  char v9 = (const void *)*MEMORY[0x263EFFB40];
  if (v2[190]) {
    CFDictionarySetValue(v5, @"EAPFASTPACWasProvisioned", (const void *)*MEMORY[0x263EFFB40]);
  }
  if (v2[176]) {
    os_log_type_t v10 = v9;
  }
  else {
    os_log_type_t v10 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(v5, @"TLSSessionWasResumed", v10);
  if (*(void *)(v1 + 152))
  {
    unsigned int v11 = *(const char **)(v1 + 336);
    int v15 = *(_DWORD *)(v1 + 328);
    if (v15)
    {
      if (v11)
      {
        unsigned int valuePtr = CFStringCreateWithCString(0, v11, 0x600u);
        CFDictionarySetValue(v5, @"InnerEAPTypeName", valuePtr);
        my_CFRelease(&valuePtr);
      }
      unsigned int valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v5, @"InnerEAPType", valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 140) == 3 && !*v2)
  {
    CFNumberRef v12 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 33272));
    CFDictionarySetValue(v5, @"TLSTrustClientStatus", v12);
    CFRelease(v12);
  }
  return v5;
}

__CFString *eapfast_copy_packet_description(unsigned __int8 *a1, unsigned char *a2)
{
  uint64_t Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1) {
    return 0;
  }
  uint64_t v5 = Length;
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  uint64_t v7 = Mutable;
  if (v5 > 5)
  {
    uint64_t v8 = a1[5];
    char v9 = "Response";
    if (*a1 == 1) {
      char v9 = "Request";
    }
    os_log_type_t v10 = " [";
    if (v8 < 8) {
      os_log_type_t v10 = (const char *)&unk_21070AD61;
    }
    CFStringAppendFormat(Mutable, 0, @"EAP-FAST Version %d %s: Identifier %d Length %d Flags 0x%x%s", v8 & 7, v9, a1[1], v5, v8, v10);
    unsigned int v11 = a1 + 6;
    uint64_t v12 = (v5 - 6);
    unsigned int v13 = a1[5];
    if ((v13 & 0x20) != 0)
    {
      CFStringAppendFormat(v7, 0, @" start");
      unsigned int v13 = a1[5];
    }
    Messageuint64_t Length = (v5 - 6);
    if ((v13 & 0x80) != 0 && v5 >= 0xA)
    {
      unsigned int v11 = a1 + 10;
      uint64_t v12 = (v5 - 10);
      Messageuint64_t Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a1);
      CFStringAppendFormat(v7, 0, @" length=%u", MessageLength);
      unsigned int v13 = a1[5];
    }
    if ((v13 & 0x40) != 0)
    {
      CFStringAppendFormat(v7, 0, @" more");
      unsigned int v13 = a1[5];
    }
    if (v13 >= 8) {
      int v15 = " ]";
    }
    else {
      int v15 = (const char *)&unk_21070AD61;
    }
    CFStringAppendFormat(v7, 0, @"%s Data Length %d\n", v15, v12);
    if (MessageLength <= 0x20000)
    {
      if ((a1[5] & 0x20) != 0 && v12 >= 5 && *v11 == 1024)
      {
        unint64_t v16 = bswap32((unsigned __int16)v11[1]) >> 16;
        CFStringAppendFormat(v7, 0, @"Authority ID Data Length %d ID ", v16);
        if ((unint64_t)v12 - 4 < v16)
        {
          LODWORD(v16) = (unsigned __int16)(v12 - 4);
          CFStringAppendFormat(v7, 0, @"> available %d! ", (unsigned __int16)(v12 - 4));
        }
        print_bytes_cfstr(v7, (uint64_t)(v11 + 2), v16);
        CFStringAppendFormat(v7, 0, @"\n");
      }
      else
      {
        print_data_cfstr(v7, (uint64_t)v11, v12);
      }
      *a2 = 1;
    }
    else
    {
      CFStringAppendFormat(v7, 0, @"potential DOS attack %u > %d\n", MessageLength, 0x20000);
      CFStringAppendFormat(v7, 0, @"bogus EAP Packet:\n");
      print_data_cfstr(v7, (uint64_t)a1, v5);
    }
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, @"EAPTLSPacket header truncated %d < %d\n", v5, 6);
  }
  return v7;
}

unsigned char *eapfast_tunnel(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (!eapfast_eap()) {
    return 0;
  }
  char v4 = *(unsigned char *)(a2 + 1);
  int v5 = *(_DWORD *)(v3 + 128);
  return EAPTLSPacketCreate2(2, 43, v4, v5, (void *)(v3 + 48), (_DWORD *)(v3 + 80), 0);
}

unsigned char *eapfast_handshake(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  CFDictionaryRef v6 = *(const __CFDictionary **)a1;
  uint64_t v7 = *(void *)a1 + 33276;
  if (*(unsigned char *)(*(void *)a1 + 33406) && !*(unsigned char *)v7)
  {
    uint64_t v8 = eapfast_verify_server((const __CFDictionary **)a1, *(unsigned char *)(a2 + 1), a3);
    if (!*(unsigned char *)v7) {
      return v8;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = SSLHandshake(*(SSLContextRef *)v6);
  if (v9 != -9841) {
    goto LABEL_13;
  }
  if (!*(unsigned char *)(v7 + 130))
  {
    *(unsigned char *)(v7 + 130) = 1;
    my_CFRelease((const void **)v6 + 4176);
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)v6 + 4176);
    uint64_t v8 = eapfast_verify_server((const __CFDictionary **)a1, *(unsigned char *)(a2 + 1), a3);
    if (!*(unsigned char *)v7) {
      return v8;
    }
    uint64_t v9 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    uint64_t v13 = v9;
    if (v9 == -9803)
    {
LABEL_39:
      if (*((void *)v6 + 6))
      {
        int v41 = *((_DWORD *)v6 + 32);
        uint64_t v42 = (_DWORD *)((char *)v6 + 80);
        CFDataRef v43 = (void *)((char *)v6 + 48);
      }
      else
      {
        int v41 = 0;
        CFDataRef v43 = 0;
        uint64_t v42 = 0;
      }
      return EAPTLSPacketCreate(2, 43, *(unsigned char *)(a2 + 1), v41, v43, v42);
    }
    if (v9)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v16 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v16))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v69 = EAPSSLErrorString(v13);
        __int16 v70 = 1024;
        int v71 = v13;
        os_log_type_t v18 = "SSLHandshake failed, %s (%d)";
        uint64_t v19 = buf;
LABEL_29:
        _os_log_impl(&dword_2106D5000, LogHandle, v16, v18, v19, 0x12u);
      }
    }
    else
    {
      if (!*(unsigned char *)v7)
      {
        my_CFRelease((const void **)v6 + 4176);
        EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)v6 + 4176);
        uint64_t v8 = eapfast_verify_server((const __CFDictionary **)a1, *(unsigned char *)(a2 + 1), a3);
        if (!*(unsigned char *)v7)
        {
          os_log_type_t v10 = EAPLogGetLogHandle();
          os_log_type_t v11 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v10, v11)) {
            return v8;
          }
          *(_WORD *)buf = 0;
          uint64_t v12 = "trust_proceed is FALSE?";
          goto LABEL_8;
        }
      }
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      int v58 = 64;
      LODWORD(v13) = ssl_get_server_client_random(*(void *)v6, (uint64_t)v66, &v58);
      if (v13) {
        goto LABEL_30;
      }
      uint64_t v59 = 48;
      uint64_t v14 = SSLInternalMasterSecret();
      if (v14)
      {
        uint64_t v13 = v14;
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          uint64_t v17 = EAPSSLErrorString(v13);
          *(_DWORD *)uint64_t v62 = 136315394;
          uint64_t v63 = v17;
          __int16 v64 = 1024;
          int v65 = v13;
          os_log_type_t v18 = "SSLInternalMasterSecret failed, %s (%d)";
LABEL_28:
          uint64_t v19 = v62;
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v20 = SSLGetCipherSizes();
        if (!v20)
        {
          uint64_t v56 = 2 * ((int)v61 + (int)v60);
          if ((v56 + 72) < 0x101) {
            int v46 = buf;
          }
          else {
            int v46 = (uint8_t *)malloc_type_malloc((int)v56 + 72, 0x7954BC1DuLL);
          }
          uint64_t v13 = SSLInternal_PRF();
          if (v13)
          {
            CFDictionaryRef v57 = v46;
            os_log_t v47 = EAPLogGetLogHandle();
            os_log_type_t v48 = _SC_syslog_os_log_mapping();
            log = v47;
            int v49 = v47;
            int v46 = v57;
            os_log_type_t type = v48;
            if (os_log_type_enabled(v49, v48))
            {
              uint64_t v50 = EAPSSLErrorString(v13);
              *(_DWORD *)uint64_t v62 = 136315394;
              uint64_t v63 = v50;
              __int16 v64 = 1024;
              int v65 = v13;
              _os_log_impl(&dword_2106D5000, log, type, "SSLInternal_PRF failed, %s (%d)\n", v62, 0x12u);
            }
          }
          else
          {
            int v51 = &v46[(int)v56];
            long long v52 = *(_OWORD *)v51;
            long long v53 = *((_OWORD *)v51 + 1);
            *(void *)((char *)v6 + 33501) = *((void *)v51 + 4);
            *(_OWORD *)((char *)v6 + 33469) = v52;
            *(_OWORD *)((char *)v6 + 33485) = v53;
            *(_OWORD *)((char *)v6 + 33509) = *(_OWORD *)&v46[v56 + 40];
            *(_OWORD *)((char *)v6 + 33525) = *(_OWORD *)(v51 + 56);
          }
          if (v46 && v46 != buf) {
            free(v46);
          }
          if (!v13)
          {
            *((unsigned char *)v6 + 144) = 1;
            v66[0] = (const void *)32;
            LOBYTE(v67) = 0;
            if (!SSLGetResumableSessionInfo()) {
              *(unsigned char *)(v7 + 176) = (_BYTE)v67 != 0;
            }
            if (!eapfast_eap()) {
              return v8;
            }
            return EAPTLSPacketCreate2(2, 43, *(unsigned char *)(a2 + 1), *((_DWORD *)v6 + 32), (void *)v6 + 6, (_DWORD *)v6 + 20, 0);
          }
          goto LABEL_30;
        }
        uint64_t v13 = v20;
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          uint64_t v21 = EAPSSLErrorString(v13);
          *(_DWORD *)uint64_t v62 = 136315394;
          uint64_t v63 = v21;
          __int16 v64 = 1024;
          int v65 = v13;
          os_log_type_t v18 = "SSLGetCipherSizes failed, %s (%d)";
          goto LABEL_28;
        }
      }
    }
LABEL_30:
    *((_DWORD *)v6 + 34) = v13;
    my_CFRelease((const void **)v6 + 4176);
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)v6 + 4176);
    *((_DWORD *)v6 + 28) = 2;
    SSLClose(*(SSLContextRef *)v6);
    if (v13 == -9825)
    {
      CFDictionaryRef v22 = *(const __CFDictionary **)(v7 + 180);
      if (v22)
      {
        int v23 = *(UInt8 **)(a1 + 40);
        int v24 = *(_DWORD *)(a1 + 48);
        CFMutableArrayRef v67 = 0;
        CFNumberRef Value = (void *)CFDictionaryGetValue(v22, @"PACKeyKeychainItemID");
        CFDataRef v26 = (const __CFData *)CFDictionaryGetValue(v22, @"AuthorityID");
        CFPropertyListRef v27 = pac_list_copy();
        v66[0] = v27;
        if (v27)
        {
          CFArrayRef v28 = (const __CFArray *)v27;
          BytePtr = CFDataGetBytePtr(v26);
          unsigned __int16 Length = CFDataGetLength(v26);
          int pac = pac_list_find_pac(v28, BytePtr, Length, v23, v24);
          if (pac != -1)
          {
            int v32 = pac;
            CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v28);
            CFMutableArrayRef v67 = MutableCopy;
            CFArrayRemoveValueAtIndex(MutableCopy, v32);
            int v34 = EAPSecKeychainPasswordItemRemove(0, Value);
            if (v34)
            {
              int v35 = v34;
              int v36 = EAPLogGetLogHandle();
              os_log_type_t v37 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v36, v37))
              {
                __int16 v38 = EAPSecurityErrorString(v35);
                *(_DWORD *)buf = 136315394;
                uint64_t v69 = (uint64_t)v38;
                __int16 v70 = 1024;
                int v71 = v35;
                _os_log_impl(&dword_2106D5000, v36, v37, "EAP-FAST: EAPSecKeychainPasswordItemRemove failed, %s (%d)", buf, 0x12u);
              }
            }
            CFStringRef v39 = (const __CFString *)*MEMORY[0x263EFFE70];
            CFStringRef v40 = (const __CFString *)*MEMORY[0x263EFFE50];
            CFPreferencesSetValue(@"PACList", MutableCopy, @"com.apple.network.eapclient.eapfast", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
            my_CFRelease((const void **)&v67);
            CFPreferencesSynchronize(@"com.apple.network.eapclient.eapfast", v39, v40);
          }
        }
        my_CFRelease(v66);
      }
    }
    goto LABEL_39;
  }
  os_log_type_t v10 = EAPLogGetLogHandle();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_WORD *)buf = 0;
    uint64_t v12 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_2106D5000, v10, v11, v12, buf, 2u);
  }
  return v8;
}

void make_error(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 7)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      int v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 8;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    uint64_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2106D5000, v8, v9, "EAP-FAST: make_error(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    char v4 = (_DWORD *)(*(void *)a1 + v3);
    *(_DWORD *)(a1 + 12) = v3 + 8;
    *char v4 = 67110272;
    v4[1] = bswap32(a2);
  }
}

void make_nak(uint64_t a1, _WORD *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v3 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v6))
    {
      int v7 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = 10;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
    uint64_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_2106D5000, v8, v9, "EAP-FAST: make_nak(): buffer too small", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    uint64_t v4 = *(void *)a1 + v3;
    *(_DWORD *)(a1 + 12) = v3 + 10;
    *(_DWORD *)uint64_t v4 = 100664448;
    *(_WORD *)(v4 + 8) = *a2 & 0xFF3F;
    *(_DWORD *)(v4 + 4) = 0;
  }
}

void make_intermediate_result(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v2 <= 5)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      int v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v9[0] = 67109376;
      v9[1] = 6;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_2106D5000, LogHandle, v5, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v9, 0xEu);
    }
    int v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_2106D5000, v7, v8, "EAP-FAST: make_intermediate_result(): buffer too small", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    uint64_t v3 = *(void *)a1 + v2;
    *(_DWORD *)(a1 + 12) = v2 + 6;
    *(_DWORD *)uint64_t v3 = 33557120;
    *(_WORD *)(v3 + 4) = 256;
  }
}

BOOL process_crypto_binding(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int v34 = 0;
  if ((*(_DWORD *)(a3 + 8) - *(_DWORD *)(a3 + 12)) <= 0x3B)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v5);
    if (!result) {
      return result;
    }
    int v7 = *(_DWORD *)(a3 + 8) - *(_DWORD *)(a3 + 12);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = 60;
    os_log_type_t v8 = "EAP-FAST: process_crypto_binding: buffer too small %d < %ld";
    os_log_type_t v9 = buf;
    __int16 v10 = LogHandle;
    os_log_type_t v11 = v5;
    uint32_t v12 = 18;
    goto LABEL_15;
  }
  if (*((unsigned char *)a2 + 5) != 1)
  {
    int v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v15, v16);
    if (!result) {
      return result;
    }
    int v18 = *((unsigned __int8 *)a2 + 5);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 1;
    os_log_type_t v8 = "EAP-FAST: process_crypto_binding version is %d != %d";
    goto LABEL_11;
  }
  if (*((unsigned __int8 *)a2 + 6) != *(unsigned __int8 *)(a1 + 133))
  {
    uint64_t v19 = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v19, v20);
    if (!result) {
      return result;
    }
    int v21 = *((unsigned __int8 *)a2 + 6);
    int v22 = *(unsigned __int8 *)(a1 + 133);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v22;
    os_log_type_t v8 = "EAP-FAST: process_crypto_binding received_version is %d != %d";
    os_log_type_t v9 = buf;
    __int16 v10 = v19;
    os_log_type_t v11 = v20;
    goto LABEL_14;
  }
  if (*((unsigned char *)a2 + 7))
  {
    int v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v15, v16);
    if (!result) {
      return result;
    }
    int v17 = *((unsigned __int8 *)a2 + 7);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 0;
    os_log_type_t v8 = "EAP-FAST: process_crypto_binding sub_type %d != %d";
LABEL_11:
    os_log_type_t v9 = buf;
    __int16 v10 = v15;
    os_log_type_t v11 = v16;
LABEL_14:
    uint32_t v12 = 14;
LABEL_15:
    _os_log_impl(&dword_2106D5000, v10, v11, v8, v9, v12);
    return 0;
  }
  int v23 = (long long *)EAPClientModulePluginSessionKey(*(void *)(a1 + 152), a1 + 160, (uint64_t)&v34);
  if (v23)
  {
    uint64_t v24 = v34;
    if (v34 < 0x21)
    {
      __memcpy_chk();
      if (v24 != 32) {
        bzero((char *)&v35 + v24, 32 - v24);
      }
    }
    else
    {
      unsigned int v34 = 32;
      long long v25 = v23[1];
      long long v35 = *v23;
      long long v36 = v25;
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 33467))
    {
      CFDataRef v26 = EAPLogGetLogHandle();
      os_log_type_t v27 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(v26, v27);
      if (result)
      {
        *(_WORD *)buf = 0;
        os_log_type_t v8 = "EAP-FAST: anonymous PAC provisioning requires MSCHAPv2 - possible malicious server";
        os_log_type_t v9 = buf;
LABEL_34:
        __int16 v10 = v26;
        os_log_type_t v11 = v27;
        uint32_t v12 = 2;
        goto LABEL_15;
      }
      return result;
    }
    long long v35 = 0u;
    long long v36 = 0u;
  }
  T_PRF((const void *)(a1 + 33469), 40, "Inner Methods Compound Keys", 0x1Bu, &v35, 32, buf, 60);
  uint64_t v28 = *(void *)a3 + *(int *)(a3 + 12);
  long long v29 = *a2;
  long long v30 = a2[1];
  *(void *)(v28 + 32) = *((void *)a2 + 4);
  *(_OWORD *)uint64_t v28 = v29;
  *(_OWORD *)(v28 + 16) = v30;
  *(void *)(v28 + 40) = 0;
  *(void *)(v28 + 48) = 0;
  *(_DWORD *)(v28 + 56) = 0;
  CCHmac(0, v39, 0x14uLL, (const void *)v28, 0x3CuLL, &macOut);
  if (cc_cmp_safe())
  {
    CFDataRef v26 = EAPLogGetLogHandle();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v26, v27);
    if (result)
    {
      __int16 v33 = 0;
      os_log_type_t v8 = "EAP-FAST: process_crypto_binding Compound MAC is incorrect";
LABEL_33:
      os_log_type_t v9 = (uint8_t *)&v33;
      goto LABEL_34;
    }
  }
  else
  {
    *(_DWORD *)uint64_t v28 = 939527296;
    *(unsigned char *)(v28 + 6) = *(unsigned char *)(a1 + 134);
    *(unsigned char *)(v28 + 39) |= 1u;
    *(unsigned char *)(v28 + 7) = 1;
    CCHmac(0, v39, 0x14uLL, (const void *)v28, 0x3CuLL, &macOut);
    long long v31 = macOut;
    *(_DWORD *)(v28 + 56) = v41;
    *(_OWORD *)(v28 + 40) = v31;
    if (BufferAdvanceWritePtr(a3, 60))
    {
      long long v32 = *(_OWORD *)&buf[16];
      *(_OWORD *)(a1 + 33469) = *(_OWORD *)buf;
      *(_OWORD *)(a1 + 33485) = v32;
      *(void *)(a1 + 33501) = v38;
      return 1;
    }
    CFDataRef v26 = EAPLogGetLogHandle();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v26, v27);
    if (result)
    {
      __int16 v33 = 0;
      os_log_type_t v8 = "EAP-FAST: process_crypto_binding: buffer too small";
      goto LABEL_33;
    }
  }
  return result;
}

void eapfast_compute_session_key(uint64_t a1)
{
  uint64_t v2 = (const void *)(a1 + 33469);
  T_PRF((const void *)(a1 + 33469), 40, "Session Key Generating Function", 0x1Fu, 0, 0, (_DWORD *)(a1 + 33278), 64);
  T_PRF(v2, 40, "Extended Session Key Generating Function", 0x28u, 0, 0, (_DWORD *)(a1 + 33342), 64);
  *(unsigned char *)(a1 + 33277) = 1;
}

void make_pac_request(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(int *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) - (int)v2 <= 9)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v5))
    {
      int v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v9[0] = 67109376;
      v9[1] = 10;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_2106D5000, LogHandle, v5, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v9, 0xEu);
    }
    int v7 = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_2106D5000, v7, v8, "EAP-FAST: make_pac_request(): buffer too small", (uint8_t *)v9, 2u);
    }
  }
  else
  {
    uint64_t v3 = *(void *)a1 + v2;
    *(_DWORD *)(a1 + 12) = v2 + 10;
    *(void *)uint64_t v3 = 0x2000A0006000B00;
    *(_WORD *)(v3 + 8) = 256;
  }
}

BOOL BufferAdvanceWritePtr(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 12);
  int v5 = *(_DWORD *)(a1 + 8) - v4;
  if (v5 < a2)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      int v8 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
      v10[0] = 67109376;
      v10[1] = a2;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl(&dword_2106D5000, LogHandle, v7, "EAP-FAST: BufferAdvanceWritePtr failed: %d > %d", (uint8_t *)v10, 0xEu);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 12) = v4 + a2;
  }
  return v5 >= a2;
}

uint64_t peap_failure_string()
{
  return 0;
}

uint64_t peap_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  *a2 = 0;
  if ((*(_DWORD *)(v2 + 328) != 6 || *(_DWORD *)(v2 + 124) || *(_DWORD *)(v2 + 104) != 1)
    && (!*(unsigned char *)(v2 + 1397) || *(_DWORD *)(v2 + 144) != 1))
  {
    return 0;
  }
  *a2 = 32;
  return v2 + 1430;
}

uint64_t peap_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if ((*(_DWORD *)(*a1 + 328) != 6 || *(_DWORD *)(v3 + 124) || *(_DWORD *)(v3 + 104) != 1)
    && (!*(unsigned char *)(v3 + 1397) || *(_DWORD *)(v3 + 144) != 1))
  {
    return 0;
  }
  int v4 = (long long *)(v3 + 1398);
  long long v5 = *v4;
  long long v6 = v4[1];
  long long v7 = v4[3];
  a2[2] = v4[2];
  a2[3] = v7;
  *a2 = v5;
  a2[1] = v6;
  return 64;
}

CFArrayRef peap_require_props(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*(_DWORD *)(*a1 + 136) != 3) {
    return 0;
  }
  if (!*(unsigned char *)(v1 + 1396))
  {
    values = @"TLSUserTrustProceedCertificateChain";
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  }
  if (!*(unsigned char *)(v1 + 140)) {
    return 0;
  }
  CFArrayRef result = *(CFArrayRef *)(v1 + 312);
  if (result)
  {
    return (CFArrayRef)CFRetain(result);
  }
  return result;
}

__CFDictionary *peap_publish_props_copy(uint64_t *a1)
{
  SSLCipherSuite cipherSuite = 0;
  uint64_t v1 = *a1;
  CFArrayRef v2 = *(const __CFArray **)(*a1 + 1528);
  if (!v2) {
    return 0;
  }
  CFDataArray = EAPSecCertificateArrayCreateCFDataArray(v2);
  uint64_t v14 = CFDataArray;
  if (!CFDataArray) {
    return 0;
  }
  int v4 = CFDataArray;
  if (*(unsigned char *)(v1 + 140) && (CFDictionaryRef v5 = *(const __CFDictionary **)(v1 + 320)) != 0) {
    CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v5);
  }
  else {
    CFMutableArrayRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  long long v7 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"TLSServerCertificateChain", v4);
  int v8 = (const void **)MEMORY[0x263EFFB40];
  if (!*(unsigned char *)(v1 + 1537)) {
    int v8 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(v7, @"TLSSessionWasResumed", *v8);
  my_CFRelease((const void **)&v14);
  SSLGetNegotiatedCipher(*(SSLContextRef *)v1, &cipherSuite);
  if (cipherSuite)
  {
    LODWORD(valuePtr) = cipherSuite;
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v7, @"TLSNegotiatedCipher", v9);
    CFRelease(v9);
  }
  if (*(void *)(v1 + 152))
  {
    __int16 v10 = *(const char **)(v1 + 336);
    int v15 = *(_DWORD *)(v1 + 328);
    if (v15)
    {
      if (v10)
      {
        unsigned int valuePtr = CFStringCreateWithCString(0, v10, 0x600u);
        CFDictionarySetValue(v7, @"InnerEAPTypeName", valuePtr);
        my_CFRelease(&valuePtr);
      }
      unsigned int valuePtr = CFNumberCreate(0, kCFNumberIntType, &v15);
      CFDictionarySetValue(v7, @"InnerEAPType", valuePtr);
      my_CFRelease(&valuePtr);
    }
  }
  if (*(_DWORD *)(v1 + 136) == 3 && !*(unsigned char *)(v1 + 1396))
  {
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v1 + 1392));
    CFDictionarySetValue(v7, @"TLSTrustClientStatus", v11);
    CFRelease(v11);
  }
  return v7;
}

__CFString *peap_copy_packet_description(unsigned __int8 *a1, unsigned char *a2)
{
  uint64_t Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1) {
    return 0;
  }
  uint64_t v5 = Length;
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  long long v7 = Mutable;
  if (v5 > 5)
  {
    uint64_t v8 = a1[5];
    CFNumberRef v9 = "Response";
    if (*a1 == 1) {
      CFNumberRef v9 = "Request";
    }
    __int16 v10 = " [";
    if (v8 < 8) {
      __int16 v10 = (const char *)&unk_21070AD61;
    }
    CFStringAppendFormat(Mutable, 0, @"PEAP Version %d %s: Identifier %d Length %d Flags 0x%x%s", v8 & 7, v9, a1[1], v5, v8, v10);
    uint64_t v11 = (uint64_t)(a1 + 6);
    uint64_t v12 = (v5 - 6);
    unsigned int v13 = a1[5];
    if ((v13 & 0x20) != 0)
    {
      CFStringAppendFormat(v7, 0, @" start");
      unsigned int v13 = a1[5];
    }
    Messageuint64_t Length = (v5 - 6);
    if ((v13 & 0x80) != 0 && v5 >= 0xA)
    {
      uint64_t v11 = (uint64_t)(a1 + 10);
      uint64_t v12 = (v5 - 10);
      Messageuint64_t Length = EAPTLSLengthIncludedPacketGetMessageLength((uint64_t)a1);
      CFStringAppendFormat(v7, 0, @" length=%u", MessageLength);
      unsigned int v13 = a1[5];
    }
    if ((v13 & 0x40) != 0)
    {
      CFStringAppendFormat(v7, 0, @" more");
      unsigned int v13 = a1[5];
    }
    if (v13 >= 8) {
      int v15 = " ]";
    }
    else {
      int v15 = (const char *)&unk_21070AD61;
    }
    CFStringAppendFormat(v7, 0, @"%s Data Length %d\n", v15, v12);
    if (MessageLength <= 0x20000)
    {
      print_data_cfstr(v7, v11, v12);
      *a2 = 1;
    }
    else
    {
      CFStringAppendFormat(v7, 0, @"potential DOS attack %u > %d\n", MessageLength, 0x20000);
      CFStringAppendFormat(v7, 0, @"bogus EAP Packet:\n");
      print_data_cfstr(v7, (uint64_t)a1, v5);
    }
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, @"EAPTLSPacket header truncated %d < %d\n", v5, 6);
  }
  return v7;
}

unsigned char *peap_tunnel()
{
  mach_error_t v0 = (uint64_t *)MEMORY[0x270FA5388]();
  CFArrayRef v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = (uint64_t)v0;
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v6 = *v0;
  char v57 = 0;
  size_t v55 = 0;
  size_t processed = 0;
  int v54 = 2048;
  unsigned int v7 = 2 * (*(_DWORD *)(v6 + 124) == 0);
  if (*(_DWORD *)(v6 + 76) != *(unsigned __int8 *)(v3 + 1))
  {
    *(void *)(v6 + 24) = 0;
    uint64_t v8 = &v61[v7];
    uint64_t v15 = SSLRead(*(SSLContextRef *)v6, v8, 2048 - v7 * 2, &processed);
    if (v15)
    {
      uint64_t v16 = v15;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v18))
      {
        uint64_t v19 = EAPSSLErrorString(v16);
        *(_DWORD *)buf = 136315394;
        *(void *)uint64_t v59 = v19;
        *(_WORD *)&v59[8] = 1024;
        *(_DWORD *)&v59[10] = v16;
        _os_log_impl(&dword_2106D5000, LogHandle, v18, "SSLRead failed, %s (%d)", buf, 0x12u);
      }
      *(_DWORD *)(v6 + 104) = 2;
      *(_DWORD *)(v6 + 132) = v16;
      return 0;
    }
    if (!*(_DWORD *)(v6 + 124))
    {
      size_t v20 = processed;
      if (processed < 5
        || *v8 != 1
        || v8[4] != 33
        || (Length = EAPPacketGetLength((uint64_t)&v61[v7]), size_t v20 = processed, processed != Length))
      {
        v61[0] = *(_WORD *)v4;
        size_t processed = v20 + 4;
        uint64_t v8 = v61;
        EAPPacketSetLength((uint64_t)v61, (unsigned __int16)(v20 + 4));
      }
    }
    if (*(unsigned char *)(v5 + 8))
    {
      CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
      int IsValid = EAPPacketIsValid(v8, (unsigned __int16)processed, Mutable);
      if (Mutable)
      {
        uint64_t v24 = EAPLogGetLogHandle();
        os_log_type_t v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          CFDataRef v26 = " Invalid";
          if (IsValid) {
            CFDataRef v26 = (const char *)&unk_21070AD61;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v59 = v26;
          *(_WORD *)&v59[8] = 2112;
          *(void *)&v59[10] = Mutable;
          _os_log_impl(&dword_2106D5000, v24, v25, "PEAP Receive EAP Payload%s:\n%@", buf, 0x16u);
        }
        CFRelease(Mutable);
      }
      if ((IsValid & 1) == 0) {
        goto LABEL_34;
      }
    }
    else if ((EAPPacketIsValid(v8, (unsigned __int16)processed, 0) & 1) == 0)
    {
LABEL_34:
      if (*(unsigned char *)(v5 + 8)) {
        return 0;
      }
      long long v31 = EAPLogGetLogHandle();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v31, v32)) {
        return 0;
      }
      *(_WORD *)buf = 0;
      __int16 v33 = "PEAP Receive EAP Payload Invalid";
      unsigned int v34 = v31;
      os_log_type_t v35 = v32;
      uint32_t v36 = 2;
      goto LABEL_40;
    }
LABEL_3:
    switch(*v8)
    {
      case 1:
        int v9 = v8[4];
        if (v9 != 33)
        {
          if (v9 == 2)
          {
            signed int v10 = v54;
            char v11 = v8[1];
            int v14 = 2;
            uint64_t v12 = 0;
            int v13 = 0;
          }
          else
          {
            if (v9 != 1)
            {
LABEL_27:
              os_log_type_t v27 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
LABEL_43:
              uint64_t v28 = v27;
LABEL_44:
              BOOL v29 = 0;
              if (!v28) {
                goto LABEL_71;
              }
              goto LABEL_45;
            }
            signed int v10 = v54;
            char v11 = v8[1];
            uint64_t v12 = *(void **)(v5 + 40);
            int v13 = *(_DWORD *)(v5 + 48);
            int v14 = 1;
          }
          os_log_type_t v27 = EAPPacketCreate(v60, v10, 2, v11, v14, v12, v13, &v54);
          goto LABEL_43;
        }
        unsigned int v37 = EAPPacketGetLength((uint64_t)v8);
        if (v37 > 8)
        {
          if ((*(_WORD *)(v8 + 5) & 0xFF3F) != 0x300) {
            return 0;
          }
          unsigned int v51 = *(unsigned __int16 *)(v8 + 9);
          unsigned int v52 = __rev16(v51);
          if (v52 == 1 || v52 == 2) {
            *(_DWORD *)(v6 + 144) = v52;
          }
          uint64_t v28 = EAPPacketCreate(v60, v54, 2, v8[1], 33, 0, 6, &v54);
          BOOL v29 = 0;
          *(_DWORD *)(v28 + 5) = 33555328;
          *(_WORD *)(v28 + 9) = v51;
          if (!v28) {
            goto LABEL_71;
          }
LABEL_45:
          if (*(unsigned char *)(v5 + 8))
          {
            int v41 = CFStringCreateMutable(0, 0);
            uint64_t v42 = EAPPacketGetLength((uint64_t)v28);
            EAPPacketIsValid((unsigned __int8 *)v28, v42, v41);
            CFDataRef v43 = EAPLogGetLogHandle();
            os_log_type_t v44 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v43, v44))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)uint64_t v59 = v41;
              _os_log_impl(&dword_2106D5000, v43, v44, "PEAP Send EAP Payload:\n%@", buf, 0xCu);
            }
            CFRelease(v41);
          }
          int v45 = v54;
          if (!*(_DWORD *)(v6 + 124) && v54 >= 5 && *v28 == 2 && v28[4] == 33) {
            unsigned int v7 = 0;
          }
          int v46 = *(void **)(v6 + 352);
          if (v46 && v46 != (void *)(v6 + 360))
          {
            free(v46);
            int v45 = v54;
          }
          *(void *)(v6 + 352) = 0;
          uint64_t v47 = SSLWrite(*(SSLContextRef *)v6, &v28[v7 * 2], (int)(v45 - v7 * 2), &v55);
          if (v28 != v60)
          {
            if (!v57)
            {
              free(v28);
              if (v47)
              {
LABEL_61:
                os_log_type_t v48 = EAPLogGetLogHandle();
                os_log_type_t v49 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v48, v49))
                {
                  uint64_t v50 = EAPSSLErrorString(v47);
                  *(_DWORD *)buf = 136315394;
                  *(void *)uint64_t v59 = v50;
                  *(_WORD *)&v59[8] = 2048;
                  *(void *)&v59[10] = (int)v47;
                  _os_log_impl(&dword_2106D5000, v48, v49, "SSLWrite failed, %s (%ld)", buf, 0x16u);
                  if (!v29) {
                    return 0;
                  }
                  goto LABEL_72;
                }
LABEL_71:
                if (!v29) {
                  return 0;
                }
              }
LABEL_72:
              CFArrayRef result = EAPTLSPacketCreate2(2, 25, *(unsigned char *)(v4 + 1), *(_DWORD *)(v6 + 120), (void *)(v6 + 40), (_DWORD *)(v6 + 72), 0);
              if (result && *(void *)(v6 + 40))
              {
                if (*(unsigned char *)(v6 + 128)) {
                  result[5] |= 0x80u;
                }
              }
              return result;
            }
            EAPClientModulePluginFreePacket(*(void *)(v6 + 152), v6 + 160, (uint64_t)v28);
          }
          if (v47) {
            goto LABEL_61;
          }
          goto LABEL_72;
        }
        unsigned int v38 = v37;
        CFStringRef v39 = EAPLogGetLogHandle();
        os_log_type_t v40 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v39, v40)) {
          return 0;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v59 = v38;
        *(_WORD *)&v59[4] = 2048;
        *(void *)&v59[6] = 9;
        __int16 v33 = "packet too short %d < %ld";
        unsigned int v34 = v39;
        os_log_type_t v35 = v40;
        uint32_t v36 = 18;
        break;
      case 2:
        goto LABEL_27;
      case 3:
        uint64_t v28 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
        BOOL v29 = *(_DWORD *)(v6 + 124) == 1;
        if (!v28) {
          goto LABEL_71;
        }
        goto LABEL_45;
      case 4:
        long long v30 = peap_eap_process(v5, v8, v60, &v54, v2, &v57);
        uint64_t v28 = v30;
        if (*(_DWORD *)(v6 + 124) != 1) {
          goto LABEL_44;
        }
        *(_DWORD *)(v6 + 144) = 2;
        BOOL v29 = 1;
        if (!v30) {
          goto LABEL_71;
        }
        goto LABEL_45;
      default:
        return 0;
    }
LABEL_40:
    _os_log_impl(&dword_2106D5000, v34, v35, v33, buf, v36);
    return 0;
  }
  memoryBufferClear(v6 + 8);
  uint64_t v8 = *(unsigned char **)(v6 + 352);
  if (v8) {
    goto LABEL_3;
  }
  return 0;
}

unsigned char *peap_handshake(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  if (*(unsigned char *)(*a1 + 1526) && !*(unsigned char *)(v6 + 1396))
  {
    unsigned int v7 = peap_verify_server(a1, a2, a3);
    if (!*(unsigned char *)(v6 + 1396)) {
      return v7;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v8 = SSLHandshake(*(SSLContextRef *)v6);
  if (v8 != -9841) {
    goto LABEL_13;
  }
  if (!*(unsigned char *)(v6 + 1526))
  {
    *(unsigned char *)(v6 + 1526) = 1;
    my_CFRelease((const void **)(v6 + 1528));
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 1528));
    unsigned int v7 = peap_verify_server(a1, a2, a3);
    if (!*(unsigned char *)(v6 + 1396)) {
      return v7;
    }
    uint64_t v8 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    uint64_t v12 = v8;
    if (v8 == -9803)
    {
      if (!*(void *)(v6 + 40)) {
        return v7;
      }
    }
    else if (v8)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v19))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v26 = EAPSSLErrorString(v12);
        __int16 v27 = 1024;
        LODWORD(v28) = v12;
        _os_log_impl(&dword_2106D5000, LogHandle, v19, "SSLHandshake failed, %s (%d)", buf, 0x12u);
      }
      *(_DWORD *)(v6 + 132) = v12;
      my_CFRelease((const void **)(v6 + 1528));
      EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 1528));
      *(_DWORD *)(v6 + 104) = 2;
      SSLClose(*(SSLContextRef *)v6);
      if (!*(void *)(v6 + 40))
      {
        if (v12 != -9802) {
          return v7;
        }
        char v20 = a2;
        int v21 = 0;
        int v22 = 0;
        int v23 = 0;
        return EAPTLSPacketCreate(2, 25, v20, v21, v22, v23);
      }
    }
    else
    {
      if (!*(unsigned char *)(v6 + 1396))
      {
        my_CFRelease((const void **)(v6 + 1528));
        EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 1528));
        int v13 = peap_verify_server(a1, a2, a3);
        if (!*(unsigned char *)(v6 + 1396))
        {
          unsigned int v7 = v13;
          int v9 = EAPLogGetLogHandle();
          os_log_type_t v10 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v9, v10)) {
            return v7;
          }
          *(_WORD *)buf = 0;
          char v11 = "trust_proceed is FALSE?";
          goto LABEL_8;
        }
      }
      *(unsigned char *)(v6 + 140) = 1;
      *(unsigned char *)(v6 + 1397) = 0;
      uint64_t v14 = EAPTLSComputeKeyData();
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = EAPLogGetLogHandle();
        os_log_type_t v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v26 = EAPSSLErrorString(v15);
          __int16 v27 = 2048;
          uint64_t v28 = (int)v15;
          _os_log_impl(&dword_2106D5000, v16, v17, "EAPTLSComputeSessionKey failed, %s, (%ld)", buf, 0x16u);
        }
      }
      else
      {
        *(unsigned char *)(v6 + 1397) = 1;
      }
      if (!SSLGetResumableSessionInfo()) {
        *(unsigned char *)(v6 + 1537) = 0;
      }
    }
    int v21 = *(_DWORD *)(v6 + 120);
    int v23 = (_DWORD *)(v6 + 72);
    char v20 = a2;
    int v22 = (void *)(v6 + 40);
    return EAPTLSPacketCreate(2, 25, v20, v21, v22, v23);
  }
  int v9 = EAPLogGetLogHandle();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    *(_WORD *)buf = 0;
    char v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_2106D5000, v9, v10, v11, buf, 2u);
  }
  return v7;
}

void save_last_packet(uint64_t a1, const void *a2)
{
  CFArrayRef v2 = *(void **)(a1 + 352);
  if (v2 != a2)
  {
    unsigned int Length = EAPPacketGetLength((uint64_t)a2);
    size_t v6 = Length;
    unsigned int v7 = Length < 0x401 ? (void *)(a1 + 360) : malloc_type_malloc(Length, 0x86AD3027uLL);
    *(void *)(a1 + 352) = v7;
    memcpy(v7, a2, v6);
    if (v2)
    {
      if (v2 != (void *)(a1 + 360))
      {
        free(v2);
      }
    }
  }
}

NSObject *_SIMCopyIMSI(const __CFDictionary *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = (void *)MEMORY[0x21666F900]();
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  if (v3)
  {
    if (a1
      && (Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F03468]), CFTypeID TypeID = CFStringGetTypeID(), Value)
      && CFGetTypeID(Value) == TypeID)
    {
      size_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:Value];
      unsigned int v7 = SubscriptionContextMatchingSlotGet(v3, v6);

      if (!v7) {
        goto LABEL_6;
      }
    }
    else
    {
      unsigned int v7 = SubscriptionContextUserPreferredGet(v3);
      if (!v7)
      {
LABEL_6:
        uint64_t v8 = EAPLogGetLogHandle();
        os_log_type_t v9 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)buf = 0;
          os_log_type_t v10 = "failed to get the preferred subscription context";
LABEL_15:
          _os_log_impl(&dword_2106D5000, v8, v9, v10, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    id v17 = 0;
    char v11 = (void *)[v3 copyMobileSubscriberIdentity:v7 error:&v17];
    uint64_t v12 = v17;
    if (!v12)
    {
      uint64_t v8 = v11;

      uint64_t v15 = v8;
      goto LABEL_17;
    }
    uint64_t v8 = v12;
    int v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v19 = v8;
      _os_log_impl(&dword_2106D5000, v13, v14, "CoreTelephonyClient.copyMobileSubscriberIdentity failed with error: %@", buf, 0xCu);
    }

    goto LABEL_16;
  }
  uint64_t v8 = EAPLogGetLogHandle();
  os_log_type_t v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    *(_WORD *)buf = 0;
    os_log_type_t v10 = "failed to get the CoreTelephonyClient instance";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v15 = 0;
LABEL_17:

  return v15;
}

id SubscriptionContextMatchingSlotGet(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v31 = 0;
  uint64_t v4 = [a1 getSubscriptionInfoWithError:&v31];
  id v5 = v31;
  if (v5)
  {
    size_t v6 = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v7))
    {
LABEL_5:
      id v12 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    id v34 = v5;
    uint64_t v8 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    os_log_type_t v9 = v6;
    os_log_type_t v10 = v7;
    uint32_t v11 = 12;
LABEL_4:
    _os_log_impl(&dword_2106D5000, v9, v10, v8, buf, v11);
    goto LABEL_5;
  }
  if (!v4)
  {
    uint64_t v21 = [0 subscriptions];
    if (!v21
      || (int v22 = (void *)v21,
          [0 subscriptions],
          int v23 = objc_claimAutoreleasedReturnValue(),
          uint64_t v24 = [v23 count],
          v23,
          v22,
          !v24))
    {
      size_t v6 = EAPLogGetLogHandle();
      os_log_type_t v25 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v6, v25)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      uint64_t v8 = "failed to get the subscription contexts";
      os_log_type_t v9 = v6;
      os_log_type_t v10 = v25;
      uint32_t v11 = 2;
      goto LABEL_4;
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  size_t v6 = [v4 subscriptions];
  id v12 = (id)[v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v26 = v4;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (CFIndex i = 0; i != v12; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v15)
        {
          uint64_t v16 = [*(id *)(*((void *)&v27 + 1) + 8 * i) uuid];
          if (v16)
          {
            id v17 = (void *)v16;
            os_log_type_t v18 = [v15 uuid];
            int v19 = [v18 isEqual:v3];

            if (v19)
            {
              id v12 = v15;
              goto LABEL_19;
            }
          }
        }
      }
      id v12 = (id)[v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_19:
    uint64_t v4 = v26;
  }
LABEL_20:

  return v12;
}

id SubscriptionContextUserPreferredGet(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v27 = 0;
  uint64_t v1 = [a1 getSubscriptionInfoWithError:&v27];
  id v2 = v27;
  if (v2)
  {
    id v3 = EAPLogGetLogHandle();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4))
    {
LABEL_5:
      id v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412290;
    id v30 = v2;
    id v5 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    size_t v6 = v3;
    os_log_type_t v7 = v4;
    uint32_t v8 = 12;
LABEL_4:
    _os_log_impl(&dword_2106D5000, v6, v7, v5, buf, v8);
    goto LABEL_5;
  }
  if (!v1)
  {
    uint64_t v18 = [0 subscriptions];
    if (!v18
      || (int v19 = (void *)v18,
          [0 subscriptions],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 count],
          v20,
          v19,
          !v21))
    {
      id v3 = EAPLogGetLogHandle();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v3, v22)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      id v5 = "failed to get the subscription contexts";
      size_t v6 = v3;
      os_log_type_t v7 = v22;
      uint32_t v8 = 2;
      goto LABEL_4;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = objc_msgSend(v1, "subscriptions", 0);
  id v9 = (id)[v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (CFIndex i = 0; i != v9; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v13)
        {
          uint64_t v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) userDataPreferred];
          if (v14)
          {
            uint64_t v15 = (void *)v14;
            uint64_t v16 = [v13 userDataPreferred];
            int v17 = [v16 BOOLValue];

            if (v17)
            {
              id v9 = v13;
              goto LABEL_6;
            }
          }
        }
      }
      id v9 = (id)[v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_6:

  return v9;
}

id _SIMCopyRealm(const __CFDictionary *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x21666F900]();
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  if (!v3)
  {
    uint32_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v10 = "failed to get the CoreTelephonyClient instance";
      goto LABEL_15;
    }
LABEL_16:

    os_log_type_t v7 = 0;
    uint64_t v16 = 0;
    uint64_t v11 = 0;
    id v13 = 0;
LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }
  if (a1
    && (Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F03468]), CFTypeID TypeID = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    size_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:Value];
    os_log_type_t v7 = SubscriptionContextMatchingSlotGet(v3, v6);

    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    os_log_type_t v7 = SubscriptionContextUserPreferredGet(v3);
    if (!v7)
    {
LABEL_6:
      uint32_t v8 = EAPLogGetLogHandle();
      os_log_type_t v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)buf = 0;
        os_log_type_t v10 = "failed to get the preferred subscription context";
LABEL_15:
        _os_log_impl(&dword_2106D5000, v8, v9, v10, buf, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  id v23 = 0;
  uint64_t v11 = (void *)[v3 copyMobileSubscriberCountryCode:v7 error:&v23];
  id v12 = v23;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl(&dword_2106D5000, v14, v15, "CoreTelephonyClient.copyMobileSubscriberCountryCode failed with error: %@", buf, 0xCu);
    }

    uint64_t v16 = 0;
    goto LABEL_17;
  }
  id v22 = 0;
  uint64_t v16 = (void *)[v3 copyMobileSubscriberNetworkCode:v7 error:&v22];
  id v13 = v22;
  if (v13)
  {
    int v19 = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl(&dword_2106D5000, v19, v20, "CoreTelephonyClient.copyMobileSubscriberNetworkCode failed with error: %@", buf, 0xCu);
    }

    goto LABEL_17;
  }
  if (v11 && v16)
  {
    if ([v16 length] == 2)
    {
      uint64_t v21 = [NSString stringWithFormat:@"0%@", v16];

      uint64_t v16 = (void *)v21;
    }
    id v17 = [NSString stringWithFormat:@"wlan.mnc%@.mcc%@.3gppnetwork.org", v16, v11];
    id v13 = 0;
  }
  else
  {
    id v17 = 0;
  }
LABEL_18:

  return v17;
}

uint64_t _SIMIsOOBPseudonymSupported(BOOL *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x21666F900]();
  *a1 = 0;
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  os_log_type_t v4 = v3;
  if (!v3)
  {
    os_log_type_t v10 = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v10, v13)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "failed to get the CoreTelephonyClient instance";
LABEL_11:
    _os_log_impl(&dword_2106D5000, v10, v13, v14, buf, 2u);
    goto LABEL_12;
  }
  uint64_t v5 = SubscriptionContextUserPreferredGet(v3);
  if (!v5)
  {
    os_log_type_t v10 = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v10, v13)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "failed to get the user preferred subscription context";
    goto LABEL_11;
  }
  size_t v6 = v5;
  uint64_t v7 = *MEMORY[0x263F02E28];
  id v17 = 0;
  uint64_t v8 = [v4 context:v5 supportedIdentityProtectionFor:v7 error:&v17];
  os_log_type_t v9 = v17;
  if (!v9)
  {
    *a1 = v8 == 2;
    uint64_t v15 = 1;
    os_log_type_t v10 = v6;
    goto LABEL_13;
  }
  os_log_type_t v10 = v9;
  uint64_t v11 = EAPLogGetLogHandle();
  os_log_type_t v12 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 138412290;
    int v19 = v10;
    _os_log_impl(&dword_2106D5000, v11, v12, "CoreTelephonyClient.supportedIdentityProtectionFor failed with error: %@", buf, 0xCu);
  }

LABEL_12:
  uint64_t v15 = 0;
LABEL_13:

  return v15;
}

NSObject *_SIMCopyOOBPseudonym()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  mach_error_t v0 = (void *)MEMORY[0x21666F900]();
  id v1 = objc_alloc_init(MEMORY[0x263F02D30]);
  id v2 = v1;
  if (!v1)
  {
    size_t v6 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v11)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v12 = "failed to get the CoreTelephonyClient instance";
LABEL_11:
    _os_log_impl(&dword_2106D5000, v6, v11, v12, buf, 2u);
    goto LABEL_12;
  }
  uint64_t v3 = SubscriptionContextUserPreferredGet(v1);
  if (!v3)
  {
    size_t v6 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v6, v11)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    os_log_type_t v12 = "failed to get the user preferred subscription context";
    goto LABEL_11;
  }
  os_log_type_t v4 = (void *)v3;
  uint64_t v5 = *MEMORY[0x263F02E28];
  id v15 = 0;
  size_t v6 = [v2 context:v3 getPseudoIdentityFor:v5 error:&v15];
  id v7 = v15;
  if (!v7)
  {
    size_t v6 = v6;

    os_log_type_t v13 = v6;
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  os_log_type_t v9 = EAPLogGetLogHandle();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_2106D5000, v9, v10, "CoreTelephonyClient.getPseudoIdentityFor failed with error: %@", buf, 0xCu);
  }

LABEL_12:
  os_log_type_t v13 = 0;
LABEL_13:

  return v13;
}

NSObject *_SIMCopyEncryptedIMSIInfo(int a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x21666F900]();
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  os_log_type_t v4 = v3;
  if (!v3)
  {
    os_log_type_t v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      id v15 = "failed to get the CoreTelephonyClient instance";
LABEL_13:
      _os_log_impl(&dword_2106D5000, v13, v14, v15, buf, 2u);
    }
LABEL_14:
    size_t v6 = 0;
    id v8 = 0;
    uint64_t v16 = 0;
    os_log_type_t v11 = 0;
    id v7 = 0;
    id v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v5 = SubscriptionContextUserPreferredGet(v3);
  if (!v5)
  {
    os_log_type_t v13 = EAPLogGetLogHandle();
    os_log_type_t v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      id v15 = "failed to get the user preferred subscription context";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  size_t v6 = (void *)v5;
  id v7 = _SIMCopyIMSI(0);
  if (!v7)
  {
    id v8 = 0;
    uint64_t v16 = 0;
    os_log_type_t v11 = 0;
    id v17 = 0;
LABEL_22:
    os_log_type_t v13 = 0;
    goto LABEL_23;
  }
  id v8 = _SIMCopyRealm(0);
  if (a1 == 18) {
    os_log_type_t v9 = @"1%@";
  }
  else {
    os_log_type_t v9 = @"0%@";
  }
  os_log_type_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v7);
  os_log_type_t v11 = v10;
  uint64_t v21 = v2;
  if (v8)
  {
    id v12 = [NSString stringWithFormat:@"%@@%@", v10, v8];
  }
  else
  {
    id v12 = v10;
  }
  uint64_t v16 = v12;
  id v22 = 0;
  os_log_type_t v13 = [v4 context:v6 getEncryptedIdentity:v12 error:&v22];
  id v17 = v22;
  if (v17)
  {
    uint64_t v18 = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_2106D5000, v18, v19, "CoreTelephonyClient.getEncryptedIdentity failed with error: %@", buf, 0xCu);
    }

    id v2 = v21;
    goto LABEL_21;
  }
LABEL_23:

  return v13;
}

void _SIMReportDecryptionError(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x21666F900]();
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  os_log_type_t v4 = v3;
  if (!v3)
  {
    id v8 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v10))
    {
      LOWORD(v12) = 0;
      os_log_type_t v11 = "failed to get the CoreTelephonyClient instance";
LABEL_10:
      _os_log_impl(&dword_2106D5000, v8, v10, v11, (uint8_t *)&v12, 2u);
    }
LABEL_11:
    size_t v6 = 0;
    id v7 = 0;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v5 = SubscriptionContextUserPreferredGet(v3);
  if (!v5)
  {
    id v8 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v10))
    {
      LOWORD(v12) = 0;
      os_log_type_t v11 = "failed to get the user preferred subscription context";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  size_t v6 = (void *)v5;
  id v7 = [v4 context:v5 evaluateMobileSubscriberIdentity:a1];
  if (v7)
  {
    id v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      int v12 = 138412290;
      os_log_type_t v13 = v7;
      _os_log_impl(&dword_2106D5000, v8, v9, "CoreTelephonyClient.evaluateMobileSubscriberIdentity failed with error: %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t _SIMCreateAuthResponse(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = (void *)MEMORY[0x21666F900]();
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F02D30]);
  size_t v6 = v5;
  if (!v5)
  {
    os_log_type_t v9 = EAPLogGetLogHandle();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v9, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }

    id v8 = 0;
    goto LABEL_18;
  }
  if (a1)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:a1];
    id v8 = SubscriptionContextMatchingSlotGet(v6, v7);

    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  id v8 = SubscriptionContextUserPreferredGet(v5);
  if (v8)
  {
LABEL_9:
    *(void *)buf = 0;
    id v24 = buf;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__0;
    id v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    int v12 = (void *)*((void *)v24 + 5);
    *((void *)v24 + 5) = v11;

    uint64_t v13 = *((void *)v24 + 5);
    if (v13)
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x263F02D00]) initWithData:a2];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = ___SIMCreateAuthResponse_block_invoke;
      v21[3] = &unk_264133EB0;
      v21[4] = &v29;
      v21[5] = buf;
      [v6 generateAuthenticationInfoUsingSim:v8 authParams:v14 completion:v21];
      dispatch_time_t v15 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)v24 + 5), v15))
      {
        uint64_t v16 = EAPLogGetLogHandle();
        os_log_type_t v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl(&dword_2106D5000, v16, v17, "timed out while waiting for response", v22, 2u);
        }
      }
    }
    else
    {
      uint64_t v14 = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v18))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl(&dword_2106D5000, v14, v18, "dispatch_semaphore_create() failed", v22, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
    if (v13) {
      goto LABEL_17;
    }
LABEL_18:
    uint64_t v19 = 0;
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v19 = v30[3];
LABEL_19:

  _Block_object_dispose(&v29, 8);
  return v19;
}

void sub_2106F53C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

uint64_t SIMAuthenticateGSM(const __CFDictionary *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  if (a1)
  {
    CFNumberRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F03468]);
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID) {
      CFNumberRef Value = 0;
    }
  }
  else
  {
    CFNumberRef Value = 0;
  }
  if (a3 >= 1)
  {
    uint64_t v8 = 0;
    id v30 = (void *)*MEMORY[0x263F03488];
    uint64_t v9 = (void *)*MEMORY[0x263F03480];
    os_log_type_t v10 = (void *)*MEMORY[0x263F03458];
    dispatch_semaphore_t v11 = (const void *)*MEMORY[0x263F03450];
    char key = (void *)*MEMORY[0x263F03420];
    int v12 = (const void *)*MEMORY[0x263F03470];
    uint64_t v26 = (void *)*MEMORY[0x263F03428];
    uint64_t v28 = a3;
    while (1)
    {
      CFDataRef v13 = CFDataCreate(0, (const UInt8 *)(a2 + 16 * v8), 16);
      keys[0] = v30;
      keys[1] = v10;
      values[0] = v9;
      values[1] = v13;
      int v14 = 2;
      CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFRelease(v13);
      do
      {
        int v16 = v14;
        CFDictionaryRef v17 = (const __CFDictionary *)_SIMCreateAuthResponse((uint64_t)Value, (uint64_t)v15);
        if (v17) {
          break;
        }
        --v14;
      }
      while (v16);
      CFRelease(v15);
      if (!v17) {
        break;
      }
      CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(v17, v11);
      if (!v18 && (CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(v17, key)) == 0 || CFDataGetLength(v18) != 8)
      {
        uint64_t v21 = EAPLogGetLogHandle();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(keys[0]) = 0;
          id v23 = "bogus Kc value";
          goto LABEL_25;
        }
LABEL_26:

        CFRelease(v17);
        return 0;
      }
      v35.CFIndex location = 0;
      v35.CFIndex length = 8;
      CFDataGetBytes(v18, v35, (UInt8 *)(a4 + (8 * v8)));
      CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v17, v12);
      if (!v19 && (CFDataRef v19 = (const __CFData *)CFDictionaryGetValue(v17, v26)) == 0 || CFDataGetLength(v19) != 4)
      {
        uint64_t v21 = EAPLogGetLogHandle();
        os_log_type_t v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(keys[0]) = 0;
          id v23 = "bogus SRES value";
LABEL_25:
          _os_log_impl(&dword_2106D5000, v21, v22, v23, (uint8_t *)keys, 2u);
        }
        goto LABEL_26;
      }
      v36.CFIndex location = 0;
      v36.CFIndex length = 4;
      CFDataGetBytes(v19, v36, (UInt8 *)(a5 + (4 * v8)));
      CFRelease(v17);
      if (++v8 == v28) {
        return 1;
      }
    }
    id v24 = EAPLogGetLogHandle();
    os_log_type_t v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_2106D5000, v24, v25, "Could not access SIM", (uint8_t *)keys, 2u);
    }
  }
  return 0;
}

BOOL SIMAuthenticateAKA(const __CFDictionary *a1, void *a2, void *a3, const void **a4)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  if (a1)
  {
    CFNumberRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F03468]);
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID) {
      CFNumberRef Value = 0;
    }
  }
  else
  {
    CFNumberRef Value = 0;
  }
  uint64_t v9 = (void *)*MEMORY[0x263F03478];
  os_log_type_t v10 = (void *)*MEMORY[0x263F03458];
  keys[0] = *(void **)MEMORY[0x263F03488];
  keys[1] = v10;
  values[0] = v9;
  values[1] = a2;
  keys[2] = *(void **)MEMORY[0x263F03430];
  values[2] = a3;
  CFDictionaryRef v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v12 = 2;
  do
  {
    int v13 = v12;
    CFDictionaryRef v14 = (const __CFDictionary *)_SIMCreateAuthResponse((uint64_t)Value, (uint64_t)v11);
    if (v14) {
      break;
    }
    int v12 = v13 - 1;
  }
  while (v13);
  CFRelease(v11);
  if (v14)
  {
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
    CFDictionaryRef v15 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F03440]);
    int v16 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F03448]);
    CFDictionaryRef v17 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F03460]);
    if (v15) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || v17 == 0)
    {
      uint64_t v20 = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F03438]);
      if (!v20)
      {
LABEL_25:
        CFRelease(v14);
        return v14 != 0;
      }
      os_log_type_t v25 = v20;
      id v24 = a4 + 3;
    }
    else
    {
      id v23 = v17;
      my_FieldSetRetainedCFType(a4, v15);
      my_FieldSetRetainedCFType(a4 + 1, v16);
      id v24 = a4 + 2;
      os_log_type_t v25 = v23;
    }
    my_FieldSetRetainedCFType(v24, v25);
    goto LABEL_25;
  }
  uint64_t v21 = EAPLogGetLogHandle();
  os_log_type_t v22 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v21, v22))
  {
    LOWORD(keys[0]) = 0;
    _os_log_impl(&dword_2106D5000, v21, v22, "Could not access SIM", (uint8_t *)keys, 2u);
  }

  return v14 != 0;
}

double AKAAuthResultsInit(_OWORD *a1)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

SIMStatusIndicator *_SIMAccessConnectionCreate(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = (void *)MEMORY[0x21666F900]();
  id v5 = objc_alloc_init(SIMStatusIndicator);
  [(SIMStatusIndicator *)v5 setCallback:a1];
  [(SIMStatusIndicator *)v5 setApplicationContext:a2];
  [(SIMStatusIndicator *)v5 createConnection];
  return v5;
}

void AKAAuthResultsSetIK(uint64_t a1, const void *a2)
{
}

void AKAAuthResultsSetRES(uint64_t a1, const void *a2)
{
}

void AKAAuthResultsSetAUTS(uint64_t a1, const void *a2)
{
}

void AKAAuthResultsRelease(const void **a1)
{
  my_FieldSetRetainedCFType(a1, 0);
  my_FieldSetRetainedCFType(a1 + 1, 0);
  my_FieldSetRetainedCFType(a1 + 2, 0);
  my_FieldSetRetainedCFType(a1 + 3, 0);
}

CFArrayRef eapgtc_require_props(uint64_t a1)
{
  if (*(void *)(a1 + 64)) {
    return 0;
  }
  values = @"UserPassword";
  return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
}

BOOL eapttls_eap()
{
  mach_error_t v0 = (uint64_t *)MEMORY[0x270FA5388]();
  id v2 = v1;
  uint64_t v3 = (uint64_t)v0;
  uint64_t v57 = *MEMORY[0x263EF8340];
  char v47 = 0;
  uint64_t v4 = *v0;
  *(void *)&__len[1] = 0;
  if (*(_DWORD *)(v4 + 76) == *(unsigned __int8 *)(v5 + 1))
  {
    memoryBufferClear(v4 + 8);
    size_t v6 = *(unsigned __int8 **)(v4 + 496);
    if (v6)
    {
LABEL_3:
      __len[0] = 2048;
      switch(*v6)
      {
        case 1u:
          int v38 = v6[4];
          if (v38 == 2)
          {
            char v39 = v6[1];
            os_log_type_t v40 = 0;
            int v42 = 2;
            int v41 = 0;
          }
          else
          {
            if (v38 != 1)
            {
LABEL_4:
              id v7 = eapttls_eap_process(v3, v6, (char *)v52, __len, v2, &v47);
              goto LABEL_5;
            }
            char v39 = v6[1];
            os_log_type_t v40 = *(void **)(v3 + 40);
            int v41 = *(_DWORD *)(v3 + 48);
            int v42 = 1;
          }
          id v7 = EAPPacketCreate((char *)v52, 2048, 2, v39, v42, v40, v41, __len);
LABEL_5:
          uint64_t v8 = (unsigned __int8 *)v7;
          if (!v7) {
            return 0;
          }
          if (*(unsigned char *)(v3 + 8))
          {
            CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
            uint64_t Length = EAPPacketGetLength((uint64_t)v8);
            EAPPacketIsValid(v8, Length, Mutable);
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v12 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v12))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v49 = (uint64_t)Mutable;
              _os_log_impl(&dword_2106D5000, LogHandle, v12, "TTLS Send EAP Payload:\n%@", buf, 0xCu);
            }
            CFRelease(Mutable);
          }
          int v13 = *(void **)(v4 + 496);
          if (v13) {
            BOOL v14 = v13 == (void *)(v4 + 504);
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            free(v13);
          }
          *(void *)(v4 + 496) = 0;
          int v15 = __len[0] + 8;
          if (__len[0] + 8 <= 0) {
            int v16 = -(-(__len[0] + 8) & 3);
          }
          else {
            int v16 = (__len[0] + 8) & 3;
          }
          int v17 = __len[0] - v16 + 12;
          if (!v16) {
            int v17 = __len[0] + 8;
          }
          size_t v18 = v17;
          CFDataRef v19 = malloc_type_malloc(v17, 0xAA1E9BBFuLL);
          bzero(v19, v18);
          *CFDataRef v19 = 1325400064;
          v19[1] = bswap32(v15 & 0xFFFFFF);
          memmove(v19 + 2, v8, __len[0]);
          uint64_t v20 = SSLWrite(*(SSLContextRef *)v4, v19, v18, (size_t *)&__len[1]);
          free(v19);
          if (v8 == v52) {
            goto LABEL_23;
          }
          if (v47)
          {
            EAPClientModulePluginFreePacket(*(void *)(v4 + 296), v4 + 304, (uint64_t)v8);
LABEL_23:
            if (v20) {
              goto LABEL_24;
            }
          }
          else
          {
            free(v8);
            if (v20)
            {
LABEL_24:
              uint64_t v21 = EAPLogGetLogHandle();
              os_log_type_t v22 = _SC_syslog_os_log_mapping();
              BOOL result = os_log_type_enabled(v21, v22);
              if (!result) {
                return result;
              }
              uint64_t v24 = EAPSSLErrorString(v20);
              *(_DWORD *)buf = 136315394;
              uint64_t v49 = v24;
              __int16 v50 = 2048;
              uint64_t v51 = (int)v20;
              os_log_type_t v25 = "SSLWrite failed, %s (%ld)";
              uint64_t v26 = buf;
              id v27 = v21;
              os_log_type_t v28 = v22;
              uint32_t v29 = 22;
LABEL_48:
              _os_log_impl(&dword_2106D5000, v27, v28, v25, v26, v29);
              return 0;
            }
          }
          return 1;
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_4;
        default:
          return 0;
      }
    }
    return 0;
  }
  int v46 = 2048;
  if (eapttls_eap_read_avp(v0, v56, (unsigned int *)&v46))
  {
    if (!*(unsigned char *)(v3 + 8))
    {
      size_t v6 = v56;
      if (EAPPacketIsValid(v56, (unsigned __int16)v46, 0)) {
        goto LABEL_3;
      }
      goto LABEL_45;
    }
    id v30 = CFStringCreateMutable(0, 0);
    int IsValid = EAPPacketIsValid(v56, (unsigned __int16)v46, v30);
    int v32 = IsValid;
    if (v30)
    {
      __int16 v33 = EAPLogGetLogHandle();
      os_log_type_t v34 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v33, v34))
      {
        CFRange v35 = " Invalid";
        if (v32) {
          CFRange v35 = (const char *)&unk_21070AD61;
        }
        *(_DWORD *)unsigned int v52 = 136315394;
        long long v53 = v35;
        __int16 v54 = 2112;
        size_t v55 = v30;
        _os_log_impl(&dword_2106D5000, v33, v34, "TTLS Receive EAP Payload%s:\n%@", v52, 0x16u);
      }
      CFRelease(v30);
      if ((v32 & 1) == 0)
      {
LABEL_45:
        if (!*(unsigned char *)(v3 + 8))
        {
          CFDataRef v43 = EAPLogGetLogHandle();
          os_log_type_t v44 = _SC_syslog_os_log_mapping();
          BOOL result = os_log_type_enabled(v43, v44);
          if (!result) {
            return result;
          }
          *(_WORD *)unsigned int v52 = 0;
          os_log_type_t v25 = "TTLS Receive EAP Payload Invalid";
          uint64_t v26 = v52;
          id v27 = v43;
          os_log_type_t v28 = v44;
          uint32_t v29 = 2;
          goto LABEL_48;
        }
        return 0;
      }
    }
    else if ((IsValid & 1) == 0)
    {
      goto LABEL_45;
    }
    size_t v6 = v56;
    goto LABEL_3;
  }
  CFRange v36 = EAPLogGetLogHandle();
  os_log_type_t v37 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v36, v37))
  {
    *(_WORD *)unsigned int v52 = 0;
    _os_log_impl(&dword_2106D5000, v36, v37, "TTLS EAP Payload is missing", v52, 2u);
  }
  BOOL result = 0;
  *(_DWORD *)(v4 + 104) = 2;
  return result;
}

uint64_t eapttls_eap_read_avp(uint64_t *a1, void *a2, unsigned int *a3)
{
  char v5 = 0;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t data = 0;
  uint64_t v6 = *a1;
  unsigned int v7 = *a3;
  while (1)
  {
    size_t processed = 0;
    uint64_t v8 = SSLRead(*(SSLContextRef *)v6, &data, 8uLL, &processed);
    if (v8) {
      break;
    }
    if (processed != 8)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v19))
      {
        *(_WORD *)buf = 0;
        uint64_t v20 = "EAP AVP is invalid";
        uint64_t v21 = LogHandle;
        os_log_type_t v22 = v19;
        uint32_t v23 = 2;
        goto LABEL_25;
      }
LABEL_26:
      LODWORD(v14) = 0;
LABEL_27:
      if (v5) {
        return 1;
      }
      goto LABEL_32;
    }
    unsigned int v9 = bswap32(HIDWORD(data));
    int v10 = v9 & 0xFFFFFF;
    if ((v9 & 0xFFFFFF) <= 8)
    {
      uint64_t v24 = EAPLogGetLogHandle();
      os_log_type_t v25 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v38 = v10;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = 8;
        uint64_t v20 = "EAP AVP is too short %d <= %d";
        uint64_t v21 = v24;
        os_log_type_t v22 = v25;
        goto LABEL_24;
      }
      goto LABEL_26;
    }
    if ((v9 & 3) != 0) {
      size_t v11 = (v9 & 0xFFFFFC) - 4;
    }
    else {
      size_t v11 = (v9 & 0xFFFFFF) - 8;
    }
    if (v11 > v7)
    {
      uint64_t v26 = EAPLogGetLogHandle();
      os_log_type_t v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v38 = v11;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v7;
        uint64_t v20 = "EAP AVP is too large %d > %d";
        uint64_t v21 = v26;
        os_log_type_t v22 = v27;
LABEL_24:
        uint32_t v23 = 14;
LABEL_25:
        _os_log_impl(&dword_2106D5000, v21, v22, v20, buf, v23);
      }
      goto LABEL_26;
    }
    if (v5 & 1 | (data != 1325400064))
    {
      MEMORY[0x270FA5388]();
      uint64_t v12 = SSLRead(*(SSLContextRef *)v6, (char *)&processed - ((v11 + 15) & 0x1FFFFFFF0), v11, &processed);
      if (v12)
      {
        uint64_t v14 = v12;
        uint32_t v29 = EAPLogGetLogHandle();
        os_log_type_t v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = EAPSSLErrorString(v14);
          *(_DWORD *)buf = 136315394;
          *(void *)int v38 = v31;
          *(_WORD *)&v38[8] = 1024;
          int v39 = v14;
          _os_log_impl(&dword_2106D5000, v29, v30, "SSLRead failed, %s (%d)", buf, 0x12u);
        }
        if ((v5 & 1) == 0) {
          goto LABEL_32;
        }
        return 1;
      }
    }
    else
    {
      uint64_t v13 = SSLRead(*(SSLContextRef *)v6, a2, v11, &processed);
      if (v13)
      {
        uint64_t v14 = v13;
        int v32 = EAPLogGetLogHandle();
        os_log_type_t v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = EAPSSLErrorString(v14);
          *(_DWORD *)buf = 136315394;
          *(void *)int v38 = v34;
          *(_WORD *)&v38[8] = 1024;
          int v39 = v14;
          _os_log_impl(&dword_2106D5000, v32, v33, "SSLRead failed, %s (%d)", buf, 0x12u);
        }
        goto LABEL_32;
      }
      *a3 = processed;
      char v5 = 1;
    }
  }
  uint64_t v14 = v8;
  if (v8 == -9803) {
    goto LABEL_27;
  }
  int v15 = EAPLogGetLogHandle();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v15, v16)) {
    goto LABEL_27;
  }
  uint64_t v17 = EAPSSLErrorString(v14);
  *(_DWORD *)buf = 136315394;
  *(void *)int v38 = v17;
  *(_WORD *)&v38[8] = 1024;
  int v39 = v14;
  _os_log_impl(&dword_2106D5000, v15, v16, "SSLRead failed, %s (%d)", buf, 0x12u);
  if (v5) {
    return 1;
  }
LABEL_32:
  uint64_t result = 0;
  *(_DWORD *)(v6 + 124) = v14;
  return result;
}

char *eapttls_eap_process(uint64_t a1, unsigned __int8 *a2, char *a3, signed int *a4, int *a5, unsigned char *a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)a1;
  uint64_t v36 = 0;
  *a6 = 0;
  int v12 = *a2;
  if (v12 == 2)
  {
    int v21 = a2[4];
    uint64_t v22 = *(void *)(v11 + 296);
    if (v22) {
      LODWORD(v22) = EAPClientModulePluginEAPType(v22);
    }
    if (v22 != v21) {
      return (char *)v36;
    }
    goto LABEL_15;
  }
  if (v12 == 1)
  {
    int v13 = a2[4];
    if (!a2[4]) {
      return (char *)v36;
    }
    uint64_t v15 = *(void *)(v11 + 296);
    if (v15) {
      LODWORD(v15) = EAPClientModulePluginEAPType(v15);
    }
    if (v15 != v13)
    {
      unsigned int v16 = a2[4];
      if (v16 <= 0x1A && ((1 << v16) & 0x4000050) != 0)
      {
        eap_client_free_1(v11);
        int v17 = a2[4];
        uint64_t v18 = *(void *)a1;
        *(_DWORD *)(v18 + 472) = 0;
        *(void *)(v18 + 480) = 0;
        if (*(void *)(v18 + 296))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v20, "eap_client_init: already initialized\n", buf, 2u);
          }
          goto LABEL_15;
        }
        uint32_t v29 = EAPClientModuleLookup(v17);
        if (v29)
        {
          uint64_t v30 = (uint64_t)v29;
          my_CFRelease((const void **)(v18 + 456));
          my_CFRelease((const void **)(v18 + 464));
          *(void *)(v18 + 448) = 0;
          *(_OWORD *)(v18 + 416) = 0u;
          *(_OWORD *)(v18 + 432) = 0u;
          *(_OWORD *)(v18 + 384) = 0u;
          *(_OWORD *)(v18 + 400) = 0u;
          *(_OWORD *)(v18 + 352) = 0u;
          *(_OWORD *)(v18 + 368) = 0u;
          *(_OWORD *)(v18 + 320) = 0u;
          *(_OWORD *)(v18 + 336) = 0u;
          *(_OWORD *)(v18 + 304) = 0u;
          *(_DWORD *)(v18 + 320) = *(_DWORD *)(a1 + 16);
          *(void *)(v18 + 344) = *(void *)(a1 + 40);
          *(_DWORD *)(v18 + 352) = *(_DWORD *)(a1 + 48);
          *(void *)(v18 + 368) = *(void *)(a1 + 64);
          *(_DWORD *)(v18 + 376) = *(_DWORD *)(a1 + 72);
          *(void *)(v18 + 384) = *(void *)(a1 + 80);
          *(_DWORD *)(v18 + 488) = EAPClientModulePluginInit(v30, v18 + 304, v18 + 456, v18 + 492);
          *(void *)(v18 + 480) = EAPClientModulePluginEAPName(v30);
          *(_DWORD *)(v18 + 472) = v17;
          if (!*(_DWORD *)(v18 + 488))
          {
            *(void *)(v18 + 296) = v30;
            goto LABEL_15;
          }
        }
        if (*(_DWORD *)(v11 + 488) == 3)
        {
          *a5 = 3;
          save_last_packet_0(v11, a2);
          return (char *)v36;
        }
        os_log_type_t v33 = EAPLogGetLogHandle();
        os_log_type_t v34 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v33, v34))
        {
          int v35 = a2[4];
          *(_DWORD *)buf = 67109120;
          int v38 = v35;
          _os_log_impl(&dword_2106D5000, v33, v34, "eap_client_init type %d failed", buf, 8u);
        }
        int v32 = *(_DWORD *)(v11 + 488);
      }
      else
      {
        uint64_t v31 = *(int *)(v11 + 1528);
        if ((int)v31 <= 2)
        {
          *(_DWORD *)(v11 + 1528) = v31 + 1;
          buf[0] = inner_auth_types_1[v31];
          return EAPPacketCreate(a3, *a4, 2, a2[1], 3, buf, 1, a4);
        }
        int v32 = 5;
      }
      *a5 = v32;
      *(_DWORD *)(v11 + 104) = 2;
      return (char *)v36;
    }
  }
LABEL_15:
  if (*(void *)(v11 + 296))
  {
    my_CFRelease((const void **)(v11 + 456));
    my_CFRelease((const void **)(v11 + 464));
    uint64_t v23 = *(void *)a1;
    uint64_t v24 = *(void *)a1 + 304;
    *(void *)(v23 + 344) = *(void *)(a1 + 40);
    *(_DWORD *)(v23 + 352) = *(_DWORD *)(a1 + 48);
    *(void *)(v23 + 368) = *(void *)(a1 + 64);
    *(_DWORD *)(v23 + 376) = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(v23 + 324) = *(_DWORD *)(a1 + 20);
    *(void *)(v23 + 384) = *(void *)(a1 + 80);
    int v25 = EAPClientModulePluginProcess(*(void *)(v23 + 296), v24, (uint64_t)a2, (uint64_t)&v36, v23 + 488, v23 + 492);
    uint64_t v26 = v36;
    if (v36)
    {
      *a6 = 1;
      *a4 = EAPPacketGetLength(v26);
    }
    *(void *)(v11 + 464) = EAPClientModulePluginPublishProperties(*(void *)(v11 + 296), v11 + 304);
    if (v25 == 2)
    {
      *(_DWORD *)(v11 + 292) = 2;
      int v27 = *(_DWORD *)(v11 + 488);
      goto LABEL_24;
    }
    if (v25 == 1)
    {
      *(_DWORD *)(v11 + 292) = 1;
      return (char *)v36;
    }
    if (!v25 && *(_DWORD *)(v11 + 488) == 3)
    {
      *(void *)(v11 + 456) = EAPClientModulePluginRequireProperties(*(void *)(v11 + 296), v11 + 304);
      save_last_packet_0(v11, a2);
      int v27 = *(_DWORD *)(v11 + 488);
      *(_DWORD *)(v11 + 128) = v27;
LABEL_24:
      *a5 = v27;
    }
  }
  return (char *)v36;
}

void save_last_packet_0(uint64_t a1, const void *a2)
{
  id v2 = *(void **)(a1 + 496);
  if (v2 != a2)
  {
    unsigned int Length = EAPPacketGetLength((uint64_t)a2);
    size_t v6 = Length;
    unsigned int v7 = Length < 0x401 ? (void *)(a1 + 504) : malloc_type_malloc(Length, 0x60B4E9D9uLL);
    *(void *)(a1 + 496) = v7;
    memcpy(v7, a2, v6);
    if (v2)
    {
      if (v2 != (void *)(a1 + 504))
      {
        free(v2);
      }
    }
  }
}

uint64_t eapttls_failure_string()
{
  return 0;
}

uint64_t eapttls_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if (!*(unsigned char *)(*a1 + 149)) {
    return 0;
  }
  long long v4 = *(_OWORD *)(v3 + 150);
  long long v5 = *(_OWORD *)(v3 + 166);
  long long v6 = *(_OWORD *)(v3 + 198);
  a2[2] = *(_OWORD *)(v3 + 182);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFArrayRef eapttls_require_props(void *a1)
{
  uint64_t v1 = *a1;
  if (*(_DWORD *)(*a1 + 128) != 3) {
    return 0;
  }
  if (!*(unsigned char *)(v1 + 148))
  {
    uint64_t v3 = @"TLSUserTrustProceedCertificateChain";
    goto LABEL_13;
  }
  if (*(_DWORD *)(v1 + 132) != 5)
  {
    if (a1[8]) {
      return 0;
    }
    uint64_t v3 = @"UserPassword";
LABEL_13:
    values = v3;
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  }
  if (!*(unsigned char *)(v1 + 136)) {
    return 0;
  }
  CFArrayRef result = *(CFArrayRef *)(v1 + 456);
  if (result)
  {
    return (CFArrayRef)CFRetain(result);
  }
  return result;
}

unsigned char *eapttls_tunnel(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (*(unsigned char *)(*a1 + 137))
  {
    int v7 = *(_DWORD *)(v5 + 132);
    if (v7 == 4)
    {
      if (*(_DWORD *)(v5 + 76) != v6)
      {
        int v26 = 0;
        size_t processed = 0;
        uint64_t data = 0;
        uint64_t v15 = SSLRead(*(SSLContextRef *)v5, &data, 0xCuLL, &processed);
        if (v15)
        {
          uint64_t v16 = v15;
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v18))
          {
            uint64_t v19 = EAPSSLErrorString(v16);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v19;
            __int16 v28 = 2048;
            uint64_t v29 = (int)v16;
            _os_log_impl(&dword_2106D5000, LogHandle, v18, "SSLRead failed, %s (%ld)", buf, 0x16u);
          }
          uint64_t v14 = 0;
          *(_DWORD *)(v5 + 104) = 2;
          *(_DWORD *)(v5 + 124) = v16;
          return v14;
        }
        if (processed == 12
          && (unsigned int v20 = bswap32(HIDWORD(data)), (v20 & 0x80000000) != 0)
          && data == 436207616
          && v26 == 922812416
          && (uint64_t v21 = v20 & 0xFFFFFF, v21 <= 0x20000))
        {
          size_t v22 = v21 - 12;
          *(void *)buf = v21 - 12;
          uint64_t v23 = (unsigned __int8 *)malloc_type_malloc(v21 - 12, 0x6E36CB3FuLL);
          if (SSLRead(*(SSLContextRef *)v5, v23, v22, (size_t *)buf) || *(void *)buf < 0x2BuLL)
          {
            uint64_t v14 = 0;
            *(_DWORD *)(v5 + 104) = 2;
            if (!v23) {
              return v14;
            }
          }
          else if (*v23 == *(unsigned __int8 *)(v5 + 1588) {
                 && MSChap2AuthResponseValid((UInt8 *)a1[8], *((_DWORD *)a1 + 18), (const void *)(v5 + 1548), (const void *)(v5 + 1532), (const void *)(v5 + 1572), (char *)a1[5], v23 + 1))
          }
          {
            uint64_t v14 = EAPTLSPacketCreate(2, 21, v6, 0, 0, 0);
          }
          else
          {
            uint64_t v14 = 0;
            *(_DWORD *)(v5 + 104) = 2;
          }
          free(v23);
        }
        else
        {
          uint64_t v14 = 0;
          *(_DWORD *)(v5 + 104) = 2;
        }
        return v14;
      }
    }
    else if (v7 == 5)
    {
      if (eapttls_eap())
      {
        char v9 = *(unsigned char *)(a2 + 1);
        int v10 = *(_DWORD *)(v5 + 120);
        uint64_t v11 = (void *)(v5 + 40);
        int v12 = (_DWORD *)(v5 + 72);
LABEL_14:
        return EAPTLSPacketCreate(2, 21, v9, v10, v11, v12);
      }
      return 0;
    }
    char v9 = *(unsigned char *)(a2 + 1);
    int v10 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
    goto LABEL_14;
  }
  if (*(_DWORD *)(v5 + 76) == v6) {
    memoryBufferClear(v5 + 8);
  }
  if (!a1[8])
  {
    uint64_t v14 = 0;
    *a3 = 3;
    return v14;
  }
  return eapttls_start_inner_auth(a1, v6);
}

unsigned char *eapttls_handshake(uint64_t *a1, char a2, _DWORD *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  if (*(unsigned char *)(*a1 + 278) && !*(unsigned char *)(v6 + 148))
  {
    int v7 = eapttls_verify_server(a1, a2, a3);
    if (!*(unsigned char *)(v6 + 148)) {
      return v7;
    }
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = SSLHandshake(*(SSLContextRef *)v6);
  if (v8 != -9841) {
    goto LABEL_13;
  }
  if (!*(unsigned char *)(v6 + 278))
  {
    *(unsigned char *)(v6 + 278) = 1;
    my_CFRelease((const void **)(v6 + 280));
    EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 280));
    int v7 = eapttls_verify_server(a1, a2, a3);
    if (!*(unsigned char *)(v6 + 148)) {
      return v7;
    }
    uint64_t v8 = SSLHandshake(*(SSLContextRef *)v6);
LABEL_13:
    uint64_t v12 = v8;
    if (v8 == -9803)
    {
      if (!*(void *)(v6 + 40)) {
        return v7;
      }
    }
    else
    {
      if (!v8)
      {
        if (!*(unsigned char *)(v6 + 148))
        {
          my_CFRelease((const void **)(v6 + 280));
          EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 280));
          int v7 = eapttls_verify_server(a1, a2, a3);
          if (!*(unsigned char *)(v6 + 148))
          {
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v10 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(LogHandle, v10)) {
              return v7;
            }
            *(_WORD *)buf = 0;
            uint64_t v11 = "trust_proceed is FALSE?";
            goto LABEL_8;
          }
        }
        *(unsigned char *)(v6 + 136) = 1;
        *(unsigned char *)(v6 + 149) = 0;
        uint64_t v13 = EAPTLSComputeKeyData();
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = EAPLogGetLogHandle();
          os_log_type_t v16 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v26 = EAPSSLErrorString(v14);
            __int16 v27 = 2048;
            uint64_t v28 = (int)v14;
            _os_log_impl(&dword_2106D5000, v15, v16, "EAPTLSComputeSessionKey failed, %s (%ld)", buf, 0x16u);
          }
        }
        else
        {
          *(unsigned char *)(v6 + 149) = 1;
        }
        if (!SSLGetResumableSessionInfo()) {
          *(unsigned char *)(v6 + 289) = 0;
        }
        if (!a1[8])
        {
          *(_DWORD *)(v6 + 128) = 3;
          *a3 = 3;
          return v7;
        }
        return eapttls_start_inner_auth(a1, a2);
      }
      int v17 = EAPLogGetLogHandle();
      os_log_type_t v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v26 = EAPSSLErrorString(v12);
        __int16 v27 = 2048;
        uint64_t v28 = (int)v12;
        _os_log_impl(&dword_2106D5000, v17, v18, "SSLHandshake failed, %s (%ld)", buf, 0x16u);
      }
      *(_DWORD *)(v6 + 124) = v12;
      my_CFRelease((const void **)(v6 + 280));
      EAPSSLCopyPeerCertificates(*(SSLContext **)v6, (void *)(v6 + 280));
      *(_DWORD *)(v6 + 104) = 2;
      SSLClose(*(SSLContextRef *)v6);
      if (!*(void *)(v6 + 40))
      {
        if (v12 != -9802) {
          return v7;
        }
        char v21 = a2;
        int v19 = 0;
        size_t v22 = 0;
        unsigned int v20 = 0;
        return EAPTLSPacketCreate(2, 21, v21, v19, v22, v20);
      }
    }
    int v19 = *(_DWORD *)(v6 + 120);
    unsigned int v20 = (_DWORD *)(v6 + 72);
    char v21 = a2;
    size_t v22 = (void *)(v6 + 40);
    return EAPTLSPacketCreate(2, 21, v21, v19, v22, v20);
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v10))
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "AuthCompleted again?";
LABEL_8:
    _os_log_impl(&dword_2106D5000, LogHandle, v10, v11, buf, 2u);
  }
  return v7;
}

uint64_t EAPTLSLengthIncludedPacketGetMessageLength(uint64_t a1)
{
  return bswap32(*(_DWORD *)(a1 + 6));
}

uint64_t EAPTLSLengthIncludedPacketSetMessageLength(uint64_t result, unsigned int a2)
{
  *(_DWORD *)(result + 6) = bswap32(a2);
  return result;
}

double memoryBufferInit(_OWORD *a1)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *memoryBufferAllocate(uint64_t a1, size_t size)
{
  double result = malloc_type_malloc(size, 0x645E8704uLL);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = size;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  return result;
}

uint64_t memoryBufferIsComplete(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

BOOL memoryBufferAddData(uint64_t a1, const void *a2, size_t a3)
{
  size_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  size_t v5 = v3 + a3;
  if (v3 + a3 <= v4)
  {
    memmove((void *)(*(void *)a1 + v3), a2, a3);
    uint64_t v8 = *(void *)(a1 + 8);
    size_t v9 = *(void *)(a1 + 16) + a3;
    *(void *)(a1 + 16) = v9;
    if (v9 == v8)
    {
      *(void *)(a1 + 16) = 0;
      *(unsigned char *)(a1 + 24) = 1;
    }
  }
  return v5 <= v4;
}

unsigned char *memoryIOSetDebug(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

__CFString *EAPTLSPacketCopyDescription(unsigned __int8 *a1, unsigned char *a2)
{
  uint64_t Length = EAPPacketGetLength((uint64_t)a1);
  *a2 = 0;
  if (*a1 - 1 > 1) {
    return 0;
  }
  uint64_t v5 = Length;
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  if (v5 <= 5)
  {
    CFStringAppendFormat(Mutable, 0, @"EAPTLSPacket header truncated %d < %d\n", v5, 6);
    return Mutable;
  }
  int v7 = EAPTypeStr(a1[4]);
  if (*a1 == 1) {
    uint64_t v8 = "Request";
  }
  else {
    uint64_t v8 = "Response";
  }
  size_t v9 = " [";
  if (!a1[5]) {
    size_t v9 = (const char *)&unk_21070AD61;
  }
  CFStringAppendFormat(Mutable, 0, @"%s %s: Identifier %d Length %d Flags 0x%x%s", v7, v8, a1[1], v5, a1[5], v9);
  int v10 = a1[5];
  if ((v10 & 0x20) != 0)
  {
    CFStringAppendFormat(Mutable, 0, @" start");
    int v10 = a1[5];
  }
  if ((v10 & 0x80) != 0)
  {
    if (v5 <= 9)
    {
      CFStringAppendFormat(Mutable, 0, @"\nEAPTLSLengthIncludedPacket header truncated %d < %d\n", v5, 10);
      return Mutable;
    }
    uint64_t v11 = (uint64_t)(a1 + 10);
    uint64_t v12 = (v5 - 10);
    uint64_t v13 = bswap32(*(_DWORD *)(a1 + 6));
    CFStringAppendFormat(Mutable, 0, @" length=%u", v13);
    int v10 = a1[5];
    if ((v10 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v11 = (uint64_t)(a1 + 6);
  uint64_t v12 = (v5 - 6);
  uint64_t v13 = v12;
  if ((v10 & 0x40) != 0)
  {
LABEL_14:
    CFStringAppendFormat(Mutable, 0, @" more");
    int v10 = a1[5];
  }
LABEL_15:
  if (v10) {
    uint64_t v14 = " ]";
  }
  else {
    uint64_t v14 = (const char *)&unk_21070AD61;
  }
  CFStringAppendFormat(Mutable, 0, @"%s Data Length %d\n", v14, v12);
  if (v13 <= 0x20000)
  {
    print_data_cfstr(Mutable, v11, v12);
    *a2 = 1;
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, @"rejecting packet to avoid DOS attack %u > %d\n", v13, 0x20000);
  }
  return Mutable;
}

uint64_t EAPTLSSecTrustEvaluate(__SecTrust *a1, SecTrustResultType *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  BOOL v4 = SecTrustEvaluateWithError(a1, &error);
  uint64_t TrustResult = SecTrustGetTrustResult(a1, a2);
  if (!v4 && error)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v13 = error;
      _os_log_impl(&dword_2106D5000, LogHandle, v7, "SecTrustEvaluateWithError failed, %@\n", buf, 0xCu);
    }
    CFRelease(error);
  }
  if (TrustResult)
  {
    uint64_t v8 = EAPLogGetLogHandle();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = TrustResult;
      _os_log_impl(&dword_2106D5000, v8, v9, "SecTrustGetTrustResult failed, %d\n", buf, 8u);
    }
  }
  return TrustResult;
}

uint64_t EAPTLSCopyIdentityTrustChain(void *a1, CFDictionaryRef theDict, __CFArray **a3)
{
  if (a1)
  {
    if (theDict)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"TLSIdentityHandle");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        CFArrayRef v8 = (const __CFArray *)CFDictionaryGetValue(Value, @"TLSClientIdentityTrustChain");
        CFTypeID v9 = CFArrayGetTypeID();
        if (v8 && CFGetTypeID(v8) == v9)
        {
          return EAPSecIdentityCreateTrustChainWithPersistentCertificateRefs(a1, v8, a3);
        }
LABEL_15:
        *a3 = 0;
        return 4294967246;
      }
      CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(theDict, @"TLSClientIdentityTrustChainCertificates");
      CFTypeID v13 = CFArrayGetTypeID();
      if (v12 && CFGetTypeID(v12) == v13)
      {
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
        if (!Mutable) {
          return 4294967188;
        }
        uint64_t v15 = Mutable;
        CFArrayAppendValue(Mutable, a1);
        v17.CFIndex length = CFArrayGetCount(v12);
        v17.CFIndex location = 0;
        CFArrayAppendArray(v15, v12, v17);
        uint64_t result = 0;
        *a3 = v15;
        return result;
      }
    }
    return EAPSecIdentityCreateTrustChain((__SecIdentity *)a1, a3);
  }
  else
  {
    if (!theDict) {
      goto LABEL_15;
    }
    CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"TLSIdentityHandle");
    if (!v11) {
      goto LABEL_15;
    }
    return EAPSecIdentityHandleCreateSecIdentityTrustChain(v11, a3);
  }
}

void *EAPTLSSessionCreateContext(const __CFDictionary *a1, int a2, const void *a3, const __CFArray *a4, unsigned int *a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unsigned int v33 = 0;
  CFMutableArrayRef v32 = 0;
  int v10 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  *int v10 = 0;
  v10[1] = 0;
  if (!EAPOLControlPrefsGetUseBoringSSL())
  {
    unsigned int v20 = EAPTLSMemIOContextCreate(a1, 0, a3, 0, (OSStatus *)&v33);
    if (!v20 || v33)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v27 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v27))
      {
        uint64_t v28 = EAPSSLErrorString(v33);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&unsigned char buf[14] = (int)v33;
        _os_log_impl(&dword_2106D5000, LogHandle, v27, "EAPTLSMemIOContextCreate failed, %s (%ld)", buf, 0x16u);
      }
      if (!v20) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!a4 || CFArrayGetCount(a4) < 1 || (unsigned int v33 = SSLSetCertificate(v20, a4)) == 0)
      {
        *int v10 = v20;
        os_log_type_t v16 = EAPLogGetLogHandle();
        os_log_type_t v17 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v16, v17)) {
          goto LABEL_28;
        }
        *(_WORD *)buf = 0;
        os_log_type_t v18 = "TLS(SecureTransport) session started";
        int v19 = buf;
        goto LABEL_27;
      }
      char v21 = EAPLogGetLogHandle();
      os_log_type_t v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = EAPSSLErrorString(v33);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&unsigned char buf[14] = (int)v33;
        _os_log_impl(&dword_2106D5000, v21, v22, "SSLSetCertificate failed, %s (%ld)", buf, 0x16u);
      }
    }
    CFRelease(v20);
    goto LABEL_28;
  }
  long long v35 = 0u;
  memset(buf, 0, sizeof(buf));
  int v31 = 0;
  EAPBoringSSLUtilGetPreferredTLSVersions(a1, (__int16 *)&v31 + 1, (__int16 *)&v31);
  *(_WORD *)&uint8_t buf[16] = HIWORD(v31);
  *(_WORD *)&buf[18] = v31;
  *(void *)&unsigned char buf[24] = EAPTLSSessionMemoryIORead;
  *(void *)&long long v35 = EAPTLSSessionMemoryIOWrite;
  DWORD2(v35) = a2;
  uint64_t v36 = a3;
  if (a4 && CFArrayGetCount(a4) >= 1)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a4, 0);
    if (isA_SecIdentity(ValueAtIndex)) {
      *(void *)buf = ValueAtIndex;
    }
    if (CFArrayGetCount(a4) >= 2)
    {
      CFIndex Count = CFArrayGetCount(a4);
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, Count, a4);
      CFMutableArrayRef v32 = MutableCopy;
      CFArrayRemoveValueAtIndex(MutableCopy, 0);
      *(void *)&uint8_t buf[8] = MutableCopy;
    }
  }
  uint64_t v14 = EAPBoringSSLSessionContextCreate((uint64_t)buf, 0);
  my_CFRelease((const void **)&v32);
  if (v14)
  {
    v10[1] = v14;
    EAPBoringSSLSessionStart(v14, v15);
    os_log_type_t v16 = EAPLogGetLogHandle();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_28;
    }
    *(_WORD *)uint64_t v30 = 0;
    os_log_type_t v18 = "TLS(boringssl) session started";
    int v19 = v30;
LABEL_27:
    _os_log_impl(&dword_2106D5000, v16, v17, v18, v19, 2u);
    goto LABEL_28;
  }
  uint64_t v24 = EAPLogGetLogHandle();
  os_log_type_t v25 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v24, v25))
  {
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_2106D5000, v24, v25, "EAPBoringSSLSessionContextCreate failed", v30, 2u);
  }
  unsigned int v33 = -67671;
LABEL_28:
  if (a5) {
    *a5 = v33;
  }
  return v10;
}

uint64_t EAPTLSSessionMemoryIORead(uint64_t a1, void *a2, size_t *a3)
{
  if (memoryBufferIsComplete(*(void *)(a1 + 8)))
  {
    if (EAPSSLMemoryIORead(a1, a2, a3) == -9803) {
      return 4294967246;
    }
  }
  else
  {
    *a3 = 0;
  }
  return 0;
}

void EAPTLSSessionFreeContext(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 8);
    if (v2)
    {
      EAPBoringSSLSessionContextFree(v2);
    }
    else if (*(void *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
    }
    free((void *)a1);
  }
}

SSLContext *EAPTLSSessionClose(uint64_t a1, const char *a2)
{
  if (!a1) {
    return (SSLContext *)4294967246;
  }
  if (*(void *)(a1 + 8))
  {
    EAPBoringSSLSessionStop(*(void **)(a1 + 8), a2);
  }
  else
  {
    uint64_t result = *(SSLContext **)a1;
    if (!result) {
      return result;
    }
    SSLClose(result);
  }
  return 0;
}

uint64_t EAPTLSSessionSetPeerID(uint64_t *a1, const void *a2, size_t a3)
{
  uint64_t result = 4294967246;
  if (a1 && a2 && a3)
  {
    if (a1[1])
    {
      return 0;
    }
    else
    {
      uint64_t result = *a1;
      if (*a1) {
        return SSLSetPeerID((SSLContextRef)result, a2, a3);
      }
    }
  }
  return result;
}

uint64_t EAPTLSSessionGetState(uint64_t result, SSLSessionState *state)
{
  if (!state) {
    return 4294967246;
  }
  *SSLSessionState state = kSSLIdle;
  if (result)
  {
    uint64_t v3 = *(void **)(result + 8);
    if (v3)
    {
      unsigned int v5 = 0;
      uint64_t result = EAPBoringSSLSessionGetCurrentState(v3, &v5);
      SSLSessionState v4 = v5;
      if (v5 >= 3) {
        SSLSessionState v4 = kSSLClosed;
      }
      *SSLSessionState state = v4;
    }
    else
    {
      uint64_t result = *(void *)result;
      if (result)
      {
        return SSLGetSessionState((SSLContextRef)result, state);
      }
    }
  }
  return result;
}

uint64_t EAPTLSSessionHandshake(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 4294967246;
  }
  if (*(void *)(a1 + 8))
  {
    uint64_t v1 = EAPBoringSSLSessionHandshake(*(void **)(a1 + 8));
LABEL_7:
    uint64_t v2 = v1;
    goto LABEL_8;
  }
  uint64_t v3 = *(SSLContext **)a1;
  if (v3)
  {
    uint64_t v1 = SSLHandshake(v3);
    goto LABEL_7;
  }
  uint64_t v2 = 0;
LABEL_8:
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v5))
  {
    int v7 = 136315394;
    CFArrayRef v8 = EAPSecurityErrorString(v2);
    __int16 v9 = 1024;
    int v10 = v2;
    _os_log_impl(&dword_2106D5000, LogHandle, v5, "received handshake status [%s]:[%d]", (uint8_t *)&v7, 0x12u);
  }
  return v2;
}

void **EAPTLSSessionCopyPeerCertificates(void **result, void *a2)
{
  if (result && a2)
  {
    *a2 = 0;
    if (result[1])
    {
      return (void **)EAPBoringSSLSessionCopyServerCertificates(result[1], a2);
    }
    else
    {
      uint64_t result = (void **)*result;
      if (result) {
        return (void **)EAPSSLCopyPeerCertificates((SSLContext *)result, a2);
      }
    }
  }
  return result;
}

void *EAPTLSSessionGetSecTrust(uint64_t a1, const char *a2)
{
  uint64_t result = *(void **)(a1 + 8);
  if (result) {
    return EAPBoringSSLSessionGetSecTrust(result, a2);
  }
  return result;
}

BOOL EAPTLSSessionIsRevocationStatusCheckRequired(BOOL result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if (EAPOLControlPrefsGetRevocationCheck() != 1) {
      return 0;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v3, "revocation check preference is enabled", buf, 2u);
    }
    SSLSessionState v4 = *(void **)(v1 + 8);
    if (!v4) {
      return 0;
    }
    unsigned __int16 v8 = 0;
    int NegotiatedTLSVersion = EAPBoringSSLSessionGetNegotiatedTLSVersion(v4, &v8);
    uint64_t v6 = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v8;
      _os_log_impl(&dword_2106D5000, v6, v7, "negotiated TLS protocol version is [%04X]", buf, 8u);
    }
    return !NegotiatedTLSVersion && v8 == 772;
  }
  return result;
}

uint64_t EAPTLSSessionComputeSessionKey(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  if (!a1) {
    return 4294967246;
  }
  if (*(void *)(a1 + 8)) {
    return EAPBoringSSLSessionComputeKeyData(*(void **)(a1 + 8), a4, a5);
  }
  if (*(void *)a1) {
    return EAPTLSComputeKeyData();
  }
  else {
    return 4294967246;
  }
}

void EAPTLSSessionGetSessionResumed(uint64_t a1, BOOL *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v9 = 0;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 8))
    {
      uint64_t SessionResumed = EAPBoringSSLSessionGetSessionResumed(*(void **)(a1 + 8), &v9);
    }
    else
    {
      if (!*(void *)a1)
      {
        BOOL v8 = 0;
        goto LABEL_12;
      }
      uint64_t SessionResumed = SSLGetResumableSessionInfo();
    }
    uint64_t v4 = SessionResumed;
    if (SessionResumed)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v6))
      {
        uint64_t v7 = EAPSSLErrorString(v4);
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = (int)v4;
        _os_log_impl(&dword_2106D5000, LogHandle, v6, "EAP-TLS session failed to get session resumed info, %s (%ld)", buf, 0x16u);
      }
      return;
    }
    BOOL v8 = v9 != 0;
LABEL_12:
    *a2 = v8;
  }
}

void *EAPTLSSessionGetNegotiatedTLSProtocolVersion(void *result)
{
  if (result)
  {
    if (*result) {
      return 0;
    }
    uint64_t result = (void *)result[1];
    if (result)
    {
      __int16 v1 = 0;
      if (!EAPBoringSSLSessionGetNegotiatedTLSVersion(result, &v1) && (unsigned __int16)(v1 - 769) <= 3u) {
        return (void *)*((void *)&off_264133F08 + (__int16)(v1 - 769));
      }
      return 0;
    }
  }
  return result;
}

SSLContext *EAPTLSSessionGetNegotiatedCipher(SSLContext *result, SSLCipherSuite *a2)
{
  if (result && a2)
  {
    *a2 = 0;
    uint64_t result = *(SSLContext **)result;
    if (result) {
      return (SSLContext *)SSLGetNegotiatedCipher(result, a2);
    }
  }
  return result;
}

uint64_t eapsim_init(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  int v2 = SIMStaticInitFromProperties((const void **)&v37, *(const __CFDictionary **)(a1 + 80));
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 80);
  if (!v2)
  {
    CFStringRef v5 = (const __CFString *)SIMCopyIMSI(v3);
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    BOOL v9 = os_log_type_enabled(LogHandle, v8);
    if (!v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, LogHandle, v8, "EAP-SIM: no SIM available", buf, 2u);
      }
      return 16;
    }
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v8, "EAP-SIM: SIM found", buf, 2u);
    }
    int v6 = 0;
LABEL_8:
    CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), @"TLSTrustExceptionsID");
    uint64_t v11 = malloc_type_malloc(0x718uLL, 0x1070040CC9F52CAuLL);
    if (!v11)
    {
      CFRelease(v5);
      SIMStaticInitFromProperties((const void **)&v37, 0);
      return 2;
    }
    uint64_t v12 = (uint64_t)v11;
    bzero(v11, 0x718uLL);
    *(_DWORD *)(v12 + 16) = -1;
    identity_os_log_type_t type = S_get_identity_type(*(const __CFDictionary **)(a1 + 80));
    *(void *)(v12 + 264) = EAPSIMAKAPersistentStateCreate(18, 20, v5, identity_type, Value);
    CFRelease(v5);
    long long v14 = v38;
    *(_OWORD *)(v12 + 40) = v37;
    *(_OWORD *)(v12 + 56) = v14;
    *(void *)(v12 + 72) = v39;
    int plist_int = S_get_plist_int(*(const __CFDictionary **)(a1 + 80), @"EAPSIMNumberOfRANDs", 3);
    *(_DWORD *)(v12 + 24) = plist_int;
    if ((plist_int & 0xFFFFFFFE) != 2)
    {
      os_log_type_t v16 = EAPLogGetLogHandle();
      os_log_type_t v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        int v18 = *(_DWORD *)(v12 + 24);
        *(_DWORD *)buf = 67109120;
        int v41 = v18;
        _os_log_impl(&dword_2106D5000, v16, v17, "eapsim: EAPSIMNumberOfRands %d is invalid, using 3 instead", buf, 8u);
      }
      *(_DWORD *)(v12 + 24) = 3;
    }
    if (EAPSIMAKAPersistentStateGetReauthID(*(void *)(v12 + 264)))
    {
      MasterKey = (long long *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(v12 + 264));
      fips186_2prf(MasterKey, v12 + 80);
      *(unsigned char *)(v12 + 240) = 1;
      if (EAPSIMAKAPersistentStateGetReauthIDUsed(*(void *)(v12 + 264))) {
        EAPSIMAKAPersistentStateSetReauthIDUsed(*(void *)(v12 + 264), 0);
      }
    }
    uint64_t v20 = *(void *)(v12 + 264);
    if (v20) {
      BOOL v21 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v20);
    }
    else {
      BOOL v21 = 0;
    }
    unsigned __int8 v36 = 0;
    if (*(void *)(a1 + 56)) {
      goto LABEL_26;
    }
    char v35 = 0;
    os_log_type_t v25 = EAPSIMAKAInitEncryptedIdentityInfo(18, *(CFDictionaryRef *)(a1 + 80), v6, &v36, &v35);
    *(void *)(v12 + 280) = v25;
    int v26 = v36;
    if (v36 != 1 || v25)
    {
LABEL_36:
      if (v26 == 1)
      {
        uint64_t v30 = *(void **)(v12 + 280);
        if (v30)
        {
          if (*v30) {
            char v31 = v21;
          }
          else {
            char v31 = 1;
          }
          if ((v31 & 1) == 0)
          {
            *(unsigned char *)(v12 + 296) = 1;
            CFMutableArrayRef v32 = EAPLogGetLogHandle();
            os_log_type_t v33 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2106D5000, v32, v33, "EAP-SIM: using out-of-band pseudonym as an identity", buf, 2u);
            }
          }
        }
      }
LABEL_26:
      uint64_t result = 0;
      *(void *)uint64_t v12 = a1;
      *(void *)a1 = v12;
      return result;
    }
    BOOL v27 = v35 == 1 && v21;
    uint64_t v28 = EAPLogGetLogHandle();
    if (v27)
    {
      os_log_type_t v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v28, v29, "EAP-SIM: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
      }
      int v26 = v36;
      goto LABEL_36;
    }
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v28, v34))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v28, v34, "EAP-SIM: failed to get privacy protected identity", buf, 2u);
    }
    EAPSIMContextFree(v12);
    return 16;
  }
  CFStringRef v4 = (const __CFString *)copy_static_imsi(v3);
  if (v4)
  {
    CFStringRef v5 = v4;
    int v6 = 1;
    goto LABEL_8;
  }
  uint64_t v23 = EAPLogGetLogHandle();
  os_log_type_t v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v23, v24, "eapsim: static triplets specified but IMSI missing", buf, 2u);
  }
  SIMStaticInitFromProperties((const void **)&v37, 0);
  return 4;
}

void eapsim_free(uint64_t *a1)
{
  *a1 = 0;
}

uint64_t eapsim_process(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, int *a4, _DWORD *a5)
{
  uint64_t v5 = *a1;
  *a4 = 0;
  *a5 = 0;
  int v6 = *a2;
  switch(v6)
  {
    case 4:
      *(_DWORD *)(v5 + 16) = -1;
      *(_DWORD *)(v5 + 8) = 2;
      *a4 = 1;
      break;
    case 3:
      *(_DWORD *)(v5 + 16) = -1;
      if (*(_DWORD *)(v5 + 12) == 4)
      {
        *(_DWORD *)(v5 + 8) = 1;
        EAPSIMAKAPersistentStateSave(*(void *)(v5 + 264), *(unsigned __int8 *)(v5 + 240));
        if (*(unsigned char *)(v5 + 296))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v8 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v8))
          {
            *(_WORD *)int v10 = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v8, "eapsim: requesting out-of-band psuedonym refresh", v10, 2u);
          }
          SIMReportDecryptionError(0);
        }
      }
      break;
    case 1:
      *a3 = eapsim_request(v5, a2, a4, a5);
      break;
  }
  return *(unsigned int *)(v5 + 8);
}

uint64_t eapsim_failure_string()
{
  return 0;
}

uint64_t eapsim_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(unsigned char *)(v2 + 240)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 112;
}

uint64_t eapsim_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(unsigned char *)(v2 + 240)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 144;
}

uint64_t eapsim_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if (!*(unsigned char *)(*a1 + 240) || *(_DWORD *)(v3 + 12) != 4) {
    return 0;
  }
  long long v4 = *(_OWORD *)(v3 + 112);
  long long v5 = *(_OWORD *)(v3 + 128);
  long long v6 = *(_OWORD *)(v3 + 160);
  a2[2] = *(_OWORD *)(v3 + 144);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFDictionaryRef eapsim_publish_props(uint64_t a1)
{
  keys = @"EAPAKASIMNotificationActionInfo";
  if (*(void *)(*(void *)a1 + 288)) {
    return CFDictionaryCreate(0, (const void **)&keys, (const void **)(*(void *)a1 + 288), 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  else {
    return 0;
  }
}

void *eapsim_user_name_copy(const __CFDictionary *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  __int16 v22 = 0;
  CFStringRef v2 = (const __CFString *)copy_static_imsi(a1);
  CFStringRef v23 = v2;
  CFStringRef v3 = v2;
  if (!v2)
  {
    CFStringRef v3 = (const __CFString *)SIMCopyIMSI(a1);
    CFStringRef v23 = v3;
    if (!v3)
    {
LABEL_29:
      long long v4 = 0;
      os_log_type_t v8 = 0;
      goto LABEL_30;
    }
  }
  long long v4 = (const void **)EAPSIMAKAInitEncryptedIdentityInfo(18, a1, v2 != 0, (unsigned char *)&v22 + 1, (char *)&v22);
  identity_os_log_type_t type = S_get_identity_type(a1);
  long long v6 = EAPSIMAKAPersistentStateCreate(18, 20, v3, identity_type, 0);
  my_CFRelease((const void **)&v23);
  if (v6)
  {
    BOOL v7 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v6);
    if (v4 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v6))
    {
      if (*v4)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v14 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v14))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, LogHandle, v14, "EAP-SIM: using out-of-band pseudonym as an identity", buf, 2u);
        }
        uint64_t v15 = *v4;
      }
      else
      {
        uint64_t v15 = v4[1];
      }
      os_log_type_t v8 = (void *)CFRetain(v15);
      goto LABEL_19;
    }
    char v21 = 0;
    os_log_type_t v8 = (void *)sim_identity_create((uint64_t)v6, a1, identity_type, 1, &v21, 0);
    if (v21)
    {
      int v9 = 1;
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v6, 1);
      int v10 = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        SSuint64_t ID = EAPSIMAKAPersistentStateGetSSID((uint64_t)v6);
        *(_DWORD *)buf = 138412546;
        os_log_type_t v25 = v8;
        __int16 v26 = 2112;
        uint64_t v27 = SSID;
        _os_log_impl(&dword_2106D5000, v10, v11, "EAP-SIM is using fast re-auth id %@ for ssid : %@", buf, 0x16u);
      }
    }
    else
    {
      if (!EAPSIMAKAPersistentStateGetReauthIDUsed((uint64_t)v6))
      {
LABEL_19:
        EAPSIMAKAPersistentStateRelease((uint64_t)v6);
        goto LABEL_20;
      }
      EAPSIMAKAPersistentStateSetReauthID((uint64_t)v6, 0);
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v6, 0);
      int v9 = 0;
    }
    EAPSIMAKAPersistentStateSave((uint64_t)v6, v9);
    goto LABEL_19;
  }
  BOOL v7 = 0;
  os_log_type_t v8 = 0;
LABEL_20:
  if (HIBYTE(v22) != 1 || v4) {
    goto LABEL_30;
  }
  int v16 = v22;
  os_log_type_t v17 = EAPLogGetLogHandle();
  if (!v7 || v16 != 1)
  {
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v17, v19, "EAP-SIM: failed to get privacy protected identity", buf, 2u);
    }
    goto LABEL_29;
  }
  os_log_type_t v18 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v17, v18))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v17, v18, "EAP-SIM: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
  }
  long long v4 = 0;
LABEL_30:
  EAPSIMAKAClearEncryptedIdentityInfo(v4);
  return v8;
}

CFStringRef eapsim_copy_identity(void *a1)
{
  CFStringRef v2 = (void *)*a1;
  CFStringRef v3 = *(const void **)(*a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  v2[4] = 0;
  *(void *)((char *)v2 + 12) = 0xFFFFFFFF00000000;
  if (v2[35] && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v2[33]))
  {
    CFStringRef result = *(CFStringRef *)(v2[35] + 8);
    if (result)
    {
      return (CFStringRef)CFRetain(result);
    }
  }
  else
  {
    uint64_t v4 = v2[33];
    CFDictionaryRef v5 = (const __CFDictionary *)a1[10];
    return sim_identity_create(v4, v5, 13, 1, 0, 0);
  }
  return result;
}

uint64_t SIMStaticInitFromProperties(const void **a1, const __CFDictionary *a2)
{
  my_CFRelease(a1);
  my_CFRelease(a1 + 1);
  my_CFRelease(a1 + 2);
  uint64_t v4 = a1 + 3;
  my_CFRelease(a1 + 3);
  CFDictionaryRef v5 = a1 + 4;
  my_CFRelease(a1 + 4);
  if (!a2) {
    return 0;
  }
  CFArrayRef v6 = (const __CFArray *)copy_data_array(a2, @"EAPSIMKcList", 8u);
  *(void *)buf = v6;
  CFTypeRef v7 = copy_data_array(a2, @"EAPSIMSRESList", 4u);
  os_log_type_t v18 = v7;
  CFTypeRef v8 = copy_data_array(a2, @"EAPSIMSRANDList", 0x10u);
  os_log_type_t v19 = v8;
  if (v6)
  {
    if (v7)
    {
      CFArrayRef v9 = (const __CFArray *)v8;
      CFIndex Count = CFArrayGetCount(v6);
      if (Count == CFArrayGetCount((CFArrayRef)v7) && (!v9 || Count == CFArrayGetCount(v9)))
      {
        *a1 = v6;
        a1[1] = v7;
        uint64_t result = 1;
        a1[2] = v9;
        return result;
      }
    }
  }
  my_CFRelease((const void **)buf);
  my_CFRelease(&v18);
  my_CFRelease(&v19);
  CFDictionaryRef Value = CFDictionaryGetValue(a2, @"EAPSIMAKAKi");
  uint64_t v13 = CFDictionaryGetValue(a2, @"EAPSIMAKAOPc");
  CFTypeID TypeID = CFDataGetTypeID();
  if (!Value) {
    return 0;
  }
  if (CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  CFTypeID v15 = CFDataGetTypeID();
  if (!v13
    || CFGetTypeID(v13) != v15
    || CFDataGetLength((CFDataRef)Value) != 16
    || CFDataGetLength((CFDataRef)v13) != 16)
  {
    return 0;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v17 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v17))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, LogHandle, v17, "eapsim: using MILENAGE based soft-sim.", buf, 2u);
  }
  *uint64_t v4 = Value;
  *CFDictionaryRef v5 = v13;
  CFRetain(Value);
  CFRetain(v13);
  return 1;
}

CFTypeRef copy_static_imsi(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(a1, @"EAPSIMIMSI");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(a1, @"EAPSIMAKAIMSI");
    CFTypeID v4 = CFStringGetTypeID();
    if (!Value || CFGetTypeID(Value) != v4) {
      return 0;
    }
  }
  return CFRetain(Value);
}

uint64_t S_get_identity_type(const __CFDictionary *a1)
{
  if (a1)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"EAPSIMAKAIdentityType");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        a1 = Value;
      }
      else {
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return EAPSIMAKAIdentityTypeGetAttributeType(a1);
}

uint64_t S_get_plist_int(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr)) {
      return valuePtr;
    }
    else {
      return v3;
    }
  }
  return v3;
}

void EAPSIMContextFree(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 304);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 304) = 0;
    *(_DWORD *)(a1 + 312) = 0;
  }
  SIMStaticInitFromProperties((const void **)(a1 + 40), 0);
  EAPSIMAKAPersistentStateRelease(*(void *)(a1 + 264));
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 32) = 0;
  EAPSIMAKAClearEncryptedIdentityInfo(*(const void ***)(a1 + 280));
  my_CFRelease((const void **)(a1 + 288));
  bzero((void *)a1, 0x718uLL);
  free((void *)a1);
}

CFTypeRef copy_data_array(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!Value) {
    return 0;
  }
  if (CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  if (!Count) {
    return 0;
  }
  CFIndex v7 = Count;
  if (Count >= 1)
  {
    CFIndex v8 = 0;
    uint64_t v9 = a3;
    do
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, v8);
      CFTypeID v11 = CFDataGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v11 || CFDataGetLength((CFDataRef)ValueAtIndex) != v9) {
        return 0;
      }
    }
    while (v7 != ++v8);
  }
  return CFRetain(Value);
}

void EAPSIMContextSetVersionList(uint64_t a1, void *__s2, int a3)
{
  if (__s2)
  {
    int v4 = a3;
    size_t v6 = (2 * a3);
    CFIndex v7 = *(void **)(a1 + 304);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 312) != a3) {
        goto LABEL_6;
      }
      if (!memcmp(v7, __s2, (2 * a3))) {
        return;
      }
      CFIndex v7 = *(void **)(a1 + 304);
      if (v7) {
LABEL_6:
      }
        free(v7);
    }
    CFIndex v8 = malloc_type_malloc(v6, 0xAD6792FuLL);
    *(void *)(a1 + 304) = v8;
    memmove(v8, __s2, v6);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 304);
    if (!v9) {
      return;
    }
    free(v9);
    int v4 = 0;
    *(void *)(a1 + 304) = 0;
  }
  *(_DWORD *)(a1 + 312) = v4;
}

void EAPSIMContextSetLastIdentity(uint64_t a1, CFTypeRef cf)
{
  int v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 32) = 0;
  if (cf)
  {
    if (*(void *)(a1 + 280)
      && (!EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 264)) || *(unsigned char *)(a1 + 28) == 10))
    {
      CFStringRef v5 = **(const __CFString ***)(a1 + 280);
      if (!v5)
      {
        CFStringRef v7 = sim_identity_create(*(void *)(a1 + 264), *(CFDictionaryRef *)(*(void *)a1 + 80), 10, 0, 0, 0);
        *(void *)(a1 + 32) = CFStringCreateExternalRepresentation(0, v7, 0x8000100u, 0);
        my_CFRelease((const void **)&v7);
        return;
      }
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, 0x8000100u, 0);
    }
    else
    {
      ExternalRepresentation = (void *)CFRetain(cf);
    }
    *(void *)(a1 + 32) = ExternalRepresentation;
  }
}

CFStringRef sim_identity_create(uint64_t a1, CFDictionaryRef theDict, int a3, int a4, unsigned char *a5, _DWORD *a6)
{
  if (a5) {
    *a5 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"EAPSIMAKAIMSI") | a4) {
    BOOL v11 = theDict == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || ((Value = CFDictionaryGetValue(theDict, @"EAPSIMRealm"), CFTypeID TypeID = CFStringGetTypeID(), !Value)
     || CFGetTypeID(Value) != TypeID)
    && ((Value = CFDictionaryGetValue(theDict, @"EAPSIMAKARealm"), CFTypeID v14 = CFStringGetTypeID(), !Value)
     || CFGetTypeID(Value) != v14)
    || (CFTypeID v15 = CFRetain(Value), (v35 = v15) == 0))
  {
    CFTypeID v15 = SIMCopyRealm(theDict);
    char v35 = v15;
  }
  if (a5) {
    *a5 = 0;
  }
  if (!a1)
  {
    CFStringRef v22 = 0;
    goto LABEL_54;
  }
  CFDateRef otherDate = 0;
  uint64_t Pseudonym = EAPSIMAKAPersistentStateGetPseudonym(a1, &otherDate);
  os_log_type_t v17 = (const void *)Pseudonym;
  if (a3 == 17 || a3 == 13)
  {
    Reauthuint64_t ID = EAPSIMAKAPersistentStateGetReauthID(a1);
    int ReauthIDUsed = EAPSIMAKAPersistentStateGetReauthIDUsed(a1);
    if (a3 == 13 && ReauthID && !ReauthIDUsed)
    {
      if (a5) {
        *a5 = 1;
      }
      uint64_t v20 = (const void *)ReauthID;
      goto LABEL_24;
    }
    if (v17)
    {
      if (v15)
      {
        CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%@@%@", v17, v15);
LABEL_44:
        CFStringRef v22 = v21;
        if (v21) {
          goto LABEL_54;
        }
        goto LABEL_45;
      }
      uint64_t v20 = v17;
LABEL_24:
      CFStringRef v21 = (const __CFString *)CFRetain(v20);
      goto LABEL_44;
    }
  }
  else
  {
    CFStringRef v23 = 0;
    if (a3 != 10) {
      goto LABEL_46;
    }
    if (!Pseudonym) {
      goto LABEL_46;
    }
    CFStringRef v23 = CFDictionaryGetValue(theDict, @"EAPSIMAKAConservativePeer");
    CFTypeID v24 = CFBooleanGetTypeID();
    if (!v23) {
      goto LABEL_46;
    }
    if (CFGetTypeID(v23) == v24 && CFBooleanGetValue((CFBooleanRef)v23))
    {
      int plist_int = S_get_plist_int(theDict, @"EAPSIMAKAPseudonymIdentityLifetimeHours", 24);
      int v26 = plist_int <= 24 ? 24 : plist_int;
      if (otherDate)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFDateRef v28 = CFDateCreate(0, Current);
        CFStringRef v23 = v28;
        if (v28 && CFDateGetTimeIntervalSinceDate(v28, otherDate) < (double)(3600 * v26))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v30 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v30))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v30, "EAP Peer is in conservative mode and pseudonym is not expired yet.", buf, 2u);
          }
          CFStringRef v22 = 0;
          if (a6) {
            *a6 = 17;
          }
          goto LABEL_53;
        }
        goto LABEL_46;
      }
    }
  }
LABEL_45:
  CFStringRef v23 = 0;
LABEL_46:
  uint64_t IMSI = EAPSIMAKAPersistentStateGetIMSI(a1);
  if (v15) {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"1%@@%@", IMSI, v15);
  }
  else {
    CFStringRef v32 = CFStringCreateWithFormat(0, 0, @"1%@", IMSI, v34);
  }
  CFStringRef v22 = v32;
  if (a6 && !v32) {
    *a6 = 16;
  }
  if (v23) {
LABEL_53:
  }
    CFRelease(v23);
LABEL_54:
  my_CFRelease(&v35);
  return v22;
}

uint64_t eapsim_request(uint64_t a1, unsigned __int8 *a2, int *a3, _DWORD *a4)
{
  *(void *)&v31[5] = *MEMORY[0x263EF8340];
  unsigned int Length = EAPPacketGetLength((uint64_t)a2);
  TLVListSizeof();
  MEMORY[0x270FA5388]();
  BOOL v11 = &buf[-v10];
  if ((v12 & 0x7FFFFFE00) != 0) {
    size_t v13 = 512;
  }
  else {
    size_t v13 = v9;
  }
  bzero(&buf[-v10], v13);
  TLVListInit(v11);
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v15))
    {
      *(_DWORD *)buf = 67109376;
      v31[0] = Length;
      LOWORD(v31[1]) = 2048;
      *(void *)((char *)&v31[1] + 2) = 8;
      int v16 = "length %d <= %ld";
      os_log_type_t v17 = LogHandle;
      os_log_type_t v18 = v15;
      uint32_t v19 = 18;
LABEL_15:
      _os_log_impl(&dword_2106D5000, v17, v18, v16, buf, v19);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!TLVListParse_0((uint64_t)v11, a2 + 8, Length - 8))
  {
    CFStringRef v23 = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = TLVListErrorString((uint64_t)v11);
      *(_DWORD *)buf = 136315138;
      *(void *)char v31 = v25;
      int v16 = "parse failed: %s";
      os_log_type_t v17 = v23;
      os_log_type_t v18 = v24;
      uint32_t v19 = 12;
      goto LABEL_15;
    }
LABEL_16:
    client_CFErrorRef error = 0;
    *a3 = 17;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a1 + 12) && *(_DWORD *)(a1 + 16) == a2[1]) {
    return a1 + 316;
  }
  int v21 = a2[5];
  switch(a2[5])
  {
    case 0xAu:
      uint64_t v22 = eapsim_start(a1, (uint64_t)a2, (unsigned __int8 ***)v11, a3);
      goto LABEL_20;
    case 0xBu:
      uint64_t v22 = (uint64_t)eapsim_challenge(a1, (uint64_t)a2, (unsigned __int8 ***)v11, a3);
      goto LABEL_20;
    case 0xCu:
      uint64_t v22 = (uint64_t)eapsim_notification(a1, a2, (unsigned __int8 ***)v11, a3, a4);
      goto LABEL_20;
    case 0xDu:
      uint64_t v22 = (uint64_t)eapsim_reauthentication(a1, a2, (unsigned __int8 ***)v11, a3);
LABEL_20:
      client_CFErrorRef error = v22;
      break;
    default:
      *a3 = 17;
      uint64_t v27 = EAPLogGetLogHandle();
      os_log_type_t v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        String = EAPSIMAKAPacketSubtypeGetString(v21);
        *(_DWORD *)buf = 136315138;
        *(void *)char v31 = String;
        _os_log_impl(&dword_2106D5000, v27, v28, "unexpected Subtype %s", buf, 0xCu);
      }
      client_CFErrorRef error = 0;
      *a3 = 17;
      break;
  }
LABEL_21:
  TLVListFree((uint64_t)v11);
  if (*a3) {
    *(void *)(a1 + 8) = 0x500000002;
  }
  if (!client_error)
  {
    if (*a3 != 17) {
      return 0;
    }
    client_CFErrorRef error = eapsim_make_client_error(a1, (uint64_t)a2, 0);
    if (!client_error) {
      return client_error;
    }
  }
  *(_DWORD *)(a1 + 16) = a2[1];
  return client_error;
}

uint64_t eapsim_start(uint64_t a1, uint64_t a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v81 - v9;
  if ((v11 & 0x7FFFFFE00) != 0) {
    size_t v12 = 512;
  }
  else {
    size_t v12 = v8;
  }
  bzero((char *)v81 - v9, v12);
  uint64_t v83 = 0;
  uint64_t v13 = TLVListLookupAttribute(a3, 15);
  if (!v13)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v21))
    {
LABEL_16:
      uint64_t response = 0;
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v22 = "eapsim: Start is missing AT_VERSION_LIST";
    CFStringRef v23 = LogHandle;
    os_log_type_t v24 = v21;
    uint32_t v25 = 2;
    goto LABEL_15;
  }
  unsigned int v14 = bswap32(*(unsigned __int16 *)(v13 + 2));
  unsigned int v15 = HIWORD(v14);
  if (HIWORD(v14) >= 2u)
  {
    int v16 = v14 >> 17;
    if (v14 >> 17 <= 1) {
      int v17 = 1;
    }
    else {
      int v17 = v14 >> 17;
    }
    os_log_type_t v18 = (_WORD *)(v13 + 4);
    while (*v18 != 256)
    {
      ++v18;
      if (!--v17) {
        goto LABEL_12;
      }
    }
    if (v15 < 4)
    {
      os_log_type_t v28 = *(void **)(a1 + 304);
      if (v28)
      {
        free(v28);
        *(void *)(a1 + 304) = 0;
        *(_DWORD *)(a1 + 312) = 0;
      }
    }
    else
    {
      EAPSIMContextSetVersionList(a1, (void *)(v13 + 4), v16);
    }
    if (*(_DWORD *)(a1 + 12) == 1)
    {
      int v29 = *(_DWORD *)(a1 + 20);
      if (v29)
      {
LABEL_31:
        *(_DWORD *)(a1 + 20) = v29 + 1;
        if (v29 >= 3)
        {
          char v31 = EAPLogGetLogHandle();
          os_log_type_t v32 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v31, v32)) {
            goto LABEL_16;
          }
          int v33 = *(_DWORD *)(a1 + 20);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v33;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = 3;
          uint64_t v22 = "eapsim: too many Start packets (%d > %d)";
          CFStringRef v23 = v31;
          os_log_type_t v24 = v32;
          uint32_t v25 = 14;
          goto LABEL_15;
        }
        int v34 = TLVListLookupIdentityAttribute((int *)a3);
        int v35 = v34;
        switch(v34)
        {
          case 10:
            if (*(int *)(a1 + 20) < 2) {
              goto LABEL_47;
            }
            int v39 = *(unsigned __int8 *)(a1 + 28);
            if (v39 == 13 || v39 == 17) {
              goto LABEL_47;
            }
            uint64_t v40 = EAPLogGetLogHandle();
            os_log_type_t v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41)) {
              goto LABEL_16;
            }
            String = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            int v43 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = String;
            *(_WORD *)&unsigned char buf[12] = 1024;
            int v85 = v43;
            uint64_t v22 = "eapsim: AT_PERMANENT_ID_REQ follows %s at Start #%d";
            break;
          case 17:
            if (*(int *)(a1 + 20) < 2 || *(unsigned char *)(a1 + 28) == 13) {
              goto LABEL_47;
            }
            uint64_t v40 = EAPLogGetLogHandle();
            os_log_type_t v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41)) {
              goto LABEL_16;
            }
            uint64_t v61 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            int v62 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v61;
            *(_WORD *)&unsigned char buf[12] = 1024;
            int v85 = v62;
            uint64_t v22 = "eapsim: AT_FULLAUTH_ID_REQ follows %s at Start #%d";
            break;
          case 13:
            if (*(int *)(a1 + 20) >= 2)
            {
              unsigned __int8 v36 = EAPLogGetLogHandle();
              os_log_type_t v37 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v36, v37)) {
                goto LABEL_16;
              }
              int v38 = *(_DWORD *)(a1 + 20);
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v38;
              uint64_t v22 = "eapsim: AT_ANY_ID_REQ at Start #%d";
              CFStringRef v23 = v36;
              os_log_type_t v24 = v37;
              uint32_t v25 = 8;
              goto LABEL_15;
            }
LABEL_47:
            *(unsigned char *)(a1 + 296) = 0;
            *(unsigned char *)(a1 + 28) = v34;
            uint64_t response = eapsim_make_response(a1, a2, 10, (uint64_t)v10);
            char v82 = 0;
            os_log_type_t v44 = *(const void **)(*(void *)a1 + 56);
            CFTypeID TypeID = CFDataGetTypeID();
            if (v44 && CFGetTypeID(v44) == TypeID && CFDataGetLength(*(CFDataRef *)(*(void *)a1 + 56)) >= 1)
            {
              ExternalRepresentation = CFRetain(*(CFTypeRef *)(*(void *)a1 + 56));
              uint64_t v83 = ExternalRepresentation;
LABEL_86:
              BytePtr = CFDataGetBytePtr((CFDataRef)ExternalRepresentation);
              signed int Length = CFDataGetLength((CFDataRef)ExternalRepresentation);
              if (!TLVBufferAddIdentity((uint64_t)v10, BytePtr, Length))
              {
                uint64_t v72 = EAPLogGetLogHandle();
                os_log_type_t v73 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v72, v73))
                {
                  uint64_t v74 = TLVBufferErrorString((uint64_t)v10);
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = v74;
                  _os_log_impl(&dword_2106D5000, v72, v73, "eapsim: can't add AT_IDENTITY, %s", buf, 0xCu);
                }
                *a4 = 8;
                goto LABEL_101;
              }
              if (v82)
              {
LABEL_91:
                __int16 v71 = TLVBufferUsed((uint64_t)v10);
                EAPPacketSetLength(response, (unsigned __int16)(v71 + 8));
                goto LABEL_19;
              }
LABEL_88:
              *(unsigned char *)(a1 + 240) = 0;
              TLV = TLVBufferAllocateTLV((uint64_t)v10, 16, 4);
              if (!TLV)
              {
                int v75 = EAPLogGetLogHandle();
                os_log_type_t v76 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v75, v76))
                {
                  uint64_t v77 = TLVBufferErrorString((uint64_t)v10);
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = v77;
                  _os_log_impl(&dword_2106D5000, v75, v76, "eapsim: failed allocating AT_SELECTED_VERSION, %s", buf, 0xCu);
                }
                uint64_t response = 0;
                int v26 = 8;
                goto LABEL_18;
              }
              *((_WORD *)TLV + 1) = 256;
              __int16 v70 = TLVBufferAllocateTLV((uint64_t)v10, 7, 20);
              if (v70)
              {
                *((_WORD *)v70 + 1) = 0;
                *(_OWORD *)(v70 + 4) = *(_OWORD *)(a1 + 241);
                goto LABEL_91;
              }
              unsigned int v78 = EAPLogGetLogHandle();
              os_log_type_t v79 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v78, v79))
              {
                uint64_t v80 = TLVBufferErrorString((uint64_t)v10);
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = v80;
                uint64_t v60 = "eapsim: failed allocating AT_NONCE_MT, %s";
                uint64_t v63 = buf;
                __int16 v64 = v78;
                os_log_type_t v65 = v79;
                uint32_t v66 = 12;
                goto LABEL_100;
              }
LABEL_101:
              uint64_t response = 0;
              goto LABEL_19;
            }
            char v47 = *(uint64_t **)(a1 + 280);
            if (v47)
            {
              if (!v47[2])
              {
                uint64_t v50 = *v47;
                if (v35 == 10 && v50)
                {
                  *a4 = 17;
                  if (EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 264)))
                  {
                    long long v53 = EAPLogGetLogHandle();
                    os_log_type_t v54 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v53, v54))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2106D5000, v53, v54, "eapsim: purging all the temporary identities", buf, 2u);
                    }
                    EAPSIMAKAPersistentStatePurgeTemporaryIDs(*(void *)(a1 + 264));
                  }
                  size_t v55 = EAPLogGetLogHandle();
                  os_log_type_t v56 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v55, v56))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_2106D5000, v55, v56, "eapsim: requesting out-of-band psuedonym", buf, 2u);
                  }
                  SIMReportDecryptionError(0);
                  goto LABEL_101;
                }
LABEL_70:
                if (v50 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 264)))
                {
                  ExternalRepresentation = CFStringCreateExternalRepresentation(0, **(CFStringRef **)(a1 + 280), 0x8000100u, 0);
                  uint64_t v83 = ExternalRepresentation;
                  EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
                  *(unsigned char *)(a1 + 296) = 1;
                  goto LABEL_86;
                }
                goto LABEL_72;
              }
              BOOL v48 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 264));
              uint64_t v49 = *(uint64_t **)(a1 + 280);
              if (v35 == 10 || !v48)
              {
                ExternalRepresentation = CFRetain((CFTypeRef)v49[2]);
                uint64_t v83 = ExternalRepresentation;
                EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
                goto LABEL_86;
              }
              if (v49)
              {
                uint64_t v50 = *v49;
                goto LABEL_70;
              }
            }
LABEL_72:
            CFStringRef v57 = sim_identity_create(*(void *)(a1 + 264), *(CFDictionaryRef *)(*(void *)a1 + 80), v35, 0, &v82, a4);
            *(void *)buf = v57;
            if (!v57)
            {
              if (*a4 == 17)
              {
                int v58 = EAPLogGetLogHandle();
                os_log_type_t v59 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(v58, v59)) {
                  goto LABEL_101;
                }
                v81[0] = 0;
                uint64_t v60 = "eapsim: protocol error.";
              }
              else
              {
                if (*a4 != 16) {
                  goto LABEL_101;
                }
                int v58 = EAPLogGetLogHandle();
                os_log_type_t v59 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(v58, v59)) {
                  goto LABEL_101;
                }
                v81[0] = 0;
                uint64_t v60 = "eapsim: can't find SIM identity";
              }
              uint64_t v63 = (uint8_t *)v81;
              __int16 v64 = v58;
              os_log_type_t v65 = v59;
              uint32_t v66 = 2;
LABEL_100:
              _os_log_impl(&dword_2106D5000, v64, v65, v60, v63, v66);
              goto LABEL_101;
            }
            ExternalRepresentation = CFStringCreateExternalRepresentation(0, v57, 0x8000100u, 0);
            uint64_t v83 = ExternalRepresentation;
            EAPSIMContextSetLastIdentity(a1, ExternalRepresentation);
            my_CFRelease((const void **)buf);
            goto LABEL_86;
          default:
            if (*(int *)(a1 + 20) < 2)
            {
              *(unsigned char *)(a1 + 296) = 0;
              *(unsigned char *)(a1 + 28) = v34;
              uint64_t response = eapsim_make_response(a1, a2, 10, (uint64_t)v10);
              goto LABEL_88;
            }
            uint64_t v40 = EAPLogGetLogHandle();
            os_log_type_t v41 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v40, v41)) {
              goto LABEL_16;
            }
            uint64_t v51 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
            int v52 = *(_DWORD *)(a1 + 20);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&unsigned char buf[12] = 1024;
            int v85 = v52;
            uint64_t v22 = "eapsim: no *ID_REQ follows %s at Start #%d";
            break;
        }
        CFStringRef v23 = v40;
        os_log_type_t v24 = v41;
        uint32_t v25 = 18;
LABEL_15:
        _os_log_impl(&dword_2106D5000, v23, v24, v22, buf, v25);
        goto LABEL_16;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 20) = 0;
      *(unsigned char *)(a1 + 28) = 0;
      *(void *)(a1 + 8) = 0x100000000;
    }
    uint64_t v30 = 0;
    do
    {
      *(_DWORD *)(a1 + 241 + v30) = arc4random();
      v30 += 4;
    }
    while (v30 != 16);
    int v29 = *(_DWORD *)(a1 + 20);
    goto LABEL_31;
  }
LABEL_12:
  uint64_t response = eapsim_make_client_error(a1, a2, 1u);
LABEL_17:
  int v26 = 17;
LABEL_18:
  *a4 = v26;
LABEL_19:
  my_CFRelease(&v83);
  return response;
}

const void *eapsim_challenge(uint64_t a1, uint64_t a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  __int16 data = 256;
  memset(&c, 0, sizeof(c));
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v82 - v9;
  if ((v11 & 0x7FFFFFE00) != 0) {
    size_t v12 = 512;
  }
  else {
    size_t v12 = v8;
  }
  bzero((char *)&v82 - v9, v12);
  if (*(_DWORD *)(a1 + 12) != 1)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v21 = "eapsim: Challenge sent without Start";
LABEL_14:
      uint64_t v22 = buf;
LABEL_15:
      CFStringRef v23 = LogHandle;
      os_log_type_t v24 = v20;
      uint32_t v25 = 2;
LABEL_16:
      _os_log_impl(&dword_2106D5000, v23, v24, v21, v22, v25);
    }
LABEL_17:
    client_CFErrorRef error = 0;
LABEL_18:
    int v26 = 17;
    goto LABEL_19;
  }
  *(_DWORD *)(a1 + 12) = 2;
  EAPSIMAKAPersistentStateSetCounter(*(void *)(a1 + 264), 1);
  EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 264), 0);
  *(unsigned char *)(a1 + 272) = 0;
  uint64_t v13 = TLVListLookupAttribute(a3, 1);
  if (!v13)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v21 = "eapsim: Challenge is missing AT_RAND";
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  unint64_t v14 = (4 * (unint64_t)*(unsigned __int8 *)(v13 + 1) + 0xFFFFFFFFCLL) >> 4;
  if (*(_DWORD *)(a1 + 24) > (int)v14)
  {
    unsigned int v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      int v17 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109376;
      int v92 = v14;
      __int16 v93 = 1024;
      int v94 = v17;
      _os_log_impl(&dword_2106D5000, v15, v16, "eapsim: Challenge AT_RAND has %d RANDs, policy requires %d", buf, 0xEu);
    }
    client_CFErrorRef error = (const void *)eapsim_make_client_error(a1, a2, 2u);
    goto LABEL_18;
  }
  if ((int)v14 >= 4)
  {
    os_log_type_t v28 = EAPLogGetLogHandle();
    os_log_type_t v29 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 67109376;
    int v92 = v14;
    __int16 v93 = 1024;
    int v94 = 3;
    os_log_type_t v21 = "eapsim: Challenge AT_RAND has %d RANDs > %d";
    uint64_t v22 = buf;
    CFStringRef v23 = v28;
    os_log_type_t v24 = v29;
    uint32_t v25 = 14;
    goto LABEL_16;
  }
  uint64_t v30 = (int8x16_t *)(v13 + 4);
  if ((int)v14 >= 2)
  {
    int v31 = 0;
    int v32 = v14 - 1;
    BOOL v33 = 1;
    int v34 = v14 - 1;
    int v35 = (void *)(v13 + 4);
    while (1)
    {
      unsigned __int8 v36 = v35;
      v35 += 2;
      if (++v31 < (int)v14) {
        break;
      }
LABEL_33:
      --v34;
      BOOL v33 = v31 < v32;
      if (v31 == v32) {
        goto LABEL_34;
      }
    }
    int v37 = v34;
    int v38 = v35;
    while (*v36 != *v38 || v36[1] != v38[1])
    {
      v38 += 2;
      if (!--v37) {
        goto LABEL_33;
      }
    }
LABEL_34:
    if (v33)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v20)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      os_log_type_t v21 = "eapsim: Challenge AT_RAND has duplicate RANDs";
      goto LABEL_14;
    }
  }
  uint64_t v40 = *(void *)(a1 + 40);
  int v85 = &v82;
  uint64_t v83 = (const void *)a2;
  if (v40)
  {
    if ((int)v14 >= 1)
    {
      int v41 = 0;
      uint64_t v42 = v90;
      int v43 = buf;
      do
      {
        uint64_t v84 = v42;
        CFArrayRef v44 = *(const __CFArray **)(a1 + 56);
        if (v44)
        {
          CFIndex Count = CFArrayGetCount(v44);
          if (Count < 1) {
            goto LABEL_59;
          }
          CFIndex v46 = Count;
          CFIndex v47 = 0;
          while (1)
          {
            CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v47);
            BytePtr = CFDataGetBytePtr(ValueAtIndex);
            if (v30->i64[0] == *(void *)BytePtr && v30->i64[1] == *((void *)BytePtr + 1)) {
              break;
            }
            if (v46 == ++v47) {
              goto LABEL_59;
            }
          }
          if (v47 == -1)
          {
LABEL_59:
            uint64_t v60 = EAPLogGetLogHandle();
            os_log_type_t v61 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v60, v61))
            {
              *(_WORD *)size_t v88 = 0;
              int v62 = "eapsim: can't find static RAND value";
              goto LABEL_80;
            }
            goto LABEL_81;
          }
        }
        else
        {
          LODWORD(v47) = 0;
        }
        CFDataRef v51 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), (int)v47);
        *(void *)int v43 = *(void *)CFDataGetBytePtr(v51);
        v43 += 8;
        CFDataRef v52 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), (int)v47);
        long long v53 = CFDataGetBytePtr(v52);
        os_log_type_t v54 = v84;
        *(_DWORD *)uint64_t v84 = *(_DWORD *)v53;
        uint64_t v42 = v54 + 4;
        ++v30;
        ++v41;
      }
      while (v41 != v14);
    }
  }
  else if (*(void *)(a1 + 64) && *(void *)(a1 + 72))
  {
    if ((int)v14 >= 1)
    {
      size_t v55 = v90;
      os_log_type_t v56 = (int8x8_t *)buf;
      int v57 = v14;
      do
      {
        int v58 = (int8x16_t *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 72));
        os_log_type_t v59 = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
        sim_simulator_gsm_milenage_algo(v58, v59, v30, v55, v56++);
        v55 += 4;
        ++v30;
        --v57;
      }
      while (v57);
    }
  }
  else if ((SIMAuthenticateGSM(*(const __CFDictionary **)(*(void *)a1 + 80), (uint64_t)v30, v14, (uint64_t)buf, (uint64_t)v90) & 1) == 0)
  {
    uint64_t v60 = EAPLogGetLogHandle();
    os_log_type_t v61 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v60, v61))
    {
      *(_WORD *)size_t v88 = 0;
      int v62 = "SIMAuthenticateGSM failed";
LABEL_80:
      _os_log_impl(&dword_2106D5000, v60, v61, v62, v88, 2u);
    }
LABEL_81:
    client_CFErrorRef error = 0;
    int v78 = 8;
    goto LABEL_82;
  }
  CC_SHA1_Init(&c);
  CFDataRef v63 = *(const __CFData **)(a1 + 32);
  if (v63)
  {
    __int16 v64 = CFDataGetBytePtr(v63);
    CC_LONG Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
    uint32_t v66 = v64;
  }
  else
  {
    uint32_t v66 = *(const UInt8 **)(*(void *)a1 + 40);
    CC_LONG Length = *(_DWORD *)(*(void *)a1 + 48);
  }
  CC_SHA1_Update(&c, v66, Length);
  CFMutableArrayRef v67 = v83;
  CC_SHA1_Update(&c, buf, 8 * v14);
  CC_SHA1_Update(&c, (const void *)(a1 + 241), 0x10u);
  p___int16 data = *(__int16 **)(a1 + 304);
  if (p_data)
  {
    CC_LONG v69 = 2 * *(_DWORD *)(a1 + 312);
  }
  else
  {
    p___int16 data = &data;
    CC_LONG v69 = 2;
  }
  CC_SHA1_Update(&c, p_data, v69);
  CC_SHA1_Update(&c, &data, 2u);
  MasterKey = (unsigned __int8 *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(a1 + 264));
  CC_SHA1_Final(MasterKey, &c);
  __int16 v71 = (long long *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(a1 + 264));
  fips186_2prf(v71, a1 + 80);
  uint64_t v72 = TLVListLookupAttribute(a3, 11);
  if (!v72)
  {
    os_log_type_t v76 = EAPLogGetLogHandle();
    os_log_type_t v77 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v76, v77))
    {
      *(_WORD *)size_t v88 = 0;
      _os_log_impl(&dword_2106D5000, v76, v77, "eapsim: Challenge is missing AT_MAC", v88, 2u);
    }
    client_CFErrorRef error = 0;
    int v78 = 17;
LABEL_82:
    *a4 = v78;
    return client_error;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, v67, v72 + 4, (const void *)(a1 + 241), 16))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v20)) {
      goto LABEL_17;
    }
    *(_WORD *)size_t v88 = 0;
    os_log_type_t v21 = "eapsim: Challenge AT_MAC not valid";
    uint64_t v22 = v88;
    goto LABEL_15;
  }
  if (!eapsim_challenge_process_encr_data(a1, a3)) {
    goto LABEL_17;
  }
  client_CFErrorRef error = (const void *)eapsim_make_response(a1, (uint64_t)v67, 11, (uint64_t)v10);
  TLV = TLVBufferAllocateTLV((uint64_t)v10, 11, 20);
  if (TLV)
  {
    uint64_t v74 = TLV;
    *((_WORD *)TLV + 1) = 0;
    __int16 v75 = TLVBufferUsed((uint64_t)v10);
    EAPPacketSetLength((uint64_t)client_error, (unsigned __int16)(v75 + 8));
    EAPSIMAKAKeyInfoSetMAC(a1 + 80, client_error, v74 + 4, v90, 4 * v14);
    *(_DWORD *)(a1 + 12) = 4;
    *(unsigned char *)(a1 + 240) = 1;
    return client_error;
  }
  os_log_type_t v79 = EAPLogGetLogHandle();
  os_log_type_t v80 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v79, v80))
  {
    uint64_t v81 = TLVBufferErrorString((uint64_t)v10);
    *(_DWORD *)size_t v88 = 136315138;
    uint64_t v89 = v81;
    _os_log_impl(&dword_2106D5000, v79, v80, "eapsim: failed allocating AT_MAC, %s", v88, 0xCu);
  }
  client_CFErrorRef error = 0;
  int v26 = 8;
LABEL_19:
  *a4 = v26;
  return client_error;
}

const void *eapsim_notification(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4, _DWORD *a5)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  size_t v12 = (char *)&v86 - v11;
  if ((v13 & 0x7FFFFFE00) != 0) {
    size_t v14 = 512;
  }
  else {
    size_t v14 = v10;
  }
  bzero((char *)&v86 - v11, v14);
  *a4 = 0;
  *a5 = 0;
  uint64_t v15 = TLVListLookupAttribute(a3, 12);
  if (!v15)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    uint32_t v19 = "eapsim: Notification does not contain AT_NOTIFICATION attribute";
LABEL_32:
    os_log_type_t v20 = LogHandle;
    os_log_type_t v21 = v24;
    uint32_t v22 = 2;
    goto LABEL_33;
  }
  unsigned int v16 = bswap32(*(unsigned __int16 *)(v15 + 2)) >> 16;
  if (v16 >= 0xC000)
  {
    int v17 = EAPLogGetLogHandle();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v95 = v16;
      uint32_t v19 = "eapsim: Notification code '%d' indicates success before authentication";
      os_log_type_t v20 = v17;
      os_log_type_t v21 = v18;
      uint32_t v22 = 8;
LABEL_33:
      _os_log_impl(&dword_2106D5000, v20, v21, v19, buf, v22);
    }
LABEL_34:
    uint64_t response = 0;
    int v42 = 17;
LABEL_35:
    *a4 = v42;
    return response;
  }
  uint64_t v25 = TLVListLookupAttribute(a3, 11);
  if (v25)
  {
    if ((v16 & 0x4000) != 0)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v24)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      uint32_t v19 = "eapsim: Notification incorrectly contains AT_MAC";
      goto LABEL_32;
    }
    if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, a2, v25 + 4, 0, 0))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v24)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      uint32_t v19 = "eapsim: Notification AT_MAC not valid";
      goto LABEL_32;
    }
  }
  else if ((v16 & 0x4000) == 0)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v24 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v24)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    uint32_t v19 = "eapsim: Notification is missing AT_MAC";
    goto LABEL_32;
  }
  unsigned int Counter = EAPSIMAKAPersistentStateGetCounter(*(void *)(a1 + 264));
  if ((v16 & 0x4000) == 0 && *(unsigned char *)(a1 + 272))
  {
    unsigned int v90 = Counter;
    TLVListSizeof();
    uint64_t v91 = &v86;
    MEMORY[0x270FA5388]();
    os_log_type_t v29 = (unsigned __int8 ***)((char *)&v86 - v28);
    if ((v30 & 0x7FFFFFE00) != 0) {
      size_t v31 = 512;
    }
    else {
      size_t v31 = v27;
    }
    bzero((char *)&v86 - v28, v31);
    uint64_t v32 = TLVListLookupAttribute(a3, 130);
    uint64_t v33 = TLVListLookupAttribute(a3, 129);
    uint64_t v34 = v33;
    if (v32 && v33)
    {
      TLVListInit(v29);
      uint64_t v87 = (const void *)(a1 + 80);
      int v35 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v32, v34, (uint64_t)v29);
      if (!v35)
      {
        __int16 v64 = EAPLogGetLogHandle();
        os_log_type_t v65 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v64, v65))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v64, v65, "eapsim: failed to decrypt Notification AT_ENCR_DATA", buf, 2u);
        }
        int v60 = 8;
        goto LABEL_57;
      }
      size_t v88 = v35;
      uint64_t v89 = TLVListCopyDescription(v29);
      unsigned __int8 v36 = EAPLogGetLogHandle();
      os_log_type_t v37 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v95 = v89;
        _os_log_impl(&dword_2106D5000, v36, v37, "Decrypted TLVs:\n%@", buf, 0xCu);
      }
      CFRelease(v89);
      uint64_t v38 = TLVListLookupAttribute(v29, 19);
      uint64_t v39 = v38;
      if (v38) {
        unsigned int v40 = bswap32(*(unsigned __int16 *)(v38 + 2)) >> 16;
      }
      else {
        unsigned int v40 = 0;
      }
      free(v88);
      TLVListFree((uint64_t)v29);
      if (v39)
      {
        unsigned int v72 = v90;
        if (v40 == v90)
        {
          uint64_t response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 12, (uint64_t)v12);
          TLVBufferSizeof();
          MEMORY[0x270FA5388]();
          __int16 v75 = (char *)&v86 - v74;
          if ((v76 & 0x7FFFFFE00) != 0) {
            size_t v77 = 512;
          }
          else {
            size_t v77 = v73;
          }
          bzero((char *)&v86 - v74, v77);
          TLVBufferInit((uint64_t)v75, (uint64_t)buf, 16);
          if (TLVBufferAddCounter((uint64_t)v75, v72))
          {
            if (EAPSIMAKAKeyInfoEncryptTLVs(v87, (uint64_t)v12, (uint64_t)v75))
            {
              if (!v25) {
                goto LABEL_40;
              }
              goto LABEL_38;
            }
            int v85 = 8;
          }
          else
          {
            uint64_t v82 = EAPLogGetLogHandle();
            os_log_type_t v83 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v82, v83))
            {
              uint64_t v84 = TLVBufferErrorString((uint64_t)v75);
              *(_DWORD *)int v92 = 136315138;
              uint64_t v93 = v84;
              _os_log_impl(&dword_2106D5000, v82, v83, "eapsim: failed to allocate AT_COUNTER, %s", v92, 0xCu);
            }
            int v85 = 2;
          }
          *a4 = v85;
          return 0;
        }
        os_log_type_t v80 = EAPLogGetLogHandle();
        os_log_type_t v81 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v80, v81)) {
          goto LABEL_49;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v95 = v40;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v72;
        os_log_type_t v56 = "eapsim: Notification AT_COUNTER (%d) does not match current counter (%d)";
        int v57 = v80;
        os_log_type_t v58 = v81;
        uint32_t v59 = 14;
      }
      else
      {
        int v78 = EAPLogGetLogHandle();
        os_log_type_t v79 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v78, v79)) {
          goto LABEL_49;
        }
        *(_WORD *)buf = 0;
        os_log_type_t v56 = "eapsim:  Notification AT_ENCR_DATA missing AT_COUNTER";
        int v57 = v78;
        os_log_type_t v58 = v79;
        uint32_t v59 = 2;
      }
    }
    else
    {
      os_log_type_t v54 = EAPLogGetLogHandle();
      os_log_type_t v55 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v54, v55))
      {
LABEL_49:
        int v60 = 17;
LABEL_57:
        *a4 = v60;
        return 0;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)uint64_t v95 = v32;
      *(_WORD *)&v95[8] = 2048;
      uint64_t v96 = v34;
      os_log_type_t v56 = "eapsim: Notification after re-auth missing AT_ENCR_DATA (%p) or AT_IV (%p)";
      int v57 = v54;
      os_log_type_t v58 = v55;
      uint32_t v59 = 22;
    }
    _os_log_impl(&dword_2106D5000, v57, v58, v56, buf, v59);
    goto LABEL_49;
  }
  uint64_t response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 12, (uint64_t)v12);
  if (!v25) {
    goto LABEL_40;
  }
LABEL_38:
  TLV = TLVBufferAllocateTLV((uint64_t)v12, 11, 20);
  if (!TLV)
  {
    os_log_type_t v61 = EAPLogGetLogHandle();
    os_log_type_t v62 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = TLVBufferErrorString((uint64_t)v12);
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v95 = v63;
      _os_log_impl(&dword_2106D5000, v61, v62, "eapsim: failed allocating AT_MAC, %s", buf, 0xCu);
    }
    uint64_t response = 0;
    int v42 = 2;
    goto LABEL_35;
  }
  uint64_t v25 = (uint64_t)TLV;
  *((_WORD *)TLV + 1) = 0;
LABEL_40:
  __int16 v45 = TLVBufferUsed((uint64_t)v12);
  EAPPacketSetLength((uint64_t)response, (unsigned __int16)(v45 + 8));
  if (v25) {
    EAPSIMAKAKeyInfoSetMAC(a1 + 80, response, (_OWORD *)(v25 + 4), 0, 0);
  }
  if ((v16 & 0x8000) != 0)
  {
    *(_DWORD *)(a1 + 12) = 4;
    return response;
  }
  *(_DWORD *)(a1 + 12) = 5;
  *a4 = 1002;
  *a5 = EAPSIMAKAStatusForATNotificationCode(v16);
  String = ATNotificationCodeGetString(v16);
  CFIndex v47 = EAPLogGetLogHandle();
  os_log_type_t v48 = _SC_syslog_os_log_mapping();
  BOOL v49 = os_log_type_enabled(v47, v48);
  if (String)
  {
    if (!v49) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v95 = String;
    uint64_t v50 = "eapsim: Notification: %s";
    CFDataRef v51 = v47;
    os_log_type_t v52 = v48;
    uint32_t v53 = 12;
  }
  else
  {
    if (!v49) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)uint64_t v95 = v16;
    uint64_t v50 = "eapsim: Notification code '%d' unrecognized failure";
    CFDataRef v51 = v47;
    os_log_type_t v52 = v48;
    uint32_t v53 = 8;
  }
  _os_log_impl(&dword_2106D5000, v51, v52, v50, buf, v53);
LABEL_62:
  CFDictionaryRef v66 = (const __CFDictionary *)EAPSIMAKAActionInfoForNotificationCode(*(const __CFDictionary **)(*(void *)a1 + 80), v16);
  if (v66)
  {
    CFDictionaryRef v67 = v66;
    *(void *)(a1 + 288) = CFDictionaryCreateCopy(0, v66);
    uint64_t v68 = EAPLogGetLogHandle();
    os_log_type_t v69 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v68, v69))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v95 = v67;
      _os_log_impl(&dword_2106D5000, v68, v69, "eapsim: Notification Action Info: %@", buf, 0xCu);
    }
  }
  else if (*a5 == 19)
  {
    uint64_t v70 = *(void *)(a1 + 280);
    if (v70)
    {
      uint64_t v71 = *(void *)(v70 + 16);
      if (v71) {
        SIMReportDecryptionError(v71);
      }
    }
  }
  return response;
}

const void *eapsim_reauthentication(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  size_t v10 = (char *)&v60 - v9;
  if ((v11 & 0x7FFFFFE00) != 0) {
    size_t v12 = 512;
  }
  else {
    size_t v12 = v8;
  }
  bzero((char *)&v60 - v9, v12);
  TLVListSizeof();
  MEMORY[0x270FA5388]();
  uint64_t v15 = (unsigned __int8 ***)((char *)&v60 - v14);
  if ((v16 & 0x7FFFFFE00) != 0) {
    size_t v17 = 512;
  }
  else {
    size_t v17 = v13;
  }
  bzero((char *)&v60 - v14, v17);
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  os_log_type_t v20 = (char *)&v60 - v19;
  if ((v21 & 0x7FFFFFE00) != 0) {
    size_t v22 = 512;
  }
  else {
    size_t v22 = v18;
  }
  bzero((char *)&v60 - v19, v22);
  TLVListInit(v15);
  if (!*(unsigned char *)(a1 + 240))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim: Reauthentication but no key info available";
LABEL_40:
    _os_log_impl(&dword_2106D5000, LogHandle, v44, v45, buf, 2u);
    goto LABEL_41;
  }
  if (!EAPSIMAKAPersistentStateGetReauthID(*(void *)(a1 + 264)))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim: received Reauthentication but don't have reauth id";
    goto LABEL_40;
  }
  *(void *)(a1 + 8) = 0x300000000;
  EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 264), 0);
  uint64_t v23 = TLVListLookupAttribute(a3, 11);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim: Reauthentication is missing AT_MAC";
    goto LABEL_40;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 80, a2, v23 + 4, 0, 0))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim: Reauthentication AT_MAC not valid";
    goto LABEL_40;
  }
  uint64_t v24 = TLVListLookupAttribute(a3, 130);
  uint64_t v25 = TLVListLookupAttribute(a3, 129);
  uint64_t v26 = v25;
  if (!v24 || !v25)
  {
    if (!v24)
    {
      CFIndex v47 = EAPLogGetLogHandle();
      os_log_type_t v48 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v47, v48))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v47, v48, "eapsim:  Reauthentication missing AT_ENCR_DATA", buf, 2u);
      }
    }
    if (v26) {
      goto LABEL_41;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v44)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim:  Reauthentication missing AT_IV";
    goto LABEL_40;
  }
  size_t v27 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v24, v25, (uint64_t)v15);
  if (v27)
  {
    os_log_type_t v62 = v27;
    uint64_t v63 = TLVListCopyDescription(v15);
    uint64_t v28 = EAPLogGetLogHandle();
    os_log_type_t v29 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v67 = v63;
      _os_log_impl(&dword_2106D5000, v28, v29, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v63);
    uint64_t v30 = TLVListLookupAttribute(v15, 21);
    uint64_t v31 = TLVListLookupAttribute(v15, 19);
    uint64_t v32 = v31;
    if (!v30 || !v31)
    {
      if (!v30)
      {
        BOOL v49 = EAPLogGetLogHandle();
        os_log_type_t v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v49, v50, "eapsim:  Reauthentication AT_ENCR_DATA missing AT_NONCE_S", buf, 2u);
        }
      }
      if (!v32)
      {
        CFDataRef v51 = EAPLogGetLogHandle();
        os_log_type_t v52 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v51, v52))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v51, v52, "eapsim:  Reauthentication AT_ENCR_DATA missing AT_COUNTER", buf, 2u);
        }
      }
      uint64_t response = 0;
      int v53 = 17;
      goto LABEL_66;
    }
    uint64_t v61 = v30;
    unsigned int v33 = bswap32(*(unsigned __int16 *)(v31 + 2)) >> 16;
    LODWORD(v63) = EAPSIMAKAPersistentStateGetCounter(*(void *)(a1 + 264));
    if (v33 >= v63)
    {
      uint64_t v60 = v32;
      CFStringRef StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v15, 133);
      if (StringFromAttribute)
      {
        CFStringRef v35 = StringFromAttribute;
        EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 264), StringFromAttribute);
        CFRelease(v35);
      }
      EAPSIMAKAPersistentStateSetCounter(*(void *)(a1 + 264), v33 + 1);
      uint64_t v32 = v60;
    }
    uint64_t response = (const void *)eapsim_make_response(a1, (uint64_t)a2, 13, (uint64_t)v20);
    TLVBufferInit((uint64_t)v10, (uint64_t)buf, 16);
    if (TLVBufferAddCounter((uint64_t)v10, v33))
    {
      LODWORD(v60) = v33;
      BOOL v37 = v33 >= v63;
      unsigned int v38 = v63;
      if (v37 || TLVBufferAddCounterTooSmall((uint64_t)v10))
      {
        if (!EAPSIMAKAKeyInfoEncryptTLVs((const void *)(a1 + 80), (uint64_t)v20, (uint64_t)v10)) {
          goto LABEL_65;
        }
        TLV = TLVBufferAllocateTLV((uint64_t)v20, 11, 20);
        if (TLV)
        {
          unsigned int v40 = TLV;
          *((_WORD *)TLV + 1) = 0;
          __int16 v41 = TLVBufferUsed((uint64_t)v20);
          EAPPacketSetLength((uint64_t)response, (unsigned __int16)(v41 + 8));
          uint64_t v42 = v61;
          EAPSIMAKAKeyInfoSetMAC(a1 + 80, response, v40 + 4, (const void *)(v61 + 4), 16);
          if (v60 >= v38)
          {
            *(_DWORD *)(a1 + 12) = 4;
            eapsim_compute_reauth_key(a1, v32, v42);
            *(unsigned char *)(a1 + 240) = 1;
            *(unsigned char *)(a1 + 272) = 1;
          }
          else
          {
            *(unsigned char *)(a1 + 240) = 0;
          }
          goto LABEL_67;
        }
        os_log_type_t v54 = EAPLogGetLogHandle();
        os_log_type_t v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55)) {
          goto LABEL_65;
        }
        uint64_t v59 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)__int16 v64 = 136315138;
        uint64_t v65 = v59;
        int v57 = "eapsim: failed allocating AT_MAC, %s";
        goto LABEL_64;
      }
      os_log_type_t v54 = EAPLogGetLogHandle();
      os_log_type_t v55 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v58 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)__int16 v64 = 136315138;
        uint64_t v65 = v58;
        int v57 = "eapsim: failed allocating AT_COUNTER_TOO_SMALL, %s";
        goto LABEL_64;
      }
    }
    else
    {
      os_log_type_t v54 = EAPLogGetLogHandle();
      os_log_type_t v55 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = TLVBufferErrorString((uint64_t)v20);
        *(_DWORD *)__int16 v64 = 136315138;
        uint64_t v65 = v56;
        int v57 = "eapsim: failed allocating AT_COUNTER, %s";
LABEL_64:
        _os_log_impl(&dword_2106D5000, v54, v55, v57, v64, 0xCu);
      }
    }
LABEL_65:
    uint64_t response = 0;
    int v53 = 8;
LABEL_66:
    *a4 = v53;
LABEL_67:
    free(v62);
    goto LABEL_42;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v44 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v44))
  {
    *(_WORD *)buf = 0;
    __int16 v45 = "eapsim: failed to decrypt Reauthentication AT_ENCR_DATA";
    goto LABEL_40;
  }
LABEL_41:
  uint64_t response = 0;
  *a4 = 17;
LABEL_42:
  TLVListFree((uint64_t)v15);
  return response;
}

uint64_t eapsim_make_client_error(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  TLVBufferSizeof();
  MEMORY[0x270FA5388]();
  size_t v8 = &buf[-v7];
  if ((v9 & 0x7FFFFFE00) != 0) {
    size_t v10 = 512;
  }
  else {
    size_t v10 = v6;
  }
  bzero(&buf[-v7], v10);
  uint64_t response = eapsim_make_response(a1, a2, 14, (uint64_t)v8);
  TLV = TLVBufferAllocateTLV((uint64_t)v8, 22, 4);
  if (TLV)
  {
    *((_WORD *)TLV + 1) = __rev16(a3);
    __int16 v13 = TLVBufferUsed((uint64_t)v8);
    EAPPacketSetLength(response, (unsigned __int16)(v13 + 8));
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v15))
    {
      uint64_t v16 = TLVBufferErrorString((uint64_t)v8);
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = v16;
      _os_log_impl(&dword_2106D5000, LogHandle, v15, "eapsim: failed allocating AT_CLIENT_ERROR_CODE, %s", buf, 0xCu);
    }
    return 0;
  }
  return response;
}

uint64_t eapsim_make_response(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = a1 + 316;
  TLVBufferInit(a4, a1 + 324, 1492);
  *(unsigned char *)(a1 + 316) = 2;
  *(unsigned char *)(a1 + 317) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 320) = 18;
  *(unsigned char *)(a1 + 321) = a3;
  *(_WORD *)(a1 + 322) = 0;
  return v7;
}

BOOL eapsim_challenge_process_encr_data(uint64_t a1, unsigned __int8 ***a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  TLVListSizeof();
  MEMORY[0x270FA5388]();
  size_t v6 = &buf[-v5];
  if ((v7 & 0x7FFFFFE00) != 0) {
    size_t v8 = 512;
  }
  else {
    size_t v8 = v4;
  }
  bzero(&buf[-v5], v8);
  TLVListInit(v6);
  uint64_t v9 = TLVListLookupAttribute(a2, 130);
  if (!v9) {
    return 1;
  }
  uint64_t v10 = v9;
  uint64_t v11 = TLVListLookupAttribute(a2, 129);
  if (!v11)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v23);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v24 = "eapsim: Challenge missing AT_IV";
    goto LABEL_19;
  }
  size_t v12 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 80), v10, v11, (uint64_t)v6);
  if (v12)
  {
    __int16 v13 = v12;
    uint64_t v14 = TLVListCopyDescription((unsigned __int8 ***)v6);
    os_log_type_t v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v14;
      _os_log_impl(&dword_2106D5000, v15, v16, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v14);
    CFStringRef StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v6, 133);
    if (StringFromAttribute)
    {
      CFStringRef v18 = StringFromAttribute;
      EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 264), StringFromAttribute);
      CFRelease(v18);
    }
    CFStringRef v19 = TLVListCreateStringFromAttribute((uint64_t)v6, 132);
    if (v19)
    {
      CFStringRef v20 = v19;
      EAPSIMAKAPersistentStateSetPseudonym(*(void *)(a1 + 264), v19);
      CFRelease(v20);
    }
    free(v13);
    TLVListFree((uint64_t)v6);
    return 1;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v23 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(LogHandle, v23);
  if (result)
  {
    *(_WORD *)buf = 0;
    uint64_t v24 = "eapsim: Challenge decrypt AT_ENCR_DATA failed";
LABEL_19:
    _os_log_impl(&dword_2106D5000, LogHandle, v23, v24, buf, 2u);
    return 0;
  }
  return result;
}

double eapsim_compute_reauth_key(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFDataRef v6 = *(const __CFData **)(a1 + 32);
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(v6);
    CC_LONG Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
  }
  else
  {
    BytePtr = *(const UInt8 **)(*(void *)a1 + 40);
    CC_LONG Length = *(_DWORD *)(*(void *)a1 + 48);
  }
  uint64_t v9 = *(void *)(a1 + 264);
  return EAPSIMAKAKeyInfoComputeReauthKey((_OWORD *)(a1 + 80), v9, BytePtr, Length, a2, a3);
}

double fips186_2prf(long long *a1, uint64_t a2)
{
  int v3 = 0;
  uint64_t v33 = *MEMORY[0x263EF8340];
  memset(v32, 0, 92);
  long long v28 = 0uLL;
  int v29 = 0;
  long long v26 = 0uLL;
  int v27 = 0;
  v24[0] = 0;
  v24[1] = 0;
  int v25 = 0;
  long long v4 = *a1;
  int v31 = *((_DWORD *)a1 + 4);
  long long v30 = v4;
  memset(v22, 0, sizeof(v22));
  char v23 = 1;
  do
  {
    fr_SHA1Init((uint64_t)v32);
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    long long v18 = v30;
    int v19 = v31;
    fr_SHA1Transform((int *)v32, (unsigned int *)&v18);
    fr_SHA1FinalNoLen((uint64_t)&v28, (uint64_t)v32);
    unsigned int v5 = 0;
    for (uint64_t i = 19; i != -1; --i)
    {
      unsigned int v7 = v5 + *((unsigned __int8 *)&v30 + i) + *((unsigned __int8 *)&v28 + i);
      *((unsigned char *)v24 + i) = v7;
      unsigned int v5 = v7 >> 8;
    }
    unsigned int v8 = 0;
    for (uint64_t j = 19; j != -1; --j)
    {
      unsigned int v10 = v8 + *((unsigned __int8 *)v24 + j) + v22[j];
      *((unsigned char *)&v30 + j) = v10;
      unsigned int v8 = v10 >> 8;
    }
    fr_SHA1Init((uint64_t)v32);
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    long long v18 = v30;
    int v19 = v31;
    fr_SHA1Transform((int *)v32, (unsigned int *)&v18);
    fr_SHA1FinalNoLen((uint64_t)&v26, (uint64_t)v32);
    unsigned int v11 = 0;
    for (uint64_t k = 19; k != -1; --k)
    {
      unsigned int v13 = v11 + *((unsigned __int8 *)&v30 + k) + *((unsigned __int8 *)&v26 + k);
      *((unsigned char *)v24 + k) = v13;
      unsigned int v11 = v13 >> 8;
    }
    unsigned int v14 = 0;
    for (uint64_t m = 19; m != -1; --m)
    {
      unsigned int v16 = v14 + *((unsigned __int8 *)v24 + m) + v22[m];
      *((unsigned char *)&v30 + m) = v16;
      unsigned int v14 = v16 >> 8;
    }
    *(_OWORD *)a2 = v28;
    *(_DWORD *)(a2 + 16) = v29;
    double result = *(double *)&v26;
    *(_OWORD *)(a2 + 20) = v26;
    *(_DWORD *)(a2 + 36) = v27;
    a2 += 40;
    ++v3;
  }
  while (v3 != 4);
  return result;
}

uint64_t fr_SHA1Transform(int *a1, unsigned int *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  HIDWORD(v5) = v3;
  LODWORD(v5) = v3;
  int v4 = v5 >> 2;
  unsigned int v6 = bswap32(*a2);
  HIDWORD(v5) = *a1;
  LODWORD(v5) = *a1;
  int v7 = a1[3];
  int v487 = a1[2];
  int v485 = v7;
  int v486 = v3;
  int v8 = (v5 >> 27) + a1[4] + v6 + (v487 & v3 | v7 & ~v3) + 1518500249;
  HIDWORD(v5) = v8;
  LODWORD(v5) = v8;
  int v9 = v5 >> 27;
  HIDWORD(v5) = v8;
  LODWORD(v5) = v8;
  int v10 = v5 >> 2;
  int v483 = v2;
  HIDWORD(v5) = *a1;
  LODWORD(v5) = *a1;
  int v11 = v5 >> 2;
  unsigned int v12 = bswap32(a2[1]);
  unsigned int v13 = v7 + v12 + (v2 & __ROR4__(v3, 2) | v487 & ~v2) + 1518500249 + v9;
  int v14 = v13 & __ROR4__(v8, 2);
  unint64_t v16 = __PAIR64__(v13, __ROR4__(v2, 2));
  int v15 = v8 & v16;
  LODWORD(v16) = v13;
  unsigned int v17 = bswap32(a2[2]);
  unsigned int v18 = v487 + v17 + (v15 | v4 & ~v8) + 1518500249 + (v16 >> 27);
  HIDWORD(v16) = v18;
  LODWORD(v16) = v18;
  unsigned int v19 = bswap32(a2[3]);
  int v20 = v4 + v19 + (v14 | v11 & ~v13) + 1518500249 + (v16 >> 27);
  HIDWORD(v16) = v20;
  LODWORD(v16) = v20;
  int v21 = v16 >> 2;
  HIDWORD(v16) = v13;
  LODWORD(v16) = v13;
  int v22 = v16 >> 2;
  HIDWORD(v16) = v20;
  LODWORD(v16) = v20;
  int v23 = v16 >> 27;
  unint64_t v25 = __PAIR64__(v18, __ROR4__(v13, 2));
  int v24 = v18 & v25;
  LODWORD(v25) = v18;
  int v26 = v25 >> 2;
  int v27 = v20 & __ROR4__(v18, 2);
  unsigned int v28 = bswap32(a2[4]);
  int v29 = v11 + v28 + (v24 | v10 & ~v18) + 1518500249 + v23;
  HIDWORD(v25) = v29;
  LODWORD(v25) = v29;
  unsigned int v30 = bswap32(a2[5]);
  unsigned int v31 = v30 + v10 + (v27 | v22 & ~v20) + 1518500249 + (v25 >> 27);
  HIDWORD(v25) = v31;
  LODWORD(v25) = v31;
  int v32 = v25 >> 27;
  unint64_t v34 = __PAIR64__(v31, __ROR4__(v20, 2));
  int v33 = v29 & v34;
  LODWORD(v34) = v31;
  int v35 = v34 >> 2;
  HIDWORD(v34) = v29;
  LODWORD(v34) = v29;
  int v36 = v34 >> 2;
  unsigned int v37 = bswap32(a2[6]);
  unsigned int v38 = v37 + v22 + (v33 | v26 & ~v29) + 1518500249 + v32;
  unint64_t v40 = __PAIR64__(v38, __ROR4__(v29, 2));
  int v39 = v31 & v40;
  LODWORD(v40) = v38;
  unsigned int v41 = bswap32(a2[7]);
  unsigned int v42 = v41 + v26 + (v39 | v21 & ~v31) + 1518500249 + (v40 >> 27);
  HIDWORD(v40) = v42;
  LODWORD(v40) = v42;
  unsigned int v43 = bswap32(a2[8]);
  int v44 = v43 + v21 + (v38 & __ROR4__(v31, 2) | v36 & ~v38) + 1518500249 + (v40 >> 27);
  HIDWORD(v40) = v44;
  LODWORD(v40) = v44;
  int v45 = v40 >> 2;
  HIDWORD(v40) = v38;
  LODWORD(v40) = v38;
  int v46 = v40 >> 2;
  HIDWORD(v40) = v44;
  LODWORD(v40) = v44;
  int v47 = v40 >> 27;
  unint64_t v49 = __PAIR64__(v42, __ROR4__(v38, 2));
  int v48 = v42 & v49;
  LODWORD(v49) = v42;
  int v50 = v49 >> 2;
  unsigned int v51 = bswap32(a2[9]);
  int v52 = v51 + v36 + (v48 | v35 & ~v42) + 1518500249 + v47;
  HIDWORD(v49) = v52;
  LODWORD(v49) = v52;
  unsigned int v475 = v51;
  unsigned int v479 = bswap32(a2[10]);
  unsigned int v53 = v479 + v35 + (v44 & __ROR4__(v42, 2) | v46 & ~v44) + 1518500249 + (v49 >> 27);
  HIDWORD(v49) = v53;
  LODWORD(v49) = v53;
  int v54 = v49 >> 27;
  unint64_t v56 = __PAIR64__(v53, __ROR4__(v44, 2));
  int v55 = v52 & v56;
  LODWORD(v56) = v53;
  int v57 = v56 >> 2;
  HIDWORD(v56) = v52;
  LODWORD(v56) = v52;
  int v58 = v56 >> 2;
  unsigned int v59 = bswap32(a2[11]);
  int v60 = v59 + v46 + (v55 | v50 & ~v52) + 1518500249 + v54;
  HIDWORD(v56) = v60;
  LODWORD(v56) = v60;
  unsigned int v61 = bswap32(a2[12]);
  int v62 = v61 + v50 + (v53 & __ROR4__(v52, 2) | v45 & ~v53) + 1518500249 + (v56 >> 27);
  HIDWORD(v56) = v62;
  LODWORD(v56) = v62;
  int v63 = v56 >> 27;
  HIDWORD(v56) = v62;
  LODWORD(v56) = v62;
  int v64 = v56 >> 2;
  HIDWORD(v56) = v60;
  LODWORD(v56) = v60;
  int v65 = v56 >> 2;
  int v66 = v62 & __ROR4__(v60, 2);
  unsigned int v67 = bswap32(a2[13]);
  int v68 = v67 + v45 + (v60 & __ROR4__(v53, 2) | v58 & ~v60) + 1518500249 + v63;
  HIDWORD(v56) = v68;
  LODWORD(v56) = v68;
  unsigned int v69 = bswap32(a2[14]);
  int v70 = v69 + v58 + (v66 | v57 & ~v62) + 1518500249 + (v56 >> 27);
  HIDWORD(v56) = v70;
  LODWORD(v56) = v70;
  int v71 = v56 >> 27;
  HIDWORD(v56) = v68;
  LODWORD(v56) = v68;
  int v72 = v56 >> 2;
  HIDWORD(v56) = v17 ^ v6 ^ v43 ^ v67;
  LODWORD(v56) = HIDWORD(v56);
  int v73 = v56 >> 31;
  int v74 = HIDWORD(v56);
  int v456 = HIDWORD(v56);
  unsigned int v75 = bswap32(a2[15]);
  int v76 = v75 + v57 + (v68 & __ROR4__(v62, 2) | v65 & ~v68) + 1518500249 + v71;
  HIDWORD(v56) = v76;
  LODWORD(v56) = v76;
  int v77 = v56 >> 27;
  HIDWORD(v56) = v70;
  LODWORD(v56) = v70;
  int v78 = v56 >> 2;
  int v79 = v19 ^ v12 ^ v51 ^ v69;
  HIDWORD(v56) = v79;
  LODWORD(v56) = v79;
  int v80 = v56 >> 31;
  int v81 = v73 + v65 + (v70 & __ROR4__(v68, 2) | v64 & ~v70) + 1518500249 + v77;
  HIDWORD(v56) = v81;
  LODWORD(v56) = v81;
  int v82 = v56 >> 27;
  HIDWORD(v56) = v76;
  LODWORD(v56) = v76;
  int v83 = v56 >> 2;
  HIDWORD(v56) = v28 ^ v17 ^ v479 ^ v75;
  LODWORD(v56) = HIDWORD(v56);
  int v459 = v56 >> 31;
  int v84 = HIDWORD(v56);
  int v85 = v80 + v64 + (v76 & __ROR4__(v70, 2) | v72 & ~v76) + 1518500249 + v82;
  HIDWORD(v56) = v85;
  LODWORD(v56) = v85;
  int v86 = v56 >> 27;
  LODWORD(v56) = v30 ^ v19 ^ v59 ^ __ROR4__(v74, 31);
  int v87 = v56;
  HIDWORD(v56) = v56;
  int v88 = v56 >> 31;
  int v89 = v459 + v72 + (v81 & __ROR4__(v76, 2) | v78 & ~v81) + 1518500249 + v86;
  HIDWORD(v56) = v89;
  LODWORD(v56) = v89;
  int v90 = v56 >> 27;
  HIDWORD(v56) = v85;
  LODWORD(v56) = v85;
  int v91 = v56 >> 2;
  int v93 = v88 + v78 + (v85 & __ROR4__(v81, 2) | v83 & ~v85) + 1518500249 + v90;
  LODWORD(v56) = v37 ^ v28 ^ v61 ^ __ROR4__(v79, 31);
  int v92 = v56;
  HIDWORD(v56) = v56;
  int v472 = v56 >> 31;
  HIDWORD(v56) = v93;
  LODWORD(v56) = v93;
  int v94 = v472 + v83 + (v91 ^ __ROR4__(v81, 2) ^ v89) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v81;
  LODWORD(v56) = v81;
  int v95 = v56 >> 2;
  HIDWORD(v56) = v89;
  LODWORD(v56) = v89;
  int v96 = v56 >> 2;
  int v97 = v84;
  LODWORD(v56) = v41 ^ v30 ^ v67 ^ __ROR4__(v84, 31);
  int v98 = v56;
  HIDWORD(v56) = v56;
  int v466 = v56 >> 31;
  int v99 = v466 + v95 + (v96 ^ __ROR4__(v85, 2) ^ v93) + 1859775393;
  HIDWORD(v56) = v94;
  LODWORD(v56) = v94;
  int v100 = v56 >> 27;
  HIDWORD(v56) = v93;
  LODWORD(v56) = v93;
  int v101 = v56 >> 2;
  int v102 = v99 + v100;
  int v104 = v87;
  LODWORD(v56) = v43 ^ v37 ^ v69 ^ __ROR4__(v87, 31);
  int v103 = v56;
  HIDWORD(v56) = v56;
  int v453 = v56 >> 31;
  HIDWORD(v56) = v102;
  LODWORD(v56) = v102;
  int v105 = v453 + v91 + (v101 ^ __ROR4__(v89, 2) ^ v94) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v94;
  LODWORD(v56) = v94;
  int v106 = v56 >> 2;
  int v107 = v106 ^ __ROR4__(v93, 2);
  LODWORD(v56) = v475 ^ v41 ^ v75 ^ __ROR4__(v92, 31);
  int v108 = v56;
  HIDWORD(v56) = v56;
  int v442 = v56 >> 31;
  int v109 = v442 + v96 + (v107 ^ v102) + 1859775393;
  HIDWORD(v56) = v105;
  LODWORD(v56) = v105;
  int v110 = v56 >> 27;
  HIDWORD(v56) = v102;
  LODWORD(v56) = v102;
  int v111 = v56 >> 2;
  int v112 = v109 + v110;
  LODWORD(v56) = v479 ^ v43 ^ __ROR4__(v456, 31) ^ __ROR4__(v98, 31);
  int v113 = v56;
  HIDWORD(v56) = v56;
  int v440 = v56 >> 31;
  HIDWORD(v56) = v112;
  LODWORD(v56) = v112;
  int v114 = v440 + v101 + (v111 ^ __ROR4__(v94, 2) ^ v105) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v105;
  LODWORD(v56) = v105;
  int v115 = v56 >> 2;
  int v116 = v115 ^ __ROR4__(v102, 2);
  int v117 = v59 ^ v475 ^ __ROR4__(v79, 31) ^ __ROR4__(v103, 31);
  HIDWORD(v56) = v117;
  LODWORD(v56) = v117;
  int v118 = v56 >> 31;
  int v119 = v118 + v106 + (v116 ^ v112) + 1859775393;
  HIDWORD(v56) = v114;
  LODWORD(v56) = v114;
  int v120 = v56 >> 27;
  HIDWORD(v56) = v112;
  LODWORD(v56) = v112;
  int v121 = v56 >> 2;
  int v122 = v119 + v120;
  unsigned int v123 = v61;
  int v124 = v61 ^ v479 ^ __ROR4__(v97, 31) ^ __ROR4__(v108, 31);
  HIDWORD(v56) = v124;
  LODWORD(v56) = v124;
  int v469 = v56 >> 31;
  HIDWORD(v56) = v122;
  LODWORD(v56) = v122;
  int v125 = v469 + v111 + (v121 ^ __ROR4__(v105, 2) ^ v114) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v114;
  LODWORD(v56) = v114;
  int v126 = v56 >> 2;
  int v127 = v67 ^ v59 ^ __ROR4__(v87, 31) ^ __ROR4__(v113, 31);
  HIDWORD(v56) = v127;
  LODWORD(v56) = v127;
  int v476 = v56 >> 31;
  int v128 = v476 + v115 + (v126 ^ __ROR4__(v112, 2) ^ v122) + 1859775393;
  HIDWORD(v56) = v125;
  LODWORD(v56) = v125;
  int v129 = v56 >> 27;
  HIDWORD(v56) = v122;
  LODWORD(v56) = v122;
  int v130 = v56 >> 2;
  int v131 = v128 + v129;
  LODWORD(v56) = v69 ^ v123 ^ __ROR4__(v92, 31) ^ __ROR4__(v117, 31);
  int v132 = v56;
  HIDWORD(v56) = v56;
  int v450 = v56 >> 31;
  HIDWORD(v56) = v128 + v129;
  LODWORD(v56) = v128 + v129;
  int v133 = v450 + v121 + (v130 ^ __ROR4__(v114, 2) ^ v125) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v125;
  LODWORD(v56) = v125;
  int v134 = v56 >> 2;
  int v135 = v134 ^ __ROR4__(v122, 2) ^ (v128 + v129);
  LODWORD(v56) = v75 ^ v67 ^ __ROR4__(v98, 31) ^ __ROR4__(v124, 31);
  int v136 = v56;
  HIDWORD(v56) = v56;
  int v463 = v56 >> 31;
  int v137 = v463 + v126 + v135 + 1859775393;
  HIDWORD(v56) = v133;
  LODWORD(v56) = v133;
  int v138 = v56 >> 27;
  HIDWORD(v56) = v131;
  LODWORD(v56) = v131;
  int v139 = v56 >> 2;
  unsigned int v140 = v137 + v138;
  LODWORD(v56) = v69 ^ __ROR4__(v456, 31) ^ __ROR4__(v103, 31) ^ __ROR4__(v127, 31);
  int v141 = v56;
  HIDWORD(v56) = v56;
  int v480 = v56 >> 31;
  HIDWORD(v56) = v140;
  LODWORD(v56) = v140;
  unsigned int v142 = v480 + v130 + (v139 ^ __ROR4__(v125, 2) ^ v133) + 1859775393 + (v56 >> 27);
  HIDWORD(v56) = v133;
  LODWORD(v56) = v133;
  int v143 = v56 >> 2;
  LODWORD(v56) = v75 ^ __ROR4__(v79, 31) ^ __ROR4__(v108, 31) ^ __ROR4__(v132, 31);
  int v144 = v56;
  HIDWORD(v56) = v56;
  int v145 = v56 >> 31;
  HIDWORD(v56) = v142;
  LODWORD(v56) = v142;
  unsigned int v146 = v145 + v134 + (v143 ^ __ROR4__(v131, 2) ^ v140) + 1859775393 + (v56 >> 27);
  unint64_t v148 = __PAIR64__(v140, __ROR4__(v456, 31));
  int v147 = v459 ^ v148;
  LODWORD(v148) = v140;
  int v149 = v148 >> 2;
  LODWORD(v148) = v147 ^ __ROR4__(v113, 31) ^ __ROR4__(v136, 31);
  int v150 = v148;
  HIDWORD(v148) = v148;
  int v460 = v148 >> 31;
  HIDWORD(v148) = v146;
  LODWORD(v148) = v146;
  unsigned int v151 = v460 + v139 + (v149 ^ __ROR4__(v133, 2) ^ v142) + 1859775393 + (v148 >> 27);
  unint64_t v153 = __PAIR64__(v142, __ROR4__(v79, 31));
  int v152 = v88 ^ v153;
  LODWORD(v153) = v142;
  int v154 = v153 >> 2;
  LODWORD(v153) = v152 ^ __ROR4__(v117, 31) ^ __ROR4__(v141, 31);
  int v155 = v153;
  HIDWORD(v153) = v153;
  int v457 = v153 >> 31;
  HIDWORD(v153) = v151;
  LODWORD(v153) = v151;
  unsigned int v156 = v457 + v143 + (v154 ^ __ROR4__(v140, 2) ^ v146) + 1859775393 + (v153 >> 27);
  unint64_t v158 = __PAIR64__(v146, __ROR4__(v97, 31));
  int v157 = v472 ^ v158;
  LODWORD(v158) = v146;
  int v159 = v158 >> 2;
  LODWORD(v158) = v157 ^ __ROR4__(v124, 31) ^ __ROR4__(v144, 31);
  int v160 = v158;
  HIDWORD(v158) = v158;
  int v448 = v158 >> 31;
  HIDWORD(v158) = v156;
  LODWORD(v158) = v156;
  unsigned int v161 = v448 + v149 + (v159 ^ __ROR4__(v142, 2) ^ v151) + 1859775393 + (v158 >> 27);
  unint64_t v163 = __PAIR64__(v151, __ROR4__(v104, 31));
  int v162 = v466 ^ v163;
  LODWORD(v163) = v151;
  int v164 = v163 >> 2;
  LODWORD(v163) = v162 ^ __ROR4__(v127, 31) ^ __ROR4__(v150, 31);
  int v165 = v163;
  HIDWORD(v163) = v163;
  int v446 = v163 >> 31;
  HIDWORD(v163) = v161;
  LODWORD(v163) = v161;
  unsigned int v166 = v446 + v154 + (v164 ^ __ROR4__(v146, 2) ^ v156) + 1859775393 + (v163 >> 27);
  unint64_t v168 = __PAIR64__(v156, __ROR4__(v92, 31));
  int v167 = v453 ^ v168;
  LODWORD(v168) = v156;
  int v169 = v168 >> 2;
  LODWORD(v168) = v167 ^ __ROR4__(v132, 31) ^ __ROR4__(v155, 31);
  int v170 = v168;
  HIDWORD(v168) = v168;
  int v444 = v168 >> 31;
  HIDWORD(v168) = v166;
  LODWORD(v168) = v166;
  unsigned int v171 = v444 + v159 + (v169 ^ __ROR4__(v151, 2) ^ v161) + 1859775393 + (v168 >> 27);
  unint64_t v173 = __PAIR64__(v161, __ROR4__(v98, 31));
  int v172 = v442 ^ v173;
  LODWORD(v173) = v161;
  int v174 = v173 >> 2;
  LODWORD(v173) = v172 ^ __ROR4__(v136, 31) ^ __ROR4__(v160, 31);
  int v175 = v173;
  HIDWORD(v173) = v173;
  int v176 = v173 >> 31;
  HIDWORD(v173) = v171;
  LODWORD(v173) = v171;
  unsigned int v177 = v176 + v164 + (v174 ^ __ROR4__(v156, 2) ^ v166) + 1859775393 + (v173 >> 27);
  unint64_t v179 = __PAIR64__(v166, __ROR4__(v103, 31));
  int v178 = v440 ^ v179;
  LODWORD(v179) = v166;
  int v180 = v179 >> 2;
  LODWORD(v179) = v178 ^ __ROR4__(v141, 31) ^ __ROR4__(v165, 31);
  int v181 = v179;
  HIDWORD(v179) = v179;
  int v454 = v179 >> 31;
  HIDWORD(v179) = v177;
  LODWORD(v179) = v177;
  unsigned int v182 = v454 + v169 + (v180 ^ __ROR4__(v161, 2) ^ v171) + 1859775393 + (v179 >> 27);
  unint64_t v184 = __PAIR64__(v171, __ROR4__(v108, 31));
  int v183 = v118 ^ v184;
  LODWORD(v184) = v171;
  int v185 = v184 >> 2;
  LODWORD(v184) = v183 ^ __ROR4__(v144, 31) ^ __ROR4__(v170, 31);
  int v186 = v184;
  HIDWORD(v184) = v184;
  int v473 = v184 >> 31;
  HIDWORD(v184) = v182;
  LODWORD(v184) = v182;
  unsigned int v187 = v473 + v174 + (v185 ^ __ROR4__(v166, 2) ^ v177) + 1859775393 + (v184 >> 27);
  LODWORD(v184) = v469 ^ __ROR4__(v113, 31) ^ __ROR4__(v150, 31) ^ __ROR4__(v175, 31);
  int v188 = v184;
  HIDWORD(v184) = v184;
  int v470 = v184 >> 31;
  HIDWORD(v184) = v187;
  LODWORD(v184) = v187;
  unsigned int v189 = v470
       + v180
       + ((v182 | __ROR4__(v177, 2)) & __ROR4__(v171, 2) | v182 & __ROR4__(v177, 2))
       + (v184 >> 27)
       - 1894007588;
  int v190 = v476 ^ __ROR4__(v117, 31) ^ __ROR4__(v155, 31) ^ __ROR4__(v181, 31);
  HIDWORD(v184) = v190;
  LODWORD(v184) = v190;
  int v467 = v184 >> 31;
  HIDWORD(v184) = v189;
  LODWORD(v184) = v189;
  int v191 = v467 + v185 + ((v187 | __ROR4__(v182, 2)) & __ROR4__(v177, 2) | v187 & __ROR4__(v182, 2)) + (v184 >> 27);
  unint64_t v193 = __PAIR64__(v177, __ROR4__(v124, 31));
  int v192 = v450 ^ v193;
  LODWORD(v193) = v177;
  int v194 = v193 >> 2;
  HIDWORD(v193) = v192 ^ __ROR4__(v160, 31) ^ __ROR4__(v186, 31);
  LODWORD(v193) = HIDWORD(v193);
  int v195 = HIDWORD(v193);
  int v477 = v193 >> 31;
  unsigned int v196 = v191 - 1894007588;
  HIDWORD(v193) = v191 - 1894007588;
  LODWORD(v193) = v191 - 1894007588;
  unsigned int v197 = v477 + v194 + ((v189 | __ROR4__(v187, 2)) & __ROR4__(v182, 2) | v189 & __ROR4__(v187, 2)) + (v193 >> 27);
  int v198 = ((v191 - 1894007588) | __ROR4__(v189, 2)) & __ROR4__(v187, 2) | (v191 - 1894007588) & __ROR4__(v189, 2);
  unint64_t v200 = __PAIR64__(v182, __ROR4__(v127, 31));
  int v199 = v463 ^ v200;
  LODWORD(v200) = v182;
  int v201 = v200 >> 2;
  LODWORD(v200) = v199 ^ __ROR4__(v165, 31) ^ __ROR4__(v188, 31);
  int v202 = v200;
  HIDWORD(v200) = v200;
  int v451 = v200 >> 31;
  v197 -= 1894007588;
  HIDWORD(v200) = v197;
  LODWORD(v200) = v197;
  unsigned int v203 = v451 + v201 + v198 + (v200 >> 27);
  unint64_t v205 = __PAIR64__(v187, __ROR4__(v132, 31));
  int v204 = v480 ^ v205;
  LODWORD(v205) = v187;
  int v206 = v205 >> 2;
  v203 -= 1894007588;
  LODWORD(v205) = v204 ^ __ROR4__(v170, 31) ^ __ROR4__(v190, 31);
  int v207 = v205;
  HIDWORD(v205) = v205;
  int v464 = v205 >> 31;
  HIDWORD(v205) = v203;
  LODWORD(v205) = v203;
  unsigned int v208 = v464 + v206 + ((v197 | __ROR4__(v196, 2)) & __ROR4__(v189, 2) | v197 & __ROR4__(v196, 2)) + (v205 >> 27);
  unint64_t v210 = __PAIR64__(v189, __ROR4__(v136, 31));
  int v209 = v145 ^ v210;
  LODWORD(v210) = v189;
  int v211 = v210 >> 2;
  int v212 = v209 ^ __ROR4__(v175, 31) ^ __ROR4__(v195, 31);
  int v213 = v195;
  unint64_t v215 = __PAIR64__(v212, __ROR4__(v197, 2));
  int v214 = v203 & v215;
  LODWORD(v215) = v212;
  int v481 = v215 >> 31;
  v208 -= 1894007588;
  HIDWORD(v215) = v208;
  LODWORD(v215) = v208;
  int v216 = v481 + v211 + ((v203 | __ROR4__(v197, 2)) & __ROR4__(v196, 2) | v214) + (v215 >> 27);
  unint64_t v218 = __PAIR64__(v196, __ROR4__(v141, 31));
  int v217 = v460 ^ v218;
  LODWORD(v218) = v196;
  int v219 = v218 >> 2;
  int v220 = v217 ^ __ROR4__(v181, 31) ^ __ROR4__(v202, 31);
  int v438 = v207;
  int v439 = v202;
  HIDWORD(v218) = v220;
  LODWORD(v218) = v220;
  int v461 = v218 >> 31;
  int v221 = v461 + v219 + ((v208 | __ROR4__(v203, 2)) & __ROR4__(v197, 2) | v208 & __ROR4__(v203, 2));
  unsigned int v222 = v216 - 1894007588;
  HIDWORD(v218) = v216 - 1894007588;
  LODWORD(v218) = v216 - 1894007588;
  int v223 = v221 + (v218 >> 27);
  unint64_t v224 = __PAIR64__(v197, __ROR4__(v208, 2));
  int v225 = (v222 | __ROR4__(v208, 2)) & __ROR4__(v203, 2) | v222 & v224;
  LODWORD(v224) = v197;
  int v226 = v224 >> 2;
  int v228 = v207;
  LODWORD(v224) = v457 ^ __ROR4__(v144, 31) ^ __ROR4__(v186, 31) ^ __ROR4__(v207, 31);
  int v227 = v224;
  HIDWORD(v224) = v224;
  int v458 = v224 >> 31;
  int v229 = v458 + v226 + v225;
  unsigned int v230 = v223 - 1894007588;
  HIDWORD(v224) = v223 - 1894007588;
  LODWORD(v224) = v223 - 1894007588;
  int v231 = v229 + (v224 >> 27);
  unint64_t v233 = __PAIR64__(v203, __ROR4__(v150, 31));
  int v232 = v448 ^ v233;
  LODWORD(v233) = v203;
  int v234 = v233 >> 2;
  LODWORD(v233) = v232 ^ __ROR4__(v188, 31) ^ __ROR4__(v212, 31);
  int v235 = v233;
  HIDWORD(v233) = v233;
  int v449 = v233 >> 31;
  unsigned int v236 = v231 - 1894007588;
  HIDWORD(v233) = v231 - 1894007588;
  LODWORD(v233) = v231 - 1894007588;
  unsigned int v237 = v449 + v234 + ((v230 | __ROR4__(v222, 2)) & __ROR4__(v208, 2) | v230 & __ROR4__(v222, 2)) + (v233 >> 27);
  int v238 = ((v231 - 1894007588) | __ROR4__(v230, 2)) & __ROR4__(v222, 2) | (v231 - 1894007588) & __ROR4__(v230, 2);
  unint64_t v240 = __PAIR64__(v208, __ROR4__(v155, 31));
  int v239 = v446 ^ v240;
  LODWORD(v240) = v208;
  int v241 = v240 >> 2;
  int v242 = v239 ^ __ROR4__(v190, 31) ^ __ROR4__(v220, 31);
  int v243 = v220;
  HIDWORD(v240) = v242;
  LODWORD(v240) = v242;
  int v447 = v240 >> 31;
  v237 -= 1894007588;
  HIDWORD(v240) = v237;
  LODWORD(v240) = v237;
  unsigned int v244 = v447 + v241 + v238 + (v240 >> 27);
  unint64_t v246 = __PAIR64__(v222, __ROR4__(v160, 31));
  int v245 = v444 ^ v246;
  LODWORD(v246) = v222;
  int v247 = v246 >> 2;
  v244 -= 1894007588;
  LODWORD(v246) = v245 ^ __ROR4__(v195, 31) ^ __ROR4__(v227, 31);
  int v248 = v246;
  HIDWORD(v246) = v246;
  int v445 = v246 >> 31;
  HIDWORD(v246) = v244;
  LODWORD(v246) = v244;
  unsigned int v249 = v445 + v247 + ((v237 | __ROR4__(v236, 2)) & __ROR4__(v230, 2) | v237 & __ROR4__(v236, 2)) + (v246 >> 27);
  unint64_t v251 = __PAIR64__(v230, __ROR4__(v165, 31));
  int v250 = v176 ^ v251;
  LODWORD(v251) = v230;
  int v252 = v251 >> 2;
  int v253 = v250 ^ __ROR4__(v439, 31);
  LODWORD(v251) = __ROR4__(v235, 31);
  int v254 = v253 ^ v251;
  int v436 = v235;
  int v437 = v242;
  unint64_t v256 = __PAIR64__(v253 ^ v251, __ROR4__(v237, 2));
  int v255 = v244 & v256;
  LODWORD(v256) = v254;
  int v443 = v256 >> 31;
  v249 -= 1894007588;
  HIDWORD(v256) = v249;
  LODWORD(v256) = v249;
  unsigned int v257 = v443 + v252 + ((v244 | __ROR4__(v237, 2)) & __ROR4__(v236, 2) | v255) + (v256 >> 27);
  unint64_t v259 = __PAIR64__(v236, __ROR4__(v170, 31));
  int v258 = v454 ^ v259;
  LODWORD(v259) = v236;
  int v260 = v259 >> 2;
  LODWORD(v259) = v258 ^ __ROR4__(v228, 31) ^ __ROR4__(v242, 31);
  int v261 = v259;
  HIDWORD(v259) = v259;
  int v455 = v259 >> 31;
  v257 -= 1894007588;
  HIDWORD(v259) = v257;
  LODWORD(v259) = v257;
  unsigned int v262 = v455 + v260 + ((v249 | __ROR4__(v244, 2)) & __ROR4__(v237, 2) | v249 & __ROR4__(v244, 2)) + (v259 >> 27);
  unint64_t v263 = __PAIR64__(v237, __ROR4__(v249, 2));
  int v264 = (v257 | __ROR4__(v249, 2)) & __ROR4__(v244, 2) | v257 & v263;
  LODWORD(v263) = v237;
  int v265 = v263 >> 2;
  LODWORD(v263) = v473 ^ __ROR4__(v175, 31) ^ __ROR4__(v212, 31) ^ __ROR4__(v248, 31);
  int v266 = v263;
  HIDWORD(v263) = v263;
  int v441 = v263 >> 31;
  v262 -= 1894007588;
  HIDWORD(v263) = v262;
  LODWORD(v263) = v262;
  unsigned int v267 = v441 + v265 + v264 + (v263 >> 27);
  unint64_t v269 = __PAIR64__(v244, __ROR4__(v181, 31));
  int v268 = v470 ^ v269;
  LODWORD(v269) = v244;
  int v270 = v269 >> 2;
  int v271 = v243;
  int v272 = v268 ^ __ROR4__(v243, 31) ^ __ROR4__(v254, 31);
  int v273 = v254;
  int v435 = v254;
  HIDWORD(v269) = v272;
  LODWORD(v269) = v272;
  int v474 = v269 >> 31;
  v267 -= 1894007588;
  HIDWORD(v269) = v267;
  LODWORD(v269) = v267;
  unsigned int v274 = v474 + v270 + ((v262 | __ROR4__(v257, 2)) & __ROR4__(v249, 2) | v262 & __ROR4__(v257, 2)) + (v269 >> 27);
  unint64_t v276 = __PAIR64__(v249, __ROR4__(v186, 31));
  int v275 = v467 ^ v276;
  LODWORD(v276) = v249;
  int v277 = v276 >> 2;
  int v278 = v227;
  LODWORD(v276) = v275 ^ __ROR4__(v227, 31) ^ __ROR4__(v261, 31);
  int v279 = v276;
  HIDWORD(v276) = v276;
  int v471 = v276 >> 31;
  v274 -= 1894007588;
  HIDWORD(v276) = v274;
  LODWORD(v276) = v274;
  int v280 = v471 + v277 + ((v267 | __ROR4__(v262, 2)) & __ROR4__(v257, 2) | v267 & __ROR4__(v262, 2)) + (v276 >> 27);
  unint64_t v282 = __PAIR64__(v257, __ROR4__(v188, 31));
  int v281 = v477 ^ v282;
  LODWORD(v282) = v257;
  int v283 = v282 >> 2;
  LODWORD(v282) = v281 ^ __ROR4__(v235, 31) ^ __ROR4__(v266, 31);
  int v284 = v282;
  HIDWORD(v282) = v282;
  int v478 = v282 >> 31;
  HIDWORD(v282) = v280 - 1894007588;
  LODWORD(v282) = v280 - 1894007588;
  int v285 = v478 + v283 + ((v274 | __ROR4__(v267, 2)) & __ROR4__(v262, 2) | v274 & __ROR4__(v267, 2)) + (v282 >> 27);
  unint64_t v287 = __PAIR64__(v262, __ROR4__(v190, 31));
  int v286 = v451 ^ v287;
  LODWORD(v287) = v262;
  int v288 = v287 >> 2;
  int v289 = v286 ^ __ROR4__(v242, 31);
  LODWORD(v287) = __ROR4__(v272, 31);
  int v290 = v289 ^ v287;
  unint64_t v292 = __PAIR64__(v289 ^ v287, __ROR4__(v274, 2));
  int v291 = (v280 - 1894007588) & v292;
  LODWORD(v292) = v290;
  int v468 = v292 >> 31;
  HIDWORD(v292) = v285 - 1894007588;
  LODWORD(v292) = v285 - 1894007588;
  int v293 = v468 + v288 + (((v280 - 1894007588) | __ROR4__(v274, 2)) & __ROR4__(v267, 2) | v291) + (v292 >> 27);
  unint64_t v295 = __PAIR64__(v267, __ROR4__(v213, 31));
  int v294 = v464 ^ v295;
  LODWORD(v295) = v267;
  int v296 = v295 >> 2;
  int v297 = v248;
  LODWORD(v295) = v294 ^ __ROR4__(v248, 31) ^ __ROR4__(v279, 31);
  int v298 = v295;
  HIDWORD(v295) = v295;
  int v465 = v295 >> 31;
  v293 -= 1894007588;
  HIDWORD(v295) = v293;
  LODWORD(v295) = v293;
  int v299 = v465
       + v296
       + (((v285 - 1894007588) | __ROR4__(v280 - 1894007588, 2)) & __ROR4__(v274, 2) | (v285 - 1894007588) & __ROR4__(v280 - 1894007588, 2))
       + (v295 >> 27);
  unint64_t v300 = __PAIR64__(v274, __ROR4__(v285 - 1894007588, 2));
  int v301 = (v293 | __ROR4__(v285 - 1894007588, 2)) & __ROR4__(v280 - 1894007588, 2) | v293 & v300;
  LODWORD(v300) = v274;
  int v302 = v300 >> 2;
  LODWORD(v300) = v481 ^ __ROR4__(v439, 31) ^ __ROR4__(v273, 31) ^ __ROR4__(v284, 31);
  int v303 = v300;
  HIDWORD(v300) = v300;
  int v452 = v300 >> 31;
  HIDWORD(v300) = v299 - 1894007588;
  LODWORD(v300) = v299 - 1894007588;
  unsigned int v304 = v452 + v302 + v301 + (v300 >> 27) - 1894007588;
  unint64_t v306 = __PAIR64__(v280 - 1894007588, __ROR4__(v438, 31));
  int v305 = v461 ^ v306;
  LODWORD(v306) = v280 - 1894007588;
  int v307 = v306 >> 2;
  HIDWORD(v306) = v293;
  LODWORD(v306) = v293;
  int v308 = v306 >> 2;
  LODWORD(v306) = v305 ^ __ROR4__(v261, 31) ^ __ROR4__(v290, 31);
  int v309 = v306;
  HIDWORD(v306) = v306;
  int v482 = v306 >> 31;
  HIDWORD(v306) = v304;
  LODWORD(v306) = v304;
  unsigned int v310 = v482 + v307 + (v308 ^ __ROR4__(v285 - 1894007588, 2) ^ (v299 - 1894007588)) - 899497514 + (v306 >> 27);
  unint64_t v312 = __PAIR64__(v285 - 1894007588, __ROR4__(v212, 31));
  int v311 = v458 ^ v312;
  LODWORD(v312) = v285 - 1894007588;
  int v313 = v312 >> 2;
  HIDWORD(v312) = v299 - 1894007588;
  LODWORD(v312) = v299 - 1894007588;
  int v314 = v312 >> 2;
  LODWORD(v312) = v311 ^ __ROR4__(v266, 31) ^ __ROR4__(v298, 31);
  int v315 = v312;
  HIDWORD(v312) = v312;
  int v316 = v312 >> 31;
  HIDWORD(v312) = v310;
  LODWORD(v312) = v310;
  unsigned int v317 = v316 + v313 + (v314 ^ __ROR4__(v293, 2) ^ v304) - 899497514 + (v312 >> 27);
  unint64_t v319 = __PAIR64__(v304, __ROR4__(v271, 31));
  int v318 = v449 ^ v319;
  LODWORD(v319) = v304;
  int v320 = v319 >> 2;
  LODWORD(v319) = v318 ^ __ROR4__(v272, 31) ^ __ROR4__(v303, 31);
  int v321 = v319;
  HIDWORD(v319) = v319;
  int v322 = v319 >> 31;
  HIDWORD(v319) = v317;
  LODWORD(v319) = v317;
  unsigned int v323 = v322 + v308 + (v320 ^ __ROR4__(v299 - 1894007588, 2) ^ v310) - 899497514 + (v319 >> 27);
  unint64_t v325 = __PAIR64__(v310, __ROR4__(v278, 31));
  int v324 = v447 ^ v325;
  LODWORD(v325) = v310;
  int v326 = v325 >> 2;
  int v327 = v326 ^ __ROR4__(v304, 2) ^ v317;
  LODWORD(v325) = v324 ^ __ROR4__(v279, 31) ^ __ROR4__(v309, 31);
  int v328 = v325;
  HIDWORD(v325) = v325;
  int v329 = v325 >> 31;
  HIDWORD(v325) = v323;
  LODWORD(v325) = v323;
  unsigned int v330 = v329 + v314 + v327 - 899497514 + (v325 >> 27);
  unint64_t v332 = __PAIR64__(v317, __ROR4__(v436, 31));
  int v331 = v445 ^ v332;
  LODWORD(v332) = v317;
  int v333 = v332 >> 2;
  LODWORD(v332) = v331 ^ __ROR4__(v284, 31) ^ __ROR4__(v315, 31);
  int v334 = v332;
  HIDWORD(v332) = v332;
  int v462 = v332 >> 31;
  HIDWORD(v332) = v330;
  LODWORD(v332) = v330;
  int v335 = v462 + v320 + (v333 ^ __ROR4__(v310, 2) ^ v323) - 899497514 + (v332 >> 27);
  unint64_t v337 = __PAIR64__(v323, __ROR4__(v437, 31));
  int v336 = v443 ^ v337;
  LODWORD(v337) = v323;
  int v338 = v337 >> 2;
  LODWORD(v337) = v336 ^ __ROR4__(v290, 31) ^ __ROR4__(v321, 31);
  int v339 = v337;
  HIDWORD(v337) = v337;
  int v340 = v337 >> 31;
  HIDWORD(v337) = v335;
  LODWORD(v337) = v335;
  unsigned int v341 = v340 + v326 + (v338 ^ __ROR4__(v317, 2) ^ v330) - 899497514 + (v337 >> 27);
  unint64_t v343 = __PAIR64__(v330, __ROR4__(v328, 31));
  int v342 = v455 ^ __ROR4__(v297, 31) ^ __ROR4__(v298, 31) ^ v343;
  LODWORD(v343) = v330;
  int v344 = v343 >> 2;
  HIDWORD(v343) = v342;
  LODWORD(v343) = v342;
  int v345 = (v343 >> 31) + v333 + (v344 ^ __ROR4__(v323, 2) ^ v335);
  unint64_t v347 = __PAIR64__(v341, __ROR4__(v334, 31));
  int v346 = v441 ^ __ROR4__(v435, 31) ^ __ROR4__(v303, 31) ^ v347;
  LODWORD(v347) = v341;
  int v348 = v347 >> 27;
  HIDWORD(v347) = v346;
  LODWORD(v347) = v346;
  unsigned int v349 = v345 - 899497514 + v348;
  int v350 = (v347 >> 31) + v338;
  HIDWORD(v347) = v335;
  LODWORD(v347) = v335;
  int v351 = v347 >> 2;
  unint64_t v352 = __PAIR64__(v349, __ROR4__(v330, 2));
  int v353 = v350 + (v351 ^ v352 ^ v341) - 899497514;
  LODWORD(v352) = v349;
  unsigned int v354 = v353 + (v352 >> 27);
  unint64_t v356 = __PAIR64__(v341, __ROR4__(v339, 31));
  int v355 = v474 ^ __ROR4__(v261, 31) ^ __ROR4__(v309, 31) ^ v356;
  LODWORD(v356) = v341;
  int v357 = v356 >> 2;
  HIDWORD(v356) = v355;
  LODWORD(v356) = v355;
  int v358 = (v356 >> 31) + v344 + (v357 ^ __ROR4__(v335, 2) ^ v349);
  unint64_t v360 = __PAIR64__(v354, __ROR4__(v342, 31));
  int v359 = v471 ^ __ROR4__(v266, 31) ^ __ROR4__(v315, 31) ^ v360;
  LODWORD(v360) = v354;
  int v361 = v360 >> 27;
  HIDWORD(v360) = v359;
  LODWORD(v360) = v359;
  unsigned int v362 = v358 - 899497514 + v361;
  int v363 = (v360 >> 31) + v351;
  HIDWORD(v360) = v349;
  LODWORD(v360) = v349;
  int v364 = v360 >> 2;
  unint64_t v365 = __PAIR64__(v362, __ROR4__(v341, 2));
  int v366 = v363 + (v364 ^ v365 ^ v354) - 899497514;
  LODWORD(v365) = v362;
  unsigned int v367 = v366 + (v365 >> 27);
  unint64_t v369 = __PAIR64__(v354, __ROR4__(v346, 31));
  int v368 = v478 ^ __ROR4__(v272, 31) ^ __ROR4__(v321, 31) ^ v369;
  LODWORD(v369) = v354;
  int v370 = v369 >> 2;
  HIDWORD(v369) = v368;
  LODWORD(v369) = v368;
  int v371 = (v369 >> 31) + v357 + (v370 ^ __ROR4__(v349, 2) ^ v362);
  unint64_t v373 = __PAIR64__(v367, __ROR4__(v355, 31));
  int v372 = v468 ^ __ROR4__(v279, 31) ^ __ROR4__(v328, 31) ^ v373;
  LODWORD(v373) = v367;
  int v374 = v373 >> 27;
  HIDWORD(v373) = v372;
  LODWORD(v373) = v372;
  unsigned int v375 = v371 - 899497514 + v374;
  int v376 = (v373 >> 31) + v364;
  HIDWORD(v373) = v362;
  LODWORD(v373) = v362;
  int v377 = v373 >> 2;
  unint64_t v378 = __PAIR64__(v375, __ROR4__(v354, 2));
  int v379 = v376 + (v377 ^ v378 ^ v367) - 899497514;
  LODWORD(v378) = v375;
  unsigned int v380 = v379 + (v378 >> 27);
  unint64_t v382 = __PAIR64__(v367, __ROR4__(v359, 31));
  int v381 = v465 ^ __ROR4__(v284, 31) ^ __ROR4__(v334, 31) ^ v382;
  LODWORD(v382) = v367;
  int v383 = v382 >> 2;
  HIDWORD(v382) = v381;
  LODWORD(v382) = v381;
  int v384 = (v382 >> 31) + v370 + (v383 ^ __ROR4__(v362, 2) ^ v375);
  unint64_t v386 = __PAIR64__(v380, __ROR4__(v368, 31));
  int v385 = v452 ^ __ROR4__(v290, 31) ^ __ROR4__(v339, 31) ^ v386;
  LODWORD(v386) = v380;
  int v387 = v386 >> 27;
  HIDWORD(v386) = v385;
  LODWORD(v386) = v385;
  unsigned int v388 = v384 - 899497514 + v387;
  int v389 = (v386 >> 31) + v377;
  HIDWORD(v386) = v375;
  LODWORD(v386) = v375;
  int v390 = v386 >> 2;
  unint64_t v391 = __PAIR64__(v388, __ROR4__(v367, 2));
  int v392 = v389 + (v390 ^ v391 ^ v380) - 899497514;
  LODWORD(v391) = v388;
  unsigned int v393 = v392 + (v391 >> 27);
  unint64_t v395 = __PAIR64__(v380, __ROR4__(v342, 31));
  int v394 = v482 ^ __ROR4__(v298, 31) ^ v395;
  LODWORD(v395) = v380;
  int v396 = v395 >> 2;
  int v397 = v394 ^ __ROR4__(v372, 31);
  HIDWORD(v395) = v397;
  LODWORD(v395) = v397;
  int v398 = (v395 >> 31) + v383 + (v396 ^ __ROR4__(v375, 2) ^ v388);
  unint64_t v400 = __PAIR64__(v393, __ROR4__(v346, 31));
  int v399 = v316 ^ __ROR4__(v303, 31) ^ v400;
  LODWORD(v400) = v393;
  int v401 = v400 >> 27;
  int v402 = v399 ^ __ROR4__(v381, 31);
  HIDWORD(v400) = v402;
  LODWORD(v400) = v402;
  unsigned int v403 = v398 - 899497514 + v401;
  int v404 = (v400 >> 31) + v390;
  HIDWORD(v400) = v388;
  LODWORD(v400) = v388;
  int v405 = v400 >> 2;
  unint64_t v406 = __PAIR64__(v403, __ROR4__(v380, 2));
  int v407 = v404 + (v405 ^ v406 ^ v393);
  LODWORD(v406) = v403;
  unsigned int v408 = v407 - 899497514 + (v406 >> 27);
  unint64_t v410 = __PAIR64__(v393, __ROR4__(v355, 31));
  int v409 = v322 ^ __ROR4__(v309, 31) ^ v410;
  LODWORD(v410) = v393;
  uint64_t result = (v410 >> 2);
  int v412 = v409 ^ __ROR4__(v385, 31);
  HIDWORD(v410) = v412;
  LODWORD(v410) = v412;
  int v413 = (v410 >> 31) + v396 + (result ^ __ROR4__(v388, 2) ^ v403);
  unint64_t v415 = __PAIR64__(v408, __ROR4__(v397, 31));
  int v414 = v329 ^ __ROR4__(v315, 31) ^ __ROR4__(v359, 31) ^ v415;
  LODWORD(v415) = v408;
  int v416 = v415 >> 27;
  HIDWORD(v415) = v414;
  LODWORD(v415) = v414;
  unsigned int v417 = v413 - 899497514 + v416;
  int v418 = (v415 >> 31) + v405;
  HIDWORD(v415) = v403;
  LODWORD(v415) = v403;
  int v419 = v415 >> 2;
  unint64_t v420 = __PAIR64__(v417, __ROR4__(v393, 2));
  int v421 = v418 + (v419 ^ v420 ^ v408);
  LODWORD(v420) = v417;
  unsigned int v422 = v421 - 899497514 + (v420 >> 27);
  unint64_t v424 = __PAIR64__(v408, __ROR4__(v402, 31));
  int v423 = v462 ^ __ROR4__(v321, 31) ^ __ROR4__(v368, 31) ^ v424;
  LODWORD(v424) = v408;
  int v425 = v424 >> 2;
  HIDWORD(v424) = v423;
  LODWORD(v424) = v423;
  int v426 = (v424 >> 31) + result + (v425 ^ __ROR4__(v403, 2) ^ v417);
  unint64_t v428 = __PAIR64__(v422, __ROR4__(v412, 31));
  int v427 = v340 ^ __ROR4__(v328, 31) ^ __ROR4__(v372, 31) ^ v428;
  LODWORD(v428) = v422;
  int v429 = v428 >> 27;
  HIDWORD(v428) = v427;
  LODWORD(v428) = v427;
  unsigned int v430 = v426 - 899497514 + v429;
  int v431 = v483 + (v428 >> 31) + v419;
  HIDWORD(v428) = v417;
  LODWORD(v428) = v417;
  int v432 = v428 >> 2;
  unint64_t v433 = __PAIR64__(v430, __ROR4__(v408, 2));
  int v434 = v431 + (v432 ^ v433 ^ v422) - 899497514;
  LODWORD(v433) = v430;
  *a1 = v434 + (v433 >> 27);
  a1[1] = v430 + v486;
  HIDWORD(v433) = v422;
  LODWORD(v433) = v422;
  a1[2] = (v433 >> 2) + v487;
  a1[3] = v432 + v485;
  a1[4] += v425;
  return result;
}

double fr_SHA1Init(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_210709F70;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)&double result = 3285377520;
  *(void *)(a1 + 16) = 3285377520;
  return result;
}

double fr_SHA1FinalNoLen(uint64_t a1, uint64_t a2)
{
  int v2 = 0;
  for (uint64_t i = 0; i != 20; ++i)
  {
    *(unsigned char *)(a1 + i) = *(_DWORD *)(a2 + (i & 0xFFFFFFFC)) >> (~(_BYTE)v2 & 0x18);
    v2 += 8;
  }
  double result = 0.0;
  *(_OWORD *)(a2 + 76) = 0u;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 44) = 0u;
  *(_OWORD *)(a2 + 28) = 0u;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(void *)(a2 + 20) = 0;
  return result;
}

__CFDictionary *EAPClientConfigurationCopyShareable(const __CFDictionary *a1)
{
  valuePtr[1] = *(const void **)MEMORY[0x263EF8340];
  CFMutableArrayRef v72 = 0;
  int v73 = 0;
  int v71 = 0;
  if (a1)
  {
    CFArrayRef v2 = (const __CFArray *)CFDictionaryGetValue(a1, @"AcceptEAPTypes");
    if (!v2) {
      goto LABEL_27;
    }
    CFArrayRef v3 = v2;
    if (!CFArrayGetCount(v2)) {
      goto LABEL_27;
    }
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v3);
    CFMutableArrayRef v72 = MutableCopy;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (!MutableCopy || CFGetTypeID(MutableCopy) != TypeID) {
      goto LABEL_24;
    }
    CFIndex Count = CFArrayGetCount(MutableCopy);
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      do
      {
        LODWORD(valuePtr[0]) = 0;
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v7);
        CFTypeID v9 = CFNumberGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v9) {
          goto LABEL_24;
        }
        if (CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, valuePtr) == 1
          && (LODWORD(valuePtr[0]) > 0x2B || ((1 << SLOBYTE(valuePtr[0])) & 0x80002202000) == 0))
        {
          CFArrayRemoveValueAtIndex(MutableCopy, v7);
          --Count;
          --v7;
        }
      }
      while (++v7 < Count);
    }
    if (!Count)
    {
LABEL_24:
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13))
      {
LABEL_27:
        unsigned int v17 = 0;
LABEL_28:
        my_CFRelease((const void **)&v72);
        my_CFRelease((const void **)&v73);
        my_CFRelease((const void **)&v71);
        return v17;
      }
      LOWORD(valuePtr[0]) = 0;
      int v14 = "EAP types are not shareable";
LABEL_26:
      _os_log_impl(&dword_2106D5000, LogHandle, v13, v14, (uint8_t *)valuePtr, 2u);
      goto LABEL_27;
    }
    if (my_CFDictionaryGetBooleanValue(a1, @"OneTimeUserPassword", 0))
    {
      int v10 = EAPLogGetLogHandle();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        LOWORD(valuePtr[0]) = 0;
        _os_log_impl(&dword_2106D5000, v10, v11, "EAP Configuration has \"OneTimePassword\" Enabled", (uint8_t *)valuePtr, 2u);
      }
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v13)) {
        goto LABEL_27;
      }
      LOWORD(valuePtr[0]) = 0;
      int v14 = "EAP configuration is not shareable";
      goto LABEL_26;
    }
    CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"TLSIdentityHandle");
    if (!v19)
    {
      unint64_t v25 = 0;
      goto LABEL_39;
    }
    SecKeyRef privateKeyRef = 0;
    SecIdentityRef identityRef = 0;
    CFMutableDictionaryRef v76 = 0;
    int v77 = 0;
    CFDataRef v75 = 0;
    int v20 = EAPSecIdentityHandleCreateSecIdentity(v19, &identityRef);
    if (v20)
    {
      int v21 = v20;
      int v22 = EAPLogGetLogHandle();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23))
      {
LABEL_35:
        int v71 = 0;
LABEL_36:
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v13 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(LogHandle, v13)) {
          goto LABEL_27;
        }
        LOWORD(valuePtr[0]) = 0;
        int v14 = "Failed to get identity from identity handle";
        goto LABEL_26;
      }
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v21;
      int v24 = "EAPSecIdentityHandleCreateSecIdentity() failed: (%d)";
LABEL_34:
      _os_log_impl(&dword_2106D5000, v22, v23, v24, (uint8_t *)valuePtr, 8u);
      goto LABEL_35;
    }
    int v26 = identityRef;
    if (!identityRef)
    {
      int v22 = EAPLogGetLogHandle();
      os_log_type_t v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23)) {
        goto LABEL_35;
      }
      valuePtr[0] = (const void *)67109120;
      int v24 = "Failed to find identity in the keychain: (%d)";
      goto LABEL_34;
    }
    valuePtr[0] = 0;
    CFArrayRef v83 = 0;
    SecTrustRef trust = 0;
    int v80 = 0;
    int v74 = 0;
    CFDictionaryRef EAP = (const void *)SecPolicyCreateEAP();
    int v82 = EAP;
    if (EAP)
    {
      unsigned int v28 = EAP;
      OSStatus v29 = SecIdentityCopyCertificate(v26, (SecCertificateRef *)valuePtr);
      if (v29)
      {
        OSStatus v30 = v29;
        unsigned int v31 = EAPLogGetLogHandle();
        os_log_type_t v32 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v30;
          int v33 = "SecIdentityCopyCertificate failed: (%d)";
LABEL_54:
          _os_log_impl(&dword_2106D5000, v31, v32, v33, buf, 8u);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
      CFArrayRef v37 = CFArrayCreate(0, valuePtr, 1, MEMORY[0x263EFFF70]);
      CFArrayRef v83 = v37;
      my_CFRelease(valuePtr);
      OSStatus v30 = SecTrustCreateWithCertificates(v37, v28, &trust);
      my_CFRelease((const void **)&v83);
      if (v30)
      {
        unsigned int v31 = EAPLogGetLogHandle();
        os_log_type_t v32 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v30;
          int v33 = "SecTrustCreateWithCertificates failed: (%d)";
          goto LABEL_54;
        }
LABEL_55:
        CFMutableArrayRef Mutable = 0;
        goto LABEL_56;
      }
      int v60 = EAPTLSSecTrustEvaluate(trust, (SecTrustResultType *)&v80);
      if (v60)
      {
        int v61 = v60;
        int v62 = EAPLogGetLogHandle();
        os_log_type_t v63 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v62, v63))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v61;
          _os_log_impl(&dword_2106D5000, v62, v63, "SecTrustEvaluate failed: (%d)", buf, 8u);
        }
      }
      CertificateCFIndex Count = SecTrustGetCertificateCount(trust);
      if (CertificateCount)
      {
        uint64_t v65 = CertificateCount;
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x263EFFF70]);
        if (v65 >= 1)
        {
          for (CFIndex i = 0; i != v65; ++i)
          {
            *(void *)buf = 0;
            SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, i);
            *(void *)buf = SecCertificateCopyData(CertificateAtIndex);
            CFArrayAppendValue(Mutable, *(const void **)buf);
            my_CFRelease((const void **)buf);
          }
        }
        OSStatus v30 = 0;
        int v74 = Mutable;
      }
      else
      {
        int v68 = EAPLogGetLogHandle();
        os_log_type_t v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v68, v69, "SecTrustGetCertificateCount returned 0", buf, 2u);
        }
        CFMutableArrayRef Mutable = 0;
        OSStatus v30 = -50;
      }
    }
    else
    {
      unint64_t v34 = EAPLogGetLogHandle();
      os_log_type_t v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v34, v35, "SecPolicyCreateEAP failed", buf, 2u);
      }
      CFMutableArrayRef Mutable = 0;
      OSStatus v30 = 0;
    }
LABEL_56:
    my_CFRelease((const void **)&trust);
    my_CFRelease(&v82);
    if (v30 || !Mutable)
    {
      int v52 = EAPLogGetLogHandle();
      os_log_type_t v53 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v52, v53)) {
        goto LABEL_86;
      }
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v30;
      int v54 = "Failed to get a certificate chain from identity: (%d)";
    }
    else
    {
      OSStatus v38 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
      if (!v38 && privateKeyRef)
      {
        CFDataRef v39 = SecKeyCopyExternalRepresentation(privateKeyRef, 0);
        CFDataRef v75 = v39;
        if (v39)
        {
          CFDataRef v40 = v39;
          unsigned int v41 = (const void *)MEMORY[0x21666F2C0](privateKeyRef);
          int v77 = v41;
          if (v41)
          {
            CFDictionaryRef v42 = (const __CFDictionary *)v41;
            CFDataRef value = v40;
            CFMutableDictionaryRef v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFMutableDictionaryRef v76 = v43;
            int v44 = (const void *)*MEMORY[0x263F16F68];
            int v45 = CFDictionaryGetValue(v42, (const void *)*MEMORY[0x263F16F68]);
            CFDictionaryRef v46 = v42;
            int v47 = (const void *)*MEMORY[0x263F16FA8];
            int v48 = CFDictionaryGetValue(v46, (const void *)*MEMORY[0x263F16FA8]);
            if (v45 && v48)
            {
              unint64_t v49 = v45;
              int v50 = v48;
              CFDictionaryAddValue(v43, v44, v49);
              CFDictionaryAddValue(v43, v47, v50);
              CFMutableDictionaryRef v51 = v43;
              unint64_t v25 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionaryAddValue(v25, @"certificates", Mutable);
              CFDictionaryAddValue(v25, @"key", value);
              CFDictionaryAddValue(v25, @"attributes", v51);
              goto LABEL_87;
            }
            int v58 = EAPLogGetLogHandle();
            os_log_type_t v59 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v58, v59))
            {
              LOWORD(valuePtr[0]) = 0;
              int v54 = "Failed to find class and/or type item attributes for private key";
              goto LABEL_84;
            }
LABEL_86:
            unint64_t v25 = 0;
LABEL_87:
            my_CFRelease((const void **)&identityRef);
            my_CFRelease(&v77);
            my_CFRelease((const void **)&v76);
            my_CFRelease((const void **)&v74);
            my_CFRelease((const void **)&privateKeyRef);
            my_CFRelease((const void **)&v74);
            my_CFRelease((const void **)&v75);
            int v71 = v25;
            if (!v25) {
              goto LABEL_36;
            }
LABEL_39:
            int v73 = CFDictionaryCreateMutableCopy(0, 0, a1);
            CFDictionaryRemoveValue(v73, @"TLSIdentityHandle");
            CFDictionarySetValue(v73, @"AcceptEAPTypes", MutableCopy);
            unsigned int v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionaryAddValue(v17, @"EAPClientConfiguration", v73);
            if (v25) {
              CFDictionaryAddValue(v17, @"TLSShareableIdentityInfo", v25);
            }
            goto LABEL_28;
          }
          int v58 = EAPLogGetLogHandle();
          os_log_type_t v59 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v58, v59)) {
            goto LABEL_86;
          }
          LOWORD(valuePtr[0]) = 0;
          int v54 = "Failed to get all the keychain item attributes for private key";
        }
        else
        {
          int v58 = EAPLogGetLogHandle();
          os_log_type_t v59 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v58, v59)) {
            goto LABEL_86;
          }
          LOWORD(valuePtr[0]) = 0;
          int v54 = "Failed to get an external representation of private key";
        }
LABEL_84:
        int v55 = v58;
        os_log_type_t v56 = v59;
        uint32_t v57 = 2;
        goto LABEL_85;
      }
      int v52 = EAPLogGetLogHandle();
      os_log_type_t v53 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v52, v53)) {
        goto LABEL_86;
      }
      LODWORD(valuePtr[0]) = 67109120;
      HIDWORD(valuePtr[0]) = v38;
      int v54 = "Failed to get a private key from identity: (%d)";
    }
    int v55 = v52;
    os_log_type_t v56 = v53;
    uint32_t v57 = 8;
LABEL_85:
    _os_log_impl(&dword_2106D5000, v55, v56, v54, (uint8_t *)valuePtr, v57);
    goto LABEL_86;
  }
  int v15 = EAPLogGetLogHandle();
  os_log_type_t v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    LOWORD(valuePtr[0]) = 0;
    _os_log_impl(&dword_2106D5000, v15, v16, "Invalid parameters", (uint8_t *)valuePtr, 2u);
  }
  return 0;
}

__CFDictionary *EAPClientConfigurationCopyAndImport(const void *a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v34))
    {
      *(_WORD *)int v68 = 0;
      os_log_type_t v35 = "Invalid parameters";
LABEL_28:
      _os_log_impl(&dword_2106D5000, LogHandle, v34, v35, v68, 2u);
    }
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"EAPClientConfiguration");
  CFTypeID v4 = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != v4)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v34))
    {
      *(_WORD *)int v68 = 0;
      os_log_type_t v35 = "Missing EAP Configuration dictionary";
      goto LABEL_28;
    }
    return 0;
  }
  unint64_t v5 = CFDictionaryGetValue((CFDictionaryRef)a1, @"TLSShareableIdentityInfo");
  CFTypeID v6 = CFDictionaryGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v6)
  {
    return (__CFDictionary *)CFRetain(Value);
  }
  CFTypeRef v63 = 0;
  int v66 = 0;
  SecKeyRef v67 = 0;
  CFTypeRef result = 0;
  CFIndex v7 = CFDictionaryGetValue((CFDictionaryRef)v5, @"certificates");
  CFTypeID v8 = CFArrayGetTypeID();
  if (!v7 || CFGetTypeID(v7) != v8)
  {
    OSStatus v38 = EAPLogGetLogHandle();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
    {
LABEL_37:
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v34 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v34)) {
        return 0;
      }
      *(_WORD *)int v68 = 0;
      os_log_type_t v35 = "Failed to create shareable identity handle from shareable identity info";
      goto LABEL_28;
    }
    *(_WORD *)int v64 = 0;
    CFDataRef v40 = "Failed to get certitifate array";
LABEL_36:
    _os_log_impl(&dword_2106D5000, v38, v39, v40, v64, 2u);
    goto LABEL_37;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v7);
  if (Count <= 0)
  {
    OSStatus v38 = EAPLogGetLogHandle();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_37;
    }
    *(_WORD *)int v64 = 0;
    CFDataRef v40 = "Failed to get valid certitifate array";
    goto LABEL_36;
  }
  unint64_t v10 = Count;
  os_log_type_t v11 = CFDictionaryGetValue((CFDictionaryRef)v5, @"key");
  CFTypeID v12 = CFDataGetTypeID();
  if (!v11 || CFGetTypeID(v11) != v12)
  {
    OSStatus v38 = EAPLogGetLogHandle();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_37;
    }
    *(_WORD *)int v64 = 0;
    CFDataRef v40 = "Failed to get key data";
    goto LABEL_36;
  }
  os_log_type_t v13 = CFDictionaryGetValue((CFDictionaryRef)v5, @"attributes");
  CFTypeID v14 = CFDictionaryGetTypeID();
  if (!v13 || CFGetTypeID(v13) != v14)
  {
    OSStatus v38 = EAPLogGetLogHandle();
    os_log_type_t v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_37;
    }
    *(_WORD *)int v64 = 0;
    CFDataRef v40 = "Failed to get attributes dictionary";
    goto LABEL_36;
  }
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
  *(void *)int v68 = SecCertificateCreateWithData(v15, ValueAtIndex);
  if (!*(void *)v68)
  {
    unsigned int v41 = EAPLogGetLogHandle();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_71;
    }
    *(_WORD *)int v64 = 0;
    os_log_type_t v32 = "SecCertificateCreateWithData returned NULL";
LABEL_51:
    CFMutableDictionaryRef v43 = v64;
    int v44 = v41;
    os_log_type_t v45 = v42;
    uint32_t v46 = 2;
LABEL_52:
    _os_log_impl(&dword_2106D5000, v44, v45, v32, v43, v46);
    goto LABEL_71;
  }
  SecKeyRef v67 = SecKeyCreateWithData((CFDataRef)v11, (CFDictionaryRef)v13, 0);
  if (!v67)
  {
    unsigned int v41 = EAPLogGetLogHandle();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_71;
    }
    *(_WORD *)int v64 = 0;
    os_log_type_t v32 = "SecKeyCreateWithData returned NULL";
    goto LABEL_51;
  }
  unsigned int v17 = (const void *)SecIdentityCreate();
  int v66 = v17;
  if (!v17)
  {
    unsigned int v41 = EAPLogGetLogHandle();
    os_log_type_t v42 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v41, v42)) {
      goto LABEL_71;
    }
    *(_WORD *)int v64 = 0;
    os_log_type_t v32 = "SecIdentityCreate returned NULL";
    goto LABEL_51;
  }
  unsigned int v18 = v17;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)int v64 = Mutable;
  int v20 = (const void *)*MEMORY[0x263F16E80];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], @"com.apple.identities");
  int v21 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17590], (const void *)*MEMORY[0x263EFFB40]);
  int v22 = (const void *)*MEMORY[0x263F175B8];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F175B8], v18);
  os_log_type_t v23 = (const void *)*MEMORY[0x263F17528];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17528], v21);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E90], (const void *)*MEMORY[0x263F16EB8]);
  OSStatus v24 = SecItemAdd(Mutable, &result);
  if (v24)
  {
    OSStatus v25 = v24;
    if (v24 != -25299)
    {
      OSStatus v30 = EAPLogGetLogHandle();
      os_log_type_t v31 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v25;
      os_log_type_t v32 = "Failed to store identity in keychain (%d)";
      goto LABEL_67;
    }
    int v26 = EAPLogGetLogHandle();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v26, v27, "The identity already exists in keychain", buf, 2u);
    }
    OSStatus v28 = SecItemCopyMatching(Mutable, &result);
    if (v28)
    {
      OSStatus v29 = v28;
      OSStatus v30 = EAPLogGetLogHandle();
      os_log_type_t v31 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v29;
      os_log_type_t v32 = "Failed to get persistent reference for identity in keychain (%d)";
LABEL_67:
      CFMutableDictionaryRef v43 = buf;
      int v44 = v30;
      os_log_type_t v45 = v31;
      uint32_t v46 = 8;
      goto LABEL_52;
    }
  }
  CFDictionarySetValue(Mutable, v20, @"com.apple.certificates");
  CFDictionaryRemoveValue(Mutable, v23);
  if (v10 < 2) {
    goto LABEL_70;
  }
  CFIndex v47 = 1;
  while (1)
  {
    CFDataRef v48 = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, v47);
    *(void *)buf = 0;
    SecCertificateRef v49 = SecCertificateCreateWithData(v15, v48);
    *(void *)buf = v49;
    if (!v49) {
      break;
    }
    CFDictionarySetValue(Mutable, v22, v49);
    OSStatus v50 = SecItemAdd(Mutable, 0);
    if (v50)
    {
      OSStatus v51 = v50;
      if (v50 == -25299)
      {
        int v52 = EAPLogGetLogHandle();
        os_log_type_t v53 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v52, v53))
        {
          *(_WORD *)os_log_type_t v69 = 0;
          int v54 = v52;
          os_log_type_t v55 = v53;
          os_log_type_t v56 = "The anchor certificate already exists in keychain";
          uint32_t v57 = 2;
LABEL_62:
          _os_log_impl(&dword_2106D5000, v54, v55, v56, v69, v57);
        }
      }
      else
      {
        int v58 = EAPLogGetLogHandle();
        os_log_type_t v59 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v58, v59))
        {
          *(_DWORD *)os_log_type_t v69 = 67109120;
          OSStatus v70 = v51;
          int v54 = v58;
          os_log_type_t v55 = v59;
          os_log_type_t v56 = "Failed to store anchor certificate in keychain (%d)";
          uint32_t v57 = 8;
          goto LABEL_62;
        }
      }
    }
    my_CFRelease((const void **)buf);
    if (v10 == ++v47) {
      goto LABEL_70;
    }
  }
  int v60 = EAPLogGetLogHandle();
  os_log_type_t v61 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v60, v61))
  {
    *(_WORD *)os_log_type_t v69 = 0;
    _os_log_impl(&dword_2106D5000, v60, v61, "SecCertificateCreateWithData returned NULL anchor certificate", v69, 2u);
  }
LABEL_70:
  my_CFRelease((const void **)v64);
LABEL_71:
  my_CFRelease((const void **)&v67);
  my_CFRelease((const void **)v68);
  my_CFRelease(&v66);
  CFTypeRef v62 = result;
  CFTypeRef v63 = result;
  if (!result) {
    goto LABEL_37;
  }
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
  CFDictionaryAddValue(MutableCopy, @"TLSIdentityHandle", v62);
  my_CFRelease(&v63);
  return MutableCopy;
}

uint64_t eapol_socket(uint64_t a1, char a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v30 = -2000189298;
  int v29 = 1;
  memset(v33, 0, 18);
  uint64_t v3 = socket(27, 3, 0);
  if ((v3 & 0x80000000) != 0)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v7))
    {
      CFTypeID v8 = __error();
      CFTypeID v9 = strerror(*v8);
      *(_DWORD *)buf = 136315138;
      os_log_type_t v32 = v9;
      _os_log_impl(&dword_2106D5000, LogHandle, v7, "socket() failed: %s", buf, 0xCu);
    }
    goto LABEL_11;
  }
  uint64_t v4 = v3;
  __strlcpy_chk();
  *(_WORD *)int v33 = 6930;
  if (bind(v4, (const sockaddr *)v33, 0x12u) < 0)
  {
    unint64_t v10 = EAPLogGetLogHandle();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, v11))
    {
      CFTypeID v12 = __error();
      os_log_type_t v13 = strerror(*v12);
      *(_DWORD *)buf = 136315138;
      os_log_type_t v32 = v13;
      _os_log_impl(&dword_2106D5000, v10, v11, "bind() failed: %s", buf, 0xCu);
    }
    close(v4);
LABEL_11:
    syslog(5, "eapol_socket: ndrv_socket failed");
    return 0xFFFFFFFFLL;
  }
  if (ioctl(v4, 0x8004667EuLL, &v29) < 0)
  {
    CFTypeID v14 = __error();
    strerror(*v14);
    syslog(5, "eapol_socket: FIONBIO failed, %s");
LABEL_20:
    close(v4);
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    unsigned int v5 = 2;
  }
  else
  {
    *(void *)&v33[2] = 0x600060000;
    *(_DWORD *)&v33[14] = 0;
    *(_WORD *)&v33[18] = 0;
    *(_WORD *)int v33 = 4628;
    *(_WORD *)&v33[12] = 768;
    *(_DWORD *)&v33[8] = 12746753;
    if (setsockopt(v4, 0, 5, v33, 0x14u) < 0)
    {
      OSStatus v25 = __error();
      int v26 = strerror(*v25);
      syslog(5, "setsockopt(NDRV_ADDMULTICAST) failed: %s", v26);
      os_log_type_t v27 = __error();
      strerror(*v27);
      syslog(5, "eapol_socket: ndrv_socket_add_multicast failed, %s");
      goto LABEL_20;
    }
    unsigned int v5 = 1;
  }
  *(void *)&v33[8] = 0;
  CFAllocatorRef v15 = (char *)malloc_type_malloc(32 * v5, 0x1000040E0EAB150uLL);
  os_log_type_t v16 = v15;
  uint64_t v17 = 0;
  *(void *)int v33 = 0x8021EC00000001;
  *(_DWORD *)&v33[8] = v5;
  *(void *)&v33[16] = v15;
  unsigned int v18 = &v30;
  do
  {
    CFDictionaryRef v19 = &v15[v17];
    unsigned int v20 = *(unsigned __int16 *)v18;
    unsigned int v18 = (int *)((char *)v18 + 2);
    *(_DWORD *)CFDictionaryRef v19 = 131076;
    *((_WORD *)v19 + 2) = bswap32(v20) >> 16;
    v17 += 32;
  }
  while (32 * v5 != v17);
  int v21 = setsockopt(v4, 0, 4, v33, 0x18u);
  free(v16);
  if (v21 < 0)
  {
    int v22 = __error();
    os_log_type_t v23 = strerror(*v22);
    syslog(5, "setsockopt(NDRV_SETDMXSPEC) failed: %s", v23);
    OSStatus v24 = __error();
    strerror(*v24);
    syslog(5, "eapol_socket: ndrv_socket_bind failed, %s");
    goto LABEL_20;
  }
  return v4;
}

const char *EAPOLPacketTypeStr(unsigned int a1)
{
  if (a1 > 4) {
    return "<unknown>";
  }
  else {
    return EAPOLPacketTypeStr_str[a1];
  }
}

uint64_t EAPOLPacketIsValid(unsigned __int8 *a1, uint64_t a2, CFMutableStringRef theString)
{
  int v4 = a2;
  if (a2 <= 3)
  {
    if (theString) {
      CFStringAppendFormat(theString, 0, @"EAPOLPacket truncated header %d < %d\n", a2, 4);
    }
    return 0;
  }
  if (theString)
  {
    uint64_t v6 = a1[1];
    if (v6 > 4) {
      os_log_type_t v7 = "<unknown>";
    }
    else {
      os_log_type_t v7 = EAPOLPacketTypeStr_str[a1[1]];
    }
    CFStringAppendFormat(theString, 0, @"EAPOL: proto version 0x%x type %s (%d) length %d\n", *a1, v7, v6, bswap32(*((unsigned __int16 *)a1 + 1)) >> 16);
    unsigned int v8 = *((unsigned __int16 *)a1 + 1);
    uint64_t v10 = __rev16(v8);
    unsigned int v9 = v4 - 4;
    if (v4 - 4 < bswap32(v8) >> 16)
    {
      CFStringAppendFormat(theString, 0, @"EAPOLPacket truncated %d < %d\n", (v4 - 4), v10);
      return 0;
    }
  }
  else
  {
    unsigned int v8 = *((unsigned __int16 *)a1 + 1);
    unsigned int v9 = a2 - 4;
    if ((int)a2 - 4 < bswap32(v8) >> 16) {
      return 0;
    }
    uint64_t v10 = __rev16(v8);
  }
  uint64_t IsValid = 1;
  switch(a1[1])
  {
    case 0u:
      uint64_t IsValid = EAPPacketIsValid(a1 + 4, v10, theString);
      goto LABEL_37;
    case 1u:
    case 2u:
    case 4u:
      goto LABEL_37;
    case 3u:
      if (v8)
      {
        uint64_t v13 = a1[4];
        if (v13 == 254 || v13 == 2)
        {
          if (v10 > 0x5E)
          {
            unsigned int v14 = *(unsigned __int16 *)(a1 + 97);
            unint64_t v15 = __rev16(v14);
            if ((unint64_t)v10 - 95 >= v15)
            {
              if (!theString) {
                return 1;
              }
              uint64_t v20 = bswap32(*(unsigned __int16 *)(a1 + 7)) >> 16;
              uint64_t v21 = bswap32(*(unsigned __int16 *)(a1 + 5)) >> 16;
              CFStringAppendFormat(theString, 0, @"EAPOL Key Descriptor: type IEEE 802.11 (%d)\n", a1[4]);
              CFStringAppendFormat(theString, 0, @"%-18s0x%04x\n", "key_information:", v21);
              CFStringAppendFormat(theString, 0, @"%-18s%d\n", "key_length:", v20);
              CFStringAppendFormat(theString, 0, @"%-18s", "replay_counter:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 9), 8);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s", "key_nonce:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 17), 32);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s", "EAPOL_key_IV:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 49), 16);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s", "key_RSC:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 65), 8);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s", "key_reserved:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 73), 8);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s", "key_MIC:");
              print_bytes_cfstr(theString, (uint64_t)(a1 + 81), 16);
              CFStringAppendFormat(theString, 0, @"\n");
              CFStringAppendFormat(theString, 0, @"%-18s%d\n", "key_data_length:", v15);
              if (!v14) {
                goto LABEL_18;
              }
              CFStringAppendFormat(theString, 0, @"%-18s", "key_data:");
              uint64_t v17 = (uint64_t)(a1 + 99);
              unsigned int v18 = theString;
              int v19 = v15;
              goto LABEL_49;
            }
            if (!theString) {
              return 0;
            }
            CFStringAppendFormat(theString, 0, @"%s(IEEE80211) Key Data truncated %d < %d\n", "EAPOLKeyDescriptor", (v10 - 95), v15);
          }
          else
          {
            if (!theString) {
              return 0;
            }
            CFStringAppendFormat(theString, 0, @"%s(IEEE80211) length %d < %d\n", "EAPOLKeyDescriptor", v10, 95);
          }
        }
        else
        {
          if (v13 == 1)
          {
            if (v10 <= 0x2B)
            {
              if (!theString) {
                return 0;
              }
              CFStringAppendFormat(theString, 0, @"%s(RC4) length %d < %d\n", "EAPOLKeyDescriptor", v10, 44);
              goto LABEL_36;
            }
            if (!theString) {
              return IsValid;
            }
            if ((a1[31] & 0x80u) != 0) {
              os_log_type_t v16 = "Unicast";
            }
            else {
              os_log_type_t v16 = "Broadcast";
            }
            CFStringAppendFormat(theString, 0, @"EAPOL Key Descriptor: type RC4 (%d) length %d %s index %d\n", v13, bswap32(*(unsigned __int16 *)(a1 + 5)) >> 16, v16, a1[31] & 0x7F);
            CFStringAppendFormat(theString, 0, @"%-16s", "replay_counter:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 7), 8);
            CFStringAppendFormat(theString, 0, @"\n");
            CFStringAppendFormat(theString, 0, @"%-16s", "key_IV:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 15), 16);
            CFStringAppendFormat(theString, 0, @"\n");
            CFStringAppendFormat(theString, 0, @"%-16s", "key_signature:");
            print_bytes_cfstr(theString, (uint64_t)(a1 + 32), 16);
            CFStringAppendFormat(theString, 0, @"\n");
            if (v10 == 44)
            {
LABEL_18:
              uint64_t IsValid = 1;
              goto LABEL_37;
            }
            CFStringAppendFormat(theString, 0, @"%-16s", "key:");
            uint64_t v17 = (uint64_t)(a1 + 48);
            unsigned int v18 = theString;
            int v19 = v10 - 44;
LABEL_49:
            print_bytes_cfstr(v18, v17, v19);
            CFStringAppendFormat(theString, 0, @"\n");
            goto LABEL_18;
          }
          if (!theString) {
            return 0;
          }
          CFStringAppendFormat(theString, 0, @"%s Type %d unrecognized\n", "EAPOLKeyDescriptor", v13, v24);
        }
      }
      else
      {
        if (!theString) {
          return 0;
        }
        CFStringAppendFormat(theString, 0, @"EAPOLPacket empty body\n", v22, v23, v24);
      }
LABEL_36:
      uint64_t IsValid = 0;
LABEL_37:
      if (theString && v9 > v10)
      {
        CFStringAppendFormat(theString, 0, @"EAPOL: %d bytes follow body:\n", v9 - v10);
        print_data_cfstr(theString, (uint64_t)&a1[v10 + 4], v9 - v10);
      }
      return IsValid;
    default:
      if (!theString) {
        return 1;
      }
      CFStringAppendFormat(theString, 0, @"EAPOLPacket type %d unrecognized\n", a1[1]);
      print_data_cfstr(theString, (uint64_t)(a1 + 4), v10);
      goto LABEL_18;
  }
}

uint64_t EAPOLPacketValid(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
    uint64_t IsValid = EAPOLPacketIsValid(a1, a2, Mutable);
    if (Mutable)
    {
      SCPrint();
      CFRelease(Mutable);
    }
    return IsValid;
  }
  else
  {
    return EAPOLPacketIsValid(a1, a2, 0);
  }
}

uint64_t EAPOLPacketSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 2) = __rev16(a2);
  return result;
}

uint64_t EAPOLPacketGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
}

uint64_t EAPOLRC4KeyDescriptorSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 1) = __rev16(a2);
  return result;
}

uint64_t EAPOLKeyDescriptorSetLength(uint64_t result, unsigned int a2)
{
  *(_WORD *)(result + 1) = __rev16(a2);
  return result;
}

uint64_t EAPOLRC4KeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLKeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 3)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetInformation(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 1)) >> 16;
}

uint64_t EAPOLIEEE80211KeyDescriptorGetKeyDataLength(uint64_t a1)
{
  return bswap32(*(unsigned __int16 *)(a1 + 93)) >> 16;
}

uint64_t EAPSIMAKAPersistentStateGetMasterKey(uint64_t a1)
{
  return a1 + 76;
}

uint64_t EAPSIMAKAPersistentStateGetMasterKeySize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

uint64_t EAPSIMAKAPersistentStateGetIMSI(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t EAPSIMAKAPersistentStateGetPseudonym(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 40);
  }
  return *(void *)(a1 + 32);
}

BOOL EAPSIMAKAPersistentStateTemporaryUsernameAvailable(uint64_t a1)
{
  return *(void *)(a1 + 32) || *(void *)(a1 + 48) != 0;
}

void EAPSIMAKAPersistentStatePurgeTemporaryIDs(uint64_t a1)
{
  EAPSIMAKAPersistentStateSetPseudonymAndTime(a1, 0, 0);
  if (*(unsigned char *)(a1 + 4) == 13) {
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  }
  *(unsigned char *)(a1 + 56) = 0;
  EAPSIMAKAPersistentStateSave(a1, 0);
}

void EAPSIMAKAPersistentStateSetPseudonym(uint64_t a1, const void *a2)
{
}

void EAPSIMAKAPersistentStateSetReauthID(uint64_t a1, const void *a2)
{
  if (*(unsigned char *)(a1 + 4) == 13) {
    my_FieldSetRetainedCFType((const void **)(a1 + 48), a2);
  }
}

uint64_t EAPSIMAKAPersistentStateSetReauthIDUsed(uint64_t result, char a2)
{
  *(unsigned char *)(result + 56) = a2;
  return result;
}

void EAPSIMAKAPersistentStateSave(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef theDict = 0;
  if (*(unsigned char *)(a1 + 4) != 10)
  {
    IMSIListRemoveMatches(*(_DWORD *)a1, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIDoesNotMatch, *(void *)(a1 + 8));
    if (*(void *)(a1 + 32))
    {
      int v4 = *(const void **)(a1 + 40);
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFMutableDictionaryRef theDict = Mutable;
      CFDictionarySetValue(Mutable, @"Pseudonym", *(const void **)(a1 + 32));
      if (v4) {
        CFDictionarySetValue(Mutable, @"PseudonymStartTime", v4);
      }
      if (!a2 || !*(void *)(a1 + 48)) {
        goto LABEL_20;
      }
      if (Mutable)
      {
LABEL_12:
        CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a1 + 28));
        CFDictionarySetValue(Mutable, @"ReauthCounter", v6);
        CFRelease(v6);
        CFDictionarySetValue(Mutable, @"ReauthID", *(const void **)(a1 + 48));
        if (*(unsigned char *)(a1 + 56)) {
          CFDictionarySetValue(Mutable, @"IsReauthIDUsedBefore", (const void *)*MEMORY[0x263EFFB40]);
        }
        CFDataRef v7 = CFDataCreate(0, (const UInt8 *)(a1 + 76), *(int *)(a1 + 72));
        unsigned int v8 = (__CFString *)CFStringCreateWithFormat(0, 0, @"com.apple.network.%@.master-key.%@", *(void *)(*(void *)(a1 + 64) + 8), *(void *)(a1 + 8));
        if (EAPSecKeychainPasswordItemSet(0, v8, v7))
        {
          int v9 = EAPSecKeychainPasswordItemCreateWithAccess(0, 0, v8, 0, 0, 0, v7);
          CFRelease(v8);
          if (v9)
          {
            LogHandle = EAPLogGetLogHandle();
            os_log_type_t v11 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(LogHandle, v11))
            {
              *(_DWORD *)buf = 67109120;
              int v18 = v9;
              _os_log_impl(&dword_2106D5000, LogHandle, v11, "Failed to update/create a keychain item: %d", buf, 8u);
            }
          }
        }
        else
        {
          CFRelease(v8);
        }
        CFRelease(v7);
LABEL_20:
        if (Mutable)
        {
          CFTypeID v12 = *(const void **)(a1 + 16);
          if (v12)
          {
            CFDictionarySetValue(Mutable, @"SSID", v12);
            CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 24));
            CFMutableArrayRef Mutable = theDict;
            CFDictionarySetValue(theDict, @"GenerationID", v13);
            CFRelease(v13);
          }
        }
        goto LABEL_23;
      }
    }
    else
    {
      CFMutableArrayRef Mutable = 0;
      if (!a2 || !*(void *)(a1 + 48))
      {
LABEL_23:
        ProtoInfoChangedCheck(*(void *)(a1 + 64));
        CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE70];
        CFStringRef v15 = (const __CFString *)*MEMORY[0x263EFFE50];
        CFPreferencesSetValue(*(CFStringRef *)(a1 + 8), Mutable, **(CFStringRef **)(a1 + 64), (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
        my_CFRelease((const void **)&theDict);
        CFPreferencesSynchronize(**(CFStringRef **)(a1 + 64), v14, v15);
        ProtoInfoNotifyChange();
        return;
      }
    }
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef theDict = Mutable;
    goto LABEL_12;
  }
}

uint64_t EAPSIMAKAPersistentStateGetSSID(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void EAPSIMAKAPersistentStateSetPseudonymAndTime(uint64_t a1, const void *a2, const void *a3)
{
  if (*(unsigned char *)(a1 + 4) != 10)
  {
    my_FieldSetRetainedCFType((const void **)(a1 + 32), a2);
    if (!a2 || a3)
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 40), a3);
    }
    else
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v7 = CFDateCreate(0, Current);
      my_FieldSetRetainedCFType((const void **)(a1 + 40), v7);
      if (v7)
      {
        CFRelease(v7);
      }
    }
  }
}

uint64_t EAPSIMAKAPersistentStateGetReauthID(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t EAPSIMAKAPersistentStateGetReauthIDUsed(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t EAPSIMAKAPersistentStateGetCounter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 28);
}

uint64_t EAPSIMAKAPersistentStateSetCounter(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 28) = a2;
  return result;
}

void *EAPSIMAKAPersistentStateCreate(int a1, int a2, const __CFString *a3, int a4, const void *a5)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v19, "imsi is NULL", buf, 2u);
    }
    return 0;
  }
  uint64_t v10 = ProtoInfoForType(a1);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (uint64_t)v10;
  CFTypeID v12 = malloc_type_malloc((a2 + 76), 0xAB2526ACuLL);
  *(_OWORD *)CFTypeID v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  *((_OWORD *)v12 + 4) = 0u;
  *(_DWORD *)CFTypeID v12 = a1;
  *((void *)v12 + 1) = CFRetain(a3);
  *((void *)v12 + 8) = v11;
  *((_DWORD *)v12 + 18) = a2;
  *((unsigned char *)v12 + 4) = a4;
  *((_DWORD *)v12 + 6) = EAPOLSIMGenerationGet();
  if (a5) {
    *((void *)v12 + 2) = CFRetain(a5);
  }
  if (a4 == 10) {
    return v12;
  }
  CFMutableDictionaryRef v43 = 0;
  int valuePtr = 0;
  ProtoInfoChangedCheck(v11);
  CFPropertyListRef v13 = CFPreferencesCopyValue(a3, *(CFStringRef *)v11, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFMutableDictionaryRef v43 = v13;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v13)
  {
    CFStringGetTypeID();
    goto LABEL_57;
  }
  if (CFGetTypeID(v13) != TypeID)
  {
    CFTypeID v20 = CFStringGetTypeID();
    if (CFGetTypeID(v13) == v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = v13;
LABEL_56:
      EAPSIMAKAPersistentStateSetPseudonymAndTime((uint64_t)v12, v22, v21);
    }
LABEL_57:
    my_CFRelease(&v43);
    return v12;
  }
  if (!a5)
  {
    CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)v13, @"SSID");
    CFTypeID v26 = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == v26) {
        *((void *)v12 + 2) = CFRetain(Value);
      }
    }
  }
  CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, @"GenerationID");
  CFTypeID v16 = CFNumberGetTypeID();
  if (v15 && CFGetTypeID(v15) == v16)
  {
    CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
    int v17 = valuePtr;
  }
  else
  {
    int v17 = 0;
    int valuePtr = 0;
  }
  if (*((_DWORD *)v12 + 6) == v17)
  {
    uint64_t v22 = CFDictionaryGetValue((CFDictionaryRef)v13, @"Pseudonym");
    CFTypeID v23 = CFStringGetTypeID();
    if (v22 && CFGetTypeID(v22) == v23) {
      goto LABEL_24;
    }
    uint64_t v22 = CFDictionaryGetValue((CFDictionaryRef)v13, @"PseudonymID");
    CFTypeID v24 = CFStringGetTypeID();
    if (v22)
    {
      if (CFGetTypeID(v22) == v24)
      {
LABEL_24:
        uint64_t v21 = CFDictionaryGetValue((CFDictionaryRef)v13, @"PseudonymStartTime");
        goto LABEL_31;
      }
      uint64_t v22 = 0;
    }
    uint64_t v21 = 0;
LABEL_31:
    if (a4 == 13)
    {
      CFDataRef v41 = 0;
      os_log_type_t v27 = CFDictionaryGetValue((CFDictionaryRef)v13, @"ReauthCounter");
      CFTypeID v28 = CFNumberGetTypeID();
      if (v27 && CFGetTypeID(v27) != v28) {
        os_log_type_t v27 = 0;
      }
      int v29 = CFDictionaryGetValue((CFDictionaryRef)v13, @"ReauthID");
      CFTypeID v30 = CFStringGetTypeID();
      if (v29 && CFGetTypeID(v29) != v30) {
        int v29 = 0;
      }
      CFBooleanRef v31 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v13, @"IsReauthIDUsedBefore");
      CFTypeID v32 = CFBooleanGetTypeID();
      if (v31)
      {
        if (CFGetTypeID(v31) == v32) {
          LOBYTE(v31) = CFBooleanGetValue(v31);
        }
        else {
          LOBYTE(v31) = 0;
        }
      }
      uint64_t v33 = *(void *)(v11 + 8);
      *(void *)buf = 0;
      uint64_t v34 = (__CFString *)CFStringCreateWithFormat(0, 0, @"com.apple.network.%@.master-key.%@", v33, a3);
      int v35 = EAPSecKeychainPasswordItemCopy(0, v34, buf);
      CFRelease(v34);
      if (v35 != -25300 && v35)
      {
        OSStatus v38 = EAPLogGetLogHandle();
        os_log_type_t v39 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)os_log_type_t v45 = 67109120;
          int v46 = v35;
          _os_log_impl(&dword_2106D5000, v38, v39, "Failed to read a keychain item: %d", v45, 8u);
        }
        CFDataRef v41 = 0;
      }
      else
      {
        CFDataRef v36 = *(const __CFData **)buf;
        CFDataRef v41 = *(const __CFData **)buf;
        if (v27)
        {
          if (v29)
          {
            if (*(void *)buf)
            {
              CFIndex Length = CFDataGetLength(*(CFDataRef *)buf);
              if (Length == a2)
              {
                v48.CFIndex length = Length;
                *(_WORD *)buf = 0;
                v48.CFIndex location = 0;
                CFDataGetBytes(v36, v48, (UInt8 *)v12 + 76);
                CFNumberGetValue((CFNumberRef)v27, kCFNumberSInt16Type, buf);
                *((_WORD *)v12 + 14) = *(_WORD *)buf;
                if (*((unsigned char *)v12 + 4) == 13) {
                  my_FieldSetRetainedCFType((const void **)v12 + 6, v29);
                }
                *((unsigned char *)v12 + 56) = (_BYTE)v31;
              }
            }
          }
        }
      }
      my_CFRelease((const void **)&v41);
    }
    if (!v22) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  my_CFRelease(&v43);
  IMSIListRemoveMatches(18, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesEverything, 0);
  IMSIListRemoveMatches(23, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesEverything, 0);
  return v12;
}

__CFString **ProtoInfoForType(int a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 == 18) {
    return S_eapsim_info;
  }
  if (a1 == 23) {
    return S_eapaka_info;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v4))
  {
    v5[0] = 67109120;
    v5[1] = a1;
    _os_log_impl(&dword_2106D5000, LogHandle, v4, "unrecognized type %d", (uint8_t *)v5, 8u);
  }
  return 0;
}

void ProtoInfoChangedCheck(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  checuint64_t k = 0;
  if ((prefs_did_change_S_token_valid & 1) == 0)
  {
    uint32_t v2 = notify_register_check("com.apple.network.eapclient.eapsimaka.prefs", &prefs_did_change_S_token);
    if (v2)
    {
      uint32_t v3 = v2;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v5)) {
        return;
      }
      *(_DWORD *)buf = 67109120;
      uint32_t v13 = v3;
      uint64_t v6 = "notify_register_check returned %d";
LABEL_9:
      _os_log_impl(&dword_2106D5000, LogHandle, v5, v6, buf, 8u);
      return;
    }
    prefs_did_change_S_token_valid = 1;
  }
  uint32_t v7 = notify_check(prefs_did_change_S_token, &check);
  if (v7)
  {
    uint32_t v8 = v7;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v5)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    uint32_t v13 = v8;
    uint64_t v6 = "notify_check returned %d";
    goto LABEL_9;
  }
  int v9 = prefs_did_change_S_generation;
  if (check) {
    int v9 = ++prefs_did_change_S_generation;
  }
  int v10 = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v9;
  if (v10 != v9) {
    CFPreferencesSynchronize(*(CFStringRef *)a1, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  }
}

void IMSIListRemoveMatches(int a1, unsigned int (*a2)(const __CFString *, const void *, uint64_t), uint64_t a3)
{
  os_log_type_t v5 = ProtoInfoForType(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    ProtoInfoChangedCheck((uint64_t)v5);
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFArrayRef v9 = CFPreferencesCopyKeyList(*v6, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    if (v9)
    {
      CFArrayRef v10 = v9;
      if (CFArrayGetCount(v9) >= 1)
      {
        CFIndex v11 = 0;
        int v17 = 0;
        do
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, v11);
          CFPropertyListRef v13 = CFPreferencesCopyValue(ValueAtIndex, *v6, v7, v8);
          if (v13)
          {
            uint64_t v14 = v13;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (CFGetTypeID(v14) == TypeID && a2(ValueAtIndex, v14, a3))
            {
              CFPreferencesSetValue(ValueAtIndex, 0, *v6, v7, v8);
              CFPreferencesSynchronize(*v6, v7, v8);
              CFTypeID v16 = (__CFString *)CFStringCreateWithFormat(0, 0, @"com.apple.network.%@.master-key.%@", v6[1], ValueAtIndex);
              EAPSecKeychainPasswordItemRemove(0, v16);
              CFRelease(v16);
              int v17 = 1;
            }
            CFRelease(v14);
          }
          ++v11;
        }
        while (CFArrayGetCount(v10) > v11);
        if (v17) {
          ProtoInfoNotifyChange();
        }
      }
      CFRelease(v10);
    }
  }
}

BOOL IMSIDoesNotMatch(const void *a1, uint64_t a2, const void *a3)
{
  return my_CFEqual(a1, a3) == 0;
}

void ProtoInfoNotifyChange()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint32_t v0 = notify_post("com.apple.network.eapclient.eapsimaka.prefs");
  if (v0)
  {
    uint32_t v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_2106D5000, LogHandle, v3, "notify_post returned %d", (uint8_t *)v4, 8u);
    }
  }
}

void EAPSIMAKAPersistentStateRelease(uint64_t a1)
{
  my_CFRelease((const void **)(a1 + 8));
  my_CFRelease((const void **)(a1 + 16));
  if (*(unsigned char *)(a1 + 4) == 13) {
    my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  }
  EAPSIMAKAPersistentStateSetPseudonymAndTime(a1, 0, 0);
  free((void *)a1);
}

void EAPSIMAKAPersistentStateForgetSSID(uint64_t a1)
{
  IMSIListRemoveMatches(18, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesSSID, a1);
  IMSIListRemoveMatches(23, (unsigned int (*)(const __CFString *, const void *, uint64_t))IMSIMatchesSSID, a1);
}

BOOL IMSIMatchesSSID(int a1, CFDictionaryRef theDict, const void *a3)
{
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"SSID");
  return my_CFEqual(a3, Value) != 0;
}

uint64_t IMSIMatchesEverything()
{
  return 1;
}

char *EAPSIMAKAPacketSubtypeGetString(int a1)
{
  char v1 = a1 - 1;
  if (a1 - 1) < 0xE && ((0x3E1Bu >> v1)) {
    return off_264133F50[v1];
  }
  uint32_t v2 = EAPSIMAKAPacketSubtypeGetString_buf;
  snprintf(EAPSIMAKAPacketSubtypeGetString_buf, 8uLL, "%d", a1);
  return v2;
}

const char *EAPSIMAKAAttributeTypeGetString(int a1)
{
  char v1 = "AT_RAND";
  switch(a1)
  {
    case 1:
      return v1;
    case 2:
      char v1 = "AT_AUTN";
      break;
    case 3:
      char v1 = "AT_RES";
      break;
    case 4:
      char v1 = "AT_AUTS";
      break;
    case 5:
    case 8:
    case 9:
    case 18:
LABEL_22:
      char v1 = EAPSIMAKAAttributeTypeGetString_buf;
      snprintf(EAPSIMAKAAttributeTypeGetString_buf, 8uLL, "%d", a1);
      break;
    case 6:
      char v1 = "AT_PADDING";
      break;
    case 7:
      char v1 = "AT_NONCE_MT";
      break;
    case 10:
      char v1 = "AT_PERMANENT_ID_REQ";
      break;
    case 11:
      char v1 = "AT_MAC";
      break;
    case 12:
      char v1 = "AT_NOTIFICATION";
      break;
    case 13:
      char v1 = "AT_ANY_ID_REQ";
      break;
    case 14:
      char v1 = "AT_IDENTITY";
      break;
    case 15:
      char v1 = "AT_VERSION_LIST";
      break;
    case 16:
      char v1 = "AT_SELECTED_VERSION";
      break;
    case 17:
      char v1 = "AT_FULLAUTH_ID_REQ";
      break;
    case 19:
      char v1 = "AT_COUNTER";
      break;
    case 20:
      char v1 = "AT_COUNTER_TOO_SMALL";
      break;
    case 21:
      char v1 = "AT_NONCE_S";
      break;
    case 22:
      char v1 = "AT_CLIENT_ERROR_CODE";
      break;
    default:
      switch(a1)
      {
        case 129:
          char v1 = "AT_IV";
          break;
        case 130:
          char v1 = "AT_ENCR_DATA";
          break;
        case 132:
          char v1 = "AT_NEXT_PSEUDONYM";
          break;
        case 133:
          char v1 = "AT_NEXT_REAUTH_ID";
          break;
        case 134:
          char v1 = "AT_CHECKCODE";
          break;
        case 135:
          char v1 = "AT_RESULT_IND";
          break;
        default:
          goto LABEL_22;
      }
      break;
  }
  return v1;
}

const char *ATNotificationCodeGetString(int a1)
{
  if (a1 >= 0x4000)
  {
    switch(a1)
    {
      case 0x8000:
        return "Success";
      case 0x4001:
        return "Identity Decryption Failure Before Authentication";
      case 0x4000:
        return "General Failure Before Authentication";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return "General Failure After Authentication";
      case 1026:
        return "Temporarily Denied Access";
      case 1031:
        return "Not Subscribed";
    }
  }
  return 0;
}

__CFString *EAPSIMAKAPacketCopyDescription(unsigned __int8 *a1, char *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t Length = EAPPacketGetLength((uint64_t)a1);
  if (*a1 - 1 > 1)
  {
    CFMutableArrayRef Mutable = 0;
  }
  else
  {
    uint64_t v5 = Length;
    CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
    if (v5 <= 7)
    {
      CFStringAppendFormat(Mutable, 0, @"EAPSIMAKAPacket truncated header %d < %d\n", v5, 8);
      goto LABEL_6;
    }
    CFArrayRef v9 = EAPTypeStr(a1[4]);
    if (*a1 == 1) {
      CFArrayRef v10 = "Request";
    }
    else {
      CFArrayRef v10 = "Response";
    }
    uint64_t v11 = a1[1];
    String = EAPSIMAKAPacketSubtypeGetString(a1[5]);
    CFStringAppendFormat(Mutable, 0, @"%s %s: Identifier %d Length %d [%s] Length %d\n", v9, v10, v11, v5, String, (v5 - 8));
    if (v5 == 8)
    {
LABEL_17:
      char v7 = 1;
      goto LABEL_7;
    }
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v18 = 0;
    long long v19 = 0u;
    memset(v16, 0, sizeof(v16));
    CFNumberRef v15 = 0;
    uint64_t v17 = 0;
    if (TLVListParse_0((uint64_t)&v15, a1 + 8, (int)v5 - 8))
    {
      CFPropertyListRef v13 = TLVListCopyDescription((unsigned __int8 ***)&v15);
      if (v15 && v15 != v16) {
        free(v15);
      }
      CFNumberRef v15 = 0;
      uint64_t v17 = 0;
      CFStringAppendFormat(Mutable, 0, @"%@", v13);
      CFRelease(v13);
      goto LABEL_17;
    }
    CFStringAppendFormat(Mutable, 0, @"failed to parse TLVs: %s\n", &v18, v14);
  }
LABEL_6:
  char v7 = 0;
LABEL_7:
  *a2 = v7;
  return Mutable;
}

uint64_t TLVListSizeof()
{
  return 256;
}

void *TLVListInit(void *result)
{
  *CFTypeRef result = 0;
  result[11] = 0;
  return result;
}

uint64_t TLVListErrorString(uint64_t a1)
{
  return a1 + 96;
}

__CFString *TLVListCopyDescription(unsigned __int8 ***a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  if (*((int *)a1 + 22) >= 1)
  {
    int v3 = 0;
    os_log_type_t v4 = *a1;
    while (2)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = 4 * (*v4)[1];
      String = EAPSIMAKAAttributeTypeGetString(**v4);
      CFStringAppendFormat(Mutable, 0, @"%s: Length %d\n", String, v6);
      CFStringRef v8 = EAPSIMAKAAttributeTypeGetString(*v5);
      CFArrayRef v9 = v8 + 3;
      switch(*v5)
      {
        case 1u:
          CFStringAppendFormat(Mutable, 0, @"%18s:\t", "(reserved)");
          print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
          CFStringAppendFormat(Mutable, 0, @"\n%18s: (n=%d)\n", v9, (unsigned __int16)((int)(v6 - 4 + (((v6 - 4) & 0xF000u) >> 12)) >> 4));
          if (v6 >= 0x14)
          {
            uint64_t v16 = 0;
            uint64_t v17 = (uint64_t)(v5 + 4);
            if ((unsigned __int16)((int)(v6 - 4 + (((v6 - 4) & 0xF000u) >> 12)) >> 4) <= 1u) {
              int v18 = 1;
            }
            else {
              int v18 = (unsigned __int16)((int)(v6 - 4 + (((v6 - 4) & 0xF000u) >> 12)) >> 4);
            }
            do
            {
              CFStringAppendFormat(Mutable, 0, @"%18d:\t", v16);
              print_bytes_cfstr(Mutable, v17, 16);
              CFStringAppendFormat(Mutable, 0, @"\n");
              uint64_t v16 = (v16 + 1);
              v17 += 16;
            }
            while (v18 != v16);
          }
          goto LABEL_23;
        case 2u:
        case 7u:
        case 0xBu:
        case 0x15u:
LABEL_4:
          CFStringAppendFormat(Mutable, 0, @"%18s:\t", "(reserved)");
          print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
          CFStringAppendFormat(Mutable, 0, @"\n%18s:\t", v9);
          uint64_t v10 = (uint64_t)(v5 + 4);
          uint64_t v11 = Mutable;
          int v12 = 16;
          goto LABEL_21;
        case 3u:
          uint64_t v19 = bswap32(*((unsigned __int16 *)v5 + 1)) >> 16;
          LODWORD(v6) = (v19 + 7) >> 3;
          CFStringAppendFormat(Mutable, 0, @"%18s: %d bits (%d bytes)\n", v8 + 3, v19, v6);
          uint64_t v10 = (uint64_t)(v5 + 4);
          goto LABEL_20;
        case 4u:
          uint64_t v6 = (v6 - 2);
          uint64_t v28 = v6;
          CFStringAppendFormat(Mutable, 0, @"%18s: %d bytes\n", v8 + 3);
          goto LABEL_19;
        case 5u:
        case 8u:
        case 9u:
        case 0x12u:
          goto LABEL_23;
        case 6u:
          uint64_t v6 = (v6 - 2);
          CFStringAppendFormat(Mutable, 0, @"%18s: %d bytes\n", v8 + 3, v6);
          CFStringAppendFormat(Mutable, 0, @"%18s\t", &unk_21070AD61);
LABEL_19:
          uint64_t v10 = (uint64_t)(v5 + 2);
          goto LABEL_20;
        case 0xAu:
        case 0xDu:
        case 0x11u:
        case 0x14u:
LABEL_8:
          CFStringAppendFormat(Mutable, 0, @"%18s:\t", "(reserved)");
          uint64_t v10 = (uint64_t)(v5 + 2);
          uint64_t v11 = Mutable;
          int v12 = 2;
          goto LABEL_21;
        case 0xCu:
        case 0x10u:
        case 0x13u:
        case 0x16u:
          CFStringAppendFormat(Mutable, 0, @"%18s:\t%04d\n", v8 + 3, bswap32(*((unsigned __int16 *)v5 + 1)) >> 16);
          goto LABEL_23;
        case 0xEu:
LABEL_6:
          unsigned int v13 = bswap32(*((unsigned __int16 *)v5 + 1));
          CFStringAppendFormat(Mutable, 0, @"%18s: Actual Length %d\n", v8 + 3, HIWORD(v13));
          uint64_t v14 = (uint64_t)(v5 + 4);
          print_data_cfstr(Mutable, v14, HIWORD(v13));
          int v15 = v6 - HIWORD(v13);
          LODWORD(v6) = v15 - 4;
          if (v15 == 4) {
            goto LABEL_23;
          }
          snprintf(__str, 0x80uLL, "(%d pad bytes)", v15 - 4);
          CFStringAppendFormat(Mutable, 0, @"%18s:\t", __str);
          uint64_t v10 = v14 + HIWORD(v13);
LABEL_20:
          uint64_t v11 = Mutable;
          int v12 = v6;
LABEL_21:
          print_bytes_cfstr(v11, v10, v12);
          long long v20 = Mutable;
LABEL_22:
          CFStringAppendFormat(v20, 0, @"\n", v27, v28);
LABEL_23:
          ++v3;
          ++v4;
          if (v3 >= *((_DWORD *)a1 + 22)) {
            return Mutable;
          }
          continue;
        case 0xFu:
          unint64_t v21 = bswap32(*((unsigned __int16 *)v5 + 1)) >> 16;
          CFStringAppendFormat(Mutable, 0, @"%18s: Actual Length %d\n", v8 + 3, v21);
          long long v22 = v5 + 4;
          if ((v21 >> 1))
          {
            uint64_t v23 = 0;
            do
            {
              CFStringAppendFormat(Mutable, 0, @"%18d:\t%04d\n", v23, bswap32(*(unsigned __int16 *)&v22[2 * v23]) >> 16);
              ++v23;
            }
            while ((v21 >> 1) != v23);
          }
          int v24 = v6 - v21 - 4;
          snprintf(__str, 0x80uLL, "(%d pad bytes)", v24);
          CFStringAppendFormat(Mutable, 0, @"%18s:\t", __str);
          print_bytes_cfstr(Mutable, (uint64_t)&v22[v21], v24);
          long long v20 = Mutable;
          goto LABEL_22;
        default:
          switch(*v5)
          {
            case 0x81u:
              goto LABEL_4;
            case 0x82u:
              CFStringAppendFormat(Mutable, 0, @"%18s:\t", "(reserved)");
              print_bytes_cfstr(Mutable, (uint64_t)(v5 + 2), 2);
              uint64_t v25 = (v6 - 4);
              CFStringAppendFormat(Mutable, 0, @"\n%18s: Length %d\n", v9, v25);
              print_data_cfstr(Mutable, (uint64_t)(v5 + 4), v25);
              break;
            case 0x84u:
            case 0x85u:
              goto LABEL_6;
            case 0x87u:
              goto LABEL_8;
            default:
              goto LABEL_23;
          }
          goto LABEL_23;
      }
    }
  }
  return Mutable;
}

void TLVListFree(uint64_t a1)
{
  int v3 = (void *)(a1 + 8);
  uint32_t v2 = *(void **)a1;
  if (v2) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    free(v2);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 88) = 0;
}

uint64_t EAPSIMAKAStatusForATNotificationCode(int a1)
{
  if (a1 >= 0x4000)
  {
    switch(a1)
    {
      case 0x8000:
        return 0;
      case 0x4001:
        return 19;
      case 0x4000:
        return 2;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return 1;
      case 1026:
        return 3;
      case 1031:
        return 4;
    }
  }
  return 5;
}

void EAPSIMAKAKeyInfoComputeMAC(uint64_t a1, const void *a2, uint64_t a3, const void *a4, int a5, void *a6)
{
  data[2] = *MEMORY[0x263EF8340];
  memset(&v13, 0, sizeof(v13));
  data[0] = 0;
  data[1] = 0;
  int v12 = EAPPacketGetLength((uint64_t)a2) - (a3 - a2);
  CCHmacInit(&v13, 0, (const void *)(a1 + 16), 0x10uLL);
  CCHmacUpdate(&v13, a2, (int)a3 - (int)a2);
  CCHmacUpdate(&v13, data, 0x10uLL);
  CCHmacUpdate(&v13, (const void *)(a3 + 16), v12 - 16);
  if (a4) {
    CCHmacUpdate(&v13, a4, a5);
  }
  CCHmacFinal(&v13, a6);
}

BOOL EAPSIMAKAKeyInfoVerifyMAC(uint64_t a1, const void *a2, uint64_t a3, const void *a4, int a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  EAPSIMAKAKeyInfoComputeMAC(a1, a2, a3, a4, a5, v6);
  return cc_cmp_safe() == 0;
}

double EAPSIMAKAKeyInfoSetMAC(uint64_t a1, const void *a2, _OWORD *a3, const void *a4, int a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  EAPSIMAKAKeyInfoComputeMAC(a1, a2, (uint64_t)a3, a4, a5, v7);
  double result = v7[0];
  *a3 = *(_OWORD *)v7;
  return result;
}

void *EAPSIMAKAKeyInfoDecryptTLVList(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v34[5] = *MEMORY[0x263EF8340];
  size_t v31 = 0;
  CCCryptorRef cryptorRef = 0;
  uint64_t v8 = 4 * *(unsigned __int8 *)(a2 + 1) - 4;
  CFArrayRef v9 = malloc_type_malloc(v8, 0xC1456794uLL);
  CCCryptorStatus v10 = CCCryptorCreate(1u, 0, 0, a1, 0x10uLL, (const void *)(a3 + 4), &cryptorRef);
  if (v10)
  {
    CCCryptorStatus v11 = v10;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v13))
    {
      *(_DWORD *)buf = 67109120;
      v34[0] = v11;
      uint64_t v14 = "CCCryptoCreate failed with %d";
LABEL_7:
      uint64_t v17 = LogHandle;
      os_log_type_t v18 = v13;
      uint32_t v19 = 8;
LABEL_8:
      _os_log_impl(&dword_2106D5000, v17, v18, v14, buf, v19);
    }
  }
  else
  {
    CCCryptorStatus v15 = CCCryptorUpdate(cryptorRef, (const void *)(a2 + 4), v8, v9, v8, &v31);
    if (v15)
    {
      CCCryptorStatus v16 = v15;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v13))
      {
        *(_DWORD *)buf = 67109120;
        v34[0] = v16;
        uint64_t v14 = "CCCryptoUpdate failed with %d";
        goto LABEL_7;
      }
    }
    else
    {
      if (v31 != v8)
      {
        uint64_t v27 = EAPLogGetLogHandle();
        os_log_type_t v28 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v27, v28)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 67109376;
        v34[0] = v31;
        LOWORD(v34[1]) = 1024;
        *(_DWORD *)((char *)&v34[1] + 2) = v8;
        uint64_t v14 = "decryption consumed %d bytes (!= %d bytes)";
        uint64_t v17 = v27;
        os_log_type_t v18 = v28;
        uint32_t v19 = 14;
        goto LABEL_8;
      }
      if (TLVListParse_0(a4, (unsigned __int8 *)v9, v8))
      {
        int v20 = 0;
        goto LABEL_10;
      }
      uint64_t v29 = EAPLogGetLogHandle();
      os_log_type_t v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v34 = a4 + 96;
        uint64_t v14 = "TLVListParse failed on AT_ENCR_DATA, %s";
        uint64_t v17 = v29;
        os_log_type_t v18 = v30;
        uint32_t v19 = 12;
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  int v20 = 1;
LABEL_10:
  if (cryptorRef)
  {
    CCCryptorStatus v21 = CCCryptorRelease(cryptorRef);
    if (v21)
    {
      CCCryptorStatus v22 = v21;
      uint64_t v23 = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 67109120;
        v34[0] = v22;
        _os_log_impl(&dword_2106D5000, v23, v24, "CCCryptoRelease failed with %d", buf, 8u);
      }
    }
  }
  if (v9) {
    int v25 = v20;
  }
  else {
    int v25 = 0;
  }
  if (v25 == 1)
  {
    free(v9);
    return 0;
  }
  return v9;
}

BOOL EAPSIMAKAKeyInfoEncryptTLVs(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  memset(v57, 0, sizeof(v57));
  uint64_t v58 = 0;
  int v6 = *(_DWORD *)(a3 + 12);
  if (v6 <= 0) {
    int v7 = -(-v6 & 0xF);
  }
  else {
    int v7 = v6 & 0xF;
  }
  if (v7)
  {
    int v8 = v6 - v7 + 16;
    if (v8 != v6)
    {
      if (!TLVBufferAddPadding(a3, v8 - v6))
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v36 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(LogHandle, v36);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)int v60 = a2 + 16;
        size_t v31 = "failed to add AT_PADDING, %s";
LABEL_30:
        CFTypeID v32 = LogHandle;
LABEL_31:
        os_log_type_t v33 = v36;
LABEL_32:
        uint32_t v34 = 12;
LABEL_33:
        _os_log_impl(&dword_2106D5000, v32, v33, v31, buf, v34);
        return 0;
      }
      int v6 = *(_DWORD *)(a3 + 12);
    }
  }
  if (v6 != *(_DWORD *)(a3 + 8))
  {
    long long v26 = EAPLogGetLogHandle();
    os_log_type_t v27 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v26, v27);
    if (!result) {
      return result;
    }
    int v30 = *(_DWORD *)(a3 + 8);
    int v29 = *(_DWORD *)(a3 + 12);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)int v60 = v29;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v30;
    size_t v31 = "nested encrypted TLVs length %d != %d";
    CFTypeID v32 = v26;
    os_log_type_t v33 = v27;
    uint32_t v34 = 14;
    goto LABEL_33;
  }
  os_log_type_t v56 = 0;
  *(void *)&v57[5] = 0;
  if (!TLVListParse_0((uint64_t)&v56, *(unsigned __int8 **)a3, v6))
  {
    CFArrayRef v37 = EAPLogGetLogHandle();
    os_log_type_t v38 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v37, v38);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v60 = (char *)&v57[5] + 8;
    size_t v31 = "nested TLVs TLVListParse failed, %s";
    CFTypeID v32 = v37;
    os_log_type_t v33 = v38;
    goto LABEL_32;
  }
  CFArrayRef v9 = TLVListCopyDescription((unsigned __int8 ***)&v56);
  if (v56 && v56 != v57) {
    free(v56);
  }
  os_log_type_t v56 = 0;
  *(void *)&v57[5] = 0;
  CCCryptorStatus v10 = EAPLogGetLogHandle();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)int v60 = v9;
    _os_log_impl(&dword_2106D5000, v10, v11, "Encrypted TLVs:\n%@", buf, 0xCu);
  }
  CFRelease(v9);
  TLV = TLVBufferAllocateTLV(a2, 129, 20);
  if (!TLV)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v36 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v36);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v60 = a2 + 16;
    size_t v31 = "failed to allocate AT_IV, %s";
    goto LABEL_30;
  }
  uint64_t v13 = 0;
  *((_WORD *)TLV + 1) = 0;
  uint64_t v14 = TLV + 4;
  do
  {
    *(_DWORD *)&v14[v13] = arc4random();
    v13 += 4;
  }
  while (v13 != 16);
  CCCryptorStatus v15 = TLVBufferAllocateTLV(a2, 130, *(_DWORD *)(a3 + 12) + 4);
  if (!v15)
  {
    os_log_type_t v39 = EAPLogGetLogHandle();
    os_log_type_t v36 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(v39, v36);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v60 = a3 + 16;
    size_t v31 = "failed to allocate AT_ENCR_DATA, %s";
    CFTypeID v32 = v39;
    goto LABEL_31;
  }
  CCCryptorStatus v16 = v15;
  *((_WORD *)v15 + 1) = 0;
  uint64_t v17 = *(unsigned __int8 **)a3;
  int v18 = *(_DWORD *)(a3 + 12);
  CCCryptorRef cryptorRef = 0;
  size_t dataOutMoved = 0;
  CCCryptorStatus v19 = CCCryptorCreate(0, 0, 0, a1, 0x10uLL, v14, &cryptorRef);
  if (v19)
  {
    CCCryptorStatus v20 = v19;
    CCCryptorStatus v21 = EAPLogGetLogHandle();
    os_log_type_t v22 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v60 = v20;
      uint64_t v23 = "encrypt CCCryptoCreate failed with %d";
      os_log_type_t v24 = v21;
      os_log_type_t v25 = v22;
LABEL_40:
      uint32_t v44 = 8;
LABEL_41:
      _os_log_impl(&dword_2106D5000, v24, v25, v23, buf, v44);
      goto LABEL_42;
    }
    goto LABEL_42;
  }
  CCCryptorStatus v40 = CCCryptorUpdate(cryptorRef, v17, v18, v16 + 4, v18, &dataOutMoved);
  if (v40)
  {
    CCCryptorStatus v41 = v40;
    os_log_type_t v42 = EAPLogGetLogHandle();
    os_log_type_t v43 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v42, v43))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v60 = v41;
      uint64_t v23 = "encrypt CCCryptoUpdate failed with %d";
      os_log_type_t v24 = v42;
      os_log_type_t v25 = v43;
      goto LABEL_40;
    }
LABEL_42:
    char v45 = 0;
    goto LABEL_43;
  }
  if (dataOutMoved != v18)
  {
    int v52 = EAPLogGetLogHandle();
    os_log_type_t v53 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v52, v53)) {
      goto LABEL_42;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)int v60 = dataOutMoved;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v18;
    uint64_t v23 = "encryption consumed %d, should have been %d";
    os_log_type_t v24 = v52;
    os_log_type_t v25 = v53;
    uint32_t v44 = 14;
    goto LABEL_41;
  }
  char v45 = 1;
LABEL_43:
  CCCryptorStatus v46 = CCCryptorRelease(cryptorRef);
  if (v46)
  {
    CCCryptorStatus v47 = v46;
    CFRange v48 = EAPLogGetLogHandle();
    os_log_type_t v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v60 = v47;
      _os_log_impl(&dword_2106D5000, v48, v49, "CCCryptoRelease failed with %d", buf, 8u);
    }
  }
  if (v45) {
    return 1;
  }
  OSStatus v50 = EAPLogGetLogHandle();
  os_log_type_t v51 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(v50, v51);
  if (result)
  {
    *(_WORD *)buf = 0;
    size_t v31 = "failed to encrypt AT_ENCR_DATA";
    CFTypeID v32 = v50;
    os_log_type_t v33 = v51;
    uint32_t v34 = 2;
    goto LABEL_33;
  }
  return result;
}

uint64_t TLVBufferUsed(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t TLVBufferAddPadding(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0xC && ((1 << a2) & 0x1110) != 0)
  {
    uint64_t result = (uint64_t)TLVBufferAllocateTLV(a1, 6, a2);
    if (result)
    {
      bzero((void *)(result + 2), a2 - 2);
      return 1;
    }
    else
    {
      strcpy((char *)(a1 + 16), "couldn't allocate TLV");
    }
  }
  else
  {
    snprintf((char *)(a1 + 16), 0xA0uLL, "invalid AT_PADDING %d", a2);
    return 0;
  }
  return result;
}

uint64_t TLVBufferErrorString(uint64_t a1)
{
  return a1 + 16;
}

unsigned char *TLVBufferAllocateTLV(uint64_t a1, char a2, int a3)
{
  if (a3 < 2) {
    return 0;
  }
  if (a3 <= 0) {
    int v4 = -(-a3 & 3);
  }
  else {
    int v4 = a3 & 3;
  }
  int v5 = a3 - v4 + 4;
  if (!v4) {
    int v5 = a3;
  }
  if (v5 < 1021)
  {
    uint64_t v6 = *(int *)(a1 + 12);
    if (*(_DWORD *)(a1 + 8) - (int)v6 >= v5)
    {
      int v3 = (unsigned char *)(*(void *)a1 + v6);
      *int v3 = a2;
      v3[1] = v5 / 4;
      *(_DWORD *)(a1 + 12) = v6 + v5;
      return v3;
    }
    snprintf((char *)(a1 + 16), 0xA0uLL, "available space %d < required %d");
  }
  else
  {
    snprintf((char *)(a1 + 16), 0xA0uLL, "padded_length %d > max length %d");
  }
  return 0;
}

double EAPSIMAKAKeyInfoComputeReauthKey(_OWORD *a1, uint64_t a2, const void *a3, CC_LONG a4, uint64_t a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(&v19, 0, sizeof(v19));
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
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, a3, a4);
  CC_SHA1_Update(&v19, (const void *)(a5 + 2), 2u);
  CC_SHA1_Update(&v19, (const void *)(a6 + 4), 0x10u);
  MasterKey = (const void *)EAPSIMAKAPersistentStateGetMasterKey(a2);
  CC_LONG MasterKeySize = EAPSIMAKAPersistentStateGetMasterKeySize(a2);
  CC_SHA1_Update(&v19, MasterKey, MasterKeySize);
  CC_SHA1_Final((unsigned __int8 *)&md, &v19);
  fips186_2prf(&md, (uint64_t)&v21);
  long long v14 = v22;
  a1[2] = v21;
  a1[3] = v14;
  long long v15 = v24;
  a1[4] = v23;
  a1[5] = v15;
  long long v16 = v26;
  a1[6] = v25;
  a1[7] = v16;
  double result = *(double *)&v27;
  long long v18 = v28;
  a1[8] = v27;
  a1[9] = v18;
  return result;
}

uint64_t EAPSIMAKAIdentityTypeGetAttributeType(CFTypeRef cf2)
{
  if (!cf2) {
    return 13;
  }
  if (CFEqual(@"FullAuthentication", cf2)) {
    return 17;
  }
  if (CFEqual(@"Permanent", cf2)) {
    return 10;
  }
  return 13;
}

void *EAPSIMAKAInitEncryptedIdentityInfo(int a1, CFDictionaryRef theDict, int a3, unsigned char *a4, char *a5)
{
  unint64_t v46 = 0;
  CFStringRef Copy = 0;
  char v45 = 0;
  os_log_type_t v43 = 0;
  uint32_t v44 = 0;
  *a4 = 1;
  *a5 = 0;
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"EAPSIMAKAEncryptedIdentityEnabled");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFBooleanGetValue((CFBooleanRef)Value))
  {
    *a4 = 0;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v20))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v20, "The carrier does not support privacy protection", buf, 2u);
    }
    return 0;
  }
  int v12 = EAPLogGetLogHandle();
  os_log_type_t v13 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v12, v13))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v12, v13, "The carrier supports privacy protection", buf, 2u);
  }
  long long v14 = CFDictionaryGetValue(theDict, @"EAPSIMAKARealm");
  CFTypeID v15 = CFStringGetTypeID();
  if (!v14)
  {
    long long v16 = 0;
    if (a3) {
      goto LABEL_11;
    }
LABEL_25:
    id v26 = SIMCopyRealm(0);
    uint32_t v44 = v26;
    if (SIMIsOOBPseudonymSupported((BOOL *)&v45))
    {
      if (v45)
      {
        long long v27 = EAPLogGetLogHandle();
        os_log_type_t v28 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v27, v28, "The carrier supports OOB pseudonym", buf, 2u);
        }
        long long v29 = SIMCopyOOBPseudonym();
        unint64_t v46 = (unint64_t)v29;
        if (v29)
        {
          if (v26)
          {
            CFStringRef v30 = CFStringCreateWithFormat(0, 0, @"%@@%@", v29, v26);
            my_CFRelease((const void **)&v46);
            CFStringRef v31 = 0;
            unint64_t v22 = 0;
            unint64_t v46 = (unint64_t)v30;
            goto LABEL_52;
          }
          goto LABEL_51;
        }
        CFTypeID v32 = EAPLogGetLogHandle();
        os_log_type_t v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)buf = 0;
          uint32_t v34 = "failed to get OOB pseudonym";
          goto LABEL_50;
        }
      }
      else
      {
        os_log_type_t v36 = SIMCopyEncryptedIMSIInfo(a1);
        os_log_type_t v43 = v36;
        if (v36)
        {
          CFDictionaryRef v37 = (const __CFDictionary *)v36;
          unint64_t v22 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v36, (const void *)*MEMORY[0x263F02E20]);
          CFTypeID v38 = CFDataGetTypeID();
          if (!v22)
          {
            CFStringRef v31 = 0;
            goto LABEL_52;
          }
          if (CFGetTypeID((CFTypeRef)v22) == v38)
          {
            CFRetain((CFTypeRef)v22);
            os_log_type_t v39 = CFDictionaryGetValue(v37, (const void *)*MEMORY[0x263F02E30]);
            CFStringRef v40 = (const __CFString *)isA_CFString(v39);
            CFStringRef Copy = v40;
            if (v40) {
              CFRetain(v40);
            }
            else {
              CFStringRef Copy = CFStringCreateCopy(0, @"anonymous");
            }
            if (v16)
            {
              CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"%@@%@", Copy, v16);
              goto LABEL_38;
            }
            CFStringRef v31 = Copy;
            if (!v26) {
              goto LABEL_52;
            }
            id v41 = v26;
LABEL_37:
            CFStringRef v35 = CFStringCreateWithFormat(0, 0, @"%@@%@", v31, v41);
LABEL_38:
            CFStringRef v31 = v35;
            my_CFRelease((const void **)&Copy);
            goto LABEL_52;
          }
        }
        else
        {
          CFTypeID v32 = EAPLogGetLogHandle();
          os_log_type_t v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v32, v33))
          {
            *(_WORD *)buf = 0;
            uint32_t v34 = "failed to get encrypted idenity";
            goto LABEL_50;
          }
        }
      }
    }
    else
    {
      CFTypeID v32 = EAPLogGetLogHandle();
      os_log_type_t v33 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v32, v33))
      {
        *(_WORD *)buf = 0;
        uint32_t v34 = "check for OOB pseudonym support failed";
LABEL_50:
        _os_log_impl(&dword_2106D5000, v32, v33, v34, buf, 2u);
      }
    }
LABEL_51:
    CFStringRef v31 = 0;
    unint64_t v22 = 0;
    goto LABEL_52;
  }
  if (CFGetTypeID(v14) == v15) {
    long long v16 = v14;
  }
  else {
    long long v16 = 0;
  }
  if (!a3) {
    goto LABEL_25;
  }
LABEL_11:
  CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(theDict, @"EAPSIMAKAOutOfBandPseudonym");
  CFTypeID v18 = CFStringGetTypeID();
  if (!v17 || CFGetTypeID(v17) != v18)
  {
    unint64_t v46 = 0;
    unint64_t v22 = (unint64_t)CFDictionaryGetValue(theDict, @"EAPSIMAKAEncryptedUserName");
    CFTypeID v23 = CFDataGetTypeID();
    if (!v22 || CFGetTypeID((CFTypeRef)v22) != v23) {
      return 0;
    }
    CFRetain((CFTypeRef)v22);
    CFStringRef v24 = (const __CFString *)CFDictionaryGetValue(theDict, @"EAPSIMAKAAnonymousUserName");
    CFTypeID v25 = CFStringGetTypeID();
    if (v24 && CFGetTypeID(v24) == v25)
    {
      CFStringRef Copy = v24;
      CFRetain(v24);
    }
    else
    {
      CFStringRef Copy = 0;
      CFStringRef Copy = CFStringCreateCopy(0, @"anonymous");
    }
    CFStringRef v31 = Copy;
    if (!v16) {
      goto LABEL_52;
    }
    id v41 = 0;
    goto LABEL_37;
  }
  unint64_t v46 = (unint64_t)v17;
  if (v16) {
    unint64_t v46 = (unint64_t)CFStringCreateWithFormat(0, 0, @"%@@%@", v17, v16);
  }
  else {
    CFRetain(v17);
  }
  CFStringRef v31 = 0;
  unint64_t v22 = 0;
  char v45 = 1;
LABEL_52:
  my_CFRelease((const void **)&v43);
  my_CFRelease(&v44);
  *a5 = v45;
  if (!(v22 | v46)) {
    return 0;
  }
  double result = malloc_type_malloc(0x18uLL, 0x6004045F868BCuLL);
  result[1] = 0;
  result[2] = 0;
  *double result = 0;
  if (v45)
  {
    *double result = v46;
  }
  else
  {
    result[1] = v31;
    result[2] = v22;
  }
  return result;
}

const void *isA_CFString(const void *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0;
}

void EAPSIMAKAClearEncryptedIdentityInfo(const void **a1)
{
  if (a1)
  {
    my_CFRelease(a1 + 1);
    my_CFRelease(a1 + 2);
    my_CFRelease(a1);
    free(a1);
  }
}

const void *EAPSIMAKAActionInfoForNotificationCode(const __CFDictionary *a1, int a2)
{
  if (!a2 || a2 == 1031 || a2 == 1026)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"EAPSIMAKANotificationActions");
    CFTypeID TypeID = CFArrayGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFIndex Count = CFArrayGetCount(Value);
        if ((unint64_t)(Count - 1) <= 9)
        {
          CFIndex v6 = Count;
          CFIndex v7 = 0;
          while (1)
          {
            int valuePtr = 0;
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(Value, v7);
            CFTypeID v9 = CFDictionaryGetTypeID();
            if (!ValueAtIndex) {
              break;
            }
            if (CFGetTypeID(ValueAtIndex) != v9) {
              break;
            }
            CCCryptorStatus v10 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Code");
            CFTypeID v11 = CFNumberGetTypeID();
            if (!v10 || CFGetTypeID(v10) != v11 || !CFNumberGetValue((CFNumberRef)v10, kCFNumberIntType, &valuePtr)) {
              break;
            }
            if (valuePtr != a2)
            {
              CFStringRef ValueAtIndex = 0;
              if (v6 != ++v7) {
                continue;
              }
            }
            return ValueAtIndex;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t TLVBufferSizeof()
{
  return 176;
}

uint64_t TLVBufferInit(uint64_t result, uint64_t a2, int a3)
{
  *(void *)double result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = 0;
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t TLVBufferAddIdentity(uint64_t a1, const void *a2, signed int a3)
{
  uint64_t result = (uint64_t)TLVBufferAllocateTLV(a1, 14, a3 + 4);
  if (result)
  {
    *(_WORD *)(result + 2) = bswap32(a3) >> 16;
    memmove((void *)(result + 4), a2, a3);
    return 1;
  }
  return result;
}

uint64_t TLVBufferAddCounter(uint64_t a1, unsigned int a2)
{
  uint64_t result = (uint64_t)TLVBufferAllocateTLV(a1, 19, 4);
  if (result)
  {
    *(_WORD *)(result + 2) = __rev16(a2);
    return 1;
  }
  return result;
}

uint64_t TLVBufferAddCounterTooSmall(uint64_t a1)
{
  uint64_t result = (uint64_t)TLVBufferAllocateTLV(a1, 20, 4);
  if (result)
  {
    *(_WORD *)(result + 2) = 0;
    return 1;
  }
  return result;
}

_DWORD *TLVListAddAttribute(_DWORD *result, uint64_t a2)
{
  int v3 = result;
  int v4 = *(char **)result;
  if (*(void *)result)
  {
    int v5 = result[22];
    if (v5 == result[23])
    {
      int v6 = v5 + 10;
      result[23] = v6;
      if (v4 == (char *)(result + 2))
      {
        CFIndex v7 = malloc_type_malloc(8 * v6, 0xC0040B8AA526DuLL);
        *(void *)int v3 = v7;
        uint64_t result = memmove(v7, v4, 8 * (int)v3[22]);
        int v4 = *(char **)v3;
      }
      else
      {
        uint64_t result = reallocf(v4, 8 * v6);
        int v4 = (char *)result;
        *(void *)int v3 = result;
      }
    }
  }
  else
  {
    int v4 = (char *)(result + 2);
    *(void *)uint64_t result = result + 2;
    result[23] = 10;
  }
  uint64_t v8 = (int)v3[22];
  v3[22] = v8 + 1;
  *(void *)&v4[8 * v8] = a2;
  return result;
}

uint64_t TLVCheckValidity(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = a2[1];
  if (!a2[1]) {
    return 1;
  }
  uint64_t v3 = 4 * v2;
  uint64_t v4 = 2;
  switch(*a2)
  {
    case 1u:
      if (v2 <= 1)
      {
        CFTypeID v15 = (char *)(a1 + 96);
        uint64_t v4 = 1;
        String = EAPSIMAKAAttributeTypeGetString(1);
        snprintf(v15, 0xA0uLL, "%s truncated %d <= %d", String, v3, 4);
        return v4;
      }
      if (((v3 - 4) & 0xC) == 0) {
        return 0;
      }
      snprintf((char *)(a1 + 96), 0xA0uLL, "AT_RAND rand length %d not multiple of %d");
      return 1;
    case 2u:
    case 7u:
    case 0xBu:
    case 0x15u:
LABEL_8:
      if (v2 <= 1)
      {
        int v5 = (char *)(a1 + 96);
        int v7 = *a2;
        goto LABEL_10;
      }
      uint64_t v8 = (v3 - 4);
      if (v3 == 20) {
        return 0;
      }
      int v5 = (char *)(a1 + 96);
      CFTypeID v9 = EAPSIMAKAAttributeTypeGetString(*a2);
      uint64_t v10 = 16;
LABEL_19:
      uint64_t v21 = v8;
      uint64_t v22 = v10;
      os_log_type_t v20 = v9;
      int v6 = "%s invalid length %d != %d";
      goto LABEL_38;
    case 3u:
      if (v2 <= 1)
      {
        int v5 = (char *)(a1 + 96);
        int v7 = 3;
LABEL_10:
        uint64_t v21 = 4 * v2;
        uint64_t v22 = 4;
        os_log_type_t v20 = EAPSIMAKAAttributeTypeGetString(v7);
        int v6 = "%s truncated %d <= %d";
        goto LABEL_38;
      }
      uint64_t v12 = ((bswap32(*((unsigned __int16 *)a2 + 1)) >> 16) + 7) >> 3;
      uint64_t v13 = (v3 - 4);
      if ((int)v12 > (int)v13)
      {
        int v5 = (char *)(a1 + 96);
        int v14 = 3;
        goto LABEL_37;
      }
      return 0;
    case 4u:
      uint64_t v8 = (v3 - 2);
      if (v3 == 16) {
        return 0;
      }
      int v5 = (char *)(a1 + 96);
      CFTypeID v9 = EAPSIMAKAAttributeTypeGetString(4);
      uint64_t v10 = 14;
      goto LABEL_19;
    case 5u:
    case 8u:
    case 9u:
    case 0x12u:
      return v4;
    case 6u:
      if (v3 > 0xC || ((1 << (4 * v2)) & 0x1110) == 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_PADDING length %d not 4, 8, or 12");
      }
      else
      {
        uint64_t v18 = 0;
        while (!a2[v18 + 2])
        {
          uint64_t v4 = 0;
          if (v3 - 2 == ++v18) {
            return v4;
          }
        }
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_PADDING non-zero value 0x%x at offset %d");
      }
      return 1;
    case 0xAu:
    case 0xCu:
    case 0xDu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x16u:
LABEL_3:
      if (v2 == 1) {
        return 0;
      }
      int v5 = (char *)(a1 + 96);
      os_log_type_t v20 = EAPSIMAKAAttributeTypeGetString(*a2);
      uint64_t v21 = v3;
      int v6 = "%s length %d != 4";
      goto LABEL_38;
    case 0xEu:
    case 0xFu:
LABEL_6:
      if (v2 <= 1)
      {
        int v5 = (char *)(a1 + 96);
        uint64_t v21 = 4 * v2;
        uint64_t v22 = 4;
        os_log_type_t v20 = EAPSIMAKAAttributeTypeGetString(*a2);
        int v6 = "%s empty/truncated (%d <= %d)";
LABEL_38:
        snprintf(v5, 0xA0uLL, v6, v20, v21, v22);
        return 1;
      }
      unsigned int v11 = bswap32(*((unsigned __int16 *)a2 + 1));
      uint64_t v12 = HIWORD(v11);
      uint64_t v13 = (v3 - 4);
      if ((int)v13 < (int)HIWORD(v11))
      {
        int v5 = (char *)(a1 + 96);
        int v14 = *a2;
LABEL_37:
        uint64_t v21 = v12;
        uint64_t v22 = v13;
        os_log_type_t v20 = EAPSIMAKAAttributeTypeGetString(v14);
        int v6 = "%s actual length %d > TLV length %d";
        goto LABEL_38;
      }
      uint64_t v4 = 0;
      if (*a2 == 15 && (v11 & 0x10000) != 0)
      {
        snprintf((char *)(a1 + 96), 0xA0uLL, "AT_VERSION_LIST actual length %d not multiple of 2");
        return 1;
      }
      break;
    default:
      switch(*a2)
      {
        case 0x81u:
          goto LABEL_8;
        case 0x82u:
          if (v2 > 1) {
            return 0;
          }
          snprintf((char *)(a1 + 96), 0xA0uLL, "AT_ENCR_DATA empty/truncated (%d <= %d)");
          return 1;
        case 0x84u:
        case 0x85u:
          goto LABEL_6;
        case 0x87u:
          goto LABEL_3;
        default:
          return v4;
      }
  }
  return v4;
}

uint64_t TLVListLookupAttribute(unsigned __int8 ***a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 22);
  if (v2 < 1) {
    return 0;
  }
  for (CFIndex i = *a1; ; ++i)
  {
    uint64_t result = (uint64_t)*i;
    if (**i == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return result;
}

CFStringRef TLVCreateString(uint64_t a1)
{
  CFDataRef v1 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(a1 + 4), bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFStringRef v2 = CFStringCreateFromExternalRepresentation(0, v1, 0x8000100u);
  CFRelease(v1);
  return v2;
}

CFStringRef TLVListCreateStringFromAttribute(uint64_t a1, int a2)
{
  if ((a2 & 0xFE) != 0x84) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 88);
  if (v2 < 1) {
    return 0;
  }
  for (CFIndex i = *(uint64_t **)a1; *(unsigned __int8 *)*i != a2; ++i)
  {
    if (!--v2) {
      return 0;
    }
  }
  return TLVCreateString(*i);
}

uint64_t TLVListLookupIdentityAttribute(int *a1)
{
  uint64_t v1 = 0;
  while (a1[22] < 1)
  {
LABEL_6:
    if (++v1 == 3) {
      return 0;
    }
  }
  uint64_t v2 = TLVListLookupIdentityAttribute_S_types[v1];
  uint64_t v3 = *(unsigned __int8 ***)a1;
  int v4 = a1[22];
  while (**v3 != v2)
  {
    ++v3;
    if (!--v4) {
      goto LABEL_6;
    }
  }
  return v2;
}

uint64_t eapaka_introspect(char *__s1)
{
  uint64_t v2 = "version";
  uint64_t v3 = &off_26C290FA8;
  while (strcmp(__s1, v2))
  {
    int v4 = *v3;
    v3 += 2;
    uint64_t v2 = v4;
    if (!v4) {
      return 0;
    }
  }
  return (uint64_t)*(v3 - 1);
}

uint64_t eapaka_version()
{
  return 1;
}

uint64_t eapaka_type()
{
  return 23;
}

const char *eapaka_name()
{
  return "EAP-AKA";
}

uint64_t eapaka_init(uint64_t a1)
{
  long long v47 = 0uLL;
  CFRange v48 = 0;
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 80);
  if (v2)
  {
    CFArrayRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), @"EAPAKARES");
    int v4 = CFDictionaryGetValue(v2, @"EAPAKACk");
    int v5 = CFDictionaryGetValue(v2, @"EAPAKAIk");
    BOOL v6 = !Value && v4 == 0;
    if (!v6 || v5 != 0)
    {
      uint64_t v8 = v5;
      CFTypeID TypeID = CFDataGetTypeID();
      if (v4 && CFGetTypeID(v4) == TypeID)
      {
        int v10 = 1;
      }
      else
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v12 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v12))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, LogHandle, v12, "invalid/missing EAPAKACk property", buf, 2u);
        }
        int v10 = 0;
      }
      CFTypeID v13 = CFDataGetTypeID();
      if (!v8 || CFGetTypeID(v8) != v13)
      {
        int v14 = EAPLogGetLogHandle();
        os_log_type_t v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v14, v15, "invalid/missing EAPAKAIk property", buf, 2u);
        }
        int v10 = 0;
      }
      CFTypeID v16 = CFDataGetTypeID();
      if (Value && CFGetTypeID(Value) == v16)
      {
        my_FieldSetRetainedCFType((const void **)&v47 + 1, v4);
        my_FieldSetRetainedCFType(&v48, v8);
        my_FieldSetRetainedCFType((const void **)&v47, Value);
        if (v10)
        {
          CFStringRef v17 = (const __CFString *)copy_static_imsi_0(*(const __CFDictionary **)(a1 + 80));
          if (!v17)
          {
            my_CFRelease((const void **)&v47);
            my_CFRelease((const void **)&v47 + 1);
            my_CFRelease(&v48);
            return 4;
          }
          CFStringRef v18 = v17;
          CC_SHA1_CTX v19 = EAPLogGetLogHandle();
          os_log_type_t v20 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v19, v20))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2106D5000, v19, v20, "EAP-AKA: using static information", buf, 2u);
          }
          int v21 = 1;
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v22 = EAPLogGetLogHandle();
        os_log_type_t v23 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v22, v23))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v22, v23, "invalid/missing EAPAKARES property", buf, 2u);
        }
        my_FieldSetRetainedCFType((const void **)&v47 + 1, v4);
        my_FieldSetRetainedCFType(&v48, v8);
        my_FieldSetRetainedCFType((const void **)&v47, Value);
      }
    }
  }
  CFStringRef v18 = (const __CFString *)SIMCopyIMSI(*(const __CFDictionary **)(a1 + 80));
  CFStringRef v24 = EAPLogGetLogHandle();
  os_log_type_t v25 = _SC_syslog_os_log_mapping();
  BOOL v26 = os_log_type_enabled(v24, v25);
  if (!v18)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v24, v25, "EAP-AKA: no SIM available", buf, 2u);
    }
    return 16;
  }
  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v24, v25, "EAP-AKA: SIM found", buf, 2u);
  }
  int v21 = 0;
LABEL_34:
  long long v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 80), @"TLSTrustExceptionsID");
  os_log_type_t v28 = malloc_type_malloc(0x6F0uLL, 0x1060040FE550C1BuLL);
  if (!v28)
  {
    CFRelease(v18);
    my_CFRelease((const void **)&v47);
    my_CFRelease((const void **)&v47 + 1);
    my_CFRelease(&v48);
    return 2;
  }
  uint64_t v29 = (uint64_t)v28;
  bzero(v28, 0x6F0uLL);
  *(_DWORD *)(v29 + 16) = -1;
  *(_OWORD *)(v29 + 248) = v47;
  *(void *)(v29 + 264) = v48;
  identity_os_log_type_t type = S_get_identity_type(*(const __CFDictionary **)(a1 + 80));
  *(void *)(v29 + 208) = EAPSIMAKAPersistentStateCreate(23, 20, v18, identity_type, v27);
  CFRelease(v18);
  if (EAPSIMAKAPersistentStateGetReauthID(*(void *)(v29 + 208)))
  {
    MasterKey = (long long *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(v29 + 208));
    fips186_2prf(MasterKey, v29 + 40);
    *(unsigned char *)(v29 + 200) = 1;
    if (EAPSIMAKAPersistentStateGetReauthIDUsed(*(void *)(v29 + 208))) {
      EAPSIMAKAPersistentStateSetReauthIDUsed(*(void *)(v29 + 208), 0);
    }
  }
  uint64_t v32 = *(void *)(v29 + 208);
  if (v32) {
    BOOL v33 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v32);
  }
  else {
    BOOL v33 = 0;
  }
  unsigned __int8 v46 = 0;
  if (*(void *)(a1 + 56)) {
    goto LABEL_46;
  }
  char v45 = 0;
  CFStringRef v35 = EAPSIMAKAInitEncryptedIdentityInfo(23, *(CFDictionaryRef *)(a1 + 80), v21, &v46, &v45);
  *(void *)(v29 + 224) = v35;
  int v36 = v46;
  if (v46 == 1 && !v35)
  {
    BOOL v37 = v45 == 1 && v33;
    CFTypeID v38 = EAPLogGetLogHandle();
    if (v37)
    {
      os_log_type_t v39 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v38, v39))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v38, v39, "EAP-AKA: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
      }
      int v36 = v46;
      goto LABEL_57;
    }
    os_log_type_t v44 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v38, v44))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v38, v44, "EAP-AKA: failed to get privacy protected identity", buf, 2u);
    }
    EAPAKAContextFree(v29);
    return 16;
  }
LABEL_57:
  if (v36 == 1)
  {
    CFStringRef v40 = *(void **)(v29 + 224);
    if (v40)
    {
      if (*v40) {
        char v41 = v33;
      }
      else {
        char v41 = 1;
      }
      if ((v41 & 1) == 0)
      {
        *(unsigned char *)(v29 + 240) = 1;
        os_log_type_t v42 = EAPLogGetLogHandle();
        os_log_type_t v43 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v42, v43))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v42, v43, "EAP-AKA: using out-of-band pseudonym as an identity", buf, 2u);
        }
      }
    }
  }
LABEL_46:
  uint64_t result = 0;
  *(void *)uint64_t v29 = a1;
  *(void *)a1 = v29;
  return result;
}

void eapaka_free(uint64_t *a1)
{
  *a1 = 0;
}

uint64_t eapaka_process(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, int *a4, _DWORD *a5)
{
  uint64_t v5 = *a1;
  *a4 = 0;
  *a5 = 0;
  int v6 = *a2;
  switch(v6)
  {
    case 4:
      *(_DWORD *)(v5 + 16) = -1;
      *(_DWORD *)(v5 + 8) = 2;
      *a4 = 1;
      break;
    case 3:
      *(_DWORD *)(v5 + 16) = -1;
      if (*(_DWORD *)(v5 + 12) == 4)
      {
        *(_DWORD *)(v5 + 8) = 1;
        EAPSIMAKAPersistentStateSave(*(void *)(v5 + 208), *(unsigned __int8 *)(v5 + 200));
        if (*(unsigned char *)(v5 + 240))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v8 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v8))
          {
            *(_WORD *)int v10 = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v8, "eapaka: requesting out-of-band psuedonym refresh", v10, 2u);
          }
          SIMReportDecryptionError(0);
        }
      }
      break;
    case 1:
      *a3 = eapaka_request(v5, a2, a4, a5);
      break;
  }
  return *(unsigned int *)(v5 + 8);
}

uint64_t eapaka_failure_string()
{
  return 0;
}

uint64_t eapaka_session_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(unsigned char *)(v2 + 200)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 72;
}

uint64_t eapaka_server_key(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  if (*(_DWORD *)(*a1 + 12) != 4 || !*(unsigned char *)(v2 + 200)) {
    return 0;
  }
  *a2 = 32;
  return v2 + 104;
}

uint64_t eapaka_msk_copy_bytes(uint64_t *a1, _OWORD *a2, int a3)
{
  if (a3 < 64) {
    return 0;
  }
  uint64_t v3 = *a1;
  if (!*(unsigned char *)(*a1 + 200) || *(_DWORD *)(v3 + 12) != 4) {
    return 0;
  }
  long long v4 = *(_OWORD *)(v3 + 72);
  long long v5 = *(_OWORD *)(v3 + 88);
  long long v6 = *(_OWORD *)(v3 + 120);
  a2[2] = *(_OWORD *)(v3 + 104);
  a2[3] = v6;
  *a2 = v4;
  a2[1] = v5;
  return 64;
}

CFDictionaryRef eapaka_publish_props(uint64_t a1)
{
  keys = @"EAPAKASIMNotificationActionInfo";
  if (*(void *)(*(void *)a1 + 232)) {
    return CFDictionaryCreate(0, (const void **)&keys, (const void **)(*(void *)a1 + 232), 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  else {
    return 0;
  }
}

void *eapaka_user_name_copy(const __CFDictionary *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  __int16 v24 = 0;
  CFStringRef v2 = (const __CFString *)copy_static_imsi_0(a1);
  os_log_type_t v25 = v2;
  if (v2)
  {
    CFStringRef v3 = v2;
    int v4 = 1;
  }
  else
  {
    long long v5 = SIMCopyIMSI(a1);
    os_log_type_t v25 = v5;
    if (!v5)
    {
LABEL_31:
      long long v6 = 0;
      int v10 = 0;
      goto LABEL_32;
    }
    CFStringRef v3 = (const __CFString *)v5;
    int v4 = 0;
  }
  long long v6 = (const void **)EAPSIMAKAInitEncryptedIdentityInfo(23, a1, v4, (unsigned char *)&v24 + 1, (char *)&v24);
  identity_os_log_type_t type = S_get_identity_type(a1);
  os_log_type_t v8 = EAPSIMAKAPersistentStateCreate(23, 20, v3, identity_type, 0);
  my_CFRelease((const void **)&v25);
  if (v8)
  {
    BOOL v9 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v8);
    if (v6 && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable((uint64_t)v8))
    {
      if (*v6)
      {
        LogHandle = EAPLogGetLogHandle();
        os_log_type_t v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(LogHandle, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, LogHandle, v16, "EAP-AKA: using out-of-band pseudonym as an identity", buf, 2u);
        }
        CFStringRef v17 = *v6;
      }
      else
      {
        CFStringRef v17 = v6[1];
      }
      int v10 = (void *)CFRetain(v17);
      goto LABEL_21;
    }
    char v23 = 0;
    int v10 = (void *)sim_identity_create_0((uint64_t)v8, a1, identity_type, 1, &v23, 0);
    if (v23)
    {
      int v11 = 1;
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v8, 1);
      os_log_type_t v12 = EAPLogGetLogHandle();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        SSuint64_t ID = EAPSIMAKAPersistentStateGetSSID((uint64_t)v8);
        *(_DWORD *)buf = 138412546;
        long long v27 = v10;
        __int16 v28 = 2112;
        uint64_t v29 = SSID;
        _os_log_impl(&dword_2106D5000, v12, v13, "EAP-AKA is using fast re-auth id %@ for ssid : %@", buf, 0x16u);
      }
    }
    else
    {
      if (!EAPSIMAKAPersistentStateGetReauthIDUsed((uint64_t)v8))
      {
LABEL_21:
        EAPSIMAKAPersistentStateRelease((uint64_t)v8);
        goto LABEL_22;
      }
      EAPSIMAKAPersistentStateSetReauthID((uint64_t)v8, 0);
      EAPSIMAKAPersistentStateSetReauthIDUsed((uint64_t)v8, 0);
      int v11 = 0;
    }
    EAPSIMAKAPersistentStateSave((uint64_t)v8, v11);
    goto LABEL_21;
  }
  BOOL v9 = 0;
  int v10 = 0;
LABEL_22:
  if (HIBYTE(v24) != 1 || v6) {
    goto LABEL_32;
  }
  int v18 = v24;
  CC_SHA1_CTX v19 = EAPLogGetLogHandle();
  if (!v9 || v18 != 1)
  {
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2106D5000, v19, v21, "EAP-AKA: failed to get privacy protected identity", buf, 2u);
    }
    goto LABEL_31;
  }
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v19, v20))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2106D5000, v19, v20, "EAP-AKA: out-of-band pseudonym is not required as in-band pseudonym is available", buf, 2u);
  }
  long long v6 = 0;
LABEL_32:
  EAPSIMAKAClearEncryptedIdentityInfo(v6);
  return v10;
}

CFStringRef eapaka_copy_identity(void *a1)
{
  CFStringRef v2 = (void *)*a1;
  CFStringRef v3 = *(const void **)(*a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  v2[4] = 0;
  *(void *)((char *)v2 + 12) = 0xFFFFFFFF00000000;
  if (v2[28] && !EAPSIMAKAPersistentStateTemporaryUsernameAvailable(v2[26]))
  {
    CFStringRef result = *(CFStringRef *)(v2[28] + 8);
    if (result)
    {
      return (CFStringRef)CFRetain(result);
    }
  }
  else
  {
    uint64_t v4 = v2[26];
    CFDictionaryRef v5 = (const __CFDictionary *)a1[10];
    return sim_identity_create_0(v4, v5, 13, 1, 0, 0);
  }
  return result;
}

CFTypeRef copy_static_imsi_0(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFArrayRef Value = CFDictionaryGetValue(a1, @"EAPSIMAKAIMSI");
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  return CFRetain(Value);
}

void EAPAKAContextFree(uint64_t a1)
{
  EAPSIMAKAPersistentStateRelease(*(void *)(a1 + 208));
  CFStringRef v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 32) = 0;
  my_CFRelease((const void **)(a1 + 248));
  my_CFRelease((const void **)(a1 + 256));
  my_CFRelease((const void **)(a1 + 264));
  EAPSIMAKAClearEncryptedIdentityInfo(*(const void ***)(a1 + 224));
  my_CFRelease((const void **)(a1 + 232));
  bzero((void *)a1, 0x6F0uLL);
  free((void *)a1);
}

void EAPAKAContextSetLastIdentity(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 32) = 0;
  if (cf)
  {
    if (*(void *)(a1 + 224)
      && (!EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 208)) || *(unsigned char *)(a1 + 28) == 10))
    {
      CFStringRef v5 = **(const __CFString ***)(a1 + 224);
      if (!v5)
      {
        CFStringRef v7 = sim_identity_create_0(*(void *)(a1 + 208), *(CFDictionaryRef *)(*(void *)a1 + 80), 10, 0, 0, 0);
        *(void *)(a1 + 32) = CFStringCreateExternalRepresentation(0, v7, 0x8000100u, 0);
        my_CFRelease((const void **)&v7);
        return;
      }
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, 0x8000100u, 0);
    }
    else
    {
      ExternalRepresentation = (void *)CFRetain(cf);
    }
    *(void *)(a1 + 32) = ExternalRepresentation;
  }
}

CFStringRef sim_identity_create_0(uint64_t a1, CFDictionaryRef theDict, int a3, int a4, unsigned char *a5, _DWORD *a6)
{
  if (a5) {
    *a5 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"EAPSIMAKAIMSI") | a4) {
    BOOL v11 = theDict == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11
    && (Value = CFDictionaryGetValue(theDict, @"EAPSIMAKARealm"), CFTypeID TypeID = CFStringGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    CFRetain(Value);
  }
  else
  {
    CFArrayRef Value = SIMCopyRealm(theDict);
  }
  CFStringRef v35 = Value;
  if (a5) {
    *a5 = 0;
  }
  if (!a1)
  {
    CFStringRef v20 = 0;
    goto LABEL_47;
  }
  CFDateRef otherDate = 0;
  uint64_t Pseudonym = EAPSIMAKAPersistentStateGetPseudonym(a1, &otherDate);
  os_log_type_t v15 = (const void *)Pseudonym;
  if (a3 == 17 || a3 == 13)
  {
    Reauthuint64_t ID = EAPSIMAKAPersistentStateGetReauthID(a1);
    int ReauthIDUsed = EAPSIMAKAPersistentStateGetReauthIDUsed(a1);
    if (a3 == 13 && ReauthID && !ReauthIDUsed)
    {
      if (a5) {
        *a5 = 1;
      }
      int v18 = (const void *)ReauthID;
      goto LABEL_22;
    }
    if (v15)
    {
      if (Value)
      {
        CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"%@@%@", v15, Value, v35);
LABEL_37:
        CFStringRef v20 = v19;
        if (v19) {
          goto LABEL_47;
        }
        goto LABEL_38;
      }
      int v18 = v15;
LABEL_22:
      CFStringRef v19 = (const __CFString *)CFRetain(v18);
      goto LABEL_37;
    }
  }
  else
  {
    os_log_type_t v21 = 0;
    if (a3 != 10) {
      goto LABEL_39;
    }
    if (!Pseudonym) {
      goto LABEL_39;
    }
    os_log_type_t v21 = CFDictionaryGetValue(theDict, @"EAPSIMAKAConservativePeer");
    CFTypeID v22 = CFBooleanGetTypeID();
    if (!v21) {
      goto LABEL_39;
    }
    if (CFGetTypeID(v21) == v22 && CFBooleanGetValue((CFBooleanRef)v21))
    {
      *(_DWORD *)int valuePtr = 24;
      CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"EAPSIMAKAPseudonymIdentityLifetimeHours");
      CFTypeID v24 = CFNumberGetTypeID();
      if (v23)
      {
        int v25 = 24;
        if (CFGetTypeID(v23) == v24)
        {
          if (CFNumberGetValue(v23, kCFNumberIntType, valuePtr)) {
            int v25 = *(_DWORD *)valuePtr;
          }
          else {
            int v25 = 24;
          }
        }
      }
      else
      {
        int v25 = 24;
      }
      int v29 = v25 <= 24 ? 24 : v25;
      if (otherDate)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFDateRef v31 = CFDateCreate(0, Current);
        os_log_type_t v21 = v31;
        if (v31 && CFDateGetTimeIntervalSinceDate(v31, otherDate) < (double)(3600 * v29))
        {
          LogHandle = EAPLogGetLogHandle();
          os_log_type_t v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(LogHandle, v33))
          {
            *(_WORD *)int valuePtr = 0;
            _os_log_impl(&dword_2106D5000, LogHandle, v33, "EAP Peer is in conservative mode and pseudonym is not expired yet.", valuePtr, 2u);
          }
          CFStringRef v20 = 0;
          if (a6) {
            *a6 = 17;
          }
          goto LABEL_46;
        }
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  os_log_type_t v21 = 0;
LABEL_39:
  uint64_t IMSI = EAPSIMAKAPersistentStateGetIMSI(a1);
  if (Value) {
    CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"0%@@%@", IMSI, Value);
  }
  else {
    CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"0%@", IMSI, v34);
  }
  CFStringRef v20 = v27;
  if (a6 && !v27) {
    *a6 = 16;
  }
  if (v21) {
LABEL_46:
  }
    CFRelease(v21);
LABEL_47:
  my_CFRelease(&v35);
  return v20;
}

uint64_t eapaka_request(uint64_t a1, unsigned __int8 *a2, int *a3, _DWORD *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int Length = EAPPacketGetLength((uint64_t)a2);
  uint64_t v9 = TLVListSizeof();
  MEMORY[0x270FA5388](v9, v10, v11, v12, v13, v14, v15, v16, *(void *)buf, *(void *)&buf[8], *(void *)&buf[16], v39);
  CFStringRef v19 = (unsigned __int8 ***)&buf[-v18];
  if ((v20 & 0x7FFFFFE00) != 0) {
    size_t v21 = 512;
  }
  else {
    size_t v21 = v17;
  }
  bzero(&buf[-v18], v21);
  TLVListInit(v19);
  if (Length <= 8)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v23))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = Length;
      *(_WORD *)&uint8_t buf[8] = 2048;
      *(void *)&buf[10] = 8;
      CFTypeID v24 = "length %d <= %ld";
      int v25 = LogHandle;
      os_log_type_t v26 = v23;
      uint32_t v27 = 18;
LABEL_17:
      _os_log_impl(&dword_2106D5000, v25, v26, v24, buf, v27);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (TLVListParse_0((uint64_t)v19, a2 + 8, Length - 8))
  {
    if (*(_DWORD *)(a1 + 12) && *(_DWORD *)(a1 + 16) == a2[1]) {
      return a1 + 272;
    }
    unsigned int v29 = a2[5];
    if (v29 > 0xB)
    {
      if (v29 == 12)
      {
        uint64_t v30 = (uint64_t)eapaka_notification(a1, a2, v19, a3, a4);
        goto LABEL_36;
      }
      if (v29 == 13)
      {
        uint64_t v30 = (uint64_t)eapaka_reauthentication(a1, a2, v19, a3);
        goto LABEL_36;
      }
    }
    else
    {
      if (v29 == 1)
      {
        uint64_t v30 = (uint64_t)eapaka_challenge(a1, a2, v19, a3);
        goto LABEL_36;
      }
      if (v29 == 5)
      {
        uint64_t v30 = eapaka_identity(a1, (uint64_t)a2, (int *)v19, a3);
LABEL_36:
        uint64_t client_error_packet = v30;
        goto LABEL_19;
      }
    }
    *a3 = 17;
    CFStringRef v35 = EAPLogGetLogHandle();
    os_log_type_t v36 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v35, v36))
    {
      String = EAPSIMAKAPacketSubtypeGetString(v29);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = String;
      _os_log_impl(&dword_2106D5000, v35, v36, "unexpected Subtype %s", buf, 0xCu);
    }
    uint64_t client_error_packet = 0;
    *a3 = 17;
    goto LABEL_19;
  }
  CFDateRef v31 = EAPLogGetLogHandle();
  os_log_type_t v32 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = TLVListErrorString((uint64_t)v19);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v33;
    CFTypeID v24 = "parse failed: %s";
    int v25 = v31;
    os_log_type_t v26 = v32;
    uint32_t v27 = 12;
    goto LABEL_17;
  }
LABEL_18:
  uint64_t client_error_packet = 0;
  *a3 = 17;
LABEL_19:
  TLVListFree((uint64_t)v19);
  if (*a3) {
    *(void *)(a1 + 8) = 0x500000002;
  }
  if (!client_error_packet)
  {
    if (*a3 != 17) {
      return 0;
    }
    uint64_t client_error_packet = make_client_error_packet(a1, (uint64_t)a2);
    if (!client_error_packet) {
      return client_error_packet;
    }
  }
  *(_DWORD *)(a1 + 16) = a2[1];
  return client_error_packet;
}

const void *eapaka_challenge(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  long long v75 = 0u;
  long long v76 = 0u;
  memset(&c.data[1], 0, 64);
  uint64_t v8 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v8, v9, v10, v11, v12, v13, v14, v15, 0, 0, 0, 0);
  uint64_t v18 = (char *)&c - v17;
  if ((v19 & 0x7FFFFFE00) != 0) {
    size_t v20 = 512;
  }
  else {
    size_t v20 = v16;
  }
  bzero((char *)&c - v17, v20);
  AKAAuthResultsInit(&v75);
  *(void *)(a1 + 8) = 0x200000000;
  EAPSIMAKAPersistentStateSetCounter(*(void *)(a1 + 208), 1);
  EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 208), 0);
  *(unsigned char *)(a1 + 216) = 0;
  uint64_t v21 = TLVListLookupAttribute(a3, 1);
  if (!v21)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "eapaka: Challenge is missing AT_RAND";
    goto LABEL_37;
  }
  uint64_t v22 = v21;
  uint64_t v23 = TLVListLookupAttribute(a3, 2);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "eapaka: Challenge is missing AT_AUTN";
    goto LABEL_37;
  }
  uint64_t v24 = v23;
  uint64_t v25 = TLVListLookupAttribute(a3, 11);
  if (!v25)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "eapaka: Challenge is missing AT_MAC";
    goto LABEL_37;
  }
  uint64_t v26 = v25;
  CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
  CFDataRef v28 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(v22 + 4), 16, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFDataRef v29 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)(v24 + 4), 16, v27);
  if (*(void *)(a1 + 256))
  {
    double v30 = AKAAuthResultsInit(&v75);
    AKAAuthResultsSetCK(&v75, *(void *)(a1 + 256), v30);
    AKAAuthResultsSetIK((uint64_t)&v75, *(const void **)(a1 + 264));
    AKAAuthResultsSetRES((uint64_t)&v75, *(const void **)(a1 + 248));
    CFRelease(v28);
    CFRelease(v29);
  }
  else
  {
    BOOL v34 = SIMAuthenticateAKA(*(const __CFDictionary **)(*(void *)a1 + 80), v28, v29, (const void **)&v75);
    CFRelease(v28);
    CFRelease(v29);
    if (!v34) {
      goto LABEL_46;
    }
  }
  CFDataRef v35 = (const __CFData *)v75;
  if ((void)v75)
  {
    CC_SHA1_Init(&c);
    CFDataRef v36 = *(const __CFData **)(a1 + 32);
    if (v36)
    {
      BytePtr = CFDataGetBytePtr(v36);
      CC_LONG Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
      uint64_t v39 = BytePtr;
    }
    else
    {
      uint64_t v39 = *(const UInt8 **)(*(void *)a1 + 40);
      CC_LONG Length = *(_DWORD *)(*(void *)a1 + 48);
    }
    CC_SHA1_Update(&c, v39, Length);
    CFDataRef v51 = (const __CFData *)*((void *)&v75 + 1);
    int v52 = CFDataGetBytePtr(*((CFDataRef *)&v75 + 1));
    CC_LONG v53 = CFDataGetLength(v51);
    CC_SHA1_Update(&c, v52, v53);
    int v54 = CFDataGetBytePtr(v35);
    CC_LONG v55 = CFDataGetLength(v35);
    CC_SHA1_Update(&c, v54, v55);
    MasterKey = (unsigned __int8 *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(a1 + 208));
    CC_SHA1_Final(MasterKey, &c);
    uint32_t v57 = (long long *)EAPSIMAKAPersistentStateGetMasterKey(*(void *)(a1 + 208));
    fips186_2prf(v57, a1 + 40);
    if (EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v26 + 4, 0, 0))
    {
      if (eapaka_challenge_process_encr_data(a1, a3))
      {
        response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 1, (uint64_t)v18);
        TLV = TLVBufferAllocateTLV((uint64_t)v18, 11, 20);
        if (TLV)
        {
          os_log_type_t v59 = TLV;
          *((_WORD *)TLV + 1) = 0;
          CFDataRef v60 = (const __CFData *)v76;
          int v61 = CFDataGetLength((CFDataRef)v76);
          CFTypeRef v62 = TLVBufferAllocateTLV((uint64_t)v18, 3, v61 + 4);
          if (v62)
          {
            size_t v63 = v61;
            *((_WORD *)v62 + 1) = bswap32(8 * v61) >> 16;
            int v64 = v62 + 4;
            uint64_t v65 = CFDataGetBytePtr(v60);
            memmove(v64, v65, v63);
            __int16 v66 = TLVBufferUsed((uint64_t)v18);
            EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v66 + 8));
            EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, v59 + 4, 0, 0);
            *(_DWORD *)(a1 + 12) = 4;
            *(unsigned char *)(a1 + 200) = 1;
            goto LABEL_40;
          }
          os_log_type_t v69 = EAPLogGetLogHandle();
          os_log_type_t v70 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v69, v70)) {
            goto LABEL_46;
          }
          uint64_t v73 = TLVBufferErrorString((uint64_t)v18);
          *(_DWORD *)buf = 136315138;
          *(void *)int v78 = v73;
          uint64_t v72 = "eapaka: failed allocating AT_RES, %s";
          goto LABEL_45;
        }
        os_log_type_t v69 = EAPLogGetLogHandle();
        os_log_type_t v70 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v69, v70))
        {
          uint64_t v71 = TLVBufferErrorString((uint64_t)v18);
          *(_DWORD *)buf = 136315138;
          *(void *)int v78 = v71;
          uint64_t v72 = "eapaka: failed allocating AT_MAC, %s";
LABEL_45:
          _os_log_impl(&dword_2106D5000, v69, v70, v72, buf, 0xCu);
        }
LABEL_46:
        response_packet = 0;
        int v67 = 8;
        goto LABEL_39;
      }
LABEL_38:
      response_packet = 0;
      int v67 = 17;
LABEL_39:
      *a4 = v67;
      goto LABEL_40;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "eapaka: Challenge AT_MAC not valid";
LABEL_37:
    _os_log_impl(&dword_2106D5000, LogHandle, v32, v33, buf, 2u);
    goto LABEL_38;
  }
  CFDataRef v40 = (const __CFData *)*((void *)&v76 + 1);
  if (*((void *)&v76 + 1)) {
    char v41 = 4;
  }
  else {
    char v41 = 2;
  }
  response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, v41, (uint64_t)v18);
  if (v40)
  {
    int v43 = CFDataGetLength(v40);
    if (v43 != 14)
    {
      os_log_type_t v44 = EAPLogGetLogHandle();
      os_log_type_t v45 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v44, v45))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v78 = v43;
        *(_WORD *)&v78[4] = 1024;
        *(_DWORD *)&v78[6] = 14;
        _os_log_impl(&dword_2106D5000, v44, v45, "eapaka: SIM bogus AUTS size %d (should be %d)", buf, 0xEu);
      }
      *a4 = 8;
    }
    unsigned __int8 v46 = TLVBufferAllocateTLV((uint64_t)v18, 4, 16);
    long long v47 = CFDataGetBytePtr(v40);
    __int16 v48 = *((_WORD *)v47 + 6);
    int v49 = *((_DWORD *)v47 + 2);
    *(void *)(v46 + 2) = *(void *)v47;
    *(_DWORD *)(v46 + 10) = v49;
    *((_WORD *)v46 + 7) = v48;
  }
  __int16 v50 = TLVBufferUsed((uint64_t)v18);
  EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v50 + 8));
LABEL_40:
  AKAAuthResultsRelease((const void **)&v75);
  return response_packet;
}

uint64_t eapaka_identity(uint64_t a1, uint64_t a2, int *a3, int *a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  HIBYTE(v68) = 0;
  uint64_t v8 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v8, v9, v10, v11, v12, v13, v14, v15, v68, 0, *(void *)buf, *(void *)&buf[8]);
  uint64_t v18 = (char *)&v68 - v17;
  if ((v19 & 0x7FFFFFE00) != 0) {
    size_t v20 = 512;
  }
  else {
    size_t v20 = v16;
  }
  bzero((char *)&v68 - v17, v20);
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    uint64_t v22 = (int *)(a1 + 20);
    int v21 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 20) = v21 + 1;
    if (v21 >= 3)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v24 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(LogHandle, v24))
      {
        int v25 = *v22;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v25;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = 3;
        uint64_t v26 = "eapaka: too many Identity packets (%d > %d)";
        CFAllocatorRef v27 = LogHandle;
        os_log_type_t v28 = v24;
        uint32_t v29 = 14;
LABEL_55:
        _os_log_impl(&dword_2106D5000, v27, v28, v26, buf, v29);
        goto LABEL_56;
      }
      goto LABEL_56;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 20) = 1;
    uint64_t v22 = (int *)(a1 + 20);
    *(unsigned char *)(a1 + 28) = 0;
    *(void *)(a1 + 8) = 0x100000000;
  }
  int v30 = TLVListLookupIdentityAttribute(a3);
  int v31 = v30;
  if (v30 == 10)
  {
    if (*v22 < 2) {
      goto LABEL_22;
    }
    int v35 = *(unsigned __int8 *)(a1 + 28);
    if (v35 == 13 || v35 == 17) {
      goto LABEL_22;
    }
    CFDataRef v36 = EAPLogGetLogHandle();
    os_log_type_t v37 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v36, v37)) {
      goto LABEL_56;
    }
    String = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
    int v39 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = String;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&unsigned char buf[14] = v39;
    uint64_t v26 = "eapaka: AT_PERMANENT_ID_REQ follows %s at Identity #%d";
LABEL_54:
    CFAllocatorRef v27 = v36;
    os_log_type_t v28 = v37;
    uint32_t v29 = 18;
    goto LABEL_55;
  }
  if (v30 == 17)
  {
    if (*v22 < 2 || *(unsigned char *)(a1 + 28) == 13) {
      goto LABEL_22;
    }
    CFDataRef v36 = EAPLogGetLogHandle();
    os_log_type_t v37 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v36, v37)) {
      goto LABEL_56;
    }
    uint64_t v58 = EAPSIMAKAAttributeTypeGetString(*(unsigned __int8 *)(a1 + 28));
    int v59 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v58;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&unsigned char buf[14] = v59;
    uint64_t v26 = "eapaka: AT_FULLAUTH_ID_REQ follows %s at Identity #%d";
    goto LABEL_54;
  }
  if (v30 != 13)
  {
    __int16 v48 = EAPLogGetLogHandle();
    os_log_type_t v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      *(_WORD *)buf = 0;
      uint64_t v26 = "eapaka: AKA-Identity missing *ID_REQ";
      CFAllocatorRef v27 = v48;
      os_log_type_t v28 = v49;
      uint32_t v29 = 2;
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  if (*v22 >= 2)
  {
    os_log_type_t v32 = EAPLogGetLogHandle();
    os_log_type_t v33 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v32, v33))
    {
      int v34 = *v22;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v34;
      uint64_t v26 = "eapaka: AT_ANY_ID_REQ at Identity #%d";
      CFAllocatorRef v27 = v32;
      os_log_type_t v28 = v33;
      uint32_t v29 = 8;
      goto LABEL_55;
    }
LABEL_56:
    uint64_t response_packet = 0;
    int v60 = 17;
LABEL_57:
    *a4 = v60;
    goto LABEL_58;
  }
LABEL_22:
  *(unsigned char *)(a1 + 240) = 0;
  *(unsigned char *)(a1 + 28) = v30;
  uint64_t response_packet = make_response_packet(a1, a2, 5, (uint64_t)v18);
  char v41 = *(const void **)(*(void *)a1 + 56);
  CFTypeID TypeID = CFDataGetTypeID();
  if (v41 && CFGetTypeID(v41) == TypeID && CFDataGetLength(*(CFDataRef *)(*(void *)a1 + 56)) >= 1)
  {
    ExternalRepresentation = CFRetain(*(CFTypeRef *)(*(void *)a1 + 56));
    os_log_type_t v69 = ExternalRepresentation;
    goto LABEL_64;
  }
  os_log_type_t v44 = *(uint64_t **)(a1 + 224);
  if (!v44)
  {
LABEL_45:
    CFStringRef v54 = sim_identity_create_0(*(void *)(a1 + 208), *(CFDictionaryRef *)(*(void *)a1 + 80), v31, 0, (unsigned char *)&v68 + 7, a4);
    *(void *)buf = v54;
    if (v54)
    {
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v54, 0x8000100u, 0);
      os_log_type_t v69 = ExternalRepresentation;
      EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
      my_CFRelease((const void **)buf);
      goto LABEL_64;
    }
    if (*a4 == 17)
    {
      CC_LONG v55 = EAPLogGetLogHandle();
      os_log_type_t v56 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v55, v56))
      {
LABEL_62:
        uint64_t response_packet = 0;
        goto LABEL_58;
      }
      LOWORD(v68) = 0;
      uint32_t v57 = "eapaka: protocol error.";
    }
    else
    {
      if (*a4 != 16) {
        goto LABEL_62;
      }
      CC_LONG v55 = EAPLogGetLogHandle();
      os_log_type_t v56 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v55, v56)) {
        goto LABEL_62;
      }
      LOWORD(v68) = 0;
      uint32_t v57 = "eapaka: can't find SIM identity";
    }
    _os_log_impl(&dword_2106D5000, v55, v56, v57, (uint8_t *)&v68, 2u);
    goto LABEL_62;
  }
  if (v44[2])
  {
    BOOL v45 = EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 208));
    unsigned __int8 v46 = *(uint64_t **)(a1 + 224);
    if (v31 == 10 || !v45)
    {
      ExternalRepresentation = CFRetain((CFTypeRef)v46[2]);
      os_log_type_t v69 = ExternalRepresentation;
      EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
      goto LABEL_64;
    }
    if (!v46) {
      goto LABEL_45;
    }
    uint64_t v47 = *v46;
  }
  else
  {
    uint64_t v47 = *v44;
    if (v31 == 10 && v47)
    {
      *a4 = 17;
      if (EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 208)))
      {
        __int16 v50 = EAPLogGetLogHandle();
        os_log_type_t v51 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v50, v51))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v50, v51, "eapaka: purging all the temporary identities", buf, 2u);
        }
        EAPSIMAKAPersistentStatePurgeTemporaryIDs(*(void *)(a1 + 208));
      }
      int v52 = EAPLogGetLogHandle();
      os_log_type_t v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v52, v53, "eapaka: requesting out-of-band psuedonym", buf, 2u);
      }
      SIMReportDecryptionError(0);
      goto LABEL_62;
    }
  }
  if (!v47 || EAPSIMAKAPersistentStateTemporaryUsernameAvailable(*(void *)(a1 + 208))) {
    goto LABEL_45;
  }
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, **(CFStringRef **)(a1 + 224), 0x8000100u, 0);
  os_log_type_t v69 = ExternalRepresentation;
  EAPAKAContextSetLastIdentity(a1, ExternalRepresentation);
  *(unsigned char *)(a1 + 240) = 1;
LABEL_64:
  BytePtr = CFDataGetBytePtr((CFDataRef)ExternalRepresentation);
  signed int Length = CFDataGetLength((CFDataRef)ExternalRepresentation);
  if (!TLVBufferAddIdentity((uint64_t)v18, BytePtr, Length))
  {
    uint64_t v65 = EAPLogGetLogHandle();
    os_log_type_t v66 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = TLVBufferErrorString((uint64_t)v18);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v67;
      _os_log_impl(&dword_2106D5000, v65, v66, "eapaka: can't add AT_IDENTITY, %s", buf, 0xCu);
    }
    uint64_t response_packet = 0;
    int v60 = 8;
    goto LABEL_57;
  }
  if (!HIBYTE(v68)) {
    *(unsigned char *)(a1 + 200) = 0;
  }
  __int16 v64 = TLVBufferUsed((uint64_t)v18);
  EAPPacketSetLength(response_packet, (unsigned __int16)(v64 + 8));
LABEL_58:
  my_CFRelease(&v69);
  return response_packet;
}

const void *eapaka_notification(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4, _DWORD *a5)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  uint64_t v10 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v10, v11, v12, v13, v14, v15, v16, v17, v110, v111, v112, v113);
  size_t v20 = (char *)&v110 - v19;
  if ((v21 & 0x7FFFFFE00) != 0) {
    size_t v22 = 512;
  }
  else {
    size_t v22 = v18;
  }
  bzero((char *)&v110 - v19, v22);
  *a4 = 0;
  *a5 = 0;
  uint64_t v23 = TLVListLookupAttribute(a3, 12);
  if (!v23)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    CFAllocatorRef v27 = "eapaka: Notification does not contain AT_NOTIFICATION attribute";
LABEL_32:
    os_log_type_t v28 = LogHandle;
    os_log_type_t v29 = v32;
    uint32_t v30 = 2;
    goto LABEL_33;
  }
  unsigned int v24 = bswap32(*(unsigned __int16 *)(v23 + 2)) >> 16;
  if (v24 >= 0xC000)
  {
    int v25 = EAPLogGetLogHandle();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v119 = v24;
      CFAllocatorRef v27 = "eapaka: Notification code '%d' indicates success before authentication";
      os_log_type_t v28 = v25;
      os_log_type_t v29 = v26;
      uint32_t v30 = 8;
LABEL_33:
      _os_log_impl(&dword_2106D5000, v28, v29, v27, buf, v30);
    }
LABEL_34:
    uint64_t response_packet = 0;
    int v58 = 17;
LABEL_35:
    *a4 = v58;
    return response_packet;
  }
  uint64_t v33 = TLVListLookupAttribute(a3, 11);
  if (v33)
  {
    if ((v24 & 0x4000) != 0)
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v32)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      CFAllocatorRef v27 = "eapaka: Notification incorrectly contains AT_MAC";
      goto LABEL_32;
    }
    if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v33 + 4, 0, 0))
    {
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v32)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      CFAllocatorRef v27 = "eapaka: Notification AT_MAC not valid";
      goto LABEL_32;
    }
  }
  else if ((v24 & 0x4000) == 0)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v32)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    CFAllocatorRef v27 = "eapaka: Notification is missing AT_MAC";
    goto LABEL_32;
  }
  unsigned int Counter = EAPSIMAKAPersistentStateGetCounter(*(void *)(a1 + 208));
  if ((v24 & 0x4000) == 0 && *(unsigned char *)(a1 + 216))
  {
    unsigned int v114 = Counter;
    uint64_t v35 = TLVListSizeof();
    int v115 = &v110;
    MEMORY[0x270FA5388](v35, v36, v37, v38, v39, v40, v41, v42, v110, v111, v112, v113);
    BOOL v45 = (unsigned __int8 ***)((char *)&v110 - v44);
    if ((v46 & 0x7FFFFFE00) != 0) {
      size_t v47 = 512;
    }
    else {
      size_t v47 = v43;
    }
    bzero((char *)&v110 - v44, v47);
    uint64_t v48 = TLVListLookupAttribute(a3, 130);
    uint64_t v49 = TLVListLookupAttribute(a3, 129);
    uint64_t v50 = v49;
    if (v48 && v49)
    {
      TLVListInit(v45);
      int v111 = (const void *)(a1 + 40);
      os_log_type_t v51 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v48, v50, (uint64_t)v45);
      if (!v51)
      {
        int v80 = EAPLogGetLogHandle();
        os_log_type_t v81 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v80, v81))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v80, v81, "eapaka: failed to decrypt Notification AT_ENCR_DATA", buf, 2u);
        }
        int v76 = 8;
        goto LABEL_57;
      }
      int v112 = v51;
      int v113 = TLVListCopyDescription(v45);
      int v52 = EAPLogGetLogHandle();
      os_log_type_t v53 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v52, v53))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v119 = v113;
        _os_log_impl(&dword_2106D5000, v52, v53, "Decrypted TLVs:\n%@", buf, 0xCu);
      }
      CFRelease(v113);
      uint64_t v54 = TLVListLookupAttribute(v45, 19);
      uint64_t v55 = v54;
      if (v54) {
        unsigned int v56 = bswap32(*(unsigned __int16 *)(v54 + 2)) >> 16;
      }
      else {
        unsigned int v56 = 0;
      }
      free(v112);
      TLVListFree((uint64_t)v45);
      if (v55)
      {
        unsigned int v88 = v114;
        if (v56 == v114)
        {
          uint64_t response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 12, (uint64_t)v20);
          uint64_t v89 = TLVBufferSizeof();
          MEMORY[0x270FA5388](v89, v90, v91, v92, v93, v94, v95, v96, v110, v111, v112, v113);
          int v99 = (char *)&v110 - v98;
          if ((v100 & 0x7FFFFFE00) != 0) {
            size_t v101 = 512;
          }
          else {
            size_t v101 = v97;
          }
          bzero((char *)&v110 - v98, v101);
          TLVBufferInit((uint64_t)v99, (uint64_t)buf, 16);
          if (TLVBufferAddCounter((uint64_t)v99, v88))
          {
            if (EAPSIMAKAKeyInfoEncryptTLVs(v111, (uint64_t)v20, (uint64_t)v99))
            {
              if (!v33) {
                goto LABEL_40;
              }
              goto LABEL_38;
            }
            int v109 = 8;
          }
          else
          {
            int v106 = EAPLogGetLogHandle();
            os_log_type_t v107 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v106, v107))
            {
              uint64_t v108 = TLVBufferErrorString((uint64_t)v99);
              *(_DWORD *)int v116 = 136315138;
              uint64_t v117 = v108;
              _os_log_impl(&dword_2106D5000, v106, v107, "eapaka: failed to allocate AT_COUNTER, %s", v116, 0xCu);
            }
            int v109 = 2;
          }
          *a4 = v109;
          return 0;
        }
        int v104 = EAPLogGetLogHandle();
        os_log_type_t v105 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v104, v105)) {
          goto LABEL_49;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v119 = v56;
        *(_WORD *)&v119[4] = 1024;
        *(_DWORD *)&v119[6] = v88;
        uint64_t v72 = "eapaka: Notification AT_COUNTER (%d) does not match current counter (%d)";
        uint64_t v73 = v104;
        os_log_type_t v74 = v105;
        uint32_t v75 = 14;
      }
      else
      {
        int v102 = EAPLogGetLogHandle();
        os_log_type_t v103 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v102, v103)) {
          goto LABEL_49;
        }
        *(_WORD *)buf = 0;
        uint64_t v72 = "eapaka:  Notification AT_ENCR_DATA missing AT_COUNTER";
        uint64_t v73 = v102;
        os_log_type_t v74 = v103;
        uint32_t v75 = 2;
      }
    }
    else
    {
      os_log_type_t v70 = EAPLogGetLogHandle();
      os_log_type_t v71 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v70, v71))
      {
LABEL_49:
        int v76 = 17;
LABEL_57:
        *a4 = v76;
        return 0;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)int v119 = v48;
      *(_WORD *)&v119[8] = 2048;
      uint64_t v120 = v50;
      uint64_t v72 = "eapaka: Notification after re-auth missing AT_ENCR_DATA (%p) or AT_IV (%p)";
      uint64_t v73 = v70;
      os_log_type_t v74 = v71;
      uint32_t v75 = 22;
    }
    _os_log_impl(&dword_2106D5000, v73, v74, v72, buf, v75);
    goto LABEL_49;
  }
  uint64_t response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 12, (uint64_t)v20);
  if (!v33) {
    goto LABEL_40;
  }
LABEL_38:
  TLV = TLVBufferAllocateTLV((uint64_t)v20, 11, 20);
  if (!TLV)
  {
    int v77 = EAPLogGetLogHandle();
    os_log_type_t v78 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = TLVBufferErrorString((uint64_t)v20);
      *(_DWORD *)buf = 136315138;
      *(void *)int v119 = v79;
      _os_log_impl(&dword_2106D5000, v77, v78, "eapaka: failed allocating AT_MAC, %s", buf, 0xCu);
    }
    uint64_t response_packet = 0;
    int v58 = 2;
    goto LABEL_35;
  }
  uint64_t v33 = (uint64_t)TLV;
  *((_WORD *)TLV + 1) = 0;
LABEL_40:
  __int16 v61 = TLVBufferUsed((uint64_t)v20);
  EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v61 + 8));
  if (v33) {
    EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, (_OWORD *)(v33 + 4), 0, 0);
  }
  if ((v24 & 0x8000) != 0)
  {
    *(_DWORD *)(a1 + 12) = 4;
    return response_packet;
  }
  *(_DWORD *)(a1 + 12) = 5;
  *a4 = 1002;
  *a5 = EAPSIMAKAStatusForATNotificationCode(v24);
  String = ATNotificationCodeGetString(v24);
  size_t v63 = EAPLogGetLogHandle();
  os_log_type_t v64 = _SC_syslog_os_log_mapping();
  BOOL v65 = os_log_type_enabled(v63, v64);
  if (String)
  {
    if (!v65) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)int v119 = String;
    os_log_type_t v66 = "eapaka: Notification: %s";
    uint64_t v67 = v63;
    os_log_type_t v68 = v64;
    uint32_t v69 = 12;
  }
  else
  {
    if (!v65) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v119 = v24;
    os_log_type_t v66 = "eapaka: Notification code '%d' unrecognized failure";
    uint64_t v67 = v63;
    os_log_type_t v68 = v64;
    uint32_t v69 = 8;
  }
  _os_log_impl(&dword_2106D5000, v67, v68, v66, buf, v69);
LABEL_62:
  CFDictionaryRef v82 = (const __CFDictionary *)EAPSIMAKAActionInfoForNotificationCode(*(const __CFDictionary **)(*(void *)a1 + 80), v24);
  if (v82)
  {
    CFDictionaryRef v83 = v82;
    *(void *)(a1 + 232) = CFDictionaryCreateCopy(0, v82);
    int v84 = EAPLogGetLogHandle();
    os_log_type_t v85 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v84, v85))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v119 = v83;
      _os_log_impl(&dword_2106D5000, v84, v85, "eapaka: Notification Action Info: %@", buf, 0xCu);
    }
  }
  else if (*a5 == 19)
  {
    uint64_t v86 = *(void *)(a1 + 224);
    if (v86)
    {
      uint64_t v87 = *(void *)(v86 + 16);
      if (v87) {
        SIMReportDecryptionError(v87);
      }
    }
  }
  return response_packet;
}

const void *eapaka_reauthentication(uint64_t a1, const void *a2, unsigned __int8 ***a3, int *a4)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v8 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v8, v9, v10, v11, v12, v13, v14, v15, v84, v85, v86, v87);
  size_t v18 = (char *)&v84 - v17;
  if ((v19 & 0x7FFFFFE00) != 0) {
    size_t v20 = 512;
  }
  else {
    size_t v20 = v16;
  }
  bzero((char *)&v84 - v17, v20);
  uint64_t v21 = TLVListSizeof();
  MEMORY[0x270FA5388](v21, v22, v23, v24, v25, v26, v27, v28, v84, v85, v86, v87);
  int v31 = (unsigned __int8 ***)((char *)&v84 - v30);
  if ((v32 & 0x7FFFFFE00) != 0) {
    size_t v33 = 512;
  }
  else {
    size_t v33 = v29;
  }
  bzero((char *)&v84 - v30, v33);
  uint64_t v34 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v34, v35, v36, v37, v38, v39, v40, v41, v84, v85, v86, v87);
  uint64_t v44 = (char *)&v84 - v43;
  if ((v45 & 0x7FFFFFE00) != 0) {
    size_t v46 = 512;
  }
  else {
    size_t v46 = v42;
  }
  bzero((char *)&v84 - v43, v46);
  TLVListInit(v31);
  if (!*(unsigned char *)(a1 + 200))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka: Reauthentication but no key info available";
LABEL_40:
    _os_log_impl(&dword_2106D5000, LogHandle, v68, v69, buf, 2u);
    goto LABEL_41;
  }
  if (!EAPSIMAKAPersistentStateGetReauthID(*(void *)(a1 + 208)))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka: received Reauthentication but don't have reauth id";
    goto LABEL_40;
  }
  *(void *)(a1 + 8) = 0x300000000;
  EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 208), 0);
  uint64_t v47 = TLVListLookupAttribute(a3, 11);
  if (!v47)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka: Reauthentication is missing AT_MAC";
    goto LABEL_40;
  }
  if (!EAPSIMAKAKeyInfoVerifyMAC(a1 + 40, a2, v47 + 4, 0, 0))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka: Reauthentication AT_MAC not valid";
    goto LABEL_40;
  }
  uint64_t v48 = TLVListLookupAttribute(a3, 130);
  uint64_t v49 = TLVListLookupAttribute(a3, 129);
  uint64_t v50 = v49;
  if (!v48 || !v49)
  {
    if (!v48)
    {
      os_log_type_t v71 = EAPLogGetLogHandle();
      os_log_type_t v72 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v71, v72))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2106D5000, v71, v72, "eapaka:  Reauthentication missing AT_ENCR_DATA", buf, 2u);
      }
    }
    if (v50) {
      goto LABEL_41;
    }
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v68 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v68)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka:  Reauthentication missing AT_IV";
    goto LABEL_40;
  }
  os_log_type_t v51 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v48, v49, (uint64_t)v31);
  if (v51)
  {
    uint64_t v86 = v51;
    uint64_t v87 = TLVListCopyDescription(v31);
    int v52 = EAPLogGetLogHandle();
    os_log_type_t v53 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v52, v53))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v91 = v87;
      _os_log_impl(&dword_2106D5000, v52, v53, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v87);
    uint64_t v54 = TLVListLookupAttribute(v31, 21);
    uint64_t v55 = TLVListLookupAttribute(v31, 19);
    uint64_t v56 = v55;
    if (!v54 || !v55)
    {
      if (!v54)
      {
        uint64_t v73 = EAPLogGetLogHandle();
        os_log_type_t v74 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v73, v74))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v73, v74, "eapaka: Reauthentication AT_ENCR_DATA missing AT_NONCE_S", buf, 2u);
        }
      }
      if (!v56)
      {
        uint32_t v75 = EAPLogGetLogHandle();
        os_log_type_t v76 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v75, v76))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2106D5000, v75, v76, "eapaka: Reauthentication AT_ENCR_DATA missing AT_COUNTER", buf, 2u);
        }
      }
      uint64_t response_packet = 0;
      int v77 = 17;
      goto LABEL_66;
    }
    uint64_t v85 = v54;
    unsigned int v57 = bswap32(*(unsigned __int16 *)(v55 + 2)) >> 16;
    LODWORD(v87) = EAPSIMAKAPersistentStateGetCounter(*(void *)(a1 + 208));
    if (v57 >= v87)
    {
      uint64_t v84 = v56;
      CFStringRef StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v31, 133);
      if (StringFromAttribute)
      {
        CFStringRef v59 = StringFromAttribute;
        EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 208), StringFromAttribute);
        CFRelease(v59);
      }
      EAPSIMAKAPersistentStateSetCounter(*(void *)(a1 + 208), v57 + 1);
      uint64_t v56 = v84;
    }
    uint64_t response_packet = (const void *)make_response_packet(a1, (uint64_t)a2, 13, (uint64_t)v44);
    TLVBufferInit((uint64_t)v18, (uint64_t)buf, 16);
    if (TLVBufferAddCounter((uint64_t)v18, v57))
    {
      LODWORD(v84) = v57;
      BOOL v61 = v57 >= v87;
      unsigned int v62 = v87;
      if (v61 || TLVBufferAddCounterTooSmall((uint64_t)v18))
      {
        if (!EAPSIMAKAKeyInfoEncryptTLVs((const void *)(a1 + 40), (uint64_t)v44, (uint64_t)v18)) {
          goto LABEL_65;
        }
        TLV = TLVBufferAllocateTLV((uint64_t)v44, 11, 20);
        if (TLV)
        {
          os_log_type_t v64 = TLV;
          *((_WORD *)TLV + 1) = 0;
          __int16 v65 = TLVBufferUsed((uint64_t)v44);
          EAPPacketSetLength((uint64_t)response_packet, (unsigned __int16)(v65 + 8));
          uint64_t v66 = v85;
          EAPSIMAKAKeyInfoSetMAC(a1 + 40, response_packet, v64 + 4, (const void *)(v85 + 4), 16);
          if (v84 >= v62)
          {
            *(_DWORD *)(a1 + 12) = 4;
            eapaka_compute_reauth_key(a1, v56, v66);
            *(unsigned char *)(a1 + 200) = 1;
            *(unsigned char *)(a1 + 216) = 1;
          }
          else
          {
            *(unsigned char *)(a1 + 200) = 0;
          }
          goto LABEL_67;
        }
        os_log_type_t v78 = EAPLogGetLogHandle();
        os_log_type_t v79 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v78, v79)) {
          goto LABEL_65;
        }
        uint64_t v83 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)unsigned int v88 = 136315138;
        uint64_t v89 = v83;
        os_log_type_t v81 = "eapaka: failed allocating AT_MAC, %s";
        goto LABEL_64;
      }
      os_log_type_t v78 = EAPLogGetLogHandle();
      os_log_type_t v79 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v82 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)unsigned int v88 = 136315138;
        uint64_t v89 = v82;
        os_log_type_t v81 = "eapaka: failed allocating AT_COUNTER_TOO_SMALL, %s";
        goto LABEL_64;
      }
    }
    else
    {
      os_log_type_t v78 = EAPLogGetLogHandle();
      os_log_type_t v79 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = TLVBufferErrorString((uint64_t)v44);
        *(_DWORD *)unsigned int v88 = 136315138;
        uint64_t v89 = v80;
        os_log_type_t v81 = "eapaka: failed allocating AT_COUNTER, %s";
LABEL_64:
        _os_log_impl(&dword_2106D5000, v78, v79, v81, v88, 0xCu);
      }
    }
LABEL_65:
    uint64_t response_packet = 0;
    int v77 = 8;
LABEL_66:
    *a4 = v77;
LABEL_67:
    free(v86);
    goto LABEL_42;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v68 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v68))
  {
    *(_WORD *)buf = 0;
    uint32_t v69 = "eapaka: failed to decrypt Reauthentication AT_ENCR_DATA";
    goto LABEL_40;
  }
LABEL_41:
  uint64_t response_packet = 0;
  *a4 = 17;
LABEL_42:
  TLVListFree((uint64_t)v31);
  return response_packet;
}

uint64_t make_client_error_packet(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = TLVBufferSizeof();
  MEMORY[0x270FA5388](v4, v5, v6, v7, v8, v9, v10, v11, buf, *((void *)&buf + 1), v25, v26);
  uint64_t v14 = (char *)&buf - v13;
  if ((v15 & 0x7FFFFFE00) != 0) {
    size_t v16 = 512;
  }
  else {
    size_t v16 = v12;
  }
  bzero((char *)&buf - v13, v16);
  uint64_t response_packet = make_response_packet(a1, a2, 14, (uint64_t)v14);
  TLV = TLVBufferAllocateTLV((uint64_t)v14, 22, 4);
  if (TLV)
  {
    *((_WORD *)TLV + 1) = 0;
    __int16 v19 = TLVBufferUsed((uint64_t)v14);
    EAPPacketSetLength(response_packet, (unsigned __int16)(v19 + 8));
  }
  else
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v21))
    {
      uint64_t v22 = TLVBufferErrorString((uint64_t)v14);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_2106D5000, LogHandle, v21, "eapaka: failed allocating AT_CLIENT_ERROR_CODE, %s", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return response_packet;
}

uint64_t make_response_packet(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = a1 + 272;
  TLVBufferInit(a4, a1 + 280, 1492);
  *(unsigned char *)(a1 + 272) = 2;
  *(unsigned char *)(a1 + 273) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 276) = 23;
  *(unsigned char *)(a1 + 277) = a3;
  *(_WORD *)(a1 + 278) = 0;
  return v7;
}

BOOL eapaka_challenge_process_encr_data(uint64_t a1, unsigned __int8 ***a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  TLVListSizeof();
  MEMORY[0x270FA5388]();
  uint64_t v6 = &buf[-v5];
  if ((v7 & 0x7FFFFFE00) != 0) {
    size_t v8 = 512;
  }
  else {
    size_t v8 = v4;
  }
  bzero(&buf[-v5], v8);
  TLVListInit(v6);
  uint64_t v9 = TLVListLookupAttribute(a2, 130);
  if (!v9) {
    return 1;
  }
  uint64_t v10 = v9;
  uint64_t v11 = TLVListLookupAttribute(a2, 129);
  if (!v11)
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(LogHandle, v23);
    if (!result) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v24 = "eapaka: Challenge missing AT_IV";
    goto LABEL_19;
  }
  size_t v12 = EAPSIMAKAKeyInfoDecryptTLVList((const void *)(a1 + 40), v10, v11, (uint64_t)v6);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = TLVListCopyDescription((unsigned __int8 ***)v6);
    uint64_t v15 = EAPLogGetLogHandle();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v14;
      _os_log_impl(&dword_2106D5000, v15, v16, "Decrypted TLVs:\n%@", buf, 0xCu);
    }
    CFRelease(v14);
    CFStringRef StringFromAttribute = TLVListCreateStringFromAttribute((uint64_t)v6, 133);
    if (StringFromAttribute)
    {
      CFStringRef v18 = StringFromAttribute;
      EAPSIMAKAPersistentStateSetReauthID(*(void *)(a1 + 208), StringFromAttribute);
      CFRelease(v18);
    }
    CFStringRef v19 = TLVListCreateStringFromAttribute((uint64_t)v6, 132);
    if (v19)
    {
      CFStringRef v20 = v19;
      EAPSIMAKAPersistentStateSetPseudonym(*(void *)(a1 + 208), v19);
      CFRelease(v20);
    }
    free(v13);
    TLVListFree((uint64_t)v6);
    return 1;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v23 = _SC_syslog_os_log_mapping();
  BOOL result = os_log_type_enabled(LogHandle, v23);
  if (result)
  {
    *(_WORD *)long long buf = 0;
    uint64_t v24 = "eapaka: Challenge decrypt AT_ENCR_DATA failed";
LABEL_19:
    _os_log_impl(&dword_2106D5000, LogHandle, v23, v24, buf, 2u);
    return 0;
  }
  return result;
}

double eapaka_compute_reauth_key(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFDataRef v6 = *(const __CFData **)(a1 + 32);
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(v6);
    CC_LONG Length = CFDataGetLength(*(CFDataRef *)(a1 + 32));
  }
  else
  {
    BytePtr = *(const UInt8 **)(*(void *)a1 + 40);
    CC_LONG Length = *(_DWORD *)(*(void *)a1 + 48);
  }
  uint64_t v9 = *(void *)(a1 + 208);
  return EAPSIMAKAKeyInfoComputeReauthKey((_OWORD *)(a1 + 40), v9, BytePtr, Length, a2, a3);
}

os_log_t EAPLogGetLogHandle()
{
  os_log_t result = (os_log_t)S_eap_logger;
  if (!S_eap_logger)
  {
    os_log_t result = os_log_create("com.apple.eapol", "Framework");
    S_eap_logger = (uint64_t)result;
  }
  return result;
}

os_log_t EAPLogInit(os_log_t result)
{
  if (result <= 3)
  {
    os_log_t result = os_log_create("com.apple.eapol", S_eap_os_log_categories[result]);
    S_eap_logger = (uint64_t)result;
  }
  return result;
}

void EAPOLControlPrefsSynchronize()
{
  if (S_prefs) {
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
  }
  uint32_t v0 = (const __SCPreferences *)S_managed_prefs;
  if (S_managed_prefs)
  {
    SCPreferencesSynchronize(v0);
  }
}

const __SCPreferences *EAPOLControlPrefsInit(__CFRunLoop *a1, uint64_t (*a2)(void))
{
  os_log_t result = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"com.apple.eapolclient.plist");
  S_prefs = (uint64_t)result;
  if (a1)
  {
    if (a2)
    {
      S_callbacuint64_t k = a2;
      SCPreferencesSetCallback(result, (SCPreferencesCallBack)EAPOLControlPrefsChanged, 0);
      CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE78];
      SCPreferencesScheduleWithRunLoop((SCPreferencesRef)S_prefs, a1, (CFStringRef)*MEMORY[0x263EFFE78]);
      memset(&context, 0, 72);
      context.perforuint64_t m = (void (__cdecl *)(void *))prefs_changed;
      CFDataRef v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &context);
      CFRunLoopAddSource(a1, v6, v5);
      dispatch_get_global_queue(0, 0);
      _scprefs_observer_watch();
      return (const __SCPreferences *)S_prefs;
    }
  }
  return result;
}

uint64_t EAPOLControlPrefsChanged()
{
  if (S_callback) {
    return S_callback(S_prefs);
  }
  return result;
}

uint64_t EAPOLControlPrefsGetLogFlags()
{
  unsigned int valuePtr = 0;
  uint32_t v0 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    uint32_t v0 = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"/Library/Managed Preferences/mobile/com.apple.eapol.control.plist");
    S_managed_prefs = (uint64_t)v0;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(v0, @"LogFlags");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFStringRef v3 = (const __SCPreferences *)S_prefs;
    if (!S_prefs)
    {
      CFStringRef v3 = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"com.apple.eapolclient.plist");
      S_prefs = (uint64_t)v3;
    }
    CFPropertyListRef Value = SCPreferencesGetValue(v3, @"LogFlags");
    CFTypeID v4 = CFNumberGetTypeID();
    if (!Value || CFGetTypeID(Value) != v4) {
      return 0;
    }
  }
  CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

uint64_t EAPOLControlPrefsGetUseBoringSSL()
{
  return prefs_get_BOOLean(@"UseBoringSSL");
}

uint64_t prefs_get_BOOLean(CFStringRef key)
{
  CFStringRef v2 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    CFStringRef v2 = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"/Library/Managed Preferences/mobile/com.apple.eapol.control.plist");
    S_managed_prefs = (uint64_t)v2;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(v2, key);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFStringRef v5 = (const __SCPreferences *)S_prefs;
    if (!S_prefs)
    {
      CFStringRef v5 = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"com.apple.eapolclient.plist");
      S_prefs = (uint64_t)v5;
    }
    CFPropertyListRef Value = SCPreferencesGetValue(v5, key);
    CFTypeID v6 = CFBooleanGetTypeID();
    if (!Value || CFGetTypeID(Value) != v6) {
      return 1;
    }
  }
  return CFBooleanGetValue((CFBooleanRef)Value);
}

uint64_t EAPOLControlPrefsSetLogFlags(int a1)
{
  int valuePtr = a1;
  if (a1)
  {
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    prefs_set_number(v2);
    my_CFRelease((const void **)&v2);
  }
  else
  {
    prefs_set_number(0);
  }
  return EAPOLControlPrefsSave();
}

SCPreferencesRef prefs_set_number(const void *a1)
{
  CFNumberRef v2 = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (SCPreferencesRef result = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"com.apple.eapolclient.plist"),
        CFNumberRef v2 = result,
        (S_prefs = (uint64_t)result) != 0))
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (a1 && CFGetTypeID(a1) == TypeID)
    {
      return (SCPreferencesRef)SCPreferencesSetValue(v2, @"LogFlags", a1);
    }
    else
    {
      return (SCPreferencesRef)SCPreferencesRemoveValue(v2, @"LogFlags");
    }
  }
  return result;
}

uint64_t EAPOLControlPrefsSave()
{
  uint64_t result = S_prefs;
  if (S_prefs)
  {
    uint64_t v1 = SCPreferencesCommitChanges((SCPreferencesRef)S_prefs);
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
    return v1;
  }
  return result;
}

uint64_t EAPOLControlPrefsSetUseBoringSSL(int a1)
{
  uint64_t v1 = (const void **)MEMORY[0x263EFFB40];
  if (!a1) {
    uint64_t v1 = (const void **)MEMORY[0x263EFFB38];
  }
  prefs_set_BOOLean(@"UseBoringSSL", *v1);
  return EAPOLControlPrefsSave();
}

SCPreferencesRef prefs_set_BOOLean(const __CFString *a1, const void *a2)
{
  CFTypeID v4 = (const __SCPreferences *)S_prefs;
  if (S_prefs
    || (SCPreferencesRef result = SCPreferencesCreate(0, @"EAPOLControlPrefs", @"com.apple.eapolclient.plist"),
        CFTypeID v4 = result,
        (S_prefs = (uint64_t)result) != 0))
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (a2 && CFGetTypeID(a2) == TypeID)
    {
      return (SCPreferencesRef)SCPreferencesSetValue(v4, a1, a2);
    }
    else
    {
      return (SCPreferencesRef)SCPreferencesRemoveValue(v4, a1);
    }
  }
  return result;
}

uint64_t EAPOLControlPrefsSetRevocationCheck(int a1)
{
  uint64_t v1 = (const void **)MEMORY[0x263EFFB40];
  if (!a1) {
    uint64_t v1 = (const void **)MEMORY[0x263EFFB38];
  }
  prefs_set_BOOLean(@"EnableRevocationCheck", *v1);
  return EAPOLControlPrefsSave();
}

uint64_t EAPOLControlPrefsGetRevocationCheck()
{
  return prefs_get_BOOLean(@"EnableRevocationCheck");
}

uint64_t prefs_changed()
{
  if (S_callback) {
    return S_callback(S_prefs);
  }
  return result;
}

void __enable_prefs_observer_block_invoke(uint64_t a1)
{
  CFNumberRef v2 = *(__CFRunLoopSource **)(a1 + 32);
  if (v2)
  {
    CFRunLoopSourceSignal(v2);
    CFStringRef v3 = *(__CFRunLoop **)(a1 + 40);
    if (v3)
    {
      CFRunLoopWakeUp(v3);
    }
  }
}

BOOL EAPTLSSecTrustSaveExceptionsBinding(__SecTrust *a1, const __CFString *a2, const void *a3, void *a4)
{
  CFDataRef v7 = SecTrustCopyExceptions(a1);
  CFDataRef v8 = v7;
  CFDataRef v25 = v7;
  if (v7)
  {
    keys = a4;
    *(void *)long long buf = a3;
    values = v7;
    exceptions_change_check();
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE50];
    uint64_t v11 = (__CFDictionary *)CFPreferencesCopyValue(a2, @"com.apple.network.eapclient.tls.TrustExceptions", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    uint64_t v27 = v11;
    if (v11)
    {
      CFDictionaryRef v12 = v11;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v12) == TypeID)
      {
        CFPropertyListRef Value = CFDictionaryGetValue(v12, a3);
        CFTypeID v15 = CFDictionaryGetTypeID();
        if (Value && CFGetTypeID(Value) == v15)
        {
          CFTypeRef cf = Value;
          os_log_type_t v16 = CFDictionaryGetValue((CFDictionaryRef)Value, a4);
          CFTypeID v17 = CFDataGetTypeID();
          if (v16 && CFGetTypeID(v16) == v17 && CFEqual(v16, v8)) {
            goto LABEL_17;
          }
          CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
          CFDictionarySetValue(MutableCopy, a4, v8);
        }
        else
        {
          CFMutableArrayRef MutableCopy = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        }
        CFTypeRef cf = MutableCopy;
        os_log_type_t v23 = CFDictionaryCreateMutableCopy(0, 0, v12);
        CFDictionarySetValue(v23, a3, MutableCopy);
        CFRelease(v12);
LABEL_16:
        uint64_t v27 = v23;
        CFRelease(MutableCopy);
        CFPreferencesSetValue(a2, v23, @"com.apple.network.eapclient.tls.TrustExceptions", v9, v10);
        CFPreferencesSynchronize(@"com.apple.network.eapclient.tls.TrustExceptions", v9, v10);
        exceptions_change_notify();
LABEL_17:
        my_CFRelease((const void **)&v27);
        my_CFRelease((const void **)&v25);
        return v8 != 0;
      }
      CFRelease(v12);
    }
    os_log_type_t v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    uint64_t v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    CFTypeRef cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    os_log_type_t v23 = CFDictionaryCreate(0, (const void **)buf, &cf, 1, v21, v22);
    CFMutableArrayRef MutableCopy = (__CFDictionary *)cf;
    goto LABEL_16;
  }
  LogHandle = EAPLogGetLogHandle();
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(LogHandle, v20))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2106D5000, LogHandle, v20, "failed to copy exceptions", buf, 2u);
  }
  return v8 != 0;
}

const void *EAPTLSTrustExceptionsCopy(const __CFString *a1, const void *a2, const void *a3)
{
  exceptions_change_check();
  CFPropertyListRef v6 = CFPreferencesCopyValue(a1, @"com.apple.network.eapclient.tls.TrustExceptions", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  uint64_t v13 = v6;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v6) {
    goto LABEL_8;
  }
  if (CFGetTypeID(v6) != TypeID) {
    goto LABEL_8;
  }
  CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)v6, a2);
  CFTypeID v9 = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != v9) {
    goto LABEL_8;
  }
  CFStringRef v10 = CFDictionaryGetValue((CFDictionaryRef)Value, a3);
  CFTypeID v11 = CFDataGetTypeID();
  if (v10)
  {
    if (CFGetTypeID(v10) == v11)
    {
      CFRetain(v10);
      goto LABEL_9;
    }
LABEL_8:
    CFStringRef v10 = 0;
  }
LABEL_9:
  my_CFRelease(&v13);
  return v10;
}

void exceptions_change_check()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  checuint64_t k = 0;
  if ((exceptions_change_check_token_valid & 1) == 0)
  {
    uint32_t v0 = notify_register_check("com.apple.network.eapclient.tls.TrustExceptions", &exceptions_change_check_token);
    if (v0)
    {
      uint32_t v1 = v0;
      LogHandle = EAPLogGetLogHandle();
      os_log_type_t v3 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(LogHandle, v3)) {
        return;
      }
      *(_DWORD *)long long buf = 67109120;
      uint32_t v9 = v1;
      CFTypeID v4 = "notify_register_check returned %d";
LABEL_9:
      _os_log_impl(&dword_2106D5000, LogHandle, v3, v4, buf, 8u);
      return;
    }
    exceptions_change_check_token_valid = 1;
  }
  uint32_t v5 = notify_check(exceptions_change_check_token, &check);
  if (v5)
  {
    uint32_t v6 = v5;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(LogHandle, v3)) {
      return;
    }
    *(_DWORD *)long long buf = 67109120;
    uint32_t v9 = v6;
    CFTypeID v4 = "notify_check returned %d";
    goto LABEL_9;
  }
  if (check) {
    CFPreferencesSynchronize(@"com.apple.network.eapclient.tls.TrustExceptions", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  }
}

uint64_t EAPTLSSecTrustApplyExceptionsBinding(__SecTrust *a1, const __CFString *a2, const void *a3, const void *a4)
{
  uint32_t v5 = EAPTLSTrustExceptionsCopy(a2, a3, a4);
  CFTypeID v11 = v5;
  if (!v5)
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if (!SecTrustSetExceptions(a1, (CFDataRef)v5))
  {
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v8))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2106D5000, LogHandle, v8, "SecTrustSetExceptions failed", v10, 2u);
    }
    goto LABEL_6;
  }
  uint64_t v6 = 1;
LABEL_7:
  my_CFRelease(&v11);
  return v6;
}

void EAPTLSRemoveTrustExceptionsBindings(const __CFString *a1, const void *a2)
{
  if (my_CFEqual(a1, @"WirelessSSID")) {
    EAPSIMAKAPersistentStateForgetSSID((uint64_t)a2);
  }
  exceptions_change_check();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFDictionaryRef v5 = (const __CFDictionary *)CFPreferencesCopyValue(a1, @"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v6) == TypeID && CFDictionaryGetValue(v6, a2))
    {
      CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
      CFDictionaryRemoveValue(MutableCopy, a2);
      CFPreferencesSetValue(a1, MutableCopy, @"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", v4);
      CFPreferencesSynchronize(@"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", v4);
      exceptions_change_notify();
      CFRelease(MutableCopy);
    }
    CFRelease(v6);
  }
}

void exceptions_change_notify()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint32_t v0 = notify_post("com.apple.network.eapclient.tls.TrustExceptions");
  if (v0)
  {
    uint32_t v1 = v0;
    LogHandle = EAPLogGetLogHandle();
    os_log_type_t v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(LogHandle, v3))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_2106D5000, LogHandle, v3, "notify_post returned %d", (uint8_t *)v4, 8u);
    }
  }
}

const void *EAPTLSCopyTrustExceptionBindings(const __CFString *a1, const void *a2)
{
  exceptions_change_check();
  CFPropertyListRef v4 = CFPreferencesCopyValue(a1, @"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  uint32_t v9 = v4;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4 || CFGetTypeID(v4) != TypeID) {
    goto LABEL_6;
  }
  CFPropertyListRef Value = CFDictionaryGetValue((CFDictionaryRef)v4, a2);
  CFTypeID v7 = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == v7)
    {
      CFRetain(Value);
      goto LABEL_7;
    }
LABEL_6:
    CFPropertyListRef Value = 0;
  }
LABEL_7:
  my_CFRelease(&v9);
  return Value;
}

void EAPTLSSetTrustExceptionBindings(const __CFString *a1, void *a2, void *a3)
{
  values = a3;
  keys = a2;
  exceptions_change_check();
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPropertyListRef v7 = CFPreferencesCopyValue(a1, @"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFTypeRef cf = v7;
  if (v7
    && ((CFDictionaryRef v8 = (const __CFDictionary *)v7, TypeID = CFDictionaryGetTypeID(), CFGetTypeID(v8) == TypeID)
     || (my_CFRelease(&cf), (CFDictionaryRef v8 = (const __CFDictionary *)cf) != 0)))
  {
    CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFDictionarySetValue(MutableCopy, a2, a3);
    CFRelease(cf);
  }
  else
  {
    CFMutableArrayRef MutableCopy = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFTypeRef cf = MutableCopy;
  CFPreferencesSetValue(a1, MutableCopy, @"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", v6);
  CFPreferencesSynchronize(@"com.apple.network.eapclient.tls.TrustExceptions", @"mobile", v6);
  exceptions_change_notify();
  my_CFRelease(&cf);
}

uint64_t eapolcontroller_start(int a1, long long *a2, uint64_t a3, int a4, int a5, int a6, _DWORD *a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  long long v9 = a2[1];
  long long v19 = *a2;
  *(_DWORD *)&msg_4[20] = 3;
  *(void *)&msg_4[24] = a3;
  *(_DWORD *)&msg_4[32] = 16777472;
  *(_DWORD *)&msg_4[36] = a4;
  *(_DWORD *)&msg_4[40] = a5;
  *(_DWORD *)&msg_4[48] = 1245184;
  *(_DWORD *)&msg_4[52] = a6;
  int v17 = 1245184;
  uint64_t v18 = *MEMORY[0x263EF80C8];
  long long v20 = v9;
  int v21 = a4;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  int msg = -2147478253;
  *(void *)&msg_4[12] = 0x55F100000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)&msg, 3, 0x70u, 0x30u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
      return v12;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      uint64_t v12 = 4294966988;
    }
    else if (*(_DWORD *)&msg_4[16] == 22101)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 40)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            uint64_t v12 = *(unsigned int *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              *a7 = *(_DWORD *)&msg_4[32];
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4]) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = *(_DWORD *)&msg_4[28] == 0;
          }
          if (v13) {
            uint64_t v12 = 4294966996;
          }
          else {
            uint64_t v12 = *(unsigned int *)&msg_4[28];
          }
          goto LABEL_23;
        }
      }
      uint64_t v12 = 4294966996;
    }
    else
    {
      uint64_t v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return v12;
  }
  mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  return v12;
}

uint64_t eapolcontroller_stop(mach_port_t a1, long long *a2, _DWORD *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263EF80C8];
  long long v5 = a2[1];
  long long v13 = *a2;
  long long v14 = v5;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x55F200000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3, 0x40u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (msg.msgh_id == 22102)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v8 = v13;
            if (!v13)
            {
              *a3 = DWORD1(v13);
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = v13;
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v8;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

uint64_t eapolcontroller_update(mach_port_t a1, long long *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v7 = a2[1];
  long long v19 = *a2;
  int v14 = 1;
  uint64_t v15 = a3;
  int v16 = 16777472;
  int v17 = a4;
  uint64_t v18 = *MEMORY[0x263EF80C8];
  long long v20 = v7;
  int v21 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(void *)&v13.msgh_voucher_port = 0x55F300000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (v13.msgh_id == 22103)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = HIDWORD(v15) == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = HIDWORD(v15);
          }
          goto LABEL_23;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_retry(mach_port_t a1, long long *a2, _DWORD *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263EF80C8];
  long long v5 = a2[1];
  long long v13 = *a2;
  long long v14 = v5;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x55F400000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3, 0x40u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v8;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (msg.msgh_id == 22104)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v8 = v13;
            if (!v13)
            {
              *a3 = DWORD1(v13);
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = v13;
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v8;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v8;
}

uint64_t eapolcontroller_provide_user_input(mach_port_t a1, long long *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v7 = a2[1];
  long long v19 = *a2;
  int v14 = 1;
  uint64_t v15 = a3;
  int v16 = 16777472;
  int v17 = a4;
  uint64_t v18 = *MEMORY[0x263EF80C8];
  long long v20 = v7;
  int v21 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(void *)&v13.msgh_voucher_port = 0x55F700000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (v13.msgh_id == 22107)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = HIDWORD(v15) == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = HIDWORD(v15);
          }
          goto LABEL_23;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_start_system(mach_port_t a1, long long *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v7 = a2[1];
  long long v19 = *a2;
  int v14 = 1;
  uint64_t v15 = a3;
  int v16 = 16777472;
  int v17 = a4;
  uint64_t v18 = *MEMORY[0x263EF80C8];
  long long v20 = v7;
  int v21 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(void *)&v13.msgh_voucher_port = 0x55F800000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v13, 3, 0x58u, 0x30u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v10;
    }
    if (v13.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (v13.msgh_id == 22108)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v10 = HIDWORD(v15);
            if (!HIDWORD(v15))
            {
              *a5 = v16;
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = HIDWORD(v15) == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = HIDWORD(v15);
          }
          goto LABEL_23;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v13);
    return v10;
  }
  mig_put_reply_port(v13.msgh_local_port);
  return v10;
}

uint64_t eapolcontroller_client_get_session(mach_port_t a1, long long *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v14 = *MEMORY[0x263EF80C8];
  long long v7 = a2[1];
  long long v15 = *a2;
  long long v16 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x55FB00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3, 0x40u, 0x3Cu, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (msg.msgh_id == 22111)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (v14 == 2
            && msg.msgh_size == 52
            && !msg.msgh_remote_port
            && WORD3(v15) << 16 == 1114112
            && WORD1(v16) << 16 == 1114112)
          {
            uint64_t v10 = 0;
            int v11 = DWORD2(v15);
            *a3 = HIDWORD(v14);
            *a4 = v11;
            return v10;
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996;
          if (v15)
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = v15;
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v10;
}

void IdentityHandleMatchesCertificate_cold_1()
{
  __assert_rtn("IdentityHandleMatchesCertificate", "EAPCertificateUtil.c", 116, "CFDataGetLength(public_key_hash) == CC_SHA256_DIGEST_LENGTH");
}

void IdentityHandleMatchesCertificate_cold_2()
{
  __assert_rtn("IdentityHandleMatchesCertificate", "EAPCertificateUtil.c", 109, "CFDataGetLength(cert_hash) == CC_SHA256_DIGEST_LENGTH");
}

void EAPSecIdentityHandleCreate_cold_1()
{
  __assert_rtn("EAPSecIdentityHandleCreate", "EAPCertificateUtil.c", 760, "CFDataGetLength(public_key_hash) == CC_SHA256_DIGEST_LENGTH");
}

void EAPSecIdentityHandleCreate_cold_2()
{
  __assert_rtn("EAPSecIdentityHandleCreate", "EAPCertificateUtil.c", 756, "CFDataGetLength(cert_hash) == CC_SHA256_DIGEST_LENGTH");
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AB0](data, *(void *)&len, md);
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

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  MEMORY[0x270EE48D0](theDate, otherDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
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

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
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

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x270F05520](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05538](allocator, domain, ifname, entity);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

uint64_t SCLog()
{
  return MEMORY[0x270F05580]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056E8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056F0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x270F056F8](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x270F05700](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05710](prefs, key);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return MEMORY[0x270F05720](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x270F05728](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x270F05730](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x270F05750](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t SCPrint()
{
  return MEMORY[0x270F05770]();
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x270EFD500](context);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x270EFD508](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x270EFD510](alloc, *(void *)&protocolSide, *(void *)&connectionType);
}

uint64_t SSLGetCipherSizes()
{
  return MEMORY[0x270EFD520]();
}

OSStatus SSLGetNegotiatedCipher(SSLContextRef context, SSLCipherSuite *cipherSuite)
{
  return MEMORY[0x270EFD530](context, cipherSuite);
}

uint64_t SSLGetResumableSessionInfo()
{
  return MEMORY[0x270EFD540]();
}

OSStatus SSLGetSessionState(SSLContextRef context, SSLSessionState *state)
{
  return MEMORY[0x270EFD548](context, state);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x270EFD550](context);
}

uint64_t SSLInternalClientRandom()
{
  return MEMORY[0x270EFD558]();
}

uint64_t SSLInternalMasterSecret()
{
  return MEMORY[0x270EFD560]();
}

uint64_t SSLInternalServerRandom()
{
  return MEMORY[0x270EFD568]();
}

uint64_t SSLInternalSetMasterSecretFunction()
{
  return MEMORY[0x270EFD570]();
}

uint64_t SSLInternalSetSessionTicket()
{
  return MEMORY[0x270EFD578]();
}

uint64_t SSLInternal_PRF()
{
  return MEMORY[0x270EFD580]();
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD588](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x270EFD590](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x270EFD5A0](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x270EFD5A8](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x270EFD5B0](context, readFunc, writeFunc);
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x270EFD5C0](context, peerName, peerNameLen);
}

OSStatus SSLSetPeerID(SSLContextRef context, const void *peerID, size_t peerIDLen)
{
  return MEMORY[0x270EFD5C8](context, peerID, peerIDLen);
}

OSStatus SSLSetProtocolVersionMax(SSLContextRef context, SSLProtocol maxVersion)
{
  return MEMORY[0x270EFD5D0](context, *(void *)&maxVersion);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x270EFD5D8](context, *(void *)&minVersion);
}

uint64_t SSLSetSessionCacheTimeout()
{
  return MEMORY[0x270EFD5E0]();
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x270EFD5F0](context, *(void *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD5F8](context, data, dataLength, processed);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopySHA256Digest()
{
  return MEMORY[0x270EFD798]();
}

uint64_t SecCertificateCopySubjectPublicKeyInfoSHA256Digest()
{
  return MEMORY[0x270EFD7B0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x270EFD810]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x270EFD828]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

uint64_t SecKeyCopyAttributeDictionary()
{
  return MEMORY[0x270EFD990]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

uint64_t SecPolicyCreateEAP()
{
  return MEMORY[0x270EFDB60]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x270EFDB98](revocationFlags);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x270EFDD08](trust);
}

uint64_t SecTrustCopyInputCertificates()
{
  return MEMORY[0x270EFDD20]();
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x270EFDD38](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD80](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return MEMORY[0x270EFDDC0](trust, exceptions);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
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

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x270F057B0]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x270F057D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _scprefs_observer_watch()
{
  return MEMORY[0x270F057F8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

au_asid_t audit_session_join(mach_port_name_t port)
{
  return MEMORY[0x270ED8708](*(void *)&port);
}

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x270ED8710]();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x270ED8750](a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x270ED8778]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

void mach_error(const char *str, mach_error_t error_value)
{
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

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x270EF7B90](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x270EF7FB8](error);
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
}

nw_protocol_options_t nw_framer_copy_options(nw_framer_t framer)
{
  return (nw_protocol_options_t)MEMORY[0x270EF8118](framer);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8120](identifier, *(void *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x270EF8130](framer_definition);
}

void nw_framer_deliver_input(nw_framer_t framer, const uint8_t *input_buffer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x270EF8150](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

BOOL nw_framer_parse_output(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x270EF8198](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x270EF84F8](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

uint64_t nw_parameters_set_custom_protocols_only()
{
  return MEMORY[0x270EF8618]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x270EF8F28]();
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8F88](options);
}

uint64_t nw_protocol_stack_append_application_protocol()
{
  return MEMORY[0x270EF9010]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF95D0](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x270EF95E0]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x270EFDE88](certificate);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x270EFDE98](identity);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x270EFDEA0](identity, certificates);
}

BOOL sec_protocol_metadata_access_peer_certificate_chain(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x270EFDEA8](metadata, handler);
}

uint64_t sec_protocol_metadata_get_eap_key_material()
{
  return MEMORY[0x270EFDEC0]();
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x270EFDED8](metadata);
}

uint64_t sec_protocol_metadata_get_session_resumed()
{
  return MEMORY[0x270EFDEE0]();
}

uint64_t sec_protocol_options_get_eap_method()
{
  return MEMORY[0x270EFDF18]();
}

uint64_t sec_protocol_options_set_eap_method()
{
  return MEMORY[0x270EFDF30]();
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

uint64_t sec_protocol_options_set_tls_early_data_enabled()
{
  return MEMORY[0x270EFDF90]();
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x270EFDFD8](trust);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x270EDB898](*(void *)&task, *(void *)&which_port, *(void *)&special_port);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}