@interface CSAttSiriMagusLoggingNode
- (BOOL)didStop;
- (BOOL)isReady;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMagusLoggingNode)initWithAttSiriController:(id)a3;
- (CSAudioFileWriter)audioFileWriter;
- (CSAudioRecordContext)audioRecordContext;
- (NSArray)requiredNodes;
- (NSMutableArray)attentionSignals;
- (NSMutableArray)gazeEstimationSignals;
- (NSMutableArray)gazeStateSignals;
- (NSMutableArray)motionSignals;
- (NSMutableArray)visualSpeechEstimationSignals;
- (NSMutableArray)visualSpeechFaceLandmarks;
- (NSMutableArray)visualSpeechQuery;
- (NSString)magusLogDirectory;
- (NSString)mhId;
- (NSString)startTimestampString;
- (NSString)stopTimestampString;
- (OS_dispatch_queue)queue;
- (id)_createAudioLogPathByFileName:(id)a3;
- (id)_createJsonLogPathBySignalType:(id)a3;
- (id)_timeStampString;
- (unint64_t)activationStartSampleCount;
- (unint64_t)previousLoggedSampleCount;
- (unint64_t)startMachAbsTime;
- (unint64_t)startSampleCount;
- (unint64_t)stopMachAbsTime;
- (unint64_t)stopSampleCount;
- (unint64_t)type;
- (void)_clearAudioFileWriterIfNeed;
- (void)_handleMagusStopLogging;
- (void)_logAttentionSignals;
- (void)_logFaceLandmarks;
- (void)_logGazeDetection;
- (void)_logGazeInstaneousSignals;
- (void)_logMetadata;
- (void)_logMotionSignals;
- (void)_logVisualSpeechEstimationSignals;
- (void)_logVisualSpeechQuerySignals;
- (void)_renameAudioFileNameWithRequestMHUUID;
- (void)_setupLogDirectory;
- (void)_startAudioLogging;
- (void)_writeAudioChunk:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4;
- (void)attSiriNode:(id)a3 didUpdateMotionSignal:(id)a4;
- (void)attSiriNode:(id)a3 didUpdateVisualSpeechProbability:(double)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6;
- (void)attSiriNode:(id)a3 hadVisualSpeechSignals:(BOOL)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6;
- (void)gazeInInterval:(BOOL)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5;
- (void)gazePointUpdate:(CGPoint)a3 areaOfInterest:(CGRect)a4 gazeState:(BOOL)a5 atTime:(unint64_t)a6;
- (void)setActivationStartSampleCount:(unint64_t)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAttentionSignals:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setDidStop:(BOOL)a3;
- (void)setGazeEstimationSignals:(id)a3;
- (void)setGazeStateSignals:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMagusLogDirectory:(id)a3;
- (void)setMhId:(id)a3;
- (void)setMotionSignals:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPreviousLoggedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setStartMachAbsTime:(unint64_t)a3;
- (void)setStartSampleCount:(unint64_t)a3;
- (void)setStartTimestampString:(id)a3;
- (void)setStopMachAbsTime:(unint64_t)a3;
- (void)setStopSampleCount:(unint64_t)a3;
- (void)setStopTimestampString:(id)a3;
- (void)setVisualSpeechEstimationSignals:(id)a3;
- (void)setVisualSpeechFaceLandmarks:(id)a3;
- (void)setVisualSpeechQuery:(id)a3;
- (void)start;
- (void)stop;
- (void)visualSpeechLandmarkUpdate:(id)a3 time:(unint64_t)a4;
@end

@implementation CSAttSiriMagusLoggingNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTimestampString, 0);
  objc_storeStrong((id *)&self->_startTimestampString, 0);
  objc_storeStrong((id *)&self->_visualSpeechFaceLandmarks, 0);
  objc_storeStrong((id *)&self->_visualSpeechQuery, 0);
  objc_storeStrong((id *)&self->_visualSpeechEstimationSignals, 0);
  objc_storeStrong((id *)&self->_attentionSignals, 0);
  objc_storeStrong((id *)&self->_gazeStateSignals, 0);
  objc_storeStrong((id *)&self->_gazeEstimationSignals, 0);
  objc_storeStrong((id *)&self->_motionSignals, 0);
  objc_storeStrong((id *)&self->_magusLogDirectory, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
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

- (void)setActivationStartSampleCount:(unint64_t)a3
{
  self->_activationStartSampleCount = a3;
}

- (unint64_t)activationStartSampleCount
{
  return self->_activationStartSampleCount;
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

- (void)setDidStop:(BOOL)a3
{
  self->_didStop = a3;
}

- (BOOL)didStop
{
  return self->_didStop;
}

- (void)setVisualSpeechFaceLandmarks:(id)a3
{
}

- (NSMutableArray)visualSpeechFaceLandmarks
{
  return self->_visualSpeechFaceLandmarks;
}

- (void)setVisualSpeechQuery:(id)a3
{
}

- (NSMutableArray)visualSpeechQuery
{
  return self->_visualSpeechQuery;
}

- (void)setVisualSpeechEstimationSignals:(id)a3
{
}

- (NSMutableArray)visualSpeechEstimationSignals
{
  return self->_visualSpeechEstimationSignals;
}

- (void)setAttentionSignals:(id)a3
{
}

- (NSMutableArray)attentionSignals
{
  return self->_attentionSignals;
}

- (void)setGazeStateSignals:(id)a3
{
}

- (NSMutableArray)gazeStateSignals
{
  return self->_gazeStateSignals;
}

- (void)setGazeEstimationSignals:(id)a3
{
}

- (NSMutableArray)gazeEstimationSignals
{
  return self->_gazeEstimationSignals;
}

- (void)setMotionSignals:(id)a3
{
}

- (NSMutableArray)motionSignals
{
  return self->_motionSignals;
}

- (void)setMagusLogDirectory:(id)a3
{
}

- (NSString)magusLogDirectory
{
  return self->_magusLogDirectory;
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

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)_logVisualSpeechQuerySignals
{
  visualSpeechQuery = self->_visualSpeechQuery;
  if (visualSpeechQuery && [(NSMutableArray *)visualSpeechQuery count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"visualSpeechQuerySignal"];
    v5 = self->_visualSpeechQuery;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      v13 = self->_visualSpeechQuery;
      self->_visualSpeechQuery = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAttSiriMagusLoggingNode _logVisualSpeechQuerySignals]";
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize _visualSpeechQuery data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_logVisualSpeechEstimationSignals
{
  visualSpeechEstimationSignals = self->_visualSpeechEstimationSignals;
  if (visualSpeechEstimationSignals && [(NSMutableArray *)visualSpeechEstimationSignals count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"visualSpeechEstimationSignal"];
    v5 = self->_visualSpeechEstimationSignals;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      v13 = self->_visualSpeechEstimationSignals;
      self->_visualSpeechEstimationSignals = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSAttSiriMagusLoggingNode _logVisualSpeechEstimationSignals]";
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize _visualSpeechEstimationSignals data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)attSiriNode:(id)a3 hadVisualSpeechSignals:(BOOL)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6
{
  BOOL v8 = a4;
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v15 = "-[CSAttSiriMagusLoggingNode attSiriNode:hadVisualSpeechSignals:startTime:endTime:]";
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    __int16 v18 = 2048;
    unint64_t v19 = a6;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s startTs:%llu endTs:%llu hadSignal:%u", buf, 0x26u);
  }
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008FEB0;
  v12[3] = &unk_100250110;
  v12[5] = a5;
  v12[6] = a6;
  BOOL v13 = v8;
  v12[4] = self;
  dispatch_async(queue, v12);
}

- (void)attSiriNode:(id)a3 didUpdateVisualSpeechProbability:(double)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6
{
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v14 = "-[CSAttSiriMagusLoggingNode attSiriNode:didUpdateVisualSpeechProbability:startTime:endTime:]";
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    __int16 v17 = 2048;
    unint64_t v18 = a6;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s startTs:%llu endTs:%llu probability:%f", buf, 0x2Au);
  }
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100090134;
  v12[3] = &unk_100250138;
  v12[5] = a5;
  v12[6] = a6;
  *(double *)&void v12[7] = a4;
  v12[4] = self;
  dispatch_async(queue, v12);
}

- (void)_logAttentionSignals
{
  attentionSignals = self->_attentionSignals;
  if (attentionSignals && [(NSMutableArray *)attentionSignals count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"attentionSignal"];
    v5 = self->_attentionSignals;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_attentionSignals;
      self->_attentionSignals = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _logAttentionSignals]";
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize attention data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100090478;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_logFaceLandmarks
{
  visualSpeechFaceLandmarks = self->_visualSpeechFaceLandmarks;
  if (visualSpeechFaceLandmarks && [(NSMutableArray *)visualSpeechFaceLandmarks count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"visualSpeechFaceLandmarks"];
    v5 = self->_visualSpeechFaceLandmarks;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_visualSpeechFaceLandmarks;
      self->_visualSpeechFaceLandmarks = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _logFaceLandmarks]";
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize visual speech faceLandmarks data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_logGazeDetection
{
  gazeStateSignals = self->_gazeStateSignals;
  if (gazeStateSignals && [(NSMutableArray *)gazeStateSignals count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"gazeStateLogs"];
    v5 = self->_gazeStateSignals;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_gazeStateSignals;
      self->_gazeStateSignals = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _logGazeDetection]";
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize gaze state data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_logGazeInstaneousSignals
{
  gazeEstimationSignals = self->_gazeEstimationSignals;
  if (gazeEstimationSignals && [(NSMutableArray *)gazeEstimationSignals count])
  {
    v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"gazeEstimationLogs"];
    v5 = self->_gazeEstimationSignals;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_gazeEstimationSignals;
      self->_gazeEstimationSignals = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _logGazeInstaneousSignals]";
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize gaze estimation data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)_timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  v4 = +[NSDate date];
  v5 = [v2 stringFromDate:v4];

  return v5;
}

- (void)_logMetadata
{
  audioRecordContext = self->_audioRecordContext;
  if (audioRecordContext) {
    id v4 = [(CSAudioRecordContext *)audioRecordContext type];
  }
  else {
    id v4 = 0;
  }
  uint64_t v24 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"metadata"];
  v31[0] = @"audioRecordType";
  v5 = +[CSAudioRecordContext recordTypeString:v4];
  startTimestampString = self->_startTimestampString;
  stopTimestampString = self->_stopTimestampString;
  v32[0] = v5;
  v32[1] = startTimestampString;
  v31[1] = @"startTimestamp";
  v31[2] = @"stopTimestamp";
  v32[2] = stopTimestampString;
  v31[3] = @"startMachAbsTime";
  BOOL v8 = +[NSNumber numberWithUnsignedLongLong:self->_startMachAbsTime];
  v32[3] = v8;
  v31[4] = @"stopMachAbsTime";
  id v9 = +[NSNumber numberWithUnsignedLongLong:self->_stopMachAbsTime];
  v32[4] = v9;
  v31[5] = @"startSampleCount";
  v10 = +[NSNumber numberWithUnsignedLongLong:self->_startSampleCount];
  v32[5] = v10;
  v31[6] = @"stopSampleCount";
  v11 = +[NSNumber numberWithUnsignedLongLong:self->_stopSampleCount];
  v32[6] = v11;
  v31[7] = @"activationStartSampleCount";
  v12 = +[NSNumber numberWithUnsignedLongLong:self->_activationStartSampleCount];
  v32[7] = v12;
  v31[8] = @"productType";
  BOOL v13 = +[CSUtils deviceProductType];
  v32[8] = v13;
  v31[9] = @"productVersion";
  id v14 = +[CSUtils deviceProductVersion];
  v32[9] = v14;
  v31[10] = @"buildVersion";
  id v15 = +[CSUtils deviceBuildVersion];
  v32[10] = v15;
  unint64_t v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:11];

  id v26 = 0;
  __int16 v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:1 error:&v26];
  id v18 = v26;
  id v19 = v18;
  if (!v17 || v18)
  {
    BOOL v21 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = [v19 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSAttSiriMagusLoggingNode _logMetadata]";
      __int16 v29 = 2114;
      v30 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to serialize metadata data with err: %{public}@", buf, 0x16u);
    }
    double v20 = (void *)v24;
  }
  else
  {
    id v25 = 0;
    double v20 = (void *)v24;
    [v17 writeToFile:v24 options:0 error:&v25];
    id v19 = v25;
  }
}

