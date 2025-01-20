@interface CTXPCResetProximityTransportExtensionRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCResetProximityTransportExtensionRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__CTXPCResetProximityTransportExtensionRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5260CB8;
  id v8 = v5;
  id v6 = v5;
  [a3 resetProximityTransportExtension:v7];
}

uint64_t __92__CTXPCResetProximityTransportExtensionRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 25;
}

@end