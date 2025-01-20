@interface SCNetworkInterfaceInitialize
@end

@implementation SCNetworkInterfaceInitialize

void ____SCNetworkInterfaceInitialize_block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  pthread_mutex_init(&lock_1, 0);
  __kSCNetworkInterfaceTypeID = _CFRuntimeRegisterClass();
  _CFRuntimeInitStaticInstance();
  qword_1EB283D60 = @"IPv4";
  qword_1EB283D80 = @"ipv4";
  _CFRuntimeInitStaticInstance();
  qword_1EB283EF8 = @"Loopback";
  qword_1EB283F18 = @"loopback";
  qword_1EB283F58 = (uint64_t)CFRetain(@"lo0");
  qword_1EB283F68 = @"Loopback";
  bundle = _SC_CFBundleGet();
  int v0 = MEMORY[0x192FA7480](0, &masterPort);
  if (v0)
  {
    int v1 = v0;
    v2 = __log_SCNetworkConfiguration();
    uint64_t v3 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v2, (os_log_type_t)v3))
    {
      v4 = (char *)v6 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v5 = (_DWORD *)_os_log_pack_fill();
      _DWORD *v5 = 67109120;
      v5[1] = v1;
      __SC_log_send(5, (uint64_t)v2, v3, v4);
    }
  }
}

@end