@interface BMKnowledgeContextPublisher
- (BMKnowledgeContextPublisher)initWithQuery:(id)a3 store:(id)a4 context:(id)a5 includeLiveEvents:(BOOL)a6;
- (BOOL)completed;
- (BOOL)includeLiveEvents;
- (BPSPublisher)combinedPublisher;
- (_CDUserContext)context;
- (_DKEventQuery)query;
- (_DKKnowledgeQuerying)store;
- (id)_combinedPublisher;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (id)withLiveEvents;
- (void)_combinedPublisher;
- (void)reset;
- (void)setCombinedPublisher:(id)a3;
- (void)setContext:(id)a3;
- (void)setIncludeLiveEvents:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setStore:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BMKnowledgeContextPublisher

- (BMKnowledgeContextPublisher)initWithQuery:(id)a3 store:(id)a4 context:(id)a5 includeLiveEvents:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [v11 eventStreams];
  uint64_t v15 = [v14 count];

  if (v15 != 1)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:](v16);
    }
    goto LABEL_7;
  }
  if ([v11 resultType])
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMKnowledgeContextPublisher initWithQuery:store:context:includeLiveEvents:](v16);
    }
LABEL_7:

    v17 = 0;
    goto LABEL_8;
  }
  v21.receiver = self;
  v21.super_class = (Class)BMKnowledgeContextPublisher;
  v19 = [(BMKnowledgeContextPublisher *)&v21 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_query, a3);
    objc_storeStrong((id *)&v20->_store, a4);
    objc_storeStrong((id *)&v20->_context, a5);
    v20->_includeLiveEvents = a6;
  }
  self = v20;
  v17 = self;
LABEL_8:

  return v17;
}

- (id)withLiveEvents
{
  v3 = [BMKnowledgeContextPublisher alloc];
  v4 = [(BMKnowledgeContextPublisher *)self query];
  v5 = [(BMKnowledgeContextPublisher *)self store];
  v6 = [(BMKnowledgeContextPublisher *)self context];
  v7 = [(BMKnowledgeContextPublisher *)v3 initWithQuery:v4 store:v5 context:v6 includeLiveEvents:1];

  return v7;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [(BMKnowledgeContextPublisher *)self _combinedPublisher];
  [v5 subscribe:v4];
}

- (id)_combinedPublisher
{
  v3 = [(_DKEventQuery *)self->_query eventStreams];
  id v4 = [v3 firstObject];
  id v5 = [v4 name];

  id DKBiomeQueryClass = get_DKBiomeQueryClass();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [DKBiomeQueryClass canShimDuetStreamNamed:v5]
    && [DKBiomeQueryClass instancesRespondToSelector:sel_initWithDKEventQuery_]
    && [DKBiomeQueryClass instancesRespondToSelector:sel_publisherForQueryWithError_])
  {
    v7 = (void *)[objc_alloc((Class)get_DKBiomeQueryClass()) initWithDKEventQuery:self->_query];
    id v18 = 0;
    v8 = [v7 publisherForQueryWithError:&v18];
    id v9 = v18;
    if (v9)
    {
      v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(BMKnowledgeContextPublisher *)(uint64_t)v9 _combinedPublisher];
      }
    }
  }
  else
  {
    id v11 = [BPSKnowledgeStorePublisher alloc];
    v7 = [(BMKnowledgeContextPublisher *)self query];
    id v9 = [(BMKnowledgeContextPublisher *)self store];
    v8 = [(BPSKnowledgeStorePublisher *)v11 initWithEventQuery:v7 knowledgeStore:v9];
  }

  if ([(BMKnowledgeContextPublisher *)self includeLiveEvents])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__BMKnowledgeContextPublisher__combinedPublisher__block_invoke;
    v17[3] = &unk_1E55D8008;
    v17[4] = self;
    id v12 = (void (**)(void))_Block_copy(v17);
    id v13 = v12[2]();
    v14 = [v13 bpsPublisher];
    uint64_t v15 = [(BPSKnowledgeStorePublisher *)v8 mergeWithOther:v14];
  }
  else
  {
    uint64_t v15 = v8;
  }

  return v15;
}

id __49__BMKnowledgeContextPublisher__combinedPublisher__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) query];
  v3 = [*(id *)(a1 + 32) context];
  id v4 = +[BMKnowledgeContextMapping liveEventsForQuery:v2 context:v3];

  return v4;
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = [(BMKnowledgeContextPublisher *)self _combinedPublisher];
  [(BMKnowledgeContextPublisher *)self setCombinedPublisher:v5];

  v6 = [(BMKnowledgeContextPublisher *)self combinedPublisher];
  v7 = [v6 startWithSubscriber:v4];

  return v7;
}

- (id)nextEvent
{
  v2 = [(BMKnowledgeContextPublisher *)self combinedPublisher];
  v3 = [v2 nextEvent];

  return v3;
}

- (BOOL)completed
{
  v2 = [(BMKnowledgeContextPublisher *)self combinedPublisher];
  char v3 = [v2 completed];

  return v3;
}

- (void)reset
{
  char v3 = [(BMKnowledgeContextPublisher *)self combinedPublisher];
  [v3 reset];

  [(BMKnowledgeContextPublisher *)self setCombinedPublisher:0];
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)includeLiveEvents
{
  return self->_includeLiveEvents;
}

- (void)setIncludeLiveEvents:(BOOL)a3
{
  self->_includeLiveEvents = a3;
}

- (BPSPublisher)combinedPublisher
{
  return self->_combinedPublisher;
}

- (void)setCombinedPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedPublisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (void)initWithQuery:(os_log_t)log store:context:includeLiveEvents:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMCoreDuetStream requires type = _DKEventQueryResultEvents", v1, 2u);
}

- (void)initWithQuery:(os_log_t)log store:context:includeLiveEvents:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMCoreDuetStream requires exactly 1 coreduet stream to be specified by _DKEventQuery", v1, 2u);
}

- (void)_combinedPublisher
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "BMCoreDuetStream failed to create publisher with error, %@", (uint8_t *)&v2, 0xCu);
}

@end