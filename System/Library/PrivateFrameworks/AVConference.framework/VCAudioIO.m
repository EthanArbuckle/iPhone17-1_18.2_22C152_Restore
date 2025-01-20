@interface VCAudioIO
+ (id)controllerForDeviceRole:(int)a3 audioType:(unsigned int)a4 direction:(unsigned __int8)a5 operatingMode:(int)a6 streamInputID:(int64_t)a7 streamToken:(int64_t)a8 networkClockID:(unint64_t)a9 remoteDeviceInfo:(id)a10;
+ (id)defaultControllerForAudioType:(unsigned int)a3 forDirection:(unsigned __int8)a4 forOperatingMode:(int)a5 remoteDeviceInfo:(id)a6;
+ (id)newSystemAudioCaptureControllerForAudioType:(unsigned int)a3 forOperatingMode:(int)a4 remoteDeviceInfo:(id)a5;
- (BOOL)createConverterForSource:(BOOL)a3 error:(id *)a4;
- (BOOL)isGKVoiceChat;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMuted;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)reconfigureWithConfig:(const tagVCAudioIOConfiguration *)a3;
- (BOOL)spatialAudioDisabled;
- (BOOL)supportsVoiceActivityDetection;
- (NSDictionary)reportingStats;
- (VCAudioIO)initWithConfiguration:(const tagVCAudioIOConfiguration *)a3;
- (const)clientFormat;
- (const)controllerFormat;
- (id)delegate;
- (id)start;
- (id)stop;
- (id)stopWithCompletionHandlerInternal:(id)a3;
- (int)operatingMode;
- (unsigned)direction;
- (unsigned)pullAudioSamplesCount;
- (unsigned)state;
- (void)cleanUpRealtimeDelegatesAndContext:(BOOL)a3;
- (void)controllerFormatChanged:(const tagVCAudioFrameFormat *)a3;
- (void)dealloc;
- (void)destroyBuffers;
- (void)didResume;
- (void)didStart:(BOOL)a3 error:(id)a4;
- (void)didStop:(BOOL)a3 error:(id)a4;
- (void)didSuspend;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)forceCleanup;
- (void)releaseConverters;
- (void)serverDidDie;
- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3;
- (void)setDirection:(unsigned __int8)a3;
- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3;
- (void)setInputMeteringEnabled:(BOOL)a3;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOutputMeteringEnabled:(BOOL)a3;
- (void)setRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4;
- (void)setSpatialAudioDisabled:(BOOL)a3;
- (void)setUpAndTransferDelegateContext:(const tagVCAudioIODelegateContext *)a3 toDestinationContext:(tagVCAudioIODelegateContext *)a4;
- (void)setupClientFormatWithConfiguration:(const tagVCAudioIOConfiguration *)a3;
- (void)start;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
- (void)stopWithCompletionHandler:(id)a3;
- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4;
@end

@implementation VCAudioIO

+ (id)defaultControllerForAudioType:(unsigned int)a3 forDirection:(unsigned __int8)a4 forOperatingMode:(int)a5 remoteDeviceInfo:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
      goto LABEL_8;
    case 1u:
    case 5u:
      if (a4 == 1)
      {
        id v7 = +[VCAudioManager sharedSystemAudioOutputInstance];
        goto LABEL_17;
      }
      if (a4 != 2) {
        goto LABEL_15;
      }
      v6 = +[VCAudioIO newSystemAudioCaptureControllerForAudioType:forOperatingMode:remoteDeviceInfo:](VCAudioIO, "newSystemAudioCaptureControllerForAudioType:forOperatingMode:remoteDeviceInfo:");
      break;
    case 2u:
      if (a4 == 1)
      {
LABEL_8:
        id v7 = +[VCAudioManager sharedVoiceChatInstance];
LABEL_17:
        v6 = (VCSystemAudioCaptureController *)v7;
      }
      else if (a4 == 2)
      {
        long long v11 = 0uLL;
        long long v10 = 1uLL;
LABEL_14:
        v6 = [[VCSystemAudioCaptureController alloc] initWithConfig:&v10];
      }
      else
      {
LABEL_15:
        v6 = 0;
      }
      break;
    case 3u:
      if (a4 != 2) {
        goto LABEL_15;
      }
      long long v10 = 0u;
      long long v11 = 0u;
      int v8 = -3;
      goto LABEL_13;
    case 4u:
      if (a4 != 2) {
        goto LABEL_15;
      }
      long long v10 = 0u;
      long long v11 = 0u;
      int v8 = -2;
LABEL_13:
      DWORD1(v10) = v8;
      goto LABEL_14;
    default:
      goto LABEL_15;
  }
  return v6;
}

+ (id)newSystemAudioCaptureControllerForAudioType:(unsigned int)a3 forOperatingMode:(int)a4 remoteDeviceInfo:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 == 5) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  int IntValueForKey = VCDefaults_GetIntValueForKey(@"forceSystemAudioCaptureSource", v9);
  if ((id)objc_opt_class() != a1)
  {
    if (objc_opt_respondsToSelector()) {
      long long v11 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      long long v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)v20 = 136316930;
    *(void *)&v20[4] = v17;
    *(_WORD *)&v20[12] = 2080;
    *(void *)&v20[14] = "+[VCAudioIO newSystemAudioCaptureControllerForAudioType:forOperatingMode:remoteDeviceInfo:]";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 282;
    WORD2(v21) = 2112;
    *(void *)((char *)&v21 + 6) = v11;
    HIWORD(v21) = 2048;
    id v22 = a1;
    __int16 v23 = 1024;
    int v24 = IntValueForKey;
    __int16 v25 = 1024;
    unsigned int v26 = a3;
    __int16 v27 = 1024;
    int v28 = a4;
    v14 = " [%s] %s:%d %@(%p) Configuring system audio captureSource=%d for audioType=%d, operatingMode=%d";
    v15 = v18;
    uint32_t v16 = 66;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 136316418;
      *(void *)&v20[4] = v12;
      *(_WORD *)&v20[12] = 2080;
      *(void *)&v20[14] = "+[VCAudioIO newSystemAudioCaptureControllerForAudioType:forOperatingMode:remoteDeviceInfo:]";
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = 282;
      WORD2(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 6) = IntValueForKey;
      WORD5(v21) = 1024;
      HIDWORD(v21) = a3;
      LOWORD(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 2) = a4;
      v14 = " [%s] %s:%d Configuring system audio captureSource=%d for audioType=%d, operatingMode=%d";
      v15 = v13;
      uint32_t v16 = 46;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v20, v16);
    }
  }
LABEL_15:
  if (a4 == 12
    && !+[VCHardwareSettings deviceClass]
    && !IntValueForKey)
  {
    return +[VCAudioManager sharedSystemAudioInputInstance];
  }
  *(void *)v20 = 0xFFFFFFFF00000000;
  *(void *)&v20[8] = 0;
  *(_DWORD *)&v20[20] = -1431655766;
  *(_DWORD *)&v20[16] = IntValueForKey;
  *(void *)&long long v21 = a5;
  return [[VCSystemAudioCaptureController alloc] initWithConfig:v20];
}

+ (id)controllerForDeviceRole:(int)a3 audioType:(unsigned int)a4 direction:(unsigned __int8)a5 operatingMode:(int)a6 streamInputID:(int64_t)a7 streamToken:(int64_t)a8 networkClockID:(unint64_t)a9 remoteDeviceInfo:(id)a10
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3 < 9)
  {
    int v13 = a5;
    switch(a3)
    {
      case 0:
        id result = +[VCAudioIO defaultControllerForAudioType:forDirection:forOperatingMode:remoteDeviceInfo:](VCAudioIO, "defaultControllerForAudioType:forDirection:forOperatingMode:remoteDeviceInfo:", *(void *)&a4, a5, *(void *)&a6, a10, a7, a8);
        if (!result) {
          goto LABEL_24;
        }
        break;
      case 1:
      case 2:
      case 6:
        id result = +[VCAudioManager sharedVoiceChatInstance];
        if (!result) {
          goto LABEL_24;
        }
        break;
      case 3:
        id result = +[VCAudioRelayIOController sharedInstanceRemoteFacing];
        if (!result) {
          goto LABEL_24;
        }
        break;
      case 4:
        id result = +[VCAudioRelayIOController sharedInstanceClientFacing];
        if (!result) {
          goto LABEL_24;
        }
        break;
      case 5:
        id result = +[VCAudioRelayIOController sharedInstanceSafeViewRemoteFacing];
        if (!result) {
          goto LABEL_24;
        }
        break;
      case 7:
      case 8:
        id result = [[VCStreamIOAudioController alloc] initWithStreamInputID:a7 streamToken:a8 networkClockID:a9];
        if (!result) {
          goto LABEL_24;
        }
        break;
      default:
LABEL_24:
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            __int16 v23 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v26 = 136316418;
              uint64_t v27 = v22;
              __int16 v28 = 2080;
              uint64_t v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:netw"
                    "orkClockID:remoteDeviceInfo:]";
              __int16 v30 = 1024;
              int v31 = 338;
              __int16 v32 = 1024;
              *(_DWORD *)v33 = a3;
              *(_WORD *)&v33[4] = 1024;
              *(_DWORD *)&v33[6] = a4;
              LOWORD(v34) = 1024;
              *(_DWORD *)((char *)&v34 + 2) = v13;
              v18 = " [%s] %s:%d Failed to create controller for deviceRole=%d audioType=%d direction=%d";
              v19 = v23;
              uint32_t v20 = 46;
              goto LABEL_36;
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            long long v21 = (__CFString *)[a1 performSelector:sel_logPrefix];
          }
          else {
            long long v21 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v24 = VRTraceErrorLogLevelToCSTR();
            __int16 v25 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v26 = 136316930;
              uint64_t v27 = v24;
              __int16 v28 = 2080;
              uint64_t v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:netw"
                    "orkClockID:remoteDeviceInfo:]";
              __int16 v30 = 1024;
              int v31 = 338;
              __int16 v32 = 2112;
              *(void *)v33 = v21;
              *(_WORD *)&v33[8] = 2048;
              id v34 = a1;
              __int16 v35 = 1024;
              int v36 = a3;
              __int16 v37 = 1024;
              unsigned int v38 = a4;
              __int16 v39 = 1024;
              int v40 = v13;
              v18 = " [%s] %s:%d %@(%p) Failed to create controller for deviceRole=%d audioType=%d direction=%d";
              v19 = v25;
              uint32_t v20 = 66;
              goto LABEL_36;
            }
          }
        }
        return 0;
    }
  }
  else
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = 136316418;
          uint64_t v27 = v16;
          __int16 v28 = 2080;
          uint64_t v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkC"
                "lockID:remoteDeviceInfo:]";
          __int16 v30 = 1024;
          int v31 = 309;
          __int16 v32 = 2112;
          *(void *)v33 = v12;
          *(_WORD *)&v33[8] = 2048;
          id v34 = a1;
          __int16 v35 = 1024;
          int v36 = a3;
          v18 = " [%s] %s:%d %@(%p) No controller found for device role:%d";
          v19 = v17;
          uint32_t v20 = 54;
