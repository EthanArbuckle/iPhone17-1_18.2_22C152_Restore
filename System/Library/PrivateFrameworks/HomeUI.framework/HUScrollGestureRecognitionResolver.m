@interface HUScrollGestureRecognitionResolver
- (HUScrollGestureRecognitionResolver)init;
- (NSMutableSet)conflictingGestureStates;
- (NSMutableSet)mutablePanGestureReocgnizers;
- (NSSet)conflictingGestureRecognizers;
- (double)conflictingGestureActivationDelay;
- (id)_stateForConflictingGestureRecognizer:(id)a3;
- (void)_activeTimerDidFireForOtherGesture:(id)a3;
- (void)_cancelConflictingGestures;
- (void)_clearSimultaenouslyRecognizedGestures;
- (void)_handleConflictingGesture:(id)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_removeConflictingGestureState:(id)a3;
- (void)addConflictingGestureRecognizer:(id)a3;
- (void)addPanGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)removeConflictingGestureRecognizer:(id)a3;
- (void)removePanGestureRecognizer:(id)a3;
- (void)setConflictingGestureActivationDelay:(double)a3;
@end

@implementation HUScrollGestureRecognitionResolver

- (HUScrollGestureRecognitionResolver)init
{
  v8.receiver = self;
  v8.super_class = (Class)HUScrollGestureRecognitionResolver;
  v2 = [(HUScrollGestureRecognitionResolver *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    mutablePanGestureReocgnizers = v2->_mutablePanGestureReocgnizers;
    v2->_mutablePanGestureReocgnizers = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    conflictingGestureStates = v2->_conflictingGestureStates;
    v2->_conflictingGestureStates = (NSMutableSet *)v5;

    v2->_conflictingGestureActivationDelay = 0.15;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
  v4 = (void *)[v3 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke;
  v9[3] = &unk_1E6388238;
  v9[4] = self;
  objc_msgSend(v4, "na_each:", v9);

  uint64_t v5 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  v6 = (void *)[v5 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke_2;
  v8[3] = &unk_1E6388260;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

  v7.receiver = self;
  v7.super_class = (Class)HUScrollGestureRecognitionResolver;
  [(HUScrollGestureRecognitionResolver *)&v7 dealloc];
}

uint64_t __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removePanGestureRecognizer:a2];
}

uint64_t __45__HUScrollGestureRecognitionResolver_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeConflictingGestureState:a2];
}

- (NSSet)conflictingGestureRecognizers
{
  v2 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_58);

  return (NSSet *)v3;
}

uint64_t __67__HUScrollGestureRecognitionResolver_conflictingGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 gestureRecognizer];
}

- (void)addPanGestureRecognizer:(id)a3
{
  id v7 = a3;
  v4 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
    [v6 addObject:v7];

    [v7 addTarget:self action:sel__handlePanGesture_];
  }
}

- (void)removePanGestureRecognizer:(id)a3
{
  id v7 = a3;
  v4 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    v6 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
    [v6 removeObject:v7];

    [v7 removeTarget:self action:sel__handlePanGesture_];
  }
}

- (void)addConflictingGestureRecognizer:(id)a3
{
  id v6 = a3;
  -[HUScrollGestureRecognitionResolver _stateForConflictingGestureRecognizer:](self, "_stateForConflictingGestureRecognizer:");
  v4 = (_HUScrollGestureRecognitionState *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[_HUScrollGestureRecognitionState alloc] initWithGestureRecognizer:v6];
    int v5 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
    [v5 addObject:v4];

    [v6 addTarget:self action:sel__handleConflictingGesture_];
  }
}

- (void)removeConflictingGestureRecognizer:(id)a3
{
  v4 = [(HUScrollGestureRecognitionResolver *)self _stateForConflictingGestureRecognizer:a3];
  if (v4)
  {
    int v5 = v4;
    [(HUScrollGestureRecognitionResolver *)self _removeConflictingGestureState:v4];
    v4 = v5;
  }
}

