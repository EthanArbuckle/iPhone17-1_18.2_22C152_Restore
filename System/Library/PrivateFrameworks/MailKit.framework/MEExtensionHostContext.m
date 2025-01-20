@interface MEExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)extensionHostRequestScheduler;
- (MEMailComposeExtensionHostDelegate)composeExtensionHostDelegate;
- (void)regenerateEmailAddressTokenChangesForSession:(id)a3;
- (void)regenerateSecurityStatusInformationForSession:(id)a3;
- (void)setComposeExtensionHostDelegate:(id)a3;
@end

@implementation MEExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] MERemoteExtensiontInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] MEExtensionRemoteHostInterface];
}

+ (id)extensionHostRequestScheduler
{
  if (extensionHostRequestScheduler_onceToken != -1) {
    dispatch_once(&extensionHostRequestScheduler_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)extensionHostRequestScheduler_scheduler;
  return v2;
}

void __55__MEExtensionHostContext_extensionHostRequestScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F3B3A0] serialDispatchQueueSchedulerWithName:@"com.apple.email.extension.extensionHostRequestScheduler" qualityOfService:17];
  v1 = (void *)extensionHostRequestScheduler_scheduler;
  extensionHostRequestScheduler_scheduler = v0;
}

- (void)regenerateEmailAddressTokenChangesForSession:(id)a3
{
  id v4 = a3;
  v5 = +[MEExtensionHostContext extensionHostRequestScheduler];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__MEExtensionHostContext_regenerateEmailAddressTokenChangesForSession___block_invoke;
  v7[3] = &unk_264283298;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __71__MEExtensionHostContext_regenerateEmailAddressTokenChangesForSession___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) composeExtensionHostDelegate];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) _UUID];
  [v4 regenerateEmailAddressTokenChangesForSession:v2 forContextUUID:v3];
}

- (void)regenerateSecurityStatusInformationForSession:(id)a3
{
  id v4 = a3;
  v5 = +[MEExtensionHostContext extensionHostRequestScheduler];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__MEExtensionHostContext_regenerateSecurityStatusInformationForSession___block_invoke;
  v7[3] = &unk_264283298;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __72__MEExtensionHostContext_regenerateSecurityStatusInformationForSession___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) composeExtensionHostDelegate];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) _UUID];
  [v4 regenerateSecurityStatusInformationForSession:v2 forContextUUID:v3];
}

- (MEMailComposeExtensionHostDelegate)composeExtensionHostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeExtensionHostDelegate);
  return (MEMailComposeExtensionHostDelegate *)WeakRetained;
}

- (void)setComposeExtensionHostDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end