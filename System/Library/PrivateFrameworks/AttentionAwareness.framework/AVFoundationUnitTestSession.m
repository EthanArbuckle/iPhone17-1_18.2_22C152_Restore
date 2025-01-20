@interface AVFoundationUnitTestSession
- (AVFoundationUnitTestSession)init;
- (BOOL)cancelUnitTestStream;
- (BOOL)startUnitTestStream:(id)a3 options:(id)a4;
- (void)AVFoundationDeliverStreamingEvent;
- (void)initializeStreamingTimer;
- (void)setAVFoundationDelegate:(id)a3;
- (void)setErrorState:(BOOL)a3;
@end

@implementation AVFoundationUnitTestSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_streamingTimer, 0);
  objc_storeStrong((id *)&self->_eventDeliveryQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setErrorState:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__AVFoundationUnitTestSession_setErrorState___block_invoke;
  v19[3] = &unk_1E606AC00;
  v19[4] = self;
  BOOL v20 = a3;
  dispatch_sync(queue, v19);
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
      BOOL errorState = self->_errorState;
      *(_DWORD *)buf = 134218498;
      if (errorState) {
        v13 = "true";
      }
      else {
        v13 = "false";
      }
      double v22 = v7;
      __int16 v23 = 2112;
      *(void *)v24 = self;
      *(_WORD *)&v24[8] = 2080;
      *(void *)&v24[10] = v13;
      v14 = "%13.5f: UNIT TEST: %@ setting error state to %s";
      v15 = v5;
      uint32_t v16 = 32;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (currentLogLevel >= 6)
  {
    v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        v8 = i;
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
        v17 = "true";
        BOOL v18 = self->_errorState;
        *(_DWORD *)buf = 136316162;
        if (!v18) {
          v17 = "false";
        }
        double v22 = *(double *)&v8;
        __int16 v23 = 1024;
        *(_DWORD *)v24 = 691;
        *(_WORD *)&v24[4] = 2048;
        *(double *)&v24[6] = v11;
        *(_WORD *)&v24[14] = 2112;
        *(void *)&v24[16] = self;
        __int16 v25 = 2080;
        v26 = v17;
        v14 = "%30s:%-4d: %13.5f: UNIT TEST: %@ setting error state to %s";
        v15 = v5;
        uint32_t v16 = 48;
LABEL_24:
        _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_25:

        return;
      }
    }
  }
}

uint64_t __45__AVFoundationUnitTestSession_setErrorState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 43) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)cancelUnitTestStream
{
  dispatch_source_cancel((dispatch_source_t)self->_streamingTimer);
  streamingTimer = self->_streamingTimer;
  self->_streamingTimer = 0;

  return 1;
}

- (BOOL)startUnitTestStream:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__AVFoundationUnitTestSession_startUnitTestStream_options___block_invoke;
  v19[3] = &unk_1E606AB38;
  v19[4] = self;
  void v19[5] = &v20;
  dispatch_sync(queue, v19);
  int v7 = *((unsigned __int8 *)v21 + 24);
  if (*((unsigned char *)v21 + 24))
  {
    if (currentLogLevel == 5)
    {
      v8 = _AALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v9 = absTimeNS();
        if (v9 == -1) {
          double v10 = INFINITY;
        }
        else {
          double v10 = (double)v9 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v25 = v10;
        v15 = "%13.5f: UNIT TEST: Not starting an AVFoundation streaming operation because of error state";
        uint32_t v16 = v8;
        uint32_t v17 = 12;
LABEL_21:
        _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
LABEL_22:

      goto LABEL_23;
    }
    if (currentLogLevel >= 6)
    {
      v8 = _AALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
        for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
            *(_DWORD *)buf = 136315650;
            double v25 = *(double *)&v11;
            __int16 v26 = 1024;
            int v27 = 670;
            __int16 v28 = 2048;
            double v29 = v14;
            v15 = "%30s:%-4d: %13.5f: UNIT TEST: Not starting an AVFoundation streaming operation because of error state";
            uint32_t v16 = v8;
            uint32_t v17 = 28;
            goto LABEL_21;
          }
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    [(AVFoundationUnitTestSession *)self initializeStreamingTimer];
  }
LABEL_23:
  _Block_object_dispose(&v20, 8);

  return v7 == 0;
}

