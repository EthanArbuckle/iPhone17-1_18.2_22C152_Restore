@interface DMTGlobalHTTPProxyPayload
+ (NSSet)supportedPayloadTypes;
@end

@implementation DMTGlobalHTTPProxyPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:@"com.apple.proxy.http.global"];
}

@end