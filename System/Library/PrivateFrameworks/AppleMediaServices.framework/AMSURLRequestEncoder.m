@interface AMSURLRequestEncoder
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSFairPlayDeviceIdentity)fairPlayDeviceIdentity;
- (AMSFairPlayDeviceIdentityNetworkProviderProtocol)fpdiNetworkProvider;
- (AMSKeychainOptions)keychainOptions;
- (AMSProcessInfo)clientInfo;
- (AMSResponseDecoding)responseDecoder;
- (AMSURLBagContract)bagContract;
- (AMSURLRequestEncoder)init;
- (AMSURLRequestEncoder)initWithBag:(id)a3;
- (AMSURLRequestEncoder)initWithBagContract:(id)a3;
- (AMSURLRequestProperties)parentProperties;
- (BOOL)alwaysIncludeAuthKitHeaders;
- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders;
- (BOOL)compressRequestBody;
- (BOOL)disableResponseDecoding;
- (BOOL)enableRemoteSecuritySigning;
- (BOOL)excludeIdentifierHeadersForAccount;
- (BOOL)includeClientVersions;
- (BOOL)preserveQueryParameterEncoding;
- (BOOL)shouldSetCookieHeader;
- (BOOL)shouldSetCookiesFromResponse;
- (BOOL)shouldSetStorefrontFromResponse;
- (BOOL)shouldSetStorefrontHeader;
- (BOOL)urlKnownToBeTrusted;
- (Class)paymentSheetTaskClass;
- (NSArray)groupRequestAccounts;
- (NSDictionary)additionalMetrics;
- (NSString)gsTokenIdentifier;
- (NSString)logUUID;
- (OS_dispatch_queue)internalQueue;
- (id)_addCookiesToRequest:(id)a3 account:(id)a4;
- (id)_methodStringFromMethod:(int64_t)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4 error:(id *)a5;
- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 error:(id *)a5;
- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 headers:(id)a5 parameters:(id)a6;
- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5;
- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 error:(id *)a5;
- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 error:(id *)a5;
- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 headers:(id)a5 parameters:(id)a6;
- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5;
- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5 error:(id *)a6;
- (int64_t)anisetteType;
- (int64_t)dialogOptions;
- (int64_t)encodeCount;
- (int64_t)mescalType;
- (int64_t)requestEncoding;
- (os_unfair_recursive_lock_s)propertiesLock;
- (void)_personalizeKeychainOptionsForAccount:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAdditionalMetrics:(id)a3;
- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3;
- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3;
- (void)setAnisetteType:(int64_t)a3;
- (void)setBag:(id)a3;
- (void)setBagContract:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setCompressRequestBody:(BOOL)a3;
- (void)setDialogOptions:(int64_t)a3;
- (void)setDisableResponseDecoding:(BOOL)a3;
- (void)setEnableRemoteSecuritySigning:(BOOL)a3;
- (void)setEncodeCount:(int64_t)a3;
- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3;
- (void)setFairPlayDeviceIdentity:(id)a3;
- (void)setFpdiNetworkProvider:(id)a3;
- (void)setGroupRequestAccounts:(id)a3;
- (void)setGsTokenIdentifier:(id)a3;
- (void)setIncludeClientVersions:(BOOL)a3;
- (void)setInternalQueue:(id)a3;
- (void)setKeychainOptions:(id)a3;
- (void)setLogUUID:(id)a3;
- (void)setMescalType:(int64_t)a3;
- (void)setParentProperties:(id)a3;
- (void)setPaymentSheetTaskClass:(Class)a3;
- (void)setPreserveQueryParameterEncoding:(BOOL)a3;
- (void)setRequestEncoding:(int64_t)a3;
- (void)setResponseDecoder:(id)a3;
- (void)setShouldSetCookieHeader:(BOOL)a3;
- (void)setShouldSetCookiesFromResponse:(BOOL)a3;
- (void)setShouldSetStorefrontFromResponse:(BOOL)a3;
- (void)setShouldSetStorefrontHeader:(BOOL)a3;
- (void)setUrlKnownToBeTrusted:(BOOL)a3;
@end

@implementation AMSURLRequestEncoder

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_74(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = *(void **)(a1 + 32);
    v3 = [v2 properties];
    v4 = [v3 purchaseInfo];
    v5 = [v4 buyParams];
    v6 = [*(id *)(a1 + 40) bag];
    v7 = [*(id *)(a1 + 40) fairPlayDeviceIdentity];
    v8 = [*(id *)(a1 + 40) fpdiNetworkProvider];
    v9 = +[AMSURLRequestDecoration addFPDIHeadersToRequest:v2 buyParams:v5 bag:v6 retryCount:0 fairPlayDeviceIdentity:v7 fpdiNetworkProvider:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_77;
    v13[3] = &unk_1E55A0C70;
    v13[4] = *(void *)(a1 + 40);
    v10 = [v9 catchWithBlock:v13];
    v11 = [v10 promiseAdapter];
  }
  else
  {
    v3 = +[AMSBinaryPromise promiseWithSuccess];
    v11 = [v3 promiseAdapter];
  }

  return v11;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_33(uint64_t a1, uint64_t a2)
{
  v2 = +[AMSOptional optionalWithValue:a2];
  v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

id __53__AMSURLRequestEncoder__addCookiesToRequest_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = AMSLogKey();
      v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      v12 = };
      v13 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error adding AuthKit headers: %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v3;
      }
    }
  }
  v15 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v16 = [*(id *)(a1 + 32) clientInfo];
  v17 = [*(id *)(a1 + 32) bag];
  v18 = objc_msgSend(v15, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:", v14, v16, v17, 0);

  return v18;
}

