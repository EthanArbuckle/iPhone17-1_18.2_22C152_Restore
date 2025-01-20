void *sub_10000519C(const char *a1, const void *a2)
{
  void *result;
  uint64_t vars8;

  result = (void *)sub_1000051E8(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

const void *sub_1000051E8(const void *a1)
{
  pthread_mutex_lock(&stru_100031C00);
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_100031ED0;
  if (!qword_100031ED0)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    qword_100031ED0 = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"UIKit";
        CFStringRef v5 = @"UIKit.framework";
        goto LABEL_7;
      case 1uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"MobileCoreServices";
        CFStringRef v5 = @"MobileCoreServices.framework";
LABEL_7:
        CFStringRef v6 = @"Frameworks";
        goto LABEL_14;
      case 2uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"SpringBoardServices";
        CFStringRef v5 = @"SpringBoardServices.framework";
        goto LABEL_13;
      case 3uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"FrontBoardServices";
        CFStringRef v5 = @"FrontBoardServices.framework";
        goto LABEL_13;
      case 4uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"CarKit";
        CFStringRef v5 = @"CarKit.framework";
        goto LABEL_13;
      case 5uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"VisualVoicemail";
        CFStringRef v5 = @"VisualVoicemail.framework";
        goto LABEL_13;
      case 6uLL:
        uint64_t v4 = CPSystemRootDirectory();
        CFStringRef v10 = @"AccessoryAudio";
        CFStringRef v5 = @"AccessoryAudio.framework";
LABEL_13:
        CFStringRef v6 = @"PrivateFrameworks";
LABEL_14:
        v7 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", +[NSArray arrayWithObjects:v4, @"System", @"Library", v6, v5, v10, 0]);
        if (!v7) {
          goto LABEL_17;
        }
        v8 = dlopen([(NSString *)v7 UTF8String], 1);
        if (!v8) {
          goto LABEL_17;
        }
        Value = v8;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100031ED0, a1, v8);
        break;
      default:
LABEL_17:
        NSLog(@"Could not load source: %ld", a1);
        Value = 0;
        break;
    }
  }
  pthread_mutex_unlock(&stru_100031C00);
  return Value;
}

Class sub_100005474(NSString *a1, const void *a2)
{
  Class result = (Class)sub_1000051E8(a2);
  if (result)
  {
    return NSClassFromString(a1);
  }
  return result;
}

uint64_t sub_1000054C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000054EC()
{
  return 2;
}

uint64_t sub_1000054F4()
{
  return 1;
}

uint64_t sub_1000054FC()
{
  uint64_t result = BTDeviceGetAddressString();
  if (!result) {
    return BTDeviceAddressFromString();
  }
  return result;
}

void sub_100005578(unint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int v5 = a2;
  if (a3 == 1)
  {
    if (a4 == 12)
    {
      sub_10001D548(1, @"INFO - %s:%s - %d disconnecting port for device 0x%hhx with service 0x%X", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "BTServiceCallback", 123, a1, a2);
      kdebug_trace();
      sub_100005A24(a1, v5);
    }
  }
  else if (!a3 && a4 == 11 && !a5)
  {
    sub_10001D548(1, @"INFO - %s:%s - %d connecting new port for device 0x%hhx with service 0x%X", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "BTServiceCallback", 110, a1, a2);
    kdebug_trace();
    sub_1000056B0(a1);
  }
}

uint64_t sub_1000056B0(unint64_t a1)
{
  char v9 = -86;
  if (BTDeviceGetConnectedServices())
  {
    sub_10001D548(1, @"WARNING - %s:%s - %d no connected service for this BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CreateBTPort", 235);
    char v9 = 0;
  }
  if (BTDeviceGetSupportedServices()) {
    sub_10001D548(1, @"WARNING - %s:%s - %d no supported service for this BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CreateBTPort", 240);
  }
  int v2 = sub_1000054FC();
  pthread_mutex_lock(&stru_100031C40);
  if ((v9 & 0x80) == 0) {
    goto LABEL_6;
  }
  uint64_t v3 = qword_100032020;
  if (!qword_100032020) {
    goto LABEL_25;
  }
  uint64_t v4 = &qword_100032020;
  do
  {
    unint64_t v5 = *(void *)(v3 + 32);
    BOOL v6 = v5 >= a1;
    if (v5 >= a1) {
      v7 = (uint64_t *)v3;
    }
    else {
      v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      uint64_t v4 = (uint64_t *)v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 == &qword_100032020 || v4[4] > a1)
  {
LABEL_25:
    if (!v2)
    {
      memset(__s, 170, 6);
      if ((sub_10000859C((uint64_t)__s) & 1) == 0) {
        operator new();
      }
    }
    sub_10001D548(1, @"WARNING - %s:%s - %d creating port to locked out BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CreateBTPort", 273);
    BTDeviceDisconnectServices();
  }
  else
  {
LABEL_6:
    sub_10001D548(1, @"WARNING - %s:%s - %d trying to create port to a non-iAP BT device OR for an already connected iAP BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CreateBTPort", 304);
  }
  return pthread_mutex_unlock(&stru_100031C40);
}

void sub_1000059F8()
{
}

void sub_100005A24(uint64_t a1, int a2)
{
  __int16 v7 = -21846;
  int v6 = -1431655766;
  sub_1000054FC();
  int v5 = -1431655766;
  if (BTDeviceGetSupportedServices())
  {
    sub_10001D548(1, @"WARNING - %s:%s - %d no supported service for this BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "DeleteBTPorts", 422);
    int v5 = 0;
  }
  if (a2 == 128)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000060D4;
    v4[3] = &unk_10002CA98;
    v4[4] = a1;
    pthread_mutex_lock(&stru_100031C80);
    sub_1000060D4((uint64_t)v4);
    pthread_mutex_unlock(&stru_100031C80);
  }
}

void sub_100005C04(uint64_t a1, int a2)
{
  if (!a2)
  {
    if (BTLocalDeviceGetModulePower())
    {
      NSLog(@"ERROR - %s:%s - %d failed getting power state of local BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "BTLocalDeviceCallback", 157);
      sub_10001D548(1, @"INFO - %s:%s - %d BT local device powering off", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "BTLocalDeviceCallback", 163);
      sub_100005A24(0, 128);
    }
  }
}

void sub_100005CAC(void (*a1)(void, uint64_t), uint64_t a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[6] = v3;
  v6[7] = v3;
  v6[4] = v3;
  v6[5] = v3;
  v6[2] = v3;
  v6[3] = v3;
  v6[0] = v3;
  v6[1] = v3;
  if (qword_100032010 && !BTLocalDeviceGetDefault())
  {
    if (BTLocalDeviceGetConnectedDevices())
    {
      NSLog(@"ERROR - %s:%s - %d failed getting connected BT devices", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "FindKnownDevices", 202);
    }
    else
    {
      for (unint64_t i = 0; i < 0xAAAAAAAAAAAAAAAALL; ++i)
        a1(*((void *)v6 + i), a2);
    }
  }
  else
  {
    NSLog(@"ERROR - %s:%s - %d failed getting local BT device", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "FindKnownDevices", 195);
  }
}

void sub_100005DD8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112) == -1)
  {
    NSLog(@"ERROR - %s:%s - %d invalid m_comPort(%d)", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "StartRecvThread", 786, 0xFFFFFFFFLL);
  }
  else
  {
    int v2 = (pthread_cond_t *)(a1 + 664);
    pthread_cond_init((pthread_cond_t *)(a1 + 664), 0);
    pthread_mutex_init((pthread_mutex_t *)(a1 + 712), 0);
    uint64_t v3 = pthread_create((pthread_t *)(a1 + 136), 0, (void *(__cdecl *)(void *))sub_10000695C, (void *)a1);
    if (v3)
    {
      NSLog(@"ERROR - %s:%s - %d pthread_create failed %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "StartRecvThread", 771, v3);
      close(*(_DWORD *)(a1 + 112));
      pthread_cond_destroy(v2);
      pthread_mutex_destroy((pthread_mutex_t *)(a1 + 712));
      *(_DWORD *)(a1 + 112) = -1;
    }
    else
    {
      sched_param v5 = (sched_param)0xAAAAAAAAAAAAAAAALL;
      int v4 = -1431655766;
      pthread_getschedparam(*(pthread_t *)(a1 + 136), &v4, &v5);
      *(_DWORD *)(a1 + 776) = v5.sched_priority;
    }
  }
}

void sub_100005EFC(uint64_t a1, unsigned int a2)
{
  if (a2 > 9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10001F498(a2);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 780) = a2;
  }
}

uint64_t sub_100005F4C(void *a1)
{
  sub_10001D548(1, @"INFO - %s:%s - %d disconnecting locked out device 0x%hhx", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "LockoutPort", 347, a1[15]);
  (*(void (**)(uint64_t *__return_ptr, void *))(*a1 + 96))(&v4, a1);
  sub_10000841C((uint64_t)&v4, v2);
  return BTDeviceDisconnectServices();
}

void sub_100005FE4(uint64_t a1)
{
  if (*(int *)(a1 + 780) <= 9
    && BTDeviceSetHIDProperties()
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10001F548();
  }
}

void sub_10000605C(uint64_t a1)
{
  if (*(int *)(a1 + 780) <= 9
    && BTDeviceSetHIDProperties()
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10001F5E4();
  }
}

void sub_1000060D4(uint64_t a1)
{
  v1 = (uint64_t *)qword_100032040;
  while (v1 != &qword_100032038)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v1[2] + 80))(v1[2]) == 2)
    {
      uint64_t v3 = (const void *)v1[2];
      if (!v3
      {
        sub_10001F680();
      }
      sched_param v5 = v4;
      int v6 = (pthread_mutex_t *)(v4 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 48));
      if (v5[132])
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (!v7 || *((void *)v5 + 15) == v7)
        {
          v5[132] = 0;
          pthread_mutex_unlock(v6);
          sub_10001D548(1, @"INFO - %s:%s - %d port 0x%hhx for device 0x%hhx to be deleted", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "DeleteBTPorts_block_invoke", 466, v5, *((void *)v5 + 15));
          uint64_t v8 = *v1;
          char v9 = (uint64_t *)v1[1];
          *(void *)(v8 + 8) = v9;
          *(void *)v1[1] = v8;
          --qword_100032048;
          operator delete(v1);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000062CC;
          block[3] = &unk_10002CA98;
          block[4] = v5;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          v1 = v9;
          continue;
        }
      }
      pthread_mutex_unlock(v6);
    }
    v1 = (uint64_t *)v1[1];
  }
}

uint64_t sub_1000062CC(uint64_t a1)
{
  sub_100006310(*(const void **)(a1 + 32));
  return kdebug_trace();
}

void sub_100006310(const void *a1)
{
  sub_10001D548(1, @"INFO - %s:%s - %d delete transport 0x%hhx", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "DeleteTransport", 926, a1);
  if (a1 && (*(unsigned int (**)(const void *))(*(void *)a1 + 80))(a1) == 2)
  {
    pthread_mutex_lock(&stru_100031C40);
    if (!v2) {
      sub_10001F680();
    }
    uint64_t v3 = v2;
    if (!*((unsigned char *)v2 + 132))
    {
      unint64_t v4 = v2[15];
      sub_100016590(v2);
      (*(void (**)(void *))(*v3 + 8))(v3);
      sub_1000074D0((uint64_t)&qword_100032018, &v4);
    }
    pthread_mutex_unlock(&stru_100031C40);
  }
}

uint64_t sub_100006450(int a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000064E0;
  v2[3] = &unk_10002CAB8;
  int v3 = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_1000064E0((uint64_t)v2);
  return pthread_mutex_unlock(&stru_100031C80);
}

uint64_t sub_1000064E0(uint64_t result)
{
  uint64_t v1 = qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    uint64_t v2 = result;
    do
    {
      uint64_t result = (*(uint64_t (**)(void))(**(void **)(v1 + 16) + 80))(*(void *)(v1 + 16));
      if (result == 2)
      {
        int v3 = *(const void **)(v1 + 16);
        if (!v3
        {
          sub_10001F680();
        }
        int v4 = *(_DWORD *)(v2 + 32);
        if (v4 == 3) {
          goto LABEL_12;
        }
        if (v4 != 2)
        {
          if (v4 != 1 || *(unsigned char *)(result + 8)) {
            goto LABEL_13;
          }
LABEL_12:
          uint64_t result = BTDeviceDisconnectServices();
          goto LABEL_13;
        }
        if (*(unsigned char *)(result + 8)) {
          goto LABEL_12;
        }
      }
LABEL_13:
      uint64_t v1 = *(void *)(v1 + 8);
    }
    while ((uint64_t *)v1 != &qword_100032038);
  }
  return result;
}

void sub_1000065F4(uint64_t a1, int a2, int a3)
{
  if (a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = off_100031EC8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm";
    *(_WORD *)&buf[22] = 2080;
    uint64_t v7 = "BTSessionCallback";
    __int16 v8 = 1024;
    int v9 = 574;
    __int16 v10 = 1024;
    int v11 = a3;
    int v4 = "[#%s] ERROR - %s:%s - %d called with a BTResult of %d";
    uint32_t v5 = 44;
    goto LABEL_4;
  }
  if (a2 == 2)
  {
    qword_100032010 = 0;
    sub_100005A24(0, 128);
    if ((objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "isShuttingDown") & 1) == 0)
    {
      sub_100006864();
    }
  }
  else if (!a2)
  {
    if (a1)
    {
      qword_100032010 = a1;
      if (!BTLocalDeviceGetDefault())
      {
        *(_OWORD *)buf = off_10002CAD8;
        *(void *)&buf[16] = 0;
        BTLocalDeviceAddCallbacks();
      }
      sub_100005CAC((void (*)(void, uint64_t))sub_1000056B0, 0);
      BTServiceAddCallbacks();
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = off_100031EC8;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm";
      *(_WORD *)&buf[22] = 2080;
      uint64_t v7 = "BTSessionCallback";
      __int16 v8 = 1024;
      int v9 = 552;
      int v4 = "[#%s] ERROR - %s:%s - %d called with a NULL BTSession";
      uint32_t v5 = 38;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, buf, v5);
    }
  }
}

BOOL sub_100006864()
{
  qword_100032010 = 0;
  signal(30, (void (__cdecl *)(int))nullsub_7);
  v0 = +[NSString stringWithFormat:@"com.apple.iaptransportd-%d", getpid()];
  if (qword_100031F18 != -1) {
    dispatch_once(&qword_100031F18, &stru_10002CBC0);
  }
  [(NSString *)v0 cStringUsingEncoding:4];
  int v1 = BTSessionAttachWithQueue();
  if (v1) {
    NSLog(@"ERROR - %s:%s - %d failed attaching to BT server", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "AttachToBTServer", 905, sub_1000065F4);
  }
  return v1 == 0;
}

void sub_10000695C()
{
}

void sub_100006B18(uint64_t a1, int a2)
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      LODWORD(buf.__sig) = 136315138;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)off_100031EC8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#%s] Changing bt receive queue priority to high priority", (uint8_t *)&buf, 0xCu);
    }
    sched_param v8 = (sched_param)0xAAAAAAAAAAAAAAAALL;
    int v7 = -1431655766;
    pthread_getschedparam(*(pthread_t *)(a1 + 136), &v7, &v8);
    v8.sched_priority = 63;
    NSLog(@"Setting BT m_recvThread sched_priority to new priority %d", 63);
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf.__opaque[24] = v5;
    *(_OWORD *)&buf.__opaque[40] = v5;
    *(_OWORD *)&buf.__sig = v5;
    *(_OWORD *)&buf.__opaque[8] = v5;
    pthread_attr_init(&buf);
    pthread_attr_setschedparam(&buf, &v8);
    dispatch_sync((dispatch_queue_t)qword_100032030, &stru_10002CB10);
  }
  else
  {
    if (v4)
    {
      LODWORD(buf.__sig) = 136315138;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)off_100031EC8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#%s] Changing bt receive queue priority back to default priority", (uint8_t *)&buf, 0xCu);
    }
    sched_param v8 = (sched_param)0xAAAAAAAAAAAAAAAALL;
    int v7 = -1431655766;
    pthread_getschedparam(*(pthread_t *)(a1 + 136), &v7, &v8);
    v8.sched_priority = *(_DWORD *)(a1 + 776);
    NSLog(@"Setting BT m_recvThread sched_priority back to default %d", v8.sched_priority);
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf.__opaque[24] = v6;
    *(_OWORD *)&buf.__opaque[40] = v6;
    *(_OWORD *)&buf.__sig = v6;
    *(_OWORD *)&buf.__opaque[8] = v6;
    pthread_attr_init(&buf);
    pthread_attr_setschedparam(&buf, &v8);
    dispatch_set_target_queue((dispatch_object_t)qword_100032030, 0);
  }
}

void sub_100006CF0(id a1)
{
  int v1 = qword_100032030;
  uint64_t v2 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue");
  dispatch_set_target_queue(v1, v2);
}

uint64_t sub_100006D3C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = sub_100007CEC(a1, 0, 0);
  *(void *)uint64_t v6 = off_10002CB40;
  *(_DWORD *)(v6 + 112) = -1;
  *(void *)(v6 + 120) = a2;
  *(_DWORD *)(v6 + 128) = a3;
  *(unsigned char *)(v6 + 132) = 1;
  *(void *)(v6 + 144) = 0;
  *(_OWORD *)(v6 + 152) = 0u;
  int v7 = (_OWORD *)(v6 + 152);
  *(_DWORD *)(v6 + 780) = 10;
  *(_OWORD *)(v6 + 168) = 0u;
  *(_OWORD *)(v6 + 184) = 0u;
  *(_OWORD *)(v6 + 200) = 0u;
  *(_OWORD *)(v6 + 216) = 0u;
  *(_OWORD *)(v6 + 232) = 0u;
  *(_OWORD *)(v6 + 248) = 0u;
  *(_OWORD *)(v6 + 264) = 0u;
  *(_OWORD *)(v6 + 280) = 0u;
  *(_OWORD *)(v6 + 296) = 0u;
  *(_OWORD *)(v6 + 312) = 0u;
  *(_OWORD *)(v6 + 328) = 0u;
  *(_OWORD *)(v6 + 344) = 0u;
  *(_OWORD *)(v6 + 360) = 0u;
  *(_OWORD *)(v6 + 376) = 0u;
  *(_OWORD *)(v6 + 392) = 0u;
  *(_OWORD *)(v6 + 408) = 0u;
  *(_OWORD *)(v6 + 424) = 0u;
  *(_OWORD *)(v6 + 440) = 0u;
  *(_OWORD *)(v6 + 456) = 0u;
  *(_OWORD *)(v6 + 472) = 0u;
  *(_OWORD *)(v6 + 488) = 0u;
  *(_OWORD *)(v6 + 504) = 0u;
  *(_OWORD *)(v6 + 520) = 0u;
  *(_OWORD *)(v6 + 536) = 0u;
  *(_OWORD *)(v6 + 552) = 0u;
  *(_OWORD *)(v6 + 568) = 0u;
  *(_OWORD *)(v6 + 584) = 0u;
  *(_OWORD *)(v6 + 600) = 0u;
  *(_OWORD *)(v6 + 616) = 0u;
  *(_OWORD *)(v6 + 632) = 0u;
  *(_OWORD *)(v6 + 648) = 0u;
  *(void *)(v6 + 806) = 0;
  *(void *)(v6 + 800) = 0;
  *(_OWORD *)(v6 + 784) = 0u;
  if (a2) {
    sub_1000054FC();
  }
  *(void *)(a1 + 136) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 48), 0);
  if (BTDeviceGetComPortForServiceWithSandboxExtension() || sandbox_consume_fs_extension())
  {
    NSLog(@"ERROR - %s:%s - %d failed getting BT port (token: %s)", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CIapPortBT", 712, v7);
    v7[30] = 0u;
    v7[31] = 0u;
    v7[28] = 0u;
    v7[29] = 0u;
    v7[26] = 0u;
    v7[27] = 0u;
    v7[24] = 0u;
    v7[25] = 0u;
    v7[22] = 0u;
    v7[23] = 0u;
    v7[20] = 0u;
    v7[21] = 0u;
    v7[18] = 0u;
    v7[19] = 0u;
    v7[16] = 0u;
    v7[17] = 0u;
    v7[14] = 0u;
    v7[15] = 0u;
    v7[12] = 0u;
    v7[13] = 0u;
    v7[10] = 0u;
    v7[11] = 0u;
    v7[8] = 0u;
    v7[9] = 0u;
    v7[6] = 0u;
    v7[7] = 0u;
    v7[4] = 0u;
    v7[5] = 0u;
    v7[2] = 0u;
    v7[3] = 0u;
    _OWORD *v7 = 0u;
    v7[1] = 0u;
  }
  else
  {
    int v9 = open(byte_100031ED8, 131074);
    *(_DWORD *)(a1 + 112) = v9;
    if (v9 == -1)
    {
      uint64_t v10 = *__error();
      int v11 = __error();
      v12 = strerror(*v11);
      NSLog(@"ERROR - %s:%s - %d open %s failed: %d (%s)", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "CIapPortBT", 720, byte_100031ED8, v10, v12);
    }
  }
  return a1;
}

void sub_100006F4C(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_100006F64(void *a1)
{
}

void *sub_100006F78(uint64_t a1)
{
  *(void *)a1 = off_10002CB40;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 48));
  if (*(unsigned char *)(a1 + 152)) {
    sandbox_release_fs_extension();
  }
  int v2 = *(_DWORD *)(a1 + 112);
  if (v2 != -1)
  {
    *(_DWORD *)(a1 + 112) = -1;
    pthread_kill(*(pthread_t *)(a1 + 136), 30);
    pthread_join(*(pthread_t *)(a1 + 136), 0);
    close(v2);
    pthread_cond_destroy((pthread_cond_t *)(a1 + 664));
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 712));
    uint64_t v3 = *(void *)(a1 + 144);
    if (v3)
    {
      sub_10001EA70(v3);
      *(void *)(a1 + 144) = 0;
    }
  }
  return sub_100007D60((void *)a1);
}

void sub_100007030(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_100007050(uint64_t a1)
{
  sub_100006F78(a1);
  operator delete();
}

void sub_100007098()
{
}

uint64_t sub_1000070BC(uint64_t a1, const void *a2, size_t __nbyte)
{
  if (!a2) {
    return 22;
  }
  if ((write(*(_DWORD *)(a1 + 112), a2, __nbyte) & 0x8000000000000000) == 0) {
    return 0;
  }
  uint64_t v4 = *__error();
  long long v5 = __error();
  uint64_t v6 = strerror(*v5);
  sub_10001D548(1, @"ERROR - %s:%s - %d write failed: %d (%s)", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortBT.mm", "PortTransmitData", 814, v4, v6);
  return 5;
}

uint64_t sub_100007150@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(result + 120))
  {
    *(_DWORD *)a2 = *(_DWORD *)(result + 808);
    *(_WORD *)(a2 + 4) = *(_WORD *)(result + 812);
  }
  else
  {
    *(_WORD *)(a2 + 4) = 0;
    *(_DWORD *)a2 = 0;
  }
  return result;
}

void sub_10000717C(id a1)
{
  qword_100032030 = (uint64_t)dispatch_queue_create("IapPortBT BT global event queue", 0);
}

uint64_t sub_1000071A8()
{
  return 1;
}

uint64_t sub_1000071B8()
{
  return 1;
}

uint64_t sub_1000071C0()
{
  return 0;
}

uint64_t sub_1000071C8()
{
  return 0;
}

void sub_1000071D0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1000071D0(a1, *a2);
    sub_1000071D0(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_100007224(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  long long v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        sched_param v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        long long v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      long long v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    sched_param v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    sub_1000072E0(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *sub_1000072E0(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_100007338(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100007338(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), long long v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *int v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *int v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t sub_1000074D0(uint64_t a1, unint64_t *a2)
{
  int v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    int v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  sub_10000754C((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *sub_10000754C(uint64_t **a1, uint64_t *a2)
{
  int v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      int v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_1000075C0(v6, a2);
  return v3;
}

uint64_t *sub_1000075C0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *unint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t sub_100007978()
{
  qword_100032028 = 0;
  qword_100032020 = 0;
  qword_100032018 = (uint64_t)&qword_100032020;
  return __cxa_atexit((void (*)(void *))sub_1000054C0, &qword_100032018, (void *)&_mh_execute_header);
}

void sub_100007ABC(void *a1, int a2, unsigned int a3)
{
  if (!a2)
  {
    NSLog(@"ERROR - %s:%s - %d service is NULL", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportManager.mm", "__accessoryPortManagerInterest", 32);
    return;
  }
  if (a3 >> 4 == 239073280)
  {
    uint64_t v4 = a3 + 469794816;
_objc_msgSend$_setAccResistorID_:
    [a1 _setAccResistorID:v4];
    return;
  }
  if (a3 == -469794799)
  {
    uint64_t v4 = 0xFFFFFFFFLL;
    goto _objc_msgSend$_setAccResistorID_;
  }
}

uint64_t sub_100007C38(uint64_t a1)
{
  return a1;
}

void *sub_100007C64(void *a1)
{
  return a1;
}

uint64_t sub_100007C8C(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t sub_100007C98(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 20);
  }
  return result;
}

BOOL sub_100007CA4(int a1)
{
  return (a1 - 6) < 0x10;
}

uint64_t sub_100007CB4(uint64_t a1)
{
  *(unsigned char *)(a1 + 8) = 0;
  uint64_t result = MGGetBoolAnswer();
  *(unsigned char *)(a1 + 9) = result ^ 1;
  return result;
}

uint64_t sub_100007CEC(uint64_t a1, int a2, int a3)
{
  *(void *)a1 = off_10002CC08;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 1;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  if ((MGGetBoolAnswer() & 1) == 0) {
    *(_WORD *)(a1 + 8) = 256;
  }
  return a1;
}

void *sub_100007D60(void *a1)
{
  *a1 = off_10002CC08;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007E3C;
  v5[3] = &unk_10002CA98;
  v5[4] = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_100007E3C((uint64_t)v5);
  pthread_mutex_unlock(&stru_100031C80);
  uint64_t v2 = a1[3];
  if (v2)
  {
    dispatch_release(v2);
    a1[3] = 0;
  }
  uint64_t v3 = a1[4];
  if (v3)
  {
    sub_10001EA70(v3);
    a1[4] = 0;
  }
  return a1;
}

void *sub_100007E3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return sub_100007E70((uint64_t)&qword_100032038, &v2);
}

void *sub_100007E70(uint64_t a1, void *a2)
{
  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 != (void *)a1)
  {
    do
    {
      BOOL v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          BOOL v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            BOOL v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        sub_100009234((uint64_t)v10, v10, a1, v2, v6);
        if (!v8) {
          BOOL v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
  }
  return sub_1000091A4(v10);
}

void sub_100007F2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000091A4((uint64_t *)va);
  _Unwind_Resume(a1);
}

NSObject *sub_100007F48(int64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, void *a5)
{
  uint64_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a4);
  if (v9)
  {
    dispatch_time_t v10 = dispatch_walltime(0, a1);
    dispatch_source_set_timer(v9, v10, a2, a3);
    dispatch_source_set_event_handler(v9, a5);
    dispatch_resume(v9);
  }
  return v9;
}

uint64_t sub_100007FD8(int a1)
{
  if ((a1 - 4) >= 0xFFFFFFFE) {
    sub_10001F680();
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (qword_100031F48 != -1) {
    dispatch_once(&qword_100031F48, &stru_10002CD70);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000080C8;
  v4[3] = &unk_10002CC88;
  int v5 = a1;
  v4[4] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100031F40, v4);
  uint64_t v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

unsigned char *sub_1000080C8(uint64_t a1)
{
  uint64_t result = (unsigned char *)qword_100031F38;
  if (!qword_100031F38)
  {
    uint64_t result = malloc_type_calloc(0xCuLL, 0x10uLL, 0x10800403DA8C3A5uLL);
    qword_100031F38 = (uint64_t)result;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result[16 * *(unsigned __int8 *)(a1 + 40)];
  return result;
}

void sub_10000812C(int a1)
{
  if ((a1 - 4) >= 0xFFFFFFFE) {
    sub_10001F680();
  }
  if (qword_100031F48 != -1) {
    dispatch_once(&qword_100031F48, &stru_10002CD70);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000081E4;
  block[3] = &unk_10002CAB8;
  int v3 = a1;
  dispatch_sync((dispatch_queue_t)qword_100031F40, block);
}

_DWORD *sub_1000081E4(_DWORD *result)
{
  int v1 = result;
  uint64_t v2 = qword_100031F38;
  if (!qword_100031F38)
  {
    uint64_t result = malloc_type_calloc(0xCuLL, 0x10uLL, 0x10800403DA8C3A5uLL);
    uint64_t v2 = (uint64_t)result;
    qword_100031F38 = (uint64_t)result;
  }
  int v3 = (unsigned char *)(v2 + 16 * v1[8]);
  if (!*v3)
  {
    *int v3 = 1;
    if (qword_100031F48 != -1) {
      dispatch_once(&qword_100031F48, &stru_10002CD70);
    }
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100008308;
    v4[3] = &unk_10002CCA8;
    v4[4] = v2;
    int v5 = v1[8];
    uint64_t result = sub_100007F48(360000000000, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL, qword_100031F40, v4);
    *(void *)(v2 + 16 * v1[8] + 8) = result;
  }
  return result;
}

void sub_100008308(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 16 * *(unsigned int *)(a1 + 40);
  if (*(unsigned char *)v1)
  {
    *(unsigned char *)uint64_t v1 = 0;
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 8));
    int v3 = *(NSObject **)(*(void *)(a1 + 32) + 16 * *(unsigned int *)(a1 + 40) + 8);
    dispatch_release(v3);
  }
}

void sub_100008374(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  if (v2 == 2)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 96))(&v4, a1);
    sub_10000841C((uint64_t)&v4, v3);
  }
  else
  {
    sub_10000812C(v2);
  }
}

void sub_10000841C(uint64_t a1, uint8x8_t a2)
{
  a2.i32[0] = *(_DWORD *)a1;
  int16x8_t v3 = (int16x8_t)vmovl_u8(a2);
  char v4 = *(unsigned char *)(a1 + 4);
  char v5 = *(unsigned char *)(a1 + 5);
  if (qword_100031F48 != -1)
  {
    int16x8_t v6 = v3;
    dispatch_once(&qword_100031F48, &stru_10002CD70);
    int16x8_t v3 = v6;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100008700;
  block[3] = &unk_10002CD30;
  void block[4] = a1;
  unsigned __int32 v8 = vmovn_s16(v3).u32[0];
  char v9 = v4;
  char v10 = v5;
  dispatch_sync((dispatch_queue_t)qword_100031F40, block);
}

uint64_t sub_1000084F4(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  if (v2 == 2)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 96))(&v4, a1);
    return sub_10000859C((uint64_t)&v4);
  }
  else
  {
    return sub_100007FD8(v2);
  }
}

uint64_t sub_10000859C(uint64_t a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  v1.i32[1] = 32;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v1.i32[0] = *(_DWORD *)a1;
  int16x8_t v2 = (int16x8_t)vmovl_u8(v1);
  char v3 = *(unsigned char *)(a1 + 4);
  char v4 = *(unsigned char *)(a1 + 5);
  if (qword_100031F48 != -1)
  {
    int16x8_t v7 = v2;
    dispatch_once(&qword_100031F48, &stru_10002CD70);
    int16x8_t v2 = v7;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10000869C;
  block[3] = &unk_10002CCD0;
  void block[4] = &v12;
  unsigned __int32 v9 = vmovn_s16(v2).u32[0];
  char v10 = v3;
  char v11 = v4;
  dispatch_sync((dispatch_queue_t)qword_100031F40, block);
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t *sub_10000869C(uint64_t a1)
{
  uint64_t result = (uint64_t *)sub_1000092AC((uint64_t)&qword_100031F20, a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != &qword_100031F28;
  return result;
}

uint64_t sub_1000086E8(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 40);
  *(_WORD *)(result + 44) = *(_WORD *)(a2 + 44);
  *(_DWORD *)(result + 40) = v2;
  return result;
}

char *sub_100008700(uint64_t a1)
{
  if (qword_100031F48 != -1) {
    dispatch_once(&qword_100031F48, &stru_10002CD70);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_1000087E4;
  v4[3] = &unk_10002CD00;
  int v5 = *(_DWORD *)(a1 + 40);
  __int16 v6 = *(_WORD *)(a1 + 44);
  int v2 = sub_100007F48(360000000000, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL, qword_100031F40, v4);
  uint64_t result = sub_10000887C((uint64_t **)&qword_100031F20, *(void *)(a1 + 32));
  *(void *)uint64_t result = v2;
  return result;
}

void sub_1000087E4(uint64_t a1)
{
  uint64_t v1 = sub_1000092AC((uint64_t)&qword_100031F20, a1 + 32);
  if ((uint64_t *)v1 != &qword_100031F28)
  {
    uint64_t v2 = v1;
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 40));
    dispatch_release(*(dispatch_object_t *)(v2 + 40));
    sub_10000754C((uint64_t **)&qword_100031F20, (uint64_t *)v2);
    operator delete((void *)v2);
  }
}

uint64_t sub_100008864(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 32);
  *(_WORD *)(result + 36) = *(_WORD *)(a2 + 36);
  *(_DWORD *)(result + 32) = v2;
  return result;
}

char *sub_10000887C(uint64_t **a1, uint64_t a2)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  char v4 = sub_100009384((uint64_t)a1, &v8, a2);
  int v5 = (_DWORD *)*v4;
  if (!*v4)
  {
    __int16 v6 = (uint64_t **)v4;
    int v5 = operator new(0x30uLL);
    v5[8] = *(_DWORD *)a2;
    *((_WORD *)v5 + 18) = *(_WORD *)(a2 + 4);
    *((void *)v5 + 5) = 0;
    sub_1000072E0(a1, v8, v6, (uint64_t *)v5);
  }
  return (char *)(v5 + 10);
}

void sub_100008908(BOOL a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "enable", a1);
  xpc_dictionary_set_uint64(v2, "portManagerNumber", 6uLL);
  xpc_dictionary_set_string(v2, "requestType", "hasAdaptor");
  if (+[IAPTransportServer supportsIAPD]) {
    objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v2);
  }
  xpc_release(v2);
}

void sub_1000089B0(BOOL a1)
{
  if (sub_1000163EC())
  {
    sub_100008908(a1);
  }
}

void sub_1000089F8(BOOL a1)
{
  if (!sub_1000163EC())
  {
    sub_100008908(a1);
  }
}

void sub_100008A40(uint64_t a1, char *a2, unsigned int a3)
{
  if (!*(unsigned char *)(a1 + 10)) {
    return;
  }
  unsigned int v6 = +[IAPTransportServer supportsIAPD];
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 80))(a1) != 11)
  {
    if (*(unsigned char *)(a1 + 9)) {
      goto LABEL_5;
    }
    memset(v42, 170, sizeof(v42));
    if (a2 && a3)
    {
      char v11 = dispatch_data_create(a2, a3, (dispatch_queue_t)&_dispatch_main_q, 0);
      uint64_t v12 = v11;
      uint64_t v13 = *(NSObject **)(a1 + 24);
      if (v13)
      {
        *(void *)(a1 + 24) = dispatch_data_create_concat(*(dispatch_data_t *)(a1 + 24), v11);
        dispatch_release(v13);
        dispatch_release(v12);
        goto LABEL_25;
      }
      object = 0;
      *(void *)(a1 + 24) = v11;
    }
    else
    {
      if (!*(unsigned char *)(a1 + 40) || (uint64_t v14 = *(NSObject **)(a1 + 24)) == 0)
      {
LABEL_25:
        object = 0;
        if (!a2) {
          goto LABEL_74;
        }
        goto LABEL_28;
      }
      size_t size_ptr = 0;
      buffer_ptr = 0;
      object = dispatch_data_create_map(v14, (const void **)&buffer_ptr, &size_ptr);
      a2 = (char *)buffer_ptr;
      a3 = size_ptr;
      if (!buffer_ptr) {
        goto LABEL_74;
      }
    }
LABEL_28:
    if (!a3 || !*(unsigned char *)(a1 + 40))
    {
LABEL_74:
      if (object) {
        dispatch_release(object);
      }
      return;
    }
    gettimeofday((timeval *)&v42[1], 0);
    uint64_t v15 = 1000 * v42[1] + SLODWORD(v42[2]) / 1000;
    while (1)
    {
      v42[0] = 0;
      uint64_t v16 = *(void *)(a1 + 32);
      if (!v16) {
        sub_10001E254();
      }
      HIBYTE(v39) = *(unsigned char *)(a1 + 8);
      int v17 = sub_10001E368(v16, v15, a2, a3, v42, (unsigned char *)&v39 + 7);
      *(unsigned char *)(a1 + 8) = (*(unsigned __int8 *)(a1 + 8) | HIBYTE(v39)) != 0;
      if (v17 > 59)
      {
        if (v17 == 60)
        {
          v34 = *(NSObject **)(a1 + 24);
          if (v34)
          {
            dispatch_release(v34);
            *(void *)(a1 + 24) = 0;
          }
          sub_10001EA70(*(void *)(a1 + 32));
          *(void *)(a1 + 32) = 0;
          v42[0] = a3;
        }
        else if (v17 == 102)
        {
          sub_10001EA70(*(void *)(a1 + 32));
          *(void *)(a1 + 32) = 0;
          v42[0] = 0;
          uint64_t v22 = *(NSObject **)(a1 + 24);
          if (v22)
          {
            size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 24));
            dispatch_data_t subrange = dispatch_data_create_subrange(v22, size - a3, a3);
            dispatch_release(*(dispatch_object_t *)(a1 + 24));
            *(void *)(a1 + 24) = subrange;
          }
        }
        goto LABEL_71;
      }
      if (v17)
      {
        if (v17 == 36)
        {
          uint64_t v18 = *(void *)(a1 + 32);
          if (v18)
          {
            if (*(unsigned __int8 *)(v18 + 112) <= 1u && !*(unsigned char *)(v18 + 119))
            {
              v19 = *(NSObject **)(a1 + 24);
              if (v19)
              {
                size_t v20 = a3 - v42[0];
                if ((unint64_t)a3 > v42[0])
                {
                  size_t v21 = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 24));
                  dispatch_data_t v37 = dispatch_data_create_subrange(v19, v21 - v20, v20);
                  v19 = *(NSObject **)(a1 + 24);
                }
                else
                {
                  dispatch_data_t v37 = 0;
                }
                dispatch_release(v19);
                *(void *)(a1 + 24) = v37;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v25 = *(NSObject **)(a1 + 24);
        if (v25)
        {
          *(unsigned char *)(a1 + 9) = 1;
          size_t size_ptr = 0;
          buffer_ptr = 0;
          uint64_t v26 = dispatch_data_create_map(v25, (const void **)&buffer_ptr, &size_ptr);
          xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v27, "portNumber", *(int *)(a1 + 16));
          xpc_dictionary_set_uint64(v27, "portManagerNumber", *(int *)(a1 + 20));
          unsigned int v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
          xpc_dictionary_set_uint64(v27, "portType", v28);
          xpc_dictionary_set_uint64(v27, "portID", a1);
          if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
          {
            WORD2(v39) = -21846;
            LODWORD(v39) = -1431655766;
            (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 96))(&v39, a1);
            xpc_dictionary_set_data(v27, "macAddr", &v39, 6uLL);
          }
          if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 104))(a1))
          {
            uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
            xpc_dictionary_set_uint64(v27, "usbDevID", v29);
          }
          xpc_dictionary_set_data(v27, "data", buffer_ptr, size_ptr);
          xpc_dictionary_set_string(v27, "requestType", "dataArrived");
          int v30 = *(unsigned __int8 *)(a1 + 8);
          if (*(unsigned char *)(a1 + 8)) {
            unsigned int v31 = 0;
          }
          else {
            unsigned int v31 = v6;
          }
          if (v31 == 1)
          {
            char v32 = sub_1000163E0();
            if (!sub_1000163EC()) {
              sub_100008908(v32);
            }
            int v30 = *(unsigned __int8 *)(a1 + 8);
          }
          if (v30)
          {
            id v33 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection");
            goto LABEL_66;
          }
          if (v6)
          {
            id v33 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection");
LABEL_66:
            [v33 sendMessage:v27];
          }
          xpc_release(v27);
          dispatch_release(v26);
          v42[0] = a3;
          uint64_t v35 = *(void *)(a1 + 32);
          if (v35)
          {
            sub_10001EA70(v35);
            *(void *)(a1 + 32) = 0;
          }
          v36 = *(NSObject **)(a1 + 24);
          if (v36)
          {
            dispatch_release(v36);
            *(void *)(a1 + 24) = 0;
          }
        }
      }
