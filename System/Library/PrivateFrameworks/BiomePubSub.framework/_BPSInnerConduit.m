@interface _BPSInnerConduit
- (BOOL)released;
- (BPSPassThroughSubject)parent;
- (BPSSubscriber)downstream;
- (_BPSInnerConduit)initWithParent:(id)a3 downstream:(id)a4;
- (id)upstreamSubscriptions;
- (int64_t)demand;
- (int64_t)identity;
- (void)cancel;
- (void)finishWithCompletion:(id)a3;
- (void)offerInput:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setIdentity:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setReleased:(BOOL)a3;
@end

@implementation _BPSInnerConduit

- (_BPSInnerConduit)initWithParent:(id)a3 downstream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSInnerConduit;
  v9 = [(_BPSInnerConduit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_storeStrong((id *)&v10->_downstream, a4);
    v10->_released = 0;
    v10->_demand = 0;
    v10->_identity = -1;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_downstreamLock = 0;
  }

  return v10;
}

- (void)offerInput:(id)a3
{
  id v8 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(_BPSInnerConduit *)v4 demand] >= 1 && ![(_BPSInnerConduit *)v4 released])
  {
    [(_BPSInnerConduit *)v4 setDemand:[(_BPSInnerConduit *)v4 demand] - 1];
    os_unfair_lock_unlock(p_lock);
    os_unfair_recursive_lock_lock_with_options();
    v6 = [(_BPSInnerConduit *)v4 downstream];
    uint64_t v7 = [v6 receiveInput:v8];

    os_unfair_recursive_lock_unlock();
    if (v7 < 1) {
      goto LABEL_6;
    }
    os_unfair_lock_lock(p_lock);
    [(_BPSInnerConduit *)v4 setDemand:[(_BPSInnerConduit *)v4 demand] + v7];
  }
  os_unfair_lock_unlock(p_lock);
LABEL_6:
}

- (void)finishWithCompletion:(id)a3
{
  id v7 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(_BPSInnerConduit *)v4 released])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(_BPSInnerConduit *)v4 setReleased:1];
    v6 = [(_BPSInnerConduit *)v4 downstream];
    [(_BPSInnerConduit *)v4 setDownstream:0];
    os_unfair_lock_unlock(p_lock);
    [v6 receiveCompletion:v7];
  }
}

- (void)requestDemand:(int64_t)a3
{
  v5 = self;
  v9 = v5;
  if (a3 <= 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v9 file:@"BPSPassThroughSubject.m" lineNumber:113 description:@"Demand should be greater than 0"];

    v5 = v9;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(_BPSInnerConduit *)v9 released])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(_BPSInnerConduit *)v9 setDemand:[(_BPSInnerConduit *)v9 demand] + a3];
    os_unfair_lock_unlock(p_lock);
    id v7 = [(_BPSInnerConduit *)v9 parent];
    [v7 acknowledgeDownstreamDemand];
  }
}

- (void)cancel
{
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(_BPSInnerConduit *)v4 released])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(_BPSInnerConduit *)v4 setReleased:1];
    os_unfair_lock_unlock(p_lock);
    v3 = [(_BPSInnerConduit *)v4 parent];
    objc_msgSend(v3, "disassociate:", -[_BPSInnerConduit identity](v4, "identity"));

    [(_BPSInnerConduit *)v4 setParent:0];
    [(_BPSInnerConduit *)v4 setDownstream:0];
  }
}

- (id)upstreamSubscriptions
{
  v2 = [(_BPSInnerConduit *)self parent];
  v3 = [v2 upstreamSubscriptions];

  return v3;
}

- (BPSPassThroughSubject)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (BOOL)released
{
  return self->_released;
}

- (void)setReleased:(BOOL)a3
{
  self->_released = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (int64_t)identity
{
  return self->_identity;
}

- (void)setIdentity:(int64_t)a3
{
  self->_identity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end