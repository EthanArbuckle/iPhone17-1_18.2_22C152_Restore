@interface AWUnitTestFaceDetectOperation
- (AWUnitTestFaceDetectOperation)init;
- (AWUnitTestPearlDevice)unitTestDevice;
- (BOOL)startStreamWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (int64_t)state;
- (void)awDeliverFaceFound;
- (void)awDeliverStreamingEvent;
- (void)awFinishWithReason:(int64_t)a3;
- (void)awSetFaceDetectError:(BOOL)a3;
- (void)awSetFaceFound;
- (void)cancel;
- (void)dealloc;
- (void)setErrorState:(BOOL)a3;
- (void)setUnitTestDevice:(id)a3;
- (void)startWithReply:(id)a3;
@end

@implementation AWUnitTestFaceDetectOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDevice);
  objc_storeStrong((id *)&self->_streamingTimer, 0);
  objc_storeStrong((id *)&self->_deadlineTimer, 0);
  objc_storeStrong((id *)&self->_awInitTimer, 0);

  objc_storeStrong((id *)&self->_awQueue, 0);
}

- (void)setUnitTestDevice:(id)a3
{
}

- (AWUnitTestPearlDevice)unitTestDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDevice);

  return (AWUnitTestPearlDevice *)WeakRetained;
}

- (void)awSetFaceDetectError:(BOOL)a3
{
  awQueue = self->_awQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AWUnitTestFaceDetectOperation_awSetFaceDetectError___block_invoke;
  v4[3] = &unk_1E606AC00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(awQueue, v4);
}

uint64_t __54__AWUnitTestFaceDetectOperation_awSetFaceDetectError___block_invoke(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(result + 32) + 122) = *(unsigned char *)(result + 40);
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) mode];
    if (result != 1)
    {
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
          uint64_t v9 = *(void *)(v1 + 32);
          *(_DWORD *)v15 = 134218240;
          *(double *)&v15[4] = v4;
          *(_WORD *)&v15[12] = 2048;
          *(void *)&v15[14] = v9;
          v10 = "%13.5f: UNIT TEST: delivering error for operation %p";
          v11 = v2;
          uint32_t v12 = 22;
LABEL_21:
          _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
        }
      }
      else
      {
        if (currentLogLevel < 6)
        {
LABEL_23:
          v14 = +[AWUnitTestPearlDevice sharedDevice];
          [v14 deliverPearlDeviceState:5];

          return [*(id *)(v1 + 32) awFinishWithReason:3];
        }
        v2 = _AALog();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
          for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
              uint64_t v13 = *(void *)(v1 + 32);
              *(_DWORD *)v15 = 136315906;
              *(void *)&v15[4] = v5;
              *(_WORD *)&v15[12] = 1024;
              *(_DWORD *)&v15[14] = 600;
              *(_WORD *)&v15[18] = 2048;
              *(double *)&v15[20] = v8;
              *(_WORD *)&v15[28] = 2048;
              *(void *)&v15[30] = v13;
              v10 = "%30s:%-4d: %13.5f: UNIT TEST: delivering error for operation %p";
              v11 = v2;
              uint32_t v12 = 38;
              goto LABEL_21;
            }
          }
        }
      }

      goto LABEL_23;
    }
  }
  return result;
}

- (void)awSetFaceFound
{
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AWUnitTestFaceDetectOperation_awSetFaceFound__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

uint64_t __47__AWUnitTestFaceDetectOperation_awSetFaceFound__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)v15 = 134218240;
      *(double *)&v15[4] = v4;
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = v9;
      v10 = "%13.5f: UNIT TEST: delivering face present event for operation %p";
      v11 = v2;
      uint32_t v12 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
    }
