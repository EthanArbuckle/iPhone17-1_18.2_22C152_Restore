@interface VCNWConnectionCongestionDetectorBaseband
- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
@end

@implementation VCNWConnectionCongestionDetectorBaseband

- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3->version < 3u)
    {
      uint8_t frequency_band = a3->var1.advisory.frequency_band;
      unsigned __int16 reference_signal_level = a3->var1.advisory.cell_context.reference_signal_level;
      __int16 v18 = *((_WORD *)&a3->var1.thermalUpdate + 29);
      uint8_t quality_score_loss = a3->var1.advisory.quality_score_loss;
      __int16 v20 = *(_WORD *)&a3->var1.advisory.version;
      ifnet_interface_advisory_interface_type interface_type = a3->var1.advisory.header.interface_type;
      uint64_t timestamp = a3->var1.advisory.timestamp;
      memset(&v31[80], 170, 24);
      memset(&v30[1], 170, 64);
      *(void *)&v30[0] = 12;
      *((void *)&v30[0] + 1) = micro();
      LODWORD(v30[1]) = 0x10000;
      WORD4(v30[1]) = v20;
      BYTE10(v30[1]) = interface_type;
      *(_DWORD *)((char *)&v30[1] + 11) = 0;
      HIBYTE(v30[1]) = 0;
      *(void *)&v30[2] = timestamp;
      *(_OWORD *)((char *)&v30[2] + 8) = 0u;
      *(_OWORD *)((char *)&v30[3] + 8) = 0u;
      *(_OWORD *)((char *)&v30[4] + 8) = 0u;
      *((void *)&v30[5] + 1) = 0;
      v31[0] = frequency_band;
      v31[1] = -86;
      *(_DWORD *)&v31[2] = reference_signal_level;
      v31[6] = 0;
      *(_WORD *)&v31[7] = v18;
      v31[9] = quality_score_loss;
      *(void *)&v31[10] = 0xAA0000000000AA00;
      memset(&v31[18], 0, 70);
      AVCStatisticsCollector_SetVCStatistics((uint64_t)self->super._statisticsCollector, (uint64_t)v30);
      long long v23 = *(_OWORD *)&v31[80];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 136) = *(_OWORD *)&v31[64];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 152) = v23;
      *((void *)&self->super._previousStatistics.var0.localRCEvent + 21) = *(void *)&v31[96];
      long long v24 = *(_OWORD *)&v31[16];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 3) = *(_OWORD *)v31;
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 88) = v24;
      long long v25 = *(_OWORD *)&v31[48];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 104) = *(_OWORD *)&v31[32];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 5) = v25;
      long long v26 = v30[3];
      *(_OWORD *)&self->super._previousStatistics.var0.rtcpRR.lastSequenceNumber = v30[2];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 1) = v26;
      long long v27 = v30[5];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 40) = v30[4];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 56) = v27;
      long long v28 = v30[1];
      LOBYTE(logNWDump) = 1;
      *(_OWORD *)&self->super._previousStatistics.type = v30[0];
      *(_OWORD *)&self->super._previousStatistics.isVCRCInternal = v28;
      return (char)logNWDump;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCNWConnectionCongestionDetectorBaseband *)v11 processNWConnectionNotification:v12];
      }
    }
    logNWDump = self->super._logNWDump;
    if (logNWDump)
    {
      VRLogfilePrint((uint64_t)logNWDump, "NWConnection notification has a bad version=%d\n", v5, v6, v7, v8, v9, v10, a3->var1.advisory.version);
LABEL_11:
      LOBYTE(logNWDump) = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_11;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    LODWORD(logNWDump) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (logNWDump)
    {
      -[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:](v14, v15);
      goto LABEL_11;
    }
  }
  return (char)logNWDump;
}

- (void)processNWConnectionNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:]";
  __int16 v6 = 1024;
  int v7 = 23;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection notification is nil", (uint8_t *)&v2, 0x1Cu);
}

- (void)processNWConnectionNotification:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a2 + 8);
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:]";
  __int16 v8 = 1024;
  int v9 = 28;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection notification has a bad version=%d", (uint8_t *)&v4, 0x22u);
}

@end