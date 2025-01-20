@interface CSAudioInjectionEngine
- (AudioBufferList)pNonInterleavedABL;
- (AudioStreamBasicDescription)_defaultOutASBD;
- (AudioStreamBasicDescription)outASBD;
- (BOOL)alwaysOnVoiceTriggerEnabled;
- (BOOL)didSetScaleFactor;
- (BOOL)injectAudio:(id)a3;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (BOOL)isAlwaysOnVoiceTriggerAvailable;
- (BOOL)isRecording;
- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3;
- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3 withInputRecordingNumberOfChannels:(unsigned int)a4;
- (CSAudioInjectionEngineDelegate)delegate;
- (CSAudioInjectionFileOption)fileOption;
- (NSMutableArray)injectionAudioFileList;
- (NSMutableArray)injectionCompletionNotifyBlocks;
- (NSMutableArray)injectionStartNotifyBlocks;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (OpaqueAudioConverter)deinterleaver;
- (double)bufferDuration;
- (float)scaleFactor;
- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4;
- (id)_deinterleaveBufferIfNeeded:(AudioBufferList *)a3;
- (unint64_t)audioStreamHandleId;
- (unsigned)inputRecordingNumberOfChannels;
- (void)_createDeInterleaverIfNeeded;
- (void)_readAudioBufferAndFeed;
- (void)_startAudioFeedingTimer;
- (void)dealloc;
- (void)setAudioFeedTimer:(id)a3;
- (void)setAudioStreamHandleId:(unint64_t)a3;
- (void)setBufferDuration:(double)a3;
- (void)setDeinterleaver:(OpaqueAudioConverter *)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetScaleFactor:(BOOL)a3;
- (void)setFileOption:(id)a3;
- (void)setInjectionAudioFileList:(id)a3;
- (void)setInjectionCompletionNotifyBlocks:(id)a3;
- (void)setInjectionStartNotifyBlocks:(id)a3;
- (void)setInputRecordingNumberOfChannels:(unsigned int)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setOutASBD:(AudioStreamBasicDescription *)a3;
- (void)setPNonInterleavedABL:(AudioBufferList *)a3;
- (void)setQueue:(id)a3;
- (void)setScaleFactor:(float)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)startAudioStreamWithOption:(id)a3;
- (void)stop;
- (void)stopAudioStream;
@end

@implementation CSAudioInjectionEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_injectionCompletionNotifyBlocks, 0);
  objc_storeStrong((id *)&self->_injectionStartNotifyBlocks, 0);
  objc_storeStrong((id *)&self->_injectionAudioFileList, 0);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_fileOption, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setInputRecordingNumberOfChannels:(unsigned int)a3
{
  self->_inputRecordingNumberOfChannels = a3;
}

