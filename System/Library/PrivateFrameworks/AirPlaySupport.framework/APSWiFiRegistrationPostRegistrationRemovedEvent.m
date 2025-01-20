@interface APSWiFiRegistrationPostRegistrationRemovedEvent
@end

@implementation APSWiFiRegistrationPostRegistrationRemovedEvent

uint64_t ___APSWiFiRegistrationPostRegistrationRemovedEvent_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end