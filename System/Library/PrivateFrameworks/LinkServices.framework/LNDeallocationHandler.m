@interface LNDeallocationHandler
- (LNDeallocationHandler)initWithObject:(id)a3 deallocationHandler:(id)a4;
- (void)dealloc;
@end

@implementation LNDeallocationHandler

- (LNDeallocationHandler)initWithObject:(id)a3 deallocationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNDeallocationHandler;
  v8 = [(LNDeallocationHandler *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id deallocationHandler = v8->_deallocationHandler;
    v8->_id deallocationHandler = v9;

    objc_storeWeak(&v8->_object, v6);
    objc_setAssociatedObject(v6, v8, v8, (void *)1);
  }

  return v8;
}

- (void)dealloc
{
  id deallocationHandler = self->_deallocationHandler;
  if (deallocationHandler)
  {
    v4 = (void (**)(void))_Block_copy(deallocationHandler);
    id WeakRetained = objc_loadWeakRetained(&self->_object);
    id v6 = self->_deallocationHandler;
    self->_id deallocationHandler = 0;

    objc_storeWeak(&self->_object, 0);
    v4[2](v4);
    if (WeakRetained) {
      objc_setAssociatedObject(WeakRetained, self, 0, (void *)1);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)LNDeallocationHandler;
  [(LNDeallocationHandler *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationHandler, 0);
  objc_destroyWeak(&self->_object);
}

@end