@interface HFAccessorySettingSiriLanguageAdapter
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5;
- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
- (HFSiriLanguageOption)selectedLanguageOption;
- (NAFuture)languageSettingFuture;
- (NSHashTable)observers;
- (NSSet)availableLanguageOptions;
- (id)_beginMonitoringSettingsKeyPath:(id)a3;
- (id)_reloadLanguagesFromHomeKitNotifyingObservers:(BOOL)a3;
- (id)preferredOutputVoiceAccentOptionsForSelectedOption:(id)a3;
- (id)preferredOutputVoiceOptionsForSelectedOption:(id)a3;
- (id)preferredRecognitionLanguageOptionsForSelectedOption:(id)a3;
- (id)updateAvailableLanguageOptions:(id)a3;
- (id)updateSelectedLanguageOption:(id)a3;
- (void)_dumpAvailableLanguageOptionsWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAvailableLanguageOptions:(id)a3;
- (void)setSelectedLanguageOption:(id)a3;
@end

@implementation HFAccessorySettingSiriLanguageAdapter

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v8 = [v6 setWithObject:@"root.siri.language"];
  v16.receiver = self;
  v16.super_class = (Class)HFAccessorySettingSiriLanguageAdapter;
  v9 = [(HFAccessorySettingAdapter *)&v16 initWithHomeKitSettingsVendor:v7 keyPaths:v8 mode:a4 updateHandler:0];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x263EFFA08] set];
    availableLanguageOptions = v9->_availableLanguageOptions;
    v9->_availableLanguageOptions = (NSSet *)v12;

    id v14 = [(HFAccessorySettingSiriLanguageAdapter *)v9 _reloadLanguagesFromHomeKitNotifyingObservers:0];
  }

  return v9;
}

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingSiriLanguageAdapter.m", 54, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingSiriLanguageAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingSiriLanguageAdapter.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingSiriLanguageAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Siri language was updated to value [%@] - for setting [%@] - self.homeKitSettingsVendor [%@] - reloading", (uint8_t *)&v11, 0x20u);
  }
  id v10 = [(HFAccessorySettingSiriLanguageAdapter *)self _reloadLanguagesFromHomeKitNotifyingObservers:1];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self observers];
  [v5 removeObject:v4];
}

- (id)updateAvailableLanguageOptions:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(HFAccessorySettingAdapter *)self mode] == 1)
  {
    objc_initWeak(location, self);
    id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self languageSettingFuture];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke;
    v11[3] = &unk_26408F4E0;
    id v12 = v4;
    objc_copyWeak(&v13, location);
    id v6 = [v5 flatMap:v11];
    objc_destroyWeak(&v13);

    objc_destroyWeak(location);
  }
  else
  {
    id v7 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Attempted to update available languages on adapter %@ when syncing of available options is disabled!", (uint8_t *)location, 0xCu);
    }

    v8 = (void *)MEMORY[0x263F58190];
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 25, @"HFOperationUpdateHomePodAvailableLanguageOptions", 0);
    id v6 = [v8 futureWithError:v9];
  }
  return v6;
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v27 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_31);
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = [v3 items];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_13_1);
  v26 = [v4 setWithArray:v6];

  id v7 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Updating available Siri language options...", buf, 2u);
  }

  v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v26;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Old languages: %@", buf, 0xCu);
  }

  v9 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v27;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "New languages: %@", buf, 0xCu);
  }

  id v10 = +[HFSetDiff diffFromSet:v26 toSet:v27];
  int v11 = [v10 additions];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_15;
  v36[3] = &unk_26408F418;
  id v12 = v3;
  id v37 = v12;
  v25 = objc_msgSend(v11, "na_map:", v36);

  id v13 = [v10 deletions];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_20;
  v34[3] = &unk_26408F418;
  id v24 = v12;
  id v35 = v24;
  id v14 = objc_msgSend(v13, "na_map:", v34);

  __int16 v15 = [v25 allObjects];
  objc_super v16 = [v14 allObjects];
  uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v16];

  v18 = [MEMORY[0x263F58190] combineAllFutures:v17];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_27;
  v32[3] = &unk_26408F468;
  v19 = (id *)(a1 + 40);
  objc_copyWeak(&v33, v19);
  v20 = [v18 flatMap:v32];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_29;
  v30[3] = &unk_26408F490;
  objc_copyWeak(&v31, v19);
  v21 = [v20 addCompletionBlock:v30];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_34;
  v28[3] = &unk_26408F4B8;
  objc_copyWeak(&v29, v19);
  v22 = [v21 recover:v28];
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);

  return v22;
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 title];
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_16;
  v8[3] = &unk_26408F0C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 lazyFutureWithBlock:v8];

  return v6;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_16(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Adding available language: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x263F0E028]) initWithTitle:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  v8 = [v3 errorOnlyCompletionHandlerAdapter];

  [v7 addItem:v6 completionHandler:v8];
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_21;
  v8[3] = &unk_26408F0C8;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v5 = v3;
  id v6 = [v4 lazyFutureWithBlock:v8];

  return v6;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_21(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 items];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3_22;
  id v14 = &unk_26408F440;
  id v15 = *(id *)(a1 + 40);
  id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", &v11);

  if (v6)
  {
    id v7 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Removing available language: %@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 32);
    id v10 = [v4 errorOnlyCompletionHandlerAdapter];

    [v9 removeItem:v6 completionHandler:v10];
  }
  else
  {
    NSLog(&cfstr_CouldNotFindMa.isa, *(void *)(a1 + 40), v11, v12, v13, v14);
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    [v4 finishWithError:v10];
  }
}