- (void)_removeConflictingGestureState:(id)a3
{
  id v4 = a3;
  int v5 = [v4 activationTimer];
  [v5 cancel];

  id v6 = [v4 gestureRecognizer];
  [v6 removeTarget:self action:sel__handleConflictingGesture_];

  id v7 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  [v7 removeObject:v4];
}

- (id)_stateForConflictingGestureRecognizer:(id)a3
{
  id v4 = a3;
  int v5 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HUScrollGestureRecognitionResolver__stateForConflictingGestureRecognizer___block_invoke;
  v9[3] = &unk_1E63882A8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

BOOL __76__HUScrollGestureRecognitionResolver__stateForConflictingGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 gestureRecognizer];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_handlePanGesture:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 1)
    {
      [(HUScrollGestureRecognitionResolver *)self _cancelConflictingGestures];
    }
  }
  else
  {
    [(HUScrollGestureRecognitionResolver *)self _clearSimultaenouslyRecognizedGestures];
  }
}

- (void)_activeTimerDidFireForOtherGesture:(id)a3
{
  uint64_t v4 = [(HUScrollGestureRecognitionResolver *)self _stateForConflictingGestureRecognizer:a3];
  if (v4)
  {
    id v6 = v4;
    [v4 setActivationTimer:0];
    int v5 = [(HUScrollGestureRecognitionResolver *)self mutablePanGestureReocgnizers];
    objc_msgSend(v5, "na_each:", &__block_literal_global_30);

    uint64_t v4 = v6;
  }
}

void __73__HUScrollGestureRecognitionResolver__activeTimerDidFireForOtherGesture___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setEnabled:0];
  [v2 setEnabled:1];
}

- (void)_handleConflictingGesture:(id)a3
{
  id v4 = a3;
  int v5 = [(HUScrollGestureRecognitionResolver *)self _stateForConflictingGestureRecognizer:v4];
  if (!v5) {
    NSLog(&cfstr_UnexpectedEven.isa, v4);
  }
  uint64_t v6 = [v4 state];
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 1)
    {
      objc_super v8 = [v5 activationTimer];
      [v8 cancel];

      objc_initWeak(&location, self);
      v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      [(HUScrollGestureRecognitionResolver *)self conflictingGestureActivationDelay];
      double v11 = v10;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__HUScrollGestureRecognitionResolver__handleConflictingGesture___block_invoke;
      v13[3] = &unk_1E63882F0;
      objc_copyWeak(&v15, &location);
      id v14 = v4;
      v12 = [v9 afterDelay:v13 performBlock:v11];
      [v5 setActivationTimer:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v7 = [v5 activationTimer];
    [v7 cancel];

    [v5 setActivationTimer:0];
  }
}

void __64__HUScrollGestureRecognitionResolver__handleConflictingGesture___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activeTimerDidFireForOtherGesture:*(void *)(a1 + 32)];
}

- (void)_cancelConflictingGestures
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) gestureRecognizer];
        uint64_t v9 = [v8 isEnabled];
        [v8 setEnabled:0];
        [v8 setEnabled:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(HUScrollGestureRecognitionResolver *)self _clearSimultaenouslyRecognizedGestures];
}

- (void)_clearSimultaenouslyRecognizedGestures
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(HUScrollGestureRecognitionResolver *)self conflictingGestureStates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) activationTimer];
        [v7 cancel];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (double)conflictingGestureActivationDelay
{
  return self->_conflictingGestureActivationDelay;
}

- (void)setConflictingGestureActivationDelay:(double)a3
{
  self->_conflictingGestureActivationDelay = a3;
}

- (NSMutableSet)mutablePanGestureReocgnizers
{
  return self->_mutablePanGestureReocgnizers;
}

- (NSMutableSet)conflictingGestureStates
{
  return self->_conflictingGestureStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictingGestureStates, 0);

  objc_storeStrong((id *)&self->_mutablePanGestureReocgnizers, 0);
}

@end