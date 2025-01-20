@interface AMSPushParsableFollowUp
+ (BOOL)_shouldAllowFollowUp:(id)a3 bag:(id)a4;
+ (BOOL)_shouldClearFollowUpFromPayload:(id)a3;
+ (BOOL)isDeviceOfferNotification:(id)a3;
+ (BOOL)shouldSkipAccountCheck;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_createFollowUpItemFromNotification:(id)a3;
+ (id)_createFollowUpItemFromPayload:(id)a3;
+ (id)_createNotificationFromFollowUpItem:(id)a3;
+ (id)_dateFromString:(id)a3;
+ (id)createBagForSubProfile;
+ (void)_performClearWithPayload:(id)a3;
+ (void)_performPostWithPayload:(id)a3 bag:(id)a4;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
+ (void)removeDeviceOfferWithPayload:(id)a3 logKey:(id)a4 bag:(id)a5;
+ (void)userNotification:(id)a3 selectedButtonAction:(id)a4 bag:(id)a5;
@end

@implementation AMSPushParsableFollowUp

+ (void)removeDeviceOfferWithPayload:(id)a3 logKey:(id)a4 bag:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 clientIdentifier];
  v11 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v33 = 138543874;
    *(void *)&v33[4] = objc_opt_class();
    *(_WORD *)&v33[12] = 2114;
    *(void *)&v33[14] = v8;
    *(_WORD *)&v33[22] = 2114;
    v34 = v10;
    id v13 = *(id *)&v33[4];
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to clear device offer with notification for client identifier: %{public}@", v33, 0x20u);
  }
  if ([(__CFString *)v10 isEqualToString:AMSDeviceOfferFollowUpIdentifierAppleMusic])
  {
    v14 = &AMSDeviceOfferIdentifierAppleMusic;
LABEL_9:
    v15 = *v14;
    goto LABEL_15;
  }
  if ([(__CFString *)v10 isEqualToString:AMSDeviceOfferFollowUpIdentifieriCloud])
  {
    v14 = &AMSDeviceOfferIdentifieriCloud;
    goto LABEL_9;
  }
  v16 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v16)
  {
    v16 = +[AMSLogConfig sharedConfig];
  }
  v17 = objc_msgSend(v16, "OSLogObject", *(_OWORD *)v33, *(void *)&v33[16], v34);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    *(_DWORD *)v33 = 138543874;
    *(void *)&v33[4] = v18;
    *(_WORD *)&v33[12] = 2114;
    *(void *)&v33[14] = v8;
    *(_WORD *)&v33[22] = 2114;
    v34 = v10;
    id v19 = v18;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to recognize client identifier: %{public}@", v33, 0x20u);
  }
  v15 = 0;
LABEL_15:
  v20 = objc_msgSend(v7, "account", *(void *)v33, *(_OWORD *)&v33[8]);
  if (v20)
  {
    if (v9 && v15)
    {
      v21 = +[AMSLogConfig sharedFollowUpConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        *(_DWORD *)v33 = 138543874;
        *(void *)&v33[4] = v23;
        *(_WORD *)&v33[12] = 2114;
        *(void *)&v33[14] = v8;
        *(_WORD *)&v33[22] = 2114;
        v34 = v15;
        id v24 = v23;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to clear device offer with notification for identifier: %{public}@", v33, 0x20u);
      }
      +[AMSDevice removeDeviceOfferWithIdentifier:v15 account:v20 bag:v9 logKey:v8];
      goto LABEL_33;
    }
  }
  else
  {
    v25 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v25)
    {
      v25 = +[AMSLogConfig sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      *(_DWORD *)v33 = 138543618;
      *(void *)&v33[4] = v27;
      *(_WORD *)&v33[12] = 2114;
      *(void *)&v33[14] = v8;
      id v28 = v27;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clear device offer with notification failed for no account", v33, 0x16u);
    }
  }
  v29 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v29)
  {
    v29 = +[AMSLogConfig sharedConfig];
  }
  v30 = [v29 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_opt_class();
    *(_DWORD *)v33 = 138543618;
    *(void *)&v33[4] = v31;
    *(_WORD *)&v33[12] = 2114;
    *(void *)&v33[14] = v8;
    id v32 = v31;
    _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to clear device offer with notification", v33, 0x16u);
  }
