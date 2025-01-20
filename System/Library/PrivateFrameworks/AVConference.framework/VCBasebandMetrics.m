@interface VCBasebandMetrics
- (BOOL)isTargetBitrateStabilized;
- (VCBasebandMetrics)init;
- (VCRateControlMediaController)mediaController;
- (double)updateTotalQueueDepth:(unsigned int)a3;
- (tagVCStatisticsMessage)getBasebandMetricsWithNotification:(SEL)a3;
- (unsigned)targetBitrate;
- (void)addBDCDListWithNotificationArrivalTime:(double)a3 bdcd:(double)a4 queuingDelay:(double)a5;
- (void)addInfoListWithNotification:(id *)a3;
- (void)calculateBitratesAndDelaysWithTotalQueueDepth:(unsigned int)a3;
- (void)dealloc;
- (void)enableBasebandLogDump:(void *)a3;
- (void)normalizeBDCD:(double)a3;
- (void)resetBBNoteHistoryList;
- (void)resetBDCDList;
- (void)setIsTargetBitrateStabilized:(BOOL)a3;
- (void)setMediaController:(id)a3;
- (void)setTargetBitrate:(unsigned int)a3;
@end

@implementation VCBasebandMetrics

- (VCBasebandMetrics)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCBasebandMetrics;
  v2 = [(VCBasebandMetrics *)&v4 init];
  if (v2)
  {
    v2->_useAverageQueueDepthForDelay = VCDefaults_GetBoolValueForKey(@"basebandUseAverageQueueDepthForDelay", 1);
    v2->_averageBitrateMovingAverageFactor = 2.0
                                           / ((double)(int)VCDefaults_GetIntValueForKey(@"basebandBitrateAverageWindow", 20)+ 1.0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCBasebandMetrics;
  [(VCBasebandMetrics *)&v3 dealloc];
}

- (tagVCStatisticsMessage)getBasebandMetricsWithNotification:(SEL)a3
{
  uint64_t v5 = self;
  *((void *)&retstr->var0.localRCEvent + 21) = 0;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 136) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 152) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 104) = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 5) = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 3) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 88) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 40) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 56) = 0u;
  *(_OWORD *)&retstr->var0.rtcpRR.lastSequenceNumber = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 1) = 0u;
  *(_OWORD *)&retstr->type = 0u;
  *(_OWORD *)&retstr->isVCRCInternal = 0u;
  unsigned int var7 = a4->var3.var0.var7;
  unsigned int var8 = a4->var3.var0.var8;
  unsigned int transmittedBytes = self->var0.baseband.transmittedBytes;
  unsigned int audioReceivedPackets = self->var0.feedback.audioReceivedPackets;
  if (var8 != audioReceivedPackets || var7 == transmittedBytes)
  {
    v11 = &self[30].var0.localRCEvent + 2;
    signed int v12 = ((var7 - transmittedBytes) & ~((int)(var7 - transmittedBytes) >> 31))
        - ((a4->var3.var0.var6 - self->var0.baseband.averageBitrateLong) & ~((signed int)(a4->var3.var0.var6
                                                                                        - self->var0.baseband.averageBitrateLong) >> 31));
    double v13 = (double)(var8 - audioReceivedPackets) / 1000.0;
    if (v12 < 1) {
      unsigned int v14 = 0;
    }
    else {
      unsigned int v14 = ((double)(8 * v12) / v13);
    }
    self[33].var0.feedback.packetReceived.totalPacketsReceived = v14;
    unsigned int var5 = a4->var3.var0.var5;
    unsigned int var6 = a4->var3.var0.var6;
    if (var8 == audioReceivedPackets || v13 > 0.005)
    {
      self[33].var0.nwConnection.var0.wifi.wifiObservedTxBitrate[5] = self[33].var0.feedback.packetReceived.totalReceivedKBytes;
      [(tagVCStatisticsMessage *)self addInfoListWithNotification:a4];
      if (v5[33].var0.feedback.packetReceived.packetType < 2u)
      {
        unsigned int sampleRate = v5[33].var0.feedback.packetReceived.sampleRate;
        v5[33].var0.feedback.packetReceived.totalReceivedKBytes = sampleRate;
        *((_DWORD *)&v5[33].var0.localRCEvent + 31) = sampleRate;
      }
      else
      {
        [(tagVCStatisticsMessage *)v5 calculateBitratesAndDelaysWithTotalQueueDepth:var6 + var5];
      }
      memcpy(&v5->isVCRCInternal, a4, 0x17A0uLL);
      double targetJitterQueueSize = v5[33].var0.feedback.packetReceived.targetJitterQueueSize;
      double v19 = *((double *)&v5[33].var0.localRCEvent + 18);
      if (targetJitterQueueSize <= v19) {
        double v20 = 0.0;
      }
      else {
        double v20 = targetJitterQueueSize - v19;
      }
      [(tagVCStatisticsMessage *)v5 normalizeBDCD:v20];
      retstr->type = 1;
      retstr->arrivalTime = a4->var2;
      *(void *)&long long v21 = *((void *)&a4->var3.var2 + 1);
      *((void *)&v21 + 1) = *(void *)((char *)&v5[33].var0.localRCEvent + 108);
      *(_OWORD *)&retstr->var0.baseband.queueDepth1 = v21;
      retstr->var0.nwConnection.maxThroughputBps = *(void *)&v5[33].var0.feedback.packetReceived.receiveTimestamp;
      unsigned int v22 = a4->var3.var0.var7;
      unsigned int v23 = a4->var3.var0.var8;
      retstr->var0.baseband.unsigned int transmittedBytes = v22;
      double v24 = v5[33].var0.feedback.packetReceived.targetJitterQueueSize / 1000.0;
      *(void *)&retstr->var0.baseband.averageQueueDepth = v5[33].var0.nwConnection.var0.wifi.accumulatedOffChannelTime;
      retstr->var0.baseband.expectedQueuingDelay = v24;
      retstr->var0.baseband.bdcd = v20;
      *(_OWORD *)((char *)&retstr->var0.localRCEvent + 56) = *v11;
      int var0 = a4->var3.var0.var0;
      retstr->var0.baseband.radioTechnology = var0;
      return (tagVCStatisticsMessage *)snprintf(retstr->var0.baseband.bbString, 0x40uLL, "%2u%2u%2u%2u%2u %6u\t%6u\t%u\t%u", a4->var1, var0, a4->var0, a4->var3.var0.var2, a4->var3.var0.var3, v21, DWORD1(v21), v22, v23);
    }
    else
    {
      retstr->type = 1;
    }
  }
  return self;
}

