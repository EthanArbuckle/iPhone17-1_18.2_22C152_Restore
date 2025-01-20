@interface AWPearlAttentionStreamer
- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions;
- (BOOL)attentionStreamerRunning;
- (BOOL)isAttentionAwareFeaturesEnabled;
- (id)cancelEventStream;
- (id)initForUnitTest:(BOOL)a3 queue:(id)a4;
- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5;
- (id)unitTestDevice;
- (void)operation:(id)a3 faceDetectStateChanged:(id)a4;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)sendNotification:(unint64_t)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setIsAttentionAwareFeaturesEnabled:(BOOL)a3;
- (void)setNotificationHandler:(id)a3;
- (void)setSmartCoverState:(BOOL)a3;
@end

@implementation AWPearlAttentionStreamer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_finishingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pendingPresenceOperation, 0);

  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

- (id)unitTestDevice
{
  return self->_pearlDevice;
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      int v17 = 134218498;
      double v18 = v9;
      __int16 v19 = 2112;
      *(void *)v20 = v6;
      *(_WORD *)&v20[8] = 2080;
      *(void *)&v20[10] = getEndReasonDescriptions(a4);
      v14 = "%13.5f: Operation %@ cancelled due to reason: %s";
      v15 = v7;
      uint32_t v16 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v10 = i;
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
          int v17 = 136316162;
          double v18 = *(double *)&v10;
          __int16 v19 = 1024;
          *(_DWORD *)v20 = 510;
          *(_WORD *)&v20[4] = 2048;
          *(double *)&v20[6] = v13;
          *(_WORD *)&v20[14] = 2112;
          *(void *)&v20[16] = v6;
          __int16 v21 = 2080;
          EndReasonDescriptions = getEndReasonDescriptions(a4);
          v14 = "%30s:%-4d: %13.5f: Operation %@ cancelled due to reason: %s";
          v15 = v7;
          uint32_t v16 = 48;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(AWPearlAttentionStreamer *)self sendNotification:1];
    self->_attentionStreamerRunning = 0;
  }
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  int v8 = [v7 faceDetected];
  double v9 = [v7 pitch];
  v10 = [v7 yaw];
  v11 = [v7 roll];
  uint64_t v12 = [v7 orientation];
  if ((unint64_t)(v12 - 1) >= 4) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v12;
  }
  unint64_t v59 = v13;
  v14 = [v7 distance];
  v62 = v6;
  unint64_t v15 = [v7 eyeReliefStatus];
  switch(v15)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      int v60 = 0;
      break;
    default:
      unint64_t v15 = 0;
      int v60 = 1;
      break;
  }
  uint32_t v16 = [v7 attentionScore];
  [v16 floatValue];
  float v18 = v17 / 10.0;
  float v69 = v17 / 10.0;

  __int16 v19 = [v7 faceDetectionScore];
  [v19 floatValue];
  float v21 = v20;
  float v70 = v20;

  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  if (currentLogLevel < 7) {
    goto LABEL_23;
  }
  v57 = v11;
  v58 = v14;
  v22 = _AALog();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_22;
  }
  *(double *)&uint64_t v23 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m");
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
        *(i - 1) == 47;
        ++i)
  {
    uint64_t v23 = i;
LABEL_13:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_13;
  }
  unint64_t v25 = absTimeNS();
  v54 = v9;
  v55 = v10;
  int v26 = v8;
  if (v25 == -1) {
    double v27 = INFINITY;
  }
  else {
    double v27 = (double)v25 / 1000000000.0;
  }
  pendingPresenceOperation = self->_pendingPresenceOperation;
  if (v26) {
    v29 = "FACE FOUND";
  }
  else {
    v29 = "FACE NOT FOUND";
  }
  v30 = getFaceDetectOrientationDescription(v59);
  v31 = getEyeReliefFaceStateDescription(v15);
  *(_DWORD *)buf = 136318722;
  double v75 = *(double *)&v23;
  __int16 v76 = 1024;
  *(_DWORD *)v77 = 457;
  *(_WORD *)&v77[4] = 2048;
  *(double *)&v77[6] = v27;
  *(_WORD *)&v77[14] = 2112;
  *(void *)&v77[16] = self;
  __int16 v78 = 2048;
  v79 = v62;
  __int16 v80 = 2048;
  v81 = pendingPresenceOperation;
  __int16 v82 = 2080;
  v83 = v29;
  __int16 v84 = 2112;
  double v9 = v54;
  v85 = v54;
  __int16 v86 = 2112;
  v87 = v55;
  __int16 v88 = 2112;
  v89 = v57;
  __int16 v90 = 2112;
  v91 = v30;
  __int16 v92 = 2112;
  v93 = v58;
  __int16 v94 = 2112;
  v95 = v31;
  __int16 v96 = 2048;
  double v97 = v18;
  __int16 v98 = 2048;
  double v99 = v21;
  _os_log_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %@ yaw: %@ roll: %@ orientation: %@ distance: %@ eyeReliefFaceState:%@ attentionScore: %ffaceDetectionScore: %f", buf, 0x94u);

  v10 = v55;
  int v8 = v26;

