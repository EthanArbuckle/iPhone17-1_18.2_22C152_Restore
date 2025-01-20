uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (*(void *)(v2 + 8))
  {
    ++*(void *)(v2 + 88);
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
    result = connect(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) + 8, "com.apple.applephotondetectorservicesqueue");
    *(_DWORD *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = result;
    if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 48) + 8) + 24))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 24);
      ++*(void *)(v3 + 88);
    }
  }
  return result;
}

uint64_t connect(uint64_t a1, const char *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char valuePtr = 0;
  io_iterator_t existing = 0;
  if (!a1) {
    return 3758096385;
  }
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v5 = IOServiceMatching("AppleH13CamIn");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  io_iterator_t v7 = existing;
  if (existing)
  {
    uint64_t v8 = MatchingServices;
    int v9 = 0;
    v10 = off_26523BF60;
  }
  else
  {
    CFDictionaryRef v11 = IOServiceMatching("AppleH16CamIn");
    uint64_t v12 = IOServiceGetMatchingServices(v4, v11, &existing);
    if (!existing) {
      return 3758097086;
    }
    uint64_t v8 = v12;
    v10 = &off_26523BF68;
    int v9 = 1;
  }
  CFDictionaryRef v13 = IOServiceNameMatching(*v10);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v13);
  io_object_t v15 = MatchingService;
  if (MatchingService)
  {
    CFNumberRef v16 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"RestoreMode", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
    CFNumberRef v17 = v16;
    if (v16) {
      CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
    }
  }
  else
  {
    CFNumberRef v17 = 0;
  }
  *(_DWORD *)(a1 + 16) = v9;
  if (v7)
  {
    v18 = "com.apple.dietappleh13camerad";
    if (valuePtr != 1 && !os_variant_is_recovery()) {
      v18 = "com.apple.appleh13camerad";
    }
    *(void *)(a1 + 24) = "H13ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H13ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v18;
    *(void *)(a1 + 48) = "H13ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H13ISPServicesRemoteFusingLengthKey";
  }
  else
  {
    v19 = "com.apple.dietappleh16camerad";
    if (valuePtr != 1 && !os_variant_is_recovery()) {
      v19 = "com.apple.appleh16camerad";
    }
    *(void *)(a1 + 24) = "H16ISPServicesRemoteTypeKey";
    *(void *)(a1 + 32) = "H16ISPServicesRemoteDataKey";
    *(void *)(a1 + 40) = v19;
    *(void *)(a1 + 48) = "H16ISPServicesRemoteFusingDataKey";
    *(void *)(a1 + 56) = "H16ISPServicesRemoteFusingLengthKey";
    *(void *)(a1 + 64) = "H16ISPServicesRemoteIORegPropertyNameKey";
    *(void *)(a1 + 72) = "H16ISPServicesRemoteIORegPropertyDataKey";
  }
  v20 = dispatch_queue_create(a2, 0);
  *(void *)(a1 + 8) = v20;
  if (v20)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 40), v20, 0);
    *(void *)a1 = mach_service;
    if (mach_service) {
      goto LABEL_27;
    }
    uint64_t v8 = 3758097086;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = &_os_log_internal;
    v23 = "%s: Could not establish a connection\n";
    goto LABEL_26;
  }
  uint64_t v8 = 3758097086;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "connect";
    v22 = &_os_log_internal;
    v23 = "%s: Could not create a serial dispatch queue, exiting\n";
LABEL_26:
    _os_log_impl(&dword_24866F000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }
LABEL_27:
  if (existing)
  {
    IOObjectRelease(existing);
    io_iterator_t existing = 0;
  }
  if (v15) {
    IOObjectRelease(v15);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v8;
}

void ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(v2 + 88) - 1;
    *(void *)(v2 + 88) = v3;
    if (!v3)
    {
      disconnect((xpc_connection_t *)(v2 + 8));
      mach_port_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      if (v4)
      {
        dispatch_release(v4);
        *(void *)(*(void *)(a1 + 32) + 16) = 0;
      }
    }
  }
}

void disconnect(xpc_connection_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global);
    xpc_connection_cancel(*a1);
    xpc_release(*a1);
    *a1 = 0;
  }
}

