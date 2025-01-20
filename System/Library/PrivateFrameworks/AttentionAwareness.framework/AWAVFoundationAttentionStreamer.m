@interface AWAVFoundationAttentionStreamer
- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions;
- (BOOL)attentionStreamerRunning;
- (BOOL)getStreamingSessionAndStartRunning:(id)a3;
- (BOOL)isAttentionAwareFeaturesEnabled;
- (id)cancelEventStream;
- (id)initForUnitTest:(BOOL)a3 queue:(id)a4;
- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5;
- (id)unitTestController;
- (id)unitTestDevice;
- (void)receiveMetadata:(id)a3 type:(id)a4;
- (void)receiveNotificationOfName:(id)a3 notification:(id)a4;
- (void)receiveStreamingEvent;
- (void)sendNotification:(unint64_t)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setIsAttentionAwareFeaturesEnabled:(BOOL)a3;
- (void)setNotificationHandler:(id)a3;
- (void)setSmartCoverState:(BOOL)a3;
- (void)stopStreaming;
@end

@implementation AWAVFoundationAttentionStreamer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unitTestController, 0);
  objc_storeStrong((id *)&self->_unitTester, 0);
  objc_storeStrong((id *)&self->_AVFoundationEngine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);

  objc_storeStrong(&self->_callbackBlock, 0);
}

- (id)unitTestController
{
  return self->_unitTestController;
}

- (id)unitTestDevice
{
  return self->_unitTester;
}

- (void)receiveStreamingEvent
{
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  memset(v11, 0, sizeof(v11));
  BOOL AWAttentionStreamerActivateEyeRelief = self->_currentOptions.AWAttentionStreamerActivateEyeRelief;
  double v4 = 100.0;
  if (!self->_currentOptions.AWAttentionStreamerActivateEyeRelief) {
    double v4 = 0.0;
  }
  uint64_t v5 = 1;
  if (self->_currentOptions.AWAttentionStreamerActivateEyeRelief) {
    uint64_t v5 = 2;
  }
  *((double *)&v12 + 1) = v4;
  *(void *)&long long v13 = AWAttentionStreamerActivateEyeRelief;
  *((void *)&v13 + 1) = v5;
  v6 = [AWFaceDetectAttentionEvent alloc];
  unint64_t v7 = absTimeNS();
  if (v7 == -1) {
    double v8 = INFINITY;
  }
  else {
    double v8 = (double)v7 / 1000000000.0;
  }
  v9 = [(AWFaceDetectAttentionEvent *)v6 initWithTimestamp:0 tagIndex:v11 faceMetadata:v8];
  callbackBlock = (void (**)(id, void *))self->_callbackBlock;
  if (callbackBlock) {
    callbackBlock[2](callbackBlock, v9);
  }
}

- (void)stopStreaming
{
  if (self->_unitTest)
  {
    id v3 = [(AWAVFoundationAttentionStreamer *)self unitTestDevice];
    [v3 cancelUnitTestStream];
  }
  else
  {
    [self->_AVFoundationEngine unregisterForOperation:self->_identifier];
    self->_attentionStreamerRunning = 0;
  }
}

- (void)receiveNotificationOfName:(id)a3 notification:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (currentLogLevel == 5)
  {
    double v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      *(_DWORD *)v57 = 134218242;
      *(double *)&v57[4] = v10;
      *(_WORD *)&v57[12] = 2112;
      *(void *)&v57[14] = v6;
      long long v15 = "%13.5f: Notification %@ received";
      long long v16 = v8;
      uint32_t v17 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, v57, v17);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    double v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v11 = i;
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
          *(_DWORD *)v57 = 136315906;
          *(void *)&v57[4] = v11;
          *(_WORD *)&v57[12] = 1024;
          *(_DWORD *)&v57[14] = 544;
          *(_WORD *)&v57[18] = 2048;
          *(double *)&v57[20] = v14;
          *(_WORD *)&v57[28] = 2112;
          *(void *)&v57[30] = v6;
          long long v15 = "%30s:%-4d: %13.5f: Notification %@ received";
          long long v16 = v8;
          uint32_t v17 = 38;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E4F159C8], *(_OWORD *)v57, *(void *)&v57[16], *(_OWORD *)&v57[24]))
  {
    if (v7)
    {
      if (currentLogLevel == 5)
      {
        long long v18 = _AALog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v19 = absTimeNS();
          if (v19 == -1) {
            double v20 = INFINITY;
          }
          else {
            double v20 = (double)v19 / 1000000000.0;
          }
          v36 = [v7 userInfo];
          *(_DWORD *)v57 = 134218242;
          *(double *)&v57[4] = v20;
          *(_WORD *)&v57[12] = 2112;
          *(void *)&v57[14] = v36;
          v37 = "%13.5f: Runtime error received: %@";
          v38 = v18;
          uint32_t v39 = 22;
LABEL_81:
          _os_log_impl(&dword_1B3B4B000, v38, OS_LOG_TYPE_DEFAULT, v37, v57, v39);
        }
LABEL_82:

        goto LABEL_83;
      }
      if (currentLogLevel >= 6)
      {
        long long v18 = _AALog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v26 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
          for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
                ;
                ++j)
          {
            if (*(j - 1) == 47)
            {
              v26 = j;
            }
            else if (!*(j - 1))
            {
              unint64_t v30 = absTimeNS();
              if (v30 == -1) {
                double v31 = INFINITY;
              }
              else {
                double v31 = (double)v30 / 1000000000.0;
              }
              v36 = [v7 userInfo];
              *(_DWORD *)v57 = 136315906;
              *(void *)&v57[4] = v26;
              *(_WORD *)&v57[12] = 1024;
              *(_DWORD *)&v57[14] = 549;
              *(_WORD *)&v57[18] = 2048;
              *(double *)&v57[20] = v31;
              *(_WORD *)&v57[28] = 2112;
              *(void *)&v57[30] = v36;
              v37 = "%30s:%-4d: %13.5f: Runtime error received: %@";
              v38 = v18;
              uint32_t v39 = 38;
              goto LABEL_81;
            }
          }
        }
        goto LABEL_82;
      }
    }
