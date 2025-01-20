@interface AVFoundationEngine
+ (id)sharedEngine;
- (AVFoundationEngine)initWithQueue:(id)a3;
- (BOOL)isOperationActive:(id)a3;
- (BOOL)registerForOperation:(id)a3 activateAttentionDetection:(BOOL)a4 activateEyeRelief:(BOOL)a5 activatePersonDetection:(BOOL)a6 identifier:(id)a7;
- (BOOL)unregisterForOperation:(id)a3;
- (id)_getQueue;
- (id)startOperationForReceiver:(id)a3 reply:(id)a4;
- (void)_startSession;
- (void)_stopSession;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6;
- (void)handleNotification:(id)a3 notification:(id)a4;
- (void)setupNotificationsForCenter;
@end

@implementation AVFoundationEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_stopSession
{
  self->_sessionRunning = 0;
}

- (void)_startSession
{
  self->_sessionRunning = 1;
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_spoofedNotification)
  {
    [(AVFoundationEngine *)self handleNotification:*MEMORY[0x1E4F15988] notification:0];
    self->_spoofedNotification = 1;
  }
  uint64_t v10 = [v8 count];
  if (!v9 || v10)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v8;
    uint64_t v18 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v11);
          }
          uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          receivers = self->_receivers;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke_68;
          v24[3] = &unk_1E606A4D8;
          v24[4] = v22;
          v24[5] = self;
          [(NSMutableDictionary *)receivers enumerateKeysAndObjectsUsingBlock:v24];
        }
        uint64_t v19 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v19);
    }
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v17 = self->_receivers;
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
          v29[3] = &unk_1E606A4D8;
          v29[4] = v16;
          v29[5] = self;
          [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v29];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
  }
}

void __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 receiver];
  if ([v4 activateAttentionDetection])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 == *MEMORY[0x1E4F15E30])
    {
      if ([v4 running])
      {
        if (!*(unsigned char *)(*(void *)(a1 + 40) + 85))
        {
          v7 = _AALog();
          id v8 = _AALog();
          os_signpost_id_t v9 = os_signpost_id_generate(v8);

          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v7, OS_SIGNPOST_EVENT, v9, "AA - Received frame of face detect data", (const char *)&unk_1B3B8868B, buf, 2u);
          }

          *(unsigned char *)(*(void *)(a1 + 40) + 85) = 1;
        }
        [v5 receiveMetadata:0 type:v6];
      }
    }
  }
  if ([v4 activateEyeRelief])
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10 == *MEMORY[0x1E4F15E28])
    {
      if ([v4 running])
      {
        if (!*(unsigned char *)(*(void *)(a1 + 40) + 85))
        {
          id v11 = _AALog();
          uint64_t v12 = _AALog();
          os_signpost_id_t v13 = os_signpost_id_generate(v12);

          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
          {
            *(_WORD *)uint64_t v14 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v11, OS_SIGNPOST_EVENT, v13, "AA - Received frame of EyeRelief data", (const char *)&unk_1B3B8868B, v14, 2u);
          }

          *(unsigned char *)(*(void *)(a1 + 40) + 85) = 1;
        }
        [v5 receiveMetadata:0 type:v10];
      }
    }
  }
}

void __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 receiver];
  if ([v4 activateAttentionDetection])
  {
    uint64_t v6 = [*(id *)(a1 + 32) type];
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E4F15E30])
    {
      int v8 = [v4 running];

      if (v8)
      {
        if (!*(unsigned char *)(*(void *)(a1 + 40) + 85))
        {
          os_signpost_id_t v9 = _AALog();
          uint64_t v10 = _AALog();
          os_signpost_id_t v11 = os_signpost_id_generate(v10);

          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v9, OS_SIGNPOST_EVENT, v11, "AA - Received frame of face detect data", (const char *)&unk_1B3B8868B, buf, 2u);
          }

          *(unsigned char *)(*(void *)(a1 + 40) + 85) = 1;
        }
        [v5 receiveMetadata:*(void *)(a1 + 32) type:v7];
      }
    }
    else
    {
    }
  }
  if ([v4 activateEyeRelief])
  {
    uint64_t v12 = [*(id *)(a1 + 32) type];
    os_signpost_id_t v13 = v12;
    if (v12 == (void *)*MEMORY[0x1E4F15E28])
    {
      int v14 = [v4 running];

      if (v14)
      {
        if (!*(unsigned char *)(*(void *)(a1 + 40) + 85))
        {
          v15 = _AALog();
          uint64_t v16 = _AALog();
          os_signpost_id_t v17 = os_signpost_id_generate(v16);

          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
          {
            *(_WORD *)uint64_t v18 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v15, OS_SIGNPOST_EVENT, v17, "AA - Received frame of EyeRelief data", (const char *)&unk_1B3B8868B, v18, 2u);
          }

          *(unsigned char *)(*(void *)(a1 + 40) + 85) = 1;
        }
        [v5 receiveMetadata:*(void *)(a1 + 32) type:v13];
      }
    }
    else
    {
    }
  }
}

