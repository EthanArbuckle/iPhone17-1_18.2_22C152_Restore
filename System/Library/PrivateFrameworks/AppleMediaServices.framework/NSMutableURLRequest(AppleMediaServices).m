@interface NSMutableURLRequest(AppleMediaServices)
- (AMSMutablePromise)_ams_authKitHeaders;
- (AMSPromiseSerialQueue)_ams_promiseSerialQueue;
- (id)_ams_separateCookies:()AppleMediaServices;
- (id)ams_addAuthKitHeaders;
- (id)ams_addCookiesAsynchronouslyForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:;
- (id)ams_addHeadersFromPromise:()AppleMediaServices;
- (id)ams_modifyRequestWithBlock:()AppleMediaServices;
- (uint64_t)ams_addCacheBusterParameterWithPreservedQueryEncoding:()AppleMediaServices;
- (uint64_t)ams_addCachePolicyHeader;
- (uint64_t)ams_addConnectionTypeHeader;
- (uint64_t)ams_addContentTypeHeaderForEncoding:()AppleMediaServices;
- (uint64_t)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:;
- (uint64_t)ams_addForwardedForHeader;
- (uint64_t)ams_addHeaders:()AppleMediaServices;
- (uint64_t)ams_removeAnisetteHeaders;
- (uint64_t)ams_removeFPDIHeaders;
- (uint64_t)ams_setBodyParameters:()AppleMediaServices encoding:compressBody:error:;
- (void)_ams_addCookies:()AppleMediaServices;
- (void)_ams_replaceCookies:()AppleMediaServices;
- (void)ams_addAcceptLanguageHeader;
- (void)ams_addAuthorizationHeaderForAccount:()AppleMediaServices;
- (void)ams_addBiometricsHeadersForAccount:()AppleMediaServices options:;
- (void)ams_addClientIdentifierHeaderForClient:()AppleMediaServices;
- (void)ams_addClientVersionsForClient:()AppleMediaServices;
- (void)ams_addContentLengthHeaderForData:()AppleMediaServices;
- (void)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:;
- (void)ams_addGSTokenForAccount:()AppleMediaServices identifier:;
- (void)ams_addIdentifierHeadersForAccount:()AppleMediaServices;
- (void)ams_addIssuingProcessHeader;
- (void)ams_addMMeClientInfoAndDeviceHeaders;
- (void)ams_addPrimaryiCloudIdentifierHeader;
- (void)ams_addRequestingProcessWithClient:()AppleMediaServices;
- (void)ams_addSilentEnrollmentHeadersForAccount:()AppleMediaServices;
- (void)ams_addTimezoneOffsetHeader;
- (void)ams_addUserAgentHeaderFromClient:()AppleMediaServices;
- (void)ams_addXGroupDSIDsWithPrimaryAccount:()AppleMediaServices andGroupAccounts:;
- (void)ams_addXTokenHeaderWithAccount:()AppleMediaServices;
@end

@implementation NSMutableURLRequest(AppleMediaServices)

- (id)ams_modifyRequestWithBlock:()AppleMediaServices
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_ams_promiseSerialQueue");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__NSMutableURLRequest_AppleMediaServices__ams_modifyRequestWithBlock___block_invoke;
  v9[3] = &unk_1E55A8B70;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 runBinaryPromiseBlock:v9];

  return v7;
}

- (id)ams_addHeadersFromPromise:()AppleMediaServices
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_ams_promiseSerialQueue");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke;
  v9[3] = &unk_1E55A7900;
  id v10 = v4;
  v11 = a1;
  id v6 = v4;
  v7 = [v5 runBinaryPromiseBlock:v9];

  return v7;
}

- (AMSPromiseSerialQueue)_ams_promiseSerialQueue
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &_ams_promiseSerialQueue_queueKey);
  v2 = (AMSPromiseSerialQueue *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AMSPromiseSerialQueue);
    objc_setAssociatedObject(v1, &_ams_promiseSerialQueue_queueKey, v2, (void *)1);
  }
  objc_sync_exit(v1);

  return v2;
}

