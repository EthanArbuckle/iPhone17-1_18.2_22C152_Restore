@interface CFHTTPServerConnectionInvalidate
@end

@implementation CFHTTPServerConnectionInvalidate

void ___CFHTTPServerConnectionInvalidate_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 72) <= 2) {
    *(_DWORD *)(a2 + 72) = 3;
  }
  HTTPServerBase::signal((NSObject **)(a2 + 8));
}

@end