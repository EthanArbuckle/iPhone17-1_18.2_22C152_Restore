@interface NSMachPort
@end

@implementation NSMachPort

uint64_t __33__NSMachPort_NSMachPort__release__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

@end