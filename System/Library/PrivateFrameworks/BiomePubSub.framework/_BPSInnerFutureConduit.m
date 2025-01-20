@interface _BPSInnerFutureConduit
- (BOOL)hasAnyDemand;
- (BOOL)released;
- (BPSFuture)parent;
- (BPSSubscriber)downstream;
- (_BPSInnerFutureConduit)initWithParent:(id)a3 downstream:(id)a4;
- (id)upstreamSubscriptions;
- (int64_t)identifity;
- (void)cancel;
- (void)fulfill:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setHasAnyDemand:(BOOL)a3;
- (void)setIdentifity:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setReleased:(BOOL)a3;
@end

@implementation _BPSInnerFutureConduit

- (_BPSInnerFutureConduit)initWithParent:(id)a3 downstream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSInnerFutureConduit;
  v9 = [(_BPSInnerFutureConduit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_storeStrong((id *)&v10->_downstream, a4);
    v10->_hasAnyDemand = 0;
    v10->_released = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_downstreamLock = 0;
  }

  return v10;
}

- (void)requestDemand:(int64_t)a3
{
  v5 = self;
  v15 = v5;
  if (a3 <= 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:v15 file:@"BPSFuture.m" lineNumber:181 description:@"Demand should be greater than 0"];

    v5 = v15;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(_BPSInnerFutureConduit *)v15 released])
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_14;
  }
  [(_BPSInnerFutureConduit *)v15 setHasAnyDemand:1];
  id v7 = [(_BPSInnerFutureConduit *)v15 parent];
  id v8 = [v7 result];

  if (v8)
  {
    v9 = [(_BPSInnerFutureConduit *)v15 downstream];
    [(_BPSInnerFutureConduit *)v15 setReleased:1];
    os_unfair_lock_unlock(p_lock);
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v10 = [v8 state];
    if (v10 == 1)
    {
      objc_super v12 = [v8 error];
      v13 = +[BPSCompletion failureWithError:v12];
      [v9 receiveCompletion:v13];
    }
    else
    {
      if (v10)
      {
LABEL_12:
        os_unfair_recursive_lock_unlock();

        goto LABEL_13;
      }
      v11 = [v8 value];
      [v9 receiveInput:v11];

      objc_super v12 = +[BPSCompletion success];
      [v9 receiveCompletion:v12];
    }

    goto LABEL_12;
  }
  os_unfair_lock_unlock(p_lock);
LABEL_13:

LABEL_14:
}

- (void)fulfill:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(_BPSInnerFutureConduit *)self released]
    || ![(_BPSInnerFutureConduit *)self hasAnyDemand])
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_10;
  }
  v4 = [(_BPSInnerFutureConduit *)self downstream];
  [(_BPSInnerFutureConduit *)self setReleased:1];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [v9 state];
  if (v5 == 1)
  {
    id v7 = [v9 error];
    id v8 = +[BPSCompletion failureWithError:v7];
    [v4 receiveCompletion:v8];

    goto LABEL_8;
  }
  if (!v5)
  {
    v6 = [v9 value];
    [v4 receiveInput:v6];

    id v7 = +[BPSCompletion success];
    [v4 receiveCompletion:v7];
LABEL_8:
  }
  os_unfair_recursive_lock_unlock();

LABEL_10:
}

- (void)cancel
{
  v3 = self;
  os_unfair_lock_lock(&v3->_lock);
  if (![(_BPSInnerFutureConduit *)v3 released])
  {
    [(_BPSInnerFutureConduit *)v3 setReleased:1];
    v2 = [(_BPSInnerFutureConduit *)v3 parent];
    objc_msgSend(v2, "disassociate:", -[_BPSInnerFutureConduit identifity](v3, "identifity"));
  }
  os_unfair_lock_unlock(&v3->_lock);
}

- (id)upstreamSubscriptions
{
  return 0;
}

- (BPSFuture)parent
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

- (BOOL)hasAnyDemand
{
  return self->_hasAnyDemand;
}

- (void)setHasAnyDemand:(BOOL)a3
{
  self->_hasAnyDemand = a3;
}

- (int64_t)identifity
{
  return self->_identifity;
}

- (void)setIdentifity:(int64_t)a3
{
  self->_identifity = a3;
}

- (BOOL)released
{
  return self->_released;
}

- (void)setReleased:(BOOL)a3
{
  self->_released = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end