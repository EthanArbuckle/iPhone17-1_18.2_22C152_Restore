@interface AMSPurchaseRequestEncoder
+ (BOOL)isRedirectBagURLOverrideEnabled;
+ (id)_bagURLKeysForPurchaseType:(int64_t)a3 withProductType:(id)a4 purchase:(id)a5 prefix:(id)a6;
+ (id)_bagURLKeysFromPurchaseInfo:(id)a3;
+ (id)_buyProductURLKeysForProductType:(id)a3 prefix:(id)a4;
+ (id)_parametersFromPurchaseInfo:(id)a3;
+ (id)bagURLFromPurchaseInfo:(id)a3 bag:(id)a4;
+ (id)configureRequest:(id)a3 purchaseInfo:(id)a4 bag:(id)a5;
+ (int64_t)_anisetteTypeFromAccount:(id)a3;
- (AMSPurchaseInfo)purchaseInfo;
- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3;
- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3 bag:(id)a4;
- (OS_dispatch_queue)purchaseRequestQueue;
- (id)bag;
- (id)encodeRequest;
- (void)setBag:(id)a3;
- (void)setPurchaseRequestQueue:(id)a3;
@end

@implementation AMSPurchaseRequestEncoder

- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseRequestEncoder;
  v6 = [(AMSURLRequestEncoder *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_purchaseInfo, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.PurchaseRequest", 0);
    purchaseRequestQueue = v7->_purchaseRequestQueue;
    v7->_purchaseRequestQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3 bag:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AMSPurchaseRequestEncoder;
  v9 = [(AMSURLRequestEncoder *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_purchaseInfo, a3);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PurchaseRequest", 0);
    purchaseRequestQueue = v10->_purchaseRequestQueue;
    v10->_purchaseRequestQueue = (OS_dispatch_queue *)v11;

    v13 = [(AMSPurchaseRequestEncoder *)v10 purchaseInfo];
    v14 = [v13 purchase];
    v15 = [v14 buyParams];
    v16 = [v15 objectForKeyedSubscript:0x1EDCAD4C8];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;

      if (!v17)
      {
LABEL_7:

        goto LABEL_8;
      }
      v20 = @"purchaseProductType";
      v21[0] = v17;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [(AMSURLRequestEncoder *)v10 setAdditionalMetrics:v16];
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

+ (id)configureRequest:(id)a3 purchaseInfo:(id)a4 bag:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 setHTTPMethod:@"POST"];
  uint64_t v9 = [v8 account];
  if (v9)
  {
    v10 = (void *)v9;
    dispatch_queue_t v11 = [v8 account];
    char v12 = objc_msgSend(v11, "ams_isEphemeralAccount");

    if ((v12 & 1) == 0)
    {
      v13 = [v8 account];
      objc_msgSend(v7, "ams_addXTokenHeaderWithAccount:", v13);
    }
  }
  v14 = [v8 additionalHeaders];

  if (v14)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v15 = [v8 additionalHeaders];
    v16 = [v15 keyEnumerator];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v22 = [v8 additionalHeaders];
          v23 = [v22 objectForKeyedSubscript:v21];
          [v7 setValue:v23 forHTTPHeaderField:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v18);
    }
  }
  v24 = [v8 purchase];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v26 = AMSError(10, @"Presentation failed for SiWA purchase task", @"The currently implementation does not support payment sheet on SiWA purchase task.", 0);
    v27 = +[AMSBinaryPromise promiseWithError:v26];
  }
  else
  {
    v27 = +[AMSURLRequestDecoration addPaymentHardwareStatusToRequest:v7];
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke;
  v32[3] = &unk_1E55A5C60;
  id v34 = v7;
  id v35 = a1;
  id v33 = v8;
  id v28 = v7;
  id v29 = v8;
  v30 = [v27 continueWithBlock:v32];

  return v30;
}

id __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "ams_hasDomain:code:", @"AMSErrorDomain", 5) & 1) == 0)
  {
    id v7 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v3 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      v13 = };
      v14 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to add payment hardware status headers. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)v3;
      }
    }
  }
  v15 = [a1[6] _parametersFromPurchaseInfo:a1[4]];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke_22;
  v18[3] = &unk_1E55A5C38;
  id v19 = a1[4];
  id v20 = a1[5];
  v16 = [v15 continueWithBinaryPromiseBlock:v18];

  return v16;
}