uint64_t __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_3_22(uint64_t a1, void *a2)
{
  id v3 = [a2 title];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _reloadLanguagesFromHomeKitNotifyingObservers:0];

  return v2;
}

void __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_2_29(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to updateAvailableLanguageOptions: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dumpAvailableLanguageOptionsWithReason:@"Finished updateAvailableLanguageOptions"];
}

id __72__HFAccessorySettingSiriLanguageAdapter_updateAvailableLanguageOptions___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _reloadLanguagesFromHomeKitNotifyingObservers:0];

  return v2;
}

- (id)updateSelectedLanguageOption:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_initWeak(&location, self);
  id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self languageSettingFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke;
  v9[3] = &unk_26408F558;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  objc_copyWeak(&v12, &location);
  int v7 = [v5 flatMap:v9];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v7;
}

id __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] allSerializedRepresentations];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  id v5 = [v3 items];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_37;
  v20[3] = &unk_26408F508;
  id v6 = v4;
  id v21 = v6;
  v22 = &v23;
  [v5 enumerateObjectsUsingBlock:v20];

  if (v24[5])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v8 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [WeakRetained selectedLanguageOption];
      id v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v30 = v9;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updating selected Siri language option from: %@ to: %@", buf, 0x16u);
    }
    uint64_t v11 = [WeakRetained updateSetting:v3 value:v24[5]];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_42;
    v17[3] = &unk_26408F530;
    id v18 = a1[4];
    objc_copyWeak(&v19, a1 + 6);
    id v12 = [v11 addCompletionBlock:v17];
    objc_destroyWeak(&v19);
  }
  else
  {
    id v13 = a1[4];
    id v14 = [a1[5] availableLanguageOptions];
    NSLog(&cfstr_CouldNotFindSe.isa, v13, v14);

    id v15 = (void *)MEMORY[0x263F58190];
    id WeakRetained = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v12 = [v15 futureWithError:WeakRetained];
  }

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_37(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v11 = v7;
  uint64_t v9 = [v7 title];
  uint64_t v10 = [v8 indexOfObject:v9];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __70__HFAccessorySettingSiriLanguageAdapter_updateSelectedLanguageOption___block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x3AuLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Error updating selected language option to %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated selected language option to: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dumpAvailableLanguageOptionsWithReason:@"Finished updateSelectedLanguageOption"];
}

- (void)_dumpAvailableLanguageOptionsWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "------", buf, 2u);
  }

  id v6 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "[Dumping language options for reason: %@]", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(HFAccessorySettingSiriLanguageAdapter *)self availableLanguageOptions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        id v13 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v12;
          _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "OPTION: %@", buf, 0xCu);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v14 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEBUG, "------", buf, 2u);
  }
}

- (id)preferredRecognitionLanguageOptionsForSelectedOption:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(HFAccessorySettingSiriLanguageAdapter *)self availableLanguageOptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v12 = [v11 voiceNameWithDefaultFallback];
        id v13 = [v11 outputLanguage];
        uint64_t v14 = v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          long long v16 = [v13 stringByAppendingString:v12];
          [v5 addObject:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  long long v17 = [(HFAccessorySettingSiriLanguageAdapter *)self availableLanguageOptions];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__HFAccessorySettingSiriLanguageAdapter_preferredRecognitionLanguageOptionsForSelectedOption___block_invoke;
  v22[3] = &unk_26408F580;
  id v23 = v4;
  id v24 = v5;
  id v18 = v5;
  id v19 = v4;
  v20 = objc_msgSend(v17, "na_filter:", v22);

  return v20;
}