LABEL_22:
  v11 = v57;
  v14 = v58;
LABEL_23:
  LOBYTE(v63) = v8;
  memset_pattern16(v67, &unk_1B3B87460, 0x40uLL);
  *(void *)&long long v66 = v15;
  [v14 doubleValue];
  *((void *)&v65 + 1) = v32;
  if (self->_eyeReliefStarted)
  {
    if (v60)
    {
      if (currentLogLevel >= 3)
      {
        v33 = _AALog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          unint64_t v34 = absTimeNS();
          if (v34 == -1) {
            double v35 = INFINITY;
          }
          else {
            double v35 = (double)v34 / 1000000000.0;
          }
          *(_DWORD *)buf = 134217984;
          double v75 = v35;
          _os_log_error_impl(&dword_1B3B4B000, v33, OS_LOG_TYPE_ERROR, "%13.5f: Invalid eyeRelief frame handed up to this layer. Don't pass this up", buf, 0xCu);
        }
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    if (currentLogLevel == 5)
    {
      int v61 = v8;
      v36 = v11;
      v37 = _AALog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v38 = absTimeNS();
        if (v38 == -1) {
          double v39 = INFINITY;
        }
        else {
          double v39 = (double)v38 / 1000000000.0;
        }
        v44 = getEyeReliefFaceStateDescription(v15);
        *(_DWORD *)buf = 134218498;
        double v75 = v39;
        __int16 v76 = 2112;
        *(void *)v77 = v14;
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v44;
        _os_log_impl(&dword_1B3B4B000, v37, OS_LOG_TYPE_DEFAULT, "%13.5f: Distance from EyeRelief network: %@ EyeReliefState: %@", buf, 0x20u);
      }
LABEL_47:

      v11 = v36;
      int v8 = v61;
    }
    else if (currentLogLevel >= 6)
    {
      int v61 = v8;
      v36 = v11;
      v37 = _AALog();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      v56 = v10;
      *(double *)&v40 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m");
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          v40 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v42 = absTimeNS();
          if (v42 == -1) {
            double v43 = INFINITY;
          }
          else {
            double v43 = (double)v42 / 1000000000.0;
          }
          v45 = getEyeReliefFaceStateDescription(v15);
          *(_DWORD *)buf = 136316162;
          double v75 = *(double *)&v40;
          __int16 v76 = 1024;
          *(_DWORD *)v77 = 479;
          *(_WORD *)&v77[4] = 2048;
          *(double *)&v77[6] = v43;
          *(_WORD *)&v77[14] = 2112;
          *(void *)&v77[16] = v14;
          __int16 v78 = 2112;
          v79 = v45;
          _os_log_impl(&dword_1B3B4B000, v37, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: Distance from EyeRelief network: %@ EyeReliefState: %@", buf, 0x30u);

          v10 = v56;
          goto LABEL_47;
        }
      }
    }
  }
  if (v8)
  {
    [v9 doubleValue];
    *((void *)&v63 + 1) = v46;
    [v10 doubleValue];
    *(void *)&long long v64 = v47;
    [v11 doubleValue];
    *((void *)&v64 + 1) = v48;
    *(void *)&long long v65 = v59;
  }
  uint64_t v49 = 5;
  if (!self->_eyeReliefStarted) {
    uint64_t v49 = 1;
  }
  *((void *)&v66 + 1) = v49;
  v50 = [AWFaceDetectAttentionEvent alloc];
  unint64_t v51 = absTimeNS();
  if (v51 == -1) {
    double v52 = INFINITY;
  }
  else {
    double v52 = (double)v51 / 1000000000.0;
  }
  v33 = [(AWFaceDetectAttentionEvent *)v50 initWithTimestamp:0 tagIndex:&v63 faceMetadata:v52];
  callbackBlock = (void (**)(id, NSObject *))self->_callbackBlock;
  if (callbackBlock) {
    callbackBlock[2](callbackBlock, v33);
  }
