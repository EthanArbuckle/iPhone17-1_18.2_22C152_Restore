@interface VCMediaRecorderLocal
- (BOOL)configureVideoRecording;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)registerForCameraCapture;
- (BOOL)startAudio;
- (BOOL)usesClientToken;
- (VCMediaRecorderLocal)initWithStreamToken:(int64_t)a3 configuration:(id)a4 reportingAgent:(opaqueRTCReporting *)a5;
- (id)clientCaptureRule;
- (int)supportedVideoCodec;
- (tagVCAudioIOConfiguration)defaultAudioIOConfig;
- (void)cleanupSpatialAudio;
- (void)configureVideoRecording;
- (void)dealloc;
- (void)deregisterForCameraCapture;
- (void)invalidate;
- (void)setupSpatialAudio;
- (void)sourceFrameRateDidChange:(unsigned int)a3;
- (void)supportedVideoCodec;
@end

@implementation VCMediaRecorderLocal

- (VCMediaRecorderLocal)initWithStreamToken:(int64_t)a3 configuration:(id)a4 reportingAgent:(opaqueRTCReporting *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaRecorderLocal;
  v6 = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:](&v13, sel_initWithStreamToken_delegate_reportingAgent_);
  if (v6)
  {
    v6->_configuration = (VCMediaRecorderConfiguration *)a4;
    v6->_audioSessionId = VCUniqueIDGenerator_GenerateID();
    char v7 = [(VCMediaRecorderConfiguration *)v6->_configuration mediaAvailability];
    if ((v7 & 2) != 0)
    {
      [(VCMediaRecorder *)v6 setCapabilities:2];
      if (![(VCMediaRecorderLocal *)v6 configureVideoRecording])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]();
          }
        }
        goto LABEL_10;
      }
      if (![(VCMediaRecorderLocal *)v6 registerForCameraCapture])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]();
          }
        }
        goto LABEL_10;
      }
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorderLocal-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          v17 = "-[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]";
          __int16 v18 = 1024;
          int v19 = 38;
          __int16 v20 = 2048;
          v21 = v6;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-init (%p) video started", buf, 0x26u);
        }
      }
    }
    if ([(VCMediaRecorderConfiguration *)v6->_configuration mediaAvailability])
    {
      [(VCMediaRecorder *)v6 setCapabilities:2];
      [(VCMediaRecorderLocal *)v6 setupSpatialAudio];
      if (![(VCMediaRecorderLocal *)v6 startAudio])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]();
          }
        }
        goto LABEL_10;
      }
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorderLocal-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          v17 = "-[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]";
          __int16 v18 = 1024;
          int v19 = 46;
          __int16 v20 = 2048;
          v21 = v6;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-init (%p) audio started", buf, 0x26u);
        }
      }
    }
    else if ((v7 & 2) == 0)
    {
LABEL_10:

      return 0;
    }
  }
  return v6;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderLocal;
  [(VCMediaRecorder *)&v5 invalidate];
  [(VCObject *)self reportingAgent];
  VCReporting_finalizeAggregation();
  [(VCMediaRecorderLocal *)self deregisterForCameraCapture];
  [(VCAudioIO *)self->_audioIO stop];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorderLocal-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCMediaRecorderLocal invalidate]";
      __int16 v10 = 1024;
      int v11 = 62;
      __int16 v12 = 2048;
      objc_super v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-invalidate (%p)", buf, 0x26u);
    }
  }
}

- (BOOL)usesClientToken
{
  return 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];

  [(VCMediaRecorderLocal *)self cleanupSpatialAudio];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCMediaRecorderLocal-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCMediaRecorderLocal dealloc]";
      __int16 v10 = 1024;
      int v11 = 74;
      __int16 v12 = 2048;
      objc_super v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-dealloc (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderLocal;
  [(VCMediaRecorder *)&v5 dealloc];
}

