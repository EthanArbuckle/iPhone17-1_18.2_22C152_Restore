@interface ADSpeechSamplingSendAudioData
- (ADSpeechSamplingSendAudioData)initWithAudioDataFolders:(id)a3 samplingType:(int64_t)a4;
- (NSArray)audioDataFolders;
- (NSString)samplingComponent;
- (OS_dispatch_queue)queue;
- (id)convertToALACWithPath:(id)a3 withSamplingRateOf:(int)a4;
- (id)makeValidWAVFile:(id)a3 withSamplingRateOf:(int)a4;
- (int64_t)samplingType;
- (void)dealloc;
- (void)enqueueAudioDataWithAudioFileName:(id)a3 audioMetadataDict:(id)a4 folderPath:(id)a5;
- (void)sendAudioDataToServer;
- (void)setAudioDataFolders:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingComponent:(id)a3;
- (void)setSamplingType:(int64_t)a3;
@end

@implementation ADSpeechSamplingSendAudioData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingComponent, 0);
  objc_storeStrong((id *)&self->_audioDataFolders, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSamplingComponent:(id)a3
{
}

- (NSString)samplingComponent
{
  return self->_samplingComponent;
}

- (void)setSamplingType:(int64_t)a3
{
  self->_samplingType = a3;
}

- (int64_t)samplingType
{
  return self->_samplingType;
}

- (void)setAudioDataFolders:(id)a3
{
}

- (NSArray)audioDataFolders
{
  return self->_audioDataFolders;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)convertToALACWithPath:(id)a3 withSamplingRateOf:(int)a4
{
  id v6 = a3;
  v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)inPropertyData = 136315650;
    *(void *)&inPropertyData[4] = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
    *(_WORD *)&inPropertyData[12] = 2112;
    *(void *)&inPropertyData[14] = samplingComponent;
    *(_WORD *)&inPropertyData[22] = 2112;
    uint64_t v68 = (uint64_t)v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@ Sampling: convertToALACWithPath: Converted to ALAC at path: %@", inPropertyData, 0x20u);
  }
  v8 = [v6 stringByDeletingPathExtension];
  v9 = [v8 stringByAppendingPathExtension:@"wav"];
  CFURLRef v10 = [v8 stringByAppendingPathExtension:@"caf"];
  uint64_t v69 = 16;
  *(double *)inPropertyData = (float)a4;
  uint64_t v68 = 0x100000002;
  *(_OWORD *)&inPropertyData[8] = xmmword_1003E2A10;
  *(void *)&inStreamDesc.mBitsPerChannel = 0;
  inStreamDesc.mSampleRate = *(double *)inPropertyData;
  *(_OWORD *)&inStreamDesc.mFormatID = xmmword_1003E2A40;
  *(void *)&inStreamDesc.mBytesPerFrame = &_mh_execute_header;
  ExtAudioFileRef inExtAudioFile = 0;
  ExtAudioFileRef outExtAudioFile = 0;
  CFURLRef v11 = +[NSURL fileURLWithPath:v9];
  OSStatus v12 = ExtAudioFileOpenURL(v11, &outExtAudioFile);
  if (v12)
  {
    OSStatus v13 = v12;
    v14 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_samplingComponent;
      *(_DWORD *)buf = 136315906;
      v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
      __int16 v61 = 2112;
      v62 = v15;
      __int16 v63 = 2112;
      CFURLRef v64 = v11;
      __int16 v65 = 1024;
      OSStatus v66 = v13;
      v16 = "%s %@ Sampling: convertToALACWithPath: Couldn't open wav file (r) %@ %i";
      v17 = v14;
      uint32_t v18 = 38;
LABEL_37:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  OSStatus v19 = ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
  if (!v19)
  {
    CFURLRef v24 = +[NSURL fileURLWithPath:v10];
    OSStatus v25 = ExtAudioFileCreateWithURL(v24, 0x63616666u, &inStreamDesc, 0, 1u, &inExtAudioFile);
    if (v25)
    {
      OSStatus v26 = v25;
      v27 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_samplingComponent;
        *(_DWORD *)buf = 136315906;
        v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
        __int16 v61 = 2112;
        v62 = v28;
        __int16 v63 = 2112;
        CFURLRef v64 = v24;
        __int16 v65 = 1024;
        OSStatus v66 = v26;
        v29 = "%s %@ Sampling: convertToALACWithPath: Couldn't open %@ %i";
        v30 = v27;
        uint32_t v31 = 38;
LABEL_50:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
      }
    }
    else
    {
      OSStatus v33 = ExtAudioFileSetProperty(inExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
      if (!v33)
      {
        CFURLRef v52 = v24;
        v53 = self;
        v36 = malloc_type_malloc(0x10000uLL, 0x1000040BDFB0063uLL);
        while (1)
        {
          *(void *)&ioData.mNumberBuffers = 1;
          *(void *)&ioData.mBuffers[0].mNumberChannels = 0x800000000001;
          ioData.mBuffers[0].mData = v36;
          UInt32 ioNumberFrames = 0x4000;
          OSStatus v37 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
          if (v37)
          {
            v38 = AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              v42 = v53->_samplingComponent;
              *(_DWORD *)buf = 136315650;
              v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
              __int16 v61 = 2112;
              v62 = v42;
              __int16 v63 = 1024;
              LODWORD(v64) = v37;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s %@ Sampling: convertToALACWithPath: Couldn't read from input file: %i", buf, 0x1Cu);
            }
          }
          UInt32 v39 = ioNumberFrames;
          OSStatus v40 = ExtAudioFileWrite(inExtAudioFile, ioNumberFrames, &ioData);
          if (v40) {
            break;
          }
          if (v37) {
            BOOL v41 = 1;
          }
          else {
            BOOL v41 = v39 == 0;
          }
          if (v41)
          {
            OSStatus v45 = 0;
            v46 = v53;
            goto LABEL_41;
          }
        }
        v44 = AFSiriLogContextSpeech;
        v46 = v53;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          v50 = v53->_samplingComponent;
          *(_DWORD *)buf = 136315650;
          v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
          __int16 v61 = 2112;
          v62 = v50;
          __int16 v63 = 1024;
          LODWORD(v64) = v40;
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s %@ Sampling: convertToALACWithPath: Failure during write: %i", buf, 0x1Cu);
        }
        OSStatus v45 = v40;
LABEL_41:
        ExtAudioFileDispose(outExtAudioFile);
        ExtAudioFileDispose(inExtAudioFile);
        v47 = AFSiriLogContextSpeech;
        if (v40)
        {
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            v49 = v46->_samplingComponent;
            *(_DWORD *)buf = 136315650;
            v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
            __int16 v61 = 2112;
            v62 = v49;
            __int16 v63 = 1024;
            LODWORD(v64) = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s %@ Sampling: convertToALACWithPath: Failure during write, so returning nil: %i", buf, 0x1Cu);
          }
          CFURLRef v22 = 0;
        }
        else
        {
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
          {
            v51 = v46->_samplingComponent;
            *(_DWORD *)buf = 136315650;
            v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
            __int16 v61 = 2112;
            v62 = v51;
            __int16 v63 = 2112;
            CFURLRef v64 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%s %@ Sampling: ALAC file at path: %@", buf, 0x20u);
          }
          CFURLRef v22 = v10;
        }
        CFURLRef v24 = v52;
        goto LABEL_24;
      }
      OSStatus v34 = v33;
      v35 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_samplingComponent;
        *(_DWORD *)buf = 136315650;
        v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
        __int16 v61 = 2112;
        v62 = v48;
        __int16 v63 = 1024;
        LODWORD(v64) = v34;
        v29 = "%s %@ Sampling: convertToALACWithPath: Couldn't set output's input file format: %i";
        v30 = v35;
        uint32_t v31 = 28;
        goto LABEL_50;
      }
    }
    if (outExtAudioFile) {
      ExtAudioFileDispose(outExtAudioFile);
    }
    if (inExtAudioFile) {
      ExtAudioFileDispose(inExtAudioFile);
    }
    CFURLRef v22 = 0;
