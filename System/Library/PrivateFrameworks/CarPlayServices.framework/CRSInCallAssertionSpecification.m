@interface CRSInCallAssertionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSInCallAssertionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.in-call";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F2B9F0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)interface___interface_1;
  return (BSServiceInterface *)v2;
}

void __44__CRSInCallAssertionSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F2B9B0];
  v1 = +[CRSInCallAssertionSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCC7C8];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCC920];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_1;
  interface___interface_1 = v4;
}

@end