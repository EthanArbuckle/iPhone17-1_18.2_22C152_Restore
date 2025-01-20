id sub_10000584C(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 writeData:a2 size:a3];
}

void sub_1000066C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 count] != (id)1)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 description];
      *(_DWORD *)buf = 136315394;
      id v18 = [v12 UTF8String];
      __int16 v19 = 2048;
      id v20 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " read failed with error %s, , datagrams count %lu ", buf, 0x16u);
    }
    id v11 = [v6 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 190, "-[NWConnectionManager startRead:]_block_invoke", 7, 0, " read failed with error %s, , datagrams count %lu ", (const char *)[v11 UTF8String], objc_msgSend(v5, "count"));
  }
  else
  {
    id v7 = v5;
    v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000068B8;
    block[3] = &unk_100054A58;
    id v14 = v7;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v16 = v10;
    dispatch_async(v8, block);

    id v11 = v14;
  }
}

void sub_1000068B8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectAtIndex:0];
  v3 = *(void **)(a1 + 40);
  id v4 = v2;
  objc_msgSend(v3, "handleIncomingData:dataSize:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  if (([*(id *)(a1 + 48) stopConnection] & 1) == 0) {
    [*(id *)(a1 + 48) startRead:*(void *)(a1 + 40)];
  }
}

void sub_100006AFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v3 description];
      *(_DWORD *)buf = 136315138;
      id v7 = [v4 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error when writing %s", buf, 0xCu);
    }
    id v5 = [v3 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NWConnectionManager.m", 98, 234, "-[NWConnectionManager writeData:size:]_block_invoke", 7, 0, "error when writing %s", (const char *)[v5 UTF8String]);
  }
  [*(id *)(a1 + 32) removeAllObjects];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 16));
}

uint64_t sub_100006CE0(void *(__cdecl *a1)(void *), void *a2, pthread_t *a3)
{
  memset(&v9, 0, sizeof(v9));
  pthread_t v8 = 0;
  pthread_attr_init(&v9);
  pthread_attr_setdetachstate(&v9, 2);
  uint64_t v6 = pthread_create(&v8, &v9, a1, a2);
  pthread_attr_destroy(&v9);
  if (v6)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000367EC(v6);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDThread.c", 84, 29, "RDCreateTask", 3, 0, "error from pthread_create: %d", v6);
  }
  else if (a3)
  {
    *a3 = v8;
  }
  return v6;
}

uint64_t sub_100006DF8(char *a1, int a2)
{
  LODWORD(v2) = a2;
  int v4 = dword_10005C648;
  if (!dword_10005C648)
  {
    int v4 = open("/dev/random", 0);
    dword_10005C648 = v4;
    if (v4 != -1) {
      goto LABEL_8;
    }
    int v4 = open("/dev/urandom", 0);
    dword_10005C648 = v4;
  }
  if (v4 == -1)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10003686C();
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/AuthRandom.c", 89, 40, "AuthGetRandomBytes", 3, 0, "FATAL ERROR - unable to open /dev/random");
    goto LABEL_19;
  }
LABEL_8:
  if (v2)
  {
    size_t v5 = v2;
    uint64_t v6 = a1;
    while (1)
    {
      ssize_t v7 = read(v4, v6, v5);
      if (v7 < 0) {
        break;
      }
      size_t v2 = (v2 - v7);
      if (!v2) {
        return 0;
      }
      a1 += v7;
      usleep(0xF4240u);
      int v4 = dword_10005C648;
      uint64_t v6 = a1;
      size_t v5 = v2;
    }
    uint64_t v9 = v7;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000368B4(v9);
    }
    __error();
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/AuthRandom.c", 89, 51, "AuthGetRandomBytes", 3, 0, "FATAL ERROR - read returned %zd  errno %d", v9);
LABEL_19:
    exit(1);
  }
  return 0;
}

uint64_t sub_100007000(uint64_t a1)
{
  qword_10005C650 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000074D8(id a1)
{
  v1 = +[TouchEventMonitor sharedTouchEventMonitor];
  id v2 = [v1 hidEventClient];

  if (v2)
  {
    +[TouchEventMonitor sharedTouchEventMonitor];
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    id v3 = +[TouchEventMonitor sharedTouchEventMonitor];
    [v3 setMonitoringEvents:0];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no lopnger monitoring touch events", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 82, "+[TouchEventMonitor stopMonitoringTouchEvents]_block_invoke", 7, 0, "no lopnger monitoring touch events");
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no hid event client", v4, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 85, "+[TouchEventMonitor stopMonitoringTouchEvents]_block_invoke", 7, 0, "no hid event client");
  }
}

uint64_t sub_100007668()
{
  return 0;
}

void sub_100007A84(id a1)
{
  v1 = +[TouchEventMonitor sharedTouchEventMonitor];
  id v2 = [v1 hidEventClient];

  if (v2)
  {
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    +[TouchEventMonitor sharedTouchEventMonitor];
    IOHIDEventSystemClientRegisterEventFilterCallback();
    id v3 = +[TouchEventMonitor sharedTouchEventMonitor];
    [v3 setMonitoringEvents:1];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "monitoriung touch events", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 117, "+[TouchEventMonitor startMonitoringTouchEvents]_block_invoke", 7, 0, "monitoriung touch events");
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no hid event client", v4, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 120, "+[TouchEventMonitor startMonitoringTouchEvents]_block_invoke", 7, 0, "no hid event client");
  }
}

void sub_100007C14(id a1)
{
  if (byte_10005C660 == 1)
  {
    id v1 = +[NSNotificationCenter defaultCenter];
    [v1 postNotificationName:@"TouchEventUpdate" object:0];
  }
}

uint64_t sub_100007E80()
{
  uint64_t result = IOHIDEventGetType();
  if (result == 14 || result == 11)
  {
    if (!IOHIDEventGetIntegerValue())
    {
      unint64_t IntegerValue = IOHIDEventGetIntegerValue();
      if (IntegerValue > 0x13)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100036954(IntegerValue);
        }
      }
      else if (IOHIDEventGetIntegerValue() == 1)
      {
        IOHIDEventGetFloatValue();
        id v2 = (char *)&dword_10005C668[8 * IntegerValue];
        *(void *)id v2 = v3;
        IOHIDEventGetFloatValue();
        *((void *)v2 + 1) = v4;
        IOHIDEventGetFloatValue();
        *((void *)v2 + 2) = v5;
        *((_DWORD *)v2 + 6) = 1;
      }
      else
      {
        dword_10005C668[8 * IntegerValue + 6] = 0;
      }
      byte_10005C660 = 1;
    }
    uint64_t result = IOHIDEventGetChildren();
    if (result)
    {
      CFArrayRef v6 = (const __CFArray *)result;
      uint64_t result = CFArrayGetCount((CFArrayRef)result);
      if (result >= 1)
      {
        CFIndex v7 = 0;
        int v8 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
          sub_100007E80(ValueAtIndex);
          CFIndex v7 = (unsigned __int16)++v8;
          uint64_t result = CFArrayGetCount(v6);
        }
        while (result > (unsigned __int16)v8);
      }
    }
  }
  return result;
}

id sub_100007FD4()
{
  v0 = [RDMutex alloc];

  return [(RDMutex *)v0 initWithoutTracking];
}

void sub_100008FA8(id a1)
{
  qword_10005C970 = +[NSMutableSet set];

  _objc_release_x1();
}

id sub_100009198(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTermsAndConditions];
}

void sub_100009524(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v1 performSelector:"userFinishedTermsAndConditions:" withObject:v2];
}

void sub_10000A088(id a1, BOOL a2)
{
  BOOL v2 = a2;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "activated:%d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 285, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]_block_invoke", 7, 0, "activated:%d", v2);
}

void sub_10000A164(uint64_t a1, int a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "deactivated:%d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerShareSettings.m", 134, 288, "-[IDSSessionEmbeddedControllerShareSettings showUserTermsAndConditions]_block_invoke", 7, 0, "deactivated:%d", a2);
  BOOL v4 = [*(id *)(a1 + 32) vsSemaphore];
  dispatch_semaphore_signal(v4);
}

void sub_10000AE98(id a1)
{
  qword_10005C970 = +[NSMutableSet set];

  _objc_release_x1();
}

id sub_10000B370(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldStartScreenSharingSession];
}

void sub_10000B8B0(id a1, BOOL a2)
{
  BOOL v2 = a2;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "activated:%d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 283, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]_block_invoke", 7, 0, "activated:%d", v2);
}

void sub_10000B98C(uint64_t a1, int a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "deactivated:%d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerAppleCare.m", 130, 286, "-[IDSSessionEmbeddedControllerAppleCare showUserTermsAndConditions]_block_invoke", 7, 0, "deactivated:%d", a2);
  BOOL v4 = [*(id *)(a1 + 32) vsSemaphore];
  dispatch_semaphore_signal(v4);
}

void sub_10000BD14(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v1 performSelector:"userFinishedTermsAndConditions:" withObject:v2];
}

uint64_t sub_10000BE74(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  for (uint64_t i = 0; a3; --a3)
  {
    int v5 = *a1++;
    int v4 = v5;
    int v6 = *a2++;
    uint64_t i = i | v6 ^ v4;
  }
  return i;
}

void sub_10000C1A8(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(OS_xpc_object *)v2 description];
    *(_DWORD *)buf = 136315138;
    id v6 = [v3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "xpc_set_event_stream_handler: xpcEvent:%s", buf, 0xCu);
  }
  id v4 = [(OS_xpc_object *)v2 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 221, "-[IDSServiceEmbeddedController initScreenSharingIDSService]_block_invoke", 7, 0, "xpc_set_event_stream_handler: xpcEvent:%s", (const char *)[v4 UTF8String]);
}

void sub_100010588(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setWallpaperSuspensionAssertion:a2];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) wallpaperSuspensionAssertion];
    *(_DWORD *)buf = 134217984;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "wallpaper assertion %p", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) wallpaperSuspensionAssertion];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 934, "-[IDSServiceEmbeddedController addActiveSession:]_block_invoke", 7, 0, "wallpaper assertion %p", v4);
}

void sub_100010DA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) exitTimer];

  if (!v2)
  {
    id v3 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"exitTimerCallback:" selector:0 userInfo:0 repeats:30.0];
    [*(id *)(a1 + 32) setExitTimer:v3];
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v4, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1041, "-[IDSServiceEmbeddedController checkIfNoSessions]_block_invoke", 7, 0, "created timer");
}

void sub_10001111C(id a1, BOOL a2)
{
  BOOL v2 = a2;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "acquired:%d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1089, "-[IDSServiceEmbeddedController createStatusBar]_block_invoke", 7, 0, "acquired:%d", v2);
}

void sub_1000111F8(id a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalidationHandler", v1, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1092, "-[IDSServiceEmbeddedController createStatusBar]_block_invoke", 7, 0, "invalidationHandler");
}

id sub_100011300()
{
  [(id)qword_10005C900 setScreenLocked:sub_10001E630()];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification called screen is locked", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 154, "LockStatusChangedCFNotification", 7, 0, "notification called screen is locked");
  id v0 = [(id)qword_10005C900 screenLocked];
  unsigned int v1 = [(id)qword_10005C900 screenPausedBeforeLock];
  unsigned int v2 = v1;
  if (v0)
  {
    BOOL v3 = sub_100035448();
    if (v2)
    {
      if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFIndex v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen was already paused", v7, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 159, "LockStatusChangedCFNotification", 7, 0, "screen was already paused");
    }
    else
    {
      if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to pause since locked screen", v6, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 164, "LockStatusChangedCFNotification", 7, 0, "going to pause since locked screen");
      [(id)qword_10005C900 pauseScreenSharing:1 pausingDueToScreenLock:1];
    }
  }
  else if ((v1 & 1) == 0)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to unpause since unlocked screen", v5, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 179, "LockStatusChangedCFNotification", 7, 0, "going to unpause since unlocked screen");
    [(id)qword_10005C900 pauseScreenSharing:0];
  }
  return [(id)qword_10005C900 sendLockScreenChangeMessageToAllSessions:v0];
}

id sub_100011DB0(uint64_t a1, uint64_t a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = [(id)qword_10005C970 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AskToToCopyToPasteboarCallback  called  count %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1220, "AskToCopyToPasteboardCallback", 7, 0, "AskToToCopyToPasteboarCallback  called  count %ld", [(id)qword_10005C970 count]);
  if ([(id)qword_10005C900 askToCopyToPasteboardNotification])
  {
    CFRelease([(id)qword_10005C900 askToCopyToPasteboardNotification]);
    [(id)qword_10005C900 setAskToCopyToPasteboardNotification:0];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cleared notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1226, "AskToCopyToPasteboardCallback", 7, 0, "cleared notification");
  }
  BOOL v3 = [(id)qword_10005C900 askToCopyToPasteboardTimeoutTimer];

  if (v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "get rid of timer", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1231, "AskToCopyToPasteboardCallback", 7, 0, "get rid of timer");
    BOOL v4 = [(id)qword_10005C900 askToCopyToPasteboardTimeoutTimer];
    [v4 invalidate];

    [(id)qword_10005C900 setAskToCopyToPasteboardTimeoutTimer:0];
  }
  switch(a2)
  {
    case 1:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "alternate response - user declined", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1246, "AskToCopyToPasteboardCallback", 7, 0, "alternate response - user declined");
      int v5 = [(id)qword_10005C900 askToCopyToPasteboardDelegate];
      id v8 = [(id)qword_10005C900 askToCopyToPasteboardToken];
      uint64_t v9 = v5;
      uint64_t v10 = 0;
      goto LABEL_33;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification was cancelled", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1251, "AskToCopyToPasteboardCallback", 7, 0, "notification was cancelled");
      if (![(id)qword_10005C900 askToCopyToPasteboardTimedOut])
      {
        BOOL v11 = sub_10001E630();
        BOOL v12 = sub_100035448();
        if (v11)
        {
          if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is still locked?", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1261, "AskToCopyToPasteboardCallback", 7, 0, "screen is still locked?");
        }
        else
        {
          if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen was locked and is now unlocked  post new notification", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1265, "AskToCopyToPasteboardCallback", 7, 0, "screen was locked and is now unlocked  post new notification");
          [(id)qword_10005C900 postAskToCopyToPasteboardNotification];
        }
        return [(id)qword_10005C900 setAskToCopyToPasteboardUserMessage:0];
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification timed out", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1254, "AskToCopyToPasteboardCallback", 7, 0, "notification timed out");
      int v5 = [(id)qword_10005C900 askToCopyToPasteboardDelegate];
      id v8 = [(id)qword_10005C900 askToCopyToPasteboardToken];
      uint64_t v9 = v5;
      uint64_t v10 = 2;
LABEL_33:
      [v9 userRequestResult:v10 senderToken:v8];
LABEL_34:

      return [(id)qword_10005C900 setAskToCopyToPasteboardUserMessage:0];
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other response - user accepted", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1238, "AskToCopyToPasteboardCallback", 7, 0, "other response - user accepted");
      int v5 = +[UIPasteboard generalPasteboard];
      id v6 = [(id)qword_10005C900 askToCopyToPasteboardUserMessage];
      [v5 setString:v6];

      CFIndex v7 = [(id)qword_10005C900 askToCopyToPasteboardDelegate];
      objc_msgSend(v7, "userRequestResult:senderToken:", 1, objc_msgSend((id)qword_10005C900, "askToCopyToPasteboardToken"));

      goto LABEL_34;
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected response", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1271, "AskToCopyToPasteboardCallback", 7, 0, "unexpected response");
  return [(id)qword_10005C900 setAskToCopyToPasteboardUserMessage:0];
}

void sub_100012418(uint64_t a1)
{
  unsigned int v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"askToToCopyToPasteboardTimeout:" selector:0 userInfo:0 repeats:28.0];
  [*(id *)(a1 + 32) setAskToCopyToPasteboardTimeoutTimer:v2];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1212, "-[IDSServiceEmbeddedController postAskToCopyToPasteboardNotification]_block_invoke", 7, 0, "created timer");
}

void sub_10001301C(uint64_t a1, uint64_t a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v18 = [(id)qword_10005C970 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AskToOpenURLCallback  called  count %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1411, "AskToOpenURLCallback", 7, 0, "AskToOpenURLCallback  called  count %ld", [(id)qword_10005C970 count]);
  if ([(id)qword_10005C900 askToOpenURLNotification])
  {
    CFRelease([(id)qword_10005C900 askToOpenURLNotification]);
    [(id)qword_10005C900 setAskToOpenURLNotification:0];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cleared notification", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1417, "AskToOpenURLCallback", 7, 0, "cleared notification");
  }
  BOOL v3 = [(id)qword_10005C900 askToOpenURLTimeoutTimer];

  if (v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "get rid of timer", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1422, "AskToOpenURLCallback", 7, 0, "get rid of timer");
    BOOL v4 = [(id)qword_10005C900 askToOpenURLTimeoutTimer];
    [v4 invalidate];

    [(id)qword_10005C900 setAskToOpenURLTimeoutTimer:0];
  }
  switch(a2)
  {
    case 1:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "alternate response - user declined", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1438, "AskToOpenURLCallback", 7, 0, "alternate response - user declined");
      BOOL v11 = [(id)qword_10005C900 askToOpenURLDelegate];
      id v12 = [(id)qword_10005C900 askToOpenURLToken];
      v13 = v11;
      uint64_t v14 = 0;
      goto LABEL_36;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification was cancelled", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1443, "AskToOpenURLCallback", 7, 0, "notification was cancelled");
      if ([(id)qword_10005C900 askToOpenURLTimedOut])
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification timed out", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1446, "AskToOpenURLCallback", 7, 0, "notification timed out");
        BOOL v11 = [(id)qword_10005C900 askToOpenURLDelegate];
        id v12 = [(id)qword_10005C900 askToOpenURLToken];
        v13 = v11;
        uint64_t v14 = 2;
        goto LABEL_36;
      }
      BOOL v15 = sub_10001E630();
      BOOL v16 = sub_100035448();
      if (v15)
      {
        if (v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is still locked?", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1453, "AskToOpenURLCallback", 7, 0, "screen is still locked?");
      }
      else
      {
        if (v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen was locked and is now unlocked  post new notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1457, "AskToOpenURLCallback", 7, 0, "screen was locked and is now unlocked  post new notification");
        [(id)qword_10005C900 postAskToOpenURLNotification];
      }
      break;
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other response - user said open*", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1429, "AskToOpenURLCallback", 7, 0, "other response - user said open*");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [(id)qword_10005C900 urlToOpen];
        id v6 = [v5 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "url string is %s", buf, 0xCu);
      }
      id v7 = [(id)qword_10005C900 urlToOpen];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1430, "AskToOpenURLCallback", 7, 0, "url string is %s", (const char *)[v7 UTF8String]);

      id v8 = +[LSApplicationWorkspace defaultWorkspace];
      uint64_t v9 = [(id)qword_10005C900 urlToOpen];
      uint64_t v10 = +[NSURL URLWithString:v9];
      [v8 openURL:v10];

      BOOL v11 = [(id)qword_10005C900 askToOpenURLDelegate];
      id v12 = [(id)qword_10005C900 askToOpenURLToken];
      v13 = v11;
      uint64_t v14 = 1;
LABEL_36:
      [v13 userRequestResult:v14 senderToken:v12];

      return;
    default:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected response", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1463, "AskToOpenURLCallback", 7, 0, "unexpected response");
      break;
  }
}

void sub_100013754(uint64_t a1)
{
  unsigned int v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"askToOpenURLTimeout:" selector:0 userInfo:0 repeats:28.0];
  [*(id *)(a1 + 32) setAskToOpenURLTimeoutTimer:v2];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1404, "-[IDSServiceEmbeddedController postAskToOpenURLNotification]_block_invoke", 7, 0, "created timer");
}

void sub_100014278(uint64_t a1, uint64_t a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v16 = COERCE_DOUBLE([(id)qword_10005C970 count]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AskToResumeCallback callback called  count %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1601, "AskToResumeCallback", 7, 0, "AskToResumeCallback callback called  count %ld", [(id)qword_10005C970 count]);
  if ([(id)qword_10005C900 askToResumeNotification])
  {
    CFRelease([(id)qword_10005C900 askToResumeNotification]);
    [(id)qword_10005C900 setAskToResumeNotification:0];
  }
  BOOL v3 = [(id)qword_10005C900 askToResumeTimeoutTimer];

  if (v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "get rid of timer", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1611, "AskToResumeCallback", 7, 0, "get rid of timer");
    BOOL v4 = [(id)qword_10005C900 askToResumeTimeoutTimer];
    [v4 invalidate];

    [(id)qword_10005C900 setAskToResumeTimeoutTimer:0];
  }
  switch(a2)
  {
    case 1:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "alternate response - user declined", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1624, "AskToResumeCallback", 7, 0, "alternate response - user declined");
      id v5 = [(id)qword_10005C900 askToResumeDelegate];
      id v6 = [(id)qword_10005C900 askToResumeToken];
      id v7 = v5;
      uint64_t v8 = 0;
      goto LABEL_33;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification was cancelled", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1629, "AskToResumeCallback", 7, 0, "notification was cancelled");
      uint64_t v9 = +[NSDate date];
      uint64_t v10 = [(id)qword_10005C900 notificationStartTime];
      [v9 timeIntervalSinceDate:v10];
      double v12 = v11;

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "timeUsed = %f", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1631, "AskToResumeCallback", 7, 0, "timeUsed = %f", v12);
      if ([(id)qword_10005C900 askToResumeTimedOut])
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification timed out", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1635, "AskToResumeCallback", 7, 0, "notification timed out");
        id v5 = [(id)qword_10005C900 askToResumeDelegate];
        id v6 = [(id)qword_10005C900 askToResumeToken];
        id v7 = v5;
        uint64_t v8 = 2;
        goto LABEL_33;
      }
      BOOL v13 = sub_10001E630();
      BOOL v14 = sub_100035448();
      if (v13)
      {
        if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is still locked?", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1642, "AskToResumeCallback", 7, 0, "screen is still locked?");
      }
      else
      {
        if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen was locked and is now unlocked  post new notification", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1646, "AskToResumeCallback", 7, 0, "screen was locked and is now unlocked  post new notification");
        [(id)qword_10005C900 postAskToResumeNotification];
      }
      break;
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other response - user accepted", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1618, "AskToResumeCallback", 7, 0, "other response - user accepted");
      [(id)qword_10005C900 pauseScreenSharing:0];
      id v5 = [(id)qword_10005C900 askToResumeDelegate];
      id v6 = [(id)qword_10005C900 askToResumeToken];
      id v7 = v5;
      uint64_t v8 = 1;
LABEL_33:
      [v7 userRequestResult:v8 senderToken:v6];

      return;
    default:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected response", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1652, "AskToResumeCallback", 7, 0, "unexpected response");
      break;
  }
}

void sub_1000148F8(uint64_t a1)
{
  unsigned int v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"askToResumeTimeout:" selector:0 userInfo:0 repeats:28.0];
  [*(id *)(a1 + 32) setAskToResumeTimeoutTimer:v2];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1593, "-[IDSServiceEmbeddedController postAskToResumeNotification]_block_invoke", 7, 0, "created timer");
}

void sub_1000152EC(uint64_t a1, uint64_t a2)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ShowUserMessageCallback", v7, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1769, "ShowUserMessageCallback", 7, 0, "ShowUserMessageCallback");
  if ([(id)qword_10005C900 showUserMessageNotification])
  {
    CFRelease([(id)qword_10005C900 showUserMessageNotification]);
    [(id)qword_10005C900 setShowUserMessageNotification:0];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cleared notification", v7, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1775, "ShowUserMessageCallback", 7, 0, "cleared notification");
  }
  BOOL v3 = [(id)qword_10005C900 showUserMessageTimeoutTimer];

  if (v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "get rid of timer", v7, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1780, "ShowUserMessageCallback", 7, 0, "get rid of timer");
    BOOL v4 = [(id)qword_10005C900 showUserMessageTimeoutTimer];
    [v4 invalidate];

    [(id)qword_10005C900 setShowUserMessageTimeoutTimer:0];
  }
  switch(a2)
  {
    case 1:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "alternate response - user declined", v7, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1791, "ShowUserMessageCallback", 7, 0, "alternate response - user declined");
      break;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification was cancelled", v7, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1795, "ShowUserMessageCallback", 7, 0, "notification was cancelled");
      if ([(id)qword_10005C900 showUserMessageTimedOut])
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v7 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification timed out", v7, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1798, "ShowUserMessageCallback", 7, 0, "notification timed out");
      }
      else
      {
        BOOL v5 = sub_10001E630();
        BOOL v6 = sub_100035448();
        if (v5)
        {
          if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v7 = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is still locked?", v7, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1804, "ShowUserMessageCallback", 7, 0, "screen is still locked?");
        }
        else
        {
          if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v7 = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen was locked and is now unlocked  post new notification", v7, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1808, "ShowUserMessageCallback", 7, 0, "screen was locked and is now unlocked  post new notification");
          [(id)qword_10005C900 postShowUserMessageNotification];
        }
      }
      break;
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other response - user accepted", v7, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1787, "ShowUserMessageCallback", 7, 0, "other response - user accepted");
      break;
    default:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected response", v7, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1814, "ShowUserMessageCallback", 7, 0, "unexpected response");
      break;
  }
}

void sub_10001581C(uint64_t a1)
{
  unsigned int v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"showUserMessageTimeout:" selector:0 userInfo:0 repeats:28.0];
  [*(id *)(a1 + 32) setShowUserMessageTimeoutTimer:v2];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1761, "-[IDSServiceEmbeddedController postShowUserMessageNotification]_block_invoke", 7, 0, "created timer");
}

void sub_100016148()
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ShowUserMessageCallback", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1923, "ShowViewerPausedMessageCallback", 7, 0, "ShowUserMessageCallback");
  if ([(id)qword_10005C900 showViewerPausedNotification])
  {
    CFRelease([(id)qword_10005C900 showViewerPausedNotification]);
    [(id)qword_10005C900 setShowViewerPausedNotification:0];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v0 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cleared notification", v0, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1929, "ShowViewerPausedMessageCallback", 7, 0, "cleared notification");
  }
}

void sub_10001627C(uint64_t a1)
{
  unsigned int v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"showViewerPausedTimeout:" selector:0 userInfo:0 repeats:28.0];
  [*(id *)(a1 + 32) setShowViewerPausedTimeoutTimer:v2];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "created timer", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 1915, "-[IDSServiceEmbeddedController postViewerPausedMessageNotification]_block_invoke", 7, 0, "created timer");
}

void sub_10001915C(uint64_t a1)
{
  unsigned int v2 = objc_opt_new();
  [*(id *)(a1 + 32) setVsHelper:v2];

  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 vsHelper];
  [v4 setDelegate:v3];

  BOOL v5 = [*(id *)(a1 + 32) vsHelper];
  [v5 run];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setup viewservice helper", v6, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2308, "-[IDSServiceEmbeddedController initViewServiceHelper]_block_invoke", 7, 0, "setup viewservice helper");
}

uint64_t sub_10001A484()
{
  if ((byte_10005C911 & 1) == 0)
  {
    id v0 = (const void *)MGCopyAnswer();
    if (v0)
    {
      unsigned int v1 = v0;
      byte_10005C910 = CFEqual(v0, @"Internal") != 0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v4 = byte_10005C910;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "build is %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSServiceEmbeddedController.m", 121, 2412, "InternalBuildInstalled", 7, 0, "build is %d", byte_10005C910);
      CFRelease(v1);
    }
    byte_10005C911 = 1;
  }
  return byte_10005C910;
}

void sub_10001A5BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001A5D8(uint64_t a1)
{
  if (sub_10002E618(1, 0, (dispatch_semaphore_t *)(a1 + 24)))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create s->sendSemaphoreUDP", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 64, "InitializeUDPSendThread", 7, 0, "Unable to create s->sendSemaphoreUDP");
  }
  id v2 = sub_100007FD4();
  *(void *)(a1 + 32) = v2;
  if (!v2)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create s->bufferPtrCRUDP", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 68, "InitializeUDPSendThread", 7, 0, "Unable to create s->bufferPtrCRUDP");
  }
  id v3 = sub_100007FD4();
  *(void *)(a1 + 64) = v3;
  if (!v3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create s->UDPSendCR", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 72, "InitializeUDPSendThread", 7, 0, "Unable to create s->UDPSendCR");
  }
  id v4 = sub_100007FD4();
  *(void *)(a1 + 56) = v4;
  if (!v4)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create s->sendInfoCR", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 76, "InitializeUDPSendThread", 7, 0, "Unable to create s->sendInfoCR");
  }
  if (sub_10002E618(1, 0, (dispatch_semaphore_t *)(a1 + 40)))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create s->statusSempahore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 80, "InitializeUDPSendThread", 7, 0, "Unable to create s->statusSempahore");
  }
  int v5 = sub_100006CE0((void *(__cdecl *)(void *))sub_10001A9D8, (void *)a1, (pthread_t *)(a1 + 72));
  if (v5)
  {
    int v6 = v5;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create server send thread %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 90, "InitializeUDPSendThread", 7, 0, "Unable to create server send thread %d", v6);
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "INITAILIALIZED UDP SEND INFO", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 92, "InitializeUDPSendThread", 7, 0, "INITAILIALIZED UDP SEND INFO");
}

