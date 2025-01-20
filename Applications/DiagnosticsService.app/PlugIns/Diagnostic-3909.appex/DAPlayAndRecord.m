@interface DAPlayAndRecord
- (BOOL)isCancelled;
- (BOOL)sendRawData;
- (BOOL)sequentialAudioInput;
- (BOOL)setDeviceVolume:(float)a3;
- (BOOL)volumeNeedsReset;
- (DAAudioPlayAndRecordDelegate)delegate;
- (DAPlayAndRecord)initWithFileURL:(id)a3 fileName:(id)a4 numberOfInputs:(id)a5 inputID:(int64_t)a6 outputID:(int64_t)a7 volume:(id)a8 channel:(id)a9 sendRawData:(BOOL)a10 delegate:(id)a11 sequentialAudioInput:(BOOL)a12 error:(id *)a13;
- (NSArray)results;
- (NSNumber)channel;
- (NSNumber)numInputs;
- (NSNumber)volume;
- (NSString)fileName;
- (NSURL)fileURL;
- (OpaqueExtAudioFile)recordedSoundFile;
- (float)fileTimeInFrames;
- (id)error;
- (id)makeSignalsDataObjects;
- (int)calculateFileDurationForFile:(OpaqueAudioFileID *)a3 error:(id *)a4;
- (int)createAUGraphWithError:(id *)a3;
- (int)startAudioTestCase;
- (int64_t)inputID;
- (int64_t)outputID;
- (unsigned)playFrameCount;
- (unsigned)recordFrameCount;
- (void)cancel;
- (void)dealloc;
- (void)endAudioTestCase;
- (void)grabPlayBackFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4;
- (void)grabRecordedFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4;
- (void)resetToPreviousVolume;
- (void)setChannel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id *)a3;
- (void)setFileName:(id)a3;
- (void)setFileTimeInFrames:(float)a3;
- (void)setFileURL:(id)a3;
- (void)setInputID:(int64_t)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setNumInputs:(id)a3;
- (void)setOutputID:(int64_t)a3;
- (void)setPlayFrameCount:(unsigned int)a3;
- (void)setRecordFrameCount:(unsigned int)a3;
- (void)setRecordedSoundFile:(OpaqueExtAudioFile *)a3;
- (void)setResults:(id)a3;
- (void)setSendRawData:(BOOL)a3;
- (void)setSequentialAudioInput:(BOOL)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeNeedsReset:(BOOL)a3;
@end

@implementation DAPlayAndRecord

- (DAPlayAndRecord)initWithFileURL:(id)a3 fileName:(id)a4 numberOfInputs:(id)a5 inputID:(int64_t)a6 outputID:(int64_t)a7 volume:(id)a8 channel:(id)a9 sendRawData:(BOOL)a10 delegate:(id)a11 sequentialAudioInput:(BOOL)a12 error:(id *)a13
{
  CFURLRef v19 = (const __CFURL *)a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  v29.receiver = self;
  v29.super_class = (Class)DAPlayAndRecord;
  v25 = [(DAPlayAndRecord *)&v29 init];
  p_isa = &v25->super.isa;
  if (!v25) {
    goto LABEL_8;
  }
  [(DAPlayAndRecord *)v25 setError:a13];
  [(AudioFileID *)p_isa setFileName:v20];
  [(AudioFileID *)p_isa setFileURL:v19];
  [(AudioFileID *)p_isa setDelegate:v24];
  [(AudioFileID *)p_isa setNumInputs:v21];
  [(AudioFileID *)p_isa setInputID:a6];
  [(AudioFileID *)p_isa setOutputID:a7];
  [(AudioFileID *)p_isa setSendRawData:a10];
  [(AudioFileID *)p_isa setSequentialAudioInput:a12];
  [(AudioFileID *)p_isa setVolume:v22];
  [(AudioFileID *)p_isa setChannel:v23];
  [(AudioFileID *)p_isa setVolumeNeedsReset:0];
  if (!AudioFileOpenURL(v19, kAudioFileReadPermission, 0x57415645u, p_isa + 8))
  {
    if ([(AudioFileID *)p_isa calculateFileDurationForFile:p_isa[8] error:[(AudioFileID *)p_isa error]])goto LABEL_5; {
    if ([(AudioFileID *)p_isa createAUGraphWithError:[(AudioFileID *)p_isa error]])
    }
    {
      v27 = 0;
      goto LABEL_9;
    }
LABEL_8:
    v27 = p_isa;
    goto LABEL_9;
  }
  +[LegacyAudioSystemController setCode:-9 forError:[(AudioFileID *)p_isa error]];
LABEL_5:
  v27 = 0;
LABEL_9:

  return v27;
}

