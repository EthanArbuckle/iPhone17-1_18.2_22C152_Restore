@interface BROperation
- (BOOL)_finishIfCancelled;
- (BOOL)finishIfCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)nonDiscretionary;
- (BOOL)waitForRemoteToBeCancelled;
- (BRCancellable)remoteOperation;
- (BROperation)init;
- (NSString)description;
- (OS_dispatch_queue)callbackQueue;
- (id)remoteFPFSObject;
- (id)remoteLegacyObject;
- (id)remoteObject;
- (void)_setExecuting:(BOOL)a3;
- (void)_setFinished:(BOOL)a3;
- (void)_setRemoteOperation:(id)a3;
- (void)cancel;
- (void)completedWithResult:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)remoteFPFSObject;
- (void)remoteLegacyObject;
- (void)setNonDiscretionary:(BOOL)a3;
- (void)setRemoteOperation:(id)a3;
- (void)setRemoteOperationProxy:(id)a3 userInfo:(id)a4;
- (void)setWaitForRemoteToBeCancelled:(BOOL)a3;
- (void)start;
@end

@implementation BROperation

- (BROperation)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(out, 0, 37);
  v15.receiver = self;
  v15.super_class = (Class)BROperation;
  v2 = [(BROperation *)&v15 init];
  if (v2)
  {
    memset(v14, 0, sizeof(v14));
    __brc_create_section(0, (uint64_t)"-[BROperation init]", 30, v14);
    v3 = brc_bread_crumbs((uint64_t)"-[BROperation init]", 30);
    v4 = brc_default_log(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v14[0];
      __int16 v18 = 2112;
      v19 = v2;
      __int16 v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating %@%@", buf, 0x20u);
    }

    MEMORY[0x19F3C4E00](v2->_uuid);
    uuid_unparse_upper(v2->_uuid, out);
    v5 = [NSString stringWithFormat:@"%@ %s", objc_opt_class(), out];
    [(BROperation *)v2 setName:v5];

    id v6 = [(BROperation *)v2 name];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = dispatch_queue_attr_make_initially_inactive(v8);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v7, v10);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    __brc_leave_section((uint64_t)v14);
  }
  return v2;
}

- (NSString)description
{
  v3 = [(BROperation *)self name];

  if (v3)
  {
    v4 = NSString;
    v5 = [(BROperation *)self name];
    if ([(BROperation *)self isExecuting])
    {
      id v6 = @"executing";
    }
    else
    {
      BOOL v8 = [(BROperation *)self isFinished];
      id v6 = @"idle";
      if (v8) {
        id v6 = @"finished";
      }
    }
    v7 = [v4 stringWithFormat:@"<%p %@ %@>", self, v5, v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BROperation;
    v7 = [(BROperation *)&v10 description];
  }

  return (NSString *)v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _executionTransation == nil%@", v2, v3, v4, v5, v6);
}

- (void)_setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(BROperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(BROperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (BOOL)isExecuting
{
  return self->_executionTransation != 0;
}

- (void)_setExecuting:(BOOL)a3
{
  if ((((self->_executionTransation == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(BROperation *)self willChangeValueForKey:@"isExecuting"];
    if (v3) {
      uint64_t v5 = (void *)os_transaction_create();
    }
    else {
      uint64_t v5 = 0;
    }
    id executionTransation = self->_executionTransation;
    self->_id executionTransation = v5;

    [(BROperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (void)start
{
  dispatch_activate((dispatch_object_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__BROperation_start__block_invoke;
  block[3] = &unk_1E59AD3B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __20__BROperation_start__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BROperation start]_block_invoke", 101, v5);
  uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BROperation start]_block_invoke", 101);
  BOOL v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v7 = v5[0];
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    dispatch_queue_t v11 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting %@%@", buf, 0x20u);
  }

  [*(id *)(a1 + 32) _setExecuting:1];
  if (([*(id *)(a1 + 32) _finishIfCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) main];
  }
  __brc_leave_section((uint64_t)v5);
}

- (void)cancel
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_19ED3F000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling %@%@", v2, 0x16u);
}

uint64_t __21__BROperation_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRemoteOperation:0];
  uint64_t result = [*(id *)(a1 + 32) waitForRemoteToBeCancelled];
  if ((result & 1) == 0)
  {
    __int16 v3 = *(void **)(a1 + 32);
    return [v3 _finishIfCancelled];
  }
  return result;
}

- (BOOL)_finishIfCancelled
{
  if (self->_finished)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return v2;
  }
  if (self->_executionTransation)
  {
    int v2 = [(BROperation *)self isCancelled];
    if (!v2) {
      return v2;
    }
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(BROperation *)self finishWithResult:0 error:v4];

    goto LABEL_2;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)finishIfCancelled
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = [(BROperation *)self isCancelled];
  if (v3)
  {
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __32__BROperation_finishIfCancelled__block_invoke;
    v19[3] = &unk_1E59AD3B0;
    v19[4] = self;
    uint64_t v5 = queue;
    uint8_t v6 = v19;
    dispatch_queue_t v11 = (void *)MEMORY[0x19F3C4670](v6, v7, v8, v9, v10);
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v20);
    uint64_t v12 = brc_bread_crumbs((uint64_t)"dispatch_async_with_logs", 262);
    v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v20;
      label = dispatch_queue_get_label(v5);
      *(_DWORD *)block = 134218498;
      *(void *)&block[4] = v17;
      *(_WORD *)&block[12] = 2080;
      *(void *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      uint64_t v23 = v12;
      _os_log_debug_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    long long v26 = v20;
    uint64_t v27 = v21;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __dispatch_async_with_logs_block_invoke;
    uint64_t v23 = &unk_1E59AD670;
    v14 = v5;
    v24 = v14;
    objc_super v15 = v6;
    id v25 = v15;
    dispatch_async(v14, block);
  }
  return v3;
}

uint64_t __32__BROperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishIfCancelled];
}

- (id)remoteObject
{
  int v3 = +[BRDaemonConnection defaultConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__BROperation_remoteObject__block_invoke;
  v6[3] = &unk_1E59AD448;
  v6[4] = self;
  uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

uint64_t __27__BROperation_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (id)remoteFPFSObject
{
  if (BRIsFPFSEnabled(self, a2))
  {
    int v3 = +[BRDaemonConnection defaultConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__BROperation_remoteFPFSObject__block_invoke;
    v8[3] = &unk_1E59AD448;
    v8[4] = self;
    uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BROperation remoteFPFSObject]", 170);
    uint8_t v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BROperation remoteFPFSObject]();
    }

    int v3 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_remoteFPFSObject);
    [(BROperation *)self completedWithResult:0 error:v3];
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __31__BROperation_remoteFPFSObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (id)remoteLegacyObject
{
  if (BRIsFPFSEnabled(self, a2))
  {
    int v3 = brc_bread_crumbs((uint64_t)"-[BROperation remoteLegacyObject]", 182);
    uint64_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BROperation remoteLegacyObject]();
    }

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_remoteLegacyObject);
    [(BROperation *)self completedWithResult:0 error:v5];
    uint8_t v6 = 0;
  }
  else
  {
    uint64_t v5 = +[BRDaemonConnection defaultConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__BROperation_remoteLegacyObject__block_invoke;
    v8[3] = &unk_1E59AD448;
    v8[4] = self;
    uint8_t v6 = [v5 remoteObjectProxyWithErrorHandler:v8];
  }

  return v6;
}

