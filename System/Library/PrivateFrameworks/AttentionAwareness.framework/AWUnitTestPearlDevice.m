@interface AWUnitTestPearlDevice
+ (id)sharedAVFoundationSession;
+ (id)sharedDevice;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleStatsPtr;
- (AWUnitTestPearlDevice)init;
- (BKDevicePearlDelegate)delegate;
- (BOOL)facePresent;
- (BOOL)pearlError;
- (OS_dispatch_queue)queue;
- (id)AVFoundationSession;
- (id)createPresenceDetectOperationWithError:(id *)a3;
- (void)deliverPearlDeviceEvent:(int64_t)a3;
- (void)deliverPearlDeviceState:(int64_t)a3;
- (void)getStatsWithBlock:(id)a3;
- (void)resetStats;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4;
- (void)setCarplayStateChangedCallback:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayCallback:(id)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setDisplayState:(BOOL)a3 reply:(id)a4;
- (void)setFacePresent:(BOOL)a3;
- (void)setPearlError:(BOOL)a3;
- (void)setPearlErrorState:(BOOL)a3;
- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4;
- (void)setQueue:(id)a3;
- (void)setSampleState:(BOOL)a3;
- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4;
- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5;
- (void)setSampleState:(BOOL)a3 reply:(id)a4;
- (void)setSampleStatsPtr:(id *)a3;
- (void)setSmartCoverCallback:(id)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4;
@end

@implementation AWUnitTestPearlDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_AVFoundationSession, 0);
  objc_storeStrong((id *)&self->_carplayCallbacks, 0);
  objc_storeStrong((id *)&self->_smarCoverCallbacks, 0);
  objc_storeStrong((id *)&self->_displayCallbacks, 0);
  objc_storeStrong((id *)&self->_lastOperation, 0);

  objc_storeStrong((id *)&self->_awQueue, 0);
}

- (void)setPearlError:(BOOL)a3
{
  self->_pearlError = a3;
}

- (BOOL)pearlError
{
  return self->_pearlError;
}

- (void)setFacePresent:(BOOL)a3
{
  self->_facePresent = a3;
}

- (BOOL)facePresent
{
  return self->_facePresent;
}

- (void)setSampleStatsPtr:(id *)a3
{
  self->_sampleStatsPtr = a3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleStatsPtr
{
  return self->_sampleStatsPtr;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (BKDevicePearlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKDevicePearlDelegate *)WeakRetained;
}

- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  [(AWUnitTestPearlDevice *)self setPearlErrorState:v4];
  v6[2](v6, 0);
}

- (void)setPearlErrorState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      v12 = "clear";
      if (v3) {
        v12 = "set";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)v23 = v12;
      v13 = "%13.5f: UNIT TEST: %s SAMPLER ERROR";
      v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
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
        v16 = "clear";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          v16 = "set";
        }
        *(_DWORD *)v23 = 922;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        v25 = v16;
        v13 = "%30s:%-4d: %13.5f: UNIT TEST: %s SAMPLER ERROR";
        v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  awQueue = self->_awQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__AWUnitTestPearlDevice_setPearlErrorState___block_invoke;
  v18[3] = &unk_1E606AC00;
  v18[4] = self;
  BOOL v19 = v3;
  dispatch_sync(awQueue, v18);
}

uint64_t __44__AWUnitTestPearlDevice_setPearlErrorState___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 81))
  {
    [*(id *)(v2 + 40) awSetFaceDetectError:1];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  BOOL v3 = *(void **)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 setErrorState:v4];
}

- (void)setCarplayStateChangedCallback:(id)a3
{
  id v4 = a3;
  awQueue = self->_awQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AWUnitTestPearlDevice_setCarplayStateChangedCallback___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(awQueue, v7);
}

void __56__AWUnitTestPearlDevice_setCarplayStateChangedCallback___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  id v2 = (id)MEMORY[0x1B3EC18C0](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)setCarPlayConnected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      v12 = "DISCONNECTED";
      if (v3) {
        v12 = "CONNECTED";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)v23 = v12;
      v13 = "%13.5f: UNIT TEST: set CarPlay connected state: %s";
      v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        v16 = "DISCONNECTED";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          v16 = "CONNECTED";
        }
        *(_DWORD *)v23 = 898;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        v25 = v16;
        v13 = "%30s:%-4d: %13.5f: UNIT TEST: set CarPlay connected state: %s";
        v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  awQueue = self->_awQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke;
  v18[3] = &unk_1E606AC00;
  v18[4] = self;
  BOOL v19 = v3;
  dispatch_sync(awQueue, v18);
}

