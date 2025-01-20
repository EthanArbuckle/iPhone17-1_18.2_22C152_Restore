@interface AVConferenceXPCServer
+ (BOOL)clientWithToken:(id *)a3 hasEntitlement:(id)a4;
+ (id)AVConferenceXPCServerSingleton;
- (AVConferenceXPCServer)allocWithZone:(_NSZone *)a3;
- (AVConferenceXPCServer)init;
- (NSMutableDictionary)registeredBlocks;
- (OS_xpc_object)listener;
- (id)_xpc_get_connection_from_list_for_connection:(id)a3;
- (id)_xpc_get_connection_from_list_for_context:(id)a3;
- (id)_xpc_get_connections_from_list_for_context:(id)a3;
- (id)authorizedTokenData;
- (id)newClientDiedDictionary;
- (id)newNSDictionaryFromNSError:(id)a3;
- (id)newNSDictionaryFromXPCDictionary:(id)a3;
- (id)newNSDictionaryWidthNSDictionary:(id)a3;
- (id)newNSErrorFromNSDictionary:(id)a3;
- (id)newXPCDictionaryFromNSDictionary:(id)a3 forEvent:(id)a4;
- (unint64_t)retainCount;
- (void)_xpc_add_connection_to_list:(id)a3;
- (void)_xpc_handle_incoming_request:(id)a3;
- (void)_xpc_remove_connection_from_list:(id)a3;
- (void)_xpc_remove_connections_from_list;
- (void)_xpc_start_listening_for_connections;
- (void)appendContextToDictionary:(id)a3 forConnection:(id)a4;
- (void)appendPIDToDictionary:(id)a3 pid:(int)a4;
- (void)dealloc;
- (void)deregisterFromService:(const char *)a3;
- (void)registerBlockForService:(const char *)a3 block:(id)a4;
- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)a5;
- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 context:(id)a5;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 toAllClientsWithContext:(id)a5;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 context:(id)a6;
@end

@implementation AVConferenceXPCServer

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((int)[*(id *)(a1 + 32) eventLogLevel] > ErrorLogLevelForModule
    || (int)[*(id *)(a1 + 32) eventLogLevel] < 1)
  {
    goto LABEL_21;
  }
  [*(id *)(a1 + 32) eventLogLevel];
  uint64_t v3 = VRTraceErrorLogLevelToCSTR();
  if ((int)[*(id *)(a1 + 32) eventLogLevel] > 2)
  {
    if ((int)[*(id *)(a1 + 32) eventLogLevel] <= 4)
    {
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      goto LABEL_6;
    }
    if ((int)[*(id *)(a1 + 32) eventLogLevel] >= 8)
    {
      if ((int)[*(id *)(a1 + 32) eventLogLevel] > 8) {
        goto LABEL_21;
      }
      v4 = *MEMORY[0x1E4F47A50];
      v5 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_4();
        }
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
    }
    else
    {
      v4 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
    }
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = v3;
    __int16 v20 = 2080;
    v21 = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 803;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    __int16 v26 = 2048;
    uint64_t v27 = v6;
    __int16 v28 = 2048;
    uint64_t v29 = v8;
    _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", buf, 0x3Au);
    goto LABEL_21;
  }
  if (VRTraceIsOSFaultDisabled())
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
LABEL_6:
    }
      __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
  {
    __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_2();
  }
