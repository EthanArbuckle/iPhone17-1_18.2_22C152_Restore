uint64_t start(int a1, char **a2)
{
  void *v4;

  UIApplicationMain(a1, a2, @"BluetoothUIService", @"BluetoothUIService");
  return 0;
}

id sub_1000043EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcListenerEvent:a2];
}

void sub_1000045E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000048CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000048E0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcConnectionEvent:a2];
}

void sub_1000049C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000049D8(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "copy", 0);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 xpcCon];
        v9 = *(void **)(a1 + 40);
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {

LABEL_11:
          if (dword_10001ED80 <= 50 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [v7 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v7];
          continue;
        }
        v12 = v11;
        if ((v10 == 0) == (v11 != 0))
        {

          continue;
        }
        unsigned int v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void sub_100004D24(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2 != 1)
  {
    if (a2 == 6)
    {
      a2 = 3;
    }
    else if (a2 != 2)
    {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) xpcSendMessage:a2];
LABEL_7:
  if (dword_10001ED80 <= 30 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 48);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

uint64_t sub_100004F38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F48(uint64_t a1)
{
}

void sub_100004F50(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
  }
  if (SBUIIsSystemApertureEnabled())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (dword_10001ED80 <= 50 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [v10 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v7);
    }

    if (dword_10001ED80 <= 30 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:*(void *)(a1 + 32) selector:"receiveVideoReadyToPlay:" name:@"VideoReadyToPlay" object:0];

    v12 = [BluetoothUIServiceBanner alloc];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v14 + 40);
    long long v15 = [(BluetoothUIServiceBanner *)v12 initWithXPCObject:v13 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v15];
    -[BluetoothUIServiceBanner setPid:](v15, "setPid:", [*(id *)(a1 + 48) pid]);
    uint64_t v16 = *(void *)(a1 + 32);
    long long v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;
    v18 = v15;

    [*(id *)(*(void *)(a1 + 32) + 32) setXpcCon:*(void *)(a1 + 48)];
  }
  else
  {
    if (dword_10001ED80 <= 30 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v19 = [BluetoothUIServiceBanner alloc];
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    id v26 = *(id *)(v21 + 40);
    v18 = [(BluetoothUIServiceBanner *)v19 initWithXPCObject:v20 error:&v26];
    objc_storeStrong((id *)(v21 + 40), v26);
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v18];
    -[BluetoothUIServiceBanner setPid:](v18, "setPid:", [*(id *)(a1 + 48) pid]);
    [(BluetoothUIServiceBanner *)v18 setXpcCon:*(void *)(a1 + 48)];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005330;
    v22[3] = &unk_100018508;
    id v23 = *(id *)(a1 + 48);
    v24 = v18;
    uint64_t v25 = *(void *)(a1 + 32);
    [(BluetoothUIServiceBanner *)v18 activateWithActionHandler:v22];
  }
}

void sub_100005330(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 != 1)
  {
    if (a2 == 6)
    {
      a2 = 3;
    }
    else if (a2 != 2)
    {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) xpcSendMessage:a2];
LABEL_7:
  if (dword_10001ED80 <= 50 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_100005A10(id a1, OS_xpc_object *a2)
{
  id v6 = a2;
  id v2 = CUXPCDecodeNSErrorIfNeeded();
  if (v2)
  {
    id v4 = (id)NSErrorF();
  }
  else
  {
    uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v3)
    {
      if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      id v5 = (id)NSErrorF();
    }
  }
}

void sub_1000060B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000060CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000060DC(uint64_t a1)
{
}

void sub_1000060E4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v10 = *(id *)(v3 + 40);
  id v4 = [v2 statusOfValueForKey:@"duration" error:&v10];
  objc_storeStrong((id *)(v3 + 40), v10);
  if (v4 == (id)2)
  {
    memset(&v9, 0, sizeof(v9));
    id v5 = (void *)a1[4];
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    *(_OWORD *)&v7.start.value = *(_OWORD *)&kCMTimeZero.value;
    v7.start.epoch = kCMTimeZero.epoch;
    CMTimeRangeMake(&v9, &v7.start, &duration);
    id v6 = *(void **)(a1[5] + 16);
    CMTimeRange v7 = v9;
    [v6 setLoopTimeRange:&v7];
  }
}

void sub_100006FD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
  v1 = [v2 requestAlertingAssertion];
  [v1 invalidateWithReason:@"6 seconds timer reached"];
}

void sub_10000891C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) checkifVideoAssetExists] & 1) == 0)
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 postNotificationName:@"VideoReadyToPlay" object:*(void *)(a1 + 32)];
  }
}

void sub_100008EA8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) checkifVideoAssetExists] & 1) == 0)
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 postNotificationName:@"VideoReadyToPlay" object:*(void *)(a1 + 32)];
  }
}

