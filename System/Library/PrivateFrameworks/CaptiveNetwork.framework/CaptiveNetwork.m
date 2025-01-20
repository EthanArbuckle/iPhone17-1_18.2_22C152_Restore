uint64_t ServerConnectionConnect(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  mach_port_t *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *logger;
  os_log_type_t v10;
  const char *v11;
  kern_return_t v12;
  mach_error_t v13;
  NSObject *v14;
  os_log_type_t v15;
  char *v16;
  mach_port_t v17;
  mach_port_name_t *v18;
  uint64_t v19;
  CFIndex v20;
  CFDictionaryRef v21;
  CFDataRef Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v25;
  NSObject *v26;
  os_log_type_t v27;
  char *v28;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  char *v36;
  void *valuePtr;
  unsigned int v38;
  mach_port_name_t *v39;
  int token;
  void v41[5];
  int __errnum;
  int out_token;
  unsigned char handler[32];
  uint64_t v45;
  uint8_t buf[8];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 40)) {
    return 0;
  }
  v38 = 0;
  v5 = 0;
  token = 0;
  __errnum = 0;
  v39 = (mach_port_name_t *)(a1 + 56);
  valuePtr = (void *)(a1 + 24);
  v6 = (mach_port_t *)MEMORY[0x263EF87F0];
  v7 = 1000000;
  while (2)
  {
    v8 = v5;
    while (1)
    {
      v5 = v8;
      if (v8)
      {
        out_token = 0;
        *(void *)handler = MEMORY[0x263EF8330];
        *(void *)&handler[8] = 0x40000000;
        *(void *)&handler[16] = __ServerConnectionRegisterForStartNotification_block_invoke;
        *(void *)&handler[24] = &__block_descriptor_tmp_4;
        v45 = a1;
        v7 = notify_register_dispatch(*(const char **)(a1 + 16), &out_token, *(dispatch_queue_t *)a1, handler);
        if (v7)
        {
          logger = mysyslog_get_logger();
          v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v10))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v7;
            _os_log_impl(&dword_21076D000, logger, v10, "notify_register_dispatch failed with %d", buf, 8u);
          }
        }
        else
        {
          token = out_token;
        }
      }
      v11 = *(const char **)(a1 + 8);
      *(_DWORD *)buf = 0;
      v12 = bootstrap_look_up(*v6, v11, (mach_port_t *)buf);
      if (v12)
      {
        v13 = v12;
        v14 = mysyslog_get_logger();
        v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = mach_error_string(v13);
          *(_DWORD *)handler = 136315650;
          *(void *)&handler[4] = v11;
          *(_WORD *)&handler[12] = 1024;
          *(_DWORD *)&handler[14] = v13;
          *(_WORD *)&handler[18] = 2080;
          *(void *)&handler[20] = v16;
          _os_log_impl(&dword_21076D000, v14, v15, "bootstrap_look_up(%s) %d (%s)", handler, 0x1Cu);
        }
        goto LABEL_15;
      }
      v17 = *(_DWORD *)buf;
      if (*(_DWORD *)buf) {
        break;
      }
LABEL_15:
      result = 0;
      if (a2)
      {
        v8 = 1;
        if (!v5) {
          continue;
        }
      }
      return result;
    }
    v18 = v39;
    if (!v7)
    {
      notify_cancel(token);
      v18 = v39;
    }
    if (*v18)
    {
      mach_port_deallocate(*MEMORY[0x263EF8960], *v18);
      *v18 = 0;
    }
    v47 = 0;
    *(void *)handler = @"Class";
    *(void *)&handler[8] = 0;
    *(void *)buf = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    v19 = *(void *)(a1 + 32);
    if (v19)
    {
      *(void *)&handler[8] = @"Information";
      v47 = v19;
      v20 = 2;
    }
    else
    {
      v20 = 1;
    }
    v21 = CFDictionaryCreate(0, (const void **)handler, (const void **)buf, v20, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFRelease(*(CFTypeRef *)buf);
    Data = my_CFPropertyListCreateData(v21);
    CFRelease(v21);
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(Data);
    v25 = ConnectionEstablish(v17, (uint64_t)BytePtr, Length, *(_DWORD *)(a1 + 72), v39, &__errnum);
    CFRelease(Data);
    if (!(v25 | __errnum))
    {
      *(_DWORD *)(a1 + 40) = v17;
      v30 = dispatch_source_create(MEMORY[0x263EF83D0], *(unsigned int *)(a1 + 56), 1uLL, *(dispatch_queue_t *)a1);
      *(void *)(a1 + 48) = v30;
      if (v30)
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 0x40000000;
        v41[2] = __ServerConnectionConnect_block_invoke;
        v41[3] = &__block_descriptor_tmp_2_0;
        v41[4] = a1;
        dispatch_source_set_event_handler(v30, v41);
        dispatch_resume(*(dispatch_object_t *)(a1 + 48));
        v31 = *(void *)(a1 + 88);
        if (v31) {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v31, a1, 1);
        }
        v32 = mysyslog_get_logger();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)handler = 0;
          _os_log_impl(&dword_21076D000, v32, v33, "Connected", handler, 2u);
        }
        return 1;
      }
      v34 = mysyslog_get_logger();
      v35 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v34, v35))
      {
        *(_WORD *)handler = 0;
        _os_log_impl(&dword_21076D000, v34, v35, "failed to allocate server_died_source", handler, 2u);
      }
      ServerConnectionCleanup(a1);
      return 0;
    }
    v26 = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      v36 = mach_error_string(v25);
      v28 = strerror(__errnum);
      *(_DWORD *)handler = 136315394;
      *(void *)&handler[4] = v36;
      *(_WORD *)&handler[12] = 2080;
      *(void *)&handler[14] = v28;
      _os_log_impl(&dword_21076D000, v26, v27, "ConnectionEstablish failed, %s, %s", handler, 0x16u);
    }
    mach_port_deallocate(*MEMORY[0x263EF8960], v17);
    if (v25 == -308 || v25 == 268435459)
    {
      result = 0;
      if (!a2) {
        return result;
      }
      if (v38++ >= 5) {
        return result;
      }
      continue;
    }
    break;
  }
  if (v25 || !a2) {
    return 0;
  }
  result = *(void *)(a1 + 88);
  if (result)
  {
    (*(void (**)(uint64_t, uint64_t, void))(result + 16))(result, a1, 0);
    return 0;
  }
  return result;
}

uint64_t CNPluginMonitorStart(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  uint64_t result = 0;
  if (!a1 && object && aBlock)
  {
    if (CNPluginMonitorGet_once != -1) {
      dispatch_once(&CNPluginMonitorGet_once, &__block_literal_global);
    }
    CNMonitorSetQueueAndHandler(CNPluginMonitorGet_monitor, object, aBlock);
    return 1;
  }
  return result;
}

uint64_t ConnectionEstablish(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  msg.msgh_id = 0;
  *(_OWORD *)&msg.msgh_size = 0u;
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  uint64_t v19 = a4;
  int v20 = 1245184;
  uint64_t v21 = *MEMORY[0x263EF80C8];
  int v22 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1ABF96800000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&msg, 3, 0x44u, 0x3Cu, reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (msg.msgh_id == 28047820)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996;
          if (v15 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v17) << 16 == 1114112)
          {
            uint64_t v11 = 0;
            int v12 = HIDWORD(v19);
            *a5 = v16;
            *a6 = v12;
            return v11;
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v11 = 4294966996;
          if (HIDWORD(v16))
          {
            if (msg.msgh_remote_port) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
          }
        }
        else
        {
          uint64_t v11 = 4294966996;
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v11;
}

CFDataRef my_CFPropertyListCreateData(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
}

void CNMonitorSetQueueAndHandler(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3002000000;
  int v17 = __Block_byref_object_copy_;
  int v18 = __Block_byref_object_dispose_;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  if (object) {
    dispatch_retain(object);
  }
  if (aBlock) {
    v6 = _Block_copy(aBlock);
  }
  else {
    v6 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __CNMonitorSetQueueAndHandler_block_invoke;
  block[3] = &unk_264138178;
  block[6] = &v14;
  block[7] = a1;
  block[8] = object;
  block[4] = v6;
  block[5] = &v10;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 8), block);
  v7 = (const void *)v15[5];
  if (v7) {
    _Block_release(v7);
  }
  v8 = v11[3];
  if (v8) {
    dispatch_release(v8);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __CNMonitorSetQueueAndHandler_block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[7] + 16);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(void *)(a1[7] + 24);
  *(void *)(a1[7] + 16) = a1[8];
  uint64_t v2 = a1[7];
  *(void *)(v2 + 24) = a1[4];
  uint64_t v3 = a1[8];
  if (*(void *)(*(void *)(a1[5] + 8) + 24))
  {
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    *(unsigned char *)(v2 + 32) = 1;
LABEL_4:
  if (*(unsigned char *)(v2 + 32))
  {
    if (*(void *)v2)
    {
      HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)v2);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 0x40000000;
      v6[2] = __CNMonitorSetQueueAndHandler_block_invoke_2;
      v6[3] = &__block_descriptor_tmp;
      v6[4] = a1[7];
      v5 = v6;
LABEL_7:
      dispatch_async(HandlerQueue, v5);
      return;
    }
    if (!*(unsigned char *)(v2 + 33))
    {
      *(unsigned char *)(v2 + 33) = 1;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = __CNMonitorSetupConnection_block_invoke;
      v9[3] = &__block_descriptor_tmp_5;
      v9[4] = v2;
      v7[6] = v2;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 0x40000000;
      v8[2] = __CNMonitorSetupConnection_block_invoke_2;
      v8[3] = &__block_descriptor_tmp_7;
      v8[4] = v2;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 0x40000000;
      v7[2] = __CNMonitorSetupConnection_block_invoke_8;
      v7[3] = &unk_264138208;
      v7[4] = v9;
      v7[5] = v8;
      HandlerQueue = dispatch_get_global_queue(0, 0);
      v5 = v7;
      goto LABEL_7;
    }
  }
}

void __CNMonitorSetQueueAndHandler_block_invoke_2(uint64_t a1)
{
}

void CNMonitorSyncState(uint64_t a1)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __CNMonitorSyncState_block_invoke;
  block[3] = &unk_2641381A0;
  block[5] = &v7;
  block[6] = a1;
  block[4] = &v11;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 8), block);
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v2 = (const void *)(*(uint64_t (**)(void))(a1 + 48))(*((unsigned __int8 *)v12 + 24));
    if (!ServerConnectionProcessControl(*(void *)a1, v2, 0))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21076D000, logger, v4, "ServerConnectionProcessControl() failed", v5, 2u);
      }
    }
    CFRelease(v2);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

_OWORD *CNMonitorCreate(int a1, uint64_t a2, uint64_t a3)
{
  v6 = malloc_type_malloc(0x38uLL, 0x10A00401588D737uLL);
  v6[1] = 0u;
  v6[2] = 0u;
  _OWORD *v6 = 0u;
  *((void *)v6 + 6) = 0;
  *((_DWORD *)v6 + 9) = a1;
  *((void *)v6 + 1) = dispatch_queue_create("CNMonitor", 0);
  *((void *)v6 + 5) = a2;
  *((void *)v6 + 6) = a3;
  return v6;
}

void CNMonitorPerformBlock(uint64_t a1, void *a2)
{
}

uint64_t CNMonitorGetHandler(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t CNMonitorGetQueue(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *__CNMonitorSyncState_block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = *(void *)(result[6] + 16) != 0;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[6] + 32);
  uint64_t v1 = result[6];
  if (*(unsigned char *)(v1 + 32)) {
    *(unsigned char *)(v1 + 32) = 0;
  }
  return result;
}

void __CNMonitorSetupConnection_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a3)
  {
    if (CFGetTypeID(a3) == TypeID && (CFIndex Count = CFArrayGetCount(a3)) != 0)
    {
      CFIndex v7 = Count;
      if (Count >= 1)
      {
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a3, 0);
          CFTypeID v9 = CFDictionaryGetTypeID();
          if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v9)
          {
            (*(void (**)(uint64_t, const void *))(v4 + 40))(v4, ValueAtIndex);
          }
          else
          {
            logger = mysyslog_get_logger();
            os_log_type_t v11 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v11))
            {
              *(_DWORD *)buf = 138412290;
              int v15 = ValueAtIndex;
              _os_log_impl(&dword_21076D000, logger, v11, "command is not a dictionary %@", buf, 0xCu);
            }
          }
          --v7;
        }
        while (v7);
      }
    }
    else
    {
      uint64_t v12 = mysyslog_get_logger();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21076D000, v12, v13, "given invalid command list", buf, 2u);
      }
    }
  }
}

void __CNMonitorSetupConnection_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = *(uint64_t **)(a1 + 32);
    if (!*v4)
    {
      *uint64_t v4 = a2;
      ServerConnectionResume(a2);
      uint64_t v4 = *(uint64_t **)(a1 + 32);
    }
    CNMonitorSyncState((uint64_t)v4);
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)CFIndex v7 = 0;
      _os_log_impl(&dword_21076D000, logger, v6, "Reconnect failed", v7, 2u);
    }
  }
}

void __CNMonitorSetupConnection_block_invoke_8(uint64_t a1)
{
  if (!ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", *(_DWORD *)(*(void *)(a1 + 48) + 36), 0, *(const void **)(a1 + 32), *(const void **)(a1 + 40)))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21076D000, logger, v2, "ServerConnectionCreate failed", v3, 2u);
    }
  }
}

void CNPluginMonitorStop()
{
  if (CNPluginMonitorGet_once != -1) {
    dispatch_once(&CNPluginMonitorGet_once, &__block_literal_global);
  }
  uint64_t v0 = CNPluginMonitorGet_monitor;
  CNMonitorSetQueueAndHandler(v0, 0, 0);
}

const void *CNPluginMonitorEventCopyDisplayIDs(const void *a1)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID) {
      CFRetain(a1);
    }
    else {
      return 0;
    }
  }
  return a1;
}

_OWORD *__CNPluginMonitorGet_block_invoke()
{
  uint64_t result = CNMonitorCreate(6, (uint64_t)CNPluginMonitorHandleCommand, (uint64_t)CNPluginMonitorCopyControl);
  CNPluginMonitorGet_monitor = (uint64_t)result;
  return result;
}

void CNPluginMonitorHandleCommand(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  Value = CFDictionaryGetValue(theDict, @"EventType");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v9 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v9)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v20 = theDict;
    char v10 = "event type invalid/missing in %@";
    os_log_type_t v11 = logger;
    os_log_type_t v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_10;
  }
  if (valuePtr != 1)
  {
    char v14 = mysyslog_get_logger();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v14, v15)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = valuePtr;
    char v10 = "event type %d unrecognized";
    os_log_type_t v11 = v14;
    os_log_type_t v12 = v15;
    uint32_t v13 = 8;
LABEL_10:
    _os_log_impl(&dword_21076D000, v11, v12, v10, buf, v13);
    return;
  }
  os_log_type_t v6 = CFDictionaryGetValue(theDict, @"DisplayIDs");
  CFIndex v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 0x40000000;
  v16[2] = __CNPluginMonitorHandleCommand_block_invoke;
  v16[3] = &__block_descriptor_tmp_6;
  int v17 = valuePtr;
  v16[4] = a1;
  v16[5] = v7;
  CNMonitorPerformBlock(a1, v16);
}

