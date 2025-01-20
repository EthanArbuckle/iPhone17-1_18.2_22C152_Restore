@interface BPSOrderedMerge
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BMIndirectHeap)heap;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)isOrderedSameForEvents:(id)a3 second:(id)a4;
- (BPSOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5;
- (BPSOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4;
- (NSArray)publishers;
- (NSMutableArray)upstreamStates;
- (id)comparator;
- (id)mostRecentEvent;
- (id)nextEvent;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setComparator:(id)a3;
- (void)setHeap:(id)a3;
- (void)setMostRecentEvent:(id)a3;
- (void)setUpstreamStates:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSOrderedMerge

- (void)reset
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(BPSOrderedMerge *)self publishers];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));
  [(BPSOrderedMerge *)self setUpstreamStates:v5];

  [(BMIndirectHeap *)self->_heap reset];
  v6.receiver = self;
  v6.super_class = (Class)BPSOrderedMerge;
  [(BPSPublisher *)&v6 reset];
}

void __28__BPSOrderedMerge_nextEvent__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  v7 = [*(id *)(a1 + 32) upstreamStates];
  v8 = [v7 objectAtIndexedSubscript:a3];

  v9 = [v8 nextEvent];
  if (v9)
  {
LABEL_2:

    goto LABEL_3;
  }
  v10 = [v8 upstream];
  char v11 = [v10 completed];

  if ((v11 & 1) == 0)
  {
    v9 = [v14 nextEvent];
    if (v9)
    {
      [v8 setNextEvent:v9];
      [*(id *)(*(void *)(a1 + 32) + 32) add:a3];
    }
    else
    {
      v12 = [v8 upstream];
      char v13 = [v12 completed];

      if ((v13 & 1) == 0)
      {
        *a4 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    goto LABEL_2;
  }
LABEL_3:
}

- (id)nextEvent
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(BPSOrderedMerge *)self upstreamStates];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    objc_super v6 = [(BPSOrderedMerge *)self publishers];
    v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    [(BPSOrderedMerge *)self setUpstreamStates:v7];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [(BPSOrderedMerge *)self publishers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          char v13 = objc_opt_new();
          [v13 attachUpstream:v12];
          id v14 = [(BPSOrderedMerge *)self upstreamStates];
          [v14 addObject:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v15 = [(BPSOrderedMerge *)self publishers];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __28__BPSOrderedMerge_nextEvent__block_invoke;
  v23[3] = &unk_1E5E762D0;
  v23[4] = self;
  v23[5] = &v24;
  [v15 enumerateObjectsUsingBlock:v23];

  if (![(BMIndirectHeap *)self->_heap count]) {
    goto LABEL_17;
  }
  if (!*((unsigned char *)v25 + 24)) {
    goto LABEL_14;
  }
  mostRecentEvent = self->_mostRecentEvent;
  if (!mostRecentEvent) {
    goto LABEL_18;
  }
  v17 = [(NSMutableArray *)self->_upstreamStates objectAtIndexedSubscript:[(BMIndirectHeap *)self->_heap top]];
  v18 = [v17 nextEvent];
  BOOL v19 = [(BPSOrderedMerge *)self isOrderedSameForEvents:mostRecentEvent second:v18];

  if (v19)
  {
LABEL_14:
    v20 = [(BPSOrderedMerge *)self upstreamStates];
    v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", -[BMIndirectHeap pop](self->_heap, "pop"));

    mostRecentEvent = [v21 nextEvent];
    if (mostRecentEvent)
    {
      objc_storeStrong(&self->_mostRecentEvent, mostRecentEvent);
      [v21 setLastReturnedEvent:mostRecentEvent];
      [v21 setNextEvent:0];
    }
  }
  else
  {
LABEL_17:
    mostRecentEvent = 0;
  }
LABEL_18:
  _Block_object_dispose(&v24, 8);
  return mostRecentEvent;
}

- (NSMutableArray)upstreamStates
{
  return self->_upstreamStates;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void)setUpstreamStates:(id)a3
{
}

- (BPSOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BPSOrderedMerge;
  uint64_t v9 = [(BPSOrderedMerge *)&v22 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publishers, a3);
    char v11 = _Block_copy(v8);
    id comparator = v10->_comparator;
    v10->_id comparator = v11;

    id mostRecentEvent = v10->_mostRecentEvent;
    v10->_id mostRecentEvent = 0;

    objc_initWeak(&location, v10);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__BPSOrderedMerge_initWithPublishers_comparator___block_invoke;
    aBlock[3] = &unk_1E5E76280;
    objc_copyWeak(&v20, &location);
    id v19 = v8;
    id v14 = _Block_copy(aBlock);
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4FB70]), "initWithHeapSize:isAscending:", objc_msgSend(v7, "count"), v14);
    heap = v10->_heap;
    v10->_heap = (BMIndirectHeap *)v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_heap, 0);
  objc_storeStrong((id *)&self->_upstreamStates, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

- (BPSOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  v15[1] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 arrayWithObjects:v15 count:2];

  char v13 = [(BPSOrderedMerge *)self initWithPublishers:v12 comparator:v9];
  return v13;
}

