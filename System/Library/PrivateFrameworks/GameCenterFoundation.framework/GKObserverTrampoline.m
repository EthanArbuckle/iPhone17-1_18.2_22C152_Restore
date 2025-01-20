@interface GKObserverTrampoline
- (id)initObservingObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 block:(id)a6;
- (id)token;
- (void)cancelObservation;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObserving;
@end

@implementation GKObserverTrampoline

- (id)initObservingObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GKObserverTrampoline;
  v14 = [(GKObserverTrampoline *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    id block = v14->_block;
    v14->_id block = (id)v15;

    uint64_t v17 = [v12 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v17;

    v14->_options = a5;
    objc_storeStrong(&v14->_observee, a3);
    v19 = v14;
  }

  return v14;
}

- (void)startObserving
{
}

- (id)token
{
  return (id)[MEMORY[0x1E4F29238] valueWithPointer:&self->_block];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6 == @"GKObserverTrampolineContext" && !self->_cancellationPredicate)
  {
    id block = (void (**)(id, id, id, void *))self->_block;
    id v13 = [(GKObserverTrampoline *)self token];
    block[2](block, v10, v11, v13);
  }
}

- (void)cancelObservation
{
  if (GKAtomicCompareAndSwap32(0, 1u, &self->_cancellationPredicate))
  {
    if ((self->_options & 4) != 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__GKObserverTrampoline_cancelObservation__block_invoke;
      block[3] = &unk_1E646D7F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [self->_observee removeObserver:self forKeyPath:self->_keyPath];
      id observee = self->_observee;
      self->_id observee = 0;
    }
  }
}

void __41__GKObserverTrampoline_cancelObservation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)dealloc
{
  [(GKObserverTrampoline *)self cancelObservation];
  v3.receiver = self;
  v3.super_class = (Class)GKObserverTrampoline;
  [(GKObserverTrampoline *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong(&self->_observee, 0);
}

@end