LABEL_57:

LABEL_58:
}

- (void)setDisplayState:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL displayOn = self->_displayOn;
  if (displayOn != a3)
  {
    BOOL v5 = a3;
    self->_BOOL displayOn = a3;
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
        unint64_t v13 = "OFF";
        if (v5) {
          unint64_t v13 = "ON";
        }
        int v23 = 134218242;
        double v24 = v8;
        __int16 v25 = 2080;
        *(void *)int v26 = v13;
        v14 = "%13.5f: Display state changed to %s";
        unint64_t v15 = v6;
        uint32_t v16 = 22;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    BOOL displayOn = a3;
    if (currentLogLevel >= 6)
    {
      id v6 = _AALog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      double v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
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
          float v17 = "OFF";
          int v23 = 136315906;
          double v24 = *(double *)&v9;
          __int16 v25 = 1024;
          if (v5) {
            float v17 = "ON";
          }
          *(_DWORD *)int v26 = 397;
          *(_WORD *)&v26[4] = 2048;
          *(double *)&v26[6] = v12;
          __int16 v27 = 2080;
          v28 = v17;
          v14 = "%30s:%-4d: %13.5f: Display state changed to %s";
          unint64_t v15 = v6;
          uint32_t v16 = 38;
LABEL_24:
          _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v16);
LABEL_25:

          BOOL displayOn = self->_displayOn;
          break;
        }
      }
    }
  }
  if (!displayOn && self->_attentionStreamerRunning)
  {
    id v18 = [(AWPearlAttentionStreamer *)self cancelEventStream];
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))self->_notificationBlock + 2))(self->_notificationBlock, 1, v19, v20, v21, v22);
  }
}

- (void)setSmartCoverState:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL smartCoverClosed = self->_smartCoverClosed;
  if (smartCoverClosed != a3)
  {
    self->_BOOL smartCoverClosed = a3;
    if (currentLogLevel == 5)
    {
      BOOL v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = absTimeNS();
        if (v6 == -1) {
          double v7 = INFINITY;
        }
        else {
          double v7 = (double)v6 / 1000000000.0;
        }
        double v12 = "Closed";
        if (!self->_smartCoverClosed) {
          double v12 = "Opened";
        }
        int v23 = 134218242;
        double v24 = v7;
        __int16 v25 = 2080;
        *(void *)int v26 = v12;
        unint64_t v13 = "%13.5f: Smart cover state changed to %s";
        v14 = v5;
        uint32_t v15 = 22;
LABEL_25:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);
      }
    }
    else
    {
      BOOL smartCoverClosed = a3;
      if (currentLogLevel < 6) {
        goto LABEL_27;
      }
      BOOL v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            double v8 = i;
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
            BOOL v16 = self->_smartCoverClosed;
            int v23 = 136315906;
            if (v16) {
              float v17 = "Closed";
            }
            else {
              float v17 = "Opened";
            }
            double v24 = *(double *)&v8;
            __int16 v25 = 1024;
            *(_DWORD *)int v26 = 379;
            *(_WORD *)&v26[4] = 2048;
            *(double *)&v26[6] = v11;
            __int16 v27 = 2080;
            v28 = v17;
            unint64_t v13 = "%30s:%-4d: %13.5f: Smart cover state changed to %s";
            v14 = v5;
            uint32_t v15 = 38;
            goto LABEL_25;
          }
        }
      }
    }

    BOOL smartCoverClosed = self->_smartCoverClosed;
  }
