void HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1, void *a2)
{
  id v3;
  CFMutableDictionaryRef Mutable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void handler[4];
  id v17;

  v3 = a1;
  if (_IMWillLog())
  {
    v14 = (void *)MEMORY[0x2166AD880](v3);
    v15 = a2;
    _IMAlwaysLog();
  }
  sub_214A77AD4();
  [(id)qword_26784C150 lock];
  if (v3 && [a2 length])
  {
    if (!qword_26784C148)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      v5 = (void *)qword_26784C148;
      qword_26784C148 = (uint64_t)Mutable;
    }
    v6 = objc_msgSend(v3, "copy", v14, v15);
    v7 = (void *)qword_26784C148;
    v8 = (void *)MEMORY[0x2166AD880]();
    [v7 setObject:v8 forKey:a2];

    sub_214A77B48();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    if (!qword_26784C160)
    {
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = dispatch_queue_create("com.apple.hsa-authentication_connection_queue", v9);
      v11 = (void *)qword_26784C160;
      qword_26784C160 = (uint64_t)v10;
    }
    if (!qword_26784C158)
    {
      v12 = IMXPCCreateConnectionForServiceWithQueue();
      v13 = (void *)qword_26784C158;
      qword_26784C158 = v12;

      if (qword_26784C158)
      {
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = sub_214A78308;
        handler[3] = &unk_2642287F0;
        v17 = &unk_26C599330;
        xpc_connection_set_event_handler((xpc_connection_t)qword_26784C158, handler);
        xpc_connection_resume((xpc_connection_t)qword_26784C158);
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      else
      {
        _IMWarn();
      }
    }
    dispatch_sync((dispatch_queue_t)qword_26784C160, &unk_26C599350);
    [(id)qword_26784C150 unlock];
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    objc_msgSend((id)qword_26784C150, "unlock", v14, v15);
  }
}

void sub_214A77AD4()
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (qword_26784C168 != -1)
  {
    dispatch_once(&qword_26784C168, &unk_26C599270);
  }
}

uint64_t sub_214A77B48()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = _IMWillLog();
  if (result)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v1 = [(id)qword_26784C148 allKeys];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v9;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v1);
          }
          uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * v5);
          if (_IMWillLog())
          {
            v7 = [(id)qword_26784C148 objectForKey:v6];
            _IMAlwaysLog();
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v3);
    }

    uint64_t result = _IMWillLog();
    if (result) {
      return _IMAlwaysLog();
    }
  }
  return result;
}

uint64_t HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  sub_214A77AD4();
  [(id)qword_26784C150 lock];
  if (![a1 length])
  {
    if (!_IMWillLog()) {
      goto LABEL_19;
    }
LABEL_18:
    _IMAlwaysLog();
    goto LABEL_19;
  }
  if (!qword_26784C148)
  {
    if (!_IMWillLog()) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v2 = [(id)qword_26784C148 objectForKey:a1];

  if (!v2)
  {
    if (!_IMWillLog()) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  [(id)qword_26784C148 removeObjectForKey:a1];
  sub_214A77B48();
  if (![(id)qword_26784C148 count])
  {
    uint64_t v3 = (void *)qword_26784C148;
    qword_26784C148 = 0;

    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    if (qword_26784C158)
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      xpc_connection_cancel((xpc_connection_t)qword_26784C158);
    }
  }
LABEL_19:
  uint64_t v4 = (void *)qword_26784C150;
  return [v4 unlock];
}

uint64_t sub_214A77EA0()
{
  qword_26784C150 = (uint64_t)objc_alloc_init(MEMORY[0x263F08958]);
  return MEMORY[0x270F9A758]();
}

void sub_214A77EDC()
{
  _IMWarn();
  v0 = (void *)qword_26784C158;
  qword_26784C158 = 0;
}

void sub_214A77F18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  id v5 = a3;
  if (MEMORY[0x2166AD9D0]() == MEMORY[0x263EF8720])
  {
    if (v5 != (id)MEMORY[0x263EF86A8])
    {
      if (v5 == (id)MEMORY[0x263EF86A0])
      {
        if (!_IMWillLog()) {
          goto LABEL_2;
        }
      }
      else if (v5 != (id)MEMORY[0x263EF86C0] || !_IMWillLog())
      {
        goto LABEL_2;
      }
      pid = (void *)xpc_connection_get_pid(v4);
      _IMAlwaysLog();
      goto LABEL_2;
    }
    if (_IMWillLog())
    {
      pid = (void *)xpc_connection_get_pid(v4);
      _IMAlwaysLog();
    }
    xpc_connection_cancel(v4);
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    v21 = (void *)qword_26784C158;
    qword_26784C158 = 0;
  }
LABEL_2:
  id v6 = v5;
  if (_IMWillLog())
  {
    v7 = (void *)MEMORY[0x2166AD990](v6);
    if (_IMWillLog())
    {
      pid = (void *)xpc_connection_get_pid(v4);
      v23 = v7;
      _IMAlwaysLog();
    }
    free(v7);
  }
  id v8 = v6;
  long long v9 = IMGetXPCStringFromDictionary();
  long long v10 = IMGetXPCStringFromDictionary();
  long long v11 = IMGetXPCStringFromDictionary();
  v12 = IMGetXPCStringFromDictionary();
  uint64_t v13 = [v12 length];
  int v14 = _IMWillLog();
  if (v13)
  {
    id v26 = v8;
    v27 = v4;
    if (v14)
    {
      v24 = v10;
      v25 = v11;
      pid = v12;
      v23 = v9;
      _IMAlwaysLog();
    }
    objc_msgSend((id)qword_26784C150, "lock", pid, v23, v24, v25);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = [(id)qword_26784C148 allValues];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          (*(void (**)(uint64_t, void *, void *, void *, void *))(v20 + 16))(v20, v9, v10, v11, v12);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    [(id)qword_26784C150 unlock];
    id v8 = v26;
    uint64_t v4 = v27;
  }
  else if (v14)
  {
    _IMAlwaysLog();
  }
}

