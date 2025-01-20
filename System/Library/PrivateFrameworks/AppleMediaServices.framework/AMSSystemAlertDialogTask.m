@interface AMSSystemAlertDialogTask
- (AMSDialogRequest)request;
- (AMSDialogResult)autoDismissResult;
- (AMSSystemAlertDialogTask)initWithRequest:(id)a3;
- (BOOL)dismissOnHomeButton;
- (BOOL)dismissOnLock;
- (BOOL)displaysOnLockscreen;
- (BOOL)isDialogDismissalEnabled;
- (BOOL)shouldDismissAfterUnlock;
- (BOOL)shouldDisplayAsTopMost;
- (BOOL)shouldPendInSetupIfNotAllowed;
- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5;
- (__CFUserNotification)_showNotificationFromDictionary:(__CFDictionary *)a3 options:(unint64_t)a4;
- (__CFUserNotification)userNotification;
- (id)_handleResponseForNote:(__CFUserNotification *)a3 buttonActions:(id)a4 keys:(ButtonKey *)a5;
- (id)_reorderButtonActions;
- (id)present;
- (int64_t)_defaultButtonIndexForActions:(id)a3;
- (int64_t)_keyboardTypeFor:(int64_t)a3;
- (int64_t)defaultButtonIndex;
- (int64_t)unlockActionButtonIndex;
- (void)_dismiss;
- (void)setAutoDismissResult:(id)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDismissOnHomeButton:(BOOL)a3;
- (void)setDismissOnLock:(BOOL)a3;
- (void)setDisplaysOnLockscreen:(BOOL)a3;
- (void)setIsDialogDismissalEnabled:(BOOL)a3;
- (void)setShouldDismissAfterUnlock:(BOOL)a3;
- (void)setShouldDisplayAsTopMost:(BOOL)a3;
- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3;
- (void)setUnlockActionButtonIndex:(int64_t)a3;
- (void)setUserNotification:(__CFUserNotification *)a3;
@end

@implementation AMSSystemAlertDialogTask

- (AMSSystemAlertDialogTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSystemAlertDialogTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v7->_defaultButtonIndex = -1;
    v7->_dismissOnHomeButton = 1;
    v7->_displaysOnLockscreen = 0;
    v7->_shouldDismissAfterUnlock = 1;
    v7->_unlockActionButtonIndex = -1;
  }

  return v7;
}

- (id)present
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__AMSSystemAlertDialogTask_present__block_invoke;
  v4[3] = &unk_1E55A2C20;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __35__AMSSystemAlertDialogTask_present__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [*(id *)(a1 + 32) request];
    v8 = [v7 logKey];
    objc_super v9 = [*(id *)(a1 + 32) request];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v6;
    __int16 v31 = 2114;
    *(void *)v32 = v8;
    *(_WORD *)&v32[8] = 2114;
    v33 = v9;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system alert using request: %{public}@", buf, 0x20u);
  }
  *(void *)buf = *MEMORY[0x1E4F1D9D0];
  *(_DWORD *)&buf[8] = 1;
  *(void *)&v32[2] = *MEMORY[0x1E4F1DA10];
  LODWORD(v33) = 2;
  uint64_t v34 = *MEMORY[0x1E4F1D9E0];
  int v35 = 0;
  v10 = [*(id *)(a1 + 32) _reorderButtonActions];
  uint64_t v25 = 0;
  v11 = (const void *)[*(id *)(a1 + 32) _createNoteDictionaryWithKeys:buf buttonActions:v10 outOptions:&v25];
  if (v11) {
    goto LABEL_6;
  }
  v14 = +[AMSLogConfig sharedConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = objc_opt_class();
    v17 = *(void **)(a1 + 32);
    id v18 = v16;
    v19 = [v17 request];
    v20 = [v19 logKey];
    *(_DWORD *)v26 = 138543618;
    v27 = v16;
    __int16 v28 = 2114;
    v29 = v20;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create note dictionary.", v26, 0x16u);
  }
  uint64_t v21 = AMSError(0, @"System Dialog Task Failed", @"Unknown error occurred creating the note dictionary", 0);
  if (!v21)
  {
LABEL_6:
    v12 = (const void *)[*(id *)(a1 + 32) _showNotificationFromDictionary:v11 options:v25];
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = AMSError(0, @"System Dialog Task Failed", @"Unable to create the system notification", 0);
    }
  }
  else
  {
    v13 = (void *)v21;
    v12 = 0;
  }
  if ([*(id *)(a1 + 32) isDialogDismissalEnabled]) {
    [*(id *)(a1 + 32) setUserNotification:v12];
  }
  if (v13)
  {
    v22 = 0;
    goto LABEL_24;
  }
  uint64_t v23 = [*(id *)(a1 + 32) _handleResponseForNote:v12 buttonActions:v10 keys:buf];
  if (v23)
  {
    v22 = (void *)v23;
  }
  else
  {
    v13 = AMSError(0, @"System Dialog Task Failed", @"System dialog task finished without a result", 0);
    v22 = [*(id *)(a1 + 32) autoDismissResult];

    if (!v22) {
      goto LABEL_24;
    }
    v22 = [*(id *)(a1 + 32) autoDismissResult];
  }
  v13 = 0;
