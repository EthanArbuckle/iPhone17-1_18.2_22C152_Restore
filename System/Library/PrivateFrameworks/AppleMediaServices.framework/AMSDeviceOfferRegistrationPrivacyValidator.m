@interface AMSDeviceOfferRegistrationPrivacyValidator
+ (BOOL)_isPrivacyAcknowledgementForIdentifier:(id)a3 satisfiedOnAccount:(id)a4;
+ (BOOL)_isPrivacyAcknowledgementForIdentifiers:(id)a3 satisfiedOnAccount:(id)a4;
+ (id)_identifiersForValidationOptions:(unint64_t)a3;
+ (id)_masterEligibilityPrivacyOptionsIdentifiers;
+ (id)_minimumAcknowledgementVersionForIdentifier:(id)a3;
+ (id)_privacyVersionMap;
- (ACAccount)account;
- (AMSDeviceOfferRegistrationPrivacyValidator)initWithAccount:(id)a3;
- (BOOL)canMasterDevicePerformRegistration;
- (BOOL)isPrivacyRequirementMetForOptions:(unint64_t)a3;
@end

@implementation AMSDeviceOfferRegistrationPrivacyValidator

- (AMSDeviceOfferRegistrationPrivacyValidator)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeviceOfferRegistrationPrivacyValidator;
  v6 = [(AMSDeviceOfferRegistrationPrivacyValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (BOOL)canMasterDevicePerformRegistration
{
  v3 = [(id)objc_opt_class() _masterEligibilityPrivacyOptionsIdentifiers];
  v4 = objc_opt_class();
  id v5 = [(AMSDeviceOfferRegistrationPrivacyValidator *)self account];
  LOBYTE(v4) = [v4 _isPrivacyAcknowledgementForIdentifiers:v3 satisfiedOnAccount:v5];

  return (char)v4;
}

- (BOOL)isPrivacyRequirementMetForOptions:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() _identifiersForValidationOptions:a3];
  id v5 = objc_opt_class();
  v6 = [(AMSDeviceOfferRegistrationPrivacyValidator *)self account];
  LOBYTE(v5) = [v5 _isPrivacyAcknowledgementForIdentifiers:v4 satisfiedOnAccount:v6];

  return (char)v5;
}

+ (id)_identifiersForValidationOptions:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    int v15 = 138543874;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    v18 = v7;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Identifier check value: %lu.", (uint8_t *)&v15, 0x20u);
  }
  if (a3)
  {
    v8 = objc_opt_new();
    if (a3)
    {
      v12 = +[AMSAcknowledgePrivacyTask _appleIDPrivacyIdentifier];
      [v8 addObject:v12];

      if ((a3 & 2) == 0)
      {
LABEL_8:
        if ((a3 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    else if ((a3 & 2) == 0)
    {
      goto LABEL_8;
    }
    v13 = +[AMSAcknowledgePrivacyTask _appleArcadePrivacyIdentifier];
    [v8 addObject:v13];

    if ((a3 & 4) == 0)
    {
LABEL_9:
      if ((a3 & 8) == 0)
      {
LABEL_11:
        v10 = (void *)[v8 copy];

        goto LABEL_13;
      }
LABEL_10:
      objc_super v9 = +[AMSAcknowledgePrivacyTask _appleTVAppPrivacyIdentifier];
      [v8 addObject:v9];

      goto LABEL_11;
    }
LABEL_18:
    v14 = +[AMSAcknowledgePrivacyTask _appleMusicAppPrivacyIdentifier];
    [v8 addObject:v14];

    if ((a3 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v10 = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
LABEL_13:
  return v10;
}

+ (BOOL)_isPrivacyAcknowledgementForIdentifier:(id)a3 satisfiedOnAccount:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _minimumAcknowledgementVersionForIdentifier:v6];
  if (v8)
  {
    BOOL v9 = +[AMSAcknowledgePrivacyTask hasPreviouslyAcknowledgedPrivacyIdentifier:v6 account:v7 minimumVersion:v8];
  }
  else
  {
    v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No version specified for GDPR identifier [%{public}@], returning false", (uint8_t *)&v15, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)_isPrivacyAcknowledgementForIdentifiers:(id)a3 satisfiedOnAccount:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (v6 && [v6 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__AMSDeviceOfferRegistrationPrivacyValidator__isPrivacyAcknowledgementForIdentifiers_satisfiedOnAccount___block_invoke;
    v14[3] = &unk_1E55A1FA8;
    uint64_t v16 = &v18;
    id v17 = a1;
    id v15 = v7;
    [v6 enumerateObjectsUsingBlock:v14];

    BOOL v8 = *((unsigned char *)v19 + 24) != 0;
  }
  else
  {
    BOOL v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      BOOL v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No required GDPR identifiers.", buf, 0x16u);
    }
    BOOL v8 = 1;
    *((unsigned char *)v19 + 24) = 1;
  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __105__AMSDeviceOfferRegistrationPrivacyValidator__isPrivacyAcknowledgementForIdentifiers_satisfiedOnAccount___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [*(id *)(a1 + 48) _isPrivacyAcknowledgementForIdentifier:v5 satisfiedOnAccount:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v6 + 24) = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  BOOL v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    BOOL v8 = +[AMSLogConfig sharedConfig];
  }
  BOOL v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v13 = 138544130;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = v12;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Identifier check %{public}@ : %i.", (uint8_t *)&v13, 0x26u);
  }
}

+ (id)_masterEligibilityPrivacyOptionsIdentifiers
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
}

+ (id)_minimumAcknowledgementVersionForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 _privacyVersionMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (id)_privacyVersionMap
{
  v2 = objc_opt_new();
  v3 = +[AMSAcknowledgePrivacyTask _appleIDPrivacyIdentifier];
  id v4 = +[AMSAcknowledgePrivacyTask _appleArcadePrivacyIdentifier];
  id v5 = +[AMSAcknowledgePrivacyTask _appleMusicAppPrivacyIdentifier];
  uint64_t v6 = +[AMSAcknowledgePrivacyTask _appleTVAppPrivacyIdentifier];
  [v2 setObject:&unk_1EDD011B0 forKeyedSubscript:v3];
  [v2 setObject:&unk_1EDD011B0 forKeyedSubscript:v4];
  [v2 setObject:&unk_1EDD011C8 forKeyedSubscript:v5];
  [v2 setObject:&unk_1EDD011E0 forKeyedSubscript:v6];
  char v7 = (void *)[v2 copy];

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end