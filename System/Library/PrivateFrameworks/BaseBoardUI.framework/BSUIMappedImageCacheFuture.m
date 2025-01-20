@interface BSUIMappedImageCacheFuture
- (BSUIMappedImageCacheFuture)init;
- (os_unfair_lock_s)cacheImage;
- (void)dealloc;
- (void)submitWorkBlock:(uint64_t)a1;
@end

@implementation BSUIMappedImageCacheFuture

- (BSUIMappedImageCacheFuture)init
{
  v11.receiver = self;
  v11.super_class = (Class)BSUIMappedImageCacheFuture;
  v2 = [(BSUIMappedImageCacheFuture *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    submitted = v3->_submitted;
    v3->_submitted = (BSAtomicSignal *)v4;

    uint64_t v6 = [MEMORY[0x1E4F29060] currentThread];
    submissionThread = v3->_submissionThread;
    v3->_submissionThread = (NSThread *)v6;

    uint64_t v8 = dispatch_get_global_queue(9, 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

    os_unfair_lock_lock(&v3->_lock);
  }
  return v3;
}

- (void)dealloc
{
  if (([(BSAtomicSignal *)self->_submitted hasBeenSignalled] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"BSUIMappedImageCacheFuture.m" lineNumber:40 description:@"work was never submitted to future"];
  }
  if (!self->_lock_workCompletionWasCalled)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"BSUIMappedImageCacheFuture.m" lineNumber:41 description:@"work completion was never called for future"];
  }
  v6.receiver = self;
  v6.super_class = (Class)BSUIMappedImageCacheFuture;
  [(BSUIMappedImageCacheFuture *)&v6 dealloc];
}

- (void)submitWorkBlock:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel_submitWorkBlock_, a1, @"BSUIMappedImageCacheFuture.m", 49, @"Invalid parameter not satisfying: %@", @"workBlock" object file lineNumber description];
    }
    if (([*(id *)(a1 + 16) signal] & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_submitWorkBlock_ object:a1 file:@"BSUIMappedImageCacheFuture.m" lineNumber:51 description:@"attempted to submit more than one workBlock"];
    }
    v5 = *(void **)(a1 + 24);
    objc_super v6 = [MEMORY[0x1E4F29060] currentThread];
    LOBYTE(v5) = [v5 isEqual:v6];

    if ((v5 & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel_submitWorkBlock_ object:a1 file:@"BSUIMappedImageCacheFuture.m" lineNumber:52 description:@"attempted to submit the workBlock on a different thread than the initializer"];
    }
    v7 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v8 = [v4 copy];
    v9 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v10 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BSUIMappedImageCacheFuture_submitWorkBlock___block_invoke;
    block[3] = &unk_1E5ABD3B0;
    block[4] = a1;
    dispatch_async(v10, block);
  }
}

id __46__BSUIMappedImageCacheFuture_submitWorkBlock___block_invoke(uint64_t a1)
{
  return -[BSUIMappedImageCacheFuture cacheImage](*(os_unfair_lock_s **)(a1 + 32));
}

- (os_unfair_lock_s)cacheImage
{
  if (a1)
  {
    v1 = a1;
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    uint64_t v3 = *(void *)&v1[8]._os_unfair_lock_opaque;
    if (v3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__BSUIMappedImageCacheFuture_cacheImage__block_invoke;
      v8[3] = &unk_1E5ABD7C0;
      v8[4] = v1;
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);
      if (!LOBYTE(v1[10]._os_unfair_lock_opaque))
      {
        objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = (void *)MEMORY[0x1A623AF30](*(void *)&v1[8]._os_unfair_lock_opaque);
        [v6 handleFailureInMethod:sel_cacheImage, v1, @"BSUIMappedImageCacheFuture.m", 72, @"workCompletion of BSUIMappedImageCacheFuture was not called synchronously within its work block : %@", v7 object file lineNumber description];
      }
      uint64_t v4 = *(void **)&v1[8]._os_unfair_lock_opaque;
      *(void *)&v1[8]._os_unfair_lock_opaque = 0;
    }
    os_unfair_lock_unlock(v2);
    a1 = (os_unfair_lock_s *)*(id *)&v1[12]._os_unfair_lock_opaque;
  }

  return a1;
}

void __40__BSUIMappedImageCacheFuture_cacheImage__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_postlock_cachedImage, 0);
  objc_storeStrong(&self->_lock_workBlock, 0);
  objc_storeStrong((id *)&self->_submissionThread, 0);

  objc_storeStrong((id *)&self->_submitted, 0);
}

@end