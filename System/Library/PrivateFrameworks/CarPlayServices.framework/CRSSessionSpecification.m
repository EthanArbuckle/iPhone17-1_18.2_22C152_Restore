@interface CRSSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSSessionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.session";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F2B9F0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)interface___interface_0;
  return (BSServiceInterface *)v2;
}

void __36__CRSSessionSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F2B9B0];
  v1 = +[CRSSessionSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCD090];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26CDCC500];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_0;
  interface___interface_0 = v4;
}

@end