@interface BCSNFCReader
- (BCSNFCReader)initWithDelegate:(id)a3;
- (BCSNotificationService)notificationService;
- (BOOL)_isWaiting;
- (BOOL)_readTag:(id)a3;
- (BOOL)_startPolling;
- (double)dismissProxCardReactivationDelay;
- (double)postNotificationReactivationDelay;
- (int64_t)state;
- (void)_didDetectTags:(id)a3;
- (void)_didFindLink;
- (void)_disconnectTag;
- (void)_disconnectTagAndBlockReadingUntilRemoved;
- (void)_performBlockOnQueue:(id)a3;
- (void)_processNextURL;
- (void)_requestAppClipForURLRecord:(id)a3;
- (void)_requestNotificationForURLRecord:(id)a3;
- (void)_restart;
- (void)_restartPolling;
- (void)_scheduleReactivationWithDelay:(double)a3;
- (void)_setStateAndNotifyDelegate:(int64_t)a3;
- (void)_startPolling;
- (void)_startProcessingURLs;
- (void)_startReading;
- (void)_stopPolling;
- (void)_stopReadingAndTransitionToState:(int64_t)a3;
- (void)dealloc;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4;
- (void)setDismissProxCardReactivationDelay:(double)a3;
- (void)setNotificationService:(id)a3;
- (void)setPostNotificationReactivationDelay:(double)a3;
- (void)startReading;
- (void)stopReading;
@end

@implementation BCSNFCReader

- (BCSNFCReader)initWithDelegate:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BCSNFCReader;
  v6 = [(BCSNFCReader *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_state = 0;
    v8 = dispatch_get_global_queue(2, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReader", 0, v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReader.disconnectQueue", 0, v11);
    disconnectQueue = v7->_disconnectQueue;
    v7->_disconnectQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    urlQueue = v7->_urlQueue;
    v7->_urlQueue = (NSMutableArray *)v14;

    v16 = [getNFHardwareManagerClass() sharedHardwareManager];
    id v22 = 0;
    int v17 = [v16 queryHardwareSupport:&v22];
    id v18 = v22;

    if (v18)
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      v19 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
        -[BCSNFCReader initWithDelegate:](v19);
      }
    }
    if (v17 != 2) {
      [(BCSNFCReader *)v7 _setStateAndNotifyDelegate:1];
    }
    v20 = v7;
  }
  return v7;
}

- (int64_t)state
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__BCSNFCReader_state__block_invoke;
  v5[3] = &unk_26468B070;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__BCSNFCReader_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)startReading
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__BCSNFCReader_startReading__block_invoke;
  block[3] = &unk_26468AE90;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__BCSNFCReader_startReading__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startReading];
}

- (void)_startReading
{
  [(NSTimer *)self->_reactivateTimer invalidate];
  reactivateTimer = self->_reactivateTimer;
  self->_reactivateTimer = 0;

  if (self->_state != 1 && !self->_tentativeSession && !self->_session)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    v4 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_223007000, v4, OS_LOG_TYPE_INFO, "Starting reader", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    id v5 = [getNFHardwareManagerClass() sharedHardwareManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__BCSNFCReader__startReading__block_invoke;
    v8[3] = &unk_26468B0C0;
    objc_copyWeak(&v9, buf);
    v8[4] = self;
    uint64_t v6 = [v5 startReaderSession:v8];
    tentativeSession = self->_tentativeSession;
    self->_tentativeSession = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __29__BCSNFCReader__startReading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__BCSNFCReader__startReading__block_invoke_2;
  v11[3] = &unk_26468B098;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v8 = v6;
  id v12 = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v14 = v10;
  [WeakRetained _performBlockOnQueue:v11];

  objc_destroyWeak(&v15);
}

void __29__BCSNFCReader__startReading__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[5];
    WeakRetained[5] = 0;

    uint64_t v5 = a1 + 32;
    if (*(void *)(a1 + 32))
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      id v6 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
        __29__BCSNFCReader__startReading__block_invoke_2_cold_1(v5, v6);
      }
      [v3 _setStateAndNotifyDelegate:8];
    }
    else
    {
      [*(id *)(a1 + 40) setDelegate:v3];
      v7 = v3 + 6;
      objc_storeStrong(v3 + 6, *(id *)(a1 + 40));
      if ([v3 _startPolling])
      {
        [v3 _setStateAndNotifyDelegate:2];
        uint64_t v8 = os_transaction_create();
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void **)(v9 + 80);
        *(void *)(v9 + 80) = v8;
      }
      else
      {
        [*(id *)(a1 + 40) endSession];
        v11 = *v7;
        uint64_t *v7 = 0;
      }
    }
  }
}

