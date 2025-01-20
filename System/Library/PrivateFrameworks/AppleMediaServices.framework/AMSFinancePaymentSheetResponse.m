@interface AMSFinancePaymentSheetResponse
+ (id)_attributedListDictionaryForValues:(id)a3 account:(id)a4;
+ (id)_attributedStringForAttributedArray:(id)a3 account:(id)a4;
+ (id)_attributedStringForAttributedDictionary:(id)a3 account:(id)a4;
+ (id)_attributedStringForSalableInfoStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5;
+ (id)_attributedStringForSalableInfoStyledStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5;
+ (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4 account:(id)a5 shouldUppercase:(BOOL)a6;
+ (id)_createMerchantSessionFromDictionary:(id)a3;
+ (id)_flexListDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7;
+ (id)_flexListLeadingItemForValues:(id)a3 styles:(id)a4;
+ (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4;
+ (id)_salableInfoDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7;
+ (id)_salableInfoForKey:(id)a3 inDictionary:(id)a4 shouldUppercase:(BOOL)a5;
+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4;
+ (id)attributedStringWithString:(id)a3 styles:(id)a4;
+ (id)createRequestFromDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 authenticateResponse:(id)a7 taskInfo:(id)a8 account:(id)a9;
+ (id)fallbackTitleFromResponse:(id)a3;
+ (int64_t)_confirmationTitleForString:(id)a3;
+ (int64_t)_payeeInferredFromEnumeratedTitle:(id)a3;
+ (int64_t)_salableIconForString:(id)a3;
- (AMSFinanceAuthenticateResponse)authenticateResponse;
- (AMSFinancePaymentSheetResponse)initWithResponseDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 taskInfo:(id)a7;
- (AMSPaymentSheetRequest)paymentSheetRequest;
- (NSDictionary)metricsDictionary;
- (id)_createUpdatedBodyFromFormData:(id)a3;
- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3;
- (id)_performAuthorizationDialogProxyWithTaskInfo:(id)a3;
- (id)performWithTaskInfo:(id)a3;
@end

@implementation AMSFinancePaymentSheetResponse

- (AMSFinancePaymentSheetResponse)initWithResponseDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 taskInfo:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)AMSFinancePaymentSheetResponse;
  v14 = [(AMSFinancePaymentSheetResponse *)&v27 init];
  if (v14)
  {
    v15 = [[AMSFinanceAuthenticateResponse alloc] initWithResponseDictionary:v12 taskInfo:v13];
    authenticateResponse = v14->_authenticateResponse;
    v14->_authenticateResponse = v15;

    v17 = +[AMSFinanceResponse valueForProtocolKey:@"dialog" inResponse:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    uint64_t v19 = [(id)objc_opt_class() createRequestFromDictionary:v18 confirmationOnly:v10 delegateAuthenticationRequired:v9 biometricSignatureRequired:v8 authenticateResponse:v14->_authenticateResponse taskInfo:v13 account:0];
    paymentSheetRequest = v14->_paymentSheetRequest;
    v14->_paymentSheetRequest = (AMSPaymentSheetRequest *)v19;

    v21 = [v12 valueForKey:@"metrics"];
    objc_opt_class();
    v22 = 0;
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }

    metricsDictionary = v14->_metricsDictionary;
    v14->_metricsDictionary = v22;

    v24 = [(id)objc_opt_class() _createMerchantSessionFromDictionary:v12];
    if (v24)
    {
      [(AMSPaymentSheetRequest *)v14->_paymentSheetRequest setMerchantSession:v24];
      v25 = [(AMSPaymentSheetRequest *)v14->_paymentSheetRequest biometricsRequest];
      [v25 setDualAction:1];
    }
  }

  return v14;
}

- (id)performWithTaskInfo:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 properties];
  v7 = [v6 purchaseInfo];
  BOOL v8 = [v7 activePurchaseTask];

  if (!v8)
  {
    id v15 = 0;
LABEL_6:
    id v18 = [v5 properties];
    uint64_t v19 = [v18 purchaseInfo];
    v20 = [v19 activePurchaseTask];
    v21 = (objc_class *)[v20 paymentSheetTaskClass];

    if (v21) {
      goto LABEL_26;
    }
    v22 = [v5 properties];
    uint64_t v23 = [v22 paymentSheetTaskClass];

    if (v23)
    {
      v24 = [v5 properties];
      v21 = (objc_class *)[v24 paymentSheetTaskClass];

      v25 = +[AMSLogConfig sharedConfig];
      if (!v25)
      {
        v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      id v27 = v15;
      v28 = AMSLogKey();
      v29 = NSString;
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = v30;
      if (v28)
      {
        uint64_t v3 = AMSLogKey();
        [v29 stringWithFormat:@"%@: [%@] ", v31, v3];
      }
      else
      {
        [v29 stringWithFormat:@"%@: ", v30];
      v32 = };
      *(_DWORD *)buf = 138543618;
      v106 = v32;
      __int16 v107 = 2114;
      v108 = v21;
      v36 = "%{public}@Using payment sheet task class from taskInfo properties: %{public}@";
      v37 = v26;
      uint32_t v38 = 22;
    }
    else
    {
      v21 = (objc_class *)objc_opt_class();
      v25 = +[AMSLogConfig sharedConfig];
      if (!v25)
      {
        v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      id v27 = v15;
      v28 = AMSLogKey();
      v33 = NSString;
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = v34;
      if (v28)
      {
        uint64_t v3 = AMSLogKey();
        [v33 stringWithFormat:@"%@: [%@] ", v35, v3];
      }
      else
      {
        [v33 stringWithFormat:@"%@: ", v34];
      v32 = };
      *(_DWORD *)buf = 138543362;
      v106 = v32;
      v36 = "%{public}@Could not determine payment sheet task class, using default";
      v37 = v26;
      uint32_t v38 = 12;
    }
    _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    id v15 = v27;
    if (v28)
    {

      v32 = (void *)v3;
    }

LABEL_25:
LABEL_26:
    id v39 = [v21 alloc];
    v40 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
    v41 = [v5 properties];
    v42 = [v41 bag];
    v43 = (void *)[v39 initWithRequest:v40 bag:v42];

    v44 = [(AMSFinancePaymentSheetResponse *)self metricsDictionary];
    v45 = [(AMSFinancePaymentSheetResponse *)self _enrichedMetricsDictionaryWithFinanceDictionary:v44];
    [v43 setMetricsDictionary:v45];

    v46 = [v5 session];
    v47 = [v46 delegate];

    if (objc_opt_respondsToSelector())
    {
      v48 = [v47 presentingSceneIdentifier];
      [v43 setPresentingSceneIdentifier:v48];
    }
    if (objc_opt_respondsToSelector())
    {
      v49 = [v47 presentingSceneBundleIdentifier];
      [v43 setPresentingSceneBundleIdentifier:v49];
    }
    if (objc_opt_respondsToSelector())
    {
      v50 = [v47 presentingWindow];
      [v43 setPresentingWindow:v50];
    }
    v51 = [v5 properties];
    v52 = [v51 purchaseInfo];
    [v43 setPurchaseInfo:v52];

    [v43 setRunMode:1];
    v53 = [v43 perform];
    id v103 = v15;
    v16 = [v53 resultWithError:&v103];
    id v54 = v103;

    id v15 = v54;
    if (v54) {
      goto LABEL_4;
    }
    goto LABEL_33;
  }
  BOOL v9 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  uint64_t v10 = [v9 requiresAuthorization];

  v11 = [v5 properties];
  id v12 = [v11 purchaseInfo];
  id v13 = [v12 activePurchaseTask];
  v14 = [v13 performPreActionRequestForTaskInfo:v5 requiresAuthorization:v10];
  id v104 = 0;
  uint64_t v3 = [v14 resultWithError:&v104];
  id v15 = v104;

  v16 = 0;
  if (v3) {
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_4:
    v17 = +[AMSURLAction actionWithError:v15];
    goto LABEL_38;
  }
LABEL_33:
  uint64_t v55 = [v16 passwordEquivalentToken];
  if (v55)
  {
    v56 = (void *)v55;
    v17 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];

    if (v17)
    {
      v57 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
      v58 = [v57 authenticateRequest];
      v59 = [v58 options];

      [v59 setCredentialSource:2];
      [v59 setAllowServerDialogs:1];
      [v59 setAuthenticationType:1];
      [v59 setReason:@"payment sheet"];
      v60 = [v57 authenticateRequest];
      v61 = [v60 account];

      v62 = [v16 passwordEquivalentToken];
      objc_msgSend(v61, "ams_setPassword:", v62);

      v17 = [v57 performWithTaskInfo:v5];
      id v15 = [v17 error];

      goto LABEL_38;
    }
  }
  else
  {
    v17 = 0;
  }
  id v15 = 0;
LABEL_38:
  v63 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
  v64 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
  v65 = [v64 dialogResponse];
  v66 = [v63 _locateActionableButtonUsingDialogResponse:v65];

  if (v16)
  {
    v67 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
    if ([v67 requiresAuthorization])
    {
      v68 = [v16 delegateAuthenticateToken];
      if (v68)
      {
        BOOL v69 = 1;
      }
      else
      {
        v70 = v66;
        v71 = [v16 passwordEquivalentToken];
        if (v71)
        {
          BOOL v69 = 1;
        }
        else
        {
          v72 = [v16 signatureResult];
          BOOL v69 = v72 != 0;
        }
        v66 = v70;
      }
    }
    else
    {
      BOOL v69 = 1;
    }

    if (v15) {
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v69 = 0;
    if (v15) {
      goto LABEL_62;
    }
  }
  if (v17)
  {
    if ([v17 actionType]) {
      BOOL v73 = 0;
    }
    else {
      BOOL v73 = v69;
    }
    if (v73) {
      goto LABEL_56;
    }
  }
  else if (v69)
  {
LABEL_56:
    v74 = [v66 deepLink];
    if (v74)
    {
      uint64_t v75 = +[AMSURLAction redirectActionWithURL:v74];

      v17 = (void *)v75;
    }
    if (!v17)
    {
      v17 = +[AMSURLAction retryAction];
    }
    id v100 = v15;
    v101 = v66;
    [v17 setRetryIdentifier:0x1EDCC3B88];
    [v17 setReason:@"payment sheet"];

    goto LABEL_67;
  }
LABEL_62:
  uint64_t v76 = [v17 redirectURL];
  if (v76)
  {
    v77 = (void *)v76;
    v78 = objc_msgSend(v66, "ams_formData");
    if (!v78) {
      BOOL v69 = 0;
    }

    if (v69)
    {
      id v100 = v15;
      v101 = v66;
      v79 = objc_msgSend(v66, "ams_formData");
      v80 = [(AMSFinancePaymentSheetResponse *)self _createUpdatedBodyFromFormData:v79];
      [v17 setUpdatedBody:v80];

      [v17 setReason:@"payment sheet"];
LABEL_67:
      v81 = [v5 properties];
      v82 = [v81 account];
      v83 = [v5 properties];
      v84 = [v83 keychainOptions];
      v85 = [v16 signatureResult];
      v86 = +[AMSBiometrics headersWithAccount:v82 options:v84 signatureResult:v85];
      v87 = (void *)[v86 mutableCopy];

      v88 = [v16 passwordEquivalentToken];

      if (v88) {
        [v87 setObject:0x1EDCAC5E8 forKeyedSubscript:@"X-Apple-TID-Action"];
      }
      v89 = [v16 delegateAuthenticateToken];

      id v15 = v100;
      if (v89)
      {
        v90 = [v16 delegateAuthenticateToken];
        [v87 setObject:v90 forKeyedSubscript:@"X-Apple-DelegateAuth-Token"];

        v91 = [v16 delegateAuthenticateToken];
        [v87 setObject:v91 forKeyedSubscript:@"X-Apple-Delegate-Auth-Token"];
      }
      [v17 setUpdatedHeaders:v87];
      v66 = v101;
      goto LABEL_82;
    }
  }
  v87 = +[AMSLogConfig sharedConfig];
  if (!v87)
  {
    v87 = +[AMSLogConfig sharedConfig];
  }
  v92 = [v87 OSLogObject];
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    v102 = v66;
    id v93 = v15;
    v94 = AMSLogKey();
    v95 = NSString;
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = v96;
    if (v94)
    {
      AMSLogKey();
      self = (AMSFinancePaymentSheetResponse *)objc_claimAutoreleasedReturnValue();
      [v95 stringWithFormat:@"%@: [%@] ", v97, self];
    }
    else
    {
      [v95 stringWithFormat:@"%@: ", v96];
    v98 = };
    *(_DWORD *)buf = 138543362;
    v106 = v98;
    _os_log_impl(&dword_18D554000, v92, OS_LOG_TYPE_ERROR, "%{public}@Unable to continue the purchase.", buf, 0xCu);
    if (v94)
    {

      v98 = self;
    }

    id v15 = v93;
    v66 = v102;
  }

LABEL_82:
  return v17;
}

