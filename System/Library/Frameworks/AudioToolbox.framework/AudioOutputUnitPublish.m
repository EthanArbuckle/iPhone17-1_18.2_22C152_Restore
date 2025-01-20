@interface AudioOutputUnitPublish
@end

@implementation AudioOutputUnitPublish

uint64_t __AudioOutputUnitPublish_Impl_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = CADeprecated::TSingleton<IPCAUServer>::instance();
  v3 = *(_DWORD **)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 56);
  uint64_t v30 = *(void *)(a1 + 40);
  unsigned int v5 = *v3 - 1635086951;
  BOOL v6 = v5 > 0x11;
  int v7 = (1 << v5) & 0x20045;
  if (v6 || v7 == 0) {
    return 4294900545;
  }
  uint64_t v9 = v2;
  MainBundle = CFBundleGetMainBundle();
  CFStringRef Identifier = 0;
  if (!MainBundle)
  {
    CFTypeRef v28 = 0;
LABEL_37:
    if (kLocalInterAppAudioScope)
    {
      v21 = *(NSObject **)kLocalInterAppAudioScope;
      if (!*(void *)kLocalInterAppAudioScope) {
        return 4294967246;
      }
    }
    else
    {
      v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      msg[0] = 136315394;
      *(void *)&msg[1] = "IPCAUServer.cpp";
      LOWORD(msg[3]) = 1024;
      *(_DWORD *)((char *)&msg[3] + 2) = 238;
      v22 = "%25s:%-5d IPCAUServer: main bundle ID is nil";
LABEL_44:
      _os_log_impl(&dword_21B9BB000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)msg, 0x12u);
    }
    return 4294967246;
  }
  v11 = MainBundle;
  CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
  CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v11, (CFStringRef)*MEMORY[0x263EFFA90]);
  CFTypeRef v28 = ValueForInfoDictionaryKey;
  if (!Identifier) {
    goto LABEL_37;
  }
  if (!ValueForInfoDictionaryKey)
  {
    if (kLocalInterAppAudioScope)
    {
      v21 = *(NSObject **)kLocalInterAppAudioScope;
      if (!*(void *)kLocalInterAppAudioScope) {
        return 4294967246;
      }
    }
    else
    {
      v21 = &_os_log_internal;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      msg[0] = 136315394;
      *(void *)&msg[1] = "IPCAUServer.cpp";
      LOWORD(msg[3]) = 1024;
      *(_DWORD *)((char *)&msg[3] + 2) = 242;
      v22 = "%25s:%-5d IPCAUServer: bundle display name is nil";
      goto LABEL_44;
    }
    return 4294967246;
  }
  CASerializer::CASerializer((CASerializer *)&theData, 0);
  operator<<();
  operator<<();
  operator<<();
  int v13 = 5;
  while (1)
  {
    int v14 = AURegistrationServerConnection_ServerPort();
    unsigned int explicit = atomic_load_explicit(*(atomic_uint *volatile *)(v9 + 40), memory_order_acquire);
    long long v25 = *(_OWORD *)v3;
    int v26 = v3[4];
    int Length = (int)theData;
    if (theData)
    {
      BytePtr = CFDataGetBytePtr(theData);
      int Length = (int)theData;
      if (theData) {
        int Length = CFDataGetLength(theData);
      }
    }
    else
    {
      BytePtr = 0;
    }
    memset(&msg[1], 0, 32);
    msg[6] = 2;
    msg[7] = explicit;
    msg[9] = 1245184;
    v32 = BytePtr;
    int v33 = 16777472;
    int v34 = Length;
    uint64_t v35 = *MEMORY[0x263EF80C8];
    long long v36 = v25;
    int v37 = v26;
    int v38 = Length;
    int v39 = v4;
    mach_port_t reply_port = mig_get_reply_port();
    msg[2] = v14;
    msg[3] = reply_port;
    msg[0] = -2147478253;
    *(void *)&msg[4] = 0x15F9200000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      mach_port_t reply_port = msg[3];
    }
    uint64_t v19 = mach_msg((mach_msg_header_t *)msg, 275, 0x5Cu, 0x2Cu, reply_port, *MEMORY[0x263EFC0D0], 0);
    uint64_t v20 = v19;
    if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[3]);
    }
    else
    {
      if (!v19)
      {
        if (msg[5] == 71)
        {
          uint64_t v20 = 4294966988;
        }
        else if (msg[5] == 90102)
        {
          uint64_t v20 = 4294966996;
          if ((msg[0] & 0x80000000) == 0 && msg[1] == 36 && !msg[2])
          {
            uint64_t v20 = msg[8];
            if (!msg[8]) {
              goto LABEL_47;
            }
          }
        }
        else
        {
          uint64_t v20 = 4294966995;
        }
        goto LABEL_32;
      }
      mig_dealloc_reply_port(msg[3]);
    }
    if (v20 != 268435460) {
      goto LABEL_33;
    }
    uint64_t v20 = 268435460;
    if ((msg[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], msg[3]);
    }
LABEL_32:
    mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_33:
    if (v20 != 268435459) {
      break;
    }
    sleep(1u);
    AURegistrationServerConnection_Connect();
    if (!--v13)
    {
      uint64_t v20 = 268435459;
      goto LABEL_48;
    }
  }
  if (!v20) {
LABEL_47:
  }
    operator new();
LABEL_48:
  if (kLocalInterAppAudioScope)
  {
    v23 = *(NSObject **)kLocalInterAppAudioScope;
    if (!*(void *)kLocalInterAppAudioScope) {
      goto LABEL_60;
    }
  }
  else
  {
    v23 = &_os_log_internal;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    msg[0] = 136315650;
    *(void *)&msg[1] = "IPCAUServer.cpp";
    LOWORD(msg[3]) = 1024;
    *(_DWORD *)((char *)&msg[3] + 2) = 264;
    HIWORD(msg[4]) = 1024;
    msg[5] = v20;
    _os_log_impl(&dword_21B9BB000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d error %d from registration server", (uint8_t *)msg, 0x18u);
  }
LABEL_60:
  MEMORY[0x21D497450](&theData);
  return v20;
}

@end