LABEL_71:
      a2 += v42[0];
      a3 -= LODWORD(v42[0]);
      if (!a3) {
        goto LABEL_74;
      }
    }
  }
  *(_WORD *)(a1 + 8) = 257;
LABEL_5:
  if (a2 && a3)
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "portNumber", *(int *)(a1 + 16));
    xpc_dictionary_set_uint64(v7, "portManagerNumber", *(int *)(a1 + 20));
    unsigned int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    xpc_dictionary_set_uint64(v7, "portType", v8);
    xpc_dictionary_set_uint64(v7, "portID", a1);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
    {
      WORD2(v42[1]) = -21846;
      LODWORD(v42[1]) = -1431655766;
      (*(void (**)(void *__return_ptr, uint64_t))(*(void *)a1 + 96))(&v42[1], a1);
      xpc_dictionary_set_data(v7, "macAddr", &v42[1], 6uLL);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 104))(a1))
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112))(a1);
      xpc_dictionary_set_uint64(v7, "usbDevID", v9);
    }
    xpc_dictionary_set_data(v7, "data", a2, a3);
    xpc_dictionary_set_string(v7, "requestType", "dataArrived");
    if (*(unsigned char *)(a1 + 8))
    {
      id v10 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection");
    }
    else
    {
      if (!v6)
      {
LABEL_20:
        xpc_release(v7);
        return;
      }
      id v10 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection");
    }
    [v10 sendMessage:v7];
    goto LABEL_20;
  }
}

uint64_t sub_100009190()
{
  return 0;
}

void sub_100009198(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 4) = 0;
  *(_DWORD *)a1 = 0;
}

void *sub_1000091A4(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        char v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void sub_100009208(id a1)
{
  qword_100031F40 = (uint64_t)dispatch_queue_create("com.iaptransportd.lockoutqueue", 0);
}

uint64_t sub_100009234(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    int v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        xpc_object_t v7 = a4;
        do
        {
          xpc_object_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

uint64_t sub_1000092AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (!v4) {
    return v2;
  }
  uint64_t v5 = v2;
  do
  {
    unsigned int v6 = bswap32(*(_DWORD *)(v3 + 32));
    unsigned int v7 = bswap32(*(_DWORD *)a2);
    if (v6 != v7) {
      goto LABEL_7;
    }
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v3 + 36)) >> 16;
    unsigned int v8 = bswap32(*(unsigned __int16 *)(a2 + 4));
    if (v6 != HIWORD(v8))
    {
      unsigned int v7 = HIWORD(v8);
LABEL_7:
      if (v6 < v7) {
        int v9 = -1;
      }
      else {
        int v9 = 1;
      }
      goto LABEL_10;
    }
    int v9 = 0;
LABEL_10:
    BOOL v10 = v9 < 0;
    if (v9 >= 0) {
      char v11 = (uint64_t *)v3;
    }
    else {
      char v11 = (uint64_t *)(v3 + 8);
    }
    if (!v10) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v11;
  }
  while (*v11);
  if (v5 == v2) {
    return v2;
  }
  unsigned int v12 = bswap32(*(_DWORD *)a2);
  unsigned int v13 = bswap32(*(_DWORD *)(v5 + 32));
  if (v12 != v13) {
    goto LABEL_20;
  }
  unsigned int v12 = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  unsigned int v14 = bswap32(*(unsigned __int16 *)(v5 + 36));
  if (v12 != HIWORD(v14))
  {
    unsigned int v13 = HIWORD(v14);
LABEL_20:
    int v15 = v12 < v13 ? -1 : 1;
    if (v15 < 0) {
      return v2;
    }
  }
  return v5;
}

uint64_t *sub_100009384(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  uint64_t result = (uint64_t *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    while (1)
    {
      unsigned int v6 = v4;
      unsigned int v7 = bswap32(*(_DWORD *)a3);
      unsigned int v8 = bswap32(*((_DWORD *)v6 + 8));
      if (v7 != v8) {
        goto LABEL_8;
      }
      unsigned int v7 = bswap32(*(unsigned __int16 *)(a3 + 4)) >> 16;
      unsigned int v9 = bswap32(*((unsigned __int16 *)v6 + 18));
      if (v7 == HIWORD(v9))
      {
LABEL_12:
        unsigned int v11 = bswap32(*((_DWORD *)v6 + 8));
        unsigned int v12 = bswap32(*(_DWORD *)a3);
        if (v11 == v12)
        {
          unsigned int v11 = bswap32(*((unsigned __int16 *)v6 + 18)) >> 16;
          unsigned int v13 = bswap32(*(unsigned __int16 *)(a3 + 4));
          if (v11 == HIWORD(v13)) {
            goto LABEL_22;
          }
          unsigned int v12 = HIWORD(v13);
        }
        if (v11 < v12) {
          int v14 = -1;
        }
        else {
          int v14 = 1;
        }
        if ((v14 & 0x80000000) == 0) {
          goto LABEL_22;
        }
        uint64_t result = v6 + 1;
        uint64_t v4 = (uint64_t *)v6[1];
        if (!v4) {
          goto LABEL_22;
        }
      }
      else
      {
        unsigned int v8 = HIWORD(v9);
LABEL_8:
        if (v7 < v8) {
          int v10 = -1;
        }
        else {
          int v10 = 1;
        }
        if ((v10 & 0x80000000) == 0) {
          goto LABEL_12;
        }
        uint64_t v4 = (uint64_t *)*v6;
        uint64_t result = v6;
        if (!*v6) {
          goto LABEL_22;
        }
      }
    }
  }
  unsigned int v6 = result;
LABEL_22:
  *a2 = v6;
  return result;
}

uint64_t sub_10000945C()
{
  qword_100031F30 = 0;
  qword_100031F28 = 0;
  qword_100031F20 = (uint64_t)&qword_100031F28;
  __cxa_atexit((void (*)(void *))sub_100007C38, &qword_100031F20, (void *)&_mh_execute_header);
  qword_100032038 = (uint64_t)&qword_100032038;
  qword_100032040 = (uint64_t)&qword_100032038;
  qword_100032048 = 0;
  return __cxa_atexit((void (*)(void *))sub_100007C64, &qword_100032038, (void *)&_mh_execute_header);
}

const char *sub_1000094E4()
{
  return "Client Port";
}

uint64_t sub_1000094F0()
{
  return 10;
}

uint64_t sub_1000094F8()
{
  return 1;
}

uint64_t sub_100009500()
{
  return 0;
}

uint64_t sub_100009508()
{
  return 0;
}

uint64_t sub_100009510()
{
  return 0;
}

intptr_t sub_100009518(intptr_t result)
{
  if (result)
  {
    intptr_t v1 = result;
    uint64_t result = (*(uint64_t (**)(intptr_t))(*(void *)result + 80))(result);
    if (result == 10)
    {
      sub_100016590((unsigned char *)v1);
      *(unsigned char *)(v1 + 200) = 1;
      uint64_t v2 = *(NSObject **)(v1 + 192);
      return dispatch_semaphore_signal(v2);
    }
  }
  return result;
}

uint64_t sub_100009598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dispatch_semaphore_create(0);
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  global_queue = dispatch_get_global_queue(2, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009680;
  v8[3] = &unk_10002CD98;
  v8[4] = a1;
  v8[5] = a2;
  v8[6] = v4;
  v8[7] = &v9;
  dispatch_async(global_queue, v8);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_100009680()
{
}

void sub_100009748()
{
}

void sub_10000976C(uint64_t a1)
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  while (!*(unsigned char *)(a1 + 200))
  {
    uint64_t v10[3] = 0;
    uint64_t v2 = *(NSObject **)(a1 + 88);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000990C;
    block[3] = &unk_10002CDC0;
    void block[4] = &v9;
    void block[5] = a1;
    dispatch_sync(v2, block);
    uint64_t v3 = v10[3];
    if (v3)
    {
      uint64_t v4 = *(char **)(v3 + 8);
      if (v4)
      {
        unsigned int v5 = *(_DWORD *)(v3 + 16);
        if (v5)
        {
          sub_100008A40(a1, v4, v5);
          free(*(void **)(v10[3] + 8));
          *(void *)(v10[3] + 8) = 0;
          *(_DWORD *)(v10[3] + 16) = 0;
          uint64_t v6 = *(NSObject **)(a1 + 80);
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = sub_100009960;
          v7[3] = &unk_10002CDC0;
          v7[4] = &v9;
          v7[5] = a1;
          dispatch_sync(v6, v7);
        }
      }
    }
    else
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 192), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  _Block_object_dispose(&v9, 8);
}

void sub_1000098F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000990C(uint64_t result)
{
  intptr_t v1 = *(void **)(result + 40);
  uint64_t v2 = v1[23];
  if (v2)
  {
    unint64_t v3 = v1[22];
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(v1[19]
                                                                                            + ((v3 >> 6) & 0x3FFFFFFFFFFFFF8))
                                                                                + 8 * (v3 & 0x1FF));
    v1[22] = v3 + 1;
    v1[23] = v2 - 1;
    return sub_10000A30C((uint64_t)(v1 + 18), 1);
  }
  return result;
}

void sub_100009960(uint64_t a1)
{
}

void sub_100009974(void *a1)
{
  uint64_t v2 = sub_100007CEC((uint64_t)a1, 0, 0);
  *(void *)uint64_t v2 = &off_10002CDF0;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(void *)(v2 + 72) = 0;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(unsigned char *)(v2 + 200) = 0;
  a1[24] = dispatch_semaphore_create(0);
  a1[10] = dispatch_queue_create("com.apple.iaptransportd.ClientPortStackLock", 0);
  a1[11] = dispatch_queue_create("com.apple.iaptransportd.ClientPortQueueLock", 0);
  operator new[]();
}

void sub_100009B14(_Unwind_Exception *a1)
{
  sub_10000A1B0(v3);
  sub_10000A1B0(v2);
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void *sub_100009B54(uint64_t a1)
{
  *(void *)a1 = &off_10002CDF0;
  uint64_t v2 = *(NSObject **)(a1 + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C94;
  block[3] = &unk_10002CA98;
  void block[4] = a1;
  dispatch_sync(v2, block);
  dispatch_sync(*(dispatch_queue_t *)(a1 + 64), &stru_10002CE98);
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  if (*(void *)(a1 + 72)) {
    operator delete[]();
  }
  *(void *)(a1 + 72) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 88));
  dispatch_release(*(dispatch_object_t *)(a1 + 80));
  dispatch_release(*(dispatch_object_t *)(a1 + 192));

  sub_10000A1B0((void *)(a1 + 144));
  sub_10000A1B0((void *)(a1 + 96));
  return sub_100007D60((void *)a1);
}

void sub_100009C5C(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009C94(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  for (uint64_t i = *(void *)(v1 + 184); i; uint64_t i = *(void *)(v1 + 184))
  {
    ++*(void *)(v1 + 176);
    *(void *)(v1 + 184) = i - 1;
    uint64_t result = sub_10000A30C(v1 + 144, 1);
  }
  return result;
}

void sub_100009CEC(uint64_t a1)
{
  sub_100009B54(a1);
  operator delete();
}

void sub_100009D34()
{
}

uint64_t sub_100009D58(uint64_t a1, const void *a2, unsigned int a3)
{
  if (a2)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_data(v6, "data", a2, a3);
    xpc_dictionary_set_string(v6, "IAPClientPortUUIDStr", (const char *)[*(id *)(a1 + 48) UTF8String]);
    xpc_dictionary_set_string(v6, "requestType", "transmitData");
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), v6);
    xpc_release(v6);
    return 0;
  }
  else
  {
    NSLog(@"CIapPortClientPort::PortTransmitData ERROR: NULL packet");
    return 14;
  }
}

uint64_t sub_100009E14()
{
  return 45;
}

void sub_100009E3C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int16 v3 = a3;
  id v6 = [objc_alloc((Class)NSData) initWithBytes:a2 length:a3];
  unsigned int v7 = *(NSObject **)(a1 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009EEC;
  v8[3] = &unk_10002CEE8;
  v8[5] = a1;
  v8[6] = a2;
  __int16 v9 = v3;
  v8[4] = v6;
  dispatch_async(v7, v8);
}

void sub_100009EEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v2 + 200))
  {
    if (*(void *)(a1 + 48))
    {
      if (*(_WORD *)(a1 + 56))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        if (v3)
        {
          v6[0] = 0;
          v6[1] = v6;
          v6[2] = 0x2020000000;
          v6[3] = 0;
          uint64_t v4 = *(NSObject **)(v2 + 80);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100009FC0;
          block[3] = &unk_10002CEC0;
          void block[5] = v6;
          void block[6] = v2;
          void block[4] = v3;
          dispatch_sync(v4, block);
          _Block_object_dispose(v6, 8);
        }
      }
    }
  }
}

void sub_100009FC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(v2 + 136);
  if (v3)
  {
    uint64_t v4 = v3 - 1;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(v2 + 104)
                                                                                        + (((unint64_t)(*(void *)(v2 + 128) + v4) >> 6) & 0x3FFFFFFFFFFFFF8))
                                                                            + 8 * ((*(void *)(v2 + 128) + v4) & 0x1FF));
    *(void *)(v2 + 136) = v4;
    sub_10000ABC0((void *)(v2 + 96), 1);
  }
  else
  {
    NSLog(@"CIapPortClientPort::ProcessIncomingData dropped data due to full packet queue!!");
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    size_t v5 = (unsigned __int16)[*(id *)(a1 + 32) length];
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8) = malloc_type_malloc(v5, 0x100004077774924uLL);
    memcpy(*(void **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8), [*(id *)(a1 + 32) bytes], v5);
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 16) = v5;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v8.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v8, 0);
    **(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1000 * v8.tv_sec + v8.tv_usec / 1000;
    id v6 = *(NSObject **)(v2 + 88);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A184;
    v7[3] = &unk_10002CDC0;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    dispatch_sync(v6, v7);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 192));
  }
}

void sub_10000A184(uint64_t a1)
{
}

uint64_t sub_10000A198(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t sub_10000A1A0(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t sub_10000A1A8()
{
  return 1;
}

uint64_t sub_10000A1B0(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  unint64_t v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    size_t v5 = a1 + 5;
  }
  else
  {
    size_t v5 = a1 + 5;
    unint64_t v6 = a1[4];
    unsigned int v7 = &v2[v6 >> 9];
    uint64_t v8 = (uint64_t)*v7;
    uint64_t v9 = (uint64_t)*v7 + 8 * (v6 & 0x1FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8))
                        + 8 * ((a1[5] + v6) & 0x1FF))
    {
      v9 += 8;
      if (v9 - v8 == 4096)
      {
        uint64_t v10 = (uint64_t)v7[1];
        ++v7;
        uint64_t v8 = v10;
        uint64_t v9 = v10;
      }
    }
  }
  *size_t v5 = 0;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v4 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 256;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = 512;
  }
  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    unsigned int v13 = *v2++;
    operator delete(v13);
  }
  return sub_10000A2BC((uint64_t)a1);
}

uint64_t sub_10000A2BC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_10000A30C(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

void sub_10000A36C(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_10000A3F4(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_10000A3F4(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_10000AB88(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      dispatch_data_t v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_10000A70C(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_10000A824((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_10000AB88((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      dispatch_data_t v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_10000AB88((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_10000A944(&v54, &v53);
  xpc_object_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000AA5C((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_10000A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000A70C(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      v19 = (char *)sub_10000AB88(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      xpc_object_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_10000A824(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_10000AB88(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_10000A944(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_10000AB88(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_10000AA5C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_10000AB88(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_10000AB78()
{
}

void *sub_10000AB88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000AB78();
  }
  return operator new(8 * a2);
}

uint64_t sub_10000ABC0(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = ((v2 - v3) << 6) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x200) {
    a2 = 1;
  }
  if (v5 < 0x400) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

uint64_t sub_10000AC30(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ACF4;
  block[3] = &unk_10002CEC0;
  void block[4] = a1;
  void block[5] = &v8;
  void block[6] = a2;
  dispatch_sync(global_queue, block);
  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_10000ACF4()
{
}

void sub_10000AD48()
{
}

void sub_10000AD6C(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADF0;
  block[3] = &unk_10002CA98;
  void block[4] = a1;
  dispatch_sync(global_queue, block);
}

uint64_t sub_10000ADF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_10000AE20(id a1)
{
  qword_1000321A8 = (uint64_t)dispatch_queue_create("com.apple.iaptransportd.attachedAIDBAccessoryCacheQueue", 0);
  CFPropertyListRef v1 = CFPreferencesCopyValue(@"attachedAIDBAccessoriesCache", @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (v1 && (uint64_t v2 = v1, DeepCopy = CFPropertyListCreateDeepCopy(kCFAllocatorDefault, v1, 2uLL), CFRelease(v2), DeepCopy))
  {
    qword_1000321B0 = (uint64_t)DeepCopy;
  }
  else
  {
    qword_1000321B0 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
    CFPreferencesSetValue(@"attachedAIDBAccessoriesCache", (CFPropertyListRef)qword_1000321B0, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    if (!CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost))
    {
      CStringPtr = CFStringGetCStringPtr(@"com.apple.iaptransportd", 0x8000100u);
      syslog(3, "%s CFPrefsSynchronize sync to %s failed !\n", "InitializeAttachedAIDBAccessoriesCache_block_invoke", CStringPtr);
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s s_attachedAIDBAccessoryCacheDict: %@\n", "InitializeAttachedAIDBAccessoriesCache_block_invoke", qword_1000321B0);
  }
}

BOOL sub_10000AF80(io_registry_entry_t a1)
{
  int v1 = sub_10000AFE4(a1);
  if (v1 == 3 && byte_100031F58) {
    syslog(4, "%s skipping authentication on attach of eACCTransportIOAccessoryAuthCPInternal_TouchController\n", "SkipAuthenticationOnServiceAttach");
  }
  return v1 == 3;
}

uint64_t sub_10000AFE4(io_registry_entry_t a1)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"flags", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v2 = CFProperty;
  int valuePtr = -1431655766;
  if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
  {
    int v3 = valuePtr & 0xFF0000;
    if ((valuePtr & 0xC) == 8) {
      unsigned int v4 = 2;
    }
    else {
      unsigned int v4 = 1;
    }
    if (v3 != 0x10000) {
      unsigned int v4 = 0;
    }
    if (v3 == 196608) {
      unsigned int v4 = 3;
    }
    if (v3 == 0x40000) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

uint64_t sub_10000B094(void *a1, io_registry_entry_t entry)
{
  io_service_t v13 = entry;
  uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
  IORegistryEntryGetRegistryEntryID(entry, &entryID);
  id v3 = objc_alloc((Class)NSNumber);
  id v4 = [v3 initWithUnsignedLongLong:entryID];
  uint64_t v5 = sub_10000B250((uint64_t)a1, (unint64_t)sub_10000B3FC, 0, (uint64_t)&v13, 0);
  if (!v5)
  {
    uint64_t v6 = sub_10000B250((uint64_t)a1, (unint64_t)sub_10000B3FC, 0, (uint64_t)&unk_100028A28, 3);
    if (v6) {
      uint64_t v5 = v6;
    }
    else {
      uint64_t v5 = (uint64_t)a1;
    }
  }
  id v7 = *(id *)(v5 + 128);
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    *(void *)(v5 + 128) = v7;
  }
  if ([v7 objectForKey:v4])
  {
    syslog(3, "Already registered for notifications from AppleAuthCP entryID\n");
  }
  else
  {
    syslog(3, "no notification for entryID=0x%llx\n", entryID);
    io_object_t notification = -1431655766;
    if (IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(void *)(v5 + 48) + 32), v13, "IOGeneralInterest", (IOServiceInterestCallback)sub_10000B410, a1, &notification))
    {
      syslog(3, "ERROR: Failed to register for notification from AppleAuthCP entryID:0x%llx, fail status:0x%llx\n");
    }
    else
    {
      syslog(3, "registered notification for entryID=0x%llx\n", entryID);
      id v9 = objc_alloc((Class)NSNumber);
      id v10 = [v9 initWithUnsignedInt:notification];
      [*(id *)(v5 + 128) setObject:v10 forKey:v4];
    }
  }

  syslog(3, "registration done for entryID\n");
  return v5;
}

uint64_t sub_10000B250(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5 = 0;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (a3) {
    BOOL v6 = (a3 & 1 | a2) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 || a2 != 0;
  if (a4 && v8)
  {
    if ((a5 & 1) != 0
      || ((uint64_t v14 = (void *)(a1 + (a3 >> 1)), (a3 & 1) != 0)
        ? (int v15 = (*(uint64_t (**)(void *, uint64_t))(*v14 + a2))(v14, a4))
        : (int v15 = ((uint64_t (*)(void *, uint64_t))a2)(v14, a4)),
          *((unsigned char *)v21 + 24) = v15,
          !v15))
    {
      unint64_t v16 = *(NSObject **)(a1 + 112);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000CF20;
      block[3] = &unk_10002D0C0;
      char v19 = a5;
      void block[6] = a1;
      void block[7] = a2;
      block[8] = a3;
      block[9] = a4;
      void block[4] = &v20;
      void block[5] = &v24;
      dispatch_sync(v16, block);
      uint64_t v5 = v25[3];
    }
    else
    {
      v25[3] = a1;
      uint64_t v5 = a1;
    }
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v5;
}

void sub_10000B3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000B3FC(uint64_t a1, _DWORD *a2)
{
  return *(_DWORD *)(a1 + 120) == *a2;
}

void sub_10000B410(uint64_t a1, io_object_t object, int a3)
{
  if (a3 == -469794816 && a1 != 0 && object != 0)
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    IOObjectRetain(object);
    id v9 = *(NSObject **)(*(void *)(a1 + 48) + 56);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100011BF4;
    uint64_t v10[3] = &unk_10002CCA8;
    v10[4] = a1;
    io_object_t v11 = object;
    dispatch_async(v9, v10);
  }
}

uint64_t sub_10000B4C0(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v6 = (void *)sub_100007CEC(a1, 0, 0);
  *BOOL v6 = off_10002CF50;
  v6[11] = v6 + 11;
  v6[12] = v6 + 11;
  v6[13] = 0;
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPort:%hhx, pAIDBStaticData:%hhx, pAIDBRoot:%hhx, certCacheRefCount:%02X\n", "CIapPortAppleIDBus", a1, a3, *a3, byte_1000321A0);
  }
  id v7 = dispatch_queue_create("com.apple.iaptd.aidbListLock", 0);
  *(void *)(a1 + 112) = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B620;
  block[3] = &unk_10002D030;
  void block[5] = a1;
  void block[6] = a3;
  void block[4] = a2;
  dispatch_sync(v7, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBPort:%hhx, bIsRoot:%d\n", "CIapPortAppleIDBus", a1, *(unsigned __int8 *)(a1 + 238));
  }
  return a1;
}

void sub_10000B600(_Unwind_Exception *a1)
{
  sub_1000091A4(v2);
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_10000B620(void *a1)
{
  int v1 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  uint64_t v3 = a1[5];
  CFNumberRef v2 = (unint64_t *)a1[6];
  v26[3] = v3;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x2020000000;
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *v2;
  if (!*v2) {
    unint64_t v4 = v3;
  }
  unint64_t v25 = v4;
  *(void *)(v3 + 48) = v2;
  *(_DWORD *)(v3 + 124) = 0;
  *(void *)(v3 + 128) = 0;
  *(unsigned char *)(v3 + 238) = v3 == v4;
  if (v3 == v4)
  {
    *(void *)a1[6] = v3;
    *(void *)(a1[6] + 32) = IONotificationPortCreate(kIOMasterPortDefault);
    *(void *)(a1[6] + 40) = 0;
    uint64_t v6 = a1[6];
    *(void *)(v6 + 48) = 0;
    *(void *)(v6 + 64) = 0;
    *(void *)(a1[6] + 72) = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iaptransportd.authQue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    uint64_t v8 = a1[6];
    *(void *)(v8 + 56) = v7;
    *(void *)(v8 + 80) = 0;
    uint64_t v9 = a1[6];
    *(void *)(v9 + 88) = 0;
    if ((long long *)v9 == &xmmword_1000320B8) {
      qword_100032118 = 10000000000;
    }
    else {
      *(void *)(v9 + 96) = 30000000000;
    }
    uint64_t v10 = v23[3];
    if (v10 == (void)xmmword_100032050 || v10 == (void)xmmword_1000320B8)
    {
      if (!byte_1000321A0++)
      {
        qword_100032188 = a1[4];
        qword_100032190 = (uint64_t)dispatch_queue_create("com.apple.iaptransportd.certQue", 0);
        CFDictionaryRef v12 = (const __CFDictionary *)CFPreferencesCopyValue(@"authCertCache", @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
        if (v12 && (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12), CFRelease(v12), MutableCopy))
        {
          qword_100032198 = (uint64_t)MutableCopy;
          sub_10000BB88();
        }
        else
        {
          qword_100032198 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
          CFPreferencesSetValue(@"authCertCache", (CFPropertyListRef)qword_100032198, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
          if (!CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost))
          {
            CStringPtr = CFStringGetCStringPtr(@"com.apple.iaptransportd", 0x8000100u);
            syslog(3, "%s CFPrefsSynchronize sync to %s failed !\n", "CIapPortAppleIDBus_block_invoke", CStringPtr);
          }
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)v3, (CFNotificationCallback)sub_10000BCC0, @"com.apple.iapd.LoggingPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        byte_100031F58 = CFPreferencesGetAppBooleanValue(@"AppleIDBusEventLogging", @"com.apple.iaptransportd", 0) != 0;
        byte_100031F59 = 0;
        byte_100031F5A = 0;
        if (MGGetBoolAnswer() && (MGGetBoolAnswer() & 1) == 0)
        {
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AppleIDAuthAlwaysPasses", @"com.apple.iaptransportd", 0);
          byte_100031F59 = AppBooleanValue != 0;
          if (byte_100031F58) {
            syslog(4, "CIapPortAppleIDBus Auth flag gbAuthAlwaysPasses:%d\n", AppBooleanValue != 0);
          }
          int v17 = CFPreferencesGetAppBooleanValue(@"AppleIDAuthCertNotCached", @"com.apple.iaptransportd", 0);
          byte_100031F5A = v17 != 0;
          if (byte_100031F58) {
            syslog(4, "CIapPortAppleIDBus Auth flag gbAuthCertNotCached:%d\n", v17 != 0);
          }
          char AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AppleIDAuthMaxTryCount", @"com.apple.iaptransportd", 0);
          if (AppIntegerValue) {
            byte_100031CC0 = AppIntegerValue;
          }
          if (byte_100031F58) {
            syslog(4, "CIapPortAppleIDBus Auth flag gAuthMaxTryCount:%02X\n", byte_100031CC0);
          }
        }
      }
      if (qword_100031F50 != -1) {
        dispatch_once(&qword_100031F50, &stru_10002CF20);
      }
    }
    int v1 = -1;
  }
  *(_DWORD *)(v3 + 120) = v1;
  *(void *)(v3 + 64) = 0;
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 56) = 0;
  *(_DWORD *)(v3 + 80) = 0;
  *(unsigned char *)(v3 + 224) = 0;
  *(_OWORD *)(v3 + 192) = 0u;
  *(_OWORD *)(v3 + 208) = 0u;
  *(void *)(v3 + 226) = 0;
  *(_DWORD *)(v3 + 233) = 0;
  *(unsigned char *)(v3 + 237) = 0;
  *(_WORD *)(v3 + 239) = 0;
  *(unsigned char *)(v3 + 144) = 0;
  *(void *)(v3 + 248) = 0;
  *(unsigned char *)(v3 + 256) = 0;
  *(_OWORD *)(v3 + 148) = 0u;
  *(_OWORD *)(v3 + 164) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(void *)(v3 + 264) = dispatch_queue_create("com.apple.iaptransportd.aidbAccAttachLock", 0);
  if (v3 == (void)xmmword_100032050)
  {
    io_object_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
    sub_10000BD08(v3, ServiceWithPrimaryPort, 1);
  }
  uint64_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  *(void *)(v3 + 136) = v20;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000BDAC;
  handler[3] = &unk_10002D008;
  handler[4] = &v22;
  handler[5] = v26;
  dispatch_source_set_event_handler(v20, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(v3 + 136), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*(dispatch_object_t *)(v3 + 136));
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

void sub_10000BB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000BB88()
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR\n", "AuthCertValidateCache");
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = 0;
  CFNumberRef v2 = &v1;
  uint64_t v3 = 0x2020000000;
  uint64_t v4 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010188;
  block[3] = &unk_10002D008;
  void block[4] = &v5;
  void block[5] = &v1;
  dispatch_sync((dispatch_queue_t)qword_100032190, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT certCountOnEntry:%02lX, certCountDeleted:%02lX\n", "AuthCertValidateCache", v6[3], v2[3]);
  }
  _Block_object_dispose(&v1, 8);
  _Block_object_dispose(&v5, 8);
}

void sub_10000BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BCC0()
{
  NSLog(@"Logging preferences changed! (IapPortAppleIDBus)");
  uint64_t result = CFPreferencesGetAppBooleanValue(@"AppleIDBusEventLogging", @"com.apple.iaptransportd", 0);
  byte_100031F58 = result != 0;
  return result;
}

void sub_10000BD08(uint64_t a1, io_object_t object, int a3)
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPort:%hhx, bIsRoot:%d, ioService:%04X, ioAccPortID:%04X\n", "HandleIOAccPortAttach", a1, *(unsigned __int8 *)(a1 + 238), object, a3);
  }
  *(_DWORD *)(a1 + 60) = object;
  IOObjectRetain(object);
  *(_DWORD *)(a1 + 56) = a3;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 20) = a3;
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBPort:%hhx\n", "HandleIOAccPortAttach", a1);
  }
}

void sub_10000BDAC(uint64_t a1)
{
  uint64_t v2 = sub_10000B250(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (unint64_t)sub_10000BEDC, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
  if (v2 && v2 == *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    syslog(4, "CIapPortAppleIDBus: Auth timer timeout completed on pAIDBPort:%hhx, portID:%02X downstream port\n", v2, *(_DWORD *)(v2 + 56));
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != (void)xmmword_100032050)
    {
      uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 24);
      if (*(unsigned char *)(v4 + 237))
      {
        +[IAPTDPostAlert PostAccessoryNotification:@"ACCESSORY_UNSUPPORTED" forMsg:0 withArg:0 forDefaultButton:@"DISMISS_STRING" withAlternateButton:0 forNotification:v4 + 216 withCallback:0.0 andTimeout:nullsub_16];
        uint64_t v3 = *(void *)(a1 + 40);
      }
    }
    uint64_t v5 = *(void *)(*(void *)(v3 + 8) + 24);
    sub_10000BEEC(v5, 1, 0, 0);
  }
}

BOOL sub_10000BEDC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_10000BEEC(uint64_t a1, int a2, int a3, _OWORD *a4)
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPortUpstream:%hhx, bIsRoot:%d, oldAuthState:%02X, newAuthState:%02X, pkAccAuthCaps:%hhx\n", "AuthStateUpdate", a1, *(unsigned __int8 *)(a1 + 238), *(_DWORD *)(a1 + 148), a2, a4);
  }
  if ((a2 - 1) >= 2) {
    sub_10001F680();
  }
  sub_10000F710(a1, a2, a4);
  if (a2 == 2 && a3) {
    sub_10000B250(a1, (unint64_t)sub_10000D08C, 0, (uint64_t)&unk_100028A28, 3);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT authStateDownstream:%02X, newAuthState:%02X\n", "AuthStateUpdate", *(_DWORD *)(a1 + 148), a2);
  }
}

void *sub_10000BFE4(uint64_t a1)
{
  *(void *)a1 = off_10002CF50;
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPort:%hhx, bIsRoot:%d, certCacheRefCount:%02X\n", "~CIapPortAppleIDBus", a1, *(unsigned __int8 *)(a1 + 238), byte_1000321A0);
  }
  sub_10000C118(a1);
  uint64_t v2 = *(NSObject **)(a1 + 112);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C220;
  block[3] = &unk_10002CA98;
  void block[4] = a1;
  dispatch_sync(v2, block);
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBPort:%hhx\n", "~CIapPortAppleIDBus", a1);
  }
  sub_1000091A4((void *)(a1 + 88));
  return sub_100007D60((void *)a1);
}

void sub_10000C0F8(_Unwind_Exception *a1)
{
  sub_1000091A4(v1 + 11);
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_10000C118(uint64_t a1)
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPort:%hhx, bIsRoot:%d, bAuthTimerRunning:%d, pAccNotification:%hhx, aidbAttachUID:%02X\n", "HandleIOAccPortDetach", a1, *(unsigned __int8 *)(a1 + 238), *(unsigned __int8 *)(a1 + 144), *(void *)(a1 + 216), *(unsigned __int8 *)(a1 + 224));
  }
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v2 = *(void *)(a1 + 216);
  *(unsigned char *)(a1 + 144) = 0;
  if (v2)
  {
    +[IAPTDPostAlert TearDownAccessoryNotification:a1 + 216];
    *(void *)(a1 + 216) = 0;
  }
  *(_DWORD *)(a1 + 148) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  ++*(unsigned char *)(a1 + 224);
  uint64_t v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v4 = *(const void **)(a1 + 248);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 248) = 0;
  }
  *(unsigned char *)(a1 + 256) = 0;
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBPort:%hhx, aidbAttachUID:%02X\n", "HandleIOAccPortDetach", a1, *(unsigned __int8 *)(a1 + 224));
  }
}

void sub_10000C220(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((sub_1000084F4(v1) & 1) == 0)
  {
    while (1)
    {
      uint64_t v29 = *(void *)(v1 + 104);
      if (!v29) {
        break;
      }
      long long v30 = *(uint64_t **)(v1 + 96);
      uint64_t v31 = v30[2];
      if (v31)
      {
        (*(void (**)(uint64_t))(*(void *)v31 + 8))(v30[2]);
        long long v30 = *(uint64_t **)(v1 + 96);
        uint64_t v29 = *(void *)(v1 + 104);
      }
      uint64_t v32 = *v30;
      *(void *)(v32 + 8) = v30[1];
      *(void *)v30[1] = v32;
      *(void *)(v1 + 104) = v29 - 1;
      operator delete(v30);
    }
  }
  dispatch_source_cancel(*(dispatch_source_t *)(v1 + 136));
  dispatch_release(*(dispatch_object_t *)(v1 + 136));
  *(void *)(v1 + 136) = 0;
  io_object_t v2 = *(_DWORD *)(v1 + 120);
  if (v2 + 1 >= 2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(v1 + 120) = 0;
  }
  if (*(void *)(v1 + 72))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, *(CFRunLoopSourceRef *)(v1 + 72), kCFRunLoopCommonModes);
    *(void *)(v1 + 72) = 0;
  }
  io_object_t v4 = *(_DWORD *)(v1 + 80);
  if (v4)
  {
    IOObjectRelease(v4);
    *(_DWORD *)(v1 + 80) = 0;
  }
  io_object_t v5 = *(_DWORD *)(v1 + 60);
  if (v5)
  {
    IOObjectRelease(v5);
    *(_DWORD *)(v1 + 60) = 0;
  }
  io_object_t v6 = *(_DWORD *)(v1 + 64);
  if (v6)
  {
    IOObjectRelease(v6);
    *(_DWORD *)(v1 + 64) = 0;
  }
  io_object_t v7 = *(_DWORD *)(v1 + 68);
  if (v7)
  {
    IOObjectRelease(v7);
    *(_DWORD *)(v1 + 68) = 0;
  }
  io_object_t v8 = *(_DWORD *)(v1 + 124);
  if (v8)
  {
    IOObjectRelease(v8);
    *(_DWORD *)(v1 + 124) = 0;
  }
  uint64_t v9 = *(void **)(v1 + 128);
  if (v9)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = objc_msgSend(v9, "allKeys", 0);
    id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          IOObjectRelease((io_object_t)objc_msgSend(objc_msgSend(*(id *)(v1 + 128), "objectForKey:", *(void *)(*((void *)&v33 + 1) + 8 * i)), "unsignedIntValue"));
        }
        id v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    *(void *)(v1 + 128) = 0;
  }
  dispatch_sync(*(dispatch_queue_t *)(v1 + 264), &stru_10002D050);
  dispatch_release(*(dispatch_object_t *)(v1 + 264));
  if (*(_DWORD *)(v1 + 12))
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    id v16 = +[IAPTransportServer sharedIAPTransportServer];
    xpc_dictionary_set_uint64(v15, "portID", v1);
    xpc_dictionary_set_string(v15, "requestType", "transportLeft");
    if (sub_100016474() && *(unsigned char *)(v1 + 8)) {
      objc_msgSend(objc_msgSend(v16, "iap2d_connection"), "sendMessage:", v15);
    }
    if (sub_1000163EC() && !*(unsigned char *)(v1 + 8)) {
      objc_msgSend(objc_msgSend(v16, "iapd_connection"), "sendMessage:", v15);
    }
    xpc_release(v15);
    IOObjectRelease(*(_DWORD *)(v1 + 12));
    *(_DWORD *)(v1 + 12) = 0;
  }
  if (*(unsigned char *)(v1 + 238))
  {
    uint64_t v17 = *(void *)(v1 + 48);
    if (*(void *)(v17 + 24))
    {
      uint64_t v18 = CFRunLoopGetMain();
      CFRunLoopRemoveSource(v18, *(CFRunLoopSourceRef *)(*(void *)(v1 + 48) + 24), kCFRunLoopCommonModes);
      uint64_t v17 = *(void *)(v1 + 48);
      *(void *)(v17 + 24) = 0;
    }
    if (*(void *)(v17 + 40))
    {
      char v19 = CFRunLoopGetMain();
      CFRunLoopRemoveSource(v19, *(CFRunLoopSourceRef *)(*(void *)(v1 + 48) + 40), kCFRunLoopCommonModes);
      uint64_t v17 = *(void *)(v1 + 48);
      *(void *)(v17 + 40) = 0;
    }
    IOObjectRelease(*(_DWORD *)(v17 + 48));
    uint64_t v20 = *(void *)(v1 + 48);
    *(_DWORD *)(v20 + 48) = 0;
    IOObjectRelease(*(_DWORD *)(v20 + 52));
    uint64_t v21 = *(void *)(v1 + 48);
    *(_DWORD *)(v21 + 52) = 0;
    if (*(void *)(v21 + 64))
    {
      uint64_t v22 = CFRunLoopGetMain();
      CFRunLoopRemoveSource(v22, *(CFRunLoopSourceRef *)(*(void *)(v1 + 48) + 64), kCFRunLoopCommonModes);
      uint64_t v21 = *(void *)(v1 + 48);
      *(void *)(v21 + 64) = 0;
    }
    char v23 = *(NSObject **)(v21 + 56);
    if (v23)
    {
      dispatch_release(v23);
      uint64_t v21 = *(void *)(v1 + 48);
      *(void *)(v21 + 56) = 0;
    }
    IOObjectRelease(*(_DWORD *)(v21 + 72));
    uint64_t v24 = *(void *)(v1 + 48);
    *(_DWORD *)(v24 + 72) = 0;
    IOObjectRelease(*(_DWORD *)(v24 + 76));
    uint64_t v25 = *(void *)(v1 + 48);
    *(_DWORD *)(v25 + 76) = 0;
    if (*(void *)(v25 + 80))
    {
      uint64_t v26 = CFRunLoopGetMain();
      CFRunLoopRemoveSource(v26, *(CFRunLoopSourceRef *)(*(void *)(v1 + 48) + 80), kCFRunLoopCommonModes);
      uint64_t v25 = *(void *)(v1 + 48);
      *(void *)(v25 + 80) = 0;
    }
    IOObjectRelease(*(_DWORD *)(v25 + 88));
    uint64_t v27 = *(void *)(v1 + 48);
    *(_DWORD *)(v27 + 88) = 0;
    IOObjectRelease(*(_DWORD *)(v27 + 92));
    uint64_t v28 = *(void *)(v1 + 48);
    *(_DWORD *)(v28 + 92) = 0;
    IONotificationPortDestroy(*(IONotificationPortRef *)(v28 + 32));
    *(void *)(*(void *)(v1 + 48) + 32) = 0;
    if (!--byte_1000321A0)
    {
      if (qword_100032190)
      {
        dispatch_release((dispatch_object_t)qword_100032190);
        qword_100032190 = 0;
      }

      qword_100032198 = 0;
    }
  }
}

void sub_10000C664(uint64_t a1)
{
  sub_10000BFE4(a1);
  operator delete();
}

void sub_10000C6AC()
{
}

void sub_10000C6D0(uint64_t a1, int a2, uint64_t a3)
{
  kern_return_t v11;
  BOOL v12;
  int v13;
  xpc_object_t v15;
  BOOL v16;
  BOOL v17;
  io_connect_t connect;

  connect = 0;
  if (byte_100031F58) {
    syslog(4, "%s ENTR this:%hhx, bIsRoot:%d, authStateDownstream:%02X\n", "HandleIOAccMgrEvent", a1, *(unsigned __int8 *)(a1 + 238), *(_DWORD *)(a1 + 148));
  }
  if (*(_DWORD *)(a1 + 148)) {
    goto LABEL_17;
  }
  switch(a2)
  {
    case -469794724:
      CFStringRef v8 = @"ACCESSORY_UNSUPPORTED";
LABEL_12:
      +[IAPTDPostAlert PostAccessoryNotification:v8 forMsg:0 withArg:0 forDefaultButton:@"OKAY_STRING" withAlternateButton:0 forNotification:a1 + 216 withCallback:0.0 andTimeout:nullsub_16];
LABEL_16:
      syslog(3, "%s setting iap9PinAuthStateFail state\n", "HandleIOAccMgrEvent");
      sub_10000BEEC(a1, 1, 0, 0);
      break;
    case -469794722:
      if (![(id)qword_100032188 bOSInternalBuild]) {
        break;
      }
      CFStringRef v8 = @"This connector orientation is wrong and must be inverted";
      goto LABEL_12;
    case -469794723:
      unsigned int v6 = [(id)qword_100032188 iDeviceClass] - 1;
      io_object_t v7 = v6 >= 3 ? &stru_10002E240 : off_10002D360[v6];
      CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"ACCESSORY_UNRELIABLE%@", v7);
      if (v9)
      {
        CFStringRef v10 = v9;
        +[IAPTDPostAlert PostAccessoryNotification:v9 forMsg:0 withArg:0 forDefaultButton:@"DISMISS_STRING" withAlternateButton:0 forNotification:a1 + 216 withCallback:0.0 andTimeout:nullsub_16];
        CFRelease(v10);
        goto LABEL_16;
      }
      break;
  }
LABEL_17:
  if (*(unsigned __int8 *)(a3 + 8) != *(unsigned __int8 *)(a1 + 234))
  {
    id v11 = IOServiceOpen(*(_DWORD *)(a1 + 60), mach_task_self_, 0, &connect);
    if (v11) {
      id v12 = 1;
    }
    else {
      id v12 = connect == 0;
    }
    if (v12)
    {
      syslog(3, "%s IOServiceOpen fail status:%02X, ioConn:%04X\n", "HandleIOAccMgrEvent", v11, connect);
    }
    else
    {
      uint64_t v13 = IOAccessoryManagerSetBatteryPackMode();
      if (v13)
      {
        if (v13 == -536870183) {
          syslog(6, "%s IOAccessoryManagerSetBatteryPackMode not attached. status %02X\n");
        }
        else {
          syslog(3, "%s IOAccessoryManagerSetBatteryPackMode fail status %02X\n");
        }
      }
      IOServiceClose(connect);
    }
  }
  if (*(void *)a3 != *(void *)(a1 + 226)
    || *(unsigned __int16 *)(a3 + 8) != (unint64_t)*(unsigned __int16 *)(a1 + 234))
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    id v16 = sub_1000163EC();
    uint64_t v17 = sub_100016474();
    xpc_dictionary_set_string(v15, "requestType", "IAPDigitalIDState");
    xpc_dictionary_set_data(v15, "IAPDigitalIDData", (const void *)(a1 + 226), 0xAuLL);
    if (v16 && +[IAPTransportServer supportsIAPD]) {
      objc_msgSend(objc_msgSend((id)qword_100032188, "iapd_connection"), "sendMessage:", v15);
    }
    if (v17) {
      objc_msgSend(objc_msgSend((id)qword_100032188, "iap2d_connection"), "sendMessage:", v15);
    }
    xpc_release(v15);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT this:%hhx\n", "HandleIOAccMgrEvent", a1);
  }
}

