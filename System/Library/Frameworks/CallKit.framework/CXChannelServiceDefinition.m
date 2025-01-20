@interface CXChannelServiceDefinition
- (CXServiceDomain)domain;
- (NSString)name;
- (Protocol)clientXPCInterface;
- (Protocol)serverXPCInterface;
@end

@implementation CXChannelServiceDefinition

- (Protocol)clientXPCInterface
{
  return (Protocol *)&unk_1EFC40FF8;
}

- (Protocol)serverXPCInterface
{
  return (Protocol *)&unk_1EFC44108;
}

- (NSString)name
{
  return (NSString *)@"com.apple.callkit.service.channel";
}

- (CXServiceDomain)domain
{
  return (CXServiceDomain *)+[CXServiceDomain callKitServiceDomain];
}

@end