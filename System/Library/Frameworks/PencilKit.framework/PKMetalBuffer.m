@interface PKMetalBuffer
- (BOOL)isPurged;
- (BOOL)lock;
- (void)initWithDevice:(uint64_t)a3 length:(uint64_t)a4 bytes:(uint64_t)a5 options:;
- (void)unlock;
@end

@implementation PKMetalBuffer

- (void)initWithDevice:(uint64_t)a3 length:(uint64_t)a4 bytes:(uint64_t)a5 options:
{
  id v9 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKMetalBuffer;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      if (a4) {
        uint64_t v10 = [v9 newBufferWithBytes:a4 length:a3 options:a5];
      }
      else {
        uint64_t v10 = [v9 newBufferWithLength:a3 options:a5];
      }
      v11 = (void *)a1[3];
      a1[3] = v10;
    }
  }

  return a1;
}

- (BOOL)lock
{
  if (atomic_load((unsigned int *)&self->_isPurged)) {
    return 0;
  }
  v5 = self;
  objc_sync_enter(v5);
  unint64_t lockCount = v5->_lockCount;
  v5->_unint64_t lockCount = lockCount + 1;
  if (lockCount)
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 1;
    if ([(MTLBuffer *)v5->_metalBuffer setPurgeableState:2] == 4)
    {
      atomic_store(1u, (unsigned int *)&self->_isPurged);
      BOOL v3 = 0;
    }
  }
  objc_sync_exit(v5);

  return v3;
}

- (void)unlock
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj->_lockCount - 1;
  obj->_unint64_t lockCount = v2;
  if (!v2) {
    [(MTLBuffer *)obj->_metalBuffer setPurgeableState:3];
  }
  objc_sync_exit(obj);
}

- (BOOL)isPurged
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_isPurged);
  return v2 != 0;
}

- (void).cxx_destruct
{
}

@end