uint64_t ApplePhotonDetectorServicesGetLuxAsync()
{
  v0 = MEMORY[0x270FA5388]();
  CFDictionaryRef v5 = v3;
  v6 = v2;
  io_iterator_t v7 = v1;
  uint64_t v8 = v0;
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2000000000;
  int v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2000000000;
  char v50 = 0;
  if (v0 && v1 && v2 && v3)
  {
    int v9 = &v54;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2000000000;
    v46 = v0;
    if (v0->isa)
    {
      if (!*((unsigned char *)v2 + 36))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v61 = "ApplePhotonDetectorServicesGetLuxAsync";
          _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Error! Client requested 0 samples\n", buf, 0xCu);
          int v9 = (int *)(v52 + 3);
        }
        int v17 = -536870911;
        goto LABEL_27;
      }
      v10 = *v2;
      if (*v2 && v2[2] && v2[1] && v2[3])
      {
        uint64_t v11 = v4;
        dispatch_retain(v1);
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x2000000000;
        int v42 = 0;
        bzero(buf, 0xE60uLL);
        xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
        if (v12)
        {
          CFDictionaryRef v13 = *(NSObject **)v44[3];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke;
          block[3] = &unk_26523C088;
          block[4] = &v43;
          block[5] = &v47;
          block[6] = &v51;
          dispatch_sync(v13, block);
          if (!*((_DWORD *)v52 + 6))
          {
            if (!*((unsigned char *)v48 + 24)) {
              xpc_connection_set_event_handler(*(xpc_connection_t *)(v44[3] + 8), &__block_literal_global_0);
            }
            xpc_connection_activate(*(xpc_connection_t *)(v44[3] + 8));
            if (isCameraStreaming(v44[3] + 8) && *((unsigned __int8 *)v6 + 36) <= 4u)
            {
              *(_DWORD *)buf = 104;
              xpc_dictionary_set_uint64(v12, *(const char **)(v44[3] + 32), 2uLL);
              xpc_dictionary_set_data(v12, *(const char **)(v44[3] + 40), buf, 0xE60uLL);
              uint64_t v25 = v44[3];
              v26 = *(_xpc_connection_s **)(v25 + 8);
              v27 = *(NSObject **)(v25 + 16);
              handler[0] = MEMORY[0x263EF8330];
              handler[1] = 0x40000000;
              handler[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21;
              handler[3] = &unk_26523C0F0;
              handler[4] = &v43;
              handler[5] = v41;
              handler[6] = v6;
              handler[7] = v5;
              handler[8] = v7;
              handler[9] = v11;
              xpc_connection_send_message_with_reply(v26, v12, v27, handler);
            }
            else
            {
              *(void *)&long long v57 = 0;
              *((void *)&v57 + 1) = &v57;
              uint64_t v58 = 0x2000000000;
              char v59 = 0;
              uint64_t v35 = 0;
              v36 = &v35;
              uint64_t v37 = 0x2000000000;
              v38 = 0;
              v38 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
              v28 = (_DWORD *)v36[3];
              if (v28)
              {
                int v29 = *((unsigned __int8 *)v6 + 36);
                _DWORD *v28 = v29;
                if (v29)
                {
                  unsigned int v30 = 0;
                  do
                  {
                    *(_DWORD *)buf = 100;
                    xpc_dictionary_set_uint64(v12, *(const char **)(v44[3] + 32), 2uLL);
                    xpc_dictionary_set_data(v12, *(const char **)(v44[3] + 40), buf, 0xE60uLL);
                    uint64_t v31 = v44[3];
                    v32 = *(_xpc_connection_s **)(v31 + 8);
                    v33 = *(NSObject **)(v31 + 16);
                    v34[0] = MEMORY[0x263EF8330];
                    v34[1] = 0x40000000;
                    v34[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25;
                    v34[3] = &unk_26523C138;
                    v34[4] = &v43;
                    v34[5] = v41;
                    v34[6] = &v57;
                    v34[7] = &v35;
                    v34[8] = v6;
                    v34[9] = v5;
                    v34[10] = v7;
                    v34[11] = v11;
                    xpc_connection_send_message_with_reply(v32, v12, v33, v34);
                    ++v30;
                  }
                  while (v30 < *((unsigned __int8 *)v6 + 36));
                }
              }
              else
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v55 = 136315138;
                  v56 = "ApplePhotonDetectorServicesGetLuxAsync";
                  _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Could not allocate memory for counter \n", v55, 0xCu);
                }
                disconnectFromDaemon((NSObject **)v44[3]);
              }
              _Block_object_dispose(&v35, 8);
              _Block_object_dispose(&v57, 8);
            }
            goto LABEL_46;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
LABEL_46:
            _Block_object_dispose(v41, 8);
            _Block_object_dispose(&v43, 8);
            if (v12) {
              xpc_release(v12);
            }
            goto LABEL_28;
          }
          LODWORD(v57) = 136315138;
          *(void *)((char *)&v57 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          v14 = &_os_log_internal;
          io_object_t v15 = "%s: Could not establish a connection with the daemon, exiting\n";
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_46;
          }
          LODWORD(v57) = 136315138;
          *(void *)((char *)&v57 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          v14 = &_os_log_internal;
          io_object_t v15 = "%s: Could not create dictionary, exiting\n";
        }
        _os_log_impl(&dword_24866F000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v57, 0xCu);
        goto LABEL_46;
      }
      int v17 = -536870211;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v6[1];
        v21 = v6[2];
        v23 = v6[3];
        *(_DWORD *)buf = 136316162;
        v61 = "ApplePhotonDetectorServicesGetLuxAsync";
        __int16 v62 = 2048;
        v63 = v10;
        __int16 v64 = 2048;
        v65 = (NSObject **)v21;
        __int16 v66 = 2048;
        v67 = v22;
        __int16 v68 = 2048;
        v69 = v23;
        v18 = &_os_log_internal;
        v19 = "%s: Error! Client has not allocated the required memory: lux samples = %p, abs time = %p, gains = %p, coex = %p\n";
        uint32_t v20 = 52;
        goto LABEL_23;
      }
    }
    else
    {
      int v17 = -536870195;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v61 = "ApplePhotonDetectorServicesGetLuxAsync";
        v18 = &_os_log_internal;
        v19 = "%s: APDS dispatch queue is unavailable. Was it not allocated ?\n";
        uint32_t v20 = 12;
LABEL_23:
        _os_log_impl(&dword_24866F000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
        int v9 = (int *)(v52 + 3);
      }
    }