- (id)_performAuthorizationDialogProxyWithTaskInfo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  v6 = [AMSPaymentAuthorizationDialogTask alloc];
  v7 = [v4 properties];
  BOOL v8 = [v7 bag];
  BOOL v9 = [(AMSPaymentAuthorizationDialogTask *)v6 initWithRequest:v5 bag:v8];

  uint64_t v10 = [v4 properties];
  v11 = [v10 purchaseInfo];
  [(AMSPaymentAuthorizationDialogTask *)v9 setPurchaseInfo:v11];

  [(AMSTask *)v9 setRunMode:1];
  id v12 = [(AMSPaymentAuthorizationDialogTask *)v9 perform];
  id v40 = 0;
  id v13 = [v12 resultWithError:&v40];
  id v14 = v40;

  if (v14)
  {
    id v15 = 0;
LABEL_3:
    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v37 = v5;
      uint32_t v38 = v13;
      id v18 = AMSLogKey();
      uint64_t v19 = NSString;
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = v20;
      if (v18)
      {
        id v13 = AMSLogKey();
        [v19 stringWithFormat:@"%@: [%@] ", v21, v13];
      }
      else
      {
        [v19 stringWithFormat:@"%@: ", v20];
      v22 = };
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to continue the purchase.", buf, 0xCu);
      if (v18)
      {

        v22 = v13;
      }

      id v5 = v37;
      id v13 = v38;
    }

    goto LABEL_23;
  }
  id v39 = v13;
  uint64_t v23 = [v13 passwordEquivalentToken];
  if (v23
    && (v24 = (void *)v23,
        [(AMSFinancePaymentSheetResponse *)self authenticateResponse],
        v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        v25))
  {
    v26 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
    id v27 = [v26 authenticateRequest];
    v28 = [v27 options];

    [v28 setCredentialSource:2];
    [v28 setAllowServerDialogs:1];
    [v28 setAuthenticationType:1];
    [v28 setReason:@"payment sheet"];
    v29 = [v26 authenticateRequest];
    uint64_t v30 = [v29 account];

    uint64_t v31 = [v39 passwordEquivalentToken];
    objc_msgSend(v30, "ams_setPassword:", v31);

    id v15 = [v26 performWithTaskInfo:v4];
    id v14 = [v15 error];

    if (v14)
    {
LABEL_11:
      id v13 = v39;
      goto LABEL_3;
    }
    if (v15 && [v15 actionType])
    {
      id v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = 0;
  }
  v32 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
  v33 = [(AMSFinancePaymentSheetResponse *)self authenticateResponse];
  uint64_t v34 = [v33 dialogResponse];
  id v14 = [v32 _locateActionableButtonUsingDialogResponse:v34];

  v16 = [v14 deepLink];
  if (v16)
  {
    uint64_t v35 = +[AMSURLAction redirectActionWithURL:v16];

    id v15 = (void *)v35;
  }
  if (!v15)
  {
    id v15 = +[AMSURLAction retryAction];
  }
  [v15 setRetryIdentifier:0x1EDCC3B88];
  [v15 setReason:@"payment sheet"];
  id v13 = v39;
LABEL_23:

  return v15;
}

+ (id)_createMerchantSessionFromDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 valueForKey:@"tid-dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      id v5 = [v4 valueForKey:@"applePayPaymentSession"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;

        if (v6)
        {
          v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
          id v22 = 0;
          BOOL v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v22];
          BOOL v9 = v22;
          if (v9)
          {
            uint64_t v10 = +[AMSLogConfig sharedPurchaseConfig];
            if (!v10)
            {
              uint64_t v10 = +[AMSLogConfig sharedConfig];
            }
            v11 = [v10 OSLogObject];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              id v12 = objc_opt_class();
              id v13 = v12;
              id v14 = AMSSetLogKeyIfNeeded();
              *(_DWORD *)buf = 138543874;
              v24 = v12;
              __int16 v25 = 2114;
              v26 = v14;
              __int16 v27 = 2114;
              v28 = v9;
              _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] JSON serialization of payment session failed with error: %{public}@", buf, 0x20u);
            }
          }
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
      }
      BOOL v9 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v9)
      {
        BOOL v9 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v9 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = objc_opt_class();
        id v19 = v18;
        uint64_t v20 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        __int16 v25 = 2114;
        v26 = v20;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no payment session", buf, 0x16u);
      }
      id v6 = 0;
      BOOL v8 = 0;
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v6 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  BOOL v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    id v16 = v15;
    v17 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no tid-dialog", buf, 0x16u);
  }
  id v4 = 0;
  BOOL v8 = 0;
LABEL_24:

  return v8;
}

