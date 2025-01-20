@interface HDHRElectrocardiogramV1DeviceSupportedStateProvider
- (BOOL)isDeviceSupported:(id)a3;
@end

@implementation HDHRElectrocardiogramV1DeviceSupportedStateProvider

- (BOOL)isDeviceSupported:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_5:
    char v8 = 0;
    goto LABEL_7;
  }
  v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v5 = [v4 isAppleWatch];

  if (!v5)
  {
    v9 = [v3 valueForProperty:*MEMORY[0x1E4F79DA0]];
    char v10 = [v9 BOOLValue];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"68AB2987-CE75-463C-9EAF-9861B292F01E"];
    char v12 = [v3 supportsCapability:v11];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"16625FBA-E847-4494-8191-433915DC9F15"];
    char v14 = [v3 supportsCapability:v13];

    if ((v10 & 1) == 0)
    {
      char v8 = v12 & (v14 ^ 1);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"16625FBA-E847-4494-8191-433915DC9F15"];
  char v7 = [v3 supportsCapability:v6];

  char v8 = v7 ^ 1;
LABEL_7:

  return v8;
}

@end