void sub_10001A9D8(uint64_t a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***UDPSend_ScreenSharing", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 188, "UDPSend_ScreenSharing", 7, 0, "***UDPSend_ScreenSharing");
  [*(id *)(a1 + 64) lock];
  *(_DWORD *)(a1 + 104) = sub_10002B5E0();
  if (*(unsigned __int8 *)(a1 + 114) - 1 <= 1)
  {
    unsigned __int16 v2 = *(_WORD *)(a1 + 2702) * *(_WORD *)(a1 + 2708) + 30;
    id v3 = malloc_type_calloc(1uLL, v2, 0xD7E2CDE8uLL);
    BOOL v4 = sub_100035448();
    if (!v3)
    {
      if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to allocate memory", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1325, "SendMachineIndex", 7, 0, "Unable to allocate memory");
      exit(1);
    }
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send macine index", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1328, "SendMachineIndex", 7, 0, "send macine index");
    _DWORD *v3 = 50331904;
    v3[3] = bswap32(*(_DWORD *)a1);
    *((_WORD *)v3 + 9) = 0;
    v3[2] = bswap32(*(_DWORD *)(a1 + 84) + 1);
    *((_WORD *)v3 + 8) = bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16;
    unsigned int v5 = *(unsigned __int16 *)(a1 + 2702);
    __int16 v6 = __rev16(v5);
    *((_WORD *)v3 + 10) = v6;
    *((_WORD *)v3 + 11) = 256;
    *((_WORD *)v3 + 12) = v6;
    *((_WORD *)v3 + 13) = bswap32(*(unsigned __int16 *)(a1 + 2706)) >> 16;
    if (v5)
    {
      int v7 = 0;
      int v8 = *(_WORD **)(a1 + 3248);
      uint64_t v9 = (char *)(v3 + 7);
      do
      {
        if (*v8 != 2)
        {
          memcpy(v9, v8 + 38, *(unsigned __int16 *)(a1 + 2708));
          v9 += *(unsigned __int16 *)(a1 + 2708);
          LOWORD(v5) = *(_WORD *)(a1 + 2702);
        }
        v8 += 60;
        ++v7;
      }
      while ((unsigned __int16)v7 < (unsigned __int16)v5);
    }
    if (!sub_10001BDA0(a1, 0))
    {
      sub_10001D3CC(a1, v3, v2);
      sub_10001D8B8(a1, (uint64_t)v3, v2, 0);
      ++*(_DWORD *)(a1 + 84);
    }
  }
  int v61 = sub_10003362C();
  if (*(unsigned char *)(a1 + 3173))
  {
    int v62 = 0;
    goto LABEL_92;
  }
  int v62 = 0;
  uint64_t v10 = (void *)(a1 + 8);
LABEL_22:
  intptr_t v11 = sub_10002E894(*(NSObject **)(a1 + 24), 0xBB8u);
  if (*(unsigned char *)(a1 + 3173))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UDPSend stop", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 210, "UDPSend_ScreenSharing", 7, 0, "UDPSend stop");
    goto LABEL_92;
  }
  intptr_t v12 = v11;
  [*(id *)(a1 + 32) lock];
  BOOL v13 = *(void **)(a1 + 8);
  if (!v13)
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    [*(id *)(a1 + 32) unlock];
    if (v12)
    {
      sub_10001CA08(a1);
      sub_10001D1B8(a1);
    }
    goto LABEL_84;
  }
  int v14 = *((unsigned __int16 *)v13 + 6);
  BOOL v15 = *(void **)(a1 + 16);
  if (v13 == v15 || (v14 & 1) != 0)
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    v17 = v13;
    goto LABEL_46;
  }
  LODWORD(v18) = 0;
  int v19 = v62 + 1;
  LOWORD(v20) = *((_WORD *)v13 + 6);
  v21 = *(_DWORD **)(a1 + 8);
  while (1)
  {
    int v22 = v19;
    uint64_t v18 = (v21[2] + v18);
    if (!*(void *)v21) {
      break;
    }
    if ((v20 & 1) == 0)
    {
      int v20 = *(unsigned __int16 *)(*(void *)v21 + 12);
      ++v19;
      v21 = *(_DWORD **)v21;
      if (((v20 ^ v14) & 0x10) == 0) {
        continue;
      }
    }
    goto LABEL_37;
  }
  if (v15 == (void *)v21)
  {
LABEL_37:
    int v62 = v22;
    v17 = malloc_type_malloc(v18 + 14, 0x9DFF3392uLL);
    *(void *)v17 = 0;
    v17[2] = 0;
    *((_WORD *)v17 + 6) = 0;
    while (*v13 || *(void **)(a1 + 16) == v13)
    {
      memcpy((char *)v17 + v17[2] + 14, (char *)v13 + 14, *((unsigned int *)v13 + 2));
      *((_WORD *)v17 + 6) |= *((_WORD *)v13 + 6);
      v17[2] += *((_DWORD *)v13 + 2);
      v23 = (void *)*v13;
      __int16 v24 = *((_WORD *)v13 + 6);
      free(v13);
      if (v23)
      {
        BOOL v13 = v23;
        if ((v24 & 1) == 0) {
          continue;
        }
      }
      if ((v24 & 1) != 0 && v23)
      {
        *uint64_t v10 = v23;
      }
      else
      {
        *uint64_t v10 = 0;
        v10[1] = 0;
      }
LABEL_46:
      [*(id *)(a1 + 32) unlock];
      if (*(unsigned char *)(a1 + 3173))
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terminate flag set", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 304, "UDPSend_ScreenSharing", 7, 0, "terminate flag set");
        goto LABEL_92;
      }
      int v25 = *((unsigned __int16 *)v17 + 6);
      uint64_t v26 = v17[2];
      if (v26)
      {
        v27 = (char *)v17 + 14;
        __int16 v63 = *((_WORD *)v17 + 6);
        int v28 = (v25 << 30 >> 31) & 0x600;
        unsigned int v29 = v17[2];
        while (1)
        {
          if (v29 >= 0x44C) {
            size_t v30 = 1100;
          }
          else {
            size_t v30 = v29;
          }
          unsigned __int16 v31 = v30 + 20;
          v32 = malloc_type_malloc((v30 + 20), 0x42C34F47uLL);
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = (uint64_t)v32;
          *(_WORD *)v32 = 256;
          v32[3] = bswap32(*(_DWORD *)a1);
          *((_WORD *)v32 + 9) = 0;
          *((_WORD *)v32 + 1) = v28;
          v32[2] = bswap32(*(_DWORD *)(a1 + 84) + 1);
          *((_WORD *)v32 + 8) = bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16;
          if (*(unsigned __int8 *)(a1 + 114) - 3 <= 1) {
            v32[3] = bswap32(*(_DWORD *)(a1 + 3164));
          }
          memcpy(v32 + 5, v27, v30);
          int v34 = sub_10001BDA0(a1, 0);
          if (v34) {
            break;
          }
          *(_WORD *)(v33 + 18) = 0;
          sub_10001D3CC(a1, (_DWORD *)v33, (unsigned __int16)(v30 + 20));
          sub_10001D8B8(a1, v33, v31, v30);
          ++*(_DWORD *)(a1 + 84);
          sub_10001CA08(a1);
          if (*(unsigned __int8 *)(a1 + 114) - 3 <= 1) {
            *(_DWORD *)(a1 + 3164) += v31;
          }
          v27 += v30;
          v29 -= v30;
          if (!v29)
          {
            *(void *)(a1 + 3200) += v26;
            uint64_t v10 = (void *)(a1 + 8);
            LOBYTE(v25) = v63;
            goto LABEL_64;
          }
        }
        int v38 = v34;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v65) = v38;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error from validatepackets %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 589, "SendBufferToUDPReceivers", 7, 0, "error from validatepackets %d", v38);
        free((void *)v33);
LABEL_91:
        *(unsigned char *)(a1 + 3173) = 1;
LABEL_92:
        [*(id *)(a1 + 56) lock];
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = *(unsigned __int8 *)(a1 + 3173);
          *(_DWORD *)buf = 67109120;
          LODWORD(v65) = v39;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "s->terminateThreadFlag = %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 455, "UDPSend_ScreenSharing", 7, 0, "s->terminateThreadFlag = %d", *(unsigned __int8 *)(a1 + 3173));
        if (sub_10002E740(*(NSObject **)(a1 + 24)))
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to delete s->sendSemaphoreUDP", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 459, "UDPSend_ScreenSharing", 7, 0, "Unable to delete s->sendSemaphoreUDP");
        }
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terminate udp send thread - delete s->sendSemaphoreUDP", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 461, "UDPSend_ScreenSharing", 7, 0, "terminate udp send thread - delete s->sendSemaphoreUDP");
        *(void *)(a1 + 24) = 0;

        *(void *)(a1 + 32) = 0;
        *(void *)(a1 + 56) = 0;
        v40 = *(void **)(a1 + 8);
        if (v40)
        {
          do
          {
            v41 = (void *)*v40;
            free(v40);
            v40 = v41;
          }
          while (v41);
        }
        uint64_t v42 = 0;
        while (1)
        {
          v43 = *(void **)(a1 + 120 + v42);
          if (v43) {
            free(v43);
          }
          v42 += 8;
          if (v42 == 1024)
          {
            if (!*(unsigned char *)(a1 + 3272) && !*(void *)(a1 + 3240))
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v44 = *(_DWORD *)(a1 + 2696);
                *(_DWORD *)buf = 67109120;
                LODWORD(v65) = v44;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "close %d", buf, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 496, "UDPSend_ScreenSharing", 7, 0, "close %d", *(_DWORD *)(a1 + 2696));
              if (close(*(_DWORD *)(a1 + 2696)))
              {
                v45 = __error();
                v46 = strerror(*v45);
                sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 499, "UDPSend_ScreenSharing", 7, 0, "error closing socket %s", v46);
              }
            }
            v47 = *(NSObject **)(a1 + 48);
            if (v47) {
              sub_10002E7F4(v47);
            }
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v48 = sub_10003362C();
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v48 - v61;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TOTAL TIME UDPSend Thread %u", buf, 8u);
            }
            int v49 = sub_10003362C();
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 506, "UDPSend_ScreenSharing", 7, 0, "TOTAL TIME UDPSend Thread %u", v49 - v61);
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v50 = *(unsigned __int16 *)(a1 + 112);
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v50;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending RetryInterval: %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 507, "UDPSend_ScreenSharing", 7, 0, "Ending RetryInterval: %u", *(unsigned __int16 *)(a1 + 112));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v51 = *(_DWORD *)(a1 + 3176);
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v51;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missed Packets Sent: %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 508, "UDPSend_ScreenSharing", 7, 0, "Missed Packets Sent: %u", *(_DWORD *)(a1 + 3176));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v52 = *(_DWORD *)(a1 + 96);
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v52;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Last Validated Packet: %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 509, "UDPSend_ScreenSharing", 7, 0, "Last Validated Packet: %u", *(_DWORD *)(a1 + 96));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v53 = *(_DWORD *)(a1 + 3184);
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v53;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Status Requests Sent: %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 510, "UDPSend_ScreenSharing", 7, 0, "Status Requests Sent: %u", *(_DWORD *)(a1 + 3184));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v54 = *(_DWORD **)(a1 + 3200);
              *(_DWORD *)buf = 134217984;
              v65 = v54;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Total Bytes Sent: %lu", buf, 0xCu);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 512, "UDPSend_ScreenSharing", 7, 0, "Total Bytes Sent: %lu", *(void *)(a1 + 3200));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v55 = *(_DWORD **)(a1 + 3208);
              *(_DWORD *)buf = 134217984;
              v65 = v55;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Total Bytes Validated: %lu", buf, 0xCu);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 513, "UDPSend_ScreenSharing", 7, 0, "Total Bytes Validated: %lu", *(void *)(a1 + 3208));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v56 = *(_DWORD **)(a1 + 3256);
              *(_DWORD *)buf = 134217984;
              v65 = v56;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Estimated Thruput: %lu", buf, 0xCu);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 514, "UDPSend_ScreenSharing", 7, 0, "Estimated Thruput: %lu", *(void *)(a1 + 3256));
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v62;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collated Buffers %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 515, "UDPSend_ScreenSharing", 7, 0, "Collated Buffers %u", v62);
            [*(id *)(a1 + 64) unlock];
            pthread_exit(0);
          }
        }
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v65 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "buffsize is 0 %p", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 382, "UDPSend_ScreenSharing", 7, 0, "buffsize is 0 %p", v17);
      uint64_t v26 = 0;
LABEL_64:
      [*(id *)(a1 + 32) lock];
      uint64_t v35 = *(void *)(a1 + 3192) - v26;
      *(void *)(a1 + 3192) = v35;
      if (v35 < 0)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *(_DWORD **)(a1 + 3192);
          *(_DWORD *)buf = 134217984;
          v65 = v36;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "total bytes pending is < 0 %lld", buf, 0xCu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 388, "UDPSend_ScreenSharing", 7, 0, "total bytes pending is < 0 %lld", *(void *)(a1 + 3192));
      }
      if (!*v10 && *(void *)(a1 + 3192))
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = *(void *)(a1 + 3192);
          *(_DWORD *)buf = 67109120;
          LODWORD(v65) = v37;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bytes still pending! %u", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 395, "UDPSend_ScreenSharing", 7, 0, "bytes still pending! %u", *(void *)(a1 + 3192));
      }
      [*(id *)(a1 + 32) unlock];
      free(v17);
      if ((v25 & 1) == 0)
      {
        if ((v25 & 2) == 0) {
          goto LABEL_77;
        }
LABEL_83:
        sub_10001BDA0(a1, 1);
        if ((v25 & 1) == 0) {
          goto LABEL_84;
        }
LABEL_159:
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBFlagLastBuffer set - break out", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 431, "UDPSend_ScreenSharing", 7, 0, "kRFBFlagLastBuffer set - break out");
        goto LABEL_92;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "last buffer not at end of linked list!", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 411, "UDPSend_ScreenSharing", 7, 0, "last buffer not at end of linked list!");
      if ((v25 & 2) != 0) {
        goto LABEL_83;
      }
LABEL_77:
      if (v25) {
        goto LABEL_159;
      }
LABEL_84:
      if (*(unsigned char *)(a1 + 3173)) {
        goto LABEL_92;
      }
      goto LABEL_22;
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v57 = (_DWORD *)*v13;
      uint64_t v58 = *(void *)(a1 + 16);
      *(_DWORD *)buf = 134218240;
      v65 = v57;
      __int16 v66 = 2048;
      uint64_t v67 = v58;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "p->next %p s->lastFrameBuffer %p", buf, 0x16u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 259, "UDPSend_ScreenSharing", 5, 0, "p->next %p s->lastFrameBuffer %p", *v13);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v59 = *(_DWORD **)v21;
      uint64_t v60 = *(void *)(a1 + 16);
      *(_DWORD *)buf = 134218240;
      v65 = v59;
      __int16 v66 = 2048;
      uint64_t v67 = v60;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "p->next %p s->lastFrameBuffer %p", buf, 0x16u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 236, "UDPSend_ScreenSharing", 5, 0, "p->next %p s->lastFrameBuffer %p", *(void *)v21);
  }
  exit(90);
}

uint64_t sub_10001BCF8(uint64_t a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StopUDPSendThread", v3, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 110, "StopUDPSendThread", 7, 0, "StopUDPSendThread");
  *(unsigned char *)(a1 + 3173) = 1;
  return sub_10002E7F4(*(NSObject **)(a1 + 24));
}

uint64_t sub_10001BDA0(uint64_t a1, int a2)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 84);
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    unsigned int v5 = 2 * *(unsigned __int16 *)(a1 + 112);
    unsigned int v6 = *(_DWORD *)(a1 + 84);
    if (v5 <= v6)
    {
      unsigned int v7 = v6 - v5;
      unsigned int v4 = v7 + 1;
      if (v7 == -1) {
        goto LABEL_10;
      }
    }
    else
    {
      unsigned int v4 = 1;
    }
  }
  sub_10001DCE8(a1);
  unsigned int v8 = *(unsigned __int16 *)(a1 + 2710);
  int v87 = sub_10002B5E0();
  int v9 = *(_DWORD *)(a1 + 96);
  if (v9 != -1)
  {
    if (!a2 && *(_DWORD *)(a1 + 84) - v9 + 1 < 2 * *(unsigned __int16 *)(a1 + 112)) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
  if (!a2)
  {
LABEL_10:
    sub_10001CA08(a1);
LABEL_11:
    unsigned int v10 = *(_DWORD *)(a1 + 84);
    int v11 = *(_DWORD *)(a1 + 100);
    unsigned int v12 = *(unsigned __int16 *)(a1 + 112);
    if (v10 < v11 + 2 * v12 && (!(v11 + v12) || !*(unsigned char *)(a1 + 2712))) {
      return 0;
    }
    unsigned int v13 = *(_DWORD *)(a1 + 96);
    if (v13 == -1) {
      goto LABEL_181;
    }
    if (!*(_WORD *)(a1 + 2702)) {
      goto LABEL_184;
    }
    unsigned int v14 = 0;
    unsigned int v15 = 0;
    double v16 = (unsigned int *)(*(void *)(a1 + 3248) + 68);
    do
    {
      unsigned int v18 = *v16;
      v16 += 30;
      unsigned int v17 = v18;
      if (v18 > v15) {
        unsigned int v15 = v17;
      }
      ++v14;
    }
    while (v14 < *(unsigned __int16 *)(a1 + 2702));
    if (v10 >> 6 >= v15)
    {
LABEL_184:
      if (*(unsigned char *)(a1 + 2712))
      {
        unsigned int v19 = v12 >> 1;
        *(unsigned char *)(a1 + 2712) = 0;
        unsigned int v68 = *(_DWORD *)(a1 + 3168);
        BOOL v26 = v68 >= 0x3E8;
        unsigned int v69 = v68 - 1000;
        if (v26) {
          *(_DWORD *)(a1 + 3168) = v69;
        }
      }
      else
      {
        BOOL v74 = v13 > v10 - 2 * v12;
        unsigned int v19 = v12 + (v12 >> 3);
        if (v74) {
          LOWORD(v19) = v19 + 1;
        }
        else {
          LOWORD(v19) = *(_WORD *)(a1 + 112);
        }
      }
      unsigned int v19 = (unsigned __int16)v19;
      if ((unsigned __int16)v19 >= 0x3Eu) {
        unsigned int v19 = 62;
      }
      BOOL v74 = v19 > 8;
      int v75 = 8;
      goto LABEL_163;
    }
    if (*(unsigned char *)(a1 + 2712))
    {
      *(unsigned char *)(a1 + 2712) = 0;
      unsigned int v19 = v12 >> 1;
      unsigned int v20 = *(_DWORD *)(a1 + 3168) + 2000;
      if (v20 >= 0x4650) {
        unsigned int v20 = 18000;
      }
    }
    else
    {
      LOWORD(v19) = v12 + 1;
      unsigned int v76 = *(_DWORD *)(a1 + 3168);
      BOOL v26 = v76 >= 0x3E8;
      unsigned int v20 = v76 - 1000;
      if (!v26) {
        goto LABEL_160;
      }
    }
    *(_DWORD *)(a1 + 3168) = v20;
LABEL_160:
    unsigned int v19 = (unsigned __int16)v19;
    if ((unsigned __int16)v19 >= 0x28u) {
      unsigned int v19 = 40;
    }
    BOOL v74 = v19 > 4;
    int v75 = 4;
LABEL_163:
    if (v74) {
      unsigned int v12 = v19;
    }
    else {
      unsigned int v12 = v75;
    }
    [*(id *)(a1 + 56) lock];
    if (*(_WORD *)(a1 + 2702))
    {
      LODWORD(v77) = 0;
      unsigned int v78 = 0;
      v79 = (int *)(*(void *)(a1 + 3248) + 56);
      do
      {
        int v81 = *v79;
        v79 += 30;
        unsigned int v80 = v81;
        if (v81 <= (int)v77) {
          unint64_t v77 = v77;
        }
        else {
          unint64_t v77 = v80;
        }
        ++v78;
      }
      while (v78 < *(unsigned __int16 *)(a1 + 2702));
      if (v77)
      {
        unint64_t v82 = 2200000000u * (unint64_t)*(unsigned __int16 *)(a1 + 112) / v77;
        uint64_t v83 = *(void *)(a1 + 3256);
        if (v83) {
          unint64_t v82 = (v83 + (uint64_t)(v82 - v83) / 8) & ~((v83 + (uint64_t)(v82 - v83) / 8) >> 63);
        }
        *(void *)(a1 + 3256) = v82;
      }
    }
    [*(id *)(a1 + 56) unlock];
    if (v12 != *(unsigned __int16 *)(a1 + 112))
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v84 = *(unsigned __int16 *)(a1 + 112);
        *(_DWORD *)buf = 67109376;
        LODWORD(v90) = v12;
        WORD2(v90) = 1024;
        *(_DWORD *)((char *)&v90 + 6) = v84;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "new reply interval %d  old %d", buf, 0xEu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 709, "AdjustReplyInterval", 7, 0, "new reply interval %d  old %d", v12, *(unsigned __int16 *)(a1 + 112));
    }
LABEL_181:
    uint64_t result = 0;
    *(_WORD *)(a1 + 112) = v12;
    *(_DWORD *)(a1 + 100) = *(_DWORD *)(a1 + 84);
    return result;
  }
LABEL_25:
  unsigned int v85 = v8;
  char v21 = 0;
  unsigned int v86 = bswap32(v4);
  v88 = (int *)(a1 + 4 * (v4 & 0x7F) + 1144);
  do
  {
    sub_10001CA08(a1);
    if ((v21 & 1) != 0 && *(_WORD *)(a1 + 2702))
    {
      unsigned int v22 = 0;
      uint64_t v23 = *(void *)(a1 + 3248) + 48;
      do
      {
        if (*(_WORD *)(v23 - 48) != 2 && *(_DWORD *)(v23 - 4) < v4)
        {
          sched_yield();
          unsigned int v24 = *(_DWORD *)(v23 + 4);
          unsigned int v25 = sub_10002B5E0();
          if (!v24)
          {
            *(_DWORD *)(v23 + 4) = v25;
            unsigned int v24 = v25;
          }
          BOOL v26 = v25 - v24 <= 0x1DCD6500 || v25 >= v24;
          if (v26) {
            int v27 = v25;
          }
          else {
            int v27 = v24;
          }
          if (*(unsigned __int8 *)(a1 + 114) - 5 <= 0xFFFFFFFD && v27 - v24 >= 0x2AEA541)
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              LODWORD(v90) = v22;
              WORD2(v90) = 1024;
              *(_DWORD *)((char *)&v90 + 6) = v27;
              WORD5(v90) = 1024;
              HIDWORD(v90) = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fatal comm error %x time %u lasttime %u", buf, 0x14u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1737, "SendStatusRequests", 7, 0, "fatal comm error %x time %u lasttime %u", v22, v27, v24);
            *(_WORD *)(v23 - 48) = 2;
            *(_DWORD *)(v23 - 44) = -1;
            ++*(_WORD *)(a1 + 2710);
          }
          else
          {
            unsigned int v29 = *(_DWORD *)(v23 - 36);
            size_t v30 = (int *)(v23 - 12);
            if (!v29) {
              size_t v30 = (int *)v23;
            }
            int v31 = *(_DWORD *)(v23 + 8);
            if (!v31) {
              size_t v30 = (int *)(a1 + 104);
            }
            int v32 = *v30;
            int v33 = 500000 * v29 + 500000 + v31;
            if (v29 > 3) {
              int v33 = 2500000;
            }
            int v34 = 2 * v31;
            if (v29) {
              int v35 = v33;
            }
            else {
              int v35 = v34;
            }
            unsigned int v36 = *(_DWORD *)(a1 + 108) + v35;
            *(_DWORD *)(a1 + 108) = 0;
            unsigned int v37 = *(unsigned __int16 *)(a1 + 2702);
            if (v37 <= 1) {
              unsigned int v38 = 1000;
            }
            else {
              unsigned int v38 = (v37 << 11) + 5000;
            }
            if (*(_DWORD *)(v23 - 4) < 0x400u) {
              unsigned int v38 = 500000;
            }
            if (v36 <= v38) {
              unsigned int v36 = v38;
            }
            if (v36 >= 0x2625A0) {
              unsigned int v39 = 2500000;
            }
            else {
              unsigned int v39 = v36;
            }
            if (v27 - v32 > v39)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v40 = sub_10002B5E0();
                int v41 = *(_DWORD *)(v23 + 8);
                int v42 = *(_DWORD *)(a1 + 96);
                int v43 = *(unsigned __int16 *)(a1 + 112);
                int v44 = *(_DWORD *)(a1 + 104);
                int v45 = *(_DWORD *)(v23 - 36);
                *(_DWORD *)buf = 67111424;
                LODWORD(v90) = v22;
                WORD2(v90) = 1024;
                *(_DWORD *)((char *)&v90 + 6) = v40;
                WORD5(v90) = 1024;
                HIDWORD(v90) = v32;
                __int16 v91 = 1024;
                int v92 = v41;
                __int16 v93 = 1024;
                unsigned int v94 = v4;
                __int16 v95 = 1024;
                int v96 = v42;
                __int16 v97 = 1024;
                int v98 = v43;
                __int16 v99 = 1024;
                unsigned int v100 = v39;
                __int16 v101 = 1024;
                int v102 = v44;
                __int16 v103 = 1024;
                int v104 = v45;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send status request %d, %u  stattime %u roundtrip %u for  minpkt %d maxval %u retryinteral %u wait %u 1st %u pend %d", buf, 0x3Eu);
              }
              int v46 = sub_10002B5E0();
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1775, "SendStatusRequests", 7, 0, "send status request %d, %u  stattime %u roundtrip %u for  minpkt %d maxval %u retryinteral %u wait %u 1st %u pend %d", v22, v46, v32, *(_DWORD *)(v23 + 8), v4, *(_DWORD *)(a1 + 96), *(unsigned __int16 *)(a1 + 112), v39, *(_DWORD *)(a1 + 104), *(_DWORD *)(v23 - 36));
              if (*(_DWORD *)(v23 + 4) < *(_DWORD *)v23) {
                *(_DWORD *)(v23 + 4) = sub_10002B5E0();
              }
              ++*(_DWORD *)(v23 - 36);
              long long v90 = 0uLL;
              unsigned int v47 = bswap32(*(_DWORD *)a1);
              *(_DWORD *)buf = 16777472;
              *(void *)((char *)&v90 + 4) = __PAIR64__(v47, v86);
              ++*(_WORD *)(v23 - 46);
              if ((~++dword_10005C914 & 0x1F) == 0)
              {
                if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v105 = 67109376;
                  int v106 = dword_10005C914;
                  __int16 v107 = 1024;
                  unsigned int v108 = v4;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "status request count %d  packetIndex %d", v105, 0xEu);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1830, "SendStatusRequestPacket", 7, 0, "status request count %d  packetIndex %d", dword_10005C914, v4);
              }
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v105 = 67109120;
                int v106 = v4;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send status requst - min packet should be %u", v105, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1836, "SendStatusRequestPacket", 7, 0, "send status requst - min packet should be %u", v4);
              sub_10001D974(a1, (sockaddr *)(v23 + 44), buf, 20);
              *(_DWORD *)(v23 - 12) = sub_10002B5E0();
              ++*(_DWORD *)(a1 + 3184);
            }
          }
        }
        ++v22;
        v23 += 120;
      }
      while (v22 < *(unsigned __int16 *)(a1 + 2702));
    }
    if (*(unsigned char *)(a1 + 3173))
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ValidatePackets - terminateThreadFlag", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 2003, "ValidatePackets", 7, 0, "ValidatePackets - terminateThreadFlag");
      return 4294967294;
    }
    uint64_t v48 = *(void *)(a1 + 3248);
    unsigned int v49 = sub_10002B5E0();
    if (!*(_WORD *)(a1 + 2702))
    {
      char v51 = 0;
LABEL_112:
      unsigned int v61 = 50000;
      goto LABEL_113;
    }
    unsigned int v50 = v49;
    char v51 = 0;
    unsigned int v52 = 0;
    int v53 = (int *)(v48 + 36);
    unsigned int v54 = -1;
    do
    {
      unsigned int v55 = v53[2];
      if (v55 < v4)
      {
        if (*(_DWORD *)(a1 + 92) <= v55)
        {
          if (*((_WORD *)v53 - 17))
          {
            int v56 = *v53;
          }
          else
          {
            int v56 = *v88;
            if (v50 < *v88)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                LODWORD(v90) = v50;
                WORD2(v90) = 1024;
                *(_DWORD *)((char *)&v90 + 6) = v56;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "curtime %u senttime %u", buf, 0xEu);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 923, "GetMinTimeoutNeeded", 7, 0, "curtime %u senttime %u", v50, v56);
            }
          }
        }
        else if (*(_DWORD *)(a1 + 88) <= *v53)
        {
          int v56 = *v53;
        }
        else
        {
          int v56 = *(_DWORD *)(a1 + 88);
        }
        int v57 = v53[7];
        if (!v57)
        {
          int v57 = 250000;
          v53[7] = 250000;
        }
        unsigned int v58 = v50 - v56;
        unsigned int v59 = v57 << *((_WORD *)v53 - 17);
        if (*((_WORD *)v53 - 17)) {
          char v51 = 1;
        }
        unsigned int v60 = v59 - v58;
        if (v59 - v58 >= v54) {
          unsigned int v60 = v54;
        }
        if (v59 > v58) {
          unsigned int v54 = v60;
        }
      }
      ++v52;
      v53 += 30;
    }
    while (v52 < *(unsigned __int16 *)(a1 + 2702));
    if (v54 >= 0x16E360) {
      unsigned int v61 = 1500000;
    }
    else {
      unsigned int v61 = v54;
    }
    if (v54 == -1) {
      goto LABEL_112;
    }