- (void)handleNotification:(id)a3 notification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  receivers = self->_receivers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AVFoundationEngine_handleNotification_notification___block_invoke;
  v11[3] = &unk_1E606A4B0;
  id v12 = v6;
  os_signpost_id_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableDictionary *)receivers enumerateKeysAndObjectsUsingBlock:v11];
}

void __54__AVFoundationEngine_handleNotification_notification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 receiver];
  if ([*(id *)(a1 + 32) isEqual:*MEMORY[0x1E4F159D0]])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__AVFoundationEngine_handleNotification_notification___block_invoke_2;
    block[3] = &unk_1E606AC70;
    block[4] = v5;
    dispatch_async(v6, block);
  }
  [v4 receiveNotificationOfName:*(void *)(a1 + 32) notification:*(void *)(a1 + 48)];
}

uint64_t __54__AVFoundationEngine_handleNotification_notification___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isRunning];
  if ((result & 1) == 0)
  {
    if (currentLogLevel == 5)
    {
      v3 = _AALog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = absTimeNS();
        if (v4 == -1) {
          double v5 = INFINITY;
        }
        else {
          double v5 = (double)v4 / 1000000000.0;
        }
        *(_DWORD *)os_signpost_id_t v13 = 134217984;
        *(double *)&v13[4] = v5;
        id v10 = "%13.5f: Session was interrupted before it got started, calling stop on the session immediately";
        os_signpost_id_t v11 = v3;
        uint32_t v12 = 12;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v13, v12);
      }
    }
    else
    {
      if (currentLogLevel < 6) {
        return objc_msgSend(*(id *)(a1 + 32), "_stopSession", *(_OWORD *)v13, *(_OWORD *)&v13[16]);
      }
      v3 = _AALog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            id v6 = i;
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
            *(_DWORD *)os_signpost_id_t v13 = 136315650;
            *(void *)&v13[4] = v6;
            *(_WORD *)&v13[12] = 1024;
            *(_DWORD *)&v13[14] = 409;
            *(_WORD *)&v13[18] = 2048;
            *(double *)&v13[20] = v9;
            id v10 = "%30s:%-4d: %13.5f: Session was interrupted before it got started, calling stop on the session immediately";
            os_signpost_id_t v11 = v3;
            uint32_t v12 = 28;
            goto LABEL_20;
          }
        }
      }
    }

    return objc_msgSend(*(id *)(a1 + 32), "_stopSession", *(_OWORD *)v13, *(_OWORD *)&v13[16]);
  }
  return result;
}

