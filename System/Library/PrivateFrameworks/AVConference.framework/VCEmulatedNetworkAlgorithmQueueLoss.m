@interface VCEmulatedNetworkAlgorithmQueueLoss
- (VCEmulatedNetworkAlgorithmQueueLoss)init;
- (double)expectedProcessEndTime;
- (int)packetCountBytesInNetworkQueue;
- (unsigned)packetCountInNetworkQueue;
- (void)process:(id)a3;
- (void)setPacketCountBytesInNetworkQueue:(int)a3;
- (void)setPacketCountInNetworkQueue:(unsigned int)a3;
- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4;
@end

@implementation VCEmulatedNetworkAlgorithmQueueLoss

- (VCEmulatedNetworkAlgorithmQueueLoss)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueLoss;
  result = [(VCEmulatedNetworkAlgorithmQueueLoss *)&v3 init];
  if (result) {
    *(void *)&result->_networkQueueMaxSize = 4000;
  }
  return result;
}

- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedPLR"), "objectForKeyedSubscript:", @"time");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"FixedPLR"), "objectForKeyedSubscript:", @"value");
  int v9 = [v8 count];
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForLossRate, &self->_lastNetworkQueueLossRateLoadTime, v9, a3);
    objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForLossRate), "doubleValue");
    self->_double networkQueueLossRate = v10;
  }
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"LossPattern"), "objectForKeyedSubscript:", @"time");
  v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"LossPattern"), "objectForKeyedSubscript:", @"value");
  v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"LossPattern"), "objectForKeyedSubscript:", @"type");
  int v14 = [v12 count];
  if (v14 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v11, &self->_currentIndexForLossPattern, &self->_lastNetworkQueueLossPatternLoadTime, v14, a3);
    self->_unsigned int networkQueueLossPattern = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForLossPattern), "unsignedIntValue");
    self->_packetTypeForNetworkQueueLossPattern = (int)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", self->_currentIndexForLossPattern), "intValue");
  }
  v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"QueueSize"), "objectForKeyedSubscript:", @"time");
  v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"QueueSize"), "objectForKeyedSubscript:", @"value");
  int v17 = [v16 count];
  if (v17 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v15, &self->_currentIndexForQueueSize, &self->_lastNetworkQueueSizeLoadTime, v17, a3);
    self->_unsigned int networkQueueMaxSize = objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", self->_currentIndexForQueueSize), "intValue");
  }
  v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"QueueSizeBytes"), "objectForKeyedSubscript:", @"time");
  v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"QueueSizeBytes"), "objectForKeyedSubscript:", @"value");
  int v20 = [v19 count];
  if (v20 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v18, &self->_currentIndexForQueueSizeBytes, &self->_lastNetworkQueueSizeBytesLoadTime, v20, a3);
    self->_unsigned int networkQueueMaxSizeBytes = objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", self->_currentIndexForQueueSizeBytes), "intValue");
  }
  if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double networkQueueLossRate = self->_networkQueueLossRate;
        unsigned int networkQueueLossPattern = self->_networkQueueLossPattern;
        unsigned int networkQueueMaxSize = self->_networkQueueMaxSize;
        unsigned int networkQueueMaxSizeBytes = self->_networkQueueMaxSizeBytes;
        int v37 = 136316674;
        uint64_t v38 = v22;
        __int16 v39 = 2080;
        v40 = "-[VCEmulatedNetworkAlgorithmQueueLoss updateSettingsAtTime:impairments:]";
        __int16 v41 = 1024;
        int v42 = 80;
        __int16 v43 = 2048;
        double v44 = networkQueueLossRate;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = networkQueueLossPattern;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = networkQueueMaxSize;
        LOWORD(v47) = 1024;
        *(_DWORD *)((char *)&v47 + 2) = networkQueueMaxSizeBytes;
        v28 = " [%s] %s:%d Current emulated network packet loss=%f, lossPattern=%X, queueSize=%u packets, queue size=%u bytes";
        v29 = v23;
        uint32_t v30 = 56;
LABEL_19:
        _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, v30);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[(VCEmulatedNetworkAlgorithmQueueLoss *)self performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v33 = self->_networkQueueLossRate;
        unsigned int v34 = self->_networkQueueLossPattern;
        unsigned int v35 = self->_networkQueueMaxSize;
        unsigned int v36 = self->_networkQueueMaxSizeBytes;
        int v37 = 136317186;
        uint64_t v38 = v31;
        __int16 v39 = 2080;
        v40 = "-[VCEmulatedNetworkAlgorithmQueueLoss updateSettingsAtTime:impairments:]";
        __int16 v41 = 1024;
        int v42 = 80;
        __int16 v43 = 2112;
        double v44 = *(double *)&v21;
        __int16 v45 = 2048;
        *(void *)v46 = self;
        *(_WORD *)&v46[8] = 2048;
        double v47 = v33;
        __int16 v48 = 1024;
        unsigned int v49 = v34;
        __int16 v50 = 1024;
        unsigned int v51 = v35;
        __int16 v52 = 1024;
        unsigned int v53 = v36;
        v28 = " [%s] %s:%d %@(%p) Current emulated network packet loss=%f, lossPattern=%X, queueSize=%u packets, queue size=%u bytes";
        v29 = v32;
        uint32_t v30 = 76;
        goto LABEL_19;
      }
    }
  }
}

