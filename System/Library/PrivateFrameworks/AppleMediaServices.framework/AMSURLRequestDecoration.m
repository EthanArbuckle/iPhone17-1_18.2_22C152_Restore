@interface AMSURLRequestDecoration
+ (BOOL)_shouldSendGUIDForRequest:(id)a3 patterns:(id)a4 schemes:(id)a5;
+ (id)_addGUIDParameterToRequest:(id)a3 fromPromise:(id)a4 shouldPreserveEncoding:(BOOL)a5;
+ (id)addAbsintheHeadersToRequest:(id)a3 buyParams:(id)a4 bag:(id)a5 shouldUseRemoteSigningIfAvailable:(BOOL)a6;
+ (id)addAnisetteHeadersToRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6;
+ (id)addFPDIHeadersToRequest:(id)a3 buyParams:(id)a4 bag:(id)a5 retryCount:(int64_t)a6 fairPlayDeviceIdentity:(id)a7 fpdiNetworkProvider:(id)a8;
+ (id)addGUIDParameterToRequest:(id)a3 bag:(id)a4 preservingQueryEncoding:(BOOL)a5;
+ (id)addMescalHeaderToRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 logKey:(id)a6;
+ (id)addPaymentHardwareStatusToRequest:(id)a3;
+ (id)addStoreFrontHeaderToRequest:(id)a3 forAccount:(id)a4 mediaType:(id)a5 bag:(id)a6;
+ (id)addTreatmentHeadersToRequest:(id)a3 forTreatmentNamespace:(id)a4;
@end

@implementation AMSURLRequestDecoration

void __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = AMSLogKey();
      v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        uint64_t v3 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, v3];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      v14 = };
      v18 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@GUID parameter creation failed. error = %{public}@", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v3;
      }
    }
    goto LABEL_13;
  }
  v15 = [v6 value];

  if (v15)
  {
    v8 = [*(id *)(a1 + 32) URL];
    v19 = @"guid";
    v9 = [v6 value];
    v20 = v9;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v17 = objc_msgSend(v8, "ams_URLByAppendingQueryParameters:preservingQueryEncoding:", v16, *(unsigned __int8 *)(a1 + 56));
    [*(id *)(a1 + 32) setURL:v17];

LABEL_13:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)addAnisetteHeadersToRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = objc_msgSend(v10, "ams_isEphemeralAccount");
  if (a5 != 2 && v12 || objc_msgSend(v9, "ams_requestIsBagLoad"))
  {
    uint64_t v13 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    v14 = +[AMSAnisette headersForRequest:v9 account:v10 type:a5 bag:v11];
    uint64_t v13 = objc_msgSend(v9, "ams_addHeadersFromPromise:", v14);
  }
  return v13;
}

+ (id)_addGUIDParameterToRequest:(id)a3 fromPromise:(id)a4 shouldPreserveEncoding:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke;
  v14[3] = &unk_1E55A7A50;
  id v16 = v8;
  id v17 = a1;
  id v15 = v9;
  BOOL v18 = a5;
  id v10 = v8;
  id v11 = v9;
  int v12 = objc_msgSend(v10, "ams_modifyRequestWithBlock:", v14);

  return v12;
}

+ (id)addGUIDParameterToRequest:(id)a3 bag:(id)a4 preservingQueryEncoding:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = +[AMSDevice deviceGUID];
    if (v10)
    {
      v32 = [v9 arrayForKey:@"guid-urls/regex"];
      v31 = [v32 valuePromise];
      v37[0] = v31;
      id v11 = [v9 arrayForKey:@"guid-urls/schemes"];
      int v12 = [v11 valuePromise];
      v37[1] = v12;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      uint64_t v13 = v30 = v5;
      v14 = +[AMSPromise promiseWithAll:v13];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __81__AMSURLRequestDecoration_addGUIDParameterToRequest_bag_preservingQueryEncoding___block_invoke;
      v33[3] = &unk_1E55A79D8;
      id v36 = a1;
      id v15 = v9;
      id v16 = v8;
      id v17 = v8;
      id v34 = v17;
      id v10 = v10;
      id v35 = v10;
      BOOL v18 = [v14 continueWithBlock:v33];

      id v19 = v17;
      id v8 = v16;
      id v9 = v15;
      v20 = [a1 _addGUIDParameterToRequest:v19 fromPromise:v18 shouldPreserveEncoding:v30];
    }
    else
    {
      v20 = +[AMSBinaryPromise promiseWithSuccess];
    }
  }
  else
  {
    id v21 = v8;
    v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    __int16 v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = AMSLogKey();
      uint64_t v25 = NSString;
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = v26;
      if (v24)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v25 stringWithFormat:@"%@: [%@] ", v27, a1];
      }
      else
      {
        [v25 stringWithFormat:@"%@: ", v26];
      v28 = };
      *(_DWORD *)buf = 138543362;
      v39 = v28;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@Skipping GUID parameter addition as bag was not provided.", buf, 0xCu);
      if (v24)
      {

        v28 = a1;
      }
    }
    AMSError(2, @"Failed to add GUID parameter", @"Bag was not provided", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v20 = +[AMSBinaryPromise promiseWithError:v10];
    id v8 = v21;
  }

  return v20;
}

