@interface _BPSAbstractCorrelateOrderedMerge
- (BOOL)_isBuffersEmpty;
- (BOOL)cancelled;
- (BOOL)errored;
- (BOOL)finished;
- (BOOL)isWaitingForMoreValues;
- (BOOL)recursion;
- (BPSSubscriber)downstream;
- (NSMutableArray)buffers;
- (NSMutableArray)requestsPerSubscription;
- (NSMutableArray)subscriptions;
- (NSMutableArray)upstreamBookmarks;
- (NSMutableSet)completedUpstreamIndexes;
- (_BPSAbstractCorrelateOrderedMerge)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4;
- (id)newBookmark;
- (id)nextValueIndex:(id *)a3;
- (id)upstreamSubscriptions;
- (int64_t)compareFirst:(id)a3 withSecond:(id)a4;
- (int64_t)demand;
- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)finishCount;
- (unint64_t)upstreamCount;
- (void)_completeWhileLockedWithCompletion:(id)a3;
- (void)_guardedBecomeTerminal;
- (void)cancel;
- (void)flushBufferAndRequestMoreWhileLocked;
- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4;
- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4;
- (void)requestDemand:(int64_t)a3;
- (void)setBuffers:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletedUpstreamIndexes:(id)a3;
- (void)setDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setErrored:(BOOL)a3;
- (void)setFinishCount:(unint64_t)a3;
- (void)setFinished:(BOOL)a3;
- (void)setRecursion:(BOOL)a3;
- (void)setRequestsPerSubscription:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setUpstreamBookmarks:(id)a3;
- (void)setUpstreamCount:(unint64_t)a3;
- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3;
@end

@implementation _BPSAbstractCorrelateOrderedMerge

- (_BPSAbstractCorrelateOrderedMerge)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4
{
  id v26 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_BPSAbstractCorrelateOrderedMerge;
  v7 = [(_BPSAbstractCorrelateOrderedMerge *)&v27 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_downstream, a3);
    v8->_upstreamCount = a4;
    v8->_recursion = 0;
    v8->_finished = 0;
    v8->_errored = 0;
    v8->_cancelled = 0;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    subscriptions = v8->_subscriptions;
    v8->_subscriptions = (NSMutableArray *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    upstreamBookmarks = v8->_upstreamBookmarks;
    v8->_upstreamBookmarks = (NSMutableArray *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v13;

    v8->_demand = 0;
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:a4];
    completedUpstreamIndexes = v8->_completedUpstreamIndexes;
    v8->_completedUpstreamIndexes = (NSMutableSet *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    requestsPerSubscription = v8->_requestsPerSubscription;
    v8->_requestsPerSubscription = (NSMutableArray *)v17;

    v8->_lock._os_unfair_lock_opaque = 0;
    for (v8->_downstreamLock = 0; a4; --a4)
    {
      v19 = v8->_subscriptions;
      v20 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v19 addObject:v20];

      v21 = v8->_upstreamBookmarks;
      v22 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v21 addObject:v22];

      v23 = v8->_buffers;
      v24 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableArray *)v23 addObject:v24];

      [(NSMutableArray *)v8->_requestsPerSubscription addObject:&unk_1F040EE50];
    }
  }

  return v8;
}