void sub_10000979C(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"VideoReadyToPlay" object:*(void *)(a1 + 32)];
}

id sub_10000C378(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeLayoutMode];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2 == (id)4)
  {
    id v4 = [v3 minimalView];
    [v4 setHidden:1];

    id v5 = *(unsigned __int8 **)(a1 + 32);
    int v6 = v5[195];
    CMTimeRange v7 = [v5 batteryLevelIndicator];
    uint64_t v8 = v7;
    if (v6)
    {
      CMTimeRange v9 = [v7 micaRootLayer];
      id v10 = v9;
      CFStringRef v11 = @"low_zoom";
    }
    else
    {
      [v7 setShowsPercentageLabel:1];

      uint64_t v20 = [*(id *)(a1 + 32) batteryLevelIndicator];
      [v20 percentageLevel];
      double v22 = v21;

      uint64_t v8 = [*(id *)(a1 + 32) batteryLevelIndicator];
      CMTimeRange v9 = [v8 micaRootLayer];
      id v10 = v9;
      if (v22 <= 0.2) {
        CFStringRef v11 = @"low_zoom";
      }
      else {
        CFStringRef v11 = @"zoom";
      }
    }
    [v9 setState:v11];

    uint64_t v26 = *(void *)(a1 + 32);
    if (*(void *)(v26 + 336) && [*(id *)(v26 + 344) containsString:@"mute"]) {
      [*(id *)(*(void *)(a1 + 32) + 336) addTarget:*(void *)(a1 + 32) action:"handleTap:" forControlEvents:64];
    }
  }
  else if ([v3 activeLayoutMode] == (id)3)
  {
    v12 = *(unsigned __int8 **)(a1 + 32);
    int v13 = v12[195];
    uint64_t v14 = [v12 batteryLevelIndicator];
    [v14 sizeToFit];

    long long v15 = [*(id *)(a1 + 32) batteryLevelIndicator];
    uint64_t v16 = v15;
    if (v13)
    {
      long long v17 = [v15 micaRootLayer];
      v18 = v17;
      v19 = @"low_with_number";
    }
    else
    {
      [v15 setShowsPercentageLabel:0];

      id v23 = [*(id *)(a1 + 32) batteryLevelIndicator];
      [v23 percentageLevel];
      double v25 = v24;

      uint64_t v16 = [*(id *)(a1 + 32) batteryLevelIndicator];
      long long v17 = [v16 micaRootLayer];
      v18 = v17;
      v19 = v25 <= 0.2 ? @"low_compact" : @"compact";
    }
    [v17 setState:v19];

    uint64_t v27 = *(void *)(a1 + 32);
    if (*(void *)(v27 + 336))
    {
      if ([*(id *)(v27 + 344) containsString:@"mute"]) {
        [*(id *)(*(void *)(a1 + 32) + 336) removeTarget:*(void *)(a1 + 32) action:"handleTap:" forControlEvents:64];
      }
    }
  }
  id result = [*(id *)(a1 + 32) activeLayoutMode];
  if (result != (id)-1)
  {
    id result = [*(id *)(a1 + 32) activeLayoutMode];
    if (result != (id)1)
    {
      long long v29 = *(void **)(a1 + 32);
      long long v30 = (void *)v29[18];
      long long v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v29 activeLayoutMode]);
      id obj = [v30 objectForKeyedSubscript:v31];

      id v33 = obj;
      uint64_t v34 = *(void *)(a1 + 32);
      id v35 = *(id *)(v34 + 24);
      if (obj != v35)
      {
        if (v35)
        {
          +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
          uint64_t v34 = *(void *)(a1 + 32);
        }
        objc_storeStrong((id *)(v34 + 24), obj);
        id v33 = obj;
        if (obj)
        {
          +[NSLayoutConstraint activateConstraints:obj];
          id v33 = obj;
          v32 = *(unsigned char **)(a1 + 32);
          if (v32[195])
          {
            v32 = [v32 activeLayoutMode];
            id v33 = obj;
            if (v32 == (unsigned char *)3)
            {
              [*(id *)(*(void *)(a1 + 32) + 296) setConstant:27.0];
              v32 = [*(id *)(*(void *)(a1 + 32) + 288) setConstant:27.0];
              id v33 = obj;
            }
          }
        }
      }
      return (id)_objc_release_x1(v32, v33);
    }
  }
  return result;
}

id sub_10000F8BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissBanner];
}

