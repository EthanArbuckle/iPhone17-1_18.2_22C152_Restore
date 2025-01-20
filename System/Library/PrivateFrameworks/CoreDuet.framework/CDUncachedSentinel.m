@interface CDUncachedSentinel
@end

@implementation CDUncachedSentinel

void __37___CDUncachedSentinel_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end