- (void)setupNotificationsForCenter
{
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  uint64_t v4 = *MEMORY[0x1E4F159C8];
  session = self->_session;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke;
  v31[3] = &unk_1E606A488;
  objc_copyWeak(&v32, &location);
  id v6 = [(NSNotificationCenter *)notificationCenter addObserverForName:v4 object:session queue:0 usingBlock:v31];
  id v7 = self->_notificationCenter;
  uint64_t v8 = *MEMORY[0x1E4F15988];
  double v9 = self->_session;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_3;
  v29[3] = &unk_1E606A488;
  objc_copyWeak(&v30, &location);
  id v10 = [(NSNotificationCenter *)v7 addObserverForName:v8 object:v9 queue:0 usingBlock:v29];
  os_signpost_id_t v11 = self->_notificationCenter;
  uint64_t v12 = *MEMORY[0x1E4F15990];
  os_signpost_id_t v13 = self->_session;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_64;
  v27[3] = &unk_1E606A488;
  objc_copyWeak(&v28, &location);
  id v14 = [(NSNotificationCenter *)v11 addObserverForName:v12 object:v13 queue:0 usingBlock:v27];
  v15 = self->_notificationCenter;
  uint64_t v16 = *MEMORY[0x1E4F159D0];
  os_signpost_id_t v17 = self->_session;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_66;
  v25[3] = &unk_1E606A488;
  objc_copyWeak(&v26, &location);
  id v18 = [(NSNotificationCenter *)v15 addObserverForName:v16 object:v17 queue:0 usingBlock:v25];
  uint64_t v19 = self->_notificationCenter;
  uint64_t v20 = *MEMORY[0x1E4F159A0];
  v21 = self->_session;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_4;
  v23[3] = &unk_1E606A488;
  objc_copyWeak(&v24, &location);
  id v22 = [(NSNotificationCenter *)v19 addObserverForName:v20 object:v21 queue:0 usingBlock:v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  double v5 = [WeakRetained _getQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2;
  v7[3] = &unk_1E606A548;
  objc_copyWeak(&v9, a1);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
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
      *(_DWORD *)buf = 134217984;
      double v22 = v6;
      os_signpost_id_t v11 = "%13.5f: Session STARTED running!";
      uint64_t v12 = v4;
      uint32_t v13 = 12;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v7 = i;
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
          *(_DWORD *)buf = 136315650;
          double v22 = *(double *)&v7;
          __int16 v23 = 1024;
          int v24 = 367;
          __int16 v25 = 2048;
          double v26 = v10;
          os_signpost_id_t v11 = "%30s:%-4d: %13.5f: Session STARTED running!";
          uint64_t v12 = v4;
          uint32_t v13 = 28;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  id v14 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v14);
  uint64_t v16 = [WeakRetained _getQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_63;
  v18[3] = &unk_1E606A548;
  objc_copyWeak(&v20, v14);
  id v19 = v3;
  id v17 = v3;
  dispatch_async(v16, v18);

  objc_destroyWeak(&v20);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_64(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
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
      *(_DWORD *)buf = 134217984;
      double v22 = v6;
      os_signpost_id_t v11 = "%13.5f: Session STOPPED running!";
      uint64_t v12 = v4;
      uint32_t v13 = 12;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          id v7 = i;
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
          *(_DWORD *)buf = 136315650;
          double v22 = *(double *)&v7;
          __int16 v23 = 1024;
          int v24 = 374;
          __int16 v25 = 2048;
          double v26 = v10;
          os_signpost_id_t v11 = "%30s:%-4d: %13.5f: Session STOPPED running!";
          uint64_t v12 = v4;
          uint32_t v13 = 28;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  id v14 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v14);
  uint64_t v16 = [WeakRetained _getQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_65;
  v18[3] = &unk_1E606A548;
  objc_copyWeak(&v20, v14);
  id v19 = v3;
  id v17 = v3;
  dispatch_async(v16, v18);

  objc_destroyWeak(&v20);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_66(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  unint64_t v5 = [WeakRetained _getQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_3_67;
  v7[3] = &unk_1E606A548;
  objc_copyWeak(&v9, a1);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  unint64_t v5 = [WeakRetained _getQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_5;
  v7[3] = &unk_1E606A548;
  objc_copyWeak(&v9, a1);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleNotification:*MEMORY[0x1E4F159A0] notification:*(void *)(a1 + 32)];
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_3_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleNotification:*MEMORY[0x1E4F159D0] notification:*(void *)(a1 + 32)];
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleNotification:*MEMORY[0x1E4F15990] notification:*(void *)(a1 + 32)];
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_63(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleNotification:*MEMORY[0x1E4F15988] notification:*(void *)(a1 + 32)];
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleNotification:*MEMORY[0x1E4F159C8] notification:*(void *)(a1 + 32)];
}

- (id)_getQueue
{
  return self->_queue;
}

- (id)startOperationForReceiver:(id)a3 reply:(id)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__1040;
  v56[4] = __Block_byref_object_dispose__1041;
  id v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__1040;
  v54[4] = __Block_byref_object_dispose__1041;
  id v55 = [MEMORY[0x1E4F1CA48] array];
  receivers = self->_receivers;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke;
  v53[3] = &unk_1E606A410;
  v53[4] = self;
  v53[5] = &v66;
  v53[6] = &v62;
  [(NSMutableDictionary *)receivers enumerateKeysAndObjectsUsingBlock:v53];
  id v9 = [(NSMutableDictionary *)self->_receivers objectForKey:v6];
  int v10 = [v9 running];

  if (v10)
  {
    os_signpost_id_t v11 = v67;
    int v12 = *((unsigned __int8 *)v67 + 24);
    uint32_t v13 = v63;
    if (self->_shouldRunEyeRelief == v12 && self->_shouldRunAttentionDetect == *((unsigned __int8 *)v63 + 24))
    {
      [(NSMutableDictionary *)self->_receivers removeObjectForKey:v6];
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F28568];
      v77[0] = @" Client already started an operation with the same options";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      uint64_t v16 = [v14 errorWithDomain:*MEMORY[0x1E4F28798] code:17 userInfo:v15];

      goto LABEL_17;
    }
    self->_shouldRunEyeRelief = v12;
    self->_shouldRunAttentionDetect = *((unsigned char *)v13 + 24);
    *((unsigned char *)v59 + 24) = 1;
    goto LABEL_15;
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  id v17 = self->_receivers;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_2;
  v48[3] = &unk_1E606A438;
  v48[4] = &v49;
  [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v48];
  if (*((unsigned char *)v50 + 24))
  {
    if (self->_shouldRunEyeRelief == *((unsigned __int8 *)v67 + 24)
      && self->_shouldRunAttentionDetect == *((unsigned __int8 *)v63 + 24))
    {
      if (currentLogLevel == 5)
      {
        id v18 = _AALog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v19 = absTimeNS();
          if (v19 == -1) {
            double v20 = INFINITY;
          }
          else {
            double v20 = (double)v19 / 1000000000.0;
          }
          *(_DWORD *)buf = 134218242;
          double v71 = v20;
          __int16 v72 = 2112;
          *(void *)v73 = v6;
          id v28 = "%13.5f: Session that is already running has the same options that was requested by %@, not restarting session";
          v29 = v18;
          uint32_t v30 = 22;
LABEL_34:
          _os_log_impl(&dword_1B3B4B000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
        }
      }
      else
      {
        if (currentLogLevel < 6)
        {
LABEL_36:
          long long v31 = [(NSMutableDictionary *)self->_receivers objectForKey:v6];
          [v31 setRunning:1];
          sessionQueue = self->_sessionQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_54;
          block[3] = &unk_1E606A658;
          block[4] = self;
          v47 = v56;
          id v46 = v7;
          dispatch_async(sessionQueue, block);
          long long v33 = [v31 receiver];
          [v33 receiveNotificationOfName:*MEMORY[0x1E4F15988] notification:0];

          _Block_object_dispose(&v49, 8);
          goto LABEL_16;
        }
        id v18 = _AALog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
          for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
                ;
                ++i)
          {
            if (*(i - 1) == 47)
            {
              int v24 = i;
            }
            else if (!*(i - 1))
            {
              unint64_t v26 = absTimeNS();
              if (v26 == -1) {
                double v27 = INFINITY;
              }
              else {
                double v27 = (double)v26 / 1000000000.0;
              }
              *(_DWORD *)buf = 136315906;
              double v71 = *(double *)&v24;
              __int16 v72 = 1024;
              *(_DWORD *)v73 = 266;
              *(_WORD *)&v73[4] = 2048;
              *(double *)&v73[6] = v27;
              __int16 v74 = 2112;
              id v75 = v6;
              id v28 = "%30s:%-4d: %13.5f: Session that is already running has the same options that was requested by %@, no"
                    "t restarting session";
              v29 = v18;
              uint32_t v30 = 38;
              goto LABEL_34;
            }
          }
        }
      }

      goto LABEL_36;
    }
    *((unsigned char *)v59 + 24) = 1;
  }
  _Block_object_dispose(&v49, 8);
  os_signpost_id_t v11 = v67;
  uint32_t v13 = v63;