- (void)stopReading
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__BCSNFCReader_stopReading__block_invoke;
  block[3] = &unk_26468AE90;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__BCSNFCReader_stopReading__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isWaiting])
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    v2 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_223007000, v2, OS_LOG_TYPE_INFO, "Reader is waiting", v5, 2u);
    }
    return [*(id *)(a1 + 32) _stopReadingAndTransitionToState:7];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _stopReadingAndTransitionToState:0];
  }
}

- (void)_stopReadingAndTransitionToState:(int64_t)a3
{
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  uint64_t v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Stopping reader", v12, 2u);
  }
  [(NFSession *)self->_tentativeSession endSession];
  tentativeSession = self->_tentativeSession;
  self->_tentativeSession = 0;

  [(NFReaderSession *)self->_session endSession];
  session = self->_session;
  self->_session = 0;

  self->_sessionErrorCount = 0;
  self->_debouncedTagNotNDEFFormattedError = 0;
  [(NSTimer *)self->_reactivateTimer invalidate];
  reactivateTimer = self->_reactivateTimer;
  self->_reactivateTimer = 0;

  if (a3 == 7)
  {
    [(NSMutableArray *)self->_urlQueue removeAllObjects];
    transaction = self->_transaction;
    self->_transaction = 0;

LABEL_11:
    [(BCSNFCReader *)self _setStateAndNotifyDelegate:a3];
    return;
  }
  [(CPSClipRequest *)self->_clipRequest cancel];
  clipRequest = self->_clipRequest;
  self->_clipRequest = 0;

  if (a3 == 5) {
    goto LABEL_11;
  }
  [(NSMutableArray *)self->_urlQueue removeAllObjects];
  if (a3 == 6) {
    goto LABEL_11;
  }
  if (a3 == 9) {
    goto LABEL_11;
  }
  v11 = self->_transaction;
  self->_transaction = 0;

  if (a3 != 10) {
    goto LABEL_11;
  }
}

- (BOOL)_isWaiting
{
  return self->_clipRequest != 0;
}

- (BOOL)_startPolling
{
  session = self->_session;
  id v7 = 0;
  [(NFReaderSession *)session startPollingWithError:&v7];
  id v4 = v7;
  if (v4)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    uint64_t v5 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
      -[BCSNFCReader _startPolling](v5);
    }
    [(BCSNFCReader *)self _stopReadingAndTransitionToState:8];
  }

  return v4 == 0;
}

- (void)_stopPolling
{
  id v2 = a1;
  int64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to stop polling with error: %@", v6, v7, v8, v9, v10);
}

- (void)_restart
{
  int64_t state = self->_state;
  if (state == 2)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    uint64_t v5 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Restarting polling", v6, 2u);
    }
    [(BCSNFCReader *)self _startPolling];
  }
  else if (state == 9)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    uint64_t v4 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, v4, OS_LOG_TYPE_INFO, "Restarting reader due to repeated errors", buf, 2u);
    }
    [(BCSNFCReader *)self _startReading];
  }
}

- (void)_setStateAndNotifyDelegate:(int64_t)a3
{
  self->_int64_t state = a3;
  -[BCSNFCReaderDelegate nfcReaderStateDidChange:](self->_delegate, "nfcReaderStateDidChange:");
}

- (void)_performBlockOnQueue:(id)a3
{
}

- (void)dealloc
{
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  int64_t v3 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, v3, OS_LOG_TYPE_INFO, "Deallocating", buf, 2u);
  }
  [(BCSNFCReader *)self _stopReadingAndTransitionToState:10];
  v4.receiver = self;
  v4.super_class = (Class)BCSNFCReader;
  [(BCSNFCReader *)&v4 dealloc];
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BCSNFCReader_readerSession_didDetectTags___block_invoke;
  block[3] = &unk_26468B0E8;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__BCSNFCReader_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didDetectTags:*(void *)(a1 + 32)];
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  uint64_t v8 = (void *)readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
    -[BCSNFCReader readerSessionDidEndUnexpectedly:reason:](v8);
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__BCSNFCReader_readerSessionDidEndUnexpectedly_reason___block_invoke;
  block[3] = &unk_26468B0E8;
  objc_copyWeak(&v13, &location);
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__BCSNFCReader_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int64_t v3 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    id v5 = WeakRetained;

    if ([*(id *)(a1 + 32) code] == 5) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 8;
    }
    [v5 _stopReadingAndTransitionToState:v4];
    id WeakRetained = v5;
  }
}

- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BCSNFCReader_readerSession_externalReaderFieldNotification___block_invoke;
  block[3] = &unk_26468AE90;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__BCSNFCReader_readerSession_externalReaderFieldNotification___block_invoke(uint64_t a1)
{
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  id v2 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_223007000, v2, OS_LOG_TYPE_INFO, "Entered external reader field", v4, 2u);
  }
  return [*(id *)(a1 + 32) _stopReadingAndTransitionToState:4];
}

- (void)_didDetectTags:(id)a3
{
  uint64_t v4 = [a3 firstObject];
  if (v4 && [(BCSNFCReader *)self _readTag:v4] && [(NSMutableArray *)self->_urlQueue count]) {
    [(BCSNFCReader *)self _startProcessingURLs];
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)_readTag:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  id v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v47 = v4;
    _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Connecting to tag: %{private}@", buf, 0xCu);
  }
  session = self->_session;
  id v44 = 0;
  char v7 = [(NFReaderSession *)session connectTag:v4 error:&v44];
  id v8 = v44;
  if (v7)
  {
    id v9 = self->_session;
    id v43 = 0;
    id v10 = [(NFReaderSession *)v9 ndefReadWithError:&v43];
    id v11 = v43;
    BOOL v12 = v11 == 0;
    if (!v11)
    {
      int v17 = [v10 records];
      if (![v17 count])
      {
        if (readerLog_onceToken != -1) {
          dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
        }
        id v18 = readerLog_log;
        if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_223007000, v18, OS_LOG_TYPE_INFO, "Tag is empty", buf, 2u);
        }
      }
      v34 = 0;
      v37 = v10;
      v38 = self;
      id v35 = v8;
      id v36 = v4;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v40;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v40 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v23), "decode", v34);
            if (readerLog_onceToken != -1) {
              dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
            }
            v25 = readerLog_log;
            if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              id v47 = v24;
              _os_log_impl(&dword_223007000, v25, OS_LOG_TYPE_INFO, "Reading record with payload: %{private}@", buf, 0xCu);
            }
            v26 = objc_msgSend(NSURL, "_lp_URLWithUserTypedString:relativeToURL:", v24, 0);
            if (v26)
            {
              v27 = v26;
              v28 = [v26 scheme];
              id v29 = [v28 length] ? v27 : 0;

              if (v29)
              {
                if (readerLog_onceToken != -1) {
                  dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
                }
                v30 = readerLog_log;
                if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138477827;
                  id v47 = v29;
                  _os_log_impl(&dword_223007000, v30, OS_LOG_TYPE_INFO, "Parsed URL: %{private}@", buf, 0xCu);
                }
                urlQueue = v38->_urlQueue;
                v32 = [[BCSNFCReaderURLRecord alloc] initWithURL:v29 message:v37];
                [(NSMutableArray *)urlQueue addObject:v32];
              }
            }

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v21);
      }

      v38->_sessionErrorCount = 0;
      v38->_debouncedTagNotNDEFFormattedError = 0;
      [(BCSNFCReader *)v38 _disconnectTagAndBlockReadingUntilRemoved];

      id v8 = v35;
      id v4 = v36;
      BOOL v12 = v11 == 0;
      id v10 = v37;
      id v11 = v34;
      goto LABEL_51;
    }
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    id v13 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
      -[BCSNFCReader _readTag:](v13);
    }
    uint64_t v14 = [v11 code];
    uint64_t v15 = v14;
    if (v14 == 37)
    {
      if (self->_debouncedTagNotNDEFFormattedError)
      {
        [(BCSNFCReaderDelegate *)self->_delegate nfcReaderDidDetectNonNDEFTag];
        [(BCSNFCReader *)self _disconnectTagAndBlockReadingUntilRemoved];
LABEL_50:
        self->_debouncedTagNotNDEFFormattedError = 1;
        goto LABEL_51;
      }
    }
    else if (v14 == 49 || v14 == 28)
    {
      [(BCSNFCReader *)self _disconnectTagAndBlockReadingUntilRemoved];
      goto LABEL_51;
    }
    [(BCSNFCReader *)self _disconnectTag];
    [(BCSNFCReader *)self _restartPolling];
    if (v15 == 37) {
      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_52;
  }
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  v16 = (void *)readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
    -[BCSNFCReader _readTag:](v16);
  }
  [(BCSNFCReader *)self _restartPolling];
  BOOL v12 = 0;
