@interface HDHRElectrocardiogramV2DeviceSupportedStateProvider
- (BOOL)isDeviceSupported:(id)a3;
@end

@implementation HDHRElectrocardiogramV2DeviceSupportedStateProvider

- (BOOL)isDeviceSupported:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v5 = [v4 isAppleWatch];

    if (v5)
    {
      char v6 = 1;
    }
    else
    {
      v7 = [v3 valueForProperty:*MEMORY[0x1E4F79DA0]];
      char v8 = [v7 BOOLValue];

      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
      char v10 = [v3 supportsCapability:v9];

      char v6 = v10 & ~v8;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end