@interface VCConnectionHealthMonitor
- (BOOL)usingServerBasedLinks;
- (VCConnectionHealthMonitor)init;
- (VCConnectionHealthMonitorDelegate)delegate;
- (double)primaryConnHealthAllowedDelay;
- (unsigned)generateStatsBlob;
- (void)dealloc;
- (void)processPeerStatsBlob:(unsigned int)a3;
- (void)resetConnectionStats:(BOOL)a3;
- (void)resetHistory:(ConnectionStatsHistory *)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryConnHealthAllowedDelay:(double)a3;
- (void)setUsingServerBasedLinks:(BOOL)a3;
@end

@implementation VCConnectionHealthMonitor

- (VCConnectionHealthMonitor)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCConnectionHealthMonitor;
  v2 = [(VCConnectionHealthMonitor *)&v10 init];
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_stateRWLock, 0);
    pthread_rwlock_init(&v3->_peerStateRWLock, 0);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionHealthMonitor.delegateQueue", 0, CustomRootQueue);
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-primary-conn-health-allowed-delay", @"primaryConnHealthAllowedDelay", &unk_1F3DC8B50, 1), "doubleValue");
    v3->_double primaryConnHealthAllowedDelay = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double primaryConnHealthAllowedDelay = v3->_primaryConnHealthAllowedDelay;
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        v14 = "-[VCConnectionHealthMonitor init]";
        __int16 v15 = 1024;
        int v16 = 68;
        __int16 v17 = 2048;
        double v18 = primaryConnHealthAllowedDelay;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Primary connection health allowed delay = %.2f", buf, 0x26u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCConnectionHealthMonitor *)self setDelegate:0];
  pthread_rwlock_destroy(&self->_stateRWLock);
  pthread_rwlock_destroy(&self->_peerStateRWLock);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionHealthMonitor;
  [(VCConnectionHealthMonitor *)&v3 dealloc];
}

- (VCConnectionHealthMonitorDelegate)delegate
{
  return (VCConnectionHealthMonitorDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)generateStatsBlob
{
  p_stateRWLock = &self->_stateRWLock;
  pthread_rwlock_rdlock(&self->_stateRWLock);
  int latestConnectionStatsIndex = self->_statsHistory.latestConnectionStatsIndex;
  if (self->_lastReportedIndex == latestConnectionStatsIndex)
  {
    unsigned int v5 = 0;
    unsigned int v6 = 0;
    int v7 = 0;
    int v8 = 0;
  }
  else
  {
    v9 = (unsigned __int8 *)self
       + (self->_statsHistory.latestConnectionStatsIndex
                      - 5 * ((858993460 * (unint64_t)self->_statsHistory.latestConnectionStatsIndex) >> 32));
    LODWORD(v9) = bswap32((v9[15] << 8) | (latestConnectionStatsIndex << 24) | (v9[20] << 16) | v9[10]);
    self->_lastReportedIndex = latestConnectionStatsIndex;
    unsigned int v5 = v9 & 0xFF000000;
    unsigned int v6 = v9 & 0xFF0000;
    int v7 = (unsigned __int16)v9 & 0xFF00;
    int v8 = v9;
  }
  pthread_rwlock_unlock(p_stateRWLock);
  return v6 | v5 | v7 | v8;
}

- (void)processPeerStatsBlob:(unsigned int)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = bswap32(a3);
  unsigned int v5 = HIBYTE(v4);
  p_peerStateRWLock = &self->_peerStateRWLock;
  pthread_rwlock_wrlock(&self->_peerStateRWLock);
  if (HIBYTE(v4) != self->_peerStatsHistory.latestConnectionStatsIndex)
  {
    int latestConnectionStatsIndex = self->_peerStatsHistory.latestConnectionStatsIndex;
    uint64_t v8 = (HIBYTE(v4) - 5 * ((205 * HIBYTE(v4)) >> 10));
    if (v5 >= latestConnectionStatsIndex + 5 || (int)v5 <= latestConnectionStatsIndex - 5)
    {
      self->_peerStatsHistory.totalPacketsReceived[4] = 0;
      *(_DWORD *)self->_peerStatsHistory.totalPacketsReceived = 0;
      *(_DWORD *)&self->_peerStatsHistory.connectionStats[0][0] = 0;
      self->_peerStatsHistory.connectionStats[0][4] = 0;
      *(_DWORD *)&self->_peerStatsHistory.connectionStats[1][0] = 0;
      self->_peerStatsHistory.connectionStats[1][4] = 0;
    }
    else
    {
      char v10 = self->_peerStatsHistory.latestConnectionStatsIndex % 5u;
      if ((v10 + 1) == 5) {
        unsigned __int8 v11 = 0;
      }
      else {
        unsigned __int8 v11 = v10 + 1;
      }
      if (v8 != v11)
      {
        unsigned int v12 = v11;
        do
        {
          self->_peerStatsHistory.totalPacketsReceived[v12] = 0;
          self->_peerStatsHistory.connectionStats[0][v12] = 0;
          self->_peerStatsHistory.connectionStats[1][v12] = 0;
          unsigned int v12 = (v12 + 1) % 5;
        }
        while (v12 != v8);
      }
    }
    self->_peerStatsHistory.int latestConnectionStatsIndex = HIBYTE(v4);
    self->_peerStatsHistory.totalPacketsReceived[(HIBYTE(v4)
                                                                 - 5 * ((205 * HIBYTE(v4)) >> 10))] = v4;
    self->_peerStatsHistory.connectionStats[0][(HIBYTE(v4)
                                                               - 5 * ((205 * HIBYTE(v4)) >> 10))] = BYTE1(v4);
    self->_peerStatsHistory.connectionStats[1][(HIBYTE(v4)
                                                               - 5 * ((205 * HIBYTE(v4)) >> 10))] = BYTE2(v4);
    _VCConnectionHealthMonitor_UpdateRatiosForHistory((uint64_t)&self->_peerStatsHistory, (HIBYTE(v4) - 5 * ((205 * HIBYTE(v4)) >> 10)));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = self->_peerStatsHistory.latestConnectionStatsIndex;
        int v16 = self->_peerStatsHistory.connectionStats[0][v8];
        int v17 = self->_peerStatsHistory.connectionStats[1][v8];
        int v18 = self->_peerStatsHistory.totalPacketsReceived[v8];
        int v19 = self->_peerStatsHistory.connectionStatsRatio[0][v8];
        int v20 = self->_peerStatsHistory.connectionStatsRatio[1][v8];
        int v21 = 136317442;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        v24 = "-[VCConnectionHealthMonitor processPeerStatsBlob:]";
        __int16 v25 = 1024;
        int v26 = 200;
        __int16 v27 = 1024;
        int v28 = v8;
        __int16 v29 = 1024;
        int v30 = v15;
        __int16 v31 = 1024;
        int v32 = v16;
        __int16 v33 = 1024;
        int v34 = v17;
        __int16 v35 = 1024;
        int v36 = v18;
        __int16 v37 = 1024;
        int v38 = v19;
        __int16 v39 = 1024;
        int v40 = v20;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: receive - last packet with feedback index %d, %u, bucket [%u %u %u] ratios [%u %u]", (uint8_t *)&v21, 0x46u);
      }
    }
    VCConnectionHealthMonitor_ReportConnectionHealthWithStatsHistory((uint64_t)self, (uint64_t)&self->_peerStatsHistory, v8, 1);
  }
  pthread_rwlock_unlock(p_peerStateRWLock);
}

