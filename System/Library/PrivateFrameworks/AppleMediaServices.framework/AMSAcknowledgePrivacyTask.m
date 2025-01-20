@interface AMSAcknowledgePrivacyTask
+ (BOOL)_coreAcknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4;
+ (BOOL)_existingAcknowledgements:(id)a3 containsNewAcknowledgements:(id)a4;
+ (BOOL)_isBundleHolderPerDeviceRequirementAppliedToAccount:(id)a3;
+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3;
+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4;
+ (BOOL)hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements;
+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3;
+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4;
+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4 minimumVersion:(id)a5;
+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 minimumVersion:(id)a4;
+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3;
+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3 account:(id)a4;
+ (id)_accountStoreForPrivacyIdentifier:(id)a3;
+ (id)_appleArcadePrivacyIdentifier;
+ (id)_appleBundleHolderPrivacyIdentifier;
+ (id)_appleBundleOwnerPrivacyIdentifier;
+ (id)_appleIDPrivacyIdentifier;
+ (id)_appleMusicAppPrivacyIdentifier;
+ (id)_appleTVAppPrivacyIdentifier;
+ (id)_multiplexPrivacyIdentifier:(id)a3 contentVersion:(unint64_t)a4;
+ (id)_storePrivacyIdentifiers;
+ (id)_valueForPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4;
+ (unint64_t)_contentVersionForPrivacyIdentifier:(id)a3;
- (ACAccount)account;
- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3;
- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3 account:(id)a4;
- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3;
- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3 account:(id)a4;
- (NSSet)privacyIdentifiers;
- (id)_updatePrivacyWithAcknowledgementVersions:(id)a3;
- (id)acknowledgePrivacy;
- (id)rejectPrivacy;
- (void)setAccount:(id)a3;
- (void)setPrivacyIdentifiers:(id)a3;
@end

@implementation AMSAcknowledgePrivacyTask

+ (BOOL)_coreAcknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v9 = a4;
  id v10 = AMSSetLogKeyIfNeeded();
  v11 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v4 = AMSLogKey();
    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v4)
    {
      uint64_t v5 = AMSLogKey();
      [v13 stringWithFormat:@"%@: [%@] ", v15, v5];
    }
    else
    {
      [v13 stringWithFormat:@"%@: ", v14];
    v16 = };
    v17 = AMSHashIfNeeded(v9);
    *(_DWORD *)buf = 138543874;
    v74 = v16;
    __int16 v75 = 2114;
    v76 = v8;
    __int16 v77 = 2114;
    v78 = v17;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Determining if privacy acknowledgement is needed. privacyIdentifier = %{public}@ | account = %{public}@", buf, 0x20u);
    if (v4)
    {

      v16 = (void *)v5;
    }
  }
  if (+[AMSDefaults acknowledgePrivacyOverride] != 1)
  {
    if (+[AMSDefaults acknowledgePrivacyOverride] == 2)
    {
      v18 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v25 = [v18 OSLogObject];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      v26 = AMSLogKey();
      v27 = NSString;
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = v28;
      if (v26)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v27 stringWithFormat:@"%@: [%@] ", v29, a1];
      }
      else
      {
        [v27 stringWithFormat:@"%@: ", v28];
      v30 = };
      *(_DWORD *)buf = 138543362;
      v74 = v30;
      v42 = "%{public}@Privacy acknowledgement is not needed because AMSDefaults.acknowledgePrivacyOverride is DISABLED.";
LABEL_45:
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
      if (v26)
      {

        v30 = a1;
      }

