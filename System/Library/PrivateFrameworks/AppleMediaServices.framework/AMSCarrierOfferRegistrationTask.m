@interface AMSCarrierOfferRegistrationTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)invalidParameterError:(id)a3;
+ (id)pollingIntervalFromBag:(id)a3;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 checkOfferRequestEncoder:(id)a6 deviceGUID:(id)a7 msisdn:(id)a8 pacTokenPromise:(id)a9 privacyMappingResolver:(Class)a10 registrationRequestEncoder:(id)a11 urlSession:(id)a12;
- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 deviceGUID:(id)a6 msisdn:(id)a7;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)pacTokenPromise;
- (AMSURLRequestEncoder)checkOfferRequestEncoder;
- (AMSURLRequestEncoder)registrationRequestEncoder;
- (AMSURLSession)urlSession;
- (Class)privacyMappingResolver;
- (NSArray)carriers;
- (NSString)deviceGUID;
- (NSString)msisdn;
- (id)_allowedServiceIdentifiersFromPrivacyMapping:(id)a3;
- (id)_checkOffersBodyLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_checkOffersRequestLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_evaluationRequiredPrivacyMappingPair;
- (id)_hasOffersLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_includesAllowedCarrier;
- (id)_pacToken;
- (id)_parseCheckOffersResult:(id)a3;
- (id)_performRegistrationFlowLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_registrationBodyLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)_registrationRequestLimitedByAllowedServiceIdentifiers:(id)a3;
- (id)perform;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSCarrierOfferRegistrationTask

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[AMSDevice carrierNames];
  v8 = [[AMSURLRequestEncoder alloc] initWithBag:v5];
  v9 = +[AMSDevice deviceGUID];
  v10 = +[AMSDevice phoneNumber];
  v11 = +[AMSDevice voicePreferredPACToken];
  uint64_t v12 = objc_opt_class();
  v13 = [[AMSURLRequestEncoder alloc] initWithBag:v5];
  v14 = +[AMSURLSession defaultSession];
  v15 = [(AMSCarrierOfferRegistrationTask *)self initWithAccount:v6 bag:v5 carriers:v7 checkOfferRequestEncoder:v8 deviceGUID:v9 msisdn:v10 pacTokenPromise:v11 privacyMappingResolver:v12 registrationRequestEncoder:v13 urlSession:v14];

  return v15;
}

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 deviceGUID:(id)a6 msisdn:(id)a7
{
  id v26 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v24 = v12;
  if (!v12)
  {
    v24 = +[AMSDevice carrierNames];
  }
  v25 = [[AMSURLRequestEncoder alloc] initWithBag:v11];
  v15 = v13;
  if (v13)
  {
    if (v14)
    {
LABEL_5:
      v16 = 0;
      v17 = v14;
      goto LABEL_8;
    }
  }
  else
  {
    v15 = +[AMSDevice deviceGUID];
    if (v14) {
      goto LABEL_5;
    }
  }
  v17 = +[AMSDevice phoneNumber];
  v16 = +[AMSDevice voicePreferredPACToken];
LABEL_8:
  uint64_t v18 = objc_opt_class();
  v19 = [[AMSURLRequestEncoder alloc] initWithBag:v11];
  v20 = +[AMSURLSession defaultSession];
  v21 = [(AMSCarrierOfferRegistrationTask *)self initWithAccount:v26 bag:v11 carriers:v24 checkOfferRequestEncoder:v25 deviceGUID:v15 msisdn:v17 pacTokenPromise:v16 privacyMappingResolver:v18 registrationRequestEncoder:v19 urlSession:v20];

  if (v14)
  {
    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_10;
    }
  }

