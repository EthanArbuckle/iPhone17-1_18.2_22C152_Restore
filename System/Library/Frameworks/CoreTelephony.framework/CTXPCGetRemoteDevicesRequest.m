@interface CTXPCGetRemoteDevicesRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetRemoteDevicesRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__CTXPCGetRemoteDevicesRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262D50;
  id v8 = v5;
  id v6 = v5;
  [a3 getRemoteDevices:v7];
}

void __76__CTXPCGetRemoteDevicesRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[CTXPCGetRemoteDevicesResponse alloc] initWithList:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

@end