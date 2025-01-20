@interface VCAudioStreamReceiveGroup
- (BOOL)addSyncDestination:(id)a3;
- (BOOL)configureStreams;
- (BOOL)isAudioExpected;
- (BOOL)isMuted;
- (BOOL)isPowerSpectrumEnabled;
- (BOOL)removeSyncDestination:(id)a3;
- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4;
- (VCAudioStreamReceiveGroup)initWithConfig:(id)a3;
- (VCMediaStreamSyncSource)syncSource;
- (id)startCapture;
- (id)stopCapture;
- (id)willStart;
- (int)deviceRole;
- (unsigned)audioChannelIndex;
- (void)collectAndLogChannelMetrics:(id *)a3;
- (void)dealloc;
- (void)didStart;
- (void)didStop;
- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4;
- (void)setActiveStreamIDs:(id)a3;
- (void)setAudioChannelIndex:(unsigned int)a3;
- (void)setMuteOnStreams;
- (void)setMuted:(BOOL)a3;
- (void)setOptedInStreamID:(id)a3;
- (void)setPowerSpectrumEnabled:(BOOL)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4;
- (void)vcMediaStream:(id)a3 didSwitchToAudioStreamWithID:(unsigned __int16)a4;
- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5;
@end

@implementation VCAudioStreamReceiveGroup

- (VCAudioStreamReceiveGroup)initWithConfig:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  v4 = -[VCMediaStreamReceiveGroup initWithConfig:](&v6, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = [[VCAudioStreamGroupCommon alloc] initWithConfig:a3 audioCallback:VCAudioStreamReceiveGroup_PullAudioSamples context:v4 audioDirection:1 stateQueue:v4->super.super._stateQueue];
    [(VCObject *)v4->_common setLogPrefix:[(VCObject *)v4 logPrefix]];
    if (v4->_common)
    {
      [(VCAudioStreamReceiveGroup *)v4 setMuteOnStreams];
      v4->_didPullSamplesCallback = objc_msgSend((id)objc_msgSend(a3, "audioStreamGroupConfig"), "didProcessSamplesCallback");
      v4->_didPullSamplesCallbackContext = objc_msgSend((id)objc_msgSend(a3, "audioStreamGroupConfig"), "didProcessSamplesCallbackContext");
      [(VCMediaStreamGroup *)v4 setCaptureController:v4];
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamReceiveGroup initWithConfig:]();
        }
      }
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamReceiveGroup;
  [(VCMediaStreamReceiveGroup *)&v3 dealloc];
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  stateQueue = self->super.super._stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__VCAudioStreamReceiveGroup_setDeviceRole_operatingMode___block_invoke;
  v7[3] = &unk_1E6DB3F80;
  v7[4] = self;
  v7[5] = &v10;
  int v8 = a3;
  int v9 = a4;
  dispatch_sync(stateQueue, v7);
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __57__VCAudioStreamReceiveGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 472) setDeviceRole:*(unsigned int *)(a1 + 48) operatingMode:*(unsigned int *)(a1 + 52)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deviceRole
{
  return [(VCAudioStreamGroupCommon *)self->_common deviceRole];
}

- (BOOL)isPowerSpectrumEnabled
{
  return [(VCAudioStreamGroupCommon *)self->_common isPowerSpectrumEnabled];
}

- (void)setPowerSpectrumEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCAudioStreamReceiveGroup_setPowerSpectrumEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__VCAudioStreamReceiveGroup_setPowerSpectrumEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setPowerSpectrumEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (unsigned)audioChannelIndex
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCAudioStreamReceiveGroup_audioChannelIndex__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__VCAudioStreamReceiveGroup_audioChannelIndex__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 472) audioChannelIndex];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAudioChannelIndex:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCAudioStreamReceiveGroup_setAudioChannelIndex___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __50__VCAudioStreamReceiveGroup_setAudioChannelIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAudioChannelIndex:*(unsigned int *)(a1 + 40)];
}

- (BOOL)isMuted
{
  return [(VCAudioStreamGroupCommon *)self->_common isMuted];
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCAudioStreamReceiveGroup_setMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __38__VCAudioStreamReceiveGroup_setMuted___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) setMuted:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 setMuteOnStreams];
}