- (void)setRequestEncoding:(int64_t)a3
{
  self->_requestEncoding = a3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_70(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) anisetteType];
  id v5 = [*(id *)(a1 + 40) bag];
  v6 = +[AMSURLRequestDecoration addAnisetteHeadersToRequest:v3 account:v2 type:v4 bag:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_71;
  v10[3] = &unk_1E55A0C70;
  v10[4] = *(void *)(a1 + 40);
  v7 = [v6 catchWithBlock:v10];
  v8 = [v7 promiseAdapter];

  return v8;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_72(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ams_isEphemeralAccount"))
  {
    uint64_t v2 = +[AMSBinaryPromise promiseWithSuccess];
    uint64_t v3 = [v2 promiseAdapter];
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v5 = *(void **)(a1 + 32);
    v6 = [*(id *)(a1 + 40) keychainOptions];
    objc_msgSend(v5, "ams_addBiometricsHeadersForAccount:options:", v4, v6);

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) mescalType];
    uint64_t v2 = [*(id *)(a1 + 40) bag];
    v9 = [*(id *)(a1 + 32) properties];
    uint64_t v10 = [v9 logUUID];
    uint64_t v11 = +[AMSURLRequestDecoration addMescalHeaderToRequest:v7 type:v8 bag:v2 logKey:v10];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_73;
    v14[3] = &unk_1E55A0C70;
    v14[4] = *(void *)(a1 + 40);
    v12 = [v11 catchWithBlock:v14];
    uint64_t v3 = [v12 promiseAdapter];
  }
  return v3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_68(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_addIssuingProcessHeader");
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) clientInfo];
  objc_msgSend(v2, "ams_addRequestingProcessWithClient:", v3);

  objc_msgSend(*(id *)(a1 + 32), "ams_addTimezoneOffsetHeader");
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) clientInfo];
  objc_msgSend(v4, "ams_addUserAgentHeaderFromClient:", v5);

  objc_msgSend(*(id *)(a1 + 32), "ams_addForwardedForHeader");
  uint64_t v6 = [*(id *)(a1 + 40) groupRequestAccounts];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [*(id *)(a1 + 40) groupRequestAccounts];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v11 = *(void **)(a1 + 32);
      v12 = [*(id *)(a1 + 40) groupRequestAccounts];
      objc_msgSend(v11, "ams_addXGroupDSIDsWithPrimaryAccount:andGroupAccounts:", v10, v12);
    }
  }
  [*(id *)(a1 + 40) _personalizeKeychainOptionsForAccount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v13 = *(void **)(a1 + 32);
  uint64_t v14 = [v13 properties];
  v15 = [v14 purchaseInfo];
  v16 = [v15 buyParams];
  v17 = [*(id *)(a1 + 40) bag];
  v18 = +[AMSURLRequestDecoration addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:](AMSURLRequestDecoration, "addAbsintheHeadersToRequest:buyParams:bag:shouldUseRemoteSigningIfAvailable:", v13, v16, v17, [*(id *)(a1 + 40) enableRemoteSecuritySigning]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_69;
  v22[3] = &unk_1E55A0C70;
  v22[4] = *(void *)(a1 + 40);
  v19 = [v18 catchWithBlock:v22];
  v20 = [v19 promiseAdapter];

  return v20;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 value];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v8) {
    goto LABEL_12;
  }
  uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = [*(id *)(a1 + 32) properties];
    v12 = [v11 logUUID];
    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v12)
    {
      uint64_t v2 = [*(id *)(a1 + 32) properties];
      uint64_t v3 = [v2 logUUID];
      [v13 stringWithFormat:@"%@: [%@] ", v15, v3];
    }
    else
    {
      [v13 stringWithFormat:@"%@: ", v14];
    v16 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v97 = (uint64_t)v16;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@We weren't provided an account and were unable to get the local account.", buf, 0xCu);
    if (v12)
    {

      v16 = v2;
    }
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v8)
  {
LABEL_12:
    id v17 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v34 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = objc_opt_class();
        v37 = [*(id *)(a1 + 32) properties];
        v38 = [v37 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v36;
        __int16 v98 = 2114;
        v99 = v38;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Somewhere along the lines the account has become a dangling pointer.", buf, 0x16u);
      }
      v33 = AMSError(0, @"Request encoding failed", @"The account object was no longer valid.", 0);
      goto LABEL_26;
    }
    id v18 = v17;
  }
  v19 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v19)
  {
    v19 = +[AMSLogConfig sharedConfig];
  }
  v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    v93 = [*(id *)(a1 + 32) properties];
    __int16 v22 = [v93 logUUID];
    v23 = [*(id *)(a1 + 48) URL];
    uint64_t v24 = AMSLogableURL(v23);
    v25 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) hashedDescription];
    v26 = [*(id *)(a1 + 40) clientInfo];
    v27 = [v26 accountMediaType];
    *(_DWORD *)buf = 138544386;
    uint64_t v97 = v21;
    __int16 v98 = 2114;
    v99 = v22;
    __int16 v100 = 2114;
    v101 = v24;
    __int16 v102 = 2114;
    v103 = v25;
    __int16 v104 = 2114;
    v105 = v27;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Encoding request for URL: %{public}@ { \n\taccount = %{public}@ \n\tmediaType = %{public}@ \n}", buf, 0x34u);
  }
  uint64_t v28 = *(void *)(a1 + 56);
  if (v28)
  {
    v29 = *(void **)(a1 + 32);
    uint64_t v30 = [*(id *)(a1 + 40) requestEncoding];
    uint64_t v31 = [*(id *)(a1 + 40) compressRequestBody];
    id v95 = 0;
    objc_msgSend(v29, "ams_setBodyParameters:encoding:compressBody:error:", v28, v30, v31, &v95);
    id v32 = v95;
    if (v32)
    {
      v33 = v32;
LABEL_26:
      v39 = +[AMSPromise promiseWithError:v33];
LABEL_39:

      goto LABEL_40;
    }
  }
  [*(id *)(a1 + 32) setValue:@"br, gzip, deflate", @"Accept-Encoding" forHTTPHeaderField];
  uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v41 = [*(id *)(a1 + 32) properties];
  [v41 setAccount:v40];

  v42 = [*(id *)(a1 + 40) additionalMetrics];
  v43 = [*(id *)(a1 + 32) properties];
  [v43 setAdditionalMetrics:v42];

  uint64_t v44 = [*(id *)(a1 + 40) anisetteType];
  v45 = [*(id *)(a1 + 32) properties];
  [v45 setAnisetteType:v44];

  v46 = [*(id *)(a1 + 40) bag];
  v47 = [*(id *)(a1 + 32) properties];
  [v47 setBag:v46];

  v48 = [*(id *)(a1 + 40) clientInfo];
  v49 = [*(id *)(a1 + 32) properties];
  [v49 setClientInfo:v48];

  uint64_t v50 = [*(id *)(a1 + 40) dialogOptions];
  v51 = [*(id *)(a1 + 32) properties];
  [v51 setDialogOptions:v50];

  v52 = [*(id *)(a1 + 40) gsTokenIdentifier];
  v53 = [*(id *)(a1 + 32) properties];
  [v53 setGsTokenIdentifier:v52];

  uint64_t v54 = [*(id *)(a1 + 40) excludeIdentifierHeadersForAccount];
  v55 = [*(id *)(a1 + 32) properties];
  [v55 setExcludeIdentifierHeadersForAccount:v54];

  v56 = [*(id *)(a1 + 40) keychainOptions];
  v57 = [*(id *)(a1 + 32) properties];
  [v57 setKeychainOptions:v56];

  uint64_t v58 = [*(id *)(a1 + 40) urlKnownToBeTrusted];
  v59 = [*(id *)(a1 + 32) properties];
  [v59 setKnownToBeTrusted:v58];

  uint64_t v60 = [*(id *)(a1 + 40) mescalType];
  v61 = [*(id *)(a1 + 32) properties];
  [v61 setMescalType:v60];

  v62 = [*(id *)(a1 + 40) responseDecoder];
  v63 = [*(id *)(a1 + 32) properties];
  [v63 setResponseDecoder:v62];

  uint64_t v64 = [*(id *)(a1 + 40) disableResponseDecoding];
  v65 = [*(id *)(a1 + 32) properties];
  [v65 setDisableResponseDecoding:v64];

  uint64_t v66 = [*(id *)(a1 + 40) enableRemoteSecuritySigning];
  v67 = [*(id *)(a1 + 32) properties];
  [v67 setRemoteSecuritySigningEnabled:v66];

  uint64_t v68 = [*(id *)(a1 + 40) shouldSetCookiesFromResponse];
  v69 = [*(id *)(a1 + 32) properties];
  [v69 setShouldSetCookiesFromResponse:v68];

  uint64_t v70 = [*(id *)(a1 + 40) shouldSetStorefrontFromResponse];
  v71 = [*(id *)(a1 + 32) properties];
  [v71 setShouldSetStorefrontFromResponse:v70];

  uint64_t v72 = [*(id *)(a1 + 40) paymentSheetTaskClass];
  v73 = [*(id *)(a1 + 32) properties];
  [v73 setPaymentSheetTaskClass:v72];

  v74 = [*(id *)(a1 + 40) parentProperties];

  if (v74)
  {
    v75 = [*(id *)(a1 + 40) parentProperties];
    v76 = [v75 purchaseInfo];
    v77 = [*(id *)(a1 + 32) properties];
    [v77 setPurchaseInfo:v76];

    uint64_t v78 = [*(id *)(a1 + 40) dialogOptions];
    v79 = *(void **)(a1 + 40);
    if (!v78)
    {
      v79 = [*(id *)(a1 + 40) parentProperties];
    }
    uint64_t v80 = [v79 dialogOptions];
    v81 = [*(id *)(a1 + 32) properties];
    [v81 setDialogOptions:v80];

    if (!v78) {
  }
    }
  if (([*(id *)(a1 + 40) excludeIdentifierHeadersForAccount] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "ams_addIdentifierHeadersForAccount:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  uint64_t v82 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v83 = *(void **)(a1 + 32);
  v84 = [*(id *)(a1 + 40) gsTokenIdentifier];
  objc_msgSend(v83, "ams_addGSTokenForAccount:identifier:", v82, v84);

  if ([*(id *)(a1 + 40) alwaysIncludeMMeClientInfoAndDeviceHeaders])
  {
    v85 = [*(id *)(a1 + 40) gsTokenIdentifier];

    if (!v85) {
      objc_msgSend(*(id *)(a1 + 32), "ams_addMMeClientInfoAndDeviceHeaders");
    }
  }
  if ([*(id *)(a1 + 40) shouldSetStorefrontHeader])
  {
    uint64_t v86 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v87 = *(void *)(a1 + 32);
    v33 = [*(id *)(a1 + 40) clientInfo];
    v88 = [v33 accountMediaType];
    v89 = [*(id *)(a1 + 40) bag];
    v90 = +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:v87 forAccount:v86 mediaType:v88 bag:v89];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_57;
    v94[3] = &unk_1E55A0C70;
    v94[4] = *(void *)(a1 + 40);
    v91 = [v90 catchWithBlock:v94];
    v39 = [v91 promiseAdapter];

    goto LABEL_39;
  }
  v39 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
LABEL_40:
  return v39;
}

