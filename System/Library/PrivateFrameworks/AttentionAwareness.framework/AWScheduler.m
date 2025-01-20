@interface AWScheduler
+ (id)sharedMotionDetectScheduler;
+ (id)sharedScheduler;
+ (id)sharedUnitTestScheduler;
- (AWAttentionSampler)attentionSampler;
- (AWScheduler)initWithOptions:(id)a3;
- (AWSchedulerObserver)observer;
- (BOOL)allowFaceDetect;
- (BOOL)allowHIDEvents;
- (BOOL)allowMotionDetect;
- (BOOL)canActiveOperationBeEnded;
- (BOOL)canRunMotionDetect;
- (BOOL)isDeviceOnLockScreen;
- (BOOL)isDeviceStationary;
- (BOOL)shouldActivateAttentionDetectForStreaming;
- (BOOL)shouldActivateAttentionDetectionForSampling;
- (BOOL)shouldActivateEyeReliefForStreaming;
- (BOOL)shouldActivateMotionDetectForSampling;
- (BOOL)unitTestMode;
- (NSString)identifier;
- (double)calculateTimeDelta:(unint64_t)a3 endTime:(unint64_t)a4 timebase:(mach_timebase_info)a5;
- (id)addStreamingClient:(id)a3 withIdentifier:(id)a4;
- (id)cancelFaceDetectStream:(id)a3 withIdentifier:(id)a4;
- (id)description;
- (id)resetInterruptedStreamingClientWithIdentifier:(id)a3;
- (id)streamFaceDetectEvents;
- (id)streamFaceDetectEventsWithOptions:(id)a3;
- (unint64_t)nextSamplingTimeForSamplingInterval:(unint64_t)a3;
- (void)addClient:(id)a3;
- (void)armEvents;
- (void)carPlayStateChanging:(BOOL)a3;
- (void)handleNotification:(unint64_t)a3;
- (void)lockScreenStateChanging:(BOOL)a3;
- (void)motionActivityChanging:(BOOL)a3;
- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7;
- (void)reevaluate;
- (void)removeInvalidClients;
- (void)removeInvalidClientsWithConnection:(id)a3;
- (void)removeStreamingClientwithIdentifier:(id)a3;
- (void)screenStateChanging:(BOOL)a3;
- (void)setClientAsInterrupted:(id)a3 forKey:(id)a4;
- (void)setObserver:(id)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
@end

@implementation AWScheduler

void __58__AWScheduler_shouldActivateAttentionDetectionForSampling__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isStreamingClient] & 1) == 0
    && [v3 activateAttentionDetection]
    && ([v3 invalid] & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

void __52__AWScheduler_shouldActivateMotionDetectForSampling__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isStreamingClient] & 1) == 0
    && [v3 activateMotionDetect]
    && ([v3 invalid] & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)allowHIDEvents
{
  return self->_allowHIDEvents;
}

- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self->_clients;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "notifyHIDEvent:mask:timestamp:senderID:displayUUID:", a3, a4, a5, a6, v12, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(AWScheduler *)self armEvents];
}

