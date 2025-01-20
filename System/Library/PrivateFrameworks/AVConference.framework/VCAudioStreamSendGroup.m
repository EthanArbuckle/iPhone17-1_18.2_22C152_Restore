@interface VCAudioStreamSendGroup
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (BOOL)addSyncDestination:(id)a3;
- (BOOL)configureAudioStreams:(id)a3 deviceRole:(int)a4 operatingMode:(int)a5;
- (BOOL)configureStreams;
- (BOOL)createIOEventQueues;
- (BOOL)isCurrentDTXEnabled;
- (BOOL)isMuted;
- (BOOL)isPowerSpectrumEnabled;
- (BOOL)isVADFilteringEnabled;
- (BOOL)removeSyncDestination:(id)a3;
- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)setupStreamGroupWithConfig:(id)a3;
- (BOOL)startCaptureIfNeeded:(BOOL)a3;
- (BOOL)stopCaptureForEndToEndStreamIfNeeded;
- (VCAudioStreamGroupCommon)common;
- (VCAudioStreamSendGroup)initWithConfig:(id)a3;
- (id)activeStreamKeys;
- (id)checkStreamsForAdditionalOptIn:(id)a3;
- (id)setupRedundancyControllerForMode:(unsigned int)a3;
- (id)startCapture;
- (id)stopCapture;
- (id)willStart;
- (int)deviceRole;
- (unsigned)cellularUniqueTag;
- (void)cleanupIOEventQueues;
- (void)collectAndLogChannelMetrics:(id *)a3;
- (void)createIOEventQueues;
- (void)dealloc;
- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4;
- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4;
- (void)didStop;
- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6;
- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3;
- (void)flushAudioEventQueue;
- (void)flushAudioRedundancyEventQueue;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setCellularUniqueTag:(unsigned int)a3;
- (void)setCurrentDTXEnabled:(BOOL)a3;
- (void)setMuteOnStreams;
- (void)setMuted:(BOOL)a3;
- (void)setPowerSpectrumEnabled:(BOOL)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)setVADFilteringEnabled:(BOOL)a3;
- (void)startDynamicDucker;
- (void)startVoiceActivityDetection;
- (void)stopDynamicDucker;
- (void)stopVoiceActivityDetection;
- (void)updateActiveVoiceOnly:(BOOL)a3;
- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4;
@end

@implementation VCAudioStreamSendGroup

- (VCAudioStreamSendGroup)initWithConfig:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v6, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = [[VCAudioStreamGroupCommon alloc] initWithConfig:a3 audioCallback:VCAudioStreamSendGroup_PushAudioSamples context:v4 audioDirection:2 stateQueue:v4->super.super._stateQueue];
    [(VCObject *)v4->_common setLogPrefix:[(VCObject *)v4 logPrefix]];
    if (v4->_common)
    {
      [(VCAudioStreamSendGroup *)v4 setMuteOnStreams];
      [(VCMediaStreamGroup *)v4 setCaptureController:v4];
      v4->_forcedAudioPriorityValue = [+[VCDefaults sharedInstance] forceAudioPriorityValue];
      v4->_forcedAudioPriorityEnabled = [+[VCDefaults sharedInstance] forceAudioPriorityEnabled];
      v4->_lastAudioPriority = 0;
      v4->_systemAudioCaptureSession = (VCSystemAudioCaptureSession *)(id)[a3 systemAudioCaptureSession];
      v4->_shouldScheduleMediaQueue = [a3 shouldScheduleMediaQueue];
      if ([(VCAudioStreamSendGroup *)v4 createIOEventQueues]) {
        return v4;
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup initWithConfig:]();
        }
      }
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup initWithConfig:]();
        }
      }
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCAudioStreamSendGroup *)self flushAudioEventQueue];
  [(VCAudioStreamSendGroup *)self flushAudioRedundancyEventQueue];
  [(VCAudioStreamSendGroup *)self cleanupIOEventQueues];

  [(VCRedundancyControllerProtocol *)self->super._redundancyController unregisterStatistics];
  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
  {
    CFRelease(mediaQueue);
    self->_mediaQueue = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetector);

  v4.receiver = self;
  v4.super_class = (Class)VCAudioStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v4 dealloc];
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_shouldScheduleMediaQueue = [a3 shouldScheduleMediaQueue];
  [(VCAudioStreamGroupCommon *)self->_common cleanupStreams];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamSendGroup;
  return [(VCMediaStreamSendGroup *)&v6 setupStreamGroupWithConfig:a3];
}

- (BOOL)stopCaptureForEndToEndStreamIfNeeded
{
  if (self->super._streamGroupMode != 1
    || [(VCAudioIO *)[(VCAudioStreamGroupCommon *)self->_common audioIO] state] != 2)
  {
    return 0;
  }
  [(VCAudioStreamGroupCommon *)self->_common stopCapture];
  return 1;
}

- (BOOL)startCaptureIfNeeded:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && (id v4 = [(VCAudioStreamGroupCommon *)self->_common startCapture]) != 0)
  {
    id v5 = v4;
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        -[VCAudioStreamSendGroup startCaptureIfNeeded:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v6 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        int v11 = 136316418;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        v14 = "-[VCAudioStreamSendGroup startCaptureIfNeeded:]";
        __int16 v15 = 1024;
        int v16 = 149;
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2048;
        v20 = self;
        __int16 v21 = 2112;
        id v22 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Starting capture failed with error=%@", (uint8_t *)&v11, 0x3Au);
      }
    }
    LOBYTE(v7) = 0;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  stateQueue = self->super.super._stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke;
  v7[3] = &unk_1E6DB7008;
  v7[4] = self;
  v7[5] = &v10;
  int v8 = a3;
  int v9 = a4;
  dispatch_sync(stateQueue, v7);
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) stopCaptureForEndToEndStreamIfNeeded];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 760) setDeviceRole:*(unsigned int *)(a1 + 48) operatingMode:*(unsigned int *)(a1 + 52)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 864) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 760), "audioIO"), "supportsVoiceActivityDetection");
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v3 + 472) == 1
      && (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)v3 configureAudioStreams:*(void *)(v3 + 168) deviceRole:*(unsigned int *)(a1 + 48) operatingMode:*(unsigned int *)(a1 + 52)], uint64_t v3 = *(void *)(a1 + 32), !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_2();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v27 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          v27 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = *(void *)(a1 + 32);
            int v36 = 136316162;
            uint64_t v37 = v34;
            __int16 v38 = 2080;
            v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
            __int16 v40 = 1024;
            int v41 = 167;
            __int16 v42 = 2112;
            *(void *)v43 = v27;
            *(_WORD *)&v43[8] = 2048;
            uint64_t v44 = v35;
            v31 = " [%s] %s:%d %@(%p) Failed to configureAudioStreams";
            goto LABEL_47;
          }
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)v3 startCaptureIfNeeded:v2];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        goto LABEL_5;
      }
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_3();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v26 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          v26 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            int v36 = 136316162;
            uint64_t v37 = v32;
            __int16 v38 = 2080;
            v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
            __int16 v40 = 1024;
            int v41 = 170;
            __int16 v42 = 2112;
            *(void *)v43 = v26;
            *(_WORD *)&v43[8] = 2048;
            uint64_t v44 = v33;
            v31 = " [%s] %s:%d %@(%p) Failed to restart capture";
            goto LABEL_47;
          }
        }
      }
    }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        int v36 = 136316162;
        uint64_t v37 = v28;
        __int16 v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        __int16 v40 = 1024;
        int v41 = 161;
        __int16 v42 = 2112;
        *(void *)v43 = v25;
        *(_WORD *)&v43[8] = 2048;
        uint64_t v44 = v30;
        v31 = " [%s] %s:%d %@(%p) Failed to setDeviceRole";
