@interface AXVSBaseService
+ (id)sharedInstance;
- (id)sb_alertDefinition;
- (id)sb_initialClassName;
- (id)serviceName;
@end

@implementation AXVSBaseService

- (id)serviceName
{
  return @"com.apple.AXUIViewService";
}

- (id)sb_initialClassName
{
  return &stru_26D3AF6E0;
}

- (id)sb_alertDefinition
{
  id v3 = objc_alloc(MEMORY[0x263F79410]);
  v4 = [(AXVSBaseService *)self serviceName];
  v5 = [(AXVSBaseService *)self sb_initialClassName];
  v6 = (void *)[v3 initWithServiceName:v4 viewControllerClassName:v5];

  return v6;
}

+ (id)sharedInstance
{
  return 0;
}

@end