- (int)startAudioTestCase
{
  [(DAPlayAndRecord *)self fileTimeInFrames];
  self->sourceSignal = (float *)malloc_type_malloc(vcvts_n_u32_f32(v3, 2uLL), 0xE582BCD0uLL);
  v4 = [(DAPlayAndRecord *)self numInputs];
  self->receiveSignals = (float **)malloc_type_malloc(8 * (int)[v4 intValue], 0x80040B8603338uLL);

  v5 = [(DAPlayAndRecord *)self numInputs];
  int v6 = [v5 intValue];

  if (v6 >= 1)
  {
    for (uint64_t i = 0; i < v10; ++i)
    {
      [(DAPlayAndRecord *)self fileTimeInFrames];
      self->receiveSignals[i] = (float *)malloc_type_malloc(vcvts_n_u32_f32(v8, 2uLL), 0xE14B5C75uLL);
      v9 = [(DAPlayAndRecord *)self numInputs];
      signed int v10 = [v9 intValue];
    }
  }
  v11 = [(DAPlayAndRecord *)self numInputs];
  self->recordBufferList = (AudioBufferList *)malloc_type_malloc(16 * (int)([v11 intValue] - 1) + 24, 0x5FBF3A37uLL);

  v12 = [(DAPlayAndRecord *)self numInputs];
  self->recordBufferList->mNumberBuffers = [v12 unsignedIntValue];

  v13 = [(DAPlayAndRecord *)self numInputs];
  int v14 = [v13 intValue];

  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      v17 = malloc_type_malloc(0x1000uLL, 0xEE1632AEuLL);
      v18 = (char *)self->recordBufferList + v15;
      *((_DWORD *)v18 + 2) = 1;
      *((_DWORD *)v18 + 3) = 4096;
      *((void *)v18 + 2) = v17;
      CFURLRef v19 = [(DAPlayAndRecord *)self numInputs];
      ++v16;
      signed int v20 = [v19 intValue];

      v15 += 16;
    }
    while (v16 < v20);
  }
  OSStatus v21 = AudioUnitReset(self->generatorUnit, 0, 0);
  if (!v21)
  {
    uint64_t outPropertyData = 0;
    UInt32 ioDataSize = 8;
    OSStatus Property = AudioFileGetProperty(self->testSignalFile, 0x70636E74u, &ioDataSize, &outPropertyData);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:-43 forError:[(DAPlayAndRecord *)self error]];
      return Property;
    }
    uint64_t v48 = 1;
    long long v50 = 0u;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    long long v47 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    uint64_t inData = 0;
    uint64_t v49 = 0;
    *(void *)&long long v50 = 0;
    *((void *)&v50 + 1) = self->testSignalFile;
    int v23 = outPropertyData;
    +[DAAudioUnitHelper getBasicStreamDescription];
    LODWORD(v53) = v43[6] * v23;
    OSStatus Property = AudioUnitSetProperty(self->generatorUnit, 0xCEFu, 0, 0, &inData, 0x70u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:-44 forError:[(DAPlayAndRecord *)self error]];
      return Property;
    }
    v43[0] = 0;
    OSStatus Property = AudioUnitSetProperty(self->generatorUnit, 0xCF0u, 0, 0, v43, 4u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:-45 forError:[(DAPlayAndRecord *)self error]];
      return Property;
    }
    long long v41 = 0u;
    long long v40 = 0u;
    long long v39 = 0u;
    uint64_t v42 = 1;
    unint64_t v38 = 0xBFF0000000000000;
    OSStatus Property = AudioUnitSetProperty(self->generatorUnit, 0xCE5u, 0, 0, &v38, 0x40u);
    if (Property)
    {
      +[LegacyAudioSystemController setCode:-46 forError:[(DAPlayAndRecord *)self error]];
      return Property;
    }
    [(DAPlayAndRecord *)self setPlayFrameCount:0];
    [(DAPlayAndRecord *)self setRecordFrameCount:0];
    if ([(DAPlayAndRecord *)self outputID])
    {
      if ((id)[(DAPlayAndRecord *)self outputID] == (id)1)
      {
        id v24 = +[AVAudioSession sharedInstance];
        unsigned __int8 v25 = [v24 overrideOutputAudioPort:1936747378 error:[self error]];

        if ((v25 & 1) == 0)
        {
          +[LegacyAudioSystemController setCode:-48 forError:[(DAPlayAndRecord *)self error]];
          return 0;
        }
      }
    }
    else
    {
      v26 = +[AVAudioSession sharedInstance];
      unsigned __int8 v27 = [v26 overrideOutputAudioPort:0 error:[self error]];

      if ((v27 & 1) == 0)
      {
        +[LegacyAudioSystemController setCode:-47 forError:[(DAPlayAndRecord *)self error]];
        return 0;
      }
    }
    v28 = +[AVSystemController sharedAVSystemController];
    if ([(DAPlayAndRecord *)self outputID]) {
      CFStringRef v29 = @"Audio/Video";
    }
    else {
      CFStringRef v29 = @"PlayAndRecord";
    }
    [v28 getVolume:&self->previousDeviceVolume forCategory:v29];

    v30 = [(DAPlayAndRecord *)self volume];
    [v30 floatValue];
    unsigned __int8 v31 = -[DAPlayAndRecord setDeviceVolume:](self, "setDeviceVolume:");

    if (v31)
    {
      v32 = self;
      objc_sync_enter(v32);
      [(DAPlayAndRecord *)v32 setVolumeNeedsReset:1];
      if (![(DAPlayAndRecord *)v32 isCancelled])
      {
        v33 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = [(DAPlayAndRecord *)v32 fileURL];
          id v35 = [v34 lastPathComponent];
          int64_t v36 = [(DAPlayAndRecord *)v32 outputID];
          *(_DWORD *)buf = 138412546;
          id v57 = v35;
          __int16 v58 = 2048;
          int64_t v59 = v36;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Beginning %@ (outputID = %ld).", buf, 0x16u);
        }
        OSStatus Property = AUGraphStart(v32->testCaseGraph);
        if (Property)
        {
          +[LegacyAudioSystemController setCode:2 forError:[(DAPlayAndRecord *)v32 error]];
          objc_sync_exit(v32);

          return Property;
        }
      }
      objc_sync_exit(v32);
    }
    else
    {
      +[LegacyAudioSystemController setCode:-51 forError:[(DAPlayAndRecord *)self error]];
    }
    return 0;
  }
  OSStatus Property = v21;
  +[LegacyAudioSystemController setCode:-43 forError:[(DAPlayAndRecord *)self error]];
  return Property;
}

