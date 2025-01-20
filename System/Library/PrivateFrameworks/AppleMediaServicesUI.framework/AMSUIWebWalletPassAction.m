@interface AMSUIWebWalletPassAction
- (AMSUIWebWalletPassAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)attemptLynxProvisioning;
- (NSNumber)lookupFeature;
- (id)_attemptLynxProvisioning;
- (id)_lookupPassForIdentifier:(unint64_t)a3;
- (id)runAction;
- (void)setAttemptLynxProvisioning:(BOOL)a3;
- (void)setLookupFeature:(id)a3;
@end

@implementation AMSUIWebWalletPassAction

- (AMSUIWebWalletPassAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebWalletPassAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"attemptLynxProvisioning"];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 objectForKeyedSubscript:@"attemptLynxProvisioning"];
      v7->_attemptLynxProvisioning = [v9 BOOLValue];
    }
    else
    {
      v7->_attemptLynxProvisioning = 0;
    }

    v10 = [v6 objectForKeyedSubscript:@"lookupFeatureIdentifier"];
    if (v10)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = [v10 longLongValue];
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
      lookupFeature = v7->_lookupFeature;
      v7->_lookupFeature = (NSNumber *)v12;
    }
  }

  return v7;
}

- (id)runAction
{
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebWalletPassAction;
  id v3 = [(AMSUIWebAction *)&v11 runAction];
  v4 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA78]];
  if ([(AMSUIWebWalletPassAction *)self attemptLynxProvisioning])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke;
    v10[3] = &unk_2643E4F38;
    v10[4] = self;
    uint64_t v5 = [v4 thenWithBlock:v10];

    v4 = (void *)v5;
  }
  id v6 = [(AMSUIWebWalletPassAction *)self lookupFeature];

  if (v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_3;
    v9[3] = &unk_2643E4F38;
    v9[4] = self;
    uint64_t v7 = [v4 thenWithBlock:v9];

    v4 = (void *)v7;
  }
  return v4;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _attemptLynxProvisioning];
  uint64_t v5 = [v4 promiseAdapter];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_2;
  v9[3] = &unk_2643E3B40;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "ams_dictionaryByAddingEntriesFromDictionary:", &unk_26CC73AD8);
  v2 = [MEMORY[0x263F27E10] promiseWithResult:v1];

  return v2;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 lookupFeature];
  id v6 = objc_msgSend(v4, "_lookupPassForIdentifier:", objc_msgSend(v5, "unsignedLongValue"));

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_4;
  v10[3] = &unk_2643E5CE0;
  id v11 = v3;
  id v7 = v3;
  v8 = [v6 thenWithBlock:v10];

  return v8;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_4(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v20 = @"pass";
  v18[0] = @"identifier";
  id v3 = a2;
  uint64_t v4 = [v3 devicePassIdentifier];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26CC491D8;
  }
  v19[0] = v6;
  v18[1] = @"terminalIdentifier";
  uint64_t v7 = [v3 pairedTerminalIdentifier];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_26CC491D8;
  }
  v19[1] = v9;
  v18[2] = @"activationState";
  id v10 = NSNumber;
  uint64_t v11 = [v3 passActivationState];

  uint64_t v12 = [v10 numberWithInteger:v11];
  v19[2] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  v21[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  objc_super v15 = objc_msgSend(v2, "ams_dictionaryByAddingEntriesFromDictionary:", v14);

  v16 = [MEMORY[0x263F27E10] promiseWithResult:v15];

  return v16;
}

- (id)_attemptLynxProvisioning
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(AMSUIWebAction *)self context];
    uint64_t v7 = [v6 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting Lynx provisioning...", buf, 0x16u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263F27B58]);
  v9 = [getPKAccountServiceClass() sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke;
    v13[3] = &unk_2643E37F8;
    id v14 = v8;
    objc_super v15 = self;
    [v9 attemptAppleStoredValueSetupWithCompletion:v13];
    id v10 = v14;
  }
  else
  {
    id v10 = AMSError();
    [v8 finishWithError:v10];
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke_69;
  v12[3] = &unk_2643E3570;
  v12[4] = self;
  [v8 addErrorBlock:v12];

  return v8;
}

uint64_t __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 finishWithError:a2];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = [*(id *)(a1 + 40) context];
      v9 = [v8 logKey];
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning Lynx succeeded", (uint8_t *)&v10, 0x16u);
    }
    return [*(id *)(a1 + 32) finishWithSuccess];
  }
}

void __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 32) context];
    id v8 = [v7 logKey];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    __int16 v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Provisioning Lynx failed. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_lookupPassForIdentifier:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [(AMSUIWebAction *)self context];
    int v9 = [v8 logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up pass: %ld", buf, 0x20u);
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F27E10]) initWithTimeout:30.0];
  __int16 v11 = [getPKAccountServiceClass() sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke;
  v16[3] = &unk_2643E5D30;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  [v11 defaultAccountForFeature:a3 completion:v16];

  __int16 v13 = v17;
  id v14 = v12;

  return v14;
}

void __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      __int16 v11 = [*(id *)(a1 + 32) context];
      id v12 = [v11 logKey];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v30 = v6;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Pass lookup failed to locate account. %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v13 = [v8 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [*(id *)(a1 + 32) context];
      v16 = [v15 logKey];
      id v17 = [v5 accountIdentifier];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v30 = v17;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Pass lookup located the account: %@", buf, 0x20u);
    }
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    __int16 v18 = (void *)getPKPassLibraryClass_softClass_1;
    uint64_t v28 = getPKPassLibraryClass_softClass_1;
    if (!getPKPassLibraryClass_softClass_1)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPKPassLibraryClass_block_invoke_1;
      v30 = &unk_2643E33D8;
      v31 = &v25;
      __getPKPassLibraryClass_block_invoke_1((uint64_t)buf);
      __int16 v18 = (void *)v26[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v25, 8);
    __int16 v20 = [v19 sharedInstance];
    v21 = [v5 accountIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke_70;
    v23[3] = &unk_2643E5D08;
    __int16 v22 = *(void **)(a1 + 40);
    v23[4] = *(void *)(a1 + 32);
    id v24 = v22;
    [v20 paymentPassWithAssociatedAccountIdentifier:v21 completion:v23];
  }
}

void __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = [*(id *)(a1 + 32) context];
      int v9 = [v8 logKey];
      int v16 = 138543618;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      id v19 = v9;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Pass fetched successfully", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithResult:v3];
  }
  else
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v10 = [v5 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = [*(id *)(a1 + 32) context];
      __int16 v13 = [v12 logKey];
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Pass not found", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v15 = AMSError();
    [v14 finishWithError:v15];
  }
}

- (BOOL)attemptLynxProvisioning
{
  return self->_attemptLynxProvisioning;
}

- (void)setAttemptLynxProvisioning:(BOOL)a3
{
  self->_attemptLynxProvisioning = a3;
}

- (NSNumber)lookupFeature
{
  return self->_lookupFeature;
}

- (void)setLookupFeature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end