CFDictionaryRef CNPluginMonitorCopyControl(int a1)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 2;
  }
  int valuePtr = v1;
  keys[0] = @"Type";
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  values[0] = v2;
  int v6 = 1;
  keys[1] = @"EventType";
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &v6);
  values[1] = v3;
  CFDictionaryRef v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(v2);
  CFRelease(v3);
  return v4;
}

void __CNPluginMonitorHandleCommand_block_invoke(uint64_t a1)
{
  Queue = CNMonitorGetQueue(*(void *)(a1 + 32));
  if (Queue)
  {
    CFNumberRef v3 = Queue;
    dispatch_retain(Queue);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __CNPluginMonitorHandleCommand_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_5_0;
    uint64_t v4 = *(void *)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    void v6[5] = v3;
    int v7 = *(_DWORD *)(a1 + 48);
    v6[6] = v4;
    dispatch_async(v3, v6);
  }
  else
  {
    v5 = *(const void **)(a1 + 40);
    if (v5)
    {
      CFRelease(v5);
    }
  }
}

void __CNPluginMonitorHandleCommand_block_invoke_2(uint64_t a1)
{
  uint64_t Handler = CNMonitorGetHandler(*(void *)(a1 + 32));
  if (Handler)
  {
    uint64_t v3 = Handler;
    if (CNMonitorGetQueue(*(void *)(a1 + 32)) == *(void *)(a1 + 40)) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
    }
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
  v5 = *(NSObject **)(a1 + 40);
  dispatch_release(v5);
}

uint64_t CNProberGetTypeID()
{
  return __kCNProberTypeID;
}

uint64_t CNProberProvideResult(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  logger = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    int v7 = 134218240;
    uint64_t v8 = a1;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_21076D000, logger, v5, "prober %p result %d", (uint8_t *)&v7, 0x12u);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(a1 + 16))(*(void *)(a1 + 24), a1, a2);
}

const void *CNProberCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  if (!a3) {
    return 0;
  }
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  Instance = (void *)_CFRuntimeCreateInstance();
  int v7 = Instance;
  if (Instance)
  {
    Instance[2] = a3;
    Instance[3] = a4;
    if (!CNWebSheetProbeRequest(Instance))
    {
      CFRelease(v7);
      return 0;
    }
  }
  return v7;
}

CFRunLoopSourceRef CNProberCreateRunLoopSource(void *a1)
{
  v2.version = 0;
  memset(&v2.retain, 0, 56);
  v2.info = a1;
  v2.perform = (void (__cdecl *)(void *))CNProberCallback;
  return CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &v2);
}

void CNProberCallback()
{
  logger = mysyslog_get_logger();
  os_log_type_t v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)CFRunLoopSourceContext v2 = 0;
    _os_log_impl(&dword_21076D000, logger, v1, "Unexpected runloop source triggered", v2, 2u);
  }
}

BOOL CNScrapeCredentials(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  int CaptivePort = FindCaptivePort();
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v10 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, 0x1000uLL);
  uint64_t v11 = CFStringMallocCString(v9, a2, 0x1000uLL);
  os_log_type_t v12 = CFStringMallocCString(v9, a3, 0x1000uLL);
  uint32_t v13 = CFStringMallocCString(v9, a4, 0x1000uLL);
  char v14 = v13;
  if ((CaptivePort + 1) < 2
    || (v10 ? (BOOL v15 = v11 == 0) : (BOOL v15 = 1),
        !v15 ? (BOOL v16 = v13 == 0) : (BOOL v16 = 1),
        !v16 ? (BOOL v17 = v12 == 0) : (BOOL v17 = 1),
        v17))
  {
    BOOL v18 = 0;
    BOOL v19 = 0;
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v18 = ParsePost() == 0;
  }
  CFAllocatorDeallocate(v9, v10);
  BOOL v19 = v18;
LABEL_15:
  if (v11) {
    CFAllocatorDeallocate(v9, v11);
  }
  if (v14) {
    CFAllocatorDeallocate(v9, v14);
  }
  if (v12) {
    CFAllocatorDeallocate(v9, v12);
  }
  return v19;
}

uint64_t FindCaptivePort()
{
  pthread_once(&captiveIsPresent_once, (void (*)(void))setCaptiveIsPresentOnce);
  if (sCaptiveIsPresent) {
    return 0;
  }
  mach_port_t sp = 0;
  if (bootstrap_look_up(*MEMORY[0x263EF87F0], "com.apple.networking.captivenetworksupport", &sp)) {
    return 0;
  }
  else {
    return sp;
  }
}

void *CFStringMallocCString(const __CFAllocator *a1, CFStringRef theString, unint64_t a3)
{
  if (!theString) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);
  unint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding >= a3) {
    CFIndex v8 = a3;
  }
  else {
    CFIndex v8 = MaximumSizeForEncoding;
  }
  CFAllocatorRef v9 = CFAllocatorAllocate(a1, v8, 0);
  if (v9 && !CFStringGetCString(theString, (char *)v9, v8, 0x8000100u))
  {
    CFAllocatorDeallocate(a1, v9);
    return 0;
  }
  return v9;
}

BOOL CNDebugLaunchWebsheet(const void *a1)
{
  int v11 = 0;
  mach_port_t CaptivePort = FindCaptivePort();
  BOOL v3 = 0;
  if (a1)
  {
    mach_port_t v4 = CaptivePort;
    if (CaptivePort + 1 >= 2)
    {
      CFDataRef Data = my_CFPropertyListCreateData(a1);
      if (Data)
      {
        CFDataRef v6 = Data;
        BytePtr = CFDataGetBytePtr(Data);
        int Length = CFDataGetLength(v6);
        int v9 = DebugLaunchWebsheet(v4, (uint64_t)BytePtr, Length, &v11);
        BOOL v3 = (v9 | v11) == 0;
        CFRelease(v6);
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

BOOL CNLogoff(const __CFString *a1)
{
  int CaptivePort = FindCaptivePort();
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  mach_port_t v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, 0x1000uLL);
  os_log_type_t v5 = v4;
  if ((CaptivePort + 1) < 2 || v4 == 0)
  {
    BOOL v8 = 0;
    BOOL result = 0;
    if (!v5) {
      return result;
    }
  }
  else
  {
    BOOL v8 = Logoff() == 0;
  }
  CFAllocatorDeallocate(v3, v5);
  return v8;
}

uint64_t CNWebsheetNotifyCompleteWithOptions(uint64_t a1, int a2, void *a3)
{
  return 1;
}

uint64_t CNWebsheetNotifyComplete(uint64_t a1, int a2)
{
  return 1;
}

uint64_t CNSClientLogoffReply()
{
  return 0;
}

BOOL CNForgetSSID(const __CFData *a1)
{
  int CaptivePort = FindCaptivePort();
  BOOL result = 0;
  if (a1)
  {
    if ((CaptivePort + 1) >= 2)
    {
      BytePtr = CFDataGetBytePtr(a1);
      unsigned int Length = CFDataGetLength(a1);
      return ForgetNetwork(CaptivePort, (uint64_t)BytePtr, Length) == 0;
    }
  }
  return result;
}

uint64_t CNSClientAuthenticateUsingReply(int a1, int a2)
{
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  pthread_mutex_lock(&__captiveLock);
  mach_port_t v4 = &sAuthStateHead;
  do
  {
    os_log_type_t v5 = v4;
    mach_port_t v4 = (uint64_t *)*v4;
    if (!v4)
    {
      pthread_mutex_unlock(&__captiveLock);
      return 0;
    }
  }
  while (*((_DWORD *)v4 + 8) != a1);
  uint64_t *v5 = *v4;
  pthread_mutex_unlock(&__captiveLock);
  ((void (*)(uint64_t, BOOL))v4[1])(v4[2], a2 == 0);
  CFMachPortInvalidate((CFMachPortRef)v4[3]);
  CFDataRef v6 = (const void *)v4[3];
  if (v6)
  {
    CFRelease(v6);
    v4[3] = 0;
  }
  free(v4);
  return 0;
}

uint64_t CNAccountsUse(const __CFString *a1, const __CFString *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (uint64_t)malloc_type_malloc(0x28uLL, 0x10A0040FFE778EBuLL);
  if (result)
  {
    int v11 = (void *)result;
    pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
    *(_OWORD *)&context.version = xmmword_264138288;
    memset(&context.retain, 0, 24);
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint32_t v13 = CFMachPortCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFMachPortCallBack)MachServerCallback, &context, 0);
    v11[3] = v13;
    if (!v13) {
      goto LABEL_25;
    }
    *((_DWORD *)v11 + 8) = CFMachPortGetPort(v13);
    v11[1] = a4;
    v11[2] = a5;
    int CaptivePort = FindCaptivePort();
    BOOL v15 = CFStringMallocCString(v12, a1, 0x400uLL);
    BOOL v16 = CFStringMallocCString(v12, a2, 0x400uLL);
    BOOL v17 = v16;
    if (v15) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || CaptivePort == 0 || CaptivePort == -1)
    {
      if (v15) {
        free(v15);
      }
      if (v17) {
        free(v17);
      }
    }
    else
    {
      int v21 = AuthenticateUsing();
      free(v15);
      free(v17);
      int v22 = (__CFMachPort *)v11[3];
      if (v21)
      {
        if (v22)
        {
          uint64_t v23 = (const void *)v11[3];
LABEL_24:
          CFRelease(v23);
        }
LABEL_25:
        free(v11);
        return 0;
      }
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v12, v22, 0);
      if (RunLoopSource)
      {
        v25 = RunLoopSource;
        pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
        pthread_mutex_lock(&__captiveLock);
        *int v11 = sAuthStateHead;
        sAuthStateHead = (uint64_t)v11;
        pthread_mutex_unlock(&__captiveLock);
        CFRunLoopAddSource(a3, v25, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
        CFRelease(v25);
        return 1;
      }
    }
    uint64_t v23 = (const void *)v11[3];
    if (v23) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  return result;
}

uint64_t CNAuthenticateUsingTokenAccount(const __CFString *a1, const __CFData *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  int v20 = 0;
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  uint64_t v10 = 0;
  if (!a1 || !a2) {
    return v10;
  }
  if (!CFDataGetLength(a2)) {
    return 0;
  }
  int v11 = malloc_type_malloc(0x28uLL, 0x10A0040FFE778EBuLL);
  *(_OWORD *)&v19.version = xmmword_264138288;
  memset(&v19.retain, 0, 24);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint32_t v13 = CFMachPortCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFMachPortCallBack)MachServerCallback, &v19, 0);
  v11[3] = v13;
  if (!v13)
  {
    char v14 = 0;
LABEL_14:
    free(v11);
    uint64_t v10 = 0;
    BOOL v16 = 0;
    goto LABEL_15;
  }
  *((_DWORD *)v11 + 8) = CFMachPortGetPort(v13);
  v11[1] = a4;
  v11[2] = a5;
  if (FindCaptivePort() - 1 > 0xFFFFFFFD)
  {
    char v14 = 0;
    goto LABEL_12;
  }
  char v14 = CFStringMallocCString(v12, a1, 0x400uLL);
  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  if (AuthenticateUsingToken() | v20
    || (CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v12, (CFMachPortRef)v11[3], 0)) == 0)
  {
LABEL_12:
    BOOL v17 = (const void *)v11[3];
    if (v17) {
      CFRelease(v17);
    }
    goto LABEL_14;
  }
  BOOL v16 = RunLoopSource;
  pthread_once(&__captiveInit, (void (*)(void))CaptiveInitOnce);
  pthread_mutex_lock(&__captiveLock);
  *int v11 = sAuthStateHead;
  sAuthStateHead = (uint64_t)v11;
  pthread_mutex_unlock(&__captiveLock);
  CFRunLoopAddSource(a3, v16, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  uint64_t v10 = 1;
LABEL_15:
  if (v14) {
    free(v14);
  }
  if (v16) {
    CFRelease(v16);
  }
  return v10;
}

CFPropertyListRef CNAccountsCopy()
{
  int CaptivePort = FindCaptivePort();
  int v2 = 0;
  if ((CaptivePort - 1) > 0xFFFFFFFD) {
    return 0;
  }
  memset(length, 0, sizeof(length));
  if (!CopyAccountList(CaptivePort, &length[1], length, &v2)) {
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  }
  CFPropertyListRef result = 0;
  if (!v2) {
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  }
  return result;
}

BOOL CNAccountsResolve(const __CFString *a1)
{
  int CaptivePort = FindCaptivePort();
  BOOL v3 = 0;
  if (a1 && (CaptivePort + 1) >= 2)
  {
    mach_port_t v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, 0x400uLL);
    if (v4)
    {
      os_log_type_t v5 = v4;
      BOOL v3 = ResolveAccount() == 0;
      free(v5);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

BOOL CNDumpState()
{
  mach_port_t CaptivePort = FindCaptivePort();
  return CaptivePort - 1 <= 0xFFFFFFFD && DumpState(CaptivePort) == 0;
}

uint64_t __CNSetSupportedSSIDs()
{
  return 0;
}

uint64_t __CNMarkPortalOnline()
{
  return 0;
}

uint64_t __CNMarkPortalOffline()
{
  return 0;
}

const void *__CNCopyCurrentNetworkInfo(CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v2 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], theString, 0x1000uLL);
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2;
  mach_port_t v4 = (void *)NEHelperCopyCurrentNetworkInfo();
  CFAllocatorDeallocate(v1, v3);
  if (!v4) {
    return 0;
  }
  os_log_type_t v5 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v5 || CFGetTypeID(v5) != TypeID)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21076D000, logger, v8, "received unexpected data", v10, 2u);
    }
  }
  xpc_release(v4);
  return v5;
}

CFPropertyListRef __CNCopySupportedInterfaces()
{
  int CaptivePort = FindCaptivePort();
  int v2 = 0;
  if ((CaptivePort - 1) > 0xFFFFFFFD) {
    return 0;
  }
  memset(length, 0, sizeof(length));
  if (!CopySupportedInterfaces(CaptivePort, &length[1], length, &v2)) {
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  }
  CFPropertyListRef result = 0;
  if (!v2) {
    return MIGUnserializeAndVMDealloc(*(UInt8 **)&length[1], length[0]);
  }
  return result;
}

CFDataRef CaptiveCopyWiFiLandingPageURL(void *a1)
{
  int v10 = 0;
  bytes = 0;
  unsigned int v8 = 0;
  int CaptivePort = CaptiveCopyWiFiLandingPageURL_server;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    if (!CaptivePort)
    {
      int CaptivePort = FindCaptivePort();
      CaptiveCopyWiFiLandingPageURL_server = CaptivePort;
      if (!CaptivePort) {
        return 0;
      }
    }
    if (!CopyLandingPageURL(CaptivePort, &bytes, &v8, a1, &v10)) {
      break;
    }
    int CaptivePort = 0;
    CaptiveCopyWiFiLandingPageURL_server = 0;
    if ((v4 & 1) == 0) {
      return 0;
    }
  }
  if (!bytes) {
    return 0;
  }
  CFDataRef v5 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, v8);
  MEMORY[0x216671360](*MEMORY[0x263EF8960], bytes, v8);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v5 && CFGetTypeID(v5) != TypeID)
  {
    CFRelease(v5);
    return 0;
  }
  return v5;
}

