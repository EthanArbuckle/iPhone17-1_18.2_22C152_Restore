@interface DTXRemoteInvocationReceipt
- (DTXRemoteInvocationReceipt)init;
- (void)_checkedAssign:(id)a3;
- (void)handleCompletion:(id)a3;
- (void)invokeCompletionWithReturnValue:(id)a3 error:(id)a4;
- (void)waitForFulfillment;
@end

@implementation DTXRemoteInvocationReceipt

- (DTXRemoteInvocationReceipt)init
{
  v3.receiver = self;
  v3.super_class = (Class)DTXRemoteInvocationReceipt;
  result = [(DTXRemoteInvocationReceipt *)&v3 init];
  if (result) {
    result->_guard._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)_checkedAssign:(id)a3
{
  id returnValue;
  id v5;
  id v6;
  void (**v7)(void, void, void);
  id v8;
  id v9;
  id completionHandler;
  char v11;
  void *v12;
  void (**v13)(void);
  id waiterChain;
  void (**v15)(void);
  uint64_t vars8;

  v15 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_guard);
  v15[2]();
  if (self->_completionHandler && (*((unsigned char *)self + 36) & 3) != 0)
  {
    if ((*((unsigned char *)self + 36) & 3) == 1) {
      returnValue = self->_returnValue;
    }
    else {
      returnValue = 0;
    }
    v6 = returnValue;
    if ((*((unsigned char *)self + 36) & 3) == 2) {
      v8 = self->_returnValue;
    }
    else {
      v8 = 0;
    }
    v5 = v8;
    v7 = (void (**)(void, void, void))MEMORY[0x230F36B10](self->_completionHandler);
    v9 = self->_returnValue;
    self->_returnValue = 0;

    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    if (v7) {
      v11 = 4;
    }
    else {
      v11 = 8;
    }
    *((unsigned char *)self + 36) = *((unsigned char *)self + 36) & 0xF3 | v11;
    os_unfair_lock_unlock(&self->_guard);
    if (v7)
    {
      v12 = (void *)MEMORY[0x230F368A0]();
      ((void (**)(void, id, id))v7)[2](v7, v6, v5);
      os_unfair_lock_lock(&self->_guard);
      *((unsigned char *)self + 36) = *((unsigned char *)self + 36) & 0xF3 | 8;
      v13 = (void (**)(void))MEMORY[0x230F36B10](self->_waiterChain);
      waiterChain = self->_waiterChain;
      self->_waiterChain = 0;

      os_unfair_lock_unlock(&self->_guard);
      if (v13) {
        v13[2](v13);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_guard);
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF37C2C;
  v7[3] = &unk_264883940;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  [self setValue:v6 forKey:@"v7"];
}

- (void)invokeCompletionWithReturnValue:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_22AF37D50;
  v11[3] = &unk_264883968;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  self = v10;
}

- (void)waitForFulfillment
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_22AF37EB4;
  id v8 = sub_22AF37EC4;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_22AF37ECC;
  v3[3] = &unk_2648839B8;
  v3[4] = self;
  v3[5] = &v4;
  [self setA2:v3];
  v2 = v5[5];
  if (v2) {
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v4, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waiterChain, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_returnValue, 0);
}

@end