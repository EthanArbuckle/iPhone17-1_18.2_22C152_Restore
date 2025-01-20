@interface VCCellularAudioTapIO
- (BOOL)enableAsyncTapStart;
- (VCAudioIO)audioIO;
- (VCAudioPowerSpectrumSource)powerSpectrumSource;
- (VCCellularAudioTapIO)initWithStreamToken:(int64_t)a3 powerSpectrumSource:(id)a4 tapType:(unsigned int)a5;
- (VCMediaRecorder)mediaRecorder;
- (int64_t)streamToken;
- (tagVCCellularAudioTapIORealtimeContext)realtimeContext;
- (unint64_t)audioAssertionCounter;
- (void)dealloc;
- (void)setAudioAssertionCounter:(unint64_t)a3;
- (void)setAudioIO:(id)a3;
- (void)setEnableAsyncTapStart:(BOOL)a3;
- (void)setMediaRecorder:(id)a3;
@end

@implementation VCCellularAudioTapIO

- (VCCellularAudioTapIO)initWithStreamToken:(int64_t)a3 powerSpectrumSource:(id)a4 tapType:(unsigned int)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VCCellularAudioTapIO;
  v8 = [(VCCellularAudioTapIO *)&v20 init];
  if (v8)
  {
    if (a3)
    {
      v9 = (VCAudioPowerSpectrumSource *)a4;
      v8->_powerSpectrumSource = v9;
      if (v9)
      {
        uint64_t v10 = [(VCAudioPowerSpectrumSource *)v9 realtimeContext];
        v8->_realtimeContext.streamToken = a3;
        v8->_realtimeContext.tapType = a5;
        v8->_realtimeContext.powerSpectrumSourceRealtimeContext = (_VCAudioPowerSpectrumSourceRealtimeContext *)v10;
        v8->_realtimeContext.mediaRecorder = 0;
        v8->_realtimeContext.averageAudioPower = 0.0;
        return v8;
      }
      if ((VCCellularAudioTapIO *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:](v15);
          }
        }
        goto LABEL_25;
      }
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[(VCCellularAudioTapIO *)v8 performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v19 = VRTraceErrorLogLevelToCSTR(),
            v17 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_25:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v19;
      __int16 v23 = 2080;
      v24 = "-[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:]";
      __int16 v25 = 1024;
      int v26 = 34;
      __int16 v27 = 2112;
      v28 = v13;
      __int16 v29 = 2048;
      v30 = v8;
      v18 = " [%s] %s:%d %@(%p) The power spectrum is nil";
    }
    else
    {
      if ((VCCellularAudioTapIO *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:](v14);
          }
        }
        goto LABEL_25;
      }
      if (objc_opt_respondsToSelector()) {
        v12 = (__CFString *)[(VCCellularAudioTapIO *)v8 performSelector:sel_logPrefix];
      }
      else {
        v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_25;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v16;
      __int16 v23 = 2080;
      v24 = "-[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:]";
      __int16 v25 = 1024;
      int v26 = 31;
      __int16 v27 = 2112;
      v28 = v12;
      __int16 v29 = 2048;
      v30 = v8;
      v18 = " [%s] %s:%d %@(%p) Invalid stream token";
    }
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_25;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCellularAudioTapIO;
  [(VCCellularAudioTapIO *)&v3 dealloc];
}

- (tagVCCellularAudioTapIORealtimeContext)realtimeContext
{
  return &self->_realtimeContext;
}

- (int64_t)streamToken
{
  return self->_realtimeContext.streamToken;
}

- (void)setMediaRecorder:(id)a3
{
  mediaRecorder = self->_realtimeContext.mediaRecorder;
  if (mediaRecorder != a3)
  {

    self->_realtimeContext.mediaRecorder = (VCMediaRecorder *)a3;
  }
}

- (VCMediaRecorder)mediaRecorder
{
  v2 = self->_realtimeContext.mediaRecorder;

  return v2;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (void)setAudioIO:(id)a3
{
}

- (VCAudioPowerSpectrumSource)powerSpectrumSource
{
  return self->_powerSpectrumSource;
}

- (BOOL)enableAsyncTapStart
{
  return self->_enableAsyncTapStart;
}

- (void)setEnableAsyncTapStart:(BOOL)a3
{
  self->_enableAsyncTapStart = a3;
}

- (unint64_t)audioAssertionCounter
{
  return self->_audioAssertionCounter;
}

- (void)setAudioAssertionCounter:(unint64_t)a3
{
  self->_audioAssertionCounter = a3;
}

- (void)initWithStreamToken:(uint64_t)a1 powerSpectrumSource:tapType:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 31;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid stream token", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithStreamToken:(uint64_t)a1 powerSpectrumSource:tapType:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 34;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d The power spectrum is nil", (uint8_t *)&v2, 0x1Cu);
}

@end