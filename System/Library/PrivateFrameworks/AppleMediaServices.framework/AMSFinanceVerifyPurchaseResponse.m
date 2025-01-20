@interface AMSFinanceVerifyPurchaseResponse
+ (BOOL)isVerifyPurchasePayload:(id)a3;
+ (id)_dialogRequestForCVVFromPayload:(id)a3 verifyType:(int64_t)a4;
+ (id)_dialogRequestForCarrierFromPayload:(id)a3 verifyType:(int64_t)a4;
+ (int64_t)_verifyTypeFromPayload:(id)a3;
- (AMSDialogRequest)dialogRequest;
- (AMSFinanceVerifyPurchaseResponse)initWithPayload:(id)a3 taskInfo:(id)a4;
- (AMSURLTaskInfo)taskInfo;
- (NSDictionary)responseDictionary;
- (id)_handleCVVDialogResult:(id)a3 shouldReattempt:(BOOL *)a4;
- (id)_handleCarrierDialogResult:(id)a3 shouldReattempt:(BOOL *)a4;
- (id)_runCVVRequestForCode:(id)a3 error:(id *)a4;
- (id)_runCarrierNewCodeWithError:(id *)a3;
- (id)_runCarrierVerifyCode:(id)a3 error:(id *)a4;
- (id)performWithTaskInfo:(id)a3;
- (int64_t)verifyType;
- (void)setDialogRequest:(id)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setTaskInfo:(id)a3;
- (void)setVerifyType:(int64_t)a3;
@end

@implementation AMSFinanceVerifyPurchaseResponse

+ (BOOL)isVerifyPurchasePayload:(id)a3
{
  return [a1 _verifyTypeFromPayload:a3] != 0;
}

+ (int64_t)_verifyTypeFromPayload:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"failureType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if ([v4 isEqualToString:@"machineVerificationFailed"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"carrierBillingVerificationFailed"])
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (AMSFinanceVerifyPurchaseResponse)initWithPayload:(id)a3 taskInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = +[AMSFinanceVerifyPurchaseResponse _verifyTypeFromPayload:v7];
  if (!v9)
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown verify purchase type: %ld", buf, 0x20u);
    }
    v16 = 0;
    goto LABEL_15;
  }
  int64_t v10 = v9;
  if (v9 == 2)
  {
    uint64_t v11 = +[AMSFinanceVerifyPurchaseResponse _dialogRequestForCarrierFromPayload:v7 verifyType:2];
  }
  else
  {
    if (v9 != 1)
    {
LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
    uint64_t v11 = +[AMSFinanceVerifyPurchaseResponse _dialogRequestForCVVFromPayload:v7 verifyType:1];
  }
  v12 = (void *)v11;
  if (!v11) {
    goto LABEL_16;
  }
  v20.receiver = self;
  v20.super_class = (Class)AMSFinanceVerifyPurchaseResponse;
  v17 = [(AMSFinanceVerifyPurchaseResponse *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dialogRequest, v12);
    objc_storeStrong((id *)&v18->_responseDictionary, a3);
    objc_storeStrong((id *)&v18->_taskInfo, a4);
    v18->_verifyType = v10;
  }
  self = v18;
  v16 = self;
LABEL_15:

LABEL_17:
  return v16;
}