- (void)armEvents
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = absTimeNS();
  BOOL v4 = [(AWScheduler *)self shouldActivateAttentionDetectionForSampling];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else if ([(AWScheduler *)self shouldActivateMotionDetectForSampling])
  {
    uint64_t v5 = 256;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(AWAttentionSampler *)self->_attentionSampler startDeadlineComputation];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v6 = self->_clients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * i) updateDeadlinesForTime:v3];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v8);
  }

  [(AWAttentionSampler *)self->_attentionSampler finishDeadlineComputationWithOptions:v5 | v4];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v11 = self->_clients;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    unint64_t v15 = -1;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v17 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "nextTimerForTime:", v3, (void)v41);
        if (v17 < v15) {
          unint64_t v15 = v17;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v13);

    if (v15 != -1)
    {
      unint64_t v18 = absTimeNS();
      if (v15 >= v18 || currentLogLevel < 7) {
        goto LABEL_52;
      }
      long long v20 = _AALog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      long long v21 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++k)
      {
        if (*(k - 1) == 47)
        {
          long long v21 = k;
        }
        else if (!*(k - 1))
        {
          unint64_t v28 = absTimeNS();
          if (v28 == -1) {
            double v29 = INFINITY;
          }
          else {
            double v29 = (double)v28 / 1000000000.0;
          }
          *(_DWORD *)buf = 136316162;
          v50 = v21;
          __int16 v51 = 1024;
          int v52 = 472;
          __int16 v53 = 2048;
          double v54 = v29;
          __int16 v55 = 2112;
          v56 = self;
          __int16 v57 = 2048;
          double v58 = (double)v15 / 1000000000.0;
          _os_log_impl(&dword_1B3B4B000, v20, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ next deadline %13.5f IN THE PAST!", buf, 0x30u);
LABEL_51:

LABEL_52:
          unint64_t v33 = v15 - v18;
          if (v15 < v18) {
            unint64_t v33 = 0;
          }
          if (v33 >= 0x7FFFFFFFFFFFFFFFLL) {
            int64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            int64_t v34 = v33;
          }
          timer = self->_timer;
          dispatch_time_t v36 = dispatch_time(0, v34);
          dispatch_source_set_timer(timer, v36, 0xFFFFFFFFFFFFFFFFLL, 0);
          if (currentLogLevel >= 7)
          {
            uint64_t v23 = _AALog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v37 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              for (m = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
                    ;
                    ++m)
              {
                if (*(m - 1) == 47)
                {
                  v37 = m;
                }
                else if (!*(m - 1))
                {
                  unint64_t v39 = absTimeNS();
                  if (v39 == -1) {
                    double v40 = INFINITY;
                  }
                  else {
                    double v40 = (double)v39 / 1000000000.0;
                  }
                  *(_DWORD *)buf = 136316162;
                  v50 = v37;
                  __int16 v51 = 1024;
                  int v52 = 478;
                  __int16 v53 = 2048;
                  double v54 = v40;
                  __int16 v55 = 2112;
                  v56 = self;
                  __int16 v57 = 2048;
                  double v58 = (double)v15 / 1000000000.0;
                  v30 = "%30s:%-4d: %13.5f: %@ scheduled timer for %13.5f";
                  v31 = v23;
                  uint32_t v32 = 48;
                  goto LABEL_69;
                }
              }
            }
LABEL_70:
          }
          return;
        }
      }
    }
  }
  else
  {
  }
  if (currentLogLevel >= 7)
  {
    uint64_t v23 = _AALog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    v24 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
    for (n = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m"; ; ++n)
    {
      if (*(n - 1) == 47)
      {
        v24 = n;
      }
      else if (!*(n - 1))
      {
        unint64_t v26 = absTimeNS();
        if (v26 == -1) {
          double v27 = INFINITY;
        }
        else {
          double v27 = (double)v26 / 1000000000.0;
        }
        *(_DWORD *)buf = 136315906;
        v50 = v24;
        __int16 v51 = 1024;
        int v52 = 465;
        __int16 v53 = 2048;
        double v54 = v27;
        __int16 v55 = 2112;
        v56 = self;
        v30 = "%30s:%-4d: %13.5f: %@ no timer to schedule, waiting for next event";
        v31 = v23;
        uint32_t v32 = 38;
LABEL_69:
        _os_log_impl(&dword_1B3B4B000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
        goto LABEL_70;
      }
    }
  }
}

- (AWAttentionSampler)attentionSampler
{
  return self->_attentionSampler;
}

- (BOOL)shouldActivateMotionDetectForSampling
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  clients = self->_clients;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__AWScheduler_shouldActivateMotionDetectForSampling__block_invoke;
  v11[3] = &unk_1E6069FF0;
  v11[4] = &v12;
  [(NSMutableArray *)clients enumerateObjectsUsingBlock:v11];
  if (currentLogLevel < 7) {
    goto LABEL_14;
  }
  unint64_t v3 = _AALog();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  BOOL v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        *(i - 1) == 47;
        ++i)
  {
    BOOL v4 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v6 = absTimeNS();
  if (v6 == -1) {
    double v7 = INFINITY;
  }
  else {
    double v7 = (double)v6 / 1000000000.0;
  }
  int v8 = *((_DWORD *)v13 + 6);
  *(_DWORD *)buf = 136315906;
  unint64_t v17 = v4;
  __int16 v18 = 1024;
  int v19 = 831;
  __int16 v20 = 2048;
  double v21 = v7;
  __int16 v22 = 1024;
  int v23 = v8;
  _os_log_impl(&dword_1B3B4B000, v3, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %d active motion detect clients", buf, 0x22u);
LABEL_13:

LABEL_14:
  BOOL v9 = *((_DWORD *)v13 + 6) > 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)shouldActivateAttentionDetectionForSampling
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  clients = self->_clients;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__AWScheduler_shouldActivateAttentionDetectionForSampling__block_invoke;
  v11[3] = &unk_1E6069FF0;
  v11[4] = &v12;
  [(NSMutableArray *)clients enumerateObjectsUsingBlock:v11];
  if (currentLogLevel < 7) {
    goto LABEL_14;
  }
  unint64_t v3 = _AALog();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  BOOL v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        *(i - 1) == 47;
        ++i)
  {
    BOOL v4 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v6 = absTimeNS();
  if (v6 == -1) {
    double v7 = INFINITY;
  }
  else {
    double v7 = (double)v6 / 1000000000.0;
  }
  int v8 = *((_DWORD *)v13 + 6);
  *(_DWORD *)buf = 136315906;
  unint64_t v17 = v4;
  __int16 v18 = 1024;
  int v19 = 786;
  __int16 v20 = 2048;
  double v21 = v7;
  __int16 v22 = 1024;
  int v23 = v8;
  _os_log_impl(&dword_1B3B4B000, v3, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %d active AttentionDetect clients", buf, 0x22u);
LABEL_13:

LABEL_14:
  BOOL v9 = *((_DWORD *)v13 + 6) > 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __31__AWScheduler_initWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel < 7) {
    return [*(id *)(a1 + 32) armEvents];
  }
  v2 = _AALog();
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  unint64_t v3 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        *(i - 1) == 47;
        ++i)
  {
    unint64_t v3 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v5 = absTimeNS();
  if (v5 == -1) {
    double v6 = INFINITY;
  }
  else {
    double v6 = (double)v5 / 1000000000.0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  int v9 = 136315906;
  v10 = v3;
  __int16 v11 = 1024;
  int v12 = 120;
  __int16 v13 = 2048;
  double v14 = v6;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  _os_log_impl(&dword_1B3B4B000, v2, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ timer fired", (uint8_t *)&v9, 0x26u);
LABEL_13:

  return [*(id *)(a1 + 32) armEvents];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_attentionStreamer, 0);
  objc_storeStrong((id *)&self->_attentionSampler, 0);
  objc_storeStrong((id *)&self->_interruptedStreamingClients, 0);
  objc_storeStrong((id *)&self->_streamingClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isDeviceOnLockScreen
{
  return self->_isDeviceOnLockScreen;
}

- (BOOL)isDeviceStationary
{
  return self->_isDeviceStationary;
}

- (BOOL)unitTestMode
{
  return self->_unitTestMode;
}

- (BOOL)allowMotionDetect
{
  return self->_allowMotionDetect;
}

- (BOOL)allowFaceDetect
{
  return self->_allowFaceDetect;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setObserver:(id)a3
{
}

- (AWSchedulerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (AWSchedulerObserver *)WeakRetained;
}

- (void)lockScreenStateChanging:(BOOL)a3
{
  self->_isDeviceOnLockScreen = a3;
}

- (void)motionActivityChanging:(BOOL)a3
{
  self->_isDeviceStationary = a3;
}

- (void)carPlayStateChanging:(BOOL)a3
{
}

- (void)screenStateChanging:(BOOL)a3
{
  BOOL v3 = a3;
  -[AWAttentionSampler setDisplayState:](self->_attentionSampler, "setDisplayState:");
  attentionStreamer = self->_attentionStreamer;

  [(AWAttentionStreamer *)attentionStreamer setDisplayStateWithMask:128 displayState:v3];
}

- (BOOL)canRunMotionDetect
{
  if ([(AWAttentionSampler *)self->_attentionSampler currentState] == 1
    || [(AWScheduler *)self shouldActivateAttentionDetectionForSampling])
  {
    return 0;
  }

  return [(AWScheduler *)self shouldActivateMotionDetectForSampling];
}

- (double)calculateTimeDelta:(unint64_t)a3 endTime:(unint64_t)a4 timebase:(mach_timebase_info)a5
{
  return (double)(a5.numer * (a4 - a3) / a5.denom) / 1000000000.0;
}

- (BOOL)shouldActivateEyeReliefForStreaming
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  streamingClients = self->_streamingClients;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__AWScheduler_shouldActivateEyeReliefForStreaming__block_invoke;
  v11[3] = &unk_1E606A438;
  v11[4] = &v12;
  [(NSMutableDictionary *)streamingClients enumerateKeysAndObjectsUsingBlock:v11];
  if (currentLogLevel < 7) {
    goto LABEL_14;
  }
  BOOL v3 = _AALog();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  BOOL v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        *(i - 1) == 47;
        ++i)
  {
    BOOL v4 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v6 = absTimeNS();
  if (v6 == -1) {
    double v7 = INFINITY;
  }
  else {
    double v7 = (double)v6 / 1000000000.0;
  }
  int v8 = *((_DWORD *)v13 + 6);
  *(_DWORD *)buf = 136315906;
  uint64_t v17 = v4;
  __int16 v18 = 1024;
  int v19 = 817;
  __int16 v20 = 2048;
  double v21 = v7;
  __int16 v22 = 1024;
  int v23 = v8;
  _os_log_impl(&dword_1B3B4B000, v3, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %d active eyeRelief client", buf, 0x22u);
LABEL_13:

LABEL_14:
  BOOL v9 = *((_DWORD *)v13 + 6) > 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __50__AWScheduler_shouldActivateEyeReliefForStreaming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 activateEyeRelief] && (objc_msgSend(v4, "invalid") & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)shouldActivateAttentionDetectForStreaming
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  streamingClients = self->_streamingClients;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AWScheduler_shouldActivateAttentionDetectForStreaming__block_invoke;
  v11[3] = &unk_1E606A438;
  v11[4] = &v12;
  [(NSMutableDictionary *)streamingClients enumerateKeysAndObjectsUsingBlock:v11];
  if (currentLogLevel < 7) {
    goto LABEL_14;
  }
  BOOL v3 = _AALog();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  id v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        *(i - 1) == 47;
        ++i)
  {
    id v4 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v6 = absTimeNS();
  if (v6 == -1) {
    double v7 = INFINITY;
  }
  else {
    double v7 = (double)v6 / 1000000000.0;
  }
  int v8 = *((_DWORD *)v13 + 6);
  *(_DWORD *)buf = 136315906;
  uint64_t v17 = v4;
  __int16 v18 = 1024;
  int v19 = 801;
  __int16 v20 = 2048;
  double v21 = v7;
  __int16 v22 = 1024;
  int v23 = v8;
  _os_log_impl(&dword_1B3B4B000, v3, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %d active AD clients", buf, 0x22u);
LABEL_13:

LABEL_14:
  BOOL v9 = *((_DWORD *)v13 + 6) > 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __56__AWScheduler_shouldActivateAttentionDetectForStreaming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 activateAttentionDetection] && (objc_msgSend(v4, "invalid") & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)setClientAsInterrupted:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (currentLogLevel == 5)
  {
    int v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      int v15 = [v6 identifier];
      *(_DWORD *)__int16 v22 = 134218242;
      *(double *)&v22[4] = v10;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v15;
      uint64_t v16 = "%13.5f: Adding client %@ to the interrupted clients list";
      uint64_t v17 = v8;
      uint32_t v18 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, v22, v18);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    int v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          __int16 v11 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v13 = absTimeNS();
          if (v13 == -1) {
            double v14 = INFINITY;
          }
          else {
            double v14 = (double)v13 / 1000000000.0;
          }
          int v15 = [v6 identifier];
          *(_DWORD *)__int16 v22 = 136315906;
          *(void *)&v22[4] = v11;
          *(_WORD *)&v22[12] = 1024;
          *(_DWORD *)&v22[14] = 767;
          *(_WORD *)&v22[18] = 2048;
          *(double *)&v22[20] = v14;
          *(_WORD *)&v22[28] = 2112;
          *(void *)&v22[30] = v15;
          uint64_t v16 = "%30s:%-4d: %13.5f: Adding client %@ to the interrupted clients list";
          uint64_t v17 = v8;
          uint32_t v18 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  -[NSMutableDictionary removeObjectForKey:](self->_streamingClients, "removeObjectForKey:", v7, *(_OWORD *)v22, *(void *)&v22[16], *(_OWORD *)&v22[24], v23);
  [(NSMutableDictionary *)self->_interruptedStreamingClients setObject:v6 forKey:v7];
  attentionStreamer = self->_attentionStreamer;
  __int16 v20 = [v6 identifier];
  [v6 streamingDuration];
  -[AWAttentionStreamer logStreamComplete:identifier:duration:ERActivated:](attentionStreamer, "logStreamComplete:identifier:duration:ERActivated:", 128, v20, (unint64_t)v21, [v6 activateEyeRelief]);

  [v6 setStreamingDuration:0.0];
}

- (void)handleNotification:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 4 || a3 == 1)
  {
    streamingClients = self->_streamingClients;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__AWScheduler_handleNotification___block_invoke;
    v6[3] = &unk_1E6069FC8;
    v6[4] = self;
    v6[5] = a3;
    [(NSMutableDictionary *)streamingClients enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __34__AWScheduler_handleNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v5 invalid] & 1) == 0)
  {
    [v5 notifyStreamingClientOfInterruption:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "calculateTimeDelta:endTime:timebase:", objc_msgSend(v5, "streamingStartTime"), mach_continuous_time(), *(void *)(*(void *)(a1 + 32) + 64));
    objc_msgSend(v5, "setStreamingDuration:");
    [*(id *)(a1 + 32) setClientAsInterrupted:v5 forKey:v6];
    [v5 invalidateWithoutQueue];
  }
}