void sub_10000CA34(unsigned char *a1, char *a2)
{
  if (byte_100031F58)
  {
    syslog(4, "%s ENTR this:%hhx, bIsRoot:%d\n", "HandleIDBusStateUpdate", a1, a1[238]);
    BOOL v4 = byte_100031F58 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  char v5 = *a2;
  char v6 = (*a2 >> 3) & 3;
  unsigned int v7 = a2[1];
  unsigned int v8 = a2[2];
  BOOL v9 = (*a2 & 4) != 0;
  a1[226] = (*a2 & 0x20) != 0;
  a1[227] = v6;
  a1[228] = v9;
  a1[229] = v5 & 3;
  a1[230] = v7 >> 4;
  a1[231] = (v7 & 2) != 0;
  a1[232] = v7 & 1;
  a1[233] = v8 >> 7;
  a1[234] = (v8 & 0x40) != 0;
  a1[235] = (v8 & 0x10) != 0;
  if (!v4) {
    syslog(4, "%s EXIT this:%hhx\n", "HandleIDBusStateUpdate", a1);
  }
}

void *sub_10000CB20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = operator new(0x18uLL);
  result[2] = *(void *)(a1 + 40);
  BOOL v4 = *(void **)(v2 + 96);
  uint64_t v5 = *(void *)(v2 + 104);
  *uint64_t result = v2 + 88;
  result[1] = v4;
  *BOOL v4 = result;
  *(void *)(v2 + 96) = result;
  *(void *)(v2 + 104) = v5 + 1;
  return result;
}

void *sub_10000CB74(uint64_t a1, void *a2)
{
  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 != (void *)a1)
  {
    do
    {
      char v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          char v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            char v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        sub_100009234((uint64_t)v10, v10, a1, v2, v6);
        if (!v8) {
          char v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
  }
  return sub_1000091A4(v10);
}

void sub_10000CC30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000091A4((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CC44(uint64_t a1)
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 112);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CF0C;
  v4[3] = &unk_10002CDC0;
  void v4[4] = &v5;
  void v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL sub_10000CCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (a2)
  {
    uint64_t v2 = *(NSObject **)(a1 + 112);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CDB4;
    block[3] = &unk_10002D098;
    void block[5] = a1;
    void block[6] = a2;
    void block[4] = &v6;
    dispatch_sync(v2, block);
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *sub_10000CDB4(void *result)
{
  uint64_t v1 = result[5];
  uint64_t v2 = v1 + 88;
  uint64_t v3 = *(void *)(v1 + 96);
  if (v3 != v1 + 88)
  {
    BOOL v4 = result;
    uint64_t v5 = result + 6;
    do
    {
      uint64_t v6 = *(void *)(v3 + 16);
      if (v6 == *v5)
      {
        sub_10000CB74(v2, v5);
        uint64_t result = (void *)*v5;
        if (*v5) {
          uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
        }
        *(unsigned char *)(*(void *)(v4[4] + 8) + 24) = 1;
      }
      else
      {
        uint64_t result = (void *)sub_10000CC44(v6);
        if (result)
        {
          uint64_t result = (void *)sub_10000CCF0(*(void *)(v3 + 16), v4[6]);
          *(unsigned char *)(*(void *)(v4[4] + 8) + 24) = (_BYTE)result;
        }
      }
      if (*(unsigned char *)(*(void *)(v4[4] + 8) + 24)) {
        break;
      }
      uint64_t v3 = *(void *)(v3 + 8);
    }
    while (v3 != v2);
  }
  return result;
}

void *sub_10000CE94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)(v1 + 88);
  for (uint64_t i = *(void **)(v1 + 96); i != v2; uint64_t i = (void *)i[1])
  {
    uint64_t v4 = i[2];
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  return sub_1000091A4(v2);
}

uint64_t sub_10000CF0C(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 104);
  return result;
}

uint64_t sub_10000CF20(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  uint64_t v2 = v1 + 88;
  uint64_t v3 = *(void *)(v1 + 96);
  if (v3 != v1 + 88)
  {
    uint64_t v4 = result;
    char v5 = *(unsigned char *)(result + 80);
    while (1)
    {
      uint64_t v6 = *(uint64_t (**)(void *, void))(v4 + 56);
      uint64_t v7 = *(void *)(v4 + 64);
      uint64_t v8 = (void *)(*(void *)(v3 + 16) + (v7 >> 1));
      if (v7) {
        uint64_t v6 = *(uint64_t (**)(void *, void))(*v8 + v6);
      }
      uint64_t result = v6(v8, *(void *)(v4 + 72));
      *(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = result;
      if (*(unsigned char *)(*(void *)(*(void *)(v4 + 32) + 8) + 24))
      {
        uint64_t result = *(void *)(v3 + 16);
      }
      else
      {
        if ((v5 & 2) != 0) {
          goto LABEL_11;
        }
        uint64_t result = sub_10000CC44(*(void *)(v3 + 16));
        if (!result) {
          goto LABEL_11;
        }
        uint64_t result = sub_10000B250(*(void *)(v3 + 16), *(void *)(v4 + 56), *(void *)(v4 + 64), *(void *)(v4 + 72), *(unsigned __int8 *)(v4 + 80));
      }
      *(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = result;
LABEL_11:
      if (!*(void *)(*(void *)(*(void *)(v4 + 40) + 8) + 24))
      {
        uint64_t v3 = *(void *)(v3 + 8);
        if (v3 != v2) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

BOOL sub_10000D020(uint64_t a1, _DWORD *a2)
{
  return *(_DWORD *)(a1 + 56) == *a2;
}

BOOL sub_10000D034(uint64_t a1, _DWORD *a2)
{
  return *(_DWORD *)(a1 + 60) == *a2;
}

BOOL sub_10000D048(uint64_t a1, _DWORD *a2)
{
  return *(_DWORD *)(a1 + 148) == *a2;
}

BOOL sub_10000D05C(uint64_t a1, unsigned int *a2)
{
  return *(void *)(a1 + 192) == *a2;
}

BOOL sub_10000D070(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 200) == *a2;
}

uint64_t sub_10000D084(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 236);
}

uint64_t sub_10000D08C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 240) && !*(_DWORD *)(a1 + 120))
  {
    if (byte_100031F58) {
      syslog(4, "%s About to enable acc. power for CIapPortAppleIDBus instance:%hhx\n", "EnableAccPowerForTransport", a1);
    }
    sub_100016268(*(_DWORD *)(a1 + 60), 3);
    *(unsigned char *)(a1 + 240) = 1;
  }
  return 0;
}

uint64_t sub_10000D104(uint64_t a1, void *a2)
{
  int v4 = sub_100007C8C(a1);
  IOAccessoryPortGetServiceWithPort();
  int ManagerService = IOAccessoryPortGetManagerService();
  int v12 = ManagerService;
  do
  {
    int v6 = ManagerService;
    int ManagerService = IOAccessoryManagerGetUpstreamService();
  }
  while (ManagerService);
  int v7 = sub_100007C98(a1);
  if (byte_100031F58) {
    syslog(4, "%s ENTR pIapPort:%hhx, ioAccPortID:%02X, ioAccPortMgrID:%02X, ioSvcMgrRoot:%04X\n", "GetAuthStateByPortInstance", a1, v4, v7, v6);
  }
  if ((void)xmmword_100032050)
  {
    if (*(_DWORD *)(xmmword_100032050 + 60) == v6) {
      uint64_t v8 = xmmword_100032050;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v8) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ((void)xmmword_1000320B8)
  {
    if (*(_DWORD *)(xmmword_1000320B8 + 60) == v6) {
      uint64_t v8 = xmmword_1000320B8;
    }
    else {
      uint64_t v8 = 0;
    }
  }
LABEL_16:
  if (byte_100031F58)
  {
    if (v8 == (void)xmmword_100032050) {
      char v9 = "E75";
    }
    else {
      char v9 = "CON";
    }
    if (!v8) {
      char v9 = "NULL";
    }
    syslog(4, "%s ioSvcMgrRoot:%04X matches pAIDBRoot:%hhx (%s)\n", "GetAuthStateByPortInstance", v6, v8, v9);
  }
  if (v8)
  {
    if (sub_10000B250(v8, (unint64_t)sub_10000D034, 0, (uint64_t)&v12, 0))
    {
      int DigitalID = IOAccessoryManagerGetDigitalID();
      if (byte_100031F58) {
        syslog(4, "%s IOAccMgrGetDigitalID kernStatus:%02X, bAIDBulkData:%d, portAuthState:%02X, pkPortAuthCaps:%hhx\n", "GetAuthStateByPortInstance", DigitalID, 0, 0, 0);
      }
    }
  }
  *a2 = 0;
  if (byte_100031F58) {
    syslog(4, "%s EXIT pIapPort:%hhx, pAIDBRoot:%hhx, portAuthState:%02X, pkPortAuthCaps:%hhx\n", "GetAuthStateByPortInstance", a1, v8, 0, 0);
  }
  return 0;
}

id sub_10000D310()
{
  kern_return_t v5;
  CFMutableDictionaryRef v6;
  io_object_t v7;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;

  CFDictionaryRef v0 = IOServiceMatching("IOMikeyBusDevice");
  if (!v0
    || ((existing = 0, !IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
      ? (BOOL v1 = existing == 0)
      : (BOOL v1 = 1),
        v1))
  {
    id v2 = 0;
  }
  else
  {
    io_object_t v3 = IOIteratorNext(existing);
    if (v3)
    {
      io_registry_entry_t v4 = v3;
      do
      {
        properties = 0;
        char v5 = IORegistryEntryCreateCFProperties(v4, &properties, 0, 0);
        id v2 = 0;
        int v6 = properties;
        if (!v5 && properties)
        {
          if (byte_100031F58)
          {
            syslog(4, "%s IOMikeyBusDevice properties: %@\n", "GetAccMikeyBusModelNumber", properties);
            int v6 = properties;
          }
          id v2 = objc_msgSend(-[__CFDictionary objectForKey:](v6, "objectForKey:", @"ModelNumber"), "copy");
          int v6 = properties;
        }
        if (v6) {
          CFRelease(v6);
        }
        IOObjectRelease(v4);
        int v7 = IOIteratorNext(existing);
        if (!v7) {
          break;
        }
        io_registry_entry_t v4 = v7;
      }
      while (!v2);
    }
    else
    {
      id v2 = 0;
    }
    IOObjectRelease(existing);
  }
  return v2;
}

uint64_t sub_10000D44C(uint64_t a1, int a2)
{
  int v14 = a2;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v3 = sub_10000B250(a1, (unint64_t)sub_10000B3FC, 0, (uint64_t)&v14, 0);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = a1;
  }
  if (v4)
  {
    char v5 = *(NSObject **)(v4 + 264);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D570;
    block[3] = &unk_10002D128;
    int v9 = v14;
    void block[4] = &v10;
    void block[5] = v4;
    dispatch_sync(v5, block);
  }
  else
  {
    syslog(4, "%s pAIDBPort == NULL\n", "LogAIDBAccessoryAttach");
  }
  uint64_t v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_10000D558(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 56), 8);
  _Unwind_Resume(a1);
}

void sub_10000D570(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v1 + 256) && *(_DWORD *)(v1 + 148) == 2 && *(void *)(v1 + 248))
  {
    uint64_t v3 = 0;
    int v4 = 1;
    do
    {
      int v5 = v4;
      uint64_t v6 = off_10002D0E0[4 * v3];
      if (![*(id *)(*(void *)(a1 + 40) + 248) caseInsensitiveCompare:v6])
      {
        CFStringRef v7 = off_10002D0E0[4 * v3 + 1];
        id v8 = sub_10000D310();
        if (!v8)
        {
          syslog(4, "%s accMikeyBusModelNumber == NULL: %@\n", "LogAIDBAccessoryAttach_block_invoke", 0);
LABEL_11:
          int v10 = 0;
LABEL_13:
          if (byte_100031F58) {
            syslog(4, "%s calling ADClientAddValueForScalarKey with string: %@\n", "LogAIDBAccessoryAttach_block_invoke", v7);
          }
          ADClientAddValueForScalarKey();
          *(unsigned char *)(*(void *)(a1 + 40) + 256) = 1;
          if (((v5 | v10) & 1) == 0)
          {
            CFTypeRef v11 = sub_10001F210(*(_DWORD *)(a1 + 48));
            if (v11)
            {
              uint64_t v12 = v11;
              sub_10000D70C(*(void *)(*(void *)(a1 + 40) + 248), (uint64_t)v11, (uint64_t)off_10002D0E0[4 * v3 + 2]);
              CFRelease(v12);
            }
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_19;
        }
        int v9 = v8;
        if (![v8 caseInsensitiveCompare:v6]) {
          goto LABEL_11;
        }
        if (![v9 caseInsensitiveCompare:@"A1748"])
        {
          int v10 = 1;
          CFStringRef v7 = @"com.apple.iap.b225.attach";
          goto LABEL_13;
        }
        syslog(4, "%s Accessory attach was not logged due to a model number mismatch\n", "LogAIDBAccessoryAttach_block_invoke");
      }
LABEL_19:
      int v4 = 0;
      uint64_t v3 = 1;
    }
    while ((v5 & 1) != 0);
  }
}

BOOL sub_10000D70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR aidbAccModelNumberStr: %@ aidbAccSerialNumberStr: %@, uniqueAIDBAccessoryLogStr: %@\n", "AddAttachedAIDBAccessoryToCache", a1, a2, a3);
  }
  if (a1 && a2 && a3)
  {
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000103FC;
    block[3] = &unk_10002D1E8;
    void block[6] = a2;
    void block[7] = a3;
    void block[4] = &v9;
    void block[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_1000321A8, block);
    if (byte_100031F58) {
      syslog(4, "%s EXIT bEntryAdded:%d\n", "AddAttachedAIDBAccessoryToCache", *((unsigned __int8 *)v10 + 24));
    }
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    syslog(4, "%s bad params\n", "AddAttachedAIDBAccessoryToCache");
    return 0;
  }
  return v6;
}

void sub_10000D858(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000D870(uint64_t a1, io_registry_entry_t a2)
{
  kern_return_t v51;
  int v52;
  CFDictionaryRef v53;
  int v54;
  kern_return_t v55;
  uint64_t v56;
  int v57;
  CFStringRef v58;
  const char *v59;
  CFStringRef v60;
  CFStringRef v61;
  int v62;
  const char *v63;
  unsigned int v64;
  int v65;
  BOOL v66;
  unsigned int v67;
  int v68;
  BOOL v69;
  int v70;
  io_service_t v71;
  CFStringRef v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  CFIndex v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  const UInt8 *v80;
  CFDictionaryRef v81;
  CFNumberRef v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  CFAllocatorRef v87;
  CFStringRef v88;
  uint64_t v89;
  io_connect_t connect;
  CFDataRef v91;
  unint64_t v92;
  int v93;
  __int16 v94;
  int v95;
  __int16 valuePtr;
  __int16 v97;
  uint64_t v98;
  CFDataRef v99;
  void *v100[4];
  io_connect_t v101[2];
  unint64_t v102;
  uint64_t v103;
  void *v104;
  void *values[2];
  void *keys[2];

  v98 = 0;
  v99 = 0;
  v97 = 0;
  int valuePtr = 0;
  v95 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 224);
  v89 = byte_100031CC0;
  v94 = 0;
  v93 = 30;
  p_name = &stru_100030FF8.name;
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      BOOL v6 = "E75";
    }
    else {
      BOOL v6 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), authCPService:%02X, aidbAttachUID:%02X\n", "AuthProcessStart", a1, v6, a2, v4);
  }
  v85 = v4;
  v86 = a1;
  char v7 = 0;
  CFStringRef v8 = 0;
  int v9 = 1;
  v87 = kCFAllocatorDefault;
  v84 = (void *)kAuthCertBufferKey;
  v83 = (void *)kAuthVersionKey;
  v79 = kAuthNonceBufferKey;
  v78 = kAuthResponseBufferKey;
  do
  {
    v99 = 0;
    if (*((unsigned char *)p_name + 3928)) {
      syslog(4, "%s Starting auth loop authTryCurrent:%02X of authTryMaximum:%02X\n", "AuthProcessStart", v9, v89);
    }
    io_object_t UpstreamService = IOAccessoryManagerGetUpstreamService();
    BOOL v11 = UpstreamService == 0;
    if (UpstreamService)
    {
      int v12 = UpstreamService;
      IOObjectRelease(UpstreamService);
    }
    else
    {
      syslog(4, "%s IOAccMgrGetUpstreamService ioAccMgrSvcUpstream = IO_OBJECT_NULL\n", "AuthProcessStart");
      int v12 = 0x7FFFFFFF;
    }
    int v13 = sub_10000AFE4(a2);
    if (v13)
    {
      sub_10000E5FC(v13, (unsigned char *)&v94 + 1, &v94, &v93);
      int v14 = 0;
      int v15 = HIBYTE(v94);
      v9 += HIBYTE(v94) ^ 1;
      char v7 = 1;
      if (HIBYTE(v94)) {
        goto LABEL_111;
      }
      continue;
    }
    int v16 = sub_10001F040(a2, (char *)&v97 + 1, &v97, (char *)&valuePtr + 1, &valuePtr, &v95);
    if (v16)
    {
      syslog(4, "%s cpGetDeviceInfo returned ioretStatus:%02X\n", "AuthProcessStart", v16);
      int v14 = 0;
      BOOL v11 = 1;
      goto LABEL_94;
    }
    if ((HIBYTE(valuePtr) & 0xFE) != 2 || (_BYTE)valuePtr)
    {
      syslog(4, "%s cpGetDeviceInfo returned  unsupported authVerMajor:%02X, authVerMinor:%02X\n", "AuthProcessStart", HIBYTE(valuePtr), valuePtr);
      int v14 = 0;
      goto LABEL_94;
    }
    CFStringRef v17 = (const __CFString *)sub_10001F210(a2);
    v88 = v17;
    if (v17)
    {
      int v18 = sub_10000E8D4(v17, (uint64_t)&v99);
      if (v18 && v99) {
        int v18 = 1;
      }
      else {
        syslog(6, "%s No dictionary cert serial number match found\n", "AuthProcessStart");
      }
    }
    else
    {
      int v19 = *((unsigned __int8 *)p_name + 3928);
      if (!*((unsigned char *)p_name + 3928))
      {
        int v18 = 0;
        goto LABEL_28;
      }
      syslog(4, "%s cpCopyCertificateSerialNumber returned NULL !\n", "AuthProcessStart");
      int v18 = 0;
    }
    int v19 = *((unsigned __int8 *)p_name + 3928);
LABEL_28:
    CFDataRef v20 = v99;
    if (!v99 || byte_100031F5A)
    {
      if (v19) {
        syslog(4, "%s Read accessory auth cert data, gbAuthCertNotCached:%d\n", "AuthProcessStart", byte_100031F5A);
      }
      CFDataRef v20 = (const __CFData *)sub_10001F1F4(a2);
      v99 = v20;
      int v19 = *((unsigned __int8 *)p_name + 3928);
    }
    if (v19)
    {
      if (v20) {
        CFIndex Length = CFDataGetLength(v20);
      }
      else {
        CFIndex Length = 0;
      }
      syslog(4, "%s pCFCertData:%04X, certDataLen:%04lX\n", "AuthProcessStart", (unsigned __int16)v20, Length);
      CFDataRef v20 = v99;
    }
    if (!v20)
    {
      syslog(4, "%s cpCopyCertificate returned pCFCertData=NULL, auth service fail\n", "AuthProcessStart");
      int v14 = 0;
      BOOL v11 = 1;
      CFStringRef v8 = v88;
      goto LABEL_92;
    }
    CFAllocatorRef v22 = v87;
    CFNumberRef v23 = CFNumberCreate(v87, kCFNumberCharType, (char *)&valuePtr + 1);
    keys[0] = v84;
    keys[1] = v83;
    values[0] = v99;
    values[1] = v23;
    v82 = v23;
    v81 = CFDictionaryCreate(v22, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v24 = VerifyCertAuthorityDictionary();
    v77 = v18;
    if (!v24)
    {
      syslog(3, "%s Auth CP cert authority verify fail, auth failed !\n", "AuthProcessStart");
      int v14 = 0;
LABEL_77:
      CFStringRef v8 = v88;
      goto LABEL_78;
    }
    BytePtr = CFDataGetBytePtr(v99);
    CFIndex v26 = CFDataGetLength(v99);
    v80 = BytePtr;
    if (v88)
    {
      *(void *)v101 = 0xAAAAAAAAAAAAAAAALL;
      v102 = 0xAAAAAAAAAAAAAAAALL;
      v100[0] = v101;
      v92 = 16;
      uint64_t v27 = IapAuthCertSerial();
      if (v27 && v100[0] && v92 && v92 <= 0x10)
      {
        v76 = v26;
        v75 = (uint64_t)&v75;
        __chkstk_darwin(v27);
        uint64_t v29 = (char *)&v75 - ((v28 + 19) & 0xFFFFFFFFFFFFFFF0);
        memset(v29, 170, v30);
        if (v92)
        {
          unint64_t v31 = 0;
          uint64_t v32 = (unsigned __int8 *)v100[0];
          long long v33 = v29;
          do
          {
            sprintf(v33, "%02X", *v32);
            ++v31;
            v33 += 2;
            uint64_t v32 = (unsigned __int8 *)++v100[0];
          }
          while (v31 < v92);
        }
        CFStringRef v34 = CFStringCreateWithCString(0, v29, 0x8000100u);
        if (v34)
        {
          CFStringRef v35 = v34;
          CFStringRef v36 = v88;
          CFComparisonResult v37 = CFStringCompare(v88, v34, 1uLL);
          BOOL v38 = v37 == kCFCompareEqualTo;
          if (v37)
          {
            CStringPtr = CFStringGetCStringPtr(v36, 0x8000100u);
            uint64_t v40 = CFStringGetCStringPtr(v35, 0x8000100u);
            syslog(3, "%s Cert serial number mismatch: pCFCertSerialNumFromCPService:[%s] != pCFSerNumFromCertData:[%s]\n", "AuthProcessStart", CStringPtr, v40);
          }
          CFRelease(v35);
        }
        else
        {
          BOOL v38 = 0;
        }
      }
      else
      {
        syslog(3, "%s IapAuthCertSerial failed bStatus:%d, pSerNumBin:%hhx, serNumBinLen:%02lX\n", "AuthProcessStart", v27, LODWORD(v100[0]), v92);
        BOOL v38 = 0;
      }
      LODWORD(v76) = v38;
    }
    else
    {
      LODWORD(v76) = 1;
    }
    uint64_t SecCertRef = GetSecCertRef();
    if (SecCertRef)
    {
      uint64_t v42 = (const void *)SecCertRef;
      int v43 = SecCertificateGetiAuthVersion();
      CFRelease(v42);
    }
    else
    {
      int v43 = 0;
    }
    int v44 = HIBYTE(valuePtr);
    if (v43 != HIBYTE(valuePtr)) {
      syslog(3, "%s Authentication version mismatch: authVerMajor:%02X != secAuthVerMajor:%02X\n", "AuthProcessStart", HIBYTE(valuePtr), v43);
    }
    int v45 = IapAuthVerifyCertSerialNumber();
    if ((v45 & 1) == 0) {
      syslog(3, "%s IapAuthVerifyCertSerialNumber failed bCertNotRevoked:%d\n", "AuthProcessStart", 0);
    }
    uint64_t v46 = AllocCapsFromAuthCert();
    int v14 = (_OWORD *)v46;
    if (byte_100031F58) {
      syslog(4, "%s pkAccAuthCaps:%hhx, authCapsLen:%02lX\n", "AuthProcessStart", v46, v98);
    }
    if (!v14)
    {
      syslog(3, "%s Accessory auth not supported pkAccAuthCaps:NULL\n", "AuthProcessStart");
      BOOL v47 = 0;
      BOOL v48 = 0;
LABEL_73:
      p_name = &stru_100030FF8.name;
      int v49 = v76;
      goto LABEL_74;
    }
    BOOL v47 = 0;
    BOOL v48 = 0;
    if (v43 != v44) {
      goto LABEL_73;
    }
    int v49 = v76;
    p_name = (char **)(&stru_100030FF8 + 8);
    if ((v45 & v76) != 0)
    {
      BOOL v47 = HIBYTE(valuePtr) == 2;
      BOOL v48 = HIBYTE(valuePtr) == 3;
    }
LABEL_74:
    if (!v47 && !v48)
    {
      syslog(3, "%s Auth failed: bAuthSerNumMatch:%d, bAuthCertCapsOK:%d, bCertNotRevoked:%d\n", "AuthProcessStart", v49, v14 != 0, v45);
      goto LABEL_77;
    }
    v91 = 0;
    v92 = 0;
    connect = 0;
    if (HIBYTE(valuePtr) != 2 && HIBYTE(valuePtr) != 3) {
      sub_10001F69C(HIBYTE(valuePtr));
    }
    CFStringRef v8 = v88;
    GetRandomDigest();
    v51 = IOServiceOpen(a2, mach_task_self_, 0, &connect);
    if (v51)
    {
      syslog(4, "%s Auth CP service open fail svc:%04X, kernStatus:%02X, auth service fail\n", "AuthProcessStart", a2, v51);
      BOOL v11 = 1;
    }
    else
    {
      uint64_t v52 = sub_10001F22C(connect, (CFDataRef)v92, &v91);
      if (v52 || !v91)
      {
        syslog(3, "%s cpCreateSignature failed ioretStatus:%02X, pOutSig:%hhx, auth service fail\n", "AuthProcessStart", v52, v91);
        BOOL v11 = 1;
      }
      else
      {
        *(void *)v101 = v84;
        v102 = v79;
        v103 = v78;
        v104 = v83;
        v100[0] = v99;
        v100[1] = (void *)v92;
        v100[2] = v91;
        v100[3] = v82;
        v53 = CFDictionaryCreate(v87, (const void **)v101, (const void **)v100, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        long long v54 = VerifyNonceSigned();
        HIBYTE(v94) = v54;
        if (v54) {
          syslog(4, "%s Authentication pkAccAuthCaps:%04X, authCapsLen:%02X, authVerMajor:%02X PASSED !\n", "AuthProcessStart", (unsigned __int16)v14, v98, HIBYTE(valuePtr));
        }
        CFRelease(v91);
        CFRelease(v53);
      }
      IOServiceClose(connect);
      p_name = (char **)(&stru_100030FF8 + 8);
    }
    if (v92) {
      CFRelease((CFTypeRef)v92);
    }
LABEL_78:
    CFRelease(v82);
    CFRelease(v81);
    if (v8 && !v11)
    {
      if (HIBYTE(v94))
      {
        CFDataRef v50 = v99;
        if (!v99)
        {
          BOOL v11 = 0;
          goto LABEL_94;
        }
        if (byte_100031F5A)
        {
          if (*((unsigned char *)p_name + 3928)) {
            syslog(4, "%s Auth cert not cached, gbAuthCertNotCached:%d\n", "AuthProcessStart", 1);
          }
          goto LABEL_91;
        }
        if ((v77 & 1) == 0) {
          goto LABEL_90;
        }
        if ((sub_10000EBEC(v8) & 1) == 0)
        {
          CFDataRef v50 = v99;
LABEL_90:
          sub_10000EA60(v8, (uint64_t)v50);
        }
      }
      else
      {
        sub_10000EDD4(v8);
      }
LABEL_91:
      BOOL v11 = 0;
    }
LABEL_92:
    if (v99) {
      CFRelease(v99);
    }
LABEL_94:
    int v15 = HIBYTE(v94);
    v9 += HIBYTE(v94) ^ 1;
    if (HIBYTE(v94)) {
      break;
    }
  }
  while (v89 >= v9);
  if (!v15)
  {
    syslog(3, "%s Auth loop exit at authTryCurrent:%02X of authTryMaximum:%02X, bAuthPassed:%d\n");
    goto LABEL_114;
  }
LABEL_111:
  if (*((unsigned char *)p_name + 3928)) {
    syslog(4, "%s Auth loop exit at authTryCurrent:%02X of authTryMaximum:%02X, bAuthPassed:%d\n");
  }
LABEL_114:
  v101[0] = 0;
  long long v55 = IOServiceOpen(a2, mach_task_self_, 0, v101);
  v56 = v86;
  if (!v55)
  {
    v57 = sub_10001F2F0(v101[0], HIBYTE(v94));
    if (v57) {
      syslog(4, "%s cpSetAuthStatus(%d) returned ioretStatus:%02X\n", "AuthProcessStart", HIBYTE(v94), v57);
    }
    v58 = v8;
    if (v93 > 29) {
      v59 = "UninitializedAuthError";
    }
    else {
      v59 = off_10002D268[v93];
    }
    v60 = CFStringCreateWithCString(v87, v59, 0x8000100u);
    if (v60)
    {
      v61 = v60;
      v62 = sub_10001F3E0(v101[0], v60);
      if (v62)
      {
        if (v93 > 29) {
          v63 = "UninitializedAuthError";
        }
        else {
          v63 = off_10002D268[v93];
        }
        syslog(4, "%s cpSetAuthErrorDescription(%s) returned ioretStatus:%02X\n", "AuthProcessStart", v63, v62);
      }
      CFRelease(v61);
    }
    if (v7)
    {
      if ((_BYTE)v94) {
        v64 = 2;
      }
      else {
        v64 = 1;
      }
      v65 = sub_10001F368(v101[0], v64);
      if (v65) {
        syslog(4, "%s cpSetFdrValidationStatus(%d) returned ioretStatus:%02X\n", "AuthProcessStart", v64, v65);
      }
      if (HIBYTE(v94)) {
        v66 = v94 == 0;
      }
      else {
        v66 = 1;
      }
      v67 = !v66;
      v68 = sub_10001F32C(v101[0], v67);
      if (v68)
      {
        if (HIBYTE(v94)) {
          v69 = v94 == 0;
        }
        else {
          v69 = 1;
        }
        v70 = !v69;
        syslog(4, "%s cpSetTrustStatus(%d) returned ioretStatus:%02X\n", "AuthProcessStart", v70, v68);
      }
    }
    IOServiceClose(v101[0]);
    CFStringRef v8 = v58;
  }
  v71 = a2;
  v72 = v8;
  v73 = sub_10000EF54(v56, v71, v12, HIBYTE(valuePtr), v14, (uint64_t)v8, HIBYTE(v94), v11, v85);
  if (v14) {
    free(v14);
  }
  v74 = HIBYTE(v94);
  if (HIBYTE(v94) || (void)xmmword_1000320B8 != v56)
  {
LABEL_154:
    if (v74) {
      goto LABEL_157;
    }
    goto LABEL_155;
  }
  if (*(unsigned __int8 *)(v73 + 225) == *(unsigned __int8 *)(v73 + 224))
  {
    v74 = 0;
    goto LABEL_154;
  }
  +[IAPTDPostAlert TearDownAccessoryNotification:v73 + 216];
  if (!HIBYTE(v94))
  {
LABEL_155:
    if (v72) {
      CFRelease(v72);
    }
  }
LABEL_157:
  if (*((unsigned char *)p_name + 3928)) {
    syslog(4, "%s EXIT bServiceFailed:%d, pkAccAuthCaps:%hhx, bAuthPassed:%d\n", "AuthProcessStart", v11, 0, HIBYTE(v94));
  }
}

void sub_10000E5FC(int a1, unsigned char *a2, unsigned char *a3, _DWORD *a4)
{
  if (!a1 || !a2 || !a3 || !a4) {
    return;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 30;
  uint64_t v16 = 0;
  CFStringRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  CFStringRef v8 = dispatch_semaphore_create(0);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __buf[0] = v9;
  __buf[1] = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010330;
  v15[3] = &unk_10002D1C0;
  v15[6] = &v20;
  v15[7] = &v16;
  v15[4] = v8;
  v15[5] = &v24;
  arc4random_buf(__buf, 0x20uLL);
  int v10 = +[NSData dataWithBytes:__buf length:32];
  id v11 = +[ACCHWComponentAuth sharedManager];
  if (a1 == 1)
  {
    [v11 authenticateBatteryWithChallenge:v10 completionHandler:v15];
LABEL_10:
    unsigned int v12 = 25;
    goto LABEL_12;
  }
  if (a1 != 2)
  {
    if (a1 != 3)
    {
      syslog(3, "%s: unknown module type: %x", "AuthProcessInternalModule", a1);
      goto LABEL_21;
    }
    [v11 authenticateTouchControllerWithChallenge:v10 completionHandler:v15];
    goto LABEL_10;
  }
  [v11 authenticateVeridianWithChallenge:v10 completionHandler:v15];
  unsigned int v12 = 40;
LABEL_12:
  dispatch_time_t v13 = dispatch_time(0, 1000000000 * v12);
  if (dispatch_semaphore_wait(v8, v13))
  {
    syslog(3, "%s: Component(%d) Auth not completed within %d secs. Timeout has occurred", "AuthProcessInternalModule", a1, v12);
    *((_DWORD *)v21 + 6) = 15;
  }
  if (!*((unsigned char *)v25 + 24))
  {
    int v14 = 3;
    goto LABEL_18;
  }
  if (byte_100031F58)
  {
    int v14 = 6;
LABEL_18:
    syslog(v14, "%s: authPassed:%d", "AuthProcessInternalModule", *((unsigned __int8 *)v25 + 24));
  }
  *a2 = *((unsigned char *)v25 + 24);
  *a3 = *((unsigned char *)v17 + 24);
  *a4 = *((_DWORD *)v21 + 6);
LABEL_21:
  if (v8) {
    dispatch_release(v8);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void sub_10000E8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10000E8D4(CFStringRef theString, uint64_t a2)
{
  if (byte_100031F58)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    syslog(4, "%s ENTR Serial number string:[%s], ppCFCertData:%hhx\n", "AuthCertDataFromHash", CStringPtr, a2);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_10000FC48;
  v12[4] = sub_10000FC58;
  v12[5] = theString;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FC64;
  block[3] = &unk_10002D170;
  void block[4] = v12;
  void block[5] = &v8;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)qword_100032190, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT bCertMatch:%d\n", "AuthCertDataFromHash", *((unsigned __int8 *)v9 + 24));
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v5;
}

void sub_10000EA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EA60(CFStringRef theString, uint64_t a2)
{
  if (byte_100031F58)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    syslog(4, "%s ENTR Serial number string:[%s], pkCertData:%hhx\n", "AuthCertAddHashDataEntry", CStringPtr, a2);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_10000FC48;
  v12[4] = sub_10000FC58;
  v12[5] = theString;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FD3C;
  block[3] = &unk_10002D170;
  void block[5] = &v8;
  void block[6] = a2;
  void block[4] = v12;
  dispatch_sync((dispatch_queue_t)qword_100032190, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT bEntryAdded:%d\n", "AuthCertAddHashDataEntry", *((unsigned __int8 *)v9 + 24));
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v5;
}

void sub_10000EBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EBEC(CFStringRef theString)
{
  if (byte_100031F58)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    syslog(4, "%s ENTR certHash:[%s]\n", "AuthCertIncHashDataUsage", CStringPtr);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3052000000;
  v18[3] = sub_10000FC48;
  v18[4] = sub_10000FC58;
  v18[5] = theString;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FFE8;
  block[3] = &unk_10002D198;
  void block[4] = v18;
  void block[5] = &v10;
  void block[6] = &v6;
  void block[7] = &v14;
  dispatch_sync((dispatch_queue_t)qword_100032190, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT certUsageOld:%02lX, certUsageNew:%02lX, bEntryInc:%d\n", "AuthCertIncHashDataUsage", v11[3], v7[3], *((unsigned __int8 *)v15 + 24));
  }
  uint64_t v3 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  return v3;
}

void sub_10000ED98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EDD4(CFStringRef theString)
{
  if (byte_100031F58)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    syslog(4, "%s ENTR certHash:[%s]\n", "AuthCertDelHashDataEntry", CStringPtr);
  }
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  uint64_t v10[3] = sub_10000FC48;
  v10[4] = sub_10000FC58;
  void v10[5] = theString;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FF48;
  block[3] = &unk_10002D008;
  void block[4] = v10;
  void block[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_100032190, block);
  if (byte_100031F58) {
    syslog(4, "%s EXIT bEntryDeleted:%d\n", "AuthCertDelHashDataEntry", *((unsigned __int8 *)v7 + 24));
  }
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v3;
}

void sub_10000EF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EF54(uint64_t a1, io_service_t a2, int a3, __int16 a4, _OWORD *a5, uint64_t a6, int a7, int a8, unsigned __int8 a9)
{
  kern_return_t v19;
  int v20;
  BOOL v21;
  BOOL v22;
  const void *v23;
  io_service_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  NSObject *v29;
  void v32[6];
  io_connect_t connect;
  int v34;
  io_service_t service;
  void block[6];

  CFStringRef v34 = a3;
  service = a2;
  if (byte_100031F58) {
    syslog(4, "%s ENTR authCPService:%04X, pkAccAuthCaps:%hhx, bAuthPassed:%d, bAuthSvcFail:%d, aidbAttachUID:%02X\n", "AuthProcessFinish", a2, a5, a7, a8, a9);
  }
  uint64_t v14 = xmmword_1000320B8;
  uint64_t v15 = sub_10000B250(a1, (unint64_t)sub_10000D034, 0, (uint64_t)&v34, 0);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = a1;
  }
  uint64_t v17 = sub_10000B250(a1, (unint64_t)sub_10000B3FC, 0, (uint64_t)&service, 0);
  if (!v17)
  {
    uint64_t v18 = sub_10000B250(v16, (unint64_t)sub_10000B3FC, 0, (uint64_t)&unk_100028A28, 3);
    if (v18) {
      uint64_t v17 = v18;
    }
    else {
      uint64_t v17 = v16;
    }
  }
  connect = -1431655766;
  uint64_t v19 = IOServiceOpen(service, mach_task_self_, 0, &connect);
  if (v19)
  {
    syslog(4, "%s: IOServiceOpen() failed (ret=0x%x)\n", "AuthProcessFinish", v19);
  }
  else
  {
    uint64_t v20 = sub_10001F3A4(connect, 1u);
    if (v20) {
      syslog(4, "%s: cpSetAuthFullPass() failed (ret=0x%x)\n", "AuthProcessFinish", v20);
    }
    IOServiceClose(connect);
  }
  sub_10000B094(a1, service);
  uint64_t v21 = v14 == a1;
  uint64_t v22 = v14 == a1;
  if (v21 && *(unsigned __int8 *)(a1 + 224) != a9 || a8 && !*(unsigned char *)(v16 + 144))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v16 + 136), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(unsigned char *)(v16 + 144) = 0;
    *(_DWORD *)(v16 + 148) = 0;
    *(_OWORD *)(v16 + 160) = 0u;
    *(_OWORD *)(v16 + 176) = 0u;
    syslog(4, "%s Auth cancelled bIsRootCON:%d, aidbAttachUID:%02X, m_aidbAttachUID:%02X, bAuthSvcFail:%d, bAuthTimerRunning:%d\n", "AuthProcessFinish", v22, a9, *(unsigned __int8 *)(a1 + 224), a8, 0);
LABEL_46:
    uint64_t v28 = 0;
    goto LABEL_47;
  }
  if ((a7 & 1) == 0 && byte_100031F59)
  {
    if (byte_100031F58) {
      syslog(4, "%s Auth failed, gbAuthAlwaysPasses auth pass override !\n", "AuthProcessFinish");
    }
    goto LABEL_26;
  }
  if (!a7)
  {
    syslog(3, "%s Auth fail; lock out primary port ID:%02X\n", "AuthProcessFinish", *(_DWORD *)(v17 + 56));
    if ((a4 & 0xFFFE) == 2 && v17 == a1)
    {
      sub_10000812C(1);
      sub_10000812C(0);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10000F54C;
      v32[3] = &unk_10002D070;
      v32[4] = &qword_100032038;
      v32[5] = 0;
      pthread_mutex_lock(&stru_100031C80);
      sub_10000F54C((uint64_t)v32);
      pthread_mutex_unlock(&stru_100031C80);
    }
    uint64_t v29 = *(NSObject **)(v16 + 112);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CE94;
    block[3] = &unk_10002CA98;
    void block[4] = v16;
    dispatch_sync(v29, block);
    if ((a8 & 1) == 0)
    {
      *(unsigned char *)(v16 + 225) = a9;
      +[IAPTDPostAlert PostAccessoryNotification:@"ACCESSORY_UNSUPPORTED" forMsg:0 withArg:0 forDefaultButton:@"DISMISS_STRING" withAlternateButton:0 forNotification:v16 + 216 withCallback:0.0 andTimeout:nullsub_16];
    }
    sub_10000BEEC(v16, 1, 0, 0);
    goto LABEL_46;
  }
LABEL_26:
  int v23 = *(const void **)(v16 + 152);
  if (v23) {
    CFRelease(v23);
  }
  *(void *)(v16 + 152) = a6;
  uint64_t v24 = service;
  *(_DWORD *)(v17 + 120) = service;
  IOObjectRetain(v24);
  sub_10000BEEC(v16, 2, 0, a5);
  sub_10000F438(v17);
  uint64_t v25 = sub_100013580(*(_DWORD *)(v16 + 56));
  if (v25)
  {
    uint64_t v26 = v25;
    if (byte_100031F58) {
      syslog(4, "%s Start data pass-thru on upstream primaryPortID:%02X\n", "AuthProcessFinish", *(_DWORD *)(v16 + 56));
    }
    sub_100013CBC(v26, *(unsigned __int8 *)(v26 + 40));
  }
  if (byte_100031F58) {
    syslog(4, "%s Enabling Accessory Power on primaryPortID=%02X, ioService:%04X\n", "AuthProcessFinish", *(_DWORD *)(v17 + 56), *(_DWORD *)(v17 + 60));
  }
  char v27 = sub_100016268(*(_DWORD *)(v17 + 60), 3);
  if (v27) {
    syslog(3, "%s ERROR: EnableAccessoryPowerForPortService ioService:%04X, fail status:%02X\n", "AuthProcessFinish", *(_DWORD *)(v17 + 60), v27);
  }
  else {
    *(unsigned char *)(v17 + 240) = 1;
  }
  if (IsAppleAccessory()) {
    sub_10000D44C(a1, service);
  }
  uint64_t v28 = 1;
LABEL_47:
  if (byte_100031F58) {
    syslog(4, "%s EXIT authCPService:%04X, bAuthPassed:%d, bIsAccAttached:%d, pAIDBUpstream:%hhx\n", "AuthProcessFinish", service, v28, *(unsigned __int8 *)(v17 + 237), v16);
  }
  return v16;
}