- (AMSProcessInfo)clientInfo
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_clientInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSBagProtocol)bag
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_bag;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSKeychainOptions)keychainOptions
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_keychainOptions;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  return self->_excludeIdentifierHeadersForAccount;
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (int64_t)anisetteType
{
  return self->_anisetteType;
}

- (int64_t)mescalType
{
  return self->_mescalType;
}

- (BOOL)enableRemoteSecuritySigning
{
  return self->_enableRemoteSecuritySigning;
}

- (BOOL)urlKnownToBeTrusted
{
  return self->_urlKnownToBeTrusted;
}

- (BOOL)shouldSetStorefrontHeader
{
  return self->_shouldSetStorefrontHeader;
}

- (BOOL)shouldSetStorefrontFromResponse
{
  return self->_shouldSetStorefrontFromResponse;
}

- (BOOL)shouldSetCookiesFromResponse
{
  return self->_shouldSetCookiesFromResponse;
}

- (AMSResponseDecoding)responseDecoder
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_responseDecoder;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSURLRequestProperties)parentProperties
{
  return self->_parentProperties;
}

- (BOOL)disableResponseDecoding
{
  return self->_disableResponseDecoding;
}

- (int64_t)dialogOptions
{
  return self->_dialogOptions;
}

- (BOOL)alwaysIncludeMMeClientInfoAndDeviceHeaders
{
  return self->_alwaysIncludeMMeClientInfoAndDeviceHeaders;
}

