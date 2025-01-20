@interface CSVoiceTriggerFileLogger
- (BOOL)_shouldLogDeviceId:(id)a3;
- (BOOL)_shouldSkipLogging:(id)a3;
- (BOOL)fileLoggingEnabled;
- (BOOL)geckoLoggingEnabled;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerFileLogger)init;
- (CSVoiceTriggerFileLogger)initWithSpeechManager:(id)a3 fileLoggingEnabled:(BOOL)a4 geckoLoggingEnabled:(BOOL)a5;
- (OS_dispatch_queue)queue;
- (id)_audioLogDirectory;
- (id)_geckoLogDirectory;
- (id)_metaFilenameWithRootDir:(id)a3 prefix:(id)a4 deviceId:(id)a5;
- (id)_timeStampString;
- (void)_clearOldGeckoLoggingFiles;
- (void)_clearOldLoggingFiles;
- (void)_logGeckoWithFilePrefix:(id)a3 WithResult:(id)a4;
- (void)_logSelfTriggerAudioWithPrefix:(id)a3 result:(id)a4;
- (void)_logVTResult:(id)a3 metaFilePath:(id)a4 audioFilePath:(id)a5 completion:(id)a6;
- (void)_notifyFalseRejectFeedbackBanner:(id)a3;
- (void)_writeDictionary:(id)a3 toPath:(id)a4;
- (void)selfTriggerDetector:(id)a3 didDetectNearMiss:(id)a4;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setFileLoggingEnabled:(BOOL)a3;
- (void)setGeckoLoggingEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectSpeakerReject:(id)a3;
@end

@implementation CSVoiceTriggerFileLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setGeckoLoggingEnabled:(BOOL)a3
{
  self->_geckoLoggingEnabled = a3;
}

- (BOOL)geckoLoggingEnabled
{
  return self->_geckoLoggingEnabled;
}

- (void)setFileLoggingEnabled:(BOOL)a3
{
  self->_fileLoggingEnabled = a3;
}

- (BOOL)fileLoggingEnabled
{
  return self->_fileLoggingEnabled;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_notifyFalseRejectFeedbackBanner:(id)a3
{
  uint64_t v3 = kVTEItriggerScore;
  id v4 = a3;
  id v11 = [v4 objectForKey:v3];
  v5 = [v4 objectForKey:kVTEITriggeredPhId];

  if (v11) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [v11 floatValue];
    int v8 = v7;
    id v9 = [v5 unsignedIntValue];
    LODWORD(v10) = v8;
    +[CSSiriDebugConnection launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:v9 withTriggeredPhraseId:v10];
  }
}

- (void)_clearOldGeckoLoggingFiles
{
  id v4 = +[CSFPreferences sharedPreferences];
  v2 = [v4 geckoAudioLogDirectory];
  uint64_t v3 = +[NSURL URLWithString:v2];
  +[CSConfig daysBeforeRemovingLogFiles];
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v3, @".*");
}

- (void)_clearOldLoggingFiles
{
  v2 = +[CSFPreferences sharedPreferences];
  +[CSAudioFileManager pruneNumberOfLogFilesTo:](CSAudioFileManager, "pruneNumberOfLogFilesTo:", [v2 maxNumLoggingFiles]);

  +[CSConfig daysBeforeRemovingLogFiles];
  +[CSAudioFileManager removeLogFilesOlderThanNDays:](CSAudioFileManager, "removeLogFilesOlderThanNDays:");
  +[CSConfig daysBeforeRemovingLogFiles];
  +[CSAudioFileManager removeRemoteP2PLogFilesOlderThanNDays:](CSAudioFileManager, "removeRemoteP2PLogFilesOlderThanNDays:");
}

