@interface HFHomeKitSettingsValueManager
- (HFHomeKitSettingsValueManager)initWithSettings:(id)a3 homeKitObjectIdentifiers:(id)a4;
- (HMSettings)settings;
- (NSMutableDictionary)transactionStacks;
- (NSSet)homeKitObjectIdentifiers;
- (NSSet)pendingWrites;
- (id)_valueForSetting:(id)a3 logRead:(BOOL)a4;
- (id)changeValueForSetting:(id)a3 toValue:(id)a4;
- (id)changeValueForSetting:(id)a3 toValue:(id)a4 changeType:(unint64_t)a5;
- (id)valueForSetting:(id)a3;
- (id)valueForSettingAtKeyPath:(id)a3;
- (void)_clearTransaction:(id)a3;
- (void)_executeNextPendingWriteForSetting:(id)a3;
- (void)setHomeKitObjectIdentifiers:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransactionStacks:(id)a3;
@end

@implementation HFHomeKitSettingsValueManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStacks, 0);
  objc_storeStrong((id *)&self->_homeKitObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (HFHomeKitSettingsValueManager)initWithSettings:(id)a3 homeKitObjectIdentifiers:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFHomeKitSettingsValueManager.m", 127, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HFHomeKitSettingsValueManager;
  v10 = [(HFHomeKitSettingsValueManager *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_settings, a3);
    uint64_t v12 = objc_opt_new();
    transactionStacks = v11->_transactionStacks;
    v11->_transactionStacks = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_homeKitObjectIdentifiers, a4);
  }

  return v11;
}

- (id)changeValueForSetting:(id)a3 toValue:(id)a4
{
  return [(HFHomeKitSettingsValueManager *)self changeValueForSetting:a3 toValue:a4 changeType:0];
}

- (id)changeValueForSetting:(id)a3 toValue:(id)a4 changeType:(unint64_t)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v37 = a4;
  if (v8)
  {
    dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
    v36 = [(HFHomeKitSettingsValueManager *)self _valueForSetting:v8 logRead:0];
    id v9 = [[_HFHomeKitSettingsVendorSettingsWriteValueTransaction alloc] initWithSetting:v8 previousValue:v36 value:v37 changeType:a5];
    v10 = [(HFHomeKitSettingsValueManager *)self transactionStacks];
    v11 = [v8 keyPath];
    uint64_t v12 = objc_msgSend(v10, "na_objectForKey:withDefaultValue:", v11, &__block_literal_global_136);

    v13 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "--> Queueing write transaction %@", buf, 0xCu);
    }

    uint64_t v14 = [v12 count];
    if ((unint64_t)[v12 count] >= 2)
    {
      if ((unint64_t)[v12 count] >= 3) {
        NSLog(&cfstr_MoreThanOneQue.isa, v8, v12);
      }
      v15 = [v12 lastObject];
      objc_super v16 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v15;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_INFO, "--> Discarding queued write transaction %@", buf, 0xCu);
      }

      v17 = [v15 settingWriteFuture];
      [v17 cancel];

      if ([v12 containsObject:v15]) {
        NSLog(&cfstr_CancelledTrans.isa, v15);
      }
    }
    [v12 addObject:v9];
    v18 = [(HFHomeKitSettingsValueManager *)self settings];
    v19 = [MEMORY[0x263EFFA08] setWithObject:v8];
    v35 = [(HFHomeKitSettingsValueManager *)self homeKitObjectIdentifiers];
    id v20 = v18;
    id v21 = v19;
    v22 = +[HFHomeKitDispatcher sharedDispatcher];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __HFHomeKitSettingsValueManagerDispatchWillWriteValueForSettings_block_invoke;
    v47 = &unk_264097658;
    id v48 = v20;
    id v49 = v21;
    id v23 = v21;
    id v24 = v20;
    [v22 dispatchHomeKitSettingMessage:buf sender:0];

    if (v14)
    {
      v25 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v12 firstObject];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_INFO, "--> Deferring execution for write transaction %@, as there is already a transaction in-flight (%@)", buf, 0x16u);
      }
    }
    else
    {
      [(HFHomeKitSettingsValueManager *)self _executeNextPendingWriteForSetting:v8];
    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v30 = [(_HFHomeKitSettingsVendorSettingsWriteValueTransaction *)v9 settingWriteFuture];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke_128;
    v38[3] = &unk_264097608;
    objc_copyWeak(&v43, &location);
    objc_copyWeak(&v44, (id *)buf);
    id v31 = v24;
    id v39 = v31;
    id v32 = v23;
    id v40 = v32;
    id v33 = v35;
    id v41 = v33;
    id v42 = v8;
    v29 = [v30 addCompletionBlock:v38];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v27 = (void *)MEMORY[0x263F58190];
    v28 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 7);
    v29 = [v27 futureWithError:v28];
  }
  return v29;
}

