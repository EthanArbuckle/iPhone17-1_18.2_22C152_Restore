void sub_4780(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  uint8_t buf[8];
  unsigned char v14[128];

  v2 = CoreRCPluginLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "System going to sleep", buf, 2u);
  }

  v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 72))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(v3 + 56);
    v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      v6 = v5;
      v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "sleepDisplay:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 73), (void)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  }
}

void sub_48D4(uint64_t a1)
{
  v2 = CoreRCPluginLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "System is awake", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 72))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 56);
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "wakeDisplay", (void)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  }
}

void sub_4A1C(void *a1, io_iterator_t a2)
{
  id v4 = CoreRCPluginLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "serviceNotificationCallbackCEC", buf, 2u);
  }

  id v5 = a1;
  *(void *)&long long v6 = 138412290;
  long long v16 = v6;
  while (1)
  {
    uint64_t v7 = IOIteratorNext(a2);
    if (v7)
    {
      uint64_t v8 = v7;
      do
      {
        long long v9 = objc_msgSend(v5, "addInterfacePropertiesForService:", v8, v16);
        long long v10 = v9;
        if (v9)
        {
          if ([v9 cecService]) {
            IOObjectRelease((io_object_t)[v10 cecService]);
          }
          [v10 setCecService:v8];
          long long v11 = CoreRCPluginLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v20 = v10;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Added cecService to %@", buf, 0xCu);
          }

          [v5 updateDisabledStateOnInterface:v10];
          if (!v5[6])
          {
            id v12 = [objc_alloc((Class)CoreRCManager) initWithSerialQueue:v5[1]];
            v13 = (void *)v5[6];
            v5[6] = v12;

            v14 = (void *)v5[6];
            if (!v14)
            {
              v15 = CoreRCPluginLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                sub_8708(&v17, v18, v15);
              }

              v14 = (void *)v5[6];
            }
            [v14 setDelegate:v5];
          }
        }
        else
        {
          IOObjectRelease(v8);
        }

        uint64_t v8 = IOIteratorNext(a2);
      }
      while (v8);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    IOIteratorReset(a2);
  }
}

void sub_4C44(void *a1, io_iterator_t a2)
{
  id v4 = CoreRCPluginLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "terminationNotificationCallbackCEC", v9, 2u);
  }

  id v5 = a1;
  while (1)
  {
    uint64_t v6 = IOIteratorNext(a2);
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        id v8 = [v5 removeInterfacePropertiesForService:v7];
        IOObjectRelease(v7);
        uint64_t v7 = IOIteratorNext(a2);
      }
      while (v7);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    IOIteratorReset(a2);
  }
}

void sub_4D1C(void *a1, io_iterator_t a2)
{
  id v4 = CoreRCPluginLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "serviceNotificationCallbackEDID", buf, 2u);
  }

  id v5 = a1;
  CFAllocatorRef v6 = kCFAllocatorDefault;
  uint64_t v7 = "IOService";
  CFStringRef v8 = @"Location";
  io_iterator_t v24 = a2;
  while (1)
  {
    uint64_t v9 = IOIteratorNext(a2);
    if (v9)
    {
      uint64_t v10 = v9;
      do
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v36 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        *(_OWORD *)buf = 0u;
        CFTypeRef v11 = IORegistryEntrySearchCFProperty(v10, v7, v8, v6, 0);
        IORegistryEntryGetName(v10, (char *)buf);
        id v12 = CoreRCPluginLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 67109634;
          *(_DWORD *)v30 = v10;
          *(_WORD *)&v30[4] = 2112;
          *(void *)&v30[6] = v11;
          __int16 v31 = 2080;
          v32 = buf;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "serviceNotificationCallbackEDID service published: 0x%x, location: %@ : %s", v29, 0x1Cu);
        }

        if (v11)
        {
          if (CFEqual(v11, @"External")
            && ([v5 addInterfacePropertiesForService:v10],
                (v13 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v14 = v13;
            if ([v13 avService]) {
              IOObjectRelease((io_object_t)[v14 avService]);
            }
            [v14 setAvService:v10];
            v15 = CoreRCPluginLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v29 = 138412290;
              *(void *)v30 = v14;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Added avService to %@", v29, 0xCu);
            }

            usleep(0x493E0u);
            long long v16 = [v5 getEDIDPropertiesForService:v10];
            [v14 setProperties:v16];

            uint8_t v17 = [v14 properties];

            if (v17)
            {
              [v5 updateDisabledStateOnInterface:v14];
            }
            else
            {
              dispatch_time_t v18 = dispatch_time(0, 1000000000 * v5[10]);
              CFAllocatorRef v19 = v6;
              CFStringRef v20 = v8;
              v21 = v7;
              v22 = v5[1];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_67F8;
              block[3] = &unk_C3C0;
              v26 = v5;
              id v27 = v14;
              int v28 = v10;
              id v14 = v14;
              v23 = v22;
              uint64_t v7 = v21;
              CFStringRef v8 = v20;
              CFAllocatorRef v6 = v19;
              a2 = v24;
              dispatch_after(v18, v23, block);
            }
          }
          else
          {
            IOObjectRelease(v10);
          }
          CFRelease(v11);
        }
        else
        {
          IOObjectRelease(v10);
        }
        uint64_t v10 = IOIteratorNext(a2);
      }
      while (v10);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    IOIteratorReset(a2);
  }
}