BOOL CNUserInteractionIsRequired()
{
  int CaptivePort = FindCaptivePort();
  uint64_t v1 = 0;
  int v6 = 0;
  int v5 = 0;
  if ((CaptivePort - 1) <= 0xFFFFFFFD)
  {
    int IsRequired = UserInteractionIsRequired(CaptivePort, &v6, &v5);
    return !(IsRequired | v6) && v5 == 1;
  }
  return v1;
}

uint64_t CNEnableWebSheetLaunch()
{
  if (CNEnableWebSheetLaunch_sc_interface)
  {
    CFArrayRef v0 = 0;
  }
  else
  {
    CFArrayRef v2 = (const __CFArray *)__CNCopySupportedInterfaces();
    CFArrayRef v0 = v2;
    if (!v2 || !CFArrayGetCount(v2))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v6)) {
        goto LABEL_17;
      }
      *(_WORD *)CFAllocatorRef v12 = 0;
      int v7 = "CNCopySupportedInterfaces() returned NULL";
      unsigned int v8 = v12;
      goto LABEL_16;
    }
    CFArrayGetValueAtIndex(v0, 0);
    CNEnableWebSheetLaunch_sc_interface = _SCNetworkInterfaceCreateWithBSDName();
    if (!CNEnableWebSheetLaunch_sc_interface)
    {
      BOOL v3 = mysyslog_get_logger();
      os_log_type_t v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21076D000, v3, v4, "_SCNetworkInterfaceCreateWithBSDName() returned NULL", buf, 2u);
      }
      uint64_t v1 = 0;
      goto LABEL_18;
    }
  }
  if (SCNetworkInterfaceSetAdvisory())
  {
    uint64_t v1 = 1;
    if (!v0) {
      return v1;
    }
    goto LABEL_18;
  }
  logger = mysyslog_get_logger();
  os_log_type_t v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    __int16 v10 = 0;
    int v7 = "SCNetworkInterfaceSetAdvisory failed";
    unsigned int v8 = (uint8_t *)&v10;
LABEL_16:
    _os_log_impl(&dword_21076D000, logger, v6, v7, v8, 2u);
  }
LABEL_17:
  uint64_t v1 = 0;
  if (v0) {
LABEL_18:
  }
    CFRelease(v0);
  return v1;
}

BOOL CNSetCaptivePortalAuthenticationCredentials(const __CFString *a1, const __CFString *a2, const __CFData *a3, uint64_t a4, const __CFString *a5)
{
  int CaptivePort = FindCaptivePort();
  BOOL v10 = 0;
  if (!a3 || (CaptivePort + 1) < 2) {
    return v10;
  }
  if (!CFDataGetLength(a3)) {
    return 0;
  }
  if (a2 && CFStringGetLength(a2) >= 1)
  {
    int v11 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a2, 0x400uLL);
    if (!a1) {
      goto LABEL_12;
    }
  }
  else
  {
    int v11 = &unk_210779212;
    if (!a1)
    {
LABEL_12:
      CFAllocatorRef v12 = &unk_210779212;
      goto LABEL_13;
    }
  }
  if (CFStringGetLength(a1) < 1) {
    goto LABEL_12;
  }
  CFAllocatorRef v12 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, 0x400uLL);
LABEL_13:
  if (a5)
  {
    if (CFStringGetLength(a5) < 1) {
      uint32_t v13 = &unk_210779212;
    }
    else {
      uint32_t v13 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], a5, 0x400uLL);
    }
  }
  else
  {
    uint32_t v13 = &unk_210779212;
  }
  BytePtr = CFDataGetBytePtr(a3);
  BOOL v10 = 0;
  if (v11 && BytePtr && v12 && v13)
  {
    CFDataGetLength(a3);
    BOOL v10 = AddAccount() == 0;
  }
  if (v11 != &unk_210779212 && v11) {
    free(v11);
  }
  if (v12 != &unk_210779212 && v12) {
    free(v12);
  }
  if (v13 != &unk_210779212 && v13) {
    free(v13);
  }
  return v10;
}

uint64_t CNPurgeCaptivePortalAuthenticationCredentials(CFStringRef theString)
{
  CFStringRef v1 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString)
      && (int CaptivePort = FindCaptivePort(), (CaptivePort - 1) <= 0xFFFFFFFD))
    {
      int v3 = CaptivePort;
      os_log_type_t v4 = CFStringMallocCString((const __CFAllocator *)*MEMORY[0x263EFFB08], v1, 0x400uLL);
      if (v4)
      {
        int v5 = v4;
        unsigned int Length = CFStringGetLength(v1);
        CFStringRef v1 = (const __CFString *)(PurgeAccountRecord(v3, (uint64_t)v5, Length) == 0);
        free(v5);
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return (uint64_t)v1;
}

uint64_t CaptiveInitOnce()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1.__sig = 0;
  *(void *)v1.__opaque = 0;
  __kCNProberCFTypeID TypeID = _CFRuntimeRegisterClass();
  pthread_mutexattr_init(&v1);
  pthread_mutex_init(&__captiveLock, &v1);
  uint64_t result = pthread_mutexattr_destroy(&v1);
  sMachParams = (uint64_t)CNSClient_server;
  dword_267750098 = dword_26C2A0950;
  return result;
}

CFStringRef __CNProberSerializeDebug(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"CNProberRef: %p, callback=%p context:%p", a1, *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t setCaptiveIsPresentOnce()
{
  memset(&v1, 0, sizeof(v1));
  uint64_t result = stat("/System/Library/SystemConfiguration/CaptiveNetworkSupport.bundle", &v1);
  if (result) {
    sCaptiveIsPresent = 1;
  }
  return result;
}

void MachServerCallback(uint64_t a1, mach_msg_header_t *a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v6 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], *(unsigned int *)(a4 + 8), 0);
  (*(void (**)(mach_msg_header_t *, mach_msg_header_t *))a4)(a2, v6);
  if ((v6->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v6[1].msgh_remote_port;
    if (msgh_remote_port == -305) {
      goto LABEL_11;
    }
    if (msgh_remote_port)
    {
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (v6->msgh_remote_port)
  {
    if ((v6->msgh_bits & 0x1F) == 0x12) {
      mach_msg_option_t v8 = 17;
    }
    else {
      mach_msg_option_t v8 = 1;
    }
    if ((mach_msg(v6, v8, v6->msgh_size, 0, 0, 0, 0) - 268435459) > 1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((v6->msgh_bits & 0x80000000) != 0) {
LABEL_10:
  }
    mach_msg_destroy(v6);
LABEL_11:
  CFAllocatorDeallocate(0, v6);
}

CFTypeRef MIGCFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  int v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3) {
    return 0;
  }
  os_log_type_t v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFWriteStreamClose(v4);
    CFTypeRef v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef MIGUnserializeAndVMDealloc(UInt8 *bytes, CFIndex length)
{
  CFPropertyListRef v2 = 0;
  if (bytes && length)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v5 = length;
    CFDataRef v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    if (v6)
    {
      CFDataRef v7 = v6;
      CFPropertyListRef v2 = CFPropertyListCreateWithData(v4, v6, 0, 0, 0);
      CFRelease(v7);
    }
    else
    {
      CFPropertyListRef v2 = 0;
    }
    MEMORY[0x216671360](*MEMORY[0x263EF8960], bytes, v5);
  }
  return v2;
}

CFDataRef MIGSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  CFDataRef result = (const __CFData *)MIGCFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
  if (result)
  {
    CFDataRef v6 = result;
    dataCnt = 0;
    *a3 = CFDataGetLength(result);
    vm_map_read_t v7 = *MEMORY[0x263EF8960];
    BytePtr = CFDataGetBytePtr(v6);
    int v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    CFDataRef result = (const __CFData *)(v9 == 0);
    if (v9) {
      *a2 = 0;
    }
    *a3 = dataCnt;
  }
  return result;
}

os_log_t mysyslog_init_logger(os_log_t result)
{
  if (result <= 3 && !S_captive_logger)
  {
    CFDataRef result = os_log_create("com.apple.captive", S_captive_os_log_categories[result]);
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

os_log_t mysyslog_get_logger()
{
  os_log_t result = (os_log_t)S_captive_logger;
  if (!S_captive_logger)
  {
    os_log_t result = os_log_create("com.apple.captive", "Framework");
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateVMData(CFPropertyListRef propertyList, _DWORD *a2)
{
  vm_address_t address = 0;
  *a2 = 0;
  CFDataRef result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    CFDataRef v4 = result;
    int Length = CFDataGetLength(result);
    if (!vm_allocate(*MEMORY[0x263EF8960], &address, Length, 1))
    {
      CFDataRef v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateWithBytePtrAndLength(UInt8 *bytes, int a2)
{
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, bytes, a2, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (result)
  {
    CFDataRef v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0;
  }
  if (a2) {
    return CFEqual(a1, a2);
  }
  return 0;
}

CFStringRef my_CFUUIDStringCreate(const __CFAllocator *a1)
{
  CFUUIDRef v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void my_CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
}

void merge_dict_applier(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

CFArrayRef my_CFArrayContainsStringsOnly(const __CFArray *result)
{
  unsigned __int8 context = 1;
  if (result)
  {
    CFArrayRef v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.location = 0;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)CheckIsString, &context);
    return (const __CFArray *)context;
  }
  return result;
}

CFTypeID CheckIsString(const void *a1, unsigned char *a2)
{
  CFTypeID result = CFStringGetTypeID();
  if (!a1 || (v5 = result, CFTypeID result = CFGetTypeID(a1), result != v5)) {
    *a2 = 0;
  }
  return result;
}

uint64_t my_CFArrayContainsAnyArrayValues(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result = 0;
  if (theArray && a2)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v7 = v6;
      CFIndex v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.location = 0;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex)) {
          break;
        }
        if (Count == ++v8) {
          return 0;
        }
      }
      return 1;
    }
  }
  return result;
}

void my_FieldSetRetainedCFType(const void **a1, CFTypeRef cf)
{
  CFPropertyListRef v4 = *a1;
  if (cf) {
    CFRetain(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
  *a1 = cf;
}

uint64_t my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  Value = CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return a3;
  }
  return CFBooleanGetValue((CFBooleanRef)Value);
}

uint64_t my_CFArrayPointerAddValue(CFArrayRef *a1, const void *a2)
{
  CFArrayRef v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.location = 0;
    if (CFArrayContainsValue(v3, v7, a2)) {
      return 0;
    }
    Mutable = v3;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    *a1 = Mutable;
  }
  CFArrayAppendValue(Mutable, a2);
  return 1;
}

CFIndex my_CFArrayFindValue(const __CFArray *a1, const void *a2)
{
  if (!a1) {
    return -1;
  }
  v4.length = CFArrayGetCount(a1);
  v4.location = 0;
  return CFArrayGetFirstIndexOfValue(a1, v4, a2);
}

uint64_t my_CFArrayFindDictWithKeyAndValue(const __CFArray *a1, const void *a2, const void *a3)
{
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        int v11 = a3 == 0;
        if (!Value) {
          goto LABEL_7;
        }
        if (a3) {
          break;
        }
LABEL_8:
        if (v7 == ++v8) {
          return -1;
        }
      }
      int v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11) {
        return v8;
      }
      goto LABEL_8;
    }
  }
  return -1;
}

CFStringRef URLStringCopyHostName(CFStringRef URLString)
{
  if (!URLString) {
    return 0;
  }
  CFURLRef v1 = CFURLCreateWithString(0, URLString, 0);
  if (!v1) {
    return 0;
  }
  CFURLRef v2 = v1;
  CFStringRef v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

const void **CNNetworkCreate(const void *a1, const void *a2)
{
  CFRange v4 = (const void **)__CNNetworkAllocate();
  my_FieldSetRetainedCFType(v4 + 4, a2);
  if (a1) {
    v4[2] = CFRetain(a1);
  }
  return v4;
}

void *__CNNetworkAllocate()
{
  if (__CNNetworkRegisterClass_once != -1) {
    dispatch_once(&__CNNetworkRegisterClass_once, &__block_literal_global_0);
  }
  uint64_t result = (void *)_CFRuntimeCreateInstance();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

CFMutableDictionaryRef CNNetworkCopySerialization(uint64_t a1, int a2)
{
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 24);
  if (!v3 || !CFDictionaryGetCount(v3)) {
    return 0;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)(a1 + 24));
  CFMutableDictionaryRef v6 = MutableCopy;
  if (a2)
  {
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 16);
    if (v7) {
      my_CFDictionaryMergeDictionary(MutableCopy, v7);
    }
  }
  return v6;
}

CFDictionaryRef CNNetworkCopySerializationWithoutAnnotations(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16);
  if (v1) {
    return CFDictionaryCreateCopy(0, v1);
  }
  else {
    return 0;
  }
}

__CFArray *CNNetworkListCopySerialization(const __CFArray *a1)
{
  uint64_t Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFMutableDictionaryRef v6 = CNNetworkCopySerialization((uint64_t)ValueAtIndex, 1);
      if (v6)
      {
        CFMutableDictionaryRef v7 = v6;
        CFArrayAppendValue(Mutable, v6);
        CFRelease(v7);
      }
    }
  }
  return Mutable;
}

CFArrayRef CNNetworkListCreate(const void *a1, const void *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  uint64_t Count = CFArrayGetCount((CFArrayRef)a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
      int v9 = CNNetworkCreate(ValueAtIndex, a2);
      if (v9)
      {
        CFRange v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
    }
  }
  if (CFArrayGetCount(Mutable)) {
    CFArrayRef Copy = CFArrayCreateCopy(0, Mutable);
  }
  else {
    CFArrayRef Copy = 0;
  }
  CFRelease(Mutable);
  return Copy;
}

uint64_t CNNetworkGetInterfaceName(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t CNNetworkGetTypeID()
{
  if (__CNNetworkRegisterClass_once != -1) {
    dispatch_once(&__CNNetworkRegisterClass_once, &__block_literal_global_0);
  }
  return __kCNNetworkTypeID;
}

void CNNetworkSetCaptive(uint64_t a1, int a2)
{
  CFURLRef v2 = (void **)MEMORY[0x263EFFB40];
  if (!a2) {
    CFURLRef v2 = (void **)MEMORY[0x263EFFB38];
  }
  CNNetworkSetProperty(a1, @"IsCaptive", *v2);
}

void CNNetworkSetProperty(uint64_t a1, void *key, void *value)
{
  Mutable = *(__CFDictionary **)(a1 + 24);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 24) = Mutable;
  }
  CFDictionarySetValue(Mutable, key, value);
}

void CNNetworkSetConfidence(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CNNetworkSetProperty(a1, @"Confidence", v3);
  CFRelease(v3);
}

CFDictionaryRef CNNetworkGetPluginBundleID(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, @"PluginBundleID");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef CNNetworkGetSSIDString(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, @"SSIDString");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef CNNetworkGetSSID(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, @"SSID");
    CFTypeID TypeID = CFDataGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef CNNetworkGetBSSID(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    Value = CFDictionaryGetValue(result, @"BSSID");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CNNetworkIsProtected(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16);
  if (!v1) {
    return 0;
  }
  Value = CFDictionaryGetValue(v1, @"IsProtected");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  return CFBooleanGetValue((CFBooleanRef)Value);
}

double CNNetworkGetSignalStrength(uint64_t a1)
{
  double valuePtr = 0.0;
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16);
  double v2 = 0.0;
  if (v1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"SignalStrength");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, kCFNumberDoubleType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v2;
}

