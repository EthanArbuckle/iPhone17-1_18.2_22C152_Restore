@interface VCRateControlOWRDEstimator
- (BOOL)detectAbnormalOWRDWithRoundTripTime:(double)a3;
- (BOOL)detectOutOfOrderAndSpikeWithReceiveTimestamp:(unsigned int)a3;
- (BOOL)detectOutOfOrderAndSpikeWithSendTimestamp:(unsigned int)a3;
- (double)owrd;
- (double)relativeReceiveTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4;
- (double)relativeSendTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4;
- (unsigned)mode;
- (void)calculateOWRDWithSendTime:(double)a3 receiveTime:(double)a4 roundTripTime:(double)a5;
- (void)resetOWRDEstimation;
- (void)setMode:(unsigned int)a3;
@end

@implementation VCRateControlOWRDEstimator

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
  self->_useUINT16 = (a3 & 0xFFFFFFFE) != 8;
}

- (double)relativeSendTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int firstSendTimestamp = self->_firstSendTimestamp;
  if (!firstSendTimestamp)
  {
    self->_unsigned int firstSendTimestamp = a3;
    unsigned int firstSendTimestamp = a3;
  }
  unsigned int v7 = a3 - firstSendTimestamp;
  unsigned int previousSendTimestampDiff = self->_previousSendTimestampDiff;
  if (self->_useUINT16)
  {
    if ((unsigned __int16)previousSendTimestampDiff == (unsigned __int16)v7) {
      return -1.0;
    }
  }
  else
  {
    double result = -1.0;
    if (v7 == previousSendTimestampDiff) {
      return result;
    }
  }
  BOOL v10 = -[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:](self, "detectOutOfOrderAndSpikeWithSendTimestamp:");
  double result = -2.0;
  if (!v10)
  {
    unsigned int v11 = self->_previousSendTimestampDiff;
    if (self->_useUINT16)
    {
      unsigned int v7 = (unsigned __int16)v7;
      if ((unsigned __int16)(v7 - v11) > 0x7FFEu)
      {
        uint64_t v18 = 0xFFFFLL;
        goto LABEL_33;
      }
      if ((unsigned __int16)v7 < (unsigned __int16)v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          v14 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              uint64_t v20 = v12;
              __int16 v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]";
              __int16 v23 = 1024;
              int v24 = 98;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]();
          }
        }
        uint64_t v18 = 0xFFFFLL;
LABEL_31:
        ++self->_sendTimestampWrappedAround;
        goto LABEL_32;
      }
      uint64_t v18 = 0xFFFFLL;
    }
    else
    {
      if (v7 - v11 > 0x7FFFFFFE)
      {
        uint64_t v18 = 0xFFFFFFFFLL;
        goto LABEL_33;
      }
      if (v7 < v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E4F47A50];
          v17 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              uint64_t v20 = v15;
              __int16 v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]";
              __int16 v23 = 1024;
              int v24 = 107;
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]();
          }
        }
        uint64_t v18 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      uint64_t v18 = 0xFFFFFFFFLL;
    }
LABEL_32:
    self->_unsigned int previousSendTimestampDiff = v7;
LABEL_33:
    double result = (double)(self->_sendTimestampWrappedAround * v18 + v7) / (double)a4;
    if (self->_firstSendTime == 0.0) {
      self->_firstSendTime = result;
    }
  }
  return result;
}

- (double)relativeReceiveTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int firstReceiveTimestamp = self->_firstReceiveTimestamp;
  if (!firstReceiveTimestamp)
  {
    self->_unsigned int firstReceiveTimestamp = a3;
    unsigned int firstReceiveTimestamp = a3;
  }
  unsigned int v7 = a3 - firstReceiveTimestamp;
  unsigned int previousReceiveTimestampDiff = self->_previousReceiveTimestampDiff;
  if (self->_useUINT16)
  {
    if ((unsigned __int16)previousReceiveTimestampDiff == (unsigned __int16)v7) {
      return -1.0;
    }
  }
  else
  {
    double result = -1.0;
    if (v7 == previousReceiveTimestampDiff) {
      return result;
    }
  }
  BOOL v10 = -[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:](self, "detectOutOfOrderAndSpikeWithReceiveTimestamp:");
  double result = -2.0;
  if (!v10)
  {
    unsigned int v11 = self->_previousReceiveTimestampDiff;
    if (self->_useUINT16)
    {
      unsigned int v7 = (unsigned __int16)v7;
      if ((unsigned __int16)(v7 - v11) > 0x7FFEu)
      {
        uint64_t v18 = 0xFFFFLL;
        goto LABEL_33;
      }
      if ((unsigned __int16)v7 < (unsigned __int16)v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          v14 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              uint64_t v20 = v12;
              __int16 v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]";
              __int16 v23 = 1024;
              int v24 = 143;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]();
          }
        }
        uint64_t v18 = 0xFFFFLL;
