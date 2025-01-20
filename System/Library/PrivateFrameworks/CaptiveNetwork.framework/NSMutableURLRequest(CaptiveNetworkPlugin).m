@interface NSMutableURLRequest(CaptiveNetworkPlugin)
- (const)bindToCommand:()CaptiveNetworkPlugin;
@end

@implementation NSMutableURLRequest(CaptiveNetworkPlugin)

- (const)bindToCommand:()CaptiveNetworkPlugin
{
  result = CNPluginCommandGetInterfaceName(a3);
  if (result)
  {
    return (const void *)[a1 setBoundInterfaceIdentifier:result];
  }
  return result;
}

@end