LABEL_24:
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v13)
  {
    if (a2) {
      *a2 = v13;
    }

    v22 = 0;
  }

  return v22;
}

- (void)_dismiss
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(AMSSystemAlertDialogTask *)self userNotification])
  {
    v3 = +[AMSLogConfig sharedAccountsConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSSystemAlertDialogTask isDialogDismissalEnabled](self, "isDialogDismissalEnabled"));
      int v14 = 138543874;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Tried to dismiss nothing (isDialogDismissalEnabled is %{public}@ and should be YES)", (uint8_t *)&v14, 0x20u);
    }
    goto LABEL_12;
  }
  v3 = [(AMSSystemAlertDialogTask *)self request];
  v4 = [[AMSDialogResult alloc] initWithOriginalRequest:v3 selectedActionIdentifier:@"No action required"];
  [(AMSSystemAlertDialogTask *)self setAutoDismissResult:v4];

  uint64_t v5 = CFUserNotificationCancel([(AMSSystemAlertDialogTask *)self userNotification]);
  [(AMSSystemAlertDialogTask *)self setUserNotification:0];
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      objc_super v9 = AMSLogKey();
      v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
      int v14 = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to dismiss dialog, CFUserNotificationCancel returned %{public}@", (uint8_t *)&v14, 0x20u);
    }
LABEL_12:
  }
}

- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5
{
  id v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    if (a5)
    {
      *a5 = 3;
      if ([v7 count]) {
        *a5 |= 0x20uLL;
      }
    }
    objc_super v9 = [(AMSSystemAlertDialogTask *)self request];
    v10 = [v9 title];

    if ([v10 length]) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D990], v10);
    }
    v70 = self;
    uint64_t v11 = [(AMSSystemAlertDialogTask *)self request];
    v12 = [v11 message];

    if (v12) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D9A8], v12);
    }
    unint64_t v13 = objc_msgSend(v7, "count", v12);
    uint64_t v14 = 3;
    if (v13 < 3) {
      uint64_t v14 = v13;
    }
    if (v14)
    {
      unint64_t v15 = 0;
      v74 = (__CFString *)*MEMORY[0x1E4F1D9D0];
      v73 = (__CFString *)*MEMORY[0x1E4F1DA10];
      v72 = (const void *)*MEMORY[0x1E4FA72B8];
      __int16 v16 = (const void *)*MEMORY[0x1E4FA73C0];
      v17 = (const void *)*MEMORY[0x1E4FA7300];
      __int16 v18 = a3;
      do
      {
        v19 = v7;
        uint64_t v20 = [v7 objectAtIndexedSubscript:v15];
        var0 = v18->var0;
        v22 = [v20 title];
        CFDictionarySetValue(Mutable, var0, v22);

        if (var0 == v73) {
          uint64_t v23 = v16;
        }
        else {
          uint64_t v23 = v17;
        }
        if (var0 == v74) {
          v24 = v72;
        }
        else {
          v24 = v23;
        }
        if ([v20 style] == 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = 2 * ([v20 style] == 2);
        }
        id v7 = v19;
        CFDictionarySetValue(Mutable, v24, (const void *)[MEMORY[0x1E4F28ED0] numberWithInt:v25]);

        ++v15;
        unint64_t v26 = [v19 count];
        unint64_t v27 = 3;
        if (v26 < 3) {
          unint64_t v27 = v26;
        }
        ++v18;
      }
      while (v27 > v15);
    }
    __int16 v28 = [(AMSSystemAlertDialogTask *)v70 request];
    v29 = [v28 textFields];
    uint64_t v30 = [v29 count];

    if (v30)
    {
      id v31 = v7;
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v33 = [(AMSSystemAlertDialogTask *)v70 request];
      uint64_t v34 = [v33 textFields];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        unint64_t v36 = 0;
        do
        {
          v37 = [(AMSSystemAlertDialogTask *)v70 request];
          v38 = [v37 textFields];
          v39 = [v38 objectAtIndexedSubscript:v36];

          id v40 = objc_alloc_init(MEMORY[0x1E4FA6B60]);
          [v40 setAutocapitalizationType:0];
          [v40 setAutocorrectionType:1];
          objc_msgSend(v40, "setSecure:", objc_msgSend(v39, "secure"));
          v41 = [v39 placeholder];
          [v40 setTitle:v41];

          v42 = [v39 text];
          [v40 setValue:v42];

          objc_msgSend(v40, "setKeyboardType:", -[AMSSystemAlertDialogTask _keyboardTypeFor:](v70, "_keyboardTypeFor:", objc_msgSend(v39, "keyboardType")));
          v43 = [v40 build];
          [v32 addObject:v43];

          ++v36;
          v44 = [(AMSSystemAlertDialogTask *)v70 request];
          v45 = [v44 textFields];
          unint64_t v46 = [v45 count];
        }
        while (v36 < v46);
      }
      v47 = (const void *)*MEMORY[0x1E4FA7230];
      id v48 = v32;
      CFDictionarySetValue(Mutable, v47, v48);

      id v7 = v31;
    }
    unint64_t v49 = [(AMSSystemAlertDialogTask *)v70 _defaultButtonIndexForActions:v7];
    if (v49 <= 2) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4FA7308], (const void *)[MEMORY[0x1E4F28ED0] numberWithInt:a3[v49].var1]);
    }
    unint64_t v50 = [(AMSSystemAlertDialogTask *)v70 unlockActionButtonIndex];
    if (v50 <= 2) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4FA72E8], (const void *)[MEMORY[0x1E4F28ED0] numberWithInt:a3[v50].var1]);
    }
    v51 = (const void *)*MEMORY[0x1E4FA7338];
    BOOL v52 = [(AMSSystemAlertDialogTask *)v70 displaysOnLockscreen];
    v53 = (const void *)*MEMORY[0x1E4F1CFD0];
    v54 = (const void *)*MEMORY[0x1E4F1CFC8];
    if (v52) {
      v55 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      v55 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    CFDictionarySetValue(Mutable, v51, v55);
    v56 = (const void *)*MEMORY[0x1E4FA7358];
    if ([(AMSSystemAlertDialogTask *)v70 displaysOnLockscreen]) {
      v57 = v53;
    }
    else {
      v57 = v54;
    }
    CFDictionarySetValue(Mutable, v56, v57);
    v58 = (const void *)*MEMORY[0x1E4FA72A0];
    if ([(AMSSystemAlertDialogTask *)v70 dismissOnHomeButton]) {
      v59 = v53;
    }
    else {
      v59 = v54;
    }
    CFDictionarySetValue(Mutable, v58, v59);
    v60 = (const void *)*MEMORY[0x1E4FA7328];
    if ([(AMSSystemAlertDialogTask *)v70 dismissOnLock]) {
      v61 = v53;
    }
    else {
      v61 = v54;
    }
    CFDictionarySetValue(Mutable, v60, v61);
    v62 = (const void *)*MEMORY[0x1E4F1D9B8];
    if ([(AMSSystemAlertDialogTask *)v70 shouldDisplayAsTopMost]) {
      v63 = v53;
    }
    else {
      v63 = v54;
    }
    CFDictionarySetValue(Mutable, v62, v63);
    v64 = (const void *)*MEMORY[0x1E4FA7340];
    if ([(AMSSystemAlertDialogTask *)v70 shouldDismissAfterUnlock]) {
      v65 = v53;
    }
    else {
      v65 = v54;
    }
    CFDictionarySetValue(Mutable, v64, v65);
    v66 = (const void *)*MEMORY[0x1E4FA73C8];
    if ([(AMSSystemAlertDialogTask *)v70 shouldPendInSetupIfNotAllowed]) {
      v67 = v53;
    }
    else {
      v67 = v54;
    }
    CFDictionarySetValue(Mutable, v66, v67);
  }
  return Mutable;
}