LABEL_48:
      BOOL v41 = 0;
      goto LABEL_96;
    }
    if (+[AMSDefaults disablePrivacyAcknowledgement])
    {
      v18 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v25 = [v18 OSLogObject];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      v26 = AMSLogKey();
      v31 = NSString;
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = v32;
      if (v26)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v31 stringWithFormat:@"%@: [%@] ", v33, a1];
      }
      else
      {
        [v31 stringWithFormat:@"%@: ", v32];
      v30 = };
      *(_DWORD *)buf = 138543362;
      v74 = v30;
      v42 = "%{public}@Privacy acknowledgement is not needed because AMSDefaults.disablePrivacyAcknowledgement is true.";
      goto LABEL_45;
    }
    if (!v9)
    {
      v34 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = AMSLogKey();
        v37 = NSString;
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = v38;
        if (v36)
        {
          v4 = AMSLogKey();
          [v37 stringWithFormat:@"%@: [%@] ", v39, v4];
        }
        else
        {
          [v37 stringWithFormat:@"%@: ", v38];
        v40 = };
        *(_DWORD *)buf = 138543362;
        v74 = v40;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@No account provided, attempting to use the local account.", buf, 0xCu);
        if (v36)
        {

          v40 = v4;
        }
      }
      v43 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      objc_msgSend(v43, "_ams_localiTunesAccount");
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedPrivacyConfig];
        if (!v9)
        {
          id v9 = +[AMSLogConfig sharedConfig];
        }
        v18 = [v9 OSLogObject];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        v19 = AMSLogKey();
        v61 = NSString;
        uint64_t v62 = objc_opt_class();
        uint64_t v63 = v62;
        if (v19)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          [v61 stringWithFormat:@"%@: [%@] ", v63, a1];
        }
        else
        {
          [v61 stringWithFormat:@"%@: ", v62];
        v20 = };
        *(_DWORD *)buf = 138543362;
        v74 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@Privacy acknowledgement is needed because we failed to get an account.", buf, 0xCu);
        if (v19)
        {

          v20 = a1;
        }
        goto LABEL_38;
      }
    }
    v44 = objc_msgSend(v9, "ams_privacyAcknowledgement");
    v18 = [v44 objectForKeyedSubscript:v8];

    v45 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "_contentVersionForPrivacyIdentifier:", v8));
    if (!v18 || [v18 compare:v45] == -1)
    {
      [v9 reload];
      v46 = objc_msgSend(v9, "ams_privacyAcknowledgement");
      uint64_t v47 = [v46 objectForKeyedSubscript:v8];

      v18 = v47;
    }
    if ([v18 isEqualToNumber:&unk_1EDD00CB8])
    {
      v48 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v48)
      {
        v48 = +[AMSLogConfig sharedConfig];
      }
      v49 = [v48 OSLogObject];
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_94;
      }
      v50 = AMSLogKey();
      v51 = NSString;
      uint64_t v52 = objc_opt_class();
      uint64_t v53 = v52;
      if (v50)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v51 stringWithFormat:@"%@: [%@] ", v53, a1];
      }
      else
      {
        [v51 stringWithFormat:@"%@: ", v52];
      v54 = };
      *(_DWORD *)buf = 138543618;
      v74 = v54;
      __int16 v75 = 2114;
      v76 = v18;
      v69 = "%{public}@Privacy bundle was rejected. No need to prompt for acknowledgement. acknowledgedVersion = %{public}@";
    }
    else
    {
      if (![v45 isEqualToNumber:&unk_1EDD00CD0])
      {
        if (!v18 || [v18 compare:v45] == -1)
        {
          v48 = +[AMSLogConfig sharedPrivacyConfig];
          if (!v48)
          {
            v48 = +[AMSLogConfig sharedConfig];
          }
          v49 = [v48 OSLogObject];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v64 = AMSLogKey();
            v65 = NSString;
            uint64_t v66 = objc_opt_class();
            uint64_t v67 = v66;
            if (v64)
            {
              AMSLogKey();
              a1 = (id)objc_claimAutoreleasedReturnValue();
              [v65 stringWithFormat:@"%@: [%@] ", v67, a1];
            }
            else
            {
              [v65 stringWithFormat:@"%@: ", v66];
            v68 = };
            *(_DWORD *)buf = 138543874;
            v74 = v68;
            __int16 v75 = 2114;
            v76 = v18;
            __int16 v77 = 2114;
            v78 = v45;
            _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Privacy acknowledgement is needed. acknowledgedVersion = %{public}@ | currentVersion = %{public}@", buf, 0x20u);
            if (v64)
            {

              v68 = a1;
            }
          }
          BOOL v41 = 1;
          goto LABEL_95;
        }
        v48 = +[AMSLogConfig sharedPrivacyConfig];
        if (!v48)
        {
          v48 = +[AMSLogConfig sharedConfig];
        }
        v49 = [v48 OSLogObject];
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
LABEL_94:
          BOOL v41 = 0;
LABEL_95:

          goto LABEL_96;
        }
        v50 = AMSLogKey();
        v58 = NSString;
        uint64_t v59 = objc_opt_class();
        uint64_t v60 = v59;
        if (v50)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          [v58 stringWithFormat:@"%@: [%@] ", v60, a1];
        }
        else
        {
          [v58 stringWithFormat:@"%@: ", v59];
        v54 = };
        *(_DWORD *)buf = 138543874;
        v74 = v54;
        __int16 v75 = 2114;
        v76 = v18;
        __int16 v77 = 2114;
        v78 = v45;
        v69 = "%{public}@Privacy acknowledgement is not needed. acknowledgedVersion = %{public}@ | currentVersion = %{public}@";
        v70 = v49;
        uint32_t v71 = 32;
