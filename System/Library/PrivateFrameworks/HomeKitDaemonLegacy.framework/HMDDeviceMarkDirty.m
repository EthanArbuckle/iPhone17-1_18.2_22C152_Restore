@interface HMDDeviceMarkDirty
@end

@implementation HMDDeviceMarkDirty

void ____HMDDeviceMarkDirty_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDirty])
  {
    [*(id *)(a1 + 32) setDirty:0];
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"HMDDeviceUpdatedNotification" object:*(void *)(a1 + 32)];
  }
}

@end