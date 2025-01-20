@interface HMMediaProfile
@end

@implementation HMMediaProfile

uint64_t __67__HMMediaProfile_AbstractionAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedCharacteristics");
}

uint64_t __66__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 isReachable];
  int v4 = objc_msgSend(v2, "hf_fakeUnreachableError");

  return v3 & ~v4;
}

uint64_t __76__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isAppleMusicReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteLoginHandler];
  uint64_t v3 = [v2 isControllable];

  return v3;
}

uint64_t __83__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isAccessorySettingsReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 settings];
  uint64_t v3 = [v2 isControllable];

  return v3;
}

void __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F285E0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2;
  v6[3] = &unk_2640988D8;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  [v4 fetchSupportedMultiUserLanguageCodes:v6];
}

void __87__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0);
  long long v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v17 = 138412546;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", (uint8_t *)&v17, 0x16u);
    }
    v9 = *(void **)(a1 + 32);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(void **)(a1 + 40);
      v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v17 = 138412802;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "%@:%@ Supported voice recognition languages %@", (uint8_t *)&v17, 0x20u);
    }
    v10 = objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    char v11 = objc_msgSend(v10, "hf_supportsMultiUserLanguage:", v5);

    v12 = *(void **)(a1 + 32);
    if ((v11 & 1) == 0)
    {
      v13 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 45);
      [v12 finishWithError:v13];

      goto LABEL_10;
    }
    v9 = v12;
  }
  [v9 finishWithNoResult];
LABEL_10:
}

void __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HFAppleMusicHomeAccountManager sharedInstance];
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 home];
  id v7 = [v6 uniqueIdentifier];
  long long v8 = [v7 UUIDString];
  v9 = [v4 mediaAccountForHomeIdentifier:v8];

  if (v9)
  {
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      char v11 = v10;
    }
    else {
      char v11 = 0;
    }
    id v12 = v11;

    v13 = objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
    v14 = objc_msgSend(v13, "ams_altDSID");
    v15 = objc_msgSend(v12, "ams_altDSID");
    int v16 = [v14 isEqualToString:v15];

    int v17 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = NSStringFromSelector(*(SEL *)(a1 + 40));
      id v20 = objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
      *(_DWORD *)buf = 138413314;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 1024;
      int v37 = v16 ^ 1;
      __int16 v38 = 2112;
      id v39 = v12;
      __int16 v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are split/mismatched = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", buf, 0x30u);
    }
    if (v16)
    {
      [v3 finishWithNoResult];
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 56);
      [v3 finishWithError:v27];
    }
  }
  else
  {
    __int16 v21 = +[HFAppleMusicHomeAccountManager sharedInstance];
    id v22 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v23 = [v22 home];
    id v12 = [v21 executeHomeMediaAccountFetchForHome:v23];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke_2;
    v28[3] = &unk_264098928;
    uint64_t v31 = *(void *)(a1 + 40);
    id v24 = v3;
    uint64_t v25 = *(void *)(a1 + 32);
    id v29 = v24;
    uint64_t v30 = v25;
    id v26 = (id)[v12 addCompletionBlock:v28];
  }
}

void __106__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_homePodMediaAccountIsMismatchedWithHomeMediaAccount__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(5uLL);
  long long v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v29 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v30 = 138412546;
      uint64_t v31 = v29;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount for HomePod [%@]", (uint8_t *)&v30, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v30 = 138412802;
      uint64_t v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2112;
      *(void *)v35 = v5;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Media Account [%@]", (uint8_t *)&v30, 0x20u);
    }
    objc_opt_class();
    char v11 = +[HFHomeKitDispatcher sharedDispatcher];
    id v12 = [v11 home];
    v13 = [v12 uniqueIdentifier];
    v14 = [v13 UUIDString];
    v15 = [v5 objectForKeyedSubscript:v14];
    if (objc_opt_isKindOfClass()) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
    __int16 v19 = v18;
    int v20 = 0;
    if (v18 && v17)
    {
      __int16 v21 = objc_msgSend(v18, "ams_altDSID");
      id v22 = objc_msgSend(v17, "ams_altDSID");
      int v20 = [v21 isEqualToString:v22] ^ 1;
    }
    uint64_t v23 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = *(void **)(a1 + 40);
      uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v26 = objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
      int v30 = 138413314;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v25;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v17;
      __int16 v36 = 2112;
      int v37 = v26;
      _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are split/mismatched = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", (uint8_t *)&v30, 0x30u);
    }
    v27 = *(void **)(a1 + 32);
    if (v20)
    {
      v28 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 56);
      [v27 finishWithError:v28];
    }
    else
    {
      [v27 finishWithNoResult];
    }
  }
}

