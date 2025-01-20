@interface AVCBasebandCongestionDetector
- (AVCBasebandCongestionDetector)init;
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)isRadioAccessTechnologyOnCellular:(unsigned int)a3;
- (BOOL)isTargetBitrateStabilized;
- (BOOL)processBasebandNotification:(id *)a3 arrivalTime:(double)a4 error:(id *)a5;
- (BOOL)processBasebandNotification:(id)a3 metaData:(id)a4 error:(id *)a5;
- (BOOL)processRateControlMessageArray:(id)a3 type:(unsigned int)a4;
- (VCRateControlMediaController)mediaController;
- (double)basebandExpectedQueuingDelay;
- (unsigned)basebandAverageBitrate;
- (unsigned)basebandDropPacketCount;
- (unsigned)basebandQueueDepth;
- (unsigned)basebandTxBitrate;
- (unsigned)mode;
- (unsigned)radioAccessTechnology;
- (unsigned)targetBitrate;
- (void)dealloc;
- (void)dumpNWConnectionBasebandLossMessage:(tagVCStatisticsMessage *)a3;
- (void)enableBasebandLogDump:(void *)a3;
- (void)printFlushAckToBasebandDump:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6;
- (void)processBasebandAck:(id *)a3;
- (void)processNWConnectionBasebandStatisticsMessage:(tagVCStatisticsMessage *)a3;
- (void)setIsTargetBitrateStabilized:(BOOL)a3;
- (void)setMediaController:(id)a3;
- (void)setMode:(unsigned int)a3;
- (void)setRadioAccessTechnology:(unsigned int)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)start;
- (void)stop;
@end

@implementation AVCBasebandCongestionDetector

- (AVCBasebandCongestionDetector)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCBasebandCongestionDetector;
  v2 = [(AVCBasebandCongestionDetector *)&v4 init];
  if (v2) {
    v2->_basebandMetrics = objc_alloc_init(VCBasebandMetrics);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[AVCBasebandCongestionDetector dealloc]";
      __int16 v10 = 1024;
      int v11 = 354;
      __int16 v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Releasing baseband congestion detector:%p", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandCongestionDetector;
  [(AVCBasebandCongestionDetector *)&v5 dealloc];
}

- (void)start
{
  v4[5] = *MEMORY[0x1E4F143B8];
  if (!self->_isStarted)
  {
    self->_isStarted = 1;
    statisticsCollector = self->_statisticsCollector;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__AVCBasebandCongestionDetector_start__block_invoke;
    v4[3] = &unk_1E6DB3FA8;
    v4[4] = self;
    self->_statisticsHandlerIndex = [(AVCStatisticsCollector *)statisticsCollector registerStatisticsChangeHandlerWithType:12 handler:v4];
  }
}

uint64_t __38__AVCBasebandCongestionDetector_start__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return [v2 processNWConnectionBasebandStatisticsMessage:v10];
}

- (void)stop
{
  if (self->_isStarted)
  {
    self->_isStarted = 0;
    [(AVCStatisticsCollector *)self->_statisticsCollector unregisterStatisticsChangeHandlerWithType:12 handlerIndex:self->_statisticsHandlerIndex];
  }
}

- (void)setMediaController:(id)a3
{
  long long v4 = (VCRateControlMediaController *)a3;
  self->_mediaController = v4;
  basebandMetrics = self->_basebandMetrics;

  [(VCBasebandMetrics *)basebandMetrics setMediaController:v4];
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(AVCBasebandCongestionDetector *)self isRadioAccessTechnologyOnCellular:self->_radioAccessTechnology];
  BOOL v6 = [(AVCBasebandCongestionDetector *)self isRadioAccessTechnologyOnCellular:v3];
  if (!v5 && v6) {
    [(VCBasebandMetrics *)self->_basebandMetrics resetBBNoteHistoryList];
  }
  self->_radioAccessTechnology = v3;
}

- (void)processNWConnectionBasebandStatisticsMessage:(tagVCStatisticsMessage *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3->type == 12)
  {
    if (a3->var0.nwConnection.interfaceType == 2)
    {
      if (a3->var0.nwConnection.packetLossPerFrame)
      {
        ++self->_basebandDropPacketCount;
        long long v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
        long long v31 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
        long long v32 = v5;
        uint64_t v33 = *((void *)&a3->var0.localRCEvent + 21);
        long long v6 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
        long long v27 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
        long long v28 = v6;
        long long v7 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
        long long v29 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
        long long v30 = v7;
        long long v8 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
        *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
        long long v24 = v8;
        long long v9 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
        long long v25 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
        long long v26 = v9;
        long long v10 = *(_OWORD *)&a3->isVCRCInternal;
        *(_OWORD *)buf = *(_OWORD *)&a3->type;
        *(_OWORD *)&buf[16] = v10;
        [(AVCBasebandCongestionDetector *)self dumpNWConnectionBasebandLossMessage:buf];
      }
      else
      {
        if (a3->var0.nwConnection.notificationType != 1 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int notificationType = a3->var0.nwConnection.notificationType;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 404;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = notificationType;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Get non-CRA type nwConnection baseband notification, type=%d!", buf, 0x22u);
          }
        }
        bzero(&v15, 0x17A0uLL);
        int v15 = 4;
        double arrivalTime = a3->arrivalTime;
        unint64_t timestamp = a3->var0.nwConnection.timestamp;
        int totalByteCount = a3->var0.nwConnection.totalByteCount;
        int v22 = timestamp;
        double averageQueueDepth = a3->var0.baseband.averageQueueDepth;
        __int16 frequencyBand = a3->var0.nwConnection.var0.wifi.frequencyBand;
        __int16 linkID = a3->var0.serverStats.linkID;
        unsigned __int8 v19 = a3->var0.nwConnection.notificationType;
        -[AVCBasebandCongestionDetector processBasebandNotification:arrivalTime:error:](self, "processBasebandNotification:arrivalTime:error:", &v15, 0);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]();
    }
  }
}

