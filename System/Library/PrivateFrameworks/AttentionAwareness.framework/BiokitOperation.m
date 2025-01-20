@interface BiokitOperation
- (BOOL)isOperationActive;
- (BiokitOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4;
- (double)Timeout;
- (id)cancelActiveOperation:(id)a3;
- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4;
- (id)unitTestSampler;
- (int)State;
- (int)operationBackend;
- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4;
- (void)device:(id)a3 pearlStateChanged:(int64_t)a4;
- (void)operation:(id)a3 faceDetectStateChanged:(id)a4;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 motionDetectStateChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startPresenceDetectOperation:(id)a3;
@end

@implementation BiokitOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pendingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)unitTestSampler
{
  return self->_pearlDevice;
}

- (int)operationBackend
{
  return 1;
}

- (void)device:(id)a3 pearlStateChanged:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      LODWORD(v17[0]) = 134218498;
      *(double *)((char *)v17 + 4) = v9;
      WORD6(v17[0]) = 2112;
      *(void *)((char *)v17 + 14) = self;
      WORD3(v17[1]) = 2080;
      *((void *)&v17[1] + 1) = getDeviceStateDescription(a4);
      v14 = "%13.5f: %@ pearlStateChanged %s";
      v15 = v7;
      uint32_t v16 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v17, v16);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
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
          LODWORD(v17[0]) = 136316162;
          *(void *)((char *)v17 + 4) = v10;
          WORD6(v17[0]) = 1024;
          *(_DWORD *)((char *)v17 + 14) = 440;
          WORD1(v17[1]) = 2048;
          *(double *)((char *)&v17[1] + 4) = v13;
          WORD6(v17[1]) = 2112;
          *(void *)((char *)&v17[1] + 14) = self;
          WORD3(v17[2]) = 2080;
          *((void *)&v17[2] + 1) = getDeviceStateDescription(a4);
          v14 = "%30s:%-4d: %13.5f: %@ pearlStateChanged %s";
          v15 = v7;
          uint32_t v16 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  LODWORD(v17[0]) = a4;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:4 data:v17 forOperation:self];
}

- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4
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
      DeviceEventDescription = getDeviceEventDescription(a4);
      pendingPresenceOperation = self->_pendingPresenceOperation;
      LODWORD(v21[0]) = 134219010;
      *(double *)((char *)v21 + 4) = v9;
      WORD6(v21[0]) = 2112;
      *(void *)((char *)v21 + 14) = self;
      WORD3(v21[1]) = 2080;
      *((void *)&v21[1] + 1) = DeviceEventDescription;
      LOWORD(v21[2]) = 2048;
      *(void *)((char *)&v21[2] + 2) = pendingPresenceOperation;
      WORD5(v21[2]) = 2080;
      *(void *)((char *)&v21[2] + 12) = getOperationStateDescription([(BKFaceDetectOperation *)pendingPresenceOperation state]);
      uint32_t v16 = "%13.5f: %@ pearlEventOccurred %s, current operation %p state %s";
      v17 = v7;
      uint32_t v18 = 52;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)v21, v18);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
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
          uint64_t v19 = getDeviceEventDescription(a4);
          v20 = self->_pendingPresenceOperation;
          LODWORD(v21[0]) = 136316674;
          *(void *)((char *)v21 + 4) = v10;
          WORD6(v21[0]) = 1024;
          *(_DWORD *)((char *)v21 + 14) = 428;
          WORD1(v21[1]) = 2048;
          *(double *)((char *)&v21[1] + 4) = v13;
          WORD6(v21[1]) = 2112;
          *(void *)((char *)&v21[1] + 14) = self;
          WORD3(v21[2]) = 2080;
          *((void *)&v21[2] + 1) = v19;
          LOWORD(v21[3]) = 2048;
          *(void *)((char *)&v21[3] + 2) = v20;
          WORD5(v21[3]) = 2080;
          *(void *)((char *)&v21[3] + 12) = getOperationStateDescription([(BKFaceDetectOperation *)v20 state]);
          uint32_t v16 = "%30s:%-4d: %13.5f: %@ pearlEventOccurred %s, current operation %p state %s";
          v17 = v7;
          uint32_t v18 = 68;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  LODWORD(v21[0]) = a4;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:3 data:v21 forOperation:self];
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = NSString;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  [(BKFaceDetectOperation *)pendingPresenceOperation timeout];
  v10 = objc_msgSend(v7, "stringWithFormat:", @"operation %p currentOperation %p (timeout %13.5f) finishedWithReason %s", v6, pendingPresenceOperation, v9, getEndReasonDescriptions(a4));
  if (currentLogLevel == 5)
  {
    v11 = _AALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v12 = absTimeNS();
      if (v12 == -1) {
        double v13 = INFINITY;
      }
      else {
        double v13 = (double)v12 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218498;
      *(double *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v10;
      uint32_t v18 = "%13.5f: %@ %@";
      uint64_t v19 = v11;
      uint32_t v20 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v11 = _AALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v14 = i;
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
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 410;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v17;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = self;
          *(_WORD *)&buf[38] = 2112;
          *(void *)&buf[40] = v10;
          uint32_t v18 = "%30s:%-4d: %13.5f: %@ %@";
          uint64_t v19 = v11;
          uint32_t v20 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  memset(buf, 0, sizeof(buf));
  *(_DWORD *)buf = a4;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:2 data:buf forOperation:self];
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  *(void *)&long long v49 = 0;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  int v8 = [v7 faceDetected];
  uint64_t v9 = [v7 pitch];
  v10 = [v7 yaw];
  v11 = [v7 roll];
  uint64_t v12 = [v7 orientation];
  if ((unint64_t)(v12 - 1) >= 4) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v12;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v57 = 0;
  if (currentLogLevel == 5)
  {
    v14 = _AALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = absTimeNS();
      v40 = v9;
      v44 = v10;
      if (v15 == -1) {
        double v16 = INFINITY;
      }
      else {
        double v16 = (double)v15 / 1000000000.0;
      }
      pendingPresenceOperation = self->_pendingPresenceOperation;
      if (v8) {
        long long v23 = "FACE FOUND";
      }
      else {
        long long v23 = "FACE NOT FOUND";
      }
      uint64_t v38 = getFaceDetectOrientationDescription(v13);
      [v7 attentionScore];
      long long v24 = v41 = v13;
      long long v25 = [v7 faceDetectionScore];
      *(_DWORD *)buf = 134220546;
      *(double *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v6;
      *(_WORD *)&buf[32] = 2048;
      *(void *)&buf[34] = pendingPresenceOperation;
      *(_WORD *)&buf[42] = 2080;
      *(void *)&buf[44] = v23;
      *(_WORD *)&buf[52] = 2112;
      uint64_t v9 = v40;
      *(void *)&buf[54] = v40;
      *(_WORD *)&buf[62] = 2112;
      v10 = v44;
      *(void *)&buf[64] = v44;
      *(_WORD *)&buf[72] = 2112;
      *(void *)&buf[74] = v11;
      *(_WORD *)&buf[82] = 2112;
      *(void *)&buf[84] = v38;
      *(_WORD *)&buf[92] = 2112;
      *(void *)&buf[94] = v24;
      *(_WORD *)&buf[102] = 2112;
      *(void *)&buf[104] = v25;
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %@ yaw: %@ roll: %@ orientation: %@ attentionScore: %@faceDetectionScore: %@", buf, 0x70u);

      unint64_t v13 = v41;
      long long v26 = (void *)v38;
LABEL_28:
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_30;
    }
    v14 = _AALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = (uint64_t)v6;
      double v17 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v17 = i;
        }
        else if (!*(i - 1))
        {
          v43 = v11;
          unint64_t v19 = absTimeNS();
          v45 = v10;
          uint32_t v20 = v9;
          if (v19 == -1) {
            double v21 = INFINITY;
          }
          else {
            double v21 = (double)v19 / 1000000000.0;
          }
          long long v27 = self->_pendingPresenceOperation;
          if (v8) {
            long long v28 = "FACE FOUND";
          }
          else {
            long long v28 = "FACE NOT FOUND";
          }
          getFaceDetectOrientationDescription(v13);
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          long long v29 = [v7 attentionScore];
          [v7 faceDetectionScore];
          uint64_t v30 = v42 = v13;
          *(_DWORD *)buf = 136318210;
          *(void *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 376;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v21;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = self;
          *(_WORD *)&buf[38] = 2048;
          id v6 = (id)v38;
          *(void *)&buf[40] = v38;
          *(_WORD *)&uint8_t buf[48] = 2048;
          *(void *)&buf[50] = v27;
          *(_WORD *)&buf[58] = 2080;
          *(void *)&buf[60] = v28;
          *(_WORD *)&buf[68] = 2112;
          uint64_t v9 = v20;
          *(void *)&buf[70] = v20;
          *(_WORD *)&buf[78] = 2112;
          v11 = v43;
          v10 = v45;
          *(void *)&buf[80] = v45;
          *(_WORD *)&buf[88] = 2112;
          *(void *)&buf[90] = v43;
          *(_WORD *)&buf[98] = 2112;
          *(void *)&buf[100] = log;
          *(_WORD *)&buf[108] = 2112;
          *(void *)&buf[110] = v29;
          *(_WORD *)&buf[118] = 2112;
          *(void *)&buf[120] = v30;
          _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %@ yaw: %@ roll: %@ orientation: %@ attentionScore: %@faceDetectionScore: %@", buf, 0x80u);

          unint64_t v13 = v42;
          long long v26 = log;
          goto LABEL_28;
        }
      }
    }
  }

