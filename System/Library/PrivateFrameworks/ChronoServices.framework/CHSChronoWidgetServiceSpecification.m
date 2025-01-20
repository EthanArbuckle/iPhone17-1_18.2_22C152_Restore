@interface CHSChronoWidgetServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation CHSChronoWidgetServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.chrono.widget-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CHSChronoWidgetServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, block);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __48__CHSChronoWidgetServiceSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B98];
  v2 = [*(id *)(a1 + 32) identifier];
  v3 = [v1 interfaceWithIdentifier:v2];

  v4 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EE0D03C8];
  [v3 setServer:v4];

  v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EE0C6BF8];
  [v3 setClient:v5];

  v6 = (void *)interface___interface;
  interface___interface = (uint64_t)v3;
}

@end