void sub_10000F438(uint64_t a1)
{
  kern_return_t MatchingServices;
  io_iterator_t v7;
  BOOL v8;
  io_iterator_t existing;

  if (byte_100031F58)
  {
    id v2 = *(long long **)(a1 + 48);
    uint64_t v3 = *(void *)v2;
    if (v2 == &xmmword_100032050) {
      uint64_t v4 = "E75";
    }
    else {
      uint64_t v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBPort:%hhx, pAIDBRoot:%hhx (%s)\n", "EAServiceAccDetect", a1, v3, v4);
  }
  CFDictionaryRef v5 = IOServiceMatching("IOAccessoryEAInterface");
  if (v5)
  {
    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v5, &existing);
    char v7 = existing;
    if (MatchingServices) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = existing == 0;
    }
    if (!v8)
    {
      if (byte_100031F58)
      {
        syslog(4, "%s Call EAServicePublishCallback eaIterator:%04X\n", "EAServiceAccDetect", existing);
        char v7 = existing;
      }
      sub_100011D34(**(void **)(a1 + 48), v7);
      char v7 = existing;
    }
    IOObjectRelease(v7);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBPort:%hhx\n", "EAServiceAccDetect", a1);
  }
}

void sub_10000F54C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  if (v4 != v3)
  {
    do
    {
      if (*(void *)(a1 + 40)) {
        break;
      }
      if ((*(unsigned int (**)(void))(**(void **)(v4 + 16) + 80))(*(void *)(v4 + 16)) == 1
        || !(*(unsigned int (**)(void))(**(void **)(v4 + 16) + 80))(*(void *)(v4 + 16)))
      {
        (*(void (**)(void))(**(void **)(v4 + 16) + 32))(*(void *)(v4 + 16));
        objc_msgSend(v2, "addObject:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(void *)(v4 + 16)));
      }
      uint64_t v4 = *(void *)(v4 + 8);
    }
    while (v4 != *(void *)(a1 + 32));
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v2);
        }
        sub_100016590([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) unsignedLongLongValue]);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_10000F710(uint64_t a1, int a2, _OWORD *a3)
{
  kern_return_t v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  const char *v17;
  io_connect_t v18;
  int v19;
  int v20;
  io_connect_t connect;

  int v4 = a2;
  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPortUpstream:%hhx, bIsRoot:%d, oldAuthState:%02X, newAuthState:%02X, pkAccAuthCaps:%hhx\n", "AuthStateUpdateInternal", a1, *(unsigned __int8 *)(a1 + 238), *(_DWORD *)(a1 + 148), a2, a3);
  }
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  *(unsigned char *)(a1 + 144) = 0;
  if (v4 != 2)
  {
    if (!byte_100031F59) {
      goto LABEL_8;
    }
    if (byte_100031F58) {
      syslog(4, "%s Auth failed, gbAuthAlwaysPasses auth pass override !\n", "AuthStateUpdateInternal");
    }
  }
  int v4 = 2;
LABEL_8:
  if (!*(_DWORD *)(a1 + 148))
  {
    connect = 0;
    if (a3) {
      id v6 = a3;
    }
    else {
      id v6 = &unk_100028A30;
    }
    *(_DWORD *)(a1 + 148) = v4;
    if (v4 == 2)
    {
      long long v7 = v6[1];
      *(_OWORD *)(a1 + 160) = *v6;
      *(_OWORD *)(a1 + 176) = v7;
    }
    if (qword_100031F60 != -1) {
      dispatch_once(&qword_100031F60, &stru_10002D148);
    }
    if (byte_100031F5B)
    {
      int v8 = IOAccessoryManagerCopyDeviceInfo();
      if (v8) {
        syslog(3, "%s Unable to get accessory serial number for ioAccService:%04X, status:%04X\n", "AuthStateUpdateInternal", *(_DWORD *)(a1 + 60), v8);
      }
    }
    long long v9 = IOServiceOpen(*(_DWORD *)(a1 + 60), mach_task_self_, 0, &connect);
    if (v9) {
      long long v10 = 1;
    }
    else {
      long long v10 = connect == 0;
    }
    if (v10)
    {
      syslog(3, "%s IOServiceOpen fail status:%02X or NULL ioConn:%04X\n", "AuthStateUpdateInternal", v9, connect);
    }
    else
    {
      if (v4 == 1)
      {
        uint64_t v16 = 0;
        uint64_t v15 = 0xFFFF;
      }
      else if (v4 == 2)
      {
        long long v11 = CanChargeHighVoltage();
        if (v11) {
          long long v12 = 65;
        }
        else {
          long long v12 = 81;
        }
        if (v11) {
          uint64_t v13 = 65470;
        }
        else {
          uint64_t v13 = 65454;
        }
        uint64_t v14 = CanUseAccPwrUHPM();
        if (v14) {
          uint64_t v15 = v12 & 0xFFFFFFF0;
        }
        else {
          uint64_t v15 = v12;
        }
        uint64_t v16 = v13 | v14;
        if (CanUseAccPwrLoV())
        {
          v15 &= 0x11u;
          v16 |= 0x40u;
        }
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = 0;
      }
      if (byte_100031F58)
      {
        uint64_t v17 = "FAILED";
        if (v4 == 2) {
          uint64_t v17 = "PASSED";
        }
        syslog(4, "%s AUTH [%s], authCertCaps0:%08llX -> ioAccFeatMaskRevoke:%08X, ioAccFeatMaskAllow:%08X\n", "AuthStateUpdateInternal", v17, *(void *)v6, v15, v16);
      }
      uint64_t v18 = connect;
      if (v15)
      {
        uint64_t v19 = IOAccessoryManagerRevokeFeatures();
        uint64_t v18 = connect;
        if (v19)
        {
          syslog(3, "%s IOAccMgrRevokeFeatures ioConnect:%04X, kernStatus:%02X\n", "AuthStateUpdateInternal", connect, v19);
          uint64_t v18 = connect;
        }
      }
      if (v16)
      {
        uint64_t v20 = IOAccessoryManagerAllowFeatures();
        if (v20) {
          syslog(3, "%s IOAccMgrAllowFeatures ioConnect:%04X, kernStatus:%02X\n", "AuthStateUpdateInternal", connect, v20);
        }
        uint64_t v18 = connect;
      }
      IOServiceClose(v18);
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT authStateDownstream:%02X, newAuthState:%02X\n", "AuthStateUpdateInternal", *(_DWORD *)(a1 + 148), v4);
  }
}

void sub_10000FA24(id a1)
{
  byte_100031F5B = 0;
  uint64_t v1 = (const void *)MGCopyAnswer();
  if (v1)
  {
    id v2 = v1;
    byte_100031F5B = CFEqual(v1, @"Internal") != 0;
    CFRelease(v2);
  }
  else
  {
    byte_100031F5B = 0;
  }
}

void sub_10000FA9C(uint64_t a1, int a2, int a3, _OWORD *a4)
{
  int v13 = -1431655766;
  if ((a2 - 1) >= 2) {
    sub_10001F680();
  }
  uint64_t v7 = a1;
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      int v8 = "E75";
    }
    else {
      int v8 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), newAuthState:%02X, ioAccPortID:%02X\n", "AuthStateUpdateByPortID", a1, v8, a2, a3);
  }
  if ((a3 - 1) > 1)
  {
    syslog(3, "%s Ignored unrecognized port ID:%02X\n", "AuthStateUpdateByPortID", a3);
    goto LABEL_17;
  }
  io_object_t ServiceWithPort = IOAccessoryPortGetServiceWithPort();
  if (!ServiceWithPort)
  {
LABEL_17:
    LODWORD(v7) = 0;
    goto LABEL_18;
  }
  io_object_t v10 = ServiceWithPort;
  io_object_t UpstreamService = IOAccessoryManagerGetUpstreamService();
  int v13 = UpstreamService;
  IOObjectRelease(v10);
  if (UpstreamService)
  {
    IOObjectRelease(UpstreamService);
    uint64_t v12 = sub_10000B250(v7, (unint64_t)sub_10000D034, 0, (uint64_t)&v13, 0);
    if (v12) {
      uint64_t v7 = v12;
    }
  }
  if (v7)
  {
    if (!*(_DWORD *)(v7 + 148)
      || (uint64_t v7 = sub_10000B250(v7, (unint64_t)sub_10000D048, 0, (uint64_t)&unk_100028A60, 0)) != 0)
    {
      sub_10000BEEC(v7, a2, 1, a4);
    }
  }
LABEL_18:
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBUpstream:%hhx\n", "AuthStateUpdateByPortID", v7);
  }
}

void sub_10000FC48(uint64_t a1, uint64_t a2)
{
}

void sub_10000FC58(uint64_t a1)
{
}

void sub_10000FC64(void *a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1[4] + 8) + 40) lengthOfBytesUsingEncoding:4];
  if ((unint64_t)v2 - 8 > 0x18)
  {
    syslog(3, "%s Unsupported certHashLen:%02X\n", "AuthCertDataFromHash_block_invoke", v2);
  }
  else
  {
    id v3 = objc_msgSend(objc_msgSend((id)qword_100032198, "objectForKey:", *(void *)(*(void *)(a1[4] + 8) + 40)), "objectAtIndex:", 1);
    if (v3)
    {
      uint64_t v4 = a1[6];
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      if (v4) {
        *(void *)a1[6] = CFDataCreate(0, (const UInt8 *)[v3 bytes], (CFIndex)objc_msgSend(v3, "length"));
      }
    }
  }
}

uint64_t sub_10000FD3C(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSData);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  id v4 = [v2 initWithBytes:BytePtr length:CFDataGetLength(*(CFDataRef *)(a1 + 48))];
  id v5 = +[NSNumber numberWithUnsignedLong:1];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [v6 insertObject:v5 atIndex:0];
  [v6 insertObject:v4 atIndex:1];
  if ((unint64_t)[(id)qword_100032198 count] >= 0x10)
  {
    id v7 = [(id)qword_100032198 keyEnumerator];
    id v8 = [v7 nextObject];
    if (!v8) {
      goto LABEL_13;
    }
    id v9 = v8;
    io_object_t v10 = 0;
    long long v11 = 0;
    do
    {
      id v12 = objc_msgSend(objc_msgSend((id)qword_100032198, "objectForKey:", v9), "objectAtIndex:", 0);
      id v13 = v12;
      if (!v10 || [v12 compare:v10] == (id)-1)
      {
        long long v11 = v9;
        io_object_t v10 = v13;
      }
      id v9 = [v7 nextObject];
    }
    while (v9);
    if (!v11) {
LABEL_13:
    }
      sub_10001F680();
    if (byte_100031F58) {
      syslog(4, "%s Deleting cert hash:[%s], certUsageCnt:%02lX\n", "AuthCertAddHashDataEntry_block_invoke", (const char *)[v11 cStringUsingEncoding:4], objc_msgSend(v10, "longValue"));
    }
    [(id)qword_100032198 removeObjectForKey:v11];
  }
  [(id)qword_100032198 setObject:v6 forKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  CFPreferencesSetValue(@"authCertCache", (CFPropertyListRef)qword_100032198, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  uint64_t result = CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_10000FF48(uint64_t a1)
{
  [(id)qword_100032198 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  CFPreferencesSetValue(@"authCertCache", (CFPropertyListRef)qword_100032198, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  uint64_t result = CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void sub_10000FFE8(void *a1)
{
  id v2 = [(id)qword_100032198 objectForKey:*(void *)(*(void *)(a1[4] + 8) + 40)];
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    [v4 addObjectsFromArray:v3];
    *(void *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(objc_msgSend(v3, "objectAtIndex:", 0), "longValue");
    id v5 = +[NSNumber numberWithUnsignedLong:*(void *)(*(void *)(a1[5] + 8) + 24) + 1];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [(NSNumber *)v5 longValue];
    if ([v4 count] == (id)2)
    {
      [v4 replaceObjectAtIndex:0 withObject:v5];
      [(id)qword_100032198 setObject:v4 forKey:*(void *)(*(void *)(a1[4] + 8) + 40)];
      CFPreferencesSetValue(@"authCertCache", (CFPropertyListRef)qword_100032198, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost) != 0;
    }
    else if (byte_100031F58)
    {
      syslog(4, "%s pArrayMut count != gkIndexCertArrayCount\n");
    }
  }
  else if (byte_100031F58)
  {
    syslog(4, "%s pkArray is nil\n");
  }
}

void sub_100010188(uint64_t a1)
{
  id v2 = objc_msgSend(objc_msgSend((id)qword_100032198, "allKeys"), "objectEnumerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [(id)qword_100032198 count];
  id v3 = [v2 nextObject];
  if (v3)
  {
    id v4 = v3;
    do
    {
      id v5 = [(id)qword_100032198 objectForKey:v4];
      id v6 = [v5 objectAtIndex:0];
      id v7 = [v5 objectAtIndex:1];
      id v8 = (char *)[v4 lengthOfBytesUsingEncoding:4];
      id v9 = [v5 count];
      id v10 = [v6 unsignedIntegerValue];
      id v11 = [v7 length];
      if ((unint64_t)(v8 - 33) < 0xFFFFFFFFFFFFFFE7
        || (v9 == (id)2 ? (BOOL v12 = v10 == 0) : (BOOL v12 = 1),
            v12 || (unint64_t)v11 < 0x200 || (unint64_t)v11 >= 0x801))
      {
        [(id)qword_100032198 removeObjectForKey:v4];
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      id v4 = [v2 nextObject];
    }
    while (v4);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    CFPreferencesSetValue(@"authCertCache", (CFPropertyListRef)qword_100032198, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    if (!CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost))syslog(3, "%s CFPreferencesSynchronize failed !\n", "AuthCertValidateCache_block_invoke"); {
  }
    }
}

intptr_t sub_100010330(void *a1, int a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  char v8 = a2;
  if (a2 && (a5 & 1) != 0) {
    syslog(6, "%s: bAuthPassed:%d, fdrValidationStatus:%d, authError:0x%x");
  }
  else {
    syslog(3, "%s: bAuthPassed:%d, fdrValidationStatus:%d, authError:0x%x");
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v8;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a6;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a5;
  id v10 = a1[4];
  return dispatch_semaphore_signal(v10);
}

uint64_t sub_1000103FC(void *a1)
{
  id v2 = [(id)qword_1000321B0 objectForKey:a1[5]];
  if (!v2) {
    id v2 = objc_alloc_init((Class)NSMutableArray);
  }
  if ([v2 count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      CFStringRef v4 = (const __CFString *)[v2 objectAtIndex:v3];
      if (v4)
      {
        CFStringRef v5 = v4;
        CFStringRef v6 = (const __CFString *)a1[6];
        v8.length = CFStringGetLength(v4);
        v8.location = 0;
        uint64_t result = CFStringCompareWithOptions(v5, v6, v8, 1uLL);
        if (!result) {
          break;
        }
      }
      if (++v3 >= (unint64_t)[v2 count]) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    [v2 addObject:a1[6]];
    [(id)qword_1000321B0 setObject:v2 forKey:a1[5]];
    ADClientAddValueForScalarKey();
    CFPreferencesSetValue(@"attachedAIDBAccessoriesCache", (CFPropertyListRef)qword_1000321B0, @"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    uint64_t result = CFPreferencesSynchronize(@"com.apple.iaptransportd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result != 0;
  }
  return result;
}

BOOL sub_10001053C(uint64_t a1)
{
  return sub_10000B250(a1, (unint64_t)sub_10000D084, 0, (uint64_t)&unk_100031F68, 0) != 0;
}

void sub_100010580(char *a1, uint64_t a2)
{
  if (byte_100031F58)
  {
    if (a1) {
      int v4 = *(unsigned __int16 *)a1;
    }
    else {
      int v4 = 0;
    }
    syslog(4, "%s ENTR pAIDBPort:%hhx, pIOAccBuff:%hhx, buffLen:%04X\n", "PortReceiveBuff", a2, a1, v4);
  }
  if (!a1 || !a2 || !*(_WORD *)a1)
  {
    if (!byte_100031F58) {
      return;
    }
    syslog(4, "%s Buffer ignored pAIDBPort:%hhx, pIOAccBuff:%hhx, buffLen:%04X\n");
    goto LABEL_27;
  }
  if ((void)xmmword_100032050)
  {
    uint64_t v5 = sub_10000B250(xmmword_100032050, (unint64_t)sub_10000BEDC, 0, a2, 0);
    if (v5) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ((void)xmmword_1000320B8) {
    uint64_t v5 = sub_10000B250(xmmword_1000320B8, (unint64_t)sub_10000BEDC, 0, a2, 0);
  }
LABEL_17:
  if (v5 == a2)
  {
    char v7 = sub_1000084F4(a2);
    int v6 = byte_100031F58;
    if ((v7 & 1) == 0)
    {
      if (byte_100031F58) {
        syslog(4, "%s pBuff:%hhx, buffLen:%04X\n", "PortReceiveBuff", a1 + 2, *(unsigned __int16 *)a1);
      }
      sub_100008A40(a2, a1 + 2, *(unsigned __int16 *)a1);
      goto LABEL_27;
    }
  }
  else
  {
    int v6 = byte_100031F58;
  }
  if (!v6) {
    return;
  }
  if (v5) {
    sub_1000084F4(v5);
  }
  syslog(4, "%s Buffer ignored pAIDBPort:%hhx != pAIDBTemp:%hhx, bLockedOut:%d\n");
LABEL_27:
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "PortReceiveBuff");
  }
}

uint64_t sub_100010758(uint64_t a1, uint64_t a2, int a3)
{
  if (byte_100031F58) {
    syslog(4, "%s ENTR pTxdData:%hhx, dataLen:%04X, accIOConn:%04X\n", "PortTransmitData", a2, a3, *(_DWORD *)(a1 + 12));
  }
  int v6 = sub_1000084F4(a1);
  uint64_t v7 = 96;
  if (a3 && a2 && !v6)
  {
    if (*(_DWORD *)(a1 + 12))
    {
      if (byte_100031F58) {
        syslog(4, "%s pBuff:%hhx, buffLen:%04X\n", "PortTransmitData", a2, a3);
      }
      uint64_t v7 = IOAccessoryPortTransmitData();
    }
    else
    {
      uint64_t v7 = 96;
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT status:%02X\n", "PortTransmitData", v7);
  }
  return v7;
}

uint64_t sub_100010858()
{
  return 0;
}

void sub_100010860(void *a1)
{
  kern_return_t v6;
  io_iterator_t v7;
  BOOL v8;
  IONotificationPort *v9;
  CFDictionaryRef v10;
  kern_return_t v11;
  io_iterator_t v12;
  BOOL v13;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;

  if (byte_100031F58)
  {
    if ((void *)xmmword_100032050 == a1) {
      id v2 = "E75";
    }
    else {
      id v2 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s)\n", "EnableIOAccMgrMatchNotifications", a1, v2);
  }
  uint64_t v3 = a1[6];
  int v4 = *(IONotificationPort **)(v3 + 32);
  CFDictionaryRef v5 = IOServiceMatching("IOAccessoryManager");
  int v6 = IOServiceAddMatchingNotification(v4, "IOServiceFirstPublish", v5, (IOServiceMatchingCallback)sub_100010A0C, a1, (io_iterator_t *)(v3 + 48));
  uint64_t v7 = *(_DWORD *)(v3 + 48);
  if (v6) {
    CFRange v8 = 1;
  }
  else {
    CFRange v8 = v7 == 0;
  }
  if (v8)
  {
    syslog(3, "%s IOServiceAddMatchingNotification publish fail status:0x%02X, iter:0x%02X\n", "EnableIOAccMgrMatchNotifications", v6, v7);
  }
  else
  {
    sub_100010A0C((uint64_t)a1, v7);
    id v9 = *(IONotificationPort **)(v3 + 32);
    id v10 = IOServiceMatching("IOAccessoryManager");
    id v11 = IOServiceAddMatchingNotification(v9, "IOServiceTerminate", v10, (IOServiceMatchingCallback)sub_100010DF8, a1, (io_iterator_t *)(v3 + 52));
    BOOL v12 = *(_DWORD *)(v3 + 52);
    if (v11) {
      id v13 = 1;
    }
    else {
      id v13 = v12 == 0;
    }
    if (v13) {
      syslog(3, "%s IOServiceAddMatchingNotification terminate fail status:0x%02X, iter:0x%02X\n", "EnableIOAccMgrMatchNotifications", v11, v12);
    }
    else {
      sub_100010DF8((uint64_t)a1, v12);
    }
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v3 + 32));
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopCommonModes);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EnableIOAccMgrMatchNotifications");
  }
}

void sub_100010A0C(uint64_t a1, io_iterator_t iterator)
{
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      int v4 = "E75";
    }
    else {
      int v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), ioAccMgrIter:%04X\n", "IOAccMgrMatchPublishCallback", a1, v4, iterator);
  }
  if (a1)
  {
    if (iterator)
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 48) + 16);
      int PrimaryPort = -1431655766;
      io_object_t v6 = IOIteratorNext(iterator);
      if (v6)
      {
        io_object_t v7 = v6;
        do
        {
          int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
          int UpstreamService = v7;
          do
          {
            int v9 = UpstreamService;
            int UpstreamService = IOAccessoryManagerGetUpstreamService();
          }
          while (UpstreamService);
          if (byte_100031F58) {
            syslog(4, "%s ioService:%04X, aidbPortRootSvc:%04X, ioAccPortID:%02X, ioServiceRoot:0x%02X\n", "IOAccMgrMatchPublishCallback", v7, v9, PrimaryPort, v5);
          }
          if (PrimaryPort && v9 == v5)
          {
            int v10 = *(_DWORD *)(a1 + 56);
            if (v10)
            {
              if (v10 != PrimaryPort
                && !sub_10000B250(a1, (unint64_t)sub_10000D020, 0, (uint64_t)&PrimaryPort, 0))
              {
                uint64_t v11 = sub_10000AC30(qword_100032188, *(void *)(a1 + 48));
                if (!v11) {
                  sub_10001F680();
                }
                uint64_t v12 = v11;
                sub_10000BD08(v11, v7, PrimaryPort);
                *(_DWORD *)(v12 + 64) = IOAccessoryManagerGetUpstreamService();
                uint64_t v13 = sub_10000B250(a1, (unint64_t)sub_10000D034, 0, v12 + 64, 0);
                if (v13) {
                  uint64_t v14 = v13;
                }
                else {
                  uint64_t v14 = a1;
                }
                uint64_t v15 = *(NSObject **)(v14 + 112);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_10000CB20;
                block[3] = &unk_10002D070;
                void block[4] = v14;
                void block[5] = v12;
                dispatch_sync(v15, block);
                int DigitalID = IOAccessoryManagerGetDigitalID();
                if (DigitalID) {
                  syslog(4, "%s IOAccMgrGetDigitalID failed kernStatus:%02X\n", "IOAccMgrMatchPublishCallback", DigitalID);
                }
                sub_100010F80(v12);
                if (byte_100031F58) {
                  syslog(4, "%s pAIDBPort:%hhx, ioService:%04X\n");
                }
              }
            }
            else
            {
              sub_10000BD08(a1, v7, PrimaryPort);
            }
          }
          else if (byte_100031F58)
          {
            syslog(4, "%s Ignored ioService:%04X, ioAccPortID:%02X, aidbPortRootSvc:%04X != ioServiceRoot:%04X\n");
          }
          IOObjectRelease(v7);
          io_object_t v7 = IOIteratorNext(iterator);
        }
        while (v7);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "IOAccMgrMatchPublishCallback");
  }
}

void sub_100010DF8(uint64_t a1, io_iterator_t iterator)
{
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      int v4 = "E75";
    }
    else {
      int v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), ioAccMgrIter:%04X\n", "IOAccMgrMatchTerminateCallback", a1, v4, iterator);
  }
  if (a1)
  {
    if (iterator)
    {
      for (io_object_t object = IOIteratorNext(iterator); object; io_object_t object = IOIteratorNext(iterator))
      {
        uint64_t v5 = sub_10000B250(a1, (unint64_t)sub_10000D034, 0, (uint64_t)&object, 0);
        uint64_t v6 = v5;
        if (byte_100031F58)
        {
          if (v5) {
            int v7 = *(_DWORD *)(v5 + 56);
          }
          else {
            int v7 = 0;
          }
          syslog(4, "%s ioService:%04X matched pAIDBPort:%hhx, ioAccPortID:%02X\n", "IOAccMgrMatchTerminateCallback", object, v5, v7);
        }
        if (v6)
        {
          sub_10000C118(v6);
          uint64_t v8 = sub_10000B250(a1, (unint64_t)sub_10000D034, 0, v6 + 64, 0);
          if (v8) {
            sub_10000C118(v8);
          }
          if (v6 != a1) {
            sub_10000CCF0(a1, v6);
          }
        }
        IOObjectRelease(object);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "IOAccMgrMatchTerminateCallback");
  }
}

void sub_100010F80(uint64_t a1)
{
  kern_return_t v2;
  BOOL v3;
  uint64_t v4;
  kern_return_t v5;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoop *Main;
  io_connect_t connect;

  if (byte_100031F58) {
    syslog(4, "%s ENTR pAIDBPort:%hhx m_ioAccMgrPrimaryPortID:%04X\n", "EnableIOAccMgrEventNotifications", a1, *(_DWORD *)(a1 + 56));
  }
  connect = 0;
  id v2 = IOServiceOpen(*(_DWORD *)(a1 + 60), mach_task_self_, 0, &connect);
  if (v2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = connect == 0;
  }
  if (v3)
  {
    syslog(3, "%s IOServiceOpen fail kernStatus:%02X, ioConn:%02X\n", "EnableIOAccMgrEventNotifications", v2, connect);
  }
  else
  {
    int v4 = *(void *)(a1 + 48);
    *(_DWORD *)(a1 + 80) = 0;
    uint64_t v5 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(v4 + 32), *(_DWORD *)(a1 + 60), "IOGeneralInterest", (IOServiceInterestCallback)sub_1000110D0, (void *)a1, (io_object_t *)(a1 + 80));
    if (v5)
    {
      syslog(3, "%s IOServiceAddInterestNotification fail status:%02X\n", "EnableIOAccMgrEventNotifications", v5);
    }
    else if (*(unsigned char *)(a1 + 238))
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v4 + 32));
      *(void *)(v4 + 40) = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(v4 + 40), kCFRunLoopCommonModes);
      }
    }
    IOServiceClose(connect);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EnableIOAccMgrEventNotifications");
  }
}

