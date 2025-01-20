@interface VCAudioStreamTransport
- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5;
- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5 enableNetworkMonitor:(BOOL)a6;
- (int)onStart;
- (void)dealloc;
- (void)onStop;
- (void)realtimeContext;
- (void)reportWRMMetrics:(id *)a3;
- (void)setWRMCallId:(unsigned int)a3;
- (void)setWRMMetricConfig:(id *)a3;
- (void)startWRM;
- (void)stopWRM;
@end

@implementation VCAudioStreamTransport

- (void)reportWRMMetrics:(id *)a3
{
}

- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5
{
  return [(VCAudioStreamTransport *)self initWithHandle:a3 callId:*(void *)&a4 localSSRC:*(void *)&a5 enableNetworkMonitor:1];
}

- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5 enableNetworkMonitor:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCAudioStreamTransport;
  v8 = [(VCMediaStreamTransport *)&v18 initWithHandle:a3 localSSRC:*(void *)&a5];
  v9 = v8;
  if (v8)
  {
    v8->super._payloadType = 0;
    if (v6)
    {
      v8->_wrmClient = [[WRMClient alloc] initWithDelegate:v8];
      v9->_realtimeContext.rtpHandle = v9->super._rtpHandle;
      WRMInitialize((uint64_t)&v9->_realtimeContext, (uint64_t)v9->super._rtpHandle);
      [(VCAudioStreamTransport *)v9 setWRMCallId:v7];
      int v10 = RTPSetWRMInfo((uint64_t)v9->super._rtpHandle, (uint64_t)&v9->_realtimeContext);
      if (v10 < 0)
      {
        int v11 = v10;
        if ((VCAudioStreamTransport *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:](v13, v11, v14);
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v12 = (__CFString *)[(VCAudioStreamTransport *)v9 performSelector:sel_logPrefix];
          }
          else {
            v12 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v20 = v15;
              __int16 v21 = 2080;
              v22 = "-[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:]";
              __int16 v23 = 1024;
              int v24 = 56;
              __int16 v25 = 2112;
              v26 = v12;
              __int16 v27 = 2048;
              v28 = v9;
              __int16 v29 = 1024;
              int v30 = v11;
              _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to set the WRM info. Error=%d", buf, 0x36u);
            }
          }
        }

        return 0;
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  WRMUninitialize((uint64_t)&self->_realtimeContext);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamTransport;
  [(VCMediaStreamTransport *)&v3 dealloc];
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (int)onStart
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioStreamTransport;
  int v3 = [(VCMediaStreamTransport *)&v5 onStart];
  if ((v3 & 0x80000000) == 0) {
    [(VCAudioStreamTransport *)self startWRM];
  }
  return v3;
}

- (void)onStop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCAudioStreamTransport *)self stopWRM];
  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamTransport;
  [(VCMediaStreamTransport *)&v3 onStop];
}

uint64_t __VCAudioStreamTransport_SubmitWRMReportWithJitterBufferMetrics_block_invoke(uint64_t a1)
{
  return WRMSubmitReport(*(void *)(a1 + 32), a1 + 40);
}

- (void)setWRMCallId:(unsigned int)a3
{
}

- (void)startWRM
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_wrmClient)
  {
    *(void *)&long long v3 = self;
    *((void *)&v3 + 1) = MEMORY[0x1E4F1C280];
    uint64_t v4 = MEMORY[0x1E4F1C278];
    RTPSetWRMMetricsCallback((uint64_t)self->super._rtpHandle, (uint64_t)WRMReportMetricsCallback_0, &v3);
    [(WRMClient *)self->_wrmClient startWRMClientWithMode:0 metricsConfig:65793];
  }
}

- (void)stopWRM
{
  if (self->_wrmClient)
  {
    RTPSetWRMMetricsCallback((uint64_t)self->super._rtpHandle, 0, 0);
    wrmClient = self->_wrmClient;
    [(WRMClient *)wrmClient stopWRMClient];
  }
}

- (void)setWRMMetricConfig:(id *)a3
{
}

- (void)initWithHandle:(os_log_t)log callId:localSSRC:enableNetworkMonitor:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:]";
  __int16 v7 = 1024;
  int v8 = 56;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set the WRM info. Error=%d", (uint8_t *)&v3, 0x22u);
}

@end