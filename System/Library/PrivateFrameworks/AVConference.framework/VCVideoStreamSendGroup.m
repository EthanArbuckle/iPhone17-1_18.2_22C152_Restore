@interface VCVideoStreamSendGroup
- (BOOL)dispatchedEnableRedundancy:(BOOL)a3;
- (BOOL)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)setupRedundancySettings;
- (BOOL)setupStreamGroupWithConfig:(id)a3;
- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5;
- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4;
- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3;
- (CGSize)getCaptureEncodingSize;
- (VCVideoStreamSendGroup)initWithConfig:(id)a3;
- (id)activeStreamKeys;
- (id)captureConfigForScreenShare;
- (id)clientCaptureRule;
- (id)copyOnVideoFrameBlock;
- (id)registerForScreenCapture;
- (id)setupRedundancyControllerForMode:(unsigned int)a3;
- (id)startCapture;
- (id)stopCapture;
- (id)streamDescriptionForMediaStreamConfig:(id)a3;
- (id)uplinkVideoStreamControllerForMode:(unsigned int)a3;
- (id)willStart;
- (int)captureFrameRate;
- (int)maxCaptureCameraFrameRateForMode:(unsigned int)a3;
- (int)maxCaptureFrameRateForMode:(unsigned int)a3;
- (int64_t)maxCaptureResolution;
- (unint64_t)maxStreamFrameRate;
- (unsigned)getPixelFormat;
- (unsigned)mediaQueueSize;
- (void)avConferencePreviewError:(id)a3;
- (void)cameraAvailabilityDidChange:(BOOL)a3;
- (void)cleanupRedundancySettings;
- (void)collectAndLogChannelMetrics:(id *)a3;
- (void)computeMaxScreenCaptureSize;
- (void)controller:(id)a3 didChangeActiveVideoStreams:(id)a4;
- (void)dealloc;
- (void)deregisterClientForScreenShare;
- (void)deregisterForScreenCapture;
- (void)deregisterForVideoCapture;
- (void)dispatchedSetCaptureVideoRule:(id)a3;
- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6;
- (void)flushVideoRedundancyEventQueue;
- (void)frameRateIsBeingThrottled:(int)a3 thermalLevelDidChange:(BOOL)a4 powerLevelDidChange:(BOOL)a5;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4;
- (void)registerClientForScreenShare;
- (void)registerConfigForScreenShare;
- (void)registerForVideoCapture:(int)a3;
- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7;
- (void)setCaptureFrameRate:(int)a3;
- (void)setMediaQueueSize:(unsigned int)a3;
- (void)setupPayloadTypes;
- (void)setupRedundancySettings;
- (void)setupVideoPriority;
- (void)sourceFrameRateDidChange:(unsigned int)a3;
- (void)thermalLevelDidChange:(int)a3;
- (void)updateEnabledState;
- (void)updateSendSampleRTPTimestamp:(unsigned int)a3 sampleRate:(double)a4 systemTime:(double)a5;
- (void)updateSuspendedState;
- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4;
- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4;
- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3;
- (void)vcMediaStreamDidRTCPTimeOut:(id)a3;
- (void)vcMediaStreamDidRTPTimeOut:(id)a3;
@end

@implementation VCVideoStreamSendGroup

- (VCVideoStreamSendGroup)initWithConfig:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCVideoStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v24, sel_initWithConfig_);
  v5 = v4;
  if (!v4)
  {
LABEL_49:

    return 0;
  }
  [(VCMediaStreamSendGroup *)v4 setIsSuspended:1];
  v5->_clientCaptureController = objc_storeWeak(&v5->_clientCaptureController, (id)[a3 captureController]);
  [(VCMediaStreamGroup *)v5 setCaptureController:v5];
  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5->_videoPayloadTypes = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup initWithConfig:]();
      }
    }
    goto LABEL_49;
  }
  if (![(VCVideoStreamSendGroup *)v5 setupRedundancySettings])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup initWithConfig:].cold.5();
      }
    }
    goto LABEL_49;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5->_pendingActiveUplinkStreams = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup initWithConfig:]();
      }
    }
    goto LABEL_49;
  }
  [(VCVideoStreamSendGroup *)v5 setupVideoPriority];
  *(_DWORD *)(&v5->super._isSuspended + 3) = [a3 captureSource];
  v5->_maxSupportedCaptureFrameRate = [(VCVideoStreamSendGroup *)v5 maxCaptureFrameRateForMode:v5->super._streamGroupMode];
  uint64_t v8 = [(VCVideoStreamSendGroup *)v5 uplinkVideoStreamControllerForMode:v5->super._streamGroupMode];
  v5->_uplinkVideoStreamController = (VCSessionUplinkVideoStreamController *)v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup initWithConfig:]();
      }
    }
    goto LABEL_49;
  }
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5->_temporalStreamsIDs = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup initWithConfig:].cold.4();
      }
    }
    goto LABEL_49;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = v5->super.super._mediaStreamInfoArray;
  uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v10;
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v12 = (void *)[v11 streamConfigs];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) multiwayConfig];
              if ([v17 isTemporalStream]) {
                -[NSMutableArray addObject:](v5->_temporalStreamsIDs, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "idsStreamID")));
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v25 count:16];
          }
          while (v14);
        }
        uint64_t v10 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v22);
  }
  [(VCVideoStreamSendGroup *)v5 setupPayloadTypes];
  v5->_maxSupportedMultiwayVideoResolution = [(VCVideoStreamSendGroup *)v5 maxCaptureResolution];
  v5->_captureFrameRate = v5->_maxSupportedCaptureFrameRate;
  v5->_fecRatio = -1.0;
  if (+[VCHardwareSettings deviceClass] != 8)
  {
    if (!v5->_allowSuspendProvisionedStreams) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOOL v18 = [(VCMediaStreamGroup *)v5 streamGroupID] == 1667329381
     || [(VCMediaStreamGroup *)v5 streamGroupID] == 1667329399;
  v5->_allowSuspendProvisionedStreams = v18;
  if (v18)
  {
LABEL_30:
    v5->_hasPeerSubscribedStreams = 0;
    v5->super.super._areStreamsSuspended = 1;
  }
LABEL_31:
  if ([(VCMediaStreamGroup *)v5 streamGroupID] == 1935897189) {
    [(VCVideoStreamSendGroup *)v5 registerConfigForScreenShare];
  }
  v5->_initTime = micro() != 0.0;
  v5->_totalNumFramesProcessed = 0;
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamSendGroup *)self cleanupRedundancySettings];

  objc_storeWeak(&self->_clientCaptureController, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v3 dealloc];
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamSendGroup;
  BOOL v5 = -[VCMediaStreamSendGroup setupStreamGroupWithConfig:](&v8, sel_setupStreamGroupWithConfig_);
  self->_uplinkVideoStreamController = (VCSessionUplinkVideoStreamController *)-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:](self, "uplinkVideoStreamControllerForMode:", [a3 streamGroupMode]);
  int v6 = -[VCVideoStreamSendGroup maxCaptureFrameRateForMode:](self, "maxCaptureFrameRateForMode:", [a3 streamGroupMode]);
  self->_maxSupportedCaptureFrameRate = v6;
  self->_captureFrameRate = v6;
  return v5;
}

- (BOOL)setupRedundancySettings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (tagVCMemoryPool *)VCMemoryPool_Create(8uLL);
  self->_videoRedundancyPool = v3;
  if (v3)
  {
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 10, &self->_videoRedundancyChangeEventQueue);
    if (self->_videoRedundancyChangeEventQueue)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        -[VCVideoStreamSendGroup setupRedundancySettings]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        int v9 = 136316162;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        v12 = "-[VCVideoStreamSendGroup setupRedundancySettings]";
        __int16 v13 = 1024;
        int v14 = 180;
        __int16 v15 = 2112;
        v16 = v5;
        __int16 v17 = 2048;
        BOOL v18 = self;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create videoRedundancyChangeQueue", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    -[VCVideoStreamSendGroup setupRedundancySettings]();
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (id)setupRedundancyControllerForMode:(unsigned int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a3]);
  BOOL v5 = v4;
  if (v4)
  {
    if ([v4 redundancyController] || !objc_msgSend(v5, "statisticsCollector")) {
      goto LABEL_17;
    }
    uint64_t v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, [v5 redundancyMode], objc_msgSend(v5, "statisticsCollector"), objc_msgSend(v5, "redundancyPercentage"));
    if (v6)
    {
      v7 = v6;
      [(VCRedundancyControllerVideo *)v6 setStatisticsID:self->super.super._idsParticipantID];
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)uint64_t v22 = 136315650;
        *(void *)&v22[4] = v9;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 204;
        __int16 v11 = " [%s] %s:%d Redundancy controller is created";
        v12 = v10;
        uint32_t v13 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          objc_super v8 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          objc_super v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)uint64_t v22 = 136316162;
        *(void *)&v22[4] = v14;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 204;
        WORD2(v23) = 2112;
        *(void *)((char *)&v23 + 6) = v8;
        HIWORD(v23) = 2048;
        objc_super v24 = self;
        __int16 v11 = " [%s] %s:%d %@(%p) Redundancy controller is created";
        v12 = v15;
        uint32_t v13 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v22, v13);
LABEL_16:
      objc_msgSend(v5, "setRedundancyController:", v7, *(_OWORD *)v22, *(void *)&v22[16], v23, v24);

LABEL_17:
      v16 = 0;
      char v17 = 1;
      goto LABEL_18;
    }
    char v17 = 0;
    v16 = @"Failed to create video redundancy controller";
  }
  else
  {
    char v17 = 0;
    v16 = @"Tried to create redundancy controller for mode but VCMediaStreamSendGroupConfig is nil";
  }
