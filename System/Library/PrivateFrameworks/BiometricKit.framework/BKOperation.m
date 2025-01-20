@interface BKOperation
- (BKDevice)device;
- (BKOperation)initWithDevice:(id)a3;
- (BKOperationDelegate)delegate;
- (BOOL)isDelegate;
- (BOOL)startWithError:(id *)a3;
- (OS_dispatch_queue)queue;
- (id)dispatchQueue;
- (id)optionsDictionaryWithError:(id *)a3;
- (id)userPresentWithError:(id *)a3;
- (int64_t)state;
- (void)cancel;
- (void)changeState:(int64_t)a3;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)operationEndsWithReason:(int64_t)a3;
- (void)operationInterrupted;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
- (void)startOperation:(BOOL)a3 reply:(id)a4;
- (void)startWithReply:(id)a3;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
@end

@implementation BKOperation

- (BKOperation)initWithDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (BKOperation *)a3;
  kdebug_trace();
  v6 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v7 = __osLogTrace;
  }
  else {
    v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKOperation::initWithDevice %@\n", buf, 0xCu);
  }
  v21.receiver = self;
  v21.super_class = (Class)BKOperation;
  v8 = [(BKOperation *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_state = 1;
    v10 = [BiometricKitXPCClient alloc];
    v11 = [(BKOperation *)v5 descriptor];
    uint64_t v12 = -[BiometricKitXPCClient initWithDeviceType:clientType:](v10, "initWithDeviceType:clientType:", [v11 type], 3);
    xpcClient = v9->_xpcClient;
    v9->_xpcClient = (BiometricKitXPCClient *)v12;

    v14 = v9->_xpcClient;
    if (v14) {
      [(BiometricKitXPCClient *)v14 setDelegate:v9];
    }
    if (__osLogTrace) {
      v15 = __osLogTrace;
    }
    else {
      v15 = v6;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v9->_xpcClient;
      v17 = v15;
      uint64_t v18 = [(BiometricKitXPCClient *)v16 connectionId];
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKOperation::initWithDevice -> %@ (_cid %lu)\n", buf, 0x16u);
    }
  }
  else
  {
    if (__osLogTrace) {
      v19 = __osLogTrace;
    }
    else {
      v19 = v6;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "BKOperation::initWithDevice -> %@ (_cid %lu)\n", buf, 0x16u);
    }
  }
  kdebug_trace();

  return v9;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(BiometricKitXPCClient *)self->_xpcClient setDelegate:0];
  v3 = self->_xpcClient;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__BKOperation_dealloc__block_invoke;
  block[3] = &unk_1E6067CD8;
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKOperation;
  [(BKOperation *)&v7 dealloc];
}

uint64_t __22__BKOperation_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateConnection];
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::setDelegate %@ (_cid %lu)\n", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    [(BiometricKitXPCClient *)self->_xpcClient registerDelegate:v4 != 0];
  }
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = v5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKOperation::setDelegate -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (id)dispatchQueue
{
  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }
  return v3;
}

- (void)connectionInterrupted
{
  obj = self;
  objc_sync_enter(obj);
  int64_t state = obj->_state;
  if (state != 1 && state != 4) {
    [(BKOperation *)obj operationInterrupted];
  }
  objc_sync_exit(obj);
}

- (void)operationInterrupted
{
}

- (id)optionsDictionaryWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", a3);
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  id v6 = 0;
  id v4 = (void (**)(id, void, id))a4;
  setError((id)1, &v6);
  id v5 = v6;
  v4[2](v4, 0, v5);
}

