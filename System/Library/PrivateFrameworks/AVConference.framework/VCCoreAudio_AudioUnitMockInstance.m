@interface VCCoreAudio_AudioUnitMockInstance
- (BOOL)audioSessionIDSet;
- (BOOL)bufferFrameSizeSet;
- (BOOL)generateMutedTalkerNotification:(unsigned int)a3;
- (BOOL)isInitialized;
- (BOOL)isReconfiguring;
- (BOOL)isRunning;
- (BOOL)reallocAudioBuffer:(AudioBufferList *)a3 withFormat:(const AudioStreamBasicDescription *)a4;
- (VCCoreAudio_AudioUnitMockInstance)init;
- (float)dynamicDuckerVolume;
- (int)getEnableIOWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)getIOBufferDurationWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)getInputCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)getMaximumMediadataByteSizeWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)getRenderCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)getStreamFormatWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5;
- (int)setEnableIOWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (int)setIOBufferDurationWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (int)setInputCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (int)setMutedTalkerNotificiationHandlerWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (int)setRenderCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (int)setStreamFormatWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5;
- (unsigned)enableInputIO;
- (unsigned)enableOutputIO;
- (void)cleanUpAudioBuffer:(AudioBufferList *)a3;
- (void)dealloc;
- (void)runAudioCallback;
- (void)runAudioCallbackWithSampleCount:(unsigned int)a3 timeGap:(double)a4;
- (void)setAudioSessionIDSet:(BOOL)a3;
- (void)setBufferFrameSizeSet:(BOOL)a3;
- (void)setDynamicDuckerVolume:(float)a3;
- (void)setIsInitialized:(BOOL)a3;
- (void)setIsReconfiguring:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setupDefaultFormat:(AudioStreamBasicDescription *)a3;
@end

@implementation VCCoreAudio_AudioUnitMockInstance

- (VCCoreAudio_AudioUnitMockInstance)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCCoreAudio_AudioUnitMockInstance;
  v2 = [(VCObject *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_ioBufferDuration = 0.02;
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    mach_timebase_info((mach_timebase_info_t)&v8);
    LODWORD(v5) = HIDWORD(v8);
    LODWORD(v4) = v8;
    v3->_double timebaseHostTimeConversionRatio = (double)v4 * 0.000000001 / (double)v5;
    v3->_dynamicDuckerVolume = NAN;
    if (+[VCDefaults BOOLeanValueForKey:@"forceEnableAudioMockInputPathForAppleTV" defaultValue:0])
    {
      double timebaseHostTimeConversionRatio = v3->_timebaseHostTimeConversionRatio;
      v3->_hostTime = timebaseHostTimeConversionRatio * (double)mach_absolute_time();
    }
    [(VCCoreAudio_AudioUnitMockInstance *)v3 setupDefaultFormat:&v3->_renderStreamFormat];
    [(VCCoreAudio_AudioUnitMockInstance *)v3 setupDefaultFormat:&v3->_inputStreamFormat];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCCoreAudio_AudioUnitMockInstance *)self cleanUpAudioBuffer:&self->_inputBuffer];
  [(VCCoreAudio_AudioUnitMockInstance *)self cleanUpAudioBuffer:&self->_renderBuffer];
  id mutedSpeechActivityListener = self->_mutedSpeechActivityListener;
  if (mutedSpeechActivityListener)
  {
    _Block_release(mutedSpeechActivityListener);
    self->_id mutedSpeechActivityListener = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCCoreAudio_AudioUnitMockInstance;
  [(VCObject *)&v4 dealloc];
}