LABEL_15:
  self->_shouldRunEyeRelief = *((unsigned char *)v11 + 24);
  self->_shouldRunAttentionDetect = *((unsigned char *)v13 + 24);
  v21 = self->_sessionQueue;
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  uint64_t v36 = __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_2_58;
  v37 = &unk_1E606A460;
  v40 = &v58;
  v38 = self;
  v41 = &v66;
  v42 = v54;
  v43 = &v62;
  v44 = v56;
  id v39 = v7;
  dispatch_async(v21, &v34);
  double v22 = -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", v6, v34, v35, v36, v37, v38);
  [v22 setRunning:1];

LABEL_16:
  uint64_t v16 = 0;
LABEL_17:
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  return v16;
}

void __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) |= [v4 activateEyeRelief];
  if (*(unsigned char *)(a1[4] + 83)) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  else {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= [v4 activateAttentionDetection];
  }
}

uint64_t __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 running];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

uint64_t __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_54(uint64_t result)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 86))
  {
    uint64_t v1 = result;
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F28798];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Session was not Running";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v5 = [v2 errorWithDomain:v3 code:1 userInfo:v4];
    uint64_t v6 = *(void *)(*(void *)(v1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __54__AVFoundationEngine_startOperationForReceiver_reply___block_invoke_2_58(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
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
        *(_DWORD *)buf = 134217984;
        double v55 = v4;
        id v9 = "%13.5f: Options have changed, restarting AVFCapture session with new options";
        int v10 = v2;
        uint32_t v11 = 12;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      if (currentLogLevel < 6)
      {
LABEL_22:
        [*(id *)(a1 + 32) _stopSession];
        goto LABEL_23;
      }
      v2 = _AALog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v5 = i;
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
            *(_DWORD *)buf = 136315650;
            double v55 = *(double *)&v5;
            __int16 v56 = 1024;
            *(_DWORD *)id v57 = 297;
            *(_WORD *)&v57[4] = 2048;
            *(double *)&v57[6] = v8;
            id v9 = "%30s:%-4d: %13.5f: Options have changed, restarting AVFCapture session with new options";
            int v10 = v2;
            uint32_t v11 = 28;
            goto LABEL_20;
          }
        }
      }
    }

    goto LABEL_22;
  }
