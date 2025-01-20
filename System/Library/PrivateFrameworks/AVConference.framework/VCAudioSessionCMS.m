@interface VCAudioSessionCMS
- (BOOL)applyAudioSessionMediaProperties:(id)a3;
- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4;
- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4;
- (BOOL)hasStarted;
- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3;
- (BOOL)isInputSupported;
- (BOOL)microphoneMuted;
- (BOOL)readSessionProperty:(__CFString *)a3 floatValue:(float *)a4;
- (BOOL)setSampleRate:(double)a3;
- (BOOL)setVPBlockConfigurationProperties:(id)a3;
- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4;
- (BOOL)startInternal;
- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4;
- (BOOL)stopSession;
- (double)externalInputAudioLatency;
- (double)externalOutputAudioLatency;
- (opaqueCMSession)cmSession;
- (void)applyAudioSessionMediaPropertiesForSystemAudio;
- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3;
- (void)applyClientPid;
- (void)didAudioRouteChangeWithUserInfo:(__CFDictionary *)a3;
- (void)didBeginQuietTime;
- (void)didEndQuietTime;
- (void)handleAudioInterruption:(opaqueCMSession *)a3 interruptionInfo:(__CFDictionary *)a4;
- (void)handleSecureMicNotificationWithInterruptionInfo:(__CFDictionary *)a3;
- (void)refreshAudioOuputLatencyWithReason:(id)a3;
- (void)resetOverrideRoute;
- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5;
- (void)setClientName;
- (void)setExternalInputAudioLatency:(double)a3;
- (void)setExternalOutputAudioLatency:(double)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4;
- (void)setSpeakerProperty:(id)a3;
- (void)setupInputBeamforming;
- (void)stopSession;
@end

@implementation VCAudioSessionCMS

- (void)resetOverrideRoute
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_cmSession)
  {
    VCCMSessionStub_CMSessionSetProperty();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      v7 = "-[VCAudioSessionCMS resetOverrideRoute]";
      __int16 v8 = 1024;
      int v9 = 51;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error no CMSession", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (BOOL)hasStarted
{
  return self->_cmSession != 0;
}

- (BOOL)isInputSupported
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      cmSession = self->_cmSession;
      int v7 = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioSessionCMS isInputSupported]";
      __int16 v11 = 1024;
      int v12 = 60;
      __int16 v13 = 2112;
      v14 = cmSession;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d This flow is not supported with cmSession=%@, returning NO", (uint8_t *)&v7, 0x26u);
    }
  }
  return 0;
}

- (void)setSpeakerProperty:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
    {
      uint64_t v7 = *MEMORY[0x1E4F76008];
    }
    else
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      uint64_t v7 = *MEMORY[0x1E4F76008];
      if (v6)
      {
        uint64_t v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F76008]];
        int v9 = 136316162;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        int v12 = "-[VCAudioSessionCMS setSpeakerProperty:]";
        __int16 v13 = 1024;
        int v14 = 66;
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio session setting property kCMSessionProperty_CreateSpeakerDevice=%@ to value=%@", (uint8_t *)&v9, 0x30u);
      }
    }
    [a3 objectForKeyedSubscript:v7];
    VCCMSessionStub_CMSessionSetProperty();
  }
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCAudioSessionCMS applyRequestedProperty:defaultValue:]();
    }