LABEL_21:
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setLastCalledApiName:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) startTimeoutTimer];
  *(void *)buf = 0;
  v9 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) stopTimeoutTimer];
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v11 = [v9 objectForKeyedSubscript:@"CONTEXT"];
  if (v11 && v11 != [MEMORY[0x1E4F1CA98] null])
  {
    v12 = *(NSObject **)(*(void *)(a1 + 56) + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_211;
    block[3] = &unk_1E6DB4540;
    uint64_t v13 = *(void *)(a1 + 96);
    block[4] = v11;
    block[5] = v13;
    dispatch_barrier_sync(v12, block);
  }
  xpc_retain(*(xpc_object_t *)(a1 + 64));
  uint64_t v14 = *(void *)(a1 + 56);
  v15 = *(NSObject **)(v14 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2_212;
  v17[3] = &unk_1E6DB8700;
  uint64_t v16 = *(void *)(a1 + 72);
  v17[4] = *(void *)(a1 + 64);
  v17[5] = v9;
  v17[6] = *(void *)buf;
  v17[7] = v11;
  v17[8] = v14;
  v17[9] = v16;
  v17[10] = *(void *)(a1 + 96);
  dispatch_async(v15, v17);
  xpc_release(*(xpc_object_t *)(a1 + 64));
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E4E59BB0](a2) == MEMORY[0x1E4F14590])
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpc_add_connection_to_list:", *(void *)(a1 + 40));
    *(void *)v77 = 0;
    *(void *)&v77[8] = v77;
    *(void *)&v77[16] = 0x3052000000;
    v78 = __Block_byref_object_copy__29;
    v79 = __Block_byref_object_dispose__29;
    uint64_t v80 = 0;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2;
    v64[3] = &unk_1E6DB43B0;
    long long v65 = *(_OWORD *)(a1 + 32);
    uint64_t v16 = *(NSObject **)(v65 + 48);
    v66 = v77;
    dispatch_barrier_sync(v16, v64);
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3052000000;
    v61 = __Block_byref_object_copy__29;
    v62 = __Block_byref_object_dispose__29;
    uint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v63 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a2, "API"));
    xpc_object_t value = xpc_dictionary_get_value(a2, "XPCARGUMENTS");
    v18 = value;
    if (value)
    {
      xpc_retain(value);
      xpc_dictionary_set_value(a2, "XPCARGUMENTS", 0);
    }
    v19 = (void *)[*(id *)(a1 + 32) newNSDictionaryFromXPCDictionary:a2];
    __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v19];

    if (objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"CACHEAUTHTOKEN"), "BOOLValue"))
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a1 + 48 length:32];
      __int16 v22 = *(void **)(*(void *)&v77[8] + 40);
      if (v22 && ![v22 tokenData])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          __int16 v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = v23;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v73) = 766;
            WORD2(v73) = 1024;
            *(_DWORD *)((char *)&v73 + 6) = pid;
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: caching audit token from PID %d", buf, 0x22u);
          }
        }
        [*(id *)(*(void *)&v77[8] + 40) setTokenData:v21];
      }
    }
    if (xpc_dictionary_get_BOOL(a2, "USERPERSISTENT")) {
      [*(id *)(*(void *)&v77[8] + 40) setPersistent:1];
    }
    if (v18)
    {
      [v20 setObject:v18 forKeyedSubscript:@"USERXPCARGUMENTS"];
      xpc_release(v18);
    }
    [*(id *)(a1 + 32) appendPIDToDictionary:v20 pid:xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40))];
    [*(id *)(a1 + 32) appendContextToDictionary:v20 forConnection:*(void *)(a1 + 40)];
    __int16 v26 = *(void **)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v26);
    uint64_t v27 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v59[5]];
    __int16 v28 = v27;
    if (!v27)
    {
      objc_sync_exit(v26);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = v59[5];
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = v35;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke_3";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v73) = 888;
          WORD2(v73) = 2112;
          *(void *)((char *)&v73 + 6) = v37;
          _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: invalid service requested or no block registered for service %@, ignoring", buf, 0x26u);
        }
      }
      goto LABEL_60;
    }
    uint64_t v29 = [v27 block];
    uint64_t v30 = [v28 queue];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((int)[v28 eventLogLevel] > ErrorLogLevelForModule || (int)objc_msgSend(v28, "eventLogLevel") < 1) {
      goto LABEL_59;
    }
    [v28 eventLogLevel];
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    if ((int)[v28 eventLogLevel] > 2)
    {
      if ((int)[v28 eventLogLevel] > 4)
      {
        if ((int)[v28 eventLogLevel] > 7)
        {
          if ((int)[v28 eventLogLevel] > 8) {
            goto LABEL_59;
          }
          v43 = *MEMORY[0x1E4F47A50];
          v44 = *MEMORY[0x1E4F47A50];
          if (!*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v50 = v59[5];
              *(_DWORD *)buf = 136316418;
              *(void *)&buf[4] = v32;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v73) = 796;
              WORD2(v73) = 2112;
              *(void *)((char *)&v73 + 6) = v50;
              HIWORD(v73) = 2048;
              uint64_t v74 = v29;
              __int16 v75 = 2048;
              v76 = v30;
              _os_log_debug_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
            }
            goto LABEL_59;
          }
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_59;
          }
        }
        else
        {
          v43 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_59;
          }
        }
        uint64_t v45 = v59[5];
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v32;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v73) = 796;
        WORD2(v73) = 2112;
        *(void *)((char *)&v73 + 6) = v45;
        HIWORD(v73) = 2048;
        uint64_t v74 = v29;
        __int16 v75 = 2048;
        v76 = v30;
        _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
        goto LABEL_59;
      }
      v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