void sub_50E0(void *a1, io_iterator_t a2)
{
  id v4 = CoreRCPluginLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "terminationNotificationCallbackEDID", v9, 2u);
  }

  id v5 = a1;
  while (1)
  {
    uint64_t v6 = IOIteratorNext(a2);
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        id v8 = [v5 removeInterfacePropertiesForService:v7];
        IOObjectRelease(v7);
        uint64_t v7 = IOIteratorNext(a2);
      }
      while (v7);
    }
    if (IOIteratorIsValid(a2)) {
      break;
    }
    IOIteratorReset(a2);
  }
}

id sub_5348(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerNotifications];
}

id sub_67F8(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    id result = [*(id *)(a1 + 40) avService];
    if (result == *(_DWORD *)(a1 + 48))
    {
      uint64_t v3 = [*(id *)(a1 + 32) getEDIDPropertiesForService:result];
      [*(id *)(a1 + 40) setProperties:v3];

      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      return [v4 updateDisabledStateOnInterface:v5];
    }
  }
  return result;
}

void sub_6880(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_68A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_6B18(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (v1[32])
  {
    v2 = CoreRCPluginLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Display is asleep, don't wake up TV", v3, 2u);
    }
  }
  else
  {
    [v1 wakeDisplay];
  }
}

void *sub_70D0(void *result)
{
  *(unsigned char *)(result[4] + 34) = 0;
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 33) && *(void *)(v1 + 16) && *(void *)(v1 + 24))
  {
    v2 = result;
    uint64_t v3 = CoreRCPluginLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reasserting active source", v4, 2u);
    }

    [*(id *)(v2[4] + 24) makeActiveSourceWithTVMenus:1 error:0];
    id result = [*(id *)(v2[4] + 24) setPowerStatus:1 error:0];
    *(unsigned char *)(v2[4] + 33) = 0;
  }
  return result;
}

void sub_78FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_7DC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) deboucePowerNotification];
}

void sub_7DCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CoreRCPluginLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [*(id *)(a1 + 32) displayId];
    id v9 = [v6 debugDescription];
    *(_DWORD *)buf = 67109634;
    unsigned int v20 = v8;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2080;
    id v24 = [v9 UTF8String];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "(%d) Brightness notification: %@  %s", buf, 0x1Cu);
  }
  if ([v5 isEqual:kCABrightnessSyncNotificationWillChangePowerState])
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:kCABrightnessSyncNotificationEventState];
    if ([v10 intValue])
    {
    }
    else
    {
      CFTypeRef v11 = [v6 objectForKeyedSubscript:@"syncNotificationFromHotplug"];
      unsigned int v12 = [v11 intValue];

      if (!v12)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_8040;
        block[3] = &unk_C398;
        long long v16 = *(NSObject **)(a1 + 40);
        void block[4] = *(void *)(a1 + 48);
        dispatch_sync(v16, block);
        goto LABEL_11;
      }
    }
  }
  if ([v5 isEqual:kCABrightnessSyncNotificationDidChangePowerState])
  {
    v13 = [v6 objectForKeyedSubscript:kCABrightnessSyncNotificationEventState];
    unsigned int v14 = [v13 intValue];

    if (v14 == 1)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_8110;
      v17[3] = &unk_C398;
      v15 = *(NSObject **)(a1 + 40);
      v17[4] = *(void *)(a1 + 48);
      dispatch_async(v15, v17);
    }
  }
LABEL_11:
}

void sub_8040(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 49) || !*(unsigned char *)(v1 + 50))
  {
    v2 = *(NSObject **)(v1 + 40);
    dispatch_time_t v3 = dispatch_time(0, 1000000000 * *(void *)(v1 + 56));
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(v1 + 24) + 16);
    v4();
  }
}

void sub_8110(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  dispatch_time_t v3 = dispatch_time(0, 1000000000 * *(void *)(v1 + 56));

  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

id _powerNotificationCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 handlePowerNotificationWithService:a2 messageType:a3 messageArgument:a4];
}