- (void)addInfoListWithNotification:(id *)a3
{
  int rearIndex = self->_infoList.rearIndex;
  if (self->_infoList.size)
  {
    int rearIndex = (rearIndex + 1) % 15;
    self->_infoList.int rearIndex = rearIndex;
  }
  self->_infoList.time[rearIndex] = a3->var2;
  self->_infoList.transmittedBytes[rearIndex] = a3->var3.var0.var7;
  self->_infoList.nonFlushableQueueDepth[self->_infoList.rearIndex] = a3->var3.var0.var6;
  unsigned int size = self->_infoList.size;
  if (size >= 0xF) {
    unsigned int v5 = self->_infoList.size;
  }
  else {
    unsigned int v5 = size + 1;
  }
  self->_infoList.unsigned int size = v5;
  int v6 = self->_infoList.rearIndex;
  if (v6 == self->_infoList.frontIndex && v5 >= 2) {
    self->_infoList.frontIndex = (v6 + 1) % 15;
  }
}

- (void)calculateBitratesAndDelaysWithTotalQueueDepth:(unsigned int)a3
{
  uint64_t rearIndex = self->_infoList.rearIndex;
  int v5 = ((int)rearIndex + 14) % 15;
  double v6 = self->_infoList.time[rearIndex];
  uint64_t v7 = v5;
  int frontIndex = self->_infoList.frontIndex;
  double v9 = v6 - self->_infoList.time[v5];
  if (v5 != frontIndex && v9 < 0.5)
  {
    LODWORD(v7) = ((int)rearIndex + 14) % 15;
    do
    {
      uint64_t v7 = ((int)v7 + 14) % 0xFu;
      double v9 = v6 - self->_infoList.time[v7];
    }
    while (v7 != frontIndex && v9 < 0.5);
  }
  p_double expectedQueuingDelay = (float64x2_t *)&self->_expectedQueuingDelay;
  signed int v11 = self->_infoList.transmittedBytes[rearIndex]
      - self->_infoList.nonFlushableQueueDepth[rearIndex]
      - self->_infoList.transmittedBytes[v7]
      + self->_infoList.nonFlushableQueueDepth[v7];
  unsigned int v12 = ((double)(8 * (v11 & ~(v11 >> 31))) / v9);
  if (v9 >= 0.15 || (unsigned int targetBitrate = self->_targetBitrate, v12 - 1 < targetBitrate)) {
    unsigned int targetBitrate = v12;
  }
  self->_averageBitrate = targetBitrate;
  uint64_t v14 = *(void *)&self->_averageBitrateShort;
  v15.i64[0] = v14;
  v15.i64[1] = HIDWORD(v14);
  v16 = (const double *)&qword_1E259BF10;
  float64x2_t v17 = vld1q_dup_f64(v16);
  v17.f64[0] = self->_averageBitrateMovingAverageFactor;
  v18 = (const double *)&qword_1E259C270;
  float64x2_t v19 = vld1q_dup_f64(v18);
  v19.f64[0] = 1.0 - v17.f64[0];
  *(int32x2_t *)&self->_averageBitrateShort = vmovn_s64((int64x2_t)vcvtq_u64_f64(vmlaq_f64(vmulq_n_f64(v17, (double)targetBitrate), v19, vcvtq_f64_u64(v15))));
  if (targetBitrate)
  {
    if (self->_resetAverageBitrateLong)
    {
      unsigned int v20 = self->_targetBitrate;
      if (v20 >= targetBitrate) {
        unsigned int v20 = targetBitrate;
      }
      self->_unsigned int averageBitrateLong = v20;
      self->_resetAverageBitrateLong = 0;
    }
    if (!self->_previousAverageBitrate) {
      self->_unsigned int averageBitrateLong = targetBitrate;
    }
  }
  [(VCBasebandMetrics *)self updateTotalQueueDepth:*(void *)&a3];
  unsigned int v22 = v21;
  if (self->_averageBitrate)
  {
    uint64_t v23 = *(void *)&self->_averageBitrateShort;
    v24.i64[0] = v23;
    v24.i64[1] = HIDWORD(v23);
    float64x2_t *p_expectedQueuingDelay = vdivq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(8000 * v22)), 0), vcvtq_f64_u64(v24));
  }
  else if (v22)
  {
    if (v9 > 0.5 && VCRateControlMediaController_LastVideoKeyFrameTime((uint64_t)self->_mediaController) > 0.0)
    {
      double expectedQueuingDelay = self->_expectedQueuingDelay;
      if (expectedQueuingDelay < 2001.0) {
        double expectedQueuingDelay = 2001.0;
      }
      self->_double expectedQueuingDelay = expectedQueuingDelay;
    }
    unsigned int averageBitrateLong = self->_averageBitrateLong;
    if (averageBitrateLong)
    {
      double v27 = (double)(8000 * v22) / (double)averageBitrateLong;
    }
    else
    {
      double v27 = self->_expectedQueuingDelay;
      if (v27 < 2001.0) {
        double v27 = 2001.0;
      }
    }
    self->_expectedQueuingDelayLong = v27;
  }
}