+ (id)addMescalHeaderToRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 logKey:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = AMSSetLogKey(v12);
  if (objc_msgSend(v10, "ams_requestIsBagLoad"))
  {
    v14 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    id v15 = +[AMSMescal signaturePromiseFromRequest:v10 type:a4 bag:v11];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __68__AMSURLRequestDecoration_addMescalHeaderToRequest_type_bag_logKey___block_invoke;
    id v21 = &unk_1E55A78D8;
    id v22 = v12;
    id v23 = a1;
    id v16 = [v15 continueWithBlock:&v18];

    v14 = objc_msgSend(v10, "ams_addHeadersFromPromise:", v16, v18, v19, v20, v21);
  }
  return v14;
}

+ (id)addAbsintheHeadersToRequest:(id)a3 buyParams:(id)a4 bag:(id)a5 shouldUseRemoteSigningIfAvailable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (+[AMSDefaults enableRemoteSecuritySigning]) {
    BOOL v13 = !v6;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (objc_msgSend(v10, "ams_requestIsBagLoad"))
    {
      id v16 = +[AMSBinaryPromise promiseWithSuccess];
      goto LABEL_10;
    }
    v14 = +[AMSAbsinthe headersForRequest:v10 buyParams:v11 bag:v12];
    id v16 = objc_msgSend(v10, "ams_addHeadersFromPromise:", v14);
  }
  else
  {
    v14 = +[AMSSigningSecurityService sharedService];
    id v15 = [v14 headersForRequest:v10 buyParams:v11 bag:v12];
    id v16 = objc_msgSend(v10, "ams_addHeadersFromPromise:", v15);
  }
LABEL_10:
  id v17 = AMSLogKey();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103__AMSURLRequestDecoration_addAbsintheHeadersToRequest_buyParams_bag_shouldUseRemoteSigningIfAvailable___block_invoke;
  v20[3] = &unk_1E55A4918;
  id v21 = v17;
  id v22 = a1;
  id v18 = v17;
  [v16 addErrorBlock:v20];

  return v16;
}

+ (id)addStoreFrontHeaderToRequest:(id)a3 forAccount:(id)a4 mediaType:(id)a5 bag:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_alloc_init(AMSMutablePromise);
  id v15 = [(AMSPromise *)v14 completionHandlerAdapter];
  +[AMSStorefrontHeaderValueCreation storefrontHeaderValueForAccount:v13 bag:v11 mediaType:v12 allowFailedSuffixFetch:1 completionHandler:v15];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a1;
  [(AMSPromise *)v14 addErrorBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke_56;
  v20[3] = &unk_1E55A7A00;
  id v21 = v10;
  id v22 = a1;
  id v16 = v10;
  id v17 = [(AMSMutablePromise *)v14 thenWithBlock:v20];
  id v18 = objc_msgSend(v16, "ams_addHeadersFromPromise:", v17);

  return v18;
}