LABEL_113:
    if (v51) {
      BOOL v62 = v61 >> 5 >= 0x271;
    }
    else {
      BOOL v62 = 1;
    }
    if (v62) {
      unsigned int v63 = v61;
    }
    else {
      unsigned int v63 = 20000;
    }
    if (v63 >= 0x1389)
    {
      sub_10002B5E0();
      *(unsigned char *)(a1 + 3175) = 1;
      sub_10002E894(*(NSObject **)(a1 + 40), v63 >> 10);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&long long v90 = v63 >> 10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "waited for %lu", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 2019, "ValidatePackets", 7, 0, "waited for %lu", v63 >> 10);
      *(unsigned char *)(a1 + 3175) = 0;
      if (sub_10002B5E0() - v87 >= 0x4C4B41)
      {
        sub_10001D1B8(a1);
        int v87 = sub_10002B5E0();
      }
    }
    sub_10001CA08(a1);
    sub_10001DCE8(a1);
    unsigned int v64 = *(unsigned __int16 *)(a1 + 2710);
    unsigned int v65 = *(unsigned __int16 *)(a1 + 2702);
    if (v64 >= v65) {
      break;
    }
    unsigned int v66 = *(_DWORD *)(a1 + 96);
    char v21 = 1;
  }
  while (v66 == -1 || v66 < v4);
  if (v64 != v65 && (!*(_WORD *)(a1 + 2710) || *(unsigned char *)(a1 + 3172)))
  {
    if (v64 > v85)
    {
      uint64_t v70 = *(void *)(a1 + 3248);
      int v71 = sub_10002B5E0();
      unsigned int v72 = *(unsigned __int16 *)(a1 + 2702);
      if (*(_WORD *)(a1 + 2702))
      {
        unsigned int v73 = 0;
        do
        {
          if (*(_WORD *)v70 != 2) {
            *(_DWORD *)(v70 + 52) = v71;
          }
          v70 += 120;
          ++v73;
        }
        while (v73 < v72);
      }
    }
    goto LABEL_11;
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ValidatePackets - gave up", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 2053, "ValidatePackets", 7, 0, "ValidatePackets - gave up");
  return 0xFFFFFFFFLL;
}

void sub_10001CA08(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 84);
  if (!v1) {
    return;
  }
  unsigned int v3 = v1 < 0x81 ? 1 : v1 - 127;
  v56[0] = 0;
  v56[1] = 0;
  if (!*(_WORD *)(a1 + 2702)) {
    return;
  }
  unsigned int v49 = 0;
  uint64_t v4 = 0;
  unsigned int v5 = 0;
  int v6 = 0;
  uint64_t v7 = *(void *)(a1 + 3248);
  do
  {
    unsigned int v8 = [*(id *)(a1 + 56) lock];
    if (v8)
    {
      unsigned int v9 = v8;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v52 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****enter cr err %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1127, "SendMissedPackets", 7, 0, "*****enter cr err %d", v9);
    }
    if (*(_WORD *)v7 != 1)
    {
      uint64_t v24 = v4;
      goto LABEL_42;
    }
    unsigned int v44 = v5;
    unsigned int v45 = v4 + 1;
    unsigned int v10 = v49;
    if (!(_WORD)v4) {
      unsigned int v10 = (sockaddr *)(v7 + 92);
    }
    unsigned int v49 = v10;
    int v11 = *(_DWORD *)(v7 + 40);
    int v12 = *(unsigned __int16 *)(v7 + 16);
    __memcpy_chk();
    if (!*(_WORD *)(v7 + 16))
    {
      unsigned int v13 = 0;
LABEL_40:
      *(int32x2_t *)(v7 + 68) = vadd_s32(*(int32x2_t *)(v7 + 68), vdup_n_s32(v13));
      goto LABEL_41;
    }
    unsigned int v13 = 0;
    int v14 = 0;
    unsigned int v15 = v11 - 8 * v12 + 1;
    double v16 = v55;
    int v46 = &v55[(unsigned __int16)(*(_WORD *)(v7 + 16) - 1)];
    unsigned int v17 = v55;
    while (1)
    {
      int v18 = *v17;
      unsigned int v47 = v17 + 1;
      uint64_t v48 = v16;
      if (*v17) {
        break;
      }
      v15 += 8;
LABEL_32:
      unsigned int v17 = v47;
      double v16 = v47;
      if (v48 == v46) {
        goto LABEL_40;
      }
    }
    unsigned int v19 = 0;
    unsigned int v20 = 128;
    while ((v20 & v18) == 0)
    {
LABEL_28:
      ++v15;
      v20 >>= 1;
      BOOL v23 = v19++ >= 7;
      if (v23) {
        goto LABEL_32;
      }
    }
    unsigned int v21 = *(_DWORD *)(a1 + 84);
    BOOL v22 = sub_100035448();
    if (v15 <= v21)
    {
      if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v52 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "missed %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1171, "SendMissedPackets", 7, 0, "missed %d", v15);
      if (!v14 && v15 - 1 > *(_DWORD *)(v7 + 44)) {
        *(_DWORD *)(v7 + 44) = v15 - 1;
      }
      ++v13;
      int v14 = 1;
      *((unsigned char *)v56 + ((unsigned __int16)(v15 - v3) >> 3)) |= 1 << (~(v15 - v3) & 7);
      goto LABEL_28;
    }
    if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *(_DWORD *)(a1 + 84);
      *(_DWORD *)buf = 67109376;
      int v52 = v15;
      __int16 v53 = 1024;
      int v54 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Too large value %u %u ", buf, 0xEu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1168, "SendMissedPackets", 7, 0, "Too large value %u %u ", v15, *(_DWORD *)(a1 + 84));
LABEL_41:
    int v6 = 1;
    unsigned int v5 = v44;
    uint64_t v24 = v45;
LABEL_42:
    unsigned int v26 = [*(id *)(a1 + 56) unlock];
    if (v26)
    {
      unsigned int v27 = v26;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v52 = v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "****exit cr err %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1211, "SendMissedPackets", 7, 0, "****exit cr err %d", v27);
    }
    v7 += 120;
    ++v5;
    uint64_t v4 = v24;
  }
  while (v5 < *(unsigned __int16 *)(a1 + 2702));
  if (v6)
  {
    __int16 v28 = v24;
    uint64_t v29 = 0;
    do
    {
      uint64_t v50 = v29;
      int v30 = *((unsigned __int8 *)v56 + v29);
      if (*((unsigned char *)v56 + v29))
      {
        unsigned int v31 = 0;
        unsigned int v32 = 128;
        do
        {
          if ((v32 & v30) != 0)
          {
            ++*(_DWORD *)(a1 + 3176);
            if (v3 > *(_DWORD *)(a1 + 92)) {
              *(_DWORD *)(a1 + 92) = v3;
            }
            *(unsigned char *)(a1 + 2712) = 1;
            uint64_t v33 = v3 & 0x7F;
            uint64_t v34 = a1 + 4 * v33;
            if (v3 != *(_DWORD *)(v34 + 1656))
            {
              int v35 = (_DWORD *)(v34 + 1656);
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                int v36 = *v35;
                *(_DWORD *)buf = 67109376;
                int v52 = v3;
                __int16 v53 = 1024;
                int v54 = v36;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "wrong packet index %u %u ", buf, 0xEu);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1249, "SendMissedPackets", 1, 0, "wrong packet index %u %u ", v3, *v35);
            }
            if (v28 == 1)
            {
              sub_10001D974(a1, v49, *(_DWORD **)(a1 + 8 * v33 + 120), *(unsigned __int16 *)(a1 + 2 * v33 + 2168));
              if ((~++dword_10005C918 & 0x1F) == 0)
              {
                if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v52 = dword_10005C918;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "missed packet count %d", buf, 8u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1261, "SendMissedPackets", 7, 0, "missed packet count %d", dword_10005C918);
              }
            }
            else
            {
              sub_10001D3CC(a1, *(_DWORD **)(a1 + 8 * v33 + 120), *(unsigned __int16 *)(a1 + 2 * v33 + 2168));
            }
          }
          v32 >>= 1;
          ++v3;
          BOOL v23 = v31++ >= 7;
        }
        while (!v23);
      }
      else
      {
        v3 += 8;
      }
      uint64_t v29 = v50 + 1;
    }
    while (v50 != 15);
    unsigned int v37 = *(_WORD **)(a1 + 3248);
    unsigned int v38 = [*(id *)(a1 + 56) lock];
    if (v38)
    {
      unsigned int v39 = v38;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v52 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****enter cr err %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1282, "SendMissedPackets", 7, 0, "*****enter cr err %d", v39);
    }
    unsigned int v40 = *(unsigned __int16 *)(a1 + 2702);
    if (*(_WORD *)(a1 + 2702))
    {
      unsigned int v41 = 0;
      do
      {
        if (*v37 == 1) {
          *unsigned int v37 = 0;
        }
        v37 += 60;
        ++v41;
      }
      while (v41 < v40);
    }
    unsigned int v42 = [*(id *)(a1 + 56) unlock];
    if (v42)
    {
      unsigned int v43 = v42;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v52 = v43;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "****exit cr err %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1293, "SendMissedPackets", 7, 0, "****exit cr err %d", v43);
    }
  }
}

void sub_10001D1B8(uint64_t a1)
{
  *(void *)&v12[6] = 0;
  *(void *)int v12 = 0;
  int v11 = 67109120;
  unsigned int v2 = bswap32(*(_DWORD *)a1);
  __int16 v13 = 0;
  *(_DWORD *)&v12[4] = bswap32(*(_DWORD *)(a1 + 84));
  *(_DWORD *)&v12[8] = v2;
  sub_10001D3CC(a1, &v11, 20);
  int v3 = sub_10002B5E0();
  if (*(_WORD *)(a1 + 2702))
  {
    int v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)(a1 + 3248);
    do
    {
      if (*(_WORD *)v6 == 1)
      {
        unsigned int v7 = [*(id *)(a1 + 56) lock];
        if (v7)
        {
          unsigned int v8 = v7;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v15 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****enter cr err %d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1877, "SendTicklePacket", 7, 0, "*****enter cr err %d", v8);
        }
        *(_DWORD *)(v6 + 48) = v4;
        unsigned int v9 = [*(id *)(a1 + 56) unlock];
        if (v9)
        {
          unsigned int v10 = v9;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v15 = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "****exit cr err %d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1881, "SendTicklePacket", 7, 0, "****exit cr err %d", v10);
        }
      }
      v6 += 120;
      ++v5;
    }
    while (v5 < *(unsigned __int16 *)(a1 + 2702));
  }
}

uint64_t sub_10001D3CC(uint64_t result, _DWORD *a2, uint64_t a3)
{
  uint64_t v5 = result;
  unsigned int v6 = *(unsigned __int16 *)(result + 2702);
  if (*(_WORD *)(result + 2702))
  {
    unsigned int v7 = 0;
    unsigned int v8 = (unsigned int *)(*(void *)(result + 3248) + 8);
    unsigned int v9 = -1;
    do
    {
      if (*v8 < v9) {
        unsigned int v9 = *v8;
      }
      unsigned int *v8 = -1;
      v8 += 30;
      ++v7;
    }
    while (v7 < v6);
    if (v9 <= 0x3D08F)
    {
      useconds_t v10 = 280000 - v9;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v44 = v10 / 0x3E8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*wait %u milliseconds", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1544, "SendPacketToAllReceivers", 7, 0, "*wait %u milliseconds", v10 / 0x3E8);
      uint64_t result = usleep(v10);
      *(_DWORD *)(v5 + 108) += v10;
    }
  }
  unsigned int v11 = *(_DWORD *)(v5 + 84);
  if (v11 >= 0x65 && *(_DWORD *)(v5 + 3176) > v11 >> 2)
  {
    unsigned int v12 = *(unsigned __int16 *)(v5 + 2702);
    if (*(_WORD *)(v5 + 2702))
    {
      unsigned int v13 = 0;
      int v14 = (sockaddr *)(*(void *)(v5 + 3248) + 92);
      do
      {
        if (*(_WORD *)&v14[-6].sa_data[2] != 2)
        {
          uint64_t result = sub_10001D974(v5, v14, a2, a3);
          unsigned int v12 = *(unsigned __int16 *)(v5 + 2702);
        }
        ++v13;
        int v14 = (sockaddr *)((char *)v14 + 120);
      }
      while (v13 < v12);
    }
    return result;
  }
  unsigned int v15 = *(sockaddr **)(v5 + 3232);
  uint64_t result = sub_10002B5E0();
  unsigned int v16 = bswap32(result);
  if (!result) {
    unsigned int v16 = 0x1000000;
  }
  a2[1] = v16;
  unsigned int v17 = *(_DWORD *)(v5 + 2716);
  if (v17)
  {
    for (unsigned __int16 i = 0; i < v17; ++i)
    {
      if (v17 >= 2 && setsockopt(*(_DWORD *)(v5 + 2696), 0, 9, (const void *)(v5 + 4 * i + 2720), 4u))
      {
        int v19 = *(_DWORD *)(v5 + 4 * i + 2720);
        int v20 = *__error();
        unsigned int v21 = __error();
        BOOL v22 = strerror(*v21);
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1583, "SendPacketToAllReceivers", 7, 0, "SendPacketToAllReceivers - unable to set outgoing interface %x err %d %s", v19, v20, v22);
      }
      BOOL v23 = *(uint64_t (**)(uint64_t, sockaddr *, _DWORD *, uint64_t, uint64_t))(v5 + 3240);
      uint64_t v24 = *(unsigned int *)(v5 + 2696);
      int v25 = (sockaddr *)(v5 + 3120);
      if (v23) {
        int v26 = v23(v24, v25, a2, a3, v5);
      }
      else {
        int v26 = sub_10002B60C(v24, v25, a2, a3);
      }
      int v27 = v26;
      if (v26)
      {
        int v28 = *__error();
        uint64_t v29 = __error();
        int v30 = strerror(*v29);
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1593, "SendPacketToAllReceivers", 7, 0, "SendPacketToAllReceivers multicast error %d %d %s", v27, v28, v30);
      }
      uint64_t result = sub_10001DB30(v5, a3);
      unsigned int v17 = *(_DWORD *)(v5 + 2716);
    }
  }
  int v31 = *(unsigned __int8 *)(v5 + 114);
  if ((v31 - 3) >= 2)
  {
    if ((v31 - 1) > 1 || !*(_WORD *)(v5 + 2700)) {
      return result;
    }
    int v32 = 0;
    while (1)
    {
      uint64_t v33 = *(unsigned int (**)(uint64_t, sockaddr *, _DWORD *, uint64_t, uint64_t))(v5 + 3240);
      uint64_t v34 = *(unsigned int *)(v5 + 2696);
      if (!v33) {
        break;
      }
      if (v33(v34, v15, a2, a3, v5)) {
        goto LABEL_38;
      }
LABEL_39:
      unsigned int v15 = (sockaddr *)((char *)v15 + v15->sa_len);
      uint64_t result = sub_10001DB30(v5, a3);
      if (++v32 >= *(unsigned __int16 *)(v5 + 2700)) {
        return result;
      }
    }
    if (!sub_10002B60C(v34, v15, a2, a3)) {
      goto LABEL_39;
    }
LABEL_38:
    int v35 = *__error();
    int v36 = __error();
    unsigned int v37 = strerror(*v36);
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1613, "SendPacketToAllReceivers", 7, 0, "SendPacketToAllReceivers  error %d %s", v35, v37);
    goto LABEL_39;
  }
  if (*(unsigned char *)(v5 + 3272))
  {
    sub_10000584C(*(void **)(v5 + 3264), (uint64_t)a2, a3);
  }
  else
  {
    if (*(unsigned char *)(v5 + 115))
    {
      unsigned int v38 = a2;
      unsigned int v39 = 0;
      socklen_t sa_len = 0;
    }
    else
    {
      unsigned int v39 = *(const sockaddr **)(v5 + 3232);
      socklen_t sa_len = v39->sa_len;
      unsigned int v38 = a2;
    }
    sendto(*(_DWORD *)(v5 + 2696), v38, a3, 0, v39, sa_len);
  }
  useconds_t v41 = *(_DWORD *)(v5 + 3168);
  if (v41)
  {
    usleep(v41);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v42 = *(_DWORD *)(v5 + 3168);
      *(_DWORD *)buf = 67109120;
      unsigned int v44 = v42;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "waited %u", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1668, "SendPacketToAllReceivers", 7, 0, "waited %u", *(_DWORD *)(v5 + 3168));
  }
  return sub_10001DB30(v5, a3);
}

void sub_10001D8B8(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4)
{
  unsigned int v8 = bswap32(*(_DWORD *)(a2 + 8));
  [*(id *)(a1 + 56) lock];
  uint64_t v9 = a1 + 8 * (v8 & 0x7F);
  useconds_t v10 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = a2;
  uint64_t v11 = a1 + 4 * (v8 & 0x7F);
  *(_DWORD *)(v11 + 1144) = bswap32(*(_DWORD *)(a2 + 4));
  *(_DWORD *)(v11 + 1656) = v8;
  uint64_t v12 = a1 + 2 * (v8 & 0x7F);
  *(_WORD *)(v12 + 2168) = a3;
  *(_WORD *)(v12 + 2424) = a4;
  [*(id *)(a1 + 56) unlock];
  if (v10)
  {
    free(v10);
  }
}

uint64_t sub_10001D974(uint64_t a1, sockaddr *a2, _DWORD *a3, uint64_t a4)
{
  unsigned int v8 = sub_10002B5E0();
  unsigned int v9 = bswap32(v8);
  if (!v8) {
    unsigned int v9 = 0x1000000;
  }
  a3[1] = v9;
  int v10 = *(unsigned __int8 *)(a1 + 114);
  if ((v10 - 3) < 2)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = bswap32(a3[2]);
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send packet to one index %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 1414, "SendPacketToOneReceiver", 7, 0, "send packet to one index %d", bswap32(a3[2]));
    if (*(unsigned char *)(a1 + 3272))
    {
      sub_10000584C(*(void **)(a1 + 3264), (uint64_t)a3, a4);
    }
    else
    {
      if (*(unsigned char *)(a1 + 115))
      {
        int v14 = a3;
        unsigned int v15 = 0;
        socklen_t sa_len = 0;
      }
      else
      {
        unsigned int v15 = *(const sockaddr **)(a1 + 3232);
        socklen_t sa_len = v15->sa_len;
        int v14 = a3;
      }
      sendto(*(_DWORD *)(a1 + 2696), v14, a4, 0, v15, sa_len);
    }
  }
  else if ((v10 - 1) <= 1)
  {
    uint64_t v11 = *(void (**)(uint64_t, sockaddr *, _DWORD *, uint64_t, uint64_t))(a1 + 3240);
    uint64_t v12 = *(unsigned int *)(a1 + 2696);
    if (v11) {
      v11(v12, a2, a3, a4, a1);
    }
    else {
      sub_10002B60C(v12, a2, a3, a4);
    }
  }
  return sub_10001DB30(a1, a4);
}

uint64_t sub_10001DB30(uint64_t result, int a2)
{
  unsigned int v2 = *(_DWORD *)(result + 3152);
  if (v2)
  {
    uint64_t v4 = result;
    unsigned int v5 = (v2 >> 1) - (v2 >> 6);
    if (!*(_DWORD *)(result + 3156))
    {
      uint64_t result = sub_10002B5E0();
      *(_DWORD *)(v4 + 3156) = result;
    }
    unsigned int v6 = *(_DWORD *)(v4 + 3160) + a2;
    *(_DWORD *)(v4 + 3160) = v6;
    if (v6 >= v5)
    {
      unsigned int v7 = *(_DWORD *)(v4 + 3156) - sub_10002B5E0();
      if (v7 < 0xFFF85EE0)
      {
        uint64_t result = sub_10002B5E0();
        unsigned int v8 = 0;
      }
      else
      {
        unsigned int v8 = *(_DWORD *)(v4 + 3160) - v5;
        float v9 = (float)v8 * 500000.0 / (float)v5 + (float)v8 * 500000.0 / (float)v5;
        useconds_t v10 = (float)((float)(v7 + 500000) + v9);
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          useconds_t v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "will sleep for %u", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 798, "CheckBandwidthLimits", 7, 0, "will sleep for %u", v10);
        usleep(v10);
        uint64_t result = (float)((float)(v9 + 500000.0) + (float)*(unsigned int *)(v4 + 3156));
      }
      *(_DWORD *)(v4 + 3156) = result;
      *(_DWORD *)(v4 + 3160) = v8;
    }
  }
  return result;
}

void sub_10001DCE8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 56) lock];
  if (v2)
  {
    unsigned int v3 = v2;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UpdateValidatedPacketID enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 2092, "UpdateValidatedPacketID", 7, 0, "UpdateValidatedPacketID enter cr err %d", v3);
  }
  if (*(_WORD *)(a1 + 2702))
  {
    unsigned int v4 = 0;
    unsigned int v5 = *(_DWORD *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 3248);
    unsigned int v7 = -1;
    do
    {
      if (*(_WORD *)v6 != 2 && *(_DWORD *)(v6 + 44) < v7) {
        unsigned int v7 = *(_DWORD *)(v6 + 44);
      }
      v6 += 120;
      ++v4;
    }
    while (v4 < *(unsigned __int16 *)(a1 + 2702));
    *(_DWORD *)(a1 + 96) = v7;
    if (v7 != -1 && v7 > v5)
    {
      unsigned int v8 = v5 + 1;
      uint64_t v9 = *(void *)(a1 + 3208);
      do
        v9 += *(unsigned __int16 *)(a1 + 2 * (v8++ & 0x7F) + 2424);
      while (v8 <= v7);
      *(void *)(a1 + 3208) = v9;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 96) = -1;
  }
  unsigned int v10 = [*(id *)(a1 + 56) unlock];
  if (v10)
  {
    unsigned int v11 = v10;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UpdateValidatedPacketID exit cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPSend.c", 100, 2106, "UpdateValidatedPacketID", 7, 0, "UpdateValidatedPacketID exit cr err %d", v11);
  }
}

void sub_10001DEEC(id a1, void *a2)
{
  id v3 = [(id)qword_10005C970 copy];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v32 = COERCE_DOUBLE([v3 count]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invitation callback called  count %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 70, "InvitationCallback", 7, 0, "invitation callback called  count %ld", [v3 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = &_os_log_default;
    uint64_t v7 = *(void *)v27;
    unsigned int v8 = "invitation callback session controller %p";
    do
    {
      uint64_t v9 = 0;
      id v23 = v5;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
        if (sub_100035448() && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v32 = *(double *)&v10;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invitation callback session controller %p", buf, 0xCu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 73, "InvitationCallback", 7, 0, v8, v10);
        if ([v10 invitationNotification] == a1)
        {
          unsigned int v11 = v8;
          if (sub_100035448() && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v32 = *(double *)&a2;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "found notification  %lx", buf, 0xCu);
          }
          useconds_t v12 = v6;
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 77, "InvitationCallback", 7, 0, "found notification  %lx", a2);
          unsigned int v13 = [v10 notificationTimeoutTimer];
          [v13 invalidate];

          [v10 setNotificationTimeoutTimer:0];
          CFRelease(a1);
          [v10 setInvitationNotification:0];
          [(id)qword_10005C970 removeObject:v10];
          if (a2 != (void *)1)
          {
            if (a2 != (void *)3)
            {
              uint64_t v6 = v12;
              if (a2 == (void *)2)
              {
                unsigned int v8 = v11;
                if (sub_100035448() && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "other response - user accepted", buf, 2u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 86, "InvitationCallback", 7, 0, "other response - user accepted");
                [v10 doAcceptIDSInvitation];
              }
              else
              {
                unsigned int v8 = v11;
                if (sub_100035448() && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "unexpected response", buf, 2u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 123, "InvitationCallback", 7, 0, "unexpected response");
              }
              goto LABEL_50;
            }
            if (sub_100035448() && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "notification was cancelled", buf, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 99, "InvitationCallback", 7, 0, "notification was cancelled");
            int v14 = +[NSDate date];
            unsigned int v15 = [v10 notificationStartTime];
            [v14 timeIntervalSinceDate:v15];
            double v17 = v16;

            uint64_t v6 = v12;
            if (sub_100035448() && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              double v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "timeUsed = %f", buf, 0xCu);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 101, "InvitationCallback", 7, 0, "timeUsed = %f", v17);
            if ([v10 notificationTimedOut])
            {
              if (sub_100035448() && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "notification timed out", buf, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 105, "InvitationCallback", 7, 0, "notification timed out");
              goto LABEL_47;
            }
            unsigned int v20 = MKBGetDeviceLockState() - 1;
            BOOL v21 = sub_100035448();
            if (v20 > 1)
            {
              uint64_t v6 = v12;
              if (v21 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "screen was locked and is now unlocked  post new notification", buf, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 117, "InvitationCallback", 7, 0, "screen was locked and is now unlocked  post new notification");
              [v10 postInvitationNotification];
            }
            else
            {
              uint64_t v6 = v12;
              if (v21 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "screen is still locked?", buf, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 112, "InvitationCallback", 7, 0, "screen is still locked?");
LABEL_47:
              int v18 = v10;
              CFStringRef v19 = @"UserDidNotAnswer";
LABEL_48:
              [v18 doDeclineIDSInvitationWithReasonString:v19];
            }
            unsigned int v8 = v11;
LABEL_50:
            id v5 = v23;
            goto LABEL_51;
          }
          uint64_t v6 = v12;
          if (sub_100035448() && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "alternate response - user declined", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 93, "InvitationCallback", 7, 0, "alternate response - user declined");
          int v18 = v10;
          CFStringRef v19 = @"UserDeclined";
          goto LABEL_48;
        }
LABEL_51:
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      id v22 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v5 = v22;
    }
    while (v22);
  }
}

BOOL sub_10001E630()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

id sub_10001E658(uint64_t a1)
{
  if (a1)
  {
    id v5 = 0;
    uint64_t v6 = 0;
    unsigned int v1 = +[NSPropertyListSerialization propertyListWithData:a1 options:0 format:&v6 error:&v5];
    if (v5)
    {
      id v2 = [v5 description];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 143, "DataToDictionary", 7, 0, "***error: %s", (const char *)[v2 UTF8String]);

      id v3 = 0;
    }
    else
    {
      id v3 = v1;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_10001E72C(uint64_t a1)
{
  if (a1)
  {
    id v5 = 0;
    unsigned int v1 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:&v5];
    if (v5)
    {
      id v2 = [v5 description];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 160, "DictionaryToData", 7, 0, "error: %s", (const char *)[v2 UTF8String]);

      id v3 = 0;
    }
    else
    {
      id v3 = v1;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_10001F7B0(id a1)
{
  qword_10005C970 = +[NSMutableSet set];

  _objc_release_x1();
}

id sub_10001FC30(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldStartScreenSharingSession];
}

id sub_1000206CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:"userFinishedTermsAndConditions:" withObject:&off_100056AE8];
}

