@interface ESStoreAudioData
- (BOOL)_moveAudioToVarMobile:(id)a3;
- (BOOL)_saveAudioToCache:(id)a3;
- (BOOL)hasData;
- (BOOL)hasRecognizedAnything;
- (BOOL)isSamplingForDictation;
- (BOOL)isSpeakerCodeUsed;
- (ESSelfHelper)selfLogger;
- (ESStoreAudioData)initWithUUIDString:(id)a3 language:(id)a4 task:(id)a5 codec:(id)a6 samplingRate:(unint64_t)a7 inferenceSpeakerCode:(id)a8 numTrainedFrames:(id)a9 trainingNnetVersion:(id)a10 isSpeakerCodeUsed:(BOOL)a11 isSamplingForDictation:(BOOL)a12 selfLogger:(id)a13;
- (NSMutableData)audioPackets;
- (NSMutableDictionary)audioMetadata;
- (NSNumber)numTrainedFrames;
- (NSNumber)trainingNnetVersion;
- (NSString)UUIDString;
- (NSString)codec;
- (NSString)currentAudioFilePath;
- (NSString)inferenceSpeakerCode;
- (NSString)language;
- (NSString)logPrefix;
- (NSString)task;
- (double)collectedAudioDurationMS;
- (id)_createAudioFilePath;
- (id)_createCachesDirectoryIfItDoesNotExist;
- (unint64_t)samplingRate;
- (void)_cleanupCacheAndReset:(id)a3;
- (void)_deleteItemAtPath:(id)a3;
- (void)_logAudioSampledEventsWithStatus:(int64_t)a3 error:(id)a4 customReasonForFailure:(int64_t)a5;
- (void)_saveAudioMetadataToFilePath:(id)a3;
- (void)addAudioPacket:(id)a3;
- (void)cleanupCacheAndReset;
- (void)dealloc;
- (void)markRecognition;
- (void)saveAudioToDisk;
- (void)setAudioMetadata:(id)a3;
- (void)setAudioPackets:(id)a3;
- (void)setCodec:(id)a3;
- (void)setCollectedAudioDurationMS:(double)a3;
- (void)setCurrentAudioFilePath:(id)a3;
- (void)setHasRecognizedAnything:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLogPrefix:(id)a3;
- (void)setSamplingRate:(unint64_t)a3;
- (void)setSelfLogger:(id)a3;
- (void)setTask:(id)a3;
- (void)setUUIDString:(id)a3;
@end

@implementation ESStoreAudioData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_currentAudioFilePath, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
  objc_storeStrong((id *)&self->_selfLogger, 0);
  objc_storeStrong((id *)&self->_trainingNnetVersion, 0);
  objc_storeStrong((id *)&self->_numTrainedFrames, 0);
  objc_storeStrong((id *)&self->_inferenceSpeakerCode, 0);
  objc_storeStrong((id *)&self->_audioPackets, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_UUIDString, 0);
}