- (void)_logSelfTriggerAudioWithPrefix:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CSVoiceTriggerFileLogger *)self _shouldSkipLogging:v7])
  {
    int v8 = [(CSVoiceTriggerFileLogger *)self _audioLogDirectory];
    id v9 = [(CSVoiceTriggerFileLogger *)self _metaFilenameWithRootDir:v8 prefix:v6 deviceId:0];

    double v10 = [v9 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
    id v11 = [v7 objectForKeyedSubscript:kVTEIAudioProviderUUID];
    id v12 = [v7 mutableCopy];
    [v12 setObject:v10 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014EC40;
    block[3] = &unk_100252BE8;
    id v19 = v13;
    v20 = self;
    id v21 = v11;
    id v22 = v10;
    id v23 = v9;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v7 = v13;
    dispatch_async(queue, block);
    [(CSVoiceTriggerFileLogger *)self _clearOldLoggingFiles];
  }
}

- (void)selfTriggerDetector:(id)a3 didDetectNearMiss:(id)a4
{
  id v7 = a4;
  if ([(CSVoiceTriggerFileLogger *)self fileLoggingEnabled]
    || (+[CSFPreferences sharedPreferences],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isSelfTriggerNearMissAudioLoggingEnabled],
        v5,
        v6))
  {
    [(CSVoiceTriggerFileLogger *)self _logSelfTriggerAudioWithPrefix:@"-selfTriggerNearMiss" result:v7];
  }
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5 = a4;
  if ([(CSVoiceTriggerFileLogger *)self fileLoggingEnabled]) {
    [(CSVoiceTriggerFileLogger *)self _logSelfTriggerAudioWithPrefix:@"-selfTrigger" result:v5];
  }
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  id v10 = a3;
  -[CSVoiceTriggerFileLogger _notifyFalseRejectFeedbackBanner:](self, "_notifyFalseRejectFeedbackBanner:");
  if ([(CSVoiceTriggerFileLogger *)self fileLoggingEnabled])
  {
    if ([(CSVoiceTriggerFileLogger *)self _shouldSkipLogging:v10]) {
      goto LABEL_6;
    }
    id v4 = [(CSVoiceTriggerFileLogger *)self _audioLogDirectory];
    id v5 = [(CSVoiceTriggerFileLogger *)self _metaFilenameWithRootDir:v4 prefix:@"-rejected" deviceId:0];

    unsigned int v6 = [v5 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
    id v7 = [v10 mutableCopy];
    [v7 setObject:v6 forKey:kVTEICaptureFilePath];
    id v8 = v7;

    [(CSVoiceTriggerFileLogger *)self _logVTResult:v8 metaFilePath:v5 audioFilePath:v6 completion:&stru_100252BC0];
    [(CSVoiceTriggerFileLogger *)self _clearOldLoggingFiles];

    id v9 = v8;
  }
  else
  {
    id v9 = v10;
  }
  id v10 = v9;
  [(CSVoiceTriggerFileLogger *)self _logGeckoWithFilePrefix:@"-rejected" WithResult:v9];
LABEL_6:
}

- (void)_logGeckoWithFilePrefix:(id)a3 WithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (((CSIsIOS() & 1) != 0 || CSIsHorseman())
    && [(CSVoiceTriggerFileLogger *)self geckoLoggingEnabled]
    && ![(CSVoiceTriggerFileLogger *)self _shouldSkipLogging:v7])
  {
    id v8 = [(CSVoiceTriggerFileLogger *)self _geckoLogDirectory];
    if (v8)
    {
      id v9 = [(CSVoiceTriggerFileLogger *)self _metaFilenameWithRootDir:v8 prefix:v6 deviceId:0];
      id v10 = [v9 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
      id v11 = [v7 mutableCopy];
      [v11 setObject:v10 forKey:kVTEICaptureFilePath];
      id v12 = v11;

      [(CSVoiceTriggerFileLogger *)self _logVTResult:v12 metaFilePath:v9 audioFilePath:v10 completion:&stru_100252BA0];
      [(CSVoiceTriggerFileLogger *)self _clearOldGeckoLoggingFiles];

      id v7 = v12;
    }
    else
    {
      id v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        id v15 = "-[CSVoiceTriggerFileLogger _logGeckoWithFilePrefix:WithResult:]";
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Failed to get Gecko log directory", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [(CSVoiceTriggerFileLogger *)self _notifyFalseRejectFeedbackBanner:v15];
  if ([(CSVoiceTriggerFileLogger *)self fileLoggingEnabled])
  {
    if ([(CSVoiceTriggerFileLogger *)self _shouldSkipLogging:v15]) {
      goto LABEL_9;
    }
    unsigned int v7 = [(CSVoiceTriggerFileLogger *)self _shouldLogDeviceId:v15];
    id v8 = [(CSVoiceTriggerFileLogger *)self _audioLogDirectory];
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    id v10 = [(CSVoiceTriggerFileLogger *)self _metaFilenameWithRootDir:v8 prefix:@"-almost" deviceId:v9];

    id v11 = [v10 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
    id v12 = [v15 mutableCopy];
    [v12 setObject:v11 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    [(CSVoiceTriggerFileLogger *)self _logVTResult:v13 metaFilePath:v10 audioFilePath:v11 completion:&stru_100252B80];
    [(CSVoiceTriggerFileLogger *)self _clearOldLoggingFiles];

    id v14 = v13;
  }
  else
  {
    id v14 = v15;
  }
  id v15 = v14;
  [(CSVoiceTriggerFileLogger *)self _logGeckoWithFilePrefix:@"-almost" WithResult:v14];
LABEL_9:
}

- (void)_logVTResult:(id)a3 metaFilePath:(id)a4 audioFilePath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 objectForKeyedSubscript:kVTEIAudioProviderUUID];
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10014F568;
  v21[3] = &unk_100252B60;
  v21[4] = self;
  id v22 = v14;
  id v23 = v10;
  id v24 = v12;
  id v25 = v11;
  id v26 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  id v20 = v14;
  dispatch_async(queue, v21);
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([(CSVoiceTriggerFileLogger *)self fileLoggingEnabled])
  {
    if ([(CSVoiceTriggerFileLogger *)self _shouldSkipLogging:v15]) {
      goto LABEL_9;
    }
    unsigned int v7 = [(CSVoiceTriggerFileLogger *)self _shouldLogDeviceId:v15];
    id v8 = [(CSVoiceTriggerFileLogger *)self _audioLogDirectory];
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    id v10 = [(CSVoiceTriggerFileLogger *)self _metaFilenameWithRootDir:v8 prefix:@"-triggered" deviceId:v9];

    id v11 = [v10 stringByReplacingOccurrencesOfString:@".json" withString:@".wav"];
    id v12 = [v15 mutableCopy];
    [v12 setObject:v11 forKey:kVTEICaptureFilePath];
    id v13 = v12;

    [(CSVoiceTriggerFileLogger *)self _logVTResult:v13 metaFilePath:v10 audioFilePath:v11 completion:&stru_100252B38];
    [(CSVoiceTriggerFileLogger *)self _clearOldLoggingFiles];

    id v14 = v13;
  }
  else
  {
    id v14 = v15;
  }
  id v15 = v14;
  [(CSVoiceTriggerFileLogger *)self _logGeckoWithFilePrefix:@"-triggered" WithResult:v14];
LABEL_9:
}

- (BOOL)_shouldSkipLogging:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
  unsigned __int8 v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromDarwin];

  return v4;
}

- (BOOL)_shouldLogDeviceId:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
  unsigned __int8 v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromRemora];

  return v4;
}