- (id)_createUpdatedBodyFromFormData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = AMSLogKey();
      BOOL v9 = NSString;
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
      id v12 = };
      *(_DWORD *)buf = 138543362;
      v33 = v12;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Generating plist formated updated request body", buf, 0xCu);
      if (v8)
      {

        id v12 = (void *)v3;
      }
    }
    id v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = AMSLogKey();
      v17 = NSString;
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
      uint64_t v20 = };
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ Creating updated body from formData: %@", buf, 0x16u);
      if (v16)
      {

        uint64_t v20 = (void *)v3;
      }
    }
    id v31 = 0;
    id v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v31];
    id v21 = v31;
    if (v21)
    {
      id v22 = +[AMSLogConfig sharedConfig];
      if (!v22)
      {
        id v22 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = AMSLogKey();
        __int16 v25 = NSString;
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = v26;
        if (v24)
        {
          AMSLogKey();
          self = (AMSFinancePaymentSheetResponse *)objc_claimAutoreleasedReturnValue();
          [v25 stringWithFormat:@"%@: [%@] ", v27, self];
        }
        else
        {
          [v25 stringWithFormat:@"%@: ", v26];
        v28 = };
        uint64_t v29 = AMSLogableError(v21);
        *(_DWORD *)buf = 138543618;
        v33 = v28;
        __int16 v34 = 2114;
        id v35 = v29;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Building updated request body failed with error: %{public}@", buf, 0x16u);
        if (v24)
        {

          v28 = self;
        }
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_attributedListDictionaryForValues:(id)a3 account:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke;
  v23[3] = &unk_1E55A2D98;
  id v11 = v10;
  id v24 = v11;
  [v8 enumerateObjectsUsingBlock:v23];

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2;
  uint64_t v19 = &unk_1E55A2E10;
  id v22 = a1;
  id v20 = v6;
  id v12 = v9;
  id v21 = v12;
  id v13 = v6;
  [v11 enumerateObjectsUsingBlock:&v16];
  if (objc_msgSend(v12, "count", v16, v17, v18, v19)) {
    id v14 = (void *)[v12 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"attributedList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;

    id v4 = v5;
    if (v5)
    {
      [*(id *)(a1 + 32) addObject:v5];
      id v4 = v5;
    }
  }
  else
  {

    id v4 = 0;
  }
}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_299;
      v11[3] = &unk_1E55A2DE8;
      uint64_t v15 = *(void *)(a1 + 48);
      id v5 = v4;
      id v12 = v5;
      id v13 = *(id *)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      [v5 enumerateKeysAndObjectsUsingBlock:v11];

      id v6 = v12;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected response type: %{public}@", buf, 0x20u);
  }
  id v5 = 0;
LABEL_10:
}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_299(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a2;
  id v8 = objc_alloc_init(v6);
  LODWORD(v6) = [v7 isEqualToString:@"value"];

  if (v6)
  {
    id v9 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;

      if (v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2_302;
        uint64_t v16 = &unk_1E55A2DC0;
        uint64_t v20 = *(void *)(a1 + 56);
        id v17 = *(id *)(a1 + 32);
        id v18 = *(id *)(a1 + 40);
        id v12 = v11;
        id v19 = v12;
        [v10 enumerateObjectsUsingBlock:&v13];
        if (objc_msgSend(v12, "count", v13, v14, v15, v16)) {
          [v8 setObject:v12 forKeyedSubscript:@"value"];
        }
      }
    }
    else
    {

      id v10 = 0;
    }
  }
  if ([v8 count]) {
    [*(id *)(a1 + 48) addObject:v8];
  }
}

void __77__AMSFinancePaymentSheetResponse__attributedListDictionaryForValues_account___block_invoke_2_302(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = [v4 objectForKeyedSubscript:@"header"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;

        if (!v7) {
          goto LABEL_14;
        }
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
        [v5 setObject:v6 forKeyedSubscript:@"header"];
      }
      else
      {
        id v7 = 0;
      }

LABEL_14:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 56) _attributedStringForAttributedDictionary:v15 account:*(void *)(a1 + 40)];
          if (!v16) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v17 = [v4 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;

        if (v18)
        {
          uint64_t v16 = [*(id *)(a1 + 56) _attributedStringForAttributedArray:v18 account:*(void *)(a1 + 40)];
          goto LABEL_24;
        }
      }
      else
      {

        id v18 = 0;
      }
      uint64_t v16 = 0;
LABEL_24:

      id v15 = 0;
      if (!v16)
      {
LABEL_26:
        [*(id *)(a1 + 48) addObject:v5];

        goto LABEL_27;
      }
LABEL_25:
      [v5 setObject:v16 forKeyedSubscript:@"value"];
      goto LABEL_26;
    }
  }
  else
  {
  }
  id v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = AMSSetLogKeyIfNeeded();
    uint64_t v13 = *(void *)(a1 + 32);
    int v19 = 138543874;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unexpected inner response type: %{public}@", (uint8_t *)&v19, 0x20u);
  }
  id v4 = 0;
LABEL_27:
}

+ (id)_salableInfoDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7
{
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke;
  v18[3] = &unk_1E55A2E10;
  id v13 = v12;
  id v20 = v9;
  id v21 = a1;
  id v19 = v13;
  id v14 = v9;
  [v11 enumerateObjectsUsingBlock:v18];

  id v15 = v20;
  id v16 = v13;

  return v16;
}

void __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    if (!v4) {
      goto LABEL_15;
    }
    id v6 = 0;
LABEL_12:
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
    [v7 setObject:v10 forKey:@"value"];

    id v11 = *(void **)(a1 + 32);
    id v8 = (id)[v7 copy];
    [v11 addObject:v8];
    goto LABEL_13;
  }
  id v6 = v5;

  if (v4) {
    goto LABEL_12;
  }
  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:

      goto LABEL_20;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = [v6 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v9;
    }
    else {
      id v26 = 0;
    }

    id v18 = [v6 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    id v20 = [(id)objc_opt_class() _styleDictionaryWithName:v19 styles:*(void *)(a1 + 40)];
    if (v20)
    {
      uint64_t v21 = [(id)objc_opt_class() attributedStringWithString:v26 styles:v20];
      uint64_t v22 = (void *)v21;
      if (v21)
      {
        id v35 = @"value";
        v36[0] = v21;
        __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        [v8 addEntriesFromDictionary:v23];
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2;
      v27[3] = &unk_1E55A2E38;
      id v28 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v27];
      uint64_t v22 = v28;
    }

    uint64_t v24 = *(void **)(a1 + 32);
    uint64_t v25 = (void *)[v8 copy];
    [v24 addObject:v25];

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:
  id v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_opt_class();
    id v15 = v14;
    id v16 = AMSSetLogKeyIfNeeded();
    id v17 = AMSHashIfNeeded(v5);
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v14;
    __int16 v31 = 2114;
    v32 = v16;
    __int16 v33 = 2112;
    __int16 v34 = v17;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@:  [%{public}@] Salable Info value doesn't conform to String or Dictionary - %@", buf, 0x20u);
  }
  id v6 = 0;
LABEL_20:
}

void __115__AMSFinancePaymentSheetResponse__salableInfoDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [v9 isEqualToString:@"value"];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    [v7 setObject:v5 forKey:v9];
  }
}

+ (id)_flexListDictionaryForValues:(id)a3 styles:(id)a4 account:(id)a5 shouldUppercaseText:(BOOL)a6 designVersion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v16 = a3;
  id v17 = objc_alloc_init(v15);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke;
  uint64_t v27 = &unk_1E55A2EB0;
  id v31 = v17;
  id v32 = a1;
  id v28 = v14;
  id v29 = v12;
  id v30 = v13;
  BOOL v33 = a6;
  id v18 = v17;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  [v16 enumerateObjectsUsingBlock:&v24];

  uint64_t v22 = objc_msgSend(v18, "copy", v24, v25, v26, v27);
  return v22;
}

void __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke(uint64_t a1, void *a2)
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) isEqualToNumber:0x1EDD01660])
  {
    int v6 = [v3 objectForKeyedSubscript:@"valueStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v51 = v7;
    if ([v7 isEqualToString:@"gray"]) {
      unsigned int v49 = 1;
    }
    else {
      unsigned int v49 = [v7 isEqualToString:@"grey"];
    }
    id v10 = [v3 objectForKeyedSubscript:@"header"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v52 = v10;
    }
    else {
      uint64_t v52 = 0;
    }

    id v11 = [v3 objectForKeyedSubscript:@"headerIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v9 = v11;
    }
    else {
      unint64_t v9 = 0;
    }

    id v16 = [v3 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v16;
    }
    else {
      id v12 = 0;
    }

    uint64_t v20 = [v3 objectForKeyedSubscript:@"value"];
    id v13 = (id)v20;
    uint64_t v21 = v52;
    if (!(v52 | v9) || !v20) {
      goto LABEL_82;
    }
    if (v52)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v21 = [(id)v52 localizedUppercaseString];
      }
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21];
      if (v9)
      {
LABEL_37:
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
        if (v12)
        {
LABEL_38:
          __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12];
          goto LABEL_55;
        }
LABEL_54:
        __int16 v23 = 0;