uint64_t sub_214A78308(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_214A78324()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (v0 && qword_26784C158)
  {
    xpc_object_t message = v0;
    IMInsertBoolsToXPCDictionary();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    xpc_connection_send_message((xpc_connection_t)qword_26784C158, message);
    xpc_object_t v0 = message;
  }
  else if (!v0)
  {
    return;
  }
}

uint64_t sub_214A78434()
{
  qword_26AC13730 = objc_alloc_init(HSAAuthenticationServer);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_214A785A8(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _cleanup];
}

void sub_214A78604(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  xpc_connection_get_audit_token();
  if (IMDAuditTokenTaskHasEntitlement())
  {
    id v6 = (_xpc_connection_s *)v4;
    id v7 = v5;
    if (_IMWillLog())
    {
      uint64_t pid = xpc_connection_get_pid(v6);
      _IMAlwaysLog();
    }
    uint64_t v8 = MEMORY[0x2166AD9D0](v7);
    if (v8 == MEMORY[0x263EF8720])
    {
      if (v7 == (id)MEMORY[0x263EF86A8])
      {
        if (_IMWillLog())
        {
          uint64_t pid = xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        v12 = +[HSAAuthenticationServer sharedInstance];
        [v12 _cleanupClient:v6];

        xpc_connection_cancel(v6);
        goto LABEL_34;
      }
      if (v7 != (id)MEMORY[0x263EF86A0])
      {
        if (v7 == (id)MEMORY[0x263EF86C0] && _IMWillLog())
        {
          xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        goto LABEL_34;
      }
      if (_IMWillLog())
      {
        uint64_t pid = xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      id v9 = +[HSAAuthenticationServer sharedInstance];
      [v9 _cleanupClient:v6];
      goto LABEL_33;
    }
    if (v8 != MEMORY[0x263EF8708])
    {
LABEL_34:

      goto LABEL_35;
    }
    id v9 = v7;
    if (_IMWillLog())
    {
      long long v10 = (void *)MEMORY[0x2166AD990](v9);
      if (_IMWillLog())
      {
        uint64_t pid = xpc_connection_get_pid(v6);
        v19 = v10;
        _IMAlwaysLog();
      }
      free(v10);
    }
    if (xpc_dictionary_get_BOOL(v9, "setup-request"))
    {
      if (_IMWillLog())
      {
        uint64_t pid = xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      long long v11 = +[HSAAuthenticationServer sharedInstance];
      [v11 _configureWithClient:v6];
    }
    else
    {
      BOOL v13 = xpc_dictionary_get_BOOL(v9, "process-incoming-message");
      int v14 = _IMWillLog();
      if (!v13)
      {
        if (v14)
        {
          xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        goto LABEL_33;
      }
      if (v14)
      {
        xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      long long v11 = IMGetXPCStringFromDictionary();
      v15 = IMGetXPCStringFromDictionary();
      uint64_t v16 = IMGetXPCStringFromDictionary();
      uint64_t v17 = +[HSAAuthenticationServer sharedInstance];
      [v17 parseIncomingMessageFromNumber:v11 forService:v15 messageBody:v16];
    }
LABEL_33:

    goto LABEL_34;
  }
  xpc_connection_get_pid((xpc_connection_t)v4);
  uint64_t v20 = IMProcessNameForPid();
  _IMWarn();

  xpc_connection_cancel((xpc_connection_t)v4);
LABEL_35:
}

id sub_214A7903C(const __CFString *a1)
{
  v1 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.carrier");
  return v1;
}

uint64_t sub_214A793AC()
{
  os_log_t v0 = os_log_create("com.apple.Messages", "HSA");
  qword_26784C178 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0);
}

void HSAAuthenticationProcessIncomingMessage()
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (qword_26AC13740 != -1) {
    dispatch_once(&qword_26AC13740, &unk_26C5992B0);
  }
  connection = (_xpc_connection_s *)IMXPCCreateConnectionForServiceWithQueue();
  int v0 = _IMWillLog();
  if (connection)
  {
    if (v0) {
      _IMAlwaysLog();
    }
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    if (v1)
    {
      uint64_t v2 = v1;
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      xpc_dictionary_set_BOOL(v2, "process-incoming-message", 1);
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      xpc_connection_send_message(connection, v2);
    }
    else
    {
      xpc_connection_cancel(connection);
    }
  }
  else if (v0)
  {
    _IMAlwaysLog();
  }
}

void sub_214A795EC()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.HSAAuthenticationMessageQueue", v2);
  xpc_object_t v1 = (void *)qword_26AC13738;
  qword_26AC13738 = (uint64_t)v0;
}

uint64_t sub_214A79650()
{
  uint64_t result = _IMWillLog();
  if (result)
  {
    return _IMAlwaysLog();
  }
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x270F3CCE8]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x270F3CD78]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x270F3CD90]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC0]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x270F3CE20]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x270F3CEC0]();
}

uint64_t IMXPCCreateServerConnection()
{
  return MEMORY[0x270F3CEC8]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x270F3CF18]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x270F3CFA8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}