uint64_t __94__HFAccessorySettingSiriLanguageAdapter_preferredRecognitionLanguageOptionsForSelectedOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F28530] sharedInstance];
  id v5 = [*(id *)(a1 + 32) outputVoice];
  id v6 = [v3 recognitionLanguage];
  uint64_t v7 = [v4 voiceSimilarToVoice:v5 inSiriSessionLanguage:v6];

  uint64_t v8 = [v7 name];
  uint64_t v9 = [v7 languageCode];
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || ([v9 stringByAppendingString:v8],
        __int16 v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [*(id *)(a1 + 40) containsObject:v12],
        v12,
        !v13))
  {
    v20 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v3 recognitionLanguage];
      int v23 = 138412546;
      id v24 = v7;
      __int16 v25 = 2112;
      long long v26 = v21;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Most similar voice %@ in recognition language %@ not available. Using default", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v19 = [v3 isDefaultVoiceForRecognitionLanguage];
  }
  else
  {
    uint64_t v14 = [v3 voiceNameWithDefaultFallback];
    BOOL v15 = [v7 name];
    int v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      long long v17 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = *(void **)(a1 + 32);
        int v23 = 138412546;
        id v24 = v3;
        __int16 v25 = 2112;
        long long v26 = v18;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Option %@ most similar to current selected option %@", (uint8_t *)&v23, 0x16u);
      }

      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v19 = 0;
    }
  }

  return v19;
}

- (id)preferredOutputVoiceOptionsForSelectedOption:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self availableLanguageOptions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceOptionsForSelectedOption___block_invoke;
  v9[3] = &unk_26408F5A8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_filter:", v9);

  return v7;
}

uint64_t __86__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceOptionsForSelectedOption___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recognitionLanguage];
  id v5 = [*(id *)(a1 + 32) recognitionLanguage];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 outputLanguage];
    uint64_t v7 = [*(id *)(a1 + 32) outputLanguage];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)preferredOutputVoiceAccentOptionsForSelectedOption:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(HFAccessorySettingSiriLanguageAdapter *)self availableLanguageOptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v12 = [v11 recognitionLanguage];
        int v13 = [v4 recognitionLanguage];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          BOOL v15 = [v11 outputLanguage];
          int v16 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v15, &__block_literal_global_53);
          [v16 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  long long v17 = (void *)MEMORY[0x263EFFA08];
  id v18 = [v5 allValues];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_2;
  v23[3] = &unk_26408F610;
  id v24 = v4;
  id v19 = v4;
  v20 = objc_msgSend(v18, "na_map:", v23);
  id v21 = [v17 setWithArray:v20];

  return v21;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke()
{
  return [MEMORY[0x263EFF9C0] set];
}

id __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_3;
  v6[3] = &unk_26408F5A8;
  id v7 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  if (!v4)
  {
    id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_55_0);
    if (!v4)
    {
      id v4 = [v3 anyObject];
    }
  }

  return v4;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F28530];
  id v4 = a2;
  id v5 = [v3 sharedInstance];
  id v6 = [*(id *)(a1 + 32) outputVoice];
  id v7 = [v4 outputLanguage];
  uint64_t v8 = [v5 voiceSimilarToVoice:v6 inSiriSessionLanguage:v7];

  uint64_t v9 = [v4 voiceNameWithDefaultFallback];

  id v10 = [v8 name];
  uint64_t v11 = [v9 isEqualToString:v10];

  return v11;
}

uint64_t __92__HFAccessorySettingSiriLanguageAdapter_preferredOutputVoiceAccentOptionsForSelectedOption___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isDefaultVoiceForRecognitionLanguage];
}

- (NAFuture)languageSettingFuture
{
  v2 = [(HFAccessorySettingAdapter *)self settingWatchFutureForKeyPath:@"root.siri.language"];
  id v3 = [v2 flatMap:&__block_literal_global_59];

  return (NAFuture *)v3;
}

id __62__HFAccessorySettingSiriLanguageAdapter_languageSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x263F58190];
  uint64_t v4 = objc_opt_class();
  id v5 = v2;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  id v7 = 0;
LABEL_8:

  id v10 = [v3 futureWithResult:v7];

  return v10;
}

