@interface AWRemoteClient
- (AWRemoteClient)initWithProxy:(id)a3 connection:(id)a4 clientConfig:(id)a5 clientIndex:(int)a6 clientId:(id)a7 scheduler:(id)a8 error:(id *)a9;
- (BOOL)_interestedInHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 metadata:(id *)a5 senderID:(unint64_t)a6 displayUUID:(id)a7;
- (BOOL)_isSamplingClient;
- (BOOL)_setClientConfig:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5;
- (BOOL)activateAttentionDetection;
- (BOOL)activateEyeRelief;
- (BOOL)activateMotionDetect;
- (BOOL)canDeliverPollingEvent;
- (BOOL)canOperationBeEndedForClient;
- (BOOL)invalid;
- (BOOL)isStreamingClient;
- (BOOL)shouldInitBeSent;
- (NSString)identifier;
- (NSUUID)clientId;
- (double)streamingDuration;
- (id)connection;
- (id)description;
- (int)clientIndex;
- (unint64_t)_activeEventMask;
- (unint64_t)eventMask;
- (unint64_t)nextAttentionLostTime:(BOOL *)a3;
- (unint64_t)nextSampleTime;
- (unint64_t)nextTimerForTime:(unint64_t)a3;
- (unint64_t)samplingDelay;
- (unint64_t)samplingInterval;
- (unint64_t)streamingStartTime;
- (void)_resetAttentionLostTimer;
- (void)cancelFaceDetectStreamWithReply:(id)a3;
- (void)deliverEvent:(id)a3;
- (void)deliverNotification:(unint64_t)a3;
- (void)deliverPollEventType:(unint64_t)a3 event:(id)a4;
- (void)getLastEvent:(id)a3;
- (void)initializeClientState;
- (void)invalidate;
- (void)invalidateWithHandler:(id)a3;
- (void)invalidateWithoutQueue;
- (void)notifyClientOfStreamingEvent:(id)a3;
- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4;
- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4 metadata:(id *)a5;
- (void)notifyHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7;
- (void)pingWithReply:(id)a3;
- (void)pollWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)reevaluateConfig;
- (void)resetAttentionLostTimerWithReply:(id)a3;
- (void)setClientConfig:(id)a3 shouldReset:(BOOL)a4 reply:(id)a5;
- (void)setIdentifier:(id)a3;
- (void)setStreamingDuration:(double)a3;
- (void)setStreamingStartTime:(unint64_t)a3;
- (void)streamFaceDetectEventsWithReply:(id)a3;
- (void)updateDeadlinesForTime:(unint64_t)a3;
- (void)updateEventTimesForMask:(unint64_t)a3 timestamp:(unint64_t)a4;
@end

@implementation AWRemoteClient

- (BOOL)isStreamingClient
{
  return self->_continuousFaceDetectMode;
}

- (BOOL)activateMotionDetect
{
  return self->_activateMotionDetect;
}

- (BOOL)activateAttentionDetection
{
  return self->_activateAttentionDetection;
}

- (void)notifyHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if ([(AWRemoteClient *)self _interestedInHIDEvent:a3 mask:a4 metadata:v10 senderID:a6 displayUUID:a7])
  {
    [(AWRemoteClient *)self notifyEvent:a4 timestamp:a5 metadata:v10];
  }
}

- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4 metadata:(id *)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v9 = [(AWRemoteClient *)self _activeEventMask] & a3;
  switch(v9)
  {
    case 0uLL:
      return;
    case 1uLL:
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v12 = self->_attentionLostTimeoutsSec;
      uint64_t v16 = [(NSArray *)v12 countByEnumeratingWithState:&v56 objects:v72 count:16];
      if (!v16) {
        goto LABEL_91;
      }
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v57;
      if (a4 == -1) {
        double v20 = INFINITY;
      }
      else {
        double v20 = (double)a4 / 1000000000.0;
      }
      unint64_t v21 = 0x1E6069000uLL;
      *(void *)&long long v17 = 136315906;
      long long v54 = v17;
      unint64_t v55 = a4;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "doubleValue", v54);
          double v24 = v23;
          clientState = self->_clientState;
          unint64_t var1 = clientState->var1;
          unint64_t v27 = (unint64_t)(v23 * 1000000000.0);
          if (v23 > 1.84467441e19) {
            unint64_t v27 = -1;
          }
          uint64_t v28 = var1 + v27;
          if (var1 + v27 >= 0xFFFFFFFFFFFFFFFELL) {
            uint64_t v28 = -2;
          }
          if (__CFADD__(var1, v27)) {
            unint64_t v29 = -2;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29 > a4) {
            continue;
          }
          if (clientState->var9)
          {
            clientState->var9 = 0;
            +[AWSampleLogger client:self attentionStateChange:0];
            BOOL retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
          }
          else
          {
            double var0 = clientState->var0;
            BOOL retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
            if (var0 >= v24)
            {
              if (!self->_retroactiveTimeoutMode) {
                continue;
              }
              goto LABEL_35;
            }
          }
          if (!retroactiveTimeoutMode) {
            goto LABEL_51;
          }
LABEL_35:
          if (currentLogLevel < 7) {
            goto LABEL_50;
          }
          v32 = _AALog();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          v33 = v12;
          unint64_t v34 = v21;
          v35 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
          for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
                *(j - 1) == 47;
                ++j)
          {
            v35 = j;
LABEL_42:
            ;
          }
          if (*(j - 1)) {
            goto LABEL_42;
          }
          unint64_t v37 = absTimeNS();
          if (v37 == -1) {
            double v38 = INFINITY;
          }
          else {
            double v38 = (double)v37 / 1000000000.0;
          }
          *(_DWORD *)buf = v54;
          v61 = v35;
          __int16 v62 = 1024;
          int v63 = 575;
          __int16 v64 = 2048;
          double v65 = v38;
          __int16 v66 = 2048;
          double v67 = v24;
          _os_log_impl(&dword_1B3B4B000, v32, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: Setting up retroactive timeout mode for %13.5f timeout value", buf, 0x26u);
          unint64_t v21 = v34;
          v12 = v33;
          a4 = v55;
LABEL_49:

LABEL_50:
          self->_BOOL retroactiveTimeoutMode = 0;
LABEL_51:
          self->_clientState->double var0 = v24;
          v39 = (void *)[objc_alloc(*(Class *)(v21 + 3336)) initWithTimestamp:self->_tagIndex tagIndex:v20 attentionLostTimeout:v24];
          [(AWRemoteClient *)self deliverEvent:v39];
        }
        uint64_t v18 = [(NSArray *)v12 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (!v18) {
          goto LABEL_91;
        }
      }
    case 2uLL:
    case 4uLL:
    case 8uLL:
      if (!a5) {
        __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 614, "metadata != NULL");
      }
      v10 = [AWDigitizerButtonKeyboardAttentionEvent alloc];
      if (a4 == -1) {
        double v11 = INFINITY;
      }
      else {
        double v11 = (double)a4 / 1000000000.0;
      }
      uint64_t v15 = [(AWDigitizerButtonKeyboardAttentionEvent *)v10 initWithTimestamp:self->_tagIndex tagIndex:v9 eventMask:a5 digitizerButtonKeyboardMetadata:v11];
      goto LABEL_66;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_11;
    default:
      if (v9 == 32)
      {
        if (!a5) {
          __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 606, "metadata != NULL");
        }
        v40 = [AWRemoteAttentionEvent alloc];
        if (a4 == -1) {
          double v41 = INFINITY;
        }
        else {
          double v41 = (double)a4 / 1000000000.0;
        }
        uint64_t v15 = [(AWRemoteAttentionEvent *)v40 initWithTimestamp:self->_tagIndex tagIndex:a5 remoteMetadata:v41];
      }
      else if (v9 == 128)
      {
        if (!a5) {
          __assert_rtn("-[AWRemoteClient notifyEvent:timestamp:metadata:]", "RemoteClient.m", 598, "metadata != NULL");
        }
        if (self->_nonSampledAttentionLostTimeoutEnable && self->_clientState->var11)
        {
          v12 = 0;
          goto LABEL_68;
        }
        v42 = [AWFaceDetectAttentionEvent alloc];
        if (a4 == -1) {
          double v43 = INFINITY;
        }
        else {
          double v43 = (double)a4 / 1000000000.0;
        }
        uint64_t v15 = [(AWFaceDetectAttentionEvent *)v42 initWithTimestamp:self->_tagIndex tagIndex:a5 faceMetadata:v43];
      }
      else
      {
LABEL_11:
        v13 = [AWAttentionEvent alloc];
        if (a4 == -1) {
          double v14 = INFINITY;
        }
        else {
          double v14 = (double)a4 / 1000000000.0;
        }
        uint64_t v15 = [(AWAttentionEvent *)v13 initWithTimestamp:self->_tagIndex tagIndex:v9 eventMask:v14];
      }
LABEL_66:
      v12 = (NSArray *)v15;
      if (v15 && !self->_clientState->var9)
      {
        [(AWRemoteClient *)self deliverEvent:v15];
        goto LABEL_85;
      }
LABEL_68:
      if (currentLogLevel < 7) {
        goto LABEL_85;
      }
      v44 = _AALog();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_84;
      }
      v45 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      v46 = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      while (2)
      {
        if (*(v46 - 1) == 47)
        {
          v45 = v46;
          goto LABEL_75;
        }
        if (*(v46 - 1))
        {
LABEL_75:
          ++v46;
          continue;
        }
        break;
      }
      unint64_t v47 = absTimeNS();
      if (v47 == -1) {
        double v48 = INFINITY;
      }
      else {
        double v48 = (double)v47 / 1000000000.0;
      }
      identifier = self->_identifier;
      uint64_t v50 = getEventMaskDescription(v9);
      v51 = (void *)v50;
      if (a4 == -1) {
        double v52 = INFINITY;
      }
      else {
        double v52 = (double)a4 / 1000000000.0;
      }
      *(_DWORD *)buf = 136316418;
      v61 = v45;
      __int16 v62 = 1024;
      int v63 = 634;
      __int16 v64 = 2048;
      double v65 = v48;
      __int16 v66 = 2112;
      double v67 = *(double *)&identifier;
      __int16 v68 = 2112;
      uint64_t v69 = v50;
      __int16 v70 = 2048;
      double v71 = v52;
      _os_log_impl(&dword_1B3B4B000, v44, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: bump client %@ timestamp with %@ at %13.5f", buf, 0x3Au);

LABEL_84:
LABEL_85:
      if (self->_clientState->var7)
      {
        if ([(AWRemoteClient *)self canDeliverPollingEvent])
        {
          [(AWRemoteClient *)self deliverPollEventType:2 event:v12];
          v53 = self->_clientState;
          v53->var6 = 0;
          v53->var7 = 0;
          self->_filteredPollingEventDelivered = 1;
        }
        else if (!self->_clientState->var8)
        {
          [(AWRemoteClient *)self deliverPollEventType:1 event:0];
          self->_clientState->var8 = 1;
        }
      }
      [(AWRemoteClient *)self updateEventTimesForMask:v9 timestamp:a4];
LABEL_91:

      return;
  }
}