id __81__AMSURLRequestDecoration_addGUIDParameterToRequest_bag_preservingQueryEncoding___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "ams_isBagValueMissingError"))
    {
      id v8 = +[AMSOptional optionalWithNil];
      id v9 = +[AMSPromise promiseWithResult:v8];
    }
    else
    {
      id v9 = +[AMSPromise promiseWithError:v7];
    }
  }
  else
  {
    id v10 = [v5 objectAtIndexedSubscript:0];
    id v11 = [v5 objectAtIndexedSubscript:1];
    int v12 = [*(id *)(a1 + 48) _shouldSendGUIDForRequest:*(void *)(a1 + 32) patterns:v10 schemes:v11];
    id v13 = [AMSOptional alloc];
    uint64_t v14 = 0;
    if (v12) {
      uint64_t v14 = *(void *)(a1 + 40);
    }
    id v15 = [(AMSOptional *)v13 initWithValue:v14];
    id v9 = +[AMSPromise promiseWithResult:v15];
  }
  return v9;
}

+ (id)addPaymentHardwareStatusToRequest:(id)a3
{
  uint64_t v3 = AMSError(5, @"Payment hardware status header not added", @"Platform not supported", 0);
  v4 = +[AMSBinaryPromise promiseWithError:v3];

  return v4;
}

+ (BOOL)_shouldSendGUIDForRequest:(id)a3 patterns:(id)a4 schemes:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[AMSDefaults alwaysSendGUID])
  {
    LOBYTE(v10) = 1;
  }
  else if ([v8 count])
  {
    id v11 = [v7 URL];
    int v12 = [v11 scheme];
    LODWORD(v10) = [v9 containsObject:v12];

    if (v10)
    {
      id v13 = [v7 URL];
      uint64_t v14 = [v13 absoluteString];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v15 = v8;
      uint64_t v10 = [v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v16 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v15);
            }
            if (objc_msgSend(v14, "rangeOfString:options:", *(void *)(*((void *)&v19 + 1) + 8 * i), 1024, (void)v19) != 0x7FFFFFFFFFFFFFFFLL)
            {
              LOBYTE(v10) = 1;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

void __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke_2;
  v8[3] = &unk_1E55A7A28;
  id v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v6 = v4;
  char v12 = *(unsigned char *)(a1 + 56);
  id v9 = v6;
  id v10 = v3;
  id v7 = v3;
  [v5 addFinishBlock:v8];
}

id __68__AMSURLRequestDecoration_addMescalHeaderToRequest_type_bag_logKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = AMSSetLogKey(v6);
  id v9 = [v7 value];

  if (v5)
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      char v12 = AMSLogKey();
      id v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        a1 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, a1];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      uint64_t v16 = };
      uint64_t v27 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      __int16 v34 = 2114;
      id v35 = v27;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to add mescal header. Error: %{public}@", buf, 0x16u);
      if (v12)
      {

        uint64_t v16 = (void *)a1;
      }
    }
    uint64_t v28 = +[AMSPromise promiseWithError:v5];
  }
  else
  {
    if (v9)
    {
      id v17 = [v9 base64EncodedStringWithOptions:0];
      BOOL v30 = @"X-Apple-ActionSignature";
      v31 = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      long long v19 = +[AMSPromise promiseWithResult:v18];

      goto LABEL_20;
    }
    long long v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      long long v20 = +[AMSLogConfig sharedConfig];
    }
    long long v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = AMSLogKey();
      id v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      if (v22)
      {
        a1 = AMSLogKey();
        [v23 stringWithFormat:@"%@: [%@] ", v25, a1];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      uint64_t v26 = };
      *(_DWORD *)buf = 138543362;
      v33 = v26;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@No Mescal signature was generated. No headers will be created for additon to request.", buf, 0xCu);
      if (v22)
      {

        uint64_t v26 = (void *)a1;
      }
    }
    uint64_t v28 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }
  long long v19 = (void *)v28;
LABEL_20:

  return v19;
}

void __103__AMSURLRequestDecoration_addAbsintheHeadersToRequest_buyParams_bag_shouldUseRemoteSigningIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_opt_class();
    if (v7) {
      [v6 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 32)];
    }
    else {
    id v9 = [v6 stringWithFormat:@"%@: ", v8, v11];
    }
    id v10 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to add security signing headers. error = %{public}@", buf, 0x16u);
  }
}