- (void)setLogPrefix:(id)a3
{
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setCurrentAudioFilePath:(id)a3
{
}

- (NSString)currentAudioFilePath
{
  return self->_currentAudioFilePath;
}

- (void)setCollectedAudioDurationMS:(double)a3
{
  self->_collectedAudioDurationMS = a3;
}

- (double)collectedAudioDurationMS
{
  return self->_collectedAudioDurationMS;
}

- (void)setAudioMetadata:(id)a3
{
}

- (NSMutableDictionary)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setSelfLogger:(id)a3
{
}

- (ESSelfHelper)selfLogger
{
  return self->_selfLogger;
}

- (BOOL)isSamplingForDictation
{
  return self->_isSamplingForDictation;
}

- (BOOL)isSpeakerCodeUsed
{
  return self->_isSpeakerCodeUsed;
}

- (NSNumber)trainingNnetVersion
{
  return self->_trainingNnetVersion;
}

- (NSNumber)numTrainedFrames
{
  return self->_numTrainedFrames;
}

- (NSString)inferenceSpeakerCode
{
  return self->_inferenceSpeakerCode;
}

- (void)setHasRecognizedAnything:(BOOL)a3
{
  self->_hasRecognizedAnything = a3;
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (void)setAudioPackets:(id)a3
{
}

- (NSMutableData)audioPackets
{
  return self->_audioPackets;
}

- (void)setSamplingRate:(unint64_t)a3
{
  self->_samplingRate = a3;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (void)setCodec:(id)a3
{
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setTask:(id)a3
{
}

- (NSString)task
{
  return self->_task;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)_logAudioSampledEventsWithStatus:(int64_t)a3 error:(id)a4 customReasonForFailure:(int64_t)a5
{
  id v8 = a4;
  if (self->_isSamplingForDictation)
  {
    id v9 = objc_alloc((Class)NSMutableDictionary);
    v34[0] = self->_UUIDString;
    v33[0] = @"dictationUIInteractionIdentifier";
    v33[1] = @"unixTime";
    v10 = +[NSDate date];
    [v10 timeIntervalSince1970];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v34[1] = v11;
    v33[2] = @"samplingDate";
    uint64_t v12 = +[AFDictationSamplingUtilities samplingDateAsString];
    v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_1000519F0;
    }
    v34[2] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    id v16 = [v9 initWithDictionary:v15];

    if (a3)
    {
      if (a3 == 1) {
        CFStringRef v17 = @"success";
      }
      else {
        CFStringRef v17 = &stru_1000519F0;
      }
    }
    else
    {
      if (v8)
      {
        v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
        [v16 setObject:v18 forKeyedSubscript:@"errorCode"];

        uint64_t v19 = [v8 domain];
        v20 = (void *)v19;
        if (v19) {
          CFStringRef v21 = (const __CFString *)v19;
        }
        else {
          CFStringRef v21 = &stru_1000519F0;
        }
        [v16 setObject:v21 forKeyedSubscript:@"errorDomain"];

        uint64_t v22 = [v8 localizedDescription];
        v23 = (void *)v22;
        if (v22) {
          CFStringRef v24 = (const __CFString *)v22;
        }
        else {
          CFStringRef v24 = @"UNDEFINED";
        }
        [v16 setObject:v24 forKeyedSubscript:@"description"];

        v25 = [v8 userInfo];
        v26 = [v25 objectForKey:NSUnderlyingErrorKey];

        if (v26)
        {
          v27 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v26 code]);
          [v16 setObject:v27 forKeyedSubscript:@"underlyingErrorCode"];

          uint64_t v28 = [v26 domain];
          v29 = (void *)v28;
          if (v28) {
            CFStringRef v30 = (const __CFString *)v28;
          }
          else {
            CFStringRef v30 = &stru_1000519F0;
          }
          [v16 setObject:v30 forKeyedSubscript:@"underlyingErrorDomain"];
        }
      }
      else
      {
        switch(a5)
        {
          case 1:
            CFStringRef v31 = @"Audio file to be moved nil";
            goto LABEL_31;
          case 2:
            CFStringRef v31 = @"Sampling Date is nil";
            goto LABEL_31;
          case 3:
            CFStringRef v31 = @"Unable to create sampling directory";
            goto LABEL_31;
          case 4:
            CFStringRef v31 = @"Unable to create dated directory";
LABEL_31:
            [v16 setObject:v31 forKeyedSubscript:@"description"];
            break;
          default:
            break;
        }
      }
      CFStringRef v17 = @"failed";
    }
    [v16 setObject:v17 forKeyedSubscript:@"status"];
    v32 = +[AFAnalytics sharedAnalytics];
    [v32 logEventWithType:2224 context:v16];
  }
  else if (a3)
  {
    if (a3 == 1) {
      [(ESSelfHelper *)self->_selfLogger logSampledAudioFileStoredSuccessfully];
    }
  }
  else
  {
    [(ESSelfHelper *)self->_selfLogger logSampledAudioFileStoredWithError:v8 customFailureReason:a5];
  }
}

- (id)_createCachesDirectoryIfItDoesNotExist
{
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = [v3 firstObject];

  v5 = (id *)AFAssistantSamplingUtilities_ptr;
  if (self->_isSamplingForDictation) {
    v5 = (id *)AFDictationSamplingUtilities_ptr;
  }
  v6 = [*v5 sampledCachesSubDirectoryPath];
  v7 = [v4 stringByAppendingPathComponent:v6];

  id v8 = AFCreateDirectoryWithPath();

  return v8;
}

- (id)_createAudioFilePath
{
  v3 = [(ESStoreAudioData *)self _createCachesDirectoryIfItDoesNotExist];
  if (v3)
  {
    v4 = (id *)AFAssistantSamplingUtilities_ptr;
    if (self->_isSamplingForDictation) {
      v4 = (id *)AFDictationSamplingUtilities_ptr;
    }
    v5 = [*v4 samplingDateAsString];
    if (v5)
    {
      v6 = +[NSDate date];
      [v6 timeIntervalSince1970];
      double v8 = v7;

      id v9 = +[NSString stringWithFormat:@"%.0f", *(void *)&v8];
      audioMetadata = self->_audioMetadata;
      v11 = +[NSNumber numberWithDouble:v8];
      [(NSMutableDictionary *)audioMetadata setObject:v11 forKey:@"samplingTimestamp"];

      uint64_t v12 = +[NSString stringWithFormat:@"%@_%@_%@.pcm", self->_UUIDString, v5, v9];
      v13 = [v3 stringByAppendingPathComponent:v12];
    }
    else
    {
      CFStringRef v14 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 136315394;
        v18 = "-[ESStoreAudioData _createAudioFilePath]";
        __int16 v19 = 2112;
        v20 = logPrefix;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s %@ Sampling: currentSamplingDateString is null", buf, 0x16u);
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_saveAudioMetadataToFilePath:(id)a3
{
  id v4 = a3;
  if (self->_isSamplingForDictation) {
    CFStringRef v5 = @"dictationUIInteractionIdentifier";
  }
  else {
    CFStringRef v5 = @"interactionIdentifier";
  }
  [(NSMutableDictionary *)self->_audioMetadata setObject:self->_UUIDString forKey:v5];
  [(NSMutableDictionary *)self->_audioMetadata setObject:self->_language forKey:@"language"];
  [(NSMutableDictionary *)self->_audioMetadata setObject:self->_task forKey:@"task"];
  audioMetadata = self->_audioMetadata;
  double v7 = +[NSNumber numberWithUnsignedInteger:self->_samplingRate];
  [(NSMutableDictionary *)audioMetadata setObject:v7 forKey:@"samplingRate"];

  [(NSMutableDictionary *)self->_audioMetadata setObject:self->_codec forKey:@"codec"];
  if ([(NSString *)self->_inferenceSpeakerCode length]) {
    [(NSMutableDictionary *)self->_audioMetadata setObject:self->_inferenceSpeakerCode forKey:@"inferenceSpeakerCode"];
  }
  numTrainedFrames = self->_numTrainedFrames;
  if (numTrainedFrames) {
    [(NSMutableDictionary *)self->_audioMetadata setObject:numTrainedFrames forKey:@"numTrainedFrames"];
  }
  trainingNnetVersion = self->_trainingNnetVersion;
  if (trainingNnetVersion) {
    [(NSMutableDictionary *)self->_audioMetadata setObject:trainingNnetVersion forKey:@"trainingNnetVersion"];
  }
  v10 = self->_audioMetadata;
  v11 = +[NSNumber numberWithBool:self->_isSpeakerCodeUsed];
  [(NSMutableDictionary *)v10 setObject:v11 forKey:@"isSpeakerCodeUsed"];

  selfLogger = self->_selfLogger;
  if (selfLogger)
  {
    v13 = self->_audioMetadata;
    CFStringRef v14 = [(ESSelfHelper *)selfLogger asrId];
    v15 = [v14 UUIDString];
    [(NSMutableDictionary *)v13 setObject:v15 forKey:@"asrSelfComponentIdentifier"];
  }
  if (([(NSMutableDictionary *)self->_audioMetadata writeToFile:v4 atomically:1] & 1) == 0)
  {
    id v16 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      int v18 = 136315650;
      __int16 v19 = "-[ESStoreAudioData _saveAudioMetadataToFilePath:]";
      __int16 v20 = 2112;
      CFStringRef v21 = logPrefix;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while writing audio metadata dict to plist - %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (BOOL)_moveAudioToVarMobile:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 pathComponents];
  v6 = [v5 lastObject];

  if (v6)
  {
    if (self->_isSamplingForDictation) {
      double v7 = (id *)AFDictationSamplingUtilities_ptr;
    }
    else {
      double v7 = (id *)AFAssistantSamplingUtilities_ptr;
    }
    double v8 = [*v7 samplingDateAsString];
    if (v8)
    {
      if (self->_isSamplingForDictation) {
        id v9 = (id *)AFDictationSamplingUtilities_ptr;
      }
      else {
        id v9 = (id *)AFAssistantSamplingUtilities_ptr;
      }
      v10 = [*v9 createSamplingDirectory];
      if (v10)
      {
        v11 = +[NSFileManager defaultManager];
        uint64_t v12 = [v10 stringByAppendingPathComponent:v8];
        if (self->_isSamplingForDictation && (AFIsInternalInstall() & 1) == 0)
        {
          buf[0] = 0;
          if ([v11 fileExistsAtPath:v12 isDirectory:buf] && buf[0] != 0) {
            [(ESStoreAudioData *)self _deleteItemAtPath:v12];
          }
        }
        CFStringRef v14 = AFCreateDirectoryWithPath();

        if (v14)
        {
          v15 = [v14 stringByAppendingPathComponent:v6];
          id v36 = 0;
          unsigned __int8 v16 = [v11 moveItemAtPath:v4 toPath:v15 error:&v36];
          id v35 = v36;
          CFStringRef v17 = AFSiriLogContextSpeech;
          if (v16)
          {
            v34 = v11;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
            {
              logPrefix = self->_logPrefix;
              *(_DWORD *)buf = 136315650;
              v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
              __int16 v39 = 2112;
              v40 = logPrefix;
              __int16 v41 = 2112;
              id v42 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ Sampling: Successfully moved audio file to var/mobile/Library dir, path=%@", buf, 0x20u);
            }
            __int16 v19 = [v6 stringByDeletingPathExtension];
            __int16 v20 = +[NSString stringWithFormat:@"%@.plist", v19];

            CFStringRef v21 = [v14 stringByAppendingPathComponent:v20];
            [(ESStoreAudioData *)self _saveAudioMetadataToFilePath:v21];

            v11 = v34;
            __int16 v22 = v35;
          }
          else
          {
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              v33 = self->_logPrefix;
              *(_DWORD *)buf = 136315650;
              v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
              __int16 v39 = 2112;
              v40 = v33;
              __int16 v41 = 2112;
              id v42 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while moving file from cache directory to var/mobile/Library - %@", buf, 0x20u);
            }
            v27 = self;
            __int16 v22 = v35;
            [(ESStoreAudioData *)v27 _logAudioSampledEventsWithStatus:0 error:v35 customReasonForFailure:0];
          }
        }
        else
        {
          v26 = AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            v32 = self->_logPrefix;
            *(_DWORD *)buf = 136315906;
            v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
            __int16 v39 = 2112;
            v40 = v32;
            __int16 v41 = 2112;
            id v42 = v10;
            __int16 v43 = 2112;
            v44 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while creating dated Sampled directory in %@ with date - %@", buf, 0x2Au);
          }
          [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:0 error:0 customReasonForFailure:4];
          unsigned __int8 v16 = 0;
        }
      }
      else
      {
        v25 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v31 = self->_logPrefix;
          *(_DWORD *)buf = 136315394;
          v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
          __int16 v39 = 2112;
          v40 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while creating Sampled directory in /var/mobile", buf, 0x16u);
        }
        [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:0 error:0 customReasonForFailure:3];
        unsigned __int8 v16 = 0;
      }
    }
    else
    {
      CFStringRef v24 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v30 = self->_logPrefix;
        *(_DWORD *)buf = 136315394;
        v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
        __int16 v39 = 2112;
        v40 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s %@ Sampling: currentSamplingDate is nil", buf, 0x16u);
      }
      [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:0 error:0 customReasonForFailure:2];
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    id v23 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v29 = self->_logPrefix;
      *(_DWORD *)buf = 136315394;
      v38 = "-[ESStoreAudioData _moveAudioToVarMobile:]";
      __int16 v39 = 2112;
      v40 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s %@ Sampling: audioFileToBeMoved is nil", buf, 0x16u);
    }
    [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:0 error:0 customReasonForFailure:1];
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)_saveAudioToCache:(id)a3
{
  id v4 = a3;
  audioPackets = self->_audioPackets;
  id v12 = 0;
  unsigned __int8 v6 = [(NSMutableData *)audioPackets writeToFile:v4 options:0x40000000 error:&v12];
  id v7 = v12;
  double v8 = AFSiriLogContextSpeech;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 136315650;
      CFStringRef v14 = "-[ESStoreAudioData _saveAudioToCache:]";
      __int16 v15 = 2112;
      unsigned __int8 v16 = logPrefix;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ Sampling: Successfully saved audio file to cache dir, path=%@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_logPrefix;
      *(_DWORD *)buf = 136315650;
      CFStringRef v14 = "-[ESStoreAudioData _saveAudioToCache:]";
      __int16 v15 = 2112;
      unsigned __int8 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Failed to save audio to cache dir. Error: %@", buf, 0x20u);
    }
    [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:0 error:v7 customReasonForFailure:0];
  }

  return v6;
}