LABEL_27:
    *int v9 = v17;
    _Block_object_dispose(&v43, 8);
    goto LABEL_28;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v61 = "ApplePhotonDetectorServicesGetLuxAsync";
    __int16 v62 = 2048;
    v63 = v7;
    __int16 v64 = 2048;
    v65 = v6;
    __int16 v66 = 2048;
    v67 = v5;
    __int16 v68 = 2048;
    v69 = v8;
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Invalid arguments, replyQueue = 0x%p, info = 0x%p, UserCallback = 0x%p, handle = %p exiting\n", buf, 0x34u);
    CFNumberRef v16 = v52;
  }
  else
  {
    CFNumberRef v16 = &v51;
  }
  *((_DWORD *)v16 + 6) = -536870911;
LABEL_28:
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  return 0;
}

void sub_2486707C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (MEMORY[0x24C57A6F0](a2) == MEMORY[0x263EF8708])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(a2, *(const char **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), &length);
    if (data)
    {
      size_t v9 = length;
      if (length == 3680)
      {
        float v6 = *((float *)data + 2);
        float v7 = *((float *)data + 3);
        uint64_t v4 = *((void *)data + 2);
        char v5 = *((unsigned char *)data + 24);
        int v10 = *((_DWORD *)data + 7);
LABEL_14:
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        goto LABEL_15;
      }
      float v6 = 0.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        __int16 v30 = 2048;
        *(void *)uint64_t v31 = v9;
        *(_WORD *)&v31[8] = 2048;
        uint64_t v32 = 3680;
        uint64_t v11 = &_os_log_internal;
        xpc_object_t v12 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v13 = 32;
        goto LABEL_12;
      }
    }
    else
    {
      float v6 = 0.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v11 = &_os_log_internal;
        xpc_object_t v12 = "%s: Could not get the required data\n";
        uint32_t v13 = 12;
LABEL_12:
        _os_log_impl(&dword_24866F000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      }
    }
    uint64_t v4 = 0;
    char v5 = 0;
    int v10 = -536870209;
    float v7 = 0.0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received a response of an unknown type\n", buf, 0xCu);
  }
  uint64_t v4 = 0;
  char v5 = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870199;
  float v6 = 0.0;
  float v7 = 0.0;
LABEL_15:
  if (!*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 88)) {
    goto LABEL_33;
  }
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  CFNumberRef v16 = *(int **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int v17 = *v16;
  unsigned int v18 = *(unsigned __int8 *)(v14 + 36);
  unsigned int v19 = v18 - *v16;
  if (v18 >= *v16)
  {
    char v21 = 0;
    int v20 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v20) {
      float v22 = 0.0;
    }
    else {
      float v22 = v6;
    }
    if (v20) {
      uint64_t v4 = 0;
    }
    *(float *)(*(void *)v14 + 4 * v19) = v22;
    *(void *)(*(void *)(v14 + 16) + 8 * v19) = v4;
    if (v20) {
      float v7 = 0.0;
    }
    *(float *)(*(void *)(v14 + 8) + 4 * v19) = v7;
    if (v20) {
      char v5 = 0;
    }
    *(unsigned char *)(*(void *)(v14 + 24) + v19) = v5;
    *CFNumberRef v16 = v17 - 1;
    if (v17 != 1) {
      goto LABEL_32;
    }
    char v21 = 1;
  }
  else
  {
    int v20 = -536870168;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v29 = "UpdateLuxInfo";
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = v17;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v18;
      _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: currentCount is greater than the number of samples requested, currentCount = %d, numSamples = %d\n", buf, 0x18u);
    }
    char v21 = 0;
  }
  *(_DWORD *)(v14 + 32) = v20;
LABEL_32:
  *(unsigned char *)(v15 + 24) = v21;
LABEL_33:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v23 = *(void *)(a1 + 72);
    if (v23)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 0x40000000;
      v26[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_26;
      v26[3] = &__block_descriptor_tmp_27;
      uint64_t v24 = *(void *)(a1 + 64);
      v26[4] = v23;
      v26[5] = v24;
      uint64_t v25 = *(NSObject **)(a1 + 80);
      v26[6] = *(void *)(a1 + 88);
      dispatch_async(v25, v26);
      dispatch_release(*(dispatch_object_t *)(a1 + 80));
    }
    disconnectFromDaemon(*(NSObject ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    free(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
}

void disconnectFromDaemon(NSObject **a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke;
      block[3] = &__block_descriptor_tmp_42;
      block[4] = a1;
      dispatch_sync(v1, block);
    }
  }
}

BOOL isCameraStreaming(BOOL result)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  int v1 = *(_DWORD *)(result + 16);
  uint64_t v2 = "AppleH16CamIn";
  if (v1 != 1) {
    uint64_t v2 = 0;
  }
  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = "AppleH13CamIn";
  }
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14) {
      return result;
    }
    int valuePtr = 136315394;
    float v22 = "isCameraStreaming";
    __int16 v23 = 1024;
    LODWORD(v24) = v1;
    uint64_t v15 = &_os_log_internal;
    CFNumberRef v16 = "%s: Could not get a matching driver name, driver version = %d\n";
    uint32_t v17 = 18;