- (void)endAudioTestCase
{
  AUGraphStop(self->testCaseGraph);
  float v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(DAPlayAndRecord *)self fileURL];
    v5 = [v4 lastPathComponent];
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2048;
    int64_t v13 = [(DAPlayAndRecord *)self outputID];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ended %@ (outputID = %ld).", (uint8_t *)&v10, 0x16u);
  }
  [(DAPlayAndRecord *)self resetToPreviousVolume];
  uint64_t v6 = [(DAPlayAndRecord *)self makeSignalsDataObjects];
  v7 = +[NSMutableArray arrayWithArray:v6];
  [(DAPlayAndRecord *)self setResults:v7];

  [(DAPlayAndRecord *)self sendRawData];
  float v8 = [(DAPlayAndRecord *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    v9 = [(DAPlayAndRecord *)self delegate];
    [v9 playAndRecordFinished];
  }
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  [(DAPlayAndRecord *)v2 setIsCancelled:1];
  AUGraphStop(v2->testCaseGraph);
  float v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(DAPlayAndRecord *)v2 fileURL];
    id v5 = [v4 lastPathComponent];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2048;
    int64_t v9 = [(DAPlayAndRecord *)v2 outputID];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelled %@ (outputID = %ld).", (uint8_t *)&v6, 0x16u);
  }
  objc_sync_exit(v2);

  [(DAPlayAndRecord *)v2 resetToPreviousVolume];
}

