@interface ATXAggregateLogger
@end

@implementation ATXAggregateLogger

void __37___ATXAggregateLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_36;
  sharedInstance__pasExprOnceResult_36 = v1;
}

@end