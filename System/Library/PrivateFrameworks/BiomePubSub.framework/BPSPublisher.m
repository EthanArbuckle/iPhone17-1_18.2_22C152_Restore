@interface BPSPublisher
- (BOOL)completed;
- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5;
- (id)collect;
- (id)combineLatestwithOther:(id)a3;
- (id)connectableSinkWithCompletion:(id)a3 shouldContinue:(id)a4;
- (id)correlateWithCurrent:(id)a3 comparator:(id)a4 correlateHandler:(id)a5;
- (id)debounceFor:(double)a3 getTimestamp:(id)a4;
- (id)drivableSinkWithBookmark:(id)a3 completion:(id)a4 shouldContinue:(id)a5;
- (id)filterWithIsIncluded:(id)a3;
- (id)flatMapWithTransform:(id)a3;
- (id)groupByKey:(id)a3;
- (id)handleEventsReceiveOutput:(id)a3 receiveCancel:(id)a4;
- (id)handleEventsReceiveSubscription:(id)a3 receiveOutput:(id)a4 receiveCompletion:(id)a5 receiveCancel:(id)a6 receiveRequest:(id)a7;
- (id)last;
- (id)mapWithTransform:(id)a3;
- (id)mergeWithOther:(id)a3;
- (id)mergeWithOthers:(id)a3;
- (id)multicast;
- (id)multicastCreateSubject:(id)a3;
- (id)multicastSubject:(id)a3;
- (id)orderedMergeWithOther:(id)a3 comparator:(id)a4;
- (id)orderedMergeWithOthers:(id)a3 comparator:(id)a4;
- (id)reduce:(id)a3;
- (id)reduceWithInitial:(id)a3 nextPartialResult:(id)a4;
- (id)removeDuplicatesWithIsDuplicate:(id)a3;
- (id)scanWithInitial:(id)a3 nextPartialResult:(id)a4;
- (id)sequenceWithSequence:(id)a3;
- (id)sinkWithBookmark:(id)a3 completion:(id)a4 receiveInput:(id)a5;
- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4;
- (id)sinkWithCompletion:(id)a3 shouldContinue:(id)a4;
- (id)startWithSubscriber:(id)a3;
- (id)throttleFor:(double)a3 latest:(BOOL)a4 getTimestamp:(id)a5;
- (id)timerFor:(double)a3 getTimestamp:(id)a4;
- (id)upstreamPublishers;
- (id)windowByKey:(id)a3 assigner:(id)a4;
- (id)windowWithAssigner:(id)a3;
- (id)zipWithOther:(id)a3;
- (id)zipWithOthers:(id)a3;
- (void)reset;
- (void)subscribe:(id)a3;
@end

@implementation BPSPublisher

- (id)drivableSinkWithBookmark:(id)a3 completion:(id)a4 shouldContinue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    if (!+[BMBookmarkablePublisher isPipelineBookmarkable:self])
    {
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]();
      }
    }
    v12 = [[BPSDrivableSink alloc] initWithReceiveBookmarkCompletion:v10 shouldContinue:v9];

    if (v8 && [(BPSPublisher *)self conformsToProtocol:&unk_1F0410F80]) {
      [(BPSPublisher *)self applyBookmarkNode:v8];
    }
    [(BPSDrivableSink *)v12 subscribeTo:self];
  }
  else
  {
    v12 = [[BPSDrivableSink alloc] initWithReceiveBookmarkedCompletion:v10 shouldContinue:v9];

    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]((uint64_t)v8, v13);
    }

    if ([(BPSPublisher *)self conformsToProtocol:&unk_1F0410F80])
    {
      v14 = [(BPSPublisher *)self withBookmark:v8];
      [v14 subscribe:v12];
    }
    else
    {
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]();
      }
    }
  }
  return v12;
}

- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = BPSPipelineSupportsPullBasedPublishers(self);
  id v9 = [BPSSink alloc];
  id v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__BPSPublisher_BPSSubscribers__sinkWithCompletion_receiveInput___block_invoke;
    v13[3] = &unk_1E5E761B8;
    id v14 = v6;
    v11 = [(BPSSink *)v10 initWithReceiveBookmarkCompletion:v13 receiveInput:v7];

    [(BPSSink *)v11 subscribeTo:self];
  }
  else
  {
    v11 = [(BPSSink *)v9 initWithReceiveCompletion:v6 receiveInput:v7];

    [(BPSPublisher *)self subscribe:v11];
  }

  return v11;
}