id sub_100021940(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSendingTheScreen];
}

void sub_1000229E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022A10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022A20(uint64_t a1)
{
}

void sub_100022A28(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got invite dictionary %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/IDSSessionEmbeddedControllerBase.m", 125, 903, "-[IDSSessionEmbeddedControllerBase inviteDictionaryForRemoteInviteDictionary:]_block_invoke", 5, 0, "got invite dictionary %p", *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10002460C(uint64_t a1, const void *a2, unsigned int a3)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "write data to viewer %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 398, "WriteDataToViewer", 7, 0, "write data to viewer %d", a3);
  uint64_t v6 = *(void *)(a1 + 2480);
  if (v6)
  {
    [0 lock];
    id v7 = malloc_type_malloc(a3 + 14, 0xE19B2979uLL);
    *(void *)id v7 = 0;
    v7[6] = 2;
    *((_DWORD *)v7 + 2) = a3;
    memcpy(v7 + 7, a2, a3);
    [*(id *)(v6 + 32) lock];
    *(void *)(v6 + 3192) += a3;
    uint64_t v8 = *(void *)(v6 + 8);
    if (v8) {
      **(void **)(v6 + 16) = v7;
    }
    else {
      *(void *)(v6 + 8) = v7;
    }
    *(void *)(v6 + 16) = v7;
    unsigned int v10 = [*(id *)(v6 + 32) unlock];
    if (v10)
    {
      unsigned int v11 = v10;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "****exit cr err %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 429, "WriteDataToViewer", 7, 0, "****exit cr err %d", v11);
    }
    if (!v8)
    {
      sub_10002E7F4(*(NSObject **)(v6 + 24));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "signalled semaphore", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 433, "WriteDataToViewer", 7, 0, "signalled semaphore");
    }
    [0 unlock];
    return 0;
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100036C2C();
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 440, "WriteDataToViewer", 3, 0, "send info not set");
    return 4294967294;
  }
}

void sub_10002504C(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(void *)(a1 + 2480);
  if (v3)
  {
    [0 lock];
    [*(id *)(v3 + 32) lock];
    *(void *)(v3 + 3192) += a2[2];
    if (*(void *)(v3 + 8))
    {
      **(void **)(v3 + 16) = a2;
      *(void *)(v3 + 16) = a2;
      [*(id *)(v3 + 32) unlock];
    }
    else
    {
      *(void *)(v3 + 8) = a2;
      *(void *)(v3 + 16) = a2;
      [*(id *)(v3 + 32) unlock];
      sub_10002E7F4(*(NSObject **)(v3 + 24));
    }
    [0 unlock];
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100036CE8();
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1648, "SendBufferToViewer", 3, 0, "udp buffer not set");
    free(a2);
  }
}

double sub_100026FFC(uint64_t a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 159);
    int v3 = *(unsigned __int8 *)(a1 + 160);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)int v18 = v2;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "EncodeDisplayInfo %d %d", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1358, "EncodeDisplayInfo", 7, 0, "EncodeDisplayInfo %d %d", *(unsigned __int8 *)(a1 + 159), *(unsigned __int8 *)(a1 + 160));
  if (*(unsigned char *)(a1 + 160))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DispayInfo2Encoding", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1480, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "DispayInfo2Encoding");
    id v4 = (char *)malloc_type_calloc(1uLL, 0x6CuLL, 0xC2D02E3BuLL);
    *(_DWORD *)(v4 + 30) = 50351104;
    *((_WORD *)v4 + 25) = 256;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set dsplay count", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1491, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "set dsplay count");
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)int v18 = 544;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = 960;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got screen bounds %d %d", buf, 0xEu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1501, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "got screen bounds %d %d", 544, 960);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)int v18 = 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = 0;
      __int16 v19 = 1024;
      int v20 = 960;
      __int16 v21 = 1024;
      int v22 = 544;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "global pixels %d %d %d %d", buf, 0x1Au);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1506, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "global pixels %d %d %d %d", 0, 0, 960, 544);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)int v18 = 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = 0;
      __int16 v19 = 1024;
      int v20 = 960;
      __int16 v21 = 1024;
      int v22 = 544;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "global points %d %d %d %d", buf, 0x1Au);
    }
    unsigned int v5 = 544;
    unsigned int v6 = 960;
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1508, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "global points %d %d %d %d", 0, 0, 960, 544);
    *(_DWORD *)(v4 + 34) = -1073537022;
    if (*(unsigned char *)(a1 + 1394))
    {
      double v7 = *(double *)(a1 + 1400);
      unsigned int v5 = llround(v7 * -0.0 + v7 * 544.0);
      unsigned int v6 = llround(v7 * -0.0 + v7 * 960.0);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v18 = (unsigned __int16)v5;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = (unsigned __int16)v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%d  %d", buf, 0xEu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1523, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "%d  %d", (unsigned __int16)v5, (unsigned __int16)v6);
    }
    *((_WORD *)v4 + 19) = bswap32(v5) >> 16;
    *((_WORD *)v4 + 20) = bswap32(v6) >> 16;
    *(void *)(v4 + 42) = 0x1000000;
    *(_DWORD *)(v4 + 14) = 0x1000000;
    *(void *)(v4 + 18) = 0;
    *(_DWORD *)(v4 + 26) = 1359216640;
    *((_WORD *)v4 + 25) = 256;
    *(void *)(v4 + 52) = 0x3FF0000000000000;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(v4 + 52);
      *(_DWORD *)buf = 134217984;
      *(void *)int v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "res = %f", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1546, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "res = %f", *(double *)(v4 + 52));
    *(void *)(v4 + 52) = bswap64(*(void *)(v4 + 52));
    if (*(unsigned char *)(a1 + 1394)) {
      unint64_t v13 = *(void *)(a1 + 1400);
    }
    else {
      unint64_t v13 = 0x3FF0000000000000;
    }
    *(void *)(v4 + 60) = bswap64(v13);
    *((_DWORD *)v4 + 17) = 0x1000000;
    *((_DWORD *)v4 + 22) = 0x1000000;
    *(_OWORD *)(v4 + 72) = xmmword_10003D160;
    *((_DWORD *)v4 + 23) = 16785440;
    *((void *)v4 + 12) = 0x810FF00FF00FF00;
    v4[104] = 0;
    *((_DWORD *)v4 + 2) = 94;
    *((_WORD *)v4 + 6) = 0;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send display info to viewer", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1604, "EncodeDisplayInfo_DispayInfo2Encoding", 7, 0, "send display info to viewer");
    sub_10002504C(a1, (unsigned int *)v4);
  }
  else
  {
    uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x44uLL, 0x3579ED55uLL);
    *(void *)(v8 + 30) = 3221430274;
    if (*(unsigned char *)(a1 + 1394))
    {
      double v9 = *(double *)(a1 + 1400);
      unsigned int v10 = llround(v9 * 544.0);
      unsigned int v11 = llround(v9 * 960.0);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v18 = (__int16)v10;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = (__int16)v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "scaled screen res change - width = %d  height %d", buf, 0xEu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1434, "EncodeDisplayInfo_DispayInfoEncoding", 7, 0, "scaled screen res change - width = %d  height %d", (__int16)v10, (__int16)v11);
    }
    else
    {
      unsigned int v11 = 960;
      unsigned int v10 = 544;
    }
    *(void *)(v8 + 14) = 0x1000000;
    unsigned int v15 = bswap32(v10) >> 16;
    *((_WORD *)v8 + 11) = v15;
    unsigned int v16 = bswap32(v11) >> 16;
    *((_WORD *)v8 + 12) = v16;
    *(_DWORD *)(v8 + 26) = 1292107776;
    *((_WORD *)v8 + 19) = 256;
    *((_DWORD *)v8 + 12) = 0;
    *((_DWORD *)v8 + 10) = 0x1000000;
    *((_WORD *)v8 + 22) = v15;
    *((_WORD *)v8 + 23) = v16;
    *(void *)&double result = 16785440;
    *((_DWORD *)v8 + 13) = 16785440;
    *((void *)v8 + 7) = 0x810FF00FF00FF00;
    v8[64] = 0;
  }
  return result;
}

void sub_100027DC4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 2976);
}

void sub_100027E08(uint64_t a1, uint64_t a2, const void *a3)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "system info request", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 669, "StartSystemInfoRequest", 7, 0, "system info request");
  int v6 = *(unsigned __int16 *)(a2 + 10);
  int v7 = *(_DWORD *)(a2 + 6);
  size_t v8 = *(unsigned __int16 *)(a2 + 12);
  double v9 = malloc_type_malloc(v8 + 1, 0x20028E65uLL);
  memcpy(v9, a3, v8);
  *((unsigned char *)v9 + v8) = 0;
  if (v6 == 3)
  {
    id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    unsigned int v11 = +[NSProcessInfo processInfo];
    uint64_t v12 = [v11 operatingSystemVersionString];
    [v10 setObject:v12 forKey:@"OSVersion"];

    unint64_t v13 = (void *)MGCopyAnswer();
    [v10 setObject:v13 forKey:@"ComputerName"];

    uint64_t v14 = (void *)MGCopyAnswer();
    [v10 setObject:v14 forKey:@"ComputerModel"];

    [v10 setObject:@"mobile" forKey:@"ShortUserName"];
    CFTypeRef v15 = sub_10003353C();
    if (v15)
    {
      unsigned int v16 = v15;
      [v10 setObject:v15 forKey:@"SerialNumber"];
      CFRelease(v16);
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to get serial number", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 706, "StartSystemInfoRequest", 7, 0, "unable to get serial number");
    }
    if ([v10 count] != (id)5)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v10 count];
        *(_DWORD *)buf = 134217984;
        id v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "size of dictionary %ld", buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 709, "StartSystemInfoRequest", 7, 0, "size of dictionary %ld", [v10 count]);
    }
    id v25 = 0;
    int v18 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:100 options:0 error:&v25];
    if (v25)
    {
      id v19 = [v25 description];
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 718, "StartSystemInfoRequest", 7, 0, "system information error: %s", (const char *)[v19 UTF8String]);
    }
    else
    {
      unsigned int v20 = [v18 length];
      id v21 = [v18 bytes];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "length = %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 730, "StartSystemInfoRequest", 7, 0, "length = %d", v20);
      int v22 = (char *)malloc_type_calloc(1uLL, v20 + 38, 0x247DEE0AuLL);
      if (v22)
      {
        id v23 = v22;
        v22[14] = 81;
        uint64_t v24 = v22 + 14;
        *((_DWORD *)v22 + 2) = v20 + 24;
        *((_WORD *)v22 + 10) = 256;
        *(_DWORD *)(v22 + 22) = v7;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "use uncompressed buffer for now", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 745, "StartSystemInfoRequest", 7, 0, "use uncompressed buffer for now");
        memcpy(v23 + 38, v21, v20);
        *(_DWORD *)(v23 + 34) = bswap32(v20);
        *(void *)(v23 + 26) = 0;
        *((_DWORD *)v23 + 4) = bswap32(v20 + 18);
        sub_10002460C(a1, v24, v20 + 24);
        free(v23);
      }
    }
    free(v9);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignore command %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 680, "StartSystemInfoRequest", 7, 0, "ignore command %d", v6);
    free(v9);
  }
}

uint64_t sub_1000283FC(_CCCryptor *a1, _OWORD *a2, void *dataIn, unsigned char *a4)
{
  *a4 = 0;
  *(_OWORD *)CFTypeRef v15 = *a2;
  unsigned int v5 = v15[0];
  v15[0] += 77;
  if (v5 >= 0xB3)
  {
    uint64_t v6 = 1;
    do
    {
      if (++v15[v6]) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v6 == 15;
      }
      ++v6;
    }
    while (!v8);
  }
  size_t dataOutMoved = 0;
  uint64_t v9 = CCCryptorUpdate(a1, dataIn, 0x10uLL, dataOut, 0x10uLL, &dataOutMoved);
  if (v9)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorUpdate %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 962, "AuthKeyVerificationServerCheckResponse", 5, 0, "CCCryptorUpdate %d", v9);
  }
  else if (!sub_10000BE74(v15, dataOut, 16))
  {
    *a4 = 1;
  }
  return v9;
}

uint64_t sub_100028564(_CCCryptor *a1, _CCCryptor *a2, void *dataIn, _OWORD *a4, void *a5)
{
  size_t dataOutMoved = 0;
  CCCryptorStatus v8 = CCCryptorUpdate(a1, dataIn, 0x10uLL, &dataOut, 0x10uLL, &dataOutMoved);
  if (v8)
  {
    CCCryptorStatus v9 = v8;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      CCCryptorStatus v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorUpdate %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1049, "AuthKeyVerificationClientGenerateResponse", 5, 0, "CCCryptorUpdate %d");
    return 4294967294;
  }
  unsigned int v10 = dataOut;
  LOBYTE(dataOut) = dataOut + 77;
  if (v10 >= 0xB3)
  {
    uint64_t v11 = 1;
    do
    {
      if (++*((unsigned char *)&dataOut + v11)) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v11 == 15;
      }
      ++v11;
    }
    while (!v13);
  }
  if (a4) {
    *a4 = dataOut;
  }
  uint64_t result = CCCryptorUpdate(a2, &dataOut, 0x10uLL, a5, 0x10uLL, &dataOutMoved);
  if (result)
  {
    CCCryptorStatus v15 = result;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      CCCryptorStatus v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorUpdate %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1062, "AuthKeyVerificationClientGenerateResponse", 5, 0, "CCCryptorUpdate %d");
    return 4294967294;
  }
  return result;
}

uint64_t sub_10002875C(uint64_t a1)
{
  memset(v10, 0, 10);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "handle ModifySessionFlag", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1688, "HandleModifySessionFlag", 7, 0, "handle ModifySessionFlag");
  if (sub_10002F5EC(*(void *)(a1 + 8)) < 0xA) {
    return 0xFFFFFFFFLL;
  }
  sub_10002F038(*(void *)(a1 + 8), 0xAu, (char *)v10);
  unsigned int v2 = bswap32(WORD1(v10[0]));
  uint64_t v3 = HIWORD(v2);
  WORD1(v10[0]) = HIWORD(v2);
  WORD2(v10[0]) = bswap32(WORD2(v10[0])) >> 16;
  *(_DWORD *)((char *)v10 + 6) = bswap32(*(unsigned int *)((char *)v10 + 6));
  if (v3 < 7)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = v3 - 6;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v12 = v3 - 6;
      __int16 v13 = 1024;
      int v14 = WORD1(v10[0]);
      __int16 v15 = 2048;
      uint64_t v16 = 6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d mesage size %d noheader %lu", buf, 0x18u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1705, "HandleModifySessionFlag", 7, 0, "extra amount %d mesage size %d noheader %lu", v3 - 6, WORD1(v10[0]), 6);
    if (v3 + 4 > (unint64_t)sub_10002F5EC(*(void *)(a1 + 8))) {
      return 0xFFFFFFFFLL;
    }
  }
  sub_10002EDA4(*(void *)(a1 + 8), v4 + 10);
  char v6 = BYTE6(v10[0]);
  BOOL v7 = sub_100035448();
  if (v6)
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pause screen sharing", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1717, "HandleModifySessionFlag", 7, 0, "pause screen sharing");
    CCCryptorStatus v8 = +[IDSServiceEmbeddedController sharedIDServiceController];
    [v8 pauseScreenSharing:1];

    CCCryptorStatus v9 = +[IDSServiceEmbeddedController sharedIDServiceController];
    [v9 postViewerPausedMessageNotification];
  }
  else
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pause flag not set", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1722, "HandleModifySessionFlag", 7, 0, "pause flag not set");
  }
  return 0;
}

uint64_t sub_100028A98(uint64_t a1, void *a2)
{
  memset(v39, 0, 18);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user request", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1739, "HandleUserRequestMessage", 7, 0, "user request");
  if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x12) {
    return 0xFFFFFFFFLL;
  }
  sub_10002F038(*(void *)(a1 + 8), 0x12u, (char *)v39);
  unsigned int v4 = bswap32(v39[0].u16[1]) >> 16;
  v39[0].i16[1] = v4;
  int v5 = v39[0].u16[2];
  v39[0].i16[2] = __rev16(v39[0].u16[2]);
  if (v5 == 256)
  {
    if (v4 < 0xF)
    {
      uint64_t v9 = *(void *)(a1 + 8);
      unsigned int v8 = 18;
      goto LABEL_20;
    }
    unsigned __int16 v6 = v4 - 14;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1756, "HandleUserRequestMessage", 7, 0, "extra amount %d", v6);
    unsigned int v7 = sub_10002F5EC(*(void *)(a1 + 8));
    unsigned int v8 = v6 + 18;
    if ((unint64_t)v6 + 18 <= v7)
    {
      uint64_t v9 = *(void *)(a1 + 8);
LABEL_20:
      sub_10002EDA4(v9, v8);
      __int16 v13 = 0;
      uint64_t v14 = bswap32(*(unsigned int *)((char *)&v39[0].u32[1] + 2));
      int8x8_t v15 = vrev32_s8(*(int8x8_t *)((char *)&v39[1] + 2));
      goto LABEL_21;
    }
    return 0xFFFFFFFFLL;
  }
  memset(buf, 0, 20);
  if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x14) {
    return 0xFFFFFFFFLL;
  }
  sub_10002F038(*(void *)(a1 + 8), 0x14u, (char *)buf);
  unint64_t v10 = bswap32(*(unsigned __int16 *)&buf[2]) >> 16;
  *(_WORD *)&buf[2] = v10;
  *(_WORD *)&uint8_t buf[4] = bswap32(*(unsigned __int16 *)&buf[4]) >> 16;
  uint64_t v11 = bswap32(*(unsigned __int16 *)&buf[18]) >> 16;
  *(_WORD *)&buf[18] = v11;
  if (v11 + 16 > v10)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned int v40 = 134218240;
      uint64_t v41 = *(unsigned __int16 *)&buf[18] + 16;
      __int16 v42 = 1024;
      int v43 = *(unsigned __int16 *)&buf[2];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid message size %lu %d", v40, 0x12u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1788, "HandleUserRequestMessage", 5, 0, "invalid message size %lu %d", *(unsigned __int16 *)&buf[18] + 16, *(unsigned __int16 *)&buf[2]);
    return 4294967294;
  }
  unsigned int v22 = *(_DWORD *)&buf[6];
  int8x8_t v23 = *(int8x8_t *)&buf[10];
  unsigned int v24 = v10 + 4;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unsigned int v40 = 67109120;
    LODWORD(v41) = v24;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "full message size %u", v40, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1794, "HandleUserRequestMessage", 7, 0, "full message size %u", v24);
  if (sub_10002F5EC(*(void *)(a1 + 8)) < v24) {
    return 0xFFFFFFFFLL;
  }
  sub_10002EDA4(*(void *)(a1 + 8), 0x14u);
  unsigned int v28 = *(unsigned __int16 *)&buf[18];
  if (*(_WORD *)&buf[18])
  {
    long long v29 = (char *)malloc_type_calloc(1uLL, *(unsigned __int16 *)&buf[18] + 1, 0xEBFE50E3uLL);
    if (!v29) {
      return 4294967294;
    }
    __int16 v13 = v29;
    sub_10002EA3C(*(void *)(a1 + 8), *(unsigned __int16 *)&buf[18], v29);
    unsigned int v28 = *(unsigned __int16 *)&buf[18];
  }
  else
  {
    __int16 v13 = 0;
  }
  uint64_t v14 = bswap32(v22);
  unint64_t v35 = v28 + 16;
  if (v35 < *(unsigned __int16 *)&buf[2])
  {
    unsigned __int16 v36 = *(_WORD *)&buf[2] - v35;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned int v40 = 67109120;
      LODWORD(v41) = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", v40, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1816, "HandleUserRequestMessage", 7, 0, "extra amount %d", v36);
    sub_10002EDA4(*(void *)(a1 + 8), v36);
  }
  int8x8_t v15 = vrev32_s8(v23);
LABEL_21:
  int8x8_t v38 = v15;
  int v16 = sub_100033760();
  __int32 v17 = v38.i32[1];
  if (!v16 || v38.i32[0] != 1)
  {
    switch(v38.i32[0])
    {
      case 1:
        goto LABEL_42;
      case 3:
        if ((v38.i32[1] - 1) > 4)
        {
LABEL_49:
          uint64_t v25 = a1;
          unsigned int v26 = v14;
          unsigned int v27 = 4;
        }
        else
        {
          uint64_t v25 = a1;
          unsigned int v26 = v14;
          unsigned int v27 = 5;
        }
LABEL_59:
        sub_100029558(v25, v26, v27);
        if (!v13) {
          return 0;
        }
        goto LABEL_76;
      case 2:
        BOOL v19 = sub_100035448();
        if (v38.i32[1] > 5u)
        {
          if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v38.i32[1];
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid response %d", buf, 8u);
          }
          uint64_t v37 = v38.u32[1];
          unsigned int v20 = "invalid response %d";
          int v21 = 1880;
          char v30 = 5;
LABEL_89:
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, v21, "HandleUserRequestMessage", v30, 0, v20, v37);
          if (!v13) {
            return 0;
          }
          goto LABEL_76;
        }
        if (v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v38.i32[1];
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got response %d", buf, 8u);
        }
        uint64_t v37 = v38.u32[1];
        unsigned int v20 = "got response %d";
        int v21 = 1877;
        break;
      default:
        sub_100029558(a1, v14, 3u);
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v38.i32[0];
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send unknown message type %d", buf, 8u);
        }
        uint64_t v37 = v38.u32[0];
        unsigned int v20 = "send unknown message type %d";
        int v21 = 1904;
        break;
    }
    char v30 = 7;
    goto LABEL_89;
  }
  if (v38.i32[1] == 2)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ask to resume ", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1829, "HandleUserRequestMessage", 7, 0, "ask to resume ");
    CCCryptorStatus v18 = +[IDSServiceEmbeddedController sharedIDServiceController];
    [v18 postAskToResumeNotification:a2 senderToken:v14];
    goto LABEL_75;
  }
  sub_100029558(a1, v14, 0);
  __int32 v17 = v38.i32[1];
LABEL_42:
  switch(v17)
  {
    case 1:
      uint64_t v25 = a1;
      unsigned int v26 = v14;
      unsigned int v27 = 0;
      goto LABEL_59;
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "not actually paused, send back OK", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1851, "HandleUserRequestMessage", 7, 0, "not actually paused, send back OK");
      unsigned int v26 = *(unsigned __int32 *)((char *)&v39[0].u32[1] + 2);
      uint64_t v25 = a1;
      unsigned int v27 = 1;
      goto LABEL_59;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ask to copy text", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1846, "HandleUserRequestMessage", 7, 0, "ask to copy text");
      CCCryptorStatus v18 = +[IDSServiceEmbeddedController sharedIDServiceController];
      int v31 = +[NSString stringWithUTF8String:v13];
      [v18 askToCopyToPasteboard:a2 senderToken:v14 message:v31];
      goto LABEL_74;
    case 4:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ask to show message", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1856, "HandleUserRequestMessage", 7, 0, "ask to show message");
      double v32 = +[IDSServiceEmbeddedController sharedIDServiceController];
      uint64_t v33 = +[NSString stringWithUTF8String:v13];
      [v32 showMessageToUser:v33];

      if (v13) {
        goto LABEL_76;
      }
      return 0;
    case 5:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ask to open url", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1862, "HandleUserRequestMessage", 7, 0, "ask to open url");
      CCCryptorStatus v18 = +[IDSServiceEmbeddedController sharedIDServiceController];
      int v31 = +[NSString stringWithUTF8String:v13];
      uint64_t v34 = [a2 sessionController];
      [v18 askToOpenURL:a2 senderToken:v14 URL:v31 sessionController:v34];

LABEL_74:
      break;
    default:
      goto LABEL_49;
  }
LABEL_75:

  if (v13) {
LABEL_76:
  }
    free(v13);
  return 0;
}

void sub_100029558(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SendUserRequestResponse", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1920, "SendUserRequestResponse", 7, 0, "SendUserRequestResponse");
  if (*(_DWORD *)(a1 + 2640) && (*(unsigned char *)(a1 + 2676) & 0x10) != 0)
  {
    unsigned __int16 v6 = malloc_type_calloc(1uLL, 0x20uLL, 0xF29E1141uLL);
    v6[6] = 0;
    *((_DWORD *)v6 + 2) = 18;
    *((unsigned char *)v6 + 14) = 35;
    *((_DWORD *)v6 + 4) = 16780800;
    *((_DWORD *)v6 + 5) = bswap32(a2);
    *((_DWORD *)v6 + 6) = 0x2000000;
    *((_DWORD *)v6 + 7) = bswap32(a3);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "responseCode %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1935, "SendUserRequestResponse", 7, 0, "responseCode %d", a3);
    sub_10002504C(a1, (unsigned int *)v6);
  }
}

void sub_100029714()
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start sending touch events", v1, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1943, "TouchEventEncoding_Start", 7, 0, "start sending touch events");
  +[TouchEventMonitor startMonitoringTouchEvents];
  id v0 = +[NSNotificationCenter defaultCenter];
  [v0 addObserver:qword_10005C928 selector:"notificationHandler:" name:@"TouchEventUpdate" object:0];
}

void sub_1000297F0()
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop sending touch events", v1, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1955, "TouchEventEncoding_Stop", 7, 0, "stop sending touch events");
  +[TouchEventMonitor stopMonitoringTouchEvents];
  id v0 = +[NSNotificationCenter defaultCenter];
  [v0 removeObserver:qword_10005C928];
}

uint64_t start()
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start screen sharing server", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1966, "main", 7, 0, "start screen sharing server");
  GSInitialize();
  id v0 = +[IDSServiceEmbeddedController sharedIDServiceController];
  [v0 initScreenSharingIDSService];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going into runloop", v2, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1969, "main", 7, 0, "going into runloop");
  CFRunLoopRun();
  return 0;
}

