@interface NSAutoreleasePool
+ (BOOL)autoreleasePoolExists;
+ (NSAutoreleasePool)allocWithZone:(_NSZone *)a3;
+ (unint64_t)autoreleasedObjectCount;
+ (unint64_t)poolCountHighWaterMark;
+ (unint64_t)poolCountHighWaterResolution;
+ (unint64_t)topAutoreleasePoolCount;
+ (unint64_t)totalAutoreleasedObjects;
+ (void)addObject:(id)anObject;
- (NSAutoreleasePool)autorelease;
- (NSAutoreleasePool)init;
- (NSAutoreleasePool)initWithCapacity:(unint64_t)a3;
- (NSAutoreleasePool)retain;
- (unint64_t)retainCount;
- (void)addObject:(id)anObject;
- (void)dealloc;
- (void)drain;
- (void)release;
@end

@implementation NSAutoreleasePool

+ (NSAutoreleasePool)allocWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_NSDoAPCache)
  {
    uint64_t v3 = 0;
    while (1)
    {
      v4 = (NSAutoreleasePool *)_NSAPCache[v3];
      if (v4)
      {
        uint64_t v5 = _NSAPCache[v3];
        atomic_compare_exchange_strong(&_NSAPCache[v3], (unint64_t *)&v5, 0);
        if ((NSAutoreleasePool *)v5 == v4) {
          break;
        }
      }
      if (++v3 == 4) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NSAutoreleasePool;
    return (NSAutoreleasePool *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
  return v4;
}

- (NSAutoreleasePool)init
{
  self->_token = (void *)_CFAutoreleasePoolPush();
  self->_reserved3 = 0;
  self->_reserved2 = 0;
  self->_reserved = 0;
  return self;
}

- (void)release
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been released, do not drain it (double release).", v4);
  }
  if (self->_reserved3)
  {
    uint64_t v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been drained, do not release it (double release).", v5);
  }
  token = self->_token;
  self->_reserved2 = (void *)-1;
  self->_token = 0;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = _NSAPCache[v7];
        if (!v8)
        {
          atomic_compare_exchange_strong(&_NSAPCache[v7], (unint64_t *)&v8, (unint64_t)self);
          if (!v8) {
            break;
          }
        }
        if (++v7 == 4) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v9.receiver = self;
      v9.super_class = (Class)NSAutoreleasePool;
      [(NSAutoreleasePool *)&v9 dealloc];
    }
  }
}

- (void)drain
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been released, do not drain it (double release).", v4);
  }
  if (self->_reserved3)
  {
    uint64_t v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been drained, do not release it (double release).", v5);
  }
  token = self->_token;
  self->_token = 0;
  self->_reserved3 = (void *)-1;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = _NSAPCache[v7];
        if (!v8)
        {
          atomic_compare_exchange_strong(&_NSAPCache[v7], (unint64_t *)&v8, (unint64_t)self);
          if (!v8) {
            break;
          }
        }
        if (++v7 == 4) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v9.receiver = self;
      v9.super_class = (Class)NSAutoreleasePool;
      [(NSAutoreleasePool *)&v9 dealloc];
    }
  }
}

+ (void)addObject:(id)anObject
{
}

- (NSAutoreleasePool)initWithCapacity:(unint64_t)a3
{
  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)@"%@: Do not use this init method.", v4);

  return [(NSAutoreleasePool *)self init];
}

- (void)addObject:(id)anObject
{
  if (((atomic_fetch_add(&addObject__logCount, 1u) + 1) & 0xF) == 1)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: Do not use this instance method on specific pools -- just use -autorelease instead.", v4);
  }
  if (self->_token)
  {
    _CFAutoreleasePoolAddObject();
  }
}

- (NSAutoreleasePool)retain
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Cannot retain an autorelease pool", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (unint64_t)retainCount
{
  return 1;
}

- (NSAutoreleasePool)autorelease
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Cannot autorelease an autorelease pool", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v2 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)@"%@: WARNING: Do not call this method directly.\n", v2);
}

+ (unint64_t)autoreleasedObjectCount
{
  return 0;
}

+ (unint64_t)topAutoreleasePoolCount
{
  return 0;
}

+ (BOOL)autoreleasePoolExists
{
  return 0;
}

+ (unint64_t)poolCountHighWaterMark
{
  return 0;
}

+ (unint64_t)poolCountHighWaterResolution
{
  return 0;
}

+ (unint64_t)totalAutoreleasedObjects
{
  return 0;
}

@end