void __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HFAppleMusicHomeAccountManager sharedInstance];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_home");
  id v6 = [v5 uniqueIdentifier];
  id v7 = [v6 UUIDString];
  long long v8 = [v4 mediaAccountForHomeIdentifier:v7];

  if (v8)
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    uint64_t v11 = v10;

    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "hf_appleMusicCurrentLoggedInAccount");
    v13 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138413314;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 1024;
      BOOL v31 = (v11 | v12) == 0;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      uint64_t v35 = v12;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are not present = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", buf, 0x30u);
    }
    if (v11 | v12)
    {
      [v3 finishWithNoResult];
    }
    else
    {
      int v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 56);
      [v3 finishWithError:v16];

      uint64_t v12 = 0;
      uint64_t v11 = 0;
    }
  }
  else
  {
    id v17 = +[HFAppleMusicHomeAccountManager sharedInstance];
    uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "hf_home");
    uint64_t v11 = [v17 executeHomeMediaAccountFetchForHome:v18];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke_2;
    v22[3] = &unk_264098928;
    uint64_t v25 = *(void *)(a1 + 40);
    id v19 = v3;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v23 = (uint64_t)v19;
    uint64_t v24 = v20;
    id v21 = (id)[(id)v11 addCompletionBlock:v22];
    uint64_t v12 = v23;
  }
}

void __107__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_isEitherHomePodMediaAccountOrHomeMediaAccountPresent__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(5uLL);
  long long v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v25 = 138412546;
      id v26 = v24;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount for HomePod [%@]", (uint8_t *)&v25, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v25 = 138412802;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      *(void *)__int16 v30 = v5;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Media Account [%@]", (uint8_t *)&v25, 0x20u);
    }
    objc_opt_class();
    uint64_t v11 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v12 = [v11 home];
    v13 = [v12 uniqueIdentifier];
    uint64_t v14 = [v13 UUIDString];
    v15 = [v5 objectForKeyedSubscript:v14];
    if (objc_opt_isKindOfClass()) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    unint64_t v17 = v16;

    uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
    id v19 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void **)(a1 + 40);
      id v21 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v25 = 138413314;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v21;
      __int16 v29 = 1024;
      *(_DWORD *)__int16 v30 = (v17 | v18) == 0;
      *(_WORD *)&v30[4] = 2112;
      *(void *)&v30[6] = v17;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Accounts are not present = [%d], homeMediaAccount = [%@], HomePod Media Account = [%@] ", (uint8_t *)&v25, 0x30u);
    }
    id v22 = *(void **)(a1 + 32);
    if (v17 | v18)
    {
      [v22 finishWithNoResult];
    }
    else
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 56);
      [v22 finishWithError:v23];
    }
  }
}

void __70__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_analyticsClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "OSASyncProxyClient error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_2;
  block[3] = &unk_26408D388;
  id v4 = a1[4];
  int v5 = (void *)a1[6];
  block[4] = a1[5];
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_analyticsClient");
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_3;
  v4[3] = &unk_264091218;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 request:v3 logListWithOptions:MEMORY[0x263EFFA78] onComplete:v4];
}

uint64_t __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_4(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_5;
  block[3] = &unk_26408E550;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_5(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    char v4 = [v3 isFinished];

    if ((v4 & 1) == 0)
    {
      id v6 = objc_loadWeakRetained(v1);
      id v5 = objc_msgSend(MEMORY[0x263F087E8], "na_errorWithCode:", 1);
      [v6 finishWithError:v5];
    }
  }
}

uint64_t __79__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLogListWithTimeout___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_2;
  v7[3] = &unk_26408D478;
  char v4 = *(NSObject **)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v5;
  id v9 = *(id *)(a1 + 56);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_analyticsClient");
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_3;
  v5[3] = &unk_264091218;
  id v6 = *(id *)(a1 + 56);
  [v2 request:v3 transferLog:v4 withOptions:MEMORY[0x263EFFA78] onComplete:v5];
}

uint64_t __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_4(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_5;
  v3[3] = &unk_26408F7F8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_copyWeak(&v5, (id *)(a1 + 48));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = HFLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 40));
      id v10 = [v9 accessory];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Timed out fetching logs for accessory: %@", (uint8_t *)&v11, 0xCu);
    }
    id v5 = objc_loadWeakRetained(v2);
    char v6 = [v5 isFinished];

    if ((v6 & 1) == 0)
    {
      id v7 = objc_loadWeakRetained(v2);
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "na_errorWithCode:", 1);
      [v7 finishWithError:v8];
    }
  }
}

uint64_t __72__HMMediaProfile_HFMediaAccessoryProfileAdditions__hf_fetchLog_timeout___block_invoke_437(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end