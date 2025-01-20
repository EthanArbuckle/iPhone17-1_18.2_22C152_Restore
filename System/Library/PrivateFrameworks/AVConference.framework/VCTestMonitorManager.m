@interface VCTestMonitorManager
+ (id)sharedManager;
- (BOOL)enableAudioPowerSpectrumReport;
- (BOOL)enableLoopbackInterface;
- (BOOL)enableOneToOneMode;
- (BOOL)forceNetworkCellular;
- (BOOL)toneInjectionEnabled;
- (NSString)emulatedNetworkConfigPath;
- (VCTestMonitorManager)init;
- (double)emulatedRxPLR;
- (int)forcedCapBitrate;
- (int)forcedTargetBitrate;
- (void)dealloc;
- (void)registerBlocksForService;
- (void)reportSessionMediaDaemonStats:(id)a3;
- (void)setEmulatedNetworkConfigPath:(id)a3;
- (void)setEmulatedRxPLR:(double)a3;
- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3;
- (void)setEnableLoopbackInterface:(BOOL)a3;
- (void)setEnableOneToOneMode:(BOOL)a3;
- (void)setForceNetworkCellular:(BOOL)a3;
- (void)setForcedCapBitrate:(int)a3;
- (void)setForcedTargetBitrate:(int)a3;
- (void)setToneInjectionEnabled:(BOOL)a3;
@end

@implementation VCTestMonitorManager

- (VCTestMonitorManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCTestMonitorManager;
  v2 = [(VCTestMonitorManager *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCTestMonitorManager.xpcCommandQueue", v3);
    v2->_xpcCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCTestMonitorManager.xpcNotificationQueue", v3);
    *(void *)&v2->_forcedTargetBitrate = -1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  dispatch_release((dispatch_object_t)self->_xpcCallbackQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCTestMonitorManager;
  [(VCTestMonitorManager *)&v3 dealloc];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_95);
  }
  return (id)sharedManager__vcTestMonitorManager;
}

void __37__VCTestMonitorManager_sharedManager__block_invoke()
{
  if (!sharedManager__vcTestMonitorManager) {
    sharedManager__vcTestMonitorManager = objc_alloc_init(VCTestMonitorManager);
  }
}

- (void)reportSessionMediaDaemonStats:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v5;
  long long v45 = v5;
  long long v42 = v5;
  long long v43 = v5;
  long long v40 = v5;
  long long v41 = v5;
  long long v38 = v5;
  long long v39 = v5;
  long long v36 = v5;
  long long v37 = v5;
  long long v34 = v5;
  long long v35 = v5;
  long long v32 = v5;
  long long v33 = v5;
  long long v30 = v5;
  long long v31 = v5;
  long long v28 = v5;
  long long v29 = v5;
  long long v26 = v5;
  long long v27 = v5;
  long long v24 = v5;
  long long v25 = v5;
  long long v22 = v5;
  long long v23 = v5;
  long long v20 = v5;
  long long v21 = v5;
  *(_OWORD *)&buffer[32] = v5;
  *(_OWORD *)buffer = v5;
  *(_OWORD *)&buffer[16] = v5;
  pid_t v6 = getpid();
  if (proc_pid_rusage(v6, 6, (rusage_info_t *)buffer)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (*((void *)&v21 + 1) >> 20);
  }
  if (self->_initialMemoryUsage)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 136315906;
        *(void *)&buffer[4] = v8;
        *(_WORD *)&buffer[12] = 2080;
        *(void *)&buffer[14] = "-[VCTestMonitorManager reportSessionMediaDaemonStats:]";
        *(_WORD *)&buffer[22] = 1024;
        *(_DWORD *)&buffer[24] = 94;
        *(_WORD *)&buffer[28] = 1024;
        *(_DWORD *)&buffer[30] = v7;
        v10 = " [%s] %s:%d Report memory usage %d";
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v10, buffer, 0x22u);
      }
    }
  }
  else
  {
    self->_initialMemoryUsage = (NSNumber *)[NSNumber numberWithInt:v7];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 136315906;
        *(void *)&buffer[4] = v11;
        *(_WORD *)&buffer[12] = 2080;
        *(void *)&buffer[14] = "-[VCTestMonitorManager reportSessionMediaDaemonStats:]";
        *(_WORD *)&buffer[22] = 1024;
        *(_DWORD *)&buffer[24] = 92;
        *(_WORD *)&buffer[28] = 1024;
        *(_DWORD *)&buffer[30] = v7;
        v10 = " [%s] %s:%d Report initial memory usage %d";
        goto LABEL_11;
      }
    }
  }
  uint64_t v12 = [+[VCNetworkAgent sharedInstance] getNetworkAgentRefCount];
  v17[0] = @"SessionStatsReportToken";
  v17[1] = @"InitialMemoryUsageInfo";
  initialMemoryUsage = self->_initialMemoryUsage;
  v18[0] = a3;
  v18[1] = initialMemoryUsage;
  v17[2] = @"MemoryUsageInfo";
  v18[2] = [NSNumber numberWithInt:v7];
  v17[3] = @"NetworkAgentRefCount";
  v18[3] = [NSNumber numberWithInt:v12];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCTestMonitorManager_reportSessionMediaDaemonStats___block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v14;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __54__VCTestMonitorManager_reportSessionMediaDaemonStats___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"vcTestMonitorDidReportSessionStats" arguments:v3];
}

