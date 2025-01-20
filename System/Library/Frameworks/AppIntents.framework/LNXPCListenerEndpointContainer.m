@interface LNXPCListenerEndpointContainer
- (LNAction)resolvedAction;
- (LNXPCListenerEndpointContainer)init;
- (NSData)auditTokenData;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)setAuditTokenData:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setResolvedAction:(id)a3;
@end

@implementation LNXPCListenerEndpointContainer

- (NSXPCListenerEndpoint)listenerEndpoint
{
  id v2 = XPCListenerEndpointContainer.listenerEndpoint.getter();

  return (NSXPCListenerEndpoint *)v2;
}

- (void)setListenerEndpoint:(id)a3
{
  id v4 = a3;
  v5 = self;
  XPCListenerEndpointContainer.listenerEndpoint.setter(v4);
}

- (NSData)auditTokenData
{
  uint64_t v2 = XPCListenerEndpointContainer.auditTokenData.getter();
  unint64_t v4 = v3;
  v5 = (void *)sub_236669C70();
  sub_2362653E4(v2, v4);

  return (NSData *)v5;
}

- (void)setAuditTokenData:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_236669C90();
  uint64_t v7 = v6;

  XPCListenerEndpointContainer.auditTokenData.setter(v5, v7);
}

- (LNAction)resolvedAction
{
  id v2 = XPCListenerEndpointContainer.resolvedAction.getter();

  return (LNAction *)v2;
}

- (void)setResolvedAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  XPCListenerEndpointContainer.resolvedAction.setter(v4);
}

- (LNXPCListenerEndpointContainer)init
{
}

- (void).cxx_destruct
{
  sub_2362653E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___LNXPCListenerEndpointContainer_auditTokenData), *(void *)&self->listenerEndpoint[OBJC_IVAR___LNXPCListenerEndpointContainer_auditTokenData]);
  unint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___LNXPCListenerEndpointContainer_resolvedAction);
}

@end