id __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 purchase];
  if ([v8 useJSONContentType]) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }

  v10 = *(void **)(a1 + 40);
  id v15 = v6;
  int v11 = objc_msgSend(v10, "ams_setBodyParameters:encoding:compressBody:error:", v7, v9, 0, &v15);

  id v12 = v15;
  if (v11) {
    +[AMSBinaryPromise promiseWithSuccess];
  }
  else {
  v13 = +[AMSBinaryPromise promiseWithError:v12];
  }

  return v13;
}

- (id)encodeRequest
{
  uint64_t v3 = objc_alloc_init(AMSMutablePromise);
  v4 = [(AMSPurchaseRequestEncoder *)self purchaseRequestQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke;
  v9[3] = &unk_1E559F1E0;
  v9[4] = self;
  id v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) purchaseInfo];
  uint64_t v3 = [v2 clientInfo];
  [*(id *)(a1 + 32) setClientInfo:v3];

  v4 = [*(id *)(a1 + 32) purchaseInfo];
  id v5 = [v4 purchase];
  if ([v5 useJSONContentType]) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  [*(id *)(a1 + 32) setRequestEncoding:v6];

  id v7 = [*(id *)(a1 + 32) purchaseInfo];
  id v8 = [v7 purchase];
  uint64_t v9 = [v8 logUUID];
  [*(id *)(a1 + 32) setLogUUID:v9];

  v10 = [*(id *)(a1 + 32) purchaseInfo];
  int v11 = [v10 account];
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteType:", +[AMSPurchaseRequestEncoder _anisetteTypeFromAccount:](AMSPurchaseRequestEncoder, "_anisetteTypeFromAccount:", v11));

  id v12 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v12 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  [(AMSKeychainOptions *)v12 setPurpose:0];
  [*(id *)(a1 + 32) setKeychainOptions:v12];
  v13 = [*(id *)(a1 + 32) purchaseInfo];
  v14 = [v13 purchase];
  char v15 = [v14 isUserInitiated];

  if ((v15 & 1) == 0) {
    [*(id *)(a1 + 32) setDialogOptions:1];
  }
  v16 = [*(id *)(a1 + 32) purchaseInfo];
  uint64_t v17 = [v16 account];

  if (v17)
  {
    uint64_t v18 = [*(id *)(a1 + 32) purchaseInfo];
    id v19 = [v18 purchase];
    id v20 = [v19 storefront];

    if (v20)
    {
      uint64_t v21 = [*(id *)(a1 + 32) purchaseInfo];
      v22 = [v21 account];
      __int16 v23 = [*(id *)(a1 + 32) purchaseInfo];
      v24 = [v23 purchase];
      uint64_t v25 = [v24 storefront];
      objc_msgSend(v22, "ams_setStorefront:", v25);
    }
    v26 = [*(id *)(a1 + 32) purchaseInfo];
    v27 = [v26 account];
    [*(id *)(a1 + 32) setAccount:v27];
  }
  id v28 = objc_opt_class();
  id v29 = [*(id *)(a1 + 32) purchaseInfo];
  v30 = [*(id *)(a1 + 32) bag];
  v31 = [v28 bagURLFromPurchaseInfo:v29 bag:v30];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_2;
  v33[3] = &unk_1E55A5CB0;
  v32 = *(void **)(a1 + 40);
  v33[4] = *(void *)(a1 + 32);
  id v34 = v32;
  [v31 addFinishBlock:v33];
}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (unint64_t)v6;
  id v8 = 0;
  if (v5)
  {
    if (!v6)
    {
      id v8 = [[AMSURLRequest alloc] initWithURL:v5];
      uint64_t v9 = [*(id *)(a1 + 32) purchaseInfo];
      v10 = [(AMSURLRequest *)v8 properties];
      [v10 setPurchaseInfo:v9];

      if (os_variant_has_internal_content())
      {
        int v11 = [(AMSURLRequest *)v8 properties];
        id v12 = [v11 purchaseInfo];
        v13 = [v12 clientCorrelationKey];
        [(AMSURLRequest *)v8 setValue:v13 forHTTPHeaderField:@"X-Apple-Purchase-UUID"];
      }
    }
  }
  if (!(v7 | (unint64_t)v8))
  {
    v14 = *(void **)(a1 + 40);
    char v15 = AMSError(2, @"Purchase Encoder Failed", @"Invalid request", 0);
    [v14 finishWithError:v15];

    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_9:
    v16 = [*(id *)(a1 + 32) purchaseInfo];
    uint64_t v17 = [*(id *)(a1 + 32) bag];
    uint64_t v18 = +[AMSPurchaseRequestEncoder configureRequest:v8 purchaseInfo:v16 bag:v17];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_3;
    v22[3] = &unk_1E559E9E8;
    id v19 = v8;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(a1 + 40);
    __int16 v23 = v19;
    uint64_t v24 = v20;
    id v25 = v21;
    [v18 addFinishBlock:v22];

    goto LABEL_10;
  }
  [*(id *)(a1 + 40) finishWithError:v7];
