@interface APReceiverMediaRemoteXPCService
@end

@implementation APReceiverMediaRemoteXPCService

void __APReceiverMediaRemoteXPCService_copyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  APReceiverSessionManagerCopyAirPlaySessionWithAttribute(*(void *)(gAPReceiverMediaRemoteService_0 + 216), 0, 0, &cf);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    APSLogErrorAt();
  }
  else
  {
    if (cf)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = AirPlayReceiverSessionCopyProperty((uint64_t)cf, v2, @"MRInfo", v3, 0);
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        goto LABEL_4;
      }
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      int v5 = -6727;
    }
    else
    {
      APSLogErrorAt();
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      int v5 = -6709;
    }
    *(_DWORD *)(v4 + 24) = v5;
  }
LABEL_4:
  if (cf) {
    CFRelease(cf);
  }
}

@end