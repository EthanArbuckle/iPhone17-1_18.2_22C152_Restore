@interface FigDispatchAsyncAndWaitWithTimeout
@end

@implementation FigDispatchAsyncAndWaitWithTimeout

uint64_t __FigDispatchAsyncAndWaitWithTimeout_f_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

@end