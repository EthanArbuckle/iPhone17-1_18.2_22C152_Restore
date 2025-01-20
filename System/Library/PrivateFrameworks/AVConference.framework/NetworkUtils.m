@interface NetworkUtils
+ (BOOL)createAndStartListener:(id *)a3 withParameters:(id)a4;
+ (BOOL)createNWPathEvaluator:(id *)a3 withIPAddress:(id)a4 localPort:(int *)a5 remotePort:(int)a6 shouldRunInProcess:(BOOL)a7 useBackingSocket:(BOOL)a8;
+ (id)encryptionInfoForKey:(unint64_t)a3;
+ (id)networkEmulationSettings:(id)a3;
+ (id)networkEmulationSettings:(id)a3 onUplink:(BOOL)a4;
+ (id)newEncryptionInfoWithMediaKeyIndex:(id)a3 participantID:(id)a4;
+ (id)newNWConnectionWithIPAddress:(id)a3 srcPort:(signed __int16)a4;
+ (id)newRTPSocketDictionary:(BOOL)a3 rtpSourcePort:(signed __int16)a4;
+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3;
+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3 participantID:(id)a4;
+ (int)connectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5;
+ (int)nonConnectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5;
+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5;
+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 shouldConnect:(BOOL)a5 error:(id *)a6;
+ (void)setUniquePIDOnParameters:(id)a3 shouldRunInProcess:(BOOL)a4;
@end

@implementation NetworkUtils

+ (BOOL)createAndStartListener:(id *)a3 withParameters:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = nw_listener_create((nw_parameters_t)a4);
  if (!v5) {
    goto LABEL_6;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  nw_listener_set_queue(v5, global_queue);
  nw_listener_set_new_connection_handler(v5, &__block_literal_global_89);
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NetworkUtils_createAndStartListener_withParameters___block_invoke_2;
  v11[3] = &unk_1E6DB9318;
  v11[5] = v5;
  v11[6] = &v12;
  v11[4] = v7;
  MEMORY[0x1E4E58770](v5, v11);
  nw_listener_start(v5);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8)) {
    goto LABEL_6;
  }
  if (*((unsigned char *)v13 + 24))
  {
    *a3 = v5;
    BOOL v9 = 1;
    v5 = 0;
  }
  else
  {
LABEL_6:
    BOOL v9 = 0;
  }
  nw_release(v5);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __54__NetworkUtils_createAndStartListener_withParameters___block_invoke(uint64_t a1, NSObject *a2)
{
  NSLog(&cfstr_UnexpectedConn.isa);

  nw_connection_cancel(a2);
}

void __54__NetworkUtils_createAndStartListener_withParameters___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 3 || a3)
  {
LABEL_6:
    v4 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v4);
    return;
  }
  if (a2 != 4)
  {
    if (a2 != 2) {
      return;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  nw_release(*(void **)(a1 + 40));
  v5 = *(NSObject **)(a1 + 32);

  dispatch_release(v5);
}

+ (void)setUniquePIDOnParameters:(id)a3 shouldRunInProcess:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v4 = +[AVCDaemonProcessInfo getDaemonProcessInfo];
    if (!v4) {
      return;
    }
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"avcKeyDaemonProcessInfoUniquePID"), "longLongValue");
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    pid_t v5 = getpid();
    proc_pidinfo(v5, 17, 1uLL, v6, 56);
  }
  nw_parameters_set_delegated_unique_pid();
}

