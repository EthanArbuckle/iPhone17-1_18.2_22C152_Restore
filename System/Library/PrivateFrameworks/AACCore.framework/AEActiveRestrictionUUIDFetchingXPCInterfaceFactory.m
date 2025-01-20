@interface AEActiveRestrictionUUIDFetchingXPCInterfaceFactory
- (id)makeInterface;
@end

@implementation AEActiveRestrictionUUIDFetchingXPCInterfaceFactory

- (id)makeInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F1471F8];
}

@end