void sub_1000299EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100029BE4(uint64_t a1, unsigned __int16 *a2, size_t a3)
{
  if ((unsigned __int16)(a3 - 1532) <= 0xFA17u)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v43 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bad packet size %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 337, "UDPReceiverHandlePacket", 7, 0, "bad packet size %d", a3);
    return 4294967294;
  }
  if (*a2 != 256)
  {
    unint64_t v12 = a3;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = bswap32(*a2);
      *(_DWORD *)buf = 67109376;
      int v43 = HIWORD(v13);
      __int16 v44 = 1024;
      int v45 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bad packet version %d got length %d", buf, 0xEu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 345, "UDPReceiverHandlePacket", 7, 0, "bad packet version %d got length %d", bswap32(*a2) >> 16, a3);
    sub_100035CB8((uint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 346, "UDPReceiverHandlePacket", 7, "badpacket", (unsigned __int8 *)a2, v12);
    return 0;
  }
  *(_DWORD *)(a1 + 52) = sub_10002B5E0();
  unsigned int v7 = a2[1];
  unsigned int v8 = __rev16(v7);
  a2[1] = v8;
  *(int8x8_t *)(a2 + 2) = vrev32_s8(*(int8x8_t *)(a2 + 2));
  a2[8] = bswap32(a2[8]) >> 16;
  a2[9] = bswap32(a2[9]) >> 16;
  if (v8 >= 8)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = a2[1];
      *(_DWORD *)buf = 67109120;
      int v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "udpreceiver - invalid packet type %d - ignoring", buf, 8u);
    }
    uint64_t v40 = a2[1];
    unint64_t v10 = "udpreceiver - invalid packet type %d - ignoring";
    int v11 = 370;
    goto LABEL_12;
  }
  if (v7 == 1792)
  {
    if (!*(_DWORD *)(a1 + 1368)) {
      *(_DWORD *)(a1 + 1368) = -2;
    }
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got fatal error packet from sender", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 378, "UDPReceiverHandlePacket", 5, 0, "got fatal error packet from sender");
    sub_10002E7F4(*(NSObject **)(a1 + 1416));
  }
  if (!*(_DWORD *)(a1 + 1368))
  {
    int v14 = a2[1];
    if (v14 != 4)
    {
      if (v14 == 2) {
        return sub_10002AA98(a1, (uint64_t)a2, a3);
      }
      if (v14 != 1)
      {
        unsigned int v16 = *((_DWORD *)a2 + 2);
        unsigned int v17 = *(_DWORD *)(a1 + 44);
        if (v16 >= v17)
        {
          if (v16 != v17)
          {
            if (v16 >= v17 + 128)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v25 = *((_DWORD *)a2 + 2);
                *(_DWORD *)buf = 67109120;
                int v43 = v25;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "packet out of range index %u", buf, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 510, "UDPReceiverHandlePacket", 5, 0, "packet out of range index %u");
            }
            else
            {
              sub_10002B14C(a1, (uint64_t)a2, a3);
            }
            return 0;
          }
          *(_DWORD *)(a1 + 1364) += a3;
          unsigned int v20 = *((_DWORD *)a2 + 1);
          int v21 = sub_10002AEEC(a1, (uint64_t)a2, a3);
          unsigned __int16 v22 = a2[8];
          unsigned int v23 = *(_DWORD *)(a1 + 44);
          if (v21 || (uint64_t v26 = v23 & 0x7F, v27 = a1 + 2 * v26, (v28 = *(_WORD *)(v27 + 1096)) == 0))
          {
            unsigned int v24 = *(_DWORD *)(a1 + 44);
            if (v23 <= *(_DWORD *)(a1 + 1372)) {
              return 0;
            }
          }
          else
          {
            long long v29 = (unsigned __int16 *)(v27 + 1096);
            do
            {
              uint64_t v30 = *(void *)(a1 + 8 * v26 + 72);
              int v31 = *(_DWORD *)(a1 + 1364);
              if (*(unsigned __int8 *)(a1 + 1353) - 3 > 1 || bswap32(*(_DWORD *)(v30 + 12)) == v31)
              {
                *(_DWORD *)(a1 + 1364) = v31 + v28;
                int v32 = sub_10002AEEC(a1, v30, v28);
                unsigned __int16 v22 = *(_WORD *)(v30 + 16);
                char v33 = 1;
              }
              else
              {
                if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  int v34 = *(_DWORD *)(v30 + 8);
                  unsigned int v35 = bswap32(*(_DWORD *)(v30 + 12));
                  int v36 = *(_DWORD *)(a1 + 1364);
                  *(_DWORD *)buf = 67109632;
                  int v43 = v34;
                  __int16 v44 = 1024;
                  int v45 = v35;
                  __int16 v46 = 1024;
                  int v47 = v36;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pkt index %u bufferSize %u expected %u", buf, 0x14u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 458, "UDPReceiverHandlePacket", 7, 0, "pkt index %u bufferSize %u expected %u", *(_DWORD *)(v30 + 8), bswap32(*(_DWORD *)(v30 + 12)), *(_DWORD *)(a1 + 1364));
                int v32 = 0;
                char v33 = 0;
              }
              free((void *)v30);
              *long long v29 = 0;
              unsigned int v24 = *(_DWORD *)(a1 + 44);
              if (v32) {
                break;
              }
              if ((v33 & 1) == 0) {
                break;
              }
              uint64_t v26 = v24 & 0x7F;
              long long v29 = (unsigned __int16 *)(a1 + 2 * v26 + 1096);
              unsigned __int16 v28 = *v29;
            }
            while (*v29);
            if (v24 <= *(_DWORD *)(a1 + 1372))
            {
              if (v24 - 1 >= *(_DWORD *)(a1 + 68)) {
                sub_10002A4EC((unsigned int *)a1, v20, v24 - 1);
              }
              return 0;
            }
          }
          sub_10002A4EC((unsigned int *)a1, v20, v24 - 1);
          unsigned int v37 = v22 % *(_DWORD *)(a1 + 60);
          int v38 = *(_DWORD *)(a1 + 1372);
          if (*(_DWORD *)(a1 + 64) == 1) {
            int v39 = v38 + 3;
          }
          else {
            int v39 = v38 + v37 + *(unsigned __int16 *)(a1 + 1408) - *(unsigned __int16 *)(a1 + 1410);
          }
          uint64_t result = 0;
          *(_DWORD *)(a1 + 1372) = v39;
          *(_WORD *)(a1 + 1408) = v22;
          *(_WORD *)(a1 + 1410) = v37;
          return result;
        }
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = *((_DWORD *)a2 + 2);
          int v19 = *(_DWORD *)(a1 + 44);
          *(_DWORD *)buf = 67109376;
          int v43 = v18;
          __int16 v44 = 1024;
          int v45 = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*OLD %d wanted %d", buf, 0xEu);
        }
        uint64_t v40 = *((unsigned int *)a2 + 2);
        uint64_t v41 = *(unsigned int *)(a1 + 44);
        unint64_t v10 = "*OLD %d wanted %d";
        int v11 = 413;
LABEL_12:
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, v11, "UDPReceiverHandlePacket", 7, 0, v10, v40, v41);
        return 0;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *((_DWORD *)a2 + 2);
        *(_DWORD *)buf = 67109120;
        int v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got status request for %u", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 393, "UDPReceiverHandlePacket", 7, 0, "got status request for %u", *((_DWORD *)a2 + 2));
    }
    return sub_10002A978(a1, (uint64_t)a2, a3);
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got fatal error calling SendStatusBack", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 384, "UDPReceiverHandlePacket", 5, 0, "got fatal error calling SendStatusBack");
  sub_10002A4EC((unsigned int *)a1, *((_DWORD *)a2 + 1), *(_DWORD *)(a1 + 44) - 1);
  return 4294967292;
}

uint64_t sub_10002A440(uint64_t a1)
{
  uint64_t result = sub_10002B5E0();
  *(_DWORD *)(a1 + 52) = result;
  if (*(unsigned __int8 *)(a1 + 1353) - 3 < 2)
  {
    *(void *)(a1 + 60) = 0x100000001;
    *(_DWORD *)(a1 + 1372) = 2;
    return result;
  }
  unsigned int v3 = result & 7;
  *(_DWORD *)(a1 + 60) = v3;
  *(_DWORD *)(a1 + 64) = v3;
  if ((result & 7) == 0)
  {
    *(void *)(a1 + 60) = 0x100000001;
    int v4 = *(_DWORD *)(a1 + 1372);
    goto LABEL_7;
  }
  int v4 = *(_DWORD *)(a1 + 1372);
  if (v3 == 1)
  {
LABEL_7:
    LOWORD(v5) = 0;
    int v6 = v4 + 3;
    goto LABEL_8;
  }
  unsigned int v5 = 6 % v3;
  int v6 = v4 + *(unsigned __int16 *)(a1 + 1408) + v5 - *(unsigned __int16 *)(a1 + 1410);
LABEL_8:
  *(_DWORD *)(a1 + 1372) = v6;
  *(_WORD *)(a1 + 1408) = 6;
  *(_WORD *)(a1 + 1410) = v5;
  return result;
}

void sub_10002A4EC(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  int v6 = a1 + 11;
  a1[12] = a1[11] - 1;
  memset(v39, 0, 44);
  unsigned int v7 = a1[340];
  unsigned int v8 = sub_10002F7A0(*((_DWORD **)a1 + 172));
  unsigned int v9 = *((unsigned __int16 *)v6 + 8) - 1;
  if (v6[331])
  {
    BYTE12(v39[1]) = v6[331];
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = a1[342];
      *(_DWORD *)buf = 67109120;
      int v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RFB datagram: fatal error %u", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 946, "SendStatusBack", 7, 0, "RFB datagram: fatal error %u", a1[342]);
    unsigned int v11 = 0;
    a3 = 0;
    __int16 v12 = 512;
  }
  else
  {
    int v13 = *v6;
    if (*v6 <= a3)
    {
      if (v13 + 127 < a3)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100036E1C((int *)v6, a3);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 971, "SendStatusBack", 1, 0, "sender is too far ahead %u am at %u", a3, *v6);
        int v13 = *v6;
        a3 = *v6 + 127;
      }
      unsigned int v14 = a3 - v13 + 8;
      unsigned int v11 = v14 >> 3;
      unsigned int v32 = v14 & 0xFFFFFFF8;
      if ((v14 & 0xFFFFFFF8) != 0)
      {
        unsigned int v30 = v9;
        unsigned int v31 = v7;
        unsigned __int8 v15 = 0;
        unsigned int v16 = -(v14 & 0xFFFFFFF8);
        unsigned int v17 = 128;
        do
        {
          unsigned int v18 = a3 + v16 + 1;
          if (v18 <= a3 && v18 >= *v6 && !*((_WORD *)a1 + (v18 & 0x7F) + 548))
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              int v34 = a3 + v16 + 1;
              __int16 v35 = 1024;
              int v36 = v18 & 0x7F;
              __int16 v37 = 1024;
              unsigned int v38 = v32;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "missed pkt %d  offset %d  bitfieldSize %d", buf, 0x14u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 994, "SendStatusBack", 7, 0, "missed pkt %d  offset %d  bitfieldSize %d", a3 + v16 + 1, v18 & 0x7F, v32);
            *((unsigned char *)&v39[1] + v15 + 12) |= v17;
            if (a3 > a1[17]) {
              a1[17] = a3;
            }
          }
          if (v17 >= 2)
          {
            v17 >>= 1;
          }
          else
          {
            ++v15;
            unsigned int v17 = 128;
          }
        }
        while (!__CFADD__(v16++, 1));
        __int16 v12 = 256;
        unsigned int v7 = v31;
        unsigned int v9 = v30;
      }
      else
      {
        __int16 v12 = 256;
      }
    }
    else
    {
      unsigned int v11 = 0;
      __int16 v12 = 0;
      a3 = v13 - 1;
    }
  }
  LODWORD(v39[0]) = 33554688;
  *(void *)((char *)v39 + 4) = _byteswap_uint64(__PAIR64__(a2, a3));
  HIDWORD(v39[0]) = bswap32(v7);
  LOWORD(v39[1]) = bswap32(v9) >> 16;
  WORD2(v39[1]) = v12;
  *(_DWORD *)((char *)&v39[1] + 6) = bswap32(v8);
  WORD5(v39[1]) = bswap32(v11) >> 16;
  int v20 = *((unsigned __int8 *)a1 + 1353);
  if ((v20 - 3) < 2)
  {
    WORD1(v39[1]) = 44;
    uint64_t v24 = *((void *)a1 + 182);
    if (*(unsigned char *)(v24 + 3272))
    {
      sub_10000584C(*(void **)(v24 + 3264), (uint64_t)v39, 44);
    }
    else
    {
      if (*((unsigned char *)a1 + 1440))
      {
        int v25 = 0;
        socklen_t v26 = 0;
      }
      else
      {
        int v25 = (const sockaddr *)(a1 + 4);
        socklen_t v26 = *((unsigned __int8 *)a1 + 16);
      }
      if (sendto(*a1, v39, 0x2CuLL, 0, v25, v26) == -1)
      {
        int v27 = *__error();
        unsigned __int16 v28 = __error();
        long long v29 = strerror(*v28);
        sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 1062, "SendStatusBack", 7, 0, "SendStatusBack errno %d %s r->readSockFD = %d", v27, v29, *a1);
      }
    }
  }
  else if ((v20 - 1) <= 1)
  {
    int v21 = (void (*)(uint64_t, sockaddr *, _OWORD *, uint64_t, void))*((void *)a1 + 179);
    uint64_t v22 = *a1;
    unsigned int v23 = (sockaddr *)(a1 + 4);
    if (v21) {
      v21(v22, v23, v39, 44, 0);
    }
    else {
      sub_10002B60C(v22, v23, v39, 0x2Cu);
    }
  }
}

uint64_t sub_10002A978(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 0x13)
  {
    sub_10002A4EC((unsigned int *)a1, *(_DWORD *)(a2 + 4), *(_DWORD *)(a2 + 8));
    uint64_t v6 = *(void *)(a1 + 1376);
    if (*(unsigned char *)(v6 + 48))
    {
      uint64_t result = sub_10002F5EC(v6);
      if (!result) {
        return result;
      }
      sub_10002E7F4(*(NSObject **)(*(void *)(a1 + 1376) + 32));
    }
    return 0;
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "status requst too small %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 787, "ProcessStatusRequest", 7, 0, "status requst too small %d", a3);
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10002AA98(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(_WORD *)(a2 + 20) = bswap32(*(unsigned __int16 *)(a2 + 20)) >> 16;
  *(_DWORD *)(a2 + 22) = bswap32(*(_DWORD *)(a2 + 22));
  *(_WORD *)(a2 + 26) = bswap32(*(unsigned __int16 *)(a2 + 26)) >> 16;
  if (a3 > 0x2B)
  {
    uint64_t v5 = *(void *)(a1 + 1456);
    if (v5)
    {
      uint64_t v7 = *(void *)(v5 + 3248);
      if (*(_DWORD *)(a2 + 8) >= *(_DWORD *)(v7 + 44))
      {
        [*(id *)(v5 + 56) lock];
        ++*(_DWORD *)(v5 + 80);
        int v8 = *(unsigned __int16 *)(a2 + 20);
        *(_WORD *)uint64_t v7 = v8;
        *(_DWORD *)(v7 + 40) = *(_DWORD *)(a2 + 8);
        *(_DWORD *)(v7 + 12) = 0;
        *(_WORD *)(v7 + 2) = 0;
        if (!v8)
        {
          int v9 = sub_10002B5E0();
          *(_DWORD *)(v7 + 48) = v9;
          *(_DWORD *)(v7 + 52) = v9;
        }
        *(_DWORD *)(v7 + 8) = *(_DWORD *)(a2 + 22);
        size_t v10 = *(unsigned __int16 *)(a2 + 26);
        if (v10 < 0x11)
        {
          if (*(_WORD *)v7 == 1)
          {
            *(_WORD *)(v7 + 16) = v10;
            memcpy((void *)(v7 + 18), (const void *)(a2 + 28), v10);
          }
          else if (!*(_WORD *)v7)
          {
            *(_DWORD *)(v7 + 44) = *(_DWORD *)(v7 + 40);
          }
          int v12 = sub_10002B5E0();
          int v13 = *(_DWORD *)(a2 + 4);
          if (v13)
          {
            unsigned int v14 = v12 - v13;
            if (v14 >= 0x989680) {
              uint64_t v15 = 10000000;
            }
            else {
              uint64_t v15 = v14;
            }
            int v16 = *(_DWORD *)(v7 + 56);
            int v17 = *(_DWORD *)(v7 + 60);
            int v18 = v15 - v16;
            int v19 = v15 - v16 + 7;
            if ((int)v15 - v16 >= 0) {
              int v19 = v15 - v16;
            }
            int v20 = (v16 + (v19 >> 3)) & ~((v16 + (v19 >> 3)) >> 31);
            if (v18 >= 0) {
              uint64_t v21 = v18;
            }
            else {
              uint64_t v21 = -v18;
            }
            int v22 = v21 - v17;
            if ((int)v21 < v17) {
              int v22 = v21 - v17 + 3;
            }
            int v23 = v17 + (v22 >> 2);
            *(_DWORD *)(v7 + 56) = v20;
            *(_DWORD *)(v7 + 60) = v23;
            *(_DWORD *)(v7 + 64) = (v20 + 4 * v23) & ~((v20 + 4 * v23) >> 31);
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = *(_DWORD *)(v7 + 56);
              *(_DWORD *)buf = 67109120;
              int v29 = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "receiver->smoothedRoundTripTime %u", buf, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 716, "ProcessStatusReply", 7, 0, "receiver->smoothedRoundTripTime %u", *(_DWORD *)(v7 + 56));
            if ((~++dword_10005C930 & 0x1FF) == 0)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v25 = *(_DWORD *)(v7 + 56);
                int v26 = *(_DWORD *)(v7 + 60);
                int v27 = *(_DWORD *)(v7 + 64);
                *(_DWORD *)buf = 67110144;
                int v29 = v15;
                __int16 v30 = 1024;
                int v31 = v21;
                __int16 v32 = 1024;
                int v33 = v25;
                __int16 v34 = 1024;
                int v35 = v26;
                __int16 v36 = 1024;
                int v37 = v27;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "rt time %u delta %u smoothed %u deviation %u timeout %d", buf, 0x20u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 730, "ProcessStatusReply", 7, 0, "rt time %u delta %u smoothed %u deviation %u timeout %d", v15, v21);
            }
          }
        }
        else
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = *(unsigned __int16 *)(a2 + 26);
            *(_DWORD *)buf = 67109120;
            int v29 = v11;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "protocol error - bitmap size wrong %d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 676, "ProcessStatusReply", 5, 0, "protocol error - bitmap size wrong %d");
        }
        [*(id *)(v5 + 56) unlock];
        if (*(unsigned char *)(v5 + 3175)) {
          sub_10002E7F4(*(NSObject **)(v5 + 40));
        }
      }
      return 0;
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100036F40();
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 643, "ProcessStatusReply", 1, 0, "status reply, no sender info set");
      return 4294967294;
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100036EAC(a3);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 628, "ProcessStatusReply", 1, 0, "status reply too small %d %zu", a3, 0x2CuLL);
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10002AEEC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = *(unsigned __int16 *)(a2 + 2);
  if (v6 == 6)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got kRFBDatagramDataPacketForceReply", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 894, "DispatchPacket", 7, 0, "got kRFBDatagramDataPacketForceReply");
    return sub_10002B380(a1, a2, a3, 1);
  }
  else if (v6 == 3)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "machine index", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 889, "DispatchPacket", 7, 0, "machine index");
    return 0;
  }
  else if (*(_WORD *)(a2 + 2))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int16 *)(a2 + 2);
      *(_DWORD *)buf = 67109120;
      int v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknwon packet type %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 900, "DispatchPacket", 7, 0, "unknwon packet type %d", *(unsigned __int16 *)(a2 + 2));
    return 0xFFFFFFFFLL;
  }
  else
  {
    return sub_10002B380(a1, a2, a3, 0);
  }
}

void sub_10002B14C(uint64_t a1, uint64_t a2, size_t size)
{
  uint64_t v5 = *(_DWORD *)(a2 + 8) & 0x7F;
  uint64_t v6 = a1 + 2 * v5;
  if (*(_WORD *)(v6 + 1096))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a2 + 8);
      int v8 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)buf = 67109376;
      int v18 = v7;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "already received %u wanted %u", buf, 0xEu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 829, "BufferPendingPacket", 7, 0, "already received %u wanted %u", *(unsigned int *)(a2 + 8));
  }
  else
  {
    *(_WORD *)(v6 + 1096) = size;
    size_t v9 = size;
    int v10 = malloc_type_malloc(size, 0xF3C7243uLL);
    if (v10)
    {
      int v11 = v10;
      memcpy(v10, (const void *)a2, v9);
      *(void *)(a1 + 8 * v5 + 72) = v11;
      unsigned int v12 = *(_DWORD *)(a2 + 8);
      unsigned int v13 = *(_DWORD *)(a1 + 1372);
      if (v12 >= v13)
      {
        if (*(_DWORD *)(a1 + 44) >= *(_DWORD *)(a1 + 68))
        {
          sub_10002A4EC((unsigned int *)a1, *(_DWORD *)(a2 + 4), v12);
          unsigned int v13 = *(_DWORD *)(a1 + 1372);
        }
        unsigned int v14 = *(unsigned __int16 *)(a2 + 16);
        int v15 = v14 % *(_DWORD *)(a1 + 60);
        if (*(_DWORD *)(a1 + 64) == 1) {
          int v16 = v13 + 3;
        }
        else {
          int v16 = v13 + v15 + *(unsigned __int16 *)(a1 + 1408) - *(unsigned __int16 *)(a1 + 1410);
        }
        *(_DWORD *)(a1 + 1372) = v16;
        *(_WORD *)(a1 + 1408) = v14;
        *(_WORD *)(a1 + 1410) = v15;
      }
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BufferPendingPacket - unable to allocate memory for packet", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 839, "BufferPendingPacket", 7, 0, "BufferPendingPacket - unable to allocate memory for packet");
    }
  }
}

uint64_t sub_10002B380(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  unsigned int v8 = sub_10002F7A0(*(_DWORD **)(a1 + 1376));
  unint64_t v9 = a3 - 20;
  uint64_t v10 = *(void *)(a1 + 1376);
  if (v9 <= v8)
  {
    unsigned int v14 = sub_10002F2F8(v10, v9, (char *)(a2 + 20));
    if (v14)
    {
      unsigned int v15 = v14;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected error netbufferadd %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 576, "ProcessDataPacket", 5, 0, "unexpected error netbufferadd %d", v15);
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 1376);
      if (*(unsigned char *)(v16 + 48)) {
        sub_10002E7F4(*(NSObject **)(v16 + 32));
      }
      unsigned int v17 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)(a1 + 44) = v17 + 1;
      if (a4 || v8 <= 0xFDE7 && v17 + 1 > *(_DWORD *)(a1 + 48) + 5 && *(_DWORD *)(a1 + 1372) > v17 + 9) {
        sub_10002A4EC((unsigned int *)a1, *(_DWORD *)(a2 + 4), v17);
      }
    }
    return 0;
  }
  else
  {
    sub_10002E7F4(*(NSObject **)(v10 + 32));
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = sub_10002F5EC(*(void *)(a1 + 1376));
      *(_DWORD *)buf = 67109632;
      unsigned int v19 = v8;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 1024;
      unsigned int v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "buffer full - freespace %u available %u packetSize %d", buf, 0x14u);
    }
    int v12 = sub_10002F5EC(*(void *)(a1 + 1376));
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/UDPReceiver.c", 104, 547, "ProcessDataPacket", 7, 0, "buffer full - freespace %u available %u packetSize %d", v8, v12, a3);
    sub_10002A4EC((unsigned int *)a1, *(_DWORD *)(a2 + 4), *(_DWORD *)(a1 + 44) - 2);
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10002B5E0()
{
  uint64_t v1 = 0;
  sub_1000335C8(&v1);
  return v1;
}

uint64_t sub_10002B60C(int a1, sockaddr *a2, void *a3, unsigned int a4)
{
  if (a4 < 0x5C9)
  {
    ssize_t v5 = sendto(a1, a3, a4, 0, a2, a2->sa_len);
    uint64_t result = 0;
    if (v5 == a4) {
      return result;
    }
    int v7 = *__error();
    unsigned int v8 = __error();
    unint64_t v9 = strerror(*v8);
    sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/UDPUtils.c", 87, 197, "UDPWriteNetworkPacket", 7, 0, "UDPWriteNetworkPacket result looks wrong %d %s", v7, v9);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pkt too large %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/UDPUtils.c", 87, 184, "UDPWriteNetworkPacket", 7, 0, "pkt too large %d", a4);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10002B768(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a1 + 28) == 4)
  {
    return sub_10002B824(a1, a2);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bad viewer state", v3, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 105, "HandleViewerMessage", 7, 0, "bad viewer state");
    return 4294967294;
  }
}

uint64_t sub_10002B824(uint64_t a1, void *a2)
{
  unsigned __int8 v104 = 0;
  if (*(unsigned char *)(a1 + 1514))
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 1513);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[2] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer->pendingCmd %d", (uint8_t *)buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 129, "HandleViewerCommand", 7, 0, "viewer->pendingCmd %d", *(unsigned __int8 *)(a1 + 1513));
    int v5 = *(unsigned __int8 *)(a1 + 1513);
    unsigned __int8 v104 = *(unsigned char *)(a1 + 1513);
  }
  else
  {
    sub_10002F038(*(void *)(a1 + 8), 1u, (char *)&v104);
    int v5 = v104;
  }
  switch(v5)
  {
    case 0:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set pixel format", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 138, "HandleViewerCommand", 7, 0, "set pixel format");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x14) {
        return 0xFFFFFFFFLL;
      }
      memset(buf, 0, 20);
      sub_10002EA3C(*(void *)(a1 + 8), 0x14u, (char *)buf);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v105[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetPixelFormatMessage", (uint8_t *)v105, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 874, "HandleSetPixelFormatMessage", 7, 0, "HandleSetPixelFormatMessage");
      [0 lock];
      uint8_t buf[4] = bswap32(buf[4]) >> 16;
      buf[5] = bswap32(buf[5]) >> 16;
      buf[6] = bswap32(buf[6]) >> 16;
      *(_OWORD *)(a1 + 104) = *(_OWORD *)&buf[2];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = LOBYTE(buf[2]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bitsperpixel %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 885, "HandleSetPixelFormatMessage", 7, 0, "bitsperpixel %d", LOBYTE(buf[2]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = HIBYTE(buf[2]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "depth %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 886, "HandleSetPixelFormatMessage", 7, 0, "depth %d", HIBYTE(buf[2]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = LOBYTE(buf[3]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bigEndianFlag %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 887, "HandleSetPixelFormatMessage", 7, 0, "bigEndianFlag %d", LOBYTE(buf[3]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = HIBYTE(buf[3]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trueColorFlag %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 888, "HandleSetPixelFormatMessage", 7, 0, "trueColorFlag %d", HIBYTE(buf[3]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = buf[4];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "redMax %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 889, "HandleSetPixelFormatMessage", 7, 0, "redMax %d", buf[4]);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = buf[5];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "greenMax %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 890, "HandleSetPixelFormatMessage", 7, 0, "greenMax %d", buf[5]);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = buf[6];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "blueMax %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 891, "HandleSetPixelFormatMessage", 7, 0, "blueMax %d", buf[6]);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = LOBYTE(buf[7]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "redShift %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 892, "HandleSetPixelFormatMessage", 7, 0, "redShift %d", LOBYTE(buf[7]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = HIBYTE(buf[7]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "greenShift %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 893, "HandleSetPixelFormatMessage", 7, 0, "greenShift %d", HIBYTE(buf[7]));
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = LOBYTE(buf[8]);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "blueShift %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 894, "HandleSetPixelFormatMessage", 7, 0, "blueShift %d", LOBYTE(buf[8]));
      if (HIBYTE(buf[2]) > 8u)
      {
        *(unsigned char *)(a1 + 122) = 32;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v66 = *(unsigned __int8 *)(a1 + 122);
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[2] = v66;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetPixelFormatMessage %d", (uint8_t *)v105, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 906, "HandleSetPixelFormatMessage", 7, 0, "HandleSetPixelFormatMessage %d", *(unsigned __int8 *)(a1 + 122));
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v67 = *(unsigned __int16 *)(a1 + 1280);
          uint64_t v68 = *(void *)(a1 + 1264);
          *(_DWORD *)v105 = 67109376;
          *(_DWORD *)&v105[2] = v67;
          uint8_t v105[4] = 2048;
          *(void *)&v105[5] = v68;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer->translatedPixelSize %d  viewer->trans_func %p", (uint8_t *)v105, 0x12u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 908, "HandleSetPixelFormatMessage", 7, 0, "viewer->translatedPixelSize %d  viewer->trans_func %p", *(unsigned __int16 *)(a1 + 1280), *(const void **)(a1 + 1264));
        uint64_t v6 = 0;
        *(unsigned char *)(a1 + 156) = 0;
      }
      else
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[2] = HIBYTE(buf[2]);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%d Only 16 or 32 bit pixels supported.", (uint8_t *)v105, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 898, "HandleSetPixelFormatMessage", 7, 0, "%d Only 16 or 32 bit pixels supported.", HIBYTE(buf[2]));
        uint64_t v6 = 4294967294;
      }
      [0 unlock];
      return v6;
    case 2:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set encodings", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 142, "HandleViewerCommand", 7, 0, "set encodings");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 4) {
        return 0xFFFFFFFFLL;
      }
      int v106 = 0;
      memset(v105, 0, sizeof(v105));
      sub_10002F038(*(void *)(a1 + 8), 4u, (char *)v105);
      v105[1] = bswap32(v105[1]) >> 16;
      unsigned int v10 = sub_10002F5EC(*(void *)(a1 + 8));
      uint64_t v11 = v105[1];
      uint64_t v12 = 4 * v105[1];
      if (v12 + 4 > (unint64_t)v10) {
        return 0xFFFFFFFFLL;
      }
      if (v105[1] > 0x64u) {
        return 4294967294;
      }
      sub_10002EDA4(*(void *)(a1 + 8), 4u);
      sub_10002EA3C(*(void *)(a1 + 8), v12, (char *)buf);
      if (v11)
      {
        unsigned int v13 = (unsigned int *)buf;
        uint64_t v14 = v11;
        do
        {
          unsigned int *v13 = bswap32(*v13);
          ++v13;
          --v14;
        }
        while (v14);
        for (uint64_t i = 0; i != v11; ++i)
        {
          int v16 = *(_DWORD *)&buf[2 * i];
          if ((v16 - 1000) <= 0xB && ((1 << (v16 + 24)) & 0x807) != 0 || v16 == 6 || v16 == 16) {
            goto LABEL_303;
          }
        }
        __int16 v20 = (_DWORD *)(a1 + 140);
        *(_DWORD *)(a1 + 144) = *(_DWORD *)(a1 + 140);
        int v21 = (_DWORD *)(a1 + 144);
      }
      else
      {
        LODWORD(i) = 0;
LABEL_303:
        __int16 v20 = (_DWORD *)(a1 + 140);
        *(_DWORD *)(a1 + 144) = *(_DWORD *)(a1 + 140);
        int v21 = (_DWORD *)(a1 + 144);
        if (i != v11)
        {
          *__int16 v20 = *(_DWORD *)&buf[2 * i];
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v90 = *v20;
            *(_DWORD *)__str = 67109120;
            LODWORD(v108) = v90;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "preferred codec %u", (uint8_t *)__str, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 562, "HandleSetEncodingsMessage", 7, 0, "preferred codec %u", *v20);
          goto LABEL_309;
        }
      }
      *__int16 v20 = 0;
