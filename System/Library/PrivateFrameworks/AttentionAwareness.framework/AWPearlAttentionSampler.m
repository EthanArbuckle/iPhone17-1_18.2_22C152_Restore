@interface AWPearlAttentionSampler
- (AWPearlAttentionSampler)initWithOptions:(id)a3;
- (id)createNewSamplingOperation;
- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4;
- (id)unitTestSampler;
- (int)currentState;
- (unint64_t)minimumAttentionSamplerErrorRetryTime;
- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4;
- (void)cameraActivityNotification:(int)a3 data:(id *)a4 forOperation:(id)a5;
- (void)cancelFaceDetect:(id)a3;
- (void)cancelStalledTimer;
- (void)faceDetectStalled:(id)a3;
- (void)finishingFaceDetect:(id)a3;
- (void)pearlAttentionSamplerErrorOccurred;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCurrentState:(int)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5;
- (void)startStalledTimerForOperation:(id)a3;
- (void)triggerFaceDetectWithDeadline:(unint64_t)a3 options:(id)a4;
- (void)updateFaceState:(int)a3;
- (void)updateFaceState:(int)a3 withFaceMetadata:(AWFaceDetectMetadata *)a4;
- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4;
- (void)updateSuppressedMaskWithDisplayState:(BOOL)a3 smartCoverClosed:(BOOL)a4 carPlayConnected:(BOOL)a5;
@end

@implementation AWPearlAttentionSampler

- (int)currentState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (!self->_displayState && !self->_currentOptions.AWAttentionSamplerActivateMotionDetection) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)AWPearlAttentionSampler;
  return [(AWAttentionSampler *)&v4 currentState];
}

- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5
{
  int v5 = *(_DWORD *)&a5.var0;
  BOOL v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (v7)
  {
    if (!currentOperation)
    {
      [(AWPearlAttentionSampler *)self triggerFaceDetectWithDeadline:a4 options:*(void *)&v5 & 0xFFFFFFLL];
    }
  }
  else if (currentOperation)
  {
    [(AWPearlAttentionSampler *)self cancelFaceDetect:@"!shouldSample"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationStalledTimer, 0);
  objc_storeStrong((id *)&self->_finishingOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);

  objc_storeStrong((id *)&self->_unitTestOperation, 0);
}

- (id)unitTestSampler
{
  return (id)[(SamplingOperation *)self->_unitTestOperation unitTestSampler];
}

- (void)cameraActivityNotification:(int)a3 data:(id *)a4 forOperation:(id)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v8 = (SamplingOperation *)a5;
  if (currentLogLevel == 5)
  {
    v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = absTimeNS();
      if (v10 == -1) {
        double v11 = INFINITY;
      }
      else {
        double v11 = (double)v10 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218240;
      double v83 = v11;
      __int16 v84 = 1024;
      *(_DWORD *)v85 = a3;
      v16 = "%13.5f: cameraActivityNotification %u received";
      v17 = v9;
      uint32_t v18 = 18;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v12 = i;
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
          double v83 = *(double *)&v12;
          __int16 v84 = 1024;
          *(_DWORD *)v85 = 714;
          *(_WORD *)&v85[4] = 2048;
          *(double *)&v85[6] = v15;
          *(_WORD *)&v85[14] = 1024;
          *(_DWORD *)&v85[16] = a3;
          v16 = "%30s:%-4d: %13.5f: cameraActivityNotification %u received";
          v17 = v9;
          uint32_t v18 = 34;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  switch(a3)
  {
    case 1:
      if (a4->var0.var0) {
        uint64_t v19 = 5;
      }
      else {
        uint64_t v19 = 4;
      }
      [(AWPearlAttentionSampler *)self updateFaceState:v19 withFaceMetadata:a4];
      goto LABEL_134;
    case 2:
      if (currentLogLevel == 5)
      {
        v20 = _AALog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v21 = absTimeNS();
          if (v21 == -1) {
            double v22 = INFINITY;
          }
          else {
            double v22 = (double)v21 / 1000000000.0;
          }
          int var1 = a4->var1;
          *(_DWORD *)buf = 134218240;
          double v83 = v22;
          __int16 v84 = 1024;
          *(_DWORD *)v85 = var1;
          v42 = "%13.5f: Operation end reason %d received";
          v43 = v20;
          uint32_t v44 = 18;
LABEL_76:
          _os_log_impl(&dword_1B3B4B000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
        }
      }
      else
      {
        if (currentLogLevel < 6) {
          goto LABEL_78;
        }
        v20 = _AALog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v29 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
          for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
                ;
                ++j)
          {
            if (*(j - 1) == 47)
            {
              v29 = j;
            }
            else if (!*(j - 1))
            {
              unint64_t v35 = absTimeNS();
              if (v35 == -1) {
                double v36 = INFINITY;
              }
              else {
                double v36 = (double)v35 / 1000000000.0;
              }
              int v53 = a4->var1;
              *(_DWORD *)buf = 136315906;
              double v83 = *(double *)&v29;
              __int16 v84 = 1024;
              *(_DWORD *)v85 = 726;
              *(_WORD *)&v85[4] = 2048;
              *(double *)&v85[6] = v36;
              *(_WORD *)&v85[14] = 1024;
              *(_DWORD *)&v85[16] = v53;
              v42 = "%30s:%-4d: %13.5f: Operation end reason %d received";
              v43 = v20;
              uint32_t v44 = 34;
              goto LABEL_76;
            }
          }
        }
      }

LABEL_78:
      if (self->_currentOperation == v8)
      {
        int v54 = a4->var1;
        if (a4->var1 == 4)
        {
          [(SamplingOperation *)v8 Timeout];
          if (v55 != 0.0) {
            [(AWAttentionSampler *)self setLastPollTimeoutTime:absTimeNS()];
          }
          int v54 = a4->var1;
        }
        if (v54 == 1)
        {
          cameraActivityNotification_data_forOperation__operationEndFailureCount = 0;
        }
        else if ((unint64_t)++cameraActivityNotification_data_forOperation__operationEndFailureCount < 6)
        {
          [(AWPearlAttentionSampler *)self updateFaceState:4];
        }
        else
        {
          cameraActivityNotification_data_forOperation__operationEndFailureCount = 0;
          [(AWPearlAttentionSampler *)self pearlAttentionSamplerErrorOccurred];
        }
        if (self->_useAVFoundation && a4->var1 == 3) {
          id v56 = (id)[(SamplingOperation *)self->_currentOperation cancelActiveOperation:@"Interruption cancellation"];
        }
        currentOperation = self->_currentOperation;
        self->_currentOperation = 0;

        [(AWPearlAttentionSampler *)self setCurrentState:0];
        v58 = NSString;
        v59 = self->_currentOperation;
        [(SamplingOperation *)v59 Timeout];
        v61 = objc_msgSend(v58, "stringWithFormat:", @"operation %p currentOperation %p (timeout %13.5f)", v8, v59, v60);
        v62 = [(AWAttentionSampler *)self stateChangedCallback];
        ((void (**)(void, void *))v62)[2](v62, v61);
      }
      finishingOperation = self->_finishingOperation;
      if (finishingOperation) {
        BOOL v64 = finishingOperation == v8;
      }
      else {
        BOOL v64 = 1;
      }
      if (v64) {
        goto LABEL_133;
      }
      if (currentLogLevel == 5)
      {
        v65 = _AALog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v66 = absTimeNS();
          if (v66 == -1) {
            double v67 = INFINITY;
          }
          else {
            double v67 = (double)v66 / 1000000000.0;
          }
          v77 = self->_finishingOperation;
          *(_DWORD *)buf = 134218754;
          double v83 = v67;
          __int16 v84 = 2112;
          *(void *)v85 = self;
          *(_WORD *)&v85[8] = 2048;
          *(void *)&v85[10] = v8;
          *(_WORD *)&v85[18] = 2048;
          *(void *)&v85[20] = v77;
          v78 = "%13.5f: %@ unexpected finish for operation %p, expecting operation %p";
          v79 = v65;
          uint32_t v80 = 42;
LABEL_131:
          _os_log_impl(&dword_1B3B4B000, v79, OS_LOG_TYPE_DEFAULT, v78, buf, v80);
        }
      }
      else
      {
        if (currentLogLevel < 6) {
          goto LABEL_133;
        }
        v65 = _AALog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v68 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
          for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
                ;
                ++k)
          {
            if (*(k - 1) == 47)
            {
              v68 = k;
            }
            else if (!*(k - 1))
            {
              unint64_t v70 = absTimeNS();
              if (v70 == -1) {
                double v71 = INFINITY;
              }
              else {
                double v71 = (double)v70 / 1000000000.0;
              }
              v81 = self->_finishingOperation;
              *(_DWORD *)buf = 136316418;
              double v83 = *(double *)&v68;
              __int16 v84 = 1024;
              *(_DWORD *)v85 = 777;
              *(_WORD *)&v85[4] = 2048;
              *(double *)&v85[6] = v71;
              *(_WORD *)&v85[14] = 2112;
              *(void *)&v85[16] = self;
              *(_WORD *)&v85[24] = 2048;
              *(void *)&v85[26] = v8;
              __int16 v86 = 2048;
              v87 = v81;
              v78 = "%30s:%-4d: %13.5f: %@ unexpected finish for operation %p, expecting operation %p";
              v79 = v65;
              uint32_t v80 = 58;
              goto LABEL_131;
            }
          }
        }
      }

      finishingOperation = self->_finishingOperation;