- (id)performWithTaskInfo:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  int64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v6;
    __int16 v55 = 2114;
    v56 = v7;
    __int16 v57 = 2048;
    int64_t v58 = [(AMSFinanceVerifyPurchaseResponse *)self verifyType];
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing verification with type: %ld", buf, 0x20u);
  }
  id v8 = [v48 session];
  int64_t v9 = [v48 session];
  v49 = [v9 delegate];

  v50 = [(AMSFinanceVerifyPurchaseResponse *)self dialogRequest];
  if ([(AMSFinanceVerifyPurchaseResponse *)self verifyType])
  {
    id v10 = 0;
  }
  else
  {
    AMSError(2, @"Verify Dialog Error", @"Unknown verify type", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = [v48 properties];
  char v12 = [v11 dialogOptions];

  if (v12)
  {
    uint64_t v13 = AMSError(2, @"Finance Dialog Error", @"Dialogs were suppressed by the caller", 0);

    id v10 = (id)v13;
  }
  char v14 = objc_opt_respondsToSelector();
  char v15 = objc_opt_respondsToSelector();
  if ((v14 & 1) == 0 && (v15 & 1) == 0)
  {
    uint64_t v17 = AMSError(2, @"Verify Dialog Error", @"No delegate to present the dialog", 0);

    id v10 = (id)v17;
  }
  char v52 = 1;
  if (v10)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_50;
  }
  v19 = 0;
  objc_super v20 = 0;
  unsigned int v21 = 0;
  *(void *)&long long v16 = 138543618;
  long long v46 = v16;
  v47 = v8;
  while (1)
  {
    uint64_t v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    __int16 v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      __int16 v25 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v24;
      __int16 v55 = 2114;
      v56 = v25;
      __int16 v57 = 2114;
      int64_t v58 = (int64_t)v50;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting dialog: %{public}@", buf, 0x20u);
    }
    uint64_t v26 = objc_alloc_init(AMSPromise);
    if (v14)
    {
      uint64_t v27 = [v48 task];
      v28 = [(AMSPromise *)v26 completionHandlerAdapter];
      [v49 AMSURLSession:v8 task:v27 handleDialogRequest:v50 completion:v28];
    }
    else
    {
      v29 = +[AMSLogConfig sharedConfig];
      if (!v29)
      {
        v29 = +[AMSLogConfig sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = objc_opt_class();
        v32 = AMSLogKey();
        *(_DWORD *)buf = v46;
        uint64_t v54 = v31;
        __int16 v55 = 2114;
        v56 = v32;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Calling legacy delegate for dialog handling", buf, 0x16u);

        id v8 = v47;
      }

      uint64_t v27 = [(AMSPromise *)v26 completionHandlerAdapter];
      [v49 AMSURLSession:v8 handleDialogRequest:v50 completion:v27];
    }

    id v51 = 0;
    v18 = [(AMSPromise *)v26 resultWithTimeout:&v51 error:300.0];
    id v10 = v51;

    if (v10) {
      break;
    }
    int64_t v33 = [(AMSFinanceVerifyPurchaseResponse *)self verifyType];
    if (v33)
    {
      if (v33 == 2)
      {
        uint64_t v34 = [(AMSFinanceVerifyPurchaseResponse *)self _handleCarrierDialogResult:v18 shouldReattempt:&v52];
      }
      else
      {
        if (v33 != 1) {
          goto LABEL_35;
        }
        uint64_t v34 = [(AMSFinanceVerifyPurchaseResponse *)self _handleCVVDialogResult:v18 shouldReattempt:&v52];
      }
      v35 = (void *)v34;

      v19 = v35;
    }
    else
    {
      char v52 = 0;
    }
LABEL_35:
    id v10 = 0;
    if (v52 && v21 >= 2)
    {
      v36 = +[AMSLogConfig sharedConfig];
      if (!v36)
      {
        v36 = +[AMSLogConfig sharedConfig];
      }
      v37 = [v36 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_opt_class();
        v39 = AMSLogKey();
        *(_DWORD *)buf = v46;
        uint64_t v54 = v38;
        id v8 = v47;
        __int16 v55 = 2114;
        v56 = v39;
        _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Max attempts reached", buf, 0x16u);
      }
      AMSError(6, @"Verify Dialog Error", @"Max attempts reached, cancelling dialog", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      char v52 = 0;
    }

    if (!v10)
    {
      ++v21;
      objc_super v20 = v18;
      if (v52) {
        continue;
      }
    }
    goto LABEL_50;
  }
  v40 = +[AMSLogConfig sharedConfig];
  if (!v40)
  {
    v40 = +[AMSLogConfig sharedConfig];
  }
  v41 = [v40 OSLogObject];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    uint64_t v42 = objc_opt_class();
    v43 = AMSLogKey();
    v44 = AMSLogableError(v10);
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v42;
    __int16 v55 = 2114;
    v56 = v43;
    __int16 v57 = 2114;
    int64_t v58 = (int64_t)v44;
    _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to present dialog. Error: %{public}@", buf, 0x20u);

    id v8 = v47;
  }

LABEL_50:
  if (v10 && !v19)
  {
    v19 = +[AMSURLAction actionWithError:v10];
  }
  [v19 setDialogResult:v18];

  return v19;
}