- (void)ams_addGSTokenForAccount:()AppleMediaServices identifier:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    id v8 = a3;
    objc_msgSend(a1, "ams_addMMeClientInfoAndDeviceHeaders");
    v9 = [v8 accountStore];
    id v18 = 0;
    id v10 = objc_msgSend(v9, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v8, v7, &v18);

    id v11 = v18;
    if (v11 || !v10)
    {
      v12 = +[AMSLogConfig sharedConfig];
      if (!v12)
      {
        v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_opt_class();
        id v15 = v14;
        v16 = AMSLogKey();
        v17 = AMSLogableError(v11);
        *(_DWORD *)buf = 138543874;
        v20 = v14;
        __int16 v21 = 2114;
        v22 = v16;
        __int16 v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch GrandSlam token. %{public}@", buf, 0x20u);
      }
    }
    [a1 setValue:v10 forHTTPHeaderField:@"X-Apple-GS-Token"];
    [a1 setValue:v7 forHTTPHeaderField:@"X-Apple-GS-Token-Identifier"];
  }
}

- (void)ams_addIdentifierHeadersForAccount:()AppleMediaServices
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ams_DSID");
  id v6 = [v5 stringValue];
  [a1 setValue:v6 forHTTPHeaderField:@"X-DSID"];

  objc_msgSend(v4, "ams_altDSID");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [a1 setValue:v7 forHTTPHeaderField:@"X-Apple-ADSID"];
}

- (uint64_t)ams_addCacheBusterParameterWithPreservedQueryEncoding:()AppleMediaServices
{
  if ((a3 & 1) == 0)
  {
    id v4 = +[AMSProcessInfo currentProcess];
    v5 = [v4 bundleIdentifier];
    if ([v5 isEqualToString:@"com.apple.Music"])
    {
    }
    else
    {
      id v6 = +[AMSProcessInfo currentProcess];
      id v7 = [v6 bundleIdentifier];
      int v8 = [v7 isEqualToString:@"com.apple.TVMusic"];

      if (!v8)
      {
        v9 = [a1 URL];
        id v10 = objc_msgSend(v9, "ams_parameters");
        v19 = (void *)[v10 mutableCopy];
        if (!v19)
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v12 = 0;
          uint64_t v13 = 0;
          goto LABEL_9;
        }
        id v12 = v19;
        uint64_t v13 = 0;
        goto LABEL_7;
      }
    }
  }
  v9 = [a1 URL];
  id v10 = objc_msgSend(v9, "ams_unmodifiedParameters");
  id v11 = (void *)[v10 mutableCopy];
  if (!v11)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_9;
  }
  id v12 = v11;
  uint64_t v13 = 1;
LABEL_7:
  id v21 = v12;
LABEL_9:

  if (+[AMSDefaults alwaysSendCacheBuster])
  {
    v14 = [v21 objectForKeyedSubscript:@"buster"];

    if (!v14)
    {
      id v15 = [MEMORY[0x1E4F29128] UUID];
      v16 = [v15 UUIDString];

      [v21 setObject:v16 forKeyedSubscript:@"buster"];
      v17 = [a1 URL];
      id v18 = objc_msgSend(v17, "ams_URLByReplaceingQueryParameters:withEncodedParameters:", v21, v13);

      [a1 setURL:v18];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)ams_addAcceptLanguageHeader
{
  id v2 = +[AMSDevice language];
  [a1 setValue:v2 forHTTPHeaderField:@"Accept-Language"];
}

- (void)ams_addClientIdentifierHeaderForClient:()AppleMediaServices
{
  id v4 = [a3 bundleIdentifier];
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-Client-Application"];
}

- (uint64_t)ams_addCachePolicyHeader
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    unint64_t v3 = [a1 cachePolicy];
    if (v3 > 5) {
      id v4 = @"Unknown";
    }
    else {
      id v4 = off_1E55A8B90[v3];
    }
    return [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-NSURLCachePolicy"];
  }
  return result;
}

- (void)ams_addUserAgentHeaderFromClient:()AppleMediaServices
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[AMSProcessInfo currentProcess];
  }
  id v10 = v4;
  v5 = [v4 bundleIdentifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28F80] processInfo];
    id v7 = [v8 processName];
  }
  if ([v7 length])
  {
    v9 = +[AMSUserAgent userAgentForProcessInfo:v10];
    if (v9) {
      [a1 setValue:v9 forHTTPHeaderField:@"User-Agent"];
    }
  }
}

- (void)ams_addTimezoneOffsetHeader
{
  id v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v2 = [v5 secondsFromGMT];
  unint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v2];
  id v4 = [v3 stringValue];
  [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-Tz"];
}