- (__CFUserNotification)_showNotificationFromDictionary:(__CFDictionary *)a3 options:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  SInt32 error = 0;
  CFUserNotificationRef v5 = CFUserNotificationCreate(0, 0.0, a4, &error, a3);
  if (v5 && error)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = v8;
      v10 = [(AMSSystemAlertDialogTask *)self request];
      uint64_t v11 = [v10 logKey];
      *(_DWORD *)buf = 138543874;
      unint64_t v15 = v8;
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = error;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating note %ld.", buf, 0x20u);
    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

- (int64_t)_defaultButtonIndexForActions:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(AMSSystemAlertDialogTask *)self defaultButtonIndex];
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_30;
  }
  uint64_t v6 = [(AMSSystemAlertDialogTask *)self request];
  id v7 = [v6 defaultAction];
  uint64_t v8 = [v7 identifier];

  if (v8)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int64_t v28 = v5;
      id v29 = v4;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        uint64_t v14 = 0;
        uint64_t v30 = v11 + v12;
        uint64_t v31 = v12;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v9);
          }
          unint64_t v15 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v14), "identifier", v28);
          __int16 v16 = [(AMSSystemAlertDialogTask *)self request];
          v17 = [v16 defaultAction];
          __int16 v18 = [v17 identifier];
          char v19 = [v15 isEqualToString:v18];

          if (v19)
          {
            int64_t v5 = v31 + v14;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
        uint64_t v12 = v30;
        if (v11) {
          continue;
        }
        break;
      }
      int64_t v5 = v28;
LABEL_13:

      id v4 = v29;
      if ((v5 & 0x8000000000000000) == 0) {
        goto LABEL_30;
      }
    }
    else
    {
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v4;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v21)
  {

LABEL_29:
    int64_t v5 = [v20 count] - 1;
    goto LABEL_30;
  }
  uint64_t v22 = v21;
  uint64_t v23 = 0;
  uint64_t v24 = *(void *)v33;
  while (2)
  {
    uint64_t v25 = 0;
    uint64_t v26 = v22 + v23;
    do
    {
      if (*(void *)v33 != v24) {
        objc_enumerationMutation(v20);
      }
      if ([*(id *)(*((void *)&v32 + 1) + 8 * v25) style] == 2)
      {
        int64_t v5 = v23 + v25;
        goto LABEL_26;
      }
      ++v25;
    }
    while (v22 != v25);
    uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    uint64_t v23 = v26;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_26:

  if (v5 < 0) {
    goto LABEL_29;
  }
LABEL_30:

  return v5;
}

- (id)_handleResponseForNote:(__CFUserNotification *)a3 buttonActions:(id)a4 keys:(ButtonKey *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  CFOptionFlags responseFlags = 0;
  id v9 = (void *)0x1E4F29000;
  if (CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
LABEL_5:
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v8;
      unint64_t v15 = [(AMSSystemAlertDialogTask *)self request];
      __int16 v16 = [v15 logKey];
      v17 = NSString;
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = v18;
      if (v16)
      {
        id v9 = [(AMSSystemAlertDialogTask *)self request];
        id v8 = [v9 logKey];
        [v17 stringWithFormat:@"%@: [%@] ", v19, v8];
      }
      else
      {
        [v17 stringWithFormat:@"%@: ", v18];
      id v20 = };
      *(_DWORD *)buf = 138543362;
      long long v36 = v20;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@System dialog finished without a selected button", buf, 0xCu);
      if (v16)
      {

        id v20 = v9;
      }

      id v8 = v32;
    }

    uint64_t v10 = -1;
    char v21 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    p_var1 = &a5->var1;
    while (1)
    {
      uint64_t v12 = *p_var1;
      p_var1 += 4;
      if (responseFlags == v12) {
        break;
      }
      if (++v10 == 3) {
        goto LABEL_5;
      }
    }
    char v21 = 0;
  }
  uint64_t v22 = CFUserNotificationGetResponseDictionary(a3);
  uint64_t v23 = [v22 objectForKey:*MEMORY[0x1E4F1DA28]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v34 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = 0;
      if (v21) {
        goto LABEL_21;
      }
      goto LABEL_23;
    }
    uint64_t v24 = [v23 copy];
  }
  uint64_t v25 = (void *)v24;
  if (v21)
  {
LABEL_21:
    uint64_t v26 = 0;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v26 = [v8 objectAtIndexedSubscript:v10];
LABEL_24:
  unint64_t v27 = [AMSDialogResult alloc];
  int64_t v28 = [(AMSSystemAlertDialogTask *)self request];
  id v29 = [v26 identifier];
  uint64_t v30 = [(AMSDialogResult *)v27 initWithOriginalRequest:v28 selectedActionIdentifier:v29];

  [(AMSDialogResult *)v30 setTextfieldValues:v25];
  return v30;
}