+ (id)_dialogRequestForCarrierFromPayload:(id)a3 verifyType:(int64_t)a4
{
  id v4 = a3;
  int64_t v5 = [v4 objectForKeyedSubscript:@"customerTitleMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v4 objectForKeyedSubscript:@"customerMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  uint64_t v27 = v8;
  v28 = v6;
  int64_t v9 = +[AMSDialogRequest requestWithTitle:v6 message:v8];
  id v10 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  uint64_t v11 = [v10 localizedStringForKey:@"VERIFY_PAYMENT_ENTER_CODE" value:&stru_1EDCA7308 table:0];
  char v12 = +[AMSDialogTextField textFieldWithPlaceholder:v11 secure:0];

  [v12 setKeyboardType:2];
  [v9 addTextField:v12];
  uint64_t v13 = [v4 objectForKeyedSubscript:@"failureClientInfo"];
  objc_opt_class();
  id v14 = 0;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }

  char v15 = [v14 objectForKeyedSubscript:@"localization"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  uint64_t v17 = [v16 objectForKeyedSubscript:@"customerSubmitButtonMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  if ([v18 length])
  {
    v19 = +[AMSDialogAction actionWithTitle:v18];
    [v19 setIdentifier:@"customerSubmitButtonMessage"];
    [v9 addButtonAction:v19];
    [v9 setDefaultAction:v19];
  }
  objc_super v20 = [v16 objectForKeyedSubscript:@"customerSendNewCodeButtonMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if ([v21 length])
  {
    uint64_t v22 = +[AMSDialogAction actionWithTitle:v21];
    [v22 setIdentifier:@"customerSendNewCodeButtonMessage"];
    [v9 addButtonAction:v22];
  }
  __int16 v23 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  uint64_t v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1EDCA7308 table:0];
  __int16 v25 = +[AMSDialogAction actionWithTitle:v24];

  [v25 setStyle:2];
  [v9 addButtonAction:v25];

  return v9;
}

+ (id)_dialogRequestForCVVFromPayload:(id)a3 verifyType:(int64_t)a4
{
  id v4 = a3;
  int64_t v5 = [v4 objectForKeyedSubscript:@"customerTitleMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v4 objectForKeyedSubscript:@"customerMessage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  int64_t v9 = +[AMSDialogRequest requestWithTitle:v6 message:v8];
  id v10 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  uint64_t v11 = [v10 localizedStringForKey:@"VERIFY_PAYMENT_ENTER_CVV" value:&stru_1EDCA7308 table:0];
  char v12 = +[AMSDialogTextField textFieldWithPlaceholder:v11 secure:0];

  [v12 setKeyboardType:2];
  [v9 addTextField:v12];
  id v13 = [v4 objectForKeyedSubscript:@"dialog"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;

    if (!v14) {
      goto LABEL_16;
    }
    char v15 = [v14 objectForKeyedSubscript:@"okButtonString"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_14;
    }
    id v13 = v15;

    if (v13)
    {
      char v15 = +[AMSDialogAction actionWithTitle:v13];
      [v9 addButtonAction:v15];
LABEL_14:
    }
  }
  else
  {
    id v14 = 0;
  }

LABEL_16:
  id v16 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  uint64_t v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1EDCA7308 table:0];
  id v18 = +[AMSDialogAction actionWithTitle:v17];

  [v18 setStyle:2];
  [v9 addButtonAction:v18];

  return v9;
}

- (id)_handleCarrierDialogResult:(id)a3 shouldReattempt:(BOOL *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v62 = v9;
    __int16 v63 = 2114;
    v64 = v10;
    __int16 v65 = 2114;
    id v66 = v6;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling CVV dialog result: %{public}@", buf, 0x20u);
  }
  uint64_t v11 = [v6 originalRequest];
  char v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(AMSFinanceVerifyPurchaseResponse *)self dialogRequest];
  }
  id v14 = v13;

  char v15 = [v6 selectedActionIdentifier];
  id v16 = [v14 locateActionWithIdentifier:v15];

  uint64_t v17 = [v16 identifier];
  int v18 = [v17 isEqualToString:@"customerSendNewCodeButtonMessage"];

  if (v18)
  {
    id v60 = 0;
    id v19 = [(AMSFinanceVerifyPurchaseResponse *)self _runCarrierNewCodeWithError:&v60];
    id v20 = v60;
    if (!v20)
    {
      __int16 v25 = 0;
      BOOL v26 = 1;
      goto LABEL_55;
    }
    id v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v62 = v23;
      __int16 v63 = 2114;
      v64 = v24;
      __int16 v65 = 2114;
      id v66 = v20;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to send new code. %{public}@", buf, 0x20u);
    }
    __int16 v25 = 0;
    BOOL v26 = 1;