LABEL_133:
      self->_finishingOperation = 0;

      goto LABEL_134;
    case 3:
      if (currentLogLevel == 5)
      {
        v23 = _AALog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v24 = absTimeNS();
          if (v24 == -1) {
            double v25 = INFINITY;
          }
          else {
            double v25 = (double)v24 / 1000000000.0;
          }
          int v45 = a4->var1;
          *(_DWORD *)buf = 134218240;
          double v83 = v25;
          __int16 v84 = 1024;
          *(_DWORD *)v85 = v45;
          v46 = "%13.5f: Device event %d received";
          v47 = v23;
          uint32_t v48 = 18;
LABEL_112:
          _os_log_impl(&dword_1B3B4B000, v47, OS_LOG_TYPE_DEFAULT, v46, buf, v48);
        }
      }
      else
      {
        if (currentLogLevel < 6) {
          goto LABEL_114;
        }
        v23 = _AALog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v31 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
          for (m = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
                ;
                ++m)
          {
            if (*(m - 1) == 47)
            {
              v31 = m;
            }
            else if (!*(m - 1))
            {
              unint64_t v37 = absTimeNS();
              if (v37 == -1) {
                double v38 = INFINITY;
              }
              else {
                double v38 = (double)v37 / 1000000000.0;
              }
              int v72 = a4->var1;
              *(_DWORD *)buf = 136315906;
              double v83 = *(double *)&v31;
              __int16 v84 = 1024;
              *(_DWORD *)v85 = 785;
              *(_WORD *)&v85[4] = 2048;
              *(double *)&v85[6] = v38;
              *(_WORD *)&v85[14] = 1024;
              *(_DWORD *)&v85[16] = v72;
              v46 = "%30s:%-4d: %13.5f: Device event %d received";
              v47 = v23;
              uint32_t v48 = 34;
              goto LABEL_112;
            }
          }
        }
      }

LABEL_114:
      int v73 = a4->var1;
      if (a4->var1 == 4)
      {
        v74 = self;
        uint64_t v75 = 4;
      }
      else if (v73 == 3)
      {
        v74 = self;
        uint64_t v75 = 5;
      }
      else
      {
        if (v73 != 2) {
          goto LABEL_134;
        }
        v74 = self;
        uint64_t v75 = 3;
      }
      [(AWPearlAttentionSampler *)v74 updateFaceState:v75];
      goto LABEL_134;
    case 4:
      if (currentLogLevel == 5)
      {
        v26 = _AALog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v27 = absTimeNS();
          if (v27 == -1) {
            double v28 = INFINITY;
          }
          else {
            double v28 = (double)v27 / 1000000000.0;
          }
          int v49 = a4->var1;
          *(_DWORD *)buf = 134218240;
          double v83 = v28;
          __int16 v84 = 1024;
          *(_DWORD *)v85 = v49;
          v50 = "%13.5f: Device state %d received";
          v51 = v26;
          uint32_t v52 = 18;
LABEL_123:
          _os_log_impl(&dword_1B3B4B000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);
        }
      }
      else
      {
        if (currentLogLevel < 6) {
          goto LABEL_125;
        }
        v26 = _AALog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v33 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
          for (n = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
                ;
                ++n)
          {
            if (*(n - 1) == 47)
            {
              v33 = n;
            }
            else if (!*(n - 1))
            {
              unint64_t v39 = absTimeNS();
              if (v39 == -1) {
                double v40 = INFINITY;
              }
              else {
                double v40 = (double)v39 / 1000000000.0;
              }
              int v76 = a4->var1;
              *(_DWORD *)buf = 136315906;
              double v83 = *(double *)&v33;
              __int16 v84 = 1024;
              *(_DWORD *)v85 = 807;
              *(_WORD *)&v85[4] = 2048;
              *(double *)&v85[6] = v40;
              *(_WORD *)&v85[14] = 1024;
              *(_DWORD *)&v85[16] = v76;
              v50 = "%30s:%-4d: %13.5f: Device state %d received";
              v51 = v26;
              uint32_t v52 = 34;
              goto LABEL_123;
            }
          }
        }
      }

LABEL_125:
      if (a4->var1 == 5) {
        [(AWPearlAttentionSampler *)self pearlAttentionSamplerErrorOccurred];
      }
LABEL_134:

      return;
    default:
      goto LABEL_134;
  }
}

- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (!self->_displayState && ([v6 activateMotionDetect] & 1) == 0)
  {
    if (currentLogLevel == 5)
    {
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = absTimeNS();
        if (v8 == -1) {
          double v9 = INFINITY;
        }
        else {
          double v9 = (double)v8 / 1000000000.0;
        }
        if (a3 == -1) {
          double v14 = INFINITY;
        }
        else {
          double v14 = (double)a3 / 1000000000.0;
        }
        double v15 = [v6 identifier];
        *(_DWORD *)buf = 134218754;
        double v22 = v9;
        __int16 v23 = 2112;
        *(void *)unint64_t v24 = self;
        *(_WORD *)&v24[8] = 2048;
        *(double *)&v24[10] = v14;
        *(_WORD *)&v24[18] = 2112;
        *(void *)&v24[20] = v15;
        v16 = "%13.5f: %@ ignoring sample with deadline %13.5f for client %@ since sampling is disabled";
        v17 = v7;
        uint32_t v18 = 42;
LABEL_29:
        _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      if (currentLogLevel < 6) {
        goto LABEL_4;
      }
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            unint64_t v10 = i;
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
            if (a3 == -1) {
              double v19 = INFINITY;
            }
            else {
              double v19 = (double)a3 / 1000000000.0;
            }
            double v15 = [v6 identifier];
            *(_DWORD *)buf = 136316418;
            double v22 = *(double *)&v10;
            __int16 v23 = 1024;
            *(_DWORD *)unint64_t v24 = 706;
            *(_WORD *)&v24[4] = 2048;
            *(double *)&v24[6] = v13;
            *(_WORD *)&v24[14] = 2112;
            *(void *)&v24[16] = self;
            *(_WORD *)&v24[24] = 2048;
            *(double *)&v24[26] = v19;
            __int16 v25 = 2112;
            v26 = v15;
            v16 = "%30s:%-4d: %13.5f: %@ ignoring sample with deadline %13.5f for client %@ since sampling is disabled";
            v17 = v7;
            uint32_t v18 = 58;
            goto LABEL_29;
          }
        }
      }
    }

    goto LABEL_4;
  }
  v20.receiver = self;
  v20.super_class = (Class)AWPearlAttentionSampler;
  [(AWAttentionSampler *)&v20 updateSamplingDeadline:a3 forClient:v6];
LABEL_4:
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_smartCoverClosed != v3)
  {
    self->_smartCoverClosed = v3;
    [(AWPearlAttentionSampler *)self updateSuppressedMaskWithDisplayState:self->_displayState smartCoverClosed:v3 carPlayConnected:self->_carPlayConnected];
    int v5 = "open";
    if (v3) {
      int v5 = "closed";
    }
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"smart cover %s", v5);
    if (currentLogLevel == 5)
    {
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = absTimeNS();
        if (v8 == -1) {
          double v9 = INFINITY;
        }
        else {
          double v9 = (double)v8 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218498;
        double v19 = v9;
        __int16 v20 = 2112;
        *(void *)unint64_t v21 = self;
        *(_WORD *)&v21[8] = 2112;
        *(void *)&v21[10] = v6;
        double v14 = "%13.5f: %@ %@";
        double v15 = v7;
        uint32_t v16 = 32;
LABEL_22:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_24:
        v17 = [(AWAttentionSampler *)self stateChangedCallback];
        ((void (**)(void, void *))v17)[2](v17, v6);

        return;
      }
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            unint64_t v10 = i;
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
            *(_DWORD *)buf = 136316162;
            double v19 = *(double *)&v10;
            __int16 v20 = 1024;
            *(_DWORD *)unint64_t v21 = 674;
            *(_WORD *)&v21[4] = 2048;
            *(double *)&v21[6] = v13;
            *(_WORD *)&v21[14] = 2112;
            *(void *)&v21[16] = self;
            __int16 v22 = 2112;
            __int16 v23 = v6;
            double v14 = "%30s:%-4d: %13.5f: %@ %@";
            double v15 = v7;
            uint32_t v16 = 48;
            goto LABEL_22;
          }
        }
      }
    }

    goto LABEL_24;
  }
}

- (void)setDisplayState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_displayState == v3) {
    return;
  }
  self->_displayState = v3;
  [(AWPearlAttentionSampler *)self updateSuppressedMaskWithDisplayState:v3 smartCoverClosed:self->_smartCoverClosed carPlayConnected:self->_carPlayConnected];
  int v5 = "off";
  if (v3) {
    int v5 = "on";
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"setDisplayState %s", v5);
  if (currentLogLevel == 5)
  {
    BOOL v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218498;
      double v19 = v9;
      __int16 v20 = 2112;
      *(void *)unint64_t v21 = self;
      *(_WORD *)&v21[8] = 2112;
      *(void *)&v21[10] = v6;
      double v14 = "%13.5f: %@ %@";
      double v15 = v7;
      uint32_t v16 = 32;
LABEL_22:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    BOOL v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v10 = i;
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
          *(_DWORD *)buf = 136316162;
          double v19 = *(double *)&v10;
          __int16 v20 = 1024;
          *(_DWORD *)unint64_t v21 = 652;
          *(_WORD *)&v21[4] = 2048;
          *(double *)&v21[6] = v13;
          *(_WORD *)&v21[14] = 2112;
          *(void *)&v21[16] = self;
          __int16 v22 = 2112;
          __int16 v23 = v6;
          double v14 = "%30s:%-4d: %13.5f: %@ %@";
          double v15 = v7;
          uint32_t v16 = 48;
          goto LABEL_22;
        }
      }
    }
    goto LABEL_23;
  }
LABEL_24:
  if (self->_displayState) {
    [(AWAttentionSampler *)self setLastPollTimeoutTime:absTimeNS()];
  }
  v17 = [(AWAttentionSampler *)self stateChangedCallback];
  ((void (**)(void, void *))v17)[2](v17, v6);
}

- (void)setCarPlayConnected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_carPlayConnected != v3)
  {
    self->_carPlayConnected = v3;
    [(AWPearlAttentionSampler *)self updateSuppressedMaskWithDisplayState:self->_displayState smartCoverClosed:self->_smartCoverClosed carPlayConnected:v3];
    int v5 = "Disconnected from";
    if (v3) {
      int v5 = "Connected to";
    }
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s CarPlay", v5);
    if (currentLogLevel == 5)
    {
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = absTimeNS();
        if (v8 == -1) {
          double v9 = INFINITY;
        }
        else {
          double v9 = (double)v8 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218498;
        double v19 = v9;
        __int16 v20 = 2112;
        *(void *)unint64_t v21 = self;
        *(_WORD *)&v21[8] = 2112;
        *(void *)&v21[10] = v6;
        double v14 = "%13.5f: %@ %@";
        double v15 = v7;
        uint32_t v16 = 32;
LABEL_22:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_24:
        v17 = [(AWAttentionSampler *)self stateChangedCallback];
        ((void (**)(void, void *))v17)[2](v17, v6);

        return;
      }
      BOOL v7 = _AALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            unint64_t v10 = i;
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
            *(_DWORD *)buf = 136316162;
            double v19 = *(double *)&v10;
            __int16 v20 = 1024;
            *(_DWORD *)unint64_t v21 = 636;
            *(_WORD *)&v21[4] = 2048;
            *(double *)&v21[6] = v13;
            *(_WORD *)&v21[14] = 2112;
            *(void *)&v21[16] = self;
            __int16 v22 = 2112;
            __int16 v23 = v6;
            double v14 = "%30s:%-4d: %13.5f: %@ %@";
            double v15 = v7;
            uint32_t v16 = 48;
            goto LABEL_22;
          }
        }
      }
    }

    goto LABEL_24;
  }
}