void __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * v6))
        {
          double v7 = (void *)MEMORY[0x1B3EC18C0]();
          id v8 = dispatch_get_global_queue(0, 0);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke_2;
          v10[3] = &unk_1E606A780;
          id v11 = v7;
          char v12 = *(unsigned char *)(a1 + 40);
          id v9 = v7;
          dispatch_async(v8, v10);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  [(AWUnitTestPearlDevice *)self setCarPlayConnected:v4];
  v6[2](v6, 0);
}

- (void)setSmartCoverCallback:(id)a3
{
  id v4 = a3;
  awQueue = self->_awQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AWUnitTestPearlDevice_setSmartCoverCallback___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(awQueue, v7);
}

void __47__AWUnitTestPearlDevice_setSmartCoverCallback___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 56);
  id v2 = (id)MEMORY[0x1B3EC18C0](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  [(AWUnitTestPearlDevice *)self setSmartCoverClosed:v4];
  v6[2](v6, 0);
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      char v12 = "OPEN";
      if (v3) {
        char v12 = "CLOSED";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)v23 = v12;
      long long v13 = "%13.5f: UNIT TEST: set SMART COVER %s";
      long long v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        long long v16 = "OPEN";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          long long v16 = "CLOSED";
        }
        *(_DWORD *)v23 = 860;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        v25 = v16;
        long long v13 = "%30s:%-4d: %13.5f: UNIT TEST: set SMART COVER %s";
        long long v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  awQueue = self->_awQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke;
  v18[3] = &unk_1E606AC00;
  v18[4] = self;
  BOOL v19 = v3;
  dispatch_sync(awQueue, v18);
}

void __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * v6))
        {
          double v7 = (void *)MEMORY[0x1B3EC18C0]();
          id v8 = dispatch_get_global_queue(0, 0);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke_2;
          v10[3] = &unk_1E606A780;
          id v11 = v7;
          char v12 = *(unsigned char *)(a1 + 40);
          id v9 = v7;
          dispatch_async(v8, v10);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setDisplayCallback:(id)a3
{
  id v4 = a3;
  awQueue = self->_awQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AWUnitTestPearlDevice_setDisplayCallback___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(awQueue, v7);
}

void __44__AWUnitTestPearlDevice_setDisplayCallback___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = (id)MEMORY[0x1B3EC18C0](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)setDisplayState:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void))a4;
  [(AWUnitTestPearlDevice *)self setDisplayState:v4];
  v6[2](v6, 0);
}

- (void)setDisplayState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      char v12 = "DISPLAY OFF";
      if (v3) {
        char v12 = "DISPLAY ON";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)v23 = v12;
      long long v13 = "%13.5f: UNIT TEST: set %s";
      long long v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        long long v16 = "DISPLAY OFF";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          long long v16 = "DISPLAY ON";
        }
        *(_DWORD *)v23 = 829;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        v25 = v16;
        long long v13 = "%30s:%-4d: %13.5f: UNIT TEST: set %s";
        long long v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  awQueue = self->_awQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__AWUnitTestPearlDevice_setDisplayState___block_invoke;
  v18[3] = &unk_1E606AC00;
  v18[4] = self;
  BOOL v19 = v3;
  dispatch_sync(awQueue, v18);
}

void __41__AWUnitTestPearlDevice_setDisplayState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * v6))
        {
          double v7 = (void *)MEMORY[0x1B3EC18C0]();
          id v8 = dispatch_get_global_queue(0, 0);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __41__AWUnitTestPearlDevice_setDisplayState___block_invoke_2;
          v10[3] = &unk_1E606A780;
          id v11 = v7;
          char v12 = *(unsigned char *)(a1 + 40);
          id v9 = v7;
          dispatch_async(v8, v10);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __41__AWUnitTestPearlDevice_setDisplayState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(id, void))a5;
  [(AWUnitTestPearlDevice *)self setSampleState:v6 deliverEvent:v5];
  v8[2](v8, 0);
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      long long v14 = "FACE NOT FOUND";
      if (v5) {
        long long v14 = "FACE FOUND";
      }
      *(_DWORD *)buf = 134218242;
      double v24 = v9;
      __int16 v25 = 2080;
      *(void *)uint64_t v26 = v14;
      long long v15 = "%13.5f: UNIT TEST: set %s";
      long long v16 = v7;
      uint32_t v17 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    double v7 = _AALog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    unint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
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
        uint64_t v18 = "FACE NOT FOUND";
        *(_DWORD *)buf = 136315906;
        double v24 = *(double *)&v10;
        __int16 v25 = 1024;
        if (v5) {
          uint64_t v18 = "FACE FOUND";
        }
        *(_DWORD *)uint64_t v26 = 809;
        *(_WORD *)&v26[4] = 2048;
        *(double *)&v26[6] = v13;
        __int16 v27 = 2080;
        v28 = v18;
        long long v15 = "%30s:%-4d: %13.5f: UNIT TEST: set %s";
        long long v16 = v7;
        uint32_t v17 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_24:

        break;
      }
    }
  }
  awQueue = self->_awQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__AWUnitTestPearlDevice_setSampleState_deliverEvent___block_invoke;
  v20[3] = &unk_1E606A758;
  v20[4] = self;
  BOOL v21 = v5;
  BOOL v22 = a4;
  dispatch_sync(awQueue, v20);
}

