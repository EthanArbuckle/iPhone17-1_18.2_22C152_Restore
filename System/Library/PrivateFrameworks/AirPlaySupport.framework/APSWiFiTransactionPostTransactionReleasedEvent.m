@interface APSWiFiTransactionPostTransactionReleasedEvent
@end

@implementation APSWiFiTransactionPostTransactionReleasedEvent

uint64_t ___APSWiFiTransactionPostTransactionReleasedEvent_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end