- (NSDictionary)additionalMetrics
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_additionalMetrics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_65(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_addAcceptLanguageHeader");
  objc_msgSend(*(id *)(a1 + 32), "ams_addCacheBusterParameterWithPreservedQueryEncoding:", objc_msgSend(*(id *)(a1 + 40), "preserveQueryParameterEncoding"));
  objc_msgSend(*(id *)(a1 + 32), "ams_addCachePolicyHeader");
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) clientInfo];
  objc_msgSend(v2, "ams_addClientIdentifierHeaderForClient:", v3);

  if ([*(id *)(a1 + 40) includeClientVersions])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) clientInfo];
    objc_msgSend(v4, "ams_addClientVersionsForClient:", v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "ams_addConnectionTypeHeader");
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) bag];
  uint64_t v8 = +[AMSURLRequestDecoration addGUIDParameterToRequest:bag:preservingQueryEncoding:](AMSURLRequestDecoration, "addGUIDParameterToRequest:bag:preservingQueryEncoding:", v6, v7, [*(id *)(a1 + 40) preserveQueryParameterEncoding]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_66;
  v12[3] = &unk_1E55A0C70;
  v12[4] = *(void *)(a1 + 40);
  uint64_t v9 = [v8 catchWithBlock:v12];
  uint64_t v10 = [v9 promiseAdapter];

  return v10;
}

- (BOOL)preserveQueryParameterEncoding
{
  return self->_preserveQueryParameterEncoding;
}

- (BOOL)includeClientVersions
{
  return self->_includeClientVersions;
}

- (NSArray)groupRequestAccounts
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_groupRequestAccounts;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_personalizeKeychainOptionsForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13 = v4;
    uint64_t v5 = [(AMSURLRequestEncoder *)self keychainOptions];

    if (!v5 && (objc_msgSend(v13, "ams_isLocalAccount") & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v7 = [v6 processName];
      int v8 = [v7 isEqualToString:@"AppStore"];

      if (v8)
      {
        uint64_t v9 = objc_alloc_init(AMSKeychainOptions);
        [(AMSURLRequestEncoder *)self setKeychainOptions:v9];

        uint64_t v10 = [(AMSURLRequestEncoder *)self keychainOptions];
        [v10 setPurpose:1];

        unint64_t v11 = +[AMSKeychainOptions preferredAttestationStyle];
        v12 = [(AMSURLRequestEncoder *)self keychainOptions];
        [v12 setStyle:v11];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (int64_t)requestEncoding
{
  return self->_requestEncoding;
}

- (BOOL)compressRequestBody
{
  return self->_compressRequestBody;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) URL];
  uint64_t v3 = objc_msgSend(v2, "ams_URLBySortingQueryParameters");
  [*(id *)(a1 + 32) setURL:v3];

  id v4 = [*(id *)(a1 + 40) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_79;
  block[3] = &unk_1E559EA90;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v4, block);

  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
  }
  else
  {
    uint64_t v6 = AMSError(300, @"Request encoding failed", @"The request encoder finished with a nil request", 0);
    uint64_t v5 = +[AMSPromise promiseWithError:v6];
  }
  return v5;
}