LABEL_91:
        _os_log_impl(&dword_18D554000, v70, OS_LOG_TYPE_DEFAULT, v69, buf, v71);
        if (v50)
        {

          v54 = a1;
        }

        goto LABEL_94;
      }
      v48 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v48)
      {
        v48 = +[AMSLogConfig sharedConfig];
      }
      v49 = [v48 OSLogObject];
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_94;
      }
      v50 = AMSLogKey();
      v55 = NSString;
      uint64_t v56 = objc_opt_class();
      uint64_t v57 = v56;
      if (v50)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v55 stringWithFormat:@"%@: [%@] ", v57, a1];
      }
      else
      {
        [v55 stringWithFormat:@"%@: ", v56];
      v54 = };
      *(_DWORD *)buf = 138543618;
      v74 = v54;
      __int16 v75 = 2114;
      v76 = v18;
      v69 = "%{public}@Current version is 0. No need to prompt for acknowledgement. acknowledgedVersion = %{public}@";
    }
    v70 = v49;
    uint32_t v71 = 22;
    goto LABEL_91;
  }
  v18 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v18)
  {
    v18 = +[AMSLogConfig sharedConfig];
  }
  v19 = [v18 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_39;
  }
  v20 = AMSLogKey();
  v21 = NSString;
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = v22;
  if (v20)
  {
    AMSLogKey();
    a1 = (id)objc_claimAutoreleasedReturnValue();
    [v21 stringWithFormat:@"%@: [%@] ", v23, a1];
  }
  else
  {
    [v21 stringWithFormat:@"%@: ", v22];
  v24 = };
  *(_DWORD *)buf = 138543362;
  v74 = v24;
  _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Privacy acknowledgement is needed because AMSDefaults.acknowledgePrivacyOverride is ALWAYS.", buf, 0xCu);
  if (v20)
  {

    v24 = a1;
  }

LABEL_38:
LABEL_39:

LABEL_40:
  BOOL v41 = 1;
LABEL_96:

  return v41;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F179C8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "ams_sharedAccountStore");
  v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
  v8 = [(AMSAcknowledgePrivacyTask *)self initWithPrivacyIdentifier:v5 account:v7];

  return v8;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3 account:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  v8 = (void *)[a3 copy];
  id v9 = [v6 setWithObject:v8];
  id v10 = [(AMSAcknowledgePrivacyTask *)self initWithPrivacyIdentifiers:v9 account:v7];

  return v10;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAcknowledgePrivacyTask;
  v8 = [(AMSTask *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    privacyIdentifiers = v8->_privacyIdentifiers;
    v8->_privacyIdentifiers = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_account, a4);
  }

  return v8;
}

- (id)acknowledgePrivacy
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [(AMSAcknowledgePrivacyTask *)self privacyIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v10 = +[AMSAcknowledgePrivacyTask _contentVersionForPrivacyIdentifier:v9];
        if (!v10)
        {
          v16 = +[AMSLogConfig sharedPrivacyConfig];
          if (!v16)
          {
            v16 = +[AMSLogConfig sharedConfig];
          }
          v17 = [v16 OSLogObject];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = AMSLogKey();
            v19 = NSString;
            uint64_t v20 = objc_opt_class();
            uint64_t v21 = v20;
            if (v18)
            {
              AMSLogKey();
              self = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
              [v19 stringWithFormat:@"%@: [%@] ", v21, self];
            }
            else
            {
              [v19 stringWithFormat:@"%@: ", v20];
            uint64_t v22 = };
            *(_DWORD *)buf = 138543618;
            v31 = v22;
            __int16 v32 = 2114;
            uint64_t v33 = v9;
            _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@The privacy identifier has an invalid content version. Refusing to acknowledge it. privacyIdentifier = %{public}@", buf, 0x16u);
            if (v18)
            {

              uint64_t v22 = self;
            }
          }
          uint64_t v23 = AMSError(2, @"AMSAcknowledgePrivacyTask Failed", @"The OnBoardingKit content version for the identifier is invalid.", 0);
          objc_super v12 = +[AMSBinaryPromise promiseWithError:v23];

          goto LABEL_21;
        }
        v11 = +[AMSAcknowledgePrivacyTask _multiplexPrivacyIdentifier:v9 contentVersion:v10];
        [v3 addEntriesFromDictionary:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_super v12 = [(AMSAcknowledgePrivacyTask *)self _updatePrivacyWithAcknowledgementVersions:v3];
  v13 = [(AMSAcknowledgePrivacyTask *)self privacyIdentifiers];
  uint64_t v14 = [(id)objc_opt_class() _appleBundleHolderPrivacyIdentifier];
  int v15 = [v13 containsObject:v14];

  if (v15)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__AMSAcknowledgePrivacyTask_acknowledgePrivacy__block_invoke;
    v25[3] = &unk_1E559EA90;
    v25[4] = self;
    [v12 addSuccessBlock:v25];
  }
