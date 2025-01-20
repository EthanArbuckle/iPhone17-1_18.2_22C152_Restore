@interface AMSUIWebFetchTelephonyAction
- (AMSUIWebFetchTelephonyAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)suppressPhoneNumber;
- (id)runAction;
- (void)setSuppressPhoneNumber:(BOOL)a3;
@end

@implementation AMSUIWebFetchTelephonyAction

- (AMSUIWebFetchTelephonyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebFetchTelephonyAction;
  v7 = [(AMSUIWebAction *)&v11 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"suppressPhoneNumber"];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 objectForKeyedSubscript:@"suppressPhoneNumber"];
      v7->_suppressPhoneNumber = [v9 BOOLValue];
    }
    else
    {
      v7->_suppressPhoneNumber = 0;
    }
  }
  return v7;
}

- (id)runAction
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v47.receiver = self;
  v47.super_class = (Class)AMSUIWebFetchTelephonyAction;
  id v3 = [(AMSUIWebAction *)&v47 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = v6;
    __int16 v52 = 2114;
    v53 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching telephony...", buf, 0x16u);
  }
  v8 = [(AMSUIWebAction *)self context];
  v9 = [v8 dataProvider];
  v10 = [v9 telephony];

  if (v10)
  {
    objc_super v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      objc_super v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v13;
      __int16 v52 = 2114;
      v53 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched telephony", buf, 0x16u);
    }
    if ([(AMSUIWebFetchTelephonyAction *)self suppressPhoneNumber])
    {
      v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v15)
      {
        v15 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_opt_class();
        v18 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v17;
        __int16 v52 = 2114;
        v53 = v18;
        _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Suppressing phone number", buf, 0x16u);
      }
      v19 = 0;
    }
    else
    {
      v19 = [v10 phoneNumber];
      if (v19)
      {
        v26 = [v10 formattedPhoneNumber:v19];
LABEL_24:
        v27 = (void *)MEMORY[0x263F27E10];
        if (v26) {
          v28 = v26;
        }
        else {
          v28 = &stru_26CC491D8;
        }
        v49[0] = v28;
        v48[0] = @"formattedPhoneNumber";
        v48[1] = @"mobileCountryCode";
        uint64_t v29 = [v10 countryCode];
        v30 = (void *)v29;
        if (v29) {
          v31 = (__CFString *)v29;
        }
        else {
          v31 = &stru_26CC491D8;
        }
        v49[1] = v31;
        v48[2] = @"mobileNetworkCode";
        uint64_t v32 = [v10 networkCode];
        v33 = (void *)v32;
        if (v32) {
          v34 = (__CFString *)v32;
        }
        else {
          v34 = &stru_26CC491D8;
        }
        if (v19) {
          v35 = v19;
        }
        else {
          v35 = &stru_26CC491D8;
        }
        v49[2] = v34;
        v49[3] = v35;
        v48[3] = @"phoneNumber";
        v48[4] = @"providerName";
        uint64_t v36 = [v10 providerName];
        v37 = (void *)v36;
        if (v36) {
          v38 = (__CFString *)v36;
        }
        else {
          v38 = &stru_26CC491D8;
        }
        v49[4] = v38;
        v48[5] = @"radioTechnology";
        uint64_t v39 = [v10 radioTechnology];
        v40 = (void *)v39;
        if (v39) {
          v41 = (__CFString *)v39;
        }
        else {
          v41 = &stru_26CC491D8;
        }
        v49[5] = v41;
        v48[6] = @"radioType";
        uint64_t v42 = [v10 radioType];
        v43 = (void *)v42;
        if (v42) {
          v44 = (__CFString *)v42;
        }
        else {
          v44 = &stru_26CC491D8;
        }
        v49[6] = v44;
        v45 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:7];
        v25 = [v27 promiseWithResult:v45];

        goto LABEL_46;
      }
    }
    v26 = 0;
    goto LABEL_24;
  }
  AMSError();
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v20)
  {
    v20 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = objc_opt_class();
    v23 = AMSLogKey();
    v24 = AMSLogableError();
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v22;
    __int16 v52 = 2114;
    v53 = v23;
    __int16 v54 = 2114;
    v55 = v24;
    _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch telephony: %{public}@", buf, 0x20u);
  }
  v25 = [MEMORY[0x263F27E10] promiseWithError:v19];
LABEL_46:

  return v25;
}

- (BOOL)suppressPhoneNumber
{
  return self->_suppressPhoneNumber;
}

- (void)setSuppressPhoneNumber:(BOOL)a3
{
  self->_suppressPhoneNumber = a3;
}

@end