void sub_1000110D0(uint64_t a1, int a2, int a3)
{
  int UpstreamService = a2;
  do
  {
    int v7 = UpstreamService;
    int UpstreamService = IOAccessoryManagerGetUpstreamService();
  }
  while (UpstreamService);
  uint64_t v8 = &xmmword_100032050;
  if (dword_100032060 != v7 && (v8 = &xmmword_1000320B8, dword_1000320C8 != v7) || (uint64_t v9 = *(void *)v8) == 0)
  {
    LODWORD(v11) = 0;
LABEL_15:
    syslog(3, "%s pAIDBPort:%hhx or ioService:%02X is NULL !\n", "IOAccMgrEventNotificationCallback", v11, a2);
    return;
  }
  uint64_t v10 = sub_10000B250(*(void *)v8, (unint64_t)sub_10000BEDC, 0, a1, 0);
  uint64_t v11 = v10;
  if (!a2 || !v10) {
    goto LABEL_15;
  }
  uint64_t v12 = (void *)qword_100032188;
  __int16 v28 = -21846;
  int v27 = -1431655766;
  if (a3 > -469794794)
  {
    switch(a3)
    {
      case -469794726:
      case -469794724:
      case -469794723:
      case -469794722:
        if (byte_100031F58)
        {
          switch(a3)
          {
            case -469794726:
              uint64_t v13 = "AccIDDigitalNoID";
              break;
            case -469794724:
              uint64_t v13 = "AccIDDigitalUnsupported";
              break;
            case -469794723:
              uint64_t v13 = "AccIDDigitalUnreliable";
              break;
            default:
              uint64_t v13 = "AccIDDigitalWrongOrientation";
              break;
          }
          syslog(4, "%s pAIDBPort:%hhx, bIsRoot:%d, IOAccMgrMsg: %s\n", "IOAccMgrEventNotificationCallback", v10, *(unsigned __int8 *)(v10 + 238), v13);
        }
        int v15 = 1;
        goto LABEL_56;
      case -469794725:
        goto LABEL_37;
      case -469794721:
      case -469794720:
      case -469794719:
      case -469794718:
      case -469794717:
        return;
      case -469794716:
        goto LABEL_25;
      default:
        if (a3 != -469794793) {
          return;
        }
LABEL_37:
        if (byte_100031F58)
        {
          uint64_t v18 = "ConfigChange";
          if (a3 == -469794725) {
            uint64_t v18 = "AccIDDigitalID";
          }
          syslog(4, "%s pAIDBPort:%hhx, bIsRoot:%d, IOAccMgrMsg: %s\n", "IOAccMgrEventNotificationCallback", v10, *(unsigned __int8 *)(v10 + 238), v18);
        }
        int v15 = a3 == -469794725 || *(unsigned char *)(v11 + 237) != 0;
        if (IOAccessoryManagerGetDigitalID()) {
          uint64_t v20 = (char *)&unk_100028A64;
        }
        else {
          uint64_t v20 = (char *)&v27;
        }
        break;
    }
    goto LABEL_57;
  }
  switch(a3)
  {
    case -536870608:
      cf2[0] = 0;
      if (!IOAccessoryManagerCopyDeviceInfo())
      {
        uint64_t v16 = *(const void **)(v11 + 248);
        CFTypeRef v17 = cf2[0];
        if (v16)
        {
          if (CFEqual(v16, cf2[0]))
          {
            CFRelease(cf2[0]);
          }
          else
          {
            CFRelease(*(CFTypeRef *)(v11 + 248));
            *(CFTypeRef *)(v11 + 248) = cf2[0];
          }
        }
        else
        {
          *(CFTypeRef *)(v11 + 248) = cf2[0];
          if (byte_100031F58) {
            syslog(4, "%s kIOMessageServicePropertyChange setting m_accAIDBModelNumber: %@\n", "IOAccMgrEventNotificationCallback", v17);
          }
          if (IsAppleAccessory()) {
            sub_10000D44C(v9, *(_DWORD *)(v11 + 120));
          }
        }
      }
      break;
    case -469794799:
LABEL_25:
      if (byte_100031F58)
      {
        uint64_t v14 = "AccIDNoneConnected";
        if (a3 == -469794799) {
          uint64_t v14 = "Detach";
        }
        syslog(4, "%s pAIDBPort:%hhx, bIsRoot:%d, IOAccMgrMsg: %s\n", "IOAccMgrEventNotificationCallback", v10, *(unsigned __int8 *)(v10 + 238), v14);
      }
      if (*(void *)(v11 + 216)) {
        +[IAPTDPostAlert TearDownAccessoryNotification:v11 + 216];
      }
      int v15 = 0;
      ++*(unsigned char *)(v9 + 224);
LABEL_56:
      uint64_t v20 = (char *)&unk_100028A64;
LABEL_57:
      uint64_t v25 = *(void *)(v11 + 226);
      __int16 v26 = *(_WORD *)(v11 + 234);
      sub_10000CA34((unsigned char *)v11, v20);
      sub_10000C6D0(v11, a3, (uint64_t)&v25);
      if (*(unsigned __int8 *)(v11 + 237) != v15)
      {
        if (v15)
        {
          if (a3 != -469794793)
          {
            unint64_t v21 = *(void *)(*(void *)(v11 + 48) + 96);
            if (byte_100031F58) {
              syslog(4, "%s pAIDBPort:%hhx, AppleID accessory attach, start auth timer (%02lld secs)\n", "IOAccMgrEventNotificationCallback", v11, v21 / 0x3B9ACA00);
            }
            *(unsigned char *)(v11 + 144) = 1;
            uint64_t v22 = *(NSObject **)(v11 + 136);
            dispatch_time_t v23 = dispatch_time(0, v21);
            dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
          }
        }
        else
        {
          if (byte_100031F58) {
            syslog(4, "%s AppleID accessory detach, stop auth timer, reset auth state\n", "IOAccMgrEventNotificationCallback");
          }
          sub_10000C118(v11);
          uint64_t v24 = *(NSObject **)(v11 + 112);
          cf2[0] = _NSConcreteStackBlock;
          cf2[1] = (CFTypeRef)3221225472;
          cf2[2] = sub_10000CE94;
          cf2[3] = &unk_10002CA98;
          cf2[4] = (CFTypeRef)v11;
          dispatch_sync(v24, cf2);
        }
        *(unsigned char *)(v11 + 237) = v15;
      }
      return;
    case -469794796:
      if (byte_100031F58) {
        syslog(4, "%s pAIDBPort:%hhx, bIsRoot:%d, IOAccMgrMsg: USBConnChange\n", "IOAccMgrEventNotificationCallback", v10, *(unsigned __int8 *)(v10 + 238));
      }
      LODWORD(cf2[0]) = 0;
      LOBYTE(v25) = 0;
      if (!IOAccessoryManagerGetUSBConnectType()
        && LODWORD(cf2[0]) != [v12 iap9PinUSBConnState])
      {
        [v12 setIap9PinUSBConnState:LOBYTE(cf2[0])];
      }
      break;
  }
}

uint64_t sub_10001166C(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 56) == 256) {
      return sub_100016268(*(_DWORD *)(result + 60), a2);
    }
  }
  return result;
}

void sub_100011688(void *a1)
{
  kern_return_t v6;
  io_iterator_t v7;
  BOOL v8;
  kern_return_t v9;
  io_iterator_t v10;
  BOOL v11;
  __CFRunLoop *Main;

  if (byte_100031F58)
  {
    if ((void *)xmmword_100032050 == a1) {
      id v2 = "E75";
    }
    else {
      id v2 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s)\n", "EnableAuthCPServiceNotifications", a1, v2);
  }
  CFMutableDictionaryRef v3 = IOServiceMatching("AppleAuthCP");
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    uint64_t v5 = a1[6];
    CFRetain(v3);
    uint64_t v6 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v5 + 32), "IOServiceFirstPublish", v4, (IOServiceMatchingCallback)sub_100011830, a1, (io_iterator_t *)(v5 + 72));
    int v7 = *(_DWORD *)(v5 + 72);
    if (v6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7 == 0;
    }
    if (v8)
    {
      syslog(3, "%s IOServiceAddMatchingNotification publish fail status:%02X, ioIter:%04X\n", "EnableAuthCPServiceNotifications", v6, v7);
      CFRelease(v4);
    }
    else
    {
      sub_100011830((uint64_t)a1, v7);
      uint64_t v9 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v5 + 32), "IOServiceTerminate", v4, (IOServiceMatchingCallback)sub_100011A4C, a1, (io_iterator_t *)(v5 + 76));
      uint64_t v10 = *(_DWORD *)(v5 + 76);
      if (v9) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10 == 0;
      }
      if (v11)
      {
        syslog(3, "%s IOServiceAddMatchingNotification terminate fail status:%02X, ioIter:%04X\n", "EnableAuthCPServiceNotifications", v9, v10);
      }
      else
      {
        sub_100011A4C((uint64_t)a1, v10);
        *(void *)(v5 + 64) = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v5 + 32));
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(v5 + 64), kCFRunLoopCommonModes);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EnableAuthCPServiceNotifications");
  }
}

void sub_100011830(uint64_t a1, io_iterator_t iterator)
{
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      CFDictionaryRef v4 = "E75";
    }
    else {
      CFDictionaryRef v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), authCPIter:%04X\n", "AuthCPServicePublishCallback", a1, v4, iterator);
  }
  if (a1)
  {
    if (iterator)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = *(_DWORD *)(v5 + 16);
      io_object_t v7 = IOIteratorNext(iterator);
      if (v7)
      {
        io_object_t v8 = v7;
        do
        {
          int UpstreamService = v8;
          do
          {
            int v10 = UpstreamService;
            int UpstreamService = IOAccessoryManagerGetUpstreamService();
          }
          while (UpstreamService);
          BOOL v11 = (void)xmmword_100032050 == a1 || (void)xmmword_1000320B8 == a1;
          int v12 = v11;
          BOOL v13 = v11 || v8 != v10;
          syslog(6, "%s expectsManager:%d authRootService:0x%x, portRootService:0x%x, self:0x%x runLoopSrc:0x%x\n", "AuthCPServicePublishCallback", v12, v10, v6, v8, *(void *)(v5 + 64));
          int v14 = v12 ^ 1;
          if (v10 != v6) {
            int v14 = 1;
          }
          if (v14 == 1 && v13)
          {
            syslog(4, "%s Ignore publish authRootService:%04X != portRootService:%04X\n", "AuthCPServicePublishCallback", v10, v6);
          }
          else
          {
            if (byte_100031F58) {
              syslog(4, "%s Call AuthProcessStart authCPService:%04X\n", "AuthCPServicePublishCallback", v8);
            }
            IOObjectRetain(v8);
            int v15 = *(NSObject **)(v5 + 56);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100011C44;
            block[3] = &unk_10002D208;
            io_object_t v17 = v8;
            char v18 = 0;
            void block[4] = a1;
            dispatch_async(v15, block);
          }
          IOObjectRelease(v8);
          io_object_t v8 = IOIteratorNext(iterator);
        }
        while (v8);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT pAIDBRoot:%hhx\n", "AuthCPServicePublishCallback", a1);
  }
}

void sub_100011A4C(uint64_t a1, io_iterator_t iterator)
{
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      CFDictionaryRef v4 = "E75";
    }
    else {
      CFDictionaryRef v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s)\n", "AuthCPServiceTerminateCallback", a1, v4);
  }
  if ((void)xmmword_100032120 != a1)
  {
    BOOL v5 = 0;
    if (a1 && iterator)
    {
      uint64_t v6 = xmmword_1000320B8;
      for (io_object_t object = IOIteratorNext(iterator); object; io_object_t object = IOIteratorNext(iterator))
      {
        uint64_t v7 = sub_10000B250(a1, (unint64_t)sub_10000B3FC, 0, (uint64_t)&object, 0);
        uint64_t v8 = v7;
        if (v7 || v6 != a1)
        {
          if (v7)
          {
LABEL_15:
            if (v6 == a1) {
              sub_10000C118(v8);
            }
            *(_DWORD *)(v8 + 148) = 0;
            io_object_t v9 = *(_DWORD *)(v8 + 120);
            if (v9 == object)
            {
              IOObjectRelease(v9);
              *(_DWORD *)(v8 + 120) = 0;
            }
          }
        }
        else
        {
          uint64_t v8 = a1;
          if (*(unsigned char *)(a1 + 144)) {
            goto LABEL_15;
          }
          LODWORD(v8) = 0;
        }
        io_object_t v10 = object;
        if (byte_100031F58)
        {
          syslog(4, "%s authCPService:%04X matched pAIDBPort:%hhx\n", "AuthCPServiceTerminateCallback", object, v8);
          io_object_t v10 = object;
        }
        IOObjectRelease(v10);
      }
      BOOL v5 = v6 == a1;
    }
    if (byte_100031F58) {
      syslog(4, "%s EXIT pAIDBRoot:%hhx bIsRootCON:%d\n", "AuthCPServiceTerminateCallback", a1, v5);
    }
  }
}

uint64_t sub_100011BF4(uint64_t a1)
{
  syslog(4, "kAppleAuthCPMessageNewAuthRequested received. Call startAuthenticationProcess.");
  sub_10000D870(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
  io_object_t v2 = *(_DWORD *)(a1 + 40);
  return IOObjectRelease(v2);
}

uint64_t sub_100011C44(uint64_t a1)
{
  kern_return_t v2;
  int v3;
  uint64_t v4;
  io_object_t v5;
  io_connect_t connect;

  if (sub_10000AF80(*(_DWORD *)(a1 + 40)) || *(unsigned char *)(a1 + 44))
  {
    connect = -1431655766;
    io_object_t v2 = IOServiceOpen(*(_DWORD *)(a1 + 40), mach_task_self_, 0, &connect);
    if (v2)
    {
      syslog(4, "%s: IOServiceOpen() failed (ret=0x%x)\n", "AuthCPServicePublishCallback_block_invoke", v2);
    }
    else
    {
      CFMutableDictionaryRef v3 = sub_10001F3A4(connect, 1u);
      if (v3) {
        syslog(4, "%s: cpSetAuthFullPass() failed (ret=0x%x)\n", "AuthCPServicePublishCallback_block_invoke", v3);
      }
      IOServiceClose(connect);
    }
    CFDictionaryRef v4 = sub_10000B094(*(void **)(a1 + 32), *(_DWORD *)(a1 + 40));
    if (v4)
    {
      BOOL v5 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v4 + 120) = v5;
      IOObjectRetain(v5);
    }
  }
  else
  {
    sub_10000D870(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
  }
  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

void sub_100011D34(uint64_t a1, io_iterator_t iterator)
{
  kern_return_t RegistryEntryID;
  kern_return_t ParentEntry;
  kern_return_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  id v22;
  const char *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void v27[2];
  void v28[4];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  io_object_t v33;
  uint64_t v34;
  uint64_t entryID;
  uint64_t v36;
  io_registry_entry_t parent[3];

  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      CFDictionaryRef v4 = "E75";
    }
    else {
      CFDictionaryRef v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s)\n", "EAServicePublishCallback", a1, v4);
  }
  if (a1)
  {
    if (iterator)
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 48) + 16);
      parent[0] = 0;
      uint64_t entryID = 0;
      CFStringRef v36 = 0xAAAAAAAAAAAAAAAALL;
      CFStringRef v34 = 0;
      io_object_t v6 = IOIteratorNext(iterator);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        uint64_t v8 = v28;
        io_object_t v9 = &qword_100032000;
        do
        {
          int UpstreamService = v7;
          do
          {
            int v11 = UpstreamService;
            int UpstreamService = IOAccessoryManagerGetUpstreamService();
          }
          while (UpstreamService);
          if (v11 != v5 && v9[20])
          {
            if (byte_100031F58) {
              syslog(4, "%s Ignored EA service eaPortRootService:%04X != eaRootService:%04X\n", "EAServicePublishCallback", v11, v5);
            }
            goto LABEL_24;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          ParentEntry = IORegistryEntryGetParentEntry(v7, "IOService", parent);
          int v14 = ParentEntry;
          CFStringRef v36 = parent[0];
          if (byte_100031F58) {
            syslog(4, "%s eaFuncGrpSvc:%04X, eaDeviceID:%04llX, eaFunctGrpDevID:%04llX, kernStats:%d, additionalKernStatus:%d\n", "EAServicePublishCallback", v7, parent[0], entryID, RegistryEntryID, ParentEntry);
          }
          if (RegistryEntryID | v14) {
            goto LABEL_24;
          }
          int v15 = sub_10000B250(a1, (unint64_t)sub_10000D05C, 0, (uint64_t)&v36, 0);
          long long v33 = -1431655766;
          long long v33 = IOAccessoryManagerGetUpstreamService();
          IORegistryEntryGetRegistryEntryID(v33, &v34);
          if (byte_100031F58) {
            syslog(4, "ioAccMgrUpstreamServiceID = %04llX, ioAccMgrSvcUpstream = %04X", v34, v33);
          }
          if (v15)
          {
            NSLog(@"pAIDBPort != NULL!, nothing is happening");
            goto LABEL_23;
          }
          uint64_t v16 = v33;
          if (v33)
          {
            IOObjectRelease(v33);
            uint64_t v16 = sub_10000B250(a1, (unint64_t)sub_10000D034, 0, (uint64_t)&v33, 0);
            io_object_t v17 = v16;
            if (v16)
            {
              uint64_t v16 = sub_10000B250(v16, (unint64_t)sub_10000D05C, 0, (uint64_t)&unk_100028A28, 3);
              if (v16)
              {
                char v18 = v16;
              }
              else
              {
                uint64_t v16 = sub_10000B250(v17, (unint64_t)sub_10000D05C, 0, (uint64_t)&unk_100028A6C, 3);
                if (v16) {
                  char v18 = v16;
                }
                else {
                  char v18 = v17;
                }
              }
              goto LABEL_32;
            }
          }
          else
          {
            io_object_t v17 = 0;
          }
          char v18 = 0;
LABEL_32:
          if (byte_100031F58)
          {
            if (v17) {
              uint64_t v19 = *(_DWORD *)(v17 + 148);
            }
            else {
              uint64_t v19 = 255;
            }
            syslog(4, "%s eaFuncGrpSvc:%04X matches pAIDBPort:%hhx, pAIDBUpstream:%hhx, authStateUpstream:%02X\n", "EAServicePublishCallback", v7, v18, v17, v19);
          }
          if (!v17) {
            goto LABEL_23;
          }
          if (!v18) {
            goto LABEL_23;
          }
          uint64_t v20 = entryID;
          if (!entryID) {
            goto LABEL_23;
          }
          unint64_t v21 = *(_DWORD *)(v17 + 148);
          if (!*(unsigned char *)(v18 + 238))
          {
            __int16 v26 = v8;
            if (v21 == 2)
            {
              *(void *)(v18 + 192) = v36;
              *(void *)(v18 + 200) = v20;
              *(void *)(v18 + 208) = v34;
            }
            uint64_t v22 = (id)IOAccessoryEAInterfaceCopyDeviceModelNumber();
            dispatch_time_t v23 = (const char *)[v22 UTF8String];
            NSLog(@"pAccModel = %@", v22);
            if (v23 && (!strncmp(v23, "A1468", 6uLL) || !strncmp(v23, "A1450", 6uLL)))
            {
              if (byte_100031F58) {
                syslog(4, "%s B139 or B164 (%s), set m_bIsE75To30PinAdapter: %d->%d\n", "EAServicePublishCallback", v23, *(unsigned __int8 *)(v18 + 236), 1);
              }
              *(unsigned char *)(v18 + 236) = 1;
            }
            uint64_t v29 = 0;
            size_t v30 = &v29;
            unint64_t v31 = 0x2020000000;
            uint64_t v32 = 0;
            uint64_t v24 = *(_DWORD *)(v18 + 56);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            uint64_t v8 = v26;
            v28[0] = sub_1000126C0;
            v28[1] = &unk_10002D230;
            v28[2] = &v29;
            v28[3] = v18;
            sub_10001323C(v24, (uint64_t)v27);
            if (!*((unsigned char *)v30 + 24) && byte_100031F58) {
              syslog(4, "%s couldn't find matching port (%s)", "EAServicePublishCallback", v23);
            }
            _Block_object_dispose(&v29, 8);
            if (*(_DWORD *)(v17 + 148) != 2) {
              goto LABEL_23;
            }
            goto LABEL_58;
          }
          if (v21 == 2)
          {
            *(void *)(v18 + 200) = 0;
            *(void *)(v18 + 208) = 0;
            *(void *)(v18 + 192) = 0xFFFFFFFFLL;
LABEL_58:
            uint64_t v25 = entryID;
            if (byte_100031F58)
            {
              syslog(4, "%s Call EAServiceStateUpdate, eaDeviceID:%04llX, eaFunctGrpDevID:%04llX, true\n", "EAServicePublishCallback", v36, entryID);
              uint64_t v25 = entryID;
            }
            sub_100012238(v16, v36, v25, v34, 1);
          }
LABEL_23:
          io_object_t v9 = &qword_100032000;
LABEL_24:
          IOObjectRelease(v7);
          io_registry_entry_t v7 = IOIteratorNext(iterator);
        }
        while (v7);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EAServicePublishCallback");
  }
}

void sub_100012220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL a5)
{
  BOOL v5 = a5;
  if (byte_100031F58) {
    syslog(4, "%s ENTR eaDeviceID:%04llX, eaFunctGrpDevID:%04llX, bEAArrived:%d\n", "EAServiceStateUpdate", a2, a3, a5);
  }
  if (a3 | a2)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "EAProtocolTransportNotification");
    xpc_dictionary_set_BOOL(v9, "EAProtocolTransportConnectedState", v5);
    xpc_dictionary_set_uint64(v9, "EAProtocolTransportRegistryID", a3);
    xpc_dictionary_set_uint64(v9, "EAProtocolTransportUpstreamRegistryID", a4);
    objc_msgSend(objc_msgSend((id)qword_100032188, "iap2d_connection"), "sendMessage:", v9);
    xpc_release(v9);
  }
  else
  {
    syslog(3, "%s EAServiceStateUpdate trying to send eaDeviceID = %llu and eaFunctGrpDevID %llu to iap2, which is invalid\n", "EAServiceStateUpdate", 0, 0);
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EAServiceStateUpdate");
  }
}

void sub_10001236C(void *a1)
{
  kern_return_t v5;
  io_iterator_t v6;
  BOOL v7;
  kern_return_t v8;
  io_iterator_t v9;
  BOOL v10;
  __CFRunLoop *Main;

  if (byte_100031F58) {
    syslog(4, "%s ENTR\n", "EnableEAServiceNotifications");
  }
  CFMutableDictionaryRef v2 = IOServiceMatching("IOAccessoryEAInterface");
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    uint64_t v4 = a1[6];
    CFRetain(v2);
    BOOL v5 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v4 + 32), "IOServicePublish", v3, (IOServiceMatchingCallback)sub_100011D34, a1, (io_iterator_t *)(v4 + 88));
    io_object_t v6 = *(_DWORD *)(v4 + 88);
    if (v5) {
      io_registry_entry_t v7 = 1;
    }
    else {
      io_registry_entry_t v7 = v6 == 0;
    }
    if (v7)
    {
      syslog(3, "%s IOServiceAddMatchingNotification publish fail status:%02X, ioIter:%04X\n", "EnableEAServiceNotifications", v5, v6);
      CFRelease(v3);
    }
    else
    {
      sub_100011D34((uint64_t)a1, v6);
      uint64_t v8 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v4 + 32), "IOServiceTerminate", v3, (IOServiceMatchingCallback)sub_1000124F0, a1, (io_iterator_t *)(v4 + 92));
      xpc_object_t v9 = *(_DWORD *)(v4 + 92);
      if (v8) {
        io_object_t v10 = 1;
      }
      else {
        io_object_t v10 = v9 == 0;
      }
      if (v10)
      {
        syslog(3, "%s IOServiceAddMatchingNotification terminate fail status:%02X, ioIter:%04X\n", "EnableEAServiceNotifications", v8, v9);
      }
      else
      {
        sub_1000124F0((uint64_t)a1, v9);
        *(void *)(v4 + 80) = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v4 + 32));
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(v4 + 80), kCFRunLoopCommonModes);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EnableEAServiceNotifications");
  }
}

void sub_1000124F0(uint64_t a1, io_iterator_t iterator)
{
  if (byte_100031F58)
  {
    if ((void)xmmword_100032050 == a1) {
      uint64_t v4 = "E75";
    }
    else {
      uint64_t v4 = "CON";
    }
    syslog(4, "%s ENTR pAIDBRoot:%hhx (%s), eaIterator:%04X\n", "EAServiceTerminateCallback", a1, v4, iterator);
  }
  if (a1)
  {
    if (iterator)
    {
      io_object_t v5 = IOIteratorNext(iterator);
      if (v5)
      {
        io_registry_entry_t v6 = v5;
        io_registry_entry_t v7 = 0;
        uint64_t v8 = 0;
        do
        {
          uint64_t entryID = 0;
          uint64_t v9 = 0;
          if (!IORegistryEntryGetRegistryEntryID(v6, &entryID) && entryID)
          {
            io_object_t v10 = (void *)sub_10000B250(a1, (unint64_t)sub_10000D070, 0, (uint64_t)&entryID, 0);
            io_registry_entry_t v7 = v10;
            if (v10)
            {
              uint64_t v9 = v10[24];
              uint64_t entryID = v10[25];
              uint64_t v8 = v10[26];
            }
            else
            {
              uint64_t v9 = 0;
            }
          }
          uint64_t v11 = IOObjectRelease(v6);
          if (!v7) {
            io_registry_entry_t v7 = (void *)a1;
          }
          if (byte_100031F58) {
            syslog(4, "%s eaFunctGrpDevSvc:%04X matches pAIDBPort:%hhx\n", "EAServiceTerminateCallback", v6, v7);
          }
          if (v7 == (void *)a1) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = 4294967294;
          }
          v7[24] = v12;
          if (byte_100031F58) {
            syslog(4, "%s Call EAServiceStateUpdate, eaDeviceID:%04llX, eaFunctGrpDevID:%04llX, false\n", "EAServiceTerminateCallback", v9, entryID);
          }
          sub_100012238(v11, v9, entryID, v8, 0);
          v7[24] = 0;
          v7[25] = 0;
          v7[26] = 0;
          io_registry_entry_t v6 = IOIteratorNext(iterator);
        }
        while (v6);
      }
    }
  }
  if (byte_100031F58) {
    syslog(4, "%s EXIT\n", "EAServiceTerminateCallback");
  }
}

void sub_1000126C0(uint64_t a1, uint64_t a2)
{
  if (byte_100031F58)
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 236);
    int v5 = sub_100007C8C(a2);
    int v6 = sub_100007C98(a2);
    syslog(4, "%s Call StartPort, bIsE75To30PinAdapter:%d portNum:%d portMgrNum:%d, bCanPassData:%d\n", "EAServicePublishCallback_block_invoke", v4, v5, v6, *(unsigned __int8 *)(a2 + 40));
  }
  sub_100013CBC(a2, *(unsigned __int8 *)(*(void *)(a1 + 40) + 236));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

uint64_t sub_100012764()
{
  return 1;
}

uint64_t sub_10001276C()
{
  return 6;
}

const char *sub_100012774()
{
  return "APPLEIDBUS";
}

uint64_t sub_100012780()
{
  return 0;
}

uint64_t sub_100012788()
{
  return 1;
}

uint64_t sub_100012790()
{
  return 0;
}

uint64_t sub_100012798()
{
  return 0;
}

uint64_t sub_1000127A0()
{
  return 0;
}

uint64_t sub_1000127A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

void sub_100012890(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 16);
  if (v1 == 2)
  {
    uint64_t v3 = IOAccessoryPortSetUSBRoleSwitchMask();
    if (v3) {
      NSLog(@"%s:%s ERROR, couldn't set role switch mask for port number %d, error = %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "void CIapPortIOKit::SetRoleSwapMaskForUSBPort(UInt16, UInt16)", *(unsigned int *)(a1 + 16), v3);
    }
  }
  else
  {
    NSLog(@"%s:%s ERROR, accessoryPortNumber != kIOAccessoryPortIDUSB, it is %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "void CIapPortIOKit::SetRoleSwapMaskForUSBPort(UInt16, UInt16)", v1);
  }
}

uint64_t sub_100012A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007CEC(a1, a2, a3);
  *(void *)(v6 + 44) = 0;
  io_registry_entry_t v7 = (io_service_t *)(v6 + 44);
  *(void *)uint64_t v6 = off_10002D388;
  *(void *)(v6 + 64) = 0;
  uint64_t v8 = (CFRunLoopSourceRef *)(v6 + 64);
  *(void *)(v6 + 52) = 0;
  *(void *)(v6 + 72) = 0;
  *(unsigned char *)(v6 + 80) = 0;
  *(_DWORD *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 40) = 0;
  *(void *)(v6 + 88) = 0;
  *(unsigned char *)(v6 + 96) = 0;
  *(void *)(v6 + 104) = 0;
  io_service_t ServiceWithPort = IOAccessoryPortGetServiceWithPort();
  io_service_t *v7 = ServiceWithPort;
  if (ServiceWithPort && !IOServiceOpen(ServiceWithPort, mach_task_self_, 0, (io_connect_t *)(a1 + 12)))
  {
    CFRunLoopSourceRef *v8 = (CFRunLoopSourceRef)IOAccessoryPortCreateRunLoopSource();
    io_object_t v10 = IONotificationPortCreate(kIOMasterPortDefault);
    *(void *)(a1 + 48) = v10;
    if (*(void *)(a1 + 64))
    {
      if (v10)
      {
        if (!IOServiceAddInterestNotification(v10, *(_DWORD *)(a1 + 44), "IOGeneralInterest", (IOServiceInterestCallback)sub_100012CCC, (void *)a1, (io_object_t *)(a1 + 56)))
        {
          CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(a1 + 48));
          *(void *)(a1 + 72) = RunLoopSource;
          if (RunLoopSource)
          {
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(a1 + 72), kCFRunLoopCommonModes);
            BOOL v13 = CFRunLoopGetMain();
            CFRunLoopAddSource(v13, *v8, kCFRunLoopCommonModes);
            *(unsigned char *)(a1 + 80) = 1;
          }
        }
      }
    }
    if (*(_DWORD *)(a1 + 16) == 2) {
      *(void *)(a1 + 104) = [[IAPCarPlayConnectionObserver alloc] initWithPort:a1];
    }
  }
  if (!*(unsigned char *)(a1 + 80)) {
    NSLog(@"ERROR - %s:%s - %d could not create port 0x%x:0x%x", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "CIapPortIOKit", 214, a2, a3);
  }
  return a1;
}

void sub_100012BF4(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_100012C10(unsigned __int16 *a1, uint64_t a2)
{
  if (a1 && a2 && *a1 && (sub_1000084F4(a2) & 1) == 0)
  {
    int v4 = (char *)malloc_type_malloc(*a1, 0x100004077774924uLL);
    if (v4)
    {
      int v5 = v4;
      unsigned int v6 = *a1;
      memcpy(v4, a1 + 1, *a1);
      sub_100008A40(a2, v5, v6);
      free(v5);
    }
    else
    {
      NSLog(@"CIapPortIOKit::PortReceiveBuffer failed to copy buffer.");
    }
  }
}

void sub_100012CCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v16 = 0;
  io_object_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = a1;
  if (!a1) {
    goto LABEL_6;
  }
  if (a3 >> 4 == 239073280) {
    goto LABEL_3;
  }
  if (a3 <= -469794785)
  {
    if (a3 == -536870896)
    {
      NSLog(@"%s:%s - %d Got ServiceIsTerminated(%d) argument=%hhx, portID:%02X/%02X, ioSvc:%04X", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "PortNotifyEvent", 588, 3758096400, a4, *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 20), a2);
      sub_1000136EC(v17[3]);
    }
    else if (a3 == -536870608)
    {
      sub_1000137D0(a1, a2);
    }
  }
  else
  {
    if (a3 == -469794784)
    {
      [+[NSDate date] timeIntervalSince1970];
      uint64_t v11 = v17[3];
      if (*(double *)(v11 + 88) <= 0.0)
      {
        *(void *)(v11 + 88) = v10;
        int64_t v12 = 100000000;
      }
      else
      {
        int64_t v12 = 1;
      }
      dispatch_time_t v13 = dispatch_time(0, v12);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100013A30;
      v14[3] = &unk_10002D478;
      v14[4] = &v16;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
      goto LABEL_6;
    }
    if (a3 != -469794782)
    {
      if (a3 != -469794716 || !sub_1000163EC()) {
        goto LABEL_6;
      }
LABEL_3:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013A1C;
      block[3] = &unk_10002D478;
      void block[4] = &v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      int v6 = sub_100007C8C(v17[3]);
      xpc_dictionary_set_uint64(v5, "portNumber", v6);
      int v7 = sub_100007C98(v17[3]);
      xpc_dictionary_set_uint64(v5, "portManagerNumber", v7);
      unsigned int v8 = (*(uint64_t (**)(uint64_t))(*(void *)v17[3] + 80))(v17[3]);
      xpc_dictionary_set_uint64(v5, "portType", v8);
      xpc_dictionary_set_uint64(v5, "portID", v17[3]);
      xpc_dictionary_set_uint64(v5, "resistorID", (a3 + 469794816));
      xpc_dictionary_set_string(v5, "requestType", "resistorArrived");
      char v9 = sub_1000163E0();
      sub_1000089F8(v9);
      if (+[IAPTransportServer supportsIAPD]) {
        objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v5);
      }
      xpc_release(v5);
      goto LABEL_6;
    }
    if (a4
      && *(_DWORD *)(a1 + 16) == 2
      && !*(_WORD *)(a4 + 4)
      && *(_WORD *)(a4 + 2) == 1
      && objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isVehicleUIAllowed"))
    {
      NSLog(@"%s:%s Stark accessory role switch", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "PortNotifyEvent");
    }
  }
LABEL_6:
  _Block_object_dispose(&v16, 8);
}

void sub_100013058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void *sub_100013080(uint64_t a1)
{
  *(void *)a1 = off_10002D388;

  *(unsigned char *)(a1 + 80) = 0;
  if (*(void *)(a1 + 64))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, *(CFRunLoopSourceRef *)(a1 + 64), kCFRunLoopCommonModes);
    CFRelease(*(CFTypeRef *)(a1 + 64));
    *(void *)(a1 + 64) = 0;
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v3 = CFRunLoopGetMain();
    CFRunLoopRemoveSource(v3, *(CFRunLoopSourceRef *)(a1 + 72), kCFRunLoopCommonModes);
    *(void *)(a1 + 72) = 0;
  }
  io_object_t v4 = *(_DWORD *)(a1 + 56);
  if (v4)
  {
    IOObjectRelease(v4);
    *(_DWORD *)(a1 + 56) = 0;
  }
  xpc_object_t v5 = *(IONotificationPort **)(a1 + 48);
  if (v5)
  {
    IONotificationPortDestroy(v5);
    *(void *)(a1 + 48) = 0;
  }
  io_connect_t v6 = *(_DWORD *)(a1 + 12);
  if (v6)
  {
    IOServiceClose(v6);
    *(_DWORD *)(a1 + 12) = 0;
  }
  io_object_t v7 = *(_DWORD *)(a1 + 44);
  if (v7)
  {
    IOObjectRelease(v7);
    *(_DWORD *)(a1 + 44) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    sub_10001EA70(v8);
    *(void *)(a1 + 32) = 0;
  }
  char v9 = *(NSObject **)(a1 + 24);
  if (v9)
  {
    dispatch_release(v9);
    *(void *)(a1 + 24) = 0;
  }
  return sub_100007D60((void *)a1);
}

void sub_100013184(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_1000131A0(uint64_t a1)
{
  sub_100013080(a1);
  operator delete();
}

void sub_1000131E8()
{
}

uint64_t sub_10001320C(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 12) || !*(unsigned char *)(a1 + 40)) {
    return 6;
  }
  if (a2) {
    return IOAccessoryPortTransmitData();
  }
  return 22;
}

