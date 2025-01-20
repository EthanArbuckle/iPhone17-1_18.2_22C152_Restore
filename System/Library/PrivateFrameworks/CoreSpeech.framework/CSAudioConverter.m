@interface CSAudioConverter
+ (id)narrowBandOpusConverter;
+ (id)opusConverter;
+ (id)speexConverter;
- (CSAudioConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4;
- (CSAudioConverterDelegate)delegate;
- (void)_configureAudioConverter:(OpaqueAudioConverter *)a3;
- (void)_convertBufferedLPCM:(id)a3 allowPartial:(BOOL)a4 timestamp:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6;
- (void)addSamples:(id)a3 timestamp:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation CSAudioConverter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bufferedLPCM, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioConverterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioConverterDelegate *)WeakRetained;
}

- (void)_configureAudioConverter:(OpaqueAudioConverter *)a3
{
  +[CSConfig inputRecordingBufferDuration];
  double v6 = v5;
  +[CSConfig inputRecordingSampleRate];
  unsigned int v8 = (v6 * v7);
  v9 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    +[CSConfig inputRecordingBufferDuration];
    uint64_t v12 = v11;
    +[CSConfig inputRecordingSampleRate];
    *(_DWORD *)buf = 136315906;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 2050;
    uint64_t v38 = v12;
    __int16 v39 = 2050;
    double v40 = v13;
    __int16 v41 = 1026;
    unsigned int v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s createAudioConverter : initial frames per buffer = dur %{public}.2f * sr %{public}.2f = %{public}u", buf, 0x26u);
  }
  UInt32 ioPropertyDataSize = 40;
  OSStatus Property = AudioConverterGetProperty(a3, 0x61636F64u, &ioPropertyDataSize, &self->_opusOutASBD);
  if (Property)
  {
    OSStatus v15 = Property;
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Failed to get audioConverter property (kAudioConverterCurrentOutputStreamDescription) : %{public}d", buf, 0x12u);
    }
  }
  double mSampleRate = self->_opusOutASBD.mSampleRate;
  if (self->_opusOutASBD.mFormatID != 1936745848) {
    self->_recordBasePacketsPerSecond = (mSampleRate / (double)v8);
  }
  UInt32 mBytesPerPacket = self->_opusOutASBD.mBytesPerPacket;
  UInt32 mFramesPerPacket = self->_opusOutASBD.mFramesPerPacket;
  float v20 = (double)mFramesPerPacket / mSampleRate;
  self->_outPacketSizeInSec = v20;
  unsigned int outPropertyData = 2100;
  UInt32 v33 = mBytesPerPacket;
  UInt32 ioPropertyDataSize = 4;
  OSStatus v21 = AudioConverterGetProperty(a3, 0x6D6F6273u, &ioPropertyDataSize, &outPropertyData);
  v22 = CSLogCategoryAudio;
  BOOL v23 = os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v23) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v21;
    v24 = "%s _configureAudioConverter: AudioConverterGetProperty(kAudioConverterPropertyMinimumOutputBufferSize) returne"
          "d status %{public}d";
  }
  else
  {
    if (!v23) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = outPropertyData;
    v24 = "%s _configureAudioConverter: encoded audio needs minimum of %{public}u bytes per output buffer";
  }
  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0x12u);
LABEL_14:
  if (v8 == v8 % mFramesPerPacket) {
    unsigned int v25 = 1;
  }
  else {
    unsigned int v25 = v8 / mFramesPerPacket * mFramesPerPacket;
  }
  self->_unsigned int convertPacketCount = v25 / self->_opusOutASBD.mFramesPerPacket + 1;
  v26 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: final framesPerBuffer: %{public}u", buf, 0x12u);
    v26 = CSLogCategoryAudio;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int convertPacketCount = self->_convertPacketCount;
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = convertPacketCount;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: _convertPacketCount: %{public}u", buf, 0x12u);
  }
  UInt32 ioPropertyDataSize = 4;
  OSStatus v28 = AudioConverterGetProperty(a3, 0x786F7073u, &ioPropertyDataSize, &v33);
  v29 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: AudioConverterGetProperty(MaximumOutputPacketSize): returned status %{public}d", buf, 0x12u);
  }
  if (!v28)
  {
    v30 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s createAudioConverter: outputSizePerPacket: %{public}u", buf, 0x12u);
      v30 = CSLogCategoryAudio;
    }
    if (outPropertyData <= v33 * self->_convertPacketCount) {
      unsigned int v31 = v33 * self->_convertPacketCount;
    }
    else {
      unsigned int v31 = outPropertyData;
    }
    self->_convertAudioCapacity = v31;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s _configureAudioConverter: _convertAudioCapacity %{public}u bytes", buf, 0x12u);
    }
  }
}