LABEL_10:
  if (!v12) {

  }
  return v21;
}

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 checkOfferRequestEncoder:(id)a6 deviceGUID:(id)a7 msisdn:(id)a8 pacTokenPromise:(id)a9 privacyMappingResolver:(Class)a10 registrationRequestEncoder:(id)a11 urlSession:(id)a12
{
  id v18 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v26 = a7;
  id v28 = a7;
  id v27 = a8;
  id v19 = a9;
  id v20 = a11;
  id v21 = a12;
  v32.receiver = self;
  v32.super_class = (Class)AMSCarrierOfferRegistrationTask;
  v22 = [(AMSTask *)&v32 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_account, a3);
    objc_storeStrong((id *)&v23->_bag, a4);
    objc_storeStrong((id *)&v23->_carriers, a5);
    objc_storeStrong((id *)&v23->_checkOfferRequestEncoder, a6);
    objc_storeStrong((id *)&v23->_deviceGUID, v26);
    objc_storeStrong((id *)&v23->_msisdn, a8);
    objc_storeStrong((id *)&v23->_pacTokenPromise, a9);
    objc_storeStrong((id *)&v23->_privacyMappingResolver, a10);
    objc_storeStrong((id *)&v23->_registrationRequestEncoder, a11);
    objc_storeStrong((id *)&v23->_urlSession, a12);
  }

  return v23;
}

- (id)perform
{
  uint64_t v3 = [(AMSCarrierOfferRegistrationTask *)self carriers];
  if (v3
    && (v4 = (void *)v3,
        [(AMSCarrierOfferRegistrationTask *)self carriers],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v7 = [(AMSCarrierOfferRegistrationTask *)self msisdn];

    if (v7)
    {
      v8 = [(AMSCarrierOfferRegistrationTask *)self deviceGUID];

      if (v8)
      {
        v9 = [(AMSCarrierOfferRegistrationTask *)self account];

        if (v9)
        {
          v10 = [(AMSCarrierOfferRegistrationTask *)self _evaluationRequiredPrivacyMappingPair];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __42__AMSCarrierOfferRegistrationTask_perform__block_invoke;
          v15[3] = &unk_1E55A0EB0;
          v15[4] = self;
          id v11 = [v10 thenWithBlock:v15];
          goto LABEL_9;
        }
        id v11 = objc_opt_new();
        id v12 = objc_opt_class();
        id v13 = @"Task is missing account";
      }
      else
      {
        id v11 = objc_opt_new();
        id v12 = objc_opt_class();
        id v13 = @"Task is missing device GUID";
      }
    }
    else
    {
      id v11 = objc_opt_new();
      id v12 = objc_opt_class();
      id v13 = @"Task is missing a phone number/msisdn";
    }
  }
  else
  {
    id v11 = objc_opt_new();
    id v12 = objc_opt_class();
    id v13 = @"Task is missing carrier names";
  }
  v10 = [v12 invalidParameterError:v13];
  [v11 finishWithError:v10];
LABEL_9:

  return v11;
}

id __42__AMSCarrierOfferRegistrationTask_perform__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 first];
  if ([v4 BOOLValue])
  {
    id v5 = [v3 second];

    if (v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v6)
      {
        uint64_t v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = objc_opt_class();
        v9 = AMSLogKey();
        v10 = [v3 second];
        int v27 = 138543874;
        uint64_t v28 = v8;
        __int16 v29 = 2114;
        id v30 = v9;
        __int16 v31 = 2114;
        objc_super v32 = v10;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Privacy requirements found: %{public}@", (uint8_t *)&v27, 0x20u);
      }
      id v11 = (void *)MEMORY[0x1E4F1CAA0];
      id v12 = *(void **)(a1 + 32);
      id v13 = [v3 second];
      id v14 = [v12 _allowedServiceIdentifiersFromPrivacyMapping:v13];
      v15 = [v11 orderedSetWithSet:v14];

      if ([v15 count])
      {
        v16 = +[AMSLogConfig sharedPrivacyConfig];
        if (!v16)
        {
          v16 = +[AMSLogConfig sharedConfig];
        }
        v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = objc_opt_class();
          id v19 = AMSLogKey();
          int v27 = 138543874;
          uint64_t v28 = v18;
          __int16 v29 = 2114;
          id v30 = v19;
          __int16 v31 = 2114;
          objc_super v32 = v15;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lobs qualifying: %{public}@", (uint8_t *)&v27, 0x20u);
        }
        id v20 = [*(id *)(a1 + 32) _performRegistrationFlowLimitedByAllowedServiceIdentifiers:v15];
      }
      else
      {
        v25 = AMSError(6, @"Short circuiting carrier registration", @"No LoBs meet criteria for inclusion", 0);
        id v20 = +[AMSPromise promiseWithError:v25];
      }
      goto LABEL_21;
    }
  }
  else
  {
  }
  id v21 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v21)
  {
    id v21 = +[AMSLogConfig sharedConfig];
  }
  v22 = [v21 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_opt_class();
    v24 = AMSLogKey();
    int v27 = 138543618;
    uint64_t v28 = v23;
    __int16 v29 = 2114;
    id v30 = v24;
    _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No additional privacy reqs", (uint8_t *)&v27, 0x16u);
  }
  id v20 = [*(id *)(a1 + 32) _performRegistrationFlowLimitedByAllowedServiceIdentifiers:0];
