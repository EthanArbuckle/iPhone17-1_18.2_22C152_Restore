@interface AVCQoSMonitor
- (AVCQoSMonitor)initWithStreamToken:(int64_t)a3 queue:(id)a4 error:(id *)a5;
- (AVCQoSMonitorDelegate)delegate;
- (BOOL)generateInvalidStreamTokenWithError:(id *)a3;
- (NSArray)streamTokens;
- (id)registerStreamToken:(int64_t)a3;
- (int64_t)reportingIntervalForStreamToken:(int64_t)a3;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)registerBlocksForNotifications;
- (void)requestQoSReport;
- (void)setDelegate:(id)a3;
- (void)terminateConnection;
@end

@implementation AVCQoSMonitor

- (AVCQoSMonitor)initWithStreamToken:(int64_t)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = v9;
      __int16 v34 = 2080;
      v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
      __int16 v36 = 1024;
      int v37 = 48;
      __int16 v38 = 2048;
      int64_t v39 = a3;
      __int16 v40 = 2112;
      v41 = a4;
      __int16 v42 = 2112;
      id v43 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld, queue=%@, error=%@", buf, 0x3Au);
    }
  }
  if ((AVCQoSMonitor *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = v13;
        __int16 v34 = 2080;
        v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
        __int16 v36 = 1024;
        int v37 = 49;
        __int16 v38 = 1024;
        LODWORD(v39) = a3;
        v15 = " [%s] %s:%d streamToken[%u]";
        v16 = v14;
        uint32_t v17 = 34;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v12 = (__CFString *)[(AVCQoSMonitor *)self performSelector:sel_logPrefix];
    }
    else {
      v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v33 = v18;
        __int16 v34 = 2080;
        v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
        __int16 v36 = 1024;
        int v37 = 49;
        __int16 v38 = 2112;
        int64_t v39 = (int64_t)v12;
        __int16 v40 = 2048;
        v41 = self;
        __int16 v42 = 1024;
        LODWORD(v43) = a3;
        v15 = " [%s] %s:%d %@(%p) streamToken[%u]";
        v16 = v19;
        uint32_t v17 = 54;
        goto LABEL_14;
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)AVCQoSMonitor;
  v20 = [(AVCQoSMonitor *)&v29 init];
  if (v20)
  {
    v20->_connection = objc_alloc_init(AVConferenceXPCClient);
    v30 = @"conferenceCallID";
    uint64_t v31 = [NSNumber numberWithInteger:a3];
    uint64_t v21 = -[AVConferenceXPCClient sendMessageSync:arguments:](v20->_connection, "sendMessageSync:arguments:", "vcQosMonitorInitializForStreamToken", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1]);
    if (v21)
    {
      v22 = (void *)v21;
      id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v20->_registeredStreamTokens = (NSMutableArray *)objc_msgSend(v23, "initWithObjects:", objc_msgSend(NSNumber, "numberWithInteger:", a3), 0);
      id v24 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v25 = [v22 objectForKeyedSubscript:@"vcQoSReportingInterval"];
      v20->_reportingIntervals = (NSMutableDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, objc_msgSend(NSNumber, "numberWithInteger:", a3), 0);
      [(AVCQoSMonitor *)v20 registerBlocksForNotifications];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v33 = v26;
          __int16 v34 = 2080;
          v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
          __int16 v36 = 1024;
          int v37 = 62;
          __int16 v38 = 1024;
          LODWORD(v39) = a3;
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sucess streamToken=%u", buf, 0x22u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCQoSMonitor initWithStreamToken:queue:error:]();
        }
      }
      [(AVCQoSMonitor *)v20 generateInvalidStreamTokenWithError:a5];

      return 0;
    }
  }
  return v20;
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
      v10 = "-[AVCQoSMonitor dealloc]";
      __int16 v11 = 1024;
      int v12 = 79;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak((id *)&self->_delegate, 0);

  [(AVCQoSMonitor *)self terminateConnection];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCQoSMonitor;
  [(AVCQoSMonitor *)&v6 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    objc_super v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      v10 = "-[AVCQoSMonitor setDelegate:]";
      __int16 v11 = 1024;
      int v12 = 90;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCQoSMonitorDelegate)delegate
{
  return (AVCQoSMonitorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)requestQoSReport
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NOT YET IMPLEMENTED", v2, v3, v4, v5, v6);
}

