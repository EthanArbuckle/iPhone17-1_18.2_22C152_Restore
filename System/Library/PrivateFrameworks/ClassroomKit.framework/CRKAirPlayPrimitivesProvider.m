@interface CRKAirPlayPrimitivesProvider
- (id)makePrimitives;
@end

@implementation CRKAirPlayPrimitivesProvider

- (id)makePrimitives
{
  v2 = [MEMORY[0x263EFA7B8] sharedSystemScreenContext];
  v3 = [MEMORY[0x263F08AB0] processInfo];
  objc_msgSend(v2, "setApplicationProcessID:", objc_msgSend(v3, "processIdentifier"));

  v4 = [CRKConcreteAirPlayPrimitives alloc];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  v6 = [(CRKConcreteAirPlayPrimitives *)v4 initWithOutputContext:v2 notificationCenter:v5];

  return v6;
}

@end