LABEL_30:
  LOBYTE(v46) = v8;
  *((void *)&v49 + 1) = 1;
  if (v8)
  {
    [v9 doubleValue];
    *((void *)&v46 + 1) = v31;
    [v10 doubleValue];
    *(void *)&long long v47 = v32;
    [v11 doubleValue];
    *((void *)&v47 + 1) = v33;
    *(void *)&long long v48 = v13;
  }
  v34 = objc_msgSend(v7, "attentionScore", v38);
  [v34 floatValue];
  *((float *)&v54 + 2) = v35 / 10.0;

  v36 = [v7 faceDetectionScore];
  [v36 floatValue];
  HIDWORD(v54) = v37;

  memset_pattern16(&v50, &unk_1B3B87460, 0x40uLL);
  *(void *)&long long v54 = 0;
  long long v59 = v54;
  long long v60 = v55;
  long long v61 = v56;
  uint64_t v62 = v57;
  *(_OWORD *)&buf[64] = v50;
  *(_OWORD *)&buf[80] = v51;
  *(_OWORD *)&buf[96] = v52;
  *(_OWORD *)&buf[112] = v53;
  *(_OWORD *)buf = v46;
  *(_OWORD *)&buf[16] = v47;
  *(_OWORD *)&buf[32] = v48;
  *(_OWORD *)&uint8_t buf[48] = v49;
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:1 data:buf forOperation:self];
}

- (void)operation:(id)a3 motionDetectStateChanged:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v8 = _AALog();
  uint64_t v9 = _AALog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v8, OS_SIGNPOST_EVENT, v10, "AA: Motion detect success", (const char *)&unk_1B3B8868B, buf, 2u);
  }

  *(void *)buf = 1;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  memset(&buf[8], 0, 48);
  *(void *)&buf[56] = 3;
  memset((char *)v45 + 8, 0, 48);
  uint64_t v11 = [v7 motionDetectState];
  uint64_t v12 = 2 * (v11 == 2);
  if (v11 == 1) {
    uint64_t v12 = 1;
  }
  *(void *)&v45[0] = v12;
  if (v12)
  {
    memset_pattern16(&v41, &unk_1B3B87460, 0x40uLL);
    goto LABEL_12;
  }
  unint64_t v13 = [v7 motionMatrix];

  if (!v13)
  {
    if (currentLogLevel < 3) {
      goto LABEL_33;
    }
    uint64_t v32 = _AALog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_40:

      goto LABEL_33;
    }
    unint64_t v33 = absTimeNS();
    if (v33 == -1) {
      double v34 = INFINITY;
    }
    else {
      double v34 = (double)v33 / 1000000000.0;
    }
    *(_DWORD *)long long v46 = 134217984;
    double v47 = v34;
    int v37 = "%13.5f: MotionMatrix is nil";
