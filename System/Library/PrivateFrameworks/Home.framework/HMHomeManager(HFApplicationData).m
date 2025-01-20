@interface HMHomeManager(HFApplicationData)
- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:;
@end

@implementation HMHomeManager(HFApplicationData)

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__HMHomeManager_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v10[3] = &unk_264098E58;
  char v12 = a4;
  id v11 = v8;
  id v9 = v8;
  [a1 updateApplicationData:a3 completionHandler:v10];
}

@end