LABEL_47:
        uint64_t v41 = v59[5];
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v32;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v73) = 796;
        WORD2(v73) = 2112;
        *(void *)((char *)&v73 + 6) = v41;
        HIWORD(v73) = 2048;
        uint64_t v74 = v29;
        __int16 v75 = 2048;
        v76 = v30;
        _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
      }
    }
    else
    {
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v34 = *MEMORY[0x1E4F47A50];
      if ((IsOSFaultDisabled & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          uint64_t v42 = v59[5];
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v32;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v73) = 796;
          WORD2(v73) = 2112;
          *(void *)((char *)&v73 + 6) = v42;
          HIWORD(v73) = 2048;
          uint64_t v74 = v29;
          __int16 v75 = 2048;
          v76 = v30;
          _os_log_fault_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_FAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
        }
        goto LABEL_59;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
    }
LABEL_59:
    id v46 = *(id *)(*(void *)&v77[8] + 40);
    id v47 = (id)v59[5];
    xpc_retain(a2);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210;
    v57[3] = &unk_1E6DB8728;
    v57[10] = v29;
    v57[11] = &v58;
    v57[4] = v28;
    v57[5] = v30;
    v57[12] = v77;
    uint64_t v48 = *(void *)(a1 + 32);
    uint64_t v49 = *(void *)(a1 + 40);
    v57[6] = v20;
    v57[7] = v48;
    v57[8] = a2;
    v57[9] = v49;
    dispatch_async(v30, v57);
    objc_sync_exit(v26);
LABEL_60:

    _Block_object_dispose(&v58, 8);
    v40 = v77;
    goto LABEL_61;
  }
  if (MEMORY[0x1E4E59BB0](a2) != MEMORY[0x1E4F145A8]) {
    return;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  *(void *)&long long v73 = __Block_byref_object_copy__29;
  *((void *)&v73 + 1) = __Block_byref_object_dispose__29;
  uint64_t v74 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_218;
  block[3] = &unk_1E6DB43B0;
  long long v55 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(v55 + 48);
  v56 = buf;
  dispatch_barrier_sync(v4, block);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14530]);
        __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_cold_1(v5, (uint64_t)string, v77, v6);
      }
    }
    if (xpc_dictionary_get_BOOL(a2, "USERPERSISTENT")) {
      [*(id *)(*(void *)&buf[8] + 40) setPersistent:1];
    }
    uint64_t v8 = (void *)[*(id *)(a1 + 32) newClientDiedDictionary];
    [*(id *)(a1 + 32) appendPIDToDictionary:v8 pid:xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40))];
    [*(id *)(a1 + 32) appendContextToDictionary:v8 forConnection:*(void *)(a1 + 40)];
    id v51 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v51);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v9 = a1;
    id obj = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = [obj countByEnumeratingWithState:&v68 objects:v67 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v69 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = (void *)[*(id *)(*(void *)(v9 + 32) + 24) objectForKeyedSubscript:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          uint64_t v14 = [v13 block];
          v15 = [v13 queue];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_220;
          v53[3] = &unk_1E6DB5000;
          v53[4] = v8;
          v53[5] = v14;
          dispatch_async(v15, v53);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v68 objects:v67 count:16];
      }
      while (v10);
    }
    objc_sync_exit(v51);

    objc_msgSend(*(id *)(v9 + 32), "_xpc_remove_connection_from_list:", *(void *)(v9 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 136315650;
      *(void *)&v77[4] = v38;
      *(_WORD *)&v77[12] = 2080;
      *(void *)&v77[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke_2";
      *(_WORD *)&v77[22] = 1024;
      LODWORD(v78) = 899;
      _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: client connection fully disconnected or error from unrecognized client", v77, 0x1Cu);
    }
  }
  v40 = buf;
LABEL_61:
  _Block_object_dispose(v40, 8);
}