LABEL_36:
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v20);
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)setUpAndTransferDelegateContext:(const tagVCAudioIODelegateContext *)a3 toDestinationContext:(tagVCAudioIODelegateContext *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    *(_OWORD *)&a4->clientCallback = *(_OWORD *)&a3->clientCallback;
    captionsCoordinator = a3->captionsCoordinator;
    if (captionsCoordinator)
    {
      int v8 = captionsCoordinator;
      a4->captionsCoordinator = v8;
      a4->captionsToken = a3->captionsToken;
      a4->captionsUseSecondaryThread = a3->captionsUseSecondaryThread;
      memset(&v10[16], 170, 40);
      *(_OWORD *)long long v10 = xmmword_1E25A0270;
      long long v9 = *(_OWORD *)&self->_clientFormat.format.mSampleRate;
      *(_OWORD *)&v10[24] = *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket;
      *(void *)long long v10 = a3->captionsToken;
      *(void *)&v10[40] = *(void *)&self->_clientFormat.format.mBitsPerChannel;
      *(_OWORD *)&v10[8] = v9;
      v10[48] = a3->captionsUseSecondaryThread;
      [(VCAudioCaptionsCoordinator *)v8 registerStreamWithConfig:v10];
    }
    a4->injector = a3->injector;
  }
}

- (VCAudioIO)initWithConfiguration:(const tagVCAudioIOConfiguration *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCAudioIO;
  v4 = [(VCAudioIO *)&v18 init];
  v5 = v4;
  if (v4)
  {
    uint64_t var2 = a3->var2;
    uint64_t var3 = a3->var3;
    v4->_audioType = a3->var4;
    int v8 = (VCAudioIOControllerControl *)+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:](VCAudioIO, "controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:", var3, a3->var16, a3->var21);
    v5->_audioIOController = v8;
    if (v8)
    {
      [(VCAudioIO *)v5 setupClientFormatWithConfiguration:a3];
      long long v9 = *(_OWORD *)&v5->_clientFormat.format.mBytesPerPacket;
      *(_OWORD *)&v5->_controllerFormat.format.mSampleRate = *(_OWORD *)&v5->_clientFormat.format.mSampleRate;
      *(_OWORD *)&v5->_controllerFormat.format.mBytesPerPacket = v9;
      *(_OWORD *)&v5->_controllerFormat.format.mBitsPerChannel = *(_OWORD *)&v5->_clientFormat.format.mBitsPerChannel;
      long long v10 = [VCAudioIOControllerClient alloc];
      BYTE1(v17) = a3->var17;
      LOBYTE(v17) = a3->var18;
      BYTE4(v16) = a3->var11;
      LODWORD(v16) = a3->var8;
      uint64_t v11 = -[VCAudioIOControllerClient initWithDelegate:audioSessionId:channelIndex:sourceContext:sourceProcess:sinkContext:sinkProcess:clientPid:isPrewarmingClient:spatialToken:isVoiceActivityEnabled:isMediaPriorityEnabled:](v10, "initWithDelegate:audioSessionId:channelIndex:sourceContext:sourceProcess:sinkContext:sinkProcess:clientPid:isPrewarmingClient:spatialToken:isVoiceActivityEnabled:isMediaPriorityEnabled:", v5, a3->var0, a3->var1, &v5->_sourceData, VCAudioIO_PullAudioSamples, &v5->_sinkData, VCAudioIO_PushAudioSamples, v16, a3->var12, v17);
      v5->_controllerClient = v11;
      [(VCAudioIOControllerClient *)v11 setAllowAudioRecording:a3->var6];
      [(VCAudioIOControllerClient *)v5->_controllerClient setDeviceRole:var3];
      [(VCAudioIOControllerClient *)v5->_controllerClient setOperatingMode:var2];
      [(VCAudioIOControllerClient *)v5->_controllerClient setDirection:a3->var5];
      [(VCAudioIOControllerClient *)v5->_controllerClient setNetworkUplinkClockUsesBaseband:a3->var22];
      [(VCAudioIOControllerClient *)v5->_controllerClient setOptOutOfSmartRouting:a3->var23];
      [(VCAudioIOControllerClient *)v5->_controllerClient setClientFormat:&v5->_clientFormat];
      pthread_mutex_init(&v5->_stateMutex, 0);
      objc_storeWeak(&v5->_delegate, a3->var7);
      objc_storeWeak(&v5->_sourceDelegate, a3->var19.delegate);
      [(VCAudioIO *)v5 setUpAndTransferDelegateContext:&a3->var19 toDestinationContext:&v5->_sourceData.delegateContext];
      objc_storeWeak(&v5->_sinkDelegate, a3->var20.delegate);
      [(VCAudioIO *)v5 setUpAndTransferDelegateContext:&a3->var20 toDestinationContext:&v5->_sinkData.delegateContext];
    }
    else
    {
      if ((VCAudioIO *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioIO initWithConfiguration:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v12 = (__CFString *)[(VCAudioIO *)v5 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v12 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v20 = v13;
            __int16 v21 = 2080;
            uint64_t v22 = "-[VCAudioIO initWithConfiguration:]";
            __int16 v23 = 1024;
            int v24 = 391;
            __int16 v25 = 2112;
            int v26 = v12;
            __int16 v27 = 2048;
            __int16 v28 = v5;
            __int16 v29 = 1024;
            int v30 = var3;
            _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Controller not found for device role:%d", buf, 0x36u);
          }
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)setupClientFormatWithConfiguration:(const tagVCAudioIOConfiguration *)a3
{
  v9[1] = *(double *)MEMORY[0x1E4F143B8];
  v9[0] = NAN;
  p_clientFormat = &self->_clientFormat;
  if (self->_audioType == 1) {
    id v6 = +[VCAudioManager sharedSystemAudioOutputInstance];
  }
  else {
    id v6 = +[VCAudioManager sharedVoiceChatInstance];
  }
  [v6 getPreferredFormat:&self->_clientFormat blockSize:v9 vpOperatingMode:0 forOperatingMode:a3->var2 deviceRole:a3->var3 suggestedFormat:0];
  unsigned int var9 = a3->var9;
  if (var9) {
    p_clientFormat->format.mSampleRate = (double)var9;
  }
  unsigned int var10 = a3->var10;
  if (!var10) {
    unsigned int var10 = (p_clientFormat->format.mSampleRate * v9[0]);
  }
  self->_clientFormat.samplesPerFrame = var10;
  self->_clientFormat.format.mChannelsPerFrame = a3->var13;
}

- (BOOL)reconfigureWithConfig:(const tagVCAudioIOConfiguration *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioIO reconfigureWithConfig:]();
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v13;
    __int16 v23 = 2080;
    int v24 = "-[VCAudioIO reconfigureWithConfig:]";
    __int16 v25 = 1024;
    int v26 = 454;
    __int16 v27 = 2112;
    __int16 v28 = v11;
    __int16 v29 = 2048;
    int v30 = self;
    v15 = " [%s] %s:%d %@(%p) Operation not allowed while the audio IO is running";
    uint64_t v16 = v14;
    uint32_t v17 = 48;
    goto LABEL_26;
  }
  p_uint64_t var3 = &a3->var3;
  id v7 = +[VCAudioIO controllerForDeviceRole:a3->var3 audioType:a3->var4 direction:a3->var5 operatingMode:a3->var2 streamInputID:a3->var14 streamToken:a3->var15 networkClockID:a3->var16 remoteDeviceInfo:a3->var21];
  if (!v7)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioIO reconfigureWithConfig:]();
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v18 = VRTraceErrorLogLevelToCSTR(),
          v19 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:
      BOOL v9 = 0;
      goto LABEL_4;
    }
    int v20 = *p_var3;
    *(_DWORD *)buf = 136316418;
    uint64_t v22 = v18;
    __int16 v23 = 2080;
    int v24 = "-[VCAudioIO reconfigureWithConfig:]";
    __int16 v25 = 1024;
    int v26 = 464;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    __int16 v29 = 2048;
    int v30 = self;
    __int16 v31 = 1024;
    int v32 = v20;
    v15 = " [%s] %s:%d %@(%p) Controller not found for device role:%d";
    uint64_t v16 = v19;
    uint32_t v17 = 54;
