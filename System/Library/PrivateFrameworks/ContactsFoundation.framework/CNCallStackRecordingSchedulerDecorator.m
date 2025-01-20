@interface CNCallStackRecordingSchedulerDecorator
+ (id)os_log;
- (CNCallStackRecordingSchedulerDecorator)initWithScheduler:(id)a3;
- (CNScheduler)scheduler;
- (NSString)description;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)blockBecamePending;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNCallStackRecordingSchedulerDecorator

+ (id)os_log
{
  if (os_log_cn_once_token_1_3 != -1) {
    dispatch_once(&os_log_cn_once_token_1_3, &__block_literal_global_23);
  }
  v2 = (void *)os_log_cn_once_object_1_3;

  return v2;
}

uint64_t __48__CNCallStackRecordingSchedulerDecorator_os_log__block_invoke()
{
  os_log_cn_once_object_1_3 = (uint64_t)os_log_create("com.apple.contacts.debug", "scheduler-callstack");

  return MEMORY[0x1F41817F8]();
}

- (CNCallStackRecordingSchedulerDecorator)initWithScheduler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCallStackRecordingSchedulerDecorator;
  v6 = [(CNCallStackRecordingSchedulerDecorator *)&v10 init];
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
  v4 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  id v5 = (id)[v3 appendName:@"scheduler" object:v4];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)blockBecamePending
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Scheduling block with call stack: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  id v5 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CNCallStackRecordingSchedulerDecorator_performBlock___block_invoke;
  v7[3] = &unk_1E56A00D8;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __55__CNCallStackRecordingSchedulerDecorator_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  v7 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CNCallStackRecordingSchedulerDecorator_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E56A00D8;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9 qualityOfService:a4];
}

uint64_t __72__CNCallStackRecordingSchedulerDecorator_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  id v5 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__CNCallStackRecordingSchedulerDecorator_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E56A0100;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 performCancelableBlock:v9];

  return v7;
}

uint64_t __65__CNCallStackRecordingSchedulerDecorator_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  v7 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__CNCallStackRecordingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E56A0100;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 performCancelableBlock:v11 qualityOfService:a4];

  return v9;
}

uint64_t __82__CNCallStackRecordingSchedulerDecorator_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  v7 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E56A00D8;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 afterDelay:v11 performBlock:a3];

  return v9;
}

uint64_t __66__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  [(CNCallStackRecordingSchedulerDecorator *)self blockBecamePending];
  v9 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E56A00D8;
  id v14 = v8;
  id v10 = v8;
  v11 = [v9 afterDelay:v13 performBlock:a5 qualityOfService:a3];

  return v11;
}

uint64_t __83__CNCallStackRecordingSchedulerDecorator_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)timestamp
{
  int v2 = [(CNCallStackRecordingSchedulerDecorator *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
}

@end