uint64_t sub_10001323C(int a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001333C;
  v3[3] = &unk_10002D428;
  int v4 = a1;
  v3[4] = a2;
  return sub_1000132AC((uint64_t)v3);
}

uint64_t sub_1000132AC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013D7C;
  v2[3] = &unk_10002D4A0;
  void v2[4] = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_100013D7C((uint64_t)v2);
  return pthread_mutex_unlock(&stru_100031C80);
}

uint64_t sub_10001333C(uint64_t a1, const void *a2, unsigned char *a3)
{
  *a3 = 1;
  uint64_t result = sub_100007C98((uint64_t)a2);
  if (result == *(_DWORD *)(a1 + 40))
  {
    if (a2) {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    *a3 = 1;
  }
  return result;
}

uint64_t sub_100013404(int a1)
{
  uint64_t v5 = 0;
  io_connect_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000134C4;
  v3[3] = &unk_10002D450;
  int v4 = a1;
  v3[4] = &v5;
  sub_1000132AC((uint64_t)v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_1000134AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000134C4(uint64_t a1, const void *a2, unsigned char *a3)
{
  *a3 = 1;
  uint64_t result = sub_100007C8C((uint64_t)a2);
  if (result == *(_DWORD *)(a1 + 40))
  {
    if (a2) {
    else
    }
      uint64_t result = 0;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sub_100013580(int a1)
{
  uint64_t v5 = 0;
  io_connect_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013640;
  v3[3] = &unk_10002D450;
  int v4 = a1;
  v3[4] = &v5;
  sub_1000132AC((uint64_t)v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_100013628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013640(uint64_t a1, const void *a2, unsigned char *a3)
{
  *a3 = 1;
  uint64_t result = sub_100007C98((uint64_t)a2);
  if (result == *(_DWORD *)(a1 + 40))
  {
    if (a2) {
    else
    }
      uint64_t result = 0;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    *a3 = 0;
  }
  return result;
}

void sub_1000136EC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 96))
  {
    *(unsigned char *)(a1 + 96) = 1;
    objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "detachIOKitPort:", a1);
    dispatch_time_t v2 = dispatch_time(0, 110000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000137A0;
    block[3] = &unk_10002CA98;
    void block[4] = a1;
    dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_1000137A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_1000137D0(uint64_t a1, uint64_t a2)
{
  uint64_t Port = IOAccessoryPortGetPort();
  Managerint PrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
  uint64_t TransportType = IOAccessoryPortGetTransportType();
  uint64_t v7 = *(unsigned int *)(a1 + 44);
  uint64_t v8 = sub_100007C8C(a1);
  uint64_t v9 = v8;
  if (v7 == a2)
  {
    if (v8 == Port)
    {
      if (sub_100007C98(a1) != ManagerPrimaryPort)
      {
        uint64_t v10 = *(unsigned int *)(a1 + 44);
        uint64_t v11 = sub_100007C8C(a1);
        uint64_t v12 = sub_100007C98(a1);
        NSLog(@"%s:%d (%d-%d/%d) service=%d type=%d newPort=%d newPortMgr=%d", "UpdatePortProperty", 483, v10, v11, v12, a2, TransportType, Port, ManagerPrimaryPort);
        *(_DWORD *)(a1 + 20) = ManagerPrimaryPort;
      }
    }
    else
    {
      uint64_t v13 = *(unsigned int *)(a1 + 44);
      uint64_t v14 = sub_100007C8C(a1);
      uint64_t v16 = sub_100007C98(a1);
      NSLog(@"%s:%d ERROR: Unexpeced port number Change! (%d-%d/%d) service=%d type=%d newPort=%d newPortMgr=%d", "UpdatePortProperty", 477, v13, v14, v16, a2, TransportType, Port, ManagerPrimaryPort);
    }
  }
  else
  {
    uint64_t v15 = sub_100007C98(a1);
    NSLog(@"%s:%d ERROR: service mismatch! (%d-%d/%d) service=%d type=%d newPort=%d newPortMgr=%d", "UpdatePortProperty", 493, v7, v9, v15, a2, TransportType, Port, ManagerPrimaryPort);
  }
}

void sub_10001392C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapPortManagerForDevPort:", a1);
  if (a2 == 128)
  {
    id v7 = [v6 service];
    if (a3 == 100) {
      int v8 = -469794716;
    }
    else {
      int v8 = a3 - 469794816;
    }
  }
  else
  {
    if (a2 != 8)
    {
      NSLog(@"%s:%s - %d Can't process eventType=%d event=%d", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortIOKit.mm", "PortNotifyEvent", 536, a2, a3);
      return;
    }
    id v7 = [v6 service];
    int v8 = -469794784;
  }
  sub_100012CCC(a1, (uint64_t)v7, v8, 0);
}

uint64_t sub_100013A1C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) + 88) = 0;
  return result;
}

uint64_t sub_100013A30(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (*(double *)(v1 + 88) <= 0.0) {
    return result;
  }
  uint64_t v2 = result;
  *(void *)(v1 + 88) = 0;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "portID", *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24));
  xpc_dictionary_set_string(v3, "requestType", "transportLeft");
  if (sub_100016474())
  {
    if (*(unsigned char *)(*(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) + 8))
    {
      objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"), "sendMessage:", v3);
      if (sub_1000163EC())
      {
        uint64_t v4 = *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24);
        if (!(*(unsigned int (**)(uint64_t))(*(void *)v4 + 80))(v4))
        {
          if (+[IAPTransportServer supportsIAPD])
          {
            objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v3);
            sub_1000163EC();
            goto LABEL_16;
          }
        }
      }
    }
  }
  if (!sub_1000163EC()) {
    goto LABEL_16;
  }
  uint64_t v5 = *(unsigned char **)(*(void *)(*(void *)(v2 + 32) + 8) + 24);
  if (!v5[8])
  {
    if (+[IAPTransportServer supportsIAPD])
    {
LABEL_15:
      objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v3);
      goto LABEL_16;
    }
    uint64_t v5 = *(unsigned char **)(*(void *)(*(void *)(v2 + 32) + 8) + 24);
  }
  if (!(*(unsigned int (**)(unsigned char *))(*(void *)v5 + 80))(v5)
    && +[IAPTransportServer supportsIAPD])
  {
    goto LABEL_15;
  }
LABEL_16:
  xpc_release(v3);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24);
  return sub_100007CB4(v6);
}

uint64_t sub_100013C08(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 2) {
    return 1;
  }
  if (sub_100007C98(a1) == 256) {
    return 11;
  }
  if ((int)sub_100007C98(a1) >= 6) {
    sub_100007C98(a1);
  }
  return 0;
}

BOOL sub_100013C6C(uint64_t a1)
{
  if (sub_100007CA4(*(_DWORD *)(a1 + 16))) {
    return 1;
  }
  int v3 = *(_DWORD *)(a1 + 20);
  return sub_100007CA4(v3);
}

void sub_100013CBC(uint64_t a1, int a2)
{
  uint64_t v4 = sub_100007C8C(a1);
  uint64_t v5 = sub_100007C98(a1);
  NSLog(@"StartPort (%d/%d)", v4, v5);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!a2) {
      return;
    }
  }
  else
  {
    *(unsigned char *)(a1 + 40) = 1;
    sub_100008A40(a1, 0, 0);
    sub_100016390(a1, 3);
    if (!a2) {
      return;
    }
  }
  id v6 = +[IAPTransportServer sharedIAPTransportServer];
  [v6 setHasAdaptor:1];
}

uint64_t sub_100013D7C(uint64_t result)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    uint64_t v2 = result;
    do
    {
      char v3 = 1;
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
      if (!v3) {
        break;
      }
      uint64_t v1 = (uint64_t *)v1[1];
    }
    while (v1 != &qword_100032038);
  }
  return result;
}

uint64_t sub_100013F08()
{
  return 1;
}

uint64_t sub_100013F10()
{
  return 0;
}

void sub_100013F18(void *a1)
{
  if (a1)
  {
    if ((*(unsigned int (**)(void *))(*a1 + 80))(a1) == 1)
    {
      uint64_t v2 = a1[36];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013FC8;
      block[3] = &unk_10002CA98;
      void block[4] = a1;
      dispatch_async(v2, block);
    }
  }
}

intptr_t sub_100013FC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(unsigned char *)(v1 + 278) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 200));
}

uint64_t sub_100013FDC(uint64_t a1, char a2, char a3, char a4, char a5, __int16 a6, __int16 a7, __int16 a8)
{
  uint64_t v16 = dispatch_semaphore_create(0);
  v19[0] = a1;
  v19[1] = dispatch_queue_create("com.apple.iaptransportd.usbHostPortQ", 0);
  char v20 = a2;
  char v21 = a3;
  char v22 = a4;
  char v23 = a5;
  __int16 v24 = a6;
  __int16 v25 = a7;
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v27 = v16;
  LOWORD(v26) = a8;
  __int16 v28 = &v29;
  uint64_t v29 = 0;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_create((pthread_t *)&v18, 0, (void *(__cdecl *)(void *))sub_1000140CC, v19))
  {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v16);
  }
  return v29;
}

void sub_1000140CC()
{
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2020000000;
  v0[3] = 0xAAAAAAAAAAAAAAAALL;
  operator new();
}

void sub_1000141B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000141F0(uint64_t a1)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  while (!*(unsigned char *)(a1 + 278))
  {
    v8[3] = 0;
    uint64_t v2 = *(NSObject **)(a1 + 184);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000143C4;
    block[3] = &unk_10002CDC0;
    void block[4] = &v7;
    void block[5] = a1;
    dispatch_sync(v2, block);
    uint64_t v3 = v8[3];
    if (v3)
    {
      sub_100008A40(a1, *(char **)(v3 + 16), *(_DWORD *)(v3 + 8));
      uint64_t v4 = *(NSObject **)(a1 + 128);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100014454;
      v5[3] = &unk_10002CDC0;
      v5[4] = &v7;
      void v5[5] = a1;
      dispatch_sync(v4, v5);
    }
    else
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 200), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  _Block_object_dispose(&v7, 8);
}

void sub_100014344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001435C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);
  dispatch_release(v3);
}

uint64_t sub_1000143C4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t result = sub_1000084F4((uint64_t)v2);
  if ((result & 1) == 0)
  {
    uint64_t v4 = v2[22];
    if (v4)
    {
      unint64_t v5 = v2[21];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(v2[18]
                                                                                          + ((v5 >> 6) & 0x3FFFFFFFFFFFFF8))
                                                                              + 8 * (v5 & 0x1FF));
      v2[21] = v5 + 1;
      v2[22] = v4 - 1;
      return sub_10000A30C((uint64_t)(v2 + 17), 1);
    }
  }
  return result;
}

void sub_100014454(uint64_t a1)
{
}

uint64_t sub_100014468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007CEC(a1, 2, 1);
  *(void *)uint64_t v4 = &off_10002D4F8;
  *(void *)(v4 + 48) = *(void *)a2;
  *(_OWORD *)(v4 + 80) = 0u;
  *(void *)(v4 + 64) = 0;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 168) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(void *)(v4 + 208) = 0;
  *(void *)(v4 + 232) = 0;
  *(_WORD *)(v4 + 240) = 8;
  *(_WORD *)(v4 + 242) = *(_WORD *)(a2 + 20);
  *(unsigned char *)(v4 + 244) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(v4 + 245) = 0;
  *(_OWORD *)(v4 + 248) = xmmword_100028AB0;
  *(_DWORD *)(v4 + 264) = 0;
  *(_DWORD *)(v4 + 268) = 0;
  *(_WORD *)(v4 + 272) = *(_WORD *)(a2 + 22);
  *(_WORD *)(v4 + 274) = *(_WORD *)(a2 + 24);
  *(unsigned char *)(v4 + 276) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(v4 + 277) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(v4 + 278) = 0;
  *(void *)(v4 + 280) = 0;
  unint64_t v5 = *(NSObject **)(a2 + 8);
  *(void *)(a1 + 288) = v5;
  io_registry_entry_t v24 = -1431655766;
  dispatch_retain(v5);
  *(void *)(a1 + 200) = dispatch_semaphore_create(0);
  *(void *)(a1 + 128) = dispatch_queue_create("com.apple.iapd.usbStackLock", 0);
  *(void *)(a1 + 184) = dispatch_queue_create("com.apple.iapd.usbQueueLock", 0);
  *(void *)(a1 + 192) = dispatch_queue_create("com.apple.iapd.usbWriteLock", 0);
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
  *(void *)(a1 + 208) = v7;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100014888;
  handler[3] = &unk_10002CA98;
  handler[4] = a1;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 208), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*(dispatch_object_t *)(a1 + 208));
  if (!(*(unsigned int (**)(void, io_registry_entry_t *))(**(void **)(a1 + 48) + 168))(*(void *)(a1 + 48), &v24))
  {
    uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(v24, (uint64_t *)(a1 + 56));
    if (RegistryEntryID) {
      NSLog(@"%s Error getting usb device ID: %u", "CIapPortUSBHost", RegistryEntryID);
    }
  }
  unsigned int v9 = *(unsigned __int16 *)(a1 + 272);
  if (*(_DWORD *)(a1 + 252) < v9)
  {
    if (v9 >= 0x1000) {
      unsigned int v9 = 4096;
    }
    *(_DWORD *)(a1 + 252) = v9;
  }
  size_t v21 = 8;
  uint64_t v22 = 0;
  int v10 = sysctlbyname("hw.cachelinesize", &v22, &v21, 0, 0);
  if (v10) {
    uint64_t v11 = 64;
  }
  else {
    uint64_t v11 = v22;
  }
  if (v10) {
    uint64_t v12 = -64;
  }
  else {
    uint64_t v12 = -v22;
  }
  unint64_t v13 = v11 + *(unsigned int *)(a1 + 252) + 24;
  uint64_t v14 = 8239;
  if (*(unsigned char *)(a2 + 16) == 2) {
    uint64_t v14 = 65919;
  }
  unint64_t v15 = (v13 + v14) / v13;
  *(void *)(a1 + 72) = v15;
  uint64_t v16 = *(NSObject **)(a1 + 128);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000149B8;
  block[3] = &unk_10002D598;
  void block[4] = a1;
  void block[5] = v13 * v15;
  void block[6] = v11;
  void block[7] = v12;
  void block[8] = v13;
  dispatch_sync(v16, block);
  if (*(unsigned char *)(a1 + 244) && *(_WORD *)(a1 + 242)) {
    operator new[]();
  }
  *(_DWORD *)(a1 + 268) = 120;
  uint64_t v17 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 48) + 32))(*(void *)(a1 + 48), a1 + 216);
  if (v17)
  {
    NSLog(@"CIapPortUSBHost::CIapPortUSBHost ERROR: Asynchronous event source create fail status: %08X\n", v17);
    *(unsigned char *)(a1 + 278) = 1;
  }
  else
  {
    *(void *)(a1 + 224) = 0;
    unint64_t v18 = objc_alloc_init(USBHostHelper);
    *(void *)(a1 + 296) = v18;
    [(USBHostHelper *)v18 setUsbHostPort:a1];
    [*(id *)(a1 + 296) start];
    if (*(unsigned char *)(a1 + 245))
    {
      --*(_DWORD *)(a1 + 248);
      sub_100014B2C(a1, 0);
    }
    else
    {
      sub_1000148D4(a1, 0);
    }
  }
  return a1;
}

void sub_10001485C(_Unwind_Exception *a1)
{
  sub_10000A1B0(v3);
  sub_10000A1B0(v2);
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

void sub_100014888(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 208), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  sub_1000148D4(v1, 0);
}

void sub_1000148D4(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 278))
  {
    BOOL v2 = *(_DWORD *)(a1 + 252) == a2 || *(unsigned char *)(a1 + 245) == 0;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v6[3] = 0;
    uint64_t v3 = *(NSObject **)(a1 + 128);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000156C8;
    v4[3] = &unk_10002D608;
    void v4[5] = v7;
    void v4[6] = a1;
    BOOL v5 = v2;
    void v4[4] = v6;
    dispatch_sync(v3, v4);
    _Block_object_dispose(v6, 8);
    _Block_object_dispose(v7, 8);
  }
}

uint64_t sub_1000149B8(uint64_t a1)
{
  uint64_t result = sub_1000084F4(*(void *)(a1 + 32));
  if ((result & 1) == 0)
  {
    operator new[]();
  }
  return result;
}

void sub_100014B04(id a1)
{
  qword_100031F78 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

void sub_100014B2C(uint64_t a1, int a2)
{
  if (a1 && !*(unsigned char *)(a1 + 278))
  {
    if (!a2)
    {
      uint64_t v3 = *(NSObject **)(a1 + 128);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015E20;
      block[3] = &unk_10002CA98;
      void block[4] = a1;
      dispatch_sync(v3, block);
      sub_1000148D4(a1, 0);
    }
    uint64_t v4 = (*(uint64_t (**)(void, void, void, void, uint64_t (*)(), uint64_t))(**(void **)(a1 + 48) + 264))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 244), *(void *)(*(void *)(a1 + 232) + 16), *(unsigned __int16 *)(a1 + 240), sub_100014B2C, a1);
    if (v4) {
      NSLog(@"CIapPortUSBHost::USBIntrPipeReadDone ERROR: ReadPipeAsync intr IN pipe read fail status: %08X\n", v4);
    }
  }
}

uint64_t sub_100014C10(uint64_t a1)
{
  *(void *)a1 = &off_10002D4F8;
  BOOL v2 = *(NSObject **)(a1 + 184);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F98;
  block[3] = &unk_10002CA98;
  void block[4] = a1;
  dispatch_sync(v2, block);
  uint64_t v3 = *(NSObject **)(a1 + 128);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014FF4;
  v22[3] = &unk_10002CA98;
  v22[4] = a1;
  dispatch_sync(v3, v22);
  uint64_t v4 = *(__CFRunLoopSource **)(a1 + 216);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    CFRelease(*(CFTypeRef *)(a1 + 216));
    *(void *)(a1 + 216) = 0;
    BOOL v5 = *(__CFRunLoop **)(a1 + 224);
    if (v5) {
      CFRunLoopStop(v5);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    sub_10001EA70(v6);
    *(void *)(a1 + 32) = 0;
  }
  if (*(void *)(a1 + 232)) {
    operator delete[]();
  }
  *(void *)(a1 + 232) = 0;
  if (*(void *)(a1 + 64)) {
    operator delete[]();
  }
  *(void *)(a1 + 64) = 0;
  uint64_t v7 = *(NSObject **)(a1 + 208);
  if (v7)
  {
    dispatch_source_cancel(v7);
    dispatch_release(*(dispatch_object_t *)(a1 + 208));
    *(void *)(a1 + 208) = 0;
  }
  int v8 = *(void **)(a1 + 280);
  if (v8)
  {

    *(void *)(a1 + 280) = 0;
  }
  *(unsigned char *)(a1 + 244) = 0;
  *(_WORD *)(a1 + 242) = 0;
  *(_DWORD *)(a1 + 272) = 0;
  *(_WORD *)(a1 + 276) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 192));
  dispatch_release(*(dispatch_object_t *)(a1 + 184));
  dispatch_sync(*(dispatch_queue_t *)(a1 + 128), &stru_10002D5B8);
  dispatch_release(*(dispatch_object_t *)(a1 + 128));
  dispatch_release(*(dispatch_object_t *)(a1 + 200));
  dispatch_release(*(dispatch_object_t *)(a1 + 288));
  id v10 = +[NSMutableArray array];
  context = v9;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = (void *)qword_100031F78;
  id v12 = [(id)qword_100031F78 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend((id)qword_100031F78, "objectForKey:", v15), "isEqualToNumber:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1)))objc_msgSend(v10, "addObject:", v15); {
      }
        }
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v12);
  }
  [(id)qword_100031F78 removeObjectsForKeys:v10];

  sub_10000A1B0((void *)(a1 + 136));
  sub_10000A1B0((void *)(a1 + 80));
  sub_100007D60((void *)a1);
  return a1;
}

void sub_100014F38(_Unwind_Exception *a1)
{
  sub_100007D60(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100014F98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = sub_1000084F4(v1);
  if ((result & 1) == 0)
  {
    for (uint64_t i = *(void *)(v1 + 176); i; uint64_t i = *(void *)(v1 + 176))
    {
      ++*(void *)(v1 + 168);
      *(void *)(v1 + 176) = i - 1;
      uint64_t result = sub_10000A30C(v1 + 136, 1);
    }
  }
  return result;
}

uint64_t sub_100014FF4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 48))
  {
    sub_100015054(*(void *)(result + 32), kCFBooleanFalse);
    (*(void (**)(void))(**(void **)(v1 + 48) + 72))(*(void *)(v1 + 48));
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(v1 + 48) + 24))(*(void *)(v1 + 48));
    *(void *)(v1 + 48) = 0;
  }
  return result;
}

void sub_100015054(uint64_t a1, void *a2)
{
  io_registry_entry_t entry = 0;
  uint64_t v4 = (*(uint64_t (**)(void, io_registry_entry_t *))(**(void **)(a1 + 48) + 168))(*(void *)(a1 + 48), &entry);
  io_registry_entry_t v5 = entry;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = entry == 0;
  }
  if (v6)
  {
    NSLog(@"CIapPortUSBHost::SignalUSBDriver ERROR: GetDevice fail status: %08X\n", v4);
    return;
  }
  if (*(void *)(a1 + 280))
  {
    if ([*(id *)(a1 + 280) count])
    {
      uint64_t v7 = *(void **)(a1 + 280);
      values[0] = a2;
      values[1] = v7;
      *(_OWORD *)keys = *(_OWORD *)off_10002D628;
      CFDictionaryRef v8 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      IORegistryEntrySetCFProperties(entry, v8);
      CFRelease(v8);
      return;
    }
    io_registry_entry_t v5 = entry;
  }
  IORegistryEntrySetCFProperty(v5, @"Authenticated", a2);
}

void sub_10001517C(uint64_t a1)
{
  sub_100014C10(a1);
  operator delete();
}

void sub_1000151C4()
{
}

uint64_t sub_1000151E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = a4;
  io_registry_entry_t v5 = *(NSObject **)(a1 + 288);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000152B8;
  block[3] = &unk_10002D5E0;
  void block[7] = a1;
  void block[8] = a2;
  void block[4] = a5;
  void block[5] = v9;
  void block[6] = &v11;
  dispatch_sync(v5, block);
  uint64_t v6 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1000152B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(void *)(v2 + 48) && *(unsigned char *)(v2 + 277) && !*(unsigned char *)(v2 + 278) && *(void *)(a1 + 64))
  {
    xpc_retain(*(xpc_object_t *)(a1 + 32));
    size_t length = 0;
    data = xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 32), "data", &length);
    uint64_t v4 = *(NSObject **)(v2 + 192);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000154F0;
    block[3] = &unk_10002CDC0;
    void block[4] = *(void *)(a1 + 40);
    void block[5] = v2;
    dispatch_sync(v4, block);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      operator new();
    }
    uint64_t v5 = (*(uint64_t (**)(void, void, const void *, void, uint64_t, uint64_t))(**(void **)(v2 + 48)
                                                                                           + 320))(*(void *)(v2 + 48), *(unsigned __int8 *)(v2 + 277), data, length, 1000, 2000);
    xpc_release(*(xpc_object_t *)(a1 + 32));
    if (v5)
    {
      NSLog(@"CIapPortUSBHost::PortTransmitData ERROR: WritePipe(Async)TO bulk OUT write fail status: %08X\n", v5);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 5;
    }
    uint64_t v6 = *(NSObject **)(v2 + 192);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000155DC;
    v7[3] = &unk_10002CA98;
    void v7[4] = v2;
    dispatch_sync(v6, v7);
  }
  else
  {
    NSLog(@"CIapPortUSBHost::PortTransmitData ERROR: Bulk OUT pipe or iAP packet not initialized\n");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 6;
  }
}

uint64_t sub_1000154F0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (++*(_DWORD *)(v1 + 264) > *(_DWORD *)(v1 + 268)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void *sub_100015524(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (*result && !*(unsigned char *)(v2 + 278))
    {
      uint64_t v3 = *(NSObject **)(v2 + 192);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015E9C;
      block[3] = &unk_10002CA98;
      void block[4] = v2;
      dispatch_sync(v3, block);
    }
    uint64_t v4 = (void *)v1[1];
    if (v4) {
      xpc_release(v4);
    }
    operator delete();
  }
  return result;
}

uint64_t sub_1000155DC(uint64_t result)
{
  return result;
}

BOOL sub_1000155F0(uint64_t a1)
{
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:a1];
  BOOL v4 = [(id)qword_100031F78 objectForKey:v3] != 0;
  return v4;
}

void sub_10001564C(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 184);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000156C0;
  block[3] = &unk_10002CA98;
  void block[4] = a1;
  dispatch_sync(v1, block);
}

void sub_1000156C0(uint64_t a1)
{
}

void sub_1000156C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(_DWORD *)(v2 + 248) || *(unsigned char *)(a1 + 56))
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 120);
      if (v3)
      {
        uint64_t v4 = v3 - 1;
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(*(void *)(v2 + 88)
                                                                                            + (((unint64_t)(*(void *)(v2 + 112) + v4) >> 6) & 0x3FFFFFFFFFFFFF8))
                                                                                + 8
                                                                                * ((*(void *)(v2 + 112) + v4) & 0x1FF));
        *(void *)(v2 + 120) = v4;
        sub_10000ABC0((void *)(v2 + 80), 1);
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(v2 + 120);
        if (!*(unsigned char *)(a1 + 56))
        {
          int v5 = *(_DWORD *)(v2 + 248) - 1;
LABEL_8:
          *(_DWORD *)(v2 + 248) = v5;
          goto LABEL_9;
        }
        int v5 = *(unsigned __int8 *)(v2 + 245);
        if (!*(unsigned char *)(v2 + 245)) {
          goto LABEL_8;
        }
      }
LABEL_9:
      uint64_t v6 = *(void *)(v2 + 48);
      if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        if (v6)
        {
          uint64_t v8 = (*(uint64_t (**)(void, void, void, void, void, void, void (*)(uint64_t, int, int)))(**(void **)(v2 + 48) + 328))(*(void *)(v2 + 48), *(unsigned __int8 *)(v2 + 276), *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16), *(unsigned int *)(v2 + 252), *(unsigned int *)(v2 + 256), *(unsigned int *)(v2 + 260), sub_100015880);
          if (v8 != -536870208 && v8 != 0) {
            NSLog(@"CIapPortUSBHost::HandleBulkReadComplete ERROR: ReadPipeAsyncTO bulk IN fail status: %08X\n", v8);
          }
        }
      }
      else if (v6)
      {
        if (*(unsigned char *)(a1 + 56)) {
          ++*(_DWORD *)(v2 + 248);
        }
        char v10 = *(NSObject **)(v2 + 208);
        dispatch_time_t v11 = dispatch_time(0, 16000000);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
    }
    while (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
         && !*(unsigned char *)(v2 + 278)
         && !*(unsigned char *)(v2 + 245));
  }
}

void sub_100015880(uint64_t a1, int a2, int a3)
{
  LODWORD(v3) = a3;
  if (sub_1000155F0(a1))
  {
    id v7 = objc_msgSend(objc_msgSend((id)qword_100031F78, "objectForKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1)), "unsignedLongLongValue");
    if (v7 && !*((unsigned char *)v7 + 278))
    {
      if (a2) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = v3;
      }
      if (v3)
      {
        v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
        gettimeofday(&v12, 0);
        *(void *)a1 = 1000 * v12.tv_sec + v12.tv_usec / 1000;
        *(_DWORD *)(a1 + 8) = v3;
        if (!*((unsigned char *)v7 + 278))
        {
          uint64_t v8 = *((void *)v7 + 23);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100015E34;
          block[3] = &unk_10002D070;
          void block[4] = v7;
          void block[5] = a1;
          dispatch_sync(v8, block);
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)v7 + 25));
        }
      }
      else if (!*((unsigned char *)v7 + 278))
      {
        unsigned int v9 = *((void *)v7 + 16);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100015E88;
        uint64_t v10[3] = &unk_10002D070;
        v10[4] = v7;
        void v10[5] = a1;
        dispatch_sync(v9, v10);
      }
      sub_1000148D4(v7, v3);
    }
  }
  else
  {
  }
}

void sub_100015A64(uint64_t a1)
{
}

void sub_100015A74(uint64_t a1)
{
}

void sub_100015A84(uint64_t a1, int a2, unsigned int a3)
{
  if (a2)
  {
    int v16 = 0;
    uint64_t v5 = (*(uint64_t (**)(void, int *))(**(void **)(a1 + 48) + 168))(*(void *)(a1 + 48), &v16);
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v16 == 0;
    }
    if (v6)
    {
      NSLog(@"%s:%s ERROR: GetDevice fail status: %08X\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortUSBHost.mm", "HandleNCMSupport", v5);
    }
    else
    {
      int valuePtr = 0x20000000;
      keys = @"NetworkInterfaceFlags";
      values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v8 = *(void **)(a1 + 280);
      if (!v8)
      {
        id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3 + 1];
        *(void *)(a1 + 280) = v9;
        sub_100015C24(v9, 0, a3 + 1);
        uint64_t v8 = *(void **)(a1 + 280);
      }
      uint64_t v10 = a3;
      if ((unint64_t)[v8 count] <= a3)
      {
        unint64_t v12 = a3 + 1;
        id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
        [v11 setArray:*(void *)(a1 + 280)];
        sub_100015C24(v11, (unint64_t)[*(id *)(a1 + 280) count], v12);

        *(void *)(a1 + 280) = v11;
      }
      else
      {
        id v11 = *(id *)(a1 + 280);
      }
      [v11 replaceObjectAtIndex:v10 withObject:v7];
      CFRelease(values);
      CFRelease(v7);
    }
  }
}

void sub_100015C24(void *a1, unint64_t a2, unint64_t a3)
{
  if (a2 < a3)
  {
    uint64_t v4 = a2;
    do
    {
      id v6 = objc_alloc_init((Class)NSDictionary);
      [a1 insertObject:v6 atIndex:v4];

      ++v4;
    }
    while (a3 != v4);
  }
}

void sub_100015C98(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a3 > 9)
  {
    syslog(4, "%s:%s-%d invalid HID function %d\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IapPortUSBHost.mm", "AddInterfaceAndHIDFunction", 1000, a3);
  }
  else
  {
    id v10 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a3), +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "IAPHIDAccessoryCategory", 4), 0);
    uint64_t v5 = *(void **)(a1 + 280);
    if (!v5)
    {
      id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a2 + 1];
      *(void *)(a1 + 280) = v6;
      sub_100015C24(v6, 0, a2 + 1);
      uint64_t v5 = *(void **)(a1 + 280);
    }
    uint64_t v7 = a2;
    if ((unint64_t)[v5 count] <= a2)
    {
      unint64_t v9 = a2 + 1;
      id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v9];
      [v8 setArray:*(void *)(a1 + 280)];
      sub_100015C24(v8, (unint64_t)[*(id *)(a1 + 280) count], v9);

      *(void *)(a1 + 280) = v8;
    }
    else
    {
      id v8 = *(id *)(a1 + 280);
    }
    [v8 replaceObjectAtIndex:v7 withObject:v10];
  }
}

uint64_t sub_100015E20(uint64_t result)
{
  return result;
}

void sub_100015E34(uint64_t a1)
{
  if ((sub_100007FD8(1) & 1) == 0)
  {
    uint64_t v2 = (void *)(*(void *)(a1 + 32) + 136);
    sub_100015EC8(v2, (void *)(a1 + 40));
  }
}

void sub_100015E88(uint64_t a1)
{
}

uint64_t sub_100015E9C(uint64_t result)
{
  return result;
}

uint64_t sub_100015EB0()
{
  return 1;
}

uint64_t sub_100015EB8()
{
  return 1;
}