- (BOOL)_interestedInHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 metadata:(id *)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  double v11 = (__CFString *)a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v12 = 1;
  if (a4 <= 8 && ((1 << a4) & 0x114) != 0)
  {
    unint64_t eventMask = self->_eventMask;
    if ((eventMask & 8) != 0)
    {
      if (![(NSSet *)self->_digitizerDisplayUUIDs count]) {
        goto LABEL_17;
      }
      digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
      if (!v11) {
        goto LABEL_15;
      }
    }
    else
    {
      if ((eventMask & 2) == 0)
      {
        if ((eventMask & 4) != 0 && [(NSSet *)self->_keyboardDisplayUUIDs count])
        {
          digitizerDisplayUUIDs = self->_keyboardDisplayUUIDs;
          if (v11)
          {
            if (![(NSSet *)digitizerDisplayUUIDs containsObject:v11]) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
          goto LABEL_15;
        }
LABEL_17:
        a5->var1.double var0 = a6;
        a5->var1.unint64_t var1 = (int64_t)v11;
        goto LABEL_19;
      }
      if (![(NSSet *)self->_buttonDisplayUUIDs count]) {
        goto LABEL_17;
      }
      digitizerDisplayUUIDs = self->_buttonDisplayUUIDs;
      if (!v11)
      {
LABEL_15:
        uint64_t v15 = @"builtIn";
LABEL_16:
        if (![(NSSet *)digitizerDisplayUUIDs containsObject:v15])
        {
LABEL_18:
          BOOL v12 = 0;
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    uint64_t v15 = v11;
    goto LABEL_16;
  }
LABEL_19:

  return v12;
}

- (void)updateEventTimesForMask:(unint64_t)a3 timestamp:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  clientState = self->_clientState;
  unint64_t var1 = clientState->var1;
  if (var1 <= a4) {
    unint64_t var1 = a4;
  }
  clientState->unint64_t var1 = var1;
  if ((a3 & 0x80) != 0) {
    goto LABEL_28;
  }
  if (currentLogLevel < 7) {
    goto LABEL_20;
  }
  unint64_t v9 = _AALog();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_19;
  }
  v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    v10 = i;
LABEL_11:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_11;
  }
  unint64_t v12 = absTimeNS();
  if (v12 == -1) {
    double v13 = INFINITY;
  }
  else {
    double v13 = (double)v12 / 1000000000.0;
  }
  if (a4 == -1) {
    double v14 = INFINITY;
  }
  else {
    double v14 = (double)a4 / 1000000000.0;
  }
  uint64_t v15 = getEventMaskDescription(a3);
  int v20 = 136316162;
  unint64_t v21 = v10;
  __int16 v22 = 1024;
  int v23 = 518;
  __int16 v24 = 2048;
  double v25 = v13;
  __int16 v26 = 2048;
  double v27 = v14;
  __int16 v28 = 2112;
  unint64_t v29 = v15;
  _os_log_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: Last HID Event %13.5f, %@", (uint8_t *)&v20, 0x30u);

LABEL_19:
  clientState = self->_clientState;
LABEL_20:
  clientState->var11 = 0;
  if (clientState->var2 < a4)
  {
    clientState->var2 = a4;
    if (self->_nonSampledAttentionLostTimeoutEnable)
    {
      if (self->_nonSampledAttentionTimerResumed) {
        dispatch_suspend((dispatch_object_t)self->_nonSampledAttentionTimer);
      }
      nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
      double nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
      if (nonSampledAttentionLostTimeout > 1.84467441e19) {
        int64_t v18 = -1;
      }
      else {
        int64_t v18 = (unint64_t)(nonSampledAttentionLostTimeout * 1000000000.0);
      }
      dispatch_time_t v19 = dispatch_time(0, v18);
      dispatch_source_set_timer(nonSampledAttentionTimer, v19, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      dispatch_resume((dispatch_object_t)self->_nonSampledAttentionTimer);
      self->_nonSampledAttentionTimerResumed = 1;
      clientState = self->_clientState;
    }
  }
LABEL_28:
  if (!clientState->var9 && !clientState->var11)
  {
    clientState->var9 = 1;
    +[AWSampleLogger client:self attentionStateChange:1];
  }
}

- (unint64_t)nextAttentionLostTime:(BOOL *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel < 7) {
    goto LABEL_20;
  }
  v5 = _AALog();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_19;
  }
  v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    v6 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v8 = absTimeNS();
  if (v8 == -1) {
    double v9 = INFINITY;
  }
  else {
    double v9 = (double)v8 / 1000000000.0;
  }
  clientState = self->_clientState;
  unint64_t var1 = clientState->var1;
  if (var1 == -1) {
    double v12 = INFINITY;
  }
  else {
    double v12 = (double)var1 / 1000000000.0;
  }
  identifier = self->_identifier;
  BOOL var9 = clientState->var9;
  unint64_t var0 = (unint64_t)clientState->var0;
  if (var0 == -1) {
    double v16 = INFINITY;
  }
  else {
    double v16 = (double)var0 / 1000000000.0;
  }
  *(_DWORD *)buf = 136316674;
  v45 = v6;
  __int16 v46 = 1024;
  int v47 = 1000;
  __int16 v48 = 2048;
  double v49 = v9;
  __int16 v50 = 2112;
  v51 = identifier;
  __int16 v52 = 1024;
  BOOL v53 = var9;
  __int16 v54 = 2048;
  double v55 = v12;
  __int16 v56 = 2048;
  double v57 = v16;
  _os_log_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ lastState %d lastPos %13.5f lastNegTO %13.5f", buf, 0x40u);
LABEL_19:

LABEL_20:
  if (a3) {
    *a3 = 0;
  }
  long long v17 = self->_clientState;
  if (!v17->var1) {
    return -1;
  }
  if (!v17->var9 || ![(NSArray *)self->_attentionLostTimeoutsSec count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    __int16 v28 = self->_attentionLostTimeoutsSec;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v40;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "doubleValue", (void)v39);
          unint64_t v34 = self->_clientState;
          if (v34->var0 < v33)
          {
            unint64_t v35 = v34->var1;
            unint64_t v36 = (unint64_t)(v33 * 1000000000.0);
            if (v33 > 1.84467441e19) {
              unint64_t v36 = -1;
            }
            uint64_t v37 = v35 + v36;
            if (v35 + v36 >= 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v37 = -2;
            }
            if (__CFADD__(v35, v36)) {
              unint64_t v27 = -2;
            }
            else {
              unint64_t v27 = v37;
            }

            return v27;
          }
          if (self->_retroactiveTimeoutMode) {
            [(AWRemoteClient *)self notifyEvent:1 timestamp:absTimeNS() metadata:0];
          }
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    return -1;
  }
  int64_t v18 = [(NSArray *)self->_attentionLostTimeoutsSec objectAtIndexedSubscript:0];
  [v18 doubleValue];
  if (v19 > 1.84467441e19) {
    unint64_t v20 = -1;
  }
  else {
    unint64_t v20 = (unint64_t)(v19 * 1000000000.0);
  }

  unint64_t samplingInterval = self->_samplingInterval;
  if (samplingInterval)
  {
    if (a3)
    {
      unint64_t samplingDelay = self->_samplingDelay;
      BOOL v23 = v20 >= samplingDelay;
      unint64_t v24 = v20 - samplingDelay;
      if (v23) {
        *a3 = v24 % samplingInterval == 0;
      }
    }
  }
  unint64_t v25 = self->_clientState->var1;
  unint64_t v26 = v25 + v20;
  if (v25 + v20 >= 0xFFFFFFFFFFFFFFFELL) {
    unint64_t v26 = -2;
  }
  if (__CFADD__(v25, v20)) {
    return -2;
  }
  else {
    return v26;
  }
}

- (unint64_t)nextTimerForTime:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(AWScheduler *)self->_scheduler attentionSampler];
  if (![(AWRemoteClient *)self _isSamplingClient]
    || [v5 currentState] != 2)
  {
    unint64_t v26 = -1;
    updateDeadline(&v26, [(AWRemoteClient *)self nextAttentionLostTime:0], self->_identifier, (uint64_t)"[self nextAttentionLostTime:NULL]", 1305);
    clientState = self->_clientState;
    if (clientState->var7)
    {
      if (!clientState->var8 && !clientState->var10)
      {
        unint64_t var6 = clientState->var6;
        uint64_t v11 = var6 + 2000000000;
        if (var6 + 2000000000 >= 0xFFFFFFFFFFFFFFFELL) {
          uint64_t v11 = -2;
        }
        if (var6 < 0xFFFFFFFF88CA6C00) {
          unint64_t v12 = v11;
        }
        else {
          unint64_t v12 = -2;
        }
        updateDeadline(&v26, v12, self->_identifier, (uint64_t)"computeDeadline(_clientState->pollingStartTime, MAX_POLL_INITIALIZED_DELAY)", 1313);
      }
      if ([(AWRemoteClient *)self _isSamplingClient])
      {
        unint64_t v13 = [v5 minimumAttentionSamplerErrorRetryTime];
        if (v13 > a3) {
          updateDeadline(&v26, v13, self->_identifier, (uint64_t)"minErrorRetryTime", 1323);
        }
      }
      updateDeadline(&v26, self->_clientState->var7, self->_identifier, (uint64_t)"_clientState->pollingDeadline", 1328);
    }
    if (![(AWRemoteClient *)self _isSamplingClient]) {
      goto LABEL_31;
    }
    unint64_t v14 = [(AWRemoteClient *)self nextSampleTime];
    if ([v5 currentState] != 3
      && v14 > a3
      && [v5 currentState] != 4
      || self->_sampleWhileAbsent
      || self->_activateMotionDetect)
    {
      updateDeadline(&v26, v14, self->_identifier, (uint64_t)"nextSampleTime", 1344);
      goto LABEL_31;
    }
    if (currentLogLevel < 7) {
      goto LABEL_31;
    }
    int64_t v18 = _AALog();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    double v19 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
    for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        double v19 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v23 = absTimeNS();
        if (v23 == -1) {
          double v24 = INFINITY;
        }
        else {
          double v24 = (double)v23 / 1000000000.0;
        }
        identifier = self->_identifier;
        *(_DWORD *)buf = 136315906;
        __int16 v28 = v19;
        __int16 v29 = 1024;
        int v30 = 1337;
        __int16 v31 = 2048;
        double v32 = v24;
        __int16 v33 = 2112;
        unint64_t v34 = identifier;
        _os_log_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ ignoring next sampling deadline since the sampler state is absent", buf, 0x26u);
LABEL_51:

LABEL_31:
        unint64_t v15 = v26;
        goto LABEL_46;
      }
    }
  }
  if (currentLogLevel < 7) {
    goto LABEL_45;
  }
  v6 = _AALog();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_44;
  }
  v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(j - 1) == 47;
        ++j)
  {
    v7 = j;
LABEL_10:
    ;
  }
  if (*(j - 1)) {
    goto LABEL_10;
  }
  unint64_t v16 = absTimeNS();
  if (v16 == -1) {
    double v17 = INFINITY;
  }
  else {
    double v17 = (double)v16 / 1000000000.0;
  }
  unint64_t v21 = self->_identifier;
  *(_DWORD *)buf = 136315906;
  __int16 v28 = v7;
  __int16 v29 = 1024;
  int v30 = 1296;
  __int16 v31 = 2048;
  double v32 = v17;
  __int16 v33 = 2112;
  unint64_t v34 = v21;
  _os_log_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ doesn't need to be scheduled since the sampler is initializing", buf, 0x26u);
LABEL_44:

LABEL_45:
  unint64_t v15 = -1;
LABEL_46:

  return v15;
}

- (BOOL)_isSamplingClient
{
  return ([(AWRemoteClient *)self _activeEventMask] >> 7) & 1;
}