LABEL_52:

  return v12;
}

- (void)_restartPolling
{
  [(BCSNFCReader *)self _stopPolling];
  int64_t sessionErrorCount = self->_sessionErrorCount;
  if (sessionErrorCount < 6) {
    self->_int64_t sessionErrorCount = sessionErrorCount + 1;
  }
  else {
    [(BCSNFCReader *)self _stopReadingAndTransitionToState:9];
  }
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_time(0, 100000000);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__BCSNFCReader__restartPolling__block_invoke;
  v6[3] = &unk_26468B110;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __31__BCSNFCReader__restartPolling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restart];
}

- (void)_disconnectTag
{
  id v2 = a1;
  int64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to disconnect from tag with error: %@", v6, v7, v8, v9, v10);
}

- (void)_disconnectTagAndBlockReadingUntilRemoved
{
  objc_initWeak(&location, self->_session);
  objc_initWeak(&from, self);
  disconnectQueue = self->_disconnectQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke;
  v4[3] = &unk_26468B138;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  dispatch_async(disconnectQueue, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke(uint64_t a1)
{
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  id v2 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, v2, OS_LOG_TYPE_INFO, "Waiting for tag removal", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = 0;
  [WeakRetained disconnectTagWithCardRemoval:&v11];
  id v4 = v11;

  if (v4)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    id v5 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
      __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_cold_1(v5, v4);
    }
  }
  else
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    id v6 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, v6, OS_LOG_TYPE_INFO, "Disconnected from tag", buf, 2u);
    }
  }
  uint64_t v7 = (id *)(a1 + 40);
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_34;
  v9[3] = &unk_26468B110;
  objc_copyWeak(&v10, v7);
  [v8 _performBlockOnQueue:v9];

  objc_destroyWeak(&v10);
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[2] == 2)
  {
    id v2 = WeakRetained;
    [WeakRetained _startPolling];
    id WeakRetained = v2;
  }
}

- (void)_startProcessingURLs
{
  [(BCSNFCReader *)self _stopReadingAndTransitionToState:5];
  [(BCSNFCReader *)self _processNextURL];
}

- (void)_processNextURL
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL __CPSClipsFeatureEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSNFCReader.m", 32, @"%s", dlerror());

  __break(1u);
}

void __31__BCSNFCReader__processNextURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__BCSNFCReader__processNextURL__block_invoke_2;
  v10[3] = &unk_26468B098;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v8 = v5;
  id v11 = v8;
  id v12 = *(id *)(a1 + 32);
  id v9 = v6;
  id v13 = v9;
  [WeakRetained _performBlockOnQueue:v10];

  objc_destroyWeak(&v14);
}

void __31__BCSNFCReader__processNextURL__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      int64_t v3 = readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_223007000, v3, OS_LOG_TYPE_INFO, "Clip is available", (uint8_t *)&v8, 2u);
      }
      [WeakRetained _didFindLink];
      [WeakRetained _requestAppClipForURLRecord:*(void *)(a1 + 40)];
    }
    else
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      id v4 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        id v5 = *(void **)(a1 + 48);
        id v6 = v4;
        uint64_t v7 = objc_msgSend(v5, "_bcs_privacyPreservingDescription");
        int v8 = 138543362;
        id v9 = v7;
        _os_log_impl(&dword_223007000, v6, OS_LOG_TYPE_INFO, "Clip is unavailable: %{public}@", (uint8_t *)&v8, 0xCu);
      }
      [WeakRetained _requestNotificationForURLRecord:*(void *)(a1 + 40)];
    }
  }
}

