@interface HFAppleMusicAccountOperations
+ (id)_completeLoginForAccessory:(id)a3 results:(id)a4 error:(id)a5;
+ (id)_validateRemoteLoginHandlerForAccessory:(id)a3;
+ (id)executeCompanionLoginForAccessory:(id)a3 account:(id)a4;
+ (id)executeProxyLoginForAccessory:(id)a3 context:(id)a4;
+ (id)logoutAccessories:(id)a3;
@end

@implementation HFAppleMusicAccountOperations

+ (id)executeCompanionLoginForAccessory:(id)a3 account:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 30, @"Invalid parameter not satisfying: %@", @"accessory" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 31, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

LABEL_3:
  v10 = +[HFMediaDispatcher sharedDispatcher];
  v11 = [v10 appleMusicAccountStore];

  v12 = [v11 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF00]];
  v13 = [v11 accountsWithAccountType:v12];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke;
  v28[3] = &unk_26409B018;
  id v14 = v9;
  id v29 = v14;
  v15 = objc_msgSend(v13, "na_firstObjectPassingTest:", v28);

  v16 = (void *)MEMORY[0x263F58190];
  if (v15)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_2;
    v24[3] = &unk_264094BE8;
    id v27 = a1;
    id v25 = v7;
    id v26 = v15;
    v17 = [v16 lazyFutureWithBlock:v24];

    v18 = v25;
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    v30 = @"accessory";
    v31[0] = v7;
    v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v20 = objc_msgSend(v19, "hf_errorWithCode:operation:options:", 10, @"AppleMusicProxyLogin", v18);
    v17 = [v16 futureWithError:v20];
  }
  return v17;
}

uint64_t __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = objc_msgSend(v2, "aa_altDSID");
  v5 = objc_msgSend(v3, "aa_altDSID");

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

void __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 48) _validateRemoteLoginHandlerForAccessory:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_3;
  v7[3] = &unk_26409B040;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addSuccessBlock:v7];
}

void __75__HFAppleMusicAccountOperations_executeCompanionLoginForAccessory_account___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 companionLoginWithAccount:v2 completion:v5];
}

+ (id)executeProxyLoginForAccessory:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 60, @"Invalid parameter not satisfying: %@", @"accessory" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 61, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_3:
  v10 = (void *)MEMORY[0x263F58190];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke;
  v17[3] = &unk_264094BE8;
  id v19 = v9;
  id v20 = a1;
  id v18 = v7;
  id v11 = v9;
  id v12 = v7;
  v13 = [v10 lazyFutureWithBlock:v17];

  return v13;
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[6] _validateRemoteLoginHandlerForAccessory:a1[4]];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_2;
  v9[3] = &unk_26409B090;
  id v10 = a1[5];
  id v5 = a1[4];
  id v6 = a1[6];
  id v12 = v3;
  id v13 = v6;
  id v11 = v5;
  id v7 = v3;
  id v8 = (id)[v4 addSuccessBlock:v9];
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Calling [AKAppleIDAuthenticationController authenticateWithContext:completion:]", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_24;
  v7[3] = &unk_264098928;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  [v2 authenticateWithContext:v4 completion:v7];
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController returned with results %@ - error = %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_25;
  block[3] = &unk_26409B068;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v16 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_25(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Now completing Login for Accessory %@ ", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 64) _completeLoginForAccessory:*(void *)(a1 + 32) results:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_26;
  v6[3] = &unk_264091218;
  id v7 = *(id *)(a1 + 56);
  id v5 = (id)[v4 addCompletionBlock:v6];
}

void __71__HFAppleMusicAccountOperations_executeProxyLoginForAccessory_context___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "_completeLoginForAccessory returned with result [%@] Error - [%@] ", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishWithResult:v5 error:v6];
}

