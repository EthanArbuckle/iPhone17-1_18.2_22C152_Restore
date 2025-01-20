@interface CALNModuleProvider
+ (NSArray)modules;
@end

@implementation CALNModuleProvider

+ (NSArray)modules
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CALNNotificationServerModule);
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

@end