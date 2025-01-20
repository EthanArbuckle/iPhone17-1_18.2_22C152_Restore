@interface CFHTTPAuthenticationFetchProxyCredentialFromAuthBroker
@end

@implementation CFHTTPAuthenticationFetchProxyCredentialFromAuthBroker

uint64_t ___CFHTTPAuthenticationFetchProxyCredentialFromAuthBroker_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    a2 = *(void *)(a2 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

@end