+ (id)addFPDIHeadersToRequest:(id)a3 buyParams:(id)a4 bag:(id)a5 retryCount:(int64_t)a6 fairPlayDeviceIdentity:(id)a7 fpdiNetworkProvider:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  int v19 = objc_msgSend(v14, "ams_requestIsBagLoad");
  if (!v16 || v19)
  {
    uint64_t v25 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    long long v20 = objc_alloc_init(AMSMutableBinaryPromise);
    long long v21 = [[AMSSendableBag alloc] initWithWrappedBag:v16];
    long long v22 = [v15 dictionaryForFPDI];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __119__AMSURLRequestDecoration_addFPDIHeadersToRequest_buyParams_bag_retryCount_fairPlayDeviceIdentity_fpdiNetworkProvider___block_invoke;
    v27[3] = &unk_1E55A7928;
    int64_t v30 = a6;
    id v28 = v14;
    id v23 = v20;
    v29 = v23;
    id v31 = a1;
    [v17 headersFor:v28 bag:v21 buyParams:v22 networkProvider:v18 completionHandler:v27];

    uint64_t v24 = v29;
    uint64_t v25 = v23;
  }
  return v25;
}

void __119__AMSURLRequestDecoration_addFPDIHeadersToRequest_buyParams_bag_retryCount_fairPlayDeviceIdentity_fpdiNetworkProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    if (*(uint64_t *)(a1 + 48) >= 1)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", *(void *)(a1 + 48));
      [v9 setObject:v10 forKeyedSubscript:@"X-Apple-FPDIRetryCount"];
    }
    uint64_t v11 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __119__AMSURLRequestDecoration_addFPDIHeadersToRequest_buyParams_bag_retryCount_fairPlayDeviceIdentity_fpdiNetworkProvider___block_invoke_2;
    v22[3] = &unk_1E55A7900;
    id v23 = v11;
    id v24 = v9;
    id v12 = v9;
    id v13 = objc_msgSend(v23, "ams_modifyRequestWithBlock:", v22);
    [*(id *)(a1 + 40) finishWithPromise:v13];
  }
  else
  {
    if (v7)
    {
      id v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = AMSLogKey();
        id v17 = NSString;
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = v18;
        if (v16)
        {
          uint64_t v3 = AMSLogKey();
          [v17 stringWithFormat:@"%@: [%@] ", v19, v3];
        }
        else
        {
          [v17 stringWithFormat:@"%@: ", v18];
        long long v20 = };
        long long v21 = AMSLogableError(v8);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v20;
        __int16 v27 = 2114;
        id v28 = v21;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to add FPDI signing headers. error = %{public}@", buf, 0x16u);
        if (v16)
        {

          long long v20 = (void *)v3;
        }
      }
    }
    [*(id *)(a1 + 40) finishWithSuccess];
  }
}

void __119__AMSURLRequestDecoration_addFPDIHeadersToRequest_buyParams_bag_retryCount_fairPlayDeviceIdentity_fpdiNetworkProvider___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "ams_addHeaders:", v3);
  v4[2](v4, 1, 0);
}

+ (id)addTreatmentHeadersToRequest:(id)a3 forTreatmentNamespace:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = AMSLogKey();
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      if (v8) {
        [v11 stringWithFormat:@"%@: [%@] ", v12, v8];
      }
      else {
      long long v20 = [v11 stringWithFormat:@"%@: ", v12, v30];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v20;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching treatment area identifiers (namespace: %{public}@)", buf, 0x16u);
    }
    long long v21 = +[AMSTreatmentStore defaultTreatmentStore];
    long long v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    id v23 = [v21 areasForNamespaces:v22];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke;
    v34[3] = &unk_1E559E360;
    id v35 = v7;
    id v24 = v8;
    id v37 = v21;
    id v38 = a1;
    id v36 = v24;
    id v25 = v21;
    uint64_t v26 = [v23 continueWithBlock:v34];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_5;
    v31[3] = &unk_1E55A4918;
    id v32 = v24;
    id v33 = a1;
    id v27 = v24;
    [v26 addErrorBlock:v31];
    id v28 = objc_msgSend(v6, "ams_addHeadersFromPromise:", v26);
  }
  else
  {
    id v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = AMSLogKey();
      id v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v16 stringWithFormat:@"%@: [%@] ", v18, a1];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      uint64_t v19 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@No treatment namespace was provided. Skipping header creation.", buf, 0xCu);
      if (v15)
      {

        uint64_t v19 = a1;
      }
    }
    id v28 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v28;
}