LABEL_16:
    LOBYTE(v12) = 0;
    return v12;
  }
  id v7 = [(NSDictionary *)[(VCAudioSession *)self audioSessionProperties] objectForKeyedSubscript:a3];
  if (v7) {
    a4 = v7;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCAudioSessionCMS applyRequestedProperty:defaultValue:]();
    }
    goto LABEL_16;
  }
  int v8 = VCCMSessionStub_CMSessionSetProperty();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCAudioSessionCMS applyRequestedProperty:defaultValue:]";
        __int16 v20 = 1024;
        int v21 = 93;
        __int16 v22 = 2112;
        id v23 = a3;
        __int16 v24 = 2112;
        v25 = a4;
        __int16 v26 = 1024;
        int v27 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting propertyKey=%@ failed, value=%@ status=%d", (uint8_t *)&v16, 0x36u);
      }
    }
    [(NSMutableDictionary *)self->super._currentAudioSessionProperties setObject:0 forKeyedSubscript:a3];
    goto LABEL_16;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136316162;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCAudioSessionCMS applyRequestedProperty:defaultValue:]";
      __int16 v20 = 1024;
      int v21 = 90;
      __int16 v22 = 2112;
      id v23 = a3;
      __int16 v24 = 2112;
      v25 = a4;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Property propertyKey=%@ successfully set value=%@", (uint8_t *)&v16, 0x30u);
    }
  }
  [(NSMutableDictionary *)self->super._currentAudioSessionProperties setObject:a4 forKeyedSubscript:a3];
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v7;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCAudioSessionCMS applyRequestedProperties:propertyOrder:]";
      __int16 v25 = 1024;
      int v26 = 102;
      __int16 v27 = 2112;
      id v28 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting requested properties=%@", buf, 0x26u);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [a4 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v18;
  BOOL v12 = 1;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(a4);
      }
      BOOL v12 = v12
         && -[VCAudioSessionCMS applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", *(void *)(*((void *)&v17 + 1) + 8 * i), [a3 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)]);
    }
    uint64_t v10 = [a4 countByEnumeratingWithState:&v17 objects:v16 count:16];
  }
  while (v10);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCAudioSessionCMS applyRequestedProperties:propertyOrder:]();
    }
    LOBYTE(v14) = 0;
  }
  else
  {
LABEL_15:
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (void)setClientName
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting kCMSessionProperty_ClientName to GameKitServices failed, result=%d", v2, v3, v4, v5);
}

- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCAudioSessionCMS *)self setClientName];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioSessionCMS;
  [(VCAudioSession *)&v5 applyAudioSessionPropertiesWithVPOperatingMode:v3];
}

- (void)applyAudioSessionMediaPropertiesForSystemAudio
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSessionProperty_AudioCategory failed: status=%d", v2, v3, v4, v5);
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->super._playbackMode)
  {
    BOOL v7 = a3 == 2 || a3 == 4;
    *a4 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = *a4;
        int v19 = 136315906;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
        __int16 v23 = 1024;
        int v24 = 161;
        __int16 v25 = 1024;
        BOOL v26 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCMSessionProperty_IsSharePlayCapableCallSession=%d", (uint8_t *)&v19, 0x22u);
      }
    }
    int v11 = VCCMSessionStub_CMSessionSetProperty();
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        BOOL v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          BOOL v15 = *a4;
          int v19 = 136316162;
          uint64_t v20 = v13;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
          __int16 v23 = 1024;
          int v24 = 164;
          __int16 v25 = 1024;
          BOOL v26 = v15;
          __int16 v27 = 1024;
          int v28 = v11;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting kCMSessionProperty_IsSharePlayCapableCallSession=%d failed, result=%d", (uint8_t *)&v19, 0x28u);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      long long v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = *a4;
        int v19 = 136315906;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
        __int16 v23 = 1024;
        int v24 = 166;
        __int16 v25 = 1024;
        BOOL v26 = v18;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set kCMSessionProperty_IsSharePlayCapableCallSession=%d returned with no failure", (uint8_t *)&v19, 0x22u);
      }
    }
  }
  return 0;
}

- (BOOL)setSampleRate:(double)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->super._isTetheredDisplayMode) {
    a3 = 48000.0;
  }
  double v6 = a3;
  uint64_t valuePtr = 0;
  VCCMSessionStub_CMSessionCopyProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioSessionCMS setSampleRate:]();
    }
  }
  return 0;
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double valuePtr = a4;
  int v16 = 0;
  if (self->super._isTetheredDisplayMode)
  {
    double valuePtr = 48000.0;
    a4 = 48000.0;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a5) {
    goto LABEL_9;
  }
  CFNumberRef number = 0;
  int v9 = VCCMSessionStub_CMSessionCopyProperty();
  int v16 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCAudioSessionCMS setBlockSize:sampleRate:force:]";
      __int16 v22 = 1024;
      int v23 = 228;
      __int16 v24 = 1024;
      int v25 = v9;
      __int16 v26 = 1040;
      int v27 = 4;
      v28[0] = 2080;
      *(void *)&v28[1] = &v16;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_CurrentAudioHardwareSampleRate failed result=%d, result=%.4s", buf, 0x32u);
      int v9 = v16;
    }
  }
  if (!v9)
  {
    a4 = valuePtr;
    if (self->super._hardwareSampleRate != valuePtr)
    {
LABEL_9:
      LODWORD(number) = llround(a4 * a3);
      [(VCAudioSession *)self forceBufferFrames:&number];
      CFNumberRef v12 = CFNumberCreate(v8, kCFNumberSInt32Type, &number);
      int v16 = VCCMSessionStub_CMSessionSetProperty();
      CFRelease(v12);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        BOOL v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v19 = v13;
          __int16 v20 = 2080;
          __int16 v21 = "-[VCAudioSessionCMS setBlockSize:sampleRate:force:]";
          __int16 v22 = 1024;
          int v23 = 241;
          __int16 v24 = 1024;
          int v25 = (int)number;
          __int16 v26 = 1024;
          int v27 = v16;
          v28[0] = 1024;
          *(_DWORD *)&v28[1] = v5;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_PreferredAudioHardwareIOBufferFrames: blockSize=%d, result=%d, force=%d", buf, 0x2Eu);
        }
      }
      self->super._hardwareSampleRate = valuePtr;
    }
  }
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = VCCMSessionStub_CMSessionSetProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      CFNumberRef v12 = "-[VCAudioSessionCMS setVPBlockConfigurationProperties:]";
      __int16 v13 = 1024;
      int v14 = 248;
      __int16 v15 = 2080;
      int v16 = v7;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration vpBlockDict=%s, result=%d", (uint8_t *)&v9, 0x2Cu);
    }
  }
  return v4 == 0;
}

