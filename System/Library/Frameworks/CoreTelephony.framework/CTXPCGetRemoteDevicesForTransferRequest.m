@interface CTXPCGetRemoteDevicesForTransferRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetRemoteDevicesForTransferRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__CTXPCGetRemoteDevicesForTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262D50;
  id v8 = v5;
  id v6 = v5;
  [a3 getRemoteDevicesForTransferWithCompletion:v7];
}

void __87__CTXPCGetRemoteDevicesForTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [[CTXPCGetRemoteDevicesForTransferResponse alloc] initWithDevices:v8];
  (*(void (**)(uint64_t, CTXPCGetRemoteDevicesForTransferResponse *, id))(v6 + 16))(v6, v7, v5);
}

- (int)requiredEntitlement
{
  return 3;
}

@end