LABEL_47:
    _os_log_error_impl(&dword_1B3B4B000, v32, OS_LOG_TYPE_ERROR, v37, v46, 0xCu);
    goto LABEL_40;
  }
  v14 = [v7 motionMatrix];
  uint64_t v15 = [v14 count];

  if (v15 != 16)
  {
    if (currentLogLevel < 3) {
      goto LABEL_33;
    }
    uint64_t v32 = _AALog();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    unint64_t v35 = absTimeNS();
    if (v35 == -1) {
      double v36 = INFINITY;
    }
    else {
      double v36 = (double)v35 / 1000000000.0;
    }
    *(_DWORD *)long long v46 = 134217984;
    double v47 = v36;
    int v37 = "%13.5f: Motion matrix is of invalid length, not sending this to client";
    goto LABEL_47;
  }
  for (uint64_t i = 0; i != 16; ++i)
  {
    double v17 = [v7 motionMatrix];
    uint32_t v18 = [v17 objectAtIndexedSubscript:i];

    [v18 floatValue];
    *((_DWORD *)&v41 + i) = v19;
  }
LABEL_12:
  if (currentLogLevel == 5)
  {
    uint32_t v20 = _AALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = absTimeNS();
      if (v21 == -1) {
        double v22 = INFINITY;
      }
      else {
        double v22 = (double)v21 / 1000000000.0;
      }
      pendingPresenceOperation = self->_pendingPresenceOperation;
      *(_DWORD *)long long v46 = 134220034;
      double v47 = v22;
      __int16 v48 = 2112;
      *(void *)long long v49 = self;
      *(_WORD *)&v49[8] = 2048;
      *(void *)&v49[10] = v6;
      *(void *)&v49[20] = pendingPresenceOperation;
      *(_WORD *)&v49[28] = 2080;
      *(_WORD *)&v49[18] = 2048;
      *(void *)&v49[30] = "FACE FOUND";
      *(_WORD *)&v49[38] = 2048;
      *(void *)&v49[40] = 0;
      *(_WORD *)&v49[48] = 2048;
      *(void *)&v49[50] = 0;
      *(_WORD *)&v49[58] = 2048;
      *(void *)&v49[60] = 0;
      *(_WORD *)&v49[68] = 2112;
      *(void *)&v49[70] = @"Unknown";
      long long v28 = "%13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %f yaw: %f roll: %f orientation: %@ ";
      long long v29 = v20;
      uint32_t v30 = 92;
LABEL_30:
      _os_log_impl(&dword_1B3B4B000, v29, OS_LOG_TYPE_DEFAULT, v28, v46, v30);
    }
LABEL_31:

    goto LABEL_32;
  }
  if (currentLogLevel >= 6)
  {
    uint32_t v20 = _AALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          long long v23 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v25 = absTimeNS();
          if (v25 == -1) {
            double v26 = INFINITY;
          }
          else {
            double v26 = (double)v25 / 1000000000.0;
          }
          uint64_t v31 = self->_pendingPresenceOperation;
          *(_DWORD *)long long v46 = 136317698;
          double v47 = *(double *)&v23;
          __int16 v48 = 1024;
          *(_DWORD *)long long v49 = 330;
          *(_WORD *)&v49[4] = 2048;
          *(double *)&v49[6] = v26;
          *(_WORD *)&v49[14] = 2112;
          *(void *)&v49[16] = self;
          *(_WORD *)&v49[24] = 2048;
          *(void *)&v49[26] = v6;
          *(void *)&v49[36] = v31;
          *(_WORD *)&v49[44] = 2080;
          *(_WORD *)&v49[34] = 2048;
          *(void *)&v49[46] = "FACE FOUND";
          *(_WORD *)&v49[54] = 2048;
          *(void *)&v49[56] = 0;
          *(_WORD *)&v49[64] = 2048;
          *(void *)&v49[66] = 0;
          *(_WORD *)&v49[74] = 2048;
          *(void *)&v49[76] = 0;
          __int16 v50 = 2112;
          long long v51 = @"Unknown";
          long long v28 = "%30s:%-4d: %13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %f yaw: %f roll:"
                " %f orientation: %@ ";
          long long v29 = v20;
          uint32_t v30 = 108;
          goto LABEL_30;
        }
      }
    }
    goto LABEL_31;
  }