LABEL_21:

  return v12;
}

+ (unint64_t)_contentVersionForPrivacyIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _appleBundleHolderPrivacyIdentifier];
  if ([v4 isEqualToString:v5])
  {

LABEL_4:
    unint64_t v8 = 2;
    goto LABEL_10;
  }
  uint64_t v6 = [a1 _appleBundleOwnerPrivacyIdentifier];
  char v7 = [v4 isEqualToString:v6];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2050000000;
  uint64_t v9 = (void *)_MergedGlobals_3_0;
  uint64_t v24 = _MergedGlobals_3_0;
  if (!_MergedGlobals_3_0)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getOBBundleClass_block_invoke;
    v19 = &unk_1E559EC70;
    uint64_t v20 = &v21;
    __getOBBundleClass_block_invoke((uint64_t)&v16);
    uint64_t v9 = (void *)v22[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v21, 8);
  v11 = [v10 bundleWithIdentifier:v4];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2050000000;
  objc_super v12 = (void *)qword_1EB38D380;
  uint64_t v24 = qword_1EB38D380;
  if (!qword_1EB38D380)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getOBPrivacyFlowClass_block_invoke;
    v19 = &unk_1E559EC70;
    uint64_t v20 = &v21;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v16);
    objc_super v12 = (void *)v22[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v21, 8);
  uint64_t v14 = [v13 flowWithBundle:v11];
  unint64_t v8 = [v14 contentVersion];

LABEL_10:
  return v8;
}

+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _accountStoreForPrivacyIdentifier:v4];
  uint64_t v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
  LOBYTE(a1) = [a1 acknowledgementNeededForPrivacyIdentifier:v4 account:v6];

  return (char)a1;
}

+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [a1 _coreAcknowledgementNeededForPrivacyIdentifier:v7 account:v6];
  uint64_t v9 = [(id)objc_opt_class() _appleBundleHolderPrivacyIdentifier];
  int v10 = [v7 isEqualToString:v9];

  char v11 = v10 | v8;
  if (v10 && (v8 & 1) == 0) {
    char v11 = [a1 _isBundleHolderPerDeviceRequirementAppliedToAccount:v6];
  }

  return v11;
}

+ (id)_appleBundleHolderPrivacyIdentifier
{
  return @"com.apple.onboarding.deviceholder";
}

+ (id)_accountStoreForPrivacyIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore", a3);
}

+ (id)_appleBundleOwnerPrivacyIdentifier
{
  return @"com.apple.onboarding.subscriptionbundle";
}

- (NSSet)privacyIdentifiers
{
  return self->_privacyIdentifiers;
}

- (id)_updatePrivacyWithAcknowledgementVersions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AMSLogKey();
  if (!v5)
  {
    uint64_t v5 = AMSSetLogKey(0);
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__AMSAcknowledgePrivacyTask__updatePrivacyWithAcknowledgementVersions___block_invoke;
  v10[3] = &unk_1E559EC48;
  objc_copyWeak(&v14, &location);
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  id v13 = self;
  char v8 = [(AMSTask *)self performBinaryTaskWithBlock:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

+ (id)_multiplexPrivacyIdentifier:(id)a3 contentVersion:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _storePrivacyIdentifiers];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v10 = objc_msgSend(a1, "_storePrivacyIdentifiers", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
          [v9 setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [v9 copy];
  }
  else
  {
    id v24 = v6;
    id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    id v25 = v9;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }
  v18 = (void *)v17;

  return v18;
}

+ (id)_storePrivacyIdentifiers
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EDD01918];
  return v2;
}

