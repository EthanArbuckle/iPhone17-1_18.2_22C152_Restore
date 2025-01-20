@interface VCAudioPowerSpectrumMeter
- (VCAudioPowerSpectrumMeter)initWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5;
- (void)cleanUpEventQueue;
- (void)dealloc;
- (void)realtimeContext;
- (void)registerNewAudioPowerSpectrumForStreamToken:(id)a3 powerSpectrumKey:(id)a4 spectrumSource:(id)a5;
- (void)releaseAudioPowerSpectrumForStreamToken:(id)a3;
- (void)unregisterAllStreams;
@end

@implementation VCAudioPowerSpectrumMeter

- (VCAudioPowerSpectrumMeter)initWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCAudioPowerSpectrumMeter;
  v8 = [(VCObject *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_audioSpectrumBinCount = a3;
    objc_storeWeak((id *)&v8->_realtimeContext.powerSpectrumMeterDelegate, a5);
    v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_realtimeContext.var0 = v9;
    v9->_realtimeContext.audioSpectrumRefreshRate = a4;
    v9->_realtimeContext.nextDeliveryTime = NAN;
    v9->_realtimeContext.nextHeatlhPrintTime = NAN;
    v9->_realtimeContext.outputPowerSpectrums = v10;
    atomic_store(0, (unsigned __int8 *)&v9->_realtimeContext.isProcessingOutput);
    VCSingleLinkedListInitialize((uint64_t)&v9->_realtimeContext, (uint64_t)_VCAudioPowerSpectrumMeter_CompareListEntries);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 5, &v9->_realtimeContext.eventQueue);
    if (!v9->_realtimeContext.eventQueue)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumMeter initWithBinCount:refreshRate:delegate:](v12, v13);
        }
      }

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((VCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = v4;
        __int16 v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter dealloc]";
        __int16 v17 = 1024;
        int v18 = 55;
        v6 = " [%s] %s:%d ";
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
      v3 = (__CFString *)[(VCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
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
        *(void *)&buf[4] = v9;
        __int16 v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter dealloc]";
        __int16 v17 = 1024;
        int v18 = 55;
        __int16 v19 = 2112;
        v20 = v3;
        __int16 v21 = 2048;
        v22 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_storeWeak((id *)&self->_realtimeContext.powerSpectrumMeterDelegate, 0);
  _VCAudioPowerSpectrumMeter_ProcessEventQueue((uint64_t)&self->_realtimeContext, 0);
  eventQueue = self->_realtimeContext.eventQueue;
  if (eventQueue) {
    CFRelease(eventQueue);
  }
  while (1)
  {
    *(void *)buf = VCSingleLinkedListPop((uint64_t *)&self->_realtimeContext);
    if (!*(void *)buf) {
      break;
    }
    _VCAudioPowerSpectrumMeter_FreeStream((void **)buf);
  }
  outputPowerSpectrums = self->_realtimeContext.outputPowerSpectrums;
  if (outputPowerSpectrums) {
    CFRelease(outputPowerSpectrums);
  }
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumMeter;
  [(VCObject *)&v13 dealloc];
}

- (void)registerNewAudioPowerSpectrumForStreamToken:(id)a3 powerSpectrumKey:(id)a4 spectrumSource:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v9;
      __int16 v21 = 2080;
      v22 = "-[VCAudioPowerSpectrumMeter registerNewAudioPowerSpectrumForStreamToken:powerSpectrumKey:spectrumSource:]";
      __int16 v23 = 1024;
      int v24 = 71;
      __int16 v25 = 2112;
      id v26 = a3;
      __int16 v27 = 2112;
      id v28 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%@, powerSpectrumSource=%@", buf, 0x30u);
    }
  }
  v11 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  int v18 = v11;
  *((_DWORD *)v11 + 19) = 1;
  v11[1] = a3;
  v11[2] = a4;
  v11[5] = a5;
  v11[3] = [a5 realtimeContext];
  v11[4] = VCAudioPowerSpectrumSource_ProcessAudioSamples;
  uint64_t v12 = -[VCAudioPowerSpectrum initWithBinCount:streamToken:sinkContext:sinkCallback:]([VCAudioPowerSpectrum alloc], "initWithBinCount:streamToken:sinkContext:sinkCallback:", self->_audioSpectrumBinCount, [a3 longValue], &self->_realtimeContext, VCAudioPowerSpectrumMeter_ProcessOutput);
  v11[7] = v12;
  v11[6] = [(VCAudioPowerSpectrum *)v12 realtimeContext];
  v11[8] = objc_alloc_init(AVCAudioPowerSpectrum);
  OSStatus v13 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v11);
  if (v13)
  {
    OSStatus v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        eventQueue = self->_realtimeContext.eventQueue;
        *(_DWORD *)buf = 136316930;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        v22 = "-[VCAudioPowerSpectrumMeter registerNewAudioPowerSpectrumForStreamToken:powerSpectrumKey:spectrumSource:]";
        __int16 v23 = 1024;
        int v24 = 87;
        __int16 v25 = 2048;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 2112;
        id v30 = a5;
        __int16 v31 = 2048;
        v32 = eventQueue;
        __int16 v33 = 1024;
        OSStatus v34 = v14;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p streamToken=%@ powerSpectrumSource=%@ queue=%p status=%d", buf, 0x4Au);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v18);
  }
  VCAudioPowerSpectrumSource_RegisterAudioPowerSpectrumSink((CMSimpleQueueRef *)[a5 realtimeContext], &self->_realtimeContext, self, self, VCAudioPowerSpectrumMeter_ProcessOutput);
}