LABEL_31:
        ++self->_receiveTimestampWrappedAround;
        goto LABEL_32;
      }
      uint64_t v18 = 0xFFFFLL;
    }
    else
    {
      if (v7 - v11 > 0x7FFFFFFE)
      {
        uint64_t v18 = 0xFFFFFFFFLL;
        goto LABEL_33;
      }
      if (v7 < v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E4F47A50];
          v17 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              uint64_t v20 = v15;
              __int16 v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]";
              __int16 v23 = 1024;
              int v24 = 152;
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]();
          }
        }
        uint64_t v18 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      uint64_t v18 = 0xFFFFFFFFLL;
    }
LABEL_32:
    self->_unsigned int previousReceiveTimestampDiff = v7;
LABEL_33:
    double result = (double)(self->_receiveTimestampWrappedAround * v18 + v7) / (double)a4;
    if (self->_firstReceiveTime == 0.0) {
      self->_firstReceiveTime = result;
    }
  }
  return result;
}

- (void)calculateOWRDWithSendTime:(double)a3 receiveTime:(double)a4 roundTripTime:(double)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 || a4 < 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136316162;
        uint64_t v33 = v24;
        __int16 v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
        __int16 v36 = 1024;
        int v37 = 168;
        __int16 v38 = 2048;
        double v39 = a3;
        __int16 v40 = 2048;
        double v41 = a4;
        __int16 v21 = "VCRC [%s] %s:%d Repeated or out of order timestamp detected when calculating OWRD, sendTime=%f, receiveTime=%f";
        v22 = v25;
        uint32_t v23 = 48;
        goto LABEL_20;
      }
    }
  }
  else
  {
    double firstSendTime = self->_firstSendTime;
    if (firstSendTime == 0.0)
    {
      self->_double firstSendTime = a3;
      double firstSendTime = a3;
    }
    double firstReceiveTime = self->_firstReceiveTime;
    if (firstReceiveTime == 0.0)
    {
      self->_double firstReceiveTime = a4;
      double firstReceiveTime = a4;
    }
    double v11 = a4 - firstReceiveTime;
    double v12 = a3 - firstSendTime;
    double v13 = a4 - firstReceiveTime - v12;
    double shortAverageLag = self->_shortAverageLag;
    if (shortAverageLag == 0.0 || (double longAverageLag = self->_longAverageLag, longAverageLag == 0.0))
    {
      self->_double shortAverageLag = v13;
      self->_double longAverageLag = v13;
      double longAverageLag = v13;
      double shortAverageLag = v13;
    }
    if (v13 - shortAverageLag <= 30.0 && longAverageLag - v13 <= 30.0)
    {
      double v26 = v13 * 0.0001 + longAverageLag * 0.9999;
      double v27 = v13 * 0.1 + shortAverageLag * 0.9;
      self->_double shortAverageLag = v27;
      self->_double longAverageLag = v26;
      double v28 = v27 - v26;
      self->_double owrd = v28;
      if (v28 < 0.0)
      {
        self->_double longAverageLag = v27;
        self->_double owrd = 0.0;
      }
      if ([(VCRateControlOWRDEstimator *)self detectAbnormalOWRDWithRoundTripTime:a5])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            double owrd = self->_owrd;
            int v32 = 136316162;
            uint64_t v33 = v29;
            __int16 v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
            __int16 v36 = 1024;
            int v37 = 204;
            __int16 v38 = 2048;
            double v39 = owrd;
            __int16 v40 = 2048;
            double v41 = a5;
            _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Abnormal OWRD %f detected while RTT stays low at %f for too long. Reference could be bad. Reset OWRD", (uint8_t *)&v32, 0x30u);
          }
        }
        [(VCRateControlOWRDEstimator *)self resetOWRDEstimation];
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v19 = self->_shortAverageLag;
        double v20 = self->_longAverageLag;
        int v32 = 136317186;
        uint64_t v33 = v17;
        __int16 v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
        __int16 v36 = 1024;
        int v37 = 190;
        __int16 v38 = 2048;
        double v39 = v13;
        __int16 v40 = 2048;
        double v41 = v11;
        __int16 v42 = 2048;
        double v43 = v12;
        __int16 v44 = 2048;
        double v45 = v19;
        __int16 v46 = 2048;
        double v47 = v20;
        __int16 v48 = 2048;
        uint64_t v49 = 0x403E000000000000;
        __int16 v21 = "VCRC [%s] %s:%d Lag=%f with receiveDiff=%f and sendDiff=%f looks spurios (shortLag=%f, longLag=%f, thresho"
              "ld=%f), discarding";
        v22 = v18;
        uint32_t v23 = 88;