LABEL_23:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:*MEMORY[0x1E4F15E28]];
  }
  int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  id v13 = *(id *)(*(void *)(a1 + 32) + 48);
  int v14 = [v13 isAttentionDetectionSupported];
  if (v12)
  {
    if (v14) {
      [v13 setAttentionDetectionEnabled:1];
    }

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:*MEMORY[0x1E4F15E30]];
  }
  else
  {
    if (v14) {
      [v13 setAttentionDetectionEnabled:0];
    }
  }
  if (currentLogLevel == 5)
  {
    v15 = _AALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = absTimeNS();
      if (v16 == -1) {
        double v17 = INFINITY;
      }
      else {
        double v17 = (double)v16 / 1000000000.0;
      }
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      double v55 = v17;
      __int16 v56 = 2112;
      *(void *)id v57 = v22;
      __int16 v23 = "%13.5f: Asking for metadata types: %@";
      int v24 = v15;
      uint32_t v25 = 22;
LABEL_50:
      _os_log_impl(&dword_1B3B4B000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_52;
    }
    v15 = _AALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
      for (uint64_t j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
            ;
            ++j)
      {
        if (*(j - 1) == 47)
        {
          id v18 = j;
        }
        else if (!*(j - 1))
        {
          unint64_t v20 = absTimeNS();
          if (v20 == -1) {
            double v21 = INFINITY;
          }
          else {
            double v21 = (double)v20 / 1000000000.0;
          }
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 136315906;
          double v55 = *(double *)&v18;
          __int16 v56 = 1024;
          *(_DWORD *)id v57 = 316;
          *(_WORD *)&v57[4] = 2048;
          *(double *)&v57[6] = v21;
          *(_WORD *)&v57[14] = 2112;
          *(void *)&v57[16] = v26;
          __int16 v23 = "%30s:%-4d: %13.5f: Asking for metadata types: %@";
          int v24 = v15;
          uint32_t v25 = 38;
          goto LABEL_50;
        }
      }
    }
  }