- (BOOL)reallocAudioBuffer:(AudioBufferList *)a3 withFormat:(const AudioStreamBasicDescription *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = 0;
  if (a3)
  {
    if (a4)
    {
      AudioFormatFlags mFormatFlags = a4->mFormatFlags;
      if ((mFormatFlags & 0x20) != 0)
      {
        if (mFormatFlags)
        {
          unint64_t v8 = 4 * vcvtad_u64_f64(a4->mSampleRate * self->_ioBufferDuration);
          uint64_t mChannelsPerFrame = a4->mChannelsPerFrame;
          uint64_t v10 = 16 * (mChannelsPerFrame - 1) + 24;
          v11 = *a3;
          v18[0] = v11;
          if (v11)
          {
            if (v11->mNumberBuffers >= mChannelsPerFrame && v8 <= v11->mBuffers[0].mDataByteSize) {
              goto LABEL_11;
            }
            [(VCCoreAudio_AudioUnitMockInstance *)self cleanUpAudioBuffer:v18];
            *a3 = 0;
            v11 = (AudioBufferList *)v18[0];
            if (v18[0]) {
              goto LABEL_11;
            }
          }
          v11 = (AudioBufferList *)malloc_type_calloc(1uLL, v10 + v8 * mChannelsPerFrame, 0x3F4DE241uLL);
          v18[0] = v11;
          if (v11)
          {
            *a3 = v11;
LABEL_11:
            UInt32 v12 = a4->mChannelsPerFrame;
            v11->mNumberBuffers = v12;
            if (v12)
            {
              uint64_t v13 = 0;
              unint64_t v14 = 0;
              v15 = (char *)v11 + v10;
              do
              {
                v16 = (char *)v11 + v13;
                *((_DWORD *)v16 + 2) = 1;
                *((_DWORD *)v16 + 3) = v8;
                *((void *)v16 + 2) = v15;
                v15 += v8;
                ++v14;
                v11 = (AudioBufferList *)v18[0];
                v13 += 16;
              }
              while (v14 < *(unsigned int *)v18[0]);
            }
            return v18[0] != 0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:].cold.4();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:]();
    }
  }
  return v18[0] != 0;
}

- (void)cleanUpAudioBuffer:(AudioBufferList *)a3
{
  if (a3)
  {
    if (*a3)
    {
      free(*a3);
      *a3 = 0;
    }
  }
}

- (void)setupDefaultFormat:(AudioStreamBasicDescription *)a3
{
  a3->mSampleRate = 24000.0;
  *(_OWORD *)&a3->mFormatID = xmmword_1E259BB10;
  *(_OWORD *)&a3->mBytesPerFrame = xmmword_1E259BB20;
}

- (void)runAudioCallback
{
  LODWORD(v2) = vcvtad_u64_f64(self->_inputStreamFormat.mSampleRate * self->_ioBufferDuration);
  [(VCCoreAudio_AudioUnitMockInstance *)self runAudioCallbackWithSampleCount:v2 timeGap:0.0];
}

- (void)runAudioCallbackWithSampleCount:(unsigned int)a3 timeGap:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_hostTime = self->_hostTime + (double)a3 / self->_inputStreamFormat.mSampleRate + a4;
  double v5 = self->_inputSampleTime + round(self->_inputStreamFormat.mSampleRate * a4) + (double)a3;
  self->_inputSampleTime = v5;
  int v15 = 0;
  AURenderCallback inputProc = self->_inputCallback.inputProc;
  if (inputProc)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    double v10 = v5;
    unint64_t v11 = (unint64_t)(self->_hostTime / self->_timebaseHostTimeConversionRatio);
    ((void (*)(void *, int *, double *, void, void, AudioBufferList *))inputProc)(self->_inputCallback.inputProcRefCon, &v15, &v10, 0, *(void *)&a3, self->_inputBuffer);
  }
  unsigned int v7 = vcvtad_u64_f64(self->_renderStreamFormat.mSampleRate * self->_ioBufferDuration);
  double renderSampleTime = self->_renderSampleTime;
  self->_double renderSampleTime = renderSampleTime + (double)v7;
  AURenderCallback v9 = self->_renderCallback.inputProc;
  if (v9)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    double v10 = renderSampleTime + (double)v7;
    unint64_t v11 = (unint64_t)(self->_hostTime / self->_timebaseHostTimeConversionRatio);
    ((void (*)(void *, int *, double *, void))v9)(self->_renderCallback.inputProcRefCon, &v15, &v10, 0);
  }
}