LABEL_20:
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v32, v23);
      }
    }
  }
}

- (BOOL)detectAbnormalOWRDWithRoundTripTime:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0 || ((double v5 = self->_owrd, v5 > 2.0) ? (v6 = v5 <= a3 * 5.0) : (v6 = 1), v6))
  {
    self->_unsigned int abnormalOWRDSampleCount = 0;
  }
  else
  {
    ++self->_abnormalOWRDSampleCount;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      BOOL v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double owrd = self->_owrd;
        unsigned int abnormalOWRDSampleCount = self->_abnormalOWRDSampleCount;
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        v16 = "-[VCRateControlOWRDEstimator detectAbnormalOWRDWithRoundTripTime:]";
        __int16 v17 = 1024;
        int v18 = 214;
        __int16 v19 = 2048;
        double v20 = owrd;
        __int16 v21 = 2048;
        double v22 = a3;
        __int16 v23 = 1024;
        unsigned int v24 = abnormalOWRDSampleCount;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Abnormal OWRD %f detected while RTT stays low at %f. abnormalOWRDSampleCount:%u", (uint8_t *)&v13, 0x36u);
      }
    }
  }
  return self->_abnormalOWRDSampleCount > 0x1E;
}

- (BOOL)detectOutOfOrderAndSpikeWithSendTimestamp:(unsigned int)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unsigned int previousSendTimestamp = self->_previousSendTimestamp;
  if (!previousSendTimestamp)
  {
    BOOL result = 0;
    self->_unsigned int previousSendTimestamp = a3;
    return result;
  }
  unsigned int v6 = a3 - previousSendTimestamp;
  double averageSendInterval = self->_averageSendInterval;
  if (averageSendInterval <= 0.0) {
    goto LABEL_25;
  }
  unsigned int v8 = (averageSendInterval * 10.0);
  if (self->_useUINT16)
  {
    unsigned int v9 = (unsigned __int16)(a3 - previousSendTimestamp);
    if (v9 <= 0x7FFE)
    {
      if (v9 <= (unsigned __int16)v8)
      {
        if (!self->_sendTimestampSpikeDetected || v9 >= (unsigned __int16)(averageSendInterval * 1.2))
        {
LABEL_43:
          BOOL result = 0;
          self->_unsigned int previousSendTimestamp = a3;
          self->_sendTimestampSpikeDetected = 0;
          goto LABEL_26;
        }
LABEL_36:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          double v27 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v28 = self->_previousSendTimestamp;
            if (self->_useUINT16) {
              unsigned int v29 = (unsigned __int16)v6;
            }
            else {
              unsigned int v29 = v6;
            }
            double v30 = self->_averageSendInterval;
            double owrd = self->_owrd;
            int v32 = 136316930;
            uint64_t v33 = v26;
            __int16 v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
            __int16 v36 = 1024;
            int v37 = 244;
            __int16 v38 = 1024;
            unsigned int v39 = a3;
            __int16 v40 = 1024;
            unsigned int v41 = v28;
            __int16 v42 = 1024;
            unsigned int v43 = v29;
            __int16 v44 = 2048;
            double v45 = v30;
            __int16 v46 = 2048;
            double v47 = owrd;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike before send timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
          }
        }
        [(VCRateControlOWRDEstimator *)self resetOWRDEstimation];
        goto LABEL_43;
      }
      goto LABEL_19;
    }
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      double v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = self->_previousSendTimestamp;
        if (self->_useUINT16) {
          unsigned int v14 = (unsigned __int16)v6;
        }
        else {
          unsigned int v14 = v6;
        }
        double v15 = self->_owrd;
        int v32 = 136316674;
        uint64_t v33 = v11;
        __int16 v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
        __int16 v36 = 1024;
        int v37 = 236;
        __int16 v38 = 1024;
        unsigned int v39 = a3;
        __int16 v40 = 1024;
        unsigned int v41 = v13;
        __int16 v42 = 1024;
        unsigned int v43 = v14;
        __int16 v44 = 2048;
        double v45 = v15;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected out of order at send timestamp %X, previousTS:%X, timestampDiff:%d, current owrd:%f", (uint8_t *)&v32, 0x38u);
      }
    }
    BOOL result = 1;
    goto LABEL_26;
  }
  if (v6 >= 0x7FFFFFFF) {
    goto LABEL_11;
  }
  if (v6 <= v8)
  {
    if (!self->_sendTimestampSpikeDetected || v6 >= (averageSendInterval * 1.2)) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
LABEL_19:
  self->_sendTimestampSpikeDetected = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
  {
LABEL_25:
    BOOL result = 0;
    goto LABEL_26;
  }
  uint64_t v16 = VRTraceErrorLogLevelToCSTR();
  __int16 v17 = *MEMORY[0x1E4F47A50];
  BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v18)
  {
    unsigned int v19 = self->_previousSendTimestamp;
    if (self->_useUINT16) {
      unsigned int v20 = (unsigned __int16)v6;
    }
    else {
      unsigned int v20 = v6;
    }
    double v21 = self->_averageSendInterval;
    double v22 = self->_owrd;
    int v32 = 136316930;
    uint64_t v33 = v16;
    __int16 v34 = 2080;
    v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
    __int16 v36 = 1024;
    int v37 = 240;
    __int16 v38 = 1024;
    unsigned int v39 = a3;
    __int16 v40 = 1024;
    unsigned int v41 = v19;
    __int16 v42 = 1024;
    unsigned int v43 = v20;
    __int16 v44 = 2048;
    double v45 = v21;
    __int16 v46 = 2048;
    double v47 = v22;
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike at send timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
    goto LABEL_25;
  }