- (void)dealloc
{
  [(ESStoreAudioData *)self cleanupCacheAndReset];
  v3.receiver = self;
  v3.super_class = (Class)ESStoreAudioData;
  [(ESStoreAudioData *)&v3 dealloc];
}

- (void)_cleanupCacheAndReset:(id)a3
{
  id v4 = a3;
  [(ESStoreAudioData *)self _deleteItemAtPath:v4];
  CFStringRef v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  audioPackets = self->_audioPackets;
  self->_audioPackets = v5;

  self->_collectedAudioDurationMS = 0.0;
  id v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    logPrefix = self->_logPrefix;
    int v9 = 136315650;
    v10 = "-[ESStoreAudioData _cleanupCacheAndReset:]";
    __int16 v11 = 2112;
    id v12 = logPrefix;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ Sampling: Done with cleanup of audioFile=%@ and reset of variables.", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_deleteItemAtPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_isSamplingForDictation) {
      CFStringRef v5 = AFDictationSamplingUtilities;
    }
    else {
      CFStringRef v5 = AFAssistantSamplingUtilities;
    }
    id v8 = [v5 deleteItemAtFilePath:v4];
  }
  else
  {
    unsigned __int8 v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      int v9 = 136315394;
      v10 = "-[ESStoreAudioData _deleteItemAtPath:]";
      __int16 v11 = 2112;
      id v12 = logPrefix;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s %@ Sampling: invalid filePath or it is null.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)cleanupCacheAndReset
{
}

