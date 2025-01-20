@interface CKDProxyPCSManager
- (BOOL)respondsToSelector:(SEL)a3;
- (CKDProxyPCSManager)init;
- (Class)PCSManagerSuperclass;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setPCSManagerSuperclass:(Class)a3;
- (void)weAreNeverEverEverUsingEncryption:(id)a3;
@end

@implementation CKDProxyPCSManager

- (CKDProxyPCSManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKDProxyPCSManager;
  v4 = [(CKDProxyPCSManager *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_superclass(CKDPCSManager, v2, v3);
    Class PCSManagerSuperclass = v4->_PCSManagerSuperclass;
    v4->_Class PCSManagerSuperclass = (Class)v5;
  }
  return v4;
}

- (void)weAreNeverEverEverUsingEncryption:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  objc_msgSend_currentHandler(v5, v7, v8);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (const char *)objc_msgSend_selector(v6, v9, v10);

  v12 = NSStringFromSelector(v11);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v13, (uint64_t)a2, self, @"CKDProxyPCSManager.m", 29, @"-[CKDPCSManager %@] was called in a container that should never ever ever use PCS.", v12);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (objc_msgSend_instancesRespondToSelector_(CKDPCSManager, a2, (uint64_t)a3)
    && (objc_msgSend_instancesRespondToSelector_(MEMORY[0x1E4FBA8A8], v4, (uint64_t)a3) & 1) == 0)
  {
    id v6 = objc_msgSend_instanceMethodSignatureForSelector_(CKDPCSManager, v5, (uint64_t)a3);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_msgSend_instancesRespondToSelector_(CKDPCSManager, a2, (uint64_t)a3)
      && !objc_msgSend_instancesRespondToSelector_(MEMORY[0x1E4FBA8A8], v4, (uint64_t)a3);
}

- (void)forwardInvocation:(id)a3
{
}

- (Class)PCSManagerSuperclass
{
  return self->_PCSManagerSuperclass;
}

- (void)setPCSManagerSuperclass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end