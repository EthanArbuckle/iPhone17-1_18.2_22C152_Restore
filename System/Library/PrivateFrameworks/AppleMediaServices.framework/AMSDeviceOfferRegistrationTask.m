@interface AMSDeviceOfferRegistrationTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDeviceOfferEligibilityTask)eligibilityTask;
- (AMSDeviceOfferRegistrationPrivacyValidator)privacyValidator;
- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 deviceGUID:(id)a5 deviceOffersStore:(id)a6 eligibilityTask:(id)a7 masterSerialNumber:(id)a8 privacyValidator:(id)a9 urlSession:(id)a10;
- (AMSDeviceOffersTracking)deviceOffersStore;
- (AMSProcessInfo)clientInfo;
- (AMSURLSession)urlSession;
- (BOOL)_isDeviceGroupRegistrationAllowed;
- (BOOL)_isEligibilityCallsAllowed;
- (BOOL)_isRegistrationAllowed;
- (BOOL)ignoreRegistrationDenyList;
- (BOOL)lightweightCheckOnly;
- (NSArray)registrationGroups;
- (NSSet)offerIdentifiers;
- (NSString)deviceGUID;
- (NSString)masterSerialNumber;
- (id)_accountEligibleSerialsFromDeviceOffers:(id)a3 accountOffers:(id)a4;
- (id)_bucketedOffers:(id)a3;
- (id)_companionSerialNumbers;
- (id)_deviceOffersURL;
- (id)_eligibilityQualifiedRegistrationGroupsWithAccount:(id)a3 pendingRegistrationGroups:(id)a4;
- (id)_filteredRegistrationGroups:(id)a3;
- (id)_handleRegistrationResult:(id)a3;
- (id)_latestDeviceGroups;
- (id)_latestOffersWithFetchedDeviceOffers:(id)a3 offersStore:(id)a4;
- (id)_lightweightDeviceOffersURL;
- (id)_offersDecodedFromResult:(id)a3;
- (id)_performLightweightRequestWithAccount:(id)a3;
- (id)_performRegistrationRequestWithAccount:(id)a3;
- (id)_registrationEndpointPOSTCompanionBodyWithDeviceGroups:(id)a3 companionSerialNumbers:(id)a4;
- (id)_registrationEndpointPOSTDeviceGroupsBody:(id)a3;
- (id)_registrationEndpointPOSTParametersWithRegistrationGroups:(id)a3 companionSerialNumbers:(id)a4;
- (id)_registrationGroupsFrom:(id)a3 matching:(id)a4;
- (id)_registrationRequestEncoderWithAccount:(id)a3;
- (id)_sanitizedResultPromise:(id)a3;
- (id)_serialNumberDenyList;
- (id)_urlRequestWithBagURL:(id)a3;
- (id)perform;
- (void)_updateWithDeviceOffers:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setIgnoreRegistrationDenyList:(BOOL)a3;
- (void)setLightweightCheckOnly:(BOOL)a3;
- (void)setOfferIdentifiers:(id)a3;
- (void)setRegistrationGroups:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation AMSDeviceOfferRegistrationTask

- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AMSDevice serialNumber];
  v9 = +[AMSDevice deviceGUID];
  v10 = objc_alloc_init(AMSDeviceOffersStore);
  v11 = +[AMSURLSession defaultSession];
  v12 = [[AMSDeviceOfferEligibilityTask alloc] initWithBag:v6 deviceGUID:v9 masterSerialNumber:v8 urlSession:v11];
  v13 = [[AMSDeviceOfferRegistrationPrivacyValidator alloc] initWithAccount:v7];
  v14 = +[AMSURLSession defaultSession];
  v15 = [(AMSDeviceOfferRegistrationTask *)self initWithAccount:v7 bag:v6 deviceGUID:v9 deviceOffersStore:v10 eligibilityTask:v12 masterSerialNumber:v8 privacyValidator:v13 urlSession:v14];

  return v15;
}

- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 deviceGUID:(id)a5 deviceOffersStore:(id)a6 eligibilityTask:(id)a7 masterSerialNumber:(id)a8 privacyValidator:(id)a9 urlSession:(id)a10
{
  id v17 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AMSDeviceOfferRegistrationTask;
  v19 = [(AMSTask *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_account, a3);
    objc_storeStrong((id *)&v20->_bag, a4);
    objc_storeStrong((id *)&v20->_deviceGUID, a5);
    objc_storeStrong((id *)&v20->_deviceOffersStore, a6);
    objc_storeStrong((id *)&v20->_eligibilityTask, a7);
    objc_storeStrong((id *)&v20->_masterSerialNumber, a8);
    objc_storeStrong((id *)&v20->_privacyValidator, a9);
    objc_storeStrong((id *)&v20->_urlSession, a10);
  }

  return v20;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AMSDeviceOfferRegistrationTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __41__AMSDeviceOfferRegistrationTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) masterSerialNumber];

  if (!v2)
  {
    v11 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      int v40 = 138543618;
      uint64_t v41 = v13;
      __int16 v42 = 2114;
      v43 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Registration cannot be performed: Missing serial number. Check entitlements", (uint8_t *)&v40, 0x16u);
    }
    v9 = @"Invalid Parameter";
    v10 = @"No serial number found for primary/master device";
    uint64_t v15 = 2;
    goto LABEL_31;
  }
  if (([*(id *)(a1 + 32) _isRegistrationAllowed] & 1) == 0)
  {
    v16 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      v19 = AMSLogKey();
      int v40 = 138543618;
      uint64_t v41 = v18;
      __int16 v42 = 2114;
      v43 = v19;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration temporarily disabled", (uint8_t *)&v40, 0x16u);
    }
    v9 = @"Action Denied";
    v10 = @"Registration is temporarily disabled";
    goto LABEL_30;
  }
  v3 = [*(id *)(a1 + 32) registrationGroups];
  if ([v3 count])
  {
    char v4 = [*(id *)(a1 + 32) _isDeviceGroupRegistrationAllowed];

    if ((v4 & 1) == 0)
    {
      v5 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v5)
      {
        v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = objc_opt_class();
        v8 = AMSLogKey();
        int v40 = 138543618;
        uint64_t v41 = v7;
        __int16 v42 = 2114;
        v43 = v8;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration temporarily disabled for task with device groups", (uint8_t *)&v40, 0x16u);
      }
      v9 = @"Action Denied";
      v10 = @"Registration is temporarily disabled for device group calls";
LABEL_30:
      uint64_t v15 = 11;
LABEL_31:
      id v23 = AMSError(v15, v9, v10, 0);
      uint64_t v30 = +[AMSPromise promiseWithError:v23];
LABEL_32:
      id v25 = (void *)v30;
      goto LABEL_33;
    }
  }
  else
  {
  }
  v20 = [*(id *)(a1 + 32) privacyValidator];
  char v21 = [v20 canMasterDevicePerformRegistration];

  if ((v21 & 1) == 0)
  {
    id v26 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v26)
    {
      id v26 = +[AMSLogConfig sharedConfig];
    }
    id v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_opt_class();
      v29 = AMSLogKey();
      int v40 = 138543618;
      uint64_t v41 = v28;
      __int16 v42 = 2114;
      v43 = v29;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Master device failed GDPR validation", (uint8_t *)&v40, 0x16u);
    }
    v9 = @"Action Denied";
    v10 = @"Master device lacks necessary GDPR acknowledgments";
    goto LABEL_30;
  }
  id v22 = [*(id *)(a1 + 32) account];
  if (v22)
  {
    id v23 = v22;
    if (objc_msgSend(v22, "ams_isLocalAccount"))
    {
      id v24 = AMSError(2, @"Invalid Parameter", @"We cannot use the local account to register and retrive device offers.", 0);
      id v25 = +[AMSPromise promiseWithError:v24];

      goto LABEL_33;
    }
    v33 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v33)
    {
      v33 = +[AMSLogConfig sharedConfig];
    }
    v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = objc_opt_class();
      v36 = AMSLogKey();
      v37 = AMSHashIfNeeded(v23);
      int v40 = 138543874;
      uint64_t v41 = v35;
      __int16 v42 = 2114;
      v43 = v36;
      __int16 v44 = 2114;
      v45 = v37;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting device offer registration task. account = %{public}@", (uint8_t *)&v40, 0x20u);
    }
    int v38 = [*(id *)(a1 + 32) lightweightCheckOnly];
    v39 = *(void **)(a1 + 32);
    if (v38) {
      [v39 _performLightweightRequestWithAccount:v23];
    }
    else {
    uint64_t v30 = [v39 _performRegistrationRequestWithAccount:v23];
    }
    goto LABEL_32;
  }
  v32 = AMSError(2, @"Invalid Parameter", @"No account specified for registering device offers", 0);
  id v25 = +[AMSPromise promiseWithError:v32];

  id v23 = 0;
LABEL_33:

  return v25;
}

- (id)_performLightweightRequestWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDeviceOfferRegistrationTask *)self _lightweightDeviceOffersURL];
  id v6 = [(AMSDeviceOfferRegistrationTask *)self _registrationRequestEncoderWithAccount:v4];

  uint64_t v7 = [(AMSDeviceOfferRegistrationTask *)self _urlRequestWithBagURL:v5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke;
  v15[3] = &unk_1E55A1FD0;
  id v16 = v6;
  id v8 = v6;
  v9 = [v7 thenWithBlock:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke_2;
  v14[3] = &unk_1E559E9C0;
  v14[4] = self;
  v10 = [v9 thenWithBlock:v14];
  v11 = [(AMSDeviceOfferRegistrationTask *)self _sanitizedResultPromise:v10];
  v12 = [(AMSDeviceOfferRegistrationTask *)self _handleRegistrationResult:v11];

  return v12;
}

id __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setHTTPMethod:@"GET"];
  id v4 = [*(id *)(a1 + 32) requestByEncodingRequest:v3 parameters:0];

  return v4;
}

id __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network component of registration request", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) urlSession];
  v9 = [v8 dataTaskPromiseWithRequest:v3];

  return v9;
}

