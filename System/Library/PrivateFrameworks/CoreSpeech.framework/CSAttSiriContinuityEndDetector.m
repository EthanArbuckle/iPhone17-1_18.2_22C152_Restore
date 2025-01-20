@interface CSAttSiriContinuityEndDetector
- (BOOL)configureContinuityWindowTimeout;
- (BOOL)continuityEndDelivered;
- (BOOL)continuityEndDeliveryNeeded;
- (CSAttSiriContinuityEndDetector)init;
- (CSAttSiriRecognitionCompletionCachedInfo)cachedRecognitionCompletionInfo;
- (CSAttSiriTimer)continuityDetectorTimer;
- (NSHashTable)continuityDetectionReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSString)cachedTRPId;
- (NSString)requestId;
- (OS_dispatch_queue)queue;
- (float)continuityTimeoutWindowInSec;
- (void)_deliverRecognitionCompletionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)_handleContinuityDetectorTimeout;
- (void)_notifyContinuityEnd;
- (void)_setupContinuityDetectorTimer;
- (void)addContinuityDetectionReceiver:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)configureTimeout:(float)a3;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didGenerateTRPDetector:(id)a3;
- (void)didReceiveTRPCandidateExecutionReady:(id)a3 withTrpId:(id)a4;
- (void)setCachedRecognitionCompletionInfo:(id)a3;
- (void)setCachedTRPId:(id)a3;
- (void)setConfigureContinuityWindowTimeout:(BOOL)a3;
- (void)setContinuityDetectionReceivers:(id)a3;
- (void)setContinuityDetectorTimer:(id)a3;
- (void)setContinuityEndDelivered:(BOOL)a3;
- (void)setContinuityEndDeliveryNeeded:(BOOL)a3;
- (void)setContinuityTimeoutWindowInSec:(float)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setUpWithContinuityEndUsage:(BOOL)a3;
- (void)start;
@end

@implementation CSAttSiriContinuityEndDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecognitionCompletionInfo, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_cachedTRPId, 0);
  objc_storeStrong((id *)&self->_recognitionTaskCompletionReceivers, 0);
  objc_storeStrong((id *)&self->_continuityDetectionReceivers, 0);
  objc_storeStrong((id *)&self->_continuityDetectorTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setContinuityEndDelivered:(BOOL)a3
{
  self->_continuityEndDelivered = a3;
}

- (BOOL)continuityEndDelivered
{
  return self->_continuityEndDelivered;
}

- (void)setCachedRecognitionCompletionInfo:(id)a3
{
}

- (CSAttSiriRecognitionCompletionCachedInfo)cachedRecognitionCompletionInfo
{
  return self->_cachedRecognitionCompletionInfo;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setCachedTRPId:(id)a3
{
}

- (NSString)cachedTRPId
{
  return self->_cachedTRPId;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setContinuityDetectionReceivers:(id)a3
{
}

- (NSHashTable)continuityDetectionReceivers
{
  return self->_continuityDetectionReceivers;
}

- (void)setConfigureContinuityWindowTimeout:(BOOL)a3
{
  self->_configureContinuityWindowTimeout = a3;
}

- (BOOL)configureContinuityWindowTimeout
{
  return self->_configureContinuityWindowTimeout;
}

- (void)setContinuityTimeoutWindowInSec:(float)a3
{
  self->_continuityTimeoutWindowInSec = a3;
}

- (float)continuityTimeoutWindowInSec
{
  return self->_continuityTimeoutWindowInSec;
}

- (void)setContinuityDetectorTimer:(id)a3
{
}

- (CSAttSiriTimer)continuityDetectorTimer
{
  return self->_continuityDetectorTimer;
}

- (void)setContinuityEndDeliveryNeeded:(BOOL)a3
{
  self->_continuityEndDeliveryNeeded = a3;
}

- (BOOL)continuityEndDeliveryNeeded
{
  return self->_continuityEndDeliveryNeeded;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100165F84;
  block[3] = &unk_100253418;
  block[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  int64_t v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (void)didReceiveTRPCandidateExecutionReady:(id)a3 withTrpId:(id)a4
{
}

- (void)didGenerateTRPDetector:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100166280;
  id v10 = &unk_100253B08;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(queue, &v7);
  [(CSAttSiriContinuityEndDetector *)self start];
}

- (void)_deliverRecognitionCompletionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[CSAttSiriContinuityEndDetector _deliverRecognitionCompletionWithStatistics:requestId:endpointMode:error:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = [(CSAttSiriContinuityEndDetector *)self recognitionTaskCompletionReceivers];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v18);
        if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v19 didCompleteRecognitionTaskWithStatistics:v10 requestId:v11 endpointMode:a5 error:v12];
        }
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (void)_notifyContinuityEnd
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v3 = (void *)qword_1002A3C68;
  uint64_t v27 = qword_1002A3C68;
  if (!qword_1002A3C68)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100166748;
    v23[3] = &unk_100253440;
    v23[4] = &v24;
    sub_100166748((uint64_t)v23);
    v3 = (void *)v25[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v24, 8);
  id v5 = [v4 alloc];
  uint64_t v6 = mach_continuous_time();
  v7 = [(CSAttSiriContinuityEndDetector *)self cachedTRPId];
  id v8 = [v5 initWithGeneratedHostTime:v6 lastTRPCandidateId:v7 requestId:self->_requestId];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(CSAttSiriContinuityEndDetector *)self continuityDetectionReceivers];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v13 didGenerateContinuityEnd:v8];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v10);
  }

  self->_continuityEndDelivered = 1;
  cachedRecognitionCompletionInfo = self->_cachedRecognitionCompletionInfo;
  if (cachedRecognitionCompletionInfo)
  {
    id v15 = [(CSAttSiriRecognitionCompletionCachedInfo *)cachedRecognitionCompletionInfo statistics];
    id v16 = [(CSAttSiriRecognitionCompletionCachedInfo *)self->_cachedRecognitionCompletionInfo requestId];
    int64_t v17 = [(CSAttSiriRecognitionCompletionCachedInfo *)self->_cachedRecognitionCompletionInfo endpointMode];
    id v18 = [(CSAttSiriRecognitionCompletionCachedInfo *)self->_cachedRecognitionCompletionInfo completionError];
    [(CSAttSiriContinuityEndDetector *)self _deliverRecognitionCompletionWithStatistics:v15 requestId:v16 endpointMode:v17 error:v18];
  }
}