+ (BOOL)createNWPathEvaluator:(id *)a3 withIPAddress:(id)a4 localPort:(int *)a5 remotePort:(int)a6 shouldRunInProcess:(BOOL)a7 useBackingSocket:(BOOL)a8
{
  BOOL v8 = a7;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  nw_listener_t listener = 0;
  if (a8) {
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  }
  else {
    legacy_tcp_socket = nw_parameters_create();
  }
  uint64_t v14 = legacy_tcp_socket;
  if (legacy_tcp_socket)
  {
    char v15 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
    if (v15)
    {
      options = nw_udp_create_options();
      if (options)
      {
        nw_udp_options_set_no_metadata();
        nw_protocol_stack_set_transport_protocol(v15, options);
        nw_parameters_set_reuse_local_address(v14, 1);
        nw_parameters_set_disable_listener_datapath();
        +[VCVTPWrapper connectionContext];
        nw_parameters_set_context();
        if (a5 && *a5 != -1) {
          goto LABEL_14;
        }
        if ([a1 createAndStartListener:&listener withParameters:v14])
        {
          int port = nw_listener_get_port(listener);
          if (a5 && port)
          {
            *a5 = port;
LABEL_14:
            objc_msgSend(a4, "UTF8String", listener, v24);
            host_with_numeric_int port = nw_endpoint_create_host_with_numeric_port();
            if (host_with_numeric_port)
            {
              nw_parameters_set_local_endpoint(v14, host_with_numeric_port);
              [a1 setUniquePIDOnParameters:v14 shouldRunInProcess:v8];
              if (a5)
              {
                [a4 UTF8String];
                v19 = (void *)nw_endpoint_create_host_with_numeric_port();
                if (!v19)
                {
LABEL_26:
                  BOOL v21 = 0;
                  goto LABEL_21;
                }
              }
              else
              {
                v19 = 0;
              }
              evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
              if (evaluator_for_endpoint)
              {
                *a3 = evaluator_for_endpoint;
                nw_listener_cancel(listener);
                nw_listener_t listener = 0;
                BOOL v21 = 1;
                goto LABEL_21;
              }
              goto LABEL_26;
            }
            BOOL v21 = 0;
LABEL_25:
            v19 = 0;
            goto LABEL_21;
          }
          if (port) {
            goto LABEL_14;
          }
        }
      }
      BOOL v21 = 0;
      host_with_numeric_int port = 0;
      goto LABEL_25;
    }
    BOOL v21 = 0;
    host_with_numeric_int port = 0;
    v19 = 0;
  }
  else
  {
    BOOL v21 = 0;
    host_with_numeric_int port = 0;
    v19 = 0;
    char v15 = 0;
  }
  options = 0;
LABEL_21:
  nw_release(v15);
  nw_release(options);
  nw_release(host_with_numeric_port);
  nw_release(v19);
  nw_release(v14);
  nw_release(0);
  if (listener) {
    nw_release(listener);
  }
  return v21;
}

+ (id)newNWConnectionWithIPAddress:(id)a3 srcPort:(signed __int16)a4
{
  uint64_t v4 = [a1 connectedSocketWithIPAddress:a3 srcPort:a4 error:0];
  if (v4 == -1)
  {
    uint64_t v7 = 0;
    v6 = 0;
  }
  else
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    v6 = secure_udp;
    if (secure_udp)
    {
      nw_parameters_set_reuse_local_address(secure_udp, 1);
      uint64_t v7 = (void *)nw_connection_create_with_connected_socket_and_parameters();
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  VCCloseSocketIfValid(v4);
  nw_release(v6);
  return v7;
}

+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:a3 srcPort:a4 shouldConnect:0 error:a5];
}

+ (int)connectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:a3 srcPort:a4 shouldConnect:1 error:a5];
}

+ (int)nonConnectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:a3 srcPort:a4 shouldConnect:0 error:a5];
}

+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 shouldConnect:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  unsigned int v7 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(void *)&v14.sa_len = 0;
  *(void *)&v14.sa_data[6] = 0;
  int v9 = socket(2, 2, 0);
  if (v9 < 0)
  {
    perror("cannot create socket");
    return -1;
  }
  int v10 = v9;
  int v13 = 1;
  setsockopt(v9, 0xFFFF, 512, &v13, 4u);
  v14.sa_family = 2;
  *(_DWORD *)&v14.sa_data[2] = inet_addr((const char *)[a3 UTF8String]);
  *(_WORD *)v14.sa_data = bswap32(v7) >> 16;
  if (bind(v10, &v14, 0x10u) < 0)
  {
    v11 = "bind failed";
    goto LABEL_8;
  }
  if (v6 && connect(v10, &v14, 0x10u) < 0)
  {
    v11 = "connect failed";
LABEL_8:
    perror(v11);
    close(v10);
    return -1;
  }
  return v10;
}