LABEL_24:

    goto LABEL_11;
  }
  OSStatus v20 = v19;
  v21 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    v43 = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
    __int16 v61 = 2112;
    v62 = v43;
    __int16 v63 = 1024;
    LODWORD(v64) = v20;
    v16 = "%s %@ Sampling: convertToALACWithPath: Couldn't set input file format: %i";
    v17 = v21;
    uint32_t v18 = 28;
    goto LABEL_37;
  }
LABEL_8:
  if (outExtAudioFile) {
    ExtAudioFileDispose(outExtAudioFile);
  }
  CFURLRef v22 = 0;
LABEL_11:

  return v22;
}

- (id)makeValidWAVFile:(id)a3 withSamplingRateOf:(int)a4
{
  id v6 = a3;
  int v34 = a4;
  v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    v36 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
    __int16 v37 = 2112;
    v38 = samplingComponent;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@ Sampling: makeValidWAVFile: Adding wav headers to file at path: %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = [v6 stringByDeletingPathExtension];
  v9 = [v8 stringByAppendingPathExtension:@"wav"];
  CFURLRef v10 = +[NSMutableData dataWithContentsOfFile:v6];
  __int16 v33 = 1;
  __int16 v32 = 16;
  int v31 = 2 * a4;
  __int16 v30 = 2;
  int v28 = 16;
  int v29 = (int)(16 * [v10 length]) >> 3;
  int __ptr = v29 + 46;
  __int16 v26 = 1;
  *__error() = 0;
  id v11 = v9;
  OSStatus v12 = fopen((const char *)[v11 cStringUsingEncoding:1], "w");
  if (v12)
  {
    OSStatus v13 = v12;
    fwrite("RIFF", 1uLL, 4uLL, v12);
    fwrite(&__ptr, 4uLL, 1uLL, v13);
    fwrite("WAVE", 1uLL, 4uLL, v13);
    fwrite("fmt ", 1uLL, 4uLL, v13);
    fwrite(&v28, 4uLL, 1uLL, v13);
    fwrite(&v26, 2uLL, 1uLL, v13);
    fwrite(&v33, 2uLL, 1uLL, v13);
    fwrite(&v34, 4uLL, 1uLL, v13);
    fwrite(&v31, 4uLL, 1uLL, v13);
    fwrite(&v30, 2uLL, 1uLL, v13);
    fwrite(&v32, 2uLL, 1uLL, v13);
    fwrite("data", 1uLL, 4uLL, v13);
    fwrite(&v29, 4uLL, 1uLL, v13);
    fclose(v13);
    v14 = +[NSFileHandle fileHandleForUpdatingAtPath:v11];
    [v14 seekToEndOfFile];
    [v14 writeData:v10];
    [v14 closeFile];
    v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      OSStatus v20 = self->_samplingComponent;
      *(_DWORD *)buf = 136315650;
      v36 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
      __int16 v37 = 2112;
      v38 = v20;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s %@ Sampling: makeValidWAVFile: WAV file at path: %@", buf, 0x20u);
    }
    id v16 = v11;
  }
  else
  {
    v17 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_samplingComponent;
      CFURLRef v22 = v17;
      int v23 = *__error();
      CFURLRef v24 = __error();
      OSStatus v25 = +[NSString stringWithUTF8String:strerror(*v24)];
      *(_DWORD *)buf = 136316162;
      v36 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
      __int16 v37 = 2112;
      v38 = v21;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 1024;
      int v42 = v23;
      __int16 v43 = 2112;
      v44 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s %@ Sampling: makeValidWAVFile: Error opening wav file for writing: %@, errno: %d, errorString: %@", buf, 0x30u);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)enqueueAudioDataWithAudioFileName:(id)a3 audioMetadataDict:(id)a4 folderPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    v56 = "-[ADSpeechSamplingSendAudioData enqueueAudioDataWithAudioFileName:audioMetadataDict:folderPath:]";
    __int16 v57 = 2112;
    v58 = samplingComponent;
    __int16 v59 = 2112;
    id v60 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ Sampling: enqueueAudioDataWithAudioFileName: %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = objc_alloc_init((Class)DUSchemaSpeechAudioRecord);
  OSStatus v13 = [v9 valueForKey:@"codec"];
  [v12 setCodec:v13];

  v14 = [v10 stringByAppendingPathComponent:v8];
  v47 = [v9 valueForKey:@"language"];
  id v15 = v14;
  id v16 = [v9 objectForKey:@"samplingRate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v17 = 0;
    goto LABEL_10;
  }
  id v17 = v16;

  if (!v17)
  {
LABEL_10:
    uint64_t v19 = 16000;
    goto LABEL_11;
  }
  id v18 = +[NSNull null];

  uint64_t v19 = 16000;
  if (v17 != v18)
  {
    if ([v17 intValue] == 8000) {
      uint64_t v19 = 8000;
    }
    else {
      uint64_t v19 = 16000;
    }
  }
LABEL_11:
  OSStatus v20 = [(ADSpeechSamplingSendAudioData *)self makeValidWAVFile:v15 withSamplingRateOf:v19];
  if (v20)
  {
    v46 = v8;
    v21 = [(ADSpeechSamplingSendAudioData *)self convertToALACWithPath:v20 withSamplingRateOf:v19];

    id v22 = +[AFAssistantSamplingUtilities deleteItemAtFilePath:v20];
    if (v19 == 16000) {
      CFStringRef v23 = @"MHASRAUDIOCODEC_ALAC_MONO_16000HZ_VALUE";
    }
    else {
      CFStringRef v23 = @"MHASRAUDIOCODEC_ALAC_MONO_8000HZ_VALUE";
    }
    [v12 setCodec:v23];
    OSStatus v25 = [v12 codec];

    if (v25)
    {
      if (v21)
      {
        [v12 setLanguage:v47];
        id v26 = objc_alloc((Class)NSUUID);
        v27 = [v9 valueForKey:@"asrSelfComponentIdentifier"];
        id v45 = [v26 initWithUUIDString:v27];

        id v28 = objc_alloc((Class)NSUUID);
        int v29 = [v9 valueForKey:@"interactionIdentifier"];
        id v44 = [v28 initWithUUIDString:v29];

        id v30 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v44];
        [v12 setInteractionId:v30];

        int v31 = +[ADAccount activeAccount];
        __int16 v32 = [v31 speechIdentifier];
        [v12 setSpeechIdString:v32];

        __int16 v33 = [v9 valueForKey:@"samplingTimestamp"];
        uint64_t v34 = 1000 * (void)[v33 longLongValue];

        [v12 setAudioCreatedTimestampMs:v34];
        v35 = +[AssistantSiriAnalytics sharedStream];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10025C238;
        v48[3] = &unk_100508210;
        v48[4] = self;
        id v49 = v15;
        id v50 = v45;
        id v51 = v21;
        id v52 = v12;
        id v53 = v46;
        id v54 = v10;
        id v36 = v21;
        id v37 = v45;
        [v35 enqueueLargeMessageObjectFromPath:v36 assetIdentifier:v44 messageMetadata:v52 completion:v48];

        id v8 = v46;
      }
      else
      {
        __int16 v39 = AFSiriLogContextSpeech;
        id v8 = v46;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          __int16 v43 = self->_samplingComponent;
          *(_DWORD *)buf = 136315394;
          v56 = "-[ADSpeechSamplingSendAudioData enqueueAudioDataWithAudioFileName:audioMetadataDict:folderPath:]";
          __int16 v57 = 2112;
          v58 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Failed while converting audio", buf, 0x16u);
        }
      }
    }
    else
    {
      v38 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        int v42 = self->_samplingComponent;
        *(_DWORD *)buf = 136315394;
        v56 = "-[ADSpeechSamplingSendAudioData enqueueAudioDataWithAudioFileName:audioMetadataDict:folderPath:]";
        __int16 v57 = 2112;
        v58 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s %@ Sampling: No Codec info available.", buf, 0x16u);
      }

      id v8 = v46;
    }
  }
  else
  {
    CFURLRef v24 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = self->_samplingComponent;
      *(_DWORD *)buf = 136315394;
      v56 = "-[ADSpeechSamplingSendAudioData enqueueAudioDataWithAudioFileName:audioMetadataDict:folderPath:]";
      __int16 v57 = 2112;
      v58 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Could not create WAV file.", buf, 0x16u);
    }
  }
}

- (void)sendAudioDataToServer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025CC3C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    v7 = "-[ADSpeechSamplingSendAudioData dealloc]";
    __int16 v8 = 2112;
    id v9 = samplingComponent;
    __int16 v10 = 2048;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@ Sampling: dealloc - done with %p", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)ADSpeechSamplingSendAudioData;
  [(ADSpeechSamplingSendAudioData *)&v5 dealloc];
}

- (ADSpeechSamplingSendAudioData)initWithAudioDataFolders:(id)a3 samplingType:(int64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    v16.receiver = self;
    v16.super_class = (Class)ADSpeechSamplingSendAudioData;
    __int16 v8 = [(ADSpeechSamplingSendAudioData *)&v16 init];
    if (v8)
    {
      id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.siri.speech.sampling.upload", v9);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;

      v8->_samplingType = a4;
      uint64_t v12 = sub_10025D15C(a4);
      samplingComponent = v8->_samplingComponent;
      v8->_samplingComponent = (NSString *)v12;

      objc_storeStrong((id *)&v8->_audioDataFolders, a3);
    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end