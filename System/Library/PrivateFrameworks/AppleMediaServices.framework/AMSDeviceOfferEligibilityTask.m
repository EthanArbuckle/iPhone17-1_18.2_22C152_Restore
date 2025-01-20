@interface AMSDeviceOfferEligibilityTask
- (AMSBagProtocol)bag;
- (AMSDeviceOfferEligibilityTask)initWithBag:(id)a3 deviceGUID:(id)a4 masterSerialNumber:(id)a5 urlSession:(id)a6;
- (AMSURLSession)urlSession;
- (NSString)deviceGUID;
- (NSString)masterSerialNumber;
- (id)_accountEligibilityEncoderWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
- (id)_accountEligibilityRequestParametersWithIdentifiers:(id)a3;
- (id)_deviceEligibilityEncoderWithBag:(id)a3 clientInfo:(id)a4;
- (id)_deviceEligibilityRequestParametersWithGroups:(id)a3;
- (id)_eligibilityRequest;
- (id)_offersDecodedFromResult:(id)a3;
- (id)performAccountEligibility:(id)a3 forOffers:(id)a4 clientInfo:(id)a5;
- (id)performAnonymousDeviceEligibility:(id)a3 clientInfo:(id)a4;
- (void)setBag:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation AMSDeviceOfferEligibilityTask

- (AMSDeviceOfferEligibilityTask)initWithBag:(id)a3 deviceGUID:(id)a4 masterSerialNumber:(id)a5 urlSession:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSDeviceOfferEligibilityTask;
  v15 = [(AMSDeviceOfferEligibilityTask *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bag, a3);
    objc_storeStrong((id *)&v16->_deviceGUID, a4);
    objc_storeStrong((id *)&v16->_urlSession, a6);
    objc_storeStrong((id *)&v16->_masterSerialNumber, a5);
  }

  return v16;
}

- (id)performAnonymousDeviceEligibility:(id)a3 clientInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing anonymous device eligibility check.", buf, 0x16u);
    }
    id v12 = [(AMSDeviceOfferEligibilityTask *)self _eligibilityRequest];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke;
    v21[3] = &unk_1E55A1E88;
    v21[4] = self;
    id v22 = v7;
    id v23 = v6;
    id v13 = [v12 thenWithBlock:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_2;
    v20[3] = &unk_1E559E9C0;
    v20[4] = self;
    id v14 = [v13 thenWithBlock:v20];
  }
  else
  {
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      objc_super v18 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No registration groups for device eligibility check - preemptively returning", buf, 0x16u);
    }
    id v14 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v14;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 bag];
  id v6 = [v3 _deviceEligibilityEncoderWithBag:v5 clientInfo:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) _deviceEligibilityRequestParametersWithGroups:*(void *)(a1 + 48)];
  v8 = [v6 requestByEncodingRequest:v4 parameters:v7];

  return v8;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 urlSession];
  id v6 = [v5 dataTaskPromiseWithRequest:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_3;
  v9[3] = &unk_1E559F348;
  v9[4] = *(void *)(a1 + 32);
  id v7 = [v6 thenWithBlock:v9];

  return v7;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received anonymous device eligibility response.", (uint8_t *)&v11, 0x16u);
  }
  v8 = [*(id *)(a1 + 32) _offersDecodedFromResult:v3];

  v9 = +[AMSPromise promiseWithResult:v8];

  return v9;
}

- (id)_deviceEligibilityRequestParametersWithGroups:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_41);
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"companionDevices"];
  uint64_t v6 = [(AMSDeviceOfferEligibilityTask *)self masterSerialNumber];
  [v5 setObject:v6 forKeyedSubscript:@"serialNumber"];

  id v7 = [(AMSDeviceOfferEligibilityTask *)self deviceGUID];
  [v5 setObject:v7 forKeyedSubscript:@"guid"];

  v8 = (void *)[v5 copy];
  return v8;
}

id __79__AMSDeviceOfferEligibilityTask__deviceEligibilityRequestParametersWithGroups___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 registrationItems];

  v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_27);

  [v3 setObject:v5 forKeyedSubscript:@"deviceGroup"];
  return v3;
}

id __79__AMSDeviceOfferEligibilityTask__deviceEligibilityRequestParametersWithGroups___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 serialNumber];
  [v3 setObject:v4 forKeyedSubscript:@"serialNumber"];

  v5 = [v2 model];
  [v3 setObject:v5 forKeyedSubscript:@"productType"];

  uint64_t v6 = [v2 validationData];

  id v7 = [v6 base64EncodedStringWithOptions:0];
  [v3 setObject:v7 forKeyedSubscript:@"certificate"];

  v8 = (void *)[v3 copy];
  return v8;
}