- (id)cancelFaceDetectStream:(id)a3 withIdentifier:(id)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(AWAttentionStreamer *)self->_attentionStreamer isStreamerRunningWithMask:128])
  {
    if (currentLogLevel == 5)
    {
      __int16 v11 = _AALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        *(_DWORD *)v63 = 134217984;
        *(double *)&v63[4] = v13;
        __int16 v20 = "%13.5f: Not stopping streamer as it isn't running currently";
        double v21 = v11;
        uint32_t v22 = 12;
LABEL_37:
        _os_log_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_DEFAULT, v20, v63, v22);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_39:
        unint64_t v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28798];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        v66[0] = @" Streamer not running";
        v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1, *(_OWORD *)v63, *(void *)&v63[16], *(void *)&v63[24]);
        v31 = [v28 errorWithDomain:v29 code:3 userInfo:v30];

        goto LABEL_91;
      }
      __int16 v11 = _AALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            double v14 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v18 = absTimeNS();
            if (v18 == -1) {
              double v19 = INFINITY;
            }
            else {
              double v19 = (double)v18 / 1000000000.0;
            }
            *(_DWORD *)v63 = 136315650;
            *(void *)&v63[4] = v14;
            *(_WORD *)&v63[12] = 1024;
            *(_DWORD *)&v63[14] = 685;
            *(_WORD *)&v63[18] = 2048;
            *(double *)&v63[20] = v19;
            __int16 v20 = "%30s:%-4d: %13.5f: Not stopping streamer as it isn't running currently";
            double v21 = v11;
            uint32_t v22 = 28;
            goto LABEL_37;
          }
        }
      }
    }

    goto LABEL_39;
  }
  if ((unint64_t)[(NSMutableDictionary *)self->_streamingClients count] > 1) {
    goto LABEL_45;
  }
  if (currentLogLevel == 5)
  {
    int v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      *(_DWORD *)v63 = 134217984;
      *(double *)&v63[4] = v10;
      v25 = "%13.5f: Stopping the streamer as there are no active streaming clients";
      unint64_t v26 = v8;
      uint32_t v27 = 12;
LABEL_42:
      _os_log_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_DEFAULT, v25, v63, v27);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_44;
    }
    int v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          uint64_t v16 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v23 = absTimeNS();
          if (v23 == -1) {
            double v24 = INFINITY;
          }
          else {
            double v24 = (double)v23 / 1000000000.0;
          }
          *(_DWORD *)v63 = 136315650;
          *(void *)&v63[4] = v16;
          *(_WORD *)&v63[12] = 1024;
          *(_DWORD *)&v63[14] = 692;
          *(_WORD *)&v63[18] = 2048;
          *(double *)&v63[20] = v24;
          v25 = "%30s:%-4d: %13.5f: Stopping the streamer as there are no active streaming clients";
          unint64_t v26 = v8;
          uint32_t v27 = 28;
          goto LABEL_42;
        }
      }
    }
  }

LABEL_44:
  v31 = -[AWAttentionStreamer cancelEventStreamWithMask:](self->_attentionStreamer, "cancelEventStreamWithMask:", 128, *(void *)v63, *(_OWORD *)&v63[8], *(void *)&v63[24]);
  if (v31) {
    goto LABEL_91;
  }
LABEL_45:
  -[AWScheduler calculateTimeDelta:endTime:timebase:](self, "calculateTimeDelta:endTime:timebase:", [v6 streamingStartTime], mach_continuous_time(), *(void *)&self->_timebase);
  objc_msgSend(v6, "setStreamingDuration:");
  [(AWScheduler *)self setClientAsInterrupted:v6 forKey:v7];
  if (currentLogLevel == 5)
  {
    uint32_t v32 = _AALog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v33 = absTimeNS();
      if (v33 == -1) {
        double v34 = INFINITY;
      }
      else {
        double v34 = (double)v33 / 1000000000.0;
      }
      uint64_t v39 = [(NSMutableDictionary *)self->_streamingClients count];
      double v40 = [(NSMutableDictionary *)self->_streamingClients allValues];
      *(_DWORD *)v63 = 134218498;
      *(double *)&v63[4] = v34;
      *(_WORD *)&v63[12] = 2048;
      *(void *)&v63[14] = v39;
      *(_WORD *)&v63[22] = 2112;
      *(void *)&v63[24] = v40;
      long long v41 = "%13.5f: %lu streaming clients: %@";
      long long v42 = v32;
      uint32_t v43 = 32;
LABEL_63:
      _os_log_impl(&dword_1B3B4B000, v42, OS_LOG_TYPE_DEFAULT, v41, v63, v43);
    }
LABEL_64:

    goto LABEL_65;
  }
  if (currentLogLevel >= 6)
  {
    uint32_t v32 = _AALog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v35 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++k)
      {
        if (*(k - 1) == 47)
        {
          v35 = k;
        }
        else if (!*(k - 1))
        {
          unint64_t v37 = absTimeNS();
          if (v37 == -1) {
            double v38 = INFINITY;
          }
          else {
            double v38 = (double)v37 / 1000000000.0;
          }
          uint64_t v44 = [(NSMutableDictionary *)self->_streamingClients count];
          double v40 = [(NSMutableDictionary *)self->_streamingClients allValues];
          *(_DWORD *)v63 = 136316162;
          *(void *)&v63[4] = v35;
          *(_WORD *)&v63[12] = 1024;
          *(_DWORD *)&v63[14] = 704;
          *(_WORD *)&v63[18] = 2048;
          *(double *)&v63[20] = v38;
          *(_WORD *)&v63[28] = 2048;
          *(void *)&v63[30] = v44;
          *(_WORD *)&v63[38] = 2112;
          v64 = v40;
          long long v41 = "%30s:%-4d: %13.5f: %lu streaming clients: %@";
          long long v42 = v32;
          uint32_t v43 = 48;
          goto LABEL_63;
        }
      }
    }
    goto LABEL_64;
  }