- (id)sinkWithBookmark:(id)a3 completion:(id)a4 receiveInput:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    if (!+[BMBookmarkablePublisher isPipelineBookmarkable:self])
    {
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]();
      }
    }
    v12 = [[BPSSink alloc] initWithReceiveBookmarkCompletion:v10 receiveInput:v9];

    if (v8 && [(BPSPublisher *)self conformsToProtocol:&unk_1F0410F80]) {
      [(BPSPublisher *)self applyBookmarkNode:v8];
    }
    [(BPSSink *)v12 subscribeTo:self];
  }
  else
  {
    v12 = [[BPSSink alloc] initWithReceiveBookmarkedCompletion:v10 receiveInput:v9];

    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]((uint64_t)v8, v13);
    }

    if ([(BPSPublisher *)self conformsToProtocol:&unk_1F0410F80])
    {
      id v14 = [(BPSPublisher *)self withBookmark:v8];
      [v14 subscribe:v12];
    }
    else
    {
      id v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:]();
      }
    }
  }
  return v12;
}

uint64_t __64__BPSPublisher_BPSSubscribers__sinkWithCompletion_receiveInput___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)startWithSubscriber:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(BPSPublisher *)self upstreamPublishers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) startWithSubscriber:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BPSPublisher *)self upstreamPublishers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) reset];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)completed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BPSPublisher *)self upstreamPublishers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) completed])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

uint64_t __66__BPSPublisher_BPSSubscribers__sinkWithCompletion_shouldContinue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sinkWithCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = BPSPipelineSupportsPullBasedPublishers(self);
  long long v9 = [BPSDrivableSink alloc];
  long long v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__BPSPublisher_BPSSubscribers__sinkWithCompletion_shouldContinue___block_invoke;
    v13[3] = &unk_1E5E761B8;
    id v14 = v6;
    long long v11 = [(BPSDrivableSink *)v10 initWithReceiveBookmarkCompletion:v13 shouldContinue:v7];

    [(BPSDrivableSink *)v11 subscribeTo:self];
  }
  else
  {
    long long v11 = [(BPSDrivableSink *)v9 initWithReceiveCompletion:v6 shouldContinue:v7];

    [(BPSPublisher *)self subscribe:v11];
  }

  return v11;
}

- (id)correlateWithCurrent:(id)a3 comparator:(id)a4 correlateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    long long v11 = +[BPSCorrelate correlatePublisherChainWithPrior:self current:v8 comparator:v9 correlateHandler:v10];
  }
  else
  {
    long long v11 = [[BPSCorrelate alloc] initWithPrior:self current:v8 comparator:v9 correlateHandler:v10];
  }
  long long v12 = v11;

  return v12;
}

- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5
{
  uint64_t v5 = [[BPSBuffer alloc] initWithUpstream:self size:a3 prefetch:a4 whenFull:a5];
  return v5;
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)subscribe:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (id)connectableSinkWithCompletion:(id)a3 shouldContinue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BPSDrivableSink alloc] initWithReceiveCompletion:v6 shouldContinue:v5];

  return v7;
}

- (id)mergeWithOthers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = self;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4, v9, v10);

  id v7 = [[BPSMergeMany alloc] initWithPublishers:v6];
  return v7;
}

- (id)mergeWithOther:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSMerge alloc] initWithA:self b:v4];

  return v5;
}

- (id)combineLatestwithOther:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSCombineLatest alloc] initWithA:self b:v4];

  return v5;
}

- (id)debounceFor:(double)a3 getTimestamp:(id)a4
{
  id v6 = a4;
  id v7 = [[BPSDebounce alloc] initWithUpstream:self for:v6 getTimestamp:a3];

  return v7;
}

- (id)throttleFor:(double)a3 latest:(BOOL)a4 getTimestamp:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [[BPSThrottle alloc] initWithUpstream:self interval:v5 latest:v8 getTimestamp:a3];

  return v9;
}

- (id)scanWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSScan alloc] initWithUpstream:self initialResult:v7 nextPartialResult:v6];

  return v8;
}

- (id)timerFor:(double)a3 getTimestamp:(id)a4
{
  id v6 = a4;
  id v7 = [[BPSTimer alloc] initWithUpstream:self interval:v6 getTimestamp:a3];

  return v7;
}

- (id)reduceWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSReduce alloc] initWithUpstream:self initialResult:v7 nextPartialResult:v6];

  return v8;
}

- (id)reduce:(id)a3
{
  id v4 = a3;
  BOOL v5 = [BPSReduce alloc];
  id v6 = [v4 accumulator];
  id v7 = [v4 closure];

  id v8 = [(BPSReduce *)v5 initWithUpstream:self initialResult:v6 nextPartialResult:v7];
  return v8;
}