LABEL_18:
  -[VCMediaStreamSendGroup setRedundancyController:](self, "setRedundancyController:", [v5 redundancyController]);
  if (v17) {
    return 0;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup setupRedundancyControllerForMode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v22 = 136316418;
        *(void *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 212;
        WORD2(v23) = 2112;
        *(void *)((char *)&v23 + 6) = v19;
        HIWORD(v23) = 2048;
        objc_super v24 = self;
        __int16 v25 = 2112;
        long long v26 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", v22, 0x3Au);
      }
    }
  }
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:v16];
}

- (void)setupPayloadTypes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->super.super._mediaStreamInfoArray;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        objc_super v8 = (void *)[v7 streamConfigs];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              -[NSMutableSet addObjectsFromArray:](self->_videoPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "txPayloadMap"), "allKeys"));
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
          }
          while (v10);
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v4);
  }
}

- (void)cleanupRedundancySettings
{
  [(VCVideoStreamSendGroup *)self flushVideoRedundancyEventQueue];
  VCMemoryPool_Destroy((OSQueueHead *)self->_videoRedundancyPool);
  videoRedundancyChangeEventQueue = self->_videoRedundancyChangeEventQueue;
  if (videoRedundancyChangeEventQueue)
  {
    CFRelease(videoRedundancyChangeEventQueue);
  }
}

- (int64_t)maxCaptureResolution
{
  if (+[VCHardwareSettings supportsMultiway1080pStream])
  {
    return 20;
  }
  if (+[VCHardwareSettings supportsMultiway720pStream]) {
    return 16;
  }
  return 11;
}

- (int)maxCaptureFrameRateForMode:(unsigned int)a3
{
  if ((*(_DWORD *)(&self->super._isSuspended + 3) - 1) <= 1) {
    return [(VCVideoStreamSendGroup *)self maxStreamFrameRate];
  }

  return [(VCVideoStreamSendGroup *)self maxCaptureCameraFrameRateForMode:*(void *)&a3];
}

- (int)maxCaptureCameraFrameRateForMode:(unsigned int)a3
{
  if (a3 == 1)
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:")))
    {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1)), "mediaStreamInfoArray"), "firstObject"), "streamConfigs"), "firstObject"), "framerate");
    }
    else
    {
      return +[VCHardwareSettings maxOneToOneFramerateSupported];
    }
  }
  else if (a3)
  {
    return 30;
  }
  else
  {
    int result = +[VCHardwareSettings maxMultiwayFramerateSupported];
    if (result >= 0x1E) {
      return 30;
    }
  }
  return result;
}

- (id)uplinkVideoStreamControllerForMode:(unsigned int)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 uplinkVideoStreamController])
    {
      v7 = [[VCSessionUplinkVideoStreamController alloc] initWithVideoStreams:self->super.super._streamIDToMediaStreamMap streamInfos:self->super.super._mediaStreamInfoArray reportingAgent:self->super.super.super._reportingAgent delegate:self];
      [(VCSessionUplinkVideoStreamController *)v7 setCaptureFrameRate:self->_maxSupportedCaptureFrameRate];
      if (BYTE2(self->_captureSource))
      {
        unsigned int v8 = [(VCMediaStreamGroup *)self streamGroupID];
        if (a3) {
          BOOL v9 = 0;
        }
        else {
          BOOL v9 = v8 == 1667329381;
        }
        uint64_t v10 = v9;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [(VCSessionUplinkVideoStreamController *)v7 setDynamicVideoPriorityEnabled:v10];
      [(VCSessionUplinkVideoStreamController *)v7 setShouldSkipIDRScheduler:1];
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_22;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint32_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        int v14 = BYTE2(self->_captureSource);
        *(_DWORD *)__int16 v25 = 136316418;
        *(void *)&v25[4] = v12;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 290;
        WORD2(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 6) = v14;
        WORD5(v26) = 1024;
        HIDWORD(v26) = [(VCSessionUplinkVideoStreamController *)v7 dynamicVideoPriorityEnabled];
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = [(VCSessionUplinkVideoStreamController *)v7 captureFrameRate];
        long long v15 = " [%s] %s:%d _videoPriorityEnabled=%d, uplinkVideoStreamController.dynamicVideoPriorityEnabled=%d uplinkVid"
              "eoStreamController.captureFrameRate=%d";
        long long v16 = v13;
        uint32_t v17 = 46;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_22;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        int v20 = BYTE2(self->_captureSource);
        *(_DWORD *)__int16 v25 = 136316930;
        *(void *)&v25[4] = v18;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 290;
        WORD2(v26) = 2112;
        *(void *)((char *)&v26 + 6) = v11;
        HIWORD(v26) = 2048;
        uint64_t v27 = self;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v20;
        HIWORD(v28) = 1024;
        LODWORD(v29) = [(VCSessionUplinkVideoStreamController *)v7 dynamicVideoPriorityEnabled];
        WORD2(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 6) = [(VCSessionUplinkVideoStreamController *)v7 captureFrameRate];
        long long v15 = " [%s] %s:%d %@(%p) _videoPriorityEnabled=%d, uplinkVideoStreamController.dynamicVideoPriorityEnabled=%d up"
              "linkVideoStreamController.captureFrameRate=%d";
        long long v16 = v19;
        uint32_t v17 = 66;
      }
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, v25, v17);
LABEL_22:
      objc_msgSend(v6, "setUplinkVideoStreamController:", v7, *(_OWORD *)v25, *(void *)&v25[16], v26, v27, v28, v29);
    }
  }
  else if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v22 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      long long v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v25 = 136316162;
        *(void *)&v25[4] = v23;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 282;
        WORD2(v26) = 2112;
        *(void *)((char *)&v26 + 6) = v22;
        HIWORD(v26) = 2048;
        uint64_t v27 = self;
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Tried to create uplink video stream controller for mode but VCMediaStreamSendGroupConfig is nil", v25, 0x30u);
      }
    }
  }
  return (id)[v6 uplinkVideoStreamController];
}

- (BOOL)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:");
  if (v7)
  {
    [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController generateKeyFrameWithStreamID:a3 firType:v4];
    return v7 != 0;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        int v20 = "-[VCVideoStreamSendGroup generateKeyFrameWithStreamID:firType:]";
        __int16 v21 = 1024;
        int v22 = 301;
        __int16 v23 = 2112;
        id v24 = a3;
        uint64_t v12 = " [%s] %s:%d streamID=%@ does not exist";
        uint32_t v13 = v11;
        uint32_t v14 = 38;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v9 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136316418;
        uint64_t v18 = v15;
        __int16 v19 = 2080;
        int v20 = "-[VCVideoStreamSendGroup generateKeyFrameWithStreamID:firType:]";
        __int16 v21 = 1024;
        int v22 = 301;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2048;
        long long v26 = self;
        __int16 v27 = 2112;
        id v28 = a3;
        uint64_t v12 = " [%s] %s:%d %@(%p) streamID=%@ does not exist";
        uint32_t v13 = v16;
        uint32_t v14 = 58;
        goto LABEL_14;
      }
    }
  }
  return v7 != 0;
}

- (id)willStart
{
  if (!objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->super._streamGroupMode)), "streamGroupRedundancyControlEnabled"))return 0; {
  [(VCVideoStreamSendGroup *)self flushVideoRedundancyEventQueue];
  }
  uint64_t streamGroupMode = self->super._streamGroupMode;

  return [(VCVideoStreamSendGroup *)self setupRedundancyControllerForMode:streamGroupMode];
}

- (void)updateEnabledState
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->super.super._state;
  BOOL hasPeerSubscribedStreams = !self->_allowSuspendProvisionedStreams && state == 1;
  if (self->_allowSuspendProvisionedStreams && state == 1) {
    BOOL hasPeerSubscribedStreams = self->_hasPeerSubscribedStreams;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = self->_hasPeerSubscribedStreams;
        BOOL v11 = self->super.super._state == 1;
        BOOL allowSuspendProvisionedStreams = self->_allowSuspendProvisionedStreams;
        int v21 = 136316674;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        id v24 = "-[VCVideoStreamSendGroup updateEnabledState]";
        __int16 v25 = 1024;
        int v26 = 352;
        __int16 v27 = 1024;
        *(_DWORD *)id v28 = hasPeerSubscribedStreams;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v11;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v10;
        HIWORD(v29) = 1024;
        *(_DWORD *)uint64_t v30 = allowSuspendProvisionedStreams;
        uint32_t v13 = " [%s] %s:%d captureEnabled=%d isRunning=%d _hasPeerSubscribedStreams=%d _allowSuspendProvisionedStreams=%d";
        uint32_t v14 = v9;
        uint32_t v15 = 52;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = self->_hasPeerSubscribedStreams;
        BOOL v19 = self->super.super._state == 1;
        BOOL v20 = self->_allowSuspendProvisionedStreams;
        int v21 = 136317186;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        id v24 = "-[VCVideoStreamSendGroup updateEnabledState]";
        __int16 v25 = 1024;
        int v26 = 352;
        __int16 v27 = 2112;
        *(void *)id v28 = v7;
        *(_WORD *)&v28[8] = 2048;
        uint64_t v29 = self;
        *(_WORD *)uint64_t v30 = 1024;
        *(_DWORD *)&v30[2] = hasPeerSubscribedStreams;
        __int16 v31 = 1024;
        BOOL v32 = v19;
        __int16 v33 = 1024;
        BOOL v34 = v18;
        __int16 v35 = 1024;
        BOOL v36 = v20;
        uint32_t v13 = " [%s] %s:%d %@(%p) captureEnabled=%d isRunning=%d _hasPeerSubscribedStreams=%d _allowSuspendProvisionedStreams=%d";
        uint32_t v14 = v17;
        uint32_t v15 = 72;
        goto LABEL_23;
      }
    }
  }
}