LABEL_20:

    return objc_msgSend(*(id *)(a1 + 32), "awDeliverFaceFound", *(_OWORD *)v15, *(void *)&v15[16], *(_OWORD *)&v15[24], v16);
  }
  if (currentLogLevel >= 6)
  {
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
          uint64_t v13 = *(void *)(a1 + 32);
          *(_DWORD *)v15 = 136315906;
          *(void *)&v15[4] = v5;
          *(_WORD *)&v15[12] = 1024;
          *(_DWORD *)&v15[14] = 589;
          *(_WORD *)&v15[18] = 2048;
          *(double *)&v15[20] = v8;
          *(_WORD *)&v15[28] = 2048;
          *(void *)&v15[30] = v13;
          v10 = "%30s:%-4d: %13.5f: UNIT TEST: delivering face present event for operation %p";
          v11 = v2;
          uint32_t v12 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
  return objc_msgSend(*(id *)(a1 + 32), "awDeliverFaceFound", *(_OWORD *)v15, *(void *)&v15[16], *(_OWORD *)&v15[24], v16);
}

- (void)cancel
{
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AWUnitTestFaceDetectOperation_cancel__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

uint64_t __39__AWUnitTestFaceDetectOperation_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) awFinishWithReason:2];
}

- (void)awDeliverFaceFound
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_awQueue);
  if (self->_finished)
  {
    if (currentLogLevel == 5)
    {
      unint64_t v3 = _AALog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = absTimeNS();
        if (v4 == -1) {
          double v5 = INFINITY;
        }
        else {
          double v5 = (double)v4 / 1000000000.0;
        }
        int v14 = 134218240;
        double v15 = v5;
        __int16 v16 = 2048;
        *(void *)v17 = self;
        v11 = "%13.5f: UNIT TEST: face found for already finished operation %p";
        uint32_t v12 = v3;
        uint32_t v13 = 22;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
      }
    }
    else
    {
      if (currentLogLevel < 6) {
        return;
      }
      unint64_t v3 = _AALog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
            int v14 = 136315906;
            double v15 = *(double *)&v7;
            __int16 v16 = 1024;
            *(_DWORD *)v17 = 570;
            *(_WORD *)&v17[4] = 2048;
            *(double *)&v17[6] = v10;
            __int16 v18 = 2048;
            v19 = self;
            v11 = "%30s:%-4d: %13.5f: UNIT TEST: face found for already finished operation %p";
            uint32_t v12 = v3;
            uint32_t v13 = 38;
            goto LABEL_23;
          }
        }
      }
    }
  }
  else
  {
    v6 = +[AWUnitTestPearlDevice sharedDevice];
    [v6 deliverPearlDeviceEvent:3];

    [(AWUnitTestFaceDetectOperation *)self awFinishWithReason:1];
  }
}

- (void)awFinishWithReason:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_awQueue);
  if (!self->_finished)
  {
    self->_finished = 1;
    dispatch_source_cancel((dispatch_source_t)self->_awInitTimer);
    dispatch_source_cancel((dispatch_source_t)self->_deadlineTimer);
    double v8 = [(BKOperation *)self queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__AWUnitTestFaceDetectOperation_awFinishWithReason___block_invoke;
    v16[3] = &unk_1E606AB88;
    v16[4] = self;
    v16[5] = a3;
    dispatch_async(v8, v16);

    dispatch_source_cancel((dispatch_source_t)self->_streamingTimer);
    return;
  }
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
      *(_DWORD *)buf = 134218498;
      double v18 = v7;
      __int16 v19 = 2080;
      *(void *)uint64_t v20 = getEndReasonDescriptions(a3);
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = self;
      uint32_t v13 = "%13.5f: UNIT TEST: %s for already finished operation %p";
      int v14 = v5;
      uint32_t v15 = 32;
LABEL_21:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      return;
    }
    double v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
          *(_DWORD *)buf = 136316162;
          double v18 = *(double *)&v9;
          __int16 v19 = 1024;
          *(_DWORD *)uint64_t v20 = 545;
          *(_WORD *)&v20[4] = 2048;
          *(double *)&v20[6] = v12;
          *(_WORD *)&v20[14] = 2080;
          *(void *)&v20[16] = getEndReasonDescriptions(a3);
          __int16 v21 = 2048;
          v22 = self;
          uint32_t v13 = "%30s:%-4d: %13.5f: UNIT TEST: %s for already finished operation %p";
          int v14 = v5;
          uint32_t v15 = 48;
          goto LABEL_21;
        }
      }
    }
  }
}