LABEL_55:
        objc_opt_class();
        uint64_t v52 = v21;
        if (objc_opt_isKindOfClass())
        {
          __int16 v34 = *(void **)(a1 + 64);
          id v74 = v13;
          id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          uint64_t v36 = [v34 _attributedStringForStringArray:v35 useGrey:v49 account:*(void *)(a1 + 48) shouldUppercase:*(unsigned __int8 *)(a1 + 72)];

          if (!v22) {
            goto LABEL_62;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v36 = 0;
LABEL_68:
            if (!v23 || !v51) {
              goto LABEL_72;
            }
            v68[0] = @"style";
            v68[1] = @"value";
            v69[0] = v23;
            v69[1] = v36;
            uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
LABEL_71:
            id v40 = (void *)v37;
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v37, v48);

LABEL_72:
LABEL_82:

            goto LABEL_83;
          }
          uint64_t v36 = [*(id *)(a1 + 64) _attributedStringForStringArray:v13 useGrey:v49 account:*(void *)(a1 + 48) shouldUppercase:*(unsigned __int8 *)(a1 + 72)];
          if (!v22)
          {
LABEL_62:
            if (v48 && v36)
            {
              v70[0] = @"headerIcon";
              v70[1] = @"value";
              v71[0] = v48;
              v71[1] = v36;
              uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
              goto LABEL_71;
            }
            goto LABEL_68;
          }
        }
        if (v36)
        {
          v72[0] = @"header";
          v72[1] = @"value";
          v73[0] = v22;
          v73[1] = v36;
          uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
          goto LABEL_71;
        }
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v22 = 0;
      if (v9) {
        goto LABEL_37;
      }
    }
    v48 = 0;
    if (v12) {
      goto LABEL_38;
    }
    goto LABEL_54;
  }
  id v4 = [v3 objectForKeyedSubscript:@"leadingItem"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v51 = v5;
  uint64_t v52 = [*(id *)(a1 + 64) _flexListLeadingItemForValues:v5 styles:*(void *)(a1 + 40)];
  id v8 = [v3 objectForKeyedSubscript:@"padding"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = 0;
  }

  id v12 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = [v3 objectForKeyedSubscript:@"axID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;

      if (v15)
      {
        v50 = v15;
        if ([v15 length]) {
          [v13 setObject:v15 forKeyedSubscript:@"axID"];
        }
        goto LABEL_41;
      }
    }
    else
    {
    }
    v50 = 0;
LABEL_41:
    uint64_t v24 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    id v26 = [v3 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    id v28 = [(id)objc_opt_class() _styleDictionaryWithName:v27 styles:*(void *)(a1 + 40)];
    if (v9) {
      [v13 setObject:v9 forKey:@"padding"];
    }
    if (v28)
    {
      id v29 = [*(id *)(a1 + 48) username];
      id v30 = objc_msgSend(v25, "ams_replaceAccountPatternWithUsername:", v29);

      uint64_t v31 = [(id)objc_opt_class() attributedStringWithString:v30 styles:v28];
      id v32 = (void *)v31;
      if (v31)
      {
        uint64_t v75 = @"value";
        v76[0] = v31;
        BOOL v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
        [v13 addEntriesFromDictionary:v33];
      }
    }
    else
    {
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2;
      v65[3] = &unk_1E55A2E60;
      id v66 = *(id *)(a1 + 48);
      id v67 = v13;
      [v3 enumerateKeysAndObjectsUsingBlock:v65];

      id v32 = v66;
      id v30 = v25;
    }

    uint32_t v38 = *(void **)(a1 + 56);
    id v39 = (void *)[v13 copy];
    [v38 addObject:v39];

    goto LABEL_82;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__32;
    v63 = __Block_byref_object_dispose__32;
    id v64 = 0;
    id v18 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_307;
    v53[3] = &unk_1E55A2E88;
    uint64_t v41 = *(void *)(a1 + 64);
    v57 = &v59;
    uint64_t v58 = v41;
    id v54 = *(id *)(a1 + 40);
    id v13 = v17;
    id v55 = v13;
    id v42 = v19;
    id v56 = v42;
    [v42 enumerateObjectsUsingBlock:v53];
    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    v44 = (void *)[v13 copy];
    [v43 setObject:v44 forKeyedSubscript:@"value"];

    v45 = (void *)v60[5];
    if (v45 && [v45 length]) {
      [v43 setObject:v60[5] forKeyedSubscript:@"axID"];
    }
    if (v52) {
      [v43 setObject:v52 forKeyedSubscript:@"leadingItem"];
    }
    if (v9) {
      [v43 setObject:v9 forKey:@"padding"];
    }
    v46 = *(void **)(a1 + 56);
    v47 = (void *)[v43 copy];
    [v46 addObject:v47];

    _Block_object_dispose(&v59, 8);
    goto LABEL_82;
  }
LABEL_83:
}

void __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 username];
  id v8 = objc_msgSend(v6, "ams_replaceAccountPatternWithUsername:", v7);

  int v9 = [v12 isEqualToString:@"value"];
  id v10 = *(void **)(a1 + 40);
  if (v9)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
    [v10 setObject:v11 forKey:v12];
  }
  else
  {
    [v10 setObject:v8 forKey:v12];
  }
}

uint64_t __112__AMSFinancePaymentSheetResponse__flexListDictionaryForValues_styles_account_shouldUppercaseText_designVersion___block_invoke_307(uint64_t a1, void *a2, unint64_t a3)
{
  id v19 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  id v5 = v19;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v6 objectForKeyedSubscript:@"axID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
    goto LABEL_10;
  }
  id v8 = v7;

  if (v8 && [v8 length])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = v8;
    id v7 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
LABEL_10:
  }
  id v10 = [v6 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v12 = [v6 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v14 = [(id)objc_opt_class() _styleDictionaryWithName:v13 styles:*(void *)(a1 + 32)];
  id v15 = [(id)objc_opt_class() attributedStringWithString:v11 styles:v14];
  [*(id *)(a1 + 40) appendAttributedString:v15];
  if ([*(id *)(a1 + 48) count] - 1 > a3)
  {
    id v16 = *(void **)(a1 + 40);
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:0x1EDCC6888];
    [v16 appendAttributedString:v17];
  }
LABEL_20:
  return MEMORY[0x1F41817F8]();
}

+ (id)_flexListLeadingItemForValues:(id)a3 styles:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([v6 allKeys],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = [v6 objectForKeyedSubscript:@"iconType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v14 = [v6 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v40 = v14;
    }
    else {
      id v40 = 0;
    }

    id v15 = [v6 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    id v17 = [v6 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if ([v16 isEqualToString:@"url"])
    {
      id v19 = a1;
      id v20 = v12;
      uint64_t v21 = [v19 _salableIconForString:v12];
      uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
      __int16 v23 = v22;
      if (v21)
      {
        uint64_t v24 = [v22 host];
        if (v24)
        {
          id v25 = (void *)v24;
          id v26 = [v23 scheme];

          if (v26)
          {
            [v10 setObject:&unk_1EDD012D0 forKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemAttribute"];
            [v10 setObject:v18 forKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemValueAttribute"];
            id v27 = [MEMORY[0x1E4F28ED0] numberWithInteger:v21];
            [v10 setObject:v27 forKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemIconTypeAttribute"];
          }
        }
      }

      id v12 = v20;
    }
    else if ([v16 isEqualToString:@"symbol"] && v18)
    {
      [v10 setObject:&unk_1EDD012E8 forKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemAttribute"];
      [v10 setObject:v18 forKeyedSubscript:@"AMSPaymentSheetContentItemLeadingItemValueAttribute"];
    }
    id v28 = [v10 allKeys];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      id v13 = (void *)[v10 copy];
    }
    else
    {
      id v39 = v12;
      id v30 = +[AMSLogConfig sharedConfig];
      if (!v30)
      {
        id v30 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = objc_opt_class();
        id v38 = v32;
        BOOL v33 = AMSSetLogKeyIfNeeded();
        AMSHashIfNeeded(v16);
        __int16 v34 = v37 = v10;
        id v35 = AMSHashIfNeeded(v6);
        *(_DWORD *)buf = 138544130;
        id v42 = v32;
        __int16 v43 = 2114;
        v44 = v33;
        __int16 v45 = 2114;
        v46 = v34;
        __int16 v47 = 2112;
        v48 = v35;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@:  [%{public}@] Unable to construct a valid leading item of type \"%{public}@\" raw values were: %@", buf, 0x2Au);

        id v10 = v37;
      }

      id v13 = 0;
      id v12 = v39;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (int64_t)_confirmationTitleForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"pay"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"confirm"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"get"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"install"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"rent"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"redeem"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"subscribe"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_enrichedMetricsDictionaryWithFinanceDictionary:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  [v3 setObject:&unk_1EDD01300 forKeyedSubscript:@"eventVersion"];
  int64_t v4 = +[AMSDevice screenScale];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"pixelRatio"];
  }
  id v5 = +[AMSDevice screenWidth];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"screenWidth"];
  }
  id v6 = +[AMSDevice screenHeight];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"screenHeight"];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

+ (int64_t)_payeeInferredFromEnumeratedTitle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    int64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v3 logKey];
    int v29 = 138543618;
    uint64_t v30 = v6;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requestor key not found, attempting to infer requestor from title enumeration.", (uint8_t *)&v29, 0x16u);
  }
  if ([v3 titleType] == 1)
  {
    id v8 = [v3 title];
    char v9 = [v8 isEqualToString:@"AppleArcade"];

    if (v9)
    {
      int64_t v10 = 6;
    }
    else
    {
      id v15 = [v3 title];
      int v16 = [v15 isEqualToString:@"AppleFitness"];

      if (v16) {
        int64_t v10 = 7;
      }
      else {
        int64_t v10 = 0;
      }
    }
    id v17 = [v3 title];
    char v18 = [v17 isEqualToString:@"AppleMusic"];

    if (v18)
    {
      int64_t v10 = 1;
      goto LABEL_25;
    }
    id v19 = [v3 title];
    char v20 = [v19 isEqualToString:@"AppleNews"];

    if (v20)
    {
      int64_t v10 = 2;
      goto LABEL_25;
    }
    uint64_t v21 = [v3 title];
    char v22 = [v21 isEqualToString:@"AppleOne"];

    if (v22)
    {
      int64_t v10 = 8;
      goto LABEL_25;
    }
    __int16 v23 = [v3 title];
    char v24 = [v23 isEqualToString:@"AppleTV"];

    if (v24)
    {
      int64_t v10 = 9;
      goto LABEL_25;
    }
    id v11 = +[AMSLogConfig sharedAccountsConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_opt_class();
      id v27 = [v3 logKey];
      id v28 = [v3 title];
      int v29 = 138543874;
      uint64_t v30 = v26;
      __int16 v31 = 2114;
      id v32 = v27;
      __int16 v33 = 2114;
      __int16 v34 = v28;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No requestor identified for title: %{public}@", (uint8_t *)&v29, 0x20u);
    }
  }
  else
  {
    id v11 = +[AMSLogConfig sharedAccountsConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = [v3 logKey];
      int v29 = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No requestor identified, title type is not enumeration", (uint8_t *)&v29, 0x16u);
    }
    int64_t v10 = 0;
  }