- (void)ams_addRequestingProcessWithClient:()AppleMediaServices
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    id v4 = [v5 bundleIdentifier];
    [a1 setValue:v4 forHTTPHeaderField:@"X-Apple-Requesting-Process"];
  }
}

- (void)ams_addIssuingProcessHeader
{
  if (os_variant_has_internal_content())
  {
    id v3 = +[AMSProcessInfo currentProcess];
    uint64_t v2 = [v3 bundleIdentifier];
    [a1 setValue:v2 forHTTPHeaderField:@"X-Apple-Issuing-Process"];
  }
}

- (uint64_t)ams_addForwardedForHeader
{
  uint64_t v2 = +[AMSDefaults forwardedForIPAddress];
  if (v2) {
    [a1 setValue:v2 forHTTPHeaderField:@"X-Forwarded-For"];
  }
  return MEMORY[0x1F41817F8]();
}

- (uint64_t)ams_addConnectionTypeHeader
{
  return [a1 setValue:0 forHTTPHeaderField:@"X-Apple-Connection-Type"];
}

- (void)ams_addBiometricsHeadersForAccount:()AppleMediaServices options:
{
  if (a3)
  {
    if (a4)
    {
      id v5 = +[AMSBiometrics headersWithAccount:options:signatureResult:](AMSBiometrics, "headersWithAccount:options:signatureResult:");
      id v6 = [a1 allHTTPHeaderFields];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __86__NSMutableURLRequest_AppleMediaServices__ams_addBiometricsHeadersForAccount_options___block_invoke;
      v8[3] = &unk_1E55A2E60;
      id v9 = v6;
      id v10 = a1;
      id v7 = v6;
      [v5 enumerateKeysAndObjectsUsingBlock:v8];
    }
  }
}

- (id)ams_addCookiesAsynchronouslyForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [a1 URL];

  if (v14)
  {
    id v15 = "PromiseEZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE";
    char v58 = a6;
    id v57 = v12;
    if (v11 && objc_msgSend(v11, "ams_isEphemeralAccount"))
    {
      v72[0] = v11;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
      v17 = +[AMSPromise promiseWithResult:v16];
    }
    else
    {
      id v18 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForProcessInfo:", v12);
      if (v18)
      {
        v16 = v18;
        v19 = objc_msgSend(v18, "ams_mediaType");
        v20 = objc_msgSend(v16, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v19, 0);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke;
        v64[3] = &unk_1E559F9B0;
        v64[4] = a1;
        id v65 = v11;
        v17 = [v20 continueWithBlock:v64];
      }
      else
      {
        v30 = +[AMSLogConfig sharedConfig];
        if (!v30)
        {
          v30 = +[AMSLogConfig sharedConfig];
        }
        v31 = [v30 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v55 = a2;
          v32 = AMSLogKey();
          v33 = NSString;
          uint64_t v34 = objc_opt_class();
          uint64_t v35 = v34;
          if (v32)
          {
            a4 = AMSLogKey();
            [v33 stringWithFormat:@"%@: [%@] ", v35, a4];
          }
          else
          {
            [v33 stringWithFormat:@"%@: ", v34];
          v36 = };
          v38 = [a1 URL];
          v39 = AMSHashIfNeeded(v38);
          *(_DWORD *)buf = 138543618;
          v69 = v36;
          __int16 v70 = 2114;
          v71 = v39;
          _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@No account store was available. No local account cookies will be added to this request. URL = %{public}@", buf, 0x16u);

          if (v32)
          {

            v36 = a4;
          }

          a2 = v55;
        }

        if (v11)
        {
          id v67 = v11;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
          v17 = +[AMSPromise promiseWithResult:v40];
        }
        else
        {
          v17 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CBF0]];
        }
        v16 = 0;
        id v15 = "PromiseEZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE";
      }
    }

    v41 = [v13 arrayForKey:@"clientIDDomains"];
    v42 = [v41 valuePromise];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_123;
    v63[3] = &unk_1E55A8AB8;
    v63[4] = a1;
    v43 = [v42 continueWithBlock:v63];

    if (!v43)
    {
      v44 = +[AMSLogConfig sharedConfig];
      if (!v44)
      {
        v44 = +[AMSLogConfig sharedConfig];
      }
      v45 = [v44 OSLogObject];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v56 = a2;
        v46 = AMSLogKey();
        v47 = NSString;
        uint64_t v48 = objc_opt_class();
        uint64_t v49 = v48;
        if (v46)
        {
          AMSLogKey();
          id v15 = (char *)objc_claimAutoreleasedReturnValue();
          [v47 stringWithFormat:@"%@: [%@] ", v49, v15];
        }
        else
        {
          [v47 stringWithFormat:@"%@: ", v48];
        v50 = };
        *(_DWORD *)buf = 138543362;
        v69 = v50;
        _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@No bag was provided. Defaulting to not applying analytics cookies.", buf, 0xCu);
        if (v46)
        {

          v50 = v15;
        }

        a2 = v56;
      }

      v43 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC28]];
    }
    v66[0] = v17;
    v66[1] = v43;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
    v52 = +[AMSPromise promiseWithAll:v51];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_127;
    v59[3] = &unk_1E55A8B28;
    v59[4] = a1;
    v61 = a2;
    id v60 = v13;
    char v62 = v58;
    v53 = [v52 thenWithBlock:v59];
    v37 = [v53 binaryPromiseAdapter];

    id v12 = v57;
  }
  else
  {
    id v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v12;
      v24 = a2;
      uint64_t v25 = AMSLogKey();
      v26 = NSString;
      uint64_t v27 = objc_opt_class();
      if (v25)
      {
        v28 = AMSLogKey();
        NSStringFromSelector(v24);
        v24 = (const char *)objc_claimAutoreleasedReturnValue();
        [v26 stringWithFormat:@"%@: [%@] %@ ", v27, v28, v24];
      }
      else
      {
        v28 = NSStringFromSelector(v24);
        [v26 stringWithFormat:@"%@: %@ ", v27, v28];
      v29 = };
      *(_DWORD *)buf = 138543362;
      v69 = v29;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@URL is nil, can’t add cookies.", buf, 0xCu);
      if (v25)
      {

        v29 = (void *)v24;
      }

      id v12 = v23;
    }

    v17 = AMSError(2, @"Can't add cookies as request doesn't have a URL.", 0, 0);
    v37 = +[AMSBinaryPromise promiseWithError:v17];
  }

  return v37;
}

