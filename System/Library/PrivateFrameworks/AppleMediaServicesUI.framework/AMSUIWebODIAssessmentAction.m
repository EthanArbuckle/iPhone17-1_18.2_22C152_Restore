@interface AMSUIWebODIAssessmentAction
- (AMSUIWebODIAssessmentAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)additionalAttributes;
- (NSString)rawAccountType;
- (NSString)rawBundleIdentifer;
- (NSString)rawSessionIdentifer;
- (id)runAction;
- (id)sessionIdentifierForString:(id)a3;
- (unint64_t)accountTypeForString:(id)a3;
- (void)setAdditionalAttributes:(id)a3;
- (void)setRawAccountType:(id)a3;
- (void)setRawBundleIdentifer:(id)a3;
- (void)setRawSessionIdentifer:(id)a3;
@end

@implementation AMSUIWebODIAssessmentAction

- (AMSUIWebODIAssessmentAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebODIAssessmentAction;
  v7 = [(AMSUIWebAction *)&v21 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"additionalAttributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    additionalAttributes = v7->_additionalAttributes;
    v7->_additionalAttributes = v9;

    v11 = [v6 objectForKeyedSubscript:@"accountType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    rawAccountType = v7->_rawAccountType;
    v7->_rawAccountType = v12;

    v14 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    rawBundleIdentifer = v7->_rawBundleIdentifer;
    v7->_rawBundleIdentifer = v15;

    v17 = [v6 objectForKeyedSubscript:@"sessionIdentifer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    rawSessionIdentifer = v7->_rawSessionIdentifer;
    v7->_rawSessionIdentifer = v18;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebODIAssessmentAction;
  id v3 = [(AMSUIWebAction *)&v39 runAction];
  v4 = [(AMSUIWebODIAssessmentAction *)self rawAccountType];
  unint64_t v5 = [(AMSUIWebODIAssessmentAction *)self accountTypeForString:v4];

  id v6 = [(AMSUIWebODIAssessmentAction *)self rawSessionIdentifer];
  v7 = [(AMSUIWebODIAssessmentAction *)self sessionIdentifierForString:v6];

  v8 = [(AMSUIWebODIAssessmentAction *)self rawBundleIdentifer];
  if (!v8)
  {
    v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v13)
    {
      v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v15;
      __int16 v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bundle identifier passed. Will fallback to process bundle identifier.", buf, 0x16u);
    }
    v17 = [MEMORY[0x263F27E08] currentProcess];
    v8 = [v17 bundleIdentifier];

    if (v7) {
      goto LABEL_3;
    }
LABEL_10:
    v18 = (void *)MEMORY[0x263F27E10];
    v19 = AMSError();
    v20 = [v18 promiseWithError:v19];
    goto LABEL_23;
  }
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F27DC0]);
    v10 = [(AMSUIWebAction *)self context];
    v11 = [v10 bag];
    uint64_t v12 = [v9 initWithSessionIdentifier:v7 accountType:v5 bundleIdentifier:v8 bag:v11];
  }
  else
  {
    objc_super v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v21)
    {
      objc_super v21 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      v43 = v24;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bundle identifier found. Will run session without identifier", buf, 0x16u);
    }
    id v25 = objc_alloc(MEMORY[0x263F27DC0]);
    v10 = [(AMSUIWebAction *)self context];
    v11 = [v10 bag];
    uint64_t v12 = [v25 initWithSessionIdentifier:v7 accountType:v5 bag:v11];
  }
  v26 = (void *)v12;

  v27 = [(AMSUIWebODIAssessmentAction *)self additionalAttributes];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x263F27DB8]);
    v29 = [(AMSUIWebODIAssessmentAction *)self additionalAttributes];
    v30 = (void *)[v28 initWithAttributes:v29];

    [v26 updateWithAttributes:v30];
  }
  v31 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v31)
  {
    v31 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v32 = [v31 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = objc_opt_class();
    v34 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v33;
    __int16 v42 = 2114;
    v43 = v34;
    _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running ODISession to get assessment.", buf, 0x16u);
  }
  v19 = [v26 getAssessment];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __40__AMSUIWebODIAssessmentAction_runAction__block_invoke;
  v37[3] = &unk_2643E5528;
  v37[4] = self;
  id v38 = v26;
  id v35 = v26;
  v20 = [v19 thenWithBlock:v37];

LABEL_23:
  return v20;
}

id __40__AMSUIWebODIAssessmentAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F27CB8];
  id v4 = a2;
  unint64_t v5 = [v3 sharedWebUIConfig];
  if (!v5)
  {
    unint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched assessment", buf, 0x16u);
  }
  id v9 = (void *)MEMORY[0x263F27E10];
  v10 = objc_msgSend(v4, "stringValue", @"assessment");

  v15[1] = @"cacheIdentifier";
  v16[0] = v10;
  v11 = [*(id *)(a1 + 40) cacheIdentifier];
  v16[1] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13 = [v9 promiseWithResult:v12];

  return v13;
}

- (unint64_t)accountTypeForString:(id)a3
{
  id v3 = a3;
  id v4 = [&unk_26CC73A60 objectForKeyedSubscript:v3];

  if (v4)
  {
    unint64_t v5 = [&unk_26CC73A60 objectForKeyedSubscript:v3];
    unint64_t v6 = [v5 integerValue];
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)sessionIdentifierForString:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F279B8];
  v10[0] = @"create";
  v10[1] = @"submit";
  uint64_t v4 = *MEMORY[0x263F279C0];
  v11[0] = v3;
  v11[1] = v4;
  v10[2] = @"idUpdate";
  v11[2] = *MEMORY[0x263F279C8];
  unint64_t v5 = NSDictionary;
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];
  v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (NSDictionary)additionalAttributes
{
  return self->_additionalAttributes;
}

- (void)setAdditionalAttributes:(id)a3
{
}

- (NSString)rawAccountType
{
  return self->_rawAccountType;
}

- (void)setRawAccountType:(id)a3
{
}

- (NSString)rawBundleIdentifer
{
  return self->_rawBundleIdentifer;
}

- (void)setRawBundleIdentifer:(id)a3
{
}

- (NSString)rawSessionIdentifer
{
  return self->_rawSessionIdentifer;
}

- (void)setRawSessionIdentifer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSessionIdentifer, 0);
  objc_storeStrong((id *)&self->_rawBundleIdentifer, 0);
  objc_storeStrong((id *)&self->_rawAccountType, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
}

@end