@interface CHSWidgetEventServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CHSWidgetEventServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.chrono.event-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CHSWidgetEventServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, block);
  }
  v2 = (void *)interface___interface_1;
  return (BSServiceInterface *)v2;
}

void __47__CHSWidgetEventServiceSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B98];
  v2 = [*(id *)(a1 + 32) identifier];
  v3 = [v1 interfaceWithIdentifier:v2];

  v4 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EE0C9050];
  [v3 setServer:v4];

  v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EE0D04E8];
  [v3 setClient:v5];

  v6 = (void *)interface___interface_1;
  interface___interface_1 = (uint64_t)v3;
}

@end