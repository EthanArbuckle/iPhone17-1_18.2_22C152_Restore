@interface AWSampleLogger
+ (id)sharedLogger;
+ (void)client:(id)a3 attentionStateChange:(BOOL)a4;
+ (void)client:(id)a3 event:(id)a4;
+ (void)client:(id)a3 pollEventType:(unint64_t)a4 event:(id)a5;
- (AWSampleLogger)init;
- (void)_logFeatureEnablement;
- (void)_outputPowerLog;
- (void)outputPowerLog;
- (void)powerLogName:(id)a3 event:(id)a4;
- (void)sampleStartedWithDeadline:(unint64_t)a3;
- (void)sampleSucceeded;
- (void)shouldSample:(BOOL)a3;
- (void)streamingCompleteWithidentifier:(id)a3 duration:(unint64_t)a4 ERActivated:(BOOL)a5;
- (void)updateDataForClient:(id)a3 deadline:(unint64_t)a4;
@end

@implementation AWSampleLogger

- (void)shouldSample:(BOOL)a3
{
  BOOL v37 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  location = (id *)&self->_outstandingClientLogData;
  obj = self->_outstandingClientLogData;
  uint64_t v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    uint64_t v38 = *(void *)v42;
    do
    {
      uint64_t v7 = 0;
      uint64_t v39 = v5;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v41 + 1) + 8 * v7);
        if (-[NSMutableSet containsObject:](self->_addedClientLogData, "containsObject:", v8, location)) {
          goto LABEL_21;
        }
        unint64_t v9 = absTimeNS();
        unint64_t v10 = v9 - [v8 samplingStartTime];
        objc_msgSend(v8, "setCumulativeSamplingTime:", objc_msgSend(v8, "cumulativeSamplingTime") + v10);
        [v8 setSamplingStartTime:0];
        v55[0] = @"identifier";
        v11 = [v8 identifier];
        v56[0] = v11;
        v55[1] = @"samplingInterval";
        v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "samplingInterval"));
        v56[1] = v12;
        v55[2] = @"pollingClient";
        v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "pollingClient"));
        v56[2] = v13;
        v55[3] = @"sampleSucceeded";
        v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "sampleSucceeded"));
        v56[3] = v14;
        v55[4] = @"sampleDuration";
        v15 = [NSNumber numberWithUnsignedLongLong:v10 / 0xF4240];
        v56[4] = v15;
        v55[5] = @"activateMotionDetect";
        v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "activateMotionDetect"));
        v56[5] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:6];

        if (currentLogLevel < 7) {
          goto LABEL_20;
        }
        v18 = _AALog();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        v19 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
              *(i - 1) == 47;
              ++i)
        {
          v19 = i;
LABEL_14:
          ;
        }
        if (*(i - 1)) {
          goto LABEL_14;
        }
        unint64_t v21 = absTimeNS();
        if (v21 == -1) {
          double v22 = INFINITY;
        }
        else {
          double v22 = (double)v21 / 1000000000.0;
        }
        *(_DWORD *)buf = 136316162;
        v46 = v19;
        __int16 v47 = 1024;
        int v48 = 260;
        __int16 v49 = 2048;
        double v50 = v22;
        __int16 v51 = 2112;
        v52 = @"com.apple.AttentionAwareness.clientSamplingEnded";
        __int16 v53 = 2112;
        v54 = v17;
        _os_log_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x30u);
LABEL_19:

LABEL_20:
        AnalyticsSendEvent();

        uint64_t v6 = v38;
        uint64_t v5 = v39;
