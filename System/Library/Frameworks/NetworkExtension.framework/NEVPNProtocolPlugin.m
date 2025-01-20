@interface NEVPNProtocolPlugin
- (NSString)pluginType;
@end

@implementation NEVPNProtocolPlugin

- (void).cxx_destruct
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

@end