- (int64_t)_keyboardTypeFor:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_18DDF4D48[a3];
  }
}

- (id)_reorderButtonActions
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSSystemAlertDialogTask *)self request];
  id v4 = [v3 buttonActions];
  unint64_t v5 = [v4 count];

  uint64_t v6 = [(AMSSystemAlertDialogTask *)self request];
  id v7 = [v6 buttonActions];
  id v8 = v7;
  if (v5 <= 1)
  {
LABEL_2:

    goto LABEL_15;
  }
  uint64_t v9 = [v7 count];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9 != 2)
  {
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    *((void *)&v26 + 1) = 0;
    long long v27 = 0uLL;
    uint64_t v18 = [(AMSSystemAlertDialogTask *)self request];
    uint64_t v19 = [v18 buttonActions];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v6 = 0;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v24 style] == 2)
          {
            id v25 = v24;

            uint64_t v6 = v25;
          }
          else
          {
            [v8 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v21);

      if (v6) {
        [v8 addObject:v6];
      }
    }
    else
    {

      uint64_t v6 = 0;
    }
    goto LABEL_2;
  }
  long long v32 = 0uLL;
  long long v33 = 0uLL;
  long long v30 = 0uLL;
  long long v31 = 0uLL;
  uint64_t v10 = [(AMSSystemAlertDialogTask *)self request];
  uint64_t v11 = [v10 buttonActions];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if ([v16 style] == 2) {
          [v8 insertObject:v16 atIndex:0];
        }
        else {
          [v8 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

LABEL_15:
  return v8;
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (AMSDialogResult)autoDismissResult
{
  return self->_autoDismissResult;
}

- (void)setAutoDismissResult:(id)a3
{
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (BOOL)dismissOnHomeButton
{
  return self->_dismissOnHomeButton;
}

- (void)setDismissOnHomeButton:(BOOL)a3
{
  self->_dismissOnHomeButton = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (BOOL)shouldDismissAfterUnlock
{
  return self->_shouldDismissAfterUnlock;
}

- (void)setShouldDismissAfterUnlock:(BOOL)a3
{
  self->_shouldDismissAfterUnlock = a3;
}

- (BOOL)shouldDisplayAsTopMost
{
  return self->_shouldDisplayAsTopMost;
}

- (void)setShouldDisplayAsTopMost:(BOOL)a3
{
  self->_shouldDisplayAsTopMost = a3;
}

- (BOOL)shouldPendInSetupIfNotAllowed
{
  return self->_shouldPendInSetupIfNotAllowed;
}

- (void)setShouldPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_shouldPendInSetupIfNotAllowed = a3;
}

- (BOOL)displaysOnLockscreen
{
  return self->_displaysOnLockscreen;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  self->_displaysOnLockscreen = a3;
}

- (int64_t)unlockActionButtonIndex
{
  return self->_unlockActionButtonIndex;
}

- (void)setUnlockActionButtonIndex:(int64_t)a3
{
  self->_unlockActionButtonIndex = a3;
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  self->_userNotification = a3;
}

- (BOOL)isDialogDismissalEnabled
{
  return self->_isDialogDismissalEnabled;
}

- (void)setIsDialogDismissalEnabled:(BOOL)a3
{
  self->_isDialogDismissalEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end