LABEL_21:
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v5);
  }

  outstandingClientLogData = self->_outstandingClientLogData;
  v24 = outstandingClientLogData;
  objc_storeStrong(location, self->_addedClientLogData);
  objc_storeStrong((id *)&self->_addedClientLogData, outstandingClientLogData);
  [(NSMutableSet *)self->_addedClientLogData removeAllObjects];
  unint64_t samplingStartTime = self->_samplingStartTime;
  if (v37)
  {
    if (!samplingStartTime)
    {
      self->_unint64_t samplingStartTime = absTimeNS();
      if (currentLogLevel >= 7)
      {
        v26 = _AALog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
          for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
                ;
                ++j)
          {
            if (*(j - 1) == 47)
            {
              v27 = j;
            }
            else if (!*(j - 1))
            {
              unint64_t v34 = absTimeNS();
              if (v34 == -1) {
                double v35 = INFINITY;
              }
              else {
                double v35 = (double)v34 / 1000000000.0;
              }
              *(_DWORD *)buf = 136316162;
              v46 = v27;
              __int16 v47 = 1024;
              int v48 = 277;
              __int16 v49 = 2048;
              double v50 = v35;
              __int16 v51 = 2112;
              v52 = @"com.apple.AttentionAwareness.sampleStarted";
              __int16 v53 = 2112;
              v54 = (void *)MEMORY[0x1E4F1CC08];
              goto LABEL_52;
            }
          }
        }
LABEL_53:
      }
LABEL_54:
      AnalyticsSendEvent();
    }
  }
  else if (samplingStartTime)
  {
    unint64_t v29 = absTimeNS() - self->_samplingStartTime + self->_cumulativeSamplingTime;
    self->_unint64_t samplingStartTime = 0;
    self->_cumulativeSamplingTime = v29;
    if (currentLogLevel >= 7)
    {
      v26 = _AALog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
      v30 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
      for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
            ;
            ++k)
      {
        if (*(k - 1) == 47)
        {
          v30 = k;
        }
        else if (!*(k - 1))
        {
          unint64_t v32 = absTimeNS();
          if (v32 == -1) {
            double v33 = INFINITY;
          }
          else {
            double v33 = (double)v32 / 1000000000.0;
          }
          *(_DWORD *)buf = 136316162;
          v46 = v30;
          __int16 v47 = 1024;
          int v48 = 287;
          __int16 v49 = 2048;
          double v50 = v33;
          __int16 v51 = 2112;
          v52 = @"com.apple.AttentionAwareness.sampleEnded";
          __int16 v53 = 2112;
          v54 = (void *)MEMORY[0x1E4F1CC08];
LABEL_52:
          _os_log_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x30u);
          goto LABEL_53;
        }
      }
    }
    goto LABEL_54;
  }
}

+ (void)client:(id)a3 event:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v5 identifier];
  [v7 setObject:v8 forKeyedSubscript:@"identifier"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "eventMask"));
  [v7 setObject:v9 forKeyedSubscript:@"eventMask"];

  if ([v6 eventMask] == 1)
  {
    unint64_t v10 = NSNumber;
    [v6 attentionLostTimeout];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v7 setObject:v11 forKeyedSubscript:@"attentionLostTimeout"];
  }
  id v12 = v7;
  if (currentLogLevel < 7) {
    goto LABEL_16;
  }
  v13 = _AALog();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_15;
  }
  v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(i - 1) == 47;
        ++i)
  {
    v14 = i;
LABEL_10:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_10;
  }
  unint64_t v16 = absTimeNS();
  if (v16 == -1) {
    double v17 = INFINITY;
  }
  else {
    double v17 = (double)v16 / 1000000000.0;
  }
  int v18 = 136316162;
  v19 = v14;
  __int16 v20 = 1024;
  int v21 = 339;
  __int16 v22 = 2048;
  double v23 = v17;
  __int16 v24 = 2112;
  v25 = @"com.apple.AttentionAwareness.clientEvent";
  __int16 v26 = 2112;
  id v27 = v12;
  _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v18, 0x30u);
LABEL_15:

LABEL_16:
  AnalyticsSendEvent();
}

