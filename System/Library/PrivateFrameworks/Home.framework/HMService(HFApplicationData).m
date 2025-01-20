@interface HMService(HFApplicationData)
- (void)_hf_applicationDataUpdated:()HFApplicationData;
- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:;
@end

@implementation HMService(HFApplicationData)

- (void)_hf_applicationDataUpdated:()HFApplicationData
{
  id v4 = a3;
  id v5 = [a1 applicationData];

  if (v5 == v4)
  {
    v6 = +[HFHomeKitDispatcher sharedDispatcher];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__HMService_HFApplicationData___hf_applicationDataUpdated___block_invoke;
    v7[3] = &unk_26408C938;
    v7[4] = a1;
    [v6 dispatchAccessoryObserverMessage:v7 sender:0];
  }
}

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8 = a3;
  id v9 = a5;
  objc_msgSend(a1, "_hf_applicationDataUpdated:", v8);
  objc_initWeak(&location, a1);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__HMService_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v12[3] = &unk_264098E80;
  v12[4] = a1;
  char v16 = a4;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v13 = v10;
  id v11 = v9;
  id v14 = v11;
  [a1 updateApplicationData:v10 completionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

@end