LABEL_83:
    -[AWAVFoundationAttentionStreamer sendNotification:](self, "sendNotification:", 1, *(void *)v57, *(_OWORD *)&v57[8], *(_OWORD *)&v57[24]);
    id v47 = [(AWAVFoundationAttentionStreamer *)self cancelEventStream];
    goto LABEL_96;
  }
  if (![v6 isEqual:*MEMORY[0x1E4F15988]])
  {
    if ([v6 isEqual:*MEMORY[0x1E4F15990]]) {
      goto LABEL_96;
    }
    if (![v6 isEqual:*MEMORY[0x1E4F159D0]])
    {
      [v6 isEqual:*MEMORY[0x1E4F159A0]];
      goto LABEL_96;
    }
    if (currentLogLevel == 5)
    {
      long long v18 = _AALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v24 = absTimeNS();
        if (v24 == -1) {
          double v25 = INFINITY;
        }
        else {
          double v25 = (double)v24 / 1000000000.0;
        }
        *(_DWORD *)v57 = 134217984;
        *(double *)&v57[4] = v25;
        v54 = "%13.5f: Streaming session was interrupted";
        v55 = v18;
        uint32_t v56 = 12;
LABEL_103:
        _os_log_impl(&dword_1B3B4B000, v55, OS_LOG_TYPE_DEFAULT, v54, v57, v56);
      }
      goto LABEL_82;
    }
    if (currentLogLevel >= 6)
    {
      long long v18 = _AALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v32 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
        for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
              ;
              ++k)
        {
          if (*(k - 1) == 47)
          {
            v32 = k;
          }
          else if (!*(k - 1))
          {
            unint64_t v52 = absTimeNS();
            if (v52 == -1) {
              double v53 = INFINITY;
            }
            else {
              double v53 = (double)v52 / 1000000000.0;
            }
            *(_DWORD *)v57 = 136315650;
            *(void *)&v57[4] = v32;
            *(_WORD *)&v57[12] = 1024;
            *(_DWORD *)&v57[14] = 565;
            *(_WORD *)&v57[18] = 2048;
            *(double *)&v57[20] = v53;
            v54 = "%30s:%-4d: %13.5f: Streaming session was interrupted";
            v55 = v18;
            uint32_t v56 = 28;
            goto LABEL_103;
          }
        }
      }
      goto LABEL_82;
    }
    goto LABEL_83;
  }
  self->_attentionStreamerRunning = 1;
  if (currentLogLevel == 5)
  {
    uint64_t v21 = _AALog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = absTimeNS();
      if (v22 == -1) {
        double v23 = INFINITY;
      }
      else {
        double v23 = (double)v22 / 1000000000.0;
      }
      v40 = "IS RUNNING";
      if (self->_currentOptions.AWAttentionStreamerActivateEyeRelief) {
        v41 = "IS RUNNING";
      }
      else {
        v41 = "IS NOT RUNNING";
      }
      BOOL AWAttentionStreamerActivatePersonDetection = self->_currentOptions.AWAttentionStreamerActivatePersonDetection;
      if (self->_currentOptions.AWAttentionStreamerActivateAttentionDetection) {
        v43 = "IS RUNNING";
      }
      else {
        v43 = "IS NOT RUNNING";
      }
      *(_DWORD *)v57 = 134218754;
      if (!AWAttentionStreamerActivatePersonDetection) {
        v40 = "IS NOT RUNNING";
      }
      *(double *)&v57[4] = v23;
      *(_WORD *)&v57[12] = 2080;
      *(void *)&v57[14] = v41;
      *(_WORD *)&v57[22] = 2080;
      *(void *)&v57[24] = v43;
      *(_WORD *)&v57[32] = 2080;
      *(void *)&v57[34] = v40;
      v44 = "%13.5f: Attention detection session started ER %s, AD/FD %s PD %s";
      v45 = v21;
      uint32_t v46 = 42;
      goto LABEL_94;
    }
    goto LABEL_95;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v21 = _AALog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_95;
    }
    v28 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
    for (m = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
          ;
          ++m)
    {
      if (*(m - 1) == 47)
      {
        v28 = m;
      }
      else if (!*(m - 1))
      {
        unint64_t v34 = absTimeNS();
        if (v34 == -1) {
          double v35 = INFINITY;
        }
        else {
          double v35 = (double)v34 / 1000000000.0;
        }
        v48 = "IS RUNNING";
        if (self->_currentOptions.AWAttentionStreamerActivateEyeRelief) {
          v49 = "IS RUNNING";
        }
        else {
          v49 = "IS NOT RUNNING";
        }
        BOOL v50 = self->_currentOptions.AWAttentionStreamerActivatePersonDetection;
        if (self->_currentOptions.AWAttentionStreamerActivateAttentionDetection) {
          v51 = "IS RUNNING";
        }
        else {
          v51 = "IS NOT RUNNING";
        }
        *(_DWORD *)v57 = 136316418;
        if (!v50) {
          v48 = "IS NOT RUNNING";
        }
        *(void *)&v57[4] = v28;
        *(_WORD *)&v57[12] = 1024;
        *(_DWORD *)&v57[14] = 556;
        *(_WORD *)&v57[18] = 2048;
        *(double *)&v57[20] = v35;
        *(_WORD *)&v57[28] = 2080;
        *(void *)&v57[30] = v49;
        *(_WORD *)&v57[38] = 2080;
        *(void *)&v57[40] = v51;
        __int16 v58 = 2080;
        v59 = v48;
        v44 = "%30s:%-4d: %13.5f: Attention detection session started ER %s, AD/FD %s PD %s";
        v45 = v21;
        uint32_t v46 = 58;
LABEL_94:
        _os_log_impl(&dword_1B3B4B000, v45, OS_LOG_TYPE_DEFAULT, v44, v57, v46);
LABEL_95:

        break;
      }
    }
  }
