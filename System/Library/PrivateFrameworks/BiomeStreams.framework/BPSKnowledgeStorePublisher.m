@interface BPSKnowledgeStorePublisher
- (BOOL)completed;
- (BPSKnowledgeStorePublisher)initWithEventQuery:(id)a3 knowledgeStore:(id)a4;
- (NSMutableArray)results;
- (_DKEventQuery)query;
- (_DKKnowledgeQuerying)store;
- (id)_updateCachedQueryResults;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (int64_t)remaining;
- (void)reset;
- (void)setRemaining:(int64_t)a3;
- (void)setResults:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSKnowledgeStorePublisher

- (BPSKnowledgeStorePublisher)initWithEventQuery:(id)a3 knowledgeStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSKnowledgeStorePublisher;
  v9 = [(BPSKnowledgeStorePublisher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [_BPSInnerKnowledgeSubscription alloc];
  v6 = [(BPSKnowledgeStorePublisher *)self query];
  id v7 = [(BPSKnowledgeStorePublisher *)self store];
  id v8 = [(_BPSInnerKnowledgeSubscription *)v5 initWithQuery:v6 downstream:v4 store:v7];

  [v4 receiveSubscription:v8];
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = [(BPSKnowledgeStorePublisher *)self query];
  if ([v4 limit])
  {
    v5 = [(BPSKnowledgeStorePublisher *)self query];
    uint64_t v6 = [v5 limit];

    if ((v6 & 0x8000000000000000) == 0)
    {
      id v7 = [(BPSKnowledgeStorePublisher *)self query];
      -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", [v7 limit]);

      goto LABEL_6;
    }
  }
  else
  {
  }
  [(BPSKnowledgeStorePublisher *)self setRemaining:0x7FFFFFFFFFFFFFFFLL];
LABEL_6:

  return [(BPSKnowledgeStorePublisher *)self _updateCachedQueryResults];
}

- (id)_updateCachedQueryResults
{
  v3 = [(BPSKnowledgeStorePublisher *)self results];
  if ([v3 count])
  {

LABEL_3:
    id v4 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [(BPSKnowledgeStorePublisher *)self remaining];

  if (v5 < 1) {
    goto LABEL_3;
  }
  int64_t v6 = [(BPSKnowledgeStorePublisher *)self remaining];
  id v7 = [(BPSKnowledgeStorePublisher *)self query];
  [v7 setLimit:v6];

  id v8 = [(BPSKnowledgeStorePublisher *)self store];
  v9 = [(BPSKnowledgeStorePublisher *)self query];
  id v16 = 0;
  v10 = [v8 executeQuery:v9 error:&v16];
  id v4 = v16;

  if ([(BPSKnowledgeStorePublisher *)self remaining] != 0x7FFFFFFFFFFFFFFFLL) {
    -[BPSKnowledgeStorePublisher setRemaining:](self, "setRemaining:", -[BPSKnowledgeStorePublisher remaining](self, "remaining") - [v10 count]);
  }
  v11 = [(BPSKnowledgeStorePublisher *)self query];
  objc_msgSend(v11, "setOffset:", objc_msgSend(v11, "offset") + objc_msgSend(v10, "count"));

  if (v4)
  {
    [(BPSKnowledgeStorePublisher *)self setRemaining:0];
    objc_super v12 = objc_opt_new();
    [(BPSKnowledgeStorePublisher *)self setResults:v12];

    id v13 = v4;
  }
  else
  {
    v14 = (void *)[v10 mutableCopy];
    [(BPSKnowledgeStorePublisher *)self setResults:v14];
  }
LABEL_11:

  return v4;
}

- (id)nextEvent
{
  id v3 = [(BPSKnowledgeStorePublisher *)self _updateCachedQueryResults];
  id v4 = [(BPSKnowledgeStorePublisher *)self results];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    int64_t v6 = [(BPSKnowledgeStorePublisher *)self results];
    id v7 = [v6 objectAtIndex:0];

    id v8 = [(BPSKnowledgeStorePublisher *)self results];
    [v8 removeObjectAtIndex:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)completed
{
  v2 = [(BPSKnowledgeStorePublisher *)self results];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)reset
{
  BOOL v3 = objc_opt_new();
  [(BPSKnowledgeStorePublisher *)self setResults:v3];

  [(BPSKnowledgeStorePublisher *)self setRemaining:0];
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (_DKKnowledgeQuerying)store
{
  return self->_store;
}

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end