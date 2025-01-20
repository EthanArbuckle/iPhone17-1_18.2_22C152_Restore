@interface DTXPCRegistration
- (NSString)serviceIdentifier;
- (OS_xpc_object)xpcObject;
- (id)client;
- (id)oneshotHandler;
- (id)pkHandle;
- (void)setClient:(id)a3;
- (void)setOneshotHandler:(id)a3;
- (void)setPkHandle:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setXpcObject:(id)a3;
@end

@implementation DTXPCRegistration

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (id)oneshotHandler
{
  return self->_oneshotHandler;
}

- (void)setOneshotHandler:(id)a3
{
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (id)pkHandle
{
  return self->_pkHandle;
}

- (void)setPkHandle:(id)a3
{
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (void)setXpcObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcObject, 0);
  objc_storeStrong(&self->_pkHandle, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong(&self->_oneshotHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end