+ (id)logoutAccessories:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 95, @"Invalid parameter not satisfying: %@", @"accessories.count >= 1" object file lineNumber description];
  }
  id v6 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v41 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
      id v13 = [v12 remoteLoginHandler];
      id v14 = v13;
      if (!v13) {
        break;
      }
      if (([v13 isControllable] & 1) == 0)
      {
        v24 = (void *)MEMORY[0x263F58190];
        id v29 = (void *)MEMORY[0x263F087E8];
        v45[0] = @"accessories";
        v45[1] = @"failedAccessory";
        v46[0] = v7;
        v46[1] = v12;
        id v26 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
        id v27 = v29;
        uint64_t v28 = 12;
        goto LABEL_22;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    v24 = (void *)MEMORY[0x263F58190];
    id v25 = (void *)MEMORY[0x263F087E8];
    v47[0] = @"accessories";
    v47[1] = @"failedAccessory";
    v48[0] = v7;
    v48[1] = v12;
    id v26 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    id v27 = v25;
    uint64_t v28 = 11;
LABEL_22:
    v30 = objc_msgSend(v27, "hf_errorWithCode:operation:options:", v28, @"AppleMusicLogout", v26);
    v23 = [v24 futureWithError:v30];

    goto LABEL_23;
  }
LABEL_12:

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(obj);
        }
        __int16 v19 = [*(id *)(*((void *)&v36 + 1) + 8 * i) remoteLoginHandler];
        id v20 = (void *)MEMORY[0x263F58190];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke;
        v34[3] = &unk_26408E4E0;
        id v35 = v19;
        id v21 = v19;
        v22 = [v20 lazyFutureWithBlock:v34];
        [v6 addObject:v22];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v16);
  }

  v23 = [MEMORY[0x263F58190] chainFutures:v6];
LABEL_23:

  return v23;
}

void __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_2;
  v6[3] = &unk_26408CDF0;
  id v7 = v3;
  id v5 = v3;
  [v4 signout:v6];
}

void __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_3;
  v5[3] = &unk_26408D450;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __51__HFAppleMusicAccountOperations_logoutAccessories___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "finishWithError:");
  }
  else {
    return [v1 finishWithNoResult];
  }
}

+ (id)_completeLoginForAccessory:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = HFLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Returning from _completeLoginForAccessory due to error  = [%@]", buf, 0xCu);
    }

    uint64_t v11 = [MEMORY[0x263F58190] futureWithError:v9];
    goto LABEL_5;
  }
  uint64_t v13 = [v8 count];
  id v14 = (void *)MEMORY[0x263F58190];
  if (!v13)
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_5:
    uint64_t v12 = (void *)v11;
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__HFAppleMusicAccountOperations__completeLoginForAccessory_results_error___block_invoke;
  v16[3] = &unk_26408E218;
  id v17 = v7;
  id v18 = v8;
  uint64_t v12 = [v14 futureWithErrorOnlyHandlerAdapterBlock:v16];

LABEL_8:
  return v12;
}

void __74__HFAppleMusicAccountOperations__completeLoginForAccessory_results_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Calling  proxyLoginWithAuthResults:", v6, 2u);
  }

  id v5 = [*(id *)(a1 + 32) remoteLoginHandler];
  [v5 proxyLoginWithAuthResults:*(void *)(a1 + 40) completion:v3];
}

+ (id)_validateRemoteLoginHandlerForAccessory:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 remoteLoginHandler];
  id v5 = v4;
  if (v4)
  {
    char v6 = [v4 isControllable];
    id v7 = (void *)MEMORY[0x263F58190];
    if (v6)
    {
      id v8 = [MEMORY[0x263F58190] futureWithResult:v5];
      goto LABEL_7;
    }
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = @"accessory";
    id v17 = v3;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v11 = v13;
    uint64_t v12 = 12;
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F58190];
    id v9 = (void *)MEMORY[0x263F087E8];
    id v18 = @"accessory";
    v19[0] = v3;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = v9;
    uint64_t v12 = 11;
  }
  id v14 = objc_msgSend(v11, "hf_errorWithCode:operation:options:", v12, @"AppleMusicProxyLogin", v10);
  id v8 = [v7 futureWithError:v14];

LABEL_7:
  return v8;
}

@end