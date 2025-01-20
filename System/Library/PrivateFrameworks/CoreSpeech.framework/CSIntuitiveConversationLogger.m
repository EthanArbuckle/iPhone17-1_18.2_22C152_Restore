@interface CSIntuitiveConversationLogger
- (BOOL)didStop;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAudioFileWriter)audioFileWriter;
- (CSAudioRecordContext)audioRecordContext;
- (CSIntuitiveConversationLogger)init;
- (CSIntuitiveConversationLogger)initWithAttSiriController:(id)a3;
- (NSArray)requiredNodes;
- (NSString)logDirectory;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)startTimestampString;
- (NSString)stopTimestampString;
- (OS_dispatch_queue)queue;
- (id)_createJsonLogPathBySignalType:(id)a3;
- (id)_timeStampString;
- (unint64_t)previousLoggedSampleCount;
- (unint64_t)startMachAbsTime;
- (unint64_t)startSampleCount;
- (unint64_t)stopMachAbsTime;
- (unint64_t)stopSampleCount;
- (unint64_t)type;
- (void)_handleStopLogging;
- (void)_logAudioMetaData:(id)a3;
- (void)_logMetadata;
- (void)_setupLogDirectory;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)setAttSiriController:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setDidStop:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLogDirectory:(id)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPreviousLoggedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartMachAbsTime:(unint64_t)a3;
- (void)setStartSampleCount:(unint64_t)a3;
- (void)setStartTimestampString:(id)a3;
- (void)setStopMachAbsTime:(unint64_t)a3;
- (void)setStopSampleCount:(unint64_t)a3;
- (void)setStopTimestampString:(id)a3;
- (void)start;
- (void)startLoggingWithAudioRecordContext:(id)a3 requestId:(id)a4;
- (void)stop;
@end

@implementation CSIntuitiveConversationLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTimestampString, 0);
  objc_storeStrong((id *)&self->_startTimestampString, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_logDirectory, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->requiredNodes, 0);
  objc_storeStrong((id *)&self->prefetchedAsset, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setStopMachAbsTime:(unint64_t)a3
{
  self->_stopMachAbsTime = a3;
}

- (unint64_t)stopMachAbsTime
{
  return self->_stopMachAbsTime;
}

- (void)setStartMachAbsTime:(unint64_t)a3
{
  self->_startMachAbsTime = a3;
}

- (unint64_t)startMachAbsTime
{
  return self->_startMachAbsTime;
}

- (void)setStopSampleCount:(unint64_t)a3
{
  self->_stopSampleCount = a3;
}

- (unint64_t)stopSampleCount
{
  return self->_stopSampleCount;
}

- (void)setStartSampleCount:(unint64_t)a3
{
  self->_startSampleCount = a3;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (void)setStopTimestampString:(id)a3
{
}

- (NSString)stopTimestampString
{
  return self->_stopTimestampString;
}

- (void)setStartTimestampString:(id)a3
{
}

- (NSString)startTimestampString
{
  return self->_startTimestampString;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setDidStop:(BOOL)a3
{
  self->_didStop = a3;
}

- (BOOL)didStop
{
  return self->_didStop;
}

- (void)setLogDirectory:(id)a3
{
}

- (NSString)logDirectory
{
  return self->_logDirectory;
}

- (void)setPreviousLoggedSampleCount:(unint64_t)a3
{
  self->_previousLoggedSampleCount = a3;
}

- (unint64_t)previousLoggedSampleCount
{
  return self->_previousLoggedSampleCount;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setIsReady:(BOOL)a3
{
  self->isReady = a3;
}

- (BOOL)isReady
{
  return self->isReady;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (unint64_t)type
{
  return self->type;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->requiredNodes;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->prefetchedAsset;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100168194;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168214;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_logMetadata
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    audioRecordContext = self->_audioRecordContext;
    *(_DWORD *)buf = 136315394;
    v32 = "-[CSIntuitiveConversationLogger _logMetadata]";
    __int16 v33 = 2112;
    v34 = audioRecordContext;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s _audioRecordContext:%@", buf, 0x16u);
  }
  id v5 = self->_audioRecordContext;
  if (v5) {
    id v6 = [(CSAudioRecordContext *)v5 type];
  }
  else {
    id v6 = 0;
  }
  id v7 = [(CSIntuitiveConversationLogger *)self _createJsonLogPathBySignalType:@"metadata"];
  v29[0] = @"audioRecordType";
  v8 = +[CSAudioRecordContext recordTypeString:v6];
  startTimestampString = self->_startTimestampString;
  stopTimestampString = self->_stopTimestampString;
  v30[0] = v8;
  v30[1] = startTimestampString;
  v29[1] = @"startTimestamp";
  v29[2] = @"stopTimestamp";
  v30[2] = stopTimestampString;
  v29[3] = @"startMachAbsTime";
  v11 = +[NSNumber numberWithUnsignedLongLong:self->_startMachAbsTime];
  v30[3] = v11;
  v29[4] = @"stopMachAbsTime";
  v12 = +[NSNumber numberWithUnsignedLongLong:self->_stopMachAbsTime];
  v30[4] = v12;
  v29[5] = @"startSampleCount";
  v13 = +[NSNumber numberWithUnsignedLongLong:self->_startSampleCount];
  v30[5] = v13;
  v29[6] = @"stopSampleCount";
  v14 = +[NSNumber numberWithUnsignedLongLong:self->_stopSampleCount];
  v30[6] = v14;
  v29[7] = @"productType";
  v15 = +[CSUtils deviceProductType];
  v30[7] = v15;
  v29[8] = @"productVersion";
  v16 = +[CSUtils deviceProductVersion];
  v30[8] = v16;
  v29[9] = @"buildVersion";
  v17 = +[CSUtils deviceBuildVersion];
  requestId = self->_requestId;
  v30[9] = v17;
  v30[10] = requestId;
  v29[10] = @"requestId";
  v29[11] = @"mhUUID";
  CFStringRef mhId = @"Nil";
  if (self->_mhId) {
    CFStringRef mhId = (const __CFString *)self->_mhId;
  }
  v30[11] = mhId;
  v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:12];

  id v28 = 0;
  v21 = +[NSJSONSerialization dataWithJSONObject:v20 options:1 error:&v28];
  id v22 = v28;
  id v23 = v22;
  if (!v21 || v22)
  {
    v24 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      v26 = [v23 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSIntuitiveConversationLogger _logMetadata]";
      __int16 v33 = 2114;
      v34 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Failed to serialize metadata data with err: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v27 = 0;
    [v21 writeToFile:v7 options:0 error:&v27];
    id v23 = v27;
  }
}

- (id)_timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

- (void)_logAudioMetaData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_previousLoggedSampleCount)
  {
    id v6 = [v4 startSampleCount];
    self->_startSampleCount = (unint64_t)v6;
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[CSIntuitiveConversationLogger _logAudioMetaData:]";
      __int16 v11 = 2050;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s audio logging start sample count %{public}llu", (uint8_t *)&v9, 0x16u);
    }
  }
  id v8 = [v5 startSampleCount];
  self->_previousLoggedSampleCount = (unint64_t)v8 + (void)[v5 numSamples];
}

