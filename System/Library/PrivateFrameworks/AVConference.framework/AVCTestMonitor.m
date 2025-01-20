@interface AVCTestMonitor
- (AVCTestMonitor)initWithDelegate:(id)a3 queue:(id)a4;
- (id)delegate;
- (id)delegateNotificationQueue;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)forceNetworkCellular:(BOOL)a3;
- (void)registerBlocksForNotifications;
- (void)requestSessionMediaDaemonStatsReport;
- (void)setEmulatedNetworkConfigurationPath:(id)a3;
- (void)setEmulatedRxPLR:(double)a3;
- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3;
- (void)setEnableLoopbackInterface:(BOOL)a3;
- (void)setForcedCapBitrate:(int)a3;
- (void)setForcedTargetBitrate:(int)a3;
- (void)setupNotificationQueue:(id)a3;
- (void)updateAudioInjectConfig:(id)a3;
@end

@implementation AVCTestMonitor

- (AVCTestMonitor)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      v15 = "-[AVCTestMonitor initWithDelegate:queue:]";
      __int16 v16 = 1024;
      int v17 = 47;
      __int16 v18 = 2112;
      id v19 = a3;
      __int16 v20 = 2112;
      id v21 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@, queue=%@", buf, 0x30u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVCTestMonitor;
  v9 = [(AVCTestMonitor *)&v11 init];
  if (v9)
  {
    v9->_connection = objc_alloc_init(AVConferenceXPCClient);
    objc_storeWeak(&v9->_delegate, a3);
    v9->_reportToken = VCUniqueIDGenerator_GenerateID();
    [(AVCTestMonitor *)v9 setupNotificationQueue:a4];
    [(AVCTestMonitor *)v9 registerBlocksForNotifications];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[AVCTestMonitor dealloc]";
      __int16 v11 = 1024;
      int v12 = 63;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  [(AVCTestMonitor *)self deregisterBlocksForNotifications];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue) {
    dispatch_release(delegateNotificationQueue);
  }

  objc_storeWeak(&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)AVCTestMonitor;
  [(AVCTestMonitor *)&v6 dealloc];
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (id)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (void)registerBlocksForNotifications
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcTestMonitorDidReportSessionStats" block:v4 queue:self->_delegateNotificationQueue eventLogLevel:7];
}

void __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    v4 = (_DWORD *)[*(id *)(a1 + 32) strong];
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"SessionStatsReportToken"), "unsignedIntValue") == v4[8])
    {
      if ((_DWORD *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v6;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCTestMonitor registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 90;
        uint64_t v8 = " [%s] %s:%d received callback for stats report";
        __int16 v9 = v7;
        uint32_t v10 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
        }
        else {
          v5 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCTestMonitor registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 90;
        __int16 v25 = 2112;
        v26 = v5;
        __int16 v27 = 2048;
        v28 = v4;
        uint64_t v8 = " [%s] %s:%d %@(%p) received callback for stats report";
        __int16 v9 = v12;
        uint32_t v10 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = objc_alloc_init(AVCTestMonitorReport);
        __int16 v14 = (void *)[a2 objectForKeyedSubscript:@"InitialMemoryUsageInfo"];
        v15 = (void *)[a2 objectForKeyedSubscript:@"MemoryUsageInfo"];
        __int16 v16 = (void *)[a2 objectForKeyedSubscript:@"NetworkAgentRefCount"];
        -[AVCTestMonitorReport setMemoryUsageMB:](v13, "setMemoryUsageMB:", [v15 integerValue]);
        -[AVCTestMonitorReport setInitialMemoryUsageMB:](v13, "setInitialMemoryUsageMB:", [v14 integerValue]);
        -[AVCTestMonitorReport setNetworkAgentRefCount:](v13, "setNetworkAgentRefCount:", [v16 integerValue]);
        int v17 = [v4 delegateNotificationQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke_80;
        v18[3] = &unk_1E6DB3E40;
        v18[4] = v4;
        v18[5] = v13;
        dispatch_async(v17, v18);
      }
    }
  }
}

uint64_t __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke_80(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didReceiveReport:v3];
}

- (void)deregisterBlocksForNotifications
{
}

- (void)setupNotificationQueue:(id)a3
{
  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCTestMonitor.notificationQueue", 0, CustomRootQueue);
  }
}

- (void)requestSessionMediaDaemonStatsReport
{
  v4[1] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  uint64_t v3 = @"SessionStatsReportToken";
  v4[0] = [NSNumber numberWithUnsignedInt:self->_reportToken];
  -[AVConferenceXPCClient sendMessageSync:arguments:](connection, "sendMessageSync:arguments:", "vcTestMonitorRequestSessionStatsReport", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1]);
}

- (void)updateAudioInjectConfig:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      uint64_t v11 = "-[AVCTestMonitor updateAudioInjectConfig:]";
      __int16 v12 = 1024;
      int v13 = 127;
      __int16 v14 = 2112;
      id v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d injectAudioConfig=%@", (uint8_t *)&v8, 0x26u);
    }
  }
  uint64_t v7 = objc_opt_new();
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "injectAudioConfigType") == 1), @"vcTestMonitorInjectAudioToneSwitch");
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcTestMonitorInjectAudio" arguments:v7];
}

- (void)forceNetworkCellular:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCTestMonitor forceNetworkCellular:]";
      __int16 v13 = 1024;
      int v14 = 136;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceCellular=%d", buf, 0x22u);
    }
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"vcTestMonitorForceNetworkCellSwitch");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorForceNetworkCell", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1]);
}

- (void)setEnableLoopbackInterface:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCTestMonitor setEnableLoopbackInterface:]";
      __int16 v13 = 1024;
      int v14 = 142;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableLoopbackInterface=%d", buf, 0x22u);
    }
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"vcTestMonitorSetEnableLoopbackValue");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEnableLoopback", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1]);
}

- (void)setEmulatedRxPLR:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCTestMonitor setEmulatedRxPLR:]";
      __int16 v13 = 1024;
      int v14 = 148;
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d emulatedRxPLR=%f", buf, 0x26u);
    }
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:", a3, @"vcTestMonitorSetEmulatedRxPLR");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEmulatedRxPLR", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1]);
}

- (void)setForcedTargetBitrate:(int)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"vcTestMonitorSetForcedTargetBitrate";
  v5[0] = [NSNumber numberWithInt:*(void *)&a3];
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetForcedTargetBitrate", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (void)setForcedCapBitrate:(int)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"vcTestMonitorSetForcedCapBitrate";
  v5[0] = [NSNumber numberWithInt:*(void *)&a3];
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetForcedCapBitrate", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (void)setEmulatedNetworkConfigurationPath:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = @"vcTestMonitorEmulatedNetworkConfigPath";
  v4[0] = a3;
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorEmulatedNetworkConfigPath", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1]);
}

- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCTestMonitor setEnableAudioPowerSpectrumReport:]";
      __int16 v13 = 1024;
      int v14 = 169;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableAudioPowerSpectrumReport=%d", buf, 0x22u);
    }
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"vcTestMonitorSetEnableAudioPowerSpectrumReport");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEnableAudioPowerSpectrumReport", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1]);
}

@end