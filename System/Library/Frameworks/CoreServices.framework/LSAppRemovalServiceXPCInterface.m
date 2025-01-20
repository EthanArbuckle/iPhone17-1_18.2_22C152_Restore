@interface LSAppRemovalServiceXPCInterface
@end

@implementation LSAppRemovalServiceXPCInterface

void ___LSAppRemovalServiceXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECB64270];
  v1 = (void *)_LSAppRemovalServiceXPCInterface_interface;
  _LSAppRemovalServiceXPCInterface_interface = v0;
}

@end