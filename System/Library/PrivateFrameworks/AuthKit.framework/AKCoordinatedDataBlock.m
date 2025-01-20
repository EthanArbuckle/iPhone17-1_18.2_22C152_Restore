@interface AKCoordinatedDataBlock
+ (id)startCoordinatingBlock:(id)a3;
- (AKCoordinatedDataBlock)initWithBlock:(id)a3;
- (void)_callCompletionWithData:(id)a3 error:(id)a4;
- (void)_start;
- (void)setCompletion:(id)a3;
- (void)start;
@end

@implementation AKCoordinatedDataBlock

- (AKCoordinatedDataBlock)initWithBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKCoordinatedDataBlock;
  id v5 = [(AKCoordinatedDataBlock *)&v11 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1996FE880](v4);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    *((_DWORD *)v5 + 7) = 0;
    dispatch_group_t v8 = dispatch_group_create();
    v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    dispatch_group_enter(*((dispatch_group_t *)v5 + 4));
  }

  return (AKCoordinatedDataBlock *)v5;
}

+ (id)startCoordinatingBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[AKCoordinatedDataBlock alloc] initWithBlock:v3];

  [(AKCoordinatedDataBlock *)v4 _start];

  return v4;
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Called -[AKCoordinatedDataBlock start] after block has already been started. Ignoring call and not starting again.", v1, 2u);
}

uint64_t __31__AKCoordinatedDataBlock_start__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  *(unsigned char *)(*(void *)(result + 32) + 24) = 1;
  return result;
}

- (void)setCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  dispatch_group_t v8 = __40__AKCoordinatedDataBlock_setCompletion___block_invoke;
  v9 = &unk_1E57619A8;
  v12 = &v13;
  v10 = self;
  id v5 = v4;
  id v11 = v5;
  uint64_t v6 = v7;
  os_unfair_lock_lock(&self->_lock);
  v8(v6);

  os_unfair_lock_unlock(&self->_lock);
  if (*((unsigned char *)v14 + 24)) {
    dispatch_group_leave((dispatch_group_t)self->_group);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __40__AKCoordinatedDataBlock_setCompletion___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 16) == 0;
  *(void *)(a1[4] + 16) = MEMORY[0x1996FE880](a1[5]);

  return MEMORY[0x1F41817F8]();
}

- (void)_start
{
  objc_initWeak(&location, self);
  block = (void (**)(id, void *))self->_block;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__AKCoordinatedDataBlock__start__block_invoke;
  v4[3] = &unk_1E57619D0;
  objc_copyWeak(&v5, &location);
  block[2](block, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__AKCoordinatedDataBlock__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _callCompletionWithData:v6 error:v5];
}

- (void)_callCompletionWithData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  group = self->_group;
  v9 = dispatch_get_global_queue(21, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke;
  v12[3] = &unk_1E57619F8;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(group, v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__11;
    id v15 = __Block_byref_object_dispose__11;
    id v16 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v7 = __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke_2;
    dispatch_group_t v8 = &unk_1E5760CB0;
    v9 = WeakRetained;
    id v10 = &v11;
    id v4 = v6;
    os_unfair_lock_lock(v3 + 7);
    v7((uint64_t)v4);

    os_unfair_lock_unlock(v3 + 7);
    uint64_t v5 = v12[5];
    if (v5) {
      (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), *(void *)(a1 + 40));
    }
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1996FE880](*(void *)(*(void *)(a1 + 32)
                                                                                              + 16));

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_block, 0);
}

@end