+ (void)client:(id)a3 attentionStateChange:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = @"com.apple.AttentionAwareness.clientStateNegative";
  if (v4) {
    id v6 = @"com.apple.AttentionAwareness.clientStatePositive";
  }
  uint64_t v7 = v6;
  __int16 v26 = @"identifier";
  v8 = [v5 identifier];
  v27[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];

  id v10 = v9;
  if (currentLogLevel < 7) {
    goto LABEL_16;
  }
  v11 = _AALog();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_15;
  }
  id v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(i - 1) == 47;
        ++i)
  {
    id v12 = i;
LABEL_10:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_10;
  }
  unint64_t v14 = absTimeNS();
  if (v14 == -1) {
    double v15 = INFINITY;
  }
  else {
    double v15 = (double)v14 / 1000000000.0;
  }
  int v16 = 136316162;
  double v17 = v12;
  __int16 v18 = 1024;
  int v19 = 326;
  __int16 v20 = 2048;
  double v21 = v15;
  __int16 v22 = 2112;
  double v23 = v7;
  __int16 v24 = 2112;
  id v25 = v10;
  _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v16, 0x30u);
LABEL_15:

LABEL_16:
  AnalyticsSendEvent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_addedClientLogData, 0);
  objc_storeStrong((id *)&self->_outstandingClientLogData, 0);
  objc_storeStrong((id *)&self->_clientLogData, 0);
  objc_storeStrong((id *)&self->_powerLogQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sampleSucceeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_samplesSucceeded;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_outstandingClientLogData;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_addedClientLogData, "containsObject:", v8, (void)v15) & 1) == 0) {
          [v8 setSampleSucceeded:1];
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v15 objects:v29 count:16];
    }
    while (v5);
  }

  if (currentLogLevel < 7) {
    goto LABEL_23;
  }
  unint64_t v9 = _AALog();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_22;
  }
  uint64_t v10 = MEMORY[0x1E4F1CC08];
  v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(j - 1) == 47;
        ++j)
  {
    v11 = j;
LABEL_17:
    ;
  }
  if (*(j - 1)) {
    goto LABEL_17;
  }
  unint64_t v13 = absTimeNS();
  if (v13 == -1) {
    double v14 = INFINITY;
  }
  else {
    double v14 = (double)v13 / 1000000000.0;
  }
  *(_DWORD *)buf = 136316162;
  __int16 v20 = v11;
  __int16 v21 = 1024;
  int v22 = 319;
  __int16 v23 = 2048;
  double v24 = v14;
  __int16 v25 = 2112;
  __int16 v26 = @"com.apple.AttentionAwareness.sampleSucceeded";
  __int16 v27 = 2112;
  uint64_t v28 = v10;
  _os_log_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x30u);
LABEL_22:

LABEL_23:
  AnalyticsSendEvent();
}

- (void)sampleStartedWithDeadline:(unint64_t)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_samplesRequested;
  if (!a3)
  {
    if (currentLogLevel < 7) {
      goto LABEL_29;
    }
    uint64_t v10 = _AALog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    v11 = (void *)MEMORY[0x1E4F1CC08];
    id v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
    for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        id v12 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        int v18 = 136316162;
        int v19 = v12;
        __int16 v20 = 1024;
        int v21 = 304;
        __int16 v22 = 2048;
        double v23 = v17;
        __int16 v24 = 2112;
        __int16 v25 = @"com.apple.AttentionAwareness.singleShotRequested";
        __int16 v26 = 2112;
        __int16 v27 = v11;
        _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v18, 0x30u);
LABEL_28:

