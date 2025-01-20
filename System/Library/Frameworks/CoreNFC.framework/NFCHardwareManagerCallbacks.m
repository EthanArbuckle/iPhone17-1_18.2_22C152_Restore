@interface NFCHardwareManagerCallbacks
+ (id)interface;
@end

@implementation NFCHardwareManagerCallbacks

+ (id)interface
{
  if (interface_onceToken_91 != -1) {
    dispatch_once(&interface_onceToken_91, &__block_literal_global_93);
  }
  v2 = (void *)interface_interface_90;

  return v2;
}

uint64_t __40__NFCHardwareManagerCallbacks_interface__block_invoke()
{
  interface_interface_90 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39BA98];

  return MEMORY[0x270F9A758]();
}

@end