LABEL_21:
    _os_log_impl(&dword_24866F000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&valuePtr, v17);
    return 0;
  }
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v5 = IOServiceNameMatching(v3);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v18) {
      return result;
    }
    int valuePtr = 136315394;
    float v22 = "isCameraStreaming";
    __int16 v23 = 2080;
    uint64_t v24 = v3;
    uint64_t v15 = &_os_log_internal;
    CFNumberRef v16 = "%s: Could not match to the driver %s\n";
    uint32_t v17 = 22;
    goto LABEL_21;
  }
  io_registry_entry_t v7 = MatchingService;
  int valuePtr = 0;
  uint64_t v20 = 0;
  int v19 = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v9 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"FrontCameraStreaming", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  CFNumberRef v10 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v7, "IOService", @"BackCameraStreaming", v8, 3u);
  CFNumberRef v11 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v7, "IOService", @"BackTeleCameraStreaming", v8, 3u);
  CFNumberRef v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v7, "IOService", @"BackSuperWideCameraStreaming", v8, 3u);
  if (v9) {
    CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
  }
  if (v10) {
    CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)&v20 + 4);
  }
  if (v11) {
    CFNumberGetValue(v11, kCFNumberSInt32Type, &v20);
  }
  if (v12)
  {
    CFNumberGetValue(v12, kCFNumberSInt32Type, &v19);
    int v13 = v19;
  }
  else
  {
    int v13 = 0;
  }
  return (HIDWORD(v20) | valuePtr | v20 | v13) != 0;
}

xpc_object_t sendSynchronousXpcMsgWithReply()
{
  v0 = (xpc_connection_t *)MEMORY[0x270FA5388]();
  *(void *)&v23[3293] = *MEMORY[0x263EF8340];
  if (*v0)
  {
    uint64_t v4 = v3;
    int v5 = v2;
    int v6 = v1;
    io_registry_entry_t v7 = v0;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      CFNumberRef v9 = v8;
      if (v5 == 1)
      {
        bzero(&bytes, 0x3378uLL);
        int bytes = v6;
        switch(v6)
        {
          case 204:
          case 207:
          case 212:
            if (v4)
            {
              uint64_t v14 = *(void *)(v4 + 16);
              int v13 = (size_t *)(v4 + 16);
              *(void *)&v23[1] = *(v13 - 1);
              *(void *)&v23[3] = v14;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[6], *(const void **)&v23[1], *v13);
              xpc_dictionary_set_uint64(v9, (const char *)v7[7], *(uint64_t *)&v23[3]);
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              char v21 = "sendSynchronousXpcMsgWithReply";
              uint64_t v15 = &_os_log_internal;
              CFNumberRef v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          case 208:
            xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
            xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
            break;
          case 211:
            if (v4)
            {
              uint64_t v18 = *(void *)(v4 + 24);
              uint32_t v17 = (size_t *)(v4 + 24);
              *(_OWORD *)&v23[1] = *((_OWORD *)v17 - 1);
              *(void *)&v23[5] = v18;
              xpc_dictionary_set_uint64(v9, (const char *)v7[3], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0x3378uLL);
              xpc_dictionary_set_string(v9, (const char *)v7[8], *(const char **)&v23[1]);
              xpc_dictionary_set_data(v9, (const char *)v7[9], *(const void **)&v23[3], *v17);
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              char v21 = "sendSynchronousXpcMsgWithReply";
              uint64_t v15 = &_os_log_internal;
              CFNumberRef v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          default:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 136315138;
              char v21 = "sendSynchronousXpcMsgWithReply";
              uint64_t v15 = &_os_log_internal;
              CFNumberRef v16 = "%s: Unhandled property\n";
LABEL_27:
              _os_log_impl(&dword_24866F000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);
            }
            break;
        }
      }
      else
      {
        if (v5 != 2)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int bytes = 136315138;
            *(void *)__int16 v23 = "sendSynchronousXpcMsgWithReply";
            _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Unexpected property type, returning\n", (uint8_t *)&bytes, 0xCu);
          }
          xpc_object_t v12 = 0;
          goto LABEL_29;
        }
        bzero(&bytes, 0xE60uLL);
        int bytes = v6;
        xpc_dictionary_set_uint64(v9, (const char *)v7[3], 2uLL);
        xpc_dictionary_set_data(v9, (const char *)v7[4], &bytes, 0xE60uLL);
      }
      xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(*v7, v9);
LABEL_29:
      xpc_release(v9);
      return v12;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int bytes = 136315138;
      *(void *)__int16 v23 = "sendSynchronousXpcMsgWithReply";
      CFNumberRef v10 = &_os_log_internal;
      CFNumberRef v11 = "%s: Could not create dictionary, exiting\n";
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int bytes = 136315138;
    *(void *)__int16 v23 = "sendSynchronousXpcMsgWithReply";
    CFNumberRef v10 = &_os_log_internal;
    CFNumberRef v11 = "%s: Connection is invalid, exiting \n";
LABEL_10:
    _os_log_impl(&dword_24866F000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&bytes, 0xCu);
  }
  return 0;
}

