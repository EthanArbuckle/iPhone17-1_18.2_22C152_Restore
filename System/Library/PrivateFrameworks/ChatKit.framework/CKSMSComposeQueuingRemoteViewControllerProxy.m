@interface CKSMSComposeQueuingRemoteViewControllerProxy
- (CKSMSCompose)serviceViewControllerProxy;
- (CKSMSComposeQueuingRemoteViewControllerProxy)init;
- (NSMutableArray)queuedInvocations;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)setQueuedInvocations:(id)a3;
- (void)setServiceViewControllerProxy:(id)a3;
@end

@implementation CKSMSComposeQueuingRemoteViewControllerProxy

- (CKSMSComposeQueuingRemoteViewControllerProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  v2 = [(CKSMSComposeQueuingRemoteViewControllerProxy *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [(CKSMSComposeQueuingRemoteViewControllerProxy *)v2 setQueuedInvocations:v3];
  }
  return v2;
}

- (void)dealloc
{
  [(CKSMSComposeQueuingRemoteViewControllerProxy *)self setServiceViewControllerProxy:0];
  [(CKSMSComposeQueuingRemoteViewControllerProxy *)self setQueuedInvocations:0];
  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  [(CKSMSComposeQueuingRemoteViewControllerProxy *)&v3 dealloc];
}

- (void)setServiceViewControllerProxy:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (CKSMSCompose *)a3;
  p_serviceViewControllerProxy = &self->_serviceViewControllerProxy;
  if (self->_serviceViewControllerProxy != v5)
  {
    objc_storeStrong((id *)&self->_serviceViewControllerProxy, a3);
    if (*p_serviceViewControllerProxy)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v7 = [(CKSMSComposeQueuingRemoteViewControllerProxy *)self queuedInvocations];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v11++) invokeWithTarget:*p_serviceViewControllerProxy];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      v12 = [(CKSMSComposeQueuingRemoteViewControllerProxy *)self queuedInvocations];
      [v12 removeAllObjects];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKSMSComposeQueuingRemoteViewControllerProxy;
  v4 = -[CKSMSComposeQueuingRemoteViewControllerProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v4)
  {
    objc_super v5 = &unk_1EDFAA818;
    objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)v5, a3, 1, 1);
    if (MethodDescription.types)
    {
      v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  serviceViewControllerProxy = self->_serviceViewControllerProxy;
  id v5 = a3;
  id v6 = v5;
  if (serviceViewControllerProxy)
  {
    [v5 invokeWithTarget:serviceViewControllerProxy];
  }
  else
  {
    [v5 retainArguments];
    [(NSMutableArray *)self->_queuedInvocations addObject:v6];
  }
}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
}

- (CKSMSCompose)serviceViewControllerProxy
{
  return self->_serviceViewControllerProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceViewControllerProxy, 0);

  objc_storeStrong((id *)&self->_queuedInvocations, 0);
}

@end