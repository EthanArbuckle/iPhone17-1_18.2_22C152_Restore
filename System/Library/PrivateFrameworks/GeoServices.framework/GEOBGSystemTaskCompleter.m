@interface GEOBGSystemTaskCompleter
- (BGSystemTask)task;
- (GEOBGSystemTaskCompleter)initWithTask:(id)a3;
- (id)completion;
- (void)complete;
- (void)dealloc;
- (void)setCompletion:(id)a3;
@end

@implementation GEOBGSystemTaskCompleter

- (GEOBGSystemTaskCompleter)initWithTask:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOBGSystemTaskCompleter;
  v6 = [(GEOBGSystemTaskCompleter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_completed.lock._os_unfair_lock_opaque = 0;
    v6->_completed.didRun = 0;
    objc_storeStrong((id *)&v6->_task, a3);
    v8 = v7;
  }

  return v7;
}

- (void)complete
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__GEOBGSystemTaskCompleter_complete__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_completed, v2);
}

void __36__GEOBGSystemTaskCompleter_complete__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setTaskCompleted];
  v2 = (void (**)(void))MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 24));
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)dealloc
{
  [(GEOBGSystemTaskCompleter *)self complete];
  v3.receiver = self;
  v3.super_class = (Class)GEOBGSystemTaskCompleter;
  [(GEOBGSystemTaskCompleter *)&v3 dealloc];
}

- (BGSystemTask)task
{
  return self->_task;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end