LABEL_29:
        AnalyticsSendEvent();
        return;
      }
    }
  }
  ++self->_pollsRequested;
  uint64_t v28 = @"deadline";
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3];
  v29[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

  if (currentLogLevel < 7) {
    goto LABEL_25;
  }
  uint64_t v7 = _AALog();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_24;
  }
  v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(j - 1) == 47;
        ++j)
  {
    v8 = j;
LABEL_9:
    ;
  }
  if (*(j - 1)) {
    goto LABEL_9;
  }
  unint64_t v14 = absTimeNS();
  if (v14 == -1) {
    double v15 = INFINITY;
  }
  else {
    double v15 = (double)v14 / 1000000000.0;
  }
  int v18 = 136316162;
  int v19 = v8;
  __int16 v20 = 1024;
  int v21 = 299;
  __int16 v22 = 2048;
  double v23 = v15;
  __int16 v24 = 2112;
  __int16 v25 = @"com.apple.AttentionAwareness.pollRequested";
  __int16 v26 = 2112;
  __int16 v27 = v6;
  _os_log_impl(&dword_1B3B4B000, v7, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v18, 0x30u);
LABEL_24:

LABEL_25:
  AnalyticsSendEvent();
}

- (void)updateDataForClient:(id)a3 deadline:(unint64_t)a4
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v6 samplingInterval];
  }
  v8 = [v6 identifier];
  v36[0] = v8;
  unint64_t v9 = [NSNumber numberWithUnsignedLongLong:v7];
  v36[1] = v9;
  uint64_t v10 = [NSNumber numberWithBool:a4 != 0];
  v36[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];

  id v12 = [(NSMutableDictionary *)self->_clientLogData objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v12 = objc_alloc_init(AWSampleLogData);
    unint64_t v13 = [v6 identifier];
    [(AWSampleLogData *)v12 setIdentifier:v13];

    [(AWSampleLogData *)v12 setSamplingInterval:v7];
    [(AWSampleLogData *)v12 setPollingClient:a4 != 0];
    -[AWSampleLogData setActivateMotionDetect:](v12, "setActivateMotionDetect:", [v6 activateMotionDetect]);
    [(NSMutableDictionary *)self->_clientLogData setObject:v12 forKeyedSubscript:v11];
  }
  [(AWSampleLogData *)v12 setSampleSucceeded:0];
  if ([(AWSampleLogData *)v12 samplingStartTime]) {
    goto LABEL_21;
  }
  [(AWSampleLogData *)v12 setSamplingStartTime:absTimeNS()];
  v34[0] = @"identifier";
  unint64_t v14 = [(AWSampleLogData *)v12 identifier];
  v35[0] = v14;
  v34[1] = @"samplingInterval";
  double v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWSampleLogData samplingInterval](v12, "samplingInterval"));
  v35[1] = v15;
  v34[2] = @"pollingClient";
  unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[AWSampleLogData pollingClient](v12, "pollingClient"));
  v35[2] = v16;
  v34[3] = @"pollingDeadline";
  double v17 = [NSNumber numberWithUnsignedLongLong:a4];
  v35[3] = v17;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];

  if (currentLogLevel < 7) {
    goto LABEL_20;
  }
  int v19 = _AALog();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_19;
  }
  __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(i - 1) == 47;
        ++i)
  {
    __int16 v20 = i;
LABEL_14:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_14;
  }
  unint64_t v22 = absTimeNS();
  if (v22 == -1) {
    double v23 = INFINITY;
  }
  else {
    double v23 = (double)v22 / 1000000000.0;
  }
  int v24 = 136316162;
  __int16 v25 = v20;
  __int16 v26 = 1024;
  int v27 = 232;
  __int16 v28 = 2048;
  double v29 = v23;
  __int16 v30 = 2112;
  v31 = @"com.apple.AttentionAwareness.clientSamplingStarted";
  __int16 v32 = 2112;
  double v33 = v18;
  _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v24, 0x30u);
LABEL_19:

LABEL_20:
  AnalyticsSendEvent();

LABEL_21:
  [(NSMutableSet *)self->_addedClientLogData addObject:v12];
}

- (void)powerLogName:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  powerLogQueue = self->_powerLogQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__AWSampleLogger_powerLogName_event___block_invoke;
  v11[3] = &unk_1E606AC98;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(powerLogQueue, v11);
}