id __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

void __74__HFHomeKitSettingsValueManager_changeValueForSetting_toValue_changeType___block_invoke_128(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = objc_loadWeakRetained((id *)(a1 + 72));
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v7 = [MEMORY[0x263EFF910] date];
  id v8 = [v6 transactionStartDate];
  [v7 timeIntervalSinceDate:v8];
  uint64_t v10 = v9;

  if (v4)
  {
    [v6 setError:v4];
    [WeakRetained _clearTransaction:v6];
    int v11 = objc_msgSend(v4, "na_isCancelledError");
    uint64_t v12 = HFLogForCategory(0x3AuLL);
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v32 = 138412290;
        *(void *)&v32[4] = v6;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_INFO, "--> Cancelled write transaction %@", v32, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v32 = 138412802;
        *(void *)&v32[4] = v6;
        *(_WORD *)&v32[12] = 2048;
        *(void *)&v32[14] = v10;
        *(_WORD *)&v32[22] = 2112;
        id v33 = v4;
        _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "--> FAILED write transaction %@ (Execution Time: %.3f) error: %@", v32, 0x20u);
      }

      id v24 = *(void **)(a1 + 40);
      v25 = *(void **)(a1 + 48);
      id v26 = *(id *)(a1 + 32);
      id v27 = v24;
      id v28 = v25;
      v29 = +[HFHomeKitDispatcher sharedDispatcher];
      *(void *)id v32 = MEMORY[0x263EF8330];
      *(void *)&v32[8] = 3221225472;
      *(void *)&v32[16] = __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke;
      id v33 = &unk_264097680;
      id v34 = v26;
      id v35 = 0;
      id v36 = v27;
      id v37 = v28;
      id v30 = v28;
      id v31 = v27;
      v13 = v26;
      [v29 dispatchHomeKitSettingMessage:v32 sender:0];
    }
  }
  else
  {
    uint64_t v14 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v32 = 138412546;
      *(void *)&v32[4] = v6;
      *(_WORD *)&v32[12] = 2048;
      *(void *)&v32[14] = v10;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "--> Finished write transaction for %@ (Execution Time: %.3f)", v32, 0x16u);
    }

    v15 = *(void **)(a1 + 40);
    objc_super v16 = *(void **)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    id v18 = v15;
    id v19 = v16;
    id v20 = +[HFHomeKitDispatcher sharedDispatcher];
    *(void *)id v32 = MEMORY[0x263EF8330];
    *(void *)&v32[8] = 3221225472;
    *(void *)&v32[16] = __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke;
    id v33 = &unk_264097680;
    id v34 = v17;
    id v35 = v18;
    id v36 = 0;
    id v37 = v19;
    id v21 = v19;
    id v22 = v18;
    id v23 = v17;
    [v20 dispatchHomeKitSettingMessage:v32 sender:0];

    [WeakRetained _clearTransaction:v6];
  }
  [WeakRetained _executeNextPendingWriteForSetting:*(void *)(a1 + 56)];
}