LABEL_33:
}

+ (BOOL)isDeviceOfferNotification:(id)a3
{
  v3 = [a3 clientIdentifier];
  if ([v3 isEqualToString:AMSDeviceOfferFollowUpIdentifierAppleMusic]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:AMSDeviceOfferFollowUpIdentifieriCloud];
  }

  return v4;
}

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v7 = a5;
  if ([a1 _shouldAllowFollowUp:v8 bag:v7])
  {
    if ([a1 _shouldClearFollowUpFromPayload:v8])
    {
      if ([a1 isDeviceOfferNotification:v8]) {
        [a1 removeDeviceOfferWithPayload:v8 logKey:0 bag:v7];
      }
      else {
        [a1 _performClearWithPayload:v8];
      }
    }
    else
    {
      [a1 _performPostWithPayload:v8 bag:v7];
    }
  }
}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (void)userNotification:(id)a3 selectedButtonAction:(id)a4 bag:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    id v14 = v13;
    v15 = [v8 logKey];
    *(_DWORD *)buf = 138543618;
    v30 = v13;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling follow up response.", buf, 0x16u);
  }
  v16 = [a1 _createFollowUpItemFromNotification:v8];
  if (v16)
  {
    v17 = [v9 identifier];
    v18 = [v16 actions];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke;
    v27[3] = &unk_1E55A60A0;
    id v28 = v17;
    id v19 = v17;
    v20 = objc_msgSend(v18, "ams_firstObjectPassingTest:", v27);

    v21 = [v16 account];
    v22 = [v20 performActionsWithBag:v10 account:v21];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke_2;
    v24[3] = &unk_1E55A4918;
    id v26 = a1;
    id v25 = v8;
    [v22 addErrorBlock:v24];
    v23 = [v20 postMetricsWithBag:v10];
    [v23 waitUntilFinished];
    [v22 waitUntilFinished];
  }
}

uint64_t __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __69__AMSPushParsableFollowUp_userNotification_selectedButtonAction_bag___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 logKey];
    id v10 = AMSLogableError(v3);
    int v11 = 138543874;
    v12 = v6;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform follow up action. Error: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_140 != -1) {
    dispatch_once(&_MergedGlobals_140, &__block_literal_global_111);
  }
  v2 = (void *)qword_1EB38DF38;
  return (NSString *)v2;
}

void __40__AMSPushParsableFollowUp_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38DF38;
  qword_1EB38DF38 = @"AMSFollowUp";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DF40 != -1) {
    dispatch_once(&qword_1EB38DF40, &__block_literal_global_53_0);
  }
  v2 = (void *)qword_1EB38DF48;
  return (NSString *)v2;
}

void __47__AMSPushParsableFollowUp_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38DF48;
  qword_1EB38DF48 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  uint64_t v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (void)_performClearWithPayload:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v29 = objc_alloc_init(AMSFollowUp);
  uint64_t v4 = [v3 clientIdentifier];
  v5 = [v3 aps];
  v6 = [v5 objectForKeyedSubscript:@"deviceGroup"];

  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v3 account];
  }
  id v8 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    v12 = [v3 logKey];
    *(_DWORD *)buf = 138543874;
    id v32 = v10;
    __int16 v33 = 2114;
    v34 = v12;
    __int16 v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing follow up with identifier: %{public}@", buf, 0x20u);
  }
  __int16 v13 = [(AMSFollowUp *)v29 clearFollowUpWithIdentifier:v4 account:v7];
  id v30 = 0;
  char v14 = [v13 resultWithError:&v30];
  id v15 = v30;
  uint64_t v16 = +[AMSLogConfig sharedFollowUpConfig];
  uint64_t v17 = (void *)v16;
  if (v14)
  {
    if (!v16)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      v27 = v7;
      id v20 = v19;
      v21 = [v3 logKey];
      *(_DWORD *)buf = 138543618;
      id v32 = v19;
      __int16 v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully cleared follow up!", buf, 0x16u);

      id v7 = v27;
    }
  }
  else
  {
    if (!v16)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      id v26 = v22;
      v23 = [v3 logKey];
      AMSLogableError(v15);
      id v28 = v4;
      v25 = id v24 = v7;
      *(_DWORD *)buf = 138543874;
      id v32 = v22;
      __int16 v33 = 2114;
      v34 = v23;
      __int16 v35 = 2114;
      v36 = v25;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear follow up. Error = %{public}@", buf, 0x20u);

      id v7 = v24;
      uint64_t v4 = v28;
    }
  }
}