- (void)_writeDictionary:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v13 = 0;
    unsigned int v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:3 error:&v13];
    id v8 = v13;
    if (v8)
    {
      id v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        id v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
        __int16 v16 = 2114;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Error writing out event info meta: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      [v7 writeToFile:v6 atomically:0];
    }
  }
  else
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSVoiceTriggerFileLogger _writeDictionary:toPath:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s No meta data to write, skip", buf, 0xCu);
    }
  }
}

- (id)_metaFilenameWithRootDir:(id)a3 prefix:(id)a4 deviceId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(CSVoiceTriggerFileLogger *)self _timeStampString];
  id v12 = (void *)v11;
  if (v8) {
    +[NSString stringWithFormat:@"%@-%@%@%@", v11, v8, v9, @".json"];
  }
  else {
  id v13 = +[NSString stringWithFormat:@"%@%@%@", v11, v9, @".json", v16];
  }

  id v14 = [v10 stringByAppendingPathComponent:v13];

  return v14;
}

- (id)_timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  unsigned __int8 v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

- (id)_geckoLogDirectory
{
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = +[CSFPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 geckoAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    NSFileAttributeKey v19 = NSFileProtectionKey;
    NSFileProtectionType v20 = NSFileProtectionCompleteUnlessOpen;
    id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v12 = 0;
    unsigned __int8 v7 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v12];
    id v5 = v12;

    if ((v7 & 1) == 0)
    {
      id v8 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v10 = v8;
        uint64_t v11 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v14 = "-[CSVoiceTriggerFileLogger _geckoLogDirectory]";
        __int16 v15 = 2114;
        uint64_t v16 = v4;
        __int16 v17 = 2114;
        id v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      unsigned __int8 v4 = 0;
    }
  }

  return v4;
}

- (id)_audioLogDirectory
{
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = +[CSFPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 voiceTriggerAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v11 = 0;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v9 = v7;
        id v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v13 = "-[CSVoiceTriggerFileLogger _audioLogDirectory]";
        __int16 v14 = 2114;
        __int16 v15 = v4;
        __int16 v16 = 2114;
        __int16 v17 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      unsigned __int8 v4 = @"/tmp";
    }
  }

  return v4;
}

- (CSVoiceTriggerFileLogger)initWithSpeechManager:(id)a3 fileLoggingEnabled:(BOOL)a4 geckoLoggingEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSVoiceTriggerFileLogger;
  id v9 = [(CSVoiceTriggerFileLogger *)&v15 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("VoiceTrigger audio logging queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    if (v8)
    {
      id v12 = (CSSpeechManager *)v8;
    }
    else
    {
      id v12 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    }
    speechManager = v9->_speechManager;
    v9->_speechManager = v12;

    [(CSVoiceTriggerFileLogger *)v9 setFileLoggingEnabled:v6];
    [(CSVoiceTriggerFileLogger *)v9 setGeckoLoggingEnabled:v5];
  }

  return v9;
}

- (CSVoiceTriggerFileLogger)init
{
  uint64_t v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 fileLoggingIsEnabled];
  BOOL v5 = +[CSFPreferences sharedPreferences];
  BOOL v6 = -[CSVoiceTriggerFileLogger initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:](self, "initWithSpeechManager:fileLoggingEnabled:geckoLoggingEnabled:", 0, v4, (uint64_t)[v5 geckoLoggingLevel] > 0);

  return v6;
}

@end