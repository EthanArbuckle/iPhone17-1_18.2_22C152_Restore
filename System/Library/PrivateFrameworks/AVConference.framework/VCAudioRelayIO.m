@interface VCAudioRelayIO
- (BOOL)createPacketThreadWithIOBufferDuration:(double)a3 name:(id)a4 error:(id *)a5;
- (BOOL)isEqualToRelayIO:(id)a3;
- (BOOL)isInitialized;
- (BOOL)isRunning;
- (BOOL)usePacketThread;
- (PacketThread_s)packetThread;
- (VCAudioRelayIO)init;
- (VCAudioRelayIO)initWithMicContext:(const tagVCAudioRelayIOContext *)a3 speakerContext:(const tagVCAudioRelayIOContext *)a4;
- (VCBasebandCodecNotifications)relay;
- (const)clientFormat;
- (const)micContext;
- (const)relayFormat;
- (const)remoteCodecInfo;
- (const)speakerContext;
- (double)preferredIODuration;
- (float)micPowerRMS;
- (float)speakerPowerRMS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)startCompletionHandler;
- (opaqueVCAudioBufferList)micBuffer;
- (opaqueVCAudioBufferList)speakerBuffer;
- (unsigned)micTimestamp;
- (unsigned)speakerTimestamp;
- (void)createAudioBuffers;
- (void)createBuffersForIOContext:(tagVCAudioRelayIOContext *)a3;
- (void)dealloc;
- (void)destroyPacketThread;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)initializeFormatContextPointers;
- (void)internalPushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)micCallback;
- (void)micCallbackContext;
- (void)printStreamFormats;
- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3;
- (void)setMicCallback:(void *)a3;
- (void)setMicCallbackContext:(void *)a3;
- (void)setMicPowerRMS:(float)a3;
- (void)setMicTimestamp:(unsigned int)a3;
- (void)setRelay:(id)a3;
- (void)setRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3;
- (void)setSpeakerCallback:(void *)a3;
- (void)setSpeakerCallbackContext:(void *)a3;
- (void)setSpeakerPowerRMS:(float)a3;
- (void)setSpeakerTimestamp:(unsigned int)a3;
- (void)setStartCompletionHandler:(id)a3;
- (void)setUpdateRemoteCodecInfoCallback:(void *)a3;
- (void)setUpdateRemoteCodecInfoContext:(void *)a3;
- (void)setUsePacketThread:(BOOL)a3;
- (void)speakerCallback;
- (void)speakerCallbackContext;
- (void)updateRemoteCodecInfoCallback;
- (void)updateRemoteCodecInfoContext;
@end

@implementation VCAudioRelayIO

- (VCAudioRelayIO)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelayIO;
  v2 = [(VCObject *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VCAudioRelayIO *)v2 initializeFormatContextPointers];
  }
  return v3;
}