void __37__AWSampleLogger_powerLogName_event___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel == 5)
  {
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = absTimeNS();
      if (v3 == -1) {
        double v4 = INFINITY;
      }
      else {
        double v4 = (double)v3 / 1000000000.0;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      double v24 = v4;
      __int16 v25 = 2112;
      *(void *)__int16 v26 = v9;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v10;
      v11 = "%13.5f: PowerLog %@ %@";
      id v12 = v2;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          uint64_t v5 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v7 = absTimeNS();
          if (v7 == -1) {
            double v8 = INFINITY;
          }
          else {
            double v8 = (double)v7 / 1000000000.0;
          }
          uint64_t v14 = *(void *)(a1 + 32);
          double v15 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          double v24 = *(double *)&v5;
          __int16 v25 = 1024;
          *(_DWORD *)__int16 v26 = 183;
          *(_WORD *)&v26[4] = 2048;
          *(double *)&v26[6] = v8;
          *(_WORD *)&v26[14] = 2112;
          *(void *)&v26[16] = v14;
          __int16 v27 = 2112;
          id v28 = v15;
          v11 = "%30s:%-4d: %13.5f: PowerLog %@ %@";
          id v12 = v2;
          uint32_t v13 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v16 = [NSString stringWithFormat:@"com.apple.AttentionAwareness.PowerLog.%@", *(void *)(a1 + 32)];
  id v17 = *(id *)(a1 + 40);
  if (currentLogLevel <= 6) {
    goto LABEL_34;
  }
  int v18 = _AALog();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_33;
  }
  int v19 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(j - 1) == 47;
        ++j)
  {
    int v19 = j;
LABEL_28:
    ;
  }
  if (*(j - 1)) {
    goto LABEL_28;
  }
  unint64_t v21 = absTimeNS();
  if (v21 == -1) {
    double v22 = INFINITY;
  }
  else {
    double v22 = (double)v21 / 1000000000.0;
  }
  *(_DWORD *)buf = 136316162;
  double v24 = *(double *)&v19;
  __int16 v25 = 1024;
  *(_DWORD *)__int16 v26 = 185;
  *(_WORD *)&v26[4] = 2048;
  *(double *)&v26[6] = v22;
  *(_WORD *)&v26[14] = 2112;
  *(void *)&v26[16] = v16;
  __int16 v27 = 2112;
  id v28 = v17;
  _os_log_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x30u);
LABEL_33:

LABEL_34:
  AnalyticsSendEvent();

  PLLogTimeSensitiveRegisteredEvent();
}

- (void)outputPowerLog
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AWSampleLogger_outputPowerLog__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __32__AWSampleLogger_outputPowerLog__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _outputPowerLog];
}