LABEL_26:
  double v23 = self->_averageSendInterval;
  if (self->_useUINT16) {
    unsigned int v24 = (unsigned __int16)v6;
  }
  else {
    unsigned int v24 = v6;
  }
  if (v23 == 0.0) {
    double v25 = (double)v24;
  }
  else {
    double v25 = (double)v24 * 0.1 + v23 * 0.9;
  }
  self->_double averageSendInterval = v25;
  return result;
}

- (BOOL)detectOutOfOrderAndSpikeWithReceiveTimestamp:(unsigned int)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unsigned int previousReceiveTimestamp = self->_previousReceiveTimestamp;
  if (!previousReceiveTimestamp)
  {
    BOOL result = 0;
    self->_unsigned int previousReceiveTimestamp = a3;
    return result;
  }
  unsigned int v6 = a3 - previousReceiveTimestamp;
  double averageReceiveInterval = self->_averageReceiveInterval;
  if (averageReceiveInterval <= 0.0) {
    goto LABEL_25;
  }
  unsigned int v8 = (averageReceiveInterval * 10.0);
  if (self->_useUINT16)
  {
    unsigned int v9 = (unsigned __int16)(a3 - previousReceiveTimestamp);
    if (v9 <= 0x7FFE)
    {
      if (v9 <= (unsigned __int16)v8)
      {
        if (!self->_receiveTimestampSpikeDetected
          || v9 >= (unsigned __int16)(averageReceiveInterval * 1.2))
        {
LABEL_43:
          BOOL result = 0;
          self->_unsigned int previousReceiveTimestamp = a3;
          self->_receiveTimestampSpikeDetected = 0;
          goto LABEL_26;
        }
LABEL_36:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          double v27 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v28 = self->_previousReceiveTimestamp;
            if (self->_useUINT16) {
              unsigned int v29 = (unsigned __int16)v6;
            }
            else {
              unsigned int v29 = v6;
            }
            double v30 = self->_averageReceiveInterval;
            double owrd = self->_owrd;
            int v32 = 136316930;
            uint64_t v33 = v26;
            __int16 v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
            __int16 v36 = 1024;
            int v37 = 283;
            __int16 v38 = 1024;
            unsigned int v39 = a3;
            __int16 v40 = 1024;
            unsigned int v41 = v28;
            __int16 v42 = 1024;
            unsigned int v43 = v29;
            __int16 v44 = 2048;
            double v45 = v30;
            __int16 v46 = 2048;
            double v47 = owrd;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike before receive timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
          }
        }
        [(VCRateControlOWRDEstimator *)self resetOWRDEstimation];
        goto LABEL_43;
      }
      goto LABEL_19;
    }
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      double v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = self->_previousReceiveTimestamp;
        if (self->_useUINT16) {
          unsigned int v14 = (unsigned __int16)v6;
        }
        else {
          unsigned int v14 = v6;
        }
        double v15 = self->_owrd;
        int v32 = 136316674;
        uint64_t v33 = v11;
        __int16 v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
        __int16 v36 = 1024;
        int v37 = 275;
        __int16 v38 = 1024;
        unsigned int v39 = a3;
        __int16 v40 = 1024;
        unsigned int v41 = v13;
        __int16 v42 = 1024;
        unsigned int v43 = v14;
        __int16 v44 = 2048;
        double v45 = v15;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected out of order at receive timestamp %X, previousTS:%X, timestampDiff:%d, current owrd:%f", (uint8_t *)&v32, 0x38u);
      }
    }
    BOOL result = 1;
    goto LABEL_26;
  }
  if (v6 >= 0x7FFFFFFF) {
    goto LABEL_11;
  }
  if (v6 <= v8)
  {
    if (!self->_receiveTimestampSpikeDetected || v6 >= (averageReceiveInterval * 1.2)) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
LABEL_19:
  self->_receiveTimestampSpikeDetected = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
  {
LABEL_25:
    BOOL result = 0;
    goto LABEL_26;
  }
  uint64_t v16 = VRTraceErrorLogLevelToCSTR();
  __int16 v17 = *MEMORY[0x1E4F47A50];
  BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v18)
  {
    unsigned int v19 = self->_previousReceiveTimestamp;
    if (self->_useUINT16) {
      unsigned int v20 = (unsigned __int16)v6;
    }
    else {
      unsigned int v20 = v6;
    }
    double v21 = self->_averageReceiveInterval;
    double v22 = self->_owrd;
    int v32 = 136316930;
    uint64_t v33 = v16;
    __int16 v34 = 2080;
    v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
    __int16 v36 = 1024;
    int v37 = 279;
    __int16 v38 = 1024;
    unsigned int v39 = a3;
    __int16 v40 = 1024;
    unsigned int v41 = v19;
    __int16 v42 = 1024;
    unsigned int v43 = v20;
    __int16 v44 = 2048;
    double v45 = v21;
    __int16 v46 = 2048;
    double v47 = v22;
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike at receive timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
    goto LABEL_25;
  }