- (void)setupVideoPriority
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  LOBYTE(self->_captureSource) = 0;
  if ([(VCMediaStreamGroup *)self streamGroupID] == 1667329381)
  {
    int v3 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-priority-enabled", @"enableVideoPriority", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
    BOOL v4 = 0;
    if (v3) {
      BOOL v4 = +[VCHardwareSettings supportsVideoPriority];
    }
    BYTE2(self->_captureSource) = v4;
  }
  BYTE1(self->_captureSource) = 0;
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = BYTE2(self->_captureSource);
        int v15 = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        BOOL v18 = "-[VCVideoStreamSendGroup setupVideoPriority]";
        __int16 v19 = 1024;
        int v20 = 364;
        __int16 v21 = 1024;
        LODWORD(v22) = v8;
        BOOL v9 = " [%s] %s:%d _videoPriorityEnabled=%d";
        BOOL v10 = v7;
        uint32_t v11 = 34;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = BYTE2(self->_captureSource);
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        BOOL v18 = "-[VCVideoStreamSendGroup setupVideoPriority]";
        __int16 v19 = 1024;
        int v20 = 364;
        __int16 v21 = 2112;
        uint64_t v22 = v5;
        __int16 v23 = 2048;
        id v24 = self;
        __int16 v25 = 1024;
        int v26 = v14;
        BOOL v9 = " [%s] %s:%d %@(%p) _videoPriorityEnabled=%d";
        BOOL v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_15;
      }
    }
  }
}

void __VCVideoStreamSendGroup_ProcessVideoPriority_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)flushVideoRedundancyEventQueue
{
  int v3 = (void *)CMSimpleQueueDequeue(self->_videoRedundancyChangeEventQueue);
  if (v3)
  {
    BOOL v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_videoRedundancyPool, v4);
      BOOL v4 = (void *)CMSimpleQueueDequeue(self->_videoRedundancyChangeEventQueue);
    }
    while (v4);
  }
}

- (CGSize)getCaptureEncodingSize
{
  int v3 = objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject");
  if (self->super._streamGroupMode != 1 || v3 == 0) {
    int64_t maxSupportedMultiwayVideoResolution = self->_maxSupportedMultiwayVideoResolution;
  }
  else {
    int64_t maxSupportedMultiwayVideoResolution = [v3 videoResolution];
  }

  +[VideoUtil sizeForVideoResolution:maxSupportedMultiwayVideoResolution];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)dispatchedSetCaptureVideoRule:(id)a3
{
  self->_captureVideoRule = (VCVideoRule *)a3;
}

- (void)registerForVideoCapture:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamSendGroup *)self getCaptureEncodingSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  if ((VCVideoStreamSendGroup *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v9 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)uint64_t v22 = 136316930;
    *(void *)&v22[4] = v15;
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 428;
    WORD2(v23) = 2112;
    *(void *)((char *)&v23 + 6) = v9;
    HIWORD(v23) = 2048;
    id v24 = self;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v6;
    HIWORD(v25) = 1024;
    LODWORD(v26) = v8;
    WORD2(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 6) = v3;
    uint64_t v12 = " [%s] %s:%d %@(%p) encode = %dx%d %d fps";
    uint32_t v13 = v16;
    uint32_t v14 = 66;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint32_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v22 = 136316418;
      *(void *)&v22[4] = v10;
      *(_WORD *)&v22[12] = 2080;
      *(void *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 428;
      WORD2(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 6) = v6;
      WORD5(v23) = 1024;
      HIDWORD(v23) = v8;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v3;
      uint64_t v12 = " [%s] %s:%d encode = %dx%d %d fps";
      uint32_t v13 = v11;
      uint32_t v14 = 46;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v22, v14);
    }
  }
LABEL_12:
  if ([+[VCDefaults sharedInstance] forceHWI])
  {
    uint64_t v6 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    uint64_t v8 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    uint64_t v3 = [+[VCDefaults sharedInstance] forceFramerate];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      BOOL v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v22 = 136316418;
        *(void *)&v22[4] = v17;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 434;
        WORD2(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 6) = v6;
        WORD5(v23) = 1024;
        HIDWORD(v23) = v8;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v3;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forcing capture settings %dx%d %d fps", v22, 0x2Eu);
      }
    }
  }
  self->_captureFrameRate = v3;
  __int16 v19 = [VCVideoRule alloc];
  *(float *)&double v20 = (float)(int)v3;
  __int16 v21 = [(VCVideoRule *)v19 initWithFrameWidth:v6 frameHeight:v8 frameRate:v20];
  [(VCVideoStreamSendGroup *)self dispatchedSetCaptureVideoRule:v21];

  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, self, v6, v8, v3);
  [(VCVideoStreamSendGroup *)self sourceFrameRateDidChange:v3];
}

- (void)deregisterForVideoCapture
{
  [(VCVideoStreamSendGroup *)self dispatchedSetCaptureVideoRule:0];
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];

  [v3 deregisterForVideoFramesFromSource:3 withClient:self];
}

- (unsigned)getPixelFormat
{
  v2 = objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject");

  return [v2 pixelFormat];
}

- (id)registerForScreenCapture
{
  v2 = self;
  v7[1] = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamSendGroup *)self computeMaxScreenCaptureSize];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:v2 forKeyedSubscript:@"Client"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v2->_maxScreenCaptureSize.width), @"VideoWidth");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v2->_maxScreenCaptureSize.height), @"VideoHeight");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VCVideoStreamSendGroup maxStreamFrameRate](v2, "maxStreamFrameRate")), @"FrameRate");
  [v3 setObject:&unk_1F3DC6630 forKeyedSubscript:@"ScreenCaptureConfigurationDisplayMode"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ShouldSendBlackFramesOnClearScreen"];
  [v3 setObject:&unk_1F3DC6648 forKeyedSubscript:@"ResolutionScaling"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCVideoStreamSendGroup getPixelFormat](v2, "getPixelFormat")), @"PixelFormat");
  [v3 setObject:v4 forKeyedSubscript:@"EnableIdleFrameAdjustments"];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ScreenWatcherExempt"];
  [v3 setObject:v4 forKeyedSubscript:@"ShouldSupressDRMContent"];
  [v3 setObject:&unk_1F3DC6660 forKeyedSubscript:@"BiomeEventType"];
  [v3 setObject:v4 forKeyedSubscript:@"AllowRemoteControlLayers"];
  LOBYTE(v2) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:sourceConfig:", *(unsigned int *)(&v2->super._isSuspended + 3), v3);

  if (v2) {
    return 0;
  }
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Screen capture is busy or not permitted";
  return (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"VCVideoStreamGroup", -2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (void)deregisterForScreenCapture
{
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  uint64_t v4 = *(unsigned int *)(&self->super._isSuspended + 3);

  [v3 deregisterForVideoFramesFromSource:v4 withClient:self];
}

- (void)updateSuspendedState
{
  if (self->_isStreamInputCaptureSource)
  {
    BOOL v3 = [(VCMediaStreamSendGroup *)self isSuspended];
    id v4 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
    uint64_t v5 = *(unsigned int *)(&self->super._isSuspended + 3);
    if (v3)
    {
      [v4 suspendVideoSink:self withCaptureSource:v5];
    }
    else
    {
      [v4 resumeVideoSink:self withCaptureSource:v5];
    }
  }
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v43 = v10;
        __int16 v44 = 2080;
        v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        __int16 v46 = 1024;
        int v47 = 516;
        __int16 v48 = 2080;
        v49 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
        __int16 v50 = 2112;
        v51 = a3;
        __int16 v52 = 2112;
        uint64_t v53 = (uint64_t)a5;
        __int16 v54 = 1024;
        LODWORD(v55) = a4;
        uint64_t v12 = " [%s] %s:%d StreamGroup:%s VideoStreamIDs:%@ videoMediaBitrates:%@ for targetBitrate:%d";
        uint32_t v13 = v11;
        uint32_t v14 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v9 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        uint64_t v43 = v15;
        __int16 v44 = 2080;
        v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        __int16 v46 = 1024;
        int v47 = 516;
        __int16 v48 = 2112;
        v49 = (char *)v9;
        __int16 v50 = 2048;
        v51 = self;
        __int16 v52 = 2080;
        uint64_t v53 = (uint64_t)FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
        __int16 v54 = 2112;
        id v55 = a3;
        __int16 v56 = 2112;
        id v57 = a5;
        __int16 v58 = 1024;
        unsigned int v59 = a4;
        uint64_t v12 = " [%s] %s:%d %@(%p) StreamGroup:%s VideoStreamIDs:%@ videoMediaBitrates:%@ for targetBitrate:%d";
        uint32_t v13 = v16;
        uint32_t v14 = 84;
        goto LABEL_11;
      }
    }
  }
  unsigned int v36 = a4;
  [(NSMutableDictionary *)self->_pendingActiveUplinkStreams removeAllObjects];
  if ((int)[a3 count] >= 1)
  {
    uint64_t v18 = 0;
    unsigned int v19 = 0;
    *(void *)&long long v17 = 136315906;
    long long v35 = v17;
    while (1)
    {
      uint64_t v20 = objc_msgSend(a3, "objectAtIndexedSubscript:", v18, v35);
      __int16 v21 = (void *)[a5 objectAtIndexedSubscript:v18];
      id v22 = [(NSDictionary *)self->super.super._streamIDToMediaStreamMap objectForKeyedSubscript:v20];
      if (v22)
      {
        long long v23 = v22;
        [(NSMutableDictionary *)self->_pendingActiveUplinkStreams setObject:v22 forKeyedSubscript:v20];
        objc_msgSend(v23, "setTargetEncoderBitrate:", objc_msgSend(v21, "unsignedIntValue"));
      }
      else
      {
        if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_16;
          }
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          __int16 v31 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v35;
          uint64_t v43 = v30;
          __int16 v44 = 2080;
          v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          __int16 v46 = 1024;
          int v47 = 529;
          __int16 v48 = 2112;
          v49 = (char *)v20;
          uint64_t v27 = v31;
          id v28 = " [%s] %s:%d not found video stream with stream ID %@";
          uint32_t v29 = 38;
        }
        else
        {
          id v24 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            id v24 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_16;
          }
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          long long v26 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          __int16 v46 = 1024;
          int v47 = 529;
          __int16 v48 = 2112;
          v49 = (char *)v24;
          __int16 v50 = 2048;
          v51 = self;
          __int16 v52 = 2112;
          uint64_t v53 = v20;
          uint64_t v27 = v26;
          id v28 = " [%s] %s:%d %@(%p) not found video stream with stream ID %@";
          uint32_t v29 = 58;
        }
        _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, v28, buf, v29);
      }
