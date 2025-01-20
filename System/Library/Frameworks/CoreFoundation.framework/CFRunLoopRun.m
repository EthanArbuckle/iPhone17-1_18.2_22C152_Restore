@interface CFRunLoopRun
@end

@implementation CFRunLoopRun

void ____CFRunLoopRun_block_invoke_2(uint64_t a1)
{
}

void ____CFRunLoopRun_block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(__CFRunLoop **)(a1 + 32);

  CFRunLoopWakeUp(v2);
}

@end