@interface VCStatsRecorder
- ($2A5123FA66906022607F2B5D76B2AC99)getMostRecentLocalStats;
- (VCStatsRecorder)init;
- (int)serverStatsSizeInByteForUplink:(BOOL)a3 connection:(id)a4;
- (void)dealloc;
- (void)getLocalStats:(unsigned __int16)a3 localSessionStats:(id *)a4;
- (void)updateSessionStats:(unsigned __int16)a3 connection:(id)a4 totalPacketSent:(unsigned int)a5 totalPacketReceived:(unsigned int)a6;
@end

@implementation VCStatsRecorder

- (VCStatsRecorder)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCStatsRecorder;
  v2 = [(VCStatsRecorder *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_stateRWLock, 0);
    bzero(v3->_localStats, 0xC00uLL);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  pthread_rwlock_destroy(&self->_stateRWLock);
  v3.receiver = self;
  v3.super_class = (Class)VCStatsRecorder;
  [(VCStatsRecorder *)&v3 dealloc];
}

- (void)updateSessionStats:(unsigned __int16)a3 connection:(id)a4 totalPacketSent:(unsigned int)a5 totalPacketReceived:(unsigned int)a6
{
  if (a4)
  {
    uint64_t v7 = *(void *)&a5;
    unsigned int v9 = a3;
    p_stateRWLock = &self->_stateRWLock;
    pthread_rwlock_wrlock(&self->_stateRWLock);
    double v12 = micro();
    unsigned int v13 = VCConnectionIDS_LinkID((uint64_t)a4);
    unsigned int v14 = self->_uplinkServerStatsByteUsed
        + [(VCStatsRecorder *)self serverStatsSizeInByteForUplink:1 connection:a4];
    self->_uplinkServerStatsByteUsed = v14;
    v15 = (double *)((char *)self + 24 * (v9 & 0x7F));
    v15[26] = v12;
    *((void *)v15 + 27) = ((unint64_t)v9 << 16) | (v7 << 32) | v13;
    *((_DWORD *)v15 + 56) = a6;
    *((_DWORD *)v15 + 57) = v14;
    self->_currentLocalStatsIndex = v9 & 0x7F;
    pthread_rwlock_unlock(p_stateRWLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStatsRecorder updateSessionStats:connection:totalPacketSent:totalPacketReceived:]();
    }
  }
}

- (void)getLocalStats:(unsigned __int16)a3 localSessionStats:(id *)a4
{
  if (a4)
  {
    unsigned int v5 = a3;
    p_stateRWLock = &self->_stateRWLock;
    pthread_rwlock_rdlock(&self->_stateRWLock);
    v8 = (char *)self + 24 * v5;
    a4->var1 = v8[216];
    a4->var0 = *((double *)v8 + 26);
    a4->var3 = *((_DWORD *)v8 + 55);
    a4->var5 = *((_DWORD *)v8 + 57);
    pthread_rwlock_unlock(p_stateRWLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStatsRecorder getLocalStats:localSessionStats:]();
    }
  }
}

- ($2A5123FA66906022607F2B5D76B2AC99)getMostRecentLocalStats
{
  retstr->var0 = 0.0;
  *(void *)&retstr->var1 = 0;
  *(void *)&retstr->var4 = 0;
  p_stateRWLock = &self->_stateRWLock;
  pthread_rwlock_rdlock(&self->_stateRWLock);
  uint64_t v6 = (char *)self + 24 * self->_currentLocalStatsIndex;
  retstr->var1 = v6[216];
  retstr->var0 = *((double *)v6 + 26);
  retstr->var3 = *((_DWORD *)v6 + 55);
  retstr->var5 = *((_DWORD *)v6 + 57);

  return ($2A5123FA66906022607F2B5D76B2AC99 *)pthread_rwlock_unlock(p_stateRWLock);
}

- (int)serverStatsSizeInByteForUplink:(BOOL)a3 connection:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    int v5 = VCConnectionIDS_NetworkOverheadInBytes((uint64_t)a4, 0, 0);
    if (v4) {
      int v6 = -18;
    }
    else {
      int v6 = -8;
    }
    return v6 + v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCStatsRecorder serverStatsSizeInByteForUplink:connection:]();
    }
    return 0;
  }
}

- (void)updateSessionStats:connection:totalPacketSent:totalPacketReceived:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Connection is NIL", v2, v3, v4, v5, v6);
}

- (void)getLocalStats:localSessionStats:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d localSessionStats is invalid", v2, v3, v4, v5, v6);
}

- (void)serverStatsSizeInByteForUplink:connection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Connection is NIL", v2, v3, v4, v5, v6);
}

@end