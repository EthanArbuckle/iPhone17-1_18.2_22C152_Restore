@interface NSFilePresenterRelinquishment
- (BOOL)_locked_addRelinquishReply:(id)a3;
- (void)_locked_addPrerelinquishReply:(id)a3;
- (void)dealloc;
- (void)didRelinquish;
- (void)performRelinquishmentToAccessClaimIfNecessary:(id)a3 usingBlock:(id)a4 withReply:(id)a5;
- (void)performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:(id)a3 withReply:(id)a4;
- (void)removeAllBlockingAccessClaimIDs;
- (void)removeBlockingAccessClaimID:(id)a3;
- (void)removeBlockingAccessClaimID:(id)a3 thenContinue:(id)a4;
- (void)setReacquirer:(id)a3;
@end

@implementation NSFilePresenterRelinquishment

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterRelinquishment;
  [(NSFilePresenterRelinquishment *)&v3 dealloc];
}

- (void)performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:(id)a3 withReply:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v9 = [(NSCountedSet *)self->_blockingAccessClaimIDs count];
  BOOL prerelinquishInProgress = self->_prerelinquishInProgress;
  v11 = _NSFCPresenterLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (prerelinquishInProgress)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "Prerelinquishment already in progress. Adding a new prelinquishment reply", buf, 2u);
      if (!v9) {
        goto LABEL_4;
      }
    }
    else if (!v9)
    {
LABEL_4:
      [(NSFilePresenterRelinquishment *)self _locked_addPrerelinquishReply:a4];
      os_unfair_lock_unlock(p_lock);
      return;
    }
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFilePresenterRelinquishment.m" lineNumber:39 description:@"Somehow relinquishment and prerelinquishment are happening concurrently?"];
    goto LABEL_4;
  }
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "Prelinquishment requested, but already asked to relinquish. Adding a new relinquishment reply", buf, 2u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke;
    v15[3] = &unk_1E51F8650;
    v15[4] = a4;
    BOOL v13 = [(NSFilePresenterRelinquishment *)self _locked_addRelinquishReply:v15];
    os_unfair_lock_unlock(p_lock);
    if (!v13) {
      (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "Starting prelinquishment for remote deletion request", buf, 2u);
    }
    if (self->_blockingPrerelinquishReplies) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFilePresenterRelinquishment.m" lineNumber:56 description:@"A presenter previously finished prerelinquishment without clearing its prerelinquishment replies"];
    }
    self->_BOOL prerelinquishInProgress = 1;
    self->_blockingPrerelinquishReplies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_unfair_lock_unlock(p_lock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke_9;
    v14[3] = &unk_1E51FD4C8;
    v14[4] = self;
    v14[5] = a4;
    (*((void (**)(id, void *))a3 + 2))(a3, v14);
  }
}

uint64_t __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__NSFilePresenterRelinquishment_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply___block_invoke_9(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];

  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (void)performRelinquishmentToAccessClaimIfNecessary:(id)a3 usingBlock:(id)a4 withReply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_prerelinquishInProgress)
  {
    long long v11 = _NSFCPresenterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = a3;
      _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "Deferring relinquishment to %{public}@ because of pre-relinquishment in progress", buf, 0xCu);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke;
    v19[3] = &unk_1E51FE208;
    v19[4] = self;
    v19[5] = a3;
    v19[6] = a4;
    v19[7] = a5;
    [(NSFilePresenterRelinquishment *)self _locked_addPrerelinquishReply:v19];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    unint64_t v12 = [(NSCountedSet *)self->_blockingAccessClaimIDs count];
    blockingAccessClaimIDs = self->_blockingAccessClaimIDs;
    if (!blockingAccessClaimIDs)
    {
      blockingAccessClaimIDs = objc_alloc_init(NSCountedSet);
      self->_blockingAccessClaimIDs = blockingAccessClaimIDs;
    }
    [(NSCountedSet *)blockingAccessClaimIDs addObject:a3];
    v14 = _NSFCPresenterLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = a3;
        _os_log_debug_impl(&dword_181795000, v14, OS_LOG_TYPE_DEBUG, "Not explicitly asking presenter to relinquish to claim %{public}@ because it has already relinquished", buf, 0xCu);
      }
      BOOL v16 = [(NSFilePresenterRelinquishment *)self _locked_addRelinquishReply:a5];
      os_unfair_lock_unlock(p_lock);
      if (!v16) {
        (*((void (**)(id))a5 + 2))(a5);
      }
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = a3;
        _os_log_debug_impl(&dword_181795000, v14, OS_LOG_TYPE_DEBUG, "Starting relinquishment to claim %{public}@", buf, 0xCu);
      }
      if (self->_relinquishReplies) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFilePresenterRelinquishment.m" lineNumber:107 description:@"A presenter previously relinquished without clearing its relinquishment replies"];
      }
      self->_relinquishReplies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v17 = [(NSFilePresenterRelinquishment *)self _locked_addRelinquishReply:a5];
      os_unfair_lock_unlock(p_lock);
      if (!v17) {
        (*((void (**)(id))a5 + 2))(a5);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke_15;
      v18[3] = &unk_1E51F71D0;
      v18[4] = self;
      (*((void (**)(id, void *))a4 + 2))(a4, v18);
    }
  }
}