- (void)resetToPreviousVolume
{
  obj = self;
  objc_sync_enter(obj);
  if ([(DAPlayAndRecord *)obj volumeNeedsReset])
  {
    *(float *)&double v2 = obj->previousDeviceVolume;
    [(DAPlayAndRecord *)obj setDeviceVolume:v2];
    [(DAPlayAndRecord *)obj setVolumeNeedsReset:0];
  }
  objc_sync_exit(obj);
}

- (BOOL)setDeviceVolume:(float)a3
{
  float v15 = 0.0;
  int64_t v5 = [(DAPlayAndRecord *)self outputID];
  int v6 = @"Audio/Video";
  if (!v5) {
    int v6 = @"PlayAndRecord";
  }
  id v7 = v6;
  __int16 v8 = +[AVSystemController sharedAVSystemController];
  [v8 getVolume:&v15 forCategory:v7];

  int64_t v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int64_t v10 = [(DAPlayAndRecord *)self outputID];
    *(_DWORD *)buf = 138413058;
    v17 = v7;
    __int16 v18 = 2048;
    int64_t v19 = v10;
    __int16 v20 = 2048;
    double v21 = v15;
    __int16 v22 = 2048;
    double v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Changing %@ Volume (outputID = %ld): %f -> %f", buf, 0x2Au);
  }

  v11 = +[AVSystemController sharedAVSystemController];
  *(float *)&double v12 = a3;
  unsigned __int8 v13 = [v11 setVolumeTo:v7 forCategory:v12];

  return v13;
}

- (void)dealloc
{
  free(self->recordBufferList);
  v3.receiver = self;
  v3.super_class = (Class)DAPlayAndRecord;
  [(DAPlayAndRecord *)&v3 dealloc];
}

- (void)grabPlayBackFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4
{
  float v7 = (float)[(DAPlayAndRecord *)self playFrameCount];
  [(DAPlayAndRecord *)self fileTimeInFrames];
  if (v8 >= v7)
  {
    int64_t v9 = [(DAPlayAndRecord *)self channel];
    unsigned int v10 = [v9 intValue];
    UInt32 mNumberBuffers = a3->mNumberBuffers;

    if (v10 < mNumberBuffers)
    {
      sourceSignal = self->sourceSignal;
      unsigned __int8 v13 = &sourceSignal[[(DAPlayAndRecord *)self playFrameCount]];
      int v14 = [(DAPlayAndRecord *)self channel];
      memcpy(v13, a3->mBuffers[(int)[v14 intValue]].mData, 4 * a4);

      uint64_t v15 = [(DAPlayAndRecord *)self playFrameCount] + a4;
      [(DAPlayAndRecord *)self setPlayFrameCount:v15];
    }
  }
}