LABEL_27:
  if (smartCoverClosed && self->_attentionStreamerRunning)
  {
    id v18 = [(AWPearlAttentionStreamer *)self cancelEventStream];
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))self->_notificationBlock + 2))(self->_notificationBlock, 1, v19, v20, v21, v22);
  }
}

- (void)sendNotification:(unint64_t)a3
{
  notificationBlock = (void (**)(id, unint64_t))self->_notificationBlock;
  if (notificationBlock) {
    notificationBlock[2](notificationBlock, a3);
  }
}

- (BOOL)isAttentionAwareFeaturesEnabled
{
  return self->_isAttentionAwareFeaturesEnabled;
}

- (void)setIsAttentionAwareFeaturesEnabled:(BOOL)a3
{
  self->_isAttentionAwareFeaturesEnabled = a3;
}

- (BOOL)attentionStreamerRunning
{
  return self->_attentionStreamerRunning;
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)(self->_eyeReliefStarted | ((self->_pendingPresenceOperation != 0) << 8));
}

- (id)cancelEventStream
{
  v15[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_attentionStreamerRunning)
  {
    v3 = self->_pendingPresenceOperation;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AWPearlAttentionStreamer_cancelEventStream__block_invoke;
    block[3] = &unk_1E606AC98;
    double v12 = v3;
    unint64_t v13 = self;
    v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    pendingPresenceOperation = self->_pendingPresenceOperation;
    self->_pendingPresenceOperation = 0;

    self->_attentionStreamerRunning = 0;
    id callbackBlock = self->_callbackBlock;
    self->_id callbackBlock = 0;

    self->_eyeReliefStarted = 0;
    double v7 = 0;
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28798];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @" Attention streamer not running";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    double v7 = [v8 errorWithDomain:v9 code:3 userInfo:v4];
  }

  return v7;
}

void __45__AWPearlAttentionStreamer_cancelEventStream__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancel];
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
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v16 = 134218498;
      double v17 = v4;
      __int16 v18 = 2112;
      *(void *)uint64_t v19 = v9;
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = v10;
      double v11 = "%13.5f: %@ cancelled presence operation %p";
      double v12 = v2;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      return;
    }
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          BOOL v5 = i;
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
          uint64_t v14 = *(void *)(a1 + 40);
          int v16 = 136316162;
          double v17 = *(double *)&v5;
          __int16 v18 = 1024;
          *(_DWORD *)uint64_t v19 = 334;
          *(_WORD *)&v19[4] = 2048;
          *(double *)&v19[6] = v8;
          *(_WORD *)&v19[14] = 2112;
          *(void *)&v19[16] = v14;
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          double v11 = "%30s:%-4d: %13.5f: %@ cancelled presence operation %p";
          double v12 = v2;
          uint32_t v13 = 48;
          goto LABEL_19;
        }
      }
    }
  }
}

- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5
{
  BOOL var0 = a4.var0;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(AWPearlAttentionStreamer *)self isAttentionAwareFeaturesEnabled])
  {
    if (currentLogLevel >= 3)
    {
      int v16 = _AALog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v22 = absTimeNS();
        if (v22 == -1) {
          double v23 = INFINITY;
        }
        else {
          double v23 = (double)v22 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v55 = v23;
        _os_log_error_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_ERROR, "%13.5f: User has AttentionAware features off, cannot start streaming operation with Pearl", buf, 0xCu);
      }
    }
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    v65[0] = @" Attention Aware Features turned OFF";
    uint32_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = (__CFString **)v65;
    uint64_t v15 = &v64;
    goto LABEL_21;
  }
  if (!self->_displayOn)
  {
    if (currentLogLevel >= 3)
    {
      double v17 = _AALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = absTimeNS();
        if (v26 == -1) {
          double v27 = INFINITY;
        }
        else {
          double v27 = (double)v26 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v55 = v27;
        _os_log_error_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_ERROR, "%13.5f: Display OFF, not starting attention stream", buf, 0xCu);
      }
    }
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v62 = *MEMORY[0x1E4F28568];
    long long v63 = @" Display OFF";
    uint32_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v63;
    uint64_t v15 = &v62;
    goto LABEL_21;
  }
  if (self->_smartCoverClosed)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v24 = absTimeNS();
        if (v24 == -1) {
          double v25 = INFINITY;
        }
        else {
          double v25 = (double)v24 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v55 = v25;
        _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Smart cover closed, not starting attention stream", buf, 0xCu);
      }
    }
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    int v61 = @" Smart cover closed";
    uint32_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v61;
    uint64_t v15 = &v60;