void __52__AVConferenceXPCServer_sendMessageAsync_arguments___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        xpc_connection_send_message((xpc_connection_t)[*(id *)(*((void *)&v8 + 1) + 8 * i) connection], *(xpc_object_t *)(a1 + 40));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

- (id)_xpc_get_connection_from_list_for_connection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clientConnections = self->clientConnections;
  uint64_t v6 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(clientConnections);
    }
    long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if ((id)[v10 connection] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_xpc_add_connection_to_list:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AVConferenceXPCServer_XPCManagement___xpc_add_connection_to_list___block_invoke;
    block[3] = &unk_1E6DB3E40;
    void block[4] = self;
    block[5] = a3;
    dispatch_barrier_sync(clientConnectionsQueue, block);
  }
}

- (id)newNSDictionaryFromXPCDictionary:(id)a3
{
  if (a3) {
    return (id)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    return 0;
  }
}

- (void)appendPIDToDictionary:(id)a3 pid:(int)a4
{
  id v5 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a4];
  [a3 setObject:v5 forKeyedSubscript:@"CLIENTPID"];
}

- (void)appendContextToDictionary:(id)a3 forConnection:(id)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  [a3 setObject:0 forKeyedSubscript:@"CONTEXT"];
  if (a4)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__AVConferenceXPCServer_appendContextToDictionary_forConnection___block_invoke;
    v8[3] = &unk_1E6DB43D8;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    dispatch_sync(clientConnectionsQueue, v8);
  }
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2_212(uint64_t a1)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "API");
  BOOL v3 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "EXPECTSREPLY");
  BOOL v4 = v3;
  if (*(void *)(a1 + 40) || (*(void *)(a1 + 48) ? (int v5 = 1) : (int v5 = v3), v5 == 1))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 40)];
    [v8 removeObjectForKey:@"CONTEXT"];
    if (*(void *)(a1 + 48))
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 64), "newNSDictionaryFromNSError:");
      [v8 setObject:v9 forKeyedSubscript:@"ERROR"];
    }
    if (v4) {
      uint64_t v10 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v10 = 0;
    }
    long long v11 = (void *)[*(id *)(a1 + 64) newXPCDictionaryFromNSDictionary:v8 forEvent:v10];
    xpc_dictionary_set_string(v11, "API", string);
    if ([v8 objectForKeyedSubscript:@"USERXPCARGUMENTS"]) {
      xpc_dictionary_set_value(v11, "XPCARGUMENTS", (xpc_object_t)[v8 objectForKeyedSubscript:@"USERXPCARGUMENTS"]);
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), v11);
    if (v6 == v7) {
      objc_msgSend(*(id *)(a1 + 64), "_xpc_remove_connection_from_list:", *(void *)(a1 + 72));
    }

    xpc_release(v11);
    uint64_t v12 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v12 = 0;
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
  long long v13 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v14 = v7;
          __int16 v15 = 2080;
          long long v16 = "-[AVConferenceXPCServer sendMessageAsync:arguments:]";
          __int16 v17 = 1024;
          int v18 = 369;
          __int16 v19 = 2080;
          __int16 v20 = a3;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:]();
      }
    }
    id v10 = [(AVConferenceXPCServer *)self newXPCDictionaryFromNSDictionary:a4 forEvent:0];
    xpc_dictionary_set_string(v10, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__AVConferenceXPCServer_sendMessageAsync_arguments___block_invoke;
    v12[3] = &unk_1E6DB3E40;
    v12[4] = self;
    v12[5] = v10;
    dispatch_sync(clientConnectionsQueue, v12);
  }
}

- (id)newXPCDictionaryFromNSDictionary:(id)a3 forEvent:(id)a4
{
  if (a4) {
    xpc_object_t reply = xpc_dictionary_create_reply(a4);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v6 = reply;
  if (a3)
  {
    uint64_t v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v7)
    {
      uint64_t v8 = v7;
      xpc_dictionary_set_value(v6, "RESULTS", v7);
      xpc_release(v8);
    }
  }
  return v6;
}