- (id)_performRegistrationRequestWithAccount:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSDeviceOfferRegistrationTask *)self _latestDeviceGroups];
  uint64_t v6 = [(AMSDeviceOfferRegistrationTask *)self _filteredRegistrationGroups:v5];
  uint64_t v7 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
  v67 = (void *)v5;
  [v7 setCachedRegistrationGroups:v5];

  id v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [(AMSDeviceOfferRegistrationTask *)self _serialNumberDenyList];
  v10 = [v8 setWithSet:v9];

  [(AMSDeviceOfferRegistrationTask *)self _eligibilityQualifiedRegistrationGroupsWithAccount:v4 pendingRegistrationGroups:v6];
  v65 = id v81 = 0;
  v68 = [v65 resultWithError:&v81];
  id v11 = v81;
  uint64_t v12 = off_1E559C000;
  v66 = v6;
  v64 = v11;
  if (v11)
  {
    __int16 v13 = v11;
    id v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      uint64_t v18 = AMSLogableError(v13);
      *(_DWORD *)buf = 138543874;
      uint64_t v84 = v16;
      __int16 v85 = 2114;
      v86 = v17;
      __int16 v87 = 2114;
      uint64_t v88 = (uint64_t)v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine qualifying device groups. Proceeding with registration without groups. Error: %{public}@", buf, 0x20u);

      uint64_t v12 = off_1E559C000;
    }
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v14 = v6;
    uint64_t v19 = [v14 countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = v4;
      uint64_t v22 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v78 != v22) {
            objc_enumerationMutation(v14);
          }
          id v24 = [*(id *)(*((void *)&v77 + 1) + 8 * i) registrationItems];
          id v25 = objc_msgSend(v24, "ams_mapWithTransform:", &__block_literal_global_43);
          [v10 addObjectsFromArray:v25];
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v77 objects:v82 count:16];
      }
      while (v20);
      id v4 = v21;
      uint64_t v12 = off_1E559C000;
    }
  }

  id v26 = [(AMSDeviceOfferRegistrationTask *)self _companionSerialNumbers];
  id v27 = v68;
  v63 = v4;
  if ([(AMSDeviceOfferRegistrationTask *)self ignoreRegistrationDenyList]
    || [v68 count]
    || [v26 count]
    || ([(AMSDeviceOfferRegistrationTask *)self masterSerialNumber],
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        int v29 = [v10 containsObject:v28],
        v28,
        !v29))
  {
    uint64_t v33 = [(AMSDeviceOfferRegistrationTask *)self _deviceOffersURL];
    v34 = [(AMSDeviceOfferRegistrationTask *)self _registrationRequestEncoderWithAccount:v4];
    uint64_t v35 = [(AMSDeviceOfferRegistrationTask *)self _urlRequestWithBagURL:v33];
    v61 = v26;
    v36 = [(AMSDeviceOfferRegistrationTask *)self _registrationEndpointPOSTParametersWithRegistrationGroups:v68 companionSerialNumbers:v26];
    uint64_t v37 = [(__objc2_class *)v12[17] sharedPrivacyConfig];
    int v38 = v12;
    v39 = (void *)v37;
    if (!v37)
    {
      v39 = [(__objc2_class *)v38[17] sharedConfig];
    }
    v60 = (void *)v33;
    int v40 = [v39 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v35;
      uint64_t v42 = objc_opt_class();
      v43 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v84 = v42;
      uint64_t v35 = v41;
      __int16 v85 = 2114;
      v86 = v43;
      _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration parameters generated.", buf, 0x16u);

      id v27 = v68;
    }

    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_74;
    v74[3] = &unk_1E55A2018;
    v74[4] = self;
    id v75 = v34;
    id v76 = v36;
    id v44 = v36;
    id v45 = v34;
    uint64_t v46 = [v35 thenWithBlock:v74];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_78;
    v73[3] = &unk_1E559E9C0;
    v73[4] = self;
    v47 = [v46 thenWithBlock:v73];
    [(AMSDeviceOfferRegistrationTask *)self _sanitizedResultPromise:v47];
    v49 = v48 = v35;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_79;
    v69[3] = &unk_1E55A2040;
    id v26 = v61;
    id v70 = v61;
    id v71 = v10;
    v72 = self;
    [v49 addSuccessBlock:v69];
    v50 = [(AMSDeviceOfferRegistrationTask *)self _handleRegistrationResult:v49];

    v51 = v60;
  }
  else
  {
    uint64_t v30 = +[AMSDevice deviceOffers];
    v31 = v30;
    if (v30) {
      id v32 = v30;
    }
    else {
      id v32 = (id)objc_opt_new();
    }
    v51 = v32;

    v53 = [v51 allObjects];
    uint64_t v62 = objc_msgSend(v53, "ams_mapWithTransform:", &__block_literal_global_69);

    v54 = [(__objc2_class *)v12[17] sharedPrivacyConfig];
    if (!v54)
    {
      v54 = [(__objc2_class *)v12[17] sharedConfig];
    }
    v55 = [v54 OSLogObject];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = objc_opt_class();
      v57 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v84 = v56;
      __int16 v85 = 2114;
      v86 = v57;
      __int16 v87 = 2114;
      uint64_t v88 = v62;
      _os_log_impl(&dword_18D554000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] All device groups, companions, and master are registered. Returning cached offers: %{public}@", buf, 0x20u);
    }
    v58 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
    v59 = [v10 allObjects];
    [v58 setDeviceRegistrationDenyList:v59];

    v50 = +[AMSPromise promiseWithResult:v51];
    v48 = (void *)v62;
  }

  return v50;
}

