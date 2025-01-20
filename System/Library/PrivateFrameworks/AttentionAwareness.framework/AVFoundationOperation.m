@interface AVFoundationOperation
- (AVFoundationOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4;
- (BOOL)checkIfOptionsHaveChanged:(id)a3;
- (BOOL)checkIfTimeoutHasChanged:(double)a3;
- (BOOL)createAVFoundationOperation;
- (BOOL)isOperationActive;
- (double)Timeout;
- (id)cancelActiveOperation:(id)a3;
- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4;
- (id)unitTestSampler;
- (int)State;
- (int)operationBackend;
- (void)SessionDidStartRunningNotification:(id)a3;
- (void)SessionDidStopRunningNotification:(id)a3;
- (void)SessionInterruptionEndedNotification:(id)a3;
- (void)SessionRuntimeErrorNotification:(id)a3;
- (void)SessionWasInterruptedNotification:(id)a3;
- (void)fakeDataForDemoMode;
- (void)receiveMetadata:(id)a3 type:(id)a4;
- (void)receiveNotificationOfName:(id)a3 notification:(id)a4;
- (void)sendDeviceEvent:(int)a3;
- (void)sendDeviceState:(int)a3;
- (void)sendFaceDetectStateChangeMetadata:(AWFaceDetectMetadata *)a3;
- (void)sendOperationEndReason:(int)a3;
- (void)setDelegate:(id)a3;
- (void)startPresenceDetectOperation:(id)a3;
- (void)timeoutOccurred;
@end

@implementation AVFoundationOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_AVFoundationEngine, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)fakeDataForDemoMode
{
  *(void *)v5 = 1;
  *(void *)&long long v7 = 0;
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  *(int64x2_t *)&v5[8] = vdupq_n_s64(0x4066800000000000uLL);
  *(void *)&v5[24] = 0x4066800000000000;
  long long v6 = 1uLL;
  *((void *)&v7 + 1) = 1;
  memset_pattern16(&v8, &unk_1B3B87460, 0x40uLL);
  v3[8] = v12;
  v3[9] = v13;
  v3[10] = v14;
  uint64_t v4 = v15;
  v3[4] = v8;
  v3[5] = v9;
  v3[6] = v10;
  v3[7] = v11;
  v3[0] = *(_OWORD *)v5;
  v3[1] = *(_OWORD *)&v5[16];
  v3[2] = 1uLL;
  v3[3] = v7;
  [(AVFoundationOperation *)self sendFaceDetectStateChangeMetadata:v3];
}

- (void)sendDeviceState:(int)a3
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:4 data:v3 forOperation:self];
}

- (void)sendDeviceEvent:(int)a3
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  self->_deviceEvent = a3;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:3 data:v3 forOperation:self];
}

- (void)sendOperationEndReason:(int)a3
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:2 data:v3 forOperation:self];
}

- (void)sendFaceDetectStateChangeMetadata:(AWFaceDetectMetadata *)a3
{
  long long v3 = *(_OWORD *)&a3->var12;
  v8[8] = *(_OWORD *)&a3->var9;
  v8[9] = v3;
  v8[10] = *(_OWORD *)&a3->var13.origin.y;
  CGFloat height = a3->var13.size.height;
  long long v4 = *(_OWORD *)&a3->var8[4];
  v8[4] = *(_OWORD *)a3->var8;
  v8[5] = v4;
  long long v5 = *(_OWORD *)&a3->var8[12];
  v8[6] = *(_OWORD *)&a3->var8[8];
  v8[7] = v5;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v6;
  long long v7 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v7;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:1 data:v8 forOperation:self];
}

- (BOOL)checkIfOptionsHaveChanged:(id)a3
{
  return a3.var0 != self->_currentOptions.AWAttentionSamplerActivateAttentionDetection;
}

- (BOOL)checkIfTimeoutHasChanged:(double)a3
{
  return self->_timeout != a3;
}

- (void)timeoutOccurred
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(AVFoundationOperation *)self cancelActiveOperation:@"Operation timed out"];

  [(AVFoundationOperation *)self sendOperationEndReason:4];
}

- (void)SessionInterruptionEndedNotification:(id)a3
{
}

- (void)SessionWasInterruptedNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  [(AVFoundationOperation *)self sendOperationEndReason:3];
}

- (void)SessionDidStopRunningNotification:(id)a3
{
  self->_operationState = 1;
}

