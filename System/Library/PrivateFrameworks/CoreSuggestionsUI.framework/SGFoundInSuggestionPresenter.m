@interface SGFoundInSuggestionPresenter
- (NSArray)realtimeSuggestions;
- (SGFoundInSuggestionPresenter)init;
- (id)formatMixedCategoriesTitle:(id)a3;
- (void)_loadSuggestions;
- (void)_loadedRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4;
- (void)_reloadSuggestionsForNotification:(id)a3;
- (void)_setNeedsToReloadSuggestionsAfter:(double)a3;
- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 mailService:(id)a5 messageService:(id)a6 options:(unint64_t)a7 filter:(id)a8;
- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 options:(unint64_t)a5 filter:(id)a6;
- (void)addSuggestionsFromSearchableItems:(id)a3 options:(unint64_t)a4 filter:(id)a5;
- (void)dealloc;
- (void)reloadSuggestionsFromSearchableItems;
- (void)setMailService:(id)a3 messageService:(id)a4;
- (void)setRealtimeSuggestions:(id)a3;
- (void)setRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4;
@end

@implementation SGFoundInSuggestionPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_contactStoreObserverToken, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong(&self->_filterBlock, 0);
}

- (id)formatMixedCategoriesTitle:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1BA9A7A20]();
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
  v6 = [v5 localizedStringForKey:@"SuggestionsBannerMultipleSuggestionsTitleFormat" value:&stru_1F0ED27A8 table:0];

  return v6;
}

- (void)_loadedRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke;
  block[3] = &unk_1E612E610;
  block[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[18];
  if (v3)
  {
    if ([v3 count])
    {
      unint64_t v4 = 0;
      do
      {
        v5 = [*(id *)(*(void *)(a1 + 32) + 144) objectAtIndex:v4];
        if ([v5 conformsToProtocol:&unk_1F0ED9CE8]) {
          [*(id *)(a1 + 32) addSuggestion:v5];
        }

        ++v4;
      }
      while ([*(id *)(*(void *)(a1 + 32) + 144) count] > v4);
    }
  }
  else
  {
    uint64_t v6 = v2[13];
    if (v6)
    {
      id v7 = (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 40));
      [v2 setRealtimeSuggestions:v7 fromHostApp:*(void *)(a1 + 48)];
    }
    else
    {
      [v2 setRealtimeSuggestions:*(void *)(a1 + 40) fromHostApp:*(void *)(a1 + 48)];
    }
    if (*(void *)(a1 + 40))
    {
      id location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      if (!*(void *)(*(void *)(a1 + 32) + 128))
      {
        v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v9 = *MEMORY[0x1E4F1AF80];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke_2;
        v13[3] = &unk_1E612E700;
        objc_copyWeak(&v14, &location);
        uint64_t v10 = [v8 addObserverForName:v9 object:0 queue:0 usingBlock:v13];
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = *(void **)(v11 + 128);
        *(void *)(v11 + 128) = v10;

        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
  }
}

void __71__SGFoundInSuggestionPresenter__loadedRealtimeSuggestions_fromHostApp___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setNeedsToReloadSuggestionsAfter:1.0];
}

- (void)_loadSuggestions
{
  self->_loadScheduled = 0;
  id v3 = [(NSArray *)self->_searchableItems firstObject];
  unint64_t v4 = [v3 attributeSet];
  v5 = [v4 emailHeaders];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    lock = self->_lock;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke;
    v19[3] = &unk_1E612E688;
    v19[4] = &v20;
    [(_PASLock *)lock runWithLockAcquired:v19];
    v8 = (void *)v21[5];
    unint64_t v9 = self->_contentOptions | 3;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2;
    v18[3] = &unk_1E612E6B0;
    v18[4] = self;
    [v8 suggestionsFromSearchableItem:v3 options:v9 processingType:0 withCompletion:v18];
  }
  else
  {
    uint64_t v10 = [v3 bundleID];
    uint64_t v11 = [@"com.apple.MobileSMS" caseInsensitiveCompare:v10];

    if (v11)
    {
      [(SGFoundInSuggestionPresenter *)self _loadedRealtimeSuggestions:0 fromHostApp:2];
      goto LABEL_6;
    }
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    v12 = self->_lock;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_35;
    v17[3] = &unk_1E612E688;
    v17[4] = &v20;
    [(_PASLock *)v12 runWithLockAcquired:v17];
    v13 = (void *)v21[5];
    searchableItems = self->_searchableItems;
    unint64_t v15 = self->_contentOptions | 3;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2_36;
    v16[3] = &unk_1E612E6D8;
    v16[4] = self;
    [v13 harvestedSuggestionsFromMessages:searchableItems options:v15 completionHandler:v16];
  }
  _Block_object_dispose(&v20, 8);

