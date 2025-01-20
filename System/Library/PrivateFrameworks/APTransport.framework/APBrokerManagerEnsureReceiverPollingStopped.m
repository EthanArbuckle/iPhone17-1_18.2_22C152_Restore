@interface APBrokerManagerEnsureReceiverPollingStopped
@end

@implementation APBrokerManagerEnsureReceiverPollingStopped

uint64_t ___APBrokerManagerEnsureReceiverPollingStopped_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APBrokerGroupStopReceiverPolling(a3);
}

@end