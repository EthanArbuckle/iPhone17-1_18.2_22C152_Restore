@interface ATXGlobals
@end

@implementation ATXGlobals

void __29___ATXGlobals_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_49;
  sharedInstance__pasExprOnceResult_49 = v1;
}

@end