LABEL_96:
}

- (void)receiveMetadata:(id)a3 type:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  memset(v45, 0, sizeof(v45));
  if ((id)*MEMORY[0x1E4F15E30] == v7)
  {
    id v20 = v6;
    double v10 = v20;
    long long v21 = 0uLL;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v54 = 0;
    *((void *)&v46 + 1) = 1;
    if (v20)
    {
      if objc_msgSend(v20, "hasPayingAttention", v45[0], v45[1], v45[2], v46, v47, v48, v49, v50, v51, v52, v53, v54)&& (!objc_msgSend(v10, "hasPayingAttention") || (objc_msgSend(v10, "payingAttention")))
      {
        uint64_t v14 = 0;
        float v15 = 0.0;
        if ([v10 hasPayingAttention] && objc_msgSend(v10, "payingAttention"))
        {
          LOBYTE(v45[0]) = 1;
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          if (objc_msgSend(v10, "hasPitchAngle", *(void *)&v45[0]))
          {
            [v10 pitchAngle];
            uint64_t v19 = v22;
          }
          *((void *)&v45[0] + 1) = v19;
          if ([v10 hasYawAngle])
          {
            [v10 yawAngle];
            uint64_t v18 = v23;
          }
          *(void *)&v45[1] = v18;
          uint64_t v17 = 0;
          if ([v10 hasRollAngle])
          {
            [v10 rollAngle];
            uint64_t v17 = v24;
          }
          *((void *)&v45[1] + 1) = v17;
          if ([v10 hasDistance])
          {
            [v10 distance];
            uint64_t v14 = v25;
          }
          *((void *)&v45[2] + 1) = v14;
          if ([v10 hasOrientation])
          {
            uint64_t v26 = [v10 orientation];
            if ((unint64_t)(v26 - 1) >= 4) {
              v11 = 0;
            }
            else {
              v11 = (void *)v26;
            }
          }
          else
          {
            v11 = 0;
          }
          *(void *)&v45[2] = v11;
          float v16 = 0.0;
          if ([v10 hasPayingAttentionConfidence])
          {
            [v10 payingAttentionConfidence];
            float v16 = v43 * 100.0;
          }
          *((float *)&v51 + 2) = v16;
          if ([v10 hasConfidence])
          {
            [v10 confidence];
            float v15 = v44 * 100.0;
          }
          double v10 = 0;
          *((float *)&v51 + 3) = v15;
          int v12 = 1;
          goto LABEL_36;
        }
        double v10 = 0;
        v11 = 0;
        int v12 = 0;
        goto LABEL_34;
      }
      double v10 = 0;
      v11 = 0;
      int v12 = 0;
      long long v21 = 0uLL;
    }
    else
    {
      v11 = 0;
      int v12 = 0;
    }
    LOBYTE(v45[0]) = 0;
    *((void *)&v51 + 1) = 0;
    *(_OWORD *)((char *)v45 + 8) = v21;
    *(_OWORD *)((char *)&v45[1] + 8) = v21;
LABEL_33:
    uint64_t v14 = 0;
    float v15 = 0.0;
LABEL_34:
    float v16 = 0.0;
    uint64_t v17 = 0;
LABEL_35:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_36:

    char v13 = 0;
    goto LABEL_37;
  }
  double v8 = objc_msgSend(v6, "type", v45[0], v45[1], v45[2], v46, v47, v48, v49, v50, v51, v52, v53, v54);
  unint64_t v9 = (void *)*MEMORY[0x1E4F15E28];

  if (v8 == v9)
  {
    id v27 = v6;
    v11 = v27;
    *((void *)&v46 + 1) = 2;
    if (v27)
    {
      uint64_t v28 = [v27 eyeReliefStatus];
      if ((unint64_t)(v28 - 1) >= 5) {
        double v10 = 0;
      }
      else {
        double v10 = (void *)v28;
      }
      *(void *)&long long v46 = v10;
      uint64_t v17 = 0;
      uint64_t v14 = 0;
      if ([v11 hasDistance])
      {
        [v11 distance];
        uint64_t v14 = v29;
      }
      v11 = 0;
      int v12 = 0;
      *((void *)&v45[2] + 1) = v14;
      float v15 = 0.0;
      float v16 = 0.0;
      goto LABEL_35;
    }
    double v10 = 0;
    int v12 = 0;
    *((void *)&v45[2] + 1) = 0;
    *(void *)&long long v46 = 0;
    goto LABEL_33;
  }
  double v10 = 0;
  v11 = 0;
  int v12 = 0;
  char v13 = 1;
  uint64_t v14 = 0;
  float v15 = 0.0;
  float v16 = 0.0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
