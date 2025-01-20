@interface BMBookmarkablePublisher
+ (BOOL)isPipelineBookmarkable:(id)a3;
+ (id)bookmarkablePublishersFromPublishers:(id)a3;
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (NSArray)bookmarkableUpstreams;
- (id)bookmark;
- (id)bookmarkNode;
- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5;
- (id)collect;
- (id)correlateWithCurrent:(id)a3 comparator:(id)a4 correlateHandler:(id)a5;
- (id)filterWithIsIncluded:(id)a3;
- (id)flatMapWithTransform:(id)a3;
- (id)groupByKey:(id)a3;
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
- (id)scanWithInitial:(id)a3 nextPartialResult:(id)a4;
- (id)validateBookmark:(id)a3;
- (id)validateBookmarkNode:(id)a3;
- (id)withBookmark:(id)a3;
- (void)applyBookmarkNode:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BMBookmarkablePublisher

+ (BOOL)isPipelineBookmarkable:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v6 = [a1 bookmarkablePublishersFromPublishers:v5];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "upstreamPublishers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      int v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v12 &= [a1 isPipelineBookmarkable:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)applyBookmarkNode:(id)a3
{
  id v4 = a3;
  v5 = [(BMBookmarkablePublisher *)self validateBookmarkNode:v4];

  if (!v5)
  {
    v6 = [v4 value];
    [(BMBookmarkablePublisher *)self applyBookmark:v6];

    uint64_t v7 = objc_opt_class();
    v8 = [(BPSPublisher *)self upstreamPublishers];
    uint64_t v9 = [v7 bookmarkablePublishersFromPublishers:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__BMBookmarkablePublisher_applyBookmarkNode___block_invoke;
    v10[3] = &unk_1E5E76078;
    id v11 = v4;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

- (id)validateBookmarkNode:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [NSString alloc];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v11 = (void *)[v18 initWithFormat:@"%@ expected publisher with class %@, but received %@", v19, v20, objc_opt_class()];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = v11;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v17 = [v21 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v16];
    goto LABEL_8;
  }
  v5 = [v4 name];
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v22 = [NSString alloc];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = [v4 name];
    id v11 = (void *)[v22 initWithFormat:@"%@ expected publisher with name %@, but received %@", v23, v24, v25];

    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46 = v11;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v17 = [v26 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v16];
    goto LABEL_8;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [(BPSPublisher *)self upstreamPublishers];
  id v11 = [v9 bookmarkablePublishersFromPublishers:v10];

  int v12 = [v4 upstreams];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v11 count];

  if (v13 == v14)
  {
    long long v15 = [v4 value];
    long long v16 = [(BMBookmarkablePublisher *)self validateBookmark:v15];

    if (v16)
    {
      id v17 = v16;
      long long v16 = v17;
LABEL_8:
      id v27 = v17;
      goto LABEL_9;
    }
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    id v42 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __48__BMBookmarkablePublisher_validateBookmarkNode___block_invoke;
    v34[3] = &unk_1E5E76368;
    id v35 = v4;
    v36 = &v37;
    [v11 enumerateObjectsUsingBlock:v34];
    id v27 = (id)v38[5];

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v29 = [NSString alloc];
    uint64_t v30 = objc_opt_class();
    v31 = [v4 upstreams];
    long long v16 = (void *)[v29 initWithFormat:@"%@ expected publisher upstream count %lu, but received %lu", v30, objc_msgSend(v31, "count"), objc_msgSend(v11, "count")];

    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44 = v16;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v27 = [v32 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v33];
  }
LABEL_9:

  return v27;
}

- (id)bookmarkNode
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = objc_opt_class();
  v5 = [(BPSPublisher *)self upstreamPublishers];
  v6 = [v4 bookmarkablePublishersFromPublishers:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) bookmarkNode];
        [v3 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  int v12 = [BMBookmarkNode alloc];
  uint64_t v13 = [(BMBookmarkablePublisher *)self bookmark];
  uint64_t v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  long long v16 = [(BMBookmarkNode *)v12 initWithValue:v13 upstreams:v3 name:v15];

  return v16;
}

+ (id)bookmarkablePublishersFromPublishers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F0410F80, (void)v13)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (id)bookmark
{
  return 0;
}

