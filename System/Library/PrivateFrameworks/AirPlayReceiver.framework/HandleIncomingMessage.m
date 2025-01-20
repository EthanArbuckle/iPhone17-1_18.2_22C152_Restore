@interface HandleIncomingMessage
@end

@implementation HandleIncomingMessage

void __rcsMediaRemote_HandleIncomingMessage_block_invoke(uint64_t a1)
{
  APReceiverMediaRemoteXPCService_PostEvent(@"didReceiveMediaRemoteData", *(const void **)(a1 + 32), *(const __CFData **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void __rcsSenderUIEventsChannel_HandleIncomingMessage_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 152);
  if (v6) {
    v6(v3, v2);
  }
  v7 = *(const void **)(a1 + 40);

  CFRelease(v7);
}

@end