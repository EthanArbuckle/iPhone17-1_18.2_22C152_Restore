@interface VCCaptionsStreamSendGroup
- (BOOL)captionsEnabled;
- (BOOL)captionsSupported;
- (BOOL)isMuted;
- (BOOL)isPowerSpectrumEnabled;
- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4;
- (VCCaptionsStreamSendGroup)initWithConfig:(id)a3;
- (id)activeStreamKeys;
- (id)captionsDelegate;
- (id)startCapture;
- (id)stopCapture;
- (id)willStart;
- (int)deviceRole;
- (void)collectAndLogChannelMetrics:(id *)a3;
- (void)dealloc;
- (void)didDisableCaptions:(BOOL)a3 error:(id)a4;
- (void)didEnableCaptions:(BOOL)a3 error:(id)a4;
- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4;
- (void)didStop;
- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4;
- (void)didUpdateCaptions:(id)a3;
- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6;
- (void)enableCaptions:(BOOL)a3;
- (void)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (void)prewarmCaptions;
- (void)registerCaptionsEventDelegate:(id)a3;
- (void)setCaptionsLocale:(id)a3;
- (void)setCaptionsUsage:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)transmitTranscription:(id)a3;
@end

@implementation VCCaptionsStreamSendGroup

- (VCCaptionsStreamSendGroup)initWithConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCCaptionsStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v7, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = [[VCAudioStreamGroupCommon alloc] initWithConfig:a3 audioCallback:VCCaptionsStreamSendGroup_PushAudioSamples context:v4 audioDirection:2 stateQueue:v4->super.super._stateQueue];
    [(VCObject *)v4->_common setLogPrefix:[(VCObject *)v4 logPrefix]];
    if (v4->_common)
    {
      v4->_audioCaptions = [[VCAudioCaptions alloc] initWithDelegate:v4 isLocal:1 taskIdentifier:@"facetimecaptions" reportingAgent:0];
      VCCaptionsEncoder_Create(&v4->_captionsEncoder);
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCaptionsStreamSendGroup initWithConfig:](v6);
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

  VCCaptionsEncoder_Destroy((id **)&self->_captionsEncoder);
  [(VCAudioCaptions *)self->_audioCaptions setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v3 dealloc];
}

- (id)willStart
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStreamSendGroup;
  id result = [(VCMediaStreamGroup *)&v4 willStart];
  if (!result)
  {
    objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, -[VCMediaStreamGroup streamToken](self, "streamToken"));
    if (-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self->_common, "configureAudioIOWithDeviceRole:operatingMode:", -[VCCaptionsStreamSendGroup deviceRole](self, "deviceRole"), objc_msgSend(-[NSArray firstObject](-[NSDictionary allValues](self->super.super._streamIDToMediaStreamMap, "allValues"), "firstObject"), "operatingMode")))
    {
      [(VCAudioStreamGroupCommon *)self->_common startAudioDump];
      [(VCAudioCaptions *)self->_audioCaptions enableCaptions:1];
      [(VCAudioCaptions *)self->_audioCaptions start:[(VCAudioIO *)[(VCAudioStreamGroupCommon *)self->_common audioIO] clientFormat] forToken:[(VCMediaStreamGroup *)self streamToken] withCompletionHandler:0];
      return 0;
    }
    else
    {
      objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStreamGroup streamToken](self, "streamToken"));
      return +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 14, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCaptionsStreamSendGroup.m", 76));
    }
  }
  return result;
}

- (void)didStop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCAudioCaptions *)self->_audioCaptions stop];
  [(VCAudioCaptions *)self->_audioCaptions enableCaptions:0];
  [(VCAudioStreamGroupCommon *)self->_common stopAudioDump];
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStreamGroup streamToken](self, "streamToken"));
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStreamSendGroup;
  [(VCMediaStreamSendGroup *)&v3 didStop];
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  -[VCMediaStreamSendGroup setIsSuspended:](self, "setIsSuspended:", [a3 count] == 0);
  if ([a3 count])
  {
    v9 = (void *)[a3 firstObject];

    self->_activeCaptionsStreamID = (NSNumber *)v9;
    id v10 = [(NSDictionary *)self->super.super._streamIDToMediaStreamMap objectForKeyedSubscript:v9];
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "setTargetEncoderBitrate:", objc_msgSend((id)objc_msgSend(a5, "firstObject"), "unsignedIntValue"));
      v28[0] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [v11 setStreamIDs:v12 repairStreamIDs:MEMORY[0x1E4F1CBF0]];
    }
    else if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCaptionsStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[(VCCaptionsStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316418;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          v19 = "-[VCCaptionsStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          __int16 v20 = 1024;
          int v21 = 104;
          __int16 v22 = 2112;
          v23 = v13;
          __int16 v24 = 2048;
          v25 = self;
          __int16 v26 = 2112;
          v27 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) not found captions stream with stream ID %@", (uint8_t *)&v16, 0x3Au);
        }
      }
    }
  }
}