LABEL_21:
    uint64_t v19 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    id v20 = [v11 errorWithDomain:v12 code:1 userInfo:v19];
LABEL_22:

    goto LABEL_23;
  }
  if (self->_matchOrEnrollOperationActive)
  {
    if (currentLogLevel >= 3)
    {
      __int16 v18 = _AALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unint64_t v33 = absTimeNS();
        if (v33 == -1) {
          double v34 = INFINITY;
        }
        else {
          double v34 = (double)v33 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v55 = v34;
        _os_log_error_impl(&dword_1B3B4B000, v18, OS_LOG_TYPE_ERROR, "%13.5f: Match or enroll operation underway, not starting attention stream", buf, 0xCu);
      }
    }
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    unint64_t v59 = @" Match or enroll operation ongoing";
    uint32_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v59;
    uint64_t v15 = &v58;
    goto LABEL_21;
  }
  if (!self->_attentionStreamerRunning) {
    goto LABEL_67;
  }
  if (!var0 || self->_eyeReliefStarted)
  {
    id v20 = 0;
    goto LABEL_23;
  }
  if (currentLogLevel == 5)
  {
    v28 = _AALog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = absTimeNS();
      if (v29 == -1) {
        double v30 = INFINITY;
      }
      else {
        double v30 = (double)v29 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v55 = v30;
      v37 = "%13.5f: Cancelling current stream and starting one with EyeRelief";
      unint64_t v38 = v28;
      uint32_t v39 = 12;
LABEL_64:
      _os_log_impl(&dword_1B3B4B000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
    }
LABEL_65:

    goto LABEL_66;
  }
  if (currentLogLevel >= 6)
  {
    v28 = _AALog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v31 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v31 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v35 = absTimeNS();
          if (v35 == -1) {
            double v36 = INFINITY;
          }
          else {
            double v36 = (double)v35 / 1000000000.0;
          }
          *(_DWORD *)buf = 136315650;
          double v55 = *(double *)&v31;
          __int16 v56 = 1024;
          LODWORD(v57[0]) = 266;
          WORD2(v57[0]) = 2048;
          *(double *)((char *)v57 + 6) = v36;
          v37 = "%30s:%-4d: %13.5f: Cancelling current stream and starting one with EyeRelief";
          unint64_t v38 = v28;
          uint32_t v39 = 28;
          goto LABEL_64;
        }
      }
    }
    goto LABEL_65;
  }
LABEL_66:
  id v40 = [(AWPearlAttentionStreamer *)self cancelEventStream];