- (void)saveAudioToDisk
{
  if (!self->_hasRecognizedAnything || ![(ESStoreAudioData *)self hasData])
  {
    CFStringRef v5 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    logPrefix = self->_logPrefix;
    int v9 = 136315394;
    v10 = "-[ESStoreAudioData saveAudioToDisk]";
    __int16 v11 = 2112;
    id v12 = logPrefix;
    id v7 = "%s %@ Sampling: Won't save audio because - has not recognized anything or has no data.";
    goto LABEL_14;
  }
  objc_super v3 = [(ESStoreAudioData *)self _createAudioFilePath];
  currentAudioFilePath = self->_currentAudioFilePath;
  self->_currentAudioFilePath = v3;

  if (!self->_currentAudioFilePath)
  {
    CFStringRef v5 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    unsigned __int8 v6 = self->_logPrefix;
    int v9 = 136315394;
    v10 = "-[ESStoreAudioData saveAudioToDisk]";
    __int16 v11 = 2112;
    id v12 = v6;
    id v7 = "%s %@ Sampling: Won't save audio because - _currentAudioFilePath is null";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0x16u);
    return;
  }
  if (-[ESStoreAudioData _saveAudioToCache:](self, "_saveAudioToCache:")
    && [(ESStoreAudioData *)self _moveAudioToVarMobile:self->_currentAudioFilePath])
  {
    [(ESStoreAudioData *)self _logAudioSampledEventsWithStatus:1 error:0 customReasonForFailure:0];
  }
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (void)addAudioPacket:(id)a3
{
  if (self->_collectedAudioDurationMS <= 60000.0)
  {
    audioPackets = self->_audioPackets;
    id v5 = a3;
    [(NSMutableData *)audioPackets appendData:v5];
    unint64_t v6 = (unint64_t)[v5 length];

    self->_collectedAudioDurationMS = self->_collectedAudioDurationMS
                                    + (double)(v6 >> 1) / (double)self->_samplingRate * 1000.0;
  }
}

