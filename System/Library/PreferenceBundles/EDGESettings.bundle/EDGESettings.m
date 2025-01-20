__CFString *sMMSOverrideDictName(void *a1)
{
  if ([a1 slotID] == 1) {
    return @"MMS";
  }
  else {
    return @"MMS2";
  }
}

uint64_t AutoGsmaSettingsSpecifiers(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithName:&stru_26DD4D9A0];
  [v2 setProperty:@"GSMA_SETTING_GROUP" forKey:*MEMORY[0x263F60138]];
  objc_msgSend(v2, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USE_CARRIER_SETTINGS_FOOTER_TEXT", &stru_26DD4D9A0, @"EDGE Settings"), *MEMORY[0x263F600F8]);
  v3 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"USE_CARRIER_SETTINGS_SWITCH_NAME", &stru_26DD4D9A0, @"EDGE Settings"), a1, sel_setDefaultSettings_specifier_, sel_getDefaultSettings_, 0, 6, 0);
  [v3 setIdentifier:@"GSMA_SETTING"];
  return objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v2, v3, 0);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t startTcpdumpServer(const char *a1, const char *a2, const char *a3)
{
  mach_port_t sp = 0;
  if (bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.tcpdump.server", &sp)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v8 = 0;
  int started = start_tcpdump(sp, a1, a2, a3, &v8);
  syslog(3, "Created tcpdump with pid %d.", v8);
  mach_port_deallocate(*MEMORY[0x263EF8960], sp);
  if (started) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

void stopTcpdumpServer(int a1)
{
  mach_port_t sp = 0;
  if (!bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.tcpdump.server", &sp))
  {
    stop_tcpdump(sp, a1);
    mach_port_deallocate(*MEMORY[0x263EF8960], sp);
    syslog(3, "Stopped tcpdump with pid %d.", a1);
  }
}

uint64_t dumpSetkey(const char *a1)
{
  mach_port_t sp = 0;
  uint64_t result = bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.tcpdump.server", &sp);
  if (!result)
  {
    dump_setkey(sp, a1);
    return mach_port_deallocate(*MEMORY[0x263EF8960], sp);
  }
  return result;
}

void moveTcpdumps()
{
  mach_port_t sp = 0;
  if (!bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.tcpdump.server", &sp))
  {
    move_tcpdumps(sp);
    mach_port_deallocate(*MEMORY[0x263EF8960], sp);
    syslog(3, "Moved the files from staging to the dump directory");
  }
}

uint64_t start_tcpdump(mach_port_name_t a1, const char *a2, const char *a3, const char *a4, _DWORD *a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  memset(v31, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v30 = 0u;
  *((void *)&v30 + 1) = *MEMORY[0x263EF80C8];
  uint64_t v9 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v10 = mig_strncpy_zerofill((char *)v31 + 8, a2, 1024);
  }
  else {
    int v10 = mig_strncpy((char *)v31 + 8, a2, 1024);
  }
  LODWORD(v31[0]) = 0;
  DWORD1(v31[0]) = v10;
  uint64_t v11 = (v10 + 3) & 0xFFFFFFFC;
  int v12 = v11 + 56;
  v13 = (char *)rcv_name + v11;
  v14 = v13 - 1024;
  v15 = v13 + 48;
  if (v9) {
    int v16 = mig_strncpy_zerofill(v15, a3, 1024);
  }
  else {
    int v16 = mig_strncpy(v15, a3, 1024);
  }
  *((_DWORD *)v14 + 267) = v16;
  *((_DWORD *)v14 + 266) = 0;
  uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
  int v18 = v12 + v17;
  v19 = &v14[v17];
  v20 = v19 - 1024;
  v21 = v19 + 1080;
  if (v9) {
    int v22 = mig_strncpy_zerofill(v21, a4, 1024);
  }
  else {
    int v22 = mig_strncpy(v21, a4, 1024);
  }
  *((_DWORD *)v20 + 525) = v22;
  *((_DWORD *)v20 + 524) = 0;
  mach_msg_size_t v23 = v18 + ((v22 + 3) & 0xFFFFFFFC);
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v30 = 0xA82A00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v25 = mach_msg((mach_msg_header_t *)rcv_name, 19, v23, 0x30u, reply_port, 0, 0);
  uint64_t v26 = v25;
  if ((v25 - 268435458) > 0xE || ((1 << (v25 - 2)) & 0x4003) == 0)
  {
    if (v25)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v26;
    }
    if (DWORD1(v30) == 71)
    {
      uint64_t v26 = 4294966988;
    }
    else if (DWORD1(v30) == 43150)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v26 = LODWORD(v31[0]);
            if (!LODWORD(v31[0]))
            {
              *a5 = DWORD1(v31[0]);
              return v26;
            }
            goto LABEL_32;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v27 = 1;
          }
          else {
            BOOL v27 = LODWORD(v31[0]) == 0;
          }
          if (v27) {
            uint64_t v26 = 4294966996;
          }
          else {
            uint64_t v26 = LODWORD(v31[0]);
          }
          goto LABEL_32;
        }
      }
      uint64_t v26 = 4294966996;
    }
    else
    {
      uint64_t v26 = 4294966995;
    }
LABEL_32:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v26;
  }
  mig_put_reply_port(rcv_name[3]);
  return v26;
}

uint64_t stop_tcpdump(int a1, int a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0xA82B00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 19, 0x24u, 0x2Cu, reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v5;
  }
  if (v4)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
LABEL_17:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] != 43151)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_17;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_17;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_17;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t dump_setkey(mach_port_name_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v11, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v10 = 0u;
  *((void *)&v10 + 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v11 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v11 + 8, a2, 1024);
  }
  LODWORD(v11[0]) = 0;
  DWORD1(v11[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v10 = 0xA82C00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)rcv_name, 19, v4, 0x2Cu, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name[3]);
    return v7;
  }
  if (v6)
  {
    mig_dealloc_reply_port(rcv_name[3]);
    return v7;
  }
  if (DWORD1(v10) == 71)
  {
    uint64_t v7 = 4294966988;
LABEL_20:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  if (DWORD1(v10) != 43152)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_20;
  }
  uint64_t v7 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_20;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_20;
  }
  if (rcv_name[2]) {
    goto LABEL_20;
  }
  uint64_t v7 = LODWORD(v11[0]);
  if (LODWORD(v11[0])) {
    goto LABEL_20;
  }
  return v7;
}

uint64_t move_tcpdumps(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0xA82D00000000;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
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

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionSetTraceProperty()
{
  return MEMORY[0x270EE88B8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
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

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void syslog(int a1, const char *a2, ...)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}