uint64_t sub_100015EC0(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

void sub_100015EC8(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_100015F50(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_100015F50(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      CFStringRef v34 = (char *)sub_10000AB88(v5, v33);
      CFStringRef v35 = &v34[8 * (v33 >> 2)];
      CFComparisonResult v37 = &v34[8 * v36];
      BOOL v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    long long v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_10000A70C(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_10000A824((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    unint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      CFStringRef v34 = (char *)sub_10000AB88((uint64_t)(a1 + 3), v46);
      CFStringRef v35 = &v34[8 * (v46 >> 2)];
      CFComparisonResult v37 = &v34[8 * v47];
      BOOL v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      int v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_10000AB88((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_10000A944(&v54, &v53);
  int v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000AA5C((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_10001621C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100016268(io_service_t a1, uint64_t a2)
{
  io_connect_t connect = 0;
  uint64_t v4 = IOServiceOpen(a1, mach_task_self_, 0, &connect);
  if (v4)
  {
    uint64_t v5 = v4;
    NSLog(@"ERROR - %s:%s - %d IOServiceOpen failed %#x, didn't set powerMode(%d)\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "EnableAccessoryPowerForPortService", 249, v4, a2);
  }
  else
  {
    if (a1)
    {
      while (IOAccessoryManagerGetUpstreamService())
        ;
      int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      if (a2 == 1 && PrimaryPort == 256) {
        goto LABEL_9;
      }
    }
    if (a2 != 1
      && (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "isDeviceInLowPowerMode") & 1) != 0)
    {
LABEL_9:
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v7 = IOAccessoryManagerConfigurePower();
      uint64_t v5 = v7;
      if (v7) {
        NSLog(@"ERROR - %s:%s - %d IOAccessoryManagerConfigurePower failed %#x, didn't set powerMode(%d)\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "EnableAccessoryPowerForPortService", 279, v7, a2);
      }
    }
    IOServiceClose(connect);
  }
  return v5;
}

id sub_100016390(uint64_t a1, uint64_t a2)
{
  id result = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapPortManagerForDevPort:", a1);
  if (result) {
    return (id)(sub_100016268((io_service_t)[result service], a2) == 0);
  }
  return result;
}

uint64_t sub_1000163E0()
{
  return byte_100031F80;
}

BOOL sub_1000163EC()
{
  int out_token = 0;
  uint64_t state64 = 0;
  BOOL v0 = 0;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      BOOL v0 = state64 != 0;
    }
    else
    {
      BOOL v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL sub_100016474()
{
  int out_token = 0;
  uint64_t state64 = 0;
  BOOL v0 = 0;
  if (!notify_register_check("com.apple.iap2d.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      BOOL v0 = state64 != 0;
    }
    else
    {
      BOOL v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

uint64_t sub_100016500(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BB1C;
  v2[3] = &unk_10002CA98;
  void v2[4] = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_10001BB1C((uint64_t)v2);
  return pthread_mutex_unlock(&stru_100031C80);
}

uint64_t sub_100016590(unsigned char *a1)
{
  if ((*(unsigned int (**)(unsigned char *))(*(void *)a1 + 24))(a1)) {
    sub_1000166E0((uint64_t)a1);
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "portID", (uint64_t)a1);
  xpc_dictionary_set_string(v2, "requestType", "transportLeft");
  if (sub_1000163EC() && !a1[8] && +[IAPTransportServer supportsIAPD]) {
    objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v2);
  }
  if (sub_100016474() && a1[8]) {
    objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"), "sendMessage:", v2);
  }
  xpc_release(v2);
  uint64_t result = sub_100007C98((uint64_t)a1);
  if (result == 6)
  {
    byte_100031F80 = 0;
    sub_1000089B0(0);
    notify_set_state(dword_100031F84, byte_100031F80);
    return notify_post("com.apple.iapd.adaptor.AvailableChanged");
  }
  return result;
}

uint64_t sub_1000166E0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BC38;
  v2[3] = &unk_10002CA98;
  void v2[4] = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_10001BC38((uint64_t)v2);
  return pthread_mutex_unlock(&stru_100031C80);
}

void sub_1000167B4(id a1)
{
  qword_100031F90 = objc_alloc_init(IAPTransportServer);
}

uint64_t sub_10001691C(void *a1, io_iterator_t a2)
{
  [a1 updatePortManagers];
  uint64_t result = IOIteratorNext(a2);
  if (result)
  {
    io_registry_entry_t v5 = result;
    while (1)
    {
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v5, @"IOAccessoryDevicePort", kCFAllocatorDefault, 0);
      CFNumberRef v7 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v5, @"IOAccessoryPortManagerPrimaryPort", kCFAllocatorDefault, 0);
      CFNumberRef v8 = v7;
      if (CFProperty && v7 != 0) {
        break;
      }
      if (CFProperty) {
        goto LABEL_22;
      }
      if (v7) {
        goto LABEL_10;
      }
LABEL_11:
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(a2);
      io_registry_entry_t v5 = result;
      if (!result) {
        return result;
      }
    }
    uint64_t valuePtr = 0;
    int Value = CFNumberGetValue(CFProperty, kCFNumberIntType, (char *)&valuePtr + 4);
    if (Value && CFNumberGetValue(v8, kCFNumberIntType, &valuePtr))
    {
      uint64_t v11 = sub_100013404(SHIDWORD(valuePtr));
      if (v11 && (sub_1000136EC(v11), (uint64_t v12 = sub_100013404(SHIDWORD(valuePtr))) != 0))
      {
        uint64_t v13 = (unsigned int *)v12;
        uint64_t v14 = sub_100007C8C(v12);
        uint64_t v15 = sub_100007C98((uint64_t)v13);
        NSLog(@"%s WARNING: after ProcessTermiante, transport still found!!! (%d/%d) service=%04X", "__AccessoryManagerPortAdded", v14, v15, v13[11]);
        if (((*(uint64_t (**)(unsigned int *))(*(void *)v13 + 24))(v13) & 1) == 0) {
          sub_100016390((uint64_t)v13, 3);
        }
      }
      else
      {
        if (objc_msgSend(objc_msgSend(a1, "iapPortManagers"), "objectForKey:", v8)) {
          operator new();
        }
        NSLog(@"%s:%d NULL iapPortManager! portNumber=%d portManagerNumber=%d transport=%hhx", "__AccessoryManagerPortAdded", 1435, HIDWORD(valuePtr), valuePtr, 0);
      }
    }
LABEL_22:
    CFRelease(CFProperty);
    if (!v8) {
      goto LABEL_11;
    }
LABEL_10:
    CFRelease(v8);
    goto LABEL_11;
  }
  return result;
}

void sub_100016C34()
{
}

uint64_t sub_100016DF0(uint64_t a1, io_iterator_t a2)
{
  uint64_t v41 = 0;
  theInterface = 0;
  SInt32 theScore = 0;
  unsigned __int8 v39 = 0;
  uint64_t result = sub_100007FD8(1);
  if ((result & 1) == 0)
  {
    uint64_t result = IOIteratorNext(a2);
    if (result)
    {
      io_registry_entry_t v4 = result;
      uint64_t v5 = 0;
      do
      {
        io_registry_entry_t parent = 0;
        char v37 = 1;
        if (IORegistryEntryGetParentEntry(v4, "IOService", &parent))
        {
          NSLog(@"__iAPInterfaceDeviceArrivedCallback: IORegistryEntryGetParentEntry, error: %08x %8p\n", v5, theInterface);
        }
        else
        {
          uint64_t v36 = 0;
          io_registry_entry_t v14 = parent;
          CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
          CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
          if (!IOCreatePlugInInterfaceForService(v14, v15, v16, &v36, &theScore))
          {
            uint64_t v17 = v36;
            if (v36)
            {
              uint64_t v35 = 0;
              QueryInterface = (*v36)->QueryInterface;
              CFUUIDRef v19 = CFUUIDGetConstantUUIDWithBytes(0, 0x15u, 0x2Fu, 0xC4u, 0x96u, 0x48u, 0x91u, 0x11u, 0xD5u, 0x9Du, 0x52u, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
              CFUUIDBytes v20 = CFUUIDGetUUIDBytes(v19);
              if (((unsigned int (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v17, *(void *)&v20.byte0, *(void *)&v20.byte8, &v35))
              {
                BOOL v21 = 1;
              }
              else
              {
                BOOL v21 = v35 == 0;
              }
              if (!v21)
              {
                uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v35 + 144))();
                (*(void (**)(uint64_t))(*(void *)v35 + 24))(v35);
                if (v5)
                {
                  NSLog(@"__iAPInterfaceDeviceArrivedCallback: Unable to get bus speed, error: %08x %8p\n", v5, v35);
                  goto LABEL_26;
                }
              }
              ((void (*)(IOCFPlugInInterface **))(*v36)->Release)(v36);
            }
          }
        }
        CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
        CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
        uint64_t v5 = IOCreatePlugInInterfaceForService(v4, v6, v7, &theInterface, &theScore);
        IOObjectRelease(v4);
        CFNumberRef v8 = theInterface;
        if (v5 || !theInterface)
        {
          NSLog(@"__iAPInterfaceDeviceArrivedCallback: Unable to create a plug-in, error: %08x %8p\n", v5, theInterface);
        }
        else
        {
          unint64_t v9 = (*theInterface)->QueryInterface;
          CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x49u, 0x23u, 0xACu, 0x4Cu, 0x48u, 0x96u, 0x11u, 0xD5u, 0x92u, 8u, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
          CFUUIDBytes v11 = CFUUIDGetUUIDBytes(v10);
          int v12 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))v9)(v8, *(void *)&v11.byte0, *(void *)&v11.byte8, &v41);
          ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
          if (v12 || !v41)
          {
            NSLog(@"__iAPInterfaceDeviceArrivedCallback: could not create a device interface for the interface: 0x%016lx\n", v12);
            uint64_t v5 = 0;
          }
          else
          {
            uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v41 + 64))(v41);
            if (v13)
            {
              uint64_t v5 = v13;
              NSLog(@"__iAPInterfaceDeviceArrivedCallback: unable to open interface (%08x)\n", v13);
            }
            else
            {
              uint64_t v22 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v41 + 152))(v41, &v39);
              if (!v22)
              {
                __int16 v23 = 0;
                __int16 v30 = 0;
                char v31 = 0;
                __int16 v24 = 0;
                char v25 = 0;
                char v26 = 0;
                unsigned int v27 = -1;
                do
                {
                  LOBYTE(v35) = -86;
                  char v34 = -86;
                  char v33 = -86;
                  char v32 = -86;
                  LOWORD(v36) = -21846;
                  uint64_t v28 = (*(uint64_t (**)(uint64_t, void, uint64_t *, char *, char *, IOCFPlugInInterface ***, char *))(*(void *)v41 + 208))(v41, (v27 + 1), &v35, &v34, &v32, &v36, &v33);
                  uint64_t v5 = v28;
                  if (v28)
                  {
                    NSLog(@"__iAPInterfaceDeviceArrivedCallback: unable to get properties of pipe %d (%08x)\n", v27 + 1, v28);
                  }
                  else if (v32 == 3 && v35 == 1)
                  {
                    __int16 v24 = (__int16)v36;
                    char v26 = v27 + 1;
                  }
                  else if (v32 == 2 && v35 == 1)
                  {
                    __int16 v30 = (__int16)v36;
                    char v31 = v27 + 1;
                  }
                  else if (v32 == 2 && v35 == 0)
                  {
                    char v25 = v27 + 1;
                    __int16 v23 = (__int16)v36;
                  }
                  ++v27;
                }
                while (v27 < v39);
                if (v31 && v25 && v30)
                {
                  if (v23)
                  {
                    sub_10001AF80();
                    qword_100031FC8 = sub_100013FDC(v41, v37, v26, v31, v25, v24, v30, v23);
                    sub_100016500(qword_100031FC8);
                  }
                }
                goto LABEL_26;
              }
              uint64_t v5 = v22;
              NSLog(@"__iAPInterfaceDeviceArrivedCallback: unable to get number of endpoints (%08x)\n", v22);
              (*(void (**)(uint64_t))(*(void *)v41 + 72))(v41);
            }
            (*(void (**)(uint64_t))(*(void *)v41 + 24))(v41);
          }
        }
LABEL_26:
        uint64_t result = IOIteratorNext(a2);
        io_registry_entry_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t sub_100017364(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v4 = result;
    do
    {
      sub_10001AF80();
      uint64_t v5 = IOObjectRelease(v4);
      if (v5) {
        NSLog(@"__iAPInterfaceDeviceRemovedCallback: Could not release bulk device object: 0x%08x", v5);
      }
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v4 = result;
    }
    while (result);
  }
  return result;
}

void sub_100017498(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 128));
  dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)(a1 + 32) + 136), &stru_10002D670);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 136), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 136));
  if (!*(void *)(*(void *)(a1 + 32) + 136)) {
    sub_10001F680();
  }
}

void sub_100017524(id a1)
{
  uint64_t v1 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "shutdownQ");
  if (v1)
  {
    dispatch_sync(v1, &stru_10002D690);
  }
}

void sub_10001756C(id a1)
{
  if ((objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "isShuttingDown") & 1) == 0)
  {
    sub_1000175D8(3, 0);
    objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "checkXPCConnections");
    id v1 = +[IAPTransportServer sharedIAPTransportServer];
    [v1 sendValidAccResistorIDToIAPD];
  }
}

id sub_1000175D8(uint64_t a1, int a2)
{
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  if (!a2 || !IOAccessoryManagerGetPowerDuringSleep()) {
    sub_100016268(ServiceWithPrimaryPort, a1);
  }
  IOObjectRelease(ServiceWithPrimaryPort);
  id result = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "bHasConnectionCON");
  if (a1 != 1 && result)
  {
    uint64_t v6 = qword_100031FA8;
    return (id)sub_10001166C(v6, a1);
  }
  return result;
}

void sub_100017740(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 128));
  xpc_object_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 152);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001781C;
  handler[3] = &unk_10002CAB8;
  int v4 = *(_DWORD *)(a1 + 40);
  dispatch_source_set_event_handler(v2, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 152), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 152));
  if (!*(void *)(*(void *)(a1 + 32) + 152)) {
    sub_10001F680();
  }
}

void sub_10001781C(uint64_t a1)
{
  xpc_object_t v2 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "shutdownQ");
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000178AC;
    block[3] = &unk_10002CAB8;
    int v4 = *(_DWORD *)(a1 + 32);
    dispatch_sync(v2, block);
  }
}

id sub_1000178AC(uint64_t a1)
{
  id result = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "isShuttingDown");
  if ((result & 1) == 0)
  {
    NSLog(@"%s:%d Turning Acc Power ON for portService: %u", "-[IAPTransportServer startAccPowerTimer:ForPortService:]_block_invoke_3", 1811, *(unsigned int *)(a1 + 32));
    sub_100016268(*(_DWORD *)(a1 + 32), 3);
    objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "checkXPCConnections");
    id v3 = +[IAPTransportServer sharedIAPTransportServer];
    return [v3 sendValidAccResistorIDToIAPD];
  }
  return result;
}

void sub_1000179D8(uint64_t a1)
{
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x2020000000;
  v19[3] = qword_100031F98;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  xpc_object_t v2 = *(unsigned char **)(a1 + 32);
  char v18 = v2[189];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = qword_100031FA0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = v2[191];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = qword_100031FA8;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = v2[190];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  void v9[3] = sub_100017CF4;
  v9[4] = sub_100017D04;
  id v10 = (id)0xAAAAAAAAAAAAAAAALL;
  id v10 = +[IAPTransportServer sharedIAPTransportServer];
  *(void *)(*(void *)(a1 + 32) + 168) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 128));
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_100017CF4;
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  v8[4] = sub_100017D04;
  v8[5] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017D10;
  v7[3] = &unk_10002D730;
  void v7[4] = v9;
  void v7[5] = v17;
  void v7[6] = v19;
  v7[7] = v11;
  v7[8] = v13;
  v7[9] = v14;
  v7[10] = v16;
  v7[11] = v8;
  dispatch_source_set_event_handler(v3, v7);
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  dispatch_time_t v5 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 40));
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 168));
  if (!*(void *)(*(void *)(a1 + 32) + 168))
  {
    _os_assert_log();
    uint64_t v6 = _os_crash();
    sub_10001F6DC(v6);
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void sub_100017C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100017CF4(uint64_t a1, uint64_t a2)
{
}

void sub_100017D04(uint64_t a1)
{
}

void sub_100017D10(uint64_t a1)
{
  xpc_object_t v2 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "shutdownQ");
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017DD0;
    block[3] = &unk_10002D708;
    long long v3 = *(_OWORD *)(a1 + 48);
    long long v5 = *(_OWORD *)(a1 + 32);
    long long v6 = v3;
    long long v7 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    dispatch_sync(v2, block);
  }
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

id sub_100017DD0(void *a1)
{
  id result = [*(id *)(*(void *)(a1[4] + 8) + 40) isShuttingDown];
  if ((result & 1) == 0)
  {
    [*(id *)(*(void *)(a1[4] + 8) + 40) _listenForAccessoryPortChanges];
    sub_1000175D8(3, 0);
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      sub_100011688(*(void **)(*(void *)(a1[6] + 8) + 24));
      sub_10001236C(*(void **)(*(void *)(a1[6] + 8) + 24));
    }
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      sub_100011688(*(void **)(*(void *)(a1[8] + 8) + 24));
      sub_10001236C(*(void **)(*(void *)(a1[8] + 8) + 24));
      sub_10001166C(*(void *)(*(void *)(a1[8] + 8) + 24), 3);
    }
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24)) {
      sub_100011688(*(void **)(*(void *)(a1[10] + 8) + 24));
    }
    [*(id *)(*(void *)(a1[4] + 8) + 40) checkXPCConnections];
    long long v3 = *(void **)(*(void *)(a1[4] + 8) + 40);
    return [v3 sendValidAccResistorIDToIAPD];
  }
  return result;
}

id sub_100017F60(uint64_t a1)
{
  int out_token = -1;
  id result = (id)notify_register_check("com.apple.iapd.notify.availability", &out_token);
  if (!result)
  {
    uint64_t v4 = 0;
    notify_get_state(out_token, &v4);
    if (v4 == 1)
    {
      notify_set_state(out_token, 0);
      notify_post("com.apple.iapd.notify.availability");
    }
    id result = (id)notify_cancel(out_token);
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 209))
  {
    id v3 = +[IAPTransportServer sharedIAPTransportServer];
    if (+[IAPTransportServer supportsIAPD])
    {
      [*(id *)(*(void *)(a1 + 32) + 216) setDisconnectBlock:0];

      *(void *)(*(void *)(a1 + 32) + 216) = 0;
    }
    [v3 cleanupPhysicalConnectorConnections];
    sub_100006450(1);
    [v3 cleanupStaleClientPorts:1];
    sub_1000175D8(1, 0);
    return [v3 startAccPowerTimer:1250];
  }
  return result;
}

id sub_1000180DC(uint64_t a1)
{
  int out_token = -1;
  id result = (id)notify_register_check("com.apple.iap2d.notify.availability", &out_token);
  if (!result)
  {
    uint64_t v4 = 0;
    notify_get_state(out_token, &v4);
    if (v4 == 1)
    {
      notify_set_state(out_token, 0);
      notify_post("com.apple.iap2d.notify.availability");
    }
    id result = (id)notify_cancel(out_token);
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 209))
  {
    id v3 = +[IAPTransportServer sharedIAPTransportServer];
    [*(id *)(*(void *)(a1 + 32) + 224) setDisconnectBlock:0];

    *(void *)(*(void *)(a1 + 32) + 224) = 0;
    [v3 cleanupPhysicalConnectorConnections];
    sub_100006450(2);
    [v3 cleanupStaleClientPorts:2];
    sub_1000175D8(1, 0);
    return [v3 startAccPowerTimer:1250];
  }
  return result;
}

uint64_t sub_100018378(uint64_t result)
{
  id v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    uint64_t v2 = result;
    do
    {
      id v3 = (unsigned char *)v1[2];
      if (!(*(unsigned int (**)(unsigned char *))(*(void *)v3 + 80))(v3)
        || (id result = (*(uint64_t (**)(unsigned char *))(*(void *)v3 + 80))(v3), result == 1))
      {
        id result = sub_100007CB4((uint64_t)v3);
        v3[10] = *(unsigned char *)(v2 + 32);
      }
      id v1 = (uint64_t *)v1[1];
    }
    while (v1 != &qword_100032038);
  }
  return result;
}

uint64_t sub_1000184A4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100018538;
  v2[3] = &unk_10002D6B8;
  void v2[4] = *(void *)(a1 + 32);
  pthread_mutex_lock(&stru_100031C80);
  sub_100018538((uint64_t)v2);
  return pthread_mutex_unlock(&stru_100031C80);
}

void sub_100018538(uint64_t a1)
{
  for (uint64_t i = (uint64_t *)qword_100032040; i != &qword_100032038; uint64_t i = (uint64_t *)i[1])
  {
    uint64_t v5 = 0;
    long long v6 = &v5;
    uint64_t v7 = 0x2020000000;
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = i[2];
    if (!(*(unsigned int (**)(unint64_t))(*(void *)v8 + 80))(v8)
      || (*(unsigned int (**)(uint64_t))(*(void *)v6[3] + 80))(v6[3]) == 1)
    {
      id v3 = *(NSObject **)(*(void *)(a1 + 32) + 232);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001869C;
      block[3] = &unk_10002D478;
      void block[4] = &v5;
      dispatch_async(v3, block);
    }
    _Block_object_dispose(&v5, 8);
  }
}

void sub_100018684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001869C(uint64_t a1)
{
  id v2 = +[IAPTransportServer sharedIAPTransportServer];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return [v2 detachIOKitPort:v3];
}

id sub_100018920(uint64_t a1, uint64_t a2)
{
  id v3 = +[IAPTransportServer sharedIAPTransportServer];
  return [v3 radioPreferencesChanged:a2];
}

void sub_100018FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sub_100019044()
{
  NSLog(@"Logging preferences changed! (IAPTransportServer)");
  return sub_10001D598();
}

id sub_100019074(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) iapDisconnect];
}

id sub_100019084(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) iap2Disconnect];
}

void sub_10001963C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001965C(IONotificationPort **a1, io_iterator_t iterator)
{
  id v3 = *a1;
  io_object_t notification = -1431655766;
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v5 = result;
    do
    {
      sub_10001BD60(v5);
      IOServiceAddInterestNotification(v3, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_10001BE4C, 0, &notification);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_1000196F8(uint64_t a1, xpc_object_t object)
{
  id v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue((xpc_connection_t)object, v3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001BE68;
    handler[3] = &unk_10002D8D8;
    void handler[4] = object;
    void handler[5] = v3;
    xpc_connection_set_event_handler((xpc_connection_t)object, handler);
    xpc_connection_resume((xpc_connection_t)object);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(object, _xpc_error_key_description);
    NSLog(@"_xpc_iaptransportd_handle_incoming_request connection error: %s\n", string);
  }
  else
  {
    io_registry_entry_t v5 = xpc_copy_description(object);
    NSLog(@"_xpc_iaptransportd_handle_incoming_request unexpected event: %s\n", v5);
    free(v5);
  }
}

void sub_100019824(int a1, int a2, int a3, intptr_t notificationID)
{
  switch(a3)
  {
    case -536870288:
      io_connect_t v4 = dword_100031FB4;
      IOAllowPowerChange(v4, notificationID);
      break;
    case -536870144:
      sub_1000175D8(3, 0);
      id v5 = +[IAPTransportServer sharedIAPTransportServer];
      [v5 sendValidAccResistorIDToIAPD];
      break;
    case -536870272:
      IOAllowPowerChange(dword_100031FB4, notificationID);
      if (!sub_1000163EC() && !sub_100016474())
      {
        sub_1000175D8(1, 1);
      }
      break;
  }
}

id sub_1000198FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) bringdownPlatform];
}

void sub_100019F18(id a1)
{
  id v1 = +[IAPTransportServer sharedIAPTransportServer];
  [v1 iapDisconnect];
}

void sub_100019F48(id a1)
{
  id v1 = +[IAPTransportServer sharedIAPTransportServer];
  [v1 iap2Disconnect];
}

void sub_10001A18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

id *sub_10001A1C0(id *result)
{
  uint64_t v1 = qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    id v2 = result;
    while (1)
    {
      uint64_t result = (id *)(*(uint64_t (**)(void))(**(void **)(v1 + 16) + 80))(*(void *)(v1 + 16));
      if (!result)
      {
        uint64_t result = (id *)[v2[4] iapPortManagerForDevPort:*(void *)(v1 + 16)];
        if (result)
        {
          uint64_t result = (id *)[result accResistorID];
          *(_DWORD *)(*((void *)v2[5] + 1) + 24) = result;
          if (*(_DWORD *)(*((void *)v2[5] + 1) + 24) <= 0xFu) {
            break;
          }
        }
      }
      uint64_t v1 = *(void *)(v1 + 8);
      if ((uint64_t *)v1 == &qword_100032038) {
        return result;
      }
    }
    *(unsigned char *)(*((void *)v2[6] + 1) + 24) = 1;
    *(void *)(*((void *)v2[7] + 1) + 24) = *(void *)(v1 + 16);
  }
  return result;
}

void sub_10001A2D0()
{
  for (uint64_t i = (uint64_t *)qword_100032040; i != &qword_100032038; uint64_t i = (uint64_t *)i[1])
  {
    uint64_t v1 = i[2];
    if (!(*(unsigned int (**)(uint64_t))(*(void *)v1 + 80))(v1)
      || (*(unsigned int (**)(uint64_t))(*(void *)v1 + 80))(v1) == 1)
    {
      objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "setWiredPortPacketParsingState:", 1);
      xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v2, "portID", v1);
      xpc_dictionary_set_string(v2, "requestType", "transportLeft");
      if (sub_1000163EC() && +[IAPTransportServer supportsIAPD]) {
        objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "sendMessage:", v2);
      }
      if (sub_100016474()) {
        objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"), "sendMessage:", v2);
      }
      xpc_release(v2);
      if (sub_100007C98(v1) == 6) {
        sub_1000089B0(0);
      }
    }
  }
}

id sub_10001A4D8(id result)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    id v2 = result;
    do
    {
      id v3 = (unsigned char *)v1[2];
      uint64_t result = (id)(*(uint64_t (**)(unsigned char *))(*(void *)v3 + 80))(v3);
      if (result == 10)
      {
        int v4 = *((_DWORD *)v2 + 10);
        if (v4 == 3) {
          goto LABEL_10;
        }
        if (v4 != 2)
        {
          if (v4 != 1 || v3[8]) {
            goto LABEL_11;
          }
LABEL_10:
          uint64_t result = [*((id *)v2 + 4) _detachClientPort:v3];
          goto LABEL_11;
        }
        if (v3[8]) {
          goto LABEL_10;
        }
      }
LABEL_11:
      uint64_t v1 = (uint64_t *)v1[1];
    }
    while (v1 != &qword_100032038);
  }
  return result;
}

void *sub_10001A98C(void *result)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    id v2 = result;
    while (1)
    {
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1[2] + 80))(v1[2]);
      if (result == 10)
      {
        uint64_t result = [(id)sub_10000A198(v1[2]) compare:v2[4]];
        if (!result) {
          break;
        }
      }
      uint64_t v1 = (uint64_t *)v1[1];
      if (v1 == &qword_100032038) {
        return result;
      }
    }
    id v3 = (void *)v2[5];
    uint64_t v4 = v1[2];
    return [v3 _detachClientPort:v4];
  }
  return result;
}

void *sub_10001AAF4(void *result)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    id v2 = result;
    while (1)
    {
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v1[2] + 80))(v1[2]);
      if (result == 10)
      {
        uint64_t result = [(id)sub_10000A198(v1[2]) compare:v2[4]];
        if (!result) {
          break;
        }
      }
      uint64_t v1 = (uint64_t *)v1[1];
      if (v1 == &qword_100032038) {
        return result;
      }
    }
    id v3 = (void *)v2[5];
    uint64_t v4 = v1[2];
    return [v3 _detachClientPort:v4];
  }
  return result;
}

id *sub_10001AC5C(id *result)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    id v2 = result;
    do
    {
      uint64_t result = (id *)(*(uint64_t (**)(uint64_t))(*(void *)v1[2] + 80))(v1[2]);
      if (result == 10)
      {
        uint64_t result = (id *)sub_10000A1A0(v1[2]);
        if (result == v2[4]) {
          uint64_t result = (id *)[v2[5] _detachClientPort:v1[2]];
        }
      }
      uint64_t v1 = (uint64_t *)v1[1];
    }
    while (v1 != &qword_100032038);
  }
  return result;
}

void sub_10001ADB4(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    while ((*(unsigned int (**)(uint64_t))(*(void *)v1[2] + 80))(v1[2]) != 10
         || [(id)sub_10000A198(v1[2]) compare:*(void *)(a1 + 32)])
    {
      uint64_t v1 = (uint64_t *)v1[1];
      if (v1 == &qword_100032038) {
        return;
      }
    }
    uint64_t v3 = v1[2];
    uint64_t v4 = *(void *)(a1 + 40);
    unsigned int v5 = *(unsigned __int16 *)(a1 + 48);
    sub_100009E3C(v3, v4, v5);
  }
}

void sub_10001AF80()
{
  uint64_t v0 = qword_100031FC8;
  if (qword_100031FC8)
  {
    sub_100016590((unsigned char *)qword_100031FC8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D4E0;
    block[3] = &unk_10002CA98;
    void block[4] = v0;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    qword_100031FC8 = 0;
  }
}

intptr_t sub_10001B0AC(uint64_t a1)
{
  return sub_100009518(*(void *)(a1 + 32));
}

void sub_10001B190()
{
}

id sub_10001B1A4()
{
  id v0 = +[IAPTransportServer sharedIAPTransportServer];
  return [v0 stopServer:0];
}

uint64_t sub_10001BB1C(uint64_t a1)
{
  id v2 = operator new(0x18uLL);
  v2[2] = *(void *)(a1 + 32);
  uint64_t v3 = qword_100032038;
  *id v2 = qword_100032038;
  v2[1] = &qword_100032038;
  *(void *)(v3 + 8) = v2;
  qword_100032038 = (uint64_t)v2;
  ++qword_100032048;
  uint64_t result = sub_10001D528(1);
  if (result)
  {
    unsigned int v5 = (uint64_t *)qword_100032040;
    if ((uint64_t *)qword_100032040 != &qword_100032038)
    {
      int v6 = 0;
      do
      {
        uint64_t v7 = v5[2];
        if (v7)
        {
          int v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 80))(v5[2]);
          syslog(4, "iaptransportd::AddPortToList Port #%d: %hhx, portType: %d\n", v6++, v7, v8);
        }
        unsigned int v5 = (uint64_t *)v5[1];
      }
      while (v5 != &qword_100032038);
    }
    uint64_t v9 = __stderrp;
    return fflush(v9);
  }
  return result;
}

uint64_t sub_10001BC38(uint64_t a1)
{
  sub_100007E70((uint64_t)&qword_100032038, (void *)(a1 + 32));
  uint64_t result = sub_10001D528(1);
  if (result)
  {
    id v2 = (uint64_t *)qword_100032040;
    if ((uint64_t *)qword_100032040 != &qword_100032038)
    {
      int v3 = 0;
      do
      {
        uint64_t v4 = v2[2];
        if (v4)
        {
          int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 80))(v2[2]);
          syslog(4, "iaptransportd::RemovePortFromList Port #%d: %hhx, portType: %d\n", v3++, v4, v5);
        }
        id v2 = (uint64_t *)v2[1];
      }
      while (v2 != &qword_100032038);
    }
    int v6 = __stderrp;
    return fflush(v6);
  }
  return result;
}

void sub_10001BD30(id a1)
{
  if (!byte_100031FD0) {
    byte_100031FD0 = sub_100006864();
  }
}

void sub_10001BD60(io_registry_entry_t a1)
{
  CFMutableDictionaryRef properties = 0;
  id v2 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    objc_msgSend(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"CurrentCapacity"), "intValue");
    objc_msgSend(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"MaxCapacity"), "intValue");
    byte_100031FB8 = objc_msgSend(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"ExternalConnected"), "BOOLValue");
    objc_msgSend(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"IsCharging"), "BOOLValue");
    if (byte_100031FB8 != byte_100031FD1)
    {
      objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "updateSleepAssertionState");
      byte_100031FD1 = byte_100031FB8;
    }
    CFRelease(properties);
  }
}

void sub_10001BE4C(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200) {
    sub_10001BD60(a2);
  }
}

void sub_10001BE68(uint64_t a1, void *a2)
{
  id v4 = +[IAPTransportServer sharedIAPTransportServer];
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
      NSLog(@"_xpc_iaptransportd_handle_incoming_request event error: %s\n", string);
      [v4 deleteClientPortsUsingConnection:*(void *)(a1 + 32)];
      uint64_t v13 = *(_xpc_connection_s **)(a1 + 32);
      xpc_connection_cancel(v13);
    }
    return;
  }
  int v5 = xpc_dictionary_get_string(a2, "requestType");
  if (!v5)
  {
    NSLog(@"RequestType not specified in xpc message!");
    int v5 = "<nil>";
  }
  if (!strcmp(v5, "transmitData"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      uint64_t v7 = reply;
      int v8 = -536870212;
      *(void *)&long long length = 0;
      uint64 = (unsigned char *)xpc_dictionary_get_uint64(a2, "portID");
      data = xpc_dictionary_get_data(a2, "data", (size_t *)&length);
      BOOL v11 = xpc_dictionary_get_BOOL(a2, "waitSendDone");
      sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request::transmitData: portAddr = %llu, dataCFIndex Length = %lu waitSendDone: %d\n", uint64, (void)length, v11);
      if (uint64 && sub_10001D080((uint64_t)uint64) && (void)length && uint64[10]) {
        int v8 = (*(uint64_t (**)(unsigned char *, const void *))(*(void *)uint64 + 16))(uint64, data);
      }
      xpc_dictionary_set_int64(v7, "result", v8);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v7);
      xpc_release(v7);
    }
    else
    {
      NSLog(@"ERROR: Client sent kXPCTransmitDataStr xpc message without a reply context");
    }
  }
  if (!strcmp(v5, "IAPClientPortRegisterStr"))
  {
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long length = v14;
    long long v85 = v14;
    xpc_dictionary_get_audit_token();
    v83[0] = length;
    v83[1] = v85;
    if (sub_10001D158(v83))
    {
      char v15 = xpc_dictionary_get_string(a2, "IAPClientPortUUIDStr");
      if (v15)
      {
        CFUUIDRef v16 = v15;
        sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request handling kXPCIAPClientPortRegisterStr for uuid: %s\n", v15);
        objc_msgSend(v4, "registerClientPortAccessory:connection:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16), *(void *)(a1 + 32));
      }
    }
  }
  if (!strcmp(v5, "IAPClientPortUnregisterStr"))
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long length = v17;
    long long v85 = v17;
    xpc_dictionary_get_audit_token();
    v82[0] = length;
    v82[1] = v85;
    if (sub_10001D158(v82))
    {
      char v18 = xpc_dictionary_get_string(a2, "IAPClientPortUUIDStr");
      if (v18)
      {
        CFUUIDRef v19 = v18;
        sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request handling kXPCIAPClientPortUnregisterStr for uuid: %s\n", v18);
        objc_msgSend(v4, "unregisterClientPortAccessory:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
      }
    }
  }
  if (!strcmp(v5, "dataArrived"))
  {
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long length = v22;
    long long v85 = v22;
    xpc_dictionary_get_audit_token();
    v81[0] = length;
    v81[1] = v85;
    if (sub_10001D158(v81))
    {
      size_t v80 = 0;
      __int16 v23 = xpc_dictionary_get_string(a2, "IAPClientPortUUIDStr");
      __int16 v24 = xpc_dictionary_get_data(a2, "data", &v80);
      if (v23)
      {
        char v25 = v24;
        if (v24)
        {
          sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request handling kXPCDataArrivedStr for uuid: %s with %lu bytes\n", v23, v80);
          char v26 = +[NSString stringWithUTF8String:v23];
          [v4 clientPortReceivedData:v26 dataPtr:v25 length:(unsigned __int16)v80];
        }
      }
    }
    return;
  }
  if (strcmp(v5, "setPortLockout"))
  {
    if (!strcmp(v5, "getPortLockout"))
    {
      xpc_object_t v34 = xpc_dictionary_create_reply(a2);
      if (!v34)
      {
        NSLog(@"ERROR: Client sent kXPCGetPortLockoutStr xpc message without a reply context", v76, v77, v78);
        return;
      }
      uint64_t v35 = v34;
      uint64_t v36 = -536870212;
      uint64_t v37 = xpc_dictionary_get_uint64(a2, "portID");
      sub_10001D548(1, @"%s:%s-%d portAddr = %llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 636, v37);
      if (v37)
      {
        if (sub_10001D080(v37))
        {
          LOBYTE(v37) = sub_1000084F4(v37);
          uint64_t v36 = 0;
        }
        else
        {
          LOBYTE(v37) = 0;
        }
      }
      xpc_dictionary_set_uint64(v35, "result", v36);
      uint64_t v45 = "bAuthLockout";
    }
    else
    {
      if (strcmp(v5, "getHasE75To30PinAdapter"))
      {
        if (!strcmp(v5, "USBHostHIDComponentInfo"))
        {
          uint64_t v40 = xpc_dictionary_get_uint64(a2, "portID");
          sub_10001D548(1, @"%s:%s-%d USBHostHIDComponentInfo for portAddr %llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 683, v40);
          if (v40 && sub_10001D080(v40))
          {
            uint64_t v41 = xpc_dictionary_get_uint64(a2, "interfaceNumber");
            uint64_t v42 = xpc_dictionary_get_uint64(a2, "HIDFunctionType");
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v40 + 48))(v40, v41, v42);
          }
        }
        else if (!strcmp(v5, "NativeBTHIDComponentInfoStr"))
        {
          uint64_t v43 = xpc_dictionary_get_uint64(a2, "portID");
          sub_10001D548(1, @"%s:%s-%d NativeBTHIDComponent for portAddr %llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 701, v43);
          if (v43
            && sub_10001D080(v43)
            && (*(unsigned int (**)(uint64_t))(*(void *)v43 + 80))(v43) == 2)
          {
            uint64_t v44 = xpc_dictionary_get_uint64(a2, "HIDFunctionType");
            NSLog(@"Found hidFunctionType %d for BT port", v44);
            (*(void (**)(uint64_t, uint64_t))(*(void *)v43 + 56))(v43, v44);
          }
        }
        else
        {
          if (!strcmp(v5, "kBTHIDPriorityHigh"))
          {
            uint64_t v46 = xpc_dictionary_get_uint64(a2, "portID");
            *(void *)&long long length = 0;
            *((void *)&length + 1) = &length;
            *(void *)&long long v85 = 0x3052000000;
            *((void *)&v85 + 1) = sub_100017CF4;
            uint64_t v47 = *(NSObject **)(a1 + 40);
            v86 = sub_100017D04;
            v87 = v47;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001D260;
            block[3] = &unk_10002CDC0;
            void block[4] = &length;
            void block[5] = v46;
            dispatch_async(v47, block);
            _Block_object_dispose(&length, 8);
            return;
          }
          if (!strcmp(v5, "kBTHIDPriorityDefault"))
          {
            uint64_t v50 = xpc_dictionary_get_uint64(a2, "portID");
            dispatch_set_target_queue(*(dispatch_object_t *)(a1 + 40), 0);
            if (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"))
            {
              objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "setTargetQueue:", 0);
            }
            if (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"))
            {
              objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"), "setTargetQueue:", 0);
            }
            if (v50
              && sub_10001D080(v50)
              && (*(unsigned int (**)(uint64_t))(*(void *)v50 + 80))(v50) == 2)
            {
              sub_100006B18(v50, 0);
            }
            if (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue"))
            {
              objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "setiaptransportdhighPriorityRootQueue:", 0);
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(length) = 136315138;
              *(void *)((char *)&length + 4) = off_100031EC0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#%s] resetting target queue to default", (uint8_t *)&length, 0xCu);
            }
          }
          else
          {
            if (strcmp(v5, "handleAuthenticationPassed"))
            {
              if (strcmp(v5, "handleAuthenticationFailed"))
              {
                if (strcmp(v5, "getPortAppleIDAuthState"))
                {
                  if (!strcmp(v5, "ping"))
                  {
                    sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request::ping");
                    return;
                  }
                  if (!strcmp(v5, "iapdTransportListStates"))
                  {
                    BOOL v63 = xpc_dictionary_get_BOOL(a2, "transportListContainsItems");
                    sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request::iapdTransportListStates listContainsItems: %d\n", v63);
                    [v4 setIapdPortListContainsItems:v63];
                  }
                  else
                  {
                    if (strcmp(v5, "iap2dTransportListStates"))
                    {
                      if (strcmp(v5, "deviceUUID"))
                      {
                        if (!strcmp(v5, "IAPShutdownIapTransportPort"))
                        {
                          if (byte_100031FB0 == 1)
                          {
                            sub_10001D548(1, @"Handling the kXPCShutdownIapTransportPortStr XPC message");
                            uint64_t v73 = xpc_dictionary_get_uint64(a2, "portID");
                            if (v73)
                            {
                              uint64_t v74 = v73;
                              if (sub_10001D080(v73))
                              {
                                if ((*(unsigned int (**)(uint64_t))(*(void *)v74 + 80))(v74) == 10) {
                                  [v4 detachClientPort:v74];
                                }
                              }
                            }
                          }
                        }
                        else if (!strcmp(v5, "accessoryPowerDisable"))
                        {
                          v75 = (const void *)xpc_dictionary_get_uint64(a2, "portID");
                          if (xpc_dictionary_get_uint64(a2, "portType") == 1 {
                            && v75
                          }
                            && sub_10001D080((uint64_t)v75)
                            && (*(unsigned int (**)(const void *))(*(void *)v75 + 80))(v75) == 1
                          {
                            sub_10001AF80();
                          }
                        }
                        else if (!strcmp(v5, "accessoryPowerToggle"))
                        {
                          CFUUIDBytes v20 = (unsigned int *)xpc_dictionary_get_uint64(a2, "portID");
                          if (!xpc_dictionary_get_uint64(a2, "portType")
                            && v20
                            && sub_10001D080((uint64_t)v20)
                            && !(*(unsigned int (**)(unsigned int *))(*(void *)v20 + 80))(v20))
                          {
                            uint64_t UpstreamService = IOAccessoryManagerGetUpstreamService();
                            NSLog(@"SR: %s:%d Toggling Acc Power for service: %u, upstreamService: %u", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 1070, v20[11], UpstreamService);
                            [v4 toggleAccessoryPowerForPortService:UpstreamService];
                          }
                        }
                        return;
                      }
                      xpc_object_t v71 = xpc_dictionary_create_reply(a2);
                      if (!v71)
                      {
                        NSLog(@"ERROR: Client sent kXPCIAPTransportDeviceUUIDStr xpc message without a reply context", v76, v77, v78);
                        return;
                      }
                      uint64_t v35 = v71;
                      xpc_dictionary_set_BOOL(v71, "isValid", 0);
                      id v72 = objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "deviceUUIDStr");
                      sub_10001D548(1, @"Handling the kXPCIAPTransportDeviceUUIDStr XPC message, uuid: %@\n", v72);
                      if (v72)
                      {
                        xpc_dictionary_set_string(v35, "uuid", (const char *)[v72 UTF8String]);
                        uint64_t v45 = "isValid";
                        BOOL v48 = v35;
                        BOOL v49 = 1;
                        goto LABEL_86;
                      }
LABEL_87:
                      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v35);
                      xpc_release(v35);
                      return;
                    }
                    BOOL v64 = xpc_dictionary_get_BOOL(a2, "transportListContainsItems");
                    sub_10001D548(1, @"_xpc_iaptransportd_handle_incoming_request::iap2dTransportListStates listContainsItems: %d\n", v64);
                    [v4 setIap2dPortListContainsItems:v64];
                  }
                  [v4 updateDeviceUUIDState];
                  [v4 updateSleepAssertionState];
                  return;
                }
                xpc_object_t v58 = xpc_dictionary_create_reply(a2);
                if (!v58)
                {
                  NSLog(@"ERROR: Client sent kXPCGetPortAppleIDAuthState xpc message without a reply context", v76, v77, v78);
                  return;
                }
                uint64_t v35 = v58;
                uint64_t v59 = xpc_dictionary_get_uint64(a2, "portID");
                uint64_t v60 = v59;
                *(void *)&long long length = 0;
                size_t v80 = 0;
                if (v59 && sub_10001D080(v59)) {
                  uint64_t v61 = sub_10000D104(v60, &v80);
                }
                else {
                  uint64_t v61 = 0;
                }
                xpc_dictionary_set_uint64(v35, "portID", v60);
                xpc_dictionary_set_uint64(v35, "portAppleIDAuthState", v61);
                if (v80) {
                  xpc_dictionary_set_data(v35, "portAppleIDAuthCertCaps", (const void *)v80, 0x20uLL);
                }
                if ((void)length) {
                  xpc_dictionary_set_string(v35, "portAppleIDAuthCertSerial", (const char *)[(id)length UTF8String]);
                }
                goto LABEL_87;
              }
              long long v55 = (unsigned __int8 *)xpc_dictionary_get_uint64(a2, "portID");
              uint64_t v56 = xpc_dictionary_get_uint64(a2, "daemonMakingRequest");
              sub_10001D548(1, @"%s:%s-%d authentication failed for portAddr %llu and daemonType %d\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 884, v55, v56);
              if (!v55 || !sub_10001D080((uint64_t)v55)) {
                return;
              }
              if (!v55[9]) {
                goto LABEL_145;
              }
              if (v56)
              {
                if (v56 == 1)
                {
                  uint64_t v57 = v55[8];
                  if (!v55[8]) {
                    goto LABEL_147;
                  }
LABEL_145:
                  (*(void (**)(unsigned __int8 *))(*(void *)v55 + 72))(v55);
                  return;
                }
                uint64_t v57 = v55[8];
              }
              else
              {
                if (!v55[8]) {
                  goto LABEL_145;
                }
                uint64_t v57 = 1;
              }
LABEL_147:
              NSLog(@"ERROR - Skipping HandleAuthenticationFailed! port->m_bIAPVersionDetermined = %d, daemonType = %d, port->m_bIAP2 = %d", v55[9], v56, v57);
              return;
            }
            uint64_t v51 = xpc_dictionary_get_uint64(a2, "portID");
            sub_10001D548(1, @"%s:%s-%d authentication passed for portAddr %llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 806, v51);
            if (v51 && sub_10001D080(v51))
            {
              int v52 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 80))(v51);
              BOOL v53 = xpc_dictionary_get_BOOL(a2, "hasNCM");
              if (v53)
              {
                uint64_t v54 = xpc_dictionary_get_uint64(a2, "NCMInterfaceNumber");
                sub_10001D548(1, @"%s:%s-%d hasNCM interface at interface number %d\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 823, v54);
              }
              else
              {
                uint64_t v54 = 0xFFFFFFFFLL;
              }
              (*(void (**)(uint64_t, BOOL, uint64_t))(*(void *)v51 + 40))(v51, v53, v54);
              (*(void (**)(uint64_t))(*(void *)v51 + 64))(v51);
              uint64_t v62 = 1;
              if (v52 && v52 != 11)
              {
                if (v52 == 1) {
                  uint64_t v62 = 2;
                }
                else {
                  uint64_t v62 = 0;
                }
              }
              [v4 setIoAccPortID:v62];
              v65 = &qword_100031FA8;
              if (v52 != 11) {
                v65 = &qword_100031F98;
              }
              uint64_t v66 = *v65;
              if (*v65)
              {
                *(void *)&long long length = 0;
                v67 = xpc_dictionary_get_data(a2, "authenticationCertCaps", (size_t *)&length);
                v68 = v67;
                if (v67 && (void)length == 32)
                {
                  v69 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
                  if (v69)
                  {
                    v70 = v69;
                    memcpy(v69, v68, length);
                    sub_10000FA9C(v66, 2, v62, v70);
                    free(v70);
                    return;
                  }
                }
                else
                {
                  sub_10001D548(1, @"%s:%d Length of cert caps %lu does not match iAPAuthCertCapsInt_t = %lu, pAuthCertCaps = %hhx", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", 865, (void)length, 32, v67);
                }
                uint64_t v31 = v66;
                int v32 = 2;
                int v33 = v62;
LABEL_62:
                sub_10000FA9C(v31, v32, v33, 0);
                return;
              }
            }
          }
        }
        return;
      }
      xpc_object_t v38 = xpc_dictionary_create_reply(a2);
      if (!v38)
      {
        NSLog(@"ERROR: Client sent kXPCGetHasE75To30PinAdapter xpc message without a reply context", v76, v77, v78);
        return;
      }
      uint64_t v35 = v38;
      if (qword_100031F98)
      {
        LOBYTE(v37) = (*(uint64_t (**)(uint64_t))(*(void *)qword_100031F98 + 160))(qword_100031F98);
        uint64_t v39 = 0;
      }
      else
      {
        LOBYTE(v37) = 0;
        uint64_t v39 = -536870212;
      }
      xpc_dictionary_set_uint64(v35, "result", v39);
      uint64_t v45 = "bHasE75To30PinAdapter";
    }
    BOOL v48 = v35;
    BOOL v49 = v37;
LABEL_86:
    xpc_dictionary_set_BOOL(v48, v45, v49);
    goto LABEL_87;
  }
  uint64_t v27 = xpc_dictionary_get_uint64(a2, "portID");
  sub_10001D548(1, @"%s:%s-%d portAddr = %llu\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportServer.mm", "_xpc_iaptransportd_handle_incoming_request_block_invoke", 588, v27);
  if (v27 && sub_10001D080(v27))
  {
    int v28 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 80))(v27);
    (*(void (**)(uint64_t))(*(void *)v27 + 32))(v27);
    if (v28) {
      uint64_t v29 = 2 * (v28 == 1);
    }
    else {
      uint64_t v29 = 1;
    }
    [v4 setIoAccPortID:v29];
    __int16 v30 = &qword_100031FA8;
    if (v28 != 11) {
      __int16 v30 = &qword_100031F98;
    }
    uint64_t v31 = *v30;
    if (*v30)
    {
      int v32 = 1;
      int v33 = v29;
      goto LABEL_62;
    }
  }
}

uint64_t sub_10001D080(uint64_t a1)
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001D498;
  v3[3] = &unk_10002CDC0;
  v3[4] = &v4;
  void v3[5] = a1;
  pthread_mutex_lock(&stru_100031C80);
  sub_10001D498((uint64_t)v3);
  pthread_mutex_unlock(&stru_100031C80);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001D140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10001D158(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v1;
  id v2 = SecTaskCreateWithAuditToken(0, &token);
  if (v2)
  {
    int v3 = v2;
    CFErrorRef error = 0;
    CFBooleanRef v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, @"com.apple.iaptransportd.clientport", &error);
    if (v4)
    {
      CFBooleanRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v5);
        BOOL v8 = Value != 0;
        CFRelease(v5);
        CFErrorRef v9 = error;
        if (!error)
        {
LABEL_13:
          CFRelease(v3);
          return v8;
        }
        if (Value)
        {
          BOOL v8 = 1;
LABEL_11:
          CFRelease(v9);
          goto LABEL_13;
        }
LABEL_10:
        NSLog(@"Unable to get entitlement '%@', error: %@", @"com.apple.iaptransportd.clientport", v9);
        BOOL v8 = 0;
        CFErrorRef v9 = error;
        goto LABEL_11;
      }
      CFRelease(v5);
    }
    CFErrorRef v9 = error;
    if (!error)
    {
      BOOL v8 = 0;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  NSLog(@"Unable to create security task from audit token.");
  return 0;
}