void __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] logUUID];
  if (!v2
    || [a1[4] encodeCount] >= 1
    && ([NSString stringWithFormat:@"%@_%ld", v2, objc_msgSend(a1[4], "encodeCount")],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        (uint64_t v2 = (void *)v3) == 0))
  {
    uint64_t v2 = AMSGenerateLogCorrelationKey();
  }
  id v4 = [a1[5] properties];
  [v4 setLogUUID:v2];

  id v5 = AMSSetLogKey(v2);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__74;
  v37 = __Block_byref_object_dispose__74;
  id v38 = [a1[4] account];
  if (v34[5])
  {
    uint64_t v6 = +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:");
    uint64_t v7 = +[AMSPromise promiseWithResult:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1E4F179C8];
    uint64_t v9 = [a1[4] clientInfo];
    uint64_t v6 = objc_msgSend(v8, "ams_sharedAccountStoreForProcessInfo:", v9);

    if (v6)
    {
      uint64_t v10 = objc_msgSend(v6, "ams_mediaType");
      unint64_t v11 = objc_msgSend(v6, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v10, 1);
      uint64_t v7 = [v11 thenWithBlock:&__block_literal_global_36_0];
    }
    else
    {
      v12 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v12)
      {
        v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = [a1[5] properties];
        v16 = [v15 logUUID];
        id v17 = [a1[6] URL];
        id v18 = AMSLogableURL(v17);
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = v14;
        __int16 v41 = 2114;
        v42 = v16;
        __int16 v43 = 2114;
        uint64_t v44 = v18;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch shared ACAccountStore. Request encoding will continue without an account. Request URL: %{public}@", buf, 0x20u);
      }
      uint64_t v10 = +[AMSOptional optionalWithNil];
      uint64_t v7 = +[AMSPromise promiseWithResult:v10];
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2;
  v27[3] = &unk_1E55A7AC0;
  id v32 = &v33;
  id v19 = a1[5];
  id v20 = a1[4];
  id v28 = v19;
  id v29 = v20;
  id v30 = a1[6];
  id v31 = a1[7];
  uint64_t v21 = [v7 continueWithBlock:v27];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_61;
  v24[3] = &unk_1E55A7AE8;
  id v22 = a1[5];
  v24[4] = a1[4];
  id v25 = v22;
  v26 = &v33;
  v23 = [v21 thenWithBlock:v24];

  [a1[8] finishWithPromise:v23];
  _Block_object_dispose(&v33, 8);
}

- (NSString)logUUID
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_logUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (ACAccount)account
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_account;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)encodeCount
{
  return self->_encodeCount;
}

+ (AMSBagKeySet)bagKeySet
{
  uint64_t v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSURLRequestEncoder)init
{
  v17.receiver = self;
  v17.super_class = (Class)AMSURLRequestEncoder;
  uint64_t v2 = [(AMSURLRequestEncoder *)&v17 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_propertiesLock = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AMSURLRequestEncoder", v4);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    *(_WORD *)&v3->_alwaysIncludeAuthKitHeaders = 0;
    v3->_anisetteType = 0;
    uint64_t v7 = +[AMSProcessInfo currentProcess];
    clientInfo = v3->_clientInfo;
    v3->_clientInfo = (AMSProcessInfo *)v7;

    v3->_encodeCount = 0;
    v3->_excludeIdentifierHeadersForAccount = 0;
    v3->_includeClientVersions = 1;
    uint64_t v9 = AMSLogKey();
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v9;

    v3->_mescalType = 1;
    *(_WORD *)&v3->_shouldSetCookiesFromResponse = 257;
    *(_WORD *)&v3->_shouldSetStorefrontHeader = 257;
    unint64_t v11 = +[AMSURLSession defaultSession];
    uint64_t v12 = [v11 session];
    fpdiNetworkProvider = v3->_fpdiNetworkProvider;
    v3->_fpdiNetworkProvider = (AMSFairPlayDeviceIdentityNetworkProviderProtocol *)v12;

    uint64_t v14 = +[AMSFairPlayDeviceIdentity shared];
    fairPlayDeviceIdentity = v3->_fairPlayDeviceIdentity;
    v3->_fairPlayDeviceIdentity = (AMSFairPlayDeviceIdentity *)v14;
  }
  return v3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_62(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = AMSLogKey();
      uint64_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      uint64_t v12 = };
      v13 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to add cookies to request. error = %{public}@", buf, 0x16u);
      if (v8)
      {

        uint64_t v12 = (void *)v3;
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = [*(id *)(a1 + 32) clientInfo];
  v16 = [v15 treatmentNamespace];
  objc_super v17 = +[AMSURLRequestDecoration addTreatmentHeadersToRequest:v14 forTreatmentNamespace:v16];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_63;
  v21[3] = &unk_1E55A0C70;
  v21[4] = *(void *)(a1 + 32);
  id v18 = [v17 catchWithBlock:v21];
  id v19 = [v18 promiseAdapter];

  return v19;
}

- (void)setMescalType:(int64_t)a3
{
  self->_mescalType = a3;
}

- (void)setAnisetteType:(int64_t)a3
{
  self->_anisetteType = a3;
}

uint64_t __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_79(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 encodeCount] + 1;
  return [v1 setEncodeCount:v2];
}