- (VCAudioRelayIO)initWithMicContext:(const tagVCAudioRelayIOContext *)a3 speakerContext:(const tagVCAudioRelayIOContext *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)VCAudioRelayIO;
  uint64_t v6 = [(VCObject *)&v22 init];
  v7 = (VCAudioRelayIO *)v6;
  if (v6)
  {
    long long v9 = *(_OWORD *)&a3->timeInfo.clientSampleRate;
    long long v8 = *(_OWORD *)&a3->timeInfo.lastHostTime;
    unint64_t controllerTimestamp = a3->timeInfo.controllerTimestamp;
    *((_OWORD *)v6 + 20) = *(_OWORD *)&a3->sampleBuffer;
    long long v11 = *(_OWORD *)&a3->callback;
    *((_OWORD *)v6 + 18) = *(_OWORD *)&a3->clientFormat;
    *((_OWORD *)v6 + 19) = v11;
    *((void *)v6 + 46) = controllerTimestamp;
    *((_OWORD *)v6 + 21) = v9;
    *((_OWORD *)v6 + 22) = v8;
    *((void *)v6 + 40) = 0;
    long long v13 = *(_OWORD *)&a4->timeInfo.clientSampleRate;
    long long v12 = *(_OWORD *)&a4->timeInfo.lastHostTime;
    unint64_t v14 = a4->timeInfo.controllerTimestamp;
    *(_OWORD *)(v6 + 408) = *(_OWORD *)&a4->sampleBuffer;
    *(_OWORD *)(v6 + 424) = v13;
    long long v15 = *(_OWORD *)&a4->callback;
    *(_OWORD *)(v6 + 376) = *(_OWORD *)&a4->clientFormat;
    *(_OWORD *)(v6 + 392) = v15;
    *((void *)v6 + 57) = v14;
    *(_OWORD *)(v6 + 440) = v12;
    *((void *)v6 + 51) = 0;
    long long v17 = *(_OWORD *)&a3->clientFormat->format.mBytesPerPacket;
    long long v16 = *(_OWORD *)&a3->clientFormat->format.mBitsPerChannel;
    *((_OWORD *)v6 + 12) = *(_OWORD *)&a3->clientFormat->format.mSampleRate;
    *((_OWORD *)v6 + 13) = v17;
    *((_OWORD *)v6 + 14) = v16;
    relayFormat = a3->relayFormat;
    long long v20 = *(_OWORD *)&relayFormat->format.mBytesPerPacket;
    long long v19 = *(_OWORD *)&relayFormat->format.mBitsPerChannel;
    *((_OWORD *)v6 + 15) = *(_OWORD *)&relayFormat->format.mSampleRate;
    *((_OWORD *)v6 + 16) = v20;
    *((_OWORD *)v6 + 17) = v19;
    [v6 initializeFormatContextPointers];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VCAudioBufferList_Destroy((uint64_t *)&self->_micContext.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_speakerContext.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_micBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_speakerBuffer);
  [(VCAudioRelayIO *)self destroyPacketThread];
  [(VCAudioRelayIO *)self closeRecordings];

  objc_storeWeak(&self->_relay, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioRelayIO;
  [(VCObject *)&v3 dealloc];
}

- (void)initializeFormatContextPointers
{
  self->_micContext.clientFormat = &self->_clientFormat;
  self->_micContext.relayFormat = &self->_relayFormat;
  self->_speakerContext.clientFormat = &self->_clientFormat;
  self->_speakerContext.relayFormat = &self->_relayFormat;
}

- (BOOL)isInitialized
{
  if ([(VCAudioRelayIO *)self micCallback] && [(VCAudioRelayIO *)self speakerCallback]) {
    return 1;
  }
  BOOL result = 0;
  self->_remoteCodecInfo.codecType = 0;
  self->_remoteCodecInfo.sampleRate = 24000.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[VCAudioRelayIO alloc] initWithMicContext:&self->_micContext speakerContext:&self->_speakerContext];
  objc_super v5 = v4;
  if (v4)
  {
    [(VCAudioRelayIO *)v4 setUsePacketThread:self->_usePacketThread];
    [(VCAudioRelayIO *)v5 setStartCompletionHandler:self->_startCompletionHandler];
    [(VCAudioRelayIO *)v5 setUpdateRemoteCodecInfoContext:self->_updateRemoteCodecInfoContext];
    [(VCAudioRelayIO *)v5 setUpdateRemoteCodecInfoCallback:self->_updateRemoteCodecInfoCallback];
    [(VCAudioRelayIO *)v5 setRemoteCodecInfo:&self->_remoteCodecInfo];
    [(VCAudioRelayIO *)v5 setRelay:[(VCAudioRelayIO *)self relay]];
  }
  return v5;
}