LABEL_65:
  __int16 v45 = (__int16)-[AWAttentionStreamer getStreamerOptionsWithMask:](self->_attentionStreamer, "getStreamerOptionsWithMask:", 128, *(void *)v63, *(_OWORD *)&v63[8], *(void *)&v63[24], *(void *)&v63[32], v64);
  BOOL v46 = [(AWScheduler *)self shouldActivateAttentionDetectForStreaming];
  BOOL v47 = [(AWScheduler *)self shouldActivateEyeReliefForStreaming];
  BOOL v48 = v47;
  if (v46 == ((v45 & 0x100) == 0) || ((((v45 & 1) == 0) ^ v47) & 1) == 0)
  {
    if (currentLogLevel == 5)
    {
      v49 = _AALog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v50 = absTimeNS();
        if (v50 == -1) {
          double v51 = INFINITY;
        }
        else {
          double v51 = (double)v50 / 1000000000.0;
        }
        *(_DWORD *)v63 = 134217984;
        *(double *)&v63[4] = v51;
        v56 = "%13.5f: Streaming options have changed, cancelling current operation and starting a new one with updated options";
        __int16 v57 = v49;
        uint32_t v58 = 12;
LABEL_85:
        _os_log_impl(&dword_1B3B4B000, v57, OS_LOG_TYPE_DEFAULT, v56, v63, v58);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_87:
        id v59 = -[AWAttentionStreamer cancelEventStreamWithMask:](self->_attentionStreamer, "cancelEventStreamWithMask:", 128, *(void *)v63, *(_OWORD *)&v63[8], *(void *)&v63[24]);
        uint64_t v60 = 256;
        if (!v46) {
          uint64_t v60 = 0;
        }
        id v61 = [(AWScheduler *)self streamFaceDetectEventsWithOptions:v60 | v48];
        goto LABEL_90;
      }
      v49 = _AALog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (m = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++m)
        {
          if (*(m - 1) == 47)
          {
            int v52 = m;
          }
          else if (!*(m - 1))
          {
            unint64_t v54 = absTimeNS();
            if (v54 == -1) {
              double v55 = INFINITY;
            }
            else {
              double v55 = (double)v54 / 1000000000.0;
            }
            *(_DWORD *)v63 = 136315650;
            *(void *)&v63[4] = v52;
            *(_WORD *)&v63[12] = 1024;
            *(_DWORD *)&v63[14] = 717;
            *(_WORD *)&v63[18] = 2048;
            *(double *)&v63[20] = v55;
            v56 = "%30s:%-4d: %13.5f: Streaming options have changed, cancelling current operation and starting a new one"
                  " with updated options";
            __int16 v57 = v49;
            uint32_t v58 = 28;
            goto LABEL_85;
          }
        }
      }
    }

    goto LABEL_87;
  }
LABEL_90:
  v31 = 0;
LABEL_91:

  return v31;
}

- (id)streamFaceDetectEventsWithOptions:(id)a3
{
  int v3 = *(_DWORD *)&a3.var0;
  v34[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke;
  v28[3] = &unk_1E6069F78;
  v28[4] = self;
  id v5 = (void *)MEMORY[0x1B3EC18C0](v28);
  if (MGGetBoolAnswer())
  {
    attentionStreamer = self->_attentionStreamer;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_74;
    v27[3] = &unk_1E6069FA0;
    v27[4] = self;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    unint64_t v23 = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_77;
    double v24 = &unk_1E606A570;
    v25 = self;
    id v7 = v5;
    id v26 = v7;
    int v8 = [(AWAttentionStreamer *)attentionStreamer streamEventsWithMask:128 block:v27 options:*(void *)&v3 & 0xFFFFFFLL operationStartFailedBlock:&v21];
    if (v8)
    {
      if (currentLogLevel >= 3)
      {
        unint64_t v9 = _AALog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          unint64_t v19 = absTimeNS();
          if (v19 == -1) {
            double v20 = INFINITY;
          }
          else {
            double v20 = (double)v19 / 1000000000.0;
          }
          *(_DWORD *)buf = 134218242;
          double v30 = v20;
          __int16 v31 = 2112;
          uint32_t v32 = v8;
          _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: Error %@ when starting streaming operation from AttentionStreamer", buf, 0x16u);
        }
      }
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_streamingClients, "enumerateKeysAndObjectsUsingBlock:", v7, v21, v22, v23, v24, v25);
    }
    id v10 = v8;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      __int16 v11 = _AALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = absTimeNS();
        if (v17 == -1) {
          double v18 = INFINITY;
        }
        else {
          double v18 = (double)v17 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v30 = v18;
        _os_log_error_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_ERROR, "%13.5f: Device doesn't support pearl", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_streamingClients enumerateKeysAndObjectsUsingBlock:v5];
    unint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28798];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @" Device doesn't support Pearl";
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    int v15 = [v12 errorWithDomain:v13 code:19 userInfo:v14];

    id v10 = v15;
  }

  return v10;
}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v6 invalid] & 1) == 0)
  {
    if (currentLogLevel == 5)
    {
      id v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = absTimeNS();
        if (v8 == -1) {
          double v9 = INFINITY;
        }
        else {
          double v9 = (double)v8 / 1000000000.0;
        }
        double v14 = [v6 identifier];
        *(_DWORD *)double v18 = 134218242;
        *(double *)&v18[4] = v9;
        *(_WORD *)&v18[12] = 2112;
        *(void *)&v18[14] = v14;
        int v15 = "%13.5f: Removing client %@ from streaming clients list";
        uint64_t v16 = v7;
        uint32_t v17 = 22;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, v18, v17);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", v5, *(_OWORD *)v18, *(void *)&v18[16], *(_OWORD *)&v18[24], v19);
        [v6 invalidateWithoutQueue];
        goto LABEL_23;
      }
      id v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            id v10 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v12 = absTimeNS();
            if (v12 == -1) {
              double v13 = INFINITY;
            }
            else {
              double v13 = (double)v12 / 1000000000.0;
            }
            double v14 = [v6 identifier];
            *(_DWORD *)double v18 = 136315906;
            *(void *)&v18[4] = v10;
            *(_WORD *)&v18[12] = 1024;
            *(_DWORD *)&v18[14] = 606;
            *(_WORD *)&v18[18] = 2048;
            *(double *)&v18[20] = v13;
            *(_WORD *)&v18[28] = 2112;
            *(void *)&v18[30] = v14;
            int v15 = "%30s:%-4d: %13.5f: Removing client %@ from streaming clients list";
            uint64_t v16 = v7;
            uint32_t v17 = 38;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
LABEL_23:
}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_2;
  v6[3] = &unk_1E6069F78;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (currentLogLevel >= 3)
    {
      id v4 = _AALog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        unint64_t v5 = absTimeNS();
        if (v5 == -1) {
          double v6 = INFINITY;
        }
        else {
          double v6 = (double)v5 / 1000000000.0;
        }
        int v7 = 134218242;
        double v8 = v6;
        __int16 v9 = 2112;
        id v10 = v3;
        _os_log_error_impl(&dword_1B3B4B000, v4, OS_LOG_TYPE_ERROR, "%13.5f: Error %@ when starting streaming operation from BioKit", (uint8_t *)&v7, 0x16u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 32) enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
  }
}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(id *)(a1 + 32);
    if ([v5 metadataType] == 2 || objc_msgSend(v5, "metadataType") == 5)
    {
      double v6 = _AALog();
      int v7 = _AALog();
      os_signpost_id_t v8 = os_signpost_id_generate(v7);

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)id v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v6, OS_SIGNPOST_EVENT, v8, "AA: Streaming event received", (const char *)&unk_1B3B8868B, v10, 2u);
      }
    }
  }
  id v9 = v4;
  if (([v9 invalid] & 1) == 0) {
    [v9 notifyClientOfStreamingEvent:*(void *)(a1 + 32)];
  }
}

- (id)streamFaceDetectEvents
{
  BOOL v3 = [(AWScheduler *)self shouldActivateAttentionDetectForStreaming];
  BOOL v4 = [(AWScheduler *)self shouldActivateEyeReliefForStreaming];
  uint64_t v5 = 256;
  if (!v3) {
    uint64_t v5 = 0;
  }

  return [(AWScheduler *)self streamFaceDetectEventsWithOptions:v5 | v4];
}

