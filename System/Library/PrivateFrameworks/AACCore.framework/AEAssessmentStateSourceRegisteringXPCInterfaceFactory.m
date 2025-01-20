@interface AEAssessmentStateSourceRegisteringXPCInterfaceFactory
- (id)makeInterface;
@end

@implementation AEAssessmentStateSourceRegisteringXPCInterfaceFactory

- (id)makeInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F145C58];
}

@end