+ (id)newRTPSocketDictionary:(BOOL)a3 rtpSourcePort:(signed __int16)a4
{
  BOOL v5 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  int v6 = +[NetworkUtils socketWithIPAddress:@"127.0.0.1" srcPort:a4 error:v12];
  if (v6 < 0)
  {
    perror("rtp socket creation failed");
    return 0;
  }
  int v7 = v6;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  int v9 = v8;
  if (!v5)
  {
    int v10 = +[NetworkUtils socketWithIPAddress:@"127.0.0.1" srcPort:(__int16)(a4 + 1) error:v12];
    if ((v10 & 0x80000000) == 0)
    {
      xpc_dictionary_set_fd(v9, "avcKeyRTPSocket", v7);
      xpc_dictionary_set_fd(v9, "avcKeyRTCPSocket", v10);
      close(v10);
      goto LABEL_6;
    }
    perror("rtcp socket creation failed");
    xpc_release(v9);
    close(v10);
    close(v7);
    return 0;
  }
  xpc_dictionary_set_fd(v8, "avcKeySharedSocket", v7);
LABEL_6:
  close(v7);
  return v9;
}

+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3
{
  return +[NetworkUtils securityKeyMaterialWithMediaKeyIndex:a3 participantID:0];
}

+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3 participantID:(id)a4
{
  v9[5] = *MEMORY[0x1E4F143B8];
  id v4 = +[NetworkUtils newEncryptionInfoWithMediaKeyIndex:a3 participantID:a4];
  v8[0] = @"SecurityKey";
  v9[0] = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A918]];
  v8[1] = @"SecuritySalt";
  v9[1] = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A920]];
  v8[2] = @"SecurityKeyIndex";
  v9[2] = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A910]];
  v8[3] = @"SecurityKeySetTime";
  v9[3] = [NSNumber numberWithDouble:micro()];
  v8[4] = @"SecurityLocallyGenerated";
  v9[4] = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A908]];
  id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 5), "mutableCopy");
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6A928]];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:@"SecurityIDSParticipantID"];
  }

  return v5;
}

+ (id)newEncryptionInfoWithMediaKeyIndex:(id)a3 participantID:(id)a4
{
  v12[4] = *MEMORY[0x1E4F143B8];
  memset(v12, 170, 32);
  HexToByte(&v12[2], 16, "00110011", 32);
  HexToByte(v12, 16, "11100010", 32);
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v12[2] length:16];
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:16];
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  int v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, *MEMORY[0x1E4F6A918], v7, *MEMORY[0x1E4F6A920], a3, *MEMORY[0x1E4F6A910], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6A908], 0);
  int v10 = v9;
  if (a4) {
    [v9 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F6A928]];
  }
  return v10;
}

+ (id)encryptionInfoForKey:(unint64_t)a3
{
  if (encryptionInfoForKey__once != -1) {
    dispatch_once(&encryptionInfoForKey__once, &__block_literal_global_21);
  }
  id v4 = (void *)encryptionInfoForKey__testKeys;

  return (id)[v4 objectAtIndexedSubscript:a3 == 1];
}

uint64_t __37__NetworkUtils_encryptionInfoForKey___block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  memset(v14, 170, 32);
  encryptionInfoForKey__testKeys = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  uint64_t v0 = *MEMORY[0x1E4F6A918];
  uint64_t v1 = *MEMORY[0x1E4F6A920];
  uint64_t v2 = *MEMORY[0x1E4F6A910];
  char v3 = 1;
  do
  {
    int v4 = v3 & 1;
    if (v3) {
      id v5 = "00110011";
    }
    else {
      id v5 = "00110010";
    }
    if (v3) {
      uint64_t v6 = "11100010";
    }
    else {
      uint64_t v6 = "11100011";
    }
    HexToByte(&v14[2], 16, v5, 32);
    HexToByte(v14, 16, v6, 32);
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14[2] length:16];
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 length:16];
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    v12[0] = v0;
    v12[1] = v1;
    v13[0] = v7;
    v13[1] = v8;
    void v12[2] = v2;
    v13[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    uint64_t result = [(id)encryptionInfoForKey__testKeys addObject:v10];
    char v3 = 0;
  }
  while (v4);
  return result;
}