LABEL_21:

  return v20;
}

+ (id)pollingIntervalFromBag:(id)a3
{
  id v3 = [a3 doubleForKey:@"channelOfferCheckFrequency"];
  v4 = [v3 valuePromise];
  id v5 = [v4 thenWithBlock:&__block_literal_global_28];

  return v5;
}

id __58__AMSCarrierOfferRegistrationTask_pollingIntervalFromBag___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [a2 doubleValue];
  v4 = [v2 numberWithDouble:v3 * 3600.0];
  id v5 = +[AMSPromise promiseWithResult:v4];

  return v5;
}

- (id)_performRegistrationFlowLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__AMSCarrierOfferRegistrationTask__performRegistrationFlowLimitedByAllowedServiceIdentifiers___block_invoke;
  v8[3] = &unk_1E55A0ED8;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(AMSTask *)self performTaskWithBlock:v8];

  return v6;
}

id __94__AMSCarrierOfferRegistrationTask__performRegistrationFlowLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) _includesAllowedCarrier];
  id v50 = 0;
  id v5 = [v4 resultWithError:&v50];
  id v6 = v50;

  if (v6)
  {
    v7 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      id v11 = [*(id *)(a1 + 32) carriers];
      id v12 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v52 = v9;
      __int16 v53 = 2114;
      v54 = v10;
      __int16 v55 = 2114;
      v56 = v11;
      __int16 v57 = 2114;
      v58 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Qualification check failed for carrier(s) %{public}@. Error: %{public}@.", buf, 0x2Au);
    }
    id v13 = 0;
    *a2 = v6;
  }
  else if ([v5 BOOLValue])
  {
    id v14 = [*(id *)(a1 + 32) _hasOffersLimitedByAllowedServiceIdentifiers:*(void *)(a1 + 40)];
    id v49 = 0;
    v15 = [v14 resultWithError:&v49];
    id v16 = v49;

    if (v16)
    {
      v17 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v17)
      {
        v17 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        AMSLogKey();
        id v20 = v47 = v15;
        id v21 = [*(id *)(a1 + 32) msisdn];
        v22 = AMSLogableError(v16);
        *(_DWORD *)buf = 138544130;
        uint64_t v52 = v19;
        __int16 v53 = 2114;
        v54 = v20;
        __int16 v55 = 2114;
        v56 = v21;
        __int16 v57 = 2114;
        v58 = v22;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to check offers for msisdn %{public}@. Error: %{public}@.", buf, 0x2Au);

        v15 = v47;
      }

      id v13 = 0;
      *a2 = v16;
    }
    else if ([v15 BOOLValue])
    {
      uint64_t v28 = [*(id *)(a1 + 32) _registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers:*(void *)(a1 + 40)];
      id v48 = 0;
      uint64_t v29 = [v28 resultWithError:&v48];
      id v30 = v48;

      uint64_t v31 = +[AMSLogConfig sharedPrivacyConfig];
      objc_super v32 = (void *)v31;
      if (v30)
      {
        if (!v31)
        {
          objc_super v32 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v33 = [v32 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = objc_opt_class();
          v35 = AMSLogKey();
          AMSLogableError(v30);
          v37 = v36 = v15;
          *(_DWORD *)buf = 138543874;
          uint64_t v52 = v34;
          __int16 v53 = 2114;
          v54 = v35;
          __int16 v55 = 2114;
          v56 = v37;
          _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Registration failed. Error: %{public}@.", buf, 0x20u);

          v15 = v36;
          id v16 = 0;
        }
        id v13 = 0;
        *a2 = v30;
      }
      else
      {
        if (!v31)
        {
          objc_super v32 = +[AMSLogConfig sharedConfig];
        }
        v43 = [v32 OSLogObject];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = objc_opt_class();
          v45 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v52 = v44;
          __int16 v53 = 2114;
          v54 = v45;
          __int16 v55 = 1024;
          LODWORD(v56) = v29;
          _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration succeeded: %d", buf, 0x1Cu);
        }
        id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v29];
      }
    }
    else
    {
      v38 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v38)
      {
        v38 = +[AMSLogConfig sharedConfig];
      }
      v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = objc_opt_class();
        v41 = AMSLogKey();
        v42 = [*(id *)(a1 + 32) msisdn];
        *(_DWORD *)buf = 138543874;
        uint64_t v52 = v40;
        __int16 v53 = 2114;
        v54 = v41;
        __int16 v55 = 2114;
        v56 = v42;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offers for msisdn %{public}@", buf, 0x20u);
      }
      id v13 = (void *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    uint64_t v23 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v23)
    {
      uint64_t v23 = +[AMSLogConfig sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_opt_class();
      id v26 = AMSLogKey();
      int v27 = [*(id *)(a1 + 32) carriers];
      *(_DWORD *)buf = 138543874;
      uint64_t v52 = v25;
      __int16 v53 = 2114;
      v54 = v26;
      __int16 v55 = 2114;
      v56 = v27;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Carrier(s) do not qualify: %{public}@", buf, 0x20u);
    }
    id v13 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v13;
}