CFBooleanRef CNNetworkWasAutoJoined(uint64_t a1)
{
  CFBooleanRef result = _CNNetworkWasAutoJoined(a1);
  if (result)
  {
    return (const __CFBoolean *)CFBooleanGetValue(result);
  }
  return result;
}

CFDictionaryRef _CNNetworkWasAutoJoined(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    CFNumberRef Value = CFDictionaryGetValue(result, @"WasAutoJoined");
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CNNetworkWasJustJoined(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16);
  if (!v1) {
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue(v1, @"WasJustJoined");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0;
  }
  return CFBooleanGetValue((CFBooleanRef)Value);
}

void CNNetworkSetPassword(uint64_t a1, void *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (a2 && CFGetTypeID(a2) == TypeID && CNNetworkIsProtected(a1) == 1)
  {
    CNNetworkSetProperty(a1, @"Password", a2);
  }
}

CFDictionaryRef CNNetworkGetPassword(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    CFNumberRef Value = CFDictionaryGetValue(result, @"Password");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        return (const __CFDictionary *)Value;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *CNNetworkCopyPluginNames(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 16);
  if (!v1) {
    return 0;
  }
  CFNumberRef Value = CFDictionaryGetValue(v1, @"PluginNames");
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFRetain(Value);
      return Value;
    }
    return 0;
  }
  return Value;
}

CFDictionaryRef CNNetworkIsChosenPlugin(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(result, @"IsChosenPlugin");
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID) {
      return (const __CFDictionary *)(CFBooleanGetValue(Value) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *CNNetworkCreateWithSSIDAndBSSID(const void *a1, const void *a2)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1) {
    return 0;
  }
  if (CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  CFTypeID v5 = CFStringGetTypeID();
  if (!a2 || CFGetTypeID(a2) != v5) {
    return 0;
  }
  CFMutableDictionaryRef v6 = __CNNetworkAllocate();
  keys[0] = @"SSIDString";
  keys[1] = @"BSSID";
  values[0] = (void *)a1;
  values[1] = (void *)a2;
  v6[2] = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return v6;
}

void __CNNetworkDeallocate(void *a1)
{
  double v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  CFNumberRef v3 = (const void *)a1[3];
  if (v3)
  {
    CFRelease(v3);
    a1[3] = 0;
  }
  CFRange v4 = (const void *)a1[4];
  if (v4)
  {
    CFRelease(v4);
    a1[4] = 0;
  }
}

__CFString *__CNNetworkCopyDebugDesc(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFBooleanRef v3 = _CNNetworkWasAutoJoined((uint64_t)a1);
  if (v3)
  {
    if (CFBooleanGetValue(v3)) {
      CFRange v4 = "[Auto-Join] ";
    }
    else {
      CFRange v4 = "[User-Join] ";
    }
  }
  else
  {
    CFRange v4 = (const char *)&unk_210779212;
  }
  Mutable = CFStringCreateMutable(v2, 0);
  CFDictionaryRef SSIDString = CNNetworkGetSSIDString((uint64_t)a1);
  CFDictionaryRef BSSID = CNNetworkGetBSSID((uint64_t)a1);
  if (CNNetworkIsProtected((uint64_t)a1)) {
    CFIndex v8 = "protected";
  }
  else {
    CFIndex v8 = "open";
  }
  double SignalStrength = CNNetworkGetSignalStrength((uint64_t)a1);
  CFStringAppendFormat(Mutable, 0, @"<CNNetwork SSID %@ BSSID %@ [%s] [signal %g] %s%p>", SSIDString, BSSID, v8, *(void *)&SignalStrength, v4, a1);
  return Mutable;
}

uint64_t _CNPluginGetQueue()
{
  return ServerConnectionGetHandlerQueue(*(void *)G_plugin);
}

void _CNPluginProvideResponse(const __CFDictionary *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 && *(void *)(G_plugin + 24))
  {
    CFBooleanRef Value = CFDictionaryGetValue(a1, @"UniqueID");
    CFArrayRef v3 = *(const __CFArray **)(G_plugin + 24);
    if (!v3
      || (v12.length = CFArrayGetCount(v3),
          v12.location = 0,
          FirstIndexOfCFBooleanRef Value = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(G_plugin + 24), v12, Value),
          FirstIndexOfValue == -1))
    {
      logger = mysyslog_get_logger();
      os_log_type_t v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        int v8 = 138412290;
        CFDictionaryRef v9 = a1;
        _os_log_impl(&dword_21076D000, logger, v7, "Ignoring stale command response %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(G_plugin + 24), FirstIndexOfValue);
      uint64_t v5 = *(void *)G_plugin;
      ServerConnectionProvideResponse(v5, a1);
    }
  }
}

BOOL CNPluginRegister(const void *a1, NSObject *a2, const void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  values = 0;
  if (!a3) {
    return 0;
  }
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a1) != TypeID)
    {
      logger = mysyslog_get_logger();
      os_log_type_t v16 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(logger, v16);
      if (!result) {
        return result;
      }
      *(_WORD *)buf = 0;
      CFRange v12 = "CNPluginRegister: 'options' is not a dictionary";
      BOOL v17 = logger;
      os_log_type_t v18 = v16;
      uint32_t v19 = 2;
      goto LABEL_18;
    }
    CFBooleanRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a1, @"DisplayName");
    values = Value;
    if (Value)
    {
      CFTypeID v8 = CFStringGetTypeID();
      if (CFGetTypeID(Value) != v8)
      {
        CFDictionaryRef v9 = mysyslog_get_logger();
        os_log_type_t v10 = _SC_syslog_os_log_mapping();
        BOOL result = os_log_type_enabled(v9, v10);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 138412290;
        v24 = @"DisplayName";
        CFRange v12 = "CNPluginRegister: %@ property must be a string";
        goto LABEL_17;
      }
    }
    if (CFDictionaryGetCount((CFDictionaryRef)a1) >= 2)
    {
      CFDictionaryRef v9 = mysyslog_get_logger();
      os_log_type_t v10 = _SC_syslog_os_log_mapping();
      BOOL result = os_log_type_enabled(v9, v10);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 138412290;
      v24 = @"DisplayName";
      CFRange v12 = "CNPluginRegister: 'options' contains properties other than %@";
LABEL_17:
      BOOL v17 = v9;
      os_log_type_t v18 = v10;
      uint32_t v19 = 12;
LABEL_18:
      _os_log_impl(&dword_21076D000, v17, v18, v12, buf, v19);
      return 0;
    }
  }
  else
  {
    CFBooleanRef Value = 0;
  }
  if (G_plugin) {
    return 0;
  }
  uint32_t v13 = malloc_type_malloc(0x20uLL, 0xA00400A0658E3uLL);
  G_plugin = (uint64_t)v13;
  *uint32_t v13 = 0u;
  v13[1] = 0u;
  *((void *)v13 + 1) = a2;
  *(void *)(G_plugin + 16) = _Block_copy(a3);
  if (Value) {
    CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)&kCNPluginOptionDisplayName, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  else {
    CFDictionaryRef v14 = 0;
  }
  uint64_t v20 = ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", 3, v14, &__block_literal_global_1, 0);
  uint64_t v21 = G_plugin;
  *(void *)G_plugin = v20;
  if (v14)
  {
    CFRelease(v14);
    uint64_t v21 = G_plugin;
    uint64_t v20 = *(void *)G_plugin;
  }
  if (v20)
  {
    ServerConnectionResume(v20);
    dispatch_retain(a2);
    return 1;
  }
  else
  {
    _Block_release(*(const void **)(v21 + 16));
    free((void *)G_plugin);
    BOOL result = 0;
    G_plugin = 0;
  }
  return result;
}

void __CNPluginRegister_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a3 && CFGetTypeID(a3) == TypeID && (CFIndex v5 = CFArrayGetCount(a3)) != 0)
  {
    CFIndex v6 = v5;
    CFArrayRef v7 = *(const __CFArray **)(G_plugin + 24);
    if (v7) {
      CFIndex Count = CFArrayGetCount(v7);
    }
    else {
      CFIndex Count = 0;
    }
    range_8 = CFArrayCreateMutable(0, v6, MEMORY[0x263EFFF70]);
    if (v6 >= 1)
    {
      for (CFIndex i = 0; v6 != i; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, i);
        CFTypeID v15 = CFDictionaryGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v15)
        {
          CFBooleanRef Value = CFDictionaryGetValue(ValueAtIndex, @"UniqueID");
          CFTypeID v17 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v17)
          {
            if (!Count
              || (v40.location = 0,
                  v40.length = Count,
                  !CFArrayContainsValue(*(CFArrayRef *)(G_plugin + 24), v40, Value)))
            {
              os_log_type_t v18 = CNPluginCommandCreate(ValueAtIndex);
              if (!v18)
              {
                logger = mysyslog_get_logger();
                os_log_type_t v28 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(logger, v28)) {
                  continue;
                }
                *(_DWORD *)v37 = 138412290;
                CFDictionaryRef v38 = ValueAtIndex;
                int v22 = logger;
                os_log_type_t v23 = v28;
                v24 = "CNPluginCommandCreate(%@) failed";
                goto LABEL_27;
              }
              uint32_t v19 = *(NSObject **)(G_plugin + 8);
              *(void *)buf = MEMORY[0x263EF8330];
              uint64_t v33 = 0x40000000;
              v34 = __CNPluginHandleCommandInfo_block_invoke;
              v35 = &__block_descriptor_tmp_10;
              v36 = v18;
              dispatch_async(v19, buf);
            }
            CFArrayAppendValue(range_8, Value);
          }
          else
          {
            uint64_t v25 = mysyslog_get_logger();
            os_log_type_t v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v25, v26))
            {
              *(_DWORD *)v37 = 138412290;
              CFDictionaryRef v38 = ValueAtIndex;
              int v22 = v25;
              os_log_type_t v23 = v26;
              v24 = "command contains no uniqueID %@";
              goto LABEL_27;
            }
          }
        }
        else
        {
          uint64_t v20 = mysyslog_get_logger();
          os_log_type_t v21 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)v37 = 138412290;
            CFDictionaryRef v38 = ValueAtIndex;
            int v22 = v20;
            os_log_type_t v23 = v21;
            v24 = "command is not a dictionary %@";
LABEL_27:
            _os_log_impl(&dword_21076D000, v22, v23, v24, v37, 0xCu);
          }
        }
      }
    }
    uint64_t v29 = G_plugin;
    v30 = *(const void **)(G_plugin + 24);
    if (v30)
    {
      CFRelease(v30);
      *(void *)(v29 + 24) = 0;
      uint64_t v29 = G_plugin;
    }
    *(void *)(v29 + 24) = range_8;
  }
  else
  {
    uint64_t v9 = G_plugin;
    os_log_type_t v10 = *(const void **)(G_plugin + 24);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(v9 + 24) = 0;
    }
    if (a3)
    {
      int v11 = mysyslog_get_logger();
      os_log_type_t v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21076D000, v11, v12, "given invalid command list", buf, 2u);
      }
    }
  }
}

uint64_t CNPluginLogoffNetwork(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  CFDictionaryRef v14 = &v13;
  uint64_t v15 = 0x2000000000;
  char v16 = 0;
  if (!G_plugin)
  {
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t InterfaceName = CNNetworkGetInterfaceName(a1);
  if (!InterfaceName) {
    goto LABEL_9;
  }
  CFArrayRef v3 = (void *)InterfaceName;
  os_log_type_t v21 = 0;
  CFDictionaryRef v19 = 0;
  CFDictionaryRef v4 = CNNetworkCopySerializationWithoutAnnotations(a1);
  int valuePtr = 1;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys[0] = @"Type";
  keys[1] = @"InterfaceName";
  values[0] = v5;
  values[1] = v3;
  if (v4)
  {
    os_log_type_t v21 = @"Network";
    CFDictionaryRef v19 = v4;
    CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFRelease(v4);
  }
  else
  {
    CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFRelease(v5);
  if (!v6)
  {
LABEL_9:
    logger = mysyslog_get_logger();
    os_log_type_t v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v10))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_21076D000, logger, v10, "Failed to create logoff control", (uint8_t *)keys, 2u);
    }
    goto LABEL_11;
  }
  HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)G_plugin);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  uint8_t v12[2] = __CNPluginLogoffNetwork_block_invoke;
  v12[3] = &unk_264138320;
  v12[4] = &v13;
  v12[5] = v6;
  dispatch_sync(HandlerQueue, v12);
  CFRelease(v6);
  uint64_t v8 = *((unsigned __int8 *)v14 + 24);
LABEL_12:
  _Block_object_dispose(&v13, 8);
  return v8;
}

BOOL __CNPluginLogoffNetwork_block_invoke(uint64_t a1)
{
  BOOL result = ServerConnectionProcessControl(*(void *)G_plugin, *(CFPropertyListRef *)(a1 + 40), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t CNPluginCopySupportedInterfaces()
{
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  os_log_type_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  uint64_t context = 0;
  if (G_plugin)
  {
    int valuePtr = 2;
    values = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    keys = @"Type";
    CFDictionaryRef v0 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFRelease(values);
    HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)G_plugin);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __CNPluginCopySupportedInterfaces_block_invoke;
    block[3] = &unk_264138348;
    block[5] = &v15;
    block[6] = v0;
    block[4] = &v11;
    dispatch_sync(HandlerQueue, block);
    CFRelease(v0);
    if (*((unsigned char *)v12 + 24))
    {
      CFAllocatorRef v2 = (const void *)v16[3];
      CFTypeID TypeID = CFArrayGetTypeID();
      if (v2)
      {
        if (CFGetTypeID(v2) == TypeID)
        {
          CFArrayRef v4 = (const __CFArray *)v16[3];
          v22.length = CFArrayGetCount(v4);
          v22.location = 0;
          CFArrayApplyFunction(v4, v22, (CFArrayApplierFunction)appendCommandAsNetwork, &context);
        }
      }
    }
    CFNumberRef v5 = v16;
    CFDictionaryRef v6 = (const void *)v16[3];
    if (v6)
    {
      CFRelease(v6);
      v5[3] = 0;
    }
    uint64_t v7 = context;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

BOOL __CNPluginCopySupportedInterfaces_block_invoke(uint64_t a1)
{
  BOOL result = ServerConnectionProcessControl(*(void *)G_plugin, *(CFPropertyListRef *)(a1 + 48), (const __CFData **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void appendCommandAsNetwork(const __CFDictionary *a1, __CFArray **a2)
{
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"InterfaceName");
  CFNumberRef v5 = CFDictionaryGetValue(a1, @"Network");
  CFDictionaryRef v6 = CNNetworkCreate(v5, Value);
  if (v6)
  {
    uint64_t v7 = v6;
    Mutable = *a2;
    if (!*a2)
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      *a2 = Mutable;
    }
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v7);
  }
}

void __CNPluginHandleCommandInfo_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  CFBooleanRef Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 16), @"UniqueID");
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFNumberRef v5 = (_DWORD *)(v2 + 24);
      CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, v5);
      if (v6)
      {
        CFNumberRef v7 = v6;
        *(_OWORD *)keys = xmmword_264138388;
        values[0] = Value;
        values[1] = v6;
        CFDictionaryRef v8 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v8)
        {
          CFDictionaryRef v9 = v8;
          HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)G_plugin);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __SendEvaluateAck_block_invoke;
          block[3] = &__block_descriptor_tmp_14;
          block[4] = v9;
          dispatch_sync(HandlerQueue, block);
          logger = mysyslog_get_logger();
          os_log_type_t v12 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v12))
          {
            String = CNPCommandTypeGetString(*v5);
            *(_DWORD *)buf = 136315138;
            char v16 = String;
            _os_log_impl(&dword_21076D000, logger, v12, "Delivery of %s command acknowledged", buf, 0xCu);
          }
          CFRelease(v7);
        }
        else
        {
          CFDictionaryRef v9 = v7;
        }
        CFRelease(v9);
      }
    }
  }
  (*(void (**)(void))(*(void *)(G_plugin + 16) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

BOOL __SendEvaluateAck_block_invoke(uint64_t a1)
{
  return ServerConnectionSendCmdAck(*(void *)G_plugin, *(CFPropertyListRef *)(a1 + 32));
}

uint64_t CNPluginCommandGetTypeID()
{
  if (__CNPluginCommandRegisterClass_once != -1) {
    dispatch_once(&__CNPluginCommandRegisterClass_once, &__block_literal_global_2);
  }
  return __kCNPluginCommandTypeID;
}

uint64_t CNPluginCommandGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

const void *CNPluginCommandGetInterfaceName(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"InterfaceName");
}

const void *CNPluginCommandBindReadStream(uint64_t a1, __CFReadStream *a2)
{
  BOOL result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"InterfaceName");
  if (result)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFC748];
    return (const void *)CFReadStreamSetProperty(a2, v4, result);
  }
  return result;
}