- (void)releaseAudioPowerSpectrumForStreamToken:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  uint64_t v12 = v5;
  *((_DWORD *)v5 + 19) = 2;
  v5[1] = a3;
  p_realtimeContext = &self->_realtimeContext;
  OSStatus v7 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v5);
  if (v7)
  {
    OSStatus v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        eventQueue = p_realtimeContext->eventQueue;
        *(_DWORD *)buf = 136316674;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        v16 = "-[VCAudioPowerSpectrumMeter releaseAudioPowerSpectrumForStreamToken:]";
        __int16 v17 = 1024;
        int v18 = 103;
        __int16 v19 = 2048;
        uint64_t v20 = v5;
        __int16 v21 = 2112;
        id v22 = a3;
        __int16 v23 = 2048;
        int v24 = eventQueue;
        __int16 v25 = 1024;
        OSStatus v26 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p streamToken=%@ queue=%p status=%d", buf, 0x40u);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v12);
  }
}

- (void)unregisterAllStreams
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E004070F165FEuLL);
  v10 = v3;
  *((_DWORD *)v3 + 19) = 3;
  p_realtimeContext = &self->_realtimeContext;
  OSStatus v5 = CMSimpleQueueEnqueue(self->_realtimeContext.eventQueue, v3);
  if (v5)
  {
    OSStatus v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      OSStatus v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        eventQueue = p_realtimeContext->eventQueue;
        *(_DWORD *)buf = 136316418;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCAudioPowerSpectrumMeter unregisterAllStreams]";
        __int16 v15 = 1024;
        int v16 = 115;
        __int16 v17 = 2048;
        int v18 = v3;
        __int16 v19 = 2048;
        uint64_t v20 = eventQueue;
        __int16 v21 = 1024;
        OSStatus v22 = v6;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue stream=%p queue=%p status=%d", buf, 0x36u);
      }
    }
    _VCAudioPowerSpectrumMeter_FreeStream(&v10);
  }
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (void)cleanUpEventQueue
{
  p_realtimeContext = &self->_realtimeContext;
  p_isProcessingOutput = (unsigned __int8 *)&p_realtimeContext->isProcessingOutput;
  if ((atomic_exchange(&p_realtimeContext->isProcessingOutput._Value, 1u) & 1) == 0)
  {
    _VCAudioPowerSpectrumMeter_ProcessEventQueue((uint64_t)p_realtimeContext, 1);
    atomic_store(0, p_isProcessingOutput);
  }
}

- (void)initWithBinCount:(uint64_t)a1 refreshRate:(NSObject *)a2 delegate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  OSStatus v5 = "-[VCAudioPowerSpectrumMeter initWithBinCount:refreshRate:delegate:]";
  __int16 v6 = 1024;
  int v7 = 46;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create _streamTokenEventQueue", (uint8_t *)&v2, 0x1Cu);
}

@end