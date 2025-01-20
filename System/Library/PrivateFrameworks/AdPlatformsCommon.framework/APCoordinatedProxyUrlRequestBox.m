@interface APCoordinatedProxyUrlRequestBox
- (APCoordinatedProxyUrlRequestBox)initWithDelegate:(id)a3 handler:(id)a4;
- (id)completionHandler;
@end

@implementation APCoordinatedProxyUrlRequestBox

- (APCoordinatedProxyUrlRequestBox)initWithDelegate:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APCoordinatedProxyUrlRequestBox;
  v7 = [(APCoordinatedRetryBox *)&v11 initWithType:2 delegate:a3];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x22A64D220](v6);
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = (id)v8;
  }
  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end