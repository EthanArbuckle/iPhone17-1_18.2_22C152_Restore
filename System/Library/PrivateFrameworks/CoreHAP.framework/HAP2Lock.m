@interface HAP2Lock
+ (id)lockWithName:(id)a3;
+ (id)new;
- (HAP2Lock)init;
- (HAP2Lock)initWithLock:(id)a3 name:(id)a4;
- (NSLocking)internalLock;
- (NSString)name;
- (void)_performBlock:(id)a3 allowRecursive:(BOOL)a4;
- (void)performBlock:(id)a3;
@end

@implementation HAP2Lock

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HAP2Lock *)self internalLock];
  [v5 lock];

  [(HAP2Lock *)self _performBlock:v4 allowRecursive:0];
  id v6 = [(HAP2Lock *)self internalLock];
  [v6 unlock];
}

- (NSLocking)internalLock
{
  return self->_internalLock;
}

- (void)_performBlock:(id)a3 allowRecursive:(BOOL)a4
{
  p_lockCount = &self->_lockCount;
  atomic_fetch_add((atomic_ullong *volatile)&self->_lockCount, 1uLL);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  atomic_fetch_add((atomic_ullong *volatile)p_lockCount, 0xFFFFFFFFFFFFFFFFLL);
}

- (void).cxx_destruct
{
}

- (HAP2Lock)initWithLock:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2Lock;
  v9 = [(HAP2Lock *)&v11 init];
  if (v9)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 setName:v8];
    }
    objc_storeStrong((id *)&v9->_internalLock, a3);
    atomic_store(0, &v9->_lockCount);
  }

  return v9;
}

- (NSString)name
{
  v3 = [(HAP2Lock *)self internalLock];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HAP2Lock *)self internalLock];
    id v6 = [v5 name];
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (HAP2Lock)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  char v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)lockWithName:(id)a3
{
  id v3 = a3;
  char v4 = objc_opt_new();
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLock:v4 name:v3];

  return v5;
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  char v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end