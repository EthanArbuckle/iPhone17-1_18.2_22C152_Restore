@interface AVCRateControlFeedbackController
- (AVCRateControlFeedbackController)initWithStatisticsCollector:(id)a3;
- (BOOL)getFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6;
- (BOOL)getRateControlFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6;
- (BOOL)getVCStatisticsFeedbackMessage:(tagVCStatisticsMessage *)a3 time:(double)a4;
- (BOOL)isECNEnabled;
- (BOOL)isFeedbackReceived;
- (BOOL)processFeedbackMessage:(id)a3 type:(unsigned int)a4 metaData:(id)a5 error:(id *)a6;
- (BOOL)processRateControlLocalRCEvent:(tagVCStatisticsLocalRCEvent *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6;
- (BOOL)processRateControlMessageArray:(id)a3 type:(unsigned int)a4;
- (BOOL)processRateControlPacketReceived:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6;
- (BOOL)processRateControlPacketSent:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6;
- (BOOL)processRateControlProbingMessage:(id *)a3 type:(unsigned int)a4 error:(id *)a5;
- (BOOL)processRateControlServerStats:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6;
- (VCConnectionHealthMonitor)connectionHealthMonitor;
- (id)translateRateControlDataWithFeedbackMessage:(id *)a3;
- (unsigned)getConnectionStatsBlob;
- (unsigned)mode;
- (void)dealloc;
- (void)resetBurstyLossStatistics;
- (void)setConnectionHealthMonitor:(id)a3;
- (void)setIsFeedbackReceived:(BOOL)a3;
- (void)setMode:(unsigned int)a3;
@end

@implementation AVCRateControlFeedbackController

- (AVCRateControlFeedbackController)initWithStatisticsCollector:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVCRateControlFeedbackController;
  result = [(AVCRateControlFeedbackController *)&v5 init];
  if (result)
  {
    result->_statisticsCollector = (AVCStatisticsCollector *)a3;
    result->_isECNEnabled = 0;
    result->_txLinkType = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCRateControlFeedbackController;
  [(AVCRateControlFeedbackController *)&v3 dealloc];
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (BOOL)getFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6
{
  unsigned int mode = self->_mode;
  BOOL v7 = mode > 7;
  int v8 = (1 << mode) & 0x8E;
  return !v7
      && v8 != 0
      && [(AVCRateControlFeedbackController *)self getRateControlFeedbackMessage:a3 type:*(void *)&a4 metaData:a5 error:a6];
}

- (BOOL)processFeedbackMessage:(id)a3 type:(unsigned int)a4 metaData:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  double v10 = micro();
  unsigned int mode = self->_mode;
  if (mode - 1 < 3)
  {
    uint64_t v46 = 0;
    long long v45 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    long long v40 = 0u;
    long long v39 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    v12 = (unsigned __int16 *)[a3 bytes];
    int v13 = v12[1];
    unsigned int v14 = v12[2];
    DWORD2(v36) = v14 >> 12;
    DWORD1(v38) = *v12;
    DWORD1(v37) = v14 & 0xFFF;
    int v15 = v12[4];
    v35[1] = v12[3];
    LODWORD(v36) = v13;
    v35[0] = v15;
    *(void *)&long long v39 = RTPUnpackDouble(v12[5]);
    v16 = v35;
    return _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)v16, a4, v10);
  }
  if (mode == 7)
  {
    if (a5)
    {
      if ([a5 objectForKeyedSubscript:@"MetaDataTestSimulationTime"])
      {
        objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"MetaDataTestSimulationTime"), "doubleValue");
        double v10 = v17;
      }
    }
    uint64_t v34 = 0;
    long long v33 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = (unsigned __int16 *)[a3 bytes];
    int v19 = v18[1];
    unsigned int v20 = v18[2];
    DWORD2(v24) = v20 >> 12;
    DWORD1(v26) = *v18;
    DWORD1(v25) = v20 & 0xFFF;
    int v21 = v18[4];
    v23[1] = v18[3];
    LODWORD(v24) = v19;
    v23[0] = v21;
    *(void *)&long long v27 = RTPUnpackDouble(v18[5]);
    v16 = v23;
    return _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)v16, a4, v10);
  }
  return 0;
}

- (BOOL)processRateControlServerStats:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  ++self->_feedbackMessageCount;
  if (a4 == 3)
  {
    LODWORD(v8[0]) = 5;
    *((double *)v8 + 1) = a6;
    *(void *)((char *)&v8[1] + 12) = *(void *)&a3->var1;
    DWORD2(v8[2]) = a3->var4;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 3;
}