- (void)grabRecordedFrameData:(AudioBufferList *)a3 withNumberOfFrames:(unsigned int)a4
{
  float v7 = (float)([(DAPlayAndRecord *)self recordFrameCount] + a4);
  [(DAPlayAndRecord *)self fileTimeInFrames];
  if (v8 >= v7
    && ([(DAPlayAndRecord *)self numInputs],
        int64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 intValue],
        UInt32 mNumberBuffers = a3->mNumberBuffers,
        v9,
        v10 <= mNumberBuffers))
  {
    int v14 = [(DAPlayAndRecord *)self numInputs];
    int v15 = [v14 intValue];

    if (v15 >= 1)
    {
      uint64_t v16 = 0;
      p_mData = &a3->mBuffers[0].mData;
      do
      {
        __int16 v18 = self->receiveSignals[v16];
        unsigned int v19 = [(DAPlayAndRecord *)self recordFrameCount];
        __int16 v20 = *p_mData;
        p_mData += 2;
        memcpy(&v18[v19], v20, 4 * a4);
        ++v16;
        double v21 = [(DAPlayAndRecord *)self numInputs];
        signed int v22 = [v21 intValue];
      }
      while (v16 < v22);
    }
  }
  else
  {
    float v12 = (float)[(DAPlayAndRecord *)self recordFrameCount];
    [(DAPlayAndRecord *)self fileTimeInFrames];
    if ((float)(v13 + 16384.0) <= v12) {
      [(DAPlayAndRecord *)self endAudioTestCase];
    }
  }
  uint64_t v23 = [(DAPlayAndRecord *)self recordFrameCount] + a4;

  [(DAPlayAndRecord *)self setRecordFrameCount:v23];
}

