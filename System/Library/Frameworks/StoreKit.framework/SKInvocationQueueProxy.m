@interface SKInvocationQueueProxy
- (SKInvocationQueueProxy)initWithProtocol:(id)a3;
- (id)invocationTarget;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setInvocationTarget:(id)a3;
@end

@implementation SKInvocationQueueProxy

- (SKInvocationQueueProxy)initWithProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKInvocationQueueProxy;
  v6 = [(SKInvocationQueueProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_protocol, a3);
  }

  return v7;
}

- (void)setInvocationTarget:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_invocationTarget = &self->_invocationTarget;
  if (self->_invocationTarget != v5)
  {
    objc_storeStrong(&self->_invocationTarget, a3);
    if (*p_invocationTarget)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = self->_invocationQueue;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "invokeWithTarget:", *p_invocationTarget, (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }

      [(NSMutableArray *)self->_invocationQueue removeAllObjects];
    }
  }
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_invocationTarget)
  {
    objc_msgSend(v4, "invokeWithTarget:");
  }
  else
  {
    if (!self->_invocationQueue)
    {
      id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      invocationQueue = self->_invocationQueue;
      self->_invocationQueue = v5;

      id v4 = v7;
    }
    [v4 retainArguments];
    [(NSMutableArray *)self->_invocationQueue addObject:v7];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKInvocationQueueProxy;
  id v5 = -[SKInvocationQueueProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
    if (MethodDescription.types)
    {
      id v5 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)invocationTarget
{
  return self->_invocationTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_invocationTarget, 0);

  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

@end