LABEL_26:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_24;
  }
  int v8 = v7;

  self->_audioIOController = (VCAudioIOControllerControl *)v8;
  [(VCAudioIOControllerClient *)self->_controllerClient setAllowAudioRecording:a3->var6];
  [(VCAudioIOControllerClient *)self->_controllerClient setDeviceRole:a3->var3];
  [(VCAudioIOControllerClient *)self->_controllerClient setOperatingMode:a3->var2];
  [(VCAudioIOControllerClient *)self->_controllerClient setDirection:a3->var5];
  [(VCAudioIOControllerClient *)self->_controllerClient setIsMediaPriorityEnabled:a3->var17];
  [(VCAudioIOControllerClient *)self->_controllerClient setIsVoiceActivityEnabled:a3->var18];
  [(VCAudioIOControllerClient *)self->_controllerClient setChannelIndex:a3->var1];
  [(VCAudioIOControllerClient *)self->_controllerClient setNetworkUplinkClockUsesBaseband:a3->var22];
  BOOL v9 = 1;
  self->_sinkData.controllerChanged = 1;
  self->_sourceData.controllerChanged = 1;
LABEL_4:
  pthread_mutex_unlock(p_stateMutex);
  return v9;
}

- (NSDictionary)reportingStats
{
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_audioIOController && (objc_opt_respondsToSelector() & 1) != 0) {
    v4 = (NSDictionary *)[(VCAudioIOControllerControl *)self->_audioIOController reportingStats];
  }
  else {
    v4 = 0;
  }
  pthread_mutex_unlock(p_stateMutex);
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_sourceDelegate, 0);
  objc_storeWeak(&self->_sinkDelegate, 0);
  [(VCAudioIO *)self forceCleanup];
  [(VCAudioIO *)self cleanUpRealtimeDelegatesAndContext:1];
  [(VCAudioIO *)self releaseConverters];
  [(VCAudioIO *)self destroyBuffers];
  if (objc_opt_respondsToSelector()) {
    [(VCAudioIOControllerControl *)self->_audioIOController invalidate];
  }

  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioIO;
  [(VCAudioIO *)&v3 dealloc];
}

- (void)cleanUpRealtimeDelegatesAndContext:(BOOL)a3
{
  BOOL v3 = a3;
  delegate = self->_sinkData.delegateContext.delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_sinkData.delegateContext.delegate = 0;
  }
  id v6 = self->_sourceData.delegateContext.delegate;
  if (v6)
  {
    CFRelease(v6);
    self->_sourceData.delegateContext.delegate = 0;
  }
  if (v3)
  {
    captionsCoordinator = self->_sinkData.delegateContext.captionsCoordinator;
    if (captionsCoordinator)
    {
      CFRelease(captionsCoordinator);
      self->_sinkData.delegateContext.captionsCoordinator = 0;
    }
    int v8 = self->_sourceData.delegateContext.captionsCoordinator;
    if (v8)
    {
      CFRelease(v8);
      self->_sourceData.delegateContext.captionsCoordinator = 0;
    }
    injector = self->_sinkData.delegateContext.injector;
    if (injector)
    {
      CFRelease(injector);
      self->_sinkData.delegateContext.injector = 0;
    }
    long long v10 = self->_sourceData.delegateContext.injector;
    if (v10)
    {
      CFRelease(v10);
      self->_sourceData.delegateContext.injector = 0;
    }
  }
}

- (void)forceCleanup
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCAudioIO is being released but it is not in the right state: %d", v2, v3, v4, v5);
}

intptr_t __25__VCAudioIO_forceCleanup__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (const)clientFormat
{
  return &self->_clientFormat;
}

- (const)controllerFormat
{
  return &self->_controllerFormat;
}

- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_stateMutex = &self->_stateMutex;
    pthread_mutex_lock(&self->_stateMutex);
    if (self->_state)
    {
      if ((VCAudioIO *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioIO setFarEndVersionInfo:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v14 = 136316162;
            *(void *)&v14[4] = v12;
            *(_WORD *)&v14[12] = 2080;
            *(void *)&v14[14] = "-[VCAudioIO setFarEndVersionInfo:]";
            *(_WORD *)&v14[22] = 1024;
            *(_DWORD *)&v14[24] = 603;
            *(_WORD *)&v14[28] = 2112;
            *(void *)&v14[30] = v11;
            *(_WORD *)&v14[38] = 2048;
            *(void *)&v14[40] = self;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Operation not allowed while the audio IO is running", v14, 0x30u);
          }
        }
      }
    }
    else
    {
      controllerClient = self->_controllerClient;
      long long v7 = *(_OWORD *)&a3->farEndOSVersion[48];
      long long v18 = *(_OWORD *)&a3->farEndOSVersion[32];
      long long v19 = v7;
      unsigned int farEndAUVersion = a3->farEndAUVersion;
      long long v8 = *(_OWORD *)&a3->farEndHwModel[48];
      *(_OWORD *)&v14[32] = *(_OWORD *)&a3->farEndHwModel[32];
      long long v15 = v8;
      long long v9 = *(_OWORD *)&a3->farEndOSVersion[16];
      long long v16 = *(_OWORD *)a3->farEndOSVersion;
      long long v17 = v9;
      long long v10 = *(_OWORD *)&a3->farEndHwModel[16];
      *(_OWORD *)v14 = *(_OWORD *)a3->farEndHwModel;
      *(_OWORD *)&v14[16] = v10;
      [(VCAudioIOControllerClient *)controllerClient setFarEndVersionInfo:v14];
    }
    pthread_mutex_unlock(p_stateMutex);
  }
}

- (void)setRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  -[VCAudioIOControllerClient setRemoteCodecType:sampleRate:](self->_controllerClient, "setRemoteCodecType:sampleRate:");
  if (objc_opt_respondsToSelector())
  {
    audioIOController = self->_audioIOController;
    [(VCAudioIOControllerControl *)audioIOController refreshRemoteCodecType:v5 sampleRate:a4];
  }
}

- (BOOL)isInputMeteringEnabled
{
  return [(VCAudioIOControllerClient *)self->_controllerClient isInputMeteringEnabled];
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  [(VCAudioIOControllerClient *)self->_controllerClient setInputMeteringEnabled:a3];
  if (objc_opt_respondsToSelector())
  {
    audioIOController = self->_audioIOController;
    [(VCAudioIOControllerControl *)audioIOController refreshInputMetering];
  }
}

- (BOOL)isOutputMeteringEnabled
{
  return [(VCAudioIOControllerClient *)self->_controllerClient isInputMeteringEnabled];
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  [(VCAudioIOControllerClient *)self->_controllerClient setOutputMeteringEnabled:a3];
  if (objc_opt_respondsToSelector())
  {
    audioIOController = self->_audioIOController;
    [(VCAudioIOControllerControl *)audioIOController refreshOutputMetering];
  }
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_isMuted = a3;
  self->_sinkData.isMuted = a3;
  if (objc_opt_respondsToSelector()) {
    [(VCAudioIOControllerControl *)self->_audioIOController setMute:v3 forClient:self->_controllerClient];
  }
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        long long v16 = "-[VCAudioIO setMuted:]";
        __int16 v17 = 1024;
        int v18 = 649;
        __int16 v19 = 1024;
        LODWORD(v20) = v3;
        long long v8 = " [%s] %s:%d isMuted=%d";
        long long v9 = v7;
        uint32_t v10 = 34;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        long long v16 = "-[VCAudioIO setMuted:]";
        __int16 v17 = 1024;
        int v18 = 649;
        __int16 v19 = 2112;
        int v20 = v5;
        __int16 v21 = 2048;
        uint64_t v22 = self;
        __int16 v23 = 1024;
        BOOL v24 = v3;
        long long v8 = " [%s] %s:%d %@(%p) isMuted=%d";
        long long v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_13;
      }
    }
  }
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_BOOL isGKVoiceChat = a3;
  audioIOController = self->_audioIOController;
  if (audioIOController == +[VCAudioManager sharedVoiceChatInstance])
  {
    BOOL isGKVoiceChat = self->_isGKVoiceChat;
    id v6 = +[VCAudioManager sharedVoiceChatInstance];
    [v6 setIsGKVoiceChat:isGKVoiceChat];
  }
}

- (unsigned)direction
{
  return [(VCAudioIOControllerClient *)self->_controllerClient direction];
}

