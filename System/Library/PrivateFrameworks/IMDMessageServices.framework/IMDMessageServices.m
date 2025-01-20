IMDMessageServicesCenter *sub_22743FF10()
{
  IMDMessageServicesCenter *result;

  result = objc_alloc_init(IMDMessageServicesCenter);
  qword_26AC136D0 = (uint64_t)result;
  return result;
}

uint64_t sub_227440214(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22743F000, v2, OS_LOG_TYPE_INFO, "Message Services agent disconnected", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _disconnected];
}

uint64_t sub_227440494(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x22A678880](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)string;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Error received in message routing reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v10 = (void *)MEMORY[0x22A678850](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v10;
        _os_log_impl(&dword_22743F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    [@"__kIMDMessageServicesRoutingDictionaryKey" UTF8String];
    uint64_t v12 = IMGetXPCDictionaryFromDictionary();
    [@"__kIMDMessageServicesCallbackIntervalKey" UTF8String];
    uint64_t v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 134218242;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_22743F000, v14, OS_LOG_TYPE_INFO, "Received routing reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v6;
        _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message routing reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  return result;
}

void sub_227440760(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2274405E4);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_227440B08(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x22A678880](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)string;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Error received in message expire state reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v10 = (void *)MEMORY[0x22A678850](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v10;
        _os_log_impl(&dword_22743F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    [@"__kIMDMessageServicesExpireStateDictionaryKey" UTF8String];
    uint64_t v12 = IMGetXPCDictionaryFromDictionary();
    [@"__kIMDMessageServicesCallbackIntervalKey" UTF8String];
    uint64_t v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 134218242;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_22743F000, v14, OS_LOG_TYPE_INFO, "Received expire state reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v6;
        _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message expire state reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  return result;
}

void sub_227440DD4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x227440C58);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_227441138(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x22A678880](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)string;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Error received in message watchdog reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v10 = (void *)MEMORY[0x22A678850](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v10;
        _os_log_impl(&dword_22743F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    [@"__kIMDMessageServicesWatchdogDictionaryKey" UTF8String];
    uint64_t v12 = IMGetXPCDictionaryFromDictionary();
    [@"__kIMDMessageServicesCallbackIntervalKey" UTF8String];
    uint64_t v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 134218242;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_22743F000, v14, OS_LOG_TYPE_INFO, "Received watchdog reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v6;
        _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message watchdog reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  return result;
}

void sub_227441404(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x227441288);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_22744176C(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x22A678880](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)string;
        _os_log_impl(&dword_22743F000, v8, OS_LOG_TYPE_INFO, "Error received in message scheduled type reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v10 = (void *)MEMORY[0x22A678850](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v10;
        _os_log_impl(&dword_22743F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    [@"__kIMDMessageServicesScheduledMessagesDictionaryKey" UTF8String];
    uint64_t v12 = IMGetXPCDictionaryFromDictionary();
    [@"__kIMDMessageServicesCallbackIntervalKey" UTF8String];
    uint64_t v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 134218242;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl(&dword_22743F000, v14, OS_LOG_TYPE_INFO, "Received schedule type reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v15 = 136315138;
        uint64_t v16 = (uint64_t)v6;
        _os_log_impl(&dword_22743F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message schedule type reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, 0, 0.0);
    }
  }
  return result;
}

void sub_227441A38(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2274418BCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x270F3CD60]();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x270F3CD68]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x270F3CD88]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x270F3CDB0]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x270F3CEB8]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x270F3CEC0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
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

void free(void *a1)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}