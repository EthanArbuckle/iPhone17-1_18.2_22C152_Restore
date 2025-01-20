IMTransferServicesCompressionController *sub_2129EBEA0()
{
  IMTransferServicesCompressionController *result;

  result = objc_alloc_init(IMTransferServicesCompressionController);
  qword_26ACD2D48 = (uint64_t)result;
  return result;
}

id -[IMTransferServicesCompressionController _blockForCopier:](IMTransferServicesCompressionController *self, SEL a2, id a3)
{
  if (!a3 || !objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7)) {
    return 0;
  }
  blockMap = self->_blockMap;
  uint64_t v18 = objc_msgSend_identifier(a3, v10, v11, v12, v13, v14, v15, v16);

  return (id)MEMORY[0x270F9A6D0](blockMap, sel_objectForKey_, v18, v19, v20, v21, v22, v23);
}

void sub_2129EC770(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    if (!v2) {
      JUMPOUT(0x2129EC730);
    }
    JUMPOUT(0x2129EC6ECLL);
  }
  _Unwind_Resume(a1);
}

IMTransferServicesController *sub_2129EC81C()
{
  result = objc_alloc_init(IMTransferServicesController);
  qword_26ACD2D50 = (uint64_t)result;
  return result;
}

void sub_2129ECF10(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x2129ECE30);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(exc_buf);
}

void sub_2129ECFF4(uint64_t a1, uint64_t a2)
{
}

void sub_2129ED004(uint64_t a1)
{
}

void sub_2129ED010(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2129EB000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v4, 2u);
    }
  }
  uint64_t v3 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

int64_t sub_2129ED0CC(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t result = MEMORY[0x21668AA20](a2);
  if (result == MEMORY[0x263EF8708])
  {
    if (_IMWillLog())
    {
      uint64_t v5 = (void *)MEMORY[0x21668A9D0](a2);
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
          v12[0] = 67109378;
          v12[1] = pid;
          __int16 v13 = 2080;
          uint64_t v14 = v5;
          _os_log_impl(&dword_2129EB000, v6, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v12, 0x12u);
        }
      }
      free(v5);
    }
    int64_t result = xpc_dictionary_get_int64(a2, "__message_type__");
    if (result == 1)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8)
      {
        uint64_t v9 = IMGetXPCIntFromDictionary();
        uint64_t v10 = IMGetXPCIntFromDictionary();
        uint64_t v11 = IMGetXPCIntFromDictionary();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v10, v11);
      }
    }
  }
  return result;
}

void sub_2129ED26C(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x21668AA20](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v50 = string;
        _os_log_impl(&dword_2129EB000, v15, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    int v17 = *(_DWORD *)(a1 + 112);
    if (v17 > 2)
    {
      if (*(void *)(a1 + 96))
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"IMTransferServicesErrorDomain", -4, 0, v12, v13, v14);
        (*(void (**)(void, void))(*(void *)(a1 + 96) + 16))(*(void *)(a1 + 96), *(void *)(a1 + 40));
      }
    }
    else
    {
      int v47 = v17 + 1;
      objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(*(void **)(a1 + 32), v11, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 116), v47, *(void *)(a1 + 88), *(void *)(a1 + 96));
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v18 = (char *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v50 = v18;
        _os_log_impl(&dword_2129EB000, v19, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v18);
    uint64_t v20 = IMGetXPCBoolFromDictionary();
    uint64_t v21 = IMGetXPCIntFromDictionary();
    uint64_t v22 = IMGetXPCStringFromDictionary();
    uint64_t v23 = IMGetXPCStringFromDictionary();
    uint64_t v24 = IMGetXPCDataFromDictionary();
    uint64_t v25 = IMGetXPCDataFromDictionary();
    uint64_t v26 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v27 = IMGetXPCStringFromDictionary();
    uint64_t v28 = *(void *)(a1 + 96);
    if (v28) {
      (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 16))(v28, *(void *)(a1 + 40), v20, v26, v27, v22, v24, v23, v25, v21);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        v50 = v10;
        _os_log_impl(&dword_2129EB000, v9, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 96))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v5, @"IMTransferServicesErrorDomain", -1, 0, v6, v7, v8);
      (*(void (**)(void, void))(*(void *)(a1 + 96) + 16))(*(void *)(a1 + 96), *(void *)(a1 + 40));
    }
  }
  if (*(void *)(a1 + 80))
  {
    uint64_t v48 = 0;
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = *(const char **)(a1 + 80);
        *(_DWORD *)buf = 138412290;
        v50 = v37;
        _os_log_impl(&dword_2129EB000, v36, OS_LOG_TYPE_INFO, "Removing the clone we created before: %@", buf, 0xCu);
      }
    }
    v38 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v29, v30, v31, v32, v33, v34, v35);
    if ((objc_msgSend_removeItemAtURL_error_(v38, v39, *(void *)(a1 + 80), (uint64_t)&v48, v40, v41, v42, v43) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = *(const char **)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          v50 = v45;
          __int16 v51 = 2112;
          uint64_t v52 = v48;
          _os_log_impl(&dword_2129EB000, v44, OS_LOG_TYPE_INFO, "Deletion of clone of %@ failed! error: %@", buf, 0x16u);
        }
      }
    }
  }
  v46 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  if (v46)
  {
    xpc_connection_cancel(v46);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) = 0;
  }
}