LABEL_16:
      if ([(NSMutableArray *)self->_temporalStreamsIDs containsObject:v20]) {
        v19 |= 1 << [(NSMutableArray *)self->_temporalStreamsIDs indexOfObject:v20];
      }
      if (++v18 >= (int)[a3 count]) {
        goto LABEL_31;
      }
    }
  }
  unsigned int v19 = 0;
LABEL_31:
  if (self->_activeTemporalTierBitmap != v19)
  {
    self->_activeTemporalTierBitmap = v19;
    [(VCObject *)self reportingAgent];
    v40[0] = @"VCVSTxTemporalTier";
    uint64_t v32 = [NSNumber numberWithUnsignedInt:self->_activeTemporalTierBitmap];
    v40[1] = @"VCMSStreamGroup";
    v41[0] = v32;
    __int16 v33 = NSNumber;
    [(VCMediaStreamGroup *)self streamGroupID];
    v41[1] = [v33 numberWithUnsignedInt:reportingStreamGroupFromStreamGroupID()];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    reportingGenericEvent();
  }
  [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController setPendingVideoStreams:self->_pendingActiveUplinkStreams];
  BOOL v34 = [(VCMediaStreamSendGroup *)self isSuspended];
  if (((v34 ^ ([a3 count] != 0)) & 1) == 0)
  {
    -[VCMediaStreamSendGroup setIsSuspended:](self, "setIsSuspended:", [a3 count] == 0);
    [(VCVideoStreamSendGroup *)self updateSuspendedState];
  }
  v39.receiver = self;
  v39.super_class = (Class)VCVideoStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v39 dispatchedUpdateActiveMediaStreamIDs:a3 withTargetBitrate:v36 mediaBitrates:a5 rateChangeCounter:a6];
}

- (id)activeStreamKeys
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController activeVideoStreams];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = [(NSDictionary *)v4 allValues];
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
        if (v9) {
          uint64_t v10 = [NSNumber numberWithUnsignedShort:v9];
        }
        else {
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        }
        [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", self->super.super._participantUUID, v10)];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v6 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v40 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(mediaStreams);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v10 isTemporalScalingEnabled]) {
          [v10 setPeerSubscribedStreamIDs:a3];
        }
      }
      uint64_t v7 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v40 objects:v39 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [a3 count];
  BOOL v12 = v11 != 0;
  if (self->_allowSuspendProvisionedStreams && self->_hasPeerSubscribedStreams != v12)
  {
    uint64_t v14 = v11;
    long long v15 = (VCVideoStreamSendGroup *)objc_opt_class();
    if (v14)
    {
      if (v15 != self)
      {
        if (objc_opt_respondsToSelector()) {
          long long v16 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          long long v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_37;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        id v22 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v21;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
        __int16 v33 = 1024;
        int v34 = 576;
        __int16 v35 = 2112;
        unsigned int v36 = v16;
        __int16 v37 = 2048;
        v38 = self;
        uint64_t v20 = " [%s] %s:%d %@(%p) New remote subscriptions. Enable capture.";
        goto LABEL_35;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_37;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      unsigned int v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      uint64_t v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
      __int16 v33 = 1024;
      int v34 = 576;
      uint64_t v20 = " [%s] %s:%d New remote subscriptions. Enable capture.";
    }
    else
    {
      if (v15 != self)
      {
        if (objc_opt_respondsToSelector()) {
          long long v17 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          long long v17 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_37;
        }
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        id v22 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v26;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
        __int16 v33 = 1024;
        int v34 = 578;
        __int16 v35 = 2112;
        unsigned int v36 = v17;
        __int16 v37 = 2048;
        v38 = self;
        uint64_t v20 = " [%s] %s:%d %@(%p) No remote subscriptions. Disable capture.";
LABEL_35:
        id v24 = v22;
        uint32_t v25 = 48;
        goto LABEL_36;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_37;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      unsigned int v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v30 = v23;
      __int16 v31 = 2080;
      uint64_t v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
      __int16 v33 = 1024;
      int v34 = 578;
      uint64_t v20 = " [%s] %s:%d No remote subscriptions. Disable capture.";
    }
    id v24 = v19;
    uint32_t v25 = 28;
LABEL_36:
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v20, buf, v25);
LABEL_37:
    self->_BOOL hasPeerSubscribedStreams = v12;
    char v13 = 1;
    goto LABEL_38;
  }
  char v13 = 0;
LABEL_38:
  v28.receiver = self;
  v28.super_class = (Class)VCVideoStreamSendGroup;
  return v13 | [(VCMediaStreamSendGroup *)&v28 updateUplinkStreamsForPeerSubscribedStreams:a3];
}

- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController setStreamIDsCell:a4];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v7 updateUplinkBitrateCapCell:v5 activeStreamIDs:a4];
}

- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController setStreamIDsWifi:a4];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v7 updateUplinkBitrateCapWifi:v5 activeStreamIDs:a4];
}

- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v10 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController setIsLocalOnCellular:VCConnection_IsLocalOnCellular((uint64_t)a3) cappedVideoStreamIDs:a5];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v13 setActiveConnection:a3 uplinkBitrateCap:v10 activeMediaStreamIDs:a5 mediaBitrates:a6 rateChangeCounter:v7];
  [(VCRedundancyControllerProtocol *)[(VCMediaStreamSendGroup *)self redundancyController] resetNetworkStatistics];
}

- (id)streamDescriptionForMediaStreamConfig:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamGroup *)self mediaType] == 1986618469)
  {
    uint64_t v5 = (void *)[a3 multiwayConfig];
    if ([v5 resolution] == 27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      return (id)[NSString stringWithFormat:@"streamId=%hu quality=%u, %dx%d.", objc_msgSend(v5, "idsStreamID"), objc_msgSend(v5, "qualityIndex"), objc_msgSend(a3, "customWidth"), objc_msgSend(a3, "customHeight")];
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [v5 resolution]);
      return (id)[NSString stringWithFormat:@"streamId=%hu quality=%u, %dx%d.", objc_msgSend(v5, "idsStreamID"), objc_msgSend(v5, "qualityIndex"), (int)v7, (int)v8];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VCVideoStreamSendGroup;
    return [(VCMediaStreamSendGroup *)&v9 streamDescriptionForMediaStreamConfig:a3];
  }
}

- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = +[VCHardwareSettings maxVCPSupportedTemporalLayers];
  int v8 = [a4 containsObject:a3];
  if (!v8) {
    return v8;
  }
  if (![(NSMutableArray *)self->_temporalStreamsIDs containsObject:a3]
    || (int)[(NSMutableArray *)self->_temporalStreamsIDs count] < 1)
  {
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  while (1)
  {
    if (!objc_msgSend(a4, "containsObject:", -[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9)))goto LABEL_10; {
    if (++v10 == v7)
    }
    {
      if (objc_msgSend(a3, "isEqualToNumber:", -[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9)))break; {
    }
      }
    if (v10 > v7 || v9 > (int)[(NSMutableArray *)self->_temporalStreamsIDs indexOfObject:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        BOOL v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [a3 unsignedIntValue];
          unsigned int v14 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9), "unsignedIntValue");
          int v18 = 136316418;
          uint64_t v19 = v11;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCVideoStreamSendGroup shouldSubscribeToStreamID:peerSubscribedStreams:]";
          __int16 v22 = 1024;
          int v23 = 642;
          __int16 v24 = 1024;
          int v25 = v13;
          __int16 v26 = 1024;
          unsigned int v27 = v14;
          __int16 v28 = 1024;
          unsigned int v29 = v7;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not subscribing to streamID=%d either a higher temporal tier is subscribed (%d) or max active tiers=%d", (uint8_t *)&v18, 0x2Eu);
        }
      }
      [a4 removeObject:a3];
      LOBYTE(v8) = 0;
      return v8;
    }
LABEL_10:
    if (++v9 >= (int)[(NSMutableArray *)self->_temporalStreamsIDs count]) {
      goto LABEL_11;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136316162;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCVideoStreamSendGroup shouldSubscribeToStreamID:peerSubscribedStreams:]";
      __int16 v22 = 1024;
      int v23 = 637;
      __int16 v24 = 1024;
      int v25 = [a3 unsignedIntValue];
      __int16 v26 = 1024;
      unsigned int v27 = +[VCHardwareSettings maxVCPSupportedTemporalLayers];
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamID=%d is the highest temporal tier within max=%d", (uint8_t *)&v18, 0x28u);
    }
  }
LABEL_11:
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5
{
  char v8 = [a5 containsObject:a3];
  if ([a4 temporalScalingEnabled])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithArray:a5];
    unsigned int v10 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:self->_temporalStreamsIDs];
    [v10 intersectSet:v9];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  return v11 & ~v8;
}