LABEL_25:
  return v10;
}

+ (int64_t)_salableIconForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"app"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"merchant"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"messages"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"watch"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"vision"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)_salableInfoForKey:(id)a3 inDictionary:(id)a4 shouldUppercase:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = [v8 objectForKeyedSubscript:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  id v10 = v9;

  if (!v10)
  {
LABEL_6:
    id v11 = [v8 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;

      if (v12)
      {
        v18[0] = v12;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    id v10 = 0;
    if (!v5) {
      goto LABEL_13;
    }
LABEL_11:
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__AMSFinancePaymentSheetResponse__salableInfoForKey_inDictionary_shouldUppercase___block_invoke;
    v16[3] = &unk_1E559EE28;
    id v17 = v13;
    id v12 = v13;
    [v10 enumerateObjectsUsingBlock:v16];
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v12];

    id v10 = (id)v14;
    goto LABEL_12;
  }
  if (v5) {
    goto LABEL_11;
  }
LABEL_13:

  return v10;
}

void __82__AMSFinancePaymentSheetResponse__salableInfoForKey_inDictionary_shouldUppercase___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 localizedUppercaseString];
  [v2 addObject:v3];
}

+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__AMSFinancePaymentSheetResponse__styleDictionaryWithName_styles___block_invoke;
  v10[3] = &unk_1E55A2ED8;
  id v11 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v10);
  id v8 = [v7 firstObject];

  return v8;
}

id __66__AMSFinancePaymentSheetResponse__styleDictionaryWithName_styles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [v3 objectForKeyedSubscript:@"name"];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)_attributedStringForAttributedArray:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__AMSFinancePaymentSheetResponse__attributedStringForAttributedArray_account___block_invoke;
  v16[3] = &unk_1E55A2F00;
  id v17 = v7;
  id v18 = v8;
  id v20 = v9;
  id v21 = a1;
  id v19 = v6;
  id v10 = v9;
  id v11 = v6;
  id v12 = v8;
  id v13 = v7;
  [v11 enumerateObjectsUsingBlock:v16];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v12];

  return v14;
}

void __78__AMSFinancePaymentSheetResponse__attributedStringForAttributedArray_account___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v10;

    if (v5)
    {
      objc_msgSend(v5, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(void *)(a1 + 32), 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) appendAttributedString:v6];
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v7 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v7;

    if (v6)
    {
      id v8 = *(void **)(a1 + 40);
      char v9 = [*(id *)(a1 + 64) _attributedStringForAttributedDictionary:v6 account:*(void *)(a1 + 32)];
      [v8 appendAttributedString:v9];
    }
    id v5 = 0;
  }
  else
  {

    id v5 = 0;
    id v6 = 0;
  }
LABEL_10:

  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

+ (id)_attributedStringForAttributedDictionary:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;

    if (!v8)
    {
      id v10 = 0;
      goto LABEL_11;
    }
    char v9 = objc_msgSend(v8, "ams_replacingMarkupUsingAccount:shouldUppercase:", v6, 0);
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [v5 objectForKeyedSubscript:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v11;
    }
    else {
      id v7 = 0;
    }

    if ([v7 isEqualToString:@"large"])
    {
      uint64_t v12 = [v10 length];
      objc_msgSend(v10, "addAttribute:value:range:", @"useLargeSize", MEMORY[0x1E4F1CC38], 0, v12);
    }
  }
  else
  {
    id v8 = 0;
    id v10 = 0;
  }

LABEL_11:
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v10];

  return v13;
}

+ (id)_attributedStringForSalableInfoStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __101__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStringArray_account_shouldUppercase___block_invoke;
  char v22 = &unk_1E55A2F28;
  BOOL v28 = a5;
  id v26 = v11;
  id v27 = a1;
  id v23 = v9;
  id v24 = v10;
  id v25 = v8;
  id v12 = v11;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  [v13 enumerateObjectsUsingBlock:&v19];
  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v17 = objc_msgSend(v16, "initWithAttributedString:", v14, v19, v20, v21, v22);

  return v17;
}

void __101__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStringArray_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = objc_msgSend(a2, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
  id v6 = v5;
  if (a3)
  {
    id v8 = v5;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));

    id v6 = (void *)v7;
  }
  id v9 = v6;
  [*(id *)(a1 + 40) appendAttributedString:v6];
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

+ (id)_attributedStringForSalableInfoStyledStringArray:(id)a3 account:(id)a4 shouldUppercase:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __107__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStyledStringArray_account_shouldUppercase___block_invoke;
  char v22 = &unk_1E55A2F50;
  BOOL v28 = a5;
  id v26 = v11;
  id v27 = a1;
  id v23 = v9;
  id v24 = v10;
  id v25 = v8;
  id v12 = v11;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  [v13 enumerateObjectsUsingBlock:&v19];
  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v17 = objc_msgSend(v16, "initWithAttributedString:", v14, v19, v20, v21, v22);

  return v17;
}

void __107__AMSFinancePaymentSheetResponse__attributedStringForSalableInfoStyledStringArray_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
      goto LABEL_6;
    }
  }
  else
  {

    id v6 = 0;
  }
  uint64_t v7 = 0;
LABEL_6:
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;

    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = [v8 objectForKeyedSubscript:@"value"];
    id v10 = v7;
    uint64_t v7 = (void *)v9;
  }
  else
  {
    id v8 = 0;
    id v10 = v12;
  }

LABEL_11:
  if (a3)
  {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v7, 0, objc_msgSend(v7, "length"));

    uint64_t v7 = (void *)v11;
  }
  [*(id *)(a1 + 40) appendAttributedString:v7];
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

+ (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4 account:(id)a5 shouldUppercase:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __98__AMSFinancePaymentSheetResponse__attributedStringForStringArray_useGrey_account_shouldUppercase___block_invoke;
  id v24 = &unk_1E55A2F78;
  BOOL v30 = a6;
  BOOL v31 = a4;
  id v28 = v13;
  id v29 = a1;
  id v25 = v11;
  id v26 = v12;
  id v27 = v10;
  id v14 = v13;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  [v15 enumerateObjectsUsingBlock:&v21];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v19 = objc_msgSend(v18, "initWithAttributedString:", v16, v21, v22, v23, v24);

  return v19;
}

void __98__AMSFinancePaymentSheetResponse__attributedStringForStringArray_useGrey_account_shouldUppercase___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = objc_msgSend(a2, "ams_replacingMarkupUsingAccount:shouldUppercase:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72));
  id v6 = v5;
  if (*(unsigned char *)(a1 + 73))
  {
    id v8 = v5;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 64), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));

    id v6 = (void *)v7;
  }
  id v9 = v6;
  [*(id *)(a1 + 40) appendAttributedString:v6];
  if ([*(id *)(a1 + 48) count] - 1 > a3) {
    [*(id *)(a1 + 40) appendAttributedString:*(void *)(a1 + 56)];
  }
}