LABEL_47:
        _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v36, 0x30u);
      }
    }
  }
LABEL_5:
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      objc_super v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(a1 + 48);
        int v8 = *(_DWORD *)(a1 + 52);
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = *(unsigned __int8 *)(v9 + 864);
        int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        int v12 = *(_DWORD *)(v9 + 472);
        LODWORD(v9) = *(unsigned __int8 *)(*(void *)(v9 + 760) + 168);
        int v36 = 136317186;
        uint64_t v37 = v5;
        __int16 v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        __int16 v40 = 1024;
        int v41 = 172;
        __int16 v42 = 1024;
        *(_DWORD *)v43 = v7;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v8;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = v11;
        HIWORD(v44) = 1024;
        *(_DWORD *)v45 = v10;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)v46 = v12;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)v47 = v9;
        char v13 = " [%s] %s:%d Setting deviceRole=%d, operatingMode=%u, didSucceed=%{BOOL}d, audioControllerSupportsVoiceActi"
              "vityDetection=%{BOOL}d, streamGroupMode=%u, isMediaPriorityEnabled=%{BOOL}d";
        uint64_t v14 = v6;
        uint32_t v15 = 64;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v36, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = *(_DWORD *)(a1 + 48);
        int v19 = *(_DWORD *)(a1 + 52);
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = *(unsigned __int8 *)(v20 + 864);
        int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        int v23 = *(_DWORD *)(v20 + 472);
        int v24 = *(unsigned __int8 *)(*(void *)(v20 + 760) + 168);
        int v36 = 136317698;
        uint64_t v37 = v16;
        __int16 v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        __int16 v40 = 1024;
        int v41 = 172;
        __int16 v42 = 2112;
        *(void *)v43 = v4;
        *(_WORD *)&v43[8] = 2048;
        uint64_t v44 = v20;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v18;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v19;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = v22;
        __int16 v48 = 1024;
        int v49 = v21;
        __int16 v50 = 1024;
        int v51 = v23;
        __int16 v52 = 1024;
        int v53 = v24;
        char v13 = " [%s] %s:%d %@(%p) Setting deviceRole=%d, operatingMode=%u, didSucceed=%{BOOL}d, audioControllerSupportsVo"
              "iceActivityDetection=%{BOOL}d, streamGroupMode=%u, isMediaPriorityEnabled=%{BOOL}d";
        uint64_t v14 = v17;
        uint32_t v15 = 84;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)configureAudioStreams:(id)a3 deviceRole:(int)a4 operatingMode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v39 = [a3 countByEnumeratingWithState:&v59 objects:v58 count:16];
  if (!v39) {
    goto LABEL_31;
  }
  int v36 = self;
  uint64_t v38 = *(void *)v60;
  if (a4 == 3) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 5;
  }
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v60 != v38) {
      objc_enumerationMutation(a3);
    }
    int v10 = *(void **)(*((void *)&v59 + 1) + 8 * v9);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    int v11 = (void *)[v10 streamConfigs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          [v16 setAudioStreamMode:v8];
          [v16 setOneToOneOperatingMode:v5];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v53 count:16];
      }
      while (v13);
    }
    __int16 v17 = (void *)[v10 stream];
    int v18 = [v17 state];
    int v19 = [v17 state];
    int v20 = v19;
    BOOL v21 = v18 == 2 || v19 == 4;
    int v22 = v21;
    if (v21 || [v17 state])
    {
      uint64_t v40 = [v17 stop];
      if (v40)
      {
        if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:].cold.4();
            }
          }
          goto LABEL_31;
        }
        if (objc_opt_respondsToSelector()) {
          v25 = (__CFString *)[(VCAudioStreamSendGroup *)v36 performSelector:sel_logPrefix];
        }
        else {
          v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_31;
        }
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        uint64_t v30 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v42 = v29;
        __int16 v43 = 2080;
        uint64_t v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
        __int16 v45 = 1024;
        int v46 = 196;
        __int16 v47 = 2112;
        __int16 v48 = v25;
        __int16 v49 = 2048;
        __int16 v50 = v36;
        v31 = " [%s] %s:%d %@(%p) stop audio stream failed";
LABEL_74:
        _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
        goto LABEL_31;
      }
    }
    if ((objc_msgSend(v17, "setStreamConfig:withError:", objc_msgSend(v10, "streamConfigs"), &v40) & 1) == 0)
    {
      if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v23) {
            return v23;
          }
          -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]();
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v24 = (__CFString *)[(VCAudioStreamSendGroup *)v36 performSelector:sel_logPrefix];
        }
        else {
          int v24 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v27 = VRTraceErrorLogLevelToCSTR();
          uint64_t v28 = *MEMORY[0x1E4F47A50];
          BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v23) {
            return v23;
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v42 = v27;
          __int16 v43 = 2080;
          uint64_t v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
          __int16 v45 = 1024;
          int v46 = 200;
          __int16 v47 = 2112;
          __int16 v48 = v24;
          __int16 v49 = 2048;
          __int16 v50 = v36;
          __int16 v51 = 2112;
          uint64_t v52 = v40;
          _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) configuring audio stream failed error=%@", buf, 0x3Au);
        }
      }
      LOBYTE(v23) = 0;
      return v23;
    }
    if (v22) {
      break;
    }