- (void)registerBlocksForService
{
  v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke;
  v12[3] = &unk_1E6DB5478;
  v12[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorRequestSessionStatsReport", v12, self->_xpcCommandQueue);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_2;
  v11[3] = &unk_1E6DB5478;
  v11[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorInjectAudio", v11, self->_xpcCommandQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_37;
  v10[3] = &unk_1E6DB5478;
  v10[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorForceNetworkCell", v10, self->_xpcCommandQueue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_42;
  v9[3] = &unk_1E6DB5478;
  v9[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetEnableLoopback", v9, self->_xpcCommandQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_47;
  v8[3] = &unk_1E6DB5478;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetEmulatedRxPLR", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_52;
  v7[3] = &unk_1E6DB5478;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetForcedTargetBitrate", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_57;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetForcedCapBitrate", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_62;
  v5[3] = &unk_1E6DB5478;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorEmulatedNetworkConfigPath", v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __48__VCTestMonitorManager_registerBlocksForService__block_invoke_67, &unk_1E6DB5478, v3), "registerBlockForService:block:queue:", "vcTestMonitorSetEnableAudioPowerSpectrumReport", &v4, self->_xpcCommandQueue);
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "reportSessionMediaDaemonStats:", objc_msgSend(a2, "objectForKeyedSubscript:", @"SessionStatsReportToken"));
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  objc_msgSend(v5, "setToneInjectionEnabled:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcTestMonitorInjectAudioToneSwitch"), "BOOLValue"));
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return 0;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v14 = 136315906;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke_2";
    __int16 v18 = 1024;
    int v19 = 131;
    __int16 v20 = 1024;
    LODWORD(v21) = [v5 toneInjectionEnabled];
    v9 = " [%s] %s:%d toneInjectionEnabled = %d";
    v10 = v8;
    uint32_t v11 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    pid_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    pid_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316418;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 131;
      __int16 v20 = 2112;
      long long v21 = v6;
      __int16 v22 = 2048;
      long long v23 = v5;
      __int16 v24 = 1024;
      int v25 = [v5 toneInjectionEnabled];
      v9 = " [%s] %s:%d %@(%p) toneInjectionEnabled = %d";
      v10 = v13;
      uint32_t v11 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  objc_msgSend(v5, "setForceNetworkCellular:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcTestMonitorForceNetworkCellSwitch"), "BOOLValue"));
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v14 = 136315906;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 141;
    __int16 v20 = 1024;
    LODWORD(v21) = [v5 forceNetworkCellular];
    v9 = " [%s] %s:%d forceNetworkCellular = %d";
    v10 = v8;
    uint32_t v11 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    pid_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    pid_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316418;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 141;
      __int16 v20 = 2112;
      long long v21 = v6;
      __int16 v22 = 2048;
      long long v23 = v5;
      __int16 v24 = 1024;
      int v25 = [v5 forceNetworkCellular];
      v9 = " [%s] %s:%d %@(%p) forceNetworkCellular = %d";
      v10 = v13;
      uint32_t v11 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcTestMonitorSetEnableLoopbackValue"), "BOOLValue");
  [v5 setEnableLoopbackInterface:v6];
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v15 = 136315906;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 152;
    __int16 v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d setEnableLoopbackInterfaceBlock=%d";
    uint32_t v11 = v9;
    uint32_t v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316418;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 152;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      __int16 v23 = 2048;
      __int16 v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      v10 = " [%s] %s:%d %@(%p) setEnableLoopbackInterfaceBlock=%d";
      uint32_t v11 = v14;
      uint32_t v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcTestMonitorSetEmulatedRxPLR"), "doubleValue");
  double v7 = v6;
  objc_msgSend(v5, "setEmulatedRxPLR:");
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    float v11 = v7;
    int v18 = 136315906;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    __int16 v21 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 163;
    __int16 v24 = 2048;
    double v25 = v11;
    uint32_t v12 = " [%s] %s:%d setEmulatedRxPLRBlock=%2.3f";
    uint64_t v13 = v10;
    uint32_t v14 = 38;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    *(double *)&uint64_t v8 = COERCE_DOUBLE([v5 performSelector:sel_logPrefix]);
  }
  else {
    *(double *)&uint64_t v8 = COERCE_DOUBLE(&stru_1F3D3E450);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      float v17 = v7;
      int v18 = 136316418;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 163;
      __int16 v24 = 2112;
      double v25 = *(double *)&v8;
      __int16 v26 = 2048;
      uint64_t v27 = v5;
      __int16 v28 = 2048;
      double v29 = v17;
      uint32_t v12 = " [%s] %s:%d %@(%p) setEmulatedRxPLRBlock=%2.3f";
      uint64_t v13 = v16;
      uint32_t v14 = 58;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcTestMonitorSetForcedTargetBitrate"), "intValue");
  [v5 setForcedTargetBitrate:v6];
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v15 = 136315906;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    int v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 174;
    __int16 v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d forcedTargetBitrate=%d";
    float v11 = v9;
    uint32_t v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    double v7 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    double v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint32_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316418;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      int v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 174;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      __int16 v23 = 2048;
      __int16 v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      v10 = " [%s] %s:%d %@(%p) forcedTargetBitrate=%d";
      float v11 = v14;
      uint32_t v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcTestMonitorSetForcedCapBitrate"), "intValue");
  [v5 setForcedCapBitrate:v6];
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v15 = 136315906;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    int v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 185;
    __int16 v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d forcedCapBitrate=%d";
    float v11 = v9;
    uint32_t v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    double v7 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    double v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint32_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316418;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      int v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 185;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      __int16 v23 = 2048;
      __int16 v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      v10 = " [%s] %s:%d %@(%p) forcedCapBitrate=%d";
      float v11 = v14;
      uint32_t v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  objc_msgSend(v5, "setEmulatedNetworkConfigPath:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcTestMonitorEmulatedNetworkConfigPath"));
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v14 = 136315906;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    __int16 v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 195;
    __int16 v20 = 2080;
    uint64_t v21 = objc_msgSend((id)objc_msgSend(v5, "emulatedNetworkConfigPath"), "UTF8String");
    uint64_t v9 = " [%s] %s:%d emulatedNetworkConfigPath=%s";
    v10 = v8;
    uint32_t v11 = 38;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316418;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 195;
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v6;
      __int16 v22 = 2048;
      __int16 v23 = v5;
      __int16 v24 = 2080;
      uint64_t v25 = objc_msgSend((id)objc_msgSend(v5, "emulatedNetworkConfigPath"), "UTF8String");
      uint64_t v9 = " [%s] %s:%d %@(%p) emulatedNetworkConfigPath=%s";
      v10 = v13;
      uint32_t v11 = 58;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v5 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcTestMonitorSetEnableAudioPowerSpectrumReport"), "BOOLValue");
  [v5 setEnableAudioPowerSpectrumReport:v6];
  if (objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v15 = 136315906;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 206;
    __int16 v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d setEnableAudioPowerSpectrumReport=%d";
    uint32_t v11 = v9;
    uint32_t v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = (__CFString *)[v5 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316418;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 206;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      __int16 v23 = 2048;
      __int16 v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      v10 = " [%s] %s:%d %@(%p) setEnableAudioPowerSpectrumReport=%d";
      uint32_t v11 = v14;
      uint32_t v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

- (BOOL)toneInjectionEnabled
{
  return self->_toneInjectionEnabled;
}

- (void)setToneInjectionEnabled:(BOOL)a3
{
  self->_toneInjectionEnabled = a3;
}

- (BOOL)forceNetworkCellular
{
  return self->_forceNetworkCellular;
}

- (void)setForceNetworkCellular:(BOOL)a3
{
  self->_forceNetworkCellular = a3;
}

- (BOOL)enableLoopbackInterface
{
  return self->_enableLoopbackInterface;
}

- (void)setEnableLoopbackInterface:(BOOL)a3
{
  self->_enableLoopbackInterface = a3;
}

- (double)emulatedRxPLR
{
  return self->_emulatedRxPLR;
}

- (void)setEmulatedRxPLR:(double)a3
{
  self->_emulatedRxPLR = a3;
}

- (int)forcedTargetBitrate
{
  return self->_forcedTargetBitrate;
}

- (void)setForcedTargetBitrate:(int)a3
{
  self->_forcedTargetBitrate = a3;
}

- (int)forcedCapBitrate
{
  return self->_forcedCapBitrate;
}

- (void)setForcedCapBitrate:(int)a3
{
  self->_forcedCapBitrate = a3;
}

- (NSString)emulatedNetworkConfigPath
{
  return self->_emulatedNetworkConfigPath;
}

- (void)setEmulatedNetworkConfigPath:(id)a3
{
}

- (BOOL)enableAudioPowerSpectrumReport
{
  return self->_enableAudioPowerSpectrumReport;
}

- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3
{
  self->_enableAudioPowerSpectrumReport = a3;
}

- (BOOL)enableOneToOneMode
{
  return self->_enableOneToOneMode;
}

- (void)setEnableOneToOneMode:(BOOL)a3
{
  self->_enableOneToOneMode = a3;
}

@end