LABEL_37:
  if (currentLogLevel < 7) {
    goto LABEL_53;
  }
  unint64_t v30 = _AALog();
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_52;
  }
  double v31 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
        *(i - 1) == 47;
        ++i)
  {
    double v31 = i;
LABEL_44:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_44;
  }
  unint64_t v33 = absTimeNS();
  if (v33 == -1) {
    double v34 = INFINITY;
  }
  else {
    double v34 = (double)v33 / 1000000000.0;
  }
  if (v12) {
    double v35 = "FACE FOUND";
  }
  else {
    double v35 = "FACE NOT FOUND";
  }
  v36 = getFaceDetectOrientationDescription((unint64_t)v11);
  v37 = getEyeReliefFaceStateDescription((unint64_t)v10);
  *(_DWORD *)buf = 136318210;
  uint32_t v56 = v31;
  __int16 v57 = 1024;
  int v58 = 528;
  __int16 v59 = 2048;
  double v60 = v34;
  __int16 v61 = 2112;
  v62 = self;
  __int16 v63 = 2080;
  v64 = v35;
  __int16 v65 = 2048;
  uint64_t v66 = v19;
  __int16 v67 = 2048;
  uint64_t v68 = v18;
  __int16 v69 = 2048;
  uint64_t v70 = v17;
  __int16 v71 = 2112;
  v72 = v36;
  __int16 v73 = 2048;
  uint64_t v74 = v14;
  __int16 v75 = 2112;
  v76 = v37;
  __int16 v77 = 2048;
  double v78 = v16;
  __int16 v79 = 2048;
  double v80 = v15;
  _os_log_impl(&dword_1B3B4B000, v30, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ faceDetectStateChanged %s pitch: %13.5f yaw: %13.5f roll: %13.5f orientation: %@ distance: %13.5f eyeReliefFaceState:%@ attentionScore: %ffaceDetectionScore: %f", buf, 0x80u);

LABEL_52:
LABEL_53:
  if (self->_callbackBlock) {
    char v38 = v13;
  }
  else {
    char v38 = 1;
  }
  if ((v38 & 1) == 0)
  {
    uint32_t v39 = [AWFaceDetectAttentionEvent alloc];
    unint64_t v40 = absTimeNS();
    if (v40 == -1) {
      double v41 = INFINITY;
    }
    else {
      double v41 = (double)v40 / 1000000000.0;
    }
    v42 = [(AWFaceDetectAttentionEvent *)v39 initWithTimestamp:0 tagIndex:v45 faceMetadata:v41];
    (*((void (**)(id))self->_callbackBlock + 2))(self->_callbackBlock);
  }
}