const void **CNPluginCommandCopyCurrentNetwork(uint64_t a1)
{
  CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Network");
  CFArrayRef v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"InterfaceName");
  return CNNetworkCreate(Value, v3);
}

CFArrayRef CNPluginCommandCopyNetworkList(uint64_t a1)
{
  CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"NetworkList");
  CFArrayRef v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"InterfaceName");
  return CNNetworkListCreate(Value, v3);
}

void *CNPluginCommandCreate(const __CFDictionary *a1)
{
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"Type");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) != TypeID) {
      return 0;
    }
    int valuePtr = 0;
    if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr)) {
      return 0;
    }
    CFBooleanRef Value = CFDictionaryGetValue(a1, @"UniqueID");
    CFTypeID v4 = CFStringGetTypeID();
    if (!Value) {
      return Value;
    }
    if (CFGetTypeID(Value) != v4) {
      return 0;
    }
    if (__CNPluginCommandRegisterClass_once != -1) {
      dispatch_once(&__CNPluginCommandRegisterClass_once, &__block_literal_global_2);
    }
    CFBooleanRef Value = (void *)_CFRuntimeCreateInstance();
    Value[2] = 0;
    Value[3] = 0;
    *((_DWORD *)Value + 6) = valuePtr;
    Value[2] = CFRetain(a1);
  }
  return Value;
}

void __CNPluginCommandDeallocate(uint64_t a1)
{
  CFDictionaryRef v1 = *(const void **)(a1 + 16);
  if (v1) {
    CFRelease(v1);
  }
}

__CFString *__CNPluginCommandCopyDebugDesc(unsigned int *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  String = CNPCommandTypeGetString(a1[6]);
  CFStringAppendFormat(Mutable, 0, @"<CNPluginCommand %s %p>", String, a1);
  return Mutable;
}

uint64_t CNPluginResponseGetTypeID()
{
  if (__CNPluginResponseRegisterClass_once != -1) {
    dispatch_once(&__CNPluginResponseRegisterClass_once, &__block_literal_global_3);
  }
  return __kCNPluginResponseTypeID;
}

uint64_t CNPluginResponseCreate(uint64_t a1, int a2)
{
  if (__CNPluginResponseRegisterClass_once != -1) {
    dispatch_once(&__CNPluginResponseRegisterClass_once, &__block_literal_global_3);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_DWORD *)(Instance + 16) = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(Instance + 20) = a2;
  CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"UniqueID");
  *(void *)(Instance + 24) = CFRetain(Value);
  return Instance;
}

void CNPluginResponseDeliver(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  keys[0] = @"UniqueID";
  CFAllocatorRef v2 = (void *)a1[3];
  CFMutableDictionaryRef v15 = 0;
  values[0] = v2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, (char *)a1 + 20);
  keys[1] = @"Result";
  values[1] = v3;
  uint64_t v4 = a1[4];
  if (v4)
  {
    CFMutableDictionaryRef v5 = CNNetworkCopySerialization(v4, 0);
    CFMutableDictionaryRef v6 = v5;
    if (v5)
    {
      uint64_t v18 = @"Network";
      CFMutableDictionaryRef v15 = v5;
      unsigned int v7 = 3;
      goto LABEL_6;
    }
  }
  else
  {
    CFMutableDictionaryRef v6 = 0;
  }
  unsigned int v7 = 2;
LABEL_6:
  CFArrayRef v8 = (const __CFArray *)a1[5];
  if (v8)
  {
    CFDictionaryRef v9 = CNNetworkListCopySerialization(v8);
    os_log_type_t v10 = v9;
    if (v9)
    {
      keys[v7] = @"NetworkList";
      values[v7++] = v9;
    }
  }
  else
  {
    os_log_type_t v10 = 0;
  }
  CFDictionaryRef v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v3) {
    CFRelease(v3);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v10) {
    CFRelease(v10);
  }
  Queue = _CNPluginGetQueue();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 0x40000000;
  v13[2] = __CNPluginResponseDeliver_block_invoke;
  v13[3] = &__block_descriptor_tmp_4;
  v13[4] = v11;
  dispatch_sync(Queue, v13);
}

void __CNPluginResponseDeliver_block_invoke(uint64_t a1)
{
  _CNPluginProvideResponse(*(const __CFDictionary **)(a1 + 32));
  CFAllocatorRef v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void CNPluginResponseSetNetworkList(uint64_t a1, CFTypeRef cf)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
    *(void *)(a1 + 40) = cf;
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
      int v8 = 136315138;
      CFDictionaryRef v9 = String;
      _os_log_impl(&dword_21076D000, logger, v6, "CNPluginResponseSetNetworkList() invalid for %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void CNPluginResponseSetNetwork(uint64_t a1, CFTypeRef cf)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v4 = *(const void **)(a1 + 32);
    if (v4) {
      CFRelease(v4);
    }
    *(void *)(a1 + 32) = cf;
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
      int v8 = 136315138;
      CFDictionaryRef v9 = String;
      _os_log_impl(&dword_21076D000, logger, v6, "CNPluginResponseSetNetwork() invalid for %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __CNPluginResponseDeallocate(void *a1)
{
  CFAllocatorRef v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  CFNumberRef v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
}

__CFString *__CNPluginResponseCopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  String = CNPCommandTypeGetString(*(_DWORD *)(a1 + 16));
  CFStringAppendFormat(Mutable, 0, @"<CNPluginResponse %s %p>", String, a1);
  if (*(void *)(a1 + 32) || *(void *)(a1 + 40))
  {
    CFStringAppend(Mutable, @"{");
    if (*(void *)(a1 + 32)) {
      CFStringAppendFormat(Mutable, 0, @"network = %@", *(void *)(a1 + 32));
    }
    if (*(void *)(a1 + 40)) {
      CFStringAppendFormat(Mutable, 0, @"networks = %@", *(void *)(a1 + 40));
    }
    CFStringAppend(Mutable, @"}");
  }
  return Mutable;
}

void CNWebSheetDone(int a1, void *a2)
{
  if (G_websheet && (uint64_t v4 = *(void **)(G_websheet + 8)) != 0)
  {
    CFDictionaryRef Response = createResponse(v4, a1, 1, a2);
    HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)G_websheet);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __CNWebSheetDone_block_invoke;
    block[3] = &__block_descriptor_tmp_5;
    block[4] = Response;
    dispatch_sync(HandlerQueue, block);
    CFRelease(Response);
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21076D000, logger, v8, "can't provide result", buf, 2u);
    }
  }
}

CFDictionaryRef createResponse(void *a1, int a2, int a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int valuePtr = a2;
  CFMutableDictionaryRef v15 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  keys = @"UniqueID";
  values = a1;
  CFNumberRef v12 = 0;
  CFMutableDictionaryRef v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (a3)
  {
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    CFMutableDictionaryRef v15 = @"Result";
    CFNumberRef v12 = v6;
    unsigned int v7 = 2;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFNumberRef v6 = 0;
  unsigned int v7 = 1;
  if (a4)
  {
LABEL_3:
    *(&keys + v7) = @"ResultOptions";
    *(&values + v7++) = a4;
  }
LABEL_4:
  CFDictionaryRef v8 = CFDictionaryCreate(*v5, (const void **)&keys, (const void **)&values, v7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

BOOL __CNWebSheetDone_block_invoke(uint64_t a1)
{
  return ServerConnectionProvideResponse(*(void *)G_websheet, *(CFPropertyListRef *)(a1 + 32));
}

uint64_t CNWebSheetProbeRequest(const void *a1)
{
  if (!G_websheet) {
    return 0;
  }
  CFRetain(a1);
  HandlerQueue = ServerConnectionGetHandlerQueue(*(void *)G_websheet);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __CNWebSheetProbeRequest_block_invoke;
  block[3] = &__block_descriptor_tmp_8_0;
  block[4] = a1;
  dispatch_async(HandlerQueue, block);
  return 1;
}

void __CNWebSheetProbeRequest_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = *(const void **)(a1 + 32);
  CFDictionaryRef theDict = 0;
  int valuePtr = 1;
  *(void *)keys = @"Type";
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(values);
  BOOL v4 = ServerConnectionProcessControl(*(void *)G_websheet, v3, &theDict);
  CFRelease(v3);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)keys = 0;
      _os_log_impl(&dword_21076D000, logger, v6, "ServerConnectionProcessControl failed", keys, 2u);
    }
  }
  CFDictionaryRef v7 = theDict;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v7)
  {
    if (CFGetTypeID(v7) == TypeID)
    {
      CFBooleanRef Value = CFDictionaryGetValue(theDict, @"ProbeID");
      CFTypeID v10 = CFStringGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v10)
        {
          Mutable = *(__CFDictionary **)(G_websheet + 48);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            *(void *)(G_websheet + 48) = Mutable;
          }
          CFDictionarySetValue(Mutable, Value, v2);
          CFNumberRef v12 = mysyslog_get_logger();
          os_log_type_t v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v12, v13))
          {
            *(_DWORD *)keys = 138412546;
            *(void *)&keys[4] = Value;
            *(_WORD *)&keys[12] = 2048;
            *(void *)&keys[14] = v2;
            _os_log_impl(&dword_21076D000, v12, v13, "%@ prober %p", keys, 0x16u);
          }
          BOOL v4 = 1;
        }
      }
    }
  }
  if (theDict)
  {
    CFRelease(theDict);
    CFDictionaryRef theDict = 0;
  }
  if (!v4)
  {
    char v14 = mysyslog_get_logger();
    os_log_type_t v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)keys = 0;
      _os_log_impl(&dword_21076D000, v14, v15, "Prober failed", keys, 2u);
    }
    CFRetain(v2);
    uint64_t v16 = *(__CFRunLoop **)(G_websheet + 40);
    uint64_t v17 = (const void *)*MEMORY[0x263EFFE78];
    *(void *)keys = MEMORY[0x263EF8330];
    *(void *)&keys[8] = 0x40000000;
    *(void *)&keys[16] = __startProbe_block_invoke;
    CFRange v22 = &__block_descriptor_tmp_29;
    os_log_type_t v23 = v2;
    CFRunLoopPerformBlock(v16, v17, keys);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t CNWebSheetRegister(uint64_t a1, uint64_t a2)
{
  if (G_websheet) {
    return 0;
  }
  CFMutableDictionaryRef v5 = malloc_type_malloc(0x38uLL, 0x10E00408C3A25E5uLL);
  G_websheet = (uint64_t)v5;
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  *((void *)v5 + 6) = 0;
  uint64_t v6 = ServerConnectionCreate((uint64_t)"com.apple.networking.captivenetworksupport", (uint64_t)"com.apple.networking.captivenetworksupport.startserver", 1, 0, &__block_literal_global_4, &__block_literal_global_14);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = G_websheet;
    *(void *)(G_websheet + 16) = a1;
    *(void *)(v8 + 24) = a2;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFTypeID v10 = (uint64_t *)G_websheet;
    *(void *)(G_websheet + 40) = Current;
    *CFTypeID v10 = v7;
    ServerConnectionResume(v7);
    return 1;
  }
  else
  {
    logger = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_21076D000, logger, v12, "ServerConnectionCreate failed", v13, 2u);
    }
    free((void *)G_websheet);
    uint64_t result = 0;
    G_websheet = 0;
  }
  return result;
}

