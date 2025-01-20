@interface ADSpeechSamplingDictationAudioDataHandler
- (ADDictationSessionTracker)sessionTracker;
- (ADSpeechSamplingDictationAudioDataHandler)initWithAudioDataFolders:(id)a3;
- (AFDictationOptions)dictationOptions;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adWaitingForAudioFile;
- (BOOL)shouldStopAddingSamples;
- (NSDictionary)audioMetadataDict;
- (NSMutableArray)audioDataFolders;
- (NSString)audioFilePath;
- (NSString)folderPath;
- (OS_dispatch_queue)queue;
- (int64_t)maxChunkSize;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)addAudioSamplesOnQueue:(id)a3;
- (void)dealloc;
- (void)sendAudioDataToServer;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)setAudioDataFolders:(id)a3;
- (void)setAudioFilePath:(id)a3;
- (void)setAudioMetadataDict:(id)a3;
- (void)setDictationOptions:(id)a3;
- (void)setFolderPath:(id)a3;
- (void)setMaxChunkSize:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSessionTracker:(id)a3;
- (void)setShouldStopAddingSamples:(BOOL)a3;
@end

@implementation ADSpeechSamplingDictationAudioDataHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dictationOptions, 0);
  objc_storeStrong((id *)&self->_sessionTracker, 0);
  objc_storeStrong((id *)&self->_audioMetadataDict, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);
  objc_storeStrong((id *)&self->_folderPath, 0);
  objc_storeStrong((id *)&self->_audioDataFolders, 0);
}

- (void)setMaxChunkSize:(int64_t)a3
{
  self->_maxChunkSize = a3;
}

- (int64_t)maxChunkSize
{
  return self->_maxChunkSize;
}

- (void)setShouldStopAddingSamples:(BOOL)a3
{
  self->_shouldStopAddingSamples = a3;
}

- (BOOL)shouldStopAddingSamples
{
  return self->_shouldStopAddingSamples;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDictationOptions:(id)a3
{
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setSessionTracker:(id)a3
{
}

- (ADDictationSessionTracker)sessionTracker
{
  return self->_sessionTracker;
}

- (void)setAudioMetadataDict:(id)a3
{
}

- (NSDictionary)audioMetadataDict
{
  return self->_audioMetadataDict;
}

- (void)setAudioFilePath:(id)a3
{
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (void)setFolderPath:(id)a3
{
}

- (NSString)folderPath
{
  return self->_folderPath;
}

- (void)setAudioDataFolders:(id)a3
{
}

- (NSMutableArray)audioDataFolders
{
  return self->_audioDataFolders;
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (BOOL)adWaitingForAudioFile
{
  return 0;
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10025D648;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E0B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E2AC;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)addAudioSamplesOnQueue:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  int64_t v6 = 0;
  *(void *)&long long v7 = 136315906;
  long long v22 = v7;
  while (1)
  {
    v8 = v5;
    id v25 = 0;
    id v5 = objc_msgSend(v4, "readDataUpToLength:error:", 0x8000, &v25, v22);
    id v9 = v25;

    if (!v5 || v9) {
      break;
    }
    if (![v5 length]) {
      goto LABEL_13;
    }
    id v10 = AFSiriLogContextSpeech;
    if (self->_shouldStopAddingSamples)
    {
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
        __int16 v28 = 2048;
        int64_t v29 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Stopping adding audio samples after adding %ld bytes since _shouldStopAddingSamples was set", buf, 0x16u);
      }
      id v9 = 0;
LABEL_19:
      [v4 closeFile];
      v18 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed reading audio file and adding audio samples.", buf, 0xCu);
      }
      v19 = +[ADCommandCenter sharedCommandCenter];
      [v19 cancelSpeechForDelegate:self];

      goto LABEL_22;
    }
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v10;
      id v13 = [v5 length];
      int64_t maxChunkSize = self->_maxChunkSize;
      *(_DWORD *)buf = v22;
      v27 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
      __int16 v28 = 2048;
      int64_t v29 = (int64_t)v13;
      __int16 v30 = 2048;
      uint64_t v31 = 0x8000;
      __int16 v32 = 2048;
      int64_t v33 = maxChunkSize;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Dictation Sampling: Sending audio data of size: %ld, chunkSize: %ld, maxChunkSize: %ld", buf, 0x2Au);
    }
    v11 = +[ADCommandCenter sharedCommandCenter];
    [v11 addRecordedSpeechSampleData:v5 delegate:self];

    v6 += (int64_t)[v5 length];
    if (v6 >= self->_maxChunkSize)
    {
      dispatch_time_t v20 = dispatch_time(0, 5000000000);
      v21 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10025E7EC;
      block[3] = &unk_10050E160;
      block[4] = self;
      id v24 = v4;
      dispatch_after(v20, v21, block);

      goto LABEL_22;
    }
  }
  if (v9)
  {
    v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
      __int16 v28 = 2112;
      int64_t v29 = (int64_t)v9;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Error while reading file - %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_13:
  [v4 closeFile];
  v16 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADSpeechSamplingDictationAudioDataHandler addAudioSamplesOnQueue:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Done reading audio file and adding audio samples.", buf, 0xCu);
  }
  v17 = +[ADCommandCenter sharedCommandCenter];
  [v17 stopSpeechWithOptions:0 forDelegate:self];

LABEL_22:
}