- (BOOL)getStreamingSessionAndStartRunning:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_unitTest)
  {
    uint64_t v5 = [(AWAVFoundationAttentionStreamer *)self unitTestDevice];
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
        *(_DWORD *)uint64_t v22 = 134218242;
        *(double *)&v22[4] = v8;
        *(_WORD *)&v22[12] = 2112;
        *(void *)&v22[14] = v5;
        uint64_t v18 = "%13.5f: Using device %@ for starting AVFoundation operations";
        uint64_t v19 = v6;
        uint32_t v20 = 22;
LABEL_26:
        _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v18, v22, v20);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_28:
        objc_msgSend(v5, "setAVFoundationDelegate:", self, *(_OWORD *)v22, *(void *)&v22[16], *(_OWORD *)&v22[24], v23);
        char v13 = [v5 startUnitTestStream:self->_queue options:*(unsigned __int16 *)&self->_currentOptions.AWAttentionStreamerActivateEyeRelief | ((unint64_t)self->_currentOptions.AWAttentionStreamerActivatePersonDetection << 16)];

        goto LABEL_29;
      }
      id v6 = _AALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v14 = i;
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
            *(_DWORD *)uint64_t v22 = 136315906;
            *(void *)&v22[4] = v14;
            *(_WORD *)&v22[12] = 1024;
            *(_DWORD *)&v22[14] = 383;
            *(_WORD *)&v22[18] = 2048;
            *(double *)&v22[20] = v17;
            *(_WORD *)&v22[28] = 2112;
            *(void *)&v22[30] = v5;
            uint64_t v18 = "%30s:%-4d: %13.5f: Using device %@ for starting AVFoundation operations";
            uint64_t v19 = v6;
            uint32_t v20 = 38;
            goto LABEL_26;
          }
        }
      }
    }

    goto LABEL_28;
  }
  AVFoundationEngine = self->_AVFoundationEngine;
  if (!AVFoundationEngine)
  {
    double v10 = +[AVFoundationEngine sharedEngine];
    v11 = self->_AVFoundationEngine;
    self->_AVFoundationEngine = v10;

    AVFoundationEngine = self->_AVFoundationEngine;
  }
  if ([AVFoundationEngine registerForOperation:self activateAttentionDetection:self->_currentOptions.AWAttentionStreamerActivateAttentionDetection activateEyeRelief:self->_currentOptions.AWAttentionStreamerActivateEyeRelief activatePersonDetection:self->_currentOptions.AWAttentionStreamerActivatePersonDetection identifier:self->_identifier]&& ([self->_AVFoundationEngine startOperationForReceiver:self->_identifier reply:v4], int v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    char v13 = 1;
    self->_attentionStreamerRunning = 1;
  }
  else
  {
    char v13 = 0;
  }
LABEL_29:

  return v13;
}

- (void)sendNotification:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id notificationBlock = self->_notificationBlock;
  if (notificationBlock)
  {
    uint64_t v5 = (void (*)(void))*((void *)notificationBlock + 2);
    v5();
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

- (void)setSmartCoverState:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL smartCoverClosed = self->_smartCoverClosed;
  if (smartCoverClosed != a3)
  {
    self->_BOOL smartCoverClosed = a3;
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
        int v12 = "Closed";
        if (!self->_smartCoverClosed) {
          int v12 = "Opened";
        }
        int v23 = 134218242;
        double v24 = v7;
        __int16 v25 = 2080;
        *(void *)uint64_t v26 = v12;
        char v13 = "%13.5f: Smart cover state changed to %s";
        uint64_t v14 = v5;
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
      uint64_t v5 = _AALog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
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
              double v17 = "Closed";
            }
            else {
              double v17 = "Opened";
            }
            double v24 = *(double *)&v8;
            __int16 v25 = 1024;
            *(_DWORD *)uint64_t v26 = 344;
            *(_WORD *)&v26[4] = 2048;
            *(double *)&v26[6] = v11;
            __int16 v27 = 2080;
            uint64_t v28 = v17;
            char v13 = "%30s:%-4d: %13.5f: Smart cover state changed to %s";
            uint64_t v14 = v5;
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
    id v18 = [(AWAVFoundationAttentionStreamer *)self cancelEventStream];
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))self->_notificationBlock + 2))(self->_notificationBlock, 1, v19, v20, v21, v22);
  }
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
        char v13 = "OFF";
        if (v5) {
          char v13 = "ON";
        }
        int v23 = 134218242;
        double v24 = v8;
        __int16 v25 = 2080;
        *(void *)uint64_t v26 = v13;
        uint64_t v14 = "%13.5f: Display state changed to %s";
        uint32_t v15 = v6;
        uint32_t v16 = 22;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    BOOL displayOn = a3;
    if (currentLogLevel >= 6)
    {
      unint64_t v6 = _AALog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      unint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v9 = i;
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
          double v17 = "OFF";
          int v23 = 136315906;
          double v24 = *(double *)&v9;
          __int16 v25 = 1024;
          if (v5) {
            double v17 = "ON";
          }
          *(_DWORD *)uint64_t v26 = 325;
          *(_WORD *)&v26[4] = 2048;
          *(double *)&v26[6] = v12;
          __int16 v27 = 2080;
          uint64_t v28 = v17;
          uint64_t v14 = "%30s:%-4d: %13.5f: Display state changed to %s";
          uint32_t v15 = v6;
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
    id v18 = [(AWAVFoundationAttentionStreamer *)self cancelEventStream];
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))self->_notificationBlock + 2))(self->_notificationBlock, 1, v19, v20, v21, v22);
  }
}