void sub_10000F9B4(uint64_t a1)
{
  id v3 = +[NSBundle bundleForClass:*(void *)(a1 + 32)];
  uint64_t v1 = [v3 bundleIdentifier];
  id v2 = (void *)qword_10001F100;
  qword_10001F100 = v1;
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

uint64_t CUAddSuffixForDeviceClass()
{
  return _CUAddSuffixForDeviceClass();
}

uint64_t CUXPCDecodeDouble()
{
  return _CUXPCDecodeDouble();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return _CUXPCDecodeNSErrorIfNeeded();
}

uint64_t CUXPCDecodeNSString()
{
  return _CUXPCDecodeNSString();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return _CUXPCDecodeSInt64RangedEx();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return _CUXPCDecodeUInt64RangedEx();
}

uint64_t CUXPCEncodeNSError()
{
  return _CUXPCEncodeNSError();
}

uint64_t FatalErrorF()
{
  return _FatalErrorF();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return _GestaltProductTypeStringToDeviceClass();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_resume(dispatch_object_t object)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

uint64_t xpc_connection_has_entitlement()
{
  return _xpc_connection_has_entitlement();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return _xpc_dictionary_expects_reply();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
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

id objc_msgSend__activate(void *a1, const char *a2, ...)
{
  return [a1 _activate];
}

id objc_msgSend__checkValidBatteryRange(void *a1, const char *a2, ...)
{
  return [a1 _checkValidBatteryRange];
}

id objc_msgSend__createBatteryView(void *a1, const char *a2, ...)
{
  return [a1 _createBatteryView];
}

id objc_msgSend__createConstraintsForInUseBannerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createConstraintsForInUseBannerIfNeeded];
}

id objc_msgSend__createConstraintsForReverseBannerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createConstraintsForReverseBannerIfNeeded];
}

id objc_msgSend__createConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createConstraintsIfNeeded];
}

id objc_msgSend__fillBatteryPercentage(void *a1, const char *a2, ...)
{
  return [a1 _fillBatteryPercentage];
}

id objc_msgSend__setupLayersAndLayerStates(void *a1, const char *a2, ...)
{
  return [a1 _setupLayersAndLayerStates];
}

id objc_msgSend__showInUseBanner(void *a1, const char *a2, ...)
{
  return [a1 _showInUseBanner];
}

id objc_msgSend__showMuteBanner(void *a1, const char *a2, ...)
{
  return [a1 _showMuteBanner];
}

id objc_msgSend__tightBoundingBoxLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 _tightBoundingBoxLayoutGuide];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 activeLayoutMode];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return [a1 avPlayer];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_batteryLevelIndicator(void *a1, const char *a2, ...)
{
  return [a1 batteryLevelIndicator];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_ccBottomViewLabel(void *a1, const char *a2, ...)
{
  return [a1 ccBottomViewLabel];
}

id objc_msgSend_ccTopViewLabel(void *a1, const char *a2, ...)
{
  return [a1 ccTopViewLabel];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_checkifVideoAssetExists(void *a1, const char *a2, ...)
{
  return [a1 checkifVideoAssetExists];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_containerSize(void *a1, const char *a2, ...)
{
  return [a1 containerSize];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createInUseConnectButton(void *a1, const char *a2, ...)
{
  return [a1 createInUseConnectButton];
}

id objc_msgSend_createReverseButton(void *a1, const char *a2, ...)
{
  return [a1 createReverseButton];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultFontProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultFontProvider];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissBanner(void *a1, const char *a2, ...)
{
  return [a1 dismissBanner];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return [a1 leadingView];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_localizePercentageLevel(void *a1, const char *a2, ...)
{
  return [a1 localizePercentageLevel];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_micaRootLayer(void *a1, const char *a2, ...)
{
  return [a1 micaRootLayer];
}

id objc_msgSend_minimalView(void *a1, const char *a2, ...)
{
  return [a1 minimalView];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_percentageLabel(void *a1, const char *a2, ...)
{
  return [a1 percentageLabel];
}

id objc_msgSend_percentageLevel(void *a1, const char *a2, ...)
{
  return [a1 percentageLevel];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_playerLayer(void *a1, const char *a2, ...)
{
  return [a1 playerLayer];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return [a1 presentationSize];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requestAlertingAssertion(void *a1, const char *a2, ...)
{
  return [a1 requestAlertingAssertion];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemFillColor];
}

id objc_msgSend_setBannerTimer(void *a1, const char *a2, ...)
{
  return [a1 setBannerTimer];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_showsPercentageLabel(void *a1, const char *a2, ...)
{
  return [a1 showsPercentageLabel];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return [a1 systemApertureElementContext];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray6Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray6Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_tintedButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 tintedButtonConfiguration];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return [a1 trailingView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcCon(void *a1, const char *a2, ...)
{
  return [a1 xpcCon];
}

id objc_msgSend_xpcSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcSendMessage:");
}