- (void)_requestAppClipForURLRecord:(id)a3
{
  id v4 = a3;
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  id v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Creating clip request", buf, 2u);
  }
  id v6 = +[BCSAnalyticsLogger sharedLogger];
  [v6 didScanNFCTagOfType:1];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  uint64_t v7 = (void *)getCPSClipRequestClass_softClass;
  uint64_t v28 = getCPSClipRequestClass_softClass;
  if (!getCPSClipRequestClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __getCPSClipRequestClass_block_invoke;
    uint64_t v23 = &unk_26468ACC8;
    v24 = &v25;
    __getCPSClipRequestClass_block_invoke((uint64_t)buf);
    uint64_t v7 = (void *)v26[3];
  }
  int v8 = v7;
  _Block_object_dispose(&v25, 8);
  id v9 = [v8 alloc];
  uint64_t v10 = [v4 url];
  id v11 = (CPSClipRequest *)[v9 initWithURL:v10];
  clipRequest = self->_clipRequest;
  self->_clipRequest = v11;

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  id v13 = (void *)getCPSSessionConfigurationClass_softClass;
  uint64_t v28 = getCPSSessionConfigurationClass_softClass;
  if (!getCPSSessionConfigurationClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __getCPSSessionConfigurationClass_block_invoke;
    uint64_t v23 = &unk_26468ACC8;
    v24 = &v25;
    __getCPSSessionConfigurationClass_block_invoke((uint64_t)buf);
    id v13 = (void *)v26[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v25, 8);
  uint64_t v15 = [v14 standardConfiguration];
  [v15 setOriginIsControlCenter:1];
  v16 = [(CPSClipRequest *)self->_clipRequest sessionProxy];
  [v16 setConfiguration:v15];

  objc_initWeak((id *)buf, self);
  int v17 = self->_clipRequest;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke;
  v18[3] = &unk_26468B1B0;
  objc_copyWeak(&v19, (id *)buf);
  [(CPSClipRequest *)v17 requestClipWithCompletion:v18];
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke_2;
  v9[3] = &unk_26468B188;
  objc_copyWeak(&v11, v6);
  char v12 = a2;
  id v8 = v5;
  id v10 = v8;
  [WeakRetained _performBlockOnQueue:v9];

  objc_destroyWeak(&v11);
}

void __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    int64_t v3 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v4 = @"YES";
      }
      else {
        id v4 = @"NO";
      }
      id v5 = *(void **)(a1 + 32);
      id v6 = v3;
      uint64_t v7 = objc_msgSend(v5, "_bcs_privacyPreservingDescription");
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      char v12 = v7;
      _os_log_impl(&dword_223007000, v6, OS_LOG_TYPE_INFO, "Clip request responded with available: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;

    [WeakRetained _scheduleReactivationWithDelay:*((double *)WeakRetained + 15)];
  }
}

- (void)_requestNotificationForURLRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  id v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Attempting to post notification", (uint8_t *)&buf, 2u);
  }
  id v6 = [v4 url];
  uint64_t v7 = +[BCSURLDataParser parseURL:v6];
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationService);
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    int v9 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      uint64_t v11 = [v7 type];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_223007000, v10, OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Detected NFC URL has type %ld", (uint8_t *)&buf, 0xCu);
    }
    char v12 = [BCSNFCCodePayload alloc];
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v13 = (void *)getNFCNDEFMessageClass_softClass;
    uint64_t v25 = getNFCNDEFMessageClass_softClass;
    if (!getNFCNDEFMessageClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v27 = __getNFCNDEFMessageClass_block_invoke;
      uint64_t v28 = &unk_26468ACC8;
      id v29 = &v22;
      __getNFCNDEFMessageClass_block_invoke((uint64_t)&buf);
      uint64_t v13 = (void *)v23[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v22, 8);
    uint64_t v15 = [v4 message];
    v16 = [v15 asData];
    int v17 = [v14 ndefMessageWithData:v16];
    id v18 = [(BCSNFCCodePayload *)v12 initWithNFCPayload:v17];

    objc_initWeak((id *)&buf, self);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke;
    v20[3] = &unk_26468B200;
    objc_copyWeak(&v21, (id *)&buf);
    v20[4] = self;
    [WeakRetained notifyParsedCodeWithData:v7 codePayload:v18 shouldReplacePreviousNotifications:0 reply:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)&buf);
  }
  else
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    id v19 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
      -[BCSNFCReader _requestNotificationForURLRecord:](v19);
    }
    [(BCSNFCReader *)self _processNextURL];
  }
}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2;
  v10[3] = &unk_26468B1D8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v8 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [WeakRetained _performBlockOnQueue:v10];

  objc_destroyWeak(&v13);
}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int64_t v3 = +[BCSAnalyticsLogger sharedLogger];
    [v3 didScanNFCTagOfType:0];

    uint64_t v4 = a1 + 32;
    if (*(void *)(a1 + 32))
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      id v5 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR)) {
        __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2_cold_1(v4, v5);
      }
      [WeakRetained _processNextURL];
    }
    else
    {
      if (readerLog_onceToken != -1) {
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      }
      id v6 = readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_223007000, v6, OS_LOG_TYPE_INFO, "URL is actionable", v7, 2u);
      }
      [WeakRetained _didFindLink];
      [WeakRetained _scheduleReactivationWithDelay:*(double *)(*(void *)(a1 + 40) + 112)];
    }
  }
}

