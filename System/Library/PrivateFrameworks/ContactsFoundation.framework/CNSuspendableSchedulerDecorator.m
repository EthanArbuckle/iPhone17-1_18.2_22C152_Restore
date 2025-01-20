@interface CNSuspendableSchedulerDecorator
+ (id)resumedSchedulerWithScheduler:(id)a3;
+ (id)suspendedSchedulerWithScheduler:(id)a3;
- (CNQueue)queue;
- (CNScheduler)scheduler;
- (CNSuspendableSchedulerDecorator)initWithScheduler:(id)a3;
- (NSConditionLock)lock;
- (NSString)description;
- (double)timestamp;
- (id)_nts_enqueueCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)_performFirstQueuedTask;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)resume;
- (void)suspend;
@end

@implementation CNSuspendableSchedulerDecorator

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v7 = [(CNSuspendableSchedulerDecorator *)self lock];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__CNSuspendableSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v14[3] = &unk_1E56A1500;
  v14[4] = self;
  v16 = &v19;
  v17 = &v23;
  id v8 = v6;
  id v15 = v8;
  unint64_t v18 = a4;
  CNRunWithLock(v7, v14);

  if (*((unsigned char *)v20 + 24))
  {
    v9 = [(CNSuspendableSchedulerDecorator *)self scheduler];
    uint64_t v10 = [v9 performCancelableBlock:v8 qualityOfService:a4];
    v11 = (void *)v24[5];
    v24[5] = v10;
  }
  id v12 = (id)v24[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (void)suspend
{
  v3 = [(CNSuspendableSchedulerDecorator *)self lock];
  [v3 lock];

  id v4 = [(CNSuspendableSchedulerDecorator *)self lock];
  [v4 unlockWithCondition:0];
}

- (void)resume
{
  v3 = [(CNSuspendableSchedulerDecorator *)self lock];
  [v3 lock];

  id v4 = [(CNSuspendableSchedulerDecorator *)self lock];
  [v4 unlockWithCondition:1];

  v5 = [(CNSuspendableSchedulerDecorator *)self scheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNSuspendableSchedulerDecorator_resume__block_invoke;
  v6[3] = &unk_1E569F9D8;
  v6[4] = self;
  [v5 performBlock:v6];
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void)_performFirstQueuedTask
{
  v3 = [(CNSuspendableSchedulerDecorator *)self lock];
  [v3 lock];

  id v4 = [(CNSuspendableSchedulerDecorator *)self lock];
  uint64_t v5 = [v4 condition];

  if (v5)
  {
    id v6 = [(CNSuspendableSchedulerDecorator *)self queue];
    v7 = [v6 dequeue];

    id v8 = [(CNSuspendableSchedulerDecorator *)self lock];
    id v10 = v8;
    if (v7)
    {
      [v8 unlockWithCondition:1];

      v7[2](v7);
      v9 = [(CNSuspendableSchedulerDecorator *)self scheduler];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__CNSuspendableSchedulerDecorator__performFirstQueuedTask__block_invoke;
      v11[3] = &unk_1E569F9D8;
      v11[4] = self;
      [v9 performBlock:v11];

      return;
    }
    [v8 unlockWithCondition:2];
  }
  else
  {
    id v10 = [(CNSuspendableSchedulerDecorator *)self lock];
    [v10 unlock];
  }
}

- (NSConditionLock)lock
{
  return self->_lock;
}

- (CNQueue)queue
{
  return self->_queue;
}

uint64_t __41__CNSuspendableSchedulerDecorator_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performFirstQueuedTask];
}

void __75__CNSuspendableSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lock];
  uint64_t v3 = [v2 condition];

  if (v3 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_nts_enqueueCancelableBlock:qualityOfService:", *(void *)(a1 + 40), *(void *)(a1 + 64));
    MEMORY[0x1F41817F8]();
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__CNSuspendableSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E56A0100;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(CNSuspendableSchedulerDecorator *)self performCancelableBlock:v9 qualityOfService:a4];
}