- (id)registerStreamToken:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v22 = 2080;
      id v23 = "-[AVCQoSMonitor registerStreamToken:]";
      __int16 v24 = 1024;
      int v25 = 103;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld", buf, 0x26u);
    }
  }
  if ((AVCQoSMonitor *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v22 = 2080;
        id v23 = "-[AVCQoSMonitor registerStreamToken:]";
        __int16 v24 = 1024;
        int v25 = 104;
        __int16 v26 = 1024;
        LODWORD(v27) = a3;
        v10 = " [%s] %s:%d streamToken[%u]";
        __int16 v11 = v9;
        uint32_t v12 = 34;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v7 = (__CFString *)[(AVCQoSMonitor *)self performSelector:sel_logPrefix];
    }
    else {
      int v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      id v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v22 = 2080;
        id v23 = "-[AVCQoSMonitor registerStreamToken:]";
        __int16 v24 = 1024;
        int v25 = 104;
        __int16 v26 = 2112;
        int64_t v27 = (int64_t)v7;
        __int16 v28 = 2048;
        objc_super v29 = self;
        __int16 v30 = 1024;
        int v31 = a3;
        v10 = " [%s] %s:%d %@(%p) streamToken[%u]";
        __int16 v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_14;
      }
    }
  }
  *(void *)buf = 0;
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"conferenceCallID");
  id v15 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcQosMonitorRegisterStreamToken", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1]);
  if (v15)
  {
    v16 = v15;
    -[NSMutableArray addObject:](self->_registeredStreamTokens, "addObject:", [NSNumber numberWithInteger:a3]);
    uint64_t v17 = [v16 objectForKeyedSubscript:@"vcQoSReportingInterval"];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportingIntervals, "setObject:forKeyedSubscript:", v17, [NSNumber numberWithInteger:a3]);
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCQoSMonitor registerStreamToken:]();
      }
    }
    [(AVCQoSMonitor *)self generateInvalidStreamTokenWithError:buf];
    return *(id *)buf;
  }
}

- (int64_t)reportingIntervalForStreamToken:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "-[AVCQoSMonitor reportingIntervalForStreamToken:]";
      __int16 v12 = 1024;
      int v13 = 124;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld", (uint8_t *)&v8, 0x26u);
    }
  }
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_reportingIntervals, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "integerValue");
}

- (void)terminateConnection
{
  self->_connection = 0;
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"conferenceDidServerDie"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcQoSMonitorCallbackDidReceiveReport"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcQoSMonitorCallbackDidReceiveReportEventDrivenKey"];
}

- (void)registerBlocksForNotifications
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"conferenceDidServerDie" block:v6 queue:self->_stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_54;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcQoSMonitorCallbackDidReceiveReport" block:v5 queue:self->_stateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_61;
  v4[3] = &unk_1E6DB81C0;
  v4[4] = v3;
  v4[5] = self;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcQoSMonitorCallbackDidReceiveReportEventDrivenKey" block:v4 queue:self->_stateQueue];
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_2();
        }
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "qosMonitorServerDidDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_1();
      }
    }
  }
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_54(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_54_cold_1();
        }
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) strong];
      if (v6)
      {
        int v7 = (void *)v6;
        uint64_t v8 = [a2 objectForKeyedSubscript:@"vcQoSReportDictionary"];
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcQoSReportToken"), "unsignedIntegerValue");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          __int16 v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315906;
            uint64_t v15 = v10;
            __int16 v16 = 2080;
            uint64_t v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 179;
            __int16 v20 = 1024;
            int v21 = v9;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveReport for streamToken=%u", (uint8_t *)&v14, 0x22u);
          }
        }
        objc_msgSend((id)objc_msgSend(v7, "delegate"), "qosMonitor:didReceiveReport:streamToken:", v7, v8, v9);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v12;
          __int16 v16 = 2080;
          uint64_t v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 173;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor: strongSelf is nil", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_61(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_61_cold_1();
        }
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) strong];
      if (v6)
      {
        int v7 = (void *)v6;
        uint64_t v8 = [a2 objectForKeyedSubscript:@"vcQoSReportDictionary"];
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcQoSReportToken"), "unsignedIntegerValue");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          __int16 v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315906;
            uint64_t v15 = v10;
            __int16 v16 = 2080;
            uint64_t v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 199;
            __int16 v20 = 1024;
            int v21 = v9;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveEventDrivenReport for streamToken=%u", (uint8_t *)&v14, 0x22u);
          }
        }
        [*(id *)(a1 + 40) delegate];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend((id)objc_msgSend(v7, "delegate"), "qosMonitor:didReceiveEventDrivenReport:streamToken:", v7, v8, v9);
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v12;
          __int16 v16 = 2080;
          uint64_t v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 193;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor: strongSelf is nil", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
}

- (BOOL)generateInvalidStreamTokenWithError:(id *)a3
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCQoSMonitor.m", 214);

  return +[GKVoiceChatError getNSError:a3 code:32016 detailedCode:0 filePath:v4 description:@"Could not register QoS Monitor" reason:@"Invalid Stream Token"];
}

- (NSArray)streamTokens
{
  return &self->_registeredStreamTokens->super;
}

- (void)initWithStreamToken:queue:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR medais stream for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCQoSMonitor initWithStreamToken:queue:error:]" >> 16, 64);
}

- (void)registerStreamToken:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCQoSMonitor registerStreamToken:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR medais stream for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCQoSMonitor registerStreamToken:]" >> 16, 110);
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCQoSMonitor: server died", v2, v3, v4, v5, v6);
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCQoSMonitor: serverd died, notifying client", v2, v3, v4, v5, v6);
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveReport error=%@");
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveEventDrivenReport error=%@");
}

@end