- (id)validateBookmark:(id)a3
{
  return 0;
}

- (id)filterWithIsIncluded:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSFilter alloc] initWithUpstream:self isIncluded:v4];

  return v5;
}

- (id)reduce:(id)a3
{
  id v4 = a3;
  id v5 = [BPSReduce alloc];
  uint64_t v6 = [v4 accumulator];
  uint64_t v7 = [v4 closure];

  uint64_t v8 = [(BPSReduce *)v5 initWithUpstream:self initialResult:v6 nextPartialResult:v7];
  return v8;
}

- (id)reduceWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[BPSReduce alloc] initWithUpstream:self initialResult:v7 nextPartialResult:v6];

  return v8;
}

- (id)groupByKey:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke;
  v16[3] = &unk_1E5E764D0;
  id v5 = v4;
  id v17 = v5;
  id v6 = [(BMBookmarkablePublisher *)self mapWithTransform:v16];
  id v7 = [(BMBookmarkablePublisher *)self multicast];
  int v8 = BPSPipelineSupportsPullBasedPublishers(v7);

  if (v8)
  {
    uint64_t v9 = [[BPSGroupedPublisher alloc] initWithUpstream:v6 createSubject:0];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    id v11 = [BPSGroupedPublisher alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke_2;
    v14[3] = &unk_1E5E76050;
    id v15 = v10;
    id v12 = v10;
    uint64_t v9 = [(BPSGroupedPublisher *)v11 initWithUpstream:v6 createSubject:v14];
  }
  return v9;
}

- (id)mapWithTransform:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSMap alloc] initWithUpstream:self transform:v4];

  return v5;
}

- (id)multicast
{
  v2 = [[BPSMulticast alloc] initWithUpstream:self createSubject:0];
  return v2;
}

- (id)flatMapWithTransform:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSFlatMap alloc] initWithUpstream:self maxPublishers:1 transform:v4];

  return v5;
}

void __48__BMBookmarkablePublisher_validateBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 upstreams];
  uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
  id obj = [v8 validateBookmarkNode:v10];

  id v11 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    id v11 = obj;
    *a4 = 1;
  }
}

void __45__BMBookmarkablePublisher_applyBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 upstreams];
  id v6 = [v7 objectAtIndexedSubscript:a3];
  [v5 applyBookmarkNode:v6];
}

- (id)orderedMergeWithOthers:(id)a3 comparator:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = self;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 arrayWithObjects:&v12 count:1];
  uint64_t v9 = objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7, v12, v13);

  uint64_t v10 = [[BPSOrderedMerge alloc] initWithPublishers:v9 comparator:v6];
  return v10;
}

- (id)correlateWithCurrent:(id)a3 comparator:(id)a4 correlateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    id v11 = +[BPSCorrelate correlatePublisherChainWithPrior:self current:v8 comparator:v9 correlateHandler:v10];
  }
  else
  {
    id v11 = [[BPSCorrelate alloc] initWithPrior:self current:v8 comparator:v9 correlateHandler:v10];
  }
  id v12 = v11;

  return v12;
}

- (id)mergeWithOthers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = self;
  id v3 = (void *)MEMORY[0x1E4F1C978];
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

- (id)scanWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSScan alloc] initWithUpstream:self initialResult:v7 nextPartialResult:v6];

  return v8;
}

- (id)last
{
  v2 = [[BPSLast alloc] initWithUpstream:self];
  return v2;
}

- (id)collect
{
  v2 = [[BPSCollect alloc] initWithUpstream:self];
  return v2;
}

- (id)orderedMergeWithOther:(id)a3 comparator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BPSOrderedMerge alloc] initWithA:self b:v7 comparator:v6];

  return v8;
}

- (id)multicastSubject:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__BMBookmarkablePublisher_BPSOperators__multicastSubject___block_invoke;
  v8[3] = &unk_1E5E76050;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(BMBookmarkablePublisher *)self multicastCreateSubject:v8];

  return v6;
}

id __58__BMBookmarkablePublisher_BPSOperators__multicastSubject___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)multicastCreateSubject:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSMulticast alloc] initWithUpstream:self createSubject:v4];

  return v5;
}

- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5
{
  id v5 = [[BPSBuffer alloc] initWithUpstream:self size:a3 prefetch:a4 whenFull:a5];
  return v5;
}

- (void)subscribe:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7 = a3;
  if ([a4 count])
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    uint64_t v10 = NSStringFromSelector(a2);
    [v8 raise:v9, @"Override method %@ in subclass %@", v10, objc_opt_class() format];
  }
  return v7;
}

- (id)withBookmark:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMBookmarkablePublisher withBookmark:].cold.4((uint64_t)v4, v6);
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }
  v36 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v7 = [(BMBookmarkablePublisher *)self bookmarkableUpstreams];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    id v35 = v40;
    while (1)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v35);
      BOOL v10 = [(BMBookmarkablePublisher *)self canStoreInternalStateInBookmark];
      if (!v5 || !v10) {
        break;
      }
      id v11 = [v5 upstreams];

      if (!v11)
      {
        long long v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[BMBookmarkablePublisher withBookmark:](&v41, v42);
        }
        goto LABEL_21;
      }
      id v12 = [v5 upstreams];
      unint64_t v13 = [v12 count];

      if (v13 <= v8)
      {
        id v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[BMBookmarkablePublisher withBookmark:](&v39, v35);
        }

        long long v16 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_20;
      }
      long long v14 = [v5 upstreams];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v8];

      uint64_t v9 = v15;
LABEL_21:

      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      int v19 = [v9 isEqual:v18];

      if (v19)
      {
        long long v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v4;
          __int16 v45 = 2112;
          v46 = self;
          _os_log_debug_impl(&dword_1AD01F000, v20, OS_LOG_TYPE_DEBUG, "Null bookmark:\n%@ for publisher:%@", buf, 0x16u);
        }
      }
      long long v21 = [MEMORY[0x1E4F1CA98] null];
      if ([v9 isEqual:v21]) {
        id v22 = 0;
      }
      else {
        id v22 = v9;
      }
      uint64_t v23 = v22;

      uint64_t v24 = [v7 objectAtIndexedSubscript:v8];
      int v25 = [v24 conformsToProtocol:&unk_1F0410F80];

      if (v25)
      {
        v26 = [v7 objectAtIndexedSubscript:v8];
        id v27 = [v26 withBookmark:v23];
        [v36 addObject:v27];
      }
      else
      {
        v26 = __biome_log_for_category();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[BMBookmarkablePublisher withBookmark:](&v37, v38);
        }
      }

      if (++v8 >= [v7 count]) {
        goto LABEL_33;
      }
    }
    long long v16 = v5;
LABEL_20:
    long long v14 = v9;
    uint64_t v9 = v16;
    goto LABEL_21;
  }
LABEL_33:
  v28 = objc_opt_class();
  id v29 = [v5 value];
  uint64_t v30 = [v28 publisherWithPublisher:self upstreams:v36 bookmarkState:v29];

  if ([(BMBookmarkablePublisher *)self canStorePassThroughValueInBookmark])
  {
    v31 = [BMBookmarkWrapper alloc];
    v32 = [v5 value];
    v33 = [(BMBookmarkWrapper *)v31 initWithUpstream:v30 initialState:v32];
  }
  else
  {
    v33 = v30;
  }

  return v33;
}

- (NSArray)bookmarkableUpstreams
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

BPSTuple *__47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  id v5 = v3(v2, v4);
  id v6 = [[BPSTuple alloc] initWithFirst:v5 second:v4];

  return v6;
}

id __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)withBookmark:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AD01F000, v2, (uint64_t)v2, "Current upstream publisher doesn't support bookmark", v3);
}

- (void)withBookmark:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AD01F000, v2, (uint64_t)v2, "Upstream bookmarks shouldn't be nil", v3);
}

- (void)withBookmark:(unsigned char *)a1 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_3(a1, a2);
  _os_log_fault_impl(&dword_1AD01F000, v2, OS_LOG_TYPE_FAULT, "The amount of upstream bookmark nodes is less than upstream subscriptions", v3, 2u);
}

- (void)withBookmark:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "Bookmark should be BMBookmarkNode, instead got %@", (uint8_t *)&v2, 0xCu);
}

@end