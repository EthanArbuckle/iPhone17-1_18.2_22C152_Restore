@interface VCSessionStatsController
- (BOOL)didReceiveServerStatsResponse;
- (VCSessionStatsController)initWithDelegate:(id)a3 connectionManager:(id)a4 uplinkStatsCollector:(id)a5 downlinkStatsCollector:(id)a6 reportingAgent:(opaqueRTCReporting *)a7 transportSessionID:(unsigned int)a8 streamID:(unsigned __int16)a9 mediaQueue:(tagVCMediaQueue *)a10;
- (double)statsReportingInterval;
- (id)reportingAgent;
- (unsigned)translateTimestampFromMicro:(double)a3;
- (void)dealloc;
- (void)deregisterPeriodicTask;
- (void)flushRealTimeReportingStats;
- (void)periodicTask:(void *)a3;
- (void)registerPeriodicTask;
- (void)reset;
- (void)sendLocalStats;
- (void)setStatsReportingInterval:(double)a3;
- (void)startLocalSessionStatsReceive;
- (void)startLocalSessionStatsSend;
- (void)startLocalSessionStatsUpdate;
- (void)stopLocalSessionStatsUpdate;
@end

@implementation VCSessionStatsController

- (VCSessionStatsController)initWithDelegate:(id)a3 connectionManager:(id)a4 uplinkStatsCollector:(id)a5 downlinkStatsCollector:(id)a6 reportingAgent:(opaqueRTCReporting *)a7 transportSessionID:(unsigned int)a8 streamID:(unsigned __int16)a9 mediaQueue:(tagVCMediaQueue *)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCSessionStatsController;
  v16 = [(VCSessionStatsController *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_weakDelegate, a3);
    objc_storeWeak(&v17->_reportingAgentWeak, a7);
    *(void *)&v17->_remoteStats.linkID = 0;
    *(void *)&v17->_remoteStats.uplinkBandwidthSample = 0;
    v17->_remoteStats.responseTime = 0.0;
    v17->_statsRequestCounter = 0;
    v17->_streamID = a9;
    v17->_uplinkStatisticsCollector = (AVCStatisticsCollector *)a5;
    v17->_downlinkStatisticsCollector = (AVCStatisticsCollector *)a6;
    v17->_connectionManager = (VCConnectionManager *)a4;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC5C40, @"transportStreamStreamTypeKey", 0);
    v17->_transportStream = [[VCTransportStreamGFT alloc] initWithTransportSessionID:v10 options:v18];

    [(VCTransportStreamGFT *)v17->_transportStream setMediaQueue:a10];
    v17->_statsArrayIndex = -1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        transportStream = v17->_transportStream;
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v19;
        __int16 v27 = 2080;
        v28 = "-[VCSessionStatsController initWithDelegate:connectionManager:uplinkStatsCollector:downlinkStatsCollector:"
              "reportingAgent:transportSessionID:streamID:mediaQueue:]";
        __int16 v29 = 1024;
        int v30 = 70;
        __int16 v31 = 2048;
        v32 = v17;
        __int16 v33 = 2048;
        v34 = transportStream;
        __int16 v35 = 1024;
        int v36 = v10;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stats controller [%p] init with transportStream [%p] and transportSessionId: %u", buf, 0x36u);
      }
    }
    [(VCSessionStatsController *)v17 flushRealTimeReportingStats];
    [(VCSessionStatsController *)v17 registerPeriodicTask];
    v17->_statsReportingInterval = 2.0;
    v17->_enableStatsReporting = [+[VCDefaults sharedInstance] enableGFTStatsReporting];
    v17->_enableStatsReceiveThread = [+[VCDefaults sharedInstance] enableGFTStatsReceiveThread];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
    v17->_statsRequestQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcsessionStatsController.requestQueue", 0, CustomRootQueue);
  }
  return v17;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numStatsDroppedDueToStatsID = self->_numStatsDroppedDueToStatsID;
      unsigned int numStatsDroppedDueToLinkID = self->_numStatsDroppedDueToLinkID;
      unsigned int numStatsDroppedDueToTooLate = self->_numStatsDroppedDueToTooLate;
      unsigned int numStatsProcessed = self->_numStatsProcessed;
      *(_DWORD *)buf = 136316930;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      v13 = "-[VCSessionStatsController dealloc]";
      __int16 v14 = 1024;
      int v15 = 83;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 1024;
      unsigned int v19 = numStatsProcessed;
      __int16 v20 = 1024;
      unsigned int v21 = numStatsDroppedDueToLinkID;
      __int16 v22 = 1024;
      unsigned int v23 = numStatsDroppedDueToStatsID;
      __int16 v24 = 1024;
      unsigned int v25 = numStatsDroppedDueToTooLate;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dealloc [%p] with statsCount:[%u, %u, %u, %u]", buf, 0x3Eu);
    }
  }
  [(VCSessionStatsController *)self flushRealTimeReportingStats];
  [(VCSessionStatsController *)self deregisterPeriodicTask];
  objc_storeWeak((id *)&self->_weakDelegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  dispatch_release((dispatch_object_t)self->_statsRequestQueue);
  v9.receiver = self;
  v9.super_class = (Class)VCSessionStatsController;
  [(VCSessionStatsController *)&v9 dealloc];
}