- (double)updateTotalQueueDepth:(unsigned int)a3
{
  if (!self->_useAverageQueueDepthForDelay) {
    return (double)a3;
  }
  double averageQueueDepth = self->_averageQueueDepth;
  double result = (double)a3;
  if (averageQueueDepth != 0.0)
  {
    double v5 = 0.1;
    if (averageQueueDepth > result) {
      double v5 = 0.5;
    }
    double result = v5 * result + (1.0 - v5) * averageQueueDepth;
  }
  self->_double averageQueueDepth = result;
  return result;
}

- (void)normalizeBDCD:(double)a3
{
  if (self->_averageBitrate)
  {
    p_normalizedBDCD = (float64x2_t *)&self->_normalizedBDCD;
    if (self->_isTargetBitrateStabilized)
    {
      [(VCBasebandMetrics *)self addBDCDListWithNotificationArrivalTime:self->_lastBasebandNotification.arrivalTime bdcd:a3 queuingDelay:self->_expectedQueuingDelay];
      unsigned int size = self->_bdcdList.size;
      if (size >= 4)
      {
        p_bdcdList = &self->_bdcdList;
        if (size == 4)
        {
          logBasebandDump = self->_logBasebandDump;
          if (logBasebandDump) {
            VRLogfilePrint((uint64_t)logBasebandDump, "New bitrate stabilized for baseband, collected %d BDCD samples and start normalizing BDCD.\n", v11, v12, v13, v14, v15, v16, 4);
          }
        }
        uint64_t rearIndex = self->_bdcdList.rearIndex;
        int v21 = ((int)rearIndex + 12) % 15;
        int frontIndex = self->_bdcdList.frontIndex;
        if (v21 != frontIndex)
        {
          while (p_bdcdList->time[rearIndex] - p_bdcdList->time[v21] <= 0.5)
          {
            int v21 = (v21 + 14) % 0xFu;
            if (v21 == frontIndex)
            {
              int v21 = self->_bdcdList.frontIndex;
              break;
            }
          }
        }
        if ((int)rearIndex <= v21) {
          LODWORD(rearIndex) = rearIndex + 15;
        }
        int v23 = rearIndex - v21;
        unsigned int v24 = rearIndex - v21 + 2;
        if (v23 >= -1) {
          int v25 = v23 + 1;
        }
        else {
          int v25 = v24;
        }
        if (v23 < 0)
        {
          float64x2_t v36 = 0uLL;
          double v35 = 0.0;
        }
        else
        {
          int v26 = (v21 + (v25 >> 1)) % 15;
          unsigned int v27 = v24 >> 1;
          bdcd = self->_bdcdList.bdcd;
          delay = self->_bdcdList.delay;
          float64x2_t v30 = 0uLL;
          double v31 = 0.0;
          double v32 = 0.0;
          float64x2_t v33 = 0uLL;
          do
          {
            v34.f64[0] = bdcd[v21 % 15];
            v34.f64[1] = delay[v21 % 15];
            float64x2_t v33 = vaddq_f64(v33, v34);
            v34.f64[0] = bdcd[v26 % 15];
            v34.f64[1] = delay[v26 % 15];
            float64x2_t v30 = vaddq_f64(v30, v34);
            double v32 = v32 + p_bdcdList->time[v21 % 15];
            double v31 = v31 + p_bdcdList->time[v26 % 15];
            ++v26;
            ++v21;
            --v27;
          }
          while (v27);
          double v35 = v31 - v32;
          float64x2_t v36 = vsubq_f64(v30, v33);
        }
        float64x2_t v38 = vdivq_f64(v36, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v35, 0));
        __asm { FMOV            V1.2D, #0.5 }
        float64x2_t *p_normalizedBDCD = vdivq_f64(vmulq_f64(v38, _Q1), (float64x2_t)vdupq_n_s64(0x408F400000000000uLL));
      }
    }
    else
    {
      v37 = self->_logBasebandDump;
      if (v37)
      {
        VRLogfilePrint((uint64_t)v37, "Baseband target bitrate changed and not stable.\n", v3, v4, v5, v6, v7, v8, v45);
      }
    }
  }
}

