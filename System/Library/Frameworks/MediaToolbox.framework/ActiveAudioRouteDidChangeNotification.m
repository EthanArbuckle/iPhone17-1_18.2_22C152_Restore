@interface ActiveAudioRouteDidChangeNotification
@end

@implementation ActiveAudioRouteDidChangeNotification

void __playerceleste_ActiveAudioRouteDidChangeNotification_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(void (**)(uint64_t, void))(v4 + 120);
  if (v5) {
    v5(v2, 0);
  }
  v6 = *(const void **)(a1 + 32);

  CFRelease(v6);
}

@end