- (tagVCAudioIOConfiguration)defaultAudioIOConfig
{
  unsigned int IntValueForKey = VCDefaults_GetIntValueForKey(@"forceAudioSampleRate", 24000);
  unsigned int v6 = (VCDefaults_GetDoubleValueForKey(@"forceAudioBlockSize", 0.02) * (double)IntValueForKey);
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var4 = v7;
  *(_OWORD *)&retstr->var8 = v7;
  *(_OWORD *)&retstr->var12 = v7;
  *(_OWORD *)&retstr->var14 = v7;
  *(_OWORD *)&retstr->var16 = v7;
  *(_OWORD *)&retstr->var19.delegate = v7;
  *(_OWORD *)&retstr->var19.clientContext = v7;
  *(_OWORD *)&retstr->var19.captionsCoordinator = v7;
  *(_OWORD *)&retstr->var19.injector = v7;
  *(_OWORD *)&retstr->var20.clientCallback = v7;
  *(_OWORD *)&retstr->var20.captionsToken = v7;
  *(_OWORD *)&retstr->var20.captionsUseSecondaryThread = v7;
  unsigned int audioSessionId = self->_audioSessionId;
  *(_OWORD *)&retstr->var21 = v7;
  retstr->var0 = audioSessionId;
  *(_OWORD *)&retstr->var1 = xmmword_1E25A0190;
  *(_WORD *)&retstr->var5 = 2;
  retstr->var7 = 0;
  result = (tagVCAudioIOConfiguration *)[(VCMediaRecorderConfiguration *)self->_configuration clientPid];
  retstr->var8 = (int)result;
  retstr->var9 = IntValueForKey;
  retstr->var10 = v6;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var15 = 0;
  retstr->var16 = 0;
  retstr->var14 = 0;
  *(_WORD *)&retstr->var17 = 0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  *(_OWORD *)&retstr->var19.injector = 0u;
  retstr->var20.clientCallback = _VCMediaRecorderLocal_PushAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (void)setupSpatialAudio
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    int v3 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", self->_audioSessionId, 1, 32, 0);
    if (v3 < 0)
    {
      int v4 = v3;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        unsigned int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315906;
          uint64_t v8 = v5;
          __int16 v9 = 2080;
          __int16 v10 = "-[VCMediaRecorderLocal setupSpatialAudio]";
          __int16 v11 = 1024;
          int v12 = 111;
          __int16 v13 = 1024;
          int v14 = v4;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to register for spatial audio. status=%08x", (uint8_t *)&v7, 0x22u);
        }
      }
    }
  }
}

- (void)cleanupSpatialAudio
{
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    id v3 = +[VCAudioManager sharedVoiceChatInstance];
    uint64_t audioSessionId = self->_audioSessionId;
    [v3 unregisterAudioSessionId:audioSessionId];
  }
}

- (BOOL)startAudio
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v3;
  long long v19 = v3;
  long long v16 = v3;
  long long v17 = v3;
  long long v14 = v3;
  long long v15 = v3;
  long long v12 = v3;
  long long v13 = v3;
  long long v10 = v3;
  long long v11 = v3;
  long long v8 = v3;
  long long v9 = v3;
  long long v6 = v3;
  long long v7 = v3;
  if (self)
  {
    [(VCMediaRecorderLocal *)self defaultAudioIOConfig];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  int v4 = [[VCAudioIO alloc] initWithConfiguration:&v6];
  self->_audioIO = v4;
  if (v4)
  {
    if ([(VCAudioIO *)v4 start])
    {

      self->_audioIO = 0;
      [(VCMediaRecorderLocal *)self cleanupSpatialAudio];
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (BOOL)registerForCameraCapture
{
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];

  return [v3 registerForFrames:self];
}

- (void)deregisterForCameraCapture
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
  VCMediaRecorder_ClearHistoryBuffer((uint64_t)self);

  VCMediaRecorder_StopProcessingAllRequests((uint64_t)self);
}

- (BOOL)configureVideoRecording
{
  id v3 = (void *)VCVideoCaptureServer_CopyLocalVideoAttributes((uint64_t)+[VCVideoCaptureServer VCVideoCaptureServerSingleton]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderLocal configureVideoRecording]();
      }
    }
    goto LABEL_14;
  }
  uint64_t v4 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyLocalScreenAttributesForVideoAttributes:", v3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderLocal configureVideoRecording]();
      }
    }
LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = (void *)v4;
  VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self, v4);
  uint64_t v6 = [(VCMediaRecorderLocal *)self supportedVideoCodec];
  if (v6 != 128)
  {
    [(VCMediaRecorder *)self setVideoCodec:v6];
    *(float *)&double v7 = (float)(int)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "bestCameraCaptureFrameRate");
    [(VCMediaRecorder *)self setFrameRate:v7];
    BOOL v8 = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaRecorderLocal configureVideoRecording]();
    }
  }
LABEL_18:
  BOOL v8 = 0;
LABEL_5:

  if (!v8) {
    [(VCMediaRecorderLocal *)self deregisterForCameraCapture];
  }
  return v8;
}

- (int)supportedVideoCodec
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderVideoCodecs];
  if (v2)
  {
    if ([v2 containsObject:&unk_1F3DC4A70]
      && +[VCHardwareSettings supportsHEVCEncoding])
    {
      int v3 = 100;
    }
    else
    {
      int v3 = 123;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        long long v10 = "-[VCMediaRecorderLocal supportedVideoCodec]";
        __int16 v11 = 1024;
        int v12 = 203;
        __int16 v13 = 1024;
        int v14 = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using video codec=%u", (uint8_t *)&v7, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderLocal supportedVideoCodec]();
      }
    }
    return 128;
  }
  return v3;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  *(float *)&double v3 = (float)a3;
  [(VCMediaRecorder *)self setFrameRate:v3];
}

- (id)clientCaptureRule
{
  return 0;
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start audio, streamToken=%u", v2, v3, v4, v5);
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register for video frames, streamToken=%u", v2, v3, v4, v5);
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure video recording, streamToken=%u", v2, v3, v4, v5);
}

- (void)configureVideoRecording
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get valid video codec", v2, v3, v4, v5, v6);
}

- (void)supportedVideoCodec
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get supported video codecs", v2, v3, v4, v5, v6);
}

@end