- (void)applyClientPid
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int valuePtr = [(VCAudioSessionMediaProperties *)[(VCAudioSessionClient *)self->super._activeClient mediaProperties] processId];
  CFNumberRef v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  int v3 = VCCMSessionStub_CMSessionSetProperty();
  CFRelease(v2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioSessionCMS applyClientPid]";
      __int16 v11 = 1024;
      int v12 = 258;
      __int16 v13 = 1024;
      int v14 = valuePtr;
      __int16 v15 = 1024;
      int v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_ClientPID processId=%d, result=%d", buf, 0x28u);
    }
  }
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioSessionCMS applyAudioSessionMediaProperties:]";
      __int16 v13 = 1024;
      int v14 = 262;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  [(VCAudioSessionCMS *)self applyClientPid];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioSessionCMS;
  return [(VCAudioSession *)&v8 applyAudioSessionMediaProperties:a3];
}

- (BOOL)startInternal
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v3 = VCCMSessionStub_CMSessionBeginInterruption();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      int v16 = "-[VCAudioSessionCMS startInternal]";
      __int16 v17 = 1024;
      int v18 = 272;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCMSessionStub_CMSessionBeginInterruption result=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  int v8 = VCCMSessionStub_CMSessionSetProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      int v16 = "-[VCAudioSessionCMS startInternal]";
      __int16 v17 = 1024;
      int v18 = 276;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_IsPlaying YES result=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  if (v3) {
    BOOL isInterrupted = self->super._isInterrupted;
  }
  else {
    BOOL isInterrupted = 0;
  }
  BOOL result = v3 == 0;
  self->super._BOOL isInterrupted = isInterrupted;
  return result;
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_cmSession = &self->_cmSession;
  if (self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:]();
      }
    }
    return 0;
  }
  else
  {
    self->super._uint64_t sessionPid = [a3 processId];
    int CMSession = VCCMSessionStub_AudioSessionCreateCMSession();
    BOOL v5 = CMSession == 0;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (CMSession)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        int v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t sessionPid = self->super._sessionPid;
          int v20 = 136316162;
          uint64_t v21 = v17;
          __int16 v22 = 2080;
          int v23 = "-[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:]";
          __int16 v24 = 1024;
          int v25 = 290;
          __int16 v26 = 1024;
          int v27 = CMSession;
          __int16 v28 = 2048;
          uint64_t v29 = sessionPid;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CMSessionCreate failed err=%d, _sessionPid=%ld", (uint8_t *)&v20, 0x2Cu);
        }
      }
      if ([(NSMutableArray *)self->super._clients count] && *p_cmSession)
      {
        CFRelease(*p_cmSession);
        *p_cmSession = 0;
        VCCMSessionStub_AudioSessionDestroyCMSession();
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 6)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = self->super._sessionPid;
          unsigned int audioSessionId = self->super._audioSessionId;
          int v20 = 136316162;
          uint64_t v21 = v12;
          __int16 v22 = 2080;
          int v23 = "-[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:]";
          __int16 v24 = 1024;
          int v25 = 292;
          __int16 v26 = 1024;
          int v27 = v14;
          __int16 v28 = 1024;
          LODWORD(v29) = audioSessionId;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created session for _sessionPid=%d, _audioSessionId=%u", (uint8_t *)&v20, 0x28u);
        }
      }
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_InterruptionListenerCallback, (CFStringRef)*MEMORY[0x1E4F75DB0], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
      self->super._operatingMode = [a3 operatingMode];
      if (self->super._playbackMode) {
        [(VCAudioSessionCMS *)self applyAudioSessionMediaPropertiesForSystemAudio];
      }
      else {
        -[VCAudioSessionCMS applyAudioSessionPropertiesWithVPOperatingMode:](self, "applyAudioSessionPropertiesWithVPOperatingMode:", [a3 vpOperatingMode]);
      }
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_AvailableSampleRateChangeListenerCallback, (CFStringRef)*MEMORY[0x1E4F75D68], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
      [(VCAudioSessionCMS *)self refreshAudioOuputLatencyWithReason:0];
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_ActiveAudioRouteDidChange, (CFStringRef)*MEMORY[0x1E4F75D20], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (a4 && *p_cmSession) {
      *a4 = CFHash(*p_cmSession);
    }
  }
  return v5;
}