LABEL_32:
  v38[8] = v45[0];
  v38[9] = v45[1];
  v38[10] = v45[2];
  uint64_t v39 = *(void *)&v45[3];
  v38[4] = v41;
  v38[5] = v42;
  v38[6] = v43;
  v38[7] = v44;
  v38[0] = *(_OWORD *)buf;
  v38[1] = *(_OWORD *)&buf[16];
  v38[2] = *(_OWORD *)&buf[32];
  v38[3] = *(_OWORD *)&buf[48];
  [(PearlCameraInterfaceMessaging *)self->_delegate cameraActivityNotification:1 data:v38 forOperation:self];
LABEL_33:
}

- (int)State
{
  return [(BKFaceDetectOperation *)self->_pendingPresenceOperation state];
}

- (double)Timeout
{
  return self->_timeout;
}

- (id)cancelActiveOperation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
      *(_DWORD *)buf = 134218242;
      double v25 = v7;
      __int16 v26 = 2112;
      *(void *)long long v27 = v4;
      uint64_t v12 = "%13.5f: cancelActiveOperation called with info %@";
      unint64_t v13 = v5;
      uint32_t v14 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          int v8 = i;
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
          *(_DWORD *)buf = 136315906;
          double v25 = *(double *)&v8;
          __int16 v26 = 1024;
          *(_DWORD *)long long v27 = 244;
          *(_WORD *)&v27[4] = 2048;
          *(double *)&v27[6] = v11;
          __int16 v28 = 2112;
          id v29 = v4;
          uint64_t v12 = "%30s:%-4d: %13.5f: cancelActiveOperation called with info %@";
          unint64_t v13 = v5;
          uint32_t v14 = 38;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  pendingPresenceOperation = self->_pendingPresenceOperation;
  if (pendingPresenceOperation)
  {
    double v16 = pendingPresenceOperation;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__BiokitOperation_cancelActiveOperation___block_invoke;
    block[3] = &unk_1E606A848;
    unint64_t v21 = v16;
    double v22 = self;
    id v23 = v4;
    double v17 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint32_t v18 = self->_pendingPresenceOperation;
    self->_pendingPresenceOperation = 0;
  }
  return 0;
}

void __41__BiokitOperation_cancelActiveOperation___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
      uint64_t v11 = *(void *)(a1 + 48);
      int v18 = 134218754;
      double v19 = v4;
      __int16 v20 = 2112;
      *(void *)unint64_t v21 = v9;
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = v10;
      *(_WORD *)&v21[18] = 2112;
      *(void *)&v21[20] = v11;
      uint64_t v12 = "%13.5f: %@ cancelled presence operation %p (%@)";
      unint64_t v13 = v2;
      uint32_t v14 = 42;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
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
      v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v5 = i;
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
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 48);
          int v18 = 136316418;
          double v19 = *(double *)&v5;
          __int16 v20 = 1024;
          *(_DWORD *)unint64_t v21 = 251;
          *(_WORD *)&v21[4] = 2048;
          *(double *)&v21[6] = v8;
          *(_WORD *)&v21[14] = 2112;
          *(void *)&v21[16] = v15;
          *(_WORD *)&v21[24] = 2048;
          *(void *)&v21[26] = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v17;
          uint64_t v12 = "%30s:%-4d: %13.5f: %@ cancelled presence operation %p (%@)";
          unint64_t v13 = v2;
          uint32_t v14 = 58;
          goto LABEL_19;
        }
      }
    }
  }
}

- (void)startPresenceDetectOperation:(id)a3
{
  id v4 = a3;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BiokitOperation_startPresenceDetectOperation___block_invoke;
  v7[3] = &unk_1E606A040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKFaceDetectOperation *)pendingPresenceOperation startWithReply:v7];
}

void __48__BiokitOperation_startPresenceDetectOperation___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = absTimeNS();
        if (v26 == -1) {
          double v27 = INFINITY;
        }
        else {
          double v27 = (double)v26 / 1000000000.0;
        }
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void *)(v28 + 32);
        *(_DWORD *)buf = 134218754;
        double v33 = v27;
        __int16 v34 = 2112;
        *(void *)unint64_t v35 = v28;
        *(_WORD *)&v35[8] = 2048;
        *(void *)&v35[10] = v29;
        *(_WORD *)&v35[18] = 2112;
        *(void *)&v35[20] = v5;
        _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to start presence operation %p: %@", buf, 0x2Au);
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = 0;

    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28798];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = @" Unable to start presence detect operation";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v14 = [v12 errorWithDomain:v13 code:3 userInfo:v6];

    id v5 = (id)v14;