LABEL_29:
    if (++v9 == v39)
    {
      uint64_t v39 = [a3 countByEnumeratingWithState:&v59 objects:v58 count:16];
      if (v39) {
        goto LABEL_5;
      }
      goto LABEL_31;
    }
  }
  uint64_t v40 = [v17 start];
  if (v40)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCAudioStreamSendGroup *)v36 performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_31;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    uint64_t v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v33;
    __int16 v43 = 2080;
    uint64_t v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
    __int16 v45 = 1024;
    int v46 = 204;
    __int16 v47 = 2112;
    __int16 v48 = v26;
    __int16 v49 = 2048;
    __int16 v50 = v36;
    v31 = " [%s] %s:%d %@(%p) start audio stream failed";
    goto LABEL_74;
  }
  if (v20 != 4) {
    goto LABEL_29;
  }
  uint64_t v40 = [v17 setPause:1];
  if (!v40) {
    goto LABEL_29;
  }
  if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v32 = (__CFString *)[(VCAudioStreamSendGroup *)v36 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v42 = v34;
        __int16 v43 = 2080;
        uint64_t v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
        __int16 v45 = 1024;
        int v46 = 208;
        __int16 v47 = 2112;
        __int16 v48 = v32;
        __int16 v49 = 2048;
        __int16 v50 = v36;
        v31 = " [%s] %s:%d %@(%p) pause audio stream failed";
        goto LABEL_74;
      }
    }
  }
LABEL_31:
  LOBYTE(v23) = 1;
  return v23;
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
  block[2] = __50__VCAudioStreamSendGroup_setPowerSpectrumEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __50__VCAudioStreamSendGroup_setPowerSpectrumEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 760) setPowerSpectrumEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setBasebandCongestionDetector:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCAudioStreamSendGroup_setBasebandCongestionDetector___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __56__VCAudioStreamSendGroup_setBasebandCongestionDetector___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];

  *(void *)(*(void *)(a1 + 32) + 744) = *(id *)(a1 + 40);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "stream"), "setBasebandCongestionDetector:", *(void *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)setVADFilteringEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCAudioStreamSendGroup_setVADFilteringEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __49__VCAudioStreamSendGroup_setVADFilteringEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 737) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) updateActiveVoiceOnly:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateActiveVoiceOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->super.super._mediaStreamInfoArray;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v35;
    *(void *)&long long v6 = 136316162;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "stream", v19);
        [v10 setSendActiveVoiceOnly:v3];
        if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            int v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              uint64_t v22 = v17;
              __int16 v23 = 2080;
              int v24 = "-[VCAudioStreamSendGroup updateActiveVoiceOnly:]";
              __int16 v25 = 1024;
              int v26 = 251;
              __int16 v27 = 1024;
              *(_DWORD *)uint64_t v28 = v3;
              *(_WORD *)&v28[4] = 2112;
              *(void *)&v28[6] = v10;
              uint64_t v14 = v18;
              uint32_t v15 = " [%s] %s:%d Send active voice only set to %d for stream=%@";
              uint32_t v16 = 44;
              goto LABEL_15;
            }
          }
        }
        else
        {
          long long v11 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            long long v11 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            uint64_t v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              uint64_t v22 = v12;
              __int16 v23 = 2080;
              int v24 = "-[VCAudioStreamSendGroup updateActiveVoiceOnly:]";
              __int16 v25 = 1024;
              int v26 = 251;
              __int16 v27 = 2112;
              *(void *)uint64_t v28 = v11;
              *(_WORD *)&v28[8] = 2048;
              *(void *)&v28[10] = self;
              __int16 v29 = 1024;
              BOOL v30 = v3;
              __int16 v31 = 2112;
              uint64_t v32 = v10;
              uint64_t v14 = v13;
              uint32_t v15 = " [%s] %s:%d %@(%p) Send active voice only set to %d for stream=%@";
              uint32_t v16 = 64;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              continue;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super.super._stateQueue);
  if (VCConnection_IsEndToEndLink((uint64_t)a3) && self->super._streamGroupMode == 1)
  {
    id v5 = [(VCMediaStreamSendGroup *)self dispatchedMediaStreamInfosForEndToEndConnection:1];
    id v18 = a3;
    uint64_t v6 = [a3 isWifiToWifi];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v12 = (void *)[v11 streamConfigs];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                [*(id *)(*((void *)&v22 + 1) + 8 * v16++) setUseWifiTiers:v6];
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v21 count:16];
            }
            while (v14);
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v8);
    }
    long long v19 = self;
    uint64_t v17 = (objc_super *)&v19;
    a3 = v18;
  }
  else
  {
    v20.receiver = self;
    uint64_t v17 = &v20;
  }
  v17->super_class = (Class)VCAudioStreamSendGroup;
  [(objc_super *)v17 dispatchedUpdateStreamsWithActiveConnection:a3];
}

- (void)setCurrentDTXEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCAudioStreamSendGroup_setCurrentDTXEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCAudioStreamSendGroup_setCurrentDTXEnabled___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 738) = *(unsigned char *)(a1 + 40);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "stream"), "setCurrentDTXEnable:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCAudioStreamSendGroup_updateVoiceActivityEnabled_isMediaPriorityEnabled___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __76__VCAudioStreamSendGroup_updateVoiceActivityEnabled_isMediaPriorityEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 760) updateVoiceActivityEnabled:*(unsigned __int8 *)(a1 + 40) isMediaPriorityEnabled:*(unsigned __int8 *)(a1 + 41)];
}

- (id)willStart
{
  [(VCAudioStreamSendGroup *)self flushAudioEventQueue];
  [(VCAudioStreamSendGroup *)self flushAudioRedundancyEventQueue];
  [(VCAudioStreamGroupCommon *)self->_common startAudioDump];
  self->_averageInputPower = NAN;
  [(VCAudioStreamSendGroup *)self startVoiceActivityDetection];
  if ([(VCMediaStreamGroup *)self streamGroupID] == 1835623282
    || [(VCMediaStreamGroup *)self streamGroupID] == 1835623287)
  {
    [(VCAudioStreamSendGroup *)self startDynamicDucker];
  }
  uint64_t streamGroupMode = self->super._streamGroupMode;

  return [(VCAudioStreamSendGroup *)self setupRedundancyControllerForMode:streamGroupMode];
}

- (void)didStop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCAudioStreamGroupCommon *)self->_common stopAudioDump];
  [(VCAudioStreamSendGroup *)self stopVoiceActivityDetection];
  if ([(VCMediaStreamGroup *)self streamGroupID] == 1835623282
    || [(VCMediaStreamGroup *)self streamGroupID] == 1835623287)
  {
    [(VCAudioStreamSendGroup *)self stopDynamicDucker];
  }
  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v3 didStop];
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
  block[2] = __35__VCAudioStreamSendGroup_setMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __35__VCAudioStreamSendGroup_setMuted___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 760) setMuted:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setMuteOnStreams];
}