- (int)setEnableIOWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  int v5 = -1;
  if (a4 && a5 == 4)
  {
    unsigned int v6 = *(_DWORD *)a4;
    if (a3)
    {
      if (a3 == 1)
      {
        unsigned int v7 = &OBJC_IVAR___VCCoreAudio_AudioUnitMockInstance__enableInputIO;
        goto LABEL_10;
      }
      if (a3 != 2) {
        return 0;
      }
    }
    else
    {
      self->_enableInputIO = v6;
    }
    unsigned int v7 = &OBJC_IVAR___VCCoreAudio_AudioUnitMockInstance__enableOutputIO;
LABEL_10:
    int v5 = 0;
    *(_DWORD *)((char *)&self->super.super.isa + *v7) = v6;
  }
  return v5;
}

- (int)getEnableIOWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 4)
  {
    *a5 = 4;
    if (a3 > 2) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = *(_DWORD *)((char *)&self->super.super.isa + *off_1E6DB8488[a3]);
    }
    int result = 0;
    *a5 = v7;
  }
  return result;
}

- (int)setRenderCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  int result = -1;
  if (a4)
  {
    if (a5 == 16)
    {
      int result = 0;
      self->_renderCallback = *(AURenderCallbackStruct *)a4;
    }
  }
  return result;
}

- (int)getRenderCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 0x10)
  {
    int result = 0;
    *a5 = 16;
    *(AURenderCallbackStruct *)a4 = self->_renderCallback;
  }
  return result;
}

- (int)setInputCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  int result = -1;
  if (a4)
  {
    if (a5 == 16)
    {
      int result = 0;
      self->_inputCallback = *(AURenderCallbackStruct *)a4;
    }
  }
  return result;
}

- (int)getInputCallbackWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 0x10)
  {
    int result = 0;
    *a5 = 16;
    *(AURenderCallbackStruct *)a4 = self->_inputCallback;
  }
  return result;
}

- (int)setStreamFormatWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  int result = -1;
  if (a4 && a5 == 40)
  {
    [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:1];
    if (a3 == 1)
    {
      uint64_t v12 = *((void *)a4 + 4);
      long long v13 = *((_OWORD *)a4 + 1);
      *(_OWORD *)&self->_renderStreamFormat.mSampleRate = *(_OWORD *)a4;
      *(_OWORD *)&self->_renderStreamFormat.mBytesPerPacket = v13;
      *(void *)&self->_renderStreamFormat.mBitsPerChannel = v12;
      BOOL v14 = -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:](self, "reallocAudioBuffer:withFormat:", &self->_renderBuffer);
      [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:0];
      if (v14) {
        return 0;
      }
    }
    else
    {
      if (a3 == 2)
      {
        uint64_t v9 = *((void *)a4 + 4);
        long long v10 = *((_OWORD *)a4 + 1);
        *(_OWORD *)&self->_inputStreamFormat.mSampleRate = *(_OWORD *)a4;
        *(_OWORD *)&self->_inputStreamFormat.mBytesPerPacket = v10;
        *(void *)&self->_inputStreamFormat.mBitsPerChannel = v9;
        BOOL v11 = -[VCCoreAudio_AudioUnitMockInstance reallocAudioBuffer:withFormat:](self, "reallocAudioBuffer:withFormat:", &self->_inputBuffer);
        [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:0];
        if (!v11) {
          return -4;
        }
        return 0;
      }
      [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:0];
    }
    return -4;
  }
  return result;
}

- (int)getStreamFormatWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 0x28)
  {
    *a5 = 40;
    if (a3 == 2)
    {
      int result = 0;
      uint64_t v7 = 248;
      goto LABEL_8;
    }
    if (a3 == 1)
    {
      int result = 0;
      uint64_t v7 = 208;
LABEL_8:
      unint64_t v8 = (char *)self + v7;
      uint64_t v9 = *((void *)v8 + 4);
      long long v10 = *((_OWORD *)v8 + 1);
      *(_OWORD *)a4 = *(_OWORD *)v8;
      *((_OWORD *)a4 + 1) = v10;
      *((void *)a4 + 4) = v9;
      return result;
    }
    int result = 0;
    *a5 = 0;
  }
  return result;
}

