@interface _PFMutex
+ (void)initialize;
- (BOOL)tryLock;
- (_PFMutex)init;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation _PFMutex

- (_PFMutex)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PFMutex;
  v2 = [(_PFMutex *)&v6 init];
  v3 = v2;
  if (v2 && pthread_mutex_init(&v2->_lock, 0))
  {
    v5.receiver = v3;
    v5.super_class = (Class)_PFMutex;
    [(_PFMutex *)&v5 dealloc];
    return 0;
  }
  return v3;
}

- (void)lock
{
}

- (void)unlock
{
}

+ (void)initialize
{
  self;

  objc_opt_class();
}

- (void)dealloc
{
  if (pthread_mutex_destroy(&self->_lock) == 16)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"_PFMutex deallocated while in use"];
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v11.receiver);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: _PFMutex deallocated while in use", buf, 2u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_PFMutex;
  [(_PFMutex *)&v11 dealloc];
}

- (BOOL)tryLock
{
  return pthread_mutex_trylock(&self->_lock) == 0;
}

@end