- (BOOL)attentionStreamerRunning
{
  return self->_attentionStreamerRunning;
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)*(unsigned __int16 *)&self->_currentOptions.AWAttentionStreamerActivateEyeRelief;
}

- (id)cancelEventStream
{
  v10[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_attentionStreamerRunning)
  {
    [(AWAVFoundationAttentionStreamer *)self stopStreaming];
    id callbackBlock = self->_callbackBlock;
    self->_id callbackBlock = 0;

    id v4 = 0;
    *(_WORD *)&self->_currentOptions.BOOL AWAttentionStreamerActivateEyeRelief = 0;
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28798];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @" Attention streamer not running";
    unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v4 = [v5 errorWithDomain:v6 code:3 userInfo:v7];
  }

  return v4;
}

- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5
{
  unsigned int v6 = *(_DWORD *)&a4.var0;
  v75[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(AWAVFoundationAttentionStreamer *)self isAttentionAwareFeaturesEnabled])
  {
    if (currentLogLevel >= 3)
    {
      uint32_t v16 = _AALog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v28 = absTimeNS();
        if (v28 == -1) {
          double v29 = INFINITY;
        }
        else {
          double v29 = (double)v28 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v65 = v29;
        _os_log_error_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_ERROR, "%13.5f: User has AttentionAware features off, cannot start streaming operation with Pearl", buf, 0xCu);
      }
    }
    unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v75[0] = @" Attention Aware Features turned OFF";
    char v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = (__CFString **)v75;
    uint32_t v15 = &v74;
    goto LABEL_16;
  }
  if (!self->_displayOn)
  {
    if (currentLogLevel >= 3)
    {
      double v17 = _AALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v36 = absTimeNS();
        if (v36 == -1) {
          double v37 = INFINITY;
        }
        else {
          double v37 = (double)v36 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v65 = v37;
        _os_log_error_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_ERROR, "%13.5f: Display OFF, not starting attention stream", buf, 0xCu);
      }
    }
    unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    __int16 v73 = @" Display OFF";
    char v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v73;
    uint32_t v15 = &v72;
    goto LABEL_16;
  }
  if (self->_smartCoverClosed)
  {
    if (currentLogLevel >= 3)
    {
      unint64_t v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v34 = absTimeNS();
        if (v34 == -1) {
          double v35 = INFINITY;
        }
        else {
          double v35 = (double)v34 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v65 = v35;
        _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Smart cover closed, not starting attention stream", buf, 0xCu);
      }
    }
    unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v70 = *MEMORY[0x1E4F28568];
    __int16 v71 = @" Smart cover closed";
    char v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v71;
    uint32_t v15 = &v70;
LABEL_16:
    id callbackBlock = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    uint64_t v19 = [v11 errorWithDomain:v12 code:1 userInfo:callbackBlock];
LABEL_17:

    goto LABEL_18;
  }
  if (!self->_attentionStreamerRunning) {
    goto LABEL_70;
  }
  if (((v6 >> 8) & 1) != self->_currentOptions.AWAttentionStreamerActivateAttentionDetection
    || (v6 & 1) != self->_currentOptions.AWAttentionStreamerActivateEyeRelief)
  {
    if (currentLogLevel == 5)
    {
      int v23 = _AALog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v24 = absTimeNS();
        if (v24 == -1) {
          double v25 = INFINITY;
        }
        else {
          double v25 = (double)v24 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v65 = v25;
        char v38 = "%13.5f: Cancelling current stream and starting a new one as stream options have changed";
        uint32_t v39 = v23;
        uint32_t v40 = 12;
LABEL_67:
        _os_log_impl(&dword_1B3B4B000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_69:
        id v41 = [(AWAVFoundationAttentionStreamer *)self cancelEventStream];
LABEL_70:
        self->_currentOptions.AWAttentionStreamerActivateAttentionDetection = BYTE1(v6) & 1;
        self->_currentOptions.BOOL AWAttentionStreamerActivateEyeRelief = v6 & 1;
        self->_currentOptions.BOOL AWAttentionStreamerActivatePersonDetection = 0;
        uint64_t v56 = MEMORY[0x1E4F143A8];
        uint64_t v57 = 3221225472;
        int v58 = __90__AWAVFoundationAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke;
        __int16 v59 = &unk_1E606A570;
        double v60 = self;
        id v61 = v9;
        BOOL v42 = [(AWAVFoundationAttentionStreamer *)self getStreamingSessionAndStartRunning:&v56];
        if (v42)
        {
          uint64_t v19 = 0;
        }
        else
        {
          long long v50 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v51 = *MEMORY[0x1E4F28798];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          __int16 v63 = @" Unable to get a streaming session from AVFoundation";
          long long v52 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1, v56, v57, v58, v59, v60);
          uint64_t v19 = [v50 errorWithDomain:v51 code:6 userInfo:v52];

          if (currentLogLevel >= 3)
          {
            long long v53 = _AALog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              unint64_t v54 = absTimeNS();
              if (v54 == -1) {
                double v55 = INFINITY;
              }
              else {
                double v55 = (double)v54 / 1000000000.0;
              }
              *(_DWORD *)buf = 134217984;
              double v65 = v55;
              _os_log_error_impl(&dword_1B3B4B000, v53, OS_LOG_TYPE_ERROR, "%13.5f: Unable to get streaming session and start running", buf, 0xCu);
            }
          }
        }

        char v43 = !v42;
        if (!v8) {
          char v43 = 1;
        }
        if ((v43 & 1) == 0)
        {
          double v44 = (void *)MEMORY[0x1B3EC18C0](v8);
          id callbackBlock = self->_callbackBlock;
          self->_id callbackBlock = v44;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      int v23 = _AALog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v26 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v32 = absTimeNS();
            if (v32 == -1) {
              double v33 = INFINITY;
            }
            else {
              double v33 = (double)v32 / 1000000000.0;
            }
            *(_DWORD *)buf = 136315650;
            double v65 = *(double *)&v26;
            __int16 v66 = 1024;
            int v67 = 227;
            __int16 v68 = 2048;
            double v69 = v33;
            char v38 = "%30s:%-4d: %13.5f: Cancelling current stream and starting a new one as stream options have changed";
            uint32_t v39 = v23;
            uint32_t v40 = 28;
            goto LABEL_67;
          }
        }
      }
    }

    goto LABEL_69;
  }
  if (currentLogLevel == 5)
  {
    id callbackBlock = _AALog();
    if (os_log_type_enabled(callbackBlock, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = absTimeNS();
      if (v21 == -1) {
        double v22 = INFINITY;
      }
      else {
        double v22 = (double)v21 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v65 = v22;
      long long v47 = "%13.5f: Attention streamer already running, don't start another operation";
      long long v48 = callbackBlock;
      uint32_t v49 = 12;
LABEL_82:
      _os_log_impl(&dword_1B3B4B000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
    }
LABEL_83:
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  if (currentLogLevel >= 6)
  {
    id callbackBlock = _AALog();
    if (os_log_type_enabled(callbackBlock, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          unint64_t v30 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v45 = absTimeNS();
          if (v45 == -1) {
            double v46 = INFINITY;
          }
          else {
            double v46 = (double)v45 / 1000000000.0;
          }
          *(_DWORD *)buf = 136315650;
          double v65 = *(double *)&v30;
          __int16 v66 = 1024;
          int v67 = 232;
          __int16 v68 = 2048;
          double v69 = v46;
          long long v47 = "%30s:%-4d: %13.5f: Attention streamer already running, don't start another operation";
          long long v48 = callbackBlock;
          uint32_t v49 = 28;
          goto LABEL_82;
        }
      }
    }
    goto LABEL_83;
  }
  uint64_t v19 = 0;
LABEL_18:

  return v19;
}

void __90__AWAVFoundationAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__AWAVFoundationAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_2;
  v7[3] = &unk_1E606ABB0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __90__AWAVFoundationAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setNotificationHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[AWAVFoundationAttentionStreamer setNotificationHandler:]", "AVFoundationAttentionStreamer.m", 184, "notificationBlock != nil");
  }
  id v7 = v4;
  id v5 = (void *)MEMORY[0x1B3EC18C0]();
  id notificationBlock = self->_notificationBlock;
  self->_id notificationBlock = v5;
}

