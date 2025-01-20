@interface CRSUIVolumeNotificationSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CRSUIVolumeNotificationSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.CarPlayApp.volume-notification";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F3F6A8] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)interface___interface_1;
  return (BSServiceInterface *)v2;
}

void __49__CRSUIVolumeNotificationSpecification_interface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F3F678];
  v1 = +[CRSUIVolumeNotificationSpecification identifier];
  id v6 = [v0 interfaceWithIdentifier:v1];

  [v6 setClientMessagingExpectation:1];
  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C945728];
  [v6 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26C93EC28];
  [v6 setClient:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_1;
  interface___interface_1 = v4;
}

@end