- (void)_outputPowerLog
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v26 = self;
  id obj = [(NSMutableDictionary *)self->_clientLogData allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  unint64_t v4 = 0x1E4F28000uLL;
  unint64_t v5 = 0x1E4F1C000uLL;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v9 cumulativeSamplingTime])
        {
          if ([v9 pollingClient])
          {
            v35[0] = @"client";
            uint64_t v10 = [v9 identifier];
            v35[1] = @"cumulativeSamplingTimeMS";
            v36[0] = v10;
            v11 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v9, "cumulativeSamplingTime") / 0xF4240uLL);
            v36[1] = v11;
            id v12 = [*(id *)(v5 + 2536) dictionaryWithObjects:v36 forKeys:v35 count:2];
            [(AWSampleLogger *)v26 powerLogName:@"PollingAggregation" event:v12];
          }
          else
          {
            v33[0] = @"client";
            uint64_t v10 = [v9 identifier];
            v34[0] = v10;
            v33[1] = @"samplingRateMS";
            v11 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v9, "samplingInterval") / 0xF4240uLL);
            v34[1] = v11;
            v33[2] = @"cumulativeSamplingTimeMS";
            id v12 = objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v9, "cumulativeSamplingTime") / 0xF4240uLL);
            v34[2] = v12;
            [*(id *)(v5 + 2536) dictionaryWithObjects:v34 forKeys:v33 count:3];
            unint64_t v13 = v4;
            v15 = unint64_t v14 = v5;
            [(AWSampleLogger *)v26 powerLogName:@"SamplingAggregation" event:v15];

            unint64_t v5 = v14;
            unint64_t v4 = v13;
          }

          [v9 setCumulativeSamplingTime:0];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v6);
  }

  v31[0] = @"cumulativeSamplingTimeMS";
  unint64_t v16 = *(void **)(v4 + 3792);
  unint64_t v17 = v4;
  int v18 = v26;
  int v19 = [v16 numberWithUnsignedLongLong:v26->_cumulativeSamplingTime / 0xF4240];
  v32[0] = v19;
  v31[1] = @"pollsRequested";
  __int16 v20 = [*(id *)(v17 + 3792) numberWithUnsignedLongLong:v26->_pollsRequested];
  v32[1] = v20;
  v31[2] = @"singleShotsRequested";
  unint64_t v21 = [*(id *)(v17 + 3792) numberWithUnsignedLongLong:v18->_samplesRequested - v18->_pollsRequested];
  v32[2] = v21;
  v31[3] = @"positiveOutcomes";
  double v22 = [*(id *)(v17 + 3792) numberWithUnsignedLongLong:v26->_samplesSucceeded];
  v32[3] = v22;
  v31[4] = @"negativeOutcomes";
  double v23 = [*(id *)(v17 + 3792) numberWithUnsignedLongLong:v18->_samplesRequested - v18->_samplesSucceeded];
  v32[4] = v23;
  double v24 = [*(id *)(v5 + 2536) dictionaryWithObjects:v32 forKeys:v31 count:5];
  [(AWSampleLogger *)v26 powerLogName:@"ServiceAggregation" event:v24];

  *(_OWORD *)&v26->_cumulativeSamplingTime = 0u;
  *(_OWORD *)&v26->_pollsRequested = 0u;
}

- (void)streamingCompleteWithidentifier:(id)a3 duration:(unint64_t)a4 ERActivated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    uint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = absTimeNS();
      if (v10 == -1) {
        double v11 = INFINITY;
      }
      else {
        double v11 = (double)v10 / 1000000000.0;
      }
      int v22 = 134218754;
      double v23 = v11;
      __int16 v24 = 2048;
      *(void *)__int16 v25 = a4;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v8;
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = v5;
      unint64_t v16 = "%13.5f: Streaming complete. duration: %llu identifier: %@ ERActivated: %d";
      unint64_t v17 = v9;
      uint32_t v18 = 38;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v12 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v14 = absTimeNS();
          if (v14 == -1) {
            double v15 = INFINITY;
          }
          else {
            double v15 = (double)v14 / 1000000000.0;
          }
          int v22 = 136316418;
          double v23 = *(double *)&v12;
          __int16 v24 = 1024;
          *(_DWORD *)__int16 v25 = 116;
          *(_WORD *)&v25[4] = 2048;
          *(double *)&v25[6] = v15;
          *(_WORD *)&v25[14] = 2048;
          *(void *)&v25[16] = a4;
          __int16 v26 = 2112;
          id v27 = v8;
          __int16 v28 = 1024;
          BOOL v29 = v5;
          unint64_t v16 = "%30s:%-4d: %13.5f: Streaming complete. duration: %llu identifier: %@ ERActivated: %d";
          unint64_t v17 = v9;
          uint32_t v18 = 54;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  id v20 = v8;
  unint64_t v21 = (const char *)[v20 UTF8String];
  xpc_dictionary_set_int64(v19, "StreamingInterval", a4);
  xpc_dictionary_set_string(v19, "identifier", v21);
  xpc_dictionary_set_BOOL(v19, "ERActivated", v5);
  analytics_send_event();
}