uint64_t __33__BROperation_remoteLegacyObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BROperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E59AD620;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __41__BROperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _finishIfCancelled] & 1) == 0)
  {
    memset(v7, 0, sizeof(v7));
    __brc_create_section(0, (uint64_t)"-[BROperation completedWithResult:error:]_block_invoke", 201, v7);
    int v2 = brc_bread_crumbs((uint64_t)"-[BROperation completedWithResult:error:]_block_invoke", 201);
    int v3 = brc_default_log(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134219010;
      uint64_t v9 = v7[0];
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v2;
      _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@ with result %@ error %@%@", buf, 0x34u);
    }

    [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    __brc_leave_section((uint64_t)v7);
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  -[BROperation _setExecuting:](self, "_setExecuting:", 0, a4);
  [(BROperation *)self _setFinished:1];

  [(BROperation *)self _setRemoteOperation:0];
}

- (void)_setRemoteOperation:(id)a3
{
  id v4 = a3;
  id remoteOperation = self->_remoteOperation;
  if (v4 && remoteOperation)
  {
    uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BROperation _setRemoteOperation:]", 218);
    __int16 v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BROperation _setRemoteOperation:]();
    }

    id remoteOperation = self->_remoteOperation;
  }
  [remoteOperation invalidate];
  if (self->_finished)
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  char v6 = [(BROperation *)self isCancelled];
  if (v4 && (v6 & 1) != 0)
  {
LABEL_8:
    [v4 invalidate];

    id v4 = 0;
  }
LABEL_9:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__BROperation__setRemoteOperation___block_invoke;
  v11[3] = &unk_1E59AD448;
  v11[4] = self;
  id v7 = [v4 remoteObjectProxyWithErrorHandler:v11];
  id v8 = self->_remoteOperation;
  self->_id remoteOperation = v7;
}

uint64_t __35__BROperation__setRemoteOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)setRemoteOperationProxy:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__BROperation_setRemoteOperationProxy_userInfo___block_invoke;
  v8[3] = &unk_1E59AD648;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __48__BROperation_setRemoteOperationProxy_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRemoteOperation:*(void *)(a1 + 40)];
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_queue;
}

- (BRCancellable)remoteOperation
{
  return (BRCancellable *)self->_remoteOperation;
}

- (void)setRemoteOperation:(id)a3
{
}

- (BOOL)waitForRemoteToBeCancelled
{
  return self->_waitForRemoteToBeCancelled;
}

- (void)setWaitForRemoteToBeCancelled:(BOOL)a3
{
  self->_waitForRemoteToBeCancelled = a3;
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  self->_nonDiscretionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionTransation, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_remoteOperation, 0);
}

- (void)remoteFPFSObject
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Asking for FPFS object when FPFS isn't enabled%@", v2, v3, v4, v5, v6);
}

- (void)remoteLegacyObject
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Asking for Legacy object when FPFS is enabled%@", v2, v3, v4, v5, v6);
}

- (void)_setRemoteOperation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: !_remoteOperation || !proxy%@", v2, v3, v4, v5, v6);
}

@end