- (void)_didFindLink
{
  if (readerLog_onceToken != -1) {
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  }
  int64_t v3 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_223007000, v3, OS_LOG_TYPE_INFO, "Found link", v4, 2u);
  }
  [(BCSNFCReader *)self _stopReadingAndTransitionToState:6];
}

- (void)_scheduleReactivationWithDelay:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0)
  {
    [(BCSNFCReader *)self _setStateAndNotifyDelegate:0];
  }
  else
  {
    if (readerLog_onceToken != -1) {
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    }
    id v5 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      double v13 = a3;
      _os_log_impl(&dword_223007000, v5, OS_LOG_TYPE_INFO, "Scheduling reactivation after %f seconds", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    id v6 = (void *)MEMORY[0x263EFFA20];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__BCSNFCReader__scheduleReactivationWithDelay___block_invoke;
    v10[3] = &unk_26468B228;
    objc_copyWeak(&v11, (id *)buf);
    uint64_t v7 = [v6 timerWithTimeInterval:0 repeats:v10 block:a3];
    reactivateTimer = self->_reactivateTimer;
    self->_reactivateTimer = v7;

    uint64_t v9 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v9 addTimer:self->_reactivateTimer forMode:*MEMORY[0x263EFF588]];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __47__BCSNFCReader__scheduleReactivationWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startReading];
}

- (BCSNotificationService)notificationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationService);
  return (BCSNotificationService *)WeakRetained;
}

- (void)setNotificationService:(id)a3
{
}

- (double)postNotificationReactivationDelay
{
  return self->_postNotificationReactivationDelay;
}

- (void)setPostNotificationReactivationDelay:(double)a3
{
  self->_postNotificationReactivationDelay = a3;
}

- (double)dismissProxCardReactivationDelay
{
  return self->_dismissProxCardReactivationDelay;
}

- (void)setDismissProxCardReactivationDelay:(double)a3
{
  self->_dismissProxCardReactivationDelay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationService);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_reactivateTimer, 0);
  objc_storeStrong((id *)&self->_clipRequest, 0);
  objc_storeStrong((id *)&self->_urlQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_tentativeSession, 0);
  objc_storeStrong((id *)&self->_disconnectQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  int64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to determine hardware support state with error: %@", v6, v7, v8, v9, v10);
}

void __29__BCSNFCReader__startReading__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v5, v6, "Failed to start reader session with error: %@", v7, v8, v9, v10, v11);
}

- (void)_startPolling
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to start polling with error: %@", v6, v7, v8, v9, v10);
}

- (void)readerSessionDidEndUnexpectedly:(void *)a1 reason:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Reader session ended unexpectedly: %@", v6, v7, v8, v9, v10);
}

- (void)_readTag:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to read tag with error: %@", v6, v7, v8, v9, v10);
}

- (void)_readTag:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v4, v5, "Failed to connect to tag with error: %@", v6, v7, v8, v9, v10);
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_223007000, v3, OS_LOG_TYPE_ERROR, "Failed to disconnect and wait for tag removal with error: %@", v5, 0xCu);
}

- (void)_requestNotificationForURLRecord:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_223007000, log, OS_LOG_TYPE_ERROR, "BCSURLDataParser does not recognize NFC URL", v1, 2u);
}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_223007000, v5, v6, "Failed to post notification for URL with error: %@", v7, v8, v9, v10, v11);
}

@end