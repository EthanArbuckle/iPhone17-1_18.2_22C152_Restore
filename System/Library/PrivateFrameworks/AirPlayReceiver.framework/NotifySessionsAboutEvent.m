@interface NotifySessionsAboutEvent
@end

@implementation NotifySessionsAboutEvent

void ___NotifySessionsAboutEvent_block_invoke(uint64_t a1)
{
  v2 = APReceiverRequestProcessorCopyReceiverSession();
  if (v2)
  {
    v4 = v2;
    AirPlayReceiverSessionControl((uint64_t)v2, v3, *(CFTypeRef *)(a1 + 32), *(__CFString **)(a1 + 40), *(const __CFDictionary **)(a1 + 48), 0);
    CFRelease(v4);
  }
}

@end