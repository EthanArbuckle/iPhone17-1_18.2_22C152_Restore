@interface MTLResourceListPool
- (MTLResourceListPool)initWithResourceListCapacity:(int)a3;
- (int)availableCount;
- (void)dealloc;
- (void)purge;
@end

@implementation MTLResourceListPool

- (MTLResourceListPool)initWithResourceListCapacity:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLResourceListPool;
  result = [(MTLResourceListPool *)&v5 init];
  if (result)
  {
    result->_priv.queue.tqh_first = 0;
    result->_resourceListCapacity = a3;
    result->_priv.queue.tqh_last = (id *)&result->_priv.queue.tqh_first;
    *(void *)&result->_priv.lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)purge
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  tqh_first = self->_priv.queue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_listPriv.entry.tqe_next;
      tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_listPriv.entry.tqe_prev = tqe_prev;
        v7 = tqh_first->_listPriv.entry.tqe_next;
        tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      }
      else
      {
        v7 = 0;
        self->_priv.queue.tqh_last = tqe_prev;
      }
      id *tqe_prev = v7;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  tqh_first = self->_priv.queue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_listPriv.entry.tqe_next;
      tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_listPriv.entry.tqe_prev = tqe_prev;
        v6 = tqh_first->_listPriv.entry.tqe_next;
        tqe_prev = tqh_first->_listPriv.entry.tqe_prev;
      }
      else
      {
        v6 = 0;
        self->_priv.queue.tqh_last = tqe_prev;
      }
      id *tqe_prev = v6;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  v7.receiver = self;
  v7.super_class = (Class)MTLResourceListPool;
  [(MTLResourceListPool *)&v7 dealloc];
}

- (int)availableCount
{
  return self->_priv.count;
}

@end