- (void)setClientInfo:(id)a3
{
  id v4 = (AMSProcessInfo *)a3;
  os_unfair_recursive_lock_lock_with_options();
  clientInfo = self->_clientInfo;
  self->_clientInfo = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setLogUUID:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_recursive_lock_lock_with_options();
  logUUID = self->_logUUID;
  self->_logUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setIncludeClientVersions:(BOOL)a3
{
  self->_includeClientVersions = a3;
}

- (void)setUrlKnownToBeTrusted:(BOOL)a3
{
  self->_urlKnownToBeTrusted = a3;
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5
{
  return [(AMSURLRequestEncoder *)self requestWithMethod:a3 URL:a4 headers:0 parameters:a5];
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 headers:(id)a5 parameters:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F18D50];
  id v11 = a6;
  id v12 = a5;
  v13 = [v10 requestWithURL:a4];
  uint64_t v14 = [(AMSURLRequestEncoder *)self _methodStringFromMethod:a3];
  [v13 setHTTPMethod:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__AMSURLRequestEncoder_requestWithMethod_URL_headers_parameters___block_invoke;
  v18[3] = &unk_1E55A2E38;
  id v19 = v13;
  id v15 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v18];

  v16 = [(AMSURLRequestEncoder *)self requestByEncodingRequest:v15 parameters:v11];

  return v16;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_alloc_init(AMSMutablePromise);
  uint64_t v9 = (void *)[v6 copy];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    uint64_t v10 = [[AMSURLRequest alloc] initWithRequest:v6];
    goto LABEL_6;
  }
  uint64_t v10 = v9;

  if (!v10) {
    goto LABEL_5;
  }
LABEL_6:
  id v11 = [(AMSURLRequestEncoder *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  block[3] = &unk_1E55A2258;
  block[4] = self;
  id v20 = v10;
  id v21 = v6;
  id v22 = v7;
  id v12 = v8;
  v23 = v12;
  id v13 = v7;
  id v14 = v6;
  id v15 = v10;
  dispatch_async(v11, block);

  v16 = v23;
  objc_super v17 = v12;

  return v17;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (id)_methodStringFromMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_1E55A7B08[a3];
  }
}

- (void)setShouldSetStorefrontHeader:(BOOL)a3
{
  self->_shouldSetStorefrontHeader = a3;
}

- (void)setShouldSetCookieHeader:(BOOL)a3
{
  self->_shouldSetCookieHeader = a3;
}

- (void)setPreserveQueryParameterEncoding:(BOOL)a3
{
  self->_preserveQueryParameterEncoding = a3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_61(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _addCookiesToRequest:*(void *)(a1 + 40) account:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v3 = [v2 promiseAdapter];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_62;
  v48[3] = &unk_1E559E6F8;
  id v4 = *(void **)(a1 + 40);
  v48[4] = *(void *)(a1 + 32);
  id v49 = v4;
  id v5 = [v3 continueWithBlock:v48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_65;
  v45[3] = &unk_1E559E578;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v46 = v6;
  uint64_t v47 = v7;
  int v8 = [v5 thenWithBlock:v45];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_68;
  v41[3] = &unk_1E55A7AE8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v42 = v9;
  uint64_t v43 = v10;
  uint64_t v44 = *(void *)(a1 + 48);
  id v11 = [v8 thenWithBlock:v41];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_70;
  v37[3] = &unk_1E55A7AE8;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v38 = v12;
  uint64_t v39 = v14;
  uint64_t v40 = v13;
  id v15 = [v11 thenWithBlock:v37];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_72;
  v33[3] = &unk_1E55A7AE8;
  v16 = *(void **)(a1 + 40);
  uint64_t v36 = *(void *)(a1 + 48);
  id v17 = v16;
  uint64_t v18 = *(void *)(a1 + 32);
  id v34 = v17;
  uint64_t v35 = v18;
  id v19 = [v15 thenWithBlock:v33];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_74;
  v30[3] = &unk_1E559E578;
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 32);
  id v31 = v20;
  uint64_t v32 = v21;
  id v22 = [v19 thenWithBlock:v30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_78;
  v27[3] = &unk_1E559E578;
  id v23 = *(id *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 32);
  id v28 = v23;
  uint64_t v29 = v24;
  id v25 = [v22 thenWithBlock:v27];

  return v25;
}

- (id)_addCookiesToRequest:(id)a3 account:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(AMSURLRequestEncoder *)self shouldSetCookieHeader])
  {
    if (!v8
      || (objc_msgSend(v8, "ams_isLocalAccount") & 1) != 0
      || objc_msgSend(v8, "ams_isEphemeralAccount"))
    {
      BOOL v9 = [(AMSURLRequestEncoder *)self alwaysIncludeAuthKitHeaders];
      uint64_t v10 = +[AMSLogConfig sharedURLLoadingConfig];
      id v11 = (void *)v10;
      if (!v9)
      {
        if (!v10)
        {
          id v11 = +[AMSLogConfig sharedConfig];
        }
        id v25 = [v11 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = AMSLogKey();
          v27 = NSString;
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = v28;
          if (v26)
          {
            uint64_t v4 = AMSLogKey();
            [v27 stringWithFormat:@"%@: [%@] ", v29, v4];
          }
          else
          {
            [v27 stringWithFormat:@"%@: ", v28];
          id v30 = };
          v37 = AMSHashIfNeeded(v8);
          *(_DWORD *)buf = 138543618;
          uint64_t v45 = v30;
          __int16 v46 = 2114;
          uint64_t v47 = v37;
          _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Request is unpersonalized, adding cookies. account = %{public}@", buf, 0x16u);
          if (v26)
          {

            id v30 = (void *)v4;
          }
        }
        id v38 = [(AMSURLRequestEncoder *)self clientInfo];
        uint64_t v39 = [(AMSURLRequestEncoder *)self bag];
        id v31 = objc_msgSend(v7, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:", v8, v38, v39, 1);

        goto LABEL_46;
      }
      if (!v10)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        if (![(AMSURLRequestEncoder *)self excludeIdentifierHeadersForAccount]) {
          objc_msgSend(v7, "ams_addPrimaryiCloudIdentifierHeader");
        }
        id v38 = objc_msgSend(v7, "ams_addAuthKitHeaders");
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __53__AMSURLRequestEncoder__addCookiesToRequest_account___block_invoke;
        v41[3] = &unk_1E55A1D20;
        void v41[4] = self;
        id v42 = v7;
        id v43 = v8;
        id v31 = [v38 continueWithBlock:v41];

LABEL_46:
        goto LABEL_47;
      }
      uint64_t v13 = AMSLogKey();
      uint64_t v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        uint64_t v4 = AMSLogKey();
        [v14 stringWithFormat:@"%@: [%@] ", v16, v4];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      id v17 = };
      uint64_t v35 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v17;
      __int16 v46 = 2114;
      uint64_t v47 = v35;
      uint64_t v36 = "%{public}@Request is unpersonalized, but requested authkit headers and adding cookies. account = %{public}@";
    }
    else
    {
      id v11 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v11)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      uint64_t v13 = AMSLogKey();
      uint64_t v32 = NSString;
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = v33;
      if (v13)
      {
        uint64_t v4 = AMSLogKey();
        [v32 stringWithFormat:@"%@: [%@] ", v34, v4];
      }
      else
      {
        [v32 stringWithFormat:@"%@: ", v33];
      id v17 = };
      uint64_t v35 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v17;
      __int16 v46 = 2114;
      uint64_t v47 = v35;
      uint64_t v36 = "%{public}@Request is personalized, adding personalized headers and cookies. account = %{public}@";
    }
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);
    if (v13)
    {

      id v17 = (void *)v4;
    }

    goto LABEL_43;
  }
  uint64_t v18 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v18)
  {
    uint64_t v18 = +[AMSLogConfig sharedConfig];
  }
  id v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = AMSLogKey();
    uint64_t v21 = NSString;
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = v22;
    if (v20)
    {
      AMSLogKey();
      self = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      [v21 stringWithFormat:@"%@: [%@] ", v23, self];
    }
    else
    {
      [v21 stringWithFormat:@"%@: ", v22];
    uint64_t v24 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v45 = v24;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Request cookies are disabled. No cookie header will be added.", buf, 0xCu);
    if (v20)
    {

      uint64_t v24 = self;
    }
  }
  [v7 setHTTPShouldHandleCookies:0];
  id v31 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_47:

  return v31;
}