uint64_t __71__AMSAcknowledgePrivacyTask__updatePrivacyWithAcknowledgementVersions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = AMSSetLogKey(*(void **)(a1 + 32));
  id v6 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    int v10 = [WeakRetained privacyIdentifiers];
    *(_DWORD *)buf = 138543874;
    uint64_t v60 = v8;
    __int16 v61 = 2114;
    uint64_t v62 = v9;
    __int16 v63 = 2114;
    uint64_t v64 = (uint64_t)v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSAcknowledgePrivacyTask. privacyIdentifiers = %{public}@", buf, 0x20u);
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v12 = objc_msgSend(v11, "_ams_localiTunesAccount");
  if ((objc_msgSend(v12, "ams_mergePrivacyAcknowledgement:", *(void *)(a1 + 40)) & 2) != 0)
  {
    id v14 = objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v12, 0);
    uint64_t v13 = [v14 resultWithError:a2];
  }
  else
  {
    uint64_t v13 = 1;
  }
  uint64_t v15 = [*(id *)(a1 + 48) account];
  if (v15)
  {
    uint64_t v56 = a2;
    uint64_t v57 = v12;
    id v16 = WeakRetained;
    uint64_t v17 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = v13;
    v19 = [v17 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      long long v21 = AMSLogKey();
      long long v22 = [v15 hashedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v60 = v20;
      __int16 v61 = 2114;
      uint64_t v62 = v21;
      __int16 v63 = 2114;
      uint64_t v64 = (uint64_t)v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have an account. Merging the privacy acknowledgement into it. account = %{public}@", buf, 0x20u);
    }
    uint64_t v23 = objc_msgSend(v15, "ams_mergePrivacyAcknowledgement:", *(void *)(a1 + 40));
    id v24 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    id v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v60 = v26;
      __int16 v61 = 2114;
      uint64_t v62 = v27;
      __int16 v63 = 2048;
      uint64_t v64 = v23;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Merge result = %ld", buf, 0x20u);
    }
    if ((v23 & 2) == 0)
    {
      uint64_t v13 = v18;
      id WeakRetained = v16;
      uint64_t v12 = v57;
      goto LABEL_39;
    }
    long long v28 = objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v15, 0);
    id v58 = 0;
    int v29 = [v28 resultWithError:&v58];
    id v30 = v58;
    uint64_t v13 = v18 & v29;

    if (v30)
    {
      uint64_t v31 = [v30 code];
      uint64_t v32 = +[AMSLogConfig sharedPrivacyConfig];
      uint64_t v33 = (void *)v32;
      id WeakRetained = v16;
      if (v31 == 102)
      {
        unsigned int v55 = v13;
        if (!v32)
        {
          uint64_t v33 = +[AMSLogConfig sharedConfig];
        }
        v34 = [v33 OSLogObject];
        uint64_t v12 = v57;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = objc_opt_class();
          uint64_t v35 = AMSLogKey();
          v36 = [v15 hashedDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v60 = v54;
          __int16 v61 = 2114;
          uint64_t v62 = v35;
          __int16 v63 = 2114;
          uint64_t v64 = (uint64_t)v36;
          _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Account not dirty. Checking the privacy acknowledgements match. account = %{public}@", buf, 0x20u);
        }
        [v15 reload];
        v37 = objc_msgSend(v15, "ams_privacyAcknowledgement");
        BOOL v38 = +[AMSAcknowledgePrivacyTask _existingAcknowledgements:v37 containsNewAcknowledgements:*(void *)(a1 + 40)];

        uint64_t v39 = +[AMSLogConfig sharedPrivacyConfig];
        v40 = (void *)v39;
        if (v38)
        {
          if (!v39)
          {
            v40 = +[AMSLogConfig sharedConfig];
          }
          BOOL v41 = [v40 OSLogObject];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = objc_opt_class();
            v43 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v60 = v42;
            __int16 v61 = 2114;
            uint64_t v62 = v43;
            _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Acknowledgements match. Returning success.", buf, 0x16u);
          }
          uint64_t v13 = 1;
        }
        else
        {
          if (!v39)
          {
            v40 = +[AMSLogConfig sharedConfig];
          }
          v50 = [v40 OSLogObject];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v51 = objc_opt_class();
            uint64_t v52 = AMSLogKey();
            uint64_t v53 = [v30 description];
            *(_DWORD *)buf = 138543874;
            uint64_t v60 = v51;
            __int16 v61 = 2114;
            uint64_t v62 = v52;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v53;
            _os_log_impl(&dword_18D554000, v50, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Acknowledgements do NOT match. %@", buf, 0x20u);
          }
          *uint64_t v56 = v30;
          uint64_t v13 = v55;
        }
        goto LABEL_38;
      }
      if (!v32)
      {
        uint64_t v33 = +[AMSLogConfig sharedConfig];
      }
      v44 = [v33 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = objc_opt_class();
        v46 = AMSLogKey();
        [v30 description];
        v48 = uint64_t v47 = v13;
        *(_DWORD *)buf = 138543874;
        uint64_t v60 = v45;
        __int16 v61 = 2114;
        uint64_t v62 = v46;
        __int16 v63 = 2112;
        uint64_t v64 = (uint64_t)v48;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Save account error. %@", buf, 0x20u);

        uint64_t v13 = v47;
        id WeakRetained = v16;
      }
      *uint64_t v56 = v30;
    }
    else
    {
      id WeakRetained = v16;
    }
    uint64_t v12 = v57;
