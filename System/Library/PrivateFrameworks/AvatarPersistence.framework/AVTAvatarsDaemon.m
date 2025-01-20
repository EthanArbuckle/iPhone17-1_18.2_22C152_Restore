@interface AVTAvatarsDaemon
+ (id)xpcInterface;
@end

@implementation AVTAvatarsDaemon

+ (id)xpcInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA9BEB8];
}

@end