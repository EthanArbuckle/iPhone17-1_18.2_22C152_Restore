@interface _CNForkJoinProgressiveResultObservationStrategy
- (_CNForkJoinProgressiveResultObservationStrategy)initWithCapacity:(unint64_t)a3;
- (void)observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4;
- (void)receiveResult:(id)a3 fromObservableAtIndex:(unint64_t)a4 observer:(id)a5;
@end

@implementation _CNForkJoinProgressiveResultObservationStrategy

- (_CNForkJoinProgressiveResultObservationStrategy)initWithCapacity:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_CNForkJoinProgressiveResultObservationStrategy;
  v4 = [(_CNForkJoinProgressiveResultObservationStrategy *)&v13 init];
  if (v4)
  {
    for (i = [MEMORY[0x1E4F1CA48] array];
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      [i addObject:v6];
    }
    uint64_t v7 = [i copy];
    results = v4->_results;
    v4->_results = (NSArray *)v7;

    v4->_activeObservableIdx = 0;
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    finishedObservables = v4->_finishedObservables;
    v4->_finishedObservables = v9;

    v11 = v4;
  }

  return v4;
}

- (void)receiveResult:(id)a3 fromObservableAtIndex:(unint64_t)a4 observer:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_activeObservableIdx == a4)
  {
    objc_sync_exit(v9);

    [v8 observerDidReceiveResult:v11];
  }
  else
  {
    v10 = [(NSArray *)v9->_results objectAtIndex:a4];
    [v10 addObject:v11];

    objc_sync_exit(v9);
  }
}

- (void)observableAtIndex:(unint64_t)a3 didCompleteForObserver:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = self;
  objc_sync_enter(v8);
  [(NSMutableIndexSet *)v8->_finishedObservables addIndex:a3];
  for (unint64_t i = v8->_activeObservableIdx;
        [(NSMutableIndexSet *)v8->_finishedObservables containsIndex:i];
        ++i)
  {
    v10 = [(NSArray *)v8->_results objectAtIndexedSubscript:i];
    [v7 addObjectsFromArray:v10];

    id v11 = [(NSArray *)v8->_results objectAtIndexedSubscript:i];
    [v11 removeAllObjects];
  }
  v8->_activeObservableIdx = i;
  if (i < [(NSArray *)v8->_results count])
  {
    v12 = [(NSArray *)v8->_results objectAtIndexedSubscript:v8->_activeObservableIdx];
    [v7 addObjectsFromArray:v12];

    objc_super v13 = [(NSArray *)v8->_results objectAtIndexedSubscript:v8->_activeObservableIdx];
    [v13 removeAllObjects];
  }
  uint64_t v14 = [(NSMutableIndexSet *)v8->_finishedObservables count];
  uint64_t v15 = [(NSArray *)v8->_results count];
  objc_sync_exit(v8);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(v6, "observerDidReceiveResult:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }

  if (v14 == v15) {
    [v6 observerDidComplete];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedObservables, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end