- (void)_logMotionSignals
{
  motionSignals = self->_motionSignals;
  if (motionSignals && [(NSMutableArray *)motionSignals count])
  {
    id v4 = [(CSAttSiriMagusLoggingNode *)self _createJsonLogPathBySignalType:@"motion"];
    v5 = self->_motionSignals;
    id v15 = 0;
    v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v15];
    id v7 = v15;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v14 = 0;
      [v6 writeToFile:v4 options:0 error:&v14];
      id v9 = v14;
      BOOL v13 = self->_motionSignals;
      self->_motionSignals = 0;
    }
    else
    {
      id v9 = v7;
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _logMotionSignals]";
        __int16 v18 = 2114;
        id v19 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize motion data with err: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_clearAudioFileWriterIfNeed
{
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    [(CSAudioFileWriter *)audioFileWriter endAudio];
    id v4 = self->_audioFileWriter;
    self->_audioFileWriter = 0;

    [(CSAttSiriMagusLoggingNode *)self _renameAudioFileNameWithRequestMHUUID];
    unint64_t previousLoggedSampleCount = self->_previousLoggedSampleCount;
    self->_stopSampleCount = previousLoggedSampleCount;
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      BOOL v8 = "-[CSAttSiriMagusLoggingNode _clearAudioFileWriterIfNeed]";
      __int16 v9 = 2050;
      unint64_t v10 = previousLoggedSampleCount;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s audio logging end sample count %{public}llu", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_renameAudioFileNameWithRequestMHUUID
{
  mhId = self->_mhId;
  if (!mhId)
  {
    id v4 = +[NSUUID UUID];
    v5 = [v4 UUIDString];
    v6 = self->_mhId;
    self->_mhId = v5;

    int v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = self->_mhId;
      *(_DWORD *)buf = 136315394;
      double v20 = "-[CSAttSiriMagusLoggingNode _renameAudioFileNameWithRequestMHUUID]";
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Generated requestMHUUID for magus: %@", buf, 0x16u);
    }
    mhId = self->_mhId;
  }
  __int16 v9 = mhId;
  unint64_t v10 = +[NSFileManager defaultManager];
  v11 = [(CSAttSiriMagusLoggingNode *)self _createAudioLogPathByFileName:self->_startTimestampString];
  v12 = [(CSAttSiriMagusLoggingNode *)self _createAudioLogPathByFileName:v9];
  id v18 = 0;
  [v10 moveItemAtPath:v11 toPath:v12 error:&v18];
  id v13 = v18;

  if (v13)
  {
    id v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v15 = v14;
      unint64_t v16 = [(CSAttSiriMagusLoggingNode *)self _createAudioLogPathByFileName:v9];
      __int16 v17 = [v13 localizedDescription];
      *(_DWORD *)buf = 136315650;
      double v20 = "-[CSAttSiriMagusLoggingNode _renameAudioFileNameWithRequestMHUUID]";
      __int16 v21 = 2114;
      v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Couldn't rename to new path %{public}@ %{public}@", buf, 0x20u);
    }
  }
}