- (void)reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "-[VCSessionStatsController reset]";
      __int16 v9 = 1024;
      int v10 = 97;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session stats controller reset", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_lastTriggerRateControlTime = 0.0;
  *(void *)&self->_previousTotalPacketSent = 0;
  *(void *)&self->_uplinkMostRecentSendTimestamp = 0;
  self->_didReceiveServerStatsResponse = 0;
}

- (void)sendLocalStats
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  bzero(v3, 0x628uLL);
  __int16 statsRequestCounter = self->_statsRequestCounter;
  char v6 = 1;
  unsigned __int16 streamID = self->_streamID;
  char v5 = 1;
  v3[373] = 800;
  [(VCTransportStreamGFT *)self->_transportStream VCTransportStreamSendPacket:v3];
}

- (void)startLocalSessionStatsUpdate
{
  [(VCSessionStatsController *)self startLocalSessionStatsReceive];

  [(VCSessionStatsController *)self startLocalSessionStatsSend];
}

- (void)startLocalSessionStatsReceive
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRealTimeThread_Initialize for session stats controller thread FAILED", v2, v3, v4, v5, v6);
}

double __57__VCSessionStatsController_startLocalSessionStatsReceive__block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  if (a2)
  {
    _VCSessionStatsController_HandleRemoteSessionStats(a2, a3);
    return _VCSessionStatsController_HealthPrintForServerStats(a2);
  }
  return result;
}

- (void)startLocalSessionStatsSend
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  localSessionStatsTimemoutSource = self->_localSessionStatsTimemoutSource;
  if (localSessionStatsTimemoutSource)
  {
    dispatch_release(localSessionStatsTimemoutSource);
    self->_localSessionStatsTimemoutSource = 0;
  }
  uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_statsRequestQueue);
  self->_localSessionStatsTimemoutSource = v4;
  if (v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSessionStatsController startLocalSessionStatsSend]";
        __int16 v15 = 1024;
        int v16 = 148;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start local session stats update", buf, 0x1Cu);
      }
    }
    __int16 v7 = self->_localSessionStatsTimemoutSource;
    dispatch_time_t v8 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v7, v8, 0x56C8CC0uLL, 0x989680uLL);
    __int16 v9 = self->_localSessionStatsTimemoutSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__VCSessionStatsController_startLocalSessionStatsSend__block_invoke;
    handler[3] = &unk_1E6DB3DC8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_localSessionStatsTimemoutSource);
  }
}

void __54__VCSessionStatsController_startLocalSessionStatsSend__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v2 = micro();
  [*(id *)(a1 + 32) sendLocalStats];
  uint64_t v3 = VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
  uint64_t v4 = (const void *)v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 152)) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!v3) {
      goto LABEL_14;
    }
  }
  else if (v2 - *(double *)(v5 + 96) > 0.546)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = xmmword_1E25A1FE8;
    __int16 v7 = (void *)[*(id *)(v5 + 80) statsRecorder];
    if (v7)
    {
      [v7 getMostRecentLocalStats];
    }
    else
    {
      long long v13 = 0uLL;
      unint64_t v14 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = v13;
    unint64_t v12 = v14;
    _VCSessionStatsController_TriggerRateControl(v10, (uint64_t)&v11, 1, 0, v2, v8, v9);
    *(double *)(*(void *)(a1 + 32) + 96) = v2;
  }
  CFRelease(v4);
  uint64_t v5 = *(void *)(a1 + 32);
LABEL_14:
  ++*(_DWORD *)(v5 + 72);
}

