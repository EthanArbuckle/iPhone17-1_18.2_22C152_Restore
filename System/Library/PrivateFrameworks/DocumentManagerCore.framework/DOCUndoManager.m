@interface DOCUndoManager
+ (DOCUndoManager)shared;
- (BOOL)isActionOperation:(id)a3;
- (BOOL)processSupportsUndoingActions;
- (BOOL)shouldRemoveAllActions;
- (DOCUndoManager)init;
- (void)dealloc;
- (void)didPerformUndoableOperation;
- (void)registerUndoOperationForSender:(id)a3;
- (void)setShouldRemoveAllActions:(BOOL)a3;
- (void)startUndoNotificationsObservation;
- (void)stopUndoNotificationsObservation;
@end

@implementation DOCUndoManager

+ (DOCUndoManager)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_12);
  }
  v2 = (void *)shared_undoManager;
  return (DOCUndoManager *)v2;
}

uint64_t __24__DOCUndoManager_shared__block_invoke()
{
  v0 = objc_alloc_init(DOCUndoManager);
  uint64_t v1 = shared_undoManager;
  shared_undoManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCUndoManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)DOCUndoManager;
  v2 = [(DOCUndoManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DOCUndoManager *)v2 setGroupsByEvent:0];
    [(DOCUndoManager *)v3 startUndoNotificationsObservation];
  }
  return v3;
}

- (void)dealloc
{
  [(DOCUndoManager *)self stopUndoNotificationsObservation];
  v3.receiver = self;
  v3.super_class = (Class)DOCUndoManager;
  [(DOCUndoManager *)&v3 dealloc];
}

- (void)startUndoNotificationsObservation
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_didPerformUndoableOperation name:*MEMORY[0x263F08630] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_didPerformUndoableOperation name:*MEMORY[0x263F08638] object:0];
}

- (void)stopUndoNotificationsObservation
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)didPerformUndoableOperation
{
  if ([(DOCUndoManager *)self shouldRemoveAllActions])
  {
    [(DOCUndoManager *)self setShouldRemoveAllActions:0];
    [(DOCUndoManager *)self removeAllActions];
  }
}

- (void)registerUndoOperationForSender:(id)a3
{
  id v4 = a3;
  if ([(DOCUndoManager *)self processSupportsUndoingActions])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__DOCUndoManager_registerUndoOperationForSender___block_invoke;
    v5[3] = &unk_2641B5600;
    v5[4] = self;
    id v6 = v4;
    DOCRunInMainThread(v5);
  }
}

void __49__DOCUndoManager_registerUndoOperationForSender___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  [*(id *)(a1 + 32) beginUndoGrouping];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__DOCUndoManager_registerUndoOperationForSender___block_invoke_2;
  v5[3] = &unk_2641B6130;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  [v2 registerUndoWithTarget:v3 handler:v5];
  id v4 = [*(id *)(a1 + 40) actionNameForUndoing];
  if (v4) {
    [*(id *)(a1 + 32) setActionName:v4];
  }
  [*(id *)(a1 + 32) endUndoGrouping];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__DOCUndoManager_registerUndoOperationForSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) operationForUndoing];
    if (v2)
    {
      if ([WeakRetained isActionOperation:*(void *)(a1 + 32)]
        && [WeakRetained isActionOperation:v2])
      {
        uint64_t v3 = *(void **)(a1 + 32);
        id v4 = v2;
        objc_super v5 = [v3 itemManager];
        [v5 scheduleAction:v4];
      }
    }
    else
    {
      [WeakRetained setShouldRemoveAllActions:1];
    }
  }
}

- (BOOL)isActionOperation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)processSupportsUndoingActions
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 processName];

  LOBYTE(v2) = [&unk_26C40CBC8 containsObject:v3];
  return (char)v2;
}

- (BOOL)shouldRemoveAllActions
{
  return self->_shouldRemoveAllActions;
}

- (void)setShouldRemoveAllActions:(BOOL)a3
{
  self->_shouldRemoveAllActions = a3;
}

@end