- (int)setIOBufferDurationWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  int v5 = -1;
  if (a4 && a5 == 4)
  {
    self->_ioBufferDuration = *(float *)a4;
    [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:1];
    if ([(VCCoreAudio_AudioUnitMockInstance *)self reallocAudioBuffer:&self->_inputBuffer withFormat:&self->_inputStreamFormat])
    {
      if ([(VCCoreAudio_AudioUnitMockInstance *)self reallocAudioBuffer:&self->_renderBuffer withFormat:&self->_renderStreamFormat])
      {
        int v5 = 0;
LABEL_6:
        [(VCCoreAudio_AudioUnitMockInstance *)self setIsReconfiguring:0];
        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCoreAudio_AudioUnitMockInstance setIOBufferDurationWithScope:data:dataSize:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCoreAudio_AudioUnitMockInstance setIOBufferDurationWithScope:data:dataSize:]();
      }
    }
    int v5 = -4;
    goto LABEL_6;
  }
  return v5;
}

- (int)getIOBufferDurationWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 4)
  {
    int result = 0;
    *a5 = 4;
    *(float *)a4 = self->_ioBufferDuration;
  }
  return result;
}

- (int)getMaximumMediadataByteSizeWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int *)a5
{
  int result = -1;
  if (a4 && a5 && *a5 >= 4)
  {
    int result = 0;
    *a5 = 4;
    *(_DWORD *)a4 = 0;
  }
  return result;
}

- (int)setMutedTalkerNotificiationHandlerWithScope:(unsigned int)a3 data:(const void *)a4 dataSize:(unsigned int)a5
{
  if (!a4 || a5 == 8)
  {
    id mutedSpeechActivityListener = self->_mutedSpeechActivityListener;
    if (mutedSpeechActivityListener)
    {
      _Block_release(mutedSpeechActivityListener);
      self->_id mutedSpeechActivityListener = 0;
    }
    uint64_t v7 = *(const void **)a4;
    if (*(void *)a4)
    {
      uint64_t v9 = _Block_copy(v7);
      LODWORD(v7) = 0;
      self->_id mutedSpeechActivityListener = v9;
    }
  }
  else
  {
    LODWORD(v7) = -1;
  }
  return (int)v7;
}

- (BOOL)generateMutedTalkerNotification:(unsigned int)a3
{
  id mutedSpeechActivityListener = (void (**)(id, void))self->_mutedSpeechActivityListener;
  if (mutedSpeechActivityListener) {
    mutedSpeechActivityListener[2](self->_mutedSpeechActivityListener, *(void *)&a3);
  }
  return mutedSpeechActivityListener != 0;
}

- (unsigned)enableInputIO
{
  return self->_enableInputIO;
}

- (unsigned)enableOutputIO
{
  return self->_enableOutputIO;
}

- (float)dynamicDuckerVolume
{
  return self->_dynamicDuckerVolume;
}

- (void)setDynamicDuckerVolume:(float)a3
{
  self->_dynamicDuckerVolume = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (BOOL)isReconfiguring
{
  return self->_isReconfiguring;
}

- (void)setIsReconfiguring:(BOOL)a3
{
  self->_isReconfiguring = a3;
}

- (BOOL)audioSessionIDSet
{
  return self->_audioSessionIDSet;
}

- (void)setAudioSessionIDSet:(BOOL)a3
{
  self->_audioSessionIDSet = a3;
}

- (BOOL)bufferFrameSizeSet
{
  return self->_bufferFrameSizeSet;
}

- (void)setBufferFrameSizeSet:(BOOL)a3
{
  self->_bufferFrameSizeSet = a3;
}

- (void)reallocAudioBuffer:withFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL audio buffer reference", v2, v3, v4, v5, v6);
}

- (void)reallocAudioBuffer:withFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL format", v2, v3, v4, v5, v6);
}

- (void)reallocAudioBuffer:withFormat:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported audio format: interleaved", v2, v3, v4, v5, v6);
}

- (void)reallocAudioBuffer:withFormat:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported audio format: not float", v2, v3, v4, v5, v6);
}

- (void)reallocAudioBuffer:withFormat:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the sample buffer", v2, v3, v4, v5, v6);
}

- (void)setIOBufferDurationWithScope:data:dataSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reallocate the render buffer", v2, v3, v4, v5, v6);
}

- (void)setIOBufferDurationWithScope:data:dataSize:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reallocate the input buffer", v2, v3, v4, v5, v6);
}

@end