- (void)resetConnectionStats:(BOOL)a3
{
  uint64_t v4 = 40;
  if (a3)
  {
    uint64_t v4 = 304;
    uint64_t v5 = 9;
  }
  else
  {
    uint64_t v5 = 240;
  }
  unsigned int v6 = (pthread_rwlock_t *)((char *)self + v4);
  pthread_rwlock_wrlock((pthread_rwlock_t *)((char *)self + v4));
  [(VCConnectionHealthMonitor *)self resetHistory:(char *)self + v5];

  pthread_rwlock_unlock(v6);
}

- (void)resetHistory:(ConnectionStatsHistory *)a3
{
  a3->totalPacketsReceived[4] = 0;
  *(_DWORD *)a3->totalPacketsReceived = 0;
  *(void *)&a3->connectionStats[0][0] = 0;
  *(_WORD *)&a3->connectionStats[1][3] = 0;
  *(void *)&a3->connectionStatsRatio[0][0] = 0;
  *(_WORD *)&a3->connectionStatsRatio[1][3] = 0;
}

uint64_t __VCConnectionHealthMonitor_ReportConnectionHealthWithStatsHistory_block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 272) connectionHealthDidUpdate:*(unsigned int *)(a1 + 40) isLocalConnection:*(unsigned char *)(a1 + 44) == 0];
}

- (double)primaryConnHealthAllowedDelay
{
  return self->_primaryConnHealthAllowedDelay;
}

- (void)setPrimaryConnHealthAllowedDelay:(double)a3
{
  self->_double primaryConnHealthAllowedDelay = a3;
}

- (BOOL)usingServerBasedLinks
{
  return self->_usingServerBasedLinks;
}

- (void)setUsingServerBasedLinks:(BOOL)a3
{
  self->_usingServerBasedLinks = a3;
}

uint64_t ___VCConnectionHealthMonitor_checkAndReportSymptomOnRecoveryAfterLongMediaStall_block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 272) reportSymptomOnLongMediaStallRecovered];
}

@end