LABEL_38:
  }
LABEL_39:

  return v13;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifiers, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F179C8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "ams_sharedAccountStore");
  id v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
  uint64_t v8 = [(AMSAcknowledgePrivacyTask *)self initWithPrivacyIdentifiers:v5 account:v7];

  return v8;
}

void __47__AMSAcknowledgePrivacyTask_acknowledgePrivacy__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = AMSLogKey();
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      uint64_t v1 = AMSLogKey();
      [v6 stringWithFormat:@"%@: [%@] ", v8, v1];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    id v9 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v9;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating account bundle holder record.@", buf, 0xCu);
    if (v5)
    {

      id v9 = (void *)v1;
    }
  }
  int v10 = [*(id *)(a1 + 32) account];
  if (!v10)
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [(id)objc_opt_class() _appleBundleHolderPrivacyIdentifier];
    uint64_t v13 = [v11 _accountStoreForPrivacyIdentifier:v12];

    int v10 = objc_msgSend(v13, "_ams_localiTunesAccount");
  }
  objc_msgSend(v10, "ams_setDidAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice:", 1);
}

- (id)rejectPrivacy
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(AMSAcknowledgePrivacyTask *)self privacyIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (!+[AMSAcknowledgePrivacyTask _contentVersionForPrivacyIdentifier:v9])
        {
          uint64_t v12 = +[AMSLogConfig sharedPrivacyConfig];
          if (!v12)
          {
            uint64_t v12 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v13 = [v12 OSLogObject];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = AMSLogKey();
            uint64_t v15 = NSString;
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = v16;
            if (v14)
            {
              AMSLogKey();
              self = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
              [v15 stringWithFormat:@"%@: [%@] ", v17, self];
            }
            else
            {
              [v15 stringWithFormat:@"%@: ", v16];
            uint64_t v18 = };
            *(_DWORD *)buf = 138543618;
            uint64_t v27 = v18;
            __int16 v28 = 2114;
            uint64_t v29 = v9;
            _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@The privacy identifier has an invalid content version. Refusing to reject it. privacyIdentifier = %{public}@", buf, 0x16u);
            if (v14)
            {

              uint64_t v18 = self;
            }
          }
          v19 = AMSError(2, @"AMSAcknowledgePrivacyTask Failed to reject", @"The OnBoardingKit content version for the identifier is invalid.", 0);
          uint64_t v11 = +[AMSBinaryPromise promiseWithError:v19];

          goto LABEL_20;
        }
        int v10 = +[AMSAcknowledgePrivacyTask _multiplexPrivacyIdentifier:v9 contentVersion:0];
        [v3 addEntriesFromDictionary:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v4 = [(AMSAcknowledgePrivacyTask *)self _updatePrivacyWithAcknowledgementVersions:v3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__AMSAcknowledgePrivacyTask_rejectPrivacy__block_invoke;
  v21[3] = &unk_1E559EBF8;
  v21[4] = self;
  uint64_t v11 = [v4 thenWithBlock:v21];
LABEL_20:

  return v11;
}

id __42__AMSAcknowledgePrivacyTask_rejectPrivacy__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "privacyIdentifiers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = [*(id *)(a1 + 32) account];
        LODWORD(v7) = [v8 hasRejectedPrivacyIdentifier:v7 account:v9];

        if (!v7)
        {
          uint64_t v11 = AMSError(0, @"Failed to Reject Privacy", @"An unknown error occurred.", 0);
          int v10 = +[AMSBinaryPromise promiseWithError:v11];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  int v10 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_11:
  return v10;
}

+ (BOOL)_isBundleHolderPerDeviceRequirementAppliedToAccount:(id)a3
{
  id v3 = a3;
  if (+[AMSDevice deviceIsBundle]) {
    char v4 = objc_msgSend(v3, "ams_isSubjectToPerDeviceBundleHolderAcknowledgement");
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  uint64_t v6 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    int v17 = 138543874;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determining if user has rejected privacy acknowledgement. privacyIdentifier = %{public}@", (uint8_t *)&v17, 0x20u);
  }
  int v10 = [a1 _accountStoreForPrivacyIdentifier:v4];
  uint64_t v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    objc_msgSend(v10, "_ams_localiTunesAccount");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v14 = v13;

  char v15 = [(id)objc_opt_class() hasRejectedPrivacyIdentifier:v4 account:v14];
  return v15;
}

+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3 account:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AMSSetLogKeyIfNeeded();
  uint64_t v9 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  int v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    int v29 = 138543874;
    uint64_t v30 = v11;
    __int16 v31 = 2114;
    uint64_t v32 = v12;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determining if user has rejected privacy acknowledgement. privacyIdentifier = %{public}@", (uint8_t *)&v29, 0x20u);
  }
  if (!v7)
  {
    id v13 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    long long v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      long long v16 = AMSLogKey();
      int v29 = 138543874;
      uint64_t v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No account provided, attempting to use the local account. privacyIdentifier = %{public}@", (uint8_t *)&v29, 0x20u);
    }
    int v17 = [a1 _accountStoreForPrivacyIdentifier:v6];
    objc_msgSend(v17, "_ams_localiTunesAccount");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v7)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      __int16 v19 = [v7 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = AMSLogKey();
        int v29 = 138543618;
        uint64_t v30 = v26;
        __int16 v31 = 2114;
        uint64_t v32 = v27;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] We failed to get an account, so do not have record of user rejecting privacy acknowledgement.", (uint8_t *)&v29, 0x16u);
      }
      goto LABEL_21;
    }
  }
  uint64_t v18 = objc_msgSend(v7, "ams_privacyAcknowledgement");
  __int16 v19 = [v18 objectForKeyedSubscript:v6];

  uint64_t v20 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v20)
  {
    uint64_t v20 = +[AMSLogConfig sharedConfig];
  }
  __int16 v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = AMSLogKey();
    long long v24 = AMSHashIfNeeded(v7);
    int v29 = 138544130;
    uint64_t v30 = v22;
    __int16 v31 = 2114;
    uint64_t v32 = v23;
    __int16 v33 = 2114;
    id v34 = v24;
    __int16 v35 = 2114;
    v36 = v19;
    _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] account = %{public}@ | acknowledgedVersion = %{public}@", (uint8_t *)&v29, 0x2Au);
  }
  if (!v19)
  {
LABEL_21:
    char v25 = 0;
    goto LABEL_22;
  }
  char v25 = [v19 isEqualToNumber:&unk_1EDD00CB8];
