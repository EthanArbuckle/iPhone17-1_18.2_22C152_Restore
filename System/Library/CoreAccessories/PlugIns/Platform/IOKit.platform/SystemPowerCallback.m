@interface SystemPowerCallback
@end

@implementation SystemPowerCallback

void ____SystemPowerCallback_block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) sleepNotificationClients];
  v2 = (void *)[v3 mutableCopy];
  [*(id *)(a1 + 32) setClientsPreventingSleep:v2];
}

uint64_t ____SystemPowerCallback_block_invoke_195(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClientsPreventingSleep:0];
}

@end