- (BOOL)stopSession
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_cmSession)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4F75D20], self->_cmSession);
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4F75D68], self->_cmSession);
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4F75DB0], self->_cmSession);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    BOOL v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS stopSession]";
        __int16 v19 = 1024;
        int v20 = 341;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCMSessionProperty_IsPlaying to false", (uint8_t *)&v15, 0x1Cu);
      }
    }
    VCCMSessionStub_CMSessionSetProperty();
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS stopSession]";
        __int16 v19 = 1024;
        int v20 = 344;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ending CMSessionInteruption", (uint8_t *)&v15, 0x1Cu);
      }
    }
    VCCMSessionStub_CMSessionEndInterruption();
    VCCMSessionStub_CMSessionNotificationBarrier();
    CFRelease(self->_cmSession);
    self->_cmSession = 0;
    VCCMSessionStub_AudioSessionDestroyCMSession();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int sessionPid = self->super._sessionPid;
        unsigned int audioSessionId = self->super._audioSessionId;
        int v15 = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS stopSession]";
        __int16 v19 = 1024;
        int v20 = 350;
        __int16 v21 = 1024;
        int v22 = sessionPid;
        __int16 v23 = 1024;
        unsigned int v24 = audioSessionId;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Releasing session for _sessionPid=%d, _audioSessionId=%u", (uint8_t *)&v15, 0x28u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioSessionCMS stopSession]();
    }
  }
  return 0;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = [v4 stringWithFormat:@"Setting microphone muted is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks", class_getName(v5)];
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS setMicrophoneMuted:]";
        __int16 v19 = 1024;
        int v20 = 358;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        uint64_t v9 = " [%s] %s:%d %@";
        uint64_t v10 = v8;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCAudioSessionCMS *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS setMicrophoneMuted:]";
        __int16 v19 = 1024;
        int v20 = 358;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v12;
        __int16 v23 = 2048;
        unsigned int v24 = self;
        __int16 v25 = 2112;
        uint64_t v26 = v6;
        uint64_t v9 = " [%s] %s:%d %@(%p) %@";
        uint64_t v10 = v14;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"_VCAudioSessionCMS_UnsupportedOperationException" reason:v6 userInfo:0]);
}

- (BOOL)microphoneMuted
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = [v3 stringWithFormat:@"Fetching microphone muted is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks", class_getName(v4)];
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS microphoneMuted]";
        __int16 v19 = 1024;
        int v20 = 364;
        __int16 v21 = 2112;
        uint64_t v22 = v5;
        uint64_t v8 = " [%s] %s:%d %@";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v11 = (__CFString *)[(VCAudioSessionCMS *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioSessionCMS microphoneMuted]";
        __int16 v19 = 1024;
        int v20 = 364;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v11;
        __int16 v23 = 2048;
        unsigned int v24 = self;
        __int16 v25 = 2112;
        uint64_t v26 = v5;
        uint64_t v8 = " [%s] %s:%d %@(%p) %@";
        uint64_t v9 = v13;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"_VCAudioSessionCMS_UnsupportedOperationException" reason:v5 userInfo:0]);
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [v5 stringWithFormat:@"Listening for microphone mute state changed events is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks", class_getName(v6)];
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCAudioSessionCMS setMuteStateChangedHandler:delegateQueue:]";
        __int16 v20 = 1024;
        int v21 = 371;
        __int16 v22 = 2112;
        uint64_t v23 = v7;
        uint32_t v10 = " [%s] %s:%d %@";
        uint32_t v11 = v9;
        uint32_t v12 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCAudioSessionCMS *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v14;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCAudioSessionCMS setMuteStateChangedHandler:delegateQueue:]";
        __int16 v20 = 1024;
        int v21 = 371;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v13;
        __int16 v24 = 2048;
        __int16 v25 = self;
        __int16 v26 = 2112;
        uint64_t v27 = v7;
        uint32_t v10 = " [%s] %s:%d %@(%p) %@";
        uint32_t v11 = v15;
        uint32_t v12 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"_VCAudioSessionCMS_UnsupportedOperationException" reason:v7 userInfo:0]);
}