LABEL_10:
}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)AMSPurchaseRequestEncoder;
  uint64_t v3 = objc_msgSendSuper2(&v6, sel_requestByEncodingRequest_parameters_, v2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_4;
  v4[3] = &unk_1E55A5C88;
  id v5 = *(id *)(a1 + 48);
  [v3 addFinishBlock:v4];
}

uint64_t __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

+ (BOOL)isRedirectBagURLOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (int64_t)_anisetteTypeFromAccount:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "ams_isEphemeralAccount") & 1) == 0)
  {
    if (objc_msgSend(v4, "ams_isLocalAccount")) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

+ (id)_buyProductURLKeysForProductType:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  objc_super v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = AMSBagKeyBuyProductOverrideForProductType(v7);

  if (v5 && v9)
  {
    v10 = [NSString stringWithFormat:@"%@/%@", v5, v9];
    [v8 addObject:v10];

LABEL_7:
    int v11 = [NSString stringWithFormat:@"%@/%@", v5, @"buyProduct"];
    [v8 addObject:v11];

    goto LABEL_9;
  }
  if (v9) {
    [v8 addObject:v9];
  }
  if (v5) {
    goto LABEL_7;
  }
  [v8 addObject:@"buyProduct"];
LABEL_9:
  id v12 = (void *)[v8 copy];

  return v12;
}

+ (id)_bagURLKeysForPurchaseType:(int64_t)a3 withProductType:(id)a4 purchase:(id)a5 prefix:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v11 URLBagKey];

  if (v13)
  {
    v14 = [v11 URLBagKey];
    v22[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
LABEL_3:
    v16 = (void *)v15;
    goto LABEL_10;
  }
  if (v12)
  {
    id v17 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@/", v12];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  v14 = v17;
  if (a3)
  {
    uint64_t v18 = AMSBagKeyForPurchaseType(a3);
    [v14 appendString:v18];
  }
  else
  {
    if (v10)
    {
      uint64_t v15 = [a1 _buyProductURLKeysForProductType:v10 prefix:v12];
      goto LABEL_3;
    }
    [v17 appendString:@"buyProduct"];
  }
  id v19 = (void *)[v14 copy];
  uint64_t v21 = v19;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

LABEL_10:
  return v16;
}

+ (id)_bagURLKeysFromPurchaseInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v6 = [v4 buyParams];
  int v7 = [v6 containsKey:@"pkPayment"];

  id v8 = [v4 buyParams];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"buyType"];

  id v10 = [v4 purchase];
  uint64_t v11 = [v10 purchaseType];

  id v12 = [v4 purchase];
  v13 = [v12 buyParams];
  v14 = [v13 objectForKeyedSubscript:0x1EDCAD4C8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (v7)
  {
    v16 = [v4 purchase];
    id v17 = @"commerce-payment-blob-buy-urls";
    id v18 = a1;
    uint64_t v19 = v11;
    id v20 = v15;
    uint64_t v21 = v16;
  }
  else
  {
    if (v9)
    {
      v22 = [NSString stringWithFormat:@"%@/%@", @"commerce-buy-urls", v9];
      [v5 addObject:v22];
    }
    v16 = [v4 purchase];
    id v18 = a1;
    uint64_t v19 = v11;
    id v20 = v15;
    uint64_t v21 = v16;
    id v17 = @"commerce-buy-urls";
  }
  __int16 v23 = [v18 _bagURLKeysForPurchaseType:v19 withProductType:v20 purchase:v21 prefix:v17];
  [v5 addObjectsFromArray:v23];

  uint64_t v24 = [v4 purchase];
  id v25 = [a1 _bagURLKeysForPurchaseType:v11 withProductType:v15 purchase:v24 prefix:0];
  [v5 addObjectsFromArray:v25];

  v26 = (void *)[v5 copy];
  return v26;
}

