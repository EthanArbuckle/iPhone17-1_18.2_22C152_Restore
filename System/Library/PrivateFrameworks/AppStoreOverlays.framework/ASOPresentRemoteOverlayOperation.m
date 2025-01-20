@interface ASOPresentRemoteOverlayOperation
- (ASOPresentRemoteOverlayOperation)initWithRemoteOverlay:(id)a3;
- (ASORemoteOverlay)remoteOverlay;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)cancel;
- (void)finishExecuting;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setRemoteOverlay:(id)a3;
- (void)start;
@end

@implementation ASOPresentRemoteOverlayOperation

- (ASOPresentRemoteOverlayOperation)initWithRemoteOverlay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOPresentRemoteOverlayOperation;
  v6 = [(ASOPresentRemoteOverlayOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_remoteOverlay, a3);
  }

  return v7;
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3.receiver = self;
  v3.super_class = (Class)ASOPresentRemoteOverlayOperation;
  [(ASOPresentRemoteOverlayOperation *)&v3 cancel];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = self;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Canceling presentation operation: %@", buf, 0xCu);
  }
  if ([(ASOPresentRemoteOverlayOperation *)self isExecuting]) {
    [(ASOPresentRemoteOverlayOperation *)self finishExecuting];
  }
}

- (void)finishExecuting
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    v4 = self;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Finishing executing presentation operation: %@", (uint8_t *)&v3, 0xCu);
  }
  [(ASOPresentRemoteOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASOPresentRemoteOverlayOperation *)self willChangeValueForKey:@"isFinished"];
  [(ASOPresentRemoteOverlayOperation *)self setIsExecuting:0];
  [(ASOPresentRemoteOverlayOperation *)self setIsFinished:1];
  [(ASOPresentRemoteOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
  [(ASOPresentRemoteOverlayOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Skipping presentation operation because it was canceled: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __41__ASOPresentRemoteOverlayOperation_start__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    uint64_t v5 = [v3 remoteOverlay];
    [v5 remoteStoreOverlayDidFailToLoadWithError:v4];
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 finishExecuting];
}

- (ASORemoteOverlay)remoteOverlay
{
  return self->_remoteOverlay;
}

- (void)setRemoteOverlay:(id)a3
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