LABEL_52:
  [*(id *)(*(void *)(a1 + 32) + 48) setMetadataObjectTypes:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  double v27 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
  obuint64_t j = *(id *)(v28 + 40);
  char v29 = [v27 lockForConfiguration:&obj];
  objc_storeStrong((id *)(v28 + 40), obj);
  if (v29)
  {
    CMTimeMake(&v50, 1, 15);
    uint32_t v30 = *(void **)(*(void *)(a1 + 32) + 24);
    CMTime v49 = v50;
    [v30 setActiveVideoMinFrameDuration:&v49];
    CMTimeMake(&v48, 1, 15);
    long long v31 = *(void **)(*(void *)(a1 + 32) + 24);
    CMTime v47 = v48;
    [v31 setActiveVideoMaxFrameDuration:&v47];
    [*(id *)(*(void *)(a1 + 32) + 24) unlockForConfiguration];
    *(unsigned char *)(*(void *)(a1 + 32) + 85) = 0;
    id v32 = _AALog();
    long long v33 = _AALog();
    os_signpost_id_t v34 = os_signpost_id_generate(v33);

    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3B4B000, v32, OS_SIGNPOST_EVENT, v34, "AA - Calling startRunning", (const char *)&unk_1B3B8868B, buf, 2u);
    }

    return [*(id *)(a1 + 32) _startSession];
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v36 = _AALog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        unint64_t v43 = absTimeNS();
        if (v43 == -1) {
          double v44 = INFINITY;
        }
        else {
          double v44 = (double)v43 / 1000000000.0;
        }
        uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 24);
        uint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 134218498;
        double v55 = v44;
        __int16 v56 = 2112;
        *(void *)id v57 = v45;
        *(_WORD *)&v57[8] = 2112;
        *(void *)&v57[10] = v46;
        _os_log_error_impl(&dword_1B3B4B000, v36, OS_LOG_TYPE_ERROR, "%13.5f: Could not lock configuration for device %@ error: %@", buf, 0x20u);
      }
    }
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28798];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    v53 = @"Could not lock device configuration to set frame rate";
    id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v40 = [v37 errorWithDomain:v38 code:16 userInfo:v39];
    uint64_t v41 = *(void *)(*(void *)(a1 + 80) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)isOperationActive:(id)a3
{
  if (!self->_session) {
    return 0;
  }
  unint64_t v3 = [(NSMutableDictionary *)self->_receivers objectForKey:a3];
  char v4 = [v3 running];

  return v4;
}

- (BOOL)unregisterForOperation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_receivers objectForKey:v4];

  if (!v5) {
    goto LABEL_24;
  }
  [(NSMutableDictionary *)self->_receivers removeObjectForKey:v4];
  if (currentLogLevel == 5)
  {
    uint64_t v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      id v13 = [(NSMutableDictionary *)self->_receivers allKeys];
      *(_DWORD *)buf = 134218498;
      double v21 = v8;
      __int16 v22 = 2112;
      *(void *)__int16 v23 = v4;
      *(_WORD *)&v23[8] = 2112;
      *(void *)&v23[10] = v13;
      int v14 = "%13.5f: Unregistering receiver %@, remaining receivers: %@";
      v15 = v6;
      uint32_t v16 = 32;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_22;
    }
    uint64_t v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
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
          id v13 = [(NSMutableDictionary *)self->_receivers allKeys];
          *(_DWORD *)buf = 136316162;
          double v21 = *(double *)&v9;
          __int16 v22 = 1024;
          *(_DWORD *)__int16 v23 = 162;
          *(_WORD *)&void v23[4] = 2048;
          *(double *)&v23[6] = v12;
          *(_WORD *)&v23[14] = 2112;
          *(void *)&v23[16] = v4;
          __int16 v24 = 2112;
          uint32_t v25 = v13;
          int v14 = "%30s:%-4d: %13.5f: Unregistering receiver %@, remaining receivers: %@";
          v15 = v6;
          uint32_t v16 = 48;
          goto LABEL_20;
        }
      }
    }
  }