- (BOOL)configureStreams
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:](self->_common, "configureStreams:withRateControlConfig:", self->super.super._mediaStreamInfoArray, objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"));
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)VCAudioStreamReceiveGroup;
    LOBYTE(v3) = [(VCMediaStreamGroup *)&v5 configureStreams];
  }
  return v3;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamGroup *)self state] == 1)
  {
    *(float *)&double v5 = self->_averageOutputPower;
    [(VCAudioStreamGroupCommon *)self->_common collectAndLogChannelMetrics:a3 averagePower:v5];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(VCObject *)self logPrefix];
        unint64_t speakerProcsCalled = self->_speakerProcsCalled;
        unint64_t syncTargetCalled = self->_syncTargetCalled;
        double averageOutputPower = self->_averageOutputPower;
        int v12 = 136316674;
        uint64_t v13 = v6;
        __int16 v14 = 2080;
        v15 = "-[VCAudioStreamReceiveGroup collectAndLogChannelMetrics:]";
        __int16 v16 = 1024;
        int v17 = 135;
        __int16 v18 = 2112;
        v19 = v8;
        __int16 v20 = 2048;
        unint64_t v21 = speakerProcsCalled;
        __int16 v22 = 2048;
        double v23 = averageOutputPower;
        __int16 v24 = 2048;
        unint64_t v25 = syncTargetCalled;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioStreamReceiveGroup %@ speakerProcsCalled=%ld, averageOutputPower=%f, syncTargetCalled=%ld", (uint8_t *)&v12, 0x44u);
      }
    }
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCAudioStreamReceiveGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCAudioStreamReceiveGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCAudioStreamReceiveGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return [*(id *)(*(void *)(a1 + 32) + 472) setReportingAgent:*(void *)(a1 + 40)];
}

- (void)setActiveStreamIDs:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCAudioStreamReceiveGroup_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__VCAudioStreamReceiveGroup_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (([v7 isEqual:*(void *)(*(void *)(a1 + 40) + 432)] & 1) == 0)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "objectForKeyedSubscript:", v7), "setTargetStreamID:", v7);
          [*(id *)(a1 + 40) setOptedInStreamID:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)setOptedInStreamID:(id)a3
{
  self->super._optedInStreamID = (NSNumber *)a3;
}

- (id)willStart
{
  self->_double averageOutputPower = NAN;
  return 0;
}

- (void)didStart
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  BOOL v3 = "-[VCAudioStreamReceiveGroup didStart]";
  __int16 v4 = 1024;
  int v5 = 173;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d System audio start capture failed on receive stream group with error=%@", v2, 0x26u);
}

- (void)didStop
{
}

- (BOOL)addSyncDestination:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  stateQueue = self->super.super._stateQueue;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke;
  v6[3] = &unk_1E6DB4590;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        char v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v5 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
          __int16 v6 = *(char **)(*(void *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316162;
          uint64_t v32 = v3;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 187;
          __int16 v37 = 2080;
          v38 = v5;
          __int16 v39 = 2048;
          v40 = v6;
          uint64_t v7 = " [%s] %s:%d Adding syncDestination=%s, common=%p";
          uint64_t v8 = v4;
          uint32_t v9 = 48;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = *(char **)(a1 + 40);
          uint64_t v13 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316674;
          uint64_t v32 = v10;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 187;
          __int16 v37 = 2112;
          v38 = v2;
          __int16 v39 = 2048;
          v40 = v12;
          __int16 v41 = 2080;
          v42 = v13;
          __int16 v43 = 2048;
          uint64_t v44 = v14;
          uint64_t v7 = " [%s] %s:%d %@(%p) Adding syncDestination=%s, common=%p";
          uint64_t v8 = v11;
          uint32_t v9 = 68;
          goto LABEL_12;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 472), "addSyncDestination:shouldSchedule:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state") != 0);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v15 = VCAudioStreamGroup_OverlayToken(*(void *)(*(void *)(a1 + 40) + 472));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      __int16 v16 = *(void **)(*(void *)(a1 + 40) + 168);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "stream"), "setOverlayToken:", v15);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v26 count:16];
        }
        while (v18);
      }
      uint64_t v21 = [*(id *)(a1 + 40) syncSource];
      if (v21)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) setSyncSource:v21];
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_1();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      double v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = FourccToCStr([*(id *)(a1 + 40) streamGroupID]);
        unint64_t v25 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v22;
        __int16 v33 = 2080;
        v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
        __int16 v35 = 1024;
        int v36 = 189;
        __int16 v37 = 2080;
        v38 = v24;
        __int16 v39 = 2080;
        v40 = v25;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add sync destination. streamGroup=%s syncDestination=%s", buf, 0x30u);
      }
    }
    return;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_2();
    }
  }
}