- (AMSMutablePromise)_ams_authKitHeaders
{
  uint64_t v2 = objc_alloc_init(AMSMutablePromise);
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 urlRequest];

    id v3 = (id)v4;
  }
  id v5 = +[AMSURLSession sharedAuthKitSession];
  id v6 = [(AMSPromise *)v2 completionHandlerAdapter];
  [v5 appleIDHeadersForRequest:v3 completion:v6];

  return v2;
}

- (uint64_t)ams_setBodyParameters:()AppleMediaServices encoding:compressBody:error:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = v10;
  if (a4) {
    uint64_t v12 = a4;
  }
  else {
    uint64_t v12 = 2;
  }
  if (!v10)
  {
    if (a6)
    {
      v20 = @"Invalid Parameters";
      id v21 = @"Parameters must not be nil";
      uint64_t v22 = 2;
LABEL_15:
      AMSError(v22, v20, v21, 0);
      uint64_t v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
LABEL_43:
    uint64_t v23 = 0;
    goto LABEL_46;
  }
  id v13 = [a1 HTTPMethod];
  if ([v13 isEqualToString:@"POST"])
  {
LABEL_8:

    goto LABEL_9;
  }
  v14 = [a1 HTTPMethod];
  if ([v14 isEqualToString:@"PATCH"])
  {

    goto LABEL_8;
  }
  v33 = [a1 HTTPMethod];
  char v34 = [v33 isEqualToString:@"PUT"];

  if (v34)
  {
LABEL_9:
    id v44 = 0;
    id v15 = +[AMSData dataWithObject:v11 encoding:v12 error:&v44];
    id v16 = v44;
    v17 = v16;
    if (v15)
    {
      if (!a5)
      {
        [a1 setHTTPBody:v15];
        goto LABEL_25;
      }
      uint64_t v18 = +[AMSData compressedGzippedDataWithData:v15];
      if (v18)
      {
        v19 = (void *)v18;
        [a1 setHTTPBody:v18];
        [a1 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];

LABEL_25:
        v30 = [a1 valueForHTTPHeaderField:@"Content-Type"];

        if (!v30) {
          objc_msgSend(a1, "ams_addContentTypeHeaderForEncoding:", v12);
        }
        v31 = [a1 valueForHTTPHeaderField:@"Content-Length"];

        if (!v31)
        {
          v32 = [a1 HTTPBody];
          objc_msgSend(a1, "ams_addContentLengthHeaderForData:", v32);
        }
        uint64_t v23 = 1;
        goto LABEL_30;
      }
      if (a6)
      {
        AMSError(3, @"Failed to GZip-encode request body", @"Failed to GZip-encode request body", 0);
        uint64_t v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
    }
    else
    {
      if (a6) {
        *a6 = v16;
      }
      v24 = +[AMSLogConfig sharedConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_opt_class();
        id v27 = v26;
        v28 = AMSLogKey();
        v29 = AMSLogableError(v17);
        *(_DWORD *)buf = 138543874;
        v46 = v26;
        __int16 v47 = 2114;
        uint64_t v48 = v28;
        __int16 v49 = 2114;
        v50 = v29;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode data from parameters. Error: %{public}@", buf, 0x20u);
      }
    }
    uint64_t v23 = 0;
LABEL_30:

    goto LABEL_46;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = +[AMSLogConfig sharedConfig];
    if (!v37)
    {
      v37 = +[AMSLogConfig sharedConfig];
    }
    v38 = [v37 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_opt_class();
      id v40 = v39;
      v41 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      __int16 v47 = 2114;
      uint64_t v48 = v41;
      _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Only dictionaries are supported for query parameters;",
        buf,
        0x16u);
    }
    if (a6)
    {
      v20 = @"Invalid Query Parameters";
      id v21 = @"Query parameters must be dictionary format";
      uint64_t v22 = 300;
      goto LABEL_15;
    }
    goto LABEL_43;
  }
  uint64_t v35 = [a1 URL];
  v36 = objc_msgSend(v35, "ams_URLByAppendingQueryParameters:", v11);

  if (v36)
  {
    [a1 setURL:v36];
  }
  else
  {
    v42 = [a1 URL];
    [a1 setURL:v42];
  }
  uint64_t v23 = 1;
LABEL_46:

  return v23;
}

