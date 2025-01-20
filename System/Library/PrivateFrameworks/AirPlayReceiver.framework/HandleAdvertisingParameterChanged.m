@interface HandleAdvertisingParameterChanged
@end

@implementation HandleAdvertisingParameterChanged

void ___HandleAdvertisingParameterChanged_block_invoke(uint64_t a1)
{
  _NotifySessionsSystemInfoChange(*(void *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end