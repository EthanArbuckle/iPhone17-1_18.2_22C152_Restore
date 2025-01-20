@interface AELifecycleEventHandlingXPCInterfaceFactory
- (id)makeInterface;
@end

@implementation AELifecycleEventHandlingXPCInterfaceFactory

- (id)makeInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F145A68];
}

@end