- (id)_reloadLanguagesFromHomeKitNotifyingObservers:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(HFAccessorySettingSiriLanguageAdapter *)self languageSettingFuture];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke;
  v8[3] = &unk_26408F680;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  id v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [v3 items];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke_2;
  v42[3] = &unk_26408F658;
  v42[4] = WeakRetained;
  id v7 = v3;
  id v43 = v7;
  v44 = &v45;
  uint64_t v8 = objc_msgSend(v6, "na_map:", v42);
  id v9 = [v5 setWithArray:v8];

  id v10 = [WeakRetained availableLanguageOptions];
  id v11 = v9;
  if (v10 == v11)
  {
    char v12 = 1;
  }
  else if (v10)
  {
    char v12 = [v10 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }

  [WeakRetained setAvailableLanguageOptions:v11];
  int v13 = [WeakRetained selectedLanguageOption];
  int v14 = (void *)v46[5];
  id v15 = v13;
  id v16 = v14;
  if (v15 == v16)
  {
    char v17 = 1;
  }
  else if (v15)
  {
    char v17 = [v15 isEqual:v16];
  }
  else
  {
    char v17 = 0;
  }

  [WeakRetained setSelectedLanguageOption:v46[5]];
  if ((v12 & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = [WeakRetained observers];
    id v19 = (void *)[v18 copy];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
    uint64_t v32 = a1;
    id v33 = v7;
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v19);
          }
          int v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v23 siriLanguageAdapter:WeakRetained availableLanguageOptionsDidChange:v11];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v20);
    }

    a1 = v32;
    id v7 = v33;
  }
  if ((v17 & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v24 = [WeakRetained observers];
    long long v25 = (void *)[v24 copy];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v25);
          }
          id v29 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v29 siriLanguageAdapter:WeakRetained selectedLanguageOptionDidChange:v46[5]];
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v26);
    }
  }
  uint64_t v30 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v32, v33);

  _Block_object_dispose(&v45, 8);
  return v30;
}

HFSiriLanguageOption *__87__HFAccessorySettingSiriLanguageAdapter__reloadLanguagesFromHomeKitNotifyingObservers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 title];
  id v5 = [[HFSiriLanguageOption alloc] initWithSerializedRepresentation:v4];
  id v6 = [*(id *)(a1 + 32) valueManager];
  id v7 = [v6 valueForSetting:*(void *)(a1 + 40)];
  int v8 = [v7 isEqual:v3];

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }

  return v5;
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  return [(HFAccessorySettingSiriLanguageAdapter *)self _reloadLanguagesFromHomeKitNotifyingObservers:1];
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 keyPath];
  int v6 = [v5 isEqualToString:@"root.siri.personalRequests"];

  if (v6)
  {
    id v7 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    char v8 = [v7 isContainedWithinItemGroup];

    if ((v8 & 1) == 0)
    {
      int v13 = [HFUserItem alloc];
      int v14 = +[HFHomeKitDispatcher sharedDispatcher];
      id v15 = [v14 home];
      uint64_t v16 = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v17 = [(id)v16 home];
      id v18 = [(id)v17 currentUser];
      id v19 = [(HFUserItem *)v13 initWithHome:v15 user:v18 nameStyle:0];

      uint64_t v20 = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v21 = [v20 home];
      LODWORD(v16) = objc_msgSend(v21, "hf_currentUserIsOwner");

      self = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v22 = [(HFAccessorySettingAdapter *)self home];
      LODWORD(v17) = objc_msgSend(v22, "hf_currentUserIsAdministrator");

      LODWORD(self) = v16 | v17 & [(HFUserItem *)v19 isIdentifyVoiceEnabled];
      goto LABEL_15;
    }
  }
  id v9 = [v4 keyPath];
  char v10 = [v9 isEqualToString:@"root.siri.identifyVoice"];

  if ((v10 & 1) == 0)
  {
    id v11 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    char v12 = [v11 isContainedWithinItemGroup];

    if (v12)
    {
      LOBYTE(self) = 0;
      goto LABEL_16;
    }
    int v23 = [v4 keyPath];
    int v24 = [v23 isEqualToString:@"root.siri.recognitionLanguage"];

    if (v24)
    {
      id v19 = [(HFAccessorySettingSiriLanguageAdapter *)self selectedLanguageOption];
      long long v25 = [(HFAccessorySettingSiriLanguageAdapter *)self preferredRecognitionLanguageOptionsForSelectedOption:v19];
      LOBYTE(self) = (unint64_t)[v25 count] > 1;
    }
    else
    {
      uint64_t v26 = [v4 keyPath];
      int v27 = [v26 isEqualToString:@"root.siri.outputVoice"];

      if (!v27) {
        goto LABEL_4;
      }
      id v19 = [(HFAccessorySettingSiriLanguageAdapter *)self selectedLanguageOption];
      long long v25 = [(HFAccessorySettingSiriLanguageAdapter *)self preferredOutputVoiceOptionsForSelectedOption:v19];
      if ((unint64_t)[v25 count] > 1)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        long long v28 = [(HFAccessorySettingSiriLanguageAdapter *)self selectedLanguageOption];
        id v29 = [(HFAccessorySettingSiriLanguageAdapter *)self preferredOutputVoiceAccentOptionsForSelectedOption:v28];
        LOBYTE(self) = (unint64_t)[v29 count] > 1;
      }
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_4:
  LOBYTE(self) = 1;
LABEL_16:

  return (char)self;
}

- (NSSet)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (void)setAvailableLanguageOptions:(id)a3
{
}

- (HFSiriLanguageOption)selectedLanguageOption
{
  return self->_selectedLanguageOption;
}

- (void)setSelectedLanguageOption:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_selectedLanguageOption, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
}

@end