- (void)SessionDidStartRunningNotification:(id)a3
{
  self->_operationState = 2;
}

- (void)SessionRuntimeErrorNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    long long v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      long long v12 = [v4 userInfo];
      *(_DWORD *)v17 = 134218242;
      *(double *)&v17[4] = v7;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v12;
      long long v13 = "%13.5f: Runtime error received: %@";
      long long v14 = v5;
      uint32_t v15 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, v17, v15);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    long long v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          long long v8 = i;
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
          long long v12 = [v4 userInfo];
          *(_DWORD *)v17 = 136315906;
          *(void *)&v17[4] = v8;
          *(_WORD *)&v17[12] = 1024;
          *(_DWORD *)&v17[14] = 343;
          *(_WORD *)&v17[18] = 2048;
          *(double *)&v17[20] = v11;
          *(_WORD *)&v17[28] = 2112;
          *(void *)&v17[30] = v12;
          long long v13 = "%30s:%-4d: %13.5f: Runtime error received: %@";
          long long v14 = v5;
          uint32_t v15 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  -[AVFoundationOperation sendDeviceState:](self, "sendDeviceState:", 5, *(_OWORD *)v17, *(void *)&v17[16], *(_OWORD *)&v17[24], v18);
  id v16 = [(AVFoundationOperation *)self cancelActiveOperation:@"Runtime error"];
}

- (BOOL)createAVFoundationOperation
{
  AVFoundationEngine = self->_AVFoundationEngine;
  if (!AVFoundationEngine)
  {
    id v4 = +[AVFoundationEngine sharedEngine];
    long long v5 = self->_AVFoundationEngine;
    self->_AVFoundationEngine = v4;

    AVFoundationEngine = self->_AVFoundationEngine;
  }
  BOOL AWAttentionSamplerActivateAttentionDetection = self->_currentOptions.AWAttentionSamplerActivateAttentionDetection;
  BOOL AWAttentionSamplerActivatePersonDetection = self->_currentOptions.AWAttentionSamplerActivatePersonDetection;
  identifier = self->_identifier;

  return [AVFoundationEngine registerForOperation:self activateAttentionDetection:AWAttentionSamplerActivateAttentionDetection activateEyeRelief:0 activatePersonDetection:AWAttentionSamplerActivatePersonDetection identifier:identifier];
}

- (void)receiveNotificationOfName:(id)a3 notification:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (currentLogLevel == 5)
  {
    long long v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      *(_DWORD *)uint64_t v18 = 134218242;
      *(double *)&v18[4] = v10;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v6;
      uint32_t v15 = "%13.5f: Notification %@ received";
      id v16 = v8;
      uint32_t v17 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, v18, v17);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    long long v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v11 = i;
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
          *(_DWORD *)uint64_t v18 = 136315906;
          *(void *)&v18[4] = v11;
          *(_WORD *)&v18[12] = 1024;
          *(_DWORD *)&v18[14] = 286;
          *(_WORD *)&v18[18] = 2048;
          *(double *)&v18[20] = v14;
          *(_WORD *)&v18[28] = 2112;
          *(void *)&v18[30] = v6;
          uint32_t v15 = "%30s:%-4d: %13.5f: Notification %@ received";
          id v16 = v8;
          uint32_t v17 = 38;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E4F159C8], *(_OWORD *)v18, *(void *)&v18[16], *(_OWORD *)&v18[24], v19))
  {
    [(AVFoundationOperation *)self SessionRuntimeErrorNotification:v7];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F15988]])
  {
    [(AVFoundationOperation *)self SessionDidStartRunningNotification:v7];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F15990]])
  {
    [(AVFoundationOperation *)self SessionDidStopRunningNotification:v7];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F159D0]])
  {
    [(AVFoundationOperation *)self SessionWasInterruptedNotification:v7];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F159A0]])
  {
    [(AVFoundationOperation *)self SessionInterruptionEndedNotification:v7];
  }
}

