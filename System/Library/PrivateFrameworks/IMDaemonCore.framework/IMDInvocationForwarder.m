@interface IMDInvocationForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (IMDInvocationForwarder)initWithTargets:(id)a3;
- (NSLock)_lock;
- (NSMutableArray)_targets;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addTarget:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)removeTarget:(id)a3;
- (void)set_lock:(id)a3;
- (void)set_targets:(id)a3;
@end

@implementation IMDInvocationForwarder

- (IMDInvocationForwarder)initWithTargets:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDInvocationForwarder;
  v4 = [(IMDInvocationForwarder *)&v6 init];
  if (v4)
  {
    v4->_targets = (NSMutableArray *)[a3 mutableCopy];
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  }
  return v4;
}

- (void)dealloc
{
  [(NSLock *)self->_lock lock];

  [(NSLock *)self->_lock unlock];
  v3.receiver = self;
  v3.super_class = (Class)IMDInvocationForwarder;
  [(IMDInvocationForwarder *)&v3 dealloc];
}

- (void)addTarget:(id)a3
{
  if (a3)
  {
    [(NSLock *)self->_lock lock];
    if ([(NSMutableArray *)self->_targets containsObjectIdenticalTo:a3])
    {
      targets = self->_targets;
      if (!targets)
      {
        targets = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        self->_targets = targets;
      }
      [(NSMutableArray *)targets addObject:a3];
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)removeTarget:(id)a3
{
  if (a3)
  {
    [(NSLock *)self->_lock lock];
    [(NSMutableArray *)self->_targets removeObjectIdenticalTo:a3];
    if (![(NSMutableArray *)self->_targets count])
    {

      self->_targets = 0;
    }
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = (id)objc_msgSend((id)-[NSMutableArray __imFirstObject](self->_targets, "__imFirstObject"), "methodSignatureForSelector:", a3);
  [(NSLock *)self->_lock unlock];

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  [(NSLock *)self->_lock lock];
  v7.receiver = self;
  v7.super_class = (Class)IMDInvocationForwarder;
  if ([(IMDInvocationForwarder *)&v7 respondsToSelector:a3])
  {
    char v5 = 1;
  }
  else
  {
    [(NSMutableArray *)self->_targets __imFirstObject];
    char v5 = objc_opt_respondsToSelector();
  }
  [(NSLock *)self->_lock unlock];
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  targets = self->_targets;
  uint64_t v6 = [(NSMutableArray *)targets countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(targets);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E016A370]();
        [a3 invokeWithTarget:v9];
      }
      uint64_t v6 = [(NSMutableArray *)targets countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(NSLock *)self->_lock unlock];
}

- (NSMutableArray)_targets
{
  return self->_targets;
}

- (void)set_targets:(id)a3
{
}

- (NSLock)_lock
{
  return self->_lock;
}

- (void)set_lock:(id)a3
{
}

@end