- (BOOL)processRateControlPacketReceived:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (a4 == 4)
  {
    *((double *)&v9 + 1) = a6;
    LODWORD(v9) = 7;
    unsigned int var9 = a3->var9;
    DWORD2(v10) = 2;
    HIDWORD(v13) = var9;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v9);
  }
  return a4 == 4;
}

- (BOOL)processRateControlPacketSent:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
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
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  if (a4 == 5)
  {
    *(double *)&v8[0].var2 = a6;
    v8[0].var0 = 6;
    v8[1] = *a3;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 5;
}

- (BOOL)processRateControlLocalRCEvent:(tagVCStatisticsLocalRCEvent *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
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
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  if (a4 == 6)
  {
    v8[0].recentFeedbackTime = a6;
    LODWORD(v8[0].recentSendTime) = 14;
    v8[1] = *a3;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 6;
}

- (BOOL)processRateControlMessageArray:(id)a3 type:(unsigned int)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v7 = micro();
  switch(a4)
  {
    case 1u:
      DWORD2(v26[1]) = 0;
      *(void *)&v26[1] = 0;
      memset(&v26[3], 0, 112);
      int v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 5), "unsignedIntValue");
      unsigned int v9 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      int v10 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "unsignedIntValue");
      int v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 4), "unsignedIntValue");
      int v12 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      LODWORD(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      HIDWORD(v24) = v12;
      uint64_t v25 = v9;
      LODWORD(v26[0]) = v10;
      *(void *)((char *)v26 + 4) = 0;
      HIDWORD(v26[0]) = v11;
      HIDWORD(v26[1]) = v8;
      *(void *)&v26[2] = 0;
      *((double *)&v26[2] + 1) = (double)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 6), "unsignedIntValue");
      BOOL result = _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)&v24, 1, v7);
      break;
    case 2u:
      BYTE4(v24) = 0;
      LODWORD(v24) = 0;
      memset((char *)v26 + 12, 0, 48);
      *(_OWORD *)((char *)&v26[3] + 8) = 0u;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v24), "doubleValue");
      uint64_t v15 = v14;
      int v16 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      BYTE5(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "BOOLValue");
      HIWORD(v24) = 0;
      LODWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "unsignedIntValue");
      HIDWORD(v25) = v16;
      *(void *)&v26[0] = v15;
      DWORD2(v26[0]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 4), "unsignedIntValue");
      BOOL result = [(AVCRateControlFeedbackController *)self processRateControlProbingMessage:&v24 type:2 error:0];
      break;
    case 3u:
      memset((char *)v26 + 4, 0, 68);
      LODWORD(v24) = 0;
      HIDWORD(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      uint64_t v25 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      LODWORD(v26[0]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      BOOL result = [(AVCRateControlFeedbackController *)self processRateControlServerStats:&v24 type:3 error:0 time:v7];
      break;
    case 4u:
      LODWORD(v26[2]) = 0;
      DWORD1(v26[2]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, 0, 0, 0, 0, 0, 0, *(void *)&v26[2]), "unsignedIntValue");
      BOOL result = [(AVCRateControlFeedbackController *)self processRateControlPacketReceived:&v24 type:4 error:0 time:v7];
      break;
    case 5u:
      unsigned int v17 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      unsigned int v18 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      unsigned int v19 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "doubleValue");
      unint64_t v24 = __PAIR64__(v18, v17);
      uint64_t v25 = v19;
      *(void *)&v26[0] = v20;
      BOOL result = [(AVCRateControlFeedbackController *)self processRateControlPacketSent:&v24 type:5 error:0 time:v7];
      break;
    case 6u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "doubleValue");
      unint64_t v22 = v21;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "doubleValue");
      unint64_t v24 = v22;
      uint64_t v25 = v23;
      *(void *)&v26[0] = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      BOOL result = [(AVCRateControlFeedbackController *)self processRateControlLocalRCEvent:&v24 type:6 error:0 time:v7];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)getRateControlFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4 == 2)
  {
    LOBYTE(v10) = 1;
  }
  else if (a4 == 1 && a3)
  {
    memset(v13, 0, sizeof(v13));
    double v9 = micro();
    if (a5 && *a5) {
      objc_msgSend((id)objc_msgSend(*a5, "objectForKeyedSubscript:", @"MetaDataTestSimulationTime", v9), "doubleValue");
    }
    BOOL v10 = [(AVCRateControlFeedbackController *)self getVCStatisticsFeedbackMessage:v13 time:v9];
    if (v10)
    {
      v12[8] = *(_OWORD *)&v13[152];
      v12[9] = *(_OWORD *)&v13[168];
      v12[10] = *(_OWORD *)&v13[184];
      v12[4] = *(_OWORD *)&v13[88];
      v12[5] = *(_OWORD *)&v13[104];
      v12[6] = *(_OWORD *)&v13[120];
      v12[7] = *(_OWORD *)&v13[136];
      v12[0] = *(_OWORD *)&v13[24];
      v12[1] = *(_OWORD *)&v13[40];
      v12[2] = *(_OWORD *)&v13[56];
      v12[3] = *(_OWORD *)&v13[72];
      *a3 = [(AVCRateControlFeedbackController *)self translateRateControlDataWithFeedbackMessage:v12];
      [(AVCRateControlFeedbackController *)self resetBurstyLossStatistics];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRateControlFeedbackController getRateControlFeedbackMessage:type:metaData:error:]();
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)getVCStatisticsFeedbackMessage:(tagVCStatisticsMessage *)a3 time:(double)a4
{
  if (a3)
  {
    statisticsCollector = self->_statisticsCollector;
    if (statisticsCollector)
    {
      [(AVCStatisticsCollector *)statisticsCollector getVCStatisticsWithType:2 time:a4];
    }
    else
    {
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
    }
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 136) = v17;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 152) = v18;
    *((void *)&a3->var0.localRCEvent + 21) = v19;
    *(_OWORD *)(&a3->var0.localRCEvent + 3) = v13;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 88) = v14;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 104) = v15;
    *(_OWORD *)(&a3->var0.localRCEvent + 5) = v16;
    *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber = v9;
    *(_OWORD *)(&a3->var0.localRCEvent + 1) = v10;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 40) = v11;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 56) = v12;
    *(_OWORD *)&a3->type = v7;
    *(_OWORD *)&a3->isVCRCInternal = v8;
  }
  return a3 != 0;
}