uint64_t __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialNumber];
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 description];
  uint64_t v5 = [v3 dsid];

  uint64_t v6 = [v2 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Building registration request.", (uint8_t *)&v10, 0x16u);
  }
  [v3 setHTTPMethod:@"POST"];
  objc_msgSend(v3, "ams_addRequestTimestampHeader");
  id v8 = [*(id *)(a1 + 40) requestByEncodingRequest:v3 parameters:*(void *)(a1 + 48)];

  return v8;
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network component of registration request", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) urlSession];
  v9 = [v8 dataTaskPromiseWithRequest:v3];

  return v9;
}

void __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_79(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:");
  }
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) masterSerialNumber];
  [v2 addObject:v3];

  id v5 = [*(id *)(a1 + 48) deviceOffersStore];
  id v4 = [*(id *)(a1 + 40) allObjects];
  [v5 setDeviceRegistrationDenyList:v4];
}

- (id)_registrationEndpointPOSTCompanionBodyWithDeviceGroups:(id)a3 companionSerialNumbers:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(AMSDeviceOfferRegistrationTask *)self _registrationEndpointPOSTDeviceGroupsBody:a3];
  id v8 = objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_83_0);

  v9 = objc_opt_new();
  [v9 addObjectsFromArray:v7];
  [v9 addObjectsFromArray:v8];
  int v10 = (void *)[v9 copy];

  return v10;
}

id __112__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTCompanionBodyWithDeviceGroups_companionSerialNumbers___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"serialNumber";
  v7[0] = a2;
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)_registrationEndpointPOSTDeviceGroupsBody:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_88_0);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __76__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTDeviceGroupsBody___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 registrationItems];

  id v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_92);
  [v3 setObject:v5 forKeyedSubscript:@"deviceGroup"];

  id v6 = (void *)[v3 copy];
  return v6;
}

id __76__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTDeviceGroupsBody___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v2 serialNumber];
  [v3 setObject:v4 forKeyedSubscript:@"serialNumber"];

  id v5 = [v2 model];
  [v3 setObject:v5 forKeyedSubscript:@"productType"];

  id v6 = [v2 validationData];

  uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
  [v3 setObject:v7 forKeyedSubscript:@"certificate"];

  id v8 = (void *)[v3 copy];
  return v8;
}

- (id)_registrationEndpointPOSTParametersWithRegistrationGroups:(id)a3 companionSerialNumbers:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = [(AMSDeviceOfferRegistrationTask *)self deviceGUID];
  if ([v9 length]) {
    [v8 setObject:v9 forKeyedSubscript:@"guid"];
  }
  int v10 = [(AMSDeviceOfferRegistrationTask *)self masterSerialNumber];
  if ([v10 length]) {
    [v8 setObject:v10 forKeyedSubscript:@"serialNumber"];
  }
  int v11 = [(AMSDeviceOfferRegistrationTask *)self _registrationEndpointPOSTCompanionBodyWithDeviceGroups:v6 companionSerialNumbers:v7];
  [v8 setObject:v11 forKeyedSubscript:@"companionDevices"];

  uint64_t v12 = [(AMSDeviceOfferRegistrationTask *)self offerIdentifiers];
  uint64_t v13 = [v12 count];

  uint64_t v14 = +[AMSLogConfig sharedPrivacyConfig];
  uint64_t v15 = (void *)v14;
  if (v13)
  {
    if (!v14)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v10;
      id v17 = v9;
      id v18 = v7;
      id v19 = v6;
      uint64_t v20 = objc_opt_class();
      id v21 = AMSLogKey();
      uint64_t v22 = [(AMSDeviceOfferRegistrationTask *)self offerIdentifiers];
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v20;
      id v6 = v19;
      id v7 = v18;
      v9 = v17;
      int v10 = v31;
      __int16 v35 = 2114;
      v36 = v21;
      __int16 v37 = 2114;
      int v38 = v22;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Offer identifiers were specified for request: %{public}@", buf, 0x20u);
    }
    id v23 = [(AMSDeviceOfferRegistrationTask *)self offerIdentifiers];
    id v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    id v32 = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    uint64_t v15 = [v23 sortedArrayUsingDescriptors:v25];

    [v8 setObject:v15 forKeyedSubscript:@"services"];
  }
  else
  {
    if (!v14)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    id v26 = [v15 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offer identifiers were specified for the request.", buf, 0x16u);
    }
  }

  int v29 = (void *)[v8 copy];
  return v29;
}