uint64_t __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performRelinquishmentToAccessClaimIfNecessary:*(void *)(a1 + 40) usingBlock:*(void *)(a1 + 48) withReply:*(void *)(a1 + 56)];
}

uint64_t __100__NSFilePresenterRelinquishment_performRelinquishmentToAccessClaimIfNecessary_usingBlock_withReply___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) didRelinquish];
}

- (void)setReacquirer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSCountedSet *)self->_blockingAccessClaimIDs count])
  {
    self->_reacquirer = (id)[a3 copy];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_181795000, v6, OS_LOG_TYPE_DEBUG, "Reacquiring immediately, because there are no more claims", v7, 2u);
    }
    (*((void (**)(id, void *))a3 + 2))(a3, &__block_literal_global_80);
  }
}

- (void)removeBlockingAccessClaimID:(id)a3 thenContinue:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSCountedSet *)self->_blockingAccessClaimIDs removeObject:a3];
  if ([(NSCountedSet *)self->_blockingAccessClaimIDs count]) {
    goto LABEL_2;
  }
  uint64_t v8 = _NSFCPresenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v10 = 0;
    _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "Invoking reacquirer, because no claims remain", v10, 2u);
  }
  reacquirer = (void (**)(id, id))self->_reacquirer;
  if (!reacquirer)
  {
LABEL_2:
    os_unfair_lock_unlock(p_lock);
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    self->_reacquirer = 0;
    os_unfair_lock_unlock(p_lock);
    reacquirer[2](reacquirer, a4);
  }
}

- (void)removeBlockingAccessClaimID:(id)a3
{
}

- (void)removeAllBlockingAccessClaimIDs
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_blockingAccessClaimIDs = 0;
  if (self->_reacquirer)
  {
    uint64_t v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_debug_impl(&dword_181795000, v4, OS_LOG_TYPE_DEBUG, "Invoking reacquirer because all claims were removed", v6, 2u);
    }
    reacquirer = (void (**)(id, void *))self->_reacquirer;
    self->_reacquirer = 0;
    os_unfair_lock_unlock(p_lock);
    if (reacquirer)
    {
      reacquirer[2](reacquirer, &__block_literal_global_19);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)_locked_addRelinquishReply:(id)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  relinquishReplies = self->_relinquishReplies;
  if (relinquishReplies)
  {
    uint64_t v6 = (void *)[a3 copy];
    [(NSMutableArray *)self->_relinquishReplies addObject:v6];
  }
  return relinquishReplies != 0;
}

- (void)_locked_addPrerelinquishReply:(id)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_blockingPrerelinquishReplies) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFilePresenterRelinquishment.m" lineNumber:226 description:@"addPrerelinquishReply called, but we're not in the middle of prerelinquishing"];
  }
  id v6 = (id)[a3 copy];
  [(NSMutableArray *)self->_blockingPrerelinquishReplies addObject:v6];
}

- (void)didRelinquish
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_relinquishReplies) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFilePresenterRelinquishment.m" lineNumber:234 description:@"didRelinquish called, but there are no replies"];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v3 = (void *)[(NSMutableArray *)self->_relinquishReplies copy];

  self->_relinquishReplies = 0;
  os_unfair_lock_unlock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

@end