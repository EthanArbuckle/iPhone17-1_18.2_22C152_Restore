@interface AWUnitTestSampler
+ (id)sharedSampler;
- (AWUnitTestSampler)init;
- (id)AVFoundationSession;
- (id)_connect;
- (id)connect;
- (id)invokeSampler:(id)a3;
- (void)getStatsWithBlock:(id)a3;
- (void)resetStats;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4;
- (void)setCarplayStateChangedCallback:(id)a3;
- (void)setDisplayCallback:(id)a3;
- (void)setDisplayState:(BOOL)a3;
- (void)setDisplayState:(BOOL)a3 reply:(id)a4;
- (void)setPearlErrorState:(BOOL)a3;
- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4;
- (void)setSampleState:(BOOL)a3;
- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4;
- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5;
- (void)setSampleState:(BOOL)a3 reply:(id)a4;
- (void)setSmartCoverCallback:(id)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4;
@end

@implementation AWUnitTestSampler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_remoteSamplerProxy, 0);
}

- (id)AVFoundationSession
{
  return 0;
}

- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4
{
}

- (void)setCarplayStateChangedCallback:(id)a3
{
}

- (void)setPearlErrorState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AWUnitTestSampler_setPearlErrorState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v10 = a3;
  v4 = [(AWUnitTestSampler *)self invokeSampler:v9];
  if (v4 && currentLogLevel >= 3)
  {
    v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      v8 = "clear";
      *(_DWORD *)buf = 134218498;
      double v12 = v7;
      if (v3) {
        v8 = "set";
      }
      __int16 v13 = 2080;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to %s error: %@", buf, 0x20u);
    }
  }
}

id __40__AWUnitTestSampler_setPearlErrorState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1639;
  double v12 = __Block_byref_object_dispose__1640;
  id v13 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AWUnitTestSampler_setPearlErrorState___block_invoke_2;
  v7[3] = &unk_1E606A938;
  v7[4] = &v8;
  [v3 setPearlErrorState:v4 reply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__AWUnitTestSampler_setPearlErrorState___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setPearlErrorState:]_block_invoke_2", "PearlUnitTestSupport.m", 286, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4
{
}

- (void)setCarPlayConnected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AWUnitTestSampler_setCarPlayConnected___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v10 = a3;
  uint64_t v4 = [(AWUnitTestSampler *)self invokeSampler:v9];
  if (v4 && currentLogLevel >= 3)
  {
    id v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      uint64_t v8 = "disconnected";
      *(_DWORD *)buf = 134218498;
      double v12 = v7;
      if (v3) {
        uint64_t v8 = "connected";
      }
      __int16 v13 = 2080;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set CarPlay connected %s: %@", buf, 0x20u);
    }
  }
}

id __41__AWUnitTestSampler_setCarPlayConnected___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1639;
  double v12 = __Block_byref_object_dispose__1640;
  id v13 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AWUnitTestSampler_setCarPlayConnected___block_invoke_2;
  v7[3] = &unk_1E606A938;
  v7[4] = &v8;
  [v3 setCarPlayConnected:v4 reply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__AWUnitTestSampler_setCarPlayConnected___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setCarPlayConnected:]_block_invoke_2", "PearlUnitTestSupport.m", 262, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setSmartCoverCallback:(id)a3
{
}

- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4
{
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v10 = a3;
  uint64_t v4 = [(AWUnitTestSampler *)self invokeSampler:v9];
  if (v4 && currentLogLevel >= 3)
  {
    id v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      uint64_t v8 = "open";
      *(_DWORD *)buf = 134218498;
      double v12 = v7;
      if (v3) {
        uint64_t v8 = "closed";
      }
      __int16 v13 = 2080;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set smart cover state %s: %@", buf, 0x20u);
    }
  }
}

id __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1639;
  double v12 = __Block_byref_object_dispose__1640;
  id v13 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke_2;
  v7[3] = &unk_1E606A938;
  v7[4] = &v8;
  [v3 setSmartCoverClosed:v4 reply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setSmartCoverClosed:]_block_invoke_2", "PearlUnitTestSupport.m", 231, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5
{
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke;
  v10[3] = &__block_descriptor_34_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v11 = a3;
  BOOL v12 = a4;
  id v5 = [(AWUnitTestSampler *)self invokeSampler:v10];
  if (v5 && currentLogLevel >= 3)
  {
    unint64_t v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = absTimeNS();
      if (v7 == -1) {
        double v8 = INFINITY;
      }
      else {
        double v8 = (double)v7 / 1000000000.0;
      }
      v9 = "absent";
      *(_DWORD *)buf = 134218498;
      double v14 = v8;
      if (v4) {
        v9 = "present";
      }
      __int16 v15 = 2080;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed to set sample state %s: %@", buf, 0x20u);
    }
  }
}

id __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy__1639;
  id v13 = __Block_byref_object_dispose__1640;
  id v14 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 33);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke_2;
  v8[3] = &unk_1E606A938;
  v8[4] = &v9;
  [v3 setSampleState:v4 deliverEvent:v5 reply:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setSampleState:deliverEvent:]_block_invoke_2", "PearlUnitTestSupport.m", 205, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setSampleState:(BOOL)a3 reply:(id)a4
{
}