- (BOOL)configureStreams
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:](self->_common, "configureStreams:withRateControlConfig:", self->super.super._mediaStreamInfoArray, objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"));
  if (v3)
  {
    if (!self->_mediaQueue)
    {
      uint64_t v4 = (tagVCMediaQueue *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"), "vcMediaQueue");
      if (v4) {
        uint64_t v4 = (tagVCMediaQueue *)CFRetain(v4);
      }
      self->_mediaQueue = v4;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
    uint64_t v6 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(mediaStreamInfoArray);
          }
          long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v11 = (void *)[v10 streamConfigs];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v18 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v19 + 1) + 8 * j) setCellularUniqueTag:self->_cellularUniqueTag];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v18 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v24 objects:v23 count:16];
      }
      while (v7);
    }
    v17.receiver = self;
    v17.super_class = (Class)VCAudioStreamSendGroup;
    LOBYTE(v3) = [(VCMediaStreamGroup *)&v17 configureStreams];
  }
  return v3;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  if ([(VCMediaStreamGroup *)self state] == 1)
  {
    common = self->_common;
    *(float *)&double v5 = self->_averageInputPower;
    [(VCAudioStreamGroupCommon *)common collectAndLogChannelMetrics:a3 averagePower:v5];
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCAudioStreamSendGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __44__VCAudioStreamSendGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCAudioStreamSendGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return [*(id *)(*(void *)(a1 + 32) + 760) setReportingAgent:*(void *)(a1 + 40)];
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v12;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        __int16 v33 = 1024;
        int v34 = 360;
        __int16 v35 = 2080;
        long long v36 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
        __int16 v37 = 2112;
        uint64_t v38 = a3;
        __int16 v39 = 2112;
        uint64_t v40 = a5;
        __int16 v41 = 1024;
        LODWORD(v42) = a4;
        uint64_t v14 = " [%s] %s:%d StreamGroup=%s streamIDs=%@ mediaBitrates=%@ for targetBitrate=%d";
        uint64_t v15 = v13;
        uint32_t v16 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v11 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      long long v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      id v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        uint64_t v30 = v17;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        __int16 v33 = 1024;
        int v34 = 360;
        __int16 v35 = 2112;
        long long v36 = (char *)v11;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2080;
        uint64_t v40 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
        __int16 v41 = 2112;
        id v42 = a3;
        __int16 v43 = 2112;
        id v44 = a5;
        __int16 v45 = 1024;
        unsigned int v46 = a4;
        uint64_t v14 = " [%s] %s:%d %@(%p) StreamGroup=%s streamIDs=%@ mediaBitrates=%@ for targetBitrate=%d";
        uint64_t v15 = v18;
        uint32_t v16 = 84;
        goto LABEL_11;
      }
    }
  }
  long long v19 = (unsigned __int8 *)VCMemoryPool_Alloc((OSQueueHead *)self->_audioStreamUpdatePool);
  *long long v19 = [a3 count];
  v19[18] = [(VCMediaStreamSendGroup *)self v2PayloadsAllowed];
  if ((int)[a3 count] >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      *(_WORD *)&v19[2 * v20 + 2] = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v20), "unsignedShortValue");
      id v21 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", [a3 objectAtIndexedSubscript:v20]);
      if (v21 && self->super._streamGroupMode == 1) {
        objc_msgSend(v21, "setTargetBitrate:rateChangeCounter:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v20), "unsignedIntValue"), v6);
      }
      ++v20;
    }
    while (v20 < (int)[a3 count]);
  }
  _VCAudioStreamSendGroup_ProcessActiveStreams((uint64_t)self, v19, (uint64_t)&__block_literal_global_43);
  int v22 = *v19;
  if (self->_lastEnqueuedStreamUpdateEventWasEmpty && v22 == 0) {
    goto LABEL_33;
  }
  if (CMSimpleQueueEnqueue(self->_audioStreamUpdateEventQueue, v19))
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v24 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        long long v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = *v19;
          *(_DWORD *)buf = 136316418;
          uint64_t v30 = v27;
          __int16 v31 = 2080;
          uint64_t v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          __int16 v33 = 1024;
          int v34 = 392;
          __int16 v35 = 2112;
          long long v36 = (char *)v24;
          __int16 v37 = 2048;
          uint64_t v38 = self;
          __int16 v39 = 1024;
          LODWORD(v40) = v26;
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full! Dropping audio stream update event with %d active streams", buf, 0x36u);
        }
      }
    }
LABEL_33:
    VCMemoryPool_Free((OSQueueHead *)self->_audioStreamUpdatePool, v19);
  }
  self->_lastEnqueuedStreamUpdateEventWasEmpty = v22 == 0;
  v28.receiver = self;
  v28.super_class = (Class)VCAudioStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v28 dispatchedUpdateActiveMediaStreamIDs:a3 withTargetBitrate:a4 mediaBitrates:a5 rateChangeCounter:v6];
}

void __113__VCAudioStreamSendGroup_dispatchedUpdateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  if (a3)
  {
    LODWORD(v7) = a5;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v7)
    {
      uint64_t v7 = v7;
      do
      {
        unsigned int v10 = *a4++;
        objc_msgSend(v9, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v10));
        --v7;
      }
      while (v7);
    }
    [*(id *)(a2 + 40) setCompoundStreamIDs:v9];
  }
  if (*(unsigned char *)(a2 + 9))
  {
    long long v11 = *(void **)(a2 + 40);
    [v11 setRtcpEnabled:a3];
  }
}

- (id)activeStreamKeys
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(VCAudioStreamGroupCommon *)self->_common audioStreams];
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      if (v5->var1)
      {
        uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5->var7, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
        if (v6) {
          uint64_t v7 = [NSNumber numberWithUnsignedShort:v6];
        }
        else {
          uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        }
        [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", self->super.super._participantUUID, v7)];
      }
      uint64_t v5 = v5->var0;
    }
    while (v5);
  }
  return v3;
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
  v6[2] = __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke;
  v6[3] = &unk_1E6DB4590;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v3 = VRTraceErrorLogLevelToCSTR(),
            char v4 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_13:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 760), "addSyncDestination:shouldSchedule:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, *(_OWORD *)v18, *(void *)&v18[16], v19) != 0);
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_1();
          }
        }
        return;
      }
      uint64_t v5 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 760);
      *(_DWORD *)uint64_t v15 = 136316162;
      *(void *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCAudioStreamSendGroup addSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 423;
      WORD2(v16) = 2080;
      *(void *)((char *)&v16 + 6) = v5;
      HIWORD(v16) = 2048;
      uint64_t v17 = v6;
      uint64_t v7 = " [%s] %s:%d Adding syncDestination=%s, common=%p";
      uint64_t v8 = v4;
      uint32_t v9 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 760);
      *(_DWORD *)uint64_t v15 = 136316674;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCAudioStreamSendGroup addSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 423;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v2;
      HIWORD(v16) = 2048;
      uint64_t v17 = v12;
      *(_WORD *)id v18 = 2080;
      *(void *)&v18[2] = v13;
      *(_WORD *)&v18[10] = 2048;
      *(void *)&v18[12] = v14;
      uint64_t v7 = " [%s] %s:%d %@(%p) Adding syncDestination=%s, common=%p";
      uint64_t v8 = v11;
      uint32_t v9 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_2();
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
  v6[2] = __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke;
  v6[3] = &unk_1E6DB4590;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v3 = VRTraceErrorLogLevelToCSTR(),
            char v4 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_13:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 760), "removeSyncDestination:shouldSchedule:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, *(_OWORD *)v18, *(void *)&v18[16], v19) != 0);
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_1();
          }
        }
        return;
      }
      uint64_t v5 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 760);
      *(_DWORD *)uint64_t v15 = 136316162;
      *(void *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCAudioStreamSendGroup removeSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 439;
      WORD2(v16) = 2080;
      *(void *)((char *)&v16 + 6) = v5;
      HIWORD(v16) = 2048;
      uint64_t v17 = v6;
      uint64_t v7 = " [%s] %s:%d Removing syncDestination=%s, common=%p";
      uint64_t v8 = v4;
      uint32_t v9 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 760);
      *(_DWORD *)uint64_t v15 = 136316674;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCAudioStreamSendGroup removeSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 439;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v2;
      HIWORD(v16) = 2048;
      uint64_t v17 = v12;
      *(_WORD *)id v18 = 2080;
      *(void *)&v18[2] = v13;
      *(_WORD *)&v18[10] = 2048;
      *(void *)&v18[12] = v14;
      uint64_t v7 = " [%s] %s:%d %@(%p) Removing syncDestination=%s, common=%p";
      uint64_t v8 = v11;
      uint32_t v9 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_2();
    }
  }
}

