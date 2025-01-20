@interface _BPSSequenceInner
- (BOOL)recursion;
- (BPSSubscriber)downstream;
- (NSEnumerator)enumerator;
- (_BPSSequenceInner)initWithDownstream:(id)a3 enumerator:(id)a4;
- (id)next;
- (id)upstreamSubscriptions;
- (int64_t)pendingDemand;
- (void)cancel;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setEnumerator:(id)a3;
- (void)setNext:(id)a3;
- (void)setPendingDemand:(int64_t)a3;
- (void)setRecursion:(BOOL)a3;
@end

@implementation _BPSSequenceInner

- (_BPSSequenceInner)initWithDownstream:(id)a3 enumerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_BPSSequenceInner;
  v9 = [(_BPSSequenceInner *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downstream, a3);
    objc_storeStrong((id *)&v10->_enumerator, a4);
    v10->_recursion = 0;
    uint64_t v11 = [(NSEnumerator *)v10->_enumerator nextObject];
    id next = v10->_next;
    v10->_id next = (id)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)requestDemand:(int64_t)a3
{
  v12 = self;
  p_lock = &v12->_lock;
  os_unfair_lock_lock(&v12->_lock);
  v5 = [(_BPSSequenceInner *)v12 downstream];
  if (!v5
    || ([(_BPSSequenceInner *)v12 setPendingDemand:[(_BPSSequenceInner *)v12 pendingDemand] + a3], [(_BPSSequenceInner *)v12 recursion])|| [(_BPSSequenceInner *)v12 pendingDemand] < 1)
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    while (1)
    {
      v6 = [(_BPSSequenceInner *)v12 next];
      if (!v6) {
        break;
      }
      [(_BPSSequenceInner *)v12 setPendingDemand:[(_BPSSequenceInner *)v12 pendingDemand] - 1];
      id v7 = [(_BPSSequenceInner *)v12 enumerator];
      id v8 = [v7 nextObject];
      [(_BPSSequenceInner *)v12 setNext:v8];

      [(_BPSSequenceInner *)v12 setRecursion:1];
      os_unfair_lock_unlock(p_lock);
      uint64_t v9 = [v5 receiveInput:v6];
      os_unfair_lock_lock(p_lock);
      [(_BPSSequenceInner *)v12 setPendingDemand:[(_BPSSequenceInner *)v12 pendingDemand] + v9];
      [(_BPSSequenceInner *)v12 setRecursion:0];
      v10 = [(_BPSSequenceInner *)v12 next];

      if (!v10) {
        break;
      }

      if ([(_BPSSequenceInner *)v12 pendingDemand] <= 0) {
        goto LABEL_7;
      }
    }
    [(_BPSSequenceInner *)v12 setDownstream:0];
    os_unfair_lock_unlock(p_lock);
    uint64_t v11 = +[BPSCompletion success];
    [v5 receiveCompletion:v11];
  }
}

- (void)cancel
{
  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  [(_BPSSequenceInner *)v3 setDownstream:0];
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

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (void)setEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong(&self->_next, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end