- (unsigned)inputRecordingNumberOfChannels
{
  return self->_inputRecordingNumberOfChannels;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setDidSetScaleFactor:(BOOL)a3
{
  self->_didSetScaleFactor = a3;
}

- (BOOL)didSetScaleFactor
{
  return self->_didSetScaleFactor;
}

- (void)setPNonInterleavedABL:(AudioBufferList *)a3
{
  self->_pNonInterleavedABL = a3;
}

- (AudioBufferList)pNonInterleavedABL
{
  return self->_pNonInterleavedABL;
}

- (void)setDeinterleaver:(OpaqueAudioConverter *)a3
{
  self->_deinterleaver = a3;
}

- (OpaqueAudioConverter)deinterleaver
{
  return self->_deinterleaver;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setInjectionCompletionNotifyBlocks:(id)a3
{
}

- (NSMutableArray)injectionCompletionNotifyBlocks
{
  return self->_injectionCompletionNotifyBlocks;
}

- (void)setInjectionStartNotifyBlocks:(id)a3
{
}

- (NSMutableArray)injectionStartNotifyBlocks
{
  return self->_injectionStartNotifyBlocks;
}

- (void)setInjectionAudioFileList:(id)a3
{
}

- (NSMutableArray)injectionAudioFileList
{
  return self->_injectionAudioFileList;
}

- (void)setBufferDuration:(double)a3
{
  self->_bufferDuration = a3;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void)setOutASBD:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_outASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outASBD.mBytesPerPacket = v4;
  *(_OWORD *)&self->_outASBD.mSampleRate = v3;
}

- (AudioStreamBasicDescription)outASBD
{
  long long v3 = *(_OWORD *)&self[3].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[3].mBitsPerChannel;
  return self;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setFileOption:(id)a3
{
}

- (CSAudioInjectionFileOption)fileOption
{
  return self->_fileOption;
}

- (CSAudioInjectionEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioInjectionEngineDelegate *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (AudioStreamBasicDescription)_defaultOutASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  if (+[CSConfig inputRecordingIsFloat]) {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmFloatASBD];
  }
  else {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  }
  long long v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  id v6 = a3;
  long long v7 = v6;
  if (self->_inputRecordingNumberOfChannels <= a4)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", (unint64_t)objc_msgSend(v6, "length") / a4 * self->_inputRecordingNumberOfChannels);
    unsigned int inputRecordingNumberOfChannels = self->_inputRecordingNumberOfChannels;
    unint64_t v10 = qword_1002A3C60;
    if (!(v10 % +[CSUtils loggingHeartbeatRate]))
    {
      v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        v14 = "-[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:]";
        __int16 v15 = 1026;
        unsigned int v16 = inputRecordingNumberOfChannels - a4;
        __int16 v17 = 2050;
        uint64_t v18 = qword_1002A3C60;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v13, 0x1Cu);
      }
    }
    ++qword_1002A3C60;
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v7, "length"), objc_msgSend(v7, "bytes"));
  }

  return v8;
}

- (id)_deinterleaveBufferIfNeeded:(AudioBufferList *)a3
{
  if (self->_deinterleaver && a3->mBuffers[0].mNumberChannels >= 2)
  {
    id v5 = [objc_alloc((Class)NSMutableData) initWithLength:a3->mBuffers[0].mDataByteSize];
    id v6 = (char *)[v5 mutableBytes];
    UInt32 v7 = a3->mBuffers[0].mDataByteSize / a3->mBuffers[0].mNumberChannels;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = (char *)self->_pNonInterleavedABL + v8;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = v7;
      *((void *)v10 + 2) = &v6[v7 * v9++];
      v8 += 16;
    }
    while (v9 < a3->mBuffers[0].mNumberChannels);
    deinterleaver = self->_deinterleaver;
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD];
    OSStatus v12 = AudioConverterConvertComplexBuffer(deinterleaver, v7 / v16, a3, self->_pNonInterleavedABL);
    if (v12)
    {
      OSStatus v13 = v12;
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v18 = "-[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:]";
        __int16 v19 = 1026;
        OSStatus v20 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Failed to deinterleave the data: %{public}d", buf, 0x12u);
      }
    }
  }
  else
  {
    id v5 = [objc_alloc((Class)NSData) initWithBytes:a3->mBuffers[0].mData length:a3->mBuffers[0].mDataByteSize];
  }
  return v5;
}