void __CNWebSheetRegister_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a3 && CFGetTypeID(a3) == TypeID && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    CFIndex v6 = Count;
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      v52 = (const void *)*MEMORY[0x263EFFE78];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        CFTypeID v9 = CFDictionaryGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v9)
        {
          CFBooleanRef Value = (void *)CFDictionaryGetValue(ValueAtIndex, @"UniqueID");
          CFTypeID v11 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v11)
          {
            CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Type");
            CFTypeID v13 = CFNumberGetTypeID();
            if (v12 && CFGetTypeID(v12) == v13)
            {
              unsigned int valuePtr = 0;
              CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
              logger = mysyslog_get_logger();
              os_log_type_t v15 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(logger, v15))
              {
                uint64_t v16 = "<unknown>";
                if (valuePtr <= 3) {
                  uint64_t v16 = WebSheetCommandTypeGetString_strings[valuePtr];
                }
                LODWORD(buf) = 136315138;
                *(void *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_21076D000, logger, v15, "Command %s", (uint8_t *)&buf, 0xCu);
              }
              if (valuePtr != 1)
              {
                if (valuePtr == 2)
                {
                  int v54 = 7;
                  CFDictionaryRef v38 = *(const __CFDictionary **)(G_websheet + 48);
                  if (v38)
                  {
                    uint64_t v39 = CFDictionaryGetValue(v38, Value);
                    if (v39)
                    {
                      CFRange v40 = v39;
                      CFNumberRef v41 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"ProbeResult");
                      CFTypeID v42 = CFNumberGetTypeID();
                      if (v41 && CFGetTypeID(v41) == v42) {
                        CFNumberGetValue(v41, kCFNumberIntType, &v54);
                      }
                      v43 = mysyslog_get_logger();
                      os_log_type_t v44 = _SC_syslog_os_log_mapping();
                      if (os_log_type_enabled(v43, v44))
                      {
                        *(_DWORD *)v60 = 138412802;
                        v61 = Value;
                        __int16 v62 = 2048;
                        v63 = v40;
                        __int16 v64 = 1024;
                        int v65 = v54;
                        _os_log_impl(&dword_21076D000, v43, v44, "%@ prober %p COMPLETE result %d", v60, 0x1Cu);
                      }
                      CFRetain(v40);
                      v45 = *(__CFRunLoop **)(G_websheet + 40);
                      *(void *)&long long buf = MEMORY[0x263EF8330];
                      *((void *)&buf + 1) = 0x40000000;
                      v56 = __CNWebSheetHandleProbeResult_block_invoke;
                      v57 = &__block_descriptor_tmp_45;
                      v58 = v40;
                      int v59 = v54;
                      CFRunLoopPerformBlock(v45, v52, &buf);
                      CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
                      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(G_websheet + 48), Value);
                    }
                    else
                    {
                      v48 = mysyslog_get_logger();
                      os_log_type_t v49 = _SC_syslog_os_log_mapping();
                      if (os_log_type_enabled(v48, v49))
                      {
                        *(_DWORD *)v60 = 138412290;
                        v61 = Value;
                        p_long long buf = v60;
                        uint64_t v20 = v48;
                        os_log_type_t v21 = v49;
                        CFRange v22 = "can't find prober with ID %@";
                        uint32_t v23 = 12;
LABEL_21:
                        _os_log_impl(&dword_21076D000, v20, v21, v22, p_buf, v23);
                      }
                    }
                  }
                }
                else
                {
                  if (valuePtr == 3) {
                    exit(0);
                  }
                  uint64_t v17 = mysyslog_get_logger();
                  os_log_type_t v18 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v17, v18))
                  {
                    LODWORD(buf) = 67109120;
                    DWORD1(buf) = valuePtr;
                    p_long long buf = (uint8_t *)&buf;
                    uint64_t v20 = v17;
                    os_log_type_t v21 = v18;
                    CFRange v22 = "Unrecognized command %d";
                    uint32_t v23 = 8;
                    goto LABEL_21;
                  }
                }
                provideResponse(Value);
                goto LABEL_30;
              }
              v35 = CFDictionaryGetValue(ValueAtIndex, @"Info");
              CFTypeID v36 = CFDictionaryGetTypeID();
              if (v35 && CFGetTypeID(v35) == v36)
              {
                if (!*(void *)(G_websheet + 8))
                {
                  my_FieldSetRetainedCFType((const void **)(G_websheet + 8), Value);
                  CFRetain(v35);
                  v37 = *(__CFRunLoop **)(G_websheet + 40);
                  *(void *)&long long buf = MEMORY[0x263EF8330];
                  *((void *)&buf + 1) = 0x40000000;
                  v56 = __CNWebSheetPresentUI_block_invoke;
                  v57 = &__block_descriptor_tmp_41;
                  v58 = v35;
                  CFRunLoopPerformBlock(v37, v52, &buf);
                  CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
                }
                goto LABEL_30;
              }
              v46 = mysyslog_get_logger();
              os_log_type_t v47 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v46, v47))
              {
                *(_WORD *)v60 = 0;
                os_log_type_t v26 = v60;
                v27 = v46;
                os_log_type_t v28 = v47;
                uint64_t v29 = "websheet info is missing/invalid";
                uint32_t v34 = 2;
                goto LABEL_29;
              }
            }
            else
            {
              v32 = mysyslog_get_logger();
              os_log_type_t v33 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v32, v33))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = ValueAtIndex;
                os_log_type_t v26 = (uint8_t *)&buf;
                v27 = v32;
                os_log_type_t v28 = v33;
                uint64_t v29 = "command type missing or invalid in %@";
                goto LABEL_28;
              }
            }
          }
          else
          {
            v30 = mysyslog_get_logger();
            os_log_type_t v31 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v30, v31))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = ValueAtIndex;
              os_log_type_t v26 = (uint8_t *)&buf;
              v27 = v30;
              os_log_type_t v28 = v31;
              uint64_t v29 = "command contains no uniqueID %@";
              goto LABEL_28;
            }
          }
        }
        else
        {
          uint64_t v24 = mysyslog_get_logger();
          os_log_type_t v25 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v24, v25))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = ValueAtIndex;
            os_log_type_t v26 = (uint8_t *)&buf;
            v27 = v24;
            os_log_type_t v28 = v25;
            uint64_t v29 = "command is not a dictionary %@";
LABEL_28:
            uint32_t v34 = 12;
LABEL_29:
            _os_log_impl(&dword_21076D000, v27, v28, v29, v26, v34);
          }
        }
LABEL_30:
        ++v7;
      }
      while (v6 != v7);
    }
  }
  else
  {
    v50 = mysyslog_get_logger();
    os_log_type_t v51 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v50, v51))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21076D000, v50, v51, "No more commands to process", (uint8_t *)&buf, 2u);
    }
  }
}

void __CNWebSheetRegister_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4)) {
      goto LABEL_9;
    }
    __int16 v8 = 0;
    CFMutableDictionaryRef v5 = "Reconnect failed, exiting";
    CFIndex v6 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if (*(unsigned char *)(G_websheet + 32))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4)) {
      goto LABEL_9;
    }
    __int16 v7 = 0;
    CFMutableDictionaryRef v5 = "Server died, exiting";
    CFIndex v6 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl(&dword_21076D000, logger, v4, v5, v6, 2u);
LABEL_9:
    exit(0);
  }
  *(unsigned char *)(G_websheet + 32) = 1;
}

void __startProbe_block_invoke(uint64_t a1)
{
  CNProberProvideResult(*(void *)(a1 + 32), 7);
  CFAllocatorRef v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void provideResponse(void *a1)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  keys[1] = 0;
  keys[2] = 0;
  values[2] = 0;
  keys[0] = @"UniqueID";
  values[0] = a1;
  values[1] = 0;
  CFDictionaryRef v1 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  ServerConnectionProvideResponse(*(void *)G_websheet, v1);
  CFRelease(v1);
}

void __CNWebSheetPresentUI_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(G_websheet + 16))(*(void *)(G_websheet + 24), *(void *)(a1 + 32), 0);
  CFAllocatorRef v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void __CNWebSheetHandleProbeResult_block_invoke(uint64_t a1)
{
  CNProberProvideResult(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
  CFAllocatorRef v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

uint64_t ServerConnectionCreate(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4, const void *a5, const void *a6)
{
  kern_return_t v17;
  mach_error_t v18;
  NSObject *logger;
  os_log_type_t v20;
  char *v21;
  kern_return_t inserted;
  mach_error_t v23;
  NSObject *v24;
  os_log_type_t v25;
  char *v26;
  mach_port_name_t v27;
  mach_error_t v28;
  mach_error_t v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  NSObject *v35;
  void v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  mach_port_name_t name;
  int v43;
  uint8_t buf[4];
  char *v45;
  uint64_t v46;

  uint64_t v6 = 0;
  v46 = *MEMORY[0x263EF8340];
  CFDictionaryRef v38 = 0;
  uint64_t v39 = &v38;
  CFRange v40 = 0x2000000000;
  CFNumberRef v41 = 0;
  if (!G_conn)
  {
    G_conn = (uint64_t)malloc_type_malloc(0x60uLL, 0x10F0040ADC7DA84uLL);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (a4)
    {
      if (CFGetTypeID(a4) == TypeID) {
        CFDictionaryRef v14 = a4;
      }
      else {
        CFDictionaryRef v14 = 0;
      }
    }
    else
    {
      CFDictionaryRef v14 = 0;
    }
    uint64_t v15 = G_conn;
    *(_OWORD *)G_conn = 0u;
    *(_OWORD *)(v15 + 16) = 0u;
    *(_OWORD *)(v15 + 32) = 0u;
    *(_OWORD *)(v15 + 48) = 0u;
    *(_OWORD *)(v15 + 64) = 0u;
    *(_OWORD *)(v15 + 80) = 0u;
    *(void *)(v15 + 8) = a1;
    *(void *)(v15 + 16) = a2;
    *(_DWORD *)(v15 + 24) = a3;
    if (v14) {
      *(void *)(v15 + 32) = CFDictionaryCreateCopy(0, v14);
    }
    *(void *)uint64_t v15 = dispatch_queue_create("CommandHandler", 0);
    if (a5)
    {
      *(void *)(v15 + 64) = _Block_copy(a5);
      name = 0;
      uint64_t v16 = (ipc_space_t *)MEMORY[0x263EF8960];
      uint64_t v17 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name);
      if (v17)
      {
        os_log_type_t v18 = v17;
        logger = mysyslog_get_logger();
        uint64_t v20 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v20))
        {
          os_log_type_t v21 = mach_error_string(v18);
          *(_DWORD *)long long buf = 136315138;
          v45 = v21;
          _os_log_impl(&dword_21076D000, logger, v20, "mach_port_allocate() failed, %s", buf, 0xCu);
        }
      }
      inserted = mach_port_insert_right(*v16, name, name, 0x14u);
      if (inserted)
      {
        uint32_t v23 = inserted;
        uint64_t v24 = mysyslog_get_logger();
        os_log_type_t v25 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v24, v25))
        {
          os_log_type_t v26 = mach_error_string(v23);
          *(_DWORD *)long long buf = 136315138;
          v45 = v26;
          _os_log_impl(&dword_21076D000, v24, v25, "mach_port_insert_right failed, %s", buf, 0xCu);
        }
        v27 = 0;
      }
      else
      {
        v43 = 1;
        os_log_type_t v28 = MEMORY[0x216671200](*v16, name, 1, &v43, 1);
        if (v28)
        {
          uint64_t v29 = v28;
          v30 = mysyslog_get_logger();
          os_log_type_t v31 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v30, v31))
          {
            v32 = mach_error_string(v29);
            *(_DWORD *)long long buf = 136315138;
            v45 = v32;
            _os_log_impl(&dword_21076D000, v30, v31, "mach_port_set_attributes(MACH_PORT_LIMITS_INFO) failed, %s", buf, 0xCu);
          }
        }
        v27 = name;
      }
      *(_DWORD *)(v15 + 72) = v27;
    }
    if (a6) {
      *(void *)(v15 + 88) = _Block_copy(a6);
    }
    if (!*(void *)v15)
    {
      os_log_type_t v33 = mysyslog_get_logger();
      uint32_t v34 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_21076D000, v33, v34, "failed to allocate queue", buf, 2u);
      }
      if (!*(void *)v15)
      {
        free((void *)G_conn);
        goto LABEL_31;
      }
    }
    v35 = *(NSObject **)G_conn;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 0x40000000;
    v37[2] = __ServerConnectionCreate_block_invoke;
    v37[3] = &unk_264138520;
    uint8_t v37[4] = &v38;
    dispatch_sync(v35, v37);
    uint64_t v6 = G_conn;
    if (!*((unsigned char *)v39 + 24))
    {
      ServerConnectionDeallocate((dispatch_object_t *)G_conn);
LABEL_31:
      uint64_t v6 = 0;
      G_conn = 0;
    }
  }
  _Block_object_dispose(&v38, 8);
  return v6;
}

uint64_t __ServerConnectionCreate_block_invoke(uint64_t a1)
{
  uint64_t result = ServerConnectionConnect(G_conn, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void ServerConnectionDeallocate(dispatch_object_t *a1)
{
  CFAllocatorRef v2 = *a1;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ServerConnectionDeallocate_block_invoke;
    block[3] = &__block_descriptor_tmp_9_0;
    block[4] = a1;
    dispatch_sync(v2, block);
    dispatch_release(*a1);
  }
  else
  {
    ServerConnectionDeallocateSync((uint64_t)a1);
  }
  free(a1);
}

void ServerConnectionRelease(dispatch_object_t *a1)
{
  G_conn = 0;
}

void ServerConnectionResume(uint64_t a1)
{
  uintptr_t v1 = *(unsigned int *)(a1 + 72);
  if (v1)
  {
    CFDictionaryRef v3 = dispatch_source_create(MEMORY[0x263EF83C8], v1, 0, *(dispatch_queue_t *)a1);
    *(void *)(a1 + 80) = v3;
    if (v3)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __add_signal_port_source_block_invoke;
      handler[3] = &__block_descriptor_tmp_10_1;
      int v8 = v1;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 0x40000000;
      v6[2] = __add_signal_port_source_block_invoke_2;
      v6[3] = &__block_descriptor_tmp_11_0;
      v6[4] = a1;
      dispatch_source_set_event_handler(v3, v6);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 80), handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 80));
    }
    else
    {
      logger = mysyslog_get_logger();
      os_log_type_t v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_21076D000, logger, v5, "failed to allocate signal_source", (uint8_t *)v6, 2u);
      }
    }
  }
}

uint64_t ServerConnectionGetHandlerQueue(uint64_t a1)
{
  return *(void *)a1;
}

BOOL ServerConnectionProvideResponse(uint64_t a1, CFPropertyListRef propertyList)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!propertyList) {
    return 0;
  }
  int __errnum = 0;
  CFDataRef Data = my_CFPropertyListCreateData(propertyList);
  LODWORD(a1) = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(Data);
  mach_error_t v6 = ConnectionProvideResponse(a1, (uint64_t)BytePtr, Length, &__errnum);
  CFRelease(Data);
  if (v6 | __errnum)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v8);
    if (!result) {
      return result;
    }
    CFTypeID v10 = mach_error_string(v6);
    CFTypeID v11 = strerror(__errnum);
    *(_DWORD *)long long buf = 136315394;
    CFDictionaryRef v14 = v10;
    __int16 v15 = 2080;
    uint64_t v16 = v11;
    _os_log_impl(&dword_21076D000, logger, v8, "ConnectionProvideResponse failed, %s, %s", buf, 0x16u);
    return 0;
  }
  return 1;
}

BOOL ServerConnectionSendCmdAck(uint64_t a1, CFPropertyListRef propertyList)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!propertyList) {
    return 0;
  }
  int __errnum = 0;
  CFDataRef Data = my_CFPropertyListCreateData(propertyList);
  LODWORD(a1) = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(Data);
  mach_error_t v6 = ConnectionSendCmdAck(a1, (uint64_t)BytePtr, Length, &__errnum);
  CFRelease(Data);
  if (v6 | __errnum)
  {
    logger = mysyslog_get_logger();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v8);
    if (!result) {
      return result;
    }
    CFTypeID v10 = mach_error_string(v6);
    CFTypeID v11 = strerror(__errnum);
    *(_DWORD *)long long buf = 136315394;
    CFDictionaryRef v14 = v10;
    __int16 v15 = 2080;
    uint64_t v16 = v11;
    _os_log_impl(&dword_21076D000, logger, v8, "ServerConnectionProvideAck failed, %s, %s", buf, 0x16u);
    return 0;
  }
  return 1;
}

BOOL ServerConnectionProcessControl(uint64_t a1, CFPropertyListRef propertyList, const __CFData **a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  if (!propertyList) {
    return 0;
  }
  *(void *)int __errnum = 0;
  bytes = 0;
  CFDataRef Data = my_CFPropertyListCreateData(propertyList);
  mach_port_t v6 = *(_DWORD *)(a1 + 56);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(Data);
  mach_error_t v9 = ConnectionProcessControl(v6, (uint64_t)BytePtr, Length, &bytes, &__errnum[1], __errnum);
  CFRelease(Data);
  if (v9 | __errnum[0])
  {
    logger = mysyslog_get_logger();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    BOOL result = os_log_type_enabled(logger, v11);
    if (!result) {
      return result;
    }
    CFTypeID v13 = mach_error_string(v9);
    CFDictionaryRef v14 = strerror(__errnum[0]);
    *(_DWORD *)long long buf = 136315394;
    os_log_type_t v18 = v13;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_impl(&dword_21076D000, logger, v11, "ConnectionProcessControl failed, %s, %s", buf, 0x16u);
    return 0;
  }
  if (bytes)
  {
    if (a3) {
      *a3 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, __errnum[1]);
    }
    MEMORY[0x216671360](*MEMORY[0x263EF8960]);
  }
  return 1;
}

uint64_t ServerConnectionGetSessionPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

