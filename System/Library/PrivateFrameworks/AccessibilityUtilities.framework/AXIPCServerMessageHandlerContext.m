@interface AXIPCServerMessageHandlerContext
- (AXIPCServerMessageHandlerContext)initWithHandler:(id)a3;
- (AXIPCServerMessageHandlerContext)initWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5;
- (BOOL)async;
- (SEL)selector;
- (id)handler;
- (id)target;
@end

@implementation AXIPCServerMessageHandlerContext

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
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

- (BOOL)async
{
  return self->_async;
}

- (AXIPCServerMessageHandlerContext)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXIPCServerMessageHandlerContext;
  v5 = [(AXIPCServerMessageHandlerContext *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      handler = v6->_handler;
      v6->_handler = (id)v7;
    }
    else
    {
      handler = v5;
      v6 = 0;
    }
  }
  return v6;
}

- (AXIPCServerMessageHandlerContext)initWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXIPCServerMessageHandlerContext;
  v9 = [(AXIPCServerMessageHandlerContext *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      objc_storeWeak(&v9->_target, v8);
      v10->_selector = a4;
      v10->_async = a5;
    }
    else
    {

      objc_super v10 = 0;
    }
  }

  return v10;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);

  objc_storeStrong(&self->_handler, 0);
}

@end