id CoreRCPluginLog()
{
  if (qword_11960 != -1) {
    dispatch_once(&qword_11960, &stru_C430);
  }
  v0 = (void *)qword_11958;

  return v0;
}

void sub_8524(id a1)
{
  qword_11958 = (uint64_t)os_log_create("com.apple.CoreRCPlugin", "default");

  _objc_release_x1();
}

void sub_8568()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to add DCPAVServiceProxy termination notification for EDID 0x%x", v2, v3, v4, v5, v6);
}

void sub_85D0()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to add DCPAVServiceProxy matching notification for EDID 0x%x", v2, v3, v4, v5, v6);
}

void sub_8638()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to add DCP driver termination notification 0x%x", v2, v3, v4, v5, v6);
}

void sub_86A0()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to add DCP driver matching notification 0x%x", v2, v3, v4, v5, v6);
}

void sub_8708(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Create CoreRC Manager Failed", buf, 2u);
}

void sub_8748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8780(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_87B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_87F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8860(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "EDID too short %ld", (uint8_t *)&v2, 0xCu);
}

void sub_88D8()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to get DCPEXT node 0x%X", v2, v3, v4, v5, v6);
}

void sub_8940()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to get RTBuddy endpoint node 0x%X", v2, v3, v4, v5, v6);
}

void sub_89A8()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to get AFK endpoint node 0x%X", v2, v3, v4, v5, v6);
}

void sub_8A10()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to get epic node 0x%X", v2, v3, v4, v5, v6);
}

void sub_8A78()
{
  sub_689C();
  sub_6880(&dword_0, v0, v1, "Failed to get EDID 0x%X", v2, v3, v4, v5, v6);
}

void sub_8AE0()
{
  sub_7918();
  sub_78FC(&dword_0, v0, v1, "Failed to add CEC device %@", v2, v3, v4, v5, v6);
}

void sub_8B48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8B80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8BB8()
{
  sub_7918();
  sub_78FC(&dword_0, v0, v1, "Failed to standby TV %@", v2, v3, v4, v5, v6);
}

void sub_8C20()
{
  sub_7918();
  sub_78FC(&dword_0, v0, v1, "Failed to make active source: %@", v2, v3, v4, v5, v6);
}

void sub_8C88()
{
  sub_7918();
  sub_78FC(&dword_0, v0, v1, "Failed to add CEC device, deferring: %@", v2, v3, v4, v5, v6);
}

void sub_8CF0()
{
  sub_7918();
  sub_78FC(&dword_0, v0, v1, "Failed to set OSD name: %@", v2, v3, v4, v5, v6);
}

void sub_8D58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8D90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8DC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CoreCECDeviceSourceRCProfileWithSupportedMenuCommands()
{
  return _CoreCECDeviceSourceRCProfileWithSupportedMenuCommands();
}

uint64_t IOAVServiceCopyEDID()
{
  return _IOAVServiceCopyEDID();
}

uint64_t IOAVServiceCreateWithService()
{
  return _IOAVServiceCreateWithService();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_analyticsDelay(void *a1, const char *a2, ...)
{
  return [a1 analyticsDelay];
}

id objc_msgSend_avService(void *a1, const char *a2, ...)
{
  return [a1 avService];
}

id objc_msgSend_cecActiveSourceRecentlySentDuration(void *a1, const char *a2, ...)
{
  return [a1 cecActiveSourceRecentlySentDuration];
}

id objc_msgSend_cecBus(void *a1, const char *a2, ...)
{
  return [a1 cecBus];
}

id objc_msgSend_cecService(void *a1, const char *a2, ...)
{
  return [a1 cecService];
}

id objc_msgSend_cecUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 cecUserDefaults];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return [a1 displayId];
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return [a1 displayType];
}

id objc_msgSend_displays(void *a1, const char *a2, ...)
{
  return [a1 displays];
}

id objc_msgSend_hasLink(void *a1, const char *a2, ...)
{
  return [a1 hasLink];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isActiveSource(void *a1, const char *a2, ...)
{
  return [a1 isActiveSource];
}

id objc_msgSend_powerNotificationDebounceTime(void *a1, const char *a2, ...)
{
  return [a1 powerNotificationDebounceTime];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_removeBus(void *a1, const char *a2, ...)
{
  return [a1 removeBus];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_serverIfRunning(void *a1, const char *a2, ...)
{
  return [a1 serverIfRunning];
}

id objc_msgSend_standbyDisabled(void *a1, const char *a2, ...)
{
  return [a1 standbyDisabled];
}

id objc_msgSend_wakeDisplay(void *a1, const char *a2, ...)
{
  return [a1 wakeDisplay];
}