+ (void)_performPostWithPayload:(id)a3 bag:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v5 logKey];
    id v11 = [v5 clientIdentifier];
    *(_DWORD *)buf = 138543874;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting follow up with identifier: %{public}@", buf, 0x20u);
  }
  v12 = objc_alloc_init(AMSFollowUp);
  __int16 v13 = [a1 _createFollowUpItemFromPayload:v5];
  char v14 = [(AMSFollowUp *)v12 postFollowUpItem:v13];
  id v28 = 0;
  id v15 = [v14 resultWithError:&v28];
  id v16 = v28;
  uint64_t v17 = [v15 integerValue];

  uint64_t v18 = +[AMSLogConfig sharedFollowUpConfig];
  id v19 = (void *)v18;
  if (v16)
  {
    if (!v18)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      id v26 = v21;
      v22 = [v5 logKey];
      v23 = AMSLogableError(v16);
      *(_DWORD *)buf = 138543874;
      id v30 = v21;
      __int16 v31 = 2114;
      id v32 = v22;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post follow up. Error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (!v18)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = objc_opt_class();
      id v27 = v24;
      id v25 = [v5 logKey];
      *(_DWORD *)buf = 138543874;
      id v30 = v24;
      __int16 v31 = 2114;
      id v32 = v25;
      __int16 v33 = 2048;
      uint64_t v34 = v17;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully posted follow up! Result = %ld", buf, 0x20u);
    }
  }
}

+ (BOOL)_shouldAllowFollowUp:(id)a3 bag:(id)a4
{
  v45[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v45[0] = AMSDeviceOfferFollowUpIdentifierAppleMusic;
  v45[1] = AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud;
  v45[2] = AMSDeviceOfferFollowUpIdentifieriCloud;
  v45[3] = @"com.apple.AMSFollowUpIdentifier.Billing";
  v45[4] = @"com.apple.AMSFollowUpIdentifier.HardwareOffer";
  v45[5] = @"com.apple.AMSFollowUpIdentifier.HardwareOffer.Fitness";
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = [v7 arrayWithObjects:v45 count:6];
  id v10 = [v6 setWithArray:v9];

  id v11 = [v8 arrayForKey:@"follow-up-identifier-allow-list"];

  id v38 = 0;
  v12 = [v11 valueWithError:&v38];
  id v37 = v38;

  uint64_t v13 = [v12 count];
  uint64_t v14 = +[AMSLogConfig sharedFollowUpConfig];
  id v15 = (void *)v14;
  if (v13)
  {
    if (!v14)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v17;
      id v19 = [v5 logKey];
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag did provided an allow-list, merging the allowed identifiers", buf, 0x16u);
    }
    [v10 setByAddingObjectsFromArray:v12];
    id v10 = v15 = v10;
  }
  else
  {
    if (!v14)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v15 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      id v36 = v21;
      v22 = [v5 logKey];
      v23 = AMSLogableError(v37);
      *(_DWORD *)buf = 138543874;
      v40 = v21;
      __int16 v41 = 2114;
      v42 = v22;
      __int16 v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag did not provide an allow-list : %{public}@", buf, 0x20u);
    }
  }

  id v24 = [v5 clientIdentifier];
  char v25 = [v10 containsObject:v24];

  if ((v25 & 1) == 0)
  {
    id v27 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v27)
    {
      id v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v29 = objc_opt_class();
    id v30 = v29;
    __int16 v31 = [v5 logKey];
    id v32 = [v5 clientIdentifier];
    *(_DWORD *)buf = 138543874;
    v40 = v29;
    __int16 v41 = 2114;
    v42 = v31;
    __int16 v43 = 2114;
    v44 = v32;
    __int16 v33 = "%{public}@: [%{public}@] Follow up DENIED due to denylisted identifier: %{public}@";
    goto LABEL_23;
  }
  if (([v5 isAccountTypeActive] & 1) == 0)
  {
    id v27 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v27)
    {
      id v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    uint64_t v34 = objc_opt_class();
    id v30 = v34;
    __int16 v31 = [v5 logKey];
    id v32 = [v5 clientIdentifier];
    *(_DWORD *)buf = 138543874;
    v40 = v34;
    __int16 v41 = 2114;
    v42 = v31;
    __int16 v43 = 2114;
    v44 = v32;
    __int16 v33 = "%{public}@: [%{public}@] Follow up DENIED due to inactive account %{public}@";
LABEL_23:
    _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);

