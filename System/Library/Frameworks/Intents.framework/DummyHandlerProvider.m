@interface DummyHandlerProvider
- (DummyHandlerProvider)initWithHandler:(id)a3;
- (id)handler;
- (id)handlerForIntent:(id)a3;
@end

@implementation DummyHandlerProvider

- (void).cxx_destruct
{
}

- (id)handler
{
  return self->_handler;
}

- (id)handlerForIntent:(id)a3
{
  return self->_handler;
}

- (DummyHandlerProvider)initWithHandler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DummyHandlerProvider;
  v6 = [(DummyHandlerProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_handler, a3);
  }

  return v7;
}

@end