+ (id)attributedStringWithString:(id)a3 styles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"image"];
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@" %@", v7];
    uint64_t v9 = [v5 stringByAppendingString:v8];

    id v5 = (id)v9;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
  id v11 = [v6 objectForKeyedSubscript:@"color"];
  if ([v11 isEqualToString:@"gray"])
  {

LABEL_6:
    uint64_t v14 = [v5 length];
    objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentContentItemLightColorAttribute", MEMORY[0x1E4F1CC38], 0, v14);
    goto LABEL_7;
  }
  id v12 = [v6 objectForKeyedSubscript:@"color"];
  int v13 = [v12 isEqualToString:@"grey"];

  if (v13) {
    goto LABEL_6;
  }
LABEL_7:
  id v15 = [v6 objectForKeyedSubscript:@"bold"];
  if (([v15 isEqualToString:@"true"] & 1) != 0 || objc_msgSend(v15, "BOOLValue"))
  {
    uint64_t v16 = [v5 length];
    objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentContentItemBoldAttribute", MEMORY[0x1E4F1CC38], 0, v16);
  }
  id v17 = [v6 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v17;

    if (v18)
    {
      __int16 v34 = v18;
      objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentSheetContentItemSizeAttribute", v18, 0, objc_msgSend(v5, "length"));
      goto LABEL_15;
    }
  }
  else
  {
  }
  __int16 v34 = 0;
LABEL_15:
  uint64_t v19 = [v6 objectForKeyedSubscript:@"spacingAfter"];
  uint64_t v20 = v19;
  if (!v19) {
    goto LABEL_23;
  }
  if ([v19 isEqualToString:@"large"])
  {
    uint64_t v21 = AMSPaymentSheetContentItemSpacingAttributeLargeValue;
  }
  else if ([v20 isEqualToString:@"small"])
  {
    uint64_t v21 = AMSPaymentSheetContentItemSpacingAttributeSmallValue;
  }
  else
  {
    if (![v20 isEqualToString:@"medium"]) {
      goto LABEL_23;
    }
    uint64_t v21 = AMSPaymentSheetContentItemSpacingAttributeMediumValue;
  }
  objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentSheetContentItemSpacingAfterAttribute", *v21, 0, objc_msgSend(v5, "length"));
LABEL_23:
  uint64_t v22 = [v6 objectForKeyedSubscript:@"spacingBefore"];
  id v23 = v22;
  if (!v22) {
    goto LABEL_31;
  }
  if ([v22 isEqualToString:@"large"])
  {
    id v24 = AMSPaymentSheetContentItemSpacingAttributeLargeValue;
  }
  else if ([v23 isEqualToString:@"small"])
  {
    id v24 = AMSPaymentSheetContentItemSpacingAttributeSmallValue;
  }
  else
  {
    if (![v23 isEqualToString:@"medium"]) {
      goto LABEL_31;
    }
    id v24 = AMSPaymentSheetContentItemSpacingAttributeMediumValue;
  }
  objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentSheetContentItemSpacingBeforeAttribute", *v24, 0, objc_msgSend(v5, "length"));
LABEL_31:
  id v25 = [v6 objectForKeyedSubscript:@"dividerBefore"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v33 = v15;
    id v26 = v7;
    id v27 = v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    id v29 = [v28 lowercaseString];
    char v30 = [v29 isEqualToString:@"false"];

    uint64_t v7 = v26;
    id v15 = v33;
    if ((v30 & 1) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v25 BOOLValue] & 1) == 0) {
LABEL_39:
  }
    objc_msgSend(v10, "addAttribute:value:range:", @"AMSPaymentSheetContentItemDividerAttribute", @"AMSPaymentSheetContentItemDividerNoValue", 0, objc_msgSend(v5, "length"));
LABEL_40:
  BOOL v31 = (void *)[v10 copy];

  return v31;
}

+ (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  id v5 = a3;
  if (!_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute) {
    objc_storeStrong((id *)&_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute, @"AMSPaymentContentItemLightColorAttribute");
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v5];
  uint64_t v7 = v6;
  if (_greyAttributedStringForAttributedString_range__kAMSPaymentContentItemLightColorAttribute) {
    BOOL v8 = length == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    objc_msgSend(v6, "addAttribute:value:range:");
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v7];

  return v9;
}

