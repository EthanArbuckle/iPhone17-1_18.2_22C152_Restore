@interface VCVideoTransmitterBase
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTime;
- (BOOL)isEndToEndBasedBandwidthProbingEnabled;
- (BOOL)isRtxEnabled;
- (BOOL)isServerBasedBandwidthProbingEnabled;
- (BOOL)setEncodingMode:(int)a3;
- (VCVideoTransmitterBase)initWithConfig:(id)a3;
- (double)lastKeyFrameSentTime;
- (double)lastSentAudioHostTime;
- (unsigned)encodingHeight;
- (unsigned)encodingWidth;
- (unsigned)lastRTPTimestamp;
- (unsigned)lastSentAudioSampleTime;
- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3;
- (unsigned)targetBitrate;
- (unsigned)targetBitrateChangeCounter;
- (unsigned)targetFramerate;
- (void)collectChannelMetrics:(id *)a3 interval:(float)a4;
- (void)dealloc;
- (void)generateKeyFrameWithFIRType:(int)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleThermalLevelChange:(int)a3;
- (void)setFECRatio:(double)a3;
- (void)setFECRedundancyVector:(id *)a3;
- (void)setHighestActiveQualityIndex:(unsigned int)a3;
- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3;
- (void)setLastFrameTime:(id *)a3;
- (void)setLastKeyFrameSentTime:(double)a3;
- (void)setLastRTPTimestamp:(unsigned int)a3;
- (void)setLastSentAudioHostTime:(double)a3;
- (void)setLastSentAudioSampleTime:(unsigned int)a3;
- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)setTargetBitrateChangeCounter:(unsigned int)a3;
- (void)setTemporalBitrateArray:(id)a3;
- (void)startVideo;
- (void)stopVideo;
- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5;
@end

@implementation VCVideoTransmitterBase