LABEL_67:
  [(BKDevicePearl *)self->_pearlDevice setQueue:self->_queue];
  [(BKDevicePearl *)self->_pearlDevice setDelegate:self];
  pearlDevice = self->_pearlDevice;
  id v53 = 0;
  unint64_t v42 = [(BKDevicePearl *)pearlDevice createPresenceDetectOperationWithError:&v53];
  id v20 = v53;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  self->_pendingPresenceOperation = v42;

  v44 = self->_pendingPresenceOperation;
  if (v44)
  {
    [(BKFaceDetectOperation *)v44 setDelegate:self];
    [(BKFaceDetectOperation *)self->_pendingPresenceOperation setQueue:self->_queue];
    [(BKFaceDetectOperation *)self->_pendingPresenceOperation setMode:1];
    [(BKFaceDetectOperation *)self->_pendingPresenceOperation setEyeRelief:var0];
    if (v8)
    {
      v45 = (void *)MEMORY[0x1B3EC18C0](v8);
      id callbackBlock = self->_callbackBlock;
      self->_id callbackBlock = v45;
    }
    uint64_t v47 = self->_pendingPresenceOperation;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke;
    v51[3] = &unk_1E606A040;
    v51[4] = self;
    id v52 = v9;
    [(BKFaceDetectOperation *)v47 startWithReply:v51];
    uint64_t v48 = v52;
    uint64_t v19 = v20;

    id v20 = v19;
    goto LABEL_22;
  }
  if (currentLogLevel >= 3)
  {
    uint64_t v19 = _AALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v49 = absTimeNS();
      if (v49 == -1) {
        double v50 = INFINITY;
      }
      else {
        double v50 = (double)v49 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218242;
      double v55 = v50;
      __int16 v56 = 2112;
      v57[0] = v20;
      _os_log_error_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_ERROR, "%13.5f: Creating presence detect operation failed with error: %@", buf, 0x16u);
    }
    goto LABEL_22;
  }
LABEL_23:

  return v20;
}

void __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    if (currentLogLevel == 5)
    {
      id v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v28 = *(void *)(v27 + 16);
        *(_DWORD *)buf = 134218754;
        double v47 = v11;
        __int16 v48 = 2112;
        *(void *)unint64_t v49 = v27;
        *(_WORD *)&v49[8] = 2048;
        *(void *)&v49[10] = v28;
        *(_WORD *)&v49[18] = 2112;
        *(void *)&v49[20] = v5;
        unint64_t v29 = "%13.5f: %@ failed to start presence operation %p: %@ for streaming";
        double v30 = v9;
        uint32_t v31 = 42;
LABEL_47:
        _os_log_impl(&dword_1B3B4B000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_49:
        *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
        uint64_t v40 = *(void *)(a1 + 32);
        v41 = *(void **)(v40 + 32);
        *(void *)(v40 + 32) = 0;

        unint64_t v42 = *(NSObject **)(*(void *)(a1 + 32) + 56);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_34;
        v43[3] = &unk_1E606ABB0;
        id v45 = *(id *)(a1 + 40);
        id v44 = v5;
        dispatch_async(v42, v43);

        goto LABEL_50;
      }
      id v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v14 = i;
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
            uint64_t v38 = *(void *)(a1 + 32);
            uint64_t v39 = *(void *)(v38 + 16);
            *(_DWORD *)buf = 136316418;
            double v47 = *(double *)&v14;
            __int16 v48 = 1024;
            *(_DWORD *)unint64_t v49 = 309;
            *(_WORD *)&v49[4] = 2048;
            *(double *)&v49[6] = v19;
            *(_WORD *)&v49[14] = 2112;
            *(void *)&v49[16] = v38;
            *(_WORD *)&v49[24] = 2048;
            *(void *)&v49[26] = v39;
            __int16 v50 = 2112;
            unint64_t v51 = (const char *)v5;
            unint64_t v29 = "%30s:%-4d: %13.5f: %@ failed to start presence operation %p: %@ for streaming";
            double v30 = v9;
            uint32_t v31 = 58;
            goto LABEL_47;
          }
        }
      }
    }

    goto LABEL_49;
  }
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
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void **)(v20 + 16);
      int v22 = [v21 eyeRelief];
      double v23 = "without";
      *(_DWORD *)buf = 134218754;
      __int16 v48 = 2112;
      double v47 = v8;
      if (v22) {
        double v23 = "with";
      }
      *(void *)unint64_t v49 = v20;
      *(_WORD *)&v49[8] = 2048;
      *(void *)&v49[10] = v21;
      *(_WORD *)&v49[18] = 2080;
      *(void *)&v49[20] = v23;
      unint64_t v24 = "%13.5f: %@ presence operation %p successfully started for streaming %s eyeRelief";
      double v25 = v6;
      uint32_t v26 = 42;
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v6 = _AALog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
    for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
          ;
          ++j)
    {
      if (*(j - 1) == 47)
      {
        uint64_t v12 = j;
      }
      else if (!*(j - 1))
      {
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        uint64_t v32 = *(void *)(a1 + 32);
        unint64_t v33 = *(void **)(v32 + 16);
        int v34 = [v33 eyeRelief];
        *(_DWORD *)buf = 136316418;
        unint64_t v35 = "without";
        double v47 = *(double *)&v12;
        __int16 v48 = 1024;
        *(_DWORD *)unint64_t v49 = 296;
        if (v34) {
          unint64_t v35 = "with";
        }
        *(_WORD *)&v49[4] = 2048;
        *(double *)&v49[6] = v17;
        *(_WORD *)&v49[14] = 2112;
        *(void *)&v49[16] = v32;
        *(_WORD *)&v49[24] = 2048;
        *(void *)&v49[26] = v33;
        __int16 v50 = 2080;
        unint64_t v51 = v35;
        unint64_t v24 = "%30s:%-4d: %13.5f: %@ presence operation %p successfully started for streaming %s eyeRelief";
        double v25 = v6;
        uint32_t v26 = 58;
LABEL_40:
        _os_log_impl(&dword_1B3B4B000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_41:

        break;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  int v36 = [*(id *)(*(void *)(a1 + 32) + 16) eyeRelief];
  uint64_t v37 = *(void *)(a1 + 32);
  if (v36) {
    *(unsigned char *)(v37 + 64) = 1;
  }
  else {
    *(unsigned char *)(v37 + 64) = 0;
  }
LABEL_50:
}

uint64_t __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setNotificationHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[AWPearlAttentionStreamer setNotificationHandler:]", "PearlAttentionStreamer.m", 219, "notificationBlock != nil");
  }
  id v7 = v4;
  id v5 = (void *)MEMORY[0x1B3EC18C0]();
  id notificationBlock = self->_notificationBlock;
  self->_id notificationBlock = v5;
}

