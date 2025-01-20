@interface GCDevicePhysicalInputGroup
@end

@implementation GCDevicePhysicalInputGroup

uint64_t __38___GCDevicePhysicalInputGroup_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDataSource:0];
}

void __63___GCDevicePhysicalInputGroup__locked_setClientQueue_override___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[_GCDevicePhysicalInputBase facade](a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 willChangeValueForKey:@"queue"];
}

void __63___GCDevicePhysicalInputGroup__locked_setClientQueue_override___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[_GCDevicePhysicalInputBase facade](a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 didChangeValueForKey:@"queue"];
}

unint64_t __52___GCDevicePhysicalInputGroup_transactionQueueDepth__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = -[_GCDevicePhysicalInput transactionQueueDepth](a3);
  if (v4 <= result) {
    unint64_t v6 = result;
  }
  else {
    unint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

uint64_t __49___GCDevicePhysicalInputGroup_Snapshots__capture__block_invoke(uint64_t a1, void *a2)
{
  return -[_GCDevicePhysicalInput currentTransaction](a2);
}

uint64_t __65___GCDevicePhysicalInputGroup_EventHandling__handleGamepadEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_GCDevicePhysicalInput handleGamepadEvent:](a3, *(void **)(a1 + 32));
}

@end