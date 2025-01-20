@interface VCNWConnectionCongestionDetector
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (BOOL)processNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4;
- (unsigned)averagePacketDelayMs;
- (unsigned)averageThroughputBps;
- (unsigned)maxAveragePacketDelayMs;
- (unsigned)packetDropCount;
- (void)dealloc;
- (void)enableNWLogDump:(void *)a3;
- (void)sendCongestionEventWithTimestamp:(unsigned int)a3;
- (void)setMaxAveragePacketDelayMs:(unsigned int)a3;
- (void)setStatisticsCollector:(id)a3;
@end

@implementation VCNWConnectionCongestionDetector

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCNWConnectionCongestionDetector;
  [(VCNWConnectionCongestionDetector *)&v3 dealloc];
}

- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNWConnectionCongestionDetector processNWConnectionNotification:](v11);
      }
    }
    return 0;
  }
  if (a3->version >= 3u)
  {
    logNWDump = self->_logNWDump;
    if (logNWDump) {
      VRLogfilePrint((uint64_t)logNWDump, "NWConnection notification has a bad version: %d\n", (uint64_t)a3, v3, v4, v5, v6, v7, a3->version);
    }
    return 0;
  }
  uint64_t timestamp = a3->var1.advisory.timestamp;
  unint64_t v13 = self->_previousStatistics.var0.nwConnection.timestamp;
  if (timestamp == v13 || (timestamp - v13) >> 32 != 0)
  {
    v15 = self->_logNWDump;
    if (v15) {
      VRLogfilePrint((uint64_t)v15, "NWConnection notifications have identical timestamps or out of order [current timestamp:%llu, previous timestamp:%llu]\n", (uint64_t)a3, v3, v4, v5, v6, v7, a3->var1.advisory.timestamp);
    }
    return 0;
  }
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)&v32[16] = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  *(_OWORD *)v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v28, 0, sizeof(v28));
  *(void *)&long long v26 = 11;
  long long v27 = 0u;
  *((void *)&v26 + 1) = micro();
  BOOL v16 = 1;
  BYTE2(v27) = 1;
  WORD4(v27) = *(_WORD *)&a3->var1.advisory.version;
  *(void *)&v28[0] = timestamp;
  *(_OWORD *)((char *)v28 + 8) = *((_OWORD *)&a3->var1.thermalUpdate + 1);
  *((void *)&v28[1] + 1) = *((void *)&a3->var1.thermalUpdate + 5);
  LODWORD(v29) = a3->var1.advisory.average_delay;
  unsigned int maxAveragePacketDelayMs = v29;
  *((void *)&v29 + 1) = a3->var1.advisory.average_throughput;
  LODWORD(v30) = a3->var1.advisory.rate_trend_suggestion;
  long long v19 = *(_OWORD *)((char *)&a3->var1.thermalUpdate + 65);
  *(void *)&v32[24] = *(void *)((char *)&a3->var1.thermalUpdate + 81);
  *(_OWORD *)&v32[8] = v19;
  self->_averageThroughputBps = DWORD2(v29);
  self->_averagePacketDelayMs = maxAveragePacketDelayMs;
  if (self->_maxAveragePacketDelayMs > maxAveragePacketDelayMs) {
    unsigned int maxAveragePacketDelayMs = self->_maxAveragePacketDelayMs;
  }
  self->_unsigned int maxAveragePacketDelayMs = maxAveragePacketDelayMs;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v26);
  long long v20 = v35;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 136) = v34;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 152) = v20;
  *((void *)&self->_previousStatistics.var0.localRCEvent + 21) = v36;
  long long v21 = *(_OWORD *)v32;
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 3) = v31;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 88) = v21;
  long long v22 = v33;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 104) = *(_OWORD *)&v32[16];
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 5) = v22;
  long long v23 = v28[1];
  *(_OWORD *)&self->_previousStatistics.var0.rtcpRR.lastSequenceNumber = v28[0];
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 1) = v23;
  long long v24 = v30;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 40) = v29;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 56) = v24;
  long long v25 = v27;
  *(_OWORD *)&self->_previousStatistics.type = v26;
  *(_OWORD *)&self->_previousStatistics.isVCRCInternal = v25;
  return v16;
}

- (BOOL)processNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      LODWORD(logNWDump) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!logNWDump) {
        return (char)logNWDump;
      }
      -[VCNWConnectionCongestionDetector processNWConnectionPacketEvent:eventType:](v13);
    }
LABEL_12:
    LOBYTE(logNWDump) = 0;
    return (char)logNWDump;
  }
  char v8 = a4;
  if (a3->var0 != 1)
  {
    logNWDump = self->_logNWDump;
    if (!logNWDump) {
      return (char)logNWDump;
    }
    VRLogfilePrint((uint64_t)logNWDump, "NWConnection packet event has a bad version: %d, type: %d\n", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, a3->var0);
    goto LABEL_12;
  }
  uint64_t lastTimestampWithPacketDrop = self->_lastTimestampWithPacketDrop;
  ++self->_packetDropCount;
  if (lastTimestampWithPacketDrop == a3->var3)
  {
    unsigned int v12 = self->_packetDropCountPerFrame + 1;
    self->_packetDropCountPerFrame = v12;
    if (!self->_didSendCongestionEvent && v12 >= 0xB)
    {
      self->_didSendCongestionEvent = 1;
      -[VCNWConnectionCongestionDetector sendCongestionEventWithTimestamp:](self, "sendCongestionEventWithTimestamp:");
    }
  }
  else
  {
    self->_packetDropCountPerFrame = 1;
    self->_uint64_t lastTimestampWithPacketDrop = a3->var3;
    self->_didSendCongestionEvent = 0;
  }
  v15 = self->_logNWDump;
  if (v15) {
    VRLogfilePrint((uint64_t)v15, "NWConnection packet NACK event [type:%d, timestamp:%u, identifier:%u, seq:%u, dropCountPerFrame:%d, dropCount:%d, congestionEvent:%d]\n", lastTimestampWithPacketDrop, *(uint64_t *)&a4, v4, v5, v6, v7, v8);
  }
  LOBYTE(logNWDump) = 1;
  return (char)logNWDump;
}

- (void)sendCongestionEventWithTimestamp:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v6[0] = 11;
  long long v7 = 0u;
  v6[1] = micro();
  BYTE2(v7) = 1;
  *(void *)&long long v8 = a3;
  unsigned int packetDropCountPerFrame = self->_packetDropCountPerFrame;
  LODWORD(v11) = 0x80000000;
  DWORD1(v11) = packetDropCountPerFrame;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v6);
}

- (void)enableNWLogDump:(void *)a3
{
  self->_logNWDump = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (unsigned)averagePacketDelayMs
{
  return self->_averagePacketDelayMs;
}

- (unsigned)maxAveragePacketDelayMs
{
  return self->_maxAveragePacketDelayMs;
}

- (void)setMaxAveragePacketDelayMs:(unsigned int)a3
{
  self->_unsigned int maxAveragePacketDelayMs = a3;
}

- (unsigned)averageThroughputBps
{
  return self->_averageThroughputBps;
}

- (unsigned)packetDropCount
{
  return self->_packetDropCount;
}

- (void)processNWConnectionNotification:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 50;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection notification is nil", (uint8_t *)&v2, 0x1Cu);
}

- (void)processNWConnectionPacketEvent:(uint64_t)a1 eventType:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 97;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection packet event is nil", (uint8_t *)&v2, 0x1Cu);
}

@end