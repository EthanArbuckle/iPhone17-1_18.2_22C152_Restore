@interface VCCannedAudioInjectorConfig
- (AudioStreamBasicDescription)audioFormat;
- (BOOL)forceVoiceActive;
- (BOOL)fromBeginning;
- (BOOL)isValid;
- (NSString)fileName;
- (NSString)path;
- (VCCannedAudioInjectorConfig)init;
- (double)loopLength;
- (double)sineWaveAmplitude;
- (double)startHostTime;
- (id)description;
- (id)reportingAgent;
- (unsigned)loopCount;
- (unsigned)sineWaveFrequencyHz;
- (void)dealloc;
- (void)isValid;
- (void)setAudioFormat:(AudioStreamBasicDescription *)a3;
- (void)setFileName:(id)a3;
- (void)setForceVoiceActive:(BOOL)a3;
- (void)setFromBeginning:(BOOL)a3;
- (void)setLoopCount:(unsigned int)a3;
- (void)setLoopLength:(double)a3;
- (void)setPath:(id)a3;
- (void)setReportingAgent:(id)a3;
- (void)setSineWaveAmplitude:(double)a3;
- (void)setSineWaveFrequencyHz:(unsigned int)a3;
- (void)setStartHostTime:(double)a3;
@end

@implementation VCCannedAudioInjectorConfig

- (VCCannedAudioInjectorConfig)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCCannedAudioInjectorConfig;
  result = [(VCCannedAudioInjectorConfig *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_startHostTime = _Q0;
    result->_loopCount = -1;
    result->_sineWaveAmplitude = 0.05;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCannedAudioInjectorConfig;
  [(VCCannedAudioInjectorConfig *)&v3 dealloc];
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)__str = 0u;
  long long v4 = 0u;
  return (id)[NSString stringWithFormat:@"[%p] path=%@ fileName=%@ fromBeginning=%d startHostTime=%f loopLength=%f audioFormat=%s reportingAgent=%@", self, self->_path, self->_fileName, self->_fromBeginning, *(void *)&self->_startHostTime, *(void *)&self->_loopLength, FormatToCStr((uint64_t)&self->_audioFormat, __str, 0x40uLL), self->_reportingAgent];
}

- (BOOL)isValid
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  memset(__s1, 0, sizeof(__s1));
  p_audioFormat = &self->_audioFormat;
  if (!memcmp(__s1, &self->_audioFormat, 0x28uLL))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[VCCannedAudioInjectorConfig isValid]();
    }
    goto LABEL_35;
  }
  double mSampleRate = p_audioFormat->mSampleRate;
  if (p_audioFormat->mSampleRate <= 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[VCCannedAudioInjectorConfig isValid]();
    }
    goto LABEL_35;
  }
  unsigned int sineWaveFrequencyHz = self->_sineWaveFrequencyHz;
  if (!sineWaveFrequencyHz)
  {
    if (self->_loopLength == 0.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[VCCannedAudioInjectorConfig isValid]();
      }
      goto LABEL_35;
    }
    if (!self->_path)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[VCCannedAudioInjectorConfig isValid].cold.4();
      }
      goto LABEL_35;
    }
LABEL_15:
    LOBYTE(v10) = 1;
    return v10;
  }
  p_double sineWaveAmplitude = (uint64_t *)&self->_sineWaveAmplitude;
  double sineWaveAmplitude = self->_sineWaveAmplitude;
  if (sineWaveAmplitude < 0.0 || sineWaveAmplitude > 1.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      [(VCCannedAudioInjectorConfig *)v11 isValid];
    }
    goto LABEL_35;
  }
  unsigned int v9 = (mSampleRate * 0.5);
  if (sineWaveFrequencyHz > v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      unsigned int v17 = v9;
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      unsigned int v15 = self->_sineWaveFrequencyHz;
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      v23 = "-[VCCannedAudioInjectorConfig isValid]";
      __int16 v24 = 1024;
      int v25 = 74;
      __int16 v26 = 1024;
      unsigned int v27 = v15;
      __int16 v28 = 1024;
      unsigned int v29 = v17;
      _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid sine wave frequency: 0 <= %u <= %u", buf, 0x28u);
    }
    goto LABEL_35;
  }
  if (!self->_path) {
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    -[VCCannedAudioInjectorConfig isValid].cold.6();
  }
LABEL_35:
  LOBYTE(v10) = 0;
  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (BOOL)fromBeginning
{
  return self->_fromBeginning;
}

- (void)setFromBeginning:(BOOL)a3
{
  self->_fromBeginning = a3;
}

- (double)startHostTime
{
  return self->_startHostTime;
}

- (void)setStartHostTime:(double)a3
{
  self->_startHostTime = a3;
}

- (double)loopLength
{
  return self->_loopLength;
}

- (void)setLoopLength:(double)a3
{
  self->_loopLength = a3;
}

- (AudioStreamBasicDescription)audioFormat
{
  long long v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->double mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (void)setAudioFormat:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_audioFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_audioFormat.double mSampleRate = v3;
  *(_OWORD *)&self->_audioFormat.mBytesPerPacket = v4;
}

- (unsigned)sineWaveFrequencyHz
{
  return self->_sineWaveFrequencyHz;
}

- (void)setSineWaveFrequencyHz:(unsigned int)a3
{
  self->_unsigned int sineWaveFrequencyHz = a3;
}

- (double)sineWaveAmplitude
{
  return self->_sineWaveAmplitude;
}

- (void)setSineWaveAmplitude:(double)a3
{
  self->_double sineWaveAmplitude = a3;
}

- (BOOL)forceVoiceActive
{
  return self->_forceVoiceActive;
}

- (void)setForceVoiceActive:(BOOL)a3
{
  self->_forceVoiceActive = a3;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(id)a3
{
}

- (unsigned)loopCount
{
  return self->_loopCount;
}

- (void)setLoopCount:(unsigned int)a3
{
  self->_loopCount = a3;
}

- (void)isValid
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected path provided", v2, v3, v4, v5, v6);
}

@end