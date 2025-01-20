@interface MTLIOAccelDeviceShmemPool
- (MTLIOAccelDeviceShmemPool)initWithDevice:(id)a3 resourceClass:(Class)a4 shmemSize:(unsigned int)a5 options:(id)a6;
- (int)availableCount;
- (unsigned)shmemSize;
- (void)dealloc;
- (void)prune;
- (void)purge;
- (void)setShmemSize:(unsigned int)a3;
@end

@implementation MTLIOAccelDeviceShmemPool

- (MTLIOAccelDeviceShmemPool)initWithDevice:(id)a3 resourceClass:(Class)a4 shmemSize:(unsigned int)a5 options:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)MTLIOAccelDeviceShmemPool;
  result = [(MTLIOAccelDeviceShmemPool *)&v10 init];
  if (result)
  {
    result->_priv.queue.tqh_first = 0;
    result->_priv.queue.tqh_last = (id *)&result->_priv.queue.tqh_first;
    *(void *)&result->_priv.lock._os_unfair_lock_opaque = 0;
    result->_priv.shmemClass = a4;
    result->_priv.device = (MTLIOAccelDevice *)a3;
    result->_priv.shmemSize = a5;
  }
  return result;
}

- (void)dealloc
{
  tqh_first = self->_priv.queue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_priv.entry.tqe_next;
      tqe_prev = tqh_first->_priv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_priv.entry.tqe_prev = tqe_prev;
        v6 = tqh_first->_priv.entry.tqe_next;
        tqe_prev = tqh_first->_priv.entry.tqe_prev;
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
  self->_priv.device = 0;
  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelDeviceShmemPool;
  [(MTLIOAccelDeviceShmemPool *)&v7 dealloc];
}

- (int)availableCount
{
  return self->_priv.count;
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
      tqe_next = tqh_first->_priv.entry.tqe_next;
      tqe_prev = tqh_first->_priv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_priv.entry.tqe_prev = tqe_prev;
        objc_super v7 = tqh_first->_priv.entry.tqe_next;
        tqe_prev = tqh_first->_priv.entry.tqe_prev;
      }
      else
      {
        objc_super v7 = 0;
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

- (unsigned)shmemSize
{
  return self->_priv.shmemSize;
}

- (void)setShmemSize:(unsigned int)a3
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  if (self->_priv.shmemSize < a3)
  {
    self->_priv.shmemSize = a3;
    tqh_first = self->_priv.queue.tqh_first;
    if (tqh_first)
    {
      do
      {
        tqe_next = tqh_first->_priv.entry.tqe_next;
        if (tqh_first->_shmemSize < self->_priv.shmemSize)
        {
          tqe_prev = tqh_first->_priv.entry.tqe_prev;
          if (tqe_next)
          {
            tqe_next->_priv.entry.tqe_prev = tqe_prev;
            v9 = tqh_first->_priv.entry.tqe_next;
            tqe_prev = tqh_first->_priv.entry.tqe_prev;
          }
          else
          {
            v9 = 0;
            self->_priv.queue.tqh_last = tqe_prev;
          }
          id *tqe_prev = v9;
          --self->_priv.count;
          tqh_first->_priv.entry.tqe_next = 0;
          tqh_first->_priv.entry.tqe_prev = 0;
        }
        tqh_first = tqe_next;
      }
      while (tqe_next);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)prune
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  unsigned int v4 = atomic_load((unsigned int *)&self->_priv.device->_numCommandBuffers);
  int v5 = v4 + 2;
  while (self->_priv.count > v5)
  {
    v6 = (void *)**((void **)self->_priv.queue.tqh_last + 1);
    uint64_t v8 = v6[2];
    objc_super v7 = (id *)v6[3];
    if (v8)
    {
      *(void *)(v8 + 24) = v7;
      v9 = (void *)v6[2];
      objc_super v7 = (id *)v6[3];
    }
    else
    {
      v9 = 0;
      self->_priv.queue.tqh_last = v7;
    }
    *objc_super v7 = v9;
    --self->_priv.count;
    v6[2] = 0;
    v6[3] = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

@end