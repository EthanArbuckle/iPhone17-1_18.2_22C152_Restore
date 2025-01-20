@interface IOGPUMetalResourcePool
- (BOOL)updateResourcePurgeability;
- (IOGPUMetalResourcePool)initWithDevice:(id)a3 resourceClass:(Class)a4 resourceArgs:(const IOGPUNewResourceArgs *)a5 resourceArgsSize:(unsigned int)a6 options:(id)a7;
- (IOGPUNewResourceArgs)resourceArgs;
- (int)availableCount;
- (unsigned)resourceArgsSize;
- (void)dealloc;
- (void)purge;
- (void)purgeWithLock;
- (void)setResourceArgs:(const IOGPUNewResourceArgs *)a3 resourceArgsSize:(unsigned int)a4;
@end

@implementation IOGPUMetalResourcePool

- (void)purge
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  [(IOGPUMetalResourcePool *)self purgeWithLock];
  os_unfair_lock_unlock(p_lock);
}

- (void)purgeWithLock
{
  tqh_first = self->_priv.volatileQueue.tqh_first;
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
        self->_priv.volatileQueue.tqh_last = tqe_prev;
      }
      id *tqe_prev = v6;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  v7 = self->_priv.nonvolatileQueue.tqh_first;
  if (v7)
  {
    do
    {
      v9 = v7->_priv.entry.tqe_next;
      v8 = v7->_priv.entry.tqe_prev;
      if (v9)
      {
        v9->_priv.entry.tqe_prev = v8;
        v10 = v7->_priv.entry.tqe_next;
        v8 = v7->_priv.entry.tqe_prev;
      }
      else
      {
        v10 = 0;
        self->_priv.nonvolatileQueue.tqh_last = v8;
      }
      id *v8 = v10;
      --self->_priv.count;

      v7 = v9;
    }
    while (v9);
  }
}

- (BOOL)updateResourcePurgeability
{
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  if (self->_priv.nonvolatileQueue.tqh_first)
  {
    uint64_t v4 = mach_absolute_time();
    v5 = (IOGPUMetalPooledResource *)**((void **)self->_priv.nonvolatileQueue.tqh_last + 1);
    if (v5)
    {
      p_priv = &self->_priv;
      uint64_t v7 = v4 - self->age_to_purge;
      do
      {
        if (v5->_priv.time_added >= v7) {
          break;
        }
        v8 = (IOGPUMetalPooledResource *)**((void **)v5->_priv.entry.tqe_prev + 1);
        [(IOGPUMetalResource *)v5 setPurgeableState:3];
        tqe_next = v5->_priv.entry.tqe_next;
        tqe_prev = v5->_priv.entry.tqe_prev;
        if (tqe_next)
        {
          tqe_next->_priv.entry.tqe_prev = tqe_prev;
          v11 = v5->_priv.entry.tqe_next;
          tqe_prev = v5->_priv.entry.tqe_prev;
        }
        else
        {
          v11 = 0;
          self->_priv.nonvolatileQueue.tqh_last = tqe_prev;
        }
        id *tqe_prev = v11;
        tqh_first = p_priv->volatileQueue.tqh_first;
        v5->_priv.entry.tqe_next = p_priv->volatileQueue.tqh_first;
        p_tqe_next = (id *)&v5->_priv.entry.tqe_next;
        if (tqh_first) {
          tqh_first->_priv.entry.tqe_prev = p_tqe_next;
        }
        else {
          self->_priv.volatileQueue.tqh_last = p_tqe_next;
        }
        p_priv->volatileQueue.tqh_first = v5;
        v5->_priv.entry.tqe_prev = (id *)&p_priv->volatileQueue.tqh_first;
        v5 = v8;
      }
      while (v8);
    }
    os_unfair_lock_unlock(p_lock);
    return self->_priv.nonvolatileQueue.tqh_first != 0;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
}

- (IOGPUMetalResourcePool)initWithDevice:(id)a3 resourceClass:(Class)a4 resourceArgs:(const IOGPUNewResourceArgs *)a5 resourceArgsSize:(unsigned int)a6 options:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)IOGPUMetalResourcePool;
  v11 = [(IOGPUMetalResourcePool *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_priv.volatileQueue.tqh_first = 0;
    v11->_priv.nonvolatileQueue.tqh_first = 0;
    v11->_priv.volatileQueue.tqh_last = (id *)&v11->_priv.volatileQueue.tqh_first;
    v11->_priv.nonvolatileQueue.tqh_last = (id *)&v11->_priv.nonvolatileQueue.tqh_first;
    *(void *)&v11->_priv.lock._os_unfair_lock_opaque = 0;
    v11->_resourceClass = a4;
    v11->_device = (MTLDevice *)a3;
    if (([(objc_class *)a4 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
      -[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:]();
    }
    if (a6 <= 0x57) {
      -[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:]();
    }
    v12->_resourceArgsSize = a6;
    v13 = (IOGPUNewResourceArgs *)malloc_type_malloc(a6, 0x765E4F4CuLL);
    v12->_resourceArgs = v13;
    memcpy(v13, a5, v12->_resourceArgsSize);
    v12->_resourceArgs->var0.var10 |= 0x4000u;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    v12->age_to_purge = 1000000000 * (unint64_t)info.denom / info.numer;
    v12->generation = 0;
  }
  return v12;
}

- (void)setResourceArgs:(const IOGPUNewResourceArgs *)a3 resourceArgsSize:(unsigned int)a4
{
  if (a4 <= 0x57) {
    -[IOGPUMetalResourcePool setResourceArgs:resourceArgsSize:]();
  }
  size_t v7 = a4;
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  [(IOGPUMetalResourcePool *)self purgeWithLock];
  free(self->_resourceArgs);
  self->_resourceArgsSize = a4;
  v9 = (IOGPUNewResourceArgs *)malloc_type_malloc(v7, 0x51A1A2A9uLL);
  self->_resourceArgs = v9;
  memcpy(v9, a3, self->_resourceArgsSize);
  self->_resourceArgs->var0.var10 |= 0x4000u;
  ++self->generation;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  [(IOGPUMetalResourcePool *)self purgeWithLock];
  free(self->_resourceArgs);
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalResourcePool;
  [(IOGPUMetalResourcePool *)&v3 dealloc];
}

- (int)availableCount
{
  return self->_priv.count;
}

- (IOGPUNewResourceArgs)resourceArgs
{
  return self->_resourceArgs;
}

- (unsigned)resourceArgsSize
{
  return self->_resourceArgsSize;
}

- (void)initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:]", "IOGPUMetalResourcePool.m", 41, "resourceArgsSize >= sizeof(*resourceArgs)");
}

- (void)initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:.cold.2()
{
}

- (void)setResourceArgs:resourceArgsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResourcePool setResourceArgs:resourceArgsSize:]", "IOGPUMetalResourcePool.m", 65, "resourceArgsSize >= sizeof(*resourceArgs)");
}

@end