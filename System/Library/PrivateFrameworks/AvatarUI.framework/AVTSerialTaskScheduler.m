@interface AVTSerialTaskScheduler
+ (id)fifoScheduler;
+ (id)fifoSchedulerWithEnvironment:(id)a3;
+ (id)lifoScheduler;
+ (id)lifoSchedulerWithEnvironment:(id)a3;
+ (id)nextTaskToRunForPriorityTasks:(id)a3 backlogTasks:(id)a4 order:(int64_t)a5;
- (AVTSerialTaskScheduler)initWithEnvironment:(id)a3 order:(int64_t)a4;
- (NSMutableArray)backlogTasks;
- (NSMutableArray)priorityTasks;
- (OS_dispatch_queue)stateLock;
- (int64_t)order;
- (void)cancelAllTasks;
- (void)didCompleteTask:(id)a3;
- (void)lowerTaskPriority:(id)a3;
- (void)performStateWork:(id)a3;
- (void)scheduleTask:(id)a3;
- (void)startTask:(id)a3;
@end

@implementation AVTSerialTaskScheduler

+ (id)lifoScheduler
{
  v3 = [MEMORY[0x263F29740] defaultEnvironment];
  v4 = [a1 lifoSchedulerWithEnvironment:v3];

  return v4;
}

+ (id)fifoScheduler
{
  v3 = [MEMORY[0x263F29740] defaultEnvironment];
  v4 = [a1 fifoSchedulerWithEnvironment:v3];

  return v4;
}

+ (id)lifoSchedulerWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithEnvironment:v4 order:1];

  return v5;
}

+ (id)fifoSchedulerWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithEnvironment:v4 order:0];

  return v5;
}

- (AVTSerialTaskScheduler)initWithEnvironment:(id)a3 order:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTSerialTaskScheduler;
  v7 = [(AVTSerialTaskScheduler *)&v16 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    priorityTasks = v7->_priorityTasks;
    v7->_priorityTasks = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    backlogTasks = v7->_backlogTasks;
    v7->_backlogTasks = (NSMutableArray *)v10;

    v7->_order = a4;
    v12 = [v6 lockProvider];
    uint64_t v13 = ((void (**)(void, const char *))v12)[2](v12, "com.apple.AvatarUI.AVTLIFOScheduler.stateLock");
    stateLock = v7->_stateLock;
    v7->_stateLock = (OS_dispatch_queue *)v13;
  }
  return v7;
}

- (void)performStateWork:(id)a3
{
  id v4 = a3;
  v5 = [(AVTSerialTaskScheduler *)self stateLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AVTSerialTaskScheduler_performStateWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __43__AVTSerialTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) priorityTasks];
  v3 = [*(id *)(a1 + 32) backlogTasks];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)scheduleTask:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v5 = (void *)[v4 copy];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __39__AVTSerialTaskScheduler_scheduleTask___block_invoke;
  uint64_t v10 = &unk_263FF18B0;
  id v6 = v5;
  id v11 = v6;
  v12 = &v13;
  [(AVTSerialTaskScheduler *)self performStateWork:&v7];
  if (*((unsigned char *)v14 + 24)) {
    -[AVTSerialTaskScheduler startTask:](self, "startTask:", v6, v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);
}

void __39__AVTSerialTaskScheduler_scheduleTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x210530210](v5);
  [v6 addObject:v7];

  uint64_t v8 = [v6 count];
  BOOL v9 = v8 == 1 && [v10 count] == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

- (void)startTask:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __36__AVTSerialTaskScheduler_startTask___block_invoke;
  BOOL v9 = &unk_263FF0A28;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = v4;
  id v10 = v5;
  v4[2]();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __36__AVTSerialTaskScheduler_startTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didCompleteTask:*(void *)(a1 + 32)];
}

- (void)didCompleteTask:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke;
  v6[3] = &unk_263FF1900;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = &v9;
  v6[4] = self;
  [(AVTSerialTaskScheduler *)self performStateWork:v6];
  if (v10[5]) {
    -[AVTSerialTaskScheduler startTask:](self, "startTask:");
  }

  _Block_object_dispose(&v9, 8);
}

void __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke_2;
  v13[3] = &unk_263FF18D8;
  id v14 = *(id *)(a1 + 40);
  id v7 = (uint64_t (**)(void, void))MEMORY[0x210530210](v13);
  char v8 = ((uint64_t (**)(void, id))v7)[2](v7, v5);
  int v9 = ((uint64_t (**)(void, id))v7)[2](v7, v6);
  if ((v8 & 1) != 0 || v9)
  {
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "nextTaskToRunForPriorityTasks:backlogTasks:order:", v5, v6, objc_msgSend(*(id *)(a1 + 32), "order"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

BOOL __42__AVTSerialTaskScheduler_didCompleteTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x210530210](*(void *)(a1 + 32));
  uint64_t v5 = [v3 indexOfObject:v4];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [v3 removeObjectAtIndex:v5];
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)cancelAllTasks
{
}

void __40__AVTSerialTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 removeAllObjects];
  [v4 removeAllObjects];
}

- (void)lowerTaskPriority:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__AVTSerialTaskScheduler_lowerTaskPriority___block_invoke;
  v6[3] = &unk_263FF1948;
  id v7 = v4;
  id v5 = v4;
  [(AVTSerialTaskScheduler *)self performStateWork:v6];
}

void __44__AVTSerialTaskScheduler_lowerTaskPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x210530210](*(void *)(a1 + 32));
  uint64_t v7 = [v10 indexOfObject:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = [v10 objectAtIndexedSubscript:v7];
    [v10 removeObjectAtIndex:v7];
    int v9 = (void *)MEMORY[0x210530210](v8);
    [v5 addObject:v9];
  }
}

+ (id)nextTaskToRunForPriorityTasks:(id)a3 backlogTasks:(id)a4 order:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count]) {
    int v9 = v7;
  }
  else {
    int v9 = v8;
  }
  id v10 = v9;
  if (![v10 count])
  {
    v12 = 0;
    goto LABEL_13;
  }
  if (a5)
  {
    if (a5 != 1)
    {
      uint64_t v13 = 0;
      goto LABEL_12;
    }
    uint64_t v11 = [v10 lastObject];
  }
  else
  {
    uint64_t v11 = [v10 firstObject];
  }
  uint64_t v13 = (void *)v11;
LABEL_12:
  v12 = (void *)MEMORY[0x210530210](v13);

LABEL_13:
  return v12;
}

- (NSMutableArray)priorityTasks
{
  return self->_priorityTasks;
}

- (NSMutableArray)backlogTasks
{
  return self->_backlogTasks;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (int64_t)order
{
  return self->_order;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_backlogTasks, 0);
  objc_storeStrong((id *)&self->_priorityTasks, 0);
}

@end