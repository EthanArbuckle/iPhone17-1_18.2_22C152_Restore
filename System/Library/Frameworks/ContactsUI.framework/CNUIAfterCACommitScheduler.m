@interface CNUIAfterCACommitScheduler
- (CNSuspendableSchedulerDecorator)scheduler;
- (CNUIAfterCACommitScheduler)init;
- (CNUIAfterCACommitScheduler)initWithSchedulerProvider:(id)a3;
- (__CFRunLoopObserver)runLoopObserver;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)dealloc;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNUIAfterCACommitScheduler

- (CNSuspendableSchedulerDecorator)scheduler
{
  return self->_scheduler;
}

- (CNUIAfterCACommitScheduler)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNUIAfterCACommitScheduler;
  v5 = [(CNUIAfterCACommitScheduler *)&v12 init];
  if (v5)
  {
    v6 = [v4 inlineScheduler];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5A520]) initWithScheduler:v6];
    scheduler = v5->_scheduler;
    v5->_scheduler = (CNSuspendableSchedulerDecorator *)v7;

    context.version = 0;
    context.info = v5;
    memset(&context.retain, 0, 24);
    v5->_runLoopObserver = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 2000001, (CFRunLoopObserverCallBack)_afterCACommitHandler, &context);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v5->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    v10 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (__CFRunLoopObserver)runLoopObserver
{
  return self->_runLoopObserver;
}

- (double)timestamp
{
  v2 = [(CNUIAfterCACommitScheduler *)self scheduler];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CNUIAfterCACommitScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E549B710;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  v11 = [v9 afterDelay:v13 performBlock:a5 qualityOfService:a3];

  return v11;
}

void __71__CNUIAfterCACommitScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  id v3 = *(id *)(a1 + 32);
  v2(v1);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__CNUIAfterCACommitScheduler_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E549B710;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 afterDelay:v11 performBlock:a3];

  return v9;
}

void __54__CNUIAfterCACommitScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  id v3 = *(id *)(a1 + 32);
  v2(v1);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CNUIAfterCACommitScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E54994C8;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 performCancelableBlock:v11 qualityOfService:a4];

  return v9;
}

void __70__CNUIAfterCACommitScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CNUIAfterCACommitScheduler_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E54994C8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 performCancelableBlock:v9];

  return v7;
}

void __53__CNUIAfterCACommitScheduler_performCancelableBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CNUIAfterCACommitScheduler_performBlock_qualityOfService___block_invoke;
  v9[3] = &unk_1E549B710;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9 qualityOfService:a4];
}

void __60__CNUIAfterCACommitScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  id v3 = *(id *)(a1 + 32);
  v2(v1);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIAfterCACommitScheduler *)self scheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CNUIAfterCACommitScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E549B710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __43__CNUIAfterCACommitScheduler_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void (**)(uint64_t))(v1 + 16);
  id v3 = *(id *)(a1 + 32);
  v2(v1);
}

- (void)dealloc
{
  if (self->_runLoopObserver)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  [(CNSuspendableSchedulerDecorator *)self->_scheduler resume];
  v4.receiver = self;
  v4.super_class = (Class)CNUIAfterCACommitScheduler;
  [(CNUIAfterCACommitScheduler *)&v4 dealloc];
}

- (CNUIAfterCACommitScheduler)init
{
  id v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
  objc_super v4 = [(CNUIAfterCACommitScheduler *)self initWithSchedulerProvider:v3];

  return v4;
}

@end