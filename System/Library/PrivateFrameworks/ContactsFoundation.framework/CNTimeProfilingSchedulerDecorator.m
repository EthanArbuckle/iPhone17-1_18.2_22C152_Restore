@interface CNTimeProfilingSchedulerDecorator
+ (id)os_log;
- (CNScheduler)scheduler;
- (CNTimeProfilingSchedulerDecorator)initWithScheduler:(id)a3;
- (NSString)description;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (unint64_t)blockCounter;
- (unint64_t)nextBlockNumber;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNTimeProfilingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1_10 != -1) {
    dispatch_once(&os_log_cn_once_token_1_10, &__block_literal_global_52);
  }
  v2 = (void *)os_log_cn_once_object_1_10;

  return v2;
}

uint64_t __43__CNTimeProfilingSchedulerDecorator_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.debug", "scheduler-timing");
  uint64_t v1 = os_log_cn_once_object_1_10;
  os_log_cn_once_object_1_10 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNTimeProfilingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTimeProfilingSchedulerDecorator;
  v6 = [(CNTimeProfilingSchedulerDecorator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    v7->_blockCounter = 0;
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  id v5 = (id)[v3 appendName:@"scheduler" object:v4];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (unint64_t)nextBlockNumber
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t blockCounter = v2->_blockCounter;
  v2->_unint64_t blockCounter = blockCounter + 1;
  objc_sync_exit(v2);

  return blockCounter;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v5 timestamp];
  uint64_t v7 = v6;

  unint64_t v8 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  objc_super v10 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke;
  v12[3] = &unk_1E56A1628;
  id v13 = v4;
  unint64_t v14 = v8;
  uint64_t v15 = v7;
  v12[4] = self;
  id v11 = v4;
  [v10 performBlock:v12];
}

void __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) scheduler];
  [v2 timestamp];
  double v4 = v3;

  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = [*(id *)(a1 + 32) scheduler];
  [v6 timestamp];
  double v8 = v7;

  v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - v4];
    v12 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - *(double *)(a1 + 56)];
    int v13 = 134218498;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_19091D000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v7 timestamp];
  uint64_t v9 = v8;

  unint64_t v10 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  id v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  v12 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CNTimeProfilingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v14[3] = &unk_1E56A1628;
  id v15 = v6;
  unint64_t v16 = v10;
  uint64_t v17 = v9;
  v14[4] = self;
  id v13 = v6;
  [v12 performBlock:v14 qualityOfService:a4];
}

void __67__CNTimeProfilingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) scheduler];
  [v2 timestamp];
  double v4 = v3;

  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = [*(id *)(a1 + 32) scheduler];
  [v6 timestamp];
  double v8 = v7;

  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - v4];
    v12 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - *(double *)(a1 + 56)];
    int v13 = 134218498;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    unint64_t v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_19091D000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);
  }
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v5 timestamp];
  uint64_t v7 = v6;

  unint64_t v8 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  uint64_t v10 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__CNTimeProfilingSchedulerDecorator_performCancelableBlock___block_invoke;
  v14[3] = &unk_1E56A1650;
  id v15 = v4;
  unint64_t v16 = v8;
  uint64_t v17 = v7;
  v14[4] = self;
  id v11 = v4;
  v12 = [v10 performCancelableBlock:v14];

  return v12;
}

void __60__CNTimeProfilingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 scheduler];
  [v5 timestamp];
  double v7 = v6;

  unint64_t v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v9 = [*(id *)(a1 + 32) scheduler];
  [v9 timestamp];
  double v11 = v10;

  v12 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = +[CNTimeIntervalFormatter stringForTimeInterval:v11 - v7];
    id v15 = +[CNTimeIntervalFormatter stringForTimeInterval:v11 - *(double *)(a1 + 56)];
    int v16 = 134218498;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_debug_impl(&dword_19091D000, v12, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v16, 0x20u);
  }
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v7 timestamp];
  uint64_t v9 = v8;

  unint64_t v10 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  double v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  v12 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__CNTimeProfilingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E56A1650;
  id v17 = v6;
  unint64_t v18 = v10;
  uint64_t v19 = v9;
  v16[4] = self;
  id v13 = v6;
  uint64_t v14 = [v12 performCancelableBlock:v16 qualityOfService:a4];

  return v14;
}

void __77__CNTimeProfilingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 scheduler];
  [v5 timestamp];
  double v7 = v6;

  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v9 = [*(id *)(a1 + 32) scheduler];
  [v9 timestamp];
  double v11 = v10;

  v12 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = +[CNTimeIntervalFormatter stringForTimeInterval:v11 - v7];
    id v15 = +[CNTimeIntervalFormatter stringForTimeInterval:v11 - *(double *)(a1 + 56)];
    int v16 = 134218498;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_debug_impl(&dword_19091D000, v12, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v16, 0x20u);
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  double v7 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v7 timestamp];
  uint64_t v9 = v8;

  unint64_t v10 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  double v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  v12 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v16[3] = &unk_1E56A1628;
  id v17 = v6;
  unint64_t v18 = v10;
  uint64_t v19 = v9;
  v16[4] = self;
  id v13 = v6;
  uint64_t v14 = [v12 afterDelay:v16 performBlock:a3];

  return v14;
}

void __61__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) scheduler];
  [v2 timestamp];
  double v4 = v3;

  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = [*(id *)(a1 + 32) scheduler];
  [v6 timestamp];
  double v8 = v7;

  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - v4];
    v12 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - *(double *)(a1 + 56)];
    int v13 = 134218498;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    int v16 = v11;
    __int16 v17 = 2114;
    unint64_t v18 = v12;
    _os_log_debug_impl(&dword_19091D000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v9 timestamp];
  uint64_t v11 = v10;

  unint64_t v12 = [(CNTimeProfilingSchedulerDecorator *)self nextBlockNumber];
  int v13 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CNTimeProfilingSchedulerDecorator performBlock:]();
  }

  uint64_t v14 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v18[3] = &unk_1E56A1628;
  id v19 = v8;
  unint64_t v20 = v12;
  uint64_t v21 = v11;
  v18[4] = self;
  id v15 = v8;
  int v16 = [v14 afterDelay:v18 performBlock:a5 qualityOfService:a3];

  return v16;
}

void __78__CNTimeProfilingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) scheduler];
  [v2 timestamp];
  double v4 = v3;

  id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = [*(id *)(a1 + 32) scheduler];
  [v6 timestamp];
  double v8 = v7;

  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - v4];
    unint64_t v12 = +[CNTimeIntervalFormatter stringForTimeInterval:v8 - *(double *)(a1 + 56)];
    int v13 = 134218498;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    int v16 = v11;
    __int16 v17 = 2114;
    unint64_t v18 = v12;
    _os_log_debug_impl(&dword_19091D000, v9, OS_LOG_TYPE_DEBUG, "Completing block %lu %{public}@ after activating, %{public}@ after scheduling", (uint8_t *)&v13, 0x20u);
  }
}

- (double)timestamp
{
  v2 = [(CNTimeProfilingSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)blockCounter
{
  return self->_blockCounter;
}

- (void).cxx_destruct
{
}

- (void)performBlock:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_19091D000, v0, v1, "Scheduling block %lu", v2, v3, v4, v5, v6);
}

void __50__CNTimeProfilingSchedulerDecorator_performBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  os_log_t v0 = objc_msgSend((id)OUTLINED_FUNCTION_2_2((uint64_t)CNTimeIntervalFormatter), "stringForTimeInterval:");
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_19091D000, v1, v2, "Activating block %lu %{public}@ after scheduling", v3, v4, v5, v6, v7);
}

@end