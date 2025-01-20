@interface NFCFieldDetectSessionCallbacksInterface
+ (id)interface;
@end

@implementation NFCFieldDetectSessionCallbacksInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39DB78];
}

@end