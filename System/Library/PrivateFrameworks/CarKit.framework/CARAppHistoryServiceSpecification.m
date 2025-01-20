@interface CARAppHistoryServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CARAppHistoryServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.app-history-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __46__CARAppHistoryServiceSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F50B98];
  v1 = +[CARAppHistoryServiceSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F03276C0];
  [v6 setServer:v2];

  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0321960];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface;
  interface___interface = v4;
}

@end