+ (id)bagURLFromPurchaseInfo:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _bagURLKeysFromPurchaseInfo:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke;
  v15[3] = &unk_1E55A5CD8;
  id v16 = v7;
  id v17 = v6;
  id v18 = a1;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v8, "ams_mapWithTransformIgnoresNil:", v15);

  id v12 = objc_msgSend(v11, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_109);
  v13 = +[AMSPromise promiseWithAny:v12];

  return v13;
}

id __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) account];
    id v7 = [v5 URLForKey:v4 account:v6];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) account];

    if (v8)
    {
      id v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = AMSLogKey();
        id v12 = NSString;
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = v13;
        if (v11)
        {
          uint64_t v2 = AMSLogKey();
          [v12 stringWithFormat:@"%@: [%@] ", v14, v2];
        }
        else
        {
          [v12 stringWithFormat:@"%@: ", v13];
        id v15 = };
        id v16 = NSStringFromSelector(sel_URLForKey_account_);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        uint64_t v21 = v16;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@AMSBagProtocol implementation doesn't implement %{public}@ but an account was specified. This may cause mismatches between account used for bag value fetches and account used for request encoding.", buf, 0x16u);
        if (v11)
        {

          id v15 = (void *)v2;
        }
      }
    }
    id v7 = [*(id *)(a1 + 32) URLForKey:v4];
  }

  return v7;
}

uint64_t __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke_55(uint64_t a1, void *a2)
{
  return [a2 valuePromise];
}

+ (id)_parametersFromPurchaseInfo:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 buyParams];
  id v6 = (void *)[v5 copy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(AMSBuyParams);
  }
  id v9 = v8;

  id v10 = [v4 clientCorrelationKey];
  [(AMSBuyParams *)v9 setParameter:v10 forKey:@"clientCorrelationKey"];

  if ([v4 addKBSync])
  {
    uint64_t v11 = +[AMSKeybag sharedInstance];
    id v12 = [v4 account];
    uint64_t v13 = objc_msgSend(v12, "ams_DSID");
    id v57 = 0;
    uint64_t v14 = [v11 keybagSyncDataWithAccountID:v13 transactionType:1 error:&v57];
    id v15 = v57;

    if (v15)
    {
      id v16 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v16)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v46 = [v4 purchase];
        id v18 = [v46 logUUID];
        uint64_t v19 = NSString;
        id v47 = a1;
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = v20;
        if (v18)
        {
          v45 = [v4 purchase];
          v44 = [v45 logUUID];
          [v19 stringWithFormat:@"%@: [%@] ", v21, v44];
        }
        else
        {
          [v19 stringWithFormat:@"%@: ", v20];
        uint64_t v22 = };
        __int16 v23 = AMSLogableError(v15);
        *(_DWORD *)buf = 138543618;
        v59 = v22;
        __int16 v60 = 2114;
        v61 = v23;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to lookup kbsync due to error: %{public}@", buf, 0x16u);
        if (v18)
        {

          uint64_t v22 = v45;
        }

        a1 = v47;
      }
    }
    else
    {
      if (!v14)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v16 = [v14 base64EncodedStringWithOptions:0];
      [(AMSBuyParams *)v9 setParameter:v16 forKey:@"kbsync"];
    }

    goto LABEL_19;
  }
