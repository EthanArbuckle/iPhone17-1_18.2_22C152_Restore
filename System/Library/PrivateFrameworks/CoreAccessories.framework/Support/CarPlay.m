@interface CarPlay
@end

@implementation CarPlay

intptr_t __platform_CarPlay_isWirelessCarPlayAllowedForCertSerial_block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __platform_CarPlay_isCarPlayPairedWithCertSerial_block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __platform_CarPlay_carPlayAppLinksStateForCertSerial_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __platform_CarPlay_availability_block_invoke(uint64_t a1)
{
  accFeatureHandlers_invokeHandler(*(const void **)(a1 + 32), 58, *(void *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void __platform_CarPlay_availableDigitalCarKeys_block_invoke(uint64_t a1, const void *a2)
{
  if (a2) {
    platform_CarPlay_matchedDigitalCarKeys(*(const void **)(a1 + 32), a2);
  }
}

CFTypeRef __platform_CarPlay_matchedDigitalCarKeys_block_invoke(uint64_t a1)
{
  accFeatureHandlers_invokeHandler(*(const void **)(a1 + 32), 59, *(void *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 40);

  return CFRetain(v2);
}

@end