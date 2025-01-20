@interface ADSpeechCompressor
- (ADSpeechCompressor)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7;
- (void)addAudioSampleData:(id)a3;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)dealloc;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)startCompressionNarrowband:(BOOL)a3;
- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
@end

@implementation ADSpeechCompressor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bufferedAudio, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addAudioSampleData:(id)a3
{
  uint64_t v3 = __chkstk_darwin(self, a2, a3);
  uint64_t v25 = v4;
  uint64_t v5 = v3;
  id v7 = v6;
  [*(id *)(v5 + 24) appendData:v7];
  v8 = *(NSObject **)(v5 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0D20;
  block[3] = &unk_10050E160;
  block[4] = v5;
  id v23 = v7;
  id v32 = v23;
  dispatch_async(v8, block);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  while (1)
  {
    *(void *)&outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mData = v42;
    *(void *)&outOutputData.mBuffers[0].mNumberChannels = 0x200000000001;
    UInt32 ioOutputDataPacketSize = 1;
    v10 = *(OpaqueAudioConverter **)(v5 + 16);
    inInputDataProcUserData[0] = _NSConcreteStackBlock;
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = sub_1000C0D74;
    inInputDataProcUserData[3] = &unk_100500E38;
    inInputDataProcUserData[4] = v5;
    inInputDataProcUserData[5] = v25;
    OSStatus v11 = AudioConverterFillComplexBuffer(v10, (AudioConverterComplexInputDataProc)sub_1000C0FBC, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, &outPacketDescription);
    if (v11) {
      break;
    }
    UInt32 v12 = ioOutputDataPacketSize;
    if (ioOutputDataPacketSize)
    {
      UInt32 v13 = 0;
      do
      {
        v14 = AFSiriLogContextSpeech;
        ++v13;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v34 = "-[ADSpeechCompressor addAudioSampleData:]";
          __int16 v35 = 1024;
          UInt32 v36 = v13;
          __int16 v37 = 1024;
          UInt32 v38 = v12;
          __int16 v39 = 1024;
          UInt32 mDataByteSize = outPacketDescription.mDataByteSize;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s [%02u of %02u] Opus packet with %u bytes", buf, 0x1Eu);
        }
        v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)outOutputData.mBuffers[0].mData + outPacketDescription.mStartOffset, outPacketDescription.mDataByteSize, v23);
        [v9 addObject:v15];
        ++*(void *)(v5 + 32);

        UInt32 v12 = ioOutputDataPacketSize;
      }
      while (v13 < ioOutputDataPacketSize);
    }
  }
  OSStatus v16 = v11;
  if (v11 != 1836086393)
  {
    v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[ADSpeechCompressor addAudioSampleData:]";
      __int16 v35 = 1026;
      UInt32 v36 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s AudioConverter is sad: 0x%{public}xd", buf, 0x12u);
    }
  }
  objc_msgSend(*(id *)(v5 + 24), "replaceBytesInRange:withBytes:length:", 0, *(void *)(v5 + 40), 0, 0, v23);
  *(void *)(v5 + 40) = 0;
  v18 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    id v20 = [v9 count];
    *(_DWORD *)v42 = 136315394;
    v43 = "-[ADSpeechCompressor addAudioSampleData:]";
    __int16 v44 = 2048;
    id v45 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Sending %tu packets", v42, 0x16u);
  }
  v21 = *(NSObject **)(v5 + 48);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C0F60;
  v26[3] = &unk_10050E160;
  v26[4] = v5;
  id v27 = v9;
  id v22 = v9;
  dispatch_async(v21, v26);
}

- (void)startCompressionNarrowband:(BOOL)a3
{
  BOOL v3 = a3;
  p_audioConverter = &self->_audioConverter;
  if (self->_audioConverter)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ADSpeechCompressor.m" lineNumber:109 description:@"Already started compressor"];
  }
  id v7 = (void **)&SASCodecOPUS_Mono_8000HzValue;
  if (!v3) {
    id v7 = (void **)&SASCodecOPUS_Mono_16000HzValue;
  }
  v8 = *v7;
  if (v3) {
    double v9 = 8000.0;
  }
  else {
    double v9 = 16000.0;
  }
  if (v3) {
    UInt32 v10 = 160;
  }
  else {
    UInt32 v10 = 320;
  }
  id v11 = v8;
  id v12 = [objc_alloc((Class)CSSiriRecordingInfo) initWithDictation:1 codec:v11];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1290;
  block[3] = &unk_10050E160;
  block[4] = self;
  id v14 = v12;
  id v28 = v14;
  dispatch_async(queue, block);
  inSourceFormat.mSampleRate = v9;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1003E2A10;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1003E2A20;
  inDestinationFormat.mSampleRate = v9;
  *(void *)&inDestinationFormat.mFormatID = 1869641075;
  inDestinationFormat.mBytesPerPacket = 0;
  inDestinationFormat.mFramesPerPacket = v10;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1003E2A30;
  uint64_t v15 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, p_audioConverter);
  if (v15)
  {
    uint64_t v20 = v15;
    v21 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ADSpeechCompressor.m", 143, @"AudioConverterNew failed: %x", v20);
  }
  int inPropertyData = 32000;
  uint64_t v16 = AudioConverterSetProperty(*p_audioConverter, 0x62726174u, 4u, &inPropertyData);
  if (v16)
  {
    uint64_t v22 = v16;
    id v23 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ADSpeechCompressor.m", 147, @"AudioConverterSetProperty/kAudioConverterEncodeBitRate failed: %x", v22);
  }
  v17 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = v17;
}

- (void)reset
{
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    self->_audioConverter = 0;
  }
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = 0;

  self->_packetIndex = 0;
  self->_bytesConsumed = 0;
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0, 0, 0);
  }
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  if (a3) {
    (*((void (**)(id, double, double))a3 + 2))(a3, 0.0, 0.0);
  }
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1404;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C14DC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C15EC;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  [(ADSpeechCompressor *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)ADSpeechCompressor;
  [(ADSpeechCompressor *)&v3 dealloc];
}

- (ADSpeechCompressor)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADSpeechCompressor;
  UInt32 v10 = [(ADSpeechCompressor *)&v13 init];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_queue, a3);
  }

  return v11;
}

@end