- (BOOL)dispatchedEnableRedundancy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super.super._stateQueue);
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamSendGroup;
  BOOL v5 = [(VCMediaStreamSendGroup *)&v12 dispatchedEnableRedundancy:v3];
  if (v5
    && !self->super._streamGroupMode
    && (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 0)), "streamGroupRedundancyControlEnabled") & 1) == 0)
  {
    unsigned int v6 = v3 ? 50 : 0;
    self->_fecRatio = VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(v6);
    unsigned int v7 = VCMemoryPool_Alloc((OSQueueHead *)self->_videoRedundancyPool);
    _DWORD *v7 = v6;
    if (CMSimpleQueueEnqueue(self->_videoRedundancyChangeEventQueue, v7))
    {
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoStreamSendGroup dispatchedEnableRedundancy:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          char v8 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          char v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          unsigned int v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v9;
            __int16 v15 = 2080;
            long long v16 = "-[VCVideoStreamSendGroup dispatchedEnableRedundancy:]";
            __int16 v17 = 1024;
            int v18 = 694;
            __int16 v19 = 2112;
            __int16 v20 = v8;
            __int16 v21 = 2048;
            __int16 v22 = self;
            _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCMemoryPool_Free((OSQueueHead *)self->_videoRedundancyPool, v7);
    }
  }
  return v5;
}

- (void)setCaptureFrameRate:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCVideoStreamSendGroup_setCaptureFrameRate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(stateQueue, block);
}

void __46__VCVideoStreamSendGroup_setCaptureFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 732) == 3)
  {
    int v3 = *(_DWORD *)(a1 + 40);
    if (v3 == *(_DWORD *)(v2 + 768)) {
      return;
    }
    if (v3 > *(_DWORD *)(v2 + 772))
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          uint64_t v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = *(void *)(a1 + 32);
            int v25 = *(_DWORD *)(v24 + 768);
            LODWORD(v24) = *(_DWORD *)(v24 + 772);
            int v26 = *(_DWORD *)(a1 + 40);
            int v37 = 136316418;
            uint64_t v38 = v22;
            __int16 v39 = 2080;
            long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            __int16 v41 = 1024;
            int v42 = 706;
            __int16 v43 = 1024;
            *(_DWORD *)uint64_t v44 = v25;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v24;
            LOWORD(v45) = 1024;
            *(_DWORD *)((char *)&v45 + 2) = v26;
            uint64_t v9 = " [%s] %s:%d Ignoring the change of captureFrameRate. currentCaptureFrameRate=%d maxSupportedMultiwayFra"
                 "meRate=%d framerate=%d";
            unsigned int v10 = v23;
            uint32_t v11 = 46;
            goto LABEL_17;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v18 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          int v18 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          uint64_t v32 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            int v34 = *(_DWORD *)(v33 + 768);
            int v35 = *(_DWORD *)(v33 + 772);
            int v36 = *(_DWORD *)(a1 + 40);
            int v37 = 136316930;
            uint64_t v38 = v31;
            __int16 v39 = 2080;
            long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            __int16 v41 = 1024;
            int v42 = 706;
            __int16 v43 = 2112;
            *(void *)uint64_t v44 = v18;
            *(_WORD *)&v44[8] = 2048;
            uint64_t v45 = v33;
            __int16 v46 = 1024;
            int v47 = v34;
            __int16 v48 = 1024;
            int v49 = v35;
            __int16 v50 = 1024;
            int v51 = v36;
            uint64_t v9 = " [%s] %s:%d %@(%p) Ignoring the change of captureFrameRate. currentCaptureFrameRate=%d maxSupportedMult"
                 "iwayFrameRate=%d framerate=%d";
            unsigned int v10 = v32;
            uint32_t v11 = 66;
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      if (*(_DWORD *)(v2 + 316) == 1 && !*(unsigned char *)(v2 + 288))
      {
        [(id)v2 deregisterForVideoCapture];
        [*(id *)(a1 + 32) registerForVideoCapture:*(unsigned int *)(a1 + 40)];
      }
      else
      {
        *(_DWORD *)(v2 + 768) = v3;
      }
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(a1 + 32);
            int v8 = *(_DWORD *)(v7 + 768);
            LODWORD(v7) = *(unsigned __int8 *)(v7 + 288);
            int v37 = 136316162;
            uint64_t v38 = v5;
            __int16 v39 = 2080;
            long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            __int16 v41 = 1024;
            int v42 = 714;
            __int16 v43 = 1024;
            *(_DWORD *)uint64_t v44 = v8;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v7;
            uint64_t v9 = " [%s] %s:%d Set capture rate to %d fps areStreamsSuspended=%{BOOL}d";
            unsigned int v10 = v6;
            uint32_t v11 = 40;
LABEL_17:
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, v11);
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
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          int v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(a1 + 32);
            int v15 = *(_DWORD *)(v14 + 768);
            int v16 = *(unsigned __int8 *)(v14 + 288);
            int v37 = 136316674;
            uint64_t v38 = v12;
            __int16 v39 = 2080;
            long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            __int16 v41 = 1024;
            int v42 = 714;
            __int16 v43 = 2112;
            *(void *)uint64_t v44 = v4;
            *(_WORD *)&v44[8] = 2048;
            uint64_t v45 = v14;
            __int16 v46 = 1024;
            int v47 = v15;
            __int16 v48 = 1024;
            int v49 = v16;
            uint64_t v9 = " [%s] %s:%d %@(%p) Set capture rate to %d fps areStreamsSuspended=%{BOOL}d";
            unsigned int v10 = v13;
            uint32_t v11 = 60;
            goto LABEL_17;
          }
        }
      }
    }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *(_DWORD *)(*(void *)(a1 + 32) + 732);
        int v37 = 136315906;
        uint64_t v38 = v19;
        __int16 v39 = 2080;
        long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 704;
        __int16 v43 = 1024;
        *(_DWORD *)uint64_t v44 = v21;
        uint64_t v9 = " [%s] %s:%d Cannot set capture framerate for captureSource=%d";
        unsigned int v10 = v20;
        uint32_t v11 = 34;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        int v30 = *(_DWORD *)(v29 + 732);
        int v37 = 136316418;
        uint64_t v38 = v27;
        __int16 v39 = 2080;
        long long v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 704;
        __int16 v43 = 2112;
        *(void *)uint64_t v44 = v17;
        *(_WORD *)&v44[8] = 2048;
        uint64_t v45 = v29;
        __int16 v46 = 1024;
        int v47 = v30;
        uint64_t v9 = " [%s] %s:%d %@(%p) Cannot set capture framerate for captureSource=%d";
        unsigned int v10 = v28;
        uint32_t v11 = 54;
        goto LABEL_17;
      }
    }
  }
}

- (void)setMediaQueueSize:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCVideoStreamSendGroup_setMediaQueueSize___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __44__VCVideoStreamSendGroup_setMediaQueueSize___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 876) = *(_DWORD *)(a1 + 40);
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 784) activeVideoStreams];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = (void *)[v2 allValues];
  uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        VCVideoStream_SetMediaQueueSize(*(void *)(*((void *)&v9 + 1) + 8 * v7++), *(_DWORD *)(a1 + 40));
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (id)startCapture
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)__int16 v48 = 136315906;
        *(void *)&v48[4] = v4;
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 733;
        WORD2(v49) = 1024;
        *(_DWORD *)((char *)&v49 + 6) = v6;
        uint64_t v7 = " [%s] %s:%d Registering for video capture of type: %d";
        int v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v48, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v3 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)__int16 v48 = 136316418;
        *(void *)&v48[4] = v10;
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 733;
        WORD2(v49) = 2112;
        *(void *)((char *)&v49 + 6) = v3;
        HIWORD(v49) = 2048;
        __int16 v50 = self;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v12;
        uint64_t v7 = " [%s] %s:%d %@(%p) Registering for video capture of type: %d";
        int v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  [(VCSessionUplinkVideoStreamController *)self->_uplinkVideoStreamController restart];
  self->_isStreamInputCaptureSource = 0;
  if (![+[VCDefaults sharedInstance] forceFECRepairStream])goto LABEL_25; {
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  }
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_24;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)__int16 v48 = 136315650;
    *(void *)&v48[4] = v14;
    *(_WORD *)&v48[12] = 2080;
    *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
    *(_WORD *)&v48[22] = 1024;
    LODWORD(v49) = 737;
    int v16 = " [%s] %s:%d _enableRedundancy set to YES by forceFECRepairStream";
    __int16 v17 = v15;
    uint32_t v18 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_24;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)__int16 v48 = 136316162;
    *(void *)&v48[4] = v19;
    *(_WORD *)&v48[12] = 2080;
    *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
    *(_WORD *)&v48[22] = 1024;
    LODWORD(v49) = 737;
    WORD2(v49) = 2112;
    *(void *)((char *)&v49 + 6) = v13;
    HIWORD(v49) = 2048;
    __int16 v50 = self;
    int v16 = " [%s] %s:%d %@(%p) _enableRedundancy set to YES by forceFECRepairStream";
    __int16 v17 = v20;
    uint32_t v18 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v48, v18);
LABEL_24:
  -[VCVideoStreamSendGroup dispatchedEnableRedundancy:](self, "dispatchedEnableRedundancy:", 1, *(void *)v48, *(_OWORD *)&v48[8], v49, v50);