uint64_t ApplePhotonDetectorServicesGetGlobalCorrectionFactor(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  uint32_t v17 = &v16;
  uint64_t v18 = 0x7802000000;
  int v19 = __Block_byref_object_copy_;
  int v20 = __Block_byref_object_dispose_;
  memset(v21, 0, sizeof(v21));
  if (a1)
  {
    uint64_t v2 = connect((uint64_t)v21, "com.apple.applephotondetectorservicesqueue");
    if (v2) {
      goto LABEL_18;
    }
    uint64_t v3 = (_xpc_connection_s *)v17[5];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke;
    handler[3] = &unk_26523BF98;
    handler[4] = &v16;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_activate((xpc_connection_t)v17[5]);
    xpc_object_t v4 = sendSynchronousXpcMsgWithReply();
    int v5 = v4;
    if (v4)
    {
      if (MEMORY[0x24C57A6F0](v4) == MEMORY[0x263EF8708])
      {
        size_t length = 0;
        data = xpc_dictionary_get_data(v5, (const char *)v17[9], &length);
        size_t v10 = length;
        if (length == 3680)
        {
          uint64_t v2 = 0;
          *a1 = data[1];
        }
        else
        {
          uint64_t v2 = 3758097087;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
            __int16 v24 = 2048;
            size_t v25 = v10;
            __int16 v26 = 2048;
            uint64_t v27 = 3680;
            int v6 = &_os_log_internal;
            io_registry_entry_t v7 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
            uint32_t v8 = 32;
            goto LABEL_16;
          }
        }
      }
      else
      {
        uint64_t v2 = 3758097097;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
          int v6 = &_os_log_internal;
          io_registry_entry_t v7 = "%s: Received an unexpected event\n";
          uint32_t v8 = 12;
LABEL_16:
          _os_log_impl(&dword_24866F000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
        }
      }
      xpc_release(v5);
      goto LABEL_18;
    }
    uint64_t v2 = 3758097087;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Invalid arguments, exiting\n", buf, 0xCu);
    }
    uint64_t v2 = 3758096385;
  }
LABEL_18:
  CFNumberRef v11 = v17[6];
  if (v11)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2;
    v13[3] = &unk_26523BFC0;
    v13[4] = &v16;
    dispatch_sync(v11, v13);
    dispatch_release((dispatch_object_t)v17[6]);
    v17[6] = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v2;
}

void sub_24867174C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  __n128 result = *(__n128 *)(a2 + 56);
  long long v3 = *(_OWORD *)(a2 + 72);
  long long v4 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (MEMORY[0x24C57A6F0](a2) == MEMORY[0x263EF8720])
  {
    if (a2 == MEMORY[0x263EF86A8])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        io_registry_entry_t v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        long long v4 = &_os_log_internal;
        int v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_24866F000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      if (a2 != MEMORY[0x263EF86A0])
      {
        if (a2 != MEMORY[0x263EF86C0] || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        int v6 = 136315138;
        io_registry_entry_t v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        long long v4 = &_os_log_internal;
        int v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        io_registry_entry_t v7 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke";
        long long v4 = &_os_log_internal;
        int v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }
LABEL_12:
    disconnect((xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2(uint64_t a1)
{
}

void ApplePhotonDetectorServicesGetLux(dispatch_object_t object, uint64_t *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (!object || !a2)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    int v20 = &_os_log_internal;
    char v21 = "%s: Invalid arguments, exiting\n";
    goto LABEL_25;
  }
  if (!*((unsigned char *)a2 + 36))
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    int v20 = &_os_log_internal;
    char v21 = "%s: Error! Client requested 0 samples. Exiting\n";
LABEL_25:
    _os_log_impl(&dword_24866F000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)buf, 0xCu);
    return;
  }
  uint64_t v4 = *a2;
  if ((!*a2 || !a2[2] || !a2[1]) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a2[1];
    uint64_t v5 = a2[2];
    LODWORD(buf[0]) = 136315906;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    WORD2(buf[1]) = 2048;
    *(void *)((char *)&buf[1] + 6) = v4;
    HIWORD(buf[2]) = 2048;
    buf[3] = v5;
    LOWORD(buf[4]) = 2048;
    *(void *)((char *)&buf[4] + 2) = v6;
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: lux samples = %p, abs time = %p, gains = %p\n", (uint8_t *)buf, 0x2Au);
  }
  if (!a2[3] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Memory for coexFlags not allocated by the client\n", (uint8_t *)buf, 0xCu);
  }
  dispatch_retain(object);
  io_registry_entry_t v7 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 4uLL, 0x100004052888210uLL);
  uint64_t v8 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 4uLL, 0x100004052888210uLL);
  CFNumberRef v9 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 8uLL, 0x100004000313F17uLL);
  size_t v10 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 1uLL, 0x100004077774924uLL);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x7802000000;
  v48 = __Block_byref_object_copy_;
  uint64_t v49 = __Block_byref_object_dispose_;
  bzero(buf, 0xE60uLL);
  memset(v50, 0, sizeof(v50));
  if (!v7 || !v9 || !v8)
  {
    int v11 = -536870211;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)uint64_t v53 = 136315138;
    int v54 = "ApplePhotonDetectorServicesGetLux";
    float v22 = &_os_log_internal;
    __int16 v23 = "%s: Could not allocate memory to store lux information\n";