- (id)_deviceEligibilityEncoderWithBag:(id)a3 clientInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AMSURLRequestEncoder alloc] initWithBag:v6];

  [(AMSURLRequestEncoder *)v7 setRequestEncoding:2];
  [(AMSURLRequestEncoder *)v7 setDialogOptions:1];
  v8 = AMSLogKey();
  [(AMSURLRequestEncoder *)v7 setLogUUID:v8];

  [(AMSURLRequestEncoder *)v7 setEnableRemoteSecuritySigning:1];
  if (v5) {
    [(AMSURLRequestEncoder *)v7 setClientInfo:v5];
  }

  return v7;
}

- (id)performAccountEligibility:(id)a3 forOffers:(id)a4 clientInfo:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    int v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      int v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v13;
      __int16 v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing account eligibility check against device offers.", buf, 0x16u);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = objc_msgSend(v9, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_32);
    uint64_t v17 = [v15 setWithArray:v16];

    objc_super v18 = [(AMSDeviceOfferEligibilityTask *)self _eligibilityRequest];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_2;
    v28[3] = &unk_1E55A1EF0;
    v28[4] = self;
    id v29 = v8;
    id v30 = v10;
    id v31 = v17;
    id v19 = v17;
    v20 = [v18 thenWithBlock:v28];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_3;
    v27[3] = &unk_1E559E9C0;
    v27[4] = self;
    v21 = [v20 thenWithBlock:v27];
  }
  else
  {
    id v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    id v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] There are no offers to verify eligibility for - skipping account eligibility verification.", buf, 0x16u);
    }
    v21 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v21;
}

uint64_t __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 offerIdentifier];
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 bag];
  id v6 = [v3 _accountEligibilityEncoderWithBag:v5 account:*(void *)(a1 + 40) clientInfo:*(void *)(a1 + 48)];

  id v7 = [*(id *)(a1 + 32) _accountEligibilityRequestParametersWithIdentifiers:*(void *)(a1 + 56)];
  id v8 = [v6 requestByEncodingRequest:v4 parameters:v7];

  return v8;
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 urlSession];
  id v6 = [v5 dataTaskPromiseWithRequest:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_4;
  v9[3] = &unk_1E559F348;
  v9[4] = *(void *)(a1 + 32);
  id v7 = [v6 thenWithBlock:v9];

  return v7;
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received account eligibility response", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) _offersDecodedFromResult:v3];

  id v9 = +[AMSPromise promiseWithResult:v8];

  return v9;
}

- (id)_accountEligibilityRequestParametersWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [v4 allObjects];
    [v5 setObject:v6 forKeyedSubscript:@"services"];

    id v7 = [(AMSDeviceOfferEligibilityTask *)self masterSerialNumber];
    [v5 setObject:v7 forKeyedSubscript:@"serialNumber"];

    id v8 = [(AMSDeviceOfferEligibilityTask *)self deviceGUID];
    [v5 setObject:v8 forKeyedSubscript:@"guid"];

    id v9 = (void *)[v5 copy];
  }
  else
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    int v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      __int16 v13 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      objc_super v18 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offer identifiers need account eligibility verification.", (uint8_t *)&v15, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_accountEligibilityEncoderWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8 = a4;
  id v9 = [(AMSDeviceOfferEligibilityTask *)self _deviceEligibilityEncoderWithBag:a3 clientInfo:a5];
  [v9 setAccount:v8];

  return v9;
}

- (id)_offersDecodedFromResult:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  uint64_t v6 = [v5 objectForKeyedSubscript:@"offers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__AMSDeviceOfferEligibilityTask__offersDecodedFromResult___block_invoke;
  v10[3] = &unk_1E55A1F18;
  v10[4] = self;
  id v8 = objc_msgSend(v7, "ams_mapWithTransform:", v10);

  return v8;
}

AMSDeviceOffer *__58__AMSDeviceOfferEligibilityTask__offersDecodedFromResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Decoding %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [[AMSDeviceOffer alloc] initWithDictionary:v2];

  return v7;
}

- (id)_eligibilityRequest
{
  id v2 = [(AMSDeviceOfferEligibilityTask *)self bag];
  id v3 = [v2 URLForKey:@"deviceOffersAnonymousEligibilityURL"];

  id v4 = [v3 valuePromise];
  uint64_t v5 = [v4 thenWithBlock:&__block_literal_global_42_0];

  return v5;
}

id __52__AMSDeviceOfferEligibilityTask__eligibilityRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F18D50];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithURL:v3];

  [v4 setHTTPMethod:@"POST"];
  uint64_t v5 = (void *)[v4 copy];
  uint64_t v6 = +[AMSPromise promiseWithResult:v5];

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSString)masterSerialNumber
{
  return self->_masterSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterSerialNumber, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end