void __68__AVConferenceXPCServer_XPCManagement___xpc_add_connection_to_list___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(void *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      BOOL v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        int v6 = 136315906;
        uint64_t v7 = v2;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVConferenceXPCServer(XPCManagement) _xpc_add_connection_to_list:]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 959;
        __int16 v12 = 1024;
        pid_t v13 = pid;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: _xpc_add_connection_to_list PID %d", (uint8_t *)&v6, 0x22u);
      }
    }
    int v5 = objc_alloc_init(VCXPCConnection);
    [(VCXPCConnection *)v5 setConnection:*(void *)(a1 + 40)];
    [(VCXPCConnection *)v5 setPid:xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40))];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v5];
    [(VCXPCConnection *)v5 createTimeoutTimer];
  }
}

void *__65__AVConferenceXPCServer_appendContextToDictionary_forConnection___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(void *)(a1 + 40));
  if (result)
  {
    BOOL v3 = result;
    uint64_t result = (void *)[result context];
    if (result)
    {
      uint64_t v4 = [v3 context];
      int v5 = *(void **)(a1 + 48);
      return (void *)[v5 setObject:v4 forKeyedSubscript:@"CONTEXT"];
    }
  }
  return result;
}

+ (id)AVConferenceXPCServerSingleton
{
  BOOL v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (!_xpcServerSingleton) {
    _xpcServerSingleton = (uint64_t)objc_alloc_init((Class)a1);
  }
  objc_sync_exit(v3);
  return (id)_xpcServerSingleton;
}

uint64_t __61__AVConferenceXPCServer__xpc_start_listening_for_connections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpc_handle_incoming_request:", a2);
}

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_211(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setContext:*(void *)(a1 + 32)];
}

- (void)_xpc_handle_incoming_request:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      buf[0].val[0] = 136315650;
      *(void *)&buf[0].val[1] = v5;
      LOWORD(buf[0].val[3]) = 2080;
      *(void *)((char *)&buf[0].val[3] + 2) = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]";
      HIWORD(buf[0].val[5]) = 1024;
      buf[0].val[6] = 702;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: AVConferenceXPCServer _xpc_handle_connection incoming request", (uint8_t *)buf, 0x1Cu);
    }
  }
  if (MEMORY[0x1E4E59BB0](a3) == MEMORY[0x1E4F14578])
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v33.val[4] = v7;
    *(_OWORD *)v33.val = v7;
    CFErrorRef error = 0;
    xpc_connection_get_audit_token();
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    buf[0] = v33;
    uint64_t v9 = SecTaskCreateWithAuditToken(v8, buf);
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v9, @"com.apple.videoconference.allow-conferencing", &error);
    int v11 = v10;
    if (v10) {
      BOOL v12 = error == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12 && (CFTypeID v13 = CFGetTypeID(v10), v13 == CFBooleanGetTypeID()) && CFBooleanGetValue((CFBooleanRef)v11))
    {
      if (v9) {
        CFRelease(v9);
      }
      CFRelease(v11);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)self->incomingMessageQueue);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke;
      handler[3] = &unk_1E6DB8750;
      handler[4] = self;
      handler[5] = a3;
      audit_token_t v19 = v33;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_resume((xpc_connection_t)a3);
    }
    else
    {
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
      bzero((char *)buf[0].val + 3, 0x3FDuLL);
      memset(buf, 63, 3);
      proc_name(pid, buf, 0x400u);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        long long v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int16 v20 = 136316418;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          uint64_t v23 = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]";
          __int16 v24 = 1024;
          int v25 = 723;
          __int16 v26 = 2080;
          uint64_t v27 = buf;
          __int16 v28 = 1024;
          pid_t v29 = pid;
          __int16 v30 = 2080;
          v31 = "com.apple.videoconference.allow-conferencing";
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d Process %s (PID=%d) is missing entitlement %s, ignoring connection", v20, 0x36u);
        }
      }
      CFShow(v11);
      CFShow(error);
      if (v9) {
        CFRelease(v9);
      }
      if (v11) {
        CFRelease(v11);
      }
      if (error) {
        CFRelease(error);
      }
      xpc_connection_cancel((xpc_connection_t)a3);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]();
    }
  }
}