- (id)_accountEligibleSerialsFromDeviceOffers:(id)a3 accountOffers:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_100);
  id v8 = [v6 setWithArray:v7];

  v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    v9 = +[AMSLogConfig sharedConfig];
  }
  int v10 = [v9 OSLogObject];
  uint64_t v30 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = v11;
    __int16 v40 = 2114;
    uint64_t v41 = v12;
    __int16 v42 = 2114;
    v43 = v30;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Matching serials to offers. Eligible identifiers: %{public}@.", buf, 0x20u);

    id v8 = v30;
  }

  v31 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  uint64_t v15 = off_1E559C000;
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v34;
    *(void *)&long long v14 = 138543874;
    long long v29 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend(v19, "offerIdentifier", v29);
        if (v20 && [v8 containsObject:v20])
        {
          id v21 = [(__objc2_class *)v15[17] sharedConfig];
          if (!v21)
          {
            id v21 = [(__objc2_class *)v15[17] sharedConfig];
          }
          uint64_t v22 = [v21 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = objc_opt_class();
            id v24 = AMSLogKey();
            id v25 = [v19 serialNumbers];
            *(_DWORD *)buf = v29;
            uint64_t v39 = v23;
            id v8 = v30;
            __int16 v40 = 2114;
            uint64_t v41 = v24;
            __int16 v42 = 2114;
            v43 = v25;
            _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding serials: %{public}@.", buf, 0x20u);

            uint64_t v15 = off_1E559C000;
          }

          id v26 = [v19 serialNumbers];
          [v31 unionSet:v26];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  uint64_t v27 = (void *)[v31 copy];
  return v27;
}

uint64_t __88__AMSDeviceOfferRegistrationTask__accountEligibleSerialsFromDeviceOffers_accountOffers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 offerIdentifier];
}

- (id)_filteredRegistrationGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDeviceOfferRegistrationTask *)self _serialNumberDenyList];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
  uint64_t v8 = [v7 cachedRegistrationGroups];
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v11 = [v6 setWithArray:v10];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke;
  v16[3] = &unk_1E55A20B0;
  v16[4] = self;
  id v17 = v11;
  id v18 = v5;
  id v12 = v5;
  id v13 = v11;
  long long v14 = objc_msgSend(v4, "ams_filterUsingTest:", v16);

  return v14;
}

uint64_t __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
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
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v6;
    __int16 v31 = 2114;
    id v32 = v7;
    __int16 v33 = 2114;
    id v34 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking privacy requirements for: %{public}@.", buf, 0x20u);
  }
  uint64_t v8 = [a1[4] privacyValidator];
  char v9 = objc_msgSend(v8, "isPrivacyRequirementMetForOptions:", objc_msgSend(v3, "validationOptions"));

  if ((v9 & 1) == 0)
  {
    uint64_t v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      id v32 = v25;
      __int16 v33 = 2114;
      id v34 = v3;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Privacy requirement not met for: %{public}@", buf, 0x20u);
    }
    uint64_t v21 = 0;
    goto LABEL_26;
  }
  if ([a1[5] containsObject:v3] && a1[6])
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      id v14 = a1[6];
      *(_DWORD *)buf = 138544130;
      uint64_t v30 = v12;
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      id v34 = v3;
      __int16 v35 = 2114;
      id v36 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking denylist for: %{public}@. Denylist: %{public}@", buf, 0x2Au);
    }
    uint64_t v15 = [v3 registrationItems];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke_101;
    v27[3] = &unk_1E55A2088;
    id v28 = a1[6];
    int v16 = objc_msgSend(v15, "ams_allWithTest:", v27);

    if (v16)
    {
      id v17 = +[AMSLogConfig sharedConfig];
      if (!v17)
      {
        id v17 = +[AMSLogConfig sharedConfig];
      }
      id v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v19;
        __int16 v31 = 2114;
        id v32 = v20;
        __int16 v33 = 2114;
        id v34 = v3;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Group not eligible: %{public}@", buf, 0x20u);
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = 1;
    }
    uint64_t v22 = v28;
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v21 = 1;
LABEL_27:

  return v21;
}

uint64_t __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke_101(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 serialNumber];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_companionSerialNumbers
{
  id v3 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
  uint64_t v4 = [v3 companionSerialNumbers];

  id v5 = [(AMSDeviceOfferRegistrationTask *)self _serialNumberDenyList];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__AMSDeviceOfferRegistrationTask__companionSerialNumbers__block_invoke;
    v9[3] = &unk_1E559E2C0;
    id v10 = v5;
    uint64_t v7 = objc_msgSend(v4, "ams_filterUsingTest:", v9);

    uint64_t v4 = (void *)v7;
  }

  return v4;
}

uint64_t __57__AMSDeviceOfferRegistrationTask__companionSerialNumbers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_serialNumberDenyList
{
  if ([(AMSDeviceOfferRegistrationTask *)self ignoreRegistrationDenyList])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
    uint64_t v5 = [v4 deviceRegistrationDenyList];
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    id v8 = v7;

    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  }
  return v3;
}