- (id)startCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common startCapture];
}

- (id)stopCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common stopCapture];
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  v5[4] = a3;
  v5[5] = self;
  unsigned int v6 = a4;
  dispatch_async(stateQueue, v5);
}

void __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(v3 - 1) == *(id *)(v2 + 480))
  {
    uint64_t v5 = VCMemoryPool_Alloc(*(OSQueueHead **)(v2 + 800));
    *uint64_t v5 = *(_DWORD *)(a1 + 48);
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = *(_DWORD *)(a1 + 48);
          int v36 = 136315906;
          uint64_t v37 = v19;
          __int16 v38 = 2080;
          __int16 v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          __int16 v40 = 1024;
          int v41 = 471;
          __int16 v42 = 1024;
          LODWORD(v43) = v21;
          int v22 = " [%s] %s:%d Enqueue new audio redundancyPercentage=%d";
          long long v23 = v20;
          uint32_t v24 = 34;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v36, v24);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v6 = (__CFString *)[*v3 performSelector:sel_logPrefix];
      }
      else {
        unsigned int v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        int v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *(void **)(a1 + 40);
          int v28 = *(_DWORD *)(a1 + 48);
          int v36 = 136316418;
          uint64_t v37 = v25;
          __int16 v38 = 2080;
          __int16 v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          __int16 v40 = 1024;
          int v41 = 471;
          __int16 v42 = 2112;
          __int16 v43 = v6;
          __int16 v44 = 2048;
          id v45 = v27;
          __int16 v46 = 1024;
          LODWORD(v47) = v28;
          int v22 = " [%s] %s:%d %@(%p) Enqueue new audio redundancyPercentage=%d";
          long long v23 = v26;
          uint32_t v24 = 54;
          goto LABEL_23;
        }
      }
    }
    if (CMSimpleQueueEnqueue(*((CMSimpleQueueRef *)*v3 + 98), v5))
    {
      if ((id)objc_opt_class() == *v3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          __int16 v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1(v30, (uint64_t)v3, v31);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v29 = (__CFString *)[*v3 performSelector:sel_logPrefix];
        }
        else {
          long long v29 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          __int16 v33 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            id v34 = *v3;
            int v35 = objc_msgSend((id)objc_msgSend(*((id *)*v3 + 95), "audioIO"), "state");
            int v36 = 136316418;
            uint64_t v37 = v32;
            __int16 v38 = 2080;
            __int16 v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
            __int16 v40 = 1024;
            int v41 = 474;
            __int16 v42 = 2112;
            __int16 v43 = v29;
            __int16 v44 = 2048;
            id v45 = v34;
            __int16 v46 = 1024;
            LODWORD(v47) = v35;
            _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full, audioIO.state=%d", (uint8_t *)&v36, 0x36u);
          }
        }
      }
      VCMemoryPool_Free(*((OSQueueHead **)*v3 + 100), v5);
    }
    return;
  }
  if ((id)objc_opt_class() == *v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v9 = *(__CFString **)(a1 + 32);
        uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 480);
        int v36 = 136316162;
        uint64_t v37 = v7;
        __int16 v38 = 2080;
        __int16 v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v40 = 1024;
        int v41 = 464;
        __int16 v42 = 2112;
        __int16 v43 = v9;
        __int16 v44 = 2112;
        id v45 = v10;
        uint64_t v11 = " [%s] %s:%d Redundancy controller callback for inactive redundancy controller was ignored. Redundancy cont"
              "roller=%@ Current controller=%@";
        uint64_t v12 = v8;
        uint32_t v13 = 48;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v36, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = (__CFString *)[*v3 performSelector:sel_logPrefix];
    }
    else {
      char v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        long long v16 = *(void **)(a1 + 40);
        uint64_t v18 = v16[60];
        int v36 = 136316674;
        uint64_t v37 = v14;
        __int16 v38 = 2080;
        __int16 v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v40 = 1024;
        int v41 = 464;
        __int16 v42 = 2112;
        __int16 v43 = v4;
        __int16 v44 = 2048;
        id v45 = v16;
        __int16 v46 = 2112;
        uint64_t v47 = v17;
        __int16 v48 = 2112;
        uint64_t v49 = v18;
        uint64_t v11 = " [%s] %s:%d %@(%p) Redundancy controller callback for inactive redundancy controller was ignored. Redundan"
              "cy controller=%@ Current controller=%@";
        uint64_t v12 = v15;
        uint32_t v13 = 68;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)createIOEventQueues
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  p_audioStreamUpdateEventQueue = &self->_audioStreamUpdateEventQueue;
  CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 10, &self->_audioStreamUpdateEventQueue);
  if (!*p_audioStreamUpdateEventQueue)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup createIOEventQueues]();
        }
      }
      goto LABEL_32;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_32;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_DWORD *)uint64_t v14 = 136316162;
    *(void *)&v14[4] = v10;
    *(_WORD *)&v14[12] = 2080;
    *(void *)&v14[14] = "-[VCAudioStreamSendGroup createIOEventQueues]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 492;
    WORD2(v15) = 2112;
    *(void *)((char *)&v15 + 6) = v8;
    HIWORD(v15) = 2048;
    long long v16 = self;
    uint64_t v12 = " [%s] %s:%d %@(%p) Failed to create audio event queue";
    goto LABEL_34;
  }
  uint64_t v5 = (tagVCMemoryPool *)VCMemoryPool_Create(0x14uLL);
  self->_audioStreamUpdatePool = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamSendGroup createIOEventQueues]();
      }
    }
    goto LABEL_32;
  }
  CMSimpleQueueCreate(v3, 10, &self->_audioRedundancyChangeEventQueue);
  if (!self->_audioRedundancyChangeEventQueue)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup createIOEventQueues]();
        }
      }
      goto LABEL_32;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v9 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v13 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v11 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_32:
      [(VCAudioStreamSendGroup *)self cleanupIOEventQueues];
      return 0;
    }
    *(_DWORD *)uint64_t v14 = 136316162;
    *(void *)&v14[4] = v13;
    *(_WORD *)&v14[12] = 2080;
    *(void *)&v14[14] = "-[VCAudioStreamSendGroup createIOEventQueues]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 498;
    WORD2(v15) = 2112;
    *(void *)((char *)&v15 + 6) = v9;
    HIWORD(v15) = 2048;
    long long v16 = self;
    uint64_t v12 = " [%s] %s:%d %@(%p) Failed to create audioRedundancyChangeQueue";