uint64_t __53__AWUnitTestPearlDevice_setSampleState_deliverEvent___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 81) && *(unsigned char *)(v1 + 80))
  {
    if (*(unsigned char *)(result + 41)) {
      return [*(id *)(v1 + 40) awSetFaceFound];
    }
  }
  return result;
}

- (void)setSampleState:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  [(AWUnitTestPearlDevice *)self setSampleState:v4];
  v6[2](v6, 0);
}

- (void)setSampleState:(BOOL)a3
{
}

- (void)resetStats
{
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AWUnitTestPearlDevice_resetStats__block_invoke;
  block[3] = &unk_1E606AC70;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

uint64_t __35__AWUnitTestPearlDevice_resetStats__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  v1[1] = 0;
  v1[2] = 0;
  v1[3] = 0;
  return result;
}

- (void)getStatsWithBlock:(id)a3
{
  id v4 = a3;
  awQueue = self->_awQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AWUnitTestPearlDevice_getStatsWithBlock___block_invoke;
  v7[3] = &unk_1E606ABB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(awQueue, v7);
}

uint64_t __43__AWUnitTestPearlDevice_getStatsWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *))(v1 + 16);
  long long v4 = *(_OWORD *)(v2 + 8);
  uint64_t v7 = *(void *)(v2 + 24);
  long long v6 = v4;
  return v3(v1, &v6);
}

- (void)deliverPearlDeviceState:(int64_t)a3
{
  BOOL v5 = [(AWUnitTestPearlDevice *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AWUnitTestPearlDevice_deliverPearlDeviceState___block_invoke;
  v6[3] = &unk_1E606AB88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __49__AWUnitTestPearlDevice_deliverPearlDeviceState___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      DeviceStateDescription = getDeviceStateDescription(*(void *)(a1 + 40));
      *(_DWORD *)uint64_t v18 = 134218242;
      *(double *)&v18[4] = v4;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = DeviceStateDescription;
      unint64_t v10 = "%13.5f: UNIT TEST: delivering %s state";
      id v11 = v2;
      uint32_t v12 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v11, OS_LOG_TYPE_DEFAULT, v10, v18, v12);
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
          double v13 = getDeviceStateDescription(*(void *)(a1 + 40));
          *(_DWORD *)uint64_t v18 = 136315906;
          *(void *)&v18[4] = v5;
          *(_WORD *)&v18[12] = 1024;
          *(_DWORD *)&v18[14] = 771;
          *(_WORD *)&v18[18] = 2048;
          *(double *)&v18[20] = v8;
          *(_WORD *)&v18[28] = 2080;
          *(void *)&v18[30] = v13;
          unint64_t v10 = "%30s:%-4d: %13.5f: UNIT TEST: delivering %s state";
          id v11 = v2;
          uint32_t v12 = 38;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  long long v14 = objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v18, *(void *)&v18[16], *(_OWORD *)&v18[24], v19);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    long long v16 = [*(id *)(a1 + 32) delegate];
    uint32_t v17 = +[AWUnitTestPearlDevice sharedDevice];
    [v16 device:v17 pearlStateChanged:*(void *)(a1 + 40)];
  }
}