- (id)_eligibilityQualifiedRegistrationGroupsWithAccount:(id)a3 pendingRegistrationGroups:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(AMSDeviceOfferRegistrationTask *)self _isEligibilityCallsAllowed])
  {
    if (v7 && [v7 count])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v30 = __Block_byref_object_copy__26;
      __int16 v31 = __Block_byref_object_dispose__26;
      id v32 = (id)MEMORY[0x1E4F1CBF0];
      id v8 = [(AMSDeviceOfferRegistrationTask *)self eligibilityTask];
      char v9 = [(AMSDeviceOfferRegistrationTask *)self clientInfo];
      id v10 = [v8 performAnonymousDeviceEligibility:v7 clientInfo:v9];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke;
      v26[3] = &unk_1E55A20D8;
      v26[4] = self;
      id v28 = buf;
      id v27 = v6;
      uint64_t v11 = [v10 thenWithBlock:v26];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke_109;
      v23[3] = &unk_1E55A20D8;
      v23[4] = self;
      id v25 = buf;
      id v24 = v7;
      uint64_t v12 = [v11 thenWithBlock:v23];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v18 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v18)
      {
        id v18 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - No valid device groups, skipping group eligibility checks", buf, 0x16u);
      }
      uint64_t v12 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    id v13 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      int v16 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Eligibility calls disabled", buf, 0x16u);
    }
    id v17 = AMSError(11, @"Action Denied", @"Eligibility is temporarily disabled", 0);
    uint64_t v12 = +[AMSPromise promiseWithError:v17];
  }
  return v12;
}

id __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v17 = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - Device offers retrieved from anonymous device eligibility@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  char v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
  id v10 = v3;

  uint64_t v11 = [*(id *)(a1 + 32) eligibilityTask];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v14 = [*(id *)(a1 + 32) clientInfo];
  uint64_t v15 = [v11 performAccountEligibility:v12 forOffers:v13 clientInfo:v14];

  return v15;
}

id __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v12 = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - Account eligibility complete@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) _accountEligibleSerialsFromDeviceOffers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) accountOffers:v3];

  char v9 = [*(id *)(a1 + 32) _registrationGroupsFrom:*(void *)(a1 + 40) matching:v8];
  id v10 = +[AMSPromise promiseWithResult:v9];

  return v10;
}

- (id)_registrationGroupsFrom:(id)a3 matching:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke;
  v9[3] = &unk_1E55A2100;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "ams_filterUsingTest:", v9);

  return v7;
}

BOOL __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 registrationItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke_2;
  v6[3] = &unk_1E55A2088;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "ams_firstObjectPassingTest:", v6);

  return v4 != 0;
}

uint64_t __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 serialNumber];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_latestDeviceGroups
{
  id v3 = [(AMSDeviceOfferRegistrationTask *)self registrationGroups];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = [(AMSDeviceOfferRegistrationTask *)self registrationGroups];
    id v6 = [v4 setWithArray:v5];

    id v7 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
    uint64_t v8 = [v7 cachedRegistrationGroups];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke;
    v12[3] = &unk_1E55A2100;
    v12[4] = self;
    char v9 = objc_msgSend(v8, "ams_filterUsingTest:", v12);

    if (v9) {
      [v6 addObjectsFromArray:v9];
    }
    id v10 = [v6 allObjects];
  }
  else
  {
    id v6 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
    id v10 = [v6 cachedRegistrationGroups];
  }

  return v10;
}

uint64_t __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) registrationGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke_2;
  v8[3] = &unk_1E55A2100;
  id v9 = v3;
  id v5 = v3;
  int v6 = objc_msgSend(v4, "ams_anyWithTest:", v8);

  return v6 ^ 1u;
}

uint64_t __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isModifiedVersionOfGroup:*(void *)(a1 + 32)];
}

- (id)_bucketedOffers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"offerIdentifier", (void)v17);
        if (v11)
        {
          int v12 = [v4 objectForKeyedSubscript:v11];

          if (!v12)
          {
            uint64_t v13 = objc_opt_new();
            [v4 setObject:v13 forKeyedSubscript:v11];
          }
          __int16 v14 = [v4 objectForKeyedSubscript:v11];
          [v14 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  uint64_t v15 = (void *)[v4 copy];
  return v15;
}

- (id)_handleRegistrationResult:(id)a3
{
  id v4 = a3;
  id v5 = AMSLogKey();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke;
  v14[3] = &unk_1E559E7E8;
  id v6 = v5;
  id v15 = v6;
  uint64_t v16 = self;
  [v4 addErrorBlock:v14];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_114;
  v10[3] = &unk_1E55A2150;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  objc_copyWeak(&v12, &location);
  uint64_t v8 = [v4 thenWithBlock:v10];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v8;
}

void __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Device offers registration failed: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

id __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_114(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v6;
    __int16 v33 = 2114;
    id v34 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration response received.", buf, 0x16u);
  }
  id v8 = AMSSetLogKey(a1[5]);
  int v9 = [v3 object];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  __int16 v11 = [v10 objectForKeyedSubscript:@"offers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_118;
  v30[3] = &unk_1E55A2128;
  v30[4] = a1[4];
  __int16 v13 = objc_msgSend(v12, "ams_mapWithTransform:", v30);

  uint64_t v14 = [v13 count];
  uint64_t v15 = +[AMSLogConfig sharedPrivacyConfig];
  uint64_t v16 = (void *)v15;
  if (v14)
  {
    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    long long v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 6);
      uint64_t v19 = objc_opt_class();
      long long v20 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v19;
      __int16 v33 = 2114;
      id v34 = v20;
      __int16 v35 = 2114;
      id v36 = v13;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Device offers retrieved from server: %{public}@", buf, 0x20u);
    }
    [a1[4] _updateWithDeviceOffers:v13];
  }
  else
  {
    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v16 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_loadWeakRetained(a1 + 6);
      uint64_t v23 = objc_opt_class();
      id v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      id v34 = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No device offers retrieved from server. Offers may exist locally.", buf, 0x16u);
    }
  }
  uint64_t v25 = +[AMSDevice deviceOffers];
  id v26 = (void *)v25;
  if (v25) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = MEMORY[0x1E4F1CBF0];
  }
  id v28 = +[AMSPromise promiseWithResult:v27];

  return v28;
}

