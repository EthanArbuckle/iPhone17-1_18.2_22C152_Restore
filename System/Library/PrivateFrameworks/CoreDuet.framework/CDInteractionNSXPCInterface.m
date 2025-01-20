@interface CDInteractionNSXPCInterface
@end

@implementation CDInteractionNSXPCInterface

void ___CDInteractionNSXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDE53F98];
  v1 = (void *)_CDInteractionNSXPCInterface_interface;
  _CDInteractionNSXPCInterface_interface = v0;

  v2 = (void *)_CDInteractionNSXPCInterface_interface;
  setClassesForCDInteractionXPCInterface(v2);
}

@end