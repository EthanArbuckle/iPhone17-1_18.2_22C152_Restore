@interface BPSCorrelate
+ (id)correlatePublisherChainWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6;
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
+ (int64_t)correlateSourceForIndex:(int64_t)a3;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6;
- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 updatedInitialContext:(id)a6 correlateHandler:(id)a7;
- (BPSCorrelateHandler)correlateHandler;
- (BPSPublisher)current;
- (BPSPublisher)prior;
- (id)bookmarkableUpstreams;
- (void)subscribe:(id)a3;
@end

@implementation BPSCorrelate

+ (int64_t)correlateSourceForIndex:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 updatedInitialContext:(id)a6 correlateHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BPSCorrelate;
  v18 = [(BPSCorrelate *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_prior, a3);
    objc_storeStrong((id *)&v19->_current, a4);
    objc_storeStrong((id *)&v19->_correlateHandler, a7);
    if (v16) {
      [(BPSCorrelateHandler *)v19->_correlateHandler updateContext:v16];
    }
    v20 = [[BPSCorrelateOrderedMerge alloc] initWithA:v19->_prior b:v19->_current comparator:v15];
    merger = v19->_merger;
    v19->_merger = v20;
  }
  return v19;
}

- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6
{
  return [(BPSCorrelate *)self initWithPrior:a3 current:a4 comparator:a5 updatedInitialContext:0 correlateHandler:a6];
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [[_BPSCorrelateInner alloc] initWithDownstream:v4 correlateHandler:self->_correlateHandler];

  [(BPSCorrelateOrderedMerge *)self->_merger subscribe:v5];
}

- (id)bookmarkableUpstreams
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_merger;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v23 = a5;
  if ([v10 count] != 1)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"BPSCorrelate.m", 237, @"BPSCorrelate should have an upstream while we have %lu", objc_msgSend(v10, "count"));
  }
  v11 = (id *)v9;
  v12 = [v10 objectAtIndexedSubscript:0];
  id v13 = [BPSCorrelate alloc];
  v22 = [v12 publishers];
  id v14 = [v22 objectAtIndexedSubscript:0];
  id v15 = [v12 publishers];
  id v16 = [v15 objectAtIndexedSubscript:1];
  id v17 = [v11[1] comparator];
  v18 = [v11 correlateHandler];

  v19 = [(BPSCorrelate *)v13 initWithPrior:v14 current:v16 comparator:v17 updatedInitialContext:v23 correlateHandler:v18];
  return v19;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

+ (id)correlatePublisherChainWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = [a3 mapWithTransform:&__block_literal_global];
  id v13 = [v11 mapWithTransform:&__block_literal_global_74];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_3;
  aBlock[3] = &unk_1E5E75FC0;
  id v29 = v9;
  id v14 = v9;
  id v15 = _Block_copy(aBlock);
  id v16 = [v12 orderedMergeWithOther:v13 comparator:v15];
  id v17 = [[BPSTuple alloc] initWithFirst:0 second:0];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_4;
  v26 = &unk_1E5E75FE8;
  id v27 = v10;
  id v18 = v10;
  v19 = [v16 scanWithInitial:v17 nextPartialResult:&v23];

  v20 = objc_msgSend(v19, "filterWithIsIncluded:", &__block_literal_global_82, v23, v24, v25, v26);
  v21 = [v20 mapWithTransform:&__block_literal_global_85];

  return v21;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BPSTuple alloc] initWithFirst:v2 second:@"prior"];

  return v3;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BPSTuple alloc] initWithFirst:v2 second:@"current"];

  return v3;
}

uint64_t __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  v6 = [a2 first];
  v7 = [v5 first];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 first];
  if (v6) {
    [*(id *)(a1 + 32) updateContext:v6];
  }
  v7 = [v5 first];
  uint64_t v8 = [v5 second];

  if ([v8 isEqualToString:@"prior"])
  {
    [*(id *)(a1 + 32) receivePriorEvent:v7];
  }
  else if ([v8 isEqualToString:@"current"])
  {
    [*(id *)(a1 + 32) receiveCurrentEvent:v7];
    id v9 = [*(id *)(a1 + 32) correlateWithCurrentEvent:v7];
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_8:
  id v10 = [BPSTuple alloc];
  id v11 = [*(id *)(a1 + 32) context];
  v12 = [(BPSTuple *)v10 initWithFirst:v11 second:v9];

  return v12;
}

BOOL __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 second];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 second];
}

- (BPSPublisher)prior
{
  return self->_prior;
}

- (BPSPublisher)current
{
  return self->_current;
}

- (BPSCorrelateHandler)correlateHandler
{
  return self->_correlateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlateHandler, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_prior, 0);
  objc_storeStrong((id *)&self->_merger, 0);
}

@end