void __52__AWUnitTestFaceDetectOperation_awFinishWithReason___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      EndReasonDescriptions = getEndReasonDescriptions(*(void *)(a1 + 40));
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v19 = 134218498;
      *(double *)&v19[4] = v4;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = EndReasonDescriptions;
      *(_WORD *)&v19[22] = 2048;
      *(void *)&v19[24] = v10;
      unint64_t v11 = "%13.5f: UNIT TEST: delivering %s for operation %p";
      double v12 = v2;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, v19, v13);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          double v5 = i;
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
          int v14 = getEndReasonDescriptions(*(void *)(a1 + 40));
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)__int16 v19 = 136316162;
          *(void *)&v19[4] = v5;
          *(_WORD *)&v19[12] = 1024;
          *(_DWORD *)&v19[14] = 553;
          *(_WORD *)&v19[18] = 2048;
          *(double *)&v19[20] = v8;
          *(_WORD *)&v19[28] = 2080;
          *(void *)&v19[30] = v14;
          *(_WORD *)&v19[38] = 2048;
          uint64_t v20 = v15;
          unint64_t v11 = "%30s:%-4d: %13.5f: UNIT TEST: delivering %s for operation %p";
          double v12 = v2;
          uint32_t v13 = 48;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  __int16 v16 = objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v19, *(void *)&v19[16], *(void *)&v19[24], *(void *)&v19[32], v20);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    double v18 = [*(id *)(a1 + 32) delegate];
    [v18 operation:*(void *)(a1 + 32) finishedWithReason:*(void *)(a1 + 40)];
  }
}

- (void)startWithReply:(id)a3
{
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke;
  v17[3] = &unk_1E606ABB0;
  v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  unint64_t v6 = (void *)MEMORY[0x1B3EC18C0](v17);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint32_t v13 = __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke_2;
  int v14 = &unk_1E606ABB0;
  uint64_t v15 = self;
  id v16 = v5;
  id v7 = v5;
  double v8 = (void *)MEMORY[0x1B3EC18C0](&v11);
  unint64_t v9 = dispatch_get_global_queue(0, 0);
  if ([(BKFaceDetectOperation *)self mode] == 1) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  dispatch_async(v9, v10);
}

void __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 startWithError:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 startStreamWithError:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)awDeliverStreamingEvent
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel == 5)
  {
    id v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = absTimeNS();
      if (v4 == -1) {
        double v5 = INFINITY;
      }
      else {
        double v5 = (double)v4 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v23 = v5;
      uint64_t v10 = "%13.5f: UNIT TEST: Delivering streaming event";
      uint64_t v11 = v3;
      uint32_t v12 = 12;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    id v3 = _AALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v6 = i;
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
          *(_DWORD *)buf = 136315650;
          double v23 = *(double *)&v6;
          __int16 v24 = 1024;
          int v25 = 499;
          __int16 v26 = 2048;
          double v27 = v9;
          uint64_t v10 = "%30s:%-4d: %13.5f: UNIT TEST: Delivering streaming event";
          uint64_t v11 = v3;
          uint32_t v12 = 28;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  id v13 = objc_alloc(MEMORY[0x1E4F50530]);
  BOOL v14 = [(BKFaceDetectOperation *)self eyeRelief];
  if (v14) {
    float v15 = 100.0;
  }
  else {
    float v15 = 0.0;
  }
  [v13 setEyeReliefStatus:v14];
  *(float *)&double v16 = v15;
  char v17 = [NSNumber numberWithFloat:v16];
  [v13 setDistance:v17];

  id v18 = [(BKOperation *)self queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__AWUnitTestFaceDetectOperation_awDeliverStreamingEvent__block_invoke;
  v20[3] = &unk_1E606AC98;
  v20[4] = self;
  id v21 = v13;
  id v19 = v13;
  dispatch_sync(v18, v20);
}

void __56__AWUnitTestFaceDetectOperation_awDeliverStreamingEvent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 operation:*(void *)(a1 + 32) faceDetectStateChanged:*(void *)(a1 + 40)];
  }
}