- (AVConferenceXPCServer)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVConferenceXPCServer;
  uint64_t v2 = [(AVConferenceXPCServer *)&v5 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->incomingMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.incomingQueue", 0, CustomRootQueue);
    v2->outgoingMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.outgoingQueue", 0, CustomRootQueue);
    v2->clientConnectionsQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.clientConnectionsQueue", MEMORY[0x1E4F14430], CustomRootQueue);
    v2->clientConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->registeredBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(AVConferenceXPCServer *)v2 registerBlockForService:"pingServer" block:&__block_literal_global_67];
  }
  return v2;
}

uint64_t __29__AVConferenceXPCServer_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 objectForKeyedSubscript:@"CLIENTDIED"];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      objc_super v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v11 = v4;
          __int16 v12 = 2080;
          CFTypeID v13 = "-[AVConferenceXPCServer init]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 305;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Ping saw client death, ignored by ping", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __29__AVConferenceXPCServer_init__block_invoke_cold_1();
      }
    }
    return 0;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      CFAllocatorRef v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        CFTypeID v13 = "-[AVConferenceXPCServer init]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 307;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Server was pinged successfully", buf, 0x1Cu);
      }
    }
    return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"SUCCESS", @"Ping", 0);
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  dispatch_release((dispatch_object_t)self->incomingMessageQueue);
  dispatch_release((dispatch_object_t)self->outgoingMessageQueue);
  dispatch_release((dispatch_object_t)self->clientConnectionsQueue);
  [(AVConferenceXPCServer *)self _xpc_remove_connections_from_list];

  listener = self->listener;
  if (listener)
  {
    xpc_release(listener);
    self->listener = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVConferenceXPCServer;
  [(AVConferenceXPCServer *)&v4 dealloc];
}

- (AVConferenceXPCServer)allocWithZone:(_NSZone *)a3
{
  return (AVConferenceXPCServer *)_xpcServerSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 context:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      CFTypeID v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v18 = v11;
          __int16 v19 = 2080;
          __int16 v20 = "-[AVConferenceXPCServer sendMessageAsync:arguments:xpcArguments:context:]";
          __int16 v21 = 1024;
          int v22 = 394;
          __int16 v23 = 2080;
          __int16 v24 = a3;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:xpcArguments:context:]();
      }
    }
    id v14 = [(AVConferenceXPCServer *)self newXPCDictionaryFromNSDictionary:a4 forEvent:0];
    xpc_dictionary_set_string(v14, "API", a3);
    if (a5) {
      xpc_dictionary_set_value(v14, "XPCARGUMENTS", a5);
    }
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AVConferenceXPCServer_sendMessageAsync_arguments_xpcArguments_context___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    block[5] = a6;
    void block[6] = v14;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __73__AVConferenceXPCServer_sendMessageAsync_arguments_xpcArguments_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_context:", *(void *)(a1 + 40));
  if (v2) {
    xpc_connection_send_message((xpc_connection_t)[v2 connection], *(xpc_object_t *)(a1 + 48));
  }
  BOOL v3 = *(void **)(a1 + 48);

  xpc_release(v3);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      CFTypeRef v10 = *MEMORY[0x1E4F47A50];
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          uint64_t v18 = "-[AVConferenceXPCServer sendMessageAsync:arguments:context:]";
          __int16 v19 = 1024;
          int v20 = 421;
          __int16 v21 = 2080;
          int v22 = a3;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to client for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:context:]();
      }
    }
    id v12 = [(AVConferenceXPCServer *)self newXPCDictionaryFromNSDictionary:a4 forEvent:0];
    xpc_dictionary_set_string(v12, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AVConferenceXPCServer_sendMessageAsync_arguments_context___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    block[5] = a5;
    void block[6] = v12;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __60__AVConferenceXPCServer_sendMessageAsync_arguments_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_context:", *(void *)(a1 + 40));
  if (v2) {
    xpc_connection_send_message((xpc_connection_t)[v2 connection], *(xpc_object_t *)(a1 + 48));
  }
  BOOL v3 = *(void **)(a1 + 48);

  xpc_release(v3);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 toAllClientsWithContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      CFTypeRef v10 = *MEMORY[0x1E4F47A50];
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          uint64_t v18 = "-[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:]";
          __int16 v19 = 1024;
          int v20 = 446;
          __int16 v21 = 2080;
          int v22 = a3;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to all clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:]();
      }
    }
    id v12 = [(AVConferenceXPCServer *)self newXPCDictionaryFromNSDictionary:a4 forEvent:0];
    xpc_dictionary_set_string(v12, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__AVConferenceXPCServer_sendMessageAsync_arguments_toAllClientsWithContext___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    block[5] = a5;
    void block[6] = v12;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __76__AVConferenceXPCServer_sendMessageAsync_arguments_toAllClientsWithContext___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connections_from_list_for_context:", *(void *)(a1 + 40));
  if ((unint64_t)[v2 count] >= 2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v3;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 459;
      __int16 v20 = 2048;
      uint64_t v21 = [v2 count];
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: XPC connectionsToUse count =%lu", buf, 0x26u);
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v2);
        }
        xpc_connection_send_message((xpc_connection_t)[*(id *)(*((void *)&v10 + 1) + 8 * v8++) connection], *(xpc_object_t *)(a1 + 48));
      }
      while (v6 != v8);
      uint64_t v6 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4
{
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)a5
{
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    uint64_t v7 = *(void *)&a6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        __int16 v20 = "-[AVConferenceXPCServer registerBlockForService:block:queue:eventLogLevel:]";
        __int16 v21 = 1024;
        int v22 = 482;
        __int16 v23 = 2080;
        __int16 v24 = a3;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Adding registered block for service %s", (uint8_t *)&v17, 0x26u);
      }
    }
    long long v13 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    id v14 = (void *)[a4 copy];
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(2, 0);
    }
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    __int16 v16 = (VCXPCServerUser *)[(NSMutableDictionary *)self->registeredBlocks objectForKeyedSubscript:v13];
    if (!v16)
    {
      __int16 v16 = objc_alloc_init(VCXPCServerUser);
      [(NSMutableDictionary *)self->registeredBlocks setObject:v16 forKeyedSubscript:v13];
    }
    [(VCXPCServerUser *)v16 setBlock:v14];
    [(VCXPCServerUser *)v16 setQueue:global_queue];
    [(VCXPCServerUser *)v16 setEventLogLevel:v7];
    objc_sync_exit(registeredBlocks);
  }
}

