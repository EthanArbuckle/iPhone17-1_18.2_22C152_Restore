@interface CNBlockCountingSchedulerDecorator
+ (id)os_log;
- (CNBlockCountingSchedulerDecorator)initWithScheduler:(id)a3;
- (CNScheduler)scheduler;
- (NSString)description;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (unint64_t)activeBlockCount;
- (unint64_t)completedBlockCount;
- (unint64_t)pendingBlockCount;
- (void)blockBecameActive;
- (void)blockBecameCompleted;
- (void)blockBecamePending;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNBlockCountingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_14);
  }
  v2 = (void *)os_log_cn_once_object_1;

  return v2;
}

uint64_t __43__CNBlockCountingSchedulerDecorator_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.debug", "scheduler-counting");

  return MEMORY[0x1F41817F8]();
}

- (CNBlockCountingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNBlockCountingSchedulerDecorator;
  v6 = [(CNBlockCountingSchedulerDecorator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  id v5 = (id)[v3 appendName:@"scheduler" object:v4];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)blockBecamePending
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = 134218752;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  _os_log_debug_impl(&dword_19091D000, log, OS_LOG_TYPE_DEBUG, "Scheduler %p has new pending block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v6, 0x2Au);
}

- (void)blockBecameActive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  *(int64x2_t *)&v2->_unint64_t pendingBlockCount = vaddq_s64(*(int64x2_t *)&v2->_pendingBlockCount, (int64x2_t)xmmword_1909B6230);
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t pendingBlockCount = v2->_pendingBlockCount;
    unint64_t activeBlockCount = v2->_activeBlockCount;
    unint64_t completedBlockCount = v2->_completedBlockCount;
    int v7 = 134218752;
    __int16 v8 = v2;
    __int16 v9 = 2048;
    unint64_t v10 = pendingBlockCount;
    __int16 v11 = 2048;
    unint64_t v12 = activeBlockCount;
    __int16 v13 = 2048;
    unint64_t v14 = completedBlockCount;
    _os_log_debug_impl(&dword_19091D000, v3, OS_LOG_TYPE_DEBUG, "Scheduler %p has new active block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v7, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (void)blockBecameCompleted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  *(int64x2_t *)&v2->_unint64_t activeBlockCount = vaddq_s64(*(int64x2_t *)&v2->_activeBlockCount, (int64x2_t)xmmword_1909B6230);
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t pendingBlockCount = v2->_pendingBlockCount;
    unint64_t activeBlockCount = v2->_activeBlockCount;
    unint64_t completedBlockCount = v2->_completedBlockCount;
    int v7 = 134218752;
    __int16 v8 = v2;
    __int16 v9 = 2048;
    unint64_t v10 = pendingBlockCount;
    __int16 v11 = 2048;
    unint64_t v12 = activeBlockCount;
    __int16 v13 = 2048;
    unint64_t v14 = completedBlockCount;
    _os_log_debug_impl(&dword_19091D000, v3, OS_LOG_TYPE_DEBUG, "Scheduler %p has new completed block (%lu pending, %lu active, %lu completed)", (uint8_t *)&v7, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  uint64_t v5 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNBlockCountingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E569FA00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __50__CNBlockCountingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 blockBecameCompleted];
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  int v7 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CNBlockCountingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E569FA00;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9 qualityOfService:a4];
}

uint64_t __67__CNBlockCountingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 blockBecameCompleted];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  uint64_t v5 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CNBlockCountingSchedulerDecorator_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E569FE70;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = [v5 performCancelableBlock:v9];

  return v7;
}

uint64_t __60__CNBlockCountingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 blockBecameCompleted];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  int v7 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__CNBlockCountingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E569FE70;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  __int16 v9 = [v7 performCancelableBlock:v11 qualityOfService:a4];

  return v9;
}

uint64_t __77__CNBlockCountingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 blockBecameCompleted];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  int v7 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CNBlockCountingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E569FA00;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  __int16 v9 = [v7 afterDelay:v11 performBlock:a3];

  return v9;
}

uint64_t __61__CNBlockCountingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 blockBecameCompleted];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  [(CNBlockCountingSchedulerDecorator *)self blockBecamePending];
  __int16 v9 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__CNBlockCountingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E569FA00;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  __int16 v11 = [v9 afterDelay:v13 performBlock:a5 qualityOfService:a3];

  return v11;
}

uint64_t __78__CNBlockCountingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) blockBecameActive];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 blockBecameCompleted];
}

- (double)timestamp
{
  v2 = [(CNBlockCountingSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)pendingBlockCount
{
  return self->_pendingBlockCount;
}

- (unint64_t)activeBlockCount
{
  return self->_activeBlockCount;
}

- (unint64_t)completedBlockCount
{
  return self->_completedBlockCount;
}

- (void).cxx_destruct
{
}

@end