+ (id)networkEmulationSettings:(id)a3 onUplink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = +[NetworkUtils networkEmulationSettings:](NetworkUtils, "networkEmulationSettings:");
  if (!v7)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[NetworkUtils networkEmulationSettings:onUplink:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v21 = 136316418;
    uint64_t v22 = v14;
    __int16 v23 = 2080;
    uint64_t v24 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
    __int16 v25 = 1024;
    int v26 = 353;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2048;
    id v30 = a1;
    __int16 v31 = 2112;
    id v32 = a3;
    uint64_t v16 = " [%s] %s:%d %@(%p) Empty network emulation settings path=%@";
    v17 = v15;
    uint32_t v18 = 58;
    goto LABEL_28;
  }
  if (v4) {
    uint64_t v8 = @"output";
  }
  else {
    uint64_t v8 = @"input";
  }
  id result = (id)[v7 objectForKeyedSubscript:v8];
  if (!result)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[NetworkUtils networkEmulationSettings:onUplink:](v12, v4, v13);
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      v11 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v21 = 136316418;
    uint64_t v22 = v19;
    __int16 v23 = 2080;
    uint64_t v24 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
    __int16 v25 = 1024;
    int v26 = 357;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2048;
    id v30 = a1;
    __int16 v31 = 1024;
    LODWORD(v32) = v4;
    uint64_t v16 = " [%s] %s:%d %@(%p) Empty network emulation settings for isUplink=%d";
    v17 = v20;
    uint32_t v18 = 54;
LABEL_28:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  return result;
}

+ (id)networkEmulationSettings:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[NetworkUtils networkEmulationSettings:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v10;
    __int16 v24 = 2080;
    __int16 v25 = "+[NetworkUtils networkEmulationSettings:]";
    __int16 v26 = 1024;
    int v27 = 364;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2048;
    id v31 = a1;
    uint64_t v12 = " [%s] %s:%d %@(%p) Network emulation profile path should not be nil";
    int v13 = v11;
    goto LABEL_29;
  }
  id result = (id)[a3 length];
  if (!result) {
    return result;
  }
  int v21 = 0;
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:0 error:&v21];
  if (!v6)
  {
    if ((id)objc_opt_class() != a1)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      __int16 v25 = "+[NetworkUtils networkEmulationSettings:]";
      __int16 v26 = 1024;
      int v27 = 370;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2048;
      id v31 = a1;
      __int16 v32 = 2112;
      id v33 = a3;
      __int16 v34 = 2112;
      v35 = v21;
      uint64_t v12 = " [%s] %s:%d %@(%p) Error loading network emulation data path=%@ error=%@";
LABEL_38:
      int v13 = v19;
      uint32_t v17 = 68;
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v14;
    __int16 v24 = 2080;
    __int16 v25 = "+[NetworkUtils networkEmulationSettings:]";
    __int16 v26 = 1024;
    int v27 = 370;
    __int16 v28 = 2112;
    id v29 = a3;
    __int16 v30 = 2112;
    id v31 = v21;
    uint64_t v12 = " [%s] %s:%d Error loading network emulation data path=%@ error=%@";
    goto LABEL_28;
  }
  id result = (id)[MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v21];
  if (!result)
  {
    if ((id)objc_opt_class() != a1)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v20;
      __int16 v24 = 2080;
      __int16 v25 = "+[NetworkUtils networkEmulationSettings:]";
      __int16 v26 = 1024;
      int v27 = 373;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2048;
      id v31 = a1;
      __int16 v32 = 2112;
      id v33 = a3;
      __int16 v34 = 2112;
      v35 = v21;
      uint64_t v12 = " [%s] %s:%d %@(%p) Error serializing network emulation settings path=%@ error=%@";
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v16;
    __int16 v24 = 2080;
    __int16 v25 = "+[NetworkUtils networkEmulationSettings:]";
    __int16 v26 = 1024;
    int v27 = 373;
    __int16 v28 = 2112;
    id v29 = a3;
    __int16 v30 = 2112;
    id v31 = v21;
    uint64_t v12 = " [%s] %s:%d Error serializing network emulation settings path=%@ error=%@";
LABEL_28:
    int v13 = v15;
LABEL_29:
    uint32_t v17 = 48;
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v12, buf, v17);
    return 0;
  }
  return result;
}

+ (void)networkEmulationSettings:onUplink:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  id v5 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
  __int16 v6 = 1024;
  int v7 = 353;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty network emulation settings path=%@", v3, 0x26u);
}

+ (void)networkEmulationSettings:(os_log_t)log onUplink:.cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
  __int16 v7 = 1024;
  int v8 = 357;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty network emulation settings for isUplink=%d", (uint8_t *)&v3, 0x22u);
}

+ (void)networkEmulationSettings:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 364;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Network emulation profile path should not be nil", v1, 0x1Cu);
}

@end