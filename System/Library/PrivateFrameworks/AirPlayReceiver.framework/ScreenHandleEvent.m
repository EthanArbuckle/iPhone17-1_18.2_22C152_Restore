@interface ScreenHandleEvent
@end

@implementation ScreenHandleEvent

void ___ScreenHandleEvent_block_invoke(uint64_t a1)
{
  AirPlayReceiverSessionForceKeyFrame(*(void *)(a1 + 32), 0, 0);
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end