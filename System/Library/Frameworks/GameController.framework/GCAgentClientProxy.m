@interface GCAgentClientProxy
@end

@implementation GCAgentClientProxy

void __68___GCAgentClientProxy__initWithConnection_server_userDefaultsProxy___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  [v1 _invalidate];
}

uint64_t __37___GCAgentClientProxy_pingWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __76___GCAgentClientProxy_connectToUserDefaultsXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __79___GCAgentClientProxy_connectToVideoRelocationXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

@end