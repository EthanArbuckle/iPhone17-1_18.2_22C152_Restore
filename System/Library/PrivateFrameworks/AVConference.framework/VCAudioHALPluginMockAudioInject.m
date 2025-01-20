@interface VCAudioHALPluginMockAudioInject
- (BOOL)start;
- (BOOL)stop;
- (VCAudioHALPluginMockAudioInject)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3;
- (void)dealloc;
- (void)injectAudioCallbacks;
- (void)invalidate;
@end

@implementation VCAudioHALPluginMockAudioInject

- (VCAudioHALPluginMockAudioInject)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)VCAudioHALPluginMockAudioInject;
  v4 = [(VCAudioHALPluginMockAudioInject *)&v47 init];
  if (!v4)
  {
LABEL_39:
    v10 = 0;
    goto LABEL_40;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginMockAudioInject-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 36;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-init (%p)", buf, 0x26u);
    }
  }
  if (!a3)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginMockAudioInject initWithConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v30 = (__CFString *)[v4 performSelector:sel_logPrefix];
      }
      else {
        v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 37;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v30;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) invalid config", buf, 0x30u);
        }
      }
    }
    goto LABEL_39;
  }
  long long v7 = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
  long long v8 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
  *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->sinkFormat.format.mBitsPerChannel;
  *(_OWORD *)(v4 + 24) = v8;
  *(_OWORD *)(v4 + 8) = v7;
  *((void *)v4 + 7) = a3->sinkContext;
  *((void *)v4 + 8) = a3->sinkProc;
  *((_DWORD *)v4 + 32) = 3;
  if (!+[VCDefaults BOOLeanValueForKey:@"forceEnableAudioHALPluginMockInput" defaultValue:0])
  {
    v10 = 0;
    goto LABEL_41;
  }
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 44;
    v13 = " [%s] %s:%d Using AudioHALPlugin mock input for testing";
    v14 = v12;
    uint32_t v15 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v9 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 44;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v9;
    *(_WORD *)&buf[38] = 2048;
    v49 = v4;
    v13 = " [%s] %s:%d %@(%p) Using AudioHALPlugin mock input for testing";
    v14 = v17;
    uint32_t v15 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_19:
  v10 = objc_alloc_init(VCCannedAudioInjectorConfig);
  long long v18 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
  v45[0] = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
  v45[1] = v18;
  uint64_t v46 = *(void *)&a3->sinkFormat.format.mBitsPerChannel;
  [(VCCannedAudioInjectorConfig *)v10 setAudioFormat:v45];
  [(VCCannedAudioInjectorConfig *)v10 setSineWaveFrequencyHz:440];
  if ([(VCCannedAudioInjectorConfig *)v10 isValid])
  {
    v19 = [[VCCannedAudioInjector alloc] initWithConfig:v10];
    *((void *)v4 + 19) = v19;
    if (!v19)
    {
      if ((char *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioHALPluginMockAudioInject initWithConfig:]();
          }
        }
        goto LABEL_40;
      }
      if (objc_opt_respondsToSelector()) {
        v34 = (__CFString *)[v4 performSelector:sel_logPrefix];
      }
      else {
        v34 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v39;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 50;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v34;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          v38 = " [%s] %s:%d %@(%p) could not allocate canned audio injector";
          goto LABEL_69;
        }
      }