void ServerConnectionCleanup(uint64_t a1)
{
  CFAllocatorRef v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
  mach_port_name_t v3 = *(_DWORD *)(a1 + 40);
  if (v3)
  {
    mach_port_deallocate(*MEMORY[0x263EF8960], v3);
    *(_DWORD *)(a1 + 40) = 0;
  }
}

uint64_t __ServerConnectionConnect_block_invoke(uint64_t a1)
{
  ServerConnectionCleanup(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  return ServerConnectionConnect(v2, 1);
}

uint64_t __ServerConnectionRegisterForStartNotification_block_invoke(uint64_t a1, int a2)
{
  ServerConnectionConnect(*(void *)(a1 + 32), 1);
  return notify_cancel(a2);
}

void ServerConnectionDeallocateSync(uint64_t a1)
{
  ServerConnectionCleanup(a1);
  mach_port_deallocate(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 56));
  uint64_t v2 = *(const void **)(a1 + 64);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 72))
    {
      if (*(void *)(a1 + 80))
      {
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 80));
        dispatch_release(*(dispatch_object_t *)(a1 + 80));
        *(void *)(a1 + 80) = 0;
        uint64_t v2 = *(const void **)(a1 + 64);
      }
      *(_DWORD *)(a1 + 72) = 0;
    }
    _Block_release(v2);
    *(void *)(a1 + 64) = 0;
  }
  mach_port_name_t v3 = *(const void **)(a1 + 88);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(a1 + 88) = 0;
  }
  os_log_type_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
}

void __ServerConnectionDeallocate_block_invoke(uint64_t a1)
{
}

uint64_t __add_signal_port_source_block_invoke(uint64_t a1)
{
  return mach_port_mod_refs(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 32), 1u, -1);
}

void __add_signal_port_source_block_invoke_2()
{
  mach_msg_return_t v3;
  mach_error_t v4;
  NSObject *logger;
  os_log_type_t v6;
  mach_error_t CommandInfo;
  mach_error_t v8;
  NSObject *v9;
  os_log_type_t v10;
  char *v11;
  char *v12;
  CFDataRef v13;
  int __errnum[2];
  UInt8 *bytes;
  uint8_t buf[4];
  char *v17;
  mach_msg_header_t msg;
  uint64_t v19;

  uint64_t v0 = MEMORY[0x270FA5388]();
  __int16 v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 32);
  *(void *)int __errnum = 0;
  bytes = 0;
  mach_port_t v2 = *(_DWORD *)(v1 + 72);
  msg.mach_port_t msgh_remote_port = 0;
  msg.msgh_local_port = v2;
  *(void *)&msg.msgh_bits = 0x100000000000;
  msg.msgh_id = 0;
  mach_port_name_t v3 = mach_msg(&msg, 6, 0, 0x1000u, v2, 0, 0);
  if (v3)
  {
    os_log_type_t v4 = v3;
    logger = mysyslog_get_logger();
    mach_port_t v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v17 = mach_error_string(v4);
      _os_log_impl(&dword_21076D000, logger, v6, "mach_msg: %s", buf, 0xCu);
    }
  }
  CommandInfo = ConnectionGetCommandInfo(*(_DWORD *)(v1 + 56), &bytes, &__errnum[1], __errnum);
  if (CommandInfo | __errnum[0])
  {
    os_log_type_t v8 = CommandInfo;
    mach_error_t v9 = mysyslog_get_logger();
    CFTypeID v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_type_t v11 = mach_error_string(v8);
      CFNumberRef v12 = strerror(__errnum[0]);
      msg.msgh_bits = 136315394;
      *(void *)&msg.msgh_size = v11;
      LOWORD(msg.msgh_local_port) = 2080;
      *(void *)((char *)&msg.msgh_local_port + 2) = v12;
      _os_log_impl(&dword_21076D000, v9, v10, "ConnectionGetCommandInfo failed, %s, %s", (uint8_t *)&msg, 0x16u);
    }
  }
  else
  {
    if (bytes)
    {
      CFTypeID v13 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, __errnum[1]);
      MEMORY[0x216671360](*MEMORY[0x263EF8960], bytes, __errnum[1]);
    }
    else
    {
      CFTypeID v13 = 0;
    }
    (*(void (**)(void))(*(void *)(v1 + 64) + 16))();
    if (v13) {
      CFRelease(v13);
    }
  }
}

const char *CNPCommandTypeGetString(unsigned int a1)
{
  if (a1 <= 6) {
    return CNPCommandTypeGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPResultGetString(unsigned int a1)
{
  if (a1 <= 6) {
    return CNPResultGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPConfidenceGetString(unsigned int a1)
{
  if (a1 <= 2) {
    return CNPConfidenceGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

const char *CNPCaptiveDetectionTypeGetString(unsigned int a1)
{
  if (a1 <= 3) {
    return CNPCaptiveDetectionTypeGetString_strings[a1];
  }
  else {
    return "<unknown>";
  }
}

uint64_t CNScanListFilterStart(uint64_t a1, dispatch_object_t object, void *aBlock)
{
  uint64_t result = 0;
  if (!a1 && object && aBlock)
  {
    if (CNScanListFilterGet_once != -1) {
      dispatch_once(&CNScanListFilterGet_once, &__block_literal_global_5);
    }
    CNMonitorSetQueueAndHandler(CNScanListFilterGet_monitor, object, aBlock);
    return 1;
  }
  return result;
}

uint64_t CNScanListFilterStop()
{
  if (CNScanListFilterGet_once != -1) {
    dispatch_once(&CNScanListFilterGet_once, &__block_literal_global_5);
  }
  CNMonitorSetQueueAndHandler(CNScanListFilterGet_monitor, 0, 0);
  return 1;
}

_OWORD *__CNScanListFilterGet_block_invoke()
{
  uint64_t result = CNMonitorCreate(5, (uint64_t)CNScanListFilterHandleCommand, (uint64_t)CNScanListFilterCopyControl);
  CNScanListFilterGet_monitor = (uint64_t)result;
  return result;
}

void CNScanListFilterHandleCommand(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  CFBooleanRef Value = CFDictionaryGetValue(theDict, @"Type");
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID || !CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v12)) {
      return;
    }
    *(_DWORD *)long long buf = 138412290;
    CFDictionaryRef v24 = theDict;
    CFTypeID v13 = "command type invalid/missing in %@";
    CFDictionaryRef v14 = logger;
    os_log_type_t v15 = v12;
    uint32_t v16 = 12;
    goto LABEL_11;
  }
  if (valuePtr == 1)
  {
    mach_port_t v6 = CFDictionaryGetValue(theDict, @"InterfaceName");
    CFTypeID v7 = CFStringGetTypeID();
    if (v6 && CFGetTypeID(v6) == v7)
    {
      os_log_type_t v8 = CFDictionaryGetValue(theDict, @"NetworkList");
      CFArrayRef v9 = CNNetworkListCreate(v8, v6);
      if (v9)
      {
        CFArrayRef v10 = v9;
        CFRetain(v6);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 0x40000000;
        v21[2] = __CNScanListFilterHandleCommand_block_invoke;
        v21[3] = &__block_descriptor_tmp_9_1;
        v21[4] = a1;
        v21[5] = v6;
        v21[6] = v10;
        CNMonitorPerformBlock(a1, v21);
        return;
      }
      __int16 v19 = mysyslog_get_logger();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)long long buf = 0;
        CFTypeID v13 = "couldn't get the network list";
        goto LABEL_17;
      }
    }
    else
    {
      __int16 v19 = mysyslog_get_logger();
      os_log_type_t v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)long long buf = 0;
        CFTypeID v13 = "interface name is missing/invalid";
LABEL_17:
        CFDictionaryRef v14 = v19;
        os_log_type_t v15 = v20;
        uint32_t v16 = 2;
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v17 = mysyslog_get_logger();
    os_log_type_t v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v24) = valuePtr;
      CFTypeID v13 = "command type %d unrecognized";
      CFDictionaryRef v14 = v17;
      os_log_type_t v15 = v18;
      uint32_t v16 = 8;
LABEL_11:
      _os_log_impl(&dword_21076D000, v14, v15, v13, buf, v16);
    }
  }
}

CFDictionaryRef CNScanListFilterCopyControl(int a1)
{
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 2;
  }
  int valuePtr = v1;
  values = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys = @"Type";
  CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(values);
  return v2;
}

void __CNScanListFilterHandleCommand_block_invoke(uint64_t a1)
{
  Queue = CNMonitorGetQueue(*(void *)(a1 + 32));
  if (Queue)
  {
    mach_port_name_t v3 = Queue;
    dispatch_retain(Queue);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __CNScanListFilterHandleCommand_block_invoke_2;
    v5[3] = &__block_descriptor_tmp_8_1;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v3;
    long long v6 = *(_OWORD *)(a1 + 40);
    dispatch_async(v3, v5);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 40));
    os_log_type_t v4 = *(const void **)(a1 + 48);
    CFRelease(v4);
  }
}

void __CNScanListFilterHandleCommand_block_invoke_2(uint64_t a1)
{
  uint64_t Handler = CNMonitorGetHandler(*(void *)(a1 + 32));
  if (Handler)
  {
    uint64_t v3 = Handler;
    if (CNMonitorGetQueue(*(void *)(a1 + 32)) == *(void *)(a1 + 40)) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  os_log_type_t v4 = *(NSObject **)(a1 + 40);
  dispatch_release(v4);
}

uint64_t LogoffReply(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF80C8];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047703;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t AuthenticateUsingReply(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF80C8];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047705;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t CNSClient_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 28047706) >= 0xFFFFFFFC) {
    return (uint64_t)*(&CNSClientCNSClient_subsystem + 5 * (v1 - 28047702) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *_XLogoffReply(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  }
  else
  {
    uint64_t result = (_DWORD *)CNSClientLogoffReply();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XAuthenticateUsingReply(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  }
  else
  {
    uint64_t result = (_DWORD *)CNSClientAuthenticateUsingReply(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t CNSClient_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 28047706) >= 0xFFFFFFFC
    && (int v5 = (void (*)(void))*(&CNSClientCNSClient_subsystem + 5 * (v4 - 28047702) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t ParsePost()
{
  mach_port_name_t v0 = MEMORY[0x270FA5388]();
  int v3 = v2;
  int v5 = v4;
  CFTypeID v7 = v6;
  CFArrayRef v9 = v8;
  mach_port_name_t v10 = v0;
  uint64_t v42 = *MEMORY[0x263EF8340];
  memset(v41, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v40 = 0u;
  *((void *)&v40 + 1) = *MEMORY[0x263EF80C8];
  LODWORD(v41[0]) = v11;
  uint64_t v12 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v13 = mig_strncpy_zerofill((char *)v41 + 12, v1, 4096);
  }
  else {
    int v13 = mig_strncpy((char *)v41 + 12, v1, 4096);
  }
  DWORD1(v41[0]) = 0;
  DWORD2(v41[0]) = v13;
  uint64_t v14 = (v13 + 3) & 0xFFFFFFFC;
  int v15 = v14 + 68;
  uint32_t v16 = (char *)rcv_name + v14;
  uint64_t v17 = v16 - 4096;
  os_log_type_t v18 = v16 + 52;
  if (v12) {
    int v19 = mig_strncpy_zerofill(v18, v9, 4096);
  }
  else {
    int v19 = mig_strncpy(v18, v9, 4096);
  }
  *((_DWORD *)v17 + 1036) = v19;
  *((_DWORD *)v17 + 1035) = 0;
  uint64_t v20 = (v19 + 3) & 0xFFFFFFFC;
  int v21 = v15 + v20;
  CFRange v22 = &v17[v20];
  uint32_t v23 = v22 - 4096;
  CFDictionaryRef v24 = v22 + 4156;
  if (v12) {
    int v25 = mig_strncpy_zerofill(v24, v7, 4096);
  }
  else {
    int v25 = mig_strncpy(v24, v7, 4096);
  }
  *((_DWORD *)v23 + 2062) = v25;
  *((_DWORD *)v23 + 2061) = 0;
  uint64_t v26 = (v25 + 3) & 0xFFFFFFFC;
  int v27 = v21 + v26;
  os_log_type_t v28 = &v23[v26];
  uint64_t v29 = v28 - 4096;
  v30 = v28 + 8260;
  if (v12) {
    int v31 = mig_strncpy_zerofill(v30, v5, 4096);
  }
  else {
    int v31 = mig_strncpy(v30, v5, 4096);
  }
  *((_DWORD *)v29 + 3088) = v31;
  *((_DWORD *)v29 + 3087) = 0;
  mach_msg_size_t v32 = v27 + ((v31 + 3) & 0xFFFFFFFC);
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = v10;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v40 = 0x1ABF95600000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v34 = mach_msg((mach_msg_header_t *)rcv_name, 3, v32, 0x30u, reply_port, 0, 0);
  uint64_t v35 = v34;
  if ((v34 - 268435458) > 0xE || ((1 << (v34 - 2)) & 0x4003) == 0)
  {
    if (v34)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v35;
    }
    if (DWORD1(v40) == 71)
    {
      uint64_t v35 = 4294966988;
    }
    else if (DWORD1(v40) == 28047802)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v35 = LODWORD(v41[0]);
            if (!LODWORD(v41[0]))
            {
              *int v3 = DWORD1(v41[0]);
              return v35;
            }
            goto LABEL_37;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v37 = 1;
          }
          else {
            BOOL v37 = LODWORD(v41[0]) == 0;
          }
          if (v37) {
            uint64_t v35 = 4294966996;
          }
          else {
            uint64_t v35 = LODWORD(v41[0]);
          }
          goto LABEL_37;
        }
      }
      uint64_t v35 = 4294966996;
    }
    else
    {
      uint64_t v35 = 4294966995;
    }
LABEL_37:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v35;
  }
  mig_put_reply_port(rcv_name[3]);
  return v35;
}

uint64_t Logoff()
{
  mach_port_name_t v1 = MEMORY[0x270FA5388]();
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v9 = 0u;
  *((void *)&v9 + 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v2 = mig_strncpy_zerofill((char *)v10 + 8, v0, 4096);
  }
  else {
    int v2 = mig_strncpy((char *)v10 + 8, v0, 4096);
  }
  LODWORD(v10[0]) = 0;
  DWORD1(v10[0]) = v2;
  mach_msg_size_t v3 = ((v2 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = v1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v9 = 0x1ABF95700000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)rcv_name, 3, v3, 0x2Cu, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name[3]);
    return v6;
  }
  if (v5)
  {
    mig_dealloc_reply_port(rcv_name[3]);
    return v6;
  }
  if (DWORD1(v9) == 71)
  {
    uint64_t v6 = 4294966988;
LABEL_20:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v6;
  }
  if (DWORD1(v9) != 28047803)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_20;
  }
  uint64_t v6 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_20;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_20;
  }
  if (rcv_name[2]) {
    goto LABEL_20;
  }
  uint64_t v6 = LODWORD(v10[0]);
  if (LODWORD(v10[0])) {
    goto LABEL_20;
  }
  return v6;
}

uint64_t ForgetNetwork(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  memset(&msg[4], 0, 32);
  *(void *)&msg[24] = *MEMORY[0x263EF80C8];
  if (a3 > 0x400) {
    return 4294966989;
  }
  __memcpy_chk();
  *(_DWORD *)mach_msg_header_t msg = 19;
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[32] = a3;
  *(_DWORD *)&msg[20] = 28047705;
  *(void *)&msg[12] = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, ((a3 + 3) & 0xFFFFFFFC) + 36, 0, 0, 0, 0);
}

