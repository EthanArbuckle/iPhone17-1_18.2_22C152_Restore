@interface CPSTVProviderButtonHandlingInterface
+ (NSXPCInterface)handlerInterface;
@end

@implementation CPSTVProviderButtonHandlingInterface

+ (NSXPCInterface)handlerInterface
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE30A18];
}

@end