- (void)setDirection:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    long long v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v8 = [(VCAudioIOControllerClient *)self->_controllerClient direction];
    unsigned int state = self->_state;
    *(_DWORD *)__int16 v17 = 136316418;
    *(void *)&v17[4] = v6;
    __int16 v18 = 2080;
    __int16 v19 = "-[VCAudioIO setDirection:]";
    __int16 v20 = 1024;
    int v21 = 665;
    __int16 v22 = 1024;
    *(_DWORD *)__int16 v23 = v8;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v3;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = state;
    uint32_t v10 = " [%s] %s:%d Set direction from %d to %d. Current state:%d";
    uint64_t v11 = v7;
    uint32_t v12 = 46;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(VCAudioIOControllerClient *)self->_controllerClient direction];
      unsigned int v16 = self->_state;
      *(_DWORD *)__int16 v17 = 136316930;
      *(void *)&v17[4] = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCAudioIO setDirection:]";
      __int16 v20 = 1024;
      int v21 = 665;
      __int16 v22 = 2112;
      *(void *)__int16 v23 = v5;
      *(_WORD *)&v23[8] = 2048;
      BOOL v24 = self;
      __int16 v25 = 1024;
      int v26 = v15;
      __int16 v27 = 1024;
      int v28 = v3;
      __int16 v29 = 1024;
      unsigned int v30 = v16;
      uint32_t v10 = " [%s] %s:%d %@(%p) Set direction from %d to %d. Current state:%d";
      uint64_t v11 = v14;
      uint32_t v12 = 66;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v17[0] = v3;
    v17[1] = [(VCAudioIOControllerClient *)self->_controllerClient spatialAudioDisabled];
    v17[2] = [(VCAudioIOControllerClient *)self->_controllerClient isVoiceActivityEnabled];
    v17[3] = [(VCAudioIOControllerClient *)self->_controllerClient isMediaPriorityEnabled];
    [(VCAudioIOControllerControl *)self->_audioIOController updateClient:self->_controllerClient settings:v17];
  }
  else
  {
    [(VCAudioIOControllerClient *)self->_controllerClient setDirection:v3];
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (unsigned)pullAudioSamplesCount
{
  return self->_sourceData.framesProcessed;
}

- (BOOL)spatialAudioDisabled
{
  return [(VCAudioIOControllerClient *)self->_controllerClient spatialAudioDisabled];
}

- (void)setSpatialAudioDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    long long v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    BOOL v8 = [(VCAudioIOControllerClient *)self->_controllerClient spatialAudioDisabled];
    unsigned int state = self->_state;
    *(_DWORD *)__int16 v17 = 136316418;
    *(void *)&v17[4] = v6;
    __int16 v18 = 2080;
    __int16 v19 = "-[VCAudioIO setSpatialAudioDisabled:]";
    __int16 v20 = 1024;
    int v21 = 690;
    __int16 v22 = 1024;
    *(_DWORD *)__int16 v23 = v8;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v3;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = state;
    uint32_t v10 = " [%s] %s:%d Set spatialAudioDisabled from %d to %d. Current state:%d";
    uint64_t v11 = v7;
    uint32_t v12 = 46;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(VCAudioIOControllerClient *)self->_controllerClient spatialAudioDisabled];
      unsigned int v16 = self->_state;
      *(_DWORD *)__int16 v17 = 136316930;
      *(void *)&v17[4] = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCAudioIO setSpatialAudioDisabled:]";
      __int16 v20 = 1024;
      int v21 = 690;
      __int16 v22 = 2112;
      *(void *)__int16 v23 = v5;
      *(_WORD *)&v23[8] = 2048;
      BOOL v24 = self;
      __int16 v25 = 1024;
      BOOL v26 = v15;
      __int16 v27 = 1024;
      BOOL v28 = v3;
      __int16 v29 = 1024;
      unsigned int v30 = v16;
      uint32_t v10 = " [%s] %s:%d %@(%p) Set spatialAudioDisabled from %d to %d. Current state:%d";
      uint64_t v11 = v14;
      uint32_t v12 = 66;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v17[0] = [(VCAudioIOControllerClient *)self->_controllerClient direction];
    v17[1] = v3;
    v17[2] = [(VCAudioIOControllerClient *)self->_controllerClient isVoiceActivityEnabled];
    v17[3] = [(VCAudioIOControllerClient *)self->_controllerClient isMediaPriorityEnabled];
    [(VCAudioIOControllerControl *)self->_audioIOController updateClient:self->_controllerClient settings:v17];
  }
  else
  {
    [(VCAudioIOControllerClient *)self->_controllerClient setSpatialAudioDisabled:v3];
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (BOOL)supportsVoiceActivityDetection
{
  v2 = self;
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  LOBYTE(v2) = [(VCAudioIOControllerControl *)v2->_audioIOController supportsVoiceActivityDetection];
  pthread_mutex_unlock(p_stateMutex);
  return (char)v2;
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    long long v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    BOOL v10 = [(VCAudioIOControllerClient *)self->_controllerClient isVoiceActivityEnabled];
    BOOL v11 = [(VCAudioIOControllerClient *)self->_controllerClient isMediaPriorityEnabled];
    unsigned int state = self->_state;
    *(_DWORD *)int v21 = 136316930;
    *(void *)&v21[4] = v8;
    __int16 v22 = 2080;
    __int16 v23 = "-[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:]";
    __int16 v24 = 1024;
    int v25 = 714;
    __int16 v26 = 1024;
    *(_DWORD *)__int16 v27 = v5;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v10;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v4;
    HIWORD(v28) = 1024;
    *(_DWORD *)__int16 v29 = v11;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)unsigned int v30 = state;
    uint64_t v13 = " [%s] %s:%d Set isVoiceActivityEnabled previous=%d new=%d, isMediaPriorityEnabled previous=%d new=%d, state=%d";
    uint64_t v14 = v9;
    uint32_t v15 = 58;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    long long v7 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
  }
  else {
    long long v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = [(VCAudioIOControllerClient *)self->_controllerClient isVoiceActivityEnabled];
      BOOL v19 = [(VCAudioIOControllerClient *)self->_controllerClient isMediaPriorityEnabled];
      unsigned int v20 = self->_state;
      *(_DWORD *)int v21 = 136317442;
      *(void *)&v21[4] = v16;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:]";
      __int16 v24 = 1024;
      int v25 = 714;
      __int16 v26 = 2112;
      *(void *)__int16 v27 = v7;
      *(_WORD *)&v27[8] = 2048;
      BOOL v28 = self;
      *(_WORD *)__int16 v29 = 1024;
      *(_DWORD *)&v29[2] = v5;
      *(_WORD *)unsigned int v30 = 1024;
      *(_DWORD *)&v30[2] = v18;
      __int16 v31 = 1024;
      BOOL v32 = v4;
      __int16 v33 = 1024;
      BOOL v34 = v19;
      __int16 v35 = 1024;
      unsigned int v36 = v20;
      uint64_t v13 = " [%s] %s:%d %@(%p) Set isVoiceActivityEnabled previous=%d new=%d, isMediaPriorityEnabled previous=%d new=%d, state=%d";
      uint64_t v14 = v17;
      uint32_t v15 = 78;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v21, v15);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v21[0] = [(VCAudioIOControllerClient *)self->_controllerClient direction];
    v21[1] = [(VCAudioIOControllerClient *)self->_controllerClient spatialAudioDisabled];
    v21[2] = v5;
    v21[3] = v4;
    [(VCAudioIOControllerControl *)self->_audioIOController updateClient:self->_controllerClient settings:v21];
  }
  else
  {
    [(VCAudioIOControllerClient *)self->_controllerClient setIsVoiceActivityEnabled:v5];
    [(VCAudioIOControllerClient *)self->_controllerClient setIsMediaPriorityEnabled:v4];
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (BOOL)createConverterForSource:(BOOL)a3 error:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (!self->_isControllerAudioFormatValid)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v40) {
          return v40;
        }
        -[VCAudioIO createConverterForSource:error:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v41 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E4F47A50];
        BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v40) {
          return v40;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioIO createConverterForSource:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 735;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v41;
        *(_WORD *)&buf[38] = 2048;
        v83 = self;
        _os_log_error_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) The controller audio format is invalid!", buf, 0x30u);
      }
    }
    LOBYTE(v40) = 0;
    return v40;
  }
  BOOL v5 = a3;
  uint64_t v6 = 368;
  if (a3) {
    uint64_t v6 = 240;
  }
  long long v7 = (char *)self + v6;
  if (!memcmp(&_VCAudioIO_EmptyContext, (char *)&self->_clientFormat.format.mBytesPerFrame + v6, 0x38uLL)) {
    goto LABEL_65;
  }
  uint64_t v8 = 96;
  if (v5) {
    uint64_t v9 = 48;
  }
  else {
    uint64_t v9 = 96;
  }
  if (v5) {
    uint64_t v10 = 56;
  }
  else {
    uint64_t v10 = 104;
  }
  uint64_t v11 = 108;
  if (v5) {
    uint64_t v12 = 60;
  }
  else {
    uint64_t v12 = 108;
  }
  if (!v5) {
    uint64_t v11 = 60;
  }
  int v13 = *(_DWORD *)((char *)&self->super.isa + v11);
  if (v5) {
    uint64_t v14 = 124;
  }
  else {
    uint64_t v14 = 76;
  }
  if (v5) {
    uint64_t v15 = 128;
  }
  else {
    uint64_t v15 = 80;
  }
  int v64 = *(_DWORD *)((char *)&self->super.isa + v14);
  int v65 = v13;
  int v16 = *(_DWORD *)((char *)&self->super.isa + v15);
  uint64_t v17 = 84;
  if (v5) {
    uint64_t v18 = 132;
  }
  else {
    uint64_t v18 = 84;
  }
  int v62 = *(_DWORD *)((char *)&self->super.isa + v18);
  int v63 = v16;
  int v19 = *(_DWORD *)((char *)&self->super.isa + v12);
  if (v5) {
    uint64_t v20 = 76;
  }
  else {
    uint64_t v20 = 124;
  }
  if (v5) {
    uint64_t v21 = 80;
  }
  else {
    uint64_t v21 = 128;
  }
  int v60 = *(_DWORD *)((char *)&self->super.isa + v20);
  int v61 = v19;
  if (v5) {
    uint64_t v22 = 64;
  }
  else {
    uint64_t v22 = 112;
  }
  if (!v5) {
    uint64_t v17 = 132;
  }
  int v58 = *(_DWORD *)((char *)&self->super.isa + v17);
  int v59 = *(_DWORD *)((char *)&self->super.isa + v21);
  unsigned int samplesPerFrame = self->_clientFormat.samplesPerFrame;
  uint64_t v24 = *((void *)v7 + 2);
  *((_DWORD *)v7 + 3) = samplesPerFrame;
  if (v5) {
    uint64_t v25 = 68;
  }
  else {
    uint64_t v25 = 116;
  }
  if (v5) {
    uint64_t v26 = 72;
  }
  else {
    uint64_t v26 = 120;
  }
  if (v5)
  {
    uint64_t v27 = 104;
  }
  else
  {
    uint64_t v8 = 48;
    uint64_t v27 = 56;
  }
  if (v5) {
    uint64_t v28 = 112;
  }
  else {
    uint64_t v28 = 64;
  }
  if (v5) {
    uint64_t v29 = 116;
  }
  else {
    uint64_t v29 = 68;
  }
  unsigned int v30 = *(VCAudioIO **)((char *)&self->super.isa + v8);
  if (v5) {
    uint64_t v31 = 120;
  }
  else {
    uint64_t v31 = 72;
  }
  int v55 = *(_DWORD *)((char *)&self->super.isa + v27);
  LODWORD(v56) = *(_DWORD *)((char *)&self->super.isa + v28);
  HIDWORD(v56) = *(_DWORD *)((char *)&self->super.isa + v29);
  int v57 = *(_DWORD *)((char *)&self->super.isa + v31);
  uint64_t v32 = *(uint64_t *)((char *)&self->super.isa + v9);
  int v33 = *(_DWORD *)((char *)&self->super.isa + v10);
  int v34 = *(_DWORD *)((char *)&self->super.isa + v22);
  int v35 = *(_DWORD *)((char *)&self->super.isa + v25);
  int v36 = *(_DWORD *)((char *)&self->super.isa + v26);
  unsigned int v37 = 2 * samplesPerFrame;
  if (!v24) {
    goto LABEL_58;
  }
  if (VCAudioBufferList_GetSampleCapacity(v24) < v37)
  {
    VCAudioBufferList_Destroy((uint64_t *)v7 + 2);
    VCAudioBufferList_Destroy((uint64_t *)v7 + 3);
  }
  if (!*((void *)v7 + 2))
  {
LABEL_58:
    long long v38 = *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&self->_clientFormat.format.mSampleRate;
    *(_OWORD *)&buf[16] = v38;
    *(void *)&buf[32] = *(void *)&self->_clientFormat.format.mBitsPerChannel;
    VCAudioBufferList_Allocate((long long *)buf, v37, (void *)v7 + 2);
  }
  if (v5 && !*((void *)v7 + 3)) {
    VCAudioBufferList_AllocateFrame((uint64_t)&self->_clientFormat, (void *)v7 + 3);
  }
  if (!v7[8])
  {
LABEL_65:
    LOBYTE(v40) = 1;
    return v40;
  }
  unint64_t v91 = 0xAAAAAAAAAAAA0000;
  *(void *)buf = v32;
  *(_DWORD *)&buf[8] = v33;
  *(_DWORD *)&buf[12] = v61;
  *(_DWORD *)&buf[16] = v34;
  *(_DWORD *)&buf[20] = v35;
  *(_DWORD *)&buf[24] = v36;
  *(_DWORD *)&buf[28] = v60;
  *(_DWORD *)&buf[32] = v59;
  *(_DWORD *)&buf[36] = v58;
  v83 = v30;
  int v84 = v55;
  int v85 = v65;
  uint64_t v86 = v56;
  int v87 = v57;
  int v88 = v64;
  int v89 = v63;
  int v90 = v62;
  int v39 = SoundDec_Create(v7, (uint64_t)buf);
  if (v39 < 0)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      v47 = "sink";
      *(_DWORD *)v66 = 136316418;
      uint64_t v67 = v45;
      __int16 v68 = 2080;
      v69 = "-[VCAudioIO createConverterForSource:error:]";
      if (v5) {
        v47 = "source";
      }
      __int16 v70 = 1024;
      int v71 = 776;
      __int16 v72 = 2080;
      v73 = (void *)v47;
      __int16 v74 = 2048;
      v75 = self;
      __int16 v76 = 1024;
      LODWORD(v77) = v39;
      v48 = " [%s] %s:%d Failed to create %s converter for audioIO:%p! Err:%d";
      v49 = v46;
      uint32_t v50 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v44 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        v44 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      v53 = "sink";
      *(_DWORD *)v66 = 136316930;
      uint64_t v67 = v51;
      __int16 v68 = 2080;
      v69 = "-[VCAudioIO createConverterForSource:error:]";
      if (v5) {
        v53 = "source";
      }
      __int16 v70 = 1024;
      int v71 = 776;
      __int16 v72 = 2112;
      v73 = v44;
      __int16 v74 = 2048;
      v75 = self;
      __int16 v76 = 2080;
      v77 = v53;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 1024;
      int v81 = v39;
      v48 = " [%s] %s:%d %@(%p) Failed to create %s converter for audioIO:%p! Err:%d";
      v49 = v52;
      uint32_t v50 = 74;
    }
    _os_log_error_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_ERROR, v48, v66, v50);
  }