id __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) account];
    id v8 = objc_msgSend(v7, "ams_DSID");

    uint64_t v6 = v3;
    if (v8)
    {
      int v9 = [*(id *)(a1 + 32) account];
      id v10 = objc_msgSend(v9, "ams_DSID");
      [v5 setObject:v10 forKeyedSubscript:@"dsid"];

      uint64_t v6 = v5;
    }
  }
  id v11 = v6;

  return v11;
}

- (id)_latestOffersWithFetchedDeviceOffers:(id)a3 offersStore:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AMSDeviceOfferRegistrationTask *)self offerIdentifiers];
  if (v8
    && (int v9 = (void *)v8,
        [(AMSDeviceOfferRegistrationTask *)self offerIdentifiers],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    id v12 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v13 = [v7 deviceOffers];
    uint64_t v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v16 = [(AMSDeviceOfferRegistrationTask *)self _bucketedOffers:v15];
    long long v17 = [v12 dictionaryWithDictionary:v16];

    long long v18 = [(AMSDeviceOfferRegistrationTask *)self _bucketedOffers:v6];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v19 = [v18 allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v25 = [v18 objectForKeyedSubscript:v24];
          [v17 setObject:v25 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v21);
    }

    id v26 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v27 = objc_msgSend(v17, "allValues", 0);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v27);
          }
          [v26 addObjectsFromArray:*(void *)(*((void *)&v34 + 1) + 8 * j)];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v29);
    }

    id v32 = (id)[v26 copy];
  }
  else
  {
    id v32 = v6;
  }

  return v32;
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

  id v6 = [v5 objectForKeyedSubscript:@"offers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__AMSDeviceOfferRegistrationTask__offersDecodedFromResult___block_invoke;
  v10[3] = &unk_1E55A1F18;
  v10[4] = self;
  uint64_t v8 = objc_msgSend(v7, "ams_mapWithTransform:", v10);

  return v8;
}

AMSDeviceOffer *__59__AMSDeviceOfferRegistrationTask__offersDecodedFromResult___block_invoke(uint64_t a1, void *a2)
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
    id v6 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Decoding %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v7 = [[AMSDeviceOffer alloc] initWithDictionary:v2];

  return v7;
}

- (id)_sanitizedResultPromise:(id)a3
{
  return (id)[a3 thenWithBlock:&__block_literal_global_127];
}

id __58__AMSDeviceOfferRegistrationTask__sanitizedResultPromise___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  uint64_t v5 = [v4 objectForKeyedSubscript:@"errorNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"Promise finished with server error code %@", v6];
      uint64_t v8 = AMSError(0, @"Registration task failure", v7, 0);
      int v9 = +[AMSPromise promiseWithError:v8];

      goto LABEL_9;
    }
  }
  else
  {
  }
  int v9 = +[AMSPromise promiseWithResult:v2];
  id v6 = 0;
LABEL_9:

  return v9;
}

- (void)_updateWithDeviceOffers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSDeviceOfferRegistrationTask *)self account];
  id v6 = AMSLogKey();
  +[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:v5 logKey:v6];

  id v7 = [(AMSDeviceOfferRegistrationTask *)self deviceOffersStore];
  uint64_t v8 = [(AMSDeviceOfferRegistrationTask *)self _latestOffersWithFetchedDeviceOffers:v4 offersStore:v7];

  +[AMSDevice saveDeviceOffers:v8];
  id v11 = [(AMSDeviceOfferRegistrationTask *)self account];
  int v9 = [(AMSDeviceOfferRegistrationTask *)self bag];
  uint64_t v10 = AMSLogKey();
  +[AMSDevice postAllDeviceOfferFollowUpsForAccount:v11 priority:0 bag:v9 logKey:v10];
}