- (void)stopLocalSessionStatsUpdate
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (self->_enableStatsReceiveThread)
  {
    VCRealTimeThread_Stop((uint64_t)self->_statsReceiveThread);
    [(VCTransportStreamGFT *)self->_transportStream VCTransportStreamUnblock];
    VCRealTimeThread_Finalize((uint64_t)self->_statsReceiveThread);
    self->_statsReceiveThread = 0;
  }
  else
  {
    [(VCTransportStreamGFT *)self->_transportStream unregisterPacketCallback];
  }
  if (self->_localSessionStatsTimemoutSource)
  {
    uint64_t v3 = dispatch_semaphore_create(0);
    localSessionStatsTimemoutSource = self->_localSessionStatsTimemoutSource;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__VCSessionStatsController_stopLocalSessionStatsUpdate__block_invoke;
    v6[3] = &unk_1E6DB3DC8;
    v6[4] = v3;
    dispatch_source_set_cancel_handler(localSessionStatsTimemoutSource, v6);
    dispatch_source_cancel((dispatch_source_t)self->_localSessionStatsTimemoutSource);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    uint64_t v5 = self->_localSessionStatsTimemoutSource;
    if (v5)
    {
      dispatch_release(v5);
      self->_localSessionStatsTimemoutSource = 0;
    }
  }
}

intptr_t __55__VCSessionStatsController_stopLocalSessionStatsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      double v8 = "-[VCSessionStatsController stopLocalSessionStatsUpdate]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 189;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop local session stats update completely", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unsigned)translateTimestampFromMicro:(double)a3
{
  unint64_t v3 = MicroToNTP(a3);
  return NTPToMiddle32(v3) >> 6;
}

- (id)reportingAgent
{
  return objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)registerPeriodicTask
{
  [(VCSessionStatsController *)self reportingAgent];

  reportingRegisterPeriodicTaskWeak();
}

uint64_t __48__VCSessionStatsController_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)periodicTask:(void *)a3
{
  double v5 = micro();
  double v6 = v5 - self->_lastUpdateTime;
  self->_lastUpdateTime = v5;
  unsigned int uplinkServerStatsByteUsed = self->_uplinkServerStatsByteUsed;
  int v8 = uplinkServerStatsByteUsed - self->_lastProcessedBytesSent;
  self->_lastProcessedBytesSent = uplinkServerStatsByteUsed;
  if (v6 == 0.0)
  {
    int v12 = 0;
    self->_double maxSentRate = 0;
  }
  else
  {
    int minSentRate = self->_minSentRate;
    double maxSentRate = (double)self->_maxSentRate;
    double v11 = (double)v8 / v6;
    if (v11 > maxSentRate) {
      double maxSentRate = (double)v8 / v6;
    }
    self->_double maxSentRate = (int)maxSentRate;
    if (v11 > (double)minSentRate) {
      double v11 = (double)minSentRate;
    }
    int v12 = (int)v11;
  }
  self->_bytesSentToReport += v8;
  unsigned int downlinkServerStatsByteUsed = self->_downlinkServerStatsByteUsed;
  int v14 = downlinkServerStatsByteUsed - self->_lastProcessedBytesReceived;
  self->_int minSentRate = v12;
  self->_lastProcessedBytesReceived = downlinkServerStatsByteUsed;
  if (v6 == 0.0)
  {
    int v19 = 0;
    self->_int maxReceivedRate = 0;
  }
  else
  {
    int maxReceivedRate = self->_maxReceivedRate;
    int minReceivedRate = self->_minReceivedRate;
    double v17 = (double)v14 / v6;
    if (v17 <= (double)maxReceivedRate) {
      double v18 = (double)maxReceivedRate;
    }
    else {
      double v18 = (double)v14 / v6;
    }
    self->_int maxReceivedRate = (int)v18;
    if (v17 > (double)minReceivedRate) {
      double v17 = (double)minReceivedRate;
    }
    int v19 = (int)v17;
  }
  self->_int minReceivedRate = v19;
  self->_bytesReceivedToReport += v14;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"SSMinBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxSentRate), @"SSMaxBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_bytesSentToReport), @"SSRawBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_minReceivedRate), @"SSMinBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxReceivedRate), @"SSMaxBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_bytesReceivedToReport), @"SSRawBytesReceived");
    [(VCSessionStatsController *)self flushRealTimeReportingStats];
  }
}

- (void)deregisterPeriodicTask
{
  [(VCSessionStatsController *)self reportingAgent];

  reportingUnregisterPeriodicTask();
}

- (void)flushRealTimeReportingStats
{
  self->_int minSentRate = 0x7FFFFFFF;
  self->_int minReceivedRate = 0x7FFFFFFF;
  *(void *)&self->_bytesSentToReport = 0;
  *(void *)&self->_bytesReceivedToReport = 0;
}

- (double)statsReportingInterval
{
  return self->_statsReportingInterval;
}

- (void)setStatsReportingInterval:(double)a3
{
  self->_statsReportingInterval = a3;
}

- (BOOL)didReceiveServerStatsResponse
{
  return self->_didReceiveServerStatsResponse;
}

@end