+ (id)createRequestFromDictionary:(id)a3 confirmationOnly:(BOOL)a4 delegateAuthenticationRequired:(BOOL)a5 biometricSignatureRequired:(BOOL)a6 authenticateResponse:(id)a7 taskInfo:(id)a8 account:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  v232[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v18 timeIntervalSince1970];
  double v20 = v19;

  v214 = v15;
  v219 = [v15 authenticateRequest];
  uint64_t v21 = objc_alloc_init(AMSPaymentSheetRequest);
  [(AMSPaymentSheetRequest *)v21 setResponseDictionary:v14];
  v215 = v14;
  uint64_t v22 = [v14 objectForKeyedSubscript:@"paymentSheetInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  id v213 = v23;

  [(AMSPaymentSheetRequest *)v21 setRequiresAuthorization:!v13];
  if (v12)
  {
    id v24 = [v16 response];
    id v25 = objc_msgSend(v24, "ams_valueForHTTPHeaderField:", @"X-Apple-DelegateAuth-Challenge");
    [(AMSPaymentSheetRequest *)v21 setDelegateAuthenticateChallenge:v25];

    id v26 = +[AMSDelegateAuthenticateRequest preferredUserAgent];
    [(AMSPaymentSheetRequest *)v21 setUserAgent:v26];

    [(AMSPaymentSheetRequest *)v21 setIsDelegateAuthentication:1];
  }
  v220 = v16;
  if (v11)
  {
    v217 = [v16 response];
    v223 = [v16 properties];
    id v27 = [v223 account];
    id v28 = [v16 session];
    id v29 = [v16 task];
    char v30 = [v16 properties];
    BOOL v31 = [v30 clientInfo];
    [v220 properties];
    __int16 v33 = v32 = v17;
    __int16 v34 = [v33 keychainOptions];
    uint64_t v35 = +[AMSBiometricsSignatureRequest biometricsSignatureRequestForURLResponse:v217 account:v27 session:v28 task:v29 clientInfo:v31 options:v34 error:0];
    [(AMSPaymentSheetRequest *)v21 setBiometricsRequest:v35];

    id v17 = v32;
    id v16 = v220;
  }
  if (!v17)
  {
    uint64_t v36 = [v16 properties];
    id v17 = [v36 account];
  }
  [(AMSPaymentSheetRequest *)v21 setAccount:v17];
  uint64_t v37 = [v16 properties];
  id v38 = [v37 logUUID];
  [(AMSPaymentSheetRequest *)v21 setLogKey:v38];

  id v39 = [v213 objectForKeyedSubscript:@"caseControl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v40 = v39;
  }
  else {
    id v40 = 0;
  }
  id v41 = v40;

  v212 = v41;
  id v42 = [v41 lowercaseString];
  int v43 = [v42 isEqualToString:@"true"];

  unsigned int v224 = v43 ^ 1;
  -[AMSPaymentSheetRequest setShouldUppercaseText:](v21, "setShouldUppercaseText:");
  v44 = [v213 objectForKeyedSubscript:@"designVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v45 = v44;
  }
  else {
    id v45 = 0;
  }
  id v46 = v45;

  [(AMSPaymentSheetRequest *)v21 setDesignVersion:v46];
  __int16 v47 = [v213 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v48 = v47;
  }
  else {
    id v48 = 0;
  }
  id v49 = v48;

  if (v49)
  {
    v50 = [v49 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v51 = v50;
    }
    else {
      id v51 = 0;
    }
    id v52 = v51;

    if ([v52 isEqualToString:@"text"])
    {
      uint64_t v53 = 0;
    }
    else if ([v52 isEqualToString:@"enum"])
    {
      uint64_t v53 = 1;
    }
    else
    {
      uint64_t v53 = 2;
    }
    [(AMSPaymentSheetRequest *)v21 setTitleType:v53];
    id v54 = [v49 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v55 = v54;
    }
    else {
      id v55 = 0;
    }
    id v56 = v55;

    [(AMSPaymentSheetRequest *)v21 setTitle:v56];
  }
  v57 = [(AMSPaymentSheetRequest *)v21 title];
  uint64_t v58 = [v57 length];

  if (!v58)
  {
    uint64_t v59 = [v213 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v60 = v59;
    }
    else {
      id v60 = 0;
    }
    id v61 = v60;

    if (v61)
    {
      [(AMSPaymentSheetRequest *)v21 setTitle:v61];
      [(AMSPaymentSheetRequest *)v21 setTitleType:0];
    }
  }
  v62 = [v213 objectForKeyedSubscript:@"accountHeader"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v63 = v62;
  }
  else {
    id v63 = 0;
  }
  id v64 = v63;

  [(AMSPaymentSheetRequest *)v21 setAccountHeader:v64];
  if ((v43 & 1) == 0)
  {
    v65 = [(AMSPaymentSheetRequest *)v21 accountHeader];
    id v66 = [v65 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setAccountHeader:v66];
  }
  id v67 = [v213 objectForKeyedSubscript:@"countryCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v68 = v67;
  }
  else {
    id v68 = 0;
  }
  id v69 = v68;

  [(AMSPaymentSheetRequest *)v21 setCountryCode:v69];
  v70 = [(AMSPaymentSheetRequest *)v21 countryCode];

  if (!v70) {
    [(AMSPaymentSheetRequest *)v21 setCountryCode:@"US"];
  }
  v71 = [v213 objectForKeyedSubscript:@"currency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v72 = v71;
  }
  else {
    id v72 = 0;
  }
  id v73 = v72;

  [(AMSPaymentSheetRequest *)v21 setCurrencyCode:v73];
  id v74 = [(AMSPaymentSheetRequest *)v21 currencyCode];

  if (!v74) {
    [(AMSPaymentSheetRequest *)v21 setCurrencyCode:@"USD"];
  }
  uint64_t v75 = [v213 objectForKeyedSubscript:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v76 = v75;
  }
  else {
    id v76 = 0;
  }
  id v77 = v76;

  [(AMSPaymentSheetRequest *)v21 setPrice:v77];
  v78 = [v213 objectForKeyedSubscript:@"displayPrice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v79 = v78;
  }
  else {
    id v79 = 0;
  }
  id v80 = v79;

  [(AMSPaymentSheetRequest *)v21 setDisplayPrice:v80];
  if ((v43 & 1) == 0)
  {
    v81 = [(AMSPaymentSheetRequest *)v21 displayPrice];
    v82 = [v81 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setDisplayPrice:v82];
  }
  v83 = [v219 options];
  v84 = [v83 promptTitle];
  [(AMSPaymentSheetRequest *)v21 setExplanation:v84];

  v85 = [v219 options];
  v86 = [v85 reason];
  [(AMSPaymentSheetRequest *)v21 setMessage:v86];

  v87 = [v213 objectForKeyedSubscript:@"priceSection"];
  if (!v87)
  {
    v87 = [v213 objectForKeyedSubscript:@"pricingSection"];
  }
  id v88 = v87;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v89 = v88;
  }
  else {
    id v89 = 0;
  }
  id v90 = v89;

  v210 = v88;
  if (v90)
  {
    id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v227[0] = MEMORY[0x1E4F143A8];
    v227[1] = 3221225472;
    v227[2] = __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke;
    v227[3] = &unk_1E55A2FA0;
    v92 = v21;
    v228 = v92;
    id v93 = v91;
    id v229 = v93;
    [v90 enumerateObjectsUsingBlock:v227];
    [(AMSPaymentSheetRequest *)v92 setPriceSectionItems:v93];
  }
  if ([(AMSPaymentSheetRequest *)v21 titleType] == 1) {
    -[AMSPaymentSheetRequest setPayee:](v21, "setPayee:", [a1 _payeeInferredFromEnumeratedTitle:v21]);
  }
  v94 = [v213 objectForKeyedSubscript:@"salableIcon"];
  objc_opt_class();
  v211 = v49;
  if (objc_opt_isKindOfClass()) {
    id v95 = v94;
  }
  else {
    id v95 = 0;
  }
  id v96 = v95;

  if (v96)
  {
    uint64_t v97 = [MEMORY[0x1E4F1CB10] URLWithString:v96];
    [(AMSPaymentSheetRequest *)v21 setSalableIconURL:v97];
  }
  v98 = [v213 objectForKeyedSubscript:@"salableIconType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v99 = v98;
  }
  else {
    id v99 = 0;
  }
  id v100 = v99;

  if (v100)
  {
    v101 = [v100 lowercaseString];
    -[AMSPaymentSheetRequest setSalableIcon:](v21, "setSalableIcon:", [a1 _salableIconForString:v101]);
  }
  v207 = v100;
  v102 = [v213 objectForKeyedSubscript:@"storeName"];
  objc_opt_class();
  v208 = v96;
  if (objc_opt_isKindOfClass()) {
    id v103 = v102;
  }
  else {
    id v103 = 0;
  }
  id v104 = v103;

  [(AMSPaymentSheetRequest *)v21 setStoreName:v104];
  if ((v43 & 1) == 0)
  {
    v105 = [(AMSPaymentSheetRequest *)v21 storeName];
    v106 = [v105 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setStoreName:v106];
  }
  __int16 v107 = [v213 objectForKeyedSubscript:@"rating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v108 = v107;
  }
  else {
    id v108 = 0;
  }
  id v109 = v108;

  v218 = v109;
  v110 = [v109 objectForKeyedSubscript:@"header"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v111 = v110;
  }
  else {
    id v111 = 0;
  }
  id v112 = v111;

  [(AMSPaymentSheetRequest *)v21 setRatingHeader:v112];
  v113 = [v218 objectForKeyedSubscript:@"text"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v114 = v113;
  }
  else {
    id v114 = 0;
  }
  id v115 = v114;

  [(AMSPaymentSheetRequest *)v21 setRatingValue:v115];
  if ((v43 & 1) == 0)
  {
    v116 = [(AMSPaymentSheetRequest *)v21 ratingHeader];
    v117 = [v116 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setRatingHeader:v117];

    v118 = [(AMSPaymentSheetRequest *)v21 ratingValue];
    v119 = [v118 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setRatingValue:v119];
  }
  v120 = [v213 objectForKeyedSubscript:@"confirmationTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v121 = v120;
  }
  else {
    id v121 = 0;
  }
  id v122 = v121;

  if (v122)
  {
    v123 = [v122 lowercaseString];
    -[AMSPaymentSheetRequest setConfirmationTitle:](v21, "setConfirmationTitle:", [a1 _confirmationTitleForString:v123]);
  }
  v124 = [v213 objectForKeyedSubscript:@"paymentSummary"];
  objc_opt_class();
  v206 = v122;
  if (objc_opt_isKindOfClass()) {
    id v125 = v124;
  }
  else {
    id v125 = 0;
  }
  id v126 = v125;

  [(AMSPaymentSheetRequest *)v21 setPaymentSummary:v126];
  if ((v43 & 1) == 0)
  {
    v127 = [(AMSPaymentSheetRequest *)v21 paymentSummary];
    v128 = [v127 localizedUppercaseString];
    [(AMSPaymentSheetRequest *)v21 setPaymentSummary:v128];
  }
  v129 = [v213 objectForKeyedSubscript:@"preSheetDialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v130 = v129;
  }
  else {
    id v130 = 0;
  }
  id v131 = a1;
  id v132 = v130;

  if (v132) {
    goto LABEL_111;
  }
  v145 = [v213 objectForKeyedSubscript:@"preSheetDialog"];
  objc_opt_class();
  id v146 = (objc_opt_isKindOfClass() & 1) != 0 ? v145 : 0;
  id v204 = v146;

  if (v204)
  {
    v232[0] = v204;
    id v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v232 count:1];

    if (v132)
    {
LABEL_111:
      v133 = [(AMSPaymentSheetRequest *)v21 designVersion];
      v134 = [a1 _flexListDictionaryForValues:v132 styles:0 account:v17 shouldUppercaseText:v224 designVersion:v133];
      [(AMSPaymentSheetRequest *)v21 setPreSheetDialog:v134];
    }
  }
  v135 = [v213 objectForKeyedSubscript:@"isApplePay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v136 = v135;
  }
  else {
    id v136 = 0;
  }
  id v137 = v136;

  v205 = v137;
  v138 = [v137 lowercaseString];
  LODWORD(v137) = [v138 isEqualToString:@"true"];

  if (v137) {
    [(AMSPaymentSheetRequest *)v21 setApplePayClassic:1];
  }
  v139 = [v213 objectForKeyedSubscript:@"styles"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v140 = v139;
  }
  else {
    id v140 = 0;
  }
  id v141 = v140;

  if (v141) {
    [(AMSPaymentSheetRequest *)v21 setStyles:v141];
  }
  v222 = v141;
  v142 = [v213 objectForKeyedSubscript:@"salableInfo"];

  v209 = v90;
  if (v142)
  {
    v143 = [v213 objectForKeyedSubscript:@"salableInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v144 = v143;
    }
    else {
      id v144 = 0;
    }
    id v147 = v144;

    v148 = [(AMSPaymentSheetRequest *)v21 designVersion];
    v149 = [v131 _salableInfoDictionaryForValues:v147 styles:v222 account:v17 shouldUppercaseText:v224 designVersion:v148];

    [(AMSPaymentSheetRequest *)v21 setSalableInfo:v149];
    v150 = [v131 _attributedStringForSalableInfoStyledStringArray:v149 account:v17 shouldUppercase:v224];
    [(AMSPaymentSheetRequest *)v21 setSalableInfoLabel:v150];
  }
  v151 = [v213 objectForKeyedSubscript:@"secondarySheetInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v152 = v151;
  }
  else {
    id v152 = 0;
  }
  id v153 = v152;

  v216 = v17;
  if (v153)
  {
    v154 = [v153 objectForKeyedSubscript:@"salableIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v155 = v154;
    }
    else {
      id v155 = 0;
    }
    id v156 = v155;

    if (v156) {
      [MEMORY[0x1E4F1CB10] URLWithString:v156];
    }
    else {
    v157 = [(AMSPaymentSheetRequest *)v21 salableIconURL];
    }
    [(AMSPaymentSheetRequest *)v21 setSecondarySalableIconURL:v157];

    v158 = [v153 objectForKeyedSubscript:@"salableIconType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v159 = v158;
    }
    else {
      id v159 = 0;
    }
    id v160 = v159;

    if (v160)
    {
      v161 = [v160 lowercaseString];
      -[AMSPaymentSheetRequest setSecondarySalableIcon:](v21, "setSecondarySalableIcon:", [v131 _salableIconForString:v161]);
    }
    else
    {
      [(AMSPaymentSheetRequest *)v21 setSecondarySalableIcon:[(AMSPaymentSheetRequest *)v21 salableIcon]];
    }
    v162 = [v131 _salableInfoForKey:@"salableInfo" inDictionary:v153 shouldUppercase:v224];
    [(AMSPaymentSheetRequest *)v21 setSecondarySalableInfo:v162];
    v163 = [v131 _attributedStringForSalableInfoStringArray:v162 account:v17 shouldUppercase:v224];
    [(AMSPaymentSheetRequest *)v21 setSecondarySalableInfoLabel:v163];

    v164 = [v153 objectForKeyedSubscript:@"flexList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v165 = v164;
    }
    else {
      id v165 = 0;
    }
    id v166 = v165;

    if (v166)
    {
      v167 = [(AMSPaymentSheetRequest *)v21 designVersion];
      v168 = [v131 _flexListDictionaryForValues:v166 styles:v222 account:v17 shouldUppercaseText:v224 designVersion:v167];
      [(AMSPaymentSheetRequest *)v21 setSecondaryFlexList:v168];

      id v17 = v216;
    }
  }
  v169 = [v213 objectForKeyedSubscript:@"images"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v170 = [[AMSPaymentSheetInlineImage alloc] initWithURLString:v169];
    v231 = v170;
    v171 = (void *)MEMORY[0x1E4F1C978];
    v172 = &v231;
LABEL_155:
    id v173 = [v171 arrayWithObjects:v172 count:1];
    [(AMSPaymentSheetRequest *)v21 setInlineImages:v173];
LABEL_156:

    goto LABEL_157;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v170 = [[AMSPaymentSheetInlineImage alloc] initWithDictionary:v169];
    v230 = v170;
    v171 = (void *)MEMORY[0x1E4F1C978];
    v172 = &v230;
    goto LABEL_155;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v170 = (AMSPaymentSheetInlineImage *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v173 = v169;
    if ([v173 count])
    {
      v225[0] = MEMORY[0x1E4F143A8];
      v225[1] = 3221225472;
      v225[2] = __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke_2;
      v225[3] = &unk_1E55A2FC8;
      v226 = v170;
      [v173 enumerateObjectsUsingBlock:v225];
    }
    v203 = [MEMORY[0x1E4F1C978] arrayWithArray:v170];
    [(AMSPaymentSheetRequest *)v21 setInlineImages:v203];

    goto LABEL_156;
  }
LABEL_157:
  v174 = [v213 objectForKeyedSubscript:@"flexList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v175 = v174;
  }
  else {
    id v175 = 0;
  }
  id v176 = v175;

  if (v176)
  {
    v177 = [(AMSPaymentSheetRequest *)v21 designVersion];
    v178 = [v131 _flexListDictionaryForValues:v176 styles:v222 account:v17 shouldUppercaseText:v224 designVersion:v177];
    [(AMSPaymentSheetRequest *)v21 setFlexList:v178];

    v179 = [v131 _attributedListDictionaryForValues:v176 account:v17];
    [(AMSPaymentSheetRequest *)v21 setAttributedList:v179];
  }
  v180 = [v213 objectForKeyedSubscript:@"disablePasscodeFallback"];
  if (objc_opt_respondsToSelector())
  {
    v181 = [v213 objectForKeyedSubscript:@"disablePasscodeFallback"];
    -[AMSPaymentSheetRequest setDisablePasscodeFallback:](v21, "setDisablePasscodeFallback:", [v181 BOOLValue]);
  }
  else
  {
    [(AMSPaymentSheetRequest *)v21 setDisablePasscodeFallback:0];
  }

  v182 = [v213 objectForKeyedSubscript:@"drawBackground"];
  if (objc_opt_respondsToSelector())
  {
    v183 = [v213 objectForKeyedSubscript:@"drawBackground"];
    -[AMSPaymentSheetRequest setDrawBackground:](v21, "setDrawBackground:", [v183 BOOLValue]);
  }
  else
  {
    [(AMSPaymentSheetRequest *)v21 setDrawBackground:1];
  }

  v184 = [v213 objectForKeyedSubscript:@"drawBottomDivider"];
  if (objc_opt_respondsToSelector())
  {
    v185 = [v213 objectForKeyedSubscript:@"drawBottomDivider"];
    -[AMSPaymentSheetRequest setDrawBottomDivider:](v21, "setDrawBottomDivider:", [v185 BOOLValue]);
  }
  else
  {
    [(AMSPaymentSheetRequest *)v21 setDrawBottomDivider:0];
  }

  id v186 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v186 timeIntervalSince1970];
  double v188 = v187;

  v189 = [AMSPaymentSheetPerformanceMetrics alloc];
  v190 = [v220 properties];
  v191 = [v190 bag];
  v192 = [(AMSPaymentSheetPerformanceMetrics *)v189 initWithBag:v191];

  [(AMSPaymentSheetPerformanceMetrics *)v192 setPrimaryDataParseStartTime:v20];
  [(AMSPaymentSheetPerformanceMetrics *)v192 setPrimaryDataParseEndTime:v188];
  v193 = [v220 metrics];
  v194 = [v193 transactionMetrics];
  v195 = [v194 firstObject];
  v196 = [v195 responseStartDate];
  [v196 timeIntervalSince1970];
  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataResponseStartTime:](v192, "setPrimaryDataResponseStartTime:");

  v197 = [v220 metrics];
  v198 = [v197 transactionMetrics];
  v199 = [v198 firstObject];
  v200 = [v199 responseEndDate];
  [v200 timeIntervalSince1970];
  -[AMSPaymentSheetPerformanceMetrics setPrimaryDataResponseEndTime:](v192, "setPrimaryDataResponseEndTime:");

  [(AMSPaymentSheetRequest *)v21 setPerformanceMetrics:v192];
  v201 = v21;

  return v201;
}