- (void)removeStreamingClientwithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_streamingClients objectForKey:v4];
  if (!v5) {
    goto LABEL_24;
  }
  if (currentLogLevel == 5)
  {
    double v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      *(_DWORD *)double v30 = 134218242;
      *(double *)&v30[4] = v8;
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v5;
      double v13 = "%13.5f: Trying to remove streaming client %@";
      double v14 = v6;
      uint32_t v15 = 22;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, v30, v15);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_22;
    }
    double v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v9 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v11 = absTimeNS();
          if (v11 == -1) {
            double v12 = INFINITY;
          }
          else {
            double v12 = (double)v11 / 1000000000.0;
          }
          *(_DWORD *)double v30 = 136315906;
          *(void *)&v30[4] = v9;
          *(_WORD *)&v30[12] = 1024;
          *(_DWORD *)&v30[14] = 564;
          *(_WORD *)&v30[18] = 2048;
          *(double *)&v30[20] = v12;
          *(_WORD *)&v30[28] = 2112;
          *(void *)&v30[30] = v5;
          double v13 = "%30s:%-4d: %13.5f: Trying to remove streaming client %@";
          double v14 = v6;
          uint32_t v15 = 38;
          goto LABEL_20;
        }
      }
    }
  }

LABEL_22:
  id v16 = -[AWScheduler cancelFaceDetectStream:withIdentifier:](self, "cancelFaceDetectStream:withIdentifier:", v5, v4, *(_OWORD *)v30, *(void *)&v30[16], *(_OWORD *)&v30[24], v31);
  uint32_t v17 = [(NSMutableDictionary *)self->_streamingClients objectForKey:v4];

  if (v17) {
    [(NSMutableDictionary *)self->_streamingClients removeObjectForKey:v4];
  }
LABEL_24:
  double v18 = [(NSMutableDictionary *)self->_interruptedStreamingClients objectForKey:v4];
  if (v18)
  {
    if (currentLogLevel == 5)
    {
      uint64_t v19 = _AALog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = absTimeNS();
        if (v20 == -1) {
          double v21 = INFINITY;
        }
        else {
          double v21 = (double)v20 / 1000000000.0;
        }
        id v26 = [v18 identifier];
        *(_DWORD *)double v30 = 134218242;
        *(double *)&v30[4] = v21;
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v26;
        uint32_t v27 = "%13.5f: Removing client %@ from the list of interrupted clients";
        unint64_t v28 = v19;
        uint32_t v29 = 22;
LABEL_43:
        _os_log_impl(&dword_1B3B4B000, v28, OS_LOG_TYPE_DEFAULT, v27, v30, v29);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_45:
        -[NSMutableDictionary removeObjectForKey:](self->_interruptedStreamingClients, "removeObjectForKey:", v4, *(void *)v30, *(_OWORD *)&v30[8], *(_OWORD *)&v30[24]);
        goto LABEL_46;
      }
      uint64_t v19 = _AALog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++j)
        {
          if (*(j - 1) == 47)
          {
            uint64_t v22 = j;
          }
          else if (!*(j - 1))
          {
            unint64_t v24 = absTimeNS();
            if (v24 == -1) {
              double v25 = INFINITY;
            }
            else {
              double v25 = (double)v24 / 1000000000.0;
            }
            id v26 = [v18 identifier];
            *(_DWORD *)double v30 = 136315906;
            *(void *)&v30[4] = v22;
            *(_WORD *)&v30[12] = 1024;
            *(_DWORD *)&v30[14] = 577;
            *(_WORD *)&v30[18] = 2048;
            *(double *)&v30[20] = v25;
            *(_WORD *)&v30[28] = 2112;
            *(void *)&v30[30] = v26;
            uint32_t v27 = "%30s:%-4d: %13.5f: Removing client %@ from the list of interrupted clients";
            unint64_t v28 = v19;
            uint32_t v29 = 38;
            goto LABEL_43;
          }
        }
      }
    }

    goto LABEL_45;
  }
LABEL_46:
}

- (id)addStreamingClient:(id)a3 withIdentifier:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[AWScheduler addStreamingClient:withIdentifier:]", "Scheduler.m", 531, "client");
  }
  double v8 = v7;
  id v9 = [(NSMutableDictionary *)self->_streamingClients objectForKey:v7];

  if (!v9)
  {
    if (currentLogLevel == 5)
    {
      uint32_t v15 = _AALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        *(_DWORD *)long long v41 = 134218242;
        *(double *)&v41[4] = v17;
        *(_WORD *)&v41[12] = 2112;
        *(void *)&v41[14] = v6;
        uint64_t v22 = "%13.5f: Creating new streaming client %@";
        unint64_t v23 = v15;
        uint32_t v24 = 22;
LABEL_27:
        _os_log_impl(&dword_1B3B4B000, v23, OS_LOG_TYPE_DEFAULT, v22, v41, v24);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_29:
        -[NSMutableDictionary setObject:forKey:](self->_streamingClients, "setObject:forKey:", v6, v8, *(_OWORD *)v41, *(void *)&v41[16], *(_OWORD *)&v41[24]);
        [(AWScheduler *)self addClient:v6];
        [v6 setStreamingDuration:0.0];
        [v6 setStreamingStartTime:mach_continuous_time()];
        double v14 = 0;
        goto LABEL_30;
      }
      uint32_t v15 = _AALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v18 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            double v18 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v20 = absTimeNS();
            if (v20 == -1) {
              double v21 = INFINITY;
            }
            else {
              double v21 = (double)v20 / 1000000000.0;
            }
            *(_DWORD *)long long v41 = 136315906;
            *(void *)&v41[4] = v18;
            *(_WORD *)&v41[12] = 1024;
            *(_DWORD *)&v41[14] = 543;
            *(_WORD *)&v41[18] = 2048;
            *(double *)&v41[20] = v21;
            *(_WORD *)&v41[28] = 2112;
            *(void *)&v41[30] = v6;
            uint64_t v22 = "%30s:%-4d: %13.5f: Creating new streaming client %@";
            unint64_t v23 = v15;
            uint32_t v24 = 38;
            goto LABEL_27;
          }
        }
      }
    }

    goto LABEL_29;
  }
  if (currentLogLevel >= 3)
  {
    id v10 = _AALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v25 = absTimeNS();
      if (v25 == -1) {
        double v26 = INFINITY;
      }
      else {
        double v26 = (double)v25 / 1000000000.0;
      }
      *(_DWORD *)long long v41 = 134217984;
      *(double *)&v41[4] = v26;
      _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Client already added to the list of streaming clients, don't add it again", v41, 0xCu);
    }
  }
  unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28798];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  v44[0] = @" Client already active";
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  double v14 = [v11 errorWithDomain:v12 code:37 userInfo:v13];

LABEL_30:
  if (currentLogLevel == 5)
  {
    uint32_t v27 = _AALog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v28 = absTimeNS();
      if (v28 == -1) {
        double v29 = INFINITY;
      }
      else {
        double v29 = (double)v28 / 1000000000.0;
      }
      uint64_t v34 = [(NSMutableDictionary *)self->_streamingClients count];
      v35 = [(NSMutableDictionary *)self->_streamingClients allValues];
      *(_DWORD *)long long v41 = 134218498;
      *(double *)&v41[4] = v29;
      *(_WORD *)&v41[12] = 2048;
      *(void *)&v41[14] = v34;
      *(_WORD *)&v41[22] = 2112;
      *(void *)&v41[24] = v35;
      dispatch_time_t v36 = "%13.5f: %lu streaming clients: %@";
      unint64_t v37 = v27;
      uint32_t v38 = 32;
LABEL_48:
      _os_log_impl(&dword_1B3B4B000, v37, OS_LOG_TYPE_DEFAULT, v36, v41, v38);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_50;
    }
    uint32_t v27 = _AALog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      double v30 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          double v30 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v32 = absTimeNS();
          if (v32 == -1) {
            double v33 = INFINITY;
          }
          else {
            double v33 = (double)v32 / 1000000000.0;
          }
          uint64_t v39 = [(NSMutableDictionary *)self->_streamingClients count];
          v35 = [(NSMutableDictionary *)self->_streamingClients allValues];
          *(_DWORD *)long long v41 = 136316162;
          *(void *)&v41[4] = v30;
          *(_WORD *)&v41[12] = 1024;
          *(_DWORD *)&v41[14] = 553;
          *(_WORD *)&v41[18] = 2048;
          *(double *)&v41[20] = v33;
          *(_WORD *)&v41[28] = 2048;
          *(void *)&v41[30] = v39;
          *(_WORD *)&v41[38] = 2112;
          long long v42 = v35;
          dispatch_time_t v36 = "%30s:%-4d: %13.5f: %lu streaming clients: %@";
          unint64_t v37 = v27;
          uint32_t v38 = 48;
          goto LABEL_48;
        }
      }
    }
  }