LABEL_20:
  uint64_t v24 = +[AMSDevice deviceGUID];
  if (v24) {
    [(AMSBuyParams *)v9 setParameter:v24 forKey:@"guid"];
  }
  if (+[AMSDevice deviceIsiPad]
    || +[AMSDevice deviceIsiPhone]
    || +[AMSDevice deviceIsiPod])
  {
    id v25 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v26 = objc_msgSend(v25, "ams_activeiCloudAccount");

    if ([v26 isEnabledForDataclass:*MEMORY[0x1E4F17A68]]) {
      [(AMSBuyParams *)v9 setParameter:@"1" forKey:@"icloud-backup-enabled"];
    }
  }
  v27 = [v4 account];
  char v28 = objc_msgSend(v27, "ams_isEphemeralAccount");

  if (v28)
  {
    id v29 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v29)
    {
      id v29 = +[AMSLogConfig sharedConfig];
    }
    v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = [v4 purchase];
      v32 = [v31 logUUID];
      id v33 = NSString;
      id v48 = a1;
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = v34;
      if (v32)
      {
        v46 = [v4 purchase];
        a1 = [v46 logUUID];
        [v33 stringWithFormat:@"%@: [%@] ", v35, a1];
      }
      else
      {
        [v33 stringWithFormat:@"%@: ", v34];
      long long v36 = };
      *(_DWORD *)buf = 138543362;
      v59 = v36;
      _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipping AFDS for Ephemeral Account.", buf, 0xCu);
      if (v32)
      {

        long long v36 = v46;
      }

      a1 = v48;
    }

    long long v39 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    long long v37 = +[AMSFDSService cachedFDSForPurchaseInfo:v4];
    long long v38 = [v37 promiseWithTimeout:4.0];

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke;
    v53[3] = &unk_1E55A5D48;
    id v54 = v4;
    id v56 = a1;
    v55 = v9;
    long long v39 = [v38 continueWithBinaryPromiseBlock:v53];
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_69;
  v49[3] = &unk_1E55A5D70;
  v51 = v9;
  id v52 = a1;
  id v50 = v4;
  v40 = v9;
  id v41 = v4;
  v42 = [v39 continueWithPromiseBlock:v49];

  return v42;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = off_1E559C000;
  if (v6)
  {
    id v8 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v60 = v6;
      id v10 = [*(id *)(a1 + 32) purchase];
      uint64_t v11 = [v10 logUUID];
      id v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        a3 = [*(id *)(a1 + 32) purchase];
        id v7 = [a3 logUUID];
        [v12 stringWithFormat:@"%@: [%@] ", v14, v7];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      id v15 = };
      id v16 = AMSLogableError(v60);
      *(_DWORD *)buf = 138543618;
      v67 = v15;
      __int16 v68 = 2114;
      v69 = v16;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Reading empty AFDS cache, error: %{public}@", buf, 0x16u);
      if (v11)
      {

        id v15 = a3;
      }

      id v6 = v60;
    }
  }
  id v17 = [v5 value];

  if (v17)
  {
    id v18 = @"afds";
    if ([v5 action] == 4)
    {
      uint64_t v19 = @"afdsv2";

      id v18 = v19;
    }
    uint64_t v20 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v57 = [*(id *)(a1 + 32) purchase];
      uint64_t v22 = [v57 logUUID];
      __int16 v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      id v61 = v6;
      if (v22)
      {
        id v56 = [*(id *)(a1 + 32) purchase];
        v55 = [v56 logUUID];
        [v23 stringWithFormat:@"%@: [%@] ", v25, v55];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      v26 = };
      v58 = v18;
      uint64_t v35 = AMSHashIfNeeded(v18);
      long long v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "action"));
      long long v37 = [v5 value];
      long long v38 = AMSHashIfNeeded(v37);
      *(_DWORD *)buf = 138544130;
      v67 = v26;
      __int16 v68 = 2114;
      v69 = v35;
      __int16 v70 = 2114;
      v71 = v36;
      __int16 v72 = 2114;
      v73 = v38;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Adding an AFDS value to the request. buyParam = %{public}@, action = %{public}@, value = %{public}@", buf, 0x2Au);

      if (v22)
      {

        v26 = v56;
      }

      id v18 = v58;
      id v6 = v61;
    }

    long long v39 = *(void **)(a1 + 40);
    v40 = [v5 value];
    [v39 setParameter:v40 forKey:v18];

    if ([v5 action] == 4)
    {
      id v41 = +[AMSFDSService didConsumeFDSForPurchaseInfo:*(void *)(a1 + 32)];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_67;
      v63[3] = &unk_1E55A5D20;
      id v42 = *(id *)(a1 + 32);
      uint64_t v43 = *(void *)(a1 + 48);
      id v64 = v42;
      uint64_t v65 = v43;
      v44 = [v41 continueWithBlock:v63];
    }
    else
    {
      v45 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v45)
      {
        v45 = +[AMSLogConfig sharedConfig];
      }
      v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v59 = v18;
        id v62 = v6;
        id v47 = [*(id *)(a1 + 32) purchase];
        id v48 = [v47 logUUID];
        v49 = NSString;
        uint64_t v50 = objc_opt_class();
        uint64_t v51 = v50;
        if (v48)
        {
          long long v39 = [*(id *)(a1 + 32) purchase];
          a1 = [v39 logUUID];
          [v49 stringWithFormat:@"%@: [%@] ", v51, a1];
        }
        else
        {
          [v49 stringWithFormat:@"%@: ", v50];
        id v52 = };
        v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "action"));
        *(_DWORD *)buf = 138543618;
        v67 = v52;
        __int16 v68 = 2114;
        v69 = v53;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_INFO, "%{public}@Skipping AFDS completion call for action type: %{public}@", buf, 0x16u);

        id v6 = v62;
        if (v48)
        {

          id v52 = v39;
        }

        id v18 = v59;
      }

      v44 = +[AMSBinaryPromise promiseWithSuccess];
    }
  }
  else
  {
    v27 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v27)
    {
      v27 = +[AMSLogConfig sharedConfig];
    }
    char v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = [*(id *)(a1 + 32) purchase];
      v30 = [v29 logUUID];
      v31 = NSString;
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = v32;
      if (v30)
      {
        id v17 = [*(id *)(a1 + 32) purchase];
        a1 = [v17 logUUID];
        [v31 stringWithFormat:@"%@: [%@] ", v33, a1];
      }
      else
      {
        [v31 stringWithFormat:@"%@: ", v32];
      uint64_t v34 = };
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_INFO, "%{public}@No AFDS available.", buf, 0xCu);
      if (v30)
      {

        uint64_t v34 = v17;
      }
    }
    v44 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v44;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_67(id *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [a1[4] purchase];
      id v9 = [v8 logUUID];
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        a1 = [a1[4] purchase];
        id v3 = [a1 logUUID];
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      id v15 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@AFDS completion call failed with error: %{public}@", buf, 0x16u);
      if (v9)
      {

        uint64_t v13 = a1;
      }
    }
    uint64_t v14 = +[AMSBinaryPromise promiseWithError:v5];
  }
  else
  {
    uint64_t v14 = +[AMSBinaryPromise promiseWithSuccess];
  }
  id v16 = (void *)v14;

  return v16;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_69(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasBeenAuthedForBuy])
  {
    id v4 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) purchase];
      id v7 = [v6 logUUID];
      id v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        v1 = [*(id *)(a1 + 32) purchase];
        uint64_t v2 = [v1 logUUID];
        [v8 stringWithFormat:@"%@: [%@] ", v10, v2];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      uint64_t v11 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v11;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Attaching to buyParams", buf, 0xCu);
      if (v7)
      {

        uint64_t v11 = v1;
      }
    }
    [*(id *)(a1 + 40) setParameter:MEMORY[0x1E4F1CC38] forKey:@"hasBeenAuthedForBuy"];
  }
  uint64_t v12 = [*(id *)(a1 + 32) paymentServicesURL];

  if (v12)
  {
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) paymentServicesURL];
    id v15 = [v14 absoluteString];
    [v13 setParameter:v15 forKey:@"applePayPaymentServiceURL"];
  }
  uint64_t v16 = [*(id *)(a1 + 32) paymentToken];
  if (v16)
  {
    id v17 = (void *)v16;
    id v18 = [*(id *)(a1 + 32) expressCheckoutMode];

    if (v18)
    {
      uint64_t v19 = *(void **)(a1 + 40);
      __int16 v20 = [*(id *)(a1 + 32) expressCheckoutMode];
      [v19 setParameter:v20 forKey:@"expressCheckoutMode"];
    }
  }
  uint64_t v21 = [*(id *)(a1 + 40) normalizedDictionary];
  uint64_t v22 = +[AMSPromise promiseWithResult:v21];

  return v22;
}

- (id)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (OS_dispatch_queue)purchaseRequestQueue
{
  return self->_purchaseRequestQueue;
}

- (void)setPurchaseRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseRequestQueue, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end