LABEL_25:
  int v21 = (void *)MEMORY[0x1E4E56580](&self->_clientCaptureController);
  if (!v21)
  {
    int v24 = *(_DWORD *)(&self->super._isSuspended + 3);
    if ((v24 - 1) >= 2)
    {
      if (v24 == 3)
      {
        [(VCVideoStreamSendGroup *)self registerForVideoCapture:self->_captureFrameRate];
      }
      else
      {
        self->_isStreamInputCaptureSource = 1;
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerVideoSink:withCaptureSource:", self, *(unsigned int *)(&self->super._isSuspended + 3));
        [(VCVideoStreamSendGroup *)self updateSuspendedState];
      }
      return 0;
    }
    unsigned int v25 = [(VCMediaStreamGroup *)self streamGroupID];
    int v26 = (VCVideoStreamSendGroup *)objc_opt_class();
    if (v25 == 1935897189)
    {
      if (v26 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_49;
        }
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        int v30 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_49;
        }
        int v31 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)__int16 v48 = 136315906;
        *(void *)&v48[4] = v29;
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 751;
        WORD2(v49) = 1024;
        *(_DWORD *)((char *)&v49 + 6) = v31;
        uint64_t v32 = " [%s] %s:%d Registering for screen capture of type: %d";
        uint64_t v33 = v30;
        uint32_t v34 = 34;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v27 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v27 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_49;
        }
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        int v42 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_49;
        }
        int v43 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)__int16 v48 = 136316418;
        *(void *)&v48[4] = v41;
        *(_WORD *)&v48[12] = 2080;
        *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 751;
        WORD2(v49) = 2112;
        *(void *)((char *)&v49 + 6) = v27;
        HIWORD(v49) = 2048;
        __int16 v50 = self;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v43;
        uint64_t v32 = " [%s] %s:%d %@(%p) Registering for screen capture of type: %d";
        uint64_t v33 = v42;
        uint32_t v34 = 54;
      }
      _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v32, v48, v34);
LABEL_49:
      [(VCVideoStreamSendGroup *)self registerClientForScreenShare];
      return 0;
    }
    if (v26 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return [(VCVideoStreamSendGroup *)self registerForScreenCapture];
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      int v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return [(VCVideoStreamSendGroup *)self registerForScreenCapture];
      }
      int v37 = *(_DWORD *)(&self->super._isSuspended + 3);
      *(_DWORD *)__int16 v48 = 136315906;
      *(void *)&v48[4] = v35;
      *(_WORD *)&v48[12] = 2080;
      *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
      *(_WORD *)&v48[22] = 1024;
      LODWORD(v49) = 754;
      WORD2(v49) = 1024;
      *(_DWORD *)((char *)&v49 + 6) = v37;
      uint64_t v38 = " [%s] %s:%d Registering for screen capture of type: %d";
      __int16 v39 = v36;
      uint32_t v40 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v28 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return [(VCVideoStreamSendGroup *)self registerForScreenCapture];
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      uint64_t v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return [(VCVideoStreamSendGroup *)self registerForScreenCapture];
      }
      int v46 = *(_DWORD *)(&self->super._isSuspended + 3);
      *(_DWORD *)__int16 v48 = 136316418;
      *(void *)&v48[4] = v44;
      *(_WORD *)&v48[12] = 2080;
      *(void *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
      *(_WORD *)&v48[22] = 1024;
      LODWORD(v49) = 754;
      WORD2(v49) = 2112;
      *(void *)((char *)&v49 + 6) = v28;
      HIWORD(v49) = 2048;
      __int16 v50 = self;
      LOWORD(v51) = 1024;
      *(_DWORD *)((char *)&v51 + 2) = v46;
      uint64_t v38 = " [%s] %s:%d %@(%p) Registering for screen capture of type: %d";
      __int16 v39 = v45;
      uint32_t v40 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, v38, v48, v40);
    return [(VCVideoStreamSendGroup *)self registerForScreenCapture];
  }
  uint64_t v22 = v21;
  uint64_t v23 = (void *)[v21 startCapture];
  CFRelease(v22);
  return v23;
}

- (id)stopCapture
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      int v3 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(&self->super._isSuspended + 3);
    int v18 = 136316418;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    int v21 = "-[VCVideoStreamSendGroup stopCapture]";
    __int16 v22 = 1024;
    int v23 = 772;
    __int16 v24 = 2112;
    unsigned int v25 = v3;
    __int16 v26 = 2048;
    uint64_t v27 = self;
    __int16 v28 = 1024;
    int v29 = v12;
    uint64_t v7 = " [%s] %s:%d %@(%p) Unregistering from video capture of type: %d";
    int v8 = v11;
    uint32_t v9 = 54;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(&self->super._isSuspended + 3);
      int v18 = 136315906;
      uint64_t v19 = v4;
      __int16 v20 = 2080;
      int v21 = "-[VCVideoStreamSendGroup stopCapture]";
      __int16 v22 = 1024;
      int v23 = 772;
      __int16 v24 = 1024;
      LODWORD(v25) = v6;
      uint64_t v7 = " [%s] %s:%d Unregistering from video capture of type: %d";
      int v8 = v5;
      uint32_t v9 = 34;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, v9);
    }
  }
LABEL_12:
  uint64_t v13 = (void *)MEMORY[0x1E4E56580](&self->_clientCaptureController);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = (void *)[v13 stopCapture];
    CFRelease(v14);
  }
  else
  {
    int v16 = *(_DWORD *)(&self->super._isSuspended + 3);
    if ((v16 - 1) >= 2)
    {
      if (v16 == 3) {
        [(VCVideoStreamSendGroup *)self deregisterForVideoCapture];
      }
      else {
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterVideoSink:withCaptureSource:", self, *(unsigned int *)(&self->super._isSuspended + 3));
      }
    }
    else if ([(VCMediaStreamGroup *)self streamGroupID] == 1935897189)
    {
      [(VCVideoStreamSendGroup *)self deregisterClientForScreenShare];
    }
    else
    {
      [(VCVideoStreamSendGroup *)self deregisterForScreenCapture];
    }
    return 0;
  }
  return v15;
}

- (id)captureConfigForScreenShare
{
  [(VCVideoStreamSendGroup *)self computeMaxScreenCaptureSize];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_maxScreenCaptureSize.width), @"VideoWidth");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_maxScreenCaptureSize.height), @"VideoHeight");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VCVideoStreamSendGroup maxStreamFrameRate](self, "maxStreamFrameRate")), @"FrameRate");
  [v3 setObject:&unk_1F3DC6630 forKeyedSubscript:@"ScreenCaptureConfigurationDisplayMode"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ShouldSendBlackFramesOnClearScreen"];
  [v3 setObject:&unk_1F3DC6648 forKeyedSubscript:@"ResolutionScaling"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCVideoStreamSendGroup getPixelFormat](self, "getPixelFormat")), @"PixelFormat");
  [v3 setObject:v4 forKeyedSubscript:@"EnableIdleFrameAdjustments"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ScreenWatcherExempt"];
  [v3 setObject:v4 forKeyedSubscript:@"ShouldSupressDRMContent"];
  [v3 setObject:v4 forKeyedSubscript:@"ShouldAllowReconfigureForLocalDisplay"];
  [v3 setObject:v5 forKeyedSubscript:@"ShouldOptimizeForLowLatency"];
  [v3 setObject:&unk_1F3DC6660 forKeyedSubscript:@"BiomeEventType"];
  [v3 setObject:v4 forKeyedSubscript:@"AllowRemoteControlLayers"];

  return v3;
}

- (void)registerConfigForScreenShare
{
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  id v4 = [(VCVideoStreamSendGroup *)self captureConfigForScreenShare];

  [v3 registerCaptureConfig:v4 forSource:1];
}

- (void)registerClientForScreenShare
{
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];

  [v3 registerCaptureClientForScreenShare:self];
}

- (void)deregisterClientForScreenShare
{
  id v3 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];

  [v3 deregisterCaptureClientForScreenShare:self];
}

- (void)controller:(id)a3 didChangeActiveVideoStreams:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v7;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        __int16 v29 = 1024;
        int v30 = 845;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)a4;
        uint32_t v9 = " [%s] %s:%d activeVideoStreams:%@";
        uint64_t v10 = v8;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v6 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        __int16 v29 = 1024;
        int v30 = 845;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v6;
        __int16 v33 = 2048;
        uint32_t v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)a4;
        uint32_t v9 = " [%s] %s:%d %@(%p) activeVideoStreams:%@";
        uint64_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__VCVideoStreamSendGroup_controller_didChangeActiveVideoStreams___block_invoke;
  v24[3] = &unk_1E6DB96C0;
  v24[4] = self;
  -[VCMediaStreamSendGroup updateStreamIDCompoundingWithBlock:activeStreamIds:](self, "updateStreamIDCompoundingWithBlock:activeStreamIds:", v24, [a4 allKeys]);
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [a4 allKeys];
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v15;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        __int16 v29 = 1024;
        int v30 = 863;
        __int16 v31 = 2112;
        uint64_t v32 = v17;
        int v18 = " [%s] %s:%d Currently sending streamIDs %@";
        uint64_t v19 = v16;
        uint32_t v20 = 38;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [a4 allKeys];
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        __int16 v29 = 1024;
        int v30 = 863;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v14;
        __int16 v33 = 2048;
        uint32_t v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = v23;
        int v18 = " [%s] %s:%d %@(%p) Currently sending streamIDs %@";
        uint64_t v19 = v22;
        uint32_t v20 = 58;
        goto LABEL_22;
      }
    }
  }
  -[VCMediaStreamSendGroup calculateUplinkTotalBitrateForMediaStreams:](self, "calculateUplinkTotalBitrateForMediaStreams:", [a4 allValues]);
}