- (void)didBeginQuietTime
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[VCAudioSessionCMS didBeginQuietTime]";
      __int16 v8 = 1024;
      int v9 = 379;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore interruption", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)didEndQuietTime
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    int v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[VCAudioSessionCMS didEndQuietTime]";
      __int16 v8 = 1024;
      int v9 = 384;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore interruption", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)handleSecureMicNotificationWithInterruptionInfo:(__CFDictionary *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F75C38]);
  if (!Value) {
    return;
  }
  int valuePtr = -1;
  if (!CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = v8;
    __int16 v18 = 2080;
    __int16 v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
    __int16 v20 = 1024;
    int v21 = 394;
    uint64_t v10 = " [%s] %s:%d No interruption reason provided";
    uint32_t v11 = v9;
    uint32_t v12 = 28;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return;
  }
  int v4 = valuePtr;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 != 1)
  {
    if (ErrorLogLevelForModule < 6) {
      return;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v17 = v13;
    __int16 v18 = 2080;
    __int16 v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
    __int16 v20 = 1024;
    int v21 = 403;
    __int16 v22 = 1024;
    int v23 = valuePtr;
    uint64_t v10 = " [%s] %s:%d Interruption reason=%d";
    uint32_t v11 = v14;
    uint32_t v12 = 34;
    goto LABEL_14;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v6;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
      __int16 v20 = 1024;
      int v21 = 399;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secure microphone engaged interruption reason", buf, 0x1Cu);
    }
  }
  [+[VCAudioClientManager sharedInstance] secureMicrophoneEngagedNotification];
}

- (void)handleAudioInterruption:(opaqueCMSession *)a3 interruptionInfo:(__CFDictionary *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E4F75C30]);
  int valuePtr = -1431655766;
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = valuePtr;
      if (a4) {
        uint32_t v11 = (const char *)objc_msgSend((id)-[__CFDictionary description](a4, "description"), "UTF8String");
      }
      else {
        uint32_t v11 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:]";
      __int16 v19 = 1024;
      int v20 = 413;
      __int16 v21 = 1024;
      int v22 = v10;
      __int16 v23 = 2080;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interruptionValue=%d, interruptInfo=%s", buf, 0x2Cu);
    }
  }
  if (self->_cmSession == a3)
  {
    switch(valuePtr)
    {
      case 0:
        [(VCAudioSessionCMS *)self handleSecureMicNotificationWithInterruptionInfo:a4];
        [(VCAudioSession *)self didStop];
        break;
      case 1:
        [(VCAudioSession *)self didInterruptionEnded];
        break;
      case 2:
        [(VCAudioSessionCMS *)self didBeginQuietTime];
        break;
      case 3:
        [(VCAudioSessionCMS *)self didEndQuietTime];
        break;
      case 4:
        [(VCAudioSession *)self didPause];
        break;
      case 5:
        [(VCAudioSession *)self didResume];
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v16 = v12;
            __int16 v17 = 2080;
            __int16 v18 = "-[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:]";
            __int16 v19 = 1024;
            int v20 = 440;
            __int16 v21 = 1024;
            int v22 = valuePtr;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unhandled session interruption: interruptionValue=%u", buf, 0x22u);
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:]();
    }
  }
}

