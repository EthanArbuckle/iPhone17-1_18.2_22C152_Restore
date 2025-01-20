@interface APRequestHandler
+ (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5;
+ (void)checkDownloadQueueWithContentType:(int64_t)a3;
+ (void)didReceiveStorePushNotificationWithPayload:(id)a3;
+ (void)getCachedRequestsWithCompletion:(id)a3;
+ (void)getMatchingRequestsWithIdentifier:(id)a3 completion:(id)a4;
+ (void)getRequestWithIdentifier:(id)a3 completion:(id)a4;
+ (void)localApproveRequestWithItemIdentifier:(id)a3 completion:(id)a4;
+ (void)presentApprovalSheetWithRequestIdentifier:(id)a3 completion:(id)a4;
+ (void)presentProductPageWithTitle:(id)a3 body:(id)a4 approve:(id)a5 decline:(id)a6 itemIdentifier:(id)a7 previewURL:(id)a8 offerName:(id)a9 requestString:(id)a10 requestSummary:(id)a11 priceSummary:(id)a12;
+ (void)resetAccountWithType:(int64_t)a3;
+ (void)restartAPNSConnection;
+ (void)startDaemon;
+ (void)updateRequestWithIdentifier:(id)a3 action:(int64_t)a4 completion:(id)a5;
@end

@implementation APRequestHandler

+ (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[APLogConfig sharedFrameworkConfig];
  if (!v11)
  {
    v11 = +[APLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    id v13 = v21;
    _os_log_impl(&dword_2256FB000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Add request. URL: %{public}@, account: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, a1);
  v14 = +[APConnectionNotifier sharedNotifier];
  v15 = [v14 remoteObjectProxy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__APRequestHandler_addRequestWithURL_account_completion___block_invoke;
  v17[3] = &unk_26474E518;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v10;
  id v18 = v16;
  [v15 addRequestWithURL:v8 account:v9 completion:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __57__APRequestHandler_addRequestWithURL_account_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      v6 = +[APLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v3;
      id v8 = v15;
      id v9 = "%{public}@: Add request failure. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    if (!v5)
    {
      v6 = +[APLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v8 = v15;
      id v9 = "%{public}@: Add request success";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

+ (void)presentApprovalSheetWithRequestIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APLogConfig sharedFrameworkConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Present Approval Sheet. Request identifier: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, a1);
  os_log_type_t v11 = +[APConnectionNotifier sharedNotifier];
  uint32_t v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__APRequestHandler_presentApprovalSheetWithRequestIdentifier_completion___block_invoke;
  v14[3] = &unk_26474E518;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v7;
  id v15 = v13;
  [v12 presentApprovalSheetWithRequestIdentifier:v6 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __73__APRequestHandler_presentApprovalSheetWithRequestIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v3;
      id v8 = v15;
      id v9 = "%{public}@: Present approval sheet failure. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v8 = v15;
      id v9 = "%{public}@: Present approval sheet success";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

+ (void)getRequestWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APLogConfig sharedFrameworkConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Get Request Data. Request identifier: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, a1);
  os_log_type_t v11 = +[APConnectionNotifier sharedNotifier];
  uint32_t v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__APRequestHandler_getRequestWithIdentifier_completion___block_invoke;
  v14[3] = &unk_26474E540;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v7;
  id v15 = v13;
  [v12 getRequestWithIdentifier:v6 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__APRequestHandler_getRequestWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = +[APLogConfig sharedFrameworkConfig];
  id v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v11 = v18;
      uint32_t v12 = "%{public}@: Get Request Data failure. Error: %{public}@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else
  {
    if (!v8)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v11 = v18;
      uint32_t v12 = "%{public}@: Get Request Data Success";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

+ (void)getMatchingRequestsWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[APLogConfig sharedFrameworkConfig];
  if (!v8)
  {
    uint64_t v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Get Matching Requests. Request identifier: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, a1);
  id v11 = +[APConnectionNotifier sharedNotifier];
  uint32_t v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__APRequestHandler_getMatchingRequestsWithIdentifier_completion___block_invoke;
  v14[3] = &unk_26474E568;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v7;
  id v15 = v13;
  [v12 getMatchingRequestsWithIdentifier:v6 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __65__APRequestHandler_getMatchingRequestsWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = +[APLogConfig sharedFrameworkConfig];
  id v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v11 = v18;
      uint32_t v12 = "%{public}@: Get Matching Requests failure. Error: %{public}@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else
  {
    if (!v8)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v11 = v18;
      uint32_t v12 = "%{public}@: Get Matching Requests Success";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

+ (void)checkDownloadQueueWithContentType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = +[APLogConfig sharedFrameworkConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2050;
    int64_t v15 = a3;
    id v7 = v13;
    _os_log_impl(&dword_2256FB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking download queue. Content type: %{public}ld.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, a1);
  uint64_t v8 = +[APConnectionNotifier sharedNotifier];
  id v9 = [v8 remoteObjectProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__APRequestHandler_checkDownloadQueueWithContentType___block_invoke;
  v10[3] = &unk_26474E340;
  objc_copyWeak(&v11, (id *)buf);
  [v9 checkDownloadQueueWithContentType:a3 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __54__APRequestHandler_checkDownloadQueueWithContentType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v3;
      id v8 = v14;
      id v9 = "%{public}@: Checking download queue failed. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Checking download queue succeeded.";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }
}

+ (void)getCachedRequestsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  if (!v5)
  {
    uint64_t v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v7 = v15;
    _os_log_impl(&dword_2256FB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching item cache.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, a1);
  id v8 = +[APConnectionNotifier sharedNotifier];
  id v9 = [v8 remoteObjectProxy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__APRequestHandler_getCachedRequestsWithCompletion___block_invoke;
  v11[3] = &unk_26474E590;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  [v9 getCachedRequestsWithCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __52__APRequestHandler_getCachedRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  if (!v5)
  {
    uint64_t v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    int v10 = 138543618;
    os_log_type_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = [v3 count];
    _os_log_impl(&dword_2256FB000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched Items. Count: %lu", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

+ (void)localApproveRequestWithItemIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APLogConfig sharedFrameworkConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Local approve request. Item identifier: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, a1);
  os_log_type_t v11 = +[APConnectionNotifier sharedNotifier];
  __int16 v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__APRequestHandler_localApproveRequestWithItemIdentifier_completion___block_invoke;
  v14[3] = &unk_26474E518;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v7;
  id v15 = v13;
  [v12 localApproveRequestWithItemIdentifier:v6 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __69__APRequestHandler_localApproveRequestWithItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v3;
      id v8 = v15;
      uint64_t v9 = "%{public}@: Local approve failure. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v8 = v15;
      uint64_t v9 = "%{public}@: Local approve success";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

+ (void)restartAPNSConnection
{
  id v3 = +[APConnectionNotifier sharedNotifier];
  v2 = [v3 remoteObjectProxy];
  [v2 restartAPNSConnection];
}

+ (void)updateRequestWithIdentifier:(id)a3 action:(int64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[APLogConfig sharedFrameworkConfig];
  if (!v10)
  {
    id v10 = +[APLogConfig sharedConfig];
  }
  os_log_type_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2050;
    int64_t v24 = a4;
    id v12 = v20;
    _os_log_impl(&dword_2256FB000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Update request. Identifier: %{public}@, action: %{public}ld", buf, 0x20u);
  }
  objc_initWeak((id *)buf, a1);
  uint64_t v13 = +[APConnectionNotifier sharedNotifier];
  int v14 = [v13 remoteObjectProxy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__APRequestHandler_updateRequestWithIdentifier_action_completion___block_invoke;
  v16[3] = &unk_26474E518;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v9;
  id v17 = v15;
  [v14 updateRequestWithIdentifier:v8 action:a4 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __66__APRequestHandler_updateRequestWithIdentifier_action_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedFrameworkConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v3;
      id v8 = v15;
      id v9 = "%{public}@: Update request failure. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2256FB000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v8 = v15;
      id v9 = "%{public}@: Update request success";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

+ (void)resetAccountWithType:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = +[APLogConfig sharedFrameworkConfig];
  if (!v4)
  {
    id v4 = +[APLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2050;
    int64_t v12 = a3;
    id v6 = v10;
    _os_log_impl(&dword_2256FB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset account with type: %{public}ld", (uint8_t *)&v9, 0x16u);
  }
  id v7 = +[APConnectionNotifier sharedNotifier];
  id v8 = [v7 remoteObjectProxy];
  [v8 resetAccountWithType:a3];
}

+ (void)startDaemon
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = +[APLogConfig sharedFrameworkConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Start daemon", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = +[APConnectionNotifier sharedNotifier];
  id v6 = [v5 remoteObjectProxy];
  [v6 start];
}

+ (void)presentProductPageWithTitle:(id)a3 body:(id)a4 approve:(id)a5 decline:(id)a6 itemIdentifier:(id)a7 previewURL:(id)a8 offerName:(id)a9 requestString:(id)a10 requestSummary:(id)a11 priceSummary:(id)a12
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v33 = a4;
  id v17 = (__CFString *)a7;
  uint64_t v18 = (__CFString *)a8;
  id v32 = a12;
  id v31 = a11;
  id v30 = a10;
  id v29 = a9;
  id v28 = a6;
  id v27 = a5;
  __int16 v19 = +[APLogConfig sharedFrameworkConfig];
  if (!v19)
  {
    __int16 v19 = +[APLogConfig sharedConfig];
  }
  id v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v36 = (id)objc_opt_class();
    __int16 v37 = 2114;
    id v38 = v34;
    __int16 v39 = 2114;
    id v40 = v33;
    __int16 v41 = 2114;
    v42 = v17;
    __int16 v43 = 2114;
    v44 = v18;
    id v21 = v36;
    _os_log_impl(&dword_2256FB000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Present product page. Title: %{public}@, body: %{public}@, itemIdentifier: %{public}@, previewURL: %{public}@", buf, 0x34u);
  }
  id v22 = +[APConnectionNotifier sharedNotifier];
  __int16 v23 = [v22 remoteObjectProxy];
  int64_t v24 = v23;
  if (v17) {
    uint64_t v25 = v17;
  }
  else {
    uint64_t v25 = &stru_26D8DFD40;
  }
  if (v18) {
    uint64_t v26 = v18;
  }
  else {
    uint64_t v26 = &stru_26D8DFD40;
  }
  [v23 presentProductPageWithTitle:v34 body:v33 approve:v27 decline:v28 itemIdentifier:v25 previewURL:v26 offerName:v29 requestString:v30 requestSummary:v31 priceSummary:v32];
}

+ (void)didReceiveStorePushNotificationWithPayload:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[APLogConfig sharedFrameworkConfig];
  if (!v4)
  {
    id v4 = +[APLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v3;
    id v6 = v10;
    _os_log_impl(&dword_2256FB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received store push notification. Payload: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  int v7 = +[APConnectionNotifier sharedNotifier];
  id v8 = [v7 remoteObjectProxy];
  [v8 didReceiveStorePushNotificationWithPayload:v3];
}

@end