LABEL_50:

  return v14;
}

- (id)resetInterruptedStreamingClientWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_interruptedStreamingClients objectForKey:v4];
  if (v5)
  {
    if (currentLogLevel == 5)
    {
      id v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = absTimeNS();
        if (v7 == -1) {
          double v8 = INFINITY;
        }
        else {
          double v8 = (double)v7 / 1000000000.0;
        }
        double v13 = [v5 identifier];
        *(_DWORD *)double v18 = 134218242;
        *(double *)&v18[4] = v8;
        *(_WORD *)&v18[12] = 2112;
        *(void *)&v18[14] = v13;
        double v14 = "%13.5f: Interrupted streaming client %@ restarting";
        uint32_t v15 = v6;
        uint32_t v16 = 22;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, v18, v16);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        -[NSMutableDictionary removeObjectForKey:](self->_interruptedStreamingClients, "removeObjectForKey:", v4, *(_OWORD *)v18, *(void *)&v18[16], *(_OWORD *)&v18[24], v19);
        [(NSMutableDictionary *)self->_streamingClients setObject:v5 forKey:v4];
        [v5 setStreamingDuration:0.0];
        [v5 setStreamingStartTime:mach_continuous_time()];
        goto LABEL_23;
      }
      id v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            id v9 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v11 = absTimeNS();
            if (v11 == -1) {
              double v12 = INFINITY;
            }
            else {
              double v12 = (double)v11 / 1000000000.0;
            }
            double v13 = [v5 identifier];
            *(_DWORD *)double v18 = 136315906;
            *(void *)&v18[4] = v9;
            *(_WORD *)&v18[12] = 1024;
            *(_DWORD *)&v18[14] = 515;
            *(_WORD *)&v18[18] = 2048;
            *(double *)&v18[20] = v12;
            *(_WORD *)&v18[28] = 2112;
            *(void *)&v18[30] = v13;
            double v14 = "%30s:%-4d: %13.5f: Interrupted streaming client %@ restarting";
            uint32_t v15 = v6;
            uint32_t v16 = 38;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
LABEL_23:

  return v5;
}

- (unint64_t)nextSamplingTimeForSamplingInterval:(unint64_t)a3
{
  BOOL v5 = [(AWScheduler *)self shouldActivateMotionDetectForSampling]
    && ![(AWScheduler *)self shouldActivateAttentionDetectionForSampling];
  attentionSampler = self->_attentionSampler;

  return [(AWAttentionSampler *)attentionSampler nextSampleTimeForSamplingInterval:a3 ignoreDisplayState:v5];
}

- (void)reevaluate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = self->_clients;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reevaluateConfig", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AWAttentionSampler *)self->_attentionSampler setSmartCoverClosed:v3];
  attentionStreamer = self->_attentionStreamer;

  [(AWAttentionStreamer *)attentionStreamer setSmartCoverStateWithMask:128 smartCoverState:v3];
}

- (void)removeInvalidClients
{
}

- (void)removeInvalidClientsWithConnection:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(NSMutableArray *)self->_clients count];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v7 = v5;
  unint64_t v8 = 0;
  *(void *)&long long v6 = 136315906;
  long long v24 = v6;
  unint64_t v9 = v5;
  do
  {
    long long v10 = -[NSMutableArray objectAtIndex:](self->_clients, "objectAtIndex:", v8, v24);
    if (([v10 invalid] & 1) != 0
      || ([v10 connection], id v11 = (id)objc_claimAutoreleasedReturnValue(), v11, v11 == v4))
    {
      if (currentLogLevel == 5)
      {
        double v12 = _AALog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v13 = absTimeNS();
          if (v13 == -1) {
            double v14 = INFINITY;
          }
          else {
            double v14 = (double)v13 / 1000000000.0;
          }
          *(_DWORD *)buf = 134218242;
          double v26 = v14;
          __int16 v27 = 2112;
          *(void *)unint64_t v28 = v10;
          uint64_t v19 = v12;
          unint64_t v20 = "%13.5f: Removing client: %@";
          uint32_t v21 = 22;
LABEL_23:
          _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
        }
      }
      else
      {
        if (currentLogLevel < 6)
        {
LABEL_25:
          uint64_t v22 = [v10 clientId];
          [(AWScheduler *)self removeStreamingClientwithIdentifier:v22];

          [v10 invalidateWithHandler:0];
          [(NSMutableArray *)self->_clients removeObjectAtIndex:v8--];
          --v9;
          goto LABEL_26;
        }
        double v12 = _AALog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
          for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
                ;
                ++i)
          {
            if (*(i - 1) == 47)
            {
              uint32_t v15 = i;
            }
            else if (!*(i - 1))
            {
              unint64_t v17 = absTimeNS();
              if (v17 == -1) {
                double v18 = INFINITY;
              }
              else {
                double v18 = (double)v17 / 1000000000.0;
              }
              *(_DWORD *)buf = v24;
              double v26 = *(double *)&v15;
              __int16 v27 = 1024;
              *(_DWORD *)unint64_t v28 = 368;
              *(_WORD *)&v28[4] = 2048;
              *(double *)&v28[6] = v18;
              __int16 v29 = 2112;
              double v30 = v10;
              uint64_t v19 = v12;
              unint64_t v20 = "%30s:%-4d: %13.5f: Removing client: %@";
              uint32_t v21 = 38;
              goto LABEL_23;
            }
          }
        }
      }

      goto LABEL_25;
    }
LABEL_26:

    ++v8;
  }
  while (v8 < v9);
  if (v7 != v9)
  {
    unint64_t v23 = [(AWScheduler *)self observer];
    [v23 clientCountChangedFrom:v7 to:v9 forScheduler:self];

    [(AWScheduler *)self armEvents];
  }
LABEL_29:
}

- (void)addClient:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4) {
    __assert_rtn("-[AWScheduler addClient:]", "Scheduler.m", 332, "client");
  }
  uint64_t v5 = [(NSMutableArray *)self->_clients count];
  [(NSMutableArray *)self->_clients addObject:v4];
  long long v6 = [(AWScheduler *)self observer];
  objc_msgSend(v6, "clientCountChangedFrom:to:forScheduler:", v5, -[NSMutableArray count](self->_clients, "count"), self);

  if (currentLogLevel == 5)
  {
    uint64_t v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      uint64_t v14 = [(NSMutableArray *)self->_clients count];
      *(_DWORD *)__int16 v29 = 134218498;
      *(double *)&v29[4] = v9;
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = self;
      *(_WORD *)&v29[22] = 2048;
      *(void *)&v29[24] = v14;
      uint32_t v15 = "%13.5f: %@ %lu clients";
      uint32_t v16 = v7;
      uint32_t v17 = 32;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, v29, v17);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_41;
    }
    uint64_t v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          long long v10 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v12 = absTimeNS();
          if (v12 == -1) {
            double v13 = INFINITY;
          }
          else {
            double v13 = (double)v12 / 1000000000.0;
          }
          uint64_t v18 = [(NSMutableArray *)self->_clients count];
          *(_DWORD *)__int16 v29 = 136316162;
          *(void *)&v29[4] = v10;
          *(_WORD *)&v29[12] = 1024;
          *(_DWORD *)&v29[14] = 339;
          *(_WORD *)&v29[18] = 2048;
          *(double *)&v29[20] = v13;
          *(_WORD *)&v29[28] = 2112;
          *(void *)&v29[30] = self;
          *(_WORD *)&v29[38] = 2048;
          uint64_t v30 = v18;
          uint32_t v15 = "%30s:%-4d: %13.5f: %@ %lu clients";
          uint32_t v16 = v7;
          uint32_t v17 = 48;
          goto LABEL_20;
        }
      }
    }
  }

  if (currentLogLevel == 5)
  {
    uint64_t v19 = _AALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = absTimeNS();
      if (v20 == -1) {
        double v21 = INFINITY;
      }
      else {
        double v21 = (double)v20 / 1000000000.0;
      }
      *(_DWORD *)__int16 v29 = 134218242;
      *(double *)&v29[4] = v21;
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = v4;
      double v26 = "%13.5f: New client: %@";
      __int16 v27 = v19;
      uint32_t v28 = 22;
LABEL_39:
      _os_log_impl(&dword_1B3B4B000, v27, OS_LOG_TYPE_DEFAULT, v26, v29, v28);
    }