LABEL_30:
    _os_log_impl(&dword_24866F000, v22, OS_LOG_TYPE_DEFAULT, v23, v53, 0xCu);
    goto LABEL_31;
  }
  if (!v10)
  {
    int v11 = -536870211;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)uint64_t v53 = 136315138;
    int v54 = "ApplePhotonDetectorServicesGetLux";
    float v22 = &_os_log_internal;
    __int16 v23 = "%s: Could not allocate memory to store coex flags information\n";
    goto LABEL_30;
  }
  int v11 = connect((uint64_t)v50, "com.apple.applephotondetectorservicesqueue");
  if (v11) {
    goto LABEL_31;
  }
  xpc_object_t v12 = (_xpc_connection_s *)v46[5];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __ApplePhotonDetectorServicesGetLux_block_invoke;
  handler[3] = &unk_26523C008;
  handler[4] = &v45;
  void handler[5] = object;
  handler[6] = a2;
  xpc_connection_set_event_handler(v12, handler);
  xpc_connection_activate((xpc_connection_t)v46[5]);
  int v13 = v46;
  xpc_object_t v14 = sendSynchronousXpcMsgWithReply();
  uint64_t v15 = v14;
  if (!v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v53 = 136315138;
      int v54 = "isIspPowered";
      _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", v53, 0xCu);
    }
    goto LABEL_59;
  }
  if (MEMORY[0x24C57A6F0](v14) != MEMORY[0x263EF8708])
  {
    BOOL v16 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    *(_DWORD *)uint64_t v53 = 136315138;
    int v54 = "isIspPowered";
    uint32_t v17 = &_os_log_internal;
    uint64_t v18 = "%s: Received an unexpected event\n";
    uint32_t v19 = 12;
    goto LABEL_53;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v15, (const char *)v13[9], &length);
  size_t v28 = length;
  if (length == 3680)
  {
    BOOL v16 = data[8] != 0;
    goto LABEL_54;
  }
  BOOL v16 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v53 = 136315650;
    int v54 = "isIspPowered";
    __int16 v55 = 2048;
    size_t v56 = v28;
    __int16 v57 = 2048;
    uint64_t v58 = 3680;
    uint32_t v17 = &_os_log_internal;
    uint64_t v18 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
    uint32_t v19 = 32;
LABEL_53:
    _os_log_impl(&dword_24866F000, v17, OS_LOG_TYPE_DEFAULT, v18, v53, v19);
    BOOL v16 = 0;
  }
LABEL_54:
  xpc_release(v15);
  if (!v16)
  {
LABEL_59:
    if (*((unsigned char *)a2 + 36))
    {
LABEL_60:
      unint64_t v25 = 0;
      while (1)
      {
        xpc_object_t v30 = sendSynchronousXpcMsgWithReply();
        __int16 v24 = v30;
        if (!v30)
        {
          int v11 = -536870209;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v53 = 136315138;
            int v54 = "ApplePhotonDetectorServicesGetLux";
            _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", v53, 0xCu);
          }
LABEL_69:
          __int16 v24 = 0;
          goto LABEL_33;
        }
        if (MEMORY[0x24C57A6F0](v30) != MEMORY[0x263EF8708]) {
          break;
        }
        size_t length = 0;
        uint64_t v31 = xpc_dictionary_get_data(v24, (const char *)v46[9], &length);
        size_t v32 = length;
        if (length != 3680)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v53 = 136315650;
            int v54 = "ApplePhotonDetectorServicesGetLux";
            __int16 v55 = 2048;
            size_t v56 = v32;
            __int16 v57 = 2048;
            uint64_t v58 = 3680;
            _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received reply with unexpected length %lu. Expected %lu\n", v53, 0x20u);
          }
          int v11 = -536870209;
          goto LABEL_33;
        }
        memcpy(buf, v31, sizeof(buf));
        v7[v25] = buf[1];
        v9[v25] = buf[2];
        v8[v25] = HIDWORD(buf[1]);
        int v11 = HIDWORD(buf[3]);
        v10[v25] = buf[3];
        xpc_release(v24);
        if (++v25 >= *((unsigned __int8 *)a2 + 36)) {
          goto LABEL_69;
        }
      }
      int v11 = -536870199;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v53 = 136315138;
        int v54 = "ApplePhotonDetectorServicesGetLux";
        _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received an unexpected event\n", v53, 0xCu);
      }
      goto LABEL_33;
    }
    int v11 = 0;
