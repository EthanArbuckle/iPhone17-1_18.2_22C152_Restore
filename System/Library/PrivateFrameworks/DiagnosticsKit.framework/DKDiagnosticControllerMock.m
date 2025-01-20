@interface DKDiagnosticControllerMock
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isSetup;
- (Class)inputsClass;
- (DKDiagnosticContextMock)context;
- (DKDiagnosticControllerMock)init;
- (DKMutableDiagnosticResult)result;
- (NSLock)finishedLock;
- (NSProgress)progress;
- (id)completion;
- (void)beginRequestWithInputsClass:(Class)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6 completion:(id)a7;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFinishedLock:(id)a3;
- (void)setInputsClass:(Class)a3;
- (void)setProgress:(id)a3;
- (void)setResult:(id)a3;
- (void)setSetup:(BOOL)a3;
@end

@implementation DKDiagnosticControllerMock

- (DKDiagnosticControllerMock)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticControllerMock;
  v2 = [(DKDiagnosticControllerMock *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_setup = 0;
    *(_WORD *)&v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;
  }
  return v3;
}

- (void)beginRequestWithInputsClass:(Class)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = (void *)[a7 copy];
  [(DKDiagnosticControllerMock *)self setCompletion:v15];

  v16 = objc_opt_new();
  [(DKDiagnosticControllerMock *)self setContext:v16];

  id v17 = objc_alloc_init(MEMORY[0x263F08AB8]);
  [(DKDiagnosticControllerMock *)self setProgress:v17];

  v18 = objc_alloc_init(DKMutableDiagnosticResult);
  [(DKDiagnosticControllerMock *)self setResult:v18];

  [(DKDiagnosticControllerMock *)self setInputsClass:a3];
  id v20 = +[DKUtilities inputsForDiagnostic:self predicates:v14 specifications:v13 parameters:v12];

  if (![(DKDiagnosticControllerMock *)self isFinished])
  {
    [(DKDiagnosticControllerMock *)self setSetup:1];
    if (objc_opt_respondsToSelector())
    {
      v19 = [(DKDiagnosticControllerMock *)self context];
      [(DKDiagnosticControllerMock *)self setupWithInputs:v20 responder:v19];
    }
    if (![(DKDiagnosticControllerMock *)self isFinished]) {
      [(DKDiagnosticControllerMock *)self start];
    }
  }
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DKDiagnosticControllerMock *)self finishedLock];
  [v5 lock];

  if (self->_finished || !v3)
  {
    v8 = [(DKDiagnosticControllerMock *)self finishedLock];
    [v8 unlock];
  }
  else
  {
    self->_finished = v3;
    objc_super v7 = [(DKDiagnosticControllerMock *)self finishedLock];
    [v7 unlock];

    self->_finished = v3;
    if ([(DKDiagnosticControllerMock *)self isSetup] && (objc_opt_respondsToSelector() & 1) != 0) {
      [(DKDiagnosticControllerMock *)self teardown];
    }
    v8 = [(DKDiagnosticControllerMock *)self completion];
    v8[2]();
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
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:1 context:ProgressObserverContext_1];
  [v5 addObserver:self forKeyPath:@"totalUnitCount" options:1 context:ProgressObserverContext_1];
  [v5 addObserver:self forKeyPath:@"indeterminate" options:1 context:ProgressObserverContext_1];
  [v5 addObserver:self forKeyPath:@"userInfo.NSProgressEstimatedTimeRemainingKey" options:1 context:ProgressObserverContext_1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)ProgressObserverContext_1 == a6)
  {
    objc_super v7 = [DKDiagnosticProgress alloc];
    v8 = [(DKDiagnosticControllerMock *)self progress];
    v10 = [(DKDiagnosticProgress *)v7 initWithProgress:v8];

    v9 = [(DKDiagnosticControllerMock *)self context];
    [v9 updateProgress:v10 forTest:&unk_26F0DB9D8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DKDiagnosticControllerMock;
    -[DKDiagnosticControllerMock observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
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

- (DKDiagnosticContextMock)context
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

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (Class)inputsClass
{
  return self->_inputsClass;
}

- (void)setInputsClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputsClass, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end