@interface CFHTTPServerRequestSetClient
@end

@implementation CFHTTPServerRequestSetClient

uint64_t ___CFHTTPServerRequestSetClient_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(uint64_t **)(a1 + 32);
  uint64_t v4 = *(void *)(a2 + 136);
  if (HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection != -1) {
    dispatch_once(&HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection, &__block_literal_global_16431);
  }
  v5 = *(_DWORD **)(v4 + 112);

  return HTTPServerClientOwning::setServerClient(a2 + 8, v3, v5);
}

@end