- (void)receiveMetadata:(id)a3 type:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  LODWORD(v41) = 0;
  *(_DWORD *)((char *)&v41 + 3) = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v40 = 0;
  if ((id)*MEMORY[0x1E4F15E30] == v7)
  {
    id v8 = v6;
    unint64_t v9 = v8;
    if (v8
      && [v8 hasPayingAttention]
      && (![v9 hasPayingAttention] || objc_msgSend(v9, "payingAttention"))
      && objc_msgSend(v9, "hasPayingAttention", 0, 0, 0, 0, 0, 0, 0, 0, 0, v41)
      && [v9 payingAttention])
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      if ([v9 hasPitchAngle])
      {
        [v9 pitchAngle];
        uint64_t v11 = v12;
      }
      if ([v9 hasYawAngle])
      {
        [v9 yawAngle];
        uint64_t v10 = v13;
      }
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      if ([v9 hasRollAngle])
      {
        [v9 rollAngle];
        uint64_t v15 = v16;
      }
      if ([v9 hasDistance])
      {
        [v9 distance];
        uint64_t v14 = v17;
      }
      if ([v9 hasOrientation])
      {
        uint64_t v18 = [v9 orientation];
        if ((unint64_t)(v18 - 1) >= 4) {
          unint64_t v19 = 0;
        }
        else {
          unint64_t v19 = v18;
        }
      }
      else
      {
        unint64_t v19 = 0;
      }
      float v20 = 0.0;
      float v21 = 0.0;
      if ([v9 hasPayingAttentionConfidence])
      {
        [v9 payingAttentionConfidence];
        float v21 = v22 * 100.0;
      }
      if ([v9 hasConfidence])
      {
        [v9 confidence];
        float v20 = v23 * 100.0;
      }
      if (currentLogLevel == 5)
      {
        v24 = _AALog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v25 = absTimeNS();
          if (v25 == -1) {
            double v26 = INFINITY;
          }
          else {
            double v26 = (double)v25 / 1000000000.0;
          }
          v31 = getFaceDetectOrientationDescription(v19);
          *(_DWORD *)buf = 134220034;
          *(double *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = "FACE FOUND";
          *(_WORD *)&buf[32] = 2048;
          *(void *)&buf[34] = v11;
          *(_WORD *)&buf[42] = 2048;
          *(void *)&buf[44] = v10;
          *(_WORD *)&buf[52] = 2048;
          *(void *)&buf[54] = v15;
          *(_WORD *)&buf[62] = 2112;
          *(void *)&buf[64] = v31;
          *(_WORD *)&buf[72] = 2048;
          *(double *)&buf[74] = v21;
          *(_WORD *)&buf[82] = 2048;
          *(double *)&buf[84] = v20;
          v32 = "%13.5f: Received metadata in %@ faceDetectStateChanged %s pitch: %f yaw: %f roll: %f orientation: %@ att"
                "entionScore: %ffaceDetectionScore: %f";
          v33 = v24;
          uint32_t v34 = 92;
LABEL_46:
          _os_log_impl(&dword_1B3B4B000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
        }
      }
      else
      {
        if (currentLogLevel < 6)
        {
LABEL_48:

          buf[0] = 1;
          *(_DWORD *)&buf[1] = v41;
          *(_DWORD *)&buf[4] = *(_DWORD *)((char *)&v41 + 3);
          *(void *)&buf[8] = v11;
          *(void *)&buf[16] = v10;
          *(void *)&buf[24] = v15;
          *(void *)&buf[32] = v19;
          *(void *)&buf[40] = v14;
          *(_OWORD *)&buf[80] = v37;
          *(_OWORD *)&buf[96] = v38;
          long long v43 = v39;
          uint64_t v44 = v40;
          *(_OWORD *)&buf[48] = xmmword_1B3B87440;
          *(_OWORD *)&buf[64] = v36;
          float v45 = v21;
          float v46 = v20;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v49 = 0;
          [(AVFoundationOperation *)self sendFaceDetectStateChangeMetadata:buf];
          [(AVFoundationOperation *)self sendDeviceEvent:3];
          [(AVFoundationOperation *)self sendOperationEndReason:1];
          id v35 = [(AVFoundationOperation *)self cancelActiveOperation:@"Face found"];
          goto LABEL_22;
        }
        v24 = _AALog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v27 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
          for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
                ;
                ++i)
          {
            if (*(i - 1) == 47)
            {
              v27 = i;
            }
            else if (!*(i - 1))
            {
              unint64_t v29 = absTimeNS();
              if (v29 == -1) {
                double v30 = INFINITY;
              }
              else {
                double v30 = (double)v29 / 1000000000.0;
              }
              v31 = getFaceDetectOrientationDescription(v19);
              *(_DWORD *)buf = 136317698;
              *(void *)&buf[4] = v27;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 239;
              *(_WORD *)&buf[18] = 2048;
              *(double *)&buf[20] = v30;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = self;
              *(_WORD *)&buf[38] = 2080;
              *(void *)&buf[40] = "FACE FOUND";
              *(_WORD *)&buf[48] = 2048;
              *(void *)&buf[50] = v11;
              *(_WORD *)&buf[58] = 2048;
              *(void *)&buf[60] = v10;
              *(_WORD *)&buf[68] = 2048;
              *(void *)&buf[70] = v15;
              *(_WORD *)&buf[78] = 2112;
              *(void *)&buf[80] = v31;
              *(_WORD *)&buf[88] = 2048;
              *(double *)&buf[90] = v21;
              *(_WORD *)&buf[98] = 2048;
              *(double *)&buf[100] = v20;
              v32 = "%30s:%-4d: %13.5f: Received metadata in %@ faceDetectStateChanged %s pitch: %f yaw: %f roll: %f orie"
                    "ntation: %@ attentionScore: %ffaceDetectionScore: %f";
              v33 = v24;
              uint32_t v34 = 108;
              goto LABEL_46;
            }
          }
        }
      }

      goto LABEL_48;
    }
  }
  -[AVFoundationOperation sendDeviceEvent:](self, "sendDeviceEvent:", 2, v36, v37, v38, v39, v40, v41);
