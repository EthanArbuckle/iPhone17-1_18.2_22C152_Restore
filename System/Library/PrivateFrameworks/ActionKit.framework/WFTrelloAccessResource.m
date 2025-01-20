@interface WFTrelloAccessResource
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
- (Class)accountClass;
- (id)associatedAppIdentifier;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFTrelloAccessResource

+ (id)userInterfaceClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F33B28];
  v5[0] = *MEMORY[0x263F33B40];
  v5[1] = v2;
  v6[0] = @"WFTrelloAccessResourceUserInterface";
  v6[1] = @"WFTrelloAccessResourceUserInterface";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1610;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__WFTrelloAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke;
  v8[3] = &unk_264E5CD58;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 authorizeWithCompletionHandler:v8];
}

void __77__WFTrelloAccessResource_makeAvailableWithRemoteInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 refreshAvailabilityWithForcedNotification];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (id)associatedAppIdentifier
{
  return @"com.fogcreek.trello";
}

@end