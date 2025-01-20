@interface LSQueryContext
@end

@implementation LSQueryContext

void __33___LSQueryContext_defaultContext__block_invoke()
{
  id v0 = [[_LSQueryContext alloc] _init];
  v1 = (void *)+[_LSQueryContext defaultContext]::result;
  +[_LSQueryContext defaultContext]::result = (uint64_t)v0;
}

@end