LABEL_40:

    goto LABEL_41;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v19 = _AALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          uint64_t v22 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v24 = absTimeNS();
          if (v24 == -1) {
            double v25 = INFINITY;
          }
          else {
            double v25 = (double)v24 / 1000000000.0;
          }
          *(_DWORD *)__int16 v29 = 136315906;
          *(void *)&v29[4] = v22;
          *(_WORD *)&v29[12] = 1024;
          *(_DWORD *)&v29[14] = 340;
          *(_WORD *)&v29[18] = 2048;
          *(double *)&v29[20] = v25;
          *(_WORD *)&v29[28] = 2112;
          *(void *)&v29[30] = v4;
          double v26 = "%30s:%-4d: %13.5f: New client: %@";
          __int16 v27 = v19;
          uint32_t v28 = 38;
          goto LABEL_39;
        }
      }
    }
    goto LABEL_40;
  }
LABEL_41:
  [(AWScheduler *)self armEvents];
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  long long v6 = [v3 stringWithFormat:@"<%@: %p> (identifier: %@)", v5, self, self->_identifier];

  return v6;
}

- (BOOL)canActiveOperationBeEnded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_clients;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "canOperationBeEndedForClient", (void)v10);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (AWScheduler)initWithOptions:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)AWScheduler;
  uint64_t v5 = [(AWScheduler *)&v88 init];
  if (!v5) {
    goto LABEL_66;
  }
  if (!v4) {
    goto LABEL_72;
  }
  uint64_t v6 = [v4 valueForKey:@"identifier"];
  BOOL v7 = v6 == 0;

  if (v7) {
    goto LABEL_72;
  }
  unint64_t v8 = [v4 valueForKey:@"allowFaceDetect"];
  BOOL v9 = v8 == 0;

  if (v9) {
    goto LABEL_72;
  }
  long long v10 = [v4 valueForKey:@"allowHIDEvents"];
  BOOL v11 = v10 == 0;

  if (v11) {
    goto LABEL_72;
  }
  long long v12 = [v4 valueForKey:@"allowMotionDetect"];
  BOOL v13 = v12 == 0;

  if (v13
    || ([v4 valueForKey:@"initForUnitTest"],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == 0,
        v14,
        v15))
  {
LABEL_72:
    v73 = 0;
    goto LABEL_67;
  }
  uint64_t v16 = [v4 valueForKey:@"identifier"];
  uint32_t v17 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v16;

  uint64_t v18 = [v4 objectForKeyedSubscript:@"allowFaceDetect"];
  v5[73] = [v18 BOOLValue];

  uint64_t v19 = [v4 objectForKeyedSubscript:@"allowHIDEvents"];
  v5[74] = [v19 BOOLValue];

  unint64_t v20 = [v4 objectForKeyedSubscript:@"allowMotionDetect"];
  v5[75] = [v20 BOOLValue];

  double v21 = [v4 objectForKeyedSubscript:@"initForUnitTest"];
  v5[76] = [v21 BOOLValue];

  uint64_t v22 = awQueue(1);
  unint64_t v23 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v22;

  dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v5 + 1));
  double v25 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v24;

  double v26 = *((void *)v5 + 2);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __31__AWScheduler_initWithOptions___block_invoke;
  handler[3] = &unk_1E606AC70;
  __int16 v27 = v5;
  v87 = v27;
  dispatch_source_set_event_handler(v26, handler);
  dispatch_resume(*((dispatch_object_t *)v5 + 2));
  uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
  __int16 v29 = (void *)*((void *)v27 + 3);
  *((void *)v27 + 3) = v28;

  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v31 = (void *)*((void *)v27 + 4);
  *((void *)v27 + 4) = v30;

  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v33 = (void *)*((void *)v27 + 5);
  *((void *)v27 + 5) = v32;

  mach_timebase_info((mach_timebase_info_t)v27 + 8);
  objc_initWeak(&location, v27);
  if (v5[76] || MGGetBoolAnswer())
  {
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AttentionAwareness"];
    int v35 = [v34 BOOLForKey:@"useBioKit"];
    int v90 = 255;
    size_t v89 = 4;
    if (sysctlbyname("kern.exclaves_status", &v90, &v89, 0, 0) == -1)
    {
      if (currentLogLevel >= 3)
      {
        unint64_t v37 = _AALog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          unint64_t v75 = absTimeNS();
          if (v75 == -1) {
            double v76 = INFINITY;
          }
          else {
            double v76 = (double)v75 / 1000000000.0;
          }
          v77 = __error();
          v78 = strerror(*v77);
          *(_DWORD *)buf = 134218242;
          double v94 = v76;
          __int16 v95 = 2080;
          *(void *)v96 = v78;
          _os_log_error_impl(&dword_1B3B4B000, v37, OS_LOG_TYPE_ERROR, "%13.5f: sysctlbyname(kern.exclaves_status): %s", buf, 0x16u);
        }
      }
      BOOL v36 = 0;
    }
    else
    {
      BOOL v36 = v90 != 255;
    }
    int BoolAnswer = AVGestaltGetBoolAnswer();
    if (currentLogLevel == 5)
    {
      uint64_t v39 = _AALog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v40 = absTimeNS();
        if (v40 == -1) {
          double v41 = INFINITY;
        }
        else {
          double v41 = (double)v40 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218752;
        double v94 = v41;
        __int16 v95 = 1024;
        *(_DWORD *)v96 = v35;
        *(_WORD *)&v96[4] = 1024;
        *(_DWORD *)&v96[6] = v36;
        *(_WORD *)&v96[10] = 1024;
        *(_DWORD *)&v96[12] = BoolAnswer;
        BOOL v46 = "%13.5f: useBioKit: %d, exclavesAvailable: %d areFeatureFlagsON: %d";
        BOOL v47 = v39;
        uint32_t v48 = 30;
LABEL_34:
        _os_log_impl(&dword_1B3B4B000, v47, OS_LOG_TYPE_DEFAULT, v46, buf, v48);
      }
    }
    else
    {
      if (currentLogLevel < 6) {
        goto LABEL_36;
      }
      uint64_t v39 = _AALog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        long long v42 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            long long v42 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v44 = absTimeNS();
            if (v44 == -1) {
              double v45 = INFINITY;
            }
            else {
              double v45 = (double)v44 / 1000000000.0;
            }
            *(_DWORD *)buf = 136316418;
            double v94 = *(double *)&v42;
            __int16 v95 = 1024;
            *(_DWORD *)v96 = 183;
            *(_WORD *)&v96[4] = 2048;
            *(double *)&v96[6] = v45;
            *(_WORD *)&v96[14] = 1024;
            *(_DWORD *)&v96[16] = v35;
            *(_WORD *)&v96[20] = 1024;
            *(_DWORD *)&v96[22] = v36;
            LOWORD(v97) = 1024;
            *(_DWORD *)((char *)&v97 + 2) = BoolAnswer;
            BOOL v46 = "%30s:%-4d: %13.5f: useBioKit: %d, exclavesAvailable: %d areFeatureFlagsON: %d";
            BOOL v47 = v39;
            uint32_t v48 = 46;
            goto LABEL_34;
          }
        }
      }
    }