LABEL_25:

    goto LABEL_26;
  }
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
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(v19 + 32);
      *(_DWORD *)buf = 134218498;
      double v33 = v8;
      __int16 v34 = 2112;
      *(void *)unint64_t v35 = v19;
      *(_WORD *)&v35[8] = 2048;
      *(void *)&v35[10] = v20;
      unint64_t v21 = "%13.5f: %@ presence operation %p successfully started";
      __int16 v22 = v6;
      uint32_t v23 = 32;
LABEL_24:
      _os_log_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
    goto LABEL_25;
  }
  if (currentLogLevel >= 6)
  {
    id v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          uint64_t v15 = i;
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
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v25 = *(void *)(v24 + 32);
          *(_DWORD *)buf = 136316162;
          double v33 = *(double *)&v15;
          __int16 v34 = 1024;
          *(_DWORD *)unint64_t v35 = 227;
          *(_WORD *)&v35[4] = 2048;
          *(double *)&v35[6] = v18;
          *(_WORD *)&v35[14] = 2112;
          *(void *)&v35[16] = v24;
          *(_WORD *)&v35[24] = 2048;
          *(void *)&v35[26] = v25;
          unint64_t v21 = "%30s:%-4d: %13.5f: %@ presence operation %p successfully started";
          __int16 v22 = v6;
          uint32_t v23 = 48;
          goto LABEL_24;
        }
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4
{
  unint64_t v4 = *(void *)&a4.var0;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  pearlDevice = self->_pearlDevice;
  id v35 = 0;
  double v8 = [(BKDevicePearl *)pearlDevice createPresenceDetectOperationWithError:&v35];
  id v9 = v35;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  self->_pendingPresenceOperation = v8;

  if (v9)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v14 = _AALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unint64_t v33 = absTimeNS();
        if (v33 == -1) {
          double v34 = INFINITY;
        }
        else {
          double v34 = (double)v33 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v37 = v34;
        __int16 v38 = 2112;
        *(void *)uint64_t v39 = v9;
        _os_log_error_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_ERROR, "%13.5f: Unable to create presence detect operation due to error: %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  [(BKFaceDetectOperation *)self->_pendingPresenceOperation setTimeout:a3];
  self->_double timeout = a3;
  [(BKFaceDetectOperation *)self->_pendingPresenceOperation setMotionDetect:(v4 >> 8) & 1];
  [(BKFaceDetectOperation *)self->_pendingPresenceOperation setDelegate:self];
  [(BKFaceDetectOperation *)self->_pendingPresenceOperation setQueue:self->_queue];
  if ([(BKFaceDetectOperation *)self->_pendingPresenceOperation motionDetect])
  {
    uint64_t v11 = _AALog();
    uint64_t v12 = _AALog();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v11, OS_SIGNPOST_EVENT, v13, "AA: Motion detect started", (const char *)&unk_1B3B8868B, buf, 2u);
    }
  }
  if (currentLogLevel == 5)
  {
    uint64_t v14 = _AALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = absTimeNS();
      if (v15 == -1) {
        double v16 = INFINITY;
      }
      else {
        double v16 = (double)v15 / 1000000000.0;
      }
      unint64_t v21 = self->_pendingPresenceOperation;
      double timeout = self->_timeout;
      uint32_t v23 = "ENABLED";
      if (v4) {
        uint64_t v24 = "ENABLED";
      }
      else {
        uint64_t v24 = "DISABLED";
      }
      *(_DWORD *)buf = 134219010;
      if ((v4 & 0x100) == 0) {
        uint32_t v23 = "DISABLED";
      }
      double v37 = v16;
      __int16 v38 = 2112;
      *(void *)uint64_t v39 = v21;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = timeout;
      *(_WORD *)&v39[18] = 2080;
      *(void *)&v39[20] = v24;
      *(_WORD *)&v39[28] = 2080;
      *(void *)&v39[30] = v23;
      uint64_t v25 = "%13.5f: Presence detect operation %@ created successfully with timeout: %f AttentionDetect: %s MotionDetect: %s";
      unint64_t v26 = v14;
      uint32_t v27 = 52;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v14 = _AALog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    unint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
    for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        unint64_t v17 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v19 = absTimeNS();
        if (v19 == -1) {
          double v20 = INFINITY;
        }
        else {
          double v20 = (double)v19 / 1000000000.0;
        }
        uint64_t v28 = self->_pendingPresenceOperation;
        double v29 = self->_timeout;
        uint64_t v30 = "ENABLED";
        if (v4) {
          uint64_t v31 = "ENABLED";
        }
        else {
          uint64_t v31 = "DISABLED";
        }
        *(_DWORD *)buf = 136316674;
        if ((v4 & 0x100) == 0) {
          uint64_t v30 = "DISABLED";
        }
        double v37 = *(double *)&v17;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = 215;
        *(_WORD *)&v39[4] = 2048;
        *(double *)&v39[6] = v20;
        *(_WORD *)&v39[14] = 2112;
        *(void *)&v39[16] = v28;
        *(_WORD *)&v39[24] = 2048;
        *(double *)&v39[26] = v29;
        *(_WORD *)&v39[34] = 2080;
        *(void *)&v39[36] = v31;
        __int16 v40 = 2080;
        long long v41 = v30;
        uint64_t v25 = "%30s:%-4d: %13.5f: Presence detect operation %@ created successfully with timeout: %f AttentionDetect: %s "
              "MotionDetect: %s";
        unint64_t v26 = v14;
        uint32_t v27 = 68;
LABEL_35:
        _os_log_impl(&dword_1B3B4B000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_36:

        break;
      }
    }
  }
