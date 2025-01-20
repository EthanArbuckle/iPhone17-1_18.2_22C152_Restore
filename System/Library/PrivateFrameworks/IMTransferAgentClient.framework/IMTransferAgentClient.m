uint64_t sub_2529A63C0()
{
  uint64_t vars8;

  qword_269C3F2F8 = objc_alloc_init(IMTransferAgentClient);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2529A687C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2529A688C(uint64_t a1)
{
}

void sub_2529A6894(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2529A5000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v6, 2u);
    }
  }
  v3 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

void sub_2529A6954(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2533C3570]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v28 = string;
        _os_log_impl(&dword_2529A5000, v10, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    unint64_t v12 = *(void *)(a1 + 88);
    if (v12 > 2)
    {
      if (*(void *)(a1 + 72))
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentClientErrorDomain" code:-4 userInfo:0];
        uint64_t v18 = *(void *)(a1 + 72);
        v25 = @"error";
        v26 = v17;
        v19 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _uploadRCSFileOnSimID:*(void *)(a1 + 40) fileURL:*(void *)(a1 + 48) thumbURL:*(void *)(a1 + 56) isAudioMessage:*(unsigned __int8 *)(a1 + 96) userInfo:*(void *)(a1 + 64) retries:v12 + 1 completion:*(void *)(a1 + 72)];
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v13 = (char *)MEMORY[0x2533C3540](v3);
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v28 = v13;
        _os_log_impl(&dword_2529A5000, v14, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v13);
    v15 = IMGetXPCDictionaryFromDictionary();
    uint64_t v16 = *(void *)(a1 + 72);
    if (v16) {
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v28 = v6;
        _os_log_impl(&dword_2529A5000, v5, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 72))
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentClientErrorDomain" code:-1 userInfo:0];
      uint64_t v8 = *(void *)(a1 + 72);
      v23 = @"error";
      v24 = v7;
      v9 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
  v20 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v20)
  {
    xpc_connection_cancel(v20);
    uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;
  }
}

void sub_2529A6CC4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2529A6B14);
  }
  _Unwind_Resume(a1);
}

void sub_2529A7100(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2529A5000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v6, 2u);
    }
  }
  id v3 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

void sub_2529A71C0(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2533C3570]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v28 = string;
        _os_log_impl(&dword_2529A5000, v10, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    uint64_t v12 = *(void *)(a1 + 80);
    if (v12 > 2)
    {
      if (*(void *)(a1 + 64))
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentClientErrorDomain" code:-4 userInfo:0];
        uint64_t v18 = *(void *)(a1 + 64);
        v25 = @"error";
        v26 = v17;
        v19 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _downloadRCSTransferOnSimID:*(void *)(a1 + 40) transferURL:*(void *)(a1 + 48) destURL:*(void *)(a1 + 56) retries:v12 + 1 completion:*(void *)(a1 + 64)];
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    v13 = (char *)MEMORY[0x2533C3540](v3);
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v28 = v13;
        _os_log_impl(&dword_2529A5000, v14, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v13);
    v15 = IMGetXPCDictionaryFromDictionary();
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v28 = v6;
        _os_log_impl(&dword_2529A5000, v5, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 64))
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentClientErrorDomain" code:-1 userInfo:0];
      uint64_t v8 = *(void *)(a1 + 64);
      v23 = @"error";
      v24 = v7;
      v9 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
  v20 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v20)
  {
    xpc_connection_cancel(v20);
    uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;
  }
}

void sub_2529A7528(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2529A7380);
  }
  _Unwind_Resume(a1);
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x270F3CD60]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x270F3CD90]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x270F3CDA8]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC0]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t im_primary_queue()
{
  return MEMORY[0x270F3CFD8]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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