- (void)startOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  kdebug_trace();
  objc_super v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v4;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::startOperation(async=%u)\n", buf, 8u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __36__BKOperation_startOperation_reply___block_invoke;
  v17[3] = &unk_1E6068190;
  id v9 = v6;
  id v18 = v9;
  v10 = (void (**)(void, void, void))MEMORY[0x1B3EC0F90](v17);
  int v11 = self;
  objc_sync_enter(v11);
  if ([(BKOperation *)v11 state] != 1 || v11->_startPending)
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "self.state == BKOperationStateIdle && !_startPending";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v27 = 1024;
      int v28 = 161;
      _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v14 = +[BKErrorHelper errorWithCode:1];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v14);

    objc_sync_exit(v11);
  }
  else
  {
    v11->_startPending = 1;
    objc_sync_exit(v11);

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__BKOperation_startOperation_reply___block_invoke_9;
    v15[3] = &unk_1E60681E0;
    v15[4] = v11;
    v16 = v10;
    [(BKOperation *)v11 startBioOperation:v4 reply:v15];
  }
  if (__osLogTrace) {
    id v12 = __osLogTrace;
  }
  else {
    id v12 = v7;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKOperation::startOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __36__BKOperation_startOperation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x1E4F14500];
  }
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109378;
      int v11 = 1;
      __int16 v12 = 2112;
      id v13 = v5;
      objc_super v7 = v6;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_1B3AF1000, v7, v8, "BKOperation::startOperation -> reply(%d, %@)\n", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 67109378;
    int v11 = 0;
    __int16 v12 = 2112;
    id v13 = v5;
    objc_super v7 = v6;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }
  kdebug_trace();
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v5, v9);
}

void __36__BKOperation_startOperation_reply___block_invoke_9(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    if (*(void *)(v7 + 48) == 1)
    {
      [*(id *)(a1 + 32) changeState:2];
      uint64_t v7 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v7 + 17))
    {
      os_log_type_t v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__BKOperation_startOperation_reply___block_invoke_2;
      block[3] = &unk_1E6067CD8;
      void block[4] = v7;
      dispatch_async(v8, block);

      uint64_t v7 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v7 + 16) = 0;
  objc_sync_exit(v6);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __36__BKOperation_startOperation_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  os_log_type_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__BKOperation_startWithError___block_invoke;
  v6[3] = &unk_1E6068140;
  v6[4] = &v13;
  v6[5] = &v7;
  [(BKOperation *)self startOperation:0 reply:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  char v4 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __30__BKOperation_startWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)startWithReply:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__BKOperation_startWithReply___block_invoke;
  v6[3] = &unk_1E6068190;
  id v7 = v4;
  id v5 = v4;
  [(BKOperation *)self startOperation:1 reply:v6];
}

void __30__BKOperation_startWithReply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BKOperation_startWithReply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __30__BKOperation_startWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)cancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v3 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v6 = v4;
    int v9 = 134217984;
    uint64_t v10 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKOperation::cancel (_cid %lu)\n", (uint8_t *)&v9, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_state != 4)
  {
    v7->_cancelPending = 1;
    [(BiometricKitXPCClient *)v7->_xpcClient cancel];
  }
  objc_sync_exit(v7);

  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = v3;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::cancel -> void\n", (uint8_t *)&v9, 2u);
  }
  kdebug_trace();
}

- (id)userPresentWithError:(id *)a3
{
  *(void *)&v19[5] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v8 = v6;
    int v18 = 134217984;
    *(void *)v19 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::userPresent (_cid %lu)\n", (uint8_t *)&v18, 0xCu);
  }
  BOOL v9 = [(BiometricKitXPCClient *)self->_xpcClient isFingerOn];
  uint64_t v10 = [NSNumber numberWithBool:v9];
  uint64_t v11 = (void *)v10;
  if (__osLogTrace) {
    char v12 = __osLogTrace;
  }
  else {
    char v12 = v5;
  }
  if (v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    if (a3) {
      id v13 = *a3;
    }
    else {
      id v13 = 0;
    }
    int v18 = 67109378;
    v19[0] = v9;
    LOWORD(v19[1]) = 2112;
    *(void *)((char *)&v19[1] + 2) = v13;
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    if (a3) {
      id v14 = *a3;
    }
    else {
      id v14 = 0;
    }
    int v18 = 67109378;
    v19[0] = v9;
    LOWORD(v19[1]) = 2112;
    *(void *)((char *)&v19[1] + 2) = v14;
    uint64_t v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B3AF1000, v15, v16, "BKOperation::userPresent -> %d %@\n", (uint8_t *)&v18, 0x12u);