- (void)setSampleState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__AWUnitTestSampler_setSampleState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v10 = a3;
  uint64_t v4 = [(AWUnitTestSampler *)self invokeSampler:v9];
  if (v4 && currentLogLevel >= 3)
  {
    uint64_t v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      double v8 = "absent";
      *(_DWORD *)buf = 134218498;
      double v12 = v7;
      if (v3) {
        double v8 = "present";
      }
      __int16 v13 = 2080;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set sample state %s: %@", buf, 0x20u);
    }
  }
}

id __36__AWUnitTestSampler_setSampleState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1639;
  double v12 = __Block_byref_object_dispose__1640;
  id v13 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__AWUnitTestSampler_setSampleState___block_invoke_2;
  v7[3] = &unk_1E606A938;
  v7[4] = &v8;
  [v3 setSampleState:v4 reply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __36__AWUnitTestSampler_setSampleState___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setSampleState:]_block_invoke_2", "PearlUnitTestSupport.m", 178, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)setDisplayCallback:(id)a3
{
}

- (void)setDisplayState:(BOOL)a3 reply:(id)a4
{
}

- (void)setDisplayState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__AWUnitTestSampler_setDisplayState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  BOOL v10 = a3;
  uint64_t v4 = [(AWUnitTestSampler *)self invokeSampler:v9];
  if (v4 && currentLogLevel >= 3)
  {
    id v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      uint64_t v8 = "off";
      *(_DWORD *)buf = 134218498;
      double v12 = v7;
      if (v3) {
        uint64_t v8 = "on";
      }
      __int16 v13 = 2080;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B3B4B000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set display state %s: %@", buf, 0x20u);
    }
  }
}

id __37__AWUnitTestSampler_setDisplayState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1639;
  double v12 = __Block_byref_object_dispose__1640;
  id v13 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AWUnitTestSampler_setDisplayState___block_invoke_2;
  v7[3] = &unk_1E606A938;
  v7[4] = &v8;
  [v3 setDisplayState:v4 reply:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__AWUnitTestSampler_setDisplayState___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    __assert_rtn("-[AWUnitTestSampler setDisplayState:]_block_invoke_2", "PearlUnitTestSupport.m", 147, "!error");
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)resetStats
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(AWUnitTestSampler *)self invokeSampler:&__block_literal_global_1654];
  if (v2) {
    BOOL v3 = currentLogLevel < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      int v7 = 134218242;
      double v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = v2;
      _os_log_error_impl(&dword_1B3B4B000, v4, OS_LOG_TYPE_ERROR, "%13.5f: failed to reset unit test sampler stats: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

uint64_t __31__AWUnitTestSampler_resetStats__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)getStatsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3810000000;
  id v14 = &unk_1B3B91BDF;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__AWUnitTestSampler_getStatsWithBlock___block_invoke;
  v10[3] = &unk_1E606A6A8;
  void v10[4] = &v11;
  unint64_t v5 = [(AWUnitTestSampler *)self invokeSampler:v10];
  if (v5 && currentLogLevel >= 3)
  {
    double v6 = _AALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218242;
      *(double *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_error_impl(&dword_1B3B4B000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed to get unit test sampler stats: %@", buf, 0x16u);
    }
  }
  int v7 = (void (*)(void *, unsigned char *))v4[2];
  *(_OWORD *)buf = *((_OWORD *)v12 + 2);
  *(void *)&buf[16] = v12[6];
  v7(v4, buf);

  _Block_object_dispose(&v11, 8);
}

uint64_t __39__AWUnitTestSampler_getStatsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__AWUnitTestSampler_getStatsWithBlock___block_invoke_2;
  v3[3] = &unk_1E606A680;
  v3[4] = *(void *)(a1 + 32);
  [a2 getStatsWithBlock:v3];
  return 0;
}

__n128 __39__AWUnitTestSampler_getStatsWithBlock___block_invoke_2(uint64_t a1, __n128 *a2)
{
  v2 = *(__n128 **)(*(void *)(a1 + 32) + 8);
  __n128 result = *a2;
  v2[3].n128_u64[0] = a2[1].n128_u64[0];
  v2[2] = result;
  return result;
}