uint64_t PurgeAccountRecord(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  memset(&msg[4], 0, 32);
  *(void *)&msg[24] = *MEMORY[0x263EF80C8];
  if (a3 > 0x400) {
    return 4294966989;
  }
  __memcpy_chk();
  *(_DWORD *)mach_msg_header_t msg = 19;
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[32] = a3;
  *(_DWORD *)&msg[20] = 28047706;
  *(void *)&msg[12] = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, ((a3 + 3) & 0xFFFFFFFC) + 36, 0, 0, 0, 0);
}

uint64_t DebugLaunchWebsheet(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x263EF80C8];
  int v17 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1ABF95B00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047807)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = HIDWORD(v13) == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = HIDWORD(v13);
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t DumpState(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x1ABF95C00000000;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint64_t CopySupportedInterfaces(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1ABF96000000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047812)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t CopyCurrentNetworkInfo()
{
  mach_port_name_t v0 = MEMORY[0x270FA5388]();
  mach_msg_size_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  mach_port_name_t v8 = v0;
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)&v18[16] = 0u;
  long long v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_OWORD *)uint64_t v18 = 0u;
  *(void *)&v18[8] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&v18[16] = v9;
  if (MEMORY[0x263EF89D0]) {
    int v10 = mig_strncpy_zerofill(&v18[28], v1, 4096);
  }
  else {
    int v10 = mig_strncpy(&v18[28], v1, 4096);
  }
  *(_DWORD *)&v18[20] = 0;
  *(_DWORD *)&v18[24] = v10;
  mach_msg_size_t v11 = ((v10 + 3) & 0xFFFFFFFC) + 44;
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = v8;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)uint64_t v18 = 0x1ABF96100000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x44u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name[3]);
  }
  else
  {
    if (!v13)
    {
      if (*(_DWORD *)&v18[4] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&v18[4] == 28047813)
      {
        if ((rcv_name[0] & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996;
          if (*(_DWORD *)&v18[8] == 1 && rcv_name[1] == 60 && !rcv_name[2] && v18[23] == 1)
          {
            int v15 = *(_DWORD *)&v18[24];
            if (*(_DWORD *)&v18[24] == DWORD1(v19))
            {
              uint64_t v14 = 0;
              void *v7 = *(void *)&v18[12];
              _DWORD *v5 = v15;
              *mach_msg_size_t v3 = DWORD2(v19);
              return v14;
            }
          }
        }
        else if (rcv_name[1] == 36)
        {
          uint64_t v14 = 4294966996;
          if (*(_DWORD *)&v18[16])
          {
            if (rcv_name[2]) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = *(unsigned int *)&v18[16];
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_reply_port(rcv_name[3]);
  }
  return v14;
}

uint64_t CopyAccountList(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1ABF96200000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047814)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t AddAccount()
{
  unsigned int v0 = MEMORY[0x270FA5388]();
  mach_msg_size_t v3 = v2;
  int v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unsigned int v11 = v10;
  uint64_t v13 = v12;
  unsigned int v14 = v0;
  uint64_t v40 = *MEMORY[0x263EF8340];
  memset(msg, 0, 512);
  *(void *)&msg[1].msgh_bits = *MEMORY[0x263EF80C8];
  uint64_t v15 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    mach_port_t v16 = mig_strncpy_zerofill((char *)&msg[1].msgh_voucher_port, v1, 4096);
  }
  else {
    mach_port_t v16 = mig_strncpy((char *)&msg[1].msgh_voucher_port, v1, 4096);
  }
  msg[1].uint64_t msgh_remote_port = 0;
  msg[1].msgh_local_port = v16;
  if (v11 <= 0x400)
  {
    long long v37 = v3;
    src = v7;
    int v18 = v5;
    unsigned int v19 = v14;
    unsigned int v20 = (v16 + 3) & 0xFFFFFFFC;
    long long v21 = (char *)msg + v20;
    uint64_t v22 = (v11 + 3) & 0xFFFFFFFC;
    long long v23 = &v21[v22];
    memcpy(v21 + 44, v13, v11);
    *((_DWORD *)v21 + 10) = v11;
    uint64_t v24 = (uint64_t)&v21[v22 - 5120];
    long long v25 = &v21[v22 + 52];
    if (v15) {
      int v26 = mig_strncpy_zerofill(v25, v9, 4096);
    }
    else {
      int v26 = mig_strncpy(v25, v9, 4096);
    }
    *((_DWORD *)v23 + 12) = v26;
    *((_DWORD *)v23 + 11) = 0;
    uint64_t v27 = (v26 + 3) & 0xFFFFFFFC;
    long long v28 = (char *)(v24 + v27 + 5180);
    int v29 = v18;
    if (v15) {
      int v30 = mig_strncpy_zerofill(v28, src, 4096);
    }
    else {
      int v30 = mig_strncpy(v28, src, 4096);
    }
    *(_DWORD *)(v24 + v27 + 5176) = v30;
    *(_DWORD *)(v24 + v27 + 5172) = 0;
    uint64_t v31 = (v30 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v32 = v22 + v20 + v27 + v31 + 64;
    *(_DWORD *)(v24 + v27 - 4096 + v31 + 9276) = v29;
    mach_port_name_t reply_port = mig_get_reply_port();
    *(void *)&msg[0].uint64_t msgh_remote_port = __PAIR64__(reply_port, v19);
    msg[0].msgh_bits = 5395;
    *(void *)&msg[0].msgh_voucher_port = 0x1ABF96300000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(msg);
      mach_port_name_t reply_port = msg[0].msgh_local_port;
    }
    uint64_t v34 = mach_msg(msg, 3, v32, 0x30u, reply_port, 0, 0);
    uint64_t msgh_remote_port = v34;
    if ((v34 - 268435458) <= 0xE && ((1 << (v34 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg[0].msgh_local_port);
      return msgh_remote_port;
    }
    if (v34)
    {
      mig_dealloc_reply_port(msg[0].msgh_local_port);
      return msgh_remote_port;
    }
    if (msg[0].msgh_id == 71)
    {
      uint64_t msgh_remote_port = 4294966988;
    }
    else if (msg[0].msgh_id == 28047815)
    {
      if ((msg[0].msgh_bits & 0x80000000) == 0)
      {
        if (msg[0].msgh_size == 40)
        {
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              mach_port_t *v37 = msg[1].msgh_local_port;
              return msgh_remote_port;
            }
            goto LABEL_34;
          }
        }
        else if (msg[0].msgh_size == 36)
        {
          if (msg[0].msgh_remote_port) {
            BOOL v35 = 1;
          }
          else {
            BOOL v35 = msg[1].msgh_remote_port == 0;
          }
          if (v35) {
            uint64_t msgh_remote_port = 4294966996;
          }
          else {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
          }
          goto LABEL_34;
        }
      }
      uint64_t msgh_remote_port = 4294966996;
    }
    else
    {
      uint64_t msgh_remote_port = 4294966995;
    }
LABEL_34:
    mach_msg_destroy(msg);
    return msgh_remote_port;
  }
  return 4294966989;
}

uint64_t ResolveAccount()
{
  mach_port_name_t v0 = MEMORY[0x270FA5388]();
  mach_msg_size_t v3 = v2;
  mach_port_name_t v4 = v0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, v1, 4096);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, v1, 4096);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t reply_port = mig_get_reply_port();
  rcv_name[2] = v4;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x1ABF96400000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3, v6, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v9;
    }
    if (DWORD1(v13) == 71)
    {
      uint64_t v9 = 4294966988;
    }
    else if (DWORD1(v13) == 28047816)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v9 = LODWORD(v14[0]);
            if (!LODWORD(v14[0]))
            {
              *mach_msg_size_t v3 = DWORD1(v14[0]);
              return v9;
            }
            goto LABEL_26;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = LODWORD(v14[0]) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996;
          }
          else {
            uint64_t v9 = LODWORD(v14[0]);
          }
          goto LABEL_26;
        }
      }
      uint64_t v9 = 4294966996;
    }
    else
    {
      uint64_t v9 = 4294966995;
    }
LABEL_26:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v9;
  }
  mig_put_reply_port(rcv_name[3]);
  return v9;
}

uint64_t AuthenticateUsing()
{
  mach_port_t v0 = MEMORY[0x270FA5388]();
  mach_msg_size_t v3 = v2;
  int v5 = v4;
  mach_port_t v6 = v0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  memset(v26, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v23 = 1;
  int v24 = v7;
  DWORD1(v25) = 1376256;
  *((void *)&v25 + 1) = *MEMORY[0x263EF80C8];
  uint64_t v8 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v9 = mig_strncpy_zerofill((char *)v26 + 8, v1, 4096);
  }
  else {
    int v9 = mig_strncpy((char *)v26 + 8, v1, 4096);
  }
  LODWORD(v26[0]) = 0;
  DWORD1(v26[0]) = v9;
  uint64_t v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v10 + 64;
  int v12 = (char *)&rcv_name + v10;
  long long v13 = v12 - 4096;
  unsigned int v14 = v12 + 64;
  if (v8) {
    int v15 = mig_strncpy_zerofill(v14, v5, 4096);
  }
  else {
    int v15 = mig_strncpy(v14, v5, 4096);
  }
  *((_DWORD *)v13 + 1039) = v15;
  *((_DWORD *)v13 + 1038) = 0;
  mach_msg_size_t v16 = v11 + ((v15 + 3) & 0xFFFFFFFC);
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.uint64_t msgh_remote_port = v6;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x1ABF96500000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v18 = mach_msg(&rcv_name, 3, v16, 0x30u, reply_port, 0, 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (v18)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v19;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v19 = 4294966988;
    }
    else if (rcv_name.msgh_id == 28047817)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v19 = v25;
            if (!v25)
            {
              *mach_msg_size_t v3 = DWORD1(v25);
              return v19;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v20 = 1;
          }
          else {
            BOOL v20 = v25 == 0;
          }
          if (v20) {
            uint64_t v19 = 4294966996;
          }
          else {
            uint64_t v19 = v25;
          }
          goto LABEL_29;
        }
      }
      uint64_t v19 = 4294966996;
    }
    else
    {
      uint64_t v19 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy(&rcv_name);
    return v19;
  }
  mig_put_reply_port(rcv_name.msgh_local_port);
  return v19;
}

uint64_t AuthenticateUsingToken()
{
  mach_port_t v0 = MEMORY[0x270FA5388]();
  mach_msg_size_t v3 = v2;
  unsigned int v5 = v4;
  int v7 = v6;
  mach_port_t v8 = v0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  memset(v22, 0, 464);
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v19 = 1;
  int v20 = v9;
  DWORD1(v21) = 1376256;
  *((void *)&v21 + 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v10 = mig_strncpy_zerofill((char *)v22 + 8, v1, 4096);
  }
  else {
    int v10 = mig_strncpy((char *)v22 + 8, v1, 4096);
  }
  LODWORD(v22[0]) = 0;
  DWORD1(v22[0]) = v10;
  if (v5 <= 0x400)
  {
    uint64_t v12 = (v10 + 3) & 0xFFFFFFFC;
    memcpy((char *)v22 + v12 + 12, v7, v5);
    *(_DWORD *)((char *)v22 + v12 + 8) = v5;
    mach_msg_size_t v13 = ((v5 + 3) & 0xFFFFFFFC) + v12 + 60;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.uint64_t msgh_remote_port = v8;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0x1ABF96600000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v15 = mach_msg(&rcv_name, 3, v13, 0x30u, reply_port, 0, 0);
    uint64_t v11 = v15;
    if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v11;
    }
    if (v15)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v11;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v11 = 4294966988;
    }
    else if (rcv_name.msgh_id == 28047818)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v11 = v21;
            if (!v21)
            {
              *mach_msg_size_t v3 = DWORD1(v21);
              return v11;
            }
            goto LABEL_28;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v21 == 0;
          }
          if (v16) {
            uint64_t v11 = 4294966996;
          }
          else {
            uint64_t v11 = v21;
          }
          goto LABEL_28;
        }
      }
      uint64_t v11 = 4294966996;
    }
    else
    {
      uint64_t v11 = 4294966995;
    }
LABEL_28:
    mach_msg_destroy(&rcv_name);
    return v11;
  }
  return 4294966989;
}

uint64_t ConnectionGetCommandInfo(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1ABF96900000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047821)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t ConnectionProvideResponse(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x263EF80C8];
  int v17 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.uint64_t msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1ABF96A00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047822)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = HIDWORD(v13) == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = HIDWORD(v13);
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t ConnectionSendCmdAck(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x263EF80C8];
  int v17 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.uint64_t msgh_remote_port = a1;
  v11.msgh_local_port = reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1ABF96B00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3, 0x38u, 0x30u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }
    if (v11.msgh_id == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (v11.msgh_id == 28047823)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v8 = HIDWORD(v13);
            if (!HIDWORD(v13))
            {
              *a4 = v14;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = HIDWORD(v13) == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = HIDWORD(v13);
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v11);
    return v8;
  }
  mig_put_reply_port(v11.msgh_local_port);
  return v8;
}

uint64_t CopyLandingPageURL(int a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1ABF96C00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x4Cu, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 28047824)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 68 && !*(_DWORD *)&msg[8] && BYTE3(v16) == 1)
          {
            int v13 = DWORD1(v16);
            if (DWORD1(v16) == v17)
            {
              uint64_t v12 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v13;
              *a4 = *(void *)((char *)&v17 + 4);
              *a5 = HIDWORD(v17);
              return v12;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v12 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v12 = 4294966996;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v12;
}

uint64_t ConnectionProcessControl(mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  msg.msgh_id = 0;
  uint64_t v20 = 0;
  long long v21 = 0u;
  *(_OWORD *)&msg.msgh_size = 0u;
  int v16 = 1;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = *MEMORY[0x263EF80C8];
  LODWORD(v21) = a3;
  mach_port_t reply_port = mig_get_reply_port();
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1ABF96D00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3, 0x38u, 0x44u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (msg.msgh_id == 28047825)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996;
          if (v16 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v18) == 1)
          {
            int v13 = v19;
            if (v19 == v21)
            {
              uint64_t v12 = 0;
              *a4 = v17;
              *a5 = v13;
              *a6 = DWORD1(v21);
              return v12;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v12 = 4294966996;
          if (HIDWORD(v17))
          {
            if (msg.msgh_remote_port) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
          }
        }
        else
        {
          uint64_t v12 = 4294966996;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v12;
}

uint64_t UserInteractionIsRequired(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1ABF96E00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      return v8;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 28047826)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 44)
        {
          if (!*(_DWORD *)&msg[8])
          {
            uint64_t v8 = *(unsigned int *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              int v11 = DWORD1(v13);
              *a2 = v13;
              *a3 = v11;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = *(_DWORD *)&msg[32] == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = *(unsigned int *)&msg[32];
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
  return v8;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AE0](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x270EE4B00](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x270EE4DE0](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5330](anURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

uint64_t NEHelperCopyCurrentNetworkInfo()
{
  return MEMORY[0x270ED7C50]();
}

uint64_t SCNetworkInterfaceSetAdvisory()
{
  return MEMORY[0x270F055D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x270F05780]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x270F057D8]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x270EDBAB0](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}

void xpc_release(xpc_object_t object)
{
}