- (void)sendAudioDataToServer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025E86C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int64_t v6 = "-[ADSpeechSamplingDictationAudioDataHandler dealloc]";
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Dictation Sampling: dealloc - done with %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADSpeechSamplingDictationAudioDataHandler;
  [(ADSpeechSamplingDictationAudioDataHandler *)&v4 dealloc];
}

- (ADSpeechSamplingDictationAudioDataHandler)initWithAudioDataFolders:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_22;
  }
  v46.receiver = self;
  v46.super_class = (Class)ADSpeechSamplingDictationAudioDataHandler;
  self = [(ADSpeechSamplingDictationAudioDataHandler *)&v46 init];
  if (self)
  {
    id v41 = v4;
    id v5 = (NSMutableArray *)[v4 mutableCopy];
    audioDataFolders = self->_audioDataFolders;
    self->_audioDataFolders = v5;

    __int16 v7 = [(NSMutableArray *)self->_audioDataFolders objectAtIndex:0];
    folderPath = self->_folderPath;
    self->_folderPath = v7;

    id v9 = +[NSFileManager defaultManager];
    id v10 = self;
    v11 = [v9 contentsOfDirectoryAtPath:self->_folderPath error:0];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v13)
    {
      id v14 = v13;
      v15 = 0;
      uint64_t v16 = *(void *)v43;
      do
      {
        v17 = v12;
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v17);
          }
          v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          dispatch_time_t v20 = [v19 pathExtension];
          unsigned int v21 = [v20 isEqual:@"pcm"];

          if (v21)
          {
            long long v22 = [(NSString *)v10->_folderPath stringByAppendingPathComponent:v19];
            if (+[AFSamplingUtilities isFileOlderThanAgeInSeconds:v22 filePath:@"Dictation" samplingComponent:900.0])
            {
              id v23 = v19;

              v15 = v23;
            }
          }
        }
        id v12 = v17;
        id v14 = [v17 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    self = v10;
    uint64_t v24 = [(NSString *)v10->_folderPath stringByAppendingPathComponent:v15];
    audioFilePath = v10->_audioFilePath;
    v10->_audioFilePath = (NSString *)v24;

    v26 = [v15 lastPathComponent];
    v27 = [v26 stringByDeletingPathExtension];

    uint64_t v28 = sub_10025CF90(v10->_folderPath, (uint64_t)v27, 0);
    audioMetadataDict = v10->_audioMetadataDict;
    v10->_audioMetadataDict = (NSDictionary *)v28;

    if (v10->_audioMetadataDict)
    {
      __int16 v30 = objc_alloc_init(ADDictationSessionTracker);
      sessionTracker = v10->_sessionTracker;
      v10->_sessionTracker = v30;

      __int16 v32 = (AFDictationOptions *)objc_alloc_init((Class)AFDictationOptions);
      dictationOptions = v10->_dictationOptions;
      v10->_dictationOptions = v32;

      v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v35 = dispatch_queue_create("com.apple.siri.speech.sampling.upload", v34);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v35;

      id v4 = v41;
      goto LABEL_18;
    }
    v38 = AFSiriLogContextSpeech;
    id v4 = v41;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v40 = v10->_folderPath;
      *(_DWORD *)buf = 136315650;
      v48 = "-[ADSpeechSamplingDictationAudioDataHandler initWithAudioDataFolders:]";
      __int16 v49 = 2112;
      v50 = v40;
      __int16 v51 = 2112;
      v52 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Audio metadata dict is nil for %@ - %@", buf, 0x20u);
    }

LABEL_22:
    v37 = 0;
    goto LABEL_23;
  }
LABEL_18:
  self = self;
  v37 = self;
LABEL_23:

  return v37;
}

@end