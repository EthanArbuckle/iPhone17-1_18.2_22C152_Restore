@interface SGLazyInit
- (SGLazyInit)initWithInitializer:(id)a3 destructor:(id)a4;
- (id)getObject;
- (id)peekAtCachedObject;
- (void)dealloc;
- (void)destroyCachedObject;
@end

@implementation SGLazyInit

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedObject, 0);
  objc_storeStrong(&self->_destructor, 0);
  objc_storeStrong(&self->_initializer, 0);
}

- (void)dealloc
{
  [(SGLazyInit *)self destroyCachedObject];
  v3.receiver = self;
  v3.super_class = (Class)SGLazyInit;
  [(SGLazyInit *)&v3 dealloc];
}

- (void)destroyCachedObject
{
  destructor = (void (**)(void))self->_destructor;
  if (destructor && self->_cachedObject) {
    destructor[2]();
  }
  id cachedObject = self->_cachedObject;
  self->_id cachedObject = 0;
}

- (id)peekAtCachedObject
{
  return self->_cachedObject;
}

- (id)getObject
{
  id cachedObject = self->_cachedObject;
  if (!cachedObject)
  {
    v4 = (*((void (**)(void))self->_initializer + 2))();
    id v5 = self->_cachedObject;
    self->_id cachedObject = v4;

    id cachedObject = self->_cachedObject;
  }
  return cachedObject;
}

- (SGLazyInit)initWithInitializer:(id)a3 destructor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)SGLazyInit;
    v8 = [(SGLazyInit *)&v15 init];
    if (v8)
    {
      uint64_t v9 = MEMORY[0x22A66BFD0](v6);
      id initializer = v8->_initializer;
      v8->_id initializer = (id)v9;

      uint64_t v11 = MEMORY[0x22A66BFD0](v7);
      id destructor = v8->_destructor;
      v8->_id destructor = (id)v11;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end