- (id)initForUnitTest:(BOOL)a3 queue:(id)a4
{
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)AWPearlAttentionStreamer;
  double v8 = [(AWPearlAttentionStreamer *)&v40 init];
  id v9 = v8;
  if (!v8)
  {
LABEL_13:
    uint64_t v21 = v9;
    goto LABEL_14;
  }
  v8->_unitTest = a3;
  if (a3)
  {
    unint64_t v10 = +[AWUnitTestPearlDevice sharedDevice];
  }
  else
  {
    if (getPearlDevice_onceToken != -1) {
      dispatch_once(&getPearlDevice_onceToken, &__block_literal_global_166);
    }
    unint64_t v10 = (BKDevicePearl *)(id)getPearlDevice_result;
  }
  pearlDevice = v9->_pearlDevice;
  v9->_pearlDevice = v10;

  p_queue = (NSObject **)&v9->_queue;
  objc_storeStrong((id *)&v9->_queue, a4);
  if (v9->_pearlDevice)
  {
    id notificationBlock = v9->_notificationBlock;
    v9->_id notificationBlock = 0;

    v9->_attentionStreamerRunning = 0;
    id callbackBlock = v9->_callbackBlock;
    v9->_id callbackBlock = 0;

    v9->_eyeReliefStarted = 0;
    v9->_matchOrEnrollOperationActive = 0;
    objc_initWeak(&location, v9);
    dispatch_once_t predicate = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke;
    block[3] = &unk_1E606A548;
    uint64_t v15 = v9;
    int v36 = v15;
    objc_copyWeak(&v37, &location);
    dispatch_once(&predicate, block);
    [v15 setIsAttentionAwareFeaturesEnabled:_AXSAttentionAwarenessFeaturesEnabled() != 0];
    if (v9->_unitTest)
    {
      *((_WORD *)v15 + 40) = 1;
      unint64_t v16 = [v15 unitTestDevice];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_11;
      v33[3] = &unk_1E606A7D0;
      double v17 = v15;
      int v34 = v17;
      [v16 setDisplayCallback:v33];

      unint64_t v18 = [v17 unitTestDevice];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_3;
      v31[3] = &unk_1E606A7D0;
      uint64_t v32 = v17;
      [v18 setSmartCoverCallback:v31];
      double v19 = (id *)&v34;
      uint64_t v20 = (id *)&v32;
    }
    else
    {
      int v22 = v15 + 21;
      double v23 = *p_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_5;
      handler[3] = &unk_1E606A7F8;
      unint64_t v24 = v15;
      double v30 = v24;
      notify_register_dispatch("com.apple.BiometricKit.activeOperation", v22, v23, handler);
      double v19 = (id *)&v30;
      double v25 = *p_queue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_15;
      v27[3] = &unk_1E606AC70;
      uint64_t v20 = (id *)&v28;
      uint64_t v28 = v24;
      dispatch_async(v25, v27);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  uint64_t v21 = 0;
LABEL_14:

  return v21;
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = (int *)(v2 + 68);
  id v4 = *(NSObject **)(v2 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2;
  v5[3] = &unk_1E606A018;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", v3, v4, v5);

  objc_destroyWeak(&v7);
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_11(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = v3[7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2_12;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_3(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = v3[7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_4;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_5(uint64_t a1, int token)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  uint64_t v4 = *(void *)(a1 + 32);
  if (state64 - 1 > 1)
  {
    *(unsigned char *)(v4 + 88) = 0;
    return result;
  }
  *(unsigned char *)(v4 + 88) = 1;
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 48)) {
    return result;
  }
  if (currentLogLevel == 5)
  {
    id v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v17 = v7;
      uint64_t v12 = "%13.5f: Match or enroll operation initiated when a stream was running, cancelling stream and sending a notif"
            "ication to clients";
      uint32_t v13 = v5;
      uint32_t v14 = 12;
LABEL_22:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
LABEL_23:

    uint64_t result = *(void *)(a1 + 32);
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    id v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v8 = i;
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
          *(_DWORD *)buf = 136315650;
          double v17 = *(double *)&v8;
          __int16 v18 = 1024;
          int v19 = 194;
          __int16 v20 = 2048;
          double v21 = v11;
          uint64_t v12 = "%30s:%-4d: %13.5f: Match or enroll operation initiated when a stream was running, cancelling stream and "
                "sending a notification to clients";
          uint32_t v13 = v5;
          uint32_t v14 = 28;
          goto LABEL_22;
        }
      }
    }
    goto LABEL_23;
  }
LABEL_24:
  [(id)result sendNotification:1];
  return (uint64_t)(id)[*(id *)(a1 + 32) cancelEventStream];
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_15(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  BOOL v2 = BKSHIDServicesIsSmartCoverClosed() != 0;

  return [v1 setSmartCoverState:v2];
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSmartCoverState:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayState:*(unsigned __int8 *)(a1 + 40)];
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsAttentionAwareFeaturesEnabled:_AXSAttentionAwarenessFeaturesEnabled() != 0];
  if (currentLogLevel < 7) {
    goto LABEL_16;
  }
  unint64_t v3 = _AALog();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_15;
  }
  uint64_t v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/PearlAttentionStreamer.m";
        *(i - 1) == 47;
        ++i)
  {
    uint64_t v4 = i;
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
  int v8 = [WeakRetained isAttentionAwareFeaturesEnabled];
  id v9 = "OFF";
  *(_DWORD *)double v11 = 136315906;
  *(void *)&v11[4] = v4;
  *(_WORD *)&v11[12] = 1024;
  *(_DWORD *)&v11[14] = 154;
  if (v8) {
    id v9 = "ON";
  }
  *(_WORD *)&v11[18] = 2048;
  *(double *)&v11[20] = v7;
  __int16 v12 = 2080;
  uint32_t v13 = v9;
  _os_log_impl(&dword_1B3B4B000, v3, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: User toggled the Attention Aware Features flag to %s", v11, 0x26u);
LABEL_15:

LABEL_16:
  if ((objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled", *(_OWORD *)v11, *(void *)&v11[16]) & 1) == 0)
  {
    if ([WeakRetained attentionStreamerRunning]) {
      id v10 = (id)[*(id *)(a1 + 32) cancelEventStream];
    }
    [WeakRetained sendNotification:4];
  }
}

@end