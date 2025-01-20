@interface DMTNetworkProxyPayload
+ (NSSet)supportedPayloadTypes;
@end

@implementation DMTNetworkProxyPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:@"com.apple.SystemConfiguration"];
}

@end