- (void)stopAudioStream
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164358;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startAudioStreamWithOption:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001644E4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  UInt32 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100164650;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001649CC;
  v39[3] = &unk_100253358;
  id v15 = v13;
  id v40 = v15;
  unsigned int v16 = objc_retainBlock(v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001649E4;
  v37[3] = &unk_100253358;
  id v17 = v14;
  id v38 = v17;
  uint64_t v18 = objc_retainBlock(v37);
  if (!v12)
  {
    v28 = CSLogContextFacilityCoreSpeech;
    BOOL v27 = 0;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s Cannot speak nil Audio URL", buf, 0xCu);
LABEL_8:
    BOOL v27 = 0;
    goto LABEL_9;
  }
  __int16 v19 = +[NSFileManager defaultManager];
  OSStatus v20 = [v12 path];
  unsigned __int8 v21 = [v19 fileExistsAtPath:v20];

  if ((v21 & 1) == 0)
  {
    v29 = (void *)CSLogContextFacilityCoreSpeech;
    BOOL v27 = 0;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v30 = v29;
    v31 = [v12 path];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s Cannot speak since audio file does not exists : %@", buf, 0x16u);

    goto LABEL_8;
  }
  v22 = [CSAudioInjectionFileOption alloc];
  long long v23 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&buf[16] = v23;
  uint64_t v42 = *(void *)&a5->mBitsPerChannel;
  v24 = [(CSAudioInjectionFileOption *)v22 initWithAudioURL:v12 withScaleFactor:buf outASBD:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], LODWORD(a4)))];
  queue = self->_queue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001649FC;
  v33[3] = &unk_100253380;
  v33[4] = self;
  v34 = v24;
  v35 = v16;
  v36 = v18;
  v26 = v24;
  dispatch_async(queue, v33);

  BOOL v27 = 1;
LABEL_9:

  return v27;
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [(CSAudioInjectionEngine *)self _defaultOutASBD];
  *(float *)&double v13 = a4;
  LOBYTE(self) = [(CSAudioInjectionEngine *)self injectAudio:v12 withScaleFactor:v15 outASBD:v11 playbackStarted:v10 completion:v13];

  return (char)self;
}

- (BOOL)injectAudio:(id)a3
{
  LODWORD(v3) = 1008981770;
  return [(CSAudioInjectionEngine *)self injectAudio:a3 withScaleFactor:0 playbackStarted:0 completion:v3];
}