- (BOOL)isEqualToRelayIO:(id)a3
{
  int usePacketThread = self->_usePacketThread;
  BOOL result = 0;
  if (usePacketThread == [a3 usePacketThread]
    && !memcmp(&self->_micContext, (const void *)[a3 micContext], 0x58uLL)
    && !memcmp(&self->_speakerContext, (const void *)[a3 speakerContext], 0x58uLL))
  {
    updateRemoteCodecInfoCallback = self->_updateRemoteCodecInfoCallback;
    if (updateRemoteCodecInfoCallback == (void *)[a3 updateRemoteCodecInfoCallback])
    {
      updateRemoteCodecInfoContext = self->_updateRemoteCodecInfoContext;
      if (updateRemoteCodecInfoContext == (void *)[a3 updateRemoteCodecInfoContext]) {
        return 1;
      }
    }
  }
  return result;
}

- (const)remoteCodecInfo
{
  return &self->_remoteCodecInfo;
}

- (void)setRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3
{
  if (a3)
  {
    unsigned int codecType = a3->codecType;
    double sampleRate = a3->sampleRate;
  }
  else
  {
    unsigned int codecType = 0;
    double sampleRate = 24000.0;
  }
  p_remoteCodecInfo = &self->_remoteCodecInfo;
  if (self->_remoteCodecInfo.codecType != codecType || self->_remoteCodecInfo.sampleRate != sampleRate)
  {
    p_remoteCodecInfo->unsigned int codecType = codecType;
    self->_remoteCodecInfo.double sampleRate = sampleRate;
    uint64_t v6 = [(VCAudioRelayIO *)self relay];
    [(VCBasebandCodecNotifications *)v6 didUpdateBasebandCodec:p_remoteCodecInfo];
  }
}

- (void)setRelay:(id)a3
{
}

- (VCBasebandCodecNotifications)relay
{
  return (VCBasebandCodecNotifications *)objc_loadWeak(&self->_relay);
}

- (void)createBuffersForIOContext:(tagVCAudioRelayIOContext *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  sampleBuffer = a3->sampleBuffer;
  p_sampleBuffer = &a3->sampleBuffer;
  if (!sampleBuffer)
  {
    clientFormat = a3->clientFormat;
    int v7 = 2 * clientFormat->samplesPerFrame;
    long long v8 = *(_OWORD *)&clientFormat->format.mSampleRate;
    long long v9 = *(_OWORD *)&clientFormat->format.mBytesPerPacket;
    uint64_t v11 = *(void *)&clientFormat->format.mBitsPerChannel;
    v10[0] = v8;
    v10[1] = v9;
    VCAudioBufferList_Allocate(v10, v7, p_sampleBuffer);
  }
}

- (void)createAudioBuffers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(VCAudioRelayIO *)self createBuffersForIOContext:&self->_micContext];
  [(VCAudioRelayIO *)self createBuffersForIOContext:&self->_speakerContext];
  if (self->_micBuffer) {
    VCAudioBufferList_Destroy((uint64_t *)&self->_micBuffer);
  }
  p_relayFormat = &self->_relayFormat;
  unsigned int samplesPerFrame = self->_relayFormat.samplesPerFrame;
  long long v5 = *(_OWORD *)&self->_relayFormat.format.mBytesPerPacket;
  long long v9 = *(_OWORD *)&self->_relayFormat.format.mSampleRate;
  long long v10 = v5;
  uint64_t v11 = *(void *)&self->_relayFormat.format.mBitsPerChannel;
  VCAudioBufferList_Allocate(&v9, samplesPerFrame, &self->_micBuffer);
  p_speakerBuffer = (uint64_t *)&self->_speakerBuffer;
  if (*p_speakerBuffer) {
    VCAudioBufferList_Destroy(p_speakerBuffer);
  }
  int v7 = p_relayFormat->samplesPerFrame;
  long long v8 = *(_OWORD *)&p_relayFormat->format.mBytesPerPacket;
  long long v9 = *(_OWORD *)&p_relayFormat->format.mSampleRate;
  long long v10 = v8;
  uint64_t v11 = *(void *)&p_relayFormat->format.mBitsPerChannel;
  VCAudioBufferList_Allocate(&v9, v7, p_speakerBuffer);
}

- (void)printStreamFormats
{
  VCAudioStructs_PrintFrameFormat((uint64_t)"client format: ", (uint64_t *)&self->_clientFormat);

  VCAudioStructs_PrintFrameFormat((uint64_t)"relay format:  ", (uint64_t *)&self->_relayFormat);
}