- (void)updateSuppressedMaskWithDisplayState:(BOOL)a3 smartCoverClosed:(BOOL)a4 carPlayConnected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  unint64_t v9 = [(AWAttentionSampler *)self samplingSuppressedMask] & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v10 = 4;
  if (!v5) {
    uint64_t v10 = 0;
  }
  [(AWAttentionSampler *)self setSamplingSuppressedMask:v9 | v10];
  unint64_t v11 = [(AWAttentionSampler *)self samplingSuppressedMask] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v12 = 2;
  if (!v6) {
    uint64_t v12 = 0;
  }
  [(AWAttentionSampler *)self setSamplingSuppressedMask:v11 | v12];
  unint64_t v13 = [(AWAttentionSampler *)self samplingSuppressedMask] & 0xFFFFFFFFFFFFFFFELL | !v7;

  [(AWAttentionSampler *)self setSamplingSuppressedMask:v13];
}

- (void)cancelStalledTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  operationStalledTimer = self->_operationStalledTimer;
  if (operationStalledTimer)
  {
    dispatch_source_cancel(operationStalledTimer);
    objc_super v4 = self->_operationStalledTimer;
    self->_operationStalledTimer = 0;
  }
}

- (void)startStalledTimerForOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (!self->_operationStalledTimer)
  {
    BOOL v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->super._queue);
    operationStalledTimer = self->_operationStalledTimer;
    self->_operationStalledTimer = v5;

    BOOL v7 = self->_operationStalledTimer;
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    unint64_t v9 = self->_operationStalledTimer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__AWPearlAttentionSampler_startStalledTimerForOperation___block_invoke;
    v10[3] = &unk_1E606AC98;
    v10[4] = self;
    id v11 = v4;
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_operationStalledTimer);
  }
}

uint64_t __57__AWPearlAttentionSampler_startStalledTimerForOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) faceDetectStalled:*(void *)(a1 + 40)];
}

- (unint64_t)minimumAttentionSamplerErrorRetryTime
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  unint64_t lastErrorTime = self->_lastErrorTime;
  unint64_t v4 = lastErrorTime + 1000000000;
  if (lastErrorTime + 1000000000 >= 0xFFFFFFFFFFFFFFFELL) {
    unint64_t v4 = -2;
  }
  if (lastErrorTime < 0xFFFFFFFFC4653600) {
    return v4;
  }
  else {
    return -2;
  }
}

- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (([(AWAttentionSampler *)self samplingSuppressedMask] & 1) != 0 && !v4) {
    return -1;
  }
  unint64_t v8 = [(AWAttentionSampler *)self lastTriggerTime];
  unint64_t v9 = [(AWAttentionSampler *)self lastPollTimeoutTime];
  if (v8 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  uint64_t v11 = v10 + a3;
  if (v10 + a3 >= 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v11 = -2;
  }
  if (__CFADD__(v10, a3)) {
    unint64_t v12 = -2;
  }
  else {
    unint64_t v12 = v11;
  }
  unint64_t v13 = [(AWPearlAttentionSampler *)self minimumAttentionSamplerErrorRetryTime];
  if (currentLogLevel < 7) {
    goto LABEL_31;
  }
  double v14 = _AALog();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_30;
  }
  double v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
        *(i - 1) == 47;
        ++i)
  {
    double v15 = i;
LABEL_19:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_19;
  }
  unint64_t v17 = absTimeNS();
  if (v17 == -1) {
    double v18 = INFINITY;
  }
  else {
    double v18 = (double)v17 / 1000000000.0;
  }
  if (v10 == -1) {
    double v19 = INFINITY;
  }
  else {
    double v19 = (double)v10 / 1000000000.0;
  }
  if (v13 == -1) {
    double v20 = INFINITY;
  }
  else {
    double v20 = (double)v13 / 1000000000.0;
  }
  int v21 = 136316674;
  __int16 v22 = v15;
  __int16 v23 = 1024;
  int v24 = 570;
  __int16 v25 = 2048;
  double v26 = v18;
  __int16 v27 = 2112;
  double v28 = self;
  __int16 v29 = 2048;
  double v30 = v19;
  __int16 v31 = 2048;
  double v32 = (double)v12 / 1000000000.0;
  __int16 v33 = 2048;
  double v34 = v20;
  _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ lastTriggerTime %13.5f nextTriggerTime %13.5f minErrorRetryTime %13.5f", (uint8_t *)&v21, 0x44u);
LABEL_30:

LABEL_31:
  if (v12 <= v13) {
    return v13;
  }
  else {
    return v12;
  }
}

- (void)setCurrentState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if ([(AWPearlAttentionSampler *)self currentState] != v3)
  {
    BOOL v5 = 1;
    switch([(AWPearlAttentionSampler *)self currentState])
    {
      case 0:
        BOOL v7 = v3 == 4;
        goto LABEL_9;
      case 1:
      case 2:
        goto LABEL_12;
      case 3:
        BOOL v7 = v3 == 2;
LABEL_9:
        BOOL v5 = !v7;
        goto LABEL_12;
      case 4:
      case 5:
        BOOL v5 = v3 == 0;
        goto LABEL_12;
      default:
        if (currentLogLevel < 3) {
          return;
        }
        BOOL v6 = _AALog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          unint64_t v24 = absTimeNS();
          if (v24 == -1) {
            double v25 = INFINITY;
          }
          else {
            double v25 = (double)v24 / 1000000000.0;
          }
          *(_DWORD *)buf = 134218240;
          double v28 = v25;
          __int16 v29 = 1024;
          *(_DWORD *)double v30 = [(AWPearlAttentionSampler *)self currentState];
          _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, "%13.5f: unknown AWAttentionSamplerState %d", buf, 0x12u);
        }

        BOOL v5 = 0;
LABEL_12:
        if (currentLogLevel == 5)
        {
          unint64_t v8 = _AALog();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          unint64_t v9 = absTimeNS();
          if (v9 == -1) {
            double v10 = INFINITY;
          }
          else {
            double v10 = (double)v9 / 1000000000.0;
          }
          if (v5) {
            double v15 = "completing";
          }
          else {
            double v15 = "ignoring invalid";
          }
          AttentionSamplerStateDescription = getAttentionSamplerStateDescription([(AWPearlAttentionSampler *)self currentState]);
          unint64_t v17 = getAttentionSamplerStateDescription(v3);
          *(_DWORD *)buf = 134219010;
          double v28 = v10;
          __int16 v29 = 2112;
          *(void *)double v30 = self;
          *(_WORD *)&v30[8] = 2080;
          *(void *)&v30[10] = v15;
          *(_WORD *)&v30[18] = 2080;
          *(void *)&v30[20] = AttentionSamplerStateDescription;
          *(_WORD *)&v30[28] = 2080;
          *(void *)&v30[30] = v17;
          double v18 = "%13.5f: %@ %s AWAttentionSamplerState transition (%s -> %s)";
          double v19 = v8;
          uint32_t v20 = 52;
          goto LABEL_38;
        }
        if (currentLogLevel < 6)
        {
          if (!v5) {
            return;
          }
          goto LABEL_40;
        }
        unint64_t v8 = _AALog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
          for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
                ;
                ++i)
          {
            if (*(i - 1) == 47)
            {
              uint64_t v11 = i;
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
              if (v5) {
                int v21 = "completing";
              }
              else {
                int v21 = "ignoring invalid";
              }
              __int16 v22 = getAttentionSamplerStateDescription([(AWPearlAttentionSampler *)self currentState]);
              __int16 v23 = getAttentionSamplerStateDescription(v3);
              *(_DWORD *)buf = 136316674;
              double v28 = *(double *)&v11;
              __int16 v29 = 1024;
              *(_DWORD *)double v30 = 545;
              *(_WORD *)&v30[4] = 2048;
              *(double *)&v30[6] = v14;
              *(_WORD *)&v30[14] = 2112;
              *(void *)&v30[16] = self;
              *(_WORD *)&v30[24] = 2080;
              *(void *)&v30[26] = v21;
              *(_WORD *)&v30[34] = 2080;
              *(void *)&v30[36] = v22;
              __int16 v31 = 2080;
              double v32 = v23;
              double v18 = "%30s:%-4d: %13.5f: %@ %s AWAttentionSamplerState transition (%s -> %s)";
              double v19 = v8;
              uint32_t v20 = 68;
LABEL_38:
              _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
              break;
            }
          }
        }