LABEL_24:
    BOOL v26 = 0;
    goto LABEL_25;
  }
  BOOL v26 = 1;
LABEL_25:

  return v26;
}

+ (BOOL)_shouldClearFollowUpFromPayload:(id)a3
{
  id v3 = [a3 aps];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"clear"];

  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)_createFollowUpItemFromPayload:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 clientIdentifier];
  uint64_t v5 = [v3 priority];
  v6 = [v3 logKey];
  id v7 = [AMSFollowUpItem alloc];
  id v8 = [v3 aps];
  id v9 = [v3 account];

  id v10 = [(AMSFollowUpItem *)v7 initWithIdentifier:v4 jsonDictionary:v8 account:v9 priority:v5 logKey:v6];
  return v10;
}

+ (id)_createFollowUpItemFromNotification:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 title];
  uint64_t v5 = [v3 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"expirationDate"];

  uint64_t v7 = [v3 informativeText];
  uint64_t v56 = [v3 logKey];
  if ([v6 length])
  {
    uint64_t v8 = +[AMSPushParsableFollowUp _dateFromString:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [v3 userInfo];
  id v10 = (void *)[v9 mutableCopy];

  id v11 = [v10 objectForKeyedSubscript:@"priority"];

  if (v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"priority"];
    id v11 = (void *)[v12 integerValue];

    [v10 removeObjectForKey:@"priority"];
  }
  uint64_t v13 = [v10 objectForKeyedSubscript:@"metrics"];

  if (v13)
  {
    v55 = [v10 objectForKeyedSubscript:@"metrics"];
    [v10 removeObjectForKey:@"metrics"];
  }
  else
  {
    v55 = 0;
  }
  uint64_t v14 = [v10 objectForKeyedSubscript:@"accountDSID"];

  if (v14)
  {
    id v15 = [v10 objectForKeyedSubscript:@"accountDSID"];
    if (v15)
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v54 = objc_msgSend(v16, "ams_iTunesAccountWithDSID:", v15);
    }
    else
    {
      v54 = 0;
    }
    [v10 removeObjectForKey:@"accountDSID"];
  }
  else
  {
    v54 = 0;
  }
  uint64_t v17 = [v10 objectForKeyedSubscript:@"expirationDateHidden"];

  if (v17)
  {
    id v18 = [v10 objectForKeyedSubscript:@"expirationDateHidden"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (void *)[v18 BOOLValue];
    }
    else {
      uint64_t v17 = 0;
    }
    [v10 removeObjectForKey:@"expirationDateHidden"];
  }
  id v19 = [v3 userInfo];
  id v20 = [v19 objectForKeyedSubscript:@"iconImageName"];

  if (v20) {
    [v10 removeObjectForKey:@"iconImageName"];
  }
  v51 = v6;
  v21 = [AMSFollowUpItem alloc];
  v22 = [v3 identifier];
  v23 = [(AMSFollowUpItem *)v21 initWithIdentifier:v22 account:v54 priority:v11];

  v52 = (void *)v4;
  [(AMSFollowUpItem *)v23 setTitle:v4];
  [(AMSFollowUpItem *)v23 setExpirationDateHidden:v17];
  [(AMSFollowUpItem *)v23 setBundleIconName:0];
  v49 = (void *)v8;
  [(AMSFollowUpItem *)v23 setExpirationDate:v8];
  v50 = (void *)v7;
  [(AMSFollowUpItem *)v23 setInformativeText:v7];
  id v24 = (void *)v56;
  [(AMSFollowUpItem *)v23 setLogKey:v56];
  [(AMSFollowUpItem *)v23 setUserInfo:v10];
  if (v55)
  {
    char v25 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v55];
    [(AMSFollowUpItem *)v23 setMetricsEvent:v25];
  }
  v62 = v23;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v53 = v3;
  id obj = [v3 buttonActions];
  uint64_t v63 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v63)
  {
    uint64_t v59 = *(void *)v67;
    v60 = v26;
    v61 = v10;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v67 != v59) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v64 = [v28 defaultURL];
        v65 = [v28 title];
        v29 = [v28 userInfo];
        id v30 = (void *)[v29 mutableCopy];

        __int16 v31 = [v30 objectForKeyedSubscript:@"metrics"];
        if (v31) {
          [v30 removeObjectForKey:@"metrics"];
        }
        id v32 = [v30 objectForKeyedSubscript:@"serverActionUrl"];
        if (v32)
        {
          [v30 removeObjectForKey:@"serverActionUrl"];
          __int16 v33 = [v32 objectForKeyedSubscript:@"url"];
          uint64_t v34 = [v32 objectForKeyedSubscript:@"method"];
          uint64_t v35 = [v32 objectForKeyedSubscript:@"body"];
          if (v33)
          {
            uint64_t v36 = [MEMORY[0x1E4F1CB10] URLWithString:v33];
            if (v36)
            {
              id v37 = (void *)v36;
              id v38 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v36];
              v39 = v38;
              if (v34) {
                v40 = v34;
              }
              else {
                v40 = @"GET";
              }
              [v38 setHTTPMethod:v40];
              [v35 dataUsingEncoding:4];
              __int16 v41 = v57 = v35;
              [v39 setHTTPBody:v41];

              uint64_t v35 = v57;
            }
            else
            {
              v39 = 0;
            }
            id v24 = (void *)v56;
          }
          else
          {
            v39 = 0;
          }
        }
        else
        {
          v39 = 0;
        }
        v42 = [AMSFollowUpAction alloc];
        __int16 v43 = [(AMSFollowUpItem *)v62 identifier];
        v44 = [(AMSFollowUpAction *)v42 initWithLabel:v65 parentIdentifier:v43];

        v45 = [v28 identifier];
        [(AMSFollowUpAction *)v44 setIdentifier:v45];

        [(AMSFollowUpAction *)v44 setUrl:v64];
        v46 = (void *)[v30 mutableCopy];
        [(AMSFollowUpAction *)v44 setUserInfo:v46];

        [(AMSFollowUpAction *)v44 setRequest:v39];
        [(AMSFollowUpAction *)v44 setLogKey:v24];
        if (v31)
        {
          v47 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v31];
          [(AMSFollowUpAction *)v44 setMetricsEvent:v47];
        }
        id v26 = v60;
        [v60 addObject:v44];

        id v10 = v61;
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v63);
  }

  if ([v26 count]) {
    [(AMSFollowUpItem *)v62 setActions:v26];
  }

  return v62;
}

