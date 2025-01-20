@interface DCDeviceMetadataInterface
+ (id)XPCInterface;
@end

@implementation DCDeviceMetadataInterface

+ (id)XPCInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EA8D198];
}

@end