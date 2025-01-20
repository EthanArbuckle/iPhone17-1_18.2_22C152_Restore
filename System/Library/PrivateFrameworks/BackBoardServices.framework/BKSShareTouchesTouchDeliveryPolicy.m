@interface BKSShareTouchesTouchDeliveryPolicy
@end

@implementation BKSShareTouchesTouchDeliveryPolicy

id __68___BKSShareTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:@"share" withName:0];
  id v2 = (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned int *)(*(void *)(a1 + 40) + 12) withName:@"hostContextID" format:1];
  return (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned int *)(*(void *)(a1 + 40) + 8) withName:@"childContextID" format:1];
}

@end