LABEL_22:

  return v25;
}

+ (BOOL)hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements
{
  v32[2] = *MEMORY[0x1E4F143B8];
  if (+[AMSDefaults disablePrivacyAcknowledgement])
  {
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
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v5;
      __int16 v28 = 2114;
      int v29 = v6;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous bundle acknowledgements will not be fetched because AMSDefaults.disablePrivacyAcknowledgement is true.", buf, 0x16u);
    }
    LOBYTE(v7) = 0;
  }
  else
  {
    id v8 = [a1 _appleBundleOwnerPrivacyIdentifier];
    id v3 = [a1 _accountStoreForPrivacyIdentifier:v8];

    id v4 = objc_msgSend(v3, "ams_localiTunesAccount");
    if (v4)
    {
      uint64_t v9 = [a1 _appleBundleOwnerPrivacyIdentifier];
      v32[0] = v9;
      int v10 = [a1 _appleBundleHolderPrivacyIdentifier];
      v32[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __86__AMSAcknowledgePrivacyTask_hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements__block_invoke;
      uint64_t v23 = &unk_1E559EC20;
      id v25 = a1;
      long long v24 = v4;
      int v7 = objc_msgSend(v11, "ams_anyWithTest:", &v20);
      uint64_t v12 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      id v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        int v29 = v15;
        __int16 v30 = 1024;
        int v31 = v7;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Has previously acknowledged = %d.", buf, 0x1Cu);
      }
      long long v16 = v24;
    }
    else
    {
      uint64_t v11 = +[AMSLogConfig sharedPrivacyConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      long long v16 = [v11 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        int v29 = v18;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No local account!", buf, 0x16u);
      }
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

uint64_t __86__AMSAcknowledgePrivacyTask_hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) hasPreviouslyAcknowledgedPrivacyIdentifier:a2 account:*(void *)(a1 + 32)];
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  if (+[AMSDefaults disablePrivacyAcknowledgement])
  {
    id v6 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    int v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous acknowledgement will not be fetched because AMSDefaults.disablePrivacyAcknowledgement is true.", (uint8_t *)&v14, 0x16u);
    }
    char v10 = 0;
  }
  else
  {
    uint64_t v11 = [a1 _accountStoreForPrivacyIdentifier:v4];
    uint64_t v12 = objc_msgSend(v11, "ams_activeiTunesAccount");
    char v10 = [a1 hasPreviouslyAcknowledgedPrivacyIdentifier:v4 account:v12];
  }
  return v10;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = AMSSetLogKeyIfNeeded();
  uint64_t v9 = [a1 _valueForPreviouslyAcknowledgedPrivacyIdentifier:v7 account:v6];

  uint64_t v10 = +[AMSLogConfig sharedPrivacyConfig];
  uint64_t v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSLogKey();
      int v20 = 138543874;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      id v25 = v9;
      uint64_t v15 = "%{public}@: [%{public}@] Previous Privacy acknowledgement found. acknowledgedVersion = %{public}@";
      __int16 v16 = v12;
      uint32_t v17 = 32;