LABEL_21:
  kdebug_trace();
  return v11;
}

- (void)changeState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKOperation::changeState %ld\n", buf, 0xCu);
  }
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_state != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(BKOperation *)v7 dispatchQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __27__BKOperation_changeState___block_invoke;
      v12[3] = &unk_1E6067BF8;
      v12[4] = v7;
      v12[5] = a3;
      dispatch_async(v10, v12);
    }
    v7->_int64_t state = a3;
  }
  objc_sync_exit(v7);

  if (__osLogTrace) {
    uint64_t v11 = __osLogTrace;
  }
  else {
    uint64_t v11 = v5;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKOperation::changeState -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __27__BKOperation_changeState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained operation:*(void *)(a1 + 32) stateChanged:*(void *)(a1 + 40)];
}

- (void)operationEndsWithReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v8 = v6;
    *(_DWORD *)buf = 134218240;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::operationEndsWithReason: %ld (_cid %lu)\n", buf, 0x16u);
  }
  [(BKOperation *)self changeState:4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(BKOperation *)self dispatchQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__BKOperation_operationEndsWithReason___block_invoke;
    v13[3] = &unk_1E6067BF8;
    v13[4] = self;
    v13[5] = a3;
    dispatch_async(v11, v13);
  }
  [(BiometricKitXPCClient *)self->_xpcClient setDelegate:0];
  [(BiometricKitXPCClient *)self->_xpcClient invalidateConnection];
  if (__osLogTrace) {
    char v12 = __osLogTrace;
  }
  else {
    char v12 = v5;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKOperation::operationEndsWithReason: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __39__BKOperation_operationEndsWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained operation:*(void *)(a1 + 32) finishedWithReason:*(void *)(a1 + 40)];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v6 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = a3;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKOperation::statusMessage: %u\n", buf, 8u);
  }
  switch(a3)
  {
    case '3':
    case '>':
    case 'C':
      id v8 = self;
      uint64_t v9 = 3;
      goto LABEL_13;
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ';':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
      goto LABEL_21;
    case ':':
    case 'A':
      id v8 = self;
      uint64_t v9 = 1;
      goto LABEL_13;
    case '<':
      id v13 = self;
      uint64_t v14 = 3;
      goto LABEL_20;
    case '=':
      goto LABEL_17;
    case '?':
    case '@':
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        char v12 = [(BKOperation *)self dispatchQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __36__BKOperation_statusMessage_client___block_invoke;
        v16[3] = &unk_1E6068090;
        v16[4] = self;
        unsigned int v17 = a3;
        dispatch_async(v12, v16);
      }
      if (a3 != 64) {
        goto LABEL_21;
      }
LABEL_17:
      id v13 = self;
      uint64_t v14 = 2;
LABEL_20:
      [(BKOperation *)v13 changeState:v14];
      goto LABEL_21;
    case 'B':
    case 'P':
      goto LABEL_11;
    case 'D':
      goto LABEL_10;
    case 'J':
      id v13 = self;
      uint64_t v14 = 5;
      goto LABEL_20;
    default:
      if (a3 == 99)
      {
LABEL_11:
        id v8 = self;
        uint64_t v9 = 2;
      }
      else
      {
        if (a3 != 502) {
          goto LABEL_21;
        }
LABEL_10:
        id v8 = self;
        uint64_t v9 = 4;
      }
LABEL_13:
      [(BKOperation *)v8 operationEndsWithReason:v9];
LABEL_21:
      if (__osLogTrace) {
        int64_t v15 = __osLogTrace;
      }
      else {
        int64_t v15 = v6;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_DEFAULT, "BKOperation::statusMessage: -> void\n", buf, 2u);
      }
      kdebug_trace();
      return;
  }
}

void __36__BKOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained operation:*(void *)(a1 + 32) presenceStateChanged:*(_DWORD *)(a1 + 40) == 63];
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
}

- (BOOL)isDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BKDevice)device
{
  return self->_device;
}

- (BKOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BKOperationDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end