- (void)_readAudioBufferAndFeed
{
  fileOption = self->_fileOption;
  if (!fileOption || ![(CSAudioInjectionFileOption *)fileOption fFile])
  {
    if ([(NSMutableArray *)self->_injectionAudioFileList count])
    {
      id v16 = [(NSMutableArray *)self->_injectionAudioFileList objectAtIndex:0];
      ExtAudioFileRef outExtAudioFile = 0;
      id v17 = [(NSMutableArray *)self->_injectionStartNotifyBlocks objectAtIndex:0];
      [(NSMutableArray *)self->_injectionAudioFileList removeObjectAtIndex:0];
      [(NSMutableArray *)self->_injectionStartNotifyBlocks removeObjectAtIndex:0];
      CFURLRef v18 = [v16 audioURL];
      OSStatus v19 = ExtAudioFileOpenURL(v18, &outExtAudioFile);

      if (v19)
      {
        OSStatus v20 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v69 = v20;
          v70 = [v16 audioURL];
          *(_DWORD *)inPropertyData = 136315650;
          *(void *)&inPropertyData[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
          *(_WORD *)&inPropertyData[12] = 2112;
          *(void *)&inPropertyData[14] = v70;
          *(_WORD *)&inPropertyData[22] = 1024;
          *(_DWORD *)&inPropertyData[24] = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%s Failed to open audio file %@, error : %d", inPropertyData, 0x1Cu);
        }
      }
      uint64_t v106 = 0;
      memset(inPropertyData, 0, sizeof(inPropertyData));
      if (v16) {
        [v16 outASBD];
      }
      ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
      *(_OWORD *)buf = *(_OWORD *)inPropertyData;
      *(_OWORD *)&buf[16] = *(_OWORD *)&inPropertyData[16];
      uint64_t v104 = v106;
      [v16 setOutASBD:buf];
      [v16 setFFile:outExtAudioFile];
      [(CSAudioInjectionEngine *)self setFileOption:v16];
      unsigned __int8 v21 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        long long v23 = [v16 description];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Streaming from %@", buf, 0x16u);
      }
      uint64_t v24 = mach_absolute_time();
      v17[2](v17, v24);
    }
    else
    {
      if (!self->_isRecording) {
        return;
      }
      double bufferDuration = self->_bufferDuration;
      [(CSAudioInjectionEngine *)self _defaultOutASBD];
      [(CSAudioInjectionEngine *)self _defaultOutASBD];
      LODWORD(v26) = v76;
      double v27 = bufferDuration * v77 * (double)v26;
      [(CSAudioInjectionEngine *)self _defaultOutASBD];
      LODWORD(v28) = v75;
      size_t v29 = (unint64_t)(v27 * (double)v28);
      v30 = +[NSMutableData dataWithLength:v29];
      *(void *)inPropertyData = 1;
      [(CSAudioInjectionEngine *)self _defaultOutASBD];
      *(_DWORD *)&inPropertyData[8] = v74;
      *(_DWORD *)&inPropertyData[12] = v29;
      id v31 = v30;
      *(void *)&inPropertyData[16] = [v31 bytes];
      id v16 = v31;
      memset([v16 bytes], 1, v29);
      v32 = [(CSAudioInjectionEngine *)self _deinterleaveBufferIfNeeded:inPropertyData];
      id v17 = [(CSAudioInjectionEngine *)self _compensateChannelDataIfNeeded:v32 receivedNumChannels:1];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        id v35 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v35, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", self, -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"), v17, 0, mach_absolute_time(), 0);
      }
    }

    goto LABEL_70;
  }
  double v4 = self->_bufferDuration;
  id v5 = self->_fileOption;
  if (!v5)
  {
    uint64_t v102 = 0;
    long long v100 = 0u;
    long long v101 = 0u;
    double v10 = v4 * 0.0;
    unint64_t v7 = (unint64_t)v10;
LABEL_23:
    uint64_t v99 = 0;
    long long v97 = 0u;
    long long v98 = 0u;
    goto LABEL_24;
  }
  [(CSAudioInjectionFileOption *)v5 outASBD];
  uint64_t v6 = self->_fileOption;
  unint64_t v7 = (unint64_t)(v4 * *(double *)&v100);
  double v8 = self->_bufferDuration;
  if (!v6)
  {
    double v10 = v8 * 0.0;
    goto LABEL_23;
  }
  [(CSAudioInjectionFileOption *)v6 outASBD];
  char v9 = self->_fileOption;
  double v10 = v8 * *(double *)&v97;
  if (!v9)
  {
LABEL_24:
    uint64_t v96 = 0;
    long long v94 = 0u;
    long long v95 = 0u;
    double v13 = v10 * 0.0;
    goto LABEL_25;
  }
  [(CSAudioInjectionFileOption *)v9 outASBD];
  id v11 = self->_fileOption;
  LODWORD(v12) = DWORD2(v95);
  double v13 = v10 * (double)v12;
  if (!v11)
  {
LABEL_25:
    uint64_t v93 = 0;
    long long v91 = 0u;
    long long v92 = 0u;
    double v15 = 0.0;
    goto LABEL_26;
  }
  [(CSAudioInjectionFileOption *)v11 outASBD];
  LODWORD(v14) = HIDWORD(v92);
  double v15 = (double)v14;