- (void)deregisterFromService:(const char *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        long long v12 = "-[AVConferenceXPCServer deregisterFromService:]";
        __int16 v13 = 1024;
        int v14 = 517;
        __int16 v15 = 2080;
        __int16 v16 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Removing registered block for service %s", (uint8_t *)&v9, 0x26u);
      }
    }
    uint64_t v7 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    [(NSMutableDictionary *)self->registeredBlocks removeObjectForKey:v7];
    objc_sync_exit(registeredBlocks);
  }
}

- (id)newNSErrorFromNSDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ERROR_DOMAIN"];
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"ERROR_USERINFO"];

  return (id)[v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (id)newNSDictionaryFromNSError:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(a3, "code"));
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), @"ERROR_DOMAIN", v4, @"ERROR_CODE", objc_msgSend(a3, "userInfo"), @"ERROR_USERINFO", 0);

  return v5;
}

- (id)newNSDictionaryWidthNSDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  id v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVConferenceXPCServer_newNSDictionaryWidthNSDictionary___block_invoke;
  v6[3] = &unk_1E6DB86D8;
  v6[4] = v4;
  v6[5] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  _Block_object_dispose(v7, 8);
  return v4;
}

uint64_t __58__AVConferenceXPCServer_newNSDictionaryWidthNSDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setObject:a2, objc_msgSend(NSString, "stringWithFormat:", @"k_%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) forKeyedSubscript];
  uint64_t v5 = NSString;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(unsigned int *)(v7 + 24);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  uint64_t v9 = objc_msgSend(v5, "stringWithFormat:", @"v_%d", v8);

  return [v6 setObject:a3 forKeyedSubscript:v9];
}

- (id)newClientDiedDictionary
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CLIENTDIED", 0);
}