- (void)setErrorState:(BOOL)a3
{
  awQueue = self->_awQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AWUnitTestFaceDetectOperation_setErrorState___block_invoke;
  v4[3] = &unk_1E606AC00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(awQueue, v4);
}

uint64_t __47__AWUnitTestFaceDetectOperation_setErrorState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 122) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)startStreamWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
      BOOL v12 = [(BKFaceDetectOperation *)self eyeRelief];
      id v13 = "without";
      if (v12) {
        id v13 = "with";
      }
      *(_DWORD *)buf = 134218242;
      *(double *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v13;
      BOOL v14 = "%13.5f: UNIT TEST: Starting stream %s eyeRelief";
      float v15 = v5;
      uint32_t v16 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    BOOL v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    unint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        BOOL v17 = [(BKFaceDetectOperation *)self eyeRelief];
        id v18 = "without";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 459;
        if (v17) {
          id v18 = "with";
        }
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = v11;
        __int16 v30 = 2080;
        v31 = v18;
        BOOL v14 = "%30s:%-4d: %13.5f: UNIT TEST: Starting stream %s eyeRelief";
        float v15 = v5;
        uint32_t v16 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_24:

        break;
      }
    }
  }
  dispatch_activate((dispatch_object_t)self->_awInitTimer);
  dispatch_activate((dispatch_object_t)self->_deadlineTimer);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke;
  block[3] = &unk_1E606AB38;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(awQueue, block);
  int v20 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v21 = [(BKOperation *)self queue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke_2;
    v25[3] = &unk_1E606AC70;
    v25[4] = self;
    dispatch_sync(v21, v25);

    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v28 = @" Pearl is in error state";
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *a3 = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:v23];
  }
  else
  {
    dispatch_source_set_timer((dispatch_source_t)self->_streamingTimer, 0, 0x1DCD6500uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_streamingTimer);
  }
  _Block_object_dispose(buf, 8);
  return v20 == 0;
}

uint64_t __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 122);
  return result;
}

void __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 operation:*(void *)(a1 + 32) finishedWithReason:3];
  }
}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
      [(BKFaceDetectOperation *)self timeout];
      int v26 = 134218496;
      double v27 = v6;
      __int16 v28 = 2048;
      *(void *)v29 = self;
      *(_WORD *)&v29[8] = 2048;
      *(void *)&v29[10] = v11;
      BOOL v12 = "%13.5f: UNIT TEST: start operation %p with timeout %f";
      id v13 = v4;
      uint32_t v14 = 32;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v26, v14);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_21;
    }
    id v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
          [(BKFaceDetectOperation *)self timeout];
          int v26 = 136316162;
          double v27 = *(double *)&v7;
          __int16 v28 = 1024;
          *(_DWORD *)v29 = 436;
          *(_WORD *)&v29[4] = 2048;
          *(double *)&v29[6] = v10;
          *(_WORD *)&v29[14] = 2048;
          *(void *)&v29[16] = self;
          __int16 v30 = 2048;
          uint64_t v31 = v15;
          BOOL v12 = "%30s:%-4d: %13.5f: UNIT TEST: start operation %p with timeout %f";
          id v13 = v4;
          uint32_t v14 = 48;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  self->_started = 1;
  awInitTimer = self->_awInitTimer;
  dispatch_time_t v17 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(awInitTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_awInitTimer);
  [(BKFaceDetectOperation *)self timeout];
  double v19 = v18;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDevice);
  uint64_t v21 = [WeakRetained sampleStatsPtr];
  if (v19 == 0.0)
  {
    ++*(void *)(v21 + 16);

    int64_t v22 = 1000000000;
  }
  else
  {
    ++*(void *)(v21 + 8);

    int64_t v22 = (uint64_t)(v19 * 1000000000.0);
  }
  deadlineTimer = self->_deadlineTimer;
  dispatch_time_t v24 = dispatch_time(0, v22);
  dispatch_source_set_timer(deadlineTimer, v24, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_deadlineTimer);
  dispatch_activate((dispatch_object_t)self->_streamingTimer);
  return 1;
}