- (BOOL)shouldSetCookieHeader
{
  return self->_shouldSetCookieHeader;
}

- (BOOL)alwaysIncludeAuthKitHeaders
{
  return self->_alwaysIncludeAuthKitHeaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_fpdiNetworkProvider, 0);
  objc_storeStrong((id *)&self->_parentProperties, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_bagContract, 0);
  objc_storeStrong((id *)&self->_paymentSheetTaskClass, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_groupRequestAccounts, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setEncodeCount:(int64_t)a3
{
  self->_encodeCount = a3;
}

- (void)setAlwaysIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_alwaysIncludeMMeClientInfoAndDeviceHeaders = a3;
}

- (void)setAlwaysIncludeAuthKitHeaders:(BOOL)a3
{
  self->_alwaysIncludeAuthKitHeaders = a3;
}

- (void)setGsTokenIdentifier:(id)a3
{
}

- (void)setDialogOptions:(int64_t)a3
{
  self->_dialogOptions = a3;
}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  self->_disableResponseDecoding = a3;
}

- (AMSURLRequestEncoder)initWithBag:(id)a3
{
  id v5 = a3;
  id v6 = [(AMSURLRequestEncoder *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

- (void)setAccount:(id)a3
{
  uint64_t v4 = (ACAccount *)a3;
  os_unfair_recursive_lock_lock_with_options();
  account = self->_account;
  self->_account = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setResponseDecoder:(id)a3
{
  uint64_t v4 = (AMSResponseDecoding *)a3;
  os_unfair_recursive_lock_lock_with_options();
  responseDecoder = self->_responseDecoder;
  self->_responseDecoder = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  self->_excludeIdentifierHeadersForAccount = a3;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_66(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add GUID parameters. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      uint64_t v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

- (void)setAdditionalMetrics:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  os_unfair_recursive_lock_lock_with_options();
  additionalMetrics = self->_additionalMetrics;
  self->_additionalMetrics = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setBag:(id)a3
{
  uint64_t v4 = (AMSBagProtocol *)a3;
  os_unfair_recursive_lock_lock_with_options();
  bag = self->_bag;
  self->_bag = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setGroupRequestAccounts:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  os_unfair_recursive_lock_lock_with_options();
  groupRequestAccounts = self->_groupRequestAccounts;
  self->_groupRequestAccounts = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setKeychainOptions:(id)a3
{
  uint64_t v4 = (AMSKeychainOptions *)a3;
  os_unfair_recursive_lock_lock_with_options();
  keychainOptions = self->_keychainOptions;
  self->_keychainOptions = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5
{
  return [(AMSURLRequestEncoder *)self requestWithMethod:a3 bagURL:a4 headers:0 parameters:a5];
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 headers:(id)a5 parameters:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    uint64_t v13 = objc_alloc_init(AMSMutablePromise);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__AMSURLRequestEncoder_requestWithMethod_bagURL_headers_parameters___block_invoke;
    v19[3] = &unk_1E55A7A78;
    uint64_t v14 = v13;
    id v20 = v14;
    uint64_t v21 = self;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    [v10 valueWithCompletion:v19];
    uint64_t v15 = v23;
    __int16 v16 = v14;
  }
  else
  {
    id v17 = AMSError(2, @"URL Encoder Error", @"bagURL is nil", 0);
    __int16 v16 = +[AMSPromise promiseWithError:v17];
  }
  return v16;
}

void __68__AMSURLRequestEncoder_requestWithMethod_bagURL_headers_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 finishWithError:a4];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) requestWithMethod:*(void *)(a1 + 64) URL:a2 headers:*(void *)(a1 + 48) parameters:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) finishWithPromise:v6];
  }
}

uint64_t __65__AMSURLRequestEncoder_requestWithMethod_URL_headers_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_152 != -1) {
    dispatch_once(&_MergedGlobals_152, &__block_literal_global_136);
  }
  uint64_t v2 = (void *)qword_1EB38E048;
  return (NSString *)v2;
}