LABEL_22:
}

- (int)operationBackend
{
  return 2;
}

- (id)unitTestSampler
{
  return 0;
}

- (id)cancelActiveOperation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    long long v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      *(_DWORD *)uint64_t v16 = 134218242;
      *(double *)&v16[4] = v7;
      *(_WORD *)&v16[12] = 2112;
      *(void *)&v16[14] = v4;
      uint64_t v12 = "%13.5f: cancelActiveOperation called with info %@";
      uint64_t v13 = v5;
      uint32_t v14 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, v16, v14);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    long long v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v8 = i;
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
          *(_DWORD *)uint64_t v16 = 136315906;
          *(void *)&v16[4] = v8;
          *(_WORD *)&v16[12] = 1024;
          *(_DWORD *)&v16[14] = 150;
          *(_WORD *)&v16[18] = 2048;
          *(double *)&v16[20] = v11;
          *(_WORD *)&v16[28] = 2112;
          *(void *)&v16[30] = v4;
          uint64_t v12 = "%30s:%-4d: %13.5f: cancelActiveOperation called with info %@";
          uint64_t v13 = v5;
          uint32_t v14 = 38;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  if ([(AVFoundationOperation *)self isOperationActive])
  {
    [self->_AVFoundationEngine unregisterForOperation:self->_identifier];
  }

  return 0;
}

- (void)startPresenceDetectOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  AVFoundationEngine = self->_AVFoundationEngine;
  identifier = self->_identifier;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke;
  v14[3] = &unk_1E6069ED8;
  id v7 = v4;
  id v15 = v7;
  id v8 = [AVFoundationEngine startOperationForReceiver:identifier reply:v14];
  if (!v8)
  {
    double timeout = self->_timeout;
    if (timeout != 0.0)
    {
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke_2;
      block[3] = &unk_1E606A730;
      objc_copyWeak(&v13, &location);
      dispatch_after(v10, queue, block);
      objc_destroyWeak(&v13);
    }
  }
  (*((void (**)(id, void *))v7 + 2))(v7, v8);

  objc_destroyWeak(&location);
}

uint64_t __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timeoutOccurred];
}

- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v7 = [(AVFoundationOperation *)self checkIfTimeoutHasChanged:a3];
  int v8 = v7 | [(AVFoundationOperation *)self checkIfOptionsHaveChanged:*(void *)&v4 & 0xFFFFFFLL];
  if (currentLogLevel == 5)
  {
    unint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = absTimeNS();
      if (v10 == -1) {
        double v11 = INFINITY;
      }
      else {
        double v11 = (double)v10 / 1000000000.0;
      }
      uint64_t v16 = "true";
      *(_DWORD *)buf = 134218754;
      __int16 v32 = 2048;
      if (v4) {
        uint64_t v17 = "true";
      }
      else {
        uint64_t v17 = "false";
      }
      double v31 = v11;
      *(double *)v33 = a3;
      if ((*(void *)&v4 & 0x10000) == 0) {
        uint64_t v16 = "false";
      }
      *(_WORD *)&v33[8] = 2080;
      *(void *)&v33[10] = v17;
      *(_WORD *)&v33[18] = 2080;
      *(void *)&v33[20] = v16;
      uint64_t v18 = "%13.5f: Timeout: %f AWAttentionSamplerActivateAttentionDetection: %s AWAttentionSamplerActivatePersonDetection: %s";
      unint64_t v19 = v9;
      uint32_t v20 = 42;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v9 = _AALog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        uint64_t v12 = i;
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
        float v21 = "true";
        *(_DWORD *)buf = 136316418;
        double v31 = *(double *)&v12;
        __int16 v32 = 1024;
        if (v4) {
          double v22 = "true";
        }
        else {
          double v22 = "false";
        }
        *(_DWORD *)v33 = 108;
        *(_WORD *)&v33[4] = 2048;
        if ((*(void *)&v4 & 0x10000) == 0) {
          float v21 = "false";
        }
        *(double *)&v33[6] = v15;
        *(_WORD *)&v33[14] = 2048;
        *(double *)&v33[16] = a3;
        *(_WORD *)&v33[24] = 2080;
        *(void *)&v33[26] = v22;
        __int16 v34 = 2080;
        id v35 = v21;
        uint64_t v18 = "%30s:%-4d: %13.5f: Timeout: %f AWAttentionSamplerActivateAttentionDetection: %s AWAttentionSamplerActivate"
              "PersonDetection: %s";
        unint64_t v19 = v9;
        uint32_t v20 = 58;
LABEL_29:
        _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_30:

        break;
      }
    }
  }
  if (v8
    && (self->_double timeout = a3,
        self->_currentOptions.BOOL AWAttentionSamplerActivateAttentionDetection = v4 & 1,
        ![(AVFoundationOperation *)self createAVFoundationOperation]))
  {
    unint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28798];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    unint64_t v29 = @" Unable to create Presence detect operation through AVFoundation";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    double v23 = [v25 errorWithDomain:v26 code:19 userInfo:v27];
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

- (int)State
{
  return self->_operationState;
}

- (double)Timeout
{
  return self->_timeout;
}

- (BOOL)isOperationActive
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  AVFoundationEngine = self->_AVFoundationEngine;
  identifier = self->_identifier;

  return [AVFoundationEngine isOperationActive:identifier];
}

- (void)setDelegate:(id)a3
{
  int v4 = (PearlCameraInterfaceMessaging *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  delegate = self->_delegate;
  self->_delegate = v4;
}

- (AVFoundationOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AVFoundationOperation;
  int v8 = [(AVFoundationOperation *)&v25 init];
  if (v8)
  {
    if (currentLogLevel == 5)
    {
      unint64_t v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v27 = v11;
        __int16 v28 = 2112;
        *(void *)unint64_t v29 = v8;
        uint64_t v16 = "%13.5f: AVFoundationOperation %@ initialized";
        uint64_t v17 = v9;
        uint32_t v18 = 22;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        objc_storeStrong((id *)v8 + 1, a3);
        v8[40] = a4;
        unint64_t v19 = (void *)*((void *)v8 + 3);
        *((void *)v8 + 3) = 0;
        *((void *)v8 + 4) = 0;

        *(_WORD *)(v8 + 41) = 0;
        *((void *)v8 + 6) = 0x400000001;
        uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        float v21 = (void *)*((void *)v8 + 7);
        *((void *)v8 + 7) = v20;

        double v22 = (void *)*((void *)v8 + 8);
        *((void *)v8 + 8) = @"AVFoundationAttentionSampler";

        double v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AttentionAwareness"];
        v8[72] = [v23 BOOLForKey:@"demoMode"];

        goto LABEL_23;
      }
      unint64_t v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAVFoundationInterface.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v12 = i;
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
            *(_DWORD *)buf = 136315906;
            double v27 = *(double *)&v12;
            __int16 v28 = 1024;
            *(_DWORD *)unint64_t v29 = 59;
            *(_WORD *)&v29[4] = 2048;
            *(double *)&v29[6] = v15;
            __int16 v30 = 2112;
            double v31 = v8;
            uint64_t v16 = "%30s:%-4d: %13.5f: AVFoundationOperation %@ initialized";
            uint64_t v17 = v9;
            uint32_t v18 = 38;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
LABEL_23:

  return (AVFoundationOperation *)v8;
}

@end