void sub_2129ED72C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2129ED404);
  }
  _Unwind_Resume(a1);
}

void sub_2129EDE90(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x2129EDDA4);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(exc_buf);
}

void sub_2129EDF58(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2129EB000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v4, 2u);
    }
  }
  uint64_t v3 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

int64_t sub_2129EE014(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t result = MEMORY[0x21668AA20](a2);
  if (result == MEMORY[0x263EF8708])
  {
    if (_IMWillLog())
    {
      uint64_t v5 = (void *)MEMORY[0x21668A9D0](a2);
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
          v12[0] = 67109378;
          v12[1] = pid;
          __int16 v13 = 2080;
          uint64_t v14 = v5;
          _os_log_impl(&dword_2129EB000, v6, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v12, 0x12u);
        }
      }
      free(v5);
    }
    int64_t result = xpc_dictionary_get_int64(a2, "__message_type__");
    if (result == 1)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8)
      {
        uint64_t v9 = IMGetXPCIntFromDictionary();
        uint64_t v10 = IMGetXPCIntFromDictionary();
        uint64_t v11 = IMGetXPCIntFromDictionary();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v10, v11);
      }
    }
  }
  return result;
}

void sub_2129EE1B4(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x21668AA20](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        uint64_t v28 = string;
        _os_log_impl(&dword_2129EB000, v15, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    int v17 = *(_DWORD *)(a1 + 136);
    if (v17 > 2)
    {
      if (*(void *)(a1 + 112))
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"IMTransferServicesErrorDomain", -4, 0, v12, v13, v14);
        (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
      }
    }
    else
    {
      int v26 = v17 + 1;
      objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(*(void **)(a1 + 32), v11, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), v26, *(void *)(a1 + 128), *(void *)(a1 + 104), *(void *)(a1 + 112));
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v18 = (char *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v28 = v18;
        _os_log_impl(&dword_2129EB000, v19, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v18);
    uint64_t v20 = IMGetXPCBoolFromDictionary();
    uint64_t v21 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v22 = IMGetXPCStringFromDictionary();
    uint64_t v23 = IMGetXPCStringFromDictionary();
    uint64_t v24 = *(void *)(a1 + 112);
    if (v24) {
      (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, *(void *)(a1 + 40), v22, v20, v21, v23);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        uint64_t v28 = v10;
        _os_log_impl(&dword_2129EB000, v9, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 112))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v5, @"IMTransferServicesErrorDomain", -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
    }
  }
  uint64_t v25 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
  if (v25)
  {
    xpc_connection_cancel(v25);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 120) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) = 0;
  }
}

void sub_2129EE510(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2129EE338);
  }
  _Unwind_Resume(a1);
}