- (const)micContext
{
  return &self->_micContext;
}

- (const)speakerContext
{
  return &self->_speakerContext;
}

- (const)clientFormat
{
  return &self->_clientFormat;
}

- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3
{
  [(VCObject *)self lock];
  if (a3 && !self->_isRunning)
  {
    long long v6 = *(_OWORD *)&a3->format.mBytesPerPacket;
    long long v5 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_clientFormat.format.unsigned int mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
    *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket = v6;
    *(_OWORD *)&self->_clientFormat.format.mBitsPerChannel = v5;
    long long v7 = *(_OWORD *)&a3->format.mSampleRate;
    long long v8 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_relayFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
    *(_OWORD *)&self->_relayFormat.format.mBitsPerChannel = v8;
    *(_OWORD *)&self->_relayFormat.format.unsigned int mSampleRate = v7;
    unsigned int mSampleRate = a3->format.mSampleRate;
    self->_micContext.timeInfo.clientSampleRate = mSampleRate;
    self->_micContext.timeInfo.controllerSampleRate = mSampleRate;
    self->_speakerContext.timeInfo.clientSampleRate = mSampleRate;
    self->_speakerContext.timeInfo.controllerSampleRate = mSampleRate;
  }

  [(VCObject *)self unlock];
}

- (const)relayFormat
{
  return &self->_relayFormat;
}

- (void)micCallback
{
  return self->_micContext.callback;
}

- (void)setMicCallback:(void *)a3
{
  self->_micContext.callback = a3;
}

- (void)micCallbackContext
{
  return self->_micContext.callbackContext;
}

- (void)setMicCallbackContext:(void *)a3
{
  self->_micContext.callbackContext = a3;
}

- (void)speakerCallback
{
  return self->_speakerContext.callback;
}

- (void)setSpeakerCallback:(void *)a3
{
  self->_speakerContext.callback = a3;
}

- (void)speakerCallbackContext
{
  return self->_speakerContext.callbackContext;
}

- (void)setSpeakerCallbackContext:(void *)a3
{
  self->_speakerContext.callbackContext = a3;
}

- (double)preferredIODuration
{
  LODWORD(v2) = self->_clientFormat.samplesPerFrame;
  return (double)v2 / self->_clientFormat.format.mSampleRate;
}