- (void)requestDemand:(int64_t)a3
{
  v5 = self;
  if (a3 <= 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:v5 file:@"BPSCorrelateOrderedMerge.m" lineNumber:73 description:@"Expecting demand to be greater than 0"];
  }
  os_unfair_lock_lock(&v5->_lock);
  if ([(_BPSAbstractCorrelateOrderedMerge *)v5 cancelled]
    || [(_BPSAbstractCorrelateOrderedMerge *)v5 finished]
    || [(_BPSAbstractCorrelateOrderedMerge *)v5 errored])
  {
    os_unfair_lock_unlock(&v5->_lock);
  }
  else
  {
    v6 = [(_BPSAbstractCorrelateOrderedMerge *)v5 subscriptions];
    v7 = (void *)[v6 copy];

    v8 = [(_BPSAbstractCorrelateOrderedMerge *)v5 requestsPerSubscription];
    [(_BPSAbstractCorrelateOrderedMerge *)v5 setDemand:[(_BPSAbstractCorrelateOrderedMerge *)v5 demand] + a3];
    os_unfair_lock_unlock(&v5->_lock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51___BPSAbstractCorrelateOrderedMerge_requestDemand___block_invoke;
    v13[3] = &unk_1E5E761E0;
    id v9 = v8;
    id v14 = v9;
    [v7 enumerateObjectsUsingBlock:v13];
    os_unfair_lock_lock(&v5->_lock);
    if (![(_BPSAbstractCorrelateOrderedMerge *)v5 recursion]
      && [(_BPSAbstractCorrelateOrderedMerge *)v5 demand] >= 1)
    {
      [(_BPSAbstractCorrelateOrderedMerge *)v5 flushBufferAndRequestMoreWhileLocked];
    }
    uint64_t v10 = [(_BPSAbstractCorrelateOrderedMerge *)v5 finishCount];
    if (v10 == [(_BPSAbstractCorrelateOrderedMerge *)v5 upstreamCount]
      && [(_BPSAbstractCorrelateOrderedMerge *)v5 _isBuffersEmpty])
    {
      os_unfair_lock_unlock(&v5->_lock);
      [(_BPSAbstractCorrelateOrderedMerge *)v5 _guardedBecomeTerminal];
      os_unfair_lock_lock(&v5->_lock);
      uint64_t v11 = +[BPSCompletion success];
      [(_BPSAbstractCorrelateOrderedMerge *)v5 _completeWhileLockedWithCompletion:v11];
    }
    os_unfair_lock_unlock(&v5->_lock);
  }
}

- (BOOL)isWaitingForMoreValues
{
  v3 = [(_BPSAbstractCorrelateOrderedMerge *)self completedUpstreamIndexes];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v4 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___BPSAbstractCorrelateOrderedMerge_isWaitingForMoreValues__block_invoke;
  v7[3] = &unk_1E5E76208;
  id v5 = v3;
  id v8 = v5;
  id v9 = &v10;
  [v4 enumerateObjectsUsingBlock:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4
{
  id v15 = a3;
  if ([(_BPSAbstractCorrelateOrderedMerge *)self upstreamCount] <= a4)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"BPSCorrelateOrderedMerge.m" lineNumber:138 description:@"Index should be less than upstream count"];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(_BPSAbstractCorrelateOrderedMerge *)self cancelled]) {
    goto LABEL_8;
  }
  if ([(_BPSAbstractCorrelateOrderedMerge *)self finished]) {
    goto LABEL_8;
  }
  if ([(_BPSAbstractCorrelateOrderedMerge *)self errored]) {
    goto LABEL_8;
  }
  id v8 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
  id v9 = [v8 objectAtIndexedSubscript:a4];
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    [v15 cancel];
  }
  else
  {
    uint64_t v12 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
    [v12 setObject:v15 atIndexedSubscript:a4];

    char v13 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
    [v13 setObject:&unk_1F040EE68 atIndexedSubscript:a4];

    os_unfair_lock_unlock(p_lock);
    [v15 requestDemand:1];
  }
}

- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = self;
  if ([(_BPSAbstractCorrelateOrderedMerge *)v8 upstreamCount] <= a4)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:v8 file:@"BPSCorrelateOrderedMerge.m" lineNumber:158 description:@"Index should be less than upstream count"];
  }
  os_unfair_lock_lock(&v8->_lock);
  if (![(_BPSAbstractCorrelateOrderedMerge *)v8 cancelled]
    && ![(_BPSAbstractCorrelateOrderedMerge *)v8 finished]
    && ![(_BPSAbstractCorrelateOrderedMerge *)v8 errored])
  {
    char v11 = [(_BPSAbstractCorrelateOrderedMerge *)v8 buffers];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a4];

    char v13 = [MEMORY[0x1E4F1CA98] null];
    int v14 = [v12 isEqual:v13];

    if (v14)
    {
      v30[0] = v7;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v16 = (void *)[v15 mutableCopy];
      uint64_t v17 = [(_BPSAbstractCorrelateOrderedMerge *)v8 buffers];
      [v17 setObject:v16 atIndexedSubscript:a4];
    }
    else
    {
      [v12 addObject:v7];
      if ((unint64_t)[v12 count] >= 2)
      {
        id v26 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, @"BPSCorrelateOrderedMerge.m", 173, @"Should only cache 1 event per stream. But got: %lu", objc_msgSend(v12, "count"));
      }
    }
    if (![(_BPSAbstractCorrelateOrderedMerge *)v8 recursion]
      && [(_BPSAbstractCorrelateOrderedMerge *)v8 demand])
    {
      [(_BPSAbstractCorrelateOrderedMerge *)v8 flushBufferAndRequestMoreWhileLocked];
    }
    int64_t v9 = 0;
    v18 = [(_BPSAbstractCorrelateOrderedMerge *)v8 requestsPerSubscription];
    v19 = [v18 objectAtIndexedSubscript:a4];

    if ([(_BPSAbstractCorrelateOrderedMerge *)v8 isWaitingForMoreValues]
      && [v19 integerValue] > 0)
    {
      goto LABEL_22;
    }
    v29 = v12;
    v20 = [(_BPSAbstractCorrelateOrderedMerge *)v8 buffers];
    v21 = [v20 objectAtIndexedSubscript:a4];
    v22 = [MEMORY[0x1E4F1CA98] null];
    if ([v21 isEqual:v22])
    {

      uint64_t v12 = v29;
    }
    else
    {
      v23 = [(_BPSAbstractCorrelateOrderedMerge *)v8 buffers];
      [v23 objectAtIndexedSubscript:a4];
      v24 = v28 = v19;
      uint64_t v27 = [v24 count];

      v19 = v28;
      uint64_t v12 = v29;
      if (v27)
      {
LABEL_22:
        os_unfair_lock_unlock(&v8->_lock);

        goto LABEL_7;
      }
      v20 = [(_BPSAbstractCorrelateOrderedMerge *)v8 requestsPerSubscription];
      [v20 setObject:&unk_1F040EE68 atIndexedSubscript:a4];
      int64_t v9 = 1;
    }

    goto LABEL_22;
  }
  os_unfair_lock_unlock(&v8->_lock);
  int64_t v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)_isBuffersEmpty
{
  uint64_t v8 = 0;
  int64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v3 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___BPSAbstractCorrelateOrderedMerge__isBuffersEmpty__block_invoke;
  v7[3] = &unk_1E5E76230;
  void v7[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];

  uint64_t v4 = *((int *)v9 + 6);
  id v5 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
  LOBYTE(v4) = [v5 count] == v4;

  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)_completeWhileLockedWithCompletion:(id)a3
{
  id v8 = a3;
  [(_BPSAbstractCorrelateOrderedMerge *)self setFinished:1];
  if ([(_BPSAbstractCorrelateOrderedMerge *)self upstreamCount])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(_BPSAbstractCorrelateOrderedMerge *)self completedUpstreamIndexes];
      v6 = [NSNumber numberWithUnsignedInteger:v4];
      [v5 addObject:v6];

      ++v4;
    }
    while (v4 < [(_BPSAbstractCorrelateOrderedMerge *)self upstreamCount]);
  }
  id v7 = [(_BPSAbstractCorrelateOrderedMerge *)self downstream];
  [(_BPSAbstractCorrelateOrderedMerge *)self setDownstream:0];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  [v7 receiveCompletion:v8];
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);
}

- (void)_guardedBecomeTerminal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_BPSAbstractCorrelateOrderedMerge *)self setFinished:1];
  unint64_t v4 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
  id v18 = (id)[v4 copy];

  if ([v18 count])
  {
    unint64_t v5 = 0;
    do
    {
      [(_BPSAbstractCorrelateOrderedMerge *)self updateBookmarksWhenLockedForIndex:v5];
      v6 = [MEMORY[0x1E4F1CA98] null];
      id v7 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
      [v7 setObject:v6 atIndexedSubscript:v5];

      id v8 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
      [v8 setObject:&unk_1F040EE50 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < [v18 count]);
  }
  int64_t v9 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      char v13 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
      [v13 setObject:v12 atIndexedSubscript:v11];

      ++v11;
      int v14 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
      unint64_t v15 = [v14 count];
    }
    while (v11 < v15);
  }
  os_unfair_lock_unlock(p_lock);
  if ([v18 count])
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v18 objectAtIndexedSubscript:v16];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v17 cancel];
      }

      ++v16;
    }
    while (v16 < [v18 count]);
  }
}

- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_BPSAbstractOrderedMerge receiveCompletion:atIndex:]((uint64_t)v7, a4, v8);
  }

  uint64_t v9 = [v6 state];
  if (v9 == 1)
  {
    [(_BPSAbstractCorrelateOrderedMerge *)v7 _guardedBecomeTerminal];
    os_unfair_lock_lock(&v7->_lock);
    [(_BPSAbstractCorrelateOrderedMerge *)v7 setErrored:1];
    unint64_t v16 = [(_BPSAbstractCorrelateOrderedMerge *)v7 downstream];
    [(_BPSAbstractCorrelateOrderedMerge *)v7 setDownstream:0];
    os_unfair_lock_unlock(&v7->_lock);
    os_unfair_recursive_lock_lock_with_options();
    [v16 receiveCompletion:v6];
    os_unfair_recursive_lock_unlock();
  }
  else if (!v9)
  {
    os_unfair_lock_lock(&v7->_lock);
    uint64_t v10 = [(_BPSAbstractCorrelateOrderedMerge *)v7 completedUpstreamIndexes];
    unint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
    [v10 addObject:v11];

    if (![(_BPSAbstractCorrelateOrderedMerge *)v7 finished])
    {
      [(_BPSAbstractCorrelateOrderedMerge *)v7 setFinishCount:[(_BPSAbstractCorrelateOrderedMerge *)v7 finishCount] + 1];
      [(_BPSAbstractCorrelateOrderedMerge *)v7 updateBookmarksWhenLockedForIndex:a4];
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      char v13 = [(_BPSAbstractCorrelateOrderedMerge *)v7 subscriptions];
      [v13 setObject:v12 atIndexedSubscript:a4];

      int v14 = [(_BPSAbstractCorrelateOrderedMerge *)v7 requestsPerSubscription];
      [v14 setObject:&unk_1F040EE50 atIndexedSubscript:a4];

      if (![(_BPSAbstractCorrelateOrderedMerge *)v7 recursion]
        && [(_BPSAbstractCorrelateOrderedMerge *)v7 demand])
      {
        [(_BPSAbstractCorrelateOrderedMerge *)v7 flushBufferAndRequestMoreWhileLocked];
      }
      uint64_t v15 = [(_BPSAbstractCorrelateOrderedMerge *)v7 finishCount];
      if (v15 == [(_BPSAbstractCorrelateOrderedMerge *)v7 upstreamCount]
        && [(_BPSAbstractCorrelateOrderedMerge *)v7 _isBuffersEmpty])
      {
        os_unfair_lock_unlock(&v7->_lock);
        [(_BPSAbstractCorrelateOrderedMerge *)v7 _guardedBecomeTerminal];
        os_unfair_lock_lock(&v7->_lock);
        [(_BPSAbstractCorrelateOrderedMerge *)v7 _completeWhileLockedWithCompletion:v6];
      }
    }
    os_unfair_lock_unlock(&v7->_lock);
  }
}

- (void)flushBufferAndRequestMoreWhileLocked
{
  uint64_t v4 = [(_BPSAbstractCorrelateOrderedMerge *)self downstream];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    id v6 = [(_BPSAbstractCorrelateOrderedMerge *)self downstream];
    char v7 = [v6 conformsToProtocol:&unk_1F0410B78];

    if ((v7 & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"BPSCorrelateOrderedMerge.m" lineNumber:313 description:@"Downstream should conform to BPSCorrelationProducer protocol"];
    }
  }
  if ([(_BPSAbstractCorrelateOrderedMerge *)self demand] >= 1)
  {
    while (![(_BPSAbstractCorrelateOrderedMerge *)self isWaitingForMoreValues])
    {
      id v25 = 0;
      uint64_t v9 = [(_BPSAbstractCorrelateOrderedMerge *)self nextValueIndex:&v25];
      id v10 = v25;
      unint64_t v11 = v10;
      if (!v9)
      {

        return;
      }
      [(_BPSAbstractCorrelateOrderedMerge *)self setDemand:[(_BPSAbstractCorrelateOrderedMerge *)self demand] - 1];
      [(_BPSAbstractCorrelateOrderedMerge *)self setRecursion:1];
      uint64_t v12 = [v11 integerValue];
      char v13 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
      int v14 = [v13 objectAtIndexedSubscript:v12];

      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue") - 1);
      unint64_t v16 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
      [v16 setObject:v15 atIndexedSubscript:v12];

      uint64_t v17 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
      id v18 = [v17 objectAtIndexedSubscript:v12];

      v19 = [(_BPSAbstractCorrelateOrderedMerge *)self downstream];
      os_unfair_lock_unlock(&self->_lock);
      os_unfair_recursive_lock_lock_with_options();
      uint64_t v20 = objc_msgSend(v19, "receiveInput:source:", v9, +[BPSCorrelate correlateSourceForIndex:](BPSCorrelate, "correlateSourceForIndex:", v12));
      os_unfair_recursive_lock_unlock();
      os_unfair_lock_lock(&self->_lock);
      [(_BPSAbstractCorrelateOrderedMerge *)self setRecursion:0];
      if (v20 >= 1) {
        [(_BPSAbstractCorrelateOrderedMerge *)self setDemand:[(_BPSAbstractCorrelateOrderedMerge *)self demand] + v20];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
        v22 = [v21 objectAtIndexedSubscript:v12];
        if ([v22 integerValue])
        {
        }
        else
        {
          uint64_t v24 = [(_BPSAbstractCorrelateOrderedMerge *)self demand];

          if (v24 >= 1)
          {
            v23 = [(_BPSAbstractCorrelateOrderedMerge *)self requestsPerSubscription];
            [v23 setObject:&unk_1F040EE68 atIndexedSubscript:v12];

            os_unfair_lock_unlock(&self->_lock);
            [v18 requestDemand:1];
            os_unfair_lock_lock(&self->_lock);
          }
        }
      }

      if ([(_BPSAbstractCorrelateOrderedMerge *)self demand] <= 0) {
        return;
      }
    }
  }
}

