@interface BKSCancelTouchesTouchDeliveryPolicy
@end

@implementation BKSCancelTouchesTouchDeliveryPolicy

id __69___BKSCancelTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:@"cancel" withName:0];
  id v2 = (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned int *)(*(void *)(a1 + 40) + 8) withName:@"contextID" format:1];
  return (id)[*(id *)(a1 + 32) appendTimeInterval:@"initialTouchTimestamp" withName:0 decomposeUnits:*(double *)(*(void *)(a1 + 40) + 24)];
}

@end