- (id)_checkOffersRequestLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSCarrierOfferRegistrationTask *)self checkOfferRequestEncoder];
  [v5 setRequestEncoding:3];

  id v6 = [(AMSCarrierOfferRegistrationTask *)self clientInfo];
  v7 = [(AMSCarrierOfferRegistrationTask *)self checkOfferRequestEncoder];
  [v7 setClientInfo:v6];

  uint64_t v8 = [(AMSCarrierOfferRegistrationTask *)self _checkOffersBodyLimitedByAllowedServiceIdentifiers:v4];

  uint64_t v9 = [(AMSCarrierOfferRegistrationTask *)self bag];
  v10 = [v9 URLForKey:@"checkChannelOffers"];

  id v11 = [(AMSCarrierOfferRegistrationTask *)self checkOfferRequestEncoder];
  id v12 = [v11 requestWithMethod:4 bagURL:v10 parameters:v8];

  return v12;
}

- (id)_hasOffersLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSCarrierOfferRegistrationTask *)self urlSession];
  id v6 = [(AMSCarrierOfferRegistrationTask *)self _checkOffersRequestLimitedByAllowedServiceIdentifiers:v4];

  v7 = [v5 dataTaskPromiseWithRequestPromise:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__AMSCarrierOfferRegistrationTask__hasOffersLimitedByAllowedServiceIdentifiers___block_invoke;
  v10[3] = &unk_1E559F348;
  v10[4] = self;
  uint64_t v8 = [v7 thenWithBlock:v10];

  return v8;
}

id __80__AMSCarrierOfferRegistrationTask__hasOffersLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _parseCheckOffersResult:a2];
  double v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

- (id)_includesAllowedCarrier
{
  double v3 = objc_opt_new();
  id v4 = [(AMSCarrierOfferRegistrationTask *)self bag];
  id v5 = [v4 arrayForKey:@"channelSupportedCarriers"];
  id v6 = [v5 valuePromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__AMSCarrierOfferRegistrationTask__includesAllowedCarrier__block_invoke;
  v10[3] = &unk_1E559EB58;
  id v7 = v3;
  id v11 = v7;
  id v12 = self;
  [v6 addFinishBlock:v10];

  id v8 = v7;
  return v8;
}

void __58__AMSCarrierOfferRegistrationTask__includesAllowedCarrier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    if (a2) {
      uint64_t v5 = a2;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F1CBF0];
    }
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [*(id *)(a1 + 40) carriers];
    uint64_t v9 = [v7 setWithArray:v8];

    uint64_t v10 = [v9 intersectsSet:v6];
    id v11 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSLogKey();
      int v17 = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v14;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Qualification result: %i", (uint8_t *)&v17, 0x1Cu);
    }
    v15 = *(void **)(a1 + 32);
    id v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
    [v15 finishWithResult:v16];
  }
}