LABEL_39:

        if (!v5) {
          return;
        }
LABEL_40:
        v26.receiver = self;
        v26.super_class = (Class)AWPearlAttentionSampler;
        [(AWAttentionSampler *)&v26 setCurrentState:v3];
        break;
    }
  }
}

- (void)pearlAttentionSamplerErrorOccurred
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  self->_unint64_t lastErrorTime = absTimeNS();
  [(AWPearlAttentionSampler *)self setCurrentState:1];
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
      *(_DWORD *)double v14 = 134218498;
      *(double *)&v14[4] = v5;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = self;
      *(_WORD *)&v14[22] = 2112;
      *(void *)&v14[24] = @"Pearl attention sampler error!";
      double v10 = "%13.5f: %@ %@";
      uint64_t v11 = v3;
      uint32_t v12 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v14, v12);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          BOOL v6 = i;
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
          *(_DWORD *)double v14 = 136316162;
          *(void *)&v14[4] = v6;
          *(_WORD *)&v14[12] = 1024;
          *(_DWORD *)&v14[14] = 488;
          *(_WORD *)&v14[18] = 2048;
          *(double *)&v14[20] = v9;
          *(_WORD *)&v14[28] = 2112;
          *(void *)&v14[30] = self;
          *(_WORD *)&v14[38] = 2112;
          double v15 = @"Pearl attention sampler error!";
          double v10 = "%30s:%-4d: %13.5f: %@ %@";
          uint64_t v11 = v3;
          uint32_t v12 = 48;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v13 = [(AWAttentionSampler *)self stateChangedCallback];
  ((void (**)(void, __CFString *))v13)[2](v13, @"Pearl attention sampler error!");
}

- (void)updateFaceState:(int)a3 withFaceMetadata:(AWFaceDetectMetadata *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if ((v5 - 3) >= 3) {
    __assert_rtn("-[AWPearlAttentionSampler updateFaceState:withFaceMetadata:]", "PearlAttentionSampler.m", 347, "(state == AWAttentionSamplerStateInitialized) || (state == AWAttentionSamplerStateAbsent) || (state == AWAttentionSamplerStatePresent)");
  }
  unint64_t v7 = absTimeNS();
  unint64_t v8 = "FACE FOUND";
  if (v5 != 5) {
    unint64_t v8 = "FACE NOT FOUND";
  }
  if (v7 == -1) {
    double v9 = INFINITY;
  }
  else {
    double v9 = (double)v7 / 1000000000.0;
  }
  double v10 = objc_msgSend(NSString, "stringWithFormat:", @"updateFaceState:withFaceMetadata: %s at %13.5f", v8, *(void *)&v9);
  if (currentLogLevel == 5)
  {
    uint64_t v11 = _AALog();
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
      double v46 = v13;
      __int16 v47 = 2112;
      *(void *)uint32_t v48 = self;
      *(_WORD *)&v48[8] = 2112;
      *(void *)&v48[10] = v10;
      double v18 = "%13.5f: %@ %@";
      double v19 = v11;
      uint32_t v20 = 32;
LABEL_25:
      _os_log_impl(&dword_1B3B4B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_27;
    }
    uint64_t v11 = _AALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v14 = i;
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
          double v46 = *(double *)&v14;
          __int16 v47 = 1024;
          *(_DWORD *)uint32_t v48 = 354;
          *(_WORD *)&v48[4] = 2048;
          *(double *)&v48[6] = v17;
          *(_WORD *)&v48[14] = 2112;
          *(void *)&v48[16] = self;
          __int16 v49 = 2112;
          v50 = v10;
          double v18 = "%30s:%-4d: %13.5f: %@ %@";
          double v19 = v11;
          uint32_t v20 = 48;
          goto LABEL_25;
        }
      }
    }
  }