- (id)sequenceWithSequence:(id)a3
{
  id v3 = a3;
  id v4 = [[BPSSequence alloc] initWithSequence:v3];

  return v4;
}

- (id)mapWithTransform:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSMap alloc] initWithUpstream:self transform:v4];

  return v5;
}

- (id)last
{
  v2 = [[BPSLast alloc] initWithUpstream:self];
  return v2;
}

- (id)filterWithIsIncluded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSFilter alloc] initWithUpstream:self isIncluded:v4];

  return v5;
}

- (id)collect
{
  v2 = [[BPSCollect alloc] initWithUpstream:self];
  return v2;
}

- (id)flatMapWithTransform:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSFlatMap alloc] initWithUpstream:self maxPublishers:1 transform:v4];

  return v5;
}

- (id)zipWithOther:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSZip alloc] initWithA:self b:v4];

  return v5;
}

- (id)zipWithOthers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = self;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  BOOL v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4, v9, v10);

  id v7 = [[BPSZipMany alloc] initWithPublishers:v6];
  return v7;
}

- (id)orderedMergeWithOther:(id)a3 comparator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSOrderedMerge alloc] initWithA:self b:v7 comparator:v6];

  return v8;
}

- (id)orderedMergeWithOthers:(id)a3 comparator:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v12 = self;
  BOOL v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 arrayWithObjects:&v12 count:1];
  id v9 = objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v10 = [[BPSOrderedMerge alloc] initWithPublishers:v9 comparator:v6];
  return v10;
}

- (id)removeDuplicatesWithIsDuplicate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSRemoveDuplicates alloc] initWithUpstream:self isDuplicate:v4];

  return v5;
}

- (id)windowByKey:(id)a3 assigner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSWindower alloc] initWithUpstream:self key:v7 assigner:v6];

  return v8;
}

- (id)windowWithAssigner:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[BPSWindower alloc] initWithUpstream:self key:&__block_literal_global_5 assigner:v4];

  return v5;
}

__CFString *__49__BPSPublisher_BPSOperators__windowWithAssigner___block_invoke()
{
  return @"_";
}

- (id)multicast
{
  v2 = [[BPSMulticast alloc] initWithUpstream:self createSubject:0];
  return v2;
}

- (id)multicastSubject:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__BPSPublisher_BPSOperators__multicastSubject___block_invoke;
  v8[3] = &unk_1E5E76050;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(BPSPublisher *)self multicastCreateSubject:v8];

  return v6;
}

id __47__BPSPublisher_BPSOperators__multicastSubject___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)multicastCreateSubject:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSMulticast alloc] initWithUpstream:self createSubject:v4];

  return v5;
}

- (id)handleEventsReceiveOutput:(id)a3 receiveCancel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSHandleEvents alloc] initWithUpstream:self receiveOutput:v7 receiveCancel:v6];

  return v8;
}

- (id)handleEventsReceiveSubscription:(id)a3 receiveOutput:(id)a4 receiveCompletion:(id)a5 receiveCancel:(id)a6 receiveRequest:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[BPSHandleEvents alloc] initWithUpstream:self receiveSubscription:v16 receiveOutput:v15 receiveCompletion:v14 receiveCancel:v13 receiveRequest:v12];

  return v17;
}

- (id)groupByKey:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__BPSPublisher_GroupBy__groupByKey___block_invoke;
  v16[3] = &unk_1E5E764D0;
  id v5 = v4;
  id v17 = v5;
  id v6 = [(BPSPublisher *)self mapWithTransform:v16];
  id v7 = [(BPSPublisher *)self multicast];
  int v8 = BPSPipelineSupportsPullBasedPublishers(v7);

  if (v8)
  {
    id v9 = [[BPSGroupedPublisher alloc] initWithUpstream:v6 createSubject:0];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    long long v11 = [BPSGroupedPublisher alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__BPSPublisher_GroupBy__groupByKey___block_invoke_2;
    v14[3] = &unk_1E5E76050;
    id v15 = v10;
    id v12 = v10;
    id v9 = [(BPSGroupedPublisher *)v11 initWithUpstream:v6 createSubject:v14];
  }
  return v9;
}

BPSTuple *__36__BPSPublisher_GroupBy__groupByKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  id v5 = v3(v2, v4);
  id v6 = [[BPSTuple alloc] initWithFirst:v5 second:v4];

  return v6;
}

id __36__BPSPublisher_GroupBy__groupByKey___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end