- (id)_checkOffersBodyLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(AMSCarrierOfferRegistrationTask *)self msisdn];
  [v5 setObject:v6 forKeyedSubscript:@"msisdn"];

  id v7 = [v4 array];

  [v5 setObject:v7 forKeyedSubscript:@"validLobs"];
  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)_pacToken
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  id v4 = [(AMSCarrierOfferRegistrationTask *)self pacTokenPromise];

  if (v4)
  {
    objc_initWeak((id *)location, self);
    uint64_t v5 = [(AMSCarrierOfferRegistrationTask *)self pacTokenPromise];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__AMSCarrierOfferRegistrationTask__pacToken__block_invoke;
    v12[3] = &unk_1E55A0F00;
    objc_copyWeak(&v14, (id *)location);
    id v13 = v3;
    [v5 addFinishBlock:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v6 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v8;
      __int16 v16 = 2114;
      int v17 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No PAC token available", location, 0x16u);
    }
    uint64_t v10 = +[AMSOptional optionalWithNil];
    [v3 finishWithResult:v10];
  }
  return v3;
}

void __44__AMSCarrierOfferRegistrationTask__pacToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    uint64_t v8 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      id v12 = AMSLogableError(v6);
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not retrieve PAC. Error: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = +[AMSOptional optionalWithNil];
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = +[AMSOptional optionalWithValue:v5];
  }
  v15 = (void *)v14;
  [v13 finishWithResult:v14];
}

- (id)_parseCheckOffersResult:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [v5 objectForKeyedSubscript:@"msisdnsWithOffer"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v9 = [(AMSCarrierOfferRegistrationTask *)self msisdn];
  uint64_t v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v7, "containsObject:", v9));

  return v10;
}

- (id)_registrationBodyLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [(AMSCarrierOfferRegistrationTask *)self msisdn];
  [v6 setObject:v7 forKeyedSubscript:@"msisdn"];

  uint64_t v8 = [(AMSCarrierOfferRegistrationTask *)self deviceGUID];
  [v6 setObject:v8 forKeyedSubscript:@"guid"];

  uint64_t v9 = [v4 array];

  [v6 setObject:v9 forKeyedSubscript:@"lobs"];
  uint64_t v10 = [(AMSCarrierOfferRegistrationTask *)self _pacToken];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__AMSCarrierOfferRegistrationTask__registrationBodyLimitedByAllowedServiceIdentifiers___block_invoke;
  v14[3] = &unk_1E55A0F28;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v10 thenWithBlock:v14];

  return v12;
}

AMSPromise *__87__AMSCarrierOfferRegistrationTask__registrationBodyLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 value];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"pac"];

  uint64_t v4 = *(void *)(a1 + 32);
  return +[AMSPromise promiseWithResult:v4];
}

- (id)_registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(AMSCarrierOfferRegistrationTask *)self urlSession];
  id v7 = [(AMSCarrierOfferRegistrationTask *)self _registrationRequestLimitedByAllowedServiceIdentifiers:v4];

  uint64_t v8 = [v6 dataTaskPromiseWithRequestPromise:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__AMSCarrierOfferRegistrationTask__registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers___block_invoke;
  v11[3] = &unk_1E55A0F50;
  id v9 = v5;
  id v12 = v9;
  [v8 addFinishBlock:v11];

  return v9;
}

uint64_t __101__AMSCarrierOfferRegistrationTask__registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithSuccess];
  }
}

- (id)_evaluationRequiredPrivacyMappingPair
{
  double v3 = objc_opt_new();
  id v4 = [(AMSCarrierOfferRegistrationTask *)self bag];
  id v5 = [v4 dictionaryForKey:@"channelRegisterPrivacyMapping"];

  id v6 = [v5 valuePromise];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__AMSCarrierOfferRegistrationTask__evaluationRequiredPrivacyMappingPair__block_invoke;
  v9[3] = &unk_1E55A0F78;
  id v7 = v3;
  id v10 = v7;
  [v6 addFinishBlock:v9];

  return v7;
}