LABEL_34:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, v14, 0x30u);
    goto LABEL_32;
  }
  unsigned int v6 = (tagVCMemoryPool *)VCMemoryPool_Create(4uLL);
  self->_audioRedundancyEventPool = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamSendGroup createIOEventQueues].cold.4();
      }
    }
    goto LABEL_32;
  }
  return 1;
}

- (void)cleanupIOEventQueues
{
  VCMemoryPool_Destroy((OSQueueHead *)self->_audioStreamUpdatePool);
  audioStreamUpdateEventQueue = self->_audioStreamUpdateEventQueue;
  if (audioStreamUpdateEventQueue)
  {
    CFRelease(audioStreamUpdateEventQueue);
    self->_audioStreamUpdateEventQueue = 0;
  }
  VCMemoryPool_Destroy((OSQueueHead *)self->_audioRedundancyEventPool);
  audioRedundancyChangeEventQueue = self->_audioRedundancyChangeEventQueue;
  if (audioRedundancyChangeEventQueue)
  {
    CFRelease(audioRedundancyChangeEventQueue);
    self->_audioRedundancyChangeEventQueue = 0;
  }
}

- (void)flushAudioEventQueue
{
  CFAllocatorRef v3 = (void *)CMSimpleQueueDequeue(self->_audioStreamUpdateEventQueue);
  if (v3)
  {
    char v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_audioStreamUpdatePool, v4);
      char v4 = (void *)CMSimpleQueueDequeue(self->_audioStreamUpdateEventQueue);
    }
    while (v4);
  }
  self->_lastEnqueuedStreamUpdateEventWasEmpty = 0;
}

- (void)flushAudioRedundancyEventQueue
{
  CFAllocatorRef v3 = (void *)CMSimpleQueueDequeue(self->_audioRedundancyChangeEventQueue);
  if (v3)
  {
    char v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_audioRedundancyEventPool, v4);
      char v4 = (void *)CMSimpleQueueDequeue(self->_audioRedundancyChangeEventQueue);
    }
    while (v4);
  }
}

- (void)startVoiceActivityDetection
{
  CFAllocatorRef v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_voiceDetector = v3;
  char v4 = [(VCAudioIO *)[(VCAudioStreamGroupCommon *)self->_common audioIO] clientFormat];

  VCVoiceDetector_Start(v3, (uint64_t)v4);
}

- (void)stopVoiceActivityDetection
{
  p_voiceDetector = (void **)&self->_voiceDetector;
  VCVoiceDetector_Stop(self->_voiceDetector);

  VCVoiceDetector_Destroy(p_voiceDetector);
}

- (void)startDynamicDucker
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start the dynamic ducker", v2, v3, v4, v5, v6);
}

- (void)stopDynamicDucker
{
  p_audioDucker = (void **)&self->_audioDucker;
  VCAudioDucker_Stop((uint64_t)self->_audioDucker);

  VCAudioDucker_Destroy(p_audioDucker);
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setMuted:", -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted"));
      }
      uint64_t v5 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (id)setupRedundancyControllerForMode:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a3]);
  if (v4)
  {
    uint64_t v5 = v4;
    if (![v4 streamGroupRedundancyControlEnabled]
      || [v5 redundancyController])
    {
      return 0;
    }
    if ([v5 statisticsCollector])
    {
      uint64_t v6 = -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]([VCRedundancyControllerAudio alloc], "initWithDelegate:statisticsCollector:mode:", self, [v5 statisticsCollector], objc_msgSend(v5, "redundancyMode"));
      if (v6)
      {
        uint64_t v7 = v6;
        if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_17;
          }
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          long long v10 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          *(_DWORD *)int v21 = 136315650;
          *(void *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 584;
          long long v11 = " [%s] %s:%d Redundancy controller is created";
          long long v12 = v10;
          uint32_t v13 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v8 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v8 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_17;
          }
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          long long v15 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          *(_DWORD *)int v21 = 136316162;
          *(void *)&v21[4] = v14;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 584;
          WORD2(v22) = 2112;
          *(void *)((char *)&v22 + 6) = v8;
          HIWORD(v22) = 2048;
          long long v23 = self;
          long long v11 = " [%s] %s:%d %@(%p) Redundancy controller is created";
          long long v12 = v15;
          uint32_t v13 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
LABEL_17:
        objc_msgSend(v5, "setRedundancyController:", v7, *(_OWORD *)v21, *(void *)&v21[16], v22, v23);
        [(VCMediaStreamSendGroup *)self setRedundancyController:v7];

        return 0;
      }
      uint64_t v17 = @"Failed to create audio redundancy controller";
    }
    else
    {
      uint64_t v17 = @"Need statistics collector to create redundancy controller";
    }
  }
  else
  {
    uint64_t v17 = @"Tried to create redundancy controller for mode which VCMediaStreamSendGroupConfig is nil";
  }
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamSendGroup setupRedundancyControllerForMode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v21 = 136316418;
        *(void *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 592;
        WORD2(v22) = 2112;
        *(void *)((char *)&v22 + 6) = v18;
        HIWORD(v22) = 2048;
        long long v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v17;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", v21, 0x3Au);
      }
    }
  }
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:v17];
}

