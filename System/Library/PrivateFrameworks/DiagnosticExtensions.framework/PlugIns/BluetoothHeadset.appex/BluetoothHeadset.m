void sub_10000487C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v7;
  void *v8;
  void *v9;
  char __s[16];
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;

  if (a6)
  {
    productId = a6;
    NSLog(@"DumpLogCompletionHandler: received pId = %u", a6);
  }
  else
  {
    productId = 0;
    NSLog(@"DumpLogCompletionHandler: error, no productId retrieved");
  }
  if (a5)
  {
    LODWORD(v7) = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)__s = 0u;
    v11 = 0u;
    do
    {
      __strcpy_chk();
      v8 = (void *)g_loggingFilenames;
      v9 = +[NSString stringWithCString:__s encoding:4];
      [v8 addObject:v9];

      v7 = (int)(v7 + strlen(__s) + 1);
    }
    while (v7 < a5);
  }
  dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
}

void sessionEventCallback(uint64_t a1, int a2, int a3)
{
  if (!(a3 | a2))
  {
    g_session = a1;
    BTLocalDeviceGetDefault();
    BTAccessoryManagerGetDefault();
    uint64_t v3 = BTAccessoryManagerRegisterCustomMessageClient();
    g_result = v3;
    if (v3)
    {
      NSLog(@"sessionEventCallback: BTAccessoryManagerAddTestCallbacks with error 0x%08x", v3);
      dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
    }
    else
    {
      NSLog(@"sessionEventCallback: BTAccessoryManagerAddTestCallbacks");
    }
    v4 = malloc_type_malloc(0x2EEuLL, 0x39953AFEuLL);
    if (v4)
    {
      v5 = v4;
      uint64_t v22 = 0;
      v6 = malloc_type_malloc(0x18uLL, 0x100004052888210uLL);
      *(_OWORD *)v6 = xmmword_100006A20;
      v6[2] = 0x20200000201ELL;
      uint64_t CaseSerialNumbersForAppleProductIds = BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds();
      id v8 = 0;
      if (CaseSerialNumbersForAppleProductIds)
      {
        v9 = 0;
      }
      else
      {
        v9 = 0;
        if (v22)
        {
          v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5);
          id v21 = 0;
          v9 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v21];
          id v8 = v21;
        }
      }
      free(v5);
      if (CaseSerialNumbersForAppleProductIds || v8)
      {
        NSLog(@"sessionEventCallback: BTAccessoryManagerGetCaseSerialNumbersForAppleProductId failed result %u dataLen %zu error %@", CaseSerialNumbersForAppleProductIds, v22, v8);
      }
      else
      {
        NSLog(@"sessionEventCallback: BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds successful (%lu serial numbers retrieved)", [v9 count]);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v17 + 1) + 8 * i);
              NSLog(@"sessionEventCallback: received serial number %@", v16);
              [(id)g_findMySerialNumbers addObject:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
          }
          while (v13);
        }

        dispatch_semaphore_signal((dispatch_semaphore_t)g_waitingForSerialsSema);
        if ([(id)g_findMySerialNumbers count]) {
          goto LABEL_23;
        }
      }
      dispatch_group_leave((dispatch_group_t)g_waitingPeripheralsGroup);
LABEL_23:
    }
  }
}

id sub_100005368(uint64_t a1)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTLELoggingManager.xpc", 0, 0);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = mach_service;

  NSLog(@"attachmentsForParameters: XPC connection created: %@", *(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(_xpc_connection_s **)(v5 + 16);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005440;
  handler[3] = &unk_1000082D8;
  handler[4] = v5;
  xpc_connection_set_event_handler(v6, handler);
  xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16));
  return [*(id *)(a1 + 32) leLogRequest];
}

id sub_100005440(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleXPCEvent:a2];
}

int64_t sub_1000054B0(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  v4 = a2;
  uint64_t v5 = [(DEAttachmentItem *)a3 modificationDate];
  v6 = [(DEAttachmentItem *)v4 modificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100005D90(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = [v8 identifier];
        v10 = [v9 UUIDString];
        NSLog(@"centralManagerDidUpdateState: Connecting to UUID %@", v10);

        [*(id *)(*(void *)(a1 + 32) + 40) addObject:v8];
        [*(id *)(a1 + 40) connectPeripheral:v8 options:0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  dispatch_group_leave((dispatch_group_t)g_waitingPeripheralsGroup);
}

uint64_t BTAccessoryManagerDeregisterCustomMessageClient()
{
  return _BTAccessoryManagerDeregisterCustomMessageClient();
}

uint64_t BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds()
{
  return _BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return _BTAccessoryManagerGetDefault();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return _BTAccessoryManagerRegisterCustomMessageClient();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

uint64_t CLGetAccessoryMotionSensorLogs()
{
  return _CLGetAccessoryMotionSensorLogs();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_storeStrong(id *location, id obj)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_cancelXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 cancelXPCConnection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_leLogRequest(void *a1, const char *a2, ...)
{
  return [a1 leLogRequest];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}