- (unint64_t)_activeEventMask
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = 56;
  if (!self->_clientState->var9) {
    uint64_t v3 = 64;
  }
  return *(unint64_t *)((char *)&self->super.isa + v3);
}

- (void)updateDeadlinesForTime:(unint64_t)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(AWScheduler *)self->_scheduler attentionSampler];
  unsigned __int8 v83 = 0;
  unint64_t v6 = [(AWRemoteClient *)self nextAttentionLostTime:&v83];
  if (currentLogLevel < 7) {
    goto LABEL_26;
  }
  v7 = _AALog();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_25;
  }
  unint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    unint64_t v8 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v10 = absTimeNS();
  if (v10 == -1) {
    double v11 = INFINITY;
  }
  else {
    double v11 = (double)v10 / 1000000000.0;
  }
  if (a3 == -1) {
    double v12 = INFINITY;
  }
  else {
    double v12 = (double)a3 / 1000000000.0;
  }
  unint64_t var7 = self->_clientState->var7;
  if (var7 == -1) {
    double v14 = INFINITY;
  }
  else {
    double v14 = (double)var7 / 1000000000.0;
  }
  if (v6 == -1) {
    double v15 = INFINITY;
  }
  else {
    double v15 = (double)v6 / 1000000000.0;
  }
  identifier = self->_identifier;
  int v17 = v83;
  AttentionSamplerStateDescription = getAttentionSamplerStateDescription([v5 currentState]);
  unint64_t v19 = [v5 lastPositiveDetectTime];
  if (v19 == -1) {
    double v20 = INFINITY;
  }
  else {
    double v20 = (double)v19 / 1000000000.0;
  }
  buf[0] = 136317442;
  *(void *)&buf[1] = v8;
  LOWORD(buf[3]) = 1024;
  *(_DWORD *)((char *)&buf[3] + 2) = 1118;
  HIWORD(buf[4]) = 2048;
  *(double *)&buf[5] = v11;
  LOWORD(buf[7]) = 2112;
  *(void *)((char *)&buf[7] + 2) = identifier;
  HIWORD(buf[9]) = 2048;
  *(double *)&buf[10] = v12;
  LOWORD(buf[12]) = 2048;
  *(double *)((char *)&buf[12] + 2) = v14;
  HIWORD(buf[14]) = 2048;
  *(double *)&buf[15] = v15;
  LOWORD(buf[17]) = 1024;
  *(_DWORD *)((char *)&buf[17] + 2) = v17;
  HIWORD(buf[18]) = 2080;
  *(void *)&buf[19] = AttentionSamplerStateDescription;
  LOWORD(buf[21]) = 2048;
  *(double *)((char *)&buf[21] + 2) = v20;
  _os_log_impl(&dword_1B3B4B000, v7, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ now %13.5f pollingDeadline %13.5f attentionLostTime %13.5f shouldSample %d samplerState %s lastPos %13.5f", (uint8_t *)buf, 0x5Eu);
LABEL_25:

LABEL_26:
  if (!self->_activateMotionDetect)
  {
    if (!self->_clientState->var10)
    {
      if (self->_continuousFaceDetectMode) {
        goto LABEL_45;
      }
      int v23 = [v5 currentState];
      clientState = self->_clientState;
      if (v23 == 1)
      {
        clientState->var10 = 1;
        unint64_t v21 = self;
        uint64_t v22 = 1;
        goto LABEL_43;
      }
      if (!clientState->var10) {
        goto LABEL_45;
      }
    }
    if (self->_continuousFaceDetectMode
      || [v5 currentState] != 3 && objc_msgSend(v5, "currentState") != 5)
    {
      goto LABEL_45;
    }
    self->_clientState->var10 = 0;
    unint64_t v21 = self;
    uint64_t v22 = 2;
LABEL_43:
    [(AWRemoteClient *)v21 deliverNotification:v22];
    goto LABEL_45;
  }
  if (self->_clientState->var10) {
    goto LABEL_28;
  }
  if ([(AWScheduler *)self->_scheduler canRunMotionDetect])
  {
    if (self->_clientState->var10)
    {
LABEL_28:
      if ([(AWScheduler *)self->_scheduler canRunMotionDetect]
        && ([v5 currentState] == 3 || objc_msgSend(v5, "currentState") == 5))
      {
        [(AWRemoteClient *)self deliverNotification:16];
        self->_clientState->var10 = 0;
      }
    }
  }
  else
  {
    [(AWRemoteClient *)self deliverNotification:8];
    self->_clientState->var10 = 1;
  }
LABEL_45:
  unint64_t v25 = self->_clientState;
  if (v25->var7)
  {
    if (!v25->var8)
    {
      if (![(AWRemoteClient *)self _isSamplingClient]) {
        goto LABEL_80;
      }
      if ([v5 currentState] == 3 || objc_msgSend(v5, "currentState") == 4)
      {
        unint64_t var6 = self->_clientState->var6;
        uint64_t v27 = var6 + 2000000000;
        if (var6 + 2000000000 >= 0xFFFFFFFFFFFFFFFELL) {
          uint64_t v27 = -2;
        }
        if (var6 < 0xFFFFFFFF88CA6C00) {
          unint64_t v28 = v27;
        }
        else {
          unint64_t v28 = -2;
        }
        if (v28 >= a3)
        {
          if ([(AWRemoteClient *)self shouldInitBeSent]) {
            goto LABEL_80;
          }
        }
        else
        {
          if (currentLogLevel == 5)
          {
            __int16 v29 = _AALog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v30 = absTimeNS();
              if (v30 == -1) {
                double v31 = INFINITY;
              }
              else {
                double v31 = (double)v30 / 1000000000.0;
              }
              buf[0] = 134217984;
              *(double *)&buf[1] = v31;
              unint64_t v36 = "%13.5f: timed out waiting for poll initialization; sending event now";
              uint64_t v37 = v29;
              uint32_t v38 = 12;
LABEL_78:
              _os_log_impl(&dword_1B3B4B000, v37, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)buf, v38);
            }
            goto LABEL_79;
          }
          if (currentLogLevel >= 6)
          {
            __int16 v29 = _AALog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              double v32 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
              for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
                    ;
                    ++j)
              {
                if (*(j - 1) == 47)
                {
                  double v32 = j;
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
                  buf[0] = 136315650;
                  *(void *)&buf[1] = v32;
                  LOWORD(buf[3]) = 1024;
                  *(_DWORD *)((char *)&buf[3] + 2) = 1176;
                  HIWORD(buf[4]) = 2048;
                  *(double *)&buf[5] = v35;
                  unint64_t v36 = "%30s:%-4d: %13.5f: timed out waiting for poll initialization; sending event now";
                  uint64_t v37 = v29;
                  uint32_t v38 = 28;
                  goto LABEL_78;
                }
              }
            }
LABEL_79:
          }
LABEL_80:
          [(AWRemoteClient *)self deliverPollEventType:1 event:0];
          self->_clientState->var8 = 1;
        }
      }
    }
    long long v39 = self->_clientState;
    if (v39->var7 <= a3)
    {
      v39->unint64_t var6 = 0;
      v39->unint64_t var7 = 0;
    }
  }
  if (![(AWRemoteClient *)self _isSamplingClient])
  {
    if (v6 <= a3) {
      [(AWRemoteClient *)self notifyEvent:1 timestamp:a3];
    }
    goto LABEL_113;
  }
  if ([v5 currentState] == 5)
  {
    uint64_t v90 = 0;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v87 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    memset(buf, 0, sizeof(buf));
    LOBYTE(buf[0]) = [v5 lastFaceMetadataValid];
    [v5 lastPitch];
    *(void *)&buf[2] = v40;
    [v5 lastYaw];
    *(void *)&uint8_t buf[4] = v41;
    [v5 lastRoll];
    *(void *)&buf[6] = v42;
    *(void *)&buf[8] = [v5 lastOrientation];
    [v5 lastDistance];
    *(void *)&buf[10] = v43;
    *(void *)&buf[12] = [v5 lastFaceState];
    *(void *)&buf[14] = [v5 lastMetadataType];
    memset(&buf[16], 0, 32);
    long long v85 = 0u;
    long long v86 = 0u;
    *(void *)&long long v87 = [v5 lastMotionResult];
    [v5 lastAttentionScore];
    DWORD2(v87) = v44;
    [v5 lastFaceDetectionScore];
    HIDWORD(v87) = v45;
    *(void *)&long long v88 = [v5 lastPersonID];
    [v5 lastFaceBounds];
    uint64_t v46 = 0;
    *((void *)&v88 + 1) = v47;
    *(void *)&long long v89 = v48;
    *((void *)&v89 + 1) = v49;
    uint64_t v90 = v50;
    do
    {
      v51 = [v5 lastMotionData];
      __int16 v52 = [v51 objectAtIndexedSubscript:v46];
      [v52 floatValue];
      buf[v46 + 16] = v53;

      ++v46;
    }
    while (v46 != 16);
    -[AWRemoteClient notifyEvent:timestamp:metadata:](self, "notifyEvent:timestamp:metadata:", 128, [v5 lastPositiveDetectTime], buf);
    goto LABEL_95;
  }
  if (!v83
    || [v5 currentState] == 3
    || [v5 currentState] == 4
    || self->_clientState->var10)
  {
    [(AWRemoteClient *)self notifyEvent:1 timestamp:a3];
    goto LABEL_95;
  }
  if (v83 && v6 <= a3)
  {
    if (currentLogLevel < 7) {
      goto LABEL_160;
    }
    v77 = _AALog();
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_159;
    }
    v78 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
    for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
          ;
          ++k)
    {
      if (*(k - 1) == 47)
      {
        v78 = k;
      }
      else if (!*(k - 1))
      {
        unint64_t v80 = absTimeNS();
        if (v80 == -1) {
          double v81 = INFINITY;
        }
        else {
          double v81 = (double)v80 / 1000000000.0;
        }
        v82 = self->_identifier;
        buf[0] = 136315906;
        *(void *)&buf[1] = v78;
        LOWORD(buf[3]) = 1024;
        *(_DWORD *)((char *)&buf[3] + 2) = 1241;
        HIWORD(buf[4]) = 2048;
        *(double *)&buf[5] = v81;
        LOWORD(buf[7]) = 2112;
        *(void *)((char *)&buf[7] + 2) = v82;
        _os_log_impl(&dword_1B3B4B000, v77, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ scheduling single shot", (uint8_t *)buf, 0x26u);
LABEL_159:

LABEL_160:
        [v5 updateSamplingDeadline:0 forClient:self];
        break;
      }
    }
  }