- (VCVideoTransmitterBase)initWithConfig:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)VCVideoTransmitterBase;
  v4 = [(VCVideoTransmitterBase *)&v28 init];
  if (v4)
  {
    if ((unint64_t)[a3 framerate] <= 0x3C && objc_msgSend(a3, "framerate")) {
      v4->_targetFramerate = [a3 framerate];
    }
    v4->_txMaxBitrate = [a3 txMaxBitrate];
    v4->_txMinBitrate = [a3 txMinBitrate];
    v4->_temporaryMaximumBitrate = [a3 txMinBitrate];
    if ([a3 videoResolution] == 27)
    {
      v4->_unsigned int encodingWidth = [a3 customWidth];
      unsigned int v5 = [a3 customHeight];
      unsigned int encodingWidth = v4->_encodingWidth;
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [a3 videoResolution]);
      unsigned int encodingWidth = v7;
      v4->_unsigned int encodingWidth = v7;
      unsigned int v5 = v8;
    }
    v4->_unsigned int encodingHeight = v5;
    if ([a3 captureSource] == 3)
    {
      +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:", (double)encodingWidth, (double)v5);
      unsigned int encodingWidth = v9;
      unsigned int v5 = v10;
    }
    v4->_unsigned int captureWidth = encodingWidth;
    v4->_unsigned int captureHeight = v5;
    if ((VCVideoTransmitterBase *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int captureWidth = v4->_captureWidth;
          unsigned int captureHeight = v4->_captureHeight;
          unsigned int v16 = v4->_encodingWidth;
          unsigned int encodingHeight = v4->_encodingHeight;
          *(_DWORD *)buf = 136316674;
          uint64_t v30 = v12;
          __int16 v31 = 2080;
          v32 = "-[VCVideoTransmitterBase initWithConfig:]";
          __int16 v33 = 1024;
          int v34 = 71;
          __int16 v35 = 1024;
          *(_DWORD *)v36 = captureWidth;
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = captureHeight;
          LOWORD(v37) = 1024;
          *(_DWORD *)((char *)&v37 + 2) = v16;
          HIWORD(v37) = 1024;
          *(_DWORD *)v38 = encodingHeight;
          v18 = " [%s] %s:%d capture = %dx%d, encode = %dx%d";
          v19 = v13;
          uint32_t v20 = 52;
LABEL_20:
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[(VCVideoTransmitterBase *)v4 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = v4->_captureWidth;
          unsigned int v24 = v4->_captureHeight;
          unsigned int v25 = v4->_encodingWidth;
          unsigned int v26 = v4->_encodingHeight;
          *(_DWORD *)buf = 136317186;
          uint64_t v30 = v21;
          __int16 v31 = 2080;
          v32 = "-[VCVideoTransmitterBase initWithConfig:]";
          __int16 v33 = 1024;
          int v34 = 71;
          __int16 v35 = 2112;
          *(void *)v36 = v11;
          *(_WORD *)&v36[8] = 2048;
          v37 = v4;
          *(_WORD *)v38 = 1024;
          *(_DWORD *)&v38[2] = v23;
          __int16 v39 = 1024;
          unsigned int v40 = v24;
          __int16 v41 = 1024;
          unsigned int v42 = v25;
          __int16 v43 = 1024;
          unsigned int v44 = v26;
          v18 = " [%s] %s:%d %@(%p) capture = %dx%d, encode = %dx%d";
          v19 = v22;
          uint32_t v20 = 72;
          goto LABEL_20;
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoTransmitterBase;
  [(VCVideoTransmitterBase *)&v2 dealloc];
}

- (void)startVideo
{
}

- (void)stopVideo
{
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
}

- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3
{
}

- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6
{
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
}

- (void)setFECRatio:(double)a3
{
}

- (void)setFECRedundancyVector:(id *)a3
{
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
}

- (BOOL)setEncodingMode:(int)a3
{
}

- (void)handleThermalLevelChange:(int)a3
{
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
}

- (void)setTemporalBitrateArray:(id)a3
{
}

- (void)setHighestActiveQualityIndex:(unsigned int)a3
{
}

- (void)handleActiveConnectionChange:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTime
{
  objc_copyStruct(retstr, &self->_latestSampleBufferTimestamp, 24, 1, 0);
  return result;
}

- (void)setLastFrameTime:(id *)a3
{
}

- (unsigned)lastRTPTimestamp
{
  return self->_timestamp;
}

- (void)setLastRTPTimestamp:(unsigned int)a3
{
  self->_timestamp = a3;
}

- (double)lastKeyFrameSentTime
{
  return self->_lastKeyFrameSentTime;
}

- (void)setLastKeyFrameSentTime:(double)a3
{
  self->_lastKeyFrameSentTime = a3;
}

- (unsigned)lastSentAudioSampleTime
{
  return self->_lastSentAudioSampleTime;
}

- (void)setLastSentAudioSampleTime:(unsigned int)a3
{
  self->_lastSentAudioSampleTime = a3;
}

- (double)lastSentAudioHostTime
{
  return self->_lastSentAudioHostTime;
}

- (void)setLastSentAudioHostTime:(double)a3
{
  self->_lastSentAudioHostTime = a3;
}

- (BOOL)isServerBasedBandwidthProbingEnabled
{
  return self->_isServerBasedBandwidthProbingEnabled;
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isServerBasedBandwidthProbingEnabled = a3;
}

- (BOOL)isEndToEndBasedBandwidthProbingEnabled
{
  return self->_isEndToEndBasedBandwidthProbingEnabled;
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isEndToEndBasedBandwidthProbingEnabled = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
}

- (unsigned)targetBitrateChangeCounter
{
  return self->_targetBitrateChangeCounter;
}

- (void)setTargetBitrateChangeCounter:(unsigned int)a3
{
  self->_targetBitrateChangeCounter = a3;
}

- (unsigned)encodingWidth
{
  return self->_encodingWidth;
}

- (unsigned)encodingHeight
{
  return self->_encodingHeight;
}

- (unsigned)targetFramerate
{
  return self->_targetFramerate;
}

- (BOOL)isRtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

@end