- (void)dumpNWConnectionBasebandLossMessage:(tagVCStatisticsMessage *)a3
{
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump) {
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "[Baseband drop packet count=%u, timestamp=0x%llX, seq=0x%X, type=%u]\n", (uint64_t)a3, v3, v4, v5, v6, v7, self->_basebandDropPacketCount);
  }
}

- (BOOL)processBasebandNotification:(id)a3 metaData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a3 bytes];
  LODWORD(v7) = [v7 length];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"MetaDataMessageArrivalTime"), "doubleValue");
  double v11 = v10;
  self->_notificationArrivalTime = v10;
  bzero(v13, 0x17A0uLL);
  VCBasebandNotificationParser_ParseNotification(v9, v7, (uint64_t)v13, v11);
  return [(AVCBasebandCongestionDetector *)self processBasebandNotification:v13 arrivalTime:a5 error:self->_notificationArrivalTime];
}

- (BOOL)processBasebandNotification:(id *)a3 arrivalTime:(double)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self->_notificationArrivalTime = a4;
  int var0 = a3->var0;
  if (a3->var0 != 1 && var0 != 4)
  {
    if (var0 == 2) {
      -[AVCBasebandCongestionDetector processBasebandAck:](self, "processBasebandAck:", a3, a5);
    }
    return 1;
  }
  long long v32 = unk_1E259FD80;
  long long v33 = xmmword_1E259FD90;
  memset(v34, 170, sizeof(v34));
  long long v29 = unk_1E259FD40;
  long long v30 = xmmword_1E259FD50;
  memset(v31, 170, sizeof(v31));
  v28[0] = xmmword_1E259FCF0;
  memset(&v28[1], 170, 64);
  basebandMetrics = self->_basebandMetrics;
  if (basebandMetrics)
  {
    -[VCBasebandMetrics getBasebandMetricsWithNotification:](basebandMetrics, "getBasebandMetricsWithNotification:", a3, a5);
  }
  else
  {
    long long v33 = 0u;
    memset(v34, 0, sizeof(v34));
    long long v32 = 0u;
    long long v30 = 0u;
    memset(v31, 0, sizeof(v31));
    long long v29 = 0u;
    memset(v28, 0, sizeof(v28));
  }
  if (self->_mode - 1 <= 3) {
    BYTE2(v28[1]) = 1;
  }
  if (a3->var0 == 4) {
    LOBYTE(v28[1]) = 1;
  }
  double v14 = *(double *)&v28[4];
  *(void *)&self->_basebandTxBitrate = *(void *)&v28[2];
  int v15 = v28[0];
  self->_basebandQueueDepth = HIDWORD(v28[1]) + DWORD2(v28[1]);
  self->_basebandExpectedQueuingDelay = v14;
  if (v15 != 1)
  {
    logBasebandDump = self->_logBasebandDump;
    if (!logBasebandDump) {
      return 1;
    }
    v17 = "[Bogus baseband notification, discard]\n";
    goto LABEL_21;
  }
  if (*((double *)v28 + 1) == 0.0)
  {
    logBasebandDump = self->_logBasebandDump;
    if (!logBasebandDump) {
      return 1;
    }
    v17 = "[Baseband notification too close to the previous one, discard]\n";
LABEL_21:
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, v17, (uint64_t)a3, (uint64_t)a5, v5, v6, v7, v8, v27);
    return 1;
  }
  if ([(VCRateControlMediaController *)self->_mediaController basebandFlushCount] > 0|| !DWORD1(v28[2]))
  {
    [(VCBasebandMetrics *)self->_basebandMetrics resetBDCDList];
    v18 = self->_logBasebandDump;
    if (v18)
    {
      char v19 = [(VCRateControlMediaController *)self->_mediaController basebandFlushCount];
      VRLogfilePrintWithTimestamp((uint64_t)v18, "Start re-collecting BDCD samples [flushCount %d, BBAvgTxRate %d].\n", v20, v21, v22, v23, v24, v25, v19);
    }
  }
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v28);
  return 1;
}