uint64_t __65__VCVideoStreamSendGroup_controller_didChangeActiveVideoStreams___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 472)) {
    objc_msgSend(a2, "setStreamIDs:repairStreamIDs:");
  }
  [a2 setIsServerBasedBandwidthProbingEnabled:a5];
  uint64_t result = [a2 isCompoundStreamIDsIncreased];
  if (result)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22, v23), 0);
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22, v23), 0);
      }
      *(_DWORD *)uint64_t v19 = 136315906;
      *(void *)&v19[4] = v11;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 856;
      WORD2(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 6) = v9;
      uint64_t v13 = " [%s] %s:%d compound streamID increased for stream %hu, generating key frame";
      uint64_t v14 = v12;
      uint32_t v15 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22, v23), 0);
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22, v23), 0);
      }
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v19 = 136316418;
      *(void *)&v19[4] = v16;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 856;
      WORD2(v20) = 2112;
      *(void *)((char *)&v20 + 6) = v10;
      HIWORD(v20) = 2048;
      uint64_t v21 = v18;
      LOWORD(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 2) = v9;
      uint64_t v13 = " [%s] %s:%d %@(%p) compound streamID increased for stream %hu, generating key frame";
      uint64_t v14 = v17;
      uint32_t v15 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v19, v15);
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22, v23), 0);
  }
  return result;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCVideoStreamSendGroup sourceFrameRateDidChange:]";
        __int16 v27 = 1024;
        int v28 = 870;
        __int16 v29 = 1024;
        LODWORD(v30) = v3;
        int v8 = " [%s] %s:%d frameRate=%u";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCVideoStreamSendGroup sourceFrameRateDidChange:]";
        __int16 v27 = 1024;
        int v28 = 870;
        __int16 v29 = 2112;
        int v30 = v5;
        __int16 v31 = 2048;
        uint64_t v32 = self;
        __int16 v33 = 1024;
        int v34 = v3;
        int v8 = " [%s] %s:%d %@(%p) frameRate=%u";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v14 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) sourceFrameRateDidChange:v3];
      }
      uint64_t v15 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v15);
  }
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CMTime v6 = *(CMTime *)a4;
  return VCVideoStreamSendGroup_OnVideoFrame((uint64_t)self, a3, &v6, (uint64_t)a5);
}

- (id)copyOnVideoFrameBlock
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCVideoStreamSendGroup_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E6DB7C50;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __47__VCVideoStreamSendGroup_copyOnVideoFrameBlock__block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, CMTime *a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  CMTime v6 = *a3;
  return VCVideoStreamSendGroup_OnVideoFrame(v4, a2, &v6, a4);
}

- (void)avConferencePreviewError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCVideoStreamSendGroup avConferencePreviewError:]";
        __int16 v17 = 1024;
        int v18 = 941;
        __int16 v19 = 2112;
        id v20 = a3;
        int v8 = " [%s] %s:%d avConferencePreviewError %@";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCVideoStreamSendGroup avConferencePreviewError:]";
        __int16 v17 = 1024;
        int v18 = 941;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2048;
        long long v22 = self;
        __int16 v23 = 2112;
        id v24 = a3;
        int v8 = " [%s] %s:%d %@(%p) avConferencePreviewError %@";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (id)clientCaptureRule
{
  return 0;
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCVideoStreamSendGroup thermalLevelDidChange:]";
        __int16 v20 = 1024;
        int v21 = 949;
        __int16 v22 = 1024;
        LODWORD(v23) = a3;
        int v8 = " [%s] %s:%d thermalLevelDidChange %u";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCVideoStreamSendGroup thermalLevelDidChange:]";
        __int16 v20 = 1024;
        int v21 = 949;
        __int16 v22 = 2112;
        __int16 v23 = v5;
        __int16 v24 = 2048;
        uint64_t v25 = self;
        __int16 v26 = 1024;
        int v27 = a3;
        int v8 = " [%s] %s:%d %@(%p) thermalLevelDidChange %u";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  stateQueue = self->super.super._stateQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__VCVideoStreamSendGroup_thermalLevelDidChange___block_invoke;
  v14[3] = &unk_1E6DB3F08;
  v14[4] = self;
  int v15 = a3;
  dispatch_async(stateQueue, v14);
  [(VCObject *)self reportingAgent];
  micro();
  reportingThermal();
}

uint64_t __48__VCVideoStreamSendGroup_thermalLevelDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "allValues"));
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) thermalLevelDidChange:*(unsigned int *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    long long v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v15 = 136315906;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
      __int16 v19 = 1024;
      int v20 = 959;
      __int16 v21 = 1024;
      LODWORD(v22) = v3;
      long long v9 = " [%s] %s:%d cameraAvailabilityDidChange=%d ignored";
      long long v10 = v7;
      uint32_t v11 = 34;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      return;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(VCVideoStreamSendGroup *)v6 cameraAvailabilityDidChange:v7];
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
        __int16 v19 = 1024;
        int v20 = 959;
        __int16 v21 = 2112;
        __int16 v22 = v5;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 1024;
        BOOL v26 = v3;
        long long v9 = " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored";
        long long v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
        __int16 v19 = 1024;
        int v20 = 959;
        __int16 v21 = 2112;
        __int16 v22 = v5;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 1024;
        BOOL v26 = v3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored", (uint8_t *)&v15, 0x36u);
      }
    }
  }
}

- (void)frameRateIsBeingThrottled:(int)a3 thermalLevelDidChange:(BOOL)a4 powerLevelDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, @"VCSPUUID", self->super.super._participantUUID);
  CFDictionaryAddValue(Mutable, @"VCSPFR", (const void *)[NSNumber numberWithInt:v7]);
  CFDictionaryAddValue(Mutable, @"VCSPTLC", (const void *)[NSNumber numberWithBool:v6]);
  CFDictionaryAddValue(Mutable, @"VCSPPLC", (const void *)[NSNumber numberWithBool:v5]);
  [(VCObject *)self reportingAgent];
  reportingGenericEvent();
  if (Mutable) {
    CFRelease(Mutable);
  }

  [(VCVideoStreamSendGroup *)self sourceFrameRateDidChange:v7];
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
  v5[3] = &unk_1E6DB3EE0;
  v5[4] = a3;
  v5[5] = self;
  unsigned int v6 = a4;
  dispatch_async(stateQueue, v5);
}

void __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3 != v2[60]) {
    return;
  }
  if ([v2 dispatchedEnableRedundancy:*(_DWORD *)(a1 + 48) != 0]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_2;
    v21[3] = &unk_1E6DB4630;
    v21[4] = v4;
    [v4 callDelegateWithBlock:v21];
  }
  BOOL v5 = VCMemoryPool_Alloc(*(OSQueueHead **)(*(void *)(a1 + 40) + 792));
  _DWORD *v5 = *(_DWORD *)(a1 + 48);
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      long long v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v7;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 996;
        __int16 v28 = 1024;
        LODWORD(v29) = v9;
        long long v10 = " [%s] %s:%d Enqueue new redundancyPercentage=%d";
        uint32_t v11 = v8;
        uint32_t v12 = 34;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v6 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      unsigned int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        int v16 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 996;
        __int16 v28 = 2112;
        __int16 v29 = v6;
        __int16 v30 = 2048;
        uint64_t v31 = v15;
        __int16 v32 = 1024;
        int v33 = v16;
        long long v10 = " [%s] %s:%d %@(%p) Enqueue new redundancyPercentage=%d";
        uint32_t v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_15;
      }
    }
  }
  if (CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(*(void *)(a1 + 40) + 800), v5))
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        __int16 v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          __int16 v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          __int16 v26 = 1024;
          int v27 = 999;
          __int16 v28 = 2112;
          __int16 v29 = v17;
          __int16 v30 = 2048;
          uint64_t v31 = v20;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
        }
      }
    }
    VCMemoryPool_Free(*(OSQueueHead **)(*(void *)(a1 + 40) + 792), v5);
  }
}

uint64_t __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didRequestRedundancy:*(unsigned __int8 *)(*(void *)(a1 + 32) + 428)];
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4->var0)
  {
    stateQueue = self->super.super._stateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __73__VCVideoStreamSendGroup_redundancyController_redundancyVectorDidChange___block_invoke;
    v7[3] = &unk_1E6DB96E8;
    v7[4] = a3;
    v7[5] = self;
    long long v5 = *(_OWORD *)&a4->var1[23].var0;
    long long v10 = *(_OWORD *)&a4->var1[15].var0;
    long long v11 = v5;
    $06D0163FE0D7AFE752A9F21F38483579 v12 = a4->var1[31];
    long long v6 = *(_OWORD *)&a4->var1[7].var0;
    long long v8 = *(_OWORD *)&a4->var0;
    long long v9 = v6;
    dispatch_async(stateQueue, v7);
  }
}

void __73__VCVideoStreamSendGroup_redundancyController_redundancyVectorDidChange___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3 != *(void *)(v2 + 480) || *(_DWORD *)(v2 + 472) != 1)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v15 = *(__CFString **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(v14 + 480);
      LODWORD(v14) = *(_DWORD *)(v14 + 472);
      *(_DWORD *)buf = 136316418;
      uint64_t v32 = v12;
      __int16 v33 = 2080;
      uint64_t v34 = "-[VCVideoStreamSendGroup redundancyController:redundancyVectorDidChange:]_block_invoke";
      __int16 v35 = 1024;
      int v36 = 1014;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      __int16 v41 = 1024;
      LODWORD(v42) = v14;
      __int16 v17 = " [%s] %s:%d Ignoring redundancy controller callback for controller=%@, current controller=%@, streamGroupMode=%u";
      uint64_t v18 = v13;
      uint32_t v19 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v11 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        long long v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v24 = *(void *)(v22 + 480);
      int v25 = *(_DWORD *)(v22 + 472);
      *(_DWORD *)buf = 136316930;
      uint64_t v32 = v20;
      __int16 v33 = 2080;
      uint64_t v34 = "-[VCVideoStreamSendGroup redundancyController:redundancyVectorDidChange:]_block_invoke";
      __int16 v35 = 1024;
      int v36 = 1014;
      __int16 v37 = 2112;
      uint64_t v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = v22;
      __int16 v41 = 2112;
      uint64_t v42 = v23;
      __int16 v43 = 2112;
      uint64_t v44 = v24;
      __int16 v45 = 1024;
      int v46 = v25;
      __int16 v17 = " [%s] %s:%d %@(%p) Ignoring redundancy controller callback for controller=%@, current controller=%@, streamGroupMode=%u";
      uint64_t v18 = v21;
      uint32_t v19 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    return;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = *(void **)(v2 + 168);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    uint64_t v8 = a1 + 48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) stream];
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "isOneToOne"))objc_msgSend(v10, "setFECRedundancyVector:", v8); {
      }
        }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        long long v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]";
        __int16 v12 = 1024;
        int v13 = 1030;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        long long v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]";
        __int16 v12 = 1024;
        int v13 = 1034;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        long long v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]";
        __int16 v12 = 1024;
        int v13 = 1038;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)updateSendSampleRTPTimestamp:(unsigned int)a3 sampleRate:(double)a4 systemTime:(double)a5
{
}