+ (id)_createNotificationFromFollowUpItem:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 title];
  uint64_t v5 = [v3 informativeText];
  v6 = [v3 metricsEvent];
  uint64_t v7 = [v6 underlyingDictionary];

  uint64_t v8 = [v3 logKey];
  id v9 = [v3 expirationDate];

  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyLocalTimeZoneFormatter");
    id v11 = [v3 expirationDate];
    uint64_t v12 = [v10 stringFromDate:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "priority"));
  [v13 setObject:v14 forKeyedSubscript:@"priority"];

  if (v7) {
    [v13 setObject:v7 forKeyedSubscript:@"metrics"];
  }
  id v15 = [v3 account];
  id v16 = objc_msgSend(v15, "ams_DSID");

  if (v16)
  {
    uint64_t v17 = [v3 account];
    id v18 = objc_msgSend(v17, "ams_DSID");
    [v13 setObject:v18 forKeyedSubscript:@"accountDSID"];
  }
  id v19 = [v3 bundleIconName];

  if (v19)
  {
    id v20 = [v3 bundleIconName];
    [v13 setObject:v20 forKeyedSubscript:@"iconImageName"];
  }
  uint64_t v59 = (void *)v7;
  if ([v3 isExpirationDateHidden])
  {
    v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "isExpirationDateHidden"));
    [v13 setObject:v21 forKeyedSubscript:@"expirationDateHidden"];
  }
  v53 = (void *)v12;
  [v13 setObject:v12 forKeyedSubscript:@"expirationDate"];
  uint64_t v56 = (void *)v4;
  v22 = [[AMSUserNotification alloc] initWithTitle:v4 intent:1];
  v23 = [v3 identifier];
  [(AMSUserNotification *)v22 setIdentifier:v23];

  [(AMSUserNotification *)v22 setCenterBundleIdentifier:@"com.apple.appstoreagent"];
  v55 = (void *)v5;
  [(AMSUserNotification *)v22 setInformativeText:v5];
  v54 = (void *)v8;
  [(AMSUserNotification *)v22 setLogKey:v8];
  v51 = v22;
  v52 = v13;
  [(AMSUserNotification *)v22 setUserInfo:v13];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = [v3 actions];
  uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v63;
    id v58 = v24;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v63 != v60) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v27 = [v26 url];
        id v28 = [v26 label];
        v29 = [v26 userInfo];
        id v30 = (void *)[v29 mutableCopy];
        __int16 v31 = v30;
        if (v30) {
          id v32 = v30;
        }
        else {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        __int16 v33 = v32;

        uint64_t v34 = [v3 metricsEvent];

        if (v34) {
          [v33 setObject:v59 forKeyedSubscript:@"metrics"];
        }
        uint64_t v35 = [v26 request];

        if (v35)
        {
          id v36 = v3;
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v38 = [v26 request];
          v39 = [v38 URL];
          v40 = [v39 absoluteString];
          [v37 setObject:v40 forKeyedSubscript:@"url"];

          __int16 v41 = [v26 request];
          v42 = [v41 HTTPMethod];
          [v37 setObject:v42 forKeyedSubscript:@"method"];

          __int16 v43 = [v26 request];
          v44 = [v43 HTTPBody];

          if (v44)
          {
            id v45 = [NSString alloc];
            v46 = [v26 request];
            v47 = [v46 HTTPBody];
            v48 = (void *)[v45 initWithData:v47 encoding:4];

            if (v48) {
              [v37 setObject:v48 forKeyedSubscript:@"body"];
            }
          }
          [v33 setObject:v37 forKeyedSubscript:@"serverActionUrl"];

          id v3 = v36;
          id v24 = v58;
        }
        v49 = [[AMSUserNotificationAction alloc] initWithTitle:v28];
        [(AMSUserNotificationAction *)v49 setDefaultURL:v27];
        [(AMSUserNotificationAction *)v49 setUserInfo:v33];
        [v24 addObject:v49];
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v61);
  }

  if ([v24 count]) {
    [(AMSUserNotification *)v51 setButtonActions:v24];
  }

  return v51;
}

+ (id)_dateFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
  uint64_t v5 = [v4 dateFromString:v3];

  if (!v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyLocalTimeZoneFormatter");
    uint64_t v5 = [v6 dateFromString:v3];
  }
  return v5;
}

@end