@interface CRSIconLayoutServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSIconLayoutServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.icon-layout";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F2B9F0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __46__CRSIconLayoutServiceSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F2B9B0];
  v1 = +[CRSIconLayoutServiceSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCC1D8];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCC600];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface;
  interface___interface = v4;
}

@end