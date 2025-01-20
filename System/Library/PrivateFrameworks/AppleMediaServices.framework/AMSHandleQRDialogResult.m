@interface AMSHandleQRDialogResult
+ (BOOL)_isDismissQRDialogEnabled;
+ (id)_dismissalIdentifierFromDialogResult:(id)a3;
+ (void)_observeQRDialogDismissalNotificationForIdentifier:(id)a3 dialog:(id)a4;
+ (void)_removeQRDialogDismissalObserverForIdentifier:(id)a3;
+ (void)handleQRDialogPresentationForRequest:(id)a3 result:(id)a4 logKey:(id)a5;
@end

@implementation AMSHandleQRDialogResult

+ (void)handleQRDialogPresentationForRequest:(id)a3 result:(id)a4 logKey:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AMSSystemAlertDialogTask *)[AMSQRCodeDialogTask alloc] initWithRequest:v10];

  v12 = +[AMSHandleQRDialogResult _dismissalIdentifierFromDialogResult:v9];

  if (+[AMSHandleQRDialogResult _isDismissQRDialogEnabled])
  {
    if (v12)
    {
      [(AMSSystemAlertDialogTask *)v11 setIsDialogDismissalEnabled:1];
      +[AMSHandleQRDialogResult _observeQRDialogDismissalNotificationForIdentifier:v12 dialog:v11];
    }
    else
    {
      v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = (id)objc_opt_class();
        __int16 v25 = 2114;
        id v26 = v8;
        id v15 = v24;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error observing for QR code dialog dismissal. No dialog identifier or link code found on the dialog result.", buf, 0x16u);
      }
    }
  }
  v16 = [(AMSSystemAlertDialogTask *)v11 present];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__AMSHandleQRDialogResult_handleQRDialogPresentationForRequest_result_logKey___block_invoke;
  v19[3] = &unk_1E55A3320;
  id v21 = v12;
  id v22 = a1;
  id v20 = v8;
  id v17 = v12;
  id v18 = v8;
  [v16 addFinishBlock:v19];
}

void __78__AMSHandleQRDialogResult_handleQRDialogPresentationForRequest_result_logKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  id v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138543874;
      v19 = v10;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v6;
      id v12 = v10;
      v13 = "%{public}@: [%{public}@] Error presenting QR code dialog: %{public}@";
      v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_18D554000, v14, v15, v13, (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138543874;
      v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v5;
      id v12 = v16;
      v13 = "%{public}@: [%{public}@] QR code dialog presented: %@";
      v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  if (*(void *)(a1 + 40)
    && +[AMSHandleQRDialogResult _isDismissQRDialogEnabled])
  {
    +[AMSHandleQRDialogResult _removeQRDialogDismissalObserverForIdentifier:*(void *)(a1 + 40)];
  }
}

+ (void)_observeQRDialogDismissalNotificationForIdentifier:(id)a3 dialog:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__36;
  __int16 v20 = __Block_byref_object_dispose__36;
  uint64_t v21 = objc_alloc_init(AMSDaemonConnection);
  uint64_t v7 = [(id)v17[5] dismissQRDialogServiceProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke;
  v13[3] = &unk_1E55A3348;
  id v8 = v5;
  id v14 = v8;
  os_log_type_t v15 = &v16;
  id v9 = [v7 thenWithBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_3;
  v11[3] = &unk_1E55A3370;
  id v10 = v6;
  id v12 = v10;
  [v9 addFinishBlock:v11];

  _Block_object_dispose(&v16, 8);
}

AMSMutablePromise *__85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_2;
  v9[3] = &unk_1E55A30A0;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  [v3 observeQRDialogDismissalNotificationForIdentifier:v5 completion:v9];

  return v6;
}

void __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __85__AMSHandleQRDialogResult__observeQRDialogDismissalNotificationForIdentifier_dialog___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

+ (void)_removeQRDialogDismissalObserverForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__36;
  uint64_t v17 = __Block_byref_object_dispose__36;
  uint64_t v18 = objc_alloc_init(AMSDaemonConnection);
  v4 = [(id)v14[5] dismissQRDialogServiceProxy];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke;
  id v10 = &unk_1E55A3348;
  id v5 = v3;
  id v11 = v5;
  id v12 = &v13;
  id v6 = [v4 thenWithBlock:&v7];
  objc_msgSend(v6, "addFinishBlock:", &__block_literal_global_63, v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

AMSMutablePromise *__73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke_2;
  v9[3] = &unk_1E55A30A0;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  [v3 removeQRDialogDismissalObserverForIdentifier:v5 completion:v9];

  return v6;
}

void __73__AMSHandleQRDialogResult__removeQRDialogDismissalObserverForIdentifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (id)_dismissalIdentifierFromDialogResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 originalRequest];
  uint64_t v5 = [v4 metricsEvent];
  id v6 = [v5 underlyingDictionary];

  uint64_t v7 = [v3 originalRequest];

  uint64_t v8 = [v7 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"AMSDialogRequestUserInfoKeyServerPayload"];

  id v10 = [v9 objectForKeyedSubscript:@"okButtonAction"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"PINCode"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = [v6 objectForKeyedSubscript:@"dialogId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;

    if (v12)
    {
      uint64_t v15 = v12;
LABEL_10:
      id v16 = v15;
      goto LABEL_11;
    }
    uint64_t v15 = v14;
    if (v14) {
      goto LABEL_10;
    }
    id v16 = 0;
  }
  else
  {

    id v14 = 0;
    id v16 = 0;
    uint64_t v15 = v12;
    if (v12) {
      goto LABEL_10;
    }
  }
LABEL_11:

  return v16;
}

+ (BOOL)_isDismissQRDialogEnabled
{
  return _os_feature_enabled_impl();
}

@end