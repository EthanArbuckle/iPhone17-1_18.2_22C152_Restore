@interface SKArcadeService
+ (void)arcadeSubscriptionStatusWithNonce:(uint64_t)nonce resultHandler:(void *)resultHandler;
+ (void)registerArcadeAppWithRandomFromLib:(NSData *)randomFromLib randomFromLibLength:(uint32_t)randomFromLibLength resultHandler:(void *)resultHandler;
+ (void)repairArcadeApp;
@end

@implementation SKArcadeService

+ (void)registerArcadeAppWithRandomFromLib:(NSData *)randomFromLib randomFromLibLength:(uint32_t)randomFromLibLength resultHandler:(void *)resultHandler
{
  uint64_t v5 = *(void *)&randomFromLibLength;
  v7 = resultHandler;
  v8 = randomFromLib;
  v9 = +[SKServiceBroker defaultBroker];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__SKArcadeService_registerArcadeAppWithRandomFromLib_randomFromLibLength_resultHandler___block_invoke;
  v12[3] = &unk_1E5FA9E30;
  id v13 = v7;
  id v10 = v7;
  v11 = [v9 storeKitServiceWithErrorHandler:v12];

  [v11 registerArcadeAppWithRandomFromLib:v8 randomFromLibLength:v5 resultHandler:v10];
}

uint64_t __88__SKArcadeService_registerArcadeAppWithRandomFromLib_randomFromLibLength_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)arcadeSubscriptionStatusWithNonce:(uint64_t)nonce resultHandler:(void *)resultHandler
{
  uint64_t v5 = resultHandler;
  v6 = +[SKServiceBroker defaultBroker];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SKArcadeService_arcadeSubscriptionStatusWithNonce_resultHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v5;
  id v7 = v5;
  v8 = [v6 storeKitServiceWithErrorHandler:v9];

  [v8 arcadeSubscriptionStatusWithNonce:nonce resultHandler:v7];
}

uint64_t __67__SKArcadeService_arcadeSubscriptionStatusWithNonce_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)repairArcadeApp
{
  v2 = +[SKServiceBroker defaultBroker];
  id v3 = [v2 storeKitServiceWithErrorHandler:0];

  [v3 repairArcadeApp];
}

@end