- (void)reset
{
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[CSAudioConverter reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting AudioConverter buffer", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableData *)self->_bufferedLPCM setLength:0];
  AudioConverterReset(self->_opusConverter);
}

- (void)_convertBufferedLPCM:(id)a3 allowPartial:(BOOL)a4 timestamp:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6
{
  unint64_t v39 = a6;
  unint64_t v38 = a5;
  BOOL v44 = a4;
  v46 = self;
  id v45 = a3;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  int v56 = 0;
  double v6 = +[NSMutableArray array];
  if ([v45 length])
  {
    v43 = _NSConcreteStackBlock;
    unsigned int v42 = sub_10016A478;
    *(void *)&long long v7 = 136315138;
    long long v40 = v7;
    *(void *)&long long v7 = 136316162;
    long long v41 = v7;
    while (1)
    {
      memset(&outOutputData, 0, sizeof(outOutputData));
      uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
      outOutputData.mBuffers[0].mData = (char *)&v38 - ((v9 + 15) & 0x1FFFFFFF0);
      UInt32 v11 = *(_DWORD *)(v10 + 76);
      UInt32 ioOutputDataPacketSize = *(_DWORD *)(v10 + 72);
      outOutputData.mNumberBuffers = 1;
      outOutputData.mBuffers[0].mNumberChannels = 1;
      outOutputData.mBuffers[0].mDataByteSize = v11;
      __chkstk_darwin(v8);
      float v13 = (AudioStreamPacketDescription *)(&v38 - 2 * v12);
      OSStatus v15 = *(OpaqueAudioConverter **)(v14 + 8);
      inInputDataProcUserData[0] = v43;
      inInputDataProcUserData[1] = 3221225472;
      inInputDataProcUserData[2] = v42;
      inInputDataProcUserData[3] = &unk_100253568;
      id v16 = v45;
      id v48 = v16;
      v49 = &v53;
      BOOL v50 = v44;
      OSStatus v17 = AudioConverterFillComplexBuffer(v15, (AudioConverterComplexInputDataProc)sub_10016A648, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, v13);
      int v18 = v17;
      UInt32 v19 = ioOutputDataPacketSize;
      if (v17 | ioOutputDataPacketSize)
      {
        if (v17 != 1836086393 && v17) {
          goto LABEL_18;
        }
      }
      else
      {
        float v20 = CSLogCategoryAudio;
        if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = v40;
        v58 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Override result as 'mpty'", buf, 0xCu);
        int v18 = 1836086393;
        UInt32 v19 = ioOutputDataPacketSize;
      }
      if (v19)
      {
        unint64_t v21 = 0;
        p_mDataByteSize = &v13->mDataByteSize;
        do
        {
          BOOL v23 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
          {
            double outPacketSizeInSec = v46->_outPacketSizeInSec;
            unsigned int v26 = *p_mDataByteSize;
            *(_DWORD *)buf = v41;
            v58 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
            __int16 v59 = 1026;
            int v60 = v21 + 1;
            __int16 v61 = 1026;
            UInt32 v62 = v19;
            __int16 v63 = 2050;
            double v64 = outPacketSizeInSec;
            __int16 v65 = 1024;
            unsigned int v66 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s [%{public}02u of %{public}02u %{public}fs] Opus packet with %u bytes", buf, 0x28u);
          }
          v24 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)outOutputData.mBuffers[0].mData + *(void *)(p_mDataByteSize - 3), *p_mDataByteSize, v38, v39);
          [v6 addObject:v24];

          ++v21;
          UInt32 v19 = ioOutputDataPacketSize;
          p_mDataByteSize += 4;
        }
        while (v21 < ioOutputDataPacketSize);
      }
      if (v18) {
        break;
      }
    }
    if (v18 == 1836086393) {
      goto LABEL_20;
    }
LABEL_18:
    OSStatus v28 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      __int16 v59 = 1026;
      int v60 = v18;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s AudioConverter is sad: 0x%{public}xd", buf, 0x12u);
    }