LABEL_22:
  if (![(NSMutableDictionary *)self->_receivers count])
  {
    sessionQueue = self->_sessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AVFoundationEngine_unregisterForOperation___block_invoke;
    block[3] = &unk_1E606AC70;
    block[4] = self;
    dispatch_async(sessionQueue, block);
    [(AVFoundationEngine *)self handleNotification:*MEMORY[0x1E4F15990] notification:0];
    self->_spoofedNotification = 0;
  }
LABEL_24:

  return v5 != 0;
}

uint64_t __45__AVFoundationEngine_unregisterForOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSession];
}

- (BOOL)registerForOperation:(id)a3 activateAttentionDetection:(BOOL)a4 activateEyeRelief:(BOOL)a5 activatePersonDetection:(BOOL)a6 identifier:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = [[AVFoundationReceiver alloc] initForReceiver:v12 activateAttentionDetection:v10 activateEyeRelief:v9 activatePersonDetection:v8];
  if (v14)
  {
    [(NSMutableDictionary *)self->_receivers setObject:v14 forKey:v13];
    if (currentLogLevel == 5)
    {
      v15 = _AALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        int v26 = 134218242;
        double v27 = v17;
        __int16 v28 = 2112;
        *(void *)char v29 = v12;
        __int16 v22 = "%13.5f: Registered receiver %@ for AVFoundation operation";
        __int16 v23 = v15;
        uint32_t v24 = 22;
LABEL_20:
        _os_log_impl(&dword_1B3B4B000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, v24);
      }
LABEL_21:

      goto LABEL_22;
    }
    if (currentLogLevel >= 6)
    {
      v15 = _AALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationEngine.m";
              ;
              ++i)
        {
          if (*(i - 1) == 47)
          {
            id v18 = i;
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
            int v26 = 136315906;
            double v27 = *(double *)&v18;
            __int16 v28 = 1024;
            *(_DWORD *)char v29 = 152;
            *(_WORD *)&void v29[4] = 2048;
            *(double *)&void v29[6] = v21;
            __int16 v30 = 2112;
            id v31 = v12;
            __int16 v22 = "%30s:%-4d: %13.5f: Registered receiver %@ for AVFoundation operation";
            __int16 v23 = v15;
            uint32_t v24 = 38;
            goto LABEL_20;
          }
        }
      }
      goto LABEL_21;
    }
  }
LABEL_22:

  return v14 != 0;
}

- (AVFoundationEngine)initWithQueue:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)AVFoundationEngine;
  uint64_t v6 = [(AVFoundationEngine *)&v55 init];
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v6->_queue, a3);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.AttentionAwareness.AVCaptureSession", 0);
  sessionQueue = v7->_sessionQueue;
  v7->_sessionQueue = (OS_dispatch_queue *)v8;

  v7->_sessionRunning = 0;
  *(_WORD *)&v7->_shouldRunAttentionDetect = 0;
  v7->_shouldRunPersonDetection = 0;
  *(_WORD *)&v7->_spoofedNotification = 0;
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AttentionAwareness"];
  v7->_demoMode = [v10 BOOLForKey:@"demoMode"];
  id v11 = (id)*MEMORY[0x1E4F15BE8];
  v62[0] = *MEMORY[0x1E4F157F8];
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  if (currentLogLevel == 5)
  {
    id v13 = _AALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = absTimeNS();
      if (v14 == -1) {
        double v15 = INFINITY;
      }
      else {
        double v15 = (double)v14 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218498;
      double v57 = v15;
      __int16 v58 = 2112;
      *(void *)v59 = v12;
      *(_WORD *)&v59[8] = 2112;
      *(void *)&v59[10] = v11;
      unint64_t v20 = "%13.5f: Looking for device of type %@ and media type %@";
      double v21 = v13;
      uint32_t v22 = 32;
LABEL_20:
      _os_log_impl(&dword_1B3B4B000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      goto LABEL_22;
    }
    id v13 = _AALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationHelper.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/AVFoundationEngine/AVFoundationHelper.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          unint64_t v16 = i;
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
          *(_DWORD *)buf = 136316162;
          double v57 = *(double *)&v16;
          __int16 v58 = 1024;
          *(_DWORD *)v59 = 28;
          *(_WORD *)&v59[4] = 2048;
          *(double *)&v59[6] = v19;
          *(_WORD *)&v59[14] = 2112;
          *(void *)&v59[16] = v12;
          __int16 v60 = 2112;
          id v61 = v11;
          unint64_t v20 = "%30s:%-4d: %13.5f: Looking for device of type %@ and media type %@";
          double v21 = v13;
          uint32_t v22 = 48;
          goto LABEL_20;
        }
      }
    }
  }