void __72__AMSCarrierOfferRegistrationTask__evaluationRequiredPrivacyMappingPair__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v14 = [AMSPair alloc];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    id v11 = v14;
    id v12 = v10;
    id v13 = v16;
    goto LABEL_5;
  }
  uint64_t v7 = [v5 code];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7 == 204)
  {
    id v9 = [AMSPair alloc];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    id v11 = v9;
    id v12 = v10;
    id v13 = 0;
LABEL_5:
    id v15 = [(AMSPair *)v11 initWithFirst:v12 second:v13];
    [v8 finishWithResult:v15];

    goto LABEL_7;
  }
  [v8 finishWithError:v6];
LABEL_7:
}

- (id)_allowedServiceIdentifiersFromPrivacyMapping:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSCarrierOfferRegistrationTask *)self privacyMappingResolver];
  id v6 = [(AMSCarrierOfferRegistrationTask *)self account];
  uint64_t v7 = [(objc_class *)v5 allowedIdentifiersFrom:v4 forAccount:v6];

  return v7;
}

- (id)_registrationRequestLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSCarrierOfferRegistrationTask *)self registrationRequestEncoder];
  [v5 setRequestEncoding:3];

  id v6 = [(AMSCarrierOfferRegistrationTask *)self account];
  uint64_t v7 = [(AMSCarrierOfferRegistrationTask *)self registrationRequestEncoder];
  [v7 setAccount:v6];

  uint64_t v8 = [(AMSCarrierOfferRegistrationTask *)self clientInfo];
  id v9 = [(AMSCarrierOfferRegistrationTask *)self registrationRequestEncoder];
  [v9 setClientInfo:v8];

  id v10 = [(AMSCarrierOfferRegistrationTask *)self _registrationBodyLimitedByAllowedServiceIdentifiers:v4];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__AMSCarrierOfferRegistrationTask__registrationRequestLimitedByAllowedServiceIdentifiers___block_invoke;
  v13[3] = &unk_1E55A0FA0;
  v13[4] = self;
  id v11 = [v10 thenWithBlock:v13];

  return v11;
}

id __90__AMSCarrierOfferRegistrationTask__registrationRequestLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 bag];
  id v6 = [v5 URLForKey:@"channelRegisterPhoneNumber"];

  uint64_t v7 = [*(id *)(a1 + 32) registrationRequestEncoder];
  uint64_t v8 = [v7 requestWithMethod:4 bagURL:v6 parameters:v4];

  return v8;
}

+ (id)invalidParameterError:(id)a3
{
  return AMSError(2, @"Cannot perform carrier offer registration", a3, 0);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_6 != -1) {
    dispatch_once(&_MergedGlobals_1_6, &__block_literal_global_65);
  }
  v2 = (void *)qword_1EB38D0C8;
  return (NSString *)v2;
}

void __48__AMSCarrierOfferRegistrationTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D0C8;
  qword_1EB38D0C8 = @"AMSCarrierOfferRegistrationTask";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D0D0 != -1) {
    dispatch_once(&qword_1EB38D0D0, &__block_literal_global_70_0);
  }
  v2 = (void *)qword_1EB38D0D8;
  return (NSString *)v2;
}

void __55__AMSCarrierOfferRegistrationTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D0D8;
  qword_1EB38D0D8 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  double v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSArray)carriers
{
  return self->_carriers;
}

- (AMSURLRequestEncoder)checkOfferRequestEncoder
{
  return self->_checkOfferRequestEncoder;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)msisdn
{
  return self->_msisdn;
}

- (AMSURLRequestEncoder)registrationRequestEncoder
{
  return self->_registrationRequestEncoder;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (AMSPromise)pacTokenPromise
{
  return self->_pacTokenPromise;
}

- (Class)privacyMappingResolver
{
  return self->_privacyMappingResolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyMappingResolver, 0);
  objc_storeStrong((id *)&self->_pacTokenPromise, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_registrationRequestEncoder, 0);
  objc_storeStrong((id *)&self->_msisdn, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_checkOfferRequestEncoder, 0);
  objc_storeStrong((id *)&self->_carriers, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end