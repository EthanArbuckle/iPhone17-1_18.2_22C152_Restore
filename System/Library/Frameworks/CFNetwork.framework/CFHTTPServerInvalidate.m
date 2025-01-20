@interface CFHTTPServerInvalidate
@end

@implementation CFHTTPServerInvalidate

void ___CFHTTPServerInvalidate_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 72) <= 2) {
    *(_DWORD *)(a2 + 72) = 3;
  }
  HTTPServerBase::signal((NSObject **)(a2 + 8));
}

@end