LABEL_22:
  __int16 v23 = [MEMORY[0x1E4F16448] discoverySessionWithDeviceTypes:v12 mediaType:v11 position:0];
  uint32_t v24 = [v23 devices];
  uint64_t v25 = [v24 firstObject];

  device = v7->_device;
  v7->_device = (AVCaptureDevice *)v25;

  if (!v7->_device)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v45 = _AALog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v46 = absTimeNS();
        if (v46 == -1) {
          double v47 = INFINITY;
        }
        else {
          double v47 = (double)v46 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v57 = v47;
        v54 = "%13.5f: Unable to obtain device for streaming";
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    goto LABEL_57;
  }
  double v27 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E4F16498]);
  session = v7->_session;
  v7->_session = v27;

  if (!v7->_session)
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v45 = _AALog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v48 = absTimeNS();
        if (v48 == -1) {
          double v49 = INFINITY;
        }
        else {
          double v49 = (double)v48 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v57 = v49;
        v54 = "%13.5f: Unable to obtain session for streaming";
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    goto LABEL_57;
  }
  char v29 = (objc_class *)MEMORY[0x1E4F16450];
  __int16 v30 = v7->_device;
  uint64_t v31 = [[v29 alloc] initWithDevice:v30 error:0];

  input = v7->_input;
  v7->_input = (AVCaptureDeviceInput *)v31;

  if (![(AVCaptureSession *)v7->_session canAddInput:v7->_input])
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v45 = _AALog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v50 = absTimeNS();
        if (v50 == -1) {
          double v51 = INFINITY;
        }
        else {
          double v51 = (double)v50 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v57 = v51;
        v54 = "%13.5f: Unable to add input to session";
        goto LABEL_55;
      }
LABEL_56:
    }
LABEL_57:

    unint64_t v43 = 0;
    goto LABEL_30;
  }
  [(AVCaptureSession *)v7->_session addInput:v7->_input];
  queue = v7->_queue;
  os_signpost_id_t v34 = v7;
  uint64_t v35 = queue;
  uint64_t v36 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x1E4F16460]);
  v37 = v36;
  if (v35) {
    [(AVCaptureMetadataOutput *)v36 setMetadataObjectsDelegate:v34 queue:v35];
  }

  metadataOutput = v34->_metadataOutput;
  v34->_metadataOutput = v37;

  if (![(AVCaptureSession *)v7->_session canAddOutput:v34->_metadataOutput])
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v45 = _AALog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v52 = absTimeNS();
        if (v52 == -1) {
          double v53 = INFINITY;
        }
        else {
          double v53 = (double)v52 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v57 = v53;
        v54 = "%13.5f: Unable to add output to session";
LABEL_55:
        _os_log_error_impl(&dword_1B3B4B000, v45, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
        goto LABEL_56;
      }
      goto LABEL_56;
    }
    goto LABEL_57;
  }
  [(AVCaptureSession *)v7->_session addOutput:v34->_metadataOutput];
  uint64_t v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
  notificationCenter = v34->_notificationCenter;
  v34->_notificationCenter = (NSNotificationCenter *)v39;

  [(AVFoundationEngine *)v34 setupNotificationsForCenter];
  uint64_t v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  receivers = v34->_receivers;
  v34->_receivers = v41;

LABEL_29:
  unint64_t v43 = v7;
LABEL_30:

  return v43;
}

+ (id)sharedEngine
{
  if (sharedEngine_onceToken != -1) {
    dispatch_once(&sharedEngine_onceToken, &__block_literal_global_1074);
  }
  v2 = (void *)sharedEngine_engine;

  return v2;
}

void __34__AVFoundationEngine_sharedEngine__block_invoke()
{
  v0 = [AVFoundationEngine alloc];
  awQueue(1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(AVFoundationEngine *)v0 initWithQueue:v3];
  v2 = (void *)sharedEngine_engine;
  sharedEngine_engine = v1;
}

@end