- (void)process:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  double networkQueueLossRate = self->_networkQueueLossRate;
  if (networkQueueLossRate > *(double *)""
    && (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= networkQueueLossRate)
  {
    [a3 setIsLost:1];
  }
  if ([a3 type] && objc_msgSend(a3, "type") == self->_packetTypeForNetworkQueueLossPattern)
  {
    [a3 setIsLost:(self->_networkQueueLossPattern >> self->_currentLossPatternShift) & 1];
    self->_currentLossPatternShift = (self->_currentLossPatternShift + 1) & 0x1F;
  }
  if (self->_packetCountInNetworkQueue > self->_networkQueueMaxSize && !self->_networkQueueMaxSizeBytes)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int packetCountInNetworkQueue = self->_packetCountInNetworkQueue;
        unsigned int networkQueueMaxSize = self->_networkQueueMaxSize;
        *(_DWORD *)v63 = 136316162;
        *(void *)&v63[4] = v6;
        *(_WORD *)&v63[12] = 2080;
        *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
        *(_WORD *)&v63[22] = 1024;
        LODWORD(v64) = 94;
        WORD2(v64) = 1024;
        *(_DWORD *)((char *)&v64 + 6) = packetCountInNetworkQueue;
        WORD5(v64) = 1024;
        HIDWORD(v64) = networkQueueMaxSize;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d network queue is full with packet count=%u, limit=%u", v63, 0x28u);
      }
    }
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_23;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v13 = [a3 packetID];
      int v14 = [a3 sequenceNumber];
      int v15 = [a3 size];
      [a3 arrivalTime];
      uint64_t v17 = v16;
      [a3 departureTime];
      *(_DWORD *)v63 = 136316930;
      *(void *)&v63[4] = v11;
      *(_WORD *)&v63[12] = 2080;
      *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 95;
      WORD2(v64) = 1024;
      *(_DWORD *)((char *)&v64 + 6) = v13;
      WORD5(v64) = 1024;
      HIDWORD(v64) = v14;
      LOWORD(v65) = 1024;
      *(_DWORD *)((char *)&v65 + 2) = v15;
      HIWORD(v65) = 2048;
      uint64_t v66 = v17;
      *(_WORD *)v67 = 2048;
      *(void *)&v67[2] = v18;
      v19 = " [%s] %s:%d dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      int v20 = v12;
      uint32_t v21 = 66;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        double v10 = (__CFString *)[(VCEmulatedNetworkAlgorithmQueueLoss *)self performSelector:sel_logPrefix];
      }
      else {
        double v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_23;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v24 = [a3 packetID];
      int v25 = [a3 sequenceNumber];
      int v26 = [a3 size];
      [a3 arrivalTime];
      uint64_t v28 = v27;
      [a3 departureTime];
      *(_DWORD *)v63 = 136317442;
      *(void *)&v63[4] = v22;
      *(_WORD *)&v63[12] = 2080;
      *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 95;
      WORD2(v64) = 2112;
      *(void *)((char *)&v64 + 6) = v10;
      HIWORD(v64) = 2048;
      v65 = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v24;
      HIWORD(v66) = 1024;
      *(_DWORD *)v67 = v25;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = v26;
      *(_WORD *)&v67[10] = 2048;
      *(void *)&v67[12] = v28;
      *(_WORD *)&v67[20] = 2048;
      *(void *)&v67[22] = v29;
      v19 = " [%s] %s:%d %@(%p) dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      int v20 = v23;
      uint32_t v21 = 86;
    }
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v63, v21);
LABEL_23:
    objc_msgSend(a3, "setIsLost:", 1, *(_OWORD *)v63, *(void *)&v63[16], v64, v65, v66, *(void *)v67, *(_OWORD *)&v67[8], *(void *)&v67[24], v68);
  }
  signed int networkQueueMaxSizeBytes = self->_networkQueueMaxSizeBytes;
  if (self->_packetCountBytesInNetworkQueue > networkQueueMaxSizeBytes && networkQueueMaxSizeBytes)
  {
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        double v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int packetCountBytesInNetworkQueue = self->_packetCountBytesInNetworkQueue;
          unsigned int v35 = self->_networkQueueMaxSizeBytes;
          *(_DWORD *)v63 = 136316162;
          *(void *)&v63[4] = v32;
          *(_WORD *)&v63[12] = 2080;
          *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
          *(_WORD *)&v63[22] = 1024;
          LODWORD(v64) = 100;
          WORD2(v64) = 1024;
          *(_DWORD *)((char *)&v64 + 6) = packetCountBytesInNetworkQueue;
          WORD5(v64) = 1024;
          HIDWORD(v64) = v35;
          unsigned int v36 = " [%s] %s:%d network queue is full with current size=%d (bytes), limit=%u (bytes)";
          int v37 = v33;
          uint32_t v38 = 40;
LABEL_36:
          _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, v63, v38);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v31 = (__CFString *)[(VCEmulatedNetworkAlgorithmQueueLoss *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v41 = self->_packetCountBytesInNetworkQueue;
          unsigned int v42 = self->_networkQueueMaxSizeBytes;
          *(_DWORD *)v63 = 136316674;
          *(void *)&v63[4] = v39;
          *(_WORD *)&v63[12] = 2080;
          *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
          *(_WORD *)&v63[22] = 1024;
          LODWORD(v64) = 100;
          WORD2(v64) = 2112;
          *(void *)((char *)&v64 + 6) = v31;
          HIWORD(v64) = 2048;
          v65 = self;
          LOWORD(v66) = 1024;
          *(_DWORD *)((char *)&v66 + 2) = v41;
          HIWORD(v66) = 1024;
          *(_DWORD *)v67 = v42;
          unsigned int v36 = " [%s] %s:%d %@(%p) network queue is full with current size=%d (bytes), limit=%u (bytes)";
          int v37 = v40;
          uint32_t v38 = 60;
          goto LABEL_36;
        }
      }
    }
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_48;
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      __int16 v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      int v46 = [a3 packetID];
      int v47 = [a3 sequenceNumber];
      int v48 = [a3 size];
      [a3 arrivalTime];
      uint64_t v50 = v49;
      [a3 departureTime];
      *(_DWORD *)v63 = 136316930;
      *(void *)&v63[4] = v44;
      *(_WORD *)&v63[12] = 2080;
      *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 101;
      WORD2(v64) = 1024;
      *(_DWORD *)((char *)&v64 + 6) = v46;
      WORD5(v64) = 1024;
      HIDWORD(v64) = v47;
      LOWORD(v65) = 1024;
      *(_DWORD *)((char *)&v65 + 2) = v48;
      HIWORD(v65) = 2048;
      uint64_t v66 = v50;
      *(_WORD *)v67 = 2048;
      *(void *)&v67[2] = v51;
      __int16 v52 = " [%s] %s:%d dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      unsigned int v53 = v45;
      uint32_t v54 = 66;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v43 = (__CFString *)[(VCEmulatedNetworkAlgorithmQueueLoss *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v43 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_48;
      }
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      int v57 = [a3 packetID];
      int v58 = [a3 sequenceNumber];
      int v59 = [a3 size];
      [a3 arrivalTime];
      uint64_t v61 = v60;
      [a3 departureTime];
      *(_DWORD *)v63 = 136317442;
      *(void *)&v63[4] = v55;
      *(_WORD *)&v63[12] = 2080;
      *(void *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 101;
      WORD2(v64) = 2112;
      *(void *)((char *)&v64 + 6) = v43;
      HIWORD(v64) = 2048;
      v65 = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v57;
      HIWORD(v66) = 1024;
      *(_DWORD *)v67 = v58;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = v59;
      *(_WORD *)&v67[10] = 2048;
      *(void *)&v67[12] = v61;
      *(_WORD *)&v67[20] = 2048;
      *(void *)&v67[22] = v62;
      __int16 v52 = " [%s] %s:%d %@(%p) dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      unsigned int v53 = v56;
      uint32_t v54 = 86;
    }
    _os_log_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEFAULT, v52, v63, v54);
LABEL_48:
    objc_msgSend(a3, "setIsLost:", 1, *(void *)v63, *(_OWORD *)&v63[8], v64, v65, v66, *(void *)v67, *(void *)&v67[8], *(_OWORD *)&v67[16]);
  }
}

- (double)expectedProcessEndTime
{
  return self->_expectedProcessEndTime;
}

- (unsigned)packetCountInNetworkQueue
{
  return self->_packetCountInNetworkQueue;
}

- (void)setPacketCountInNetworkQueue:(unsigned int)a3
{
  self->_unsigned int packetCountInNetworkQueue = a3;
}

- (int)packetCountBytesInNetworkQueue
{
  return self->_packetCountBytesInNetworkQueue;
}

- (void)setPacketCountBytesInNetworkQueue:(int)a3
{
  self->_int packetCountBytesInNetworkQueue = a3;
}

@end