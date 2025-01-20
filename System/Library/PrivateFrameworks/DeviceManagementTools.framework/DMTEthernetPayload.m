@interface DMTEthernetPayload
+ (NSSet)supportedPayloadTypes;
@end

@implementation DMTEthernetPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.firstethernet.managed", @"com.apple.secondethernet.managed", @"com.apple.thirdethernet.managed", @"com.apple.globalethernet.managed", @"com.apple.firstactiveethernet.managed", @"com.apple.secondactiveethernet.managed", @"com.apple.thirdactiveethernet.managed", 0);
}

@end