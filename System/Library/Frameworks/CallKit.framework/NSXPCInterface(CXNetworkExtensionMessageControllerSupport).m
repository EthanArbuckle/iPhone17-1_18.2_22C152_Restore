@interface NSXPCInterface(CXNetworkExtensionMessageControllerSupport)
+ (uint64_t)cx_networkExtensionMessageControllerHostInterface;
@end

@implementation NSXPCInterface(CXNetworkExtensionMessageControllerSupport)

+ (uint64_t)cx_networkExtensionMessageControllerHostInterface
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC43530];
}

@end