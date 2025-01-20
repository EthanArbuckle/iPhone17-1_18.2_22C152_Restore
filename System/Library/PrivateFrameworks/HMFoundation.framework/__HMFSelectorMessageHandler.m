@interface __HMFSelectorMessageHandler
- (BOOL)invokeWithMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SEL)selector;
@end

@implementation __HMFSelectorMessageHandler

- (BOOL)isEqual:(id)a3
{
  v4 = (__HMFSelectorMessageHandler *)a3;
  if (self == v4)
  {
    BOOL isEqual = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMFSelectorMessageHandler;
    if ([(__HMFMessageHandler *)&v12 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (v7)
      {
        if (self->_selector) {
          selector = self->_selector;
        }
        else {
          selector = 0;
        }
        if (v7->_selector) {
          v10 = v7->_selector;
        }
        else {
          v10 = 0;
        }
        BOOL isEqual = sel_isEqual(selector, v10);
      }
      else
      {
        BOOL isEqual = 1;
      }
    }
    else
    {
      BOOL isEqual = 0;
    }
  }

  return isEqual;
}

- (BOOL)invokeWithMessage:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"message");
  }
  v5 = v4;
  v6 = [(__HMFMessageHandler *)self receiver];
  if (v6)
  {
    if (self->_selector) {
      SEL selector = self->_selector;
    }
    else {
      SEL selector = 0;
    }
    v8 = [[HMFActivity alloc] initWithName:@"SelectorMessage Invocation"];
    uint64_t v9 = [v5 qualityOfService];
    if (v9 == -1) {
      int v10 = 21;
    }
    else {
      int v10 = 0;
    }
    if (v9 <= 8) {
      int v11 = v10;
    }
    else {
      int v11 = 9;
    }
    if (v9 <= 16) {
      int v12 = v11;
    }
    else {
      int v12 = 17;
    }
    if (v9 <= 24) {
      int v13 = v12;
    }
    else {
      int v13 = 25;
    }
    if (v9 <= 32) {
      dispatch_qos_class_t v14 = v13;
    }
    else {
      dispatch_qos_class_t v14 = QOS_CLASS_USER_INTERACTIVE;
    }
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __49____HMFSelectorMessageHandler_invokeWithMessage___block_invoke;
    v23 = &unk_1E5958728;
    id v24 = v6;
    SEL v27 = selector;
    id v25 = v5;
    v15 = v8;
    v26 = v15;
    v16 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v14, 0, &v20);
    v17 = [(__HMFMessageHandler *)self queue];
    v18 = v17;
    if (v17) {
      dispatch_async(v17, v16);
    }
    else {
      v16[2](v16);
    }

    if (v15) {
      [(HMFActivity *)v15 end];
    }
  }
  return v6 != 0;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

@end