- (int)createAUGraphWithError:(id *)a3
{
  p_testCaseGraph = &self->testCaseGraph;
  OSStatus v6 = NewAUGraph(&self->testCaseGraph);
  if (v6 || (OSStatus v6 = AUGraphOpen(*p_testCaseGraph)) != 0)
  {
    OSStatus v7 = v6;
    uint64_t v8 = -11;
  }
  else
  {
    AudioUnit v52 = 0;
    AudioUnit outAudioUnit = 0;
    AudioUnit v51 = 0;
    *(void *)uint64_t v49 = 0;
    *(void *)outNode = 0;
    AUNode v48 = 0;
    uint64_t v47 = 0;
    long long v45 = 0u;
    long long v46 = 0u;
    +[DAAudioUnitHelper getBasicStreamDescription];
    unsigned int v10 = [(DAPlayAndRecord *)self numInputs];
    HIDWORD(v46) = [v10 unsignedIntValue];

    memset(&outDescription, 0, sizeof(outDescription));
    +[DAAudioUnitHelper getGeneratorDescription];
    memset(&inDescription, 0, sizeof(inDescription));
    +[DAAudioUnitHelper getRemoteIODescription];
    memset(&v42, 0, sizeof(v42));
    +[DAAudioUnitHelper getBandPassDescription];
    memset(&v41, 0, sizeof(v41));
    +[DAAudioUnitHelper getMixerDescription];
    OSStatus v11 = AUGraphAddNode(self->testCaseGraph, &inDescription, &outNode[1]);
    if (v11)
    {
      OSStatus v7 = v11;
      uint64_t v8 = -13;
    }
    else
    {
      OSStatus v12 = AUGraphAddNode(*p_testCaseGraph, &outDescription, outNode);
      if (v12)
      {
        OSStatus v7 = v12;
        uint64_t v8 = -14;
      }
      else
      {
        OSStatus v13 = AUGraphAddNode(*p_testCaseGraph, &v42, &v49[1]);
        if (v13)
        {
          OSStatus v7 = v13;
          uint64_t v8 = -15;
        }
        else
        {
          OSStatus v14 = AUGraphAddNode(*p_testCaseGraph, &v42, v49);
          if (v14)
          {
            OSStatus v7 = v14;
            uint64_t v8 = -16;
          }
          else
          {
            OSStatus v15 = AUGraphAddNode(*p_testCaseGraph, &v41, &v48);
            if (v15)
            {
              OSStatus v7 = v15;
              uint64_t v8 = -17;
            }
            else
            {
              p_remoteIOUnit = &self->remoteIOUnit;
              OSStatus v17 = AUGraphNodeInfo(self->testCaseGraph, outNode[1], &inDescription, &self->remoteIOUnit);
              if (v17)
              {
                OSStatus v7 = v17;
                uint64_t v8 = -18;
              }
              else
              {
                OSStatus v18 = AUGraphNodeInfo(self->testCaseGraph, outNode[0], &outDescription, &self->generatorUnit);
                if (v18)
                {
                  OSStatus v7 = v18;
                  uint64_t v8 = -19;
                }
                else
                {
                  OSStatus v19 = AUGraphNodeInfo(*p_testCaseGraph, v49[1], &v42, &outAudioUnit);
                  if (v19)
                  {
                    OSStatus v7 = v19;
                    uint64_t v8 = -20;
                  }
                  else
                  {
                    OSStatus v20 = AUGraphNodeInfo(*p_testCaseGraph, v49[0], &v42, &v52);
                    if (v20)
                    {
                      OSStatus v7 = v20;
                      uint64_t v8 = -21;
                    }
                    else
                    {
                      OSStatus v21 = AUGraphNodeInfo(*p_testCaseGraph, v48, &v41, &v51);
                      if (v21)
                      {
                        OSStatus v7 = v21;
                        uint64_t v8 = -22;
                      }
                      else
                      {
                        int inData = 1;
                        OSStatus v22 = AudioUnitSetProperty(*p_remoteIOUnit, 0x7D3u, 1u, 1u, &inData, 4u);
                        if (v22)
                        {
                          OSStatus v7 = v22;
                          uint64_t v8 = -23;
                        }
                        else
                        {
                          OSStatus v23 = AudioUnitSetProperty(*p_remoteIOUnit, 8u, 1u, 0, &v45, 0x28u);
                          if (v23)
                          {
                            OSStatus v7 = v23;
                            uint64_t v8 = -24;
                          }
                          else
                          {
                            OSStatus v24 = AudioUnitSetProperty(*p_remoteIOUnit, 8u, 2u, 1u, &v45, 0x28u);
                            if (v24)
                            {
                              OSStatus v7 = v24;
                              uint64_t v8 = -25;
                            }
                            else
                            {
                              OSStatus v25 = AudioUnitSetProperty(self->generatorUnit, 0xCEEu, 0, 0, &self->testSignalFile, 8u);
                              if (v25)
                              {
                                OSStatus v7 = v25;
                                uint64_t v8 = -26;
                              }
                              else
                              {
                                OSStatus v26 = AudioUnitSetParameter(outAudioUnit, 0, 0, 0, 2000.0, 0);
                                if (v26)
                                {
                                  OSStatus v7 = v26;
                                  uint64_t v8 = -27;
                                }
                                else
                                {
                                  OSStatus v27 = AudioUnitSetParameter(outAudioUnit, 1u, 0, 0, 4800.0, 0);
                                  if (v27)
                                  {
                                    OSStatus v7 = v27;
                                    uint64_t v8 = -28;
                                  }
                                  else
                                  {
                                    OSStatus v28 = AudioUnitSetParameter(v52, 0, 0, 0, 2000.0, 0);
                                    if (v28)
                                    {
                                      OSStatus v7 = v28;
                                      uint64_t v8 = -29;
                                    }
                                    else
                                    {
                                      OSStatus v29 = AudioUnitSetParameter(v52, 1u, 0, 0, 4800.0, 0);
                                      if (v29)
                                      {
                                        OSStatus v7 = v29;
                                        uint64_t v8 = -30;
                                      }
                                      else
                                      {
                                        OSStatus v30 = AudioUnitSetProperty(v52, 8u, 1u, 0, &v45, 0x28u);
                                        if (v30)
                                        {
                                          OSStatus v7 = v30;
                                          uint64_t v8 = -31;
                                        }
                                        else
                                        {
                                          OSStatus v31 = AudioUnitSetProperty(v52, 8u, 2u, 0, &v45, 0x28u);
                                          if (v31)
                                          {
                                            OSStatus v7 = v31;
                                            uint64_t v8 = -32;
                                          }
                                          else
                                          {
                                            OSStatus v32 = AudioUnitSetParameter(v51, 1u, 1u, 2u, 0.0, 0);
                                            if (v32)
                                            {
                                              OSStatus v7 = v32;
                                              uint64_t v8 = -33;
                                            }
                                            else
                                            {
                                              OSStatus v33 = AUGraphConnectNodeInput(*p_testCaseGraph, outNode[0], 0, v48, 1u);
                                              if (v33)
                                              {
                                                OSStatus v7 = v33;
                                                uint64_t v8 = -34;
                                              }
                                              else
                                              {
                                                OSStatus v34 = AUGraphConnectNodeInput(*p_testCaseGraph, outNode[1], 1u, v49[0], 0);
                                                if (v34)
                                                {
                                                  OSStatus v7 = v34;
                                                  uint64_t v8 = -35;
                                                }
                                                else
                                                {
                                                  OSStatus v35 = AUGraphConnectNodeInput(*p_testCaseGraph, v49[0], 0, v48, 2u);
                                                  if (v35)
                                                  {
                                                    OSStatus v7 = v35;
                                                    uint64_t v8 = -36;
                                                  }
                                                  else
                                                  {
                                                    OSStatus v36 = AUGraphConnectNodeInput(*p_testCaseGraph, v48, 0, outNode[1], 0);
                                                    if (v36)
                                                    {
                                                      OSStatus v7 = v36;
                                                      uint64_t v8 = -37;
                                                    }
                                                    else
                                                    {
                                                      self->recordCallBack.inputProc = (AURenderCallback)sub_100008200;
                                                      self->recordCallBack.inputProcRefCon = self;
                                                      OSStatus v37 = AudioUnitSetProperty(self->remoteIOUnit, 0x7D5u, 0, 1u, &self->recordCallBack, 0x10u);
                                                      if (v37)
                                                      {
                                                        OSStatus v7 = v37;
                                                        uint64_t v8 = -38;
                                                      }
                                                      else
                                                      {
                                                        self->recordBPCallBack.inputProc = (AURenderCallback)sub_100008214;
                                                        self->recordBPCallBack.inputProcRefCon = self;
                                                        OSStatus v38 = AudioUnitAddRenderNotify(v52, (AURenderCallback)sub_100008214, self);
                                                        if (v38)
                                                        {
                                                          OSStatus v7 = v38;
                                                          uint64_t v8 = -39;
                                                        }
                                                        else
                                                        {
                                                          self->playCallBack.inputProc = (AURenderCallback)sub_10000824C;
                                                          self->playCallBack.inputProcRefCon = self;
                                                          OSStatus v39 = AudioUnitAddRenderNotify(self->generatorUnit, (AURenderCallback)sub_10000824C, self);
                                                          if (v39)
                                                          {
                                                            OSStatus v7 = v39;
                                                            uint64_t v8 = -40;
                                                          }
                                                          else
                                                          {
                                                            OSStatus v7 = AUGraphInitialize(*p_testCaseGraph);
                                                            if (!v7) {
                                                              return v7;
                                                            }
                                                            uint64_t v8 = -41;
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  +[LegacyAudioSystemController setCode:v8 forError:a3];
  return v7;
}

- (id)makeSignalsDataObjects
{
  objc_super v3 = +[NSMutableArray array];
  if ([(DAPlayAndRecord *)self sequentialAudioInput])
  {
    v4 = [DASignalData alloc];
    sourceSignal = self->sourceSignal;
    OSStatus v6 = *self->receiveSignals;
    [(DAPlayAndRecord *)self fileTimeInFrames];
    int v8 = v7;
    int64_t v9 = [(DAPlayAndRecord *)self outputID];
    int64_t v10 = [(DAPlayAndRecord *)self inputID];
    OSStatus v11 = [(DAPlayAndRecord *)self fileName];
    LODWORD(v12) = v8;
    OSStatus v13 = [(DASignalData *)v4 initWithSourceSignal:sourceSignal receivedSignal:v6 minimumDelay:1900 maximumDelay:3000 fileTimeInFrames:v9 outputID:v10 inputID:v12 fileName:v11];

    [v3 addObject:v13];
  }
  else
  {
    OSStatus v14 = [(DAPlayAndRecord *)self numInputs];
    int v15 = [v14 intValue];

    if (v15 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        OSStatus v17 = [DASignalData alloc];
        OSStatus v18 = self->sourceSignal;
        OSStatus v19 = self->receiveSignals[v16];
        [(DAPlayAndRecord *)self fileTimeInFrames];
        int v21 = v20;
        int64_t v22 = [(DAPlayAndRecord *)self outputID];
        OSStatus v23 = [(DAPlayAndRecord *)self fileName];
        LODWORD(v24) = v21;
        OSStatus v25 = [(DASignalData *)v17 initWithSourceSignal:v18 receivedSignal:v19 minimumDelay:1900 maximumDelay:3000 fileTimeInFrames:v22 outputID:v16 inputID:v24 fileName:v23];

        [v3 addObject:v25];
        ++v16;
        OSStatus v26 = [(DAPlayAndRecord *)self numInputs];
        LODWORD(v18) = [v26 intValue];
      }
      while (v16 < (int)v18);
    }
  }
  free(self->receiveSignals);

  return v3;
}

- (int)calculateFileDurationForFile:(OpaqueAudioFileID *)a3 error:(id *)a4
{
  uint64_t outPropertyData = 0;
  UInt32 ioDataSize = 8;
  OSStatus Property = AudioFileGetProperty(self->testSignalFile, 0x70636E74u, &ioDataSize, &outPropertyData);
  if (Property)
  {
    +[LegacyAudioSystemController setCode:-10 forError:a4];
  }
  else
  {
    uint64_t v7 = outPropertyData;
    +[DAAudioUnitHelper getBasicStreamDescription];
    *(float *)&double v8 = (float)(v7 * (unint64_t)v10);
    [(DAPlayAndRecord *)self setFileTimeInFrames:v8];
  }
  return Property;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (DAAudioPlayAndRecordDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DAAudioPlayAndRecordDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)fileTimeInFrames
{
  return self->_fileTimeInFrames;
}

- (void)setFileTimeInFrames:(float)a3
{
  self->_fileTimeInFrames = a3;
}

- (unsigned)playFrameCount
{
  return self->_playFrameCount;
}

- (void)setPlayFrameCount:(unsigned int)a3
{
  self->_playFrameCount = a3;
}

- (unsigned)recordFrameCount
{
  return self->_recordFrameCount;
}

- (void)setRecordFrameCount:(unsigned int)a3
{
  self->_recordFrameCount = a3;
}

- (NSNumber)numInputs
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNumInputs:(id)a3
{
}

- (OpaqueExtAudioFile)recordedSoundFile
{
  return self->_recordedSoundFile;
}

- (void)setRecordedSoundFile:(OpaqueExtAudioFile *)a3
{
  self->_recordedSoundFile = a3;
}

- (int64_t)inputID
{
  return self->_inputID;
}

- (void)setInputID:(int64_t)a3
{
  self->_inputID = a3;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (NSNumber)volume
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setVolume:(id)a3
{
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFileName:(id)a3
{
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFileURL:(id)a3
{
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (id)error
{
  return self->_error;
}

- (void)setError:(id *)a3
{
  self->_error = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)volumeNeedsReset
{
  return self->_volumeNeedsReset;
}

- (void)setVolumeNeedsReset:(BOOL)a3
{
  self->_volumeNeedsReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_numInputs, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_results, 0);
}

@end