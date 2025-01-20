@interface IOGPUMetalDeviceShmemPool
- (IOGPUMetalDeviceShmemPool)initWithDevice:(id)a3 resourceClass:(Class)a4 shmemSize:(unsigned int)a5 shmemType:(int)a6 options:(id)a7;
- (int)availableCount;
- (unsigned)shmemSize;
- (void)dealloc;
- (void)prune;
- (void)purge;
- (void)setShmemSize:(unsigned int)a3;
@end

@implementation IOGPUMetalDeviceShmemPool

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
        v7 = tqh_first->_priv.entry.tqe_next;
        tqe_prev = tqh_first->_priv.entry.tqe_prev;
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

- (IOGPUMetalDeviceShmemPool)initWithDevice:(id)a3 resourceClass:(Class)a4 shmemSize:(unsigned int)a5 shmemType:(int)a6 options:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalDeviceShmemPool;
  v11 = [(IOGPUMetalDeviceShmemPool *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_priv.queue.tqh_first = 0;
    v11->_priv.queue.tqh_last = (id *)&v11->_priv.queue.tqh_first;
    *(void *)&v11->_priv.lock._os_unfair_lock_opaque = 0;
    v11->_priv.shmemClass = a4;
    v11->_priv.device = (IOGPUMetalDevice *)a3;
    v11->_priv.shmemSize = a5;
    v11->_priv.shmemType = a6;
    if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
      -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]();
    }
  }
  return v12;
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
  v7.super_class = (Class)IOGPUMetalDeviceShmemPool;
  [(IOGPUMetalDeviceShmemPool *)&v7 dealloc];
}

- (int)availableCount
{
  return self->_priv.count;
}

- (void)prune
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  int v4 = self->_priv.device->_numCommandBuffers + 2;
  while (self->_priv.count > v4)
  {
    v5 = (void *)**((void **)self->_priv.queue.tqh_last + 1);
    uint64_t v7 = v5[2];
    v6 = (id *)v5[3];
    if (v7)
    {
      *(void *)(v7 + 24) = v6;
      v8 = (void *)v5[2];
      v6 = (id *)v5[3];
    }
    else
    {
      v8 = 0;
      self->_priv.queue.tqh_last = v6;
    }
    id *v6 = v8;
    --self->_priv.count;
    v5[2] = 0;
    v5[3] = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)initWithDevice:resourceClass:shmemSize:shmemType:options:.cold.1()
{
}

@end