LABEL_95:
  unint64_t v54 = self->_clientState->var7;
  if (!v54) {
    goto LABEL_113;
  }
  if (currentLogLevel < 7) {
    goto LABEL_112;
  }
  double v55 = _AALog();
  if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_111;
  }
  __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  double v57 = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  while (2)
  {
    if (*(v57 - 1) == 47)
    {
      __int16 v56 = v57;
      goto LABEL_103;
    }
    if (*(v57 - 1))
    {
LABEL_103:
      ++v57;
      continue;
    }
    break;
  }
  unint64_t v58 = absTimeNS();
  if (v58 == -1) {
    double v59 = INFINITY;
  }
  else {
    double v59 = (double)v58 / 1000000000.0;
  }
  v60 = self->_identifier;
  unint64_t v61 = self->_clientState->var7;
  if (v61 == -1) {
    double v62 = INFINITY;
  }
  else {
    double v62 = (double)v61 / 1000000000.0;
  }
  buf[0] = 136316162;
  *(void *)&buf[1] = v56;
  LOWORD(buf[3]) = 1024;
  *(_DWORD *)((char *)&buf[3] + 2) = 1249;
  HIWORD(buf[4]) = 2048;
  *(double *)&buf[5] = v59;
  LOWORD(buf[7]) = 2112;
  *(void *)((char *)&buf[7] + 2) = v60;
  HIWORD(buf[9]) = 2048;
  *(double *)&buf[10] = v62;
  _os_log_impl(&dword_1B3B4B000, v55, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ scheduling poll with deadline %13.5f", (uint8_t *)buf, 0x30u);
LABEL_111:

  unint64_t v54 = self->_clientState->var7;
LABEL_112:
  [v5 updateSamplingDeadline:v54 forClient:self];
LABEL_113:
  unint64_t v63 = [(AWRemoteClient *)self nextSampleTime];
  if (currentLogLevel < 7) {
    goto LABEL_129;
  }
  __int16 v64 = _AALog();
  if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_128;
  }
  double v65 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  __int16 v66 = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  while (2)
  {
    if (*(v66 - 1) == 47)
    {
      double v65 = v66;
      goto LABEL_120;
    }
    if (*(v66 - 1))
    {
LABEL_120:
      ++v66;
      continue;
    }
    break;
  }
  unint64_t v67 = absTimeNS();
  if (v67 == -1) {
    double v68 = INFINITY;
  }
  else {
    double v68 = (double)v67 / 1000000000.0;
  }
  uint64_t v69 = self->_identifier;
  if (v63 == -1) {
    double v70 = INFINITY;
  }
  else {
    double v70 = (double)v63 / 1000000000.0;
  }
  buf[0] = 136316162;
  *(void *)&buf[1] = v65;
  LOWORD(buf[3]) = 1024;
  *(_DWORD *)((char *)&buf[3] + 2) = 1265;
  HIWORD(buf[4]) = 2048;
  *(double *)&buf[5] = v68;
  LOWORD(buf[7]) = 2112;
  *(void *)((char *)&buf[7] + 2) = v69;
  HIWORD(buf[9]) = 2048;
  *(double *)&buf[10] = v70;
  _os_log_impl(&dword_1B3B4B000, v64, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ nextSampleTime %13.5f", (uint8_t *)buf, 0x30u);
LABEL_128:

LABEL_129:
  if (v63 > a3) {
    goto LABEL_144;
  }
  if (currentLogLevel < 7) {
    goto LABEL_143;
  }
  double v71 = _AALog();
  if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_142;
  }
  v72 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  uint64_t v73 = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  while (2)
  {
    if (*(v73 - 1) == 47)
    {
      v72 = v73;
      goto LABEL_137;
    }
    if (*(v73 - 1))
    {
LABEL_137:
      ++v73;
      continue;
    }
    break;
  }
  unint64_t v74 = absTimeNS();
  if (v74 == -1) {
    double v75 = INFINITY;
  }
  else {
    double v75 = (double)v74 / 1000000000.0;
  }
  v76 = self->_identifier;
  buf[0] = 136315906;
  *(void *)&buf[1] = v72;
  LOWORD(buf[3]) = 1024;
  *(_DWORD *)((char *)&buf[3] + 2) = 1269;
  HIWORD(buf[4]) = 2048;
  *(double *)&buf[5] = v75;
  LOWORD(buf[7]) = 2112;
  *(void *)((char *)&buf[7] + 2) = v76;
  _os_log_impl(&dword_1B3B4B000, v71, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ scheduling single shot", (uint8_t *)buf, 0x26u);
LABEL_142:

LABEL_143:
  [v5 updateSamplingDeadline:0 forClient:self];
LABEL_144:
}

- (unint64_t)nextSampleTime
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_activateMotionDetect)
  {
    clientState = self->_clientState;
    unint64_t samplingInterval = self->_samplingInterval;
  }
  else
  {
    unint64_t samplingInterval = self->_samplingInterval;
    if (!samplingInterval) {
      return -1;
    }
    clientState = self->_clientState;
    if (!clientState->var9 && !self->_sampleWhileAbsent) {
      return -1;
    }
  }
  unint64_t var2 = clientState->var2;
  unint64_t samplingDelay = self->_samplingDelay;
  uint64_t v7 = var2 + samplingDelay;
  if (var2 + samplingDelay >= 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v7 = -2;
  }
  if (__CFADD__(var2, samplingDelay)) {
    unint64_t v8 = -2;
  }
  else {
    unint64_t v8 = v7;
  }
  unint64_t v9 = [(AWScheduler *)self->_scheduler nextSamplingTimeForSamplingInterval:samplingInterval];
  if (currentLogLevel < 7) {
    goto LABEL_28;
  }
  unint64_t v10 = _AALog();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_27;
  }
  double v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    double v11 = i;
LABEL_15:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_15;
  }
  unint64_t v14 = absTimeNS();
  if (v14 == -1) {
    double v15 = INFINITY;
  }
  else {
    double v15 = (double)v14 / 1000000000.0;
  }
  identifier = self->_identifier;
  if (v9 == -1) {
    double v17 = INFINITY;
  }
  else {
    double v17 = (double)v9 / 1000000000.0;
  }
  int v18 = 136316418;
  unint64_t v19 = v11;
  __int16 v20 = 1024;
  int v21 = 1079;
  __int16 v22 = 2048;
  double v23 = v15;
  __int16 v24 = 2112;
  unint64_t v25 = identifier;
  __int16 v26 = 2048;
  double v27 = (double)v8 / 1000000000.0;
  __int16 v28 = 2048;
  double v29 = v17;
  _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ delayedTime %13.5f nextSampleTime %13.5f", (uint8_t *)&v18, 0x3Au);
LABEL_27:

LABEL_28:
  if (v8 <= v9) {
    return v9;
  }
  else {
    return v8;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)notifyEvent:(unint64_t)a3 timestamp:(unint64_t)a4
{
}

- (void)deliverEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (AWAttentionEvent *)a3;
  if (currentLogLevel == 5)
  {
    v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      identifier = self->_identifier;
      int v20 = 134218498;
      double v21 = v7;
      __int16 v22 = 2112;
      *(void *)double v23 = identifier;
      *(_WORD *)&v23[8] = 2112;
      *(void *)&v23[10] = v4;
      unint64_t v13 = "%13.5f: notify client %@ of %@";
      unint64_t v14 = v5;
      uint32_t v15 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v8 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v10 = absTimeNS();
          if (v10 == -1) {
            double v11 = INFINITY;
          }
          else {
            double v11 = (double)v10 / 1000000000.0;
          }
          unint64_t v16 = self->_identifier;
          int v20 = 136316162;
          double v21 = *(double *)&v8;
          __int16 v22 = 1024;
          *(_DWORD *)double v23 = 494;
          *(_WORD *)&v23[4] = 2048;
          *(double *)&v23[6] = v11;
          *(_WORD *)&v23[14] = 2112;
          *(void *)&v23[16] = v16;
          __int16 v24 = 2112;
          unint64_t v25 = v4;
          unint64_t v13 = "%30s:%-4d: %13.5f: notify client %@ of %@";
          unint64_t v14 = v5;
          uint32_t v15 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  lastEvent = self->_lastEvent;
  self->_lastEvent = v4;
  int v18 = v4;

  self->_clientState->var5 = [(AWAttentionEvent *)v18 eventMask];
  self->_clientState->var4 = [(AWAttentionEvent *)v18 tagIndex];
  [(AWAttentionEvent *)v18 timestamp];
  self->_clientState->var3 = (unint64_t)v19;
  [(AWFrameworkClient *)self->_proxy notifyEvent:v18];
  +[AWSampleLogger client:self event:v18];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastConfig, 0);
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_allowedHIDEventsForRemoteEvent, 0);
  objc_storeStrong((id *)&self->_nonSampledAttentionTimer, 0);
  objc_storeStrong((id *)&self->_attentionLostTimeoutsSec, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_buttonDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_keyboardDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_digitizerDisplayUUIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (BOOL)activateEyeRelief
{
  return self->_activateEyeRelief;
}

- (void)setStreamingDuration:(double)a3
{
  self->_streamingDuration = a3;
}

- (double)streamingDuration
{
  return self->_streamingDuration;
}

- (void)setStreamingStartTime:(unint64_t)a3
{
  self->_streamingStartTime = a3;
}

- (unint64_t)streamingStartTime
{
  return self->_streamingStartTime;
}

- (NSUUID)clientId
{
  return self->_clientId;
}

- (int)clientIndex
{
  return self->_clientIndex;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (unint64_t)samplingDelay
{
  return self->_samplingDelay;
}

- (unint64_t)samplingInterval
{
  return self->_samplingInterval;
}

- (void)setIdentifier:(id)a3
{
}

- (void)cancelFaceDetectStreamWithReply:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unint64_t v14 = __Block_byref_object_copy__599;
  uint32_t v15 = __Block_byref_object_dispose__600;
  id v16 = 0;
  if (self->_continuousFaceDetectMode)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AWRemoteClient_cancelFaceDetectStreamWithReply___block_invoke;
    block[3] = &unk_1E606AB38;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(queue, block);
  }
  else
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @" Client is not running in streaming mode";
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v8 = [v6 errorWithDomain:*MEMORY[0x1E4F28798] code:13 userInfo:v7];
    unint64_t v9 = (void *)v12[5];
    v12[5] = v8;
  }
  if (v4) {
    v4[2](v4, v12[5]);
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __50__AWRemoteClient_cancelFaceDetectStreamWithReply___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) cancelFaceDetectStream:*(void *)(a1 + 32) withIdentifier:*(void *)(*(void *)(a1 + 32) + 224)];

  return MEMORY[0x1F41817F8]();
}

- (void)streamFaceDetectEventsWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__599;
  double v21 = __Block_byref_object_dispose__600;
  id v22 = 0;
  if (self->_activateAttentionDetection || self->_activateEyeRelief)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke_2;
    block[3] = &unk_1E606AB38;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(queue, block);
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      unint64_t v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218242;
        double v26 = v13;
        __int16 v27 = 2112;
        __int16 v28 = identifier;
        _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, "%13.5f: Client does not want any metadata, not starting a stream for client %@", buf, 0x16u);
      }
    }
    double v7 = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke;
    v16[3] = &unk_1E606AC70;
    v16[4] = self;
    dispatch_sync(v7, v16);
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    __int16 v24 = @" No metadata selected";
    unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v9];
    uint64_t v11 = (void *)v18[5];
    v18[5] = v10;
  }
  if (v4) {
    v4[2](v4, v18[5]);
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeStreamingClientwithIdentifier:*(void *)(*(void *)(a1 + 32) + 224)];
}

uint64_t __50__AWRemoteClient_streamFaceDetectEventsWithReply___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) streamFaceDetectEvents];

  return MEMORY[0x1F41817F8]();
}