BOOL __49__BPSOrderedMerge_initWithPublishers_comparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained upstreamStates];
  id v9 = [v8 objectAtIndexedSubscript:a2];
  id v10 = [v9 nextEvent];

  id v11 = objc_loadWeakRetained(v6);
  uint64_t v12 = [v11 upstreamStates];
  char v13 = [v12 objectAtIndexedSubscript:a3];
  id v14 = [v13 nextEvent];

  BOOL v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() == -1;
  return v15;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSFilter subscribe:]((uint64_t)self, v5);
  }

  objc_super v6 = [_BPSOrderedMergeManyInner alloc];
  id v7 = [(BPSOrderedMerge *)self publishers];
  uint64_t v8 = [v7 count];
  id v9 = [(BPSOrderedMerge *)self comparator];
  id v10 = [(_BPSOrderedMergeManyInner *)v6 initWithDownstream:v4 upstreamCount:v8 comparator:v9];

  [v4 receiveSubscription:v10];
  id v11 = [(BPSOrderedMerge *)self publishers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__BPSOrderedMerge_subscribe___block_invoke;
  v13[3] = &unk_1E5E762A8;
  id v14 = v10;
  uint64_t v12 = v10;
  [v11 enumerateObjectsUsingBlock:v13];
}

void __29__BPSOrderedMerge_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_super v6 = [[_BPSAbstractOrderedMergeSide alloc] initWithIndex:a3 combiner:*(void *)(a1 + 32)];
  [v5 subscribe:v6];
}

- (BOOL)isOrderedSameForEvents:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(BPSOrderedMerge *)self comparator];
  uint64_t v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9 == 0;
}

- (id)validateBookmark:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 count];
    id v7 = [(BPSOrderedMerge *)self upstreamPublishers];
    uint64_t v8 = [v7 count];

    if (v6 == v8)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    id v14 = [NSString alloc];
    uint64_t v15 = objc_opt_class();
    v16 = [(BPSOrderedMerge *)self upstreamPublishers];
    char v13 = (void *)[v14 initWithFormat:@"%@ expected upstreamStates of count %lu, but received %lu", v15, objc_msgSend(v16, "count"), objc_msgSend(v5, "count")];

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = v13;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v9 = [v17 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v18];
  }
  else
  {
    id v10 = [NSString alloc];
    uint64_t v11 = objc_opt_class();
    id v5 = (id)[v10 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v11, objc_opt_class(), v4];
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = v5;
    char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v9 = [v12 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v13];
  }

LABEL_7:
  return v9;
}

- (void)applyBookmark:(id)a3
{
  [(BPSOrderedMerge *)self setUpstreamStates:a3];
  [(BMIndirectHeap *)self->_heap reset];
  id mostRecentEvent = self->_mostRecentEvent;
  self->_id mostRecentEvent = 0;

  id v5 = [(BPSOrderedMerge *)self upstreamStates];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__BPSOrderedMerge_applyBookmark___block_invoke;
  v6[3] = &unk_1E5E762F8;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __33__BPSOrderedMerge_applyBookmark___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  id v5 = [*(id *)(a1 + 32) upstreamPublishers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  [v17 attachUpstream:v6];
  id v7 = [v17 nextEvent];

  if (v7) {
    [*(id *)(*(void *)(a1 + 32) + 32) add:a3];
  }
  uint64_t v8 = [v17 lastReturnedEvent];

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    if (!v9[5]) {
      goto LABEL_6;
    }
    id v10 = [v9 comparator];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
    uint64_t v12 = [v17 lastReturnedEvent];
    uint64_t v13 = ((uint64_t (**)(void, uint64_t, void *))v10)[2](v10, v11, v12);

    if (v13 == -1)
    {
LABEL_6:
      uint64_t v14 = [v17 lastReturnedEvent];
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (BMIndirectHeap)heap
{
  return self->_heap;
}

- (void)setHeap:(id)a3
{
}

- (id)mostRecentEvent
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setMostRecentEvent:(id)a3
{
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [BPSOrderedMerge alloc];
  uint64_t v9 = [v6 comparator];
  id v10 = [(BPSOrderedMerge *)v8 initWithPublishers:v7 comparator:v9];

  return v10;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end