id __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 objectForKey:*(void *)(a1 + 32)];
  if ([v3 count])
  {
    v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      if (v6) {
        [v7 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 40)];
      }
      else {
      id v10 = [v7 stringWithFormat:@"%@: ", v8, v16];
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching treatments (areaIDs: %{public}@)", buf, 0x16u);
    }
    uint64_t v11 = [*(id *)(a1 + 48) activeTreatmentsForAreas:v3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_25;
    v17[3] = &unk_1E55A79B0;
    id v12 = *(id *)(a1 + 40);
    id v14 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v18 = v12;
    uint64_t v21 = v13;
    id v19 = v14;
    id v20 = v3;
    id v9 = [v11 thenWithBlock:v17];
  }
  else
  {
    id v9 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC08]];
  }

  return v9;
}

id __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    if (v6) {
      [v7 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 32)];
    }
    else {
    id v9 = [v7 stringWithFormat:@"%@: ", v8, v25];
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v9;
    __int16 v31 = 2114;
    id v32 = @"x-apple-ab";
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@%{public}@ header", buf, 0x16u);
  }
  id v10 = [*(id *)(a1 + 40) treatmentsPayloadForTreatments:v3];
  uint64_t v11 = [v10 thenWithBlock:&__block_literal_global_135];

  id v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = NSString;
    uint64_t v16 = objc_opt_class();
    if (v14) {
      [v15 stringWithFormat:@"%@: [%@] ", v16, *(void *)(a1 + 32)];
    }
    else {
    uint64_t v17 = [v15 stringWithFormat:@"%@: ", v16, v25];
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v17;
    __int16 v31 = 2114;
    id v32 = @"x-apple-abc";
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@%{public}@ header", buf, 0x16u);
  }
  id v18 = [*(id *)(a1 + 40) areasWithIDs:*(void *)(a1 + 48)];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_28;
  v26[3] = &unk_1E55A0FA0;
  id v27 = v3;
  id v19 = v3;
  id v20 = [v18 thenWithBlock:v26];

  v28[0] = v11;
  v28[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  long long v22 = +[AMSPromise promiseWithSome:v21];
  id v23 = [v22 thenWithBlock:&__block_literal_global_40_0];

  return v23;
}

id __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_26(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 length])
  {
    uint64_t v6 = @"x-apple-ab";
    v7[0] = v2;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  v4 = +[AMSPromise promiseWithResult:v3];

  return v4;
}

id __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v18);
        if ([v11 cacheable])
        {
          id v12 = [*(id *)(a1 + 32) objectForKey:v10];
          uint64_t v13 = [v12 identifier];
          if (v13) {
            objc_msgSend(v4, "insertObject:atIndex:", v13, objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, objc_msgSend(v4, "count"), 1024, &__block_literal_global_32_0));
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    long long v22 = @"x-apple-abc";
    uint64_t v14 = [v4 componentsJoinedByString:@","];
    id v23 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v16 = +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15, (void)v18);

  return v16;
}

uint64_t __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ams_reduceWithInitialResult:updateAccumulatingResult:", MEMORY[0x1E4F1CC08], &__block_literal_global_43_1);
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

uint64_t __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_dictionaryByAddingEntriesFromDictionary:");
}

void __78__AMSURLRequestDecoration_addTreatmentHeadersToRequest_forTreatmentNamespace___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = objc_opt_class();
    if (v7) {
      [v6 stringWithFormat:@"%@: [%@] ", v8, *(void *)(a1 + 32)];
    }
    else {
    id v9 = [v6 stringWithFormat:@"%@: ", v8, v11];
    }
    uint64_t v10 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed adding AB payload header. error = %{public}@", buf, 0x16u);
  }
}

void __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to create storefront header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
}

id __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) valueForHTTPHeaderField:@"X-Apple-Store-Front"];
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = AMSLogKey();
      uint64_t v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        a1 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v10, a1];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      uint64_t v11 = };
      id v12 = AMSHashIfNeeded(v4);
      uint64_t v13 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      long long v20 = v11;
      __int16 v21 = 2114;
      long long v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Request already has storefront header set which will be replaced. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x20u);
      if (v7)
      {

        uint64_t v11 = (void *)a1;
      }
    }
  }
  uint64_t v17 = @"X-Apple-Store-Front";
  id v18 = v3;
  __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v15 = +[AMSPromise promiseWithResult:v14];

  return v15;
}

@end