- (void)notifyClientOfStreamingEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch([v4 metadataType])
    {
      case 0:
        if (currentLogLevel < 3) {
          goto LABEL_27;
        }
        v5 = _AALog();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        unint64_t v6 = absTimeNS();
        if (v6 == -1) {
          double v7 = INFINITY;
        }
        else {
          double v7 = (double)v6 / 1000000000.0;
        }
        identifier = self->_identifier;
        *(_DWORD *)double v26 = 134218242;
        *(double *)&v26[4] = v7;
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = identifier;
        uint64_t v19 = "%13.5f: Unknown metadata type received, not passing it to client %@";
        goto LABEL_41;
      case 1:
        if (self->_activateAttentionDetection) {
          break;
        }
        if (currentLogLevel < 3) {
          goto LABEL_27;
        }
        v5 = _AALog();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        unint64_t v8 = absTimeNS();
        if (v8 == -1) {
          double v9 = INFINITY;
        }
        else {
          double v9 = (double)v8 / 1000000000.0;
        }
        __int16 v24 = self->_identifier;
        *(_DWORD *)double v26 = 134218242;
        *(double *)&v26[4] = v9;
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v24;
        uint64_t v19 = "%13.5f: AD metadata received, not passing it to client %@";
        goto LABEL_41;
      case 2:
        if (self->_activateEyeRelief) {
          break;
        }
        if (currentLogLevel < 3) {
          goto LABEL_27;
        }
        v5 = _AALog();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        unint64_t v25 = self->_identifier;
        *(_DWORD *)double v26 = 134218242;
        *(double *)&v26[4] = v11;
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v25;
        uint64_t v19 = "%13.5f: ER metadata received, not passing it to client %@";
LABEL_41:
        _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, v19, v26, 0x16u);
LABEL_42:

        goto LABEL_27;
      case 3:
        if (currentLogLevel < 3) {
          break;
        }
        unint64_t v12 = _AALog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        unint64_t v13 = absTimeNS();
        if (v13 == -1) {
          double v14 = INFINITY;
        }
        else {
          double v14 = (double)v13 / 1000000000.0;
        }
        int v20 = self->_identifier;
        *(_DWORD *)double v26 = 134218242;
        *(double *)&v26[4] = v14;
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v20;
        double v21 = "%13.5f: Invalid metadata type received, not passing it to client %@";
        id v22 = v12;
        uint32_t v23 = 22;
        goto LABEL_36;
      case 5:
        if (currentLogLevel < 3) {
          break;
        }
        unint64_t v12 = _AALog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        *(_DWORD *)double v26 = 134217984;
        *(double *)&v26[4] = v17;
        double v21 = "%13.5f: Combined metadata received, passing it up to client since we can't separate it";
        id v22 = v12;
        uint32_t v23 = 12;
LABEL_36:
        _os_log_error_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_ERROR, v21, v26, v23);
LABEL_23:

        break;
      default:
        break;
    }
  }
  if (self->_unityStream) {
    id v15 = [(AWScheduler *)self->_scheduler cancelFaceDetectStream:self withIdentifier:self->_clientId];
  }
  -[AWFrameworkClient notifyStreamingEvent:](self->_proxy, "notifyStreamingEvent:", v4, *(_OWORD *)v26, *(void *)&v26[16], v27);
LABEL_27:
}

- (void)pingWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__AWRemoteClient_pingWithReply___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __32__AWRemoteClient_pingWithReply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel < 7) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v2 = _AALog();
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_13;
  }
  uint64_t v3 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    uint64_t v3 = i;
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
  double v7 = [*(id *)(*(void *)(a1 + 32) + 184) identifier];
  int v9 = 136315906;
  unint64_t v10 = v3;
  __int16 v11 = 1024;
  int v12 = 1356;
  __int16 v13 = 2048;
  double v14 = v6;
  __int16 v15 = 2112;
  unint64_t v16 = v7;
  _os_log_impl(&dword_1B3B4B000, v2, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ is alive", (uint8_t *)&v9, 0x26u);

LABEL_13:
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)canOperationBeEndedForClient
{
  return !self->_clientState->var7 || self->_filteredPollingEventDelivered;
}

- (BOOL)shouldInitBeSent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(AWScheduler *)self->_scheduler attentionSampler];
  if (currentLogLevel == 5)
  {
    uint64_t v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = absTimeNS();
      if (v4 == -1) {
        double v5 = INFINITY;
      }
      else {
        double v5 = (double)v4 / 1000000000.0;
      }
      *(_DWORD *)__int16 v15 = 134218240;
      *(double *)&v15[4] = v5;
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = [v2 samplingSuppressedMask];
      unint64_t v10 = "%13.5f: Sampling suppression mask: %01llX";
      __int16 v11 = v3;
      uint32_t v12 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v6 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v8 = absTimeNS();
          if (v8 == -1) {
            double v9 = INFINITY;
          }
          else {
            double v9 = (double)v8 / 1000000000.0;
          }
          *(_DWORD *)__int16 v15 = 136315906;
          *(void *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 1024;
          *(_DWORD *)&v15[14] = 1088;
          *(_WORD *)&v15[18] = 2048;
          *(double *)&v15[20] = v9;
          *(_WORD *)&v15[28] = 2048;
          *(void *)&v15[30] = [v2 samplingSuppressedMask];
          unint64_t v10 = "%30s:%-4d: %13.5f: Sampling suppression mask: %01llX";
          __int16 v11 = v3;
          uint32_t v12 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  BOOL v13 = (objc_msgSend(v2, "samplingSuppressedMask", *(_OWORD *)v15, *(void *)&v15[16], *(_OWORD *)&v15[24]) & 4) != 0
     || ([v2 samplingSuppressedMask] & 2) != 0
     || ([v2 samplingSuppressedMask] & 1) == 0;

  return v13;
}

- (void)pollWithTimeout:(unint64_t)a3 reply:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  double v7 = (void (**)(id, void))a4;
  if (connectionHasEntitlement(connection, @"com.apple.private.attentionawareness.poll"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AWRemoteClient_pollWithTimeout_reply___block_invoke;
    block[3] = &unk_1E606AB88;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(queue, block);
    v7[2](v7, 0);
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28798];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @" Client not entitled to use pollWithTimeout";
    __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint32_t v12 = [v9 errorWithDomain:v10 code:1 userInfo:v11];
    ((void (**)(id, void *))v7)[2](v7, v12);
  }
}

uint64_t __40__AWRemoteClient_pollWithTimeout_reply___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 40))
  {
    if (currentLogLevel == 5)
    {
      double v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = absTimeNS();
        if (v6 == -1) {
          double v7 = INFINITY;
        }
        else {
          double v7 = (double)v6 / 1000000000.0;
        }
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 200);
        *(_DWORD *)unint64_t v36 = 134218242;
        *(double *)&v36[4] = v7;
        *(_WORD *)&v36[12] = 2112;
        *(void *)&v36[14] = v22;
        uint32_t v23 = "%13.5f: cancelling polling for client %@ with";
        __int16 v24 = v5;
        uint32_t v25 = 22;
LABEL_52:
        _os_log_impl(&dword_1B3B4B000, v24, OS_LOG_TYPE_DEFAULT, v23, v36, v25);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_54:
        *(void *)(*(void *)(*(void *)(a1 + 32) + 168) + 56) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 32) + 168) + 48) = 0;
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "armEvents", *(_OWORD *)v36, *(void *)&v36[16], *(void *)&v36[24], *(void *)&v36[32], *(void *)&v37);
      }
      double v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v10 = i;
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
            uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 200);
            *(_DWORD *)unint64_t v36 = 136315906;
            *(void *)&v36[4] = v10;
            *(_WORD *)&v36[12] = 1024;
            *(_DWORD *)&v36[14] = 980;
            *(_WORD *)&v36[18] = 2048;
            *(double *)&v36[20] = v21;
            *(_WORD *)&v36[28] = 2112;
            *(void *)&v36[30] = v34;
            uint32_t v23 = "%30s:%-4d: %13.5f: cancelling polling for client %@ with";
            __int16 v24 = v5;
            uint32_t v25 = 38;
            goto LABEL_52;
          }
        }
      }
    }

    goto LABEL_54;
  }
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
      unint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 200);
      if (v14 == -1) {
        double v16 = INFINITY;
      }
      else {
        double v16 = (double)v14 / 1000000000.0;
      }
      *(_DWORD *)unint64_t v36 = 134218498;
      *(double *)&v36[4] = v4;
      *(_WORD *)&v36[12] = 2112;
      *(void *)&v36[14] = v15;
      *(_WORD *)&v36[22] = 2048;
      *(double *)&v36[24] = v16;
      uint64_t v17 = "%13.5f: polling for client %@ with timeout %13.5f";
      int v18 = v2;
      uint32_t v19 = 32;
LABEL_42:
      _os_log_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_DEFAULT, v17, v36, v19);
    }
LABEL_43:

    goto LABEL_44;
  }
  if (currentLogLevel >= 6)
  {
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          unint64_t v8 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v12 = absTimeNS();
          if (v12 == -1) {
            double v13 = INFINITY;
          }
          else {
            double v13 = (double)v12 / 1000000000.0;
          }
          unint64_t v26 = *(void *)(a1 + 40);
          uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 200);
          if (v26 == -1) {
            double v28 = INFINITY;
          }
          else {
            double v28 = (double)v26 / 1000000000.0;
          }
          *(_DWORD *)unint64_t v36 = 136316162;
          *(void *)&v36[4] = v8;
          *(_WORD *)&v36[12] = 1024;
          *(_DWORD *)&v36[14] = 973;
          *(_WORD *)&v36[18] = 2048;
          *(double *)&v36[20] = v13;
          *(_WORD *)&v36[28] = 2112;
          *(void *)&v36[30] = v27;
          *(_WORD *)&v36[38] = 2048;
          double v37 = v28;
          uint64_t v17 = "%30s:%-4d: %13.5f: polling for client %@ with timeout %13.5f";
          int v18 = v2;
          uint32_t v19 = 48;
          goto LABEL_42;
        }
      }
    }
    goto LABEL_43;
  }
LABEL_44:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 168) + 48) = absTimeNS();
  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 168);
  uint64_t v31 = *(void *)(v30 + 48);
  uint64_t v32 = v31 + v29;
  if ((unint64_t)(v31 + v29) >= 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v32 = -2;
  }
  if (__CFADD__(v31, v29)) {
    uint64_t v33 = -2;
  }
  else {
    uint64_t v33 = v32;
  }
  *(void *)(v30 + 56) = v33;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 168) + 64) = 0;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "armEvents", *(_OWORD *)v36, *(void *)&v36[16], *(void *)&v36[24], *(void *)&v36[32], *(void *)&v37);
}

- (void)resetAttentionLostTimerWithReply:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AWRemoteClient_resetAttentionLostTimerWithReply___block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  double v4 = (void (**)(id, void))a3;
  dispatch_sync(queue, block);
  v4[2](v4, 0);
}

uint64_t __51__AWRemoteClient_resetAttentionLostTimerWithReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetAttentionLostTimer];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 armEvents];
}

- (void)_resetAttentionLostTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = absTimeNS();
  [(AWRemoteClient *)self updateEventTimesForMask:0 timestamp:v3];
  if (currentLogLevel == 5)
  {
    double v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      identifier = self->_identifier;
      if (v3 == -1) {
        double v12 = INFINITY;
      }
      else {
        double v12 = (double)v3 / 1000000000.0;
      }
      int v18 = 134218498;
      double v19 = v6;
      __int16 v20 = 2112;
      *(void *)double v21 = identifier;
      *(_WORD *)&v21[8] = 2048;
      *(double *)&v21[10] = v12;
      double v13 = "%13.5f: reset attention lost timeout for %@ at %13.5f";
      unint64_t v14 = v4;
      uint32_t v15 = 32;
LABEL_25:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      return;
    }
    double v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v7 = i;
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
          double v16 = self->_identifier;
          if (v3 == -1) {
            double v17 = INFINITY;
          }
          else {
            double v17 = (double)v3 / 1000000000.0;
          }
          int v18 = 136316162;
          double v19 = *(double *)&v7;
          __int16 v20 = 1024;
          *(_DWORD *)double v21 = 952;
          *(_WORD *)&v21[4] = 2048;
          *(double *)&v21[6] = v10;
          *(_WORD *)&v21[14] = 2112;
          *(void *)&v21[16] = v16;
          __int16 v22 = 2048;
          double v23 = v17;
          double v13 = "%30s:%-4d: %13.5f: reset attention lost timeout for %@ at %13.5f";
          unint64_t v14 = v4;
          uint32_t v15 = 48;
          goto LABEL_25;
        }
      }
    }
  }
}