LABEL_309:
      *(_WORD *)(a1 + 664) = 0;
      *(void *)(a1 + 148) = 0;
      *(_DWORD *)(a1 + 158) = 0;
      if (!v11)
      {
        int v103 = 0;
LABEL_349:
        if (*v21 != *v20)
        {
          *(unsigned char *)(a1 + 1506) = 1;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__str = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "codec change", (uint8_t *)__str, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 657, "HandleSetEncodingsMessage", 7, 0, "codec change");
        }
        if (*(unsigned char *)(a1 + 664))
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__str = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer wants user info", (uint8_t *)__str, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 664, "HandleSetEncodingsMessage", 7, 0, "viewer wants user info");
        }
        int v98 = *(unsigned __int8 *)(a1 + 3056);
        if (v103)
        {
          BOOL v99 = sub_100035448();
          if (v98)
          {
            if (v99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__str = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "already monitoring touch events", (uint8_t *)__str, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 676, "HandleSetEncodingsMessage", 7, 0, "already monitoring touch events");
          }
          else
          {
            if (v99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__str = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send touch events", (uint8_t *)__str, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 671, "HandleSetEncodingsMessage", 7, 0, "send touch events");
            *(unsigned char *)(a1 + 3056) = 1;
            sub_100029714();
          }
        }
        else if (*(unsigned char *)(a1 + 3056))
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__str = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "do not sned touch events", (uint8_t *)__str, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 682, "HandleSetEncodingsMessage", 7, 0, "do not sned touch events");
          *(unsigned char *)(a1 + 3056) = 0;
          sub_1000297F0();
        }
        [0 unlock];
        return 0;
      }
      int v103 = 0;
      __int16 v91 = (int *)buf;
      while (1)
      {
        int v92 = *v91;
        if (*v91 <= 15)
        {
          if (v92 > 0)
          {
            if (v92 == 1)
            {
              *(unsigned char *)(a1 + 152) = 1;
            }
            else if (v92 == 6)
            {
LABEL_327:
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v96 = *v91;
                *(_DWORD *)__str = 67109120;
                LODWORD(v108) = v96;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lossless codec %d", (uint8_t *)__str, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 640, "HandleSetEncodingsMessage", 7, 0, "lossless codec %d", *v91);
              *(_DWORD *)(a1 + 148) = *v91;
            }
          }
          else if (v92 == -239)
          {
            *(unsigned char *)(a1 + 154) = 1;
          }
          else if (v92 == -223)
          {
            *(unsigned char *)(a1 + 158) = 1;
          }
          goto LABEL_346;
        }
        switch(v92)
        {
          case 1100:
            *(unsigned char *)(a1 + 155) = 1;
            goto LABEL_346;
          case 1101:
          case 1105:
            int v93 = *(unsigned __int8 *)(a1 + 160);
            if (v92 == 1101)
            {
              int v97 = *(unsigned __int8 *)(a1 + 159);
              *(unsigned char *)(a1 + 159) = 1;
              int v94 = v93;
              if (!v97) {
                goto LABEL_342;
              }
            }
            else
            {
              int v94 = *(unsigned __int8 *)(a1 + 160);
              if (v92 == 1105)
              {
                int v94 = 1;
                *(unsigned char *)(a1 + 160) = 1;
              }
            }
            if (!v93 && v94)
            {
LABEL_342:
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__str = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send encoding", (uint8_t *)__str, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 626, "HandleSetEncodingsMessage", 7, 0, "send encoding");
              *(unsigned char *)(a1 + 1454) = 1;
            }
LABEL_346:
            ++v91;
            if (!--v11) {
              goto LABEL_349;
            }
            break;
          case 1102:
          case 1103:
            goto LABEL_346;
          case 1104:
            *(unsigned char *)(a1 + 153) = 1;
            goto LABEL_346;
          case 1106:
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__str = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "touch position encoding", (uint8_t *)__str, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 646, "HandleSetEncodingsMessage", 7, 0, "touch position encoding");
            int v103 = 1;
            goto LABEL_346;
          default:
            if ((v92 - 1000) < 3 || v92 == 16) {
              goto LABEL_327;
            }
            goto LABEL_346;
        }
      }
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "frame buffer update request", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 146, "HandleViewerCommand", 7, 0, "frame buffer update request");
      uint8_t buf[4] = 0;
      *(void *)buf = 0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v105[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleFrameBuferUpdateRequestMessage", (uint8_t *)v105, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 227, "HandleFrameBuferUpdateRequestMessage", 7, 0, "HandleFrameBuferUpdateRequestMessage");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0xA) {
        return 0xFFFFFFFFLL;
      }
      if (*(unsigned char *)(a1 + 1499)) {
        return 4294967294;
      }
      sub_10002EA3C(*(void *)(a1 + 8), 0xAu, (char *)buf);
      uint64_t v6 = 0;
      *(unsigned char *)(a1 + 121) = 2;
      return v6;
    case 4:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10003700C();
      }
      int v7 = "HandleViewerCommand";
      unsigned int v8 = "key event received - close conenction";
      int v9 = 150;
      goto LABEL_93;
    case 5:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100037054();
      }
      int v7 = "HandleViewerCommand";
      unsigned int v8 = "pointer event received - close conenction";
      int v9 = 154;
      goto LABEL_93;
    case 7:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBSetScreenDepth", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 158, "HandleViewerCommand", 7, 0, "kRFBSetScreenDepth");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 4) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)buf = 0;
      uint64_t v23 = *(void *)(a1 + 8);
      unsigned int v24 = 4;
      goto LABEL_150;
    case 8:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBSetServerScaling", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 162, "HandleViewerCommand", 7, 0, "kRFBSetServerScaling");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0xA) {
        return 0xFFFFFFFFLL;
      }
      uint8_t v105[4] = 0;
      *(void *)v105 = 0;
      sub_10002EA3C(*(void *)(a1 + 8), 0xAu, (char *)v105);
      double v25 = COERCE_DOUBLE(bswap64(*(unint64_t *)&v105[1]));
      *(double *)&v105[1] = v25;
      uint64_t v6 = 4294967294;
      if (v25 <= 0.0 || v25 > 1.0) {
        return v6;
      }
      unsigned int v26 = objc_msgSend(0, "lock", v25);
      if (v26)
      {
        unsigned int v27 = v26;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[2] = v27;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****enter HandleSetServerScalingMessage err %d", (uint8_t *)buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 984, "HandleSetServerScalingMessage", 7, 0, "*****enter HandleSetServerScalingMessage err %d", v27);
      }
      double v28 = *(double *)&v105[1];
      *(void *)(a1 + 1400) = *(void *)&v105[1];
      *(unsigned char *)(a1 + 1395) = 1;
      *(unsigned char *)(a1 + 1394) = v28 < 1.0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 1400);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[2] = v29;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetServerScalingMessage - set scaling to %f", (uint8_t *)buf, 0xCu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 998, "HandleSetServerScalingMessage", 7, 0, "HandleSetServerScalingMessage - set scaling to %f", *(double *)(a1 + 1400));
      *(unsigned char *)(a1 + 1392) = 1;
      unsigned int v30 = [0 unlock];
      if (v30)
      {
        unsigned int v31 = v30;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[2] = v31;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****enter HandleSetServerScalingMessage err %d", (uint8_t *)buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1003, "HandleSetServerScalingMessage", 7, 0, "*****enter HandleSetServerScalingMessage err %d");
      }
      return 0;
    case 9:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBAutoFrameBufferUpdates", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 166, "HandleViewerCommand", 7, 0, "kRFBAutoFrameBufferUpdates");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x10) {
        return 0xFFFFFFFFLL;
      }
      if (*(unsigned char *)(a1 + 1499)) {
        return 4294967294;
      }
      *(void *)buf = 0;
      *(void *)&uint8_t buf[4] = 0;
      sub_10002EA3C(*(void *)(a1 + 8), 0x10u, (char *)buf);
      [0 lock];
      buf[1] = bswap32(buf[1]) >> 16;
      int v32 = *(_DWORD *)&buf[2];
      *(_DWORD *)&buf[2] = bswap32(*(unsigned int *)&buf[2]);
      unsigned int v33 = bswap32(buf[4]);
      unsigned int v34 = HIWORD(v33);
      uint8_t buf[4] = HIWORD(v33);
      unsigned int v35 = bswap32(buf[5]);
      unsigned int v36 = HIWORD(v35);
      buf[5] = HIWORD(v35);
      unsigned int v37 = bswap32(buf[6]) >> 16;
      buf[6] = v37;
      unsigned int v38 = bswap32(buf[7]) >> 16;
      buf[7] = v38;
      *(_DWORD *)(a1 + 48) = *(_DWORD *)&buf[2];
      *(unsigned char *)(a1 + 44) = v32 != -1;
      *(_WORD *)(a1 + 64) = HIWORD(v35);
      *(_WORD *)(a1 + 66) = HIWORD(v33);
      unsigned int v39 = v38 + HIWORD(v35);
      *(_WORD *)(a1 + 68) = v38 + HIWORD(v35);
      unsigned int v40 = v37 + HIWORD(v33);
      *(_WORD *)(a1 + 70) = v37 + HIWORD(v33);
      if (*(unsigned char *)(a1 + 1394))
      {
        double v41 = *(double *)(a1 + 1400);
        LOWORD(v36) = llround((double)v36 / v41);
        LOWORD(v34) = llround((double)v34 / v41);
        LOWORD(v40) = v34 + llround((double)v37 / v41);
        LOWORD(v39) = v36 + llround((double)v38 / v41);
      }
      *(_WORD *)(a1 + 56) = v36;
      *(_WORD *)(a1 + 58) = v34;
      *(_WORD *)(a1 + 62) = v40;
      *(_WORD *)(a1 + 60) = v39;
      if ((v36 & 0x8000) != 0)
      {
        *(_WORD *)(a1 + 56) = 0;
        if ((v34 & 0x8000) == 0)
        {
LABEL_129:
          if ((v40 & 0x8000) == 0) {
            goto LABEL_130;
          }
          goto LABEL_300;
        }
      }
      else if ((v34 & 0x8000) == 0)
      {
        goto LABEL_129;
      }
      *(_WORD *)(a1 + 58) = 0;
      if ((v40 & 0x8000) == 0)
      {
LABEL_130:
        if ((v39 & 0x8000) == 0) {
          goto LABEL_131;
        }
        goto LABEL_301;
      }
LABEL_300:
      *(_WORD *)(a1 + 62) = 0;
      if ((v39 & 0x8000) == 0) {
        goto LABEL_131;
      }
LABEL_301:
      *(_WORD *)(a1 + 60) = 0;
LABEL_131:
      [0 unlock];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = *(unsigned __int8 *)(a1 + 44);
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = v42;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleAutoFrameBufferUpdateMessage2  flag %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1069, "HandleAutoFrameBufferUpdateMessage", 7, 0, "HandleAutoFrameBufferUpdateMessage2  flag %d");
      return 0;
    case 10:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBSetMode", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 170, "HandleViewerCommand", 7, 0, "kRFBSetMode");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 4) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)buf = 0;
      sub_10002EA3C(*(void *)(a1 + 8), 4u, (char *)buf);
      unsigned int v43 = __rev16(buf[1]);
      if (v43 > 2) {
        return 4294967294;
      }
      if ((unsigned __int16)(v43 - 1) <= 1u && (*(unsigned char *)(a1 + 1492) || buf[1] == 512 && !*(unsigned char *)(a1 + 1493))) {
        return 0;
      }
      uint64_t v6 = 0;
      *(_WORD *)(a1 + 26) = v43;
      return v6;
    case 13:
      *(void *)buf = 0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v105[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start HandleSetDisplayMessage", (uint8_t *)v105, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 492, "HandleSetDisplayMessage", 7, 0, "start HandleSetDisplayMessage");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 8) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v23 = *(void *)(a1 + 8);
      unsigned int v24 = 8;
LABEL_150:
      sub_10002EA3C(v23, v24, (char *)buf);
      return 0;
    case 18:
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 8) {
        return 0xFFFFFFFFLL;
      }
      *(void *)v105 = 0;
      sub_10002F038(*(void *)(a1 + 8), 8u, (char *)v105);
      v105[1] = bswap32(v105[1]) >> 16;
      v105[2] = bswap32(v105[2]) >> 16;
      v105[3] = bswap32(v105[3]) >> 16;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[2] = v105[1];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetEncryptionMessage cmd %d", (uint8_t *)buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 719, "HandleSetEncryptionMessage", 7, 0, "HandleSetEncryptionMessage cmd %d", v105[1]);
      if (v105[1] == 2)
      {
        sub_10002EDA4(*(void *)(a1 + 8), 8u);
        if (v105[2] == 1)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            buf[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "**going to decrypt everything that is received", (uint8_t *)buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 778, "HandleSetEncryptionMessage", 7, 0, "**going to decrypt everything that is received");
          *(unsigned char *)(a1 + 2218) = 1;
          uint64_t v78 = *(void *)(a1 + 2488);
          if (v78)
          {
            uint64_t v6 = 0;
            *(unsigned char *)(v78 + 1352) = 1;
            return v6;
          }
        }
        else
        {
          *(unsigned char *)(a1 + 2218) = 0;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            buf[0] = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop encrypting the stream", (uint8_t *)buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 789, "HandleSetEncryptionMessage", 7, 0, "stop encrypting the stream", v102);
        }
        return 0;
      }
      if (v105[1] != 1)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[2] = v105[1];
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetEncryptionMessage - invalid encryptionCommand %d", (uint8_t *)buf, 8u);
        }
        uint64_t v102 = v105[1];
        int v7 = "HandleSetEncryptionMessage";
        unsigned int v8 = "HandleSetEncryptionMessage - invalid encryptionCommand %d";
        int v9 = 802;
        goto LABEL_273;
      }
      if (v105[3] >= 0x65u)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[2] = v105[3];
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetEncryptionMessage - invalid # of encryption methods: %d", (uint8_t *)buf, 8u);
        }
        uint64_t v102 = v105[3];
        int v7 = "HandleSetEncryptionMessage";
        unsigned int v8 = "HandleSetEncryptionMessage - invalid # of encryption methods: %d";
        int v9 = 725;
LABEL_273:
        char v22 = 5;
        goto LABEL_94;
      }
      unsigned int v83 = sub_10002F5EC(*(void *)(a1 + 8));
      uint64_t v84 = v105[3];
      uint64_t v85 = 4 * v105[3];
      if (v85 + 8 > (unint64_t)v83) {
        return 0xFFFFFFFFLL;
      }
      sub_10002EDA4(*(void *)(a1 + 8), 8u);
      sub_10002EA3C(*(void *)(a1 + 8), v85, (char *)buf);
      if (!v84)
      {
LABEL_290:
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__str = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetEncryptionMessage - no valid encryption method found", (uint8_t *)__str, 2u);
        }
        int v7 = "HandleSetEncryptionMessage";
        unsigned int v8 = "HandleSetEncryptionMessage - no valid encryption method found";
        int v9 = 755;
        goto LABEL_273;
      }
      unsigned int v86 = (unsigned int *)buf;
      uint64_t v87 = v84;
      do
      {
        *unsigned int v86 = bswap32(*v86);
        ++v86;
        --v87;
      }
      while (v87);
      v88 = buf;
      while (1)
      {
        int v89 = *(_DWORD *)v88;
        v88 += 2;
        if (v89 == 1) {
          break;
        }
        if (!--v84) {
          goto LABEL_290;
        }
      }
      [0 lock];
      *(unsigned char *)(a1 + 2178) = 1;
      *(_DWORD *)(a1 + 2180) = 1;
      *(_WORD *)(a1 + 2184) = v105[2];
      sub_100006DF8((char *)(a1 + 2202), 16);
      sub_100006DF8((char *)(a1 + 2186), 16);
      [0 unlock];
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__str = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleSetEncryptionMessage 2", (uint8_t *)__str, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 771, "HandleSetEncryptionMessage", 7, 0, "HandleSetEncryptionMessage 2");
      return 0;
    case 22:
      memset(buf, 0, 34);
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x10) {
        return 0xFFFFFFFFLL;
      }
      while (2)
      {
        int v44 = sub_10002F038(*(void *)(a1 + 8), 0x10u, (char *)buf);
        if (v44)
        {
          int v45 = v44;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 67109120;
            *(_DWORD *)&v105[2] = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NetBufferViewData:%d", (uint8_t *)v105, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 356, "HandleAssistCursorMessage", 7, 0, "NetBufferViewData:%d", v45);
        }
        if (LOBYTE(buf[0]) != 22) {
          return 0;
        }
        unsigned int v46 = bswap32(buf[1]) >> 16;
        buf[1] = v46;
        unsigned int v47 = bswap32(buf[2]);
        unsigned int v48 = HIWORD(v47);
        buf[2] = HIWORD(v47);
        if (HIWORD(v47) < 2u)
        {
          if (v46 < 0xD)
          {
            uint64_t v55 = *(void *)(a1 + 8);
            LODWORD(v53) = 16;
            goto LABEL_194;
          }
          unsigned __int16 v54 = v46 - 12;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 67109120;
            *(_DWORD *)&v105[2] = v54;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", (uint8_t *)v105, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 414, "HandleAssistCursorMessageV1", 7, 0, "extra amount %d", v54);
          unsigned int v52 = sub_10002F5EC(*(void *)(a1 + 8));
          unint64_t v53 = v54 + 16;
        }
        else
        {
          if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x22) {
            return 0xFFFFFFFFLL;
          }
          if (buf[1] < 0x1Eu) {
            goto LABEL_192;
          }
          int v49 = sub_10002F038(*(void *)(a1 + 8), 0x22u, (char *)buf);
          if (v49)
          {
            int v50 = v49;
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v105 = 67109120;
              *(_DWORD *)&v105[2] = v50;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NetBufferViewData:%d", (uint8_t *)v105, 8u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 444, "HandleAssistCursorMessageV2", 7, 0, "NetBufferViewData:%d", v50);
          }
          buf[1] = bswap32(buf[1]) >> 16;
          buf[2] = bswap32(buf[2]) >> 16;
          *(int8x16_t *)&buf[9] = vrev64q_s8(*(int8x16_t *)&buf[9]);
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 67109632;
            *(_DWORD *)&v105[2] = LOBYTE(buf[8]);
            uint8_t v105[4] = 2048;
            *(void *)&v105[5] = *(void *)&buf[9];
            v105[9] = 2048;
            *(void *)&v105[10] = *(void *)&buf[13];
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "orientation: %d, new coords: (%f, %f)", (uint8_t *)v105, 0x1Cu);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 453, "HandleAssistCursorMessageV2", 7, 0, "orientation: %d, new coords: (%f, %f)", LOBYTE(buf[8]), *(double *)&buf[9], *(double *)&buf[13]);
          if (buf[1] < 0x1Fu)
          {
LABEL_192:
            uint64_t v55 = *(void *)(a1 + 8);
            LODWORD(v53) = 34;
            goto LABEL_194;
          }
          unsigned __int16 v51 = buf[1] - 30;
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 67109120;
            *(_DWORD *)&v105[2] = v51;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", (uint8_t *)v105, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 460, "HandleAssistCursorMessageV2", 7, 0, "extra amount %d", v51);
          unsigned int v52 = sub_10002F5EC(*(void *)(a1 + 8));
          unint64_t v53 = v51 + 34;
        }
        if (v53 > v52) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v55 = *(void *)(a1 + 8);
LABEL_194:
        sub_10002EDA4(v55, v53);
        if ((sub_100033760() & 1) == 0)
        {
          uint64_t v56 = bswap32(*(unsigned int *)&buf[6]);
          double v57 = (double)(bswap32(buf[4]) >> 16);
          double v58 = (double)(bswap32(buf[5]) >> 16);
          if (v48 <= 1) {
            unsigned int v59 = 0;
          }
          else {
            unsigned int v59 = (unsigned __int8 *)&buf[8];
          }
          sub_100036038(v56, v59, v57, v58);
        }
        if (sub_10002F5EC(*(void *)(a1 + 8)) <= 0x10) {
          return 0;
        }
        continue;
      }
    case 24:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kRFBSystemInfoRequest", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 189, "HandleViewerCommand", 7, 0, "kRFBSystemInfoRequest");
      *(void *)&buf[3] = 0;
      *(void *)buf = 0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v105[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "handle system info request", (uint8_t *)v105, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 262, "HandleSystemInfoRequest", 7, 0, "handle system info request");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0xE) {
        return 0xFFFFFFFFLL;
      }
      sub_10002F038(*(void *)(a1 + 8), 0xEu, (char *)buf);
      buf[1] = bswap32(buf[1]) >> 16;
      buf[2] = bswap32(buf[2]) >> 16;
      buf[5] = bswap32(buf[5]) >> 16;
      buf[6] = bswap32(buf[6]) >> 16;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109376;
        *(_DWORD *)&v105[2] = buf[1];
        uint8_t v105[4] = 1024;
        *(_DWORD *)&v105[5] = buf[6];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "size %d %d", (uint8_t *)v105, 0xEu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 275, "HandleSystemInfoRequest", 7, 0, "size %d %d", buf[1], buf[6]);
      if ((unint64_t)buf[6] + 10 > buf[1])
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v105[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messge size is invalid", (uint8_t *)v105, 2u);
        }
        int v7 = "HandleSystemInfoRequest";
        unsigned int v8 = "messge size is invalid";
        int v9 = 278;
        goto LABEL_243;
      }
      if (buf[6] > 0x1000u)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v105[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "arguements size is too large", (uint8_t *)v105, 2u);
        }
        int v7 = "HandleSystemInfoRequest";
        unsigned int v8 = "arguements size is too large";
        int v9 = 284;
LABEL_243:
        char v22 = 7;
LABEL_94:
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, v9, v7, v22, 0, v8, v102);
        return 4294967294;
      }
      unsigned int v79 = sub_10002F5EC(*(void *)(a1 + 8));
      if ((unint64_t)buf[6] + 10 > v79) {
        return 0xFFFFFFFFLL;
      }
      sub_10002EDA4(*(void *)(a1 + 8), 0xEu);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[2] = buf[6] + 1;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "allocate %d", (uint8_t *)v105, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 297, "HandleSystemInfoRequest", 7, 0, "allocate %d", buf[6] + 1);
      unsigned int v80 = (char *)malloc_type_malloc(buf[6] + 1, 0x1827F073uLL);
      int v81 = sub_10002EA3C(*(void *)(a1 + 8), buf[6], v80);
      if (v81 << 16)
      {
        int v82 = (__int16)v81;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[2] = v82;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NetBufferRemoveData returned error: %d", (uint8_t *)v105, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 302, "HandleSystemInfoRequest", 7, 0, "NetBufferRemoveData returned error: %d", v82);
        free(v80);
        return 4294967294;
      }
      v80[buf[6]] = 0;
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 308, "HandleSystemInfoRequest", 7, 0, "ags = %s", v80);
      unint64_t v100 = buf[6] + 10;
      if (v100 < buf[1])
      {
        unsigned __int16 v101 = buf[1] - v100;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[2] = v101;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", (uint8_t *)v105, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 315, "HandleSystemInfoRequest", 7, 0, "extra amount %d", v101);
        sub_10002EDA4(*(void *)(a1 + 8), v101);
      }
      if (*(unsigned char *)(a1 + 2923)) {
        sub_100027E08(a1, (uint64_t)buf, v80);
      }
      free(v80);
      return 0;
    case 25:
      return sub_10002875C(a1);
    case 33:
      memset(v105, 0, 66);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleViewerInfoMessage", (uint8_t *)buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1135, "HandleViewerInfoMessage", 7, 0, "HandleViewerInfoMessage");
      if (sub_10002F5EC(*(void *)(a1 + 8)) < 0x42) {
        return 0xFFFFFFFFLL;
      }
      sub_10002F038(*(void *)(a1 + 8), 0x42u, (char *)v105);
      unsigned int v61 = bswap32(v105[1]) >> 16;
      v105[1] = v61;
      v105[2] = bswap32(v105[2]) >> 16;
      if (v61 < 0x3F)
      {
        uint64_t v65 = *(void *)(a1 + 8);
        unsigned int v64 = 66;
        goto LABEL_245;
      }
      unsigned __int16 v62 = v61 - 62;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[2] = v62;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "extra amount %d", (uint8_t *)buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1150, "HandleViewerInfoMessage", 7, 0, "extra amount %d", v62);
      unsigned int v63 = sub_10002F5EC(*(void *)(a1 + 8));
      unsigned int v64 = v62 + 66;
      if ((unint64_t)v62 + 66 <= v63)
      {
        uint64_t v65 = *(void *)(a1 + 8);
LABEL_245:
        sub_10002EDA4(v65, v64);
        if (v105[2] != 1)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[2] = 1;
            uint8_t buf[4] = 1024;
            *(_DWORD *)&buf[5] = v105[2];
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "message version %d %d ", (uint8_t *)buf, 0xEu);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1161, "HandleViewerInfoMessage", 7, 0, "message version %d %d ", 1, v105[2]);
        }
        *(int8x16_t *)(a1 + 2644) = vrev32q_s8(*(int8x16_t *)&v105[3]);
        *(int8x8_t *)(a1 + 2660) = vrev32_s8(*(int8x8_t *)&v105[11]);
        *(_DWORD *)(a1 + 2668) = bswap32(*(unsigned int *)&v105[15]);
        *(_OWORD *)(a1 + 2672) = *(_OWORD *)&v105[17];
        *(_OWORD *)(a1 + 2688) = *(_OWORD *)&v105[25];
        *(_DWORD *)(a1 + 2640) = 1;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v69 = *(_DWORD *)(a1 + 2644);
          int v70 = *(_DWORD *)(a1 + 2648);
          int v71 = *(_DWORD *)(a1 + 2652);
          int v72 = *(_DWORD *)(a1 + 2656);
          int v73 = *(_DWORD *)(a1 + 2660);
          int v74 = *(_DWORD *)(a1 + 2664);
          int v75 = *(_DWORD *)(a1 + 2668);
          *(_DWORD *)buf = 67110656;
          *(_DWORD *)&buf[2] = v69;
          uint8_t buf[4] = 1024;
          *(_DWORD *)&buf[5] = v70;
          buf[7] = 1024;
          *(_DWORD *)&buf[8] = v71;
          buf[10] = 1024;
          *(_DWORD *)&buf[11] = v72;
          buf[13] = 1024;
          *(_DWORD *)&buf[14] = v73;
          uint8_t buf[16] = 1024;
          *(_DWORD *)&buf[17] = v74;
          buf[19] = 1024;
          int v110 = v75;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "appID %d app version %d.%d.%d OS version %d.%d.%d", (uint8_t *)buf, 0x2Cu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1174, "HandleViewerInfoMessage", 7, 0, "appID %d app version %d.%d.%d OS version %d.%d.%d", *(_DWORD *)(a1 + 2644), *(_DWORD *)(a1 + 2648), *(_DWORD *)(a1 + 2652), *(_DWORD *)(a1 + 2656), *(_DWORD *)(a1 + 2660), *(_DWORD *)(a1 + 2664), *(_DWORD *)(a1 + 2668));
        bzero(buf, 0xA00uLL);
        __strlcpy_chk();
        for (unsigned int j = 0; j != 256; ++j)
        {
          if ((*((unsigned __int8 *)&v105[17] + (j >> 3)) >> (~(_BYTE)j & 7)))
          {
            snprintf(__str, 0xAuLL, " %d", j);
            __strlcat_chk();
          }
        }
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__str = 136315138;
          unsigned int v108 = buf;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)__str, 0xCu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ViewerMessages.c", 107, 1193, "HandleViewerInfoMessage", 7, 0, "%s");
        return 0;
      }
      return 0xFFFFFFFFLL;
    case 35:
      return sub_100028A98(a1, a2);
    default:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100036F88(&v104);
      }
      uint64_t v102 = v104;
      int v7 = "HandleViewerCommand";
      unsigned int v8 = "unknown command %d";
      int v9 = 203;