- (id)initForUnitTest:(BOOL)a3 queue:(id)a4
{
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)AWAVFoundationAttentionStreamer;
  id v8 = [(AWAVFoundationAttentionStreamer *)&v38 init];
  id v9 = v8;
  if (v8)
  {
    v8->_unitTest = a3;
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_attentionStreamerRunning = 0;
    id notificationBlock = v9->_notificationBlock;
    v9->_id notificationBlock = 0;

    id callbackBlock = v9->_callbackBlock;
    v9->_id callbackBlock = 0;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)@"AVFoundationAttentionStreamer";

    *(_WORD *)&v9->_currentOptions.BOOL AWAttentionStreamerActivateEyeRelief = 0;
    v9->_currentOptions.BOOL AWAttentionStreamerActivatePersonDetection = 0;
    AVFoundationEngine = v9->_AVFoundationEngine;
    v9->_AVFoundationEngine = 0;

    unitTester = v9->_unitTester;
    v9->_unitTester = 0;

    unitTestController = v9->_unitTestController;
    v9->_unitTestController = 0;

    objc_initWeak(&location, v9);
    dispatch_once_t predicate = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke;
    block[3] = &unk_1E606A548;
    uint32_t v16 = v9;
    unint64_t v34 = v16;
    objc_copyWeak(&v35, &location);
    dispatch_once(&predicate, block);
    [(AWAVFoundationAttentionStreamer *)v16 setIsAttentionAwareFeaturesEnabled:_AXSAttentionAwarenessFeaturesEnabled() != 0];
    if (v9->_unitTest)
    {
      uint64_t v17 = +[AWUnitTestPearlDevice sharedDevice];
      id v18 = v9->_unitTestController;
      v9->_unitTestController = (AWUnitTestSampler *)v17;

      uint64_t v19 = [(AWUnitTestSampler *)v9->_unitTestController AVFoundationSession];
      uint64_t v20 = v9->_unitTester;
      v9->_unitTester = (AVFoundationUnitTestStreamerCreating *)v19;

      *(_WORD *)&v16->_BOOL displayOn = 1;
      unint64_t v21 = [(AWAVFoundationAttentionStreamer *)v16 unitTestController];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_7;
      v31[3] = &unk_1E606A7D0;
      double v22 = v16;
      unint64_t v32 = v22;
      [v21 setDisplayCallback:v31];

      int v23 = [(AWAVFoundationAttentionStreamer *)v22 unitTestController];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_3;
      v29[3] = &unk_1E606A7D0;
      unint64_t v30 = v22;
      [v23 setSmartCoverCallback:v29];
      unint64_t v24 = (id *)&v32;
    }
    else
    {
      queue = v9->_queue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_5;
      v27[3] = &unk_1E606AC70;
      unint64_t v24 = (id *)&v28;
      unint64_t v28 = v16;
      dispatch_async(queue, v27);
    }

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (int *)(v1 + 48);
  id v3 = *(NSObject **)(v1 + 32);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2;
  handler[3] = &unk_1E606A870;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", v2, v3, handler);
  objc_destroyWeak(&v5);
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_7(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = v3[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2_8;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_3(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = v3[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_4;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  BOOL v2 = BKSHIDServicesIsSmartCoverClosed() != 0;

  return [v1 setSmartCoverState:v2];
}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSmartCoverState:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayState:*(unsigned __int8 *)(a1 + 40)];
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAttentionAwareFeaturesEnabled:_AXSAttentionAwarenessFeaturesEnabled() != 0];
  if (currentLogLevel == 5)
  {
    BOOL v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = absTimeNS();
      if (v3 == -1) {
        double v4 = INFINITY;
      }
      else {
        double v4 = (double)v3 / 1000000000.0;
      }
      int v9 = [WeakRetained isAttentionAwareFeaturesEnabled];
      unint64_t v10 = "OFF";
      if (v9) {
        unint64_t v10 = "ON";
      }
      *(_DWORD *)uint64_t v17 = 134218242;
      *(double *)&v17[4] = v4;
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = v10;
      unint64_t v11 = "%13.5f: User toggled the Attention Aware Features flag to %s";
      uint64_t v12 = v2;
      uint32_t v13 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    BOOL v2 = _AALog();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Streaming/AVFoundationAttentionStreamer.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        id v5 = i;
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
        int v14 = [WeakRetained isAttentionAwareFeaturesEnabled];
        uint32_t v15 = "OFF";
        *(_DWORD *)uint64_t v17 = 136315906;
        *(void *)&v17[4] = v5;
        *(_WORD *)&v17[12] = 1024;
        *(_DWORD *)&v17[14] = 137;
        if (v14) {
          uint32_t v15 = "ON";
        }
        *(_WORD *)&v17[18] = 2048;
        *(double *)&v17[20] = v8;
        *(_WORD *)&v17[28] = 2080;
        *(void *)&v17[30] = v15;
        unint64_t v11 = "%30s:%-4d: %13.5f: User toggled the Attention Aware Features flag to %s";
        uint64_t v12 = v2;
        uint32_t v13 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, v17, v13);
LABEL_24:

        break;
      }
    }
  }
  if ((objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled", *(_OWORD *)v17, *(void *)&v17[16], *(_OWORD *)&v17[24], v18) & 1) == 0)
  {
    if ([WeakRetained attentionStreamerRunning]) {
      id v16 = (id)[WeakRetained cancelEventStream];
    }
    [WeakRetained sendNotification:4];
  }
}

@end