LABEL_64:
  LOBYTE(v40) = v39 >= 0;
  return v40;
}

- (void)destroyBuffers
{
  VCAudioBufferList_Destroy((uint64_t *)&self->_sinkData.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.sampleBuffer);

  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.clientBuffer);
}

- (void)releaseConverters
{
  self->_sinkData.converter = 0;
  SoundDec_Destroy((uint64_t)self->_sourceData.converter);
  self->_sourceData.converter = 0;
}

- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3
{
  -[VCAudioIOControllerClient setClientFormat:](self->_controllerClient, "setClientFormat:");
  long long v5 = *(_OWORD *)&a3->format.mSampleRate;
  long long v6 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_clientFormat.format.mBitsPerChannel = v6;
  *(_OWORD *)&self->_clientFormat.format.mSampleRate = v5;
}

- (int)operatingMode
{
  return [(VCAudioIOControllerClient *)self->_controllerClient operatingMode];
}

- (void)didStart:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state != 1)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int state = self->_state;
          *(_DWORD *)buf = 136315906;
          uint64_t v35 = v9;
          __int16 v36 = 2080;
          unsigned int v37 = "-[VCAudioIO didStart:error:]";
          __int16 v38 = 1024;
          int v39 = 810;
          __int16 v40 = 1024;
          LODWORD(v41) = state;
          uint64_t v12 = " [%s] %s:%d Unexpected audioIO state:%d. Stop may have been called before the didStart callback";
          int v13 = v10;
          uint32_t v14 = 34;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = self->_state;
          *(_DWORD *)buf = 136316418;
          uint64_t v35 = v15;
          __int16 v36 = 2080;
          unsigned int v37 = "-[VCAudioIO didStart:error:]";
          __int16 v38 = 1024;
          int v39 = 810;
          __int16 v40 = 2112;
          uint64_t v41 = v8;
          __int16 v42 = 2048;
          v43 = self;
          __int16 v44 = 1024;
          unsigned int v45 = v17;
          uint64_t v12 = " [%s] %s:%d %@(%p) Unexpected audioIO state:%d. Stop may have been called before the didStart callback";
          int v13 = v16;
          uint32_t v14 = 54;
          goto LABEL_12;
        }
      }
    }
  }
  id startCompletionBlock = self->_startCompletionBlock;
  self->_id startCompletionBlock = 0;
  if (startCompletionBlock)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__VCAudioIO_didStart_error___block_invoke;
    block[3] = &unk_1E6DB7CE0;
    BOOL v33 = v5;
    block[4] = a4;
    block[5] = startCompletionBlock;
    dispatch_async(global_queue, block);
  }
  if (v5) {
    unsigned int v20 = 2;
  }
  else {
    unsigned int v20 = 0;
  }
  self->_unsigned int state = v20;
  if (v5)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v35 = v23;
          __int16 v36 = 2080;
          unsigned int v37 = "-[VCAudioIO didStart:error:]";
          __int16 v38 = 1024;
          int v39 = 825;
          uint64_t v25 = " [%s] %s:%d Stream successfully started";
          uint64_t v26 = v24;
          uint32_t v27 = 28;
LABEL_35:
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v21 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v35 = v28;
          __int16 v36 = 2080;
          unsigned int v37 = "-[VCAudioIO didStart:error:]";
          __int16 v38 = 1024;
          int v39 = 825;
          __int16 v40 = 2112;
          uint64_t v41 = v21;
          __int16 v42 = 2048;
          v43 = self;
          uint64_t v25 = " [%s] %s:%d %@(%p) Stream successfully started";
          uint64_t v26 = v29;
          uint32_t v27 = 48;
          goto LABEL_35;
        }
      }
    }
  }
  else
  {
    [(VCAudioIO *)self cleanUpRealtimeDelegatesAndContext:0];
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioIO didStart:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v22 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        uint64_t v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v35 = v30;
          __int16 v36 = 2080;
          unsigned int v37 = "-[VCAudioIO didStart:error:]";
          __int16 v38 = 1024;
          int v39 = 828;
          __int16 v40 = 2112;
          uint64_t v41 = v22;
          __int16 v42 = 2048;
          v43 = self;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to start!!", buf, 0x30u);
        }
      }
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