LABEL_93:
      char v22 = 3;
      goto LABEL_94;
  }
}

uint64_t sub_10002E618(int a1, int a2, dispatch_semaphore_t *a3)
{
  if (!a1)
  {
    if (sub_100035448())
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_10003709C(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDSemaphore.c", 87, 17, "RDCreateSemaphore", 3, 0, "RDCreateSemaphore requires maximumValue > 0");
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    if (sub_100035448())
    {
      BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v3) {
        sub_100037114(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDSemaphore.c", 87, 21, "RDCreateSemaphore", 3, 0, "RDCreateSemaphore requires initialValue == 0");
    return 0xFFFFFFFFLL;
  }
  if (!a3)
  {
    if (sub_100035448())
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_1000370D8(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDSemaphore.c", 87, 25, "RDCreateSemaphore", 3, 0, "RDCreateSemaphore requires semaphore != NULL");
    return 0xFFFFFFFFLL;
  }
  dispatch_semaphore_t v21 = dispatch_semaphore_create((a1 - 1));
  *a3 = v21;
  if (v21) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10002E740(NSObject *a1)
{
  if (a1)
  {
    dispatch_semaphore_signal(a1);
    dispatch_release(a1);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RDDeleteSemaphore called with NULL semaphore", v3, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDSemaphore.c", 87, 41, "RDDeleteSemaphore", 7, 0, "RDDeleteSemaphore called with NULL semaphore");
  }
  return 0;
}

uint64_t sub_10002E7F4(NSObject *a1)
{
  if (a1)
  {
    dispatch_semaphore_signal(a1);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RDSignalSemaphore called with NULL semaphore", v2, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/RDSemaphore.c", 87, 57, "RDSignalSemaphore", 7, 0, "RDSignalSemaphore called with NULL semaphore");
  }
  return 0;
}

intptr_t sub_10002E894(NSObject *a1, unsigned int a2)
{
  if (a2) {
    dispatch_time_t v3 = dispatch_time(0, 1000000 * a2);
  }
  else {
    dispatch_time_t v3 = -1;
  }

  return dispatch_semaphore_wait(a1, v3);
}

uint64_t sub_10002E8EC(size_t size, void *a2)
{
  int v3 = size;
  *a2 = 0;
  uint64_t v4 = malloc_type_malloc(size, 0xCD292003uLL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = malloc_type_calloc(1uLL, 0x38uLL, 0x10B00406AF97CF0uLL);
  if (!v6)
  {
    free(v5);
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  *(_DWORD *)uint64_t v6 = 1851946342;
  v6[2] = v5;
  id v8 = sub_100007FD4();
  *((void *)v7 + 5) = v8;
  if (!v8 || (uint64_t result = sub_10002E618(1, 0, (dispatch_semaphore_t *)v7 + 4), result))
  {
    sub_10002E9B0(v7);
    return 0xFFFFFFFFLL;
  }
  *((_DWORD *)v7 + 1) = 0;
  *((_DWORD *)v7 + 2) = 0;
  *((_DWORD *)v7 + 6) = v3;
  *a2 = v7;
  return result;
}

uint64_t sub_10002E9B0(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1851946342) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = (void *)*((void *)a1 + 5);
  if (v2)
  {
    [v2 lock];

    *((void *)a1 + 5) = 0;
  }
  int v3 = *((void *)a1 + 4);
  if (v3) {
    sub_10002E740(v3);
  }
  *(_DWORD *)a1 = 1851946282;
  free(*((void **)a1 + 2));
  free(a1);
  return 0;
}

uint64_t sub_10002EA3C(uint64_t a1, unsigned int a2, char *a3)
{
  if (!a1 || *(_DWORD *)a1 != 1851946342) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = [*(id *)(a1 + 40) lock];
  if (v6)
  {
    unsigned int v7 = v6;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 129, "NetBufferRemoveData", 7, 0, "*****net buff enter cr err %d", v7);
  }
  unsigned int v9 = *(_DWORD *)(a1 + 4);
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  if (v9 >= v8)
  {
    if (v9 - v8 >= a2)
    {
      memcpy(a3, (const void *)(*(void *)(a1 + 16) + v8), a2);
      unsigned int v12 = *(_DWORD *)(a1 + 8) + a2;
      goto LABEL_28;
    }
  }
  else
  {
    unsigned int v10 = *(_DWORD *)(a1 + 24) - v8;
    if (v10 + v9 >= a2)
    {
      BOOL v11 = (const void *)(*(void *)(a1 + 16) + v8);
      unsigned int v12 = a2 - v10;
      if (a2 <= v10)
      {
        memcpy(a3, v11, a2);
        if (*(_DWORD *)(a1 + 8) + a2 == *(_DWORD *)(a1 + 24)) {
          unsigned int v12 = 0;
        }
        else {
          unsigned int v12 = *(_DWORD *)(a1 + 8) + a2;
        }
      }
      else
      {
        memcpy(a3, v11, (*(_DWORD *)(a1 + 24) - v8));
        memcpy(&a3[v10], *(const void **)(a1 + 16), a2 - v10);
      }
LABEL_28:
      *(_DWORD *)(a1 + 8) = v12;
      uint64_t result = (uint64_t)[*(id *)(a1 + 40) unlock];
      if (result)
      {
        unsigned int v16 = result;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 170, "NetBufferRemoveData", 7, 0, "*****net buff enter cr err %d", v16);
        return 0;
      }
      return result;
    }
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bail NetBufferRemoveData", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 177, "NetBufferRemoveData", 7, 0, "bail NetBufferRemoveData");
  unsigned int v14 = [*(id *)(a1 + 40) unlock];
  if (v14)
  {
    unsigned int v15 = v14;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 180, "NetBufferRemoveData", 7, 0, "*****net buff enter cr err %d", v15);
  }
  return 4294967294;
}

uint64_t sub_10002EDA4(uint64_t a1, unsigned int a2)
{
  if (!a1 || *(_DWORD *)a1 != 1851946342) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v4 = [*(id *)(a1 + 40) lock];
  if (v4)
  {
    unsigned int v5 = v4;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 210, "NetBufferSkipData", 7, 0, "*****net buff enter cr err %d", v5);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 4);
  unsigned int v6 = *(_DWORD *)(a1 + 8);
  if (v7 >= v6)
  {
    if (v7 - v6 >= a2)
    {
      unsigned int v10 = v6 + a2;
LABEL_25:
      *(_DWORD *)(a1 + 8) = v10;
      uint64_t result = (uint64_t)[*(id *)(a1 + 40) unlock];
      if (result)
      {
        unsigned int v14 = result;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 242, "NetBufferSkipData", 7, 0, "*****net buff enter cr err %d", v14);
        return 0;
      }
      return result;
    }
  }
  else
  {
    int v8 = *(_DWORD *)(a1 + 24);
    unsigned int v9 = v8 - v6;
    if (v8 - v6 + v7 >= a2)
    {
      unsigned int v10 = v6 + a2;
      if (v10 == v8) {
        unsigned int v10 = 0;
      }
      if (a2 > v9) {
        unsigned int v10 = a2 - v9;
      }
      goto LABEL_25;
    }
  }
  unsigned int v12 = [*(id *)(a1 + 40) unlock];
  if (v12)
  {
    unsigned int v13 = v12;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 248, "NetBufferSkipData", 7, 0, "*****net buff enter cr err %d", v13);
  }
  return 4294967294;
}

uint64_t sub_10002F038(uint64_t a1, unsigned int a2, char *a3)
{
  if (!a1 || *(_DWORD *)a1 != 1851946342) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = [*(id *)(a1 + 40) lock];
  if (v6)
  {
    unsigned int v7 = v6;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 277, "NetBufferViewData", 7, 0, "*****net buff enter cr err %d", v7);
  }
  unsigned int v9 = *(_DWORD *)(a1 + 4);
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  if (v9 >= v8)
  {
    if (v9 - v8 >= a2)
    {
      BOOL v11 = (const void *)(*(void *)(a1 + 16) + v8);
      goto LABEL_22;
    }
  }
  else
  {
    unsigned int v10 = *(_DWORD *)(a1 + 24) - v8;
    if (v10 + v9 >= a2)
    {
      BOOL v11 = (const void *)(*(void *)(a1 + 16) + v8);
      if (a2 > v10)
      {
        memcpy(a3, v11, (*(_DWORD *)(a1 + 24) - v8));
        unsigned int v12 = &a3[v10];
        BOOL v11 = *(const void **)(a1 + 16);
        size_t v13 = a2 - v10;
        goto LABEL_23;
      }
LABEL_22:
      size_t v13 = a2;
      unsigned int v12 = a3;
LABEL_23:
      memcpy(v12, v11, v13);
      uint64_t result = (uint64_t)[*(id *)(a1 + 40) unlock];
      if (result)
      {
        unsigned int v17 = result;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 308, "NetBufferViewData", 7, 0, "*****net buff enter cr err %d", v17);
        return 0;
      }
      return result;
    }
  }
  unsigned int v15 = [*(id *)(a1 + 40) unlock];
  if (v15)
  {
    unsigned int v16 = v15;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 314, "NetBufferViewData", 7, 0, "*****net buff enter cr err %d", v16);
  }
  return 4294967294;
}

uint64_t sub_10002F2F8(uint64_t a1, unsigned int a2, char *a3)
{
  if (!a1 || *(_DWORD *)a1 != 1851946342) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = [*(id *)(a1 + 40) lock];
  if (v6)
  {
    unsigned int v7 = v6;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 346, "NetBufferAddData", 7, 0, "*****net buff enter cr err %d", v7);
  }
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  unsigned int v9 = *(_DWORD *)(a1 + 8);
  if (v9 <= v8)
  {
    unsigned int v12 = *(_DWORD *)(a1 + 24) - v8;
    if (v12 + v9 > a2)
    {
      size_t v13 = (void *)(*(void *)(a1 + 16) + v8);
      unsigned int v10 = a2 - v12;
      if (a2 <= v12)
      {
        memcpy(v13, a3, a2);
        if (*(_DWORD *)(a1 + 4) + a2 == *(_DWORD *)(a1 + 24)) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = *(_DWORD *)(a1 + 4) + a2;
        }
      }
      else
      {
        memcpy(v13, a3, (*(_DWORD *)(a1 + 24) - v8));
        memcpy(*(void **)(a1 + 16), &a3[v12], a2 - v12);
      }
LABEL_25:
      *(_DWORD *)(a1 + 4) = v10;
      uint64_t result = (uint64_t)[*(id *)(a1 + 40) unlock];
      if (result)
      {
        unsigned int v16 = result;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 385, "NetBufferAddData", 7, 0, "*****net buff enter cr err %d", v16);
        return 0;
      }
      return result;
    }
  }
  else if (v9 - v8 > a2)
  {
    memcpy((void *)(*(void *)(a1 + 16) + v8), a3, a2);
    unsigned int v10 = *(_DWORD *)(a1 + 4) + a2;
    goto LABEL_25;
  }
  unsigned int v14 = [*(id *)(a1 + 40) unlock];
  if (v14)
  {
    unsigned int v15 = v14;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 392, "NetBufferAddData", 7, 0, "*****net buff enter cr err %d", v15);
  }
  return 4294967294;
}

uint64_t sub_10002F5EC(uint64_t a1)
{
  if (!a1 || *(_DWORD *)a1 != 1851946342) {
    return 0;
  }
  unsigned int v2 = [*(id *)(a1 + 40) lock];
  if (v2)
  {
    unsigned int v3 = v2;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 491, "NetBufferAvailableData", 7, 0, "*****net buff enter cr err %d", v3);
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4);
  unsigned int v5 = *(_DWORD *)(a1 + 8);
  uint64_t v6 = v4 - v5;
  if (v4 < v5) {
    uint64_t v6 = (v6 + *(_DWORD *)(a1 + 24));
  }
  unsigned int v7 = [*(id *)(a1 + 40) unlock];
  if (v7)
  {
    unsigned int v8 = v7;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****net buff enter cr err %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/RFBCommon/NetBuffer.c", 88, 500, "NetBufferAvailableData", 7, 0, "*****net buff enter cr err %d", v8);
  }
  return v6;
}

_DWORD *sub_10002F7A0(_DWORD *result)
{
  if (result)
  {
    if (*result == 1851946342)
    {
      int v1 = result[6];
      return (_DWORD *)(v1 + ~sub_10002F5EC((uint64_t)result));
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100033224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_100033254(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    id v7 = [a3 description];
    unsigned int v8 = (const char *)[v7 UTF8String];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get the policy for Mail %s", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 767, "MailUseCellularData_block_invoke", 7, 0, "Failed to get the policy for Mail %s", v8);
  }
  else if ([v5 count])
  {
    unsigned int v9 = [v6 allObjects];
    unsigned int v10 = [v9 objectAtIndexedSubscript:0];

    unsigned int v11 = off_10005C5A0;
    unsigned int v12 = [v10 bundleId];
    LODWORD(v11) = [(__CFString *)v11 isEqualToString:v12];

    if (v11 && ![v10 cellular]) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000333F8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = [a3 description];
    id v5 = (const char *)[v4 UTF8String];

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get the FMD state error = %s", buf, 0xCu);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 737, "FindMyDeviceEnabled_block_invoke", 7, 0, "Failed to get the FMD state error = %s", v5);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100033514(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFTypeRef sub_10003353C()
{
  mach_port_t mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort)) {
    return 0;
  }
  io_registry_entry_t v1 = IORegistryEntryFromPath(mainPort, "IOService:/");
  if (!v1) {
    return 0;
  }
  io_object_t v2 = v1;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"IOPlatformSerialNumber", kCFAllocatorDefault, 0);
  IOObjectRelease(v2);
  return CFProperty;
}

uint64_t sub_1000335C8(uint64_t *a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t result = mach_absolute_time();
  *a1 = result * info.numer / info.denom / 0x3E8;
  return result;
}

unint64_t sub_10003362C()
{
  uint64_t v0 = mach_absolute_time();
  return (((2161727822u * (unint64_t)v0) >> 32) + 2161727822 * HIDWORD(v0)) >> 23;
}

uint64_t sub_100033664(int a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v4 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set pause flag to %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/Pause.c", 74, 17, "Pause_SetFlag", 7, 0, "set pause flag to %d", a1);
  _os_nospin_lock_lock();
  byte_10005C938 = a1;
  return _os_nospin_lock_unlock();
}

uint64_t sub_100033760()
{
  _os_nospin_lock_lock();
  uint64_t v0 = byte_10005C938;
  _os_nospin_lock_unlock();
  return v0;
}

void sub_1000337F4(id a1)
{
  qword_10005C948 = objc_alloc_init(SSAnnotationRenderer);

  _objc_release_x1();
}

intptr_t sub_100033A68(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mainScreen init", v4, 2u);
  }
  io_object_t v2 = +[UIScreen mainScreen];
  [*(id *)(a1 + 32) setMainScreen:v2];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100033DA0(id a1, NSDictionary *a2, NSError *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSError *)a3 description];
    int v5 = 136315138;
    id v6 = [v4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sent message  error %s", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100034908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034928(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v1 = 1;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), (unsigned int *)&v1, 0);
  }
}

void sub_10003494C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queuedMessage];

  if (v7)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100034AB4;
    v11[4] = sub_100034AC4;
    unsigned int v8 = [*(id *)(a1 + 32) queuedMessage];
    id v12 = [v8 copy];

    [*(id *)(a1 + 32) setQueuedMessage:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100034ACC;
    v10[3] = &unk_100054EA0;
    v10[4] = *(void *)(a1 + 32);
    v10[5] = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    _Block_object_dispose(v11, 8);
  }
  int v9 = 1;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), (unsigned int *)&v9, 0);
}

void sub_100034A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034AB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034AC4(uint64_t a1)
{
}

void sub_100034ACC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uiClient];
  [v2 sendAsynchronousMessage:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withIdentifier:1 targetAccessQueue:0 completion:0];
}

uint64_t sub_1000353B0(unsigned int a1)
{
  if (!qword_10005C950)
  {
    uint64_t v2 = _os_nospin_lock_lock();
    if (!qword_10005C950) {
      sub_100035EB8(v2);
    }
    _os_nospin_lock_unlock();
  }
  pthread_mutex_lock(&stru_10005C608);
  uint64_t v3 = qword_10005C950;
  if (qword_10005C950)
  {
    int v4 = a1 >= 7 ? 7 : a1;
    *(_DWORD *)(qword_10005C950 + 8) = v4;
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5) {
      sub_100036464(v5, v4);
    }
  }

  return pthread_mutex_unlock(&stru_10005C608);
}

BOOL sub_100035448()
{
  return !qword_10005C950 || !*(unsigned char *)(qword_10005C950 + 12) || byte_10005C988 == 0;
}

uint64_t sub_100035478(uint64_t result)
{
  char v1 = result;
  uint64_t v2 = qword_10005C950;
  if (qword_10005C950) {
    goto LABEL_5;
  }
  uint64_t v3 = _os_nospin_lock_lock();
  if (!qword_10005C950) {
    sub_100035EB8(v3);
  }
  uint64_t result = _os_nospin_lock_unlock();
  uint64_t v2 = qword_10005C950;
  if (qword_10005C950) {
LABEL_5:
  }
    *(unsigned char *)(v2 + 12) = v1;
  return result;
}

void sub_1000354D4(CFStringRef *a1, CFStringRef *a2)
{
  uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKey:@"ProductBuildVersion"];
    if (v7) {
      *a2 = CFStringCreateCopy(kCFAllocatorDefault, v7);
    }
    unsigned int v8 = [v6 objectForKey:@"ProductVersion"];
    if (v8) {
      *a1 = CFStringCreateCopy(kCFAllocatorDefault, v8);
    }
  }
}

__CFBundle *sub_1000355B0()
{
  uint64_t result = CFBundleGetMainBundle();
  if (result)
  {
    uint64_t result = CFBundleGetInfoDictionary(result);
    if (result)
    {
      CFDictionaryRef v1 = result;
      value = 0;
      unsigned int v11 = 0;
      CFStringRef v8 = 0;
      CFStringRef v9 = 0;
      CFDictionaryGetValueIfPresent(result, @"CFBundleVersion", (const void **)&value);
      CFDictionaryGetValueIfPresent(v1, @"CFBundleShortVersionString", (const void **)&v11);
      sub_1000354D4(&v9, &v8);
      CFStringRef v2 = v8;
      CFStringRef v3 = v9;
      CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"START LOGGING: OSVersion=\"%@\" OSBuildVersion=\"%@\" CFBundleVersion=\"%@\" CFBundleShortVersionString=\"%@\"", v9, v8, value, v11);
      CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
      if (qword_10005C950) {
        unsigned int v6 = *(_DWORD *)(qword_10005C950 + 8);
      }
      else {
        unsigned int v6 = 5;
      }
      sub_1000353B0(6u);
      id v7 = "START LOGGING: (error, no log string)";
      if (CStringPtr) {
        id v7 = CStringPtr;
      }
      sub_1000356F4((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/Log.m", 79, 278, "ardlog_log_version_info", 6, 0, "%s", v7);
      if (v4) {
        CFRelease(v4);
      }
      if (v3) {
        CFRelease(v3);
      }
      if (v2) {
        CFRelease(v2);
      }
      return (__CFBundle *)sub_1000353B0(v6);
    }
  }
  return result;
}

void sub_1000356F4(unint64_t a1, int a2, int a3, const char *a4, char a5, const char *a6, char *a7, ...)
{
  va_start(va, a7);
  uint64_t v14 = qword_10005C950;
  if (!qword_10005C950)
  {
    uint64_t v15 = _os_nospin_lock_lock();
    if (!qword_10005C950) {
      sub_100035EB8(v15);
    }
    _os_nospin_lock_unlock();
    uint64_t v14 = qword_10005C950;
  }
  if (a6) {
    unsigned int v16 = a6;
  }
  else {
    unsigned int v16 = "General";
  }
  sub_100035A2C(v14, a5 & 7, a1, a2, a3, 1, a4, v16, a7, va);
}

__CFBundle *sub_1000357B8(const char *a1)
{
  if (!qword_10005C950)
  {
    uint64_t v2 = _os_nospin_lock_lock();
    if (!qword_10005C950) {
      sub_100035EB8(v2);
    }
    _os_nospin_lock_unlock();
  }
  pthread_mutex_lock(&stru_10005C608);
  if (qword_10005C950 && !*(void *)(qword_10005C950 + 16))
  {
    CFStringRef v3 = sub_10003633C(a1);
    uint64_t v4 = qword_10005C950;
    *(void *)(qword_10005C950 + 16) = v3;
    if (v3)
    {
      sub_100036464((uint64_t)v3, *(_DWORD *)(v4 + 8));
      *(void *)(qword_10005C950 + 24) = strdup(a1);
    }
    else
    {
      syslog(3, "ardlog_open_logfile - LFOpen failed on file '%s'", a1);
    }
  }
  pthread_mutex_unlock(&stru_10005C608);

  return sub_1000355B0();
}

void sub_10003588C(unint64_t a1, int a2, int a3, const char *a4, char a5, const char *a6, char *a7, ...)
{
  va_start(va, a7);
  uint64_t v14 = qword_10005C950;
  if (!qword_10005C950)
  {
    _os_nospin_lock_lock();
    if (!qword_10005C950) {
      sub_100035EB8();
    }
    _os_nospin_lock_unlock();
    uint64_t v14 = qword_10005C950;
  }
  if (a6) {
    uint64_t v15 = a6;
  }
  else {
    uint64_t v15 = "General";
  }
  sub_100035A2C(v14, a5 & 7, a1, a2, a3, 0, a4, v15, a7, va);
}

void sub_100035950(unint64_t a1, int a2, int a3, const char *a4, int a5, char *a6, ...)
{
  va_start(va, a6);
  if (!qword_10005C950)
  {
    _os_nospin_lock_lock();
    if (!qword_10005C950) {
      sub_100035EB8();
    }
    _os_nospin_lock_unlock();
  }
  if ((a5 - 8) > 0xA7) {
    id v12 = "General";
  }
  else {
    id v12 = *(char **)((char *)&off_100054F28 + ((a5 - 8) & 0xFFFFFFF8));
  }
  sub_100035A2C(qword_10005C950, a5 & 7, a1, a2, a3, 1, a4, v12, a6, va);
}

void sub_100035A2C(uint64_t a1, unsigned int a2, unint64_t a3, uint64_t a4, int a5, int a6, const char *a7, const char *a8, char *a9, va_list ap)
{
  uint64_t v13 = a1;
  if (a1 || (uint64_t v13 = qword_10005C950) != 0)
  {
    if (*(_DWORD *)(v13 + 8) >= a2)
    {
      uint64_t v26 = 0;
      if (*(unsigned char *)(v13 + 12))
      {
        unint64_t v14 = a4 + a3 - 1;
        uint64_t v15 = (const char *)v14;
        do
        {
          int v16 = *(unsigned __int8 *)v15--;
          BOOL v17 = v16 != 47 && v14 >= a3;
          unint64_t v14 = (unint64_t)v15;
        }
        while (v17);
        asprintf(&v26, "%s:%d:%s: %s", v15 + 2, a5, a7, a9);
      }
      if (*(void *)(v13 + 16))
      {
        va_list v25 = ap;
        if (v26)
        {
          uint64_t v24 = 0;
          asprintf(&v24, "%-14s %s", a8, v26);
          if (v24)
          {
            sub_10003646C(*(void *)(v13 + 16), a2, v24, v25);
            free(v24);
          }
        }
        else
        {
          sub_10003646C(*(void *)(v13 + 16), a2, a9, v25);
        }
      }
      if (*(unsigned char *)(v13 + 48))
      {
        uint64_t v24 = 0;
        va_list v25 = ap;
        vasprintf(&v24, a9, ap);
        if (v24)
        {
          unsigned int v18 = +[NSString stringWithUTF8String:*(void *)(v13 + 32)];
          unsigned int v19 = +[NSString stringWithUTF8String:*(void *)(v13 + 40)];
          __int16 v20 = +[NSString stringWithUTF8String:a8];
          DLCLogWithLevel();

          free(v24);
        }
      }
      if (a2 <= 5 && a6)
      {
        if (pthread_mutex_lock(&stru_10005C608))
        {
          dispatch_semaphore_t v21 = v26;
          if (!v26) {
            dispatch_semaphore_t v21 = a9;
          }
          vsyslog(a2, v21, ap);
        }
        else
        {
          BOOL v22 = asl_new(0);
          asl_set(v22, "Facility", a8);
          uint64_t v23 = v26;
          if (!v26) {
            uint64_t v23 = a9;
          }
          asl_vlog(*(asl_object_t *)v13, v22, a2, v23, ap);
          pthread_mutex_unlock(&stru_10005C608);
          asl_free(v22);
        }
      }
      if (v26) {
        free(v26);
      }
    }
  }
  else
  {
    syslog(3, "ardlog - ardlog_initialize needs to be called");
    vsyslog(a2, a9, ap);
  }
}

void sub_100035CB8(uint64_t a1, int a2, int a3, const char *a4, int a5, const char *a6, unsigned __int8 *a7, unint64_t a8)
{
  unsigned int v19 = a7;
  *(void *)__int16 v20 = a1;
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  int v25 = a5;
  int v21 = a2;
  int v22 = a3;
  uint64_t v9 = qword_10005C950;
  if (qword_10005C950) {
    goto LABEL_22;
  }
  _os_nospin_lock_lock();
  if (!qword_10005C950) {
    sub_100035EB8();
  }
  _os_nospin_lock_unlock();
  uint64_t v9 = qword_10005C950;
  if (qword_10005C950)
  {
LABEL_22:
    if (*(_DWORD *)(v9 + 8) >= (v25 & 7u))
    {
      sub_100035950(*(unint64_t *)v20, v21, v22, v23, v25, " %s byte count: %zu", v24, a8);
      if (a8)
      {
        qmemcpy(v18, " BB CC DD EE FF 5 66 77 88 99 AA00 11 22 33 44 5abcdefghijklmnop", sizeof(v18));
        unsigned int v10 = v19;
        do
        {
          uint64_t v11 = 0;
          char v31 = 0;
          long long v30 = v18[3];
          *(_OWORD *)uint64_t v26 = v18[2];
          long long v27 = v18[1];
          long long v28 = v18[0];
          if (a8 >= 0x10) {
            uint64_t v12 = 16;
          }
          else {
            uint64_t v12 = a8;
          }
          uint64_t v13 = v26;
          char v29 = 0;
          do
          {
            sprintf(v13, "%.2X ", v10[v11]);
            uint64_t v14 = v10[v11];
            if ((v14 & 0x80) != 0) {
              __uint32_t v15 = __maskrune(v10[v11], 0x40000uLL);
            }
            else {
              __uint32_t v15 = _DefaultRuneLocale.__runetype[v14] & 0x40000;
            }
            if (v15) {
              char v16 = v14;
            }
            else {
              char v16 = 46;
            }
            BOOL v17 = (char *)&v30 + v11;
            char *v17 = v16;
            v17[1] = 0;
            ++v11;
            v13 += 3;
          }
          while (v12 != v11);
          a8 -= v12;
          sub_100035950(*(unint64_t *)v20, v21, v22, v23, v25, " %s %p:  %-48s | %-16s |", v24, v19, v26, (const char *)&v30);
          v10 += v11;
        }
        while (a8);
      }
    }
  }
}

void sub_100035EB8()
{
  byte_10005C988 = os_variant_has_internal_diagnostics();
  uint64_t v0 = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040E947A4D9uLL);
  if (v0)
  {
    CFDictionaryRef v1 = asl_open(0, 0, 0);
    *(void *)uint64_t v0 = v1;
    asl_set_filter(v1, 255);
    v0[2] = 5;
    *((unsigned char *)v0 + 12) = 0;
  }
  else
  {
    if (!qword_10005C950 || (*(unsigned char *)(qword_10005C950 + 12) ? (BOOL v2 = byte_10005C988 == 0) : (BOOL v2 = 1), v2))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100037558();
      }
    }
    sub_10003588C((int)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/common/Log.m", 79, 106, (int)"ardlog_open", 3, 0, "Couldn't allocate memory for ARD log.");
  }
  qword_10005C950 = (uint64_t)v0;
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
    if (Identifier)
    {
      if (CFEqual(Identifier, @"com.apple.iChat"))
      {
        CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(@"ARDCollectLogs", @"com.apple.RemoteManagement", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
        if (v5 == kCFBooleanTrue)
        {
          sub_1000357B8("/private/tmp/iChat-ScreenSharing.log");
          sub_1000353B0(7u);
          sub_100035478(1);
        }
        if (v5) {
          CFRelease(v5);
        }
      }
    }
  }
}