LABEL_27:
  [(AWPearlAttentionSampler *)self cancelStalledTimer];
  [(AWAttentionSampler *)self setLastTriggerTime:self->_operationCreateTime];
  if (v5 != 5) {
    goto LABEL_68;
  }
  [(AWAttentionSampler *)self setLastPositiveDetectTime:v7];
  if (a4)
  {
    if (!self->_signpostLogged)
    {
      int v21 = _AALog();
      __int16 v22 = _AALog();
      os_signpost_id_t v23 = os_signpost_id_generate(v22);

      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v21, OS_SIGNPOST_EVENT, v23, "AA: Face detect success", (const char *)&unk_1B3B8868B, buf, 2u);
      }

      self->_signpostLogged = 1;
    }
    [(AWAttentionSampler *)self setLastFaceMetadataValid:a4->var0];
    [(AWAttentionSampler *)self setLastPitch:a4->var1];
    [(AWAttentionSampler *)self setLastYaw:a4->var2];
    [(AWAttentionSampler *)self setLastRoll:a4->var3];
    [(AWAttentionSampler *)self setLastOrientation:a4->var4];
    [(AWAttentionSampler *)self setLastDistance:a4->var5];
    [(AWAttentionSampler *)self setLastMetadataType:a4->var7];
    unint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:16];
    [(AWAttentionSampler *)self setLastMotionData:v24];

    for (uint64_t j = 0; j != 16; ++j)
    {
      *(float *)&double v25 = a4->var8[j];
      __int16 v27 = [NSNumber numberWithFloat:v25];
      double v28 = [(AWAttentionSampler *)self lastMotionData];
      [v28 setObject:v27 atIndexedSubscript:j];
    }
    [(AWAttentionSampler *)self setLastMotionResult:a4->var9];
    *(float *)&double v29 = a4->var10;
    [(AWAttentionSampler *)self setLastAttentionScore:v29];
    *(float *)&double v30 = a4->var11;
    [(AWAttentionSampler *)self setLastFaceDetectionScore:v30];
    -[AWAttentionSampler setLastFaceBounds:](self, "setLastFaceBounds:", a4->var13.origin.x, a4->var13.origin.y, a4->var13.size.width, a4->var13.size.height);
    [(AWAttentionSampler *)self setLastPersonID:a4->var12];
  }
  if (self->_currentOperation)
  {
    __int16 v31 = [(AWAttentionSampler *)self sampleLogger];
    [v31 sampleSucceeded];
  }
  if (!a4)
  {
LABEL_68:
    if (!self->_signpostLogged)
    {
      double v32 = _AALog();
      uint64_t v33 = _AALog();
      os_signpost_id_t v34 = os_signpost_id_generate(v33);

      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v32, OS_SIGNPOST_EVENT, v34, "AA: Face detect failed", (const char *)&unk_1B3B8868B, buf, 2u);
      }

      self->_signpostLogged = 1;
    }
    [(AWAttentionSampler *)self setLastFaceMetadataValid:0];
    [(AWAttentionSampler *)self setLastPitch:0.0];
    [(AWAttentionSampler *)self setLastYaw:0.0];
    [(AWAttentionSampler *)self setLastRoll:0.0];
    [(AWAttentionSampler *)self setLastOrientation:0];
    [(AWAttentionSampler *)self setLastDistance:0.0];
    [(AWAttentionSampler *)self setLastMetadataType:0];
    [(AWAttentionSampler *)self setLastMotionResult:0];
    [(AWAttentionSampler *)self setLastAttentionScore:0.0];
    [(AWAttentionSampler *)self setLastFaceDetectionScore:0.0];
    for (uint64_t k = 0; k != 16; ++k)
    {
      LODWORD(v35) = 2143289344;
      unint64_t v37 = [NSNumber numberWithFloat:v35];
      double v38 = [(AWAttentionSampler *)self lastMotionData];
      [v38 setObject:v37 atIndexedSubscript:k];
    }
    [(AWAttentionSampler *)self setLastPersonID:0];
    -[AWAttentionSampler setLastFaceBounds:](self, "setLastFaceBounds:", 0.0, 0.0, 0.0, 0.0);
    if (v5 != 5)
    {
      [(SamplingOperation *)self->_currentOperation Timeout];
      if (v40 != 0.0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  unint64_t v39 = [(AWAttentionSampler *)self operationEndableCallback];
  if (v39[2]())
  {

LABEL_54:
    [(AWPearlAttentionSampler *)self finishingFaceDetect:v10];
    goto LABEL_55;
  }
  int v41 = [(SamplingOperation *)self->_currentOperation operationBackend];

  if (v41 != 1) {
    goto LABEL_54;
  }
  [(AWPearlAttentionSampler *)self setCurrentState:0];
LABEL_55:
  [(AWPearlAttentionSampler *)self setCurrentState:v5];
  v42 = [(AWAttentionSampler *)self stateChangedCallback];
  ((void (**)(void, void *))v42)[2](v42, v10);

  if ([(AWPearlAttentionSampler *)self currentState] != 2)
  {
    if ([(AWPearlAttentionSampler *)self currentState] != 3
      && [(AWPearlAttentionSampler *)self currentState] != 4
      || [(SamplingOperation *)self->_currentOperation State] != 2
      || ([(SamplingOperation *)self->_currentOperation Timeout], v43 == 0.0))
    {
      if ([(AWPearlAttentionSampler *)self currentState] != 3
        || self->_currentOperation
        || self->_finishingOperation)
      {
        [(AWPearlAttentionSampler *)self setCurrentState:0];
        uint32_t v44 = [(AWAttentionSampler *)self stateChangedCallback];
        ((void (**)(void, void *))v44)[2](v44, v10);
      }
    }
  }
}

- (void)updateFaceState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);

  [(AWPearlAttentionSampler *)self updateFaceState:v3 withFaceMetadata:0];
}

- (void)cancelFaceDetect:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (currentOperation)
  {
    id v5 = (id)[(SamplingOperation *)currentOperation cancelActiveOperation:v7];
    BOOL v6 = self->_currentOperation;
    self->_currentOperation = 0;

    [(AWPearlAttentionSampler *)self setCurrentState:0];
    [(AWPearlAttentionSampler *)self cancelStalledTimer];
  }
}

- (void)finishingFaceDetect:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (!currentOperation) {
    goto LABEL_24;
  }
  if (currentLogLevel == 5)
  {
    BOOL v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      double v13 = self->_currentOperation;
      int v20 = 134218754;
      double v21 = v8;
      __int16 v22 = 2112;
      *(void *)os_signpost_id_t v23 = self;
      *(_WORD *)&v23[8] = 2048;
      *(void *)&v23[10] = v13;
      *(_WORD *)&v23[18] = 2112;
      *(void *)&v23[20] = v4;
      double v14 = "%13.5f: %@ finishing presence operation %p (%@)";
      double v15 = v6;
      uint32_t v16 = 42;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_22;
    }
    BOOL v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
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
          double v17 = self->_currentOperation;
          int v20 = 136316418;
          double v21 = *(double *)&v9;
          __int16 v22 = 1024;
          *(_DWORD *)os_signpost_id_t v23 = 283;
          *(_WORD *)&v23[4] = 2048;
          *(double *)&v23[6] = v12;
          *(_WORD *)&v23[14] = 2112;
          *(void *)&v23[16] = self;
          *(_WORD *)&v23[24] = 2048;
          *(void *)&v23[26] = v17;
          __int16 v24 = 2112;
          id v25 = v4;
          double v14 = "%30s:%-4d: %13.5f: %@ finishing presence operation %p (%@)";
          double v15 = v6;
          uint32_t v16 = 58;
          goto LABEL_20;
        }
      }
    }
  }

  currentOperation = self->_currentOperation;
LABEL_22:
  objc_storeStrong((id *)&self->_finishingOperation, currentOperation);
  double v18 = self->_currentOperation;
  self->_currentOperation = 0;

  if ([(SamplingOperation *)self->_finishingOperation operationBackend] == 2) {
    id v19 = (id)[(SamplingOperation *)self->_finishingOperation cancelActiveOperation:@"Finish"];
  }
LABEL_24:
}

- (void)faceDetectStalled:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (SamplingOperation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"operation %p currentOperation %p faceDetectStalled", v4, self->_currentOperation);
  if (currentLogLevel == 5)
  {
    BOOL v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218498;
      double v23 = v8;
      __int16 v24 = 2112;
      *(void *)id v25 = self;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v5;
      double v13 = "%13.5f: %@ %@";
      double v14 = v6;
      uint32_t v15 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    BOOL v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
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
          *(_DWORD *)buf = 136316162;
          double v23 = *(double *)&v9;
          __int16 v24 = 1024;
          *(_DWORD *)id v25 = 256;
          *(_WORD *)&v25[4] = 2048;
          *(double *)&v25[6] = v12;
          *(_WORD *)&v25[14] = 2112;
          *(void *)&v25[16] = self;
          __int16 v26 = 2112;
          __int16 v27 = v5;
          double v13 = "%30s:%-4d: %13.5f: %@ %@";
          double v14 = v6;
          uint32_t v15 = 48;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  if (self->_currentOperation == v4)
  {
    [(AWPearlAttentionSampler *)self updateFaceState:4];
    [(AWPearlAttentionSampler *)self cancelFaceDetect:v5];
    double v17 = [(AWAttentionSampler *)self stateChangedCallback];
    ((void (**)(void, void *))v17)[2](v17, v5);
  }
  else
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AWPearlAttentionSampler_faceDetectStalled___block_invoke;
    block[3] = &unk_1E606A848;
    id v19 = v4;
    id v20 = v5;
    double v21 = self;
    dispatch_async(queue, block);

    double v17 = (void (**)(void, void))v19;
  }
}