- (BOOL)removeSyncDestination:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  stateQueue = self->super.super._stateQueue;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke;
  v6[3] = &unk_1E6DB4590;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        char v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v5 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
          __int16 v6 = *(char **)(*(void *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316162;
          uint64_t v31 = v3;
          __int16 v32 = 2080;
          __int16 v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
          __int16 v34 = 1024;
          int v35 = 213;
          __int16 v36 = 2080;
          __int16 v37 = v5;
          __int16 v38 = 2048;
          __int16 v39 = v6;
          uint64_t v7 = " [%s] %s:%d Removing syncDestination=%s, common=%p";
          uint64_t v8 = v4;
          uint32_t v9 = 48;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = *(char **)(a1 + 40);
          uint64_t v13 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316674;
          uint64_t v31 = v10;
          __int16 v32 = 2080;
          __int16 v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
          __int16 v34 = 1024;
          int v35 = 213;
          __int16 v36 = 2112;
          __int16 v37 = v2;
          __int16 v38 = 2048;
          __int16 v39 = v12;
          __int16 v40 = 2080;
          __int16 v41 = v13;
          __int16 v42 = 2048;
          uint64_t v43 = v14;
          uint64_t v7 = " [%s] %s:%d %@(%p) Removing syncDestination=%s, common=%p";
          uint64_t v8 = v11;
          uint32_t v9 = 68;
          goto LABEL_12;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 472), "removeSyncDestination:shouldSchedule:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state") != 0);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v15 = VCAudioStreamGroup_OverlayToken(*(void *)(*(void *)(a1 + 40) + 472));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      __int16 v16 = *(void **)(*(void *)(a1 + 40) + 168);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "stream"), "setOverlayToken:", v15);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v25 count:16];
        }
        while (v18);
      }
      if ([*(id *)(a1 + 40) syncSource])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) setSyncSource:0];
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_1();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        double v23 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
        __int16 v24 = FourccToCStr([*(id *)(a1 + 40) streamGroupID]);
        *(_DWORD *)buf = 136316162;
        uint64_t v31 = v21;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
        __int16 v34 = 1024;
        int v35 = 215;
        __int16 v36 = 2080;
        __int16 v37 = v23;
        __int16 v38 = 2080;
        __int16 v39 = v24;
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed removing remove syncDestination=%s from streamGroup=%s", buf, 0x30u);
      }
    }
    return;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_2();
    }
  }
}

- (void)setMuteOnStreams
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v4 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mediaStreams);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setRemoteMuted:", -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted"));
      }
      uint64_t v5 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (VCMediaStreamSyncSource)syncSource
{
  if ([(VCMediaStreamGroup *)self streamGroupID] != 1835623287) {
    return 0;
  }
  mediaStreams = self->super.super._mediaStreams;

  return (VCMediaStreamSyncSource *)[(NSArray *)mediaStreams firstObject];
}

- (id)startCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common startCapture];
}

- (id)stopCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common stopCapture];
}

- (BOOL)isAudioExpected
{
  return self->super.super._state == 1;
}

- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke;
  v6[3] = &unk_1E6DB45E0;
  v6[4] = self;
  BOOL v7 = a4;
  *(double *)&v6[5] = a5;
  dispatch_async(stateQueue, v6);
}