id sub_100036038(uint64_t a1, unsigned __int8 *a2, double a3, double a4)
{
  if (qword_10005C968 != -1) {
    dispatch_once(&qword_10005C968, &stru_100054FD0);
  }
  BOOL v8 = sub_100035448();
  if (a3 == 0.0 && a4 == 0.0 && !a1)
  {
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ssAnnotationRenderer hide", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/SSAssistanceHelper.m", 111, 26, "ProcessAssistCursorMessage", 7, 0, "ssAnnotationRenderer hide");
    uint64_t v9 = (void *)qword_10005C960;
    double v10 = 0.0;
    double v11 = 0.0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__uint32_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ssAnnotationRenderer handleSafeViewAnnotation", v15, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/SSAssistanceHelper.m", 111, 31, "ProcessAssistCursorMessage", 7, 0, "ssAnnotationRenderer handleSafeViewAnnotation");
    uint64_t v9 = (void *)qword_10005C960;
    double v10 = *(double *)(a2 + 2);
    double v11 = *(double *)(a2 + 10);
    uint64_t v13 = *a2;
    uint64_t v12 = a1;
  }
  return objc_msgSend(v9, "handleSafeViewAnnotation:flags:orientation:", v12, v13, v10, v11);
}

void sub_1000361CC(id a1)
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to init ssAnnotationRenderer", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/SSAssistanceHelper.m", 111, 18, "ProcessAssistCursorMessage_block_invoke", 7, 0, "going to init ssAnnotationRenderer");
  uint64_t v1 = +[SSAnnotationRenderer sharedRenderer];
  BOOL v2 = (void *)qword_10005C960;
  qword_10005C960 = v1;

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v4 = qword_10005C960;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ssAnnotationRenderer inited %p", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/SSAssistanceHelper.m", 111, 21, "ProcessAssistCursorMessage_block_invoke", 7, 0, "ssAnnotationRenderer inited %p", (const void *)qword_10005C960);
}

char *sub_10003633C(const char *a1)
{
  int v2 = open(a1, 777, 438);
  if (v2 == -1)
  {
    int v6 = *__error();
    id v7 = __error();
    BOOL v8 = strerror(*v7);
    syslog(3, "LFOpen failed - Couldn't open '%s'. %d: %s", a1, v6, v8);
    return 0;
  }
  else
  {
    int v3 = v2;
    int v4 = fcntl(v2, 1, 0);
    int v5 = v4;
    if (v4 < 0)
    {
      double v10 = __error();
      double v11 = strerror(*v10);
      syslog(3, "Set_FD_CLOEXEC failed to read current file descriptor flags. %d %s", v5, v11);
    }
    else
    {
      fcntl(v3, 2, v4 | 1u);
    }
    fchmod(v3, 0x1B6u);
    uint64_t v9 = (char *)malloc_type_calloc(1uLL, 0x68uLL, 0x1060040AB68CB19uLL);
    pthread_mutex_init((pthread_mutex_t *)(v9 + 16), 0);
    *((_DWORD *)v9 + 2) = v3;
    *(void *)uint64_t v9 = fdopen(v3, "a");
    *((_DWORD *)v9 + 20) = 5;
    *((void *)v9 + 12) = CFTimeZoneCopySystem();
  }
  return v9;
}

uint64_t sub_100036464(uint64_t result, int a2)
{
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t sub_10003646C(uint64_t result, unsigned int a2, const char *a3, va_list a4)
{
  if (*(_DWORD *)(result + 80) >= (signed int)a2)
  {
    uint64_t v7 = result;
    BOOL v8 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    if (!*(unsigned char *)(v7 + 84))
    {
      *(unsigned char *)(v7 + 84) = 1;
      *(_DWORD *)(v7 + 88) = getpid();
    }
    if (a2 <= 7) {
      uint64_t v9 = (&off_100054FF0)[a2];
    }
    else {
      uint64_t v9 = "UNKNOWN";
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(Current, (CFTimeZoneRef)*(void *)(v7 + 96));
    snprintf(__str, 0x64uLL, "%04d-%02d-%02d %02d:%02d:%07.4f", GregorianDate.year, (int)(*(void *)&GregorianDate.year >> 8) >> 24, (int)(*(void *)&GregorianDate.year >> 16) >> 24, (int)(*(void *)&GregorianDate.year >> 24) >> 24, *(int *)&GregorianDate.month >> 24, GregorianDate.second);
    Main = CFRunLoopGetMain();
    if (Main == CFRunLoopGetCurrent())
    {
      uint64_t v14 = "      Main      ";
    }
    else
    {
      pthread_t v13 = pthread_self();
      uint64_t v14 = v88;
      snprintf(v88, 0x32uLL, "%016zX", (size_t)v13);
    }
    if (flock(*(_DWORD *)(v7 + 8), 2) == -1)
    {
      int v15 = *__error();
      char v16 = __error();
      BOOL v17 = strerror(*v16);
      syslog(3, "LFLogv - flock (lock) failed with %d. %s", v15, v17);
    }
    unsigned int v18 = *(FILE **)v7;
    if (sub_100035448())
    {
      fprintf(v18, "%s %d[%s] %s ", __str, *(_DWORD *)(v7 + 88), v14, v9);
      vfprintf(v18, a3, a4);
      fputc(10, v18);
      fflush(v18);
    }
    else
    {
      long long v87 = 0u;
      long long v86 = 0u;
      long long v85 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      *(_OWORD *)uint64_t v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      *(_OWORD *)uint64_t v24 = 0u;
      fprintf(v18, "%s %d", __str, *(_DWORD *)(v7 + 88));
      snprintf(v56, 0x200uLL, "[%s] %s ", v14, v9);
      vsnprintf(v24, 0x200uLL, a3, a4);
      __strlcat_chk();
      fputs(v56, v18);
      fputc(10, v18);
      fflush(v18);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = v56;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      }
    }
    if (flock(*(_DWORD *)(v7 + 8), 8) == -1)
    {
      int v19 = *__error();
      __int16 v20 = __error();
      int v21 = strerror(*v20);
      syslog(3, "LFLogv - flock (unlock) failed with %d. %s", v19, v21);
    }
    return pthread_mutex_unlock(v8);
  }
  return result;
}

void sub_1000367EC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error from pthread_create: %d", (uint8_t *)v1, 8u);
}

void sub_10003686C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "FATAL ERROR - unable to open /dev/random", v0, 2u);
}

void sub_1000368B4(uint64_t a1)
{
  int v2 = *__error();
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "FATAL ERROR - read returned %zd  errno %d", (uint8_t *)&v3, 0x12u);
}

void sub_100036954(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "reject touch with index %ld", (uint8_t *)&v1, 0xCu);
}

void sub_1000369D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036C2C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "send info not set", v0, 2u);
}

void sub_100036C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036CE8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "udp buffer not set", v0, 2u);
}

void sub_100036D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036E1C(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "sender is too far ahead %u am at %u", (uint8_t *)v3, 0xEu);
}

void sub_100036EAC(unsigned __int16 a1)
{
  v1[0] = 67109376;
  v1[1] = a1;
  __int16 v2 = 2048;
  uint64_t v3 = 44;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "status reply too small %d %zu", (uint8_t *)v1, 0x12u);
}

void sub_100036F40()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "status reply, no sender info set", v0, 2u);
}

void sub_100036F88(unsigned __int8 *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unknown command %d", (uint8_t *)v2, 8u);
}

void sub_10003700C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "key event received - close conenction", v0, 2u);
}

void sub_100037054()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "pointer event received - close conenction", v0, 2u);
}

void sub_10003709C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000370D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A5BC((void *)&_mh_execute_header, &_os_log_default, a3, "RDCreateSemaphore requires semaphore != NULL", a5, a6, a7, a8, 0);
}

void sub_100037114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A5BC((void *)&_mh_execute_header, &_os_log_default, a3, "RDCreateSemaphore requires initialValue == 0", a5, a6, a7, a8, 0);
}

void sub_100037150(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100033530();
  sub_100033514((void *)&_mh_execute_header, &_os_log_default, v2, "error getting the active subscription %s", v3, v4, v5, v6, v7);
}

void sub_1000371E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100037220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003725C(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100033530();
  sub_100033514((void *)&_mh_execute_header, &_os_log_default, v2, "isMultiSim: error getting activeContexts, error = %s", v3, v4, v5, v6, v7);
}

void sub_1000372F0(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100033530();
  sub_100033514((void *)&_mh_execute_header, &_os_log_default, v2, "SelectedPlanDataRoamingEnabled: failed to get the roaming enabled value, error = %s", v3, v4, v5, v6, v7);
}

void sub_100037384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000373C0(int a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_CTServerConnectionGetCellularDataIsEnabled returns %d:%d", (uint8_t *)v2, 0xEu);
}

void sub_10003744C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A5BC((void *)&_mh_execute_header, &_os_log_default, a3, "failed to create an OTClique, unable to return keychain sync info", a5, a6, a7, a8, 0);
}

void sub_100037488(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100033530();
  sub_100033514((void *)&_mh_execute_header, &_os_log_default, v2, "fetchUserControllableViewsSyncingEnabled failed %s", v3, v4, v5, v6, v7);
}

void sub_10003751C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100037558()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't allocate memory for ARD log.", v0, 2u);
}

uint64_t AX_CGPathCopyDataRepresentation()
{
  return _AX_CGPathCopyDataRepresentation();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreate(op, alg, options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  CFGregorianDate GregorianDate = _CFAbsoluteTimeGetGregorianDate(at, tz);
  double second = GregorianDate.second;
  uint64_t v2 = *(void *)&GregorianDate.year;
  result.double second = second;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
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

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return _CFTimeZoneCopySystem();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
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

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t CKMadridSendAsSMSEnabled()
{
  return _CKMadridSendAsSMSEnabled();
}

uint64_t CKMessageUnknownFilteringEnabled()
{
  return _CKMessageUnknownFilteringEnabled();
}

uint64_t DLCLogWithLevel()
{
  return _DLCLogWithLevel();
}

uint64_t DNDResolvedInterruptionBehaviorSetting()
{
  return _DNDResolvedInterruptionBehaviorSetting();
}

uint64_t GSInitialize()
{
  return _GSInitialize();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return _IDSCopyIDForEmailAddress();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return _IDSCopyIDForPhoneNumber();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return _IMSharedHelperDeviceHasMultipleSubscriptions();
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallback()
{
  return _IOHIDEventSystemClientRegisterEventFilterCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return _IOHIDEventSystemClientScheduleWithRunLoop();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterCallback()
{
  return _IOHIDEventSystemClientUnregisterEventFilterCallback();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return _IOHIDEventSystemClientUnscheduleWithRunLoop();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

uint64_t SBSAcquireWallpaperAnimationSuspensionAssertion()
{
  return _SBSAcquireWallpaperAnimationSuspensionAssertion();
}

uint64_t SBSUIActivateRemoteAlertWithLifecycleNotifications()
{
  return _SBSUIActivateRemoteAlertWithLifecycleNotifications();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return _SecPolicyCreateAppleSSLPinned();
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return _SecPolicyCreateSSL(server, hostname);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return _SecTrustSetPolicies(trust, policies);
}

uint64_t TMIsAutomaticTimeEnabled()
{
  return _TMIsAutomaticTimeEnabled();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return _UISUserInterfaceStyleModeValueIsAutomatic();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAutoBrightnessEnabled()
{
  return __AXSAutoBrightnessEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return __AXSGuidedAccessEnabled();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_nospin_lock_lock()
{
  return __os_nospin_lock_lock();
}

uint64_t _os_nospin_lock_unlock()
{
  return __os_nospin_lock_unlock();
}

void asl_free(asl_object_t obj)
{
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

int asl_set_filter(asl_object_t client, int f)
{
  return _asl_set_filter(client, f);
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  return _asl_vlog(obj, msg, level, format, ap);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int sched_yield(void)
{
  return _sched_yield();
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

void xpc_transaction_end(void)
{
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

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeSessions(void *a1, const char *a2, ...)
{
  return [a1 activeSessions];
}

id objc_msgSend_activeViewerStatusString(void *a1, const char *a2, ...)
{
  return [a1 activeViewerStatusString];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return [a1 airplaneMode];
}

id objc_msgSend_aliasStrings(void *a1, const char *a2, ...)
{
  return [a1 aliasStrings];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsAudioChat(void *a1, const char *a2, ...)
{
  return [a1 allowsAudioChat];
}

id objc_msgSend_appleIDInviteWasAcceptedOrDeclined(void *a1, const char *a2, ...)
{
  return [a1 appleIDInviteWasAcceptedOrDeclined];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_askToCopyToPasteboardDelegate(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardDelegate];
}

id objc_msgSend_askToCopyToPasteboardNotification(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardNotification];
}

id objc_msgSend_askToCopyToPasteboardTimedOut(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardTimedOut];
}

id objc_msgSend_askToCopyToPasteboardTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardTimeoutTimer];
}

id objc_msgSend_askToCopyToPasteboardToken(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardToken];
}

id objc_msgSend_askToCopyToPasteboardUserMessage(void *a1, const char *a2, ...)
{
  return [a1 askToCopyToPasteboardUserMessage];
}

id objc_msgSend_askToOpenURLDelegate(void *a1, const char *a2, ...)
{
  return [a1 askToOpenURLDelegate];
}

id objc_msgSend_askToOpenURLNotification(void *a1, const char *a2, ...)
{
  return [a1 askToOpenURLNotification];
}

id objc_msgSend_askToOpenURLTimedOut(void *a1, const char *a2, ...)
{
  return [a1 askToOpenURLTimedOut];
}

id objc_msgSend_askToOpenURLTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 askToOpenURLTimeoutTimer];
}

id objc_msgSend_askToOpenURLToken(void *a1, const char *a2, ...)
{
  return [a1 askToOpenURLToken];
}

id objc_msgSend_askToResumeDelegate(void *a1, const char *a2, ...)
{
  return [a1 askToResumeDelegate];
}

id objc_msgSend_askToResumeNotification(void *a1, const char *a2, ...)
{
  return [a1 askToResumeNotification];
}

id objc_msgSend_askToResumeTimedOut(void *a1, const char *a2, ...)
{
  return [a1 askToResumeTimedOut];
}

id objc_msgSend_askToResumeTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 askToResumeTimeoutTimer];
}

id objc_msgSend_askToResumeToken(void *a1, const char *a2, ...)
{
  return [a1 askToResumeToken];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_autoAcceptInvitation(void *a1, const char *a2, ...)
{
  return [a1 autoAcceptInvitation];
}

id objc_msgSend_avConference(void *a1, const char *a2, ...)
{
  return [a1 avConference];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cellular(void *a1, const char *a2, ...)
{
  return [a1 cellular];
}

id objc_msgSend_checkIfNoSessions(void *a1, const char *a2, ...)
{
  return [a1 checkIfNoSessions];
}

id objc_msgSend_cleanupSession(void *a1, const char *a2, ...)
{
  return [a1 cleanupSession];
}

id objc_msgSend_closeAllSessions(void *a1, const char *a2, ...)
{
  return [a1 closeAllSessions];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectedLocalEndpoint(void *a1, const char *a2, ...)
{
  return [a1 connectedLocalEndpoint];
}

id objc_msgSend_connectedRemoteEndpoint(void *a1, const char *a2, ...)
{
  return [a1 connectedRemoteEndpoint];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return [a1 connectionState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCurrentTouchPositions(void *a1, const char *a2, ...)
{
  return [a1 copyCurrentTouchPositions];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createLockScreenNotifier(void *a1, const char *a2, ...)
{
  return [a1 createLockScreenNotifier];
}

id objc_msgSend_createStatusBar(void *a1, const char *a2, ...)
{
  return [a1 createStatusBar];
}

id objc_msgSend_crossAppTrackingAllowed(void *a1, const char *a2, ...)
{
  return [a1 crossAppTrackingAllowed];
}

id objc_msgSend_ctServiceSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 ctServiceSubscriptions];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_datagramConnection(void *a1, const char *a2, ...)
{
  return [a1 datagramConnection];
}

id objc_msgSend_datagramConnectionManager(void *a1, const char *a2, ...)
{
  return [a1 datagramConnectionManager];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doAcceptIDSInvitation(void *a1, const char *a2, ...)
{
  return [a1 doAcceptIDSInvitation];
}

id objc_msgSend_doAcceptIDSInvitationWithAVConferenceInfo(void *a1, const char *a2, ...)
{
  return [a1 doAcceptIDSInvitationWithAVConferenceInfo];
}

id objc_msgSend_doEndSession(void *a1, const char *a2, ...)
{
  return [a1 doEndSession];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return [a1 enabledDataclasses];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exitTimer(void *a1, const char *a2, ...)
{
  return [a1 exitTimer];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_gatherSystemInfo(void *a1, const char *a2, ...)
{
  return [a1 gatherSystemInfo];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return [a1 generalPasteboard];
}

id objc_msgSend_handledSessionEnd(void *a1, const char *a2, ...)
{
  return [a1 handledSessionEnd];
}

id objc_msgSend_hasBetterPath(void *a1, const char *a2, ...)
{
  return [a1 hasBetterPath];
}

id objc_msgSend_hidEventClient(void *a1, const char *a2, ...)
{
  return [a1 hidEventClient];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_idsServiceController(void *a1, const char *a2, ...)
{
  return [a1 idsServiceController];
}

id objc_msgSend_idsSession(void *a1, const char *a2, ...)
{
  return [a1 idsSession];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initAVConference(void *a1, const char *a2, ...)
{
  return [a1 initAVConference];
}

id objc_msgSend_initScreenSharingIDSService(void *a1, const char *a2, ...)
{
  return [a1 initScreenSharingIDSService];
}

id objc_msgSend_initViewServiceHelper(void *a1, const char *a2, ...)
{
  return [a1 initViewServiceHelper];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interruptionBehaviorSetting(void *a1, const char *a2, ...)
{
  return [a1 interruptionBehaviorSetting];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invitationNotification(void *a1, const char *a2, ...)
{
  return [a1 invitationNotification];
}

id objc_msgSend_inviterFullName(void *a1, const char *a2, ...)
{
  return [a1 inviterFullName];
}

id objc_msgSend_inviterID(void *a1, const char *a2, ...)
{
  return [a1 inviterID];
}

id objc_msgSend_inviterIconPath(void *a1, const char *a2, ...)
{
  return [a1 inviterIconPath];
}

id objc_msgSend_inviterKind(void *a1, const char *a2, ...)
{
  return [a1 inviterKind];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 isEmailAddress];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFaceTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFaceTimeEnabled];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 isPhoneNumber];
}

id objc_msgSend_isViable(void *a1, const char *a2, ...)
{
  return [a1 isViable];
}

id objc_msgSend_isVideoPausedToStart(void *a1, const char *a2, ...)
{
  return [a1 isVideoPausedToStart];
}

id objc_msgSend_isVideoSourceScreen(void *a1, const char *a2, ...)
{
  return [a1 isVideoSourceScreen];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return [a1 labelID];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockScreenObserverActive(void *a1, const char *a2, ...)
{
  return [a1 lockScreenObserverActive];
}

id objc_msgSend_machineName(void *a1, const char *a2, ...)
{
  return [a1 machineName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return [a1 mainThread];
}

id objc_msgSend_modeValue(void *a1, const char *a2, ...)
{
  return [a1 modeValue];
}

id objc_msgSend_monitorCount(void *a1, const char *a2, ...)
{
  return [a1 monitorCount];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notificationStartTime(void *a1, const char *a2, ...)
{
  return [a1 notificationStartTime];
}

id objc_msgSend_notificationTimedOut(void *a1, const char *a2, ...)
{
  return [a1 notificationTimedOut];
}

id objc_msgSend_notificationTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 notificationTimeoutTimer];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersionString];
}

id objc_msgSend_osTransaction(void *a1, const char *a2, ...)
{
  return [a1 osTransaction];
}

id objc_msgSend_pendingSession(void *a1, const char *a2, ...)
{
  return [a1 pendingSession];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_postAskToCopyToPasteboardNotification(void *a1, const char *a2, ...)
{
  return [a1 postAskToCopyToPasteboardNotification];
}

id objc_msgSend_postAskToOpenURLNotification(void *a1, const char *a2, ...)
{
  return [a1 postAskToOpenURLNotification];
}

id objc_msgSend_postAskToResumeNotification(void *a1, const char *a2, ...)
{
  return [a1 postAskToResumeNotification];
}

id objc_msgSend_postInvitationNotification(void *a1, const char *a2, ...)
{
  return [a1 postInvitationNotification];
}

id objc_msgSend_postShowUserMessageNotification(void *a1, const char *a2, ...)
{
  return [a1 postShowUserMessageNotification];
}

id objc_msgSend_postViewerPausedMessageNotification(void *a1, const char *a2, ...)
{
  return [a1 postViewerPausedMessageNotification];
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return [a1 powerOn];
}

id objc_msgSend_preferredOrDefaultSubscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 preferredOrDefaultSubscriptionContext];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_queuedMessage(void *a1, const char *a2, ...)
{
  return [a1 queuedMessage];
}

id objc_msgSend_ratio(void *a1, const char *a2, ...)
{
  return [a1 ratio];
}

id objc_msgSend_remoteAVConferenceInviteDictionary(void *a1, const char *a2, ...)
{
  return [a1 remoteAVConferenceInviteDictionary];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllTouchPositions(void *a1, const char *a2, ...)
{
  return [a1 removeAllTouchPositions];
}

id objc_msgSend_removeAskToCopyToPasteboardNotification(void *a1, const char *a2, ...)
{
  return [a1 removeAskToCopyToPasteboardNotification];
}

id objc_msgSend_removeAskToOpenURLNotification(void *a1, const char *a2, ...)
{
  return [a1 removeAskToOpenURLNotification];
}

id objc_msgSend_removeShowUserMessageNotification(void *a1, const char *a2, ...)
{
  return [a1 removeShowUserMessageNotification];
}

id objc_msgSend_removeUserAskToResumeNotification(void *a1, const char *a2, ...)
{
  return [a1 removeUserAskToResumeNotification];
}

id objc_msgSend_removeUserNotification(void *a1, const char *a2, ...)
{
  return [a1 removeUserNotification];
}

id objc_msgSend_removeViewerPausedNotification(void *a1, const char *a2, ...)
{
  return [a1 removeViewerPausedNotification];
}

id objc_msgSend_requiresWifi(void *a1, const char *a2, ...)
{
  return [a1 requiresWifi];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sanitizedFromID(void *a1, const char *a2, ...)
{
  return [a1 sanitizedFromID];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return [a1 screenLocked];
}

id objc_msgSend_screenPausedBeforeLock(void *a1, const char *a2, ...)
{
  return [a1 screenPausedBeforeLock];
}

id objc_msgSend_screenSharingVCCapabilities(void *a1, const char *a2, ...)
{
  return [a1 screenSharingVCCapabilities];
}

id objc_msgSend_sendMessageTCAccepted(void *a1, const char *a2, ...)
{
  return [a1 sendMessageTCAccepted];
}

id objc_msgSend_sendSessionInfoToClient(void *a1, const char *a2, ...)
{
  return [a1 sendSessionInfoToClient];
}

id objc_msgSend_sendSharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sendSharedSettings];
}

id objc_msgSend_serverReceivedTime(void *a1, const char *a2, ...)
{
  return [a1 serverReceivedTime];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_sessionController(void *a1, const char *a2, ...)
{
  return [a1 sessionController];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_sessionPaused(void *a1, const char *a2, ...)
{
  return [a1 sessionPaused];
}

id objc_msgSend_sessionStartDelegateWasCalled(void *a1, const char *a2, ...)
{
  return [a1 sessionStartDelegateWasCalled];
}

id objc_msgSend_sessionType(void *a1, const char *a2, ...)
{
  return [a1 sessionType];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedIDServiceController(void *a1, const char *a2, ...)
{
  return [a1 sharedIDServiceController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRenderer(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderer];
}

id objc_msgSend_sharedTouchEventMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedTouchEventMonitor];
}

id objc_msgSend_showUserMessage(void *a1, const char *a2, ...)
{
  return [a1 showUserMessage];
}

id objc_msgSend_showUserMessageNotification(void *a1, const char *a2, ...)
{
  return [a1 showUserMessageNotification];
}

id objc_msgSend_showUserMessageTimedOut(void *a1, const char *a2, ...)
{
  return [a1 showUserMessageTimedOut];
}

id objc_msgSend_showUserMessageTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 showUserMessageTimeoutTimer];
}

id objc_msgSend_showUserTermsAndConditions(void *a1, const char *a2, ...)
{
  return [a1 showUserTermsAndConditions];
}

id objc_msgSend_showViewerPausedNotification(void *a1, const char *a2, ...)
{
  return [a1 showViewerPausedNotification];
}

id objc_msgSend_showViewerPausedTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 showViewerPausedTimeoutTimer];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_socket(void *a1, const char *a2, ...)
{
  return [a1 socket];
}

id objc_msgSend_startMonitoringTouchEvents(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringTouchEvents];
}

id objc_msgSend_startOutPaused(void *a1, const char *a2, ...)
{
  return [a1 startOutPaused];
}

id objc_msgSend_startSendingTheScreen(void *a1, const char *a2, ...)
{
  return [a1 startSendingTheScreen];
}

id objc_msgSend_stateString(void *a1, const char *a2, ...)
{
  return [a1 stateString];
}

id objc_msgSend_stopConnection(void *a1, const char *a2, ...)
{
  return [a1 stopConnection];
}

id objc_msgSend_stopMonitoringTouchEvents(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringTouchEvents];
}

id objc_msgSend_stopUDPSend(void *a1, const char *a2, ...)
{
  return [a1 stopUDPSend];
}

id objc_msgSend_stringWithSchemeTrimmed(void *a1, const char *a2, ...)
{
  return [a1 stringWithSchemeTrimmed];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_termsAccepted(void *a1, const char *a2, ...)
{
  return [a1 termsAccepted];
}

id objc_msgSend_termsAndConditionsAccepted(void *a1, const char *a2, ...)
{
  return [a1 termsAndConditionsAccepted];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_touchEventTimer(void *a1, const char *a2, ...)
{
  return [a1 touchEventTimer];
}

id objc_msgSend_touchInfoLock(void *a1, const char *a2, ...)
{
  return [a1 touchInfoLock];
}

id objc_msgSend_triggers(void *a1, const char *a2, ...)
{
  return [a1 triggers];
}

id objc_msgSend_uiClient(void *a1, const char *a2, ...)
{
  return [a1 uiClient];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_urlResponseData(void *a1, const char *a2, ...)
{
  return [a1 urlResponseData];
}

id objc_msgSend_urlToOpen(void *a1, const char *a2, ...)
{
  return [a1 urlToOpen];
}

id objc_msgSend_useAppleCareName(void *a1, const char *a2, ...)
{
  return [a1 useAppleCareName];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return [a1 userID];
}

id objc_msgSend_validationURL(void *a1, const char *a2, ...)
{
  return [a1 validationURL];
}

id objc_msgSend_viewServicePID(void *a1, const char *a2, ...)
{
  return [a1 viewServicePID];
}

id objc_msgSend_vnc(void *a1, const char *a2, ...)
{
  return [a1 vnc];
}

id objc_msgSend_vsHelper(void *a1, const char *a2, ...)
{
  return [a1 vsHelper];
}

id objc_msgSend_vsSemaphore(void *a1, const char *a2, ...)
{
  return [a1 vsSemaphore];
}

id objc_msgSend_wallpaperSuspensionAssertion(void *a1, const char *a2, ...)
{
  return [a1 wallpaperSuspensionAssertion];
}

id objc_msgSend_whoHasTheLock(void *a1, const char *a2, ...)
{
  return [a1 whoHasTheLock];
}

id objc_msgSend_writeLock(void *a1, const char *a2, ...)
{
  return [a1 writeLock];
}