- (void)setupInputBeamforming
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCAudioSessionCMS setupInputBeamforming]";
  __int16 v6 = 1024;
  int v7 = 480;
  __int16 v8 = 1040;
  int v9 = 4;
  __int16 v10 = v0;
  uint64_t v11 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d kCMSessionProperty_SelectableInputs failed err=%.4s", v3, 0x2Cu);
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (a3 == 1)
  {
    p_micSourceBack = (CFDictionaryRef *)&self->super._micSourceBack;
    if (self->super._micSourceBack)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_12;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      CFDictionaryRef v11 = *p_micSourceBack;
      int v13 = 136315906;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCAudioSessionCMS internalSelectMicrophoneWithType:]";
      __int16 v17 = 1024;
      int v18 = 508;
      __int16 v19 = 2112;
      CFDictionaryRef v20 = v11;
      int v9 = " [%s] %s:%d applying back microphone preference _micSourceBack=%@";
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    p_micSourceBack = (CFDictionaryRef *)&self->super._micSourceFront;
    if (self->super._micSourceFront)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_12;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      CFDictionaryRef v8 = *p_micSourceBack;
      int v13 = 136315906;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCAudioSessionCMS internalSelectMicrophoneWithType:]";
      __int16 v17 = 1024;
      int v18 = 505;
      __int16 v19 = 2112;
      CFDictionaryRef v20 = v8;
      int v9 = " [%s] %s:%d applying front microphone preference _micSourceFront=%@";
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x26u);
LABEL_12:
      VCMicrophonePreferencesCMS_ApplyMicrophonePreferences((int)self->_cmSession, *p_micSourceBack);
    }
  }
  self->super._selectedMicrophone = a3;
  return 1;
}

- (BOOL)readSessionProperty:(__CFString *)a3 floatValue:(float *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *a4 = NAN;
  int v5 = VCCMSessionStub_CMSessionCopyProperty();
  if (v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      CFDictionaryRef v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCAudioSessionCMS readSessionProperty:floatValue:]";
        __int16 v13 = 1024;
        int v14 = 519;
        __int16 v15 = 2112;
        uint64_t v16 = a3;
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to read property=%@. error=%d", buf, 0x2Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioSessionCMS readSessionProperty:floatValue:]();
    }
  }
  return v5 == 0;
}

- (void)refreshAudioOuputLatencyWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  float v9 = NAN;
  if ([(VCAudioSessionCMS *)self readSessionProperty:*MEMORY[0x1E4F76058] floatValue:&v9])
  {
    [(VCAudioSessionCMS *)self setExternalInputAudioLatency:v9];
  }
  if ([(VCAudioSessionCMS *)self readSessionProperty:*MEMORY[0x1E4F76088] floatValue:&v9])
  {
    [(VCAudioSessionCMS *)self setExternalOutputAudioLatency:v9];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double externalInputAudioLatency = self->_externalInputAudioLatency;
      double externalOutputAudioLatency = self->_externalOutputAudioLatency;
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCAudioSessionCMS refreshAudioOuputLatencyWithReason:]";
      __int16 v14 = 1024;
      int v15 = 536;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 2048;
      double v19 = externalInputAudioLatency;
      __int16 v20 = 2048;
      double v21 = externalOutputAudioLatency;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received audio route changed with audioSessionRouteChangeReason=%@ new externalInputAudioLatency=%f externalOutputAudioLatency=%f", buf, 0x3Au);
    }
  }
}

- (void)didAudioRouteChangeWithUserInfo:(__CFDictionary *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  CFNumberRef Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F76810]);
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCAudioSessionCMS_didAudioRouteChangeWithUserInfo___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = Value;
  dispatch_async(dispatchQueue, block);
}

uint64_t __53__VCAudioSessionCMS_didAudioRouteChangeWithUserInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshAudioOuputLatencyWithReason:*(void *)(a1 + 40)];
}

- (opaqueCMSession)cmSession
{
  return self->_cmSession;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (void)setExternalInputAudioLatency:(double)a3
{
  self->_double externalInputAudioLatency = a3;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)setExternalOutputAudioLatency:(double)a3
{
  self->_double externalOutputAudioLatency = a3;
}

- (void)applyRequestedProperty:defaultValue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error: _cmSession is NULL", v2, v3, v4, v5, v6);
}

- (void)applyRequestedProperty:defaultValue:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting propertyKey=%@ failed, value is nil.");
}

- (void)applyRequestedProperties:propertyOrder:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to batch set request properties=%@");
}

- (void)setSampleRate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error Getting kCMSessionProperty_PreferredOutputSampleRate result=%d", v2, v3, v4, v5);
}

- (void)setSampleRate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate sample rate", v2, v3, v4, v5, v6);
}

- (void)setSampleRate:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error Setting kCMSessionProperty_PreferredOutputSampleRate result=%d", v2, v3, v4, v5);
}

- (void)startSessionWithMediaProperties:sessionRef:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid state... ????", v2, v3, v4, v5, v6);
}

- (void)stopSession
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session already stopped ?", v2, v3, v4, v5, v6);
}

- (void)handleAudioInterruption:interruptionInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected session reference", v2, v3, v4, v5, v6);
}

- (void)readSessionProperty:floatValue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Value returned for property=%@ is nil!");
}

@end