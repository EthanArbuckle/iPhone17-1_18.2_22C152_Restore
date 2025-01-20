@interface _BPSInnerKnowledgeSubscription
- (BOOL)recursion;
- (BPSSubscriber)downstream;
- (_BPSInnerKnowledgeSubscription)initWithQuery:(id)a3 downstream:(id)a4 store:(id)a5;
- (_DKEventQuery)query;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)next;
- (id)upstreamSubscriptions;
- (int64_t)offset;
- (int64_t)pendingDemand;
- (int64_t)remaining;
- (void)cancel;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setNext:(id)a3;
- (void)setOffset:(int64_t)a3;
- (void)setPendingDemand:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setRecursion:(BOOL)a3;
- (void)setRemaining:(int64_t)a3;
@end

@implementation _BPSInnerKnowledgeSubscription

- (_BPSInnerKnowledgeSubscription)initWithQuery:(id)a3 downstream:(id)a4 store:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BPSInnerKnowledgeSubscription;
  v12 = [(_BPSInnerKnowledgeSubscription *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a4);
    objc_storeStrong((id *)&v13->_knowledgeStore, a5);
    p_query = (id *)&v13->_query;
    objc_storeStrong((id *)&v13->_query, a3);
    if (!-[_DKEventQuery limit](v13->_query, "limit") || [*p_query limit] < 0) {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v15 = [*p_query limit];
    }
    v13->_remaining = v15;
    v13->_pendingDemand = 0;
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)requestDemand:(int64_t)a3
{
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  v6 = [(_BPSInnerKnowledgeSubscription *)v4 downstream];
  if (!v6
    || ([(_BPSInnerKnowledgeSubscription *)v4 setPendingDemand:[(_BPSInnerKnowledgeSubscription *)v4 pendingDemand] + a3], [(_BPSInnerKnowledgeSubscription *)v4 recursion]))
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_25;
  }
  if ([(_BPSInnerKnowledgeSubscription *)v4 remaining] < 1)
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v7 = [(_BPSInnerKnowledgeSubscription *)v4 pendingDemand];
    uint64_t v8 = [(_BPSInnerKnowledgeSubscription *)v4 remaining];
    if (v7 >= v8) {
      uint64_t v7 = v8;
    }
    id v9 = [(_BPSInnerKnowledgeSubscription *)v4 query];
    [v9 setLimit:v7];

    id v10 = [(_BPSInnerKnowledgeSubscription *)v4 knowledgeStore];
    id v11 = [(_BPSInnerKnowledgeSubscription *)v4 query];
    id v24 = 0;
    id v12 = [v10 executeQuery:v11 error:&v24];
    id v13 = v24;

    if ([(_BPSInnerKnowledgeSubscription *)v4 remaining] != 0x7FFFFFFFFFFFFFFFLL) {
      -[_BPSInnerKnowledgeSubscription setRemaining:](v4, "setRemaining:", -[_BPSInnerKnowledgeSubscription remaining](v4, "remaining") - [v12 count]);
    }
    v14 = [(_BPSInnerKnowledgeSubscription *)v4 query];
    objc_msgSend(v14, "setOffset:", objc_msgSend(v14, "offset") + objc_msgSend(v12, "count"));

    if (v13)
    {
      os_unfair_lock_unlock(p_lock);
      uint64_t v15 = [(_BPSInnerKnowledgeSubscription *)v4 downstream];
      v16 = [MEMORY[0x1E4F501F8] failureWithError:v13];
      [v15 receiveCompletion:v16];

      goto LABEL_24;
    }
  }
  id v12 = v12;
  id v13 = [v12 objectEnumerator];
  objc_super v17 = [v13 nextObject];
  [(_BPSInnerKnowledgeSubscription *)v4 setNext:v17];

  if ([(_BPSInnerKnowledgeSubscription *)v4 pendingDemand] < 1)
  {
LABEL_19:
    os_unfair_lock_unlock(p_lock);

    goto LABEL_24;
  }
  if (!v12)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_24;
  }
  while (1)
  {
    v18 = [(_BPSInnerKnowledgeSubscription *)v4 next];
    if (!v18)
    {

      [(_BPSInnerKnowledgeSubscription *)v4 setDownstream:0];
      os_unfair_lock_unlock(p_lock);
      v22 = [MEMORY[0x1E4F501F8] success];
      [v6 receiveCompletion:v22];
      goto LABEL_23;
    }
    [(_BPSInnerKnowledgeSubscription *)v4 setPendingDemand:[(_BPSInnerKnowledgeSubscription *)v4 pendingDemand] - 1];
    v19 = [v13 nextObject];
    [(_BPSInnerKnowledgeSubscription *)v4 setNext:v19];

    [(_BPSInnerKnowledgeSubscription *)v4 setRecursion:1];
    os_unfair_lock_unlock(p_lock);
    uint64_t v20 = [v6 receiveInput:v18];
    os_unfair_lock_lock(p_lock);
    [(_BPSInnerKnowledgeSubscription *)v4 setPendingDemand:[(_BPSInnerKnowledgeSubscription *)v4 pendingDemand] + v20];
    [(_BPSInnerKnowledgeSubscription *)v4 setRecursion:0];
    v21 = [(_BPSInnerKnowledgeSubscription *)v4 next];
    if (!v21) {
      break;
    }

LABEL_18:
    if ([(_BPSInnerKnowledgeSubscription *)v4 pendingDemand] <= 0) {
      goto LABEL_19;
    }
  }
  if ([(_BPSInnerKnowledgeSubscription *)v4 pendingDemand]) {
    goto LABEL_18;
  }
  [(_BPSInnerKnowledgeSubscription *)v4 setDownstream:0];
  os_unfair_lock_unlock(p_lock);
  v23 = [MEMORY[0x1E4F501F8] success];
  [v6 receiveCompletion:v23];

  v22 = v12;
LABEL_23:

LABEL_24:
LABEL_25:
}

- (void)cancel
{
  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  [(_BPSInnerKnowledgeSubscription *)v3 setDownstream:0];
  os_unfair_lock_unlock(p_lock);
}

- (id)upstreamSubscriptions
{
  return 0;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (int64_t)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(int64_t)a3
{
  self->_pendingDemand = a3;
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (id)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_next, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_downstream, 0);
}

@end