- (id)checkStreamsForAdditionalOptIn:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->super._isRemoteOnPeace)
  {
    if ([(NSArray *)self->super.super._mediaStreamInfoArray count])
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->super.super._mediaStreamInfoArray, "objectAtIndexedSubscript:", 0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v5, "idsStreamID"));
      if (([a3 containsObject:v6] & 1) == 0)
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a3];
        [v7 addObject:v6];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            BOOL isRemoteOnPeace = self->super._isRemoteOnPeace;
            int v12 = 136316162;
            uint64_t v13 = v8;
            __int16 v14 = 2080;
            long long v15 = "-[VCAudioStreamSendGroup checkStreamsForAdditionalOptIn:]";
            __int16 v16 = 1024;
            int v17 = 611;
            __int16 v18 = 1024;
            BOOL v19 = isRemoteOnPeace;
            __int16 v20 = 2112;
            uint64_t v21 = v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote side is on Peace [%d]. Adding subscription to low Quality audio %@", (uint8_t *)&v12, 0x2Cu);
          }
        }
        return v7;
      }
    }
  }
  return a3;
}

- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&a3->var0 & 0x1F) != 0)
  {
    unint64_t v5 = 0;
    char v6 = 0;
    int v36 = &a3->var1.var22.var1.var0[16];
LABEL_3:
    char v33 = v6;
    do
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v7 = self;
      mediaStreams = self->super.super._mediaStreams;
      uint64_t v9 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v53 objects:v52 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        long long v11 = &v36[24 * v5];
        uint64_t v12 = *(void *)v54;
LABEL_6:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(mediaStreams);
          }
          __int16 v14 = *(void **)(*((void *)&v53 + 1) + 8 * v13);
          int v15 = *(_DWORD *)v11;
          if (v15 == [v14 localSSRC]) {
            break;
          }
          if (v10 == ++v13)
          {
            uint64_t v10 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v53 objects:v52 count:16];
            if (v10) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        unsigned int var0 = a3->var1.var0.var0;
        int v17 = &v36[24 * v5];
        unsigned int v18 = (100 * v17[4]) >> 8;
        int v19 = *((_DWORD *)v17 + 2);
        int v20 = RTCPComputeRoundTripTimeMiddle32((uint64_t)v11, a4.wide);
        int v21 = Middle32ToMilliSeconds(v20);
        uint64_t v38 = 0;
        memset(v39, 0, sizeof(v39));
        *(_DWORD *)buf = 8;
        int v40 = var0;
        *(_DWORD *)int v41 = v18;
        *(_DWORD *)&v41[4] = v19;
        *(_DWORD *)&v41[8] = v21;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        [v14 setVCStatistics:buf];
        ++v5;
        char v6 = 1;
        self = v7;
        if (v5 < (*(_WORD *)&a3->var0 & 0x1Fu)) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
LABEL_12:
      ++v5;
      self = v7;
    }
    while (v5 < (*(_WORD *)&a3->var0 & 0x1Fu));
    if ((v33 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_17:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        uint64_t v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v38 = v24;
          v39[0] = 2080;
          *(void *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          int v40 = 640;
          uint64_t v26 = " [%s] %s:%d RTCP report found!!";
          uint64_t v27 = v25;
          uint32_t v28 = 28;
LABEL_33:
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v22 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        uint64_t v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v38 = v29;
          v39[0] = 2080;
          *(void *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          int v40 = 640;
          *(_WORD *)int v41 = 2112;
          *(void *)&v41[2] = v22;
          *(_WORD *)&v41[10] = 2048;
          *(void *)&long long v42 = self;
          uint64_t v26 = " [%s] %s:%d %@(%p) RTCP report found!!";
          uint64_t v27 = v30;
          uint32_t v28 = 48;
          goto LABEL_33;
        }
      }
    }
  }
  else
  {
LABEL_20:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v23 = (__CFString *)[(VCAudioStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        uint64_t v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v38 = v31;
          v39[0] = 2080;
          *(void *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          int v40 = 638;
          *(_WORD *)int v41 = 2112;
          *(void *)&v41[2] = v23;
          *(_WORD *)&v41[10] = 2048;
          *(void *)&long long v42 = self;
          _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) RTCP report not found!!", buf, 0x30u);
        }
      }
    }
  }
}

- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  unint64_t wide = a4.wide;
  unint64_t v5 = self;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t var2 = a3->var1.var0.var2;
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *((unsigned __int8 *)&a3->var0 + 1);
        unsigned int var0 = a3->var1.var0.var0;
        *(_DWORD *)buf = 136316418;
        uint64_t v57 = v7;
        v58[0] = 2080;
        *(void *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
        v58[5] = 1024;
        int v59 = 648;
        *(_WORD *)long long v60 = 1024;
        *(_DWORD *)&v60[2] = v9;
        *(_WORD *)&v60[6] = 1024;
        *(_DWORD *)&v60[8] = var0;
        LOWORD(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 2) = var2;
        long long v11 = " [%s] %s:%d Received custom report (%d) from %x with %d reception reports";
        uint64_t v12 = v8;
        uint32_t v13 = 46;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v6 = (__CFString *)[(VCAudioStreamSendGroup *)v5 performSelector:sel_logPrefix];
    }
    else {
      char v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *((unsigned __int8 *)&a3->var0 + 1);
        unsigned int v17 = a3->var1.var0.var0;
        *(_DWORD *)buf = 136316930;
        uint64_t v57 = v14;
        v58[0] = 2080;
        *(void *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
        v58[5] = 1024;
        int v59 = 648;
        *(_WORD *)long long v60 = 2112;
        *(void *)&v60[2] = v6;
        *(_WORD *)&v60[10] = 2048;
        *(void *)&long long v61 = v5;
        WORD4(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 10) = v16;
        HIWORD(v61) = 1024;
        LODWORD(v62) = v17;
        WORD2(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 6) = var2;
        long long v11 = " [%s] %s:%d %@(%p) Received custom report (%d) from %x with %d reception reports";
        uint64_t v12 = v15;
        uint32_t v13 = 66;
        goto LABEL_11;
      }
    }
  }
  if (var2)
  {
    uint64_t v18 = 0;
    char v19 = 0;
    long long v53 = v5;
LABEL_14:
    char v52 = v19;
    do
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      mediaStreams = v5->super.super._mediaStreams;
      uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v72, v71, 16, wide);
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v73;
        uint64_t v24 = &a3->var1.var2.var1.var2[12 * v18 + 7];
        uint64_t v25 = &a3->var1.var2.var1.var2[12 * v18 + 23];
        uint64_t v55 = v18;
