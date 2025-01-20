@interface _EFCombineLatestObservableSubscription
- (NSArray)observables;
- (NSLock)lock;
- (NSMutableArray)results;
- (NSMutableArray)tokens;
- (NSMutableIndexSet)activeIndexes;
- (NSMutableIndexSet)silentIndexes;
- (_EFCombineLatestObservableSubscription)initWithObservables:(id)a3;
- (id)subscribe:(id)a3;
- (void)_observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4;
- (void)_observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 observer:(id)a5;
- (void)_observableAtIndex:(unint64_t)a3 receivedResult:(id)a4 observer:(id)a5;
- (void)setActiveIndexes:(id)a3;
- (void)setLock:(id)a3;
- (void)setObservables:(id)a3;
- (void)setResults:(id)a3;
- (void)setSilentIndexes:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation _EFCombineLatestObservableSubscription

- (void)_observableAtIndex:(unint64_t)a3 receivedResult:(id)a4 observer:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = _ef_log_EFObservable();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218498;
    v14 = self;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_DEBUG, "[%p] Result for index %lu: %@", (uint8_t *)&v13, 0x20u);
  }

  [(NSLock *)self->_lock lock];
  [(NSMutableArray *)self->_results replaceObjectAtIndex:a3 withObject:v8];
  [(NSMutableIndexSet *)self->_silentIndexes removeIndex:a3];
  if ([(NSMutableIndexSet *)self->_silentIndexes count])
  {
    v11 = _ef_log_EFObservable();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_EFCombineLatestObservableSubscription _observableAtIndex:receivedResult:observer:]((uint64_t)self, (uint64_t *)&self->_silentIndexes, v11);
    }

    v12 = 0;
  }
  else
  {
    v12 = (void *)[(NSMutableArray *)self->_results copy];
  }
  [(NSLock *)self->_lock unlock];
  if (v12) {
    [v9 observerDidReceiveResult:v12];
  }
}

- (_EFCombineLatestObservableSubscription)initWithObservables:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_EFCombineLatestObservableSubscription;
  v5 = [(_EFCombineLatestObservableSubscription *)&v21 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v5->_lock;
    v5->_lock = v6;

    uint64_t v8 = objc_msgSend(v4, "ef_map:", &__block_literal_global_5);
    observables = v5->_observables;
    v5->_observables = (NSArray *)v8;

    v10 = objc_msgSend(v4, "ef_map:", &__block_literal_global_10);
    uint64_t v11 = [v10 mutableCopy];
    results = v5->_results;
    v5->_results = (NSMutableArray *)v11;

    int v13 = objc_msgSend(v4, "ef_map:", &__block_literal_global_13);
    uint64_t v14 = [v13 mutableCopy];
    tokens = v5->_tokens;
    v5->_tokens = (NSMutableArray *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
    activeIndexes = v5->_activeIndexes;
    v5->_activeIndexes = (NSMutableIndexSet *)v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
    silentIndexes = v5->_silentIndexes;
    v5->_silentIndexes = (NSMutableIndexSet *)v18;
  }
  return v5;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EFCancelationToken);
  v6 = [(_EFCombineLatestObservableSubscription *)self observables];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke;
  v12[3] = &unk_1E6121A78;
  v7 = v5;
  int v13 = v7;
  uint64_t v14 = self;
  id v8 = v4;
  id v15 = v8;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v15;
  v10 = v7;

  return v10;
}

- (void)_observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4
{
  id v9 = a4;
  [(NSLock *)self->_lock lock];
  tokens = self->_tokens;
  v7 = [MEMORY[0x1E4F1CA98] null];
  [(NSMutableArray *)tokens replaceObjectAtIndex:a3 withObject:v7];

  [(NSMutableIndexSet *)self->_activeIndexes removeIndex:a3];
  uint64_t v8 = [(NSMutableIndexSet *)self->_activeIndexes count];
  [(NSLock *)self->_lock unlock];
  if (!v8) {
    [v9 observerDidComplete];
  }
}

- (void)_observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 observer:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  [(NSLock *)self->_lock lock];
  id v9 = (void *)[(NSMutableIndexSet *)self->_activeIndexes mutableCopy];
  [v9 removeIndex:a3];
  v10 = [(NSMutableArray *)self->_tokens objectsAtIndexes:v9];
  [v10 makeObjectsPerformSelector:sel_cancel];
  [(NSLock *)self->_lock unlock];
  [v8 observerDidFailWithError:v11];
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSArray)observables
{
  return self->_observables;
}

- (void)setObservables:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSMutableIndexSet)activeIndexes
{
  return self->_activeIndexes;
}

- (void)setActiveIndexes:(id)a3
{
}

- (NSMutableIndexSet)silentIndexes
{
  return self->_silentIndexes;
}

- (void)setSilentIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silentIndexes, 0);
  objc_storeStrong((id *)&self->_activeIndexes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observables, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_observableAtIndex:(uint64_t)a1 receivedResult:(uint64_t *)a2 observer:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1B5A59000, log, OS_LOG_TYPE_DEBUG, "[%p] Remaining silent indexes: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end