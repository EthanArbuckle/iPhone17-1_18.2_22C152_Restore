@interface SGXPCListenerInfo
- (NSString)entitlement;
- (Protocol)protocol;
- (void)setEntitlement:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation SGXPCListenerInfo

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_entitlement, 0);
}

- (void)setProtocol:(id)a3
{
}

- (void)setEntitlement:(id)a3
{
}

@end