void __45__AWPearlAttentionSampler_faceDetectStalled___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (id)[*(id *)(a1 + 32) cancelActiveOperation:*(void *)(a1 + 40)];
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
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 134218498;
      double v18 = v5;
      __int16 v19 = 2112;
      *(void *)id v20 = v10;
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v11;
      double v12 = "%13.5f: %@ cancelled stalled presence operation %p";
      double v13 = v3;
      uint32_t v14 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      return;
    }
    uint64_t v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          BOOL v6 = i;
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
          uint64_t v15 = *(void *)(a1 + 48);
          uint64_t v16 = *(void *)(a1 + 32);
          int v17 = 136316162;
          double v18 = *(double *)&v6;
          __int16 v19 = 1024;
          *(_DWORD *)id v20 = 272;
          *(_WORD *)&v20[4] = 2048;
          *(double *)&v20[6] = v9;
          *(_WORD *)&v20[14] = 2112;
          *(void *)&v20[16] = v15;
          __int16 v21 = 2048;
          uint64_t v22 = v16;
          double v12 = "%30s:%-4d: %13.5f: %@ cancelled stalled presence operation %p";
          double v13 = v3;
          uint32_t v14 = 48;
          goto LABEL_19;
        }
      }
    }
  }
}

- (void)triggerFaceDetectWithDeadline:(unint64_t)a3 options:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  uint64_t v7 = [(AWPearlAttentionSampler *)self createNewSamplingOperation];
  if (self->_currentOperation) {
    __assert_rtn("-[AWPearlAttentionSampler triggerFaceDetectWithDeadline:options:]", "PearlAttentionSampler.m", 178, "!_currentOperation");
  }
  unint64_t v8 = (void *)v7;
  self->_operationCreateTime = absTimeNS();
  if (a3) {
    int64_t v9 = a3 - absTimeNS();
  }
  else {
    int64_t v9 = 0;
  }
  unint64_t v10 = [(AWPearlAttentionSampler *)self minimumAttentionSamplerErrorRetryTime];
  if (v10 >= absTimeNS())
  {
    if (currentLogLevel >= 3)
    {
      double v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v42 = absTimeNS();
        if (v42 == -1) {
          double v43 = INFINITY;
        }
        else {
          double v43 = (double)v42 / 1000000000.0;
        }
        unint64_t lastErrorTime = self->_lastErrorTime;
        if (lastErrorTime == -1) {
          double v45 = INFINITY;
        }
        else {
          double v45 = (double)lastErrorTime / 1000000000.0;
        }
        *(_DWORD *)buf = 134218498;
        double v52 = v43;
        __int16 v53 = 2112;
        *(void *)int v54 = self;
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = v45;
        _os_log_error_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_ERROR, "%13.5f: %@ not creating presence operation because our last error was at %13.5f", buf, 0x20u);
      }
    }
    goto LABEL_73;
  }
  if (v9 < 1) {
    double v11 = 0.0;
  }
  else {
    double v11 = (double)(unint64_t)v9 / 1000000000.0;
  }
  uint64_t v13 = [v8 createPresenceDetectOperationWithTimeout:*(void *)&v4 & 0xFFFFFFLL options:v11];
  if (v13)
  {
    double v46 = (void *)v13;
    if (currentLogLevel >= 3)
    {
      __int16 v47 = _AALog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        unint64_t v48 = absTimeNS();
        if (v48 == -1) {
          double v49 = INFINITY;
        }
        else {
          double v49 = (double)v48 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218498;
        double v52 = v49;
        __int16 v53 = 2112;
        *(void *)int v54 = self;
        *(_WORD *)&v54[8] = 2112;
        *(void *)&v54[10] = v46;
        _os_log_error_impl(&dword_1B3B4B000, v47, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to create presence operation: %@", buf, 0x20u);
      }
    }
    [(AWPearlAttentionSampler *)self pearlAttentionSamplerErrorOccurred];

    goto LABEL_73;
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke;
  v50[3] = &unk_1E606A820;
  v50[4] = self;
  [v8 startPresenceDetectOperation:v50];
  self->_signpostLogged = 0;
  uint32_t v14 = _AALog();
  uint64_t v15 = _AALog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v14, OS_SIGNPOST_EVENT, v16, "AA: Face detect started", (const char *)&unk_1B3B8868B, buf, 2u);
  }

  self->_currentOptions.AWAttentionSamplerActivateAttentionDetection = v4 & 1;
  self->_currentOptions.AWAttentionSamplerActivateMotionDetection = BYTE1(v4) & 1;
  [(AWPearlAttentionSampler *)self setCurrentState:2];
  if (currentLogLevel == 5)
  {
    int v17 = _AALog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = absTimeNS();
      if (v18 == -1) {
        double v19 = INFINITY;
      }
      else {
        double v19 = (double)v18 / 1000000000.0;
      }
      if (a3 == -1) {
        double v24 = INFINITY;
      }
      else {
        double v24 = (double)a3 / 1000000000.0;
      }
      if (v9 == -1) {
        double v25 = INFINITY;
      }
      else {
        double v25 = (double)(unint64_t)v9 / 1000000000.0;
      }
      *(_DWORD *)buf = 134219010;
      double v52 = v19;
      __int16 v53 = 2112;
      *(void *)int v54 = self;
      *(_WORD *)&v54[8] = 2048;
      *(void *)&v54[10] = v8;
      *(_WORD *)&v54[18] = 2048;
      *(double *)&v54[20] = v24;
      *(_WORD *)&v54[28] = 2048;
      *(double *)&v54[30] = v25;
      __int16 v26 = "%13.5f: %@ starting presence operation %p with deadline %13.5f, interval %13.5f";
      __int16 v27 = v17;
      uint32_t v28 = 52;
LABEL_46:
      _os_log_impl(&dword_1B3B4B000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
LABEL_47:

    goto LABEL_48;
  }
  if (currentLogLevel >= 6)
  {
    int v17 = _AALog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v20 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v22 = absTimeNS();
          if (v22 == -1) {
            double v23 = INFINITY;
          }
          else {
            double v23 = (double)v22 / 1000000000.0;
          }
          if (a3 == -1) {
            double v29 = INFINITY;
          }
          else {
            double v29 = (double)a3 / 1000000000.0;
          }
          if (v9 == -1) {
            double v30 = INFINITY;
          }
          else {
            double v30 = (double)(unint64_t)v9 / 1000000000.0;
          }
          *(_DWORD *)buf = 136316674;
          double v52 = *(double *)&v20;
          __int16 v53 = 1024;
          *(_DWORD *)int v54 = 223;
          *(_WORD *)&v54[4] = 2048;
          *(double *)&v54[6] = v23;
          *(_WORD *)&v54[14] = 2112;
          *(void *)&v54[16] = self;
          *(_WORD *)&v54[24] = 2048;
          *(void *)&v54[26] = v8;
          *(_WORD *)&v54[34] = 2048;
          *(double *)&v54[36] = v29;
          __int16 v55 = 2048;
          double v56 = v30;
          __int16 v26 = "%30s:%-4d: %13.5f: %@ starting presence operation %p with deadline %13.5f, interval %13.5f";
          __int16 v27 = v17;
          uint32_t v28 = 68;
          goto LABEL_46;
        }
      }
    }
    goto LABEL_47;
  }
