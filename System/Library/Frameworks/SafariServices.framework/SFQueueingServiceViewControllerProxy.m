@interface SFQueueingServiceViewControllerProxy
- (SFQueueingServiceViewControllerProxy)initWithProtocol:(id)a3;
- (SFQueueingServiceViewControllerProxyDelegate)delegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation SFQueueingServiceViewControllerProxy

- (SFQueueingServiceViewControllerProxy)initWithProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
  id v5 = a3;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  queuedInvocations = self->_queuedInvocations;
  self->_queuedInvocations = v6;

  return self;
}

- (void)setTarget:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_target = &self->_target;
  if (self->_target != v5)
  {
    objc_storeStrong(&self->_target, a3);
    if (*p_target)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = self->_queuedInvocations;
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
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "invokeWithTarget:", *p_target, (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }

      [(NSMutableArray *)self->_queuedInvocations removeAllObjects];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = self->_protocol;
  objc_method_description MethodDescription = protocol_getMethodDescription(v4, a3, 1, 1);
  if (MethodDescription.types)
  {
    v6 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v8 = a3;
  id v4 = [v8 methodSignature];
  id v5 = (unsigned __int8 *)[v4 methodReturnType];
  do
  {
    if (!v5)
    {

      goto LABEL_8;
    }
    int v6 = *v5++;
  }
  while (v6 != 118);

  if (self->_target)
  {
    objc_msgSend(v8, "invokeWithTarget:");
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained serviceProxyWillQueueInvocation:self];

    [v8 retainArguments];
    [(NSMutableArray *)self->_queuedInvocations addObject:v8];
  }
LABEL_8:
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)target
{
  return self->_target;
}

- (SFQueueingServiceViewControllerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFQueueingServiceViewControllerProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end