LABEL_54:

LABEL_55:
    if (!a4) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  uint64_t v27 = [v16 identifier];
  int v28 = [v27 isEqualToString:@"customerSubmitButtonMessage"];

  if (v28)
  {
    v29 = [v6 textfieldValues];
    id v20 = [v29 firstObject];

    if (![v20 length])
    {
      id v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        id v21 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = objc_opt_class();
        v36 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v62 = v35;
        __int16 v63 = 2114;
        v64 = v36;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No code provided, cancelling verification", buf, 0x16u);
      }
      BOOL v26 = 0;
      __int16 v25 = 0;
      goto LABEL_54;
    }
    id v59 = 0;
    v30 = [(AMSFinanceVerifyPurchaseResponse *)self _runCarrierVerifyCode:v20 error:&v59];
    id v21 = v59;
    v56 = v30;
    uint64_t v31 = [v30 object];
    objc_opt_class();
    id v32 = 0;
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }

    int64_t v58 = v32;
    int64_t v33 = [v32 objectForKeyedSubscript:@"failureType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }

    __int16 v57 = a4;
    v37 = v34;
    if (!v34 && v21)
    {
      uint64_t v38 = [v21 userInfo];
      v39 = [v38 objectForKeyedSubscript:@"AMSServerErrorCode"];

      v37 = [v39 stringValue];
    }
    v40 = [v58 objectForKeyedSubscript:@"success"];
    __int16 v55 = v40;
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v40, "BOOLValue", v40))
    {
      v41 = v37;
      uint64_t v42 = +[AMSLogConfig sharedConfig];
      if (!v42)
      {
        uint64_t v42 = +[AMSLogConfig sharedConfig];
      }
      v43 = [v42 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = objc_opt_class();
        v45 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v62 = v44;
        __int16 v63 = 2114;
        v64 = v45;
        _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Carrier verification succeeded", buf, 0x16u);
      }
      __int16 v25 = +[AMSURLAction retryAction];
      [v25 setRetryIdentifier:0x1EDCC3BE8];
    }
    else
    {
      if (!v21 || [v37 length])
      {
        v41 = v37;
        long long v46 = +[AMSLogConfig sharedConfig];
        if (!v46)
        {
          long long v46 = +[AMSLogConfig sharedConfig];
        }
        v47 = [v46 OSLogObject];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = objc_opt_class();
          v49 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v62 = v48;
          __int16 v63 = 2114;
          v64 = v49;
          __int16 v65 = 2112;
          id v66 = v41;
          _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] User entered incorrect SMS code. (failureType: %@)", buf, 0x20u);
        }
        __int16 v25 = 0;
        BOOL v26 = 1;
        goto LABEL_53;
      }
      v41 = v37;
      v50 = +[AMSLogConfig sharedConfig];
      if (!v50)
      {
        v50 = +[AMSLogConfig sharedConfig];
      }
      id v51 = objc_msgSend(v50, "OSLogObject", v55);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = objc_opt_class();
        v53 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v62 = v52;
        __int16 v63 = 2114;
        v64 = v53;
        __int16 v65 = 2114;
        id v66 = v21;
        _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier verification failed. %{public}@", buf, 0x20u);
      }
      __int16 v25 = +[AMSURLAction actionWithError:v21];
    }
    BOOL v26 = 0;
LABEL_53:

    uint64_t v22 = v56;
    a4 = v57;
    goto LABEL_54;
  }
  BOOL v26 = 0;
  __int16 v25 = 0;
  if (a4) {
LABEL_56:
  }
    *a4 = v26;
LABEL_57:

  return v25;
}