- (void)_writeAudioChunk:(id)a3
{
  id v4 = a3;
  v5 = [v4 data];
  if ((CSIsHorseman() & 1) == 0
    && +[CSConfig inputRecordingIsFloat])
  {
    v6 = [v4 data];
    uint64_t v7 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v6];

    v5 = (void *)v7;
  }
  audioFileWriter = self->_audioFileWriter;
  id v9 = v5;
  -[CSAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", [v9 bytes], objc_msgSend(v4, "numSamples"));
  if (!self->_previousLoggedSampleCount)
  {
    id v10 = [v4 startSampleCount];
    self->_startSampleCount = (unint64_t)v10;
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[CSAttSiriMagusLoggingNode _writeAudioChunk:]";
      __int16 v15 = 2050;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s audio logging start sample count %{public}llu", (uint8_t *)&v13, 0x16u);
    }
  }
  id v12 = [v4 startSampleCount];
  self->_unint64_t previousLoggedSampleCount = (unint64_t)v12 + (void)[v4 numSamples];
}

- (void)_startAudioLogging
{
  [(CSAttSiriMagusLoggingNode *)self _clearAudioFileWriterIfNeed];
  id v3 = objc_alloc((Class)CSPlainAudioFileWriter);
  id v4 = [(CSAttSiriMagusLoggingNode *)self _createAudioLogPathByFileName:self->_startTimestampString];
  v5 = +[NSURL URLWithString:v4];
  v6 = (CSAudioFileWriter *)[v3 initWithURL:v5];
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v6;

  self->_unint64_t previousLoggedSampleCount = 0;
}

