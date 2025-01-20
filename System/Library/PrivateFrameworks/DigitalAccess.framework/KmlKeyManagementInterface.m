@interface KmlKeyManagementInterface
+ (id)interface;
@end

@implementation KmlKeyManagementInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5C2C60];
}

@end