- (void)resetBDCDList
{
  *(void *)&self->_bdcdList.int frontIndex = 0;
  self->_bdcdList.unsigned int size = 0;
}

- (void)resetBBNoteHistoryList
{
  *(void *)&self->_infoList.int frontIndex = 0;
  self->_infoList.unsigned int size = 0;
}

- (void)addBDCDListWithNotificationArrivalTime:(double)a3 bdcd:(double)a4 queuingDelay:(double)a5
{
  unsigned int size = self->_bdcdList.size;
  int rearIndex = self->_bdcdList.rearIndex;
  if (size)
  {
    int rearIndex = (rearIndex + 1) % 15;
    self->_bdcdList.int rearIndex = rearIndex;
  }
  self->_bdcdList.time[rearIndex] = a3;
  uint64_t v7 = (double *)(&self->super.isa + rearIndex);
  v7[777] = a4;
  v7[792] = a5;
  if (size < 0xF) {
    ++size;
  }
  self->_bdcdList.unsigned int size = size;
  if (size >= 2 && rearIndex == self->_bdcdList.frontIndex) {
    self->_bdcdList.int frontIndex = (rearIndex + 1) % 15;
  }
}

- (void)setIsTargetBitrateStabilized:(BOOL)a3
{
  p_isTargetBitrateStabilized = &self->_isTargetBitrateStabilized;
  if (self->_isTargetBitrateStabilized || !a3)
  {
    if (self->_isTargetBitrateStabilized && !a3)
    {
      [(VCBasebandMetrics *)self resetBDCDList];
      logBasebandDump = self->_logBasebandDump;
      if (logBasebandDump) {
        VRLogfilePrint((uint64_t)logBasebandDump, "Unstable bitrate for baseband, start re-collecting BDCD list...\n", v7, v8, v9, v10, v11, v12, v14);
      }
    }
  }
  else
  {
    self->_resetAverageBitrateLong = 1;
  }
  BOOL *p_isTargetBitrateStabilized = a3;
}

- (void)enableBasebandLogDump:(void *)a3
{
  self->_logBasebandDump = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_unsigned int targetBitrate = a3;
}

- (BOOL)isTargetBitrateStabilized
{
  return self->_isTargetBitrateStabilized;
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
}

@end