void __28__VCAudioIO_didStart_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(const void **)(a1 + 40);

  _Block_release(v2);
}

- (void)didStop:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        stopCompletionBlock = (__CFString *)self->_stopCompletionBlock;
        *(_DWORD *)buf = 136315906;
        uint64_t v45 = v9;
        __int16 v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        __int16 v48 = 1024;
        int v49 = 836;
        __int16 v50 = 2048;
        uint64_t v51 = stopCompletionBlock;
        uint64_t v12 = " [%s] %s:%d completionHandler:%p";
        int v13 = v10;
        uint32_t v14 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v17 = self->_stopCompletionBlock;
        *(_DWORD *)buf = 136316418;
        uint64_t v45 = v15;
        __int16 v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        __int16 v48 = 1024;
        int v49 = 836;
        __int16 v50 = 2112;
        uint64_t v51 = v8;
        __int16 v52 = 2048;
        v53 = self;
        __int16 v54 = 2048;
        id v55 = v17;
        uint64_t v12 = " [%s] %s:%d %@(%p) completionHandler:%p";
        int v13 = v16;
        uint32_t v14 = 58;
        goto LABEL_11;
      }
    }
  }
  if (self->_state == 3) {
    goto LABEL_24;
  }
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      unsigned int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int state = self->_state;
        *(_DWORD *)buf = 136315906;
        uint64_t v45 = v19;
        __int16 v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        __int16 v48 = 1024;
        int v49 = 839;
        __int16 v50 = 1024;
        LODWORD(v51) = state;
        uint64_t v22 = " [%s] %s:%d Unexpected audioIO state:%d. Start may have been called before the didStop callback";
        uint64_t v23 = v20;
        uint32_t v24 = 34;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = self->_state;
        *(_DWORD *)buf = 136316418;
        uint64_t v45 = v25;
        __int16 v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        __int16 v48 = 1024;
        int v49 = 839;
        __int16 v50 = 2112;
        uint64_t v51 = v18;
        __int16 v52 = 2048;
        v53 = self;
        __int16 v54 = 1024;
        LODWORD(v55) = v27;
        uint64_t v22 = " [%s] %s:%d %@(%p) Unexpected audioIO state:%d. Start may have been called before the didStop callback";
        uint64_t v23 = v26;
        uint32_t v24 = 54;
        goto LABEL_23;
      }
    }
  }
LABEL_24:
  id v28 = self->_stopCompletionBlock;
  self->_stopCompletionBlock = 0;
  if (v28)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __27__VCAudioIO_didStop_error___block_invoke;
    v42[3] = &unk_1E6DB7D08;
    v42[5] = a4;
    v42[6] = v28;
    BOOL v43 = v5;
    v42[4] = self;
    dispatch_async(global_queue, v42);
  }
  [(VCAudioIO *)self cleanUpRealtimeDelegatesAndContext:0];
  self->_unsigned int state = 0;
  uint64_t v30 = (VCAudioIO *)objc_opt_class();
  if (v5)
  {
    if (v30 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        int v34 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v45 = v33;
          __int16 v46 = 2080;
          v47 = "-[VCAudioIO didStop:error:]";
          __int16 v48 = 1024;
          int v49 = 856;
          uint64_t v35 = " [%s] %s:%d Stream successfully stopped";
          __int16 v36 = v34;
          uint32_t v37 = 28;
LABEL_43:
          _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v31 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v38 = VRTraceErrorLogLevelToCSTR();
        int v39 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v45 = v38;
          __int16 v46 = 2080;
          v47 = "-[VCAudioIO didStop:error:]";
          __int16 v48 = 1024;
          int v49 = 856;
          __int16 v50 = 2112;
          uint64_t v51 = v31;
          __int16 v52 = 2048;
          v53 = self;
          uint64_t v35 = " [%s] %s:%d %@(%p) Stream successfully stopped";
          __int16 v36 = v39;
          uint32_t v37 = 48;
          goto LABEL_43;
        }
      }
    }
  }
  else if (v30 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioIO didStop:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v32 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      uint64_t v41 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v45 = v40;
        __int16 v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        __int16 v48 = 1024;
        int v49 = 858;
        __int16 v50 = 2112;
        uint64_t v51 = v32;
        __int16 v52 = 2048;
        v53 = self;
        _os_log_error_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop!!", buf, 0x30u);
      }
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

void __27__VCAudioIO_didStop_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        id v17 = "-[VCAudioIO didStop:error:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 847;
        uint64_t v8 = " [%s] %s:%d ";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 136316162;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        id v17 = "-[VCAudioIO didStop:error:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 847;
        __int16 v20 = 2112;
        uint64_t v21 = v2;
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        uint64_t v8 = " [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  (*(void (**)(void, void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40), v3, v4, v5);
  _Block_release(*(const void **)(a1 + 48));
}

