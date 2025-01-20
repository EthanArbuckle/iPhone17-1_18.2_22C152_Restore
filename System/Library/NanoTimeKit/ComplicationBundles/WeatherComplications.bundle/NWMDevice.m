@interface NWMDevice
+ (BOOL)deviceSupportsWidgets:(id)a3;
@end

@implementation NWMDevice

+ (BOOL)deviceSupportsWidgets:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"BC465234-0FF9-46F6-9ACD-0394027F67A8"];
  char v6 = [v4 supportsCapability:v5];

  return v6;
}

@end