LABEL_26:
  size_t v36 = (unint64_t)(v13 * v15);
  v37 = +[NSMutableData dataWithLength:v36];
  *(void *)inPropertyData = 1;
  id v38 = self->_fileOption;
  if (v38)
  {
    [(CSAudioInjectionFileOption *)v38 outASBD];
    int v39 = HIDWORD(v89);
  }
  else
  {
    int v39 = 0;
    uint64_t v90 = 0;
    long long v88 = 0u;
    long long v89 = 0u;
  }
  *(_DWORD *)&inPropertyData[8] = v39;
  *(_DWORD *)&inPropertyData[12] = v36;
  id v40 = v37;
  *(void *)&inPropertyData[16] = [v40 bytes];
  id v16 = v40;
  memset([v16 bytes], 1, v36);
  LODWORD(outExtAudioFile) = v36;
  OSStatus v41 = ExtAudioFileRead([(CSAudioInjectionFileOption *)self->_fileOption fFile], (UInt32 *)&outExtAudioFile, (AudioBufferList *)inPropertyData);
  if (!self->_didSetScaleFactor)
  {
    [(CSAudioInjectionFileOption *)self->_fileOption scaleFactor];
    self->_float scaleFactor = v42;
    self->_didSetScaleFactor = 1;
  }
  if (v41) {
    BOOL v43 = 0;
  }
  else {
    BOOL v43 = v7 == outExtAudioFile;
  }
  int v44 = v43;
  if (v41 || !outExtAudioFile)
  {
    if (v41)
    {
      v48 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s ::: Error reading data from audio file : %d", buf, 0x12u);
      }
    }
    ExtAudioFileDispose([(CSAudioInjectionFileOption *)self->_fileOption fFile]);
    [(CSAudioInjectionFileOption *)self->_fileOption setFFile:0];
    v49 = self->_fileOption;
    self->_fileOption = 0;

    v50 = [(NSMutableArray *)self->_injectionCompletionNotifyBlocks objectAtIndex:0];
    [(NSMutableArray *)self->_injectionCompletionNotifyBlocks removeObjectAtIndex:0];
    self->_didSetScaleFactor = 0;
    self->_float scaleFactor = 0.01;
    uint64_t v51 = mach_absolute_time();
    v50[2](v50, v51);
LABEL_69:

    goto LABEL_70;
  }
  if (self->_isRecording)
  {
    v45 = [(CSAudioInjectionEngine *)self _deinterleaveBufferIfNeeded:inPropertyData];
    v46 = self->_fileOption;
    if (v46)
    {
      [(CSAudioInjectionFileOption *)v46 outASBD];
      uint64_t v47 = HIDWORD(v86);
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v87 = 0;
      long long v85 = 0u;
      long long v86 = 0u;
    }
    v50 = [(CSAudioInjectionEngine *)self _compensateChannelDataIfNeeded:v45 receivedNumChannels:v47];

    id v52 = [objc_alloc((Class)NSMutableData) initWithData:v50];
    unint64_t v53 = (unint64_t)[v50 length];
    v54 = self->_fileOption;
    unsigned int v71 = v44;
    id v72 = v52;
    if (v54)
    {
      [(CSAudioInjectionFileOption *)v54 outASBD];
      unint64_t v55 = HIDWORD(v83);
    }
    else
    {
      unint64_t v55 = 0;
      uint64_t v84 = 0;
      long long v82 = 0u;
      long long v83 = 0u;
    }
    if (self->_scaleFactor < 1.0)
    {
      v73 = (__int16 *)[v52 bytes];
      if (v53 >> 1 >= v55)
      {
        unint64_t v56 = 0;
        unint64_t v57 = (v53 >> 1) / v55;
        while (1)
        {
          unint64_t v58 = 0;
          do
          {
            for (unint64_t i = 0; ; ++i)
            {
              v60 = self->_fileOption;
              if (v60)
              {
                [(CSAudioInjectionFileOption *)v60 outASBD];
                unint64_t v61 = HIDWORD(v80);
              }
              else
              {
                unint64_t v61 = 0;
                uint64_t v81 = 0;
                long long v79 = 0u;
                long long v80 = 0u;
              }
              if (i >= v61) {
                break;
              }
              v73[v56 + v58 + i * v57] = (int)(float)(self->_scaleFactor * (float)v73[v56 + v58 + i * v57]);
            }
            BOOL v62 = v58 >= 6;
            v58 += 2;
          }
          while (!v62);
          float scaleFactor = self->_scaleFactor;
          [(CSAudioInjectionFileOption *)self->_fileOption scaleFactor];
          if ((float)(scaleFactor + v64) >= 1.0) {
            break;
          }
          [(CSAudioInjectionFileOption *)self->_fileOption scaleFactor];
          self->_float scaleFactor = v65 + self->_scaleFactor;
          v56 += 16;
          if (v56 >= v57) {
            goto LABEL_66;
          }
        }
        self->_float scaleFactor = 1.0;
      }
    }
LABEL_66:
    id v66 = objc_loadWeakRetained((id *)&self->_delegate);
    char v67 = objc_opt_respondsToSelector();

    if (v67)
    {
      id v68 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v68, "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:", self, -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"), v72, 0, mach_absolute_time(), v71);
    }
    goto LABEL_69;
  }