LABEL_26:
  double v23 = self->_averageReceiveInterval;
  if (self->_useUINT16) {
    unsigned int v24 = (unsigned __int16)v6;
  }
  else {
    unsigned int v24 = v6;
  }
  if (v23 == 0.0) {
    double v25 = (double)v24;
  }
  else {
    double v25 = (double)v24 * 0.1 + v23 * 0.9;
  }
  self->_double averageReceiveInterval = v25;
  return result;
}

- (void)resetOWRDEstimation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double owrd = self->_owrd;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      unsigned int v9 = "-[VCRateControlOWRDEstimator resetOWRDEstimation]";
      __int16 v10 = 1024;
      int v11 = 300;
      __int16 v12 = 2048;
      double v13 = owrd;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Reset OWRD from %f to 0", (uint8_t *)&v6, 0x26u);
    }
  }
  *(void *)&self->_unsigned int firstSendTimestamp = 0;
  self->_unsigned int previousSendTimestampDiff = 0;
  self->_double firstSendTime = 0.0;
  *(void *)&self->_unsigned int firstReceiveTimestamp = 0;
  self->_unsigned int previousReceiveTimestampDiff = 0;
  self->_double shortAverageLag = 0.0;
  self->_double longAverageLag = 0.0;
  self->_double firstReceiveTime = 0.0;
  self->_double averageSendInterval = 0.0;
  self->_double averageReceiveInterval = 0.0;
}

- (double)owrd
{
  return self->_owrd;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)relativeSendTimeWithTimestamp:timestampRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
}

- (void)relativeSendTimeWithTimestamp:timestampRate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
}

- (void)relativeReceiveTimeWithTimestamp:timestampRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
}

- (void)relativeReceiveTimeWithTimestamp:timestampRate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
}

@end