LABEL_6:
}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6[1]);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4F5DB70] serviceForMail];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong(v6 + 1, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134349056;
    uint64_t v6 = [v3 count];
    _os_log_impl(&dword_1B5B6C000, v4, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Found %{public}lu suggestion(s)", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _loadedRealtimeSuggestions:v3 fromHostApp:0];
}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6[2]);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4F5DB70] serviceForMessages];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong(v6 + 2, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

void __48__SGFoundInSuggestionPresenter__loadSuggestions__block_invoke_2_36(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134349568;
    uint64_t v14 = [v9 count];
    __int16 v15 = 2050;
    uint64_t v16 = [v8 count];
    __int16 v17 = 2050;
    uint64_t v18 = [v10 count];
    _os_log_impl(&dword_1B5B6C000, v12, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Post Harvest, found %{public}lu events, %{public}lu contacts and %{public}lu reminders", (uint8_t *)&v13, 0x20u);
  }

  if ([v8 count]) {
    [v11 addObjectsFromArray:v8];
  }
  if ([v9 count]) {
    [v11 addObjectsFromArray:v9];
  }
  if ([v10 count]) {
    [v11 addObjectsFromArray:v10];
  }
  [*(id *)(a1 + 32) _loadedRealtimeSuggestions:v11 fromHostApp:1];
}

- (void)_setNeedsToReloadSuggestionsAfter:(double)a3
{
  int v5 = serialQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke;
  v6[3] = &unk_1E612E660;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v2 == 0.0)
  {
    [v3 _loadSuggestions];
  }
  else if (!v3[136])
  {
    v3[136] = 1;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    int v5 = serialQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke_2;
    block[3] = &unk_1E612E7E8;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v4, v5, block);
  }
}

unsigned char *__66__SGFoundInSuggestionPresenter__setNeedsToReloadSuggestionsAfter___block_invoke_2(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[136]) {
    return (unsigned char *)[result _loadSuggestions];
  }
  return result;
}

- (void)reloadSuggestionsFromSearchableItems
{
}

- (void)_reloadSuggestionsForNotification:(id)a3
{
}

- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 mailService:(id)a5 messageService:(id)a6 options:(unint64_t)a7 filter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 count])
  {
    [(SGFoundInSuggestionPresenter *)self setMailService:v16 messageService:v17];
    uint64_t v19 = serialQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __128__SGFoundInSuggestionPresenter_addSuggestionsFromSearchableItems_existingSuggestions_mailService_messageService_options_filter___block_invoke;
    block[3] = &unk_1E612E638;
    block[4] = self;
    id v21 = v14;
    unint64_t v24 = a7;
    id v23 = v18;
    id v22 = v15;
    dispatch_async(v19, block);
  }
}

uint64_t __128__SGFoundInSuggestionPresenter_addSuggestionsFromSearchableItems_existingSuggestions_mailService_messageService_options_filter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_time_t v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  *(void *)(*(void *)(a1 + 32) + 120) = *(void *)(a1 + 64);
  int v5 = _Block_copy(*(const void **)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  id v8 = *(void **)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 144);
    *(void *)(v10 + 144) = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v12 + 144);
    *(void *)(v12 + 144) = 0;
  }

  int v13 = *(void **)(a1 + 32);
  return [v13 _loadSuggestions];
}

- (void)addSuggestionsFromSearchableItems:(id)a3 existingSuggestions:(id)a4 options:(unint64_t)a5 filter:(id)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v12 count]) {
    [(SGFoundInSuggestionPresenter *)self addSuggestionsFromSearchableItems:v12 existingSuggestions:v10 mailService:0 messageService:0 options:a5 filter:v11];
  }
}

- (void)addSuggestionsFromSearchableItems:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if ([v9 count]) {
    [(SGFoundInSuggestionPresenter *)self addSuggestionsFromSearchableItems:v9 existingSuggestions:0 mailService:0 messageService:0 options:a4 filter:v8];
  }
}

- (NSArray)realtimeSuggestions
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__SGFoundInSuggestionPresenter_realtimeSuggestions__block_invoke;
  id v10 = &unk_1E612E798;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  runOnMainThreadSync(&v7);
  int v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10, v11);

  return (NSArray *)v5;
}

void __51__SGFoundInSuggestionPresenter_realtimeSuggestions__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "suggestions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = getRealtimeSuggestion(*(void **)(*((void *)&v8 + 1) + 8 * v6));
        if (v7) {
          [*(id *)(a1 + 40) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setRealtimeSuggestions:(id)a3 fromHostApp:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke;
  v8[3] = &unk_1E612E610;
  id v9 = v6;
  int64_t v10 = a4;
  v8[4] = self;
  id v7 = v6;
  runOnMainThread(v8);
}

void __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) suggestionStore];
  [v2 setHostApp:*(void *)(a1 + 48)];

  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = [*(id *)(a1 + 32) realtimeSuggestions];
  id v6 = (void *)[v4 initWithArray:v5];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([v6 containsObject:v12]) {
          [v6 removeObject:v12];
        }
        else {
          [v3 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v3 count];
  unint64_t v14 = [v6 count] + v13;
  if (v14 >= 2)
  {
    id v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B5B6C000, v15, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Lock notifications for batch update.", buf, 2u);
    }

    id v16 = [*(id *)(a1 + 32) suggestionStore];
    [v16 lockNotifications];
  }
  if ([v6 count])
  {
    id v17 = [*(id *)(a1 + 32) suggestions];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          id v23 = getRealtimeSuggestion(v22);
          if (v23 && [v6 containsObject:v23]) {
            [*(id *)(a1 + 32) removeSuggestion:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v19);
    }
  }
  if ([v3 count])
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke_17;
    v26[3] = &unk_1E612E5E8;
    v26[4] = *(void *)(a1 + 32);
    [v3 enumerateObjectsUsingBlock:v26];
  }
  if (v14 >= 2)
  {
    unint64_t v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B5B6C000, v24, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Unlock notifications for batch update.", buf, 2u);
    }

    id v25 = [*(id *)(a1 + 32) suggestionStore];
    [v25 unlockNotifications];
  }
}