LABEL_70:
}

- (void)_startAudioFeedingTimer
{
  double v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0, (unint64_t)(self->_bufferDuration * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak(&location, self);
  id v5 = self->_audioFeedTimer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001654CC;
  v6[3] = &unk_1002533D0;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100165580;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_createDeInterleaverIfNeeded
{
  self->_deinterleaver = 0;
  p_deinterleaver = &self->_deinterleaver;
  +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD];
  uint64_t v4 = v14;
  if (+[CSUtils shouldDeinterleaveAudioOnCS]) {
    BOOL v5 = v14 >= 2;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    memset(&inSourceFormat, 0, sizeof(inSourceFormat));
    +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBD];
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD];
    OSStatus v6 = AudioConverterNew(&inSourceFormat, &v12, p_deinterleaver);
    if (v6)
    {
      OSStatus v7 = v6;
      double v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v16 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
        __int16 v17 = 1026;
        OSStatus v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Cannot create de-interleaver using AudioConverterNew: %{public}d", buf, 0x12u);
      }
      *p_deinterleaver = 0;
    }
    pNonInterleavedABL = self->_pNonInterleavedABL;
    if (pNonInterleavedABL) {
      free(pNonInterleavedABL);
    }
    double v10 = (AudioBufferList *)malloc_type_malloc(24 * v4, 0x10800404ACF7207uLL);
    self->_pNonInterleavedABL = v10;
    v10->mNumberBuffers = v4;
    id v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Created de-interleaver", buf, 0xCu);
    }
  }
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016590C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  return 0;
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  deinterleaver = self->_deinterleaver;
  if (deinterleaver) {
    AudioConverterDispose(deinterleaver);
  }
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL)
  {
    free(pNonInterleavedABL);
    self->_pNonInterleavedABL = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionEngine;
  [(CSAudioInjectionEngine *)&v5 dealloc];
}

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3 withInputRecordingNumberOfChannels:(unsigned int)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CSAudioInjectionEngine;
  OSStatus v6 = [(CSAudioInjectionEngine *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSAudioInjectionEngine", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_audioStreamHandleId = a3;
    +[CSConfig inputRecordingBufferDuration];
    v6->_double bufferDuration = v9;
    uint64_t v10 = +[NSMutableArray array];
    injectionAudioFileList = v6->_injectionAudioFileList;
    v6->_injectionAudioFileList = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    injectionStartNotifyBlocks = v6->_injectionStartNotifyBlocks;
    v6->_injectionStartNotifyBlocks = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    injectionCompletionNotifyBlocks = v6->_injectionCompletionNotifyBlocks;
    v6->_injectionCompletionNotifyBlocks = (NSMutableArray *)v14;

    uint64_t v16 = +[NSUUID UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v16;

    v6->_didSetScaleFactor = 0;
    v6->_float scaleFactor = 0.01;
    v6->_unsigned int inputRecordingNumberOfChannels = a4;
  }
  return v6;
}

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3
{
  id v5 = +[CSConfig inputRecordingNumberOfChannels];
  return [(CSAudioInjectionEngine *)self initWithStreamHandleId:a3 withInputRecordingNumberOfChannels:v5];
}

@end