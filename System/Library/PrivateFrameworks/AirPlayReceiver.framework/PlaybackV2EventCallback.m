@interface PlaybackV2EventCallback
@end

@implementation PlaybackV2EventCallback

void ___PlaybackV2EventCallback_block_invoke(uint64_t a1)
{
  if (AirPlayReceiverSessionSendCommandForObject(*(void *)(a1 + 32), *(const __CFNumber **)(a1 + 40), *(const void **)(a1 + 48), 0, 0))APSLogErrorAt(); {
  v2 = *(const void **)(a1 + 40);
  }
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 32);

  CFRelease(v4);
}

@end