- (unsigned)getConnectionStatsBlob
{
  return [(VCConnectionHealthMonitor *)self->_connectionHealthMonitor generateStatsBlob];
}

- (BOOL)processRateControlProbingMessage:(id *)a3 type:(unsigned int)a4 error:(id *)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (a4 == 2)
  {
    *((void *)&v9[0] + 1) = *(void *)&a3->var6;
    long long v6 = *(_OWORD *)&a3->var6;
    *(_OWORD *)((char *)&v9[3] + 8) = *(_OWORD *)&a3->var9.var0;
    long long v7 = *(_OWORD *)&a3->var9.var6;
    *(_OWORD *)((char *)&v9[4] + 8) = *(_OWORD *)&a3->var9.var4;
    *(_OWORD *)((char *)&v9[5] + 8) = v7;
    *(_OWORD *)((char *)&v9[1] + 8) = *(_OWORD *)&a3->var0;
    LODWORD(v9[0]) = 4;
    BYTE3(v9[1]) = 1;
    *((void *)&v9[6] + 1) = *(void *)&a3->var9.var8;
    *(_OWORD *)((char *)&v9[2] + 8) = v6;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v9);
  }
  return a4 == 2;
}

- (id)translateRateControlDataWithFeedbackMessage:(id *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5[0] = a3->var11;
  v5[1] = a3->var2;
  v5[2] = a3->var7 & 0xFFF | (LOWORD(a3->var4) << 12);
  unsigned int var0 = a3->var0;
  v5[3] = a3->var1;
  v5[4] = var0;
  v5[5] = RTPPackDouble(a3->var13);
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:12];
}

- (void)resetBurstyLossStatistics
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v3 = 0u;
  long long v4 = 0u;
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  LODWORD(v3) = 7;
  BYTE3(v4) = 1;
  DWORD2(v4) = 1;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v3);
  DWORD2(v4) = 2;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v3);
}

- (unsigned)mode
{
  return self->_mode;
}

- (VCConnectionHealthMonitor)connectionHealthMonitor
{
  return self->_connectionHealthMonitor;
}

- (void)setConnectionHealthMonitor:(id)a3
{
}

- (BOOL)isFeedbackReceived
{
  return self->_isFeedbackReceived;
}

- (void)setIsFeedbackReceived:(BOOL)a3
{
  self->_isFeedbackReceived = a3;
}

- (BOOL)isECNEnabled
{
  return self->_isECNEnabled;
}

- (void)getRateControlFeedbackMessage:type:metaData:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Cannot get rate control feedback message!", v2, v3, v4, v5, v6);
}

@end