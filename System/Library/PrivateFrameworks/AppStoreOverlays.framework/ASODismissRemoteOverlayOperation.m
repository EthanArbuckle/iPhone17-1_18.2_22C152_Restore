@interface ASODismissRemoteOverlayOperation
- (ASODismissRemoteOverlayOperation)initWithContextProvider:(id)a3;
- (ASORemoteOverlayHost)contextProvider;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)cancel;
- (void)finishExecuting;
- (void)setContextProvider:(id)a3;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)start;
@end

@implementation ASODismissRemoteOverlayOperation

- (ASODismissRemoteOverlayOperation)initWithContextProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASODismissRemoteOverlayOperation;
  v5 = [(ASODismissRemoteOverlayOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_contextProvider, v4);
  }

  return v6;
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3.receiver = self;
  v3.super_class = (Class)ASODismissRemoteOverlayOperation;
  [(ASODismissRemoteOverlayOperation *)&v3 cancel];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v5 = self;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Canceling dismiss operation: %@", buf, 0xCu);
  }
  if ([(ASODismissRemoteOverlayOperation *)self isExecuting]) {
    [(ASODismissRemoteOverlayOperation *)self finishExecuting];
  }
}

- (void)finishExecuting
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    id v4 = self;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finishing executing dismiss operation: %@", (uint8_t *)&v3, 0xCu);
  }
  [(ASODismissRemoteOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASODismissRemoteOverlayOperation *)self willChangeValueForKey:@"isFinished"];
  [(ASODismissRemoteOverlayOperation *)self setIsExecuting:0];
  [(ASODismissRemoteOverlayOperation *)self setIsFinished:1];
  [(ASODismissRemoteOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
  [(ASODismissRemoteOverlayOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Skipping dismiss operation because it was canceled: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __41__ASODismissRemoteOverlayOperation_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishExecuting];
}

- (ASORemoteOverlayHost)contextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);

  return (ASORemoteOverlayHost *)WeakRetained;
}

- (void)setContextProvider:(id)a3
{
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
}

@end