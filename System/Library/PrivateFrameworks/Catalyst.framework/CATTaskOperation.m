@interface CATTaskOperation
+ (BOOL)isCancelable;
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)new;
- (BOOL)canSendNotificationWithName:(id)a3 userInfo:(id)a4;
- (CATTaskOperation)init;
- (CATTaskOperation)initWithRequest:(id)a3;
- (CATTaskOperationNotificationDelegate)notificationDelegate;
- (CATTaskRequest)request;
- (NSUUID)remoteUUID;
- (id)cat_assertions;
- (void)cat_addAssertion:(id)a3;
- (void)main;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)processMessage:(id)a3;
- (void)setNotificationDelegate:(id)a3;
- (void)setRemoteUUID:(id)a3;
@end

@implementation CATTaskOperation

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATTaskOperation.m", 31, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATTaskOperation)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATTaskOperation.m", 38, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (CATTaskOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATTaskOperation;
  v6 = [(CATOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (a4 && (isKindOfClass & 1) == 0)
  {
    CATErrorWithCodeAndUserInfo(2, &unk_26C4B5E80);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return isKindOfClass & 1;
}

+ (BOOL)isCancelable
{
  return 1;
}

- (void)main
{
}

- (BOOL)canSendNotificationWithName:(id)a3 userInfo:(id)a4
{
  v4 = [(CATTaskOperation *)self request];
  char v5 = [v4 handlesNotifications];

  return v5;
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CATTaskOperation *)self canSendNotificationWithName:v6 userInfo:v7])
  {
    v8 = [(CATTaskOperation *)self notificationDelegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_5:

      goto LABEL_10;
    }
    BOOL v9 = [(CATTaskOperation *)self canSendNotificationWithName:v6 userInfo:v7];

    if (v9)
    {
      v8 = [(CATTaskOperation *)self notificationDelegate];
      [v8 taskOperation:self didPostNotificationWithName:v6 userInfo:v7];
      goto LABEL_5;
    }
  }
  else
  {
    if (_CATLogGeneral_onceToken_13 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_13, &__block_literal_global_19);
    }
    v10 = _CATLogGeneral_logObj_13;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_13, OS_LOG_TYPE_ERROR)) {
      -[CATRemoteTaskOperation processNotificationWithName:userInfo:]((uint64_t)self, (uint64_t)v6, v10);
    }
  }
LABEL_10:
}

- (void)processMessage:(id)a3
{
  id v4 = a3;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [(CATTaskOperation *)self request];
    int v8 = [v7 handlesNotifications];

    if (v8)
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__CATTaskOperation_processMessage___block_invoke;
      block[3] = &unk_2641DC0C0;
      objc_copyWeak(&v12, &location);
      id v11 = v6;
      id v9 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
    }
  }
}

void __35__CATTaskOperation_processMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = [*(id *)(a1 + 32) name];
    id v4 = [*(id *)(a1 + 32) userInfo];
    [v2 postNotificationName:v3 object:WeakRetained userInfo:v4];
  }
}

- (CATTaskRequest)request
{
  return self->_request;
}

- (CATTaskOperationNotificationDelegate)notificationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationDelegate);

  return (CATTaskOperationNotificationDelegate *)WeakRetained;
}

- (void)setNotificationDelegate:(id)a3
{
}

- (NSUUID)remoteUUID
{
  return self->_remoteUUID;
}

- (void)setRemoteUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUUID, 0);
  objc_destroyWeak((id *)&self->_notificationDelegate);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)cat_addAssertion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    char v5 = objc_getAssociatedObject(self, "cat_assertions");
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    id value = v7;

    [value addObject:v4];
    objc_setAssociatedObject(self, "cat_assertions", value, (void *)0x301);
  }
}

- (id)cat_assertions
{
  v2 = objc_getAssociatedObject(self, "cat_assertions");
  v3 = (void *)[v2 copy];

  return v3;
}

@end