void __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_alloc_init(AMSPaymentSheetPriceSectionItem);
  int64_t v4 = [v10 objectForKeyedSubscript:@"header"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if ([*(id *)(a1 + 32) shouldUppercaseText])
  {
    id v6 = [v5 localizedUppercaseString];
    [(AMSPaymentSheetPriceSectionItem *)v3 setLabel:v6];
  }
  else
  {
    [(AMSPaymentSheetPriceSectionItem *)v3 setLabel:v5];
  }
  uint64_t v7 = [v10 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if ([*(id *)(a1 + 32) shouldUppercaseText])
  {
    uint64_t v9 = [v8 localizedUppercaseString];
    [(AMSPaymentSheetPriceSectionItem *)v3 setPrice:v9];
  }
  else
  {
    [(AMSPaymentSheetPriceSectionItem *)v3 setPrice:v8];
  }
  [*(id *)(a1 + 40) addObject:v3];
}

void __175__AMSFinancePaymentSheetResponse_createRequestFromDictionary_confirmationOnly_delegateAuthenticationRequired_biometricSignatureRequired_authenticateResponse_taskInfo_account___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [[AMSPaymentSheetInlineImage alloc] initWithURLString:v5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v3 = [[AMSPaymentSheetInlineImage alloc] initWithDictionary:v5];
  }
  int64_t v4 = v3;
  [*(id *)(a1 + 32) addObject:v3];

LABEL_6:
}

+ (id)fallbackTitleFromResponse:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"paymentSheetInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [v4 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = v5;

  if (v6)
  {
    id v5 = [v6 objectForKeyedSubscript:@"fallback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v5;
      uint64_t v7 = v5;
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (AMSFinanceAuthenticateResponse)authenticateResponse
{
  return self->_authenticateResponse;
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (AMSPaymentSheetRequest)paymentSheetRequest
{
  return self->_paymentSheetRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetRequest, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_authenticateResponse, 0);
}

@end