- (void)_xpc_start_listening_for_connections
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (AVConferenceServer_ProcessIsAVConferenceServer()) {
    uint64_t v3 = "com.apple.videoconference.camera";
  }
  else {
    uint64_t v3 = "com.apple.avconference.xpc";
  }
  self->listener = xpc_connection_create_mach_service(v3, (dispatch_queue_t)self->incomingMessageQueue, 1uLL);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      listener = self->listener;
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      long long v12 = "-[AVConferenceXPCServer _xpc_start_listening_for_connections]";
      __int16 v13 = 1024;
      int v14 = 648;
      __int16 v15 = 2080;
      __int16 v16 = v3;
      __int16 v17 = 2048;
      uint64_t v18 = listener;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d name=%s, listener=%p", buf, 0x30u);
    }
  }
  uint64_t v7 = self->listener;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __61__AVConferenceXPCServer__xpc_start_listening_for_connections__block_invoke;
  handler[3] = &unk_1E6DB79C0;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->listener);
}

- (id)authorizedTokenData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  uint64_t v10 = __Block_byref_object_dispose__29;
  uint64_t v11 = 0;
  clientConnectionsQueue = self->clientConnectionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVConferenceXPCServer_authorizedTokenData__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  void block[4] = self;
  block[5] = &v6;
  dispatch_sync(clientConnectionsQueue, block);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVConferenceXPCServer_authorizedTokenData__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if ([v7 tokenData])
        {
          uint64_t result = [v7 tokenData];
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

+ (BOOL)clientWithToken:(id *)a3 hasEntitlement:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a4 length]) {
    return 0;
  }
  CFErrorRef error = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  uint64_t v8 = SecTaskCreateWithAuditToken(v6, &token);
  CFTypeRef v9 = SecTaskCopyValueForEntitlement(v8, (CFStringRef)a4, &error);
  if (v9) {
    BOOL v10 = error == 0;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v11 = v10;
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  return v11;
}

- (OS_xpc_object)listener
{
  return self->listener;
}

- (NSMutableDictionary)registeredBlocks
{
  return self->registeredBlocks;
}

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_218(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_220(uint64_t a1)
{
  v1 = (void *)(*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_xpc_remove_connection_from_list:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connection_from_list___block_invoke;
    block[3] = &unk_1E6DB3E40;
    void block[4] = self;
    block[5] = a3;
    dispatch_barrier_sync(clientConnectionsQueue, block);
  }
}

uint64_t __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connection_from_list___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(void *)(a1 + 40));
  if (result)
  {
    uint64_t v3 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        BOOL v10 = "-[AVConferenceXPCServer(XPCManagement) _xpc_remove_connection_from_list:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 987;
        __int16 v13 = 1024;
        pid_t v14 = pid;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: _xpc_remove_connection_from_list PID %d", (uint8_t *)&v7, 0x22u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v3];
  }
  return result;
}

- (void)_xpc_remove_connections_from_list
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      BOOL v10 = "-[AVConferenceXPCServer(XPCManagement) _xpc_remove_connections_from_list]";
      __int16 v11 = 1024;
      int v12 = 994;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  clientConnectionsQueue = self->clientConnectionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connections_from_list__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  void block[4] = self;
  dispatch_barrier_sync(clientConnectionsQueue, block);
}

uint64_t __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connections_from_list__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (id)_xpc_get_connection_from_list_for_context:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clientConnections = self->clientConnections;
  uint64_t v6 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(clientConnections);
    }
    BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if (objc_msgSend(a3, "isEqual:", objc_msgSend(v10, "context"))) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_xpc_get_connections_from_list_for_context:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  clientConnections = self->clientConnections;
  uint64_t v7 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(clientConnections);
        }
        __int16 v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v11, "context"))) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)clientConnections countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  int v12 = (void *)[v5 copy];

  return v12;
}

void __29__AVConferenceXPCServer_init__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 305;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Ping saw client death, ignored by ping", v1, 0x1Cu);
}

- (void)sendMessageAsync:arguments:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_16();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", v2, v3, v4, v5);
}

- (void)sendMessageAsync:arguments:xpcArguments:context:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_16();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", v2, v3, v4, v5);
}

- (void)sendMessageAsync:arguments:context:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_16();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to client for service %s", v2, v3, v4, v5);
}

- (void)sendMessageAsync:arguments:toAllClientsWithContext:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_16();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to all clients for service %s", v2, v3, v4, v5);
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 904;
  *((_WORD *)buf + 14) = 2080;
  *(void *)(buf + 30) = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: XPC Error, %s", buf, 0x26u);
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_1()
{
  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_11_5(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p");
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_2()
{
  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_0_4();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", v1, 0x3Au);
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_210_cold_4()
{
  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", v1, 0x3Au);
}

@end