- (BOOL)processRateControlMessageArray:(id)a3 type:(unsigned int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 != 7) {
    return 0;
  }
  bzero(&v9, 0x17A0uLL);
  int v9 = 1;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 5), "doubleValue");
  double v7 = v6;
  double v10 = v6;
  int v15 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedLongLongValue");
  int v14 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedLongLongValue");
  __int16 v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
  int v12 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "unsignedIntValue");
  int v13 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 4), "unsignedIntValue");
  return [(AVCBasebandCongestionDetector *)self processBasebandNotification:&v9 arrivalTime:0 error:v7];
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
  -[VCBasebandMetrics setTargetBitrate:](self->_basebandMetrics, "setTargetBitrate:");
}

- (void)setIsTargetBitrateStabilized:(BOOL)a3
{
  self->_isTargetBitrateStabilized = a3;
  -[VCBasebandMetrics setIsTargetBitrateStabilized:](self->_basebandMetrics, "setIsTargetBitrateStabilized:");
}

- (void)enableBasebandLogDump:(void *)a3
{
  self->_logBasebandDump = a3;
  -[VCBasebandMetrics enableBasebandLogDump:](self->_basebandMetrics, "enableBasebandLogDump:");
}

- (BOOL)isRadioAccessTechnologyOnCellular:(unsigned int)a3
{
  return a3 - 2 < 5;
}

- (void)processBasebandAck:(id *)a3
{
  [(VCRateControlMediaController *)self->_mediaController decreaseFlushCount:1];
  unsigned int v11 = bswap32(a3->var3.var0.var0);
  uint64_t v12 = HIWORD(v11);
  if (a3->var3.var1.var1)
  {
    if (a3->var3.var1.var1 == 0xFFFF)
    {
      logBasebandDump = self->_logBasebandDump;
      if (logBasebandDump) {
        VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "TID[%04X] Baseband Drop ACK reported failure\n", v5, v6, v7, v8, v9, v10, SBYTE2(v11));
      }
    }
    else
    {
      unsigned int var2 = a3->var3.var0.var2;
      if (a3->var3.var0.var2)
      {
        unint64_t v16 = 0;
        v17 = (char *)&a3->var3.var2 + 10;
        do
        {
          uint64_t v18 = *((unsigned __int16 *)v17 - 1);
          if (v18 <= 0x1F3)
          {
            uint64_t v19 = *(v17 - 4);
            [(VCRateControlMediaController *)self->_mediaController didMediaGetFlushedWithPayloadType:v19 transactionID:v12 packetDropped:*((unsigned __int16 *)v17 - 1) sequenceNumberArray:v17];
            [(AVCBasebandCongestionDetector *)self printFlushAckToBasebandDump:v19 transactionID:v12 packetDropped:v18 sequenceNumberArray:v17];
            unsigned int var2 = a3->var3.var0.var2;
          }
          ++v16;
          v17 += 1004;
        }
        while (v16 < var2);
      }
    }
  }
  else
  {
    int v14 = self->_logBasebandDump;
    if (v14) {
      VRLogfilePrintWithTimestamp((uint64_t)v14, "TID[%04X] Baseband Drop ACK no packet dropped\n", v5, v6, v7, v8, v9, v10, SBYTE2(v11));
    }
  }
}

- (void)printFlushAckToBasebandDump:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6
{
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    char v7 = a4;
    if (a5)
    {
      uint64_t v10 = a5;
      unsigned int v11 = &stru_1F3D3E450;
      do
      {
        unsigned int v12 = *a6++;
        unsigned int v11 = (__CFString *)[(__CFString *)v11 stringByAppendingFormat:@"%04X ", v12];
        --v10;
      }
      while (v10);
      logBasebandDump = self->_logBasebandDump;
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      unsigned int v11 = &stru_1F3D3E450;
    }
    objc_msgSend((id)-[__CFString description](v11, "description"), "UTF8String");
LABEL_9:
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "TID[%04X] Baseband Drop ACK for PT %u: %2u packets dropped [%s]\n", v13, v14, v15, v16, v17, v18, v7);
  }
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (BOOL)isTargetBitrateStabilized
{
  return self->_isTargetBitrateStabilized;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (unsigned)basebandTxBitrate
{
  return self->_basebandTxBitrate;
}

- (unsigned)basebandAverageBitrate
{
  return self->_basebandAverageBitrate;
}

- (unsigned)basebandQueueDepth
{
  return self->_basebandQueueDepth;
}

- (double)basebandExpectedQueuingDelay
{
  return self->_basebandExpectedQueuingDelay;
}

- (unsigned)basebandDropPacketCount
{
  return self->_basebandDropPacketCount;
}

- (void)processNWConnectionBasebandStatisticsMessage:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d Unexpected nwConnection interface type=%d", v2, *(const char **)v3, (unint64_t)"-[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]" >> 16, 397);
}

- (void)processNWConnectionBasebandStatisticsMessage:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCRC [%s] %s:%d Unexpected statistics type=%d", v2, *(const char **)v3, (unint64_t)"-[AVCBasebandCongestionDetector processNWConnectionBasebandStatisticsMessage:]" >> 16, 396);
}

@end