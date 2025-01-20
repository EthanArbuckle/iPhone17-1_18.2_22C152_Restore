@interface HMActionSet(HFApplicationData)
- (void)_hf_didUpdateApplicationData:()HFApplicationData;
- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:;
@end

@implementation HMActionSet(HFApplicationData)

- (void)_hf_didUpdateApplicationData:()HFApplicationData
{
  id v4 = a3;
  id v5 = [a1 applicationData];

  if (v5 == v4)
  {
    v6 = +[HFHomeKitDispatcher sharedDispatcher];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__HMActionSet_HFApplicationData___hf_didUpdateApplicationData___block_invoke;
    v7[3] = &unk_26408CDA0;
    v7[4] = a1;
    [v6 dispatchHomeObserverMessage:v7 sender:0];
  }
}

- (void)hf_updateApplicationData:()HFApplicationData handleError:completionHandler:
{
  id v8 = a3;
  id v9 = a5;
  objc_msgSend(a1, "_hf_didUpdateApplicationData:", v8);
  objc_initWeak(&location, a1);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__HMActionSet_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke;
  v11[3] = &unk_264098E30;
  v11[4] = a1;
  char v14 = a4;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  [a1 updateApplicationData:v8 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

@end