- (void)internalPushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  p_micContext = &self->_micContext;
  if (self->_micContext.callback)
  {
    int Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
    double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
    unsigned int v9 = VCAudioBufferList_GetSampleCount((uint64_t)p_micContext->sampleBuffer);
    if (v9
      || (unsigned int samplesPerFrame = self->_clientFormat.samplesPerFrame, sampleBuffer = a3, SampleCount != samplesPerFrame))
    {
      VCAudioBufferList_Append((uint64_t)p_micContext->sampleBuffer, (uint64_t)a3, 0);
      sampleBuffer = p_micContext->sampleBuffer;
    }
    if (VCAudioBufferList_GetSampleCount((uint64_t)sampleBuffer) >= p_micContext->clientFormat->samplesPerFrame)
    {
      double v12 = HostTime - (double)v9 / p_micContext->clientFormat->format.mSampleRate;
      int v13 = VCAudioStructs_ClientTimestampForControllerTime(&p_micContext->timeInfo.clientSampleRate, Timestamp - v9, v12);
      unsigned int v14 = VCAudioBufferList_GetSampleCount((uint64_t)sampleBuffer);
      VCAudioBufferList_SetTime((uint64_t)sampleBuffer, v13, v12);
      VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, p_micContext->clientFormat->samplesPerFrame);
      ((void (*)(void *, opaqueVCAudioBufferList *))p_micContext->callback)(p_micContext->callbackContext, sampleBuffer);
      VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, v14);
      if (sampleBuffer == p_micContext->sampleBuffer) {
        VCAudioBufferList_Shift((uint64_t)sampleBuffer, p_micContext->clientFormat->samplesPerFrame);
      }
    }
    VCAudioBufferList_SetTime((uint64_t)a3, Timestamp, HostTime);
  }
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  if (self->_packetThread)
  {
    if (!PacketThread_SendSampleBuffer((uint64_t)self->_packetThread, a3)
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelayIO pushAudioSamples:](v3);
      }
    }
  }
  else
  {
    [(VCAudioRelayIO *)self internalPushAudioSamples:a3];
  }
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  p_speakerContext = &self->_speakerContext;
  if (!self->_speakerContext.callback) {
    return;
  }
  int Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  unsigned int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  unsigned int v8 = VCAudioBufferList_GetSampleCount((uint64_t)p_speakerContext->sampleBuffer);
  unsigned int v9 = v8;
  if (SampleCount >= v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = SampleCount;
  }
  VCAudioBufferList_SetSampleCount((uint64_t)a3, 0);
  if (v10)
  {
    VCAudioBufferList_Append((uint64_t)a3, (uint64_t)p_speakerContext->sampleBuffer, 0);
    VCAudioBufferList_Shift((uint64_t)p_speakerContext->sampleBuffer, v10);
    if (SampleCount > v9)
    {
      p_unsigned int mSampleRate = &p_speakerContext->clientFormat->format.mSampleRate;
LABEL_11:
      sampleBuffer = p_speakerContext->sampleBuffer;
LABEL_12:
      double v13 = HostTime + (double)v10 / *p_mSampleRate;
      int v14 = VCAudioStructs_ClientTimestampForControllerTime(&p_speakerContext->timeInfo.clientSampleRate, v10 + Timestamp, v13);
      VCAudioBufferList_SetTime((uint64_t)sampleBuffer, v14, v13);
      VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, p_speakerContext->clientFormat->samplesPerFrame);
      ((void (*)(void *, opaqueVCAudioBufferList *))p_speakerContext->callback)(p_speakerContext->callbackContext, sampleBuffer);
      if (sampleBuffer == p_speakerContext->sampleBuffer)
      {
        unsigned int v15 = VCAudioBufferList_Append((uint64_t)a3, (uint64_t)sampleBuffer, 0);
        VCAudioBufferList_Shift((uint64_t)p_speakerContext->sampleBuffer, v15);
      }
    }
  }
  else if (SampleCount)
  {
    p_unsigned int mSampleRate = &p_speakerContext->clientFormat->format.mSampleRate;
    sampleBuffer = a3;
    if (p_speakerContext->clientFormat->samplesPerFrame == p_speakerContext->relayFormat->samplesPerFrame) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  VCAudioBufferList_SetTime((uint64_t)a3, Timestamp, HostTime);
}

- (BOOL)createPacketThreadWithIOBufferDuration:(double)a3 name:(id)a4 error:(id *)a5
{
  v15[5] = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  self->_relayFormat.unsigned int samplesPerFrame = vcvtad_u64_f64(self->_relayFormat.format.mSampleRate * a3);
  BOOL v9 = 1;
  self->_micContext.timeInfo.didHostTimeReferenceChange = 1;
  self->_speakerContext.timeInfo.didHostTimeReferenceChange = 1;
  [(VCAudioRelayIO *)self createAudioBuffers];
  if (!self->_usePacketThread) {
    goto LABEL_4;
  }
  int SerializedSize = VCAudioBufferList_GetSerializedSize((unsigned int *)self->_micBuffer);
  uint64_t v11 = [a4 UTF8String];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__VCAudioRelayIO_createPacketThreadWithIOBufferDuration_name_error___block_invoke;
  v15[3] = &unk_1E6DB5998;
  v15[4] = self;
  double v12 = (PacketThread_s *)PacketThread_Create(SerializedSize, 0, 0x10u, 19, v11, v15);
  self->_packetThread = v12;
  if (v12)
  {
    PacketThread_ReceiverIsReady((uint64_t)v12);
LABEL_4:
    self->_isRunning = 1;
    goto LABEL_9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelayIO createPacketThreadWithIOBufferDuration:name:error:](v13);
    }
  }
  +[GKVoiceChatError getNSError:a5 code:32005 detailedCode:0 filePath:0 description:@"createPacketThreadWithIOBufferDuration failed" reason:@"PacketThread_Create failed"];
  BOOL v9 = 0;
