@interface IDSXPCConnectionRemoteObjectPromise
- (BOOL)respondsToSelector:(SEL)a3;
- (IDSXPCConnectionRemoteObjectPromise)initWithInterface:(id)a3 queue:(id)a4;
- (NSMutableArray)pendingInvocations;
- (NSXPCInterface)interface;
- (OS_dispatch_queue)queue;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)_assertVoidReturnValueInInvocation:(id)a3;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)fulfillWithRemoteObject:(id)a3;
- (void)setInterface:(id)a3;
- (void)setPendingInvocations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation IDSXPCConnectionRemoteObjectPromise

- (IDSXPCConnectionRemoteObjectPromise)initWithInterface:(id)a3 queue:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  v9 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnectionRemoteObjectPromise {pointer: %p}", buf, 0xCu);
  }

  dispatch_assert_queue_V2(v8);
  v13.receiver = self;
  v13.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  v10 = [(IDSXPCConnectionRemoteObjectPromise *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_interface, a3);
    objc_storeStrong((id *)&v11->_queue, a4);
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id target = self->_target;
    *(_DWORD *)buf = 138543618;
    id v7 = target;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnectionRemoteObjectPromise {target: %{public}@, pointer: %p}", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  [(IDSXPCConnectionRemoteObjectPromise *)&v5 dealloc];
}

- (void)fulfillWithRemoteObject:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(IDSXPCConnectionRemoteObjectPromise *)self target];

  if (v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"IDSXPCConnectionRemoteObjectPromise.m" lineNumber:59 description:@"IDSXPCConnectionRemoteObjectPromise can only be fulfilled once"];
  }
  [(IDSXPCConnectionRemoteObjectPromise *)self setTarget:v5];
  if ([(NSMutableArray *)self->_pendingInvocations count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v8 = self->_pendingInvocations;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          v14 = [(IDSXPCConnectionRemoteObjectPromise *)self target];
          [v13 invokeWithTarget:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    pendingInvocations = self->_pendingInvocations;
    self->_pendingInvocations = 0;
  }
}

- (void)failWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_pendingInvocations count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pendingInvocations, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = self->_pendingInvocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = NSStringFromSelector((SEL)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "selector", (void)v15));
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [MEMORY[0x1E4F6B460] xpc];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2EC04((uint64_t)v5, (uint64_t)v4, v12);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6B460] xpc];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v4;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Failing xpcRemoteObjectPromise with no pending invocations {error: %{public}@}", buf, 0xCu);
    }
  }

  objc_super v13 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v13);

  pendingInvocations = self->_pendingInvocations;
  self->_pendingInvocations = 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v5 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(IDSXPCConnectionRemoteObjectPromise *)self interface];
  uint64_t v7 = [v6 _respondsToRemoteSelector:a3];

  if (v7 == 2) {
    return 0;
  }
  if (v7 != 1) {
    return 1;
  }
  v9.receiver = self;
  v9.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  return [(IDSXPCConnectionRemoteObjectPromise *)&v9 respondsToSelector:a3];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(IDSXPCConnectionRemoteObjectPromise *)self interface];
  uint64_t v7 = [v6 _methodSignatureForRemoteSelector:a3];

  if (!v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
    uint64_t v7 = [(IDSXPCConnectionRemoteObjectPromise *)&v9 methodSignatureForSelector:a3];
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v4);

  [(IDSXPCConnectionRemoteObjectPromise *)self _assertVoidReturnValueInInvocation:v7];
  id v5 = [(IDSXPCConnectionRemoteObjectPromise *)self target];

  if (v5)
  {
    v6 = [(IDSXPCConnectionRemoteObjectPromise *)self target];
    [v7 invokeWithTarget:v6];
  }
  else
  {
    [v7 retainArguments];
    v6 = [(IDSXPCConnectionRemoteObjectPromise *)self pendingInvocations];
    [v6 addObject:v7];
  }
}

- (NSMutableArray)pendingInvocations
{
  v3 = [(IDSXPCConnectionRemoteObjectPromise *)self queue];
  dispatch_assert_queue_V2(v3);

  pendingInvocations = self->_pendingInvocations;
  if (!pendingInvocations)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = self->_pendingInvocations;
    self->_pendingInvocations = v5;

    pendingInvocations = self->_pendingInvocations;
  }

  return pendingInvocations;
}

- (void)_assertVoidReturnValueInInvocation:(id)a3
{
  id v5 = a3;
  id v3 = [v5 methodSignature];
  if (strncmp((const char *)[v3 methodReturnType], "v", objc_msgSend(v3, "methodReturnLength")))
  {
    id v4 = NSStringFromSelector((SEL)[v5 selector]);
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"XPC methods must have void return values {selector: %@}", v4 format];
  }
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void)setPendingInvocations:(id)a3
{
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_pendingInvocations, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end