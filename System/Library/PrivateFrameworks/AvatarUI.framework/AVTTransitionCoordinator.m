@interface AVTTransitionCoordinator
+ (id)concurrentTransitionCoordinatorWithDelay:(double)a3;
+ (id)eventHandlerForCoordinator:(id)a3;
+ (id)synchronousTransitionCoordinator;
- (AVTTransitionCoordinator)init;
- (AVTTransitionScheduler)scheduler;
- (NSMutableArray)pendingTransitions;
- (NSMutableArray)runningTransitions;
- (double)delay;
- (id)allTransitions;
- (id)transitionsMatchingModel:(id)a3;
- (void)addTransition:(id)a3;
- (void)cancelAllTransitions;
- (void)cancelTransitionsMatchingModel:(id)a3;
- (void)dealloc;
- (void)didCompleteRunningTransition:(id)a3;
- (void)setScheduler:(id)a3;
- (void)startNextTransition;
@end

@implementation AVTTransitionCoordinator

+ (id)synchronousTransitionCoordinator
{
  v3 = objc_alloc_init(AVTTransitionCoordinator);
  v4 = [a1 eventHandlerForCoordinator:v3];
  v5 = +[AVTTransitionSchedulerFactory synchronousTransitionSchedulerWithEventHandler:v4];
  [(AVTTransitionCoordinator *)v3 setScheduler:v5];

  return v3;
}

+ (id)concurrentTransitionCoordinatorWithDelay:(double)a3
{
  v5 = objc_alloc_init(AVTTransitionCoordinator);
  v6 = [a1 eventHandlerForCoordinator:v5];
  v7 = +[AVTTransitionSchedulerFactory concurrentTransitionSchedulerWithEventHandler:v6 delay:a3];
  [(AVTTransitionCoordinator *)v5 setScheduler:v7];

  return v5;
}

+ (id)eventHandlerForCoordinator:(id)a3
{
  objc_initWeak(&location, a3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AVTTransitionCoordinator_eventHandlerForCoordinator___block_invoke;
  v9[3] = &unk_263FF09D8;
  objc_copyWeak(&v10, &location);
  v3 = (void *)MEMORY[0x210530210](v9);
  v7 = (void *)MEMORY[0x210530210](v3, v4, v5, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __55__AVTTransitionCoordinator_eventHandlerForCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startNextTransition];
}

- (AVTTransitionCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVTTransitionCoordinator;
  v2 = [(AVTTransitionCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    pendingTransitions = v2->_pendingTransitions;
    v2->_pendingTransitions = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    runningTransitions = v2->_runningTransitions;
    v2->_runningTransitions = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(AVTTransitionCoordinator *)self scheduler];
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)AVTTransitionCoordinator;
  [(AVTTransitionCoordinator *)&v4 dealloc];
}

- (void)addTransition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTTransitionCoordinator *)self pendingTransitions];
  [v5 addObject:v4];

  id v6 = [(AVTTransitionCoordinator *)self scheduler];
  [v6 scheduleEvent];
}

- (void)didCompleteRunningTransition:(id)a3
{
  id v8 = a3;
  id v4 = [(AVTTransitionCoordinator *)self runningTransitions];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = [(AVTTransitionCoordinator *)self runningTransitions];
    [v6 removeObject:v8];

    v7 = [(AVTTransitionCoordinator *)self scheduler];
    [v7 didCompleteEvent];
  }
}

- (void)startNextTransition
{
  uint64_t v3 = [(AVTTransitionCoordinator *)self pendingTransitions];
  id v4 = [v3 firstObject];

  if (v4)
  {
    int v5 = [v4 completionHandler];
    objc_initWeak(&location, v4);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __47__AVTTransitionCoordinator_startNextTransition__block_invoke;
    v13 = &unk_263FF2880;
    id v6 = v5;
    id v15 = v6;
    objc_copyWeak(&v16, &location);
    v14 = self;
    [v4 setCompletionHandler:&v10];
    v7 = [(AVTTransitionCoordinator *)self runningTransitions];
    [v7 addObject:v4];

    id v8 = [(AVTTransitionCoordinator *)self pendingTransitions];
    [v8 removeObject:v4];

    [v4 start];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else
  {
    v9 = [(AVTTransitionCoordinator *)self scheduler];
    [v9 stop];
  }
}

uint64_t __47__AVTTransitionCoordinator_startNextTransition__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id WeakRetained = (id)[*(id *)(a1 + 32) didCompleteRunningTransition:WeakRetained];
    id v4 = v6;
  }
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (id)transitionsMatchingModel:(id)a3
{
  id v4 = a3;
  int v5 = [(AVTTransitionCoordinator *)self allTransitions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__AVTTransitionCoordinator_transitionsMatchingModel___block_invoke;
  v10[3] = &unk_263FF28A8;
  id v11 = v4;
  id v6 = v4;
  v7 = [v5 indexesOfObjectsPassingTest:v10];
  if ([v7 count])
  {
    id v8 = [v5 objectsAtIndexes:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

BOOL __53__AVTTransitionCoordinator_transitionsMatchingModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 model];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)allTransitions
{
  uint64_t v3 = [(AVTTransitionCoordinator *)self pendingTransitions];
  BOOL v4 = [(AVTTransitionCoordinator *)self runningTransitions];
  int v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)cancelTransitionsMatchingModel:(id)a3
{
  id v5 = [(AVTTransitionCoordinator *)self transitionsMatchingModel:a3];
  BOOL v4 = [(AVTTransitionCoordinator *)self pendingTransitions];
  [v4 removeObjectsInArray:v5];

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_28];
}

uint64_t __59__AVTTransitionCoordinator_cancelTransitionsMatchingModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)cancelAllTransitions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AVTTransitionCoordinator *)self allTransitions];
  BOOL v4 = [(AVTTransitionCoordinator *)self pendingTransitions];
  [v4 removeAllObjects];

  id v5 = [(AVTTransitionCoordinator *)self runningTransitions];
  [v5 removeAllObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10++), "cancel", (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = [(AVTTransitionCoordinator *)self scheduler];

  if (v11)
  {
    v12 = [(AVTTransitionCoordinator *)self scheduler];
    [v12 stop];
  }
}

- (double)delay
{
  return self->_delay;
}

- (AVTTransitionScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableArray)pendingTransitions
{
  return self->_pendingTransitions;
}

- (NSMutableArray)runningTransitions
{
  return self->_runningTransitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTransitions, 0);
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end