- (void)_handleContinuityDetectorTimeout
{
  v3 = [(CSAttSiriContinuityEndDetector *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSAttSiriContinuityEndDetector *)self _notifyContinuityEnd];
}

- (void)_setupContinuityDetectorTimer
{
  continuityDetectorTimer = self->_continuityDetectorTimer;
  if (continuityDetectorTimer)
  {
    [(CSAttSiriTimer *)continuityDetectorTimer cancelTimer];
    id v4 = self->_continuityDetectorTimer;
    self->_continuityDetectorTimer = 0;
  }
  objc_initWeak(&location, self);
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double continuityTimeoutWindowInSec = self->_continuityTimeoutWindowInSec;
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSAttSiriContinuityEndDetector _setupContinuityDetectorTimer]";
    __int16 v14 = 2048;
    double v15 = continuityTimeoutWindowInSec;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Setup continuity timer for duration %f secs", buf, 0x16u);
  }
  v7 = self->_continuityDetectorTimer;
  float v8 = self->_continuityTimeoutWindowInSec;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100166AE4;
  v9[3] = &unk_1002533D0;
  objc_copyWeak(&v10, &location);
  [(CSAttSiriTimer *)v7 setTimerForSecs:v9 completionBlock:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriContinuityEndDetector *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100166C58;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addContinuityDetectionReceiver:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriContinuityEndDetector *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100166DA8;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setUpWithContinuityEndUsage:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100166EBC;
  v4[3] = &unk_100253AB8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100167050;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)configureTimeout:(float)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001671A0;
  v4[3] = &unk_1002533A8;
  float v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (CSAttSiriContinuityEndDetector)init
{
  if (+[CSUtils isMedocFeatureEnabled])
  {
    v17.receiver = self;
    v17.super_class = (Class)CSAttSiriContinuityEndDetector;
    v3 = [(CSAttSiriContinuityEndDetector *)&v17 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("CSAttSiriContinuityEndDetector queue", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

      v3->_continuityEndDeliveryNeeded = 0;
      uint64_t v6 = +[NSHashTable weakObjectsHashTable];
      continuityDetectionReceivers = v3->_continuityDetectionReceivers;
      v3->_continuityDetectionReceivers = (NSHashTable *)v6;

      uint64_t v8 = +[NSHashTable weakObjectsHashTable];
      recognitionTaskCompletionReceivers = v3->_recognitionTaskCompletionReceivers;
      v3->_recognitionTaskCompletionReceivers = (NSHashTable *)v8;

      cachedRecognitionCompletionInfo = v3->_cachedRecognitionCompletionInfo;
      v3->_cachedRecognitionCompletionInfo = 0;

      v3->_continuityEndDelivered = 0;
      requestId = v3->_requestId;
      v3->_requestId = 0;

      cachedTRPId = v3->_cachedTRPId;
      v3->_cachedTRPId = 0;

      v3->_configureContinuityWindowTimeout = 0;
    }
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v19 = "-[CSAttSiriContinuityEndDetector init]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    self = v3;
    __int16 v14 = self;
  }
  else
  {
    double v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v19 = "-[CSAttSiriContinuityEndDetector init]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Medoc feature flag is disabled!", buf, 0xCu);
    }
    __int16 v14 = 0;
  }

  return v14;
}

@end