LABEL_31:
    __int16 v24 = 0;
    goto LABEL_32;
  }
  if (*((unsigned __int8 *)a2 + 36) > 4u) {
    goto LABEL_60;
  }
  xpc_object_t v29 = sendSynchronousXpcMsgWithReply();
  __int16 v24 = v29;
  int v11 = -536870209;
  if (v29)
  {
    if (MEMORY[0x24C57A6F0](v29) != MEMORY[0x263EF8708])
    {
LABEL_58:
      int v11 = 0;
      goto LABEL_32;
    }
    size_t length = 0;
    uint64_t v33 = xpc_dictionary_get_data(v24, (const char *)v46[9], &length);
    if (length == 3680)
    {
      memcpy(buf, v33, sizeof(buf));
      if (BYTE4(buf[13]))
      {
        if (*((unsigned char *)a2 + 36))
        {
          unint64_t v25 = 0;
          unsigned int v34 = buf[13];
          do
          {
            uint64_t v35 = &buf[3 * v34 + 1];
            v7[v25] = *(_DWORD *)v35;
            v9[v25] = v35[1];
            v8[v25] = *((_DWORD *)v35 + 1);
            v10[v25] = *((unsigned char *)v35 + 16);
            unsigned int v34 = ((_BYTE)v34 + 1) & 3;
            ++v25;
          }
          while (v25 < *((unsigned __int8 *)a2 + 36));
          int v11 = 0;
          goto LABEL_33;
        }
        goto LABEL_58;
      }
      int v11 = -536870184;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)uint64_t v53 = 136315138;
      int v54 = "ApplePhotonDetectorServicesGetLux";
      v36 = &_os_log_internal;
      uint64_t v37 = "%s: lux cache is not ready with valid data\n";
      uint32_t v38 = 12;
    }
    else
    {
      size_t v39 = length;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)uint64_t v53 = 136315650;
      int v54 = "ApplePhotonDetectorServicesGetLux";
      __int16 v55 = 2048;
      size_t v56 = v39;
      __int16 v57 = 2048;
      uint64_t v58 = 3680;
      v36 = &_os_log_internal;
      uint64_t v37 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
      uint32_t v38 = 32;
    }
    _os_log_impl(&dword_24866F000, v36, OS_LOG_TYPE_DEFAULT, v37, v53, v38);
  }
LABEL_32:
  LOBYTE(v25) = 0;
LABEL_33:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_8;
  block[3] = &__block_descriptor_tmp_9;
  char v43 = v25;
  block[4] = a2;
  void block[5] = v7;
  block[6] = v8;
  void block[7] = v9;
  block[8] = v10;
  int v42 = v11;
  dispatch_sync(object, block);
  if (v24) {
    xpc_release(v24);
  }
  __int16 v26 = v46[6];
  if (v26)
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 0x40000000;
    v40[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_2;
    v40[3] = &unk_26523C050;
    v40[4] = &v45;
    dispatch_sync(v26, v40);
    dispatch_release((dispatch_object_t)v46[6]);
    v46[6] = 0;
  }
  dispatch_release(object);
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  if (v8) {
    free(v8);
  }
  if (v10) {
    free(v10);
  }
  _Block_object_dispose(&v45, 8);
}

void sub_248672430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void __ApplePhotonDetectorServicesGetLux_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (MEMORY[0x24C57A6F0](a2) == MEMORY[0x263EF8720])
  {
    if (a2 == MEMORY[0x263EF86A8])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        CFNumberRef v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = &_os_log_internal;
        uint64_t v5 = "%s: Received error XPC_ERROR_CONNECTION_INVALID\n";
LABEL_11:
        _os_log_impl(&dword_24866F000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }
    else
    {
      if (a2 != MEMORY[0x263EF86A0])
      {
        if (a2 != MEMORY[0x263EF86C0] || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = 136315138;
        CFNumberRef v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = &_os_log_internal;
        uint64_t v5 = "%s: Received error XPC_ERROR_TERMINATION_IMMINENT\n";
        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        CFNumberRef v9 = "ApplePhotonDetectorServicesGetLux_block_invoke";
        uint64_t v4 = &_os_log_internal;
        uint64_t v5 = "%s: Received error XPC_ERROR_CONNECTION_INTERRUPTED\n";
        goto LABEL_11;
      }
    }
LABEL_12:
    disconnect((xpc_connection_t *)(*(void *)(a1[4] + 8) + 40));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_5;
    block[3] = &__block_descriptor_tmp_6;
    uint64_t v6 = a1[5];
    block[4] = a1[6];
    dispatch_sync(v6, block);
  }
}

uint64_t __ApplePhotonDetectorServicesGetLux_block_invoke_5(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = -536870165;
  return result;
}

void __ApplePhotonDetectorServicesGetLux_block_invoke_2(uint64_t a1)
{
}