void __37__AMSURLRequestEncoder_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38E048;
  qword_1EB38E048 = @"AMSCore";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38E050 != -1) {
    dispatch_once(&qword_1EB38E050, &__block_literal_global_20_1);
  }
  uint64_t v2 = (void *)qword_1EB38E058;
  return (NSString *)v2;
}

void __44__AMSURLRequestEncoder_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38E058;
  qword_1EB38E058 = @"1";
}

+ (id)createBagForSubProfile
{
  uint64_t v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add storefront header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add treatment headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_69(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Absinthe headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_71(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Anisette headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_73(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add Mescal headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

id __60__AMSURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke_2_77(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
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
    id v10 = };
    id v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add FPDI headers. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  id v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

- (AMSURLRequestEncoder)initWithBagContract:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(AMSURLRequestEncoder *)self initWithBag:v5];

  return v6;
}

- (AMSURLBagContract)bagContract
{
  id v3 = [AMSDeprecatedBagContract alloc];
  id v4 = [(AMSURLRequestEncoder *)self bag];
  id v5 = [(AMSDeprecatedBagContract *)v3 initWithBag:v4];

  return (AMSURLBagContract *)v5;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(AMSURLRequestEncoder *)self requestByEncodingRequest:v8 parameters:a4];
  id v10 = [v9 resultWithError:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = [v10 URL];
    [v11 setURL:v12];

    uint64_t v13 = [v10 HTTPMethod];
    [v11 setHTTPMethod:v13];

    uint64_t v14 = [v10 HTTPBody];

    if (v14)
    {
      uint64_t v15 = [v10 HTTPBody];
      [v11 setHTTPBody:v15];
    }
    __int16 v16 = [v10 allHTTPHeaderFields];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__AMSURLRequestEncoder_requestByEncodingRequest_parameters_error___block_invoke;
    v19[3] = &unk_1E55A2E38;
    id v20 = v11;
    id v17 = v11;
    [v16 enumerateKeysAndObjectsUsingBlock:v19];
  }
  return v10;
}

uint64_t __66__AMSURLRequestEncoder_requestByEncodingRequest_parameters_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 error:(id *)a5
{
  return [(AMSURLRequestEncoder *)self requestWithMethod:a3 bagURL:a4 parameters:0 error:a5];
}

- (id)requestWithMethod:(int64_t)a3 bagURL:(id)a4 parameters:(id)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = [a4 valueWithError:a6];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F18D50] requestWithURL:v11];
    uint64_t v13 = [(AMSURLRequestEncoder *)self _methodStringFromMethod:a3];
    [v12 setHTTPMethod:v13];

    uint64_t v14 = [(AMSURLRequestEncoder *)self requestByEncodingRequest:v12 parameters:v10 error:a6];
  }
  else
  {
    uint64_t v15 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    __int16 v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v17 = v20;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Request encoding failed. bagURL returns a nil value.", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 error:(id *)a5
{
  return [(AMSURLRequestEncoder *)self requestWithMethod:a3 URL:a4 parameters:0 error:a5];
}

- (id)requestWithMethod:(int64_t)a3 URL:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F18D50];
  id v11 = a5;
  id v12 = [v10 requestWithURL:a4];
  uint64_t v13 = [(AMSURLRequestEncoder *)self _methodStringFromMethod:a3];
  [v12 setHTTPMethod:v13];

  uint64_t v14 = [(AMSURLRequestEncoder *)self requestByEncodingRequest:v12 parameters:v11 error:a6];

  return v14;
}

- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 error:(id *)a5
{
  return [(AMSURLRequestEncoder *)self requestWithMethod:a3 URLString:a4 parameters:0 error:a5];
}

- (id)requestWithMethod:(int64_t)a3 URLString:(id)a4 parameters:(id)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CB10] URLWithString:a4];
  if (v11)
  {
    id v12 = [(AMSURLRequestEncoder *)self requestWithMethod:a3 URL:v11 parameters:v10 error:a6];
  }
  else
  {
    uint64_t v13 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v15 = v18;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Request encoding failed. requestURL = nil.", (uint8_t *)&v17, 0xCu);
    }
    if (a6)
    {
      AMSError(300, @"Invalid Request", @"Request URL is nil", 0);
      id v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (void)setCompressRequestBody:(BOOL)a3
{
  self->_compressRequestBody = a3;
}

- (void)setEnableRemoteSecuritySigning:(BOOL)a3
{
  self->_enableRemoteSecuritySigning = a3;
}

- (void)setShouldSetCookiesFromResponse:(BOOL)a3
{
  self->_shouldSetCookiesFromResponse = a3;
}

- (void)setShouldSetStorefrontFromResponse:(BOOL)a3
{
  self->_shouldSetStorefrontFromResponse = a3;
}

- (Class)paymentSheetTaskClass
{
  return self->_paymentSheetTaskClass;
}

- (void)setPaymentSheetTaskClass:(Class)a3
{
}

- (void)setBagContract:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (os_unfair_recursive_lock_s)propertiesLock
{
  return self->_propertiesLock;
}

- (void)setParentProperties:(id)a3
{
}

- (AMSFairPlayDeviceIdentityNetworkProviderProtocol)fpdiNetworkProvider
{
  return self->_fpdiNetworkProvider;
}

- (void)setFpdiNetworkProvider:(id)a3
{
}

- (AMSFairPlayDeviceIdentity)fairPlayDeviceIdentity
{
  return self->_fairPlayDeviceIdentity;
}

- (void)setFairPlayDeviceIdentity:(id)a3
{
}

@end