- (id)activeStreamKeys
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id result = [(NSDictionary *)self->super.super._streamIDToMediaStreamMap objectForKeyedSubscript:self->_activeCaptionsStreamID];
  if (result)
  {
    v4[0] = [NSString stringWithFormat:@"%@:%@", self->super.super._participantUUID, objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID"))];
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  return result;
}

- (BOOL)isMuted
{
  return [(VCAudioStreamGroupCommon *)self->_common isMuted];
}

- (void)setMuted:(BOOL)a3
{
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  stateQueue = self->super.super._stateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__VCCaptionsStreamSendGroup_setDeviceRole_operatingMode___block_invoke;
  v9[3] = &unk_1E6DB3F80;
  v9[4] = self;
  v9[5] = &v12;
  int v10 = a3;
  int v11 = a4;
  dispatch_sync(stateQueue, v9);
  [(VCAudioStreamGroupCommon *)self->_common configureAudioIOWithDeviceRole:v5 operatingMode:v4];
  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __57__VCCaptionsStreamSendGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 736) setDeviceRole:*(unsigned int *)(a1 + 48) operatingMode:*(unsigned int *)(a1 + 52)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deviceRole
{
  return [(VCAudioStreamGroupCommon *)self->_common deviceRole];
}

- (BOOL)isPowerSpectrumEnabled
{
  return 0;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  if (self->_activeCaptionsStreamID)
  {
    id v4 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:");
    [v4 collectTxChannelMetrics:a3];
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCCaptionsStreamSendGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCCaptionsStreamSendGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCCaptionsStreamSendGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return [*(id *)(*(void *)(a1 + 32) + 736) setReportingAgent:*(void *)(a1 + 40)];
}

- (id)startCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common startCapture];
}

- (id)stopCapture
{
  return [(VCAudioStreamGroupCommon *)self->_common stopCapture];
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if ([a3 conformsToProtocol:&unk_1F3DDCC90])
  {
    objc_storeWeak((id *)&self->_captionsDelegate, a3);
  }
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsDelegate);
}

- (void)setCaptionsLocale:(id)a3
{
}

- (void)setCaptionsUsage:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v3 = @"ACSU";
    v4[0] = a3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
    reportingGenericEvent();
  }
}

- (BOOL)captionsEnabled
{
  return [(VCAudioCaptions *)self->_audioCaptions enabled];
}

- (BOOL)captionsSupported
{
  return +[VCAudioCaptions captionsSupported];
}

- (void)prewarmCaptions
{
}

- (void)enableCaptions:(BOOL)a3
{
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__VCCaptionsStreamSendGroup_didDisableCaptions_error___block_invoke;
  v8[3] = &unk_1E6DB3E18;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __54__VCCaptionsStreamSendGroup_didDisableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[95];
  uint64_t v4 = [v2 streamToken];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 streamToken:v4 didDisableCaptions:v5 error:v6];
}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__VCCaptionsStreamSendGroup_didEnableCaptions_error___block_invoke;
  v8[3] = &unk_1E6DB3E18;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __53__VCCaptionsStreamSendGroup_didEnableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[95];
  uint64_t v4 = [v2 streamToken];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v3 streamToken:v4 didEnableCaptions:v5 error:v6];
}

- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__VCCaptionsStreamSendGroup_didStartCaptioningWithReason_streamToken___block_invoke;
  v8[3] = &unk_1E6DB3F58;
  v8[4] = self;
  v8[5] = a4;
  int v9 = a3;
  dispatch_async(global_queue, v8);
}

uint64_t __70__VCCaptionsStreamSendGroup_didStartCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 760) streamToken:*(void *)(a1 + 40) didStartCaptioningWithReason:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__VCCaptionsStreamSendGroup_didStopCaptioningWithReason_streamToken___block_invoke;
  v8[3] = &unk_1E6DB3F58;
  v8[4] = self;
  v8[5] = a4;
  int v9 = a3;
  dispatch_async(global_queue, v8);
}

