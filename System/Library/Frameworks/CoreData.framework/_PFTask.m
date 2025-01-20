@interface _PFTask
+ (uint64_t)getNumActiveProcessors;
+ (uint64_t)getPhysicalMemory;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFTask)initWithFunction:(void *)a3 withArgument:(void *)a4 andPriority:(int)a5;
- (_PFTask)retain;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)release;
@end

@implementation _PFTask

- (void)release
{
  if ((int)atomic_fetch_add_explicit(&self->_cd_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    atomic_fetch_add_explicit(&self->_cd_rc, 0x20000000u, memory_order_relaxed);
    [(_PFTask *)self dealloc];
  }
}

- (_PFTask)initWithFunction:(void *)a3 withArgument:(void *)a4 andPriority:(int)a5
{
  v8 = self;
  pthread_mutex_init(&self->lock, 0);
  pthread_cond_init(&v8->condition, 0);
  v8->isFinishedFlag = 0;
  v8->_task = a3;
  v8->arguments = a4;
  CFRetain(v8);
  __dmb(0xBu);
  global_queue = dispatch_get_global_queue(a5, 2uLL);
  if (global_queue)
  {
    dispatch_async_f(global_queue, v8, (dispatch_function_t)minion_duties2);
  }
  else
  {
    CFRelease(v8);

    return 0;
  }
  return v8;
}

- (_PFTask)retain
{
  return self;
}

- (void)dealloc
{
  pthread_cond_destroy(&self->condition);
  pthread_mutex_destroy(&self->lock);
  arguments = self->arguments;
  if (arguments)
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v4 = malloc_default_zone();
      arguments = self->arguments;
    }
    malloc_zone_free(v4, arguments);
    self->arguments = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PFTask;
  [(_PFTask *)&v5 dealloc];
}

+ (uint64_t)getNumActiveProcessors
{
  self;
  unsigned int v2 = 0;
  size_t v1 = 4;
  sysctlbyname("hw.activecpu", &v2, &v1, 0, 0);
  return v2;
}

+ (uint64_t)getPhysicalMemory
{
  self;
  size_t v1 = 8;
  uint64_t v2 = 0;
  if (sysctlbyname("hw.memsize", &v2, &v1, 0, 0)) {
    return 0;
  }
  else {
    return v2;
  }
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

@end