- (void)controllerFormatChanged:(const tagVCAudioFrameFormat *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  long long v7 = *(_OWORD *)&a3->format.mBytesPerPacket;
  long long v6 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_controllerFormat.format.Float64 mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
  *(_OWORD *)&self->_controllerFormat.format.UInt32 mBytesPerPacket = v7;
  *(_OWORD *)&self->_controllerFormat.format.UInt32 mBitsPerChannel = v6;
  self->_controllerFormat.format.UInt32 mChannelsPerFrame = self->_clientFormat.format.mChannelsPerFrame;
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        Float64 mSampleRate = self->_controllerFormat.format.mSampleRate;
        uint64_t v12 = FourccToCStr(self->_controllerFormat.format.mFormatID);
        AudioFormatFlags mFormatFlags = self->_controllerFormat.format.mFormatFlags;
        UInt32 mBytesPerPacket = self->_controllerFormat.format.mBytesPerPacket;
        UInt32 mFramesPerPacket = self->_controllerFormat.format.mFramesPerPacket;
        UInt32 mBytesPerFrame = self->_controllerFormat.format.mBytesPerFrame;
        UInt32 mChannelsPerFrame = self->_controllerFormat.format.mChannelsPerFrame;
        UInt32 mBitsPerChannel = self->_controllerFormat.format.mBitsPerChannel;
        unsigned int samplesPerFrame = self->_controllerFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136317954;
        *(void *)&uint8_t v66[4] = v9;
        *(_WORD *)&v66[12] = 2080;
        *(void *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 879;
        WORD2(v67) = 2048;
        *(Float64 *)((char *)&v67 + 6) = mSampleRate;
        HIWORD(v67) = 2080;
        __int16 v68 = (VCAudioIO *)v12;
        *(_WORD *)v69 = 1024;
        *(_DWORD *)&v69[2] = mFormatFlags;
        *(_WORD *)&v69[6] = 1024;
        *(_DWORD *)&v69[8] = mBytesPerPacket;
        *(_WORD *)&v69[12] = 1024;
        *(_DWORD *)&v69[14] = mFramesPerPacket;
        *(_WORD *)&v69[18] = 1024;
        *(_DWORD *)&v69[20] = mBytesPerFrame;
        *(_WORD *)&v69[24] = 1024;
        *(_DWORD *)&v69[26] = mChannelsPerFrame;
        *(_WORD *)&v69[30] = 1024;
        *(_DWORD *)__int16 v70 = mBitsPerChannel;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = samplesPerFrame;
        __int16 v20 = " [%s] %s:%d Controller format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        uint64_t v21 = v10;
        uint32_t v22 = 90;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v66, v22);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        Float64 v25 = self->_controllerFormat.format.mSampleRate;
        uint64_t v26 = FourccToCStr(self->_controllerFormat.format.mFormatID);
        AudioFormatFlags v27 = self->_controllerFormat.format.mFormatFlags;
        UInt32 v28 = self->_controllerFormat.format.mBytesPerPacket;
        UInt32 v29 = self->_controllerFormat.format.mFramesPerPacket;
        UInt32 v30 = self->_controllerFormat.format.mBytesPerFrame;
        UInt32 v31 = self->_controllerFormat.format.mChannelsPerFrame;
        UInt32 v32 = self->_controllerFormat.format.mBitsPerChannel;
        unsigned int v33 = self->_controllerFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136318466;
        *(void *)&uint8_t v66[4] = v23;
        *(_WORD *)&v66[12] = 2080;
        *(void *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 879;
        WORD2(v67) = 2112;
        *(void *)((char *)&v67 + 6) = v8;
        HIWORD(v67) = 2048;
        __int16 v68 = self;
        *(_WORD *)v69 = 2048;
        *(Float64 *)&v69[2] = v25;
        *(_WORD *)&v69[10] = 2080;
        *(void *)&v69[12] = v26;
        *(_WORD *)&v69[20] = 1024;
        *(_DWORD *)&v69[22] = v27;
        *(_WORD *)&v69[26] = 1024;
        *(_DWORD *)&v69[28] = v28;
        *(_WORD *)__int16 v70 = 1024;
        *(_DWORD *)&v70[2] = v29;
        *(_WORD *)&v70[6] = 1024;
        *(_DWORD *)&v70[8] = v30;
        *(_WORD *)&v70[12] = 1024;
        *(_DWORD *)&v70[14] = v31;
        *(_WORD *)&v70[18] = 1024;
        *(_DWORD *)&v70[20] = v32;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = v33;
        __int16 v20 = " [%s] %s:%d %@(%p) Controller format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        uint64_t v21 = v24;
        uint32_t v22 = 110;
        goto LABEL_11;
      }
    }
  }
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      __int16 v36 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        Float64 v37 = self->_clientFormat.format.mSampleRate;
        uint64_t v38 = FourccToCStr(self->_clientFormat.format.mFormatID);
        AudioFormatFlags v39 = self->_clientFormat.format.mFormatFlags;
        UInt32 v40 = self->_clientFormat.format.mBytesPerPacket;
        UInt32 v41 = self->_clientFormat.format.mFramesPerPacket;
        UInt32 v42 = self->_clientFormat.format.mBytesPerFrame;
        UInt32 v43 = self->_clientFormat.format.mChannelsPerFrame;
        UInt32 v44 = self->_clientFormat.format.mBitsPerChannel;
        unsigned int v45 = self->_clientFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136317954;
        *(void *)&uint8_t v66[4] = v35;
        *(_WORD *)&v66[12] = 2080;
        *(void *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 889;
        WORD2(v67) = 2048;
        *(Float64 *)((char *)&v67 + 6) = v37;
        HIWORD(v67) = 2080;
        __int16 v68 = (VCAudioIO *)v38;
        *(_WORD *)v69 = 1024;
        *(_DWORD *)&v69[2] = v39;
        *(_WORD *)&v69[6] = 1024;
        *(_DWORD *)&v69[8] = v40;
        *(_WORD *)&v69[12] = 1024;
        *(_DWORD *)&v69[14] = v41;
        *(_WORD *)&v69[18] = 1024;
        *(_DWORD *)&v69[20] = v42;
        *(_WORD *)&v69[24] = 1024;
        *(_DWORD *)&v69[26] = v43;
        *(_WORD *)&v69[30] = 1024;
        *(_DWORD *)__int16 v70 = v44;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v45;
        __int16 v46 = " [%s] %s:%d Client format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v47 = v36;
        uint32_t v48 = 90;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_DEFAULT, v46, v66, v48);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v34 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      int v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      __int16 v50 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        Float64 v51 = self->_clientFormat.format.mSampleRate;
        __int16 v52 = FourccToCStr(self->_clientFormat.format.mFormatID);
        AudioFormatFlags v53 = self->_clientFormat.format.mFormatFlags;
        UInt32 v54 = self->_clientFormat.format.mBytesPerPacket;
        UInt32 v55 = self->_clientFormat.format.mFramesPerPacket;
        UInt32 v56 = self->_clientFormat.format.mBytesPerFrame;
        UInt32 v57 = self->_clientFormat.format.mChannelsPerFrame;
        UInt32 v58 = self->_clientFormat.format.mBitsPerChannel;
        unsigned int v59 = self->_clientFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136318466;
        *(void *)&uint8_t v66[4] = v49;
        *(_WORD *)&v66[12] = 2080;
        *(void *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 889;
        WORD2(v67) = 2112;
        *(void *)((char *)&v67 + 6) = v34;
        HIWORD(v67) = 2048;
        __int16 v68 = self;
        *(_WORD *)v69 = 2048;
        *(Float64 *)&v69[2] = v51;
        *(_WORD *)&v69[10] = 2080;
        *(void *)&v69[12] = v52;
        *(_WORD *)&v69[20] = 1024;
        *(_DWORD *)&v69[22] = v53;
        *(_WORD *)&v69[26] = 1024;
        *(_DWORD *)&v69[28] = v54;
        *(_WORD *)__int16 v70 = 1024;
        *(_DWORD *)&v70[2] = v55;
        *(_WORD *)&v70[6] = 1024;
        *(_DWORD *)&v70[8] = v56;
        *(_WORD *)&v70[12] = 1024;
        *(_DWORD *)&v70[14] = v57;
        *(_WORD *)&v70[18] = 1024;
        *(_DWORD *)&v70[20] = v58;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = v59;
        __int16 v46 = " [%s] %s:%d %@(%p) Client format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v47 = v50;
        uint32_t v48 = 110;
        goto LABEL_22;
      }
    }
  }
  long long v60 = *(_OWORD *)&a3->format.mSampleRate;
  long long v61 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_controllerFormat.format.UInt32 mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_controllerFormat.format.UInt32 mBitsPerChannel = v61;
  *(_OWORD *)&self->_controllerFormat.format.Float64 mSampleRate = v60;
  self->_isControllerAudioFormatValid = 1;
  BOOL v62 = memcmp(&self->_clientFormat, &self->_controllerFormat, 0x28uLL) != 0;
  self->_sinkData.isConverterNeeded = v62;
  LODWORD(v63) = self->_controllerFormat.samplesPerFrame;
  unsigned int v64 = vcvtad_u64_f64(self->_clientFormat.format.mSampleRate * (double)v63 / self->_controllerFormat.format.mSampleRate);
  self->_sourceData.isConverterNeeded = v62;
  BOOL v65 = self->_clientFormat.samplesPerFrame > v64;
  self->_sinkData.isAccumulatorNeeded = v65;
  self->_sourceData.isAccumulatorNeeded = v65;
  [(VCAudioIO *)self releaseConverters];
  [(VCAudioIO *)self createConverterForSource:1 error:0];
  [(VCAudioIO *)self createConverterForSource:0 error:0];
  [(VCAudioIOControllerClient *)self->_controllerClient setControllerFormat:&self->_controllerFormat];
  pthread_mutex_unlock(p_stateMutex);
}

- (void)didSuspend
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCAudioIO didSuspend]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 905;
        long long v6 = " [%s] %s:%d ";
        long long v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCAudioIO didSuspend]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 905;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        long long v6 = " [%s] %s:%d %@(%p) ";
        long long v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate", *(_OWORD *)v11, *(void *)&v11[16], v12, v13), "didSuspendAudioIO:", self);
}

- (void)didResume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCAudioIO didResume]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 910;
        long long v6 = " [%s] %s:%d ";
        long long v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCAudioIO didResume]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 910;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        long long v6 = " [%s] %s:%d %@(%p) ";
        long long v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate", *(_OWORD *)v11, *(void *)&v11[16], v12, v13), "didResumeAudioIO:", self);
}

- (void)serverDidDie
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint32_t v8 = "-[VCAudioIO serverDidDie]";
      __int16 v9 = 1024;
      int v10 = 920;
      __int16 v11 = 1024;
      int v12 = 920;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioIO.m:%d: ", (uint8_t *)&v5, 0x22u);
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate"), "serverDidDie");
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  id v4 = [(VCAudioIO *)self delegate];

  [v4 didUpdateBasebandCodec:a3];
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIOController = self->_audioIOController;
        controllerClient = self->_controllerClient;
        id delegate = self->_delegate;
        *(_DWORD *)buf = 136316418;
        uint64_t v35 = v7;
        __int16 v36 = 2080;
        Float64 v37 = "-[VCAudioIO startWithCompletionHandler:]";
        __int16 v38 = 1024;
        int v39 = 936;
        __int16 v40 = 2112;
        UInt32 v41 = audioIOController;
        __int16 v42 = 2112;
        UInt32 v43 = (VCAudioIO *)controllerClient;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)delegate;
        int v12 = " [%s] %s:%d Starting... audioController=%@, controllerClient=%@, delegate=%@";
        uint64_t v13 = v8;
        uint32_t v14 = 58;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v17 = self->_audioIOController;
        __int16 v18 = self->_controllerClient;
        id v19 = self->_delegate;
        *(_DWORD *)buf = 136316930;
        uint64_t v35 = v15;
        __int16 v36 = 2080;
        Float64 v37 = "-[VCAudioIO startWithCompletionHandler:]";
        __int16 v38 = 1024;
        int v39 = 936;
        __int16 v40 = 2112;
        UInt32 v41 = v6;
        __int16 v42 = 2048;
        UInt32 v43 = self;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v17;
        __int16 v46 = 2112;
        v47 = v18;
        __int16 v48 = 2112;
        id v49 = v19;
        int v12 = " [%s] %s:%d %@(%p) Starting... audioController=%@, controllerClient=%@, delegate=%@";
        uint64_t v13 = v16;
        uint32_t v14 = 78;
        goto LABEL_11;
      }
    }
  }
  if (self->_state)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    UInt32 v32 = @"state";
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v23 = v21;
    uint64_t v24 = -1;
  }
  else
  {
    self->_unsigned int state = 1;
    __int16 v20 = _Block_copy(a3);
    self->_id startCompletionBlock = v20;
    if (v20)
    {
      self->_sinkData.delegateContext.id delegate = (VCAudioIOSink *)objc_loadWeak(&self->_sinkDelegate);
      self->_sourceData.delegateContext.id delegate = (VCAudioIOSink *)objc_loadWeak(&self->_sourceDelegate);
      [(VCAudioIOControllerControl *)self->_audioIOController startClient:self->_controllerClient];
      pthread_mutex_unlock(p_stateMutex);
      return;
    }
    Float64 v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_state, @"state");
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v23 = v25;
    uint64_t v24 = -3;
  }
  uint64_t v26 = [v23 errorWithDomain:@"VCAudioIO" code:v24 userInfo:v22];
  pthread_mutex_unlock(p_stateMutex);
  if (!v26) {
    return;
  }
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_29;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    -[VCAudioIO startWithCompletionHandler:]();
    if (!a3) {
      return;
    }