- (BOOL)_isRegistrationAllowed
{
  id v2 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v3 = [v2 stringForKey:@"registrationDisableState"];
  id v4 = [v3 valueWithError:0];

  if (v4) {
    int v5 = [v4 isEqualToString:@"3"] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)_isEligibilityCallsAllowed
{
  id v2 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v3 = [v2 stringForKey:@"registrationDisableState"];
  id v4 = [v3 valueWithError:0];

  return v4 == 0;
}

- (BOOL)_isDeviceGroupRegistrationAllowed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v4 = [v3 stringForKey:@"registrationDisableState"];
  int v5 = [v4 valueWithError:0];

  id v6 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    int v9 = AMSLogKey();
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    long long v17 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] DISABLE STATE %{public}@", (uint8_t *)&v12, 0x20u);
  }
  if (v5)
  {
    if ([(AMSDeviceOfferRegistrationTask *)self _isRegistrationAllowed]) {
      int v10 = [v5 isEqualToString:@"2"] ^ 1;
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (id)_lightweightDeviceOffersURL
{
  id v2 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v3 = [v2 URLForKey:@"deviceOffersByCreationDate"];

  return v3;
}

- (id)_deviceOffersURL
{
  id v2 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v3 = [v2 URLForKey:@"deviceOffers"];

  return v3;
}

- (id)_urlRequestWithBagURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(AMSMutablePromise);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__AMSDeviceOfferRegistrationTask__urlRequestWithBagURL___block_invoke;
    v8[3] = &unk_1E55A2198;
    int v5 = v4;
    int v9 = v5;
    [v3 valueWithCompletion:v8];
  }
  else
  {
    id v6 = AMSError(2, @"URL Request could not be created", @"bagURL is nil", 0);
    int v5 = +[AMSPromise promiseWithError:v6];
  }
  return v5;
}

void __56__AMSDeviceOfferRegistrationTask__urlRequestWithBagURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    int v5 = *(void **)(a1 + 32);
    [v5 finishWithError:a4];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F18D50] requestWithURL:a2];
    [*(id *)(a1 + 32) finishWithResult:v6];
  }
}

- (id)_registrationRequestEncoderWithAccount:(id)a3
{
  id v4 = a3;
  int v5 = [AMSURLRequestEncoder alloc];
  id v6 = [(AMSDeviceOfferRegistrationTask *)self bag];
  id v7 = [(AMSURLRequestEncoder *)v5 initWithBag:v6];

  [(AMSURLRequestEncoder *)v7 setRequestEncoding:2];
  [(AMSURLRequestEncoder *)v7 setAccount:v4];

  [(AMSURLRequestEncoder *)v7 setDialogOptions:1];
  uint64_t v8 = AMSLogKey();
  [(AMSURLRequestEncoder *)v7 setLogUUID:v8];

  [(AMSURLRequestEncoder *)v7 setEnableRemoteSecuritySigning:1];
  int v9 = [(AMSDeviceOfferRegistrationTask *)self clientInfo];

  if (v9)
  {
    int v10 = [(AMSDeviceOfferRegistrationTask *)self clientInfo];
    [(AMSURLRequestEncoder *)v7 setClientInfo:v10];
  }
  return v7;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_8 != -1) {
    dispatch_once(&_MergedGlobals_1_8, &__block_literal_global_150);
  }
  id v2 = (void *)qword_1EB38D108;
  return (NSString *)v2;
}

void __47__AMSDeviceOfferRegistrationTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D108;
  qword_1EB38D108 = @"AMSDeviceOfferRegistrationTask";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D110 != -1) {
    dispatch_once(&qword_1EB38D110, &__block_literal_global_155);
  }
  id v2 = (void *)qword_1EB38D118;
  return (NSString *)v2;
}

void __54__AMSDeviceOfferRegistrationTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D118;
  qword_1EB38D118 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSSet)offerIdentifiers
{
  return self->_offerIdentifiers;
}

- (void)setOfferIdentifiers:(id)a3
{
}

- (NSArray)registrationGroups
{
  return self->_registrationGroups;
}

- (void)setRegistrationGroups:(id)a3
{
}

- (AMSDeviceOfferEligibilityTask)eligibilityTask
{
  return self->_eligibilityTask;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)masterSerialNumber
{
  return self->_masterSerialNumber;
}

- (AMSDeviceOffersTracking)deviceOffersStore
{
  return self->_deviceOffersStore;
}

- (AMSDeviceOfferRegistrationPrivacyValidator)privacyValidator
{
  return self->_privacyValidator;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (BOOL)ignoreRegistrationDenyList
{
  return self->_ignoreRegistrationDenyList;
}

- (void)setIgnoreRegistrationDenyList:(BOOL)a3
{
  self->_ignoreRegistrationDenyList = a3;
}

- (BOOL)lightweightCheckOnly
{
  return self->_lightweightCheckOnly;
}

- (void)setLightweightCheckOnly:(BOOL)a3
{
  self->_lightweightCheckOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_privacyValidator, 0);
  objc_storeStrong((id *)&self->_deviceOffersStore, 0);
  objc_storeStrong((id *)&self->_masterSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_eligibilityTask, 0);
  objc_storeStrong((id *)&self->_registrationGroups, 0);
  objc_storeStrong((id *)&self->_offerIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end