void sub_10001D260(uint64_t a1)
{
  sched_param v7 = (sched_param)0xAAAAAAAAAAAAAAAALL;
  int v6 = -1431655766;
  id v2 = pthread_self();
  pthread_getschedparam(v2, &v6, &v7);
  v7.sched_priority = 63;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v10.__opaque[24] = v3;
  *(_OWORD *)&v10.__opaque[40] = v3;
  *(_OWORD *)&v10.__sig = v3;
  *(_OWORD *)&v10.__opaque[8] = v3;
  pthread_attr_init(&v10);
  pthread_attr_setschedparam(&v10, &v7);
  if (!objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue"))
  {
    [+[NSString stringWithFormat:@"com.apple.iaptransport.iaptransportdhighPriorityRootQueue"] UTF8String];
    CFBooleanRef v4 = dispatch_pthread_root_queue_create();
    objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "setiaptransportdhighPriorityRootQueue:", v4);
    dispatch_release(v4);
  }
  dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (dispatch_queue_t)objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_attr_t buf = 136315138;
    CFErrorRef v9 = off_100031EC0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#%s] high priority queue is set in iaptransportd", buf, 0xCu);
  }
  if (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"))
  {
    objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iapd_connection"), "setTargetQueue:", objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue"));
  }
  if (objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"))
  {
    objc_msgSend(objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iap2d_connection"), "setTargetQueue:", objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "iaptransportdhighPriorityRootQueue"));
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5
    && sub_10001D080(v5)
    && (*(unsigned int (**)(uint64_t))(*(void *)v5 + 80))(v5) == 2)
  {
    sub_100006B18(v5, 1);
  }
}

uint64_t sub_10001D498(uint64_t result)
{
  long long v1 = (uint64_t *)qword_100032040;
  if ((uint64_t *)qword_100032040 != &qword_100032038)
  {
    while (v1[2] != *(void *)(result + 40))
    {
      long long v1 = (uint64_t *)v1[1];
      if (v1 == &qword_100032038) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void sub_10001D4E0(uint64_t a1)
{
}

uint64_t start()
{
  objc_msgSend(+[IAPTransportServer sharedIAPTransportServer](IAPTransportServer, "sharedIAPTransportServer"), "run");
  return 0;
}

BOOL sub_10001D528(char a1)
{
  return (qword_100031FF0 & (1 << a1)) != 0;
}

void sub_10001D548(char a1, NSString *format, ...)
{
  va_start(va, format);
  if ((qword_100031FF0 & (1 << a1)) != 0) {
    NSLogv(format, va);
  }
}

uint64_t sub_10001D598()
{
  NSLog(@"Loading logging preferences... (IAPTLogging)");
  qword_100031FF0 = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"Logging", @"com.apple.iaptransportd", 0);
  if (result) {
    qword_100031FF0 |= 2uLL;
  }
  return result;
}

void sub_10001D880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D898(uint64_t a1, uint64_t a2)
{
}

void sub_10001D8A8(uint64_t a1)
{
}

id sub_10001D8B4(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void sub_10001D9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001D9DC(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void sub_10001DAE4(uint64_t a1, uint64_t a2)
{
}

void sub_10001DAF4(uint64_t a1)
{
}

void sub_10001DB00(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v1;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void *sub_10001DC4C(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 24);
  if (v1 != (void *)result[5])
  {
    id v2 = result;

    *(void *)(v2[4] + 24) = [(id)v2[5] copy];
    long long v3 = (void *)v2[4];
    return [v3 _reloadEventHandler];
  }
  return result;
}

void *sub_10001DD24(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 40);
  if (v1 != (void *)result[5])
  {
    id v2 = result;

    *(void *)(v2[4] + 40) = [(id)v2[5] copy];
    long long v3 = (void *)v2[4];
    return [v3 _reloadEventHandler];
  }
  return result;
}

void sub_10001DDFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(NSObject **)(a1 + 40);
  CFBooleanRef v4 = *(NSObject **)(v2 + 32);
  if (v4 != v3)
  {
    if (v4)
    {
      dispatch_release(v4);
      uint64_t v2 = *(void *)(a1 + 32);
      long long v3 = *(NSObject **)(a1 + 40);
    }
    *(void *)(v2 + 32) = v3;
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (v5)
    {
      dispatch_retain(v5);
    }
  }
}

void sub_10001DFBC(uint64_t a1, _xpc_connection_s *object)
{
  if (object == (_xpc_connection_s *)&_xpc_error_connection_invalid)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  }
  else if (object != (_xpc_connection_s *)&_xpc_error_connection_interrupted)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001E120;
      void v9[3] = &unk_10002D950;
      uint64_t v8 = *(void *)(a1 + 32);
      long long v10 = *(_OWORD *)(a1 + 40);
      v9[4] = v8;
      void v9[5] = object;
      xpc_connection_set_event_handler(object, v9);
      xpc_connection_resume(object);
    }
    else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (v4)
      {
        uint64_t v5 = *(void (**)(void))(v4 + 16);
        v5();
      }
    }
    return;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      sched_param v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t sub_10001E120(uint64_t result, void *a2)
{
  if (a2 == &_xpc_error_connection_invalid)
  {
    *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  }
  else if (a2 != &_xpc_error_connection_interrupted)
  {
    uint64_t v2 = *(void *)(result + 56);
    if (v2) {
      return (*(uint64_t (**)(void))(v2 + 16))(*(void *)(result + 56));
    }
    return result;
  }
  if (*(unsigned char *)(*(void *)(result + 32) + 49))
  {
    id result = *(void *)(result + 48);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t sub_10001E188(uint64_t a1)
{
  *(void *)a1 = off_10002D9A8;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 104) = 0xFFFF00000000;
  *(_WORD *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 119) = 0;
  *(_DWORD *)(a1 + 124) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v3.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v3, 0);
  *(void *)(a1 + 56) = 1000 * v3.tv_sec + v3.tv_usec / 1000;
  ++dword_1000321B8;
  return a1;
}

void sub_10001E254()
{
}

uint64_t sub_10001E2A4(uint64_t result)
{
  *(void *)id result = off_10002D9A8;
  *(unsigned char *)(result + 112) = 0;
  if (*(void *)(result + 32)) {
    operator delete[]();
  }
  *(_WORD *)(result + 110) = 0;
  *(_WORD *)(result + 106) = 0;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = 0;
  *(_DWORD *)(result + 40) = 0;
  *(void *)(result + 80) = 0;
  *(void *)(result + 88) = 0;
  --dword_1000321B8;
  return result;
}

void sub_10001E330(uint64_t a1)
{
  sub_10001E2A4(a1);
  operator delete();
}

uint64_t sub_10001E368(uint64_t a1, uint64_t a2, char *__src, unint64_t a4, void *a5, unsigned char *a6)
{
  uint64_t v6 = a5;
  *a6 = 0;
  int v8 = *(unsigned __int8 *)(a1 + 112);
  if ((v8 - 1) > 0xF)
  {
    uint64_t result = 102;
    char v12 = __src;
    goto LABEL_90;
  }
  if (v8 == 1 || (unint64_t v10 = *(unsigned int *)(a1 + 72), !v10) || a2 - *(void *)(a1 + 64) <= v10)
  {
    *(void *)(a1 + 64) = a2;
    char v12 = __src;
    if (!a4)
    {
LABEL_86:
      if (*(unsigned __int8 *)(a1 + 112) >= 0x11u) {
        uint64_t result = 0;
      }
      else {
        uint64_t result = 36;
      }
      uint64_t v6 = a5;
      goto LABEL_90;
    }
    LOBYTE(v13) = 0;
    long long v14 = 0;
    char v15 = (unsigned char *)(a1 + 116);
    uint64_t v46 = (void *)(a1 + 80);
    unint64_t v16 = a4;
    long long v17 = __src;
    while (1)
    {
      if ((v13 & 1) == 0)
      {
        char v12 = v17 + 1;
        unsigned int v21 = *v17;
        uint64_t v20 = v16 - 1;
        switch(*(unsigned char *)(a1 + 112))
        {
          case 1:
            goto LABEL_21;
          case 2:
            if (v21 >= 2)
            {
              if (v21 == 2) {
                unsigned char *v15 = 1;
              }
              *(void *)(a1 + 16) = 0;
              *(_DWORD *)(a1 + 40) = v21;
              operator new[]();
            }
            if (*v17) {
              goto LABEL_84;
            }
            LOBYTE(v13) = 0;
            char v24 = 3;
            goto LABEL_25;
          case 3:
            LOBYTE(v13) = 0;
            *(unsigned char *)(a1 + 113) += v21;
            *(_WORD *)(a1 + 104) = (_WORD)v21 << 8;
            char v24 = 4;
            goto LABEL_25;
          case 4:
            *(void *)(a1 + 16) = 0;
            *(unsigned char *)(a1 + 113) += v21;
            unsigned __int16 v25 = *(_WORD *)(a1 + 104) + v21;
            *(_WORD *)(a1 + 104) = v25;
            if (*(unsigned char *)(a1 + 120)) {
              unsigned int v26 = 9;
            }
            else {
              unsigned int v26 = 2;
            }
            if (v26 <= v25)
            {
              *(_DWORD *)(a1 + 40) = v25;
              operator new[]();
            }
            goto LABEL_84;
          case 5:
            if (v21 > 0xE) {
              goto LABEL_84;
            }
            *(unsigned char *)(a1 + 113) += v21;
            *(unsigned char *)(*(void *)(a1 + 88))++ = v21;
            *(_DWORD *)(a1 + 44) = v21;
            *(_WORD *)(a1 + 108) = 0;
            __int16 v27 = *(_WORD *)(a1 + 104);
            *(_WORD *)(a1 + 110) = v27 - 2;
            *(_WORD *)(a1 + 104) = v27 - 1;
            if (v21 == 4)
            {
              if ((unsigned __int16)(v27 - 1) < 2u)
              {
LABEL_84:
                LOBYTE(v13) = 1;
              }
              else
              {
                LOBYTE(v13) = 0;
                *(unsigned char *)(a1 + 112) = 6;
                *(_WORD *)(a1 + 110) = v27 - 3;
              }
            }
            else
            {
              if (!v21) {
                *(unsigned char *)(a1 + 117) = 1;
              }
              LOBYTE(v13) = 0;
              char v24 = 7;
LABEL_25:
              *(unsigned char *)(a1 + 112) = v24;
            }
            goto LABEL_85;
          case 6:
            LOBYTE(v13) = 0;
            *(_WORD *)(a1 + 108) = (_WORD)v21 << 8;
            *(unsigned char *)(a1 + 113) += v21;
            *(unsigned char *)(*(void *)(a1 + 88))++ = v21;
            *(unsigned char *)(a1 + 112) = 7;
            --*(_WORD *)(a1 + 104);
            goto LABEL_85;
          case 7:
            *(_WORD *)(a1 + 108) |= v21;
            *(unsigned char *)(a1 + 113) += v21;
            **(unsigned char **)(a1 + 88) = v21;
            uint64_t v28 = *(void *)(a1 + 88) + 1;
            *(void *)(a1 + 88) = v28;
            --*(_WORD *)(a1 + 104);
            if (*(_WORD *)(a1 + 108) == 238) {
              *(unsigned char *)(a1 + 118) = 1;
            }
            __int16 v13 = *(_WORD *)(a1 + 110);
            if (v13)
            {
              LOBYTE(v13) = 0;
              *(unsigned char *)(a1 + 112) = 8;
              *(void *)(a1 + 16) = v28;
            }
            else
            {
              *(unsigned char *)(a1 + 112) = 9;
              *(void *)(a1 + 16) = 0;
            }
            goto LABEL_85;
          case 8:
            unint64_t v29 = *(unsigned __int16 *)(a1 + 104);
            if (v16 >= v29) {
              size_t v30 = *(unsigned __int16 *)(a1 + 104);
            }
            else {
              size_t v30 = v16;
            }
            *(_WORD *)(a1 + 104) = v29 - v30;
            memcpy(*(void **)(a1 + 88), v17, v30);
            if (v30)
            {
              char v12 = &v17[v30];
              int v31 = *(unsigned __int8 *)(a1 + 113);
              size_t v32 = v30;
              do
              {
                int v33 = *v17++;
                v31 += v33;
                *(unsigned char *)(a1 + 113) = v31;
                --v32;
              }
              while (v32);
            }
            else
            {
              char v12 = v17;
            }
            uint64_t v20 = v16 - v30;
            *(void *)(a1 + 88) += v30;
            __int16 v13 = *(_WORD *)(a1 + 104);
            if (v13) {
              goto LABEL_31;
            }
            char v24 = 9;
            goto LABEL_25;
          case 9:
            char v34 = *(unsigned char *)(a1 + 113) + v21;
            *(unsigned char *)(a1 + 113) = v34;
            if (v34) {
              goto LABEL_84;
            }
            *(unsigned char *)(a1 + 112) = 17;
            *(void *)(a1 + 56) = a2;
            *(void *)(a1 + 88) = 0;
            if (*(unsigned char *)(a1 + 116) && *(unsigned char *)(a1 + 117) && *(unsigned char *)(a1 + 118)) {
              goto LABEL_94;
            }
            goto LABEL_86;
          case 0xA:
          case 0xB:
          case 0xC:
          case 0xD:
            LOBYTE(v13) = 0;
            *(unsigned char *)(a1 + 113) += v21;
            *(unsigned char *)(*(void *)(a1 + 88))++ = v21;
            --*(_WORD *)(a1 + 104);
            char v24 = *(unsigned char *)(a1 + 112) + 1;
            goto LABEL_25;
          case 0xE:
            --*(_WORD *)(a1 + 104);
            char v35 = *(unsigned char *)(a1 + 113);
            *(unsigned char *)(a1 + 115) = v35;
            char v36 = v35 + v21;
            *(unsigned char *)(a1 + 113) = v36;
            if (v36) {
              goto LABEL_84;
            }
            LOBYTE(v13) = 0;
            char v24 = 15;
            goto LABEL_25;
          case 0xF:
            uint64_t v37 = *(unsigned __int16 *)(a1 + 104);
            if (v16 >= v37 - 1) {
              size_t v38 = v37 - 1;
            }
            else {
              size_t v38 = v16;
            }
            *(_WORD *)(a1 + 104) = v37 - v38;
            memcpy(*(void **)(a1 + 88), v17, v38);
            if (v38)
            {
              char v12 = &v17[v38];
              int v39 = *(unsigned __int8 *)(a1 + 113);
              size_t v40 = v38;
              do
              {
                int v41 = *v17++;
                v39 += v41;
                *(unsigned char *)(a1 + 113) = v39;
                --v40;
              }
              while (v40);
            }
            else
            {
              char v12 = v17;
            }
            uint64_t v20 = v16 - v38;
            *(void *)(a1 + 88) += v38;
            if (*(_WORD *)(a1 + 104) != 1) {
              goto LABEL_31;
            }
            LOBYTE(v13) = 0;
            char v24 = 16;
            goto LABEL_25;
          case 0x10:
            char v42 = *(unsigned char *)(a1 + 113) + v21;
            *(unsigned char *)(a1 + 113) = v42;
            if (v42) {
              goto LABEL_84;
            }
            *(unsigned char *)(a1 + 112) = 17;
            *(void *)(a1 + 56) = a2;
            *(void *)(a1 + 88) = 0;
LABEL_94:
            *a6 = 1;
            goto LABEL_86;
          default:
            abort();
        }
      }
      if (v14) {
        char v18 = v14;
      }
      else {
        char v18 = __src;
      }
      if (v14) {
        CFUUIDRef v19 = (char *)(__src - v14);
      }
      else {
        CFUUIDRef v19 = 0;
      }
      *(unsigned char *)(a1 + 120) = 0;
      *(_DWORD *)char v15 = 0;
      if (*(void *)(a1 + 32)) {
        operator delete[]();
      }
      long long v14 = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 24) = 0;
      *(_DWORD *)(a1 + 40) = 0;
      *(void *)(a1 + 32) = 0;
      *uint64_t v46 = 0;
      v46[1] = 0;
      *(_DWORD *)(a1 + 44) = 15;
      *(void *)(a1 + 104) = 0;
      *(unsigned char *)(a1 + 112) = 1;
      uint64_t v20 = (uint64_t)&v19[a4 - 1];
      unsigned int v22 = *v18;
      char v12 = v18 + 1;
      unsigned int v21 = v22;
LABEL_21:
      *(_WORD *)(a1 + 116) = 0;
      *(unsigned char *)(a1 + 118) = 0;
      *(unsigned char *)(a1 + 120) = 0;
      if (v21 == 85)
      {
        LOBYTE(v13) = 0;
        __int16 v23 = 2;
      }
      else
      {
        if (!*(unsigned char *)(a1 + 119) || v21 != 90)
        {
          if (v21 == 255)
          {
            LOBYTE(v13) = 0;
            *(unsigned char *)(a1 + 119) = 1;
          }
          else
          {
LABEL_31:
            LOBYTE(v13) = 0;
          }
          goto LABEL_85;
        }
        LOBYTE(v13) = 0;
        *(unsigned char *)(a1 + 120) = 1;
        __int16 v23 = 22787;
      }
      *(_WORD *)(a1 + 112) = v23;
      long long v14 = v12;
LABEL_85:
      unint64_t v16 = v20;
      long long v17 = v12;
      if (!v20) {
        goto LABEL_86;
      }
    }
  }
  *(unsigned char *)(a1 + 120) = 0;
  *(_DWORD *)(a1 + 116) = 0;
  if (*(void *)(a1 + 32)) {
    operator delete[]();
  }
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xF00000000;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 1;
  uint64_t result = 60;
  char v12 = __src;
  *(void *)(a1 + 64) = a2;
LABEL_90:
  *uint64_t v6 = v12 - __src;
  return result;
}

uint64_t sub_10001EA70(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_10001EDEC(id a1)
{
  qword_100031FF8 = (uint64_t)asl_open(0, "IAP", 2u);
  if (qword_100031FF8) {
    qword_100032000 = (uint64_t)asl_new(0);
  }
  else {
    syslog(3, "Couldn't open Event Log file");
  }
}

uint64_t sub_10001F040(io_registry_entry_t entry, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11 = 3758097084;
  if (a2)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceVersion", kCFAllocatorDefault, 0);
    if (!CFProperty) {
      return 3758097136;
    }
    CFNumberRef v14 = CFProperty;
    int Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, a2);
    CFRelease(v14);
    if (!Value) {
      return v11;
    }
  }
  if (a3)
  {
    CFNumberRef v16 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"FirmwareVersion", kCFAllocatorDefault, 0);
    if (!v16) {
      return 3758097136;
    }
    CFNumberRef v17 = v16;
    int v18 = CFNumberGetValue(v16, kCFNumberSInt8Type, a3);
    CFRelease(v17);
    if (!v18) {
      return v11;
    }
  }
  if (a4)
  {
    CFNumberRef v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMajorVersion", kCFAllocatorDefault, 0);
    if (!v19) {
      return 3758097136;
    }
    CFNumberRef v20 = v19;
    int v21 = CFNumberGetValue(v19, kCFNumberSInt8Type, a4);
    CFRelease(v20);
    if (!v21) {
      return v11;
    }
  }
  if (a5)
  {
    CFNumberRef v22 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMinorVersion", kCFAllocatorDefault, 0);
    if (!v22) {
      return 3758097136;
    }
    CFNumberRef v23 = v22;
    int v24 = CFNumberGetValue(v22, kCFNumberSInt8Type, a5);
    CFRelease(v23);
    if (!v24) {
      return v11;
    }
  }
  if (!a6) {
    return 0;
  }
  CFNumberRef v25 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceID", kCFAllocatorDefault, 0);
  if (!v25) {
    return 3758097136;
  }
  CFNumberRef v26 = v25;
  int v27 = CFNumberGetValue(v25, kCFNumberSInt32Type, a6);
  CFRelease(v26);
  if (v27) {
    return 0;
  }
  return v11;
}

CFTypeRef sub_10001F1F4(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificate", kCFAllocatorDefault, 0);
}

CFTypeRef sub_10001F210(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificateSerialNumber", kCFAllocatorDefault, 0);
}

uint64_t sub_10001F22C(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(theData);
  size_t v7 = CFDataGetLength(theData);
  uint64_t v8 = IOConnectCallStructMethod(a1, 0, BytePtr, v7, outputStruct, (size_t *)&length);
  if (!v8) {
    *a3 = CFDataCreate(kCFAllocatorDefault, outputStruct, length);
  }
  return v8;
}

uint64_t sub_10001F2F0(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t sub_10001F32C(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t sub_10001F368(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t sub_10001F3A4(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0);
}

uint64_t sub_10001F3E0(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u)) {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0xBu, v7, v5, 0, 0);
    }
    else {
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

void sub_10001F498(int a1)
{
  int v1 = 136315650;
  uint64_t v2 = off_100031EC8;
  __int16 v3 = 2080;
  uint64_t v4 = off_100031E58;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "[#%s] (%s) **ERROR** err - Invalid HID function %d\n", (uint8_t *)&v1, 0x1Cu);
}

void sub_10001F548()
{
  sub_100007944();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "[#%s] (%s) **ERROR** err = 0x%X when calling BTDeviceSetHIDProperties for m_btdevice %hhx, authStatus BT_TRUE, hidType %d, err", v0, 0x28u);
}

void sub_10001F5E4()
{
  sub_100007944();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "[#%s] (%s) **ERROR** err = 0x%X when calling BTDeviceSetHIDProperties for m_btdevice %hhx, authStatus BT_FALSE, hidType %d, err", v0, 0x28u);
}

void sub_10001F680()
{
}

void sub_10001F69C(unsigned __int8 a1)
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t AllocCapsFromAuthCert()
{
  return _AllocCapsFromAuthCert();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceDisconnectServices()
{
  return _BTDeviceDisconnectServices();
}

uint64_t BTDeviceGetAddressString()
{
  return _BTDeviceGetAddressString();
}

uint64_t BTDeviceGetComPortForServiceWithSandboxExtension()
{
  return _BTDeviceGetComPortForServiceWithSandboxExtension();
}

uint64_t BTDeviceGetConnectedServices()
{
  return _BTDeviceGetConnectedServices();
}

uint64_t BTDeviceGetSupportedServices()
{
  return _BTDeviceGetSupportedServices();
}

uint64_t BTDeviceSetHIDProperties()
{
  return _BTDeviceSetHIDProperties();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return _BTLocalDeviceGetConnectedDevices();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return _BTLocalDeviceGetModulePower();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return _CFStringCompareWithOptions(theString1, theString2, rangeToCompare, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t CPSystemRootDirectory()
{
  return _CPSystemRootDirectory();
}

uint64_t CanChargeHighVoltage()
{
  return _CanChargeHighVoltage();
}

uint64_t CanUseAccPwrLoV()
{
  return _CanUseAccPwrLoV();
}

uint64_t CanUseAccPwrUHPM()
{
  return _CanUseAccPwrUHPM();
}

uint64_t GetRandomDigest()
{
  return _GetRandomDigest();
}

uint64_t GetSecCertRef()
{
  return _GetSecCertRef();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceModelNumber()
{
  return _IOAccessoryEAInterfaceCopyDeviceModelNumber();
}

uint64_t IOAccessoryManagerAllowFeatures()
{
  return _IOAccessoryManagerAllowFeatures();
}

uint64_t IOAccessoryManagerConfigurePower()
{
  return _IOAccessoryManagerConfigurePower();
}

uint64_t IOAccessoryManagerConfigureUSBMode()
{
  return _IOAccessoryManagerConfigureUSBMode();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return _IOAccessoryManagerCopyDeviceInfo();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return _IOAccessoryManagerGetAccessoryID();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return _IOAccessoryManagerGetDigitalID();
}

uint64_t IOAccessoryManagerGetPowerDuringSleep()
{
  return _IOAccessoryManagerGetPowerDuringSleep();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return _IOAccessoryManagerGetPrimaryPort();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return _IOAccessoryManagerGetServiceWithPrimaryPort();
}

uint64_t IOAccessoryManagerGetUSBConnectType()
{
  return _IOAccessoryManagerGetUSBConnectType();
}

uint64_t IOAccessoryManagerGetUpstreamService()
{
  return _IOAccessoryManagerGetUpstreamService();
}

uint64_t IOAccessoryManagerRevokeFeatures()
{
  return _IOAccessoryManagerRevokeFeatures();
}

uint64_t IOAccessoryManagerSetBatteryPackMode()
{
  return _IOAccessoryManagerSetBatteryPackMode();
}

uint64_t IOAccessoryPortCreateRunLoopSource()
{
  return _IOAccessoryPortCreateRunLoopSource();
}

uint64_t IOAccessoryPortGetManagerPrimaryPort()
{
  return _IOAccessoryPortGetManagerPrimaryPort();
}

uint64_t IOAccessoryPortGetManagerService()
{
  return _IOAccessoryPortGetManagerService();
}

uint64_t IOAccessoryPortGetPort()
{
  return _IOAccessoryPortGetPort();
}

uint64_t IOAccessoryPortGetServiceWithPort()
{
  return _IOAccessoryPortGetServiceWithPort();
}

uint64_t IOAccessoryPortGetTransportType()
{
  return _IOAccessoryPortGetTransportType();
}

uint64_t IOAccessoryPortSetUSBRoleSwitchMask()
{
  return _IOAccessoryPortSetUSBRoleSwitchMask();
}

uint64_t IOAccessoryPortTransmitData()
{
  return _IOAccessoryPortTransmitData();
}

uint64_t IOAccessoryStartVoltageEventMonitor()
{
  return _IOAccessoryStartVoltageEventMonitor();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t IapAuthCertSerial()
{
  return _IapAuthCertSerial();
}

uint64_t IapAuthVerifyCertSerialNumber()
{
  return _IapAuthVerifyCertSerialNumber();
}

uint64_t IsAppleAccessory()
{
  return _IsAppleAccessory();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t SecCertificateGetiAuthVersion()
{
  return _SecCertificateGetiAuthVersion();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t VerifyCertAuthorityDictionary()
{
  return _VerifyCertAuthorityDictionary();
}

uint64_t VerifyNonceSigned()
{
  return _VerifyNonceSigned();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return _asl_log(client, msg, level, format);
}

asl_object_t asl_new(uint32_t type)
{
  return _asl_new(type);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return _asl_set(obj, key, value);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return _dispatch_data_create_concat(data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return _dispatch_data_create_map(data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return _dispatch_data_create_subrange(data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_pthread_root_queue_create()
{
  return _dispatch_pthread_root_queue_create();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return _pthread_getschedparam(a1, a2, a3);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_kill(pthread_t a1, int a2)
{
  return _pthread_kill(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t sandbox_consume_fs_extension()
{
  return _sandbox_consume_fs_extension();
}

uint64_t sandbox_release_fs_extension()
{
  return _sandbox_release_fs_extension();
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
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
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__listenForAccessoryPortChanges(void *a1, const char *a2, ...)
{
  return [a1 _listenForAccessoryPortChanges];
}

id objc_msgSend__reloadEventHandler(void *a1, const char *a2, ...)
{
  return [a1 _reloadEventHandler];
}

id objc_msgSend__setupiAPInterfaceNotifications(void *a1, const char *a2, ...)
{
  return [a1 _setupiAPInterfaceNotifications];
}

id objc_msgSend_accResistorID(void *a1, const char *a2, ...)
{
  return [a1 accResistorID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachPowerModeNotifications(void *a1, const char *a2, ...)
{
  return [a1 attachPowerModeNotifications];
}

id objc_msgSend_bHasConnectionCON(void *a1, const char *a2, ...)
{
  return [a1 bHasConnectionCON];
}

id objc_msgSend_bOSInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 bOSInternalBuild];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bringupPlatform(void *a1, const char *a2, ...)
{
  return [a1 bringupPlatform];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkXPCConnections(void *a1, const char *a2, ...)
{
  return [a1 checkXPCConnections];
}

id objc_msgSend_cleanupPhysicalConnectorConnections(void *a1, const char *a2, ...)
{
  return [a1 cleanupPhysicalConnectorConnections];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deleteAllPorts(void *a1, const char *a2, ...)
{
  return [a1 deleteAllPorts];
}

id objc_msgSend_deleteWiredPorts(void *a1, const char *a2, ...)
{
  return [a1 deleteWiredPorts];
}

id objc_msgSend_detachPowerModeNotifications(void *a1, const char *a2, ...)
{
  return [a1 detachPowerModeNotifications];
}

id objc_msgSend_deviceUUIDStr(void *a1, const char *a2, ...)
{
  return [a1 deviceUUIDStr];
}

id objc_msgSend_externalAccessoryProtocols(void *a1, const char *a2, ...)
{
  return [a1 externalAccessoryProtocols];
}

id objc_msgSend_iDeviceClass(void *a1, const char *a2, ...)
{
  return [a1 iDeviceClass];
}

id objc_msgSend_iap9PinUSBConnState(void *a1, const char *a2, ...)
{
  return [a1 iap9PinUSBConnState];
}

id objc_msgSend_iapPortManagers(void *a1, const char *a2, ...)
{
  return [a1 iapPortManagers];
}

id objc_msgSend_iaptransportdhighPriorityRootQueue(void *a1, const char *a2, ...)
{
  return [a1 iaptransportdhighPriorityRootQueue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCarPlayAllowed(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayAllowed];
}

id objc_msgSend_isDeviceInLowPowerMode(void *a1, const char *a2, ...)
{
  return [a1 isDeviceInLowPowerMode];
}

id objc_msgSend_isLowPowerModeSupported(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeSupported];
}

id objc_msgSend_isShuttingDown(void *a1, const char *a2, ...)
{
  return [a1 isShuttingDown];
}

id objc_msgSend_isVehicleUIAllowed(void *a1, const char *a2, ...)
{
  return [a1 isVehicleUIAllowed];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return [a1 portNumber];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedIAPTransportServer(void *a1, const char *a2, ...)
{
  return [a1 sharedIAPTransportServer];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shutdownQ(void *a1, const char *a2, ...)
{
  return [a1 shutdownQ];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_supportsIAPD(void *a1, const char *a2, ...)
{
  return [a1 supportsIAPD];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateDeviceUUIDState(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceUUIDState];
}

id objc_msgSend_updatePortManagers(void *a1, const char *a2, ...)
{
  return [a1 updatePortManagers];
}

id objc_msgSend_updateSleepAssertionState(void *a1, const char *a2, ...)
{
  return [a1 updateSleepAssertionState];
}