LABEL_17:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v73 != v23) {
            objc_enumerationMutation(mediaStreams);
          }
          uint64_t v27 = *(void **)(*((void *)&v72 + 1) + 8 * v26);
          uint32_t v28 = *((unsigned __int8 *)&a3->var0 + 1) << 8 == 62720 ? v24 : v25;
          int v29 = *(_DWORD *)v28;
          if (v29 == [*(id *)(*((void *)&v72 + 1) + 8 * v26) localSSRC]) {
            break;
          }
          if (v22 == ++v26)
          {
            uint64_t v22 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v72 objects:v71 count:16];
            uint64_t v18 = v55;
            if (v22) {
              goto LABEL_17;
            }
            goto LABEL_26;
          }
        }
        int v30 = *((unsigned __int16 *)v28 + 3);
        int v31 = [v27 getRTCPReportNTPTimeMiddle32ForReportId:*((_WORD *)v28 + 2) & 0xF];
        if (v30)
        {
          int v32 = v31;
          unsigned int v33 = 0xFFFF * v30;
          int v34 = NTPToMiddle32(wide);
          if (v34 - v32 >= v33) {
            int v35 = v34 - v32 - v33;
          }
          else {
            int v35 = 0;
          }
        }
        else
        {
          int v35 = 0;
        }
        unsigned int v36 = a3->var1.var0.var0;
        unsigned int v37 = (3289700 * v28[10]) >> 23;
        int v38 = [v27 getExtendedSequenceNumberForSequenceNumber:*((unsigned __int16 *)v28 + 4)];
        int v39 = Middle32ToMilliSeconds(v35);
        uint64_t v57 = 0;
        memset(v58, 0, sizeof(v58));
        *(_DWORD *)buf = 8;
        int v59 = v36;
        *(_DWORD *)long long v60 = v37;
        *(_DWORD *)&v60[4] = v38;
        *(_DWORD *)&v60[8] = v39;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        [v27 setVCStatistics:buf];
        uint64_t v18 = v55 + 1;
        char v19 = 1;
        unint64_t v5 = v53;
        if (v55 + 1 != var2) {
          goto LABEL_14;
        }
        goto LABEL_36;
      }
LABEL_26:
      ++v18;
      unint64_t v5 = v53;
    }
    while (v18 != var2);
    if ((v52 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_36:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        long long v43 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v57 = v42;
          v58[0] = 2080;
          *(void *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          int v59 = 682;
          long long v44 = " [%s] %s:%d RTCP report found!!";
          long long v45 = v43;
          uint32_t v46 = 28;
LABEL_52:
          _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v40 = (__CFString *)[(VCAudioStreamSendGroup *)v5 performSelector:sel_logPrefix];
      }
      else {
        int v40 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        long long v48 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v57 = v47;
          v58[0] = 2080;
          *(void *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          int v59 = 682;
          *(_WORD *)long long v60 = 2112;
          *(void *)&v60[2] = v40;
          *(_WORD *)&v60[10] = 2048;
          *(void *)&long long v61 = v5;
          long long v44 = " [%s] %s:%d %@(%p) RTCP report found!!";
          long long v45 = v48;
          uint32_t v46 = 48;
          goto LABEL_52;
        }
      }
    }
  }
  else
  {
LABEL_39:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v41 = (__CFString *)[(VCAudioStreamSendGroup *)v5 performSelector:sel_logPrefix];
      }
      else {
        int v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v49 = VRTraceErrorLogLevelToCSTR();
        long long v50 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v57 = v49;
          v58[0] = 2080;
          *(void *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          int v59 = 680;
          *(_WORD *)long long v60 = 2112;
          *(void *)&v60[2] = v41;
          *(_WORD *)&v60[10] = 2048;
          *(void *)&long long v61 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) RTCP report not found!!", buf, 0x30u);
        }
      }
    }
  }
}

- (BOOL)isVADFilteringEnabled
{
  return self->_isCurrentDTXEnabled;
}

- (BOOL)isCurrentDTXEnabled
{
  return *(&self->_isCurrentDTXEnabled + 1);
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (unsigned)cellularUniqueTag
{
  return self->_cellularUniqueTag;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  self->_cellularUniqueTag = a3;
}

- (VCAudioStreamGroupCommon)common
{
  return self->_common;
}

void __VCAudioStreamSendGroup_UpdateActiveAudioStreams_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, unsigned int a5)
{
  if (*(unsigned char *)(a2 + 8) && (a3 & 1) == 0) {
    VCAudioStream_PushRemainingSamples(*(void *)(a2 + 40));
  }
  *(unsigned char *)(a2 + 8) = a3;
  if (a3 && !*(_DWORD *)(*(void *)(a1 + 32) + 472))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 18);
    if (*(unsigned __int8 *)(a2 + 72) != v10)
    {
      uint64_t v11 = 64;
      if (!v10) {
        uint64_t v11 = 56;
      }
      VCAudioStream_SetAllowedCodecConfigurations(*(void *)(a2 + 40), *(const __CFDictionary **)(a2 + v11));
      *(unsigned char *)(a2 + 72) = v10;
    }
    uint64_t v12 = *(void **)(a2 + 40);
    uint64_t v13 = a5;
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
    if (a5)
    {
      do
      {
        id v14 = objc_alloc(NSNumber);
        unsigned int v15 = *a4++;
        int v16 = (void *)[v14 initWithUnsignedShort:v15];
        [v17 addObject:v16];

        --v13;
      }
      while (v13);
    }
    [v12 setStreamIDs:v17 repairStreamIDs:0];
  }
}

void __VCAudioStreamSendGroup_UpdateActiveAudioStreams_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didChangeSendingStreamsForStreamGroup:*(void *)(a1 + 40)];
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void __VCAudioStreamSendGroup_UpdateAudioPriorityUplink_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCAudioStreamGroupCommon", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create IO event queues", v2, v3, v4, v5, v6);
}

- (void)startCaptureIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Starting capture failed with error=%@");
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setDeviceRole", v2, v3, v4, v5, v6);
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configureAudioStreams", v2, v3, v4, v5, v6);
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to restart capture", v2, v3, v4, v5, v6);
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d pause audio stream failed", v2, v3, v4, v5, v6);
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d start audio stream failed", v2, v3, v4, v5, v6);
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d configuring audio stream failed error=%@");
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stop audio stream failed", v2, v3, v4, v5, v6);
}

- (void)dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
  __int16 v4 = 1024;
  int v5 = 392;
  __int16 v6 = 1024;
  int v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d CMSimpleQueueEnqueue Full! Dropping audio stream update event with %d active streams", v2, 0x22u);
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add sync destination", v2, v3, v4, v5, v6);
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
}

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to remove sync destination", v2, v3, v4, v5, v6);
}

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
}

void __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)a2 + 760), "audioIO"), "state");
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v10 = 474;
  __int16 v11 = v5;
  int v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d CMSimpleQueueEnqueue Full, audioIO.state=%d", (uint8_t *)&v7, 0x22u);
}

- (void)createIOEventQueues
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio redundancy event pool", v2, v3, v4, v5, v6);
}

- (void)setupRedundancyControllerForMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %@");
}

- (void)didReceiveReportPacket:arrivalNTPTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RTCP report not found!!", v2, v3, v4, v5, v6);
}

- (void)didReceiveCustomReportPacket:arrivalNTPTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RTCP report not found!!", v2, v3, v4, v5, v6);
}

@end