LABEL_30:
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v26);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    AudioFormatFlags v27 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
  }
  else {
    AudioFormatFlags v27 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    UInt32 v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v35 = v28;
      __int16 v36 = 2080;
      Float64 v37 = "-[VCAudioIO startWithCompletionHandler:]";
      __int16 v38 = 1024;
      int v39 = 952;
      __int16 v40 = 2112;
      UInt32 v41 = v27;
      __int16 v42 = 2048;
      UInt32 v43 = self;
      __int16 v44 = 2112;
      uint64_t v45 = v26;
      _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Start failed. error:%@", buf, 0x3Au);
      if (!a3) {
        return;
      }
      goto LABEL_30;
    }
  }
LABEL_29:
  if (a3) {
    goto LABEL_30;
  }
}

- (id)start
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint32_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  __int16 v16 = __Block_byref_object_copy__18;
  id v17 = __Block_byref_object_dispose__18;
  uint64_t v18 = 0;
  uint64_t v3 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __18__VCAudioIO_start__block_invoke;
  v12[3] = &unk_1E6DB7D30;
  v12[5] = v3;
  v12[6] = &v13;
  v12[4] = self;
  [(VCAudioIO *)self startWithCompletionHandler:v12];
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioIO start]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint32_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v20 = v7;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCAudioIO start]";
          __int16 v23 = 1024;
          int v24 = 970;
          __int16 v25 = 2112;
          uint64_t v26 = v5;
          __int16 v27 = 2048;
          uint64_t v28 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) start timed out", buf, 0x30u);
        }
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCAudioIO" code:-4 userInfo:&unk_1F3DC8CC8];
    v14[5] = v9;
    [(VCAudioIO *)self stop];
  }
  else
  {
    id v6 = (id)v14[5];
  }
  dispatch_release(v3);
  int v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

intptr_t __18__VCAudioIO_start__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136316162;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        id v19 = "-[VCAudioIO start]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 964;
        __int16 v22 = 1024;
        *(_DWORD *)__int16 v23 = a2;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = a3;
        uint64_t v9 = " [%s] %s:%d Executing start completion handler, succeeded=%d error=%@";
        int v10 = v8;
        uint32_t v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 136316674;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        id v19 = "-[VCAudioIO start]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 964;
        __int16 v22 = 2112;
        *(void *)__int16 v23 = v6;
        *(_WORD *)&v23[8] = 2048;
        *(void *)&unsigned char v23[10] = v14;
        __int16 v24 = 1024;
        int v25 = a2;
        __int16 v26 = 2112;
        __int16 v27 = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) Executing start completion handler, succeeded=%d error=%@";
        int v10 = v13;
        uint32_t v11 = 64;
        goto LABEL_11;
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)stopWithCompletionHandlerInternal:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIOController = self->_audioIOController;
        controllerClient = self->_controllerClient;
        id delegate = (VCAudioIOControllerControl *)self->_delegate;
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v6;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioIO stopWithCompletionHandlerInternal:]";
        __int16 v35 = 1024;
        int v36 = 984;
        __int16 v37 = 2112;
        __int16 v38 = audioIOController;
        __int16 v39 = 2112;
        __int16 v40 = (VCAudioIO *)controllerClient;
        __int16 v41 = 2112;
        __int16 v42 = delegate;
        uint32_t v11 = " [%s] %s:%d Stopping... audioController=%@, controllerClient=%@, delegate=%@";
        uint64_t v12 = v7;
        uint32_t v13 = 58;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = self->_audioIOController;
        uint64_t v17 = self->_controllerClient;
        id v18 = self->_delegate;
        *(_DWORD *)buf = 136316930;
        uint64_t v32 = v14;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioIO stopWithCompletionHandlerInternal:]";
        __int16 v35 = 1024;
        int v36 = 984;
        __int16 v37 = 2112;
        __int16 v38 = v5;
        __int16 v39 = 2048;
        __int16 v40 = self;
        __int16 v41 = 2112;
        __int16 v42 = v16;
        __int16 v43 = 2112;
        __int16 v44 = v17;
        __int16 v45 = 2112;
        id v46 = v18;
        uint32_t v11 = " [%s] %s:%d %@(%p) Stopping... audioController=%@, controllerClient=%@, delegate=%@";
        uint64_t v12 = v15;
        uint32_t v13 = 78;
        goto LABEL_11;
      }
    }
  }
  if (!self->_state)
  {
    __int16 v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = @"state";
    uint64_t v30 = [NSNumber numberWithUnsignedInt:0];
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    __int16 v24 = v22;
    uint64_t v25 = -1;
    return (id)[v24 errorWithDomain:@"VCAudioIO" code:v25 userInfo:v23];
  }
  id stopCompletionBlock = self->_stopCompletionBlock;
  if (stopCompletionBlock) {
    _Block_release(stopCompletionBlock);
  }
  if (a3)
  {
    __int16 v20 = _Block_copy(a3);
    self->_id stopCompletionBlock = v20;
    if (!v20)
    {
      __int16 v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_state, @"state");
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      __int16 v24 = v26;
      uint64_t v25 = -3;
      return (id)[v24 errorWithDomain:@"VCAudioIO" code:v25 userInfo:v23];
    }
  }
  self->_unsigned int state = 3;
  [(VCAudioIOControllerControl *)self->_audioIOController stopClient:self->_controllerClient];
  return 0;
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  id v6 = [(VCAudioIO *)self stopWithCompletionHandlerInternal:a3];
  pthread_mutex_unlock(p_stateMutex);
  if (v6)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_12;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      -[VCAudioIO stopWithCompletionHandler:]();
      if (!a3) {
        return;
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v8 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v9 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_12:
        if (!a3) {
          return;
        }
        goto LABEL_13;
      }
      int v10 = 136316418;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      uint32_t v13 = "-[VCAudioIO stopWithCompletionHandler:]";
      __int16 v14 = 1024;
      int v15 = 1009;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stop failed. error:%@", (uint8_t *)&v10, 0x3Au);
      if (!a3) {
        return;
      }
    }
LABEL_13:
    (*((void (**)(id, void, id))a3 + 2))(a3, 0, v6);
  }
}

- (id)stop
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__18;
  __int16 v18 = __Block_byref_object_dispose__18;
  uint64_t v19 = 0;
  uint64_t v3 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __17__VCAudioIO_stop__block_invoke;
  v13[3] = &unk_1E6DB7D30;
  v13[5] = v3;
  v13[6] = &v14;
  v13[4] = self;
  [(VCAudioIO *)self stopWithCompletionHandler:v13];
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioIO stop]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCAudioIO *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v7;
          __int16 v24 = 2080;
          uint64_t v25 = "-[VCAudioIO stop]";
          __int16 v26 = 1024;
          int v27 = 1027;
          __int16 v28 = 2112;
          uint64_t v29 = v5;
          __int16 v30 = 2048;
          uint64_t v31 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stop timed out", buf, 0x30u);
        }
      }
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    __int16 v20 = @"state";
    uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_state];
    uint64_t v10 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"VCAudioIO", -4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15[5] = v10;
  }
  else
  {
    id v6 = (id)v15[5];
  }
  dispatch_release(v3);
  uint64_t v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

intptr_t __17__VCAudioIO_stop__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136316162;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCAudioIO stop]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 1021;
        __int16 v22 = 1024;
        *(_DWORD *)uint64_t v23 = a2;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = a3;
        uint64_t v9 = " [%s] %s:%d Executing stop completion handler, succeeded=%d error=%@";
        uint64_t v10 = v8;
        uint32_t v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 136316674;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCAudioIO stop]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 1021;
        __int16 v22 = 2112;
        *(void *)uint64_t v23 = v6;
        *(_WORD *)&v23[8] = 2048;
        *(void *)&unsigned char v23[10] = v14;
        __int16 v24 = 1024;
        int v25 = a2;
        __int16 v26 = 2112;
        int v27 = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) Executing stop completion handler, succeeded=%d error=%@";
        uint64_t v10 = v13;
        uint32_t v11 = 64;
        goto LABEL_11;
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (unsigned)state
{
  return self->_state;
}

+ (void)controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:ne"
                      "tworkClockID:remoteDeviceInfo:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No controller found for device role:%d", v2, *(const char **)v3, (unint64_t)"+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:]" >> 16, 309);
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioIO initWithConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Controller not found for device role:%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioIO initWithConfiguration:]" >> 16, 391);
}

- (void)reconfigureWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Controller not found for device role:%d", v2, v3, v4, v5);
}

- (void)reconfigureWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Operation not allowed while the audio IO is running", v2, v3, v4, v5, v6);
}

- (void)setFarEndVersionInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Operation not allowed while the audio IO is running", v2, v3, v4, v5, v6);
}

- (void)createConverterForSource:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The controller audio format is invalid!", v2, v3, v4, v5, v6);
}

- (void)didStart:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start!!", v2, v3, v4, v5, v6);
}

- (void)didStop:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to stop!!", v2, v3, v4, v5, v6);
}

- (void)startWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Start failed. error:%@");
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d start timed out", v2, v3, v4, v5, v6);
}

- (void)stopWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stop failed. error:%@");
}

- (void)stop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stop timed out", v2, v3, v4, v5, v6);
}

@end