uint64_t __65__CNSuspendableSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBlock:(id)a3
{
}

uint64_t __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__CNSuspendableSchedulerDecorator__performFirstQueuedTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performFirstQueuedTask];
}

+ (id)suspendedSchedulerWithScheduler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithScheduler:v4];

  return v5;
}

- (CNSuspendableSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSuspendableSchedulerDecorator;
  id v6 = [(CNSuspendableSchedulerDecorator *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    id v8 = objc_alloc_init(CNQueue);
    queue = v7->_queue;
    v7->_queue = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    lock = v7->_lock;
    v7->_lock = (NSConditionLock *)v10;

    id v12 = v7;
  }

  return v7;
}

- (id)_nts_enqueueCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(CNCancelationToken);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke;
  v26[3] = &unk_1E569F468;
  id v8 = v6;
  id v28 = v8;
  v9 = v7;
  v27 = v9;
  uint64_t v10 = v26;
  v11 = v10;
  dispatch_qos_class_t v12 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v13 = _Block_copy(v10);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v12 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v14 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v12, 0, v10);
LABEL_8:
      id v15 = v14;
      v13 = self;

LABEL_9:
      v16 = (void *)[v13 copy];

      v17 = [(CNSuspendableSchedulerDecorator *)self queue];
      unint64_t v18 = _Block_copy(v16);
      [v17 enqueue:v18];

      objc_initWeak(&location, self);
      objc_initWeak(&from, v16);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_2;
      v21[3] = &unk_1E56A1528;
      objc_copyWeak(&v22, &location);
      objc_copyWeak(&v23, &from);
      [(CNCancelationToken *)v9 addCancelationBlock:v21];
      uint64_t v19 = v9;
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      return v19;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (id)performCancelableBlock:(id)a3
{
  return [(CNSuspendableSchedulerDecorator *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = objc_alloc_init(CNCancelationToken);
  uint64_t v10 = [(CNSuspendableSchedulerDecorator *)self scheduler];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  unint64_t v18 = __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  uint64_t v19 = &unk_1E56A1550;
  v20 = self;
  id v22 = v8;
  unint64_t v23 = a5;
  v11 = v9;
  uint64_t v21 = v11;
  id v12 = v8;
  v13 = [v10 afterDelay:&v16 performBlock:a3];

  -[CNCancelationToken addCancelable:](v11, "addCancelable:", v13, v16, v17, v18, v19, v20);
  dispatch_block_t v14 = v11;

  return v14;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(CNSuspendableSchedulerDecorator *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

+ (id)resumedSchedulerWithScheduler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithScheduler:v4];

  [v5 resume];

  return v5;
}

- (NSString)description
{
  uint64_t v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"scheduler" object:self->_scheduler];
  NSInteger v5 = [(NSConditionLock *)self->_lock condition];
  id v6 = @"CNSuspendableSchedulerConditionBuffering";
  if (v5 == 1) {
    id v6 = @"CNSuspendableSchedulerConditionDraining";
  }
  if (v5 == 2) {
    id v7 = @"CNSuspendableSchedulerConditionRelaying";
  }
  else {
    id v7 = v6;
  }
  id v8 = (id)[v3 appendName:@"status" object:v7];
  v9 = [v3 build];

  return (NSString *)v9;
}

void __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained lock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_3;
  v4[3] = &unk_1E569FDB8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4[4] = WeakRetained;
  CNRunWithLock(v3, v4);

  objc_destroyWeak(&v5);
}

void __80__CNSuspendableSchedulerDecorator__nts_enqueueCancelableBlock_qualityOfService___block_invoke_3(uint64_t a1)
{
  id aBlock = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) queue];
  uint64_t v3 = _Block_copy(aBlock);
  [v2 dequeueObject:v3];
}

void __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v4[3] = &unk_1E56A0100;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 performCancelableBlock:v4 qualityOfService:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) addCancelable:v3];
}

uint64_t __76__CNSuspendableSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)timestamp
{
  v2 = [(CNSuspendableSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

@end