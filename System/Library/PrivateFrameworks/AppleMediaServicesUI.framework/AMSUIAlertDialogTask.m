@interface AMSUIAlertDialogTask
+ (int64_t)_keyboardTypeFromType:(int64_t)a3;
- (AMSDialogRequest)request;
- (AMSUIAlertDialogTask)initWithRequest:(id)a3 presentingViewController:(id)a4;
- (BOOL)cancel;
- (UIViewController)presentingViewController;
- (id)_createIOSViewControllerFromRequest:(id)a3 completion:(id)a4;
- (id)present;
@end

@implementation AMSUIAlertDialogTask

- (AMSUIAlertDialogTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIAlertDialogTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)present
{
  v3 = [(AMSUIAlertDialogTask *)self request];
  v4 = [v3 logKey];
  if (v4)
  {
    id v5 = (id)AMSSetLogKey();
  }
  else
  {
    v6 = AMSLogKey();
    id v7 = (id)AMSSetLogKey();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__AMSUIAlertDialogTask_present__block_invoke;
  v10[3] = &unk_2643E3258;
  v10[4] = self;
  id v8 = [(AMSTask *)self performTaskWithPromiseBlock:v10];
  return v8;
}

id __31__AMSUIAlertDialogTask_present__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = objc_alloc_init(MEMORY[0x263F27E10]);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__AMSUIAlertDialogTask_present__block_invoke_1;
  v4[3] = &unk_2643E3230;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = &v5;
  dispatch_async(MEMORY[0x263EF83A0], v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __31__AMSUIAlertDialogTask_present__block_invoke_1(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 request];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__AMSUIAlertDialogTask_present__block_invoke_2;
  v6[3] = &unk_2643E3208;
  v6[4] = *(void *)(a1 + 40);
  v4 = [v2 _createIOSViewControllerFromRequest:v3 completion:v6];

  uint64_t v5 = [*(id *)(a1 + 32) presentingViewController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

uint64_t __31__AMSUIAlertDialogTask_present__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithResult:a2 error:a3];
}

- (BOOL)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIAlertDialogTask;
  BOOL v3 = [(AMSTask *)&v6 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__AMSUIAlertDialogTask_cancel__block_invoke;
  block[3] = &unk_2643E3118;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  return v3;
}

void __30__AMSUIAlertDialogTask_cancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  BOOL v3 = [v2 presentedViewController];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_createIOSViewControllerFromRequest:(id)a3 completion:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v56 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v54 = [v5 style];
  objc_super v6 = (void *)MEMORY[0x263F82418];
  uint64_t v7 = [v5 title];
  id v8 = [v5 message];
  [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:v54 != 2];
  id v60 = (id)objc_claimAutoreleasedReturnValue();

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v58 = v5;
  v9 = [v5 buttonActions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v71 objects:v80 count:16];
  unint64_t v11 = 0x263F27000;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = 0;
    id v14 = 0;
    uint64_t v59 = *(void *)v72;
    id obj = v9;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v72 != v59) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v71 + 1) + 8 * v15);
        uint64_t v17 = [v16 style];
        if (v17 == 2)
        {
          uint64_t v18 = [v58 preventsCancelButtonStyle] ^ 1;
        }
        else if (v17 == 1)
        {
          uint64_t v18 = 2;
        }
        else
        {
          uint64_t v18 = 0;
        }
        v19 = [v16 title];

        if (v19)
        {
          uint64_t v20 = v13;
          v21 = (void *)MEMORY[0x263F82400];
          v22 = [v16 title];
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke;
          v66[3] = &unk_2643E3280;
          id v23 = v60;
          id v67 = v23;
          id v24 = v58;
          id v68 = v24;
          v69 = v16;
          id v70 = v56;
          v25 = [v21 actionWithTitle:v22 style:v18 handler:v66];

          if (!v14)
          {
            id v14 = [v24 preferredButtonActionIdentifier];
            if (v14)
            {
              v32 = [v16 identifier];
              v33 = [v24 preferredButtonActionIdentifier];
              int v34 = [v32 isEqualToString:v33];

              if (v34) {
                id v14 = v25;
              }
              else {
                id v14 = 0;
              }
            }
          }
          v26 = [v16 accessibilityIdentifier];

          if (v26)
          {
            v27 = [v16 accessibilityIdentifier];
            [v25 setAccessibilityIdentifier:v27];
          }
          [v23 addAction:v25];
          uint64_t v13 = v20 + 1;

          v28 = v67;
        }
        else
        {
          v28 = [MEMORY[0x263F27CB8] sharedConfig];
          if (!v28)
          {
            v28 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v29 = [v28 OSLogObject];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v77 = v30;
            id v31 = v30;
            _os_log_impl(&dword_21C134000, v29, OS_LOG_TYPE_ERROR, "%{public}@: No action title is provided. A UIAlertAction requires a title.", buf, 0xCu);
          }
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v35 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
      uint64_t v12 = v35;
    }
    while (v35);

    if (v14)
    {
      [v60 setPreferredAction:v14];
      unint64_t v11 = 0x263F27000;
      if (v13) {
        goto LABEL_45;
      }
      goto LABEL_40;
    }
    uint64_t v36 = v13;
    unint64_t v11 = 0x263F27000uLL;
  }
  else
  {

    uint64_t v36 = 0;
  }
  v37 = [v58 preferredButtonActionIdentifier];

  if (v37)
  {
    v38 = [*(id *)(v11 + 3256) sharedConfig];
    if (!v38)
    {
      v38 = [*(id *)(v11 + 3256) sharedConfig];
    }
    v39 = [v38 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = objc_opt_class();
      id v41 = v40;
      v42 = [v58 preferredButtonActionIdentifier];
      *(_DWORD *)buf = 138543618;
      v77 = v40;
      __int16 v78 = 2114;
      v79 = v42;
      _os_log_impl(&dword_21C134000, v39, OS_LOG_TYPE_DEBUG, "%{public}@: preferredButtonActionIdentifier provided but no action has such identifier (preferredButtonActionIdentifier: %{public}@)", buf, 0x16u);
    }
  }
  id v14 = 0;
  if (!v36)
  {
LABEL_40:
    v43 = [*(id *)(v11 + 3256) sharedConfig];
    if (!v43)
    {
      v43 = [*(id *)(v11 + 3256) sharedConfig];
    }
    v44 = [v43 OSLogObject];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v77 = v45;
      id v46 = v45;
      _os_log_impl(&dword_21C134000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Presented Alert with no actions", buf, 0xCu);
    }
  }
