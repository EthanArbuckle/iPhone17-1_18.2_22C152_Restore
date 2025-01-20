@interface MPMusicMediaPickerXPCInterfaces
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation MPMusicMediaPickerXPCInterfaces

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE7282E8];
}

+ (id)serviceInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78E0A8];
}

@end