void sub_2129EE890(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2129EEBF8(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2129EEC48(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668AA20](a2) == MEMORY[0x263EF8708] && _IMWillLog())
  {
    uint64_t v4 = (void *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        __int16 v8 = 2080;
        uint64_t v9 = v4;
        _os_log_impl(&dword_2129EB000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2129EF270(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2129EF2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668AA20](a2) == MEMORY[0x263EF8708] && _IMWillLog())
  {
    uint64_t v4 = (void *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        __int16 v8 = 2080;
        uint64_t v9 = v4;
        _os_log_impl(&dword_2129EB000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2129EF3EC(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x21668AA20](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v25 = 136315138;
        int v26 = string;
        _os_log_impl(&dword_2129EB000, v15, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"IMTransferServicesErrorDomain", -4, 0, v12, v13, v14);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 16))(v18, 0, v17);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = (char *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v25 = 136315138;
        int v26 = v19;
        _os_log_impl(&dword_2129EB000, v20, OS_LOG_TYPE_INFO, "received reply: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    free(v19);
    MEMORY[0x21668A810](@"IMNickname", @"IMSharedUtilities");
    objc_opt_class();
    uint64_t v21 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    uint64_t v22 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v23, v21, v22);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v25 = 136315138;
        int v26 = v10;
        _os_log_impl(&dword_2129EB000, v9, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error reply type in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    if (*(void *)(a1 + 32))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v5, @"IMTransferServicesErrorDomain", -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  uint64_t v24 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v24)
  {
    xpc_connection_cancel(v24);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2129EF6C8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2129EF560);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2129EF77C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2129EFBB8(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2129EFC08(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668AA20](a2) == MEMORY[0x263EF8708] && _IMWillLog())
  {
    uint64_t v4 = (void *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        __int16 v8 = 2080;
        uint64_t v9 = v4;
        _os_log_impl(&dword_2129EB000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2129EFD34(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x21668AA20](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        uint64_t v33 = string;
        _os_log_impl(&dword_2129EB000, v16, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"IMTransferServicesErrorDomain", -4, 0, v13, v14, v15);
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19) {
      (*(void (**)(uint64_t, void, void, void, void, void, void, void, uint64_t))(v19 + 16))(v19, 0, 0, 0, 0, 0, 0, 0, v18);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v20 = (char *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v33 = v20;
        _os_log_impl(&dword_2129EB000, v21, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v20);
    uint64_t v22 = IMGetXPCBoolFromDictionary();
    uint64_t v23 = IMGetXPCStringFromDictionary();
    uint64_t v24 = IMGetXPCDataFromDictionary();
    uint64_t v25 = IMGetXPCDataFromDictionary();
    uint64_t v26 = IMGetXPCDataFromDictionary();
    uint64_t v27 = IMGetXPCDataFromDictionary();
    uint64_t v28 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    MEMORY[0x21668A810](@"IMNickname", @"IMSharedUtilities");
    uint64_t v29 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    uint64_t v30 = *(void *)(a1 + 32);
    if (v30) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 16))(v30, v22, v29, v23, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        uint64_t v33 = v10;
        _os_log_impl(&dword_2129EB000, v9, OS_LOG_TYPE_INFO, "IMTransfer_Nickname - Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(void *)(a1 + 32))
    {
      uint64_t v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v5, @"IMTransferServicesErrorDomain", -1, 0, v6, v7, v8);
      (*(void (**)(void, void, void, void, void, void, void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, 0, 0, 0, 0, 0, v11);
    }
  }
  uint64_t v31 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v31)
  {
    xpc_connection_cancel(v31);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2129F00EC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2129EFED0);
  }
  _Unwind_Resume(a1);
}

void sub_2129F04AC(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2129F04FC(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x21668AA20](a2) == MEMORY[0x263EF8708] && _IMWillLog())
  {
    uint64_t v4 = (void *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        __int16 v8 = 2080;
        uint64_t v9 = v4;
        _os_log_impl(&dword_2129EB000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2129F0628(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x21668AA20](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v25 = 136315138;
        uint64_t v26 = string;
        _os_log_impl(&dword_2129EB000, v15, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"IMTransferServicesErrorDomain", -4, 0, v12, v13, v14);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 16))(v18, 0, v17);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = (char *)MEMORY[0x21668A9D0](a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v25 = 136315138;
        uint64_t v26 = v19;
        _os_log_impl(&dword_2129EB000, v20, OS_LOG_TYPE_INFO, "received reply: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    free(v19);
    uint64_t v21 = IMGetXPCBoolFromDictionary();
    uint64_t v22 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v23, v21, v22);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
        int v25 = 136315138;
        uint64_t v26 = v10;
        _os_log_impl(&dword_2129EB000, v9, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error reply type in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    if (*(void *)(a1 + 32))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v5, @"IMTransferServicesErrorDomain", -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  uint64_t v24 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v24)
  {
    xpc_connection_cancel(v24);
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2129F08E8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2129F079CLL);
  }
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return MEMORY[0x270F3CD48]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x270F3CD50]();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return MEMORY[0x270F3CD58]();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x270F3CD68]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x270F3CD70]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x270F3CD78]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x270F3CD90]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x270F3CDA0]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x270F3CDA8]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x270F3CDB8]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC0]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x270F3CDC8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMReportAutoBugCapture()
{
  return MEMORY[0x270F3CE28]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
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

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}