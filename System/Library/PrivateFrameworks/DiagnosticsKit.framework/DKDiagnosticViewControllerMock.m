@interface DKDiagnosticViewControllerMock
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isSetup;
- (BOOL)shouldShowPressHomeLabel;
- (Class)inputsClass;
- (DKDiagnosticContextMock)context;
- (DKDiagnosticViewControllerMock)init;
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
- (void)setShouldShowPressHomeLabel:(BOOL)a3;
@end

@implementation DKDiagnosticViewControllerMock

- (DKDiagnosticViewControllerMock)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewControllerMock;
  v2 = [(DKDiagnosticViewControllerMock *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v2->_setup = 0;
    v2->_finished = 0;
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
  [(DKDiagnosticViewControllerMock *)self setCompletion:v15];

  v16 = objc_opt_new();
  [(DKDiagnosticViewControllerMock *)self setContext:v16];

  id v17 = objc_alloc_init(MEMORY[0x263F08AB8]);
  [(DKDiagnosticViewControllerMock *)self setProgress:v17];

  v18 = objc_alloc_init(DKMutableDiagnosticResult);
  [(DKDiagnosticViewControllerMock *)self setResult:v18];

  [(DKDiagnosticViewControllerMock *)self setInputsClass:a3];
  id v20 = +[DKUtilities inputsForDiagnostic:self predicates:v14 specifications:v13 parameters:v12];

  if (![(DKDiagnosticViewControllerMock *)self isFinished])
  {
    [(DKDiagnosticViewControllerMock *)self setSetup:1];
    if (objc_opt_respondsToSelector())
    {
      v19 = [(DKDiagnosticViewControllerMock *)self context];
      [(DKDiagnosticViewControllerMock *)self setupWithInputs:v20 responder:v19];
    }
    if (![(DKDiagnosticViewControllerMock *)self isFinished]) {
      [(DKDiagnosticViewControllerMock *)self start];
    }
  }
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DKDiagnosticViewControllerMock *)self finishedLock];
  [v5 lock];

  if (self->_finished || !v3)
  {
    v8 = [(DKDiagnosticViewControllerMock *)self finishedLock];
    [v8 unlock];
  }
  else
  {
    self->_finished = 1;
    objc_super v7 = [(DKDiagnosticViewControllerMock *)self finishedLock];
    [v7 unlock];

    if ([(DKDiagnosticViewControllerMock *)self isSetup] && (objc_opt_respondsToSelector() & 1) != 0) {
      [(DKDiagnosticViewControllerMock *)self teardown];
    }
    v8 = [(DKDiagnosticViewControllerMock *)self completion];
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
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:1 context:ProgressObserverContext];
  [v5 addObserver:self forKeyPath:@"totalUnitCount" options:1 context:ProgressObserverContext];
  [v5 addObserver:self forKeyPath:@"indeterminate" options:1 context:ProgressObserverContext];
  [v5 addObserver:self forKeyPath:@"userInfo.NSProgressEstimatedTimeRemainingKey" options:1 context:ProgressObserverContext];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)ProgressObserverContext == a6)
  {
    objc_super v7 = [DKDiagnosticProgress alloc];
    v8 = [(DKDiagnosticViewControllerMock *)self progress];
    v10 = [(DKDiagnosticProgress *)v7 initWithProgress:v8];

    v9 = [(DKDiagnosticViewControllerMock *)self context];
    [v9 updateProgress:v10 forTest:&unk_26F0DB9A8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DKDiagnosticViewControllerMock;
    -[DKDiagnosticViewControllerMock observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
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

- (BOOL)shouldShowPressHomeLabel
{
  return self->_shouldShowPressHomeLabel;
}

- (void)setShouldShowPressHomeLabel:(BOOL)a3
{
  self->_shouldShowPressHomeLabel = a3;
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