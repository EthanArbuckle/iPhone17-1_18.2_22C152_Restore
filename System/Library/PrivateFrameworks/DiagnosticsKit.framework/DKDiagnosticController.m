@interface DKDiagnosticController
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isSetup;
- (BOOL)isXPC;
- (DKDiagnosticContext)context;
- (DKDiagnosticController)init;
- (DKMutableDiagnosticResult)result;
- (NSLock)finishedLock;
- (NSProgress)progress;
- (void)beginRequestWithDiagnosticContext:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCancelled:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFinishedLock:(id)a3;
- (void)setIsXPC:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setResult:(id)a3;
- (void)setSetup:(BOOL)a3;
@end

@implementation DKDiagnosticController

- (DKDiagnosticController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticController;
  v2 = [(DKDiagnosticController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_setup = 0;
    *(_WORD *)&v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;

    v3->_isXPC = 0;
  }
  return v3;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[DKDiagnosticController beginRequestWithExtensionContext:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(DKDiagnosticController *)self setContext:v4];
  id v6 = objc_alloc_init(MEMORY[0x263F08AB8]);
  [(DKDiagnosticController *)self setProgress:v6];

  objc_super v7 = objc_alloc_init(DKMutableDiagnosticResult);
  [(DKDiagnosticController *)self setResult:v7];
}

- (void)beginRequestWithDiagnosticContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[DKDiagnosticController beginRequestWithDiagnosticContext:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(DKDiagnosticController *)self setIsXPC:1];
  [(DKDiagnosticController *)self setContext:v4];

  id v6 = objc_alloc_init(MEMORY[0x263F08AB8]);
  [(DKDiagnosticController *)self setProgress:v6];

  objc_super v7 = objc_alloc_init(DKMutableDiagnosticResult);
  [(DKDiagnosticController *)self setResult:v7];
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DKDiagnosticController *)self finishedLock];
  [v5 lock];

  if (self->_finished || !v3)
  {
    id v19 = [(DKDiagnosticController *)self finishedLock];
    [v19 unlock];
  }
  else
  {
    self->_finished = v3;
    objc_super v7 = [(DKDiagnosticController *)self finishedLock];
    [v7 unlock];

    self->_finished = v3;
    BOOL v8 = [(DKDiagnosticController *)self isSetup];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(DKDiagnosticController *)self teardown];
    }
    v9 = [(DKDiagnosticController *)self result];
    +[DKUtilities moveFilesToSharedContainerInMutableResult:v9];

    if (![(DKDiagnosticController *)self isXPC])
    {
      uint64_t v10 = [(DKDiagnosticController *)self result];
      v11 = [v10 files];
      v12 = [(DKDiagnosticController *)self context];
      v13 = v12;
      if (v12) {
        [v12 auditToken];
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      v14 = +[DKSandboxExtension issueSandboxExtensionsForFiles:v11 toAuditToken:v21];
      v15 = [(DKDiagnosticController *)self result];
      [v15 setFileSandboxTokens:v14];
    }
    v16 = [(DKDiagnosticController *)self context];
    v17 = [(DKDiagnosticController *)self result];
    v18 = (void *)[v17 copy];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __38__DKDiagnosticController_setFinished___block_invoke;
    v20[3] = &unk_264E86710;
    v20[4] = self;
    [v16 completeWithDiagnosticResult:v18 completion:v20];
  }
}

void __38__DKDiagnosticController_setFinished___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isXPC] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) context];
    [v2 completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:0];
  }
}

- (void)setCancelled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);
}

- (BOOL)isCancelled
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:1 context:ProgressObserverContext_2];
  [v5 addObserver:self forKeyPath:@"totalUnitCount" options:1 context:ProgressObserverContext_2];
  [v5 addObserver:self forKeyPath:@"indeterminate" options:1 context:ProgressObserverContext_2];
  [v5 addObserver:self forKeyPath:@"userInfo.NSProgressEstimatedTimeRemainingKey" options:1 context:ProgressObserverContext_2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)ProgressObserverContext_2 == a6)
  {
    objc_super v7 = [DKDiagnosticProgress alloc];
    BOOL v8 = [(DKDiagnosticController *)self progress];
    v12 = [(DKDiagnosticProgress *)v7 initWithProgress:v8];

    v9 = [(DKDiagnosticController *)self context];
    uint64_t v10 = [(DKDiagnosticController *)self context];
    v11 = [v10 testID];
    [v9 updateProgress:v12 forTest:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DKDiagnosticController;
    -[DKDiagnosticController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (DKMutableDiagnosticResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (BOOL)isXPC
{
  return self->_isXPC;
}

- (void)setIsXPC:(BOOL)a3
{
  self->_isXPC = a3;
}

- (DKDiagnosticContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSLock)finishedLock
{
  return self->_finishedLock;
}

- (void)setFinishedLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end