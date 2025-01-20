@interface HUServiceDetailsLockAddHomeKeyToWalletItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsLockAddHomeKeyToWalletItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([MEMORY[0x1E4F69758] isAnIPhone]
    && ([(HUServiceDetailsAbstractItem *)self sourceServiceItem],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 accessories],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8 == 1))
  {
    v9 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v10 = [v9 accessories];
    v11 = [v10 anyObject];

    v12 = objc_opt_new();
    v13 = [(HUServiceDetailsAbstractItem *)self home];
    objc_msgSend(v12, "na_safeAddObject:", v13);

    objc_msgSend(v12, "na_safeAddObject:", v11);
    v14 = (void *)[v12 copy];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E4F68908]);

    v15 = _HULocalizedStringWithDefaultValue(@"HUHomeSettingsLockAddHomeKeyToWallet", @"HUHomeSettingsLockAddHomeKeyToWallet", 1);
    objc_msgSend(v5, "na_safeSetObject:forKey:", v15, *MEMORY[0x1E4F68AB8]);

    if (objc_msgSend(v11, "hf_showAsIndividualServices")
      && ([(HUServiceDetailsAbstractItem *)self sourceServiceItem],
          v16 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v16,
          (isKindOfClass & 1) == 0))
    {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
      v30 = (void *)MEMORY[0x1E4F7A0D8];
      v31 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
      v22 = [v30 futureWithResult:v31];
    }
    else if ([v11 supportsWalletKey] {
           && ([(HUServiceDetailsAbstractItem *)self home],
    }
               v18 = objc_claimAutoreleasedReturnValue(),
               char v19 = [v18 hasOnboardedForWalletKey],
               v18,
               (v19 & 1) != 0))
    {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
      objc_initWeak((id *)location, self);
      v20 = [(HUServiceDetailsAbstractItem *)self home];
      v21 = objc_msgSend(v20, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke;
      v33[3] = &unk_1E6392548;
      v33[4] = self;
      id v34 = v5;
      objc_copyWeak(&v35, (id *)location);
      v22 = [v21 flatMap:v33];
      objc_destroyWeak(&v35);

      objc_destroyWeak((id *)location);
    }
    else
    {
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = [v11 supportsWalletKey];
        v27 = [(HUServiceDetailsAbstractItem *)self home];
        *(_DWORD *)location = 138413058;
        *(void *)&location[4] = self;
        __int16 v37 = 2080;
        v38 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]";
        __int16 v39 = 1024;
        int v40 = v26;
        __int16 v41 = 1024;
        int v42 = [v27 hasOnboardedForWalletKey];
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause accessory.supportsWalletKey=%{BOOL}d and home.hasOnboardedForWalletKey=%{BOOL}d", location, 0x22u);
      }
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
      v28 = (void *)MEMORY[0x1E4F7A0D8];
      v29 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
      v22 = [v28 futureWithResult:v29];
    }
  }
  else
  {
    objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68B10]);
    v23 = (void *)MEMORY[0x1E4F7A0D8];
    v24 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
    v22 = [v23 futureWithResult:v24];
  }

  return v22;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 canAddWalletKeyErrorCode] == 8)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 2080;
      v17 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause current device has Wallet app deleted", buf, 0x16u);
    }

    [a1[5] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    v6 = (void *)MEMORY[0x1E4F7A0D8];
    v7 = [MEMORY[0x1E4F69228] outcomeWithResults:a1[5]];
    uint64_t v8 = [v6 futureWithResult:v7];
  }
  else
  {
    v7 = [a1[4] home];
    v9 = objc_msgSend(v7, "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");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_6;
    v11[3] = &unk_1E6386CE8;
    objc_copyWeak(&v13, a1 + 6);
    id v12 = a1[5];
    uint64_t v8 = [v9 flatMap:v11];

    objc_destroyWeak(&v13);
  }

  return v8;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v6 = [v4 BOOLValue];

  v7 = [WeakRetained home];
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "hf_hasWalletKey");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_2;
    v16[3] = &unk_1E6385648;
    v10 = &v17;
    id v17 = *(id *)(a1 + 32);
    v11 = v16;
  }
  else
  {
    v9 = objc_msgSend(v7, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_8;
    v14[3] = &unk_1E6388C28;
    v10 = (id *)v15;
    v15[0] = *(id *)(a1 + 32);
    v15[1] = WeakRetained;
    v11 = v14;
  }
  id v12 = [v9 flatMap:v11];

  return v12;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 BOOLValue]) {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 136315650;
    v11 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke_2";
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = [v3 BOOLValue];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(HUServiceDetailsLockAddHomeKeyToWalletItem: %s) Results for \"Add/Show Home Key to Wallet\" button is %@ because current device is wallet key compatible and hasWalletKey = %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }

  int v6 = (void *)MEMORY[0x1E4F7A0D8];
  v7 = [MEMORY[0x1E4F69228] outcomeWithResults:*(void *)(a1 + 32)];
  uint64_t v8 = [v6 futureWithResult:v7];

  return v8;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_292);
    uint64_t v5 = [v4 count];
    int v6 = *(void **)(a1 + 32);
    v7 = [NSNumber numberWithBool:v5 == 0];
    objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68B10]);

    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(id)objc_opt_class() description];
      int v10 = (void *)v9;
      v11 = @"Showing";
      if (!v5) {
        v11 = @"Hiding";
      }
      int v18 = 138412802;
      char v19 = (const char *)v9;
      __int16 v20 = 2080;
      v21 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke_2";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@: %s) %@ \"Add/Show Home Key to Wallet\" buttonbecause iPhone is not compatible and there are no wallet key compatible paired watches that doesn't have a wallet key.", (uint8_t *)&v18, 0x20u);
    }
    __int16 v12 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v13 = [MEMORY[0x1E4F69228] outcomeWithResults:*(void *)(a1 + 32)];
    __int16 v14 = [v12 futureWithResult:v13];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68B10]);
    int v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      char v19 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "(HUServiceDetailsLockAddHomeKeyToWalletItem: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause iPhone and all paired watches are not wallet key compatible.", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F7A0D8];
    id v4 = [MEMORY[0x1E4F69228] outcomeWithResults:*(void *)(a1 + 32)];
    __int16 v14 = [v16 futureWithResult:v4];
  }

  return v14;
}

BOOL __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 walletKey];
  BOOL v3 = v2 == 0;

  return v3;
}

@end