- (void)_logFeatureEnablement
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (AVGestaltGetBoolAnswer())
  {
    int v2 = _AXSAttentionAwarenessFeaturesEnabled();
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "FeatureEnabled", v2 != 0);
    if (currentLogLevel == 5)
    {
      unint64_t v4 = _AALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v5 = absTimeNS();
        if (v5 == -1) {
          double v6 = INFINITY;
        }
        else {
          double v6 = (double)v5 / 1000000000.0;
        }
        int v14 = 134218240;
        double v15 = v6;
        __int16 v16 = 1024;
        int v17 = v2 != 0;
        double v11 = "%13.5f: Logging Attention Aware Features enabled: %d";
        id v12 = v4;
        uint32_t v13 = 18;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        analytics_send_event();

        return;
      }
      unint64_t v4 = _AALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v7 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v9 = absTimeNS();
            if (v9 == -1) {
              double v10 = INFINITY;
            }
            else {
              double v10 = (double)v9 / 1000000000.0;
            }
            int v14 = 136315906;
            double v15 = *(double *)&v7;
            __int16 v16 = 1024;
            int v17 = 107;
            __int16 v18 = 2048;
            double v19 = v10;
            __int16 v20 = 1024;
            BOOL v21 = v2 != 0;
            double v11 = "%30s:%-4d: %13.5f: Logging Attention Aware Features enabled: %d";
            id v12 = v4;
            uint32_t v13 = 34;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
}

- (AWSampleLogger)init
{
  v21.receiver = self;
  v21.super_class = (Class)AWSampleLogger;
  id v2 = [(AWSampleLogger *)&v21 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    unint64_t v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AttentionAwareness.PowerLog", 0);
    double v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    double v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    id v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 1));
    int v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    double v15 = *((void *)v2 + 6);
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    dispatch_source_set_timer(v15, v16, 0x34630B8A000uLL, 0x6FC23AC00uLL);
    int v17 = *((void *)v2 + 6);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __22__AWSampleLogger_init__block_invoke;
    handler[3] = &unk_1E606AC70;
    id v20 = v2;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
  }
  return (AWSampleLogger *)v2;
}

uint64_t __22__AWSampleLogger_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _outputPowerLog];
  id v2 = *(void **)(a1 + 32);

  return [v2 _logFeatureEnablement];
}

+ (void)client:(id)a3 pollEventType:(unint64_t)a4 event:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  double v10 = [v7 configuration];
  uint64_t v11 = [v10 identifier];
  [v9 setObject:v11 forKeyedSubscript:@"identifier"];

  id v12 = [NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v12 forKeyedSubscript:@"pollEventType"];

  if (a4 == 2)
  {
    dispatch_source_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "eventMask"));
    [v9 setObject:v13 forKeyedSubscript:@"pollEventMask"];
  }
  id v14 = v9;
  if (currentLogLevel < 7) {
    goto LABEL_16;
  }
  double v15 = _AALog();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_15;
  }
  dispatch_time_t v16 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/SampleLogger.m";
        *(i - 1) == 47;
        ++i)
  {
    dispatch_time_t v16 = i;
LABEL_10:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_10;
  }
  unint64_t v18 = absTimeNS();
  if (v18 == -1) {
    double v19 = INFINITY;
  }
  else {
    double v19 = (double)v18 / 1000000000.0;
  }
  int v20 = 136316162;
  objc_super v21 = v16;
  __int16 v22 = 1024;
  int v23 = 351;
  __int16 v24 = 2048;
  double v25 = v19;
  __int16 v26 = 2112;
  id v27 = @"com.apple.AttentionAwareness.clientPollEvent";
  __int16 v28 = 2112;
  id v29 = v14;
  _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v20, 0x30u);
LABEL_15:

LABEL_16:
  AnalyticsSendEvent();
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_2721);
  }
  id v2 = (void *)sharedLogger_logger;

  return v2;
}

uint64_t __30__AWSampleLogger_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(AWSampleLogger);
  uint64_t v1 = sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end