- (void)computeMaxScreenCaptureSize
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = self->super.super._mediaStreamInfoArray;
  uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v28)
  {
    unint64_t v3 = 0;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v6 = (void *)[v5 streamConfigs];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v43 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v45 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              if ([v11 videoResolution] == 27)
              {
                uint64_t v12 = [v11 customWidth];
                unint64_t v13 = [v11 customHeight] * v12;
                if (v13 > v3)
                {
                  self->_maxScreenCaptureSize.CGFloat width = (double)(unint64_t)[v11 customWidth];
                  self->_maxScreenCaptureSize.CGFloat height = (double)(unint64_t)[v11 customHeight];
                  unint64_t v3 = v13;
                }
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v43 count:16];
          }
          while (v8);
        }
      }
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v48 count:16];
    }
    while (v28);
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat width = self->_maxScreenCaptureSize.width;
        CGFloat height = self->_maxScreenCaptureSize.height;
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v15;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCVideoStreamSendGroup computeMaxScreenCaptureSize]";
        __int16 v33 = 1024;
        int v34 = 1064;
        __int16 v35 = 2048;
        CGFloat v36 = width;
        __int16 v37 = 2048;
        uint64_t v38 = *(VCVideoStreamSendGroup **)&height;
        id v19 = " [%s] %s:%d Max Screen capture size: width = %f, height = %f";
        uint64_t v20 = v16;
        uint32_t v21 = 48;
LABEL_28:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v25 = self->_maxScreenCaptureSize.width;
        CGFloat v24 = self->_maxScreenCaptureSize.height;
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v22;
        __int16 v31 = 2080;
        uint64_t v32 = "-[VCVideoStreamSendGroup computeMaxScreenCaptureSize]";
        __int16 v33 = 1024;
        int v34 = 1064;
        __int16 v35 = 2112;
        CGFloat v36 = *(double *)&v14;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2048;
        CGFloat v40 = v25;
        __int16 v41 = 2048;
        CGFloat v42 = v24;
        id v19 = " [%s] %s:%d %@(%p) Max Screen capture size: width = %f, height = %f";
        uint64_t v20 = v23;
        uint32_t v21 = 68;
        goto LABEL_28;
      }
    }
  }
}

- (unint64_t)maxStreamFrameRate
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
  uint64_t v3 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v43 objects:v42 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(mediaStreamInfoArray);
        }
        uint64_t v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v9 = (void *)[v8 streamConfigs];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v39 != v12) {
                objc_enumerationMutation(v9);
              }
              __int16 v14 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              if ([v14 framerate] > v5) {
                unint64_t v5 = [v14 framerate];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v37 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v43 objects:v42 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v16;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCVideoStreamSendGroup maxStreamFrameRate]";
        __int16 v29 = 1024;
        int v30 = 1076;
        __int16 v31 = 1024;
        LODWORD(v32) = v5;
        __int16 v18 = " [%s] %s:%d Max Screen capture frame rate: = %d";
        id v19 = v17;
        uint32_t v20 = 34;
LABEL_29:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCVideoStreamSendGroup maxStreamFrameRate]";
        __int16 v29 = 1024;
        int v30 = 1076;
        __int16 v31 = 2112;
        uint64_t v32 = v15;
        __int16 v33 = 2048;
        int v34 = self;
        __int16 v35 = 1024;
        int v36 = v5;
        __int16 v18 = " [%s] %s:%d %@(%p) Max Screen capture frame rate: = %d";
        id v19 = v22;
        uint32_t v20 = 54;
        goto LABEL_29;
      }
    }
  }
  return v5;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v6 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v58 objects:v57 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v59;
    *(void *)&long long v7 = 136317442;
    long long v30 = v7;
    __int16 v31 = mediaStreams;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(mediaStreams);
        }
        uint64_t v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v11, "state", v30) == 2)
        {
          uint64_t v56 = 0;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v53 = 0u;
          memset(v52, 0, sizeof(v52));
          [v11 collectTxChannelMetrics:v52];
          VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v52);
          if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v23 = VRTraceErrorLogLevelToCSTR();
              CGFloat v24 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                CGFloat v25 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
                int v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                int v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                unsigned int totalNumFramesReceived = self->_totalNumFramesReceived;
                unsigned int totalNumFramesProcessed = self->_totalNumFramesProcessed;
                *(_DWORD *)buf = v30;
                uint64_t v34 = v23;
                __int16 v35 = 2080;
                int v36 = "-[VCVideoStreamSendGroup collectAndLogChannelMetrics:]";
                __int16 v37 = 1024;
                int v38 = 1086;
                __int16 v39 = 2080;
                long long v40 = v25;
                __int16 v41 = 1024;
                *(_DWORD *)CGFloat v42 = v26;
                mediaStreams = v31;
                *(_WORD *)&v42[4] = 1024;
                *(_DWORD *)&v42[6] = v27;
                LOWORD(v43) = 1024;
                *(_DWORD *)((char *)&v43 + 2) = v52[0];
                HIWORD(v43) = 2048;
                uint64_t v44 = v53;
                *(_WORD *)long long v45 = 1024;
                *(_DWORD *)&v45[2] = totalNumFramesReceived;
                *(_WORD *)long long v46 = 1024;
                *(_DWORD *)&v46[2] = totalNumFramesProcessed;
                uint32_t v20 = v24;
                uint64_t v21 = " [%s] %s:%d Health Monitor for Video Stream Send GroupID=%s StreamID[main:%u repair:%u] Video[%ukb"
                      "ps %4.1ffps] Frames Received=%u Processed=%u";
                uint32_t v22 = 78;
                goto LABEL_16;
              }
            }
          }
          else
          {
            uint64_t v12 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v12 = (__CFString *)[(VCVideoStreamSendGroup *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              __int16 v14 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v32 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
                uint64_t v15 = a3;
                int v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                int v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                unsigned int v18 = self->_totalNumFramesReceived;
                unsigned int v19 = self->_totalNumFramesProcessed;
                *(_DWORD *)buf = 136317954;
                uint64_t v34 = v13;
                __int16 v35 = 2080;
                int v36 = "-[VCVideoStreamSendGroup collectAndLogChannelMetrics:]";
                __int16 v37 = 1024;
                int v38 = 1086;
                __int16 v39 = 2112;
                long long v40 = v12;
                __int16 v41 = 2048;
                *(void *)CGFloat v42 = self;
                *(_WORD *)&v42[8] = 2080;
                long long v43 = v32;
                LOWORD(v44) = 1024;
                *(_DWORD *)((char *)&v44 + 2) = v16;
                a3 = v15;
                mediaStreams = v31;
                HIWORD(v44) = 1024;
                *(_DWORD *)long long v45 = v17;
                *(_WORD *)&v45[4] = 1024;
                *(_DWORD *)long long v46 = v52[0];
                *(_WORD *)&v46[4] = 2048;
                uint64_t v47 = v53;
                __int16 v48 = 1024;
                unsigned int v49 = v18;
                __int16 v50 = 1024;
                unsigned int v51 = v19;
                uint32_t v20 = v14;
                uint64_t v21 = " [%s] %s:%d %@(%p) Health Monitor for Video Stream Send GroupID=%s StreamID[main:%u repair:%u] Vid"
                      "eo[%ukbps %4.1ffps] Frames Received=%u Processed=%u";
                uint32_t v22 = 98;
LABEL_16:
                _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
                continue;
              }
            }
          }
        }
      }
      uint64_t v8 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v58 objects:v57 count:16];
    }
    while (v8);
  }
}

- (int)captureFrameRate
{
  return self->_captureFrameRate;
}

- (unsigned)mediaQueueSize
{
  return self->_mediaQueueSize;
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate payload types set", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate pending uplink streams dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the stream controller", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate temporal streamIDs", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup redundancy settings", v2, v3, v4, v5, v6);
}

- (void)setupRedundancySettings
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create videoRedundancyChangeQueue", v2, v3, v4, v5, v6);
}

- (void)setupRedundancyControllerForMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %@");
}

- (void)uplinkVideoStreamControllerForMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Tried to create uplink video stream controller for mode but VCMediaStreamSendGroupConfig is nil", v2, v3, v4, v5, v6);
}

- (void)dispatchedEnableRedundancy:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)cameraAvailabilityDidChange:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
  __int16 v7 = 1024;
  int v8 = 959;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d cameraAvailabilityDidChange=%d ignored", (uint8_t *)&v3, 0x22u);
}

void __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)vcMediaStreamDidRTPTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]" >> 16, v4);
}

- (void)vcMediaStreamDidRTCPTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]" >> 16, v4);
}

- (void)vcMediaStreamDidDecryptionTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]" >> 16, v4);
}

@end