- (void)getLastEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__AWRemoteClient_getLastEvent___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __31__AWRemoteClient_getLastEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 176))
  {
    uint64_t v3 = *(void *)(v2 + 168);
    unint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = *(void *)(v3 + 40);
    if (v4 | v5)
    {
      uint64_t v6 = *(void *)(v3 + 32);
      switch(v5)
      {
        case 128:
          double v7 = [[AWFaceDetectAttentionEvent alloc] initWithTimestamp:v6 tagIndex:0 faceMetadata:(double)v4];
          goto LABEL_12;
        case 32:
          double v7 = [[AWRemoteAttentionEvent alloc] initWithTimestamp:v6 tagIndex:0 remoteMetadata:(double)v4];
          goto LABEL_12;
        case 1:
          double v7 = [[AWAttentionLostEvent alloc] initWithTimestamp:v6 tagIndex:(double)v4 attentionLostTimeout:*(double *)v3];
LABEL_12:
          uint64_t v8 = *(void *)(a1 + 32);
          unint64_t v9 = *(void **)(v8 + 176);
          *(void *)(v8 + 176) = v7;

          goto LABEL_13;
      }
      if ((v5 & 0xFFF) != 0)
      {
        double v7 = [[AWAttentionEvent alloc] initWithTimestamp:v6 tagIndex:v5 eventMask:(double)v4];
        goto LABEL_12;
      }
    }
    double v7 = 0;
    goto LABEL_12;
  }
LABEL_13:
  double v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v10();
}

- (BOOL)canDeliverPollingEvent
{
  if (self->_pollingFilter && [(AWScheduler *)self->_scheduler isDeviceStationary]) {
    return ![(AWScheduler *)self->_scheduler isDeviceOnLockScreen];
  }
  else {
    return 1;
  }
}

- (void)deliverPollEventType:(unint64_t)a3 event:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (currentLogLevel == 5)
  {
    double v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      identifier = self->_identifier;
      *(_DWORD *)double v19 = 134218754;
      *(double *)&v19[4] = v9;
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = identifier;
      *(_WORD *)&v19[22] = 2080;
      *(void *)&v19[24] = getPollEventTypeDescription(a3);
      *(_WORD *)&v19[32] = 2112;
      *(void *)&v19[34] = v6;
      uint32_t v15 = "%13.5f: notify polling client %@ of %s %@";
      double v16 = v7;
      uint32_t v17 = 42;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, v19, v17);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    double v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v10 = i;
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
          int v18 = self->_identifier;
          *(_DWORD *)double v19 = 136316418;
          *(void *)&v19[4] = v10;
          *(_WORD *)&v19[12] = 1024;
          *(_DWORD *)&v19[14] = 506;
          *(_WORD *)&v19[18] = 2048;
          *(double *)&v19[20] = v13;
          *(_WORD *)&v19[28] = 2112;
          *(void *)&v19[30] = v18;
          *(_WORD *)&v19[38] = 2080;
          *(void *)&v19[40] = getPollEventTypeDescription(a3);
          LOWORD(v20) = 2112;
          *(void *)((char *)&v20 + 2) = v6;
          uint32_t v15 = "%30s:%-4d: %13.5f: notify polling client %@ of %s %@";
          double v16 = v7;
          uint32_t v17 = 58;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  -[AWFrameworkClient notifyPollEventType:event:](self->_proxy, "notifyPollEventType:event:", a3, v6, *(_OWORD *)v19, *(void *)&v19[16], *(void *)&v19[24], *(_OWORD *)&v19[32], v20);
}

- (void)deliverNotification:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((self->_notificationMask & a3) != 0)
  {
    if (currentLogLevel == 5)
    {
      uint64_t v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = absTimeNS();
        if (v6 == -1) {
          double v7 = INFINITY;
        }
        else {
          double v7 = (double)v6 / 1000000000.0;
        }
        identifier = self->_identifier;
        double v13 = getNotificationMaskDescription(a3);
        *(_DWORD *)int v18 = 134218498;
        *(double *)&v18[4] = v7;
        *(_WORD *)&v18[12] = 2112;
        *(void *)&v18[14] = identifier;
        *(_WORD *)&v18[22] = 2112;
        *(void *)&v18[24] = v13;
        unint64_t v14 = "%13.5f: notify client %@ of %@";
        uint32_t v15 = v5;
        uint32_t v16 = 32;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, v18, v16);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        -[AWFrameworkClient notify:](self->_proxy, "notify:", a3, *(_OWORD *)v18, *(void *)&v18[16], *(void *)&v18[24], *(void *)&v18[32], v19);
        return;
      }
      uint64_t v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            unint64_t v8 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v10 = absTimeNS();
            if (v10 == -1) {
              double v11 = INFINITY;
            }
            else {
              double v11 = (double)v10 / 1000000000.0;
            }
            uint32_t v17 = self->_identifier;
            double v13 = getNotificationMaskDescription(a3);
            *(_DWORD *)int v18 = 136316162;
            *(void *)&v18[4] = v8;
            *(_WORD *)&v18[12] = 1024;
            *(_DWORD *)&v18[14] = 487;
            *(_WORD *)&v18[18] = 2048;
            *(double *)&v18[20] = v11;
            *(_WORD *)&v18[28] = 2112;
            *(void *)&v18[30] = v17;
            *(_WORD *)&v18[38] = 2112;
            double v19 = v13;
            unint64_t v14 = "%30s:%-4d: %13.5f: notify client %@ of %@";
            uint32_t v15 = v5;
            uint32_t v16 = 48;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
}

- (void)setClientConfig:(id)a3 shouldReset:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  double v9 = (void (**)(id, void))a5;
  uint64_t v16 = 0;
  uint32_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__599;
  uint64_t v20 = __Block_byref_object_dispose__600;
  id v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__AWRemoteClient_setClientConfig_shouldReset_reply___block_invoke;
  v12[3] = &unk_1E606A240;
  v12[4] = self;
  id v11 = v8;
  BOOL v15 = a4;
  id v13 = v11;
  unint64_t v14 = &v16;
  dispatch_sync(queue, v12);
  v9[2](v9, v17[5]);

  _Block_object_dispose(&v16, 8);
}

uint64_t __52__AWRemoteClient_setClientConfig_shouldReset_reply___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v5 + 40);
  [v2 _setClientConfig:v3 shouldReset:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (currentLogLevel == 5)
  {
    unint64_t v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      double v21 = v8;
      __int16 v22 = 2112;
      *(void *)double v23 = v13;
      unint64_t v14 = "%13.5f: updated config %@";
      BOOL v15 = v6;
      uint32_t v16 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_20:

    return [*(id *)(*(void *)(a1 + 32) + 16) armEvents];
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v9 = i;
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
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315906;
          double v21 = *(double *)&v9;
          __int16 v22 = 1024;
          *(_DWORD *)double v23 = 477;
          *(_WORD *)&v23[4] = 2048;
          *(double *)&v23[6] = v12;
          __int16 v24 = 2112;
          uint64_t v25 = v17;
          unint64_t v14 = "%30s:%-4d: %13.5f: updated config %@";
          BOOL v15 = v6;
          uint32_t v16 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) armEvents];
}

- (void)reevaluateConfig
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(AWRemoteClient *)self description];
  [(AWRemoteClient *)self _setClientConfig:self->_lastConfig shouldReset:1 error:0];
  if (currentLogLevel == 5)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      *(_DWORD *)unint64_t v14 = 134218498;
      *(double *)&v14[4] = v6;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = self;
      *(_WORD *)&v14[22] = 2112;
      *(void *)&v14[24] = v3;
      unint64_t v11 = "%13.5f: reevaluated config %@, old config %@";
      double v12 = v4;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, v14, v13);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v7 = i;
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
          *(_DWORD *)unint64_t v14 = 136316162;
          *(void *)&v14[4] = v7;
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = 466;
          *(_WORD *)&v14[18] = 2048;
          *(double *)&v14[20] = v10;
          *(_WORD *)&v14[28] = 2112;
          *(void *)&v14[30] = self;
          *(_WORD *)&v14[38] = 2112;
          BOOL v15 = v3;
          unint64_t v11 = "%30s:%-4d: %13.5f: reevaluated config %@, old config %@";
          double v12 = v4;
          uint32_t v13 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  [(AWScheduler *)self->_scheduler armEvents];
}

