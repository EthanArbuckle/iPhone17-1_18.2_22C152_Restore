@interface BPSCorrelateOrderedMerge
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSCorrelateOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5;
- (BPSCorrelateOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4;
- (NSArray)publishers;
- (id)comparator;
- (void)setComparator:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSCorrelateOrderedMerge

- (BPSCorrelateOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  v15[1] = a4;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:v15 count:2];

  v13 = [(BPSCorrelateOrderedMerge *)self initWithPublishers:v12 comparator:v9];
  return v13;
}

- (BPSCorrelateOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSCorrelateOrderedMerge;
  id v9 = [(BPSCorrelateOrderedMerge *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publishers, a3);
    id v11 = _Block_copy(v8);
    id comparator = v10->_comparator;
    v10->_id comparator = v11;
  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSFilter subscribe:]((uint64_t)self, v5);
  }

  v6 = [_BPSCorrelateOrderedMergeManyInner alloc];
  id v7 = [(BPSCorrelateOrderedMerge *)self publishers];
  uint64_t v8 = [v7 count];
  id v9 = [(BPSCorrelateOrderedMerge *)self comparator];
  id v10 = [(_BPSCorrelateOrderedMergeManyInner *)v6 initWithDownstream:v4 upstreamCount:v8 comparator:v9];

  [v4 receiveSubscription:v10];
  id v11 = [(BPSCorrelateOrderedMerge *)self publishers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__BPSCorrelateOrderedMerge_subscribe___block_invoke;
  v13[3] = &unk_1E5E762A8;
  objc_super v14 = v10;
  v12 = v10;
  [v11 enumerateObjectsUsingBlock:v13];
}

void __38__BPSCorrelateOrderedMerge_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [[_BPSAbstractCorrelateOrderedMergeSide alloc] initWithIndex:a3 combiner:*(void *)(a1 + 32)];
  [v5 subscribe:v6];
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [BPSCorrelateOrderedMerge alloc];
  id v9 = [v6 comparator];
  id v10 = [(BPSCorrelateOrderedMerge *)v8 initWithPublishers:v7 comparator:v9];

  return v10;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end