uint64_t __69__VCCaptionsStreamSendGroup_didStopCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 760) streamToken:*(void *)(a1 + 40) didStopCaptioningWithReason:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didUpdateCaptions:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCCaptionsStreamSendGroup_didUpdateCaptions___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(global_queue, block);
  [(VCCaptionsStreamSendGroup *)self transmitTranscription:a3];
}

uint64_t __47__VCCaptionsStreamSendGroup_didUpdateCaptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[95];
  uint64_t v4 = [v2 streamToken];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 streamToken:v4 didUpdateCaptions:v5];
}

- (void)transmitTranscription:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  size_t v22 = 1280;
  memset(__b, 170, sizeof(__b));
  VCCaptionsEncoder_Encode((uint64_t)self->_captionsEncoder, a3, __b, &v22);
  memset(&v21, 170, sizeof(v21));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v21, HostTimeClock);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&v18[16] = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  long long v19 = v6;
  CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  long long v17 = *MEMORY[0x1E4F1FA70];
  *(void *)__int16 v18 = v8;
  *(CMTime *)&v18[8] = v21;
  CMTimeEpoch v20 = v7;
  CFTypeRef cf = 0;
  *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)&v21.timescale;
  *(_OWORD *)&buf.decodeTimeStamp.value = v6;
  buf.decodeTimeStamp.epoch = v7;
  *(_OWORD *)&buf.duration.value = v17;
  *(_OWORD *)&buf.duration.epoch = *(_OWORD *)v18;
  int v9 = VCCaptionsStream_CreateSampleBuffer(__b, v22, &buf, (CMSampleBufferRef *)&cf);
  if (v9)
  {
    int v10 = v9;
    if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCaptionsStreamSendGroup transmitTranscription:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v11 = (__CFString *)[(VCCaptionsStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        int v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.duration.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = v12;
          LOWORD(buf.duration.flags) = 2080;
          *(void *)((char *)&buf.duration.flags + 2) = "-[VCCaptionsStreamSendGroup transmitTranscription:]";
          HIWORD(buf.duration.epoch) = 1024;
          LODWORD(buf.presentationTimeStamp.value) = 267;
          WORD2(buf.presentationTimeStamp.value) = 2112;
          *(CMTimeValue *)((char *)&buf.presentationTimeStamp.value + 6) = (CMTimeValue)v11;
          HIWORD(buf.presentationTimeStamp.flags) = 2048;
          buf.presentationTimeStamp.epoch = (CMTimeEpoch)self;
          LOWORD(buf.decodeTimeStamp.value) = 1024;
          *(_DWORD *)((char *)&buf.decodeTimeStamp.value + 2) = v10;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error creating sample buffer for captions: %d", (uint8_t *)&buf, 0x36u);
        }
      }
    }
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    int v15 = 0;
    *(_OWORD *)&buf.duration.value = *(_OWORD *)&v18[8];
    buf.duration.epoch = *(void *)&v18[24];
    [(VCCaptionsStreamSendGroup *)self onVideoFrame:cf frameTime:&buf attribute:v14];
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_activeCaptionsStreamID = &self->_activeCaptionsStreamID;
  id v10 = [(NSDictionary *)self->super.super._streamIDToMediaStreamMap objectForKeyedSubscript:self->_activeCaptionsStreamID];
  if (v10)
  {
    *(_OWORD *)CMSampleTimingInfo buf = *(_OWORD *)&a4->var0;
    *(void *)&buf[16] = a4->var3;
    long long v17 = *(_OWORD *)&a5->var0;
    int v18 = *(_DWORD *)&a5->var6;
    [v10 onVideoFrame:a3 frameTime:buf attribute:&v17];
  }
  else if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:](v12, p_activeCaptionsStreamID, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCCaptionsStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *p_activeCaptionsStreamID;
        *(_DWORD *)CMSampleTimingInfo buf = 136316418;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:]";
        *(_WORD *)&buf[22] = 1024;
        int v20 = 282;
        __int16 v21 = 2112;
        size_t v22 = v11;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 2112;
        __int16 v26 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) not found captions stream with stream ID %@", buf, 0x3Au);
      }
    }
  }
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 39;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create VCAudioStreamGroupCommon", (uint8_t *)&v2, 0x1Cu);
}

- (void)dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d not found captions stream with stream ID %@");
}

- (void)transmitTranscription:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error creating sample buffer for captions: %d", v2, v3, v4, v5);
}

- (void)onVideoFrame:(uint64_t)a1 frameTime:(void *)a2 attribute:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 282;
  WORD2(v4) = 2112;
  *(void *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, (uint64_t)a2, a3, " [%s] %s:%d not found captions stream with stream ID %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v4, *MEMORY[0x1E4F143B8]);
}

@end