void __67__SGFoundInSuggestionPresenter_setRealtimeSuggestions_fromHostApp___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v3;
    uint64_t v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SGWalletOrderSuggestion *)v4 event];
      id v7 = [v6 loggingIdentifier];
      int v24 = 138543362;
      id v25 = v7;
      _os_log_impl(&dword_1B5B6C000, v5, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeEvent %{public}@ to UI", (uint8_t *)&v24, 0xCu);
    }
    if ([(SGWalletOrderSuggestion *)v4 state] == 6
      && os_variant_has_internal_diagnostics())
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [SGRadarSuggestion alloc];
      uint64_t v10 = [(SGWalletOrderSuggestion *)v4 sourceMessageId];
      long long v11 = [(SGRadarSuggestionBase *)v9 initWithSourceMessageId:v10];
      [v8 addSuggestion:v11];
    }
    else
    {
      id v15 = *(void **)(a1 + 32);
      uint64_t v10 = [(SGEventSuggestionBase *)[SGEventSuggestion alloc] initWithRealtimeEvent:v4];
      [v15 addSuggestion:v10];
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B5B6C000, v12, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeContact to UI", (uint8_t *)&v24, 2u);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    unint64_t v14 = [[_TtC17CoreSuggestionsUI19SGContactSuggestion alloc] initWithSgContact:v3];
LABEL_11:
    id v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v14;
LABEL_12:
    [v13 addSuggestion:v4];
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion *)v3;
    id v16 = sgRemindersLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(SGWalletOrderSuggestion *)v4 reminder];
      uint64_t v18 = [v17 loggingIdentifier];
      int v24 = 138543362;
      id v25 = v18;
      _os_log_impl(&dword_1B5B6C000, v16, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeReminder %{public}@ to UI", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = [[_TtC17CoreSuggestionsUI20SGReminderSuggestion alloc] initWithRealtimeReminder:v4];
    [v19 addSuggestion:v20];

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v3;
    id v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B5B6C000, v22, OS_LOG_TYPE_DEFAULT, "SGFoundInSuggestionPresenter - Adding RealtimeWalletOrder to UI", (uint8_t *)&v24, 2u);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    id v4 = [[_TtC17CoreSuggestionsUI23SGWalletOrderSuggestion alloc] initWithRealtimeWalletOrder:v21];

    goto LABEL_12;
  }
  if (+[SGBannerUtility supportsWalletPassFeature])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_debug_impl(&dword_1B5B6C000, v23, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - Adding RealtimeWalletPass to UI", (uint8_t *)&v24, 2u);
      }

      uint64_t v13 = *(void **)(a1 + 32);
      unint64_t v14 = [[_TtC17CoreSuggestionsUI22SGWalletPassSuggestion alloc] initWithRealtimeWalletPass:v3];
      goto LABEL_11;
    }
  }
LABEL_20:
}

- (void)setRealtimeSuggestions:(id)a3
{
}

- (void)setMailService:(id)a3 messageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    lock = self->_lock;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke;
    v15[3] = &unk_1E612E5C0;
    id v16 = v6;
    [(_PASLock *)lock runWithLockAcquired:v15];
    uint64_t v10 = v16;
  }
  else if (v7)
  {
    long long v11 = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke_2;
    v13[3] = &unk_1E612E5C0;
    unint64_t v14 = v7;
    [(_PASLock *)v11 runWithLockAcquired:v13];
    uint64_t v10 = v14;
  }
  else
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl(&dword_1B5B6C000, v10, OS_LOG_TYPE_DEBUG, "SGFoundInSuggestionPresenter - No Mail/Message service specified. Will retrieve service", v12, 2u);
    }
  }
}

void __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __62__SGFoundInSuggestionPresenter_setMailService_messageService___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)dealloc
{
  if (self->_contactStoreObserverToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_contactStoreObserverToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)SGFoundInSuggestionPresenter;
  [(SGSuggestionPresenter *)&v4 dealloc];
}

- (SGFoundInSuggestionPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)SGFoundInSuggestionPresenter;
  uint64_t v2 = [(SGSuggestionPresenter *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_contentOptions = 0;
    v2->_loadScheduled = 0;
    objc_super v4 = objc_opt_new();
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v4];
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v5;

    id v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v3 selector:sel__reloadSuggestionsForNotification_ name:@"com.apple.coresuggestions.SGDissectOrderSuggestion" object:0];
  }
  return v3;
}

@end