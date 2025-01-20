@interface BBSyncServiceXPC
+ (id)clientInterface;
@end

@implementation BBSyncServiceXPC

+ (id)clientInterface
{
  if (clientInterface_onceToken_103 != -1) {
    dispatch_once(&clientInterface_onceToken_103, &__block_literal_global_106);
  }
  v2 = (void *)clientInterface___interface_104;
  return v2;
}

uint64_t __35__BBSyncServiceXPC_clientInterface__block_invoke()
{
  clientInterface___interface_104 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7B0378];
  return MEMORY[0x270F9A758]();
}

@end