unsigned char *__71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[528])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t result = (unsigned char *)[result isAudioExpected];
      if (result)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v3 = VRTraceErrorLogLevelToCSTR();
          uint64_t v4 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v5 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 136315906;
            uint64_t v25 = v3;
            __int16 v26 = 2080;
            long long v27 = "-[VCAudioStreamReceiveGroup vcMediaStream:remoteMediaStalled:duration:]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 284;
            __int16 v30 = 2048;
            uint64_t v31 = v5;
            _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio is stalling with duration %f", buf, 0x26u);
          }
        }
        uint64_t v6 = *(void **)(a1 + 32);
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        uint64_t v19 = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_12;
        __int16 v20 = &unk_1E6DB45B8;
        uint64_t v21 = v6;
        LOBYTE(v23) = *(unsigned char *)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 40);
        BOOL v7 = &v17;
        return (unsigned char *)objc_msgSend(v6, "callDelegateWithBlock:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
      }
      if (*(unsigned char *)(a1 + 48)) {
        return result;
      }
    }
    if (*(double *)(a1 + 40) != 0.0) {
      return result;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = v8;
        __int16 v26 = 2080;
        long long v27 = "-[VCAudioStreamReceiveGroup vcMediaStream:remoteMediaStalled:duration:]_block_invoke_2";
        __int16 v28 = 1024;
        int v29 = 289;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio has stopped stalling", buf, 0x1Cu);
      }
    }
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_15;
    uint64_t v13 = &unk_1E6DB45B8;
    uint64_t v14 = v6;
    LOBYTE(v16) = *(unsigned char *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 40);
    BOOL v7 = &v10;
    return (unsigned char *)objc_msgSend(v6, "callDelegateWithBlock:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  return result;
}

uint64_t __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) remoteMediaStalled:*(unsigned __int8 *)(a1 + 48) duration:*(double *)(a1 + 40)];
}

uint64_t __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) remoteMediaStalled:*(unsigned __int8 *)(a1 + 48) duration:*(double *)(a1 + 40)];
}

- (void)vcMediaStream:(id)a3 didSwitchToAudioStreamWithID:(unsigned __int16)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke;
  block[3] = &unk_1E6DB4658;
  unsigned __int16 v6 = a4;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 440) isEqualToNumber:v2];
  if ((result & 1) == 0)
  {
    __int16 v4 = [*(id *)(*(void *)(a1 + 32) + 440) shortValue];
    *(unsigned char *)(*(void *)(a1 + 32) + 528) = *(_WORD *)(a1 + 40) == 0;
    [*(id *)(a1 + 32) setActiveStreamID:v2];
    uint64_t v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_2;
    v8[3] = &unk_1E6DB4608;
    v8[4] = v5;
    __int16 v9 = v4;
    __int16 v10 = *(_WORD *)(a1 + 40);
    [v5 callDelegateWithBlock:v8];
    unsigned __int16 v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_3;
    v7[3] = &unk_1E6DB4630;
    v7[4] = v6;
    return [v6 callDelegateWithBlock:v7];
  }
  return result;
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didSwitchFromStreamID:*(unsigned __int16 *)(a1 + 40) toStreamID:*(unsigned __int16 *)(a1 + 42)];
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 didChangeReceivingStreamsForStreamGroup:*(void *)(a1 + 32)];
}

- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  *(double *)&void block[5] = v5;
  dispatch_async(stateQueue, block);
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setFirstMediaFrameReceivedTime:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  objc_msgSendSuper2(&v6, sel_finalizePerfTimersForFirstMediaFrameWithTime_, v2);
  VCPerfTimingUtilsSetStopForKeyOnceWithTime(*(void **)(*(void *)(a1 + 32) + 240), 5, *(double *)(a1 + 40));
  [*(id *)(a1 + 32) reportParticipantsPerfTimings];
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2;
  v5[3] = &unk_1E6DB4630;
  v5[4] = v3;
  return [v3 callDelegateWithBlock:v5];
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didReceiveFirstFrameForStreamGroup:*(void *)(a1 + 32)];
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  -[VCMediaStreamGroup mediaStream:didReceiveNewMediaKeyIndex:](&v6, sel_mediaStream_didReceiveNewMediaKeyIndex_, a3);
  [(VCMediaStreamGroup *)self setupPerfTimersWithMediaKeyIndex:a4 perfTimerIndexToStart:5];
}

void __VCAudioStreamReceiveGroup_UpdateAudioPriority_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 48)];
  double v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCAudioStreamGroupCommon", v2, v3, v4, v5, v6);
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set sync source on sync destination", v2, v3, v4, v5, v6);
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set sync source on sync destination", v2, v3, v4, v5, v6);
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
}

@end