- (id)nextValueIndex:(id *)a3
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v5 = [(_BPSAbstractCorrelateOrderedMerge *)self buffers];
  id v6 = (void *)[v5 mutableCopy];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  id v12 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___BPSAbstractCorrelateOrderedMerge_nextValueIndex___block_invoke;
  v10[3] = &unk_1E5E76258;
  v10[5] = v11;
  v10[6] = &v13;
  v10[4] = self;
  [v6 enumerateObjectsUsingBlock:v10];
  if (a3)
  {
    *a3 = [NSNumber numberWithInteger:v14[3]];
  }
  if (v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v7 = 0;
  }
  else
  {
    id v8 = objc_msgSend(v6, "objectAtIndexedSubscript:");
    char v7 = [v8 objectAtIndexedSubscript:0];
    [v8 removeObjectAtIndex:0];
    [v6 setObject:v8 atIndexedSubscript:v14[3]];
    [(_BPSAbstractCorrelateOrderedMerge *)self setBuffers:v6];
  }
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)compareFirst:(id)a3 withSecond:(id)a4
{
  return 0;
}

- (void)cancel
{
  v2 = self;
  [(_BPSAbstractCorrelateOrderedMerge *)v2 _guardedBecomeTerminal];
  os_unfair_lock_lock(&v2->_lock);
  [(_BPSAbstractCorrelateOrderedMerge *)v2 setCancelled:1];
  [(_BPSAbstractCorrelateOrderedMerge *)v2 setDownstream:0];
  os_unfair_lock_unlock(&v2->_lock);
}

- (id)upstreamSubscriptions
{
  v2 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3
{
  unint64_t v5 = [(_BPSAbstractCorrelateOrderedMerge *)self subscriptions];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  char v7 = [MEMORY[0x1E4F1CA98] null];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    if ([v6 conformsToProtocol:&unk_1F040FEE8])
    {
      id v9 = v6;
      id v10 = (void *)[v9 newBookmark];
      if (v10) {
        [(NSMutableArray *)self->_upstreamBookmarks setObject:v10 atIndexedSubscript:a3];
      }
    }
    else
    {
      unint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_BPSMerged updateBookmarksWhenLockedForIndex:]((uint64_t)v6, v11);
      }
    }
  }
}

- (id)newBookmark
{
  v3 = [BMBookmarkNode alloc];
  upstreamBookmarks = self->_upstreamBookmarks;
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  char v7 = [(BMBookmarkNode *)v3 initWithValue:0 upstreams:upstreamBookmarks name:v6];

  return v7;
}

- (unint64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(unint64_t)a3
{
  self->_upstreamCount = a3;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSMutableArray)upstreamBookmarks
{
  return self->_upstreamBookmarks;
}

- (void)setUpstreamBookmarks:(id)a3
{
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
}

- (NSMutableArray)requestsPerSubscription
{
  return self->_requestsPerSubscription;
}

- (void)setRequestsPerSubscription:(id)a3
{
}

- (NSMutableSet)completedUpstreamIndexes
{
  return self->_completedUpstreamIndexes;
}

- (void)setCompletedUpstreamIndexes:(id)a3
{
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (unint64_t)finishCount
{
  return self->_finishCount;
}

- (void)setFinishCount:(unint64_t)a3
{
  self->_finishCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedUpstreamIndexes, 0);
  objc_storeStrong((id *)&self->_requestsPerSubscription, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_upstreamBookmarks, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end