LABEL_45:
  if (v54 != 2)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v47 = [v58 textFields];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke_13;
          v61[3] = &unk_2643E32A8;
          v61[4] = self;
          v61[5] = v52;
          [v60 addTextFieldWithConfigurationHandler:v61];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v49);
    }
  }
  return v60;
}

void __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke(uint64_t a1)
{
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v2 = [*(id *)(a1 + 32) textFields];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [*(id *)(a1 + 32) textFields];
      objc_super v6 = [v5 objectAtIndexedSubscript:v4];

      uint64_t v7 = [*(id *)(a1 + 40) textFields];
      unint64_t v8 = [v7 count];

      if (v4 < v8)
      {
        uint64_t v9 = [v6 text];
        uint64_t v10 = (void *)v9;
        if (v9) {
          unint64_t v11 = (__CFString *)v9;
        }
        else {
          unint64_t v11 = &stru_26CC491D8;
        }
        [v18 addObject:v11];
      }
      ++v4;
      uint64_t v12 = [*(id *)(a1 + 32) textFields];
      unint64_t v13 = [v12 count];
    }
    while (v4 < v13);
  }
  id v14 = objc_alloc(MEMORY[0x263F27C18]);
  uint64_t v15 = *(void *)(a1 + 40);
  v16 = [*(id *)(a1 + 48) identifier];
  uint64_t v17 = (void *)[v14 initWithOriginalRequest:v15 selectedActionIdentifier:v16];

  [v17 setTextfieldValues:v18];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setKeyboardType:", objc_msgSend((id)objc_opt_class(), "_keyboardTypeFromType:", objc_msgSend(*(id *)(a1 + 40), "keyboardType")));
  objc_msgSend(v3, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 40), "secure"));
  unint64_t v4 = [*(id *)(a1 + 40) placeholder];
  [v3 setPlaceholder:v4];

  id v5 = [*(id *)(a1 + 40) text];
  [v3 setText:v5];
}

+ (int64_t)_keyboardTypeFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_21C2CE198[a3];
  }
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end