- (BOOL)hasData
{
  return [(NSMutableData *)self->_audioPackets length] != 0;
}

- (ESStoreAudioData)initWithUUIDString:(id)a3 language:(id)a4 task:(id)a5 codec:(id)a6 samplingRate:(unint64_t)a7 inferenceSpeakerCode:(id)a8 numTrainedFrames:(id)a9 trainingNnetVersion:(id)a10 isSpeakerCodeUsed:(BOOL)a11 isSamplingForDictation:(BOOL)a12 selfLogger:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v40 = a5;
  id v39 = a6;
  id v20 = a8;
  id v21 = a9;
  id v38 = a10;
  id v37 = a13;
  if ([v18 length])
  {
    v41.receiver = self;
    v41.super_class = (Class)ESStoreAudioData;
    __int16 v22 = [(ESStoreAudioData *)&v41 init];
    id v23 = v22;
    if (v22)
    {
      [(ESStoreAudioData *)v22 setUUIDString:v18];
      [(ESStoreAudioData *)v23 setLanguage:v19];
      objc_storeStrong((id *)&v23->_task, a5);
      objc_storeStrong((id *)&v23->_codec, a6);
      v23->_samplingRate = a7;
      CFStringRef v24 = (NSString *)[v20 copy];
      inferenceSpeakerCode = v23->_inferenceSpeakerCode;
      v23->_inferenceSpeakerCode = v24;

      objc_storeStrong((id *)&v23->_numTrainedFrames, a9);
      objc_storeStrong((id *)&v23->_trainingNnetVersion, a10);
      v23->_isSpeakerCodeUsed = a11;
      v26 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
      audioPackets = v23->_audioPackets;
      v23->_audioPackets = v26;

      uint64_t v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      audioMetadata = v23->_audioMetadata;
      v23->_audioMetadata = v28;

      v23->_isSamplingForDictation = a12;
      objc_storeStrong((id *)&v23->_selfLogger, a13);
      CFStringRef v30 = (id *)AFAssistantSamplingUtilities_ptr;
      if (v23->_isSamplingForDictation) {
        CFStringRef v30 = (id *)AFDictationSamplingUtilities_ptr;
      }
      uint64_t v31 = [*v30 component];
      logPrefix = v23->_logPrefix;
      v23->_logPrefix = (NSString *)v31;
    }
    self = v23;
    v33 = self;
  }
  else
  {
    v34 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v43 = "-[ESStoreAudioData initWithUUIDString:language:task:codec:samplingRate:inferenceSpeakerCode:numTrainedFrames"
            ":trainingNnetVersion:isSpeakerCodeUsed:isSamplingForDictation:selfLogger:]";
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s Sampling: Error while initializing ESStoreAudioData because uuid is invalid.", buf, 0xCu);
    }
    v33 = 0;
  }

  return v33;
}

@end