- (void)deliverPearlDeviceEvent:(int64_t)a3
{
  BOOL v5 = [(AWUnitTestPearlDevice *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AWUnitTestPearlDevice_deliverPearlDeviceEvent___block_invoke;
  v6[3] = &unk_1E606AB88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __49__AWUnitTestPearlDevice_deliverPearlDeviceEvent___block_invoke(uint64_t a1)
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
      DeviceEventDescription = getDeviceEventDescription(*(void *)(a1 + 40));
      unint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = v10[12];
      uint32_t v12 = [v10 delegate];
      *(_DWORD *)v23 = 134218754;
      *(double *)&v23[4] = v4;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&unsigned char v23[14] = DeviceEventDescription;
      *(_WORD *)&v23[22] = 2112;
      *(void *)&v23[24] = v11;
      *(_WORD *)&v23[32] = 2112;
      *(void *)&v23[34] = v12;
      double v13 = "%13.5f: UNIT TEST: delivering %s event on queue %@ to %@";
      long long v14 = v2;
      uint32_t v15 = 42;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, v23, v15);
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
          long long v16 = getDeviceEventDescription(*(void *)(a1 + 40));
          uint32_t v17 = *(void **)(a1 + 32);
          uint64_t v18 = v17[12];
          uint32_t v12 = [v17 delegate];
          *(_DWORD *)v23 = 136316418;
          *(void *)&v23[4] = v5;
          *(_WORD *)&v23[12] = 1024;
          *(_DWORD *)&unsigned char v23[14] = 760;
          *(_WORD *)&v23[18] = 2048;
          *(double *)&v23[20] = v8;
          *(_WORD *)&v23[28] = 2080;
          *(void *)&v23[30] = v16;
          *(_WORD *)&v23[38] = 2112;
          *(void *)&v23[40] = v18;
          LOWORD(v24) = 2112;
          *(void *)((char *)&v24 + 2) = v12;
          double v13 = "%30s:%-4d: %13.5f: UNIT TEST: delivering %s event on queue %@ to %@";
          long long v14 = v2;
          uint32_t v15 = 58;
          goto LABEL_19;
        }
      }
    }
  }

LABEL_21:
  uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v23, *(void *)&v23[16], *(void *)&v23[24], *(_OWORD *)&v23[32], v24);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    BOOL v21 = [*(id *)(a1 + 32) delegate];
    BOOL v22 = +[AWUnitTestPearlDevice sharedDevice];
    [v21 device:v22 pearlEventOccurred:*(void *)(a1 + 40)];
  }
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__1639;
  uint64_t v11 = __Block_byref_object_dispose__1640;
  id v12 = 0;
  awQueue = self->_awQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__AWUnitTestPearlDevice_createPresenceDetectOperationWithError___block_invoke;
  v6[3] = &unk_1E606AB38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(awQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__AWUnitTestPearlDevice_createPresenceDetectOperationWithError___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = objc_alloc_init(AWUnitTestFaceDetectOperation);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUnitTestDevice:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setErrorState:*(unsigned __int8 *)(*(void *)(a1 + 32) + 81)];
  BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  long long v6 = (id *)(*(void *)(a1 + 32) + 40);

  objc_storeStrong(v6, v5);
}

- (id)AVFoundationSession
{
  return self->_AVFoundationSession;
}

- (AWUnitTestPearlDevice)init
{
  v14.receiver = self;
  v14.super_class = (Class)AWUnitTestPearlDevice;
  uint64_t v2 = [(AWUnitTestPearlDevice *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestPearlDevice", 0);
    awQueue = v2->_awQueue;
    v2->_awQueue = (OS_dispatch_queue *)v3;

    v2->_sampleStatsPtr = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v2->_sampleStats;
    v2->_pearlError = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    displayCallbacks = v2->_displayCallbacks;
    v2->_displayCallbacks = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    smarCoverCallbacks = v2->_smarCoverCallbacks;
    v2->_smarCoverCallbacks = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    carplayCallbacks = v2->_carplayCallbacks;
    v2->_carplayCallbacks = (NSMutableArray *)v9;

    uint64_t v11 = objc_alloc_init(AVFoundationUnitTestSession);
    AVFoundationSession = v2->_AVFoundationSession;
    v2->_AVFoundationSession = v11;
  }
  return v2;
}

+ (id)sharedAVFoundationSession
{
  uint64_t v2 = +[AWUnitTestPearlDevice sharedDevice];
  dispatch_queue_t v3 = [v2 AVFoundationSession];

  return v3;
}

+ (id)sharedDevice
{
  if (sharedDevice_onceToken != -1) {
    dispatch_once(&sharedDevice_onceToken, &__block_literal_global_183);
  }
  uint64_t v2 = (void *)sharedDevice_device;

  return v2;
}

uint64_t __37__AWUnitTestPearlDevice_sharedDevice__block_invoke()
{
  v0 = objc_alloc_init(AWUnitTestPearlDevice);
  uint64_t v1 = sharedDevice_device;
  sharedDevice_device = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end