- (void)_handleStopLogging
{
  self->_unint64_t stopSampleCount = self->_previousLoggedSampleCount;
  v3 = [(CSIntuitiveConversationLogger *)self _timeStampString];
  stopTimestampString = self->_stopTimestampString;
  self->_stopTimestampString = v3;

  self->_stopMachAbsTime = mach_absolute_time();
  [(CSIntuitiveConversationLogger *)self _logMetadata];
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    unint64_t stopSampleCount = self->_stopSampleCount;
    int v8 = 136315650;
    int v9 = "-[CSIntuitiveConversationLogger _handleStopLogging]";
    __int16 v10 = 2112;
    __int16 v11 = requestId;
    __int16 v12 = 2050;
    unint64_t v13 = stopSampleCount;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Using RequestId %@ for logging. end sample count %{public}llu", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_createJsonLogPathBySignalType:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"%@-%@.json", self->_requestId, a3];
  id v5 = [(NSString *)self->_logDirectory stringByAppendingPathComponent:v4];

  return v5;
}

- (void)_setupLogDirectory
{
  v3 = +[NSFileManager defaultManager];
  id v4 = +[CSFPreferences sharedPreferences];
  id v5 = [v4 mhLogDirectory];
  logDirectory = self->_logDirectory;
  self->_logDirectory = v5;

  if ([v3 fileExistsAtPath:self->_logDirectory])
  {
    id v7 = 0;
  }
  else
  {
    int v8 = self->_logDirectory;
    id v17 = 0;
    unsigned __int8 v9 = [v3 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v7 = v17;
    if ((v9 & 1) == 0)
    {
      __int16 v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v14 = self->_logDirectory;
        v15 = v10;
        v16 = [v7 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v19 = "-[CSIntuitiveConversationLogger _setupLogDirectory]";
        __int16 v20 = 2114;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Couldn't create logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      __int16 v11 = self->_logDirectory;
      self->_logDirectory = (NSString *)@"/tmp";
    }
  }
  __int16 v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = self->_logDirectory;
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSIntuitiveConversationLogger _setupLogDirectory]";
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s _logDirectory:%@", buf, 0x16u);
  }
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100168B98;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startLoggingWithAudioRecordContext:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168D24;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168EE0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
}

- (CSIntuitiveConversationLogger)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSIntuitiveConversationLogger *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSIntuitiveConversationLogger)init
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[CSIntuitiveConversationLogger init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)CSIntuitiveConversationLogger;
  id v4 = [(CSIntuitiveConversationLogger *)&v8 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("CSIntuitiveConversationLogger queue", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_didStop = 1;
    [(CSIntuitiveConversationLogger *)v4 _setupLogDirectory];
  }
  return v4;
}

@end