- (id)invokeSampler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1639;
  uint64_t v16 = __Block_byref_object_dispose__1640;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AWUnitTestSampler_invokeSampler___block_invoke;
  block[3] = &unk_1E606A658;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __35__AWUnitTestSampler_invokeSampler___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1639;
  v39 = __Block_byref_object_dispose__1640;
  id v40 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2) {
    goto LABEL_33;
  }
  BOOL v3 = (void *)*MEMORY[0x1E4F281F8];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  unint64_t v5 = &unk_1E606A938;
  char v6 = 1;
  while (1)
  {
    v34[0] = v4;
    v34[1] = 3221225472;
    v34[2] = __35__AWUnitTestSampler_invokeSampler___block_invoke_2;
    v34[3] = v5;
    v34[4] = &v35;
    id v7 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v34];
    uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      break;
    }
    uint64_t v11 = (void *)v36[5];
    if (!v11) {
      break;
    }
    if (currentLogLevel >= 3)
    {
      uint64_t v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v23 = absTimeNS();
        if (v23 == -1) {
          double v24 = INFINITY;
        }
        else {
          double v24 = (double)v23 / 1000000000.0;
        }
        uint64_t v25 = v36[5];
        *(_DWORD *)buf = 134218242;
        double v44 = v24;
        __int16 v45 = 2112;
        *(void *)v46 = v25;
        _os_log_error_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy error: %@", buf, 0x16u);
      }

      uint64_t v11 = (void *)v36[5];
    }
    uint64_t v13 = [v11 domain];
    if ((void *)v13 != v3)
    {
      BOOL v3 = (void *)v13;
LABEL_34:

      break;
    }
    if ([(id)v36[5] code] != 4099) {
      goto LABEL_34;
    }

    if ((v6 & 1) == 0) {
      break;
    }
    uint64_t v14 = [*(id *)(a1 + 32) connect];
    if (currentLogLevel < 7) {
      goto LABEL_27;
    }
    uint64_t v15 = _AALog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v16 = v5;
    id v17 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/Unit Testing/PearlUnitTestSupport.m";
          *(i - 1) == 47;
          ++i)
    {
      id v17 = i;
LABEL_18:
      ;
    }
    if (*(i - 1)) {
      goto LABEL_18;
    }
    unint64_t v19 = absTimeNS();
    if (v19 == -1)
    {
      double v20 = INFINITY;
      if (!v14) {
        goto LABEL_23;
      }
LABEL_21:
      v33 = [NSString stringWithFormat:@"failed: %@", v14];
      v21 = v33;
    }
    else
    {
      double v20 = (double)v19 / 1000000000.0;
      if (v14) {
        goto LABEL_21;
      }
LABEL_23:
      v21 = @"succeeded";
    }
    *(_DWORD *)buf = 136316162;
    double v44 = *(double *)&v17;
    __int16 v45 = 1024;
    *(_DWORD *)v46 = 91;
    *(_WORD *)&v46[4] = 2048;
    *(double *)&v46[6] = v20;
    __int16 v47 = 1024;
    int v48 = 1;
    __int16 v49 = 2112;
    v50 = v21;
    _os_log_impl(&dword_1B3B4B000, v15, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: XPC proxy invalid: reconnect %u %@", buf, 0x2Cu);
    unint64_t v5 = v16;
    if (v14) {

    }
LABEL_26:
LABEL_27:

    v22 = (void *)v36[5];
    v36[5] = 0;

    char v6 = 0;
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
    if (!v2)
    {
LABEL_33:
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @" Not connected to server";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v27 = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:v7];
      uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v3 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
      goto LABEL_34;
    }
  }

  uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v31 = *(void *)(v29 + 40);
  v30 = (id *)(v29 + 40);
  if (!v31)
  {
    v32 = (void *)v36[5];
    if (v32) {
      objc_storeStrong(v30, v32);
    }
  }
  _Block_object_dispose(&v35, 8);
}

void __35__AWUnitTestSampler_invokeSampler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)connect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  return [(AWUnitTestSampler *)self _connect];
}

- (id)_connect
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AWUnitTestSampler__connect__block_invoke;
  v6[3] = &unk_1E606A630;
  v6[4] = self;
  v2 = self;
  BOOL v3 = (void *)MEMORY[0x1B3EC18C0](v6);
  uint64_t v4 = +[AWServiceManager invokeWithService:v3];

  return v4;
}

uint64_t __29__AWUnitTestSampler__connect__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__AWUnitTestSampler__connect__block_invoke_2;
  v3[3] = &unk_1E606A608;
  v3[4] = *(void *)(a1 + 32);
  [a2 getUnitTestSamplerWithReply:v3];
  return 0;
}

void __29__AWUnitTestSampler__connect__block_invoke_2(uint64_t a1, void *a2)
{
}

- (AWUnitTestSampler)init
{
  v6.receiver = self;
  v6.super_class = (Class)AWUnitTestSampler;
  v2 = [(AWUnitTestSampler *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestSampler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedSampler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AWUnitTestSampler_sharedSampler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSampler_onceToken != -1) {
    dispatch_once(&sharedSampler_onceToken, block);
  }
  v2 = (void *)sharedSampler_sampler;

  return v2;
}

void __34__AWUnitTestSampler_sharedSampler__block_invoke()
{
  v0 = objc_alloc_init(AWUnitTestSampler);
  v1 = (void *)sharedSampler_sampler;
  sharedSampler_sampler = (uint64_t)v0;

  v2 = [(id)sharedSampler_sampler _connect];
  if (v2)
  {
    dispatch_queue_t v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F28790];
    id v7 = v2;
    unint64_t v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    [v3 raise:v4, @"%@ sharedSampler not available", v6 format];

    v2 = v7;
  }
}

@end