- (id)_handleCVVDialogResult:(id)a3 shouldReattempt:(BOOL *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v57 = v9;
    __int16 v58 = 2114;
    id v59 = v10;
    __int16 v60 = 2114;
    id v61 = v6;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling CVV dialog result: %{public}@", buf, 0x20u);
  }
  uint64_t v11 = [v6 originalRequest];
  char v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(AMSFinanceVerifyPurchaseResponse *)self dialogRequest];
  }
  id v14 = v13;

  char v15 = [v6 selectedActionIdentifier];
  id v16 = [v14 locateActionWithIdentifier:v15];

  uint64_t v17 = [v6 textfieldValues];
  int v18 = [v17 firstObject];

  if ([v18 length] && objc_msgSend(v16, "style") != 2)
  {
    uint64_t v52 = v14;
    id v55 = 0;
    id v20 = [(AMSFinanceVerifyPurchaseResponse *)self _runCVVRequestForCode:v18 error:&v55];
    id v19 = v55;
    BOOL v26 = [v20 object];
    objc_opt_class();
    id v27 = 0;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }

    v53 = v27;
    int v28 = [v27 objectForKeyedSubscript:@"failureType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }

    uint64_t v54 = a4;
    id v14 = v52;
    v30 = v29;
    if (v29)
    {
      uint64_t v31 = off_1E559C000;
    }
    else
    {
      uint64_t v31 = off_1E559C000;
      if (v19)
      {
        id v32 = [v19 userInfo];
        int64_t v33 = [v32 objectForKeyedSubscript:@"AMSServerErrorCode"];

        v30 = [v33 stringValue];
      }
    }
    id v51 = v30;
    if (([v30 isEqualToString:@"5202"] & 1) != 0
      || [v30 isEqualToString:@"2025"])
    {
      id v34 = [(__objc2_class *)v31[17] sharedConfig];
      if (!v34)
      {
        id v34 = [(__objc2_class *)v31[17] sharedConfig];
      }
      uint64_t v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = objc_opt_class();
        AMSLogKey();
        uint64_t v38 = v37 = v16;
        *(_DWORD *)buf = 138543618;
        uint64_t v57 = v36;
        __int16 v58 = 2114;
        id v59 = v38;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid verification code", buf, 0x16u);

        id v16 = v37;
      }

      __int16 v25 = 0;
      BOOL v24 = 1;
    }
    else
    {
      v39 = [(__objc2_class *)v31[17] sharedConfig];
      if (v19)
      {
        if (!v39)
        {
          v39 = [(__objc2_class *)v31[17] sharedConfig];
        }
        v40 = v39;
        v41 = [v39 OSLogObject];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = objc_opt_class();
          AMSLogKey();
          uint64_t v44 = v43 = v16;
          *(_DWORD *)buf = 138543874;
          uint64_t v57 = v42;
          __int16 v58 = 2114;
          id v59 = v44;
          __int16 v60 = 2114;
          id v61 = v19;
          _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] CVV verification failed. %{public}@", buf, 0x20u);

          id v16 = v43;
        }

        __int16 v25 = +[AMSURLAction actionWithError:v19];
      }
      else
      {
        if (!v39)
        {
          v39 = [(__objc2_class *)v31[17] sharedConfig];
        }
        v45 = v39;
        long long v46 = [v39 OSLogObject];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = objc_opt_class();
          AMSLogKey();
          v49 = uint64_t v48 = v16;
          *(_DWORD *)buf = 138543618;
          uint64_t v57 = v47;
          __int16 v58 = 2114;
          id v59 = v49;
          _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verification succeeded", buf, 0x16u);

          id v16 = v48;
        }

        __int16 v25 = +[AMSURLAction retryAction];
        [v25 setRetryIdentifier:0x1EDCC3BC8];
      }
      BOOL v24 = 0;
    }

    a4 = v54;
  }
  else
  {
    id v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      AMSLogKey();
      v23 = uint64_t v22 = v16;
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v21;
      __int16 v58 = 2114;
      id v59 = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dialog cancelled", buf, 0x16u);

      id v16 = v22;
    }
    BOOL v24 = 0;
    __int16 v25 = 0;
  }

  if (a4) {
    *a4 = v24;
  }

  return v25;
}

