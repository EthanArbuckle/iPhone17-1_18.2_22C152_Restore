@interface CKDLogicalDeviceScopedStateManager
- (CKDLogicalDeviceContext)deviceContext;
- (CKDLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3;
- (void)addClouddThrottle:(id)a3;
- (void)allClouddThrottlesWithCompletionHandler:(id)a3;
- (void)clearAllClouddThrottles;
- (void)postClouddWalrusUpdateNotification;
@end

@implementation CKDLogicalDeviceScopedStateManager

- (CKDLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDLogicalDeviceScopedStateManager;
  v6 = [(CKDLogicalDeviceScopedStateManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceContext, a3);
  }

  return v7;
}

- (void)clearAllClouddThrottles
{
  objc_msgSend_deviceContext(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend_throttleManager(v8, v3, v4);
  objc_msgSend_resetThrottles(v5, v6, v7);
}

- (void)allClouddThrottlesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  objc_msgSend_deviceContext(self, v6, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_throttleManager(v14, v8, v9);
  v13 = objc_msgSend_allThrottles(v10, v11, v12);
  (*((void (**)(id, void *))a3 + 2))(v5, v13);
}

- (void)addClouddThrottle:(id)a3
{
  id v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_throttleManager(v11, v7, v8);
  objc_msgSend_addThrottle_(v9, v10, (uint64_t)v4);
}

- (void)postClouddWalrusUpdateNotification
{
  objc_msgSend_deviceContext(self, a2, v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend_accountDataSecurityObserver(v8, v3, v4);
  objc_msgSend_postClouddWalrusUpdateNotification(v5, v6, v7);
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void).cxx_destruct
{
}

@end