uint64_t ApplePhotonDetectorServicesGetCoex(io_iterator_t *a1)
{
  *(void *)io_iterator_t existing = 0;
  uint64_t v1 = 3758097097;
  int valuePtr = 0;
  if (a1)
  {
    uint64_t v3 = 0;
    *a1 = 0;
    mach_port_t v4 = *MEMORY[0x263F0EC88];
    char v5 = 1;
    while (1)
    {
      char v6 = v5;
      CFDictionaryRef v7 = IOServiceMatching(off_26523C070[v3]);
      IOServiceGetMatchingServices(v4, v7, &existing[1]);
      char v5 = existing[1];
      if (existing[1]) {
        break;
      }
      uint64_t v3 = 1;
      if ((v6 & 1) == 0) {
        return 3758097086;
      }
    }
    CFDictionaryRef v11 = IOServiceNameMatching(off_26523C070[v3]);
    io_service_t MatchingService = IOServiceGetMatchingService(v4, v11);
    io_registry_entry_t v8 = MatchingService;
    if (MatchingService)
    {
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFNumberRef v14 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"StrobeState", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
      CFNumberRef v9 = v14;
      if (v14)
      {
        CFNumberGetValue(v14, kCFNumberSInt32Type, existing);
        CFNumberRef v15 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v8, "IOService", @"LidarState", v13, 3u);
        CFNumberRef v10 = v15;
        if (v15)
        {
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          uint64_t v1 = 0;
          *a1 = existing[0] | (2 * valuePtr);
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v1 = 0;
      CFNumberRef v9 = 0;
    }
    CFNumberRef v10 = 0;
  }
  else
  {
    io_registry_entry_t v8 = 0;
    CFNumberRef v9 = 0;
    CFNumberRef v10 = 0;
    uint64_t v1 = 3758097090;
  }
LABEL_13:
  if (existing[1])
  {
    IOObjectRelease(existing[1]);
    existing[1] = 0;
  }
  if (v8) {
    IOObjectRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v1;
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (MEMORY[0x24C57A6F0](a2) == MEMORY[0x263EF8720] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    int v4 = 136315394;
    char v5 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    __int16 v6 = 2080;
    CFDictionaryRef v7 = string;
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received error %s\n", (uint8_t *)&v4, 0x16u);
  }
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x24C57A6F0](a2);
  bzero(__dst, 0xE60uLL);
  if (v4 == MEMORY[0x263EF8708])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(a2, *(const char **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), &length);
    if (data)
    {
      size_t v6 = length;
      if (length == 3680)
      {
        memcpy(__dst, data, sizeof(__dst));
        if (BYTE4(__dst[13])) {
          goto LABEL_17;
        }
        int v7 = -536870184;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315138;
        float v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v8 = &_os_log_internal;
        CFNumberRef v9 = "%s: lux cache is not ready with valid data\n";
        goto LABEL_12;
      }
      int v7 = -536870209;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        float v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        __int16 v23 = 2048;
        size_t v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = 3680;
        uint64_t v8 = &_os_log_internal;
        CFNumberRef v9 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        uint32_t v10 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      int v7 = -536870209;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        float v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        uint64_t v8 = &_os_log_internal;
        CFNumberRef v9 = "%s: Could not get the required data\n";
LABEL_12:
        uint32_t v10 = 12;
LABEL_15:
        _os_log_impl(&dword_24866F000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      }
    }
LABEL_16:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Received a response of an unknown type\n", buf, 0xCu);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870199;
LABEL_17:
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    *(unsigned char *)(v11 + 36) = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    if (*(unsigned char *)(v11 + 36))
    {
      unint64_t v12 = 0;
      unsigned int v13 = __dst[13];
      do
      {
        CFNumberRef v14 = &__dst[3 * v13 + 1];
        int v15 = *((_DWORD *)v14 + 1);
        *(_DWORD *)(*(void *)v11 + 4 * v12) = *(_DWORD *)v14;
        *(void *)(*(void *)(v11 + 16) + 8 * v12) = v14[1];
        *(unsigned char *)(*(void *)(v11 + 24) + v12) = *((unsigned char *)v14 + 16);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)(*(void *)(v11 + 8) + 4 * v12) = v15;
        unsigned int v13 = ((_BYTE)v13 + 1) & 3;
        ++v12;
      }
      while (v12 < *(unsigned __int8 *)(v11 + 36));
    }
  }
  *(_DWORD *)(v11 + 32) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 0x40000000;
    v18[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_22;
    v18[3] = &__block_descriptor_tmp_23;
    v18[4] = v16;
    v18[5] = v11;
    uint32_t v17 = *(NSObject **)(a1 + 64);
    v18[6] = *(void *)(a1 + 72);
    dispatch_async(v17, v18);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
  disconnectFromDaemon(*(NSObject ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t ApplePhotonDetectorServicesOpen(dispatch_object_t **a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (dispatch_object_t *)malloc_type_calloc(1uLL, 0x60uLL, 0x1070040F3C029C4uLL);
  if (!v2)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v7 = 136315394;
    uint64_t v8 = "ApplePhotonDetectorServicesOpen";
    __int16 v9 = 1024;
    int v10 = 889;
    char v5 = &_os_log_internal;
    size_t v6 = "%s: %d: Could not open an interface to APDS\n";
LABEL_8:
    _os_log_impl(&dword_24866F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x12u);
LABEL_9:
    if (*v2) {
      dispatch_release(*v2);
    }
    goto LABEL_11;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.applephotondetectorservicesprivatequeue", 0);
  *uint64_t v2 = v3;
  if (!v3)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      free(v2);
      uint64_t v2 = 0;
      uint64_t result = 3758097085;
      goto LABEL_12;
    }
    int v7 = 136315394;
    uint64_t v8 = "ApplePhotonDetectorServicesOpen";
    __int16 v9 = 1024;
    int v10 = 897;
    char v5 = &_os_log_internal;
    size_t v6 = "%s: %d: Could not create a serial queue\n";
    goto LABEL_8;
  }
  uint64_t result = 0;
LABEL_12:
  *a1 = v2;
  return result;
}

uint64_t ApplePhotonDetectorServicesClose(NSObject **a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      dispatch_release(v2);
    }
    free(a1);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      char v5 = "ApplePhotonDetectorServicesClose";
      __int16 v6 = 1024;
      int v7 = 932;
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      _os_log_impl(&dword_24866F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: %d: Invalid handle provided %p\n", (uint8_t *)&v4, 0x1Cu);
    }
    return 3758096385;
  }
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}