- (uint64_t)ams_addContentTypeHeaderForEncoding:()AppleMediaServices
{
  if (a3 > 4) {
    id v3 = 0;
  }
  else {
    id v3 = off_1E55A8BC0[a3];
  }
  return [a1 setValue:v3 forHTTPHeaderField:@"Content-Type"];
}

- (void)ams_addContentLengthHeaderForData:()AppleMediaServices
{
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v5 stringValue];
  [a1 setValue:v4 forHTTPHeaderField:@"Content-Length"];
}

- (void)_ams_replaceCookies:()AppleMediaServices
{
  id v4 = a3;
  [a1 setHTTPShouldHandleCookies:0];
  id v5 = [MEMORY[0x1E4F18D28] requestHeaderFieldsWithCookies:v4];

  objc_msgSend(a1, "ams_addHeaders:", v5);
}

- (uint64_t)ams_addHeaders:()AppleMediaServices
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__NSMutableURLRequest_AppleMediaServices__ams_addHeaders___block_invoke;
  v4[3] = &unk_1E55A2E38;
  v4[4] = a1;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (id)ams_addAuthKitHeaders
{
  uint64_t v2 = objc_msgSend(a1, "_ams_authKitHeaders");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NSMutableURLRequest_AppleMediaServices__ams_addAuthKitHeaders__block_invoke;
  v5[3] = &unk_1E55A8A90;
  v5[4] = a1;
  [v2 addSuccessBlock:v5];
  id v3 = [v2 binaryPromiseAdapter];

  return v3;
}

- (void)ams_addPrimaryiCloudIdentifierHeader
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  objc_msgSend(v2, "ams_activeiCloudAccount");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = objc_msgSend(v5, "ams_DSID");
  if ([v3 longLongValue])
  {
    id v4 = [v3 stringValue];
    [a1 setValue:v4 forHTTPHeaderField:@"iCloud-DSID"];
  }
}