LABEL_40:

      v10 = (VCCannedAudioInjectorConfig *)v4;
      v4 = 0;
      goto LABEL_41;
    }
    unsigned int samplesPerFrame = a3->sinkFormat.samplesPerFrame;
    long long v21 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
    *(_OWORD *)&buf[16] = v21;
    *(void *)&buf[32] = *(void *)&a3->sinkFormat.format.mBitsPerChannel;
    VCAudioBufferList_Allocate((long long *)buf, samplesPerFrame, (void *)v4 + 20);
    if (!*((void *)v4 + 20))
    {
      if ((char *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioHALPluginMockAudioInject initWithConfig:]();
          }
        }
        goto LABEL_40;
      }
      if (objc_opt_respondsToSelector()) {
        v35 = (__CFString *)[v4 performSelector:sel_logPrefix];
      }
      else {
        v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 52;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v35;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          v38 = " [%s] %s:%d %@(%p) could not allocate audio buffer list";
          goto LABEL_69;
        }
      }
      goto LABEL_40;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v4];
  LODWORD(v23) = a3->sinkFormat.samplesPerFrame;
  double v24 = (double)v23;
  if (v10)
  {
    [(VCCannedAudioInjectorConfig *)v10 audioFormat];
    double v25 = *(double *)&v42;
  }
  else
  {
    uint64_t v44 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    double v25 = 0.0;
  }
  uint64_t v26 = (v24 / v25 * 1000.0);
  v27 = [VCDispatchTimer alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __50__VCAudioHALPluginMockAudioInject_initWithConfig___block_invoke;
  v41[3] = &unk_1E6DB3DC8;
  v41[4] = v22;
  uint64_t v28 = [(VCDispatchTimer *)v27 initWithIntervalMilliseconds:v26 callbackBlock:v41];
  *((void *)v4 + 21) = v28;
  if (!v28)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginMockAudioInject initWithConfig:].cold.4();
        }
      }
      goto LABEL_40;
    }
    if (objc_opt_respondsToSelector()) {
      v29 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 59;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v29;
        *(_WORD *)&buf[38] = 2048;
        v49 = v4;
        v38 = " [%s] %s:%d %@(%p) could not allocate dispatch timer";
LABEL_69:
        _os_log_error_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x30u);
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
LABEL_41:

  return (VCAudioHALPluginMockAudioInject *)v4;
}

uint64_t __50__VCAudioHALPluginMockAudioInject_initWithConfig___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 injectAudioCallbacks];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginMockAudioInject-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCAudioHALPluginMockAudioInject dealloc]";
      __int16 v10 = 1024;
      int v11 = 73;
      __int16 v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-dealloc (%p)", buf, 0x26u);
    }
  }

  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferList);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginMockAudioInject;
  [(VCAudioHALPluginMockAudioInject *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginMockAudioInject-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCAudioHALPluginMockAudioInject invalidate]";
      __int16 v9 = 1024;
      int v10 = 81;
      __int16 v11 = 2048;
      __int16 v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (BOOL)start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginMockAudioInject-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginMockAudioInject start]";
      __int16 v10 = 1024;
      int v11 = 85;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-start (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  [(VCDispatchTimer *)self->_audioInjectTimer start];
  return 1;
}

- (BOOL)stop
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginMockAudioInject-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginMockAudioInject stop]";
      __int16 v10 = 1024;
      int v11 = 91;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-stop (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  [(VCDispatchTimer *)self->_audioInjectTimer stop];
  return 1;
}

- (void)injectAudioCallbacks
{
  VCCannedAudioInjector_InjectSamples((uint64_t)self->_audioInjector, (uint64_t)self->_audioBufferList, 0, 0);
  uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)self->_audioBufferList);
  LODWORD(v4) = self->_sinkFormat.samplesPerFrame;
  unsigned int v5 = (self->_sinkFormat.format.mSampleRate * ((double)v4 / self->_sinkFormat.format.mSampleRate));
  self->_audioTimestamp.mSampleTime = self->_audioTimestamp.mSampleTime + (double)v5;
  UInt64 v6 = mach_absolute_time();
  self->_audioSourceBuffer.data = *(void **)(AudioBufferList + 16);
  self->_audioTimestamp.mHostTime = v6;
  self->_audioSourceBuffer.dataByteSize = self->_sinkFormat.format.mBytesPerFrame
                                        * v5
                                        * self->_sinkFormat.format.mChannelsPerFrame;
  sinkProc = (void (*)(id))self->_sinkProc;
  if (sinkProc)
  {
    id sinkContext = self->_sinkContext;
    sinkProc(sinkContext);
  }
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid config", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate canned audio injector", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate dispatch timer", v2, v3, v4, v5, v6);
}

@end