LABEL_20:

    objc_msgSend(v16, "replaceBytesInRange:withBytes:length:", 0, *((int *)v54 + 6), 0, 0);
    v29 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      int v36 = *((_DWORD *)v54 + 6);
      unsigned int v37 = [v16 length];
      *(_DWORD *)buf = 136315650;
      v58 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      __int16 v59 = 1026;
      int v60 = v36;
      __int16 v61 = 1026;
      UInt32 v62 = v37;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s %{public}d bytesConsumed from opus coverter, remains %{public}d bytes", buf, 0x18u);
    }

    *((_DWORD *)v54 + 6) = 0;
    if ([v6 count])
    {
      p_delegate = (id *)&v46->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)&v46->_delegate);
      BOOL v32 = WeakRetained == 0;

      if (!v32)
      {
        id v33 = objc_loadWeakRetained(p_delegate);
        float v34 = v46->_outPacketSizeInSec;
        *(float *)&double v35 = v34 * (float)(unint64_t)[v6 count];
        [v33 audioConverterDidConvertPackets:v46 packets:v6 durationInSec:v38 timestamp:v39 arrivalTimestampToAudioRecorder:v35];
      }
    }
  }
  else
  {
    v27 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s There is not audio buffer to convert. Skip this.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v53, 8);
}

- (void)flush
{
}

- (void)addSamples:(id)a3 timestamp:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v9 = a3;
  uint64_t v8 = v9;
  if (+[CSConfig inputRecordingIsFloat])
  {
    uint64_t v8 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v9];
  }
  [(NSMutableData *)self->_bufferedLPCM appendData:v8];
  [(CSAudioConverter *)self _convertBufferedLPCM:self->_bufferedLPCM allowPartial:0 timestamp:a4 arrivalTimestampToAudioRecorder:a5];
  self->_lastTimestamp = a4;
  self->_lastArrivalTimestampToAudioRecorder = a5;
}

- (void)dealloc
{
  opusConverter = self->_opusConverter;
  if (opusConverter)
  {
    AudioConverterDispose(opusConverter);
    self->_opusConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioConverter;
  [(CSAudioConverter *)&v4 dealloc];
}

- (CSAudioConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CSAudioConverter;
  double v6 = [(CSAudioConverter *)&v21 init];
  if (!v6)
  {
LABEL_12:
    OSStatus v15 = v6;
    goto LABEL_13;
  }
  long long v7 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&inSourceFormat.double mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&inSourceFormat.UInt32 mBytesPerPacket = v7;
  *(void *)&inSourceFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  long long v8 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)&v19.double mSampleRate = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&v19.UInt32 mBytesPerPacket = v8;
  *(void *)&v19.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
  AudioConverterRef outAudioConverter = 0;
  OSStatus v9 = AudioConverterNew(&inSourceFormat, &v19, &outAudioConverter);
  if (v9)
  {
    OSStatus v10 = v9;
    UInt32 v11 = CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v25 = "CreateAudioConverter";
      __int16 v26 = 1026;
      unsigned int v27 = v10;
      uint64_t v12 = "%s Cannot create AudioConverter using AudioConverterNew : %{public}u";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  unsigned int inPropertyData = +[CSConfig audioConverterBitrate];
  OSStatus v13 = AudioConverterSetProperty(outAudioConverter, 0x62726174u, 4u, &inPropertyData);
  AudioConverterRef v14 = outAudioConverter;
  if (!v13)
  {
    v6->_opusConverter = outAudioConverter;
    if (!v14)
    {
      OSStatus v15 = 0;
      goto LABEL_13;
    }
    -[CSAudioConverter _configureAudioConverter:](v6, "_configureAudioConverter:");
    uint64_t v16 = +[NSMutableData data];
    bufferedLPCM = v6->_bufferedLPCM;
    v6->_bufferedLPCM = (NSMutableData *)v16;

    goto LABEL_12;
  }
  AudioConverterDispose(outAudioConverter);
  UInt32 v11 = CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v25 = "CreateAudioConverter";
    __int16 v26 = 1026;
    unsigned int v27 = inPropertyData;
    uint64_t v12 = "%s Cannot set encoder bit rate : %{public}u";
    goto LABEL_8;
  }
LABEL_9:
  OSStatus v15 = 0;
  v6->_opusConverter = 0;
LABEL_13:

  return v15;
}

+ (id)speexConverter
{
  v2 = [CSAudioConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  +[CSFAudioStreamBasicDescriptionFactory speexASBD];
  v3 = [(CSAudioConverter *)v2 initWithInASBD:v6 outASBD:&v5];
  return v3;
}

+ (id)narrowBandOpusConverter
{
  v2 = [CSAudioConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16NarrowBandASBD];
  +[CSFAudioStreamBasicDescriptionFactory opusNarrowBandASBD];
  v3 = [(CSAudioConverter *)v2 initWithInASBD:v6 outASBD:&v5];
  return v3;
}

+ (id)opusConverter
{
  v2 = [CSAudioConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  +[CSFAudioStreamBasicDescriptionFactory opusASBD];
  v3 = [(CSAudioConverter *)v2 initWithInASBD:v6 outASBD:&v5];
  return v3;
}

@end