LABEL_37:

  return v9;
}

- (BOOL)isOperationActive
{
  return self->_pendingPresenceOperation != 0;
}

- (void)setDelegate:(id)a3
{
}

- (BiokitOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BiokitOperation;
  double v8 = [(BiokitOperation *)&v25 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    if (v4)
    {
      uint64_t v10 = +[AWUnitTestPearlDevice sharedDevice];
    }
    else
    {
      if (getPearlDevice_onceToken_325 != -1) {
        dispatch_once(&getPearlDevice_onceToken_325, &__block_literal_global_326);
      }
      uint64_t v10 = (BKDevicePearl *)(id)getPearlDevice_result_327;
    }
    pearlDevice = v9->_pearlDevice;
    v9->_pearlDevice = v10;

    [(BKDevicePearl *)v9->_pearlDevice setQueue:v9->_queue];
    [(BKDevicePearl *)v9->_pearlDevice setDelegate:v9];
    v9->_double timeout = 0.0;
  }
  if (v4)
  {
    if (currentLogLevel == 5)
    {
      uint64_t v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = absTimeNS();
        if (v13 == -1) {
          double v14 = INFINITY;
        }
        else {
          double v14 = (double)v13 / 1000000000.0;
        }
        unint64_t v19 = v9->_pearlDevice;
        *(_DWORD *)buf = 134218242;
        double v27 = v14;
        __int16 v28 = 2112;
        *(void *)double v29 = v19;
        double v20 = "%13.5f: Unit test device %@ created";
        unint64_t v21 = v12;
        uint32_t v22 = 22;
LABEL_27:
        _os_log_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
LABEL_28:

      goto LABEL_29;
    }
    if (currentLogLevel >= 6)
    {
      uint64_t v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlBioKitInterface.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            unint64_t v15 = i;
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
            uint32_t v23 = v9->_pearlDevice;
            *(_DWORD *)buf = 136315906;
            double v27 = *(double *)&v15;
            __int16 v28 = 1024;
            *(_DWORD *)double v29 = 179;
            *(_WORD *)&v29[4] = 2048;
            *(double *)&v29[6] = v18;
            __int16 v30 = 2112;
            uint64_t v31 = v23;
            double v20 = "%30s:%-4d: %13.5f: Unit test device %@ created";
            unint64_t v21 = v12;
            uint32_t v22 = 38;
            goto LABEL_27;
          }
        }
      }
      goto LABEL_28;
    }
  }
LABEL_29:

  return v9;
}

@end