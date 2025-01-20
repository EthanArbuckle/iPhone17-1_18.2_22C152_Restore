@interface CATSerialOperationEnqueuer
- (CATSerialOperationEnqueuer)initWithTargetOperationQueue:(id)a3;
- (void)addOperation:(id)a3;
- (void)checkIfOperationIsFinished:(id)a3;
- (void)dealloc;
- (void)enqueueNextOperation;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performThreadSafeBlock:(id)a3;
- (void)startObservingOperation:(id)a3;
- (void)stopObservingOperation:(id)a3;
@end

@implementation CATSerialOperationEnqueuer

- (void)dealloc
{
  if (self->mCurrentlyExecutingOperation) {
    -[CATSerialOperationEnqueuer stopObservingOperation:](self, "stopObservingOperation:");
  }
  v3.receiver = self;
  v3.super_class = (Class)CATSerialOperationEnqueuer;
  [(CATSerialOperationEnqueuer *)&v3 dealloc];
}

- (CATSerialOperationEnqueuer)initWithTargetOperationQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATSerialOperationEnqueuer;
  v6 = [(CATSerialOperationEnqueuer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTargetQueue, a3);
    uint64_t v8 = objc_opt_new();
    mPendingOperations = v7->mPendingOperations;
    v7->mPendingOperations = (NSMutableArray *)v8;

    v7->mLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CATSerialOperationEnqueuer_addOperation___block_invoke;
  v6[3] = &unk_2641DC000;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CATSerialOperationEnqueuer *)self performThreadSafeBlock:v6];
}

uint64_t __43__CATSerialOperationEnqueuer_addOperation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 enqueueNextOperation];
}

- (void)enqueueNextOperation
{
  p_mCurrentlyExecutingOperation = &self->mCurrentlyExecutingOperation;
  if (!self->mCurrentlyExecutingOperation)
  {
    id v4 = [(NSMutableArray *)self->mPendingOperations cat_popFirstObject];
    id v5 = v4;
    if (v4)
    {
      v6 = v4;
      objc_storeStrong((id *)p_mCurrentlyExecutingOperation, v4);
      objc_storeStrong(&self->mStrongSelf, self);
      [(NSOperationQueue *)self->mTargetQueue addOperation:v6];
      [(CATSerialOperationEnqueuer *)self startObservingOperation:v6];
      id v4 = (void *)[(CATSerialOperationEnqueuer *)self checkIfOperationIsFinished:v6];
      id v5 = v6;
    }
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)checkIfOperationIsFinished:(id)a3
{
  id v4 = (NSOperation *)a3;
  id v5 = v4;
  if (self->mCurrentlyExecutingOperation == v4)
  {
    uint64_t v8 = v4;
    id v4 = (NSOperation *)[(NSOperation *)v4 isFinished];
    id v5 = v8;
    if (v4)
    {
      [(CATSerialOperationEnqueuer *)self stopObservingOperation:v8];
      mCurrentlyExecutingOperation = self->mCurrentlyExecutingOperation;
      self->mCurrentlyExecutingOperation = 0;

      id mStrongSelf = self->mStrongSelf;
      self->id mStrongSelf = 0;

      id v4 = (NSOperation *)[(CATSerialOperationEnqueuer *)self enqueueNextOperation];
      id v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)performThreadSafeBlock:(id)a3
{
  p_mLock = &self->mLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_mLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_mLock);
}

- (void)startObservingOperation:(id)a3
{
}

- (void)stopObservingOperation:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  objc_super v11 = v10;
  if (a6 == @"CATSerialOperationEnqueuerObservationContext")
  {
    id v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      v15 = [NSString stringWithUTF8String:"-[CATSerialOperationEnqueuer observeValueForKeyPath:ofObject:change:context:]"];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      [v14 handleFailureInFunction:v15, @"CATSerialOperationEnqueuer.m", 142, @"expected %@, got %@", v17, v19 file lineNumber description];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__CATSerialOperationEnqueuer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20[3] = &unk_2641DC000;
    v20[4] = self;
    id v21 = v12;
    id v13 = v12;
    [(CATSerialOperationEnqueuer *)self performThreadSafeBlock:v20];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CATSerialOperationEnqueuer;
    [(CATSerialOperationEnqueuer *)&v22 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

uint64_t __77__CATSerialOperationEnqueuer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkIfOperationIsFinished:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mPendingOperations, 0);
  objc_storeStrong((id *)&self->mCurrentlyExecutingOperation, 0);

  objc_storeStrong((id *)&self->mTargetQueue, 0);
}

@end