LABEL_9:
  [(VCObject *)self unlock];
  return v9;
}

uint64_t __68__VCAudioRelayIO_createPacketThreadWithIOBufferDuration_name_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) internalPushAudioSamples:a2];
}

- (void)destroyPacketThread
{
  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
  }
  self->_isRunning = 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  updateRemoteCodecInfoCallback = (void (*)(void *, const _VCRemoteCodecInfo *))self->_updateRemoteCodecInfoCallback;
  if (updateRemoteCodecInfoCallback)
  {
    updateRemoteCodecInfoContext = self->_updateRemoteCodecInfoContext;
    updateRemoteCodecInfoCallback(updateRemoteCodecInfoContext, a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    long long v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCAudioRelayIO *)v6 didUpdateBasebandCodec:v7];
    }
  }
}

- (opaqueVCAudioBufferList)micBuffer
{
  return self->_micBuffer;
}

- (unsigned)micTimestamp
{
  return self->_micTimestamp;
}

- (void)setMicTimestamp:(unsigned int)a3
{
  self->_micint Timestamp = a3;
}

- (float)micPowerRMS
{
  return self->_micPowerRMS;
}

- (void)setMicPowerRMS:(float)a3
{
  self->_micPowerRMS = a3;
}

- (opaqueVCAudioBufferList)speakerBuffer
{
  return self->_speakerBuffer;
}

- (unsigned)speakerTimestamp
{
  return self->_speakerTimestamp;
}

- (void)setSpeakerTimestamp:(unsigned int)a3
{
  self->_speakerint Timestamp = a3;
}

- (float)speakerPowerRMS
{
  return self->_speakerPowerRMS;
}

- (void)setSpeakerPowerRMS:(float)a3
{
  self->_speakerPowerRMS = a3;
}

- (id)startCompletionHandler
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setStartCompletionHandler:(id)a3
{
}

- (BOOL)usePacketThread
{
  return self->_usePacketThread;
}

- (void)setUsePacketThread:(BOOL)a3
{
  self->_int usePacketThread = a3;
}

- (PacketThread_s)packetThread
{
  return self->_packetThread;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)updateRemoteCodecInfoCallback
{
  return self->_updateRemoteCodecInfoCallback;
}

- (void)setUpdateRemoteCodecInfoCallback:(void *)a3
{
  self->_updateRemoteCodecInfoCallback = a3;
}

- (void)updateRemoteCodecInfoContext
{
  return self->_updateRemoteCodecInfoContext;
}

- (void)setUpdateRemoteCodecInfoContext:(void *)a3
{
  self->_updateRemoteCodecInfoContext = a3;
}

- (void)pushAudioSamples:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 313;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d forwardSamplesFromIO: PacketThread_SendSampleBuffer failed", (uint8_t *)&v2, 0x1Cu);
}

- (void)createPacketThreadWithIOBufferDuration:(uint64_t)a1 name:error:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 382;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d createPacketThreadWithIOBufferDuration: PacketThread_Create failed", (uint8_t *)&v2, 0x1Cu);
}

- (void)didUpdateBasebandCodec:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = FourccToCStr(*(_DWORD *)a2);
  uint64_t v7 = *(void *)(a2 + 8);
  int v8 = 136316162;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  uint64_t v11 = "-[VCAudioRelayIO didUpdateBasebandCodec:]";
  __int16 v12 = 1024;
  int v13 = 463;
  __int16 v14 = 2080;
  unsigned int v15 = v6;
  __int16 v16 = 2048;
  uint64_t v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Callback function not registered. CodecType[%s] SampleRate[%f]", (uint8_t *)&v8, 0x30u);
}

@end