- (int64_t)state
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  awQueue = self->_awQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AWUnitTestFaceDetectOperation_state__block_invoke;
  v5[3] = &unk_1E606AB38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(awQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AWUnitTestFaceDetectOperation_state__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 121))
  {
    uint64_t v2 = 4;
  }
  else
  {
    if (!*(unsigned char *)(v1 + 120)) {
      return result;
    }
    uint64_t v2 = 2;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)dealloc
{
  awInitTimer = self->_awInitTimer;
  if (awInitTimer) {
    dispatch_source_cancel(awInitTimer);
  }
  deadlineTimer = self->_deadlineTimer;
  if (deadlineTimer) {
    dispatch_source_cancel(deadlineTimer);
  }
  streamingTimer = self->_streamingTimer;
  if (streamingTimer) {
    dispatch_source_cancel(streamingTimer);
  }
  v6.receiver = self;
  v6.super_class = (Class)AWUnitTestFaceDetectOperation;
  [(BKOperation *)&v6 dealloc];
}

- (AWUnitTestFaceDetectOperation)init
{
  v23.receiver = self;
  v23.super_class = (Class)AWUnitTestFaceDetectOperation;
  id v2 = [(AWUnitTestFaceDetectOperation *)&v23 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestFaceDetectOperation", 0);
    id v4 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v3;

    objc_initWeak(&location, v2);
    unint64_t v5 = (const dispatch_source_type_s *)MEMORY[0x1E4F14490];
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 11));
    double v7 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v6;

    uint64_t v8 = *((void *)v2 + 12);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke;
    handler[3] = &unk_1E606A730;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_t v9 = dispatch_source_create(v5, 0, 0, *((dispatch_queue_t *)v2 + 11));
    double v10 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v9;

    uint64_t v11 = *((void *)v2 + 13);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke_2;
    v18[3] = &unk_1E606A730;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v11, v18);
    dispatch_source_t v12 = dispatch_source_create(v5, 0, 0, *((dispatch_queue_t *)v2 + 11));
    id v13 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v12;

    uint32_t v14 = *((void *)v2 + 14);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke_3;
    v16[3] = &unk_1E606A730;
    objc_copyWeak(&v17, &location);
    dispatch_source_set_event_handler(v14, v16);
    *((unsigned char *)v2 + 122) = 0;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return (AWUnitTestFaceDetectOperation *)v2;
}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke(uint64_t a1)
{
  id v2 = +[AWUnitTestPearlDevice sharedDevice];
  int v3 = [v2 pearlError];

  id v4 = +[AWUnitTestPearlDevice sharedDevice];
  unint64_t v5 = v4;
  if (v3)
  {
    [v4 deliverPearlDeviceState:5];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained awFinishWithReason:3];
  }
  else
  {
    int v6 = [v4 facePresent];

    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained awDeliverFaceFound];
    }
    else
    {
      id WeakRetained = +[AWUnitTestPearlDevice sharedDevice];
      [WeakRetained deliverPearlDeviceEvent:2];
    }
  }
}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained awFinishWithReason:4];
}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained awDeliverStreamingEvent];
}

@end