- (void)ams_addClientVersionsForClient:()AppleMediaServices
{
  id v24 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v24 proxyAppBundleID];

  if (v5)
  {
    id v6 = [v24 proxyAppBundleID];
    [v4 addObject:v6];
  }
  id v7 = [v24 mappedBundleInfo];
  int v8 = [v7 bundleIdentifier];

  if (v8)
  {
    id v9 = [v24 mappedBundleInfo];
    id v10 = [v9 bundleIdentifier];
    [v4 addObject:v10];
  }
  id v11 = [v24 bundleIdentifier];

  if (v11)
  {
    uint64_t v12 = [v24 bundleIdentifier];
    [v4 addObject:v12];
  }
  if ([v4 count])
  {
    unint64_t v13 = 0;
    while (v13 < [v4 count])
    {
      v14 = [v4 objectAtIndexedSubscript:v13];
      id v15 = [v14 lowercaseString];
      id v16 = [&unk_1EDD01B10 objectForKeyedSubscript:v15];

      if (v16)
      {
        v17 = [v24 bundleIdentifier];
        uint64_t v18 = [v17 compare:v14 options:1];

        if (v18) {
          v19 = [[AMSProcessInfo alloc] initWithBundleIdentifier:v14];
        }
        else {
          v19 = (AMSProcessInfo *)v24;
        }
        id v21 = v19;
        uint64_t v22 = [(AMSProcessInfo *)v19 clientVersion];
        [(__CFString *)v22 doubleValue];
        if (v23 == 0.0)
        {

          uint64_t v22 = @"??";
        }
        v20 = [NSString stringWithFormat:@"%@/%@", v16, v22];
      }
      else
      {
        v20 = 0;
      }
      ++v13;

      if (v20) {
        goto LABEL_21;
      }
    }
    v20 = 0;
LABEL_21:
    [a1 setValue:v20 forHTTPHeaderField:@"X-Apple-Client-Versions"];
  }
}

- (void)ams_addAuthorizationHeaderForAccount:()AppleMediaServices
{
  if (a3)
  {
    id v4 = NSString;
    id v5 = a3;
    id v6 = objc_msgSend(v5, "aa_personID");
    id v7 = objc_msgSend(v5, "aa_authToken");

    id v10 = [v4 stringWithFormat:@"%@:%@", v6, v7];

    int v8 = [v10 dataUsingEncoding:4];
    id v9 = [v8 base64EncodedStringWithOptions:0];

    [a1 setValue:v9 forHTTPHeaderField:@"Authorization"];
  }
}

- (uint64_t)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:
{
  return objc_msgSend(a1, "ams_addCookiesForAccount:clientInfo:bag:cleanupGlobalCookies:", a3, a4, a5, 0);
}

- (void)ams_addCookiesForAccount:()AppleMediaServices clientInfo:bag:cleanupGlobalCookies:
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "ams_addCookiesAsynchronouslyForAccount:clientInfo:bag:cleanupGlobalCookies:");
  id v12 = 0;
  [v2 resultWithError:&v12];
  id v3 = v12;

  if (v3)
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = v8;
      if (v6)
      {
        uint64_t v1 = AMSLogKey();
        [v7 stringWithFormat:@"%@: [%@] ", v9, v1];
      }
      else
      {
        [v7 stringWithFormat:@"%@: ", v8];
      id v10 = };
      id v11 = AMSLogableError(v3);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      __int16 v15 = 2114;
      id v16 = v11;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to synchronously add cookies for account. error = %{public}@", buf, 0x16u);
      if (v6)
      {

        id v10 = (void *)v1;
      }
    }
  }
}

- (void)ams_addMMeClientInfoAndDeviceHeaders
{
  uint64_t v2 = [MEMORY[0x1E4F4BFA0] currentInfo];
  id v4 = [v2 clientInfoHeader];

  id v3 = +[AMSDevice uniqueDeviceId];
  [a1 setValue:v4 forHTTPHeaderField:@"X-MMe-Client-Info"];
  [a1 setValue:v3 forHTTPHeaderField:@"X-Mme-Device-Id"];
}

- (void)ams_addSilentEnrollmentHeadersForAccount:()AppleMediaServices
{
  uint64_t v2 = +[AMSAppleCardSilentEnrollment headersForAccount:](AMSAppleCardSilentEnrollment, "headersForAccount:");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__NSMutableURLRequest_AppleMediaServices__ams_addSilentEnrollmentHeadersForAccount___block_invoke;
  v3[3] = &unk_1E55A2E38;
  v3[4] = a1;
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)ams_addXTokenHeaderWithAccount:()AppleMediaServices
{
  id v6 = a3;
  if (v6)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v5 = objc_msgSend(v4, "ams_secureTokenForAccount:", v6);

    if (v5)
    {
      [a1 setValue:v5 forHTTPHeaderField:@"X-Token"];
    }
  }
}