LABEL_10:
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
  }
  else
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      int v14 = AMSLogKey();
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      uint64_t v15 = "%{public}@: [%{public}@] No Previous Privacy acknowledgement found.";
      __int16 v16 = v12;
      uint32_t v17 = 22;
      goto LABEL_10;
    }
  }

  return v9 != 0;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 minimumVersion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _accountStoreForPrivacyIdentifier:v7];
  uint64_t v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
  LOBYTE(a1) = [a1 hasPreviouslyAcknowledgedPrivacyIdentifier:v7 account:v9 minimumVersion:v6];

  return (char)a1;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4 minimumVersion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    int v14 = AMSLogKey();
    int v27 = 138544386;
    uint64_t v28 = v13;
    __int16 v29 = 2114;
    __int16 v30 = v14;
    __int16 v31 = 2114;
    id v32 = v8;
    __int16 v33 = 2114;
    id v34 = v9;
    __int16 v35 = 2114;
    id v36 = v10;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking identifier %{public}@ on account: %{public}@ minimumVersion = %{public}@", (uint8_t *)&v27, 0x34u);
  }
  uint64_t v15 = [a1 _valueForPreviouslyAcknowledgedPrivacyIdentifier:v8 account:v9];
  uint64_t v16 = +[AMSLogConfig sharedPrivacyConfig];
  uint32_t v17 = (void *)v16;
  if (v15)
  {
    if (!v16)
    {
      uint32_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      int v20 = AMSLogKey();
      int v27 = 138543874;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      __int16 v30 = v20;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous Privacy acknowledgement found. acknowledgedVersion = %{public}@", (uint8_t *)&v27, 0x20u);
    }
    unint64_t v21 = [v15 unsignedIntegerValue];
    BOOL v22 = v21 >= [v10 unsignedIntegerValue];
  }
  else
  {
    if (!v16)
    {
      uint32_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v17 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = AMSLogKey();
      int v27 = 138543618;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      __int16 v30 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No Previous Privacy acknowledgement found.", (uint8_t *)&v27, 0x16u);
    }
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)_valueForPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AMSSetLogKeyIfNeeded();
  if (v7) {
    goto LABEL_7;
  }
  id v9 = +[AMSLogConfig sharedPrivacyConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    int v19 = 138543874;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    BOOL v22 = v12;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No account provided, attempting to use the local account. privacyIdentifier = %{public}@", (uint8_t *)&v19, 0x20u);
  }
  uint64_t v13 = [a1 _accountStoreForPrivacyIdentifier:v6];
  objc_msgSend(v13, "_ams_localiTunesAccount");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_7:
    int v14 = objc_msgSend(v7, "ams_privacyAcknowledgement");
    uint64_t v15 = [v14 objectForKeyedSubscript:v6];
  }
  else
  {
    id v7 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v7 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = AMSLogKey();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      BOOL v22 = v18;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No Previous acknowledgement because we failed to get an account.", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

+ (BOOL)_existingAcknowledgements:(id)a3 containsNewAcknowledgements:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];
        int v14 = [v6 objectForKeyedSubscript:v12];
        uint64_t v15 = v14;
        if (!v13 || [v14 compare:v13] == 1)
        {

          BOOL v16 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v16 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_13:

  return v16;
}

+ (id)_appleArcadePrivacyIdentifier
{
  return @"com.apple.onboarding.applearcade";
}

+ (id)_appleIDPrivacyIdentifier
{
  return @"com.apple.onboarding.appleid";
}

+ (id)_appleMusicAppPrivacyIdentifier
{
  return @"com.apple.onboarding.applemusic";
}

+ (id)_appleTVAppPrivacyIdentifier
{
  return @"com.apple.onboarding.tvapp";
}

- (void)setPrivacyIdentifiers:(id)a3
{
}

@end