- (BOOL)_setClientConfig:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v9 validateWithError:a5] & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v20 = _AALog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        unint64_t v59 = absTimeNS();
        if (v59 == -1) {
          double v60 = INFINITY;
        }
        else {
          double v60 = (double)v59 / 1000000000.0;
        }
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218498;
        double v86 = v60;
        __int16 v87 = 2112;
        long long v88 = identifier;
        __int16 v89 = 2112;
        id v90 = v9;
        _os_log_error_impl(&dword_1B3B4B000, v20, OS_LOG_TYPE_ERROR, "%13.5f: client %@ attempting to set invalid config %@", buf, 0x20u);
      }
    }
    goto LABEL_38;
  }
  if ([v9 sampleWhileAbsent]
    && (connectionHasEntitlement(self->_connection, @"com.apple.private.attentionawareness.samplewhileabsent") & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      double v21 = _AALog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        unint64_t v62 = absTimeNS();
        if (v62 == -1) {
          double v63 = INFINITY;
        }
        else {
          double v63 = (double)v62 / 1000000000.0;
        }
        double v68 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        double v86 = v63;
        __int16 v87 = 2112;
        long long v88 = v68;
        _os_log_error_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use sampleWhileAbsent", buf, 0x16u);
      }
    }
    if (!a5) {
      goto LABEL_38;
    }
    __int16 v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84 = @" Client not entitled to use sampleWhileAbsent";
    __int16 v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v84;
    uint64_t v26 = &v83;
    goto LABEL_37;
  }
  if ([v9 continuousFaceDetectMode]
    && (connectionHasEntitlement(self->_connection, @"com.apple.private.attentionawareness.continuousFaceDetect") & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v27 = _AALog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unint64_t v64 = absTimeNS();
        if (v64 == -1) {
          double v65 = INFINITY;
        }
        else {
          double v65 = (double)v64 / 1000000000.0;
        }
        double v71 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        double v86 = v65;
        __int16 v87 = 2112;
        long long v88 = v71;
        _os_log_error_impl(&dword_1B3B4B000, v27, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use continuousFaceDetectMode", buf, 0x16u);
      }
    }
    if (!a5) {
      goto LABEL_38;
    }
    __int16 v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v81 = *MEMORY[0x1E4F28568];
    v82 = @" Client not entitled to use continuousFaceDetectMode";
    __int16 v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v82;
    uint64_t v26 = &v81;
    goto LABEL_37;
  }
  if ([v9 activateMotionDetect]
    && (connectionHasEntitlement(self->_connection, @"com.apple.private.attentionawareness.motionDetect") & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      double v28 = _AALog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        unint64_t v66 = absTimeNS();
        if (v66 == -1) {
          double v67 = INFINITY;
        }
        else {
          double v67 = (double)v66 / 1000000000.0;
        }
        v72 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        double v86 = v67;
        __int16 v87 = 2112;
        long long v88 = v72;
        _os_log_error_impl(&dword_1B3B4B000, v28, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled to use motionDetect", buf, 0x16u);
      }
    }
    if (!a5) {
      goto LABEL_38;
    }
    __int16 v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v79 = *MEMORY[0x1E4F28568];
    unint64_t v80 = @" Client not entitled to use motionDetect";
    __int16 v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v80;
    uint64_t v26 = &v79;
    goto LABEL_37;
  }
  if ([v9 activateMotionDetect] && (MGGetBoolAnswer() & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v29 = _AALog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        unint64_t v69 = absTimeNS();
        if (v69 == -1) {
          double v70 = INFINITY;
        }
        else {
          double v70 = (double)v69 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v86 = v70;
        _os_log_error_impl(&dword_1B3B4B000, v29, OS_LOG_TYPE_ERROR, "%13.5f: Platform doesn't support motion detection capability", buf, 0xCu);
      }
    }
    if (!a5) {
      goto LABEL_38;
    }
    __int16 v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78 = @" Platform doesn't support Motion detect";
    __int16 v24 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v25 = &v78;
    uint64_t v26 = &v77;
LABEL_37:
    uint64_t v30 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    *a5 = [v22 errorWithDomain:v23 code:1 userInfo:v30];

LABEL_38:
    BOOL v31 = 0;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&self->_lastConfig, a3);
  self->_tagIndex = [v9 tagIndex];
  self->_notificationMask = [v9 notificationMask];
  self->_unint64_t eventMask = [v9 eventMask];
  p_unint64_t eventMask = &self->_eventMask;
  self->_attentionLostEventMask = [v9 attentionLostEventMask];
  p_attentionLostEventMask = &self->_attentionLostEventMask;
  self->_BOOL retroactiveTimeoutMode = [v9 retroactiveTimeoutMode];
  self->_pollingFilter = [v9 pollingFilter];
  self->_filteredPollingEventDelivered = 0;
  self->_continuousFaceDetectMode = [v9 continuousFaceDetectMode];
  self->_unityStream = [v9 unityStream];
  double v12 = [v9 digitizerDisplayUUIDs];
  digitizerDisplayUUIDs = self->_digitizerDisplayUUIDs;
  self->_digitizerDisplayUUIDs = v12;

  unint64_t v14 = [v9 keyboardDisplayUUIDs];
  keyboardDisplayUUIDs = self->_keyboardDisplayUUIDs;
  self->_keyboardDisplayUUIDs = v14;

  uint64_t v16 = [v9 buttonDisplayUUIDs];
  buttonDisplayUUIDs = self->_buttonDisplayUUIDs;
  self->_buttonDisplayUUIDs = v16;

  [v9 nonSampledAttentionLostTimeout];
  self->_double nonSampledAttentionLostTimeout = v18;
  int v19 = [v9 nonSampledAttentionLostTimeoutEnable];
  self->_nonSampledAttentionLostTimeoutEnable = v19;
  if (v19 && !self->_nonSampledAttentionTimer)
  {
    uint64_t v33 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
    self->_nonSampledAttentionTimer = v33;

    double v35 = self->_nonSampledAttentionTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke;
    handler[3] = &unk_1E606AC70;
    handler[4] = self;
    dispatch_source_set_event_handler(v35, handler);
    unint64_t v36 = self->_nonSampledAttentionTimer;
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_41;
    v74[3] = &unk_1E606AC70;
    v74[4] = self;
    dispatch_source_set_cancel_handler(v36, v74);
    goto LABEL_41;
  }
  if (self->_nonSampledAttentionTimerResumed)
  {
    dispatch_suspend((dispatch_object_t)self->_nonSampledAttentionTimer);
LABEL_41:
    self->_nonSampledAttentionTimerResumed = 0;
  }
  char v37 = [v9 activateMotionDetect];
  self->_activateMotionDetect = v37;
  if (self->_continuousFaceDetectMode)
  {
    self->_activateAttentionDetection = [v9 activateAttentionDetection];
  }
  else
  {
    if ((self->_eventMask & 0x80) != 0) {
      char v38 = v37;
    }
    else {
      char v38 = 1;
    }
    self->_activateAttentionDetection = (v38 & 1) == 0;
  }
  self->_activateEyeRelief = [v9 activateEyeRelief];
  [v9 samplingInterval];
  unint64_t v40 = (unint64_t)(v39 * 1000000000.0);
  if (v39 > 1.84467441e19) {
    unint64_t v40 = -1;
  }
  self->_unint64_t samplingInterval = v40;
  [v9 samplingDelay];
  unint64_t v42 = (unint64_t)(v41 * 1000000000.0);
  if (v41 > 1.84467441e19) {
    unint64_t v42 = -1;
  }
  self->_unint64_t samplingDelay = v42;
  self->_sampleWhileAbsent = [v9 sampleWhileAbsent];
  uint64_t v43 = [v9 attentionLostTimeouts];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    int v45 = [v9 attentionLostTimeouts];
    uint64_t v46 = [v45 allObjects];
    uint64_t v47 = [v46 sortedArrayUsingSelector:sel_compare_];
    attentionLostTimeoutsSec = self->_attentionLostTimeoutsSec;
    self->_attentionLostTimeoutsSec = v47;
  }
  else
  {
    [v9 samplingInterval];
    if (v49 == 0.0)
    {
      int v45 = self->_attentionLostTimeoutsSec;
      self->_attentionLostTimeoutsSec = 0;
    }
    else
    {
      uint64_t v50 = NSNumber;
      [v9 samplingInterval];
      int v45 = objc_msgSend(v50, "numberWithDouble:");
      v76 = v45;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      __int16 v52 = self->_attentionLostTimeoutsSec;
      self->_attentionLostTimeoutsSec = v51;
    }
  }

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_2;
  v73[3] = &unk_1E606A218;
  v73[4] = self;
  int v53 = (void (**)(void, void))MEMORY[0x1B3EC18C0](v73);
  ((void (**)(void, unint64_t *))v53)[2](v53, &self->_eventMask);
  ((void (**)(void, unint64_t *))v53)[2](v53, &self->_attentionLostEventMask);
  if (self->_activateMotionDetect && (deviceSupportsPearl() & 1) == 0) {
    self->_activateMotionDetect = 0;
  }
  unint64_t v54 = *p_eventMask;
  if ((*p_eventMask & 1) == 0)
  {
    v54 |= 1uLL;
    *p_unint64_t eventMask = v54;
  }
  unint64_t v55 = *p_attentionLostEventMask;
  if ((*p_attentionLostEventMask & 1) == 0)
  {
    v55 |= 1uLL;
    unint64_t *p_attentionLostEventMask = v55;
  }
  if (((v55 | v54) & 0x80) == 0)
  {
    self->_sampleWhileAbsent = 0;
    self->_unint64_t samplingInterval = 0;
    self->_unint64_t samplingDelay = 0;
  }
  __int16 v56 = [MEMORY[0x1E4F1CA80] set];
  if ([v56 count])
  {
    double v57 = [MEMORY[0x1E4F1CAD0] setWithSet:v56];
    allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
    self->_allowedHIDEventsForRemoteEvent = v57;
  }
  else
  {
    allowedHIDEventsForRemoteEvent = self->_allowedHIDEventsForRemoteEvent;
    self->_allowedHIDEventsForRemoteEvent = 0;
  }

  if (v6) {
    [(AWRemoteClient *)self _resetAttentionLostTimer];
  }

  BOOL v31 = 1;
LABEL_39:

  return v31;
}

void __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel == 5)
  {
    uint64_t v2 = _AALog();
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
      uint64_t v10 = *(void *)(v9 + 200);
      uint64_t v11 = *(void *)(v9 + 120);
      *(_DWORD *)uint64_t v23 = 134218498;
      *(double *)&v23[4] = v4;
      *(_WORD *)&v23[12] = 2112;
      *(void *)&unsigned char v23[14] = v10;
      *(_WORD *)&v23[22] = 2048;
      *(void *)&unsigned char v23[24] = v11;
      double v12 = "%13.5f: Delivering nonSampledAttentionLost Event for client %@. Timeout value: %13.5f";
      uint32_t v13 = v2;
      uint32_t v14 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, v23, v14);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    uint64_t v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v5 = i;
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
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = *(void *)(v15 + 200);
          uint64_t v17 = *(void *)(v15 + 120);
          *(_DWORD *)uint64_t v23 = 136316162;
          *(void *)&v23[4] = v5;
          *(_WORD *)&v23[12] = 1024;
          *(_DWORD *)&unsigned char v23[14] = 333;
          *(_WORD *)&v23[18] = 2048;
          *(double *)&v23[20] = v8;
          *(_WORD *)&v23[28] = 2112;
          *(void *)&v23[30] = v16;
          *(_WORD *)&v23[38] = 2048;
          uint64_t v24 = v17;
          double v12 = "%30s:%-4d: %13.5f: Delivering nonSampledAttentionLost Event for client %@. Timeout value: %13.5f";
          uint32_t v13 = v2;
          uint32_t v14 = 48;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  double v18 = *(void **)(a1 + 32);
  int v19 = [AWAttentionLostEvent alloc];
  unint64_t v20 = absTimeNS();
  if (v20 == -1) {
    double v21 = INFINITY;
  }
  else {
    double v21 = (double)v20 / 1000000000.0;
  }
  __int16 v22 = -[AWAttentionLostEvent initWithTimestamp:tagIndex:attentionLostTimeout:](v19, "initWithTimestamp:tagIndex:attentionLostTimeout:", *(void *)(*(void *)(a1 + 32) + 40), v21, *(double *)(*(void *)(a1 + 32) + 120), *(_OWORD *)v23, *(void *)&v23[16], *(void *)&v23[24], *(void *)&v23[32], v24);
  [v18 deliverEvent:v22];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 168) + 67) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 168) + 65) = 0;
}

void __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = 0;
}

uint64_t __53__AWRemoteClient__setClientConfig_shouldReset_error___block_invoke_2(uint64_t a1, void *a2)
{
  if (!a2) {
    __assert_rtn("-[AWRemoteClient _setClientConfig:shouldReset:error:]_block_invoke_2", "RemoteClient.m", 394, "eventMask");
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) attentionSampler];
  uint64_t v4 = v3;
  if ((*(unsigned char *)a2 & 0x80) != 0)
  {
    BOOL v6 = (void *)v3;
    uint64_t v3 = deviceSupportsPearl();
    uint64_t v4 = (uint64_t)v6;
    if ((v3 & 1) == 0)
    {
      uint64_t v3 = [v6 unitTestSampling];
      uint64_t v4 = (uint64_t)v6;
      if ((v3 & 1) == 0) {
        *a2 &= ~0x80uLL;
      }
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)invalidateWithoutQueue
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__AWRemoteClient_invalidateWithoutQueue__block_invoke;
  v2[3] = &unk_1E606AC70;
  v2[4] = self;
  [(AWRemoteClient *)self invalidateWithHandler:v2];
}

uint64_t __40__AWRemoteClient_invalidateWithoutQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeInvalidClients];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__AWRemoteClient_invalidate__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__AWRemoteClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__AWRemoteClient_invalidate__block_invoke_2;
  v3[3] = &unk_1E606AC70;
  v3[4] = v1;
  return [v1 invalidateWithHandler:v3];
}