- (void)_handleMagusStopLogging
{
  id v3 = [(CSAttSiriMagusLoggingNode *)self _timeStampString];
  stopTimestampString = self->_stopTimestampString;
  self->_stopTimestampString = v3;

  self->_stopMachAbsTime = mach_absolute_time();
  [(CSAttSiriMagusLoggingNode *)self _stopAudioLogging];
  [(CSAttSiriMagusLoggingNode *)self _logMotionSignals];
  [(CSAttSiriMagusLoggingNode *)self _logMetadata];
  [(CSAttSiriMagusLoggingNode *)self _logGazeInstaneousSignals];
  [(CSAttSiriMagusLoggingNode *)self _logGazeDetection];
  [(CSAttSiriMagusLoggingNode *)self _logAttentionSignals];
  [(CSAttSiriMagusLoggingNode *)self _logVisualSpeechEstimationSignals];
  [(CSAttSiriMagusLoggingNode *)self _logVisualSpeechQuerySignals];
  [(CSAttSiriMagusLoggingNode *)self _logFaceLandmarks];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    mhId = self->_mhId;
    int v7 = 136315394;
    BOOL v8 = "-[CSAttSiriMagusLoggingNode _handleMagusStopLogging]";
    __int16 v9 = 2112;
    id v10 = mhId;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Using MHId %@ for logging", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_createJsonLogPathBySignalType:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"%@-%@.json", self->_mhId, a3];
  v5 = [(NSString *)self->_magusLogDirectory stringByAppendingPathComponent:v4];

  return v5;
}

- (id)_createAudioLogPathByFileName:(id)a3
{
  magusLogDirectory = self->_magusLogDirectory;
  id v4 = +[NSString stringWithFormat:@"%@-vad.wav", a3];
  v5 = [(NSString *)magusLogDirectory stringByAppendingPathComponent:v4];

  return v5;
}

- (void)_setupLogDirectory
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = +[CSFPreferences sharedPreferences];
  v5 = [v4 mhLogDirectory];
  magusLogDirectory = self->_magusLogDirectory;
  self->_magusLogDirectory = v5;

  if ([v3 fileExistsAtPath:self->_magusLogDirectory])
  {
    id v7 = 0;
  }
  else
  {
    BOOL v8 = self->_magusLogDirectory;
    id v15 = 0;
    unsigned __int8 v9 = [v3 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v7 = v15;
    if ((v9 & 1) == 0)
    {
      id v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v12 = self->_magusLogDirectory;
        int v13 = v10;
        id v14 = [v7 localizedDescription];
        *(_DWORD *)buf = 136315650;
        __int16 v17 = "-[CSAttSiriMagusLoggingNode _setupLogDirectory]";
        __int16 v18 = 2114;
        id v19 = v12;
        __int16 v20 = 2114;
        __int16 v21 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Couldn't create magus logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      v11 = self->_magusLogDirectory;
      self->_magusLogDirectory = (NSString *)@"/tmp";
    }
  }
}

- (void)visualSpeechLandmarkUpdate:(id)a3 time:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000919A4;
    block[3] = &unk_1002532A8;
    unint64_t v13 = a4;
    id v11 = v6;
    id v12 = self;
    dispatch_async(queue, block);
  }
  else
  {
    unsigned __int8 v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[CSAttSiriMagusLoggingNode visualSpeechLandmarkUpdate:time:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s faceLandmarks are nil!", buf, 0xCu);
    }
  }
}

- (void)gazeInInterval:(BOOL)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100091AEC;
  v6[3] = &unk_100250110;
  BOOL v7 = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = self;
  dispatch_async(queue, v6);
}

- (void)gazePointUpdate:(CGPoint)a3 areaOfInterest:(CGRect)a4 gazeState:(BOOL)a5 atTime:(unint64_t)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100091CE8;
  v7[3] = &unk_1002500E8;
  BOOL v10 = a5;
  CGPoint v8 = a3;
  CGRect v9 = a4;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)attSiriNode:(id)a3 didUpdateMotionSignal:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100092024;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000920CC;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  BOOL v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092390;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setAudioRecordContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092434;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000924EC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009262C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttSiriMagusLoggingNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v13 = "-[CSAttSiriMagusLoggingNode initWithAttSiriController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)CSAttSiriMagusLoggingNode;
  id v6 = [(CSAttSiriMagusLoggingNode *)&v11 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSAttSiriMagusLoggingNode queue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_isReady = 0;
    requiredNodes = v6->_requiredNodes;
    v6->_type = 17;
    v6->_requiredNodes = (NSArray *)&off_10025E778;

    objc_storeWeak((id *)&v6->_attSiriController, v4);
    v6->_didStop = 1;
    [(CSAttSiriMagusLoggingNode *)v6 _setupLogDirectory];
  }

  return v6;
}

@end