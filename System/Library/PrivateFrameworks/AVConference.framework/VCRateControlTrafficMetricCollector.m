@interface VCRateControlTrafficMetricCollector
- (VCRateControlTrafficMetricCollector)initWithMediaController:(void *)a3 statisticsCollector:(id)a4;
- (void)calculateTrafficMetrics;
- (void)dealloc;
- (void)startVCRateControlTrafficMetricCollector;
- (void)stopVCRateControlTrafficMetricCollector;
@end

@implementation VCRateControlTrafficMetricCollector

- (VCRateControlTrafficMetricCollector)initWithMediaController:(void *)a3 statisticsCollector:(id)a4
{
  v4 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]();
        }
      }
      goto LABEL_34;
    }
    if (objc_opt_respondsToSelector()) {
      v17 = (__CFString *)[(VCRateControlTrafficMetricCollector *)v4 performSelector:sel_logPrefix];
    }
    else {
      v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_34;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = v19;
    __int16 v27 = 2080;
    v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
    __int16 v29 = 1024;
    int v30 = 23;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2048;
    v34 = v4;
    v21 = " [%s] %s:%d %@(%p) Passed MediaController is nil";
    goto LABEL_37;
  }
  if (!a4)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]();
        }
      }
      goto LABEL_34;
    }
    if (objc_opt_respondsToSelector()) {
      v18 = (__CFString *)[(VCRateControlTrafficMetricCollector *)v4 performSelector:sel_logPrefix];
    }
    else {
      v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v22 = VRTraceErrorLogLevelToCSTR(),
          v20 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_34:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = v22;
    __int16 v27 = 2080;
    v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
    __int16 v29 = 1024;
    int v30 = 24;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2048;
    v34 = v4;
    v21 = " [%s] %s:%d %@(%p) Passed statisticsCollector is nil";
LABEL_37:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x30u);
    goto LABEL_34;
  }
  v24.receiver = self;
  v24.super_class = (Class)VCRateControlTrafficMetricCollector;
  v4 = [(VCRateControlTrafficMetricCollector *)&v24 init];
  if (!v4) {
    goto LABEL_34;
  }
  v4->_mediaController = a3;
  v4->_statisticsCollector = (AVCStatisticsCollector *)a4;
  v4->_isStopped = 1;
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        mediaController = (VCRateControlTrafficMetricCollector *)v4->_mediaController;
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v8;
        __int16 v27 = 2080;
        v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
        __int16 v29 = 1024;
        int v30 = 30;
        __int16 v31 = 2048;
        v32 = v4;
        __int16 v33 = 2048;
        v34 = mediaController;
        v11 = " [%s] %s:%d Traffic Metric Collector=%p created with mediaController=%p";
        v12 = v9;
        uint32_t v13 = 48;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(VCRateControlTrafficMetricCollector *)v4 performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v4->_mediaController;
        *(_DWORD *)buf = 136316674;
        uint64_t v26 = v14;
        __int16 v27 = 2080;
        v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
        __int16 v29 = 1024;
        int v30 = 30;
        __int16 v31 = 2112;
        v32 = v7;
        __int16 v33 = 2048;
        v34 = v4;
        __int16 v35 = 2048;
        v36 = v4;
        __int16 v37 = 2048;
        v38 = v16;
        v11 = " [%s] %s:%d %@(%p) Traffic Metric Collector=%p created with mediaController=%p";
        v12 = v15;
        uint32_t v13 = 68;
        goto LABEL_14;
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        v15 = "-[VCRateControlTrafficMetricCollector dealloc]";
        __int16 v16 = 1024;
        int v17 = 41;
        v6 = " [%s] %s:%d VCRateControlTrafficMetricCollector dealloc";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCRateControlTrafficMetricCollector *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        v15 = "-[VCRateControlTrafficMetricCollector dealloc]";
        __int16 v16 = 1024;
        int v17 = 41;
        __int16 v18 = 2112;
        uint64_t v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector dealloc";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCRateControlTrafficMetricCollector;
  [(VCRateControlTrafficMetricCollector *)&v11 dealloc];
}

- (void)stopVCRateControlTrafficMetricCollector
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isStopped)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[(VCRateControlTrafficMetricCollector *)self performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        objc_super v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136316162;
          uint64_t v17 = v10;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
          __int16 v20 = 1024;
          int v21 = 49;
          __int16 v22 = 2112;
          v23 = v3;
          __int16 v24 = 2048;
          v25 = self;
          uint64_t v9 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector already stopped";
LABEL_26:
          uint64_t v13 = v11;
          uint32_t v14 = 48;
          goto LABEL_27;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint32_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v16 = 136315650;
    uint64_t v17 = v7;
    __int16 v18 = 2080;
    uint64_t v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
    __int16 v20 = 1024;
    int v21 = 49;
    uint64_t v9 = " [%s] %s:%d VCRateControlTrafficMetricCollector already stopped";
LABEL_21:
    uint64_t v13 = v8;
    uint32_t v14 = 28;
LABEL_27:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v14);
    return;
  }
  trafficMetricSource = self->_trafficMetricSource;
  if (trafficMetricSource)
  {
    dispatch_source_cancel(trafficMetricSource);
    v5 = self->_trafficMetricSource;
    if (v5)
    {
      dispatch_release(v5);
      self->_trafficMetricSource = 0;
    }
  }
  self->_trafficMetrics.bytesInFlights = 0;
  self->_trafficMetrics.senderTxBitrate = 0;
  self->_trafficMetrics.receiverTxBitrate = 0;
  self->_isStopped = 1;
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint32_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v16 = 136315650;
    uint64_t v17 = v12;
    __int16 v18 = 2080;
    uint64_t v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
    __int16 v20 = 1024;
    int v21 = 58;
    uint64_t v9 = " [%s] %s:%d VCRateControlTrafficMetricCollector stopped";
    goto LABEL_21;
  }
  if (objc_opt_respondsToSelector()) {
    v6 = (__CFString *)[(VCRateControlTrafficMetricCollector *)self performSelector:sel_logPrefix];
  }
  else {
    v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    objc_super v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136316162;
      uint64_t v17 = v15;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
      __int16 v20 = 1024;
      int v21 = 58;
      __int16 v22 = 2112;
      v23 = v6;
      __int16 v24 = 2048;
      v25 = self;
      uint64_t v9 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector stopped";
      goto LABEL_26;
    }
  }
}

- (void)startVCRateControlTrafficMetricCollector
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _trafficMetricSource dispatch source creation failed", v2, v3, v4, v5, v6);
}

uint64_t __79__VCRateControlTrafficMetricCollector_startVCRateControlTrafficMetricCollector__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) calculateTrafficMetrics];
}

- (void)calculateTrafficMetrics
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d mediaController is nill", v2, v3, v4, v5, v6);
}

- (void)initWithMediaController:statisticsCollector:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Passed MediaController is nil", v2, v3, v4, v5, v6);
}

- (void)initWithMediaController:statisticsCollector:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Passed statisticsCollector is nil", v2, v3, v4, v5, v6);
}

@end