uint64_t __28__AWRemoteClient_invalidate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeInvalidClients];
}

- (void)invalidateWithHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalid)
  {
    self->_invalid = 1;
    if (self->_clientIndex == -1)
    {
      clientState = self->_clientState;
      if (clientState)
      {
        free(clientState);
        self->_clientState = 0;
      }
    }
    else
    {
      unint64_t v5 = +[AWPersistentDataManager sharedManager];
      connection = self->_connection;
      uint64_t clientIndex = self->_clientIndex;
      id v18 = 0;
      char v8 = [v5 closeWithConnection:connection index:clientIndex error:&v18];
      id v9 = v18;

      if ((v8 & 1) == 0 && currentLogLevel >= 3)
      {
        uint64_t v10 = _AALog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          unint64_t v14 = absTimeNS();
          if (v14 == -1) {
            double v15 = INFINITY;
          }
          else {
            double v15 = (double)v14 / 1000000000.0;
          }
          identifier = self->_identifier;
          int v17 = self->_clientIndex;
          *(_DWORD *)buf = 134218754;
          double v20 = v15;
          __int16 v21 = 2112;
          __int16 v22 = identifier;
          __int16 v23 = 1024;
          int v24 = v17;
          __int16 v25 = 2112;
          id v26 = v9;
          _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to release persistent data index %d: %@", buf, 0x26u);
        }
      }
      self->_uint64_t clientIndex = -1;
      self->_clientState = 0;
    }
    transaction = self->_transaction;
    if (transaction)
    {
      self->_transaction = 0;
    }
    nonSampledAttentionTimer = self->_nonSampledAttentionTimer;
    if (nonSampledAttentionTimer) {
      dispatch_source_cancel(nonSampledAttentionTimer);
    }
    if (v4) {
      v4[2](v4);
    }
  }
}

- (id)connection
{
  return self->_connection;
}

- (id)description
{
  double v39 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v40 = NSStringFromClass(v3);
  unint64_t samplingInterval = self->_samplingInterval;
  if (samplingInterval == -1) {
    double v5 = INFINITY;
  }
  else {
    double v5 = (double)samplingInterval / 1000000000.0;
  }
  unint64_t samplingDelay = self->_samplingDelay;
  if (samplingDelay == -1) {
    double v7 = INFINITY;
  }
  else {
    double v7 = (double)samplingDelay / 1000000000.0;
  }
  identifier = self->_identifier;
  BOOL sampleWhileAbsent = self->_sampleWhileAbsent;
  BOOL retroactiveTimeoutMode = self->_retroactiveTimeoutMode;
  BOOL pollingFilter = self->_pollingFilter;
  BOOL continuousFaceDetectMode = self->_continuousFaceDetectMode;
  BOOL unityStream = self->_unityStream;
  BOOL activateEyeRelief = self->_activateEyeRelief;
  BOOL activateAttentionDetection = self->_activateAttentionDetection;
  BOOL activateMotionDetect = self->_activateMotionDetect;
  char v38 = [(NSArray *)self->_attentionLostTimeoutsSec componentsJoinedByString:@", "];
  unint64_t nonSampledAttentionLostTimeout = (unint64_t)self->_nonSampledAttentionLostTimeout;
  if (nonSampledAttentionLostTimeout == -1) {
    double v17 = INFINITY;
  }
  else {
    double v17 = (double)nonSampledAttentionLostTimeout / 1000000000.0;
  }
  if (self->_nonSampledAttentionLostTimeoutEnable) {
    id v18 = "true";
  }
  else {
    id v18 = "false";
  }
  if (activateMotionDetect) {
    int v19 = "true";
  }
  else {
    int v19 = "false";
  }
  double v35 = v18;
  unint64_t v36 = v19;
  if (activateAttentionDetection) {
    double v20 = "true";
  }
  else {
    double v20 = "false";
  }
  if (activateEyeRelief) {
    __int16 v21 = "true";
  }
  else {
    __int16 v21 = "false";
  }
  uint64_t v33 = v21;
  uint64_t v34 = v20;
  if (unityStream) {
    __int16 v22 = "true";
  }
  else {
    __int16 v22 = "false";
  }
  uint64_t v32 = v22;
  if (continuousFaceDetectMode) {
    __int16 v23 = "true";
  }
  else {
    __int16 v23 = "false";
  }
  if (pollingFilter) {
    int v24 = "true";
  }
  else {
    int v24 = "false";
  }
  if (retroactiveTimeoutMode) {
    __int16 v25 = "true";
  }
  else {
    __int16 v25 = "false";
  }
  if (sampleWhileAbsent) {
    id v26 = "true";
  }
  else {
    id v26 = "false";
  }
  uint64_t v27 = getNotificationMaskDescription(self->_notificationMask);
  double v28 = getEventMaskDescription(self->_eventMask);
  uint64_t v29 = getEventMaskDescription(self->_attentionLostEventMask);
  objc_msgSend(v39, "stringWithFormat:", @"<%@: %p> (identifier: %@ samplingInterval: %13.5f samplingDelay: %13.5f sampleWhileAbsent: %s retroactiveTimeoutMode: %s pollingFilter: %s continuousFaceDetectMode: %s unityStream: %s activateEyeRelief: %s activateAttentionDetection: %s activateMotionDetection: %s activatePersonDetection: %s attentionLostTimeouts: %@ nonSampledAttentionLostTimeoutEnabled %s nonSampledAttentionLostTimeout %13.5f notificationMask %@ mask %@ attentionLostEventMask %@ digitizerDisplayUUIDs %@ buttonDisplayUUIDs %@ keyboardDisplayUUIDs %@ tagIndex %llu)", v40, self, identifier, *(void *)&v5, *(void *)&v7, v26, v25, v24, v23, v32, v33, v34, v36, "false", v38, v35,
    *(void *)&v17,
    v27,
    v28,
    v29,
    self->_digitizerDisplayUUIDs,
    self->_buttonDisplayUUIDs,
    self->_keyboardDisplayUUIDs,
  uint64_t v30 = self->_tagIndex);

  return v30;
}

- (void)initializeClientState
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_clientIndex != -1) {
    goto LABEL_2;
  }
  uint64_t v11 = +[AWPersistentDataManager sharedManager];
  connection = self->_connection;
  id v31 = 0;
  int v13 = [v11 openWithConnection:connection error:&v31];
  id v7 = v31;
  self->_int clientIndex = v13;

  if (v7)
  {
    if (currentLogLevel >= 3)
    {
      char v8 = _AALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = absTimeNS();
        if (v14 == -1) {
          double v15 = INFINITY;
        }
        else {
          double v15 = (double)v14 / 1000000000.0;
        }
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218498;
        double v33 = v15;
        __int16 v34 = 2112;
        *(void *)double v35 = identifier;
        *(_WORD *)&v35[8] = 2112;
        *(void *)&v35[10] = v7;
        __int16 v25 = "%13.5f: %@ failed to obtain index for persistent data access: %@";
        id v26 = v8;
        uint32_t v27 = 32;
LABEL_31:
        _os_log_error_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
      }
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (currentLogLevel < 7) {
    goto LABEL_2;
  }
  uint64_t v16 = _AALog();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_26;
  }
  double v17 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(i - 1) == 47;
        ++i)
  {
    double v17 = i;
LABEL_21:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_21;
  }
  unint64_t v19 = absTimeNS();
  if (v19 == -1) {
    double v20 = INFINITY;
  }
  else {
    double v20 = (double)v19 / 1000000000.0;
  }
  __int16 v21 = self->_identifier;
  int clientIndex = self->_clientIndex;
  *(_DWORD *)buf = 136316162;
  double v33 = *(double *)&v17;
  __int16 v34 = 1024;
  *(_DWORD *)double v35 = 143;
  *(_WORD *)&v35[4] = 2048;
  *(double *)&v35[6] = v20;
  *(_WORD *)&v35[14] = 2112;
  *(void *)&v35[16] = v21;
  __int16 v36 = 1024;
  int v37 = clientIndex;
  _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ obtained index %d for persistent data access", buf, 0x2Cu);
LABEL_26:

LABEL_2:
  uint64_t v3 = +[AWPersistentDataManager sharedManager];
  uint64_t v4 = self->_connection;
  uint64_t v5 = self->_clientIndex;
  id v30 = 0;
  BOOL v6 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)[v3 clientStateWithConnection:v4 index:v5 error:&v30];
  id v7 = v30;
  self->_clientState = v6;

  if (v7 && currentLogLevel >= 3)
  {
    char v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      __int16 v23 = self->_identifier;
      int v24 = self->_clientIndex;
      *(_DWORD *)buf = 134218754;
      double v33 = v10;
      __int16 v34 = 2112;
      *(void *)double v35 = v23;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = v24;
      *(_WORD *)&v35[14] = 2112;
      *(void *)&v35[16] = v7;
      __int16 v25 = "%13.5f: %@ failed to obtain persistent client state for index %d: %@";
      id v26 = v8;
      uint32_t v27 = 38;
      goto LABEL_31;
    }
LABEL_32:

LABEL_33:
    self->_int clientIndex = -1;
    uint64_t v29 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)malloc_type_calloc(1uLL, 0x48uLL, 0x100004052436E4DuLL);
    self->_clientState = v29;
    if (!v29) {
      __assert_rtn("-[AWRemoteClient initializeClientState]", "RemoteClient.m", 163, "_clientState");
    }
  }
  else if (v7)
  {
    goto LABEL_33;
  }
}

- (AWRemoteClient)initWithProxy:(id)a3 connection:(id)a4 clientConfig:(id)a5 clientIndex:(int)a6 clientId:(id)a7 scheduler:(id)a8 error:(id *)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v35 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  unint64_t v19 = [v16 identifier];

  if (v19)
  {
    v37.receiver = self;
    v37.super_class = (Class)AWRemoteClient;
    double v20 = [(AWRemoteClient *)&v37 init];
    if (v20)
    {
      uint64_t v21 = awQueue(1);
      queue = v20->_queue;
      v20->_queue = (OS_dispatch_queue *)v21;

      objc_storeStrong((id *)&v20->_scheduler, a8);
      objc_storeStrong((id *)&v20->_proxy, a3);
      uint64_t v23 = [v16 identifier];
      identifier = v20->_identifier;
      v20->_identifier = (NSString *)v23;

      objc_storeStrong((id *)&v20->_connection, a4);
      v20->_int clientIndex = a6;
      objc_storeStrong((id *)&v20->_clientId, a7);
      [(NSString *)v20->_identifier UTF8String];
      uint64_t v25 = os_transaction_create();
      transaction = v20->_transaction;
      v20->_transaction = (OS_os_transaction *)v25;

      [(AWRemoteClient *)v20 initializeClientState];
      if (![(AWRemoteClient *)v20 _setClientConfig:v16 shouldReset:a6 == -1 error:a9])
      {

        double v20 = 0;
      }
    }
    self = v20;
    uint32_t v27 = self;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      double v28 = _AALog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        unint64_t v33 = absTimeNS();
        if (v33 == -1) {
          double v34 = INFINITY;
        }
        else {
          double v34 = (double)v33 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v41 = v34;
        _os_log_error_impl(&dword_1B3B4B000, v28, OS_LOG_TYPE_ERROR, "%13.5f: denying attempt to create client with nil identifier", buf, 0xCu);
      }
    }
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28798];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    double v39 = @" Not creating client with nil identifier";
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a9 = [v29 errorWithDomain:v30 code:22 userInfo:v31];

    uint32_t v27 = 0;
  }

  return v27;
}

@end