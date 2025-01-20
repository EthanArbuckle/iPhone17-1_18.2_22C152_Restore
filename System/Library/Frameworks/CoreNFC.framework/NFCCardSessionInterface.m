@interface NFCCardSessionInterface
+ (uint64_t)interface;
@end

@implementation NFCCardSessionInterface

+ (uint64_t)interface
{
  self;
  v0 = (void *)MEMORY[0x263F08D80];

  return [v0 interfaceWithProtocol:&unk_26D39F250];
}

@end