- (id)_runCarrierNewCodeWithError:(id *)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(AMSFinanceVerifyPurchaseResponse *)self responseDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"failureClientInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [v7 objectForKeyedSubscript:@"carrierBillingUrls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v10 = [v9 objectForKeyedSubscript:@"sendCodeUrl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v11 = 0;
    goto LABEL_12;
  }
  id v11 = v10;

  if (!v11
    || ([MEMORY[0x1E4F1CB10] URLWithString:v11],
        (char v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    AMSError(2, @"Verify Purchase Failed", @"No new code URL found", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    char v12 = 0;
    id v14 = 0;
    char v15 = 0;
    if (v13) {
      goto LABEL_19;
    }
  }
  id v42 = v7;
  v43 = a3;
  long long v46 = @"guid";
  uint64_t v16 = +[AMSDevice deviceGUID];
  uint64_t v17 = (void *)v16;
  int v18 = &stru_1EDCA7308;
  if (v16) {
    int v18 = (__CFString *)v16;
  }
  v47[0] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];

  id v20 = [AMSURLRequestEncoder alloc];
  uint64_t v21 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  uint64_t v22 = [v21 properties];
  uint64_t v23 = [v22 bag];
  BOOL v24 = [(AMSURLRequestEncoder *)v20 initWithBag:v23];

  [(AMSURLRequestEncoder *)v24 setRequestEncoding:2];
  __int16 v25 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  BOOL v26 = [v25 properties];
  id v27 = [v26 account];
  [(AMSURLRequestEncoder *)v24 setAccount:v27];

  [(AMSURLRequestEncoder *)v24 setDialogOptions:1];
  int v28 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  id v29 = [v28 properties];
  [(AMSURLRequestEncoder *)v24 setParentProperties:v29];

  v30 = [(AMSURLRequestEncoder *)v24 requestWithMethod:4 URL:v12 parameters:v19];
  id v45 = 0;
  id v14 = [v30 resultWithError:&v45];
  id v13 = v45;

  if (v13)
  {
    char v15 = 0;
  }
  else
  {
    v40 = [AMSURLSession alloc];
    v41 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    uint64_t v31 = [v41 session];
    id v32 = [v31 configuration];
    int64_t v33 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    id v34 = [v33 session];
    [v34 delegate];
    v36 = id v35 = v9;
    v37 = [(AMSURLSession *)v40 initWithConfiguration:v32 delegate:v36 delegateQueue:0];

    id v9 = v35;
    uint64_t v38 = [(AMSURLSession *)v37 dataTaskPromiseWithRequest:v14];
    id v44 = 0;
    char v15 = [v38 resultWithError:&v44];
    id v13 = v44;
  }
  id v7 = v42;
  a3 = v43;
LABEL_19:
  if (a3) {
    *a3 = v13;
  }

  return v15;
}

- (id)_runCarrierVerifyCode:(id)a3 error:(id *)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AMSFinanceVerifyPurchaseResponse *)self responseDictionary];
  id v8 = [v7 objectForKeyedSubscript:@"failureClientInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  id v10 = [v9 objectForKeyedSubscript:@"carrierBillingUrls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  long long v46 = v11;
  char v12 = [v11 objectForKeyedSubscript:@"verifyCodeUrl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v13 = 0;
    goto LABEL_12;
  }
  id v13 = v12;

  if (!v13
    || ([MEMORY[0x1E4F1CB10] URLWithString:v13],
        (id v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_12:
    AMSError(2, @"Verify Purchase Failed", @"No verify URL found", 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    if (v15) {
      goto LABEL_19;
    }
  }
  id v44 = v9;
  id v45 = a4;
  v49[0] = @"guid";
  uint64_t v18 = +[AMSDevice deviceGUID];
  id v19 = (void *)v18;
  id v20 = &stru_1EDCA7308;
  if (v18) {
    id v20 = (__CFString *)v18;
  }
  v49[1] = @"verificationCode";
  v50[0] = v20;
  v50[1] = v6;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

  uint64_t v22 = [AMSURLRequestEncoder alloc];
  uint64_t v23 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  BOOL v24 = [v23 properties];
  __int16 v25 = [v24 bag];
  BOOL v26 = [(AMSURLRequestEncoder *)v22 initWithBag:v25];

  [(AMSURLRequestEncoder *)v26 setRequestEncoding:2];
  id v27 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  int v28 = [v27 properties];
  id v29 = [v28 account];
  [(AMSURLRequestEncoder *)v26 setAccount:v29];

  v30 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  uint64_t v31 = [v30 properties];
  [(AMSURLRequestEncoder *)v26 setParentProperties:v31];

  id v32 = [(AMSURLRequestEncoder *)v26 requestWithMethod:4 URL:v14 parameters:v21];
  id v48 = 0;
  uint64_t v16 = [v32 resultWithError:&v48];
  id v15 = v48;

  if (v15)
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v42 = [AMSURLSession alloc];
    v43 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    int64_t v33 = [v43 session];
    id v34 = [v33 configuration];
    id v35 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    uint64_t v36 = [v35 session];
    [v36 delegate];
    uint64_t v38 = v37 = v6;
    v39 = [(AMSURLSession *)v42 initWithConfiguration:v34 delegate:v38 delegateQueue:0];

    id v6 = v37;
    v40 = [(AMSURLSession *)v39 dataTaskPromiseWithRequest:v16];
    id v47 = 0;
    uint64_t v17 = [v40 resultWithError:&v47];
    id v15 = v47;
  }
  id v9 = v44;
  a4 = v45;
LABEL_19:
  if (a4) {
    *a4 = v15;
  }

  return v17;
}

- (id)_runCVVRequestForCode:(id)a3 error:(id *)a4
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AMSFinanceVerifyPurchaseResponse *)self responseDictionary];
  id v8 = [v7 objectForKeyedSubscript:@"nextActionUrl"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
    goto LABEL_6;
  }
  id v9 = v8;

  if (!v9
    || ([MEMORY[0x1E4F1CB10] URLWithString:v9],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    AMSError(2, @"Verify Purchase Failed", @"No verify URL", 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
    char v12 = 0;
    id v13 = 0;
    if (v11) {
      goto LABEL_14;
    }
  }
  v40 = a4;
  v43[0] = @"guid";
  uint64_t v14 = +[AMSDevice deviceGUID];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_1EDCA7308;
  }
  v44[0] = v16;
  v44[1] = v6;
  v43[1] = @"cvm";
  v43[2] = @"machineName";
  v44[2] = &stru_1EDCA7308;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

  uint64_t v18 = [AMSURLRequestEncoder alloc];
  id v19 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  id v20 = [v19 properties];
  uint64_t v21 = [v20 bag];
  uint64_t v22 = [(AMSURLRequestEncoder *)v18 initWithBag:v21];

  [(AMSURLRequestEncoder *)v22 setRequestEncoding:2];
  uint64_t v23 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  BOOL v24 = [v23 properties];
  __int16 v25 = [v24 account];
  [(AMSURLRequestEncoder *)v22 setAccount:v25];

  BOOL v26 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
  id v27 = [v26 properties];
  [(AMSURLRequestEncoder *)v22 setParentProperties:v27];

  int v28 = [(AMSURLRequestEncoder *)v22 requestWithMethod:4 URL:v10 parameters:v17];
  id v42 = 0;
  char v12 = [v28 resultWithError:&v42];
  id v11 = v42;

  if (v11)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v38 = [AMSURLSession alloc];
    v39 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    id v29 = [v39 session];
    v30 = [v29 configuration];
    uint64_t v31 = [(AMSFinanceVerifyPurchaseResponse *)self taskInfo];
    [v31 session];
    int64_t v33 = v32 = v6;
    id v34 = [v33 delegate];
    id v35 = [(AMSURLSession *)v38 initWithConfiguration:v30 delegate:v34 delegateQueue:0];

    id v6 = v32;
    uint64_t v36 = [(AMSURLSession *)v35 dataTaskPromiseWithRequest:v12];
    id v41 = 0;
    id v13 = [v36 resultWithError:&v41];
    id v11 = v41;
  }
  a4 = v40;
LABEL_14:
  if (a4) {
    *a4 = v11;
  }

  return v13;
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

- (int64_t)verifyType
{
  return self->_verifyType;
}

- (void)setVerifyType:(int64_t)a3
{
  self->_verifyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
}

@end