LABEL_48:
  __int16 v31 = [(AWAttentionSampler *)self sampleLogger];
  [v31 sampleStartedWithDeadline:a3];

  objc_storeStrong((id *)&self->_currentOperation, v8);
  [(AWPearlAttentionSampler *)self cancelStalledTimer];
  if (self->_enrollOrMatchOperationUnderway)
  {
    if (currentLogLevel == 5)
    {
      double v32 = _AALog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v33 = absTimeNS();
        if (v33 == -1) {
          double v34 = INFINITY;
        }
        else {
          double v34 = (double)v33 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v52 = v34;
        unint64_t v39 = "%13.5f: Match or enroll operation underway, initialize the state immediately";
        double v40 = v32;
        uint32_t v41 = 12;
LABEL_70:
        _os_log_impl(&dword_1B3B4B000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_72:
        [(AWPearlAttentionSampler *)self updateFaceState:3];
        goto LABEL_73;
      }
      double v32 = _AALog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        double v35 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
        for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Sampling/PearlAttentionSampler.m";
              ;
              ++j)
        {
          if (*(j - 1) == 47)
          {
            double v35 = j;
          }
          else if (!*(j - 1))
          {
            unint64_t v37 = absTimeNS();
            if (v37 == -1) {
              double v38 = INFINITY;
            }
            else {
              double v38 = (double)v37 / 1000000000.0;
            }
            *(_DWORD *)buf = 136315650;
            double v52 = *(double *)&v35;
            __int16 v53 = 1024;
            *(_DWORD *)int v54 = 233;
            *(_WORD *)&v54[4] = 2048;
            *(double *)&v54[6] = v38;
            unint64_t v39 = "%30s:%-4d: %13.5f: Match or enroll operation underway, initialize the state immediately";
            double v40 = v32;
            uint32_t v41 = 28;
            goto LABEL_70;
          }
        }
      }
    }

    goto LABEL_72;
  }
  [(AWPearlAttentionSampler *)self startStalledTimerForOperation:v8];
LABEL_73:
}

void __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke_2;
  v7[3] = &unk_1E606AC98;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    [*(id *)(result + 40) pearlAttentionSamplerErrorOccurred];
    id v2 = *(void **)(v1 + 40);
    return [v2 updateFaceState:4];
  }
  return result;
}

- (id)createNewSamplingOperation
{
  if (self->_useAVFoundation) {
    id v3 = off_1E6069CE8;
  }
  else {
    id v3 = &off_1E6069D50;
  }
  uint64_t v4 = (void *)[objc_alloc(*v3) initWithQueue:self->super._queue forUnitTest:self->_unitTest];
  [v4 setDelegate:self];

  return v4;
}

- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4
{
  BOOL v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AWPearlAttentionSampler;
  id v6 = [(AWAttentionSampler *)&v34 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_useAVFoundation = a4;
    v6->_unitTest = v5;
    currentOperation = v6->_currentOperation;
    v6->_currentOperation = 0;

    finishingOperation = v7->_finishingOperation;
    v7->_finishingOperation = 0;

    unitTestOperation = v7->_unitTestOperation;
    v7->_unitTestOperation = 0;

    v7->_signpostLogged = 0;
    v7->_enrollOrMatchOperationUnderway = 0;
    if (v5)
    {
      uint64_t v11 = [(AWPearlAttentionSampler *)v7 createNewSamplingOperation];
      double v12 = v7->_unitTestOperation;
      v7->_unitTestOperation = (SamplingOperation *)v11;

      v7->_displayState = 1;
      [(AWAttentionSampler *)v7 setUnitTestMode];
      uint64_t v13 = [(AWPearlAttentionSampler *)v7 unitTestSampler];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke;
      v32[3] = &unk_1E606A7D0;
      uint32_t v14 = (id *)&v33;
      uint64_t v15 = v7;
      unint64_t v33 = v15;
      [v13 setDisplayCallback:v32];

      os_signpost_id_t v16 = [(AWPearlAttentionSampler *)v15 unitTestSampler];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_3;
      v30[3] = &unk_1E606A7D0;
      int v17 = (id *)&v31;
      unint64_t v18 = v15;
      __int16 v31 = v18;
      [v16 setSmartCoverCallback:v30];

      double v19 = [(AWPearlAttentionSampler *)v18 unitTestSampler];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_5;
      v28[3] = &unk_1E606A7D0;
      double v29 = v18;
      [v19 setCarplayStateChangedCallback:v28];
    }
    else
    {
      v7->_carPlayConnected = 0;
      queue = v7->super._queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_7;
      block[3] = &unk_1E606AC70;
      uint32_t v14 = (id *)&v27;
      __int16 v21 = v7;
      __int16 v27 = v21;
      dispatch_async(queue, block);
      unint64_t v22 = v7->super._queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_8;
      handler[3] = &unk_1E606A7F8;
      int v17 = (id *)&v25;
      double v25 = v21;
      notify_register_dispatch("com.apple.BiometricKit.activeOperation", v21 + 68, v22, handler);
    }
  }
  return v7;
}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_2;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_3(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_4;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_5(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_6;
  v5[3] = &unk_1E606AC00;
  id v6 = v3;
  char v7 = a2;
  dispatch_sync(v4, v5);
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  BOOL v2 = BKSHIDServicesIsSmartCoverClosed() != 0;

  return [v1 setSmartCoverClosed:v2];
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_8(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  uint64_t v4 = *(void *)(a1 + 32);
  if (state64 - 1 >= 2)
  {
    if (!*(unsigned char *)(v4 + 276)) {
      return result;
    }
    char v5 = 0;
  }
  else
  {
    char v5 = 1;
  }
  *(unsigned char *)(v4 + 276) = v5;
  return result;
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCarPlayConnected:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSmartCoverClosed:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayState:*(unsigned __int8 *)(a1 + 40)];
}

- (AWPearlAttentionSampler)initWithOptions:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 valueForKey:@"useAVFoundation"];

    if (v6)
    {
      id v6 = [v5 valueForKey:@"unitTest"];

      if (v6)
      {
        char v7 = [v5 valueForKey:@"unitTest"];
        uint64_t v8 = [v7 BOOLValue];

        uint64_t v9 = [v5 valueForKey:@"useAVFoundation"];
        uint64_t v10 = [v9 BOOLValue];

        self = (AWPearlAttentionSampler *)[(AWPearlAttentionSampler *)self initForUnitTest:v8 useAVFoundation:v10];
        id v6 = self;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end