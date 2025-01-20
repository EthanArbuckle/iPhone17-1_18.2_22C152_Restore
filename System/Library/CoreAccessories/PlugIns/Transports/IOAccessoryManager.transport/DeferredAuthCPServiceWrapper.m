@interface DeferredAuthCPServiceWrapper
- (ACCTransportIOAccessoryManager)mgr;
- (DeferredAuthCPServiceWrapper)initWithIOService:(unsigned int)a3 withMgr:(id)a4;
- (unsigned)service;
- (void)setMgr:(id)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation DeferredAuthCPServiceWrapper

- (DeferredAuthCPServiceWrapper)initWithIOService:(unsigned int)a3 withMgr:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DeferredAuthCPServiceWrapper;
  v7 = [(DeferredAuthCPServiceWrapper *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(DeferredAuthCPServiceWrapper *)v7 setService:v4];
    [(DeferredAuthCPServiceWrapper *)v8 setMgr:v6];
  }

  return v8;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (ACCTransportIOAccessoryManager)mgr
{
  return self->_mgr;
}

- (void)setMgr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end