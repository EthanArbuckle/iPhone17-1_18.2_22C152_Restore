@interface VCVideoReceiverBase
- (BOOL)startSynchronization:(id)a3;
- (VCMediaStreamSyncSource)syncSource;
- (VCVideoReceiverBase)initWithDelegate:(id)a3 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a4;
- (VCVideoReceiverDelegate)delegate;
- (double)lastReceivedVideoRTCPPacketTime;
- (double)lastReceivedVideoRTPPacketTime;
- (double)roundTripTime;
- (float)lastLastVideoStallDuration;
- (int)remoteVideoOrientation;
- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)delegateFunctions;
- (unsigned)lastDisplayedFrameRTPTimestamp;
- (void)collectChannelMetrics:(id *)a3 interval:(float)a4;
- (void)dealloc;
- (void)handleActiveConnectionChange:(id)a3;
- (void)pauseVideo;
- (void)rtcpSendIntervalElapsed;
- (void)setDeferredAssemblyEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateFunctions:(tagVCVideoReceiverDelegateRealtimeInstanceVTable)a3;
- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4;
- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6;
- (void)setJitterBufferMode:(int)a3;
- (void)setLooseAVSyncEnabled:(BOOL)a3;
- (void)setRemoteVideoOrientation:(int)a3;
- (void)setRoundTripTime:(double)a3;
- (void)setSyncSource:(id)a3;
- (void)setTargetStreamID:(unsigned __int16)a3;
- (void)startVideo;
- (void)stopSynchronization;
- (void)stopVideo;
- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3;
@end

@implementation VCVideoReceiverBase

- (VCVideoReceiverBase)initWithDelegate:(id)a3 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoReceiverBase;
  result = [(VCVideoReceiverBase *)&v7 init];
  if (result)
  {
    result->_rtpTimestampRate = 90000;
    result->_delegate = (VCVideoReceiverDelegate *)a3;
    result->_vTable.setExternalOutputLatency = _VCVideoReceiverRealtime_SetExternalOutputLatency;
    if (a4) {
      result->_delegateFunctions = *a4;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_mediaStreamSynchronizer = 0;
  self->_syncSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)VCVideoReceiverBase;
  [(VCVideoReceiverBase *)&v3 dealloc];
}

- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4
{
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
}

- (void)startVideo
{
}

- (void)stopVideo
{
}

- (void)pauseVideo
{
}

- (void)rtcpSendIntervalElapsed
{
}

- (BOOL)startSynchronization:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  -[VCVideoReceiverBase setSyncSource:](self, "setSyncSource:");
  uint64_t v5 = [a3 getSyncSourceSampleRate];
  mediaStreamSynchronizer = self->_mediaStreamSynchronizer;
  if (mediaStreamSynchronizer
    && [(VCMediaStreamSynchronizer *)mediaStreamSynchronizer sourceSampleRate] == v5)
  {
    VCMediaStreamSynchronizer_resetDestinationState((uint64_t)self->_mediaStreamSynchronizer);
    VCMediaStreamSyncSourceDelegate_resetSourceState((uint64_t)self->_mediaStreamSynchronizer);
  }
  else
  {
    [(VCVideoReceiverBase *)self setSynchronizer:0];

    objc_super v7 = [[VCMediaStreamSynchronizer alloc] initWithSourceSampleRate:v5 destinationSampleRate:self->_rtpTimestampRate];
    self->_mediaStreamSynchronizer = v7;
    if (!v7) {
      return (char)v7;
    }
    [(VCVideoReceiverBase *)self setSynchronizer:v7];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_mediaStreamSynchronizer;
      int v12 = 136316418;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      v15 = "-[VCVideoReceiverBase startSynchronization:]";
      __int16 v16 = 1024;
      int v17 = 98;
      __int16 v18 = 2048;
      v19 = v10;
      __int16 v20 = 2048;
      v21 = self;
      __int16 v22 = 2048;
      v23 = [(VCVideoReceiverBase *)self syncSource];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting syncSourceDelegate (%p) for VideoReceiver (%p) for syncSource (%p)", (uint8_t *)&v12, 0x3Au);
    }
  }
  [a3 addSyncSourceDelegate:self->_mediaStreamSynchronizer];
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (void)stopSynchronization
{
  [(VCMediaStreamSyncSource *)[(VCVideoReceiverBase *)self syncSource] removeSyncSourceDelegate:self->_mediaStreamSynchronizer];

  [(VCVideoReceiverBase *)self setSyncSource:0];
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
}

- (void)setTargetStreamID:(unsigned __int16)a3
{
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
}

- (void)handleActiveConnectionChange:(id)a3
{
}

- (void)setJitterBufferMode:(int)a3
{
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
}

- (VCVideoReceiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VCVideoReceiverDelegate *)a3;
}

- (int)remoteVideoOrientation
{
  return self->_remoteVideoOrientation;
}

- (void)setRemoteVideoOrientation:(int)a3
{
  self->_remoteVideoOrientation = a3;
}

- (VCMediaStreamSyncSource)syncSource
{
  return self->_syncSource;
}

- (void)setSyncSource:(id)a3
{
  self->_syncSource = (VCMediaStreamSyncSource *)a3;
}

- (double)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(double)a3
{
  self->_roundTripTime = a3;
}

- (double)lastReceivedVideoRTPPacketTime
{
  return self->_lastReceivedVideoRTPPacketTime;
}

- (double)lastReceivedVideoRTCPPacketTime
{
  return self->_lastReceivedVideoRTCPPacketTime;
}

- (float)lastLastVideoStallDuration
{
  return self->_lastLastVideoStallDuration;
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)delegateFunctions
{
  didReceiveRemoteFrame = self->_delegateFunctions.didReceiveRemoteFrame;
  didReceiveSampleBuffer = self->_delegateFunctions.didReceiveSampleBuffer;
  result.didReceiveRemoteFrame = didReceiveRemoteFrame;
  result.didReceiveSampleBuffer = didReceiveSampleBuffer;
  return result;
}

- (void)setDelegateFunctions:(tagVCVideoReceiverDelegateRealtimeInstanceVTable)a3
{
  self->_delegateFunctions = a3;
}

@end