void __59__AVFoundationUnitTestSession_startUnitTestStream_options___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 43);
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
      double v10 = "true";
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        double v11 = "true";
      }
      else {
        double v11 = "false";
      }
      if (!*(unsigned char *)(v9 + 43)) {
        double v10 = "false";
      }
      int v18 = 134218754;
      double v19 = v4;
      __int16 v20 = 2112;
      *(void *)v21 = v9;
      *(_WORD *)&v21[8] = 2080;
      *(void *)&v21[10] = v11;
      *(_WORD *)&v21[18] = 2080;
      *(void *)&v21[20] = v10;
      v12 = "%13.5f: UNIT TEST: startUnitTestStream called for %@, localErrorState: %s _errorState: %s";
      unint64_t v13 = v2;
      uint32_t v14 = 42;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (currentLogLevel >= 6)
  {
    v2 = _AALog();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    id v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        uint64_t v15 = *(void *)(a1 + 32);
        uint32_t v16 = "true";
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          uint32_t v17 = "true";
        }
        else {
          uint32_t v17 = "false";
        }
        if (!*(unsigned char *)(v15 + 43)) {
          uint32_t v16 = "false";
        }
        int v18 = 136316418;
        double v19 = *(double *)&v5;
        __int16 v20 = 1024;
        *(_DWORD *)v21 = 665;
        *(_WORD *)&v21[4] = 2048;
        *(double *)&v21[6] = v8;
        *(_WORD *)&v21[14] = 2112;
        *(void *)&v21[16] = v15;
        *(_WORD *)&v21[24] = 2080;
        *(void *)&v21[26] = v17;
        __int16 v22 = 2080;
        char v23 = v16;
        v12 = "%30s:%-4d: %13.5f: UNIT TEST: startUnitTestStream called for %@, localErrorState: %s _errorState: %s";
        unint64_t v13 = v2;
        uint32_t v14 = 58;
LABEL_29:
        _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
LABEL_30:

        return;
      }
    }
  }
}

- (void)setAVFoundationDelegate:(id)a3
{
}

- (void)AVFoundationDeliverStreamingEvent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)unint64_t v13 = 134217984;
      *(double *)&v13[4] = v5;
      double v10 = "%13.5f: UNIT TEST: Delivering streaming event for AVFoundation";
      double v11 = v3;
      uint32_t v12 = 12;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v13, v12);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v3 = _AALog();
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
          *(_DWORD *)unint64_t v13 = 136315650;
          *(void *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 1024;
          *(_DWORD *)&v13[14] = 649;
          *(_WORD *)&v13[18] = 2048;
          *(double *)&v13[20] = v9;
          double v10 = "%30s:%-4d: %13.5f: UNIT TEST: Delivering streaming event for AVFoundation";
          double v11 = v3;
          uint32_t v12 = 28;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  [(AVFoundationUnitTestEventReceiving *)self->_delegate receiveStreamingEvent];
}

- (void)initializeStreamingTimer
{
  objc_initWeak(&location, self);
  unint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  streamingTimer = self->_streamingTimer;
  self->_streamingTimer = v3;

  double v5 = self->_streamingTimer;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AVFoundationUnitTestSession_initializeStreamingTimer__block_invoke;
  v6[3] = &unk_1E606A730;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_source_set_timer((dispatch_source_t)self->_streamingTimer, 0, 0x1DCD6500uLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_streamingTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__AVFoundationUnitTestSession_initializeStreamingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained AVFoundationDeliverStreamingEvent];
}

- (AVFoundationUnitTestSession)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AVFoundationUnitTestSession;
  v2 = [(AVFoundationUnitTestSession *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AttentionAwareness.AVFoundationUnitTestSession", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    delegate = v2->_delegate;
    v2->_delegate = 0;

    eventDeliveryQueue = v2->_eventDeliveryQueue;
    v2->_eventDeliveryQueue = 0;

    *(_WORD *)&v2->_currentOptions.AWAttentionStreamerActivateEyeRelief = 0;
    v2->_BOOL errorState = 0;
  }
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
      *(_DWORD *)buf = 134218242;
      double v20 = v9;
      __int16 v21 = 2112;
      *(void *)__int16 v22 = v2;
      uint64_t v14 = "%13.5f: UNIT TEST: Initializing AVFoundationUnitTestSession %@";
      uint64_t v15 = v7;
      uint32_t v16 = 22;
LABEL_21:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_22:

    return v2;
  }
  if (currentLogLevel >= 6)
  {
    id v7 = _AALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
          *(_DWORD *)buf = 136315906;
          double v20 = *(double *)&v10;
          __int16 v21 = 1024;
          *(_DWORD *)__int16 v22 = 631;
          *(_WORD *)&v22[4] = 2048;
          *(double *)&v22[6] = v13;
          __int16 v23 = 2112;
          uint64_t v24 = v2;
          uint64_t v14 = "%30s:%-4d: %13.5f: UNIT TEST: Initializing AVFoundationUnitTestSession %@";
          uint64_t v15 = v7;
          uint32_t v16 = 38;
          goto LABEL_21;
        }
      }
    }
    goto LABEL_22;
  }
  return v2;
}

@end