- (void)_executeNextPendingWriteForSetting:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFHomeKitSettingsValueManager *)self transactionStacks];
  id v6 = [v4 keyPath];
  v7 = [v5 objectForKeyedSubscript:v6];

  if ([v7 count])
  {
    if ([v7 count] != 1) {
      NSLog(&cfstr_MoreThanOneQue.isa, v4, v7);
    }
    id v8 = [v7 firstObject];
    if (([v8 hasStarted] & 1) == 0)
    {
      uint64_t v9 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "--> Executing pending write transaction %@", buf, 0xCu);
      }

      [v8 setStarted:1];
      objc_opt_class();
      id v10 = v4;
      if (objc_opt_isKindOfClass()) {
        int v11 = v10;
      }
      else {
        int v11 = 0;
      }
      id v12 = v11;

      if (v12 && [v8 changeType] == 1)
      {
        v13 = [v12 value];
        uint64_t v14 = [v8 value];
        v15 = [v8 settingWriteFuture];
        objc_super v16 = [v15 errorOnlyCompletionHandlerAdapter];
        [v12 replaceItems:v13 withItems:v14 completionHandler:v16];
      }
      else
      {
        v13 = [v8 value];
        uint64_t v14 = [v8 settingWriteFuture];
        v15 = [v14 errorOnlyCompletionHandlerAdapter];
        [v10 updateValue:v13 completionHandler:v15];
      }
    }
  }
}

- (id)valueForSetting:(id)a3
{
  id v4 = a3;
  v5 = [(HFHomeKitSettingsValueManager *)self _valueForSetting:v4 logRead:+[HFUtilities hasInternalDiagnostics]];

  return v5;
}

- (id)_valueForSetting:(id)a3 logRead:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [v7 keyPath];
  uint64_t v9 = [(HFHomeKitSettingsValueManager *)self transactionStacks];
  id v10 = [v9 objectForKey:v8];

  int v11 = [v10 lastObject];
  id v12 = v11;
  if (v11)
  {
    v13 = [v11 value];
    uint64_t v14 = @"Transaction";
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    v13 = [v7 value];
    uint64_t v14 = @"Settings";
    if (!v4) {
      goto LABEL_8;
    }
  }
  v15 = objc_msgSend(MEMORY[0x263F0E720], "hf_debugDescriptionForValue:keyPath:", v13, v8);
  objc_super v16 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v18 = NSStringFromSelector(a2);
    int v19 = 138413058;
    id v20 = v18;
    __int16 v21 = 2112;
    id v22 = v14;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_debug_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEBUG, "--> (%@) Reading %@ Value for %@ (%@)", (uint8_t *)&v19, 0x2Au);
  }
LABEL_8:

  return v13;
}

- (id)valueForSettingAtKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(HFHomeKitSettingsValueManager *)self settings];
  id v6 = objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", v4);

  if (v6)
  {
    id v7 = [(HFHomeKitSettingsValueManager *)self valueForSetting:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSSet)pendingWrites
{
  v3 = objc_opt_new();
  id v4 = [(HFHomeKitSettingsValueManager *)self transactionStacks];
  v5 = [v4 allValues];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__HFHomeKitSettingsValueManager_pendingWrites__block_invoke;
  v8[3] = &unk_264097630;
  id v6 = v3;
  id v9 = v6;
  objc_msgSend(v5, "na_each:", v8);

  return (NSSet *)v6;
}

void __46__HFHomeKitSettingsValueManager_pendingWrites__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 lastObject];
  v3 = [v4 setting];
  objc_msgSend(v2, "na_safeAddObject:", v3);
}

- (void)_clearTransaction:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HFHomeKitSettingsValueManager *)self transactionStacks];
    id v6 = [v4 setting];
    id v7 = [v6 keyPath];

    id v8 = [v5 objectForKey:v7];
    id v9 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_INFO, "--> Clearing transaction %@", buf, 0xCu);
    }

    if (([v8 containsObject:v4] & 1) == 0) {
      NSLog(&cfstr_TriedToClearTr.isa, v4);
    }
    [v8 removeObject:v4];
    id v10 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_INFO, "--> Cleared transaction %@", buf, 0xCu);
    }

    if (![v8 count])
    {
      int v11 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_INFO, "--> Tearing down transactionStack for setting key path '%@'", buf, 0xCu);
      }

      [v5 removeObjectForKey:v7];
    }
  }
}

- (HMSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSSet)homeKitObjectIdentifiers
{
  return self->_homeKitObjectIdentifiers;
}

- (void)setHomeKitObjectIdentifiers:(id)a3
{
}

- (NSMutableDictionary)transactionStacks
{
  return self->_transactionStacks;
}

- (void)setTransactionStacks:(id)a3
{
}

@end