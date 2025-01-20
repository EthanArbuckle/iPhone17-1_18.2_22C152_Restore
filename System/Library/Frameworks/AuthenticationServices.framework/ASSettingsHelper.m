@interface ASSettingsHelper
+ (void)openCredentialProviderAppSettingsWithCompletionHandler:(void *)completionHandler;
+ (void)openVerificationCodeAppSettingsWithCompletionHandler:(void *)completionHandler;
+ (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3;
@end

@implementation ASSettingsHelper

+ (void)openCredentialProviderAppSettingsWithCompletionHandler:(void *)completionHandler
{
  v3 = completionHandler;
  id v4 = objc_alloc_init(MEMORY[0x263F293B0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ASSettingsHelper_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264396918;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 openCredentialProviderAppSettingsWithCompletionHandler:v7];
}

uint64_t __75__ASSettingsHelper_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)openVerificationCodeAppSettingsWithCompletionHandler:(void *)completionHandler
{
  v3 = completionHandler;
  id v4 = objc_alloc_init(MEMORY[0x263F293B0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__ASSettingsHelper_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264396918;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 openVerificationCodeAppSettingsWithCompletionHandler:v7];
}

uint64_t __73__ASSettingsHelper_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F293B0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__ASSettingsHelper_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke;
  v7[3] = &unk_264396B68;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 requestToTurnOnCredentialProviderExtensionWithCompletionHandler:v7];
}

uint64_t __84__ASSettingsHelper_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end