- (void)ams_addXGroupDSIDsWithPrimaryAccount:()AppleMediaServices andGroupAccounts:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AMSMutableSet setWithHashBlock:&__block_literal_global_159_0];
  v36 = v7;
  [v8 addObjectsFromArray:v7];
  uint64_t v9 = [MEMORY[0x1E4F28E78] string];
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  v37 = v6;
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    v14 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    id v44 = v12;
    __int16 v45 = 2114;
    v46 = v14;
    __int16 v47 = 2048;
    uint64_t v48 = [v8 count];
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding Group DSIDs for %lu accounts", buf, 0x20u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v21 = objc_msgSend(v20, "ams_DSID");
        uint64_t v22 = [v21 stringValue];

        if ([v22 length])
        {
          [v9 appendFormat:@"%@; ", v22];
          double v23 = objc_msgSend(v20, "ams_cookies");
          objc_msgSend(a1, "_ams_addCookies:", v23);
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v17);
  }

  if (v37)
  {
    id v24 = +[AMSLogConfig sharedConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      id v27 = v26;
      v28 = AMSLogKey();
      v29 = AMSHashIfNeeded(v37);
      *(_DWORD *)buf = 138543874;
      id v44 = v26;
      __int16 v45 = 2114;
      v46 = v28;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v29;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding DSID to group list for primary account: %@", buf, 0x20u);
    }
    v30 = objc_msgSend(v37, "ams_cookies");
    objc_msgSend(a1, "_ams_addCookies:", v30);
  }
  if ([v9 length])
  {
    v31 = +[AMSLogConfig sharedConfig];
    if (!v31)
    {
      v31 = +[AMSLogConfig sharedConfig];
    }
    v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_opt_class();
      id v34 = v33;
      uint64_t v35 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      id v44 = v33;
      __int16 v45 = 2114;
      v46 = v35;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v9;
      _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Group DSIDs list: %@", buf, 0x20u);
    }
    [a1 setValue:v9 forHTTPHeaderField:@"X-Group-DSIDs"];
  }
}

- (uint64_t)ams_removeAnisetteHeaders
{
  [a1 setValue:0 forHTTPHeaderField:@"X-Apple-AMD-M"];
  [a1 setValue:0 forHTTPHeaderField:@"X-Apple-MD-M"];
  [a1 setValue:0 forHTTPHeaderField:@"X-Apple-AMD"];
  return [a1 setValue:0 forHTTPHeaderField:@"X-Apple-MD"];
}

- (uint64_t)ams_removeFPDIHeaders
{
  [a1 setValue:0 forHTTPHeaderField:@"X-Apple-FPDISignature"];
  [a1 setValue:0 forHTTPHeaderField:@"X-Apple-FPDIAction"];
  return [a1 setValue:0 forHTTPHeaderField:@"X-Apple-FPDIRetryCount"];
}

- (void)_ams_addCookies:()AppleMediaServices
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "ams_cookies");
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v18 = v4;
  id v7 = objc_msgSend(a1, "_ams_separateCookies:", v4);
  [v6 addEntriesFromDictionary:v7];

  uint64_t v8 = [MEMORY[0x1E4F28E78] string];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v6 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v6 objectForKeyedSubscript:v14];
        [v8 appendFormat:@"%@=%@; ", v14, v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }

  double v23 = @"Cookie";
  uint64_t v16 = [NSString stringWithString:v8];
  id v24 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  objc_msgSend(a1, "ams_addHeaders:", v17);
}

- (id)_ams_separateCookies:()AppleMediaServices
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F18D28], "requestHeaderFieldsWithCookies:");
  v0 = [v18 objectForKeyedSubscript:@"Cookie"];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = [v0 componentsSeparatedByString:@";"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

        uint64_t v9 = [v8 rangeOfString:@"="];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v9;
          unint64_t v11 = v9 + 1;
          unint64_t v12 = [v8 length];
          if (v10 && v11 < v12)
          {
            uint64_t v14 = [v8 substringToIndex:v10];
            id v15 = [v8 substringFromIndex:v11];
            [v19 setObject:v15 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
  uint64_t v16 = (void *)[v19 copy];

  return v16;
}

@end