LABEL_36:
    v27[72] = !v35 && (v36 & BoolAnswer) == 1;
    if (currentLogLevel == 5)
    {
      v49 = _AALog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v50 = absTimeNS();
        if (v50 == -1) {
          double v51 = INFINITY;
        }
        else {
          double v51 = (double)v50 / 1000000000.0;
        }
        v56 = "AVFoundation";
        uint64_t v57 = *((void *)v5 + 11);
        if (!v27[72]) {
          v56 = "BiometricKit";
        }
        *(_DWORD *)buf = 134218498;
        double v94 = v51;
        __int16 v95 = 2080;
        *(void *)v96 = v56;
        *(_WORD *)&v96[8] = 2112;
        *(void *)&v96[10] = v57;
        uint32_t v58 = "%13.5f: Using %s for Pearl operations for %@";
        id v59 = v49;
        uint32_t v60 = 32;
        goto LABEL_62;
      }
      goto LABEL_63;
    }
    if (currentLogLevel >= 6)
    {
      v49 = _AALog();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_63;
      }
      int v52 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          int v52 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v54 = absTimeNS();
          if (v54 == -1) {
            double v55 = INFINITY;
          }
          else {
            double v55 = (double)v54 / 1000000000.0;
          }
          id v61 = "AVFoundation";
          uint64_t v62 = *((void *)v5 + 11);
          if (!v27[72]) {
            id v61 = "BiometricKit";
          }
          *(_DWORD *)buf = 136316162;
          double v94 = *(double *)&v52;
          __int16 v95 = 1024;
          *(_DWORD *)v96 = 197;
          *(_WORD *)&v96[4] = 2048;
          *(double *)&v96[6] = v55;
          *(_WORD *)&v96[14] = 2080;
          *(void *)&v96[16] = v61;
          *(_WORD *)&v96[24] = 2112;
          uint64_t v97 = v62;
          uint32_t v58 = "%30s:%-4d: %13.5f: Using %s for Pearl operations for %@";
          id v59 = v49;
          uint32_t v60 = 48;
LABEL_62:
          _os_log_impl(&dword_1B3B4B000, v59, OS_LOG_TYPE_DEFAULT, v58, buf, v60);
LABEL_63:

          break;
        }
      }
    }
    v91[0] = @"unitTest";
    v63 = [NSNumber numberWithBool:v5[76]];
    v92[0] = v63;
    v91[1] = @"useAVFoundation";
    v64 = [NSNumber numberWithBool:v27[72]];
    v92[1] = v64;
    v91[2] = @"eventMask";
    uint64_t v65 = [NSNumber numberWithUnsignedLong:128];
    v92[2] = v65;
    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:3];

    v67 = [[AWAttentionSampler alloc] initWithOptions:v66];
    v68 = (void *)*((void *)v27 + 6);
    *((void *)v27 + 6) = v67;

    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __31__AWScheduler_initWithOptions___block_invoke_54;
    v83[3] = &unk_1E6069F00;
    objc_copyWeak(&v84, &location);
    [*((id *)v27 + 6) setStateChangedCallback:v83];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __31__AWScheduler_initWithOptions___block_invoke_56;
    v81[3] = &unk_1E6069F28;
    objc_copyWeak(&v82, &location);
    [*((id *)v27 + 6) setOperationEndableCallback:v81];
    v69 = [[AWAttentionStreamer alloc] initWithOptions:v66];
    v71 = (void *)*((void *)v27 + 7);
    v70 = (AWAttentionStreamer **)(v27 + 56);
    *v70 = v69;

    v72 = *v70;
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __31__AWScheduler_initWithOptions___block_invoke_2;
    v79[3] = &unk_1E6069F50;
    objc_copyWeak(&v80, &location);
    [(AWAttentionStreamer *)v72 setNotificationHandler:v79 withMask:128];
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v82);
    objc_destroyWeak(&v84);
  }
  objc_destroyWeak(&location);

LABEL_66:
  v73 = v5;
LABEL_67:

  return v73;
}

void __31__AWScheduler_initWithOptions___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (currentLogLevel == 5)
  {
    id v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v16 = 134218498;
      double v17 = v6;
      __int16 v18 = 2112;
      *(void *)uint64_t v19 = WeakRetained;
      *(_WORD *)&v19[8] = 2112;
      *(void *)&v19[10] = v3;
      long long v12 = "%13.5f: %@ attentionSampler state change (%@)";
      BOOL v13 = v4;
      uint32_t v14 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    id v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/Scheduler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          BOOL v7 = i;
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
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          int v16 = 136316162;
          double v17 = *(double *)&v7;
          __int16 v18 = 1024;
          *(_DWORD *)uint64_t v19 = 210;
          *(_WORD *)&v19[4] = 2048;
          *(double *)&v19[6] = v10;
          *(_WORD *)&v19[14] = 2112;
          *(void *)&v19[16] = WeakRetained;
          __int16 v20 = 2112;
          id v21 = v3;
          long long v12 = "%30s:%-4d: %13.5f: %@ attentionSampler state change (%@)";
          BOOL v13 = v4;
          uint32_t v14 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  id v15 = objc_loadWeakRetained((id *)(a1 + 32));
  [v15 armEvents];
}

uint64_t __31__AWScheduler_initWithOptions___block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained canActiveOperationBeEnded];

  return v2;
}

void __31__AWScheduler_initWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleNotification:a2];
}

+ (id)sharedUnitTestScheduler
{
  if (sharedUnitTestScheduler_onceToken != -1) {
    dispatch_once(&sharedUnitTestScheduler_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)sharedUnitTestScheduler_unitTestScheduler;

  return v2;
}

void __38__AWScheduler_sharedUnitTestScheduler__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"initForUnitTest";
  v0 = [NSNumber numberWithBool:1];
  v8[0] = v0;
  v7[1] = @"allowFaceDetect";
  v1 = [NSNumber numberWithBool:1];
  v8[1] = v1;
  v7[2] = @"allowHIDEvents";
  uint64_t v2 = [NSNumber numberWithBool:1];
  v8[2] = v2;
  v7[3] = @"allowMotionDetect";
  id v3 = [NSNumber numberWithBool:1];
  v7[4] = @"identifier";
  v8[3] = v3;
  v8[4] = @"Unit test scheduler";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  unint64_t v5 = [[AWScheduler alloc] initWithOptions:v4];
  double v6 = (void *)sharedUnitTestScheduler_unitTestScheduler;
  sharedUnitTestScheduler_unitTestScheduler = (uint64_t)v5;
}

+ (id)sharedMotionDetectScheduler
{
  if (sharedMotionDetectScheduler_onceToken != -1) {
    dispatch_once(&sharedMotionDetectScheduler_onceToken, &__block_literal_global_20);
  }
  uint64_t v2 = (void *)sharedMotionDetectScheduler_motionDetectScheduler;

  return v2;
}

void __42__AWScheduler_sharedMotionDetectScheduler__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"initForUnitTest";
  v0 = [NSNumber numberWithBool:0];
  v8[0] = v0;
  v7[1] = @"allowFaceDetect";
  v1 = [NSNumber numberWithBool:0];
  v8[1] = v1;
  v7[2] = @"allowHIDEvents";
  uint64_t v2 = [NSNumber numberWithBool:0];
  v8[2] = v2;
  v7[3] = @"allowMotionDetect";
  id v3 = [NSNumber numberWithBool:1];
  v7[4] = @"identifier";
  v8[3] = v3;
  v8[4] = @"Motion detect scheduler";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  unint64_t v5 = [[AWScheduler alloc] initWithOptions:v4];
  double v6 = (void *)sharedMotionDetectScheduler_motionDetectScheduler;
  sharedMotionDetectScheduler_motionDetectScheduler = (uint64_t)v5;
}

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedScheduler_scheduler;

  return v2;
}

void __30__AWScheduler_sharedScheduler__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"initForUnitTest";
  v0 = [NSNumber numberWithBool:0];
  v8[0] = v0;
  v7[1] = @"allowFaceDetect";
  v1 = [NSNumber numberWithBool:1];
  v8[1] = v1;
  v7[2] = @"allowHIDEvents";
  uint64_t v2 = [NSNumber numberWithBool:1];
  v8[2] = v2;
  v7[3] = @"allowMotionDetect";
  id v3 = [NSNumber numberWithBool:0];
  v7[4] = @"identifier";
  v8[3] = v3;
  v8[4] = @"Face detect scheduler";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  unint64_t v5 = [[AWScheduler alloc] initWithOptions:v4];
  double v6 = (void *)sharedScheduler_scheduler;
  sharedScheduler_scheduler = (uint64_t)v5;
}

@end