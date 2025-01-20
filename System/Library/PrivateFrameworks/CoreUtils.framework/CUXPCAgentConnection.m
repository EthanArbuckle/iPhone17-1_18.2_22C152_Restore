@interface CUXPCAgentConnection
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)connectionInvalidated;
@end

@implementation CUXPCAgentConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_xpcCnx remoteObjectProxyWithErrorHandler:a3];
}

- (id)remoteObjectProxy
{
  return [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_agent->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v4 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgentConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection ended from %#{pid}\n", v5, v6, v7, v8, v4);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)self->_agent->_ucat, 0x14u))
    {
      ucat = self->_agent->_ucat;
      goto LABEL_3;
    }
  }
}

@end