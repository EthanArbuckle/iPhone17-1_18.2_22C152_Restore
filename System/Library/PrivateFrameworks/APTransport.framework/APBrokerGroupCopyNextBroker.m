@interface APBrokerGroupCopyNextBroker
@end

@implementation APBrokerGroupCopyNextBroker

uint64_t ___APBrokerGroupCopyNextBroker_block_invoke(uint64_t result, const void *a2)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v3 = result;
    result = CFSetContainsValue(*(CFSetRef *)(result + 40), a2);
    if (!result) {
      *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = a2;
    }
  }
  return result;
}

@end